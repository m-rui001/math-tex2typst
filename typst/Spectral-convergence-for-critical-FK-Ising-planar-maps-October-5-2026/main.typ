#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Spectral convergence for critical FK--Ising planar maps]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Random planar maps provide discrete random surfaces on which geometry and statistical mechanics interact. The random-cluster formulation of Fortuin and Kasteleyn includes the Ising model at cluster weight two #cite(label("FortuinKasteleyn1972RandomCluster")). For maps decorated by the critical Fortuin–Kasteleyn (FK) model, Sheffield’s inventory accumulation bijection gives an exact word encoding #cite(label("Sheffield2016Inventory")). Its spanning-tree specialization is the correspondence of Mullin studied by Bernardi, and Sheffield identifies its fixed-map construction with Bernardi’s subgraph bijection #cite(label("Mullin1967TreeRooted")) #cite(label("Bernardi2007TreeRooted")) #cite(label("Bernardi2008Subgraphs")) #cite(label("Sheffield2016Inventory")). Sheffield also relates the infinite-volume inventory contours to correlated Brownian motion #cite(label("Sheffield2016Inventory")) Theorem 2.5. The cone-time, local, and finite-volume refinements of Gwynne, Mao, and Sun and of Gwynne and Sun identify further contour and loop data #cite(label("GwynneMaoSun2019ConeTimes")) #cite(label("GwynneSun2017Local")) #cite(label("GwynneSun2015Finite")). The mating-of-trees theory of Duplantier, Miller, and Sheffield, and its finite-sphere form due to Miller and Sheffield, identify the corresponding Brownian sewing with a Liouville quantum gravity (LQG) surface explored by space-filling Schramm–Loewner evolution #cite(label("DuplantierMillerSheffield2021Mating")) #cite(label("MillerSheffield2019SphereMating")). For the FK–Ising parameter $q = 2$, the resulting LQG parameter is $gamma = sqrt(3)$. The Brownian paths in this encoding record the two boundary-length contours; the vertex walk studied here is a separate stochastic process on the map.

The continuum surface carries several related structures. Its quantum area comes from Gaussian multiplicative chaos (GMC) in the LQG construction of Duplantier and Sheffield #cite(label("DuplantierSheffield2011KPZ")). The construction of its intrinsic metric proceeds through Liouville first-passage percolation: Ding, Dubédat, Dunlap, and Falconet proved the required tightness, and Gwynne and Miller proved existence, uniqueness up to a deterministic constant, and conformal covariance of the LQG metric #cite(label("DingDubedatDunlapFalconet2020Tightness")) #cite(label("GwynneMiller2021Metric")) #cite(label("GwynneMiller2021ConformalMetric")). For discrete conformal coordinates, Gwynne, Miller, and Sheffield proved a joint area and exploration limit for the Tutte embedding of disk mated-CRT maps, including a Brownian walk limit modulo time parameterization #cite(label("GwynneMillerSheffield2021Tutte")). Holden and Sun proved joint embedded metric and measure convergence for critical Boltzmann triangulations of polygons under the Cardy embedding #cite(label("HoldenSun2023Cardy")). These results illustrate the importance of keeping metric, measure, and conformal coordinates coupled.

Liouville Brownian motion provides the diffusion associated with conformal Brownian energy and quantum area. Constructions were given by Berestycki and by Garban, Rhodes, and Vargas #cite(label("Berestycki2015Diffusion")) #cite(label("GarbanRhodesVargas2016LBM")). The Dirichlet-form description and heat-kernel theory were developed further by Garban, Rhodes, and Vargas, by Andres and Kajino, and by Maillard, Rhodes, Vargas, and Zeitouni #cite(label("GarbanRhodesVargas2014Dirichlet")) #cite(label("AndresKajino2016Heat")) #cite(label("MaillardRhodesVargasZeitouni2016Heat")). In particular, the centered logarithmic Green operator gives a compact spectral description in the torus setting of the last work. Passing to the ordinary unit-area quantum sphere requires a local comparison of its field law with these Gaussian reference models.

For discrete walks, Berestycki and Gwynne proved convergence of walks on mated-CRT maps to Liouville Brownian motion in whole-plane and disk settings, with the limiting clock given a fixed annealed median exit normalization #cite(label("BerestyckiGwynne2022MatedCRTLBM")) Equation (1.6) and Theorems 1.2 and 1.4. Their deterministic discrete time normalization $m_epsilon$ is defined by an annealed median exit time and satisfies $m_epsilon asymp epsilon^(- 1)$; their Remark 1.3 leaves convergence of $epsilon m_epsilon$ unresolved. Electrical estimates for mated-CRT maps were established by Gwynne, Miller, and Sheffield #cite(label("GwynneMillerSheffield2019Harmonic")), while Gwynne and Miller obtained resistance, displacement, and spectral-dimension estimates for several infinite planar-map ensembles #cite(label("GwynneMiller2021RandomWalk")). To pass to a finite spectrum and heat trace, one must control the spatial diffusion, its time normalization, and the spectral mass contributing at positive times.

=== 1.1 The model and the theorem <the-model-and-the-theorem>

For $n gt.eq 1$, let $cal(F)_n$ be the finite set of pairs $\( M \, A \)$, where $M$ is a connected planar multigraph with $n$ edges embedded in the oriented sphere and rooted at an oriented edge, and $A subset.eq E \( M \)$. Equivalence is by orientation-preserving homeomorphisms preserving the root and $A$. Loops and multiple edges are allowed. Let $M^(*)$ be the dual map and $A^(*) = { e^(*) : e in.not A }$. Write $k \( A \)$ for the number of components of the spanning subgraph $\( V \( M \) \, A \)$, including isolated vertices, and set

$ ell \( M \, A \) = k \( A \) + k \( A^(*) \) - 1 = 2 k \( A \) + \| A \| - \| V \( M \) \| . $

The second identity is Euler’s formula applied to the embedded spanning subgraph. The critical FK–Ising law is

#[#set math.equation(numbering: n => "(1.1)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] \( M_n \, A_n \) = \( M \, A \) #scale(x: 120%, y: 120%)[\)] = 2^(ell \( M \, A \) \/ 2) / Z_n \, #h(2em) Z_n = sum_(\( M \, A \) in cal(F)_n) 2^(ell \( M \, A \) \/ 2) . $ <eq:fk-law>]

Let $V_n = V \( M_n \)$, let $d_n$ be graph distance using every original map edge with length one, and put

#[#set math.equation(numbering: n => "(1.2)")
 $ mu_n = frac(1, 2 n) sum_(v in V_n) deg \( v \) delta_v . $ <eq:corner-measure>]

A loop contributes two to the degree. Thus $mu_n$ is normalized corner counting pushed to vertices.

The walk waits an exponential time of mean one, chooses an incident half-edge $a$ uniformly, and moves to its opposite endpoint $"opp" \( a \)$. A chosen loop leaves the position unchanged. Its generator is

#[#set math.equation(numbering: n => "(1.3)")
 $ \( L_n f \) \( v \) = frac(1, deg \( v \)) sum_(a med upright(h a l f upright("-") e d g e)\
a med upright(i n c i d e n t med t o) med v) #scale(x: 120%, y: 120%)[\(] f \( "opp" \( a \) \) - f \( v \) #scale(x: 120%, y: 120%)[\)] . $ <eq:walk-generator>]

The operator $- L_n$ is nonnegative and self-adjoint on $L^2 \( mu_n \)$. List its eigenvalues with multiplicity as

$ 0 = lambda_(n \, 0) lt.eq lambda_(n \, 1) lt.eq dots.h.c lt.eq lambda_(n \, \| V_n \| - 1) \, $

and put $lambda_(n \, j) = + oo$ for $j gt.eq \| V_n \|$. For $t > 0$, define

#[#set math.equation(numbering: n => "(1.4)")
 $ H_n \( t \) = "Tr" e^(n t L_n) = sum_(j = 0)^(\| V_n \| - 1) e^(- n t lambda_(n \, j)) . $ <eq:discrete-heat-trace>]

This is the operator trace, with each mode counted once.

For the continuum object, let $\( bb(S)^2 \, h \)$ be the ordinary unit-area $gamma$-Liouville quantum gravity sphere at $gamma = sqrt(3)$: the ordinary quantum-sphere measure of Duplantier, Miller, and Sheffield, disintegrated at quantum area one, with its original marks forgotten #cite(label("DuplantierMillerSheffield2021Mating")) Definition 4.21(ii). Write $mu_h$ for its quantum area probability measure and $D_h$ for its intrinsic LQG metric in one fixed deterministic normalization. We use the conformal coordinate of the round sphere. On smooth functions define

#[#set math.equation(numbering: n => "(1.5)")
 $ cal(E)_h \( f \, g \) = 1 / 2 integral_(bb(S)^2) chevron.l nabla f \, nabla g chevron.r_(upright("round")) thin upright(d) upright("vol")_(upright("round")) . $ <eq:continuum-energy>]

The proof will establish that its closure on $L^2 \( mu_h \)$, using the usual quasi-continuous Sobolev representatives, is the Liouville Brownian motion form and has compact resolvent. Let $A_h$ be its nonnegative operator and

$ 0 = Lambda_0 \( h \) lt.eq Lambda_1 \( h \) lt.eq Lambda_2 \( h \) lt.eq dots.h.c $

its eigenvalues with multiplicity. Set

#[#set math.equation(numbering: n => "(1.6)")
 $ H_h \( t \) = "Tr" e^(- t A_h) = sum_(j gt.eq 0) e^(- t Lambda_j \( h \)) \, #h(2em) t > 0 . $ <eq:continuum-heat-trace>]

The factor $1 \/ 2$ in (1.5) fixes the Brownian clock. The two-dimensional Dirichlet integral is conformally invariant. Pushing $mu_h$ forward under a change of conformal coordinate therefore gives a unitarily equivalent operator.

Here is the deterministic normalization of space. For a finite real random variable $Y$, let $frak(m) \( Y \)$ be the unique $r$ for which $bb(E) \[ arctan \( Y - r \) \] = 0$. Put

$ Delta_n = max { 1 \, "diam" \( V_n \, d_n \) } \, #h(2em) Delta = "diam" \( bb(S)^2 \, D_h \) \, $

and define

#[#set math.equation(numbering: n => "(1.7)")
 $ a_n = exp { frak(m) \( log Delta \) - frak(m) \( log Delta_n \) } . $ <eq:distance-normalization>]

Both centers use unconditional laws. In particular $a_n$ is deterministic. Lemma 4 verifies that it agrees asymptotically with the spatial normalization of the companion geometric limit.

#prodef([Theorem 1.1.])[
  (Joint Liouville spectral limit).  #emph[The form (1.5) is closable on $L^2 \( mu_h \)$. Its closure has compact resolvent, has the constants as its one-dimensional kernel, and satisfies $H_h \( t \) < oo$ for every $t > 0$. As $n arrow.r oo$ through all positive integers, 
#[#set math.equation(numbering: n => "(1.8)")
 $ (\( V_n \, a_n d_n \, mu_n \) \, med \( n lambda_(n \, j) \)_(j gt.eq 0) \, med H_n) med arrow.r.double med (\( bb(S)^2 \, D_h \, mu_h \) \, med \( Lambda_j \( h \) \)_(j gt.eq 0) \, med H_h) . $ <eq:main-limit>]

 The first coordinate has the Gromov–Hausdorff–Prokhorov topology on isometry classes of compact metric probability spaces. The second has the product topology on $\[ 0 \, oo \]^(bb(N)_0)$. The third has $C_(upright("loc")) \( \( 0 \, oo \) \)$, the topology of uniform convergence on each $\[ delta \, T \]$ with $0 < delta < T < oo$. All three limiting coordinates are constructed from the same quantum sphere $h$.]
] <thm:main>

The clock is exactly $n$ for the conventions above. The reason is the normalization of the electrical energy, together with a conductivity identity proved below. Formula (1.7), by contrast, fixes only the spatial convention; the proof requires no power-law formula for $a_n$.

The proof uses the canonical conformal companion #cite(label("C")) and the metric-measure companion #cite(label("P")), the latter in its revision of October 3, 2026. Their encoding, protected local laws, quantitative address and finite-view estimates, and geometric limits are the probabilistic inputs. The electrical and spectral conclusions of Theorem 1 are obtained from the new arguments developed here. In the companion titles, #emph[subcritical] refers to the LQG range $gamma < 2$; the FK model itself is at its self-dual critical point.

=== 1.2 Proof strategy <proof-strategy>

There are two distinct questions. The first is to identify the macroscopic electrical behavior of the map. The second is to control functions whose variation is concentrated in a region carrying very little corner mass. The first question determines the candidate limiting operator; the second is needed to pass from that identification to the spectrum and heat trace.

We begin with the sum of squared voltage differences over the map edges. Protected incidence records in the companions retain a finite graph together with its ports and confinement. We show that their local conditional-law arguments also retain numerical electrical quantities of this graph, such as effective resistance. An adaptation of the aligned-annulus argument of #cite(label("C")) Section 8 then rules out collapse of raw edge extremal length. The key extra step compares the primal and dual networks in their common flag surface. A hypothetical collapse would produce cheap local crossings in almost every position and direction for both networks. Transverse primal and dual crossings must use a paired edge, contradicting the Cauchy–Schwarz inequality for their expected edge traffics. Theorem 11 turns this into cutoffs of bounded energy and surrounding circuit flows of bounded squared traffic for fixed geometric tests.

These fixed-test estimates identify the macroscopic energy. We relax the discrete energies under locally uniform convergence, using protected finite-dimensional energy infima to compare inner and outer tests. Cutoff gluing makes the relaxation a local quadratic integral. Circuit estimates bound it above and below by the ordinary Sobolev energy. Its matrix density is a local germ, so the conditional independence and field-germ arguments of #cite(label("C")) make it a deterministic scalar. The primal and dual scalars agree by the exact FK duality. In a square, their complementary mixed-boundary conductances have product one; hence the scalar is one. This uses the classical self-duality fixed-point idea of Dykhne #cite(label("Dykhne1971")), after the existence, determinism, and equality of the two scalar limits have been proved. The result is Theorem 16. A local minimization argument then identifies the unit-current voltage between distinct macroscopic points with the round Green voltage, yielding Theorem 23.

The remaining problem is quantitative compactness at smaller scales. The address estimates of #cite(label("P")) control the ranks of graphs formed by exploration return relations. We derive a version with one marked base over a wider range of scales, and combine it with protected circuit flows and a packing estimate for their reachable supports. These circuits bound oscillation on connected unions of their boundaries. A bound on how long the tour can remain inside one circuit disk lets us compare values associated with parent and child blocks; telescoping these comparisons to singleton blocks yields an approximation of all vertex values.

List the $2 n$ corner occurrences in inventory exploration order and represent a vertex function $f$ by its values on the corresponding $2 n$ equal intervals of $\[ 0 \, 1 \]$. This identifies $L^2 \( mu_n \)$ isometrically with a subspace of $L^2 \( \[ 0 \, 1 \] \)$. Write $cal(E)_n^0 \( f \)$ for the sum of squared differences over all original edges, counted with their multiplicities. After finitely many charts are combined, Lemma 39 constructs linear maps $Q_(n \, j)$ on these representatives, of rank at most $C 2^j$, satisfying

#[#set math.equation(numbering: n => "(1.9)")
 $ lr(bar.v.double f - Q_(n \, j) f bar.v.double)_(L^2 \( \[ 0 \, 1 \] \))^2 lt.eq C 2^(- p j) cal(E)_n^0 \( f \) \, #h(2em) p = 7 / 10 . $ <eq:overview-approximation>]

On the joint representation extractions used below, almost surely there are finite sample-dependent constants $C \, J \, n_0$ for which both bounds hold simultaneously for every index $n gt.eq n_0$ in the extraction, every $j gt.eq J$, and every vertex function. Theorem 26 proves the stronger local statement from which (1.9) follows. The estimate supplies both strong compactness of bounded-energy functions and a polynomial lower bound on high eigenvalues.

Section 9 combines the four-point voltage limit with this approximation. The former identifies double differences of the centered inverse kernels away from coincident points. Strong compactness prevents an additional low mode from disappearing into a set of vanishing mass, while $p > 1 \/ 2$ makes the inverse spectral tails square summable. An operator argument then upgrades the four-point identification to Hilbert–Schmidt convergence of the centered inverses. Ordered eigenvalues and the heat traces follow. This last passage is an abstract compactness principle, related to the general theory of compact spectral convergence of Kuwae and Shioya #cite(label("KuwaeShioya2003")): it uses finite-rank energy approximations and four-point kernel limits, and does not depend on the specific FK encoding. The common canonical coordinate from #cite(label("C")) keeps this spectral limit coupled to the metric-measure limit of the same sphere.

== 2 The discrete energy and the common geometric limit <sec:model>

This section records the exact relation between the walk and the electrical network, and fixes the geometric representation used throughout the proof. The representation retains every corner and every primal and dual incidence. Consequently, a local electrical construction can later be compared with the same limiting area measure and metric that occur in Theorem 1.

=== 2.1 The raw electrical energy <the-raw-electrical-energy>

For a finite map $M$, choose an orientation of each unoriented edge only for writing differences, and put

$ d_e f = f \( e^(+) \) - f \( e^(-) \) \, #h(2em) cal(E)_M^0 \( f \, g \) = sum_(e in E \( M \)) d_e f thin d_e g . $

The value is independent of the chosen orientations. Each parallel edge is a separate summand, and a loop has zero difference. We write $cal(E)_n^0 = cal(E)_(M_n)^0$. For a set $F$ of edges, $cal(E)_n^0 \( f \; F \) = sum_(e in F) \( d_e f \)^2$.

#prodef([Lemma 2.1.])[
  (Energy normalization).  #emph[Let $Q_n$ be the unit-conductance graph Laplacian of $M_n$, with loop terms equal to zero, and set $B_n = - 2 n L_n$. On $L^2 \( mu_n \)$, 
$ B_n = "diag" \( mu_n \)^(- 1) Q_n \, #h(2em) chevron.l f \, B_n g chevron.r_(L^2 \( mu_n \)) = cal(E)_n^0 \( f \, g \) . $

 The kernel of $B_n$ consists exactly of the constant functions. In particular, its ordered eigenvalues are $nu_(n \, j) = 2 n lambda_(n \, j)$.]
] <lem:normalization>

#proof[
  For a nonloop edge with endpoints $u \, v$, the two incident half-edge contributions to $- chevron.l f \, L_n g chevron.r_(L^2 \( mu_n \))$ are
  $ frac(1, 2 n) #scale(x: 120%, y: 120%)[\(] f \( u \) \( g \( u \) - g \( v \) \) + f \( v \) \( g \( v \) - g \( u \) \) #scale(x: 120%, y: 120%)[\)] = frac(d_e f thin d_e g, 2 n) . $
  The two half-edges of a loop contribute zero. Summing proves both operator identities. A function of zero energy agrees across every nonloop edge, and the map is connected, so it is constant. ◻
]

The superscript $0$ will always indicate this unhalved electrical energy. The continuum energy $cal(E)_h^0 = 2 cal(E)_h$ has operator $B_h = 2 A_h$. Thus conductivity one for the raw energies gives the clock in Theorem 1: $B_n \/ 2 = - n L_n$ converges to $A_h$.

=== 2.2 Flags, corner occurrences, and the exploration <flags-corner-occurrences-and-the-exploration>

We use the inventory encoding of the exact FK law in #cite(label("C")) Proposition 3.1 and Lemma 3.2. At $q = 2$, its flexible-order parameter is

$ b_(upright(F)) = frac(sqrt(2), 2 + sqrt(2)) = sqrt(2) - 1 . $

The length-$2 n$ word conditioned to reduce to the empty word produces precisely the probability law of Section 1. Its resolved contours have the parameter $gamma = sqrt(3)$, and the limiting duration-one surface is the ordinary unit-area quantum sphere #cite(label("C")) Theorem 3.4. The convention $m = 2 n$ therefore gives $m$ letters per unit of quantum-area time.

The finite exploration assigns a primal corner vertex $v_n \( i \)$ to each cut $i in { 0 \, dots.h \, m - 1 }$. These are the $m$ corner occurrences, including repetitions of a vertex. Consecutive cut vertices agree or are joined by a primal edge. We set $v_n \( m \) = v_n \( 0 \)$ only to close the tour. The repeated closing cut receives no mass. A vertex $v$ occurs $deg \( v \)$ times, so

#[#set math.equation(numbering: n => "(2.1)")
 $ 1 / m sum_(i = 0)^(m - 1) delta_(v_n \( i \)) = mu_n . $ <eq:corner-pushforward>]

In particular, a vertex function is isometrically represented in $L^2 \( \[ 0 \, 1 \] \, thin upright(d) t \)$ by the function equal to $f \( v_n \( i \) \)$ on $\[ i \/ m \, \( i + 1 \) \/ m \)$. This representation will be used in the spectral argument.

It is also useful to retain an actual surface on which both networks are drawn. For every occurrence of a vertex $v$, an edge $e$, and an incident face $F$, form an equilateral triangle with vertices labelled $\( v \, e \, F \)$. Glue sides according to the cyclic incidences of the embedded map. There are $4 n$ triangles. Repeated incidences are distinct triangles, even for a loop or bridge. The resulting incidence subdivision $X_n$ is a topological sphere with its piecewise Euclidean conformal structure. Write $m_n$ for normalized triangle area; each flag has mass $1 \/ \( 4 n \)$.

If the interior of each flag is sent to its primal vertex, then

#[#set math.equation(numbering: n => "(2.2)")
 $ \( pi_n \)_(*) m_n = mu_n . $ <eq:flag-pushforward>]

Indeed, $v$ belongs to $2 deg \( v \)$ flag occurrences. This is also the law of the tail of a uniformly chosen oriented root edge, conditional on the unrooted decorated map. The counting argument is valid in the presence of automorphisms by counting rooted occurrences before taking the quotient #cite(label("C")) Lemma 2.2.

Choose three independent $m_n$-distributed points. The unique orientation-preserving uniformization $phi.alt_n : X_n arrow.r bb(S)^2$ sending them to $0 \, 1 \, oo$ is the canonical coordinate of #cite(label("C")) Section 2. We identify $bb(S)^2$ with the Riemann sphere and write

$ z_n \( v \) = phi.alt_n \( v \) \, #h(2em) v in V_n . $

The points used to normalize $phi.alt_n$ are separate from exploration roots and from any auxiliary chart marks.

#prodef([Lemma 2.2.])[
  (Duality in the flag surface).  #emph[The map $\( M \, A \) mapsto \( M^(*) \, A^(*) \)$, with a consistent directed dual-root convention, is a bijection of the $n$-edge rooted decorated maps and preserves their FK-Ising probabilities. The primal and dual flag surfaces are canonically isometric as unoriented piecewise Euclidean surfaces. In this identification a primal edge and its paired dual edge meet at their common edge midpoint, with alternating incident rays; a primal edge meets no other dual edge. The same three physical flag-area samples may be used in the two canonical uniformizations. Their comparison is conformal or anticonformal according to the orientation convention.]
] <lem:dual-geometry>

#proof[
  Taking complements across dual edges exchanges $A$ and $A^(*)$, and
  $ ell \( M \, A \) = k \( A \) + k \( A^(*) \) - 1 = ell \( M^(*) \, A^(*) \) . $
  The dual operation is invertible, including its root convention, and keeps the number of edges. It therefore preserves the normalized finite law. The flag correspondence is $\( v \, e \, F \) arrow.l.r \( F \, e^(*) \, v \)$. It preserves the equilateral triangles and their incidence gluings, including every repeated occurrence. Drawing a primal edge along its vertex-to-midpoint sides and a dual edge along its face-to-midpoint sides proves the crossing assertion in each flag neighborhood. Conditional on the common metric surface, the same three points are independent uniform area samples in both marginal experiments. Genus-zero three-point normalization then gives the last assertion, allowing complex conjugation if the surface orientation is reversed. ◻
]

=== 2.3 One coordinate for area, distance, and local tests <one-coordinate-for-area-distance-and-local-tests>

We first record a normalization fact. For a finite real random variable $Y$, recall that $frak(m) \( Y \)$ is the zero of $r mapsto bb(E) \[ arctan \( Y - r \) \]$.

#prodef([Lemma 2.3.])[
  (Continuity of the diameter normalization).  #emph[The center $frak(m)$ is well defined, satisfies $frak(m) \( Y + c \) = frak(m) \( Y \) + c$, and is continuous under convergence in distribution of finite real random variables. If $b_n > 0$, $b_n arrow.r 0$, and $b_n Delta_n$ converges in distribution to the finite strictly positive random variable $Delta$, then the normalization in (1.7) satisfies $a_n \/ b_n arrow.r 1$.]
] <lem:space-normalization>

#proof[
  Bounded convergence shows that $F_Y \( r \) = bb(E) \[ arctan \( Y - r \) \]$ is continuous with limits $pi \/ 2$ and $- pi \/ 2$ at the two ends of the real line. It is strictly decreasing because the integrand is strictly decreasing. The zero exists and is unique, and the shift identity follows directly. If $Y_j$ converges in distribution to $Y$, then $F_(Y_j) \( r \) arrow.r F_Y \( r \)$ for every fixed $r$. For each $epsilon > 0$, the two values at $frak(m) \( Y \) plus.minus epsilon$ have opposite strict signs; eventually the same is true for $F_(Y_j)$. Its zero is between them, proving continuity.
  Apply this fact to $Y_n = log \( b_n Delta_n \)$. The continuous mapping theorem applies because $Delta > 0$. Shift equivariance gives
  $ log b_n / a_n = frak(m) #scale(x: 120%, y: 120%)[\(] log \( b_n Delta_n \) #scale(x: 120%, y: 120%)[\)] - frak(m) \( log Delta \) arrow.r 0 . $
  ◻
]

The following proposition collects the geometric results of the two companions at the scope used here. The canonical companion supplies the uniformization and full flag geometry. The metric-measure companion is used in its revision of October 3, 2026. Local conditional laws will be stated separately in the next section.

For each rerooted contour, $S_(upright("ref"))$ denotes the sphere reconstructed from its limit, written in a chosen conformal coordinate with spherical metric $rho_(upright("ref"))$, and $eta^(upright("ref")) : \[ 0 \, 1 \] arrow.r S_(upright("ref"))$ is its area-parametrized tour. Write $P_n : X_n arrow.r S_(upright("ref"))$ for the continuous contour projection and $Psi_n : X_n arrow.r S_(upright("ref"))$ for the geometric homeomorphism below. For a bilateral contour use the one-point compactification of its reference plane and $eta^(upright("ref")) : bb(R) arrow.r S_(upright("ref")) \\ { oo }$; the local homeomorphism maps the finite sewn flag sphere to that compactification.

#prodef([Proposition 2.4.])[
  (Common geometric extraction).  #emph[From every sequence $n arrow.r oo$, one may pass to a further subsequence and a representation coupling with the following almost-sure properties. The limiting coordinate sphere carries an ordinary unit-area $sqrt(3)$-LQG sphere with area $mu_h$ and metric $D_h$.]
  + #emph[The pushed corner measures converge weakly, 
$ \( z_n \)_(*) mu_n arrow.r mu_h \, $

 and, in the product of the round topology with the ordinary topology of $\[ 0 \, oo \)$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ { \( z_n \( u \) \, z_n \( v \) \, a_n d_n \( u \, v \) \) : u \, v in V_n #scale(x: 120%, y: 120%)[}] arrow.r { \( z \, w \, D_h \( z \, w \) \) : z \, w in bb(S)^2 #scale(x: 120%, y: 120%)[}] $ <eq:common-distance-graph>]

 in Hausdorff distance. Also $delta_n := max_T "diam"_(upright("round")) phi.alt_n \( T \) arrow.r 0$, where $T$ ranges over flags. Every complete primal or dual incidence star consequently has diameter at most $2 delta_n$.]
  + #emph[Finitely many conditionally uniform rerootings may be retained using the same map and the same $phi.alt_n$. For each rerooting $r$, there is a continuous tour $eta_r : \[ 0 \, 1 \] arrow.r bb(S)^2$ with $\( eta_r \)_(*) \( thin upright(d) t \) = mu_h$ and 
#[#set math.equation(numbering: n => "(2.4)")
 $ sup_(0 lt.eq t lt.eq 1) d_(upright("round")) #h(-0.16667em) (z_n #scale(x: 120%, y: 120%)[\(] v_n^(\( r \)) \( floor.l 2 n t floor.r \) #scale(x: 120%, y: 120%)[\)] \, eta_r \( t \)) arrow.r 0 . $ <eq:uniform-tour-tracking>]

 For $mu_h$-almost every $z$, the fiber $eta_r^(- 1) \( { z } \)$ consists of one time among all of $\[ 0 \, 1 \]$. For two conditionally independent uniform rerootings, their limiting root positions, jointly with $mu_h$, have the law of two independent samples from $mu_h$ conditional on $mu_h$. They are distinct almost surely.]
  + #emph[For each finite contour reference sphere, the projection $P_n$ places every point of each flag at a vanishing maximum $rho_(upright("ref"))$-distance from $eta^(upright("ref")) \( t \)$, over all tour representatives $t$ of its quadrangle corners and all occurrences of its incident primal or dual vertices. The homeomorphisms satisfy 
$ sup_(x in X_n) rho_(upright("ref")) #scale(x: 120%, y: 120%)[\(] Psi_n \( x \) \, P_n \( x \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $

 On further subsequences, $phi.alt_n compose Psi_n^(- 1) : S_(upright("ref")) arrow.r bb(S)^2$ converges uniformly in the target round metric on $bb(S)^2$ to the conformal or anticonformal three-point comparison map. The sign is retained in the coupling.]
    #emph[For each member $K subset.double U$ of a fixed finite family, protection chooses a finite union $I$ of tour intervals with 
$ \( eta^(upright("ref")) \)^(- 1) \( K \) subset I subset.double \( eta^(upright("ref")) \)^(- 1) \( U \) . $

 Eventually $I$ contains every tour representative of each flag whose contour projection meets $K$ and of the full incidence stars of its three vertices. Intervals are interpreted on the time circle for a sphere and are bounded in the bilateral case. In a protected bilateral window the finite sewing leaves these stars unchanged, including cyclic order and original primal incidences. The homeomorphism of this protected bilateral sewing has projection error tending to zero over the tests, and its full inverse image of $K$ lies in the unchanged part. The eventual index may depend on the tests and the sample.]
  + #emph[For either rerooting with root $p_(*)$, adjoin two independent auxiliary pairs of $mu_h$-samples conditional on the surface, independently of retained exploration and chart observations given that surface and its contour. Use the separate three-marked representations $\( Q_1 \, Q_2 \, p_(*) \) = \( 0 \, 1 \, oo \)$ and $\( Q_3 \, Q_4 \, p_(*) \) = \( 0 \, 1 \, oo \)$. In either representation the chart interiors are relatively compact disks $U subset.double bb(C) \\ { 0 \, 1 }$, with the required strict buffers, on which the law of the actual-height sphere real-field restriction to $U$ is absolutely continuous with respect to the local reference field law fixed for that comparison in Section 3. The two chart families cover $bb(S)^2 \\ { p_(*) }$; the families for two distinct roots have a finite subcover of $bb(S)^2$. Each comparison is used only in its own three-marked marginal, without conditioning on the other auxiliary pair.]
  #emph[The geometric conclusions persist on any further jointly tight extraction that retains additional random observations of the maps and contours.]
] <prop:geometry>

#proof[
  The canonical limit #cite(label("C")) Theorem 1.1 gives weak convergence of $\( phi.alt_n \)_(*) m_n$, Hausdorff convergence of the full distance graph with a deterministic scale $b_n arrow.r 0$, and vanishing maximum flag diameter in the same coordinate. The third coordinate of the graph uses the uncompactified distance, so its maximum converges to $Delta = "diam" \( bb(S)^2 \, D_h \)$. This diameter is finite and strictly positive. Replacing the graph diameter by $Delta_n = max { 1 \, "diam" \( V_n \, d_n \) }$ does not affect this limit because $b_n arrow.r 0$. Lemma 4 gives $a_n \/ b_n arrow.r 1$, hence the graph convergence in (2.3) and $a_n arrow.r 0$. Couple each flag-area point to its primal vertex. Their images are within $delta_n$; therefore (2.2) gives the weak corner-measure convergence. All flags in one incidence star contain the star’s center, which proves the $2 delta_n$ bound.
  The duration-one area tour and its continuity come from #cite(label("C")) Theorem 3.4. The homeomorphisms of #cite(label("C")) Theorem 4.8 track every flag and its tour representatives uniformly. The uniformization comparison #cite(label("C")) Theorem 8.8 has only the conformal and anticonformal three-point limits. Passing further and retaining the sign gives the uniform tracking in the canonical coordinate; uniform continuity of the limiting tour extends the cut-time statement to (2.4). These arguments apply jointly to a finite number of rooted marginals by tightness and a further extraction. Their pushed area measures are the same limit of the physical flag measures, so each tour has pushforward $mu_h$.
  Lemma 3.7 of #cite(label("C")) says that an independent quantum-area point has exactly one visit by the tour. Integrating this probability-one statement conditionally on the surface and tour gives the asserted singleton fibers for $mu_h$-almost every $z$; a finite intersection handles all retained rerootings. Conditional uniform rerooting has tail law $mu_n$ by (2.2). Weak convergence of these measures, tested against products of bounded continuous functions, identifies the joint law by first taking $mu_h$ and then independently sampling the two roots from it. Quantum area is nonatomic, so two such roots are distinct.
  The continuous projections and complete time-preimage protection are #cite(label("C")) Proposition 4.2 and Lemma 4.3. The reference homeomorphisms and their validity with extra observations are exactly #cite(label("C")) Theorem 4.8; the canonical comparison is #cite(label("C")) Theorem 8.8. The protected bilateral sewing and its inverse-image capture are #cite(label("C")) Proposition 4.9. These statements concern fixed tests with room and supply no rate for a test whose boundary changes with $n$.
  Finally, the sphere field comparison in #cite(label("P")) Lemma 18.1 uses the exploration root and an auxiliary pair of area marks. Use two separate pair marginals. Their four marks are distinct almost surely, and the complements of the two pairs cover the sphere off the root. Strict chart interiors exhaust each complement. Repeating this for two distinct roots covers the entire sphere. Compactness yields a finite subcover. This argument intersects probability-one conclusions from the separate marginals; it does not strengthen either conditional field comparison. ◻
]

All subsequent subsequential arguments take place in such couplings, enlarged by the compact local data they require. A property proved almost surely on every further extraction will be returned to convergence in distribution at the end. The choice of conformal or anticonformal sign has no effect on the round Dirichlet integral.

== 3 Local observations of the electrical network <sec:locality>

The geometric convergence of Proposition 5 does not determine the conductance of a set of edges. We shall obtain local electrical information by retaining numerical functions of finite pieces of the map in the conditional-law construction of the companions. This section specifies the functions that can be retained and the changes of surface law that preserve their almost sure properties.

We use the protected charts of the canonical companion #cite(label("C")) Section 5 and, separately, those of the metric-measure companion #cite(label("P")) Sections 5 and 7. A chart instruction consists of finitely many used time intervals, each strictly inside an extended raw-word block; rational relative time cells for ports, confinement, suppliers, and the stars to be retained; exact differences of the two contour heights at used starts, recorded on a forest on the block indices in each coordinate; and finite instructions for gluing the retained pieces. These last instructions give rational height bands for cross-block contacts, exact lattice minima on retained subintervals, and types for externally unresolved flexible orders in the used portions. Overlapping extended blocks are merged before the instruction is formed; the intervening unused time intervals are its gaps. Durations and height differences are parameters, whereas the combinatorial instruction belongs to a countable list.

Write $cal(R)_m^alpha$ for the resulting finite incidence record at $m$ letters per time unit, for instruction $alpha$. In the canonical construction this record includes the oriented flag gluings and every incidence occurrence and cyclic order at each protected primal and dual vertex. It therefore determines both edge networks there, including loops and repeated edges. The protected-atlas statement of the metric-measure companion gives the primal incidences used by its tests. We use the canonical record whenever complete dual incidences are needed.

The continuous input $I^alpha$ consists of the directed local traversals, their quantum durations and labelled frontier lengths, the cut marks, and their finite relative traversal order. Here the traversal and frontier data include, in word coordinates, the rescaled increment paths on the full extended blocks, their durations and used-start offsets, and the scaled forest differences. A common clock origin and a common height origin are removed. Let $cal(C)$ denote the complete continuum variable: the limiting contours, their curve-decorated surface, the fields and cut marks when used, and the chosen coordinate data. In the canonical protocol, any extra embedding or imaginary-field lift is sampled from its conditional law given the curve-decorated continuum surface, independently of the discrete outputs conditional on that surface; see #cite(label("C")) Theorem 5.9. In the metric-measure protocol, additional coordinates not reconstructed from the complete contour-and-cut data are sampled from the canonical conditional law given those data, independently of the entire actual and auxiliary-reference observation array conditional on those data; see #cite(label("P")) Theorem 7.10. The chosen coordinate data in $cal(C)$ consist only of data reconstructed from the appropriate prescribed continuum variable or attached by its stated output-independent protocol. The canonical uniformization comparison and its orientation sign may be retained in the joint coupling. If their conditional law depends on the observation array beyond the prescribed continuum input, they are kept outside the kernel-conditioning sigma-field $sigma \( cal(C) \)$. The marginal almost sure statements are transferred before that comparison and sign are used pathwise.

For each matching comparison on a protected real-field buffer $U$, fix a Gaussian reference with its additive height retained: either $G_R \|_U$, where a neighborhood of $overline(U)$ lies in $B_R$ and $G_R$ is a whole-plane Gaussian free field (GFF) with zero circle average on $partial B_R$, or the restriction of a zero-boundary GFF from a fixed containing disk. These covariance kernels have logarithmic singularity $log \| z - w \|^(- 1)$. These choices, fixed smooth shifts on a neighborhood of $overline(U)$, and cone restrictions on buffers strictly inside their normalization circles and away from their marked centers are locally mutually absolutely continuous on strict buffers; they are not identical laws #cite(label("C")) Proposition 5.12 #cite(label("P")) Lemmas 3.3 and 9.2. We call a chart carrying one such fixed reference an #emph[ordinary field chart]. Before the area clock, it is accompanied by an independent whole-plane imaginary field modulo $2 pi chi bb(Z)$, $chi = 2 \/ gamma - gamma \/ 2$, with uniform phase in $\[ 0 \, 2 pi chi \)$, and its unparameterized directed curve, as in Section 3 of #cite(label("C")), and by the conditional local Poisson area-mark law $Pi_h$ of intensity $mu_h \( thin upright(d) z \) thin thin upright(d) u$ on $U times \( 0 \, oo \)$, as in Section 7 of #cite(label("P")). These Poisson marks are separate from the auxiliary sphere area marks and the three canonical flag samples.

A numerical observation at $alpha$ has the form

#[#set math.equation(numbering: n => "(3.1)")
 $ Y_m^alpha = F_m^alpha \( cal(R)_m^alpha \, theta_m^alpha \) in E_alpha \, $ <eq:finite-readout>]

where $theta_m^alpha$ comprises the exact parameters of the instruction, $E_alpha$ is a compact metric space, and $F_m^alpha$ is measurable. The same function is used in the actual word and in its reference experiment. Its deterministic dependence on $m$ may include any prescribed positive unit. A nonnegative extended-real quantity is compactified by $x mapsto x \/ \( 1 + x \)$, with $oo mapsto 1$. The observation uses only the record and the intrinsic instruction. In particular, it uses no absolute clock origin, omitted-gap duration, or edge whose incidences have not been retained. It may be given any fixed value when the finite instruction is not realized.

Spatial meaning is assigned with margins. For $K subset.double U$ in a reference coordinate, choose

#[#set math.equation(numbering: n => "(3.2)")
 $ K subset "int" K_(*) subset.double U_0 subset.double U_1 subset.double U . $ <eq:local-protections>]

The used interiors cover the full preimage of $K_(*)$, their images have closures in $U_0$, and the extended blocks have closures in $U_1$. All stars used by the observation are included. Work on the common probability-one Brownian generic event of the reconstruction results. We say the instruction is #emph[activated] when the containments, local band-separation tests, and local flexible-order instructions hold for its limiting input. Activation is an event of the limiting local traversals, frontier lengths, marks, and finite order. The global generic event and the enclosing supplier windows are used to prove eventual correctness, not to select the instruction. Protected reconstruction then makes every tested incidence exact for all sufficiently large discrete indices. Finite inner and outer cell covers between the sets in (3.2) describe ports and confinement. Their strict margins are fixed before the discrete limit.

#prodef([Proposition 3.1.])[
  (Extension to numerical incidence observations).  #emph[Fix either companion’s chart protocol, a countable collection of its intrinsic instructions, and observations (3.1). Assume the following for every instruction that is used.]
  + #emph[Activation is selected from the limiting local data above and supplies positive limiting durations, extensions and gaps, and the complete preimages and stars needed by the observation, with strict inner and outer margins.]
  + #emph[Descriptions of the same observation are restrictions of one common finite union incidence record on activation. Charts in disjoint protected buffers are sampled as independent complete reference packages before a resampling weight is applied.]
  + #emph[Actual and reference observations use the same exact parameters and deterministic units. In an indexed extraction, each fixed retained effective time unit tends to infinity in lattice units. Varying labels are re-expressed with a fixed normalized ordinary reference input law and positive duration and shift densities in that unit convention, as in the companion’s indexed construction.]
  #emph[From every sequence of scales tending to infinity one can pass to a further joint representation extraction, retaining these observations and $cal(C)$, with the following properties.]
  #emph[For each instruction there is a conditional kernel $K^alpha \( I^alpha \, thin upright(d) y \)$. Writing $A^alpha$ for its activation event, in the bilateral word and in every strict interior chart of the finite empty-word bridge one has, for bounded measurable $f$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ upright(bold(1))_(A^alpha) bb(E) \[ f \( Y^alpha \) divides cal(C) \] = upright(bold(1))_(A^alpha) integral f \( y \) K^alpha \( I^alpha \, thin upright(d) y \) . $ <eq:activated-kernel>]

 On joint activation, disjoint protected buffers have product conditional kernels, including countable arrays in each buffer. Descriptions of the same observation agree through their union record. No claim is made about a default value on nonactivation. The canonical protocol’s augmentation over all feasible finite traversal orders also applies to the enlarged arrays, retaining the actual-order component and conditional products in disjoint raw-buffer packages. These conclusions persist under a fixed locally absolutely continuous change of the continuum field law and under the indexed changes of units described in the proof.]
  #emph[On activation, the kernel of a spatial observation is measurable from the real field in $U$, the imaginary field in a fixed larger buffer, the local area marks, and the finite relative order of the traversals used by the observation. This assertion selects from the jointly extracted limiting array; it does not condition a finite word on success of the numerical observation. The normalized reference law and its matching kernels are fixed within each indexed extraction. The two companion protocols furnish these properties separately, without an identification of their kernels.]
] <prop:readout-extension>

#proof[
  We first explain why the reference-word calculation permits the added coordinate. This extends the proof of #cite(label("C")) Lemma 5.8 and Theorem 5.9; the fixed-chart theorem #cite(label("P")) Theorem 7.10 already permits arbitrary measurable observations of raw words and exact parameters.
  Work on one compact stable continuity cell for the chart inputs, with frozen atoms having positive actual mass in that cell. Let $hat(e)_m$ be the frozen microscopic exterior in the companion’s resampling calculation, with macroscopic record $e_m$, and let $sans(R)_m^(hat(e)_m)$ be its independent reference law. The actual marked conditional law on the cell is exactly
  #[#set math.equation(numbering: n => "(3.4)")
   $ sans(Q)_m^(hat(e)_m) = frac(W_m^(hat(e)_m), sans(R)_m^(hat(e)_m) \[ W_m^(hat(e)_m) \]) sans(R)_m^(hat(e)_m) . $ <eq:local-weight>]
  This is an identity of raw-word masses, cut and search-mark masses, and exact retained shifts, established before any observation is selected. On a sufficiently small such cell, the guards and stable comparison instructions make every prescribed flexible resolution correct for every admitted raw configuration. In the finite bridge, the protected prefix inventories and exact terminal heights also make the prescribed suffix resolutions and empty reduction automatic. Before restriction to these cells the corresponding indicators remain in the exact weight; the omitted actual mass is removed only by the exhaustion below. The remaining cell tests have continuity boundaries in the macroscopic variables. After cancelling factors depending only on the frozen exterior, the weights are bounded on the cell. Write $I_m$ for the scaled chart input and $J_m$ for the scaled auxiliary full heights, noise paths, and whole-contour tests kept in the calculation. Along every convergent sequence of good microscopic exteriors whose limiting frozen value $e$ belongs to the full-measure continuity set for the chosen limiting frozen-data law, their joint reference law satisfies
  #[#set math.equation(numbering: n => "(3.5)")
   $ \( I_m \, J_m \, W_m^(hat(e)_m) \) arrow.r.double \( I \, J \, W \( e \, I \, J \) \) \, #h(2em) 0 < integral W \( e \, I \, J \) thin R_e \( thin upright(d) I \, thin upright(d) J \) . $ <eq:local-weight-limit>]
  Here $J$ is the limit of $J_m$. The limiting weight depends only on these macroscopic inputs. These are the protected-word density and positive-normalizer conclusions of Section 5 of #cite(label("C")), and the resampling and macroscopic-density conclusions used in the proof of Theorem 7.10 of #cite(label("P")).
  Adjoining $Y_m^alpha$ is a measurable push-forward of both sides of (3.4), so the finite identity is unchanged. Let $cal(P)_m$ be the sigma-field of the full permitted protected package: its raw extended blocks, durations, used-start offsets, exact forest differences, and instruction. Its rescaled intrinsic input is $I_m$, and the observation (3.1) is $cal(P)_m$-measurable. Compactness of $E_alpha$ permits an extraction whose protected-package limit disintegrates as $R_e^I \( thin upright(d) I \) K^alpha \( I \, thin upright(d) y \)$.
  Let $D_m$ be the chosen stable feasible cell in the full reference proposal. In the cell-restricted identity (3.4), globally $W_m^(hat(e)_m) = upright(bold(1))_(D_m) overline(W)_m^(hat(e)_m)$, with $overline(W)_m^(hat(e)_m)$ extended by zero off the cell and uniformly bounded after the exterior cancellation. Thus $upright(bold(1))_(D_m) sans(R)_m^(hat(e)_m)$ is an unnormalized subprobability; the package is not conditioned on fitting. The recorded lattice and parity conventions put the retained endpoints on the feasible coset, and the uniform local limit with positive limiting density excludes dummy endpoints on the retained compact positive ranges for all sufficiently large $m$, by #cite(label("C")) Lemma 5.5 and the proof of #cite(label("P")) Proposition 7.9. Together with the stable-resolution argument above, this gives an input-only limiting continuity cell $D_e$.
  Disintegrate $R_e \( thin upright(d) I \, thin upright(d) J \) = R_e^I \( thin upright(d) I \) sans(J)_e \( I \, thin upright(d) J \)$, using the version furnished by the compact increment, fibre-height, and bridge kernels. For every bounded continuous $psi$, along the good frozen-exterior sequences above, the source construction implies
  #[#set math.equation(numbering: n => "(3.6)")
   $ parallel sans(R)_m^(hat(e)_m) \[ upright(bold(1))_(D_m) psi \( J_m \) divides cal(P)_m \] - sans(J)_e \( upright(bold(1))_(D_e) psi \) \( I_m \) parallel_(L^1 \( sans(R)_m^(hat(e)_m) \)) arrow.r 0 \,\
sans(J)_e \( upright(bold(1))_(D_e) psi \) \( I \) := integral upright(bold(1))_(D_e) \( I \, j \) psi \( j \) sans(J)_e \( I \, thin upright(d) j \) . $ <eq:reference-conditional-test>]
  This is an averaged conditional estimate; rare exact packages may have large error. To see the implication from the source, condition first on the package, fresh ordinary nuisance pieces, and fibre height. The exact normalized bridge endpoints differ by $o_(bb(P)) \( 1 \)$, under the joint reference law, from those computed from $I_m$, the scaled fibre height, and the macroscopic nuisance paths. Compact-uniform bridge convergence replaces their bounded continuous conditional tests in $L^1$; integration over the nuisance kernels and conditional Jensen give (3.6). These are the compact-cell ingredients in #cite(label("C")) Lemma 5.5 and the proof of Lemma 5.7 and the proof of #cite(label("P")) Proposition 7.9. Here the surrogate bound is used only for protected extensions and genuinely fresh ordinary nuisance blocks. For the hard cell indicator one first uses continuous cutoffs. Approximating from inside and outside, the null limiting boundary makes the remaining reference $L^1$ gap vanish, first as $m arrow.r oo$ and then as the cutoff neighborhood shrinks. The resulting $sans(J)_e \( upright(bold(1))_(D_e) psi \)$ is continuous at $R_e^I$-almost every input.
  Multiplying the conditional error by a bounded continuous $f \( I_m \, Y_m^alpha \)$, then using the protected-package extraction, proves the localized factorization
  #[#set math.equation(numbering: n => "(3.7)")
   $ \( I_m \, J_m \, Y_m^alpha \)_(*) \( upright(bold(1))_(D_m) sans(R)_m^(hat(e)_m) \) arrow.r.double upright(bold(1))_(D_e) \( I \, J \) R_e \( thin upright(d) I \, thin upright(d) J \) thin K^alpha \( I \, thin upright(d) y \) . $ <eq:reference-disintegration>]
  Full heights affect the finite observation only through the exact forest differences in $theta_m^alpha$, whose scaled values are retained in $I_m$; durations remain input variables. Thus no continuity of the numerical observation in the contours was used.
  Take the next joint limits under these truncated laws. The corresponding weight marginal, by (3.5) and the same cell cutoff, places the weight at $W \( e \, I \, J \)$ almost surely. Since $W_m^(hat(e)_m) = upright(bold(1))_(D_m) W_m^(hat(e)_m)$ and $W = upright(bold(1))_(D_e) W$, the numerator and denominator in (3.4) can be integrated against the truncated laws without change. For a bounded continuous test $Phi$ of the retained input and output, boundedness of the weights in (3.4) now yields
  #[#set math.equation(numbering: n => "(3.8)")
   $ lim_m sans(Q)_m^(hat(e)_m) \[ Phi \] = frac(integral Phi \( I \, J \, y \) W \( e \, I \, J \) R_e \( thin upright(d) I \, thin upright(d) J \) K^alpha \( I \, thin upright(d) y \), integral W \( e \, I \, J \) R_e \( thin upright(d) I \, thin upright(d) J \)) . $ <eq:weighted-kernel-limit>]
  Thus the weight changes the input law and leaves the conditional law of $y$ equal to $K^alpha \( I \, thin upright(d) y \)$. Including bounded continuous whole-contour tests in $J$, followed by a monotone class, gives the identity conditional on the complete contours and marks. The conditional-independent attachment of the remaining coordinate data preserves it. The later finite-cell exhaustion removes the cell restriction in the actual law.
  For finitely many disjoint buffers, the complete reference packages, including the added outputs, are independent. Their joint weak limit is the product of their joint limits. The resampling weight for their union depends only on the combined macroscopic inputs, so (3.8) preserves the product of output kernels. Cylinder tests give the countable assertion. Exact reconstruction in a common union record makes two descriptions of the same finite observation equal eventually on activation, and this equality passes to the joint limit. For inner and outer descriptions that are only ordered, the corresponding inequalities pass with the fixed open losses instead.
  For the canonical feasible-order augmentation, fix a compact protection inside a bounded real buffer, with a fixed larger imaginary buffer. The traversals of the real buffer meeting the protection form an almost surely finite family. Let $o$ range over its feasible orders, with positive conditional weights $w_o \( I_(upright("IG")) \)$. These weights depend only on the unclocked imaginary input, not on the real field or the time unit. The preceding argument gives the enlarged joint kernel $K_o$ at each order. Keep the actual-order component and sample the other components independently from their $K_o$’s conditional on the fields. The vector then has conditional law $product_o K_o$, with its joint array of labels intact. Independent auxiliary fills in disjoint raw-buffer packages preserve their product law. This is the feasible-order construction in Section 5 of #cite(label("C")), now applied to the enlarged output.
  The compact continuity cells exhaust the actual generic input law. The companion’s reconstruction and guard arguments supply finite covers, positive gaps, and admissible instructions almost surely. Finitely many cells and compact parameter truncations omit at most $epsilon$ of that law. Their omitted contribution to a bounded conditional-identity test is at most its bound times $epsilon$. Letting $epsilon arrow.b 0$, and then diagonalizing over instructions, finite unions and coordinates, proves the simultaneous identities on activation. Only input and reconstruction events enter this exhaustion, so there is no weight depending on a new numerical success event.
  A change of input density $r \( I \, J \)$ multiplies the limiting input–output law by that same density. Bounded approximation and truncation handle every integrable density. For changes of units use #cite(label("C")) Proposition 5.12 and the closure construction in #cite(label("P")) Section 7. Expressing the same raw map with time unit $v m$ changes the field, time labels, and a labelled frontier length $L_partial$ to
  #[#set math.equation(numbering: n => "(3.9)")
   $ h_v = h - gamma^(- 1) log v \, #h(2em) t_v = v^(- 1) t \, #h(2em) L_(partial \, v) = v^(- 1 \/ 2) L_partial \, $ <eq:indexed-units>]
  A raw incidence quantity is unchanged; a normalized output changes only by the specified new deterministic denominator. Raw cuts and incidences remain exact. Rounding a time unit changes its scaled labels by $o \( 1 \)$ when that unit diverges. For varying labels, retain the normalized reference input law, its positive duration and shift densities, and all fixed effective units as required by the companion’s indexed construction. Equation (3.9) re-expresses one array; it does not identify differently indexed kernels at an unchanged field.
  For the spatial assertion put
  #[#set math.equation(numbering: n => "(3.10)")
   $ xi = #scale(x: 120%, y: 120%)[\(] h \|_U \, med h^(upright("IG")) \|_V med \( mod med upright("period") \) \, med upright("area marks in ") U \, med O #scale(x: 120%, y: 120%)[\)] \, $ <eq:spatial-input>]
  where $V$ contains a neighborhood of $overline(U)$, and $O$ is the finite relative order. The reconstruction in #cite(label("P")) Theorem 7.13, and its canonical counterpart in #cite(label("C")) Section 5, reads from $xi$ the finitely many directed traversals meeting $K_(*)$, their clocked cuts, labelled frontier relations, forest differences, separating bands, and used flexible-order instructions. The containments (3.2) and the intrinsic instruction are therefore selected from $xi$ on activation. The full preimage and star conditions make their finite reconstruction exact eventually.
  The global labels locating those blocks in $cal(C)$ need not be measurable from $xi$. What is local is the evaluated kernel. Two realizations of the same intrinsic description use the same reference blocks, durations, shifts, and observation after relabeling. Denote that description by $s \( xi \)$, its continuous input by $c \( xi \)$, and the map on the joint label/output space that sends time labels to spatial positions, leaving intrinsic numerical values unchanged, by $Phi_(s \( xi \))^xi$. The selected spatial kernel is
  #[#set math.equation(numbering: n => "(3.11)")
   $ sans(K)_xi = #scale(x: 120%, y: 120%)[\(] Phi_(s \( xi \))^xi #scale(x: 120%, y: 120%)[\)]_(*) K^(s \( xi \)) \( c \( xi \) \, dot.op \) \, $ <eq:spatial-kernel>]
  which is measurable from $xi$. If $alpha_(*) \( cal(C) \)$ is the globally located atlas member selected by this description, then on its activation event summing the fixed-chart identities over ${ alpha_(*) = alpha }$ and using the tower property gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ bb(E) \[ f \( Y^(alpha_(*)) \) divides cal(C) \] = sans(K)_xi f \, #h(2em) bb(E) \[ f \( Y^(alpha_(*)) \) divides xi \] = sans(K)_xi f $ <eq:spatial-selection>]
  for bounded measurable $f$. The same computation for products and common union records proves spatial product and restriction compatibility. This selection occurs after the limiting array has been extracted. ◻
]

The observations needed below fit this result directly. On a finite retained graph, extremal length with vertex ports and subgraph confinement is a numerical optimization over a finite edge space. An infimum of a quadratic edge energy subject to finitely many vertex-value bounds is measurable as well: its sublevel tests are finite polynomial inequalities with real quantifiers. The same description applies to a universal inequality over all vertex functions. A minimum sufficient dyadic level for such inequalities down to singleton cuts is one integer-valued function of the same finite record. These observations require no continuity in the limiting contours. Their spatial meaning always uses the fixed margins and activation above.

#prodef([Proposition 3.2.])[
  (Probability-one support on ordinary sphere patches).  #emph[Fix $T > 0$, a joint extraction of ordinary empty-word excursions of duration $T$, and matching bilateral or ordinary-field reference experiments from Proposition 6. Normalize a sphere coordinate using the exploration root at infinity and two independent quantum-area marks at $0 \, 1$. Let $K subset.double U$ be a protected patch, where $U$ is a relatively compact disk avoiding $0 \, 1$, with a fixed larger imaginary-field buffer.]
  #emph[For each retained coordinate set its limiting output equal to a fixed cemetery symbol when that coordinate is not activated, and call the resulting finite or countable vector the activated array. Let $B$ be a measurable event of the local input (3.10) and this activated array. If $B$ has probability zero for the ordinary reference input with its common conditional observation kernel, it has probability zero in this sphere extraction. The assertion retains the actual additive sphere height and the same deterministic time and observation units. It holds simultaneously for a countable protected atlas and fixed open losses. Independent additional area-mark pairs exhaust the auxiliary marks by application to each marked marginal; the exploration root remains excluded.]
  #emph[Let $X_m in \[ 0 \, oo \]$ be retained through compactification, and let $X in \[ 0 \, oo \]$ denote its extended-real limit. If $X lt.eq C$ almost surely on activation for a deterministic $C < oo$ in every such ordinary extraction, then, almost surely on activation of that coordinate in the sphere representation extraction, $X_m lt.eq C'$ eventually for every fixed $C' > C$. If instead $X < oo$ almost surely on activation in every such ordinary extraction, then, almost surely on activation of that coordinate in the sphere representation extraction, $X_m$ is eventually bounded by a finite constant which may depend on the sample and the test.]
] <prop:sphere-support>

#proof[
  Let $sans(P)_(T \, U)$ be the law of the actual duration-$T$ sphere real field on $U$, and fix $sans(P)_(upright("ord") \, U) := "Law" \( G_R \|_U \)$ with $overline(U) subset.double B_R$ as above. The actual-height comparison #cite(label("C")) Lemma 5.13 and Proposition 5.12, or #cite(label("P")) Lemma 3.3, as used in Lemma 18.1, gives $sans(P)_(T \, U) lt.double sans(P)_(upright("ord") \, U)$ for $T = 1$. For $T eq.not 1$ the field is shifted by $gamma^(- 1) log T$; a Cameron–Martin cutoff equal to that constant near $overline(U)$ gives the same local absolute continuity.
  Let $sans(P)_(upright("IG"))$ be the law of the entire independent stationary-phase imaginary field and its unparameterized directed space-filling curve, and let $Pi_h$ be the common conditional law of the local area marks. The full imaginary object retains the order $O$ in (3.10), and all the corresponding finite orders for an array of tests. For such an array, $xi$ and $sans(K)_xi$ denote its joint local input and kernel. The input laws satisfy
  #[#set math.equation(numbering: n => "(3.13)")
   $ sans(P)_(T \, U) \( thin upright(d) h \) thin sans(P)_(upright("IG")) \( thin upright(d) zeta \) thin Pi_h \( thin upright(d) pi \) med lt.double med sans(P)_(upright("ord") \, U) \( thin upright(d) h \) thin sans(P)_(upright("IG")) \( thin upright(d) zeta \) thin Pi_h \( thin upright(d) pi \) . $ <eq:sphere-input-domination>]
  The local input $xi$ is a measurable function of $\( h \, zeta \, pi \)$. Proposition 6 gives the same observation kernel $sans(K)_xi$ on activation on both sides; the cemetery convention extends it to the activated array everywhere. If $r \( h \)$ is the input density, the sphere probability of $B$ equals
  #[#set math.equation(numbering: n => "(3.14)")
   $ integral r \( h \) thin sans(K)_(xi \( h \, zeta \, pi \)) \( B_(xi \( h \, zeta \, pi \)) \) thin sans(P)_(upright("ord") \, U) \( thin upright(d) h \) sans(P)_(upright("IG")) \( thin upright(d) zeta \) Pi_h \( thin upright(d) pi \) . $ <eq:sphere-support-integral>]
  The integrand without $r$ vanishes almost everywhere by the reference null assumption, so this integral is zero. A compact patch avoiding the exploration root has full time preimage in a strict interior of $\( 0 \, T \)$, as required for the finite-word kernel. Countable intersection gives the simultaneous statement. Repetition with fresh area-mark pairs uses each marginal separately, without conditioning on the other pairs.
  Convergence in $\[ 0 \, oo \]$ to a value at most $C$ gives an eventual bound $C' > C$; convergence to a finite value gives an eventual finite bound. Exact reconstruction on activation supplies the finite-graph interpretation. This deduction is made in the representation extraction and supplies no finite-scale rate or conditional probability. ◻
]

For selected neighborhoods of a bilateral word, the needed comparison is the raw-block subprobability estimate, which can see a discontinuous lattice observation.

#prodef([Lemma 3.3.])[
  (Null tests in protected selected slots).  #emph[Take a finite chronologically ordered list of disjoint slots as in #cite(label("P")) Proposition 7.16, each with a left safety band of positive limiting duration. Conditional on the incoming past and auxiliary choices independent of the fresh letters, the entire list of retained cuts, durations, extensions, and guard/noise anchors is chosen before fresh letters are inspected. The auxiliary selections have total conditional weight at most one. Retained shifts form a forest in each coordinate; after the unimodular change to differences from each component’s earliest vertex, at most one new difference per coordinate is imposed at a slot. The finite instruction list is genuinely compatible, and durations, shifts, ordinary increments, and noise parameters lie in the stated compact fitting ranges. For the null transfer below, no slot meets the distinguished center time. Append observations (3.1) of those records.]
  #emph[Let $sans(F)_m$ be the fresh-word comparison, $G_m$ the compatibility event, and $sans(R)_m$ the law of the retained input and observations under its independent raw-block reference experiment. The observation push-forwards satisfy 
#[#set math.equation(numbering: n => "(3.15)")
 $ \( sans(F)_m \|_(G_m) \)_(upright("obs")) lt.eq C sans(R)_m . $ <eq:record-domination>]

 Identifying an observation event with its preimage, if a selected law $sans(S)_m$ has bounded relative entropy with respect to $sans(F)_m$, allowing bounded average conditional entropy with an unchanged history marginal, then $sans(R)_m \( B_m \) arrow.r 0$ implies $sans(S)_m \( B_m ∩ G_m \) arrow.r 0$.]
  #emph[In a jointly extracted openly fillable protected chart, every event of the input and appended observations that is null in the ordinary completion is null in the selected limit on that chart. This remains true for scale-dependent reference laws and a random viewing level under the joint-extraction hypotheses of #cite(label("P")) Proposition 7.18.]
] <lem:record-null-transfer>

#proof[
  Proposition 7.16 of #cite(label("P")) bounds the compatible subprobability law of the entire raw retained blocks and exact shifts. A measurable push-forward preserves that inequality, proving (3.15). There is no division by the probability of compatibility. Put $p_m = sans(S)_m \( B_m ∩ G_m \)$ and $q_m = sans(F)_m \( B_m ∩ G_m \)$. When $0 < q_m < 1$, the binary relative-entropy inequality gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ p_m log \( 1 \/ q_m \) lt.eq "Ent" \( sans(S)_m divides sans(F)_m \) + log 2 . $ <eq:record-entropy>]
  If $q_m = 0$, finite entropy already gives $p_m = 0$. Since $q_m lt.eq C sans(R)_m \( B_m \) arrow.r 0$, the conclusion follows. Conditional entropy integrates to joint entropy when the history marginal is unchanged; a tight entropy bound may first be truncated.
  For the final assertion, write the reference input and output law as $mu \( thin upright(d) c \) K_c \( thin upright(d) y \)$. On a compact stable cell the ordinary completion induces a retained subprobability law
  #[#set math.equation(numbering: n => "(3.17)")
   $ f \( c \) thin mu \( thin upright(d) c \) K_c \( thin upright(d) y \) \, #h(2em) f \( c \) = integral a \( c \, v \) upright(bold(1))_(cal(T)) \( c \, v \) thin lambda_c \( thin upright(d) v \) . $ <eq:fillable-density>]
  Here $lambda_c$ is the conditional law of omitted Brownian or first-passage filling pieces, $cal(T)$ is the strict compatible filling event, and $a \( c \, v \) > 0$ is the translated endpoint-density multiplier. Open fillability gives $f \( c \) > 0$ on the inputs at issue. The multiplier depends on the input and filling, so Proposition 6 leaves the enlarged $K_c$ unchanged. If $B$ is null in this completion, then
  $ 0 = integral f \( c \) K_c \( B_c \) thin mu \( thin upright(d) c \) $
  forces $K_c \( B_c \) = 0$ for $mu$-almost every openly fillable $c$. Restricting first to $f \( c \) gt.eq epsilon$ and then letting $epsilon arrow.b 0$ requires no uniform filling probability. The tight absolute continuity obtained from (3.15)–(3.16) transfers this null set to the selected limit. Proposition 7.18 of #cite(label("P")) applies the argument in each jointly extracted limit for scale-dependent reference laws, and hence for mixtures over a viewing level. Its off-center and strict-gap hypotheses remain in force. ◻
]

We finish with the pointwise consequence of locality used for crossing directions and for the conductivity density. Call a jointly measurable readout $Y \( z \)$, $z$ in an ordinary coordinate domain $D$, a #emph[germ] if, for every neighborhood $V$ of $z$, it is a measurable function of the input and observation arrays of activated strict tests whose buffered supports are compactly inside $V$. Descriptions must agree under common refinements. It is enough that $Y \( z \)$ be a tail limit of such tests as their supports shrink to $z$, unchanged by deleting finitely many initial tests. Examples include an indicator quantified over all sufficiently small dyadic disks and a density obtained from local measures on shrinking disks.

#prodef([Lemma 3.4.])[
  (Deterministic local germs).  #emph[Let $Y \( z \)$ be a germ with values in a separable metric space, formed from the arrays of Proposition 6 in an ordinary field chart. Assume its description is intrinsic under each coordinate change under consideration: transporting the fields, traversals and ports transports $Y$ by a specified measurable action on its value space. Then for planar-area-almost every deterministic $z$, $Y \( z \)$ is almost surely deterministic. The deterministic values obey that action for each fixed affine coordinate change for which the original and transported ordinary field restrictions are locally equivalent. The assertions hold jointly for countably many germs and coordinate changes.]
  #emph[Suppose in addition that $D$ is connected and that, for every $b in bb(Q)^2$ and every pair of disks $V \, V + b subset.double D$, the descriptions on these disks are related by translation, its action on the value space is the identity, and common restrictions identify the descriptions on overlaps. Then the deterministic value is constant almost everywhere in $D$. In particular, a matrix germ with this translation property and rotation action $M mapsto R M R^(sans(T))$ has a constant matrix $M_0$ satisfying $M_0 = R M_0 R^(sans(T))$ for every permitted rotation $R$.]
] <lem:deterministic-germs>

#proof[
  We give the locality argument of #cite(label("C")) Lemma 8.3 for the enlarged arrays. Let $cal(H)$ be the sigma field of the entire real and imaginary fields. By #cite(label("C")) Lemma 3.7, at every deterministic planar $z$ the whole-plane exploration has a unique preimage almost surely. For every larger neighborhood $V$, all visits to a sufficiently small neighborhood of $z$ then lie in one traversal of $V$: otherwise properness gives a second limiting preimage outside that traversal. Success is readable in a slightly larger local buffer, since the imaginary field there reconstructs the finite directed traversal list. Shrinking the inner neighborhood exhausts a probability-one event. On this exhaustion, the small tests defining a germ need no exterior permutation; their order is the direction of that traversal. Proposition 6 therefore implies, for bounded measurable $phi$, that
  #[#set math.equation(numbering: n => "(3.18)")
   $ p_phi \( z \) = bb(E) \[ phi \( Y \( z \) \) divides cal(H) \] $ <eq:germ-conditional-mean>]
  is measurable from the field restrictions in every neighborhood of $z$. Here the local Poisson auxiliary marks of the kernel construction are integrated out: their restrictions to disjoint spatial sets are conditionally independent given $h$. This step does not involve the three canonical area samples used to normalize the sphere. At distinct $z \, w$, disjoint sufficiently small real buffers give product conditional kernels, hence conditional independence of $phi \( Y \( z \) \)$ and $phi \( Y \( w \) \)$ given $cal(H)$.
  For a bounded real $phi$, conditional Fubini and this product identity give, for every rational disk $V subset.double D$,
  #[#set math.equation(numbering: n => "(3.19)")
   $ bb(E) #h(-0.16667em) [(integral_V { phi \( Y \( z \) \) - p_phi \( z \) } thin upright(d) z)^2 thin mid(bar.v) thin cal(H)] = 0 . $ <eq:germ-integral>]
  The diagonal in $V times V$ has area zero. A countable disk exhaustion and Lebesgue differentiation imply $phi \( Y \( z \) \) = p_phi \( z \)$ for almost every $z$, almost surely. Fubini reverses these quantifiers at almost every deterministic point.
  The point germ of the two ordinary fields is trivial. For a Dirichlet GFF, the intersection of the Gaussian subspaces generated by restrictions to shrinking disks around $z$ is orthogonal to every smooth function vanishing near $z$. Logarithmic cutoffs show that a point has zero Dirichlet capacity, so these functions are dense and the intersection is zero. Decreasing Gaussian projections give triviality of the completed sigma-field intersection. The same reasoning applies to two independent fields; reducing the imaginary field modulo its period removes information. Local absolute continuity transfers the conclusion to the ordinary chart conventions, as in the proof of Lemma 8.3 of #cite(label("C")). Since (3.18) is measurable in every shrinking field restriction, it is deterministic. A countable family of bounded continuous functions separating points of the value space proves the claim for $Y$.
  For $psi \( z \) = a z + b$, the field transformation is
  #[#set math.equation(numbering: n => "(3.20)")
   $ h mapsto h compose psi + Q log \| a \| \, #h(2em) h^(upright("IG")) mapsto h^(upright("IG")) compose psi - chi arg a \, quad Q = 2 / gamma + gamma / 2 \, quad chi = 2 / gamma - gamma / 2 . $ <eq:affine-fields>]
  Proposition 5.12 of #cite(label("C")) identifies the same intrinsic incidence record in these coordinates and gives local equivalence of the field laws. A probability-zero or probability-one statement about $Y$ therefore transports by its stated action, so its deterministic value obeys that action. Under the additional translation hypothesis, every bounded continuous function of the deterministic version is invariant almost everywhere under rational translations whose local buffers fit. Continuity of translations in local $L^1$ extends this to all translations, making each such function constant almost everywhere on the connected domain. A countable separating family gives a constant value of the germ. The rotation assertion follows with the stated conjugation action. ◻
]

== 4 Electrical control in fixed regions <sec:network>

We next obtain electrical estimates in the reference coordinate. The estimates concern a fixed annulus or a fixed route between open sets. Their constants depend on relative geometry, while the discrete index from which they hold may depend on the region and on the sample. This is the macroscopic control used to identify the limiting energy.

The canonical companion proves nondegeneration of extremal length on its piecewise Euclidean flag surface. We require the corresponding statement for paths on the original graph edges. We prove it here using the aligned annuli of #cite(label("C")) Theorem 6.4 and the numerical observations of Section 3. The density and path compactness arguments follow the mechanism in #cite(label("C")) Section 8. For edge paths, the final obstruction is the intersection of paired primal and dual edges.

=== 4.1 Edge extremal length and traffic <edge-extremal-length-and-traffic>

Let $sans(G)$ be a finite undirected multigraph. Its edges are always counted as distinct occurrences. For a finite walk $pi$, let $N_e \( pi \)$ be the number of traversals of $e$, in either direction and with multiplicity. For a nonnegative edge function $g$, set

$ L_g \( pi \) = sum_(e in E \( sans(G) \)) g_e N_e \( pi \) \, #h(2em) lr(bar.v.double g bar.v.double)_2^2 = sum_(e in E \( sans(G) \)) g_e^2 . $

Choose one orientation of each edge occurrence, write $d_e u = u \( e^(+) \) - u \( e^(-) \)$, and set

$ cal(E)_(sans(G))^0 \( u \) = sum_(e in E \( sans(G) \)) \( d_e u \)^2 . $

The choice of orientation is immaterial, and a loop has zero difference. For a nonempty family $cal(F)$ of such walks, define

#[#set math.equation(numbering: n => "(4.1)")
 $ "EL"_(sans(G)) \( cal(F) \) = sup_(g in \[ 0 \, oo \)^(E \( sans(G) \))\
g eq.not 0) frac(#scale(x: 120%, y: 120%)[\(] inf_(pi in cal(F)) L_g \( pi \) #scale(x: 120%, y: 120%)[\)]^2, lr(bar.v.double g bar.v.double)_2^2) . $ <eq:edge-el>]

We set $"EL"_(sans(G)) \( diameter \) = oo$. If the graph has no edges and the family contains the empty walk, its extremal length is $0$. For a probability law $mu$ on walks, its traffic and squared traffic are

#[#set math.equation(numbering: n => "(4.2)")
 $ tau_mu \( e \) = bb(E)_mu N_e \( pi \) \, #h(2em) cal(T)_(sans(G)) \( mu \) = sum_(e in E \( sans(G) \)) tau_mu \( e \)^2 . $ <eq:edge-traffic>]

These definitions, like $cal(E)^0$, have no factor $1 \/ 2$.

For a finite family of objects with nonzero prescribed edge usages, the probabilistic variational formula below is the reciprocal form of #cite(label("AlbinPoggiCorradini2016")) Theorem 5.1, since our $"EL"$ equals their $"Mod"_2^(- 1)$. We include a proof using a closed convex hull that also permits an arbitrary family of finite walks. The electrical convention and the port identity are the unit-conductance case of #cite(label("BinderPechersky2025")) Propositions 2.2–2.5, where the extremal-length identity is attributed to Duffin.

#prodef([Lemma 4.1.])[
  (Finite variational identities).  #emph[For a nonempty family of finite walks, 
#[#set math.equation(numbering: n => "(4.3)")
 $ "EL"_(sans(G)) \( cal(F) \) = inf_mu cal(T)_(sans(G)) \( mu \) \, $ <eq:el-traffic-identity>]

 where finite-support probability laws on $cal(F)$ suffice for the infimum. General probability laws with finite expected edge counts give the same infimum.]
  #emph[Let $A \, B$ be nonempty disjoint vertex sets, and let $cal(F)_(sans(G)) \( A \, B \)$ contain all walks in $sans(G)$ from $A$ to $B$. Then 
#[#set math.equation(numbering: n => "(4.4)")
 $ "EL"_(sans(G)) \( cal(F)_(sans(G)) \( A \, B \) \) = R_(upright("eff"))^(sans(G)) \( A \, B \) = [inf_(u \|_A = 0\
u \|_B = 1) cal(E)_(sans(G))^0 \( u \)]^(- 1) . $ <eq:port-resistance>]

 The two port sets are wired separately, and the resistance is computed in the same graph $sans(G)$ that confines the walks. If there is no connecting walk, the energy infimum is $0$ and its reciprocal is $oo$.]
] <lem:finite-el>

#proof[
  Write $a_pi = \( N_e \( pi \) \)_(e in E \( sans(G) \))$, and let $K$ be the closed convex hull of these nonnegative vectors. For $t in K$ and $g gt.eq 0$,
  $ inf_(pi in cal(F)) a_pi dot.op g lt.eq t dot.op g lt.eq lr(bar.v.double t bar.v.double)_2 lr(bar.v.double g bar.v.double)_2 . $
  Consequently $"EL"_(sans(G)) \( cal(F) \) lt.eq inf_(t in K) lr(bar.v.double t bar.v.double)_2^2$. Let $p$ be the point of $K$ nearest $0$. If $p = 0$, this already gives equality. Otherwise $p gt.eq 0$, and the projection inequality gives
  $ a_pi dot.op p gt.eq lr(bar.v.double p bar.v.double)_2^2 quad upright("for every ") pi in cal(F) . $
  Taking the admissible nonzero density $g = p$ in (4.1) gives the reverse inequality. Finite convex combinations are precisely the traffic vectors of finite-support laws and are dense in $K$. A general traffic vector with finite coordinates belongs to $K$, by approximating its law by finite laws and allowing an arbitrarily small error in the coordinates. This proves (4.3).
  For the port identity, first suppose a connecting walk exists. Let $u \|_A = 0$, $u \|_B = 1$, and take $g_e = \| d_e u \|$. A connecting walk and these port values force $g eq.not 0$, so this density is admissible in (4.1). The telescoping inequality gives $L_g \( pi \) gt.eq 1$ on every connecting walk, so $"EL" gt.eq 1 \/ cal(E)_(sans(G))^0 \( u \)$. Conversely, for a density with $b = inf_(pi in cal(F)_(sans(G)) \( A \, B \)) L_g \( pi \) > 0$, let $d_g \( A \, v \)$ be weighted graph distance from $A$, with value $oo$ in a component not meeting $A$. The function
  $ u \( v \) = min { 1 \, d_g \( A \, v \) \/ b } $
  has the required port values and satisfies $\| d_e u \| lt.eq g_e \/ b$ on every edge. Thus the energy infimum in (4.4) is at most $lr(bar.v.double  bar.v.double) g_2^2 \/ b^2$. Take the supremum over $g$. If no connecting walk exists, assign a constant to each component, proving the stated convention. The equality with wired effective resistance is the Dirichlet principle for a unit-conductance network. Loop differences vanish throughout. ◻
]

We will repeatedly use the following consequence of the definition. If every walk of a family $cal(F)$ contains a subwalk in $cal(G)$, then

#[#set math.equation(numbering: n => "(4.5)")
 $ "EL" \( cal(F) \) gt.eq "EL" \( cal(G) \) \, $ <eq:el-subpassage>]

when the densities for $cal(G)$ are extended by zero to the common ambient graph. Thus a lower bound for a confined family controls a wider crossing family only when this subwalk property holds.

We specify the spatial tests to which the estimates will apply. At scale $m$ letters per time unit, write $Psi_m$ for the reference-coordinate homeomorphism of Proposition 5(iii), with $m = 2 n$ on a duration-one sphere. For a bilateral test, $Psi_m$ denotes the restriction to the unchanged protected flag subcomplex of the homeomorphism from the finite sewn sphere to the reference one-point compactification supplied by #cite(label("C")) Proposition 4.9. Edges are drawn in this surface as in Lemma 3. Given open sets $P_(-) \, P_(+) subset.double W$ with disjoint closures, let $cal(F)_m \( P_(-) \, P_(+) \; W \)$ contain all vertex-to-vertex walks in the chosen network whose initial and terminal vertices project into $P_(-)$ and $P_(+)$, respectively, and whose entire edge arcs project into $W$. Every traversed edge is charged in full, including an edge crossing a boundary of a smaller spatial band.

For $A \( z \; r \, R \) = { w : r < \| w - z \| < R }$, fix

$ upright(bold(a)) = \( a_0 \, a_1 \, a_2 \, a_3 \, a_4 \, a_5 \) \, #h(2em) 0 < a_0 < a_1 < a_2 < a_3 < a_4 < a_5 . $

The annular family $cal(A)_m \( z \, r \; upright(bold(a)) \)$ is $cal(F)_m \( P_(-) \, P_(+) \; W \)$ with

#[#set math.equation(numbering: n => "(4.6)")
 $ P_(-) = A \( z \; a_1 r \, a_2 r \) \, #h(2em) P_(+) = A \( z \; a_3 r \, a_4 r \) \, #h(2em) W = A \( z \; a_0 r \, a_5 r \) . $ <eq:annular-template>]

The positive gaps are part of the template. Once the flag mesh is smaller than those gaps, any walk advancing from $overline(B) \( z \, a_1 r \)$ to the exterior of $B \( z \, a_4 r \)$ contains a walk between slightly inset versions of these ports, confined in $W$. Indeed, take the portion after the last visit to an intermediate inner radius and before the first subsequent visit to an intermediate outer radius. The mesh places its endpoint vertices in the prescribed bands and keeps all its edge arcs in $W$.

#prodef([Theorem 4.2.])[
  (Electrical bounds for fixed tests).  #emph[Consider either the primal or the dual network. Fix a countable collection of intrinsic instructions from Proposition 6. Suppose their activated spatial interpretations have the strict ports, confinements, and complete stars described below, compactly in an ordinary reference chart. The same assertions hold in the sphere patches covered by Proposition 7. In every joint representation extraction, almost surely on activation, each fixed instruction has the following properties for all sufficiently large discrete indices.]
  + #emph[For the annular template (4.6), 
$ "EL" #scale(x: 120%, y: 120%)[\(] cal(A)_m \( z \, r \; upright(bold(a)) \) #scale(x: 120%, y: 120%)[\)] gt.eq c_(upright(bold(a))) > 0 . $

 The constant is deterministic and depends only on the relative radii and the fixed protection margins.]
  + #emph[Fix $0 < a < b$, with a protected disk buffer around $B \( z \, b r \)$. There is a function $u_m$ on the network vertices with values in $\[ 0 \, 1 \]$, equal to $1$ at every vertex whose projected complete flag star meets $overline(B) \( z \, a r \)$, and equal to $0$ at every vertex whose projected star meets the exterior of $B \( z \, b r \)$. Its nonzero edge differences are supported in a fixed compact subannulus of $A \( z \; a r \, b r \)$, and 
$ cal(E)^0 \( u_m \) lt.eq C . $

 The constant depends only on $a \, b$ and the chosen relative margins. In a protected patch the function is extended by the indicated constants across its two sides.]
  + #emph[Fix $0 < a < b < c$. There is a probability law on simple circuits $Gamma_m$ in the network, compactly confined in $A \( z \; b r \, c r \)$ and surrounding $overline(B) \( z \, a r \)$, such that 
$ sum_e bb(P) \( e in Gamma_m \)^2 lt.eq C_(a \, b \, c) . $

 A loop and a two-edge Jordan circuit are permitted simple circuits. The constant also records the fixed inner and outer collar margins.]
  + #emph[Let $W$ be connected and open, and let $P_0 \, P_1$ be nonempty open subsets of $W$. For any fixed compact polygonal route in $W$ from $P_0$ to $P_1$, there is a probability law $mu_m$ of graph paths between the vertex ports, compactly confined in $W$, with 
$ cal(T) \( mu_m \) lt.eq C < oo . $

 Here $C$ may depend on the route, its clearance from $W^c$, and its endpoint clearances inside the ports.]
  #emph[For translates and dilates of one fixed relative template, the constants are the same; they do not depend on the absolute radius. The eventual index belongs to the fixed activated test and may depend on it and on the sample. The assertions hold simultaneously for the chosen countable collection.]
] <thm:network-bounds>

We first prove the lower annular bound. Lemma 10 will then convert it to a cutoff bound, and the common planar drawing will turn dual cutoffs into primal circuit laws.

=== 4.2 Annular barriers at power scales <annular-barriers-at-power-scales>

Fix one of the two networks for this part of the argument. At diffusive height scale $2^j$, use an unconditioned contour coupling with $m_j = 4^j$ letters per time unit, together with its continuum surface and protected reference charts. These are the unconditioned and protected versions of the encoding and topology in #cite(label("C")) Sections 3–5. Choose a round traversal band in an ordinary part of a cone chart, with its field buffers strictly inside the normalization circle and away from the distinguished center. Fix its center $z_0$ and radii

$ 0 < b_0 < b_1 < dots.h.c < b_11 . $

Write $A_0 \( b \, c \) = A \( z_0 \; b \, c \)$, and choose these radii and the field buffers so that, after one fixed affine change, their closures fit strictly in the shell and buffers used by #cite(label("C")) Theorem 6.4. Define the middle family at any effective unit $m$ by

$ cal(F)_m^(upright("mid")) = cal(F)_m #scale(x: 120%, y: 120%)[\(] A_0 \( b_1 \, b_4 \) \, A_0 \( b_7 \, b_10 \) \; A_0 \( b_0 \, b_11 \) #scale(x: 120%, y: 120%)[\)] \, $

and let $Z_j$ be its raw edge extremal length at $m = m_j$. The ports have positive thickness and separated closures. If the temporary correspondence has not yet reached the required mesh, or if these ports do not yet give a nonempty family, set $Z_j = 1$. The probability of this convention tends to zero. To see the path-existence assertion, follow a fixed radial arc with positive clearance from the confinement boundary. The faces met along the arc have vanishing diameter; their boundaries supply a walk in the chosen network, still in the confinement, once the mesh is small. The same argument applies in the other network because complete primal and dual stars have vanishing mesh. The local finite sewing retains all these incidences. When the convention is not used, (4.4) gives $0 < Z_j < oo$.

The comparison with local numerical observations uses the capture ports $A_0 \( b_2 \, b_3 \)$, $A_0 \( b_8 \, b_9 \)$ and capture confinement $A_0 \( b_1 \, b_10 \)$. Cover their complete time preimages and stars by finitely many cells whose outer port and confinement covers still lie in the corresponding middle sets, as in Section 3. One activated instruction $alpha$ then gives a family $cal(L)_m^alpha$ satisfying, for all large indices,

#[#set math.equation(numbering: n => "(4.7)")
 $ cal(L)_m^alpha subset cal(F)_m^(upright("mid")) \, #h(2em) upright("every wider traversal has a subwalk in ") cal(L)_m^alpha . $ <eq:band-sandwich>]

Here a wider traversal goes from $overline(B) \( z_0 \, b_1 \)$ to the exterior of $B \( z_0 \, b_10 \)$. Cut it after its last visit to radius $\( b_2 + b_3 \) \/ 2$ and before its first subsequent visit to radius $\( b_8 + b_9 \) \/ 2$. Vanishing mesh puts its endpoint vertices in the capture ports and all its arcs in the capture confinement, so the cell covers admit this subwalk. This holds for every traversal at once, since the cells cover full preimages, not chosen paths. Thus (4.5) gives $"EL" \( upright("wider traversals") \) gt.eq "EL" \( cal(L)_(m_j)^alpha \) gt.eq Z_j$ at $m = m_j$, whenever the temporary default is not used. In the other direction, cut each middle walk after its last visit to radius $b_5$ and before its first subsequent visit to radius $b_6$. For all large indices the resulting vertex subwalk lies compactly in $A_0 \( b_4 \, b_7 \)$ and has endpoint separation at least $d_0 = \( b_6 - b_5 \) \/ 2 > 0$. Trimming decreases every edge count. An outer cell cover of all these trimmed paths, with port margins around $b_5$ and $b_6$ and confinement still inside $A_0 \( b_4 \, b_7 \)$, supplies a local witness for an upper bound on their squared traffic.

The cell-described families $cal(L)_m^alpha$ and the outer covers of trimmed paths are functions of the canonical finite incidence records $cal(R)_m^alpha$. The sets of instructions fitting the bands with the stated inclusions are chosen from the limiting local input. They form a countable union of activated descriptions. In particular, the extremal length defined using a temporary correspondence is only used to witness inequalities for these local observations.

Choose a sufficiently small $epsilon > 0$, and choose deterministic lower quantiles $rho_j > 0$ satisfying

#[#set math.equation(numbering: n => "(4.8)")
 $ bb(P) \( Z_j gt.eq rho_j \/ 2 \) gt.eq 1 - 2 epsilon \, #h(2em) bb(P) \( Z_j lt.eq 2 rho_j \) gt.eq epsilon \/ 2 . $ <eq:raw-el-quantiles>]

Such choices exist for positive finite random variables, including laws with atoms. We will choose $epsilon$ small enough for the fixed changes of reference law below.

Suppose for a contradiction that $liminf_j rho_j = 0$. There are running record indices $j_k$ such that

#[#set math.equation(numbering: n => "(4.9)")
 $ m_k = 4^(j_k) \, #h(2em) rho_(j_k) arrow.r 0 \, #h(2em) rho_(j_k - i) gt.eq rho_(j_k) quad upright("eventually for every fixed ") i gt.eq 0 . $ <eq:record-low-units>]

Retain the rows with effective units $m_k 4^(- i) = 4^(j_k - i)$ for every fixed backward offset $i$, and divide all their edge-EL observations by the same number $rho_(j_k)$. Each fixed effective unit tends to infinity, as required by Proposition 6. The first event in (4.8) in row $j_k - i$ now gives, through (4.7), a local shell lower bound of the form $c rho_(j_k)$, with a deterministic $c > 0$.

Here is the probability statement about this shell event that will be used. In each fixed row retain the high-event indicator in (4.8), the continuum input, and the countable local outputs in units $rho_(j_k)$. Retain also the indicator that $Z_(j_k - i)$ used the temporary default. Its probability tends to zero, so its Bernoulli limit is zero almost surely and the default is absent eventually in the representation of each fixed row. For any instruction $alpha$ specifying a confined port family $cal(F)_m^alpha$, write

$ Y_i^alpha = lim_(k arrow.r oo) frac("EL" \( cal(F)_(m_k 4^(- i))^alpha \), rho_(j_k)) quad upright("in ") \[ 0 \, oo \] $

for its jointly extracted output, interpreted through compactification. Choose a fixed $c_0 > 0$ smaller than the lower bound left after all the band and numerical losses. Let $sans(A)_(upright("sh"))^alpha$ be the local activation event that $alpha$ has margins in the unit shell guaranteeing the two relations in (4.7). Define the unit event

#[#set math.equation(numbering: n => "(4.10)")
 $ cal(G)_i = union.big_alpha #scale(x: 120%, y: 120%)[\(] sans(A)_(upright("sh"))^alpha ∩ { Y_i^alpha > c_0 } #scale(x: 120%, y: 120%)[\)] . $ <eq:high-unit-event>]

The union is countable and its activation conditions depend only on the limiting local input. In a joint representation extraction the limiting high indicator has probability at least $1 - 2 epsilon$. On the event that it equals $1$, the discrete indicators equal $1$ eventually and the temporary default is absent. A finite cell cover chosen from the limiting full preimages then gives an activated instruction in (4.7); its limiting output is strictly larger than $c_0$. Hence $bb(P)_(upright("row")) \( cal(G)_i \) gt.eq 1 - 2 epsilon$ for every fixed $i$. This proves a probability statement about the extracted local array. It uses neither continuity of $Z_j$ in the contour nor a conditional finite-scale probability for activation.

Normalize each row in its own effective unit $m_k 4^(- i)$, using the same output-independent rule for the cone embedding and stationary imaginary lift, and take the countable-offset extraction against one fixed unit-reference input. The ordinary cone restriction and the unit-shell restriction of #cite(label("C")) Theorem 6.4 are locally mutually absolutely continuous, with the same conditional observation kernel by Proposition 6 and #cite(label("C")) Proposition 5.12. After the row has been normalized, the input density $D$ is fixed, independent of $i$ and of $rho_(j_k)$. Writing $sans(P)_(upright("row"))$ for this common normalized cone input law, any event $B$ of the input and its outputs satisfies

$ bb(P)_(upright("ref") \, i) \( B \) lt.eq L bb(P)_(upright("row") \, i) \( B \) + integral_({ D > L }) D thin thin upright(d) sans(P)_(upright("row")) #h(2em) \( L > 0 \) . $

This follows by splitting the input density and retaining the common conditional kernel. Integrability of $D$ gives uniform absolute continuity, independently of the output kernel and denominator. We may therefore choose $epsilon$ so that $bb(P)_(upright("ref") \, i) \( cal(G)_i \) gt.eq 1 - epsilon_(*)$ for every fixed $i$, where $epsilon_(*)$ is the constant in the aligned-annulus theorem. The reference package includes the imaginary field with its stationary phase and the actual relative traversal order. Every label here uses the traversal family for one fixed compact shell protection, one bounded real buffer around it, and one fixed larger imaginary buffer. This family is finite almost surely under one fixed unclocked imaginary marginal. The all-order count and weight exhaustion in Section 6 of #cite(label("C")) first restricts, with probability loss $zeta$, to at most $J_0 < oo$ feasible orders whose weights are all at least $delta > 0$. An actual-order failure bound $epsilon_(upright("ord"))$ then gives all-order failure at most $zeta + epsilon_(upright("ord")) \/ delta$, uniformly in the labels; $zeta$ is chosen first and then $epsilon_(upright("ord"))$. For its numerical observations, the proof of #cite(label("C")) Theorem 6.4 uses only the local observation kernel, its product property on disjoint protected supports, and protection for every relative traversal order. Proposition 6 supplies these properties for the added edge array, so that proof applies to the local unit events $cal(G)_i$. We use this extended application below. The same choice of $epsilon$ may accommodate the bounded family of constant field shifts used below: their cutoff Cameron–Martin densities have a uniformly bounded $L^p$ norm for some $p > 1$, so Hölder’s inequality makes the loss uniformly small.

For a fixed integer $N$, take

$ I_N = \[ N \, 2 N \] ∩ bb(Z) \, #h(2em) v_i = 4^(- i) quad \( i in I_N \) . $

Use $cal(G)_(N \, i) = cal(G)_i$ for $i in I_N$. The event with label $v_i$ is evaluated in the larger $m_k$ array by the indexed field and volume identity (3.9). In the notation of the aligned theorem its normalized real field at center $c$ and radius $r$ is

#[#set math.equation(numbering: n => "(4.11)")
 $ h^(c \, r \, v_i) \( u \) = h \( c + r u \) + Q log r - gamma^(- 1) log v_i . $ <eq:aligned-unit-field>]

The raw edges and their EL have not changed, and the denominator is still $rho_(j_k)$. All offsets in $I_N$ are fixed before $k arrow.r oo$. Theorem 6.4 of #cite(label("C")) now supplies, almost surely in each ordinary chart for all sufficiently large $N$, at most $C N$ radii in $\[ e^(- B N) \, e^(- a N) \]$, with deterministic $0 < a < B$. At a given radius $r$, centers lie on a grid of spacing comparable to $r$, with bounded overlap of their buffered shells. Every point of a prescribed compact set belongs with strict clearance to the central holes of at least $c N$ successful shells at distinct radii. One successful test is retained per center and radius. The constants depend only on the fixed shell buffers and probability cutoff. The probability-one statement, with its constants, persists under fixed locally absolutely continuous changes of the field law. A fixed $N$ gives finitely many tests in a compact set, so their strict numerical inequalities and incidences hold in the discrete extraction for all sufficiently large $k$.

For the next estimates, regard each traversal of an edge as a traversal of a unit interval. For a parameter interval $J$ of a walk, define $N_e \( pi \; J \)$ as the total length of its portions in the unit intervals corresponding to $e$, and put

$ L_g \( pi \; J \) = sum_e g_e N_e \( pi \; J \) . $

For a full vertex walk this agrees with $L_g \( pi \)$. For disjoint parameter intervals these charges add, even when their images overlap. In particular, their sum is at most the charge of the whole walk.

#prodef([Lemma 4.3.])[
  (Edge density budget).  #emph[In the record-low extraction (4.9), let $U$ be a finite union of rational boxes compactly in an ordinary reference chart, and write $U^(+ delta)$ for its Euclidean $delta$-neighborhood. Set $R_N = e^(- a N)$. Almost surely, for every sufficiently large $N$ from the aligned configuration there are nonnegative edge functions $g_(k \, N \, U)$, supported on edges whose entire images lie in $U^(+ C R_N)$, such that 
#[#set math.equation(numbering: n => "(4.12)")
 $ limsup_(k arrow.r oo) rho_(j_k) lr(bar.v.double g_(k \, N \, U) bar.v.double)_2^2 & lt.eq C thin "Area" \( U^(+ C R_N) \) \,\
L_(g_(k \, N \, U)) \( pi \; J \) & gt.eq c thin "diam" Psi_(m_k) \( pi \( J \) \) - C R_N - epsilon.alt_(k \, N \, U) . $ <eq:edge-budget-energy>]

 Here $epsilon.alt_(k \, N \, U) arrow.r 0$ for fixed $N \, U$, uniformly over every walk interval whose projected image is in $U$. The same density works for all such intervals and for every finite disjoint collection of them. The constants $c \, C$ are deterministic and independent of $k \, N \, U$ once the shell geometry is fixed. The discrete threshold may depend on the finite configuration and its margins.]
] <lem:edge-density-budget>

#proof[
  On a successful shell at center $c$ and radius $r$, the local normalized EL lower bound and (4.1) give an edge density $g_k^(c \, r)$, with fixed slack, for which
  #[#set math.equation(numbering: n => "(4.13)")
   $ L_(g_k^(c \, r)) \( pi \) gt.eq r quad upright("on every complete shell traversal") \, #h(2em) lr(bar.v.double g_k^(c \, r) bar.v.double)_2^2 lt.eq frac(C r^2, rho_(j_k)) . $ <eq:one-shell-density>]
  Its support lies in the shell buffer. The subwalk inclusion (4.7) makes the charge valid for every traversal. The densities may be chosen measurably: a port family may be restricted to its finitely many simple paths, and a first rational density satisfying a strict near-minimum bound gives a choice from the finite incidence record.
  At each radius retain the successful centers whose buffers meet $U$, and define
  $ g_(k \, N \, U) = 1 / N sum_(\( c \, r \)) g_k^(c \, r) . $
  For fixed $N$, the edge mesh is eventually smaller than every shell margin in this finite collection. A whole supported edge can then be assigned to a point in the slightly enlarged buffer that contains it. The bounded spatial overlap at one radius bounds the number of summands on this edge by a deterministic constant; no degree bound is used. Grid counting and (4.13) give
  $ lr(bar.v.double sum_c g_k^(c \, r) bar.v.double)_2^2 lt.eq C sum_c lr(bar.v.double g_k^(c \, r) bar.v.double)_2^2 lt.eq frac(C thin "Area" \( U^(+ C R_N) \), rho_(j_k)) . $
  There are at most $C N$ radii. Cauchy–Schwarz for their sum, followed by division by $N^2$, proves (4.12) and the support assertion.
  For the charge, choose a coordinate whose oscillation on $Psi_(m_k) \( pi \( J \) \)$ is at least its diameter divided by $sqrt(2)$, and use a subinterval between a minimum and a maximum in that coordinate. Ignore coordinate levels within $C R_N$ of the two ends. At each remaining level, a visit of the walk lies in at least $c N$ successful central holes. A hole of radius $r$ accounts for a coordinate interval of length at most $C r$. For every hole counted in this way the path makes a complete traversal of the corresponding buffered shell. More precisely, strict clearance and the fixed-$N$ mesh bound place a full vertex-to-vertex shell subwalk inside $J$, even if an endpoint of $J$ is in the interior of an edge. Thus each counted shell contributes its full charge in (4.13). Integrating over the coordinate levels gives
  $ c N #scale(x: 120%, y: 120%)[\(] "osc" - C R_N - epsilon.alt_(k \, N \, U) #scale(x: 120%, y: 120%)[\)] lt.eq C sum_(upright("distinct shells traversed")) r . $
  The summed density charges at least the sum on the right before the fixed constant. Divide by $N$ and absorb constants. This proves (4.12). Its error is uniform because all projection and edge-mesh errors are uniform for this fixed configuration. Charges of disjoint parameter intervals add by their fractional edge definition; no endpoint edge is rounded up separately. This is the level-integration argument of #cite(label("C")) Section 8 applied to unit edge intervals. ◻
]

=== 4.3 Rectifiable limits of inexpensive crossings <rectifiable-limits-of-inexpensive-crossings>

We record how the budget controls path laws without a bound on the Euclidean length of an individual projected edge. The estimate is for the average arclength of the limiting paths.

#prodef([Lemma 4.4.])[
  (Compactness of edge-path laws).  #emph[Fix a sample on which the budgets of Lemma 12 hold for all sufficiently large members of a deterministic sequence of $N$’s and the countable box library. Suppose $mu_k$ are laws of paths confined in one compact set $K$ in the chart, their projected endpoints are separated by at least $d_0 > 0$, and 
#[#set math.equation(numbering: n => "(4.14)")
 $ cal(T) \( mu_k \) lt.eq C_0 rho_(j_k) . $ <eq:cheap-edge-flow>]

 After reparameterization and a subsequence, their projected laws converge weakly on $C \( \[ 0 \, 1 \] \, K \)$ to a probability law $mu$. Its paths retain endpoint separation $d_0$ and are rectifiable almost surely. Their average arclength measure $Lambda$, counted with multiplicity, satisfies 
#[#set math.equation(numbering: n => "(4.15)")
 $ Lambda \( U \) lt.eq C sqrt("Area" \( U \)) $ <eq:average-edge-arclength>]

 for every finite union of rational boxes compactly in the chart. Consequently $Lambda$ is nonzero, finite on $K$, and absolutely continuous with respect to planar area.]
] <lem:edge-flow-compactness>

#proof[
  For every edge density, the traffic pairing is
  #[#set math.equation(numbering: n => "(4.16)")
   $ bb(E)_(mu_k) L_g \( pi \) = sum_e g_e tau_(mu_k) \( e \) lt.eq lr(bar.v.double g bar.v.double)_2 sqrt(cal(T) \( mu_k \)) . $ <eq:traffic-pairing>]
  For $g = g_(k \, N \, U)$, equations (4.12) and (4.14) bound this expectation by $C sqrt("Area" \( U^(+ C R_N) \))$ for large $k$.
  Take $U$ large enough to contain $K$ with room. Given $d > 0$, choose a fixed successful $N$ with $C R_N < c d \/ 16$, and then take $k$ large enough that $epsilon.alt_(k \, N \, U) < c d \/ 16$. Every path interval of projected diameter greater than $d \/ 2$ pays at least $c d \/ 4$ in (4.12). By continuity, the endpoints of any finite collection of intervals of diameter at least $d$, with pairwise disjoint interiors, can be approximated from within by rational endpoints while retaining diameter greater than $d \/ 2$. The supremum of the crossing counts over such rational collections is measurable, since the collections are countable. Charges add, so the simultaneous bound and (4.16) bound its expectation by $C \/ d$; formally, increase over finitely many rational collections and use monotone convergence. This also bounds the maximum count for the original intervals.
  For completeness, a measurable clock gives the required tightness. First normalize the original parameter of a continuous projected path to $\[ 0 \, 1 \]$. Mark its successive first moves by distance $2^(- ell)$ and let $J_ell$ be their number. Give each such mark mass $2^(- ell) \/ \( 1 + J_ell \)$, for every $ell gt.eq 1$, and add Lebesgue mass in the original parameter. The total mass is between $1$ and $2$. Its inverse clock, with a pause at each atom and normalization to $\[ 0 \, 1 \]$, represents the same path. On a set where $J_ell lt.eq M_ell$ for every $ell$, a parameter interval shorter than $2^(- ell - 1) \/ \( 1 + M_ell \)$ cannot pass through a complete intervening pause; its image oscillation is at most $2^(2 - ell)$. The crossing-count bounds permit $M_ell < oo$ to be chosen so that the total exceptional probability is arbitrarily small. For each $ell$, the finitely many indices preceding its eventual bound are included by increasing $M_ell$. Arzelà–Ascoli and Prokhorov’s theorem give tightness and a weak limit on $C \( \[ 0 \, 1 \] \, K \)$. The endpoint separation passes to this limit.
  To control variation, fix an integer $J$ and a finite rational box union $U$. Let $V_(J \, U) \( gamma \)$ be the supremum of the sums
  $ sum_(ell = 1)^j \| gamma \( t_ell \) - gamma \( s_ell \) \| \, #h(2em) 0 lt.eq j lt.eq J \, $
  over disjoint closed intervals with rational endpoints whose images have positive clearance inside $U$, with the empty sum equal to $0$. This is lower semicontinuous on path space: each strict containment is open and each corresponding finite sum is continuous there. The simultaneous charge bound, applied before taking this supremum, and (4.16) yield
  $ bb(E)_(mu_k) V_(J \, U) lt.eq C sqrt("Area" \( U^(+ C R_N) \)) + C J R_N + J epsilon.alt_(k \, N \, U) . $
  First pass to the weak path-law limit $k arrow.r oo$, with $N \, J$ fixed. Then let $N arrow.r oo$ through successful configurations, keeping $J$ fixed, and finally let $J arrow.r oo$. The finite interval sums exhaust variation in $U$. Applying this first to a larger confinement proves finite total variation for almost every path, and applying it in each $U$ gives (4.15). Each path has length at least $d_0$, so $Lambda eq.not 0$. Covering a planar null set by rational boxes of arbitrarily small total area, and increasing over finite subunions, proves $Lambda lt.double thin upright(d) z$. This proves the edge version of the flow argument in #cite(label("C")) Section 8. ◻
]

The preceding lemma may be applied sample by sample on a positive-probability event of a joint extraction. One first restricts to finite bounds for the confinement and traffic and retains the path laws along the tight subsequence. These laws serve to witness events in the local EL arrays; the conditional kernels of Section 3 are not conditioned on a path law.

=== 4.4 A primal–dual obstruction to degeneration <a-primaldual-obstruction-to-degeneration>

#prodef([Proposition 4.5.])[
  (Positive raw crossing quantiles).  #emph[For either choice of network in the power-scale construction, 
$ liminf_(j arrow.r oo) rho_j > 0 . $

 The lower bound is deterministic.]
] <prop:edge-quantiles>

#proof[
  Continue the record-low assumption (4.9). Choose the joint extraction used above to retain, in addition, the duration-one spheres with $n_k = m_k \/ 2$, their rooted dual experiments, the matching ordinary reference packages for the two sphere marginals, and the cone packages witnessing the quantile events for each reference marginal. Propositions 6 and 7 provide these matched packages, and Lemma 3 couples the two sphere marginals on the same physical maps with the same edge count. The high-unit and budget arguments above apply to each reference marginal. We carry out the germ argument below in each one, using its own conditional kernel for both its cone transfer and its later sphere transfer; the notation first describes one such matched pair.
  Retain also the low-event indicators in (4.8). Their limiting event has positive probability. On that event the discrete indicators equal $1$ eventually. Since $rho_(j_k) arrow.r 0$, the default value $Z_(j_k) = 1$ cannot satisfy the low inequality for large $k$. Lemma 10 then gives near-minimum path laws for the middle family, and trimming between the narrower bands gives squared traffic at most $C rho_(j_k)$, endpoint separation at least $d_0$, and compact confinement. A finite outer cell cover can admit every trimmed path while keeping these two geometric properties, with strict margins. Its finite path family contains the trimmed laws for all large $k$, so its EL divided by $rho_(j_k)$ is bounded by a fixed finite constant. Let $sans(A)_(upright("out"))^alpha$ be the local activation event that $alpha$ is such an outer cover with the stated strict margins. Thus the low indicator witnesses the local event
  #[#set math.equation(numbering: n => "(4.17)")
   $ cal(G)_(upright("low")) = union.big_alpha med union.big_(M gt.eq 1) #scale(x: 120%, y: 120%)[\(] sans(A)_(upright("out"))^alpha ∩ { Y_0^alpha < M } #scale(x: 120%, y: 120%)[\)] . $ <eq:low-unit-event>]
  The union is countable and has positive probability in the cone restriction. By countability and compact exhaustion of activation, one instruction $alpha$, one finite $M$, and fixed compact confinement and positive endpoint separation can be selected on a positive-probability subevent. This is an event of the local input and its normalized numerical output. Local equivalence of the cone and ordinary field restrictions, with the common observation kernel, transfers this event with positive probability to its matching ordinary reference marginal. There the convergence $Y_0^alpha < M$ and exact reconstruction on activation give finite normalized EL at most $M + 1$ for all sufficiently large $k$. Lemma 10 supplies discrete path laws in this one local family with squared traffic at most $\( M + 2 \) rho_(j_k)$. These laws now live on the same ordinary extraction as the probability-one budgets of Lemma 12. Apply Lemma 13 on their common event to obtain a law $mu$ of nonconstant rectifiable paths and a nonzero measure $Lambda lt.double thin upright(d) z$.
  We describe the local event witnessed by their tangents. Let $v$ be a unit direction and $v^perp$ its quarter-turn. For $z in bb(C)$ and $s > 0$, set
  $ Q_v \( z \, s \) = { z + t v + u v^perp : \| \| t < 3 s \/ 2 \, med \| \| u < s \/ 16 } . $
  A strict crossing has a compact subroute in $Q_v \( z \, s \)$, from the portion with $t < - s$ to the portion with $t > s$, with its two vertex ports and all buffered confinement described by intermediate cells. For an instruction $alpha$ of this kind, write $Y^alpha = Y_0^alpha$ for the limiting EL of its path family divided by $rho_(j_k)$. Define
  #[#set math.equation(numbering: n => "(4.18)")
   $ E_v \( z \) = union.big_(ell_0 gt.eq 1) med ⋂_(ell gt.eq ell_0) med union.big_alpha med union.big_(M gt.eq 1) mat(delim: "{", alpha upright(" is activated as a strict crossing"); upright("with buffered support in ") Q_v \( z \, 2^(- ell) \) \, med Y^alpha < M) . $ <eq:crossing-germ>]
  The unions use the countable instruction list and integer $M$. Whether an instruction fits the displayed open tube is a measurable condition on its limiting local input. Thus $E_v \( z \)$ is jointly measurable. Deleting finitely many radii leaves it unchanged, and all supports shrink to $z$. Its indicator is therefore a germ in Lemma 9. The finite bound $M$ may depend on the radius.
  At arclength-almost every interior visit of almost every path of $mu$, arclength parameterization is differentiable with a unit tangent. Choose a direction from a fixed finite sufficiently fine net so that it lies within the angular slack of this tangent. Differentiability gives a strict crossing of $Q_v \( z \, s \)$ at every sufficiently small $s$. Almost every path belongs to the support of $mu$. For each one of these fixed strict crossings, choose a smaller compact subroute with additional margin. Choose nested open vertex ports $P_plus.minus^(upright("in")) subset.double P_plus.minus^(upright("out"))$ around its two ends and nested confinements $W^(upright("in")) subset.double W^(upright("out")) subset.double Q_v \( z \, s \)$ around the subroute; the outer ports still lie beyond the two longitudinal levels. Cover the full preimages of the inner sets by cells lying in the outer sets. This gives one activated outer instruction. An open neighborhood $cal(O)$ of the path can require the corresponding subroute to visit the inner ports and remain in the inner confinement. Full-preimage reconstruction and the vanishing mesh then imply that, for all large $k$, every discrete path with projection in $cal(O)$ has a trimmed vertex subroute admitted by this fixed instruction. Since the path is in the support, $mu \( cal(O) \) > 0$. Weak convergence gives mass at least $p > 0$ in $cal(O)$ for all sufficiently large $k$. Restricting and normalizing that mass, and trimming its paths, bounds traffic coordinatewise by $tau_(mu_k) \/ p$. Its squared traffic is at most $C_0 rho_(j_k) \/ p^2$. Lemma 10 proves $Y^alpha < oo$ for this radius. This proves $E_v \( z \)$ at $Lambda$-almost every such visit for some direction in the finite net.
  Since $Lambda$ is nonzero and absolutely continuous, on the positive-probability flow event at least one of these finitely many directions satisfies $E_v$ on a set of positive planar area. Take here the library of all finite intrinsic instructions and its common refinements. Translation by $a$ carries the fitting condition for $E_v \( z \)$ to that for $E_v \( z + a \)$; rotation by $R$ carries it to that for $E_(R v) \( R z \)$. The same intrinsic instructions describe the transformed cells, and their edge counts and normalized outputs are unchanged. The buffered supports transform with them. These actions are therefore exact on the local arrays, while the corresponding ordinary field laws are locally equivalent as in Lemma 9. That lemma therefore makes the indicator for each direction one deterministic constant almost everywhere on an ordinary connected chart. The positive-area event forces the constant for one direction to be $1$. Rotational covariance then gives constant $1$ for every member of a chosen countable dense direction list. Countable intersection and an ordinary chart exhaustion show that, almost surely,
  #[#set math.equation(numbering: n => "(4.19)")
   $ E_v \( z \) upright(" holds for planar-area-almost every ") z upright(" and every direction ") v upright(" in this list") . $ <eq:ubiquitous-edge-germs>]
  This assertion has so far been proved for the one network fixed at the start of the power-scale construction.
  We use the sphere components retained in this joint extraction to obtain a transverse obstruction. For a rational compact disk $K$ in a buffered ordinary patch and a direction in the countable list, failure is the measurable event
  $ {integral_K #scale(x: 120%, y: 120%)[\(] 1 - upright(bold(1))_(E_v \( z \)) #scale(x: 120%, y: 120%)[\)] thin upright(d) z > 0} . $
  Deleting a common finite number of radii for $z in K$ computes the tail in (4.18) using only supports inside this patch. The failure event is therefore measurable from the local input and the activated array of normalized EL observations in Proposition 7, and it is null by (4.19) in each matching reference marginal, with that marginal’s own conditional kernel. Proposition 7 transfers the event to the corresponding sphere marginal, with the same denominator $rho_(j_k)$, actual height, and traversal order. Auxiliary mark pairs exhaust the patches off the exploration root.
  The two retained sphere experiments have the same law and the same number of letters per unit. The chosen network in their two marginals gives the two opposite physical networks. The transferred conclusions hold for both simultaneously. Their flag surfaces are identified, and the same three fresh flag-area marks give one canonical coordinate after composing one coordinate with conjugation if its orientation convention requires this. Let $H_k^(+)$ and $H_k^(-)$ be the two reference homeomorphisms. The canonical comparison in Proposition 5, from #cite(label("C")) Theorem 8.8, permits a further extraction on which their changes to the common canonical coordinate converge uniformly to maps $F^(+)$ and $F^(-)$, each conformal or anticonformal.
  Choose a point $w$ in a canonical coordinate plane away from the finitely many omitted marks and poles, at which the two transported versions of (4.19) hold. Such points have full planar area: the limiting conformal and anticonformal maps are smooth local diffeomorphisms and preserve area-null sets. Let $z^plus.minus = \( F^plus.minus \)^(- 1) \( w \)$. Choose directions from the two dense lists whose images under $D F^plus.minus \( z^plus.minus \)$ are respectively horizontal and vertical to a sufficiently small angular error. Write $b_plus.minus > 0$ for the scale factors of these similarity or anti-similarity derivatives. The two germs allow all sufficiently small dyadic radii. We may choose such radii $s_plus.minus$ with
  $ 1 lt.eq frac(max { b_(+) s_(+) \, b_(-) s_(-) }, min { b_(+) s_(+) \, b_(-) s_(-) }) lt.eq 2 . $
  They may also be chosen small enough that, for a prescribed small $epsilon_(upright("lin")) > 0$, each limiting coordinate change satisfies
  $ sup_(\| zeta - z^plus.minus \| lt.eq 2 s_plus.minus) \| F^plus.minus \( zeta \) - F^plus.minus \( z^plus.minus \) - D F^plus.minus \( z^plus.minus \) \( zeta - z^plus.minus \) \| lt.eq epsilon_(upright("lin")) b_plus.minus s_plus.minus . $
  Put $s_(*) = min { b_(+) s_(+) \, b_(-) s_(-) }$. If the angular error is $delta$, the transverse deviation of either transformed tube is at most
  $ 2 s_(*) #scale(x: 120%, y: 120%)[\(] 1 \/ 16 + \( 3 \/ 2 \) sin delta + epsilon_(upright("lin")) #scale(x: 120%, y: 120%)[\)] \, $
  and its endpoint advance in its longitudinal direction is at least $s_(*) \( cos delta - sin delta \/ 16 - epsilon_(upright("lin")) \)$. Choose $delta \, epsilon_(upright("lin"))$ so that the first bound is less than $s_(*) \/ 4$ and the second exceeds $0.8 s_(*)$. Thus, in coordinates centered at $w$, every path in the first transformed family stays in ${ \| \| y < s_(*) \/ 4 }$ and reaches both $x < - 0.8 s_(*)$ and $x > 0.8 s_(*)$; every path in the second stays in ${ \| \| x < s_(*) \/ 4 }$ and reaches both $y < - 0.8 s_(*)$ and $y > 0.8 s_(*)$. Any two such continuous paths intersect, by separation in the intervening rectangle. Fix these radii, activated covers, and their finite bounds from (4.18). Uniform convergence of the coordinate changes and the strict tube margins give the same forced intersection for every pair of discrete paths for all sufficiently large $k$.
  The two discrete EL values are at most $C_(+) rho_(j_k)$ and $C_(-) rho_(j_k)$, with finite constants because the tests have now been fixed. Choose near-minimum path laws by Lemma 10, and write their traffics on the paired physical edges as $tau_k \( e \)$ and $tau_k^(*) \( e^(*) \)$. Every pair of sampled paths intersects. By Lemma 3, a primal and a dual edge meet only when they are paired, so for every pair of walks $sum_e N_e \( pi \) N_(e^(*)) \( pi^(*) \) gt.eq 1$. Fix the full coupled record, the selected families, and both path laws, including their possible dependence on the continuum data, radii, and orientation sign. Take the product of these two fixed laws. Taking expectations under this pathwise product and applying Cauchy–Schwarz gives
  $ 1 lt.eq sum_e tau_k \( e \) tau_k^(*) \( e^(*) \) lt.eq (sum_e tau_k \( e \)^2)^(1 \/ 2) (sum_e tau_k^(*) \( e^(*) \)^2)^(1 \/ 2) lt.eq sqrt(C_(+) C_(-)) thin rho_(j_k) arrow.r 0 . $
  This is impossible. It excludes the record-low extraction for the chosen network, and the same argument applies when the initial choice is exchanged. Since each quantile sequence is deterministic, each positive lower limit is deterministic. ◻
]

=== 4.5 Bounds at arbitrary units and their consequences <bounds-at-arbitrary-units-and-their-consequences>

#proof[
  Let $m_k arrow.r oo$ be any sequence of letters per time unit. Write
  $ m_k = 4^(j_k) v_k \, #h(2em) 1 lt.eq v_k < 4 \, $
  and pass further so that $v_k arrow.r v in \[ 1 \, 4 \]$, jointly with all fixed backward rows. Proposition 14 makes the high barriers uniformly positive in raw EL units in those power rows. Equation (3.9) expresses the same incidence record in the $m_k$ units: the area clock is divided by $v_k$, frontier heights by $sqrt(v_k)$, and the real field is shifted by $- gamma^(- 1) log v_k$. A backward row $4^(j_k - i)$ has relative label $v_k^(- 1) 4^(- i)$. Thus the aligned theorem has multiplier $M = v^(- 1)$ in the limit. The normalized field identity is, explicitly,
  $ #scale(x: 120%, y: 120%)[\(] h - gamma^(- 1) log v #scale(x: 120%, y: 120%)[\)] \( c + r u \) + Q log r - gamma^(- 1) log \( v^(- 1) 4^(- i) \) = h \( c + r u \) + Q log r + i gamma^(- 1) log 4 . $
  The raw EL is unchanged. Strict margins allow the converging ratios and the rounded units to be retained in the indexed arrays. The bounded constant shifts have uniformly bounded cutoff Cameron–Martin norms on the field buffers, as used when choosing $epsilon$ above. Therefore the same high unit-reference probability applies before annular alignment. This is the field and unit change of #cite(label("C")) Proposition 5.12; it re-expresses one raw array and does not compare differently indexed kernels at an unchanged field.
  Apply the aligned theorem again and repeat Lemma 12, now with a fixed positive raw barrier, so that the denominator in (4.12) is $1$. For a fixed annular template, choose slightly inset ports between $a_2 r$ and $a_3 r$, and an outer cell confinement inside $W$. It catches a subwalk of every member of $cal(A)_m \( z \, r \; upright(bold(a)) \)$. Cover that confinement by a finite rational box union $U$ of area at most $C_(upright(bold(a))) r^2$. Every caught subwalk has projected diameter at least $c_(upright(bold(a))) r$. On the probability-one aligned event choose a successful, fixed $N$ large enough that $C R_N < c_(upright(bold(a))) r \/ 4$ and $"Area" \( U^(+ C R_N) \) lt.eq C_(upright(bold(a))) r^2$. For this fixed configuration, all sufficiently large discrete indices have a density charging every such subwalk by at least $c'_(upright(bold(a))) r$, with squared norm at most $C'_(upright(bold(a))) r^2$. Equation (4.1) and the subwalk property give
  $ "EL" #scale(x: 120%, y: 120%)[\(] cal(A)_m \( z \, r \; upright(bold(a)) \) #scale(x: 120%, y: 120%)[\)] gt.eq frac(\( c'_(upright(bold(a))) r \)^2, C'_(upright(bold(a))) r^2) = c''_(upright(bold(a))) > 0 . $
  The constants are deterministic. The choice of a successful $N$ may depend on the activated sample and the fixed radius, but it is fixed before the discrete limit. Narrow collars are included by choosing their positive relative gaps first.
  The passage to $v_k arrow.r v$ preserves the quantifier over representation extractions. Start with any such extraction and retain its existing compactified local annular output limits, together with their activation inputs, in the further extraction above. Their marginal law is preserved. If an activated limit failed a fixed slack version of the deterministic lower bound with positive probability, the same failure would have positive probability in the further extraction, contradicting the bound just proved. Thus every original limiting output has that lower bound on activation. Choosing a strictly smaller deterministic constant and using compactified convergence gives the eventual finite inequality in the original representation. A countable intersection treats the chosen library; the index at which an inequality starts can still depend on its sample and its fixed test.
  The local lower tests in this argument are finite incidence observations with the band inclusions (4.7). Proposition 7 transfers their probability-one limiting bounds to sphere patches, and convergence of the compactified observations gives the eventual finite inequalities with a fixed slack. A finite family of ordinary patches also treats a collar surrounding an isolated omitted point: choose inner patches with a Lebesgue number comparable to the radius and larger patches still avoiding the point. A through walk has a subinterval of diameter comparable to the radius in one of the larger patches. Summing the finitely many corresponding densities charges all through walks with the same kind of shape bound. The number and relative geometry of these patches can be fixed from the collar ratios. The protected enclosure of Proposition 5 keeps the resulting separation in the original surface. This proves part (i), including its stated sphere uses.
  We turn this estimate into part (ii). Fix relative radii
  $ a < beta_0 < beta_1 < dots.h.c < beta_5 < b . $
  In the protected finite graph containing the complete stars over $overline(B) \( z \, b r \)$ and its disk buffer, set
  $ A_m = { v : Psi_m \( v \) in overline(B) \( z \, beta_1 r \) } \, #h(2em) B_m = { v : Psi_m \( v \) in.not B \( z \, beta_4 r \) } . $
  Part (i) for the template $\( beta_0 \, dots.h \, beta_5 \)$ supplies a density $g$, normalized to charge its annular family by at least $1$, with $lr(bar.v.double  bar.v.double) g_2^2 lt.eq C$. Extend it by zero outside its confined edges. Its support lies compactly in $A \( z \; a r \, b r \)$. Once the mesh is small, every walk from $A_m$ to $B_m$ contains a subwalk of this annular family and therefore has $g$-length at least $1$. On the buffered graph define
  $ u_m \( v \) = 1 - min { 1 \, d_g \( A_m \, v \) } \, $
  where $d_g = oo$ on components not meeting $A_m$. The function is $1$ on $A_m$ and $0$ on $B_m$. As in Lemma 10, $\| d_e u_m \| lt.eq g_e$, so $cal(E)^0 \( u_m \) lt.eq lr(bar.v.double  bar.v.double) g_2^2$. Moreover $u_m$ is constant across every edge on which $g_e = 0$. The vanishing complete-star mesh and the gaps $a < beta_1$, $beta_4 < b$ put every vertex whose projected star meets $overline(B) \( z \, a r \)$ in $A_m$, and every vertex whose projected star meets the exterior of $B \( z \, b r \)$ in $B_m$. The support of the differences remains inside the stated compact subannulus. For a protected use, extend the constants across the interior and exterior. Full stars are retained throughout the collar, and any path from one side to the other contains the tested passage; hence no omitted incident edge introduces a new difference in this extension.
  For part (iii), take the cutoff from part (ii) in the dual network, with all its nonzero differences in a compact subcollar of $A \( z \; b r \, c r \)$. Its inner constant region contains every face meeting $overline(B) \( z \, a r \)$, and its outer constant region contains every face on the other side of the collar. Choose the subcollar with an additional fixed margin to both boundary circles. A paired primal and dual edge lie in their common flags, whose projected diameters tend to zero by Proposition 5; the complete primal and dual star mesh has the same property. Thus each primal edge paired with a nonzero dual difference lies, for all large indices, in a slightly larger compact subcollar of $A \( z \; b r \, c r \)$. Choose $t$ uniformly from $\( 0 \, 1 \)$. For all $t$ except the finitely many vertex values, retain each primal edge whose two incident dual values are on opposite sides of $t$, and orient it along the boundary of the face on the $u_m > t$ side. Cyclic incidence at a primal vertex balances incoming and outgoing edges, so these edges form closed walks. A transverse arc from the inner region to the outer one has total signed transition count of absolute value $1$. The closed walks therefore have nonzero total separating winding. Splitting at repeated vertices gives simple circuits, at least one of which surrounds the inner disk. All its edges remain in the subcollar. This reasoning also includes a primal loop and two parallel edges forming a Jordan curve; a primal bridge has a dual loop and cannot be a transition edge.
  Choose one surrounding circuit by any fixed rule on the finite record. An edge can be chosen only when $t$ lies between its two dual values. Consequently
  $ bb(P) \( e in Gamma_m \) lt.eq \| d_(e^(*)) u_m \| \, #h(2em) sum_e bb(P) \( e in Gamma_m \)^2 lt.eq sum_(e^(*)) \( d_(e^(*)) u_m \)^2 lt.eq C . $
  The full face stars and the two constant margins used here are part of the protection; they ensure a closed separating boundary rather than a boundary cut off by the edge of a chart. Exchanging the two networks proves the circuit assertion in either one.
  Finally, take the route in part (iv). Its compactness gives positive clearance from $W^c$, and its endpoints have positive clearance inside the two ports. Choose a sufficiently small common radius $r_0$. Starting at the first endpoint, choose successive centers at the first points of the route at Euclidean distance $r_0$ from the preceding center. This terminates after finitely many steps because the polygonal route has finite length. When the remaining route stays within that distance, the last circle can already be chosen wholly inside the terminal port by the endpoint clearance. The first circle is wholly in the initial port, and all circles and their narrow collars lie compactly inside $W$.
  Use part (iii) for a circuit surrounding $B \( c \, 3 r_0 \/ 4 \)$ and lying in $A \( c \; 7 r_0 \/ 8 \, 9 r_0 \/ 8 \)$ at each center $c$. Consecutive centers have distance $r_0$. The two enclosed disks of radius $3 r_0 \/ 4$ overlap, whereas each has a point outside the other’s disk of radius $9 r_0 \/ 8$. Two disjoint Jordan curves would have disjoint or nested interiors, so every pair of consecutive circuits intersects. In one embedded network an intersection gives a common vertex or edge. The union of the sampled circuits is therefore connected from the first port to the last. Select a simple graph path in this union. If there are $J_(*)$ circuits and $tau_i \( e \) = bb(P) \( e in Gamma_i \)$, the path traffic is at most $sum_(i = 1)^(J_(*)) tau_i \( e \)$ on every edge. Hence
  $ cal(T) \( mu_m \) lt.eq lr(bar.v.double sum_(i = 1)^(J_(*)) tau_i bar.v.double)_2^2 lt.eq J_(*) sum_(i = 1)^(J_(*)) lr(bar.v.double tau_i bar.v.double)_2^2 lt.eq J_(*)^2 C . $
  The number $J_(*)$ and the collar shape depend only on the fixed route and its clearances and are preserved by a common dilation. This proves part (iv) and completes the theorem. ◻
]

== 5 Identification of the electrical energy <sec:conductivity>

We now identify the energy seen by functions that vary on a fixed spatial scale. This will determine the Green kernel in the next section. The argument uses the cutoffs and circuit flows of Theorem 11; its conclusion concerns locally uniform convergence of functions and does not yet assert convergence of closed forms on $L^2$.

We work on a joint representation extraction as in Proposition 5, enlarged by the numerical observations of Proposition 6. Write $m$ for the extracted time units; on a duration-one finite sphere $m = 2 n$. Fix an ordinary plane chart $D$ with an open buffer. The same notation will be used for the primal network and for the unit-conductance dual network. A protected finite graph containing every star needed in $D$ represents the network there. The conclusions are unchanged if this graph is enlarged, because every smaller fixed test eventually has all of its incidences in the protection.

Let $z_m \( v \)$ be the position of a network vertex in this chart. Choose a point $z_m \( e \)$ on each embedded edge. The maximum diameter of the stars meeting a compact subset of $D$ tends to zero. In particular, moving $z_m \( e \)$ to either endpoint changes its position by a quantity tending uniformly to zero. For an open $U subset D$, put

#[#set math.equation(numbering: n => "(5.1)")
 $ cal(E)_m \( w \; U \) = sum_(e : thin z_m \( e \) in U) \( d_e w \)^2 \, #h(2em) d_e w = w \( e^(+) \) - w \( e^(-) \) . $ <eq:local-network-energy>]

Each unoriented edge is counted once, with multiplicity; loop terms vanish. We write $cal(E)_m \( w \)$ for the energy on the whole retained graph. In the primal sphere this is the restriction of $cal(E)_n^0$ from Section 2. All choices of edge locations give the same interior limits below.

We shall repeatedly use the following precise consequence of Theorem 11. In every fixed circular collar with prescribed relative widths and room in $D$, there is a cutoff taking the values $1$ and $0$ on the two prescribed sides, with energy bounded by a constant depending only on those relative widths. There is also a probability law of simple surrounding circuits whose expected edge-count traffic $tau$ satisfies $sum_e tau \( e \)^2 lt.eq B$, with the same type of bound. The constants do not depend on the absolute radius. The index after which a bound holds may depend on the fixed collar and on the sample. Every use below fixes finitely many collars before letting $m$ tend to infinity.

=== 5.1 A relaxation for locally uniform convergence <a-relaxation-for-locally-uniform-convergence>

For $f in C \( U \)$, an open $V subset.double U$, and $epsilon > 0$, define

#[#set math.equation(numbering: n => "(5.2)")
 $ q_m \( f \, V \, epsilon \) = inf {cal(E)_m \( w \; V \) : \| w \( v \) - f \( z_m \( v \) \) \| lt.eq epsilon upright(" for every ") v upright(" with ") z_m \( v \) in V} . $ <eq:constrained-energy>]

Here $w$ is a real function on the protected graph. Values at all other vertices are free. For sufficiently large $m$, the buffer contains every endpoint and incidence needed by the energy in $V$. The empty vertex constraint is vacuous, and an infeasible finite constraint system has infimum $+ oo$. Define two open-set functionals by

#[#set math.equation(numbering: n => "(5.3)")
 $ cal(R)^(-) \( f \, U \) & = sup_(V subset.double U) med lim_(epsilon arrow.b 0) liminf_(m arrow.r oo) q_m \( f \, V \, epsilon \) \,\
cal(R)^(+) \( f \, U \) & = sup_(V subset.double U) med lim_(epsilon arrow.b 0) limsup_(m arrow.r oo) q_m \( f \, V \, epsilon \) . $ <eq:uniform-relaxations>]

The suprema are over open $V$ with compact closure. The tolerance limits exist by monotonicity. Taking inner domains is necessary because the membership of an edge near a specified boundary can change when its representative location is changed.

#prodef([Lemma 5.1.])[
  (Cell sandwich and recovery).  #emph[After a further joint extraction of countably many cell-constrained infima, $cal(R)^(-) = cal(R)^(+)$ for every continuous $f$ and every relatively compact open $U subset D$, simultaneously. Write $cal(R) \( f \, U \)$ for the common value. It has the following properties.]
  + #emph[If $w_m$ converges locally uniformly to $f$ on $U$, in the vertex positions $z_m$, then 
$ cal(R) \( f \, U \) lt.eq liminf_m cal(E)_m \( w_m \; U \) . $

]
  + #emph[If $V subset.double W subset.double U$ and $cal(R) \( f \, U \) < oo$, there are $w_m$ converging uniformly to $f$ on a neighborhood of $overline(W)$ such that 
$ limsup_m cal(E)_m \( w_m \; W \) lt.eq cal(R) \( f \, U \) . $

]
  + #emph[If $f_j in C \( U \)$ and $f_j arrow.r f$ uniformly on $W$, where $V subset.double W subset.double U$, then 
$ cal(R) \( f \, V \) lt.eq liminf_j cal(R) \( f_j \, W \) . $

]
  #emph[The functional is determined by the retained local numerical outputs on arbitrarily slightly larger domains. Two protected descriptions give the same functional on their common interior.]
] <lem:uniform-relaxation>

#proof[
  We first describe the numerical outputs. A fixed intrinsic cell instruction selects a finite set of counted edges from the exact incidence record. It also attaches a rational closed interval to each of finitely many cell labels. A vertex carrying several labels must satisfy all their intervals. Take the infimum of the sum of squared differences on the selected edges over all such vertex functions, and compactify its value by $s mapsto s \/ \( 1 + s \)$, with $+ oo mapsto 1$. This is a measurable function of a finite incidence record: the objective is a finite quadratic polynomial and the constraints are finitely many closed intervals. The list of intrinsic cell instructions and rational intervals is countable. Proposition 6 therefore retains their joint limits, including equality through a common union record on overlaps.
  Fix $V_0 subset.double V_1 subset.double U$ and $epsilon_0 > epsilon_1 > 0$. On the continuum activation event, cover the full preimage of $overline(V)_0$ by finitely many used cells whose closures lie over $V_1$; include the complete stars of their vertices and edges. Subdivide the cells so that the oscillation of $f$ on each image is smaller than a fixed fraction of $epsilon_0 - epsilon_1$. Rational intervals can then be chosen so that, for every represented vertex of that cell and all large $m$,
  #[#set math.equation(numbering: n => "(5.4)")
   $ \[ f \( z_m \( v \) \) - epsilon_1 \, f \( z_m \( v \) \) + epsilon_1 \] med subset med J_(upright("cell")) med subset med \[ f \( z_m \( v \) \) - epsilon_0 \, f \( z_m \( v \) \) + epsilon_0 \] . $ <eq:value-interval-sandwich>]
  The first inclusion holds for every label at a multiply labelled vertex, so these simultaneous demands are compatible. Full preimages, star mesh, and the strict margins ensure that the selected edge set contains every edge located in $V_0$ and contains only edges located in $V_1$. The constrained vertex set contains every vertex located in $V_0$ and contains only vertices located in $V_1$.
  Let $s_m$ be the resulting infimum. The eventual exact-incidence and activation conclusions of Proposition 6, followed by (5.4), give
  #[#set math.equation(numbering: n => "(5.5)")
   $ q_m \( f \, V_0 \, epsilon_0 \) lt.eq s_m lt.eq q_m \( f \, V_1 \, epsilon_1 \) #h(2em) upright("for all sufficiently large ") m . $ <eq:infimum-sandwich>]
  The observation $s_m$ was extracted before this activation was selected; activation only supplies its interpretation in the spatial chart. Its limit exists in $\[ 0 \, oo \]$. Although $f \, V_0 \, V_1$ were arbitrary, every instruction just used belongs to the one countable list. Uniform continuity of $f$ on the relevant compact sets and the separated tolerances are what allow that list to serve all continuous functions. More precisely, each instruction’s activation is defined from its local continuum cells and margins alone; it does not use $f$ or the value intervals. After $f$ is given we choose a suitable entry among the already activated countable entries. This is a pathwise use of their simultaneous conclusions, not a new conditioning event.
  It follows from (5.5) that
  $ limsup_m q_m \( f \, V_0 \, epsilon_0 \) lt.eq liminf_m q_m \( f \, V_1 \, epsilon_1 \) . $
  For each inner $V_0$ choose $V_1 subset.double U$, and choose $epsilon_1 < epsilon_0$. Taking the limits and suprema in (5.3) gives $cal(R)^(+) \( f \, U \) lt.eq cal(R)^(-) \( f \, U \)$. The opposite inequality is immediate. The same sandwich shows that an alternative edge-location convention or an overlapping protected record gives the same result.
  For (i), on each fixed $V subset.double U$ and at each positive tolerance, $w_m$ is eventually admissible in (5.2). Its energy on $V$ is at most its energy on $U$. Take the liminf, then the tolerance limit and the inner-domain supremum.
  For (ii), choose $W'$ with $W subset.double W' subset.double U$. For each fixed $epsilon > 0$, the limsup of $q_m \( f \, W' \, epsilon \)$ is at most $cal(R) \( f \, U \)$. Choose approximate minimizers and decrease $epsilon$ to zero sufficiently slowly with $m$. They converge uniformly on $W'$, and their energies on $W'$, hence on $W$, have the asserted limsup. This diagonal choice is made after the extracted sample has been fixed; no new conditional law is asserted.
  Finally, for fixed $epsilon > 0$ and all sufficiently large $j$,
  $ q_m \( f \, V' \, epsilon \) lt.eq q_m \( f_j \, V' \, epsilon \/ 2 \) quad upright("whenever ") V' subset.double V \, $
  because $f_j arrow.r f$ uniformly on $W$. Taking the limsup in $m$ bounds the right side by $cal(R) \( f_j \, W \)$. Take the liminf in $j$, then the tolerance limit and the supremum over $V' subset.double V$. This is (iii). ◻
]

We will prove the following identification. The recovery assertion is stated with room in the domain because that is the form used when replacing harmonic voltages.

#prodef([Theorem 5.2.])[
  (Unit conductivity).  #emph[From every joint geometric extraction one can further extract the local numerical outputs so that the following holds almost surely. For the primal and the unit dual network, for every open $U$ compactly contained in an ordinary conformal chart, and every $f in C \( U \)$, 
#[#set math.equation(numbering: n => "(5.6)")
 $ cal(R) \( f \, U \) = integral_U \| nabla f \|^2 thin upright(d) x . $ <eq:unit-conductivity>]

 The right side is $+ oo$ if $f in.not H_(upright("loc"))^1 \( U \)$, and is allowed to be infinite otherwise. For relaxations obtained along extractions of finite spherical maps, the same identity holds in the common canonical coordinate on every coordinate domain; the integral is the unhalved conformal Dirichlet integral.]
  #emph[In particular, every sequence converging locally uniformly to $f$ has the lower energy bound of Lemma 15(i). For $V subset.double W subset.double U$ with finite right side in (5.6), there is a sequence of vertex functions $w_m$ converging uniformly to $f$ on a neighborhood of $overline(W)$, with limsup energy on $W$ at most that right side. The coefficient in (5.6) is the same for all extractions.]
] <thm:conductivity>

=== 5.2 The local quadratic energy <the-local-quadratic-energy>

We first establish the deterministic structure of $cal(R)$. The cutoffs in Theorem 11 make it possible to combine two uniform recoveries without a fixed loss in their energy.

#prodef([Lemma 5.3.])[
  (Gluing and energy measures).  #emph[Suppose $f in C \( U \)$ and $cal(R) \( f \, V \) < oo$ for every $V subset.double U$. The values $V mapsto cal(R) \( f \, V \)$ are the open-set values of a Radon measure $Gamma_f$ on $U$. These measures are local: if $f = g$ on an open set, their restrictions there agree. They are invariant under addition of constants. For locally finite values they satisfy 
#[#set math.equation(numbering: n => "(5.7)")
 $ Gamma_(f + g) + Gamma_(f - g) = 2 Gamma_f + 2 Gamma_g \, #h(2em) Gamma_(a f) = a^2 Gamma_f quad \( a in bb(R) \) . $ <eq:measure-parallelogram>]

 Consequently 
$ Gamma \( f \, g \) = 1 / 4 \( Gamma_(f + g) - Gamma_(f - g) \) $

 is a symmetric bilinear signed Radon measure. For every relatively compact Borel set $E$, 
#[#set math.equation(numbering: n => "(5.8)")
 $ \| Gamma \( f \, g \) \( E \) \|^2 lt.eq Gamma_f \( E \) Gamma_g \( E \) . $ <eq:measure-cauchy-schwarz>]

]
] <lem:energy-measures>

#proof[
  Here is the gluing estimate, including the localization it needs. Let a compact set be covered by finitely many open recovery regions $U_1 \, dots.h \, U_h$, with all closures and supports kept inside a larger protected chart. Choose finitely many smaller disks covering the compact set, each with a fixed enlargement in one $U_i$. The disk cutoffs from Theorem 11, followed by finite maxima, give functions $eta_i in \[ 0 \, 1 \]$ supported with room in $U_i$, with $sum_i eta_i gt.eq 1$ on a neighborhood of the compact set and with bounded energies. Dividing by their sum there gives weights $theta_i gt.eq 0$ with $sum_i theta_i = 1$. Outside that neighborhood one can divide by $max { sum_i eta_i \, 1 \/ 2 }$. On the bounded range of these functions this operation is Lipschitz, so the energies of the $theta_i$ are bounded by a fixed multiple of $sum_i cal(E)_m \( eta_i \)$.
  Let $w_(i \, m)$ approach $f$ uniformly in the regions where $theta_i$ is used, with common error $delta_m arrow.r 0$, and set $w_m = sum_i theta_i w_(i \, m)$ near the compact set. For a counted edge $e = \( x \, y \)$ there, its endpoints lie in this neighborhood for large $m$. Using $sum_i d_e theta_i = 0$, we have
  #[#set math.equation(numbering: n => "(5.9)")
   $ d_e w_m = sum_i theta_i \( y \) d_e w_(i \, m) + sum_i #scale(x: 120%, y: 120%)[\(] w_(i \, m) \( x \) - f \( z_m \( x \) \) #scale(x: 120%, y: 120%)[\)] d_e theta_i . $ <eq:edge-gluing>]
  Jensen’s inequality bounds the squared first term by $sum_i theta_i \( y \) \( d_e w_(i \, m) \)^2$. The sum over edges of the square of the second term is at most
  $ h delta_m^2 sum_i cal(E)_m \( theta_i \) = o \( 1 \) . $
  The cross term tends to zero by Cauchy–Schwarz whenever the energies of the recoveries are bounded. The support room and vanishing star mesh ensure that every edge with a nonzero $i$-term belongs to the region where the $i$-th recovery was estimated. Thus gluing costs at most the sum of the recovery energies plus $o \( 1 \)$.
  Monotonicity of $cal(R) \( f \, dot.op \)$ is immediate, and its definition gives inner regularity:
  $ cal(R) \( f \, O \) = sup_(V subset.double O) cal(R) \( f \, V \) . $
  For disjoint opens $O_1 \, O_2$, use compactly contained test domains in each. The counted edge sets are disjoint, and the infimum with all the constraints is at least the sum of the separate infima. The liminf and inner-domain limits give $cal(R) \( f \, O_1 union O_2 \) gt.eq cal(R) \( f \, O_1 \) + cal(R) \( f \, O_2 \)$.
  For subadditivity, fix a compactly contained test domain in $O_1 union O_2$. Cover its closure by inset regions of $O_1 \, O_2$, recover $f$ there using Lemma 15(ii), and apply (5.9). The glued functions converge uniformly on the test domain, so Lemma 15(i) bounds its relaxation by $cal(R) \( f \, O_1 \) + cal(R) \( f \, O_2 \)$. Taking the inner supremum proves subadditivity. The construction with finitely many weights proves the corresponding finite-cover statement. A compact subset of a countable open union has a finite subcover, so inner regularity then gives countable subadditivity.
  For clarity, these open-set facts give the asserted measure as follows. For $A subset U$, take the infimum of $cal(R) \( f \, O \)$ over open $O supset A$. Countable subadditivity makes this an outer measure. If two sets have positive distance, disjoint open neighborhoods and open-set superadditivity give the reverse additive inequality. It is therefore a metric outer measure, whose Borel restriction is a measure. Its values on opens are $cal(R) \( f \, O \)$ by monotonicity, and inner regularity and local finiteness make it Radon. This is the usual open-set measure construction.
  The constraints in an inner domain depend only on $f$ there; this proves locality. Adding a constant to all vertex values proves invariance under constants. Also
  $ q_m \( a f \, V \, epsilon \) = a^2 q_m \( f \, V \, epsilon \/ \| \| a \) quad \( a eq.not 0 \) \, $
  which proves homogeneity after relaxation.
  To prove the parallelogram identity, first recover $f$ and $g$ on a common smaller domain. Their sums and differences converge uniformly to $f + g$ and $f - g$, and the exact edge identity gives
  $ cal(E)_m \( w_m + tilde(w)_m \; V \) + cal(E)_m \( w_m - tilde(w)_m \; V \) = 2 cal(E)_m \( w_m \; V \) + 2 cal(E)_m \( tilde(w)_m \; V \) . $
  Apply the two lower bounds on $V$, the recovery upper bounds on a slightly larger domain, and then exhaust the original open set. This gives $Gamma_(f + g) + Gamma_(f - g) lt.eq 2 Gamma_f + 2 Gamma_g$ on opens and also proves local finiteness of the sums. Recover $f + g$ and $f - g$ instead, and take their half-sum and half-difference. The same displayed identity gives the reverse inequality. Equality on opens is equality of Radon measures. Polarization and homogeneity now give real bilinearity. Finally, positivity of $Gamma_(f + t g) \( E \) = Gamma_f \( E \) + 2 t Gamma \( f \, g \) \( E \) + t^2 Gamma_g \( E \)$ for every real $t$ gives (5.8). ◻
]

We record one consequence of the proof. If a recovery $w_m$ approaches a function equal to a constant $c$ on an open set $O$, and $K subset.double O$, it can be made exactly $c$ near $K$ at a cost $o \( 1 \)$ in energy. Indeed, take a bounded-energy cutoff $theta_m$ equal to one near $K$ and zero outside $O$, and replace $w_m$ by $\( 1 - theta_m \) w_m + theta_m c$. The error term in (5.9) is bounded by the uniform error on $O$ times the cutoff gradient. This modification is unchanged outside $O$. We will use it on the constant side strips of a square.

#prodef([Lemma 5.4.])[
  (Local Sobolev comparison).  #emph[For every $D_0 subset.double D$ there are deterministic constants $0 < c_(D_0) lt.eq C_(D_0) < oo$ such that, for every open $U subset.double D_0$, 
#[#set math.equation(numbering: n => "(5.10)")
 $ c_(D_0) integral_U \| nabla f \|^2 thin upright(d) x lt.eq cal(R) \( f \, U \) lt.eq C_(D_0) integral_U \| nabla f \|^2 thin upright(d) x . $ <eq:energy-comparison>]

 For a continuous $f$ outside $H_(upright("loc"))^1 \( U \)$, the lower integral is interpreted as $+ oo$. The upper bound first holds for smooth $f$, and holds also for $f in C \( U \) ∩ H_(upright("loc"))^1 \( U \)$. Local finiteness of $cal(R) \( f \, dot.op \)$ for a continuous $f$ implies $f in H_(upright("loc"))^1 \( U \)$. The inequalities also hold as inequalities of measures on every subopen of $D_0$.]
] <lem:energy-bounds>

#proof[
  For the upper bound, fix $V subset.double U$ and a square grid of small fixed spacing $r$. Cover a neighborhood of $overline(V)$ by disks of radius comparable to $r$, centered at grid points, with fixed enlargements contained in $U$. Construct a cutoff partition $\( theta_(i \, m) \)$ as in the proof of Lemma 17, and put
  $ w_(m \, r) \( v \) = sum_i f \( x_i \) theta_(i \, m) \( v \) \, $
  where $x_i$ is the center of the $i$-th disk. At a vertex in $V$, all contributing centers are at distance $O \( r \)$, so $w_(m \, r)$ differs from $f$ by at most its modulus of continuity at $O \( r \)$.
  For an edge in this region, subtract from the coefficients $f \( x_i \)$ the value at one contributing center. The sum of the differences of the partition weights is zero. At most a fixed number of weights contribute, and each coefficient difference is at most $C r sup_(B'_i) \| nabla f \|$ on a fixed enlargement $B'_i$. The cutoff energies and their normalization are bounded independently of $r$. Summing the squared edge differences gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ cal(E)_m \( w_(m \, r) \; V \) lt.eq C sum_(i : thin B'_i ∩ V eq.not diameter) r^2 sup_(B'_i) \| nabla f \|^2 #h(2em) upright("for all sufficiently large ") m . $ <eq:partition-energy>]
  The bounded overlap includes all endpoint margins. For smooth $f$, first let $m$ tend to infinity with $r$ fixed. Then let $r$ decrease to zero. The right side is bounded by the corresponding Riemann estimate on any fixed intermediate open set between $V$ and $U$, and hence by $C integral_U \| nabla f \|^2$. The uniform errors tend to zero. The definition of $cal(R)$ and inner exhaustion prove the upper bound.
  For the lower bound, let $w_m arrow.r f$ locally uniformly on $U$, and pass to a subsequence on which $cal(E)_m \( w_m \; U \)$ tends to its finite liminf $L$. At grid spacing $r$, use at each grid point $x_i$ a circular collar
  $ alpha r < \| x - x_i \| < beta r \, #h(2em) 1 / 2 < alpha < beta < 1 \, $
  with fixed inner and outer margins; for example one can take $alpha = 0.7$ and $beta = 0.8$. Restrict to grid cells in an inner part of $U$, so every buffered collar lies in $U$. A surrounding circuit contains the inner disk in its Jordan interior and has that interior inside the outer disk. For neighboring grid points the inner disks overlap, while each center is outside the other’s outer disk. Thus two such circuits must intersect: otherwise their overlapping interiors would be nested, contrary to the center exclusion. Circuits in the same embedded network intersect at a graph vertex.
  Let $E_(i \, m)$ be the energy of $w_m$ in the buffered $i$-th collar. If $tau_i$ is the expected counting traffic of its circuit law, then
  $ bb(E) #h(-0.16667em) [sum_(e in gamma_i) \| d_e w_m \|] = sum_e tau_i \( e \) \| d_e w_m \| lt.eq sqrt(B E_(i \, m)) . $
  Choose one circuit satisfying this bound and assign any one of its vertex values $a_(i \, m)$ to $x_i$. At a common vertex of two neighboring circuits,
  $ \| a_(i \, m) - a_(j \, m) \|^2 lt.eq 2 B \( E_(i \, m) + E_(j \, m) \) . $
  Every grid point has at most four neighbors. The enlarged collars have a fixed overlap multiplicity $M$, including the edge-location margins for all large $m$ at this fixed $r$. Hence
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_(i tilde.op j) \| a_(i \, m) - a_(j \, m) \|^2 lt.eq 8 B sum_i E_(i \, m) lt.eq 8 B M thin cal(E)_m \( w_m \; U \) . $ <eq:grid-energy-bound>]
  The piecewise affine interpolation on a triangulation of the grid has Dirichlet integral bounded by a fixed multiple of the left side. Moreover
  $ \| a_(i \, m) - f \( x_i \) \| lt.eq omega_f \( C r \) + o_m \( 1 \) $
  on each fixed compact part of $U$, where $omega_f$ is the local modulus of continuity. With $r$ fixed, take a subsequence of the finitely many grid values and let $m$ tend to infinity in (5.12). Then refine $r$. The interpolants converge uniformly to $f$ on inner compact sets and have bounded Sobolev energy there. Weak compactness in $H^1$ and lower semicontinuity yield the weak gradient of $f$ and
  $ integral_V \| nabla f \|^2 thin upright(d) x lt.eq C L #h(2em) \( V subset.double U \) . $
  One may use a finite union of inner grid regions at each stage, with the same overlap bound. Exhausting $U$ gives the lower inequality for a uniformly convergent sequence.
  Apply that inequality to the recoveries in Lemma 15(ii), and exhaust their inner domains. It gives the lower bound in (5.10) and the assertion that locally finite relaxed energy supplies a local $H^1$ gradient.
  If $f in C \( U \) ∩ H_(upright("loc"))^1 \( U \)$, mollification on a buffered subdomain gives smooth $f_j$ converging uniformly and in $H^1$ on any smaller fixed region. After multiplication by a smooth cutoff equal to one on that smaller region, extend $f_j$ by zero to $U$; thus the inputs in the next step belong to $C \( U \)$. Use Lemma 15(iii) on $V subset.double W subset.double U$ and the smooth upper bound on $W$. It gives $cal(R) \( f \, V \) lt.eq C integral_W \| nabla f \|^2$. Choose such $W$ inside $U$ and exhaust $U$ by $V$. This proves the upper bound for continuous $H_(upright("loc"))^1$ functions. All estimates used the same constants on every subopen of the fixed ambient $D_0$, so Radon regularity gives the corresponding measure inequalities. ◻
]

The use of many grid scales in this proof is sequential: a grid and all of its collars are fixed before the network limit, and only then is the grid refined. This is why the fixed-test electrical theorem suffices here.

#prodef([Lemma 5.5.])[
  (Tensor representation and scalar form).  #emph[For each network, in each joint extraction there is a deterministic constant $k > 0$, possibly depending on the extraction and on the choice of primal or dual, such that in every ordinary chart 
#[#set math.equation(numbering: n => "(5.13)")
 $ cal(R) \( f \, U \) = k integral_U \| nabla f \|^2 thin upright(d) x #h(2em) \( f in C \( U \) ∩ H_(upright("loc"))^1 \( U \) \) . $ <eq:scalar-relaxation>]

 The formula is understood with infinite values on an exhaustion. The corresponding probability-one local assertion transfers to strict-interior sphere charts with the same constant and the same raw energy units.]
] <lem:energy-tensor>

#proof[
  Work first inside $D_0 subset.double D$. Polarize the energy measures of the coordinate functions $x_1 \, x_2$, and define
  $ A_(i j) \( x \) = frac(thin upright(d) Gamma \( x_i \, x_j \), thin upright(d) x) \( x \) . $
  The densities exist because the upper bound of Lemma 18 dominates the measures of $x_i + x_j$ and $x_i - x_j$ by Lebesgue measure. Bilinearity makes $A$ symmetric. For each $p in bb(Q)^2$,
  $ Gamma_(p dot.op x) = p^(sans(T)) A p thin thin upright(d) x \, #h(2em) c_(D_0) \| \| p^2 lt.eq p^(sans(T)) A \( x \) p lt.eq C_(D_0) \| \| p^2 quad upright("for almost every ") x . $
  Intersecting the exceptional sets for rational $p$ and using continuity in $p$ gives $c_(D_0) I lt.eq A lt.eq C_(D_0) I$ almost everywhere.
  Let $f in C \( U \) ∩ H_(upright("loc"))^1 \( U \)$ and write $Gamma_f = e_f thin thin upright(d) x$, as permitted by the upper bound. The measure Cauchy–Schwarz inequality has the corresponding density inequality; this follows by applying it on Borel sets and differentiating. For every rational $p$, outside a null set depending on $f \, p$,
  $ \| e_f - p^(sans(T)) A p \| & = lr(|frac(thin upright(d) Gamma \( f - p dot.op x \, f + p dot.op x \), thin upright(d) x)|)\
 & lt.eq sqrt(e_(f - p dot.op x) thin e_(f + p dot.op x)) lt.eq C_(D_0) \| nabla f - p \| \| nabla f + p \| . $
  Use one full-measure set for all rational $p$, and let $p$ approach $nabla f \( x \)$. We obtain
  #[#set math.equation(numbering: n => "(5.14)")
   $ cal(R) \( f \, U \) = integral_U nabla f^(sans(T)) A nabla f thin upright(d) x . $ <eq:tensor-relaxation>]
  The construction on smaller subdomains of this coordinate chart agrees on overlaps by locality, so these matrices form a measurable locally elliptic field.
  We next identify its randomness and coordinate dependence. At every Lebesgue point,
  #[#set math.equation(numbering: n => "(5.15)")
   $ A_(i j) \( z \) = lim_(r arrow.b 0) frac(Gamma \( x_i \, x_j \) \( B \( z \, r \) \), pi r^2) \, $ <eq:tensor-germ>]
  and it is enough to use a countable sequence of radii. Each open energy in the numerator is obtained from the cell infima in Lemma 15, on inner domains within that ball. Balls with arbitrary centers can themselves be exhausted by a countable base of rational open sets. Thus the density is jointly measurable in $z$ and the retained arrays, and is readable from arbitrarily small strict neighborhoods of $z$. No outside minimizer enters this reading: only endpoints of counted edges are used, and their full stars lie in the slightly larger protected neighborhood. The affine functions and their sums in (5.15) are among the continuous tests handled by the one countable cell library.
  We check the coordinate action required for this germ. Transporting an intrinsic cell instruction by a translation or a rotation only relabels its spatial domains and the scalar value intervals in the same exact finite incidence record. The quadratic polynomial on its edges is unchanged. The inner-domain and tolerance sandwich therefore transports the open energy measures. A translation adds constants to the coordinate functions, while a rotation $x mapsto R x$ sends their gradient vectors by $R$; hence the density matrix is transported by $A mapsto R A R^(sans(T))$. On overlapping disks the union records of Proposition 6 give the common restriction of these measures. Thus the shrinking-ball reading has the translation and rotation actions, with common restrictions, required by Lemma 9.
  Apply Lemma 9 to bounded transforms of the three entries of $A$. It makes $A \( z \)$ deterministic for almost every deterministic $z$, and transports that value under the intrinsic affine coordinate changes. A translation changes each coordinate function by a constant, which leaves its energy measure unchanged. The deterministic matrix is consequently translation invariant almost everywhere, hence constant in the ordinary chart. Equivalently, invariance under the countable rational translations and mollification on smaller domains gives the same conclusion. A rotation conjugates this constant matrix by the rotation matrix. For a quarter-turn $R$, invariance reads $A = R A R^(sans(T))$. A real symmetric $2$-by-$2$ matrix with this property has equal diagonal entries and zero off-diagonal entries. Thus $A = k I$, with deterministic $k > 0$.
  The preceding assertion is a probability-one statement about activated local outputs and local continuum data. Proposition 7 transfers its null failure event from the ordinary input and the extended kernel to each strict-interior sphere patch at its actual field height, without changing the raw energy units. Its countable atlas and separate auxiliary area-pair marginals remove the auxiliary chart marks. This proves (5.13) in the sphere reference charts with the same deterministic constant. The argument is applied separately to the primal and dual outputs. We denote the resulting constants by $k_(upright(p))$ and $k_(upright(d))$. ◻
]

The last lemma determines the form of the energy. It remains to determine its coefficient. We first put both networks in the same coordinate, then use an exact finite planar identity.

=== 5.3 The common coordinate and planar duality <the-common-coordinate-and-planar-duality>

For the full finite sphere graph, define $q_m^(upright("can"))$ and $cal(R)_(upright("can"))^plus.minus$ by (5.2)–(5.3), using the canonical vertex and edge positions and using the full graph as the protected graph. Write $cal(R)_(upright("ref"))$ for the relaxation in a reference chart.

Let $T_m = phi.alt_n compose Psi_n^(- 1)$ be a comparison map from a reference sphere to the canonical coordinate. On the further extraction in Proposition 5, $T_m arrow.r T$ uniformly, with $T$ conformal or anticonformal. For fixed inner and outer domains, uniform convergence gives the required inclusions of their images for all large $m$. For a continuous $f$, it also gives $f compose T_m arrow.r f compose T$ uniformly on compact sets. Applying the domain and tolerance sandwich of Lemma 15 in both directions therefore proves

#[#set math.equation(numbering: n => "(5.16)")
 $ cal(R)_(upright("can")) \( f \, U \) = cal(R)_(upright("ref")) \( f compose T \, T^(- 1) U \) . $ <eq:coordinate-relaxation>]

This argument uses only uniform convergence of $T_m$; it does not require convergence of their derivatives. The two-dimensional scalar Dirichlet integral is invariant under both conformal and anticonformal changes. Thus the constants in Lemma 19 are unchanged in the canonical coordinate.

We will also use the fixed cutoff and circuit tests in this coordinate. On a sufficiently small compact neighborhood, the smooth map $T$ sends suitable reference collars inside and outside any fixed canonical round collar, with all relative widths in a fixed bounded range. Uniform convergence of $T_m$ and the strict room between these collars preserve their inclusions for all large $m$. The reference cutoffs and circuits from Theorem 11 therefore provide canonical cutoffs and circuits with the same type of bounds, independent of the absolute radius. Each collar and its room are fixed before the network limit; no simultaneous assertion at the mesh scale is used.

Use the dual rooted experiment of Lemma 3 in the same joint extraction. Its law, its number of edges, and its raw units are those of the original rooted experiment. Its primal scalar is therefore $k_(upright(p))$: both are deterministic marginal limits of the same local output laws on this subsequence. Its primal edges are the original dual edges in the same physical flag surface, with the same canonical marks. After identifying the flag surfaces, we evaluate both copies of this edge network through the original $phi.alt_n$, using the same physical edge representatives. By three-point normalization, the dual-rooted uniformization is either $phi.alt_n$ or $overline(phi.alt_n)$; in the latter case postcompose it with complex conjugation to use the chosen coordinate. Conjugation fixes $0 \, 1 \, oo$ and preserves the scalar Dirichlet integral. On any common ordinary interior, the two canonical relaxations of those edges are identical by their definition and (5.16). One reads $k_(upright(d))$ in the first experiment and $k_(upright(p))$ in the second. Consequently

#[#set math.equation(numbering: n => "(5.17)")
 $ k_(upright(p)) = k_(upright(d)) . $ <eq:equal-dual-scalars>]

Only the marginal probability-one conclusions are intersected here; no independence between the two experiments is required.

The remaining scalar calculation is the planar self-duality fixed-point method of Dykhne #cite(label("Dykhne1971")) Section 2. The preceding work supplies the existence, determinism, isotropy, and common-coordinate equality of the two scalar limits needed here. We now prove the complementary finite identity and justify its passage to those limits. For the finite reciprocity statement compare Binder and Pechersky #cite(label("BinderPechersky2025")) Remark 2.11; the following proof includes the contraction needed for our multigraph and boundary conventions.

#prodef([Lemma 5.6.])[
  (Complementary boundary conductances).  #emph[Let $G$ be a finite connected planar multigraph in a closed disk whose boundary is a simple cycle. Split that cycle into four nonempty edge paths $D_0 \, N_0 \, D_1 \, N_1$ in cyclic order, with four distinct joining vertices. Give every edge a conductance $c_e > 0$. Let 
$ C_(upright(p)) = min {sum_(e in E \( G \)) c_e \( d_e u \)^2 : u = 0 upright(" on ") D_0 \, quad u = 1 upright(" on ") D_1} . $

 The endpoints of each prescribed arc are included in its constraint.]
  #emph[Form a dual graph with one vertex for each interior face and two additional vertices $b_0 \, b_1$. Each interior edge has its usual dual, with conductance $c_e^(- 1)$. A boundary edge on $N_i$ has a dual edge from its interior face to $b_i$, with conductance $c_e^(- 1)$. Discard duals of boundary edges on $D_0 \, D_1$. Let $C_(upright(d))$ be the minimum dual energy with values $0 \, 1$ at $b_0 \, b_1$. Then 
#[#set math.equation(numbering: n => "(5.18)")
 $ C_(upright(p)) C_(upright(d)) = 1 . $ <eq:finite-duality>]

 The statement permits loops, parallel edges, and repeated face incidences.]
] <lem:mixed-duality>

#proof[
  Contract each prescribed arc to a vertex, denoted $t$ for value $0$ and $s$ for value $1$, and delete the contracted boundary edges. The two remaining boundary paths run from $s$ to $t$. Add one $s$-to-$t$ edge through the exterior, splitting the exterior into two faces adjacent to $N_0 \, N_1$. This is a connected map on the sphere.
  Let $u$ minimize the primal unit-voltage energy and let $I$ be its total current out of $s$. It is harmonic at every free vertex. Summation by parts gives
  $ sum_e c_e \( d_e u \)^2 = sum_v u \( v \) \( Q_c u \) \( v \) = I \, $
  so $C_(upright(p)) = I > 0$. Orient the original edges and put their signed currents $c_e$ times the corresponding voltage drops on them. Put the balancing current on the added exterior edge. The resulting flow has zero divergence at every vertex.
  A divergence-free flow on a spherical planar map is the gradient of a potential on its faces, with the dual orientation convention. To see this directly, integrate the flow across a dual path from a fixed face. Two choices of dual path differ by cuts enclosing vertices; the integral around each such cut is the sum of the divergences it encloses, hence zero. This defines a face potential $psi$, unique up to a constant. Its potential drop between the two exterior faces has magnitude $I$, because their separating dual edge crosses the added edge.
  On the dual of an original edge, multiplication of this face-potential difference by $c_e^(- 1)$ gives the corresponding primal voltage difference. These dual currents have zero divergence at an interior face: the primal voltage differences telescope around its boundary, including repeated incidences. At the two exterior faces their total currents have magnitude $1$, the voltage difference between $s$ and $t$ along either boundary path. Removing the dual of the added edge thus gives a dual current of magnitude $1$ at voltage drop $I$. Rescaling to unit dual voltage gives $C_(upright(d)) = 1 \/ I$.
  The contracted map has exactly the dual described in the statement. An interior chord whose endpoints were contracted together is a loop and has zero primal voltage drop; its dual carries zero current in this construction. A primal loop and a dual loop are handled by the same incidence and telescoping identities. Thus no simplicity beyond the boundary cycle was used. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0, 3.1), stroke: (paint: rgb("#000000"), thickness: 0.65pt, cap: "round", join: "round"))
  line((1, 0), (1, 3.1), stroke: (paint: rgb("#000000"), thickness: 0.65pt, cap: "round", join: "round"))
  line((2, 0), (2, 3.1), stroke: (paint: rgb("#000000"), thickness: 0.65pt, cap: "round", join: "round"))
  line((3, 0), (3, 3.1), stroke: (paint: rgb("#000000"), thickness: 0.65pt, cap: "round", join: "round"))
  line((0, 0), (3.1, 0), stroke: (paint: rgb("#000000"), thickness: 0.65pt, cap: "round", join: "round"))
  line((0, 1), (3.1, 1), stroke: (paint: rgb("#000000"), thickness: 0.65pt, cap: "round", join: "round"))
  line((0, 2), (3.1, 2), stroke: (paint: rgb("#000000"), thickness: 0.65pt, cap: "round", join: "round"))
  line((0, 3), (3.1, 3), stroke: (paint: rgb("#000000"), thickness: 0.65pt, cap: "round", join: "round"))
  line((0, 0), (0, 3.1), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt, cap: "round", join: "round"))
  line((3.1, 0), (3.1, 3.1), stroke: (paint: rgb("#0000a6"), thickness: 1.5pt, cap: "round", join: "round"))
  line((0.775, 0.775), (2.325, 0.775), stroke: (paint: rgb("#a60000"), thickness: 0.85pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((0.775, 2.325), (2.325, 2.325), stroke: (paint: rgb("#a60000"), thickness: 0.85pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((0.775, 0.775), (0.775, 2.325), stroke: (paint: rgb("#a60000"), thickness: 0.85pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((2.325, 0.775), (2.325, 2.325), stroke: (paint: rgb("#a60000"), thickness: 0.85pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((0.775, 0.775), (0.775, -0.279), (1.55, -0.8525), stroke: (paint: rgb("#a60000"), thickness: 0.85pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((2.325, 0.775), (2.325, -0.279), (1.55, -0.8525), stroke: (paint: rgb("#a60000"), thickness: 0.85pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((0.775, 2.325), (0.775, 3.379), (1.55, 3.952), stroke: (paint: rgb("#a60000"), thickness: 0.85pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((2.325, 2.325), (2.325, 3.379), (1.55, 3.952), stroke: (paint: rgb("#a60000"), thickness: 0.85pt, cap: "round", join: "round", dash: "densely-dashed"))
  circle((0, 0), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((0, 1.55), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((0, 3.1), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((1.55, 0), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((1.55, 1.55), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((1.55, 3.1), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((3.1, 0), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((3.1, 1.55), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((3.1, 3.1), radius: 0.05115, fill: rgb("#000000"), stroke: none)
  circle((0.775, 0.775), radius: 0.07234, fill: rgb("#a60000"), stroke: none)
  circle((0.775, 2.325), radius: 0.07234, fill: rgb("#a60000"), stroke: none)
  circle((2.325, 0.775), radius: 0.07234, fill: rgb("#a60000"), stroke: none)
  circle((2.325, 2.325), radius: 0.07234, fill: rgb("#a60000"), stroke: none)
  circle((1.55, -0.8525), radius: 0.05, fill: rgb("#ffffff"), stroke: (paint: rgb("#a60000"), thickness: 0.9pt, cap: "round", join: "round"))
  circle((1.55, 3.952), radius: 0.05, fill: rgb("#ffffff"), stroke: (paint: rgb("#a60000"), thickness: 0.9pt, cap: "round", join: "round"))
  content((-0.186, 1.55), [#text(fill: rgb("#0000a6"))[$D_0:0$]], anchor: "east", padding: 0.1176cm)
  content((3.286, 1.55), [#text(fill: rgb("#0000a6"))[$D_1:1$]], anchor: "west", padding: 0.1176cm)
  content((0, 0), [$N_0$], anchor: "north-east", padding: 0.1176cm)
  content((0, 3.1), [$N_1$], anchor: "south-east", padding: 0.1176cm)
  content((1.55, -0.9765), [#text(fill: rgb("#a60000"))[$b_0:0$]], anchor: "north", padding: 0.1176cm)
  content((1.55, 4.077), [#text(fill: rgb("#a60000"))[$b_1:1$]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The complementary boundary problems in Lemma 20, shown on a $2$-by-$2$ grid. The solid primal graph has prescribed values on $D_0 \, D_1$. Dashed dual edges crossing the other two boundary arcs end at the two separate wired vertices $b_0 \, b_1$; duals of the prescribed boundary edges are omitted. The wiring represents the two exterior faces after the added source-to-sink edge splits the exterior. ],
) <fig:mixed-boundary-duality>

The finite identity will be used on squares whose boundary is an actual primal circuit. We first give the compactness fact needed for the lower conductance bound.

#prodef([Lemma 5.7.])[
  (Local harmonic compactness).  #emph[Let $O$ be an open coordinate region in the extracted networks. Suppose $w_m$ is harmonic at every vertex with full star in $O$, and for every $V subset.double O$, $sup_m cal(E)_m \( w_m \; V \) < oo$. Then $w_m$ is asymptotically equicontinuous on compact subsets of $O$: if $z_m \( v_m \) \, z_m \( v'_m \)$ lie in a fixed compact subset and their distance tends to zero, then $\| w_m \( v_m \) - w_m \( v'_m \) \| arrow.r 0$. If the values are also locally bounded, every subsequence has a further subsequence converging locally uniformly in vertex tests to a continuous function.]
] <lem:harmonic-compactness>

#proof[
  Suppose two close vertex sequences have a common limiting position $z$. Choose a closed disk about $z$ inside $O$ and let $M$ bound the energy in a slightly larger disk. For an integer $N$, place $N$ disjoint concentric collars of the same relative shape inside that larger disk. Their radii decrease geometrically, and they are all fixed before taking the network limit. In collar $i$, the circuit-traffic estimate selects a surrounding circuit $gamma_i$ with total variation at most $sqrt(B E_(i \, m))$, where $E_(i \, m)$ is the energy paid in that collar. The collars, including their fixed small margins, can be disjoint, so some $i$ has $E_(i \, m) lt.eq M \/ N$.
  Every vertex in the disk inside that circuit has value between the minimum and maximum on the circuit. Indeed all its undetermined vertices are harmonic, and every component inside reaches the circuit: an original graph path from such a component to the rest of the connected map must meet the separating circuit. The finite maximum principle therefore bounds the oscillation inside by $sqrt(B M \/ N)$. For all sufficiently large $m$, both close vertices lie inside the smallest of the $N$ collars. Let $m$ tend to infinity and then let $N$ increase. This proves their difference tends to zero. For a random $z$, the collars may be chosen from the countable library by rational perturbations that keep a common inner disk and the disjoint margins; their relative shapes remain in one fixed bounded range.
  The sequential assertion gives equicontinuity on every compact by contradiction and compactness of its position set. The vertex positions are dense in each compact region up to an error tending to zero, by the flag mesh and the homeomorphisms. Choose vertices approaching a countable dense set, extract their bounded values diagonally, and use the equicontinuity to extend the limits continuously and uniformly on finite nets. This gives the stated local uniform convergence. ◻
]

#prodef([Lemma 5.8.])[
  (Conductance of an approximating square).  #emph[Let $Q = \( 0 \, 1 \)^2$ have closure in an ordinary canonical chart. There are simple primal boundary circuits approaching $partial Q$, with four ordered side arcs, for which the primal left-to-right and complementary dual bottom-to-top conductances satisfy 
$ C_m^(upright(p)) arrow.r k_(upright(p)) \, #h(2em) C_m^(upright(d)) arrow.r k_(upright(d)) . $

 The complementary dual uses exactly the wiring of Lemma 20.]
] <lem:square-conductance>

#proof[
  Embed a cube graph in the canonical sphere with one facial cycle equal to $partial Q$, and pull this embedding back to the reference sphere by $T^(- 1)$. The cubic skeleton lift #cite(label("C")) Lemma 4.7 gives a subdivided primal cube whose graph homeomorphism tracks the pulled-back embedding to any fixed accuracy; its facial cycles and their order are preserved up to one reversal. The reference homeomorphisms in Proposition 5 have vanishing projection error, and $T_m arrow.r T$ uniformly transfers that tracking to the canonical sphere. Apply the lift at successively smaller fixed accuracies and choose their thresholds increasingly. This gives a simple primal cycle $gamma_m$ with an ordered parametrization approaching $partial Q$ uniformly. In particular, its inside contains every compact subset of $Q$ eventually and lies in every fixed enlargement of $overline(Q)$. Let $G_m^Q$ be the submap consisting of this cycle and everything inside it. Its four arcs follow the four square sides with error tending to zero. Define $C_m^(upright(p)) \, C_m^(upright(d))$ as in Lemma 20, using unit conductances.
  Write $Q^epsilon.alt = { x : "dist" \( x \, overline(Q) \) < epsilon.alt }$. For an upper bound, choose a smooth function $f_delta$ on a neighborhood of $overline(Q)$, depending only on the horizontal coordinate, equal to zero in a strip about the left side and one in a strip about the right side. It can be chosen with
  $ integral_Q \| nabla f_delta \|^2 thin upright(d) x arrow.r 1 quad upright("as ") delta arrow.b 0 . $
  For example, flatten the linear function in strips of width $delta$, use slope $1 \/ \( 1 - 2 delta \)$ between them, and smooth the two bends in smaller strips. Extend it to a fixed small enlargement $Q^epsilon.alt$. For fixed $delta \, epsilon.alt$, every edge of $G_m^Q$ is eventually located in $Q^(epsilon.alt \/ 2)$. Apply the recovery clause of Lemma 15 with $W = Q^(epsilon.alt \/ 2) subset.double U = Q^epsilon.alt$, together with (5.13). It recovers $f_delta$ uniformly on a neighborhood of $overline(Q^(epsilon.alt \/ 2))$, with limsup energy on $Q^(epsilon.alt \/ 2)$ at most $k_(upright(p)) integral_(Q^epsilon.alt) \| nabla f_delta \|^2 thin upright(d) x$. The constant-recovery modification after Lemma 17 makes it exactly zero and one on smaller side strips, with additional energy $o \( 1 \)$. The boundary arcs lie in these strips for all large $m$. Hence
  $ limsup_m C_m^(upright(p)) lt.eq k_(upright(p)) integral_(Q^epsilon.alt) \| nabla f_delta \|^2 thin upright(d) x . $
  Let $epsilon.alt arrow.b 0$, and then $delta arrow.b 0$, to obtain $limsup C_m^(upright(p)) lt.eq k_(upright(p))$.
  For the dual upper bound use the corresponding function of the vertical coordinate, with the same recovery domains $W = Q^(epsilon.alt \/ 2) subset.double U = Q^epsilon.alt$. Thus the full-dual recovery converges uniformly on a neighborhood of $overline(Q^(epsilon.alt \/ 2))$, and its limsup energy on $Q^(epsilon.alt \/ 2)$ is bounded by $k_(upright(d))$ times its Dirichlet integral over $Q^epsilon.alt$. Apply the constant-recovery modification after Lemma 17 to this full-dual recovery on smaller bottom and top side strips whose closures lie in $Q^(epsilon.alt \/ 2)$ and in the constant regions of the vertical profile. It makes the recovery exactly zero and one there, with additional energy $o \( 1 \)$. Give an interior face its modified full-dual value and give each wired vertex its prescribed constant. A dual edge crossing one of the two relevant boundary arcs has its other endpoint at a genuine exterior face of the full map. The complete star of that face has diameter tending to zero. Thus this endpoint is in the smaller constant side strip for all large $m$, and the squared difference is exactly the squared difference to the wired value. The same face cannot meet the two separated side strips. For this fixed $epsilon.alt$, all interior dual edges and these boundary crossing edges eventually lie in $Q^(epsilon.alt \/ 2)$, including their whole endpoint stars. Their energy is consequently bounded by the recovered full-dual energy on $Q^(epsilon.alt \/ 2)$. The identical sequence of fixed limits, with vertical $f_delta$, gives $limsup C_m^(upright(d)) lt.eq k_(upright(d))$.
  For the lower bound take a subsequence attaining the liminf of either conductance and its minimizing voltages, clipped to $\[ 0 \, 1 \]$. The upper bound just proved gives bounded total energies. The voltages are harmonic at every undetermined vertex in the submap. On each compact subset of $Q$, the boundary is absent for large $m$, and all original primal incidences, or all original dual incidences, are present. Lemma 21 therefore gives a locally uniformly convergent further subsequence, with continuous limit $f$.
  We verify its prescribed boundary values away from the four corners. Near the relative interior of a primal prescribed side, extend the voltage to its fixed value on all exterior vertices. Locally this adds no energy: an edge leaving the submap passes through a prescribed boundary vertex. Near a prescribed side for the dual problem, extend the voltage to the wired value on the actual exterior faces. The boundary crossing edges in this neighborhood are precisely the edges to that wired vertex in the complementary problem. Other exterior edges have both endpoints at the same value. Whole-face mesh and the positive distance from the corners ensure that no other side enters this neighborhood. Thus the extended energies in a fixed neighborhood are bounded by the already bounded submap energies.
  Fix a point in the relative interior of such a side. Use $N$ disjoint fixed circular collars centered there, as in Lemma 21, within the neighborhood just described. Every surrounding circuit visits the exterior side of the approximating boundary. Its Jordan interior contains an inner disk; a ray from a point of that disk on the exterior side to the far exterior must cross the circuit. The crossing has a fixed positive distance from the limiting side, so vanishing mesh supplies an exterior vertex of the circuit. That vertex has the prescribed value. One of the $N$ circuits has variation at most $sqrt(B M \/ N)$. The maximum principle inside it applies to all undetermined vertices; the other vertices there have the prescribed constant value. It bounds their difference from that constant by $sqrt(B M \/ N)$. First take the network limit and then increase $N$. This proves that $f$ extends continuously to the prescribed value on each relative side interior, uniformly on its compact subsegments.
  For $V subset.double Q$, all edges located in $V$ belong to the submap eventually, for either network. Extend the minimizing function arbitrarily outside the submap; no edge in this inner test sees the extension. The lower relaxation bound and (5.13) give
  $ k_(upright(p)) integral_V \| nabla f \|^2 thin upright(d) x lt.eq liminf_m C_m^(upright(p)) $
  in the primal case, and the corresponding inequality with $k_(upright(d))$ in the dual case. Exhausting $Q$ puts $f$ in $H^1 \( Q \)$ when the liminf is finite. In the primal case its boundary values are zero and one on the relative interiors of the left and right sides. The Sobolev line property and Cauchy–Schwarz on horizontal slices give $integral_Q \| nabla f \|^2 gt.eq 1$. More explicitly, on $y in \[ eta \, 1 - eta \]$ the boundary convergence makes $f \( a \, y \)$ uniformly close to zero and $f \( 1 - a \, y \)$ uniformly close to one for small $a > 0$. For almost every such $y$,
  $ integral_a^(1 - a) \| partial_x f \( x \, y \) \|^2 thin upright(d) x gt.eq frac(\| f \( 1 - a \, y \) - f \( a \, y \) \|^2, 1 - 2 a) . $
  Integrate, let $a arrow.b 0$, and then $eta arrow.b 0$. The dual problem has the same calculation on vertical slices. Consequently both liminfs are at least their stated scalars. Together with the upper bounds this proves the lemma. ◻
]

#proof[
  Lemma 19 identifies the two reference relaxations with the scalar integrals $k_(upright(p))$ and $k_(upright(d))$. Equation (5.16) puts these integrals in the same canonical coordinate, and (5.17) equates their positive constants. Apply Lemma 20 to every submap in Lemma 22. Its exact identity and the two limits give
  $ k_(upright(p)) k_(upright(d)) = 1 . $
  Thus $k_(upright(p)) = k_(upright(d)) = 1$.
  For a continuous function outside $H_(upright("loc"))^1$, local finiteness is ruled out by Lemma 18. For a continuous $H_(upright("loc"))^1$ function with infinite integral, inner exhaustion and its lower bound give infinite relaxed energy. This completes (5.6) for every continuous input.
  Proposition 5(iv) supplies ordinary chart interiors from two rerootings covering the canonical sphere. Each carries the formula just proved, by Proposition 7 in its own marked marginal and by (5.16). On overlaps these are restrictions of the same finite-network relaxation, as in Lemma 15. The Radon measure property therefore patches their common Dirichlet density across a finite subcover of each compact test. This proves the sphere statement, including at points omitted by one of the rootings. The lower and recovery assertions are Lemma 15 with the now identified value. Since the finite product has fixed the value to one on every further extraction, the coefficient is independent of the extraction. ◻
]

== 6 Four-point potentials <sec:green>

The conductivity theorem identifies local energies of uniformly convergent functions. Point-source voltages have no bounded total energy in the limit, so we first obtain bounds away from their poles. We then use local energy replacements to determine their harmonic limit and its flux.

Throughout this section $m = 2 n$, and the network is the full primal network on the sphere. Its vertex positions are $z_n \( v \)$ from Proposition 5. Choose an edge position $z_n \( e \)$ on each canonical edge arc. For a spatial Borel set $U$, write

$ cal(E)_n^0 \( w \; U \) = sum_(e : thin z_n \( e \) in U) \( d_e w \)^2 . $

This is the notation (5.1) in the canonical coordinate. The choice of edge positions has no effect on inner limits.

Let $sans(a)_n \, sans(b)_n$ be distinct vertices. The unit-current voltage is a solution of

#[#set math.equation(numbering: n => "(6.1)")
 $ Q_n u_n = delta_(sans(a)_n) - delta_(sans(b)_n) \, $ <eq:point-current>]

where $Q_n$ is the graph Laplacian of Lemma 2. It exists and is unique up to a constant because the graph is connected. For every vertex function $w$, summation by parts gives

#[#set math.equation(numbering: n => "(6.2)")
 $ cal(E)_n^0 \( u_n \, w \) = w \( sans(a)_n \) - w \( sans(b)_n \) . $ <eq:point-current-weak>]

Equivalently, $u_n$ minimizes

#[#set math.equation(numbering: n => "(6.3)")
 $ cal(J)_n \( v \) = cal(E)_n^0 \( v \) - 2 #scale(x: 120%, y: 120%)[\(] v \( sans(a)_n \) - v \( sans(b)_n \) #scale(x: 120%, y: 120%)[\)] . $ <eq:source-functional>]

Indeed, for any $v$,

$ cal(J)_n \( v \) - cal(J)_n \( u_n \) = cal(E)_n^0 \( v - u_n \) + 2 cal(E)_n^0 \( u_n \, v - u_n \) - 2 #scale(x: 120%, y: 120%)[\(] \( v - u_n \) \( sans(a)_n \) - \( v - u_n \) \( sans(b)_n \) #scale(x: 120%, y: 120%)[\)] = cal(E)_n^0 \( v - u_n \) . $

This identity fixes the normalization of the flux calculation below.

Identify the canonical Riemann sphere with the unit round sphere in $bb(R)^3$, and write $"ch" \( z \, w \) = \| z - w \|_(bb(R)^3)$ for chordal distance. For distinct $x \, y \, z_0$, define on $bb(S)^2 \\ { x \, y }$

#[#set math.equation(numbering: n => "(6.4)")
 $ U_(x \, y \; z_0) \( z \) = frac(1, 2 pi) log frac("ch" \( z \, y \) "ch" \( z_0 \, x \), "ch" \( z \, x \) "ch" \( z_0 \, y \)) . $ <eq:round-voltage>]

It vanishes at $z_0$. The ratio is the modulus of a conformal cross ratio, so the function does not depend on the choice of stereographic coordinate.

#prodef([Theorem 6.1.])[
  (Four-point voltage convergence).  #emph[Fix a joint extraction on which Proposition 5, Theorem 11, and Theorem 16 hold. Let $sans(a)_n \, sans(b)_n \, sans(c)_n \, sans(d)_n$ be vertex sequences whose canonical positions converge respectively to four pairwise distinct points $x \, y \, z \, z_0$. Normalize the solution of (6.1) by $u_n \( sans(d)_n \) = 0$. Then, for every compact $K subset bb(S)^2 \\ { x \, y }$, 
#[#set math.equation(numbering: n => "(6.5)")
 $ sup_(v : thin z_n \( v \) in K) \| u_n \( v \) - U_(x \, y \; z_0) \( z_n \( v \) \) \| arrow.r 0 . $ <eq:local-voltage-convergence>]

 An empty supremum in (6.5) is assigned the value zero. In particular, 
$ u_n \( sans(c)_n \) - u_n \( sans(d)_n \) arrow.r frac(1, 2 pi) log frac("ch" \( z \, y \) "ch" \( z_0 \, x \), "ch" \( z \, x \) "ch" \( z_0 \, y \)) . $

 The assertion holds for any such varying vertex sequences on the extracted sample.]
] <thm:four-point>

=== 6.1 Bounds away from the current sources <bounds-away-from-the-current-sources>

#prodef([Lemma 6.2.])[
  (Local bounds for point-source voltages).  #emph[Under the assumptions of Theorem 23, let $O = bb(S)^2 \\ { x \, y }$. For every compact $K subset O$ there are finite sample-dependent constants $M_K \, M'_K$ such that, eventually, 
$ sup_(v : thin z_n \( v \) in K) \| u_n \( v \) \| lt.eq M_K \, #h(2em) cal(E)_n^0 \( u_n \; K \) lt.eq M'_K . $

 Here the energy on $K$ counts edges located in $K$. Every subsequence has a further subsequence converging locally uniformly in vertex tests on $O$ to a continuous function.]
] <lem:voltage-bounds>

#proof[
  For a vertex $v$, there is a path from $v$ to $sans(a)_n$ on which the voltage is at least $u_n \( v \)$. To prove this, let $S$ be the component of $v$ in the induced superlevel graph ${ w : u_n \( w \) gt.eq u_n \( v \) }$. If $sans(a)_n in.not S$, connectivity supplies a boundary edge, and every boundary difference from $S$ to its complement is strictly positive. Consequently
  $ sum_(w in S) \( Q_n u_n \) \( w \) = sum_(e = { w \, w' }\
w in S \, med w' in.not S) \( u_n \( w \) - u_n \( w' \) \) > 0 \, $
  whereas (6.1) makes the left side nonpositive. This is a contradiction. The sublevel argument with signs reversed gives a path from $v$ to $sans(b)_n$ with voltage at most $u_n \( v \)$.
  For real $alpha < beta$, let $T$ clip a number to $\[ alpha \, beta \]$, and put $D = beta - alpha$. Monotonicity and the one-Lipschitz property of $T$ give on every edge
  $ \( d_e T u_n \)^2 lt.eq d_e u_n thin d_e T u_n . $
  Using (6.2),
  #[#set math.equation(numbering: n => "(6.6)")
   $ cal(E)_n^0 \( T u_n \) lt.eq cal(E)_n^0 \( u_n \, T u_n \) = T u_n \( sans(a)_n \) - T u_n \( sans(b)_n \) lt.eq D . $ <eq:clipped-energy>]
  Fix concentric inner and outer coordinate disks and a circular collar between them surrounding the inner disk, with the entire closed outer disk contained in $O$. For large $n$, both source vertices lie outside the outer disk. Choose any two vertices in the inner disk and let their voltages be $alpha lt.eq beta$. The superlevel path from the higher vertex to $sans(a)_n$ and the sublevel path from the lower vertex to $sans(b)_n$ meet every surrounding circuit in the collar. The intersections are graph vertices, because these paths and circuits belong to the same embedded network. At the two intersections the clipped voltage takes the values $beta$ and $alpha$. Its total variation on each such circuit is at least $D$.
  Theorem 11 supplies a circuit law with $sum_e tau \( e \)^2 lt.eq B$. The expectation below is only over that finite-network circuit law. By (6.6),
  $ D lt.eq bb(E) #h(-0.16667em) [sum_(e in gamma) \| d_e T u_n \|] = sum_e tau \( e \) \| d_e T u_n \| lt.eq sqrt(B thin cal(E)_n^0 \( T u_n \)) lt.eq sqrt(B D) . $
  Thus the voltage oscillation in the inner disk is at most $B$, independently of the total energy of $u_n$.
  The punctured sphere $O$ is connected. Cover a compact $K subset O$ and finitely many paths joining it to $z_0$ by finitely many such disks, with consecutive disks overlapping. Vertices occur in each overlap for all large $n$, by the vanishing mesh in Proposition 5. Chaining the oscillation bounds and using $u_n \( sans(d)_n \) = 0$, $z_n \( sans(d)_n \) arrow.r z_0$, gives the asserted bound $M_K$. The chart cover in Proposition 5(iv) allows these disks at every point of $O$, including a point omitted by one rooting. Under the uniform conformal or anticonformal comparison, sufficiently small fixed round collars contain and are contained in reference collars of comparable relative shape. Their fixed-test circuit bounds therefore apply in the canonical coordinate.
  Choose a slightly larger compact neighborhood $K' subset O$ of $K$. For large $n$, both endpoints of every edge located in $K$ lie in $K'$. Clip $u_n$ to an interval containing all its values on $K'$. This clipping leaves those edge differences unchanged. (6.6) bounds their total energy by the finite length of that interval, giving $M'_K$.
  For each fixed $V subset.double W subset.double O$, both moving source vertices are eventually outside $overline(W)$. Equation (6.1) then makes $u_n$ harmonic at every vertex with full star in $W$. Apply Lemma 21 on $W$, using the local bounds just proved, to obtain compactness on $V$. A countable exhaustion by such buffered pairs and a diagonal extraction give the final subsequential compactness assertion on $O$. ◻
]

=== 6.2 Local energy convergence and harmonicity <local-energy-convergence-and-harmonicity>

Take a subsequence furnished by Lemma 24, and write $u$ for its locally uniform limit on $O$. Associate to its finite voltages the edge energy measures

$ xi_n = sum_e \( d_e u_n \)^2 delta_(z_n \( e \)) . $

Their masses are bounded on every compact subset of $O$. A diagonal vague extraction on this locally compact space gives a Radon measure $xi$ on $O$.

#prodef([Lemma 6.3.])[
  (No local energy defect).  #emph[On this extraction, $u in H_(upright("loc"))^1 \( O \)$, $u$ is harmonic on $O$, and 
#[#set math.equation(numbering: n => "(6.7)")
 $ xi = \| nabla u \|^2 thin upright(d) x $ <eq:no-energy-defect>]

 in every conformal chart of $O$. Hence the edge energies converge on every relatively compact continuity set of the measure on the right.]
] <lem:no-energy-defect>

#proof[
  We first justify the lower measure bound with the necessary outer room. Fix a compact $K$ inside a relatively compact open $D subset O$. Choose $K subset V subset.double W subset.double D$, with $V \, W$ open and $xi \( partial W \) = 0$. Such a $W$ can be chosen among distance neighborhoods with sufficiently small radius: the boundaries are disjoint as the radius varies, and a finite measure gives positive mass to at most countably many of them. The local uniform convergence and the lower bound of Lemma 15 give
  $ cal(R) \( u \, V \) lt.eq liminf_n cal(E)_n^0 \( u_n \; W \) = xi \( W \) < oo . $
  The equality uses vague convergence on the relatively compact continuity set $W$. These choices around each compact set and Lemma 18 put $u$ in $H_(upright("loc"))^1 \( O \)$. Theorem 16 now identifies $cal(R) \( u \, V \) = integral_V \| nabla u \|^2$. Thus
  $ integral_K \| nabla u \|^2 thin upright(d) x lt.eq xi \( D \) . $
  Take the supremum over compact $K subset D$, and then over relatively compact $D$. This proves
  #[#set math.equation(numbering: n => "(6.8)")
   $ \| nabla u \|^2 thin upright(d) x lt.eq xi . $ <eq:energy-defect-lower>]
  The continuity set $W$ is essential here: the open-set Portmanteau inequality alone has the opposite direction for the desired comparison.
  We next use local minimization to obtain the reverse bound and harmonicity. Work in one Euclidean chart, and let $B_r = B \( z \, r \) subset.double O$ be a disk with $xi \( partial B_r \) = 0$. Let $phi in C_c^oo \( B_r \)$. Choose fixed radii
  $ r < r_1 < r_2 < r_3 < r_4 \, #h(2em) B_(r_4) subset.double O . $
  The function $u + phi$ is continuous and in $H^1$ on this buffered disk. The recovery clause of Theorem 16 gives $w_n arrow.r u + phi$ uniformly on a neighborhood of $overline(B)_(r_3)$ and
  #[#set math.equation(numbering: n => "(6.9)")
   $ limsup_n cal(E)_n^0 \( w_n \; B_(r_3) \) lt.eq integral_(B_(r_4)) \| nabla \( u + phi \) \|^2 thin upright(d) x . $ <eq:local-recovery-bound>]
  Choose a cutoff $theta_n$ equal to one on $B_(r_1)$ and zero outside $B_(r_2)$, with bounded energy for these fixed radii. Put
  $ v_n = theta_n w_n + \( 1 - theta_n \) u_n . $
  Extend the recovery arbitrarily where it is multiplied by zero. All changed edges lie in $B_(r_3)$ for large $n$, by the open room and star mesh. The transition collar is outside $B_r$, where $phi = 0$, so $w_n - u_n arrow.r 0$ uniformly there. Applying the edge identity (5.9) to these two functions gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ cal(E)_n^0 \( v_n \; B_(r_3) \) lt.eq cal(E)_n^0 \( w_n \; B_(r_3) \) + cal(E)_n^0 \( u_n \; B_(r_3) \\ overline(B)_r \) + o \( 1 \) . $ <eq:local-replacement-bound>]
  Indeed the principal squared differences are bounded by their convex combination. The coefficient of an old difference can be nonzero only outside $overline(B)_r$, since $theta_n = 1$ on $B_(r_1)$ and the mesh is small. The remaining term has energy bounded by $sup_(upright("collar")) \| w_n - u_n \|^2 cal(E)_n^0 \( theta_n \) = o \( 1 \)$; its cross term is $o \( 1 \)$ by the bounded old and recovered energies.
  Neither source value changes. The minimizing identity (6.3), restricted to the changed edges, gives $cal(E)_n^0 \( u_n \; B_(r_3) \) lt.eq cal(E)_n^0 \( v_n \; B_(r_3) \)$. Subtract the old energy on $B_(r_3) \\ overline(B)_r$ in (6.10). The difference on the left is $xi_n \( overline(B)_r \) gt.eq xi_n \( B_r \)$, so the result is
  $ xi_n \( B_r \) lt.eq cal(E)_n^0 \( w_n \; B_(r_3) \) + o \( 1 \) . $
  Take $n$ to infinity. The left side tends to $xi \( B_r \)$ because $B_r$ is a continuity set, and (6.9) bounds the right side. Now decrease $r_4$ to $r$, choosing the three intermediate radii afresh between them at each step. Each cutoff is used only for a fixed step before the network limit. The continuum energy has no mass on the circle $partial B_r$, so
  #[#set math.equation(numbering: n => "(6.11)")
   $ xi \( B_r \) lt.eq integral_(B_r) \| nabla \( u + phi \) \|^2 thin upright(d) x . $ <eq:local-minimality-limit>]
  Set $phi = 0$. Together with (6.8), this gives equality of the two measures on every such disk. These disks form a cover basis after excluding at most countably many radii at each center. The nonnegative measure $xi - \| nabla u \|^2 thin upright(d) x$ vanishes on that basis, hence vanishes on $O$. This proves (6.7).
  For $psi in C_c^oo \( B_r \)$, use $phi = t psi$ in (6.11) and the measure equality. Expanding for both signs of $t$ and letting $t arrow.r 0$ gives $integral_(B_r) nabla u dot.op nabla psi thin upright(d) x = 0$. Every point has such a disk, so $u$ is distributionally harmonic on $O$. Interior harmonic regularity makes it classically harmonic. Finally, vague convergence to the measure in (6.7) gives convergence on each of its relatively compact continuity sets. ◻
]

The proof used recovery for the particular limiting function $u$. This is legitimate pathwise: Lemma 15 obtains its statements for every continuous function from one countable cell library. No conditional kernel depending on the subsequently chosen voltage limit is needed.

=== 6.3 Unit flux and the logarithmic poles <unit-flux-and-the-logarithmic-poles>

#proof[
  Take any subsequence. Lemma 24 and a further vague energy extraction give a locally uniform limit $u$ on $O$. Lemma 25 makes $u$ harmonic there and identifies its local energy measure. The normalization $u_n \( sans(d)_n \) = 0$ and local uniform convergence imply $u \( z_0 \) = 0$.
  Choose a conformal disk about $x$ whose closure avoids $y$, with $x$ at its Euclidean center. Let $chi$ be a smooth radial function equal to one on a smaller disk and zero outside a larger disk, with its transition compactly in the punctured disk. Choose a closed-buffered annular domain $V subset.double O$ containing $"supp" nabla chi$ with clearance from both boundary components. Its two boundary circles have zero $\| nabla u \|^2 thin upright(d) x$-mass.
  Fix $t in bb(R)$. Choose annuli $V subset.double W subset.double U subset.double O$ by slightly moving the two boundary radii, and recover $u + t chi$ on a neighborhood of $overline(W)$. The recovery $w_n$ satisfies
  #[#set math.equation(numbering: n => "(6.12)")
   $ limsup_n cal(E)_n^0 \( w_n \; W \) lt.eq integral_U \| nabla \( u + t chi \) \|^2 thin upright(d) x . $ <eq:flux-recovery>]
  For a vertex of the full network put
  $ hat(u)_n \( v \) = u_n \( v \) + t chi \( z_n \( v \) \) . $
  Take an annular cutoff $theta_n$ equal to one on a neighborhood of $overline(V)$ and zero outside an intermediate annulus compactly contained in $W$. Such a cutoff is obtained by combining two disk cutoffs; its energy is bounded for these fixed radii. Define
  $ v_n = theta_n w_n + \( 1 - theta_n \) hat(u)_n . $
  On both transition collars $w_n - hat(u)_n arrow.r 0$ uniformly. Wherever the coefficient $1 - theta_n$ of an edge difference can be nonzero, the edge lies outside $overline(V)$ with a margin, where $chi$ is constant on each component. Thus $d_e hat(u)_n = d_e u_n$ on every such edge for all large $n$. This uses the clearance from $"supp" nabla chi$ and vanishing star mesh. Outside $W$, $chi$ is constant on the inner and outer components and $theta_n = 0$; hence the changed energy is confined to $W$. The source vertex is in the inner component and the sink is in the outer one, so
  $ v_n \( sans(a)_n \) = u_n \( sans(a)_n \) + t \, #h(2em) v_n \( sans(b)_n \) = u_n \( sans(b)_n \) . $
  The edge gluing estimate, with the old part supported outside $overline(V)$, gives
  $ cal(E)_n^0 \( v_n \; W \) lt.eq cal(E)_n^0 \( w_n \; W \) + cal(E)_n^0 \( u_n \; W \\ overline(V) \) + o \( 1 \) . $
  The error has energy at most the squared uniform collar discrepancy times the fixed cutoff energy, and its cross term tends to zero by local energy bounds. Minimality of the source functional (6.3) now gives
  $ cal(E)_n^0 \( u_n \; W \) lt.eq cal(E)_n^0 \( v_n \; W \) - 2 t . $
  Subtract the displayed old collar energy. The difference on the left is $xi_n \( overline(V) \) gt.eq xi_n \( V \)$, so the resulting inequality is
  $ xi_n \( V \) lt.eq cal(E)_n^0 \( w_n \; W \) - 2 t + o \( 1 \) . $
  By Lemma 25, the left side converges to $integral_V \| nabla u \|^2$, since $V$ is a continuity set. Use (6.12), then shrink $U$ to $V$ through annuli with the same clearance from $"supp" nabla chi$. At each stage the annuli and cutoffs are fixed before $n$ tends to infinity. Absolute continuity of the continuum energy and the zero mass of the boundary circles give
  #[#set math.equation(numbering: n => "(6.13)")
   $ integral_V \| nabla u \|^2 thin upright(d) x lt.eq integral_V \| nabla \( u + t chi \) \|^2 thin upright(d) x - 2 t . $ <eq:flux-variation>]
  Expanding this inequality yields
  $ 0 lt.eq 2 t (integral_V nabla u dot.op nabla chi thin upright(d) x - 1) + t^2 integral_V \| nabla chi \|^2 thin upright(d) x . $
  It holds for every real $t$, so the coefficient of $t$ is zero:
  #[#set math.equation(numbering: n => "(6.14)")
   $ integral nabla u dot.op nabla chi thin upright(d) x = 1 . $ <eq:unit-source-flux>]
  For a cutoff equal to one near $y$ and zero near $x$, the replacement changes the sink value by $t$ and the source value by zero. The source term in (6.3) then changes by $+ 2 t$; the expanded inequality gives flux $- 1$ at $y$.
  We verify that these fluxes determine the only possible singularities. Choose an outer coordinate disk about $x$ whose closure excludes $y$, and a fixed collar inside it surrounding a smaller disk about $x$. For every sufficiently large $n$, take a surrounding network circuit in that collar. Eventually $sans(a)_n$ is in the smaller disk and $sans(b)_n$ is outside the outer disk, hence outside the circuit. Lemma 24 bounds the voltages on that collar uniformly. Inside the circuit, $Q_n u_n = 0$ except at the positive source, where $Q_n u_n = 1$. The minimum principle therefore bounds every interior voltage from below by the minimum on the circuit. Passing to the limit bounds $u$ from below near $x$. For $y$, choose an outer disk whose closure excludes $x$ and a collar inside it surrounding a smaller disk about $y$, and take a surrounding network circuit there. Eventually $sans(b)_n$ is inside its circuit and $sans(a)_n$ is outside the outer disk. The maximum principle then bounds $u$ from above near $y$.
  We recall the planar isolated-singularity argument at the needed strength. If $v$ is a positive harmonic function on a punctured disk, its circular mean $M \( r \)$ satisfies $\( r M' \( r \) \)' = 0$. Thus
  $ M \( r \) = a log \( 1 \/ r \) + b \, #h(2em) a gt.eq 0 \, $
  where positivity forces the sign of $a$. Harnack’s inequality on the fixed-shape annulus ${ r \/ 2 < \| \| z < 2 r }$ bounds the values on $\| \| z = r$ by a constant times $M \( r \)$, uniformly in small $r$. This version of Harnack follows directly from the Poisson kernel on a finite chain of disks in the annulus. Hence $v = O \( 1 + log \( 1 \/ r \) \)$. For each nonzero angular Fourier mode, harmonicity makes its radial coefficient a linear combination of $r^j$ and $r^(- j)$, $j gt.eq 1$. The logarithmic bound forces every $r^(- j)$ coefficient to vanish. The remaining positive-power series is the harmonic Poisson extension from any fixed smaller circle. Consequently
  $ v \( z \) = a log \( 1 \/ \| \| z \) + h \( z \) \, $
  where $h$ extends harmonically through the center. Applying this to $u$ plus a constant near $x$, and to $- u$ plus a constant near $y$, shows that $u$ has only logarithmic or removable singularities.
  For $a log \( 1 \/ \| \| z \)$, a radial cutoff equal to one near zero and zero outside has
  $ integral nabla #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] a log \( 1 \/ \| \| z \) #scale(x: 120%, y: 120%)[\)] dot.op nabla chi thin upright(d) x = - 2 pi a integral chi' \( r \) thin upright(d) r = 2 pi a . $
  The harmonic remainder contributes zero. Equation (6.14) therefore sets the coefficient at $x$ to $1 \/ \( 2 pi \)$, and the sink flux sets the coefficient at $y$ to $- 1 \/ \( 2 pi \)$.
  For comparison, the round zero-mean Green kernel has, up to its additive constant,
  $ G_(upright("rd")) \( z \, w \) = - frac(1, 2 pi) log "ch" \( z \, w \) . $
  Away from $w$, a radial calculation on the unit sphere gives $- Delta_z G_(upright("rd")) \( z \, w \) = - 1 \/ \( 4 pi \)$; the preceding local flux is one at $w$. Thus its distributional equation is $- Delta_z G_(upright("rd")) \( z \, w \) = delta_w - \( 4 pi \)^(- 1) thin upright(d) upright("vol")_(upright("rd"))$. The difference $G_(upright("rd")) \( dot.op \, x \) - G_(upright("rd")) \( dot.op \, y \)$ has exactly the two fluxes and singular coefficients just found. Subtract it from $u$. The difference extends harmonically across $x \, y$, and a harmonic function on the compact sphere is constant. Its value at $z_0$ gives precisely (6.4).
  Every subsequence has therefore a further locally uniform subsequence with the same limit $U_(x \, y \; z_0)$. This proves (6.5) along the entire extraction. Evaluating at $sans(c)_n$ gives the asserted four-point value. The reasoning applied to arbitrary varying pole and evaluation vertices with the stated distinct limits, so it proves the claimed pathwise quantifier. ◻
]

== 7 An approximation estimate at every smaller scale <sec:compactness>

The electrical estimates of Theorem 11 control each fixed annulus after a threshold which may depend on that annulus and on the sample. Spectral compactness requires one estimate valid at all remaining discrete scales. We obtain it from the address estimates and finite contour views of #cite(label("P")). The new ingredients are a rank estimate with one marked time, a bound on the number of widely separated times reached by short contour explorations, and a cover by circuits which avoids the cost of reaching individual vertices.

For a set $W$ of original edges, counted with their map multiplicities, write

$ cal(E)_m \( f \; W \) = sum_(e in W) \| f \( e^(+) \) - f \( e^(-) \) \|^2 . $

The choice of orientation $e^(-) \, e^(+)$ is immaterial, and a loop contributes zero. On a duration-one sphere $m = 2 n$, this is the restriction of $cal(E)_n^0$ to $W$.

An interval used below is a set $I_m$ of consecutive letter cuts inside one used block of a protected chart. Its endpoints are specified relative to that block, its length divided by $m$ has a positive finite limit, and its limiting tour image has compact clearance inside a larger protected neighborhood. The chart records a graph $G_m^(+)$ which contains the interval’s vertices and all edges and complete stars in an intermediate neighborhood, and is itself reconstructed with room inside the larger neighborhood. These are entries in the countable atlas of Proposition 6; activation refers to its strict continuum conditions.

Split $I_m$ into nested dyadic halves, rounding integer sizes at each split. Retain singleton and empty blocks at later levels. For a nonempty level-$j$ block $I$, define

$ \( P_j^(I_m) f \) \( i \) = frac(1, \| \| I) sum_(k in I) f \( v \( k \) \) \, #h(2em) i in I . $

Thus $P_j^(I_m)$ is the orthogonal projection of the cut-value function onto level-$j$ block constants for counting measure; it is the identity after every block is a singleton.

#prodef([Theorem 7.1.])[
  (All-level block approximation).  #emph[From an arbitrary sequence of finite spheres, take a further joint representation extraction as in Proposition 5 and Proposition 6, retaining the interval readouts defined below. Put $m = 2 n$ and $p = 7 \/ 10$. Simultaneously for the countable protected interval atlas, the following holds almost surely on activation of an entry $\( I_m \, G_m^(+) \)$. There are finite sample-dependent constants $j_(*)$, $C$, and $n_(*)$ such that, at every index $n gt.eq n_(*)$ in the extraction, for every function on $V \( G_m^(+) \)$ and every integer $j gt.eq j_(*)$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ 1 / m sum_(i in I_m) \| f \( v \( i \) \) - \( P_j^(I_m) f \) \( i \) \|^2 lt.eq C thin 2^(- p j) cal(E)_n^0 \( f \; G_m^(+) \) . $ <eq:block-approximation>]

 This includes all levels down to and beyond singleton cuts and holds for all functions on the same event.]
  #emph[In the two-rooting extraction of Proposition 5, one can choose finitely many activated entries from the two rooted atlases such that every corner occurrence belongs to at least one of their intervals, in its corresponding rooted order, for all sufficiently large $n$.]
] <thm:block-approximation>

We first work with the bilateral word and prove a tight bound on the smallest sufficient $j_(*)$. Only after that probability estimate will we regard the threshold as a local readout and transfer almost-sure finiteness of its extracted limit on activation to sphere charts.

=== 7.1 Selected words and the address estimates <selected-words-and-the-address-estimates>

Let $bb(P)_m^W$ be the product law on bilateral inventory words. The two burger types, their two rigid orders, and the flexible order have probabilities

$ 1 / 4 \, quad 1 / 4 \, quad frac(2 - sqrt(2), 4) \, quad frac(2 - sqrt(2), 4) \, quad frac(sqrt(2) - 1, 2) \, $

respectively. An order consumes the freshest allowed burger. Resolve flexible orders using the bilateral matching. The subscript records the time unit $m$, not a change of the iid letter law. The two resolved scalar contours are $Z^1 \, Z^2$; their increments are not asserted independent. These are the FK-Ising probabilities of #cite(label("C")) Proposition 3.1. Work in an ordinary bilateral contour coupling with its reference tour projection; extra field coordinates use the attachment convention of Proposition 6. We use a #emph[scalar link] only for a pair of integer cuts $s \, t$ satisfying

$ Z^c \( s \) = Z^c \( t \) = min_(\[ s and t \, s or t \]) Z^c quad upright("for one ") c in { 1 \, 2 } . $

Links can have arbitrary chronological duration. A time jump is an arbitrary pair of cuts whose distance is bounded as specified below. Put

$ r_m \( x \) = m e^(- x) \, #h(2em) theta.alt = 1 / 2 + 2 / gamma^2 = 7 / 6 . $

Every sequential statement in this subsection has

#[#set math.equation(numbering: n => "(7.2)")
 $ N = N_m arrow.r oo \, #h(2em) r_m \( b N \) arrow.r oo $ <eq:selected-units>]

for the fixed upper log-range constant $b > 1$.

We record the selection protocol because it will also allow a union over many levels. Fix a compact starting window in time units, a spatial compactness and positive-clearance cutoff, and $sigma_m arrow.b 0$ bounding every used seed unit divided by $m$. For any fixed loss $epsilon.alt > 0$, the preselection construction of #cite(label("P")) Section 11 supplies a master event $cal(T)_m$, deterministic enclosures $\[ - C_d m \, C_d m \]$, and a deterministic $D_m^max arrow.r oo$. Its failure probability on the fixed cutoff is at most $2 epsilon.alt + o \( 1 \)$. On $cal(T)_m$, simultaneously for $d lt.eq D_m^max$, every exploration of at most $d$ links or jumps of size at most $d m$ from the starting window remains in the $d$th enclosure. If its jumps have size at most $d sigma_m m$, all its projected points are within a deterministic $chi_m arrow.b 0$ of its base. This includes first- and last-return witnesses. For each fixed $d$, the bilateral protected-window result #cite(label("C")) Proposition 4.9, after a deterministic compact cutoff, gives the vanishing flag mesh and exact complete stars needed for the fixed intermediate neighborhood on that enclosure. Include its eventual conclusion with a further prescribed summable loss before selection. Slowing $D_m^max$ makes these conclusions simultaneous as well.

A selected law $bb(Q)_m$ in this section is supported on $cal(T)_m$ and the stated clearance cutoff. Its raw-word marginal satisfies

#[#set math.equation(numbering: n => "(7.3)")
 $ frac(d bb(Q)_m^W, d bb(P)_m^W) lt.eq e^(kappa_m) \, #h(2em) kappa_m = o \( N \) . $ <eq:selected-density>]

Finite lists may be randomized functions of the word and of the coupled environment. To apply the companion on its augmented probability space, give the reference word the selected law’s conditional selector kernel given that word. This kernel can be realized by an independent uniform variable; the augmented reference still has word marginal $bb(P)_m^W$, and the full augmented density is the density in (7.3). The selected environment and bases precede the independent viewing level or seed mesh. Seed-specific lists may then use their seed levels; their complete union of positions and access witnesses precedes the independent chronological address grid. Subsequent finite-list cutoffs may grow only along a slower diagonal below $D_m^max$. These are the hypotheses on every selected law below; we will not transfer a fresh high-probability master event through (7.3).

Here is the quantitative address input. In an enclosure of length $h_m^(upright("enc")) = c_(upright("enc")) m$, fix an integer $R gt.eq 8$, put $ell_R = log R$, and use generations $0 lt.eq k lt.eq J_R = floor.l b N \/ ell_R floor.r$ of cells of width $delta_k = h_m^(upright("enc")) R^(- k)$. There are $h_(upright(b))$ distinguished bases marked through $J_R$. Use distinct probe generations. At each probe generation, every endpoint and intermediate point in each access chain from a distinguished base is marked through that generation; its links are scalar links or jumps of size at most $K delta_k$. The fixed $K$ also bounds the marker and edge entries in every probe list. Include all distinguished base entries in the list at terminal generation $J_R$, merging them into an existing list there or adding that generation as one probe. Enlarge $K$ to bound the marker and edge entries in this augmented list as well. Let $P_N$ count the resulting distinct probes and $M_(upright("term"))$ count all marker entries, so $M_(upright("term")) lt.eq K P_N$. The count below fixes these augmented probe depths; in our applications they are determined by an independent mesh phase held as side information. The entire augmented marker system is chosen before the independent $Xi tilde.op "Unif" \[ 0 \, h_m^(upright("enc")) \)$ translates the nested grids.

At generation $k$, let $m_k$ be the number of occupied cells, $b_k$ the number containing a base, and $D_k$ the number of jump entries split between distinct cells. For each color, project every active recorded chord of that color to the cells containing its endpoints and take all occupied cells, including isolated ones, as vertices; these graphs exclude jumps, as in #cite(label("P")) Definition 10.6 and Lemma 10.7. Define graph rank as the number of vertices minus the number of connected components, so projected loops and repeated edges add no rank, and let $e_k$ be the sum of the two color ranks. Write

$ T_(upright("occ")) = sum_k m_k \, #h(2em) R_(upright("rk")) = sum_k e_k . $

#prodef([Proposition 7.2.])[
  (Address input from the companion).  #emph[For the marker systems just described, with fixed $b \, R \, K$, the following statements hold.]
  + #emph[If $c_k$ is the number of components of the union of the two colored graphs, then 
$ c_k lt.eq b_k + D_k \, #h(2em) e_k gt.eq m_k - c_k . $

 Moreover 
$ bb(E)_Xi sum_k D_k lt.eq C_(K \, R) M_(upright("jump")) . $

 If the bases lie in an interval of length $C r_m \( N \)$, then $bb(E)_Xi sum_(k lt.eq N \/ ell_R) \( b_k - 1 \) lt.eq C_(C \, R)$.]
  + #emph[For each $epsilon > 0$, a fixed sufficiently large $R$ gives, with conditional grid probability at least $7 \/ 8$, disjoint regular sampling slots after deletion of at most $C_R M_(upright("term")) + epsilon T_(upright("occ"))$ node occurrences. For each sufficiently small fixed $epsilon > 0$, $R$ and the deletion tolerances may be fixed so that every such code $frak(c)$ obeys 
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(P)_m^W { frak(c) upright(" is realized") } lt.eq exp { - theta.alt ell_R R_(upright("rk")) + epsilon ell_R T_(upright("occ")) + C_(R \, epsilon) M_(upright("term")) } . $ <eq:fixed-code-charge>]

 Realization includes all its actual chord constraints. The bound is uniform in the fixed grid displacement and in the exact chord endpoints inside the recorded cells, once the minimum sampling radius diverges.]
  + #emph[For each fixed displacement and fixed augmented distinct probe depths, and every $0 < eta lt.eq K$, the number of decorated codes with occupancy $T_(upright("occ")) = t$ is at most the exponential of 
#[#set math.equation(numbering: n => "(7.5)")
 $ \( ell_R + C_0 + eta \) t + K P_N log \( K \/ eta \) + C P_N K log \( K + 1 \) + O \( 1 \) . $ <eq:address-count>]

 If the depth list itself is encoded, add $log binom(J_R + 1, P_N)$; our independent mesh phases are instead held as side information.]
  + #emph[Let $Delta \( Xi \)$ count generations at which the partition of the active markers into shifted cells differs from the grid-independent partition obtained by joining consecutive active positions with gap $< delta_k$. Then 
$ bb(E)_Xi \[ Delta \( Xi \) divides upright("markers") \] lt.eq frac(2 R, R - 1) M_(upright("term")) . $

 At a generation with equal partitions the entire colored graph and its base labels agree up to cell names.]
  #emph[For $P_N = O \( N \/ L \)$, take the error tolerances and $R$ fixed first, then $N$ and the minimum units to infinity with $L arrow.r oo$ and $L = o \( N \)$. The terminal, jump, and structural errors above are $o \( N \)$ for every fixed $K$. One may subsequently let $K = K_m arrow.r oo$ sufficiently slowly, with 
$ frac(K_m log \( K_m L \), L) arrow.r 0 \, #h(2em) frac(K_m log \( 2 hat(C)_m \), L) arrow.r 0 \, $

 where $2 hat(C)_m m$ is a growing enclosure length, and with the composed exploration depth below $D_m^max$. The second condition pays for its extra address ancestors. The integrated jump error remains $o \( N \)$, and each previously fixed minimum-unit threshold is retained.]
] <prop:address-input>

#proof[
  The projected rank and jump inequalities are the spanning-forest and displaced-grid estimates in #cite(label("P")) Section 10. The fixed-code estimate is #cite(label("P")) Proposition 10.15; its proof charges a left and right fresh slot for each monochrome rank and gives the coefficient $theta.alt = 1 \/ 2 + 2 \/ gamma^2$. The decorated address count is #cite(label("P")) Lemma 10.13: distinct depths give $sum_p m_(k_p) lt.eq T_(upright("occ"))$, and the terminal base list supplies every base’s coarser address. The regular-slot deletion bound and grid-partition estimate are the corresponding lemmas in the same section. Its sparse-diagonal remark gives the list and jump order of limits; the extra-ancestor estimate in the proof of #cite(label("P")) Lemma 11.6 gives the growing-enclosure condition. In these formulas a generation has log width $ell_R$; this accounts for every conversion between sums over generations and log lengths. ◻
]

We need a packing consequence also at the order of limits in which the probe stride is held fixed while $m$ grows. For $k gt.eq 1$, let $cal(R)_(m \, k) \( x \)$ be all times reached from the selected bases by at most $k$ scalar links or jumps, each jump of size at most $k r_m \( x \)$. The whole access chain is included. Bilateral recurrence below each fixed scalar height makes this set finite. It is increasing in $k$, and $cal(R)_(m \, k) \( x \) subset cal(R)_(m \, k) \( y \)$ for $y lt.eq x$. Define

$ Pi_(m \, k \, H) \( x \) = max { \| \| A : A subset cal(R)_(m \, k) \( x \) \, med \| s - t \| > H r_m \( x \) med upright("for ") s eq.not t upright(" in ") A } . $

#prodef([Lemma 7.3.])[
  (Truncated packing at a typical level).  #emph[Use the selected protocol above with a fixed number of bases. Let $cal(I)_N subset \[ a_(-) N \, b N \]$, with fixed $a_(-) > 1$, be a deterministic log interval of length at least $c N > 0$, and let $Y$ be uniform on $cal(I)_N$, independently after the selected environment. Then there is $C_(upright("pack")) < oo$, independent of each fixed $k \, M$, such that 
#[#set math.equation(numbering: n => "(7.6)")
 $ sup_(k \, M gt.eq 1) med lim_(H arrow.r oo) limsup_m bb(E)_(bb(Q)_m) min { Pi_(m \, k \, H) \( Y \) \, M } lt.eq C_(upright("pack")) . $ <eq:truncated-packing>]

]
] <lem:truncated-packing>

#proof[
  Choose fixed address parameters within Proposition 27 so that
  $ delta = theta.alt - 1 - epsilon - frac(C_0 + eta, ell_R) > 0 . $
  Fix $k \, M$ and a log stride $L > 2 ell_R$. Sample an independent translation of a stride-$L$ mesh in $cal(I)_N$. At each seed choose a maximum-cardinality $H$-packing truncated at $M$, with all access witnesses. Use a fixed measurable ordering of the finite reachable set, and keep the independent mesh phase as side information in the code count. Round a seed $y$ up to generation $ceil.l y \/ ell_R ceil.r$, discarding the final incomplete generation if needed. The seed depths are distinct because $L > 2 ell_R$. The terminal base-list augmentation adds at most one probe and $h_(upright(b))$ fixed entries, so $P_N = O \( N \/ L \)$ and $K = O \( k M + h_(upright(b)) \)$, with constants allowed to depend on the fixed enclosing depth. Only then sample the chronological address-grid displacement. These lists have exactly the order and the form in Proposition 27.
  We first bound their occupation for this #emph[fixed] $L$. Markov’s inequality in part (i) gives a set of grid displacements of fixed positive conditional probability on which $sum D_k lt.eq C_K N \/ L + O \( 1 \)$. Intersect it with the regular-slot event, retaining a fixed positive probability. Use $e_k gt.eq m_k - h_(upright(b)) - D_k$ in (7.4) and sum the codes by (7.5). All terminal and decoration terms at fixed $K \, L$ are $O_K \( N \/ L \) + O \( 1 \)$. Let $sans(F)_t \( Xi \)$ be the existence of a realized regular code with this jump bound and occupancy $t$. Uniformly in the displacement,
  #[#set math.equation(numbering: n => "(7.7)")
   $ log bb(P)_m^W \( sans(F)_t \( Xi \) \) lt.eq - delta ell_R t + #scale(x: 120%, y: 120%)[\[] theta.alt h_(upright(b)) b + O_K \( L^(- 1) \) #scale(x: 120%, y: 120%)[\]] N + O \( 1 \) . $ <eq:fixed-stride-occupation>]
  The constants in the leading term are independent of $K$. This calculation retains the terminal errors explicitly; the asymptotic occupancy statement with $L = L_m arrow.r oo$ alone would not justify the present order of limits.
  For two displacements, each cell of one grid meets at most two cells of the other, hence $T_(upright("occ")) \( Xi \) lt.eq 2 T_(upright("occ")) \( Xi' \)$. If the maximum occupancy over displacements is large, it is at least half as large on every displacement, including the fixed positive fraction just used. Integrate (7.7) over the grid and sum over $t$. Then apply (7.3). It follows that, for a constant $C_1$ independent of $K$, the total log occupation is at most
  $ \[ C_1 + O_K \( L^(- 1) \) \] N $
  with $bb(Q)_m$-probability tending to one. The same bound applies to the occupation restricted to $cal(I)_N$.
  Here is the conversion to packing, which is the mechanism of #cite(label("P")) Lemma 11.4. A list chosen at a seed $y$ remains reachable throughout the coarser interval $\[ y - L \, y \]$. Use generation $ceil.l x \/ ell_R ceil.r$ boxes on each continuous log cell, trimming incomplete endpoint cells. They are active throughout $\[ y - L \, y \]$ for a seed rounded as above, and their integrated occupation is at most $ell_R T_(upright("occ"))$. If these boxes at level $x$ have diameter at most $c_(upright("box")) r_m \( x \)$, then its chosen terminals stay in distinct boxes throughout that interval whenever $H e^(- L) > 2 c_(upright("box"))$. Thus the truncated seed count contributes at least $L$ times that count to integrated occupation, apart from the two end intervals and a fixed-width endpoint strip. Averaging the independent mesh translation turns the seed sum into the uniform integral on $cal(I)_N$. On the occupation-exception event, bound the truncated packing by $M$. Dividing by $\| cal(I)_N \|$, the end error is at most $O \( M \( L + ell_R \) \/ \| cal(I)_N \| \)$. First let $m arrow.r oo$ for fixed $H \, L \, k \, M$; then take $H arrow.r oo$ and $L = L \( H \) arrow.r oo$ slowly with $H e^(- L) > 2 c_(upright("box"))$. The term $O_K \( L^(- 1) \)$ vanishes for each fixed $k \, M$, and the limiting bound is independent of them. This proves (7.6). ◻
]

#prodef([Lemma 7.4.])[
  (Few separated times at bounded reach).  #emph[Fix $a_0 > 1$, $c_0 \, C_0 \, zeta > 0$, and a finite integer $d$. Under the selected protocol with $r_m \( a_0 N \) arrow.r oo$, there is no sequence of selected laws supported on the existence of more than $e^(zeta N)$ times in the starting window, pairwise separated by at least $c_0 r_m \( N \)$, with one common member from which every member is reached by at most $d$ scalar links or jumps of size at most $C_0 r_m \( a_0 N \)$.]
] <lem:reachable-packing>

#proof[
  Choose fixed $1 < alpha < beta < a_0$ and apply Lemma 28 with one selected base and $cal(I)_N = \[ alpha N \, beta N \]$. For every $x in cal(I)_N$, the proposed jumps divided by $r_m \( x \)$ are at most $C_0 e^(- \( a_0 - beta \) N)$, while the proposed separation divided by $r_m \( x \)$ is at least $c_0 e^(\( alpha - 1 \) N)$. For a fixed enlargement of $d$, the proposed list is therefore contained in $cal(R)_(m \, k) \( x \)$ and is an $H$-packing for every fixed $H$, eventually uniformly in $x$. Select the base and only $M$ terminals with their witnesses before the grids. On the asserted event the truncated packing equals $M$ for every fixed $H \, M$ and all large $m$. Taking the limits in (7.6) and then choosing $M > C_(upright("pack"))$ is a contradiction. ◻
]

The other new use of the address budget replaces many nearby bases by one base and a wider range of smaller scales. For a connected component $C$ of the union of two colored graphs, the sum of the ranks of their restrictions to $C$ is at least $\| \| C - 1$. Call it #emph[acyclic] when equality holds and say it has a #emph[rank cycle] when the rank is at least $\| \| C$.

#prodef([Lemma 7.5.])[
  (One-base rank credit on a wide range).  #emph[There is a fixed $B > 2$ with the following property. Use a sparse address system from Proposition 27 with one base, upper range $B N$, and selected law (7.3). Fix $1 < a lt.eq 2$ and any deterministic $eta_m arrow.b 0$. The probability that the projected component containing the base has a rank cycle at all but $eta_m N$ generations with log level $k ell_R in \[ a N \, B N \]$ tends to zero.]
] <lem:one-base-credit>

#proof[
  The base is marked at every generation, so $b_k = 1$ and $m_k gt.eq 1$. At a generation where its component has a rank cycle, that component contributes one rank beyond a union spanning tree. Part (i) of Proposition 27 therefore gives
  $ e_k gt.eq m_k - D_k quad upright("there") \, #h(2em) e_k gt.eq m_k - 1 - D_k quad upright("at every other generation") . $
  On a regular grid with integrated jump error $o \( N \)$, the event in the statement consequently implies
  #[#set math.equation(numbering: n => "(7.8)")
   $ ell_R R_(upright("rk")) gt.eq ell_R T_(upright("occ")) - a N - o \( N \) \, #h(2em) ell_R T_(upright("occ")) gt.eq B N + O \( 1 \) . $ <eq:one-base-rank>]
  Here the first loss counts the generations before $a N$ and the exceptional high generations. Extra components separated by jumps have already been charged to $sum D_k$. A permitted growing enclosure shifts the log origin by $O \( log hat(C)_m \) = o \( N \)$; its extra ancestors are included in the same error.
  Fix $R$ and the errors so that the $delta$ in the proof of Lemma 28 is at least $\( theta.alt - 1 \) \/ 2$. Combining (7.4), (7.5), and (7.8), with the sparse errors $o \( N \)$, gives total log weight at most
  $ - delta ell_R T_(upright("occ")) + theta.alt a N + o \( N \) lt.eq - delta / 2 ell_R T_(upright("occ")) + (theta.alt a - frac(delta B, 2)) N + o \( N \) . $
  Choose $B$ with $delta B \/ 2 > 2 theta.alt$ by a fixed margin. The first negative term makes the sum over $T_(upright("occ"))$ geometric, and the remaining exponent is $- c N + o \( N \)$. Multiplication by $e^(kappa_m) = e^(o \( N \))$ preserves convergence to zero.
  This estimate was for regular grids. The cycle event itself depends on the grid, so its intersection with a positive fraction of grids is not automatic. Since $M_(upright("term")) = o \( N \)$, part (iv) provides $q_m = o \( N \)$ and $alpha_m arrow.r 0$ such that $bb(P)_Xi \( Delta \( Xi \) > q_m divides upright("markers") \) lt.eq alpha_m$. Let $E^(*)$ be the corresponding cycle event for the grid-independent partition, allowing $q_m$ additional exceptions. If $E \( Xi \)$ is the event in the statement, then
  $ bb(Q)_m \( E \( Xi \) \) lt.eq bb(Q)_m \( E^(*) \) + alpha_m . $
  For a second independent displacement $Xi'$, the conditional probability of being regular with jump error $o \( N \)$ and having $Delta \( Xi' \) lt.eq q_m$ is at least $1 \/ 2 - alpha_m$. On $E^(*)$, this implies the cycle event for $Xi'$ with another $q_m = o \( N \)$ exceptions. Hence
  $ \( 1 \/ 2 - alpha_m \) bb(Q)_m \( E^(*) \) lt.eq bb(Q)_m { E' \( Xi' \) \, med Xi' upright(" regular") } . $
  The preceding exponential estimate applies to the right side. This proves the lemma. ◻
]

For comparison, the many-base result already in #cite(label("P")) Proposition 10.18 uses fixed $1 < a < b$ with $a - 1$ sufficiently small relative to $\( theta.alt - 1 \) \( b - a \)$, and then a sufficiently large fixed $h_(upright(b))$. If those bases lie in a $C r_m \( N \)$ interval and are separated by more than the largest high-range cell width, the same all-but-$o \( N \)$ cycle event has probability tending to zero under the selected protocol. We use this source result in a narrow range and Lemma 30 in the wide range. The source’s additional restriction on $b - 1$ for its distance-length recursion is not a restriction of its address or finite-view inputs.

=== 7.2 Circuits with controlled traffic and support <circuits-with-controlled-traffic-and-support>

We next convert an acyclic contour view into a flow of surrounding circuits. We state the geometric part of the finite-view input separately from this new electrical conclusion.

#prodef([Lemma 7.6.])[
  (Retained data in an acyclic finite view).  #emph[Use the selected protocol, the packing bound (7.6), and the sparse all-seed cutoffs of Proposition 27. Fix $1 < a_0 < a < b$. Select and label the bases $1 \, dots.h \, h_(upright(b))$, and fix a deterministic label $iota in { 1 \, dots.h \, h_(upright(b)) }$, before the independent seed-generation mesh and address grids. The common all-seed trial array uses all distinguished bases and is the same for each fixed choice of $iota$; the conclusions below concern base $iota$. Use the finite-view construction with a uniform seed in $\[ a N \, b N \]$, freeze its centers, and then use its independent coarsening of log length $L_m arrow.r oo$. Its seed separation parameter $sans(H)_m arrow.r oo$ is chosen so that $L_m = o \( N and log sans(H)_m \)$. Write $X$ for the coarsened level. Removing an event of probability $o \( 1 \)$, $X in \[ a N \, b N \]$, and its density on that range is at most $C \/ N$. Retain the center graph and the acyclicity indicators of its base components in the common trial-array extraction, and follow the indicator for base $iota$; do not condition the view law after this sampling.]
  #emph[After a further joint extraction, the following holds on that acyclic event, with the fixed truncations and subsequent removal of losses specified below. Write $r = r_m \( X \)$ and $c_(m \, i)$ for the center origins. Two origins belong to the same scalar class of color $c$ when 
$ frac(Z^c \( c_(m \, i) \) - Z^c \( c_(m \, j) \), sqrt(r)) arrow.r 0 \, #h(2em) liminf_m frac(min_(\[ c_(m \, i) and c_(m \, j) \, thin c_(m \, i) or c_(m \, j) \]) Z^c - Z^c \( c_(m \, i) \), sqrt(r)) gt.eq 0 . $

 The combined graph is the union of these two colored class graphs.]
  + #emph[There are finitely many center lines in the base’s combined component, with tight count, and distinct origins diverge in $r_m \( X \)$ units. The base has a tight offset from its line origin in $r_m \( X \)$ units. Consecutive lines of each scalar class are joined by simultaneous actual scalar return links whose endpoints approach their origins in these units. For each such colored center pair, the preselected witness graph contains the same pair bit, with an actual seed witness whose endpoints have tight coordinates in seed units.]
  + #emph[A planar disk and an annular collar in an auxiliary sphere agree with the original primal map on all their incidences and complete stars needed for separation. Their full time preimages lie in retained intervals on the component’s lines. The inner disk contains the base walk for a time radius $delta_m r_m \( X \)$, and the full preimage of the closed outer disk has total length at most $M_m r_m \( X \)$. Here $delta_m^(- 1)$, $M_m$, and the number of lines are tight. The maximum absolute coordinate of every retained interval endpoint relative to its assigned line origin is tight in $r_m \( X \)$ units. For each fixed recipe truncation every retained slot and safety band has duration between fixed positive constants in view units.]
  + #emph[The annular collar admits a recipe in a countable family. For a fixed recipe its input consists of retained off-center block paths, forest shifts, durations, class anchors, and fixed instructions. Feasibility is measurable from that input. Its recorded port sets and confinement graphs use exact retained incidences; every allowed path between its ports lies in the prescribed outer tube. The cyclic transverse tube pattern forces any collection of successful recorded crossings to contain a simple circuit in the original patch whose interior contains the inner disk and whose closed disk lies in the outer disk. The recipe has a positive-density ordinary sphere completion of fixed positive duration after a fixed duration truncation.]
  #emph[All slots and guards used by the annular recipe avoid the distinguished center times. Its observation family is a countable family of fixed-recipe outputs chosen before the randomized class anchors; the anchors can enter feasibility and the later recipe selection.]
] <lem:finite-view-input>

#proof[
  The simultaneous saturation and all-seed construction in #cite(label("P")) Section 11 uses precisely (7.6), the sparse cutoffs, and the preselection event. Its order is as follows. First sample the independent log-mesh phase, taking $L_m = q_m ell_R$ with integer $q_m arrow.r oo$ as in the source; changing the chosen length by at most $ell_R$ preserves all displayed asymptotic conditions. Run the truncated recipe at every complete-cell endpoint. Let $P_N^(upright("seed")) = Theta \( N \/ L_m \)$ count these cells and let $Lambda_m$ bound one truncated seed list. Before the chronological grid is drawn, round the seed depths as in the source, leaving them distinct, and apply the terminal base-list augmentation at $J_R$. Coding then uses $P_N lt.eq P_N^(upright("seed")) + 1$ and $K_m = O \( Lambda_m + h_(upright(b)) \)$; the two sparse ratios remain vanishing because $h_(upright(b))$ is fixed. The independent mesh phase is held as side information in this count. Next draw the independent chronological grid, form one forest from all the lists, and round and freeze origins inside their coded terminal cells. Then choose uniformly among the original $P_N^(upright("seed"))$ complete cells, including fallback cells, and coarsen independently. This law differs from the stated uniform single-seed law by $O \( L_m \/ N \)$ in total variation; the fallback probability at that sampled cell vanishes along the sparse diagonal. There is no conditioning that every cell succeeded. Conditional on the independent phases, the chosen seed-generation trial is uniform among $P_N^(upright("seed")) q_m = Theta \( N \/ ell_R \)$ trials, including empty and deleted trials. For each of finitely many fixed residue classes of sufficiently spaced generations, the retained enlarged raw slots are disjoint after deletion. The deletion probability tends to zero by taking the discrete limit first and then the fixed ancestor padding to infinity. The address occupancy estimate gives an expected code length $O \( N \)$ under (7.3). Entropy allocation in each residue class, followed by their finite sum, gives bounded mean conditional entropy for this trial. Its preliminary selected-slot comparison is only a statement about continuum contour paths and finite height differences. It gives the stationary finite-line system without asserting a law for discontinuous lattice outputs. #cite(label("P")) Lemma 11.12 supplies the simultaneous actual return links and whole-gap margins. #cite(label("P")) Lemma 11.24 supplies the identical original and auxiliary patch, including full stars and full preimages. The inner and outer time-preimage bounds in (ii) are verified from this patch in the proof of #cite(label("P")) Proposition 11.30. The patch construction first bounds all relevant partner coordinates in a centered range $\[ - M \, M \]$ about their enrolled origins. The retained rational cuts are chosen about those origins, and a finite recipe truncation bounds the absolute values of their endpoint coordinates in view units. Finally #cite(label("P")) Lemma 11.27 constructs the countable retained-data recipes and their open fillability. The fixed-duration ordinary completion is the separate construction immediately preceding #cite(label("P")) Proposition 11.30. The source construction samples the class anchors after its fixed-recipe observation vector. All tight quantities can first be bounded by fixed constants with an arbitrary fixed loss; its finite data and sparse diagonals are then exhausted. ◻
]

Fix $d_m \, ell_m$ with $ell_m gt.eq 4 d_m$, a tested chronological window, an open planar confinement $U$, and a depth $D$. A step occurrence of an original edge means either of its two matched contour-step labels in the primal-tree and complementary-edge dictionary. A probability law $pi$ on simple original-edge circuits is #emph[available at $t$] if every circuit in its support has the following properties:

+ its open bounded interior contains the interpolated walk on $\[ t - d_m \, t + d_m \]$;
+ its closed disk contains no uninterrupted run of $ell_m$ consecutive walk steps in the tested window;
+ it is contained in $U$, and each of its edges has a step occurrence reached from $t$ by at most $D$ scalar links or jumps of size at most $ell_m$.

Here a simple circuit is an embedded Jordan circuit; a loop or a two-edge circuit is allowed. Its traffic is $tau_pi \( e \) = pi { C : e in C }$; circuits are simple, so each edge is counted at most once. At input level $N$ we require

#[#set math.equation(numbering: n => "(7.9)")
 $ d_m = r_m \( b N \) \, quad ell_m = r_m \( a_0 N \) \, #h(2em) sum_e tau_pi \( e \)^2 lt.eq e^(zeta N) \, $ <eq:available-traffic>]

with integer rounding and a fixed $zeta > 0$. The inequality $ell_m gt.eq 4 d_m$ holds eventually. A time is unavailable when there is no such law. The definition uses one fixed larger window for the run test, and all bases and enlargements have the prescribed spatial clearance there.

#prodef([Proposition 7.7.])[
  (Flow availability under selected laws).  #emph[Fix $zeta > 0$, a tested chronological window, and an open planar confinement $U$ with the preceding fixed-window and positive-clearance cutoffs. In the preceding definition of availability take $D = D_m$ and take $d_m \, ell_m$ to be the integer-rounded values in (7.9). Let $D_m arrow.r oo$ be deterministic and below the preselection depth bound, with any finite-view cutoffs slowed below it. Under (7.2), there is no sequence of selected laws supported on $h_(upright(b))$ unavailable times, pairwise separated by $ell_m$, in an interval of length at most $C r_m \( N \)$, in either of these fixed parameter regimes:]
  + #emph[$1 < a_0 < a < b$, with $a - 1$ sufficiently small relative to $\( theta.alt - 1 \) \( b - a \)$ and $h_(upright(b))$ sufficiently large as in #cite(label("P")) Proposition 10.18;]
  + #emph[$1 < a_0 < a lt.eq 2$, $b = B$ from Lemma 30, and $h_(upright(b)) = 1$.]
  #emph[The same statement holds for every fixed multiple of the interval length and every fixed positive confinement clearance.]
] <prop:flow-availability>

#proof[
  Suppose such selected laws exist. Mark and label the alleged unavailable bases before the independent seed mesh, address grid, and view sampling, and fix an arbitrary deterministic label $iota$ at that stage. Let $sans(S)_m$ denote the selected sampled-trial law on the common array and its successive extensions by the stated construction kernels for base $iota$. Let $sans(A)_m^(upright("acyc"))$ be the retained indicator from Lemma 31, belonging to the common trial marginal, that base $iota$’s combined center component is acyclic, and write $sans(A)^(upright("acyc"))$ for its extracted limit. The auxiliary extensions may depend on $iota$; no independence between extensions for different labels is used.
  Use Lemma 31 and restrict first to finitely many recipe indices and fixed duration, line-count, and margin bounds, losing an arbitrary fixed probability. For each fixed recipe, before its class anchors are drawn, record
  $ Y_(m \, s) = "EL" \( cal(P)_(m \, s) \) \, #h(2em) 1 lt.eq s lt.eq q \, $
  in raw unit-edge units, where $cal(P)_(m \, s)$ is its full family of paths between the recorded vertex ports in the recorded confinement graph. Use $+ oo$ for an empty family and compactify these coordinates. This is a function of the same exact incidence record and fixed intrinsic instruction, as required by Proposition 6.
  For each fixed recipe and fixed truncation, consider the compatible anchored selected subprobabilities constructed below, retaining $sans(A)_m^(upright("acyc"))$ as an extra coordinate. Let $nu$ be any weak limit of their pushforwards to normalized view coordinates, after the nuisance trial, unit, and parity labels are projected away at the step specified below. Write $c_0$ for the limiting intrinsic pre-anchor input, $a$ for its class anchors, and $y = \( y_s \)_(s = 1)^q$ for the extended-real electrical output in $\[ 0 \, oo \]^q$, retained through compactification. Let $F \( c_0 \, a \)$ be the fixed recipe’s anchored feasibility event in the retained limiting view of Lemma 31; its strict margins give the eventual lattice crossing interpretation. Our target is
  #[#set math.equation(numbering: n => "(7.10)")
   $ nu { sans(A)^(upright("acyc")) = 1 \, med F \( c_0 \, a \) \, med max_(1 lt.eq s lt.eq q) y_s = + oo } = 0 . $ <eq:selected-route-null>]
  This is a null statement for an unnormalized subprobability; no acyclic, compatibility, or successful-recipe probability is divided out.
  In an ordinary completion of the fixed duration, feasibility has a countable family of rational route witnesses. Work first with one such witness: choose compact endpoint balls inside its open ports and a compact connecting route inside its recorded open confinement. Finitely many ordinary charts off the auxiliary marks cover it. Theorem 11 gives a path law with finite squared traffic there. Full preimages and the strict inner/outer margins put its endpoints in the recorded ports and every used edge in the recorded graph for all large indices. The countable intersection covers every feasible witness. Therefore the limit of $Y_(m \, s)$ is finite on feasibility in every jointly extracted ordinary completion. This uses only the fixed-test electrical conclusion, for arbitrary diverging units and a fixed duration; neither its threshold nor its route constant has to be uniform over recipes.
  We spell out the transfer to the selected view. Let $c_(0 \, m)$ be the retained input before the class anchors are drawn, including the block paths, forest shifts, durations, fixed instructions, and the trial, unit, and parity parameters $theta_m$. Let $Y_m$ be the fixed electrical subvector above. In each residue trial the code and recipe fix the requested cuts, durations, and guard/noise search anchors before fresh letters; auxiliary choices have total conditional weight at most one. These search anchors precede the class anchors considered below. The shifts form the prescribed forests, and fixed truncation supplies positive safety bands and compact fitting ranges. Let $G_m^0$ be genuine raw-slot compatibility for this pre-anchor instruction. Use the pre-anchor marginal of $sans(S)_m$ in the following comparison, without conditioning on acyclicity or recipe success.
  Write $sans(R)_m^0 \( d c_0 \, d y \)$ for the independent raw-block reference law of this pre-anchor input and output, integrated against the same retained trial and parameter marginal as $sans(S)_m$, and set $sans(S)_m^0 \( B \) = sans(S)_m { G_m^0 \, \( c_(0 \, m) \, Y_m \) in B }$. The finite domination part of Lemma 8, followed by the bounded all-seed trial entropy, gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ sans(R)_m^0 \( B_m \) arrow.r 0 quad arrow.r.double quad sans(S)_m^0 \( B_m \) arrow.r 0 . $ <eq:pre-anchor-tac>]
  This is tight absolute continuity of the compatible #emph[subprobability] law; no division by the compatibility mass occurs. The comparison sees the lattice output $Y_m$, whereas the preliminary comparison in Lemma 31 only concerned continuum contours.
  After the entire pre-anchor selected sample, including its full fixed observation vector, draw the finite class-anchor vector $a_m$. Its translation may depend on $Y_m$. First restrict to finitely many anchor counts and compact height ranges, keeping these restrictions unnormalized. Its conditional density given that entire sample is bounded, as in #cite(label("P")) Lemma 11.25. Choose a positive smooth reference anchor density, with its scaled feasible-lattice version $𝜚_(m \, theta_m) \( d a \)$. The lattice law is expressed relative to covolume-normalized counting measure; on the compact truncation its density is uniformly bounded below. On those ranges the restriction of the actual conditional anchor law is therefore bounded above by $C 𝜚_(m \, theta_m)$. The same bound given $\( c_(0 \, m) \, Y_m \)$ follows by conditional expectation. The reference anchors are independent of $Y_m$ conditional on the recorded $theta_m$.
  Here is the sectional argument, applied without normalizing $sans(S)_m^0$. Let $sans(S)_m^a$ be the joint selected subprobability after adjoining $a_m$, restricted to $G_m^0$ and the chosen anchor-count and height ranges, and put
  $ sans(R)_m^a \( d c_0 \, d y \, d a \) = sans(R)_m^0 \( d c_0 \, d y \) 𝜚_(m \, theta \( c_0 \)) \( d a \) . $
  For an event $B_m$ with $u_m = sans(R)_m^a \( B_m \) arrow.r 0$, let $p_m \( c_0 \, y \) = 𝜚_(m \, theta \( c_0 \)) { a : \( c_0 \, y \, a \) in B_m }$. Markov’s inequality gives $sans(R)_m^0 { p_m > sqrt(u_m) } lt.eq sqrt(u_m)$, while the conditional anchor bound gives
  $ sans(S)_m^a \( B_m \) lt.eq sans(S)_m^0 { p_m > sqrt(u_m) } + C sqrt(u_m) arrow.r 0 $
  by (7.11). This is the proof of #cite(label("P")) Lemma 11.25, including its scaled-lattice form. It allows the actual anchors to depend on the output. Apply it separately to each fixed finite recipe vector; the countable null intersection and the preceding finite recipe truncation handle the later recipe selection.
  Before taking the kernel limit, project away the trial index and raw unit/parity labels after expressing the retained paths, shifts, durations, and anchors in normalized view units. Tight absolute continuity survives this pushforward. The fiberwise anchor reference laws are lattice discretizations of one fixed smooth law $𝜚$; on each normalized compact they converge to $𝜚$ uniformly over the allowed unit and parity parameters as the minimum unit diverges. The normalized reference factorization of #cite(label("P")) Theorem 7.10 and Proposition 6 therefore gives the independent-anchor limit law $mu_0 \( d c_0 \) K_(c_0) \( d y \) 𝜚 \( d a \)$. The positive ordinary filling argument, applied to augmented input $\( c_0 \, a \)$, gives the retained subprobability law
  $ f \( c_0 \, a \) thin mu_0 \( d c_0 \) 𝜚 \( d a \) K_(c_0) \( d y \) \, #h(2em) f \( c_0 \, a \) > 0 quad upright("on ") F . $
  As in (3.17), $f$ integrates the strict omitted filling and its input-dependent density weight, so it has no $y$ argument. The ordinary finiteness proved above yields
  $ 0 = integral f \( c_0 \, a \) upright(bold(1))_(F \( c_0 \, a \)) K_(c_0) { max_s y_s = oo } thin mu_0 \( d c_0 \) 𝜚 \( d a \) . $
  Positivity of $f$ makes the anchored feasibility/infinite-cost event null for the independent-anchor reference product. The post-anchor tight absolute continuity just proved transfers this null event to the selected anchored limit on compatibility. Every successful selected recipe has $G_m^0$ by its construction from the actual compatible raw instructions. The projection of $nu$ restricted to ${ sans(A)^(upright("acyc")) = 1 }$ is a submeasure bounded by this compatible anchored marginal, so (7.10) follows without a kernel or independence assertion for the indicator. Only the independent-anchor reference and ordinary filling laws use the displayed output kernel $K_(c_0)$; the selected anchored law is used through tight absolute continuity.
  All comparisons through the anchor step are finite lattice comparisons at fixed recipe, guard, duration, shift, anchor-count, and height truncations. Their effective slot lengths diverge because $r_m \( b N \) arrow.r oo$. Apply them in each joint extraction with $r_m \( X \)$ and its recorded unit parameters; the normalized reference construction and the scaled-lattice anchor argument apply to these varying laws. The ordinary finiteness assertion holds for every such extraction, so the argument also covers mixtures over $X$, as in #cite(label("P")) Proposition 7.18. The anchor restrictions are exhaustible under the selected law: on a fixed line-count and centered-oscillation truncation, the completion assigns class heights $H_A = \( 4 K_0 + 10 \) s \( A \) + u_A$, with $1 lt.eq s \( A \) lt.eq k$ and $\| u_A \| < 1$, where $K_0$ bounds the retained centered oscillations. Bounding $k$ and $K_0$ bounds these normalized heights; bounded density alone is not used for their tightness. Fix the finite recipe list and the other stated truncations. By the strict certificate limits in #cite(label("P")) Lemma 11.27, (7.10) gives vanishing unnormalized selected mass for the finite-threshold cost failure of a successful retained recipe, first as $m arrow.r oo$ and then as the cost threshold tends to infinity. Only afterward exhaust the finite recipe and truncation losses. No slot meets the center, and feasibility has no omitted filling as an argument. This is the restricted tightness of $sum_s Y_(m \, s)$ used below.
  By Lemma 10, choose a near-minimizing path law for each $cal(P)_(m \, s)$ with squared traffic at most $Y_(m \, s) + 1$. Sample those paths and select a simple surrounding circuit from their union. Every sample works by the recipe’s transverse pattern. If its traffic is $tau$ and the path traffics are $tau_s$, then
  $ tau \( e \) lt.eq sum_(s = 1)^q tau_s \( e \) \, #h(2em) sum_e tau \( e \)^2 lt.eq q sum_(s = 1)^q sum_e tau_s \( e \)^2 . $
  On each fixed truncation, its unnormalized upper tail is controlled by the restricted cost estimate. Since $e^(zeta N) arrow.r oo$, the corresponding traffic-failure mass tends to zero.
  The inner and outer preimage bounds in Lemma 31(ii) give the two disk conditions. The event $b N - X lt.eq sqrt(N)$ has probability $O \( N^(- 1 \/ 2) \)$. Outside it, $delta_m r_m \( X \) \/ r_m \( b N \) arrow.r oo$ after the fixed tightness truncation. Also
  $ frac(M_m r_m \( X \), r_m \( a_0 N \)) lt.eq M_m e^(- \( a - a_0 \) N) arrow.r 0 . $
  Every uninterrupted visit in a closed circuit disk, including a run on its edges, belongs to the full outer preimage, so it has length less than $ell_m$. These conclusions apply to every circuit in the constructed law.
  They also have the required support reach from the #emph[given] base. If its combined component has $K$ lines, a simple path of consecutive scalar-class connections from the base line to any retained line uses at most $K - 1$ actual return links. Interleaving jumps on those lines and a final jump to a retained edge occurrence uses at most $2 K + O \( 1 \)$ steps, each jump bounded by a tight multiple of $r_m \( X \)$. The same finite return witnesses work for every occurrence in every retained interval. All path support is in the protected patch, whose complete time preimages are on those intervals. Since $r_m \( X \) \/ r_m \( a_0 N \) lt.eq e^(- \( a - a_0 \) N)$, the jumps are eventually at most $ell_m$, and tight $K$ is eventually below the diverging $D_m$. The master event and its complete-star mesh bound put the entire supported edges in the required confinement. Combining these vanishing disk and support errors with the restricted cost estimate and then exhausting the fixed losses gives
  $ sans(S)_m #h(-0.16667em) ({ sans(A)_m^(upright("acyc")) = 1 } ∩ { upright("base ") iota upright(" is unavailable") }) arrow.r 0 . $
  Here unavailable means failure of a law satisfying (a)–(c) and (7.9). Under the selected laws assumed for contradiction, base $iota$ is unavailable with probability one, hence $sans(S)_m { sans(A)_m^(upright("acyc")) = 1 } arrow.r 0$.
  It remains to use the address charge. The bases in (i) are $ell_m$-separated, whereas high-range cell widths are $O \( r_m \( a N \) \) = o \( ell_m \)$; the same remains true along the permitted sparse enclosure diagonal. The later return links certify colored center-pair bits in the saturated graph. For each such bit the all-seed code retained an earlier chosen actual seed witness and jumps associating its endpoints to the corresponding original pre-grid seed centers. The association jumps cost $o \( N \)$ split generations. A base has a tight seed offset from its original pre-grid seed center. On a fixed offset truncation, the independent-grid probability that they are separated after coarsening by $U$ is $O \( min { 1 \, e^(- U) } \)$, whose average for $U tilde.op "Unif" \[ 0 \, L_m \]$ is $O \( L_m^(- 1) \)$. Thus only $o \( N \)$ further trial generations fail, in probability. Rounding an origin preserves its seed center’s terminal cell and all its ancestors. Outside these exceptions the centers, witness endpoints, and bases have the corresponding projected cells. Thus a rank cycle of a center component is a rank cycle in the projected base component. Adding further connected vertices cannot destroy it, since a union spanning tree gains at least one total monochrome rank per added vertex. Apply this argument separately to each fixed label $iota$ on the common trial array. Let $E_(m \, iota)$ count generations $k ell_R in \[ a N \, b N \]$ at which its projected base component lacks a rank cycle. After including the conversion exceptions above, averaging the vanishing acyclic probability over the uniform seed-generation trials and applying Markov’s inequality gives $E_(m \, iota) \/ N arrow.r 0$ in probability under the common selected array law. Since $h_(upright(b))$ is fixed, $N^(- 1) sum_(iota = 1)^(h_(upright(b))) E_(m \, iota) arrow.r 0$ in that same probability. The number of generations exceptional for at least one label, divided by $N$, is bounded by this normalized sum. Outside that union every projected base component has a rank cycle. Choose a deterministic $eta_m arrow.b 0$ so that the exceptional count is at most $eta_m N$ with probability tending to one. This is the cost-independent witness conversion in the proof of the circuit-sparsity result in #cite(label("P")) Section 12.
  In regime (i) this contradicts #cite(label("P")) Proposition 10.18. In regime (ii) it contradicts Lemma 30. The latter uses only fixed $B$ and $r_m \( B N \) arrow.r oo$; the distance normalization and the narrow length-recursion restriction in #cite(label("P")) were not used. Removing the arbitrary finite truncation losses proves the proposition. ◻
]

=== 7.3 Uniform levels and circuit covers <uniform-levels-and-circuit-covers>

We pass from the selected-law contradictions to one event for many levels. Let the tested levels lie in a finite union of fixed-spaced lists and their fixed positive multiples, all starting at $N_0 \( m \) arrow.r oo$. Assume the minimum units in each used view diverge uniformly. Choose the master event before selecting any level, with $sigma_m$ a fixed multiple of $e^(- N_0 \( m \))$.

If a union of failures has probability at least $delta > 0$, take the master loss smaller than $delta \/ 4$. Since the sum of $\( N + 1 \)^(- 2)$ over these lists is bounded, some deterministic level $N$ has failure together with that same master event of probability at least $c delta \( N + 1 \)^(- 2)$. Conditioning on this event gives raw-word density at most its reciprocal: indeed the conditional event probability given the word is at most one. Its logarithm is $O_delta \( log \( N + 1 \) \) = o \( N \)$. Choose the failing bases or truncated witnesses afterwards and the independent grids last. Proposition 32 or Lemma 29 contradicts this selection. This is the weighted-level argument of #cite(label("P")) Lemma 12.5, now applied to fixed-spaced lists as well.

For packing, do this first for every fixed reach depth. A deterministic diagonal then gives a depth tending to infinity slowly enough that all these union probabilities still vanish, and still below the master bound. Use a fixed fraction of it for circuit support, leaving room for two access chains and a bounded number of extra steps. Proposition 32 allows this slower diverging depth. A finite list of scale multiples is handled by the same diagonal. Exhausting the fixed master and clearance losses, we henceforth work on events of probability $1 - o \( 1 \)$ where these conclusions hold at every used level. This uniformity comes from the address argument; it is not an assertion about the thresholds in Theorem 11.

Here is the resulting overlap bound. At a primary level $N$ put $T = r_m \( N \)$. Consider disjoint blocks of lengths between fixed multiples of $T$, and a fixed-multiple enlargement $hat(I)$ of each. For each available test which will be used from a time in $hat(I)$, choose one witnessing flow independently of $f$. Let $W_I$ contain all edges in those flow supports and all chronological walk edges in $hat(I)$. The recursive tests below have input $y gt.eq N$, so their support jumps are at most $r_m \( a_0 y \) lt.eq r_m \( a_0 N \)$; a wide test started at $N$ has the same bound. The master event and the fixed clearance put these sets in $G_m^(+)$.

#prodef([Lemma 7.8.])[
  (Overlap of the energy sets).  #emph[At every such level with uniformly diverging view units, the common event above can be chosen so that, for every family of disjoint blocks and every vertex function, 
#[#set math.equation(numbering: n => "(7.12)")
 $ sum_I cal(E)_m \( f \; W_I \) lt.eq C e^(N \/ 40) cal(E)_m \( f \; G_m^(+) \) . $ <eq:energy-overlap>]

 At levels where only chronological edges are used, the same statement holds with a constant in place of $C e^(N \/ 40)$.]
] <lem:energy-overlap>

#proof[
  Fix an edge $e$ belonging to several $W_I$. From those blocks retain a sublist whose enlargements are separated by a fixed multiple of $T$, losing only a fixed factor. For each retained block choose the responsible time in $hat(I)$; it reaches a step occurrence of $e$ with the chosen depth and jump bound, or is itself such an occurrence for a chronological edge.
  By the dictionary of incidence occurrences in #cite(label("C")) Proposition 3.1 and Lemma 3.2, each original edge has the two contour steps of one matched burger/order pair: $L$-pairs represent primal-tree edges, while the quadrangles of $R$-pairs carry the complementary primal edges. The convention includes loops, bridges, and repeated incidences. If the up-step ends at $u$ and its matching down-step ends at $v$, their scalar baselines satisfy
  $ Z \( u - 1 \) = Z \( v \) lt.eq min_(u - 1 lt.eq s lt.eq v) Z \( s \) . $
  Thus $\( u - 1 \, v \)$ is an actual scalar link; either step occurrence is within one time step of the corresponding endpoint. One link and at most two unit jumps join its two occurrences, including for loops and parallel edges. The units $r_m \( a_0 N \)$ diverge whenever a circuit is used, so these unit jumps are allowed. Joining through $e$ therefore reaches every responsible time from the first within twice the support depth plus a fixed number of steps. The times are $c T$-separated. The simultaneous version of Lemma 29, with $zeta = 1 \/ 40$, bounds their number by $e^(N \/ 40)$. This bounds the multiplicity of each edge in the left side.
  For chronological-only sets, the enlarged intervals have bounded time overlap, and the primal tree tour traverses a tree edge at most twice. Their edge multiplicity is bounded. Summing the edgewise bounds proves the lemma. ◻
]

We use the following deterministic fact about a nearest-neighbor walk $v$ in a planar graph, interpolated along its edges. For a circuit $C$, put $"var"_f \( C \) = sum_(e in C) \| d f \( e \) \|$.

#prodef([Lemma 7.9.])[
  (Covering and joining a chronological segment).  #emph[Let $d gt.eq 1$, $ell gt.eq 4 d$, and $h_(upright(b)) gt.eq 1$ be integers. An integer $t$ is called good if it has a simple circuit in $U$ with $"var"_f \( C \) lt.eq L$, whose open interior contains $v \( \[ t - d \, t + d \] \)$, and whose closed disk contains no run of $ell$ steps in the tested window. There is a constant $K_(h_(upright(b)))$, depending only on $h_(upright(b))$, with the following property. Suppose an interval $I$ of at most $T$ steps has no $h_(upright(b))$ pairwise $ell$-separated bad times, and the walk on a $K_(h_(upright(b))) ell$ enlargement stays in $U$, with that enlargement inside the tested window. Then:]
  + #emph[At most $K_(h_(upright(b))) \( 1 + T \/ d \)$ good circuits cover the walk on $I$ by their open interiors except for at most $K_(h_(upright(b)))$ chronological intervals, each of length at most $K_(h_(upright(b))) ell$.]
  + #emph[There are graph paths in $U$ with total $\| d f \|$-cost at most $K_(h_(upright(b))) \( 1 + T \/ d \) L$ which, together with at most $K_(h_(upright(b)))$ unresolved endpoint pairs separated by at most $K_(h_(upright(b))) ell$, join the endpoints of the walk on $I$. All unresolved times lie in that enlargement.]
] <lem:segment-cover>

#proof[
  A maximal $ell$-separated set of bad times has at most $h_(upright(b)) - 1$ elements. Their $ell$-neighborhoods cover the bad times and, after merging, have total length $O \( h_(upright(b)) ell \)$. The complement is a union of at most $h_(upright(b))$ good integer runs. In each run choose its endpoints and good times spaced at most $d$. Their number is at most $2 + T \/ d$ per total run length, and their open interiors cover the complete interpolated run. Enlarging the deleted intervals by a bounded number of steps handles the endpoints and proves (i).
  For (ii), in a good run retain the chosen disks maximal for inclusion. Consecutive original interiors overlap, so the maximal interiors have connected intersection graph. Two overlapping incomparable Jordan disks have intersecting boundaries. Their boundary union is consequently a connected subgraph with total $\| d f \|$-cost at most the sum of the chosen circuit costs. The run’s first vertex reaches the boundary of a disk containing it within $ell + 1$ forward steps, and its last vertex does so within $ell + 1$ backward steps, by the no-run condition. A hit is at a graph vertex, since the walk and circuit use the same embedded graph. Join the two hits in the boundary union. Concatenating these connections across the good runs leaves only the deleted intervals and at most two such exit lengths at each gap. Their number and lengths have the asserted bounds. If there is no good run, use the one unresolved endpoint pair. This is the additive-cost proof of #cite(label("P")) Lemma 12.2; it applies to the nonnegative edge costs $\| d f \|$. ◻
]

Choose the scale constants now. Take $B$ from Lemma 30, choose

$ 0 < u < 10^(- 5) \/ B \, #h(2em) b = 1 + u \, $

and then choose

$ 1 < a'_0 < a_0 < a < b $

with $a - 1$ small enough for regime (i) of Proposition 32. Fix the corresponding $h_(upright(b))$. Use $zeta = u$ both in this narrow test and in the wide test with upper endpoint $B$. These choices are fixed. Each narrow available law at input $y$, supported in $W_I$, supplies a circuit with

#[#set math.equation(numbering: n => "(7.13)")
 $ "var"_f \( C \) lt.eq e^(u y \/ 2) sqrt(cal(E)_m \( f \; W_I \)) . $ <eq:one-circuit-bill>]

Indeed the expected variation is the inner product of traffic with $\( \| d f \( e \) \| \)_e$, so Cauchy–Schwarz gives this bound for at least one circuit. This circuit may depend on $f$; the support set $W_I$ does not.

Consider first

#[#set math.equation(numbering: n => "(7.14)")
 $ N lt.eq \( 4 B \)^(- 1) log m . $ <eq:coarse-range>]

Apply Lemma 34(i) at input $y = N$ to a block $I$ of $O \( r_m \( N \) \)$ steps. Its circuits cover all but a bounded number of intervals of length $O_(h_(upright(b))) \( r_m \( a_0 y \) \)$. For large $y$ each fits in an interval of length $r_m \( a'_0 y \)$. Apply the same construction there with new input $a'_0 y$. Continue until the new input would be at least $B N$. This takes a fixed number of stages, since $a'_0 > 1$ and $B$ are fixed. At the last stage each remaining interval has length $o \( r_m \( B N \) \)$. The wide, one-base test started at $N$ is available at every time, so constantly many of its circuits cover each remaining interval.

At a stage with input $y$, the number of circuits per current interval is $O_(h_(upright(b))) \( 1 + e^(u y) \)$, and its circuit bill is bounded by (7.13). The number of current intervals grows by only a fixed factor at each of a fixed number of stages. Since every narrow input is less than $B N$, the total bill is at most

$ C_(B \, u \, h_(upright(b))) e^(5 u B N) sqrt(cal(E)_m \( f \; W_I \)) lt.eq e^(N \/ 10) sqrt(cal(E)_m \( f \; W_I \)) $

for all sufficiently large $N$. The final wide circuits have bill $e^(u N \/ 2) sqrt(cal(E)_m \( f \; W_I \))$ and fit the same bound. Every disk used has a run cap at most

$ r_m \( a_0 N \) = e^(- \( a_0 - 1 \) N) r_m \( N \) = o \( r_m \( N \) \) . $

Discard any disk whose open interior misses the walk on $I$, and retain the disks maximal for inclusion. An open cover of a connected walk has connected intersection graph. The Jordan argument in Lemma 34 therefore makes the union $S_I \( f \)$ of these maximal boundaries a connected subgraph. It follows that

#[#set math.equation(numbering: n => "(7.15)")
 $ "osc" \( f \; S_I \( f \) \) lt.eq e^(N \/ 10) sqrt(cal(E)_m \( f \; W_I \)) . $ <eq:boundary-oscillation>]

This is a cover of the whole walk by open interiors, with the no-long-run property for every closed disk. It has not paid to join an individual interior vertex to a boundary.

For the remaining levels, $N > \( 4 B \)^(- 1) log m$, we instead obtain

#[#set math.equation(numbering: n => "(7.16)")
 $ "osc"_(i in I) f \( v \( i \) \) lt.eq e^(N \/ 10) sqrt(cal(E)_m \( f \; W_I \)) . $ <eq:point-oscillation>]

If $N > \( 1 - 4 u \) log m$, a chronological path in the block has at most $O \( 1 + m^(4 u) \)$ edges, with bounded multiplicity. Cauchy–Schwarz gives a bill $O \( m^(2 u) \) sqrt(cal(E)_m \( f \; W_I \))$. Otherwise apply Lemma 34(ii) at input $y = N$ to any two cuts to be joined. Its bill is

$ C_(h_(upright(b))) \( 1 + e^(u y) \) e^(u y \/ 2) sqrt(cal(E)_m \( f \; W_I \)) \, $

and only a bounded number of pairs of separation $O_(h_(upright(b))) \( r_m \( a_0 y \) \)$ remain. Repeat at input $a'_0 y$ until it exceeds $\( 1 - 4 u \) log m$, and then use chronological paths on the remaining pairs. The number of stages is bounded in terms of $B \, u \, h_(upright(b))$, since the ratio of the final input to the first is at most $4 B$. The total circuit bill is at most $C m^(3 u \/ 2) sqrt(cal(E)_m \( f \; W_I \))$, and the terminal bill at most $C m^(2 u) sqrt(cal(E)_m \( f \; W_I \))$. Both are eventually bounded by the right side of (7.16), because $e^(N \/ 10) gt.eq m^(1 \/ \( 40 B \))$ and $2 u < 1 \/ \( 40 B \)$. All unresolved pairs stay in a fixed-multiple enlargement of the original block.

These uses meet the diverging-unit condition for the common level event. In (7.14), the finest narrow level is less than $2 B N$ and the wide level is $B N$, so the minimum units are at least $m^(1 \/ 2)$. In the fine recursion $y lt.eq \( 1 - 4 u \) log m$, the finest narrow level is $\( 1 + u \) y$; its minimum units are at least $m^(3 u + 4 u^2)$. The levels used are a fixed finite list of multiples of the primary levels. At still finer levels only the chronological bound is used. Thus (7.12)–(7.16) hold together for all levels starting at any deterministic $N_0 \( m \) arrow.r oo$, with probability tending to one after the fixed cutoffs are exhausted.

=== 7.4 The dyadic estimate and its threshold <the-dyadic-estimate-and-its-threshold>

Let $cal(K)_m^(upright("act"))$ denote a fixed activation cutoff for a bilateral protected interval: its cut length divided by $m$ lies between fixed positive constants, its labels lie in a fixed chronological window, and its limiting image has a fixed positive margin inside the intermediate neighborhood recorded by $G_m^(+)$. The preceding probability statements are uniform over all interval starts and roundings on this cutoff. Indeed their unavailable-time events range over every interval in that window and their packing bounds range over arbitrary lists. The master event contains every fixed-multiple enlargement.

At dyadic level $j$, use primary input $N = j log 2$. Nonterminal block lengths are between fixed multiples of $r_m \( N \)$, with bounded integer rounding. For a block in the regime (7.14), choose $F_I$ to be $f$ at any vertex of $S_I \( f \)$. For a block in the pointwise regime choose its value at any occurrence in $I$. For a child $I'$ of $I$,

#[#set math.equation(numbering: n => "(7.17)")
 $ \| F_(I') - F_I \| lt.eq C e^(N \/ 10) (sqrt(cal(E)_m \( f \; W_(I') \)) + sqrt(cal(E)_m \( f \; W_I \))) . $ <eq:parent-child>]

Here is the needed comparison when boundaries are used. Suppose both blocks have interior covers but their maximal boundary unions are disjoint. Fix one point of the child walk and choose from each cover a disk whose open interior contains that point. With disjoint boundary unions the two disks would be nested. The connected boundary union of the inner family, avoiding the outer boundary, lies entirely in the containing disk. Every bounded Jordan disk with boundary there also lies there. Hence that family’s entire covered walk lies in one disk of the other family. In either nesting direction this contains the child walk, whose length is a fixed multiple of $r_m \( N \)$, contrary to the disk’s $o \( r_m \( N \) \)$ run cap. If the parent has a boundary cover and the child is in the pointwise regime, a child walk missing the parent boundaries would similarly stay in a single parent disk, again impossible. A boundary hit includes a common graph vertex. Comparing at that vertex by (7.15) and (7.16) proves (7.17). If both blocks are pointwise, compare at any common child occurrence. The cover regime has diverging block lengths, so rounding cannot affect the run-cap comparison.

Let $g_j \( i \) = F_I$ on each level-$j$ block. Give each cut mass $1 \/ m$. A child block has mass $O \( e^(- N) \)$. Squaring (7.17), summing its child and parent energies, and using (7.12) at the two levels gives

#[#set math.equation(numbering: n => "(7.18)")
 $ lr(bar.v.double g_(j + 1) - g_j bar.v.double)_(L^2 \( I_m \, m^(- 1) \))^2 lt.eq C e^(\( - 1 + 1 \/ 5 + 1 \/ 40 \) N) cal(E)_m \( f \; G_m^(+) \) = C e^(- 31 N \/ 40) cal(E)_m \( f \; G_m^(+) \) . $ <eq:successive-blocks>]

The last singleton function is exactly $i mapsto f \( v \( i \) \)$. The sum of the square roots of the right sides of (7.18) is geometric in $j$. Minkowski’s inequality therefore gives

$ lr(bar.v.double f \( v \( dot.op \) \) - g_j bar.v.double)_(L^2 \( I_m \, m^(- 1) \))^2 lt.eq C' 2^(- 31 j \/ 40) cal(E)_m \( f \; G_m^(+) \) . $

Orthogonal projection minimizes this error, so the same bound holds with $P_j^(I_m) f$ in place of $g_j$. Since $31 \/ 40 > p = 7 \/ 10$, the constant $C'$ can be absorbed by increasing the starting level. The auxiliary circuit choices depended on $f$, but $W_I$ and their overlap event did not, and the final projection is linear. The conclusion is simultaneous in all $f$.

In particular, for every deterministic $j_0 \( m \) arrow.r oo$,

#[#set math.equation(numbering: n => "(7.19)")
 $ bb(P) #h(-0.16667em) (cal(K)_m^(upright("act")) ∩ mat(delim: "{", exists j gt.eq j_0 \( m \) \, med exists f :; 1 / m sum_(i in I_m) \| f \( v \( i \) \) - \( P_j^(I_m) f \) \( i \) \|^2 > 2^(- p j) cal(E)_m \( f \; G_m^(+) \))) arrow.r 0 . $ <eq:bilateral-all-level-failure>]

This follows from the common level event above; if $j_0$ is beyond singleton scale the assertion is immediate. Letting the arbitrary master losses vanish and exhausting the fixed window, duration, and clearance cutoffs gives the assertion locally on activation.

Define $frak(j)_m$ to be one past the largest level at which the failure inequality in (7.19) holds, with value zero if there is none. It is finite because the projections are eventually the identity. The sequence $frak(j)_m$ is tight on each fixed activation cutoff. Indeed, if for some $delta > 0$ it were not tight, one could choose $m_k arrow.r oo$ and $J_k arrow.r oo$ with $bb(P) \( cal(K)_(m_k)^(upright("act")) ∩ { frak(j)_(m_k) > J_k } \) > delta$. Choose a deterministic schedule $j_0 \( m \) arrow.r oo$ slowly enough that $j_0 \( m_k \) lt.eq J_k$. This contradicts (7.19). Thus the threshold is tight #emph[before] any sphere transfer. Separate estimates at each fixed $j$ would not have implied this conclusion.

=== 7.5 Transfer of the threshold to sphere charts <transfer-of-the-threshold-to-sphere-charts>

We finish the proof of Theorem 26. For one fixed protected instruction, compute $frak(j)_m$ from the exact graph $G_m^(+)$, its identified interval vertices, and its integer block partitions. For a given $j$, failure for some vertex function is a finite-dimensional quadratic comparison: after fixing the vertex labels it asks whether a specified symmetric matrix is positive semidefinite. Hence $frak(j)_m$, compactified in $\[ 0 \, oo \]$, is a measurable numerical readout of that finite record. It uses relative cut labels and the common deterministic unit $m$, with no absolute tour origin, omitted-gap duration, or unrecorded edge.

Choose its energy graph using an inner time-cell cover which contains every star over a compact neighborhood of the interval image, and whose closure is still in the larger protected chart. The paid $W_I$ lie in that inner neighborhood on the master events. Exact reconstruction with the intermediate margins identifies every tested vertex and edge. Adding other correctly reconstructed edges only enlarges the right side. Such choices form a cofinal countable family by full-preimage compactness, and activation depends only on the limiting local data and relative order. The observation can have an arbitrary default off activation.

In every joint bilateral extraction the compactified limit of $frak(j)_m$ is finite on activation. To see this directly when the activation itself is random, suppose a positive part of an activated event had limit $+ oo$. Restrict it to finitely many positive-clearance, duration, and chronological cutoffs with still positive probability. The strict geometric conditions hold eventually in the representation coupling. A sufficiently slowly diverging deterministic $j_0 \( m \)$ would then leave $frak(j)_m > j_0 \( m \)$ with positive probability on that part, contradicting the bilateral bound just proved.

Proposition 6 applies to this intrinsic exact-record output. Proposition 7 then transfers, on activation, the nullity of the event that the extracted threshold equals $+ oo$ to strict ordinary sphere interiors, using the common conditional kernel and the actual field and traversal order. Equivalently this is the support-transfer use of #cite(label("P")) Theorem 7.13 and Lemma 18.1. No microscopic circuit event is transferred at this stage. In a representation coupling, convergence of the compactified threshold to a finite value makes $frak(j)_m$ eventually bounded. The definition of $frak(j)_m$ gives (7.1), even with $C = 1$, for that entry. Countable intersection gives the simultaneous atlas statement.

Finally take the two-rooting extraction in Proposition 5. Its ordinary off-root neighborhoods, with the separately chosen auxiliary mark pairs, cover the sphere. Choose finitely many compact sets $K_s$ whose interiors cover the sphere and whose closures have room inside those neighborhoods. For the root assigned to $K_s$, its full time preimage is a compact subset of the interiors of finitely many used blocks. Cover that preimage by interiors of finitely many relative rational intervals whose closures stay in individual used interiors. Compactness gives a positive time margin for this cover. These positive-length intervals are entries of the atlas just treated.

There is a uniform positive spatial margin such that every sphere point lies that far inside at least one $K_s$. For a discrete corner occurrence choose such an $s$ at its physical position, and express the occurrence in that set’s rooted order. Uniform tour tracking puts its limiting tour position in $K_s$ for all large $n$, simultaneously for all occurrences. The time-cover margin and integer rounding then put its cut in one of the chosen intervals. Thus every occurrence is covered, including repeated occurrences of a vertex. The finite maximum of their eventually bounded thresholds is finite. This proves the final assertion of Theorem 26.

== 8 The continuum form and its Green operator <sec:continuum>

The electrical limit identifies the round Dirichlet integral. We now put this integral on the quantum area space and construct its inverse. This also verifies the existence and the positive-time finiteness of the continuum heat trace that occurs in Theorem 1.

Fix a conformal sphere coordinate for the ordinary unit-area $sqrt(3)$-quantum sphere of Proposition 5. Write $d_0$ and $upright("vol")_0$ for round distance and round volume on $bb(S)^2$, and put

$ sigma_0 = frac(upright("vol")_0, upright("vol")_0 \( bb(S)^2 \)) \, #h(2em) cal(E)^0 \( f \, g \) = integral_(bb(S)^2) nabla f dot.op nabla g thin upright(d) upright("vol")_0 \, #h(2em) cal(E)^0 \( f \) = cal(E)^0 \( f \, f \) . $

We use the usual round $H^1$ norm and write $sigma_0 \( f \) = integral f thin upright(d) sigma_0$. The superscript $0$ records the absence of a factor $1 \/ 2$. The form in the theorem will be $cal(E)_h = 1 / 2 cal(E)^0$ on its trace domain. Our first step is a quantitative property of the area measure $mu_h$ which will justify that domain.

#prodef([Lemma 8.1.])[
  (Uniform small-ball bounds).  #emph[Almost surely there are finite random constants $C > 0$, $c > 0$, and $r_(*) > 0$ such that, simultaneously for every $z in bb(S)^2$ and $0 < r lt.eq r_(*)$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ c r^8 lt.eq mu_h \( B_(d_0) \( z \, r \) \) lt.eq C r^(1 \/ 56) . $ <eq:quantum-ball-bounds>]

 The constants may depend on the chosen conformal sphere coordinate.]
] <lem:quantum-ball-bounds>

#proof[
  We first prove the assertion on a fixed compact interior part of an ordinary planar field chart. The moment input is the subcritical GMC theorem for a stationary positive-definite covariance $gamma^2 log_(+) \( R \/ \| x - y \| \) + g \( x - y \)$ in dimension two, with $g$ bounded and continuous, with $0 < gamma < 2$; here $log_(+) u = max { log u \, 0 }$. For the exact logarithmic covariance ($g = 0$), its scaling and positive and negative moment statements give
  #[#set math.equation(numbering: n => "(8.2)")
   $ bb(E) \[ M_gamma \( B_r \( z \) \)^q \] lt.eq C_q r^(zeta \( q \)) \, #h(2em) zeta \( q \) = (2 + gamma^2 / 2) q - gamma^2 / 2 q^2 \, $ <eq:gmc-ball-moment>]
  uniformly for the small balls in a fixed buffer, whenever $0 < q < 4 \/ gamma^2$ or $q < 0$. Here $M_gamma$ is the limiting Wick chaos with Lebesgue base measure. This is the exact logarithmic specialization of #cite(label("RobertVargas2010GMC")) Propositions 3.3 and 3.5–3.7; the exact logarithmic covariance is available in dimension two. In particular the negative moments in (8.2) are moments of the limiting mass of an open ball.
  For $gamma^2 = 3$, take $q = 7 \/ 6$. Then $q < 4 \/ 3$ and $zeta \( q \) = 49 \/ 24$. For $q = - 1$, the exponent is $zeta \( - 1 \) = - 5$. Markov’s inequality therefore gives, with $a = 1 \/ 56$ and $b = 8$,
  #[#set math.equation(numbering: n => "(8.3)")
   $ bb(P) { M_gamma \( B_r \( z \) \) > r^a } & lt.eq C r^(zeta \( 7 \/ 6 \) - \( 7 \/ 6 \) a) = C r^(97 \/ 48) \,\
bb(P) { M_gamma \( B_r \( z \) \) < r^b } & lt.eq C r^(b + zeta \( - 1 \)) = C r^3 . $ <eq:gmc-upper-prob>]
  At level $r = 2^(- k)$, use a grid of mesh $r \/ 16$ in the fixed buffer. There are $O \( r^(- 2) \)$ grid points. Apply the upper estimate to the balls of radius $2 r$ and the lower estimate to those of radius $r \/ 4$; constant factors in the radii only change $C$ in these displays. The failure probabilities summed over the grid are respectively $O \( r^(1 \/ 48) \)$ and $O \( r \)$, and hence are summable over $k$. Almost surely, both bounds hold on every sufficiently fine grid. If $r \/ 2 lt.eq s lt.eq r$, any ball of radius $s$ centered in the smaller compact part is contained in a grid ball of radius $2 r$ and contains a grid ball of radius $r \/ 4$. Borel–Cantelli consequently gives the two polynomial bounds for all centers and all small radii in that compact part, with random constants.
  Here is the precise passage from this reference chaos to the sphere. A whole-plane GFF pinned to have circle average zero on a circle of radius $R$ has covariance $log \( R \/ \| z - w \| \)$ on the concentric disk of radius $R \/ 4$. The field multiplied by $gamma$ therefore has on that disk the covariance of the exact stationary field used above. The usual local LQG area agrees with this Wick chaos up to deterministic smooth normalization factors bounded above and below on a smaller buffer. This follows from the common-regularizer identification, including circle averages, in #cite(label("Berestycki2017GMC")) Theorem 1.1, whose base-measure energy condition holds for planar Lebesgue measure on a bounded buffer, and the circle-average normalization in #cite(label("DuplantierSheffield2011KPZ")) Propositions 1.2 and 3.2. Such factors preserve the two inequalities with modified constants. Adding any finite constant to the field also preserves them, since it multiplies area by one positive scalar.
  In the three-mark embedding of the ordinary unit-area sphere, #cite(label("C")) Proposition 3.5 gives local mutual absolute continuity, modulo additive constants, with a whole-plane GFF on bounded buffers avoiding the three marks. Existence of the local polynomial bounds with some constants is invariant under adding a field constant; the grid formulation makes it a measurable event of the local field modulo constants. It is therefore an almost-sure local property transferred by that proposition. We use it on a countable collection of nested compact and open buffers exhausting the complement of the marks. Resample a second triple of area marks and use the same proposition in its three-mark coordinate. The sphere area is nonatomic, as in the sphere input of Proposition 5, so the two triples are disjoint almost surely. Their two mark-free open sets cover the sphere. On each realization, select finitely many of the buffered interior charts whose interiors cover it. The coordinate changes are smooth sphere conformal maps, with upper and lower derivative bounds on these compact patches. A Lebesgue number for the finite cover and comparison of round and chart balls now give (8.1), with common random constants and a common small radius. Thus the estimate for the conditioned sphere follows from these local Gaussian comparisons. ◻
]

The remaining construction is deterministic. Its input will only be uniform upper and lower polynomial ball bounds. The upper bound controls logarithmic potentials; the lower bound will make the Sobolev trace injective. The quasi-continuous trace description for a planar massive field appears in #cite(label("AndresKajino2016Heat")) Section 2.3, and the use of a Hilbert–Schmidt Green operator for a log-correlated Gaussian field on a flat torus appears in #cite(label("MaillardRhodesVargasZeitouni2016Heat")) Section 3. We give the corresponding deterministic argument for the measure at hand.

Let $G$ be the symmetric round Green kernel with zero round mean. Its normalization, including its scalar, is specified by

#[#set math.equation(numbering: n => "(8.4)")
 $ integral G \( x \, y \) thin upright(d) sigma_0 \( x \) = 0 \, #h(2em) cal(E)^0 \( G \( dot.op \, y \) \, phi.alt \) = phi.alt \( y \) - sigma_0 \( phi.alt \) quad \( phi.alt in C^oo \( bb(S)^2 \) \) . $ <eq:round-green-normalization>]

The second equality is distributional. In a local conformal coordinate,

$ G \( x \, y \) = - \( 2 pi \)^(- 1) log \| x - y \| + O \( 1 \) $

near the diagonal. This is the Green kernel of the no-half integral $cal(E)^0$.

#prodef([Lemma 8.2.])[
  (Sobolev trace and Green potentials).  #emph[Let $mu$ be a Borel probability measure on the round sphere. Suppose that, for constants $a > 0$, $b < oo$, $c \, C > 0$, and $r_(*) > 0$, 
#[#set math.equation(numbering: n => "(8.5)")
 $ c r^b lt.eq mu \( B_(d_0) \( x \, r \) \) lt.eq C r^a quad \( x in bb(S)^2 \, 0 < r lt.eq r_(*) \) . $ <eq:deterministic-ball-bounds>]

 Smooth restriction extends uniquely to a bounded injective map $R_mu : H^1 \( bb(S)^2 \, upright("vol")_0 \) arrow.r L^2 \( mu \)$. The measure $mu$ charges no $H^1$-polar set, and $R_mu f$ is the quasi-continuous representative of $f$, $mu$-almost everywhere. There is a constant $C_mu < oo$ such that 
#[#set math.equation(numbering: n => "(8.6)")
 $ parallel R_mu \( f - sigma_0 \( f \) \) parallel_(L^2 \( mu \)) & lt.eq C_mu cal(E)^0 \( f \)^(1 \/ 2) \,\
C_mu^(- 1) parallel f parallel_(H^1) & lt.eq #scale(x: 120%, y: 120%)[\(] parallel R_mu f parallel_(L^2 \( mu \))^2 + cal(E)^0 \( f \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C_mu parallel f parallel_(H^1) . $ <eq:centered-trace>]

 Moreover, for each $g in L^2 \( mu \)$ there is a unique $u_g in H^1$ with $sigma_0 \( u_g \) = 0$ such that 
#[#set math.equation(numbering: n => "(8.7)")
 $ cal(E)^0 \( u_g \, f \) = integral g R_mu f thin upright(d) mu - (integral g thin upright(d) mu) sigma_0 \( f \) quad \( f in H^1 \) . $ <eq:potential-weak-equation>]

 The integral operator $T_mu$ with kernel $G$ is a Hilbert–Schmidt operator on $L^2 \( mu \)$, and the potential has the trace 
#[#set math.equation(numbering: n => "(8.8)")
 $ R_mu u_g = T_mu g \, #h(2em) T_mu g \( x \) = integral G \( x \, y \) g \( y \) thin upright(d) mu \( y \) quad upright("in ") L^2 \( mu \) . $ <eq:potential-trace>]

]
] <lem:trace-green>

#proof[
  Decrease $r_(*)$ to at most one and set $L \( x \, y \) = 1 + log_(+) \( r_(*) \/ d_0 \( x \, y \) \)$. The upper ball bound and layer cake give, for $j = 1 \, 2$,
  #[#set math.equation(numbering: n => "(8.9)")
   $ sup_x integral L \( x \, y \)^j thin upright(d) mu \( y \) < oo . $ <eq:log-potential-bound>]
  Indeed the nonconstant part is bounded using
  $ integral log_(+) #h(-0.16667em) (frac(r_(*), d_0 \( x \, y \)))^j thin upright(d) mu \( y \) = j integral_0^oo t^(j - 1) mu \( B_(d_0) \( x \, r_(*) e^(- t) \) \) thin upright(d) t lt.eq C j r_(*)^a integral_0^oo t^(j - 1) e^(- a t) thin upright(d) t . $
  The same bounds hold for $sigma_0$. Also $mu$ is nonatomic by the upper bound. In particular the diagonal has zero mass for all products of measures absolutely continuous with respect to $mu + sigma_0$.
  For $g in L^2 \( mu \)$, write $mu \( g \) = integral g thin upright(d) mu$ and consider the zero-mass signed measure
  $ s_g = g mu - mu \( g \) sigma_0 . $
  The bound $\| G \( x \, y \) \| lt.eq C L \( x \, y \)$ and Schur’s inequality imply
  #[#set math.equation(numbering: n => "(8.10)")
   $ integral.double L \( x \, y \) thin upright(d) \| s_g \| \( x \) thin upright(d) \| s_k \| \( y \) lt.eq C parallel g parallel_(L^2 \( mu \)) parallel k parallel_(L^2 \( mu \)) . $ <eq:signed-log-energy>]
  For example the $mu ⊗ mu$ term has this bound by the $j = 1$ case of (8.9); the mixed terms follow by integrating $L$ against $sigma_0$ first and using $\| mu \( g \) \| lt.eq parallel g parallel_2$. Thus all signed Green integrals below are absolutely defined.
  We record why these integrals are Dirichlet energies, including for the signed measures $s_g$. Let $Delta_0$ be the round Laplace–Beltrami operator with nonpositive spectrum. Thus $- Delta_0$ is the operator of $cal(E)^0$ in $L^2 \( upright("vol")_0 \)$. Let $P_t = e^(t Delta_0)$ and let $p_t$ be its kernel relative to $upright("vol")_0$. For $t > 0$, put
  $ G_t \( x \, y \) = integral_t^oo #scale(x: 120%, y: 120%)[\(] p_s \( x \, y \) - upright("vol")_0 \( bb(S)^2 \)^(- 1) #scale(x: 120%, y: 120%)[\)] thin upright(d) s . $
  The small-time Gaussian estimate for the smooth round heat kernel and its exponential convergence to the constant kernel for large times give
  #[#set math.equation(numbering: n => "(8.11)")
   $ \| G_t \( x \, y \) \| lt.eq C L \( x \, y \) quad \( t > 0 \, x eq.not y \) \, #h(2em) G_t \( x \, y \) arrow.r G \( x \, y \) quad \( t arrow.b 0 \, x eq.not y \) . $ <eq:smoothed-green-bound>]
  For instance, the singular part is controlled by
  $ integral_0^1 s^(- 1) exp \( - d_0 \( x \, y \)^2 \/ \( C s \) \) thin upright(d) s lt.eq C L \( x \, y \) . $
  Let $u_(g \, t)$ be the unique smooth function with $sigma_0 \( u_(g \, t) \) = 0$ and
  $ cal(E)^0 \( u_(g \, t) \, phi.alt \) = integral P_t phi.alt thin upright(d) s_g quad \( phi.alt in C^oo \( bb(S)^2 \) \) \; $
  its source is the smoothed measure $P_t^(*) s_g$. The heat semigroup identity and integration by parts give the exact cross-energy formula
  #[#set math.equation(numbering: n => "(8.12)")
   $ cal(E)^0 \( u_(g \, t) \, u_(k \, s) \) = integral.double G_(t + s) \( x \, y \) thin upright(d) s_g \( x \) thin upright(d) s_k \( y \) . $ <eq:smoothed-cross-energy>]
  There is no diagonal mass, so (8.10) and (8.11) justify dominated convergence in this formula. Applying it to the three terms in $cal(E)^0 \( u_(g \, t) - u_(g \, s) \)$ shows that these potentials are Cauchy in Dirichlet norm. Poincaré’s inequality and their zero round means make them Cauchy in $H^1$. Their limit $u_g$ satisfies
  #[#set math.equation(numbering: n => "(8.13)")
   $ sigma_0 \( u_g \) & = 0 \, #h(2em) cal(E)^0 \( u_g \) lt.eq C parallel g parallel_2^2 \,\
cal(E)^0 \( u_g \, u_k \) & = integral.double G \( x \, y \) thin upright(d) s_g \( x \) thin upright(d) s_k \( y \) \,\
cal(E)^0 \( u_g \, phi.alt \) & = integral phi.alt thin upright(d) s_g quad \( phi.alt in C^oo \( bb(S)^2 \) \) . $ <eq:potential-energy>]
  The last identity follows by letting $t arrow.b 0$ in the weak equation for $u_(g \, t)$, since $P_t phi.alt arrow.r phi.alt$ uniformly. This also identifies the limit as a distributional potential. Poincaré gives its uniqueness among zero-round-mean $H^1$ functions.
  For smooth $f$, (8.13) and (8.13) show that
  $ lr(|integral \( f - sigma_0 \( f \) \) g thin upright(d) mu|) lt.eq C parallel g parallel_(L^2 \( mu \)) cal(E)^0 \( f \)^(1 \/ 2) . $
  Taking the $L^2 \( mu \)$ dual supremum proves (8.6) on smooth functions. Together with the bound on the round mean it gives $parallel f parallel_(L^2 \( mu \)) lt.eq C parallel f parallel_(H^1)$. The density of smooth functions in $H^1$ gives a unique bounded extension $R_mu$ and proves (8.6) for every $f in H^1$. It also extends (8.13) to (8.7).
  We next identify this extension with the usual quasi-continuous values. For a compact set $F$, the $H^1$ capacity can be defined as the infimum of $parallel phi.alt parallel_(H^1)^2$ over smooth $phi.alt gt.eq 1$ on a neighborhood of $F$, and then extended by the usual outer regularization. For each such test function the restriction inequality gives
  $ mu \( F \) lt.eq integral phi.alt^2 thin upright(d) mu lt.eq C parallel phi.alt parallel_(H^1)^2 . $
  Infimizing, and then using inner regularity of $mu$, proves that every Borel set of zero $H^1$ capacity is $mu$-null. If smooth functions $f_n$ converge to $f$ in $H^1$, the capacity Chebyshev inequality applied to a sufficiently rapidly converging subsequence shows that this subsequence converges outside a set of capacity zero to the quasi-continuous representative $tilde(f)$. A further subsequence converges $mu$-almost everywhere to $R_mu f$, by its $L^2 \( mu \)$ convergence. The two limits agree because the exceptional polar set is $mu$-null. This proves the asserted identification of the trace.
  To see why the trace is injective, work in a fixed smooth planar coordinate patch and take a Euclidean disk $B_(3 r) \( x \)$ contained in that patch. Round and Euclidean balls are uniformly comparable on its fixed buffer, so (8.5) holds there for Euclidean balls after changing constants. Rescale $B_r \( x \)$ onto $B_1$ and let $hat(mu)_(x \, r)$ be the pushforward of $mu \|_(B_r \( x \)) \/ mu \( B_r \( x \) \)$. Let $cal(L)_(B_1)$ be normalized Lebesgue measure on $B_1$. For $0 < s lt.eq 1$ and any center $y$,
  $ hat(mu)_(x \, r) \( B_s \( y \) \) lt.eq min { 1 \, A_r s^a } \, #h(2em) A_r = max { 1 \, C_1 r^(a - b) } . $
  Another layer-cake calculation gives
  #[#set math.equation(numbering: n => "(8.14)")
   $ sup_y integral log_(+) frac(1, \| y - z \|) thin upright(d) hat(mu)_(x \, r) \( z \) & lt.eq integral_0^oo min { 1 \, A_r e^(- a t) } thin upright(d) t\
 & lt.eq C \( 1 + \| log r \| \) . $ <eq:rescaled-log-bound>]
  The Dirichlet Green kernel of $B_3$ is nonnegative and, on $B_1 times B_1$, is bounded by $C \( 1 + log_(+) \( 1 \/ \| y - z \| \) \)$. Its analogous bound for $cal(L)_(B_1)$ is uniform. The Dirichlet version of the regularization argument (8.12), applied to $hat(mu)_(x \, r) - cal(L)_(B_1)$, therefore yields
  #[#set math.equation(numbering: n => "(8.15)")
   $ parallel hat(mu)_(x \, r) - cal(L)_(B_1) parallel_(H^(- 1) \( B_3 \; thin parallel nabla dot.op parallel_2 \)) lt.eq C sqrt(1 + \| log r \|) . $ <eq:local-dual-bound>]
  Here $H^(- 1) \( B_3 \; parallel nabla dot.op parallel_2 \)$ is the dual of $H_0^1 \( B_3 \)$ with its Dirichlet norm. One obtains the identity by smoothing inside $B_3$ and then taking limits, just as above; the supports in $B_1$ leave a fixed boundary buffer, and (8.14) provides the integrable dominating logarithm.
  For smooth $f$, set $F \( y \) = f \( x + r y \)$ and choose a smooth cutoff $chi$ supported in $B_3$ and equal to one on $B_1$. Test (8.15) on $chi \( F - \| B_3 \|^(- 1) integral_(B_3) F thin upright(d) y \)$. Poincaré’s inequality on $B_3$ bounds the Dirichlet norm of this cutoff by $C parallel nabla F parallel_(L^2 \( B_3 \))$. The signed functional has mass zero and is supported where $chi = 1$. Scaling back, using the two-dimensional invariance of the Dirichlet integral, gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ lr(|frac(1, \| B_r \|) integral_(B_r \( x \)) f thin upright(d) y - frac(1, mu \( B_r \( x \) \)) integral_(B_r \( x \)) R_mu f thin upright(d) mu|) lt.eq C sqrt(1 + \| log r \|) (integral_(B_(3 r) \( x \)) \| nabla f \|^2 thin upright(d) y)^(1 \/ 2) . $ <eq:local-average-trace>]
  This inequality extends to $H^1$ functions. Indeed smooth approximation of the cutoff converges in $H_0^1 \( B_3 \)$, and both the global restriction map and the functional in (8.15) are continuous; their integrals agree on the smooth approximants. If $R_mu f = 0$, the second average in (8.16) is zero. At almost every Lebesgue point of both $f$ and $\| nabla f \|^2$, its first average tends to $f \( x \)$ while its right side is $O_x \( r sqrt(1 + \| log r \|) \)$, hence tends to zero. It follows that $f = 0$ almost everywhere in each patch, and therefore on the sphere. Thus $R_mu$ is injective.
  For the norm comparison, write $f = c + v$ with $c = sigma_0 \( f \)$ and $sigma_0 \( v \) = 0$. Poincaré and (8.6) give
  $ parallel v parallel_(H^1) lt.eq C cal(E)^0 \( f \)^(1 \/ 2) \, #h(2em) \| c \| lt.eq parallel R_mu f parallel_2 + parallel R_mu v parallel_2 lt.eq parallel R_mu f parallel_2 + C cal(E)^0 \( f \)^(1 \/ 2) . $
  These imply the left inequality in (8.6); boundedness of restriction gives the right one.
  It remains to verify the claimed trace of the potential. The $j = 2$ case of (8.9) makes $G in L^2 \( mu ⊗ mu \)$, so $T_mu$ in (8.8) is well defined and Hilbert–Schmidt. For $g \, k in L^2 \( mu \)$, use (8.7) with $u_k$ and $f = u_g$. Since $sigma_0 \( u_g \) = 0$, the cross-energy identity gives
  $ integral k R_mu u_g thin upright(d) mu = cal(E)^0 \( u_k \, u_g \) = integral.double G \( x \, y \) k \( x \) g \( y \) thin upright(d) mu \( x \) thin upright(d) mu \( y \) . $
  In the last equality the terms involving $sigma_0$ in (8.13) vanish by the centering (8.4). The displayed identity for every $k$ proves (8.8) in $L^2 \( mu \)$. ◻
]

#prodef([Proposition 8.3.])[
  (Continuum form and inverse).  #emph[Almost surely, the closure in $L^2 \( mu_h \)$ of the smooth form $1 / 2 cal(E)^0$ has domain 
#[#set math.equation(numbering: n => "(8.17)")
 $ cal(D)_h = R_(mu_h) \( H^1 \( bb(S)^2 \, upright("vol")_0 \) \) \, #h(2em) cal(E)_h \( R_(mu_h) f \, R_(mu_h) g \) = 1 / 2 cal(E)^0 \( f \, g \) . $ <eq:continuum-form-domain>]

 It is a densely defined closed regular Dirichlet form. Let $A_h$ be its nonnegative self-adjoint operator, and set $B_h = 2 A_h$, the operator of the raw form $cal(E)^0$. Put $mu = mu_h$ and define 
#[#set math.equation(numbering: n => "(8.18)")
 $ G_mu \( x \, y \) =  & G \( x \, y \) - integral G \( x \, z \) thin upright(d) mu \( z \) - integral G \( z \, y \) thin upright(d) mu \( z \) + integral.double G \( z \, w \) thin upright(d) mu \( z \) thin upright(d) mu \( w \) \,\
K_h g \( x \) =  & integral G_mu \( x \, y \) g \( y \) thin upright(d) mu \( y \) . $ <eq:double-centered-green>]

 The kernel $G_mu$ is in $L^2 \( mu ⊗ mu \)$ and has zero $mu$-mean in each variable. The operator $K_h$ is zero on constants and is the positive, injective inverse of $B_h$ on $L_0^2 \( mu \)$, the subspace of $mu$-mean-zero functions.]
  #emph[Both $B_h$ and $A_h$ have compact resolvent. On the infinite-dimensional space $L^2 \( mu \)$ their eigenvalues, counted with multiplicity, can be written 
$ 0 = nu_0 < nu_1 lt.eq nu_2 lt.eq dots.h.c arrow.r oo \, #h(2em) Lambda_j = nu_j / 2 quad \( j gt.eq 0 \) \, $

 respectively. The constant eigenfunction is the only zero mode, and 
#[#set math.equation(numbering: n => "(8.19)")
 $ sum_(j gt.eq 1) nu_j^(- 2) = parallel K_h parallel_(upright("HS"))^2 < oo \, #h(2em) "Tr" e^(- t A_h) = 1 + sum_(j gt.eq 1) e^(- t nu_j \/ 2) < oo quad \( t > 0 \) . $ <eq:continuum-inverse-summability>]

 The heat series converges locally uniformly on $\( 0 \, oo \)$. The ordered eigenvalues and this $C_(upright("loc")) \( \( 0 \, oo \) \)$ heat trace have Borel versions as functions of the area measure in the fixed sphere coordinate. The form and these readouts are invariant under conformal or anticonformal changes of that coordinate.]
] <prop:continuum-form>

#proof[
  Apply Lemma 36 to $mu_h$ using Lemma 35. Injectivity makes the formula (8.17) well defined. The norm equivalence (8.6) proves that this domain is complete in the form norm. It is exactly the closure of the smooth domain, since smooth functions are dense in $H^1$. Smooth restrictions are also dense in $L^2 \( mu \)$: continuous functions are dense for a finite Radon measure on a compact space, and smooth functions are uniformly dense in the continuous ones. Sobolev normal contractions commute with the quasi-continuous restriction and decrease the Dirichlet integral. This proves the Markov property. The same smooth functions form a uniform core in $C \( bb(S)^2 \)$ and a form core, proving regularity. The representation theorem for closed forms gives $A_h$ and $B_h$; multiplying a form by two multiplies its associated operator by two, so $B_h = 2 A_h$.
  This also identifies the form with the Liouville time change of standard conformal Brownian motion. Take round Brownian motion with generator $1 / 2 Delta_0$ and base form $1 / 2 cal(E)^0$ in $L^2 \( upright("vol")_0 \)$. The finite measure $mu$ charges no polar set, so it is a smooth measure for this form. The extended finite-energy space of the round form is $H^1$ on this compact sphere. Indeed, for an energy-Cauchy sequence, subtracting round means makes it $H^1$-Cauchy by Poincaré; a finite almost-everywhere limit then forces a subsequence of the subtracted constants to converge as well. Injectivity of the quasi-continuous trace now gives full quasi-support: a function in this extended space whose trace vanishes $mu$-almost everywhere is zero in $H^1$ and hence quasi-everywhere. The time-change theorem #cite(label("FukushimaOshimaTakeda2011")) Theorem 6.2.1 therefore gives exactly (8.17) for the time change whose Revuz measure is $mu$. In particular its Brownian clock is the half-form clock.
  For later use the raw form is coercive on the centered subspace. If $v = R_mu f$ and $mu \( v \) = 0$, then $sigma_0 \( f \) = - mu \( R_mu \( f - sigma_0 \( f \) \) \)$. Hence
  #[#set math.equation(numbering: n => "(8.20)")
   $ parallel v parallel_(L^2 \( mu \)) lt.eq 2 C_mu cal(E)^0 \( f \)^(1 \/ 2) . $ <eq:continuum-centered-poincare>]
  The zero-energy functions are precisely the constants, by the round Poincaré inequality and trace identification.
  Let $Pi_mu g = mu \( g \) upright(bold(1))$ and $P_mu = "Id" - Pi_mu$. Double centering in (8.18) is the orthogonal projection $P_mu ⊗ P_mu$ of $G$ in $L^2 \( mu ⊗ mu \)$. Thus its two marginals vanish and it is square integrable. Its operator is $K_h = P_mu T_mu P_mu$, which is Hilbert–Schmidt and zero on constants. For centered $g$, Lemma 36 gives
  $ K_h g = R_mu #scale(x: 120%, y: 120%)[\(] u_g - mu \( R_mu u_g \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(E)^0 \( u_g - mu \( R_mu u_g \) \, f \) = integral g R_mu f thin upright(d) mu quad \( f in H^1 \) . $
  This is exactly the domain criterion for the operator of the raw closed form: $K_h g in "Dom" \( B_h \)$ and $B_h K_h g = g$. Uniqueness on the centered subspace follows from (8.20). Consequently $K_h = B_h^(- 1)$ there. In particular it is positive and injective on that subspace. The output projection in $P_mu T_mu P_mu$ chooses the representative of the weak solution with $mu$-mean zero.
  The inverse identity gives
  $ \( B_h + "Id" \)^(- 1) = Pi_mu + K_h \( "Id" + K_h \)^(- 1) . $
  The right side is compact, since $Pi_mu$ has rank one and $K_h$ is compact. Scaling also gives compact resolvent for $A_h$. The ball bounds give full support and no atoms, so $L^2 \( mu \)$ is infinite-dimensional. The compact-resolvent spectral theorem and the one-dimensional kernel now give the stated eigenvalue enumeration. On the centered space the inverse eigenvalues are $nu_j^(- 1)$. The Hilbert–Schmidt identity yields the first assertion in (8.19). For every $delta > 0$,
  $ e^(- t s \/ 2) lt.eq C_delta s^(- 2) quad \( s > 0 \, t gt.eq delta \) \, #h(2em) C_delta = sup_(s > 0) s^2 e^(- delta s \/ 2) < oo . $
  The Weierstrass test therefore proves the heat assertion and its local uniform convergence, with the constant mode counted once.
  For completeness, choose a countable rational linear space of smooth functions dense in $H^1$, for example rational combinations of round spherical harmonics. In the min–max formula for $nu_j$ one may take the infimum only over $\( j + 1 \)$-dimensional spans from this space: the form-norm density just proved approximates any finite-dimensional test space together with its mass and energy matrices. For each fixed tuple of smooth functions, the entries of the mass matrix are $integral phi.alt_k phi.alt_l thin upright(d) mu$, which are Borel, indeed continuous, in the weak topology on probability measures; the energy matrix is deterministic. The supremum of its Rayleigh quotient can be taken over nonzero rational vectors, assigning the value $+ oo$ when the mass denominator vanishes. This is a countable supremum of Borel functions. The countable infimum over tuples is therefore Borel and equals $nu_j$ on the measures under consideration. Finite heat sums are Borel maps into $C_(upright("loc")) \( \( 0 \, oo \) \)$, and their locally uniform limit is Borel as well.
  Finally, a conformal or anticonformal sphere map transports $mu$ and acts unitarily on the corresponding $L^2$ spaces. It preserves the two-dimensional Dirichlet integral. Being a smooth diffeomorphism of the compact sphere, it preserves $H^1$ and capacity-zero sets, so it also transports the quasi-continuous trace domain. The resulting closed forms are unitarily equivalent. This proves the asserted coordinate invariance and completes the continuum construction. ◻
]

== 9 From voltage limits to the joint spectral limit <sec:spectrum>

The four-point voltage theorem identifies the macroscopic part of the inverse operator. To deduce spectral convergence, we must also control functions whose energy is bounded but whose mass could concentrate in a small region. The block estimate of Theorem 26 provides this control. We first turn it into strong compactness in one Hilbert space, then combine that compactness with the voltage limit to obtain convergence of the inverse operators in Hilbert–Schmidt norm.

Throughout the first two subsections, work on an almost-sure outcome of a common representation extraction on which Proposition 5, Theorem 26, and Theorem 23 hold simultaneously. Relabel its indices by $n$, write $mu = mu_h$, and retain the two rerootings used for the finite interval cover in Theorem 26. All constants and finite starting indices in this argument may depend on this outcome. Their asserted uniformity in later indices and levels is pathwise.

=== 9.1 Corner time and strong energy compactness <corner-time-and-strong-energy-compactness>

Let $H = L^2 \( \[ 0 \, 1 \] \, thin upright(d) t \)$. For $r = 1 \, 2$, define $U_n^(\( r \)) : L^2 \( mu_n \) arrow.r H$ by

$ \( U_n^(\( r \)) f \) \( t \) = f #scale(x: 120%, y: 120%)[\(] v_n^(\( r \)) \( i \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) frac(i, 2 n) lt.eq t < frac(i + 1, 2 n) \, quad 0 lt.eq i < 2 n . $

Values at $t = 1$ are immaterial. The exact corner identity (2.1) gives

$ lr(bar.v.double U_n^(\( r \)) f bar.v.double)_H^2 = frac(1, 2 n) sum_(i = 0)^(2 n - 1) \| f \( v_n^(\( r \)) \( i \) \) \|^2 = lr(bar.v.double f bar.v.double)_(L^2 \( mu_n \))^2 . $

Set $cal(H)_n = U_n^(\( 1 \)) L^2 \( mu_n \)$. It is a finite-dimensional subspace of $H$ containing the constants. We conjugate $B_n$ by $U_n^(\( 1 \))$ when it acts on $cal(H)_n$, retaining its name, and write

$ cal(E)_n^0 \( F \) = cal(E)_n^0 \( f \) = chevron.l F \, B_n F chevron.r_H \, #h(2em) F = U_n^(\( 1 \)) f in cal(H)_n . $

The two explorations list the same $2 n$ physical corner occurrences. Let $sigma_n$ be the permutation which matches each occurrence in the first list to that occurrence in the second. It preserves its incident vertex. For $t = \( i + u \) \/ \( 2 n \)$, where $0 lt.eq i < 2 n$ and $0 lt.eq u < 1$, set

$ tau_n \( t \) = frac(sigma_n \( i \) + u, 2 n) . $

This is a Lebesgue-measure-preserving bijection up to endpoints, and

#[#set math.equation(numbering: n => "(9.1)")
 $ U_n^(\( 1 \)) f = \( U_n^(\( 2 \)) f \) compose tau_n quad upright("almost everywhere") . $ <eq:tour-transfer>]

#prodef([Lemma 9.1.])[
  (Matching the two corner orders).  #emph[There is a measurable, measure-preserving map $tau : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$, defined up to a null set, such that 
$ tau_n \( t \) arrow.r tau \( t \) \, #h(2em) eta_2 \( tau \( t \) \) = eta_1 \( t \) quad upright("for almost every ") t . $

 If intervals $J_n subset \[ 0 \, 1 \]$ have endpoints converging to the endpoints of an interval $J$, then 
$ upright(bold(1))_(J_n) arrow.r upright(bold(1))_J \, #h(2em) upright(bold(1))_(J_n) compose tau_n arrow.r upright(bold(1))_J compose tau quad upright("in ") H . $

 Finite products and differences of such indicator functions converge in $H$ as well. For either $r$, the map 
$ U_r : L^2 \( mu \) arrow.r H \, #h(2em) U_r g = g compose eta_r \, $

 is unitary.]
] <lem:tour-order>

#proof[
  By Proposition 5, for $mu$-almost every $z$ the fiber $eta_2^(- 1) \( { z } \)$ has exactly one element among all times in $\[ 0 \, 1 \]$. The pushforward identity for $eta_1$ therefore implies that, for almost every $t$, $eta_1 \( t \)$ has such a unique second time; call it $tau \( t \)$. Fix one of these $t$, also avoiding the countable union of step endpoints. Every subsequence of $tau_n \( t \)$ has a further convergent subsequence, with some limit $s$. The two matched corners have the same projected vertex. The uniform tracking in (2.4) and the continuity of $eta_2$ give
  $ eta_2 \( s \) = lim_n z_n #scale(x: 120%, y: 120%)[\(] v_n^(\( 2 \)) \( sigma_n \( floor.l 2 n t floor.r \) \) #scale(x: 120%, y: 120%)[\)] = lim_n z_n #scale(x: 120%, y: 120%)[\(] v_n^(\( 1 \)) \( floor.l 2 n t floor.r \) #scale(x: 120%, y: 120%)[\)] = eta_1 \( t \) $
  along this further subsequence. Singleton fibers force $s = tau \( t \)$. Thus the entire sequence converges. The all-times formulation of the singleton property is what also determines limits that could lie in a null set of second-tour times.
  Extend $tau$ arbitrarily on the exceptional null set. It is measurable as an almost-everywhere pointwise limit of the measurable $tau_n$. For every continuous $g$ on $\[ 0 \, 1 \]$, bounded convergence yields
  $ integral_0^1 g \( tau \( t \) \) thin upright(d) t = lim_n integral_0^1 g \( tau_n \( t \) \) thin upright(d) t = integral_0^1 g \( s \) thin upright(d) s . $
  Hence $tau$ preserves Lebesgue measure. Away from the two limiting endpoints, membership in $J_n$ eventually agrees with membership in $J$. For the composed indicators the only additional exceptional times are those for which $tau \( t \)$ is an endpoint; these have measure zero by the pushforward just proved. The indicators converge almost everywhere and are bounded by one, so they converge in $L^2$. The assertion for finite products and differences follows in the same way.
  The area pushforward makes $U_r$ an isometry. To see surjectivity, let $E_r$ be the set of points whose fiber under $eta_r$ is a singleton. For every $k$, the set of points having two preimages at distance at least $1 \/ k$ is the continuous image of a compact subset of $\[ 0 \, 1 \]^2$, hence is closed. Subtracting the union of these sets from the compact image of $eta_r$ shows that $E_r$ is Borel. On $E_r$ the inverse of $eta_r$ is continuous in the relative topology. Indeed, convergence of image points and compactness of the time interval show that any limit of their inverse times belongs to the limiting fiber, which is a singleton. Choose a Borel representative of any element of $H$ and compose it with this inverse on $E_r$, extending by zero outside $E_r$. This constructs a measurable function of the image whose pullback agrees with the given time function on $eta_r^(- 1) \( E_r \)$. Since $mu \( E_r \) = 1$, the isometry is onto. ◻
]

We now use the finite cover in Theorem 26. It consists, on the present outcome, of finitely many protected intervals $I_(n \, ell)$ in tour order $r_ell in { 1 \, 2 }$, indexed by $1 lt.eq ell lt.eq L$. Each interval is a union of step cells and its duration converges to a number $d_ell > 0$. Every corner is in at least one of these intervals for all sufficiently large $n$. At level $j$, write $J_(n \, ell \, j \, b)$, $0 lt.eq b < 2^j$, for its partition by nested integer halves, retaining empty or singleton blocks when necessary. For each fixed $j$, all these blocks are nonempty for large $n$, and

#[#set math.equation(numbering: n => "(9.2)")
 $ \| J_(n \, ell \, j \, b) \| arrow.r 2^(- j) d_ell > 0 . $ <eq:block-positive-length>]

This follows by dividing the limiting duration into $2^j$ nested halves; the integer-rounding error is $O \( 1 \/ n \)$ at fixed $j$. The absolute endpoints lie in $\[ 0 \, 1 \]$, so every subsequence has a further one on which the endpoints of all $L$ intervals converge. Along such a further subsequence, their fixed-level block endpoints converge as well.

Let $P_(n \, ell \, j) f$ be the block-average function on $I_(n \, ell)$ formed from $U_n^(\( r_ell \)) f$. The theorem supplies one finite level $J$, one eventual index $n_0$, and finite positive constants $C_ell$, such that, simultaneously for $n gt.eq n_0$, $j gt.eq J$, and all vertex functions $f$,

#[#set math.equation(numbering: n => "(9.3)")
 $ integral_(I_(n \, ell)) \| U_n^(\( r_ell \)) f - P_(n \, ell \, j) f \|^2 thin upright(d) t lt.eq C_ell 2^(- p j) cal(E)_n^0 \( f \; F_(n \, ell) \) \, #h(2em) p = 7 / 10 . $ <eq:covered-block-estimate>]

Here $F_(n \, ell)$ is the edge set of the retained larger graph, a subset of the full map edge set. The same $J \, n_0 \, C_ell$ work for every finer level, including the levels at which the partition consists of singletons. We have taken the maximum of the finitely many thresholds furnished by the cover theorem.

#prodef([Lemma 9.2.])[
  (Finite-rank approximation and energy compactness).  #emph[On the present extraction there are constants $C_0 \, C_1 < oo$ and linear maps $Q_(n \, j) : cal(H)_n arrow.r H$, for $n gt.eq n_0$ and $j gt.eq J$, with 
#[#set math.equation(numbering: n => "(9.4)")
 $ "rank" Q_(n \, j) lt.eq C_0 2^j \, #h(2em) lr(bar.v.double F - Q_(n \, j) F bar.v.double)_H^2 lt.eq C_1 2^(- p j) cal(E)_n^0 \( F \) \, quad F in cal(H)_n . $ <eq:finite-rank-approximation>]

 For each fixed $j gt.eq J$, whenever $n_q arrow.r oo$ and $F_q in cal(H)_(n_q)$ have bounded norms, the sequence $Q_(n_q \, j) F_q$ has a strongly convergent subsequence in $H$. Consequently, whenever $n_q arrow.r oo$ and $F_q in cal(H)_(n_q)$ satisfy 
$ sup_q #scale(x: 120%, y: 120%)[\(] lr(bar.v.double F_q bar.v.double)_H^2 + cal(E)_(n_q)^0 \( F_q \) #scale(x: 120%, y: 120%)[\)] < oo \, $

 the sequence $F_q$ has a strongly convergent subsequence in $H$. There also exist a finite $i_0$ and a constant $c_(*) > 0$ such that, for all $n gt.eq n_0$ and $i gt.eq i_0$, 
#[#set math.equation(numbering: n => "(9.5)")
 $ nu_(n \, i) gt.eq c_(*) i^p . $ <eq:raw-eigenvalue-tail>]

 The convention $nu_(n \, i) = + oo$ for $i gt.eq dim cal(H)_n$ is used here.]
] <lem:energy-compactness>

#proof[
  Put $tau_n^(\( 1 \)) = "Id"$ and $tau_n^(\( 2 \)) = tau_n$. Assign a time to the first interval that covers it by setting
  $ chi_(n \, ell) \( t \) = upright(bold(1))_(I_(n \, ell)) \( tau_n^(\( r_ell \)) \( t \) \) product_(q < ell) #scale(x: 120%, y: 120%)[\(] 1 - upright(bold(1))_(I_(n \, q)) \( tau_n^(\( r_q \)) \( t \) \) #scale(x: 120%, y: 120%)[\)] . $
  For large $n$, these functions take values in ${ 0 \, 1 }$ and sum to one almost everywhere. For a nonempty original block, let
  $ macron(f)_(n \, ell \, j \, b) = frac(1, \| J_(n \, ell \, j \, b) \|) integral_(J_(n \, ell \, j \, b)) U_n^(\( r_ell \)) f \( t \) thin upright(d) t . $
  Define the linear map on $F = U_n^(\( 1 \)) f$ by
  #[#set math.equation(numbering: n => "(9.6)")
   $ Q_(n \, j) F = sum_(ell = 1)^L med sum_(b : J_(n \, ell \, j \, b) eq.not diameter) macron(f)_(n \, ell \, j \, b) thin chi_(n \, ell) thin #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(J_(n \, ell \, j \, b)) compose tau_n^(\( r_ell \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:priority-approximant>]
  Thus the coefficient is always the average on the full original block; the priority rule only restricts the indicator on which this coefficient is used. There are at most $L 2^j$ summands with fixed indicator functions, proving the rank bound with $C_0 = L$.
  Equation (9.1) and the disjoint priority assignment give
  $ lr(bar.v.double F - Q_(n \, j) F bar.v.double)_H^2 & lt.eq sum_(ell = 1)^L integral_(I_(n \, ell)) \| U_n^(\( r_ell \)) f - P_(n \, ell \, j) f \|^2 thin upright(d) t\
 & lt.eq sum_(ell = 1)^L C_ell 2^(- p j) cal(E)_n^0 \( f \; F_(n \, ell) \) lt.eq C_1 2^(- p j) cal(E)_n^0 \( F \) \, $
  where $C_1 = sum_ell C_ell$. The last inequality uses that every $F_(n \, ell)$ is a subset of the original edge set, including its multiplicities. The map $Q_(n \, j)$ is allowed to take values outside $cal(H)_n$; only its rank and its approximation error are used.
  Fix $j$ and any sequence of indices and norm-bounded functions as in the statement. Relabel its indices by $n$, and first extract a subsequence on which the finitely many absolute interval endpoints converge. By Cauchy–Schwarz and the isometry of $U_n^(\( r \))$,
  #[#set math.equation(numbering: n => "(9.7)")
   $ \| macron(f)_(n \, ell \, j \, b) \| lt.eq \| J_(n \, ell \, j \, b) \|^(- 1 \/ 2) lr(bar.v.double F bar.v.double)_H . $ <eq:block-coefficient-bound>]
  Equation (9.2) bounds these coefficients uniformly for a norm-bounded sequence. Lemma 38 shows that each of the finitely many indicator factors in (9.6), and hence their product, converges strongly in $H$. After a subsequence the finitely many scalar coefficients also converge. This proves the fixed-level compactness. A priority piece can have limiting length zero; the bound still holds because the coefficient was taken on the original block in (9.7).
  For the asserted energy compactness, start with any sequence of indices and functions with both norms and energies bounded, again relabelling its indices by $n$. For each successive integer $j gt.eq J$, extract a subsequence on which $Q_(n \, j) F_n$ converges, and use a diagonal subsequence. Given $epsilon > 0$, choose $j$ so large that the square root of the right side of (9.4) is less than $epsilon \/ 3$ uniformly along this sequence. For two sufficiently late terms, the difference of their level-$j$ approximants is also less than $epsilon \/ 3$. The triangle inequality makes the diagonal sequence Cauchy in $H$, proving strong convergence.
  Finally let $i < dim cal(H)_n$ be sufficiently large and set
  $ j \( i \) = ⌊log_2 frac(i, 2 C_0)⌋ . $
  Choose $i_0$ so that $j \( i \) gt.eq J$ for $i gt.eq i_0$. The span of the first $i + 1$ orthonormal eigenvectors of $B_n$, including its constant mode, has dimension greater than $"rank" Q_(n \, j \( i \)) lt.eq i \/ 2$. It contains a unit vector $F$ killed by $Q_(n \, j \( i \))$. Its energy is at most $nu_(n \, i)$, so (9.4) gives
  $ 1 lt.eq C_1 2^(- p j \( i \)) nu_(n \, i) \, #h(2em) nu_(n \, i) gt.eq C_1^(- 1) (frac(i, 4 C_0))^p . $
  This is (9.5) with $c_(*) = C_1^(- 1) \( 4 C_0 \)^(- p)$. Padded eigenvalues are infinite and satisfy the same bound. ◻
]

=== 9.2 Convergence of the centered inverse kernels <convergence-of-the-centered-inverse-kernels>

A voltage difference observes a particular combination of four kernel values. For $k in L^2 \( \[ 0 \, 1 \]^2 \)$, define

$ \( frak(D) k \) \( t \, t' \, s \, s' \) = k \( t \, s \) - k \( t \, s' \) - k \( t' \, s \) + k \( t' \, s' \) . $

This is a bounded map from $L^2 \( \[ 0 \, 1 \]^2 \)$ to $L^2 \( \[ 0 \, 1 \]^4 \)$, with norm at most four. Call $k$ doubly centered if its integral in either variable vanishes for almost every value of the other. These kernels form a closed subspace, and Fubini’s theorem gives

#[#set math.equation(numbering: n => "(9.8)")
 $ integral_0^1 #h(-0.16667em) integral_0^1 \( frak(D) k \) \( t \, t' \, s \, s' \) thin upright(d) t' thin upright(d) s' = k \( t \, s \) \, #h(2em) lr(bar.v.double frak(D) k bar.v.double)_(L^2 \( \[ 0 \, 1 \]^4 \)) = 2 lr(bar.v.double k bar.v.double)_(L^2 \( \[ 0 \, 1 \]^2 \)) $ <eq:double-difference-injective>]

for every doubly centered $k$. For the norm identity, expand the square: the four squared terms each have norm $lr(bar.v.double k bar.v.double)_2^2$, and every cross term vanishes by one of the two centering identities. In particular, the four-point difference determines a doubly centered $L^2$ kernel uniquely.

The general form-convergence theory of #cite(label("KuwaeShioya2003")) Definitions 2.11–2.13 and Theorem 2.4 likewise separates asymptotic compactness of bounded-energy families from identification of the limiting form. The next lemma proves the implication needed here directly from the four-point observation. It also explains why a bound for high eigenvalue indices alone does not control the largest inverse eigenvalue.

#prodef([Lemma 9.3.])[
  (A compactness criterion for inverse kernels).  #emph[Let $H = L^2 \( \[ 0 \, 1 \] \)$, and let $cal(H)_n subset H$ be finite-dimensional subspaces containing the constants. Let $B_n$ be nonnegative self-adjoint operators on $cal(H)_n$, with kernel exactly the constants. Write $frak(e)_n \( F \) = chevron.l F \, B_n F chevron.r_H$, list their eigenvalues as $0 = nu_(n \, 0) < nu_(n \, 1) lt.eq dots.h.c$, and pad this list by $+ oo$ past $dim cal(H)_n - 1$. Let $K_n$ be the inverse of $B_n$ on $cal(H)_n ∩ upright(bold(1))^perp$, extended by zero on constants and on $cal(H)_n^perp$, and let $k_n in L^2 \( \[ 0 \, 1 \]^2 \)$ be its kernel. Suppose that:]
  + #emph[whenever $n_q arrow.r oo$ and $F_q in cal(H)_(n_q)$ satisfy $sup_q \( lr(bar.v.double F_q bar.v.double)_H^2 + frak(e)_(n_q) \( F_q \) \) < oo$, some subsequence of $F_q$ converges strongly in $H$;]
  + #emph[for some $p > 1 \/ 2$, $c > 0$, and finite $i_0 \, n_0$, one has $nu_(n \, i) gt.eq c i^p$ for every $n gt.eq n_0$ and $i gt.eq i_0$;]
  + #emph[there is a doubly centered $k in L^2 \( \[ 0 \, 1 \]^2 \)$ for which $frak(D) k_n arrow.r frak(D) k$ almost everywhere on $\[ 0 \, 1 \]^4$.]
  #emph[Then the operator norms $lr(bar.v.double K_n bar.v.double)_(upright("op"))$ are bounded for large $n$, and $k_n arrow.r k$ in $L^2 \( \[ 0 \, 1 \]^2 \)$.]
] <lem:inverse-kernel-compactness>

#proof[
  The nonzero eigenvalues of $K_n$, in decreasing order and with zeros appended, are $kappa_(n \, i) = nu_(n \, i)^(- 1)$, $i gt.eq 1$, where $\( + oo \)^(- 1) = 0$. Its kernel is doubly centered because $K_n$ is self-adjoint and kills constants. For $N gt.eq i_0$, assumption (ii) gives the uniform Hilbert–Schmidt tail bound
  #[#set math.equation(numbering: n => "(9.9)")
   $ sum_(i > N) kappa_(n \, i)^2 lt.eq c^(- 2) sum_(i > N) i^(- 2 p) = : r_N^2 \, #h(2em) n gt.eq n_0 \, $ <eq:inverse-square-tail>]
  where $r_N arrow.r 0$ because $2 p > 1$.
  Suppose first that $M_n = lr(bar.v.double K_n bar.v.double)_(upright("op"))$ is unbounded. On a subsequence it tends to infinity, so we may assume $M_n gt.eq 1$. Choose orthonormal eigenvectors $e_(n \, i)$ for the positive eigenvalues and put $alpha_(n \, i) = kappa_(n \, i) \/ M_n$. Every $alpha_(n \, i)$ belongs to $\[ 0 \, 1 \]$. By a diagonal extraction, assume these numbers converge to $alpha_i$ for every fixed $i$. If $alpha_i > 0$, the vector $e_(n \, i)$ exists for large $n$ and
  $ frak(e)_n \( e_(n \, i) \) = nu_(n \, i) = frac(1, M_n alpha_(n \, i)) arrow.r 0 . $
  Assumption (i), and a further diagonal extraction over these indices, give strong limits $e_(n \, i) arrow.r e_i$. If $alpha_i = 0$, its rank-one term has Hilbert–Schmidt norm $alpha_(n \, i) arrow.r 0$ and needs no eigenvector limit. It follows that each fixed finite truncation
  $ sum_(i lt.eq N) alpha_(n \, i) thin e_(n \, i) ⊗ e_(n \, i) $
  converges in Hilbert–Schmidt norm. Here $e ⊗ e$ denotes the rank-one operator $F mapsto chevron.l F \, e chevron.r_H e$, and a term with zero eigenvalue is omitted. For the positive limiting coefficients this uses $lr(bar.v.double e_(n \, i) ⊗ e_(n \, i) - e_i ⊗ e_i bar.v.double)_(upright("HS")) lt.eq 2 lr(bar.v.double e_(n \, i) - e_i bar.v.double)_H$.
  After division by $M_n gt.eq 1$, the squared tail is still at most $r_N^2$ by (9.9). The convergent finite truncations and this uniform tail show that $k_n \/ M_n$ has an $L^2$ limit $k^(*)$. Hilbert–Schmidt convergence implies operator-norm convergence, so the operator with kernel $k^(*)$ has norm one. On the other hand, assumption (iii) implies $frak(D) \( k_n \/ M_n \) arrow.r 0$ almost everywhere, since its unnormalized numerator has a finite almost-everywhere limit. Boundedness of $frak(D)$ also gives convergence in $L^2$ to $frak(D) k^(*)$. Both imply convergence in measure, whose limit is unique. Thus $frak(D) k^(*) = 0$. Centering passes to an $L^2$ limit, so (9.8) gives $k^(*) = 0$, contradicting its operator norm one. This proves boundedness of $M_n$.
  Take now any subsequence without dividing by $M_n$. The bounded inverse norms allow a numerical diagonal extraction $kappa_(n \, i) arrow.r kappa_i$ for every $i$. A positive $kappa_i$ gives $frak(e)_n \( e_(n \, i) \) = 1 \/ kappa_(n \, i)$ bounded, so assumption (i) applies to its eigenvectors. A further diagonal extraction over every index with $kappa_i > 0$ gives simultaneous strong limits $e_(n \, i) arrow.r e_i$. A zero limiting coefficient again makes its rank-one term vanish. The same truncation argument using (9.9) supplies a further $L^2$ limit $k^(*)$ of the kernels. It is doubly centered. Assumption (iii), boundedness of $frak(D)$, and uniqueness of limits in measure now give $frak(D) k^(*) = frak(D) k$. Equation (9.8) implies $k^(*) = k$. Every subsequence has a further subsequence with this same $L^2$ limit, proving the full claimed convergence. ◻
]

We apply this criterion to the graph inverses. Let $K_n^V$ be the inverse of $B_n$ on centered vertex functions, extended by zero on constants, and write $k_n^V \( x \, y \)$ for its kernel relative to $mu_n$. Thus

$ \( K_n^V g \) \( x \) = sum_(y in V_n) k_n^V \( x \, y \) g \( y \) mu_n \( y \) . $

Its column equation follows from $B_n K_n^V = "Id" - Pi_(upright("const"))$ and Lemma 2:

$ Q_n k_n^V \( thin dot.op thin \, y \) = delta_y - mu_n \, #h(2em) Q_n #scale(x: 120%, y: 120%)[\(] k_n^V \( thin dot.op thin \, y \) - k_n^V \( thin dot.op thin \, y' \) #scale(x: 120%, y: 120%)[\)] = delta_y - delta_(y') . $

Here $mu_n$ in the first equation is its vector of vertex masses. In particular, a difference of columns is exactly a unit-current voltage for the all-edge unit-conductance graph. No factor involving a degree or $2 n$ remains in this equation.

Define its kernel on the first tour by

$ k_n \( t \, s \) = k_n^V #scale(x: 120%, y: 120%)[\(] v_n^(\( 1 \)) \( floor.l 2 n t floor.r \) \, v_n^(\( 1 \)) \( floor.l 2 n s floor.r \) #scale(x: 120%, y: 120%)[\)] $

away from the irrelevant endpoints. Its integral operator is precisely the inverse on $cal(H)_n ∩ upright(bold(1))^perp$ extended by zero on constants and on $cal(H)_n^perp$. Indeed, integrating an arbitrary time function over the occurrences of a vertex is its orthogonal projection to $cal(H)_n$, multiplied by that vertex’s mass $mu_n \( v \)$. The kernel is symmetric and doubly centered.

Let $G$ be the round Green kernel for the unhalved Dirichlet integral in Proposition 37, and let $G_mu$ be its centering in both variables there. This normalization agrees with the voltage in (6.4): on the unit round sphere,

$ G \( x \, y \) = - frac(1, 2 pi) log "ch" \( x \, y \) + c_0 \, $

where $c_0$ gives zero round mean. Indeed the round Laplacian of $log "ch" \( x \, y \)$ is $- 1 \/ 2$ away from $y$, and its logarithmic singularity has flux $2 pi$; hence the displayed function has the distributional normalization (8.4). Define

$ k \( t \, s \) = G_mu \( eta_1 \( t \) \, eta_1 \( s \) \) . $

The proposition and the area pushforward show that $k$ is doubly centered and belongs to $L^2 \( \[ 0 \, 1 \]^2 \)$. For almost every quadruple $\( t \, t' \, s \, s' \)$, the four points

$ x = eta_1 \( t \) \, quad x' = eta_1 \( t' \) \, quad y = eta_1 \( s \) \, quad y' = eta_1 \( s' \) $

are distinct: their joint image law is $mu^(⊗ 4)$, and $mu$ is nonatomic. On such a quadruple, uniform tour tracking makes the four corresponding vertex sequences converge to these points. Theorem 23 applies pathwise to these sequences. Its unit-current normalization and the column equation above yield

#[#set math.equation(numbering: n => "(9.10)")
 $ frak(D) k_n \( t \, t' \, s \, s' \) arrow.r G \( x \, y \) - G \( x \, y' \) - G \( x' \, y \) + G \( x' \, y' \) = frak(D) k \( t \, t' \, s \, s' \) . $ <eq:voltage-kernel-limit>]

Centering cancels from the displayed four-point combination. This argument only uses distinct limiting positions; it makes no estimate near coincident positions.

Lemma 39 verifies assumptions (i) and (ii) of Lemma 40, with $p = 7 \/ 10 > 1 \/ 2$, while (9.10) verifies (iii). We have proved

#[#set math.equation(numbering: n => "(9.11)")
 $ lr(bar.v.double k_n - k bar.v.double)_(L^2 \( \[ 0 \, 1 \]^2 \)) = lr(bar.v.double K_n - K bar.v.double)_(upright("HS")) arrow.r 0 \, $ <eq:inverse-HS-convergence>]

where $K$ is the integral operator with kernel $k$. By Lemma 38, $U_1$ is unitary; the pushforward formula therefore identifies

$ K = U_1 K_h U_1^(- 1) \, $

where $K_h$ is the centered inverse of the continuum operator $B_h$ from Proposition 37. This also identifies the constant mode. The two parts of the argument have separate roles: four-point voltages identify the only possible centered kernel limit, while the block estimate supplies the compactness that ensures such a limit in $L^2$.

=== 9.3 Eigenvalues, heat traces, and the metric-measure coupling <eigenvalues-heat-traces-and-the-metric-measure-coupling>

#proof[
  Start with any sequence of sizes tending to infinity and pass to a common representation extraction as above. On its probability-one event, (9.11) holds. Let $kappa_i$, $i gt.eq 1$, be the positive eigenvalues of $K$ in decreasing order, with multiplicity. Proposition 37 says that $K_h$ is injective on the centered subspace of $L^2 \( mu \)$, which is infinite-dimensional. Thus every $kappa_i$ is positive and
  $ kappa_i = nu_i^(- 1) \, #h(2em) nu_i = 2 Lambda_i \( h \) \, quad i gt.eq 1 . $
  For a nonnegative compact self-adjoint operator $T$ on $H$, let $kappa_i \( T \)$ denote its positive eigenvalues in decreasing order, with multiplicity and with zeros appended after a finite list. The variational formula is
  $ kappa_i \( T \) = inf_(F subset H\
dim F = i - 1) med sup_(u in F^perp\
lr(bar.v.double u bar.v.double)_H = 1) chevron.l T u \, u chevron.r_H \, #h(2em) i gt.eq 1 \, $
  where $F$ ranges over linear subspaces. When $kappa_i \( T \) > 0$, the spectral theorem gives the upper bound by choosing the span of the first $i - 1$ eigenvectors, and the lower bound because $F^perp$ meets the span of the first $i$ eigenvectors nontrivially for every such $F$. When $kappa_i \( T \) = 0$, positivity gives the lower bound and a trial subspace containing the positive range gives the upper bound. For two such operators $T \, S$, their quadratic forms on any unit vector differ by at most $lr(bar.v.double T - S bar.v.double)_(upright("op"))$. Comparing the two suprema for each $F$, and then the two infima, therefore gives
  $ \| kappa_i \( T \) - kappa_i \( S \) \| lt.eq lr(bar.v.double T - S bar.v.double)_(upright("op")) . $
  Applying this to $K_n \, K$ yields
  $ \| kappa_(n \, i) - kappa_i \| lt.eq lr(bar.v.double K_n - K bar.v.double)_(upright("op")) lt.eq lr(bar.v.double K_n - K bar.v.double)_(upright("HS")) arrow.r 0 #h(2em) \( i gt.eq 1 \) . $
  The characterization applies with multiplicities and with zeros appended to the finite-rank spectra. Since $kappa_i > 0$, for each fixed $i$ the number $kappa_(n \, i)$ is positive for all sufficiently large $n$, and reciprocation gives $nu_(n \, i) arrow.r nu_i$. The constant eigenvalue is zero on both sides. With the conventions of Lemma 2 and Proposition 37,
  #[#set math.equation(numbering: n => "(9.12)")
   $ n lambda_(n \, i) = nu_(n \, i) / 2 arrow.r nu_i / 2 = Lambda_i \( h \) quad upright("for every ") i gt.eq 0 . $ <eq:target-eigenvalue-convergence>]
  Zero padding for the inverses is exactly the prescribed infinite padding for the finite generator spectra. This proves coordinatewise convergence, including every multiplicity, with acceleration exactly $n$.
  For the heat traces, use $e^(- t oo) = 0$ to write
  $ H_n \( t \) = 1 + sum_(i gt.eq 1) e^(- t nu_(n \, i) \/ 2) \, #h(2em) H_h \( t \) = 1 + sum_(i gt.eq 1) e^(- t nu_i \/ 2) . $
  Fix $0 < delta < T < oo$. For $N gt.eq i_0$, the high-index bound (9.5) gives, for all sufficiently large $n$,
  #[#set math.equation(numbering: n => "(9.13)")
   $ sup_(delta lt.eq t lt.eq T) sum_(i > N) e^(- t nu_(n \, i) \/ 2) lt.eq sum_(i > N) e^(- delta c_(*) i^p \/ 2) arrow.r 0 quad upright("as ") N arrow.r oo . $ <eq:uniform-heat-tail>]
  The summability follows, for example, by comparison with the integral of $e^(- delta c_(*) x^p \/ 2)$. Passing to the limit in each fixed index in (9.5) gives the same bound for $nu_i$ and the same estimate for the continuum tail. For a fixed finite set of indices, (9.12) gives uniform convergence of the corresponding exponential terms on $\[ delta \, T \]$, since for finite $x \, y gt.eq 0$,
  $ sup_(delta lt.eq t lt.eq T) \| e^(- t x \/ 2) - e^(- t y \/ 2) \| lt.eq T / 2 \| x - y \| . $
  Combining the finite sums and (9.13) proves $H_n arrow.r H_h$ uniformly on $\[ delta \, T \]$, hence in $C_(upright("loc")) \( \( 0 \, oo \) \)$. Finiteness and measurability of the limiting heat trace were established in Proposition 37.
  It remains to express the metric and measure convergence in the requested intrinsic topology. This uses the same coordinate sphere as the inverse kernel above. Write $Gamma_n$ and $Gamma$ for the two graphs in (2.3), and let $epsilon_n arrow.r 0$ bound their Hausdorff distance in the maximum product metric of round distance and ordinary distance on $\[ 0 \, oo \)$. By uniform continuity of $D_h$ on $bb(S)^2 times bb(S)^2$, its modulus
  $ omega_h \( r \) = sup { \| D_h \( x \, y \) - D_h \( x' \, y' \) \| : d_(upright("round")) \( x \, x' \) + d_(upright("round")) \( y \, y' \) lt.eq r #scale(x: 120%, y: 120%)[}] $
  tends to zero as $r arrow.b 0$. Approximating each point of $Gamma_n$ by a point of $Gamma$ gives
  #[#set math.equation(numbering: n => "(9.14)")
   $ sup_(u \, v in V_n) \| a_n d_n \( u \, v \) - D_h \( z_n \( u \) \, z_n \( v \) \) \| lt.eq epsilon_n + omega_h \( 2 epsilon_n \) arrow.r 0 . $ <eq:coordinate-distortion>]
  Approximating $\( x \, x \, 0 \) in Gamma$ in the opposite direction also shows that $z_n \( V_n \)$ is $epsilon_n$-dense in the round sphere.
  The pushed measures $macron(mu)_n = \( z_n \)_(*) mu_n$ converge weakly to $mu$ by Proposition 5. On the compact round sphere this is convergence in Prokhorov distance. Choose $rho_n arrow.b 0$ larger than that distance and than $epsilon_n$. The coupling characterization of Prokhorov distance gives a coupling of $macron(mu)_n$ and $mu$ assigning mass at least $1 - rho_n$ to pairs at round distance at most $rho_n$. Lift it to a coupling of $mu_n$ and $mu$ by the finite conditional distribution of a vertex given its projection $z_n \( v \)$. The relation
  $ cal(R)_n = { \( v \, x \) in V_n times bb(S)^2 : d_(upright("round")) \( z_n \( v \) \, x \) lt.eq rho_n } $
  is a correspondence, by round density, and the lifted coupling gives it mass at least $1 - rho_n$. Its distortion for $a_n d_n$ and $D_h$ is at most
  $ epsilon_n + omega_h \( 2 epsilon_n \) + omega_h \( 2 rho_n \) \, $
  by (9.14). This tends to zero. For completeness, if a correspondence $cal(R)$ between spaces $X \, Y$ has distortion less than $2 xi$, the cross-distance
  $ d \( x \, y \) = inf_(\( x' \, y' \) in cal(R)) #scale(x: 120%, y: 120%)[\(] d_X \( x \, x' \) + xi + d_Y \( y' \, y \) #scale(x: 120%, y: 120%)[\)] $
  together with the original distances gives a metric on their disjoint union. The distortion inequality verifies the triangle inequalities that cross between the spaces. Related pairs have distance at most $xi$, so the Hausdorff distance is at most $xi$. A coupling giving the relation mass at least $1 - rho$ makes the Prokhorov distance at most $max { xi \, rho }$. Apply this with $xi = 1 / 2 "dis" \( cal(R)_n \) + 1 \/ n$ and $rho = rho_n$. We obtain
  $ \( V_n \, a_n d_n \, mu_n \) arrow.r \( bb(S)^2 \, D_h \, mu_h \) quad upright("in Gromov–Hausdorff–Prokhorov distance") . $
  The normalization $a_n$ here is exactly the deterministic diameter normalization in Theorem 1; its identification with the scale in the companion distance graph was proved in Lemma 4.
  All three convergences have been proved on this one representation with the same $mu_h$, $D_h$, and conformal sphere. The conformal or anticonformal sign retained by Proposition 5 preserves the round Dirichlet integral, so it also preserves the spectrum defined from this sphere. The continuum spectral readouts are measurable functions of its area in that coordinate by Proposition 37. Thus the joint limiting law on this extraction is the one in Theorem 1, with its stated clock.
  Every original subsequence permits a further common extraction with these almost-sure conclusions. The Gromov–Hausdorff–Prokhorov space of compact metric probability spaces, the coordinatewise product $\[ 0 \, oo \]^(bb(N)_0)$, and $C_(upright("loc")) \( \( 0 \, oo \) \)$ are Polish. The subsequence criterion for convergence in distribution therefore gives the asserted joint convergence through all positive integers $n$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
