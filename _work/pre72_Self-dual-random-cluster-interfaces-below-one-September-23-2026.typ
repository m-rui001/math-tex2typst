#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 76.5pt, y: 76.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Self-dual random-cluster interfaces below one]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Rohde and Schramm formulated a square-lattice random-cluster interface conjecture at the self-dual parameter for every fixed $0 < q < 4$ #cite(label("RohdeSchramm2005")) Conjecture 9.7 and the following discussion. They motivated the proposed relation between $q$ and the SLE parameter using the dimensions of cluster perimeters predicted by Saleur and Duplantier #cite(label("SaleurDuplantier1987")). Schramm later restated the problem in his collection of questions about conformally invariant scaling limits #cite(label("Schramm2006")) Problem 2.6. We prove the predicted limit for every fixed $0 < q < 1$ in smooth Jordan domains, with the finite wired/free law, lattice approximation, and curve topology specified below. This gives the smooth-domain formulation of the prediction; the concrete unit-square formulation of Rohde and Schramm has a different boundary regularity. The argument starts from the finite law at the self-dual parameter and does not require prior identification of an infinite-volume critical point.

=== 1.1 The finite law and the main theorem <the-finite-law-and-the-main-theorem>

Fix $q in \( 0 \, 1 \)$ and set

#[#set math.equation(numbering: n => "(1.1)")
 $ d = sqrt(q) = 2 cos lambda \, #h(2em) p = frac(d, 1 + d) \, #h(2em) rho = lambda / pi \, #h(2em) kappa = frac(4, 1 - rho) . $ <eq:parameters>]

Thus $pi \/ 3 < lambda < pi \/ 2$, $1 \/ 3 < rho < 1 \/ 2$, and $6 < kappa < 8$. Let $D$ be a bounded Jordan domain with smooth simple boundary, and let $a \, b$ be distinct points on its boundary. For each mesh $delta$, let $D_delta$ be the bounded interior of a simple closed nearest-neighbor polygon in $delta bb(Z)^2$, and let $a_delta \, b_delta$ be distinct vertices of that polygon. Let $G_delta = \( V_delta \, E_delta \)$ be the graph with vertex set $V_delta = delta bb(Z)^2 ∩ overline(D_delta)$ and edge set $E_delta$ consisting of all closed nearest-neighbor segments contained in $overline(D_delta)$; write $E = E_delta$. Choose counterclockwise continuous parametrizations $beta_delta : \[ 0 \, 1 \] arrow.r partial D_delta$ and $beta : \[ 0 \, 1 \] arrow.r partial D$ that trace their boundaries once, satisfy $beta_delta \( 0 \) = beta_delta \( 1 \)$ and $beta \( 0 \) = beta \( 1 \)$, and are injective on $\[ 0 \, 1 \)$. Require $beta_delta arrow.r beta$ uniformly. The cyclic parameters of $a_delta \, b_delta$ converge to the distinct cyclic parameters of $a \, b$. This initial approximation class excludes slit or pinched polygon boundaries and marks in the interiors of lattice edges.

Choose one of the two closed boundary arcs from $a_delta$ to $b_delta$ as wired, including both endpoints. Identify all its vertices in the component count and leave every other boundary vertex singleton. For $A subset.eq E$, write $k_xi \( A \)$ for the number of components after that identification, including isolated vertices. The random-cluster law is

#[#set math.equation(numbering: n => "(1.2)")
 $ bb(P)_(G_delta)^xi \( A \) = frac(p^(\| A \|) \( 1 - p \)^(\| E \| - \| A \|) q^(k_xi \( A \)), sum_(B subset.eq E) p^(\| B \|) \( 1 - p \)^(\| E \| - \| B \|) q^(k_xi \( B \))) . $ <eq:finite-target-law>]

For the interface drawing, declare exactly the boundary edges of the wired arc open. An open primal edge pairs adjacent medial half-edges around its dual faces, and a closed primal edge pairs them around its primal endpoints. The boundary turns between the primal wired arc and complementary dual wired arc leave one distinguished strand. Denote by $eta_delta$ this strand oriented from the medial endpoint associated with $a_delta$ to the endpoint associated with $b_delta$. These endpoints are at distance $O \( delta \)$ from the marked vertices. The local drawing convention, the rounded endpoints used in the conformal normalization, and the vanishing curve-metric effect are justified in Section 10.

For continuous oriented curves $alpha \, beta : \[ 0 \, 1 \] arrow.r bb(C)$, put

#[#set math.equation(numbering: n => "(1.3)")
 $ d_(upright("curv")) \( alpha \, beta \) = inf_(phi.alt \, psi) sup_(t in \[ 0 \, 1 \]) \| alpha \( phi.alt \( t \) \) - beta \( psi \( t \) \) \| \, $ <eq:curve-metric>]

where $phi.alt \, psi$ range over increasing homeomorphisms of $\[ 0 \, 1 \]$, and identify curves at zero distance. This keeps the orientation and order of traversal. It is stronger than convergence of the sets traced by the curves or convergence of their filled hulls alone.

#thm([Theorem 1.1.])[
  (Below-one interface convergence).  #emph[For every fixed $q in \( 0 \, 1 \)$ and every marked domain approximation just specified, the laws of $eta_delta$ converge as $delta arrow.r 0$ in the metric (1.3) to chordal $"SLE"_kappa \( D \; a \, b \)$, where 
$ kappa = frac(4 pi, arccos \( - sqrt(q) \/ 2 \)) . $

 The convergence holds along the full mesh sequence.]
] <thm:main>

Here chordal $"SLE"_kappa$ is the conformal image of the upper half-plane Loewner trace driven by $sqrt(kappa)$ times standard Brownian motion, in the convention $partial_t g_t \( z \) = 2 \/ \( g_t \( z \) - W_t \)$. The trace and its transience in the present range are supplied by #cite(label("RohdeSchramm2005")) Theorems 5.1 and 7.1. All estimates below allow constants depending on the fixed parameter $q$.

=== 1.2 The problem and earlier results <the-problem-and-earlier-results>

Fortuin and Kasteleyn introduced the random-cluster representation as a common framework for percolation and the Ising and Potts models #cite(label("FortuinKasteleyn1972")). On planar graphs its cluster weights admit loop and vertex-model descriptions. The transfer-matrix work of Temperley and Lieb and the graphical equivalence of Baxter, Kelland, and Wu provide the algebraic ancestry of these descriptions #cite(label("TemperleyLieb1971")) #cite(label("BaxterKellandWu1976")). Baxter’s exact-solution work and Nienhuis’s Coulomb-gas analysis developed the associated critical and exponent predictions #cite(label("Baxter1973")) #cite(label("Nienhuis1984")). The interface conjecture additionally asks for convergence of finite lattice curve laws.

At the spanning-tree endpoint $q = 0$, Lawler, Schramm, and Werner proved convergence of the Peano interface of a mixed wired/free uniform spanning tree to chordal $"SLE"_8$ in $C^1$ Jordan domains, for their specified lattice approximations #cite(label("LawlerSchrammWerner2004")) Theorem 1.3. This is an endpoint theorem, with its own approximation hypotheses; it does not give a limit for a fixed positive $q$.

For $q gt.eq 1$, positive association follows from the Fortuin–Kasteleyn–Ginibre lattice condition #cite(label("FortuinKasteleynGinibre1971")). Stochastic comparison under boundary wiring is also available in this regime #cite(label("DuminilCopinSidoraviciusTassion2017")) Section 2.2. Beffara and Duminil-Copin proved that the square-lattice self-dual point is critical for $q gt.eq 1$ #cite(label("BeffaraDuminilCopin2012")). Duminil-Copin, Sidoravicius, and Tassion established continuity of the phase transition and buffered rectangle crossing estimates for $1 lt.eq q lt.eq 4$, as well as crossing estimates with free conditions on rectangle boundaries for $1 lt.eq q < 4$. Their scaling-limit results give curve tightness and Loewner-parametrizable subsequential interface limits #cite(label("DuminilCopinSidoraviciusTassion2017")). Duminil-Copin, Manolescu, and Tassion subsequently obtained crossing estimates in arbitrary discrete quadrilaterals with arbitrary boundary conditions for $1 lt.eq q < 4$ #cite(label("DuminilCopinManolescuTassion2021")).

Below one, Beffara, Faipeur, and Oke improved the Bernoulli stochastic lower and upper bounds for finite random-cluster laws using inhomogeneous product measures. Their finite theorem applies when the connected quotient by the boundary partition has at least two vertices and is not a tree, and improves the bounds on some edges. Its applications enlarge subcritical, supercritical, and strong uniqueness regimes without identifying the self-dual point as critical #cite(label("BeffaraFaipeurOke2025")) Theorems 1.2, 1.4, 1.10, and 1.11.

For infinite-volume geometry below one, Glazman and Lammers constructed, on the anisotropic self-dual line, a self-dual shift-invariant full-plane Gibbs measure with neither primal nor dual percolation #cite(label("GlazmanLammers2025")) Remark 2.8. Their statement does not identify that measure as the free or wired limit. Klausen and Kravitz proved upper-half-plane non-coexistence without positive association; their random-cluster application covers subsequential torus limits for every $q > 0$ and $p in \( 0 \, 1 \)$ #cite(label("KlausenKravitz2026")) Section 3 and Corollary 3.1. These statements concern infinite-volume measures. Theorem 1 concerns the interfaces of the prescribed finite-domain laws.

=== 1.3 Proof strategy <proof-strategy>

The proof links a four-boundary-change crossing formula to the two-boundary-change interface in Theorem 1. During an exploration, a conditional crossing probability is a martingale. A conformal formula for that probability, valid also in the remaining slit domain, will identify the limiting Loewner driver. Establishing and transporting the formula requires both estimates for physical paths and analytic control of a complex observable.

===== 1.3.1 The auxiliary probability and observable. <the-auxiliary-probability-and-observable.>

In a fixed simple orthogonal polygon with rational coordinates, along meshes that tile it exactly, choose four boundary marks and designate the intervening arcs alternately primal-wired and dual-wired. Leave the four interface ends unpaired outside the polygon and give every closed medial loop weight $d = sqrt(q)$; this is the #emph[open-cap law]. There are two noncrossing pairings of the four ends. Let $r_delta$ be the probability of the pairing with an actual primal crossing between the two primal-designated arcs. The other pairing has probability $1 - r_delta$. Completing the ends to impose two separate primal wires weights the alternatives by $d$ and $d^2$. The actual primal crossing probability under that completed law is therefore

$ frac(r_delta, r_delta + d \( 1 - r_delta \)) . $

This distinction is retained when the auxiliary formula is used for the original FK law.

For an interior point $z$, the boundary-to-boundary interface arcs separating $z$ from the first boundary mark form an ordered family. Section 9 assigns explicit complex weights to this family and to the remaining boundary arcs. An explicit finite sum of products of these weights, averaged under the open-cap law, defines a function $h_delta \( z \)$. A finite boundary calculation identifies candidate marked limits in terms of the limiting pairing probability and gives side line conditions with an additional correction term. We must prove compactness, remove that term, and show that the limiting function is holomorphic. Its four supporting boundary lines and marked limits determine a strictly convex quadrilateral. The argument principle identifies the limit as a conformal bijection onto that quadrilateral, and the Schwarz–Christoffel formula determines the limiting pairing probability from the conformal positions of the four marks.

===== 1.3.2 Physical crossings without positive association. <physical-crossings-without-positive-association.>

The first input is a collection of finite comparisons that can replace FKG in the particular geometries used here. Section 3 introduces a partition polynomial in vertex variables and proves that every nonconstant coefficient of its negative logarithm is nonnegative. A derivative at a vertex becomes a probability law on connected vertex multisets; connection to an added wire becomes a hitting event for that multiset. Planar duality then gives restricted comparisons for edges incident to a common vertex or face and a gluing inequality for interlacing boundary connections. These yield rectangle crossing bounds and estimates for the cost of specified boundary identifications.

A network connection may use identified boundary vertices, whereas an actual path must follow open physical edges. The rectangle and sector arguments first control network tests and then actual paths in sectors. To pass to an irregular disk, we descend through crosscuts of decreasing diameter until we find either a bounded physical bridge or a route with clear interior access to both walls. The local topology retains the side of every boundary approach, including the two banks of a slit. Separated neighboring crosscuts leave enough uninspected space to extend an exposed actual crossing through each end gap. This proves the pure-network and actual-path decay of Theorems 54 and 56. Such irregular disks arise during exploration even from the initial simple polygons of Theorem 1.

The disk estimates next produce joins confined to prescribed regions. Circuits and boundary-to-boundary paths shield an inner region from distant identifications; repeated shields make their influence vanish. A relative version preserves an existing rare traversal while blocking an additional opposite-color crossing. This comparison is needed when the observable assigns a small positive weight to the existing event: an absolute error bound would not suffice.

===== 1.3.3 Analytic estimates and the boundary problem. <analytic-estimates-and-the-boundary-problem.>

The second input controls finite differences of $h_delta$ through its representation by loop currents. Finite six-vertex transfer matrices on a circle give one bound for a current insertion and a stronger bound when its leading angular contribution is canceled. A fusion calculation separates those leading modes from the other modes. The normalization on the square lattice follows from the periodic six-vertex pressure #cite(label("SixVertex2022")) Theorem 1 and a finite-row comparison proved here. Some boundary factors in the current expansion have negative signs when $d < 1$. We put the auxiliary insertions close together so that a negative contribution requires extra opposite-color crossings. The relative crossing loss bounds it against the positive contribution, retaining the small weights due to nested boundary arcs.

We then place the polygon inside a second boundary construction with matching walls. Closing small gaps in those walls, after a positive normalization, gives an asymptotic factorization of a two-variable observable into an interior factor $h_delta \( z \)$ and an exterior factor. One application of the signed estimate removes the extra contribution in the boundary values. Another, combined with both transfer bounds, controls a Cauchy–Riemann difference in the interior variable followed by a finite difference in the exterior variable. In the limit, the resulting mixed derivatives of $h \( z \) J \( u \)$ vanish. Since the exterior factor $J$ is nonconstant, this forces $h$ to be holomorphic. This supplies the boundary problem described above and proves Theorem 108.

===== 1.3.4 Stopped laws and complete curves. <stopped-laws-and-complete-curves.>

Section 10 carries the fixed-polygon formula into the domains left by a partially explored interface. Insert a short wired interval on the original free boundary. In this four-change law the conditional pairing probability is a martingale. First take the mesh limit with the interval fixed, replace the normalized probability by a bounded stopped expression, compare the auxiliary and original laws, and only then shrink the interval. Two resulting martingales identify the drift and quadratic variation of the Loewner driver. The observable-to-driver step follows the strategy introduced for loop-erased random walks and spanning-tree interfaces by Lawler, Schramm, and Werner #cite(label("LawlerSchrammWerner2004")) Sections 3.3 and 4.2. Separately, conditional bounds for avoidable crossings at every stopping time give joint compactness of complete curves and drivers. This retains traversal order and reaches the target, so identification of the Brownian driver yields the full curve theorem.

=== 1.4 Ancestry of the methods <ancestry-of-the-methods>

The site polynomial in Section 3 is a normalized specialization of the external-field random-cluster polynomial in Sokal’s work #cite(label("Sokal2001ComplexZeros")) Section 6. Regrouping its edge expansion expresses it as a hard-core polymer partition function at negative activities. The signs of those activities follow from the negative-parameter Tutte theorem of Jackson and Sokal, attributed there to Dong #cite(label("JacksonSokal2009TutteZeros")) Theorem 4.4. The logarithmic signs and convergence follow from classical repulsive Mayer principles, in the formulation of Scott and Sokal, applied after this regrouping and using positivity of the polynomial on the real unit cube #cite(label("ScottSokal2005RepulsiveGas")) Propositions 2.1 and 2.8–2.9, Theorem 2.10. Section 3 gives a direct finite proof and turns the logarithmic coefficients into the representation by rooted connected vertex multisets used for its boundary comparisons.

The passage from flat boundaries to irregular domains has useful geometric predecessors. Duminil-Copin, Manolescu, and Tassion choose a minimal annular scale and derive separation inside the domain #cite(label("DuminilCopinManolescuTassion2021")) Section 4, Fact 4.1; the annular criterion is attributed there to the proof of #cite(label("KemppainenSmirnov2017")) Proposition 2.6. Their subsequent contact and gluing argument uses $q gt.eq 1$. Beffara and Gayet distinguish ambient distance from the minimum diameter of an interior joining path and use the latter to shave a quadrilateral #cite(label("BeffaraGayet2026")) Definitions 5–6 and Lemma 20. Their non-FKG crossing theorem concerns perturbative, rapidly decorrelating site models. Here the diameter descent, accessible wall continuation, and separated crosscuts are proved for the split boundary incidences and half-tiles needed after FK explorations. The probabilistic step uses the finite pressure comparisons established in this paper.

Smirnov formulated the general random-cluster parafermionic program and proved convergence of the square-lattice FK-Ising fermionic observable #cite(label("Smirnov2010")) Theorem 2.2 and Conjecture 2.6. In contemporaneous work, Riva and Cardy established lattice parafermionic identities for the Potts model and explained that continuum holomorphicity requires additional smoothness #cite(label("RivaCardy2006")) Sections 3.1 and 4.2. Duminil-Copin subsequently presented the local relation for $0 < q < 4$ and applied parafermionic observables to prove correlation-length divergence for $1 lt.eq q lt.eq 4$ #cite(label("DuminilCopin2012Parafermion")) Proposition 4 and Theorem 1. Chelkak and Smirnov’s four-boundary-change FK-Ising construction on isoradial graphs is a direct predecessor of the auxiliary two-pairing experiment here, including its external cap normalization #cite(label("ChelkakSmirnov2012")) Section 6. For $q = 2$, Chelkak, Duminil-Copin, Hongler, Kemppainen, and Smirnov proved convergence of the square-lattice FK-Ising Dobrushin interface to $"SLE"_(16 \/ 3)$ in the uniform metric on oriented curves #cite(label("ChelkakDCHonglerKemppainenSmirnov2014")) Theorem 2.

The elementary source and diagonal-prefix tensors in the finite current used here specialize the dense-loop coproduct current of Ikhlef, Weston, Wheeler, and Zinn-Justin #cite(label("IkhlefWestonWheelerZinnJustin2013")) Sections 2.3, 2.5.1, 3.1–3.2, and 4.1, which builds on the nonlocal-current construction of Bernard and Felder #cite(label("BernardFelder1991")). Appendix 11 specifies the path lifts, boundary factors, separator-tree evaluation, extraction, and reflection conventions used in this paper.

The two-pairing normalization and the resulting four-point function also have direct predecessors. Feng, Peltola, and Wu proved exact finite reweighting at self-dual weights for every $q > 0$; in the two-pairing case it gives the external cap factor $d = sqrt(q)$ used in (9.86) #cite(label("FengPeltolaWu2024FKConnections")) Proposition 4.6, equations (4.17)–(4.19). Miller and Werner obtained a conditioned-CLE hookup formula for $kappa in \( 8 \/ 3 \, 8 \)$; in the present range $6 < kappa < 8$, it is the same function of the cross-ratio as the separate-wire expression in (9.86) #cite(label("MillerWerner2018CLEConnections")) Theorem 1, equations (4.1)–(4.3). Their FK interpretation assumes a nontrivial conformally invariant scaling limit. These formula identifications leave convergence of the finite lattice law as a separate issue.

The six-vertex free-energy formula goes back to Lieb’s solution of the $F$ model and Sutherland’s broader ice-rule model #cite(label("Lieb1967FModel")) #cite(label("Sutherland1967SixVertex")). The imported analytic input is the rigorous periodic free-energy theorem of Duminil-Copin, Kozlowski, Krachun, Manolescu, and Tikhonovskaia #cite(label("SixVertex2022")) Theorem 1, at the weights specified in Section 8. Projector fusion has an earlier formulation in the work of Kulish, Reshetikhin, and Sklyanin #cite(label("KulishReshetikhinSklyanin1981")) Section 2, and Baxter developed inversion relations combined with symmetry and analyticity for exact lattice calculations #cite(label("Baxter1982Inversion")). The explicit quotient and marked-row estimates, and the normalization of finite rows, are treated in Sections 7 and 8.

At the curve stage, the criterion of Kemppainen and Smirnov turns conditional bounds on avoidable crossings, uniform over stopping times, into tightness and compatible subsequential limits of curves and Loewner drivers #cite(label("KemppainenSmirnov2017")) Condition C2, Theorem 1.5, and Corollary 1.7. It does not itself identify the limiting driver. For $4 < kappa < 8$, Ambrosio, Miller, and Yuan characterize multichordal SLE with a fixed interior link pattern by single-chord resampling, and externally wired multichordal CLE with at least two chords by two-chord resampling #cite(label("AMY2025")) Theorems 1.3 and 1.6. Their FK lattice identifications remain conjectural there; those continuum characterizations do not establish convergence from (1.2).

=== 1.5 A common-domain consequence <a-common-domain-consequence>

The complementary interface theorem gives the following consequence. The extended parameter range is local to this corollary; the setup (1.1) and the rest of the paper retain $0 < q < 1$.

#thm([Corollary 1.2.])[
  (Combined finite-law parameter range).  #emph[For this statement, fix $q in \( 0 \, 4 \)$ and put 
$ p \( q \) = frac(sqrt(q), 1 + sqrt(q)) \, #h(2em) kappa \( q \) = frac(4 pi, arccos \( - sqrt(q) \/ 2 \)) . $

 Let $D$ be a bounded Jordan domain with smooth simple boundary and distinct boundary marks $a \, b$. Take simple nearest-neighbor lattice polygon approximations $D_(delta_n)$, with $delta_n arrow.b 0$ and the full closed-polygon graphs specified above, and take $a_(delta_n) \, b_(delta_n)$ to be distinct polygon vertices. Require counterclockwise parametrizations of $partial D_(delta_n)$ converging uniformly on $\[ 0 \, 1 \]$ to one of $partial D$, all injective on $\[ 0 \, 1 \)$, with the marks $a_(delta_n) \, b_(delta_n)$ and $a \, b$ at parameters $0 \, 1 \/ 2$ respectively. Wire all vertices of the counterclockwise arc from $b_(delta_n)$ to $a_(delta_n)$, including its endpoints, leaving the other boundary vertices singleton. Sample (1.2) with this $q$ and $p = p \( q \)$, and declare wired-arc boundary edges open for drawing. Then the prescribed medial strand, oriented from $a_(delta_n)$ to $b_(delta_n)$, converges in law along the full mesh sequence to chordal $"SLE"_(kappa \( q \)) \( D \; a \, b \)$ in (1.3). No uniformity in $q$ is asserted.]
] <cor:full-fk-range>

#proof[
  For $0 < q < 1$, apply Theorem 1. For $1 lt.eq q < 4$, let $W$ be the wired-arc boundary edges and $E' = E \( G_(delta_n) \) \\ W$. For $A' subset.eq E'$ and $C subset.eq W$, the endpoints of every edge of $W$ are already identified, so $k_xi \( A' union C \) = k_xi \( A' \)$. Summing their independent edge factors gives
  $ sum_(C subset.eq W) p \( q \)^(\| C \|) \( 1 - p \( q \) \)^(\| W \| - \| C \|) = 1 . $
  Thus the marginal on $E'$ is exactly the finite law used in #cite(label("OpenAI2026FKInterfacesAboveOne")) Theorem 1.1(i), which removes $W$ from sampling and declares its edges open for the same medial drawing. The wired/free arcs, orientation, marked approximation and curve metric agree, so that theorem proves the remaining range. These applications give convergence along the full mesh sequence in the stated cases. ◻
]

=== 1.6 Organization and dependencies <organization-and-dependencies>

Section 2 fixes the finite laws, tile drawings, and meaning of conditioning. Sections 3 and 4 establish the pressure comparisons and rectangle bounds. Section 5 proves sector decay and bounds on annular partition-function ratios. Section 6 proves the localization proposition, irregular-disk decay, physical routing, and relative screening estimates. These provide the geometric input for the passage moments and local weight bounds of Section 7.

The remaining part of Section 7 and the finite-row part of Section 8 establish the transfer estimates and their physical normalization. The screening estimates then permit passage to plane currents and the signed charge comparison. Section 9 uses those inputs to obtain the fixed-polygon formula. Section 10 proves its moving-domain extension, the stopped tests, curve compactness, and the chordal limit. Figure 1 displays the principal dependencies.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.553cm, inset: 0.1764cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite FK comparisons#linebreak()rectangles and sectors]]])])
  content((5, 0), [#box(width: 3.553cm, inset: 0.1764cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Localization and#linebreak()separated crosscuts]]])])
  content((10, 0), [#box(width: 3.553cm, inset: 0.1764cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Finite row algebra#linebreak()six-vertex pressure]]])])
  content((2.5, -1.8), [#box(width: 3.553cm, inset: 0.1764cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Irregular-disk estimates#linebreak()and screening]]])])
  content((10, -1.8), [#box(width: 3.553cm, inset: 0.1764cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Physical current#linebreak()estimate]]])])
  content((2.5, -3.6), [#box(width: 3.553cm, inset: 0.1764cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Positive local#linebreak()weights and#linebreak()signed charges]]])])
  content((7.5, -3.6), [#box(width: 3.553cm, inset: 0.1764cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Observable convergence#linebreak()and crossing formula]]])])
  content((7.5, -5.4), [#box(width: 3.553cm, inset: 0.1764cm, stroke: (thickness: 0.4pt), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Moving domains#linebreak()and SLE curve#linebreak()convergence]]])])
  line((0.6944, -0.5), (1.806, -1.3), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((4.306, -0.5), (3.194, -1.3), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((10, -0.5), (10, -1.3), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((4.276, -1.8), (8.224, -1.8), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((2.5, -2.3), (2.5, -3.1), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((4.276, -3.6), (5.724, -3.6), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((9.306, -2.3), (8.194, -3.1), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((7.5, -4.1), (7.5, -4.9), stroke: (thickness: 0.7pt), mark: (end: ">"))
  line((0.7236, -1.8), (-2.2, -1.8), (-2.2, -5.4), (5.724, -5.4), stroke: (thickness: 0.7pt), mark: (end: ">"))
})],
  caption: [Figure 1: The main proof dependencies. Localization in split tiled disks supplies the clear approaches and separated cuts needed to pass from finite network comparisons to actual-path decay. The disk estimates then feed both the local weight comparisons and the plane interpretation of the current. They also enter the moving-domain argument directly, through crossing estimates uniform over stopped exploration histories. ],
) <fig:dependencies>

Appendix 11 gives the finite current identities, extraction formulas, and reflection statements used by the observable. Its norm consequence additionally uses the physical current estimate.

== 2 Finite laws and geometric conventions <sec:conventions>

We fix the finite conditioning, planar duality, and boundary-incidence conventions used throughout the proof. The distinction between a path in a quotient graph and a path made of physical open edges is essential: the comparison inequalities first concern the former, while the crossing estimates for explored domains must eventually control the latter.

=== 2.1 Odds, identifications, and conditional laws <odds-identifications-and-conditional-laws>

For a finite graph $G = \( V \, E \)$ with positive edge odds $v_e$, write

#[#set math.equation(numbering: n => "(2.1)")
 $ Z_G \( q \, upright(bold(v)) \) = sum_(A subset.eq E) q^(k \( A \)) product_(e in A) v_e . $ <eq:odds-partition>]

Parallel edges and loops are allowed. A boundary partition $xi$ means the quotient graph obtained by identifying vertices in each class. Identifications are not sampled edges. A loop contributes a factor $1 + v_e$ to the partition function and does not affect other edges. In the square medium all ordinary odds are $v_e = d$.

#thm([Lemma 2.1.])[
  (Finite conditioning and bounded local changes).  #emph[Conditioning on any set of edge states gives the random-cluster law on the remaining graph with the identifications induced by the open conditioned edges and the original partition. Conditional on all other edge states, an edge of odds $v$ has opening probability either $v \/ \( 1 + v \)$ or $v \/ \( q + v \)$, according as its endpoints are already connected or not. Changing a bounded number of edge states or pairwise vertex identifications therefore has bounded positive weight cost when the affected odds stay in a fixed compact subset of $\( 0 \, oo \)$.]
] <lem:finite-conditioning>

#proof[
  Contract the open conditioned edges and delete the closed ones. Components that no longer contain an unconditioned vertex contribute a fixed power of $q$. All other components are counted in the quotient graph, giving (2.1). Adding an edge to a fixed state either leaves its component count unchanged or reduces it by one, so its opening-to-closing odds are $v$ or $v \/ q$. A single identification of two vertices similarly multiplies a state’s weight by $1$ or $q^(- 1)$. Products of a fixed number of such factors, including the normalizing constants, give the last assertion. ◻
]

The same statement applies to a stopped exploration. A leaf of its decision tree specifies exactly the edge states it has revealed; no additional event in the uninspected region may be conditioned on when invoking Lemma 3.

#prodef([Definition 2.2.])[
  (Network and actual connections).  A #emph[network connection] is an open connection in the graph after the prescribed vertex identifications. An #emph[actual connection] uses open physical edges and does not jump between distinct vertices in a boundary class. A measured actual path may subsequently be contracted to a terminal when its opposite side remains uninspected.
] <def:actual-network>

With only two disjoint separately wired electrode sets, their network connection is equivalent to an actual path between the sets. Extra boundary wires can invalidate this equivalence. We will explicitly remove such shortcuts whenever converting a network test to an actual path assertion.

=== 2.2 Tiles, caps, and Euler’s identity <tiles-caps-and-eulers-identity>

We use checkerboard square tiles whose sides make angle $pi \/ 4$ with the primal lattice axes. A tile has one primal diagonal, one dual diagonal, and a port at each side midpoint. Opening the primal diagonal pairs the ports around the dual corners; closing it opens the dual diagonal and pairs the ports around the primal corners. Corners of a fixed color on one side of a switch strand are connected by actual edges on that side. The tile drawing only records the same edge state, not a different random model. Figure 2 records the two local states.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1.6, 0), (0, 1.6), (1.6, 0), (0, -1.6), close: true, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((0, 1.77), [#text(size: 9pt)[dual corner]], anchor: "south")
  content((-1.77, 0), [#text(size: 9pt)[primal#linebreak()corner]], anchor: "east")
  content((-0.8, 0.8), [#text(size: 9pt)[$1$]], anchor: "south-east")
  content((0.8, 0.8), [#text(size: 9pt)[$2$]], anchor: "south-west")
  content((0.8, -0.8), [#text(size: 9pt)[$3$]], anchor: "north-west")
  content((-0.8, -0.8), [#text(size: 9pt)[$4$]], anchor: "north-east")
  line((4.5, 0), (6.1, 1.6), (7.7, 0), (6.1, -1.6), close: true, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((6.1, 1.77), [#text(size: 9pt)[dual corner]], anchor: "south")
  content((4.33, 0), [#text(size: 9pt)[primal#linebreak()corner]], anchor: "east")
  content((5.3, 0.8), [#text(size: 9pt)[$1$]], anchor: "south-east")
  content((6.9, 0.8), [#text(size: 9pt)[$2$]], anchor: "south-west")
  content((6.9, -0.8), [#text(size: 9pt)[$3$]], anchor: "north-west")
  content((5.3, -0.8), [#text(size: 9pt)[$4$]], anchor: "north-east")
  line((-1.6, 0), (1.6, 0), stroke: (thickness: 1.0pt))
  content((0, -0.015), [#text(size: 8pt)[primal diagonal]], anchor: "north")
  bezier((-0.8, 0.8), (0.8, 0.8), (-0.5, 0.35), (0.5, 0.35), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  bezier((-0.8, -0.8), (0.8, -0.8), (-0.5, -0.35), (0.5, -0.35), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  line((6.1, -1.6), (6.1, 1.6), stroke: (thickness: 1.0pt))
  content((6.085, 0), [#page_rotate(-90deg)[#text(size: 8pt)[dual diagonal]]], anchor: "south")
  bezier((5.3, 0.8), (5.3, -0.8), (5.75, 0.5), (5.75, -0.5), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  bezier((6.9, 0.8), (6.9, -0.8), (6.45, 0.5), (6.45, -0.5), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  circle((-1.6, 0), radius: 0.08467, fill: black, stroke: none)
  circle((1.6, 0), radius: 0.08467, fill: black, stroke: none)
  circle((0, 1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((0, -1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((-0.8, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((0.8, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((0.8, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((-0.8, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((4.5, 0), radius: 0.08467, fill: black, stroke: none)
  circle((7.7, 0), radius: 0.08467, fill: black, stroke: none)
  circle((6.1, 1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((6.1, -1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((5.3, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((6.9, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((6.9, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((5.3, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  content((0, -2.15), [#text(size: 9pt)[Primal open#linebreak()pairings $1:2$ and $3:4$]])
  content((6.1, -2.15), [#text(size: 9pt)[Primal closed, dual open#linebreak()pairings $1:4$ and $2:3$]])
})],
  caption: [Figure 2: The two local switch states, with ports numbered clockwise. Black dots are primal corners and white dots are dual corners. The black diagonal is the open physical bond; the complementary diagonal is omitted. Blue curves are medial strands: an open primal bond pairs ports around the dual corners, while an open dual bond pairs ports around the primal corners. The switch drawing records the same FK edge state and introduces no additional randomness. ],
) <fig:local-switch>

A #emph[wall] cuts tile-to-tile port contractions and keeps its two banks separate. At a boundary interval designated primal-wired or dual-wired, local caps pair the intervening ports between successive visits of the designated vertex color. Boundary-condition changes leave unmatched ports. A positive completion pairs the unmatched ports by the specified planar cap trees, so that the switch diagram is a finite collection of loops.

#thm([Lemma 2.3.])[
  (Positive loop law).  #emph[For any fixed planar cap completion, the weight of a switch state in the homogeneous medium is proportional to $d^ell$, where $ell$ is its number of completed loops and $d = sqrt(q)$. The proportionality factor is independent of the switch state. Changing a bounded number of loose-port pairings has bounded positive weight cost for every fixed $d > 0$.]
] <lem:loop-law>

#proof[
  Thicken the open primal graph together with the fixed boundary cap trees on the sphere. If a planar ribbon graph has $V'$ vertices, $E'$ edges, and $k'$ components, then its regular neighborhood has Euler characteristic $V' - E'$ and also $2 k' - ell$, because every component has genus zero. Thus $ell = 2 k' + E' - V'$. The cap trees change the expression only by a constant depending on the fixed completion, and their contractions make $k' = k_xi \( A \)$. Consequently
  $ ell = 2 k_xi \( A \) + \| A \| + c_xi \, #h(2em) d^ell = d^(c_xi) q^(k_xi \( A \)) d^(\| A \|) . $
  This is the odds form of the FK weight. A change of one pairing can merge or split only a bounded number of loops. Its weight ratio is therefore bounded above and below by fixed powers of $d$; normalization preserves a bounded two-sided comparison. ◻
]

On a torus the same thickening has total genus at most one, so the formula gains $- 2 g$ with $g in { 0 \, 1 }$. The loop/FK discrepancy is then a bounded genus factor. This fact will be used only in the explicit torus-to-plane comparison of Section 8.

#thm([Lemma 2.4.])[
  (Finite planar duality).  #emph[Complementary dual-open edges have odds $q \/ v_e$. In particular the homogeneous square medium with odds $d = sqrt(q)$ is self-dual. Complementary boundary caps are understood on the same cut surface.]
] <lem:finite-duality>

#proof[
  For a connected plane graph on the sphere, the dual subgraph on $E \\ A$ has as many components as the faces of the primal subgraph. Euler’s identity gives $k^(*) \( E \\ A \) = \| A \| - \| V \| + k \( A \) + 1$. Multiplying out $q^(k^(*) \( E \\ A \)) product_(e in.not A) \( q \/ v_e \)$ shows that its ratio to $q^(k \( A \)) product_(e in A) v_e$ is constant in $A$. Fixed cap trees can be included before applying this identity and then contracted; their complementary dual incidences give the stated boundary convention. Disconnected ambient graphs are handled componentwise or by adding fixed exterior trees. ◻
]

=== 2.3 Cut surfaces and the order of limits <cut-surfaces-and-the-order-of-limits>

A tiled disk has an injectively embedded open interior. Boundary incidences are counted on the disk itself: the two banks of a slit or the two fans at a pinched vertex are distinct even if their planar images agree. The specific half-tile and triangular boundary pieces used below carry the ordinary bonds specified in their construction. Their conditional law, including any required resampling of cut cells, is justified when each construction is introduced. A cut does not identify coincident banks.

A cap partition is #emph[planar] if its classes can be connected by noncrossing arcs in the designated exterior. A pair of end caps is #emph[separate] when neither cap joins the two ends. A joint planar end partition may join them, but is still supported only on those end intervals. Statements allowing a bounded number of through hubs will explicitly require that, after removing all classes meeting those hubs, the residual caps remain separately planar. No assertion about arbitrary crossing partitions is implicit.

An extremal search starts from a specified exterior complementary face. It queries an edge only from a reached face and enters the opposite face only when the intervening edge of the tested color is closed. After exploring the complete reached component, it selects the appropriate simple frontier from the measured open edges. On success this frontier is a blocker whose opposite side remains uninspected. Boundary access arcs used to define the search do not identify vertices or add physical edges. Prefixes and stopped leaves retain the cyclic order of the boundary incidences.

Raw arcs, passages, and nests are counted before the ports at any wall are paired. This avoids changing a local count by a remote cap identification. All comparisons concern positive finite laws unless a signed spin or charge expansion is explicitly specified.

Throughout the paper $q$ is fixed. Constants may depend on $q$, fixed charges, and fixed shape and buffer parameters. In a geometric argument the finite inventory of shapes, clearances, gaps, and auxiliary ratios is chosen before the mesh is sent to zero. A large-circle transfer limit is taken with the finite insertion diagram fixed; later mesh or insertion limits follow it. When a relative error is needed rather than a bounded multiplicative comparison, it is stated as such. These orders will also be recorded at the points where several limits interact.

== 3 Site pressure and boundary gluing <sec:pressure>

Throughout this section, $0 < q < 1$ is fixed, and we put

$ u = 1 - q \, #h(2em) t = q^(- 1) . $

The graphs are finite and their edge odds are nonnegative and finite, unless a limiting identification is specified. The basic pressure and rooted-connection arguments do not require planarity; the cofacial comparisons additionally use a fixed plane embedding. Together they provide the restricted connection comparisons used in the geometric arguments. The proof has three stages. We first obtain nonnegative coefficients for a site-pressure expansion. Those coefficients give a rooted multiset representation of connections to an added wire. Finally, we combine the resulting comparisons with an extremal planar search to glue connections between interlacing boundary electrodes. Every result in this section follows from these finite hypotheses.

For a graph $H = \( V \, E \)$, write

#[#set math.equation(numbering: n => "(3.1)")
 $ Z_H = sum_(A subset E) q^(k \( V \, A \)) v_A \, #h(2em) v_A = product_(e in A) v_e \, $ <pressure:partition>]

and let $bb(P)_H$ be the corresponding FK law. Components include isolated vertices. A preexisting wire is treated as a vertex identification before this notation is applied. Thus a vertex of $H$ may represent several vertices of an earlier physical graph; a path in $H$ need not lift to a physical path in that earlier graph. We write $bb(E)_0$ for independent bond percolation with opening probabilities $v_e \/ \( 1 + v_e \)$ on the same graph. Loops factor independently out of (3.1). Parallel edges can be replaced by a single edge of odds $product_e \( 1 + v_e \) - 1$ whenever only connectivity is at issue.

=== 3.1 A positive expansion of the site pressure <a-positive-expansion-of-the-site-pressure>

For a vertex set $C$, put $x_C = product_(a in C) x_a$ and define

#[#set math.equation(numbering: n => "(3.2)")
 $ F_H \( x \) = bb(E)_0 product_(C upright(" component of ") \( V \, A \)) \( 1 - u x_C \) . $ <pressure:polynomial>]

This is a polynomial, affine in each site variable, with $F_H \( 0 \) = 1$. The component product is a site-variable form of the external-field FK expansion in #cite(label("Sokal2001ComplexZeros")) Section 6; the hub calculation below identifies these variables. At $x = upright(bold(1))_V$, every component contributes $q$, so

$ F_H \( upright(bold(1))_V \) = frac(Z_H, product_(e in E \( H \)) \( 1 + v_e \)) . $

Site values in $\( 0 \, 1 \]^V$ also have a partition-function interpretation. Adjoin a new vertex $o$ to $H$ and finitely many links from vertices of $H$ to $o$, allowing several links at a site. For this specialization put

$ s_i = product_(h : thin i - o) \( 1 + v_h \) \, #h(2em) x_i = s_i^(- 1) \, #h(2em) s_C = product_(i in C) s_i \, $

where an empty product is one. For a fixed original open graph, summing the hub links at a component $C$ gives weight $q$ if none is open and weight $s_C - 1$ otherwise, with one further global factor $q$ for the hub component. Consequently

#[#set math.equation(numbering: n => "(3.3)")
 $ Z_(H + o) = q (product_(e in E \( H \)) \( 1 + v_e \)) (product_(i in V) s_i) F_H \( 1 \/ s \) . $ <pressure:hub-partition>]

We will use the next theorem to control how this partition function changes with the hub links. Its coefficient signs will also turn a derivative at a vertex into a probability law.

#thm([Theorem 3.1.])[
  (Positive site pressure).  #emph[There are coefficients $c_m gt.eq 0$, indexed by the nonzero multiindices $m in bb(Z)_(gt.eq 0)^V$, such that 
#[#set math.equation(numbering: n => "(3.4)")
 $ - log F_H \( x \) = sum_(m eq.not 0) c_m x^m \, #h(2em) x^m = product_(i in V) x_i^(m_i) . $ <pressure:series>]

 The series converges absolutely on a polydisk containing the closed unit polydisk in its interior. If $c_m > 0$, the support ${ i : m_i > 0 }$ is connected in $H$.]
] <thm:pressure>

#proof[
  We first identify the squarefree coefficients of $F_H$, then the signs of its logarithmic coefficients, and finally the convergence domain. The sign argument uses labeled copies of vertices: an auxiliary cancellation removes repeated types before the logarithm is taken.
  ===== 3.1.1 The coefficients of the site polynomial. <the-coefficients-of-the-site-polynomial.>
  Discard loops and combine parallel edges, so that $H$ is simple. Set
  $ gamma_i = product_(e in.rev i) \( 1 + v_e \)^(- 1) \, #h(2em) y_i = gamma_i x_i . $
  Selecting a collection of components in (3.2) with union $T$ forces every edge between $T$ and its complement to be closed. Summing all edges in the complement therefore shows that the coefficient of $y_T$ is
  #[#set math.equation(numbering: n => "(3.5)")
   $ W \( T \) = product_(e in E \( H \[ T \] \)) \( 1 + v_e \) sum_(A subset E \( H \[ T \] \)) v_A \( - u \)^(k \( T \, A \)) . $ <pressure:squarefree>]
  Indeed, the factors $gamma_i$ count each internal edge twice, whereas the percolation normalization counts it once. This accounts for the first product in (3.5). Coefficients with a repeated variable vanish.
  ===== 3.1.2 Connected structures and logarithmic signs. <connected-structures-and-logarithmic-signs.>
  To take the logarithm, use a finite set $U$ of labeled elements, each carrying a type in $V$; there are $m_i$ elements of type $i$. Repeated types are needed because a logarithm need not be squarefree, even when $F_H$ is. The two ordinary edge sets below represent, respectively, the partition sum and the extra product in (3.5); hard edges cancel repeated types before the connected-structure restriction is imposed. Between elements of distinct adjacent types allow an ordinary edge with the corresponding odds $v_e$. Between elements of the same type allow a hard edge. For a subset $J subset U$, independently choose two sets $A \, B$ of ordinary edges and a set $L$ of hard edges, and give the resulting structure weight
  #[#set math.equation(numbering: n => "(3.6)")
   $ v_A v_B \( - u \)^(k \( J \, A \)) \( - 1 \)^(\| L \|) . $ <pressure:structure-weight>]
  If a type repeats in $J$, summation over a possible hard edge cancels the full sum. If no type repeats, summation over $B$ gives the first product in (3.5), and the full sum is $W \( T \)$. Consequently the sum of (3.6) is the mixed derivative of $F_H$ at zero in the labeled $y$-slots $J$.
  The weight factors over the connected components of $A union B union L$. In particular the number of $A$-components is additive over those components. Decomposing every structure according to its partition into connected components proves the labeled exponential formula in this setting: the mixed derivative of $log F_H$ in the slots $U$ is the same sum restricted to structures with $A union B union L$ connected. This is an identity of formal series; no convergence assertion is being used yet. For the corresponding connected-graph logarithm in the hard-core gas, see #cite(label("ScottSokal2005RepulsiveGas")) Proposition 2.1.
  We group this connected sum by the ordinary-edge union $D = A union B$. If $\( U \, D \)$ has $b$ components, the ordinary-edge sum has sign $\( - 1 \)^b$ or vanishes, while the connected hard-edge sum has sign $\( - 1 \)^(b - 1)$ or vanishes. Their product gives the required nonpositive sign for the logarithmic derivative.
  For fixed $D$, an edge of $D \\ A$ must belong to $B$ and contributes $v_e$. An edge of $A$ may or may not belong to $B$, and contributes $v_e \( 1 + v_e \)$. Thus summing over $A \, B$ with union $D$ gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ v_D product_(D_0) Z \( D_0 \; - u \, 1 + v \) \, #h(2em) Z \( G \; s \, w \) = sum_(R subset E \( G \)) s^(k \( V \( G \) \, R \)) w_R \, $ <pressure:fixed-union>]
  where $D_0$ ranges over the connected components of $\( U \, D \)$.
  For every connected graph $G$ and weights $w_e gt.eq 1$, one has
  #[#set math.equation(numbering: n => "(3.8)")
   $ Z \( G \; - u \, w \) < 0 . $ <pressure:negative-partition>]
  This is a special case of #cite(label("JacksonSokal2009TutteZeros")) Theorem 4.4, where the result is attributed to Dong. Here is a direct induction for the present weights, including multigraphs. A loop contributes a positive factor $1 + w_e$. A bridge can be contracted at the positive factor $w_e - u$. For an edge that is neither a loop nor a bridge, deletion and contraction both leave connected graphs, and
  $ Z \( G \; - u \, w \) = Z \( G \\ e \; - u \, w \) + w_e Z \( G \/ e \; - u \, w \) $
  is the sum of two negative terms. The initial graph with one vertex and no edges has partition function $- u$. This proves (3.8).
  It remains to sum the hard edges, subject to $D union L$ being connected. If a possible hard edge lies within a $D$-component, its two choices cancel because it has no effect on this connectivity requirement. Otherwise contract all $D$-components. The hard-edge sum becomes
  $ sum_(L : thin \( \[ b \] \, L \) upright(" connected")) \( - 1 \)^(\| L \|) \, #h(2em) b = k \( U \, D \) \, $
  on a hard multigraph with $b$ vertices. This sum is either zero or has sign $\( - 1 \)^(b - 1)$. To see this directly, loops cancel, disconnected graphs have sum zero, and the deletion-minus-contraction recursion preserves the asserted sign; the one-vertex graph has value one. The $b$ factors in (3.7) have sign $\( - 1 \)^b$. Their product with the hard-edge sum is therefore nonpositive. Each contribution grouped by the ordinary union $D$, after summing the hard edges, is therefore nonpositive. Dividing by the positive factorials of the multiplicities and rescaling from $y$ to $x$ proves $c_m gt.eq 0$.
  A connected structure on the labeled elements projects to a connected set of vertex types: hard edges only join equal types and ordinary edges project to edges of $H$. This proves the assertion about support. The hard-edge sign and connected-support conclusions are the repulsive-gas principles of #cite(label("ScottSokal2005RepulsiveGas")) Propositions 2.8–2.9 after the ordinary-union regrouping above; the argument here proves them directly for this site polynomial.
  ===== 3.1.3 Convergence beyond the unit polydisk. <convergence-beyond-the-unit-polydisk.>
  The preceding arguments are formal coefficient identities. To use their derivatives as probabilities, we must also justify convergence at $x_i = 1$. The following direct nonnegative-series argument is the finite form of the convergence principle in #cite(label("ScottSokal2005RepulsiveGas")) Theorem 2.10. For $x in \[ 0 \, 1 \]^V$, every factor in (3.2) is at least $q$, so $F_H \( x \) > 0$. The diagonal series
  $ G \( z \) = sum_(m eq.not 0) c_m z^(\| m \|) $
  has nonnegative coefficients and a positive radius of convergence, because it initially equals $- log F_H \( z \, dots.h \, z \)$ near zero. Suppose its radius $R$ were finite and at most one. Positivity of $F_H$ on the real interval gives an analytic continuation of this germ through a neighborhood of $R$. For each derivative order, monotone convergence as $z arrow.t R$ identifies the nonnegative coefficient sum at $R$ with the corresponding finite derivative $G^(\( j \)) \( R \)$. For small $h > 0$, Taylor expansion at $R$ and summation of nonnegative terms would then give
  $ sum_(m eq.not 0) c_m \( R + h \)^(\| m \|) = sum_(j gt.eq 0) frac(G^(\( j \)) \( R \), j !) h^j < oo \, $
  contrary to the definition of $R$. Thus $R > 1$ (or $R = oo$). For any $1 < r < R$, the diagonal sum bounds the absolute sum on $\| x_i \| lt.eq r$. The negative of the series exponentiates to $F_H$, since this identity holds near zero and hence throughout the polydisk. The series agrees with the real negative logarithm on the unit cube. ◻
]

We record two consequences of the proof that will be useful when comparing pressure coefficients in different local graphs.

#thm([Lemma 3.2.])[
  (Locality and identification of zero sites).  #emph[For a simple graph and a fixed multiindex $m$, write 
#[#set math.equation(numbering: n => "(3.9)")
 $ c_m = (product_i gamma_i^(m_i)) b_m . $ <pressure:incident-factors>]

 Then $b_m gt.eq 0$ depends only on the induced graph on $"supp" \( m \)$ and its odds, and is nondecreasing in each of these odds. Thus decreasing the incident products $product_(e in.rev i) \( 1 + v_e \)$ at support vertices, with the induced graph unchanged, cannot decrease $c_m$.]
  #emph[If variables on a set $S$ are fixed to zero, identifying any groups of vertices within $S$ does not change $F_H$ as a polynomial in the remaining variables, provided the new identified vertices also have site variable zero. In particular all pressure coefficients whose support avoids $S$ remain unchanged under these identifications.]
] <pressure:coefficient-locality>

#proof[
  The labeled construction above involves only types in $"supp" \( m \)$. After the factors in (3.9) are extracted, $b_m$ is a finite sum of nonnegative contributions, one for each ordinary union $D$. Apart from a nonnegative integer from the hard-edge sum and a positive factorial denominator, each contribution is
  $ v_D product_(D_0) #scale(x: 120%, y: 120%)[\[] - Z \( D_0 \; - u \, 1 + v \) #scale(x: 120%, y: 120%)[\]] . $
  For a connected graph, differentiating $Z$ with respect to a nonloop weight gives the partition function of its contraction, which is negative by (3.8); differentiating in a loop weight gives the partition function with that loop removed, also negative. Hence every factor $- Z$ is nondecreasing in the edge weights. Adding an allowed induced edge merely adds nonnegative terms as well. This proves the first assertion, with parallel edges combined before applying it.
  For the second assertion, fix the states of the original edges. Every component meeting $S$ has factor one in (3.2). Identifying vertices in $S$ only merges some of these components and leaves all other components unchanged. The product of factors is therefore unchanged for every edge state. The independent edge law is unchanged as well; edges that become loops can be retained. Taking expectations proves the polynomial identity, and taking its logarithm at zero proves the coefficient identity. ◻
]

=== 3.2 Hub links and restricted correlation inequalities <hub-links-and-restricted-correlation-inequalities>

Return to the augmented graph and the products $s_i$ in (3.3). The pressure expansion now gives comparison inequalities for its incident links.

#thm([Lemma 3.3.])[
  (Adjacent and cofacial Rayleigh inequalities).  #emph[In every finite FK graph with $0 < q < 1$, two distinct edges incident to a common vertex have nonpositive covariance of their opening indicators. In a plane graph the same conclusion holds for two distinct edges incident to a common face. Both statements remain valid after deleting or contracting any other edges.]
] <lem:adjacent-rayleigh>

#proof[
  Regard the common vertex as $o$, remove it to obtain $H$, and regard its incident nonloop edges as hub links. By (3.3) and Theorem 7, the part of $log Z_(H + o)$ depending on those links is
  #[#set math.equation(numbering: n => "(3.10)")
   $ sum_h log \( 1 + v_h \) - sum_(m eq.not 0) c_m product_h \( 1 + v_h \)^(- m_(i \( h \))) . $ <pressure:hub-log>]
  Every monomial in the second sum has nonnegative mixed derivative in the odds of two distinct links, including links at the same site. The first sum has mixed derivative zero. Absolute convergence on a larger polydisk justifies termwise differentiation, including at zero link odds by continuity. Thus $partial_(v_e) partial_(v_f) log Z lt.eq 0$ for distinct incident edges. For positive odds,
  #[#set math.equation(numbering: n => "(3.11)")
   $ partial_(v_e) partial_(v_f) log Z = frac("Cov" \( upright(bold(1))_({ e upright(" open") }) \, upright(bold(1))_({ f upright(" open") }) \), v_e v_f) . $ <pressure:rayleigh-derivative>]
  Loops are independent of all other edge states and cause no exception.
  For the plane statement, complementary dual edges have odds $q \/ v_e$. Two primal edges on a common face become two dual edges at a common vertex. Complementing both opening indicators preserves their covariance, so the adjacent inequality in the dual gives the claimed cofacial inequality. Zero odds and contraction limits follow by continuity of finite partition functions after removal of their common leading factors. ◻
]

#thm([Lemma 3.4.])[
  (Monotonicity of tested network connections).  #emph[Let $a \, o$ be vertices in a finite graph. Adding or strengthening an edge incident to $o$ does not decrease $bb(P) \( a arrow.l.r o \)$. The same holds in a plane graph if the added edge and an auxiliary connection test edge from $a$ to $o$ can be drawn cofacially in the graph containing both edges. In particular, adding vertices to a terminal by identification does not decrease its connection probability to another fixed terminal.]
  #emph[For any three vertices $a \, b \, o$, 
#[#set math.equation(numbering: n => "(3.12)")
 $ bb(P) \( a arrow.l.r o \, med b arrow.l.r o \) gt.eq bb(P) \( a arrow.l.r o \) bb(P) \( b arrow.l.r o \) . $ <pressure:root-correlation>]

]
] <pressure:network-monotonicity>

#proof[
  Add a distinct auxiliary edge $f$ between $a$ and $o$, initially of odds zero. Its logarithmic partition derivative is
  #[#set math.equation(numbering: n => "(3.13)")
   $ partial_(v_f) log Z\|_(v_f = 0) = bb(P) \( a arrow.l.r o \) + q^(- 1) bb(P) \( a ↮ o \) = q^(- 1) - \( q^(- 1) - 1 \) bb(P) \( a arrow.l.r o \) . $ <pressure:test-edge>]
  The mixed derivative with respect to the strengthened edge is nonpositive by Lemma 9. Because $q^(- 1) - 1 > 0$, the tested connection probability is nondecreasing. The cofacial argument is identical. Sending incident auxiliary odds to infinity proves the terminal-identification assertion.
  For (3.12), induct on the number of edges, discarding loops. If no nonloop edge touches $o$, both tested events are constant. Otherwise condition on an edge $e$ incident to $o$. The conditional laws are FK on the deletion and contraction minors, and their conditional covariance is nonnegative by induction. Moreover, each of the two conditional means is at least as large when $e$ is open as when it is closed: vary its odds from zero to infinity in the connection monotonicity just proved. The covariance of these two conditional means is consequently nonnegative. The conditional covariance identity proves the induction step. Cases in which a tested vertex is contracted to $o$ simply make its event constant one. ◻
]

The pressure coefficients encode more than derivative signs. After weighting by the multiplicity at a root, they form a probability law on connected vertex multisets. Wiring a set then becomes the event that the multiset meets it. In particular, unions of target sets can be compared in one fixed probability space, even though their FK laws have different wires. The unrooted coefficients $c_m$ have a second role: their mass over multisets meeting a set gives its full-wiring log gain, up to the single constant for the surviving wired component. The lemma records both forms.

#thm([Lemma 3.5.])[
  (Rooted coverage representation).  #emph[For $a in V$, the numbers 
#[#set math.equation(numbering: n => "(3.14)")
 $ mu_H^a \( m \) = q / u m_a c_m $ <pressure:rooted-law>]

 define a probability law on finite nonempty vertex multisets with connected support containing $a$. In the graph with hub links above, 
#[#set math.equation(numbering: n => "(3.15)")
 $ bb(P)_(H + o) \( a ↮ o \) = sum_m mu_H^a \( m \) x^m . $ <pressure:rooted-nonconnection>]

 If $S subset.eq V$ is nonempty, let $H \/ S$ identify precisely the vertices of $S$, with no other new identifications. Then 
#[#set math.equation(numbering: n => "(3.16)")
 $ bb(P)_(H \/ S) \( a arrow.l.r S \) = mu_H^a { m : "supp" \( m \) ∩ S eq.not diameter } . $ <pressure:rooted-hit>]

 Here $S$ on the left denotes the collapsed vertex. Equivalently, adjoin a fresh hub with exactly one infinite-odds link from each site of $S$ and no other incident links. Any identifications already represented in $H$ are retained. Writing $k_S \( A \)$ for the number of open components meeting $S$, 
#[#set math.equation(numbering: n => "(3.17)")
 $ K_H \( S \) := log bb(E)_H t^(k_S) = sum_("supp" \( m \) ∩ S eq.not diameter) c_m . $ <pressure:coverage>]

 In particular $K_H$ is a nonnegative coverage function, $K_H \( { a } \) = log t$, and 
#[#set math.equation(numbering: n => "(3.18)")
 $ K_H \( S \) + K_H \( T \) - K_H \( S union T \) = sum_("supp" \( m \) ∩ S eq.not diameter\
"supp" \( m \) ∩ T eq.not diameter) c_m gt.eq 0 . $ <pressure:double-coverage>]

]
] <lem:rooted>

#proof[
  Differentiate (3.3) with respect to $s_a$:
  #[#set math.equation(numbering: n => "(3.19)")
   $ s_a partial_(s_a) log Z_(H + o) = 1 + sum_m m_a c_m x^m . $ <pressure:hub-derivative>]
  This derivative has a second interpretation. Conditional on the original open graph, the component $C_a$ has hub-link factor $s_(C_a) - u$. Its contribution to the derivative is
  $ frac(s_(C_a), s_(C_a) - u) = 1 + frac(u, s_(C_a) - u) \, $
  while its conditional probability of having no hub link is $q \/ \( s_(C_a) - u \)$. Averaging under the marginal original-edge law of the augmented graph and comparing with (3.19) proves (3.15). At $s_i = 1$ for every $i$, the hub is isolated, so the right side equals one. Nonnegativity and the support assertion now follow from Theorem 7. For the $H \/ S$ specialization, adjoin a fresh hub with links only at $S$ and send their odds to infinity. Then $x_i = 0$ on $S$ and $x_i = 1$ elsewhere, giving (3.16), including when $a in S$.
  For (3.17), put $x_i = upright(bold(1))_({ i in.not S })$ in (3.2). A component meeting $S$ then contributes one instead of q. Hence
  $ frac(F_H \( upright(bold(1))_(V \\ S) \), F_H \( upright(bold(1))_V \)) = bb(E)_H q^(- k_S) . $
  Take logarithms and use (3.4). For a singleton, $k_({ a }) = 1$ in every configuration, so $K_H \( { a } \) = log t$. The final identity is the inclusion-exclusion identity for the two support-hitting events in the nonnegative sum. ◻
]

The rooted law controls connection probabilities, while (3.17) measures the gain from full boundary wiring. We first record two quantitative forms of the connection statement. Adjoin a fresh vertex $o$ with exactly one odds-$v$ link to each site of $I subset.eq V$ and no other incident links. Then

#[#set math.equation(numbering: n => "(3.20)")
 $ bb(P) \( a arrow.l.r o \) = bb(E)_(mu_H^a) #scale(x: 120%, y: 120%)[\[] 1 - \( 1 + v \)^(- N_I) #scale(x: 120%, y: 120%)[\]] \, #h(2em) N_I = sum_(i in I) m_i . $ <pressure:finite-spokes>]

In particular this probability is between $frac(v, 1 + v) mu_H^a \( N_I > 0 \)$ and $mu_H^a \( N_I > 0 \)$, uniformly in the number of links. Second, if $A$ and $T$ are nonempty disjoint vertex sets, define

#[#set math.equation(numbering: n => "(3.21)")
 $ g_H \( A \, T \) = bb(P)_(H \/ \( A \, T \)) \( A arrow.l.r T \) \, $ <pressure:network-g>]

where each of the two sets is separately identified. In this law, connection is equivalent to an open path in the represented base graph $H$ from a vertex of $A$ to a vertex of $T$, using no hop from either of these two new wires. Indeed a shortest quotient connection has a segment from its last departure from the first wire to its first arrival at the second wire with no wire hop in between. If the edges of $H$ are physical edges and each vertex is a single physical vertex, this is an actual physical path. If $H$ arose from an earlier physical graph by other identifications, the path may pass through one of those quotient vertices. Recovering a path in the earlier physical graph then requires an explicitly available open connection between the incidences used at each such class. Apply (3.16) on the fixed graph $H \/ A$ with root the collapsed $A$. The union bound under this single multiset law gives

#[#set math.equation(numbering: n => "(3.22)")
 $ g_H \( A \, T_1 union T_2 \) lt.eq g_H \( A \, T_1 \) + g_H \( A \, T_2 \) \, $ <pressure:subadditivity>]

whenever both target sets are disjoint from $A$. They need not be disjoint from each other. Symmetry gives the corresponding assertion for the first terminal.

=== 3.3 A no-hit comparison without planarity <a-no-hit-comparison-without-planarity>

It is important not to confuse the preceding network monotonicity with the effect of wiring the target of an as-yet unwired hit event. For that operation the comparison has the opposite direction.

#thm([Lemma 3.6.])[
  (Wiring an unwired target).  #emph[Let $a$ be a vertex and $S$ a nonempty vertex set in any finite graph $H$. The probability that the open component of $a$ meets $S$ is at least its probability after all vertices of $S$ have been identified: 
#[#set math.equation(numbering: n => "(3.23)")
 $ bb(P)_H \( a arrow.l.r S \) gt.eq bb(P)_(H \/ S) \( a arrow.l.r S \) . $ <pressure:general-hit-comparison>]

 The original graph may already contain identifications, including a wire represented by the root $a$.]
] <pressure:general-no-hit>

#proof[
  If $a in S$, both probabilities are one. Otherwise induct on the number of edges, ignoring independent loops. If no nonloop edge is incident to $S$, both probabilities are zero. Choose a nonloop edge $e$ with endpoint $s in S$. Write $mu = bb(P)_H$, $nu = bb(P)_(H \/ S)$, and let $alpha \, beta$ be their respective probabilities that $e$ is open. To form $H \/ S$, add auxiliary links from $s$ to all other vertices of $S$ and send their odds to infinity. Every such link is incident to $e$. Lemma 9 therefore gives
  #[#set math.equation(numbering: n => "(3.24)")
   $ alpha gt.eq beta . $ <pressure:target-edge-marginal>]
  For $j = 0 \, 1$, let $h_j$ and $tilde(h)_j$ be the conditional hit probabilities under $mu$ and $nu$, respectively, given the state $j$ of $e$. Conditional FK laws are deletion and contraction minors. Identification of $S$ commutes with both operations, with its image used after contraction. The induction hypothesis therefore gives $h_j gt.eq tilde(h)_j$. If $e$ becomes a loop in $H \/ S$, its state is independent of the hit event and $tilde(h)_1 = tilde(h)_0$. Otherwise it is incident to the collapsed target terminal, and Lemma 10 gives $tilde(h)_1 gt.eq tilde(h)_0$. Thus
  $ bb(P)_H \( a arrow.l.r S \) & = alpha h_1 + \( 1 - alpha \) h_0\
 & gt.eq alpha tilde(h)_1 + \( 1 - alpha \) tilde(h)_0\
 & gt.eq beta tilde(h)_1 + \( 1 - beta \) tilde(h)_0 = bb(P)_(H \/ S) \( a arrow.l.r S \) . $
  If contraction brings $a$ into the image of $S$, the corresponding conditional probabilities are both one. Zero odds are obtained by continuity, or by deleting those edges at the start. ◻
]

=== 3.4 Cofacial partition gains <cofacial-partition-gains>

We next isolate the partition-function form of cofacial comparison. It will also justify erasing an exposed component in later cap arguments. A plane graph here has a fixed tame embedding; incidences on different banks of a cut are distinct incidences.

#thm([Lemma 3.7.])[
  (Cofacial gain and exposed erasure).  #emph[Let $X$ be a finite collection of auxiliary edges between vertices of a plane graph $K$, and let $h$ be an original edge. Suppose that, in the drawing containing all these edges, $h$ and each edge of $X$ are cofacial. For fixed nonnegative auxiliary odds, the gain 
#[#set math.equation(numbering: n => "(3.25)")
 $ Z_(K + X) / Z_K $ <pressure:gain>]

 is nonincreasing in the odds of $h$.]
  #emph[In particular, suppose $B eq.not diameter$, $X$ is an auxiliary tree with vertex set exactly $B$, and the drawing of $K + X$ has a face incident to a vertex $a$ and to every edge of $X$. Let $U$ be a connected vertex set in $K$ containing $a$ and disjoint from $B$. Then 
#[#set math.equation(numbering: n => "(3.26)")
 $ bb(E)_(K - U) t^(k_B - 1) gt.eq bb(E)_K t^(k_B - 1) . $ <pressure:erasure-gain>]

 The same conclusion holds if $U$ is the vertex set of an open component containing $a$.]
] <pressure:cofacial-gain>

#proof[
  Raise the auxiliary odds successively from zero to their prescribed values. The logarithm of (3.25) is the sum of the integrals of $partial_(v_f) log Z$ for $f in X$ during these changes. Its derivative with respect to the odds of $h$ is nonpositive by the cofacial assertion of Lemma 9. This proves the first statement; all embeddings are kept fixed, even when an edge has odds zero.
  For the second, delete the edges of $K$ incident to $U$ in an exposed order. Start at the face sector incident to $a$. Once one sector at a vertex of $U$ is exposed, delete its incident edges successively around its cyclic fan, thereby enlarging the same face. An edge leading to another vertex of $U$ exposes a sector there. A spanning tree of the connected set $U$ ensures that this procedure reaches every vertex of $U$. All original edges incident to $U$ can therefore be deleted, and every edge at its deletion borders the expanding face. The edges of $X$ remain on its boundary, because none touches $U$ and deleting an edge never splits a face. If the deleted edge has the same face on both sides, that face remains available along both banks; otherwise its two incident faces merge. A loop can be removed without affecting any gain. At each step the first part of the lemma shows that the auxiliary-edge gain cannot decrease. Isolated vertices left in $U$ contribute the same factors to numerator and denominator and can be discarded.
  Finally send every auxiliary odds to infinity and divide the gain by their product. For a fixed original edge state, the tree $X$ identifies all $k_B$ components meeting $B$, changing the cluster count by $- \( k_B - 1 \)$. The limiting gain is consequently $bb(E)_K q^(1 - k_B)$, and after erasure it is $bb(E)_(K - U) q^(1 - k_B)$. This proves (3.26). An open component is connected in the underlying graph, so it satisfies the same geometric hypothesis. ◻
]

For example, if $a$ does not hit $B$ and one conditions on its component vertex set $U$, the unremoved graph has FK law on $K - U$. The weight for additionally wiring $B$ is $t^(k_B - 1)$. Equation (3.26) says that its conditional mean on this no-hit event is at least its unconditional mean. Weighting by it therefore does not decrease the no-hit probability. This gives a planar partition-gain proof of the special case of Lemma 12 used below, as well as the more explicit erasure comparison needed for boundary partitions.

=== 3.5 Interlacing boundary connections <interlacing-boundary-connections>

Let $H$ be embedded in a topological closed disk. An electrode is a nonempty set of boundary vertices contained in a specified closed boundary arc. We require that its vertices are accessible from the exterior on that arc: an arbitrarily small outward extension can reach them without crossing the graph. Separate electrodes below lie on disjoint such arcs; unmarked vertices may occupy the gaps. This convention includes ordinary lattice polygons and their cut surfaces.

Figure 3 shows the separation geometry in an ordinary physical graph. The probability inequality requires the conditional argument below, since its two input probabilities have different boundary wires.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.75, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  arc((0.7396, 1.586), start: 65deg, stop: 115deg, radius: 1.75, stroke: (thickness: 2.0pt))
  content((1.286e-16, 2.1), [#text(size: 9pt)[$A$]])
  arc((1.586, -0.7396), start: -25deg, stop: 25deg, radius: 1.75, stroke: (thickness: 2.0pt))
  content((2.1, 0), [#text(size: 9pt)[$C$]])
  arc((-0.7396, -1.586), start: -115deg, stop: -65deg, radius: 1.75, stroke: (thickness: 2.0pt))
  content((1.286e-16, -2.1), [#text(size: 9pt)[$B$]])
  arc((-1.586, 0.7396), start: 155deg, stop: 205deg, radius: 1.75, stroke: (thickness: 2.0pt))
  content((-2.1, 2.572e-16), [#text(size: 9pt)[$D$]])
  bezier((0, 1.75), (0.1, -0.45), (-0.75, 0.7), (0.7, 0.15), stroke: (thickness: 1.0pt))
  bezier((0.1, -0.45), (0, -1.75), (-0.4, -0.95), (0.15, -1.2), stroke: (thickness: 1.0pt))
  bezier((-1.75, 0), (0.15, 0.2), (-0.8, -0.45), (-0.35, 0.2), stroke: (thickness: 1.0pt))
  bezier((0.15, 0.2), (1.75, 0), (0.65, 0.2), (1.1, 0.5), stroke: (thickness: 1.0pt))
  content((-0.7, 0.9), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$P$]]])])
  content((0.95, 0.55), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$Q$]]])])
  content((3.05, 0.6), [#box(width: 6.3cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 9pt)[Boundary order: $A,C,B,D$.#linebreak() The two electrodes in each $g$ are wired separately.#linebreak() Actual $A$--$B$ and $C$--$D$ witnesses must meet.]])], anchor: "west")
  content((3.05, -1.1), [#text(size: 9pt)[$g(A,C) gt.eq g(A,B) g(C,D)$.]], anchor: "west")
})],
  caption: [Figure 3: The topology behind interlacing gluing. Thick boundary arcs mark the four electrode sets, not a common four-wire law: each probability $g$ wires only its own two electrodes. The curves $P \, Q$ illustrate actual witnesses and their forced meeting, not simultaneous events under one boundary condition. The probability inequality uses the restricted comparison and the extremal exploration in Lemma 14, not positive association or independence. ],
) <fig:interlacing>

#thm([Lemma 3.8.])[
  (Interlacing gluing).  #emph[Suppose four electrodes occur in cyclic order $A \, C \, B \, D$ on the boundary of one disk. With $g_H$ defined by (3.21), 
#[#set math.equation(numbering: n => "(3.27)")
 $ g_H \( A \, C \) gt.eq g_H \( A \, B \) thin g_H \( C \, D \) . $ <pressure:interlacing>]

 The edge odds may be arbitrary nonnegative finite numbers. The disk embedding and electrode-access assumptions are imposed after any preexisting identifications. Apart from the two wires specified in each $g_H$, there are no further abstract ties between distinct vertices of this embedded graph. All path witnesses in the proof use edges of this represented graph $H$ before the electrode wires are added. If $H$ is a quotient of an earlier physical graph, the statement alone does not assert that those paths lift to physical paths in the earlier graph.]
] <lem:interlacing>

#proof[
  Our base law has $A \, C$ separately wired. First we compare an $A$–$B$ path in $H$ with a network hit. We then expose an extremal such witness and compare the uninspected $C$ side with the separate $C \, D$ network. The two comparisons will give the two factors on the right of (3.27).
  ===== 3.5.1 From a network hit to a path in $H$. <from-a-network-hit-to-a-path-in-h.>
  Denote the collapsed $A$ by $a$. Lemma 12 says that the probability that the component of $a$ hits the as-yet unwired set $B$ is at least the corresponding probability when $B$ is also wired. In the latter law, its $A$-to-$B$ connection probability is at least $g_H \( A \, B \)$. Indeed, realize the additional $C$ wire by a chain of exterior links along its arc. This chain and a test edge joining exposed representatives of $A$ and $B$, drawn farther outside, are cofacial. Apply Lemma 10 and then take the wire limits.
  Let $S$ be the event that there is an open path in $H$ from $A$ to $B$, using no electrode identification as a hop. If $a$ hits $B$ in the $A \, C$ quotient but $S$ fails, a shortcut through $C$ must have been used. The initial part of such a quotient path, through its first visit to $C$ and after its last departure from $A$, is an open $A$-to-$C$ path in $H$. Jumps within $A$ alone cannot produce a hit of $B$ without an open $A$-to-$B$ path in $H$. Consequently, writing $T = { A arrow.l.r C }$ in the current law,
  #[#set math.equation(numbering: n => "(3.28)")
   $ bb(P) \( S \) + bb(P) \( T ∩ S^c \) gt.eq g_H \( A \, B \) . $ <pressure:physical-hit>]
  ===== 3.5.2 A measured separator with an uninspected side. <a-measured-separator-with-an-uninspected-side.>
  We now expose such an $A$-to-$B$ path from the $D$ side, leaving its $C$ side uninspected. Here are explicit details, including boundary contacts. Only for the search, add disjoint exterior spokes from $A$ to a terminal $s$ and from $B$ to a terminal $s'$. The spokes are declared traversable by the search; they are not sampled edges and do not add any FK identifications. Choose a slightly enlarged disk with $s \, s'$ on its boundary so that the spoke interiors are inside it. The electrode accessibility assumption lets each $C$ vertex retain access to the boundary arc on one side of $s \, s'$ and each $D$ vertex retain access to the other, without crossing a spoke or a graph edge. Call these the $C$ and $D$ sides.
  Split the exterior face at $s \, s'$ and seed the search only at its $D$-side face. Query an edge from a reached face and enter its opposite face only when that primal edge is closed. Process the edges incident to reached faces until the $C$ side is reached or no such unqueried edge remains. Empty regions of the drawing can be subdivided by dummy closed edges, whose dual crossings are free; this merely formalizes the face search. The finite planar path/cut alternative says that it reaches the other side exactly when there is no open $s$-to-$s'$ path. One proof is to trace the boundary of the primal vertices reachable from $s$: in the absence of the connection, this boundary contains a separating closed-primal dual crosscut. Conversely, such a crosscut intersects every primal connection. An open $s$-to-$s'$ path is equivalent to $S$.
  On $S$, the explored dual component is exhausted on the $D$ side. Every edge on its frontier was queried and is open if it prevents further dual exploration. Setting every unqueried edge of $H$ closed cannot enlarge the explored dual component, since all edges incident to it have already been queried. The path/cut alternative therefore still supplies an open $s$-to-$s'$ path in this modified configuration. Choose a simple such path by a fixed deterministic rule. It consists of queried open edges and exactly one initial and one final spoke, so its portion $gamma$ in $H$ is an open $A$-to-$B$ path determined by the exploration record.
  No reached face is strictly on the $C$ side of this simple path: the explored dual component starts on the other side and cannot cross an open primal path or an exterior spoke. Hence no edge of $H$ whose interior is strictly on the $C$ side was queried. If $gamma$ meets $C$, event $T$ already holds. Otherwise all $C$ vertices lie on its $C$ side, while all $D$ vertices lie on its $D$ side or on the path. These assertions follow also for original boundary contacts by using the retained exterior access curves in the enlarged disk.
  ===== 3.5.3 The conditional connection comparison. <the-conditional-connection-comparison.>
  Condition on a successful search record for which $gamma$ does not meet $C$. Finite FK domain Markov gives the ordinary FK law on the unqueried graph with identifications induced by the queried open connections and the original $A \, C$ wires. Restricting to the right, or $C$-side, subgraph, this means that $gamma$ is wired, any $A$ vertices on that side are tied to it, and $C$ is wired separately. The rest attaches only through the path or that same $A$ wire. There are no additional ties from the fictitious $B$ spokes: they were only a device for defining the search. Integrating the other side therefore introduces no further boundary condition.
  Dropping the extra $A$ vertices from the first terminal cannot increase its tested connection probability by Lemma 10. The conditional chance of $T$ is consequently at least the pure $gamma$-to-$C$ network probability in this right subgraph. To compare that probability with $g_H \( C \, D \)$, start instead in the full $C \, D$-wired graph and add all vertices of $gamma$ to the $D$ terminal. This cannot decrease its connection probability to $C$. After this identification, the entire left subgraph, including $D$, attaches to the right subgraph through one wired vertex. FK partition functions factor across a one-vertex attachment: if $H_1 \, H_2$ meet at just a wired vertex, then $k \( A_1 union A_2 \) = k \( A_1 \) + k \( A_2 \) - 1$, so the extra partition factor cancels from all probabilities determined on $H_1$. Thus the enlarged-terminal probability in the full graph is exactly the pure $gamma$-to-$C$ probability on the right. It follows that
  #[#set math.equation(numbering: n => "(3.29)")
   $ bb(P) \( T divides upright("successful search record") \) gt.eq g_H \( C \, D \) . $ <pressure:conditional-interlacing>]
  The same inequality is automatic if $gamma$ already meets $C$.
  This decomposition remains valid if the simple path touches the original boundary several times: work in the enlarged disk, assign off-path edge interiors to their respective sides, and observe that the only shared graph vertices are path vertices. Any loops created at the wire are independent and cancel. The search is adaptive but queries only determined edge states; conditioning on a record is exactly a finite domain Markov conditioning and imposes no event on the unqueried right edges.
  Average (3.29) over the successful records. Since $g_H \( C \, D \) lt.eq 1$, (3.28) yields
  $ g_H \( A \, C \) = bb(P) \( T \) & gt.eq g_H \( C \, D \) bb(P) \( S \) + bb(P) \( T ∩ S^c \)\
 & gt.eq g_H \( C \, D \) #scale(x: 120%, y: 120%)[\[] bb(P) \( S \) + bb(P) \( T ∩ S^c \) #scale(x: 120%, y: 120%)[\]]\
 & gt.eq g_H \( C \, D \) g_H \( A \, B \) \, $
  as required. ◻
]

#prodef([Remark 3.9.])[
  (Scope of the comparisons).  The inequalities above concern tested network connections, rooted connection events, or specified cofacial changes. They assert neither positive association for arbitrary increasing events nor stochastic monotonicity under arbitrary boundary wiring. Lemma 14 is a statement about four interlacing electrodes in a single disk, not an overlapping-rectangle gluing principle or an arbitrary-boundary-condition crossing estimate.
] <pressure:scope>

== 4 Rectangle networks and boundary partition comparisons <sec:rectangles>

This section has two outputs. Proposition 22 gives rectangle crossing bounds when the two crossing electrodes are wired separately and the remaining boundary is ordinary. Lemmas 24 and 27 compare partition-function gains from caps on separate accessible boundary arcs. The first output supplies local connections; the second controls how those connections and local laws change when a region is attached to its exterior. Both use only the finite comparisons of Section 3 and planar geometry.

The rectangle argument is by contradiction. Near-square bounds and interlacing will turn a vanishing crossing probability into many almost-certain crossings of winding corridors. A geometric packing bound rules out that conclusion. We prove the packing bound, use it to establish Proposition 22, and then turn to the boundary partition comparisons.

Throughout, $0 < q < 1$ is fixed, $v = sqrt(q)$, and $t = q^(- 1)$. For a finite graph $G$ and two disjoint nonempty vertex sets $A \, B$, write

$ g_G \( A \, B \) = bb(P)_(G \/ \( A \, B \)) \( A arrow.l.r B \) \, $

where $G \/ \( A \, B \)$ means separate contraction of $A$ and $B$. Unless explicitly specified, the graphs used below consist of physical edges and have no other identifications. The tested event is connection of the two quotient vertices. In that setting, this two-wire law is equivalent to the existence of an actual open path from $A$ to $B$ in $G$. With additional wires, that equivalence must be checked afresh.

An accessible boundary interval will mean an interval on the boundary of a topological disk containing its marked vertices in their boundary order, with all physical-edge incidences on the disk side. Equivalently, narrow outward prolongations put each marked vertex in a single boundary slot with an inward physical-edge fan. Wires on such an interval can be drawn as links in a narrow exterior cap. A noncrossing partition of an interval means a partition realizable by nonintersecting links in that cap.

=== 4.1 The permitted finite comparisons <the-permitted-finite-comparisons>

We first record precisely which consequences of Section 3 will be used. Adding vertices to a tested terminal does not decrease $g$: realize the added contractions by edges incident to that terminal and apply Lemma 9 against a connection test edge. Moreover, Lemma 11 gives

#[#set math.equation(numbering: n => "(4.1)")
 $ g_G \( A \, B_1 union B_2 \) lt.eq g_G \( A \, B_1 \) + g_G \( A \, B_2 \) $ <rect:subadditivity>]

whenever the electrodes are disjoint from $A$. Indeed the three quantities are hitting probabilities under the same rooted-multiset law on $G \/ A$. The analogous inequality holds in the first terminal.

There is also a restricted geometric extension comparison. To test connection of two exposed terminals, draw an auxiliary edge between them in the exterior face and take its odds to zero. Its partition-function derivative is

$ bb(P) \( upright("connection") \) + q^(- 1) bb(P) \( upright("separation") \) . $

Thus the cofacial form of Lemma 9 says that adding or strengthening an edge cofacial with this test edge does not decrease the tested connection probability. Auxiliary wire links can first have finite positive odds and then be contracted by sending those odds to infinity.

#thm([Lemma 4.1.])[
  (Exposed rectangle extension).  #emph[Suppose that a closed lattice rectangle is contained in a larger closed lattice rectangle, and that its two terminal intervals lie on the common boundary and remain accessible from the exterior. Adding the remaining rectangle edges, without changing the terminals, does not decrease $g$. The same conclusion holds for the uses below in which a terminal support is an interval made of two sides meeting at a corner, provided that the complement of the smaller closed rectangle has exterior access away from the terminal intervals.]
] <rect:extension>

#proof[
  Draw successive links along the terminal intervals narrowly outside the rectangles, and a test edge between exposed representatives in the remaining main exterior face. This edge has two incident exterior sectors. An edge of the larger rectangle not belonging to the smaller one has a point outside the smaller closed rectangle. That point can be joined through the complement of the smaller rectangle to an exterior gap away from the wire intervals, crossing only edges to be removed. Perturb the route off vertices. Starting from the two test-edge faces, delete edges encountered on these routes by face expansion. At each deletion the edge being removed is cofacial with the test edge. The cofacial comparison therefore makes connection no larger after deletion. The cap links do not obstruct these routes: they lie along the common boundary intervals, and no added rectangle edge lies in their narrow outer caps. Take the wire limits after the finite-odds comparison. ◻
]

Lemma 14 applies to cyclically ordered boundary electrodes $A \, C \, B \, D$ and gives

#[#set math.equation(numbering: n => "(4.2)")
 $ g_G \( A \, C \) gt.eq g_G \( A \, B \) g_G \( C \, D \) . $ <rect:interlacing>]

The following version covers the endpoint contacts between side intervals that occur in the square constructions.

#thm([Corollary 4.2.])[
  (Interlacing with endpoint abutments).  #emph[Let $G$ be a finite ordinary graph embedded in a closed disk, with the edge odds of this section. Let the nonempty electrodes $A \, C \, B \, D$ be carried, in that cyclic order, by four accessible nondegenerate closed boundary arcs. Their relative interiors are pairwise disjoint, and only consecutive arcs in this cyclic order may share an endpoint. Assume 
$ A ∩ C = A ∩ B = C ∩ D = diameter . $

 At every shared boundary incidence, the full physical-edge fan lies on the disk side. In a slightly enlarged disk, choose distinct boundary points $s \, s'$, exterior spokes from $A$ to $s$ and from $B$ to $s'$, and outward access arcs from every $C$ vertex to one of the two open components of the enlarged boundary minus ${ s \, s' }$ and from every $D$ vertex to the other. The spokes and access arcs can be chosen with interiors disjoint from the graph and from one another. They may meet only at a designated shared electrode endpoint, except that the $A$ spokes may meet at $s$ and the $B$ spokes at $s'$. Then (4.2) holds.]
] <rect:interlacing-abutments>

#proof[
  The $A \, C$ caps are disjoint. In their wired law, Lemma 12 still compares a hit of the as-yet unwired set $B$ with the law that also wires its image, even if $B$ has a shared endpoint with $C$. In comparing the latter law with the $A \, B$ law, adding the $C$ wire enlarges the $B$ terminal when $B ∩ C eq.not diameter$; otherwise it is the same exterior cofacial addition as in Lemma 14. If a hit in the $A \, C$ quotient uses $C$ as a shortcut, its first visit to $C$ already gives the desired connection; otherwise it contains an open $A$-to-$B$ path in $G$. Thus the initial event comparison in that proof also remains valid.
  Use the spokes and access arcs from the hypotheses in the extremal search. If its path $gamma$ meets $C$, the desired connection already holds. Otherwise the access arcs place every $C$ incidence on the uninspected side, and every $D$ incidence on the other side or on $gamma$. A shared endpoint in $B ∩ D$ or $D ∩ A$ is permitted on $gamma$; if it is not there, its assigned access sector places it on the $D$ side. Thus the separator-wiring comparison and the conditional one-vertex factorization in the interlacing proof apply unchanged. This proves (4.2). ◻
]

At each later use in this section, the output electrodes and the two ends of each input chord are disjoint. Any remaining contact is a shared corner of consecutive rectangle sides, whose inward physical fans and separate outward sectors satisfy the corollary.

=== 4.2 Square and corner bounds <square-and-corner-bounds>

For integers $w gt.eq 1$ and $h gt.eq 0$, let $R_(w \, h)$ be the graph with vertex set ${ 0 \, dots.h \, w } times { 0 \, dots.h \, h }$ and all nearest-neighbor edges between these vertices. Dimensions are in mesh steps. Let $g_x \( w \, h \)$ denote connection between its separately wired full left and right sides.

#thm([Lemma 4.3.])[
  (Easy and hard near-square crossings).  #emph[There exists $c = c \( q \) > 0$ such that, for positive integers $w \, h$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ w gt.eq h + 1 & quad arrow.r.double quad g_x \( w \, h \) lt.eq 1 - c \,\
w lt.eq h + 1 & quad arrow.r.double quad g_x \( w \, h \) gt.eq c . $ <rect:hard-square>]

]
] <rect:square>

#proof[
  Contract the boundary edges on the two tested sides. They are loops after wiring and do not affect other edges. Spherical planar duality at odds $v = sqrt(q)$ gives a dual graph consisting of the $w times h$ cell vertices, their ordinary nearest-neighbor edges, and one exterior hub with spokes to the bottom and top rows. Absence of the primal crossing is exactly an actual dual path from the bottom contacts to the top contacts through the cells, not a hop through that common hub. This is the disk path–cut alternative, obtained for example by tracing the boundary of the vertices reachable from the first primal electrode.
  Split the exterior hub into a bottom hub and a top hub. The resulting network, after rotation, is $R_(h + 1 \, w - 1)$ with its two full crossing sides wired separately; boundary edges that are loops can again be ignored. Let its connection probability be $g'$. Joining the hubs changes the weight by $q^(- 1)$ on their separation and by one on their connection. Consequently
  #[#set math.equation(numbering: n => "(4.4)")
   $ 1 - g_x \( w \, h \) = frac(q g', 1 - \( 1 - q \) g') . $ <rect:dual-relation>]
  For $w = h + 1$, the split graph is isomorphic to the original network, so $g' = g_x \( w \, h \)$. The solution in $\[ 0 \, 1 \]$ is
  $ g_x \( h + 1 \, h \) = frac(1, 1 + sqrt(q)) . $
  Absorbing an internal vertical cut into a terminal does not decrease connection. After that contraction the part beyond the cut attaches at one terminal only and factors out of the connection probability. Thus decreasing width cannot decrease $g_x$. Increasing height also cannot decrease it: first apply Lemma 16 to the old terminal intervals and then enlarge them along the new sides. Comparing with the just-established offset square proves both bounds, and rotations give the corresponding vertical bounds. ◻
]

We shall repeatedly turn deterministic contact into contact through finite-odds spokes. If a fresh hub $o$ has exactly one odds-$v$ link to each site of $I$ in a base graph rooted at $a$, and no other incident links, Lemma 11 gives

#[#set math.equation(numbering: n => "(4.5)")
 $ bb(P) \( a arrow.l.r o \) = bb(E)_(mu^a) #scale(x: 120%, y: 120%)[\[] 1 - \( 1 + v \)^(- N_I) #scale(x: 120%, y: 120%)[\]] \, $ <rect:spokes>]

where $N_I$ is the total multiset multiplicity on $I$. The deterministic contact probability is $mu^a \( N_I > 0 \)$. Hence finite contact is at least $v \/ \( 1 + v \)$ times deterministic contact. This comparison can be applied to two hubs in succession, keeping the other tested terminal in the base graph at each application.

#thm([Lemma 4.4.])[
  (A corner obstruction).  #emph[There exists $c_(*) = c_(*) \( q \) > 0$ such that, for all sufficiently large $w$ and $0.9 w lt.eq h lt.eq 1.1 w$, connection in $R_(w \, h)$ between a nonempty left electrode contained in heights $\[ 0 \, w \/ 8 \]$ and the full right electrode is at most $1 - c_(*)$. The reflected and rotated statements also hold.]
] <rect:corner>

#proof[
  Enlarge the left electrode to the entire indicated low interval. Its complementary dual boundary arcs are the lower arc and the arc going around above it, which includes the uncontracted upper portion of the left side and the top. Split the dual exterior hub along these two arcs. A bounded change of density relates this split law to the dual law of the primal problem: one hub join changes any weight by a factor between one and $q^(- 1)$.
  Retain the cell grid, the spokes from its bottom row to the lower hub, and those from an available upper portion of its left column to the upper hub. Removing other spokes at either tested hub cannot increase its connection probability. By (4.5), it suffices to lower-bound the corresponding deterministic-contact network.
  In the cell grid put a square of side $m = min \( w - 1 \, h - 1 \)$ against the bottom-left corner. The upper half of its left side connects to its full right side with probability at least $c \/ 2$: reflect the square across its horizontal center line and apply (4.1) to its full left side. Interlace this chord with the full top–bottom square chord. This gives a lower bound $c^2 \/ 2$ for connection from the bottom side to the upper half of the left side. Those contacts are available among the retained dual spokes when $w$ is large; in particular they lie above the low primal electrode. Extend to the full cell grid using Lemma 16. Two applications of (4.5) and the bounded hub-splitting density therefore give a positive lower bound for the complementary dual crossing. The claimed primal upper bound follows. ◻
]

=== 4.3 Packing winding corridors with high crossing probability <packing-winding-corridors-with-high-crossing-probability>

The next argument permits arbitrary winding of the corridor walls. Its purpose is to rule out many disjoint thin channels with crossing probabilities close to one, without assuming any correlation inequality for their crossings. To see why this is the relevant obstruction, suppose that a long rectangle crossing became arbitrarily unlikely. The proof of Proposition 22 will first turn this into crossings between facing short boundary intervals with probabilities tending to one. Alternating primal and dual crossings will then isolate many disjoint two-electrode corridors whose conditional crossing probabilities are also near one. Their walls come from explored paths and may wind, so the packing statement must allow that geometry.

#prodef([Definition 4.5.])[
  (Corridors and level transversals).  In a fixed rectangle $\[ 0 \, W \] times \[ 0 \, H \]$ with positive integer dimensions, a vertical Jordan corridor is the closed region between two disjoint simple dual-lattice paths from top to bottom, together with the top and bottom intervals between them. The paths’ interior portions lie strictly inside the rectangle; their end links run from half-integer cell centers to boundary-edge midpoints. Its primal graph consists of all vertices and edges contained in the closed region. Two nonempty subsets of the top and bottom intervals are wired separately, with no other ties.
  A level transversal is a straight crosscut on a line $x = k$ or $y = k$, with $k$ an integer, joining the two longitudinal walls and otherwise lying inside the corridor. Horizontal transversals use $0 < k < H$. Every such crosscut separates the two corridor ends. Parallel transversals are disjoint and have a longitudinal order; two of them bound a subquadrilateral.
] <rect:corridor-definition>

#thm([Lemma 4.6.])[
  (High-corridor packing).  #emph[There are $epsilon.alt = epsilon.alt \( q \) > 0$ and $C = C \( q \) < oo$ with the following property. Suppose that $m$ vertical Jordan corridors in $\[ 0 \, W \] times \[ 0 \, H \]$ have pairwise disjoint closures and all have their pure two-electrode connection probabilities at least $1 - epsilon.alt$. Writing $R = max \( W \, H \, 1 \)$, for $H gt.eq 4$ one has 
#[#set math.equation(numbering: n => "(4.6)")
 $ m \( H - 2 \)^4 lt.eq C R^4 . $ <rect:packing-bound>]

]
] <rect:packing>

#proof[
  Choose $epsilon.alt$ so that $1 - epsilon.alt$ exceeds both upper bounds in Lemmas 18 and 19. Restricting a high-probability corridor between two level transversals preserves its lower bound. We shall sum fourth powers of the spans of disjoint such passages. Except for passages of total cost $O \( R^4 \)$, the square and corner obstructions force a collection of passages in the other coordinate direction with strictly larger total fourth power. Applying the same argument in both directions bounds both sums by $O \( R^4 \)$. The initial vertical crossings then give the claimed bound on their number.
  #emph[Level cuts and restriction.] We use the following elementary fact about a Jordan quadrilateral. If every end-to-end path must meet a transverse coordinate line during its interior passage, in the situations where the ends are on strict opposite sides or every such path visits both strict sides, that line contains an opposite-wall transversal. To see this, cut the disk along all its finitely many interior line crosscuts. The adjacency graph of the remaining components is a tree: each crosscut splits one disk into two. The components incident to an open part of either end form a connected subtree, as follows by walking along that end. The forcing hypothesis makes these two subtrees disjoint. An edge on the tree path between them cannot terminate on an end and cannot cut off only a same-wall pocket. It therefore corresponds to an opposite-wall transversal. There are no unaccounted corner contacts here. Endpoints of an orthogonal level cut on a dual wall have half-integer transverse coordinate, whereas the tested line has integer coordinate. Parallel intermediate levels do not meet the ends at all.
  If two transversals are put into the first and second terminal, respectively, connection does not decrease by terminal enlargement. The part between them then has its two full cut-vertex sets wired, and the discarded parts attach at just their respective single terminal. They factor out. A lattice edge crossing an integer-coordinate cut does so at a vertex of that cut; a primal path cannot pass through a cut endpoint on a dual wall. Edges along the cut are harmless loops after contraction. Thus every intervening pure subproblem has connection at least $1 - epsilon.alt$. A cut with no primal vertex would instead make the original passage impossible, so does not arise here.
  #emph[The two variation sums.] Let $V_x$ be the maximum of the sum of fourth powers of the absolute level differences for subquadrilaterals between vertical transversals, chosen with disjoint longitudinal interiors in each corridor and summed over all corridors. Define $V_y$ using horizontal transversals. The total number of candidate cuts is $O \( R^2 \)$: the disjoint simple dual walls have that total combinatorial length, and each unit wall edge has only a bounded number of integer-coordinate intersections. Consequently the maxima are finite. Interior horizontal levels near the two corridor ends give
  #[#set math.equation(numbering: n => "(4.7)")
   $ V_y gt.eq m \( H - 2 \)^4 . $ <rect:initial-variation>]
  We will show that a large value of either variation forces a strictly larger value of the other, up to an $O \( R^4 \)$ error.
  #emph[A slab core and its rectangle comparison.] Consider a selected subquadrilateral between vertical cuts whose level difference is $s > 0$. Choose integers $a < b$ strictly between its end levels. There are transversals at both levels. Among their ordered cuts choose consecutive ones of different types, and let $J$ be the closed subquadrilateral between them, with ends $e_a \, e_b$. Its longitudinal order may be either $a$ then $b$ or the reverse. There is no further opposite-wall cut at either level inside $J$. Every remaining component of either line through the interior of $J$ is therefore a same-wall crosscut cutting off a side pocket away from the ends. The pockets are nested or disjoint. Remove their outermost members, replacing each wall excursion by its straight mouth. The remaining closed Jordan disk $K$ has the same ends; its connected interior avoids both lines and hence lies in $a < x < b$. Its boundary contacts with these lines are the ends and the separate mouth intervals. A removed pocket graph attaches only through its own mouth. Assign edges on mouths to the core.
  On each longitudinal side of $K$, choose an original-wall crossing from $a$ to $b$ with interior strictly in the slab, by taking a last contact before a passage to the opposite side. Call the lower and upper crossings $alpha \, beta$ in slab order and set
  $ p_(-) & = min y \( alpha \) \, & P_(-) & = max y \( alpha \) \,\
p_(+) & = min y \( beta \) \, & P_(+) & = max y \( beta \) . $
  Each crossing separates the infinite vertical slab into an upper and a lower component. The connected interior of $K$ lies above $alpha$ and below $beta$ in this separation: it misses each crossing and meets its designated side near the corresponding wall. Points below the minimum of $alpha$ are in its lower component, and points above the maximum of $beta$ are in its upper component. It follows that
  #[#set math.equation(numbering: n => "(4.8)")
   $ p_(-) lt.eq p_(+) \, #h(2em) P_(-) lt.eq P_(+) \, #h(2em) K subset { p_(-) lt.eq y lt.eq P_(+) } . $ <rect:envelope>]
  All contacts of $K$ with either extreme vertical line lie between the heights of the corresponding endpoints of $alpha \, beta$. Moreover every path between $e_a \, e_b$ in $K$ has minimum height at most $p_(+)$ and maximum height at least $P_(-)$. For an interior transversal path, the upward vertical ray from an interior maximum of $alpha$ starts on the lower side of that path and reaches its upper side; it must therefore intersect the path. The downward ray from an interior minimum of $beta$ gives the other bound. Use interior points and limits if an extremum is at an endpoint. Approximation inside the Jordan quadrilateral gives the same statement for a general continuous end-to-end path. It also holds for paths in $J$: replace every excursion into a pocket by a path on its mouth, setting the horizontal coordinate to the mouth level and clipping the vertical coordinate to the mouth interval. Entry and exit are fixed, and this replacement cannot enlarge the transverse range of the path.
  We claim that the pure crossing probability of $J$ is at most that of the full lattice rectangle
  #[#set math.equation(numbering: n => "(4.9)")
   $ \[ a \, b \] times \[ floor.l p_(-) floor.r \, ceil.l P_(+) ceil.r \] \, $ <rect:comparison-box>]
  whose two terminal intervals contain all the respective core contact vertices on $x = a \, b$. Condition first on the pocket edges. They induce noncrossing ties within each separate mouth, and no ties between mouths. On the core the remaining law is precisely FK with these ties and the two end wires. Draw the separate mouth links and end links narrowly outside their intervals and a terminal test edge in the main exterior. Every missing rectangle edge has a point outside the closed disk $K$. Through its complement this point has access to an exterior gap not contained in $K$, crossing only missing edges. No cap link seals such a gap: its supporting interval is contained in $K$ on an extreme slab line, and the cap lies on the opposite side from the rectangle interior. Delete missing edges by face expansion from the test-edge faces. Cofacial Rayleigh compares the core below the full rectangle still carrying the separate ties. Now, and only now, enlarge the two tested terminals to absorb all their respective mouth contacts. Terminal monotonicity cannot decrease connection and subsumes every pocket tie. This proves the comparison conditionally on any pocket configuration and hence unconditionally. In particular we may further enlarge either terminal to its full rectangle side.
  Figure 4 illustrates the separate-mouth convention.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0.25), (5, 3.65), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((0, 0.65), (1.15, 0.4), (2.25, 1.1), (3.05, 0.85), (4.15, 1.3), (5, 1.05), (5, 3.2), (4.3, 2.9), (3.45, 3.4), (2.45, 2.85), (1.2, 3.1), (0, 2.6), (0, 1.8), (0.65, 1.5), (0, 1.2), close: true, fill: rgb("#f2f2f2"), stroke: none)
  line((0, 1.8), (-0.65, 1.95), (-0.9, 2.35), (-0.4, 2.75), (0, 2.6), close: true, fill: rgb("#dfdfdf"), stroke: none)
  line((0, 0.65), (1.15, 0.4), (2.25, 1.1), (3.05, 0.85), (4.15, 1.3), (5, 1.05), stroke: (thickness: 0.4pt))
  line((0, 1.2), (0.65, 1.5), (0, 1.8), (-0.65, 1.95), (-0.9, 2.35), (-0.4, 2.75), (0, 2.6), (1.2, 3.1), (2.45, 2.85), (3.45, 3.4), (4.3, 2.9), (5, 3.2), stroke: (thickness: 0.4pt))
  line((0, 0.65), (0, 1.2), stroke: (thickness: 1.8pt))
  line((5, 1.05), (5, 3.2), stroke: (thickness: 1.8pt))
  line((0, 1.8), (0, 2.6), stroke: (thickness: 0.4pt))
  line((0, -0.15), (0, 3.95), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((5, -0.15), (5, 3.95), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((0, -0.15), [#text(size: 9pt)[$x=a$]], anchor: "north")
  content((5, -0.15), [#text(size: 9pt)[$x=b$]], anchor: "north")
  content((0, 0.9), [#text(size: 9pt)[$e_a$]], anchor: "east")
  content((5, 2), [#text(size: 9pt)[$e_b$]], anchor: "west")
  content((2.5, 1.95), [#text(size: 9pt)[$K$]])
  content((3.4, 3.4), [#text(size: 9pt)[$beta$]], anchor: "south")
  content((3.05, 0.85), [#text(size: 9pt)[$alpha$]], anchor: "north")
  line((-0.53, 2.36), (-1.65, 2.8), stroke: (thickness: 0.4pt), mark: (start: "<"))
  content((-1.65, 2.8), [#text(size: 9pt)[same-wall#linebreak()pocket]], anchor: "east")
  line((0.03, 2.2), (0.9, 2.4), stroke: (thickness: 0.4pt), mark: (start: "<"))
  content((0.9, 2.4), [#text(size: 9pt)[mouth]], anchor: "west")
  line((6.75, 1.75), (6.75, 3.05), stroke: (thickness: 0.4pt))
  circle((6.75, 1.85), radius: 0.045, fill: black, stroke: none)
  circle((6.75, 2.2), radius: 0.045, fill: black, stroke: none)
  circle((6.75, 2.45), radius: 0.045, fill: black, stroke: none)
  circle((6.75, 2.55), radius: 0.045, fill: black, stroke: none)
  circle((6.75, 2.95), radius: 0.045, fill: black, stroke: none)
  bezier((6.75, 1.85), (6.75, 2.55), (6.2, 1.85), (6.2, 2.55), stroke: (thickness: 0.4pt))
  bezier((6.75, 2.2), (6.75, 2.45), (6.45, 2.2), (6.45, 2.45), stroke: (thickness: 0.4pt))
  content((7.05, 2.4), [#box(width: 3.4cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 9pt)[Condition on the pocket first. Its cap remains on this mouth.]])], anchor: "west")
  content((6.35, 0.65), [#box(width: 4.2cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 9pt)[Add missing rectangle edges before enlarging the end terminals.]])], anchor: "west")
})],
    caption: [Figure 4: A slab core cut from a winding corridor (schematic; lattice steps are suppressed). Consecutive opposite-wall cuts $e_a \, e_b$ retain the ends. Same-wall excursions beyond a slab level are pockets, removed along their mouths to obtain $K$. Each pocket induces a separate noncrossing cap on its own mouth. The rectangle comparison preserves these caps while adding missing edges; only afterwards are the contact intervals merged with their respective terminals. ],
  ) <fig:slab-pockets>
  #emph[Good slabs and their cost.] Fix a small number $tau > 0$, say $tau = 1 \/ 100$. Choose $zeta > 0$ sufficiently small compared with $tau^4$, and subsequently choose a fixed integer $S_0$ sufficiently large compared with $zeta^(- 1)$ and all lattice roundoff constants. Take a maximizing collection for $V_x$. Its terms with $s < S_0$ cost at most $O \( R^2 S_0^4 \)$, which is $O \( R^4 \)$ with these fixed choices. Group the remaining spans by $h lt.eq s < 2 h$, where $h = 2^k S_0$. Round the two end levels inward to a common integer grid of spacing $floor.l zeta h floor.r$, choosing $a \, b$ strictly inside them. Each moves by at most $zeta h + 1$, so
  $ b - a gt.eq s - O \( zeta h + 1 \) . $
  Construct one $J \, K \, alpha \, beta$ as above for each chosen passage. Call it good if
  #[#set math.equation(numbering: n => "(4.10)")
   $ \( p_(+) - p_(-) \) + \( P_(+) - P_(-) \) + \| beta \( a \)_y - alpha \( a \)_y \| + \| beta \( b \)_y - alpha \( b \)_y \| lt.eq zeta h . $ <rect:good-slab>]
  Members of the maximizing collection may share an end cut. The chosen levels $a \, b$ lie strictly between each member’s own end levels, so its subquadrilateral $J$ does not use such a common end cut. Their original side-wall subarcs have disjoint longitudinal interiors. Hence the constructed core interiors are disjoint; any remaining boundary contact only permits equality in the ordering below. For a fixed pair $a \, b$, the core disks are slab-ordered. Their bounding crossings cannot interleave: a slab crossing belonging to one core would then separate points of the connected interior of another. Minima, maxima, and the two endpoint heights of ordered disjoint crossings are ordered as well, with weak inequalities sufficient. Thus each of the four nonnegative gap sums in (4.10) telescopes to at most $H$, and their total is at most $4 H$. The number of bad choices at fixed $a \, b$ is at most $4 H \/ \( zeta h \)$. There are $O_zeta \( \( R \/ h \)^2 \)$ rounded pairs, so at this scale there are $O_zeta \( \( R \/ h \)^3 \)$ bad choices. Their contribution to $V_x$ is $O_zeta \( R^3 h \)$. Summing over the dyadic scales $h lt.eq R$ gives $O \( R^4 \)$.
  #emph[Amplification of a good passage.] For a good passage the height $P_(+) - p_(-)$ is at least $b - a - O \( 1 \)$. Otherwise the comparison rectangle (4.9) would be hard in the sense of (4.3), contradicting the connection probability at least $1 - epsilon.alt$ in $J$. Subtracting the two extrema gaps in (4.10) gives the mandatory inner span
  #[#set math.equation(numbering: n => "(4.11)")
   $ T := P_(-) - p_(+) gt.eq s - O \( zeta h + 1 \) . $ <rect:inner-span>]
  Choose integer levels a bounded distance inside $p_(+)$ and $P_(-)$. Every end-to-end path visits both strict sides of each of these levels, so the level-cut fact gives horizontal transversals. The span between two such low and high cuts is $T - O \( 1 \)$.
  If $T gt.eq 1.05 s$, that one horizontal passage already has fourth power larger than $\( 1 + gamma \) s^4$ for some fixed $gamma > 0$, once $S_0$ is large. Otherwise the height and width of (4.9) are within the aspect-ratio range of Lemma 19. Every point of each end interval must be at least $s \/ 16$, for definiteness, above the lower extreme and below the upper extreme, after increasing $S_0$ and decreasing $zeta$ if necessary. Indeed if one endpoint interval approaches an extreme more closely, the endpoint gap bound in (4.10) places all contacts on that vertical side within $s \/ 16 + O \( zeta h + 1 \)$ of that extreme. The comparison box then has a corner electrode contained in its bottom or top eighth, and Lemma 19 contradicts high connection.
  Starting from the longitudinal first end of $J$, consider the earlier of the selected low and high transversals. The original end lies in the central height range just established, while that earlier cut is near the corresponding extreme. Choose an intermediate horizontal integer level between them at distance at least $tau s$ from the extreme cut. The two ends of this first subquadrilateral are on strict opposite sides of the intermediate level, so it contains a transversal there. The resulting extra horizontal passage precedes the low–high passage and has disjoint longitudinal interior from it. This works in either order of the low and high cuts. Its span is at least $tau s$, with bounded roundoff absorbed by the choices of constants.
  The two contributions are therefore at least
  $ #scale(x: 120%, y: 120%)[\(] 1 - O \( zeta + S_0^(- 1) \) #scale(x: 120%, y: 120%)[\)]^4 s^4 + tau^4 s^4 gt.eq \( 1 + gamma \) s^4 $
  for a fixed $gamma > 0$, by choosing $zeta$ and then $S_0^(- 1)$ small enough compared with $tau^4$. The constructed horizontal passages are contained in their respective original vertical subquadrilaterals, so all chosen contributions retain disjoint interiors.
  #emph[Conclusion.] Combining the good passages and the two error bounds gives
  $ V_y gt.eq \( 1 + gamma \) \( V_x - C_0 R^4 \) . $
  The same construction with the two coordinate directions exchanged, and with the original longitudinal wall roles unchanged, gives
  $ V_x gt.eq \( 1 + gamma \) \( V_y - C_0 R^4 \) . $
  Substitution bounds each variation by a constant multiple of $R^4$. Together with (4.7), this proves (4.6). ◻
]

=== 4.4 Rectangle crossing bounds <rectangle-crossing-bounds>

We now apply the packing lemma. The first half of the contradiction argument concerns network probabilities in ordinary rectangles. The second half puts finitely many primal and dual events in one law, extracts actual crossings, and uses their unexplored sides to obtain the pure corridor laws required by Lemma 21.

#thm([Proposition 4.7.])[
  (Rectangle RSW for separate electrodes).  #emph[For every fixed $Lambda gt.eq 1$ there is $c_Lambda = c_Lambda \( q \) > 0$ such that 
#[#set math.equation(numbering: n => "(4.12)")
 $ inf_(n \, w in bb(Z)_(gt.eq 1)\
w lt.eq Lambda n) g_x \( w \, n \) gt.eq c_Lambda . $ <rect:rsw>]

 The same holds after translation, lattice rotation, reflection, or translation to the shifted dual square lattice. All probabilities refer to separate full crossing electrodes with no other wires.]
] <prop:rectangle-rsw>

#proof[
  Suppose otherwise. Lemma 18 and positivity on each fixed finite graph give a sequence with
  #[#set math.equation(numbering: n => "(4.13)")
   $ n arrow.r oo \, #h(2em) n lt.eq W_n lt.eq Lambda n \, #h(2em) g_x \( W_n \, n \) arrow.r 0 . $ <rect:degeneration>]
  All limits in $n$ below are along (4.13). Every macroscopic separation, relative interval width, and bulk clearance invoked in a convergence assertion is fixed and positive before taking that limit. These constants may depend on the finite number of chords to be used, but not on $n$. A convergence assertion for a stated class of rectangles and intervals means that it holds for every sequence of integer choices satisfying those same fixed conditions. Equivalently, the convergence is uniform over that class: a failure of uniformity would select a violating sequence, to which the same subsequence contradiction applies.
  #emph[Separated arches vanish.] For each fixed $sigma > 0$, consider ordinary rectangles with positive integer width and height at most $n \/ 8$, and two nonempty top intervals whose horizontal separation is at least $sigma n$. Their network probability tends to zero uniformly over these choices. Otherwise, after taking a subsequence, there is such a chord bounded below. Subdivide both intervals into a bounded number of subintervals of diameter at most $sigma n \/ 10 + O \( 1 \)$. By (4.1), a pair of these localized intervals still has a chord bounded below. Translate copies of its rectangle along the top of $R_(W_n \, n)$, starting at the left side, with integer displacement close to half the separation of the two localized centers. Consecutive chords interlace strictly; they retain their lower bounds by Lemma 16. Continue while the rectangles fit. A bounded number of applications of (4.2), depending only on $sigma \, Lambda$, joins the first endpoint to the last far endpoint with probability bounded below. The first lies within $n \/ 8$ of the left side and the last within $n \/ 8 + n \/ 16 + O \( 1 \)$ of the right side.
  A square of side $floor.l n \/ 2 floor.r$ at the upper-left corner has a chord from its left side to the far half of its top side bounded below: reflection and subadditivity give the half-side crossing, then interlacing with an opposite full square crossing gives the stated chord. The analogous upper-right square gives the other end chord. They interlace the long top chord to the full left and right sides. This contradicts (4.13). Reflection gives the same vanishing statement for bottom arches. Translation gives it on the shifted grid as well.
  #emph[Only aligned chords can survive.] Fix $0 < c_(-) lt.eq c_(+) lt.eq 1 \/ 8$ and $0 < theta < 1 \/ 2$. For integer square sides $c_(-) n lt.eq h lt.eq c_(+) n$, a top electrode contained in $\[ 0 \, \( 1 \/ 2 - theta \) h \]$ or in $\[ \( 1 \/ 2 + theta \) h \, h \]$ connects to the full bottom side with probability tending uniformly to zero. If not, reflect that electrode and its chord across the vertical center line. Interlace the two top–bottom chords separately with the full left–right square crossing, whose probability is bounded below. This yields chords from the left top portion to the right side and from the right top portion to the left side. Interlacing them gives a separated same-top arch, contradicting the preceding paragraph. The corresponding off-center bottom chords also vanish.
  Decompose each of the top and bottom sides into its two off-center portions and the central interval $\[ \( 1 \/ 2 - theta \) h \, \( 1 \/ 2 + theta \) h \]$, with endpoints rounded to lattice vertices. The full vertical crossing has a uniform lower bound. Subadditivity twice, and the vanishing just proved, therefore give a positive lower bound for the chord between the two central neighborhoods.
  Now use an integer strip of height $h$ and width $ell = 4 h + O \( 1 \)$, with the bound in $O \( 1 \)$ fixed, $h \/ n$ bounded above and below by fixed positive constants and both dimensions at most $n \/ 8$. Translated squares give bounded-below chords between aligned top and bottom patches of fixed positive relative width. Their centers may vary provided their distances from the vertical ends are at least $\( 1 \/ 2 + eta \) h$ for a fixed $eta > 0$.
  In this strip, consider boundary electrodes lying entirely to the left and right, respectively, of a horizontal gap. Suppose that the gap contains centers $c_1 < c_2$ whose distances from its endpoints and from each other are at least $eta h$, and whose distances from the vertical strip ends are at least $\( 1 \/ 2 + eta \) h$, for some fixed $eta > 0$. The connection probability of those electrodes tends uniformly to zero. Choose the aligned patches at these centers with length $eta h \/ 2 + O \( 1 \)$ after lattice rounding, so that the two patches are disjoint and remain in the gap. Interlace a hypothetical bounded-below chord with the aligned vertical chord at the first center, joining that top patch to the right electrode, and with the aligned chord at the second center, joining that top patch to the left electrode. The resulting chords interlace to give a forbidden separated same-top arch.
  #emph[Aligned short electrodes are crossed with probability tending to one.] Fix $theta \, eta > 0$ and equal aligned intervals on the top and bottom of this strip, each of length at least $theta h$ and contained between horizontal coordinates $\( 1 \/ 2 + eta \) h$ and $ell - \( 1 \/ 2 + eta \) h$. Contract their boundary edges. The complementary dual crossing is between the exterior arcs going around the left and right ends. Split the corresponding exterior hub into two hubs. This costs only a bounded density factor. Absorb all adjacent contact vertices into their respective hubs, which cannot decrease the network probability by terminal monotonicity. The result is an ordinary interior cell rectangle with two separately wired boundary electrodes whose horizontal coordinates are separated by the gap between the endpoints of the original intervals. This gap contains two centers satisfying the preceding fixed-clearance conditions, with constants depending only on $theta \, eta$. The preceding vanishing argument, on the shifted grid and with bounded lattice roundoff, applies to this network. Thus the complementary dual probability tends to zero, and the original aligned crossing tends to one. Smaller aligned subintervals of any fixed positive relative width are covered by the same argument.
  #emph[Many alternating network crossings.] The preceding steps have shown that every fixed aligned pair of short intervals in the indicated strip is crossed with probability tending to one. We next arrange finitely many such primal and dual crossings in a common law. Their simultaneous success will use a union bound; no correlation inequality between these events is needed.
  For definiteness take $h = floor.l n \/ 64 floor.r$ and strip width $4 h$. Choose an arbitrarily large but fixed finite ordered list of disjoint small interval labels in a central bulk part of the top side, and matching labels in the same order on the bottom. On the primal graph wire the odd intervals, each separately, by contracting their boundary edge runs. Leave no other primal wires. Round the runs so that each intervening even interval retains an uncontracted boundary-edge stretch of fixed positive relative width. Only interior labels with neighboring buffers will be used.
  Every desired odd top–bottom network connection tends to one. This follows first in the pure two-electrode graph by the aligned estimate, then in the multiwire graph by adding the other disjoint interval caps cofacially with its test edge. The deletion order is the exposed boundary face expansion used in Lemma 16.
  The dual consists of the cell grid and a common outer hub with stochastic spokes dual to all uncontracted boundary edges. Split this hub into separate hubs for the maximal complementary intervals. Since the number of intervals is fixed, the density change is bounded by a fixed power of $q^(- 1)$. We claim that each desired even top–bottom connection in this split network also tends to one, despite the finite spoke odds.
  Retain first only the two spoke patches over smaller aligned intervals. Fix a deterministic bottom subinterval wire in that range. For any fixed integer $k$, choose $k$ disjoint smaller top patches aligned within it. Each is connected to the bottom wire with probability tending to one by the pure estimate and terminal enlargement. In the single rooted-multiset law based at the collapsed bottom electrode, all $k$ patches are therefore hit with probability tending to one. Their union has multiplicity at least $k$ on that event. Formula (4.5) gives lower limit at least $1 - \( 1 + v \)^(- k)$ for the finite top-spoke connection. Since $k$ is arbitrary, this probability tends to one. Now keep this finite top-spoke graph as the base rooted at its hub. Apply the same argument to $k$ disjoint deterministic bottom subintervals, using the conclusion just established for each of them. This makes the bottom spokes finite as well, still with connection tending to one. The order of limits is first $n arrow.r oo$ for fixed $k$, then $k arrow.r oo$.
  Extra spokes at the tested hubs cannot decrease connection. Spokes of each other hub occupy its own exposed boundary interval and can be removed by exterior face expansion from the test-edge faces; reversing this removal does not decrease the tested connection. Thus the desired even events tend to one in the full split dual network. The bounded hub-joining density transfers them back to the common original law. Their event definition still uses only the individual split-hub shortcuts, not the common hub as a path shortcut.
  #emph[From networks to physical crossings.] All these finitely many primal and dual successes coexist with probability tending to one. Draw shortcuts narrowly along their separate boundary intervals, including dual spokes through the appropriate boundary-edge midpoints. Complementary primal and dual states prevent crossings of opposite-color open paths. For topology only, place the rectangle and all narrow caps inside a slightly enlarged disk, and join each designated terminal to a distinct point on its boundary by outward spokes, preserving the order of the terminal intervals. For a dual event, the shortcuts here are those of its individual split hubs, although its edge state is now sampled in the common law.
  For each network success, choose a simple witness in this enlarged disk, with the narrow cap shortcuts included as edges. Its only contacts with the enlarged boundary are its prescribed top and bottom endpoints, so it is a crosscut even if it uses another same-color cap along the way. Opposite-color witnesses are disjoint: their physical edges cannot cross, and their cap shortcuts and outward spokes occupy disjoint boundary intervals.
  Fix a successful interior label whose two opposite-color neighbors also succeed. The target crosscut places the endpoints of one neighbor on one side and those of the other neighbor on the other side. Their witnesses cannot cross the target, so they lie on those respective sides and are disjoint from each other. The region between them meets the top and bottom boundary exactly between the neighboring labels. Every other same-color cap lies outside that region: its narrow connection to its own boundary interval is disjoint from the two neighbors. The target witness therefore cannot use another same-color wire or hub. Its segment from the last departure from its initial terminal to the first subsequent arrival at its final terminal is therefore an actual physical crossing between its labeled intervals. For a dual label, the crossing retains its initial and final stochastic boundary spokes and an ordinary cell path, with no intermediate hub jump. This proves simultaneous physical success for the slightly smaller range of interior labels that has all required buffers.
  #emph[Uninspected high corridors.] Select many odd interior labels spaced by at least four. For each selected $i$, expose a physical dual crossing for label $i - 1$ from its left side, and one for label $i + 1$ from its right side. The search uses the physical cell graph with its available boundary half-extensions at that pair of intervals and fictitious always-open terminal stars confined to their outer caps. Seed the complementary-face search at the corresponding exterior side. Query an edge only from a reached face, and advance to the opposite face only when its physical bond in the path color is closed. On crossing success this exploration stays outside every blocking terminal path. Setting all unqueried edges to the nonpath state still leaves a path, by the plane path–cut alternative, so choose a simple witness measurably from the exposed edges. No edge with interior on its other side was queried. The ordered boundary spokes preserve this property at the endpoints. Stop each wall at the physical rectangle boundary-edge midpoint.
  Let $cal(R)_i$ be the combined record of the two searches, including the queried edge states and the chosen walls. Let $E_i$ be the event, determined by this record, that both searches succeed with disjoint walls in the proper order. The simultaneous physical crossings, including the odd target path separating its two neighbors, imply $bb(P) \( E_i \) arrow.r 1$.
  Fix a value of $cal(R)_i$ in $E_i$. Every fully contained primal edge between the walls, other than the deterministic boundary edges along the target wires, is uninspected, and every primal edge crossing a wall is closed. The top and bottom intervals contain exactly the two target primal wires: the wall endpoints lie in the flanking uncontracted intervals, and no exterior tie enters the corridor. Omit the boundary edges along the target wires, which are independent loops after contraction, and let $G_i$ be the remaining contained-edge graph. Finite conditioning now gives exactly the FK law on $G_i$ with the two target electrodes separately wired. Indeed the queried closed edges separate the corridor from the exterior across both walls, and the original boundary partition has no other class meeting the corridor; integrating the exterior therefore introduces no additional identification. Restoring the omitted loops with their independent ordinary law changes no crossing probability.
  Let $g_i$ be the pure corridor probability from Definition 20, measurable from $cal(R)_i$, and let $T_i$ be the target’s actual physical crossing event in the original strip. On $E_i$, such a path cannot cross either dual wall, so it is contained in the corridor. The preceding conditional law and the two-wire path equivalence give $bb(P) \( T_i divides cal(R)_i \) = g_i$ on $E_i$. Since $bb(P) \( T_i \) arrow.r 1$,
  #[#set math.equation(numbering: n => "(4.14)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] \( 1 - g_i \) upright(bold(1))_(E_i) #scale(x: 120%, y: 120%)[\]] = bb(P) \( E_i ∩ T_i^c \) arrow.r 0 . $ <rect:conditional-high>]
  Markov’s inequality gives $g_i gt.eq 1 - epsilon.alt$ on $E_i$ with probability tending to one. Perform these searches on the same configuration for each of the finitely many selected indices. Equation (4.14) was applied separately to each search; no joint unexplored independence is required. With probability tending to one all the high-corridor conclusions hold together with the intervening physical crossings. In particular intervening odd primal crossings separate different pairs of dual walls, so the resulting corridors have disjoint closures.
  The strip aspect ratio is fixed. Choose the finite number of selected labels larger than the constant allowed by Lemma 21. For large $n$, any realization with all the preceding properties violates (4.6). Such realizations have probability tending to one, a contradiction. This proves (4.12). ◻
]

=== 4.5 One-sided boundary density <one-sided-boundary-density>

The rectangle crossing bound is now proved. For the later sector and disk arguments we also need to control partition-function gains when a distant boundary wire is changed. These comparisons use Section 3 directly, independently of the rectangle crossing proposition. We return to arbitrary positive edge odds on a finite ordinary plane graph $H$ in a closed disk, with no initial wires. Lemma 24 bounds that interaction by the pure connection probability; the final subsection replaces full wires by arbitrary separate planar caps. For a nonempty vertex set $D$, let $k_D$ count physical open components meeting $D$, and put

$ K_H \( D \) = log bb(E)_H t^(k_D) \, #h(2em) Delta_H \( S \, W \) = K_H \( S \) + K_H \( W \) - K_H \( S union W \) . $

The coverage representation from Lemma 11 gives $Delta_H \( S \, W \) gt.eq 0$. Denote the full wire on $D$ by $F_D$. For a partition $X$ let $Z_X$ be the partition function on the original edge sets with weight $v_A q^(k_(H \/ X) \( A \))$, retaining any quotient loops; write $Z = Z_diameter$.

#thm([Lemma 4.8.])[
  (Auxiliary-link gain in an exposed face).  #emph[Let $e$ be a physical edge bordering a face $F$ of a finite plane graph. Let $T$ be a finite noncrossing collection of auxiliary links whose endpoints are graph vertices and whose interiors lie in $F$. At fixed positive auxiliary odds, the partition-function gain from adding all links of $T$ is nonincreasing in the odds of $e$. The conclusion passes to a prescribed partition obtained by contracting the links. Repeated boundary vertices, auxiliary loops, and redundant links are allowed in the corresponding plane minors.]
] <rect:face-gain>

#proof[
  In the drawing with all links present, start from a face sector incident to $e$. The dual adjacency graph of regions into which the links cut $F$ is connected, since the original face $F$ was connected. Remove a frontier auxiliary link to expand the reached $e$-face and repeat, also removing auxiliary links with that reached face on both sides. Eventually every link is removed. Reverse this order. At each addition, the link and $e$ are cofacial in the graph including the new link. Cofacial Rayleigh implies that its log partition gain, integrated from zero to its specified odds, is nonincreasing in the odds of $e$. Sum these log gains. The removal order may be chosen separately for each physical edge and each background graph.
  For auxiliary odds $lambda_f$, divide the augmented partition function by $product_(f in T) lambda_f$ and send every $lambda_f$ to infinity. Only the term with all auxiliary links open survives, and it is exactly the contracted-graph partition function. Retaining the same links and normalizing product after any physical minor handles links that become loops or redundant. This proves the limit statement as well. ◻
]

#thm([Lemma 4.9.])[
  (One-sided small-network density).  #emph[Let $S \, W$ be disjoint nonempty vertex sets on two disjoint accessible boundary arcs of $H$. Put $p = g_H \( S \, W \)$ and suppose $t p < 1$. For every noncrossing partition $X$ supported on $S$, 
#[#set math.equation(numbering: n => "(4.15)")
 $ 0 lt.eq log frac(Z_X Z_(F_W), Z_(X \, F_W) Z) lt.eq Delta_H \( S \, W \) lt.eq log (1 + frac(\( t - 1 \) p, 1 - t p)) . $ <rect:one-sided-density>]

]
] <lem:one-sided-density>

#proof[
  There are three steps. A component exploration bounds the number of physical crossings by a geometric tail. A covariance inequality turns that tail into the asserted upper bound on $Delta_H \( S \, W \)$. Finally, an exact full-wire identity and cofacial comparison give the two bounds for an arbitrary partition $X$.
  ===== 4.5.1 A geometric tail for crossing components. <a-geometric-tail-for-crossing-components.>
  In either the separately $S \, W$-wired law or their jointly wired law, let $L$ be the number of distinct physical components meeting both sets, before any identification. Then
  #[#set math.equation(numbering: n => "(4.16)")
   $ bb(P) \( L gt.eq j \) lt.eq p^j #h(2em) \( j gt.eq 1 \) . $ <rect:component-tail>]
  Explore whole physical components from the vertices of $W$ in their linear boundary order, skipping vertices already visited and never following a wire as a physical edge. Component searches test every incident physical edge. After a prefix, possibly stopped immediately after a crossing component, let $U$ be the explored union. Every vertex of $U$ has a path in $U$ to that prefix. On $H - U$, component counting leaves precisely the full remaining $W$ and $S$ wires, possibly joined, and no other ties. Joining them multiplies the weight of separation by $t$ relative to connection; hence the conditional probability of another crossing component is at most
  $ g_(H - U) \( W \\ U \, S \\ U \) \, $
  interpreted as zero if either set is empty.
  This last quantity is at most $p$. To verify the comparison rather than invoke arbitrary boundary monotonicity, keep all vertices of $H$ temporarily. Draw narrow exterior chains along $W$ and $S$, and a test edge from the first $W$ vertex to the facing endpoint of $S$ across the intervening gap. Starting in its gap-side face, delete the physical fan of the first $W$ vertex. This opens the inner lip of the narrowly exterior chain up to the next prefix vertex. The thin sector between a chain link and its underlying boundary interval contains no physical edge or other auxiliary link, so the exposed face can advance successively along the entire explored prefix. Continue into $U$ along paths to that prefix: deleting an onward physical edge exposes a sector at the next vertex, from which its whole physical fan can be deleted in order. At a boundary vertex the physical fan is inward and contains no interspersed auxiliary links. No chain link needs to be removed. Thus every removed physical edge is cofacial with the test edge at its removal.
  At finite positive chain odds, cofacial Rayleigh makes connection nonincreasing under these deletions. Send the chain odds to infinity. This comparison starts from the original #emph[separate]-wire graph, not from the conditional graph in which a previous crossing may have joined the electrodes. Every physical edge touching $U$ has been deleted, and the retained $W$ and $S$ chains have disjoint vertex sets; they cannot create a tie between the two sides. After contracting each chain, a test endpoint originally in $U$ is the same quotient vertex as any surviving vertex of its own electrode. Use such surviving representatives on both sides; the case of an empty surviving electrode was already assigned probability zero. Isolated vertices off the two chains factor out. Thus the remaining test is exactly the separate two-electrode problem on $H - U$, irrespective of whether the earlier conditional problem had joined wires. This proves the comparison. Each successive exploration success therefore has conditional probability at most $p$, and iteration proves (4.16), including for the initially joined law.
  ===== 4.5.2 From the tail to the full-wire interaction. <from-the-tail-to-the-full-wire-interaction.>
  We need the rank-factor covariance inequality
  #[#set math.equation(numbering: n => "(4.17)")
   $ bb(E)_H t^(k_S + k_W) gt.eq bb(E)_H t^(k_S) thin bb(E)_H t^(k_W) . $ <rect:rank-covariance>]
  Here is its finite-graph proof. More generally consider two full-wire rank factors $t^(k_D - 1)$, where each set can be joined by links inside one common physical face; the two prospective drawings may be considered separately. The invariant under minors is the inherited auxiliary drawings in one common physical face, not the original disjoint-arc description: image electrodes may overlap or shrink. Induct on the number of physical edges. Choose an edge $e$ bordering that face. For either prospective wire, its expected rank factor conditional on $e$ open is no greater than conditional on $e$ closed. Draw its auxiliary links at finite odds, peel them from a face sector incident to $e$, and add them back in reverse order. At each addition the new link and $e$ are cofacial in the graph containing both, as in Lemma 23. Cofacial Rayleigh says that its partition-function gain is nonincreasing with the odds of $e$. Multiply these gains and take the full-wire limit. This proves the asserted conditional-mean inequality.
  In each of deletion and contraction of a nonloop $e$, the prospective wire drawings remain in the image of the same face. The rank factors restrict exactly to the corresponding rank factors of the minor, with coincident marked vertices identified. Thus the conditional covariances are nonnegative by induction. The additional term in the total-covariance formula is nonnegative because both conditional mean differences have the same sign. A loop changes neither rank factor and can be omitted; if no physical edge remains, the factors are deterministic. This completes the induction. To take an auxiliary-wire limit without ambiguity, divide the augmented partition function by the product of all auxiliary odds before sending them to infinity. The surviving all-open term is exactly the contracted-graph partition function, even when some links have become redundant or loops in a minor. Since $S \, W$ are on the same outer face, the general inequality yields (4.17).
  Every physical component meeting both $S \, W$ is counted twice on the left and once on the union, so $L = k_S + k_W - k_(S union W)$. Equation (4.17) therefore gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ e^(Delta_H \( S \, W \)) lt.eq frac(bb(E)_H t^(k_S + k_W), bb(E)_H t^(k_(S union W))) = bb(E)_(H \/ F_(S union W)) t^L . $ <rect:interaction-moment>]
  The normalization for full wiring is $t^(k_(S union W) - 1)$; its constant factor cancels in this expectation. From (4.16),
  $ bb(E) t^L = 1 + \( t - 1 \) sum_(j gt.eq 1) t^(j - 1) bb(P) \( L gt.eq j \) lt.eq 1 + frac(\( t - 1 \) p, 1 - t p) . $
  This proves the final upper bound in (4.15).
  ===== 4.5.3 An arbitrary partition on the first end. <an-arbitrary-partition-on-the-first-end.>
  Let $S'$ be the image of $S$ in $H \/ X$. A full-$D$ log gain is $K_H \( D \) - log t$, and the full $S$ and full $S union W$ wires both subsume $X$. Writing these gains out gives the exact identity
  #[#set math.equation(numbering: n => "(4.19)")
   $ log frac(Z_X Z_(F_W), Z_(X \, F_W) Z) = Delta_H \( S \, W \) - Delta_(H \/ X) \( S' \, W \) . $ <rect:interaction-difference>]
  Coverage positivity in the quotient proves the middle upper bound.
  For the lower bound draw the noncrossing $X$ links and a full-$W$ chain in separate exterior caps facing the main exterior. Peel the $X$ links from that main face and add them in reverse order. For each link being added, the $W$ links may likewise be ordered by reverse peeling from its incident outer-face sector. Each compared pair is then cofacial at the moment of comparison. Cofacial Rayleigh does not increase the $W$ partition gain when the $X$ links are present. Integrate at finite odds, multiply the successive gains, and take the wire limits with the preceding normalization. Thus $Z_(X \, F_W) \/ Z_X lt.eq Z_(F_W) \/ Z$, proving nonnegativity and completing the lemma. ◻
]

#thm([Corollary 4.10.])[
  (A marginal comparison).  #emph[Suppose that an exterior configuration meets a collar only along $S$ and induces there an arbitrary noncrossing partition $X$, while $W$ is free. If the collar’s pure probability $g_H \( S \, W \)$ tends to zero, adding the full wire at $W$ changes the exterior marginal by a density tending uniformly to one.]
] <rect:one-sided-marginal>

#proof[
  Conditional component counting makes the unnormalized density factor $Z_(X \, F_W) \/ Z_X$. By Lemma 24 its ratio to the fixed factor $Z_(F_W) \/ Z$ lies between $e^(- epsilon_p)$ and one, where $epsilon_p arrow.r 0$. Division by its average gives a normalized density between $e^(- epsilon_p)$ and $e^(epsilon_p)$, uniformly in $X$. ◻
]

=== 4.6 No-hit comparison and arbitrary separate caps <no-hit-comparison-and-arbitrary-separate-caps>

The next result uses actual physical components throughout. Neither the event being compared nor its exploration is allowed to traverse a boundary identification as a path edge.

#thm([Lemma 4.11.])[
  (End-cap no-hit comparison).  #emph[Let $H$ be an ordinary finite plane graph in a closed disk, with nonempty vertex sets $W \, S$ on disjoint accessible boundary arcs and no preexisting ties. Let $X$ be a noncrossing partition on $W$ and $Y$ one on $S$. Adding $Y$ to the $X$-law does not increase the probability of an actual physical $W$–$S$ crossing. Adding $X$ alone to the blank law also does not increase that probability.]
] <lem:no-hit>

#proof[
  Relative to the $X$-law, the extra partition gain is the nonnegative random weight
  $ f \( A \) = q^(k_(H \/ \( X \, Y \)) \( A \) - k_(H \/ X) \( A \)) \, #h(2em) bb(E)_(H \/ X) f = Z_(X \, Y) / Z_X . $
  On no actual crossing, explore all complete physical open components touching $W$, without using ties as physical links. Their union $U$ contains $W$ and avoids $S$. All edges from $U$ to its complement are closed. Every $X$ tie is contained in $U$, and conditional component counting shows that the conditional mean of $f$ is exactly the $Y$-partition gain in the ordinary graph $H - U$.
  This gain is at least the unconditional mean of $f$ in the $X$-law. Draw all prospective cap links. With $Y$ temporarily absent in describing faces, delete the $X$ links in an order expanding the exterior face from the $S$ cap. Then peel all physical edges touching $U$ from this exposed face: start at $W$, delete its inward fans, and continue along paths in each explored component to the vertices reached. All those components touch $W$, and no $S$ vertex is removed. At each deleted edge $e$, the $Y$ log partition gain cannot decrease. For a precise finite-odds comparison, peel the prospective $Y$ links from the face sector incident to $e$ through their cap, then add them in reverse order. Each newly added link is cofacial with $e$ in the graph containing both. Cofacial Rayleigh makes its log gain nonincreasing with the odds of $e$. Decrease those odds to zero and repeat. The order for $Y$ may be chosen anew for each deleted edge; there is no claim that all nested cap links are simultaneously cofacial. Finally send auxiliary odds to infinity after dividing out their common leading product. During physical peeling retain the vertices of $U$ temporarily. Since $U$ avoids all $Y$ endpoints, its isolated vertices contribute the same factor $q^(\| U \|)$ to the ordinary gain’s numerator and denominator and then cancel. This proves the asserted comparison with $H - U$.
  Consequently
  $ bb(E)_(H \/ X) \[ f divides upright("no hit") \] gt.eq bb(E)_(H \/ X) f . $
  Tilting by $f$ does not decrease the no-hit probability, and hence does not increase the physical crossing probability. To compare the $X$-law with the blank law, use the same argument with the two ends exchanged and with the initial partition empty. ◻
]

#thm([Lemma 4.12.])[
  (Decoupling of separate cap gains).  #emph[In the setting of Lemma 26, put $b_H = bb(P)_H \( W arrow.l.r S \)$ for the actual crossing probability in the blank law. Then 
#[#set math.equation(numbering: n => "(4.20)")
 $ \( 1 - b_H \) Z_Y / Z lt.eq Z_(X \, Y) / Z_X lt.eq Z_Y / Z . $ <rect:separate-cap-gains>]

 In particular, when $b_H arrow.r 0$, the gain of an arbitrary partition on one end is asymptotically unchanged, uniformly, by an arbitrary noncrossing partition on the other end.]
] <lem:separate-caps>

#proof[
  The upper bound is the finite-odds cofacial cap comparison used at the end of Lemma 24, now with arbitrary noncrossing $Y$ in place of a full wire. Peel the cap links from the main exterior and add them in reverse order, ordering the opposite cap as necessary for each comparison. Each pair is cofacial when Rayleigh is applied. Integrating and taking the normalized contraction limits gives the upper bound.
  For the lower bound, use the no-hit component exploration from Lemma 26 in the $X$-law. On no actual hit its conditional $Y$ gain is the blank $Y$ gain in $H - U$. By just the physical-edge peeling part of that proof, comparing this time against the empty base cap, that gain is at least $Z_Y \/ Z$. Lemma 26 gives no-hit probability at least $1 - b_H$. Keeping only this nonnegative contribution to the mean of $f$ yields
  $ Z_(X \, Y) / Z_X = bb(E)_(H \/ X) f gt.eq bb(P)_(H \/ X) \( upright("no hit") \) Z_Y / Z gt.eq \( 1 - b_H \) Z_Y / Z . $
  This is the claimed inequality. ◻
]

#prodef([Remark 4.13.])[
  (Scope of the comparisons).  The two density statements require separate accessible end arcs with all physical incidences on the disk side. The last two lemmas start with no obstructing preexisting ties. Neither their proofs nor Proposition 22 assert stochastic monotonicity for arbitrary boundary conditions, or comparison between arbitrary partitions on noncofacial rims. These restrictions will be retained when the estimates are used in more complicated domains.
] <rect:scope>

== 5 Sector decay and bounded annular densities <sec:sectors>

Throughout this Section, $q in \( 0 \, 1 \)$ is fixed and

$ t = q^(- 1) \, #h(2em) u = 1 - q \, #h(2em) v = sqrt(q) . $

Ordinary grid edges have odds $v$. Constants may depend on $q$ and on each fixed geometric parameter. In particular, no constant below is asserted to be uniform as $q$ approaches an endpoint of $\( 0 \, 1 \)$. A boundary identification changes component counting but is never an edge of an #emph[actual] path. Boundary incidences at the two banks of a cut remain distinct.

We first establish decay in a disk sector, for a two-terminal network test and then for an actual path in the blank law. The second part of the section uses this decay to bound the interaction between the two rims of an ordinary annulus. It follows the connected supports of the site-pressure expansion: a diverging interaction would force these supports to fill every clear bulk region, while a free wall or a measured path makes that impossible. These estimates supply the regular collars used in the irregular-disk arguments of Section 6. Throughout, boundary comparisons retain their stated cap restrictions.

=== 5.1 Straight-wall sectors and their dual networks <sector:radial-setup>

Fix an integer $k gt.eq 1$. Take $k$ consecutive copies of a coordinate quadrant, glue their intervening radial sides in order, and do not identify the first and last sides. All the constructions in this subsection take place on this noncyclic angular cover. For integers $1 lt.eq r < R$, let $H_k \( r \, R \)$ be the mesh-one graph between the sup-norm levels $r$ and $R$, including all vertices and edges in the closed region. Its two level arcs are denoted by $S_r$ and $S_R$, and its two remaining boundary arcs are its #emph[flanks]. The underlying surface is a closed disk. For $k = 4$ the two banks of the coordinate slit remain distinct; the same convention applies when $k > 4$. Thus local square-grid coordinates are used on an abstract disk, not on a cyclically identified annulus. Set

#[#set math.equation(numbering: n => "(5.1)")
 $ Q_k \( r \, R \) = g_(H_k \( r \, R \)) \( S_r \, S_R \) \, #h(2em) cal(H) \( p \) = frac(1 - p, 1 - u p) . $ <sector:Q-definition>]

The two level arcs in this definition are wired separately. Constants below may depend on the fixed $k$ and on $q$, but not on the radii.

#thm([Proposition 5.1.])[
  (Radial network decay).  #emph[For every fixed finite $k gt.eq 1$, every lattice rotation or reflection of the construction, and every translate of its center to a lattice site, 
#[#set math.equation(numbering: n => "(5.2)")
 $ lim_(L arrow.r oo) med sup_(1 lt.eq r < R\
R \/ r gt.eq L) Q_k \( r \, R \) = 0 . $ <sector:network-decay>]

 This is a separately wired two-terminal network statement on the noncyclic disk sector.]
] <prop:sector-network>

We first record the geometry and duality needed for its proof. Let $C_k \( r \, R \)$ be the cell-center graph of the sector: its vertices are the centers of its square cells, and neighbors are joined across interior edges. To this graph add two distinct hubs, one for each flank, with an odds-$v$ spoke dual to every edge on that flank. Denote the connection probability of the two hubs by $P_k^(*) \( r \, R \)$.

#thm([Lemma 5.2.])[
  (Exact split-hub duality).  #emph[One has 
#[#set math.equation(numbering: n => "(5.3)")
 $ P_k^(*) \( r \, R \) = cal(H) \( Q_k \( r \, R \) \) \, #h(2em) cal(H) \( cal(H) \( p \) \) = p . $ <sector:duality-equation>]

 The same assertion holds for a cell-center passage between two concentric layer cuts, using its own cell dual and its two flank hubs.]
] <sector:duality>

#proof[
  Contract each level arc separately. Edges along a contracted arc are loops and contribute factors independent of the remaining configuration, so they may be omitted. The ordinary plane dual has precisely the interior cell graph just described, with a #emph[single] exterior hub carrying the spokes from both flanks. Its odds are $q \/ v = v$. Euler’s formula gives the FK dual law with these odds. The disk path–cut alternative identifies absence of the primal level-to-level connection with an open dual traversal from one flank to the other through the cells, without using the common hub as a shortcut.
  Split the common hub into its two flank hubs and let $p$ be their connection probability in the split law. Joining the hubs changes the component count by one on separation and by zero on connection. Consequently the joined law gives the traversal event probability
  $ frac(p, p + t \( 1 - p \)) = frac(q p, 1 - u p) . $
  This is $1 - Q_k \( r \, R \)$. Solving for either probability proves (5.3); direct substitution proves that $cal(H)$ is involutive. This reasoning uses only the disk boundary order and the square-cell incidence structure, so applies to the cell-center passage as well. No Euclidean identification across a slit or between different sheets of the angular cover is made. ◻
]

The next lemma turns rectangle crossings into a connection along a boundary route. It will be used twice: along the outer rim to bound the split-dual test, and around an end gap to extend a measured actual arm. The latter use requires the reflex-corner case as well as convex corners.

#thm([Lemma 5.3.])[
  (Boundary chords along a rectilinear route).  #emph[Consider a square-grid disk graph, in ordinary coordinates or on a noncyclic angular cover, with two accessible boundary intervals $I$ and $J$, separately wired for the test and with no other ties. Suppose that a boundary route from $I$ to $J$ has a bounded number of straight portions of comparable macroscopic length, positive inward clearance of comparable size along each portion, and right-angle convex or reflex corners. The fitting inward rectangular neighborhoods along straight portions and inward square neighborhoods at convex corners must contain every grid vertex and nearest-neighbor edge of their closed regions, including boundary edges, with ordinary odds $v = sqrt(q)$. At a reflex corner, require the same complete ordinary grid on a fitting closed square of comparable size with its exterior quadrant removed. Suppose also that $I$ and $J$ have positive length on this same scale. Then 
$ g \( I \, J \) gt.eq c > 0 \, $

 where $c$ depends only on $q$, the bound on the number of straight portions, and the fixed length and clearance ratios. The estimate remains valid after a cofacial extension for which every added edge is accessible from a test-edge face by crossing only added edges.]
] <sector:blank-boundary-chain>

#proof[
  All the comparisons here use auxiliary interval chains in narrow exterior caps and an exterior terminal test edge. When a rectangle is flush to a continuous exposed boundary stretch, every unwanted edge can be reached from a test-edge face across only unwanted edges. Successive face expansion therefore peels the unwanted edges, and cofacial Rayleigh gives the rectangle-to-disk comparison in the required direction. Interval caps can be chosen with no physical edge in their thin pockets, so they do not obstruct the peeling.
  Proposition 22 first gives chords from a fixed positive-length patch to the opposite side of a fitting subrectangle. For two patches on adjacent sides, the two patch-to-opposite-side chords interlace. Lemma 14 therefore gives a positive lower bound for their connection. For two patches on the same side, first connect each toward the opposite side. Interlace each of these chords with a transverse rectangle crossing, choosing the right-hand endpoint for the left patch and the left-hand endpoint for the right patch. The resulting two chords again interlace and connect the original patches. When two input full-side electrodes meet at a corner, use Corollary 17; the two patches to be connected are disjoint and stay away from that corner. All rectangles have fixed aspect ratios and positive relative patch sizes. At a convex corner the same adjacent-side construction takes place in an inward square.
  Here is the corresponding construction at a reflex corner. In local coordinates take $\[ - h \, h \]^2$ with its southwest quadrant removed. Let the two boundary patches lie on its negative horizontal and negative vertical rays, away from the corner. In the upper rectangle, connect the first patch to an interval in the upper portion of the right wall. In the right rectangle, connect the second patch to an interval in the right portion of the top wall. The adjacent-side construction just given bounds both probabilities below. Extend each rectangle cofacially to the clipped square. The four intervals occur in the cyclic order
  $ upright("negative horizontal ray") \, quad upright("negative vertical ray") \, quad upright("right wall") \, quad upright("top wall") . $
  The two chords consequently interlace. A further application of Lemma 14 connects the two original patches with a fixed positive lower bound.
  Subdivide the boundary route into a fixed finite number of sufficiently short comparable pieces, putting disjoint ordered patches $I_0 \, dots.h \, I_N$ on their middle portions, with $I_0 subset I$ and $I_N subset J$. Choose the subdivision so a two-piece span meets at most one corner and fits one of the preceding local constructions. Those constructions give
  #[#set math.equation(numbering: n => "(5.4)")
   $ g \( I_j \, I_(j + 2) \) gt.eq c_0 > 0 . $ <sector:skip-chords>]
  Interlace the chord from $I_0$ to $I_j$ with the chord from $I_(j - 1)$ to $I_(j + 1)$, beginning with $j = 2$. After a bounded number of applications this gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ g \( I_0 \, I_N \) gt.eq c_1 > 0 . $ <sector:route-chord>]
  Enlarge the terminal intervals to $I \, J$ by adjacency. Finally, the face-expansion comparison in the first paragraph proves the stated extension property. ◻
]

#thm([Lemma 5.4.])[
  (Fixed-geometry bounds for the two dual tests).  #emph[There exist $c_0 \, c_1 > 0$ and finite $L_0 \, m_0$ such that]
  + #emph[$P_k^(*) \( r \, R \) gt.eq c_0$ whenever $R \/ r gt.eq L_0$;]
  + #emph[in the spoke-free cell graph consisting of centers with 
$ m + 1 / 2 lt.eq \| z \|_oo lt.eq 2 m - 1 / 2 $

 on the same $k$-quadrant cover, the network connection between its two whole layer cuts, separately wired, is at most $1 - c_1$ for $m gt.eq m_0$.]
] <sector:fixed-geometry>

#proof[
  For (i), use the convex-corner case of Lemma 31 along the outer polygon rim of $C_k \( r \, R \)$, starting and ending on flank patches at distances comparable to $R$ from the center. When $R \/ r$ is sufficiently large, the route stays a fixed fraction of $R$ away from the inner rim. On each sheet its straight pieces have lengths comparable to $R$, and the local inward rectangles and corner squares have sides a small fixed fraction of $R$. Crossing an intervening quadrant seam does not change the local square-grid geometry. There are only finitely many pieces for fixed $k$. The two banks are always treated as separate disk sides. The lemma therefore gives a deterministic-contact network lower bound between the two flank patches.
  Replacing such a deterministic contact by its stochastic spokes loses at most the factor
  $ eta = frac(v, 1 + v) > 0 . $
  Indeed, with the other tested terminal fixed, the rooted formula of Lemma 11 writes the new isolated hub’s connection probability as
  $ bb(E)_mu #scale(x: 120%, y: 120%)[\[] 1 - \( 1 + v \)^(- N) #scale(x: 120%, y: 120%)[\]] gt.eq eta thin mu \( N > 0 \) \, $
  where $N$ counts rooted-multiset multiplicity on the contact patch. The right-hand hitting probability is the deterministic-contact network. Perform this comparison for the two hubs in turn. Adding their other spokes does not decrease their connection probability by adjacent Rayleigh. This proves (i), with a factor $eta^2$.
  For (ii), contract the two circular layer cuts of the stated spoke-free passage and apply Lemma 30. The split dual has ordinary square-grid interiors and stochastic flank spokes. Its outer boundary route has the same local form as the one just used. Taking a cell dual shifts its rows and endpoints by bounded mesh distances; straight lengths and available inward depths remain comparable to $m$, and successive corner rows still meet at right angles. For $m$ sufficiently large the fixed clearances used above absorb all these shifts. The split dual flank-to-flank probability is therefore at least a positive constant $c_4$. Its complementary radial probability is at most $cal(H) \( c_4 \) < 1$ by exact duality. Take $c_1 = 1 - cal(H) \( c_4 \)$. ◻
]

=== 5.2 A noncrossing partition obstruction <sector:partition-obstruction>

The obstruction comes from a concrete finite graph inside a long sector. To see the problem it must exclude, suppose the extremal radial probabilities along some sequence tend to a number $M in \( 0 \, 1 \)$, and put $h = cal(H) \( M \)$. Choose a fixed number of radial bands whose ratios, intervening gaps, and distances from the two ends all tend to infinity. On each flank of the interior cell graph, attach a separate hub through the ordinary spokes of each band. Write $a_i$ and $b_i$ for the two hubs of band $i$, in increasing radial order. Their open connection partition is noncrossing in the boundary order

$ a_1 \, dots.h \, a_n \, b_n \, dots.h \, b_1 . $

Two comparisons will constrain this finite partition. If a group of first-flank hubs and a group of second-flank hubs contain a matched pair $a_i \, b_i$, their connection after the two groups are separately merged is bounded below by the isolated split-dual test of band $i$ and above by the full split-dual test. Both bounds tend to $h$. By contrast, two ordered groups on one flank can be enlarged to the full layer cuts of an unused intervening gap, whose network probability is at most $1 - c_1$. Terminal enlargement also bounds this group test below by the connection probability of any one hub from each group. The underlying hub law also retains the pressure inequality of Theorem 7. The completion of the proof will verify these comparisons from the permitted finite edge changes. The next lemma rules out the infinite paired-list law that their limiting consequences would produce by finite partition compactness.

For a partition $pi$ and a finite vertex set $D$, let $k_D$ count the blocks meeting $D$. For disjoint nonempty finite sets $D \, F$, put

$ C_pi \( D \, F \) = upright(bold(1)) { upright("a block of ") pi upright(" meets both ") D upright(" and ") F } \, #h(2em) r_pi \( D \, F \) = k_(D union F) - 2 + C_pi \( D \, F \) . $

The integer $r_pi \( D \, F \)$ is precisely the rank gain on separately merging $D$ and $F$: after these mergers the blocks meeting their union number $2 - C_pi \( D \, F \)$. Define

#[#set math.equation(numbering: n => "(5.6)")
 $ G \( D \, F \) = frac(bb(E) \[ t^(r_pi \( D \, F \)) C_pi \( D \, F \) \], bb(E) \[ t^(r_pi \( D \, F \)) \]) \, #h(2em) K \( D \) = log bb(E) \[ t^(k_D) \] . $ <sector:merger-functional>]

These definitions depend only on the restriction of $pi$ to $D union F$, even if the underlying partition is infinite. For an FK connection partition, $G \( D \, F \)$ is exactly the network connection probability after separately merging the two groups: $t^(r_pi \( D \, F \))$ is the change of component-counting weight. Thus $G$ records the group tests in the finite fan graph just described. The lemma makes no initial exchangeability assumption.

#thm([Lemma 5.5.])[
  (Paired-list obstruction).  #emph[There is no random partition of ${ a_i \, b_i : i in bb(N) }$ with all the following properties, for fixed $t > 1$, $h in \( 0 \, 1 \)$, and $c > 0$.]
  + #emph[Each restriction to the first $n$ pairs is noncrossing in the cyclic order $a_1 \, dots.h \, a_n \, b_n \, dots.h \, b_1$.]
  + #emph[For disjoint finite sets $D \, F$, 
#[#set math.equation(numbering: n => "(5.7)")
 $ K \( D \) + K \( F \) - K \( D union F \) gt.eq 0 . $ <sector:partition-pressure>]

]
  + #emph[For nonempty finite index sets $U \, V$ with $U ∩ V eq.not diameter$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ G \( a_U \, b_V \) = h \, #h(2em) a_U = { a_i : i in U } \, quad b_V = { b_i : i in V } . $ <sector:matched-tests>]

]
  + #emph[If $U \, V$ are nonempty and $max U < min V$, then for every $i in U$ and $j in V$, 
#[#set math.equation(numbering: n => "(5.9)")
 $ bb(P) \( a_i tilde.op a_j \) lt.eq G \( a_U \, a_V \) lt.eq 1 - c . $ <sector:same-side-tests>]

]
] <lem:sector:paired-lists>

#proof[
  #emph[How the obstruction works.] We first replace the partition law by a spreadable one and express it as an iid mixture of labeled pairs. Noncrossing leaves only private matched bonds and at most one repeated label on either side. The merger identities and pressure inequality leave two pure cases; in the private case the same pressure inequality makes the bond probability constant. The matched tests exclude that case, and the same-side tests exclude the repeated-label case.
  #emph[Making the law spreadable.] For each $m$ there are finitely many partitions of $2 m$ labeled vertices. Color an increasing $m$-tuple of pair indices by a finite quantization of its vector of restriction probabilities. Iterated infinite Ramsey #cite(label("Ramsey1930")) Theorem A gives nested infinite sets $J_j$ such that, for every $m lt.eq j$, these vectors differ by at most $2^(- j)$ between any two increasing $m$-tuples in $J_j$. Restrict the law to the first $j$ indices of $J_j$ and take a projective subsequential limit, using compactness of each finite partition simplex. The resulting law is invariant under increasing injections of the pair indices. Every condition in the statement survives: it involves finitely many partition probabilities, the merger quotients have positive denominators, and increasing restrictions preserve the specified boundary order and the separation of $U \, V$. We may therefore assume this spreadability from now on.
  Give each partition block an independent uniform label in $\[ 0 \, 1 \]$. There are countably many blocks, and their labels are almost surely distinct. Let $X_i \, Y_i$ label $a_i \, b_i$, and put $Z_i = \( X_i \, Y_i \)$. This sequence is spreadable on the compact space $\[ 0 \, 1 \]^2$. The spreadable form of the de Finetti representation is due to Ryll–Nardzewski #cite(label("RyllNardzewski1957")); we include the argument for this compact label space. For a bounded continuous real function $f$ and two disjoint index blocks $B \, C$, each of length $L$, spreadability gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ bb(E) [(1 / L sum_(i in B) f \( Z_i \) - 1 / L sum_(i in C) f \( Z_i \))^2] = 2 / L #scale(x: 120%, y: 120%)[\(] bb(E) f \( Z_1 \)^2 - bb(E) \[ f \( Z_1 \) f \( Z_2 \) \] #scale(x: 120%, y: 120%)[\)] . $ <sector:block-average>]
  For functions $f_1 \, dots.h \, f_m$, average their product using one index in each of $m$ successive length-$L$ blocks. Its expectation equals $bb(E) product_j f_j \( Z_j \)$ by spreadability. Replacing every block average by the average of the same function over the first block changes this expectation by $O \( L^(- 1 \/ 2) \)$, by (5.10) and a telescoping product estimate. The laws of the empirical measures of the first block have a subsequential weak limit on the compact space of probability measures on $\[ 0 \, 1 \]^2$. Calling the resulting random measure $nu$, we obtain
  $ bb(E) product_(j = 1)^m f_j \( Z_j \) = bb(E) product_(j = 1)^m nu \( f_j \) . $
  Products of continuous functions determine the finite-dimensional laws. We can consequently realize the labeled pairs as iid with common law $nu$, conditionally on $nu$.
  #emph[Noncrossing restricts the directing law.] Almost every directing law gives a noncrossing partition with conditional probability one, simultaneously for all finite restrictions. Its first marginal has at most one atom: if two distinct labels $x \, y$ had positive mass, the event $X_1 = x \, X_2 = y \, X_3 = x \, X_4 = y$ would have positive probability and would cross. The second marginal has the same property. Denote their possible atom masses by $alpha \, beta$, putting the mass equal to zero for a diffuse marginal.
  A diagonal tie $X_i = Y_i$ at a label other than a common marginal atom has positive probability only if both marginals are diffuse. For example, if the first marginal has atom $x$ of mass $alpha > 0$ and such diagonal ties have mass $delta > 0$, three independent pairs produce $X_1 = X_3 = x$ and $X_2 = Y_2 eq.not x$ with probability $alpha^2 delta > 0$. The two blocks interlace in the disk boundary order, which is impossible. The second-side argument is identical. Let
  $ D_0 = { alpha = beta = 0 } \, #h(2em) d_0 = bb(P) \( D_0 \) . $
  On $D_0$, labels from different pairs are almost surely distinct, since each marginal is diffuse and different pairs are independent. Thus the only ties are private matched bonds, conditionally independent with a probability $gamma = nu { \( x \, x \) : x in \[ 0 \, 1 \] }$. Outside $D_0$ every repetition uses a marginal atom, and no diffuse matched bonds occur. The two atoms, if both exist, need not be equal.
  #emph[The merger weights.] Write
  #[#set math.equation(numbering: n => "(5.11)")
   $ w \( m \) = t^(- m + upright(bold(1)) { m > 0 }) \, #h(2em) A_j \( x \) = t \( 1 - u x \)^j + \( 1 - t \) \( 1 - x \)^j \, #h(2em) u = 1 - t^(- 1) . $ <sector:A-definition>]
  If $M$ is binomial with parameters $j \, x$, then
  #[#set math.equation(numbering: n => "(5.12)")
   $ bb(E) w \( M \) = A_j \( x \) \, #h(2em) A_1 \( x \) = 1 \, #h(2em) \( 1 - u x \)^j lt.eq A_j \( x \) lt.eq t \( 1 - u x \)^j \, #h(2em) A_j \( x \) lt.eq 1 . $ <sector:A-bounds>]
  The first identity follows by separating $M = 0$ and summing $t bb(E) \[ t^(- M) \]$ on $M > 0$; the bounds also follow directly from the formula, or from $0 < w \( m \) lt.eq 1$.
  Test $k$ first-side labels and $s$ second-side labels with exactly $l$ overlapping pair indices, where $1 lt.eq l lt.eq k$ is fixed and $s arrow.r oo$. Normalize the reweighting by $t^(k + s - 2)$. On $D_0$, if $m$ of the $l$ matched bonds occur, the union has $k + s - m$ blocks and $C = upright(bold(1)) { m > 0 }$, so the normalized weight is $w \( m \)$. The conditional denominator and numerator are respectively
  #[#set math.equation(numbering: n => "(5.13)")
   $ A_l \( gamma \) \, #h(2em) A_l \( gamma \) - \( 1 - gamma \)^l . $ <sector:private-weights>]
  On ${ beta = 0 < alpha }$ there are no cross-group ties, and the denominator is $A_k \( alpha \)$ while the numerator is zero. On ${ beta > 0 }$ the normalized weight tends to zero in conditional expectation: impose the second-group merge first. Its normalized factor is $w \( M_s \)$, where $M_s$ counts occurrences of its atom; the remaining first-group merge has rank gain at most $k - 1$. Thus the whole normalized weight is at most $w \( M_s \) lt.eq 1$, and $M_s arrow.r oo$ almost surely. Bounded convergence applies also after averaging over $nu$.
  Equation (5.8), multiplied by its denominator, therefore yields, for every $k gt.eq l$,
  #[#set math.equation(numbering: n => "(5.14)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(D_0) { A_l \( gamma \) - \( 1 - gamma \)^l } #scale(x: 120%, y: 120%)[\]] = h (bb(E) \[ upright(bold(1))_(D_0) A_l \( gamma \) \] + bb(E) \[ upright(bold(1))_({ beta = 0 < alpha }) A_k \( alpha \) \]) . $ <sector:half-atomic-equation>]
  Since $A_k \( alpha \) arrow.r 0$ on $alpha > 0$, take $l = 1$, let $k arrow.r oo$, and compare with $k = 1$. As $A_1 = 1$ and $h > 0$, this proves $bb(P) \( beta = 0 < alpha \) = 0$. Reversing the two sides proves $bb(P) \( alpha = 0 < beta \) = 0$. No division by a limiting denominator has been used. Hence outside $D_0$ both atom masses are positive.
  #emph[Eliminating a mixed diffuse/atomic law.] Choose $D = { a_1 \, dots.h \, a_s }$ and $F = { b_(s + 1) \, dots.h \, b_(2 s) }$. On $D_0$ all selected labels are distinct. Outside $D_0$ the number of repetitions of each marginal atom tends to infinity. Consequently each of
  $ bb(E) \[ t^(k_D - s) \] \, #h(2em) bb(E) \[ t^(k_F - s) \] \, #h(2em) bb(E) \[ t^(k_(D union F) - 2 s) \] $
  tends to $d_0$. For the last term, use $k_(D union F) lt.eq k_D + k_F$; all three integrands are bounded by one. If $0 < d_0 < 1$, this gives
  $ K \( D \) + K \( F \) - K \( D union F \) arrow.r log d_0 < 0 \, $
  contrary to (5.7).
  #emph[The purely diffuse case.] If $d_0 = 1$, put $V = 1 - u gamma$ and use the two disjoint vertex sets $D = { a_1 \, b_1 }$ and $F = { a_2 \, b_2 }$. Conditional independence of the private bonds gives
  $ bb(E) t^(k_D) = t^2 bb(E) V \, #h(2em) bb(E) t^(k_(D union F)) = t^4 bb(E) V^2 . $
  Pressure positivity forces $\( bb(E) V \)^2 gt.eq bb(E) V^2$, so $gamma$ is constant. The singleton matched test in (5.8) gives $gamma = h > 0$. For groups of size $s$ with all indices paired, (5.13) gives failure probability
  $ frac(\( 1 - gamma \)^s, A_s \( gamma \)) lt.eq (frac(1 - gamma, 1 - u gamma))^s arrow.r 0 . $
  Their connection probabilities cannot all equal $h < 1$.
  #emph[The positive-atom case.] If $d_0 = 0$, the first marginal has exactly one atom of mass $alpha > 0$ almost surely. Two distinct first-side vertices connect with probability $bb(E) alpha^2 > 0$. For ordered-separated groups of sizes $s \, k$, their atom counts are independent conditional on $nu$. There is at most one block shared by the groups. Their normalized merger weight is the product of their two single-group factors, and connection requires a positive atom count in both. Thus
  #[#set math.equation(numbering: n => "(5.15)")
   $ G \( a_U \, a_V \) = frac(bb(E) \[ \( A_s \( alpha \) - \( 1 - alpha \)^s \) \( A_k \( alpha \) - \( 1 - alpha \)^k \) \], bb(E) \[ A_s \( alpha \) A_k \( alpha \) \]) . $ <sector:atomic-group-ratio>]
  By (5.9) this lies in $\[ bb(E) alpha^2 \, 1 - c \]$ for every $s \, k$.
  If $"ess inf" alpha = 0$, fix $k = 1$. The probability laws weighted by $A_s \( alpha \)$ concentrate at zero. Indeed, for any $0 < epsilon.alt < 1$, the positive-mass set ${ alpha lt.eq epsilon.alt \/ 2 }$ contributes at least $bb(P) \( alpha lt.eq epsilon.alt \/ 2 \) \( 1 - u epsilon.alt \/ 2 \)^s$ to the denominator, whereas ${ alpha gt.eq epsilon.alt }$ contributes at most $t \( 1 - u epsilon.alt \)^s$. Their ratio tends to zero. Since $A_1 = 1$ and $A_1 - \( 1 - alpha \) = alpha$, the ratio in (5.15) is at most the expectation of $alpha$ under this weighted law and therefore tends to zero. This contradicts its positive lower bound. If instead $alpha gt.eq a > 0$ almost surely, then uniformly
  $ frac(\( 1 - alpha \)^s, A_s \( alpha \)) lt.eq (frac(1 - a, 1 - u a))^s arrow.r 0 . $
  Taking $k = s$ in (5.15) makes the ratio tend to one, contradicting its strict upper bound. All possibilities for $d_0$ have been excluded. ◻
]

=== 5.3 Separated radial fans and completion of network decay <sector:fan-comparison>

#proof[
  For the fixed $k$ and orientation, the nonincreasing supremum in (5.2) has a limit $M gt.eq 0$. Lemma 32(i) and exact duality imply $M lt.eq cal(H) \( c_0 \) < 1$. Suppose $M > 0$. Choose sectors with $R \/ r arrow.r oo$ and $Q_k \( r \, R \) arrow.r M$, and put
  $ h = cal(H) \( M \) in \( 0 \, 1 \) . $
  Fix $n$. Inside each sector choose integer levels satisfying
  #[#set math.equation(numbering: n => "(5.16)")
   $ r lt.double s_1^(-) lt.double s_1^(+) lt.double s_2^(-) lt.double dots.h.c lt.double s_n^(-) lt.double s_n^(+) lt.double R \, $ <sector:separated-levels>]
  where every consecutive ratio tends to infinity along the chosen sequence. For example, divide the logarithmic interval from $r$ to $R$ into $2 n + 1$ equal parts and round the resulting levels; rounding does not affect these ratios. In particular the interior levels tend to infinity.
  Use the whole interior cell graph $C_k \( r \, R \)$ as a base. On the first flank put distinct hubs $a_1 \, dots.h \, a_n$, with $a_i$ having precisely the odds-$v$ spokes dual to flank edges between $s_i^(-)$ and $s_i^(+)$. Put analogous hubs $b_1 \, dots.h \, b_n$ on the second flank. There are no other spokes. Draw each fan in a narrow exterior strip along its own boundary interval. These strips are disjoint, so the network partition of the hubs is noncrossing in the order $a_1 \, dots.h \, a_n \, b_n \, dots.h \, b_1$.
  For a matched pair $a_i \, b_i$, retain just the cell subband between $s_i^(-)$ and $s_i^(+)$ and its two fans. Its connection probability is exactly $cal(H) \( Q_k \( s_i^(-) \, s_i^(+) \) \)$. Extending it to the full interior cell graph, and then adding the remaining separate fans, does not decrease this tested network probability. Here is the cofacial comparison. Draw the test edge joining the two hubs in the exterior of the disk. The complement of the closed subband has an inner and an outer portion. Each unwanted interior-grid edge has access through its portion to the corresponding inner or outer rim, and thence to a test-edge face, crossing only unwanted edges. The two retained fan strips occupy only their stated flank intervals; their pockets contain no unwanted interior edges and they do not close these complementary openings. Face expansion therefore deletes all unwanted edges in an order cofacial with the test edge. Cofacial Rayleigh gives the claimed extension comparison. Each other fan lies on a disjoint boundary stretch; peel its edges successively from the main exterior face and reverse this order to add the fan. The same cofacial comparison applies at each addition. All these are comparisons of finite-odds edges, so no unproved boundary-condition monotonicity is involved. Thus
  #[#set math.equation(numbering: n => "(5.17)")
   $ liminf bb(P) \( a_i tilde.op b_i \) gt.eq h \, $ <sector:matched-lower>]
  because each subband ratio tends to infinity and the defining supremum for $M$ bounds its $Q_k$ from above by $M + o \( 1 \)$.
  Conversely, merge all first-flank hubs into one terminal and all second-flank hubs into another, then add every missing flank spoke. Each merger can be made by edges incident to the corresponding tested terminal, and the added spokes are incident there too. Adjacent Rayleigh shows that the network probability does not decrease at any step. The result is the full split dual network, with connection probability $cal(H) \( Q_k \( r \, R \) \) arrow.r h$. More generally, for any nonempty $U \, V subset { 1 \, dots.h \, n }$ with $U ∩ V eq.not diameter$, choose $i in U ∩ V$. Enlarge the matched terminals $a_i \, b_i$ to $a_U \, b_V$, and then to both full flank terminals. The two preceding comparisons squeeze the merger test to give
  #[#set math.equation(numbering: n => "(5.18)")
   $ G \( a_U \, b_V \) arrow.r h . $ <sector:finite-overlap-limit>]
  Here $G$ is exactly (5.6): the FK change of component count on identification is its rank-gain reweighting.
  There is also a uniform strict upper bound for ordered-separated groups on the first flank. Suppose $max U < min V$. In a gap between consecutive band intervals lying between these groups, choose an integer $m arrow.r oo$ so that the two cell layers $m + 1 / 2$ and $2 m - 1 / 2$ and the entire passage between them lie strictly inside the gap. This is possible by (5.16). Enlarge the inner tested terminal to the whole inner layer and the outer terminal to the whole outer layer. All vertices, hubs, and fans below the gap may be absorbed into the first terminal, and all those above it into the second. No fan crosses the gap. Every enlargement is by links incident to a tested terminal and does not decrease its connection probability. After these identifications the two exterior portions attach to the passage only at its respective terminal; their partition functions factor out. The remaining network is precisely the pure spoke-free cell-layer passage of Lemma 32(ii). Therefore
  #[#set math.equation(numbering: n => "(5.19)")
   $ bb(P) \( a_i tilde.op a_j \) lt.eq G \( a_U \, a_V \) lt.eq 1 - c_1 quad \( i in U \, med j in V \) $ <sector:finite-same-side>]
  once the original sector is sufficiently far along the sequence. The lower bound is the direct terminal-enlargement comparison in the original finite hub graph.
  Finally Theorem 7, applied to that finite graph, gives (5.7) for every pair of disjoint hub sets. For fixed $n$, pass to a subsequential limit of its finite partition law. Equations (5.18) and (5.19), noncrossing, and pressure positivity survive. Let $n$ increase and take another projective subsequential limit on the two infinite lists. This is legitimate because each finite partition space is finite, and all constraints on a fixed restriction hold for all sufficiently large $n$. The resulting law satisfies every hypothesis of Lemma 33, with $c = c_1$, a contradiction. Hence $M = 0$.
  For each fixed larger $k$ the outer route has more, but still boundedly many, straight pieces and convex corners. The local comparisons, cell duality, radial band order, and gap contraction are unchanged on the noncyclic angular cover. Thus the same proof establishes the claimed range of $k$, with constants allowed to depend on it. Rotations, reflections, and lattice translations preserve all graph incidences and odds. ◻
]

=== 5.4 Actual radial arms and separate end caps <sector:actual-subsection>

The network estimate just proved concerns the law with two full terminal wires. We next obtain a bound for actual paths in the blank law. These are different assertions: no monotonicity between arbitrary boundary conditions will be used to pass from one to the other.

Write $H_k \( r \, R \)$ for the straight-wall sector graph of Section 5.1, including its two polygonal radial cuts. For every fixed finite integer $k gt.eq 1$, its $k$ successive quadrants are glued noncyclically on the angular cover, with the two banks kept separate. In particular, the full-angle case $k = 4$ remains a disk with a slit. Denote its inner and outer vertex arcs by $A_r = S_r$ and $A_R = S_R$, respectively, and put

$ b_k \( r \, R \) = bb(P)_(H_k \( r \, R \)) #scale(x: 120%, y: 120%)[\(] upright("an actual open path joins ") A_r upright(" to ") A_R #scale(x: 120%, y: 120%)[\)] . $

Here and below, actual paths use physical edges and cannot use a wire identification as a step. A cap partition of an end arc means a partition drawable by noncrossing auxiliary links in a narrow exterior cap at that arc. Inner and outer caps are disjoint.

#thm([Proposition 5.6.])[
  (Blank sector arms).  #emph[For each fixed finite integer $k gt.eq 1$ and each orientation, 
$ lim_(M arrow.r oo) med sup_(R \/ r gt.eq M) b_k \( r \, R \) = 0 . $

 If $X$ and $Y$ are separate cap partitions of $A_r$ and $A_R$, with no other ties, then 
#[#set math.equation(numbering: n => "(5.20)")
 $ bb(P)_(H_k \( r \, R \) \/ \( X \, Y \)) \( A_r arrow.l.r A_R upright(" by an actual path") \) lt.eq b_k \( r \, R \) . $ <sector:actual-cap-comparison>]

 On the same original edge set, their partition functions satisfy 
#[#set math.equation(numbering: n => "(5.21)")
 $ 1 - b_k \( r \, R \) lt.eq frac(Z_(X \, Y) Z, Z_X Z_Y) lt.eq 1 . $ <sector:actual-cap-ratio>]

]
] <prop:sector-actual>

The comparisons in (5.20)–(5.21) are immediate applications of Lemmas 26 and 27: the sector is a disk and its two radial cuts are disjoint accessible boundary arcs. In particular, taking both caps to be full wires and using the two-wire witness equivalence gives

$ Q_k \( r \, R \) = bb(P)_(H_k \( r \, R \) \/ \( A_r \, A_R \)) \( A_r arrow.l.r A_R upright(" by an actual path") \) lt.eq b_k \( r \, R \) . $

This relation supplies no upper bound on $b_k$ from the smallness of $Q_k$.

The proof first extracts from any persistent blank arm a sequence of intermediate bands whose blank crossing probabilities tend to one. A one-sided collar comparison then permits the two end wires to be inserted while keeping a central actual crossing likely. The exploration and end-extension lemmas below provide the remaining step: a measured crossing, with one side uninspected, can be extended across either omitted end gap at a fixed positive cost. Applying the two extensions freshly under the full two-wire law would contradict Proposition 29.

#thm([Lemma 5.7.])[
  (A one-sided radial exploration).  #emph[Consider a sector band with a designated near cut $A$ and far cut $C$; the designation may run either outward or inward. Its remaining two sides are its flanks. There are two deterministic edge explorations, one from each flank, with the following properties.]
  + #emph[Each exploration detects whether an actual open $A$–$C$ path exists. On success it supplies a simple such path $P$, all of whose edges have been inspected and found open. Apart from its endpoints, $P$ avoids the two cuts.]
  + #emph[All edge interiors strictly on the other side of $P$ from the starting flank are uninspected. On deleting inspected closed edges, the path has an exposed vertex accessible from the starting flank through an exterior face.]
  + #emph[On the path-existence event, at least one of the two explorations has an endpoint on $A$ for which the portion of $A$ between that endpoint and the uninspected flank has at least half the length of $A$.]
  #emph[Let $E$ be the path-existence event. For each flank search separately, let $F_j$, $j = 1 \, 2$, be the event that it succeeds and that its own endpoint leaves at least half of $A$ toward its uninspected flank. Each $F_j$ is a union of recorded leaves of that search, and $F_1 union F_2 = E$. Conditioning on an individual recorded leaf imposes no conditions on the uninspected edge states beyond the usual induced FK identifications.]
] <sector:frontier>

#proof[
  Keep the order of vertices on both cuts, and treat the cuts as impassable walls for the complementary search. Their tangential physical edges are not queried. They are unnecessary to detect an actual radial crossing: trim any such crossing after its last visit to $A$ and before its first subsequent visit to $C$. The disk path/cut alternative for these walls says that either an actual $A$–$C$ path exists, or a complementary path joins the flanks, but not both. One way to verify this deterministic alternative is to contract each cut to its own terminal in the drawing and then trim the resulting terminal path as just described. No probability law is changed in using this topological test.
  Split the complementary exterior into the two flank faces. Starting at one of them, explore its entire connected component using complementary edges, namely crossings of closed physical edges. The starting vertex is in an exterior flank collar: entering an adjacent interior face requires testing the intervening physical boundary edge and finding it closed. In particular, adjacent interior faces are not seeded for free. No passage out through $A$ or $C$ is allowed. One implementation keeps a fixed ordered queue of reached complementary faces and tests every previously untested physical edge incident to the next face. A closed edge adds its opposite face to the queue. An open edge does not. Stop on reaching the other flank, or on exhausting the queue. Thus the history is generated by successive tests of individual edge states.
  If the other flank is reached, the complementary path blocks every actual $A$–$C$ path. Otherwise set every uninspected physical edge temporarily closed. The reached complementary component does not enlarge: every edge leaving it was inspected and found open. There is still no complementary flank-to-flank crossing, so the disk path/cut alternative supplies an open radial crossing in this temporary configuration. All its physical edges were consequently inspected and found open. Choose a simple one by fixed deterministic tie breaks, and retain the portion after its last near-cut visit and before its first subsequent far-cut visit. This defines $P$ and proves (i). Temporary closure is only a device for selecting the witness, not additional conditioning of the actual configuration.
  Every reached face lies on the starting side of any open radial blocker. In particular no tested edge interior lies strictly on the opposite side of the chosen frontier: an edge is tested only from an incident reached face. The closed edges crossed during the search give a chain of face expansions from the starting flank. Deleting them exposes the appropriate side of $P$ to that exterior face. These observations prove (ii). If $P$ touches a flank, use separate exterior boundary slots, or equivalently slightly prolong that flank outward, to distinguish its two incident sides. Only the component accessible from the opposite flank is relevant; any further pieces separated by a boundary touch attach at $P$ after contraction.
  Orient the near-cut arc from the first flank to the second. Among simple actual radial paths, with internal visits to the cuts removed, consider the possible near endpoints. The search from the first flank has a leftmost such endpoint. To check this directly, let $C_0$ be any such blocker. The exploration cannot reach a face strictly beyond $C_0$. An inward edge with near endpoint strictly beyond the endpoint of $C_0$ has its entire edge interior on the blocked side; neither incident complementary face is reached, so it cannot have been inspected. Hence the near endpoint of the selected inspected-open path cannot be farther along the arc than the endpoint of $C_0$. The reversed search similarly gives a rightmost endpoint. If their arc coordinates are $x_(-)$ and $x_(+)$ in an arc of length $ell$, then $x_(-) lt.eq x_(+)$ and
  $ max { ell - x_(-) \, x_(+) } gt.eq ell \/ 2 . $
  This gives (iii) and $F_1 union F_2 = E$. For each search, its frontier and its own clearance test are functions of that search’s recorded leaf. An adaptive edge exploration with deterministic next-edge choices leaves the ordinary FK domain Markov law on untested edges, proving the final assertion. No joint history of the two searches is used. ◻
]

#thm([Lemma 5.8.])[
  (Extension across one radial end gap).  #emph[Fix an integer $L gt.eq 2$. Let $R \/ r$ be sufficiently large and $r$ sufficiently large, and set 
$ a = 2 L r \, #h(2em) s = floor.l R \/ \( 2 L \) floor.r . $

 In $H_k \( r \, R \)$ give $A_r$ and $A_R$ their full separate wires. There is a constant $c > 0$, depending only on $q \, L \, k$, such that 
#[#set math.equation(numbering: n => "(5.22)")
 $ bb(P) \( upright("actual ") r upright("–") s upright(" crossing") \) & gt.eq c / 2 thin bb(P) \( upright("actual ") a upright("–") s upright(" crossing") \) \,\
bb(P) \( upright("actual ") r upright("–") R upright(" crossing") \) & gt.eq c / 2 thin bb(P) \( upright("actual ") r upright("–") s upright(" crossing") \) . $ <sector:inner-extension>]

 Every crossing on these lines is required to stay between its indicated radial cuts. The searches establishing the two estimates are applied separately under this same original law.]
] <sector:end-extension>

#proof[
  For the first estimate the explored band is $\[ a \, s \]$, its near cut is $a$, and the targeted end is $r$. For the second it is $\[ r \, s \]$, its near cut is $s$, and the targeted end is $R$. In either case write $E$ for the actual crossing event in the explored band. In the first instance the opposite original end wire at $R$ lies beyond the retained band. In the second, the opposite original end wire at $r$ meets the measured path on the retained far cut. This is the only difference in the removal of end identifications below. Apply Lemma 35 from both flanks. On a favorable leaf $omega$, namely a successful search with its own clearance in that lemma, call the uninspected flank the right flank and its measured open path $P$. Let $G_omega$ be the conditional graph obtained from the full $H_k \( r \, R \)$ by deleting the inspected closed edges, contracting the inspected open edges, and imposing the two original separate end wires. The remaining edges in this graph have exactly the FK law conditional on $omega$. Write $T$ for the targeted end terminal in $G_omega$; all vertices of $P$ already belong to one terminal there. Thus the probability of contact in the full network conditional on $omega$ is $bb(P)_(G_omega) \( P arrow.l.r T \)$.
  Attach to the ordinary explored band a closed lattice rectangle running along the right flank across the missing end gap. Its transverse width is
  #[#set math.equation(numbering: n => "(5.23)")
   $ w = ⌊frac(min { upright("target radius") \, upright("near radius") }, 8)⌋ . $ <sector:extension-width>]
  The rectangle lies in the quadrant adjacent to that flank. Its opening on the near cut lies strictly to the right of the endpoint of $P$: the clearance is at least half the whole near arc, whereas $w$ is at most one eighth of its radius. Its aspect ratio is bounded in terms of $L$; $w$ is positive at the scales under consideration. Let $H_(*)$ be the ordinary explored band together with this rectangle, and let $B_0$ be the rectangle’s end interval on the targeted radial cut.
  Define the reference graph
  $ R_omega = H_(*) \/ \( P \, B_0 \) . $
  It has all ordinary edges of the explored band and attached rectangle, with the vertices of $P$ and $B_0$ wired separately and no other identifications. In particular it has none of the other measured deletions or contractions in $G_omega$. We claim
  #[#set math.equation(numbering: n => "(5.24)")
   $ bb(P)_(G_omega) \( P arrow.l.r T \) gt.eq bb(P)_(R_omega) \( P arrow.l.r B_0 \) = g_(H_(*)) \( P \, B_0 \) . $ <sector:conditional-extension>]
  We compare these two graphs through changes that cannot increase the tested probability in $G_omega$. For these comparisons, represent its fixed ties by auxiliary links of finite odds and take their contraction limits afterward. Shrinking the targeted end wire to $B_0$ does not increase the tested connection probability by adjacency; its removed vertices remain ordinary vertices of the graph. The deleted closed edges expose $P$ to the starting-flank exterior. Draw the terminal test edge through that accessible region and the exterior to an exterior representative of $B_0$. Keep auxiliary cap chains narrow.
  Every edge outside $H_(*)$ can now be removed by cofacial face expansion. On the target side, the part of the end gap omitted by the rectangle opens through the remaining target boundary or through a flank; the restricted $B_0$ cap seals neither access. On the far side, the omitted part opens through the far boundary and the flanks. Thus each unwanted edge has a midpoint accessible from a test-edge face across only unwanted edges. If the opposite full end wire is beyond the retained band, remove its auxiliary cap links first from that same exterior. For each finite comparison, cofacial Rayleigh says that the ensuing deletion does not increase the network connection probability. Fixed open ties can equivalently be assigned odds tending to infinity and then contracted, so this argument applies also in their presence.
  Delete the vertices of $P$ from $H_(*)$ and take the component accessible from the rectangle. Define $U_omega$ by adjoining to this component its incident edges into $P$ and the terminal vertex sets $P \, B_0$. Every edge interior of $U_omega$ outside $P$ is uninspected and has its ordinary odds. Now contract $P$; its own edges become loops and may be omitted. The searched side, and any pieces cut off from the rectangle by contacts of $P$ with a flank, attach to $U_omega$ only at this contracted vertex. In the second application the retained opposite end wire also meets $P$; remove its additional identifications first. This again does not increase the tested probability by adjacency at the $P$ terminal.
  Now compare the reduced conditional graph with $R_omega$. They have exactly the same ordinary graph on $U_omega$, with $P$ and $B_0$ as separate terminals. In either graph every remaining piece outside $U_omega$ attaches to it only at $P$. An FK graph attached through one vertex contributes a partition-function factor independent of the other side’s states, so those pieces cancel from the terminal connection marginal. The marginal is therefore the one in $R_omega$. Its tested probability is therefore at most that in $G_omega$, proving (5.24).
  It remains to bound its right-hand side uniformly in the history. Choose an interval $J$ of fixed positive relative length on the left band flank, with radius comparable to the near radius and away from both radial cuts. In the first application retain temporarily only the rectangle and the subband $\[ a \, 4 a \]$, choosing $J$ there. In the second retain the rectangle and $\[ floor.l s \/ 4 floor.r \, s \]$, again choosing $J$ in its interior radial range. The assumed large ratio ensures that these subbands fit.
  There is a boundary route from $B_0$ along the right flank, around the truncation rim opposite the rectangle opening, and back along the left flank to $J$. In the first case it uses the outer rim; in the second it uses the inner rim. Along the rectangle, its inward clearance is a fixed fraction of $w$, and along the sector it is a fixed fraction of the near radius. Their ratio is bounded in terms of $L$. Straight portions and corner neighborhoods therefore admit the hypotheses of Lemma 31, with constants depending only on $L \, k$. At the inner-rim corners use the clipped-square construction in that lemma. At split banks use their own sides of the abstract disk, never a neighborhood crossing the slit. It follows that the pure $B_0$–$J$ connection probability in this truncated shape is at least $c \( q \, L \, k \) > 0$.
  Extend to $H_(*)$ cofacially. The further band pieces open to the exterior beyond the truncated rim; the two terminal caps are on $B_0 \, J$ and do not obstruct this access. Consequently
  $ g_(H_(*)) \( B_0 \, J \) gt.eq c \( q \, L \, k \) . $
  Every graph route from the attached rectangle to $J$ meets $P$, because $P$ is a radial separator and the rectangle opening is on its right. Add $P$ to the $J$ terminal by adjacency. Once $P$ is contracted, all the remaining pieces on the $J$ side attach only at that terminal and factor out. Wiring their $J$ vertices to it does not change the other side’s marginal law. Therefore
  $ g_(H_(*)) \( P \, B_0 \) = g_(H_(*)) \( P union J \, B_0 \) gt.eq g_(H_(*)) \( J \, B_0 \) gt.eq c \( q \, L \, k \) . $
  Together with (5.24), this is the required lower bound given each favorable exploration history.
  A successful network connection here supplies the indicated actual extension. First expand every contracted measured-open component along its already measured physical edges. The only remaining abstract jumps are in the two original end wires. Starting from the target terminal, trim its path after its last use of the target wire. If it reaches the opposite end wire or leaves the explored band past the far cut before reaching $P$, its physical portion has already reached that cut. Otherwise it reaches the measured physical path $P$, which continues to the far cut. Erasing loops gives an actual crossing, stopped at its first visit to the far cut. A target-wire jump only chooses the starting vertex of this physical path.
  For the last probability step, let $F_1 \, F_2$ be the favorable history events for the two flank explorations. They are both contained in $E$, and Lemma 35 gives $F_1 union F_2 = E$. Apply the conditional estimate separately to each exploration, not to a joint unexplored law. If $E'$ is the extended actual-crossing event, then
  $ bb(P) \( E' \) gt.eq c bb(P) \( F_i \) quad \( i = 1 \, 2 \) \, #h(2em) bb(P) \( E' \) gt.eq c max_i bb(P) \( F_i \) gt.eq c / 2 bb(P) \( E \) . $
  This proves both asserted inequalities. In particular the second one is a fresh application under the original law, not an application under a law conditioned on the outcome of the first search. ◻
]

#proof[
  Only the qualitative blank decay remains to be shown. Fix $k$ and an orientation. If it fails, there is $epsilon.alt > 0$ and sectors with arbitrarily large $R \/ r$ for which $b_k \( r \, R \) gt.eq epsilon.alt$.
  Choose such a sector with $R \/ r$ so large that it contains $n$ mutually disjoint radial bands, each of ratio at least $n$, and each of inner radius at least $n$. The bands may be separated by additional radial gaps. This is possible for every $n$: for example, choose the original ratio larger than $n^(4 n)$ and use successive geometrically spaced integer radii, increasing the ratio slightly to absorb roundoffs. Removing one closed band leaves an inner piece and an outer piece with no physical route between them. Conditional on all edges outside that band, each piece induces a noncrossing partition only on its own radial cut. There are no lateral wires and no through ties. By (5.20), the conditional crossing probability in that band is bounded by its own blank probability.
  A full-sector crossing requires crossings of all the bands. Conditioning outside one band at a time therefore gives
  $ epsilon.alt lt.eq b_k \( r \, R \) lt.eq product_(i = 1)^n b_k \( r_i \, R_i \) . $
  No independence is asserted here. At least one factor is at least $epsilon.alt^(1 \/ n)$. Selecting such a band for every $n$ produces a new sequence, renamed $\( r \, R \)$, with
  #[#set math.equation(numbering: n => "(5.25)")
   $ r arrow.r oo \, #h(2em) R \/ r arrow.r oo \, #h(2em) b_k \( r \, R \) arrow.r 1 . $ <sector:blank-near-one>]
  Choose a fixed integer $L gt.eq 2$ sufficiently large that Proposition 29 gives
  #[#set math.equation(numbering: n => "(5.26)")
   $ Q_k \( x \, y \) lt.eq q - epsilon_0 #h(2em) upright("whenever ") y \/ x gt.eq L $ <sector:collar-pure-small>]
  for some fixed $epsilon_0 > 0$. Enlarge $L$ once if necessary for integer cut conventions. Consider the actual crossing of the central band
  $ \[ a \, s \] = \[ 2 L r \, floor.l R \/ \( 2 L \) floor.r \] . $
  Its probability tends to one in the blank law by (5.25), since a full crossing contains such a central crossing.
  Insert the full inner end wire, using its collar $\[ r \, L r \]$. Conditional on the exterior of this collar, the exterior gives only an opposite-cut cap partition. Lemma 24 and (5.26) bound the density and its reciprocal on that exterior by a constant $C_0 < oo$ independent of $r \, R$. For example, the logarithmic variation is at most
  $ log (1 + frac(\( t - 1 \) \( q - epsilon_0 \), 1 - t \( q - epsilon_0 \))) \, $
  whose denominator is positive. Now insert the full outer end wire, using $\[ floor.l R \/ L floor.r \, R \]$. The same estimate applies: the already inserted inner wire is part of the exterior and still induces only a noncrossing cap partition on the collar’s opposite cut. The central event is exterior to both collars. Its failure probability after both insertions is at most $C_0^2$ times its blank failure probability, and hence tends to zero.
  Apply the two estimates of Lemma 36 under this law with full separate end wires. Their constants are fixed, because $q \, L \, k$ are fixed. They give
  $ liminf_(R \/ r arrow.r oo) bb(P)_(H_k \( r \, R \) \/ \( A_r \, A_R \)) \( upright("actual ") r upright("–") R upright(" crossing") \) gt.eq frac(c \( q \, L \, k \)^2, 4) > 0 $
  along the sequence (5.25). With only these two separate full wires, terminal network connection is equivalent to existence of an actual path between the two end arcs: take a simple terminal path and remove its initial and final wire portions. The displayed probability is therefore $Q_k \( r \, R \)$, contradicting Proposition 29. This proves the blank decay, and the end-cap comparisons were established at the start. ◻
]

#thm([Corollary 5.9.])[
  (Power-law sector bound).  #emph[For each fixed finite integer $k gt.eq 1$ there are constants $C < oo$ and $eta > 0$, depending on $q \, k$, such that for all integer $1 lt.eq r < R$, 
#[#set math.equation(numbering: n => "(5.27)")
 $ b_k \( r \, R \) lt.eq C \( r \/ R \)^eta . $ <sector:power-arm>]

 The same upper bound holds for actual crossings under arbitrary separate inner and outer cap partitions, with no other ties. Their partition-function ratio in (5.21) lies between $1 - C \( r \/ R \)^eta$ and $1$.]
] <cor:sector:power>

#proof[
  Choose an integer $M gt.eq 2$ so large that the supremum in Proposition 34 at ratio $M$ is at most some fixed $theta < 1$. Between $r$ and $R$ place the bands
  $ \[ \( 2 M \)^j r \, med M \( 2 M \)^j r \] \, $
  for all consecutive integers $j gt.eq 0$ for which they fit. Their number $N$ is at least $log \( R \/ r \) \/ log \( 2 M \) - 1$, unless this lower bound is negative, in which case the eventual estimate follows by increasing $C$. The intervening gaps make the edge sets disjoint. Conditioning outside each band induces only separate end caps, so the same iteration as above gives a crossing probability at most $theta^N$. This argument also applies with prescribed separate cap partitions at the two original ends, because neither partition joins the inner and outer components left by removing a band. Taking
  $ eta = frac(- log theta, log \( 2 M \)) $
  and absorbing the one-band discrepancy into $C$ proves the first two assertions. The last follows from (5.21). ◻
]

#prodef([Remark 5.10.])[
  All constants above are for fixed $q$ and fixed finite $k$. The proof uses a number of boundary portions bounded in terms of $k$, and always works on the disk with its two distinct banks. It gives no uniformity as $k$ increases, and none of its assertions compares arbitrary through partitions or lateral wires.
]

=== 5.5 Localizing pressure in a sector collar <sector:pressure-localization>

The sector arm bound concerns a disk with two accessible end arcs. The two rims of an annulus lie on different complementary faces, so the disk end-cap comparisons do not directly compare them. We approach that problem through the site pressure. First we bound the coefficient mass crossing a sector collar; then we use such collars to obstruct diverging pressure near a free wall or a measured path. A local search inside the annulus will produce one of these path obstructions with uniformly positive probability.

For a finite weighted graph $G$, write $Z_G$ for its random-cluster partition function. All original edges are retained after a quotient, including loops. If $D$ is a nonempty vertex set, $F_D$ denotes its full wire and $k_D$ the number of open components meeting it. We use

#[#set math.equation(numbering: n => "(5.28)")
 $ K_G \( D \) & = log bb(E)_G t^(k_D) \,\
Delta_G \( A \, E \) & = K_G \( A \) + K_G \( E \) - K_G \( A union E \) \,\
I_G \( X \, Y \) & = log frac(Z_(G \/ X) Z_(G \/ Y), Z_G Z_(G \/ \( X \, Y \))) . $ <sector:K-definition>]

Here $X$ and $Y$ are partitions supported on $A$ and $E$, respectively; an empty partition means no additional identifications. Rim sets in a quotient always mean their images there.

Let $c_G \( m \)$ be the coefficient of $x^m$ in the nonnegative expansion of $- log F_G$ from Theorem 7. The coverage identity is

#[#set math.equation(numbering: n => "(5.29)")
 $ Delta_G \( A \, E \) = sum_("supp" m ∩ A eq.not diameter\
"supp" m ∩ E eq.not diameter) c_G \( m \) . $ <sector:pressure-mass>]

Every support in this sum is connected in $G$. Moreover,

#[#set math.equation(numbering: n => "(5.30)")
 $ sum_("supp" m in.rev z) c_G \( m \) = K_G \( { z } \) = log t #h(2em) \( z in V \( G \) \) . $ <sector:one-vertex-mass>]

The equality holds because exactly one open component meets a given vertex, regardless of the edge states.

We record two algebraic identities, including the version with nonempty base caps that will be needed after duality.

#thm([Lemma 5.11.])[
  (Mixed pressure identities).  #emph[For partitions $X_i$ on $A$ and $Y_j$ on $E$, $i \, j in { 0 \, 1 }$, put $G_(i j) = G \/ \( X_i \, Y_j \)$ and $Z_(i j) = Z_(G_(i j))$. Then 
#[#set math.equation(numbering: n => "(5.31)")
 $ log frac(Z_10 Z_01, Z_11 Z_00) = Delta_(G_00) - Delta_(G_10) - Delta_(G_01) + Delta_(G_11) . $ <sector:four-Delta>]

 This identity is valid even if the images of $A$ and $E$ overlap. If $A \, E$ are disjoint before any caps are imposed and $p = g_G \( A \, E \)$, then 
#[#set math.equation(numbering: n => "(5.32)")
 $ Delta_G \( A \, E \) = I_G \( F_A \, F_E \) - log \( 1 - u p \) . $ <sector:full-wire-identity>]

 In particular the second term on the right belongs to $\[ 0 \, log t \]$.]
] <sector:mixed-identities>

#proof[
  Full wiring decreases the number of components by $k_D - 1$, so
  #[#set math.equation(numbering: n => "(5.33)")
   $ K_G \( D \) = log t + log Z_(G \/ F_D) - log Z_G . $ <sector:full-wire-gain>]
  Substitute this expression in each pressure term in (5.31). Wiring all of $A$ subsumes either $X_i$; wiring all of $E$ subsumes either $Y_j$; and wiring $A union E$ subsumes both. The full-wire terms therefore cancel in the indicated alternating sum, leaving exactly the displayed mixed log ratio. This argument also works when the two rim images overlap.
  For (5.32), first wire $A$ and $E$ separately. Joining the two resulting terminals has partition gain
  $ p + t \( 1 - p \) = t \( 1 - u p \) . $
  Insert this gain and (5.33) into the definition of $Delta_G$. The asserted bounds follow from $0 lt.eq p lt.eq 1$. ◻
]

#thm([Lemma 5.12.])[
  (Clean sector cap pressure).  #emph[Let $H$ be a straight-wall sector $H_k \( r \, R \)$, or a fixed finite disjoint union of such sectors with the same scale ratio. The number of quadrants in each sector is fixed, and banks are not identified. In the union case, arrange the components in one disk so that their inner rims $A$ lie on one boundary arc and their outer rims $E$ on a disjoint boundary arc, with the prescribed seam orders.]
  #emph[There are $c > 0$, $C < oo$ and $L < oo$, depending only on $q$, the fixed numbers of components and quadrants, and the prescribed seam orders, with the following property. For every choice of the radii with $R \/ r gt.eq L$ and every pair of separate noncrossing cap partitions $X \, Y$ on $A \, E$, 
#[#set math.equation(numbering: n => "(5.34)")
 $ Delta_H \, quad Delta_(H \/ X) \, quad Delta_(H \/ Y) \, quad Delta_(H \/ \( X \, Y \)) med lt.eq C \( r \/ R \)^c . $ <sector:clean-four-bounds>]

 The corresponding interaction satisfies 
#[#set math.equation(numbering: n => "(5.35)")
 $ 0 lt.eq I_H \( X \, Y \) lt.eq C \( r \/ R \)^c . $ <sector:clean-I-bound>]

]
] <lem:sector:cap-pressure>

#proof[
  Corollary 37 and a union bound over the fixed number of components give
  $ b_H := bb(P)_H \( upright("an actual path joins ") A upright(" to ") E \) lt.eq C_0 \( r \/ R \)^(c_0) . $
  Lemma 26 applied to the two full end wires gives $p = g_H \( A \, E \) lt.eq b_H$. Choose $L$ so that $t p lt.eq 1 \/ 2$. By Lemma 24,
  $ 0 lt.eq Delta_H lt.eq log (1 + frac(\( t - 1 \) p, 1 - t p)) lt.eq C_1 \( r \/ R \)^(c_0) . $
  The one-sided identity, with images understood, is
  $ I_H \( X \, F_E \) = Delta_H - Delta_(H \/ X) . $
  Its nonnegative left side bounds $Delta_(H \/ X)$ by $Delta_H$; the argument with $A \, E$ interchanged bounds $Delta_(H \/ Y)$. Lemma 27 gives
  $ 0 lt.eq I_H \( X \, Y \) lt.eq - log \( 1 - b_H \) lt.eq C_2 \( r \/ R \)^(c_0) . $
  Finally (5.31), with empty base caps, yields
  $ Delta_(H \/ \( X \, Y \)) = I_H \( X \, Y \) - Delta_H + Delta_(H \/ X) + Delta_(H \/ Y) lt.eq C_3 \( r \/ R \)^(c_0) . $
  This proves both conclusions. The argument uses the accessible, separate disk arcs in its hypotheses, not just the fact that the underlying graph has a planar drawing. ◻
]

#thm([Lemma 5.13.])[
  (A bounded number of through hubs).  #emph[Fix the geometric data of Lemma 40 and an integer $J gt.eq 0$. For any radii in that lemma’s range, form $G$ by identifying at most $J$ blocks of vertices of $H$, called hubs. A block may touch both rims. Also impose partitions $X$ and $Y$ at the two rims. Assume the following residual-cap condition in each of the four quotients obtained by including or omitting $X \, Y$: after removing every cap class that joins a hub, the remaining classes are separate noncrossing caps on the original two rims.]
  #emph[There are constants $c \, C$, depending only on $q$, the fixed geometric data, and $J$, and uniform over the radii, hub blocks, and cap partitions satisfying these hypotheses, such that in any of the four quotients the contribution to $Delta$ of multisets avoiding every final hub is at most $C \( r \/ R \)^c$. Its total pressure is at most 
#[#set math.equation(numbering: n => "(5.36)")
 $ C \( r \/ R \)^c + J log t . $ <sector:hub-pressure-bound>]

 Consequently $\| I_G \( X \, Y \) \|$ is uniformly bounded. No bound depends on the number of contacts in a hub block.]
] <lem:hub-mass>

#proof[
  Fix one of the four quotients. Discard all cap classes absorbed into its hubs, obtaining clean residual caps $X' \, Y'$ in $H$. In $H \/ \( X' \, Y' \)$, set to zero the site variables of all vertices that will be absorbed into a hub. A cluster meeting one of these vertices has factor one in the defining product for $F$. Identifying any of these zero-variable vertices with each other cannot alter a factor from a cluster avoiding them: if two such clusters were joined by the identification, each would already meet a zero-variable vertex and would already have factor one. The underlying independent edge states are unchanged. Loops and parallel-edge combinations preserve the same product law on the remaining states.
  Thus the two polynomials with the indicated site variables clamped are identical. Their negative logarithms have identical coefficients on the retained sites. The hub-avoiding part of the quotient’s hit-both mass is therefore a submass of the clean pressure for $H \/ \( X' \, Y' \)$, bounded by Lemma 40. Every other multiset hits at least one of at most $J$ final hub vertices. Equation (5.30) and a union bound give the remaining $J log t$. Apply (5.31) to the four quotients to bound the mixed interaction. ◻
]

The last Lemma has a useful density interpretation. Suppose edge states beyond a collar induce partitions at its far rim and fixed through blocks, with the residual-cap hypothesis holding for every state. If $X$ is changed at the near rim, the ratio of its partition gain for any two such far states is bounded by a fixed factor. Indeed the logarithm of that ratio is a difference of two interactions of the form just bounded. After normalization, the far-edge marginals have uniformly bounded density and reciprocal density. A bounded number of extra links bypassing the cut can first be split, at a bounded-rank component-counting cost, into the stated through-hub form. This interpretation does not remove the residual-cap hypothesis.

=== 5.6 Transplanting coefficient mass <sector:transplant-subsection>

#thm([Lemma 5.14.])[
  (Incidence-factor transplantation).  #emph[Let a set $V_(*)$ of allowed sites occur in two finite weighted graphs. Their induced weighted graphs on $V_(*)$ are identical. Suppose that, at each allowed site, the second graph has no larger incident external product 
$ product_(e = z w\
w in.not V_(*)) \( 1 + v_e \) #h(2em) \( z in V_(*) \) . $

 Loops may be ignored and parallel edges are combined by multiplying their factors $1 + v_e$. Then for every multiset $m$ supported on $V_(*)$, 
#[#set math.equation(numbering: n => "(5.37)")
 $ c_(G_2) \( m \) gt.eq c_(G_1) \( m \) . $ <sector:transplant-coefficient>]

 The graphs and identifications away from $V_(*)$ may otherwise change.]
] <lem:transplant>

#proof[
  In the multiset expansion proving Theorem 7, put $gamma_z = product_(e in.rev z) \( 1 + v_e \)^(- 1)$. The coefficient on $m$ is the coefficient in the rescaled variables $y_z = gamma_z x_z$, multiplied by $product_z gamma_z^(m_z)$. The rescaled coefficient depends only on the induced weighted graph on $"supp" m$: its connected-structure expansion uses only ordinary edges between members of that support and the hard edges between copies of a site. It is nonnegative. The rescaled coefficients are therefore identical in the two graphs, whereas the incidence assumption makes every relevant $gamma_z$ at least as large in the second. This proves (5.37), including the case of a zero coefficient. ◻
]

We will apply this Lemma with forbidden sites replaced by ordinary grid filler. Its hypotheses require more than a pointwise drawing: no new edge may be imposed between two previously allowed sites, and each new edge from an allowed site to filler must be charged to an old incident edge to a forbidden site.

#thm([Lemma 5.15.])[
  (Attaching separate side graphs).  #emph[Suppose an ordinary collar $H$ has 
$ \| I_H \( X \, Y \) \| lt.eq C $

 for all separate caps permitted at its two cuts. Attach arbitrary finite graphs on its two sides, with no bypass from one side to the other, so that fixing their edge states induces permitted caps. Bounded product comparisons persist after summing those states and after arbitrary separate changes to either attached graph. In particular the combined graph has bounded pressure $Delta$ between the two full cut sets. All bounds depend only on $C \, q$.]
] <sector:attached-sides>

#proof[
  For a fixed state on each side, absorb its edge weights and the component factors of clusters not touching the collar into positive weights $a_X \, b_Y$. Component counting then gives the combined partition function as
  $ Z_(upright("comb")) = sum_(X \, Y) a_X b_Y Z_(H \/ \( X \, Y \)) . $
  Several states inducing the same cap may be combined into its weight. The assumed bound is exactly
  $ e^(- C) frac(Z_(H \/ X) Z_(H \/ Y), Z_H) lt.eq Z_(H \/ \( X \, Y \)) lt.eq e^C frac(Z_(H \/ X) Z_(H \/ Y), Z_H) . $
  Multiplication by $a_X b_Y$ and summation factor the right and left expressions into a product of a first-side sum and a second-side sum. This remains true when either side’s weights are changed, including when its cut is fully wired. Taking a mixed ratio for two choices on each side cancels the separate sums and leaves a factor between $e^(- 4 C)$ and $e^(4 C)$. In particular the interaction of the two full cut wires in the combined graph is bounded. Equation (5.32) adds at most $log t$ to obtain the pressure bound. This proof also explains why a side graph attaching on a bank or bypassing the collar is excluded. ◻
]

=== 5.7 Large pressure fills clear bulk <sector:dense-mass-subsection>

We now show that a diverging coefficient mass must visit every untouched bulk patch. The argument is local: a support that misses a narrow radial slit can be compared with one crossing a regular sector, whose mass is already bounded. We formulate the compactness argument so that the graph and its identifications may vary freely outside the clear region. A family of graphs has a #emph[clear bulk region] $V$ if $V$ is a fixed connected open planar set with the following property. For every compact subset of $V$, there is a mesh threshold, independent of the permitted remote cap partition, below which every graph in the family is the ordinary square grid there, with no identifications. Small annuli compactly contained in $V$ separate their inner graphs from the exterior, and every induced exterior partition is planar. All marked sets under discussion lie outside $V$; more generally, at a specified local application it suffices that they stay away from each compact subset used there. Graphs and planar boundary partitions outside $V$ may vary with the mesh and need not have a common bounded embedding. In the lemmas below, the region, compact hit sets, and local geometric neighborhoods are fixed before this variation. We also retain the local counting property of these mesh-grid families: for each compact subset of $V$ and each $delta_0 > 0$, the number of sites represented there is uniformly bounded over graphs with $delta gt.eq delta_0$. This is the property used when a uniform bound is extended from fine meshes to meshes bounded below.

#thm([Lemma 5.16.])[
  (Density of a diverging pressure mass).  #emph[For graphs of mesh $delta arrow.b 0$ with clear bulk $V$, consider any collection $cal(M)_delta$ of positive-coefficient multisets. Assume that every support in the collection meets a fixed compact set $C subset V$ and also a marked site outside $V$. If its total coefficient mass tends to infinity, sample a multiset with probability proportional to its coefficient.]
  #emph[Let $V^dagger = V union { oo }$ be the one-point compactification of $V$, with any compatible compact metric. Record the physical locations in $V$ represented by the sampled support and adjoin $oo$; denote this compact set by $K_delta$. A quotient site is represented at every original site it contains. On each compact subset of $V$ these are ordinary distinct grid sites for all sufficiently small meshes. Let $K$ have any weak subsequential limit law of $K_delta$ on the Hausdorff hyperspace of nonempty compact subsets of $V^dagger$. Such subsequences exist. Then almost surely 
#[#set math.equation(numbering: n => "(5.38)")
 $ V subset K . $ <sector:full-bulk-limit>]

 No position or common bounding box for sites outside $V$ is required.]
] <sector:dense-mass>

#proof[
  We first bound the unnormalized mass of a fixed avoided-slit pattern. Take a small square annular collar compactly contained in $V$, with fixed positive inner radius and a sufficiently large fixed ratio of outer to inner radius. Slit it along one coordinate ray. Consider supports that meet the inner ball, reach outside the outer cut, and avoid all sites of the ray across the band. Delete these forbidden ray sites and replace the band by the regular full-angle disk sector with its two banks distinct. Keep all allowed sites, including those in the inner and outer side graphs, and all their induced edges.
  At an allowed collar site, a new bank edge can only replace an old edge to one of the deleted ray sites, with at most one replacement in each coordinate direction. At the rim transitions keep the original allowed edges. The regular collar is closed at its radial cuts and requires no additional outward continuations there; in particular an attached side-graph edge is not duplicated by a filler edge. Omit unnecessary edges to new forbidden sites outside the filled part. Hence no incident external product is increased. There is no old edge between the two banks after the ray sites have been removed, and the inner and outer graphs attach only at their respective cuts. Their cap partitions are noncrossing in the linearized cyclic order. Lemmas 42, 40, and 43 therefore bound the mass of this pattern by a constant depending on the fixed collar. Grid centers and radii can be rounded by bounded mesh steps. When the avoided ray has a positive physical clearance from the support, these roundings do not change the pattern for small meshes.
  The space $V$ is locally compact and second countable, so $V^dagger$ is compact metrizable; its Hausdorff hyperspace is compact as well. This proves the existence of the subsequential laws in the statement. We now pass the fixed-pattern bound to any such limit.
  For a fixed collar compactly contained in $V$, choose an open ball strictly inside its inner cut, and let $Sigma$ be its compact slit segment. For $epsilon > 0$, consider the hyperspace event
  $ { K : K upright(" meets the inner ball and ") "dist" \( K \, Sigma \) > epsilon } . $
  It is open: meeting an open ball is an open Hausdorff condition, and the distance to a fixed compact set is continuous. If $K_delta$ belongs to this event, the inner hit comes from the original support, not from $oo$. That support is connected in the quotient graph, by Theorem 7, and it contains a marked site outside $V$. Since the collar lies in clear bulk, with no quotient jumps or bypass through it, the support must cross the outer cut. On a fixed compact neighborhood of the collar, the compatible metric and the Euclidean metric induce the same uniformity. Moving slit points by a bounded number of mesh steps therefore moves them uniformly by $o \( 1 \)$ in the compatible metric. The positive clearance from $Sigma$ makes the support avoid the rounded slit sites for all sufficiently small meshes. The fixed-pattern mass bound therefore applies. Dividing by the diverging total mass and using the open-set part of the Portmanteau theorem shows that this event has probability zero under the limit law. The adjoined point $oo$ has supplied compactness only; it has not been counted as an outer exit.
  It suffices to use a countable collection of rationally specified collars, inner balls, and positive clearance margins. Strict hits and clearances persist under sufficiently small changes of these data. Every $K_delta$ meets the fixed compact $C$, so every weak limit meets $C$ almost surely. Suppose such a limit does not fill $V$. The set $K ∩ V$ is closed relative to $V$. Choose a point of $V \\ K$ sufficiently near a point of $K ∩ V$ and work inside a compact ball contained in $V$. A Euclidean nearest point of $K ∩ V$ is attained there, and a sufficiently small complementary open disk tangent to $K$ at that point has closure in $V$. At least one coordinate direction points strictly into this disk. A short segment of that ray, away from its starting point, has positive distance from $K$. Choose a large fixed-ratio collar about the tangency point with its slit on this segment and with a strict inner hit. Perturbing its data slightly to the countable rational family preserves the hit and clearance. This is one of the probability-zero events just excluded, a contradiction. ◻
]

#thm([Lemma 5.17.])[
  (A free wall obstructs diverging pressure).  #emph[Fix a connected clear bulk region $V$ and a compact set $C_(*) subset V$. In fixed grid coordinates, for some $h > 0$ put 
$ W = \( - 2 h \, 2 h \) times \( 0 \, 2 h \) \, #h(2em) J = \( - 2 h \, 2 h \) times { 0 } . $

 Assume $W subset V$ and that $J$ is a straight free-wall patch. For all sufficiently fine meshes, uniformly in the permitted remote partition, every graph has ordinary grid incidences up to $J$ from $W$ and has no exterior attachment or identification along $J$. Put $W_0 = \( - h \, h \) times \( 0 \, h \)$.]
  #emph[Suppose $A union E$ is disjoint from $V$, every support contributing to $Delta_G \( A \, E \)$ meets $C_(*)$, and at least one of the two marked sets stays at distance at least a fixed $d_0 > 0$ from $overline(W_0)$. The other marked set may occupy the wall rim $J$. Then 
#[#set math.equation(numbering: n => "(5.39)")
 $ Delta_G \( A \, E \) lt.eq C $ <sector:free-wall-bound>]

 uniformly over the meshes, graphs, and planar partitions satisfying these fixed conditions. The constant may depend on $q \, V \, C_(*) \, h \, d_0$, but not on the remote partition.]
] <sector:free-wall>

#proof[
  If the pressure were unbounded along meshes tending to zero, Lemma 44 would force its normalized supports to fill $V$. Place a small half-box collar at the midpoint of $J$, inside $W_0 union J$, with outer radius less than $d_0 \/ 2$ and a large fixed ratio between its two radii. This is a two-quadrant disk sector. Its lateral boundary lies on the free wall and has no attachments. The graph inside its inner cut and the remainder outside its outer cut induce separate end caps. Lemmas 40 and 43 bound the mass of connected supports meeting both cuts.
  Choose a fixed tiny bulk patch strictly inside the inner cut. Density makes the normalized support meet this patch with probability tending to one. Connectedness to a remote marked set forces an exit from the outer cut, even if the other mark lies on the wall rim. This contradicts the bounded unnormalized cut mass.
  It remains to justify uniformity when the mesh is bounded below. Every counted support meets the fixed compact set in the hypothesis, which contains only a uniformly bounded number of represented sites by the local counting property of the clear family. Equation (5.30) bounds the pressure by their number times $log t$, uniformly over the remote graphs and partitions. Thus an unbounded sequence would necessarily have a subsequence with mesh tending to zero, which was just excluded. ◻
]

=== 5.8 An exposed path obstructs diverging pressure <sector:path-defect-subsection>

We next replace a deterministic free wall by one discovered inside the bulk. This is the only step that requires an angular cover with more than one turn. All sector results above hold for every fixed finite number of successive quadrants: the boundary route has only finitely more straight pieces, while the fan order, radial gaps, and end-cap arguments are unchanged. We may therefore use a cover of twelve quadrants. Its constants are fixed, not uniform in the number of turns. Figure 5 distinguishes the original uninspected region from the larger regular sector used in the coefficient comparison.

#thm([Lemma 5.18.])[
  (Conditional exposed-path defect).  #emph[Let $V_(upright("bulk"))$ be a fixed clear bulk region. In fixed grid coordinates, let 
$ B = \[ b_(-) \, b_(+) \] times \[ y_(-) \, y_(+) \] \, #h(2em) L = \[ l_(-) \, l_(+) \] times \[ y_(-) \, y_(+) \] \, #h(2em) l_(-) < b_(-) < b_(+) < l_(+) \, $

 with $overline(L) subset V_(upright("bulk"))$. Put $y_c = \( y_(-) + y_(+) \) \/ 2$, $h = y_(+) - y_(-)$, and let 
$ J_(+) = { l_(+) } times \[ y_c - h \/ 4 \, y_c + h \/ 4 \] $

 be the middle part of the enlarged right edge. Fix a connected open set $V_0 subset V_(upright("bulk")) \\ B$, a compact set $C_(*) subset V_0$, and an open neighborhood $N_(+)$ of $J_(+)$ contained in $V_0$.]
  #emph[Search from the left of $B$ by complementary dual-face exploration, without exiting through its horizontal sides. On vertical primal-crossing success, exhaust the reached face component and choose its extremal simple open frontier $P$, trimmed after its last bottom-level visit and before its first subsequent top-level visit. Thus its only contacts with those levels are its endpoints. Condition on the measured leaf.]
  #emph[Suppose $A union E$ is outside $V_(upright("bulk"))$. For every successful leaf and every permitted remote planar cap choice, assume that every positive-coefficient support meeting both $A$ and $E$ in the resulting conditional graph also meets $C_(*)$. All the geometric data above are fixed independently of the mesh, leaf, and cap choice. Then the conditional untested graph satisfies 
#[#set math.equation(numbering: n => "(5.40)")
 $ Delta \( A \, E \) lt.eq C $ <sector:path-defect-bound>]

 uniformly over successful leaves and permitted remote planar caps, with the bound depending only on $q$ and the fixed geometric data. The same statement holds after rotating the axes or interchanging the primal and dual grids.]
] <lem:sector:path-defect>

#proof[
  The planar path/cut alternative gives the frontier implementation in the statement. Start in the left exterior face; entering an interior face requires querying its boundary edge and finding it closed, so interior faces adjacent to the flank are not seeded for free. Exhaust the complementary faces reached from there, querying an edge only when one of its incident faces is reached. If a primal crossing exists, this component cannot reach the opposite side. Its separating frontier contains a simple top-to-bottom path supported on measured open edges. Equivalently, setting every unqueried edge closed still leaves such a crossing. Fix deterministic tie breaks to select the extremal simple frontier. No reached face lies strictly on its right, and an edge with midpoint strictly on its right has both incident faces there. Hence every such edge is uninspected. Boundary contacts are handled by outward prolongations of the side incidences; the enlargement from $B$ to $L$ puts the strict right region in a single disk. Denote it by $Omega$. All measurement changes lie in $B$. For a fixed successful leaf $omega$ and a fixed permitted remote cap choice, let $G_omega$ be the conditional untested graph, with measured closed edges deleted, measured open edges contracted, and that cap imposed. Let $p_omega$ be its single vertex containing the physical path $P$.
  ===== 5.8.1 Diverging mass must approach an exposed point. <diverging-mass-must-approach-an-exposed-point.>
  Suppose there is a sequence of such graphs $G_omega$ with unbounded pressure. Discard the mass of multisets hitting the path hub; by (5.30) this costs at most $log t$. The remaining mass still diverges. Avoidance means zero multiplicity at the hub, not deletion of its incident odds from the source graph. Removing the hub in the following geometric discussion describes where these supports can travel; its original incident factors are still available for the coefficient comparison. Choose a vertex $z = \( x_z \, y_z \)$ of $P$ maximizing
  $ x - H \( y - y_c \)^2 \, $
  where $H$ is a fixed sufficiently large constant. Choose it so that $H h^2 \/ 64 > 2 \( b_(+) - b_(-) \)$. A crossing has a vertex within one mesh step of the middle level, whose score is at least $b_(-) - H delta^2$. A vertex with $\| y - y_c \| gt.eq h \/ 8$ has score at most $b_(+) - H h^2 \/ 64$. Hence $\| y_z - y_c \| < h \/ 8$ for all sufficiently fine meshes. Thus the horizontal projection of $z$ on the right edge of $L$ lies in the interior of $J_(+)$. Maximality gives, for every vertex $\( x \, y \)$ of $P$,
  #[#set math.equation(numbering: n => "(5.41)")
   $ x - x_z lt.eq H \( y - y_z \) \( y + y_z - 2 y_c \) lt.eq D \| y - y_z \| \, $ <sector:cone-bound>]
  with the fixed choice $D = H h$. The final cone inequality extends along grid edges: $\| y - y_z \|$ is affine on each vertical grid edge, since $y_z$ is a lattice level, and the horizontal case is immediate. In particular the positive horizontal ray from $z$ to the right side of $L$ is strictly in $Omega$, except at its endpoints, and the open cone $x - x_z > D \| y - y_z \|$ is untouched.
  Pass to a subsequence on which $z arrow.r z_(*) = \( x_(*) \, y_(*) \)$. Choose $D' > D$ large enough that, in the open set
  $ { \( x \, y \) : x - x_(*) > D' \| y - y_(*) \| } ∩ \( L^compose union N_(+) \) \, $
  the component $cal(C)_(+)$ containing the open horizontal segment from $z_(*)$ to $J_(+)$ meets $N_(+)$. This is possible because that segment ends in the interior of $J_(+)$. The union $V_0 union cal(C)_(+)$ is a fixed connected clear region. Compact subsets of $V_0$ lie outside the measurement rectangle, while compact subsets of $cal(C)_(+)$ stay strictly to the right of every sufficiently late path by (5.41). The union is disjoint from $A union E$. The remaining hub-avoiding supports meet $C_(*)$. Lemma 44 therefore forces them to meet every fixed open patch in $cal(C)_(+)$ with probability tending to one.
  ===== 5.8.2 A sector around the uninspected side. <a-sector-around-the-uninspected-side.>
  We will bound the unnormalized mass of hub-avoiding supports that make these visits. To apply the sector pressure estimate, we lift the annular part of $Omega$ around $z$ and place all attachments from outside $Omega$ beyond its outer cut. Choose a fixed small outer radius about $z$ with its square ball uniformly inside $L$, and a much smaller fixed positive inner radius $r$, their ratio large enough for Lemma 40. The center is a grid vertex; round the two radii by bounded mesh steps. Choose a nonempty open patch $U_(+)$ whose closure lies in $cal(C)_(+) ∩ B \( z_(*) \, r \/ 4 \)$. Along the selected subsequence, this fixed patch lies in $Omega ∩ B \( z \, r \/ 2 \)$ for all sufficiently fine meshes: $z arrow.r z_(*)$ and compact subsets of the limiting cone remain strictly to the right of $P$. Thus the normalized support meets the inner ball with probability tending to one, despite its moving center.
  The polar angle about $z$ has a continuous lift on the disk $Omega$. Normalize it to zero on the whole positive horizontal segment. Its range lies in $\( - 2 pi \, 2 pi \)$. Indeed a point where the lifted angle were $2 pi$ or $- 2 pi$ would lie on that same positive ray, whose connected segment already has lift zero; continuity precludes crossing either value. Thus the portion of $Omega$ in our annular band embeds in a fixed larger sector cover, for example the cover with angular range $\[ - 3 pi \, 3 pi \]$.
  Let $J$ be the portion of $partial L$ bounding the right disk, running from the bottom endpoint of $P$ around the right side to its top endpoint. Polar angle is ordered along $J$, because $L$ is a rectangle containing $z$ in its interior. Its lift is therefore a radial graph $𝜚 = f \( theta \)$ on an interval $\[ theta_(-) \, theta_(+) \] subset \( - pi \, pi \)$. After the avoided path hub is removed, every attachment from outside $Omega$ enters it through $J$. The outer radius was chosen smaller than the distance from $z$ to $partial L$, so these attachments belong to the far-side graph. To preserve their planarity in the lift, use the closed disk complementary to $Omega$ on the sphere. After removing its $P$ arc, its retained graph attaches only along $J$. Redraw this disk beyond the radial graph of $J$, in the region $theta_(-) lt.eq theta lt.eq theta_(+)$, $f \( theta \) lt.eq 𝜚 lt.eq R_(*)$ for a sufficiently large $R_(*)$, fixing $J$ and sending the removed $P$ arc to the remaining boundary. This drawing is disjoint from the lifted $Omega$, which lies below $f \( theta \)$ at those angles. Together with the part of $Omega$ beyond the outer cut, it induces a noncrossing partition on that cut, whether or not this part of $Omega$ is connected. The left part of $L$ therefore belongs to the far-side graph even where it is physically close to $z$: all its remaining contacts are on $J$, and its old Euclidean radius does not make it an inner attachment. Inner attachments stay wholly on the lifted right side.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((1.4, 0), (1.2, 0.6), (2.2, 1.3), (2.7, 1.8), (2.3, 2.2), (2.6, 2.8), (1.7, 3.3), (1.8, 4), (5, 4), (5, 0), close: true, fill: rgb("#f5f5f5"), stroke: none)
  line((2.7, 1.8), (4.8, 0.3), (4.8, 3.3), close: true, fill: rgb("#e1e1e1"), stroke: none)
  rect((0, 0), (5, 4), stroke: (thickness: 0.4pt))
  rect((0.5, 0), (3.8, 4), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((1.4, 0), (1.2, 0.6), (2.2, 1.3), (2.7, 1.8), (2.3, 2.2), (2.6, 2.8), (1.7, 3.3), (1.8, 4), stroke: (thickness: 1.3pt))
  line((0.05, 0.7), (1.05, 0.7), stroke: (paint: rgb("#808080"), thickness: 0.4pt), mark: (end: ">"))
  line((0.05, 1.7), (1.65, 1.7), stroke: (paint: rgb("#808080"), thickness: 0.4pt), mark: (end: ">"))
  line((0.05, 2.9), (1.8, 2.9), stroke: (paint: rgb("#808080"), thickness: 0.4pt), mark: (end: ">"))
  line((2.7, 1.8), (5, 1.8), stroke: (thickness: 0.4pt), mark: (end: ">"))
  rect((2.2, 1.3), (3.2, 2.3), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((2.55, 1.65), (2.85, 1.95), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((2.7, 1.8), radius: 0.05, fill: black, stroke: none)
  line((2.85, 2.35), (2.7, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((2.85, 2.35), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$z$]]])], anchor: "south")
  content((0.78, 3.55), [#text(size: 9pt)[$P$]])
  content((4.25, 3.65), [#text(size: 9pt)[$Omega$]])
  content((0.7, 0), [#text(size: 9pt)[$B$]], anchor: "north")
  content((4.7, 0), [#text(size: 9pt)[$L$]], anchor: "north")
  content((5, 3.25), [#text(size: 9pt)[$J$]], anchor: "west")
  content((4.08, 0.75), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[untouched#linebreak()cone]]])])
  content((2.5, 4.55), [#text(size: 9pt)[Measured blocker; search from the left]])
  line((5.45, 2), (6.35, 2), stroke: (thickness: 0.4pt), mark: (end: ">"))
  rect((6.95, 0.8), (11.85, 3.25), fill: rgb("#f2f2f2"), stroke: none)
  line((7.9, 0.8), (7.9, 1.5), (8.35, 1.5), (8.35, 2.2), (7.95, 2.2), (7.95, 3.25), (10.6, 3.25), (10.6, 2.7), (10.95, 2.7), (10.95, 1.7), (10.55, 1.7), (10.55, 0.8), close: true, fill: rgb("#dbdbdb"), stroke: none)
  rect((6.95, 0.8), (11.85, 3.25), stroke: (thickness: 0.4pt))
  line((7.77, 0.8), (7.77, 3.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((11.03, 0.8), (11.03, 3.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((6.95, 0.8), [#text(size: 9pt)[$-3 pi$]], anchor: "north")
  content((9.4, 0.8), [#text(size: 9pt)[$0$]], anchor: "north")
  content((11.85, 0.8), [#text(size: 9pt)[$3 pi$]], anchor: "north")
  content((7.77, 3.25), [#text(size: 9pt)[$-2 pi$]], anchor: "south")
  content((11.03, 3.25), [#text(size: 9pt)[$2 pi$]], anchor: "south")
  content((9.35, 2.05), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[lifted right region#linebreak()\(schematic\)]]])])
  content((9.4, 4.15), [#text(size: 9pt)[A filled angular cover]], anchor: "south")
  content((9.4, -0.1), [#text(size: 9pt)[inner cut below; outer cut above]])
})],
    caption: [Figure 5: The path-defect geometry. The complete complementary-face search leaves the strict right side $Omega$ of the measured path $P$ uninspected. An exposed vertex $z$ supplies the entire horizontal ray segment from $z$ to the right edge of $L$, with a cone portion contained in that side. After discarding supports hitting the $P$ hub, the annular part lifts to bounded angular coordinates. The pale rectangle on the right represents the larger regular sector used for coefficient transplantation, not an assertion that all of that sector was originally uninspected. External attachments leave through the outlet arc $J$. ],
  ) <fig:path-defect>
  ===== 5.8.3 Completing the collar and comparing coefficients. <completing-the-collar-and-comparing-coefficients.>
  The ordered outlet $J$ permits a regular sector collar with separate inner and outer attached graphs. We now specify the source and target of the coefficient comparison. The source is $G_omega$, including all its original odds incident to $p_omega$. Its allowed vertex set is
  $ V_(*) = V \( G_omega \) \\ { p_omega } . $
  Construct a target graph $tilde(G)_omega$ as follows. Fill the regular collar with angular range $\[ - 3 pi \, 3 pi \]$. Each allowed source vertex in the closed annular part of $Omega$ is placed at its unique lift. The allowed vertices of $Omega$ strictly inside the inner cut form the inner attached graph. All other allowed vertices form the outer attached graph; this includes the left part of $L$, redrawn through its outlets on $J$ as just described. Cut vertices are the already placed collar vertices, not new copies. Each allowed source vertex is used once. Identify $V_(*)$ with this set of target vertices and retain every source edge between them, with its original odds. All remaining collar vertices are new filler sites. The preceding outlet-order argument shows that the two attached graphs induce permitted separate caps and have no bypass around the collar.
  It remains to check the incidence factors at the common allowed sites. At an allowed vertex strictly in $Omega$, a required ordinary neighbor missing from its lift can only be a vertex of $P$. The source edge to that vertex was uninspected with odds $v$, because its interior lies strictly to the right of the blocker. A new edge to filler is charged to that old incidence. There is at most one charge in each original grid direction; if several source incidences became parallel at $p_omega$, their product still contains each factor. Thus the incident external product does not increase.
  No new edge is added between two allowed vertices. A required grid edge between neighboring allowed vertices in consistent lifts was already present in the untested source grid: a grid edge cannot cross $P$ in its interior. At either radial cut retain the old edges to the corresponding attached graph and omit unneeded external edges. The closed cut needs no filler continuation beyond it, so no side-graph incidence is duplicated. At allowed sites outside the collar no new incidence is needed. Remaining source edges to $p_omega$ may be discarded in the target. Consequently the induced graphs on $V_(*)$ agree and every target external product is at most its source value. Lemma 42 applies with $G_1 = G_omega$ and $G_2 = tilde(G)_omega$.
  A connected support avoiding the hub, meeting the right inner ball, and reaching a remote mark must cross both lifted cuts; it can exit the right disk only through the far outlet $J$. Its coefficient mass in $G_omega$ is dominated by the corresponding cut mass in $tilde(G)_omega$, since each of its allowed-site coefficients can only increase. Lemmas 40 and 43 bound that mass. This contradicts density near $z$ after normalization by the diverging mass. For meshes bounded below, every counted support hits one of the bounded number of vertices in the prescribed compact hit set. Equation (5.30) gives the uniform bound, exactly as in Lemma 45. The proof is unchanged under a grid rotation or primal-dual interchange. ◻
]

=== 5.9 Annealing inside an annulus <sector:annular-annealing>

#thm([Proposition 5.19.])[
  (Bounded annular cap densities).  #emph[Fix an ordinary square annulus of nonzero macroscopic width, with inner and outer rim sets $A \, E$. There are $C < oo$ and a mesh threshold depending only on $q$ and this fixed geometry such that, below that threshold, every pair of separate noncrossing cap partitions $X \, Y$ on the two rims satisfies 
#[#set math.equation(numbering: n => "(5.42)")
 $ \| I_H \( X \, Y \) \| lt.eq C . $ <sector:annular-I>]

 The four pressures in $H \, H \/ X \, H \/ Y \, H \/ \( X \, Y \)$ between the rim images are uniformly bounded as well.]
  #emph[The same conclusions hold for a fixed ordinary rectilinear polygonal annulus between two disjoint simple boundary cuts with positive separation. Constants may depend on this geometry; each rim must have a positive-length flat patch, and the ordinary bulk between the cuts must be connected. In particular a fixed thin ordinary polygonal collar with these properties is allowed.]
  #emph[After attaching arbitrary planar graphs separately beyond the two cuts, changing an allowed cap on one side changes the opposite-side edge marginal by a uniformly bounded density and reciprocal density. This is a bounded comparison, not a density tending to one.]
] <prop:annular-density>

#proof[
  Put $X_0 = Y_0 = diameter$, $X_1 = X$, $Y_1 = Y$, and use the notation $Z_(i j)$ from Lemma 39. We must bound above and below the ratio
  $ T = frac(Z_11 Z_00, Z_10 Z_01) = exp \( - I_H \( X \, Y \) \) . $
  A free rim will bound the three pressures with at least one blank cap, and hence bound $T$ above. For the lower bound we expose a local primal or dual path, use its conditional pressure bound, and sum over the successful search leaves.
  ===== 5.9.1 One blank rim and patch marginals. <one-blank-rim-and-patch-marginals.>
  The pressures $Delta_00 \, Delta_10 \, Delta_01$ are bounded. For example, in $H \/ X$ the opposite rim $E$ is a pristine free wall. Take $V$ to be the open annular bulk and choose a compact strip separating its two rims. Every connected support meeting both rim sets meets that strip. On a flat patch of $E$, choose the fixed half-box $W$ and smaller $W_0$ of Lemma 45; they fit inside the annulus away from its corners, with no attachment across $E$. The other rim $A$ stays a fixed positive distance from $overline(W_0)$. The lemma therefore applies with the same data for every $X$. The cases $01$ and $00$ follow with the roles interchanged.
  Choose a small rectangle $B$ strictly inside the annulus and its horizontal enlargement $L$, also strictly inside, so that the remaining bulk around $B$ is connected. Enlarge the initial patch slightly if necessary to contain all edges of the primal and dual searches used below. Its edge marginal under either $10$ or $01$ is uniformly comparable, in both directions, with that under $00$. To prove this assertion, first remove the inside edge set and fix one of its states. Its components induce a noncrossing cap $U$ on the new hole rim. On the remaining graph consider the interaction of $X$ with $U$, keeping $E$ blank. Each of the four terms in (5.31) now tests $A$ against the hole rim. Choose a fixed compact strip separating $A$ from that hole in the connected bulk outside it. The same flat free-wall half-box at $E$ remains available and both tested sets stay away from its smaller half-box. Thus all four terms are bounded by Lemma 45; consequently $\| I \( X \, U \) \|$ is uniformly bounded over the inside states. The same argument compares $Y$ and $U$ with $A$ blank. Inside edge weights and component factors not touching the hole are independent of the remote cap. Component counting and normalization therefore give constants $c_1 \, C_1 > 0$ such that for every patch event $F$,
  #[#set math.equation(numbering: n => "(5.43)")
   $ c_1 bb(P)_00 \( F \) lt.eq bb(P)_10 \( F \) \, bb(P)_01 \( F \) lt.eq C_1 bb(P)_00 \( F \) . $ <sector:patch-marginals>]
  Edges on the patch boundary can be assigned to its inside set; this only changes the hole cut by bounded mesh steps.
  ===== 5.9.2 A successful primal or dual leaf. <a-successful-primal-or-dual-leaf.>
  In the blank law $00$, either a primal vertical crossing of a smaller fixed rectangle has probability at least $1 \/ 2$, or its complementary dual horizontal traversal does. This is the finite disk path/cut alternative, independent of the exterior edge states. In the dual case trim the first and last portions to obtain a crossing between the first and last columns of an ordinary rectangle of dual cell centers. Its probability retains the same lower bound, and its macroscopic dimensions stay nondegenerate. Select the color and orientation by this deterministic comparison of probabilities. Perform the extremal complementary-face search from a perpendicular side in that color. Its success probability under $00$ is bounded below by a fixed positive number. Let $omega$ denote a measured leaf of the search, and let $Z_(i j) \[ omega \]$ be the partition sum restricted to its prescribed measured states.
  For every successful leaf,
  #[#set math.equation(numbering: n => "(5.44)")
   $ lr(|log frac(Z_10 \[ omega \] Z_01 \[ omega \], Z_00 \[ omega \] Z_11 \[ omega \])|) lt.eq C_2 . $ <sector:successful-leaf-ratio>]
  For a primal success, delete the measured-closed edges and contract the measured-open edges. The fixed edge-odds factors cancel from the ratio. The resulting untested graphs have the same clear bulk outside the search rectangle and the same measured blocker. To check the fixed data in Lemma 46, take $V_(upright("bulk"))$ to be the open annular bulk and $V_0$ to be its connected complement of $B$. The middle of the enlarged right edge has a fixed open neighborhood in $V_0$. Choose $C_(*)$ to be a compact strip near the inner rim, separating the two rims and disjoint from $B$. In each of the four cap quotients, a support joining the rims meets $C_(*)$: the caps act separately on the rims and give no bypass across this ordinary strip. These choices are independent of the leaf and caps. Lemma 46 bounds all four conditional pressures. Equation (5.31) gives (5.44).
  For a dual success, apply plane random-cluster duality before conditioning. Draw each primal cap as a noncrossing forest inside its own complementary rim face and contract it. The dual can be represented on one common graph of cell centers and boundary slots: each exposed rim edge carries its ordinary dual spoke to a slot, and the slots are identified according to the complementary face pieces left by that cap forest. The two rim choices act separately. These are noncrossing slot partitions, though their bases need not be empty.
  For completeness, the scalar factors in this duality do not affect the mixed ratio. The physical primal graph is connected, and contracting the cap forests lowers its vertex number by the sum of their two contraction ranks. Euler’s duality formula on the same physical edge set, retaining loops, therefore has a fixed factor times one factor for the inner cap and one for the outer cap. All three factors cancel from the four-term mixed ratio. The same is true after restricting to complementary measured states. The dual bulk grid has odds $q \/ v = v$. Its successful path gives the same conditional defect: after a fixed small shrinkage of the bulk buffers, the preceding $V_(upright("bulk")) \, V_0 \, N_(+) \, C_(*)$ choices also work for the shifted dual grid and its rim slots. Arbitrary base slot caps are allowed in (5.31). This proves (5.44) for a dual success as well.
  ===== 5.9.3 Summing the leaves. <summing-the-leaves.>
  Write
  $ T_omega = frac(Z_11 \[ omega \] Z_00 \[ omega \], Z_10 \[ omega \] Z_01 \[ omega \]) \, #h(2em) p_(i j) \( omega \) = frac(Z_(i j) \[ omega \], Z_(i j)) . $
  All prescribed finite edge states have positive weight. Direct multiplication gives
  $ T_omega frac(p_10 \( omega \) p_01 \( omega \), p_00 \( omega \)) = frac(Z_11 \[ omega \] Z_00, Z_10 Z_01) . $
  Summing this identity over all leaves equals $T$. Restricting the sum to successful leaves, using (5.44) and (5.43), yields
  #[#set math.equation(numbering: n => "(5.45)")
   $ T & gt.eq sum_(omega upright(" successful")) T_omega frac(p_10 \( omega \) p_01 \( omega \), p_00 \( omega \))\
 & gt.eq e^(- C_2) c_1^2 sum_(omega upright(" successful")) p_00 \( omega \) gt.eq c_2 > 0 . $ <sector:annealed-lower-bound>]
  No comparison with the $11$ marginal has been used. Conversely (5.31) gives
  $ log T = - Delta_00 + Delta_10 + Delta_01 - Delta_11 lt.eq Delta_10 + Delta_01 lt.eq C_3 \, $
  because all pressures are nonnegative. The two bounds on $T$ prove (5.42). Solving the same identity for $Delta_11$, and using the already bounded three other terms, bounds the double-cap pressure.
  ===== 5.9.4 Geometry and attached marginals. <geometry-and-attached-marginals.>
  The proof used only connected clear bulk between separated cuts, a flat free-wall patch at either blank rim, and a small interior search rectangle whose complement is connected. Every fixed rectilinear polygonal annulus in the statement has these properties. Choose all patches and buffers at fixed positive distance from its finitely many corners; bounded mesh roundings preserve the choices. The preceding proof therefore applies with constants depending on that geometry. For a fixed thin collar the constants may be large, but remain finite and mesh-independent. Finally apply Lemma 43, or condition on separate side states and normalize their uniformly bounded partition-gain ratios, to obtain the asserted marginal density comparison. ◻
]

== 6 Irregular disks and physical connections <sec:disks>

This section obtains uniform bounds for actual paths in irregular tiled disks. Its first input is the pressure contact construction: two walls approached through clear ordinary bulk have a positive network connection probability. We prove the geometric localization needed to apply this input in disks with slits, pinches, and separate boundary incidences. Pure network decay follows by duality and the paired-list argument. A second geometric construction then lets us extend actual central crossings to two end wires, yielding actual hard-passage decay with arbitrary planar joint end caps.

Actual decay leads to confined physical joins through a branching estimate and a comparison of central marginals. These joins build routing and screens, which in turn give relative collar comparison and splices that preserve an existing rare arm while blocking an opposite-color arm. All laws in this section are finite positive FK laws at the fixed parameter $0 < q < 1$. Ordinary tile and collar bonds have odds $v = sqrt(q)$; attached-graph edges may have any positive odds. Conditioning on a measured leaf has the meaning of Lemma 3.

=== 6.1 Disk conventions and the two pure tests <disk-conventions-and-the-two-pure-tests>

#prodef([Convention 6.1.])[
  (Tiled disks and cut cells).  The mesh is one until a rescaling is explicitly made. Square checkerboard tiles have alternating primal and dual corners; their monochrome diagonals are complementary bonds, with ordinary odds $v = sqrt(q)$. A tiled disk has an interior embedded injectively in the plane, disjoint tile interiors, and no boundary image in its interior. Distinct boundary incidences may have the same physical position. All slots, paths, and cyclic orders at a cut or slit refer to the disk, not to the quotient obtained by identifying such positions.
  A boundary may cut a tile along a diagonal. In the retained half-tile put a virtual slot of the other color at the midpoint of that diagonal. The half-tile is a four-slot cell with the two usual complementary bond choices, one being a spoke to the virtual slot. Its single random bond has the ordinary odds. The diagonal side can be bent infinitesimally into the disk when defining topology. A free untested virtual slot contributes only a dangling edge. Every interior tile is complete, slot fans are internal to the disk, and successive boundary slots alternate in color.
  An #emph[actual] path uses physical open bonds and does not hop along boundary identifications. A #emph[network] test uses the specified identifications in its component count and tests connection of its terminals. In particular, with just two separately wired end intervals, network connection is equivalent to an actual path between some of their slots, although its law is not the blank law.
] <disk:conventions>

Let $Q$ be such a quadrilateral disk, with disjoint end intervals $I \, J$, each containing a slot of the tested color, and longitudinal flanks $S \, T$. Suppose that $I$ lies in $B \( z \, r \)$ and $J$ lies outside $B \( z \, R \)$. Either Euclidean or tile-coordinate sup-norm balls may be used, changing only fixed constants. Let $p \( Q \)$ be its tested-color connection probability with $I \, J$ separately fully wired and with no other ties. Write

$ u = 1 - q \, #h(2em) t = q^(- 1) \, #h(2em) H \( a \) = frac(1 - a, 1 - u a) \, #h(2em) j \( a \) = - log \( 1 - u a \) . $

Here $H$ is the same duality involution denoted by $cal(H)$ in Section 5.

#thm([Lemma 6.2.])[
  (The companion pure test).  #emph[The separate-full-flank network probability in the opposite color is $H \( p \( Q \) \)$.]
] <disk:dual-test>

#proof[
  Realize each end wire by a narrow chain along its boundary interval, between successive tested slots. The dual slots strictly inside these chains have their own faces. All remaining exterior dual slots belong to one face: they are exactly the two longitudinal flank intervals, joined for weighting. Interior bonds are in diagonal or spoke duality cell by cell. The disk path/cut alternative identifies absence of the tested end connection with an actual opposite-color connection between the flanks, ignoring their common identification.
  Let $a$ be the connection probability when these two flank wires are separate. Joining them multiplies weights by $t$ on separation and by one on connection, so the actual connection probability becomes $a \/ \( a + t \( 1 - a \) \)$. Equating this with $1 - p \( Q \)$ gives $a = H \( p \( Q \) \)$. Specifying the first and last eligible slots moves the four corner positions by only bounded mesh distance. ◻
]

=== 6.2 A network connection through an untouched channel <a-network-connection-through-an-untouched-channel>

We first isolate a pressure comparison at a small gap. A #emph[hub] means an existing terminal or a set of vertices already identified there. In particular, all vertices of a measured simple open path belong to its hub.

For two vertices $x \, y$ of a finite FK graph, the full-wire gain identity gives

$ Delta_G \( { x } \, { y } \) = j #scale(x: 120%, y: 120%)[\(] bb(P)_G \( x arrow.l.r y \) #scale(x: 120%, y: 120%)[\)] . $

This includes hub vertices. Thus a lower bound on the positive pressure mass hitting both hubs is exactly a lower bound on their network connection probability.

#thm([Lemma 6.3.])[
  (Two-barrier pressure contact).  #emph[Consider an annulus with a distinguished diameter and a focal half-ray of that diameter. Two barriers assigned to hubs $x \, y$ span the annulus in opposite open half-planes, with many mesh steps of margin from both diameter rays. On the focal side, the component accessible from the ray before meeting either barrier is ordinary uninspected grid, with ordinary incidence up to its contacts. All accessible contacts in either angular direction have that direction’s single hub label. These conditions hold on a slightly radially enlarged annulus; barriers may fold or have several branches.]
  #emph[For a sufficiently large fixed ratio of outer to inner radius, the network probability $x arrow.l.r y$ is bounded below by a positive constant. The bound is uniform in the exterior graph and in its measured states and ties. The conclusion does not require the connecting network path to remain inside the channel.]
] <disk:pressure-contact>

#proof[
  Work first in the complete tested monochrome grid on an angular lift. Choose a regular sector $D$ whose angular walls lie at least $2 pi$ in either direction from the focal ray. Its radial band is deep: two comparable-radius patches, one on each angular wall, are separated from either radial end by a large multiplicative factor. Wire the patches separately and call the resulting terminals $x' \, y'$. The fixed sector flank-chord construction, extended cofacially from a fixed-ratio subband, gives $bb(P)_D \( x' arrow.l.r y' \) gt.eq c_0 > 0$. Consequently the pressure mass hitting both terminals equals $j \( bb(P)_D \( x' arrow.l.r y' \) \) gt.eq j \( c_0 \)$.
  This paired mass can be kept away from both radial end rows $E$. By the rooted hitting identity, the mass hitting $x'$ and $E$ is at most
  $ u / q thin bb(P)_D \( x' arrow.l.r E upright(" fully wired") \) . $
  Enlarge $x'$ by all vertices in a central subband containing $y'$. By adjacent-terminal comparison, this enlargement does not decrease the last probability. An outward connection must now cross one of two ordinary regular sector collars. They are networks in parallel. Conditional ties from the other piece either keep their two terminals separate or join them; joining upweights absence of an actual connection. Their pure radial probabilities therefore give a union upper bound. Proposition 29 makes this bound arbitrarily small by choosing the radial depths large. Fix the depths so that at least $j \( c_0 \) \/ 2$ of the paired pressure mass avoids $E$.
  We next place a copy of this sector chart across the actual channel. Take as active its ordinary strict sites accessible from the focal ray, before a barrier is met, in a slightly larger radial band. Use radius-spanning barrier subarcs, trimmed from a last exit to a first reach. Between their angular lifts, each physical strict site occurs once. The active component does not reach the artificial angular walls. Every nearest-neighbor chart step from an internal active site either remains active or has an ordinary contact edge to its indicated hub, possibly a half-tile spoke. There is no missing incidence across the focal ray. Extra folds simply remove parts inaccessible from that ray.
  Prewire into its indicated hub the active endpoint of every contact incidence at an obstructed chart step, including immediate ordinary contact incidences. Read these incidences from a band slightly larger than the template, so that the same prescription applies at its radial ends. The two absorbed sets stay apart because the focal strip has many-step width.
  This enlargement has a bounded reversible cost. Hold one hub as the rooted vertex and remove the incident edges of the other hub to form the base graph in Lemma 11. For each remaining site $i$, put $s_i = product_(h in.rev i \, thin h in.rev o) \( 1 + v_h \)$, the product over all links from $i$ to the removed hub $o$; parallel links are included separately. Its connection probability is
  $ bb(E)_mu [1 - product_i s_i^(- m_i)] . $
  Whenever a multiset meets the set being prewired, at least one affected link has odds at least $v$, and the displayed integrand is at least $v \/ \( 1 + v \)$ times its full-wire limit. Off that set the integrands agree. Thus an entire hub enlargement costs at most $\( 1 + v \) \/ v$, independently of the number of absorbed sites. Apply this once for each hub.
  Fill the nonactive chart sites and identify each filler site with the hub on its angular side of the focal strip. Sites on further sheets beyond the corresponding barrier have the same label. No required chart edge connects two different such labels: the untouched strip separates them throughout the enlarged radial band. Edges between retained strict sites, and edges from them to a prewired neighbor, are present at their ordinary odds. Every remaining required edge is a hub loop or an available contact incidence. In particular, if both sides of a missing chart step are retained across two cut half-tiles, precollaring has put both endpoints in the same hub. The missing edge is then a loop. Add or allocate loop copies as necessary; this does not change the enlarged network test.
  Now split each hub into the distinct chart copies assigned to it, the appropriate wired artificial patch $x'$ or $y'$, and residual vertices carrying all other original edges. The complete chart $D$ is present after splitting. Merging the pieces back does not decrease the terminal connection probability. At all internal chart sites the induced graph agrees with the benchmark, and the incident products are no larger; extra original hub edges have been assigned to residual pieces. Only radial end rows can retain unallocated outside incidences. By Lemma 42, coefficients supported on chart multisets avoiding those rows are at least the benchmark coefficients. Positive coverage therefore gives paired pressure mass at least $j \( c_0 \) \/ 2$, hence a positive network connection probability. Reversing the two precollaring enlargements proves the assertion in the original graph. ◻
]

#thm([Lemma 6.4.])[
  (Auxiliary cleared-route construction).  #emph[In a bounded rescaled region, let two hub walls admit interior tangent disks of radii bounded below, touching at $z_1 \, z_2$. Suppose their centers can be joined through ordinary uninspected bulk by a path of bounded extent with fixed positive clearance from all boundaries and nonordinary sites. Near either contact, all wall portions accessible from its tangent approach have the same corresponding hub label, have ordinary incident edges up to their slots, and extend out of a fixed small neighborhood. Assume planar induced caps in buffered bulk boxes along the route. Then, as the mesh tends to zero, the two-hub network probability has a uniform positive lower bound.]
  #emph[The two local approaches may meet the same physical boundary position, provided they are distinct accesses in disk topology. The resulting connection is not asserted to remain in the route.]
] <disk:auxiliary-contact>

#proof[
  #emph[Buffered square events.] In an ordinary clear box, horizontal actual crossings of a square, or a rectangle whose transverse dimension differs by a bounded number of steps, have probability bounded below uniformly in planar exterior data. Indeed a square crossing or its opposite cell crossing has probability at least $1 \/ 2$. In the latter case duality, a rigid grid symmetry, and bulk annular density transfer that event to the desired color and direction in a larger clear buffer. The complementary cell crossing has exterior adjacent rows; trimming changes dimensions only by bounded steps. One may instead start with a self-dual box one step wider than its transverse height.
  The same bounded-density transfer applies to a crossing with endpoint constraints on any fixed convex clipped-square support. Surround the whole support, within its positive clearance, by two simple ordinary rectilinear polygonal cuts. Their geometry is fixed and nondegenerate, although the relative collar width may be small. The proof of Proposition 47 uses connected clear regions, straight-wall pieces with blank ends, and bounded local path defects. Each of these constructions fits along these finitely many offset straight pieces, with constants depending on their widths and angles. Its pressure bounds therefore give the same reciprocal density comparison here. Rigidly moved copies may be compared through overlapping larger neighborhoods. Conditioning outside their buffers only changes the allowed planar caps. No physical hard crossing or sector screen is used for this transfer.
  #emph[A route and its templates.] Choose a simple polygonal path with axis-parallel segments in the tested monochrome grid directions, entering the tangent disks along axis rays making angle at most $pi \/ 4$ with their inward normals. It can be chosen with a bounded number of segments, positive lower bounds on their lengths, and positive clearance off its endpoint approaches. To see uniformity, join the two disk centers within their cleared corridor, approximate by a sufficiently fine fixed pixel path, erase loops, and perturb its axis segments inside the clearance. Insert a small interior detour if necessary so both axial directions occur. A subsequential limit of cleared corridors and contact normals gives the same conclusion with strict sub-clearances. If the physical endpoints coincide, fix short rays in their separate accessible regions first, and join their interior endpoints; simplicity is in the disk topology.
  Along this path place crossing templates, separated by small positive gaps between their support envelopes. Crop each crossing between two straight transverse caps. A finite cover of each cap and pigeonhole selection give tiny endpoint patches supporting a positive-probability crossing event. Their widths can be made arbitrarily small relative to the gap; their center displacements are then recorded. Slight cap shifts avoid vertices. If a cap crosses a bond, use the corresponding half-edge with its actual bond state and orient the witness toward the far cap, retaining its portion after its last near-cap hit and before its first subsequent far-cap hit. Bounded mesh rounding affects only these endpoint neighborhoods.
  Here are explicit templates sufficient for the construction.
  + A straight $+ x$ advance of any prescribed fixed length is made from two identical small horizontal-square crossing templates, with one reflected to reverse its $y$-displacement. The transverse displacements of their patch centers cancel. Choose their widths just below half the desired advance and allocate equal small gaps at the ends. Longer advances are subdivided to remain inside the chosen clearance.
  + For a $+ x$-to-$+ y$ turn, use the support
    $ \[ 0 \, s \]^2 ∩ { x + y lt.eq 1.35 s } $
    from its left edge to the oblique cap. Crop a horizontal crossing ending in the upper half, selected using reflection and transfer. Its endpoint has $x + y gt.eq 1.5 s$, whereas its starting point has $x + y lt.eq s$, so it crosses the cap. Reflect and reverse traversal across that cap for the turn’s second half, with a small normal spacing. The second support is ahead of the vertical entry and the first is below the horizontal exit by a fixed fraction of $s$. Much thinner incoming and outgoing straight templates consequently miss the nonadjacent half. Grid symmetries give the other turns.
  + For a contact with inward normal proportional to $\( 1 \, tau \)$, $0 lt.eq tau lt.eq 1$, use
    $ \[ 0 \, s \]^2 ∩ { x + tau y gt.eq 0.65 s } $
    from the oblique cap to its right edge. It is obtained by cropping a horizontal crossing starting in the lower half. Place the starting patch center a distance $epsilon.alt$ inside the contact along the normal, with
    $ s^2 \/ c' lt.double epsilon.alt lt.double s \, $
    where $c'$ is the tangent radius. Tangent-disk exclusion then puts the whole template inside the clear approach and the wall in the opposite half-plane in a smaller contact annulus. Every exit advances a fixed fraction of $s$ both axially and into the tangent half-plane. Much thinner subsequent straight templates are therefore safe. Reverse the construction at the other endpoint.
  Choose bend and endpoint sizes first, sufficiently small relative to all route clearances and segment lengths. Their selected patch offsets and gap displacements are then fixed. Adjust total advances on two independent axis segments by the resulting small amounts, and realize the intervening lengths by the straight cancellation construction. Its widths are much smaller than adjacent bend or endpoint sizes. The final gaps are smaller still, and patch tolerances smaller than the gaps. Bounds on all segment lengths and widths give a finite bound on the number of pieces before these last choices. Thus the remaining advances can be fitted exactly, up to bounded mesh errors, without moving nonadjacent envelopes into one another. Near coincident endpoint closures the envelopes stay in the separate tangent approaches.
  #emph[Conditioning and network concatenation.] The disjoint clear buffers give a positive joint probability of all template crossings by successive conditioning. On their success, perform the complementary-face searches of Lemma 35 in the separate clipped envelopes, always from the same longitudinal side of the oriented route. Seed only the exterior flank face: an adjacent interior face is reached only after its intervening physical bond has been queried closed. Fictitious outward spokes confined to the endpoint patches specify search topology only; they add neither FK ties nor physical path edges. The complementary face search exhausts on success. Setting every unqueried edge closed still leaves a crossing, so a simple actual open blocker is supported on measured edges. No reached complementary face lies beyond it, and ordinary incidences into its unsearched side remain untouched.
  At a gap, prolong the two blocker endpoints along their short terminal spokes and connect them inside the innermost gap neighborhood, solely for separation topology. Between a few gap widths and a small fixed fraction of the template length the blockers span the annulus in opposite half-planes. The focal ray on the unsearched side is in the untouched gap. An accessible fold terminates on the same blocker hub; it introduces no foreign boundary condition. Other terminal caps are outside the enlarged join annulus. At an endpoint the continuous wall and its short tangent access replace one of the blockers. Only its single wall label is locally accessible, and tangent-disk exclusion gives the same half-plane separation.
  Lemma 50 therefore bounds every successive two-hub connection below in the #emph[same] conditional FK graph. Hubs already connected cause no difficulty. Shared-root positive correlation gives
  $ bb(P) \( i arrow.l.r k \) gt.eq bb(P) \( i arrow.l.r j \) bb(P) \( j arrow.l.r k \) . $
  Iterating along the finite chain gives a positive conditional probability of connection of the original hubs. Averaging over successful leaves proves the lemma. This argument does not claim simultaneous physical bridges confined to the individual gaps. ◻
]

=== 6.3 Localization between irregular walls <localization-between-irregular-walls>

The contact lemma needs a clear route with controlled access to its walls. We now obtain such a route from an arbitrary long quadrilateral disk. The argument uses the topology of the split disk throughout; closeness of two boundary images does not identify their incidences. A related use of a minimal annulus to separate opposite boundary arcs in the in-domain graph distance appears in #cite(label("DuminilCopinManolescuTassion2021"), form: "prose") Section 4, following Fact 4.1. The diameter argument below also supplies the accessible-wall and terminal-clearance properties needed in the present split-disk setting.

===== 6.3.1 Integer level cuts. <integer-level-cuts.>

An integer tile-coordinate level separating the two end intervals contains a proper tile-edge crosscut between the longitudinal flanks. Indeed its preimage in the disk consists of finitely many interior intervals with disjoint interiors, together with possible full level circles. A full circle cannot separate the end arcs in the embedded disk. Splitting along the proper intervals gives a tree of regions; the tree path between the regions incident to the two ends contains a cut separating them. Its endpoints are on different flanks because the level misses both ends. Coincident boundary endpoints are resolved in their separate fans. The cut follows tile edges, meets a diagonal boundary side only at a corner, and contains a whole edge with alternating eligible slots. The closed cut meets every end-to-end path, including a boundary path by interior approximation. Selecting cuts backwards from the last desired level orders them intrinsically; the intervening pieces are disks of Convention 48.

For the local argument regard a tiled disk as an abstract compact disk $X$ mapped continuously into the plane. Its interior maps injectively onto an open set $D$, and no boundary image lies in $D$. Write its four arcs as $I \, S \, J \, T$ in cyclic order. An #emph[access] to a boundary incidence is an interior arc ending there. A #emph[proper] $S$–$T$ crosscut is a simple arc in $X$ with interior in $X^compose$ and its endpoints in the specified flank incidences. Its diameter and every distance below refer to physical images. Write $N_s \( K \)$ for the open physical $s$-neighborhood of a set $K$.

#thm([Lemma 6.5.])[
  (Local labels and wall continuation).  #emph[Suppose a closed physical ball $overline(B) \( z \, s \)$ misses the end arcs $I \, J$ and contains no proper $S$–$T$ crosscut of diameter at most $2 s$. For every component $U$ of $D ∩ B \( z \, s \)$, all original-wall incidences accessible from $U$ have the same flank label. For generic $s$, each such wall occurrence has wall-only continuations in both directions on the boundary of $U$ until that boundary first meets the circle. These continuations refer to the approached side of a wall, including at slit tips and split boundary fans.]
] <disk:local-access>

#proof[
  Two accesses in a connected open component can be joined by an interior polygonal path and then simplified to a proper arc, retaining the endpoint incidences. Opposite labels in $U$ would therefore give the forbidden cut inside $overline(B) \( z \, s \)$.
  The component $U$ is simply connected. Indeed the complements of $D$ and the ball in the sphere are connected and meet; every complementary domain of their union is simply connected. For a generic radius the finite polygonal cell structure gives a finite prime-end boundary walk of $U$, consisting of original-wall and circle pieces. Slit banks and repeated physical vertices remain separate occurrences in that walk. There is an open circle piece: join an interior point of $U$ to a point of $D$ outside the ball, which exists since the end arcs lie outside. Following the boundary walk from any original-wall occurrence in either direction to its first circle occurrence gives the asserted wall-only continuation. Each intervening wall occurrence is accessible from $U$ and hence has the same label. The exceptional radii consist of the finitely many vertex and tangency values. ◻
]

#thm([Proposition 6.6.])[
  (Localization in an intermediate shell).  #emph[Let $Q_n$ be disks of Convention 48, with end arcs $I_n \, J_n$ and flanks $S_n \, T_n$. Write $𝜚_n$ for sup-norm radius about a tile-coordinate center, and suppose 
$ I_n subset { 𝜚_n lt.eq r_n } \, #h(2em) J_n subset { 𝜚_n gt.eq R_n } \, #h(2em) 1 + r_n = o \( m_n \) \, #h(2em) m_n = o \( R_n \) \, $

 where $m_n$ is an integer. Put $cal(S)_n \( m_n \) = { 3 m_n \/ 4 < 𝜚_n < 5 m_n \/ 4 }$. After passage to a subsequence one of the following alternatives holds, with constants $a > 0$ and $A < oo$ fixed on that subsequence.]
  + #emph[There is a proper $S_n$–$T_n$ tile-edge crosscut of at most $A$ edges in the safe shell $cal(S)_n \( m_n \)$. Its incident cells contain a physical bond route of either prescribed color between eligible flank slots, after moving each contact at most $A$ tile steps within its own fan. In this case put $ell_n = 1$.]
  + #emph[There are scales $ell_n arrow.r oo$, with $ell_n lt.eq A m_n$, and interior tangent disks of radii in $\[ a ell_n \, A ell_n \]$ touching the respective flanks. Their centers are joined by a simple polygonal route of length at most $A ell_n$, with an ordinary buffer of width at least $a ell_n$ away from its terminal approaches. At either contact, every wall portion accessible from the approach in a fixed contact neighborhood has that flank’s label and ordinary incident bonds up to its slots, and continues physically out of a larger contact neighborhood. The neighborhood radii and all buffer widths are fixed positive multiples of $ell_n$; all named geometry lies in $cal(S)_n \( m_n \)$.]
    #emph[More precisely, with $eta = 10^(- 3)$ there is a proper crosscut $K_n$ of diameter $ell_n$ such that no proper $S_n$–$T_n$ crosscut of diameter less than $eta ell_n$ meets $N_(eta ell_n) \( K_n \)$. The tangent disks can have radius $rho_n = eta ell_n \/ 100$, with centers on $K_n$, and their contact neighborhoods are contained in this excluded neighborhood. This geometry satisfies the hypotheses of Lemma 51 in the companion pure law, including the planar caps on clear bulk buffers.]
  #emph[Both statements hold in the split disk, also when the two accesses end at the same physical position through different incidences.]
] <hyp:disk-localization>

#proof[
  Suppress the sequence index. We first choose a scale at which a crossing between the two flanks cannot be replaced by a much smaller nearby crossing. This gives the single-label terminal neighborhoods.
  ===== 6.3.2 Diameter descent and the clear core. <diameter-descent-and-the-clear-core.>
  Choose a proper level cut $K_0$ at radius $m$, and write $L_0$ for its physical diameter. Thus $L_0 lt.eq 3 m$, after a fixed change between the Euclidean and tile-coordinate norms. Fix $eta = 10^(- 3)$. Starting from a proper crosscut $K$ of diameter $L > 1$, replace it whenever there is a proper $S$–$T$ crosscut of diameter less than $eta L$ meeting the physical $eta L$-neighborhood of $K$. The replacement lies within $2 eta L$ of $K$. The diameters decrease geometrically, so after finitely many replacements either $L lt.eq 1$ or no such replacement is possible. The total displacement from $K_0$ is at most
  $ frac(2 eta L_0, 1 - eta) < m / 100 . $
  Pass to a subsequence on which the final diameters are bounded or tend to infinity. All subsequent constructions stay within a sufficiently small fixed multiple of $L$ of $K$. They therefore lie in the safe shell and miss the end intervals. Here and in this proof constants may depend on the subsequence, but not on its index.
  Consider the divergent case, and put $ell = L$ and $rho = eta L \/ 100$. An interior point $x$ of $K$ at distance at most $rho$ from the physical boundary has a nearest boundary point. The open segment to that point lies in the disk and determines an access to a boundary incidence. That incidence has a unique flank label: two opposite-label nearest accesses would join through $x$ to give a proper crosscut of diameter at most $2 rho < eta L$. More generally, two sufficiently close parameters of $K$ in this boundary layer cannot have different labels. Their nearest-access segments and the short intervening subarc would simplify to a proper cut of diameter at most $4 rho$, again forbidden. The label sets are consequently disjoint closed subsets of the parameter interval. Near the two endpoints they have labels $S$ and $T$, respectively; the same short-access argument proves this even at repeated physical boundary positions.
  Take the first $T$-labeled parameter and the last $S$-labeled parameter preceding it. Both have boundary distance exactly $rho$, and the intervening core has boundary distance at least $rho$. Its endpoints are centers of interior tangent balls of radius $rho$ at the two flanks. Replace this core by a simple polygonal route inside its clear neighborhood. For a uniform construction, cover its diameter-$L$ bounding box by squares of side $rho \/ 100$, retain the squares meeting the core, connect through them, and erase loops. There are at most $O \( \( L \/ rho \)^2 \)$ squares. Perturbing inside the $rho \/ 2$-clear region gives a route of length $O \( L \)$ with clearance at least $rho \/ 4$. A finer fixed grid and a short interior detour give axis segments of controlled positive length, separated tubes around nonadjacent pieces, and a protected straight central segment. There are finitely many combinatorial choices at this normalized scale. A further subsequence fixes a pattern and strict sub-clearances, including the inward approach directions at the tangent balls.
  At a tangent contact $z$ choose two small ball radii in fixed separated subintervals of $\( rho \/ 20 \, rho \/ 10 \)$. For either such radius $b$,
  #[#set math.equation(numbering: n => "(6.1)")
   $ B \( z \, b \) subset N_(rho + b) \( K \) subset N_(eta L) \( K \) \, #h(2em) rho + b < 1.1 rho < eta L . $ <disk:terminal-containment>]
  Every proper opposite-flank cut contained in this ball would have diameter less than $eta L$ and meet the excluded neighborhood. Lemma 52 therefore supplies the correct single flank label and the wall continuations in the component approached from the tangent ball. Choose radii avoiding tangencies and vertices. For a sequence there are only countably many exceptional normalized radii, so the same normalized choices can be used throughout.
  These facts prove the clear-route and local-wall assertions of the divergent alternative. The full and half-cell conventions provide ordinary incidences up to the accessible wall slots. In the companion law draw the two separate flank wires as disjoint chains in narrow boundary collars of the abstract disk. Any exposure outside a clear bulk buffer then induces a noncrossing cap on it. This verifies the planar-cap hypothesis of Lemma 51 directly from the finite graph.
  ===== 6.3.3 Bounded cuts and discretization. <bounded-cuts-and-discretization.>
  If the final diameter is bounded, perturb $K$ off the vertices and follow its chain of full or half-cells through interior full tile sides. A diagonal side of a retained half-cell is an original boundary side, so no interior transition crosses it. Erase repeated cells in the adjacency chain. Only boundedly many cells occur, since their interiors are disjoint in a bounded region. Each cell offers an ordinary bond joining its two slots of either prescribed color. Successive cells share that color’s slot on their common full side in the same fan. Concatenation gives a bounded physical route between eligible flank slots, with bounded endpoint moves within their original fans.
  To obtain a proper tile-edge separator as well, replace each cell passage by at most four full sides. The full-side skeleton of a square is connected, and the two nondiagonal sides of a retained triangle connect all its three original corners. Use the same corner of each shared side for the two neighboring passages. An endpoint on a boundary diagonal moves to one of its corners in its own incidence. This constructs a bounded tile-edge walk from $S$ to $T$. All its boundary visits lie in the safe shell, hence have label $S$ or $T$. Stop at its first $T$ visit and start at its last preceding $S$ visit. There is now no boundary incidence in its interior; in particular it cannot contain an original boundary edge, whose incidences have a single label. Erase loops in the abstract graph. The resulting proper crosscut contains at least one full tile edge. Finally perturb this selected cut slightly into one side, within its incident cells and endpoint fans, and repeat the color-route construction there. Thus the bounded route lies in cells meeting the selected cut itself. This proves the bounded alternative of the proposition. ◻
]

=== 6.4 Pure tests in irregular disks <pure-tests-in-irregular-disks>

#thm([Theorem 6.7.])[
  (Pure irregular-disk decay).  #emph[Uniformly over either color and all disks in Convention 48, 
$ lim_(L arrow.r oo) sup_(I subset B \( z \, r \) \, med J ∩ B \( z \, R \) = diameter\
R \/ \( 1 + r \) gt.eq L) p \( Q \) = 0 . $

]
] <thm:pure-disk>

#proof[
  Let $M$ be the supremum limit in the assertion. If $M = 1$, choose disks $Q_n$ of diverging end-separation ratio with $p \( Q_n \) arrow.r 1$, and then choose integer intermediate radii $1 + r_n lt.double m_n lt.double R_n$. Proposition 53 gives a subsequence and constants fixed on it. In the bounded alternative its opposite-color route uses boundedly many tiles, with bounded moves to the eligible flank slots. Conditional finite energy gives a positive lower bound for the companion flank connection. In the divergent alternative, Lemma 51 gives such a bound for the two flank hubs of the companion pure law. Either conclusion contradicts Lemma 49, since $H \( p \( Q_n \) \) arrow.r 0$. Thus $M < 1$. The lower bound here may depend on the extracted subsequence; no uniform localization constants over all disks were needed.
  Suppose $M > 0$, and take $p \( Q \) arrow.r M$ at diverging end-separation ratios. Put $h = H \( M \) in \( 0 \, 1 \)$. For any fixed list length, choose pairs of integer level crosscuts
  $ C_(s_i^(-)) \, med C_(s_i^(+)) $
  with all paired ratios, intervening gaps, and end clearances diverging successively. They can be ordered intrinsically: select the last desired cut, retain its piece containing $I$, and repeat backwards. The intercut pieces are tiled disks of the same class, with full cuts as ends.
  For each isolated intercut disk, let $a_i \, b_i$ be precisely the two companion flank electrodes prescribed by Lemma 49, including its eligible corner slots. Embed these same slots in their accessible fans of the companion graph of the full $Q$, and wire each electrode separately there. The cuts alternate slots and contain a whole edge. Thus these are exactly the isolated companion tests, with no independent endpoint rounding; all electrodes lie on the original flanks away from the original end corners.
  Each matched probability has lower limit at least $h$. Indeed duality gives this for its isolated intercut disk, and cofacial extension preserves the lower bound. For this extension all unwanted graph is beyond the tile cuts and can be peeled through those end openings from the exterior faces of a terminal test edge. The wire chains hug their exposed boundary subintervals and seal no unwanted region. A corner gaining extra incidences upon extension is interpreted in its same accessible disk fan. The other disjoint interval chains can then be added by the same exterior cofacial argument.
  Conversely merge all $a_i$’s, merge all $b_i$’s, and complete both flank intervals. Adjacent-terminal comparison shows that the test does not decrease; the final test is the companion probability of $Q$, which tends to $h$. Therefore every merged cross-list subgroup test containing a matched pair tends to $h$.
  For two ordered-separated nonempty index sets $U \, V$ on the first list, enlarge their terminals to the two complete cuts of an unused intervening diverging-ratio gap. No other local interval wire bridges that gap. Each exterior now attaches only at its own terminal and factors out, leaving the pure radial test of an intercut disk of this class. In the notation $G$ of (5.6), terminal enlargement in the original finite hub graph and then this gap comparison give, for every $i in U \, j in V$,
  $ bb(P) \( a_i tilde.op a_j \) lt.eq G \( a_U \, a_V \) lt.eq M + o \( 1 \) . $
  Choose $c_(*) = \( 1 - M \) \/ 2 > 0$ before choosing the list length. For each fixed length the last upper bound is at most $1 - c_(*)$ sufficiently far along the disk sequence, simultaneously for its finitely many ordered-separated groups.
  The induced partition has the reversed boundary orders of Lemma 33; pressure coverage gives its inequalities (5.7). For each fixed list length, take a subsequential limit in its finite partition simplex. The matched and cross-list subgroup tests converge to $h$, and the same-list bounds above survive. Let the list length increase and take a projective subsequential limit, as in the proof of Proposition 29. Every fixed finite constraint holds eventually, and the merger denominators are positive. The resulting partition law satisfies all hypotheses of Lemma 33 with $c = c_(*)$, a contradiction. Hence $M = 0$. ◻
]

=== 6.5 Separated cuts and a clear terminal probe <separated-cuts-and-a-clear-terminal-probe>

Pure decay will control the cost of changing end weights. To extend the resulting central actual crossing, we also need an untouched route from an end wire to a measured crossing. The next geometric lemma provides two possible entrances and a clear probe toward either flank.

#thm([Lemma 6.8.])[
  (Two families of separated cuts).  #emph[Under the hypotheses of Proposition 53, suppose also that $m_n = o \( m'_n \)$ and $m'_n = o \( R_n \)$ for integers $m'_n$. On one subsequence choose localization data in both safe shells. At a bounded-scale shell use its bounded-length cut as $C_0$. At a divergent-scale shell, with scale $ell_n$, one can choose four proper tile-edge $S_n$–$T_n$ cuts $C_0 \, C_1 \, C_2 \, C_3$ such that each has length at most $A ell_n$ and 
$ "dist" \( C_i \, C_j \) gt.eq a ell_n #h(2em) \( i eq.not j \) . $

 Constants may differ between the shells, but are fixed on the subsequence. The regions between consecutive cuts are admitted disks with those cuts as ends and no additional longitudinal boundary. The following geometry lies in the same safe shell.]
  + #emph[In a common ordinary interior rectangle, separated from the original boundary by at least $a ell_n$, the cuts are straight parallel segments. Two separated transverse strips, each of width at least $a ell_n$, run from flat $C_0$ patches through openings in $C_2$ to $C_3$. The openings are separated from each other and from the segment ends by at least $a ell_n$. Fixed physical neighborhoods of these openings miss every nonlocal portion of $C_2$.]
  + #emph[From either strip, the portion of $C_3$ toward either flank has an ordinary clear corridor of width at least $a ell_n$ until entering its terminal neighborhood. It stays at distance at least $a ell_n$ from $C_2$, the other shell’s cuts, and unrelated original walls. At each end the terminal neighborhood and its enlargement are the accessible parts of physical balls centered at the actual cut endpoint, of radii $b ell_n \, b^(+) ell_n$, with $a lt.eq b$, $b + a lt.eq b^(+) lt.eq A$. Their normalized radii are fixed on the subsequence. In the larger neighborhood only the indicated flank is accessible from the corridor, and every accessible wall occurrence continues physically out of that neighborhood. The corridor and neighborhood assertions use the separate incidences at coincident physical boundary positions.]
  #emph[The families do not interleave. With primes for the second shell, their intrinsic order, up to reversal, is 
$ C_0 \, C_1 \, C_2 \, C_3 \, C'_3 \, C'_2 \, C'_1 \, C'_0 \, $

 with $C_1 \, C_2 \, C_3$ omitted at a bounded end. Each family has a clear interior connector of length at most $A ell_n$ crossing its cuts in order. The disk $F$ between $C_0 \, C'_0$ is admitted, and its end-separation ratio tends to infinity.]
] <disk:four-cuts>

#proof[
  We use the full-side skeleton rounding of Proposition 53 at divergent scale. A curve consisting of boundedly many line or circle pieces of total length $O \( ell \)$ meets $O \( ell \)$ cells. The same skeleton construction stays within $O \( 1 \)$ tile steps and uses $O \( ell \)$ edges. Keep a grid-aligned central segment and follow each outward branch to its first original-wall incidence. Macroscopic clearance places that incidence in the intended terminal neighborhood, with its correct label. Loop erasure preserves the central segment and the separated branch tubes. Opposite accesses in coalescing terminal neighborhoods cannot meet in the interior, since that would give an excluded small opposite-flank cut.
  There is a useful refinement when the final approach is the radial segment from the center $x$ of an interior tangent ball to its contact $z$. At every point $y$ on this segment,
  #[#set math.equation(numbering: n => "(6.2)")
   $ "dist" \( y \, partial D \) = \| y - z \| . $ <disk:radial-clearance>]
  The upper bound uses $z$ and the lower bound uses the tangent ball. Hence an earlier contact caused by rounding is only $O \( 1 \)$ steps from $z$. If $tilde(z)$ is the rounded endpoint, center the terminal balls at $tilde(z)$ and choose their normalized radii generically in slightly smaller fixed intervals, still separated by a fixed gap. The displacement $\| tilde(z) - z \| = O \( 1 \) = o \( ell \)$ preserves strict containment and separation. Reapplying Lemma 52 in these recentered balls gives wall continuations at the actual cut endpoint. We use precisely these endpoint-centered neighborhoods below.
  ===== 6.5.1 Four cuts in one shell. <four-cuts-in-one-shell.>
  We construct the four cuts first in one shell. Rescale by $ell$ and suppress the sequence index. The preceding clear route enters each tangent disk along an axis ray strictly inside its inward cone. If the two contacts stay a positive distance apart, choose disjoint terminal work balls smaller than this distance. The case of coalescing contacts will be checked separately.
  Inside each single-label neighborhood fix
  $ 0 < h_0 < h_1 < h_2 < h_3 \, #h(2em) 0 < d_0 < d_1 < d_2 < d_3 lt.double h_0 . $
  The radii have positive gaps, for example successive ratio four, and $h_3$ is much smaller than the tangent radius, the neighborhood radius, and $eta$. The offsets also have positive gaps. Draw four parallel copies of the core, on the prescribed longitudinal side. Near each end truncate the $i$th approach ray at radius $h_i$ about the old contact and follow that circle in the corresponding longitudinal direction. For $i = 0 \, 1 \, 2$, stop at the first wall hit. Such a hit exists: the accessible wall continuation from the contact leaves the largest work ball, and so crosses this circle. The first hit has the intended flank label. The old tangent disk excludes walls from a fixed cone about its inward ray, so the tail stops before returning through the opposite margin of that cone.
  The four curves are separated for explicit geometric reasons. Tails on distinct circles have their radial gap. An outer approach ray starts outside every smaller circle. At its beginning an outer tail moves farther to the chosen side of the smaller-offset rays, retaining the offset gap; away from that cone its distance from an inward ray is a fixed fraction of its radius. It cannot return through the other cone margin before its first wall hit. The nonterminal pieces retain their separate core tubes. All these are strict bounds by positive constants in the rescaled geometry.
  The outermost curve requires a further change: a tail stopped at its first exact wall hit need not have clear passage to that hit. Choose $delta > 0$ smaller than all radial and offset gaps, tube widths, and terminal containment margins. Follow the outermost ray and its $h_3$ tail only to its first point $x$ at distance $delta$ from an original wall. Its earlier part is $delta$-clear. Choose a nearest contact $z$ and complete this end by the segment $x z$. Then $B \( x \, delta \)$ is an interior tangent ball, and $z$ has the correct accessible label. The new segment stays within $delta$ of $x$, so all separation margins survive. Its interior has boundary distance strictly less than $delta$, by (6.2); it therefore cannot meet the retained, $delta$-clear part of the curve.
  Choose smaller and larger terminal radii near $delta \/ 8$ and $delta \/ 4$, with a fixed gap and generic values. Their balls about $z$ are contained in the old single-label neighborhood and miss $C_2$. The retained probe and its radial end segment connect the approached components to the old tangent approach. Lemma 52 again gives their label and wall continuations. Equation (6.2) supplies a corridor of width less than one quarter of the smaller radius until that corridor enters the smaller terminal ball. This constructs the required clear terminal probe for $C_3$; no clearance is needed on the discarded remainder of the exact-hit tail. Figure 6 depicts this choice and the protected central openings.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.35, 0.3), (4.35, 3.55), fill: rgb("#f5f5f5"), stroke: none)
  line((-0.35, 0.3), (4.35, 0.3), stroke: (thickness: 0.4pt))
  line((-0.35, 3.55), (4.35, 3.55), stroke: (thickness: 0.4pt))
  content((-0.35, 0.3), [#text(size: 9pt)[$S$]], anchor: "east")
  content((-0.35, 3.55), [#text(size: 9pt)[$T$]], anchor: "east")
  rect((0.15, 1.12), (3.9, 1.38), fill: rgb("#dfdfdf"), stroke: none)
  rect((0.15, 2.42), (3.9, 2.68), fill: rgb("#dfdfdf"), stroke: none)
  rect((-0.05, 0.8), (4.05, 3), stroke: (thickness: 0.4pt))
  line((0.2, 0.3), (0.2, 3.55), stroke: (thickness: 0.4pt))
  content((0.2, 3.55), [#text(size: 9pt)[$C_0$]], anchor: "south")
  line((1.4, 0.3), (1.4, 3.55), stroke: (thickness: 0.4pt))
  content((1.4, 3.55), [#text(size: 9pt)[$C_1$]], anchor: "south")
  line((2.6, 0.3), (2.6, 3.55), stroke: (thickness: 0.4pt))
  content((2.6, 3.55), [#text(size: 9pt)[$C_2$]], anchor: "south")
  line((3.8, 0.3), (3.8, 3.55), stroke: (thickness: 0.4pt))
  content((3.8, 3.55), [#text(size: 9pt)[$C_3$]], anchor: "south")
  line((0.3, 1.25), (3.65, 1.25), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  line((0.3, 2.55), (3.65, 2.55), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  circle((2.6, 1.25), radius: 0.2, stroke: (thickness: 0.4pt))
  circle((2.6, 2.55), radius: 0.2, stroke: (thickness: 0.4pt))
  content((2, -0.25), [#text(size: 9pt)[Two protected openings#linebreak()in the common rectangle]])
  line((6.3, 3.2), (7.55, 2.6), (8.6, 2.6), (9.2, 2.85), (10.4, 2.6), stroke: (thickness: 0.4pt))
  content((9.7, 2.8), [#text(size: 9pt)[wall]], anchor: "south")
  circle((8.05, 1.8), radius: 0.8, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((6.3, 1.25), (7, 1.25), (8.05, 1.8), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  line((8.05, 1.8), (8.05, 2.6), stroke: (thickness: 0.4pt))
  bezier((8.05, 1.8), (10.4, 2.6), (8.8, 1.5), (9.7, 1.65), stroke: (thickness: 0.4pt))
  circle((8.05, 1.8), radius: 0.035, fill: black, stroke: none)
  circle((8.05, 2.6), radius: 0.035, fill: black, stroke: none)
  content((8.05, 1.8), [#text(size: 9pt)[$x$]], anchor: "north-east")
  content((8.05, 2.6), [#text(size: 9pt)[$z$]], anchor: "south")
  content((8.05, 2.15), [#text(size: 9pt)[$delta$]], anchor: "west")
  circle((8.05, 2.6), radius: 0.2, stroke: (thickness: 0.4pt, dash: "dotted"))
  circle((8.05, 2.6), radius: 0.1, stroke: (thickness: 0.4pt, dash: "dotted"))
  content((8.2, -0.25), [#text(size: 9pt)[Stop at the first distance-$delta$ contact;#linebreak()replace the remaining tail by $"xz"$]])
})],
    caption: [Figure 6: The geometry used to extend an actual crossing. Left: the common straight portions of four separated cuts contain two transverse strips and protected $C_2$ openings. Outside this rectangle the cuts may follow irregular walls. Right: a schematic terminal probe for $C_3$. Its retained part is $delta$-clear, and the nearest-wall segment from its first distance-$delta$ point $x$ supplies a tangent approach to $z$. The dashed remainder of the old exact-hit tail is discarded; the dotted circles indicate the smaller terminal neighborhoods. Neither panel depicts the full disk or asserts separation of distinct incidences having the same physical boundary position. ],
  ) <fig:disk-localization>
  ===== 6.5.2 Coalescing contacts. <coalescing-contacts.>
  It remains to check physical separation when the two original tangent contacts converge to the same position. The small-cut exclusion implies that their inward normals in the limit are opposite. Otherwise the two equal-radius tangent disks overlap in a sector arbitrarily close to the common contact. Joining their radial accesses through that sector would give a forbidden proper $S$–$T$ cut. Choose axis rays strictly inside the resulting opposite inward cones, and use the same list of radii at the two ends.
  Distinct tail indices are separated by their radial gap, less the vanishing contact displacement. To control a tail against an opposite-end ray, take a fixed strict subcone about that ray. At radii between $h_0$ and $2 h_3$, balls of radius $c h_0$, for sufficiently small fixed $c > 0$, lie inside the opposite tangent disk and connect to its contact by the radial access. If the tail entered one of these balls, its own contact access, the tail, and a short connection in the ball would produce an excluded local $S$–$T$ cut. Thus every tail stays a positive distance from every opposite-end approach ray. The same bound holds for offset rays by choosing all $d_i$ below this margin and reducing $c$. Beyond radius $2 h_3$, radial distance alone separates a ray from every circular tail, whose radius is at most $h_3$; the vanishing contact displacement and the smaller offsets preserve this gap. Tail-to-tail distances use the distinct radii. Decrease $delta$ below these margins too, so the terminal replacement within distance $delta$ preserves them. Each tail remains in its own circle component. The two first-distance-$delta$ approaches cannot meet through the local clear bulk either, since such a meeting would join the two accesses. Physical coincidence of the two endpoints of a single cut is allowed in different boundary incidences; the four distinct cuts remain physically separated.
  Round the curves as described above. Fixed positive separations survive the $O \( 1 \)$ displacement, and the final terminal balls are recentered at the actual rounded endpoints. In a smaller protected central rectangle the four cuts are straight parallel segments. Choose two separated transverse strips through this rectangle from flat $C_0$ patches across $C_2$ to $C_3$. Reserve a fixed physical neighborhood of each $C_2$ opening disjoint from all nonlocal portions of $C_2$: the separated core tubes and the smaller rectangle give this stronger, physical separation as well as the intrinsic endpoint order. The corrected $C_3$ probes give the clear full-width corridors from either strip to either terminal neighborhood. After decreasing $a$ and increasing $A$, all asserted length, width, and separation bounds hold with the constants in the statement.
  ===== 6.5.3 Ordering the two shells. <ordering-the-two-shells.>
  Disjoint proper $S$–$T$ cuts are linearly ordered in the abstract disk. The order of a family is its order along a short transverse connector inside the common rectangle. Construct the two families on one subsequence, choosing each family’s longitudinal side toward the other shell. Their safe shells are physically disjoint and every family’s connector misses the other family’s cuts. Hence no cut of one family can lie between consecutive cuts of the other: it would separate the endpoints of that connector. This proves the stated noninterleaving order, including a bounded shell, which has only $C_0$. Cutting between $C_0$ and $C'_0$ introduces just the two end intervals and retains the original flank subintervals. It gives an admitted tiled disk whose end-separation ratio tends to infinity, since $m = o \( m' \)$. This proves the lemma. ◻
]

=== 6.6 From pure tests to actual hard passages <from-pure-tests-to-actual-hard-passages>

Write $b \( Q \)$ for the blank probability of an actual tested-color connection between $I \, J$, without any boundary identifications.

#thm([Theorem 6.9.])[
  (Actual irregular-disk decay with end caps).  #emph[There are $c \, C > 0$, depending only on the fixed model, such that in the disks of Convention 48, 
$ bb(P) \( upright("actual ") I upright("-to-") J upright(" path") \) lt.eq C (frac(1 + r, R))^c . $

 The bound is uniform under any planar noncrossing partition on the two end intervals, including a joint partition across the ends, provided there are no other ties. Thus a joint end cap may identify slots of $I$ with slots of $J$, but it contains no longitudinal-flank slots outside those end intervals.]
] <thm:actual-disk>

#proof[
  #strong[Blank decay and the choice of a reference law.] Separate cap partitions at the two ends give actual crossing probability at most $b \( Q \)$, by Lemma 26. Suppose that blank decay fails, and choose a sequence with end-separation ratios tending to infinity and crossing probabilities at least $epsilon_0 > 0$. Choose integer scales
  $ 1 + r lt.double m lt.double m' lt.double R $
  and the two families from Lemma 55. Its constants are fixed on one subsequence. Write $F$ for the disk between $C_0$ and $C'_0$. Every original crossing traverses $F$. Conditioning its blank exterior induces separate end caps, because the two exterior pieces are separated by $F$. Thus no-hit comparison gives $b \( F \) gt.eq epsilon_0$.
  At a divergent-scale end, consider the collar between $C_0 \, C_1$. The cut $C_0$ has length $O \( ell \)$ and is at distance at least $a ell$ from $C_1$. Cover $C_0$ by $N$ interval patches of diameter at most $alpha ell$, where $alpha > 0$ is a sufficiently small fixed constant and $N$ is bounded independently of the mesh. By Theorem 54, the pure probability from each patch to the whole of $C_1$ is less than $q \/ 2$. To apply that theorem with the patch as the end, include the unused parts of $C_0$ in the free flanks; this changes neither the ordinary collar graph nor that pure test. Lemma 24 bounds its cross pressure by $log \( 2 - q \)$, since $t = 1 \/ q$. Positive coverage consequently gives
  #[#set math.equation(numbering: n => "(6.3)")
   $ Delta \( C_0 \, C_1 \) lt.eq N log \( 2 - q \) . $ <disk:end-pressure>]
  The one-sided identity and cofacial cap comparison now show that the full-$C_0$ wire gain varies by bounded factors under every induced noncrossing cap at $C_1$. Equivalently, inserting that wire changes the marginal beyond this collar by bounded reciprocal densities. The opposite end wire may already be present there: it only changes the cap induced at $C_1$. At a bounded-scale end the cut has bounded rank, so finite component counting gives the same conclusion directly.
  Insert the two end wires successively. Denote the resulting, fixed law on $F$ by $mu$; its only ties are the two separate full end wires. For cuts $A \, B$ write $E \( A \, B \)$ for an actual traversal #emph[supported in the disk between those cuts]. The original full traversal implies the central event, whose support is beyond both end collars. The marginal comparisons therefore give
  #[#set math.equation(numbering: n => "(6.4)")
   $ mu \( E \( C_2 \, C'_2 \) \) gt.eq c_0 epsilon_0 > 0 . $ <disk:central-positive>]
  At a bounded end use $C_0$ in place of $C_2$ in this notation. It remains to extend this actual central crossing to the two end wires.
  ===== 6.6.1 A physical search with a protected opening. <a-physical-search-with-a-protected-opening.>
  Consider the divergent-scale end at $C_0$. Search in the central band from $C_2$ to $C'_2$. Use the complementary-face exploration of Lemma 35, which applies to a tiled disk with the same path/cut alternative. For clarity, the cuts are impassable to the complementary search, and fictitious outward end accesses specify only separation topology. They are neither FK ties nor physical path edges. Seed the #emph[exterior] face of one flank. Query an edge only from a reached complementary face, and enter its opposite face only if the tested-color physical bond is closed. No adjacent interior face is seeded without that test.
  On success, exhaustion of the search leaves a frontier containing an actual measured-open crossing $P$. Orient the chosen simple witness from the near cut to the far cut. Retain its portion after the last near-cut visit and before the first subsequent far-cut visit. Such a far visit exists because the witness ends there. All its bonds have been queried open, and ordinary incidences into its opposite side remain unqueried. Indeed any queried edge was incident to a reached face, and a reached complementary face cannot cross the open witness.
  The witness is allowed to touch the original flanks or use boundary bonds. At a wall contact keep the separate boundary slots and the half-cell drawing, or prolong the contact infinitesimally into a formal outward collar for separation topology. The trimmed witness is then proper in this auxiliary drawing. This introduces no sampled edge, no additional path bond, and no identification; queries retain their original cell incidences and fans. From the unsearched side an access to a wall shared with $P$ meets $P$ before or at that same incidence.
  The two spaced $C_2$ openings give favorable leaves for at least one of the two flank searches. To check this, take any simple actual witness and compare its near endpoint with a point between the two openings. A search from $S$ cannot choose a frontier endpoint farther toward $T$ than that witness’s endpoint: an inward bond beyond it has both incident complementary faces on the blocked side and cannot be queried. If the witness endpoint lies on the $S$ side of the midpoint, use the farther opening and the $S$ search. Otherwise use the other opening and the $T$ search. Each favorable event is a union of leaves of its own experiment; their union covers central success. One experiment therefore has favorable probability at least half of $mu \( E \( C_2 \, C'_2 \) \)$. The straight patch and its protected neighborhoods in Lemma 55 give a fixed physical gap from the frontier endpoint and from all nonlocal portions of $C_2$, not just an interval in boundary order.
  ===== 6.6.2 The first approach to the measured frontier. <the-first-approach-to-the-measured-frontier.>
  Fix a favorable leaf, and rescale the first shell by $ell$. At the selected flat $C_0$ patch choose an interior tangent ball of fixed radius smaller than the collar and opening margins. Start at its #emph[interior center], follow the untouched transverse stem through the favorable $C_2$ opening, and then follow the corrected $C_3$ probe toward the searched flank. The initial radial access from the center to $C_0$ is a prescribed tangent approach; it is excluded from the following stopping search. The region being traversed is the physical union of the untouched end collar and the unsearched component of the central band, glued through the opening. The artificial cut $C_2$ is not an obstruction at this entrance.
  Choose a fixed $epsilon.alt > 0$ smaller than the initial tangent radius, all corridor widths, the endpoint gap at the opening, and the nested terminal-neighborhood margins. Move along the route to its first distance-$epsilon.alt$ approach to an obstruction of this untouched region. Before the terminal neighborhood it has clearance from original walls; farther along it is separated from $C_2$ and the far end cut. In the enlarged terminal neighborhood only the searched flank is accessible. An access from the unsearched side to that flank must meet $P$ before or at its wall contact: otherwise it would pass from one side of the proper crossing to the other without going through an end cut. This also identifies the physically nearest obstruction. Before the smaller terminal ball all original walls have the corridor clearance. Inside that ball, a segment of length at most $epsilon.alt$ to any physical wall stays in the larger ball. Its first exit from $D$ determines an accessible incidence of the indicated flank, so the segment meets $P$ before or at that incidence. Thus an inaccessible wall cannot be nearer than $P$. No previously queried bond lies strictly on the unsearched side. The first obstruction is consequently $P$.
  A nearest segment supplies an interior tangent ball of radius $epsilon.alt$ at $P$, joined to the initial tangent-ball center by a clear route. At the opening, $P$’s near endpoint is excluded by the protected physical gap; beyond it both end cuts are excluded by the corridor and terminal margins. Reduce $epsilon.alt$ below these margins. The contact ball contains neither endpoint of $P$, so both branches of its simple physical path continue out of a smaller fixed neighborhood. Every accessible obstruction there is a portion of the same measured path, with ordinary unqueried incidences on the approached side. All bounds are uniform in the favorable leaf. The two tangent balls and their route therefore have the geometry of Lemma 51.
  Its buffered-cap hypothesis also holds on this conditioned graph. Draw the two original end wires as disjoint chains in boundary collars of $F$, delete every queried-closed physical edge, and contract every queried-open physical edge. These operations are planar. Each clear bulk buffer lies wholly in the unqueried region and contains no measured edge or identification. The end wire and $P$ are its prescribed boundary contacts. Exposing the exterior of the buffer thus induces a planar noncrossing cap. Fictitious search spokes are absent from this FK graph and from its contractions.
  We may now apply the auxiliary contact lemma. It gives a fixed positive conditional probability of network connection from $C_0$ to the hub of $P$ on every favorable leaf. Expand #emph[every] queried-open component used by this connection: a passage through a contracted component is replaced by a path of its queried-open physical bonds. After these expansions only the two original end wires remain nonphysical. Retain the route after its last use of the $C_0$ wire; this merely chooses its starting slot. If it reaches the other end wire, there is already an actual full crossing. Otherwise it meets $P$ and follows that measured physical path to the far cut. Remove loops, retain the segment after its last near-cut visit and before its first subsequent far-cut visit, and use proper-cut separation to place that segment in the corresponding intercut disk. We have obtained an actual traversal, even if the untrimmed network path wandered outside that disk.
  ===== 6.6.3 Two extensions under the same law. <two-extensions-under-the-same-law.>
  Averaging the favorable leaves and absorbing the two-orientation loss in a constant gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ mu \( E \( C_0 \, C'_2 \) \) gt.eq c_L mu \( E \( C_2 \, C'_2 \) \) . $ <disk:left-extension>]
  Discard this exploration. Under the #emph[same unchanged law] $mu$, perform a fresh physical search in the larger band from $C_0$ to $C'_2$. This band includes the first end collar and leaves the second one untouched. The wire at $C_0$ affects weights and the choice of a starting slot, but it is never a path edge in the search. Applying the same argument from the other end gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ mu \( E \( C_0 \, C'_0 \) \) gt.eq c_R mu \( E \( C_0 \, C'_2 \) \) . $ <disk:right-extension>]
  At a bounded end the corresponding extension is unnecessary and its constant is one. Neither inequality conditions on the first extension’s network success, and the favorable orientations need not coexist on one history. Combining these inequalities with (6.4) bounds $p \( F \)$ away from zero, since network connection with just the two separate full end wires has an actual witness. This contradicts Theorem 54 and proves qualitative blank decay.
  ===== 6.6.4 Joint caps and a uniform rate. <joint-caps-and-a-uniform-rate.>
  Now allow a planar cap that joins the two original ends. Isolate a long-ratio collar at each end by ordered level cuts, leaving a long central disk. The disjoint union of the collars has blank actual connection probability $beta = o \( 1 \)$ between its combined end-facing and center-facing cut sets, by blank decay and a union bound. Draw the collars side by side, reversing the inherited radial and boundary orders in the second collar. The two end-facing cuts then occupy one accessible boundary arc of the drawing, and the two center-facing cuts occupy another. The original joint end cap, denoted by $X$, is noncrossing on the first arc; fixing the central configuration induces a noncrossing partition $Y$ on the second. Their link trees can be drawn outside the respective arcs, disjointly. The collar graph itself may remain disconnected; the cap comparison concerns these two accessible arcs and does not require graph connectivity.
  Let $Z$ be its blank partition function. Lemma 27, with the roles of the arcs exchanged, gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ \( 1 - beta \) Z_X / Z lt.eq Z_(X \, Y) / Z_Y lt.eq Z_X / Z . $ <disk:joint-cap-density>]
  The middle expression is the unnormalized central-state density relative to the law without outer ties. Dividing by its mean bounds the normalized density between $1 - beta$ and $\( 1 - beta \)^(- 1)$, uniformly in $Y$ and under mixtures of $X$. In the reference law the collars induce separate caps on the central disk; no-hit comparison and blank decay therefore make its actual traversal probability tend to zero. This proves uniform qualitative decay for every allowed joint end cap, with no longitudinal ties.
  Choose a fixed ratio so large that this bound is at most $theta.alt < 1$. Select intrinsically ordered tile-edge cuts backwards at successive physical scales and retain disjoint intercut disks. There are $k gt.eq c_1 log \( R \/ \( 1 + r \) \) - C_1$ such disks with the chosen separation ratio. Every random full or half-cell belongs wholly to one side of each cut; shared deterministic cut vertices do not share random states. Conditioning outside one retained disk induces only an allowed planar joint partition on its ends. Every other retained traversal event is measurable outside it. A full traversal requires all these local traversals, so successive conditional bounds give $theta.alt^k$. This is the asserted power bound. Free dangling virtual slots on half-tile flanks do not change an actual traversal. ◻
]

=== 6.7 Branching across radial levels <branching-across-radial-levels>

Theorem 56 controls passage between two specified ends. A dual obstruction to a local join can instead leave through any of many radial exits. We now control all these exits together: the area of the disjoint continuation regions replaces a bound on their number.

We use checkerboard tiles with the boundary half-tile conventions. Lengths in this subsection are in tile units. Fix a tile corner as origin, write $𝜚 \( z \) = lr(bar.v.double z bar.v.double)_oo$ in tile coordinates, and use integer levels of $𝜚$. A monochrome edge is a tile diagonal or an allowed boundary spoke. Consequently a tile-edge crosscut separates monochrome paths at the vertices on the crosscut, without splitting any random tile state. At a boundary contact all statements refer to the separate incidences of the disk.

The #emph[missed-ray condition] means that, throughout the tested radial slab, the disk omits a fixed radial ray together with a neighborhood of several tile steps. Thus each integer level has a genuine missing interval. Its components in the disk interior, after splitting boundary contacts, have closures that are proper crosscuts rather than a full level returning to one boundary point. This is the condition supplied by the opposite-ray margins in every confined-join application below.

#thm([Lemma 6.10.])[
  (A branching area bound).  #emph[Let $V$ be a tiled disk and let $v subset partial V$ be an end arc contained in ${ 𝜚 = s }$. Fix a tested color. Its law is ordinary and free except for a possible noncrossing partition supported on $v$. Choose $epsilon.alt in { - 1 \, 1 }$ and an integer $D > 0$, with $s - D > 0$ if $epsilon.alt = - 1$, and assume the missed-ray condition between $s$ and $s + epsilon.alt D$. Let $A_v$ count the tiles of $V$ whose interiors meet the open slab between those levels, counting a retained half-tile as one cell. There is a constant $C = C \( q \)$ such that 
#[#set math.equation(numbering: n => "(6.8)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] v arrow.l.r { 𝜚 = s + epsilon.alt D } upright(" by an actual path in ") V #scale(x: 120%, y: 120%)[\)] lt.eq frac(C A_v, D^2) . $ <eq:disk-branching-area>]

 The constant is uniform over the disk, its end partition, and the number of possible terminal exits.]
  #emph[If the tile interiors are disjoint and embedded, the same hypotheses give, uniformly over these disks and partitions, 
#[#set math.equation(numbering: n => "(6.9)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] v arrow.l.r { 𝜚 = R } upright(" in ") V #scale(x: 120%, y: 120%)[\)] & arrow.r 0 &  & upright("as ") R \/ \( 1 + s \) arrow.r oo \,\
bb(P) #scale(x: 120%, y: 120%)[\(] v arrow.l.r { 𝜚 = r } upright(" in ") V #scale(x: 120%, y: 120%)[\)] & arrow.r 0 &  & upright("as ") s \/ \( 1 + r \) arrow.r oo . $ <eq:disk-branching-out>]

 All connections in these statements use physical bonds and ignore identifications when deciding whether a path exists.]
] <lem:branching>

#proof[
  The proof separates two estimates. When a continuation region has small area, an earlier level contains a short separating cut, so the uniform hard-passage bound makes the initial segment unlikely. The continuations beyond the midpoint are then summed by area. The two estimates use conditioning in opposite directions; neither requires independence of the branches.
  We first record the disk decomposition used throughout the proof. Take an intermediate integer level. Its open intervals in the disk have disjoint interiors, and their closures are proper crosscuts; endpoints that coincide physically are separated in their boundary fans. Splitting a disk along these crosscuts produces a tree of disk regions, with an edge for each crosscut. Root this tree at the region incident to $v$. The first crosscuts visible from that region will be denoted by $w$. The side of $w$ away from the root, including all its descendant regions, is a subdisk $V_w$. These subdisks have disjoint interiors. Every terminal-level point is behind at least one such crosscut: otherwise a path from the root region to it would avoid the intermediate level. This also covers boundary contacts by using the closed disk and its split incidences.
  For each $w$, denote the other closed subdisk by $V_w^(-)$. An actual successful path supplies both events
  $ E_w & = { v arrow.l.r w upright(" actually in ") V_w^(-) } \,\
F_w & = { w arrow.l.r { 𝜚 = s + epsilon.alt D } upright(" actually in ") V_w } $
  for some visible $w$. Indeed, use its first encounter with the relevant crosscut for the initial path and its last encounter for the remaining path. No edge is allocated to both subdisks, since the cuts follow tile edges; shared vertices on $w$ belong to both end sets.
  We prove (6.8) by induction on $D$. If $D$ is bounded, success requires at least one of the counted cells, so increasing $C$ covers these cases. For the inductive step cut at $s + epsilon.alt m$, where $m = floor.l D \/ 2 floor.r$. The remaining distance $D' = D - m$ is smaller than $D$ and is at least $floor.l D \/ 2 floor.r$. Write $A_w$ for the cell count in $V_w$ between the midpoint and terminal levels. Disjointness gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ sum_w A_w lt.eq A_v . $ <eq:disk-branching-area-sum>]
  Here is the uniform estimate for the initial paths when the area is small. For a fixed $w$, sum the lengths of the integer-level crosscuts in $V_w^(-)$ at distances between $D \/ 8$ and $D \/ 4$ from the starting level. Each counted tile contributes a bounded total length to this sum: its radial range has length at most one, and it has only a bounded number of sides. Hence the sum is at most $c_0 A_v$, for an absolute $c_0$. There are a number of admissible levels proportional to $D$ once $D$ is large. At one of them the total crosscut length is at most $c_2 A_v \/ D$.
  One interval at this chosen level separates $v$ from $w$. To see this, split $V_w^(-)$ along all the level intervals. The regions incident to each of the two connected end arcs form connected subtrees; those subtrees are disjoint because the arcs lie at strictly different radial levels on opposite sides of the chosen level. An edge between these subtrees is the required separating interval. Call its closure $sigma$. It has diameter at most $c_2 A_v \/ D$, whereas its distance from $w$ is at least $c_3 D$ for an absolute $c_3 > 0$. Choose any point of $sigma$ as the center for the hard-passage test; then $sigma$ lies in a ball of radius $c_2 A_v \/ D + O \( 1 \)$ and $w$ lies outside a concentric ball of radius $c_3 D - O \( 1 \)$.
  Condition first on all tile states in $V_w$. These states induce only a noncrossing end partition on $w$ in $V_w^(-)$; the original partition is on $v$. Next, for the purpose of bounding a traversal from $sigma$ to $w$, condition on the side of $sigma$ containing $v$. The remaining intercut disk has ordinary free longitudinal boundaries and at most joint planar end ties on $sigma \, w$. Such ties are allowed by Theorem 56. A $v$-to-$w$ path necessarily has an actual $sigma$-to-$w$ segment. The ratio in that theorem is bounded below by
  $ frac(c_3 D, 1 + c_2 A_v \/ D) . $
  Choose a fixed $c_1 > 0$ sufficiently small, and subsequently a fixed $D_0$ sufficiently large. If $A_v < c_1 D^2$ and $D gt.eq D_0$, the uniform hard-passage estimate therefore gives, for every conditioning on $V_w$,
  #[#set math.equation(numbering: n => "(6.11)")
   $ bb(P) \( E_w divides upright("states in ") V_w \) lt.eq 1 / 10 . $ <eq:disk-branching-initial>]
  The additive mesh-scale term is controlled by the choice of $D_0$.
  There is a separate use of conditioning for $F_w$. Fixing the states outside $V_w$ induces a noncrossing partition only on $w$, since $w$ is its sole interface with the complementary subdisk. Applying the induction hypothesis and then averaging gives $bb(P) \( F_w \) lt.eq C A_w \/ \( D' \)^2$. Combining this with (6.11), which conditions in the opposite direction, yields
  $ bb(P) \( upright("success") \) & lt.eq sum_w bb(P) \( E_w ∩ F_w \) lt.eq 1 / 10 sum_w bb(P) \( F_w \)\
 & lt.eq frac(C A_v, D^2) 1 / 10 (frac(D, floor.l D \/ 2 floor.r))^2 . $
  The final multiplier is less than one for all sufficiently large $D$. The finitely many remaining $D$ are covered by increasing $C$. If $A_v gt.eq c_1 D^2$, the bound is immediate from $C gt.eq 1 \/ c_1$. This proves the induction without requiring independence between different branches.
  For (6.9), cut at an integer $m$ nearest $R \/ 2$. In the same decomposition, each conditional initial event $E_w$ has probability at most $eta \( m \/ \( 1 + s \) \)$, where $eta \( L \) arrow.r 0$ is a uniform modulus supplied by Theorem 56. This applies directly to the ends $v \, w$, with the original end cap on $v$ and the cap induced by conditioning on $V_w$. The continuation slabs have total area at most $c_4 R^2$ and remaining distance comparable to $R$. Their bounds from (6.8) consequently sum to at most a constant depending on $q$. Repeating the preceding conditional sum proves the outward limit.
  For (6.9), use an integer $m$ nearest $sqrt(\( 1 + r \) s)$. Then $r + 1 lt.double m lt.double s$. Read the initial intercut disk in reverse, with $w subset { 𝜚 = m }$ as its small end and $v subset { 𝜚 = s }$ as its far end. Its conditional traversal chance is at most $eta \( s \/ \( 1 + m \) \) = o \( 1 \)$. The disjoint continuation slabs have total area at most $c_4 m^2$, and their radial distance $m - r$ is comparable to $m$. Their area bounds again sum to a bounded quantity. This proves the inward limit, irrespective of the number of exits. ◻
]

=== 6.8 An actual join confined to an annular channel <an-actual-join-confined-to-an-annular-channel>

The next lemma turns two opposed accessible barriers into an actual local connection. The conclusion is stronger than a network connection: the witnessing path cannot use a remote identification between its ends. The argument compares the central channel with a law having free dual boundary. Failure of a primal join then forces a dual radial passage, whose possibly numerous exits are controlled by Lemma 57.

#thm([Lemma 6.11.])[
  (Confined near-join).  #emph[Consider a checkerboard-tiled annulus and two families of barriers assigned to primal hubs $x \, y$. A hub may be a terminal wire or an already measured physically open path. The following conditions are assumed in the annulus.]
  + #emph[The two barrier families contain radius-spanning subarcs and lie in opposite open half-planes bounded by a diameter. There is a margin of many tile steps at both rays of that diameter.]
  + #emph[On one chosen, or focal, ray, the component accessible between the barriers is ordinary uninspected bulk up to its contacts. All accessible contacts on one angular side have label $x$, and all on the other have label $y$. Every intruding barrier portion continues physically to an exit of the annulus in its assigned half-plane. Multiple branches with the same label are allowed.]
  + #emph[The barriers are tile-edge walls or allowed diagonal cuts. Every primal contact is attached to its assigned hub, and incidences from strict interior sites up to these contacts have the ordinary odds. There are no other accessible boundaries or nonordinary incidences. The exterior states and ties have a planar realization.]
  #emph[As the available annular ratio tends to infinity, with all intermediate scales large in tile units, the conditional probability tends uniformly to one that an actual open path joins an $x$-contact to a $y$-contact through this channel and inside the annulus. A contact with a measured path is a contact with that physical path. The claim ignores any connection that uses only exterior shortcuts.]
] <lem:confined-join>

#proof[
  Select integer radii
  #[#set math.equation(numbering: n => "(6.12)")
   $ a < b < ell < c < h $ <eq:disk-join-radii>]
  inside the available annulus, so that $a$ is large in tile units and $b \/ a \, ell \/ b \, c \/ ell \, h \/ c$ all tend to infinity. Let $U$ be the closed tiled component in $a lt.eq 𝜚 lt.eq h$ accessible from the focal ray before crossing a barrier. Split its boundary contacts in their individual fans. A barrier diagonal leaves a half-tile. If it is a measured open primal edge, its endpoints already belong to the same hub, so replacing that boundary edge by the ordinary loop prescribed by the half-tile convention changes only a common partition-function factor. The opposite-color virtual slot is treated by that same convention.
  We first justify the disk topology needed below. The two spanning barriers separate the focal ray from the opposite ray, preventing a wrap around the annulus. A physical spanning barrier joins the excluded inner and outer regions. Every additional excluded barrier portion is physically connected to one of those regions, by the exit assumption. Thus the excluded set is connected on the sphere; common hub labels alone would not establish this fact. The complement of its focal component remains connected: any other complementary component has boundary on this excluded set. There is therefore no hole in the focal component. With finitely many polygonal edges, splitting boundary pinches into their intrinsic fans gives a topological disk. Its interior is injectively embedded. Every nonradial boundary contact of $U$ has one of the two specified labels. A strict primal site, including a strict radial-cut site, has one chart position and ordinary incidences. Any primal pinch on a contact barrier already belongs to its designated hub.
  All connections of the unmeasured graph to fixed exterior data occur at the cuts $𝜚 = a \, h$ or at $x \, y$. Let $S$ consist of those radial-cut sites together with representatives of both hubs. The latter are included even if a hub is physically represented only outside a particular piece. An exterior condition is consequently represented by a planar partition $X$ on $S$.
  ===== 6.8.1 Uniform comparison of the central marginal. <uniform-comparison-of-the-central-marginal.>
  Only a bounded comparison is needed here. We keep the central tile configuration fixed and show that changing its exterior data changes its weight by a bounded factor. The subsequent reference-law estimate will tend to zero and therefore survive this comparison.
  Let $H$ be the union of the two collars $U ∩ { a lt.eq 𝜚 lt.eq b }$ and $U ∩ { c lt.eq 𝜚 lt.eq h }$, with their contact sites attached to the shared hubs. Its central interface $W$ consists of the cut sites at $b \, c$, again including the hubs. Fixing the central tile states induces a partition $Y$ on $W$. Thus the comparison fixes the central edge configuration and changes only the exterior partition $X$. The two collars isolate these data once the shared hubs are retained in both interfaces; every shortcut using a hub is then represented in the same finite graph $H$. We will prove a constant bound for all four cross masses
  #[#set math.equation(numbering: n => "(6.13)")
   $ Delta_H \( S \, W \) \, quad Delta_(H \/ X) \( S_X \, W_X \) \, quad Delta_(H \/ Y) \( S_Y \, W_Y \) \, quad Delta_(H \/ \( X \, Y \)) \( S_(X Y) \, W_(X Y) \) \, $ <eq:disk-join-four-masses>]
  where sets in a quotient mean their images. This will hold uniformly in both exterior and central states.
  Fix one of these quotients. In its positive site-pressure expansion, discard all multisets meeting a final class containing $x$ or $y$. For a single vertex the total hitting mass is $log t$, where $t = 1 \/ q$; positive coverage therefore charges at most $2 log t$ for this deletion, also if the hubs have merged. All contacts in these final classes are discarded together. The remaining contractions are denoted by $X' \, Y'$. They act only on strict sites of the corresponding radial cuts.
  These residual partitions have the cap order required for a pair of disjoint clean collars. To verify the exterior order explicitly, draw inside $U$ a finite connected tree reaching every retained strict contact on the $a \, h$ cuts and otherwise missing the boundary. One may first draw finitely many interior access paths and then delete cycles. Thicken the tree slightly. Its contour visits the retained contacts in the boundary order of the ambient slit annular strip: the order on one circular cut is increasing in angle and that on the other is decreasing. This follows by continuing the contact accesses out of the strip; those outward accesses are pairwise disjoint, whereas the tree lies inside. The exterior links representing $X'$, after removal of the hub classes, miss the tree and approach these contacts from outside $U$. Alternating endpoint pairs on the tree contour would force two distinct exterior link trees to intersect on the sphere. Thus $X'$ is noncrossing in this order, even when an original exterior route passed around the other side of the annulus. Small outward prolongations distinguish coincident fan accesses.
  For $Y'$ use the strip drawing on the central side of the $b \, c$ cuts; the same boundary-order argument applies. Now place the two collar pieces side by side, reversing both the radial direction and the angular order in the second piece. The $S$ cuts occupy one boundary arc of this drawing, the $W$ cuts another; $X'$ and $Y'$ are separate noncrossing caps on those arcs. No hub class remains to connect the two arcs. This conclusion uses the planar exterior realization, not any stochastic monotonicity in boundary conditions.
  Complete each collar to a full ordinary checkerboard annular collar at its respective radii, slit along a tile-edge approximation to the missed opposite ray. Choose the slit inside its many-step margin. Call the disjoint union of these two clean disks $H_0$. Transfer the residual contractions $X' \, Y'$ in the just-verified order. We compare the pressure coefficients avoiding the discarded classes with those of this clean graph.
  Every retained strict site has its usual grid chart. An ordinary incidence missing from the chart because of a barrier is replaced in the original graph by an ordinary incidence to that barrier’s removed contact class, possibly a half-tile spoke. It therefore already pays the incident factor required by the completed chart. At a radial-cut site only the incidences facing into the collar are required. Keeping all existing induced chart edges and supplying the missing ones thus does not increase the incident odds product at any retained site. The same assertion holds after the residual contractions: multiply the factors of the constituent sites and discard loops. Parallel edges may be combined using multiplication of their $1 + v$ factors. A new chart edge whose two endpoints are retained consumes one such missing contact incidence at each endpoint, so it is covered by the same ledger. Lemma 8 now applies: supplying induced edges and decreasing the incident products cannot decrease a retained pressure coefficient. Its zero-site assertion also shows that identifying the discarded contacts does not change any coefficient avoiding them. Thus the comparison holds in the actual quotient after its hub contractions. Positivity and convergence of the pressure series bound the retained cross mass by the full clean cross mass with residual caps, which may additionally use filler sites and allowed cut sites.
  Here is a direct bound for that clean mass. Write $beta$ for the blank actual connection probability between its two combined cut sets. Each clean component is a tiled disk, so Theorem 56 and a union bound imply
  $ beta lt.eq eta #scale(x: 120%, y: 120%)[\(] b \/ \( 1 + a \) #scale(x: 120%, y: 120%)[\)] + eta #scale(x: 120%, y: 120%)[\(] h \/ \( 1 + c \) #scale(x: 120%, y: 120%)[\)] = o \( 1 \) \, $
  after harmless mesh-scale changes to the ratios. Its separately fully wired network probability $p$ is at most $beta$ by Lemma 26. Lemma 24 then gives
  $ 0 lt.eq Delta_(H_0) lt.eq log (1 + frac(\( t - 1 \) p, 1 - t p)) = O \( beta \) . $
  The same one-sided identity bounds each single-cap cross mass by $Delta_(H_0)$. For the double quotient use
  #[#set math.equation(numbering: n => "(6.14)")
   $ I_G \( X \, Y \) = log frac(Z_(G \/ X) Z_(G \/ Y), Z_G Z_(G \/ \( X \, Y \))) = Delta_G - Delta_(G \/ X) - Delta_(G \/ Y) + Delta_(G \/ \( X \, Y \)) . $ <eq:disk-join-mixed-identity>]
  The cap comparison of Lemma 27 gives $0 lt.eq I_(H_0) \( X' \, Y' \) lt.eq - log \( 1 - beta \) = O \( beta \)$. It follows from (6.14) that the clean double cross mass is also $O \( beta \)$. These bounds hold on the side-by-side disk drawing, including caps joining contacts of the two components. Adding the discarded hub mass proves that all four quantities in (6.13) are bounded by $2 log t + O \( beta \)$.
  Applying (6.14) on $H$ gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ \| I_H \( X \, Y \) \| lt.eq M_0 $ <eq:disk-join-mixed-bound>]
  for a constant independent of the exterior and central configurations. Finite component counting now yields a density statement. For a fixed central configuration $zeta$, its contribution is an $X$-independent factor times $Z_(H \/ \( X \, Y_zeta \))$. Relative to $X = diameter$, the unnormalized density is
  $ Z_(H \/ \( X \, Y_zeta \)) / Z_(H \/ Y_zeta) = Z_(H \/ X) / Z_H exp { - I_H \( X \, Y_zeta \) } . $
  Normalization and (6.15) bound its reciprocal densities by $e^(2 M_0)$. Comparing any two exterior choices therefore gives a common bound $C_(upright("den")) = e^(4 M_0)$. Boundedly many additional splittings used to represent through wires cost only a bounded power of $q$. We have proved bounded reciprocal densities for the central states throughout $b lt.eq 𝜚 lt.eq c$.
  ===== 6.8.2 The reference law and a dual witness for failure. <the-reference-law-and-a-dual-witness-for-failure.>
  Use as reference the partition joining all primal boundary vertices of $U$ into one wire. It is an admissible choice on $S$, since all nonradial boundary contacts already belong to $x$ or $y$. Disk Euler duality with narrow boundary chains gives the opposite-color law entirely free on $U$, with ordinary self-dual odds. This includes the half-tile virtual slots; dangling slots do not change interior traversals.
  Let $J$ be the tile-edge crosscut on $𝜚 = ell$ containing the focal ray, extended in both angular directions until its first wall hits. Its two endpoints have the opposite labels $x \, y$ by the half-plane separation. The nearest primal boundary slots at those endpoints on either side of the cut have the corresponding labels. Splitting along $J$ gives two disks. Both omit the opposite ray.
  Suppose there is no actual primal $x$-to-$y$ connection in the central channel. Color a central primal site red if it is reachable from any central $x$-contact by actual bonds supported there, and blue otherwise. Every $x$ boundary portion is red and every $y$ boundary portion is blue. Work a fixed number of tile steps inside $b \, c$ to avoid any rounding ambiguity, and extend these colors arbitrarily to the rest of $U$. Select a dual edge when its crossed primal endpoints have different colors.
  At an interior dual site the incident primal colors are cyclically ordered; their number of changes is even. Thus the selected dual graph has even degree there. At a boundary dual site the primal fan is linear, and the degree is odd exactly when its two endpoint primal colors differ. This is equally valid in a half-tile with its virtual slot. Apply this observation in either of the disks cut at $J$. Summing these boundary parities along $J$ telescopes to the difference between the colors at its two ends, which is one modulo two. Include a dual endpoint of $J$ in the sum when that endpoint has the dual color. Hence the selected graph has an odd total number of odd-degree vertices on $J$.
  Every finite graph component has an even number of odd-degree vertices. Some component meeting $J$ must therefore contain an odd-degree vertex outside $J$. Follow a selected-edge path to such a vertex. Inside the central radial range there are no such vertices on the original boundary: the boundary label is constant along each wall fan. Consequently the path reaches a neighborhood of one of the two radial ends of the coloring. Before doing so, it reaches one of the rounded integer levels $2 b$ or $c \/ 2$, since $2 b < ell < c \/ 2$ for the ratios under consideration.
  Up to the first such hit every crossed primal edge lies in the central range and has differently colored endpoints. It must be closed: otherwise its blue endpoint would be reachable from the red one. The selected dual path up to that hit is thus actually open. Let $cal(B) \( V \, r \)$ denote the event of an actual dual path from $J$ to the rounded level $r$, supported in $V ∩ { b lt.eq 𝜚 lt.eq c }$. We have proved the deterministic inclusion
  #[#set math.equation(numbering: n => "(6.16)")
   $ & { upright("no central actual ") x upright("-to-") y upright(" join") }\
 & #h(2em) subset union.big_(V upright(" a side of ") J) #scale(x: 120%, y: 120%)[\(] cal(B) \( V \, 2 b \) union cal(B) \( V \, c \/ 2 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:disk-join-failure-witness>]
  The rounded levels differ from those displayed by at most a bounded number of tile steps. The event on the right depends only on central states, which is necessary for applying the density comparison.
  Under the free dual reference law, conditioning outside either side disk of $J$ induces a planar partition only on $J$. The other parts of its original boundary are free. In particular $b \, c$ are target levels inside that disk, not boundary arcs carrying extra ties. Its tile interiors are embedded and it has the missed-ray property. Lemma 57, first outward and then inward, bounds the two unrestricted dual-leg probabilities by quantities tending to zero, because $c \/ ell arrow.r oo$ and $ell \/ b arrow.r oo$. Restricting a witness to the central range can only decrease these events. Summing over the two side disks in (6.16) shows that its right-hand side has reference probability $o \( 1 \)$.
  The bounded density $C_(upright("den"))$ transfers this bound to every allowed original exterior condition. Therefore the actual central join has conditional probability $1 - o \( 1 \)$, uniformly as asserted. Its witnessing chain consists of physical open bonds, with at most the ordinary terminal incidence at each end. No jump along a wire or to another piece of a measured path is needed to certify this local connection. ◻
]

The same statement has a useful fixed-parameter interpretation. Given an error tolerance, first choose the ratios in (6.12) sufficiently large, keeping all geometric margins strict, and then take the mesh sufficiently fine. The bound is uniform in the remaining exterior states. For tangent approaches of radius at least $r_0$, a local template of diameter $L$ deviates from its tangent line by $O \( L^2 \/ r_0 \)$. A gap $d$ satisfying $L^2 \/ r_0 lt.double d lt.double L$ therefore permits an intermediate shell outside the gap in which tangent-disk exclusion puts the two contact barriers in the required opposite half-planes. This is the order of choices used when the lemma is applied to nearby measured blockers.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.75), (1, 0.9), (1.3, 0.7), (2.3, 0.8), (2.65, 1.05), (3.3, 0.85), (4.5, 0.9), (4.5, 2.5), (3.7, 2.6), (3.2, 2.3), (2.4, 2.5), (1.8, 2.3), (0.8, 2.6), (0, 2.4), close: true, fill: rgb("#f0f0f0"), stroke: none)
  line((0, 0.75), (1, 0.9), (1.3, 0.7), (2.3, 0.8), (2.65, 1.05), (3.3, 0.85), (4.5, 0.9), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((0, 2.4), (0.8, 2.6), (1.8, 2.3), (2.4, 2.5), (3.2, 2.3), (3.7, 2.6), (4.5, 2.5), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((0, 0.3), (0, 3.2), stroke: (thickness: 2.0pt))
  line((4.5, 0.35), (4.5, 3.2), stroke: (thickness: 2.0pt))
  content((0, 1.5), [#text(size: 9pt)[$x$]], anchor: "east")
  content((4.5, 1.5), [#text(size: 9pt)[$y$]], anchor: "west")
  content((2.3, 1.1), [#text(size: 9pt)[$U$]])
  line((6.6, 0.75), (7.6, 0.9), (7.9, 0.7), (8.9, 0.8), (9.25, 1.05), (9.9, 0.85), (11.1, 0.9), (11.1, 2.5), (10.3, 2.6), (9.8, 2.3), (9, 2.5), (8.4, 2.3), (7.4, 2.6), (6.6, 2.4), close: true, fill: rgb("#f0f0f0"), stroke: none)
  line((6.6, 0.75), (7.6, 0.9), (7.9, 0.7), (8.9, 0.8), (9.25, 1.05), (9.9, 0.85), (11.1, 0.9), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((6.6, 2.4), (7.4, 2.6), (8.4, 2.3), (9, 2.5), (9.8, 2.3), (10.3, 2.6), (11.1, 2.5), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((6.6, 0.3), (6.6, 3.2), stroke: (thickness: 2.0pt))
  line((11.1, 0.35), (11.1, 3.2), stroke: (thickness: 2.0pt))
  content((6.6, 1.5), [#text(size: 9pt)[$x$]], anchor: "east")
  content((11.1, 1.5), [#text(size: 9pt)[$y$]], anchor: "west")
  content((8.9, 1.1), [#text(size: 9pt)[$U$]])
  line((0, 3.05), (0.8, 3.5), (1.7, 3.3), stroke: (thickness: 0.4pt))
  bezier((1.7, 3.3), (3.45, 3.4), (2.3, 4), (2.9, 4), stroke: (thickness: 0.4pt))
  line((3.45, 3.4), (4.05, 3.6), (4.5, 3.05), stroke: (thickness: 0.4pt))
  content((2.65, 3.85), [#text(size: 9pt)[external connection]], anchor: "south")
  content((2.3, -0.25), [#text(size: 9pt)[Auxiliary contact:#linebreak()a network conclusion]])
  line((6.6, 1.7), (7.2, 1.95), (7.65, 1.6), (8.35, 1.8), (8.9, 1.5), (9.6, 1.85), (10.1, 1.6), (11.1, 1.85), stroke: (thickness: 1.2pt))
  content((8.9, 2.9), [#text(size: 9pt)[actual bond path]], anchor: "south")
  content((8.9, -0.25), [#text(size: 9pt)[Confined join:#linebreak()a path contained in $U$]])
})],
  caption: [Figure 7: Network contact and a confined join. The hubs $x \, y$ represent measured blockers or terminal walls, and $U$ is the untouched channel between them. A network connection may use exterior graph portions (left). Lemma 58 produces an actual open path inside $U$ (right), under its separated-barrier, ordinary-incidence, and planar-cap hypotheses. In a pure two-end-wire disk, network connection already has an actual witness; the additional conclusion here is confinement to the channel. ],
) <fig:actual-network>

=== 6.9 Physical routing in regular geometries <physical-routing-in-regular-geometries>

We next build prescribed physical connections from a finite chain of crossing templates and confined joins. Free-wall attachments require a separate seed construction. For several attachments, one further point is essential: the local joins must belong to the same physical component inside each shared corridor. The component estimate below provides this compatibility before the final union bound.

All probabilities in this subsection are finite positive FK probabilities at the fixed self-dual odds. A path called #emph[actual] uses open bonds, including an ordinary terminal incidence when appropriate, and never uses an identification as a path edge. Boundary incidences on different banks of a slit remain distinct. Constants may depend on a fixed finite collection of geometric shapes and their positive clearances. Geometric parameters are fixed first; the mesh then tends to zero. In particular, a positive lower bound for a fixed thin corridor need not remain positive as its width tends to zero.

#prodef([Definition 6.12.])[
  (Regular collars and permitted exterior data).  A regular radial collar is a full tile annulus or a union of a bounded number of tile sectors separated by straight coordinate walls. The sector angles belong to the fixed finite list of quadrant, half-plane, three-quadrant, and slit geometries. Distinct banks and distinct corner incidences are kept distinct. Tile-level cuts specify its two radial sections. Designated wire intervals may run along the banks. Name every identified bank class that meets the collar, whether it crosses the whole collar or occupies only a partial bank interval, and suppose their total number is at most a fixed $J$. These classes are the named hubs of the collar; $J$ counts all of them, not just those meeting both radial sections.
  Exterior data are #emph[permitted] if they arise from finite FK graphs with positive odds and have the following planar attachment structure. The graph on either side meets the collar only at its own radial section and the named hubs. It preserves all ordinary collar incidences and designated wire portions, and has no other bank or interior attachment. It may induce any partition on that section together with the hubs, subject to the following residual-cap condition. In each of the four quotients obtained by imposing neither, either, or both side partitions, remove from the cap ledger every final class meeting a named hub. The remaining classes must be separate noncrossing caps on the two coordinated radial sections: place the sector strips side by side in angular order and reverse the inner boundary order, resolving coincident accesses in their separate fans. The two residual caps occupy the two separate boundary arcs of this drawing.
  When comparing two laws, the graph and deterministic wires on the remote side agree; the other, unknown side may induce any permitted partition. A rectangular bulk collar is an ordinary polygonal annulus of fixed shape buffering a box, with positive relative width and no internal wall. Local patches on a planar capped cylinder are permitted only when the specified disk or sector charts satisfy this same attachment and residual-cap contract.
] <disk:regular-collars>

#thm([Lemma 6.13.])[
  (The initial collar comparison).  #emph[In the geometries of Definition 59, collars of a sufficiently large fixed radius ratio give bounded reciprocal marginal densities on their remote side, uniformly in the permitted unknown-side data. The same holds in the opposite radial direction and for a fixed rectangular bulk collar.]
] <disk:initial-collars>

#proof[
  For a bulk collar this is Proposition 47, with polygonal cuts and ordinary buffers. For sectors, retain every named bank class as a hub, including every partial bank interval. In each of the four cross pressure masses entering the alternating partition-function identity, discard terms hitting a final hub class. Positive coverage and the singleton identity charge at most $J log t$ for these terms, as in Lemma 41. All cap classes absorbed into a hub are discarded with it. The residual-cap condition in Definition 59 supplies the separate noncrossing caps on the coordinated cuts in each quotient. This is the cap order needed by the clean comparison; the bound on $J$ alone would not supply it.
  Each complete clean sector is a tiled disk, and its blank actual radial crossing probability is arbitrarily small at sufficiently large fixed radius ratio, by Theorem 56. Their finite disjoint union has the same property by a union bound. The separate-cap and no-hit comparisons, followed by the alternating pressure identity, therefore bound all four residual masses. This is precisely the sector density argument, applied to the coordinated disjoint charts; adding back the discarded hub terms leaves a uniform bound. The mixed partition-function bound says that the relative weight of an exterior state changes by a bounded factor when the opposite cap changes. Summing over exterior states and normalizing proves the stated marginal comparison. Reversing radial order makes the same proof apply inward.
  If a chosen positive cap completion adds a fixed bounded number of further block identifications, each changes every configuration weight by either $1$ or $q^(- 1)$, and these additions change normalized densities by a bounded factor. Any additional bank class instead retained in the collar must be included in $J$ and satisfy the same attachment and residual-cap conditions. Thus the comparison does not cover an unbounded collection of partial bank classes or unlisted lateral attachments. ◻
]

===== 6.9.1 Searches and their physical blockers. <searches-and-their-physical-blockers.>

We use the physical face exploration of Lemma 35 in each tiled quadrilateral. Designate its end arcs as near and far, and keep the longitudinal flank faces separate. Start from the #emph[exterior] face of the chosen flank. An edge is queried only from a reached complementary face; the opposite face is entered only if the intervening tested-color physical bond is closed. In particular, interior faces adjacent to the starting flank are not seeded for free. The end cuts are impassable to this search. Fictitious exterior end spokes specify only the disk separation topology: they are neither physical path edges nor identifications in the FK law.

If an actual tested-color crossing exists, the search cannot reach the other flank. Exhaust its reached component and temporarily set the unqueried tested-color bonds closed. This does not enlarge the reached component, since every edge leaving it has already been queried and found open. The path/cut alternative therefore gives a crossing supported on measured open bonds. Select the simple frontier adjacent to the unsearched side by fixed tie breaks, orient it from the near cut to the far cut, and retain the segment after its last near-cut visit and before its first subsequent far-cut visit. Denote this measured actual path by $P$. Its opposite-side edge interiors and ordinary incidences remain unqueried. Temporary closure selects the witness and imposes no additional condition on the random state.

One can require a crossing to be proper, meaning that it has no other contact with its two end cuts. For this search, split the incidences at an end vertex into separate leaves in fan order, ignore travel along the end cut, and add fictitious outward terminal spokes. This changes the search drawing, not the random states or the FK partition. A simple trimmed physical witness gives the corresponding proper crossing in this auxiliary drawing, even if it touches a longitudinal wall or uses boundary bonds. At a shared wall incidence, an access from the unsearched side meets the witness before or at that incidence. All queries and physical paths remain in their original slot fans. Known open diagonals serving as cutters have ordinary half-tiles on their unqueried side; in the opposite color their new boundary spokes are dangling or dead. Thus cutting at a measured blocker gives free longitudinal boundary in that opposite color.

The shielding assertion is useful also in endpoint order. If a proper witness ends before a specified opening in the far end cut, a search from the witness’s side cannot discover a frontier crossing ending beyond that opening. Otherwise a reached complementary face incident to its last bond could be continued inside that tile to the end cut without meeting the witness. This contradicts separation by the witness, which has no earlier contact with that cut. These statements are statements in the split disk drawing, so they remain true with boundary touches and coincident bank images.

Every successful orientation or endpoint-clearance alternative used below is a union of leaves of its own deterministic edge exploration. On an individual leaf, delete the queried closed edges and contract the queried open components. Lemma 3 gives the exact FK law on the unqueried edges, with its induced planar partition. Bounds on those leaves are averaged before conditioning on any further success event. No FK law conditioned only on a union of successful leaves is asserted.

#thm([Proposition 6.14.])[
  (Actual routing and terminal attachments).  #emph[In a fixed regular patch with permitted planar exterior data, an actual crossing of either color along a cleared simple corridor between two short transverse cuts has probability bounded below by a positive constant. The connection is confined to that corridor and small prescribed endpoint neighborhoods. The conclusion is uniform when its geometry has uniform positive clearances.]
  #emph[A terminal may instead be a continuous wire interval of the tested color, an unwired flat wall interval, or a previously measured actual blocker with a uniformly clear tangent-disk approach. In the last case the blocker must be the only locally accessible obstruction from that approach, allowing further portions of the same labeled barrier; its ordinary unqueried incidences must be available up to the contacts. An attachment to a measured blocker is an actual contact with that path. An attachment to a wire requires just one actual wall contact.]
  #emph[Finitely many such attachments can be imposed simultaneously in the following layouts: disjoint branch corridors arriving at spaced points on a skinny joining tube; a four-terminal tree with two radial and two wall branches; a ring of cleared corridors; or a corridor winding once around a regular cylinder and returning to a distinct point of the same joining tube. These conclusions hold conditionally on the initial terminal exposures.]
] <prop:routing>

#proof[
  We prove the claims in an order that uses only the large-ratio collar comparison already available.
  #emph[Bulk templates and their gaps.] The square-crossing and clipped-template construction in the proof of the auxiliary contact lemma, Lemma 51, supplies the following finite collection of supports in a cleared corridor. Small squares carry actual crossings between tiny selected subarcs of two opposite sides, and clipped squares implement a right-angle bend. Their individual conditional probabilities are positive uniformly in planar exterior data. To recall why this is an actual-crossing input, the square path/cut alternative gives probability at least $1 \/ 2$ for one of a crossing and its complementary crossing. Duality, a grid symmetry, and bounded ordinary annular marginal comparison transfer the latter alternative to a crossing of the requested color. Splitting the two end sides into finitely many short intervals selects endpoint patches at a positive probability cost. Cropping a crossing gives the clipped templates. Transfers and conditional lower bounds use ordinary buffers around the whole support.
  Here are the placement features that will be needed. Approximate the cleared route by a simple axis-polygonal route at a fixed fine geometric scale, erase loops, and keep positive clearance after this perturbation. On a straight segment, pair a square template with its reflection so that the two endpoint-center transverse displacements cancel. Adjust the square side lengths to obtain the required axial advance. At a right-angle turn use a square clipped by a transverse diagonal and a reflected, traversal-reversed copy on the other side of that diagonal. The entry and exit strips can be narrower than the bend supports, so nonadjacent supports and their buffers are disjoint. Choose bend sizes first. Their endpoint displacements are then fixed; two independent axial segment adjustments absorb these displacements and all gap lengths. This gives a fixed finite number of templates before the final gap tolerances are chosen. Extend the first and last templates across the desired corridor cuts and trim their crossings there.
  Consecutive envelopes have tiny positive gaps between transverse end caps and still smaller endpoint tolerances. On the event that every template crosses, expose each extremal frontier from the same longitudinal side of the oriented route. The exposures use disjoint supports. Around the midpoint of a matching gap, and between radii much larger than its width and much smaller than the template size, the two measured blockers span an annulus in opposite open half-planes. Their inward endpoints may be prolonged across the innermost disk by fictitious spokes solely to specify their separation topology. The blockers themselves are the barriers throughout the annulus where the join lemma is applied.
  The annular component on the unsearched side has no measured incidence before it hits one of these blockers. Indeed an entry through an envelope’s unsearched flank is shielded by its frontier. An entry through its searched flank is not in this component: that flank has an exterior route to the other diameter ray without crossing the blocker. At a straight cap this route goes around its lateral edge. At a clipped bend, at the radii in question at most one lateral corner intrudes; the cap and that side bound a wedge of fixed positive angle, and one exits around its searched side. For a narrow normal strip one exits around the corresponding parallel side. The two full barrier spans separate the two rays, so none of these searched-side entries is accessible from the focal component. This also excludes folded measured bays. Bounded tile-rounding errors are absorbed in the strict half-plane margins and a fixed enlargement of the radial band. These are the hypotheses of Lemma 58.
  Let $S$ be the intersection of the template successes. Their disjoint buffer estimates give $bb(P) \( S \) > 0$. The successful leaves already determine $S$. On every such leaf the probability of failure of any specified actual join tends to zero as the gap ratio tends to infinity, uniformly in the permitted remaining data. A finite union bound thus joins the entire chain with positive conditional probability. Each join is physical and confined to its prescribed patch. This proves bulk corridor crossing without making any connection through an external wire.
  #emph[A wire or a measured tangent blocker.] For a straight wire interval, terminate a thin bulk strip at a small positive normal distance from the wall and expose its frontier on a compatible side. The wall and this blocker are the two barriers for the same confined-join argument. The resulting actual path stops at one contact of the specified wire.
  More generally let a tangent disk of radius $c' > 0$ touch the measured blocker at $z$, with the stated ordinary cleared approach. Terminate the incoming branch at distance $epsilon.alt$ along the inward normal, using a still thinner straight normal strip in a patch of radius $s'$. Choose
  #[#set math.equation(numbering: n => "(6.17)")
   $ \( s' \)^2 \/ c' lt.double epsilon.alt lt.double s' lt.double c' . $ <disk:tangent-scales>]
  In coordinates tangent at $z$, disk exclusion confines every accessible part of the old blocker to a half-plane enlarged by $O \( \( s' \)^2 \/ c' \)$. The incoming strip is on the other side of the middle diameter with margin of order $epsilon.alt$. Between an inner radius larger than the gap and an outer radius smaller than $s'$, both barriers span the annulus in opposite half-planes. Only the specified blocker label is accessible at the old wall. Applying the confined join therefore makes an actual attachment to the measured path, with failure arbitrarily small. The hierarchy in (6.17) is chosen before the mesh limit. Cleared routes and tangent normals in a compact family admit uniform choices, by a finite pixel approximation of their interior routes, or by taking a position limit and retaining strict sub-clearances.
  #emph[A free-wall seed.] Consider first a blank tested-color law in a flat half-box. A small central wall interval has positive probability of an actual arm to the opposite line. To see this, separately wire that interval and the opposite line. Lemma 51 gives a positive two-terminal probability. With only these two wires, network connection is equivalent to an actual path between the two sets: erase all visits to an end wire before the last departure and after the first arrival. The no-hit comparison of Lemma 26 makes the blank actual probability at least this pure probability. Denote a resulting lower bound by $p_0 > 0$.
  Put a protected wall rectangle around the central interval, with a fixed positive lateral margin $a$. An arm going to the opposite line either reaches height $eta$ within that rectangle or exits it laterally while staying below height $eta$. Choose many disjoint boxes of dimensions comparable to $eta$ along either possible lateral exit route. In each, the opposite color, which is wired on this wall, has an actual transverse arm from the wall to above height $eta$ with conditional probability at least $c_1 > 0$. This is the already proved wired-wall construction in a fixed shape. These arms block the tested-color lateral excursion. With at least $c_2 a \/ eta - O \( 1 \)$ tests, its probability is at most
  $ 2 \( 1 - c_1 \)^(c_2 a \/ eta - O \( 1 \)) . $
  Choose $eta > 0$ so this is less than $p_0 \/ 2$. The protected actual wall-to-height event then has probability at least $p_0 \/ 2$.
  Choose the wall-seed scales small compared with the available straight wall patch. The protected rectangle can then be surrounded by a half-sector collar of the sufficiently large fixed ratio in Lemma 60, inside the original flat patch. This transfers its positive probability to every permitted exterior with the same free tested-color wall. Expose an extremal seed inside its protected rectangle, stopping at a fixed height below the height just obtained. The region above that cut is untouched. Its endpoint determines an incoming approach from that region; the branch is chosen after observing the seed. At the much smaller attachment scale the cut is a straight transverse cap, including the one-corner wedge case if the endpoint lies at a lateral corner. Choosing the compatible exposed side of the incoming branch gives the gap geometry already checked. A confined join attaches to the physical seed, which in turn is physically connected to the unwired wall. Notice that this argument has used large-ratio sector comparison only. Thin-ratio comparison will be deduced after the physical screens have been constructed.
  #emph[Traversals in one physical component.] Two attachment searches can select different traversals of the same corridor. We therefore need the following claim before combining the attachments. Let $C$ be a branch corridor or joining tube with whole end cuts $A_C \, B_C$, let $E_C$ be its actual traversal event, and let $U_C$ be the event that all its proper actual traversals lie in one physical component supported in $C$. Put
  $ alpha_C = frac(1 + max { "diam" A_C \, "diam" B_C }, "dist" \( A_C \, B_C \)) \, $
  with lengths in tile units. The claim is
  $ bb(P) \( U_C^c ∩ E_C \) lt.eq o \( 1 \) bb(P) \( E_C \) #h(2em) upright("as ") alpha_C arrow.r 0 \, $
  uniformly in permitted exterior data, including fixed states in disjoint supports. Narrow end cuts and then fine mesh make $alpha_C$ small in our fixed layout.
  To prove the claim, expose the two extreme frontiers toward the middle. Their successful leaves determine $E_C$. Every other traversal disconnected from them must lie between them, since a traversal farther toward either searched side would shield the corresponding measured frontier from that search. If the frontiers are disjoint, the disk between them has unqueried interior and free opposite-color longitudinal flanks. Its possible extra identifications are planar joint end caps. Failure of an actual join between the frontiers in this disk forces an actual opposite-color traversal between its end arcs. The latter has probability $o \( 1 \)$, uniformly on these leaves, by Theorem 56, because its two ends are subarcs of $A_C \, B_C$ and have separation ratio tending to infinity with $alpha_C^(- 1)$. A transverse actual join intersects every proper traversal between the two frontiers. If the frontiers intersect, shielding already excludes a traversal disconnected from both. Boundary contacts are separated in their own fans; the half-tile convention along a known open cutter makes precisely the free opposite-color boundary used in this application. The failure bound holds on each successful pair of frontier leaves. Averaging those leaves proves the displayed relative estimate.
  #emph[Simultaneous attachments.] Place a long skinny joining tube of half-width $w$ in the clear middle. Draw nonintersecting buffered branch corridors to spaced points along its length. Near a top arrival a branch stays above transverse coordinate $2 w$ and ends in a thin normal strip; bottom arrivals are reflected. Their distant ends have the already specified terminal geometry. All corridor and tube success events have jointly positive probability by successive conditional lower bounds. Denote their intersection again by $S$. We will bound physical failures conditional on $S$ by first obtaining uniform bounds on exploration leaves that decide $S$ while leaving the relevant join region unqueried.
  For corridor $j$ let $U_j$ be the physical event that all its proper traversals belong to one component within it. For attachment $i$ let $J_i$ be the physical event that a local path joins some successful traversal in each of its two incident supports, or attaches one such traversal to the indicated terminal blocker or wall contact. To bound $J_i^c$, explore just the pertinent frontiers from the sides suitable for that attachment and fix the other disjoint support states away from its patch. The fixed outside states decide the successes of the other supports; the frontier leaves decide those of the two incident supports. Thus each retained combined record decides $S$, and its unqueried join region has the ordinary conditional FK law. At a top tube arrival, search the tube from its bottom lip. Its whole frontier is below height $w$. Center the separating horizontal diameter in the gap above it; both focal directions above the tube are available, and select the one exposed by the branch search. The tube has two continuations with its same label, as allowed in Lemma 58. The previous cap and tangent arguments handle the other terminals. Hence for any prescribed $epsilon > 0$ the fixed geometries can be chosen so that the failure bound is at most $epsilon$ on every retained record. The component claim gives the same conclusion for $U_j^c$ by using that corridor’s two frontiers and fixing the other supports. Averaging each experiment separately gives
  $ bb(P) \( J_i^c ∩ S \) lt.eq epsilon bb(P) \( S \) \, #h(2em) bb(P) \( U_j^c ∩ S \) lt.eq epsilon bb(P) \( S \) \, $
  and hence
  #[#set math.equation(numbering: n => "(6.18)")
   $ bb(P) \( J_i^c divides S \) lt.eq epsilon \, #h(2em) bb(P) \( U_j^c divides S \) lt.eq epsilon . $ <disk:conditional-joins>]
  For $k$ attachments and $m$ corridors it follows that
  #[#set math.equation(numbering: n => "(6.19)")
   $ bb(P) (⋂_(i = 1)^k J_i ∩ ⋂_(j = 1)^m U_j thin mid(bar.v) thin S) gt.eq 1 - \( k + m \) epsilon . $ <disk:physical-union-bound>]
  On this event all the selected attachments belong to the intended physical components. Different attachments may require different orientations of the same exploration: the estimates are for the physical events $J_i$, so their explorations need not coexist. The error bound remains $epsilon$ even when $bb(P) \( S \)$ is small.
  For clarity, choose the fixed finite layout and its mutual clearances first, then the join patches and required radial ratios, then the narrow strip and endpoint tolerances, and finally the mesh. At a tangent terminal shrink its patch further to satisfy (6.17). With $epsilon < 1 \/ \( 2 \( k + m \) \)$, (6.19) proves the desired positive probability. All its paths use just the corridors, their small join neighborhoods, and the measured terminal blockers.
  A four-terminal tree is obtained by two opposite-side wall branches at spaced central tube positions and two radial branches at its longitudinal portions. A ring uses a finite cyclic chain of corridors. On a cylinder choose a simple winding corridor with separated ends at two distinct tube positions. Its actual traversal, joined at both ends to the connected tube, gives a closed walk with nonzero winding number: the tube return lies in a disk and the corridor winds once. Deleting contractible loops from that walk leaves a noncontractible actual cycle. This finishes all the asserted layouts. ◻
]

#thm([Proposition 6.15.])[
  (Actual screens).  #emph[For each fixed regular collar geometry, either color has an actual wall-to-wall screen in a sector, or an actual surrounding circuit in a full annulus, with a uniformly positive conditional probability under permitted exterior data. The paths remain in a prescribed middle subcollar and meet every designated continuous through wire of the tested color when those are present. The statement includes straight walls, quadrant and reentrant corners, slit tips, and differing wire designations on the banks near a flip. Contacts are chosen on straight bank patches separated from the tip or corner apex. Different colors in tile-disjoint sectors can be required together.]
] <prop:screens>

#proof[
  Choose bank patches away from the finitely many apexes and draw a cleared transverse route in each sector. Use a wire contact or a free-wall seed according to the color designated on that bank. Proposition 61 constructs the entire actual screen. For an annulus, use the ring layout around its inner boundary; its closed actual walk contains a surrounding simple circuit. For a finite collection of disjoint sectors impose the specified screens successively, conditioning on the other support states; each retained law still has the permitted planar exterior data. The product of the finitely many positive lower bounds is positive. Distinct slit banks are treated in their own charts, so physical coincidence does not join their incidences. No path in this construction uses a wire as an edge. ◻
]

#thm([Lemma 6.16.])[
  (Fixed-ratio sector comparison).  #emph[Lemma 60 holds also for a fixed smaller nontrivial sector ratio, with a constant depending on that ratio and the fixed geometry.]
] <disk:thin-collars>

#proof[
  First consider the clean disjoint union of sectors, without bank hubs. In its blank tested-color law, an actual opposite-color screen in each component blocks radial traversal. Under duality the opposite color has the requisite wired wall conditions, and Proposition 62 applies conditionally. Thus the blank actual radial probability $b$ satisfies $b lt.eq 1 - eta_0$ for some $eta_0 > 0$.
  The blank cross pressure mass $Delta$ is bounded as well. Cover one radial cut by finitely many small interval patches, of diameter tiny compared with the collar depth. For a patch in one component the pure connection probability to the other entire cut is arbitrarily small by Theorem 54; all other components attach only to the latter full wire and do not change this test. The one-sided density estimate bounds the pressure mass for this pair. Positive coverage and the finite patch cover bound $Delta$ for the full two cuts. The cofacial one-sided comparison gives the corresponding bound after either single cap is imposed.
  Write $Z_(a b)$ for the four cap choices, and $Delta_(a b)$ for their cross masses. The alternating identity reads
  $ log frac(Z_11 Z_00, Z_10 Z_01) = Delta_10 + Delta_01 - Delta_00 - Delta_11 . $
  The blank no-hit mixed-gain bound, using $b lt.eq 1 - eta_0$, supplies a lower bound for the logarithm. Nonnegativity and the three bounds just proved therefore bound $Delta_11$ and the mixed logarithm in both directions. This proves bounded reciprocal densities for the clean union. Discarding all at most $J$ named bank-hub classes and retaining the coordinated residual noncrossing caps, exactly as in Lemma 60, proves the general statement. The proof uses the physical screens only here, after their construction; the wall seeds used only the earlier large-ratio comparison. ◻
]

=== 6.10 Relative localization through restricted collars <relative-localization-through-restricted-collars>

Bounded density comparison preserves a positive probability but does not make distant boundary data negligible. A screen that meets every possible through wire removes that dependence altogether on a fixed positive part of the collar law. Repeating this common part, and retaining one final bounded comparison, gives a relative error for every nonnegative observable, including rare events.

#thm([Proposition 6.17.])[
  (Relative collar comparison).  #emph[Consider two finite positive FK laws at the fixed $q$, with ordinary collar bonds, whose graphs and deterministic wires agree on the remote side of a sequence of regular collars and whose unknown-side data are permitted in the sense of Definition 59. Require each collar to have one of the following geometries:]
  + #emph[a full annulus with no named bank hubs, or one sector whose only bank attachments are continuous primal wire portions along its two side rays, crossing the collar and each met by its primal wall-to-wall screen;]
  + #emph[two sectors, with only such screen-met continuous primal wire portions on both side rays of one sector, no bank or hub attachment in the other, and no direct contact between the sectors inside the collar. Side graphs may join contacts of the two sectors only through the corresponding permitted radial cap.]
  #emph[After $m$ further collars of a sufficiently large fixed ratio and one final comparison collar, the expectations of any fixed nonnegative function $f$ supported beyond them satisfy, for fixed $C gt.eq 1$ and $0 < c < 1$, the two inequalities 
#[#set math.equation(numbering: n => "(6.20)")
 $ bb(E)_1 f & lt.eq #scale(x: 120%, y: 120%)[\[] 1 + \( C - 1 \) \( 1 - c \)^m #scale(x: 120%, y: 120%)[\]] bb(E)_2 f \,\
bb(E)_2 f & lt.eq #scale(x: 120%, y: 120%)[\[] 1 + \( C - 1 \) \( 1 - c \)^m #scale(x: 120%, y: 120%)[\]] bb(E)_1 f . $ <disk:relative-density>]

 They are understood in the extended nonnegative reals. For finite positive expectations they imply $bb(E)_1 f \/ bb(E)_2 f = 1 + O \( \( 1 - c \)^m \)$, and the expectations vanish together. The constants are independent of the far graph, the unknown-side partition, and $f$. The same conclusion holds in the reverse radial direction and after a positive finite tilt supported on the unknown side. In particular, unknown-side changes may join or separate the designated wire portions. The contraction requires the enumerated screen-met attachments; the general bound on $J$ in Definition 59 alone is not sufficient for it.]
] <prop:relative-collars>

#proof[
  We give the finite FK comparison and coupling argument. It also explains the restrictions on the geometry. Throughout a comparison, keep the entire common graph beyond the current section fixed, including its far boundary data. Collar marginals can depend on this remote graph; all constants below are uniform in that dependence.
  Split each designated wire transversely at a section, retaining its connections separately on either side and one representative of the possible through connection. There are only boundedly many such representatives. The unknown graph then enters the common graph as a permitted partition $xi$ on that section, with all the common deterministic wire pieces included. Any bounded extra split or merger has weight ratio between $min \( q \, q^(- 1) \)$ and $max \( q \, q^(- 1) \)$ per operation. The bounded collar comparison therefore applies equally to this representation.
  Use a sufficiently large fixed ratio, for example enlarge a factor $256$ further if needed, to leave two buffered subcollars at every step. Fix a reference permitted partition. The initial comparison subcollar makes the marginal $mu_xi$ on the second subcollar dominate $K^(- 1) mu_(*)$ for every $xi$, with a constant $K$ and the same reference marginal $mu_(*)$. This is a pointwise inequality of finite measures on the subcollar edge configurations.
  Inside that second subcollar, in case (i) require a primal circuit, or a primal wall-to-wall screen meeting every named primal bank wire. In case (ii) require a primal screen in the wired sector and a dual screen in the other. Proposition 62 gives a reference probability at least $p_(*) > 0$ for this event $G$. On $G$, the partition transmitted to the next section is determined by the common subcollar configuration alone. Indeed every connection from the unknown side to the remote side in a screened primal component must meet a connected primal screen. All named bank wires there already meet that same screen. Connections through the unknown region can therefore make no further distinction among its remote contacts. In the unwired second sector the dual screen allows no actual primal crossing, and there is no bank or hub attachment to bypass it. The absence of other intersector contacts is used at exactly this point.
  Any cluster of the common subcollar meeting the next section but avoiding the transmitting screen is therefore unable to acquire an extra connection through the unknown region. Components wholly on the exposed side contribute factors independent of all remote states and cancel when the conditional law is normalized. By the finite domain Markov identity, the entire conditional remote law thus depends only on this transmitted partition.
  For completeness, screens can be discovered without querying edges strictly beyond them. Explore complementary-color components from the unknown-facing section. If the screen exists, the search stops short of the remote section; otherwise the disk path/cut alternative, or its annular version, would give a complementary crossing. The measured frontier consequently contains a blocking physical path or circuit. Perform this search in the buffered middle and reverse colors in the unwired sector. Thus the same transmitted-partition description applies either by revealing the whole fixed subcollar or by stopping at its measured screens.
  To specify the transition precisely, reveal the tile states up to the next section and let $eta$ be the partition they induce there from the exposed side, together with the common deterministic wire pieces. The planar drawing and the absence of unlisted lateral attachments keep $eta$ in the permitted class. Conditional on the exposed states, the law of the fixed remote graph is the FK law with partition $eta$, by Lemma 3. Thus, for a remote observable $f$, its conditional expectation is a function $g \( eta \)$ of that partition. On the screen event $G$, the preceding separation argument shows that $eta$ is determined by the second subcollar configuration alone and is independent of the entering partition $xi$. Away from $G$ it may also depend on the first subcollar and on $xi$.
  The measure
  $ lambda = K^(- 1) upright(bold(1))_G mu_(*) $
  is a common submeasure of all second-subcollar laws and has mass at least $p_(*) \/ K$. On its support the just-defined map to $eta$ is common to all entering partitions. Its pushforward is therefore a common submeasure $nu$ of the laws $L_xi$ of the induced next partition, with the remote graph still held fixed. These laws are the transition kernels used below. Choose a fixed $c > 0$ not exceeding $p_(*) \/ K$, and reduce $nu$ to mass $c$ if necessary. Every such kernel has the form
  #[#set math.equation(numbering: n => "(6.21)")
   $ L_xi = c hat(nu) + \( 1 - c \) tilde(L)_xi \, $ <disk:collar-minorization>]
  where $hat(nu)$ is the same probability measure for all $xi$. This is the common positive part of a coupling. No stochastic monotonicity of FK boundary conditions is required.
  For a bounded nonnegative $f$, make the relative-error deduction explicit. Number the sections $0 \, 1 \, dots.h \, m$ toward the support of $f$ and reserve the final bounded-comparison collar beyond section $m$. Let $\[ a_j \, b_j \]$ be the range of conditional expectations of $f$ over all permitted partitions at section $j$, including the common remaining graph. Conditioning on the next section gives
  $ \[ a_j \, b_j \] subset.eq \[ a_(j + 1) \, b_(j + 1) \] \, #h(2em) b_j - a_j lt.eq \( 1 - c \) \( b_(j + 1) - a_(j + 1) \) \, $
  where the second assertion follows from (6.21). The last comparison collar gives $b_m lt.eq C a_m$. If $a_m = 0$, then $b_m = 0$ and all expectations vanish. Otherwise $a_0 gt.eq a_m > 0$ and
  $ frac(b_0 - a_0, a_0) lt.eq \( 1 - c \)^m frac(b_m - a_m, a_m) lt.eq \( C - 1 \) \( 1 - c \)^m . $
  It follows that either expectation is at most $\[ 1 + \( C - 1 \) \( 1 - c \)^m \]$ times the other. This proves (6.20) for bounded $f$. For a general nonnegative $f$, apply those two inequalities to $f and M$ and let $M$ increase by monotone convergence. No quotient of infinite expectations is used.
  The same proof works inward, using the reversed collar comparison and the same separation by actual screens. A positive modification on the unknown side merely changes the mixture over its induced partitions: every member has the same common submeasure and lies in the same interval $\[ a_0 \, b_0 \]$. Integration over that mixture proves the assertion about tilts. In particular no fixed connection through a gap has to be retained when the gap belongs to the unknown region. In case (ii) this is why both colors of screen, rather than only the screen meeting the primal wires, are required. ◻
]

=== 6.11 Relative arm splices and an opposite-arm loss <relative-arm-splices-and-an-opposite-arm-loss>

The remaining construction preserves a specified arm event while joining its truncated pieces through a fresh window. Its probability must be compared with that of the original arm, which may be very small. A finite cover by one-sided exploration successes supplies this relative comparison; the reconstruction also inserts a transverse screen when an opposite-color radial arm must be excluded.

#thm([Lemma 6.18.])[
  (A flat splice and strict opposite-arm cost).  #emph[Let $A$ require an actual radial traversal of a specified color in a long regular half-annular region whose two longitudinal walls carry the continuous portions of a flat mixed-color boundary condition. The start is a full inner cut or a specified flip-gap vertex and the target is a full outer cut. Choose mutually separated marker bands, with broad fixed-proportion splice windows on both sides of each marker. Let $B_i$ require an actual opposite-color radial traversal of marker $i$. There is $c > 0$, depending only on the fixed window shapes, such that 
#[#set math.equation(numbering: n => "(6.22)")
 $ bb(P) (A ∩ ⋂_(i = 1)^k B_i ∩ E) lt.eq \( 1 - c \)^k bb(P) \( A ∩ E \) $ <disk:opposite-arm-loss>]

 whenever the extra requirement $E$ is supported outside those windows. The estimate is uniform under permitted exterior conditioning. A separated short arm can be included in $E$.]
  #emph[For the splice conclusion, let $T$ be the joint event of two same-color actual arms, each supported in one of the two disjoint side domains from its prescribed source to a full cut on its side of a fixed-ratio window. Assume the same regular half-annular geometry and fixed positive buffers as above, with two spaced openings away from the flanks on each cut. Each source lies on the opposite radial end of its side domain; a flip-gap tip is allowed as an inner end. In units of the window scale, the distance from the source to its window-facing cut is bounded below by a fixed positive constant, and a side band of fixed positive depth adjoining that cut is free of previously fixed far data. If $A_(upright("join"))$ is the event that these sources are joined by an actual path in the union of the side domains and the window, then $bb(P) \( A_(upright("join")) \) gt.eq c bb(P) \( T \)$, uniformly under permitted exterior conditioning. A single arm can be extended through a further fixed-factor collar with a fixed relative probability. Iteration gives polynomial arm lower bounds in these regular geometries, and opposite-color screens give a strict power upper bound for one-arm probabilities.]
] <lem:relative-arm>

#proof[
  Fix one marker, write $B$ for its opposite-color traversal, and condition on the edge states $F$ outside its broad window. Other marker constraints and $E$ are thereby decided. Trim any witness for $A$ at two cuts lying just inside the window on its respective sides of the central marker. It gives actual paths from the two required sources to these cuts in disjoint side domains. A source can include a previously measured physical continuation through $F$, but no search follows a wire identification as a path edge.
  At each near cut choose two small, spaced opening intervals away from the flanks and corners. Orient each witness toward its target cut and retain the portion after its last source-set visit and before its first subsequent target-cut visit. Every resulting endpoint is a fixed positive distance to one side of at least one opening. Run a complementary search from that endpoint’s side, treating previously fixed far states as known data. The shielding argument given before Proposition 61 makes its measured frontier end on the same side of the selected opening. In particular that opening is on its unqueried side with a uniform margin. There are only a bounded number of choices of opening and orientation at each end. Let $T_1 \, dots.h \, T_N$ be the corresponding two-search success alternatives. They satisfy
  #[#set math.equation(numbering: n => "(6.23)")
   $ A subset.eq union.big_(i = 1)^N T_i $ <disk:truncated-cover>]
  for each fixed $F$, with $N$ independent of mesh and scale. On each successful leaf retain the simple actual frontier $P$ connected physically back to its required source. Each $T_i$ is a union of leaves of its own pair of searches, performed in the two disjoint side domains. The uninspected regions have their usual conditional FK laws on individual leaves; we do not condition those laws on the union in (6.23).
  We verify the uniform tangent access needed to reconstruct between the two frontiers. From the empty central region enter a chosen opening, then move a small fixed radial distance into its side band and along a level transversal toward the searched flank. This route must meet $P$: the source-to-cut crosscut separates the opening side from that flank. Start at a fixed clear point in the central region, and choose a clearing radius $a$ smaller than its boundary distance, the opening separation, and all side-band margins. Move a center from that point along the route until its first distance-$a$ approach to $P$. The resulting disk is empty and tangent to $P$. On entering the opening its endpoint is excluded by the angular margin; along the transverse portion it is excluded by the radial depth. Both cuts, all fixed far data, and the other flank stay at larger fixed distances. Any approachable point of the searched flank is screened by $P$, or is itself a contact with $P$. Hence there is no other locally accessible wall before the tangent contact. The unqueried incidences up to it are ordinary. Both endpoints of $P$ lie outside a fixed enlargement of the contact neighborhood by the cut margins, so both branches of $P$ continue out of it. Folds behind $P$ do not affect this disk. Tile rounding is absorbed by decreasing the chosen fixed margins. This verifies all the measured-terminal hypotheses of Proposition 61, uniformly in the successful leaves. Perform the same construction at the other end.
  In the clear center of the marker put a skinny tube. Two separated branches go to the tangent approaches just obtained; two further branches go to the two walls, with their attachment sites spaced on opposite tube sides. Use a wired contact or the free-wall seed as required by each wall’s tested-color designation. Seed rectangles are disjoint protected patches, exposed first. The radial branch detours remain in their respective radial neighborhoods, while the wall-to-wall portion remains wholly inside the marker. The four-terminal layout of Proposition 61 consequently has a uniform positive conditional probability $c_0$ on every successful leaf. It both joins the two physically source-connected frontiers, preserving $A$, and contains a same-color wall-to-wall screen inside the marker. The screen excludes $B$ by planar path/cut separation.
  Here is the relative, rather than merely absolute, estimate. Integration over the leaves of any fixed alternative gives
  #[#set math.equation(numbering: n => "(6.24)")
   $ bb(P) \( A ∩ B^c divides F \) gt.eq c_0 bb(P) \( T_i divides F \) #h(2em) \( 1 lt.eq i lt.eq N \) . $ <disk:relative-reconstruction>]
  Take the largest of these right sides and use (6.23). It follows that
  $ bb(P) \( A ∩ B^c divides F \) gt.eq c_0 / N bb(P) \( A divides F \) \, #h(2em) bb(P) \( A ∩ B divides F \) lt.eq (1 - c_0 / N) bb(P) \( A divides F \) . $
  Thus truncated success is used as an upper cover of the original arm event; it need not already imply that event. Averaging in $F$ while retaining the exterior requirements and iterating over the separated windows proves (6.22) with $c = c_0 \/ N$.
  For the two-arm event $T$ in the statement, use the same opening and tangent constructions and join their two radial branches in the clear middle. No transverse screen is required. The two-success alternatives cover the separately required arms, and the identical bounded-union calculation gives the fixed relative probability. For extension of a single arm use one truncated search and one new outer terminal. The constants are uniform in the fixed rescaled geometry. Starting at a bounded number of mesh steps, a specified finite physical path has a positive conditional probability depending only on that bound and the fixed $q$. Multiplying a fixed positive extension factor over $O \( log \( R \/ r \) \)$ collars gives a polynomial lower bound. For an upper bound, separated fixed-ratio bands have conditional probability bounded below of an actual opposite-color screen by Proposition 62. An actual arm avoids every such screen. There are at least $a log \( R \/ r \) - b$ tests for fixed $a > 0$ and $b < oo$, so successive conditioning gives an upper bound $\( 1 - c' \)^(a log \( R \/ r \) - b) lt.eq C \( r \/ R \)^(c'')$ for some $c'' > 0$. These estimates require no independence of the successive bands. ◻
]

The cylinder application keeps a short arm near a boundary mark and a separate long arm farther out. Small conditioned endpoint boxes lie in the gap between them. Comparing this joint two-piece event across the boxes’ buffers avoids conditioning on a rare completed arm. A fresh splice then crosses the gap and attaches the arm to a winding cycle. The opposite-color marker windows are placed along the long piece, away from all conditioned boxes and both splice constructions.

#thm([Corollary 6.19.])[
  (The grouped cylinder splice).  #emph[Let $cal(C)$ be a finite tiled cylinder of circumference comparable to $n$, with finite positive FK cap graphs drawn planarly at its rims. Its bottom has a flat mixed-color boundary near a specified flip-gap vertex $s$, and a second marked bottom point $t$ at distance comparable to $n$. All tiles in the following charts are ordinary. Fix their shape and buffer constants first, then take $n \/ r$ sufficiently large and $r$ sufficiently large in tile units.]
  #emph[There are finitely many endpoint boxes in the bulk near $s$, with distances from $s$, depths from the bottom, and mutual spacings between fixed positive multiples of $r$. Their radii are at most $delta r$, where $delta > 0$ is fixed sufficiently small. Each box has a disjoint ordinary bulk-annular buffer, of fixed relative width, within the scale-$r$ half-disk. Choose $c_0 > 0$ and $C_0 < oo$ so that these buffers lie strictly between radii $c_0 r$ and $C_0 r$ about $s$, with fixed positive margins. Their complement in this gap contains the clear two-arm splice layout of Lemma 65.]
  #emph[Choose fixed $0 < c_1 < c_2$ so that the $s$-centered half-disk of radius $c_2 n$ is an injective flat cylinder chart. The half-sector collar between its tile-level cuts at $c_1 n$ and $c_2 n$ has a sufficiently large fixed ratio for Lemma 60. The $t$ box, of radius at most $delta n$, and the remote middle region lie outside the $c_2 n$ chart with positive $n$-scale margins. The attached graphs at this chart and at every endpoint buffer satisfy Definition 59, with a fixed bound on all named bank classes and its residual-cap condition. In particular the graph outside the $s$ chart attaches only at its outer radial cut and those named hubs. A regular bulk window before the $t$ box and the middle contains a joining tube and a cleared corridor winding once between two distinct tube positions, as in Proposition 61. For each of two spaced flat openings on the $c_1 n$ target cut, a cleared branch joins its outward ordinary neighborhood to the tube. The branch and winding buffers have fixed positive $n$-scale clearances from the conditioned regions and satisfy the permitted local-chart contract.]
  #emph[Let $cal(D)$ specify the edge states in the endpoint boxes, the $t$ box, and the remote middle; consider any feasible value of these data. Let $R_(upright("arm"))$ be the intersection of a short actual gap arm from $s$ to radius $c_0 r$ and a separate same-color actual radial traversal from radius $C_0 r$ to radius $c_1 n$, both in the flat half-disk chart. Their supports avoid all the endpoint buffers. Choose a finite positive FK reference cap law that agrees with the cylinder law on the graph, odds, and deterministic wall portions through radius $c_2 n$, including the endpoint buffers, and whose exterior at that cut is permitted. Let $A_(upright("ref"))$ be its full actual gap arm from $s$ to a fixed full cutoff of radius comparable to $n$ and strictly beyond $c_1 n$, with a fixed buffer. Put 
$ p_(upright("ref")) := bb(P)_(upright("ref")) \( A_(upright("ref")) \) . $

 The cutoff separates $s$ from the outer continuation of the reference chart, so trimming gives $A_(upright("ref")) subset.eq R_(upright("arm"))$. Let $E$ require an actual arm from $s$ joined to a noncontractible actual cycle in the stated bulk window. There is $c > 0$ such that 
#[#set math.equation(numbering: n => "(6.25)")
 $ bb(P) \( E divides cal(D) \) gt.eq c bb(P) \( R_(upright("arm")) divides cal(D) \) gt.eq c^2 p_(upright("ref")) . $ <disk:grouped-cycle-lower>]

 For $k$ mutually separated opposite-color marker-traversal requirements $B_1 \, dots.h \, B_k$, with their full splice windows between radii $2 C_0 r$ and $c_1 n \/ 2$, one also has 
#[#set math.equation(numbering: n => "(6.26)")
 $ bb(P) (R_(upright("arm")) ∩ ⋂_(j = 1)^k B_j thin mid(bar.v) thin cal(D)) lt.eq C \( 1 - c \)^k bb(P) \( R_(upright("arm")) divides cal(D) \) . $ <disk:grouped-marker-upper>]

 Here $C = 1$ is possible when every listed marker has its full window; the constant permits omission of boundedly many end markers. The constants depend on the fixed buffer choices and reference cutoff, but not on $r \, n \, k$ or the values of $cal(D)$.]
] <disk:grouped-cylinder>

#proof[
  Write $cal(D)_(upright("out"))$ for just the $t$-box and middle data. First remove the conditioning in the endpoint boxes one at a time. Each disjoint bulk-annular buffer separates that box from the entire support of $upright(bold(1))_(R_(upright("arm")))$. The inward or outward bounded comparison of Lemma 60, while holding all other data fixed, compares a specified box state with the mixture over its states. The number of boxes is fixed, so
  $ bb(P) \( R_(upright("arm")) divides cal(D) \) gt.eq c'_0 bb(P) \( R_(upright("arm")) divides cal(D)_(upright("out")) \) . $
  Next apply that lemma inward across the $s$-centered half-sector between $c_1 n$ and $c_2 n$. The remaining cylinder law and the reference law agree on its inner side, including the now unconditioned endpoint boxes. The $t$ and middle states change only its permitted outer partition, with every bank class included in the named bound. Consequently
  $ bb(P) \( R_(upright("arm")) divides cal(D) \) gt.eq c bb(P)_(upright("ref")) \( R_(upright("arm")) \) gt.eq c bb(P)_(upright("ref")) \( A_(upright("ref")) \) = c p_(upright("ref")) . $
  Both comparisons use the single joint observable $upright(bold(1))_(R_(upright("arm")))$. In the fixed-ratio gap about scale $r$, these requirements force the two truncated successes used in the splice proof. The finitely many small separated endpoint patches can be avoided by disjoint interior bulk routes with fixed rescaled clearance; take the patch radii small before fixing these routes. Apply the two-arm splice and its bounded-alternative relative deduction. This constructs the extended physical arm with a fixed fraction of the probability of $R_(upright("arm"))$.
  Search this extended-arm event afresh at the $c_1 n$ target cut, using its two stated openings. The one-sided truncated search gives a frontier with an untouched opening and tangent approach exactly as in Lemma 65. Use that opening’s cleared branch to attach the frontier to the joining tube, then use the stated corridor winding between its two tube positions. The winding layout of Proposition 61 supplies an actual noncontractible cycle in the same actual component as the arm, with a uniform conditional probability on each successful leaf. The truncated cover argument again turns this into a relative lower bound for the extended-arm event. Combining the two fixed losses gives the first inequality of (6.25).
  Choose a fixed large spacing ratio for the intermediate markers, leaving their splice windows disjoint and separated from the two endpoint constructions. A maximal regularly spaced family has size proportional to $log \( n \/ r \)$ up to a bounded additive error. Apply (6.22) to the outer radial traversal appearing in $R_(upright("arm"))$, retaining its separated short gap arm, $cal(D)$, and all previously decided marker requirements in the exterior conditioning. The marker windows lie strictly inside this outer traversal domain. This proves (6.26) directly for $R_(upright("arm"))$; it does not require conditioning on the subsequent successful extension or cycle construction. ◻
]

== 7 Passage moments and angular transfer <sec:angular>

The actual-path disk estimate of Theorem 56 first gives all exponential moments for raw passages. These moments control local nest weights and yield a strict cost gap at a flat change of wire color, at the fixed target parameter $0 < q < 1$.

The second part isolates two angular decay powers in finite-circle transfer matrices. This calculation is valid throughout $0 < q < 4$ and uses no geometric probability estimate or infinite-volume law. Its physical interpretation, together with the nest costs, will supply the current and charge estimates in Section 8.

=== 7.1 Raw passage moments <raw-passage-moments>

The estimates in this subsection concern the finite switch drawing: raw strands follow switches and stop at wall ports. In particular, neither a strand nor an actual crossing may use an exterior identification as an edge. All conditional laws below are obtained by fixing exterior states in one of the regular buffered geometries of Section 6; their induced compatible boundary partitions are allowed to vary. In every comparison of exterior completions, the local patch, its fixed buffer, and the continuous designated wire portions on its walls agree. Exterior data have the permitted planar realizations of Definition 59. For the bounded collar comparisons used here, a fixed number $J_(upright("bank"))$ bounds every designated bank-wire class meeting a collar, including a class that ends inside it. After those classes are removed, the residual rim caps are separately noncrossing. No other identification bypasses the buffer. Constants may depend on this fixed inventory of bank classes.

#prodef([Convention 7.1.])[
  (Fixed geometry before small mesh).  A macroscopic annulus, sector, corridor, or box comes with a fixed buffer. All subdivision numbers, aspect ratios, and separations used in its proof are chosen before the mesh tends to zero. A bound is uniform once the mesh resolves these fixed choices. The remaining bounded range of radius-to-mesh ratios is covered by the deterministic bound on the number of tiles in the local patch. Thus a constant may depend on a fixed exponential rate or subdivision number, but never on the subsequently refined mesh.
] <angular:mesh-convention>

#prodef([Definition 7.2.])[
  (Raw passage packing).  Fix a finite test patch with its cut-surface drawing. For an annulus or sector test, an admissible subarc is contained in that patch and joins its two prescribed rims. It is trimmed at its first arrival at the second rim and the last departure from the first rim before that arrival. For a diameter test, fix a positive macroscopic threshold and require instead a contained raw subarc whose diameter is at least that threshold. Raw strands stop at wall ports in both tests.
  The passage count of the test is the maximum cardinality of a family of admissible subarcs that are pairwise disjoint, including their port incidences on the cut surface. A finite-family passage count is the sum of the counts of its nominated tests. We also allow an inventory bounded by a fixed multiple of such a sum plus a fixed constant, recording that domination when it is used. The count depends only on switches in its test patches; their larger buffers are used for conditional estimates.
] <angular:passage-packing>

#thm([Proposition 7.3.])[
  (All exponential passage moments).  #emph[For every fixed buffered regular annulus or sector and every $B gt.eq 0$, its passage count $X$ satisfies 
#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E) #h(-1em) [e^(B X) divides upright("exterior states")] lt.eq C_B . $ <angular:passage-moment>]

 The estimate is uniform in scale, sufficiently fine mesh, and the compatible exterior states. It also holds for the fixed macroscopic diameter tests of Definition 68, for a fixed finite family of such tests, and for an inventory with the stated fixed domination by their packing counts.]
] <prop:passage-moments>

#proof[
  #strong[An ordered crossing test gives one exponential rate.] We first prove a geometric tail with one positive exponential rate. For each configuration, select a maximizing packing only to derive the following deterministic implications. No conditional law below fixes that choice of packing. Cover the relevant buffered annular slice by finitely many small bulk boxes and boxes flush with a straight bank. A subarc moving a fixed fraction of the slice width has a subarc between two separated tile-coordinate levels in one of these boxes. This follows by subdividing each coordinate into a fixed finite grid of levels and trimming at a last departure and a first arrival. Slight cropping keeps the levels inside the available buffer. Near a corner or a tip, make the selections in boxes away from the individual apex; an arc of the prescribed diameter must travel through one of them. There are only finitely many choices of box, coordinate, and pair of levels. The same selection applies to a diameter test: an arc of the prescribed diameter has a coordinate displacement bounded below by a fixed fraction of that diameter. Thus the argument below proves the first exponential rate for both crossing and diameter counts.
  Suppose one choice receives many disjoint raw subarcs. They are ordered separators in the rectangular strip between its two levels. Small outward prolongations at lateral boundary contacts permit the usual disk order without adding any random tiles. On either side of a raw separator, its incident corner sites form an actual path: at each switch consecutive sites are either equal or joined by an actual open bond. One side has one color and the other side has the other color. These paths do not cross a raw separator. By retaining a fixed fraction of the separators and leaving unused separators between selections, we obtain disjoint actual crossings whose colors alternate in strip order. Trim them to be simple and to have no end-level contacts except their initial and terminal vertices. Lateral contacts are harmless. Their initial points retain their order along the first level.
  Partition that level into a fixed number of intervals of length at most $eta$ times the level separation. One interval contains a consecutive block of at least a fixed fraction of the alternating crossings, up to a fixed additive loss. We choose the fixed $eta > 0$ sufficiently small below. Thus a large passage count forces a long ordered alternation of proper actual crossings starting in one such interval.
  We now test this implication without conditioning on the existence of the entire alternation. For the first color, perform complementary path/cut searches from both lateral sides of the strip, looking for proper actual crossings from the chosen interval to the other level. For these searches only, ignore bonds running along the two end levels and split the incidences at an end-level site into separate leaves in their fan order. Give the target leaves auxiliary outward spokes. A simple path in this split drawing is exactly a physical crossing with no additional end contacts. No switch state or probabilistic boundary identification has been changed.
  Seed each search at its prescribed exterior flank face. An interior face is entered only from an already reached face, across a bond that has been queried and found closed to the tested color. The search therefore cannot inspect strictly beyond a witnessing crossing. Equivalently, after a successful search, closing every still uninspected tested-color edge leaves a crossing by the planar path/cut alternative, so one may select a simple blocker made of measured edges. An existing proper crossing shields all edges strictly on its other side. Consequently, when a long ordered alternation exists, the two searches find disjoint measured blockers, with all but a bounded number of the intervening witnesses still between them.
  Condition on the two search leaves. The disk between these blockers is uninspected in its interior. For the opposite color, its longitudinal flanks are free, and its possible inherited identifications occur only at the two end cuts. To see this at tile level, each cutter follows actual open diagonals of the blocker color. The opposite-color half-tile slots along it are dead or dangling slots, not entrances to an exterior wire. Splitting a lateral contact into its fan incidences does not introduce a longitudinal connection. In the conditional opposite-color graph, all bonds crossing a cutter are closed; outside connections therefore meet the intercut disk only at its end cuts. Unqueried exterior states can be integrated out after this observation.
  The near end of this disk remains within the chosen interval, whereas the other end is at the original positive level separation. Theorem 56, including its allowed end-cap identifications, gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ bb(P) \( upright("an opposite-color proper traversal") divides upright("the two search leaves") \) lt.eq p_0 < 1 $ <angular:one-round>]
  once $eta$ is sufficiently small and the mesh is sufficiently fine. The bound is uniform over the irregular measured blockers.
  Repeat the two lateral searches inside the current disk, now testing the opposite color, and then alternate colors. At each stage the first and last witnesses of the tested color shield the remaining middle witnesses; discarding at most two witnesses at each end preserves the claim. New blockers cannot use dead longitudinal slots or the original lateral wires. The searches stop when the required disjoint pair is absent. A long initial alternation forces linearly many successful rounds. Except for the first round, success requires the event in (7.2). Iterated conditioning on the search leaves, not conditioning on the desired alternation, therefore gives
  $ bb(P) \( X gt.eq m divides upright("exterior states") \) lt.eq C e^(- beta m) $
  for some fixed $beta > 0$. Taking the finite union over the initial geometric choices proves (7.1) at one rate $B_0 > 0$.
  ===== 7.1.1 Separated slices give every fixed exponential rate. <separated-slices-give-every-fixed-exponential-rate.>
  To obtain every fixed rate, divide the radial distance into $J$ separated slices of thickness comparable to $r \/ J$, with $J$ fixed. A middle rim of each slice has a cover by $O \( J \)$ small boxes whose buffers remain inside that slice. Use boxes flush with a wall where necessary, treating the two banks separately. Their overlap graph has a coloring with $h$ colors, where $h$ is independent of $J$. The box shapes range over a fixed family after rescaling, so their passage counts $X_alpha$ have the same first rate $B_0$. For each selected original passage and each slice, choose a point where it meets the middle rim and a box whose smaller core contains that point. Following the passage toward either rim of the slice until its first exit from the box gives a contained subarc of the box’s fixed diameter threshold; the box buffer remains in the slice. The selected original subarcs are disjoint at all cut-surface incidences, so these contributions are disjoint as well. Hence
  $ J X lt.eq sum_alpha X_alpha . $
  Within one color class the buffered supports are disjoint. Conditional iteration of the first-rate estimate gives $bb(E) exp \( B_0 sum_(alpha in cal(C)) X_alpha \) lt.eq C^(\| cal(C) \|)$. Hölder’s inequality over the $h$ classes now gives a bound at rate $B_0 J \/ h$ for $X$. Choosing $J gt.eq h B \/ B_0$ proves the desired rate. Convention 67 handles the finite range before the chosen boxes fit in the mesh. To transfer every rate to a diameter threshold $a > 0$, choose a finite cover of the test patch by smaller neighborhoods inside fixed regular bulk, wall, or corner charts. Take each chart’s outer diameter less than $a \/ 2$, with its passage-test buffer inside the original available buffer. Every point belongs to an inner neighborhood separated from the chart’s outer rim by a fixed positive distance. An arc of diameter at least $a$ therefore has a subarc crossing from such an inner neighborhood to that outer rim. These are a fixed finite family of annulus or sector tests. Assign each member of a disjoint diameter packing to one such crossing; within each test the assigned subarcs remain disjoint. The diameter count is bounded by the sum of these crossing counts. Their every-rate bounds and Hölder’s inequality give the assertion. The same inequality combines any fixed finite family and any inventory dominated by its packing sum. ◻
]

=== 7.2 Nest weights under local tilts <nest-weights-under-local-tilts>

The passage bounds now control the change in a positive weight when its nest cutoff moves through one scale. This comparison must hold under the weighted law itself, since that law will enter the charge estimates.

Let $r_j = 2^j r_0$, starting at a fixed multiple $r_0$ of the mesh. Let $N_j$ count raw nests wholly contained in the corresponding radius-$r_j$ neighborhood. A nest is either a closed raw loop surrounding a marked bulk site or a raw arc joining the two side rays around a marked boundary gap, corner, wire change, or slit tip. These definitions depend on the raw trace, not on any exterior completion. The initial count is bounded deterministically. There is a fixed integer $k$ and shell passage counts $X_j$ such that

#[#set math.equation(numbering: n => "(7.3)")
 $ 0 lt.eq N_j - N_(j - 1) lt.eq X_j \, $ <angular:nest-increments>]

and the buffered support of $X_j$ is disjoint from $B_(r_(j - k))$. Indeed a newly counted nest either travels a fixed fraction of the radius or winds across the local sector within that band. At a slit tip, a route between banks away from the tip must cross the full-angle sector. A fixed small-box cover away from the marked point gives the required counts. Increase $k$ once to accommodate all these buffers.

#thm([Proposition 7.4.])[
  (Local tilt bounds).  #emph[Fix $b > 0$, and write 
$ F_j \( b \) = bb(E) b^(N_j) \, #h(2em) thin upright(d) nu_j = F_j \( b \)^(- 1) b^(N_j) thin thin upright(d) bb(P) . $

 There is a constant $C_b$ such that 
#[#set math.equation(numbering: n => "(7.4)")
 $ C_b^(- 1) lt.eq F_j \( b \) \/ F_(j - 1) \( b \) lt.eq C_b . $ <angular:tilt-ratios>]

 For every fixed $B gt.eq 0$, 
#[#set math.equation(numbering: n => "(7.5)")
 $ sup_(i gt.eq j) bb(E)_(nu_j) e^(B X_i) lt.eq C_(b \, B) . $ <angular:tilt-moments>]

 The assertions hold conditionally on compatible exterior states and allow a fixed additional family of passage counts whose buffers lie at or beyond the tilt level. They also hold with the radial direction reversed, for nests whose raw traces lie outside a moving inner cutoff and inside a fixed outer cutoff.]
] <prop:tilts>

#proof[
  For $b = 1$, this is Proposition 69.
  ===== 7.2.1 Weights below one. <weights-below-one.>
  Suppose $0 < b < 1$, put $L = \| log b \|$, and set $D_i = log \( F_(i - 1) \( b \) \/ F_i \( b \) \) gt.eq 0$. Jensen’s inequality and (7.3) imply, for every fixed $epsilon > 0$,
  $ D_i lt.eq L bb(E)_(nu_(i - 1)) X_i lt.eq epsilon log bb(E)_(nu_(i - 1)) e^(L X_i \/ epsilon) . $
  Since $b^(N_(i - 1)) lt.eq b^(N_(i - k))$, and the latter tilt is supported outside the buffer of $X_i$, conditioning and Proposition 69 give
  $ bb(E)_(nu_(i - 1)) e^(L X_i \/ epsilon) lt.eq C_epsilon frac(F_(i - k) \( b \), F_(i - 1) \( b \)) . $
  Thus, changing the fixed constant,
  #[#set math.equation(numbering: n => "(7.6)")
   $ D_i lt.eq C_epsilon + epsilon sum_(i - k < ell < i) D_ell . $ <angular:decreasing-tilt-induction>]
  The bounded initial count supplies the initial bounds. Choose $epsilon \( k - 1 \) < 1$; induction then bounds every $D_i$. For $i gt.eq j$, either the buffer of $X_i$ misses the entire tilt, or dropping at most $k$ decreasing increments reduces to that situation. The already bounded ratios pay for these increments and prove (7.5) at every fixed rate.
  ===== 7.2.2 Weights above one. <weights-above-one.>
  Now suppose $b > 1$, and write $L = log b$. Given a desired rate, choose $B > k L$ at least that large. We induct on $j$ that
  $ bb(E)_(nu_j) e^(B X_i) lt.eq C_(*) #h(2em) \( i gt.eq j \) . $
  If $i gt.eq j + k$, the tilt and buffer are disjoint, and the conditional passage estimate applies directly. Otherwise put $j_0 = i - k < j$, treating levels below the initial one as no tilt and paying a fixed factor for the bounded initial count. Because $F_j \( b \) \/ F_(j_0) \( b \) gt.eq 1$,
  $ bb(E)_(nu_j) e^(B X_i) lt.eq bb(E)_(nu_(j_0)) exp (B X_i + L sum_(j_0 < ell lt.eq j) X_ell) . $
  There are at most $k$ summands in the sum. Give each its Hölder weight $L \/ B$. Its resulting moment is $bb(E)_(nu_(j_0)) e^(B X_ell) lt.eq C_(*)$, by the induction hypothesis at the earlier tilt $j_0$. The remaining Hölder weight is at least $1 - k L \/ B > 0$. Its factor is a moment of $X_i$ at a larger fixed rate, under a tilt whose support misses the buffer of $X_i$. Consequently
  $ bb(E)_(nu_j) e^(B X_i) lt.eq C C_(*)^(k L \/ B) . $
  Since $k L \/ B < 1$, a sufficiently large fixed $C_(*)$ closes the induction. This proves every desired rate. The ratio bound follows from
  $ 1 lt.eq F_j \( b \) \/ F_(j - 1) \( b \) = bb(E)_(nu_(j - 1)) b^(N_j - N_(j - 1)) lt.eq bb(E)_(nu_(j - 1)) e^(L X_j) . $
  The preceding proofs are conditional and remain valid after adjoining finitely many passage counts at the indicated levels.
  ===== 7.2.3 Moving the inner cutoff. <moving-the-inner-cutoff.>
  For the reverse direction, lower the inner cutoff while keeping the outer one fixed, counting nests whose entire raw traces lie outside the moving cutoff. Every newly included nest supplies a passage near that cutoff by the same radial or sector-crossing argument used in (7.3). A fixed number of reversed levels separates its buffer from the earlier, farther-out tilt. The two inductions therefore apply verbatim with the radial order reversed. ◻
]

#thm([Corollary 7.5.])[
  (Polynomial costs and fixed cutoffs).  #emph[Up to radii $O \( n^C \)$ in mesh units, every fixed positive nest weight and each of its fixed real powers has expectation between $n^(- A) \/ C'$ and $C' n^A$, for constants depending on the fixed weight and geometry. Changing a cutoff by a fixed factor changes its expectation by a bounded factor. Changing a permitted exterior completion beyond such a fixed buffer, while keeping the patch, buffer, and deterministic wall portions unchanged, does the same. For a fixed weight $W$, uniformly for $t$ in a fixed compact interval, 
$ lr(|log bb(E) W^(t + epsilon) - log bb(E) W^t|) lt.eq C \| epsilon \| log n + O \( \| epsilon \| \) $

 when $epsilon$ stays in a sufficiently small fixed interval.]
] <angular:polynomial-costs>

#proof[
  There are $O \( log n \)$ dyadic levels, so (7.4) proves the polynomial bounds and the fixed-factor cutoff assertion. The bounded reciprocal marginal-density comparisons in Lemmas 60 and 63 give the exterior assertion. Finally $t mapsto log bb(E) W^t$ is convex. Its values on a slightly larger compact interval are $O \( log n \)$, by the bounds just proved; its secant slopes on the smaller interval are therefore $O \( log n \)$. ◻
]

#thm([Lemma 7.6.])[
  (Absorption of macroscopic passage errors).  #emph[Suppose $Y_n gt.eq 0$, $bb(E) Y_n gt.eq C^(- 1) n^(- A)$, and $bb(E) Y_n^2 lt.eq C n^A$. Suppose $X_n gt.eq 0$ has uniformly bounded exponential moments at every fixed rate. For fixed $C_0 gt.eq 1$ and every $epsilon > 0$, 
$ C_epsilon^(- 1) n^(- epsilon) lt.eq frac(bb(E) \[ Y_n C_0^(plus.minus X_n) \], bb(E) Y_n) lt.eq C_epsilon n^epsilon . $

]
] <angular:absorption>

#proof[
  Put $L = log C_0$ and choose $eta > 0$ with $eta L < epsilon \/ 2$; the case $L = 0$ is immediate. On $X_n lt.eq eta log n$, either multiplier lies between $n^(- epsilon \/ 2)$ and $n^(epsilon \/ 2)$. For every fixed $t > 0$, Cauchy–Schwarz gives
  $ bb(E) \[ Y_n e^(L X_n) \; X_n > eta log n \] lt.eq \( bb(E) Y_n^2 \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] n^(- t eta) bb(E) e^(\( 2 L + t \) X_n) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C_t n^(A \/ 2 - t eta \/ 2) . $
  The same bound, with $L = 0$, controls the omitted $bb(E) \[ Y_n \; X_n > eta log n \]$. Choose $t$ so large that both errors, after division by $bb(E) Y_n$, are smaller than any prescribed inverse power. Retaining the truncated event proves the lower bounds, and adding the tail proves the upper bounds. Enlarge constants for bounded $n$. ◻
]

=== 7.3 The strict cost at a flat wire change <the-strict-cost-at-a-flat-wire-change>

Consider a straight boundary with one change of wire color, a marked gap at that change, and a fixed buffered half-box. The gap is the boundary incidence of its designated physical tile corner between neighboring wall ports. Its own color is the primal or dual color of that corner, independently of the wire designations on the two adjacent wall intervals. Distinct incidences at a cut remain distinct, and no wall cap is used to extend an actual component. Let $cal(A)_n$ be the event that the marked gap has an actual arm of its own color to radius comparable to $n$ in mesh units. Let $N_n$ count raw arcs straddling the gap, with one endpoint on each side ray, whose entire traces are inside that cutoff. Define

#[#set math.equation(numbering: n => "(7.7)")
 $ P \( n \) = log bb(P) \( cal(A)_n \) \, #h(2em) D_(*) \( n \) = log bb(E) d^(N_n) \, #h(2em) d = sqrt(q) . $ <angular:flat-cost-definitions>]

Here $0 < d < 1$, so no nonnegative sign is asserted for $D_(*)$. All definitions use a fixed compatible positive exterior completion beyond the buffer.

#thm([Lemma 7.7.])[
  (Flat costs, gap arms, and raw straddles).  #emph[ There are fixed $0 < c < C < oo$ such that, with harmless fixed changes of the cutoff convention, 
#[#set math.equation(numbering: n => "(7.8)")
 $ cal(A)_(C n) subset.eq { N_n = 0 } subset.eq cal(A)_(c n) . $ <angular:arm-straddle-inclusions>]

 Arm probabilities at fixed multiples of a radius are comparable. Moreover 
$ - A log n - O \( 1 \) lt.eq P \( n \) lt.eq - a log n + O \( 1 \) $

 for some $A \, a > 0$, and 
$ - A log n - O \( 1 \) lt.eq D_(*) \( n \) lt.eq 0 . $

 Changing a cutoff by a fixed factor or changing a compatible exterior completion beyond a fixed buffer changes either $P \( n \)$ or $D_(*) \( n \)$ by $O \( 1 \)$. These statements are uniform under the compatible exterior changes allowed above.]
] <angular:arm-straddle>

#proof[
  Work in the cut drawing without using exterior caps or wire identifications in its connectivity test; the sampling law retains its prescribed boundary partition. Within each tile, the corner sites on a given side of a switch strand are equal or joined by an actual open diagonal. Concatenating these local incidences identifies boundary-touching regions of the drawing with the actual color components incident to the boundary gaps. This identification uses only physical edges. The disjoint raw boundary-to-boundary arcs have a tree as their region-adjacency graph. A closed raw loop has no wall port and encloses no boundary gap; it therefore does not split a boundary-touching class. Apparent bank contacts in an unsmoothed drawing retain their distinct fan incidences on the cut surface and do not join such classes.
  Let $S$ be the set of tree vertices visited by the outer-rim walk. It is a connected subtree; neither that walk nor the wall walk is assumed to be a simple path. If the region of the marked gap is absent from $S$, take the first edge separating it from $S$. An arc with an endpoint on the rim has both adjacent regions visited by the rim walk, so this separating edge cannot have such an endpoint. Both ends of its raw arc are on the wall. The wall walk enters and leaves the component containing the gap across that edge, hence the two ends lie on opposite sides of the gap. This is a straddling raw arc. Conversely, a wall-to-wall raw arc straddling the gap separates it from a sufficiently distant rim, and an actual path of the gap color cannot cross it. The region argument is unchanged by interior closed loops or mixed wire designations, since no exterior identification has been used. Applying it in two nested buffered half-boxes, with fixed margins to absorb the tile diameter, proves (7.8).
  For a fixed-factor extension use the single-arm version of Lemma 65. Its finitely many truncated-search success events $T_1 \, dots.h \, T_m$ cover the shorter-arm event. On each successful leaf, Proposition 61 and Lemma 58 extend the measured source-connected frontier through the remaining window with probability at least $c_0$. Thus, for the permitted states $F$ fixed away from that window,
  $ bb(P) \( cal(A)_(C n) divides F \) gt.eq c_0 max_i bb(P) \( T_i divides F \) gt.eq c_0 / m bb(P) \( cal(A)_n divides F \) . $
  This is a relative event estimate, not an assertion under arbitrary conditioning on the full states of an incoming arm. Iterating from a bounded-mesh event of positive finite-energy probability gives the polynomial lower bound. In the other direction, Proposition 62 provides opposite-color actual wall-to-wall screens in separated annuli, each with uniformly positive conditional probability. Each screen blocks the arm. Conditional iteration over $O \( log n \)$ annuli gives the strict polynomial upper bound. The bounded collar comparisons in Lemmas 60 and 63 make these estimates uniform under the specified exterior changes. None of these paths traverses a wire identification. The assertions for $D_(*)$ follow from Corollary 71; its upper bound is immediate from $d < 1$ and $N_n gt.eq 0$. ◻
]

#thm([Lemma 7.8.])[
  (Strict flat-flip weight gap).  #emph[For every fixed $0 < b_1 < b_2$, there is $c > 0$ such that 
#[#set math.equation(numbering: n => "(7.9)")
 $ log bb(E) b_2^(N_n) - log bb(E) b_1^(N_n) gt.eq c log n - O \( 1 \) . $ <angular:strict-weight-gap>]

 In particular, for some $c' > 0$, 
#[#set math.equation(numbering: n => "(7.10)")
 $ D_(*) \( n \) gt.eq P \( n \) + c' log n - O \( 1 \) . $ <angular:strict-flat-gap>]

]
] <lem:strict-flip>

#proof[
  Fix $b = b_1$. At a dyadic scale $r_i$ well between the mesh and the cutoff, choose a fixed large integer $k$, larger than all buffer ranges in Proposition 70. Let $N_(upright("in"))$ count straddles wholly inside $r_(i - k)$, and let $N_(upright("out"))$ count straddles whose entire raw traces lie outside $r_(i + k)$ and inside the large cutoff. In particular, #emph[outside] refers to the trace, not to the region enclosed by the arc. These counts have disjoint supports. Put
  $ M = N_n - N_(upright("in")) - N_(upright("out")) gt.eq 0 \, #h(2em) thin upright(d) Q_i = frac(b^(N_(upright("in")) + N_(upright("out"))), bb(E) b^(N_(upright("in")) + N_(upright("out")))) thin thin upright(d) bb(P) . $
  Every omitted straddle counted by $M$ supplies a passage in one of a fixed number of shell bands between $r_(i - k)$ and $r_(i + k)$, allowing fixed buffer shifts. Indeed it is neither confined below the lower cutoff nor confined above the upper one; its radial travel or its crossing between opposite rays has substantial diameter near one of those levels. Distinct straddles give disjoint subarcs. The small-box construction used for (7.3) therefore bounds $M$ by a fixed sum of shell passage counts.
  These counts have all fixed exponential moments under $Q_i$. For a count near the inner edge, condition on states outside an intermediate radius below the support of the outer tilt. The outer factor is then constant, and the conditional law is the inner tilt with a compatible exterior partition. Its edge moment is bounded by Proposition 70. For a count near the outer edge, reverse this conditioning and use the inward version of that proposition. Middle buffers miss both supports and use Proposition 69 directly. Hölder’s inequality over the fixed number of counts gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ bb(E)_(Q_i) e^(t M) lt.eq C_t #h(2em) \( t gt.eq 0 \) \, $ <angular:omitted-moments>]
  uniformly in $i \, n$ and the exterior states. This argument uses conditional estimates, not independence of the two tilts.
  Between the two tilt supports, choose two separated regular subbands. Proposition 62 constructs proper actual wall-to-wall paths of opposite colors in these bands. Their conditional probabilities are bounded below uniformly after fixing states away from their supports; the two tilt factors are measurable there. Applying the construction successively gives an event $E_i$ with
  $ Q_i \( E_i \) gt.eq p > 0 . $
  On $E_i$, at least one raw straddle lies between the two paths. Indeed raw strands cannot cross either actual path. Along each flank, the end vertices of the two paths have opposite colors, so the wall segment between them contains an odd number of raw wall ports. In the intervening disk, pairings of ports on a single flank remove them in pairs. Hence at least one raw arc joins the two flanks. It is trapped between the blockers and is a localized straddle.
  The full tilt $nu$ by $b^(N_n)$ is obtained from $Q_i$ by the density $b^M \/ bb(E)_(Q_i) b^M$. Cauchy–Schwarz yields
  $ Q_i \( E_i \)^2 lt.eq bb(E)_(Q_i) \[ b^M upright(bold(1))_(E_i) \] thin bb(E)_(Q_i) \[ b^(- M) upright(bold(1))_(E_i) \] \, $
  and consequently
  #[#set math.equation(numbering: n => "(7.12)")
   $ nu \( E_i \) gt.eq frac(p^2, bb(E)_(Q_i) b^M thin bb(E)_(Q_i) b^(- M)) gt.eq c_b > 0 . $ <angular:tilt-event-transfer>]
  The last inequality follows from (7.11); because $M gt.eq 0$, one of the two denominator factors is at most one. Thus the same argument works for $b < 1$ and $b > 1$.
  Choose $c_1 log n - O \( 1 \)$ scales whose localization bands are disjoint. Their forced straddles are distinct, so, pointwise, $N_n gt.eq sum_i upright(bold(1))_(E_i)$. Taking expectation under the single full tilt and using (7.12) gives
  $ bb(E)_nu N_n gt.eq c_2 log n - O \( 1 \) . $
  For the finite graph, $psi \( t \) = log bb(E) e^(t N_n)$ is differentiable and convex, with $psi' \( log b_1 \) = bb(E)_nu N_n$. The supporting-line inequality between $log b_1$ and $log b_2$ proves (7.9).
  Finally choose any fixed $0 < b_1 < d$ and put $b_2 = d$. Since the summand for $N_n = 0$ has weight one,
  $ bb(E) b_1^(N_n) gt.eq bb(P) \( N_n = 0 \) gt.eq bb(P) \( cal(A)_(C n) \) . $
  Lemma 73 compares the final probability with $bb(P) \( cal(A)_n \)$ by a fixed factor. Combining this with (7.9) proves (7.10). ◻
]

The costs $P \, D_(*)$ enter the charge comparison of Theorem 94. The finite matrix argument next isolates the two decay powers. Section 8 proves their staggered physical instance and then uses it in the scalar estimate of Theorem 91 and the geometric application in Corollary 122. The remaining arguments in this section concern finite matrices alone.

=== 7.4 Finite-circle rows and the scalar normalization <finite-circle-rows-and-the-scalar-normalization>

For the rest of this Section, temporarily allow the larger parameter range

#[#set math.equation(numbering: n => "(7.13)")
 $ 0 < lambda < pi / 2 \, #h(2em) d = 2 cos lambda > 0 \, #h(2em) rho = lambda / pi \, #h(2em) v = pi / 2 . $ <angular:parameters>]

The target range is $pi \/ 3 < lambda < pi \/ 2$. No infinite-volume state is used in this part of the argument. Every row acts on a finite tensor product, and every limit below first sends its circumference to infinity with the entire finite row arrangement fixed.

In the ordered spin basis $+ + \, + - \, - + \, - -$, set

#[#set math.equation(numbering: n => "(7.14)")
 $ R \( u \) = mat(delim: "(", a \( u \), 0, 0, 0; 0, b \( u \), 1, 0; 0, 1, b \( u \), 0; 0, 0, 0, a \( u \)) \, #h(2em) a \( u \) = frac(sin \( lambda - u \), sin lambda) \, #h(2em) b \( u \) = frac(sin u, sin lambda) . $ <angular:R>]

Also write

#[#set math.equation(numbering: n => "(7.15)")
 $ c \( u \) = frac(sin \( lambda + u \), sin lambda) \, #h(2em) r \( u \) = a \( u \) c \( u \) = 1 - b \( u \)^2 . $ <angular:acr>]

The scalar used to normalize a row is defined on the outer spectral strip, independently of any Perron eigenvector. The use of an inversion relation together with symmetry and analyticity follows the classical method developed by Baxter #cite(label("Baxter1982Inversion")). We define the scalar by its boundary data and prove the identities needed here.

#thm([Lemma 7.9.])[
  (Outer-strip scalar).  #emph[There is a unique nonvanishing holomorphic function $F$ on $0 < Re u < lambda$ whose logarithmic modulus is the strip Poisson integral of 
$ h \( y \) = 1 / 2 log r \( upright(i) y \) = 1 / 2 log (1 + frac(sinh^2 y, sin^2 lambda)) $

 on both boundary lines and for which $F \( lambda \/ 2 \) > 0$. It extends locally across both boundary lines, satisfies 
#[#set math.equation(numbering: n => "(7.16)")
 $ F \( macron(u) \) = overline(F \( u \)) \, #h(2em) F \( lambda - u \) = F \( u \) \, #h(2em) F \( u \) F \( - u \) = r \( u \) \, $ <angular:F-symmetries>]

 and has $F \( 0 \) = F \( lambda \) = 1$. The last identity continues $F$ nonvanishingly to $- lambda < Re u < 0$, and symmetry continues it to $lambda < Re u < 2 lambda$. On the common domain, 
#[#set math.equation(numbering: n => "(7.17)")
 $ F \( u \) F \( lambda + u \) = r \( u \) . $ <angular:F-fusion>]

 In the closed original strip, and in each closed substrip of $- lambda < Re u < 2 lambda$, $log \| F \( u \) \| - \| Im u \|$ is bounded, with a bound depending on $lambda$ and the chosen substrip.]
] <angular:scalar-normalizer>

#proof[
  For $0 < x < lambda$, the two strip Poisson kernels are
  $ P_0 \( x \, t \) = frac(sin \( pi x \/ lambda \), 2 lambda { cosh \( pi t \/ lambda \) - cos \( pi x \/ lambda \) }) \, #h(2em) P_lambda \( x \, t \) = frac(sin \( pi x \/ lambda \), 2 lambda { cosh \( pi t \/ lambda \) + cos \( pi x \/ lambda \) }) . $
  Their masses are $1 - x \/ lambda$ and $x \/ lambda$, respectively. Their sum has a uniformly bounded first absolute moment, and exponentially decaying tails. Thus
  $ U \( x + upright(i) y \) = integral_(bb(R)) { P_0 \( x \, y - t \) + P_lambda \( x \, y - t \) } h \( t \) thin upright(d) t $
  is harmonic and $U \( x + upright(i) y \) - \| y \|$ is bounded, since $h \( t \) - \| t \|$ is bounded. A harmonic conjugate on the simply connected strip defines $F = exp \( U + upright(i) V \)$. Fix its constant phase by $F \( lambda \/ 2 \) > 0$. This also proves uniqueness.
  The boundary data are real analytic. For example, near any point of the imaginary edge choose the analytic branch of $1 / 2 log r \( u \)$ that is real on that edge. The difference of its real part and $U$ vanishes there, so odd harmonic reflection extends that difference across the edge. This gives a local holomorphic extension of $F$, still nonvanishing. The other edge is identical. Symmetries of the Poisson integral and the phase at $lambda \/ 2$ give the first two identities in (7.16). On the imaginary edge, $F \( upright(i) y \) F \( - upright(i) y \) = \| F \( upright(i) y \) \|^2 = r \( upright(i) y \)$, so analytic continuation gives the third identity.
  The only zeros of $r$ closest to the imaginary axis are at $u = plus.minus lambda$; all its zeros are real. Hence $r \( u \) \/ F \( - u \)$ extends $F$ without zeros to $- lambda < Re u < 0$. Reflection about $lambda \/ 2$ gives the extension across the other edge and (7.17). Along the real interval $\[ 0 \, lambda \]$, $F$ is real, nonzero, and positive at the midpoint, hence positive throughout. At zero the third identity gives $F \( 0 \)^2 = r \( 0 \) = 1$; the endpoint values follow. The growth assertion on the extended substrips follows from $F \( - u \) = r \( u \) \/ F \( u \)$ and symmetry, because $log \| r \( u \) \| - 2 \| Im u \|$ is bounded at the two imaginary infinities on every bounded real interval. On a compact remaining rectangle the extended function is continuous and nonzero. ◻
]

Let $cal(H)_k = \( bb(C)^2 \)^(⊗ k)$, with its usual Hilbert norm, and let $p$ denote an auxiliary spin. For a $2$-by-$2$ matrix $D$, define

#[#set math.equation(numbering: n => "(7.18)")
 $ T_k^D \( u \) = "Tr"_p #scale(x: 120%, y: 120%)[\(] D_p R_(p 1) \( u \) dots.h.c R_(p k) \( u \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) A_k^D \( z \) = frac(T_k^D \( rho \( v - z \) \), F \( rho \( v - z \) \)^k) . $ <angular:rows>]

The auxiliary trace is unnormalized. Subscripts $k$ will sometimes be suppressed. For $\| zeta \| = 1$ put

#[#set math.equation(numbering: n => "(7.19)")
 $ K \( zeta \) = mat(delim: "(", zeta, 0; 0, zeta^(- 1)) \, #h(2em) P_(zeta \, k) = A_k^(K \( zeta \)) . $ <angular:twist-rows>]

Choose $epsilon.alt in { - 1 \, 1 }$ and unitary twists satisfying

#[#set math.equation(numbering: n => "(7.20)")
 $ zeta / xi = - e^(upright(i) epsilon.alt lambda) . $ <angular:twist-ratio>]

There are two permitted marker conventions:

#[#set math.equation(numbering: n => "(7.21)")
 $ \( D \, tau \) = #scale(x: 120%, y: 120%)[\(] \| - chevron.r chevron.l + \| \, epsilon.alt #scale(x: 120%, y: 120%)[\)] quad upright("or") quad \( D \, tau \) = #scale(x: 120%, y: 120%)[\(] \| + chevron.r chevron.l - \| \, - epsilon.alt #scale(x: 120%, y: 120%)[\)] . $ <angular:marker-convention>]

For either convention write

#[#set math.equation(numbering: n => "(7.22)")
 $ M_k \( z \) = e^(upright(i) tau rho z) A_k^D \( z \) \, #h(2em) N_k \( z \) = M_k \( z \) P_(zeta \, k) \( z \) + P_(xi \, k) \( z \) M_k \( z \) . $ <angular:MN>]

#thm([Theorem 7.10.])[
  (Homogeneous angular sandwich).  #emph[For every fixed $lambda$ in (7.13), let $B_(upright("out") \, k)$ and $B_(upright("in") \, k)$ be finite products of $P_(xi \, k)$ and $P_(zeta \, k)$, respectively, at real arguments in $\[ - v \, v \]$. Suppose that each product contains at least $n gt.eq 1$ rows at argument zero. Then 
#[#set math.equation(numbering: n => "(7.23)")
 $ limsup_(k arrow.r oo) sup_(x in \[ - v \, v \]) parallel B_(upright("out") \, k) N_k \( x \) B_(upright("in") \, k) parallel & lt.eq C n^(- 1 + rho) \,\
limsup_(k arrow.r oo) sup_(x \, y in \[ - v \, v \]) parallel B_(upright("out") \, k) { N_k \( x \) - e^(upright(i) tau \( x - y \)) N_k \( y \) } B_(upright("in") \, k) parallel & lt.eq C n^(- 1 - rho) . $ <angular:sandwich-first>]

 Immediately to either side of each $N_k$, one may insert an even number, bounded by a fixed $L$, of additional rows with the corresponding twist, at arbitrary real arguments in $\[ - v \, v \]$. The two terms in (7.23) may use different additional lists. The constant can then depend on $L$, as well as on $lambda$, but not on $n$ or on the real arguments. Moreover, 
#[#set math.equation(numbering: n => "(7.24)")
 $ limsup_(k arrow.r oo) sup_(x in \[ - v \, v \]) parallel P_(zeta \, k) \( x \) parallel lt.eq 1 . $ <angular:contraction>]

 The limit superior is taken for each fixed finite setup: its row counts and any geometric parameters are fixed before $k arrow.r oo$.]
] <thm:angular-transfer>

We call (7.23) the #emph[low-stencil] (amplitude) bound and (7.23) the #emph[high-stencil] (phase-cancelled) bound. The latter removes the leading angular factor $e^(upright(i) tau x)$; these names concern angular cancellation, not the spectral cutoff used below.

We establish the theorem in finite-dimensional steps. The analytic argument only uses scalar normal families obtained from these finite matrices; no common infinite-volume spectral representation is needed.

#thm([Lemma 7.11.])[
  (Finite row identities).  #emph[For every $k$ and every unitary twist, 
#[#set math.equation(numbering: n => "(7.25)")
 $ \[ P_(zeta \, k) \( z \) \, P_(zeta \, k) \( w \) \] = 0 \, #h(2em) P_(zeta \, k) \( z \)^(*) = P_(zeta \, k) \( - macron(z) \) . $ <angular:normal-rows>]

 In particular, this holomorphic family has a common orthonormal eigenbasis. For $\| Re z \| lt.eq v$, 
#[#set math.equation(numbering: n => "(7.26)")
 $ parallel A_k^D \( z \) parallel lt.eq 2 parallel D parallel . $ <angular:row-bound>]

]
] <angular:basic-rows>

#proof[
  Let $J = mat(delim: "(", 0, 1; 1, 0)$. Direct multiplication gives
  #[#set math.equation(numbering: n => "(7.27)")
   $ R_12 \( x - y \) R_13 \( x \) R_23 \( y \) & = R_23 \( y \) R_13 \( x \) R_12 \( x - y \) \,\
R \( u \) R \( - u \) & = r \( u \) I \,\
J_p R \( u \)^(t_p) J_p & = R \( lambda - u \) \, $ <angular:YB>]
  where $t_p$ is transpose only in the auxiliary spin. For completeness, the nonconstant entries in the one-minus-spin sector of (7.27) reduce to
  $ b \( x - y \) + a \( x \) b \( y \) & = b \( x \) a \( y \) \,\
b \( y \) + a \( x \) b \( x - y \) & = b \( x \) a \( x - y \) \,\
a \( x \) + b \( x - y \) b \( y \) & = a \( x - y \) a \( y \) . $
  These are sine addition identities. The all-equal-spin sectors are scalar, and spin reversal gives the remaining sector. Equations (7.27) and (7.27) follow from their displayed $2$-by-$2$ blocks.
  Slide the intertwiner $R_12 \( x - y \)$ across the two auxiliary rows using (7.27). Their boundary tensor $K \( zeta \) ⊗ K \( zeta \)$ commutes with the intertwiner because $R$ preserves total spin. For generic arguments the intertwiner is invertible, and cyclicity of the auxiliary trace proves row commutativity. Analytic continuation removes the genericity restriction.
  On taking an adjoint, the order of the site factors reverses. Auxiliary partial transpose reverses that order once more: its matrix entries belonging to distinct physical sites commute. Crossing then gives, for any $D$,
  $ T_k^D \( u \)^(*) = T_k^(J macron(D) J) \( lambda - macron(u) \) . $
  For a unitary diagonal twist $J overline(K \( zeta \)) J = K \( zeta \)$. The symmetries of $F$ prove the second identity in (7.25). Commutativity with the adjoints makes each row normal and gives simultaneous orthogonal diagonalization.
  On $u = upright(i) y$, the real-coefficient formula for $R$ and inversion show that $R \( upright(i) y \) \/ sqrt(r \( upright(i) y \))$ is unitary. A product of these matrices on the auxiliary and physical spins is unitary too. Since $\| F \( upright(i) y \) \| = sqrt(r \( upright(i) y \))$ and auxiliary dimension is two, its partial trace with $D$ has norm at most $2 parallel D parallel$. On $u = lambda + upright(i) y$, crossing converts the traced row into a reversed product at $- upright(i) y$, with the transpose and spin flip moved to $D$. The same bound follows. For each fixed $k$, the growth of $F$ and the explicit trigonometric entries of $R$ show that the normalized matrix entries are bounded throughout the strip. The bounded-strip maximum principle, applied to every unit-vector matrix element, gives (7.26). ◻
]

=== 7.5 The fusion estimate <the-fusion-estimate>

The essential gain is a bound on the three-dimensional auxiliary quotient in a two-row product. It remains valid when $d < 1$. Fusion of shifted fundamental $R$-matrices at a degenerate auxiliary channel is an established construction; Kulish, Reshetikhin, and Sklyanin develop it in the rational $upright("GL") \( N \)$ setting #cite(label("KulishReshetikhinSklyanin1981")) Section 2, equations (12)–(18). The trigonometric quotient and its norm estimate below are proved directly.

#thm([Lemma 7.12.])[
  (A spin-one quotient).  #emph[Use two auxiliary spins, labeled $1 \, 2$, and one physical spin $j$, and set 
#[#set math.equation(numbering: n => "(7.28)")
 $ G_j \( u \) = R_(1 j) \( u \) R_(2 j) \( lambda + u \) . $ <angular:G>]

 The auxiliary line spanned by $s_0 = \| + - chevron.r + \| - + chevron.r$ is invariant, and $G_j$ acts there as $r \( u \) I$ on the physical spin. In the three-dimensional quotient, use the ordered basis 
$ e_(+) = \| + + chevron.r \, #h(2em) e_0 = sqrt(d) thin \[ \| + - chevron.r \] \, #h(2em) e_(-) = \| - - chevron.r \, #h(2em) \[ \| - + chevron.r \] = - \[ \| + - chevron.r \] . $

 The quotient of $G_j \/ r$ is $Y_j \( u \) = \( b \( u \) \/ r \( u \) \) cal(L)_j \( u \)$, where, in the ordered basis $e_(+) ⊗ + \, e_(+) ⊗ - \, e_0 ⊗ + \, e_0 ⊗ - \, e_(-) ⊗ + \, e_(-) ⊗ -$, 
#[#set math.equation(numbering: n => "(7.29)")
 $ cal(L) \( u \) = mat(delim: "(", - a, 0, 0, 0, 0, 0; 0, c, sqrt(d), 0, 0, 0; 0, - sqrt(d), - b, 0, 0, 0; 0, 0, 0, - b, sqrt(d), 0; 0, 0, 0, - sqrt(d), c, 0; 0, 0, 0, 0, 0, - a) . $ <angular:fused-blocks>]

 In this fixed quotient Hilbert norm, for $\| Re u \| < lambda \/ 2$, 
#[#set math.equation(numbering: n => "(7.30)")
 $ ∥frac(product_(j = 1)^k G_j \( u \), r \( u \)^k)\|_(upright("quotient"))∥ lt.eq C lr(|tan frac(pi u, 2 lambda)|)^k . $ <angular:fusion-bound>]

 Constants allow the fixed change of auxiliary basis, but are independent of $k$.]
] <angular:fusion>

#proof[
  In the one-minus-spin sector, in the order $\( + + - \) \, \( + - + \) \, \( - + + \)$, direct multiplication gives
  #[#set math.equation(numbering: n => "(7.31)")
   $ G \( u \) = mat(delim: "(", b c, b, - b; a, a c, 0; c, 1, - b^2) . $ <angular:G-three>]
  Because $a c = 1 - b^2 = r$, the vector $\( 0 \, 1 \, 1 \)$ is an eigenvector with eigenvalue $r$. Spin reversal gives the other physical-spin fiber of the invariant auxiliary line. On the quotient, using $a - c = - d b$, the mixed block in the unrescaled basis is
  $ b mat(delim: "(", c, 1; - d, - b) . $
  Rescaling its middle auxiliary vector by $sqrt(d)$ produces the first mixed block of (7.29); spin reversal negates that middle vector and produces the other block. The two unmixed states have value $- a b$. This proves the complete quotient formula.
  On $Re u = - lambda \/ 2$ one has
  $ macron(c) = - b \, #h(2em) \| a \|^2 = \| b \|^2 + d \, #h(2em) \| b \| = \| c \| . $
  Each mixed block of $cal(L)$ has adjoint-square $\| a \|^2 I$; the unmixed entries have the same modulus. Since $r = a c$, $Y = \( b \/ r \) cal(L)$ is unitary on that boundary line.
  On $Re u = lambda \/ 2$, take the partial transpose of $cal(L)$ in the rescaled auxiliary basis and, if desired, exchange $e_(+) \, e_(-)$. Its two mixed blocks have diagonal entries $- a \, - b$ and opposite real off-diagonal entries $sqrt(d) \, - sqrt(d)$; the two unmixed entries equal $c$. Here
  $ a = macron(b) \, #h(2em) \| c \|^2 = \| b \|^2 + d \, $
  so the transformed matrix is unitary times $\| c \|$. Again the factor $b \/ r$ makes its norm one.
  Let $Q_k \( u \) = Y_1 \( u \) dots.h.c Y_k \( u \)$. On the left boundary $parallel Q_k parallel = 1$. On the right boundary its auxiliary partial transpose is the reversed product of the individually transposed factors, because entries at distinct physical sites commute. That product is unitary. Undoing a partial transpose on a three-dimensional auxiliary space costs at most the fixed factor three in operator norm: writing unit vectors as $sum_(i = 1)^3 e_i ⊗ x_i$ and $sum_(j = 1)^3 e_j ⊗ y_j$, bound each transposed block by the original operator norm and use $sum_i parallel x_i parallel sum_j parallel y_j parallel lt.eq 3$. Thus $parallel Q_k parallel lt.eq 3$ on the right boundary.
  There are no zeros of $r$ in the closed fusion strip $\| Re u \| lt.eq lambda \/ 2$. Each quotient factor contains $b \( u \)$, so $Q_k$ has a zero of order at least $k$ at zero. The map
  $ B \( u \) = tan frac(pi u, 2 lambda) $
  has its only zero in the strip at zero, has modulus one on its boundary lines, and maps its interior into the unit disk. Hence $Q_k \/ B^k$ has a removable singularity at zero and no other singularities there. Its entries are bounded at both imaginary infinities: $b cal(L) \/ r$ is bounded there and $B$ tends to a number of modulus one. The strip maximum principle applied to its scalar matrix elements gives (7.30). ◻
]

#thm([Lemma 7.13.])[
  (Normalized two-row inversion).  #emph[For $u = rho \( v - z \)$ with $\| Re u \| < lambda \/ 2$, put $frak(b) \( u \) = \| tan \( pi u \/ \( 2 lambda \) \) \|$. Then 
#[#set math.equation(numbering: n => "(7.32)")
 $ parallel P_(zeta \, k) \( z \) P_(zeta \, k) \( z - pi \) - I parallel & lt.eq C frak(b) \( u \)^k \,\
parallel M_k \( z \) P_(zeta \, k) \( z - pi \) + P_(xi \, k) \( z \) M_k \( z - pi \) parallel & lt.eq C \| e^(upright(i) tau rho z) \| frak(b) \( u \)^k . $ <angular:inversion>]

 The continued rows are those defined by Lemma 75. The errors vanish uniformly on every compact subset of this fusion strip. Equation (7.24) holds; more generally, the limiting norm is at most one uniformly on compact subsets of the closed physical strip $\| Re z \| lt.eq v$.]
] <angular:two-row>

#proof[
  The product of the two auxiliary row traces can be regrouped as the two-auxiliary trace of $product_j G_j \( u \)$. Indeed the factors $R_(1 i)$ and $R_(2 j)$ commute for $i eq.not j$, so no same-site order is changed. The scalar denominator is $r \( u \)^k$ by (7.17).
  The twist $K \( zeta \) ⊗ K \( zeta \)$ preserves the invariant line and acts on it as the identity. In a basis beginning with that line, both this twist and every $G_j$ are block upper triangular. The trace therefore equals the invariant-line contribution $I$ plus the trace of the quotient product against a bounded auxiliary matrix. The off-diagonal block contributes exactly zero to the trace, regardless of its size. Lemma 78 proves (7.32).
  For the marker use
  $ Q = D ⊗ K \( zeta \) + e^(- upright(i) tau lambda) K \( xi \) ⊗ D . $
  If $D = \| - chevron.r chevron.l + \|$ and $tau = epsilon.alt$, then
  $ Q s_0 = \( zeta^(- 1) + e^(- upright(i) epsilon.alt lambda) xi^(- 1) \) \| - - chevron.r = 0 . $
  If $D = \| + chevron.r chevron.l - \|$ and $tau = - epsilon.alt$, then
  $ Q s_0 = \( zeta + e^(upright(i) epsilon.alt lambda) xi \) \| + + chevron.r = 0 . $
  Both cancellations use (7.20). Thus $Q$ kills the invariant line. Its product with the block triangular fusion product again has zero contribution from the off-diagonal block, and now its invariant-line contribution is zero as well. Taking its quotient trace and extracting $e^(upright(i) tau rho z)$ proves (7.32).
  On the right edge $z = v + upright(i) y$, one has $z - pi = - macron(z)$. Consequently (7.25) turns (7.32) into approximate unitarity. On the left edge apply the same identity at $z + pi$. The errors converge to zero uniformly for $y$ in a fixed compact interval. To pass into the strip, truncate at $\| Im z \| = Y$. On the two vertical sides the norm is at most $1 + o_k \( 1 \)$; on the horizontal sides the uniform bound is two. The harmonic measure of the horizontal sides tends uniformly to zero on any fixed compact subset as $Y arrow.r oo$. The maximum principle for unit-vector matrix elements, first with $k arrow.r oo$ and then $Y arrow.r oo$, proves the claimed limiting contraction. The edge estimates include the real endpoints. ◻
]

=== 7.6 Scalar limits and continuation through the strip edges <scalar-limits-and-continuation-through-the-strip-edges>

Throughout this subsection, $0 < rho < 1 \/ 2$ is fixed. Every limit in the number $k$ of sites is taken with the finite list of rows, its real arguments, and all spectral cutoffs fixed. In particular, estimates in the damping parameter $n$ are obtained only after this limit. Constants may depend on $rho$ and on the permitted bound for the number of additional rows, but not on $k$ or $n$.

Put $cal(S) = { z : \| Re z \| < v }$, where $v = pi \/ 2$, and use $w = e^(upright(i) z)$ to identify $cal(S)$ with the right half-plane. The branch of $z = - upright(i) log w$ in this identification is always the one with $\| Re z \| < v$. For a fixed twist, all the rows have a common orthonormal eigenbasis. Their eigenvalues are therefore holomorphic functions of $z$; the same basis diagonalizes their analytic continuations, by the identity theorem. The adjoint identity (7.25) for the rows becomes

#[#set math.equation(numbering: n => "(7.33)")
 $ f_k \( overline(w) \) = overline(f_k \( w \)) #h(2em) \( Re w > 0 \) . $ <angular:eigenvalue-reflection>]

In particular, $f_k \( 1 \)$ is real. Here and below $P \( 0 \)$ refers to the argument $z = 0$, which corresponds to $w = 1$.

#thm([Lemma 7.14.])[
  (Scalar edge continuation).  #emph[Fix $s > 0$. From any sequence of row eigenvalues satisfying $\| f_k \( 1 \) \| gt.eq e^(- s)$ one can extract a subsequence converging locally uniformly in the right half-plane to a holomorphic function $f$ that is not identically zero. It satisfies 
$ \| f \| lt.eq 1 \, #h(2em) f \( 1 \) in bb(R) \, #h(2em) \| f \( 1 \) \| gt.eq e^(- s) . $

 Its only possible zeros in the right half-plane lie on the positive real axis. At every nonzero point of the imaginary axis, $f$ extends holomorphically and without zeros through the axis, and has modulus one there. Along the chosen subsequence, the eigenvalues and their inverses are locally bounded through each such boundary point.]
] <angular:edge-continuation>

#proof[
  The row bound (7.26) gives a normal family in $cal(S)$. The lower bound at $1$ prevents its limit from being identically zero. The asymptotic contraction (7.24) gives $\| f \| lt.eq 1$ throughout the strip: its boundary version, together with the uniform row bound, can first be applied on a finite rectangle, and the harmonic measure of the two horizontal sides tends to zero as the rectangle grows. Equivalently, one can use the interior contraction already obtained from this argument. Equation (7.33) passes to the limit.
  The inversion estimate (7.32) makes $f_k$ zero-free on every compact subset of each spectral band about a strip edge, for all sufficiently large $k$. Under $u = rho \( v - z \)$, the band $\| Re u \| < lambda \/ 2$ about the right edge is $0 < Re z < pi$; the corresponding band about the left edge is $- pi < Re z < 0$. These two bands cover the strict strip except for its center line. Hurwitz’s theorem therefore excludes zeros of $f$ off that center line, which maps to the positive real axis in the $w$-plane.
  We give the additional argument needed at an edge; mere convergence on the strict strip would not suffice. Fix a disk $D$ centered at $z_0 = v + upright(i) y_0$, with closure compactly contained in the right-edge spectral band. In this paragraph write $f_k \( z \)$ for $f_k \( e^(upright(i) z) \)$. On $D$,
  $ q_k \( z \) := f_k \( z \) f_k \( z - pi \) arrow.r 1 $
  uniformly. For all sufficiently large $k$, choose the analytic square root of $q_k$ near $1$, and set
  $ g_k \( z \) = frac(f_k \( z \), sqrt(q_k \( z \))) \, #h(2em) U_k \( z \) = - log \| g_k \( z \) \| . $
  Both eigenvalue factors are nonzero on $D$. On its vertical diameter the adjoint identity gives $q_k \( z \) = \| f_k \( z \) \|^2$, so that $\| g_k \( z \) \| = 1$. Consequently $U_k$ is harmonic on $D$ and odd under reflection in that diameter. On the physical half of $D$, the row bound and $q_k arrow.r 1$ give $U_k gt.eq - C$. At a fixed point strictly inside that half-disk, $U_k$ is bounded above as well: the limiting eigenvalue has no zero there by the preceding paragraph.
  For clarity, the elementary boundary estimate used here is as follows. For a harmonic function $U$ odd across a diameter of a disk, its Poisson formula is an integral over one semicircle with kernel
  $ K \( z \, t \) = P \( z \, t \) - P \( z \, t^(upright("ref")) \) \, $
  where $P$ is the disk Poisson kernel and $t^(upright("ref"))$ is the reflected boundary point. This kernel is nonnegative when $z$ and $t$ are on the same side of the diameter. On any strictly smaller half-disk,
  #[#set math.equation(numbering: n => "(7.34)")
   $ 0 lt.eq K \( z \, t \) lt.eq C K \( z_(*) \, t \) $ <angular:half-disk-kernel>]
  for a fixed interior radial point $z_(*)$ on that side. The assertion follows directly from the Poisson formula: the difference has the product of the two signed distances to the diameter in its numerator, and its remaining denominators are bounded above and below on the smaller disk. If $U gt.eq - C$ on the physical half-disk, the negative part of its semicircle data has a bounded contribution. The formula at $z_(*)$ therefore bounds the positive contribution there, and (7.34) bounds it at all points of the smaller half-disk. Reflection supplies the other half.
  Applying this observation on an intermediate disk inside $D$ bounds $\| U_k \|$ on a smaller closed disk. Thus $f_k$ and $f_k^(- 1)$ are uniformly bounded there. Normal families extend the already chosen interior limit across the edge, and the limit has modulus one on the diameter. This extension is unique, so taking further subsequences does not change it. The left edge is treated with the shifted inversion identity. These two arguments cover every nonzero point of the imaginary axis. ◻
]

=== 7.7 Almost constant low spectral modes <almost-constant-low-spectral-modes>

The outer row products in Theorem 76 damp eigenvalues whose modulus at zero stays below one. We therefore first analyze the complementary spectral subspace, on which that modulus is at least $e^(- s)$. The next lemma shows that its row eigenvalues remain close to one of the two real signs over the full physical angle interval.

#thm([Lemma 7.15.])[
  (Half-annulus and sign estimates).  #emph[There are constants $c_0 \, s_0 \, C > 0$ such that the following holds for $0 < s lt.eq s_0$. Define 
$ cal(A)_s = { w : c_0^(- 1) s < \| w \| < c_0 \/ s } \, #h(2em) cal(A)_s^(+) = overline(cal(A)_s) ∩ { Re w gt.eq 0 } . $

 Every scalar limit in Lemma 80 obeys 
#[#set math.equation(numbering: n => "(7.35)")
 $ C^(- 1) lt.eq \| f \( w \) \| lt.eq C quad \( w in cal(A)_s^(+) \) \, #h(2em) f \( w \) = sigma + O \( s \) quad \( \| w \| = 1 \, med Re w gt.eq 0 \) \, $ <angular:scalar-annulus-bound>]

 where $sigma = "sgn" f \( 1 \)$ and the boundary values use its continuation. The same assertions hold, in operator norm and with a limsup as $k arrow.r oo$, for the diagonal compressions 
$ E_(zeta \, k) \( s \) = upright(bold(1))_({ \| P_zeta \( 0 \) \| gt.eq e^(- s) }) \, #h(2em) p_(zeta \, k) \( w \) = P_zeta \( z \) \|_("ran" E_(zeta \, k) \( s \)) . $

 For the sign assertion, restrict further to either sign of $P_zeta \( 0 \)$. The conclusions also hold for any further spectral restriction. The compressed rows and their inverses are locally bounded in neighborhoods of the two boundary rays of $cal(A)_s$. The same statements apply to the twist $xi$.]
] <angular:half-annulus>

#proof[
  Multiply $f$ by its sign at $1$ and put $a = \| f \( 1 \) \|$. For a nonconstant function, Schwarz–Pick in the right half-plane gives, for $r > 0$,
  $ lr(|frac(sigma f \( r \) - a, 1 - a sigma f \( r \))|) lt.eq t := frac(\| r - 1 \|, r + 1) . $
  Writing the fraction on the left as $h$, one obtains
  $ \| 1 - sigma f \( r \) \| = \( 1 - a \) lr(|frac(1 - h, 1 + a h)|) lt.eq \( 1 - a \) frac(1 + t, 1 - t) lt.eq s max \( r \, r^(- 1) \) . $
  Constant functions satisfy the same conclusion directly. Choose $c_0$ sufficiently small. This estimate excludes zeros on the positive real axis even on an annulus with inner radius $c_0^(- 1) s \/ 4$ and outer radius $4 c_0 \/ s$. Lemma 80 excludes zeros elsewhere in its right half. On that half-annulus, therefore,
  $ U \( w \) := - log \| f \( w \) \| $
  is a nonnegative harmonic function, vanishing on the imaginary-axis boundary segments and extending oddly through them. On the positive real axis the same estimate gives
  #[#set math.equation(numbering: n => "(7.36)")
   $ U \( r \) lt.eq C s max \( r \, r^(- 1) \) . $ <angular:radial-log-bound>]
  Fix $r in \[ c_0^(- 1) s \, c_0 \/ s \]$ and rescale by $r$. A bounded Harnack chain inside ${ 1 \/ 4 < \| w \| < 4 \, med Re w > 0 }$ controls $U$ on the unit semicircle away from its endpoints by $C U \( r \)$. Near either endpoint, use a disk centered on the imaginary axis, of fixed radius after rescaling. Its interior reference point is controlled by the same Harnack chain; the reflected Poisson estimate (7.34), now with nonnegative data on the physical half, controls the smaller half-disk up to the diameter. Consequently
  #[#set math.equation(numbering: n => "(7.37)")
   $ 0 lt.eq U \( w \) lt.eq C s max \( r \, r^(- 1) \) quad \( \| w \| = r \, med Re w gt.eq 0 \) . $ <angular:semicircle-log-bound>]
  The right side is bounded by a fixed constant on the asserted annulus, proving its uniform inverse bound.
  For $r$ in a fixed neighborhood of $1$, the bound is $C s$. After odd reflection it bounds $\| U \|$ in fixed neighborhoods of the two unit semicircle endpoints as well. Harmonic gradient estimates therefore give $\| nabla U \| lt.eq C s$ in a neighborhood of the whole unit semicircle. Choose a branch of $log \( sigma f \)$ in a thin simply connected neighborhood of that semicircle, with value $log a$ at $1$. The Cauchy–Riemann equations identify the modulus of its derivative with $\| nabla U \|$. Integration along the semicircle gives $log \( sigma f \) = O \( s \)$, and hence the second assertion in (7.35).
  We spell out why these scalar arguments are uniform for the growing matrices. If any compressed diagonal norm assertion failed, choose an offending eigenvalue, a point in the indicated compact set, and a subsequence of site numbers. The points have a convergent subsequence. Lemma 80 supplies a scalar limit, including local convergence through an edge when necessary; (7.35) then contradicts the failure. For the sign assertion one first fixes the sign subsequence. The same argument rules out zeros of the finite compressed eigenvalues on the compact half-annulus for all sufficiently large $k$, so that their inverses are defined there. No bound on the number of eigenvalues is used.
  Finally, scalar continuation across an imaginary boundary interval with modulus one is given by Schwarz reflection, $f \( w \) = 1 \/ overline(f \( - overline(w) \))$ on its other side. The just-proved inverse bounds therefore control this continuation near either ray, as well as its inverse. The edge-continuation argument and the same subsequence contradiction give the corresponding local bounds for the finite compressed matrices. One may decrease $c_0$ once to keep all neighborhoods inside the wider annulus used above. ◻
]

=== 7.8 Marker continuation and its two leading modes <marker-continuation-and-its-two-leading-modes>

The diagonal row estimates do not directly bound a marker between the two twist spaces. The fusion identity continues its scalar matrix elements around an annulus. Their Laurent coefficients then separate the leading angular mode from the remainder canceled by a high stencil.

#thm([Lemma 7.16.])[
  (Annular marker continuation).  #emph[Let $E_xi \, E_zeta$ be the low spectral projections from Lemma 81, possibly further spectrally restricted, and put 
$ m_k \( w \) = E_xi M \( z \) E_zeta \, #h(2em) w = e^(upright(i) z) . $

 For any sequence of unit vectors $a_k in "ran" E_xi$ and $b_k in "ran" E_zeta$, one can extract a subsequence for which $chevron.l a_k \, m_k \( w \) b_k chevron.r$ converges on the right half of $cal(A)_s$ to the restriction of a holomorphic function $m$ on the full open annulus $cal(A)_s$. Convergence includes the closed right half of every strictly smaller annulus, using continuation at its imaginary boundary points. The limit satisfies 
#[#set math.equation(numbering: n => "(7.38)")
 $ \| m \( w \) \| lt.eq C \| w \|^(tau rho) #h(2em) \( w in cal(A)_s \) . $ <angular:marker-growth>]

 On the left half-annulus its values are the limits of the same matrix elements of 
#[#set math.equation(numbering: n => "(7.39)")
 $ m_k^(upright("ext")) \( - w \) = - p_(xi \, k) \( w \)^(- 1) m_k \( w \) p_(zeta \, k) \( w \)^(- 1) \, #h(2em) Re w > 0 . $ <angular:external-marker>]

]
] <angular:marker-continuation>

#proof[
  The row bound (7.26), including the scalar factor in $M$, gives
  $ parallel m_k \( w \) parallel lt.eq C \| w \|^(tau rho) $
  on the physical right half-plane. Lemma 81 gives the same limsup bound, up to a constant, for (7.39). Thus the scalar matrix elements of both expressions are normal families on their respective half-annuli. It remains to check that their limits glue through both imaginary rays, including local boundedness there.
  Use $z$ coordinates near $z = v + upright(i) y$. Compressing the fusion identity (7.32) gives
  #[#set math.equation(numbering: n => "(7.40)")
   $ m_k \( z \) p_(zeta \, k) \( z - pi \) + p_(xi \, k) \( z \) m_k \( z - pi \) = o \( 1 \) $ <angular:compressed-gluing>]
  uniformly on compact neighborhoods, in operator norm. Here $m_k \( z \)$ abbreviates the continued compression at argument $z$, and the same convention applies to $p$. The error tends to zero for each fixed $s$ and compact neighborhood. The inversion identity also gives
  $ p_(xi \, k) \( z \) = p_(xi \, k) \( z - pi \)^(- 1) + o \( 1 \) \, $
  and the analogous relation for the other twist. All these inverses are locally bounded by Lemma 81. In a small neighborhood of the edge, one of $z \, z - pi$ is in the physical closed strip. Solving (7.40) for the other marker shows that both continued marker expressions are locally bounded. Solving for $m_k \( z \)$ in particular gives
  $ m_k \( z \) = - p_(xi \, k) \( z - pi \)^(- 1) m_k \( z - pi \) p_(zeta \, k) \( z - pi \)^(- 1) + o \( 1 \) . $
  Since $e^(upright(i) \( z - pi \)) = - e^(upright(i) z)$, this is exactly the compatibility of the physical and external expressions across the upper imaginary ray. Across the lower ray use the same identity with $z + pi$ in place of $z$ and solve in the opposite direction. Again one argument is physical, and inversion produces precisely (7.39).
  Montel’s theorem and a diagonal subsequence over compact sets now give the asserted holomorphic function on the full annulus. This uses scalar matrix elements only: the two twist spaces may have different eigenbases and dimensions tending to infinity. There is no assertion that limits of individual matrix factors can be multiplied. Their finite-dimensional identities and uniform norm bounds are used before taking subsequences. Bound (7.38) follows on each half-annulus from its defining expression, and on the rays by continuation. ◻
]

#thm([Lemma 7.17.])[
  (Low-band estimates).  #emph[For $0 < s lt.eq s_0$, let $E_xi \, E_zeta$ be as in Lemma 82. Uniformly for real $x \, y in \[ - v \, v \]$, 
#[#set math.equation(numbering: n => "(7.41)")
 $ limsup_(k arrow.r oo) parallel E_xi N \( x \) E_zeta parallel & lt.eq C s^(1 - rho) \,\
limsup_(k arrow.r oo) parallel E_xi { N \( x \) - e^(upright(i) tau \( x - y \)) N \( y \) } E_zeta parallel & lt.eq C s^(1 + rho) . $ <angular:low-band-size>]

 The estimates persist if each occurrence of $N$ is multiplied, immediately on each side separately, by a product of an even bounded number of the corresponding twist rows at real arguments in $\[ - v \, v \]$. Each of the four lists has even length; the lists for the two occurrences may differ.]
] <angular:low-band>

#proof[
  Expand the scalar limit in Lemma 82 as $m \( w \) = sum_(j in bb(Z)) b_j w^j$. Cauchy’s estimate on circles just inside the two annular radii, with a fixed proportional margin, gives
  #[#set math.equation(numbering: n => "(7.42)")
   $ \| b_j \| lt.eq C \( C' s \)^(\| j - tau rho \|) . $ <angular:laurent-coefficients>]
  For example, use the outer circle when $j > tau rho$ and the inner circle when $j < tau rho$. Shrinking $s_0$ makes $C' s_0 < 1 \/ 2$. Because $0 < rho < 1 \/ 2$, summing these bounds on the unit circle yields
  #[#set math.equation(numbering: n => "(7.43)")
   $ \| m \( w \) \| & lt.eq C s^rho \,\
frac(m \( w \) - m \( - w \), 2) & = b_tau w^tau + O \( s^(1 + rho) \) \, & \| b_tau \| & lt.eq C s^(1 - rho) . $ <angular:marker-small>]
  Indeed $j = 0$ has exponent $rho$, the nearest nonzero exponent is $1 - rho$, and among odd indices other than $tau$ the smallest exponent is $1 + rho$. The remaining geometric tails are uniform.
  By the arbitrary-unit-vector subsequence argument in Lemma 82, (7.43) gives
  #[#set math.equation(numbering: n => "(7.44)")
   $ limsup_(k arrow.r oo) sup_(\| w \| = 1 \, med Re w gt.eq 0) parallel m_k \( w \) parallel lt.eq C s^rho . $ <angular:compressed-marker-small>]
  The supremum causes no difficulty: choose offending points, pass to a convergent subsequence on the compact semicircle, and use the local uniform convergence, including at its endpoints.
  Further split each low spectral projection according to the sign of $P \( 0 \)$, and first work on one pair of sign blocks, with signs $sigma_xi \, sigma_zeta in { 1 \, - 1 }$. Lemma 81 gives, in limsup uniformly on the physical unit semicircle,
  $ p_(xi \, k) = sigma_xi I + O \( s \) \, #h(2em) p_(zeta \, k) = sigma_zeta I + O \( s \) \, $
  and the same estimates for their inverses. Combining (7.39) and (7.44), every scalar subsequential limit satisfies
  #[#set math.equation(numbering: n => "(7.45)")
   $ m \( - w \) = - sigma_xi sigma_zeta m \( w \) + O \( s^(1 + rho) \) . $ <angular:marker-parity>]
  The compressed anticommutator is exactly
  $ E_xi N \( z \) E_zeta = m_k \( z \) p_(zeta \, k) \( z \) + p_(xi \, k) \( z \) m_k \( z \) . $
  If the signs disagree, its leading terms cancel and it is $O \( s^(1 + rho) \)$ in limsup. If both signs equal $sigma$, (7.45) and (7.43) instead give, in each tested scalar subsequential limit,
  #[#set math.equation(numbering: n => "(7.46)")
   $ E_xi N \( x \) E_zeta = 2 sigma b_tau e^(upright(i) tau x) + O \( s^(1 + rho) \) . $ <angular:leading-mode>]
  This equation denotes the corresponding scalar matrix element, not an identification of spaces of different dimensions. Its leading term has size $O \( s^(1 - rho) \)$ and cancels between $x$ and $y$ after multiplication by $e^(upright(i) tau \( x - y \))$. Applying the same argument to arbitrary sequences of test vectors and of $x \, y$ proves (7.41)–(7.41). Summing the four sign blocks changes the constant only.
  Finally, an even product of at most a fixed number of twist rows equals $I + O \( s \)$ on its sign block, because every factor equals $sigma I + O \( s \)$. Multiplying the compressed anticommutator by such products changes it by at most $C s parallel m_k parallel$ in limsup, hence by $C s^(1 + rho)$. This reasoning is separate for the two terms, so their additional lists need not agree. All these additional rows commute with the spectral projections on their own side. This proves the last assertion. ◻
]

=== 7.9 Damping the remaining spectral bands <damping-the-remaining-spectral-bands>

#proof[
  The row contraction is (7.24). It remains to insert the two outer products in the low-band estimates. For either twist write
  $ h_k = - log \| P \( 0 \) \| \, $
  with value $+ oo$ on the kernel. The spectral projections of $h_k$ commute with every row of their twist. If a band has positive lower endpoint $t$, the at least $n$ zero-argument factors in its outer product give the bound $e^(- n t)$ on that band. The other factors have asymptotic norm at most one. Since their list is finite and fixed while $k arrow.r oo$, the full product has limsup norm at most $e^(- n t)$ there. On a band without a positive lower endpoint its limsup norm is at most one by contraction of all the factors.
  For $n$ large enough, choose $J$ so that $2^J \/ n lt.eq s_0 < 2^(J + 1) \/ n$, and split each side into
  $ I_0 = \( - oo \, 1 \/ n \] \, #h(2em) I_i = \( 2^(i - 1) \/ n \, 2^i \/ n \] quad \( 1 lt.eq i lt.eq J \) \, #h(2em) I_oo = \( 2^J \/ n \, + oo \] . $
  Set $D_0 = 1$ and $D_i = e^(- 2^(i - 1))$ for $i gt.eq 1$. For a pair of finite bands $I_i \, I_j$, apply Lemma 83 with
  $ s = frac(max \( 2^i \, 2^j \), n) . $
  Both band projections are further restrictions of the appropriate low projections. Their outer products contribute $D_i D_j$. For either exponent $a in { 1 - rho \, 1 + rho }$, the triangle inequality therefore bounds the sum of these blocks by
  #[#set math.equation(numbering: n => "(7.47)")
   $ C n^(- a) sum_(i \, j = 0)^J D_i D_j max \( 2^i \, 2^j \)^a lt.eq C_a n^(- a) . $ <angular:dyadic-sum>]
  The infinite double sum converges, since the $D_i$ decrease exponentially in $2^i$. In particular there is no factor counting the number of bands.
  The remainder has $h_k > 2^J \/ n > s_0 \/ 2$ and therefore contributes $e^(- n s_0 \/ 2)$ on its side. Group all blocks with a remainder on the left into a single compression, and then all remaining blocks with a remainder on the right into another. The unrestricted row bounds control $N$ and its two-term difference; contraction controls the outer product on the other side. Thus these two groups together contribute at most $C e^(- n s_0 \/ 2)$ in limsup. Additional bounded row lists cause only a fixed constant, and their low-band contribution was already covered by Lemma 83.
  Taking $a = 1 - rho$ in (7.47) proves the first asserted sandwich bound. Taking $a = 1 + rho$ proves the second, with its phase $e^(upright(i) tau \( x - y \))$ and with independently chosen additional even row lists. The bounded range of smaller $n$ follows directly from contraction of the outer products and the uniform marker bound, after enlarging the constant. At every stage the band decomposition is finite before taking the site-number limsup; only the resulting scalar estimates are then summed and bounded uniformly in $n$. ◻
]

== 8 Physical rows and signed charge comparison <sec:physical>

The finite-circle estimate of Section 7 is normalized by a holomorphic scalar defined on a strip. We first show that this scalar agrees asymptotically with the Perron normalization of physical square-lattice rows. The proof combines a staggered finite matrix calculation with the periodic six-vertex pressure. The disk-derived screen estimates then identify square-plane limits of the reflected diagrams and turn the matrix bounds into current estimates. Finally, the passage and arm estimates control the signed boundary weights in the charge comparison needed for the observable. Throughout this section,

$ pi / 3 < lambda < pi / 2 \, #h(2em) d = 2 cos lambda in \( 0 \, 1 \) \, #h(2em) rho = lambda / pi . $

Circumference limits are always taken with the lattice and every insertion diagram fixed. Mesh limits are taken only afterwards.

=== 8.1 Staggered rows and their positive metric <physical:staggered-rows>

We use the functions $R \, a \, b \, c \, r \, F$ of Section 7, with $pi \/ 3 < lambda < pi \/ 2$, $d = 2 cos lambda$, $rho = lambda \/ pi$, and $v = pi \/ 2$. The finite algebra and estimates below also hold throughout $0 < lambda < pi \/ 2$. In particular,

#[#set math.equation(numbering: n => "(8.1)")
 $ F \( overline(u) \) = overline(F \( u \)) \, #h(2em) F \( lambda - u \) = F \( u \) \, #h(2em) F \( u \) F \( - u \) = r \( u \) . $ <physical:F-identities>]

The last identity continues $F$ to $- lambda < Re u < 0$; reflection about $lambda \/ 2$ continues it past the other edge. These continuations are nonzero in the regions used below.

Put $delta_(*) = lambda \/ 4$. For even $N$, let $cal(H)_N = \( bb(C)^2 \)^(⊗ N)$ and set

#[#set math.equation(numbering: n => "(8.2)")
 $ u_j \( U \) & = U + \( - 1 \)^(j + 1) delta_(*) \, & Phi \( U \) & = F \( U + delta_(*) \) F \( U - delta_(*) \) \,\
T_N^D \( U \) & = "Tr"_p #scale(x: 120%, y: 120%)[\[] D_p R_(p 1) \( u_1 \( U \) \) dots.h.c R_(p N) \( u_N \( U \) \) #scale(x: 120%, y: 120%)[\]] \, & A_(N \, upright("stag"))^D \( z \) & = frac(T_N^D \( rho \( v - z \) \), Phi \( rho \( v - z \) \)^(N \/ 2)) . $ <physical:stagger-arguments>]

The auxiliary space is indexed by $p$ and has dimension two. Let $P_12$ denote the exchange of two spin factors, and define

#[#set math.equation(numbering: n => "(8.3)")
 $ C = P_12 R_12 \( lambda \/ 2 \) \, #h(2em) G_N = product_(j = 1)^(N \/ 2) C_(2 j - 1 \, 2 j) \, #h(2em) chevron.l x \, y chevron.r_(G_N) = x^(*) G_N y . $ <physical:metric>]

Norms and adjoints relative to this inner product are denoted by $parallel dot.op parallel_(G_N)$ and $* G_N$. The four eigenvalues of $C$ are $a_(*) \, a_(*) \, 1 + a_(*) \, 1 - a_(*)$, where $a_(*) = a \( lambda \/ 2 \) = b \( lambda \/ 2 \) = 1 \/ \( 2 cos \( lambda \/ 2 \) \) < 1$. Thus $G_N$ is positive definite. Its condition number need not be bounded as $N$ grows; the estimates below are proved directly in this inner product.

#thm([Lemma 8.1.])[
  (Exchange, adjoint, and strip bound).  #emph[For $x - y = lambda \/ 2$ one has 
#[#set math.equation(numbering: n => "(8.4)")
 $ C_12 R_(p 1) \( x \) R_(p 2) \( y \) C_12^(- 1) = R_(p 1) \( y \) R_(p 2) \( x \) . $ <physical:pair-exchange>]

 For $K \( zeta \) = "diag" \( zeta \, zeta^(- 1) \)$, $\| zeta \| = 1$, put $P_(N \, zeta)^(upright("stag")) = A_(N \, upright("stag"))^(K \( zeta \))$. The family with fixed $zeta$ commutes and satisfies 
#[#set math.equation(numbering: n => "(8.5)")
 $ #scale(x: 120%, y: 120%)[\(] P_(N \, zeta)^(upright("stag")) \( z \) #scale(x: 120%, y: 120%)[\)]^(* G_N) = P_(N \, zeta)^(upright("stag")) \( - overline(z) \) . $ <physical:row-adjoint>]

 It therefore has a common $G_N$-orthonormal eigenbasis. Moreover, 
#[#set math.equation(numbering: n => "(8.6)")
 $ parallel A_(N \, upright("stag"))^D \( z \) parallel_(G_N) lt.eq 2 parallel D parallel \, #h(2em) - v lt.eq Re z lt.eq v . $ <physical:uniform-strip-bound>]

 The constant is independent of even $N$.]
] <physical:exchange-adjoint>

#proof[
  Multiply the Yang–Baxter identity on the two site spaces by their exchange $P_12$. Since this exchange interchanges the site labels, the result is (8.4); invertibility holds at $x - y = lambda \/ 2$ by positivity of $C$.
  We first record the adjoint calculation for arbitrary $D$. Let $J = mat(delim: "(", 0, 1; 1, 0)$ reverse the two basis states of the single auxiliary spin, and put $D^sharp = J overline(D) J$. Taking the ordinary adjoint reverses the site order. Auxiliary transpose reverses it back, because the entries belonging to distinct site spaces commute. Applying $J_p R \( u \)^(t_p) J_p = R \( lambda - u \)$ gives a forward row with arguments $lambda - overline(u_j \( U \))$ and boundary matrix $D^sharp$. These arguments are the exchanged stagger at central argument $lambda - overline(U)$. Applying (8.4) on each complete pair gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ G_N^(- 1) T_N^D \( U \)^(*) G_N = T_N^(D^sharp) \( lambda - overline(U) \) . $ <physical:raw-adjoint>]
  Equation (8.1) gives the same transformation for $Phi$. For a unitary diagonal twist $K \( zeta \)^sharp = K \( zeta \)$, proving (8.5). The usual two-auxiliary Yang–Baxter calculation applies with these fixed site offsets: the difference of the two row arguments is the same at every site, and $K \( zeta \) ⊗ K \( zeta \)$ commutes with the auxiliary intertwiner. Taking the auxiliary traces proves commutativity. The adjoint belongs to the same commuting family, so the family consists of commuting normal matrices in the $G_N$ inner product.
  For the bound, take $Re U = 0$ and write $x = U + delta_(*)$, $y = U - delta_(*)$. Then $overline(x) = - y$ and $overline(y) = - x$. For $E = R_(p 1) \( x \) R_(p 2) \( y \)$, taking the transpose of the exchange identity and using $R \( t \) R \( - t \) = r \( t \) "id"$ gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ E^(* C) E = r \( x \) r \( y \) "id" = \| Phi \( U \) \|^2 "id" . $ <physical:unfused-boundary-unitarity>]
  The last equality follows by multiplying the four factors in $\| F \( x \) F \( y \) \|^2$ and using (8.1). The normalized pair is consequently unitary for the metric $"id"_p ⊗ C$. Embedded in the full space, it is unitary for $"id"_p ⊗ G_N$, since all other factors of $G_N$ act on disjoint sites. The product over pairs has norm one. Auxiliary trace with $D$ costs at most $2 parallel D parallel$, proving the bound on $Re U = 0$. Equation (8.7) proves it on $Re U = lambda$, because $parallel D^sharp parallel = parallel D parallel$.
  For fixed $N$, each normalized matrix entry is bounded as $\| Im U \| arrow.r oo$: each $R$ factor grows at most as $exp \( \| Im U \| \)$, while $log \| F \( U plus.minus delta_(*) \) \| = \| Im U \| + O \( 1 \)$, also on the continued portions by (8.1). The strip maximum principle applied to matrix elements between $G_N$-unit vectors proves (8.6) throughout the strip. ◻
]

=== 8.2 Fusion and exponentially small errors <physical:staggered-fusion>

Use two auxiliary spins, denoted by $p$ and $q$. The invariant line $bb(C) \( \| + - chevron.r + \| - + chevron.r \)$ for $R_(p j) \( u \) R_(q j) \( lambda + u \)$ has scalar block $r \( u \) "id"_j$. On the three-dimensional auxiliary quotient, use the fixed rescaled basis of (7.29) and write

#[#set math.equation(numbering: n => "(8.9)")
 $ Y \( u \) = frac(b \( u \), r \( u \)) cal(L) \( u \) . $ <physical:quotient-Y>]

Thus the two unmixed entries of $cal(L)$ equal $- a$, and its mixed two-by-two blocks are

#[#set math.equation(numbering: n => "(8.10)")
 $ mat(delim: "(", c, sqrt(d); - sqrt(d), - b) \, #h(2em) mat(delim: "(", c, - sqrt(d); sqrt(d), - b) . $ <physical:quotient-blocks>]

All similarities on this quotient depend only on the fixed parameter $lambda$, not on $N$.

#thm([Lemma 8.2.])[
  (Staggered fusion bound).  #emph[Put $phi.alt \( U \) = tan \( pi U \/ \( 2 lambda \) \)$, $alpha = tan \( pi \/ 8 \)$, and 
#[#set math.equation(numbering: n => "(8.11)")
 $ B_(+) \( U \) = frac(phi.alt \( U \) - alpha, 1 - alpha phi.alt \( U \)) \, #h(2em) B_(-) \( U \) = frac(phi.alt \( U \) + alpha, 1 + alpha phi.alt \( U \)) . $ <physical:two-Blaschke-factors>]

 For $\| Re U \| < lambda \/ 2$, the normalized fused quotient product satisfies 
#[#set math.equation(numbering: n => "(8.12)")
 $ ∥product_(j = 1)^N Y_j \( u_j \( U \) \)∥_(G_N) lt.eq C_lambda \| B_(+) \( U \) B_(-) \( U \) \|^(N \/ 2) . $ <physical:fused-error>]

 The norm includes the fixed Euclidean norm on the quotient auxiliary space. In particular the right side tends to zero uniformly on every compact subset of this strip.]
] <physical:fusion-bound>

#proof[
  Applying (8.4) to each auxiliary row separately, and commuting factors acting on disjoint tensor factors before and after each application, exchanges the arguments in a pair of fused site matrices. The invariant line is in the auxiliary spaces, so this identity passes to the quotient. The scalar product $r \( x \) r \( y \)$ is unchanged by exchange. Hence, for $x - y = lambda \/ 2$,
  #[#set math.equation(numbering: n => "(8.13)")
   $ C_12 Y_1 \( x \) Y_2 \( y \) C_12^(- 1) = Y_1 \( y \) Y_2 \( x \) . $ <physical:fused-pair-exchange>]
  We give the reflected inversion identities needed at the two edges. Let $Z \( u \) = Y \( u \)^(t_(upright("aux")))$, where the transpose is in the rescaled three-dimensional auxiliary basis. Direct multiplication of (8.10) gives the meromorphic identities
  #[#set math.equation(numbering: n => "(8.14)")
   $ Y \( u \)^T Y \( - lambda - u \) = "id" \, #h(2em) Z \( u \)^T Z \( lambda - u \) = "id" . $ <physical:quotient-reflections>]
  Here $T$ transposes both auxiliary and site indices. For completeness, if $w = - lambda - u$, then $b \( w \) = - c \( u \)$, $c \( w \) = - b \( u \)$, and $a \( u \) a \( w \) = d - b \( u \) c \( u \)$. A mixed block of $cal(L) \( u \)^T cal(L) \( w \)$ therefore equals $\( d - b c \) "id"$; the product of the scalar factors $b \/ \( a c \)$ is $1 \/ \( a \( u \) a \( w \) \)$. The unmixed entries of $Y \( u \)$ and $Y \( w \)$ are $- b \/ c$ and $- c \/ b$. This proves the first identity. For $w = lambda - u$, one has $a \( w \) = b \( u \)$, $b \( w \) = a \( u \)$, and $c \( u \) c \( w \) = d + a \( u \) b \( u \)$. After a fixed reordering, the mixed blocks of $cal(L)^(t_(upright("aux")))$ have diagonal entries $\( - a \, - b \)$ and opposite off-diagonal entries $plus.minus sqrt(d)$. Their transpose products equal $\( d + a b \) "id"$, canceled by the scalar product $1 \/ \( c \( u \) c \( w \) \)$; the unmixed entries are $b \/ a$ and $a \/ b$. This proves the second identity.
  Write $Q \( U \) = Y_1 \( U + delta_(*) \) Y_2 \( U - delta_(*) \)$ and $Q_s \( U \) = C Q \( U \) C^(- 1)$. If $Re U = - lambda \/ 2$, the first reflection in (8.14) interchanges the two arguments after conjugation. Thus
  $ Q \( U \)^(*) = Q_s \( U \)^(- 1) = C Q \( U \)^(- 1) C^(- 1) \, #h(2em) Q \( U \)^(* C) Q \( U \) = "id" . $
  If $Re U = lambda \/ 2$, put $H \( U \) = Q \( U \)^(t_(upright("aux"))) = Z_2 \( U - delta_(*) \) Z_1 \( U + delta_(*) \)$. The order reversal is legitimate because entries on the two distinct site spaces commute. Transposing the exchange identity gives $C H \( U \) C^(- 1) = Z_2 \( U + delta_(*) \) Z_1 \( U - delta_(*) \)$. The second reflection identity now gives $H \( U \)^(*) = \( C H \( U \) C^(- 1) \)^(- 1)$, hence $H \( U \)^(* C) H \( U \) = "id"$.
  The complete quotient product is therefore unitary in the metric $"id"_(bb(C)^3) ⊗ G_N$ on the left edge. On the right edge its auxiliary transpose, a reversed product of these unitary pairs, is unitary. Undoing a transpose in a three-dimensional tensor factor costs at most three in operator norm. Indeed, its block-matrix expansion and Cauchy–Schwarz give this bound; conjugation by $G_N^(1 \/ 2)$ commutes with auxiliary transpose, so the same bound holds for the present norm. The strip maximum principle yields a uniform bound in between.
  There are no poles from $r \( u_j \( U \) \)$ on this closed strip, since $\| Re u_j \( U \) \| lt.eq 3 lambda \/ 4 < lambda$. Also $Y \( u \)$ has a scalar factor $b \( u \)$ and hence vanishes at $u = 0$. The complete product consequently has a zero of order at least $N \/ 2$ at each of $U = delta_(*)$ and $U = - delta_(*)$. The two functions in (8.11) have precisely these zeros, modulus one on the strip edges, and modulus less than one inside. Dividing the product by $B_(+) \( U \)^(N \/ 2) B_(-) \( U \)^(N \/ 2)$ removes these zeros. For fixed $N$ the quotient remains bounded at the two imaginary ends of the strip, as follows directly from the trigonometric formulas. Applying the maximum principle again proves (8.12). ◻
]

Fix $epsilon.alt in { - 1 \, 1 }$ and unit twists with $zeta \/ xi = - exp \( upright(i) epsilon.alt lambda \)$. As in the homogeneous estimate, take either $D = \| - chevron.r chevron.l + \|$, $tau = epsilon.alt$, or $D = \| + chevron.r chevron.l - \|$, $tau = - epsilon.alt$, and put

#[#set math.equation(numbering: n => "(8.15)")
 $ M_N^(upright("stag")) \( z \) & = e^(upright(i) tau rho z) A_(N \, upright("stag"))^D \( z \) \,\
cal(N)_N^(upright("stag")) \( z \) & = M_N^(upright("stag")) \( z \) P_(N \, zeta)^(upright("stag")) \( z \) + P_(N \, xi)^(upright("stag")) \( z \) M_N^(upright("stag")) \( z \) . $ <physical:marker>]

In the next displays the superscript $upright("stag")$ is omitted. Taking the fused auxiliary trace yields

#[#set math.equation(numbering: n => "(8.16)")
 $ parallel P_(N \, eta) \( z \) P_(N \, eta) \( z - pi \) - "id" parallel_(G_N) & lt.eq C_lambda e_N \( U \) \, quad eta in { xi \, zeta } \,\
parallel M_N \( z \) P_(N \, zeta) \( z - pi \) + P_(N \, xi) \( z \) M_N \( z - pi \) parallel_(G_N) & lt.eq C_lambda \| e^(upright(i) tau rho z) \| e_N \( U \) \,\
e_N \( U \) & = \| B_(+) \( U \) B_(-) \( U \) \|^(N \/ 2) \, #h(2em) U = rho \( v - z \) . $ <physical:inversion>]

Here $\| Re U \| < lambda \/ 2$. To verify the invariant-line contributions, $K \( eta \) ⊗ K \( eta \)$ acts as the identity on that line, while

$ D ⊗ K \( zeta \) + e^(- upright(i) tau lambda) K \( xi \) ⊗ D $

annihilates it by the stated relation between the twists. Moreover, $F \( u \) F \( lambda + u \) = r \( u \)$ follows from (8.1). Thus the line contributes exactly $"id"$ in (8.16) and zero in (8.16); the quotient is bounded by Lemma 85. Preserving or annihilating the line also makes its off-diagonal block disappear under the auxiliary trace. The identities shifted by $pi$ give the corresponding estimates near the other edge of the main strip.

On either vertical edge, (8.5) identifies the two factors in (8.16) as adjoints. They are consequently asymptotically unitary, uniformly on compact edge intervals. Combining this with (8.6) on truncated strips and then letting the truncation height tend to infinity gives

#[#set math.equation(numbering: n => "(8.17)")
 $ limsup_(N arrow.r oo\
N med upright("even")) sup_(x in \[ - v \, v \]) parallel P_(N \, eta)^(upright("stag")) \( x \) parallel_(G_N) lt.eq 1 . $ <physical:asymptotic-contraction>]

Indeed the harmonic measure of the two horizontal sides tends uniformly to zero on the compact real segment; the real endpoints are already controlled by the edge estimate.

=== 8.3 Damping at the physical angles <physical:physical-damping>

#thm([Proposition 8.3.])[
  (Staggered angular estimate).  #emph[ Let $gamma_0 = pi \/ 4$. In the notation (8.15)–(8.15), let $B_(upright("out"))$ and $B_(upright("in"))$ be fixed finite products of $xi$-twist and $zeta$-twist rows, respectively, at real arguments in $\[ - v \, v \]$. Suppose that each product includes at least $n gt.eq 1$ rows at arguments in ${ - gamma_0 \, gamma_0 }$. Uniformly for $x \, y in \[ - v \, v \]$, 
#[#set math.equation(numbering: n => "(8.18)")
 $ limsup_(N arrow.r oo\
N med upright("even")) parallel B_(upright("out")) cal(N)_N^(upright("stag")) \( x \) B_(upright("in")) parallel_(G_N) & lt.eq C_lambda n^(- 1 + rho) \,\
limsup_(N arrow.r oo\
N med upright("even")) parallel B_(upright("out")) #scale(x: 120%, y: 120%)[\(] cal(N)_N^(upright("stag")) \( x \) - e^(upright(i) tau \( x - y \)) cal(N)_N^(upright("stag")) \( y \) #scale(x: 120%, y: 120%)[\)] B_(upright("in")) parallel_(G_N) & lt.eq C_lambda n^(- 1 - rho) . $ <physical:staggered-low>]

 Immediately on either side of either marker sum one may insert a product of an even number of the corresponding twist rows, at arbitrary real arguments in $\[ - v \, v \]$. The products may differ between the two terms; the constant may depend on a common bound for these additional counts. Every finite setup is fixed before the limit in $N$ is taken.]
] <physical:staggered-transfer>

#proof[
  The three changes from the homogeneous argument are the $G_N$ metric, the damping basepoint $e^(upright(i) gamma_0)$, and the two-zero fusion error in (8.12). We give the analytic argument to track these changes explicitly. All diagonalizations and projections in this proof are orthogonal for $G_N$; no comparison with the original Euclidean norm is used. Suppress the superscript $upright("stag")$.
  Map the open $z$ strip to the right half-plane by $w = e^(upright(i) z)$, using the branch with $- v < Re z < v$. In a common eigenbasis of a fixed twist, let $f_N \( w \)$ be any eigenvalue. It is holomorphic and uniformly bounded. The adjoint identity gives $f_N \( overline(w) \) = overline(f_N \( w \))$ and hence $f_N \( 1 \) in bb(R)$. For a fixed small $s > 0$ restrict to eigenvalues satisfying $\| f_N \( e^(upright(i) gamma_0) \) \| gt.eq e^(- s)$. Every sequence has a subsequence converging on compact subsets to a nonzero holomorphic function $f$ with $\| f \| lt.eq 1$. Nonzeroness follows at $e^(upright(i) gamma_0)$, and the bound follows from the edge unitarity and strip bound proved above. Schwarz–Pick between $e^(upright(i) gamma_0)$ and $1$ gives, with $alpha = tan \( gamma_0 \/ 2 \) < 1$,
  #[#set math.equation(numbering: n => "(8.19)")
   $ \| f \( 1 \) \| gt.eq frac(e^(- s) - alpha, 1 - alpha e^(- s)) gt.eq 1 - C_lambda s . $ <physical:damping-Schwarz-Pick>]
  The first inequality is the elementary extremal modulus bound for a disk of pseudohyperbolic radius $alpha$ centered at $f \( e^(upright(i) gamma_0) \)$; take $s$ small enough that $e^(- s) > alpha$. Thus a large eigenvalue at the physical angle is also close in modulus to a real sign at the center.
  The remaining continuation argument uses the same analytic facts as Lemmas 80–83. We verify the correspondence before applying their proofs:
  + The fixed-twist rows are commuting normal holomorphic matrices in the $G_N$ inner product, with adjoint reflection (8.5) and the uniform strip bound (8.6).
  + The two-row and marker inversion errors in (8.16)–(8.16) tend uniformly to zero on compact subsets of the same edge bands $0 < Re z < pi$ and $- pi < Re z < 0$ used in the homogeneous proof. The two zeros in the fused error change its rate of convergence, not these bands or the resulting identities.
  + The marker has the same growth factor $\| w \|^(tau rho)$, and (8.19) bounds the limiting row modulus at $w = 1$ below by $1 - C_lambda s$.
  These are precisely the inputs to the scalar continuation and Laurent estimates. All their finite matrix elements can be taken between $G_N$-unit vectors: the proofs use only the indicated intrinsic norms, not a bounded comparison between $G_N$ and the Euclidean metric.
  Here are their consequences with the present spectral cutoff. Define
  $ E_(eta \, N) \( s \) = upright(bold(1))_({ \| P_(N \, eta) \( gamma_0 \) \| gt.eq e^(- s) }) \, #h(2em) eta in { xi \, zeta } . $
  By the adjoint identity, the moduli at $gamma_0$ and $- gamma_0$ agree on every common eigenvector. The scalar limits on this low subspace are zero-free off the positive real $w$ axis by inversion and Hurwitz’s theorem. Dividing by the analytic square root of the two-row product gives modulus one on each strip edge; the reflected half-disk estimate from Lemma 80 bounds the continued eigenvalues and their inverses there. Thus the scalar limits extend across the two imaginary rays.
  For $sigma = "sgn" f \( 1 \)$, Schwarz–Pick based at $1$ gives
  #[#set math.equation(numbering: n => "(8.20)")
   $ \| f \( r \) - sigma \| lt.eq C_lambda s max \( r \, r^(- 1) \) \, #h(2em) r > 0 . $ <physical:radial-sign-bound>]
  Consequently the half-annulus proof, with $C_lambda s$ in place of $s$, gives bounded inverses on
  #[#set math.equation(numbering: n => "(8.21)")
   $ c_0^(- 1) s < \| w \| < c_0 \/ s \, #h(2em) Re w gt.eq 0 \, $ <physical:low-band-annulus>]
  and the sign estimate
  #[#set math.equation(numbering: n => "(8.22)")
   $ f \( w \) = sigma + O_lambda \( s \) \, #h(2em) \| w \| = 1 \, quad Re w gt.eq 0 . $ <physical:unit-semicircle-sign>]
  The constants absorb this fixed rescaling of $s$. An offending-eigenvalue subsequence would contradict these scalar estimates, so they hold in limsup for the diagonal compressions $p_(eta \, N) = P_(N \, eta) \|_("ran" E_(eta \, N) \( s \))$ as well. For sufficiently small fixed $s$ and all large $N$, their center values are nonzero by (8.19); hence we may refine each projection according to the sign of $P_(N \, eta) \( 0 \)$. Further spectral restrictions preserve every estimate.
  Compress the marker to $m_N = E_(xi \, N) \( s \) M_N E_(zeta \, N) \( s \)$. On the left half of the annulus its continuation is represented, at $- w$ with $Re w > 0$, by
  #[#set math.equation(numbering: n => "(8.23)")
   $ - p_(xi \, N) \( w \)^(- 1) m_N \( w \) p_(zeta \, N) \( w \)^(- 1) . $ <physical:marker-continuation>]
  The marker inversion identity glues this expression to the physical one across both rays, exactly as in Lemma 82. The inverse bounds control its errors. For every sequence of pairs of $G_N$-unit test vectors, Montel’s theorem therefore gives a scalar subsequential limit on the full annulus with $\| m \( w \) \| lt.eq C_lambda \| w \|^(tau rho)$. No products of limiting operators on varying spaces are used.
  Writing $m \( w \) = sum_(j in bb(Z)) beta_j w^j$, Cauchy’s estimates give $\| beta_j \| lt.eq C_lambda \( C_lambda s \)^(\| j - tau rho \|)$ and hence
  #[#set math.equation(numbering: n => "(8.24)")
   $ \| m \( w \) \| lt.eq C_lambda s^rho \, #h(2em) frac(m \( w \) - m \( - w \), 2) = beta_tau w^tau + O_lambda \( s^(1 + rho) \) \, #h(2em) \| beta_tau \| lt.eq C_lambda s^(1 - rho) quad \( \| w \| = 1 \) . $ <physical:Laurent-modes>]
  On equal-sign blocks the marker sum is $2 sigma beta_tau e^(upright(i) tau x) + O_lambda \( s^(1 + rho) \)$; on opposite-sign blocks its two terms cancel to order $O_lambda \( s^(1 + rho) \)$. The arbitrary-unit-vector subsequence argument therefore yields, uniformly for real $x \, y in \[ - v \, v \]$,
  #[#set math.equation(numbering: n => "(8.25)")
   $ limsup_N parallel E_(xi \, N) \( s \) cal(N)_N \( x \) E_(zeta \, N) \( s \) parallel_(G_N) & lt.eq C_lambda s^(1 - rho) \,\
limsup_N parallel E_(xi \, N) \( s \) \( cal(N)_N \( x \) - e^(upright(i) tau \( x - y \)) cal(N)_N \( y \) \) E_(zeta \, N) \( s \) parallel_(G_N) & lt.eq C_lambda s^(1 + rho) . $ <physical:low-band-low>]
  There are only four sign blocks. On each one, an additional bounded even row product is $"id" + O_lambda \( s \)$ by (8.22). Its error times the marker bound is $O_lambda \( s^(1 + rho) \)$. This proves the same estimates with the allowed additional lists, even when the two terms use different lists.
  Finally decompose each side spectrally according to $h_(eta \, N) = - log \| P_(N \, eta) \( gamma_0 \) \|$, assigning value $+ oo$ at a zero. Use the band $\( - oo \, n^(- 1) \]$, successive dyadic bands up to a fixed sufficiently small $s_0$, and the remainder. On a band with positive lower endpoint $t$, each damping row at either physical angle has norm at most $e^(- t)$, since the two moduli agree. Commutativity and (8.17) show that the whole exterior product has limsup norm at most $e^(- n t)$ on that band; on the first band use $1$. For any pair of small bands use (8.25) or (8.25) with $s$ the larger upper endpoint. The double dyadic sum is bounded by $C_lambda n^(- beta)$ for $beta = 1 - rho$ or $1 + rho$, respectively: after writing each upper endpoint as $2^j \/ n$, its summands are bounded by $C_lambda n^(- beta) 2^(beta max \( j \, k \)) e^(- c \( 2^j + 2^k \))$, with the first band interpreted as having no exponential cost. Terms involving a remainder are exponentially small in $n$, by the uniform strip bound and damping at least $e^(- n s_0)$. This proves both assertions. ◻
]

=== 8.4 The two physical steps <physical:physical-steps>

At $z = gamma_0$ the staggered arguments are $lambda \/ 2 \, 0$; at $z = - gamma_0$ they are $lambda \, lambda \/ 2$. Write $R_(*) = R \( lambda \/ 2 \)$, and let the cyclic shift on the spin basis be

$ S \| s_1 \, s_2 \, dots.h \, s_N chevron.r = \| s_2 \, dots.h \, s_N \, s_1 chevron.r . $

For clarity define the unnormalized, untwisted physical rows by

$ sans(T)_N \( + \) = T_N^("id") \( lambda \/ 4 \) \, #h(2em) sans(T)_N \( - \) = T_N^("id") \( 3 lambda \/ 4 \) . $

#thm([Lemma 8.4.])[
  (Physical rows and Perron vectors).  #emph[The physical rows satisfy 
#[#set math.equation(numbering: n => "(8.26)")
 $ sans(T)_N \( + \) = S G_N \, #h(2em) sans(T)_N \( - \) = S^(- 1) G_N . $ <physical:shift-metric-rows>]

 For an arbitrary auxiliary matrix $D$, the marked rows are physical rows with a single seam-edge insertion: 
#[#set math.equation(numbering: n => "(8.27)")
 $ T_N^D \( lambda \/ 4 \) & = D_N sans(T)_N \( + \) \,\
T_N^D \( 3 lambda \/ 4 \) & = \( J D^T J \)_1 sans(T)_N \( - \) \, #h(2em) J = mat(delim: "(", 0, 1; 1, 0) . $ <physical:seam-insertion>]

 The subscript specifies the physical spin factor on which the matrix acts, and $T$ denotes ordinary transpose. With the periodic seam anchored in a fixed physical chart, sites $N$ and $1$ are its two neighboring sites; the insertion support stays fixed as $N$ grows. The untwisted rows $sans(T)_N \( + \)$ and $sans(T)_N \( - \)$ are mutually adjoint for $G_N$, commute, and are normal. Both preserve each total-spin sector and are primitive on that sector. Let $Lambda_N = parallel sans(T)_N \( + \) parallel_(G_N) = parallel sans(T)_N \( - \) parallel_(G_N)$. In every sector whose Perron eigenvalue equals $Lambda_N$, there is a unique positive $G_N$-unit vector $Omega$; it satisfies 
#[#set math.equation(numbering: n => "(8.28)")
 $ S^2 Omega = Omega \, #h(2em) sans(T)_N \( plus.minus \) Omega = Lambda_N Omega \, #h(2em) Omega^(*) G_N S^(plus.minus 1) = Lambda_N Omega^(*) . $ <physical:Perron-shift-identities>]

 All other eigenvalues in such a sector have strictly smaller modulus. The scalar normalization in (8.2) at either physical angle is $F \( lambda \/ 2 \)^(N \/ 2)$.]
] <physical:physical-row-algebra>

#proof[
  We verify the collapse directly in components. Spin labels take values $plus.minus 1$. The collapsed vertices have entries
  $ R \( 0 \)_(p \, d \; q \, c) = upright(bold(1))_(p = c) upright(bold(1))_(d = q) \, #h(2em) R \( lambda \)_(p \, d \; q \, c) = upright(bold(1))_(p = - d) upright(bold(1))_(q = - c) . $
  At the square vertex the equality $a \( lambda \/ 2 \) = b \( lambda \/ 2 \)$ gives
  #[#set math.equation(numbering: n => "(8.29)")
   $ \( R_(*) \)_(- c_0 \, d_0 \; - d_1 \, c_1) = C_(d_0 \, d_1 \; c_0 \, c_1) . $ <physical:matching-kernel>]
  Each identity follows by listing the six nonzero entries of $R$. In the auxiliary trace use indices $p_0 \, p_1 \, dots.h \, p_N = p_0$ so that the site $j$ factor is $\( R \( u_j \) \)_(p_(j - 1) \, d_j \; p_j \, c_j)$. For the positive step the even sites force $p_(2 j - 1) = c_(2 j)$ and $p_(2 j) = d_(2 j)$, giving, with cyclic indices,
  $ \( sans(T)_N \( + \) \)_(d \; c) = product_(j = 1)^(N \/ 2) \( R_(*) \)_(d_(2 j - 2) \, d_(2 j - 1) \; c_(2 j) \, c_(2 j - 1)) = \( G_N \)_(S^(- 1) d \; c) . $
  The last equality uses that $R_(*)$ commutes with exchange of its two spin factors. For the negative step the odd sites force $p_(2 j - 2) = - d_(2 j - 1)$ and $p_(2 j - 1) = - c_(2 j - 1)$; hence
  $ \( sans(T)_N \( - \) \)_(d \; c) = product_(j = 1)^(N \/ 2) \( R_(*) \)_(- c_(2 j - 1) \, d_(2 j) \; - d_(2 j + 1) \, c_(2 j)) = \( G_N \)_(S d \; c) \, $
  by (8.29). All auxiliary labels are fixed in these sums, so neither collapse introduces an additional cycle factor. This proves (8.26).
  For a general auxiliary insertion, leave the trace indices separate and multiply by $D_(p_N \, p_0)$. At the positive step the last collapsed vertex has $p_N = d_N$, so this factor applies $D$ to the last output spin of the untwisted row. At the negative step the first collapsed vertex has $p_0 = - d_1$. Comparing with an untwisted output spin $tilde(d)_1$ gives the factor $D_(- tilde(d)_1 \, - d_1) = \( J D^T J \)_(d_1 \, tilde(d)_1)$. These are the two identities in (8.27).
  The product defining $G_N$ is invariant under translation by two sites, so $\[ G_N \, S^2 \] = 0$. Consequently
  $ \( S G_N \)^(* G_N) = S^(- 1) G_N \, #h(2em) S G_N S^(- 1) G_N = S^(- 1) G_N S G_N . $
  This proves mutual adjointness, commutativity, normality, and equality of the two norms.
  The matrix $C$ preserves the number of positive spins, has positive diagonal entries, and has a positive exchange entry on each unlike pair. Thus a step of $S G_N$ can hold every complete pair or can exchange any chosen subset of its unlike pairs, followed by the cyclic shift. Over $N$ steps, holding all pairs gives the identity permutation. Holding everywhere except for one chosen pair exchange gives any prescribed adjacent transposition: the shifts before and after the exchange move that complete pair to any desired cyclic bond. All the corresponding weights are positive. Adjacent transpositions connect all configurations in a fixed-spin sector, so $S G_N$ is irreducible there. The same argument works with $S^(- 1) G_N$.
  There is also a one-step self-loop in every sector. For a sector with at most $N \/ 2$ positive spins, place them on odd sites and put negative spins on every even site. Exchange each unlike complete pair before applying $S$; the original configuration is recovered. For a sector with more than $N \/ 2$ positive spins, reverse all spins in this construction. For $S^(- 1) G_N$, reverse the roles of the two parities. These self-loops and irreducibility prove primitivity.
  Perron–Frobenius gives a unique positive ray in each sector and strict modulus inequality for its remaining eigenvalues. Normality says that the largest Perron eigenvalue over the sectors equals $Lambda_N$. The operator $S^2$ commutes with $S G_N$ and preserves positivity, so uniqueness of the positive ray makes $S^2 Omega$ a positive multiple of $Omega$. Since $S^2$ has finite order, that multiple equals one. It follows that $S^(- 1) G_N Omega = S^(- 2) \( S G_N \) Omega = Lambda_N Omega$. Taking $G_N$ adjoints and then canceling the invertible rightmost $G_N$ gives the last identity in (8.28). Finally, $F$ is positive on the real interval under consideration; (8.1) gives $F \( 0 \) = F \( lambda \) = 1$. Thus $Phi \( lambda \/ 4 \) = Phi \( 3 lambda \/ 4 \) = F \( lambda \/ 2 \)$, as claimed. ◻
]

For later normalization arguments, the preceding lemma also identifies the finite Schatten moments without a dimension factor. If $mu_1 \, dots.h \, mu_(2^N)$ are the eigenvalues of $sans(T)_N \( + \)$, then for even $M$,

#[#set math.equation(numbering: n => "(8.30)")
 $ "Tr" #scale(x: 120%, y: 120%)[\[] \( sans(T)_N \( + \) sans(T)_N \( - \) \)^(M \/ 2) #scale(x: 120%, y: 120%)[\]] = sum_(j = 1)^(2^N) \| mu_j \|^M \, #h(2em) lim_(M arrow.r oo) "Tr" #scale(x: 120%, y: 120%)[\[] \( sans(T)_N \( + \) sans(T)_N \( - \) \)^(M \/ 2) #scale(x: 120%, y: 120%)[\]]^(1 \/ \( N M \)) = Lambda_N^(1 \/ N) . $ <physical:Schatten-moment>]

The expression on the left, raised to $1 \/ \( N M \)$, decreases in even $M$ because the unnormalized $ell^M$ norm of a finite vector decreases with $M$.

For the remaining square-medium arguments we write $G = G_N$ and $T_N^plus.minus = sans(T)_N \( plus.minus \)$, keeping the circumference implicit in the metric.

=== 8.5 The physical scalar divisor <the-physical-scalar-divisor>

The six-vertex free-energy formula goes back to Lieb and Sutherland #cite(label("Lieb1967FModel")) #cite(label("Sutherland1967SixVertex")). We use the rigorous periodic theorem of Duminil-Copin, Kozlowski, Krachun, Manolescu, and Tikhonovskaia #cite(label("SixVertex2022")) Theorem 1 at the weights below, and prove the further finite-row normalization needed for the current estimates.

Let $a_(*) = sin \( lambda \/ 2 \) \/ sin lambda$. The six-vertex model with paired weights $\( a_(*) \, a_(*) \, 1 \)$ has anisotropy

$ Delta = frac(2 a_(*)^2 - 1, 2 a_(*)^2) = - cos lambda in \( - 1 \/ 2 \, 0 \) . $

The following use of the free-energy theorem concerns only periodic six-vertex boxes, not a random-cluster scaling limit.

#thm([Lemma 8.5.])[
  (The strip divisor and the periodic pressure).  #emph[For the ordinary square-lattice six-vertex model at these weights, the iterated periodic pressure per vertex is 
#[#set math.equation(numbering: n => "(8.31)")
 $ f_(*) = log a_(*) + integral_0^oo frac(sinh \( \( pi - lambda \) t \) tanh \( lambda t \), t sinh \( pi t \)) thin thin upright(d) t = log F \( lambda \/ 2 \) \, $ <physical:free-energy>]

 where $F$ is the strip normalization of Section 7. In particular, a sequence of even periodic rectangles, with both periods tending to infinity, attains this pressure.]
] <physical:pressure>

#proof[
  Theorem 1 of #cite(label("SixVertex2022")), with its parameters
  $ zeta = lambda \, #h(2em) theta = pi \/ 2 \, #h(2em) r = frac(1, 2 cos \( lambda \/ 2 \)) \, $
  has exactly the paired weights $\( a_(*) \, a_(*) \, 1 \)$. Its disordered-regime formula is the first expression in (8.31): the integral over the real line is even and its numerator at $theta = pi \/ 2$ contains $sinh \( lambda t \)$. The theorem supplies the iterated cylinder pressure; choosing the second period sufficiently large for each first period gives the stated sequence. Restricting also the second period to even integers does not change the cylinder Perron limit.
  Here is the identification with $F$, including its normalization. The harmonic function
  $ H \( u \) = log \| F \( u \) \/ a \( u \) \| $
  on $0 < Re u < lambda$ has zero data on the left edge and right-edge data
  $ g \( y \) = log lr(|frac(sin \( lambda + upright(i) y \), sin \( upright(i) y \))|) = integral_0^lambda frac(sin \( 2 alpha \), cosh \( 2 y \) - cos \( 2 alpha \)) thin thin upright(d) alpha . $
  These statements follow from $F \( u \) F \( - u \) = r \( u \)$, the reflection symmetry of $F$, and $\| a \( upright(i) y \) \|^2 = r \( upright(i) y \)$. There is only a logarithmic singularity at the right-edge origin; the imaginary growth is bounded after subtracting $log \| a \|$. Exhaustion by rectangles therefore gives the strip Poisson solution. For the Fourier transform convention $hat(h) \( t \) = integral_(bb(R)) e^(- upright(i) t y) h \( y \) thin thin upright(d) y$, residue integration on a rectangle of imaginary height $pi$ gives
  $ integral_(bb(R)) e^(- upright(i) t y) frac(sin \( 2 alpha \), cosh \( 2 y \) - cos \( 2 alpha \)) thin thin upright(d) y = frac(pi sinh \( \( pi \/ 2 - alpha \) t \), sinh \( pi t \/ 2 \)) . $
  The poles are at $upright(i) alpha$ and $upright(i) \( pi - alpha \)$; the value at $t = 0$ is obtained by continuity. The multiplier from right-edge data to the midpoint is $1 \/ \( 2 cosh \( lambda t \/ 2 \) \)$. Integrating in $alpha$ thus gives
  $ H \( lambda \/ 2 \) = 1 / 4 integral_(bb(R)) frac(cosh \( pi t \/ 2 \) - cosh \( \( pi \/ 2 - lambda \) t \), t sinh \( pi t \/ 2 \) cosh \( lambda t \/ 2 \)) thin thin upright(d) t . $
  Use the difference-of-cosines identity, replace $t$ by $2 t$, and use evenness. This is the integral in (8.31). Since both $F \( lambda \/ 2 \)$ and $a_(*)$ are positive, the asserted equality follows. ◻
]

#thm([Proposition 8.6.])[
  (Vacuum normalization at every circumference).  #emph[Let $T_N^(+) = S G$, $T_N^(-) = S^(- 1) G$ be the untwisted physical rows on an even circle and set $Lambda_N = parallel T_N^(+) parallel_G$. Then 
#[#set math.equation(numbering: n => "(8.32)")
 $ Lambda_N gt.eq F \( lambda \/ 2 \)^(N \/ 2) \, #h(2em) frac(Lambda_N, F \( lambda \/ 2 \)^(N \/ 2)) arrow.r 1 . $ <physical:divisor-comparison>]

 Every fixed finite all-physical sandwich may consequently use one divisor $Lambda_N$ per layer in place of the strip divisor, without changing its operator-norm limsup bound in Proposition 8.3.]
] <physical:vacuum-divisor>

#proof[
  This proof compares finite row norms with the periodic pressure; it does not use a plane limit. For even $N \, M$, the physical indexed torus has partition function
  #[#set math.equation(numbering: n => "(8.33)")
   $ Z_(N \, M) = "Tr" #scale(x: 120%, y: 120%)[\(] \( T_N^(+) T_N^(-) \)^(M \/ 2) #scale(x: 120%, y: 120%)[\)] = Z_(M \, N) . $ <physical:torus-moments>]
  Every second indexed tile is a physical square. On that parity, lifted indices map to ordinary square coordinates by
  $ \( j \, t \) mapsto (frac(j + t - 1, 2) \, frac(j - t - 1, 2)) \, $
  up to the choice of origin. The other indexed tiles identify duplicate spins with weight one. Each collapsed time edge is incident to an uncollapsed neighboring site, so no component consists only of duplicates and no extra cycle factor remains. The indexed periods become
  $ (N / 2 \, N / 2) \, #h(2em) (M / 2 \, - M / 2) . $
  Their determinant has absolute value $N M \/ 2$, the number of physical vertices. Interchanging $N \, M$ reflects this ordinary torus. Since the physical weights have $a = b$, that reflection proves the second equality in (8.33), with all flux sectors retained.
  The two rows commute and are each other’s $G$-adjoints. If their common eigenvalues are $alpha_j \, overline(alpha_j)$, then
  $ Z_(N \, M)^(1 \/ \( N M \)) = (sum_j \| alpha_j \|^M)^(1 \/ \( N M \)) . $
  The unnormalized finite-dimensional $ell^p$ norm decreases with $p$. Thus this expression decreases with even $M$, and by symmetry with even $N$. Moreover,
  $ lim_(M arrow.r oo) Z_(N \, M)^(1 \/ \( N M \)) = Lambda_N^(1 \/ N) . $
  Fix an ordinary periodic $k$-by-$l$ rectangle. Among its seam spin assignments, choose one carrying at least $2^(- 2 \( k + l \))$ of its partition function. Repeating this same assignment glues independent interiors of such rectangles. If both indexed periods are multiples of $2 "lcm" \( k \, l \)$, their two physical period vectors lie in $k bb(Z) times l bb(Z)$. The quotient then contains exactly $N M \/ \( 2 k l \)$ ordinary rectangles, whose opposite seam assignments already agree. Consequently, along this cofinal family,
  $ Z_(N \, M)^(1 \/ \( N M \)) gt.eq (2^(- 2 \( k + l \)) Z_(k \, l)^(upright("ord")))^(1 \/ \( 2 k l \)) . $
  For fixed even $N_0 \, M_0$, choose such $N gt.eq N_0$, $M gt.eq M_0$. Separate monotonicity bounds $Z_(N_0 \, M_0)^(1 \/ \( N_0 M_0 \))$ below by the same right side. Letting $M_0 arrow.r oo$, and then letting $k \, l$ grow along the sequence in Lemma 88, gives $Lambda_(N_0)^(1 \/ N_0) gt.eq F \( lambda \/ 2 \)^(1 \/ 2)$ for every even $N_0$. The asymptotic contraction in (8.17) of the normalized staggered twist row, applied to the untwisted physical step, gives the opposite inequality in the limit for the ratio in (8.32). Thus that ratio tends to one, not merely its $N$-th root.
  The number of rows in each sandwich term is fixed while $N arrow.r oo$. Its products are bounded in the $G$ norm and the change of divisor is $1 + o \( 1 \)$ per row. This remains true when the compared terms have different fixed row counts. Their difference therefore changes by an error tending to zero. ◻
]

=== 8.6 From tori to the square plane <from-tori-to-the-square-plane>

#thm([Proposition 8.7.])[
  (Local plane limits and marked ratios).  #emph[For every fixed finite switch query, its law in ordinary square-lattice domains converges whenever the distance from the query to the boundary tends to infinity, uniformly over planar outer cap partitions. These limits define a unique square-plane switch law. Ordinary and diagonal physical six-vertex tori have the same limits for every fixed finitely supported spin-insertion ratio, whenever both periods tend to infinity. The periods need not have bounded aspect ratio. Here a fixed insertion is a finite product of fixed matrices on physical edges, or a finite linear combination of such products. The torus trace is unrestricted in total spin; a twist winding around a growing period is not a fixed insertion in this statement.]
] <prop:plane-limit>

#proof[
  We first work exclusively in the plane. The screen and collar estimates used here are Propositions 62 and 64. Only full annuli are needed; they have no bank classes, and the surrounding primal circuit determines the boundary partition transmitted toward the query. The bounded collar densities and actual circuit screens of Propositions 47, 62, and 64 give the following uniform statement. For any fixed finite inner query, its conditional law differs by a quantity tending to zero as the surrounding buffer grows, uniformly over planar outside partitions. Indeed couple a common positive part on an intermediate annulus. With a probability bounded below, independent of the two outside partitions, this common part contains an actual primal circuit. Conditioning toward the inside, the circuit induces the same wired boundary there. Iterating in separated collars contracts the range of inner probabilities by a fixed factor, starting from bounded density. Alternating primal and dual circuit screens also imply that no raw strand meeting a fixed query escapes all large buffers. This proves existence, uniqueness, self-duality, and lattice symmetry of the planar local limit.
  It is important not to apply a planar boundary estimate directly to the exterior of a disk in a torus. Instead cut a fundamental chart and remove $O \( N + M \)$ seam edges and vertex identifications. The remaining core is an ordinary plane graph. For any fixed core edge configuration, restoring the seam changes its component count by at most $C \( N + M \)$. Summing over seam edge states changes its weight relative to the free planar-core law by a factor between $exp \( - C \( N + M \) \)$ and $exp \( C \( N + M \) \)$, also after normalization. All constants depend only on the fixed model parameter.
  In the winding expansion an oriented switch loop of total turn $W$ has factor $e^(upright(i) rho W \/ 2)$, with a common factor $a_(*)$ per physical tile; the local orientation sum is $R \( lambda \/ 2 \)$, as verified in Lemma 92 below. A simple contractible loop has turn $plus.minus 2 pi$, while a simple essential loop has turn zero, by isotopy to a straight essential cycle on the flat torus. Summing the two orientations therefore gives loop weights $2 cos \( pi rho \) = d$ and $2$, respectively. To compare with torus FK, thicken the open primal graph. If its total genus is $g$, then $g in { 0 \, 1 }$, and its number of perimeter components is
  $ \| A \| - \| V \| + 2 k \( A \) - 2 g . $
  Thus the FK-to-loop discrepancy, apart from fixed factors, is the bounded genus factor $q^(- g)$ and the essential-loop tilt $\( 2 \/ d \)^(ell_(upright("ess")))$. Each essential strand has length at least a constant times $min \( N \, M \)$; disjointness gives
  $ ell_(upright("ess")) lt.eq C frac(N M, min \( N \, M \)) lt.eq C \( N + M \) . $
  Consequently the complete unmarked spin-loop core law satisfies the same pointwise density comparison with the free planar-core law:
  #[#set math.equation(numbering: n => "(8.34)")
   $ e^(- C \( N + M \)) lt.eq frac(thin upright(d) mu_(N \, M)^(upright(t o r \, c o r e)), thin upright(d) mu_(N \, M)^(upright(p l \, c o r e))) lt.eq e^(C \( N + M \)) . $ <physical:core-density>]
  We next obtain a stronger concentration bound under the planar reference law. Let $h$ be a bounded local switch statistic and write $mu \( h \)$ for its plane mean. For a tolerance $eta > 0$, choose a fixed buffer size $L$ so that every conditional mean of an interior translate of $h$, given the states outside its buffer, is within $eta$ of $mu \( h \)$. This uses only planar outside states. Color the translates into a fixed number $O \( L^2 \)$ of classes having disjoint buffers. In one such class, conditioning on any earlier values of $h$ is a mixture of full outside configurations for the next buffer. Its conditional mean is therefore still within $eta$ of $mu \( h \)$. The elementary bounded-variable exponential estimate, iterated over that class, gives an exponential tail in the number of its translates. Taking the union over the fixed color classes yields
  #[#set math.equation(numbering: n => "(8.35)")
   $ mu_(N \, M)^(upright(p l \, c o r e)) (lr(|overline(h) - mu \( h \)|) > 3 eta) lt.eq C_eta e^(- c_eta N M) $ <physical:planar-concentration>]
  for the average over translates outside the seam buffer. The omitted strip contains $O \( L \( N + M \) \)$ translates. Its fraction tends to zero whenever both periods grow. By (8.34), the same deviation probability under the torus law is bounded by $C_eta exp \( C \( N + M \) - c_eta N M \)$, which tends to zero without an aspect-ratio restriction. Translation invariance and boundedness then give convergence of each unmarked local expectation.
  Finally fix finitely many spin insertions. First take a large fixed buffer containing them. The planar alternating-screen event in that buffer has probability tending to one with its radius, and by the unmarked local convergence the same is true on the torus. On that event all raw strands meeting insertions are local. Summing their orientations makes the insertion ratio a local function of the switches. For $m$ inserted edge matrices, at most $m$ raw loop components meet insertions, and breaking them at the marked edges leaves at most $2 m$ oriented pieces. Summing their orientations bounds the modified numerator by a constant depending on the fixed matrices and $m$. Their unmarked divisors are products of at most $m$ factors, each equal to $d$ or $2$, and are at least $d^m > 0$. Thus the ratio is bounded uniformly in the torus periods. This also treats off-diagonal insertions, including those whose total spin change makes their contraction zero. The complement of the screening event therefore has arbitrarily small contribution. This proves the assertion for marked ratios and for both slicings.
  Fixed displacements of periods and finitely many changed positive time steps in a balanced period alter only bounded-width seams; the same proof applies. A long-time cylinder limit followed by a circumference limit is realized by choosing each time period large enough to approximate its finite-circumference vacuum coefficient. The comparison above is applied along this joint sequence, never with one period fixed. ◻
]

=== 8.7 Reflected ratios and the physical scalar estimate <reflected-ratios-and-the-physical-scalar-estimate>

Let $cal(S)_N$ be the set of total-spin sectors whose Perron eigenvalue is $Lambda_N$, and let $Omega_(N \, sigma)$ be the positive $G_N$-unit Perron vector in sector $sigma$. The physical rows are primitive in each sector, so a long balanced cylinder selects the equally weighted average over these vectors, with one divisor $Lambda_N$ per physical layer.

We first specify the finite exterior networks whose averaged squared-norm ratios have square-plane limits by Proposition 90. At a fixed mesh, let $cal(T)_(upright("in") \, N)$ and $cal(T)_(upright("out") \, N)$ be two fixed finite physical insertion networks with $m_(upright("in"))$ and $m_(upright("out"))$ layers. Their layers are the square-medium steps $plus.minus pi \/ 4$, and their inserted matrices are supported on finitely many physical edges. Read the future network in its actual future orientation and define

#[#set math.equation(numbering: n => "(8.36)")
 $ psi_(upright("in") \, sigma \, N) & = Lambda_N^(- m_(upright("in"))) cal(T)_(upright("in") \, N) Omega_(N \, sigma) \,\
psi_(upright("out") \, sigma \, N) & = Lambda_N^(- m_(upright("out"))) cal(T)_(upright("out") \, N)^(* G_N) Omega_(N \, sigma) \,\
R_(upright("in") \, N) & = frac(1, \| cal(S)_N \|) sum_(sigma in cal(S)_N) parallel psi_(upright("in") \, sigma \, N) parallel_(G_N)^2 \,\
R_(upright("out") \, N) & = frac(1, \| cal(S)_N \|) sum_(sigma in cal(S)_N) parallel psi_(upright("out") \, sigma \, N) parallel_(G_N)^2 . $ <physical:external-states>]

The adjoint in the future vector is the Hilbert-space representation of the physical future covector. Its algebraic factor $G_N^(- 1)$ is not an additional local insertion.

Reflection in a diagonal cut, followed by complex conjugation and arrow reversal, glues a lower state to its reflected upper state through $G_N$. For lower spins $\( c_0 \, c_1 \)$ and upper spins $\( d_0 \, d_1 \)$, the intervening square has weight

$ \( R_(*) \)_(- c_0 \, d_0 \; - d_1 \, c_1) = \( "swap" R_(*) \)_(d_0 \, d_1 \; c_0 \, c_1) \, #h(2em) R_(*) = R \( lambda \/ 2 \) . $

The upper zigzag is the next lower zigzag shifted by one, and

#[#set math.equation(numbering: n => "(8.37)")
 $ Omega_(N \, sigma)^(*) G_N S^(plus.minus 1) = Lambda_N Omega_(N \, sigma)^(*) . $ <physical:left-vacuum>]

This is the left Perron equation from (8.28); the two choices agree because $S^2 Omega_(N \, sigma) = Omega_(N \, sigma)$. For a past state $cal(T) Omega_(N \, sigma)$ formed from $m$ raw layers, the reflected physical diagram therefore has numerator $Lambda_N \( cal(T) Omega_(N \, sigma) \)^(*) G_N \( cal(T) Omega_(N \, sigma) \)$ and divisor $Lambda_N^(2 m + 1)$. The extra numerator factor cancels the extra reflected layer exactly, leaving $parallel Lambda_N^(- m) cal(T) Omega_(N \, sigma) parallel_(G_N)^2$. The future state has the same identity. Averaging identifies each ratio in (8.36) with its finite reflected vacuum coefficient. A string on either side acts on that side’s state; it does not replace the matching kernel or commute through it arbitrarily.

For $x in { - gamma_0 \, gamma_0 }$, $gamma_0 = pi \/ 4$, define rows with one vacuum divisor per physical layer by

#[#set math.equation(numbering: n => "(8.38)")
 $ hat(A)_N^D \( x \) = frac(T_N^D \( rho \( v - x \) \), Lambda_N) \, #h(2em) hat(P)_(eta \, N) \( x \) = hat(A)_N^(K \( eta \)) \( x \) \, #h(2em) hat(M)_N \( x \) = e^(upright(i) tau rho x) hat(A)_N^D \( x \) \, $ <physical:vacuum-rows>]

and put

$ hat(cal(N))_N \( x \) = hat(M)_N \( x \) hat(P)_(zeta \, N) \( x \) + hat(P)_(xi \, N) \( x \) hat(M)_N \( x \) . $

The twists and marker convention are those of (8.15)–(8.15).

#thm([Theorem 8.8.])[
  (Physical scalar estimate).  #emph[Fix an integer $n gt.eq 1$ and, at a fixed mesh, a finite physical-layer setup as above. All layer counts and all inserted edge matrices are fixed before even $N arrow.r oo$. Let $B_(upright("out") \, N)$ and $B_(upright("in") \, N)$ be products of the corresponding $xi$- and $zeta$-twist rows in (8.38), each containing at least $n$ rows. Every row is at a physical angle $plus.minus gamma_0$.]
  #emph[For $x \, y in { - gamma_0 \, gamma_0 }$, define either 
#[#set math.equation(numbering: n => "(8.39)")
 $ cal(D)_N^(upright("low")) & = E_(upright("out") \, N) hat(cal(N))_N \( x \) E_(upright("in") \, N) \,\
cal(D)_N^(upright("high")) & = E_(upright("out") \, N)^x hat(cal(N))_N \( x \) E_(upright("in") \, N)^x - e^(upright(i) tau \( x - y \)) E_(upright("out") \, N)^y hat(cal(N))_N \( y \) E_(upright("in") \, N)^y . $ <physical:physical-low-operator>]

 Each $E$ is a separately even product of at most a fixed $L$ physical rows with the corresponding twist. The lists for the two high terms may differ, but the exterior networks in (8.36) are common to them. Every row in these displays has its own divisor $Lambda_N$. Set, for $a = upright("low") \, upright("high")$, 
#[#set math.equation(numbering: n => "(8.40)")
 $ cal(C)_N^a = frac(1, \| cal(S)_N \|) sum_(sigma in cal(S)_N) ⟨psi_(upright("out") \, sigma \, N) \, B_(upright("out") \, N) cal(D)_N^a B_(upright("in") \, N) psi_(upright("in") \, sigma \, N)⟩_(G_N) . $ <physical:averaged-scalar>]

 Then $cal(C)^a = lim_(N arrow.r oo \, med N med upright("even")) cal(C)_N^a$ and $R_(upright("in")) \, R_(upright("out"))$, the corresponding limits of (8.36), exist. They are the square-plane scalar coefficient and its finite nonnegative reflected vacuum ratios. They satisfy 
#[#set math.equation(numbering: n => "(8.41)")
 $ \| cal(C)^(upright("low")) \| & lt.eq C_(lambda \, L) n^(- 1 + rho) sqrt(R_(upright("out")) R_(upright("in"))) \,\
\| cal(C)^(upright("high")) \| & lt.eq C_(lambda \, L) n^(- 1 - rho) sqrt(R_(upright("out")) R_(upright("in"))) . $ <physical:scalar-low>]

 The analogous fixed-diagram reflection across an ordinary tile-axis cut gives the plane Cauchy–Schwarz inequality with its two reflected ratios.]
] <thm:physical-transfer>

#proof[
  At fixed $N$, primitivity identifies the sector-averaged low coefficient, or each of the two sector-averaged high coefficients separately, with the long balanced-cylinder vacuum coefficient of its physical diagram. Cauchy–Schwarz in $G_N$, followed by Cauchy–Schwarz in the finite sector average, gives
  $ \| cal(C)_N^a \| lt.eq parallel B_(upright("out") \, N) cal(D)_N^a B_(upright("in") \, N) parallel_(G_N) sqrt(R_(upright("out") \, N) R_(upright("in") \, N)) . $
  At either physical angle the strip divisor is $F \( lambda \/ 2 \)^(N \/ 2)$. Thus each row in (8.38) is its normalized staggered row multiplied by $F \( lambda \/ 2 \)^(N \/ 2) \/ Lambda_N$, which tends to one by Proposition 89. Each row list is fixed while $N$ grows. Proposition 8.3 therefore gives the operator limsup $C_(lambda \, L) n^(- 1 + rho)$ or $C_(lambda \, L) n^(- 1 - rho)$. This use of the divisor comparison is asymptotic, including when the two high terms have different row counts.
  For each $N$, choose one sufficiently large balanced time period that approximates this finite set of vacuum coefficients: both scalar terms in the high case and both reflected coefficients. Proposition 90 applies along the resulting joint sequence, since (8.27) puts every row twist or marker on one physical edge. The row counts and all other insertion supports are fixed during this limit, so the diagrams have finitely supported insertions and both periods tend to infinity. A twist on each of finitely many such seam edges is covered by that proposition; no insertion extends around a growing period. It identifies the limits in the statement. In particular the reflected limits are finite, and they are nonnegative as limits of the norm squares in (8.36); this does not assert positivity of individual winding summands. Taking the limit in the preceding Cauchy–Schwarz inequality proves the two bounds.
  For an ordinary tile-axis cut, the untwisted homogeneous row at $u = lambda \/ 2$ is self-adjoint by (7.25). Within each spin sector its matrix has a positive diagonal and positive transitions for adjacent unlike-spin exchanges, obtained by two auxiliary exchanges; these connect the sector, so the row is primitive. Reflection matches the spin coordinates directly. Using its own Perron divisor and the ordinary Hilbert norm gives the same reflected finite identity and sector-averaged Cauchy–Schwarz inequality. The fixed-diagram plane limit then gives the last assertion. ◻
]

The finite staggered proposition retains its arbitrary real spectral arguments and arbitrary vector tests. The plane theorem above concerns only fixed physical-layer diagrams. It allows finitely many seam matrices on finitely many rows, but it supplies no plane interpretation for an arbitrary sequence of $G_N$ vectors, a nonphysical spectral row, or an insertion winding around a growing period. The row lists may grow in a later mesh limit; they are fixed during each circumference limit.

For geometric current stencils, Proposition 121 is the separate finite operator identity. Its common-endpoint construction uses four physical steps in the positive-time direction in each high term: two marker-sum steps and two unmarked before- or after-twist steps. The common external tensors and source phase follow from the finite tangency, tangent-lift, and ice conservation identities. Corollary 122 combines that identity with Theorem 91. Reflection preserves $tau = 1$, so its geometric high-stencil phase is unchanged.

=== 8.8 Winding weights and local caps <winding-weights-and-local-caps>

We next evaluate the loop and boundary-arc weights that enter the signed comparison. These identities are finite orientation sums. Put

#[#set math.equation(numbering: n => "(8.42)")
 $ Delta_0 = frac(pi, 2 lambda) - 3 / 2 \, #h(2em) s = Delta_0 + 1 \, #h(2em) t = - Delta_0 \, #h(2em) w \( m \) = frac(cos \( \( m - 1 / 2 \) lambda \), sin lambda) \, #h(2em) Q = - e^(upright(i) lambda) . $ <physical:charges>]

Traverse a disk boundary with its interior on the left. At port $i$, let $theta_i$ be a lifted inward normal and let $c = plus.minus 1$ denote the inward or outward spin. On an interval $R$ with fixed wire designation use

#[#set math.equation(numbering: n => "(8.43)")
 $ b_i \( c \) = \( 2 sin lambda \)^(- 1 \/ 2) exp {upright(i) c (frac(rho theta_i, 2) + lambda h_i)} \, #h(2em) h_i = H_R + Delta_0 upright(bold(1))_({ i upright(" high") }) . $ <physical:boundary-factors>]

A port is high when the immediately preceding boundary gap has the designated wire color. On a further lap the raw bases $H_R$ compensate the turn of the lifted normal, so the factors have the prescribed periodicity.

#thm([Lemma 8.9.])[
  (The two winding expansions).  #emph[Orient the switch strands and give their turns the weights $exp \( plus.minus upright(i) rho W \/ 2 \)$. With the common coefficient $a_(*)$ for either switch, summing orientations gives the same real tensor $R \( lambda \/ 2 \)$ for either global sign. Thus the two expansions give identical finite contractions with arbitrary prescribed boundary spin factors and edge insertions.]
  #emph[In the plus expansion a boundary disk arc, followed from its earlier port $i$ to its later port $j$, has weight $w \( h_i - h_j \)$. For an even number of wire flips its two possible high statuses give 
#[#set math.equation(numbering: n => "(8.44)")
 $ w \( g + Delta_0 \) = frac(sin \( \( 2 - g \) lambda \), sin lambda) \, #h(2em) w \( g - Delta_0 \) = frac(sin \( \( 1 + g \) lambda \), sin lambda) \, $ <physical:even-flip-weights>]

 where $g$ is the raw base drop. An odd-flip arc has weight $w \( g \)$. The minus expansion has the same rule with $h_i$ replaced by $- h_i - theta_i \/ pi$, and hence with the complementary wire color defining high ports. A diagonal string of charge $a$ multiplies each crossing spin by $e^(upright(i) lambda a c)$, where $c$ is measured along its left normal; its signed intersections shift the corresponding drops, with the reverse convention in the minus expansion.]
] <physical:winding>

#proof[
  At a tile, the oriented tensor vanishes unless there are two incoming arrows. For adjacent incoming arrows one pairing is allowed and its two turns cancel. For opposite incoming arrows the two pairing contributions sum to $2 cos \( lambda \/ 2 \)$. Multiplication by $a_(*) = 1 \/ \( 2 cos \( lambda \/ 2 \) \)$ therefore gives the stated real six-vertex tensor for both signs.
  Close a boundary arc against its forward boundary interval, using the normal endpoint tangents. Its turn is $theta_j - theta_i - pi$. Multiplying its two boundary factors by its plus winding weight and summing its two orientations gives $w \( h_i - h_j \)$; the lifted normal terms cancel. Reversing the winding sign gives exactly the replacement $- h_i - theta_i \/ pi$. Ports inside the child interval pair among themselves. Its endpoint high statuses are consequently opposite for an even number of flips and equal for an odd number. This proves the drop rules, and substitution of $Delta_0$ gives (8.44). The string assertion is the same orientation sum with its extra crossing factors. ◻
]

We call the plus expansion #emph[correct] and the minus expansion #emph[wrong]; these names are kept when all wire colors are reversed. A positive completion pairs successive high–low ports between successive visits of the designated boundary color. The remaining ports are completed planarly, ordinarily by wiring each primal interval separately. Its completed-loop weight is $d^ell$.

#thm([Lemma 8.10.])[
  (Local cap elimination).  #emph[Fix finitely many designated boundary intervals, and consider a family of boundary disk arcs closed under descendants, each with at most one wire flip in its interval. Its cap-loop factors are $d$ for a zero-flip arc beginning high, and $1$ for a zero-flip arc beginning low or an arc containing one flip, up to an aggregate factor $d^(O \( 1 + X \))$. Here $X$ is the number of unremoved arcs, or any passage count dominating their relevant macroscopic portions. The implicit constant may depend on the fixed number of designated intervals. The assertion holds for all $d > 0$.]
] <physical:cap-elimination>

#proof[
  Remove arcs from descendants outward, so the next two endpoints are adjacent among the remaining ports. Joining them makes one completed loop exactly when their exterior partners already pair them; otherwise it reconnects those partners. Within a designated interval, a high–low pair closes one cap loop and a low–high pair transports the same local pattern. Across a flip the equal high statuses transport an unmatched end without closing a loop. If two such transported ends were already tied, the exceptional loop erases an entire remaining designated interval. There are only boundedly many whole-interval erasures. Other cap statuses are inherited unchanged. At the end, each remaining arc accounts for at most a bounded number of unremoved boundary loops. This proves the aggregate error. Changing boundedly many extra ties changes the loop count by only a bounded amount. No sign or positive corner-cost assertion is used. ◻
]

=== 8.9 The local costs <the-local-costs>

Retain the flat-flip costs $P$ and $D_(*)$ of Lemma 7.7. They are computed in fixed buffered flat-wall charts at radius comparable to $n$, measured in lattice steps. Thus $P$ is the logarithm of the probability of an actual arm of the specified color from the gap, and $D_(*) = log bb(E) d^(N_t)$, with $N_t$ the raw local straddles wholly inside its cutoff. For a bulk charge satisfying

$ 0 < a < 1 \, #h(2em) \( 1 + a \) lambda < pi \/ 2 \, $

define

#[#set math.equation(numbering: n => "(8.45)")
 $ u_plus.minus \( a \) = frac(cos \( \( 1 plus.minus a \) lambda \), cos lambda) \, #h(2em) F_plus.minus \( a \; R \) = bb(E) #scale(x: 120%, y: 120%)[\[] u_plus.minus \( a \)^(N \( R \)) #scale(x: 120%, y: 120%)[\]] \, $ <physical:bulk-costs>]

where $N \( R \)$ counts the closed raw loops inside a buffered cutoff of radius $R$ that surround its bulk vertex. We write $F_plus.minus \( a \) = F_plus.minus \( a \; n \)$ when the cutoff is comparable to $n$. All these weights are strictly positive. Fixed changes of cutoff shape or scale, color, lattice symmetry, or allowed caps beyond the buffer change their logarithms by $O \( 1 \)$, by the bounded collar densities of Lemmas 60 and 63 and the tilt estimates. These bounded comparisons count every bank-wire class meeting a chart, including a partial class; their number is fixed by the local feature inventory, and the residual rim caps are separately noncrossing. Only bounded densities are used for the mixed-bank flat-flip comparison. Separated local factors compare in products by conditioning on the other buffered patches. Proposition 70 gives polynomial absolute moments of every fixed power, logarithmic size of the costs, and

#[#set math.equation(numbering: n => "(8.46)")
 $ lr(|log F_plus.minus \( a \; n \) - log F_plus.minus \( a \; n^(1 - epsilon) \)|) lt.eq C epsilon log n + C . $ <physical:cutoff-increment>]

The flat-flip bounds are

#[#set math.equation(numbering: n => "(8.47)")
 $ P lt.eq - c_1 log n + C \, #h(2em) D_(*) gt.eq P + c_2 log n - C \, $ <physical:flip-costs>]

by Lemmas 7.7 and 74, respectively. The region-tree path/cut alternative identifies absence of local straddles with an actual gap arm after a fixed cutoff enlargement, so either version gives these costs.

We use $o \( log n \)$ in one-sided inequalities to mean an allowance $eta log n + C_eta$ for every $eta > 0$. Here is the elementary absorption rule used below. If $X$ has all fixed exponential moments uniformly bounded and $V$ has all fixed absolute moments bounded by powers of $n$, then the contribution of $V$ on $X > delta log n$ is smaller than any prescribed inverse power of $n$. Indeed Cauchy–Schwarz and $bb(P) \( X > x \) lt.eq bb(E) e^(L X) e^(- L x)$ prove this after choosing $L$. On the complement, $C^X lt.eq n^(delta log C)$ and $C^(- X) gt.eq n^(- delta log C)$. Thus such factors cost only $o \( log n \)$ relative to a baseline bounded below by an inverse polynomial. The same rule preserves a fixed polynomial saving if $delta$ is chosen smaller than that saving.

=== 8.10 A charged cylinder below unit loop weight <a-charged-cylinder-below-unit-loop-weight>

The transfer estimate now has the correct physical normalization. To use it for the observable, we also need to control the sign of boundary terms. The next inequality is obtained separately, by comparing the two finite winding expansions of one cylinder and using the passage and arm estimates. Its arm cost and positive nest factor are both retained; these are the factors that enter the observable’s error bound.

#thm([Theorem 8.11.])[
  (Charge budget).  #emph[For any fixed finite list of charges satisfying 
$ a_j > 0 \, #h(2em) \( 1 + a_j \) lambda < pi \/ 2 \, #h(2em) sum_j a_j = 1 \, $

 for every $eta > 0$ there is $C_(eta \, upright(bold(a))) < oo$ such that the local costs obey 
#[#set math.equation(numbering: n => "(8.48)")
 $ P + D_(*) + sum_j log frac(F_(-) \( a_j \), F_(+) \( a_j \)) lt.eq eta log n + C_(eta \, upright(bold(a))) . $ <physical:charge-budget>]

 The assertion is valid for either global wire designation, with the fixed buffered cutoff conventions just specified. Equivalently, the left side has the one-sided $o \( log n \)$ allowance defined above.]
] <thm:charge-budget>

#proof[
  Fix $0 < epsilon < 1 \/ 2$ and put $r = n^(1 - epsilon)$. Use a straight cylinder with even circumference comparable to $n$ and height $K n log n$, where $K$ will be fixed sufficiently large. Place two bottom flips, named $s$ and $t$, a distance of order $n$ apart, and no top flips. The same letters denote their effective drops from (8.42). All bulk endpoints $z_j$ are grouped near the $s$-gap: their heights, pairwise separations, and distances from that gap are comparable to $r$. Give them disjoint cutoff boxes and larger buffers of small fixed fractions of $r$, leaving clear corridors around them. The $t$-cutoff is a small fixed fraction of $n$.
  Choose the two positive cap completions as a paired choice under global color reversal, including any residual planar ties. Thus reversing every designation exchanges the two completed switch laws exactly; it does not change the cylinder or its tile weights.
  Draw strings of charges $- a_j$ from the $s$-gap to $z_j$. Use raw bottom drops $s - 1 \, t$, whose sum is zero, and constant raw base on top. An oriented intersection shifts a correct disk drop by $+ a_j$ if its interval contains the launch and by $- a_j$ if its disk contains the endpoint. Thus the local effective drops are $s \, t$. In the wrong expansion they are $- s \, - t$, with the enclosed endpoint charge added. Figure 8 records the cylinder and the separate arm requirements used below.
  The comparison must keep the local positive weights on the same events throughout the proof. In particular, the possibly small factor from raw straddles at the distant flip will multiply both the positive main event and the exceptional event carrying a negative term. A saving only for their unweighted probabilities would not suffice.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 2.28), (3.895, 4.465), fill: rgb("#f2f2f2"), stroke: none)
  line((0, 0), (3.895, 0), stroke: (thickness: 0.4pt))
  line((0, 5.225), (3.895, 5.225), stroke: (thickness: 0.4pt))
  line((0, 0), (0, 5.225), stroke: (thickness: 0.4pt))
  line((3.895, 0), (3.895, 5.225), stroke: (thickness: 0.4pt))
  line((0, 2.708), (3.895, 2.708), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((0, 3.23), (3.895, 3.23), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((0, 3.752), (3.895, 3.752), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((1.947, 4.18), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$M=(2/d)^(k_0)$]]])])
  content((1.947, 3.23), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[essential raw loops#linebreak()in the empty middle]]])])
  content((1.947, 5.225), [#text(size: 9pt)[no top flips]], anchor: "south")
  line((-0.4275, 0), (-0.4275, 5.225), stroke: (thickness: 0.4pt), mark: (start: "<", end: ">"))
  content((-0.4275, 2.612), [#page_rotate(-90deg)[#text(size: 9pt)[$"Kn" log n$]]], anchor: "south")
  line((0, -0.7125), (3.895, -0.7125), stroke: (thickness: 0.4pt), mark: (start: "<", end: ">"))
  content((1.947, -0.7125), [#text(size: 9pt)[circumference $asymp n$]], anchor: "north")
  circle((0.855, 0), radius: 0.04275, fill: black, stroke: none)
  circle((3.087, 0), radius: 0.04275, fill: black, stroke: none)
  content((0.855, 0), [#text(size: 9pt)[$s$]], anchor: "north")
  content((3.087, 0), [#text(size: 9pt)[$t$]], anchor: "north")
  arc((2.755, 0), start: 180deg, stop: 0deg, radius: 0.3325, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((0.304, 0.494), (0.741, 0.931), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((0.399, 0.589), (0.646, 0.836), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((0.5225, 0.7125), radius: 0.03325, fill: black, stroke: none)
  line((0.855, 0), (0.5225, 0.7125), stroke: (thickness: 0.4pt))
  rect((0.779, 0.779), (1.216, 1.216), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((0.874, 0.874), (1.121, 1.121), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((0.9975, 0.9975), radius: 0.03325, fill: black, stroke: none)
  line((0.855, 0), (0.9975, 0.9975), stroke: (thickness: 0.4pt))
  rect((1.254, 0.4465), (1.691, 0.8835), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((1.349, 0.5415), (1.596, 0.7885), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((1.472, 0.665), radius: 0.03325, fill: black, stroke: none)
  line((0.855, 0), (1.472, 0.665), stroke: (thickness: 0.4pt))
  content((0.9975, 1.615), [#text(size: 9pt)[grouped $z_j$]], anchor: "south")
  content((3.895, 1.805), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#page_rotate(-90deg)[#text(size: 9pt)[identified sides]]]])])
  content((8.645, 5.082), [#text(size: 9pt)[Radial order near $s$#linebreak()\(not Euclidean scale\)]])
  merge-path({arc((6.982, 0.19), start: 180deg, stop: 0deg, radius: 1.662); line((10.31, 0.19), (10.12, 0.19)); arc((10.12, 0.19), start: 0deg, stop: 180deg, radius: 1.472)}, close: true, fill: rgb("#e8e8e8"), stroke: none)
  merge-path({arc((6.431, 0.19), start: 180deg, stop: 0deg, radius: 2.213); line((10.86, 0.19), (10.66, 0.19)); arc((10.66, 0.19), start: 0deg, stop: 180deg, radius: 2.014)}, close: true, fill: rgb("#e8e8e8"), stroke: none)
  line((5.51, 0.19), (12.49, 0.19), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  arc((8.36, 0.19), start: 180deg, stop: 0deg, radius: 0.285, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  arc((7.553, 0.19), start: 180deg, stop: 0deg, radius: 1.092, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  arc((5.605, 0.19), start: 180deg, stop: 0deg, radius: 3.04, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((8.085, 0.6365), (8.407, 0.9595), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((8.151, 0.703), (8.341, 0.893), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((8.246, 0.798), radius: 0.0285, fill: black, stroke: none)
  rect((8.654, 0.76), (8.977, 1.083), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((8.721, 0.8265), (8.911, 1.016), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((8.816, 0.9215), radius: 0.0285, fill: black, stroke: none)
  rect((9.063, 0.494), (9.386, 0.817), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((9.13, 0.5605), (9.319, 0.7505), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((9.224, 0.6555), radius: 0.0285, fill: black, stroke: none)
  circle((8.645, 0.19), radius: 0.04275, fill: black, stroke: none)
  content((8.645, 0.19), [#text(size: 9pt)[$s$]], anchor: "north")
  line((8.645, 0.19), (8.721, 0.304), (8.617, 0.38), (8.702, 0.4655), stroke: (thickness: 1.15pt))
  line((8.018, 1.083), (7.837, 1.425), (7.647, 1.615), (7.695, 1.948), (7.315, 2.137), (7.125, 2.327), (6.973, 2.726), stroke: (thickness: 1.15pt))
  line((9.69, 1.235), (9.709, 1.349), (9.823, 1.368), stroke: (thickness: 0.4pt))
  line((10.07, 1.615), (10.12, 1.767), (10.21, 1.757), stroke: (thickness: 0.4pt))
  content((8.407, 0.4275), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$c_0r$]]])], anchor: "south-east")
  content((7.676, 0.855), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$C_0r$]]])], anchor: "east")
  content((6.317, 2.147), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$c_1n$]]])], anchor: "south-east")
  content((8.977, 1.168), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$z_j$]]])], anchor: "south")
  content((10.59, 2.612), [#text(size: 9pt)[opposite-color#linebreak()marker windows]], anchor: "west")
  line((10.59, 2.327), (10.19, 1.776), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((6.982, 2.774), [#text(size: 9pt)[separate#linebreak()long piece]], anchor: "south-east")
  circle((12.21, 0.19), radius: 0.04275, fill: black, stroke: none)
  arc((11.97, 0.19), start: 180deg, stop: 0deg, radius: 0.2375, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((12.21, 0.19), [#text(size: 9pt)[$t$]], anchor: "north")
  content((8.883, -0.665), [#text(size: 9pt)[$R_( upright(a) "rm"): s arrow.r.long c_0r "and" C_0r arrow.r.long c_1n$]])
})],
    caption: [Figure 8: The charged cylinder and its two separate arm requirements (schematic, not to scale). The vertical sides in the left panel are identified. Endpoints are grouped at scale $r = n^(1 - epsilon)$ near $s$, while $t$ is at distance of order $n$; dotted lines are charge strings, not actual paths. The middle observable counts essential raw loops wholly in its strip, not the actual winding cycle used in the later reconstruction event $E$. On the right, the two solid arm pieces need not be connected. The extra opposite-color marker windows lie strictly between radii $2 C_0 r$ and $c_1 n \/ 2$, away from all conditioned cutoff data. Buffers and the finite endpoint configuration are fixed before the mesh limit; omitted distances and radial ratios are not represented metrically. ],
  ) <fig:charged-cylinder>
  ===== 8.10.1 The sign table. <the-sign-table.>
  For a bottom child disk let $a in \[ 0 \, 1 \]$ be the total endpoint charge in it. Lemma 92 gives the following wrong-expansion numerators, all divided by $sin lambda$:
  #[#set math.equation(numbering: n => "(8.49)")
   $ upright("flips in the child interval") & upright("numerators")\
0 & sin \( \( 2 - a \) lambda \) \, quad sin \( \( 1 + a \) lambda \)\
1 & sin \( a lambda \) quad \( s \) \, quad sin \( \( 2 - a \) lambda \) quad \( t \)\
2 & sin \( \( 3 - a \) lambda \) \, quad sin \( a lambda \) . $ <physical:charged-table>]
  A same-boundary child interval spans less than one period: otherwise its lift and a period translate cannot be disjoint. Thus each flip is counted at most once. Top child disks use the zero-flip row. Contractible wrong-expansion loops have weight $2 cos \( \( 1 - a \) lambda \) > 0$, and essential loops have weight $2 cos \( a lambda \) > 0$. All entries in the table are nonnegative except possibly $sin \( \( 3 - a \) lambda \)$. In particular, we do not discard its sign.
  Let $N_j$ count the prescribed local loops at $z_j$, and let $N_t$ count local $t$-straddles. Set
  $ U_plus.minus = product_j u_plus.minus \( a_j \)^(N_j) \, #h(2em) M = \( 2 \/ d \)^(k_0) \, $
  where $k_0$ counts essential closed loops wholly inside an empty middle strip separated from both ends by enlarged $O \( n \)$ bands. Under either positive cap law, $M gt.eq 1$ and has polynomial moments: the strip is covered by $O \( K log n \)$ fixed-ratio passage bands. Let $cal(T)$ be the event of a raw bottom-to-top through arc. Successive noncontractible actual cycles in separated transverse bands block such an arc, so Propositions 61 and 62 give
  #[#set math.equation(numbering: n => "(8.50)")
   $ bb(P)_plus.minus \( cal(T) \) lt.eq C n^(- c K) . $ <physical:through-rarity>]
  Here $c > 0$ is independent of $K$. On $cal(T)$, there is no essential closed raw loop and hence $M = 1$.
  ===== 8.10.2 Local factors and passage errors. <local-factors-and-passage-errors.>
  Let $Y_plus.minus$ be the spin integrands relative to their corresponding positive cap laws. Let $E$ be the event that the $s$-gap connects actually in its color to a noncontractible cycle near the bottom, before the middle strip. On $E$ no child disk cuts off $s$, and there is no through arc. The isolated local factors, relative to their respective positive cap weights, are
  $ upright("local feature") & Y_(+) & Y_(-)\
upright("loop around ") z_j & u_(+) \( a_j \) & u_(-) \( a_j \)\
s upright("-straddle") & 1 & 0\
t upright("-straddle") & 1 & d\
upright("empty-middle essential loop") & 2 \/ d & 2 \/ d\
upright("disk enclosing ") s upright(" and all endpoints, not ") t & d & 1 . $
  The last row covers the intermediate scales between the grouped endpoints and $t$; its correct factor is at most one. The remaining features are controlled by the passage inventory in the following bounds:
  #[#set math.equation(numbering: n => "(8.51)")
   $ \| Y_(+) \| & lt.eq M U_(+) C^(1 + X) \,\
\| Y_(-) \| & lt.eq M U_(-) d^(N_t) C^(1 + X) \,\
Y_(-) & gt.eq M U_(-) d^(N_t) C^(- \( 1 + X \)) quad upright("on ") E \, $ <physical:correct-majorant>]
  where $X$ has every fixed exponential moment uniformly in $n$. Its passage inventory uses only fixed bottom and top bands, independently of $K$, together with the grouped endpoint patch at scale $r$.
  To prove these bounds, remove locally contained small boundary disks in descendant order, closing the removed family under descendants. Their diameters are less than a small fixed fraction of $n$, so they contain at most one bottom flip. Lemma 93 accounts for all neutral cap factors at aggregate passage cost. In individual cutoff boxes the remaining weights are exactly the displayed $u_plus.minus \( a_j \)$ loop factors and, at $t$, the factor $d$ for each wrong-expansion local straddle. At $s$, a local straddle has wrong weight zero and the correct neutral factor one.
  There is one intermediate-scale case which must not be charged once per scale. A disk enclosing $s$ and all endpoints but not $t$ has correct effective drop $s - 1$, of weight $d lt.eq 1$, and wrong numerator $sin lambda$, of weight one. These factors therefore cause no growing error. If inclusion of the endpoint group disagrees with inclusion of $s$, the arc crosses a join of length $O \( r \)$ from the gap to that group. A nonlocal such arc gives a passage across a fixed proportion of the grouped patch or one of its separated individual patches. The same is true of a nonlocal contractible loop enclosing endpoints, since it separates them from the bottom. Cutoff-edge mismatches give the corresponding buffered patch passages. Genuinely large arcs and essentials outside the empty middle give passages in the large boundary bands, individually. Through-arc weights are bounded before cap normalization by a constant per arc regardless of winding, and each such arc gives a boundary-band passage.
  This is a finite inventory of fixed-shape passage tests at scales $r$ and $n$. Trim one qualifying portion from each raw arc or loop in each test. Distinct raw components have disjoint cut-surface port incidences, and the fixed number of tests bounds the multiplicity of a component. Thus this inventory is bounded by a fixed multiple of the packing sum of Definition 68, plus a fixed constant. Proposition 69 supplies all exponential moments of $X$. On $E$, disks cutting off $s$ are impossible. The remaining table entries form a finite strictly positive set, as the charge list is fixed; the same counting therefore proves the lower bound (8.51). Notice that $d^(N_t)$ has been retained, as is necessary for $d < 1$.
  ===== 8.10.3 A relative saving for negative terms. <a-relative-saving-for-negative-terms.>
  Off $cal(T)$, a nonzero negative integrand requires a two-flip disk omitting some of the nearby charge: with all charge included, the first two-flip numerator is $sin \( 2 lambda \) > 0$. Let $B$ denote occurrence of such a disk, and put $B_0 = B ∩ { Y_(-) eq.not 0 } ∩ cal(T)^c$. Its arc intersects a short join to the endpoint group and travels to distance of order $n$. Both colors have actual traversals along its two sides. Nonzero weight also excludes every pure local $s$-straddle below a sufficiently small multiple of $r$, forcing a short gap arm.
  Choose the constants and buffers of Corollary 66: the disjoint endpoint annuli lie between $c_0 r$ and $C_0 r$, and fixed $0 < c_1 < c_2$ give an injective $s$-centered half-disk of radius $c_2 n$, separated from the $t$-patch and the middle by positive $n$-scale margins. Its half-sector between $c_1 n$ and $c_2 n$ has the required fixed ratio and permitted attachments, counting all bank classes and retaining the residual-cap condition. Let $R_(upright("arm"))$ be the conjunction of an actual gap arm to $c_0 r$ and a separate same-color traversal from $C_0 r$ to $c_1 n$. The event $B_0$ forces these requirements and also opposite-color traversals in $J gt.eq c log \( n \/ r \) - C$ spaced intermediate marker bands.
  Condition on all endpoint-cutoff data, the $t$-cutoff data, and the remote middle-strip states; write this information as $cal(H)$. Use as the reference in that corollary the fixed flat cap law and arm cutoff defining $P \( n \)$. The constants above are chosen so this law agrees with the cylinder graph, odds, and deterministic walls through $c_2 n$, and its full cutoff lies beyond $c_1 n$ with the prescribed buffer. Its reference arm probability is exactly $p_(upright("ref")) = e^(P \( n \))$; changing to another fixed flat cutoff would change $P$ only by $O \( 1 \)$. That corollary, based on Lemma 65, gives
  #[#set math.equation(numbering: n => "(8.52)")
   $ bb(P)_(-) \( E divides cal(H) \) & gt.eq c thin bb(P)_(-) \( R_(upright("arm")) divides cal(H) \) gt.eq c' p_(upright("ref")) = c' e^P \,\
bb(P)_(-) \( B_0 divides cal(H) \) & lt.eq C \( r \/ n \)^gamma bb(P)_(-) \( R_(upright("arm")) divides cal(H) \) $ <physical:arm-main>]
  for a fixed $gamma > 0$. For clarity, the first comparison is relative to the two separate requirements, not an unconditional arm upper bound. Buffered collar densities compare those requirements under the stated conditioning. Their supports avoid the conditioned patches. The two measured blockers can be joined with fixed relative probability through cleared corridors around the finitely many endpoint boxes at scale $r$. Re-search at scale $n$ then joins this arm to a winding cycle before the middle, avoiding $t$. Conversely an ordinary longer arm forces the two requirements, giving the second lower bound. In each marker window the conditional same-color scaffold preserves the required traversal while making a wall-to-wall screen which prevents the opposing marker traversal. Thus each additional opposite marker costs a factor at most $1 - c$, relative to the traversal requirement and with the separated short arm carried along. Iteration over $J$ bands proves (8.52).
  ===== 8.10.4 Comparison of the two expansions. <comparison-of-the-two-expansions.>
  The positive factor $W = M U_(-) d^(N_t)$ is measurable with respect to $cal(H)$. Multiplying the two conditional inequalities by $W$ and averaging gives the relative comparison
  #[#set math.equation(numbering: n => "(8.53)")
   $ bb(E)_(-) \[ W upright(bold(1))_(B_0) \] lt.eq C / c \( r \/ n \)^gamma bb(E)_(-) \[ W upright(bold(1))_E \] . $ <physical:weighted-saving>]
  Thus the negative contribution is compared to the same main event with its full weight $d^(N_t)$, even on states where that factor is small. The bounded cutoff comparisons then give
  #[#set math.equation(numbering: n => "(8.54)")
   $ bb(E)_(-) \[ W upright(bold(1))_E \] gt.eq c \( bb(E)_(-) M \) e^(P + D_(*)) product_j F_(-) \( a_j \; r \) . $ <physical:main-mass>]
  Before passage errors, (8.53) makes the bad contribution smaller than this main mass by the fixed power $n^(- gamma epsilon)$. On the through event, $M = 1$. Its upper bound uses only the fixed feature bands, whose polynomial moment exponents do not depend on $K$. Hölder’s inequality and (8.50) therefore make its absolute contribution negligible after choosing a sufficiently large fixed $K$. The main mass has an inverse-polynomial lower bound whose exponent does not depend on $K$, since $M gt.eq 1$.
  Now hold $K$ and $epsilon$ fixed. The absorption rule removes the factors $C^(plus.minus \( 1 + X \))$ at an arbitrarily small power cost. Choose that power smaller than the saving in (8.52); the negative and through errors remain negligible. Off these errors the wrong expansion is nonnegative, and (8.51) supplies its positive main part. For every sufficiently small $eta > 0$, increasing constants if necessary, equality of the two tensor expansions consequently implies
  $ Z_(-)^(upright("cap")) \( bb(E)_(-) M \) e^(P + D_(*)) product_j F_(-) \( a_j \; r \) lt.eq C_(eta \, epsilon \, K) n^eta Z_(+)^(upright("cap")) \( bb(E)_(+) M \) product_j F_(+) \( a_j \; r \) . $
  Here the correct upper bound follows from (8.51), the same separated-patch comparisons, and absorption. All local lower baselines are inverse polynomials, so the same argument applies to this upper comparison.
  Repeat with both wire polarities reversed on the identical cylinder, using the same strings, cutoffs, drops, and middle observable $M$. The two cap laws are interchanged. Their partition and middle-mean ratios therefore cancel exactly on multiplication. Local costs in the two designations differ by $O \( 1 \)$. Taking logarithms gives
  $ P + D_(*) + sum_j log frac(F_(-) \( a_j \; r \), F_(+) \( a_j \; r \)) lt.eq o \( log n \) . $
  Finally (8.46) changes $r$ to $n$ at cost $O \( epsilon log n + 1 \)$. Given any final tolerance, choose $epsilon$ first sufficiently small and then make the absorption tolerance smaller still. This proves (8.48). ◻
]

== 9 The four-change observable <sec:observable>

We determine the probability of the two connection alternatives in a fixed polygon with four alternating boundary designations. The finite boundary-tree calculation produces a bounded observable and identifies its possible boundary values. Two analytic steps remain: remove a diagonal correction from those values, and prove that every interior limit is holomorphic. Both steps use matched interior and exterior walls, with positive normalizations that retain the growth of local loop weights. The resulting boundary problem has a strictly convex target and determines the connection probability.

The analytic inputs are the disk and screening estimates of Section 6, the local tilt bounds of Section 7, and the physical current and charge estimates of Section 8. The output here is the exact compatible-mesh polygon formula in Theorem 108. Section 10 will transfer it to varying and slit domains.

The four-boundary-change FK-Ising construction of Chelkak and Smirnov #cite(label("ChelkakSmirnov2012")) Section 6 is an antecedent of this auxiliary pairing problem. We give the finite calculation and the below-one analytic estimates needed for the present parameter range.

=== 9.1 The four-mark boundary tree <the-four-mark-boundary-tree>

Fix $0 < q < 1$, $d = sqrt(q) = 2 cos lambda$, and $rho = lambda \/ pi in \( 1 \/ 3 \, 1 \/ 2 \)$. Let $Omega$ be a fixed rational simple orthogonal polygon in tile coordinates. Choose an integer $M gt.eq 1$ such that every wall coordinate belongs to $M^(- 1) bb(Z)$. For $n in M bb(N)$, the sides of $Omega$ are exact tile lines at mesh $n^(- 1)$; use the full whole-tile graph of this exact polygon. All mesh limits in this section are restricted to $n arrow.r oo$ in $M bb(N)$. This compatible sequence is the auxiliary polygon experiment used below.

The distinct ideal marks $p \, b \, c \, d_0$, in counterclockwise order, lie in side interiors. For each ideal mark $v$, choose a flat boundary gap $v_n$ on its side at distance $O \( n^(- 1) \)$. A gap is the visit of a primal or dual corner between two consecutive boundary ports; a port is a tile-side midpoint. For sufficiently large $n$ the four chosen gaps are distinct and retain their cyclic order. The successive boundary intervals $A \, B \, C \, D$, starting at $p_n$, designate colors $frak(A) \, frak(B) \, frak(A) \, frak(B)$, respectively. Either global designation is allowed, with no restriction on corner parities. In finite diagram descriptions we suppress the subscript $n$ on the four gaps; limiting boundary statements refer to the ideal marks.

The local caps on an interval pair the intervening ports between successive visits of its designated color. At a marked gap, count its end visit in exactly the adjacent interval whose designation equals the color of that gap. The last designated visit before the change and the first after it are consecutive, so exactly one adjacent port is left unmatched there. It is the interface end associated with the mark, at distance $O \( n^(- 1) \)$ from the ideal point. Leave these four unmatched ports open. The #emph[open-cap law] gives every resulting closed loop weight $d$, besides the common positive tile coefficients. Completing the four ports changes the loop number by at most two, so this law and either deterministic completion have density ratios bounded above and below by constants depending only on $d$. Write $E_(frak(A))$ for an actual path of color $frak(A)$ from $A$ to $C$, and $E_(frak(B))$ for an actual path of color $frak(B)$ from $B$ to $D$. Such paths use sampled edges, without jumps through a boundary identification. The completion factors here are the two-pairing specialization of the finite FK reweighting in #cite(label("FengPeltolaWu2024FKConnections")) Proposition 4.6, equations (4.17)–(4.19), valid at self-dual weights for every $q > 0$.

Use the parameters of the finite winding calculation,

#[#set math.equation(numbering: n => "(9.1)")
 $ Delta_0 = frac(pi, 2 lambda) - 3 / 2 \, #h(2em) s = Delta_0 + 1 \, #h(2em) t = - Delta_0 \, #h(2em) \( H_A \, H_B \, H_C \, H_D \) = \( s + 1 \, 1 \, s \, 0 \) . $ <obs:bases>]

A port $i$ on $R$ is high if its preceding gap has the designated color of $R$, and $h_i = H_R + Delta_0 upright(bold(1))_({ i upright(" high") })$. Order the ports starting at $p$. On a second lap decrease every raw base by one, compensating the lifted inward normal; in particular the locally forward drop at $p$ is $- s$. Put

#[#set math.equation(numbering: n => "(9.2)")
 $ x = e^(- upright(i) lambda) \, quad y = e^(upright(i) lambda) \, quad P_0 = x^(s + 1) \, quad G_0 = 1 - y^2 \, quad A_R = x^(2 H_R + Delta_0) . $ <obs:tree-normalization>]

For every real $a$, the notation $x^a$ means $e^(- upright(i) lambda a)$. Thus $x^(2 Delta_0) = - y^3$, $d = y + y^(- 1)$, and $P_0 G_0 eq.not 0$.

Ignore internal closed loops and cut the disk along all raw arcs with endpoints on its boundary. The adjacency graph of the resulting regions is a tree: inserting a noncrossing arc splits one existing region into two and adds one edge. Root it at the unique region incident to the gap $p_n$. A vertex has the common color of its boundary-gap visits, and adjacent vertices have opposite colors. A vertex is #emph[wired] if one of its visits belongs to an interval designating that vertex’s color. For a point or boundary gap $z$, let $V \( z \)$ be its region in this tree; internal closed loops do not enter this definition. In finite tree notation a marked subscript $v in { p \, b \, c \, d_0 }$ means the region $V \( v_n \)$. Thus, for example, $H_b$ below means $H_(V \( b_n \))$.

We evaluate a current on this tree using the spin convention of Section 8. Put

$ K \( zeta \) = "diag" \( zeta \, zeta^(- 1) \) \, #h(2em) Q = - e^(upright(i) lambda) \, #h(2em) L_(-) = \| - chevron.r chevron.l + \| . $

Direct a simple tile-edge path $cal(C)$ from $p$ to a lattice vertex $z$. At a crossed tile side the spin is measured along the path’s left normal; matrix row and column indices belong to the right and left tiles, respectively. Choose a continuous tangent lift whose initial value lies strictly between the positive boundary tangent at $p$ and that tangent plus $pi$. The #emph[current primitive] $cal(J) \( cal(C) \)$ sums over one marked step: a mark with tangent lift $alpha$ carries $e^(upright(i) rho alpha) L_(-)$, every earlier step carries $K \( Q \)$, and every later step carries the identity. These matrices are inserted into the ordinary tile tensors. A pure diagonal string has $K \( Q \)$ at every step and no mark. Paths with a common start use ordered lanes, whose order is retained under deformation. The finite deformation and tree-evaluation identities are proved in Appendix 11; the next lemma evaluates this current for the four-mark profile.

#thm([Lemma 9.1.])[
  (Caps, alternatives, and the path evaluation).  #emph[If $cal(I)$ is the number of loops closed by local caps, then 
#[#set math.equation(numbering: n => "(9.3)")
 $ cal(I) = \# { upright("unwired tree vertices") } . $ <obs:loop-count>]

 Exactly one of $E_(frak(A)) \, E_(frak(B))$ occurs. Completing around the separately wired intervals $A \, C$ adds one loop on $E_(frak(A))$ and two on $E_(frak(B))$.]
  #emph[For the edge $e$ associated with an arc from $i$ to $j$, $i < j$, define 
#[#set math.equation(numbering: n => "(9.4)")
 $ m_e = h_i - h_j \, #h(2em) w_e = frac(cos \( \( m_e - 1 / 2 \) lambda \), sin lambda) \, #h(2em) k_e = - frac(cos \( \( m_e + 1 / 2 \) lambda \), sin lambda) \, #h(2em) a_e = x^(h_i + h_j) . $ <obs:edge-weights>]

 Let $cal(P) \( V \)$ be the root-to-$V$ path, with its root order. After dividing by the open-cap weight, define the boundary-arc diagonal factor $D_V$ and the primitive factor $H_V$ by 
#[#set math.equation(numbering: n => "(9.5)")
 $ D_V & = d^(- cal(I)) product_(e in cal(P) \( V \)) k_e product_(e in.not cal(P) \( V \)) w_e \,\
H_V & = d^(- cal(I)) sum_(e in cal(P) \( V \)) a_e product_(f upright(" before ") e) k_f product_(f upright(" not before ") e\
f eq.not e) w_f . $ <obs:D>]

 Here $H_(upright("root")) = 0$; the common primitive marker factor $c_(*) = e^(- upright(i) lambda) \/ \( 2 sin lambda \)$ has been removed. The primitive evaluation to a lattice vertex $z$, with this marker factor removed, is $H_(V \( z \))$. For the full pure $K \( Q \)$ string to $z$, let $N \( z \)$ count the internal raw closed loops surrounding $z$. Its full open-cap ratio is 
#[#set math.equation(numbering: n => "(9.6)")
 $ D_(V \( z \)) \( - 2 \/ d \)^(N \( z \)) . $ <obs:full-diagonal>]

 Thus $D_V$ contains only the boundary-arc contribution. If $e = \( u \, v \)$ is directed from parent to child, the common product $D_e^compose$ with the factor for $e$ omitted obeys 
#[#set math.equation(numbering: n => "(9.7)")
 $ H_v - H_u = a_e D_e^compose \, #h(2em) D_u = w_e D_e^compose \, #h(2em) D_v = k_e D_e^compose . $ <obs:recursion>]

]
] <lem:obs-tree>

#proof[
  Attach a thin annulus carrying the caps and continue the four open ports to its outer boundary. Along each interval, the annulus joins precisely the visits of its designated color to the outer boundary. The other intervening gaps are cut off by the caps. Therefore a raw region remains accessible from the outer boundary exactly when it is wired. An unwired region acquires only the adjacent capped slivers; it neither merges with another raw region nor becomes accessible. After attachment there are two noncrossing open strands. These leave three regions touching the outer boundary, and each additional closed loop adds exactly one region not touching that boundary. This proves (9.3).
  The raw arcs are the perimeters separating the thickened graphs of the two colors. Boundary visits of one color in the same raw region are connected in that graph: trace within its thickening, then retract to edges. Internal closed perimeters only enclose components with no boundary visits, so restoring them cannot split this boundary class. There are exactly two noncrossing pairings of the four open ports. They give, respectively, the actual opposite connection of color $frak(A)$ and of color $frak(B)$; both cannot occur because their endpoints alternate. Against the exterior pairing that wires $A \, C$ separately, the first pairing forms one loop and the second forms two. This proves the connection and completion assertions.
  Lemma 120 gives $w_e$ on an unpassed arc, $k_e$ on a passed arc, and $c_(*) a_e$ on the marked arc of the primitive. For the primitive, an internal loop retains weight $d$ unless it is marked, in which case its contribution is zero; its factors therefore cancel against the open-cap weight. For the full diagonal string, each enclosing internal loop instead contributes the ratio $- 2 \/ d$. Removing those ratios leaves $D_V$, while removing $c_(*)$ from the primitive and dividing the local-cap factors by $d^(cal(I))$ gives (9.5)–(9.5) and (9.6). In the difference $H_v - H_u$, every mark before $e$ has the same factors on both paths. The only new term is the mark on $e$, proving (9.7), including when some $w_e$ vanishes. ◻
]

The finite boundary-tree and four-mark construction follows #cite(label("OpenAIConformalLimits2026")); the identities needed here are proved locally, without importing its probabilistic estimates.

Define the observable and the open-cap connection probability by

#[#set math.equation(numbering: n => "(9.8)")
 $ h_n \( z \) = frac(bb(E)_(upright("open")) H_(V \( z \)), P_0 G_0) \, #h(2em) r_n = bb(P)_(upright("open")) \( E_(frak(A)) \) . $ <obs:observable>]

The calculation below identifies the candidate target vertices of a limit with $r_n arrow.r r$, in marked order $\( p \, b \, c \, d_0 \)$:

$ 0 \, #h(2em) r + d \( 1 - r \) \, #h(2em) r + y \( 1 - r \) \, #h(2em) y \( d r + 1 - r \) . $

The diagonal factor $D_V$ is the obstruction to obtaining the boundary lines directly from the finite observable. We first isolate its role in the exact tree identities. Shielding and normalized cancellation will then give the boundary values, while a separate mixed-current estimate will prove holomorphicity. No analytic property is used in the following calculation.

==== 9.1.1 The marked subtree and its finite algebra <the-marked-subtree-and-its-finite-algebra>

For an edge $e$, let $L \( e \)$ count the marks among $b \, c \, d_0$ in its child boundary interval. They form a consecutive subset; their raw drops are $s \, t \, s$. The endpoint high statuses agree for odd $L \( e \)$ and differ for even $L \( e \)$. Substitution in (9.4), using $Delta_0 lambda = pi \/ 2 - 3 lambda \/ 2$, gives

#[#set math.equation(numbering: n => "(9.9)")
 $ L \( e \) & w_e & k_e\
0 & d \, med 1 & - 1 \, med - d\
1 med \( b upright(" or ") d_0 \) & 1 & 0\
1 med \( c \) & 1 & - d\
2 & 1 \, med d & 0 \, med 1 - d^2\
3 & 0 & 1 $ <obs:table>]

Paired entries list a high first port and a low first port, in that order. For example, the even-$L$ raw base drops are $0 \, 1$, and the odd-$L$ drops are $s \, t \, s + 1$, respectively, which verify every row.

The union of edges with $L \( e \) > 0$ consists of four terminal legs, possibly of zero length, and at most one middle chain. The $p$-leg has $L = 3$ and the other three legs have $L = 1$. A middle chain has $m gt.eq 1$ edges with $L = 2$. It has type $X$ if its descendant marks are $c \, d_0$, so its ports lie on $B \, D$; put $frak(C) = frak(B)$. It has type $Y$ if its descendant marks are $b \, c$, so its ports lie on $A \, C$; put $frak(C) = frak(A)$. These are the only two consecutive two-mark subsets. The nested-or-disjoint property of child intervals rules out any further branch. Number middle nodes $0 \, dots.h \, m$ away from the $p$-leg, and denote their colors by $c_j$. Use $m = 0$ for a shared branch node.

Every leg or branch vertex of the marked subtree visits intervals of both designations and is wired; this remains true when a leg collapses at its mark. An internal middle vertex visits only the two $frak(C)$-intervals. The child of an $L = 0$ edge is unwired exactly when the first port is high. Consequently

#[#set math.equation(numbering: n => "(9.10)")
 $ cal(I) = cal(I)_0 + cal(I)_(upright("mid")) \, #h(2em) cal(I)_(upright("mid")) = \# { 0 < j < m : c_j eq.not frak(C) } \, $ <obs:count-split>]

where $cal(I)_0$ counts high-starting $L = 0$ edges. If $m > 0$, both sides of a middle edge visit both $frak(C)$-intervals, so $E_(frak(C))$ occurs. For $m = 0$, the shared node visits all four intervals and its color is the connected color. A middle edge has $w_e = d$ exactly when its child has color $frak(C)$. Alternating the colors along the chain therefore gives

#[#set math.equation(numbering: n => "(9.11)")
 $ F := d^(- cal(I)_(upright("mid"))) product_(L \( e \) = 2) w_e = cases(delim: "{", d^(upright(bold(1))_({ c_0 eq.not frak(C) })) \, & m > 0 \,, 1 \, & m = 0 .) $ <obs:middle-product>]

Indeed the exponent is the number of $frak(C)$-children minus the number of non-$frak(C)$ internal nodes; successive opposite colors cancel, leaving the displayed endpoint contribution.

Every off-path $L = 0$ edge cancels its local-cap factor. An $L = 0$ branch lies in a single interval $R$. With

#[#set math.equation(numbering: n => "(9.12)")
 $ g_R \( upright("designated color") \) = 1 / 2 \, #h(2em) g_R \( upright("other color") \) = - 1 / 2 \, $ <obs:g>]

its parent and child satisfy

#[#set math.equation(numbering: n => "(9.13)")
 $ k_e / w_e = - d^(g_R \( "col" \( v \) \) - g_R \( "col" \( u \) \)) \, #h(2em) a_e = A_R . $ <obs:tail>]

Thus the diagonal ratios telescope. Two successive primitive increments cancel: their $w$ values alternate $d \, 1$, their $k$ values alternate $- 1 \, - d$, and $A_R \( D_u \/ w_e + D_v \/ w_f \) = 0$ for successive edges $e \, f$.

#thm([Lemma 9.2.])[
  (Marked values, line invariant, and uniform bound).  #emph[Call a tree #emph[typical] if its four terminal legs have positive length. On a typical tree, 
#[#set math.equation(numbering: n => "(9.14)")
 $ D_p = D_b = D_(d_0) = 0 \, #h(2em) frac(H_b, P_0 G_0) = upright(bold(1))_(E_(frak(A))) + d upright(bold(1))_(E_(frak(B))) \, #h(2em) frac(H_(d_0), P_0 G_0) = y #scale(x: 120%, y: 120%)[\(] d upright(bold(1))_(E_(frak(A))) + upright(bold(1))_(E_(frak(B))) #scale(x: 120%, y: 120%)[\)] . $ <obs:marked-values>]

 For each interval $R$, the following expression is constant on its boundary-gap visits: 
#[#set math.equation(numbering: n => "(9.15)")
 $ Re \( H_V \/ A_R \) - c_R \( "col" \( V \) \) D_V \, quad c_R \( upright("designated color") \) = - cos lambda \, quad c_R \( upright("other color") \) = cos \( 2 lambda \) . $ <obs:line-invariant>]

 Define 
#[#set math.equation(numbering: n => "(9.16)")
 $ Gamma \( frak(A) \) = P_0 y^2 \, #h(2em) Gamma \( frak(B) \) = - P_0 y \, #h(2em) H_V^compose = H_V - Gamma \( "col" \( V \) \) D_V \, #h(2em) T = upright(bold(1))_(E_(frak(A))) + y upright(bold(1))_(E_(frak(B))) . $ <obs:corrected>]

 On a typical tree, $H_V^compose = P_0 G_0 T$ along the $c$-leg and all its descendant branches. On gap visits of $B$ its possible values are $H_b \, P_0 G_0 T$, and on those of $C$ they are $H_(d_0) \, P_0 G_0 T$.]
  #emph[There is $C = C \( d \) < oo$ such that, for every finite tree and vertex, including atypical trees, 
#[#set math.equation(numbering: n => "(9.17)")
 $ \| H_V \| + \| D_V \| + \| H_V^compose \| lt.eq C \, #h(2em) \| D_V \| lt.eq C d^(ell_c \( V \)) \, $ <obs:uniform-bound>]

 where $ell_c \( V \)$ is the number of $c$-leg edges passed before $V$.]
] <lem:obs-marked>

#proof[
  An unpassed $p$-leg edge has $w = 0$. It kills every term unless it is the marked edge, and so only the last $p$-leg edge can mark. The first passed $b$- or $d_0$-leg edge has $k = 0$ and kills every later mark. Put $h = H \/ P_0$ temporarily. At node $0$ of a typical tree the last $p$-leg mark gives
  #[#set math.equation(numbering: n => "(9.18)")
   $ D_0 = F \, #h(2em) h_0 = cases(delim: "{", F \, & c_0 = frak(A) \,, - y^3 F \, & c_0 = frak(B) .) $ <obs:branch-values>]
  The first $b$-leg amplitude $a_e \/ P_0$ is $- y^2$ or $y^(- 1)$ as the parent color is $frak(A)$ or $frak(B)$; on the $d_0$-leg these amplitudes are $- y^4$ or $y$. Since $w = 1$, the value beyond that edge is the parent value plus its amplitude times $D$.
  For completeness the entire middle-chain computation is
  #[#set math.equation(numbering: n => "(9.19)")
   $ upright("type") & c_0 & \( h_0 \, D_0 \) & \( h_1 \, D_1 \) & \( h_j \, D_j \) \, med j gt.eq 2\
X & frak(A) & \( d \, d \) & \( d + y \, 1 - d^2 \) & \( y G_0 \, 0 \)\
X & frak(B) & \( - y^3 \, 1 \) & \( y G_0 \, 0 \) & \( y G_0 \, 0 \)\
Y & frak(A) & \( 1 \, 1 \) & \( G_0 \, 0 \) & \( G_0 \, 0 \)\
Y & frak(B) & \( - d y^3 \, d \) & \( - d y^3 - y^2 \, 1 - d^2 \) & \( G_0 \, 0 \) $ <obs:chain-evaluation>]
  The chain amplitude $a_e \/ P_0$ is $y$ in type $X$ and $- y^2$ in type $Y$. Apply (9.7) with the alternating middle entries of (9.9) to obtain each column. Once a zero $k$ is passed, every subsequent value stays fixed. At the near branch, add the $b$ amplitude in type $X$, the $d_0$ amplitude in type $Y$; at the far branch add the other amplitude. If $m = 1$, use column $1$ and the opposite parent color there. The identities
  #[#set math.equation(numbering: n => "(9.20)")
   $ d + \( 2 - d^2 \) y = y G_0 \, #h(2em) - d y^3 - \( 2 - d^2 \) y^2 = G_0 \, #h(2em) y^(- 1) - y^3 = d G_0 \, #h(2em) 1 - y^4 = d y G_0 $ <obs:far-identities>]
  give exactly (9.14). For a shared node use $F = 1$ in (9.18) and add both leg amplitudes; its color gives the connection event. This also verifies that case.
  To prove the line invariant, traverse the gap visits of $R$. Write $r_i = 1$ for a high earlier port $i$ and $r_i = - 1$ for a low one. Its before and after colors satisfy
  #[#set math.equation(numbering: n => "(9.21)")
   $ Re \( a_e \/ A_R \) = cos \( \( m_e - r_i Delta_0 \) lambda \) = c_(upright("after")) k_e - c_(upright("before")) w_e . $ <obs:early-port>]
  For a high port the last expression is $cos \( 2 lambda \) k_e + cos lambda thin w_e = sin \( \( m_e + 3 / 2 \) lambda \)$; for a low port it is $- cos lambda thin k_e - cos \( 2 lambda \) w_e = - sin \( \( m_e - 3 / 2 \) lambda \)$. These are the displayed cosines because $Delta_0 lambda = pi \/ 2 - 3 lambda \/ 2$. At the later port $j$, put $r_j = 1$ if it is high and $r_j = - 1$ if it is low. The traversal is reversed, and the same two product-to-sum identities give
  #[#set math.equation(numbering: n => "(9.22)")
   $ - Re \( a_e \/ A_R \) = - cos \( \( m_e + r_j Delta_0 \) lambda \) = c_(upright("after")) w_e - c_(upright("before")) k_e . $ <obs:late-port>]
  Multiply by the real number $D_e^compose$ and use (9.7). The change in (9.15) is zero at every port. This proves the assertion throughout the interval, also across a polygon corner: its lifted turn was already included in the definition of the arc weight.
  For $R = B \, C$, substitution in (9.2) gives
  #[#set math.equation(numbering: n => "(9.23)")
   $ Re #scale(x: 120%, y: 120%)[\(] Gamma \( "col" \( V \) \) \/ A_R #scale(x: 120%, y: 120%)[\)] = c_R \( "col" \( V \) \) \, #h(2em) d Gamma \( upright("designated color") \) + Gamma \( upright("other color") \) = - A_R . $ <obs:gamma-identities>]
  Equations (9.7) and (9.9) now show that $H^compose$ is unchanged on $L = 0$ edges of $B \, C$. It is also unchanged on a $c$-leg edge: here $w = 1 \, k = - d$ and its amplitude is $A_C$ when the parent is $frak(B)$, and $A_B$ when the parent is $frak(A)$, so the second identity cancels the increment.
  The line directions in normalized coordinates are exactly
  #[#set math.equation(numbering: n => "(9.24)")
   $ frac(upright(i) A_R, P_0 G_0) = frac(1, 2 sin lambda) cases(delim: "{", 1 \, & R = A \,, - y^(- 1) \, & R = B \,, y^2 \, & R = C \,, - y \, & R = D .) $ <obs:directions>]
  Every $c$-leg vertex visits $B$ and $C$. By the line invariant and (9.23), its corrected value lies on the two lines anchored at $H_b$ and $H_(d_0)$ with these directions. They are distinct since $3 lambda - pi in \( 0 \, pi \/ 2 \)$. Their intersection is $P_0 G_0 T$: on $E_(frak(A))$ use $d y - 1 = y^2$, and on $E_(frak(B))$ use $y - d = - y^(- 1)$. Every descendant $L = 0$ branch lies in $B$ or $C$, so it preserves that value. For gap visits of $B$, the only remaining nodes are on a type-$X$ chain; for $C$, they are on a type-$Y$ chain. In (9.19), subtract $Gamma \( c_j \) D_j \/ P_0$ and divide by $G_0$. At node $0$ this is $F$ for color $frak(A)$ and $y F$ for color $frak(B)$; at node $1$ and thereafter it is $T$ whenever it differs from the corresponding marked value. The leg resets and the $L = 0$ cancellation prove the two-value assertions.
  Finally, erase all off-path $L = 0$ factors by (9.10). The normalized full middle product is $F in { 1 \, d }$, and a passed middle prefix is killed by its second edge at latest. Omitting its possible factor $w = d$ costs only $d^(- 1)$. At most one $p$-leg mark survives, and no mark survives after a $b$- or $d_0$-leg reset. On the $c$-leg each passed edge multiplies $D$ by $- d$ and its primitive increments are bounded by a fixed multiple of $1 \, d \, d^2 \, dots.h$. Their sum is at most a fixed multiple of $\( 1 - d \)^(- 1)$. A root path has at most one $L = 0$ suffix after leaving the marked subtree. Its diagonal ratio has absolute value at most $d^(- 1)$ by (9.13), and paired increments cancel, leaving at most one bounded increment. These observations prove both bounds in (9.17). If the $p$-leg collapses, its single possible marked contribution is simply absent; if another leg collapses, its chain is empty. The same estimates therefore hold without typicality. No constant here is asserted to be uniform as $d$ approaches zero or one. ◻
]

=== 9.2 Compactness and boundary shielding <compactness-and-boundary-shielding>

The finite tree bounds become compactness estimates once actual circuits and wall crosscuts shield a small neighborhood from remote boundary arcs. We use the two colors successively under the permitted conditional laws of Section 6.

#thm([Lemma 9.3.])[
  (Continuous limits and shielding).  #emph[The functions $h_n$ are uniformly bounded and asymptotically equicontinuous on every compact subset of $Omega$. Their lattice parities have the same locally continuous subsequential limits. The probability of a typical tree tends to one.]
  #emph[At an unmarked boundary point $u$, including a polygon corner, 
#[#set math.equation(numbering: n => "(9.25)")
 $ lim_(z arrow.r u) limsup_(n arrow.r oo) bb(P)_(upright("open")) #scale(x: 120%, y: 120%)[\(] V \( z \) upright(" has no visit on the interval of ") u #scale(x: 120%, y: 120%)[\)] = 0 . $ <obs:boundary-shield>]

 Here and below the inner limit uses any lattice vertices tending to the fixed macroscopic interior point $z$. Near $b$ and $d_0$, $V \( z \)$ lies beyond a corresponding terminal-leg edge with probability tending to one in this order of limits. Near $p$ an unpassed $p$-leg edge remains with probability tending to one. Near $c$, $V \( z \)$ lies on the $c$-leg or a descendant $L = 0$ branch, and for every fixed integer $m_0 gt.eq 1$, 
#[#set math.equation(numbering: n => "(9.26)")
 $ lim_(z arrow.r c) limsup_(n arrow.r oo) bb(P)_(upright("open")) #scale(x: 120%, y: 120%)[\(] ell_c \( V \( z \) \) < m_0 #scale(x: 120%, y: 120%)[\)] = 0 . $ <obs:c-many-edges>]

]
] <lem:obs-compactness>

#proof[
  We use the actual crossings and buffered routing of Propositions 22, 34, and 61, in the screening form of Proposition 62. The precise consequence needed is as follows: in a fixed-ratio bulk annulus there are two nested actual circuits of opposite colors with conditional probability at least $epsilon.alt > 0$; in a fixed-ratio wall sector there are two successive actual crosscuts of opposite colors between its banks with the same type of lower bound. The bound is uniform over the permitted exterior data of Definition 59; in these fixed wall charts every designated bank class, including a partial interval, is among the bounded named classes. Use disjoint buffers for the two colors, and condition successively; no positive association is used. The constants may depend on the fixed polygon and $d$. All estimates obtained under deterministic completion transfer to the open-cap law by its bounded density ratio.
  Two such wall crosscuts force a raw arc joining the banks between them. To see this, trace their thickened perimeters. The gaps adjacent to the two crosscut ends have opposite colors on each bank, so there is an odd number of ports between those ends. The actual paths prevent a raw strand in this intervening strip from escaping through either crosscut. If no raw strand joined the banks, all the ports on either bank would be paired on that bank, contradicting oddness. Thus at least one joining raw arc separates the deeper neighborhood from the outside. The same argument applies in the finitely many convex or concave corner sectors of the polygon. In the bulk, the nested circuits prevent a raw boundary arc from passing from the inside to the outside.
  Under deterministic caps, for $K$ disjoint scale buffers, conditioning bounds the probability of no successful screen by $\( 1 - epsilon.alt \)^K$. More generally the probability of fewer than $m_0$ successful buffers is at most
  #[#set math.equation(numbering: n => "(9.27)")
   $ sum_(j = 0)^(m_0 - 1) binom(K, j) \( 1 - epsilon.alt \)^(K - j) . $ <obs:screen-tail>]
  Indeed, for each proposed set of at most $m_0 - 1$ successes, require failure on its complement and condition on those disjoint buffers one at a time. The sum tends to zero for fixed $m_0$ as $K arrow.r oo$. For the open-cap law, multiply these upper bounds by its fixed density-comparison constant.
  If two nearby interior vertices belong to different boundary-tree regions, a raw boundary arc intersects a short lattice path between them and continues to the wall. Surround that path by disjoint bulk buffers out to a fixed fraction of its distance from the wall. The preceding bound makes this event uniformly unlikely as their separation tends to zero. The bound on $H$ in (9.17) then gives equicontinuity of its expectation. The same argument allows vertices of different lattice parities. Piecewise interpolation, followed by Arzelà–Ascoli on an exhaustion of interior compact sets, gives the asserted compactness.
  At an ordinary boundary point, a successful local wall screen traps the deeper neighborhood in a disk whose boundary visits belong only to its interval. Every raw region there has a visit on that interval. Taking arbitrarily many buffers between $\| z - u \|$ and a fixed small radius proves (9.25). At a mark, the forced raw arc has the corresponding one-mark descendant interval, except at $p$, where its descendant interval contains $b \, c \, d_0$ and the local neighborhood is on the root side. Hence the asserted edges are passed at $b \, c \, d_0$ and unpassed at $p$. Buffers between a mesh-scale neighborhood of each mark and a fixed radius show that each terminal leg is nonempty with probability tending to one. Finally, take buffers between $\| z - c \|$ and a fixed radius avoiding the other marks. Their successful raw arcs are distinct nested $c$-leg edges, all passed before reaching $V \( z \)$. Equation (9.27) proves (9.26), with the mesh limit taken first. ◻
]

=== 9.3 Matched walls and positive normalizations <obs:paired-walls>

The remaining analytic tasks are to make every limit of $h_n$ holomorphic and to remove the diagonal term in the boundary line invariant. We use a two-source mixed estimate for the first task and a separately normalized diagonal cancellation for the second.

We give a common construction for two plane tensors. The first has a source primitive on each bank of the wall. The second has the full diagonal string from $p$ to $z$ on the interior bank and no exterior marker. A complete wall separates the two positive laws, allowing the first tensor to factor through the observable $h_n$ and the second to isolate the signed diagonal factor. Small gaps will permit reflection and extraction; their effect is compared only after the local positive weights have been included in the denominator.

Throughout this construction $q$, the polygon, and all marked points are fixed. All changes to a plane diagram involve finitely many tiles at each mesh; Proposition 90 supplies the plane law and identifies its finite spin ratios with the winding expansion.

==== 9.3.1 Boundary factors and charge routes <boundary-factors-and-charge-routes>

Put $O = bb(C) \\ overline(Omega)$. Replace each used wall contraction by two copies of the same boundary factor $b_i$, evaluated on the spin relative to the inward normal of its own bank. Designate the opposite wire color on the exterior bank. The high statuses on the two banks then agree. The exterior order from $p$ is $D \, C \, B \, A$, and its normal lift is $theta_O = theta_Omega + pi$, with total turn $- 2 pi$. Since

$ b_i \( c \) = \( 2 sin lambda \)^(- 1 \/ 2) exp { upright(i) c \( rho theta_i \/ 2 + lambda h_i \) } \, $

using the same factor on this bank gives raw bases $H_R - 1 \/ 2$. These are statements about the factors themselves, before either winding expansion is taken.

A directed pure string of charge $a$ contributes $exp \( upright(i) lambda a c \)$ at a crossed spin, where $c = 1$ is the left-normal direction. Write $H^I$ for either of the exterior profiles

#[#set math.equation(numbering: n => "(9.28)")
 $ & D & C & B & A\
H^(upright("src")) & s + 1 & 1 & s & 0\
H^(upright("diag")) & 3 \/ 4 & 1 \/ 2 & 1 \/ 4 & 0 $ <obs:exterior-profiles>]

and put

#[#set math.equation(numbering: n => "(9.29)")
 $ P_R = H_R^I - H_D^I - \( H_R - H_D \) \, #h(2em) R = D \, C \, B \, A . $ <obs:short-strings>]

Run the charge-$P_R$ string forward along a thin exterior strip of $R$, with ends at its two marks. Its interior misses the wall. Sliding it through a complete bank adds $P_R$ to that bank’s raw base. In the source case these charges, in exterior order, are $0 \, - 2 s \, - 2 \( s + t \) \, - 2 \( 2 s + t \)$.

Take two finite lists of numbers $a_j$, each with sum $1$ and

#[#set math.equation(numbering: n => "(9.30)")
 $ 0 < a_j < 1 \, #h(2em) \( 1 + a_j \) lambda < pi \/ 2 . $ <obs:small-charges>]

Such lists exist by taking sufficiently many equal charges. Theorem 94 applies to each list separately. The reason for using two lists is visible in the costs that we will prove below. Their combined charge cost is at most $- 2 \( P + D_(*) \) + o \( log n \)$, where $P \, D_(*)$ are the local costs of Section 8. The diagonal estimate uses the whole cost, whereas reflection averages its contribution by one half:

$ upright("diagonal cancellation") & 3 P + D_(*) - 2 \( P + D_(*) \) = P - D_(*)\
upright("mixed differences") & 3 P + D_(*) - \( P + D_(*) \) = 2 P . $

Lemma 74 gives $P - D_(*) lt.eq - c_2 log n + O \( 1 \)$, while the arm bound of Lemma 7.7 gives $2 P lt.eq - 2 c_1 log n + O \( 1 \)$; both bounds are recorded in (8.47). For mixed differences, this saving pays the losses left after combining the physical extraction powers $\( 1 + rho \) + \( 1 - rho \) = 2$. The normalized cost calculations appear in (9.67) and (9.75); the construction must retain the positive local factors needed for those comparisons.

Index their union in increasing order of scale. From $p$ run strings of charge $- a_j$ to bulk points $w_j in O$ at distances

#[#set math.equation(numbering: n => "(9.31)")
 $ r_j asymp R_0 L^(j - 1) $ <obs:endpoint-scales>]

from a fixed pole $z_(*) in Omega$. They follow one simple outward cut before splitting at their successive scales, and never return near the polygon. Extend the cut notionally to infinity and through $Omega$ to $z_(*)$. Their total charge before splitting is $- 2$. We first choose a sufficiently large fixed $L$; $R_0$ tends to infinity only after the mesh limit.

For the source tensor the second probe lies in a connected simply connected exterior strip along $D$ approaching both $p$ and $d_0$. It stays on the $D$ side of the cut. Thin strips for the short strings are separated at the marks by sector curves, so their sliding homotopies avoid the probe paths. At a common initial edge use parallel lanes in the order specifying the matrix product, placing pure strings on the non-probe side when they separate. The lanes cross one smooth raw strand near a port midpoint; joining them near tile vertices creates no additional strand crossing. These choices give tile paths in fixed homotopy classes with continued turn lifts, also when wall gaps are opened away from the corridors.

For a wall pattern $g$, let $Xi_g^(upright("src")) \( z \, u \)$ contain the two one-source primitives from the two incidences of $p$ to $z$ and $u$, the short strings for $H^(upright("src"))$, and the distant strings just specified. Let $Xi_g^(upright("diag")) \( z \)$ instead contain the full interior $K \( Q \)$ string from $p$ to $z$, no exterior source, and the short strings for $H^(upright("diag"))$ with the same distant strings. At each cut wall side the ordinary contraction is replaced by the two boundary factors above. At a shared edge the ordered lanes specify the order of matrix composition. These prescriptions, together with the ordinary physical tile tensors elsewhere, define the two finite insertions completely.

==== 9.3.2 Positive laws and local normalizations <positive-laws-and-local-normalizations>

Complete the designated primal intervals separately on every wall component. At fixed mesh and fixed insertion data, first divide each modified finite partition in a planar approximation by its uncut finite vacuum partition, including the common tile coefficients. The symbols $Xi_g^(upright("src"))$, $Xi_g^(upright("diag"))$, and $Z_g^(upright("cap"))$ denote the resulting plane limits of those ratios. For the spin tensors, Proposition 90 identifies these with the limits of the same fixed finite-insertion ratios as both torus periods tend to infinity. No symbol denotes an absolute infinite partition. Write $mu_g$ for the resulting positive deterministic-cap law at that fixed mesh; $g = f$ denotes the complete wall. The exact winding identity on finite planar approximations passes to the plane limit as

#[#set math.equation(numbering: n => "(9.32)")
 $ Xi_g / Z_g^(upright("cap")) = bb(E)_(mu_g) cal(O)_g \, $ <obs:diagram-normalization>]

where $cal(O)_g$ is the oriented diagram sum divided, for each pairing, by its deterministic-cap loop weight. Remote unchanged loops have ratio $1$ after summing orientations, as required for this passage by Proposition 90. For a complete wall the positive law factors exactly as $mu_f = mu_(upright("in")) ⊗ mu_(upright("ext"))$: the two raw pairings and their separate cap disks have no shared connection. Here $mu_(upright("ext"))$ is the positive exterior factor with the stated deterministic caps, obtained from those finite capped approximations in the same limit.

We will also use its open-cap version. Re-pairing its four loose ports changes only the completed cycles involving the finitely many boundary-connected components. Let $Delta ell_(upright("ext"))$ be this finite change, open minus deterministic, and put

#[#set math.equation(numbering: n => "(9.33)")
 $ R_(upright("ext")) = d^(Delta ell_(upright("ext"))) \, #h(2em) thin upright(d) mu_(upright(e x t \, o p e n)) = frac(R_(upright("ext")), bb(E)_(mu_(upright("ext"))) R_(upright("ext"))) thin thin upright(d) mu_(upright("ext")) . $ <obs:exterior-open-law>]

The change is bounded by two in absolute value. This definition does not subtract total counts of possibly infinitely many exterior loops.

In disjoint buffered boxes of radius a fixed small fraction of $r_j$, let $N_j$ count raw closed loops surrounding $w_j$ and wholly inside the box. Set

#[#set math.equation(numbering: n => "(9.34)")
 $ U = product_j u_(+) \( a_j \)^(N_j) \, #h(2em) u_(+) \( a \) = frac(cos \( \( 1 + a \) lambda \), cos lambda) > 0 . $ <obs:distant-tilt>]

For the diagonal tensor additionally use

#[#set math.equation(numbering: n => "(9.35)")
 $ U_z = \( 2 \/ d \)^(N_0 \( z \)) \, #h(2em) V_(upright("wt")) = w \( 1 \/ 4 \)^(sum_(nu = 1)^4 N_nu^(upright("ext"))) \, $ <obs:diagonal-tilts>]

where $N_0 \( z \)$ uses the interior cutoff of radius $"dist" \( z \, partial Omega \) \/ 8$, and $N_nu^(upright("ext"))$ counts local exterior straddles at the four flat changes in separated cutoff patches. All cutoffs have clear buffers. If a wall interval of length comparable to $h$ is removed, a tip is one end of a surviving bank ray. Let $N_(upright("tip"))$ count raw arcs between the two banks of that ray, around the tip and wholly in a small cutoff box of scale $h$. Put

#[#set math.equation(numbering: n => "(9.36)")
 $ T_g = product_(upright("tips")) \( cot lambda \)^(N_(upright("tip"))) \, #h(2em) T_f = 1 $ <obs:tip-tilt>]

for a complete wall. A true corner gap removes comparable lengths on both incident sides; its two tips therefore have disjoint buffered cutoffs. Retained gaps retain their factors in $T_f$.

Fix $sigma \( frak(A) \) = 1$ and $sigma \( frak(B) \) = - 1$, and put $epsilon.alt_n \( z \) = sigma \( "col" \( z \) \)$ for a lattice vertex. On the complete wall, the closed-loop parity in Lemma 120 gives

#[#set math.equation(numbering: n => "(9.37)")
 $ epsilon.alt_n \( z \) \( - 1 \)^(N \( z \)) = sigma \( "col" \( V \( z \) \) \) . $ <obs:parity-sign>]

The two normalized tensors are

#[#set math.equation(numbering: n => "(9.38)")
 $ cal(H)_g \( z \, u \) & = frac(Xi_g^(upright("src")) \( z \, u \), Z_g^(upright("cap")) bb(E)_(mu_g) \[ U T_g \]) \,\
cal(R)_g \( z \) & = frac(epsilon.alt_n \( z \) Xi_g^(upright("diag")) \( z \), Z_g^(upright("cap")) bb(E)_(mu_g) \[ U_z U V_(upright("wt")) T_g \]) . $ <obs:source-normalization>]

Thus on the complete wall $epsilon.alt_n \( z \)$ converts the sign of the full diagonal factor (9.6) to the signed tree convention $sigma \( "col" \( V \( z \) \) \) D_(V \( z \))$. It is the same in the gapped and filled conventions.

Figure 9 shows the bank convention and the local gap geometry used below.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.7, 4.5), [#text(size: 9pt)[Matching factors on distinct banks]])
  content((2.7, 3.7), [#text(size: 9pt)[exterior bank $O$]])
  content((2.7, 1), [#text(size: 9pt)[interior bank $Omega$]])
  line((0, 2.23), (2.1, 2.23), stroke: (thickness: 0.8pt))
  line((3.3, 2.23), (5.4, 2.23), stroke: (thickness: 0.8pt))
  line((0, 2.37), (2.1, 2.37), stroke: (thickness: 0.8pt))
  line((3.3, 2.37), (5.4, 2.37), stroke: (thickness: 0.8pt))
  line((2.1, 2.23), (2.1, 2.37), stroke: (thickness: 0.4pt))
  line((3.3, 2.23), (3.3, 2.37), stroke: (thickness: 0.4pt))
  rect((1.85, 2.05), (2.35, 2.55), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((3.05, 2.05), (3.55, 2.55), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((0.95, 2.37), radius: 0.035, fill: black, stroke: none)
  circle((0.95, 2.23), radius: 0.035, fill: black, stroke: none)
  line((0.95, 2.4), (0.95, 3.05), stroke: (thickness: 0.4pt), mark: (end: ">"))
  line((0.95, 2.2), (0.95, 1.55), stroke: (thickness: 0.4pt), mark: (end: ">"))
  content((0.9, 2.85), [#text(size: 9pt)[$b_i$]], anchor: "east")
  content((0.9, 1.75), [#text(size: 9pt)[$b_i$]], anchor: "east")
  content((3.1, 3.1), [#text(size: 9pt)[equal high status]])
  line((2.1, 1.7), (3.3, 1.7), stroke: (thickness: 0.4pt), mark: (start: "<", end: ">"))
  content((2.7, 1.7), [#text(size: 9pt)[gap length $asymp h$]], anchor: "north")
  content((2.7, 0.15), [#text(size: 9pt)[Banks drawn apart;#linebreak()no ties across the wall.]])
  circle((9, 2.15), radius: 0.9, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((9, 2.15), radius: 1.35, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  circle((9, 2.15), radius: 1.85, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((6.6, 2.21), (8.6, 2.21), stroke: (thickness: 1.0pt))
  line((6.6, 2.09), (8.6, 2.09), stroke: (thickness: 1.0pt))
  line((8.94, 2.55), (8.94, 4.2), stroke: (thickness: 1.0pt))
  line((9.06, 2.55), (9.06, 4.2), stroke: (thickness: 1.0pt))
  line((8.6, 2.09), (8.6, 2.21), stroke: (thickness: 0.4pt))
  line((8.94, 2.55), (9.06, 2.55), stroke: (thickness: 0.4pt))
  line((8.6, 2.15), (9, 2.15), (9, 2.55), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((8.44, 1.99), (8.76, 2.31), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  rect((8.84, 2.39), (9.16, 2.71), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((9.68, 1.6), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$r_1$]]])], anchor: "north-west")
  content((10.03, 1.33), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$r_2$]]])], anchor: "north-west")
  content((10.43, 1.01), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[$r_3$]]])], anchor: "north-west")
  line((8.6, 1.79), (9, 1.79), stroke: (paint: rgb("#808080"), thickness: 0.4pt), mark: (start: "<", end: ">"))
  line((9.36, 2.15), (9.36, 2.55), stroke: (paint: rgb("#808080"), thickness: 0.4pt), mark: (start: "<", end: ">"))
  content((9, 4.5), [#text(size: 9pt)[A true-corner gap]])
  content((9, 0.03), [#text(size: 9pt)[$h << r_1 << r_2 << r_3 << 1$]], anchor: "north")
})],
  caption: [Figure 9: Paired walls and the local geometry of gap closure. Each surviving wall has distinct interior and exterior bank incidences, opposite wire designations, and matching factors $b_i$ evaluated with their own normals. Opening a straight gap produces two separately buffered tips; at a true corner, comparable lengths are removed on both incident sides. The dotted corner records where the filled wall would lie and supplies no connection or boundary segment for a Jordan closure. The nested radii satisfy $h lt.double r_1 lt.double r_2 lt.double r_3 lt.double 1$, with the mesh limit taken before gap closure. All geometry is schematic. ],
) <fig:paired-walls>

#prodef([Remark 9.4.])[
  (Positive normalization and passage errors).  For any positive $A$, writing $nu_A = A mu \/ bb(E)_mu A$ gives the exact identity
  $ frac(bb(E)_mu cal(O), bb(E)_mu A) = bb(E)_(nu_A) \( cal(O) \/ A \) . $
  Consequently an exceptional event is discarded under the tilted law, using moments of $cal(O) \/ A$; its unweighted probability alone does not control a normalized signed tensor.
  We will also use the following elementary quantitative form. Suppose $Y_n gt.eq 0$, $bb(E) Y_n gt.eq C^(- 1) n^(- a)$, $bb(E) Y_n^2 lt.eq C n^a$, and $X_n gt.eq 0$ has bounded exponential moments at every fixed rate. Then for fixed $K gt.eq 1$ and every $eta > 0$,
  #[#set math.equation(numbering: n => "(9.39)")
   $ C_eta^(- 1) n^(- eta) lt.eq frac(bb(E) \[ Y_n K^(plus.minus X_n) \], bb(E) Y_n) lt.eq C_eta n^eta . $ <obs:absorb-passages>]
  Indeed, split at $X_n = delta log n$, with $delta log K < eta$. On this event the extra factor has the desired bounds. Cauchy–Schwarz and an exponential moment of sufficiently large fixed rate make both tail expectations, with or without $K^(X_n)$, smaller than any prescribed inverse power of $n$. Choose that power larger than $a + 1$ and divide by $bb(E) Y_n$. Increasing $C_eta$ covers bounded $n$. The positive local factors used below have the required polynomial bounds by Proposition 70; this is the precise meaning of an $o \( log n \)$ passage allowance.
] <obs:normalization>

#thm([Lemma 9.5.])[
  (Separated surface partitions).  #emph[Let finitely many straight finite wall fragments have fixed shapes and positive mutual separation. Complete each as an isolated positive slit, with boundedly many wire changes. If $Z_s$ is its partition relative to the plane vacuum and $Z_(upright("all"))$ is the partition with all these slits, then 
#[#set math.equation(numbering: n => "(9.40)")
 $ Z_(upright("all")) asymp product_s Z_s \, $ <obs:surface-product>]

 uniformly in the mesh. Reversing all cap-wire polarities on both banks of one straight slit changes $Z_s$ by a bounded factor. The same holds under a lattice symmetry with cap data transported and color names exchanged when necessary.]
  #emph[Positive local nest or straddle factors in separated buffered patches can also be compared in products under these completed-slit laws. In particular, the baseline tip and flat-change expectations in a correct expansion and in its reflected complementary convention are comparable when their local counts and weights are transported by that reflection. Constants may depend on the fixed slit geometry and the chosen positive weights.]
] <lem:obs-surface>

#proof[
  Enclose each fragment in its own patch, with a vacant bulk collar and a further disjoint buffer. Let $X_s$ count passages through that collar. Compare the actual incremental loop change $Delta ell_s$ of the surgery with $Delta ell_s^compose$, calculated after closing the patch ports by the same arbitrary pairing before and after surgery. A strand end whose continuation is not determined inside the patch must first traverse the collar. There are $O \( X_s \)$ such ends; changing their pairing changes either completed cycle count by at most their number. Therefore
  $ \| Delta ell_s - Delta ell_s^compose \| lt.eq C X_s \, $
  including when other surgeries have already been performed outside. For a fixed sufficiently large $K$, simultaneous truncation $X_s lt.eq K$ has probability bounded below under the law with all completed slits, by Proposition 69. On that event all actual surgery weights and their local versions are comparable. With $G_s = d^(Delta ell_s^compose) upright(bold(1))_({ X_s lt.eq K })$, it follows that
  $ Z_(upright("all")) asymp bb(E)_0 product_s G_s \, #h(2em) Z_s asymp bb(E)_0 G_s . $
  The bounded collar comparison of Lemma 60, applied successively across the disjoint collars to these nonnegative local functions, compares the first expectation with the product of the others. This proves (9.40).
  Translate an isolated straight fragment by one tile step tangent to itself. Plane invariance, with color exchange if required, preserves its partition. The translated caps agree with the reversed caps except at a bounded number of ports near tips and changes. The remaining pairings differ on only that many ends, so their completed loop counts differ by a bounded number. Since $d > 0$ is fixed, the ratio of partitions is bounded above and below. The same argument after a lattice symmetry proves its stated form. This compares partitions, and makes no pointwise density assertion for changing every cap along a long wall.
  Finally condition successively outside the separated local buffers. The bounded collar densities of Lemmas 60 and 63 compare the expectations of arbitrary nonnegative functions supported on their smaller patches, so they apply to the positive powers of the indicated counts. Reflection across a ray exchanges its two banks and wires; reflection at a flat change exchanges its two assignments. Local factors on opposite banks use disjoint half-sector buffers up to the intact wall and are compared separately. These charts contain only the fixed adjacent bank portions, so all their named classes, including partial intervals, have a fixed bound. Reducing a cutoff by a fixed factor when needed costs a bounded ratio by Proposition 70. This proves the last assertion without identifying the two global cap laws pointwise. ◻
]

==== 9.3.3 Inversion and the exterior phase <inversion-and-the-exterior-phase>

On a complete wall, slide the short strings onto their bank. The resulting raw profile is

$ H_R - 1 / 2 + P_R = H_R^I + H_D - 1 / 2 - H_D^I \, $

so it differs from the ideal profile by one constant. A constant shift cancels on an unmarked arc; with one outward source it produces one fixed phase. Use inversion $iota \( zeta \) = 1 \/ \( zeta - z_(*) \)$ and a continuous lift $psi = arg iota'$ off the chosen cut. The inverted normal is $theta_O + psi$. On the clockwise exterior lap $psi$ increases by $4 pi$, making its total normal turn $2 pi$. For an oriented drawn arc with signed cut-intersection number $I$, its image turn is

#[#set math.equation(numbering: n => "(9.41)")
 $ W^I = W + psi \( upright("end") \) - psi \( upright("start") \) - 4 pi I . $ <obs:inversion-turn>]

The boundary normal factors cancel the endpoint terms. At a marked arc the two pieces have additional start terms, canceled by the change of the source tangent gauge $e^(upright(i) rho alpha)$. Prefix intersections are unchanged topologically. The total charge $- 2$ along the unsplit cut supplies exactly the remaining multiplier from $- 4 pi I$ in the winding phase. This proves that every bounded open arc before the first splitting scale has its ideal inverted-disk weight, up to the common source phase. Only turn lifts and intersections were used; the exterior probability law has not been transformed by conformal invariance.

For the source profile, let $H_(V^I \( u \))^I$ be the $c_(*)$-removed tree polynomial (9.5) for the ideal four-change profile in the inverted coordinates on $O union { oo }$. Its tree is formed from the physically sampled exterior boundary arcs, and its root is the exterior gap at $p$. Define

#[#set math.equation(numbering: n => "(9.42)")
 $ J_n \( u \) = frac(bb(E)_(mu_(upright(e x t \, o p e n))) H_(V^I \( u \))^I, P_0 G_0) . $ <obs:exterior-observable>]

The law here is exactly (9.33); it has not been conformally transformed. The common inversion phase is not part of $J_n$. Its raw boundary arcs form a finite tree almost surely by Proposition 90; no tiles at infinity are needed. The same finite tree bounds as in the interior and Propositions 69 and 62 give local boundedness and equicontinuity in the reserved strip. Indeed a nonlocal arc has a fixed-scale passage near the bounded wall, whereas separating two nearby probe points requires an arm from their vicinity to that wall. At $p$ and $d_0$, local two-color screens give the corresponding tree boundary values: the value at $p$ tends to zero, while at the second exterior mark $d_0$ the normalized value differs by $o \( 1 \)$ in the same ordered limit from the expectation of $upright(bold(1))_(E^I) + d upright(bold(1))_(\( E^I \)^c)$, where $E^I$ is the first exterior designation’s opposite-interval connection. That expectation lies in $\[ d \, 1 \]$. Thus every locally uniform limit $J$ is continuous and nonconstant on this connected strip.

For the unmarked profile the ideal open-arc weights are strictly positive. One and three changes give $w \( 1 \/ 4 \) = w \( 3 \/ 4 \)$; two changes give $sin \( 3 lambda \/ 2 \) \/ sin lambda$; zero or all four give the ordinary staggered cap weights. The local drop is $1 \/ 4$ also at $p$: the physical exterior base increases by $1$ on a second lap, and the launches of total charge $- 2$ supply the missing shift. The wrong local drop is $- 1 \/ 4$. These shifts are unchanged by gaps away from the marks. Cap elimination, first inside the four cutoffs and then at a fixed small wall scale, therefore gives for the ideal arc product $A^I$, divided by deterministic cap loops,

#[#set math.equation(numbering: n => "(9.43)")
 $ C^(- \( 1 + X_0 \)) lt.eq A^I \/ V_(upright("wt")) lt.eq C^(1 + X_0) \, $ <obs:ideal-positive>]

where $X_0$ has bounded exponential moments at every fixed rate, also under the displayed local tilts. In particular its normalized positive expectation is bounded above and below.

#thm([Lemma 9.6.])[
  (Distant signed normalization).  #emph[For a closed exterior raw loop $gamma$, let $A_gamma = sum_(w_j upright(" inside ") gamma) a_j$, where inside is its physically bounded side, and set 
#[#set math.equation(numbering: n => "(9.44)")
 $ y_gamma = cases(delim: "{", cos \( \( A_gamma - 1 \) lambda \) \/ cos lambda \, & gamma upright(" surrounds the wall") \,, cos \( \( 1 + A_gamma \) lambda \) \/ cos lambda \, & gamma upright(" does not surround the wall") .) #h(2em) Y = product_gamma y_gamma . $ <obs:closed-loop-ratios>]

 These are exactly the changed closed-loop ratios in either exterior construction. For sufficiently large fixed $L$, under the positive exterior law $nu prop U mu_(upright("ext"))$, or $nu prop U V_(upright("wt")) mu_(upright("ext"))$, one has 
#[#set math.equation(numbering: n => "(9.45)")
 $ bb(E)_nu \( Y \/ U \) gt.eq c_L > 0 \, #h(2em) bb(E)_nu \| Y \/ U \|^p lt.eq C_(p \, L) quad \( p > 0 \) . $ <obs:distant-bounds>]

 The bounds are uniform in large $R_0$ and fine mesh, and hold with the same type of constants after conditioning in separated near-wall patches away from the endpoint buffers.]
] <lem:obs-distant>

#proof[
  Sum the two loop orientations and count counterclockwise string intersections. If the loop surrounds the wall, it surrounds all launches and its charge contribution is $2 - A_gamma$; otherwise it surrounds only the indicated endpoints. This gives (9.44). A closed loop cannot separate the marker of a nonzero source term from the connected wall: that marker lies on an open arc to the wall. Consequently source prefixes make no additional closed-loop ratios, even when open arcs go far. Loops surrounding the wall with endpoint mass $0$ or $2$ have ratio $1$, and loops surrounding no insertion are unchanged. Only finitely many ratios are nontrivial at each mesh.
  Choose a fixed large geometric constant $K$. In corridor $j$, between radii $K r_j$ and $r_(j + 1) \/ K$, every winding loop encloses exactly the first $j$ endpoints. Write $M_j$ for its product of ratios, and $M = product_j M_j$. For $0 lt.eq A lt.eq 2$,
  $ 1 lt.eq v \( A \) := frac(cos \( \( A - 1 \) lambda \), cos lambda) lt.eq \( cos lambda \)^(- 1) \, $
  so every $M_j gt.eq 1$. Besides the local nests in $U$ and these corridor loops, every nontrivial loop has a passage in one of finitely many fixed-ratio endpoint bands. A loop excluding $z_(*)$ and enclosing an endpoint outside its cutoff separates that endpoint from $z_(*)$ and has such a passage. A winding loop with an intermediate endpoint mass either lies in its corridor or meets a bounding band. Fixed box and shell covers, with the tilt-edge bounds of Proposition 70, therefore give a count $X$ such that, for each fixed $t$,
  #[#set math.equation(numbering: n => "(9.46)")
   $ bb(E)_nu e^(t X) lt.eq C_t \, #h(2em) \| Y \/ U \| lt.eq M C^X \, #h(2em) Y \/ U gt.eq M C^(- X) med upright("on ") cal(B)^c . $ <obs:distant-sandwich>]
  Here $cal(B)$ is the event that a loop excluding $z_(*)$ encloses at least two endpoints. Off this event all nonlocal ratios other than the corridor factors belong to a fixed finite positive set: an excluded-wall loop contains at most one small charge, to which (9.30) applies. The constants in the exponential bound are independent of $R_0$ and sufficiently large $L$.
  Every winding loop in a corridor traverses one of $O \( log L \)$ dyadic passage bands. Color their disjoint buffers with a fixed number of colors, apply the conditional passage moment bound in one color successively, and use Hölder across colors. Their supports avoid the endpoint tilts. Thus, for each fixed $b > 0$,
  #[#set math.equation(numbering: n => "(9.47)")
   $ bb(E)_nu M^b lt.eq C_b L^(A_b) . $ <obs:corridor-moments>]
  If a bad loop has smallest enclosed endpoint index $j$, it crosses corridor $j$ radially. It cannot cross any raw winding loop there, so $M_j = 1$ on this event, denoted $cal(B)_j$. Successive actual circuit screens in that corridor, conditioned on all endpoint patches and the other corridors, give
  $ bb(P)_nu \( cal(B)_j divides cal(G)_j \) lt.eq C L^(- alpha) \, $
  where $cal(G)_j$ includes the variables $M_i$, $i eq.not j$. This uses only the conditional screen bounds of Proposition 62; the held data impose permitted radial cap partitions on the fresh annuli, which have no bank hubs. With $m = bb(E)_nu M gt.eq 1$ and $M^(\( j \)) = product_(i eq.not j) M_i$, we obtain the relative estimate
  #[#set math.equation(numbering: n => "(9.48)")
   $ bb(E)_nu \[ M upright(bold(1))_(cal(B)) \] lt.eq sum_j bb(E)_nu \[ M^(\( j \)) bb(P)_nu \( cal(B)_j divides cal(G)_j \) \] lt.eq C L^(- alpha) m . $ <obs:bad-before-passages>]
  For completeness, the passage factor preserves a strict relative power. Set $c = log C$ and choose $theta.alt > 0$ with $c theta.alt < alpha \/ 2$. Splitting at $X = theta.alt log L$ gives
  $ bb(E)_nu \[ M C^X upright(bold(1))_(cal(B)) \] lt.eq C L^(- alpha + c theta.alt) m + \( bb(E)_nu M^2 \)^(1 \/ 2) \( bb(E)_nu \[ e^(2 c X) \; X > theta.alt log L \] \)^(1 \/ 2) . $
  For $t > 2 c$ the last term is at most $C_t L^(A_2 \/ 2 - \( t - 2 c \) theta.alt \/ 2)$. Choose the fixed rate $t$ so large that this exponent is below $- alpha \/ 2$, and use $m gt.eq 1$. It follows that
  #[#set math.equation(numbering: n => "(9.49)")
   $ bb(E)_nu \[ M C^X upright(bold(1))_(cal(B)) \] lt.eq C' L^(- alpha \/ 2) m . $ <obs:relative-signed-error>]
  Likewise, for every $eta > 0$, split at $X = \( eta \/ c \) log L + H$ if $c > 0$. Cauchy–Schwarz, (9.47), and an exponential moment with rate $t > c A_2 \/ eta$ make the $M$-weighted tail at most $m \/ 2$, by taking the fixed $H$ large. Hence
  #[#set math.equation(numbering: n => "(9.50)")
   $ bb(E)_nu \[ M C^(- X) \] gt.eq c_eta L^(- eta) m . $ <obs:positive-relative-mass>]
  For $C = 1$ these conclusions are immediate. Equations (9.46), (9.49) and (9.50), with $eta < alpha \/ 2$, give
  $ bb(E)_nu \( Y \/ U \) gt.eq #scale(x: 120%, y: 120%)[\(] c_eta L^(- eta) - 2 C' L^(- alpha \/ 2) #scale(x: 120%, y: 120%)[\)] m > 0 $
  once $L$ is sufficiently large. This proves the uniform positive lower bound. All fixed absolute moments follow from $\| Y \/ U \| lt.eq M C^X$, (9.47), and Hölder. The arguments used conditional passage and screen estimates in buffers separated from the near-wall patches, so the claimed conditional uniformity follows as well. ◻
]

==== 9.3.4 Source bounds and complete-wall factorization <source-bounds-and-complete-wall-factorization>

We record an absolute bound which will also be needed on exceptional gapped configurations. Write each pure string starting at $p$ as a short connector along the exterior bank toward its non-probe side, followed by the rest of the string. Retain the connector’s diagonal matrices in the bank factors, in the original lane order. Deform only the remaining path, with its endpoints fixed, by Lemma 119. This expresses a small displacement of the continuing route while retaining every crossed-port phase and the charge at its original endpoint $p$. Each source can now be put in a regular simple tube with $p$ in the relative interior of a flat entrance, clear on both sides, and the target deep inside. Other tube sides avoid walls, strings, and the other tube. Finitely many such choices cover compact probe sets.

For a fixed pairing minimize crossings of the disjoint raw crosscuts separating the entrance from the target. A small separating crosscut near the entrance cuts off $p$, since it cannot contain the deep target. The solid entrance makes it an entire local launch arch, not a short return of a larger strand. All other relevant open crosscuts have macroscopic tube subpassages; repeated visits of one strand give disjoint such passages. A tiny separator at the deep target is a closed loop and cannot carry a nonzero outward source marker. The two outward markers cannot lie on one raw arc or on a closed loop, since its orientation cannot supply two outward ends.

After including the short and distant charges, the local unpassed drop at either launch is $- s$. It has weight zero. Passing its source prefix changes it to $- s - 1$, with the $Q^(- 1)$ sign, giving unit absolute weight. Thus only the last nested launch arch can be marked in a nonzero term. The other local changes $s \, t \, s$ have unit weights. Ordinary small disks cancel their caps by the finite elimination in Lemma 93; a geometric corner without a wire change has zero-drop staggering. Every remaining choice costs at most a constant per macroscopic passage. Thus for a complete wall the absolute source sum divided by its deterministic loops and by $U$ is bounded by

#[#set math.equation(numbering: n => "(9.51)")
 $ \| Y \/ U \| C^(1 + X_0) \, $ <obs:absolute-source-bound>]

with all fixed exponential moments for $X_0$ under the relevant tilts. The analogous diagonal bound has the factors $U_z$ and $V_(upright("wt"))$ removed. Near $z$ the full diagonal changes the loop weight to $- 2$, whose absolute ratio is $2 \/ d$; beyond its cutoff every enclosing loop has a fixed-scale passage. Its local interior changes have unit magnitude, including the exiting prefix at $p$. The exterior local changes are exactly the $V_(upright("wt"))$ factors. These observations prove all fixed absolute moment bounds for both normalized integrands.

The next factorization keeps the wall complete. Independence of the interior and exterior positive laws is exact; the source error comes from sending the exterior string-splitting scales to infinity. After this reduction we will compare gapped walls with the complete wall using the same positive normalizations.

#thm([Proposition 9.7.])[
  (Complete-wall factorization).  #emph[For the source tensor there are numbers $a_n \( R_0 \, L \)$ independent of both probes, with $c_L lt.eq \| a_n \| lt.eq C_L$, such that 
#[#set math.equation(numbering: n => "(9.52)")
 $ cal(H)_f \( z \, u \) & = a_n \( R_0 \, L \) h_n \( z \) J_n \( u \) + e_n \( z \, u \; R_0 \, L \) \,\
lim_(R_0 arrow.r oo) limsup_(n arrow.r oo) sup_(\( z \, u \) in K) \| e_n \| & = 0 $ <obs:source-factorization>]

 for each compact probe set $K$, with sufficiently large fixed $L$. Every locally uniform subsequential limit of $J_n$ on the reserved strip is continuous and nonconstant.]
  #emph[For the diagonal tensor, write $mu_(upright("in"))$ for the interior deterministic-cap law, $R_(*) = d^(ell_(upright("open")) - ell_(upright("det")))$, and $N \( z \)$ for all closed interior raw loops surrounding $z$. There is a probe-independent exterior scalar $a_n^I \( R_0 \, L \)$ such that the exact full-wall identity is 
#[#set math.equation(numbering: n => "(9.53)")
 $ cal(R)_f \( z \) = a_n^I \( R_0 \, L \) frac(bb(E)_(mu_(upright("in"))) \[ R_(*) sigma \( "col" \( V \( z \) \) \) D_(V \( z \)) \( 2 \/ d \)^(N \( z \)) \], bb(E)_(mu_(upright("in"))) U_z) . $ <obs:diagonal-factorization>]

 For sufficiently large fixed $L$, 
#[#set math.equation(numbering: n => "(9.54)")
 $ liminf_(R_0 arrow.r oo) liminf_(n arrow.r oo) \| a_n^I \| > 0 \, #h(2em) limsup_(R_0 arrow.r oo) limsup_(n arrow.r oo) \| a_n^I \| < oo . $ <obs:diagonal-exterior-nonzero>]

 No convergence of either scalar is required.]
] <prop:obs-factorization>

#proof[
  On a complete wall the two positive capped laws are independent: their raw pairings and separate cap disks share no connection. For the source tensor the interior factor is $h_n$ times $c_(*) P_0 G_0$ and the open-to-deterministic partition ratio. That ratio is bounded above and below, because only the four unmatched ports are re-paired. The diagonal finite tree expansion gives the interior factor in (9.53), with the parity factor already fixed in (9.38). This proves the exact assertion once $a_n^I$ is defined as the normalized exterior expectation.
  Actual circuits between the bounded wall and the first endpoint scale make the probability of a boundary raw arc reaching that scale tend to zero, also under $U$ and $U V_(upright("wt"))$ tilts. On its complement the inversion calculation is exact. The moment bounds in Lemma 100, (9.43), and (9.51) make the exceptional contribution $o \( 1 \)$ by Hölder, in the stated order of limits.
  Choose $1 lt.double R_1 lt.double R_2 lt.double R_0$ with all successive ratios diverging. Truncate the ideal arc factor to zero unless all its boundary arcs stay inside $R_1$. It is then readable inside that radius. Similarly $Y \/ U$ is readable outside $R_2$ except when a raw path joins that radius to an endpoint band: loops created entirely at the smaller scales have ratio $1$. Screening makes both exceptions rare, and the same moments control the product errors. The inward relative bulk comparison in Proposition 64 factors the expectations of the two truncated factors with error $o \( 1 \)$. These collars are vacant full annuli with no named bank hubs. To see that it applies to a signed factor, apply the uniform relative density bound to its positive and negative real and imaginary parts; their absolute expectations are bounded by the moment estimates. The same comparison applied to absolute parts removes the remote tilt from the near factor. With $V_(upright("wt"))$ present it retains exactly that near-wall tilt and removes only $U$.
  In the source case the near expectation is the normalized ideal tree observable $J_n$, times its fixed nonzero tree and cap normalizers. The far expectation is $bb(E)_nu \( Y \/ U \)$, bounded above and away from zero by Lemma 100. Absorb these constants and the common inversion phase into $a_n$. This proves (9.52) and its uniformity; the assertion about $J_n$ was proved above. In the unmarked case the near expectation is positive and bounded above and below by (9.43). Its product with the positive distant expectation gives (9.54), including the harmless common phase. At no stage is a lower bound for a signed interior observable used. ◻
]

=== 9.4 Closing wall gaps after positive normalization <obs:closing-gaps>

#thm([Proposition 9.8.])[
  (Common gap closure).  #emph[Fix the distant strings, their locations, and all other geometric features. Open finitely many separated gaps of lengths comparable to $h$, away from marks and insertion corridors; at a true corner remove comparable intervals on both sides. Let $g$ be this wall and let $f$ fill these gaps, possibly retaining other fixed gaps. For the tips being filled, take cutoff radii at one fixed positive fraction of $h$, with buffers clear of the other features for all small $h$. Keep the endpoint factor $U$ and all retained cutoff patches fixed during this closure. Constants below may depend on that fixed cutoff fraction. For the source normalization there are positive numbers $b_n$ independent of $z \, u$, with $c lt.eq b_n lt.eq C$, such that 
#[#set math.equation(numbering: n => "(9.55)")
 $ cal(H)_g \( z \, u \) = b_n cal(H)_f \( z \, u \) + e_(n \, h) \( z \, u \) \, #h(2em) lim_(h arrow.b 0) limsup_(n arrow.r oo) sup_(\( z \, u \) in K) \| e_(n \, h) \| = 0 . $ <obs:source-gap-closure>]

 For every fixed interior $z$, the same assertion holds for $cal(R)_g \( z \)$ and $cal(R)_f \( z \)$, with a positive bounded factor $b_n \( z \)$. Constants may depend on the fixed remaining features and on $K$ or $z$. In particular, a smaller second collection of gaps can be closed before the first.]
] <prop:obs-gap-closure>

#proof[
  We use the same tile pairings in both cut conventions. A raw arc or port interaction is affected if it uses a newly missing port; the gapped diagram joins the filled raw paths which end there. For the source case set $S = U T_f$, and for the diagonal case set $S = U_z U V_(upright("wt")) T_f$. Put $T = T_g \/ T_f$ and
  #[#set math.equation(numbering: n => "(9.56)")
   $ nu_g = frac(S T mu_g, bb(E)_(mu_g) \( S T \)) \, #h(2em) nu_f = frac(S mu_f, bb(E)_(mu_f) S) . $ <obs:gap-tilted-laws>]
  All factors of $S$ are supported away from the gaps being filled. Our goal is to separate the normalized diagram into a positive local multiplier near the gaps and a common signed factor away from them. The separation is exact on a screening event. Uniform moments under both tilted laws will control its complement before the relative collar comparison factors the two expectations.
  ===== 9.4.1 The local positive multiplier. <the-local-positive-multiplier.>
  Choose $h lt.double r_1 lt.double 1$. In the common collars impose an actual primal screen between the wall rays in the sector carrying primal wire portions, and an actual dual screen in the other sector, which has no bank or hub attachment. The only bank attachments in the first sector are the two continuous primal ray portions, each crossing the collar and met by its primal screen. The sectors have no direct contact inside the collar. By testing many separated shells outside the tip supports, Proposition 62 and the tilt bounds make this event, called $G_(upright("in"))$, have probability tending to one under $nu_g$, uniformly given remote data and deeper tip data. It confines every affected path to the $r_1$ patches. The induced outer primal ties are the same in the two conventions: any connection through a deeper patch enters the already connected primal screen, also if it bypasses through one of the wire portions joined by that screen. Represent those wires by deterministic connections along the designated intervals. Euler’s formula then makes $ell_f - ell_g$ a difference of local component counts plus deterministic constants. This conclusion may first be read with all exterior edges fixed.
  There is therefore a local factor $B$ such that, on $G_(upright("in"))$,
  #[#set math.equation(numbering: n => "(9.57)")
   $ cal(O)_g = B cal(O)_f . $ <obs:gap-local-equality>]
  This is an identity of the summed diagram expressions, including when their common exterior factor vanishes: $B$ is formed from the affected local spin weights and $d^(ell_f - ell_g)$, not by dividing a possibly zero observable. It is strictly positive. Indeed the patch is a disk with two radial notches ending at its separated tips. A same-bank simple arc, including one threading the gap, has opposite high statuses at its ends and the ordinary staggered $d \, 1$ weights. For an opposite-bank arc oriented from the interior port $i$ to the exterior port $j$, high statuses agree and the endpoint directions are the two interior normals. The matching factors and the winding formula of Lemma 92 give its orientation sum as
  #[#set math.equation(numbering: n => "(9.58)")
   $ frac(cos { rho \( W + theta_i - theta_j \) \/ 2 }, sin lambda) . $ <obs:opposite-bank-amplitude>]
  The lifted turn $W + theta_i - theta_j$ is $plus.minus 2 pi$ around one ray tip, and $0$ across the slot between the two rays. Thus the two weights are respectively $cot lambda$ and $1 \/ sin lambda$, both positive. To verify the lift, round the boundary-attached notches and separate their bank incidences. The resulting region is a topological disk, and an affected raw arc is a proper embedded crosscut: an intermediate bank contact would terminate that raw arc, while confinement keeps it off the outer patch boundary. Crosscuts with the same endpoint incidences are ambient-isotopic relative to this disk boundary. The isotopy can be fixed in short endpoint collars, so the endpoint tangents and normal lifts stay fixed and the integer turn defect cannot change. For collinear rays, a representative around a single ray tip has defect $plus.minus 2 pi$, and a representative across the slot between different rays has defect $0$. Any Jordan closure used here follows the rounded disk boundary, not the virtual filled wall through the slot. In particular the other notch, which is attached to the outer boundary, cannot be enclosed by a same-ray crosscut and its short bank closure without a crossing. Bending one ray through the corner angle rotates its endpoint normal and tangent equally, preserving the defect. Newly closed internal loops have weight $d > 0$. These observations prove positivity of every local factor in $B$.
  There is a fixed $K$ and a count $X_h$ with all fixed exponential moments under $nu_g$ such that
  #[#set math.equation(numbering: n => "(9.59)")
   $ K^(- \( 1 + X_h \)) lt.eq B \/ T lt.eq K^(1 + X_h) quad upright("on ") G_(upright("in")) . $ <obs:gap-local-bounds>]
  Here is why the count has no accumulation over intermediate scales. In both cut conventions remove affected boundary arcs of diameter below a small fixed fraction of $h$, together with their disk descendants, starting with innermost arcs. In $f$ they lie on homogeneous continuous intervals, including the newly filled positions. In $g$ each such disk lies against one bank or across one tip change. Its disk is also short by the straight or single-corner geometry, and cannot span both tips. Remove any common unaffected descendants needed by either elimination as well. They have ends on a common bank piece and the same neutral disk and intervening arcs, so their union is an admissible common removal.
  The high-low zero-change removal creates one cap loop and cancels its $d$ weight; the low-high removal transports the cap pattern with weight $1$. Across one tip both statuses agree, one unmatched port is transported, and no loop is created, leaving exactly $cot lambda$. No whole interval is erased. The number of these removed tip arches differs from $N_(upright("tip"))$ by $O \( X_h \)$: any disagreement meets the edge of its cutoff and has a slot-scale passage. Every surviving affected boundary arc also has a slot-scale passage. Filled paths are disjoint segments of the gapped paths, so they obey the same count. Bulk, straight-wall, and tip buffers, including cutoff-edge buffers, give all fixed exponential moments by Propositions 69 and 70.
  On every surviving common solid interval, both residual caps pair adjacent high-low ports. Only interval ends and noncommon survivors interrupt them, at $O \( 1 + X_h \)$ ports. Their remaining loop counts differ by at most this number, whatever the distant ties are. New local closed loops cancel their ordinary spin weights. This proves (9.59) while retaining the exact positivity.
  ===== 9.4.2 Moments on all configurations. <moments-on-all-configurations.>
  For every fixed $p > 0$, the variables $cal(O)_g \/ \( S T \)$ and $cal(O)_f \/ S$ have bounded absolute $p$-moments under $nu_g$, uniformly as $h arrow.b 0$; the second has the same bound under $nu_f$. These bounds hold without $G_(upright("in"))$. To prove this, make the short removals just described regardless of how far the affected surviving paths travel. Short affected loops and disks avoid every insertion, and are neutral except for their removed tip factors. Non-short affected arcs cost at most $K^(X_h)$, including the interruptions they make in residual caps.
  Eliminate remaining filled neutral disks up to a fixed small macroscopic threshold, chosen below the separations of retained gaps and other features. This includes all intermediate straddles at the newly filled homogeneous locations. Common ordinary disks cancel caps. Retained tips yield their factors in $T_f$, up to fixed-scale cutoff-edge passages. The source tubes and launch calculation preceding Proposition 101 hold unchanged with remote gaps, since their solid entrances are unchanged. There are only passage-counted nonlocal marker choices. For the diagonal tensor the local interior changes have unit magnitude, the exterior changes yield $V_(upright("wt"))$, and the local loops at $z$ yield $U_z$. The distant endpoint nests yield $U$ in either case. A loop outside these patches that separates a source marker from its start must also cut off an end of its open arc on a solid of length bounded below; it cannot be tiny. Other strings have only their specified endpoint and bank charges. Loops enclosing all finite data have ordinary ratio $1$. Consequently, with the distant geometry held fixed,
  #[#set math.equation(numbering: n => "(9.60)")
   $ \| cal(O)_g \/ \( S T \) \| + \| cal(O)_f \/ S \| lt.eq K^(1 + X_0 + X_h) . $ <obs:gap-absolute-moments>]
  The constant may depend on that geometry. The count $X_0$ uses only its fixed scales and has all fixed exponential moments. A path of fixed diameter near a shrinking slot has a fixed-size subpassage outside a small neighborhood of the slot; the usual bulk or sector buffers count it even when the wall is newly open. Again the filled paths are disjoint raw segments. Thus Propositions 69 and 70 prove the stated bounds under both laws. In particular all exceptional-event contributions tend to zero by Hölder.
  ===== 9.4.3 Exterior readability and relative comparison. <exterior-readability-and-relative-comparison.>
  Choose $r_1 lt.double r_2 lt.double r_3 lt.double 1$, with all ratios diverging as $h arrow.b 0$. There is an approximation $F_(upright("out"))$ to $cal(O)_f \/ S$, readable outside the $r_2$ patches, exact unless a raw passage traverses a common collar from $r_2$ to $r_3$; set it to zero on that exterior exceptional event. To verify this, vary an arbitrary inner fill while the outer data are fixed. In the absence of such a passage, the variation affects only disks against homogeneous continuous intervals in the filled convention. Their cap elimination has net weight $1$. For a common elimination over all inner fills, take the union of port blocks affected, or intervening, for some fill. A stable arc in an intervening block pairs within it and has the same neutral disk with its descendants. The untouched ports therefore inherit the same adjacent-pair reconnection after all those blocks are deleted. Modified internal loops are ordinary; all source, endpoint, and remote tilt data stay unchanged. This proves exterior readability, not merely a small probability of contact with the inner core. Screens make the exceptional event rare under both tilted laws and (9.60) controls its error in every fixed smaller moment.
  Define
  $ D_(upright("in")) = \( B \/ T \) upright(bold(1))_(G_(upright("in"))) . $
  It is nonnegative and readable inside $r_1$, with bounded fixed moments. Its expectation lies in $\[ c \, C \]$: the upper bound follows from (9.59); for the lower bound choose a fixed cutoff $K_0$ making $bb(P)_(nu_g) \( X_h > K_0 \) < 1 \/ 4$ and then make $bb(P)_(nu_g) \( G_(upright("in"))^c \) < 1 \/ 4$. On their common complement it is at least $K^(- \( 1 + K_0 \))$.
  The outward two-sector form of Proposition 64 compares the conditional law outside $r_2$, given an inner fill under $nu_g$, with its law under $nu_f$, with relative error tending uniformly to zero. The graph and wire representatives in the collar and beyond are identical; only the deeper inner partition can change. The two screen-met continuous primal rays and the opposite sector without bank attachments are exactly the data in the two-sector hypothesis of that proposition. For several patches apply this comparison successively. Holding the other interiors introduces only their allowed local ties, whose external wires are still represented along the common sides. The factor $T$ is inside and $S$ is remote, so the same relative estimate survives both positive tilts. Applied to the absolute parts of $F_(upright("out"))$, its error is bounded by the relative error times $bb(E)_(nu_f) \| F_(upright("out")) \|$. The moment bounds and (9.57) now give
  #[#set math.equation(numbering: n => "(9.61)")
   $ bb(E)_(nu_g) \[ cal(O)_g \/ \( S T \) \] & = bb(E)_(nu_g) \[ D_(upright("in")) F_(upright("out")) \] + o \( 1 \)\
 & = bb(E)_(nu_g) D_(upright("in")) thin bb(E)_(nu_f) \[ cal(O)_f \/ S \] + o \( 1 \) . $ <obs:normalized-gap-factorization>]
  By (9.32) and (9.56), these are exactly the normalized tensors in the statement (with the same harmless parity factor for the diagonal tensor). Set $b_n = bb(E)_(nu_g) D_(upright("in"))$. It is positive and bounded above and below. In the source case the law, screens, and local multiplier defining it contain no probe positions, so it is independent of both probes and the error is uniform on compact sets. In the diagonal case the $U_z$ tilt may enter its expectation; the statement uses only each fixed $z$. This proves both claims and the permitted successive order of gap closures. ◻
]

=== 9.5 A normalized cancellation of the diagonal residual <obs:residual-section>

The bounded tree variables do not by themselves put the mean observable on its four boundary lines: the line invariant contains a diagonal term. We now cancel that term. The normalization in the next theorem is essential. In the present range the absolute weight of a wrong bulk loop need not be at most its ordinary weight.

Fix an interior point $z$ of the polygon $Omega$ and mesh vertices converging to it. Let $mu_(upright("in"))$ be its deterministic-cap law and let $N \( z \)$ count all internal raw closed loops surrounding $z$. Let $N_0 \( z \)$ count those wholly inside the radius-$r_z$ box at $z$, where

#[#set math.equation(numbering: n => "(9.62)")
 $ r_z = "dist" \( z \, partial Omega \) \/ 8 \, #h(2em) U_z = \( 2 \/ d \)^(N_0 \( z \)) . $ <obs:Uz>]

Boxes may be taken in tile coordinates; changing their fixed shape or radius factor changes the comparisons below only by bounded factors. Write

#[#set math.equation(numbering: n => "(9.63)")
 $ R_(*) = d^(ell_(upright("open")) - ell_(upright("det"))) . $ <obs:open-density>]

The two loop counts in this expression use the same switch configuration and its open and deterministic local-cap completions. Their difference is bounded, so $R_(*)$ and $R_(*)^(- 1)$ are bounded and $bb(E)_(upright("open")) X = bb(E)_(mu_(upright("in"))) \( R_(*) X \) \/ bb(E)_(mu_(upright("in"))) R_(*)$.

#thm([Theorem 9.9.])[
  (Normalized diagonal cancellation).  #emph[Let $sigma$ have opposite signs on the two colors, each of absolute value one. For every fixed interior $z$, 
#[#set math.equation(numbering: n => "(9.64)")
 $ frac(bb(E)_(mu_(upright("in"))) \[ R_(*) sigma \( "col" \( V \( z \) \) \) D_(V \( z \)) \( 2 \/ d \)^(N \( z \)) \], bb(E)_(mu_(upright("in"))) U_z) arrow.r 0 . $ <obs:normalized-residual>]

]
] <thm:normalized-residual>

#proof[
  Fix sufficiently large $L$. For every sufficiently large fixed $R_0$, (9.54) bounds $\| a_n^I \( R_0 \, L \) \|$ away from zero for all sufficiently large $n$; the mesh threshold may depend on $R_0$. Restrict to this mesh tail. By the exact factorization (9.53), the ratio in the theorem is $cal(R)_f \( z \) \/ a_n^I \( R_0 \, L \)$ for our fixed choice of $sigma$, and its negative for the other choice. The parity identity (9.37) has already converted each enclosing-loop factor $\( - 2 \/ d \)$ into the signed tree factor and the positive magnitude $2 \/ d$. It remains to show that $cal(R)_f \( z \)$ vanishes and then use the nonzero exterior factor.
  Use $cal(R)_g$ from (9.38), with the unmarked exterior profile $H^(upright("diag"))$ in (9.28) and the charge routes of Section 9.3. The two distant charge lists each have total magnitude one and satisfy (9.30). Besides their endpoint factor $U$, the exterior normalization has the flat-flip factor
  #[#set math.equation(numbering: n => "(9.65)")
   $ V_(upright("wt")) = w \( 1 \/ 4 \)^(sum_(nu = 1)^4 N_nu^(upright("ext"))) \, $ <obs:quarter-tilt>]
  where the four local straddle counts use disjoint buffered patches. Open gaps of width comparable to $h$ at every true corner, away from all these patches and from the string corridors. The remaining solids are separated straight fragments. For the gapped configuration use the tip factor $T_g$ and normalize its vacuum tensor by
  #[#set math.equation(numbering: n => "(9.66)")
   $ Z_g^(upright("cap")) bb(E)_(mu_g) \[ T_g S \] \, #h(2em) S = U_z U V_(upright("wt")) . $ <obs:residual-normalizer>]
  All supports of $S$ remain away from the shrinking corner gaps.
  ===== 9.5.1 Decay with the corner gaps fixed. <decay-with-the-corner-gaps-fixed.>
  We first show that this normalized tensor vanishes as the mesh tends to zero at every fixed gapped geometry. Take its absolute value using the wrong winding expansion and complementary positive caps. The local factors are as follows.
  + Ordinary straight-bank arcs have their complementary cap weights. At the three interior flips $p \, b \, d_0$ the wrong local straddle weight is zero. At $c$ it is $d$. At $p$ the exiting pure prefix changes the wrong drop to $s + 1$, and $w \( s + 1 \) = 0$; at the other marks the values follow by direct substitution of $- s \, - t \, - s$.
  + Every exterior flat flip has correct drop $1 \/ 4$ and wrong drop $- 1 \/ 4$. Their weights satisfy
    $ 0 < w \( - 1 \/ 4 \) = frac(cos \( 3 lambda \/ 4 \), sin lambda) lt.eq frac(cos \( lambda \/ 4 \), sin lambda) = w \( 1 \/ 4 \) . $
    Thus the exterior flip contribution is dominated by (9.65) and has no extra logarithmic cost.
  + A same-ray tip has magnitude $cot lambda$ in either expansion, so its prescribed positive tip factor is unchanged.
  + A loop around $z$ has wrong magnitude $2 \| cos \( 2 lambda \) \| \/ d lt.eq 2 \/ d$. The loop nests wholly in its cutoff are therefore dominated by $U_z$. At a distant endpoint the local ratios are $u_(-) \( a_j \)$ instead of $u_(+) \( a_j \)$.
  The facts used here are the finite winding calculation, not an analytic continuation of a probabilistic estimate. In particular we have retained the factor $2 \/ d$ at $z$.
  Eliminate the short same-bank disks and their descendants with the cap rule of Section 8. A remaining nonordinary arc or loop has a passage at one of the finitely many fixed feature scales. Thus its absolute contribution is at most $C^(1 + X)$ after the displayed local factors, with every fixed exponential moment of $X$ bounded by Propositions 69 and 70. This also applies to each half-sector at a paired mark: its cutoff lies on its own bank, and connections between the two cutoff supports can only run beyond their buffers. The buffered collar comparison can consequently be applied successively.
  The complementary and original straight-fragment cap partitions are comparable by Lemma 99. Reflecting across a flat ray and using the bounded collars of Lemmas 60 and 63 compares the corresponding tip and baseline local expectations. Consequently, relative to (9.66), the additional upper logarithmic cost is
  #[#set math.equation(numbering: n => "(9.67)")
   $ 3 P + D_(*) + sum_(j upright(" in both lists")) log frac(F_(-) \( a_j \), F_(+) \( a_j \)) + o \( log n \) . $ <obs:residual-cost>]
  Absorption of $C^(1 + X)$ is legitimate at an arbitrarily small power loss: the local factors have polynomial positive and absolute moments, and their baselines have inverse-polynomial lower bounds. Split at $X = epsilon log n$ and use an arbitrarily large fixed exponential-moment rate on its complement. This supplies the one-sided $o \( log n \)$ allowance in (9.67).
  Apply Theorem 94 separately to the two lists. The quantity in (9.67) is at most
  $ 3 P + D_(*) - 2 \( P + D_(*) \) + o \( log n \) = P - D_(*) + o \( log n \) lt.eq - c_2 log n + o \( log n \) $
  by Lemma 74. The normalized tensor therefore tends to zero at each fixed collection of corner gaps. No wrong concave-corner factor occurs, since all solids in this estimate are straight.
  ===== 9.5.2 Restoring the polygon. <restoring-the-polygon.>
  For fixed $z$ and fixed distant geometry, Proposition 102 transfers this zero limit to the complete wall when the gaps shrink after the mesh limit. The normalizing supports in (9.66) are remote from the closing gaps, and the comparison multiplier is positive and bounded above and below. At the complete wall the interior and exterior capped laws factor. The interior factor is exactly the ratio in (9.64), by (9.53). The unmarked exterior factor has modulus bounded away from zero as the first distant scale tends to infinity after the mesh limit, by Proposition 101. Dividing by that factor proves the result. The distant separation parameter is chosen sufficiently large and then fixed throughout these limits. ◻
]

#thm([Lemma 9.10.])[
  (Vanishing boundary residual).  #emph[For every bounded function $gamma$ of the two colors and every boundary point $u$ distinct from the four marks, including an ordinary polygon corner, 
#[#set math.equation(numbering: n => "(9.68)")
 $ lim_(z arrow.r u) limsup_(n arrow.r oo) lr(|bb(E)_(upright("open")) \[ gamma \( "col" \( V \( z \) \) \) D_(V \( z \)) \]|) = 0 . $ <obs:boundary-residual>]

 The outer limit is through macroscopic interior points.]
] <lem:obs-boundary-residual>

#proof[
  Let $R$ be the unmarked boundary interval containing $u$ and put $g_R = 1 \/ 2$ on its wire color and $g_R = - 1 \/ 2$ on the other color. Under $mu_(upright("in"))$ write the numerator integrand of (9.64) as $B_(*) T_(*)$, where
  #[#set math.equation(numbering: n => "(9.69)")
   $ B_(*) = R_(*) sigma \( "col" \( V \) \) d^(- g_R \( "col" \( V \) \)) D_V \, #h(2em) T_(*) = d^(g_R \( "col" \( V \) \)) \( 2 \/ d \)^(N \( z \)) . $ <obs:BT>]
  The first factor is bounded uniformly, by Lemma 96. Choose scales
  #[#set math.equation(numbering: n => "(9.70)")
   $ \| z - u \| lt.double r_1 lt.double r_2 lt.double r_3 lt.double 1 \, $ <obs:boundary-scales>]
  with all consecutive ratios diverging as $z arrow.r u$, and take the mesh limit first at every fixed choice of $z$ and these scales.
  Actual screens in the regular sector at $u$ make $B_(*)$ measurable outside the $r_2$ patch, except on an event whose probability tends to zero in the scale ratios. Use as the good event the absence of a raw traversal of the annulus from its $r_2$ rim to its $r_3$ rim; this event is determined by the annular diagram, hence by the configuration outside $r_2$. Here is the finite invariance needed for measurability. For every compatible filling inside $r_2$ on this exterior event, every boundary arc affected by changing that filling lies in one small portion of $R$ and contains no mark in its child interval. All marked-subtree data and the open-to-completed pairing factor $R_(*)$ remain fixed. Stable exterior separators put the whole connected inner patch on one side or the other. Noncrossing therefore puts all affected on-path edges after the stable prefix. Their off-path factors cancel the local caps; their on-path suffix telescopes by the ordinary-tail rule (9.13). The sign and color factor in $B_(*)$ cancel that suffix. Define the exterior-readable truncation $B_(upright("out"))$ to equal $B_(*)$ on this good event and zero otherwise.
  Define $T_(upright("in"))$ by counting only enclosing loops wholly inside the $r_1$ patch and reconstructing the tree color from their parity and the fixed lattice color at $z$. This agrees with $T_(*)$ unless a raw path goes from the $O \( \| z - u \| \)$ neighborhood to the $r_1$ rim: every loop enclosing $z$ meets the segment from $z$ to a closest boundary point.
  We require errors relative to $bb(E) U_z$, not merely unweighted probability errors. Work under the positive tilt $nu_(U_z) prop U_z mu_(upright("in"))$. Its support is inside the small box in (9.62), so separated screens outside that box still make the exceptional events rare. The variables $T_(*) \/ U_z$ and $T_(upright("in")) \/ U_z$ have uniformly bounded fixed moments. Indeed each additional enclosing loop escapes that cutoff and meets the short segment to a closest wall point, hence gives a passage through a band at distance comparable to $"dist" \( z \, partial Omega \)$. A bounded cover by bulk and regular-sector buffers counts these passages. At a corner use its sector buffer and straight-bank buffers; when the corner is farther than that distance scale only the straight-bank buffers are needed. Proposition 70 gives the asserted moments uniformly. Together with boundedness of $B_(*)$, Hölder’s inequality now gives
  #[#set math.equation(numbering: n => "(9.71)")
   $ bb(E) \[ B_(*) T_(*) \] - bb(E) \[ B_(upright("out")) T_(upright("in")) \] = o \( bb(E) U_z \) \, #h(2em) bb(E) T_(upright("in")) asymp bb(E) U_z . $ <obs:residual-truncation>]
  For the second comparison, the truncated loop count includes $N_0$ and $2 \/ d > 1$, giving the lower bound; the same moment estimate gives the upper bound. The bounded positive color factor is harmless.
  The inward relative sector comparison of Proposition 64, applied between $r_1$ and $r_2$ to the positive inner factor and the positive and negative parts of the bounded exterior variable, yields the estimate below. After exchanging colors if necessary, the only bank attachment is the continuous primal interval through $u$, whose two ray portions cross the collar and meet the same primal screen. This is the one-sector hypothesis of that proposition. Thus
  #[#set math.equation(numbering: n => "(9.72)")
   $ bb(E) \[ B_(upright("out")) T_(upright("in")) \] - bb(E) B_(upright("out")) thin bb(E) T_(upright("in")) = o \( bb(E) U_z \) . $ <obs:residual-decoupling>]
  Theorem 103, used first at fixed $z$, and (9.71)–(9.72) show that $bb(E) B_(*)$ tends to zero in the ordered limit.
  Apply the same separation without a tilt to $B_(*)$ times any bounded function of the tree color. Up to a rare event, that color is read from the inner-loop parity, whereas $B_(*)$ is exterior-readable. The expectation therefore factors up to $o \( 1 \)$ into an exterior mean tending to zero and a bounded inner mean. Choose the color function that reverses the extra factors in (9.69), and divide by $bb(E) R_(*) asymp 1$. This proves (9.68). ◻
]

=== 9.6 Mixed stencils and the strict reflected cost <obs:mixed-section>

The preceding cancellation supplies the required boundary values. We next prove holomorphicity in the interior. Pairing an interior stencil with an exterior one lets us use a high angular mode at one probe and a low mode at the other; their decay powers add to two. The strict charge budget pays the remaining reflection loss.

Call a probe pair $\( z \, u \)$ #emph[eligible] when the following conditions hold for the fixed initial walls, protected marks, and distant endpoints. Its two abscissas avoid the finitely many true vertical wall levels. Its ordinates avoid the horizontal wall and feature heights and lie in disjoint open bands containing no distant endpoint. Writing the two probes as $\( x_i \, y_i \)$, require also $x_1 - y_1 eq.not x_2 - y_2$ and $x_1 + y_1 eq.not x_2 + y_2$. All inequalities have uniform strict margins on the compact product neighborhoods used below. These forbidden projections refer only to the initial data: adaptive gap and cut locations belong to each finite template and do not enlarge the global exceptional set.

We return to the two-source paired wall of Proposition 101. The interior source runs from $p$ to $z$ and the exterior source from $p$ to a point $u$ in the reserved $D$-collar strip. Its exterior ideal bases in inverted order are $\( s + 1 \, 1 \, s \, 0 \)$. The interval-parallel strings set those bases; two lists of distant charges again have total magnitude two. At a common starting edge the pure strings and source strings use the ordered lanes specified in the finite path calculus. After shrinking the eligible probe neighborhoods, choose disjoint closed stencil boxes inside the two source tubes. The common diagonal routes avoid both boxes except for each box’s own arriving prefix; all pure-string corridors avoid the boxes. These choices are common to every local term of the two stencils. Normalize by

#[#set math.equation(numbering: n => "(9.73)")
 $ cal(H)_g \( z \, u \) = frac(Xi_g \( z \, u \), Z_g^(upright("cap")) bb(E)_(mu_g) \[ U T_g \]) . $ <obs:mixed-normalization>]

Here $Xi_g$ is the vacuum tensor and the denominator is positive and independent of both probes.

For the tile-coordinate unit vectors $e_1 \, e_2$, we use the unscaled two-step forward differences

$ delta_j^(\( 2 \)) F \( v \) = F \( v + 2 e_j \/ n \) - F \( v \) \, #h(2em) j = 1 \, 2 . $

There is no division by the step length; a subscript $z$ or $u$ specifies the probe variable. A #emph[low stencil] is one such two-step primitive increment. A #emph[high stencil] compares the two orthogonal increments with a common arriving prefix, subtracting the second with coefficient $e^(upright(i) \( arg e_1 - arg e_2 \)) = - upright(i)$. Thus $delta_(1 \, z)^(\( 2 \)) + upright(i) delta_(2 \, z)^(\( 2 \))$ is high and $delta_(j \, u)^(\( 2 \))$ is low. Their physical bounds follow from Corollary 122. The phase comes from the finite current convention, not from a presumed continuum limit.

#thm([Proposition 9.11.])[
  (Mixed derivative saving).  #emph[Choose eligible compact product neighborhoods of probes. Open fixed primary gaps at every true corner and at the reflection openings for these neighborhoods. There are finitely many secondary centers. Choose reference primary-tip patches clear of those centers, and keep them and $U$ fixed as the common secondary width $k$ varies; use fixed-fraction cutoffs for the secondary tips. These choices are independent of the actual probes. There is a constant $c > 0$ such that, for every sufficiently small fixed $k$, 
#[#set math.equation(numbering: n => "(9.74)")
 $ lr(|\( delta_(1 \, z)^(\( 2 \)) + upright(i) delta_(2 \, z)^(\( 2 \)) \) delta_(j \, u)^(\( 2 \)) cal(H)_g \( z \, u \)|) lt.eq C n^(- 2 - c) \, #h(2em) j = 1 \, 2 . $ <obs:mixed-saving>]

 The constant may depend on all fixed gaps, cutoff patches, and compact neighborhoods. All choices precede the mesh limit.]
] <prop:obs-mixed>

#proof[
  #strong[A common denominator throughout the finite templates.] For each probe band choose an anchor height and a marker cell as in Lemma 124; its doubled height divides a common modulus of the rational vertical wall abscissas. The strict separations allow these cells to be chosen on small product neighborhoods. Place the distant endpoints outside the probe height bands. The same cell choices remain admissible as the primary gap widths later shrink, although the finite reflection template may depend on those widths.
  Fix an arbitrarily small extraction deficit $epsilon > 0$. Lemma 124 supplies finitely many vacant axis cuts, clear slope-$+ 1$ slabs, and secondary gaps. The lemma is geometric: it concerns rational wall levels, probe positions, reflection histories and positive macroscopic clearances. Its full finite proof is given in Section 11 and does not use the value of a transfer exponent.
  Fix the primary widths and these secondary centers. Choose the reference primary-tip patches with buffers avoiding those centers; they can then remain fixed for all sufficiently small $k$. Keep the reference endpoint factor $U$ fixed as well. For the leaf estimate, after the finite template cover and all its routing margins have been chosen, use the smaller supports furnished at the end of Lemma 124. For each original tip, flat mark, or endpoint, their radii are chosen by the minimum clearance from foreign solids and features, probe boxes, and every cut, extraction, and rerouting margin, over all copies and all probe pairs in the compact neighborhoods assigned to the finite templates. The same support is transported to every copy. Its radius is therefore independent of the actual probes.
  For each fixed geometry, Proposition 70 and Lemma 99 compare the positive local means in these smaller supports to their reference means by bounded factors. For a zero straddle weight, use instead the fixed-radius arm and straddle comparison of Lemma 7.7. Include the finitely many shells between the two cutoff conventions in the passage count $X$ below. These comparisons and shell moments cost $O \( 1 \)$ in the local logarithms for each fixed geometry. Their constants may depend on the primary widths, $k$, and the templates, but not on $n$ or the probes. Thus the leaf estimate retains the probe-independent reference denominator in (9.73).
  ===== 9.6.1 Extraction and the remaining reflected diagrams. <extraction-and-the-remaining-reflected-diagrams.>
  The preliminary folds duplicate intact stencil boxes together with their routes. Flux joins are made only in vacant cut margins, away from every retained box; an extraction reroutes its background away from every other surviving box. Thus the initial route-avoidance condition is preserved at each step, without moving a background route through another source. At every extraction use Corollary 122. A high extraction costs $O \( n^(- 1 - rho) \)$ times its two outside state norms, and a low extraction costs $O \( n^(- 1 + rho) \)$ times those norms. Squaring a norm makes a reflected diagram with its positive intervening square-layer metric. Common flux routing supplies a scalar phase independent of the prospective source edge, so this operation preserves the entire local stencil combination.
  The finite median-extraction procedure of Lemma 126 extracts all but an expected $epsilon$ fraction of each original insertion. Here and below the expectation assigns weight $1 \/ 2$ to each norm child. Any unextracted insertion remains a sum over boundedly many local step edges with diagonal prefixes elsewhere, not a primitive summed along a macroscopic path.
  We now estimate the state norms left by the physical extraction bounds; they cannot be replaced by constants. We bound a final leaf by one common plus winding expansion. Transport ordinary cap polarity on even-reflection copies and complementary cap polarity on odd-reflection copies. Each retained solid is a separated straight fragment; cuts and extraction bands miss the smaller feature supports just chosen. The local absolute factors can be read in the original coordinates of each copy:
  + Ordinary local boundary arcs cancel their cap weights. Correct flat-flip factors are 1. Wrong ones are zero at $p \, b \, d_0$ and $d$ at $c$, on each bank separately. At $p$ the full exiting prefix is present in every stencil term.
  + Same-ray tip factors are $cot lambda$ in either absolute convention. An endpoint of magnitude $a_j$ has nest ratio $u_(+) \( a_j \)$ on an even copy and $u_(-) \( a_j \)$ on an odd copy.
  + At an unextracted local marker, a nonzero term requires the marked strand to reach a wall or another separated marker. A closed component cannot change orientation only once. Thus no tiny isolating loop contributes a new uncontrolled local factor.
  For completeness, the parity assertion about the wrong weights is a finite orientation check. Pull an odd copy back by its isometry and reverse spin. Travel reversal and spatial reflection together preserve the signed turn, while conjugation reverses the phase of the retained spin factors. The unmarked orientation sums are therefore the original wrong sums in original interval order. String launches have the same algebraic intersections with a small boundary child disk: joining or rerouting the strings outside the cutoff changes none of those intersections. In particular a zero straddle weight genuinely kills the term before taking its absolute value, and the $d < 1$ factor at $c$ must be retained.
  After local cap elimination, any remaining nonordinary arc or loop has a passage at one of finitely many fixed scales, so its factor is bounded by $C^(1 + X)$. Every fixed exponential moment of $X$ is bounded. There is no residual flux to infinity: each diagonal chain has total divergence zero once its source terminations are included, and reflection joins create no new endpoint. Hence a loop enclosing all finite data has its ordinary weight. This also controls unbounded excursions by the same passage count.
  Use Lemma 99 to compare the cap partitions of the separated reflected fragments to the product of their original single-fragment partitions. Its one-step polarity comparison is essential here; no pointwise comparison of every wall pairing is being used. Tip expectations compare by the bounded sector collar lemmas 60 and 63, and by reflection. At a paired flat mark the two cutoff supports are disjoint half-sector incidences; any connection between them lies beyond the buffers. Successive buffered comparisons therefore count both banks even when the outside cap partition ties them. The only named bank classes in these local charts are their fixed adjacent portions. All these bounded comparisons also hold for complementary copies.
  ===== 9.6.2 Averaging the leaf costs. <averaging-the-leaf-costs.>
  Each retained feature carries its baseline partition, tip mean or $log F_(+) \( a_j \)$. The additional costs on an odd copy are
  $ 2 P med upright("at a paired ") s upright("-flip") \, #h(2em) 2 D_(*) med upright("at the paired ") t upright("-flip") \, #h(2em) log \( F_(-) \( a_j \) \/ F_(+) \( a_j \) \) med upright("at an endpoint") . $
  There are three $s$-flips and one $t$-flip. For these background features, which exclude the probes, each retained support lies wholly on one side of a norm cut. That child contains the feature and its mirror and carries weight $1 \/ 2$, so the total weighted copy count is unchanged. Iterating this observation gives expected copy count one for each original feature under the half-weights of Lemma 124. Every duplication supplies one even and one odd copy, since reflection reverses the parity. Taking at least one preliminary split therefore makes the final expected even and odd counts both $1 \/ 2$. Baseline logarithms average back to
  $ log #scale(x: 120%, y: 120%)[\(] Z_g^(upright("cap")) bb(E)_(mu_g) \[ U T_g \] #scale(x: 120%, y: 120%)[\)] + O \( 1 \) \, $
  the denominator in (9.73). The remaining averaged upper logarithmic cost is at most
  #[#set math.equation(numbering: n => "(9.75)")
   $ 3 P + D_(*) + 1 / 2 sum_(j upright(" in both lists")) log frac(F_(-) \( a_j \), F_(+) \( a_j \)) + o \( log n \) & lt.eq 2 P + o \( log n \)\
 & lt.eq - 2 c_1 log n + o \( log n \) . $ <obs:reflected-cost>]
  The first inequality uses Theorem 94 twice. The passage factors are absorbed by splitting at $X = eta log n$ and using arbitrarily high fixed exponential moments, exactly as in (9.67). Their losses can be made arbitrarily small before choosing the finite template.
  The desired complete extraction exponent is $\( 1 + rho \) + \( 1 - rho \) = 2$. Choose the allowed moment losses and then the finite template deficit $epsilon$ sufficiently small relative to $c_1$. The strict power in (9.75) pays both deficits and leaves some $c > 0$. Division by the baseline proves (9.74). ◻
]

#thm([Theorem 9.12.])[
  (Holomorphicity of the disk observable).  #emph[Every locally uniform subsequential limit of $h_n$ is holomorphic in the ordinary complex coordinate of $Omega$.]
] <thm:holomorphic>

#proof[
  Pass simultaneously to locally continuous limits $h_n arrow.r h$ and $J_n arrow.r J$, where $J_n$ is the ideal exterior observable in the connected probe strip. The tree bounds and shielding give these subsequences; $J$ is nonconstant, with limit zero at $p$ and a value bounded away from zero at $d_0$. At the complete wall, Proposition 101 gives
  #[#set math.equation(numbering: n => "(9.76)")
   $ cal(H)_f \( z \, u \) = a_n \( R_0 \, L \) h_n \( z \) J_n \( u \) + o \( 1 \) \, #h(2em) 0 < c_L lt.eq \| a_n \( R_0 \, L \) \| lt.eq C_L . $ <obs:hol-factorization>]
  The error is uniform on compact probe sets, with mesh first and then $R_0 arrow.r oo$ at a sufficiently large fixed $L$.
  Fix an eligible compact product neighborhood $K$ and a smooth test $phi$ supported in its interior. On one product of two-step lattice cosets, define
  #[#set math.equation(numbering: n => "(9.77)")
   $ cal(B)_n \( F \, phi \) = 4 / n^2 sum_(\( z \, u \)) phi \( z \, u \) \( delta_(1 \, z)^(\( 2 \)) + upright(i) delta_(2 \, z)^(\( 2 \)) \) delta_(j \, u)^(\( 2 \)) F \( z \, u \) . $ <obs:tested-mixed>]
  The prefactor is the four-dimensional cell volume $\( 2 \/ n \)^4$ times the two derivative factors $\( n \/ 2 \)^2$. Discrete summation by parts moves both differences to the test, so, for all large $n$,
  #[#set math.equation(numbering: n => "(9.78)")
   $ \| cal(B)_n \( e \, phi \) \| lt.eq C_phi sup_K \| e \| . $ <obs:tested-value-error>]
  It also shows that local uniform convergence $F_n arrow.r F$ makes $cal(B)_n \( F_n \, phi \)$ tend to the distributional pairing of $\( partial_(1 \, z) + upright(i) partial_(2 \, z) \) partial_(j \, u) F$ with $phi$. Equation (9.74) gives $cal(B)_n \( cal(H)_g \, phi \) = O \( n^(- c) \)$ at each fixed gapped geometry.
  Keep the distant data fixed for now. Fix a primary width $h$, then choose its finite templates and secondary centers. Use reference primary-tip patches clear of those centers, with the same reference endpoint factor $U$ as the secondary width $k$ shrinks. Write $cal(H)_(h \, k)^(upright("ref"))$ for this normalization and $cal(H)_h^(upright("ref"))$ after filling the secondary gaps. For every fixed sufficiently small $k$, the mixed estimate and the cutoff comparison in its proof give $cal(B)_n \( cal(H)_(h \, k)^(upright("ref")) \, phi \) arrow.r 0$. Apply Proposition 102 to the secondary collection while $h$ is fixed. Its multiplier is independent of both probes and bounded below at this fixed $h$. Its uniform value error, together with (9.78), gives
  #[#set math.equation(numbering: n => "(9.79)")
   $ limsup_(n arrow.r oo) \| cal(B)_n \( cal(H)_h^(upright("ref")) \, phi \) \| = 0 quad upright("for each fixed ") h . $ <obs:secondary-tested-closure>]
  In this primary-only wall, let $T_h^(upright("can"))$ use tip patches at one fixed fraction of $h$, and let $T_h^(upright("ref"))$ denote the retained reference patches. The separated primary centers and their comparable widths give clear canonical buffers for all small $h$. With the same numerator and positive primary-only law $mu_h$, the two normalizations satisfy the exact identity
  #[#set math.equation(numbering: n => "(9.80)")
   $ cal(H)_h^(upright("ref")) = c_(n \, h) cal(H)_h^(upright("can")) \, #h(2em) c_(n \, h) = frac(bb(E)_(mu_h) \[ U T_h^(upright("can")) \], bb(E)_(mu_h) \[ U T_h^(upright("ref")) \]) . $ <obs:primary-cutoff-change>]
  This scalar is independent of the probes. For each fixed $h$, Proposition 70 and Lemma 99, applied through the finitely many intervening shells in the regular primary-only tip charts, give $0 < c \( h \) lt.eq c_(n \, h) lt.eq C \( h \) < oo$ uniformly in $n$. No uniformity in $h$ is needed: by linearity of $cal(B)_n$, (9.79) and this exact scalar identity already give $cal(B)_n \( cal(H)_h^(upright("can")) \, phi \) arrow.r 0$ at each fixed $h$.
  Now close the primary gaps with these canonical fixed-fraction cutoffs and the fixed $U$. Proposition 102 gives
  $ cal(H)_h^(upright("can")) = b_(n \, h) cal(H)_f + e_(n \, h) \, #h(2em) b_(n \, h) gt.eq c > 0 \, #h(2em) lim_(h arrow.b 0) limsup_n sup_K \| e_(n \, h) \| = 0 . $
  The lower bound is uniform in small $h$. Hence
  $ limsup_n \| cal(B)_n \( cal(H)_f \, phi \) \| lt.eq c^(- 1) C_phi limsup_n sup_K \| e_(n \, h) \| \, $
  and the right side tends to zero as $h arrow.b 0$. No template-dependent $C \( h \)$ multiplies this primary closure error. Finally apply (9.76), use (9.78) for its value error, and take $R_0 arrow.r oo$ at fixed sufficiently large $L$. The lower bound on $\| a_n \|$ and the local uniform convergence $h_n J_n arrow.r h J$ show
  #[#set math.equation(numbering: n => "(9.81)")
   $ \( partial_(1 \, z) + upright(i) partial_(2 \, z) \) partial_(j \, u) \[ h \( z \) J \( u \) \] = 0 $ <obs:distributional-product>]
  on every eligible neighborhood. None of the comparison scalars needs to converge.
  Fix $z$ outside the finitely many feature projection lines. There is an eligible exterior box on which some distributional derivative of $J$ is nonzero. Otherwise all first derivatives would vanish on the components obtained by deleting the fixed feature lines and the finitely many horizontal and diagonal lines forbidden by this $z$ from the connected strip, making $J$ constant on each component. Continuity across the lines makes all those constants equal, contrary to its nonconstancy. Use product tests in (9.81) with an exterior factor detecting this nonzero derivative. They give $\( partial_1 + upright(i) partial_2 \) h = 0$ near the chosen $z$. The continuous function $h$ is therefore holomorphic away from the finite projection lines. Morera’s theorem, subdividing a triangle along those lines and canceling common edges, removes them. Thus $h$ is holomorphic throughout $Omega$. ◻
]

=== 9.7 The convex boundary problem and fixed-polygon limit <the-convex-boundary-problem-and-fixed-polygon-limit>

#thm([Proposition 9.13.])[
  (Identification of the boundary problem).  #emph[Suppose $h$ is a locally uniform subsequential limit of $h_n$, holomorphic in the ordinary complex coordinate, and along the same subsequence $r_n arrow.r r$. Assume the boundary residual conclusion of Lemma 104. Then $0 < r < 1$, and $h$ maps $Omega$ conformally onto the strictly convex quadrilateral with successive vertices 
#[#set math.equation(numbering: n => "(9.82)")
 $ 0 \, quad U_0 = r + d \( 1 - r \) \, quad T_0 = r + y \( 1 - r \) \, quad y V_0 = y \( d r + 1 - r \) . $ <obs:target-vertices>]

 It extends continuously to the boundary and takes $p \, b \, c \, d_0$ to those vertices, respectively.]
] <prop:obs-boundary-map>

#proof[
  Fixed buffered wall-crossing corridors for the two alternatives, using Propositions 22 and 61, give $epsilon.alt lt.eq r_n lt.eq 1 - epsilon.alt$ under deterministic caps and then under open caps. Thus $0 < r < 1$. At $p$, an unpassed $p$-leg edge makes $H = 0$. At $b \, d_0$, passing the first terminal-leg edge fixes $H$ at its marked value. Lemmas 96 and 97, including their uniform bound on atypical configurations, therefore give the interior limits $0 \, U_0 \, y V_0$ at these three marks.
  At $c$, the corrected value equals $P_0 G_0 T$ on the shielded typical event. For each fixed $m_0$, the uncorrected difference is bounded there by $C d^(m_0)$ when $ell_c gt.eq m_0$. Consequently
  #[#set math.equation(numbering: n => "(9.83)")
   $ limsup_(z arrow.r c) \| h \( z \) - T_0 \| lt.eq C d^(m_0) . $ <obs:c-limit-bound>]
  Here the mesh limit is first, followed by $z arrow.r c$; atypical and unshielded events disappear by Lemma 97. Letting $m_0 arrow.r oo$ proves the full interior limit $h \( z \) arrow.r T_0$.
  At any other boundary point, the line invariant, shielding, and the vanishing expectation of $c_R \( "col" \( V \) \) D_V$ from Lemma 104 make the line-normal component of $h$ tend to the supporting line of the appropriate pair of vertices in (9.82). The anchors are $H_p = 0$ on $A \, D$, $H_b$ on $B$, and $H_(d_0)$ on $C$. Equation (9.24) supplies their directions. Choose a conformal half-plane coordinate; its extension to the boundary is homeomorphic because $Omega$ is a Jordan polygon. On an unmarked real interval, the line-normal harmonic component extends by odd Schwarz reflection. A local harmonic conjugate then extends $h$ holomorphically across that interval. This gives a continuous line-valued trace there, including at original polygon corners in the conformal coordinate. Together with the four interior mark limits, it yields continuity on the closed disk.
  The successive side vectors of the proposed target are
  #[#set math.equation(numbering: n => "(9.84)")
   $ U_0 \, #h(2em) - \( 1 - r \) y^(- 1) \, #h(2em) r y^2 \, #h(2em) - y V_0 . $ <obs:side-vectors>]
  Their arguments in increasing order are $0 \, pi - lambda \, 2 lambda \, pi + lambda$. The four exterior turns are $pi - lambda \, 3 lambda - pi \, pi - lambda \, pi - lambda$, all strictly between zero and $pi$ and summing to $2 pi$. The quadrilateral is therefore strictly convex and counterclockwise.
  Let $w$ avoid the four supporting lines. Each continuous boundary trace of $h$ can be deformed, within its supporting line and with its endpoints fixed, to the corresponding straight side. This deformation avoids $w$, so the winding number is one for an interior $w$ and zero for an exterior $w$. Apply the argument principle on concentric interior circles in a conformal disk coordinate and let their radii tend to one. Boundary continuity ensures that the number of preimages, counted with multiplicity, is the indicated winding number. The function is nonconstant, since its marked limits differ. Its image is open, so no point can map to the boundary or outside of the target: otherwise an open neighborhood of its image would contain a generic exterior point, whose preimage count is zero. The supporting lines do not meet the target interior. Thus the same argument principle applies to every interior target point and gives exactly one preimage, with multiplicity one. This proves conformal bijectivity. ◻
]

#thm([Theorem 9.14.])[
  (The fixed rational polygon formula).  #emph[Fix $0 < q < 1$, a rational simple orthogonal polygon $Omega$, and four distinct ideal side-interior marks $p \, b \, c \, d_0$ in counterclockwise order. Choose $M$ clearing all wall coordinates. For $n in M bb(N)$, use the exact whole-tile graph of $Omega$ at mesh $1 \/ n$, with either global color designation and the flat marked gaps of the specified color-visit convention within $O \( 1 \/ n \)$ of the ideal marks. Use the open-cap and deterministic separate-wire laws defined above. Only the marked gaps are rounded in this auxiliary experiment; the polygon walls remain exact.]
  #emph[Choose a conformal half-plane coordinate taking $\( p \, b \, c \, d_0 \)$ to $\( 0 \, chi \, 1 \, oo \)$, where $0 < chi < 1$. Then, along every sequence $n arrow.r oo$ in $M bb(N)$, 
#[#set math.equation(numbering: n => "(9.85)")
 $ bb(P)_(upright("open")) \( E_(frak(A)) \) arrow.r r \( chi \) := frac(integral_1^oo u^(rho - 1) \| u - chi \|^(rho - 1) \| u - 1 \|^(1 - 3 rho) thin thin upright(d) u, integral_chi^oo u^(rho - 1) \| u - chi \|^(rho - 1) \| u - 1 \|^(1 - 3 rho) thin thin upright(d) u) . $ <obs:crossing-formula>]

 Under deterministic separate $frak(A)$ wires, the actual crossing probability tends to 
#[#set math.equation(numbering: n => "(9.86)")
 $ frac(r \( chi \), r \( chi \) + d \( 1 - r \( chi \) \)) . $ <obs:deterministic-probability>]

 Moreover $h_n$ converges locally uniformly to the conformal map of Proposition 107 with $r = r \( chi \)$. The open-cap function satisfies $r \( 1 - chi \) = 1 - r \( chi \)$. If $g$ denotes (9.86), the complementary separate-wire probability is 
#[#set math.equation(numbering: n => "(9.87)")
 $ frac(1 - r, d r + 1 - r) = frac(1 - g, 1 - \( 1 - q \) g) . $ <obs:complementary-probability>]

]
] <thm:fixed-polygon>

#proof[
  From any compatible mesh subsequence, Lemma 97 extracts a locally uniform limit, and a further subsequence makes $r_n$ converge. Theorem 106 makes this limit holomorphic. Theorem 103, through Lemma 104, supplies its boundary residual. Proposition 107 therefore applies.
  The target’s interior angles, in marked order, are $lambda \, lambda \, 2 pi - 3 lambda \, lambda$. The Schwarz–Christoffel formula for the half-plane parametrization of the target gives a derivative proportional to
  #[#set math.equation(numbering: n => "(9.88)")
   $ zeta^(rho - 1) \( zeta - chi \)^(rho - 1) \( zeta - 1 \)^(1 - 3 rho) \, $ <obs:sc-derivative>]
  with branches chosen in the upper half-plane. The side lengths on $\( chi \, 1 \)$ and $\( 1 \, oo \)$ are $1 - r$ and $r$ by (9.84). Taking their ratio cancels the common absolute multiplicative constant and gives (9.85). The integral is finite: the finite endpoint exponents $rho - 1$ and $1 - 3 rho$ exceed $- 1$, and its power at infinity is $- 1 - rho < - 1$. Both numerator and its complement in the denominator are strictly positive.
  Thus every subsequential $r$ equals $r \( chi \)$. The target and the conformal map with the specified marked boundary values are then unique, so compactness gives convergence of the full compatible sequences of probabilities and observables. Finally, Lemma 95 says that the deterministic completion multiplies the two open-cap alternatives by $d$ and $d^2$. For every compatible mesh its crossing probability is therefore exactly $r_n \/ \( r_n + d \( 1 - r_n \) \)$, which proves (9.86).
  To verify the complementary symmetry directly, let $B \( chi \)$ and $C \( chi \)$ be the integrals of the positive integrand in (9.85) over $\( chi \, 1 \)$ and $\( 1 \, oo \)$, respectively. In $B \( chi \)$ use $u = chi v \/ \( v - \( 1 - chi \) \)$. Its endpoints become $v = oo \, 1$, and collecting the three powers and the Jacobian gives
  #[#set math.equation(numbering: n => "(9.89)")
   $ B \( chi \) = (frac(chi, 1 - chi))^(2 rho - 1) C \( 1 - chi \) . $ <obs:complementary-integrals>]
  Applying the same identity with $1 - chi$ shows $B \( chi \) \/ C \( chi \) = C \( 1 - chi \) \/ B \( 1 - chi \)$, and hence $r \( 1 - chi \) = 1 - r \( chi \)$. The other deterministic completion reweights $E_(frak(A)) \, E_(frak(B))$ by $d^2 \, d$ instead. Its opposite-color crossing probability is $\( 1 - r \) \/ \( d r + 1 - r \)$. Substituting $g = r \/ \( r + d \( 1 - r \) \)$ and $q = d^2$ gives (9.87). ◻
]

Theorem 108 is restricted to the exact compatible polygon meshes just stated; it makes no assertion for independently rounded wall families. For the present $6 < kappa < 8$, the separate-wire expression (9.86) agrees with the conditioned-CLE hookup probability in #cite(label("MillerWerner2018CLEConnections")) Theorem 1, equations (4.1)–(4.3). This identifies the continuum function and does not supply lattice convergence.

== 10 Moving boundaries and the chordal limit <sec:moving>

We now pass from the fixed polygon tests of Theorem 108 to the domains left by a growing strand. There are two distinct tasks. First, the four-change formula must hold uniformly at suitably localized stopping times. Second, the curves must be compact in a topology that retains their entire time order. The first task will supply bounded martingales; the second will justify identifying both the driving process and the complete limiting curve. Theorem 110 extends the fixed-polygon formula, and Proposition 115 applies it to stopped histories. Independently, Theorem 116 obtains curve compactness from Theorem 56 and the drawing and erosion geometry; it does not use the stopped four-change formula. These inputs combine in Proposition 118, where the mesh limit is taken before the inserted boundary interval shrinks. The final proof identifies the full oriented curve, including its target.

Throughout this section, $q in \( 0 \, 1 \)$ is fixed and

$ d = sqrt(q) = 2 cos lambda \, #h(2em) rho = lambda \/ pi in \( 1 \/ 3 \, 1 \/ 2 \) \, #h(2em) h = 1 - 2 rho > 0 . $

All physical domains considered below lie in a common bounded set. Boundary points, slots, and arcs of a cut disk always mean their #emph[incidences] on that disk. Coincidence of their planar images does not identify them.

Retain the functions furnished by Theorem 108:

#[#set math.equation(numbering: n => "(10.1)")
 $ f \( chi \) = frac(I_C \( chi \), I_B \( chi \) + I_C \( chi \)) \, #h(2em) g \( chi \) = frac(f \( chi \), f \( chi \) + d \( 1 - f \( chi \) \)) \, quad 0 < chi < 1 \, $ <chordal:functions>]

where

$ I_B \( chi \) & = integral_chi^1 u^(rho - 1) \( u - chi \)^(rho - 1) \( 1 - u \)^(1 - 3 rho) thin thin upright(d) u \,\
I_C \( chi \) & = integral_1^oo u^(rho - 1) \( u - chi \)^(rho - 1) \( u - 1 \)^(1 - 3 rho) thin thin upright(d) u . $

Here $f$ is the open-change pairing probability and $g$ is the connection probability with the two tested-color electrodes wired separately. We use the cross-ratio convention for which a shrinking electrode away from the other electrode has $chi arrow.b 0$. In particular, $f \( 1 - chi \) = 1 - f \( chi \)$.

=== 10.1 Small accesses in normalized disks <small-accesses-in-normalized-disks>

A #emph[thick normalization] of a disk $T$ is a conformal map $phi.alt : T arrow.r bb(D)$ with $phi.alt \( z \) = 0$, where $B \( z \, r_0 \) subset T$ for a fixed $r_0 > 0$. Rotations may be fixed or extracted along a subsequence. The disks here may have the cut-triangle boundary cells of Section 6; their interiors embed injectively in the plane.

#thm([Lemma 10.1.])[
  (Uniform access estimates).  #emph[Consider disks in a common bounded part of the plane with thick normalizations $phi.alt_n$, and write $F_n = phi.alt_n^(- 1)$.]
  + #emph[A path in the closed disk of physical diameter $o \( 1 \)$ has chart diameter $o \( 1 \)$ uniformly, provided boundary portions are interpreted by interior approximation in their specified incidences.]
  + #emph[A subsequence of $F_n$ converges on compact subsets of $bb(D)$ to an injective nonconstant map $F$. For an angular interval of length $ell$ and $0 < eta < 1 \/ 4$, there is a radial segment in that interval whose image from radius $1 - eta$ to the boundary has length at most $C sqrt(eta \/ ell)$, with $C$ uniform in $n$.]
  + #emph[For the fixed limiting map, 
#[#set math.equation(numbering: n => "(10.2)")
 $ sup_(\| w \| = 1 - eta) eta \| F' \( w \) \| arrow.r 0 quad upright("as ") eta arrow.b 0 . $ <chordal:derivative-tail>]

]
] <chordal:access>

#proof[
  For (i), first keep the physical path a fixed positive distance from the normalization point. A Brownian motion started there hits a set of diameter $epsilon$ before leaving a common enclosing ball with probability tending uniformly to zero as $epsilon arrow.b 0$; the comparison with concentric round annuli gives, for example, a constant times $1 \/ log \( 1 \/ epsilon \)$ after fixing the inner clearance. Conformal invariance gives the same conclusion for its image, for Brownian motion started at $0$ in $bb(D)$.
  On the other hand, a connected path in $bb(D)$ of diameter at least $e > 0$ has hitting probability bounded below by a positive constant depending only on $e$. If it reaches ${ \| w \| lt.eq 1 - e \/ 8 }$, take a subcontinuum extending a fixed smaller distance from such a point; the usual Brownian annulus estimate, or an encircling Brownian loop, gives the lower bound. Otherwise the path lies in the outer band. Its radial variation is at most $e \/ 8$, so its diameter lower bound gives an angular variation bounded below in terms of $e$. Choose a width $alpha_e in \( 0 \, pi \)$ below that variation. A first and last level selection in a continuous angular lift gives a subpath joining the radial sides of
  $ { 1 - e \/ 8 lt.eq \| w \| lt.eq 1 \, quad theta_0 lt.eq arg w lt.eq theta_0 + alpha_e } $
  and staying in that set. Use the polar rectangle with the same angular sides and inner radius $1 - e \/ 4$. An entrance disk can be chosen compactly inside its lower portion, below radius $1 - e \/ 8$ and away from the radial sides. Brownian motion from $0$ reaches that disk before leaving $bb(D)$ with probability bounded below in terms of $e$. From the disk, its first exit from the polar rectangle is through the middle of the outer side with another uniformly positive probability. Such a confined trajectory must cross the spanning subpath; an earlier hit already counts. Boundary paths are obtained by limits of interior paths. Near the normalization point, interior distortion gives (i) directly. This argument concerns a connected access: it makes no assertion about two nearby points on different banks of a slit.
  Boundedness gives normality of $F_n$. The derivative at $0$ is bounded below by the fixed physical disk, so a limiting map is nonconstant; the limit of univalent maps is then univalent. Since the interiors are injectively embedded,
  $ integral_(bb(D)) \| F'_n \( w \) \|^2 thin thin upright(d) "area" \( w \) lt.eq C . $
  Cauchy–Schwarz along radial segments, followed by integration over the angular window, proves (ii), since the radius is bounded below on the indicated outer band. Finally, the mean-value bound for $\| F' \|^2$ in a disk of radius comparable to $eta$ centered at $\| w \| = 1 - eta$ bounds $eta^2 \| F' \( w \) \|^2$ by a constant times the area integral over an outer annulus. That integral tends to zero, proving (10.2) uniformly on the circle. ◻
]

=== 10.2 The two-terminal test in a varying disk <the-two-terminal-test-in-a-varying-disk>

#thm([Theorem 10.2.])[
  (Moving two-terminal crossing formula).  #emph[Let $T_n$ be tiled disks of the class in Theorem 54, with mesh tending to zero, thick normalizations, and a common bounded physical range. In one color wire separately all the slots of two disjoint boundary intervals $A_n \, B_n$, and impose no other ties. Suppose the four interval endpoints converge in chart coordinates to four distinct points in their prescribed cyclic order. If $chi$ is their ordered cross-ratio, then 
$ bb(P)_(T_n) \( A_n arrow.l.r B_n \) arrow.r g \( chi \) . $

 The statement holds for either color, including cut-triangle cells and repeated physical boundary locations with distinct incidences. Equivalently, the error is uniform over sequences with fixed thickness and fixed positive chart separation of the four endpoints.]
] <thm:moving-crossing>

The following construction supplies the uniformity needed in this theorem. It is important that it gives a short access from every vertex of the auxiliary cut, not only from the cut’s two ends.

#thm([Lemma 10.3.])[
  (Inset cuts with short seams).  #emph[After passing to a subsequence as in Lemma 109, fix an angular trimming margin $beta > 0$ inside both electrode intervals and a target tolerance $epsilon > 0$. One can first choose an inset $eta > 0$, and then a sufficiently small precision $zeta > 0$ and a fixed simple rational orthogonal polygon $K$ in tile coordinates. Its closure is compactly contained in $F \( bb(D) \)$, and it has a boundary homeomorphism $k : bb(R) \/ \( 2 pi bb(Z) \) arrow.r partial K$ tracing once in the prescribed order with 
$ sup_theta lr(|F^(- 1) \( k \( theta \) \) - \( 1 - eta \) e^(upright(i) theta)|) lt.eq zeta eta . $

 Let $tau_n$ be the current tile-coordinate mesh. Choose a fixed integer $M_K$ meeting the compatible-mesh requirements of the fixed-polygon experiment, let $m_n in M_K bb(N)$ be nearest to $tau_n^(- 1)$, and put $s_n = m_n tau_n$. A representative tile-grid origin $o_n = O \( tau_n \)$ can be chosen with the required color parity. The exact whole-tile polygons 
$ K_n = o_n + s_n K $

 lie in $T_n$ for all sufficiently large $n$ and have the following properties.]
  + #emph[Two prescribed portions of $partial K_n$ approximate the trimmed electrode arcs in their boundary order. Their endpoint marks are eligible boundary gaps within $O \( tau_n \)$ of fixed marks in flat side interiors of $K$, transported by the displayed similarity.]
  + #emph[For each electrode there is a proper simple tile-edge crosscut $S_n$ following its prescribed portion of $partial K_n$, extending past that portion at both ends, and ending on the true electrode. It cuts off an outer pocket whose boundary interval lies entirely inside that electrode. The two cuts and pockets are disjoint.]
  + #emph[Every off-boundary vertex $z$ of $S_n$ has a simple tile-edge seam to the true electrode inside the closed pocket, interior to $T_n$ except at its final point. Select one such seam $gamma_(n \, z)$ for each vertex of each cut, and let 
$ sigma_(n \, beta \, eta \, zeta) = max_(upright("the two cuts")\
z upright(" an off-boundary cut vertex")) "diam" \( gamma_(n \, z) \) \, #h(2em) max diameter := 0 . $

 The choices can be made so that $limsup_(n arrow.r oo) sigma_(n \, beta \, eta \, zeta) < epsilon$.]
  + #emph[All these paths stay in the corresponding electrode sector, with a positive angular submargin depending on $beta$.]
  #emph[The electrode cross-ratio of $K$ can at the same time be made within $epsilon$ of that of the trimmed arcs. For each choice of $beta \, epsilon$, the inset is chosen first, the precision and polygon next, and the mesh limit last. In particular $K$ and $M_K$ are fixed during their mesh limit.]
] <chordal:seams>

#proof[
  For fixed $eta$, the image of the inset circle is an analytic Jordan curve. Cover it by short segments in disjoint narrow corridors and replace them by sufficiently fine rational tile-coordinate staircases. Join consecutive staircases simply in disjoint small vertex neighborhoods. This yields a parametrized approximation of the curve, including across the specified electrode positions; move the marks into flat side interiors. Uniform convergence to this fixed analytic curve gives convergence of the normalized boundary maps and hence of the cross-ratios. The approximation can be chosen with the stated chart error and boundary order.
  We choose the copies $K_n$ to meet the compatible-mesh requirement exactly. Take $M_K$ to clear the tile-coordinate vertex denominators and any fixed grid or parity requirements of the experiment in Theorem 108. Then
  $ \| s_n - 1 \| lt.eq M_K / 2 tau_n \, #h(2em) sup_(z in overline(K)) \| o_n + \( s_n - 1 \) z \| = O_(K \, M_K) \( tau_n \) . $
  Every vertex of $K_n = o_n + s_n K$ is a vertex of the current tile grid. The similarity $z mapsto \( z - o_n \) \/ s_n$ sends its full tile graph exactly to the fixed polygon $K$ at mesh $1 \/ m_n$, with the ideal side lines unchanged. Only its marked gaps are rounded, by $O \( 1 \/ m_n \)$ in that experiment. The allowed color designation is transported by the same map.
  For containment, $overline(K)$ is compactly contained in $F \( bb(D) \)$. If $d_K$ is its distance from $bb(C) \\ F \( bb(D) \)$, compact kernel convergence puts the closed $d_K \/ 2$ neighborhood of $overline(K)$ in $T_n$ for large $n$. The displayed displacement is eventually less than $d_K \/ 3$, so $K_n$ remains in the uncut bulk with positive clearance. On that fixed compact neighborhood the maps $F_n^(- 1)$ converge uniformly to $F^(- 1)$. Thus the boundaries of $K_n$ follow the inset circle in their current charts, with the prescribed error relative to the fixed $eta$ once the mesh is fine. The similarities preserve the parametrized boundary order and the short-subarc control of the polygonization. The integer $M_K$ may depend on this fixed polygon; the original mesh sequence remains arbitrary.
  Choose two angular windows between each trimmed interval and its true endpoints, with spare margins. Lemma 109(ii) gives short radial exits in these windows, starting just below $1 - 2 eta$. Follow them through consecutive tiles and then by tile-edge paths to boundary vertices within one cell of their exits. The two tile sides of a cut triangle also connect its corners. Stop on the first true boundary hit and trim back to the last $K_n$-exit before it. Loop erasure and mesh rounding change chart positions by $o \( 1 \)$, by Lemma 109(i). The two paths therefore remain disjoint and in their separate windows. Joining them along the intervening arc of $partial K_n$ gives the cut and its pocket; boundary order locates the pocket inside the electrode.
  For the assertion at every cut vertex, choose $C \( eta \) arrow.t oo$ so slowly that $C eta arrow.r 0$ and every inset-circle arc of angular width $O \( C eta \)$ has image diameter $o \( 1 \)$. This is possible by (10.2). Rounding is done after the inset and polygon are fixed. At fixed $eta$, first choose $zeta$ so the polygon chart error $zeta eta$ is as small a fraction of $eta$ as needed, and then take the mesh fine enough to make the tail-rounding and current-chart errors smaller still. A vertex on a tail can follow that tail. A vertex on the inset portion within angular distance $O \( C eta \)$ of a tail can first follow the short boundary arc to it. Otherwise choose an angular window of width comparable to $C eta$ nearby and clear of the two tail windows. It contains an outward ray of physical length $O \( C^(- 1 \/ 2) \)$ from radius $1 - 2 eta$ (or $1 - 3 eta$). Round this ray at sufficiently fine mesh, trim it at its last appropriate cut hit, and join to that hit along the short cut arc. It reaches the true boundary between the two tails. Erasing loops gives the required seam in the pocket. Parametrized polygonization prevents a long backtrack along the inset circle. The angular submargins remain fixed; by Lemma 109(i), small physical approaches within the disk preserve them as well.
  For fixed $beta$, the terminal radial lengths and the short inset arc diameters just obtained tend to zero as $eta arrow.b 0$. Choose $eta$ to make those contributions smaller than the desired tolerance. At that fixed inset choose the parametrized polygonization fine enough that its short-subarc errors and its cross-ratio error are smaller still. Taking the mesh limit with this polygon fixed then removes the path-rounding and chart-convergence errors. This gives the stated bound on the maximal selected seam diameter and the simultaneous cross-ratio approximation. ◻
]

#thm([Lemma 10.4.])[
  (The cost of moving an electrode).  #emph[In the construction of Lemma 111, let $Delta_(n \, beta \, eta \, zeta)^(\( 1 \))$ be the increase in the two-terminal connection probability when all tested-color vertices of the first cut are added to its true electrode. Define $Delta_(n \, beta \, eta \, zeta)^(\( 2 \))$ similarly for the second cut after the first pocket has been factored out. There are $c \, C > 0$ and a fixed physical radius $r_beta > 0$ such that 
$ 0 lt.eq Delta_(n \, beta \, eta \, zeta)^(\( j \)) lt.eq C (frac(tau_n + sigma_(n \, beta \, eta \, zeta), r_beta))^c \, #h(2em) j = 1 \, 2 . $

 The notation $r_beta$ suppresses its dependence on the fixed thickness, common physical bound, and endpoint-separation data. If $e_(n \, beta \, eta \, zeta)$ is the sum of the two right-hand bounds, then for every $epsilon > 0$ the inset and then the precision and polygon can be chosen so that $limsup_(n arrow.r oo) e_(n \, beta \, eta \, zeta) < epsilon$. Each polygon is fixed during its mesh limit. The original FK parameter is unchanged.]
] <chordal:electrode-update>

#proof[
  Write $p_(upright("old"))$ and $p_(upright("new"))$ for the connection probabilities before and after one electrode update. In the old law, let $p_(upright("hit"))$ be the probability that the opposite terminal reaches the union of the true electrode and its cut. The two finite comparisons give
  $ p_(upright("old")) lt.eq p_(upright("new")) lt.eq p_(upright("hit")) : $
  the first inequality is terminal enlargement in Lemma 10, and the second is Lemma 12. We prove that, conditional on each search leaf exposing a witness of the hit event, failure to reach the true electrode has probability at most the claimed error. Averaging will then bound $p_(upright("hit")) - p_(upright("old"))$, and hence the update cost.
  ===== 10.2.1 Expose a witness with an uninspected side. <expose-a-witness-with-an-uninspected-side.>
  Up to its first hit of the target union, a connection from the opposite terminal is an actual open path, with no jumps through the target wire. It lies in the disk $R$ on the outside-of-pocket side of $S_n$, and targets the whole boundary interval $W$ consisting of the cut and exposed portions of the original electrode. A tile-edge cut is crossed at a corner vertex. If the other electrode has already been updated, its pocket factors through its one wire and is first removed. For all separation statements one may still use the original chart of $T_n$.
  Search from the left boundary interval of $R$ for actual complementary-color paths, without following identifications used only in the weight. Seed its exterior complementary face, query a bond only from a reached complementary face, and enter an interior face only across a tested-closed physical bond. The left and right search intervals run between the extreme tested slots of the opposite terminal and $W$. Nonarrival at the right interval is exactly the existence of the tested crossing, by the disk path/cut alternative. Equivalently, one can prolong fictitious spokes from the two target intervals just outside the disk and search for a separating complementary crossing between them. These spokes change neither the law nor the actual edge event.
  On exhaustion the inspected tested-open edges contain a crossing: turning every uninspected bond complementary-open would still leave the search exhausted. Choose a simple measured witness $P$, trimmed after its last visit to the start interval and before its first subsequent target reach. Its interior avoids $S_n$. The interiors of edges strictly on its right in $R$ are uninspected, since a complementary search from the left cannot cross the blocker. This remains true for a boundary diagonal of a half cell: bend it infinitesimally into the cell so that it crosses the complementary spoke before the degree-one virtual endpoint, and flatten it back after making the separation argument. No edge on the unsearched side is thereby queried.
  ===== 10.2.2 The seam bounds a protected disk. <the-seam-bounds-a-protected-disk.>
  Figure 10 illustrates the next construction. If $P$ already touches the true electrode, the desired connection has occurred. Otherwise its final point $z$ lies strictly on $S_n$. Use the short seam $gamma$ from $z$ furnished by Lemma 111. Starting from $P$’s initial point, follow the right outer boundary arc to the terminal point of $gamma$. Take the subarc $L_(*)$ beginning at the last hit of this arc by $P$, and the tail of $P$ following that hit. This tail, $L_(*)$, and $gamma$ enclose a Jordan disk on the right. Indeed the tail has no subsequent contact with $L_(*)$ and has no contact with the seam before $z$, since the seam is in the pocket. Contacts with other outer-boundary portions are interpreted on the abstract disk.
  The portion of this disk in $R$ is on the uninspected side of $P$. To check the side even when $gamma$ follows $S_n$ initially, replace the boundary portion inside the closed pocket by its arc on $S_n$. This deformation changes no winding number in $"int" R$. The resulting loop is exactly the right-side loop of the blocker, using the right outer boundary up to its first cut hit. The search starts are on the other side. Earlier portions of $P$ cannot enter the loop without crossing its tail or the cut; the remaining outer arc is a domain boundary. The pocket itself was never inspected.
  Beginning at the seam, $L_(*)$ belongs to the true electrode for a fixed angular margin: a measured contact in that margin would already give the desired connection. Split $L_(*)$ at a chart position between the seam’s submargin and the end of the electrode. The remainder, up to the contact with $P$, is chart-far from the seam. This remains so if the opposite electrode has previously been moved. Lemma 109(i) therefore supplies a small fixed physical radius, uniform in the histories, such that no access of that diameter from the seam reaches the far interval. Choose a smaller such radius and call it $r_beta$. If $tau_n + sigma_(n \, beta \, eta \, zeta)$ is not a sufficiently small fraction of $r_beta$, the claimed bound is trivial after enlarging $C$, since a probability increase is at most one. Work in the remaining range.
  At a tile-coordinate square level of this radius about $z$, choose the first visible crosscut $J$ joining the $P$ flank to the true-electrode flank and separating the seam from the far interval. Here is a discrete way to make this choice. Take the component accessible from the seam before reaching that level, using a slightly larger radius as a buffer. Its closure misses the far interval. The frontier facing that interval contains a connected level path between the two flanks, by the disk path/cut alternative; trim it between its last and first opposite flank contacts. Integer square levels follow tile edges and meet a diagonal side only at a corner. If the frontier has a pinch, trace the boundary of the near reachable cells in disk incidences and make the same trimming. Thus $J$ is a proper crosscut with the required corner contacts. Its $P$-contact is still chart-near the seam.
  The new $P$ flank is cut along measured whole diagonals. It does not cut a virtual-slot spoke: a simple actual path can use such a spoke only at its first or last edge; the first is chart-far at the opposite terminal, and the first hit $z$ of a tile-edge cut is a corner, not the virtual midpoint. Hence no quarter cells are needed. Between $J$ and the seam, retain the half cell on the uninspected side of each measured diagonal. Its tested endpoints are already tied by $P$, so resampling that diagonal at the ordinary odds changes no network event. The opposite-color virtual spoke only dangles. All other interior bonds are uninspected.
  ===== 10.2.3 Failure forces an actual opposite-color passage. <failure-forces-an-actual-opposite-color-passage.>
  Conditional on compatible outside states, the two tested flanks are fully wired, one by the actual measured path and the other by the true electrode. Additional ties are planar. Draw consecutive links of each full flank wire narrowly outside its slots before drawing the remaining links. Euler duality and the disk path/cut alternative show that failure of the flank connection requires an #emph[actual] opposite-color passage from the seam to $J$. Its possible exterior identifications form a joint planar partition on the two end cuts only: intermediate dual flank slots are free, and the corner slots belong to the corresponding ends. Measured diagonal links are drawn outside the retained half cells, so this argument uses the original disk order even at repeated contacts.
  After rescaling from unit tile mesh, Theorem 56 bounds that conditional passage probability by
  $ C (frac(tau_n + "diam" gamma, r_beta))^c . $
  The seam is contained in a ball of its physical diameter about $z$, whereas $J$ is at a fixed positive radius comparable to $r_beta$. Only measured information selected the disk; the untouched cells were not conditioned on failure of a connection. Thus, with $a_n$ denoting the asserted error bound, averaging over the search leaves on the hit event gives
  $ 0 lt.eq p_(upright("new")) - p_(upright("old")) lt.eq p_(upright("hit")) - p_(upright("old")) lt.eq a_n p_(upright("hit")) lt.eq a_n . $
  The same argument applies to the second update after removing the first pocket through its single wire. The choice statement in Lemma 111, with its seam tolerance chosen in terms of the desired probability error and $r_beta$, then makes the upper limit of the sum smaller than any prescribed $epsilon$. This last choice sends the mesh to zero only after the inset and polygon have been fixed. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((1.3, 0), (1.8, 0.6), (1.5, 1.2), (2.45, 1.7), (2.8, 2.35), (3.45, 2.95), (4.1, 3.8), (5.8, 3.8), (5.8, 0), close: true, fill: rgb("#f2f2f2"), stroke: none)
  line((2.15, 3.8), (2.45, 3.1), (3.45, 2.95), (4.65, 3.1), (5.3, 3.8), close: true, fill: rgb("#e2e2e2"), stroke: none)
  rect((0, 0), (5.8, 3.8), stroke: (thickness: 0.4pt))
  line((2.15, 3.8), (5.3, 3.8), stroke: (thickness: 2.0pt))
  line((0.75, 0), (1.85, 0), stroke: (thickness: 2.0pt))
  line((2.15, 3.8), (2.45, 3.1), (3.45, 2.95), (4.65, 3.1), (5.3, 3.8), stroke: (thickness: 0.4pt))
  line((1.3, 0), (1.8, 0.6), (1.5, 1.2), (2.45, 1.7), (2.8, 2.35), (3.45, 2.95), stroke: (thickness: 1.2pt))
  line((3.45, 2.95), (3.8, 3.2), (4.1, 3.8), stroke: (thickness: 0.4pt))
  circle((3.45, 2.95), radius: 0.045, fill: black, stroke: none)
  content((3.45, 2.95), [#text(size: 9pt)[$z$]], anchor: "north-west")
  content((2.3, 1.7), [#text(size: 9pt)[$P$]], anchor: "east")
  content((2.35, 3.8), [#text(size: 9pt)[$A$]], anchor: "south")
  content((1.25, 0), [#text(size: 9pt)[$B$]], anchor: "north")
  content((2.4, 3.05), [#text(size: 9pt)[$S$]], anchor: "east")
  content((3.8, 3.42), [#text(size: 9pt)[$gamma$]], anchor: "east")
  content((4.45, 1.55), [#text(size: 9pt)[uninspected#linebreak()right wedge]])
  content((4.8, 3.8), [#text(size: 9pt)[true electrode]], anchor: "south")
  content((2.9, -0.7), [#text(size: 9pt)[The seam stays in the untouched pocket.]])
  line((6.15, 1.9), (6.8, 1.9), stroke: (thickness: 0.4pt), mark: (end: ">"))
  line((7.2, 0.7), (7.65, 1.75), (8.5, 3.3), (9.2, 3.3), (10.2, 1.7), (10.8, 0.7), close: true, fill: rgb("#f2f2f2"), stroke: none)
  line((7.2, 0.7), (7.65, 1.75), (8.5, 3.3), stroke: (thickness: 1.7pt))
  line((9.2, 3.3), (10.2, 1.7), (10.8, 0.7), stroke: (thickness: 1.7pt))
  line((8.5, 3.3), (9.2, 3.3), stroke: (thickness: 0.4pt))
  line((7.2, 0.7), (10.8, 0.7), stroke: (thickness: 0.4pt))
  line((8.85, 3.2), (8.55, 2.65), (9.05, 2.15), (8.6, 1.7), (9.05, 0.8), stroke: (thickness: 0.4pt), mark: (end: ">"))
  content((8.85, 3.3), [#text(size: 9pt)[short seam $gamma$]], anchor: "south")
  content((9, 0.7), [#text(size: 9pt)[$J$]], anchor: "north")
  content((7.65, 1.75), [#text(size: 9pt)[$P$#linebreak()flank]], anchor: "east")
  content((10.2, 1.7), [#text(size: 9pt)[electrode#linebreak()flank]], anchor: "west")
  content((9, -0.4), [#box(width: 5cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[On failure: an actual#linebreak()opposite-color passage#linebreak()from $gamma$ to $J$.]]])])
})],
  caption: [Figure 10: Extending a moving electrode. Left: an actual extremal path $P$ first hits the inset cut $S$ at $z$; the small seam $gamma$ reaches the true electrode through the untouched pocket. The tail after the last right-boundary hit, the seam, and the right outer boundary bound the protected wedge. Right: the subdisk between the seam and a farther cut $J$, drawn in abstract disk coordinates. Both flanks are wired in the tested color. Failure of their connection is an actual opposite-color hard passage with ties confined to its ends. The wedge is chosen from measured information; the future failure event is not used to condition its law. ],
) <fig:short-seam>

#proof[
  It suffices to prove the lower bound in each color. In fact, if $p$ is the separately wired probability in one color, Euler duality gives the complementary separately wired probability
  #[#set math.equation(numbering: n => "(10.3)")
   $ H \( p \) = frac(1 - p, 1 - \( 1 - q \) p) . $ <chordal:dual-map>]
  The function $H$ is continuous and decreasing, and $H \( g \( chi \) \) = g \( 1 - chi \)$, using $f \( 1 - chi \) = 1 - f \( chi \)$ and $q = d^2$.
  Pass to any subsequence and then extract the limiting map in Lemma 109. Fix a trimming margin $beta$ and write $chi_beta$ for the cross-ratio of the trimmed arcs. Given $epsilon > 0$, choose the inset, then the precision and polygon, as in Lemmas 111 and 112, so that the fixed polygon cross-ratio $chi_K$ is within $epsilon$ of $chi_beta$ and $limsup_n e_(n \, beta \, eta \, zeta) < epsilon$. Moving both electrodes to the cuts costs at most $e_(n \, beta \, eta \, zeta)$ in connection probability. Each pocket factors out through its one wire. In the remaining disk release every terminal link except those wiring the prescribed electrode intervals of $K_n$; by the terminal assertion of Lemma 10, this does not increase the network probability.
  Next remove the edges outside $K_n$ by cofacial peeling, which also does not increase this particular two-terminal probability. The geometric justification matters here. The two retained wire intervals are exposed on the residual boundary and can be realized by exterior chains. An unwanted edge has a point outside the filled simple polygon $K_n$, and hence an approach from an exterior gap avoiding $K_n$. Place an auxiliary connection-test edge across that gap between representatives of the two terminals. Peeling along the approach makes each successive removed edge cofacial with the test. The exterior chains abut $K_n$ and do not seal such a gap; their thin realizations can be avoided. Different gaps may use different placements of the test edge, since after taking the chain odds to infinity they test the same two terminals. Isolated extra vertices do not affect the probability. The cofacial assertion of Lemma 10 therefore gives
  $ bb(P)_(T_n) \( A_n arrow.l.r B_n \) gt.eq bb(P)_(K_n) \( A'_n arrow.l.r B'_n \) - e_(n \, beta \, eta \, zeta) . $
  For this fixed $K$, the exact similarity in Lemma 111 identifies the experiment on $K_n$ with the compatible fixed-polygon experiment. Theorem 108 therefore gives $bb(P)_(K_n) \( A'_n arrow.l.r B'_n \) arrow.r g \( chi_K \)$. Taking the mesh liminf with this one polygon fixed gives
  $ liminf_n bb(P)_(T_n) \( A_n arrow.l.r B_n \) gt.eq g \( chi_K \) - limsup_n e_(n \, beta \, eta \, zeta) gt.eq g \( chi_K \) - epsilon . $
  For fixed $beta$, this construction is available for every $epsilon > 0$, and $\| chi_K - chi_beta \| < epsilon$. Continuity of $g$ therefore gives the lower bound $g \( chi_beta \)$ as $epsilon arrow.b 0$. Each application of the fixed-polygon theorem used one polygon held fixed during its mesh limit; no uniformity over polygonizations is required. Finally let $beta arrow.b 0$ and use continuity once more. Apply the same argument in the other color and use (10.3) for the upper bound. One-slot endpoint changes have vanishing chart size by Lemma 109, so are absorbed by the angular margins. The sequential argument proves the asserted uniformity. ◻
]

=== 10.3 A drawing compatible with the finite law <a-drawing-compatible-with-the-finite-law>

We specify the discrete representation before applying the moving formula to a stopped interface. No change to the finite law in Theorem 1 is made.

#thm([Lemma 10.5.])[
  (A gapped simple drawing).  #emph[At the initial drawing interface, let $D_delta$ be the bounded interior of a simple closed nearest-neighbor polygon in $delta bb(Z)^2$, and let $a_delta \, b_delta$ be distinct vertices of that polygon. Use the full graph of vertices and edges in the closed polygon. The wired arc is a closed boundary arc including both marked vertices. Every graph edge is sampled in the law, and exactly the boundary edges of that arc are declared open for the prescribed drawing. For this graph and law in Theorem 1, there is a tiled topological disk $V_delta$ with injectively embedded interior and a rounded strand with the following properties. Below we write $V = V_delta$ when the mesh is fixed.]
  + #emph[The marked boundary tracing of $V$ is at distance $O \( delta \)$ from that of the original polygon. The rounded strand’s actual medial boundary endpoints $a_delta^V \, b_delta^V$ are within $O \( delta \)$ of $a_delta \, b_delta$, respectively. Along a uniformly convergent marked Jordan sequence, fix $z_(*) in D$. Eventually $z_(*) in V_delta$, and the inverse disk maps 
$ F_delta : bb(D) arrow.r V_delta \, #h(2em) F_delta \( 0 \) = z_(*) \, #h(2em) F'_delta \( 0 \) > 0 $

 converge uniformly on the closed disk to the correspondingly normalized map $F : bb(D) arrow.r D$. The preimages of $a_delta^V \, b_delta^V$ converge to those of $a \, b$.]
  + #emph[The rounded strand is simple, lies in $"int" V$ except at its two endpoints, and matches the ordered local pieces of the prescribed medial strand at curve distance $O \( delta \)$. It uses polygonal templates with uniformly nondegenerate angles and gaps at least $c delta$ between nonincident pieces, and between the inner drawing and the wall except at endpoint transversals.]
  + #emph[At a switch-revealing stop its unknown original edges have the ordinary conditional FK law, with known open edges contracted and known closed edges deleted. Bank sites have access to the corresponding side of the prefix within physical diameter $O \( delta \)$. Designated boundary slots have simultaneous short outward accesses to their own intervals.]
  + #emph[The same construction is available for four open changes. Separate deterministic closure in a tested color changes the conditional open pairing probability $p$ into 
#[#set math.equation(numbering: n => "(10.4)")
 $ p mapsto frac(p, p + d \( 1 - p \)) . $ <chordal:cap-odds>]

 The drawings and normalization can be kept identical away from an interval on which an extra pair of changes is inserted.]
  #emph[All accesses and gaps refer to the appropriate disk sectors at slit contacts; they do not pass through a wall to another incidence.]
] <chordal:drawing>

#proof[
  Use one full checkerboard tile for each graph edge, including its exterior triangular tab when it is a boundary edge. Within each ordinary square, glue its four incident triangles across their matching port sides. Do not glue different exterior tabs along their radial sides. Simplicity of the initial polygon gives one interior polygon fan at each boundary vertex. A primal boundary vertex retains that fan and the tabs at its two extreme edges. Tile interiors and glued-side interiors are disjoint under planar projection; additional coincidences occur only on boundary incidences. A concave fan can have full angle $2 pi$, in which case its extreme sides form a slit rather than being identified. The result is a topological polygonal disk. Its boundary follows the original boundary with detours of diameter $O \( delta \)$.
  The assumed closed counterclockwise boundary parametrizations trace once, are injective on $\[ 0 \, 1 \)$, and converge uniformly with their marked cyclic parameters. The compression below preserves this tracing order and moves the boundary by $O \( delta \)$. Uniform parametrized convergence to a simple Jordan boundary implies uniform local connectedness of these boundary images: nearby image points have nearby parameters, up to the short detours, and are joined along a boundary segment of uniformly small diameter. Kernel convergence and the boundary extension criterion then give uniform convergence of normalized inverse maps on the closed disk. The side-interior endpoint transversals are within $O \( delta \)$ of the marked polygon vertices. Uniform convergence of the boundary maps and injectivity of the limiting Jordan map therefore give the claimed convergence of their preimages. Repeated boundary incidences still use their own prime sectors.
  Slightly compress the tile complex into $V$, leaving a thin collar for the cap arcs and unmatched-port extensions; denote this compression by $sigma$. Draw each switch by two disjoint simple turn arcs toward the corresponding corners, avoiding both those corners and the opposite boundary diagonal. On a designated interval use the local caps between successive visits of its color; an unassigned slot is capped around between its two incident ports. A designated slot has a short outward access between caps; the outward access from an undesignated slot crosses just its surrounding cap. At a change leave the appropriate port unmatched and extend it to a side-interior boundary point by an initially perpendicular straight segment. These are the only contacts of a chord with the wall.
  Here the compression and arcs can be chosen from finitely many polygonal templates. Inset each boundary edge in a strip and each vertex within its abstract fan, matching by a fixed subdivision of the adjacent tiles, and leave $sigma$ unchanged off an $O \( delta \)$ boundary neighborhood. Fans have at most full angle $2 pi$. At coincident slit sides make the offsets on their respective inset sides. Ports lie away from side endpoints and arcs meet there transversely. There are only finitely many scaled local configurations of fans, caps, changes, and switches, so the choices give uniform positive gaps and angle bounds. In particular, an interior access of diameter $o \( delta \)$ near a join can encounter only its local incident pieces; it cannot confuse opposite slit half-neighborhoods. Every piece length and displacement is $O \( delta \)$. The compression is used only for drawing, not as a conformal map.
  The positive loop identity follows directly in this representation. Draw planar exterior trees for the separate tested wires and thicken the open graph together with these trees. If $ell$ is its number of perimeter components, Euler’s formula gives
  $ ell = 2 k \( A \) + \| A \| + upright("a constant independent of ") A . $
  Consequently $d^ell$ is proportional to $q^(k \( A \)) d^(\| A \|)$, the finite FK weight. This calculation uses only $d > 0$. Conditional component counting gives the same statement after revealing switches, with the induced contractions and deletions.
  At an originally wired boundary edge, its endpoints were already identified, so its sampled state is an independent loop variable for weighting. The exterior dual cap joins its inner continuations in the same way in either state. Declaring the edge open for the prescribed drawing replaces a bounded-size cap detour and possibly removes a microscopic closed loop. On the free arc, the cap around a primal singleton is the boundary turn beside the dual wired arc. Match the remaining pieces in their occurrence order. Simultaneous parametrizations differ by $O \( delta \)$, including at a medial point visited with two different pairings; constant pieces are handled by limits of increasing homeomorphisms. This proves the drawing claim in exactly the curve metric of Theorem 1.
  Along a known bank, a revealed diagonal of that color connects its two sites, and a turn around a site of that color stays at that site. A cap stays at one site or follows consecutive sites of its designated wire. Thus each bank is attached to its original electrode and has the claimed local accesses. The two color accesses at a tile can be drawn on their respective sides of the turn, simultaneously with the designated slot accesses in the collar.
  With four open changes there are two noncrossing pairings. Under separate tested-color closure, the connection alternative adds one completed loop and its complement adds two. Their full-sample relative weights are therefore $d$ and $d^2$. Conditioning that full density on any history gives (10.4); it is not a limiting domain Markov assertion. The density and its reciprocal are bounded in terms of the fixed $q$. In the two-change case the pairing is forced and closure introduces no bias. Insertion changes only the local caps and designations near the new interval, so the rest of the drawing may be left unchanged. ◻
]

=== 10.4 Eroding a revealed prefix <eroding-a-revealed-prefix>

#thm([Lemma 10.6.])[
  (Remaining tiled pieces).  #emph[Stop the rounded strand at a local piece junction, with the states of all encountered switches known but no unused next step specified. Let $U$ be $V$ slit along its simple prefix. There is a collection of remaining tiled disks with cut-triangle cells such that:]
  + #emph[Their compressed interiors are disjoint open subsets of $U$. Every point outside these interiors, including their boundaries, has a path of diameter $O \( delta \)$ to the prime boundary of $U$ outside the piece interiors.]
  + #emph[For a fixed color, the only interactions between pieces are the original wires and the ties supplied by known banks. A non-dummy site with different remaining fan occurrences is already tied to a known bank. Every untied site has its complete remaining incident fan in one piece.]
  + #emph[On a half cell cut along a measured open diagonal, its color endpoints are tied and the opposite-color virtual midpoint is free. One may resample the half-cell state at the ordinary input odds without changing unknown original-edge laws or terminal probabilities.]
  #emph[These assertions also hold after advancing a stop by boundedly many local pieces, with short accesses measured in the original stopped disk. New bank contacts from that advance access the old tip within $O \( delta \)$.]
] <chordal:erosion>

#proof[
  Use the uncompressed tile geometry to perform the following erosion. For a visited turn remove the triangle on that side of the revealed diagonal, namely the triangle containing the corner turned around. If both turns have been visited, remove both triangles. Retain a remaining triangle as a cut-triangle cell and split every corner into its remaining connected sectors. The resulting pieces are connected through their still glued sides.
  Successive removed triangles connect through the crossed port sides back to the beginning of the prefix on the exterior boundary. Segments ending at a visited outer cap also connect to the exterior. Thus there is no isolated removed component enclosing a hole. More explicitly, in the complement of the regular open interior of a retained component every removed cell is connected to the exterior by such a chain; any other retained component adheres to these chains or the outer boundary. That complement is connected. Splitting disconnected corner fans makes each retained component a compact polygonal surface with simply connected interior and hence a topological disk. Its uncompressed interior remains injectively embedded in the original grid.
  Every previously crossed port, except possibly the current tip junction, has both continuation triangles removed, or borders a cap and a removed triangle. Hence a compressed piece meets the measured strand only at an exposed used port at the current end. From a removed triangle one can approach its visited turn on the relevant side within that triangle; if another removed region is encountered first, use its first boundary encounter. A cut diagonal has the same access through its removed triangle. Collar points have the corresponding cap or wall access. This proves the first assertion with the indicated disk incidence at contacts.
  The bank-chain description in Lemma 113 shows that a measured diagonal of the tested color is already contracted to that bank’s wire. Its opposite-color midpoint is a new free dummy slot. The diagonal can therefore be sampled independently as a loop at the ordinary odds. From the opposite-color viewpoint the spoke only dangles, and its opening odds after the component factor are $v \/ q$, with input odds still $v$. Integrating it out does not change any other state or terminal event. This explains the half-cell convention without claiming a new drawing inside an already measured cell.
  If an ordinary color site has two disconnected remaining sectors, some removed triangle at that corner has put the site on a known bank. Conversely an untied site has no such removed corner sector, so its available incident fan is still connected in one piece. The original weights conditioned on the history depend on unknown edges only through component counts after contraction of known open paths and the original wires. Thus shared tied sites and these wires exhaust all interactions between the pieces.
  Finally, a bounded local advance removes only boundedly many additional triangles or collar pieces, all adjacent to the old tip or the portion just traversed. Their exterior accesses run back through these discarded strips to the old tip within $O \( delta \)$. No unrelated state need be queried. The same assertions therefore hold with accesses taken in the original stopped disk. ◻
]

#thm([Proposition 10.7.])[
  (The localized stopped four-change test).  #emph[Fix $q in \( 0 \, 1 \)$ and $r_0 \, s_0 \, M > 0$. Let $cal(H)_delta \( r_0 \, s_0 \, M \, q \)$ consist of the following data: a rounded four-open-change experiment from Lemma 113 at mesh $delta$ with $V subset B \( 0 \, M \)$; a compatible history $omega$ of its strand at a path-adapted stopping time $tau$, from the original first mark, before completion and revealing only encountered switches; and a point $z$ such that $B \( z \, r_0 \) subset U$, where $U$ is the remaining slit disk. Require the tip and the three remaining marked prime ends to have pairwise Euclidean distance at least $s_0$ in a disk chart $phi_U : U arrow.r bb(D)$ with $phi_U \( z \) = 0$. The condition is independent of the chart’s rotation. If $E$ is the tested-color pairing alternative and $chi_U$ is the current ordered cross-ratio, then 
#[#set math.equation(numbering: n => "(10.5)")
 $ epsilon_(upright("stop")) \( delta \; r_0 \, s_0 \, M \, q \) := sup_(cal(H)_delta \( r_0 \, s_0 \, M \, q \)) lr(|bb(P)_(upright("open")) \( E divides cal(F)_tau \) \( omega \) - f \( chi_U \( omega \) \)|) arrow.r 0 #h(2em) \( delta arrow.b 0 \) . $ <chordal:stopped-test>]

 An empty supremum is zero. The class includes stops inside local pieces.]
] <prop:slit-test>

#proof[
  First restrict to junction stops. If the stated supremum did not tend to zero for that subclass, choose $delta_n arrow.b 0$ and data from the class whose errors stay bounded away from zero. Write $U_n$ for their slit disks and normalize their disk charts at the chosen basepoints. Pass to a subsequence on which the four marked chart positions converge; their limits remain distinct by the fixed separation. We prove convergence along this sequence. The required reduction has three parts: find the one remaining tiled disk carrying the macroscopic chart, match its boundary incidences to the stopped chart, and identify its conditional law as a two-terminal law up to arbitrarily small angular margins.
  ===== 10.4.1 The two terminals remain distinct. <the-two-terminals-remain-distinct.>
  Use separate closure in one color. There is no contact of its known bank with the other electrode of that color under the stated localization. Indeed, until a first such contact, the bank is attached to its starting electrode. At a purported contact the site has simultaneous short accesses to that bank side and to the distinct original electrode, by Lemma 113. Their concatenation is a connected physical access of diameter $O \( delta \)$ with chart endpoints in separated intervals, contradicting Lemma 109. A visit to another electrode through a cap has the same property. Thus the two terminal wires remain distinct.
  ===== 10.4.2 One remaining piece carries the disk chart. <one-remaining-piece-carries-the-disk-chart.>
  Erode the history as in Lemma 114. In the $U_n$ chart every fixed compact subset of $bb(D)$ eventually belongs to a single compressed piece, denoted $T_n$. Interior distortion at the thick basepoint gives a fixed positive physical clearance for such a compact set, whereas all removed cells and boundary deformations are within $O \( delta \)$ of a wall or queried tile. The short accesses from the exterior of the pieces have chart diameter $o \( 1 \)$.
  Every other piece has chart diameter $o \( 1 \)$, uniformly, including its boundary accesses. Otherwise, since the other pieces avoid every fixed chart compactum, one contains a path spanning a polar rectangle of fixed angular width in an outer annulus. Select a subpath joining its radial sides and staying between them. The middle radius from the core of $T_n$ must meet this subpath before reaching the unit circle. Its first exit from $T_n$ occurs earlier, on the inner side of the spanning subpath. From that exit, the short exterior access supplied by erosion reaches the unit circle without entering any piece interior. Its chart diameter is $o \( 1 \)$, so it stays between the two radial sides. It must therefore cross the spanning subpath to reach the outer boundary, contradicting that subpath’s location in another piece interior. This proves the assertion without assuming physical boundary regularity of the stopped domains.
  ===== 10.4.3 Match the boundary incidences, not only the kernels. <match-the-boundary-incidences-not-only-the-kernels.>
  The normalized chart of the #emph[uncompressed] tiled disk $T_n$ agrees, also on its boundary incidences, to $o \( 1 \)$ with the ambient $U_n$ chart of its compressed image. We give the details because interior kernel convergence alone would not suffice here. On chart compacta the erosion and compression do nothing. Thus the pointed kernels agree and the normalized charts match in the interior. Conversely, any fixed cleared path with spare-width neighborhoods in the main piece remains in the slit-disk kernel: its $O \( delta \)$-displaced embedded neighborhoods surround a slightly smaller tube, by injectivity and degree. These observations give the two-sided interior kernel assertion.
  For boundary matching, choose finitely many well-spaced marker angles in the piece chart. Close to each marker select a ray with a short physical terminal segment from radius $1 - eta$ to the piece boundary, using Lemma 109(ii). Avoid the finitely many vertex coincidences. Continue its compressed endpoint to the boundary of $U_n$ by the short exterior access, trimmed not to reenter the piece. Interior matching and Lemma 109(i) keep each combined access in a small angular neighborhood of its marker in the $U_n$ chart. The accesses can be trimmed to disjoint crosscuts in their separate windows. Together with the embedded inset circle, they separate the sectors between consecutive markers. The sector between two consecutive marker rays is connected in the piece chart, and its compressed image remains connected: compression is an embedding, although it need not be conformal. The two rays, their exterior continuations, and the inset-circle arc bound its side in $U_n$. Approach a boundary incidence of this sector from its interior. Its image cannot cross either bounding access, so its ambient chart position lies between the same two small marker windows. The short exterior accesses also put all compressed piece-boundary points within $o \( 1 \)$ of the unit circle in the ambient chart. First take $eta$ small for the chosen finite partition, and then refine the partition. This proves uniform boundary-coordinate matching, with incidence limits from the open sectors, without extending a map uniformly to a rough limiting slit.
  ===== 10.4.4 Identify the terminal law and apply the moving formula. <identify-the-terminal-law-and-apply-the-moving-formula.>
  All tested-color sites tied to an electrode have short accesses to its corresponding prime interval in $U_n$. Conversely, a boundary slot of $T_n$ whose matched chart position is strictly inside a tested electrode sector is attached to that electrode. On a cut-triangle side its position is within $o \( 1 \)$ of the known open color side of the slit, by the removed-triangle access; it is then a tied endpoint, not a free virtual slot. On an original side, an undesignated slot has access to another color interval unless a visited cap blocks it, in which case it is attached to the corresponding prefix bank. The current tip is a change, and fixed angular margins absorb its one-cell neighborhood and all slot rounding. This gives the exact two-terminal classification away from vanishing chart margins.
  No small-chart exterior piece can touch both separated terminals. By Lemma 114, unknown edges belong to their one piece; any shared site is already on one of the same wires; and all known links have exposed slots on the piece boundaries. Consequently an exterior piece attaches through at most one hub. Its partition function factors out as a multiplier independent of the remaining edge states. There is neither an already achieved bridge nor an unaccounted connection between distinct terminals. This is an exact factorization of the conditional finite law; the vanishing chart diameters were used only to rule out attachment to both terminals.
  For an arbitrarily small fixed angular margin, shrink or enlarge the two electrode intervals on $T_n$ by that margin. The actual set of its tied boundary slots lies between the two choices. The terminal assertion of Lemma 10 sandwiches the global conditional connection probability between the resulting pure two-terminal probabilities. Apply Theorem 110, let the margin shrink, and undo (10.4). Continuity of $g$ at the four distinct limiting chart positions proves convergence along the chosen sequence, contradicting its error bound. This proves (10.5) for junction stops.
  ===== 10.4.5 Average back to a stop inside a local piece. <average-back-to-a-stop-inside-a-local-piece.>
  For an arbitrary sequence of stops inside local pieces, reveal through the next turn junction, advancing by only boundedly many local pieces. The extra slit has chart diameter $o \( 1 \)$ and attaches at the current tip. Removing a notch of vanishing diameter changes the normalized coordinates of all four marks by $o \( 1 \)$: fixed separating crosscuts away from the notch give boundary convergence there, and neighboring marker intervals squeeze the new tip. Thickness and separation therefore persist, eventually with margins $r_0 \/ 2$ and $s_0 \/ 2$. No remaining marked port can be reached in that local advance.
  Decide only switches encountered in traversing those pieces, including a previously measured tile if revisited; do not condition on an unused next turn. The junction conclusions then average in their respective laws. In particular the exact cap-odds conversion is first made at each junction under its full-sample conditional density, and the open-law conclusions average to the open-law conditional probability at the original stop. This proves the statement for every path-adapted stopping rule. ◻
]

=== 10.5 Unforced quadrilaterals and curve compactness <unforced-quadrilaterals-and-curve-compactness>

We use crossing modulus in the convention that $\( 0 \, L \) times \( 0 \, 1 \)$, crossed between its vertical sides, has modulus $L$. An #emph[avoidable quadrilateral] in a stopped slit domain has its longitudinal sides on the prime boundary and does not disconnect the current tip access from the target access. A crossing means a traversal between its two open ends by a subarc of the future curve.

#thm([Theorem 10.8.])[
  (Uniform unforced-crossing estimate).  #emph[For the sufficiently fine rounded Dobrushin interfaces of Lemma 113, the conditional probability of crossing an avoidable quadrilateral tends uniformly to zero as its crossing modulus tends to infinity. Uniformity includes the mesh, every stopping time before completion, every compatible stopped history, and every such quadrilateral in the remaining prime-end domain.]
  #emph[For a marked domain approximation of Theorem 1, the interfaces, transported to a fixed marked disk, consequently satisfy Condition C2 of #cite(label("KemppainenSmirnov2017")). They are jointly subsequentially compact as oriented curves modulo increasing reparametrization and through their half-plane driving functions on compact capacity intervals. Every joint limit is a continuous Loewner-generating curve with the limiting driver, is parametrizable by strictly increasing capacity until the target, and has no additional time-ordered excursions omitted by this description. The target is reached only at completion. Curve compactness also holds in the original physical coordinates.]
] <thm:c2>

#proof[
  All boundary statements are in disk topology, so distinct incidences at a slit or pinched projected boundary remain distinct. After cropping the open ends, the two longitudinal flanks of an avoidable quadrilateral belong to the same open boundary interval between the current tip and target. Otherwise an interior transverse crosscut joining opposite tip–target intervals would separate the two marked accesses, contrary to avoidability. Thus one color has no designated boundary interval on either flank. Call this the tested color.
  It suffices to consider arbitrary sequences of meshes, stopped histories, and avoidable quadrilaterals whose crossing moduli $L$ diverge, and to show that their conditional crossing probabilities tend to zero. An impossible crossing has probability zero, so assume each experiment has a compatible crossing continuation. Cropping to regular interior subbands preserves the necessity of traversal and leaves a central rectangle of length comparable to $L$. This also accommodates arbitrary original open ends. Under conformal transport the same tests can be made in the prime disk; the prelimit slit boundary accesses used below are polygonal.
  ===== 10.5.1 A small crosscut and a distant crosscut. <a-small-crosscut-and-a-distant-crosscut.>
  Uniformize the quadrilateral by $\( 0 \, L \) times \( 0 \, 1 \)$. For $x in \[ L \/ 4 \, 3 L \/ 4 \]$, let $C_x$ be the physical image of the vertical crosscut, including its two prime-boundary endpoints. Choose $C_i$ with diameter $w > 0$ at most twice the infimum of these diameters, and choose $z in C_i$. Every crosscut in this central range then has diameter at least $w \/ 2$.
  Put $K = L^(1 \/ 8)$. For sufficiently large $L$ some $C_j$ lies wholly outside $B \( z \, K w \)$. Otherwise each central crosscut has arclength at least $c w$ inside $B \( z \, \( K + 2 \) w \)$: either it stays in that enlarged ball, or a segment from its visit to the smaller ball travels a distance comparable to $w$ before leaving the larger one. If $F$ is the conformal parametrization in physical coordinates, Cauchy–Schwarz on the verticals gives
  $ c^2 w^2 L / 2 lt.eq integral_(L \/ 4)^(3 L \/ 4) integral_0^1 \| F' \( x + upright(i) y \) \|^2 upright(bold(1))_({ \| F \( x + upright(i) y \) - z \| < \( K + 2 \) w }) thin thin upright(d) y thin thin upright(d) x lt.eq pi \( K + 2 \)^2 w^2 . $
  Injectivity in the embedded physical interior gives the last bound; coincident boundary projections do not affect area. This contradicts $K = o \( sqrt(L) \)$.
  ===== 10.5.2 Excluding submesh transverse passages. <excluding-submesh-transverse-passages.>
  On a sequence with a possible crossing, $w \/ delta$ is bounded away from zero after discarding finitely many terms. If not, pass to a subsequence with $w \/ delta arrow.r 0$, and let a compatible future crossing meet $C_i$ at $p$. The two parts of $C_i$ give accesses of diameter at most $w$ from $p$ to its boundary endpoints.
  The finite gapped templates of Lemma 113 describe all these submesh encounters. A future strand approaches its past at this scale only on consecutive local pieces, within strand arclength $O \( w \)$ of the current tip. An approach to the original wall occurs only on an initial or final transversal, within arclength $O \( w \)$ of its attachment. In the initial case the stop itself is within that distance of the initial attachment. Nondegenerate template angles make these arclength bounds uniform.
  Thus each endpoint of $C_i$, on its containing tip–target interval, is within boundary arclength $O \( w \)$ of the tip or target. If the encounters use different marks, $p$ is within remaining strand arclength $O \( w \)$ of both the current tip and target. Only $O \( w \)$ arclength remains, making a visit to $C_j$ impossible. If both endpoints are near the same mark, use boundary order on their common tip–target boundary interval. The mark-free intervals cut off by $C_i$ and $C_j$ are nested, since these are transverse sections of one quadrilateral. If the $C_j$ interval lies inside the $C_i$ interval, both its endpoints remain within boundary arclength $O \( w \)$ of the mark. If it contains the $C_i$ interval, its endpoint nearer the mark lies between that mark and the nearer endpoint of $C_i$, so the same bound holds for that endpoint. It is then within physical distance $O \( w \)$ of $C_i$, again contradicting the choice of $C_j$. The argument includes stops in the middle of a local piece.
  ===== 10.5.3 Erosion and protected radial ranges. <erosion-and-protected-radial-ranges.>
  Keep the original stopped slit $U$ fixed. Condition further on the encountered states needed to advance to the next local turn junction, as in Lemma 114. This advances only $O \( delta \)$ and queries no unrelated state. Newly exposed piece boundaries and attachments access the original tip within $O \( delta \)$. If only a final short transversal remains, it cannot traverse from $C_i$ to $C_j$. Uniform bounds after this local advance imply the same bound before it by conditional averaging.
  Let $B$ be the subband between $C_i$ and $C_j$, and set
  $ s = w K^(1 \/ 3) \, #h(2em) t = w K^(2 \/ 3) . $
  Then
  $ delta lt.double s \, #h(2em) w lt.double s lt.double t lt.double K w \, #h(2em) t \/ s arrow.r oo . $
  In fixed-factor neighborhoods of the physical levels $s$ and $t$ about $z$, a path of diameter $O \( delta \)$ in $U$ cannot reach either end of $B$. Any short boundary access there therefore reaches only its flanks; it cannot reach a tested-color designation or the tip.
  There are transverse polygonal crosscuts of $B$ in narrow neighborhoods of these two levels. The physical level separates the ends, and disk path/cut separation gives a flank-to-flank connection in that separating set. A narrow neighborhood permits an interior polygonal crosscut with the same separation property. The stopped boundary is polygonal in its slit incidences, and all subsequent perturbations stay in buffered radial ranges.
  ===== 10.5.4 Selecting fixed tiled cuts. <selecting-fixed-tiled-cuts.>
  We now construct two cuts from the stopped data alone. A compatible completion will certify their geometry; the conditional law will not be restricted to that completion or to successful crossings. A compatible future traversal has a tested-color bank shadow. In a protected region it uses actual available edges, not boundary identifications. An untouched turn either stays at its tested corner or uses its actual open diagonal. In a retained half tile, the unvisited turn stays at the free corner when that color is missing from the flanks. A cap similarly stays at its slot. A jump between designated tested-color sites, or a contact with an already tied tested site, would give a forbidden short access to that designation or the original tip. Untied site fans have consistent incidences in one eroded piece by Lemma 114. The shadow can therefore be perturbed into piece interiors.
  Choose one compatible crossing continuation deterministically from the fixed conditional data, solely as a geometric witness. Its shadow gives an end-to-end continuum in $B$ lying in piece interiors throughout the two protected radial ranges, spliced to the rest of the traversal outside those ranges. For example, order the finitely many completions and choose the first one giving a crossing. This choice reveals no additional switch, and we do not condition the law on this continuation occurring.
  Take a transverse polygonal crosscut near radius $s$. Every point on it outside all piece interiors has a short access, outside those interiors, to a flank. It cannot have such accesses to both flanks: their union would give a transverse connection disjoint from the witness continuum. The label is also constant on each connected segment outside the piece interiors: a segment with differently labeled points, concatenated with their flank accesses, would give the same forbidden transverse connection. After a general-position perturbation, the crosscut has a finite alternating decomposition into such complementary segments and intervals inside individual pieces. Its endpoint labels differ. Reading this decomposition from one end, the first change of label must therefore occur across an interval in one piece, whose two boundary contacts have opposite flank labels.
  Replace the selected piece interval by a tile-edge path within $O \( delta \)$ of it. Consecutively encountered tiles join along their sides; within a half triangle its two tile sides connect the corners. Move boundary contacts to corners within their cells as well. These moves remain protected. No boundary edge connects opposite labels, since its short exterior accesses would contradict the same witness separation. Take the last contact of one label and the first ensuing contact of the other, and erase loops. This gives a proper simple tile-edge crosscut $gamma_s$ in that piece. Prolong its endpoints outside all piece interiors to the two flanks. The prolongations can be chosen disjoint: an intersection would make the excluded complementary flank-to-flank connection. The resulting proper crosscut $Gamma_s$ of $U$ separates the ends of $B$. Construct $gamma_t$ and $Gamma_t$ in the same way. Their radial ranges are disjoint. These cuts are now fixed for the conditional law, not chosen anew from each crossing sample.
  ===== 10.5.5 One piece, including physically folded regions. <one-piece-including-physically-folded-regions.>
  Let $M$ be the middle component between $Gamma_s$ and $Gamma_t$. By prime-boundary order, $M subset B$. Every short boundary access from $M$, or a sufficiently small short-path neighborhood of it, remains protected. In fact, an access leaving $B$ through $C_i$ or $C_j$ must first meet a separator, which is still at distance much greater than $delta$ from that end. This contradicts the access having diameter $O \( delta \)$. The reasoning remains valid when parts of $M$ fold physically close to an end without having a short access to it.
  Every crossing sample therefore has an actual tested-color bank lift throughout its passage across $M$. Start and end the lift a large fixed multiple of $delta$ beyond the respective separators, using their buffers. Its interior perturbation cannot meet the outer prolongations, which lie outside all piece interiors. It crosses $gamma_s$ and $gamma_t$ and remains in one piece. Thus the two predetermined cuts belong to the same eroded disk whenever a crossing is possible. The untied-fan assertion prevents a passage between pieces through a split vertex or pinched incidence.
  The middle tiled subdisk $T$ between these two cuts embeds into $M$: its interior misses the outer prolongations and adjoins both cuts. Orient the bank path from the near cut to the far cut, and retain its segment after the last near-cut visit and before the first subsequent far-cut visit. This is an actual tested traversal of $T$. Let the interior perturbation tend to zero; the hits then use cut corner vertices, since color bonds meet tile-edge cuts only there. Intermediate boundary contacts can be trimmed without changing the traversal.
  ===== 10.5.6 The conditional law on the subdisk. <the-conditional-law-on-the-subdisk.>
  Condition additionally on the states outside $T$. At a non-end flank site, every available incident edge belongs to this piece and middle subdisk. A shared split occurrence or previously wired tested site would instead give a forbidden short access to a known bank or designation. Thus even an outside path that returns from far away cannot attach to a non-end flank: it has no available first edge there. Physical proximity of folded portions does not add graph incidences. Hence the exterior induces identifications only on the two end cuts. They form a planar partition, since the measured links, original closure, and outside state connections are planar. At repeated contacts, slightly separate incidences inward to read their cyclic order. Retained half cells and dummy spokes have exactly the harmless conventions of Lemma 114.
  The near cut lies within $O \( s \)$ of $z$, and the far cut is at distance comparable to $t$. Compression changes these distances only by $O \( delta \)$. Theorem 56 bounds this actual traversal uniformly by a quantity tending to zero, since $s \/ delta arrow.r oo$ and $t \/ s arrow.r oo$. Its uniformity over arbitrary joint planar end partitions, without a bound on their number of contacts, allows averaging over all outside states and then over the junction advance. Every quadrilateral crossing required the traversal. This proves the bound for every sequence with diverging modulus, hence the uniform assertion. In particular, a sufficiently large modulus gives conditional probability at most $1 \/ 2$.
  ===== 10.5.7 Compactness and completion. <compactness-and-completion.>
  For clarity, the form of the external theorem we use is the following: a family of simple interior chords in a fixed marked disk satisfying that last bound for all stopping times and all avoidable quadrilaterals satisfies Condition C2. Proposition 2.6, Theorem 1.5, and Corollary 1.7 of #cite(label("KemppainenSmirnov2017")) then give joint tightness of oriented curves and compact-time uniform drivers, with compatible generating limits. The limiting curve reaches its target only at completion, and capacity is strictly increasing before it. These are geometric theorems about curves, not FK crossing inputs.
  Lemma 113 supplies precisely the required simple interior chords. For each fixed mesh, sending the target to infinity makes capacity run to infinity: the final transversal reaches a smooth side-interior attachment nontangentially, so its half-plane image has unbounded height. The driver conclusions therefore apply on every compact capacity interval. Finally, the uniformly convergent extensions of the initial inverse maps transport curve convergence from the marked disk to physical coordinates. The $O \( delta \)$ drawing comparison transfers the compactness statement to the prescribed interfaces. ◻
]

=== 10.6 Two bounded martingales identify the driver <two-bounded-martingales-identify-the-driver>

Conditional probabilities of the auxiliary pairing event are exact martingales. The stopped four-change formula identifies their scaling limit. We will insert a short boundary electrode, determine its small-interval asymptotic, and transfer a bounded normalization of the martingale to the ordinary Dobrushin law. Two insertion locations then determine both characteristics of the driver.

#thm([Lemma 10.9.])[
  (The small-interval exponent).  #emph[For the function $f$ in (10.1), 
$ f \( chi \) = c_q chi^h \( 1 + o \( 1 \) \) quad \( chi arrow.b 0 \) \, #h(2em) c_q > 0 . $

]
] <chordal:small-interval>

#proof[
  For $chi < 1 \/ 4$, split $I_B$ at $1 \/ 2$. The upper integral is uniformly bounded, since its only remaining singularity has exponent $1 - 3 rho > - 1$. In the lower integral substitute $u = chi z$:
  $ chi^h integral_chi^(1 \/ 2) u^(rho - 1) \( u - chi \)^(rho - 1) \( 1 - u \)^(1 - 3 rho) thin thin upright(d) u = integral_1^(1 \/ \( 2 chi \)) z^(rho - 1) \( z - 1 \)^(rho - 1) \( 1 - chi z \)^(1 - 3 rho) thin thin upright(d) z . $
  On this range the last factor is bounded by $2^(3 rho - 1)$. The remaining function is integrable at $1$ and infinity, since $rho - 1 > - 1$ and $2 rho - 2 < - 1$. Dominated convergence gives
  $ chi^h I_B \( chi \) arrow.r J_rho := integral_1^oo z^(rho - 1) \( z - 1 \)^(rho - 1) thin thin upright(d) z in \( 0 \, oo \) . $
  Likewise $I_C \( chi \) arrow.r I_C \( 0 \) in \( 0 \, oo \)$: at $u = 1$ its exponent is $1 - 3 rho > - 1$, and at infinity it is $- 1 - rho < - 1$. Equation (10.1) now proves the claim with $c_q = I_C \( 0 \) \/ J_rho$. The substitution $z = t \/ \( t - 1 \)$ identifies $J_rho = I_C \( 1 - \)$, whose exponent at $t = 1$ is $- 2 rho > - 1$. ◻
]

#thm([Proposition 10.10.])[
  (Identification of the driver).  #emph[Every subsequential joint limit supplied by Theorem 116 from a marked domain approximation of Theorem 1 has half-plane driving process 
$ W_t = sqrt(kappa) B_t \, #h(2em) kappa = frac(4, 1 - rho) = frac(4 pi, pi - lambda) \, $

 where $B$ is standard Brownian motion in the natural driver filtration.]
] <prop:driver>

#proof[
  Fix $z_(*) in D$ as in Lemma 113. For each rounded initial domain use the unique conformal map
  $ phi.alt_delta : V_delta arrow.r bb(H) \, #h(2em) phi.alt_delta \( a_delta^V \) = 0 \, quad phi.alt_delta \( b_delta^V \) = oo \, quad Im phi.alt_delta \( z_(*) \) = 1 . $
  Use the analogous normalization $phi.alt : D arrow.r bb(H)$ at $a \, b \, z_(*)$. The uniformly convergent inverse disk maps in Lemma 113, together with convergence of the two marked preimages, imply convergence of the associated disk-to-half-plane Möbius normalizations. Consequently $phi.alt_delta^(- 1) arrow.r phi.alt^(- 1)$ uniformly on $overline(bb(H)) union { oo }$, with its spherical topology, as maps to the physical closed domains. This fixes the residual positive scale in the initial half-plane charts.
  Use the color whose positive real boundary side is free. Write $g_t$ for the hydrodynamically normalized maps, so that
  $ partial_t g_t \( z \) = frac(2, g_t \( z \) - W_t) \, #h(2em) g_0 \( z \) = z . $
  The prelimit maps and drivers below refer to these rounded simple drawings and charts. Fix $T < oo$, $R > 0$, and $x > 2 R + 1$, and stop at
  $ tau_R = T and inf { t gt.eq 0 : \| W_t \| gt.eq R } . $
  Until stated otherwise all evaluations are stopped at $tau_R$. For real $z gt.eq x$, the Loewner equation gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ g_t \( z \) gt.eq z \, #h(2em) 0 lt.eq g_t \( z \) - z lt.eq frac(2 T, x - R) \, #h(2em) e^(- 2 T \/ \( x - R \)^2) lt.eq g'_t \( z \) lt.eq 1 . $ <chordal:ode-bounds>]
  It also protects a complex neighborhood of $x$ from the hull, uniformly over this stopped family: solutions whose initial real part is separated to the right of $R$ have increasing real part, and their imaginary part cannot vanish in finite time while this gap persists. Choose chart neighborhoods of $x$ whose smaller closure lies inside the larger protected neighborhood. The limiting images of that smaller closure and of the complement of the larger neighborhood have positive separation under the limiting closed-domain homeomorphism. Uniform inverse convergence preserves a smaller separation. Thus a fixed physical neighborhood of the insertion location is avoided by the stopped strand. A point sufficiently high in the initial chart, together with a small disk around it, stays clear of the hull, whose height is at most $2 sqrt(T)$ by the same differential equation. Its physical image supplies a basepoint with a fixed disk in every stopped slit domain, as required in Proposition 115.
  For fixed small $u > 0$, insert a tested-color interval approximating $\[ x \, x + u \]$. We use an open-change law to obtain an exact pairing martingale and its separate closure to compare with the ordinary finite FK law. Let $P_delta$ be the ordinary Dobrushin law, $Q_(delta \, u)$ the four-open-change law, and $C_(delta \, u)$ its separate tested-color deterministic closure. Use the same domain, the same map $phi.alt_delta$, and drawings identical away from the insertion neighborhood in all three laws. In the auxiliary experiment follow the strand from $a_delta^V$ and keep the original rounded endpoint $b_delta^V$ as the half-plane normalization mark. Completion at an inserted mark is impossible before $tau_R$, by the protected neighborhood; thus the stopped strand has the same simple-chord Loewner description.
  Let $E$ be the exceptional pairing connecting the two tested electrode intervals. Then
  $ p_(delta \, u) \( t \) = Q_(delta \, u) \( E divides cal(F)_(t and tau_R) \) $
  is an exact bounded martingale. For fixed $u$, the four transformed marks remain uniformly separated. In particular the inserted gap is at least $u e^(- 2 T \/ \( x - R \)^2)$, while its distance from the driver has a positive lower bound. The two intervals in their increasing half-plane boundary order are $\[ g_t \( x \) \, g_t \( x + u \) \]$ and the interval from $oo$ to $W_t$. In the disk chart at the chosen high basepoint, the pairwise mark distances consequently have a lower bound $s_0 = s_0 \( u \, T \, R \, x \) > 0$. The physical bound and basepoint clearance are fixed, so Proposition 115 applies through $epsilon_(upright("stop")) \( delta \; r_0 \, s_0 \, M \, q \)$, uniformly in the stopped histories,
  #[#set math.equation(numbering: n => "(10.7)")
   $ p_(delta \, u) \( t \) = f (frac(g_(t and tau_R) \( x + u \) - g_(t and tau_R) \( x \), g_(t and tau_R) \( x + u \) - W_(t and tau_R))) + o_delta \( 1 \; u \) . $ <chordal:pairing-martingale>]
  Rounding of the insertion slots is included in the error. Here $u$ is fixed; no uniformity as $u arrow.b 0$ is invoked. At time zero $p_(delta \, u) \( 0 \) arrow.r f \( u \/ \( x + u \) \) > 0$, so division by this initial probability is legitimate with $u$ fixed.
  Lemma 117 and (10.6), together with differentiation of the ODE in its starting point, show that the normalized ratio of the crossing functions converges uniformly, as $u arrow.b 0$, to
  #[#set math.equation(numbering: n => "(10.8)")
   $ M_t \( x \) = (frac(x g'_(t and tau_R) \( x \), g_(t and tau_R) \( x \) - W_(t and tau_R)))^h . $ <chordal:martingale-observable>]
  This quantity is bounded and bounded away from zero by constants depending only on $T \, R \, x$. For $s lt.eq t$ and a bounded function $Phi$ of the stopped driver history through $s$, the exact pairing martingale consequently implies
  #[#set math.equation(numbering: n => "(10.9)")
   $ lr(|bb(E)_(Q_(delta \, u)) \[ \( M_t \( x \) - M_s \( x \) \) Phi \]|) lt.eq parallel Phi parallel_oo #scale(x: 120%, y: 120%)[\(] o_delta \( 1 \; u \) + epsilon \( u \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) epsilon \( u \) arrow.r 0 . $ <chordal:approximate-martingale>]
  The order is always mesh first at fixed $u$, then $u arrow.b 0$.
  ===== 10.6.1 Returning to the ordinary law. <returning-to-the-ordinary-law.>
  Separate closure reweights a full switch configuration by a factor depending only on its pairing, with relative factors bounded above and below in terms of $d$. They are constant on $E^c$, whence
  $ parallel Q_(delta \, u) - C_(delta \, u) parallel_(upright("TV")) lt.eq C_d Q_(delta \, u) \( E \) . $
  The right-hand side tends to zero in the indicated iterated limit, since $Q_(delta \, u) \( E \) arrow.r f \( u \/ \( x + u \) \)$.
  To compare $C_(delta \, u)$ with $P_delta$, choose a tiled cap subdisk inside the protected physical neighborhood. Its true boundary interval contains the insertion and its tile-edge crosscut stays a fixed positive physical distance from that point. Construct it by first taking a small cap crosscut in the initial disk chart and then rounding through consecutive tiles. Uniform Jordan convergence permits its two boundary approaches to stay in separate patches, while keeping the entire cap in the protected neighborhood; the cut remains physically separated from the mark.
  Let $W'$ be the inserted slots and $S'$ the cut slots. In the tested-color representation the cap wall was initially free, and the sole weighting change is the added full wire $F_(W')$. For any outside configuration, let $X$ be its induced partition on $S'$, including the unchanged outside ties. It is planar in the cut order. Before normalization, the change in its outside weight is
  $ Z_(X \, F_(W')) / Z_X . $
  With $W'$ and $S'$ fully but separately wired, their connection probability tends to zero by Theorem 54, because $W'$ shrinks to the insertion point and the cut stays separated. Lemma 24 thus gives, uniformly in $X$,
  $ Z_(X \, F_(W')) / Z_X = Z_(F_(W')) / Z #scale(x: 120%, y: 120%)[\(] 1 + o_delta \( 1 \; u \) + o_u \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  After normalization, the exterior marginals have vanishing total variation distance in the iterated limit.
  A coupling of those exterior configurations couples the stopped strands. Every switch or cap that could differ lies in the protected neighborhood, which is avoided before stopping; drawings and normalization outside it are common. Therefore (10.9) transfers to $P_delta$ with an error tending to zero first in mesh and then in $u$. This transfer is applied to the bounded expression $M$, #emph[after] replacing the normalized pairing martingale. No total variation error is divided by a small crossing probability.
  ===== 10.6.2 Martingales in a joint limit. <martingales-in-a-joint-limit.>
  Take a subsequential joint limit from Theorem 116. Choose $R$ to be a continuity level for stopping under uniform driver convergence on $\[ 0 \, T \]$. Such levels have full Lebesgue measure: for each continuous path the generalized inverse of its running maximum has only countably many discontinuities, and Fubini’s theorem applies. ODE continuity and bounded continuous past-driver tests pass the transferred identities to the limit. A monotone-class argument extends these tests to all bounded measurable functions of the earlier stopped history. Thus $M \( x \)$ is a continuous bounded martingale in that filtration.
  It is also a martingale in the ordinary driver filtration. On ${ tau_R > s }$ the histories through $s$ agree, while on ${ tau_R lt.eq s }$ the stopped increment vanishes. Complete and right-continuously augment this filtration if necessary. All processes in the following calculation are frozen at $tau_R$.
  ===== 10.6.3 The stochastic calculation. <the-stochastic-calculation.>
  Put
  $ X_t = g_t \( x \) \, #h(2em) A_t = \( x g'_t \( x \) \)^h \, #h(2em) M_t = A_t \( X_t - W_t \)^(- h) . $
  The processes $X \, A$ are adapted Lipschitz finite-variation processes. Since $M$ is positive and bounded away from zero,
  $ W_t = X_t - \( A_t \/ M_t \)^(1 \/ h) $
  makes the stopped driver a continuous semimartingale directly: apply Itô’s formula #cite(label("Eberle2019")) Theorem 6.31 to the smooth function $\( a \, m \) mapsto \( a \/ m \)^(1 \/ h)$ on the positive bounded range of $\( A \, M \)$. The resulting local-martingale part is
  $ N_t = integral_0^t frac(\( A_s \/ M_s \)^(1 \/ h), h M_s) thin thin upright(d) M_s \, $
  and the remaining part $B^(upright("fv")) = W - N$ is continuous adapted finite variation, hence predictable in the usual filtration. This gives $W = N + B^(upright("fv"))$ explicitly. The decomposition is unique because a continuous finite-variation local martingale is constant #cite(label("Eberle2019")) Corollary 6.22; thus the same decomposition is used for every choice of $x$. Before stopping, with $Y = X - W$, we have
  $ thin upright(d) X = 2 / Y thin thin upright(d) t \, #h(2em) thin upright(d) log A = - frac(2 h, Y^2) thin thin upright(d) t . $
  Itô’s formula gives
  $ frac(thin upright(d) M, M) = h / Y thin thin upright(d) W - frac(4 h, Y^2) thin thin upright(d) t + frac(h \( h + 1 \), 2 Y^2) thin thin upright(d) \[ W \] . $
  Since $M$ is a local martingale, uniqueness of its continuous local-martingale and finite-variation decomposition makes the finite-variation part vanish, so
  #[#set math.equation(numbering: n => "(10.10)")
   $ \( X - W \) thin thin upright(d) B^(upright("fv")) - 4 thin thin upright(d) t + frac(1 + h, 2) thin thin upright(d) \[ W \] = 0 . $ <chordal:characteristic-identity>]
  Use two distinct choices $x_1 \, x_2 > 2 R + 1$. Their observables are martingales under the #emph[same] limiting Dobrushin law. Their real characteristics stay strictly separated, since
  $ g_t \( x_2 \) - g_t \( x_1 \) = \( x_2 - x_1 \) exp (- integral_0^t frac(2 thin thin upright(d) s, \( g_s \( x_1 \) - W_s \) \( g_s \( x_2 \) - W_s \))) . $
  Subtracting their instances of (10.10) gives $thin upright(d) B^(upright("fv")) = 0$, and then $thin upright(d) \[ W \] = 8 thin thin upright(d) t \/ \( 1 + h \)$. Let good exit levels increase and exhaust finite time intervals. The driver is a continuous local martingale with $W_0 = 0$ and $\[ W \]_t = 8 t \/ \( 1 + h \)$. Lévy’s characterization #cite(label("Eberle2019")) Theorem 1.4 proves the proposition, because $8 \/ \( 1 + h \) = 4 \/ \( 1 - rho \)$. ◻
]

#proof[
  The actual irregular-disk estimate gives the conditional crossing bound in Theorem 116. The pure and actual disk estimates, together with the fixed-polygon formula, give the moving and stopped tests used in Proposition 118. These are the two inputs needed to identify the complete curve.
  Theorem 116, using the unforced-crossing theorem of #cite(label("KemppainenSmirnov2017")), gives joint subsequential compactness of the oriented curves and capacity drivers, with compatible generating curves and completion at the prescribed target. Proposition 118 identifies every limiting driver. Since $6 < kappa < 8$, Theorems 5.1 and 7.1 of #cite(label("RohdeSchramm2005")) give its continuous generating SLE trace and transience to infinity.
  For completeness, the common evolving hulls determine the continuous generating curve in capacity order. If $t < s$, strict capacity increase makes $K_s ∩ bb(H)_t$ nonempty, where $bb(H)_t$ is the older unbounded domain. This relatively closed subset is proper because $K_s$ is bounded and $bb(H)_t$ is unbounded. Connectedness of $bb(H)_t$ therefore gives a relative-boundary point of $K_s ∩ bb(H)_t$ in $bb(H)_t$. The boundary in $bb(H)$ of the unbounded component complementary to a compact trace is contained in that trace: a point outside the trace has a small disjoint disk and cannot separate two complementary components there. Thus this point belongs to every continuous generating trace by time $s$, but, since it lies in $bb(H)_t$, not by time $t$. Hence two candidate traces have a common point in their increments over $\( t \, s \]$. Letting $s arrow.b t$ and using continuity identifies their values at $t$. The completion statement in Theorem 116 identifies their endpoints as well.
  Every subsequential curve limit therefore has the specified SLE law. The initial normalized inverse maps converge uniformly up to the Jordan boundaries, so the identification transports to physical coordinates, including both endpoints. Local drawing replacements have curve distance $O \( delta \)$ and do not change the limit. Subsequential compactness and uniqueness now give full-sequence convergence in the stated oriented curve metric, with
  $ kappa = frac(4 pi, pi - lambda) = frac(4 pi, arccos \( - sqrt(q) \/ 2 \)) . $
  The conclusion concerns only the finite laws specified in the theorem. ◻
]

== 11 Finite current calculus and reflection geometry <sec:finite-calculus>

This appendix supplies the finite tensor and geometric statements used in Section 9. The tensor formulation belongs to the planar transfer-matrix and oriented-loop tradition #cite(label("TemperleyLieb1971")) #cite(label("BaxterKellandWu1976")); we give the finite current, extraction, and reflection arguments required here in full. More specifically, the finite-current, separator-tree, and four-mark constructions were developed from the approach in #cite(label("OpenAIConformalLimits2026")). This acknowledgment concerns those finite constructions, not its probabilistic estimates or convergence theorem; the proofs needed here are reproduced locally. Throughout,

$ 0 < lambda < pi / 2 \, #h(2em) rho = lambda / pi \, #h(2em) Q = - e^(upright(i) lambda) . $

In the application, $pi \/ 3 < lambda < pi \/ 2$. A finite tensor identity below means equality with arbitrary fixed spins on the external legs, hence also after contraction with any external tensor. The finite current, tree, extraction, and reflection identities are exact at finite volume. The norm consequence in Corollary 122 also uses the square-plane estimate of Theorem 91; it requires physical external networks and retains their reflected norms.

=== 11.1 A primitive with one source <calc:primitive>

The elementary source and diagonal-prefix tensors below specialize the dense-loop $macron(E)_1$ coproduct current of Ikhlef, Weston, Wheeler, and Zinn-Justin #cite(label("IkhlefWestonWheelerZinnJustin2013")) Sections 2.3, 2.5.1, 3.1–3.2, and 4.1, built on the nonlocal-current construction of Bernard and Felder #cite(label("BernardFelder1991")). We specify the path lifts and calculate the boundary-tree, extraction, and reflection identities needed here.

Use the tile and spin conventions of Section 8. Put

$ K \( zeta \) = mat(delim: "(", zeta, 0; 0, zeta^(- 1)) \, #h(2em) L_(-) = \| - chevron.r chevron.l + \| \, #h(2em) L_(+) = \| + chevron.r chevron.l - \| . $

Direct a simple tile-edge path $cal(C)$ from a specified starting point. The spin at a crossed tile side is measured using the left normal to the directed path step. A matrix inserted there has its row index on the right tile and its column index on the left tile. Round the path without self-intersections and choose a continuous lift of its tangent angle, starting from a specified initial lift.

The #emph[current primitive] $cal(J) \( cal(C) \)$ is the sum over the choice of exactly one marked step of $cal(C)$. At a marked step of lifted tangent angle $alpha$, insert

$ e^(upright(i) rho alpha) L_(-) . $

Insert $K \( Q \)$ at every earlier step and the identity at every later step. These matrices are additional to the ordinary tile tensors. Both strand arrows at the marked crossing point point away from it. Other sources and marked insertions must remain outside any corridor in which this path is subsequently deformed. Several paths starting at the same location are first separated into ordered lanes; their relative order is part of the data.

#thm([Lemma 11.1.])[
  (Local deformation of the current).  #emph[In the plus winding expansion, $cal(J) \( cal(C) \)$ is invariant, pairing by pairing, under simple-path isotopies which keep the endpoints in their original complementary regions, continue the initial tangent lift, and avoid all other insertions. A pure diagonal string obeys the corresponding deformation rule without a source. These are finite tensor identities for arbitrary outside spins.]
] <lem:current-identity>

#proof[
  Draw the strands smoothly and disjointly, with transverse intersections with the path. At such an intersection orthogonalize the lifted path tangent toward the crossing direction by an angle of absolute value less than $pi \/ 2$. At a tile-side intersection this agrees with the stated lattice convention.
  First slide the source along its strand, so that the strand tangent changes by $b$. The sum of the turns of the two departing strand pieces then changes by $- 2 b$. Their plus winding factor changes by $e^(- upright(i) rho b)$, which is canceled by the change in $e^(upright(i) rho alpha)$. All other spin constraints and prefix factors are preserved.
  The only additional elementary event in a generic isotopy is the birth or death of a pair of intersections at a tangency. Terms marked elsewhere are unchanged: the two new diagonal factors have opposite signed intersection numbers and cancel. The two terms marked at the new intersections cancel each other. To verify the sign, orient a test tangent $beta$ on the strand so that the two intersections, labeled $1 \, 2$, occur in that order both along the path and along the test direction. If the source is at intersection $2$, let $c_1 in { - 1 \, 1 }$ be the signed spin at intersection $1$. The strand there points away from the source, hence opposite to $beta$. The orthogonalized lifts satisfy
  #[#set math.equation(numbering: n => "(11.1)")
   $ \( alpha_2 - beta_2 \) - \( alpha_1 - beta_1 \) = - c_1 pi . $ <calc:tangency-lift>]
  For example, if the first path tangent is clockwise from $beta$, the two offsets are $- pi \/ 2 \, + pi \/ 2$ and $c_1 = - 1$; the other case reverses all signs. The ratio of the source gauge times the two source-piece winding factors is therefore $e^(- upright(i) c_1 lambda)$. The extra prefix factor is $Q^(c_1)$, and
  $ e^(- upright(i) c_1 lambda) Q^(c_1) = - 1 . $
  The outside constraints and all remaining factors of the two terms are identical. This proves their cancellation.
  A generic isotopy is a finite succession of transverse slides and such tangencies, after an arbitrarily small perturbation. It can be chosen to avoid the other fixed insertions. Continuity gives the result also for limiting positions. For a pure diagonal string there is no source term, so only cancellation of the two diagonal factors is required. Equivalently, this is the local ice-conservation identity. ◻
]

The initial lift matters. Moving it by $2 pi$ changes the current gauge, and is not among the isotopies in Lemma 119. The argument does not use positivity of an oriented winding summand.

=== 11.2 Evaluation on a separator tree <calc:tree>

Recall the boundary factors of Lemma 92. If $theta_j$ is the lifted inward normal at boundary port $j$, $h_j$ is its real height parameter, and $c = plus.minus 1$ is the inward/outward arrow sign, the factor is

#[#set math.equation(numbering: n => "(11.2)")
 $ b_j \( c \) = \( 2 sin lambda \)^(- 1 \/ 2) exp #h(-1em) {upright(i) c (frac(rho theta_j, 2) + lambda h_j)} . $ <calc:boundary-factor>]

In the following pairing evaluations we suppress the common product of scalar physical-tile coefficients. Restoring this configuration-independent factor on both sides gives the original tensor identity. Consider a tiled disk with a distinguished flat boundary gap $p$. Read its boundary in the positive order from $p$. Assume for the moment that no additional strings obstruct the path from $p$ to an interior vertex $z$. Give that path an initial tangent lift strictly between the positive boundary tangent and that tangent plus $pi$.

Fix the tile pairing. Every raw boundary-to-boundary arc cuts off a child boundary interval not containing $p$. These arcs are the edges of the separator tree of the complementary regions. Closed interior loops lie inside individual regions and are not edges of this tree. For a tree edge $e : i arrow.r j$ delimiting its child interval, put $m_e = h_i - h_j$ and set

#[#set math.equation(numbering: n => "(11.3)")
 $ w_e & = frac(cos \( \( m_e - 1 / 2 \) lambda \), sin lambda) \, & k_e & = - frac(cos \( \( m_e + 1 / 2 \) lambda \), sin lambda) \,\
a_e & = e^(- upright(i) lambda \( h_i + h_j \)) \, & c_(*) & = frac(e^(- upright(i) lambda), 2 sin lambda) . $ <calc:tree-coefficients>]

#thm([Lemma 11.2.])[
  (General separator-tree evaluation).  #emph[For the fixed pairing, the primitive from $p$ to $z$ is the sum over a marked edge of the separator-tree path from the root region at $p$ to the region containing $z$. A summand uses $k_e$ on all earlier edges of that path, $c_(*) a_e$ on its marked edge, and $w_e$ on every other boundary arc. Unmarked internal loops have weight $d = 2 cos lambda$, and a marked closed loop contributes zero.]
  #emph[For a pure $K \( Q \)$ string from $p$ to $z$, use $k_e$ on every edge of the separator-tree path and $w_e$ off it. A closed loop enclosing $z$ has weight $- 2$ in place of $d$. The parity of the number of such loops is the color change between the separator-tree region containing $z$ with its closed loops erased and the lattice color of $z$.]
] <lem:calc-tree-evaluation>

#proof[
  For each fixed pairing, choose the path separately, using Lemma 119. It can cross minimally the boundary arcs separating $p$ from $z$, in their tree order, and then cross the closed loops enclosing $z$ in nesting order. To construct such a simple path, pass successively through the open complementary regions of these disjoint curves, making each crossing in a small interior subarc. Those choices can be joined inside the respective regions without crossing any earlier separator again. A sole outward source on a closed loop is inconsistent with the orientation constraints on the rest of that loop, so its contribution is zero.
  For a parent-to-child crossing, let $beta$ be the tangent lift of the boundary-ordered arc, continued from $theta_i$, and let $alpha$ be the lifted path tangent. The exact relation is
  #[#set math.equation(numbering: n => "(11.4)")
   $ beta - alpha = pi / 2 \, $ <calc:exact-angle>]
  not merely this equality modulo $2 pi$. Indeed form a simple closed curve by following the boundary from $p$ to $i$, the arc to the crossing, and the reversed path back to $p$. Its positive total turn, including the right-angle turns at the port and crossing and the short turn at $p$, is $beta - alpha + 3 pi \/ 2$. The turning theorem makes it $2 pi$, proving (11.4).
  At an outward source the sum of the two strand-piece turns is $theta_i + theta_j - pi - 2 beta$. Multiplying its winding weight by the two outward boundary factors and the source gauge gives
  $ frac(1, 2 sin lambda) e^(- upright(i) lambda \( h_i + h_j \)) e^(upright(i) rho \( alpha - beta - pi \/ 2 \)) = c_(*) a_e . $
  Summing the two orientations of an unmarked boundary arc gives $w_e$. If the prefix crosses that arc, its extra $K \( Q \)$ factor changes the orientation sum to $k_e$. Only the earlier tree edges are crossed by the prefix of a term marked at a given tree edge, proving the first assertion.
  For a pure string, the same calculation applies to every crossed boundary arc. A counterclockwise enclosing loop has intersection factor $Q^(- 1)$, and its orientation sum is
  $ e^(upright(i) lambda) Q^(- 1) + e^(- upright(i) lambda) Q = - 2 . $
  Crossing any medial loop changes the adjacent color. This proves the stated parity convention. ◻
]

The four-mark reductions of this general tree rule are proved in Section 9. Lemma 120 asserts an exact signed evaluation, not a bound by a positive probability.

=== 11.3 Reflections and local two-step differences <calc:reflection>

Reflect the plane in a line of angle $phi.alt$, and combine the reflection with complex conjugation and arrow reversal. Relative to the reflected step direction, signed spins are unchanged, but the left and right tile indices are exchanged. The reflected primitive is therefore the alternative

#[#set math.equation(numbering: n => "(11.5)")
 $ L_(+) \, #h(2em) K \( Q^(- 1) \) \, #h(2em) e^(upright(i) rho alpha') \, #h(2em) alpha' = 2 phi.alt - alpha \, $ <calc:reflected-current>]

up to one common unit scalar determined by the initial lift. This follows directly by transposing the crossing matrix after reversing the arrows and conjugating its diagonal prefix. The extra constant in the reflected gauge is the same at every prospective marked step. The reflected local-deformation identity follows either from this operation or from the minus winding expansion.

In the notation of Theorem 91, the original current has $\( D \, epsilon.alt \, tau \) = \( L_(-) \, 1 \, 1 \)$ and its once-reflected version has $\( L_(+) \, - 1 \, 1 \)$. In particular, #emph[$tau$ remains $1$]. Further reflections alternate between these two alternatives. If $d_1 \, d_2$ are directed unit steps, complex conjugation carries $e^(upright(i) \( arg d_1 - arg d_2 \))$ to $e^(upright(i) \( arg d'_1 - arg d'_2 \))$, where $d'_1 \, d'_2$ are their reflected directions.

Let the tile mesh be $delta$. A #emph[low stencil] is a primitive increment on the straight extension consisting of two steps in one tile-axis direction. A #emph[high stencil] is the difference of two such increments in directions $d_1 \, d_2$ along the two different, orthogonal tile axes, with coefficient

#[#set math.equation(numbering: n => "(11.6)")
 $ e^(upright(i) \( arg d_1 - arg d_2 \)) $ <calc:high-coefficient>]

on the subtracted term. Both extensions have a common arriving prefix with a fixed lift, and their local path choices are simple and extensible. For the positively oriented coordinate axes this is precisely $delta_1^(\( 2 \)) + upright(i) delta_2^(\( 2 \))$, because the coefficient in (11.6) is $- upright(i)$.

We recall the finite operator form to make the interpretation explicit. At a fixed finite circumference, write $A^D \( z \)$ for a physical row with seam insertion $D$. It may be raw, or may carry one fixed common divisor per physical layer when the whole diagram is normalized. Put

#[#set math.equation(numbering: n => "(11.7)")
 $ P_zeta \( z \) & = A^(K \( zeta \)) \( z \) \, & M \( z \) & = e^(upright(i) tau rho z) A^D \( z \) \,\
N \( z \) & = M \( z \) P_zeta \( z \) + P_xi \( z \) M \( z \) \, & zeta / xi & = Q^epsilon.alt . $ <calc:row-current>]

The twists have modulus one. The two summands in $N$ are exactly the two choices of the marked step in a straight two-step increment: a mark on the earlier step leaves the other step after the source, while a mark on the later step places the other step before it. The distinction between $P_zeta$ and $P_xi$ records the one outgoing prefix charge. Matrix multiplication is read in the row order used for $A^D$.

#thm([Proposition 11.3.])[
  (Finite extraction with common external states).  #emph[Suppose a diagonal-time slab of positive macroscopic thickness around a low or high stencil contains no other source, non-diagonal insertion, or string endpoint. Diagonal chains may cross the slab. Assume that the stencil has an intact neighborhood disjoint from all other chains except its own arriving prefix, and that the slab has spare margins for rerouting and for two parallel cuts. Bounded lattice displacements within these margins are allowed.]
  #emph[Using only finite tensor identities, the stencil contraction can be written as a low operator $E_(upright("out")) N \( x \) E_(upright("in"))$ or a high operator 
#[#set math.equation(numbering: n => "(11.8)")
 $ E_(upright("out"))^x N \( x \) E_(upright("in"))^x - e^(upright(i) tau \( x - y \)) E_(upright("out"))^y N \( y \) E_(upright("in"))^y $ <calc:finite-high-operator>]

 between external states independent of the choice of stencil term. Each $E$ is an even product of before- or after-twist rows. The common-endpoint high blocks have exactly four physical rows in the positive-time direction in each term: the two rows of $N$ and two unmarked rows. Further rows needed for the common routing are absorbed in the common external states. Only one common bounded scalar is introduced. The same statement holds for reflected stencils. These assertions are finite operator identities with arbitrary external tensors.]
] <prop:finite-extraction>

#proof[
  There are two separate issues: the compared paths need common endpoints, and the rerouting of the background diagonal flux must contribute the same phase at every possible source position.
  ===== 11.3.1 Common endpoints and forward steps. <common-endpoints-and-forward-steps.>
  Use a diagonal-time frame in which the two positive-time tile directions are
  $ X = e^(- upright(i) pi \/ 4) \, #h(2em) Y = e^(upright(i) pi \/ 4) . $
  For brevity write $a \, b$ for these directions, including their mesh length. An increment in a negative direction is the negative of the corresponding forward increment ending at the original base vertex. This identity is local even if earlier reflection cuts have been made: choose a point on the common prefix within the intact neighborhood, write each increment as a difference of two complete primitives from that point, cancel their common initial marked terms, and use Lemma 119 inside the neighborhood.
  The following explicit choices give common endpoints:
  + For directions $a \, b$, start at $z$ and append two unmarked after-twist steps in the other direction, ending at $z + 2 a + 2 b$.
  + For directions $- a \, - b$, start at $z - 2 a - 2 b$, prepend two before-twist steps in the other direction, and end at $z$.
  + For directions $a \, - b$, use the path from $z - 2 b$ with successive steps $b \, b \, a \, a$.
  The case $- a \, b$ interchanges $a \, b$. In the mixed-sign case, rewriting the backward difference supplies the required relative minus sign. The angular coefficient is therefore precisely the coefficient for the two positive-time directions in the operator high combination. Every high term in these three constructions has two physical steps in direction $a$ and two in direction $b$. In operator order, read from right to left, with $x = arg a$, $y = arg b$, and $E = e^(upright(i) tau \( x - y \))$, the corresponding blocks are
  #[#set math.equation(numbering: n => "(11.9)")
   $ \( a \, b \) & P_xi \( y \)^2 N \( x \) - E P_xi \( x \)^2 N \( y \)\
\( - a \, - b \) & - #scale(x: 120%, y: 120%)[\[] N \( x \) P_zeta \( y \)^2 - E N \( y \) P_zeta \( x \)^2 #scale(x: 120%, y: 120%)[\]]\
\( a \, - b \) & N \( x \) P_zeta \( y \)^2 - E P_xi \( x \)^2 N \( y \) . $ <calc:common-endpoint-blocks>]
  Thus writing the finite identity with one divisor per physical row introduces the same four-row divisor in both high terms.
  Approach the common start by one prefix whose final segment is positive-time directed. If the original prefix arrives from the future side, first bend it around the stencil in the spare neighborhood, preserving its entrance and reserving a clear rectangle for the final positive steps. Choose this bend and its rounding consistently for both terms. The marker lifts then differ by the short angle between $a$ and $b$ in the common frame; no unrecorded $2 pi$ turn is made. The low case uses the same construction with one two-step increment. The explicit prefix charge is $Q^epsilon.alt$, with $epsilon.alt = 1$ or $- 1$ according to (11.5).
  ===== 11.3.2 Consolidating the diagonal background. <consolidating-the-diagonal-background.>
  Keep as common background every diagonal chain except the explicit prefix steps between the common start and the source. In particular, the charge arriving at the common start belongs to that background. By ice conservation, route the background to carry total twist $zeta$ on a positive-time seam before the start and twist $xi$ from the start through the comparison block and toward the future seam. The net charges through the ordinary sections obey $zeta \/ xi = Q^epsilon.alt$. All other endpoints remain fixed.
  Joining and funneling these chains is done inside the vacant slab and its spare margins, outside the actual sandwich cuts when necessary. The cuts can be chosen through level vertices of the positive-time seam with many physical rows on each side. Transverse lattice displacements cost only boundedly many rows. No monotone path between the original remote cut positions is required.
  In the small comparison rectangle, place the $xi$ background first on a common skirt on the higher-space-coordinate side of both positive-step paths. In $\( X \, Y \)$ coordinates this is the northwest side of the rectangle between their common endpoints. It avoids every possible marker edge. Ice conservation moves this skirt onto either compared path, always on the same left-spin side of a broken source edge. The diagonal twist therefore multiplies $L_(-)$ or $L_(+)$ on a fixed side. Since $K \( xi \) L_plus.minus$ and $L_plus.minus K \( xi \)$ are scalar multiples of $L_plus.minus$, and the chosen side is fixed, this contributes one common unit scalar.
  ===== 11.3.3 Why the source phase is term independent. <why-the-source-phase-is-term-independent.>
  The difference between the original background routing and the common skirt is a closed weighted tile-edge chain in the larger slab. It is a weighted sum of face boundaries. Summing ice conservation cancels each ordinary face contribution; only a source edge can contribute. Define its signed spin jump as the column spin minus the row spin. It is $2$ for $L_(-)$ and $- 2$ for $L_(+)$, hence $2 epsilon.alt$ in the positive-step convention. In either reflected alternative it is fixed throughout the stencil.
  All possible source edges see the same face coefficient of this closed-chain difference. Indeed the other original chains avoid the intact stencil neighborhood. The replacement prefix approaches from the past without entering the positive comparison rectangle; the replacement before the start follows the same incoming line with net charge $zeta$; and the common skirt and outgoing seam remain outside that rectangle. Thus no segment of the routing difference separates the interiors of two candidate source edges. The incoming and outgoing clear segments may be lengthened by boundedly many steps if a vertex incidence requires separation. The relevant face coefficient is constant throughout the marker rectangle, including incidence limits at its boundary.
  It follows that the conservation calculation contributes a common unit phase to every term, not a different factor multiplying the two high-stencil summands. No other defect contributes, because every change was confined to the clear slab and its margins. One can equivalently perform a sequence of elementary path slides kept consistently on one side of the entire marker rectangle.
  ===== 11.3.4 Completion of the finite operator identity. <completion-of-the-finite-operator-identity.>
  We have obtained exactly the twists, source gauges and row order in (11.7). The appended or prepended unmarked path pieces become the even compensating pairs in (11.8). They represent different cuts through the same physical tensor network, not added sampled edges. The remaining external tensors, and hence $Psi_(-) \, Psi_(+)$, are the same for both high terms. This completes the operator identification without using any transfer estimate.
  ===== 11.3.5 Compatibility with later cuts. <compatibility-with-later-cuts.>
  At a subsequent reflection cut, a consolidated diagonal chain ends at a shared level vertex. Conjugation inverts its charge in the mirrored direction, and reversing that path direction inverts it again. The joined chain therefore carries its old flux and creates no endpoint or new phase charge. For a tile-axis cut, route all chains transversely through level vertices, with no run along the cut; the spare margin permits this. The same calculation applies. The matching square-layer metric remains between the past and future states: a nearby string acts on its own state and does not replace that metric. These observations also prove the reflected assertion and compatibility with further extractions. ◻
]

#thm([Corollary 11.4.])[
  (Physical extraction rates).  #emph[Assume the parameter range of Theorem 91. In the setup of Proposition 121, suppose the two clear sides contain at least $n$ physical time steps. Require the external tensors to come from fixed finite physical-layer networks of Theorem 91. Fix the mesh, the routing, and all inserted data before taking the even circumference-to-infinity limit. Normalize each physical row by its own vacuum divisor as in (8.38). The resulting plane vacuum coefficient is bounded by 
#[#set math.equation(numbering: n => "(11.10)")
 $ C n^(- 1 + rho) parallel Psi_(-) parallel parallel Psi_(+) parallel quad upright("or") quad C n^(- 1 - rho) parallel Psi_(-) parallel parallel Psi_(+) parallel \, $ <calc:extraction-rates>]

 for the low or high stencil, respectively. Here $parallel Psi_plus.minus parallel^2$ denotes the corresponding nonnegative reflected plane vacuum ratio, which is finite, with its matching cut kernel from Theorem 91. The constant may depend on the fixed routing geometry. Ordinary tile-axis folds satisfy the corresponding plane Cauchy–Schwarz inequality.]
] <cor:finite-extraction-rates>

#proof[
  Proposition 121 gives the fixed physical operator blocks with common external networks. Its equal-total four-row high blocks permit their exact per-layer normalization at each finite circumference. Theorem 91 then gives (11.10) and the tile-axis reflection inequality in its prescribed plane limit. ◻
]

#prodef([Remark 11.5.])[
  (What extraction does not bound).  Corollary 122 leaves both external state norms in place. Their squared norms are genuine reflected diagrams, not universal constants. Section 9 estimates their full partition, local-tilt and parity costs. Neither the finite path identities nor reflection geometry supplies a uniform bound on arbitrary boundary tensors.
] <calc:external-norms>

=== 11.4 Finite reflection templates <calc:reflection-construction>

We construct finitely many reflections that place nearly the full weighted inventory of each probe in a clear diagonal extraction slab. This is the geometric input to the mixed-stencil estimate in Section 9.6. Horizontal folds create long runs of repeated cells along the vertical coordinate around the probes; vertical folds align most probe columns so that their slope-$+ 1$ lines pass through the gaps in every vertical wall. A finite extraction tree then removes those probes.

All expected counts below use the half-weights of a binary tree of inequalities, rather than a law of lattice configurations. The geometry is independent of the random-cluster parameter. Its extraction operations use Proposition 121; Corollary 122 supplies the corresponding physical norm inequalities when the template is applied to the observable. Iterating those inequalities averages the extraction exponents with these same half-weights. The expected counts below record the extracted probe exponents and give expected copy count one for each original background feature; after a preliminary fold, its expected even and odd counts are both $1 \/ 2$. Section 9.6 separately estimates the remaining leaf norms, bounding their logarithmic background costs by fixed contributions indexed by the original feature and its reflection parity, together with controlled remainder terms. Only after those estimates are the copy-count identities used to average the costs.

===== 11.4.1 The geometric data. <the-geometric-data.>

Work in the orthogonal tile coordinates $\( x \, y \)$. The data consist of finitely many initial horizontal and vertical solid segments, marked features on them, remote endpoints, and two distinct interior probe points $v_i = \( x_i \, y_i \)$, $i = 1 \, 2$. Small local insertion boxes will surround the probes. The true vertical wall levels lie in

$ X_(*) + G_(*) bb(Z) \, #h(2em) G_(*) > 0 . $

This is the only arithmetic property of the rational polygon that we use. The two probe ordinates are distinct, avoid all horizontal walls and feature heights, and lie in disjoint open bands containing no remote endpoint. Their abscissas avoid the vertical wall levels. Finally, the probes lie on neither of the same two axis diagonals:

$ x_1 - y_1 eq.not x_2 - y_2 \, #h(2em) x_1 + y_1 eq.not x_2 + y_2 . $

All these conditions have strict margins on a sufficiently small compact product neighborhood of the probe pair. We call such a neighborhood #emph[eligible]. The forbidden wall levels and feature heights here refer to these initial data, before any probe-dependent primary anchors, secondary gaps, or cut locations are chosen. The latter enter each finite template, not the global exceptional set.

For a tensor-diagram application, fix the common diagonal routes so that each probe box meets only its own arriving prefix. All other diagonal chains avoid both boxes. Shrinking the eligible neighborhood preserves this condition for every stencil term. Subsequent joins and reroutings are required to preserve these intact boxes; the proof below verifies this invariant through the entire template.

Open primary gaps at every true corner. For each probe neighborhood, choose a fixed anchor ordinate $y_(* \, i)$ and a number $H_i > 0$ such that $G_(*) \/ \( 2 H_i \)$ is a positive integer. Shrink the neighborhoods, and choose $H_i$ small compared with their distances to other feature heights and with the larger of the two horizontal clearances at the probe. Require that, for every $y_i$ in its neighborhood,

#[#set math.equation(numbering: n => "(11.11)")
 $ l_i = frac(y_i + y_(* \, i) - H_i, 2) \, #h(2em) y_i in \( l_i \, l_i + H_i \) \, #h(2em) 2 l_i + H_i = y_i + y_(* \, i) \, $ <calc:marker-cell>]

with uniform positive margins. Both intervals in (11.11) lie in their respective feature-free bands. This is possible by taking $y_(* \, i)$ at the center of the probe band, then taking its width smaller than $H_i$. Open a primary gap centered at $y_(* \, i)$ on every vertical wall that meets that band. The primary gaps have fixed positive widths, comparable to a sufficiently small $h$; they avoid the marked features and one another. Their widths remain fixed throughout the construction below.

A #emph[fold] across an axis-parallel line retains either open half-plane and adjoins its reflected copy. Each of the two resulting diagrams has exponent $1 \/ 2$ in the Cauchy–Schwarz inequality. A cut will eventually be made vacant by small secondary gaps, if necessary. It never meets a probe box, marked feature, or remote endpoint. A copy of a probe is #emph[favorable] if the slope-$+ 1$ line through it has a solid-free open slab of positive width, containing no other local insertion or endpoint and no marked feature. We also require that the values $x - y$ of all the insertion copies in the diagram are distinct. The widths and separations here are macroscopic constants; they need not be uniform as $h$ tends to zero.

For a finite binary tree, assign a leaf the product of the factors $1 \/ 2$ on its ancestral edges. An #emph[expected count] always means the sum of its leaf counts with these weights. Tag each probe and each retained feature by its original identity, so that copies can be counted separately for every original object. For the feature ledger, the original diagram is understood after all primary and secondary gaps have been inserted: its solid features are the resulting separated straight fragments and their tips, together with the protected marks and endpoints. A segment that is later divided by a secondary gap is not counted as one intact feature across that gap.

#thm([Lemma 11.6.])[
  (Finite reflection templates).  #emph[Fix eligible geometric data and their primary gaps. For every $epsilon > 0$, there is a finite tree of axis folds and extraction operations satisfying the finite hypotheses of Proposition 121, together with finitely many secondary gaps on the remaining straight solids, such that the expected extracted count of each original probe is at least $1 - epsilon$. Every cut and extraction band has a strictly positive clearance from the other local data. Each original non-insertion feature has expected copy count one. The tree may be chosen with at least one preliminary fold; its expected even and odd reflection counts for each such feature are then both $1 \/ 2$.]
  #emph[On a compact set of eligible probe pairs with these fixed primary gaps, finitely many templates suffice. The union of their secondary-gap locations can be used for all these templates, with a sufficiently small fixed common gap width. After shrinking the covering neighborhoods to compact subneighborhoods, buffered supports for the finitely many tips, protected marks, and endpoints may be chosen uniformly over every probe pair in them and transported to all reflected copies. They avoid all foreign solids and features, probe boxes, and cut or rerouting margins. All choices are made before the mesh limit. For sufficiently fine mesh, rounding the cuts and gap ends to the appropriate vertex lines, and moving the original data by boundedly many mesh steps, preserves the conclusions.]
] <lem:reflection-templates>

We first prove a word-folding lemma that supplies arbitrarily long runs with small expected loss, followed by a counting lemma for extraction. In the geometric construction, however, the finite abscissa-alignment schedule is chosen before the required run length. This order is essential: that schedule determines how far a diagonal line must remain inside one feature-free run of horizontal bands. The final step makes the cuts vacant and verifies the routing, parity, and stability assertions.

==== 11.4.1 Word folding and long pure runs <word-folding-and-long-pure-runs>

Divide a bounded vertical interval containing all the data, with empty margins at its ends, into finitely many cells. Give every original cell a different label, and include the two marker cells of (11.11) among them. The widths of differently labeled cells need not agree. A horizontal fold at a cell boundary acts on the word of labels. If the prefix and suffix are $W$ and $V$, respectively, its children have words

#[#set math.equation(numbering: n => "(11.12)")
 $ W W^(upright("rev")) \, #h(2em) V^(upright("rev")) V . $ <calc:word-fold>]

The reversal also reverses each cell’s physical orientation.

#thm([Lemma 11.7.])[
  (Finite word purification).  #emph[Suppose a finite word initially has length $m_0$ and each marker label occurs once. Given an integer $R gt.eq 1$ and $eta > 0$, finitely many folds of the form (11.12), followed by finitely many whole-word end folds, have the following property. In each nonempty leaf choose a majority label. Count a marker cell as usable only if it has that label and its $R$ neighboring cells on each side exist and have the same label. For either original marker, the expected number of its unusable copies is less than $eta$.]
] <calc:word-purification>

#proof[
  The half-weight average preserves the count of each label, but words of different lengths are difficult to compare under those weights. We therefore first bias a leaf by its length. Under this auxiliary law its frequency vector is a martingale, and a variance argument forces it toward a single label. We then return to half-weights to bound the actual number of unusable copies.
  Write $N$ for the vector of label counts of a word of length $m$, and $pi = N \/ m$ for its frequency vector. At an interior cut after letter $j$, the children’s lengths are $2 j$ and $2 \( m - j \)$. Besides the ordinary half-weight law $P$, use the size-biased law $Q$ that selects these children with probabilities $j \/ m$ and $\( m - j \) \/ m$. If $A_j$ is the count vector of the prefix and $D_j = A_j - j pi$, then
  #[#set math.equation(numbering: n => "(11.13)")
   $ bb(E)_Q \[ pi' divides w \] = pi \, #h(2em) bb(E)_Q \[ parallel pi' - pi parallel^2 divides w \] = frac(parallel D_j parallel^2, j \( m - j \)) . $ <calc:word-variance>]
  For $m gt.eq 3$, restrict the cut to the following two consecutive positions:
  $ J_m = cases(delim: "{", { m \/ 2 - 1 \, m \/ 2 } \, & m gt.eq 4 upright(" even") \,, { \( m - 1 \) \/ 2 \, \( m + 1 \) \/ 2 } \, & m upright(" odd") .) $
  For $m = 2$ use $j = 1$. A length-one word is already pure and can be held fixed. Choose a cut maximizing the variance in (11.13). Put $d \( pi \) = min_a parallel e_a - pi parallel$, where $e_a$ ranges over the vertices of the frequency simplex. For consecutive admissible positions,
  $ D_(j + 1) - D_j = e_(w_(j + 1)) - pi . $
  At least one of the two deviations has norm at least $d \( pi \) \/ 2$. Thus the chosen conditional variance is at least $d \( pi \)^2 \/ m^2$. The same bound holds for $m = 2$: a mixed word has two different letters and conditional variance $1 \/ 2$.
  We verify that the varying word length cannot defeat this variance bound. Set $x = \( 2 j - m \) \/ m$, so $\| x \| lt.eq 1 \/ 2$, and let $m_t$ be the size-biased length chain. Its next length is $m \( 1 + x \)$ or $m \( 1 - x \)$ with probabilities $\( 1 + x \) \/ 2$ and $\( 1 - x \) \/ 2$. Consequently,
  #[#set math.equation(numbering: n => "(11.14)")
   $ 0 lt.eq bb(E)_Q \[ log m_(t + 1) - log m_t divides w_t \] & = frac(\( 1 + x \) log \( 1 + x \) + \( 1 - x \) log \( 1 - x \), 2) lt.eq C / m_t^2 \,\
bb(E)_Q \[ \( log m_(t + 1) - log m_t \)^2 divides w_t \] & lt.eq C / m_t^2 . $ <calc:word-log-length>]
  The constant is absolute. The inequalities follow either by differentiating the displayed function on $\[ - 1 \/ 2 \, 1 \/ 2 \]$ or by its Taylor expansion with bounded remainder there.
  In fact,
  #[#set math.equation(numbering: n => "(11.15)")
   $ sum_(t gt.eq 0) m_t^(- 2) = oo quad Q upright("-almost surely") . $ <calc:word-length-divergence>]
  To prove this, subtract the conditional drifts in (11.14) from $log m_t$. Stop the resulting martingale when $sum_(s < t) m_s^(- 2)$ first exceeds an integer $K$. Its stopped quadratic variation has bounded expectation, by (11.14), so the stopped martingale converges almost surely. On the event that the unstopped sum is finite, choose $K$ larger than that sum. Both the martingale and its drift then converge to finite limits. Thus $log m_t$ has a finite limit, contradicting $m_t arrow.r oo$, which the summability assumption requires. This proves (11.15).
  The bounded vector martingale $pi_t$ converges almost surely and has almost surely finite total conditional squared variation. If its limit were not a simplex vertex, $d \( pi_t \)$ would eventually be bounded below by a positive constant. Equation (11.13) and (11.15) would then force its conditional squared variation to diverge. Hence $pi_t$ tends to a pure label, and bounded convergence gives
  #[#set math.equation(numbering: n => "(11.16)")
   $ bb(E)_Q \[ 1 - max_a pi_(T \, a) \] arrow.r 0 #h(2em) \( T arrow.r oo \) . $ <calc:word-impurity>]
  The change of weights is exact at every nonempty finite leaf $v$:
  #[#set math.equation(numbering: n => "(11.17)")
   $ Q \( v \) = P \( v \) frac(m \( v \), m_0) . $ <calc:word-size-bias>]
  Indeed the one-step density factor is the child’s length divided by its parent’s length, so the factors telescope. In particular, the expected count of any label under $P$ equals its initial count.
  For a leaf word choose a majority label and write $alpha = 1 - max_a pi_a$. Let $B_i$ count the unusable occurrences of marker label $i$. If $i$ is not the chosen majority, then $B_i \/ m lt.eq alpha$. Otherwise an unusable occurrence is within $R$ cells of a minority letter or within $R$ cells of a word end. A union bound gives, in both cases,
  #[#set math.equation(numbering: n => "(11.18)")
   $ B_i / m lt.eq \( 2 R + 1 \) alpha + frac(2 R, m) . $ <calc:word-run-bound>]
  After a finite purification depth $T$, perform $r$ folds at an outer end, retaining the whole word and its mirror in the nonempty child. The other child is empty. Under $Q$ the nonempty child has probability one, the frequency vector is unchanged, and the length is at least $2^r$. Equations (11.17) and (11.18) yield
  $ bb(E)_P B_i lt.eq m_0 #scale(x: 120%, y: 120%)[\(] \( 2 R + 1 \) bb(E)_Q alpha_T + 2 R thin 2^(- r) #scale(x: 120%, y: 120%)[\)] . $
  Choose finite $T$ using (11.16), and then finite $r gt.eq 1$, to make this less than $eta$, simultaneously for both marker labels. The outer cuts can be placed in the empty end margins. Their ideal locations, like the other cuts, will be perturbed slightly at the end of the construction. ◻
]

Adjacent occurrences of the same label have opposite orientations. Initially this holds vacuously because the labels are distinct. It is preserved inside each half of (11.12), and at the new join the two neighboring cells are mirror images. Therefore, on a pure run of marker label $i$, projection to its original cell is a triangular wave $f$ of period $2 H_i$, satisfying

#[#set math.equation(numbering: n => "(11.19)")
 $ f \( t + H_i \) = 2 l_i + H_i - f \( t \) . $ <calc:triangular-wave>]

For every marker ordinate $b'$ in that run,

#[#set math.equation(numbering: n => "(11.20)")
 $ f \( b' \) = y_i \, #h(2em) f \( b' + H_i \) = y_(* \, i) . $ <calc:marker-anchor>]

The second identity follows directly from (11.11); it holds in either orientation.

#thm([Lemma 11.8.])[
  (Finite median extraction).  #emph[Suppose a finite diagram contains $k_0$ favorable insertion copies with distinct diagonal projections. At an extraction, form two formal children by doubling the retained copies on either side and assigning each child weight $1 \/ 2$, as in the reflected diagrams of Proposition 121. For every $delta > 0$, a finite tree of extractions leaves expected favorable count below $delta$. More precisely, depth $T$ leaves at most $k_0^2 \/ T$. All counts refer to these formal half-weights; no norm bound is asserted by this counting lemma.]
] <lem:calc-median-extraction>

#proof[
  At a node with $k > 0$ favorable copies, extract one at a median projection. If $k_(-)$ and $k_(+)$ remain strictly on its two sides, the two children contain $2 k_(-)$ and $2 k_(+)$ favorable copies. Their half-average is $k - 1$, and each is at most $k$. The bands can be narrowed to preserve the other favorable slabs. Let $K_t$ be the remaining favorable count under the half-weights, held at zero after extinction, and let $tau$ be its first zero time. The conditional mean decrement is one before $tau$, so
  $ bb(E) \( t and tau \) lt.eq k_0 \, #h(2em) K_t lt.eq k_0 \, #h(2em) bb(E) K_T lt.eq k_0 bb(P) \( tau > T \) lt.eq k_0^2 / T . $
  This proves the finite-depth assertion. Tagging the insertions shows that each extraction counts the selected copy once, while all other tagged counts are preserved in half-average. ◻
]

==== 11.4.2 Abscissa alignment and the two tails <abscissa-alignment-and-the-two-tails>

#proof[
  Fix a target marker label $i$, abbreviate $H = H_i$ and $x_0 = x_i$, and first design its vertical folds without using any horizontal word depth. Choose the farther of its two horizontal wall-free sides. We describe the case in which this is the left side. Take $H$ sufficiently small that $\( x_0 - 2 H \, x_0 \)$ is wall-free, and choose $r_(+) > 0$ such that $\( x_0 \, x_0 + r_(+) \)$ is wall-free as well. If the farther side is the right side, reverse the horizontal coordinate in this construction. Congruence modulo $2 H$ and the identity $f \( b' - H \) = f \( b' + H \)$ make the verification below identical.
  All copies of the target marker initially have abscissa $x_0$. At each step cut to the right of their rightmost abscissa, retain the left child, and reflect it. The other child contains no copy of the #emph[target label]; it need not be empty of other markers. It remains in the full inequality tree. If the current rightmost target copy is at $a_(k - 1)$ and the cut is at $c_k > a_(k - 1)$, then the new rightmost target copy is
  #[#set math.equation(numbering: n => "(11.21)")
   $ a_k = 2 c_k - x_0 . $ <calc:abscissa-maximum>]
  The leftmost copy stays at $x_0$. The projection to the original abscissa is the identity for $x lt.eq x_0$, and its new right tail is
  #[#set math.equation(numbering: n => "(11.22)")
   $ P_k \( x \) = a_k + x_0 - x #h(2em) \( x gt.eq a_k \) . $ <calc:abscissa-tail>]
  Both assertions follow inductively by applying the reflection $x mapsto 2 c_k - x$ on the new right half.
  We align most target copies modulo $2 H$ with
  $ A_(*) = X_(*) - H . $
  Let $D in \( 0 \, 2 H \]$ be the positive displacement congruent to $A_(*) - x_0$ modulo $2 H$. Choose an integer $N$ and set $v = D \/ N$. Require $v < r_(+)$. The first cut is $c_1 = x_0 + v$. For each $k gt.eq 2$, choose the unique $d_k in \[ H \, 2 H \)$ such that
  #[#set math.equation(numbering: n => "(11.23)")
   $ c_k = a_(k - 1) + d_k equiv x_0 + k v med \( mod med H \) . $ <calc:abscissa-cuts>]
  An interval of length $H$ contains exactly one representative of each residue modulo $H$, so this prescription is possible. The central projection remains wall-free: after the first fold it takes values in $\[ x_0 \, x_0 + v \]$, and at a later fold the only newly sampled old-tail portion has projection in $\[ x_0 - d_k \, x_0 \]$. Consequently, for every $k$,
  #[#set math.equation(numbering: n => "(11.24)")
   $ P_k \( \[ x_0 \, a_k \] \) subset \[ x_0 - 2 H \, x_0 + v \] \, $ <calc:abscissa-central>]
  whose endpoints may be given additional strict wall-free margins by the original choice of $H$ and $v$.
  To quantify the alignment, lift the empirical residues of the $2^k$ target columns to real numbers. Start with lift $x_0$. If the old lifted mean is $mu$, adjoin to every lift $a$ its reflected lift $2 \( mu + v \) - a$. This is consistent with the physical reflection because (11.23) says $c_k equiv mu + v med \( mod med H \)$. The new mean is $mu + v$, and the variance increases by exactly $v^2$: the two equal halves have means $mu$ and $mu + 2 v$ and the same previous variance. At the end,
  #[#set math.equation(numbering: n => "(11.25)")
   $ mu_N = x_0 + D equiv A_(*) med \( mod med 2 H \) \, #h(2em) "Var" \( a \) = N v^2 = D^2 / N . $ <calc:abscissa-variance>]
  For any fixed tolerance $gamma > 0$, the fraction of columns whose residue is not within $gamma$ of $A_(*)$ is at most $D^2 \/ \( N gamma^2 \)$. Choose $gamma$ much smaller than the primary gap widths, and then choose finite $N$ to make this fraction as small as desired. The same choice can ensure $v < r_(+)$. Moreover, the last cut gives the exact tail congruence
  #[#set math.equation(numbering: n => "(11.26)")
   $ a_N + x_0 = 2 c_N equiv 2 A_(*) med \( mod med 2 H \) . $ <calc:abscissa-tail-residue>]
  Here is the order-of-choice point. Let $\[ L_0 \, R_0 \]$, with $L_0 < x_0$, contain the original horizontal support of all data. Horizontal word folds do not change this support. After the retained vertical folds, the horizontal support is contained in
  $ \[ L_0 \, 2 c_N - L_0 \] = \[ L_0 \, a_N + x_0 - L_0 \] . $
  Its span is bounded by the finite number $S = 2 \( c_N - L_0 \)$, determined by the abscissa schedule alone. Thus we may first choose this schedule and then choose an integer run radius $R_i$ with $R_i H_i > S + 2 H_i$. Only after this choice do we invoke Lemma 125, with $R gt.eq max \( R_1 \, R_2 \)$ and a suitably small impurity tolerance. There is no dependence on the eventual vertical extent of the folded word.
  Consider a target copy $\( a \, b' \)$ in a usable pure run and in a successful column. Throughout the entire horizontal support, the line $y = b' + x - a$ stays within that pure run, with a positive buffer. Its vertical projection therefore stays in the clear marker band. It cannot meet a horizontal wall, endpoint, or marked feature. On the central interval, (11.24) excludes every vertical wall. In the left tail, a preimage of a vertical wall has abscissa congruent to $X_(*)$ modulo $2 H$. Since $a equiv A_(*) + O \( gamma \)$, its horizontal displacement from the marker is $H + O \( gamma \)$ modulo $2 H$. Equation (11.20) sends its ordinate to within $O \( gamma \)$ of $y_(* \, i)$, inside the primary gap. In the right tail, a wall preimage satisfies $a_N + x_0 - x equiv X_(*) med \( mod med 2 H \)$; by (11.26) this again gives $x equiv X_(*) med \( mod med 2 H \)$. The identical primary-gap argument applies there. The triangular projection is $1$-Lipschitz, so choosing $gamma$ smaller than, for example, one tenth of the smallest primary half-gap width leaves a positive clearance. The line consequently has a solid-free slab of fixed positive width. Figure 11 separates the two coordinate projections in this argument: the triangular ordinate projection sends both tail crossings to primary gaps, while the central abscissa projection stays in a wall-free interval.
  #figure(
    [#strong[(a) Projection along a pure run]
  #cetz.canvas({
  import cetz.draw: *
  line((-1.6, 0), (0, 1.6), (1.6, 0), (0, -1.6), close: true, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((0, 1.77), [#text(size: 9pt)[dual corner]], anchor: "south")
  content((-1.77, 0), [#text(size: 9pt)[primal#linebreak()corner]], anchor: "east")
  content((-0.8, 0.8), [#text(size: 9pt)[$1$]], anchor: "south-east")
  content((0.8, 0.8), [#text(size: 9pt)[$2$]], anchor: "south-west")
  content((0.8, -0.8), [#text(size: 9pt)[$3$]], anchor: "north-west")
  content((-0.8, -0.8), [#text(size: 9pt)[$4$]], anchor: "north-east")
  line((4.5, 0), (6.1, 1.6), (7.7, 0), (6.1, -1.6), close: true, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((6.1, 1.77), [#text(size: 9pt)[dual corner]], anchor: "south")
  content((4.33, 0), [#text(size: 9pt)[primal#linebreak()corner]], anchor: "east")
  content((5.3, 0.8), [#text(size: 9pt)[$1$]], anchor: "south-east")
  content((6.9, 0.8), [#text(size: 9pt)[$2$]], anchor: "south-west")
  content((6.9, -0.8), [#text(size: 9pt)[$3$]], anchor: "north-west")
  content((5.3, -0.8), [#text(size: 9pt)[$4$]], anchor: "north-east")
  line((-1.6, 0), (1.6, 0), stroke: (thickness: 1.0pt))
  content((0, -0.015), [#text(size: 8pt)[primal diagonal]], anchor: "north")
  bezier((-0.8, 0.8), (0.8, 0.8), (-0.5, 0.35), (0.5, 0.35), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  bezier((-0.8, -0.8), (0.8, -0.8), (-0.5, -0.35), (0.5, -0.35), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  line((6.1, -1.6), (6.1, 1.6), stroke: (thickness: 1.0pt))
  content((6.085, 0), [#page_rotate(-90deg)[#text(size: 8pt)[dual diagonal]]], anchor: "south")
  bezier((5.3, 0.8), (5.3, -0.8), (5.75, 0.5), (5.75, -0.5), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  bezier((6.9, 0.8), (6.9, -0.8), (6.45, 0.5), (6.45, -0.5), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  circle((-1.6, 0), radius: 0.08467, fill: black, stroke: none)
  circle((1.6, 0), radius: 0.08467, fill: black, stroke: none)
  circle((0, 1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((0, -1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((-0.8, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((0.8, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((0.8, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((-0.8, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((4.5, 0), radius: 0.08467, fill: black, stroke: none)
  circle((7.7, 0), radius: 0.08467, fill: black, stroke: none)
  circle((6.1, 1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((6.1, -1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((5.3, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((6.9, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((6.9, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((5.3, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  content((0, -2.15), [#text(size: 9pt)[Primal open#linebreak()pairings $1:2$ and $3:4$]])
  content((6.1, -2.15), [#text(size: 9pt)[Primal closed, dual open#linebreak()pairings $1:4$ and $2:3$]])
})0
  $f \( t + H \) = 2 l + H - f \( t \) \,$
  $y_i + y_(* \, i) = 2 l + H .$
  The signs record the alternating
  orientations of successive cells.
  #strong[(b) One successful column]
  #cetz.canvas({
  import cetz.draw: *
  line((-1.6, 0), (0, 1.6), (1.6, 0), (0, -1.6), close: true, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((0, 1.77), [#text(size: 9pt)[dual corner]], anchor: "south")
  content((-1.77, 0), [#text(size: 9pt)[primal#linebreak()corner]], anchor: "east")
  content((-0.8, 0.8), [#text(size: 9pt)[$1$]], anchor: "south-east")
  content((0.8, 0.8), [#text(size: 9pt)[$2$]], anchor: "south-west")
  content((0.8, -0.8), [#text(size: 9pt)[$3$]], anchor: "north-west")
  content((-0.8, -0.8), [#text(size: 9pt)[$4$]], anchor: "north-east")
  line((4.5, 0), (6.1, 1.6), (7.7, 0), (6.1, -1.6), close: true, stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((6.1, 1.77), [#text(size: 9pt)[dual corner]], anchor: "south")
  content((4.33, 0), [#text(size: 9pt)[primal#linebreak()corner]], anchor: "east")
  content((5.3, 0.8), [#text(size: 9pt)[$1$]], anchor: "south-east")
  content((6.9, 0.8), [#text(size: 9pt)[$2$]], anchor: "south-west")
  content((6.9, -0.8), [#text(size: 9pt)[$3$]], anchor: "north-west")
  content((5.3, -0.8), [#text(size: 9pt)[$4$]], anchor: "north-east")
  line((-1.6, 0), (1.6, 0), stroke: (thickness: 1.0pt))
  content((0, -0.015), [#text(size: 8pt)[primal diagonal]], anchor: "north")
  bezier((-0.8, 0.8), (0.8, 0.8), (-0.5, 0.35), (0.5, 0.35), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  bezier((-0.8, -0.8), (0.8, -0.8), (-0.5, -0.35), (0.5, -0.35), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  line((6.1, -1.6), (6.1, 1.6), stroke: (thickness: 1.0pt))
  content((6.085, 0), [#page_rotate(-90deg)[#text(size: 8pt)[dual diagonal]]], anchor: "south")
  bezier((5.3, 0.8), (5.3, -0.8), (5.75, 0.5), (5.75, -0.5), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  bezier((6.9, 0.8), (6.9, -0.8), (6.45, 0.5), (6.45, -0.5), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt))
  circle((-1.6, 0), radius: 0.08467, fill: black, stroke: none)
  circle((1.6, 0), radius: 0.08467, fill: black, stroke: none)
  circle((0, 1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((0, -1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((-0.8, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((0.8, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((0.8, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((-0.8, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((4.5, 0), radius: 0.08467, fill: black, stroke: none)
  circle((7.7, 0), radius: 0.08467, fill: black, stroke: none)
  circle((6.1, 1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((6.1, -1.6), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt))
  circle((5.3, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((6.9, 0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((6.9, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  circle((5.3, -0.8), radius: 0.05644, fill: rgb("#0000a6"), stroke: none)
  content((0, -2.15), [#text(size: 9pt)[Primal open#linebreak()pairings $1:2$ and $3:4$]])
  content((6.1, -2.15), [#text(size: 9pt)[Primal closed, dual open#linebreak()pairings $1:4$ and $2:3$]])
})1
  $a equiv X_(*) - H + O \( gamma \) med \( mod med 2 H \) .$
  Shading marks the central interval, whose image
  $P_N \( \[ x_0 \, a_N \] \) subset \[ x_0 - 2 H \, x_0 + v \]$ is wall-free.],
    caption: [Figure 11: The two coordinate projections in the final reflection construction. Write $l = l_i$ and $H = H_i$. Panel (a) shows the triangular projection to the original marker cell; shifting a marker ordinate by an odd multiple of $H$ brings its projection to the anchor height. In panel (b), only the tail-wall portions crossed by one successful probe line are shown. At either tail wall $x_w$, the congruence $x_w - a equiv H + O \( gamma \) med \( mod med 2 H \)$ places $f \( b' + x_w - a \)$ inside a primary gap around $y_(* \, i)$. The central interval has no vertical-wall preimage. The pure run extends beyond the line’s passage through the finite horizontal support, so horizontal solids are avoided as well. Gap-center crossings and distances are schematic; the actual $O \( gamma \)$ offsets fit within the primary openings. Secondary gaps make the later fold cuts vacant and are not used for this diagonal clearance. ],
  ) <fig:reflection-template-projections>
  Apply the vertical schedule for label $i$ only in word leaves whose chosen majority label is $i$. All target copies lie on the retained side of each such vertical fold. Their count doubles there, while that child’s weight is multiplied by $1 \/ 2$; their expected count is therefore unchanged. Minority labels in the other children are not discarded from the inequality: their total expected count was already included in the unusable count of Lemma 125. Bad columns cost at most their fraction times the expected count of the target label, which is at most one. By choosing the run error and the column error each less than $epsilon \/ 4$, we obtain, for each original marker, an expected favorable inventory of at least $1 - epsilon \/ 2$, apart from coincidences of diagonal projections, addressed next.
  ==== 11.4.3 Vacant cuts, stability, and finite extraction <vacant-cuts-stability-and-finite-extraction>
  The word and column constructions have produced the required favorable inventory. It remains to realize their folds with vacant cuts, keep the local source routes intact, and extract the favorable copies. Only after these finite operations are fixed will we choose common buffers and round to the lattice.
  There are only finitely many cuts and copies in the tree just constructed. Perturb their axis-cut coordinates by sufficiently small fixed amounts. All successful primary-gap crossings and pure-run buffers persist. We may require that no cut contain an endpoint, marked feature, probe, or straight solid segment, and that distinct insertion copies in any one leaf have distinct diagonal-time projections $x - y$. To justify the last generic choice, each copy coordinate is affine in the original coordinates and in its ancestral cut coordinates. For two different reflection histories, use the last cut at which the copy histories differ: its coefficient in their coordinate difference is nonzero, and subsequent common reflections preserve nonzero dependence. Thus a coincidence of their diagonal projections is a proper affine equation in the cuts. If their histories are the same but their original markers differ, a possible coincidence reduces to one of the two excluded axis-diagonal equalities for the original probes. Avoiding finitely many proper affine equations is possible in every open perturbation neighborhood. The same reasoning avoids the finitely many incidences of cuts with tips and marked features. After this perturbation all the retained favorable copies have slabs avoiding the other insertion boxes as well.
  At each transverse intersection of a cut with a solid, insert a secondary gap at its preimage on the original wall. The generic choice has kept every such preimage away from original marks, corners, and primary-gap tips. There are only finitely many distinct preimages. Merge repeated locations, and take their gap widths small enough that their neighborhoods are pairwise disjoint and avoid the protected features. In the reflected copies these gaps make each prescribed axis cut vacant, with a positive margin. They only remove solids, so cannot spoil any favorable slab. Source strings crossing a cut do not constitute solids: their continuous flux joins are the finite identities in Proposition 121. No probabilistic estimate is being used to make a cut vacant.
  We also track the local routing condition at the probes. An axis fold restricts the diagram to one side and reflects it into the other; because its cut has positive distance from every probe box, each surviving box and its arriving prefix are copied intact. No foreign chain enters a copied box. Any transverse flux join needed at the cut is made within a vacant margin disjoint from all these boxes. At a diagonal extraction, choose both the band and its spare routing margins away from every other box, using their distinct diagonal projections. Proposition 121 then alters only the extracted box and these clear margins; all remaining boxes and their prefixes are copied intact into the two norm diagrams. Induction therefore preserves the chain-free neighborhood hypothesis for every later extraction. In particular, this construction never reroutes a diagonal chain across an unrelated source.
  We now apply Lemma 126 to the favorable inventory. The extraction bands contain no other marked data, as required by Proposition 121. Since the preliminary tree has finitely many leaves, a common finite depth makes their total expected residual favorable count less than $epsilon \/ 2$. Every extracted tagged marker is counted once, and all other splits preserve tagged counts in half-average. Combining this residual bound with the favorable inventory above proves the extracted-count assertion.
  Every tagged background feature, excluding all probe insertions, is intact on one side of every cut and outside every removed middle band. The two children therefore preserve its expected count. In either individual child, each retained copy is paired with its mirror, whose reflection parity is opposite. There was at least one whole-word end fold, and every subsequent fold or norm split has the same pairing property. Hence the terminal expected count of each such feature is one, divided equally between its two reflection parities. This also explains why the feature count cannot be replaced by an estimate on arbitrary untracked state norms.
  All inequalities expressing separation in this finite successful inventory are strict. Holding its chosen cuts and secondary-gap locations fixed, they remain valid in a neighborhood of the initial probe pair. A compact eligible set therefore admits a finite cover by such neighborhoods and their templates. Take the union of the finitely many secondary-gap locations, merging coincident locations, and use a common sufficiently small positive width. The additional vacancies only improve the clearances in each template. Shrink the covering neighborhoods to compact subneighborhoods that still cover the eligible set. For each original tip, protected mark, or endpoint, take the minimum of its strict clearances over every copy in these finite templates and over every probe pair in the corresponding compact neighborhood. These clearances include foreign solids and features, all probe boxes, and every cut, extraction, and rerouting margin. A smaller buffered support at the original feature, transported unchanged to all its copies, is therefore safe throughout the tree. In particular its radius does not depend on the actual probe pair. Finally, round cut lines and gap ends to vertex lines. Each error is $O \( n^(- 1) \)$, and only finitely many reflections are involved. Thus the total displacement is $O \( n^(- 1) \)$ with a template-dependent constant, smaller than every fixed clearance for all sufficiently large $n$. The same observation covers all bounded-mesh shifts of the original data and the local two-step stencils. This proves Lemma 124. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
