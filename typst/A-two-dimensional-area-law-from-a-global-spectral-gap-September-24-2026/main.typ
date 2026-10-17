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

#align(center)[#text(size: 16pt, weight: "bold")[A two-dimensional area law from a global spectral gap]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The entanglement entropy of a pure quantum state measures how much information is shared by a region and its complement. Its elementary upper bound is proportional to the number of sites in the region. An area law replaces this volume by the number of interactions crossing the region’s boundary. We prove such a bound for the unique gapped ground state of a general finite-range Hamiltonian in two dimensions.

=== 1.1 The setting and the theorem <the-setting-and-the-theorem>

Let $Lambda subset bb(Z)^2$ be finite. Its edges join pairs at Euclidean distance one, so that $Lambda$ carries the induced square-lattice graph. Write $d_Lambda$ for graph distance, with value $+ oo$ between different components. At each site put a copy of $bb(C)^q$, and write $cal(H)_Lambda = ⨂_(x in Lambda) bb(C)^q$. An operator supported on $X subset.eq Lambda$ acts as the identity on the other tensor factors. An admissible Hamiltonian has the form

#[#set math.equation(numbering: n => "(1.1)")
 $ H = sum_(diameter eq.not X subset.eq Lambda\
"diam"_(d_Lambda) X lt.eq R) h_X \, #h(2em) h_X = h_X^(*) \, #h(2em) lr(bar.v.double h_X bar.v.double) lt.eq J . $ <eq:hamiltonian>]

There is one summand for each support $X$; a summand may be zero. Here $q gt.eq 1$ and $R gt.eq 0$ are fixed integers and $J > 0$ is fixed. This indexing convention bounds the sum of interaction norms at every site in terms of $R \, J$ alone.

For $A subset.eq Lambda$ define the edge boundary

$ partial_Lambda A = { { x \, y } : x in A \, med y in Lambda \\ A \, med \| x - y \|_1 = 1 } . $

If $Omega in cal(H)_Lambda$ is a unit vector, write $rho_A = "Tr"_(Lambda \\ A) \| Omega chevron.r chevron.l Omega \|$ and $S_Omega \( A \) = - "Tr" rho_A log rho_A$, with $0 log 0 = 0$. All logarithms are natural.

#thm([Theorem 1.1.])[
  (Area law).  #emph[For every $q \, R \, J$ as above and every $Delta > 0$, there is a finite constant $C = C \( q \, R \, J \, Delta \)$ with the following property. Suppose that $Lambda$ is a finite induced square-lattice domain and that the Hamiltonian (1.1) has a unique normalized ground vector $Omega$, up to phase, with ground energy $E_0$, and satisfies 
$ H - E_0 "id" med gt.eq med Delta #scale(x: 120%, y: 120%)[\(] "id" - \| Omega chevron.r chevron.l Omega \| #scale(x: 120%, y: 120%)[\)] . $

 Then for every $A subset.eq Lambda$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ S_Omega \( A \) lt.eq C thin \| partial_Lambda A \| . $ <eq:area-law>]

 The same constant applies to all such domains, sets, and Hamiltonians.]
] <thm:area>

The distance in (1.1) is the distance within the induced graph. This distinction matters for domains with holes or disconnected components. The spectral assumption concerns the full Hamiltonian; no gap assumption is imposed on Hamiltonians restricted to smaller regions.

For completeness, the theorem also gives the usual vertex-boundary formulations. Define

$ partial_(upright("in")) A = { x in A : exists y in.not A \, med { x \, y } in partial_Lambda A } \, #h(2em) Z_A = union.big_(e in partial_Lambda A) e . $

#thm([Corollary 1.2.])[
  #emph[The conclusion of Theorem 1 holds for every subset of a finite rectangular square lattice with bounded on-site and nearest-neighbor interactions and a unique ground state separated by a fixed global gap. For every domain covered by that theorem it also implies 
$ S_Omega \( A \) lt.eq 4 C \| partial_(upright("in")) A \| \, #h(2em) S_Omega \( A \) lt.eq 2 C \| Z_A \| . $

]
] <cor:rectangles>

#proof[
  On-site and nearest-neighbor interactions have graph range at most one. Each inner boundary vertex is incident with between one and four crossing edges, so $\| partial_(upright("in")) A \| lt.eq \| partial_Lambda A \| lt.eq 4 \| partial_(upright("in")) A \|$. Counting both endpoints gives $\| Z_A \| lt.eq 2 \| partial_Lambda A \| lt.eq 4 \| Z_A \|$. These inequalities include empty boundaries. ◻
]

=== 1.2 History and related work <history-and-related-work>

The relation between entanglement and boundary area arose in quantum-field calculations motivated by black-hole entropy. Bombelli, Koul, Lee, and Sorkin related entropy from tracing inaccessible quantum-field degrees of freedom to black-hole area #cite(label("BombelliEtAl1986")); Srednicki subsequently found area scaling numerically for a spherical region in the vacuum of a regulated free massless scalar field #cite(label("Srednicki1993")). These calculations motivated the entanglement area-law question through regulated field models. For finite-dimensional lattice spins, the gap-to-area conjecture asks whether a unique ground state has an entropy bound proportional to boundary area when local dimension, interaction range and strength are bounded and the spectral gap has a size-independent positive lower bound #cite(label("Hastings2007")) #cite(label("AradLandauVazirani2012")). Theorem 1 gives an affirmative answer in the stated two-dimensional induced-domain setting.

In one dimension, Hastings proved a length-independent entropy bound for the unique ground state of a finite-range Hamiltonian with uniformly bounded interactions, fixed local dimension, and a positive spectral gap #cite(label("Hastings2007")). Arad, Landau, and Vazirani improved the dependence on the inverse gap for frustration-free chains using approximate ground-state projectors #cite(label("AradLandauVazirani2012")). These are operators that preserve the ground vector while contracting its orthogonal complement, with controlled growth of Schmidt rank. Arad, Kitaev, Landau, and Vazirani extended this approach to general, possibly frustrated chains #cite(label("AradKitaevLandauVazirani2013")). A complementary result of Brandão and Horodecki derives an area law for pure one-dimensional states from exponential decay of correlations between arbitrary separated regions #cite(label("BrandaoHorodecki2015")). This region-wise hypothesis is stronger than decay of single-site correlation functions. More generally, the exponential clustering theorem relates a spectral gap to decay of connected correlations of separated observables #cite(label("NachtergaeleSims2006")); an entropy estimate requires control of the reduced state’s full spectrum. Anshu, Harrow, and Soleimanifar obtained boundary-dependent bounds on smooth entanglement spread, which measures the width of the significant part of that spectrum, including square-root boundary scaling on lattices up to logarithmic factors #cite(label("AnshuHarrowSoleimanifar2022")). Such a width estimate leaves the location of the spectrum, and hence its entropy, to be controlled.

Strict area-law bounds in higher dimensions are also known for restricted model classes. Cramer, Eisert, Plenio, and Dreißig proved such a bound for arbitrary regions in cubic harmonic lattices with a finite-range positive potential matrix whose condition number is uniformly bounded #cite(label("CramerEisertPlenioDreissig2006")). These Gaussian models have infinite-dimensional oscillator sites and provide a comparison with the finite-dimensional spin setting considered here.

Other higher-dimensional results make additional spectral or thermodynamic assumptions. Masanes obtained bounds with logarithmic corrections from correlation decay and bounds on the number of low-energy states of restricted Hamiltonians #cite(label("Masanes2009")); Brandão and Cramer obtained a logarithmically corrected bound for cubic regions under a low-temperature heat-capacity hypothesis #cite(label("BrandaoCramer2015")). Cho proved strict area scaling for balls along boundary-growth families satisfying uniform gaps and an additional compatibility condition on successive reduced ground states #cite(label("Cho2014")). These conditions supply information beyond the gap of the single full Hamiltonian considered here.

For two-dimensional spin systems, Anshu, Arad, and Gosset proved a subvolume bound for rectangular regions in a rectangular lattice with plaquette projector interactions, a unique frustration-free ground state, and a uniform local gap #cite(label("AnshuAradGosset2022Subvolume")). At fixed local dimension and local gap, the bound is $O \( b^(5 \/ 3) log^(7 \/ 3) \( 2 + b \) \)$, where $b$ is the rectangle’s boundary size. Their subsequent result gives

$ S lt.eq n^(thin 1 + O \( \( log n \)^(- 1 \/ 5) \)) $

across a vertical cut of length $n$, again for locally gapped, frustration-free plaquette projector models with a unique ground state #cite(label("AnshuAradGosset2022Area")). The local-gap assumption concerns restrictions of the Hamiltonian; it is stronger than a gap for the full system alone. The latter entropy bound is near-linear, and its theorem concerns vertical cuts. The setting considered here allows frustrated interactions, assumes a gap only for the full Hamiltonian, and includes arbitrary regions in arbitrary finite induced square-lattice domains. Arad, Firanko, and Jain extend approximate-projector methods to maximally mixed ground states and bound their mutual information, with a two-dimensional application under frustration-free and local-gap assumptions #cite(label("AradFirankoJain2026")).

The proof below combines locality estimates with ways of expressing entropy through operator norms. For locality, we use the Lieb–Robinson framework #cite(label("LiebRobinson1972")) #cite(label("NachtergaeleOgataSims2006")) and Kitaev’s centered spectral filter #cite(label("Kitaev2006Anyons")) Appendix D.1.2. Swingle and McGreevy discuss positive constraints obtained by squaring filtered terms, for which retaining a gap is a separate issue #cite(label("SwingleMcGreevy2016")) Section 8.4. Here taking absolute values gives the operator domination that retains the full-system gap. Later, products of positive contractions derived from these constraints preserve the ground state and suppress excitations, as projection products do in detectability-lemma arguments #cite(label("AnshuAradVidick2016")). Their localization uses propagation estimates for unital channels, related to dissipative Lieb–Robinson bounds #cite(label("BarthelKliesch2012")); the coupled random-product estimate needed here is proved in Section 10.

For the entropy comparison, bounds on local entanglement production are a precedent for controlling logarithmic commutators independently of spectator dimensions #cite(label("VanAcoleyenMarienVerstraete2013")). Section 3 proves the quadratic real-part estimate needed for our marginal tails. Strong subadditivity and conditional-entropy continuity supply the entropy inequalities used throughout #cite(label("LiebRuskai1973")) #cite(label("AlickiFannes2004")) #cite(label("Winter2016")). We encode marginal spectra on symmetric tensor powers using Schur–Weyl duality #cite(label("EtingofEtAl2011")), whose connection with spectrum estimation is developed by Keyl and Werner #cite(label("KeylWerner2001")). The passage back to one-copy vectors uses finite quantum de Finetti measures #cite(label("ChristandlEtAl2007")) #cite(label("LewinNamRougerie2015")) and the product calculus of symmetrized finite observables #cite(label("RaggioWerner1989")). Weighted operator geometric means #cite(label("PuszWoronowicz1975")) #cite(label("KuboAndo1980")) combine the changing partitions, while the modular comparison starts from the resolvent-compression identity of Carlen and Vershynina #cite(label("CarlenVershynina2019")) Lemma 2.1. The detailed construction uses these ingredients to compare entropy gain and excitation energy in the same family of states; the next overview explains how that comparison leads to the area bound.

=== 1.3 A tensor-network consequence <a-tensor-network-consequence>

A projected entangled-pair state (PEPS) is specified by one tensor at each lattice site, with a physical index for that site’s state and one virtual index for each incident edge. Contracting the paired virtual indices gives a many-body vector. The dimension of an edge index is its bond dimension. The approximation problem asks how large these dimensions must be to approximate the ground vector on the original lattice.

The companion #cite(label("OpenAI2026PolynomialPEPS")) Theorem 1.1 proves a polynomial bound for the original open $L times L$ square grid, $L gt.eq 2$, with on-site and nearest-neighbor interactions. For fixed local dimension $q gt.eq 2$, term-norm bound $J > 0$, and global gap $Delta > 0$, every unique ground vector in this class has a PEPS approximation with maximum bond dimension at most $C L^c$ and global vector error at most $L^(- 1)$ after normalization and phase choice. The constants depend only on $q \, J \, Delta$. This is an existence result; it does not assert an efficient tensor construction or contraction algorithm.

The approximation uses more than the entropy inequality. This paper also provides positive operators that annihilate the ground vector and have rapidly decaying spatial tails (Proposition 10), quantitative information bounds across collars (Propositions 30 and 32), and two families of geometrically separated regions (Proposition 34), with the region shapes and clearances specified in those results. The companion combines these estimates and the geometric ordering with additional compression and routing arguments; its PEPS result is a consequence of that further analysis.

=== 1.4 How the proof is organized <how-the-proof-is-organized>

Fix the set $A$ whose entropy is to be bounded, and let $Z_A$ be its crossing-edge endpoints. For disjoint physical regions $B \, C$, write

$ I_Omega \( B : C \) = S_Omega \( B \) + S_Omega \( C \) - S_Omega \( B union C \) $

for their mutual information. Our analytic goal is to make this quantity small when $B$ lies inside $A$ and $C$ is beyond a suitable collar, even when $C$ includes all of $Lambda \\ A$. Here is why this suffices. Suppose that, after removing a set $D$ of $O \( \| partial_Lambda A \| \)$ sites, we can partition $A$ into two ordered families of regions. If each region shares little information with the complement of $A$ together with the earlier regions of its own family, two applications of the entropy chain rule cancel all individual region entropies. Purity then bounds $S_Omega \( A \)$ by $\| D \| log q$ and the sum of the information errors. Section 11 constructs regions with the required ordering and separation.

The analytic estimates concern intersections of $A$ with ambient boxes or finite unions of rectangles and triangles. Their clearance is from $Z_A$; they may meet holes or the edge of the physical domain. Hamiltonian locality and propagation always use neighborhoods in the induced graph. The argument has five stages.

+ #emph[Obtain a first exponent below volume.] Section 3 uses the global gap to bound fluctuations of the negative logarithms of positive marginal eigenvalues. It then optimizes products of positive operators on nested rectangles. Two bounds on the optimized norm, one using the energy estimate and global gap, give a conditional-entropy discount, and hence
  $ S_Omega \( A ∩ Q \) lt.eq C r^(1 + e_0) \, #h(2em) e_0 < 1 \, $
  for a box $Q$ of side at most $r$ sufficiently far from $Z_A$.
+ #emph[Control information and energy in the same interpolation.] Section 4 replaces the Hamiltonian by a sum of positive operators that annihilate $Omega$ separately, retain a global gap, and have rapidly decaying graph-local tails. Sections 5–7 associate positive operators to partitions of the full system and interpolate between them as a small subsystem changes parts. These operators act on symmetric tensor powers, whose vectors are fixed by every permutation of the copies. Applying an inverse power of the interpolating operator to a vector built from ground-state copies and an auxiliary entangled pair defines the filtered vector whose norm we study. As the copy number grows, logarithmic norms per copy can be compared with combinations of marginal entropies. The decrease of a suitable logarithmic squared norm is bounded below by averaged conditional mutual information, up to a small error. The same transported states bound the energy cost. This common control permits a comparison of information gained with excitation energy spent.
+ #emph[Compare the norms and scan a collar.] Section 8 gives two bounds on the negative logarithm of the filtered vector’s norm. Auxiliary dimensions are chosen from a high-probability part of the target’s Schmidt spectrum. Projecting the target and an auxiliary system onto an entangled pair gives the upper bound. The lower bound uses the global gap: low physical energy forces most copies into the ground state. Section 9 moves the partitions through a collar according to a finite randomized schedule. Each interaction is rarely split by a moving boundary, and the schedule supplies an interpolation with sufficiently low energy. The two norm bounds first improve the box exponent repeatedly; their sharper form then gives
  $ I_Omega \( A ∩ T : Lambda \\ \( A ∩ T_L \) \) lt.eq C n^(1 - epsilon) . $
  Here $T$ is one of the finite unions of controlled rectangles and triangles specified in Definition 27, $epsilon > 0$ is fixed, and $T_L$ is the ambient sup-norm enlargement by $L = floor.l n^(1 - epsilon) floor.r$. These targets and their allowed enlargements have $O \( n \)$ boundary edges. The entire finite physical and auxiliary system and schedule are fixed before the copy number tends to infinity.
+ #emph[Amplify the information bound.] Section 10 uses typical spectral subspaces to construct a candidate operator for restoring a target moved to an auxiliary reference. Its norm is controlled by the collar information. A localized product of contractions derived from the positive constraints suppresses the excited component, and polar decomposition yields a unitary comparison near the target. This unitary leaves both the reference and the remote physical system untouched; comparison with a state in which they are independent bounds their original mutual information. Enlarging the collar by a sublinear radius makes the bound smaller than any prescribed inverse power of $n$.
+ #emph[Arrange the regions for entropy cancellation.] Section 11 builds the two ordered families described above. The collar around each region avoids the complement of $A$ and all earlier regions of its own family. Narrow strips and recursive repairs at point contacts produce these separations for arbitrary cuts while leaving only $O \( \| partial_Lambda A \| \)$ sites uncovered. The information errors are summable over the regions, so the two entropy chains prove (1.2).

== 2 Entropy and induced-graph locality <sec:prelim>

We record the finite-dimensional conventions and elementary uniform bounds used throughout the proof. Unless specified otherwise, entropies refer to the original ground vector $Omega$. A changed state is shown by a subscript. Juxtaposition of disjoint systems denotes their tensor product or their union.

=== 2.1 Entropy identities and continuity <entropy-identities-and-continuity>

For a density matrix $rho$ on systems $D \, E \, F$, define

$ S \( D \| E \)_rho = S \( D E \)_rho - S \( E \)_rho \, quad I \( D : E \)_rho = S \( D \)_rho + S \( E \)_rho - S \( D E \)_rho \, $

and

$ I \( D : F \| E \)_rho = S \( D E \)_rho + S \( E F \)_rho - S \( E \)_rho - S \( D E F \)_rho . $

We use strong subadditivity, $I \( D : F \| E \)_rho gt.eq 0$, for normalized finite-dimensional density operators #cite(label("LiebRuskai1973")). It implies that conditioning decreases conditional entropy and that discarding systems cannot increase mutual information. Subadditivity and purification give $\| S \( D \| E \) \| lt.eq log dim D$. For a pure state the entropies of complementary systems coincide. These facts also hold with empty regions, whose Hilbert spaces are the one-dimensional empty tensor product.

Write $h \( u \) = - u log u - \( 1 - u \) log \( 1 - u \)$ for binary entropy. The trace distance of two states is half the trace norm of their difference. The continuity estimate below uses the dimension-independent conditional entropy method of Alicki and Fannes #cite(label("AlickiFannes2004")), in Winter’s sharpened form #cite(label("Winter2016")).

#thm([Lemma 2.1.])[
  (Continuity with a fixed controlled system).  #emph[Let $rho \, sigma$ be density operators on finite-dimensional $D ⊗ E$, and put $delta = 1 / 2 lr(bar.v.double rho - sigma bar.v.double)_1 lt.eq 1$ and $d_D = dim D$. Then 
#[#set math.equation(numbering: n => "(2.1)")
 $ \| S \( D \| E \)_rho - S \( D \| E \)_sigma \| lt.eq 2 delta log d_D + \( 1 + delta \) h (frac(delta, 1 + delta)) lt.eq C sqrt(delta) log \( e d_D \) . $ <eq:conditional-continuity>]

 The same estimates hold for $S \( D \)$ by making $E$ trivial. Summing the bounds for $S \( D \)$ and $S \( D \| E \)$ therefore bounds the continuity cost for $I \( D : E \)$ in terms of $d_D$, independently of $dim E$.]
] <lem:continuity>

#proof[
  We include the mixture argument for the bound in #cite(label("Winter2016")) Lemma 2. If $tau = sum_j p_j tau_j$, adding a classical register that records $j$ shows
  $ 0 lt.eq S \( D \| E \)_tau - sum_j p_j S \( D \| E \)_(tau_j) lt.eq H \( p \) . $
  For the lower bound, condition on that register and use strong subadditivity. For the upper bound, use the ordinary mixing upper bound on $S \( D E \)$ and concavity of $S \( E \)$. The ordinary bound follows by recording a duplicate of the classical register: its conditional entropy given $D E$ is nonnegative after this further conditioning.
  If $delta > 0$, write the Jordan decomposition $rho - sigma = delta \( tau_(+) - tau_(-) \)$, where $tau_plus.minus$ are states. Then
  $ frac(rho + delta tau_(-), 1 + delta) = frac(sigma + delta tau_(+), 1 + delta) . $
  Apply the mixture bounds to both expressions and use $\| S \( D \| E \)_(tau_(+)) - S \( D \| E \)_(tau_(-)) \| lt.eq 2 log d_D$. This proves the first inequality. The second follows from the elementary bound $h \( u \) lt.eq C sqrt(u)$. The case $delta = 0$ is immediate. Finally, $I \( D : E \) = S \( D \) - S \( D \| E \)$, so the two displayed entropy bounds apply. ◻
]

The trace distance between pure states represented by unit vectors $xi \, eta$ is at most $lr(bar.v.double xi - eta bar.v.double)$. We will use Lemma 3 on regions with a controlled number of sites, or with the controlled region as the first argument of a conditional entropy. In this way estimates never acquire the dimension of an uncontrolled complement.

=== 2.2 Local counting and degenerate cases <local-counting-and-degenerate-cases>

For a site $x$ let $B_Lambda \( x \, r \) = { y : d_Lambda \( x \, y \) lt.eq r }$. A path of length $r$ has ambient $ell^1$ displacement at most $r$; hence, for an integer $r gt.eq 0$,

#[#set math.equation(numbering: n => "(2.2)")
 $ \| B_Lambda \( x \, r \) \| lt.eq v_r := 1 + 2 r \( r + 1 \) . $ <eq:ball-count>]

For a physical set $D$ put $N_r^Lambda \( D \) = { x : d_Lambda \( x \, D \) lt.eq r }$. We reserve graph neighborhoods for support and propagation estimates. An ambient dilation of a finite set $T subset bb(Z)^2$ is instead $T_j = T + \( \[ - j \, j \]^2 ∩ bb(Z)^2 \)$ for integer $j gt.eq 0$.

Assign each nonzero interaction in (1.1) an anchor in its support. The number of terms containing any prescribed site is at most

$ mu_R := 2^(v_R - 1) \, $

because each such support is a subset of its radius-$R$ graph ball containing that site. In particular, the number of anchored terms at a site is at most $mu_R$, and the sum of norms of terms containing that site is at most $J mu_R$. Terms with scalar identity factors still obey these bounds with their assigned supports.

Call an assigned support #emph[split] by a set $D$ when it meets both $D$ and $Lambda \\ D$. For a split support, a graph path of length at most $R$ from its anchor to a point of the opposite side crosses $partial_Lambda D$. The anchor is therefore within graph distance $R$ of a crossing-edge endpoint. Consequently,

#[#set math.equation(numbering: n => "(2.3)")
 $ \# { upright("terms split by ") D } lt.eq 2 v_R mu_R \| partial_Lambda D \| . $ <eq:crossing-count>]

Across any bipartition, a term can be decomposed by matrix units on its finite support into a bounded number of product operators, with bounded factors. For the original interactions the bounds depend only on $q \, R \, J$.

If $q = 1$ or $Lambda = diameter$, all entropies vanish. When $R = 0$, the Hamiltonian is a sum of on-site operators. Uniqueness of its ground state then makes that state a tensor product, so the theorem also follows. We may henceforth assume $q gt.eq 2$, $R gt.eq 1$, and a nonempty domain.

#thm([Lemma 2.2.])[
  (A cut with no crossing edge).  #emph[Under the hypotheses of Theorem 1, if $partial_Lambda A = diameter$, then $S_Omega \( A \) = 0$.]
] <lem:zero-boundary>

#proof[
  Such a set $A$ is a union of graph components. Every support of finite graph diameter lies in one component, so $H$ is the tensor sum of component Hamiltonians. Its ground eigenspace is the tensor product of their ground eigenspaces. If the former is one-dimensional, so is each latter space. The ground vector factors over the components and therefore over the cut. ◻
]

All constants denoted by $C \, c > 0$ below may change at different occurrences. Unless a lemma specifies additional fixed data, they depend only on $q \, R \, J \, Delta$. They never depend on the domain, the cut, or the particular Hamiltonian. Additional numerical exponents and sufficiently large thresholds will be fixed in the order stated in the proof.

== 3 Marginal tails and an initial box estimate <sec:initial>

This section supplies two inputs to the proof: a moment bound for marginal spectra and an entropy bound strictly below the volume of a rectangle that stays away from the prescribed cut. The spectral gap first controls the fluctuations of the negative logarithms of marginal eigenvalues. To bound the entropy itself, we then optimize a product of positive operators on nested rectangles. An energy estimate and a trial using a Schmidt vector give opposite bounds on the norm of the filtered ground vector. Comparing them discounts the conditional entropy of the innermost rectangle. Averaging the entropy chain rule over orders of small rectangles turns this discount into a subvolume bound.

=== 3.1 A marginal spectral estimate <a-marginal-spectral-estimate>

Boundary-dependent concentration of entanglement spectra was established by Anshu, Harrow, and Soleimanifar through smooth entanglement spread, with square-root boundary scaling on lattices up to logarithmic factors #cite(label("AnshuHarrowSoleimanifar2022")). The estimate below instead controls the moment-generating function of the marginal surprisal centered at its entropy. We prove it directly by tilting the ground vector and comparing its excitation energy with the global gap.

The following lemma does not require a lattice. Its dependence on the logarithm of each interaction’s supporting dimension will also allow us to apply it to the truncated interactions constructed in Section 4. A related precedent is the bound on local entanglement production whose constant is independent of spectator dimensions #cite(label("VanAcoleyenMarienVerstraete2013")). Here the required estimate is a quadratic bound on the real part of the change under conjugation; we prove it below.

#thm([Lemma 3.1.])[
  (Marginal moment and tail bounds).  #emph[Let $cal(H) = ⨂_(v in V) cal(H)_v$ be a finite tensor product of finite-dimensional Hilbert spaces. Let $sans(H) = sum_(i in cal(I)) h_i$, where $cal(I)$ is finite, each $h_i$ is self-adjoint, $lr(bar.v.double h_i bar.v.double) lt.eq c_0$ for a fixed $c_0 gt.eq 0$, and $h_i$ has a designated support $D_i subset.eq V$. Suppose that $sans(H)$ has a one-dimensional ground space spanned by a normalized vector $Psi$, ground energy $E_0$, and gap at least $g_0 > 0$. Fix a bipartition $B union.sq B^c = V$. Let $cal(I)_times$ be the indices whose designated support meets both sides, and put 
$ rho = "Tr"_(B^c) \| Psi chevron.r chevron.l Psi \| \, #h(2em) d_i = product_(v in D_i) dim cal(H)_v \, #h(2em) cal(B) = 1 + sum_(i in cal(I)_times) log^2 \( upright(e) d_i \) . $

 Let $p_j$ be the positive eigenvalues of $rho$, let $K$ take the value $- log p_j$ with probability $p_j$, and write $S = S \( rho \)$ and $theta.alt = c_0 \/ g_0$. Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ log bb(E) upright(e)^(u K) lt.eq u S + 512 upright(e) thin theta.alt cal(B) u^2 \, #h(2em) \| u \| lt.eq frac(1, 32 sqrt(\( 1 + theta.alt \) cal(B))) . $ <eq:initial-tail-mgf>]

 Consequently, for every $w gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ Pr { \| K - S \| > w } lt.eq min {1 \, thin 2 upright(e)^(upright(e) \/ 2) exp (- frac(w, 32 sqrt(\( 1 + theta.alt \) cal(B))))} . $ <eq:initial-tail-probability>]

]
] <lem:tail>

#proof[
  Put $M \( u \) = sum_j p_j^(1 - u)$ and $L \( u \) = log M \( u \)$. Let $P$ be the support projection of $rho$. On $P cal(H)_B$ define $F = rho^(- u \/ 2)$, and extend $F$ by the identity on the kernel of $rho$. The normalized tilted vector and its marginal are
  $ Theta = frac(F Psi, sqrt(M \( u \))) \, #h(2em) sigma = "Tr"_(B^c) \| Theta chevron.r chevron.l Theta \| = frac(rho^(1 - u), M \( u \)) \, $
  where the last power is zero on the kernel. Since $F$ is invertible on the whole space,
  #[#set math.equation(numbering: n => "(3.3)")
   $ F sans(H) F^(- 1) Theta = E_0 Theta . $ <eq:initial-exact-tilt>]
  An interaction supported in $B^c$ is unchanged by this conjugation. An interaction supported in $B$ has unchanged expectation, because
  $ "Tr" sigma F h_i F^(- 1) = "Tr" sigma h_i $
  by $\[ F \, sigma \] = 0$ and cyclicity. Thus only crossing interactions contribute to the excitation energy of $Theta$.
  Fix such an interaction. For every complex $z$, use the support convention
  $ sigma^z = P exp #scale(x: 120%, y: 120%)[\(] z log \( sigma \|_(P cal(H)_B) \) #scale(x: 120%, y: 120%)[\)] P \, #h(2em) f_i \( z \) = chevron.l Theta \, sigma^z h_i sigma^(- z) Theta chevron.r . $
  This is an entire scalar function. Although $sigma^0 = P$, the vector $Theta$ lies in its support, so $f_i \( 0 \) = chevron.l Theta \, h_i Theta chevron.r$. At
  $ z_u = - frac(u, 2 \( 1 - u \)) $
  the two scalar normalization factors cancel, giving
  #[#set math.equation(numbering: n => "(3.4)")
   $ f_i \( z_u \) = chevron.l Theta \, F h_i F^(- 1) Theta chevron.r . $ <eq:initial-support-conjugation>]
  Indeed, on the support, $sigma^(z_u) = M \( u \)^(- z_u) F$ and $sigma^(- z_u) = M \( u \)^(z_u) F^(- 1)$. The endpoint support projections in the expectation remove any matrix elements entering the kernel.
  On the imaginary axis the powers are unitary on the support, and hence $\| f_i \( upright(i) y \) \| lt.eq c_0$. Decompose $h_i$ across the cut by matrix units on its portion in $B$:
  $ h_i = sum_(alpha = 1)^(N_i) c_alpha ⊗ d_alpha \, #h(2em) N_i lt.eq d_i^2 \, #h(2em) lr(bar.v.double c_alpha bar.v.double) lr(bar.v.double d_alpha bar.v.double) lt.eq c_0 . $
  Here each factor acts as the identity outside the appropriate portion of $D_i$. If $s_j$ are the positive Schmidt probabilities of $Theta$, a product contributes terms with scalar coefficient $s_j^(1 \/ 2 + z) s_k^(1 \/ 2 - z)$. For $\| Re z \| lt.eq 1 \/ 4$,
  $ \| s_j^(1 \/ 2 + z) s_k^(1 \/ 2 - z) #scale(x: 120%, y: 120%)[\|] lt.eq s_j + s_k . $
  Moreover, in the two Schmidt bases, Cauchy–Schwarz bounds every row and column sum of $\| \( c_alpha \)_(j k) \( d_alpha \)_(j k) \|$ by $lr(bar.v.double c_alpha bar.v.double) lr(bar.v.double d_alpha bar.v.double)$. Compression to the Schmidt supports does not increase either norm. Summing first over a row or a column therefore gives
  $ \| f_i \( z \) \| lt.eq 2 c_0 d_i^2 #h(2em) \( \| Re z \| lt.eq 1 \/ 4 \) . $
  These bounds are uniform in $Im z$. Apply the three-lines theorem on each of the two strips between real parts $0$ and $plus.minus 1 \/ 4$. Writing $ell_i = log \( upright(e) d_i \)$, we obtain
  #[#set math.equation(numbering: n => "(3.5)")
   $ \| f_i \( z \) \| lt.eq upright(e) c_0 #h(2em) (\| Re z \| lt.eq delta_i := frac(1, 8 ell_i)) \, $ <eq:initial-narrow-strip>]
  because $log \( 2 d_i^2 \) lt.eq 2 ell_i$. The case $c_0 = 0$ is immediate; otherwise this application may be made to $f_i \/ c_0$.
  Hermiticity gives $f_i \( - overline(z) \) = overline(f_i \( z \))$. The even Taylor coefficients at zero are therefore real, and the odd coefficients are purely imaginary. Cauchy’s coefficient estimate on the disk of radius $delta_i$, followed by summation of the even terms, yields, for real $\| x \| lt.eq delta_i \/ 2$,
  #[#set math.equation(numbering: n => "(3.6)")
   $ \| Re \( f_i \( x \) - f_i \( 0 \) \) #scale(x: 120%, y: 120%)[\|] lt.eq 2 upright(e) c_0 x^2 delta_i^(- 2) = 128 upright(e) c_0 ell_i^2 x^2 . $ <eq:initial-real-quadratic>]
  In particular, it is the real linear term that vanishes; we do not assert that $f'_i \( 0 \) = 0$.
  For $u$ in the interval of the lemma, $\| u \| lt.eq 1 \/ 32$ and $\| z_u \| lt.eq \| u \|$. Since $ell_i lt.eq sqrt(cal(B))$, the estimate (3.6) applies to every crossing interaction. Using (3.3) and (3.4), we conclude that
  #[#set math.equation(numbering: n => "(3.7)")
   $ 0 lt.eq chevron.l Theta \, \( sans(H) - E_0 \) Theta chevron.r lt.eq 128 upright(e) c_0 cal(B) u^2 . $ <eq:initial-tilted-energy>]
  The full-system gap inequality $sans(H) - E_0 gt.eq g_0 \( "id" - \| Psi chevron.r chevron.l Psi \| \)$ now gives
  $ frac(M \( u \/ 2 \)^2, M \( u \)) = \| chevron.l Psi \, Theta chevron.r \|^2 gt.eq 1 - 128 upright(e) thin theta.alt cal(B) u^2 . $
  The last subtracted quantity is at most $upright(e) theta.alt \/ \[ 8 \( 1 + theta.alt \) \] < 1 \/ 2$. Taking logarithms and using $- log \( 1 - v \) lt.eq 2 v$ for $0 lt.eq v lt.eq 1 \/ 2$ gives
  $ L \( u \) lt.eq 2 L \( u \/ 2 \) + 256 upright(e) thin theta.alt cal(B) u^2 . $
  Iterate this inequality. Every successive halving remains in the permitted interval, for either sign of $u$, and $2^j L \( u \/ 2^j \) arrow.r u S$ because $L \( 0 \) = 0$ and $L' \( 0 \) = S$. The sum of the remaining geometric series is at most two, proving (3.1). Finally apply the exponential Markov inequality with $u = plus.minus \[ 32 sqrt(\( 1 + theta.alt \) cal(B)) \]^(- 1)$. The quadratic term in (3.1) is at most $upright(e) \/ 2$. Adding the two one-sided estimates proves (3.2). ◻
]

For the finite-range lattice Hamiltonians of this paper, the interaction budget and support-size bounds of Section 2 imply

#[#set math.equation(numbering: n => "(3.8)")
 $ cal(B) lt.eq C \( 1 + \| partial_Lambda B \| \) . $ <eq:initial-local-tail-parameter>]

Thus, for every $n gt.eq 1$ and fixed $M > 0$, the negative logarithms of the positive eigenvalues of a marginal at a cut with $b'$ edges lie within $C_M sqrt(1 + b') log \( n + 2 \)$ of its entropy except for probability at most $\( n + 2 \)^(- M)$. All constants in this specialization depend only on $q \, R \, J \, Delta$ and, for $C_M$, on $M$.

This concentration estimate controls fluctuations around the entropy, but does not yet bound that center. The next argument compares two estimates for the same norm to obtain a conditional-entropy discount, from which the rectangle bound will follow.

=== 3.2 An entropy discount from a buffer <an-entropy-discount-from-a-buffer>

Fix the set $A subset.eq Lambda$ whose entropy will ultimately be bounded, and let $Z$ be the set of endpoints of its crossing edges. For an integer rectangle $Q$—a product of two finite nonempty integer intervals—its size is the larger number of sites along an axis. Fix $D_0 > 2 R + 10$. We call $Q$ #emph[safe] if

$ "dist"_oo \( Q \, Z \) > D_0 thin "size" \( Q \) \, $

with distance to the empty set taken to be infinite. For an integer $d gt.eq 0$ write

$ Q^(+ d) = Q + #scale(x: 120%, y: 120%)[\(] \[ - d \, d \]^2 ∩ bb(Z)^2 #scale(x: 120%, y: 120%)[\)] . $

These are ambient rectangles; all physical regions below are their intersections with $A$. In particular, their use does not change the graph-distance locality of the Hamiltonian. For a unit vector $xi$, we write $rho_(xi \, D)$ for its marginal on $D$ and $S_xi \( D \)$ for that marginal’s entropy.

#thm([Lemma 3.2.])[
  (Conditional entropy in a buffered rectangle).  #emph[There are integers $C_(upright("pad")) gt.eq 1$ and a constant $C_(upright("buf"))$, depending only on $q \, R \, J \, Delta$, with the following property. Let $Q$ be safe, let $r gt.eq 1$ be an integer, and let $Q_0$ be an integer rectangle of size at most $r$ such that $Q_0^(+ C_(upright("pad")) r) subset.eq Q$. Set 
$ X = A ∩ Q_0 \, #h(2em) T = \( A ∩ Q_0^(+ C_(upright("pad")) r) \) \\ X . $

 Then, in the original ground state $Omega$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ S \( X divides T \) lt.eq 1 / 2 S \( X \) + C_(upright("buf")) r . $ <eq:initial-buffer-discount>]

]
] <lem:initial-buffer>

#proof[
  If $X$ is empty, the conclusion is immediate. Suppose henceforth that $X eq.not diameter$. We will compare two estimates for the largest norm obtained by applying positive filters on nested regions around $X$. The filters need not commute. Stationarity and the gap give a comparison involving the entropies of those regions. For the opposite comparison, we pin a Schmidt vector of $X$ and then average over its index. This removes $X$ from each region and contributes a single entropy cost $S \( X \)$. The difference of the two comparisons will therefore control a weighted sum of conditional entropies of $X$.
  Choose an integer $D > 2 R + 2$. Temporarily leave the integer $C_(upright("pad")) > D + 1$ variable, and put
  $ m = ⌊frac(\( C_(upright("pad")) - 1 \) r, D)⌋ \, #h(2em) d_j = r + j D \, #h(2em) X_j = A ∩ Q_0^(+ d_j) quad \( 1 lt.eq j lt.eq m \) \, #h(2em) X_0 = X . $
  All these rectangles lie in the safe parent $Q$. Any interaction meeting an $X_j$ lies wholly in $A$: otherwise a graph path of length at most $R$ from a support site in $X_j$ to a support site of the opposite color would contain a point of $Z$ within ambient distance $R$ of $Q$. This contradicts safety. The same observation rules out any nearest-neighbor color-crossing edge incident with $X_j$. Consequently the edge boundary of $X_j$ has at most $4 \( r + 2 d_j \)$ edges, all crossing the ambient rectangle’s perimeter. Missing sites in $Lambda$ only reduce this count.
  Every designated interaction support splits at most one of the cuts $X_j divides X_j^c$. More precisely, a support split by $X_j$ is disjoint from every $X_i$ with $i < j$ and contained in every $X_i$ with $i > j$. Indeed, successive rectangles have an ambient margin $D > R$, whereas the ambient diameter of the support is at most its graph diameter $R$. A term that does not split a contour is either contained in it or disjoint from it. The support budget and (3.8) therefore give, with constants independent of $C_(upright("pad"))$,
  #[#set math.equation(numbering: n => "(3.10)")
   $ \# { upright("interactions split by ") X_j } lt.eq C \( r + d_j \) \, #h(2em) cal(B)_j lt.eq C \( r + d_j \) \, $ <eq:initial-contour-budget>]
  where $cal(B)_j$ is the parameter in Lemma 5 for the marginal on $X_j$.
  Assign a positive weight $a_j$ to each contour. The energy estimate below charges contour $j$ by a constant times $\( r + d_j \) a_j^2$. We choose weights of total mass two: in the eventual conditional-entropy comparison this will give the factor two needed for (3.9). At this fixed mass, Cauchy–Schwarz gives
  $ 4 = (sum_j a_j)^2 lt.eq (sum_j \( r + d_j \) a_j^2) (sum_j frac(1, r + d_j)) . $
  Equality holds for weights proportional to $1 \/ \( r + d_j \)$. Accordingly, put
  #[#set math.equation(numbering: n => "(3.11)")
   $ Z_r = sum_(j = 1)^m frac(1, r + d_j) \, #h(2em) a_j = frac(2, Z_r \( r + d_j \)) \, #h(2em) cal(E) = sum_(j = 1)^m \( r + d_j \) a_j^2 = 4 / Z_r . $ <eq:initial-harmonic-weights>]
  Their sum is two, and their quadratic cost attains this lower bound. Integral comparison gives the uniform lower bound
  #[#set math.equation(numbering: n => "(3.12)")
   $ Z_r gt.eq 1 / D log frac(C_(upright("pad")) + 1, 2 + D) . $ <eq:initial-harmonic-lower>]
  For example, compare the sum with the integral of $\( 2 r + D x \)^(- 1)$ over $1 lt.eq x lt.eq m + 1$, use $2 r + D \( m + 1 \) > \( C_(upright("pad")) + 1 \) r$, and use $r gt.eq 1$ in the denominator. Thus we may make $cal(E)$ as small as needed, uniformly in $r$. We take $C_(upright("pad"))$ large enough that $a_j lt.eq 1 \/ 2$ for all $j$. We shall increase it once more after the energy estimate below; all constants up to that choice are independent of $C_(upright("pad"))$.
  ===== 3.2.1 Stationarity of the optimized filters. <stationarity-of-the-optimized-filters.>
  Fix a sufficiently small $epsilon.alt > 0$, and maximize
  $ N = lr(bar.v.double L_m dots.h.c L_1 Omega bar.v.double) $
  over positive operators $L_j$ on $X_j$ satisfying
  #[#set math.equation(numbering: n => "(3.13)")
   $ L_j gt.eq epsilon.alt "id" \, #h(2em) "Tr" L_j^(2 \/ a_j) = 1 . $ <eq:initial-filter-constraints>]
  The trace is over $cal(H)_(X_j)$. Choose $epsilon.alt$ so small that $\( dim cal(H)_(X_j) \) epsilon.alt^(2 \/ a_j) < 1$ for every $j$. The feasible sets are nonempty and compact. A maximum exists and is positive, since every feasible product is invertible. At an optimum write
  $ K = L_m dots.h.c L_1 \, #h(2em) phi.alt = K Omega \/ N . $
  We claim that
  #[#set math.equation(numbering: n => "(3.14)")
   $ \[ L_j \, rho_(phi.alt \, X_j) \] = 0 #h(2em) \( 1 lt.eq j lt.eq m \) . $ <eq:initial-filter-commutation>]
  Prove this in descending order. For an anti-Hermitian operator $B$ on $X_j$, vary $L_j$ to $upright(e)^(t B) L_j upright(e)^(- t B)$. This preserves both constraints in (3.13). With $K_(> j) = L_m dots.h.c L_(j + 1)$, the derivative of the logarithmic norm is
  $ Re chevron.l phi.alt \, K_(> j) \( B - L_j B L_j^(- 1) \) K_(> j)^(- 1) phi.alt chevron.r . $
  Assume that (3.14) is already known for indices greater than $j$. In this expectation the outer factor $L_m$ can be removed by cyclicity of the trace on $X_m$, because its marginal commutes with $L_m$ and the operator inside is supported on $X_m$. Repeat this argument down to $L_(j + 1)$. Stationarity, together with the fact that the expectation of $B$ is purely imaginary, gives
  $ Re "Tr" \( L_j^(- 1) rho_(phi.alt \, X_j) L_j B \) = 0 quad upright("for every anti-Hermitian ") B . $
  The matrix $L_j^(- 1) rho_(phi.alt \, X_j) L_j$ is therefore Hermitian. The equality to its adjoint, multiplied on both sides by $L_j$, shows that $rho_(phi.alt \, X_j)$ commutes with $L_j^2$, hence with $L_j$. This proves the induction. Only expectations have been simplified; no commutation between distinct filters is asserted.
  In a common eigenbasis let $l_i$ be the eigenvalues of $L_j$, let $p_i$ be those of $rho_(phi.alt \, X_j)$, and set $x_i = l_i^(2 \/ a_j)$. A diagonal variation and the same descending trace argument give
  $ d log N = a_j / 2 sum_i p_i frac(d x_i, x_i) \, #h(2em) sum_i x_i = 1 \, #h(2em) x_i gt.eq epsilon.alt^(2 \/ a_j) . $
  The ratios $p_i \/ x_i$ are equal to a common value $lambda$ on free coordinates and are at most $lambda$ on coordinates at the floor. There is a free coordinate by strict dimensional slack. Moreover $lambda > 0$: if all free coordinates had zero probability, transfer from one of them to a positive-probability floored coordinate would increase the norm. Consequently
  #[#set math.equation(numbering: n => "(3.15)")
   $ x_i = max { epsilon.alt^(2 \/ a_j) \, p_i \/ lambda } \, #h(2em) lr(|log l_i / l_k|) lt.eq a_j / 2 lr(|log p_i / p_k|) quad \( p_i \, p_k > 0 \) . $ <eq:initial-filter-clipping>]
  The last inequality follows because taking a maximum with a common positive floor contracts differences of logarithms.
  ===== 3.2.2 The optimized vector has small excitation energy. <the-optimized-vector-has-small-excitation-energy.>
  We have the exact identity $K H K^(- 1) phi.alt = E_0 phi.alt$ for the original full Hamiltonian. Consider one interaction in its expectation. All outer filters on regions containing its support can be removed by (3.14) and cyclicity, as above. All remaining inner filters whose regions are disjoint from its support commute with the interaction. The single-split property leaves at most one conjugation $L_j h_i L_j^(- 1)$.
  In Schmidt bases for $X_j divides X_j^c$, Hermitian pairing replaces the real part of this conjugation by coefficients involving
  $ sqrt(p_i p_k) (cosh (log l_i / l_k) - 1) . $
  For positive $p_i \, p_k$, (3.15) and $a_j lt.eq 1 \/ 2$ bound this expression by $C a_j^2 \( p_i + p_k \)$. To verify the uniform constant, put $z = 1 / 2 log \( p_i \/ p_k \)$ and use
  $ cosh \( a_j z \) - 1 lt.eq 1 / 2 a_j^2 z^2 cosh \( a_j z \) \, #h(2em) sup_(z in bb(R)) frac(z^2 cosh \( z \/ 2 \), cosh z) < oo . $
  Pairs containing a zero probability have zero coefficient. A finite-range interaction has a product decomposition across this cut with a uniformly bounded sum of norm products. The row and column Cauchy–Schwarz estimate used in Lemma 5 now bounds its contribution by $C a_j^2$. Summing (3.10) gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ 0 lt.eq chevron.l phi.alt \, \( H - E_0 \) phi.alt chevron.r lt.eq C cal(E) . $ <eq:initial-product-energy>]
  The constant depends only on $q \, R \, J$, not on the number of filters or their supports’ dimensions.
  The full-system gap converts (3.16) into $1 - \| chevron.l Omega \, phi.alt chevron.r \|^2 lt.eq C cal(E) \/ Delta$. Choose $C_(upright("pad"))$ large enough that this is at most $1 \/ 4$. At the same time arrange that
  #[#set math.equation(numbering: n => "(3.17)")
   $ frac(a_j, 1 - a_j) lt.eq frac(1, 32 sqrt(\( 1 + J \/ Delta \) cal(B)_j)) quad upright("for every ") j . $ <eq:initial-weight-range>]
  Both choices are uniform in $r$: by (3.10), the right side is bounded below by a parameter-dependent constant times $\( r + d_j \)^(- 1 \/ 2)$, whereas the left side is at most $4 \/ \[ Z_r \( r + d_j \) \]$. Equation (3.12) completes the choice of $C_(upright("pad"))$, which is now fixed.
  ===== 3.2.3 The first norm comparison. <the-first-norm-comparison.>
  Let $N_j$ be the optimum for the prefix of filters $1 \, dots.h \, j$ at the same floor, and set $N_0 = 1$. The preceding stationarity and energy arguments apply separately to each prefix: its summed cost is at most $cal(E)$. Thus, for a parameter-dependent constant $C$, its normalized output has overlap at least $sqrt(1 - C cal(E))$ with $Omega$, where $C cal(E) lt.eq 1 \/ 4$. For an optimizing prefix, put $K_(< j) = L_(j - 1) dots.h.c L_1$. Cauchy–Schwarz gives
  $ sqrt(1 - C cal(E)) thin N_j & lt.eq \| chevron.l Omega \, L_j K_(< j) Omega chevron.r \| = \| chevron.l L_j Omega \, K_(< j) Omega chevron.r \|\
 & lt.eq lr(bar.v.double L_j Omega bar.v.double) thin N_(j - 1) . $
  For any feasible $L_j$, Schatten Hölder gives
  $ lr(bar.v.double L_j Omega bar.v.double)^2 = "Tr" rho_(Omega \, X_j) L_j^2 lt.eq ("Tr" rho_(Omega \, X_j)^(1 \/ \( 1 - a_j \)))^(1 - a_j) . $
  Apply Lemma 5 with $u = - a_j \/ \( 1 - a_j \)$, permitted by (3.17). We obtain
  $ log lr(bar.v.double L_j Omega bar.v.double)^2 lt.eq - a_j S \( X_j \) + C \( r + d_j \) a_j^2 . $
  After summing logarithms over the prefixes and using $log \( 1 - C cal(E) \) gt.eq - C' cal(E)$, this gives
  #[#set math.equation(numbering: n => "(3.18)")
   $ - 2 log N gt.eq sum_(j = 1)^m a_j S \( X_j \) - C \( m + 1 \) cal(E) . $ <eq:initial-norm-lower>]
  The constants in this estimate are independent of the floor.
  ===== 3.2.4 The opposite comparison by Schmidt pinning. <the-opposite-comparison-by-schmidt-pinning.>
  Let the floor decrease to zero at this fixed finite instance. The optima converge to the optimum over nonnegative filters with the same trace constraints. Indeed, these latter feasible sets are compact, and every feasible nonnegative operator is a limit of strictly positive, trace-normalized operators. Taking their minimal eigenvalues as admissible floors proves the assertion. We continue to denote the limiting optimum by $N$; (3.18) remains valid.
  Write the Schmidt decomposition at $X$ as
  $ Omega = sum_i sqrt(p_i) thin u_i ⊗ w_i \, #h(2em) p_i > 0 \, $
  and let $T_j = X_j \\ X$. For a fixed index $i$ use trial filters
  $ L_j = \| u_i chevron.r chevron.l u_i \| ⊗ M_j \, #h(2em) M_j gt.eq 0 upright(" on ") T_j \, #h(2em) "Tr" M_j^(2 \/ a_j) = 1 . $
  They are feasible in the zero-floor limit and give $N gt.eq sqrt(p_i) thin N_i$, where
  $ N_i = sup lr(bar.v.double M_m dots.h.c M_1 w_i bar.v.double) $
  under the displayed constraints. We claim that
  #[#set math.equation(numbering: n => "(3.19)")
   $ log N_i gt.eq - 1 / 2 sum_j a_j S_(w_i) \( T_j \) . $ <eq:initial-trial-norm>]
  For fixed invertible choices $M_j$, consider $F_i \( z \) = M_m^z dots.h.c M_1^z w_i$ on $0 lt.eq Re z lt.eq 1$. It is bounded and analytic there. Its norm on the imaginary axis is one. On the other boundary, put $U_j = M_j^(upright(i) y)$ and $V_j = U_j dots.h.c U_1$, with $V_0 = "id"$. Moving these unitaries to the left gives the exact identity
  $ M_m^(1 + upright(i) y) dots.h.c M_1^(1 + upright(i) y) = \( U_m dots.h.c U_1 \) \( V_(m - 1)^(*) M_m V_(m - 1) \) dots.h.c \( V_0^(*) M_1 V_0 \) . $
  Each positive factor is conjugated only by unitaries supported on smaller nested regions. The remaining factors are therefore still positive, supported on their respective $T_j$, and have the same trace-power normalizations. The leftmost product of unitaries does not change the norm, so $lr(bar.v.double F_i \( 1 + upright(i) y \) bar.v.double) lt.eq N_i$. The vector form of the three-lines theorem, obtained by testing against unit vectors and applying the scalar lemma #cite(label("Tao247ANotes1")) Lemma 5.10, gives $log lr(bar.v.double F_i \( x \) bar.v.double) lt.eq x log N_i$ for $0 lt.eq x lt.eq 1$. Differentiating from the right at zero yields
  $ sum_j chevron.l w_i \, log M_j thin w_i chevron.r lt.eq log N_i . $
  For $0 < delta < 1$, take
  $ M_j = (\( 1 - delta \) rho_(w_i \, T_j) + frac(delta, dim cal(H)_(T_j)) "id")^(a_j \/ 2) . $
  These are strictly positive and satisfy $"Tr" M_j^(2 \/ a_j) = 1$. As $delta arrow.b 0$, their expectations of $log M_j$ tend to $- a_j S_(w_i) \( T_j \) \/ 2$, since the marginal gives zero weight to its kernel. This proves (3.19).
  For each Schmidt index the trial norm now gives
  $ - 2 log N lt.eq - log p_i + sum_j a_j S_(w_i) \( T_j \) . $
  Average with probabilities $p_i$ and use concavity of each $T_j$ entropy. Their averaged states are the original marginals, so
  #[#set math.equation(numbering: n => "(3.20)")
   $ - 2 log N lt.eq S \( X \) + sum_j a_j S \( T_j \) . $ <eq:initial-norm-upper>]
  The two norm estimates have now served their purpose. Combining (3.18) and (3.20) gives
  $ sum_j a_j S \( X divides T_j \) lt.eq S \( X \) + C \( m + 1 \) cal(E) . $
  Since the $T_j$ are nested and $sum_j a_j = 2$, strong subadditivity bounds the left side below by $2 S \( X divides T_m \)$. Finally $T_m subset.eq T$, so conditioning further decreases the conditional entropy. Because $m lt.eq C_(upright("pad")) r \/ D$ and all parameters have now been fixed, the resulting error is at most $C_(upright("buf")) r$. This proves (3.9). ◻
]

=== 3.3 The first subvolume exponent <the-first-subvolume-exponent>

For an integer $r gt.eq 1$, let $F_(upright("box")) \( r \)$ be the supremum of $S_Omega \( A ∩ Q \)$ over all admissible Hamiltonians and cuts with fixed $q \, R \, J \, Delta$, and all safe integer rectangles $Q$ of size at most $r$. This is a finite, nondecreasing function, since $F_(upright("box")) \( r \) lt.eq r^2 log q$.

#thm([Proposition 3.3.])[
  (Initial safe-box estimate).  #emph[There are constants $C < oo$ and $e_0 in \( 0 \, 1 \)$, depending only on $q \, R \, J \, Delta$, such that 
#[#set math.equation(numbering: n => "(3.21)")
 $ F_(upright("box")) \( r \) lt.eq C r^(1 + e_0) #h(2em) \( r gt.eq 1 \) . $ <eq:initial-box-bound>]

]
] <prop:initial-box>

#proof[
  Choose an integer $M$ below, and consider a safe parent rectangle of size at most $M r$. If its size is at most $r$, its entropy is already bounded by $F_(upright("box")) \( r \)$. Otherwise partition each axis into chunks of $r$ sites and, if needed, one final shorter chunk. Their Cartesian products give at most $M^2$ children $Q_i$, each safe and of size at most $r$. Put $X_i = A ∩ Q_i$.
  Call a child interior if its $C_(upright("pad")) r$ padding lies in the parent. There are at most
  $ B_M = 4 \( C_(upright("pad")) + 2 \) M $
  noninterior children: in either coordinate only the first or last $C_(upright("pad")) + 2$ chunk positions can violate this containment. This estimate remains valid when the parent is thin and all of its children are noninterior.
  For an interior child its padded rectangle meets at most $\( 2 C_(upright("pad")) + 5 \)^2 - 1$ other children. Order all children by a uniform random permutation. The probability that this child comes after every one of those other children is at least
  $ p_0 = \( 2 C_(upright("pad")) + 5 \)^(- 2) > 0 . $
  On that event, its preceding physical sites contain the entire buffer in Lemma 6. The corresponding term of the entropy chain rule is therefore at most $S \( X_i \) \/ 2 + C_(upright("buf")) r$. In all other cases it is at most $S \( X_i \)$. The latter bound also holds for noninterior children. Taking the expected entropy chain rule consequently gives
  #[#set math.equation(numbering: n => "(3.22)")
   $ F_(upright("box")) \( M r \) & lt.eq [\( 1 - p_0 \/ 2 \) M^2 + \( p_0 \/ 2 \) B_M] F_(upright("box")) \( r \) + C M^2 r . $ <eq:initial-box-recursion>]
  For completeness, the probability of the buffer event may vary among children. Its lower bound $p_0$ controls the negative term $- p_0 S \( X_i \) \/ 2$, since $S \( X_i \) gt.eq 0$; its positive error can always be bounded by $C_(upright("buf")) r$. Thus the displayed common bound holds without assuming equal event probabilities. Parents of size at most $r$ satisfy the same inequality once its coefficient is at least one.
  Choose $M gt.eq 16 \( C_(upright("pad")) + 2 \)$ and $M gt.eq 2$. Then the coefficient in (3.22) is at most
  $ lambda = \( 1 - p_0 \/ 4 \) M^2 \, #h(2em) M < lambda < M^2 . $
  Iterate the recursion at $r = 1 \, M \, M^2 \, dots.h$. The inhomogeneous terms are bounded by a geometric series with ratio $M \/ lambda < 1$, yielding $F_(upright("box")) \( M^j \) lt.eq C lambda^j$ for all $j gt.eq 0$. Set
  $ 1 + e_0 = log_M lambda = 2 + frac(log \( 1 - p_0 \/ 4 \), log M) in \( 1 \, 2 \) . $
  For a general $r gt.eq 1$, comparison with the next power of $M$ and monotonicity of $F_(upright("box"))$ prove (3.21) after a fixed change of constant. ◻
]

The estimate just proved is uniform over induced domains, including those with holes or disconnected components. Its only energy comparison was with the original full Hamiltonian. In particular, we have not required a gap for any Hamiltonian obtained by restricting to a rectangle. The following sections will improve the exponent $e_0$ and then replace the box estimate by a bound on mutual information across a collar.

== 4 Positive constraints and truncation near a finite set <sec:quasilocal>

The global gap of $H$ will be used through positive operators that annihilate its ground vector separately, retain a gap when summed, and have rapidly decaying graph-local tails. These exact constraints supply the contraction products in Section 10. For the transport and scanner arguments in Sections 7 and 9, we also truncate near a prescribed finite set $S_0$. The terms crossing cuts inside $S_0$ then have controlled graph-ball supports, while the total truncation error depends on $\| S_0 \|$ rather than the surrounding volume. Both constructions use only the gap of the full Hamiltonian.

Write $H = sum_(i in cal(I)) h_i$, where $i$ indexes the distinct nonempty designated supports $X_i$ from Section 2, and choose an anchor $a_i in X_i$. Thus $"diam"_(d_Lambda) X_i lt.eq R$ and $parallel h_i parallel lt.eq J$. We use $N_l \( a \) = { x in Lambda : d_Lambda \( a \, x \) lt.eq l }$ for the graph ball, with integer $l gt.eq 0$. The normalized conditional expectation onto this ball is the map

#[#set math.equation(numbering: n => "(4.1)")
 $ E_(i \, l) \( B \) = q^(- \| Lambda \\ N_l \( a_i \) \|) "Tr"_(Lambda \\ N_l \( a_i \)) \( B \) ⊗ I_(Lambda \\ N_l \( a_i \)) . $ <eq:quasilocal-ce>]

Tensor factors in this formula are placed at their original sites. Equivalently, $E_(i \, l)$ averages conjugation by independent on-site unitaries outside the ball. It is positive, unital, contractive in operator norm, and fixes every operator supported in the ball.

The counting bounds from Section 2 give at most $v_R$ sites in each original support, at most $mu_R$ supports containing a specified site, and at most $mu_R$ labels with any specified anchor. In particular,

#[#set math.equation(numbering: n => "(4.2)")
 $ sup_(x in Lambda) sum_(i : x in X_i) parallel h_i parallel lt.eq b_0 := J mu_R \, #h(2em) \| X_i \| lt.eq v_R . $ <eq:quasilocal-budget>]

All constants in this section are independent of $Lambda$; they may depend on $q \, R \, J \, Delta$, and on explicitly fixed exponents or size bounds.

=== 4.1 Propagation in graph distance and a smooth spectral filter <propagation-in-graph-distance-and-a-smooth-spectral-filter>

We first record the dynamical estimate needed to localize a spectral filter. This also makes clear why holes and separate connected components cause no change in the constants. Starting from the Lieb–Robinson propagation framework #cite(label("LiebRobinson1972")), we use the finite-volume argument of Nachtergaele, Ogata, and Sims #cite(label("NachtergaeleOgataSims2006")), giving the commutator iteration here in the graph metric of $Lambda$.

#thm([Lemma 4.1.])[
  (Graph-distance propagation).  #emph[Let $tau_t \( B \) = e^(i t H) B e^(- i t H)$. There are positive constants $C \, v \, c$ such that, for every original support $X_i$, every operator $A$ supported in $X_i$, every site $y$, and every on-site operator $B_y$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ parallel \[ tau_t \( A \) \, B_y \] parallel lt.eq C parallel A parallel parallel B_y parallel e^(v \| t \| - c d_Lambda \( a_i \, y \)) . $ <eq:quasilocal-lr>]

 The commutator is zero when $d_Lambda \( a_i \, y \) = oo$. Moreover, 
#[#set math.equation(numbering: n => "(4.4)")
 $ parallel tau_t \( A \) - E_(i \, l) \( tau_t \( A \) \) parallel lt.eq parallel A parallel min { 2 \, C e^(v \| t \| - c l) } . $ <eq:quasilocal-lr-ce>]

]
] <lem:quasilocal-lr>

#proof[
  Fix $B_y$ and define
  $ F \( X \, t \) = sup_("supp" A subset.eq X\
parallel A parallel lt.eq 1) parallel \[ tau_t \( A \) \, B_y \] parallel . $
  For $t gt.eq 0$, fix one such $A$, put $f \( t \) = \[ tau_t \( A \) \, B_y \]$, and let $Q_X \( t \) = sum_(j : X_j ∩ X eq.not diameter) tau_t \( h_j \)$. Since the terms disjoint from $X$ commute with $A$, differentiating and using the Jacobi identity gives the exact equation
  $ f' \( t \) = i \[ Q_X \( t \) \, f \( t \) \] - i sum_(j : X_j ∩ X eq.not diameter) \[ tau_t \( A \) \, \[ tau_t \( h_j \) \, B_y \] \] . $
  The propagator of the homogeneous equation is unitary conjugation. Variation of constants, followed by the supremum over $A$, consequently gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ F \( X \, t \) lt.eq 2 parallel B_y parallel upright(bold(1))_({ y in X }) + 2 sum_(j : X_j ∩ X eq.not diameter) parallel h_j parallel integral_0^t F \( X_j \, u \) thin d u . $ <eq:quasilocal-lr-recursion>]
  The same argument with $- H$ handles negative times.
  Starting from $X = X_i$, iterate (4.5). At each step the sum of the available interaction norms is at most $kappa := v_R b_0$, by (4.2). A chain $X_i \, X_(j_1) \, dots.h \, X_(j_m)$ with consecutive intersections and with $y in X_(j_m)$ has $d_Lambda \( a_i \, y \) lt.eq \( m + 1 \) R$. The remainder after $M$ iterations is at most $2 parallel B_y parallel \( 2 kappa t \)^M \/ M !$, since $F \( X \, u \) lt.eq 2 parallel B_y parallel$; it tends to zero. For every $mu > 0$, the resulting chain sum satisfies
  $ F \( X_i \, t \) & lt.eq 2 parallel B_y parallel sum_(m gt.eq 0) frac(\( 2 kappa t \)^m, m !) upright(bold(1))_({ d_Lambda \( a_i \, y \) lt.eq \( m + 1 \) R })\
 & lt.eq 2 parallel B_y parallel e^(mu R - mu d_Lambda \( a_i \, y \)) exp \( 2 kappa e^(mu R) t \) . $
  This proves (4.3). If the distance is infinite, no finite chain contributes and the vanishing remainder proves exact zero.
  For completeness, write the expectation in (4.1) as a product of on-site twirls $T_y$. These are commuting contractions, and telescoping that product shows, for any $B$,
  $ parallel B - E_(i \, l) \( B \) parallel lt.eq sum_(y in.not N_l \( a_i \)) parallel B - T_y \( B \) parallel lt.eq sum_(y in.not N_l \( a_i \)) sup_(U_y) parallel \[ B \, U_y \] parallel \, $
  where $U_y$ ranges over on-site unitaries. Sites in another component contribute zero. The number of sites at graph distance $d$ is at most $C \( d + 1 \)^2$, because the graph ball lies in an ambient lattice ball. Applying (4.3) and summing $sum_(d > l) \( d + 1 \)^2 e^(- c d) lt.eq C' e^(- c' l)$ proves the exponential bound in (4.4). Contractivity gives its other bound. ◻
]

The filter must remove ground-to-excited matrix elements exactly, while its time kernel must decay fast enough to combine with Lemma 8. The following elementary construction gives every stretched exponential exponent $p \/ \( p + 1 \)$.

#thm([Lemma 4.2.])[
  (A compactly supported spectral filter).  #emph[Fix an integer $p gt.eq 1$, put $alpha = p \/ \( p + 1 \)$, and let $delta > 0$. Define the real even function 
$ chi \( omega \) = cases(delim: "{", e exp \[ - \( 1 - \( omega \/ delta \)^2 \)^(- p) \] \, & \| omega \| < delta \,, 0 \, & \| omega \| gt.eq delta .) $

 Then $chi in C_c^oo \( bb(R) \)$, $chi \( 0 \) = 1$, and the real even function 
$ f \( t \) = frac(1, 2 pi) integral_(bb(R)) chi \( omega \) e^(- i t omega) thin d omega $

 satisfies 
#[#set math.equation(numbering: n => "(4.6)")
 $ chi \( omega \) = integral_(bb(R)) f \( t \) e^(i t omega) thin d t \, #h(2em) \| f \( t \) \| lt.eq C e^(- c \| t \|^alpha) . $ <eq:quasilocal-filter-decay>]

 Here $C \, c > 0$ depend only on $p \, delta$.]
] <lem:quasilocal-filter>

#proof[
  We give the derivative estimate responsible for the exponent. For real $u in \( - 1 \, 1 \)$ set $w = 1 - u^2$. Choose $eta_p > 0$ sufficiently small. On the complex disk $\| z - u \| lt.eq eta_p w$ one has
  $ 1 - z^2 = w \( 1 + zeta \) \, #h(2em) \| zeta \| lt.eq 3 eta_p \, #h(2em) "Re" \( 1 + zeta \)^(- p) gt.eq c_p > 0 . $
  The last inequality follows by continuity at $zeta = 0$, with $p$ fixed. The function $e exp \[ - \( 1 - z^2 \)^(- p) \]$ is analytic on the disk, and Cauchy’s estimate gives
  $ lr(|frac(d^m, d u^m) #scale(x: 120%, y: 120%)[\(] e exp \[ - \( 1 - u^2 \)^(- p) \] #scale(x: 120%, y: 120%)[\)]|) lt.eq C m ! eta_p^(- m) w^(- m) e^(- c_p w^(- p)) . $
  For each fixed $m$ this tends to zero at both endpoints. Extension by zero is therefore smooth. To make the estimate uniform in $u$, substitute $s = w^(- p)$ and maximize $s^(m \/ p) e^(- c_p s)$. Its maximum is bounded by $C^(m + 1) \( m ! \)^(1 \/ p)$, using $m ! gt.eq \( m \/ e \)^m$; the case $m = 0$ is absorbed in $C$. Scaling from $u$ to $omega$ yields
  #[#set math.equation(numbering: n => "(4.7)")
   $ parallel chi^(\( m \)) parallel_oo lt.eq C_1^(m + 1) \( m ! \)^(1 + 1 \/ p) . $ <eq:quasilocal-gevrey>]
  Integration by parts $m$ times has no boundary terms. Consequently, for $t eq.not 0$,
  $ \| f \( t \) \| lt.eq C frac(C_1^m \( m ! \)^(1 + 1 \/ p), \| t \|^m) lt.eq C (frac(C_1 m^(1 + 1 \/ p), \| t \|))^m . $
  For sufficiently large $\| t \|$, choose $m = floor.l eta \| t \|^(p \/ \( p + 1 \)) floor.r$ with a fixed, sufficiently small $eta > 0$. The expression in parentheses is at most $1 \/ 2$, proving the decay in (4.6); bounded $t$ is covered by increasing $C$. In particular $f in L^1 \( bb(R) \)$. Fourier inversion gives the first identity in (4.6). It can also be obtained directly by inserting $e^(- epsilon t^2)$, interchanging the two integrals, and letting the resulting Gaussian approximate identity converge to the continuous function $chi$. Reality and evenness follow from those properties of $chi$. ◻
]

=== 4.2 Exact positive constraints and their local square roots <exact-positive-constraints-and-their-local-square-roots>

We begin with Kitaev’s centered spectral-filter construction of Hermitian quasi-local constraints that annihilate the ground state #cite(label("Kitaev2006Anyons")) Appendix D.1.2, Proposition D.1. Its terms sum to the original Hamiltonian minus its ground energy. Taking their absolute values gives the positive replacement used here: the new sum dominates the original shifted Hamiltonian and therefore retains a global gap. The locality estimates below also quantify the effect of this functional calculus. The distinction between filtered constraints and a positive sum with a gap is discussed by Swingle and McGreevy #cite(label("SwingleMcGreevy2016")) Section 8.4.

We now combine the spectral and spatial estimates. In the next statement, the normalization $c_(*)$ and the gap lower bound $g$ may depend on the chosen $p$. Once $p$ is fixed, both are independent of the system size.

#thm([Proposition 4.3.])[
  (Positive replacement of the Hamiltonian).  #emph[Suppose $H Omega = E_0 Omega$, $parallel Omega parallel = 1$, and 
$ H - E_0 I gt.eq Delta \( I - P_Omega \) \, #h(2em) P_Omega = \| Omega chevron.r chevron.l Omega \| . $

 For each integer $p gt.eq 1$ and $alpha = p \/ \( p + 1 \)$, there are operators $k_i$, indexed by the original supports and retaining their anchors, and a constant $c_(*) > 0$ such that 
#[#set math.equation(numbering: n => "(4.8)")
 $ 0 lt.eq k_i lt.eq I \, #h(2em) k_i Omega = 0 \, #h(2em) H_F := sum_(i in cal(I)) k_i gt.eq c_(*)^(- 1) \( H - E_0 I \) gt.eq g \( I - P_Omega \) \, #h(2em) g := Delta \/ c_(*) . $ <eq:quasilocal-positive>]

 Thus $H_F$ has the unique ground vector $Omega$, ground energy zero, and gap at least $g$. Furthermore, 
#[#set math.equation(numbering: n => "(4.9)")
 $ k_(i \, l) := E_(i \, l) \( k_i \) in \[ 0 \, I \] \, #h(2em) parallel k_i - k_(i \, l) parallel lt.eq C e^(- c l^alpha) quad \( l in bb(Z)_(gt.eq 0) \) . $ <eq:quasilocal-positive-tail>]

 Each $k_i$ is supported in the connected component containing $a_i$.]
] <prop:positive>

#proof[
  Use Lemma 9 with $delta = Delta \/ 2$, and define
  #[#set math.equation(numbering: n => "(4.10)")
   $ M_i = integral_(bb(R)) f \( t \) tau_t \( h_i \) thin d t - chevron.l Omega \, h_i Omega chevron.r I . $ <eq:quasilocal-centered-filter>]
  The integral converges in norm and $M_i$ is Hermitian. In an eigenbasis of $H$, its uncentered ground-to-energy-$E$ matrix element equals the corresponding matrix element of $h_i$ multiplied by $chi \( E - E_0 \)$. All excited energies satisfy $E - E_0 gt.eq Delta$, where $chi$ vanishes. The ground component is unchanged because $chi \( 0 \) = 1$, and the scalar in (4.10) removes it. Hence $M_i Omega = 0$. Also, since $tau_t \( H \) = H$ and $integral f = 1$,
  #[#set math.equation(numbering: n => "(4.11)")
   $ sum_i M_i = H - E_0 I \, #h(2em) parallel M_i parallel lt.eq J \( parallel f parallel_1 + 1 \) . $ <eq:quasilocal-filter-sum>]
  Choose $c_(*) := max { 1 \, J \( parallel f parallel_1 + 1 \) }$ and set $k_i = \| M_i \| \/ c_(*)$. For a Hermitian operator, $\| M_i \| gt.eq M_i$ and $ker \| M_i \| = ker M_i$. These observations and (4.11) prove (4.8).
  It remains to check locality after taking the absolute value. The scalar in (4.10) is fixed by $E_(i \, l)$. For $\| t \| lt.eq epsilon l$, choose $epsilon > 0$ small enough that (4.4) is at most $C e^(- c' l)$ for $A = h_i$. For the remaining times use its bound $2 J$. Thus
  #[#set math.equation(numbering: n => "(4.12)")
   $ parallel M_i - E_(i \, l) \( M_i \) parallel & lt.eq C e^(- c' l) parallel f parallel_1 + 2 J integral_(\| t \| > epsilon l) \| f \( t \) \| thin d t lt.eq C' e^(- c'' l^alpha) . $ <eq:quasilocal-filter-locality>]
  The last tail estimate follows by substituting $u = \| t \|^alpha$ and absorbing the resulting fixed power of $u$ into the exponential. The case $l = 0$ follows from the uniform norm bound.
  We use the dimension-independent inequality
  #[#set math.equation(numbering: n => "(4.13)")
   $ parallel U^(1 \/ 2) - V^(1 \/ 2) parallel lt.eq parallel U - V parallel^(1 \/ 2) #h(2em) \( U \, V gt.eq 0 \) . $ <eq:quasilocal-square-root>]
  Here is an order proof. The integral formula
  $ T^(1 \/ 2) = 1 / pi integral_0^oo T \( T + s I \)^(- 1) s^(- 1 \/ 2) thin d s #h(2em) \( T gt.eq 0 \) $
  follows from scalar integration and the spectral theorem. It shows that the square root is operator monotone: inversion reverses the order of positive invertible operators, and $T \( T + s I \)^(- 1) = I - s \( T + s I \)^(- 1)$. With $epsilon.alt = parallel U - V parallel$, monotonicity and scalar functional calculus give $U^(1 \/ 2) lt.eq \( V + epsilon.alt I \)^(1 \/ 2) lt.eq V^(1 \/ 2) + sqrt(epsilon.alt) I$. Interchanging $U \, V$ proves (4.13).
  Apply this with $U = M_i^2$ and $V = \( E_(i \, l) M_i \)^2$. Both factors in the latter square are Hermitian, and their norms are at most $c_(*)$. Therefore
  $ parallel \| M_i \| - \| E_(i \, l) M_i \| parallel lt.eq #scale(x: 120%, y: 120%)[\(] 2 c_(*) parallel M_i - E_(i \, l) M_i parallel #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C e^(- c l^alpha) . $
  The operator $\| E_(i \, l) M_i \|$ is supported in $N_l \( a_i \)$. Since $E_(i \, l)$ fixes it and is contractive,
  $ parallel \| M_i \| - E_(i \, l) \( \| M_i \| \) parallel lt.eq 2 parallel \| M_i \| - \| E_(i \, l) M_i \| parallel . $
  After division by $c_(*)$ this proves (4.9); its order bounds follow from positivity and unitality of $E_(i \, l)$.
  Finally, every original support lies in one component. The Hamiltonian is a tensor sum over components, so $tau_t \( h_i \)$ is supported in the component of $a_i$. The integral, scalar centering, and functional calculus in the above construction all stay in that component’s operator algebra. This proves the exact component assertion. ◻
]

The same construction supplies local approximants to the square roots of the positive constraints. We include the associated channels because their unitality will allow spatial localization of products in Section 10.

#thm([Lemma 4.4.])[
  (Square roots and local channels).  #emph[For the constraints of Proposition 10, define 
$ G_i = \( I - k_i \)^(1 \/ 2) \, quad K_i = k_i^(1 \/ 2) \, #h(2em) G_(i \, l) = \( I - k_(i \, l) \)^(1 \/ 2) \, quad K_(i \, l) = k_(i \, l)^(1 \/ 2) . $

 These are positive contractions, $G_i Omega = Omega$, $K_i Omega = 0$, and 
#[#set math.equation(numbering: n => "(4.14)")
 $ parallel G_i - G_(i \, l) parallel + parallel K_i - K_(i \, l) parallel lt.eq C e^(- c l^alpha) \, #h(2em) G_(i \, l)^2 + K_(i \, l)^2 = I . $ <eq:quasilocal-root-tail>]

 Define maps on the full operator algebra by 
$ cal(E)_i \( B \) = G_i B G_i + K_i B K_i \, #h(2em) cal(E)_(i \, l) \( B \) = G_(i \, l) B G_(i \, l) + K_(i \, l) B K_(i \, l) . $

 Both maps are unital and completely positive, and are contractions in operator norm, also after tensoring with the identity map on any auxiliary matrix algebra. The completely bounded norm, denoted by $parallel dot.op parallel_(upright("cb"))$, is the supremum of the operator norms on all such auxiliary extensions. In this norm, 
#[#set math.equation(numbering: n => "(4.15)")
 $ parallel cal(E)_i - cal(E)_(i \, l) parallel_(upright("cb")) lt.eq C e^(- c l^alpha) . $ <eq:quasilocal-channel-tail>]

 The map $cal(E)_(i \, l)$ fixes every operator commuting with the full algebra on $N_l \( a_i \)$, including operators supported outside that ball. All these conclusions allow arbitrary spectator auxiliary systems.]
] <lem:quasilocal-roots>

#proof[
  Apply (4.13) to $k_i \, k_(i \, l)$ and to $I - k_i \, I - k_(i \, l)$, using (4.9). The order and ground-vector assertions follow from functional calculus. Each displayed channel is a sum of two maps of the form $B mapsto A^(*) B A$; this proves complete positivity, while the sum of the squared Kraus operators is $I$. More explicitly, the map $v mapsto G_i v xor K_i v$ is an isometry and $cal(E)_i \( B \)$ is the compression of $B xor B$ by that isometry. This proves contractivity, and the same proof works for the local maps and after adjoining an identity tensor factor. Finally,
  $ parallel A B A - A' B A' parallel lt.eq \( parallel A parallel + parallel A' parallel \) parallel A - A' parallel parallel B parallel \, $
  also on every auxiliary extension. Applying this to both summands proves (4.15), where the completely bounded norm is the supremum of these extended operator norms. An operator commuting with the ball algebra commutes with both local square roots, so its image is itself times $G_(i \, l)^2 + K_(i \, l)^2 = I$. ◻
]

=== 4.3 Truncation with an error independent of the total volume <truncation-with-an-error-independent-of-the-total-volume>

We next make the positive constraints strictly local near a testing set. Conditional expectation preserves positivity but need not preserve $k_i Omega = 0$. We therefore bound the norm of the total perturbation and work with the truncated Hamiltonian’s exact ground vector. Farther constraints receive larger truncation radii, so that summing all errors does not charge the entire volume. Graph balls will also let us count the terms crossing a cut by the number of edges of that cut. The choice $p = 1$ suffices here: tails of the form $e^(- c sqrt(l))$ give radii of order $\( log n \)^2$ for inverse-power accuracy at scale $n$.

#thm([Proposition 4.5.])[
  (Truncation near a finite set).  #emph[Use Proposition 10 with $p = 1$, so $alpha = 1 \/ 2$. Fix $C_0 > 0$. There is a constant $C_1$, depending only on $q \, R \, J \, Delta \, C_0$, with the following property for every real $n gt.eq 2$ and every nonempty $S_0 subset.eq Lambda$ with $\| S_0 \| lt.eq C_0 n^2$. Put $r_0 = ceil.l C_1 \( log n \)^2 ceil.r$. If $d_i^0 := d_Lambda \( a_i \, S_0 \) < oo$, define 
#[#set math.equation(numbering: n => "(4.16)")
 $ r_i = max { r_0 \, floor.l d_i^0 \/ 2 floor.r } \, #h(2em) tilde(h)_i = k_(i \, r_i) \, #h(2em) tilde(X)_i = N_(r_i) \( a_i \) . $ <eq:quasilocal-variable-radius>]

 If $d_i^0 = oo$, set $tilde(h)_i = k_i$ and designate its anchor’s entire component as $tilde(X)_i$. Then $tilde(H) = sum_i tilde(h)_i$ is a sum of positive contractions and 
#[#set math.equation(numbering: n => "(4.17)")
 $ parallel tilde(H) - H_F parallel lt.eq epsilon.alt_n \, #h(2em) epsilon.alt_n := min { n^(- 1000) \, g \/ 4 } . $ <eq:quasilocal-truncation-error>]

 Its ground energy $tilde(E)_0$ lies in $\[ 0 \, epsilon.alt_n \]$, its ground vector $tilde(Omega)$ is unique, and its gap is at least $g \/ 2$. After a choice of phase, 
#[#set math.equation(numbering: n => "(4.18)")
 $ parallel tilde(Omega) - Omega parallel lt.eq 2 sqrt(epsilon.alt_n \/ g) \, #h(2em) 1 / 2 parallel \| tilde(Omega) chevron.r chevron.l tilde(Omega) \| - P_Omega parallel_1 lt.eq sqrt(2 epsilon.alt_n \/ g) . $ <eq:quasilocal-ground-distance>]

]
  #emph[For a set $X subset.eq S_0$, let $b_X = \| partial_Lambda X \|$ and let $cal(C)_X$ be the labels whose designated supports $tilde(X)_i$ meet both $X$ and $Lambda \\ X$. Every such support has radius exactly $r_0$, and 
#[#set math.equation(numbering: n => "(4.19)")
 $ \| cal(C)_X \| lt.eq C b_X \( r_0 + 1 \)^2 \, #h(2em) log d_i lt.eq C \( r_0 + 1 \)^2 quad \( i in cal(C)_X \) \, #h(2em) d_i := q^(\| tilde(X)_i \|) . $ <eq:quasilocal-crossing-count>]

 Consequently the cut parameter 
#[#set math.equation(numbering: n => "(4.20)")
 $ cal(B)_X := 1 + sum_(i in cal(C)_X) log^2 \( e d_i \) lt.eq C \( 1 + b_X \) \( r_0 + 1 \)^6 . $ <eq:quasilocal-cut-budget>]

 In particular, $b_X lt.eq C_2 n D$ and $D gt.eq 1$ imply $cal(B)_X lt.eq C n D \( log n \)^12$, with the constant also depending on $C_2$.]
] <prop:truncation>

#proof[
  We first prove the summation estimate for any fixed $alpha in \( 0 \, 1 \)$ for which (4.9) holds, and any integer $r_0 gt.eq 1$. At each finite distance $d$ from $S_0$ there are at most $C mu_R \| S_0 \| \( d + 1 \)^2$ labels: every anchor at that distance belongs to $N_d \( x \)$ for some $x in S_0$, and anchor multiplicity is bounded by $mu_R$. Labels at infinite distance have no error by definition. The triangle inequality therefore gives
  #[#set math.equation(numbering: n => "(4.21)")
   $ parallel tilde(H) - H_F parallel & lt.eq C \| S_0 \| sum_(d gt.eq 0) \( d + 1 \)^2 exp #scale(x: 120%, y: 120%)[\(] - c max { r_0 \, floor.l d \/ 2 floor.r }^alpha #scale(x: 120%, y: 120%)[\)] lt.eq C' \| S_0 \| e^(- c' r_0^alpha) . $ <eq:quasilocal-volume-free>]
  To justify the final inequality, the terms $d lt.eq 2 r_0 + 2$ have sum at most $C \( r_0 + 1 \)^3 e^(- c r_0^alpha)$. For $d > 2 r_0 + 2$ use $floor.l d \/ 2 floor.r gt.eq d \/ 3$; comparison with the integral of $\( x + 1 \)^2 e^(- c \( x \/ 3 \)^alpha)$, followed by $u = x^alpha$, bounds the remaining tail by a fixed power of $r_0 + 1$ times $e^(- c'' r_0^alpha)$. All such powers are absorbed by decreasing the positive exponential constant. Thus (4.21) has no factor involving $\| Lambda \|$.
  Now take $alpha = 1 \/ 2$, $\| S_0 \| lt.eq C_0 n^2$, and $r_0 = ceil.l C_1 \( log n \)^2 ceil.r$. The right-hand side of (4.21) is at most $C' C_0 n^(2 - c' sqrt(C_1))$. Taking $C_1$ sufficiently large proves (4.17), including its $g \/ 4$ bound for all $n gt.eq 2$.
  Positivity gives $tilde(E)_0 gt.eq 0$, and testing $tilde(H)$ on $Omega$ gives $tilde(E)_0 lt.eq epsilon.alt_n$. The min–max principle and (4.17) put the second eigenvalue of $tilde(H)$ at least $g - epsilon.alt_n$. The difference between its first two eigenvalues is consequently at least $g - 2 epsilon.alt_n gt.eq g \/ 2$, which also proves uniqueness. Moreover,
  $ g #scale(x: 120%, y: 120%)[\(] 1 - \| chevron.l Omega \, tilde(Omega) chevron.r \|^2 #scale(x: 120%, y: 120%)[\)] lt.eq chevron.l tilde(Omega) \, H_F tilde(Omega) chevron.r lt.eq tilde(E)_0 + epsilon.alt_n lt.eq 2 epsilon.alt_n . $
  The trace distance of two pure states equals the square root of one minus their squared overlap, giving the second estimate in (4.18). Choose the overlap real and nonnegative, and use $1 - s lt.eq 1 - s^2$ for $0 lt.eq s lt.eq 1$ to obtain the first estimate.
  Finally, if a designated support meets $X subset.eq S_0$, then its anchor has finite distance from $S_0$. If $r_i > r_0$, formula (4.16) gives $r_i = floor.l d_i^0 \/ 2 floor.r < d_i^0$, so that its ball cannot meet $S_0$. Hence every label in $cal(C)_X$ has $r_i = r_0$. If its anchor lies in $X$, take a shortest path from the anchor to a point of the ball outside $X$; otherwise take one to a point inside $X$. This path stays in the ball and contains an edge of $partial_Lambda X$. Thus the anchor is within $r_0$ of an endpoint of a crossing edge. There are at most $2 b_X$ endpoints, at most $C \( r_0 + 1 \)^2$ sites in each such ball, and at most $mu_R$ labels per anchor. This proves the first bound in (4.19). The ball volume bound also gives $log d_i = \| tilde(X)_i \| log q lt.eq C \( r_0 + 1 \)^2$. Summing its squared version proves (4.20). Since $r_0 + 1 lt.eq C \( log n \)^2$ for $n gt.eq 2$, its stated consequence follows. ◻
]

In the geometric applications of Section 9, a finite $T subset bb(Z)^2$ and an integer $L gt.eq 0$ will be specified. With $T_L = T + \( \[ - L \, L \]^2 ∩ bb(Z)^2 \)$, we take $S_0 = A ∩ T_L$. Only the bound $\| S_0 \| lt.eq C n^2$ is needed in Proposition 12; the geometric estimates will provide $b_X = O \( n D \)$ for the cuts that arise there. If $S_0$ is empty we retain all constraints exactly, and every cut $X subset.eq S_0$ has no crossing label. More generally, components that do not meet $S_0$ are retained exactly throughout the construction. The exponent $1000$ in the approximation error can be replaced by any fixed positive exponent by increasing $C_1$; the powers of $log n$ in the support and cut bounds do not change.

== 5 Two conditional operator estimates <sec:conditional>

The two estimates used in the next section concern an arbitrary finite-dimensional pure state. Their constants depend on the dimension of a moved subsystem or of the support of a local operator, rather than on the dimensions of the remaining systems. The first bounds the norm of two overlapping density-matrix powers. The second controls how far a local operator expectation departs from the nonnegative real axis after conjugation by marginal powers. Later these estimates will measure, respectively, the entropy gained and the energy spent when a small subsystem changes sides in a partition.

For a density matrix $rho$, write

$ rho^(\[ z \]) = sum_(p > 0) p^z Pi_p \, #h(2em) hat(rho) = rho + Pi_(ker rho) . $

Here $Pi_p$ is its spectral projection at $p$. Thus $rho^(\[ z \])$ is zero on the kernel for every complex $z$, including $z = 0$, whereas $hat(rho)^(i u)$ is unitary. We omit the brackets on positive real powers. On a purification of $rho$, either convention for an innermost power gives the same vector. Tensoring an operator with the identity on unmentioned factors is understood. We use the Schatten norms $parallel T parallel_p = \( "Tr" \| T \|^p \)^(1 \/ p)$ for $1 lt.eq p < oo$ and $parallel T parallel_oo = parallel T parallel$; in particular $parallel T parallel_2$ is the Hilbert–Schmidt norm. A density matrix is called faithful if it is positive definite.

=== 5.1 A relative logarithmic moment bound <a-relative-logarithmic-moment-bound>

We first record the dimension estimate used in both proofs. Let $rho$ be a density matrix on $x U$, let $d = dim x$, and put $Q = I_x ⊗ hat(rho)_U$. If $p_i > 0$ and $q_j > 0$ are eigenvalues of $rho$ and $Q$, respectively, choose eigenbases, with the $Q$ basis respecting $x ⊗ "supp" rho_U$, and give $\( i \, j \)$ probability $p_i \| chevron.l i \, j chevron.r \|^2$. This defines a real random variable

$ L = log p_i - log q_j . $

The support inclusion $"supp" rho subset.eq x ⊗ "supp" rho_U$ shows that only eigenvectors of $Q$ in this latter space contribute. After restricting $Q$ to this space and normalizing it by $d$, this is the two-eigenbasis construction of Nussbaum and Szkoła #cite(label("NussbaumSzkola2009")) Section 3, equation (11): the normalized log ratio is $L + log d$. We prove the dimension bounds needed here directly. They are

#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E) L = - S \( x \| U \)_rho \, #h(2em) bb(E) e^L lt.eq d \, #h(2em) bb(E) e^(- L) lt.eq d . $ <eq:conditional-log-moments>]

For completeness, positivity of the blocks of $rho$ in an $x$-basis gives, for $v = sum_(b = 1)^d \| b chevron.r v_b$,

$ chevron.l v \, rho v chevron.r lt.eq (sum_b chevron.l v_b \, rho_(b b) v_b chevron.r^(1 \/ 2))^2 lt.eq d sum_b chevron.l v_b \, rho_U v_b chevron.r . $

Thus $rho lt.eq d \( I_x ⊗ rho_U \) lt.eq d Q$. It follows that $rho^(1 \/ 2) Q^(- 1) rho^(1 \/ 2) lt.eq d I$, and hence $bb(E) e^L = "Tr" rho^2 Q^(- 1) lt.eq d$. The other exponential moment equals $"Tr" \( Pi_("supp" rho) Q \) lt.eq d$. The formula for the mean follows by taking the two marginal traces.

Put $ell = log \( e d \)$. Markov’s inequality in (5.1) gives $Pr \( \| L \| > v \) lt.eq 2 d e^(- v)$. Splitting at $2 ell$ and integrating this tail proves, with universal constants,

$ bb(E) #scale(x: 120%, y: 120%)[\[] L^2 e^(\| b L \|) #scale(x: 120%, y: 120%)[\]] lt.eq C ell^2 quad upright("if ") \| b \| ell lt.eq c . $

Taylor’s formula, followed by $log \( 1 + y \) lt.eq y$, therefore yields

#[#set math.equation(numbering: n => "(5.2)")
 $ log bb(E) e^(b L) lt.eq - b S \( x \| U \)_rho + C b^2 ell^2 \, #h(2em) \| b \| ell lt.eq c . $ <eq:conditional-log-mgf>]

These constants are independent of $dim U$.

A useful consequence is a conditional Schatten estimate. For $0 < a < 1 \/ 4$, put

$ K = Q^(- a) rho Q^(- a) \, #h(2em) r = \( 1 - 2 a \)^(- 1) \, #h(2em) Z = \( "Tr" K^r \)^(1 \/ r) . $

Then, after reducing the universal $c$ if necessary,

#[#set math.equation(numbering: n => "(5.3)")
 $ log Z lt.eq - 2 a S \( x \| U \)_rho + C a^2 ell^2 \, #h(2em) a ell lt.eq c . $ <eq:conditional-schatten>]

Indeed interpolate $rho^(\[ z \/ 2 \]) Q^(- a z)$ between operator norm at $Re z = 0$ and Hilbert–Schmidt norm at $Re z = r$. The first bound is one, and the square of the second is

$ "Tr" rho^r Q^(- 2 a r) = bb(E) e^(\( r - 1 \) L) . $

The resulting bound at $z = 1$ is

$ Z = parallel rho^(1 \/ 2) Q^(- a) parallel_(2 r)^2 lt.eq #scale(x: 120%, y: 120%)[\(] bb(E) e^(\( r - 1 \) L) #scale(x: 120%, y: 120%)[\)]^(1 \/ r) . $

One can obtain this interpolation directly from scalar three-lines: for a matrix $B = V \| B \|$ with $parallel B parallel_(\( 2 r \)') = 1$, pair the analytic matrix with $\| B \|^(\( 2 r \)' \( 1 - z \/ \( 2 r \) \)) V^(*)$ in the trace. This test has trace norm one on the first boundary and Hilbert–Schmidt norm one on the second; at $z = 1$ it is $B^(*)$. Noninvertible test matrices follow by approximation. Now use $r - 1 = 2 a r$ in (5.2) to prove (5.3).

=== 5.2 Moving a subsystem <moving-a-subsystem>

#thm([Lemma 5.1.])[
  (Conditional movement estimate).  #emph[Let $theta$ be a unit pure vector on four finite-dimensional systems $P \, x \, U \, F$, and let $rho_D$ denote its marginal on $D$. Set 
$ d = dim x \, quad ell = log \( e d \) \, quad eta = S \( x \| P \)_theta + S \( x \| U \)_theta = I \( x : F \| U \)_theta = I \( x : F \| P \)_theta . $

 There are universal constants $c \, C > 0$ such that, for $0 < a ell lt.eq c$ and arbitrary density matrices $sigma$ on $x P$ and $tau$ on $x U$, 
#[#set math.equation(numbering: n => "(5.4)")
 $ ∥sigma^(a \/ 2) hat(rho)_P^(- a \/ 2) tau^(a \/ 2) hat(rho)_U^(- a \/ 2) theta∥ lt.eq exp (- a / 2 eta + C a^(5 \/ 4) ell^2) . $ <eq:conditional-movement>]

 The same bound holds for positive subnormalized $sigma \, tau$.]
] <lem:movement>

#proof[
  Purity and strong subadditivity give the displayed identities and $eta gt.eq 0$. It suffices initially to take $sigma \, tau$ faithful. Write $d_U = S \( x \| U \)_theta$ and $d_P = S \( x \| P \)_theta$. Consider
  $ G \( z \) = sigma^(a z) hat(rho)_P^(- a z) tau^(a \( 1 - z \)) hat(rho)_U^(- a \( 1 - z \)) theta \, #h(2em) 0 lt.eq Re z lt.eq 1 . $
  The midpoint is the vector in (5.4). All imaginary powers here are unitary. In particular $G$ is bounded on this strip, with bounds allowed at this intermediate step to depend on its fixed invertible factors.
  On the left boundary, discard the leftmost unitary factors and move the remaining imaginary powers past the commuting real powers. With $rho = rho_(x U)$, $Q = I_x ⊗ hat(rho)_U$, and $tau_u = Q^(- i a u) tau Q^(i a u)$, this gives
  $ parallel G \( i u \) parallel = M \( u \) := parallel tau_u^a Q^(- a) theta parallel . $
  Hölder’s inequality and (5.3) imply
  $ M \( u \)^2 = "Tr" tau_u^(2 a) K lt.eq Z \, #h(2em) log Z lt.eq - 2 a d_U + C a^2 ell^2 . $
  We retain the slack in this bound: a large slack already improves the left boundary, while a small slack will control the distance from the right-boundary input to $theta$. Choose a universal $C_0$ larger than half the constant in this last bound and set
  #[#set math.equation(numbering: n => "(5.5)")
   $ lambda \( u \) = - a d_U + C_0 a^2 ell^2 - log M \( u \) gt.eq 0 \, #h(2em) xi = K^r \/ "Tr" K^r . $ <eq:conditional-slack>]
  The normalized Hölder overlap then satisfies
  #[#set math.equation(numbering: n => "(5.6)")
   $ "Tr" tau_u^(2 a) xi^(1 - 2 a) = M \( u \)^2 \/ Z gt.eq e^(- 2 lambda \( u \)) . $ <eq:conditional-overlap>]
  We need to relate this overlap to $rho$, independently of the smallest eigenvalues of either marginal. Taking $rho$ in place of $tau_u$ for this comparison gives
  $ parallel rho^a Q^(- a) theta parallel gt.eq chevron.l theta \, rho^a Q^(- a) theta chevron.r = "Tr" rho^(1 + a) Q^(- a) = bb(E) e^(a L) gt.eq e^(- a d_U) . $
  The trace is real and nonnegative. Thus $1 - "Tr" rho^(2 a) xi^(1 - 2 a) lt.eq C a^2 ell^2$. The function $b mapsto 1 - "Tr" rho^(\[ b \]) xi^(\[ 1 - b \])$ is nonnegative and concave on $\[ 0 \, 1 \]$: expand in their two eigenbases for concavity, and use Hölder for nonnegativity. For $2 a lt.eq 1 \/ 2$, concavity and its nonnegative value at zero give
  $ 1 - "Tr" sqrt(rho) sqrt(xi) lt.eq frac(1 - "Tr" rho^(2 a) xi^(1 - 2 a), 4 a) . $
  Consequently
  #[#set math.equation(numbering: n => "(5.7)")
   $ H := parallel sqrt(rho) - sqrt(xi) parallel_2 lt.eq C sqrt(a) thin ell . $ <eq:conditional-hellinger>]
  We next show how the slack in (5.5) controls the state arriving at the opposite boundary. Define
  $ theta_u = tau^(- i a u) Q^(i a u) theta = Q^(i a u) tau_u^(- i a u) theta . $
  This is a unit vector with the same $P$ marginal as $theta$. We claim
  #[#set math.equation(numbering: n => "(5.8)")
   $ parallel theta_u - theta parallel lt.eq C \( 1 + \| u \| \) #scale(x: 120%, y: 120%)[\(] sqrt(lambda \( u \)) + sqrt(a) thin ell #scale(x: 120%, y: 120%)[\)] . $ <eq:conditional-state-movement>]
  Here and in the verification all kernel phases are extended by one. First,
  $ parallel \( Q^(- i a u) - hat(rho)^(- i a u) \) theta parallel^2 lt.eq a^2 u^2 bb(E) L^2 lt.eq C a^2 u^2 ell^2 . $
  For the remaining comparison of $tau_u$ and $rho$ insert the phase of $xi$. For any densities $A \, B$ and real $b$,
  #[#set math.equation(numbering: n => "(5.9)")
   $ parallel \( hat(A)^(i b) - hat(B)^(i b) \) sqrt(B) parallel_2 lt.eq C \( 1 + \| b \| \) parallel sqrt(A) - sqrt(B) parallel_2 . $ <eq:conditional-phase-hellinger>]
  To check this, expand in their two spectral bases. For positive eigenvalues with ratio $v$, use $\| 1 - v^(i b) \| lt.eq C \( 1 + \| b \| \) \| 1 - sqrt(v) \|$. This follows from the mean-value theorem when $1 \/ 4 lt.eq v lt.eq 4$, and the bound two outside that interval. At a zero eigenvalue of $A$ the same assertion follows from the bound two and $\| 1 - sqrt(0) \| = 1$; zero eigenvalues of $B$ contribute nothing to the left side.
  Replacing $sqrt(rho)$ by $sqrt(xi)$ in the $tau_u \, xi$ phase difference costs at most $2 H$. On $sqrt(xi)$, give a pair of eigenvalues $p$ of $xi$ and $q$ of $tau_u$ the probability $p \| chevron.l p \, q chevron.r \|^2$ and put $v = log \( q \/ p \)$. Faithfulness of $tau_u$ makes this finite, and
  $ bb(E) e^v lt.eq 1 \, #h(2em) bb(E) e^(2 a v) gt.eq e^(- 2 lambda \( u \)) $
  by (5.6). On $v lt.eq 0$,
  $ \| 1 - e^(- i a u v) \|^2 lt.eq C \( 1 + u^2 \) \( 1 - e^(2 a v) \) \, $
  and
  $ bb(E) \[ \( 1 - e^(2 a v) \) 1_(v lt.eq 0) \] lt.eq 1 - e^(- 2 lambda \( u \)) + bb(E) \[ \( e^(2 a v) - 1 \) 1_(v > 0) \] lt.eq 2 lambda \( u \) + 2 a . $
  The last step uses $e^(2 a v) - 1 lt.eq 2 a \( e^v - 1 \)$ for $v > 0$. On $v > 0$ the squared phase difference is at most $C a^2 u^2 e^v$. These estimates, followed by (5.9) for $xi \, rho$ and (5.7), prove (5.8).
  The phase comparison now lets us recover the other conditional entropy. On the right boundary, the remaining $P$ phases merely conjugate $sigma$. Apply (5.3) and Hölder on $x P$ to the input $theta_u$, whose $P$ marginal is unchanged. It follows that
  $ log parallel G \( 1 + i u \) parallel lt.eq - a S \( x \| P \)_(theta_u) + C a^2 ell^2 . $
  The continuity bound for conditional entropy in Lemma 3, using only $dim x$, and (5.8) now give
  $ log parallel G \( 1 + i u \) parallel lt.eq  & - a d_P + C a^2 ell^2\
 & + C a ell \( 1 + \| u \| \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] lambda \( u \)^(1 \/ 4) + a^(1 \/ 4) ell^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $
  On the left boundary the bound is exactly $- a d_U + C_0 a^2 ell^2 - lambda \( u \)$.
  For clarity, the logarithmic interpolation used here assigns density
  $ frac(d u, 2 cosh \( pi u \)) $
  to each boundary line when evaluated at the midpoint. Each line has total mass $1 \/ 2$. This follows by mapping the strip to the upper half-plane by $z mapsto e^(pi i z)$ and using harmonic measure at $i$. Applied to the logarithm of a scalar analytic function it follows from the submean inequality, first on bounded domains and then by a limit. Pairing $G$ with a unit vector in its midpoint direction gives the vector-norm assertion. All boundary norms above are bounded above and away from zero for the fixed faithful factors, so this application and the limit are legitimate.
  Pair the two boundary estimates at the same $u$. Young’s inequality gives
  $ - lambda + C a ell \( 1 + \| u \| \)^(1 \/ 2) lambda^(1 \/ 4) lt.eq C #scale(x: 120%, y: 120%)[\(] a ell \( 1 + \| u \| \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)]^(4 \/ 3) . $
  After integration, this term, the quadratic errors, and the remaining $a^(5 \/ 4) ell^(3 \/ 2)$ term are all at most $C a^(5 \/ 4) ell^2$. The entropy contribution is $- a \( d_P + d_U \) \/ 2$, proving (5.4) for faithful $sigma \, tau$. Approximation by faithful densities removes that restriction by continuity of positive powers. Finally normalizing subdensities only increases the left side; the zero subdensity case is immediate. ◻
]

=== 5.3 Comparing marginal phases <comparing-marginal-phases>

To prove the local conjugation estimate, we first control a change in products of marginal imaginary powers by conditional mutual information. For faithful states, Petz’s equality theorem characterizes preservation of relative entropy under restriction to a subalgebra by equality of the corresponding products of imaginary powers #cite(label("Petz1986")) Theorem 4(iii),(iv). The comparison below gives the quantitative estimate needed here, with constants controlled by $dim x$.

#thm([Lemma 5.2.])[
  (Marginal-phase comparison).  #emph[Let $theta$ be a unit pure vector on finite-dimensional systems $P \, x \, U \, F$, write $rho_D$ for its marginals, and put $d = dim x$ and $eta = I \( x : F \| U \)_theta$. For $eta > 0$ define 
$ y = min \( 1 \, eta \) \, #h(2em) cal(R)_eta = sqrt(y) + sqrt(eta log \( e d \/ y \)) \, $

 and set $cal(R)_0 = 0$. There is a universal constant $C > 0$ such that, for every $u in bb(R)$, 
#[#set math.equation(numbering: n => "(5.10)")
 $ parallel #scale(x: 120%, y: 120%)[\(] hat(rho)_U^(- i u) hat(rho)_(x U)^(i u) - hat(rho)_(U F)^(- i u) hat(rho)_(x U F)^(i u) #scale(x: 120%, y: 120%)[\)] theta parallel lt.eq C \| sinh \( pi u \) \| cal(R)_eta . $ <eq:conditional-modular-bound>]

 In particular the two phase products agree on $theta$ if $eta = 0$. The constants do not depend on $dim P$, $dim U$, or $dim F$.]
] <lem:conditional-phases>

#proof[
  The proof writes $eta$ as the integral of a nonnegative resolvent defect. Two moment bounds, involving only $d$, control the ends of the integral; the entropy controls the part between them. Initially let $rho_f = rho_(x U F)$ be faithful, and put
  $ sigma_f = I_x \/ d ⊗ rho_(U F) \, #h(2em) rho_s = rho_(x U) \, #h(2em) sigma_s = I_x \/ d ⊗ rho_U \, #h(2em) d = dim x . $
  On their Hilbert–Schmidt matrix spaces define positive definite operators
  $ A = L_(sigma_f) R_(rho_f^(- 1)) \, #h(2em) B = L_(sigma_s) R_(rho_s^(- 1)) \, $
  where $L$ and $R$ denote left and right multiplication. Define the isometry
  $ V \( X sqrt(rho_s) \) = \( X ⊗ I_F \) sqrt(rho_f) . $
  It is an isometry by taking the partial trace of $rho_f$. Taking matrix elements in the same way with $sigma_f$ shows $V^(*) A V = B$: both sides have the form $"Tr" X^(*) sigma_s Y$. Put $b_0 = sqrt(rho_s)$ and $a_0 = V b_0 = sqrt(rho_f)$. For $v > 0$, let
  $ delta_v = \( A + v I \)^(- 1) a_0 - V \( B + v I \)^(- 1) b_0 . $
  Expansion of its weighted squared norm, using $V^(*) \( A + v I \) V = B + v I$, gives the resolvent compression identity #cite(label("CarlenVershynina2019")) Lemma 2.1:
  #[#set math.equation(numbering: n => "(5.11)")
   $ parallel \( A + v I \)^(1 \/ 2) delta_v parallel_2^2 = chevron.l a_0 \, \( A + v I \)^(- 1) a_0 chevron.r - chevron.l b_0 \, \( B + v I \)^(- 1) b_0 chevron.r = : h \( v \) gt.eq 0 . $ <eq:conditional-resolvent-square>]
  The logarithmic resolvent formula gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ integral_0^oo h \( v \) thin d v = D \( rho_f parallel sigma_f \) - D \( rho_s parallel sigma_s \) = eta \, $ <eq:conditional-resolvent-entropy>]
  where $D \( rho parallel sigma \) = "Tr" rho \( log rho - log sigma \)$. Indeed $- chevron.l sqrt(rho) \, log \( L_sigma R_(rho^(- 1)) \) sqrt(rho) chevron.r = D \( rho parallel sigma \)$, and the identity terms in the log integral cancel. The last equality in (5.12) follows by expanding the four entropies.
  The local domination proved in (5.1) now reads $rho_f lt.eq d^2 sigma_f$. Therefore
  $ chevron.l a_0 \, A^(- 1) a_0 chevron.r = "Tr" rho_f^2 sigma_f^(- 1) lt.eq d^2 \, #h(2em) chevron.l b_0 \, B b_0 chevron.r = "Tr" sigma_s = 1 . $
  The first resolvent quadratic form in (5.11) is therefore at most $d^2$. For another bound use $\( A + v I \)^(- 1) lt.eq v^(- 1) I$ and $\( B + v I \)^(- 1) gt.eq v^(- 1) I - v^(- 2) B$. We obtain
  #[#set math.equation(numbering: n => "(5.13)")
   $ 0 lt.eq h \( v \) lt.eq min \( d^2 \, v^(- 2) \) \, #h(2em) parallel delta_v parallel_2 lt.eq sqrt(h \( v \) \/ v) . $ <eq:conditional-resolvent-tail>]
  For $- 1 < Re z < 0$, scalar integration and spectral calculus give
  $ A^z a_0 - V B^z b_0 = - frac(sin pi z, pi) integral_0^oo v^z delta_v thin d v . $
  One may approach $z = - i u$ from $- 1 \/ 4 lt.eq Re z < 0$ under this integral: (5.13) gives an integrable majorant $d thin v^(- 3 \/ 4)$ near zero and $v^(- 3 \/ 2)$ near infinity. Hence
  $ parallel A^(- i u) a_0 - V B^(- i u) b_0 parallel_2 lt.eq C \| sinh pi u \| integral_0^oo sqrt(h \( v \) \/ v) thin d v . $
  For $eta > 0$, split the integral at $y \/ d^2$ and $1 \/ y$. The two ends cost at most $C sqrt(y)$ by (5.13); Cauchy–Schwarz and (5.12) bound the middle by
  $ (integral h \( v \) thin d v)^(1 \/ 2) (integral_(y \/ d^2)^(1 \/ y) frac(d v, v))^(1 \/ 2) lt.eq C sqrt(eta log \( e d \/ y \)) . $
  If $eta = 0$, nonnegativity and continuity imply $h \( v \) = 0$ for all $v > 0$, so the discrepancy is zero. To identify the resulting vectors, use the definition of $V$:
  $ A^(- i u) a_0 & = sigma_f^(- i u) rho_f^(i u) sqrt(rho_f) \,\
V B^(- i u) b_0 & = #scale(x: 120%, y: 120%)[\(] sigma_s^(- i u) rho_s^(i u) ⊗ I_F #scale(x: 120%, y: 120%)[\)] sqrt(rho_f) . $
  After cancelling the common scalar phase $d^(i u)$ and reversing the sign of the difference, its Hilbert–Schmidt norm is
  $ parallel #scale(x: 120%, y: 120%)[\(] hat(rho)_U^(- i u) hat(rho)_(x U)^(i u) - hat(rho)_(U F)^(- i u) hat(rho)_(x U F)^(i u) #scale(x: 120%, y: 120%)[\)] sqrt(rho_f) parallel_2 . $
  For any operator $T$ on $x U F$ one has $parallel T theta parallel = parallel T sqrt(rho_f) parallel_2$. This proves (5.10) in the faithful case.
  For a possibly singular $rho_f$, replace it by $\( 1 - epsilon.alt \) rho_f + epsilon.alt I \/ dim \( x U F \)$ and use its reductions in the preceding proof. Conditional mutual information converges in finite dimension. The phase products on the square root converge in Hilbert–Schmidt norm in the required order. For example, the innermost lifted phase of $rho_(x U \, epsilon.alt)$ acts on $sqrt(rho_(f \, epsilon.alt))$. Its limit lies in $"supp" rho_(x U) ⊗ F$, because $"supp" rho_f subset.eq "supp" rho_(x U) ⊗ F$ and the square-root mass outside this space tends to zero. On this space the inner phase converges, since the mollified marginal commutes with its limit. Its output lies in $x ⊗ "supp" rho_U ⊗ F$, so the outer $rho_(U \, epsilon.alt)$ phase also converges there. The same argument applies to the $x U F \, U F$ pair. All phases have norm one, which controls the vanishing complementary pieces. Thus the limit is the product of support phases, equivalently the unitary extensions appearing in (5.10). No operator-norm convergence of phases on a limiting kernel is being used. The faithful proof was on Hilbert–Schmidt spaces, so it also applies when a faithful approximation would require a larger purifying system than $P$. This establishes (5.10) in full generality. ◻
]

=== 5.4 A local conjugation estimate <a-local-conjugation-estimate>

We now combine the marginal-phase comparison with an analytic strip bound for a local positive operator. This converts the phase control into the real-power estimate used in the replica argument.

#thm([Lemma 5.3.])[
  (Conditional skew estimate).  #emph[Let $theta$ be a unit pure vector on $P \, x \, U \, F$, put $Y = x U$, and write $rho_D$ for its marginals. Suppose $P = P_0 P_1$ and that $0 lt.eq h lt.eq I$ is supported on $P_0 x$. Set 
$ d_h = \( dim P_0 \) \( dim x \) \, #h(2em) ell_h = log \( e d_h \) \, #h(2em) eta = I \( x : F \| U \)_theta = I \( x : F \| P \)_theta . $

 Define the entire scalar function 
$ f \( z \) = chevron.l theta \, rho_P^(\[ z \]) rho_Y^(\[ - z \]) h rho_P^(\[ - z \]) rho_Y^(\[ z \]) theta chevron.r . $

 There are universal constants $c \, C > 0$ such that for $0 < a ell_h lt.eq c$ and $t = a \/ 2$, 
#[#set math.equation(numbering: n => "(5.14)")
 $ \| f \( t \) \| - Re f \( t \) lt.eq C a^2 ell_h^4 eta^(1 \/ 8) . $ <eq:conditional-skew>]

 In particular the left side is zero if $eta = 0$.]
] <lem:skew>

#proof[
  Put $p = chevron.l theta \, h theta chevron.r in \[ 0 \, 1 \]$, so $f \( 0 \) = p$. We first bound $f$ on a strip using the support dimension of $h$, then compare its imaginary-axis values with $p$, and finally estimate its real-axis deviation from $\[ 0 \, oo \)$. Expand $h = sum c ⊗ d'$ across $P_0 \, x$ using matrix units on $P_0$. There are at most $d_h^2$ terms, with $parallel c parallel parallel d' parallel lt.eq 1$ for each. For $0 lt.eq Re z lt.eq 1 \/ 4$ the contribution is the inner product of
  $ rho_Y^(\[ macron(z) \]) \( d' \)^(*) rho_Y^(\[ - macron(z) \]) theta quad upright("and") quad rho_P^(\[ z \]) c rho_P^(\[ - z \]) theta . $
  Each norm is bounded by the norm of its local operator: for a marginal $rho$ and $0 lt.eq Re z lt.eq 1 \/ 2$,
  $ parallel rho^(\[ z \]) c rho^(\[ 1 \/ 2 - z \]) parallel_2 lt.eq parallel c parallel $
  by Schatten Hölder. This is also valid at the endpoints using support powers. Reflection $f \( - macron(z) \) = overline(f \( z \))$ treats negative real parts. Thus $\| f \( z \) \| lt.eq d_h^2$ on $\| Re z \| lt.eq 1 \/ 4$. On the imaginary axis it is an expectation in a unit vector and has absolute value at most one. Three-lines on the two half-strips gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ \| f \( z \) \| lt.eq C #h(2em) \( \| Re z \| lt.eq b \) \, #h(2em) b = c_0 \/ ell_h \, $ <eq:conditional-narrow-strip>]
  for a sufficiently small universal $c_0 > 0$.
  On the imaginary axis Schmidt mirroring across $P \, Y F$ gives
  $ f \( i u \) = chevron.l w_u \, h w_u chevron.r \, #h(2em) w_u = hat(rho)_Y^(i u) hat(rho)_(Y F)^(- i u) theta . $
  Compare this with $w_u^0 = hat(rho)_U^(i u) hat(rho)_(U F)^(- i u) theta$. The latter is a unitary acting only on $U F$, so $chevron.l w_u^0 \, h w_u^0 chevron.r = p$. Multiplication of both vectors first by $hat(rho)_P^(i u)$ and then by $hat(rho)_U^(- i u)$, and a second use of Schmidt mirroring, show that
  #[#set math.equation(numbering: n => "(5.16)")
   $ parallel w_u - w_u^0 parallel = parallel \( hat(rho)_U^(- i u) hat(rho)_Y^(i u) - hat(rho)_(U F)^(- i u) hat(rho)_(Y F)^(i u) \) theta parallel . $ <eq:conditional-phase-discrepancy>]
  Lemma 14 therefore gives $parallel w_u - w_u^0 parallel lt.eq C \| sinh \( pi u \) \| cal(R)_eta$, where $cal(R)_eta$ is defined there with $d = dim x$.
  It remains to pass from phases to the real-power skew. Positivity of $h$ and the identity $chevron.l w_u^0 \, h w_u^0 chevron.r = p$ imply
  $ \| f \( i u \) - p \| lt.eq 2 sqrt(p) thin parallel w_u - w_u^0 parallel + parallel w_u - w_u^0 parallel^2 . $
  In particular, differentiating at zero and using (5.10) gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ f' \( 0 \) in i bb(R) \, #h(2em) \| f' \( 0 \) \| lt.eq C sqrt(p) thin cal(R)_eta . $ <eq:conditional-first-derivative>]
  The imaginary character also follows from $f \( - macron(z) \) = overline(f \( z \))$.
  Set $m = min \( 1 \, cal(R)_eta \)$. The function $F \( z \) = \( f \( z \) - p \) e^(z^2)$ has absolute value at most $C m$ on the imaginary axis: use (5.10), the Gaussian factor $e^(- u^2)$, and also $\| f \( i u \) - p \| lt.eq 2$. On the two outer lines $Re z = plus.minus b$ it is bounded by a universal constant by (5.15). Three-lines on each half-strip therefore bounds $\| F \|$ by $C m^(1 \/ 2)$ on $\| Re z \| lt.eq b \/ 2$. If $m = 0$, the identity theorem already gives $f equiv p$. Otherwise Cauchy’s estimates on a circle of radius $b \/ 2$ centered at zero, applied also to the bounded factor $e^(- z^2)$ on this circle, give
  $ \| f \( t \) - p - t f' \( 0 \) \| lt.eq C \( t \/ b \)^2 m^(1 \/ 2) \, #h(2em) 0 lt.eq t lt.eq b \/ 8 . $
  Write $f' \( 0 \) = i b_1$ with $b_1 in bb(R)$. If $p > 0$, then
  $ \| p + i t b_1 \| - p lt.eq t^2 b_1^2 \/ p lt.eq C t^2 cal(R)_eta^2 \; $
  if $p = 0$, (5.17) makes $b_1 = 0$. Adding the remainder changes $\| f \| - Re f$ by at most twice its absolute value. Thus
  $ \| f \( t \) \| - Re f \( t \) lt.eq C a^2 #scale(x: 120%, y: 120%)[\(] ell_h^2 m^(1 \/ 2) + cal(R)_eta^2 #scale(x: 120%, y: 120%)[\)] . $
  Since $d = dim x lt.eq d_h$, the quantity supplied by Lemma 14 satisfies, for $0 < eta lt.eq 1$, $cal(R)_eta lt.eq C sqrt(eta log \( e d_h \/ eta \))$; for $eta gt.eq 1$, the bound $eta lt.eq 2 log d lt.eq 2 ell_h$ gives $cal(R)_eta lt.eq C ell_h$. These two cases imply
  $ ell_h^2 m^(1 \/ 2) + cal(R)_eta^2 lt.eq C ell_h^4 eta^(1 \/ 8) \, $
  absorbing the logarithm of $1 \/ eta$ by the smaller power of $eta$. Taking the universal $c$ in the lemma small enough to ensure $t = a \/ 2 lt.eq b \/ 8$ proves (5.14). ◻
]

The movement and skew estimates hold without any Hamiltonian assumption. A local change of a partition has a nonnegative conditional information cost, and the departure of a conjugated local positive expectation from the nonnegative real axis is controlled by a fractional power of that same cost. The one-copy constants depend only on the moved or supporting dimension; the remaining systems may be arbitrarily large.

== 6 Symmetric replicas and entropy metrics <sec:replicas>

We now lift the one-copy estimates of Section 5 to positive operators on symmetric tensor powers. There are two outputs. A transfer of a subsystem gives an operator lower bound with its conditional mutual information in the exponent. A similarity transform of a local term has a scalar symbol whose departure from the nonnegative real axis is controlled by Lemma 15. The latter assertion requires a product calculus: it is not enough to compute the expectation of the similarity transform alone.

Throughout this section, $cal(V)$ is a fixed finite-dimensional complex Hilbert space with a specified tensor factorization, possibly including auxiliary factors. Write

$ d = dim cal(V) \, #h(2em) cal(S)_k = "Sym"^k cal(V) \, #h(2em) D_k = dim cal(S)_k = binom(k + d - 1, d - 1) \, $

and let $Pi_k$ be the orthogonal projector onto $cal(S)_k$. A subsystem $Q$ is a union of the specified factors; its complement is $Q^c$, and $d_Q$ denotes its Hilbert-space dimension. The empty subsystem has dimension one. An operator on $Q^(⊗ k)$ is extended by the identity on the other factors. The permutation of the $k$ copies of $Q$ associated with $pi in S_k$ is denoted by $U_Q \( pi \)$; $U \( pi \) = U_(cal(V)) \( pi \)$ permutes entire copies.

Every limit below is taken with $cal(V)$, its factorization, and all real exponents fixed. When these results are applied at a scale $n$, the entire finite system, auxiliary dimensions, and finite collection of partitions are fixed before $k arrow.r oo$. Constants and degrees in $"poly" \( k \)$ may depend on these fixed data. Errors $o_k \( 1 \)$ are uniform over all density matrices supported on $cal(S)_k$. In particular, they remain uniform for density matrices depending on an interpolation parameter. A cutoff and a polynomial approximation are fixed before taking $k arrow.r oo$; their errors are removed only afterwards.

=== 6.1 Schur labels and their quantitative bounds <schur-labels-and-their-quantitative-bounds>

Young-diagram labels encode the spectrum of an independent tensor-power state in the spectrum-estimation theorem of Keyl and Werner #cite(label("KeylWerner2001")). Here we need label estimates for arbitrary permutation-invariant densities as well as tensor powers. We derive the specific inequalities from Schur–Weyl duality below.

A partition $lambda tack.r k$ is a decreasing sequence of nonnegative integers summing to $k$. Trailing zeroes may be appended. Let $\[ lambda \]$ be the corresponding irreducible representation of $S_k$, and write $d_lambda = dim \[ lambda \]$. Schur–Weyl duality and the Weyl character formula give

#[#set math.equation(numbering: n => "(6.1)")
 $ \( bb(C)^q \)^(⊗ k) = xor.big_(lambda tack.r k\
ell \( lambda \) lt.eq q) \[ lambda \] ⊗ V_lambda^(\( q \)) \, #h(2em) chi_lambda^(\( q \)) \( x \) = frac(det \[ x_i^(lambda_j + q - j) \], det \[ x_i^(q - j) \]) . $ <replicas:schur-decomposition>]

Here the two factors are the irreducible modules for the permutation and diagonal general-linear actions, respectively, and the two actions have mutual centralizer algebras. These statements are #cite(label("EtingofEtAl2011")) Theorem 5.18.4, Corollary 5.19.2, and Theorem 5.22.1. They apply over $bb(C)$ in every dimension used here. The polynomial modules remain irreducible under the unitary group: invariance under its differentiated action implies invariance under its complex span, which is the full matrix Lie algebra.

Let $pi_(Q \, k)^lambda$ denote the Schur-label projector on $Q^(⊗ k)$. Define the self-adjoint label observable

#[#set math.equation(numbering: n => "(6.2)")
 $ F_(Q \, k) = sum_(lambda tack.r k) \( log d_lambda \) pi_(Q \, k)^lambda . $ <replicas:F-definition>]

We omit the subscript $k$ when the number of copies is unambiguous. For zero copies, the only label is the empty partition and $F_(Q \, 0) = 0$. We say labels are compatible if their joint spectral projector is nonzero.

The next lemma treats three operations on labels. Merging subsystems and splitting the copies into groups will be used in the norm comparisons of Section 8. Removing the last copy will control the ratio between successive metrics below. The dimension and surprisal estimates supply entropy bounds for these operations.

#thm([Lemma 6.1.])[
  (Schur-label estimates).  #emph[For the finite-dimensional tensor systems just defined, the following statements hold.]
  + #emph[For $lambda tack.r k$ of length at most $q$, put $l_i = lambda_i + q - i$ for $1 lt.eq i lt.eq q$. Then 
#[#set math.equation(numbering: n => "(6.3)")
 $ dim V_lambda^(\( q \)) = product_(i < j) frac(l_i - l_j, j - i) \, #h(2em) d_lambda = frac(k ! product_(i < j) \( l_i - l_j \), product_i l_i !) \, #h(2em) log d_lambda = k H \( lambda \/ k \) + O_q \( log \( k + 2 \) \) . $ <replicas:dimensions>]

 The number of labels and the sum of their general-linear multiplicities are polynomially bounded in $k$, with $q$ fixed.]
  + #emph[Central label functions commute for nested or disjoint subsystems. On $cal(S)_k$, complementary label projectors agree: $pi_(Q \, k)^lambda = pi_(Q^c \, k)^lambda$.]
  + #emph[If $Q \, E$ are disjoint and their labels $lambda \, mu$ are compatible with label $nu$ on $Q E$, then 
#[#set math.equation(numbering: n => "(6.4)")
 $ d_nu lt.eq d_lambda d_mu \, #h(2em) d_lambda lt.eq d_nu d_mu . $ <replicas:merge-dimensions>]

 For a tensor product of permutation-invariant density matrices on $Q^(⊗ k)$ and $E^(⊗ k)$, the conditional probability of $nu$ given $lambda \, mu$ is at most $"poly" \( k \) d_nu \/ \( d_lambda d_mu \)$. Consequently, for $0 lt.eq b lt.eq 1$, 
#[#set math.equation(numbering: n => "(6.5)")
 $ bb(E) (frac(d_lambda d_mu, d_nu))^b lt.eq "poly" \( k \) \, $ <replicas:merge-moment>]

 uniformly in those density matrices.]
  + #emph[Split the copies into specified groups of sizes $k - r$ and $r$. If their labels $alpha \, beta$ on a fixed subsystem are compatible with the full label $lambda$, then 
#[#set math.equation(numbering: n => "(6.6)")
 $ d_alpha d_beta lt.eq d_lambda lt.eq binom(k, r) d_alpha d_beta . $ <replicas:group-dimensions>]

 These subgroup label projectors commute with the full label projector.]
  + #emph[If $rho$ is any permutation-invariant density matrix on $Q^(⊗ k)$ and $L_rho = - log rho$ on its support, then $F_Q$ commutes with $rho$, $0 lt.eq F_Q lt.eq L_rho$ on that support, and 
#[#set math.equation(numbering: n => "(6.7)")
 $ "Tr" rho exp #scale(x: 120%, y: 120%)[\(] b \( L_rho - F_Q \) #scale(x: 120%, y: 120%)[\)] lt.eq "poly" \( k \) #h(2em) \( 0 lt.eq b lt.eq 1 \) . $ <replicas:surprisal-moment>]

]
  + #emph[The full $Q$ label $lambda$ and the first-$\( k - 1 \)$ label $nu$ are compatible precisely along the possible removable-row branches $nu = lambda - e_i$. In any permutation-invariant $Q$ state, conditional on $lambda$, the probability of this branch is 
#[#set math.equation(numbering: n => "(6.8)")
 $ p_(lambda \, i) = d_(lambda - e_i) / d_lambda = l_i / k frac(product_(a < b) \( l_a - delta_(a i) - l_b + delta_(b i) \), product_(a < b) \( l_a - l_b \)) lt.eq 2^q l_i / k . $ <replicas:branch-probability>]

 The normalized Jucys–Murphy, or star, operator #cite(label("VershikOkounkov2005")) Section 2 
#[#set math.equation(numbering: n => "(6.9)")
 $ J_(Q \, k) = 1 / k sum_(j < k) U_Q \( \( j med k \) \) $ <replicas:star-definition>]

 has eigenvalue $\( lambda_i - i \) \/ k$ on that branch.]
  #emph[The polynomial bounds may depend on the fixed subsystem dimensions, but not on the density matrices.]
] <lem:schur>

#proof[
  The first formula in (6.3) is the value of the Weyl character at the identity. To derive the second, multiply the character decomposition of $\( x_1 + dots.h.c + x_q \)^k$ by $det \[ x_i^(q - j) \]$ and extract the coefficient of $x_1^(l_1) dots.h.c x_q^(l_q)$. The strict decrease of the $l_i$ selects only label $lambda$ and the identity term in its numerator alternant. On the other side the coefficient is
  $ k ! det [frac(1, \( l_i - q + j \) !)]_(i \, j = 1)^q = frac(k !, product_i l_i !) det #scale(x: 120%, y: 120%)[\[] \( l_i \)_(q - j) #scale(x: 120%, y: 120%)[\]]_(i \, j = 1)^q = frac(k ! product_(i < j) \( l_i - l_j \), product_i l_i !) . $
  Here a reciprocal negative factorial is zero and $\( u \)_m$ is the falling factorial. The last determinant is a Vandermonde because its columns are monic polynomials of the indicated degrees. The estimate $log n ! = n log n - n + O \( log \( n + 2 \) \)$ gives the entropy formula, including zero parts, with $0 log 0 = 0$. The fixed shifts from $lambda_i$ to $l_i$ and the Vandermonde contribute only $O_q \( log \( k + 2 \) \)$. There are at most $\( k + 1 \)^q$ labels, and the dimension formula bounds each $dim V_lambda^(\( q \))$ by $\( k + q \)^(q \( q - 1 \) \/ 2)$.
  Each label projector is a central character idempotent in the permutation algebra:
  $ pi_(Q \, k)^lambda = frac(d_lambda, k !) sum_(pi in S_k) chi_lambda \( pi^(- 1) \) U_Q \( pi \) . $
  This follows from character orthogonality, or directly from Schur’s lemma applied to the central sum and its trace on each irreducible. Conjugation by $U_(Q E) \( pi \)$ sends a central function of the $Q$ permutations to itself. This proves nested commutation; disjoint commutation is immediate. On $cal(S)_k$, $U_Q \( pi \) z = U_(Q^c) \( pi^(- 1) \) z$. A permutation is conjugate to its inverse, so $chi_lambda \( pi \) = chi_lambda \( pi^(- 1) \)$ and the two central-projector sums agree there. This also shows that all Specht modules are self-dual: their dual characters are the same.
  For disjoint subsystems, $\[ nu \]$ is a constituent of $\[ lambda \] ⊗ \[ mu \]$ under diagonal permutations. This proves the first inequality of (6.4). The identity
  $ "Hom"_(S_k) \( \[ nu \] \, \[ lambda \] ⊗ \[ mu \] \) tilde.eq "Hom"_(S_k) \( \[ lambda \] \, \[ nu \] ⊗ \[ mu \]^(*) \) $
  and self-duality prove the second. Conditional on $lambda \, mu$, a product of invariant states is the identity divided by $d_lambda d_mu$ on the two Specht factors. If $g_(lambda mu nu)$ is the multiplicity of $\[ nu \]$ in their tensor product, its conditional label probability is exactly $g_(lambda mu nu) d_nu \/ \( d_lambda d_mu \)$. The ambient decomposition of $\( Q ⊗ E \)^(⊗ k)$ implies
  $ g_(lambda mu nu) thin dim V_lambda^(\( d_Q \)) dim V_mu^(\( d_E \)) lt.eq dim V_nu^(\( d_Q d_E \)) \, $
  so $g_(lambda mu nu)$ is polynomially bounded. With $R = d_lambda d_mu \/ d_nu gt.eq 1$, the conditional expectation in (6.5) is $sum_nu g_(lambda mu nu) R^(b - 1) lt.eq sum_nu g_(lambda mu nu)$, again polynomial.
  For the copy-group assertion, choose a copy of $\[ alpha \] ⊗ \[ beta \]$ inside the restriction of $\[ lambda \]$ to $S_(k - r) times S_r$. Its dimension gives the lower bound. The translates of this subspace span $\[ lambda \]$, by irreducibility. Choosing one representative of each subgroup coset bounds the span dimension by $binom(k, r) d_alpha d_beta$. Central elements of $S_k$ commute with its subgroup algebra, proving the commutation claim.
  An invariant density has blocks $rho = xor.big_lambda I_(\[ lambda \]) ⊗ M_lambda$. Every positive eigenvalue $u$ of $M_lambda$ is repeated $d_lambda$ times, so $u d_lambda lt.eq 1$. This gives $F_Q lt.eq L_rho$ and
  $ "Tr" rho e^(b \( L_rho - F_Q \)) = sum_lambda sum_(u > 0) \( u d_lambda \)^(1 - b) lt.eq sum_lambda dim V_lambda^(\( d_Q \)) #h(2em) \( 0 lt.eq b lt.eq 1 \) \, $
  where the inner sum counts eigenvalues with multiplicity in $M_lambda$.
  It remains to identify the marked-copy branches. Multiplying a Weyl numerator alternant by $sum_i x_i$ gives the sum of alternants with one exponent increased by one. Terms with equal exponents vanish; the remaining terms correspond exactly to adding a legal box to a partition. Thus $V_nu^(\( q \)) ⊗ bb(C)^q = xor.big_(lambda = nu + e_i) V_lambda^(\( q \))$, with multiplicity one. Comparing the two Schur–Weyl decompositions of the first $k - 1$ copies and the last copy shows that the $nu$ branch in the $lambda$ block has rank $d_nu$ on $\[ lambda \]$, and acts identically on $V_lambda^(\( q \))$. The invariant state is uniform on $\[ lambda \]$, giving the probability in (6.8). The dimension formula gives the displayed quotient. In its Vandermonde ratio, a factor involving an earlier row is at most two, and a factor involving a later row is at most one. Positivity holds on a legal removable branch.
  For the star eigenvalue, let $E_(a b)^(upright("tot"))$ be the sum over copies of the matrix unit $E_(a b)$ on $bb(C)^q$. Direct multiplication gives
  $ sum_(a \, b) E_(a b)^(upright("tot")) E_(b a)^(upright("tot")) = k q I + 2 sum_(j < j') U_Q \( \( j med j' \) \) . $
  The right side is scalar on a Schur block. The lexicographically leading weight in its Weyl character is $lambda$; a vector of that weight is annihilated by $E_(a b)^(upright("tot"))$ for $a < b$, since those operators would increase the weight. On this vector the diagonal terms contribute $sum_i lambda_i^2$, and the two terms for $a < b$ contribute $lambda_a - lambda_b$, using $\[ E_(a b)^(upright("tot")) \, E_(b a)^(upright("tot")) \] = E_(a a)^(upright("tot")) - E_(b b)^(upright("tot"))$. The scalar is therefore $sum_i lambda_i \( lambda_i + q + 1 - 2 i \)$. Subtract the formula for $k - 1$ copies with label $lambda - e_i$. The difference of the transposition sums is $k J_(Q \, k)$, and its value is $lambda_i - i$. ◻
]

=== 6.2 A common metric on every subsystem <a-common-metric-on-every-subsystem>

Fix $0 < t < 1 \/ 4$ and set $a = 2 t$. Complementary labels will need to give exactly the same metric, even when the two subsystem dimensions differ. We therefore use the full dimension $d$ in the following formula for every subsystem. Besides having eigenvalues of size $e^(- t F_Q)$ up to polynomial factors, the metric must admit a positive mixture of tensor powers, so that the conditional movement estimate can be applied inside its integral. The ratio between its $k$-copy and $\( k - 1 \)$-copy weights must also approximate marginal powers for the local-operator calculation. The following common label function has all these properties. Pad each label to length $d$ and put

#[#set math.equation(numbering: n => "(6.10)")
 $ c & = d + \( 1 + t \) binom(d, 2) \,\
w_k \( lambda \) & = frac(Gamma \( c \), Gamma \( c + t k \)) product_(i = 1)^d frac(Gamma \( 1 + t \( lambda_i + d - i \) \), Gamma \( 1 + t \( d - i \) \)) \,\
W_(Q \, k) & = sum_lambda w_k \( lambda \) pi_(Q \, k)^lambda . $ <replicas:w-definition>]

In particular $W_(Q \, 0) = I$. For a one-dimensional subsystem at positive $k$, $W_(Q \, k)$ is the positive scalar $w_k \( \( k \) \)$; it need not equal one. This convention keeps the label function identical on all subsystems.

#thm([Lemma 6.2.])[
  (Integral formula and marked ratios).  #emph[The operators in (6.10) are positive definite and central. Uniformly in their labels, 
#[#set math.equation(numbering: n => "(6.11)")
 $ "poly" \( k \)^(- 1) e^(- t F_(Q \, k)) lt.eq W_(Q \, k) lt.eq "poly" \( k \) e^(- t F_(Q \, k)) . $ <replicas:W-comparison>]

 On $cal(S)_k$, $W_(Q \, k) = W_(Q^c \, k)$ exactly. For each subsystem there is a probability measure on positive definite subdensities $sigma$ on $Q$, with $"Tr" sigma lt.eq 1$, such that 
#[#set math.equation(numbering: n => "(6.12)")
 $ W_(Q \, k) = integral \( sigma^t \)^(⊗ k) thin d zeta_Q \( sigma \) #h(2em) \( k gt.eq 0 \) . $ <replicas:W-integral>]

 The measure is independent of $k$.]
  #emph[Extend $W_(Q \, k - 1)$ by the identity on the last copy and define $R_(Q \, k) = W_(Q \, k) W_(Q \, k - 1)^(- 1)$. Then 
#[#set math.equation(numbering: n => "(6.13)")
 $ lr(bar.v.double R_(Q \, k) - \( J_(Q \, k) \)_(+)^t bar.v.double) arrow.r 0 $ <replicas:R-forward>]

 on the entire tensor space. There is a constant $C_(cal(V) \, t)$ such that, for every unit $z in cal(S)_k$, $lr(bar.v.double R_(Q \, k)^(- 1) z bar.v.double) lt.eq C_(cal(V) \, t)$, and 
#[#set math.equation(numbering: n => "(6.14)")
 $ limsup_(k arrow.r oo) sup_(z in cal(S)_k\
lr(bar.v.double  bar.v.double) z = 1) lr(bar.v.double #scale(x: 120%, y: 120%)[\(] R_(Q \, k)^(- 1) - max \( J_(Q \, k) \, delta \)^(- t) #scale(x: 120%, y: 120%)[\)] z bar.v.double) lt.eq C_(cal(V) \, t) delta^(\( 1 - 2 t \) \/ 2) #h(2em) \( 0 < delta < 1 \) . $ <replicas:R-inverse>]

]
] <replicas:metric>

#proof[
  Begin in dimension $d$. Write $Delta \( s \) = product_(i < j) \( s_i - s_j \)$ and choose $s$ on the simplex $s_i gt.eq 0$, $sum_i s_i = 1$, with density proportional to $Delta \( s \) Delta \( s^t \)$. This is a nonnegative, integrable density, positive off the collision hyperplanes in the simplex interior. It is the simplex normalization of the Laguerre Muttalib–Borodin weight; the gamma integral below is the corresponding form of #cite(label("ForresterIpsen2018")) Section 2.3, equation (26). We include the calculation before verifying the common-subsystem and ratio properties. For $d = 1$ use the point mass at $s_1 = 1$. Choose an independent Haar-distributed unitary eigenbasis and let $sigma$ have eigenvalues $s$. The integral of $\( sigma^t \)^(⊗ k)$ commutes both with permutations and with the diagonal unitary group; hence it is central in the Schur decomposition. Its eigenvalue on $lambda$ is the mean of $chi_lambda^(\( d \)) \( s^t \) \/ dim V_lambda^(\( d \))$.
  Put $l_i = lambda_i + d - i$. The Weyl denominator cancels $Delta \( s^t \)$ in the density. Expanding the two remaining determinants and using the simplex integral
  $ integral_(s_i gt.eq 0\
sum s_i = 1) product_i s_i^(u_i) thin d s = frac(product_i Gamma \( 1 + u_i \), Gamma \( d + sum_i u_i \)) #h(2em) \( u_i > - 1 \) $
  gives, before dividing by the Weyl dimension and the density’s normalization,
  $ frac(d !, Gamma \( c + t k \)) det #scale(x: 120%, y: 120%)[\[] Gamma \( 1 + t l_i + d - j \) #scale(x: 120%, y: 120%)[\]]_(i \, j = 1)^d . $
  The simplex identity follows, for example, by changing variables $x_i = r s_i$ in the product of the defining gamma integrals; the Jacobian contributes $r^(d - 1)$. Factor $Gamma \( 1 + t l_i \)$ from each row. The remaining entries are rising-factorial monic polynomials in $t l_i$ of degrees $d - j$, so their determinant is $t^(d \( d - 1 \) \/ 2) Delta \( l \)$. The Weyl dimension cancels $Delta \( l \)$. Normalizing at $k = 0$ gives exactly (6.10).
  For $d_Q lt.eq d$, choose an isometry $E : cal(H)_Q arrow.r bb(C)^d$. Compression of a permutation on $\( bb(C)^d \)^(⊗ k)$ by $E^(⊗ k)$ is the same permutation on $Q^(⊗ k)$. Compressing its central label function therefore gives the identical function $w_k \( lambda \)$ on all labels that occur in dimension $d_Q$. On each sample, write $B = E^dagger sigma^t E$ and $tau = B^(1 \/ t)$. The min–max principle bounds the decreasing eigenvalues of $B$ by the corresponding eigenvalues of $sigma^t$. Consequently $"Tr" tau lt.eq "Tr" sigma = 1$, while $B > 0$ almost surely. Thus the compressed integral has the form (6.12), with the distribution of $tau$ as $zeta_Q$. This proves the asserted representation without changing the common label function. Exact complement equality follows from Lemma 16.
  The gamma estimate $log Gamma \( 1 + u \) = u log u - u + O \( log \( u + 2 \) \)$, with $0 log 0 = 0$, applied to the fixed number of factors in (6.10), gives $log w_k \( lambda \) = - t k H \( lambda \/ k \) + O_(d \, t) \( log \( k + 2 \) \)$. The terms containing $log t$ cancel. Formula (6.3) proves (6.11).
  For the marked ratio, now put $l_i = lambda_i + d - i$ using the full dimension. On a removable branch its exact eigenvalue is
  #[#set math.equation(numbering: n => "(6.15)")
   $ r_(lambda \, i) = frac(Gamma \( c + t \( k - 1 \) \), Gamma \( c + t k \)) frac(Gamma \( 1 + t l_i \), Gamma \( 1 + t \( l_i - 1 \) \)) . $ <replicas:ratio-eigenvalue>]
  Gamma ratios give $r_(lambda \, i) asymp_(d \, t) \( \( l_i + 1 \) \/ k \)^t$. When $l_i \/ k$ is bounded away from zero, the same ratios give uniform convergence to $\( l_i \/ k \)^t$. When $l_i \/ k$ is small, both $r_(lambda \, i)$ and $max \( \( l_i - d \) \/ k \, 0 \)^t$ are uniformly small. First separate at $l_i \/ k = epsilon$, then let $k arrow.r oo$ and $epsilon arrow.b 0$. The star eigenvalue formula proves (6.13) and a uniform bound for $lr(bar.v.double R_(Q \, k) bar.v.double)$.
  The $Q$ marginal of a symmetric vector is permutation invariant. Its conditional branch probabilities are bounded by $C_d l_i \/ k$: Lemma 16 first uses $lambda_i + d_Q - i$, which is no larger than $l_i$. Hence, conditional on any $lambda$,
  $ sum_i p_(lambda \, i) r_(lambda \, i)^(- 2) lt.eq C_(d \, t) sum_i \( l_i \/ k \)^(1 - 2 t) lt.eq C_(d \, t) . $
  This proves the inverse vector bound. On the spectral part $J_(Q \, k) gt.eq delta$, the inverse approximation follows in operator norm from (6.13). On the remaining part, $l_i \/ k lt.eq delta + d \/ k$. The true inverse’s squared norm there is at most $C_(d \, t) \( delta + d \/ k \)^(1 - 2 t)$; the clipped inverse’s squared norm is at most $C_d \( delta + d \/ k \) delta^(- 2 t)$. Taking the limit superior and the square root proves (6.14). All bounds were conditional on an arbitrary label, so they are uniform in the original symmetric vector. ◻
]

The common label function also gives an exact restriction identity. If $B \, Q$ are disjoint and $B$ is held in a fixed pure vector $phi.alt^(⊗ k)$, then

#[#set math.equation(numbering: n => "(6.16)")
 $ W_(B Q \, k) \( phi.alt^(⊗ k) ⊗ z \) = phi.alt^(⊗ k) ⊗ W_(Q \, k) z . $ <replicas:fixed-factor>]

Indeed every simultaneous permutation on $B Q$ fixes the repeated $B$ vector and acts as the corresponding permutation on $Q$. Apply the same central permutation coefficients on both sides. The corresponding identity holds for $F$ and for every real power of $W$. In particular it applies when the fixed vector on $B$ is a Bell vector between two factors: its entanglement inside $B$ is irrelevant to simultaneous permutations of the entire $B$ factor.

For a partition $P \, Y \, F$ of the full one-copy system, the moves considered below transfer a subsystem $x subset.eq Y$ to either $P$ or $F$. We call $P \, F$ the outer parts and $Y$ the middle part; these names impose no geometric condition. Define the partition’s metric on $cal(S)_k$ by

#[#set math.equation(numbering: n => "(6.17)")
 $ A_k \( P \, Y \, F \) = #scale(x: 120%, y: 120%)[\(] W_(P \, k)^(- 1) W_(F \, k)^(- 1) W_(Y \, k) #scale(x: 120%, y: 120%)[\)]^2 . $ <replicas:leaf-metric>]

The three factors commute. The preceding lemmas imply

#[#set math.equation(numbering: n => "(6.18)")
 $ log A_k = a \( F_P + F_F - F_Y \) + O_(cal(V) \, t) \( log \( k + 2 \) \) \, #h(2em) A_k gt.eq "poly" \( k \)^(- 1) I . $ <replicas:leaf-floor>]

The error here is an operator-norm bound. Indeed $F_Y = F_(P F)$ on symmetry and $F_(P F) lt.eq F_P + F_F$ on every compatible label. If a one-copy operator $h$ is contained in one part, its copy average $macron(h) = k^(- 1) sum_j h^(\( j \))$ commutes with this metric: it commutes with permutations on that part and is disjoint from the other parts.

=== 6.3 An operator lower bound for moving a subsystem <an-operator-lower-bound-for-moving-a-subsystem>

The integral representation of $W$ lets us apply the one-copy movement estimate inside a replica metric. We first show that moving $x$ from the middle part to an outer part produces the corresponding entropy gain as a rank-one operator bound. For a unit one-copy vector $theta$, put $P_(theta \, k) = \| theta^(⊗ k) chevron.r chevron.l theta^(⊗ k) \|$. All constants outside polynomial factors in $k$ will depend only on the one-copy estimate and the dimension of $x$.

#thm([Lemma 6.3.])[
  (Relative coherent pin).  #emph[Let $P \, x \, Y_0 \, F$ partition the fixed finite system $cal(V)$, put $Y = x Y_0$, and let 
$ A_k = A_k \( P \, x Y_0 \, F \) \, #h(2em) B_k = A_k \( P x \, Y_0 \, F \) \, #h(2em) C_(x \, k) = A_k^(- 1 \/ 2) B_k A_k^(- 1 \/ 2) . $

 Suppose $0 < t < 1 \/ 4$, $a = 2 t$, and $a log \( e dim x \) lt.eq c$, with $c$ as in Lemma 13. For every unit $theta in cal(V)$, define 
$ eta_theta = S_theta \( x \| P \) + S_theta \( x \| Y_0 \) = I_theta \( x : F \| P \) = I_theta \( x : F \| Y_0 \) gt.eq 0 . $

 There is a polynomial bound uniform in $theta$ such that, on $cal(S)_k$, 
#[#set math.equation(numbering: n => "(6.19)")
 $ C_(x \, k) gt.eq "poly" \( k \)^(- 1) exp {k a [eta_theta - C a^(1 \/ 4) log^C \( e dim x \)]} P_(theta \, k) . $ <replicas:relative-pin>]

 The same statement holds for a move to $F$ after exchanging the outer parts. A choice making no move has $C_(x \, k) = I$ and may be assigned gain zero.]
] <lem:relative-pin>

#proof[
  For a positive definite $C$ and unit vector $z$, Cauchy–Schwarz gives
  $ \| chevron.l z \, u chevron.r \|^2 lt.eq chevron.l z \, C^(- 1) z chevron.r chevron.l u \, C u chevron.r \, #h(2em) C gt.eq chevron.l z \, C^(- 1) z chevron.r^(- 1) \| z chevron.r chevron.l z \| . $
  It therefore suffices to bound the inverse quadratic form of $C_(x \, k)$ at $theta^(⊗ k)$. Since $C_(x \, k)^(- 1) = A_k^(1 \/ 2) B_k^(- 1) A_k^(1 \/ 2)$,
  #[#set math.equation(numbering: n => "(6.20)")
   $ chevron.l theta^(⊗ k) \, C_(x \, k)^(- 1) theta^(⊗ k) chevron.r & = lr(bar.v.double B_k^(- 1 \/ 2) A_k^(1 \/ 2) theta^(⊗ k) bar.v.double)^2\
 & = lr(bar.v.double W_(P x \, k) W_(x Y_0 \, k) W_(P \, k)^(- 1) W_(Y_0 \, k)^(- 1) theta^(⊗ k) bar.v.double)^2 . $ <replicas:move-inverse>]
  To obtain the second line, cancel the disjoint $F$ factors and commute the remaining nested or disjoint central factors. This is an identity of the displayed norms; no commutation of $A_k$ with $B_k$ is asserted.
  Let $rho_R$ be the marginal of $theta$ for $R = P \, Y_0$, and set
  $ T_R = W_(R \, k)^(- 1) \( rho_R^t \)^(⊗ k) \, $
  with the positive power zero on the kernel. The invariant density $rho_R^(⊗ k)$ has every eigenvalue in its $lambda$ block at most $d_lambda^(- 1)$ by eigenvalue repetition, as in the proof of (6.7). Thus (6.11) implies
  #[#set math.equation(numbering: n => "(6.21)")
   $ lr(bar.v.double T_R bar.v.double) lt.eq "poly" \( k \) \, $ <replicas:compensator>]
  uniformly in $theta$, including marginals of deficient rank. Furthermore $T_P$ commutes with both numerator factors in (6.20), and so does $T_(Y_0)$. For the overlapping numerator this follows because $W_(R \, k)$ is central on the nested subsystem and $\( rho_R^t \)^(⊗ k)$ commutes with every simultaneous permutation on $x R$; the other numerator is disjoint from $R$.
  Extend $rho_R$ by eigenvalue one on its kernel and denote this extension by $tilde(rho)_R$. The product of the two marginal support projectors fixes $theta$, since $P$ and $Y_0$ are disjoint. We can therefore insert $T_P \, T_(Y_0)$ and move them to the left in (6.20), obtaining the upper bound
  $ "poly" \( k \) thin lr(bar.v.double W_(P x \, k) W_(x Y_0 \, k) \( tilde(rho)_P^(- t) tilde(rho)_(Y_0)^(- t) \)^(⊗ k) theta^(⊗ k) bar.v.double)^2 . $
  Here and below the polynomial can be enlarged to absorb its square. Expand the two numerator integrals (6.12) in their stated order. The triangle inequality and the tensor-power norm identity bound this by
  #[#set math.equation(numbering: n => "(6.22)")
   $ "poly" \( k \) sup_(sigma \, tau) lr(bar.v.double sigma_(P x)^t tau_(x Y_0)^t tilde(rho)_P^(- t) tilde(rho)_(Y_0)^(- t) theta bar.v.double)^(2 k) \, $ <replicas:move-one-copy>]
  where $sigma \, tau$ are positive definite subdensities on the indicated subsystems. Normalizing a subdensity multiplies its $t$-power by a scalar at least one, so it suffices to take density matrices. Since $P$ is disjoint from $x Y_0$, its inverse power commutes with $tau_(x Y_0)^t$. The one-copy word is therefore
  $ sigma_(P x)^(a \/ 2) tilde(rho)_P^(- a \/ 2) tau_(x Y_0)^(a \/ 2) tilde(rho)_(Y_0)^(- a \/ 2) theta \, $
  exactly the word in Lemma 13. That lemma bounds its log norm by $- a eta_theta \/ 2 + C a^(5 \/ 4) log^C \( e dim x \)$. Substituting in (6.22), and then using the inverse Cauchy–Schwarz inequality at the start of the proof, gives (6.19). Every polynomial bound used in this argument was uniform in $theta$. ◻
]

=== 6.4 Scalar symbols, products, and absolute values <scalar-symbols-products-and-absolute-values>

The relative lower bound is now available. To control energy, we also need scalar descriptions of products and absolute values of local terms after a metric similarity transform. This requires a further argument beyond their individual expectations on product vectors.

Let $d theta$ be invariant probability measure on the unit sphere of $cal(V)$. Unitary invariance and irreducibility of $cal(S)_k$ give

#[#set math.equation(numbering: n => "(6.23)")
 $ integral P_(theta \, k) thin d theta = D_k^(- 1) Pi_k . $ <replicas:resolution>]

The trace fixes the scalar. For a density matrix $sigma$ supported on $cal(S)_k$, define its coherent probability measure by

#[#set math.equation(numbering: n => "(6.24)")
 $ d mu_sigma \( theta \) = D_k "Tr" \( sigma P_(theta \, k) \) thin d theta . $ <replicas:husimi>]

This is the coherent measure used in finite quantum de Finetti theorems #cite(label("ChristandlEtAl2007")) #cite(label("LewinNamRougerie2015")). We reproduce its fixed-copy approximation in the proof below, then establish the additional product calculus needed for the nonlinear functions of our metric. Here $theta$ is a pure one-copy state, whereas $sigma$ may be any symmetric replica density. The same $sigma$ defines both the operator expectation and the measure mixing the one-copy symbols below.

#thm([Lemma 6.4.])[
  (Marked-copy scalar symbols).  #emph[Fix a partition $P \, Y \, F$ of $cal(V)$, $0 < t < 1 \/ 4$, and a one-copy operator $h$ supported on $P Y$. Let $A_k$ be (6.17), and define on $cal(S)_k$ 
$ O_k = A_k^(- 1 \/ 2) macron(h) A_k^(1 \/ 2) \, #h(2em) f_theta = chevron.l theta \, rho_P^t rho_Y^(- t) h rho_P^(- t) rho_Y^t theta chevron.r \, $

 where $rho_Q$ is the $Q$ marginal of $theta$. All powers in $f_theta$ are zero on kernels. Then $sup_k lr(bar.v.double O_k bar.v.double) < oo$, with a bound allowed to depend on the fixed entire system and $h$. For every fixed noncommutative polynomial $q$ in two variables, 
#[#set math.equation(numbering: n => "(6.25)")
 $ sup_sigma lr(|"Tr" sigma q \( O_k \, O_k^dagger \) - integral q \( f_theta \, overline(f_theta) \) thin d mu_sigma \( theta \)|) arrow.r 0 \, $ <replicas:polynomial-symbol>]

 where the supremum is over all density matrices on $cal(S)_k$. Moreover, for $cal(D)_k = \| O_k \| + \| O_k^dagger \| - O_k - O_k^dagger$, 
#[#set math.equation(numbering: n => "(6.26)")
 $ "Tr" sigma cal(D)_k = 2 integral #scale(x: 120%, y: 120%)[\(] \| f_theta \| - "Re" f_theta #scale(x: 120%, y: 120%)[\)] thin d mu_sigma \( theta \) + o_k \( 1 \) \, $ <replicas:skew-symbol>]

 uniformly in $sigma$.]
  #emph[If $0 lt.eq h lt.eq I$ has a designated supporting subsystem of dimension $d_h$, put $x = Y ∩ "supp" h$, $Y_0 = Y \\ x$, and 
$ eta_theta = S_theta \( x \| P \) + S_theta \( x \| Y_0 \) = I_theta \( x : F \| P \) = I_theta \( x : F \| Y_0 \) . $

 Here the designated support may replace the minimal support in the definition of $x$. If $a log \( e d_h \) lt.eq c$, then 
#[#set math.equation(numbering: n => "(6.27)")
 $ "Tr" sigma cal(D)_k lt.eq C a^2 log^C \( e d_h \) integral eta_theta^(1 \/ 8) thin d mu_sigma \( theta \) + o_k \( 1 \) . $ <replicas:skew-bound>]

 The assertion also holds with the two outer parts exchanged.]
] <lem:symbol>

#proof[
  We first replace the marked ratios by bounded polynomial words, then prove a product calculus for those words, and finally pass to absolute values. The inverse approximation must be applied on symmetric input vectors; no full-space bound for $R_(Q \, k)^(- 1)$ is needed.
  ===== 6.4.1 Bounded approximation on symmetric inputs. <bounded-approximation-on-symmetric-inputs.>
  Between symmetric vectors, $h^(\( k \))$ may replace $macron(h)$. The $F$ factors commute with this term and cancel. Since $W_(Q \, k - 1)$ commutes with $W_(Q \, k)$ and is disjoint from $h^(\( k \))$, the remaining form is the compression of
  #[#set math.equation(numbering: n => "(6.28)")
   $ R_(P \, k) R_(Y \, k)^(- 1) h^(\( k \)) R_(P \, k)^(- 1) R_(Y \, k) . $ <replicas:marked-word>]
  Write $h$ as a finite sum of products $c_P ⊗ e_Y$. Such a decomposition follows by expanding matrix units on the two parts of its support; its length and norm bounds are fixed here. For one product and a symmetric unit vector $z$, the quadratic form of (6.28) equals
  #[#set math.equation(numbering: n => "(6.29)")
   $ ⟨R_(Y \, k) e_Y^dagger R_(Y \, k)^(- 1) z \, R_(P \, k) c_P R_(P \, k)^(- 1) z⟩ . $ <replicas:inverse-innermost>]
  Both inverses act directly on $z$. The uniform forward operator bound and inverse vector bound from Lemma 17 bound these two vectors uniformly and therefore bound the numerical radius of $O_k$. The elementary inequality $lr(bar.v.double  bar.v.double) T lt.eq 2 sup_(lr(bar.v.double  bar.v.double) z = 1) \| chevron.l z \, T z chevron.r \|$, obtained by polarizing the quadratic form, proves uniform boundedness of $O_k$.
  In (6.29), replace each inverse by $max \( J_(Q \, k) \, delta \)^(- t)$ using (6.14); then replace each forward ratio by $\( J_(Q \, k) \)_(+)^t$ using (6.13). The first replacement has limiting error at most $C_(cal(V) \, t \, h) delta^(\( 1 - 2 t \) \/ 2)$, uniformly on symmetric unit vectors. At fixed $delta$ the second has error tending to zero. Approximate the continuous functions $u mapsto u_(+)^t$ and $u mapsto max \( u \, delta \)^(- t)$ uniformly on $\[ - 1 \, 1 \]$ by polynomials. All star spectra lie in this interval. Polarization, applied after summing the finitely many product components, gives compressed operators $B_k$, each a fixed polynomial word in marked operators and stars, such that
  #[#set math.equation(numbering: n => "(6.30)")
   $ limsup_k lr(bar.v.double O_k - B_k bar.v.double) lt.eq epsilon . $ <replicas:polynomial-approximation>]
  Here any $epsilon > 0$ is achieved by first choosing $delta$, then the polynomials, and then taking the limit in $k$. The approximants may be chosen with a common bound on $limsup_k lr(bar.v.double B_k bar.v.double)$; an approximation-dependent threshold for $k$ does not affect any of the limits below.
  ===== 6.4.2 The coherent measure on a fixed number of copies. <the-coherent-measure-on-a-fixed-number-of-copies.>
  We next establish the uniform coherent-measure calculation for a fixed number of copies. If $G$ acts on $cal(V)^(⊗ m)$, let $cal(T)_(k \, m) \( G \)$ be its average over all ordered injections of these $m$ copies into $k$ copies. It preserves $cal(S)_k$. For $k gt.eq m$, symmetry gives $"Tr" sigma cal(T)_(k \, m) \( G \) = "Tr" sigma^(\( m \)) G$. For the integral of its product-vector expectation, (6.23) gives the finite-copy identity #cite(label("Chiribella2011")) equation (5)
  #[#set math.equation(numbering: n => "(6.31)")
   $ integral chevron.l theta^(⊗ m) \, G theta^(⊗ m) chevron.r thin d mu_sigma \( theta \) = D_k / D_(k + m) "Tr" #scale(x: 120%, y: 120%)[\[] \( sigma ⊗ G \) Pi_(k + m) #scale(x: 120%, y: 120%)[\]] . $ <replicas:finite-husimi>]
  In the permutation expansion of $Pi_(k + m)$, the fraction mapping every one of the last $m$ indices into the first $k$ is $\( k \)_m \/ \( k + m \)_m = 1 - O_m \( k^(- 1) \)$. Any such permutation is equivalent, by a permutation of the first $k$ indices on each side, to $m$ disjoint swaps matching last indices with distinct first indices. Indeed reorder the old images of the last indices on the left and their old preimages on the right, then eliminate the remaining permutation among old indices. Both old permutations are absorbed because $U \( pi \) sigma = sigma U \( pi \) = sigma$. The matched swaps contribute exactly $"Tr" sigma^(\( m \)) G$ by partial trace. Every other term has absolute value at most $lr(bar.v.double sigma ⊗ G bar.v.double)_1 lt.eq d^m lr(bar.v.double  bar.v.double) G$. Also $D_k \/ D_(k + m) = 1 + O_(d \, m) \( k^(- 1) \)$. Consequently
  #[#set math.equation(numbering: n => "(6.32)")
   $ lr(|"Tr" sigma cal(T)_(k \, m) \( G \) - integral chevron.l theta^(⊗ m) \, G theta^(⊗ m) chevron.r thin d mu_sigma|) lt.eq frac(C_(d \, m) lr(bar.v.double  bar.v.double) G, k) \, $ <replicas:uniform-husimi>]
  uniformly in $sigma$.
  ===== 6.4.3 Products after compression. <products-after-compression.>
  The remaining issue is multiplication after compression. For any ambient operator $B$, define its full-copy permutation average
  $ cal(T)_k \( B \) = frac(1, k !) sum_(pi in S_k) U \( pi \) B U \( pi \)^dagger . $
  It commutes with all $U \( pi \)$, hence preserves symmetry, and
  $ Pi_k B Pi_k \|_(cal(S)_k) = cal(T)_k \( B \) \|_(cal(S)_k) . $
  Products of compressed words are therefore restrictions of products of their full permutation averages. The multiplication of these averages uses disjoint placements of fixed copy blocks, as in the mean-field symmetrization argument of #cite(label("RaggioWerner1989")) Lemma IV.1. For fixed operators $G \, H$ on $m \, n$ copies, respectively,
  #[#set math.equation(numbering: n => "(6.33)")
   $ ∥cal(T)_(k \, m) \( G \) cal(T)_(k \, n) \( H \) - cal(T)_(k \, m + n) \( G ⊗ H \)∥ lt.eq frac(C_(m \, n) parallel G parallel parallel H parallel, k) $ <replicas:injection-product>]
  for sufficiently large $k$. Indeed two independently chosen injections have intersecting images with probability $O_(m \, n) \( k^(- 1) \)$. Conditional on disjoint images, their union is a uniform ordered injection of $m + n$ copies. The intersecting terms and the change in normalization each cost at most that probability times $parallel G parallel parallel H parallel$.
  Expand a fixed star word as sums over its donor indices, with one marked center. Repeated donor indices have total coefficient weight $O \( k^(- 1) \)$, so their contribution has norm $O \( k^(- 1) \)$ for that fixed word. After averaging each word separately, both its center and its donors occupy a uniformly relocated block of indices. For a monomial containing $r$ stars, its distinct-donor terms give an injection average with coefficient $\( k - 1 \)_r \/ k^r = 1 + O_r \( k^(- 1) \)$. Thus each averaged word is, up to operator-norm error $O \( k^(- 1) \)$, a finite sum of injection averages of fixed operators. Iterating (6.33) puts a product of words on disjoint blocks, with a separate center for each word.
  On a product vector, a donor appearing in one partial swap contracts to $rho_Q$ on the center. In matrix units this is the identity
  $ "Tr"_(upright("donor")) [\( \| theta chevron.r chevron.l theta \| \)_(upright("donor")) sum_(a \, b) \( E_(a b) \)_(Q \, upright("donor")) ⊗ \( E_(b a) \)_(Q \, upright("center"))] = \( rho_Q \)_(upright("center")) . $
  Tracing distinct donors successively preserves the order of the operators on each center. The separate centers give multiplication of scalar expectations, since
  $ chevron.l theta^(⊗ \( m + n \)) \, \( G ⊗ H \) theta^(⊗ \( m + n \)) chevron.r = chevron.l theta^(⊗ m) \, G theta^(⊗ m) chevron.r chevron.l theta^(⊗ n) \, H theta^(⊗ n) chevron.r . $
  It follows that a polynomial approximant has the symbol obtained by replacing its stars by the corresponding marginal densities, its adjoint has the complex conjugate symbol, and products multiply these scalar symbols. Applying (6.32) proves these assertions uniformly in the symmetric density matrix, for each fixed polynomial word.
  ===== 6.4.4 Removing clipping and taking absolute values. <removing-clipping-and-taking-absolute-values.>
  We have proved the product assertion with fixed clipping. To remove clipping on the one-copy side, use
  $ sum_(0 < p_i < delta) p_i^(1 - 2 t) lt.eq d_Q delta^(1 - 2 t) $
  for the eigenvalues of any marginal density. This bounds the squared norm of its inverse-power tail on $theta$, uniformly in $theta$. The clipped one-copy vectors corresponding to (6.29) therefore converge uniformly to their support-power limits, and their inner product converges uniformly to the zero-kernel-power expression $f_theta$. In particular this symbol is bounded and continuous, as a uniform limit of the clipped continuous symbols. Telescoping fixed products in (6.30), using the common limiting norm bound, now proves (6.25).
  In particular, both $O_k^dagger O_k$ and $O_k O_k^dagger$ have symbol $\| f_theta \|^2$. Choose an interval $\[ 0 \, M^2 \]$ containing all their spectra and all values $\| f_theta \|^2$. Uniform polynomial approximation of the square root on that interval gives symbols $\| f_theta \|$ for $\| O_k \|$ and $\| O_k^dagger \|$, with arbitrarily small uniform expectation errors. This argument applies whether or not $O_k$ is normal. Combining with the linear terms proves (6.26). Finally apply Lemma 15 pointwise to $f_theta$ to obtain (6.27). Purity gives the two expressions for $eta_theta$; enlarging $x$ to the designated supporting subsystem is allowed by that lemma. The proof is unchanged after exchanging $P$ and $F$. ◻
]

The section has supplied two compatible one-copy quantities: the gain $eta_theta$ in (6.19), and the cost $eta_theta^(1 \/ 8)$ in (6.27). The operator lower bound can be tested against any symmetric density, and the symbol error is uniform over those densities, with the prescribed order of limits. They can therefore be applied to the same density matrices when metric changes are averaged.

== 7 Transport through finite trees of metrics <sec:transport>

The relative metric estimate of Lemma 18 measures the entropy gained by one change of partition. We now combine such changes through a finite tree of matrix means. The resulting derivative is an average of entropy gains against positive, trace-one states. The same states control the energy of the filtered vector. A second occurrence of the probability that a term is split is essential in this energy estimate. All trees, one-copy spaces, and partitions in this section are finite and are fixed before the number of copies tends to infinity. The matrix means carry perturbations from leaves to the root. The trace adjoints of their normalized derivatives carry a density matrix at the root back to each leaf; this reverse passage will identify the states used in both estimates.

=== 7.1 Positive matrix means and their derivatives <positive-matrix-means-and-their-derivatives>

For positive definite operators $A \, B$ on a finite-dimensional Hilbert space and $0 lt.eq p lt.eq 1$, define

#[#set math.equation(numbering: n => "(7.1)")
 $ A \#_p B = A^(1 \/ 2) \( A^(- 1 \/ 2) B A^(- 1 \/ 2) \)^p A^(1 \/ 2) . $ <transport:mean-def>]

A binary operation of this form is the weighted operator geometric mean in the Kubo–Ando framework #cite(label("KuboAndo1980")); the earlier geometric mean of positive forms is due to Pusz and Woronowicz #cite(label("PuszWoronowicz1975")). We prove below the finite-tree properties and normalized derivative identities needed for the entropy and energy estimates. A weighted binary tree is a finite rooted binary tree with a parameter $p in \[ 0 \, 1 \]$ assigned to each internal vertex; its two outgoing edges have weights $1 - p$ and $p$, respectively. Its terminal weights are the products of edge weights along root-to-leaf paths; they sum to one. Assign positive definite operators to the leaves and evaluate each internal vertex by (7.1). This defines the root operator. An edge of weight zero is omitted, and a vertex with only one remaining child is contracted. Any finite probability distribution can be represented in this way, by successively splitting its support and using conditional probabilities. The choice of tree is part of the data; no associativity of matrix means is asserted.

#thm([Lemma 7.1.])[
  (Properties of a finite mean tree).  #emph[Let $cal(T)$ be a weighted binary tree with terminal weights $w_j$ and positive definite inputs $A_j$, and let $M$ be its root. The root commutes with invertible congruence, is monotone in each input, and satisfies 
#[#set math.equation(numbering: n => "(7.2)")
 $ cal(T) \( c_j A_j : j \) = (product_j c_j^(w_j)) M #h(2em) \( c_j > 0 \) . $ <transport:scalar-homogeneity>]

 For every unit vector $z$, 
#[#set math.equation(numbering: n => "(7.3)")
 $ chevron.l z \, M z chevron.r lt.eq product_j chevron.l z \, A_j z chevron.r^(w_j) . $ <transport:vector-jensen>]

 If $P$ is an orthogonal projection and $A_j gt.eq c_j P$ with $c_j > 0$, then 
#[#set math.equation(numbering: n => "(7.4)")
 $ M gt.eq (product_j c_j^(w_j)) P . $ <transport:projection-transfer>]

 Finally, suppose $A_j = product_(g = 1)^K A_(j \, g)$ with positive definite factors, and every factor from band $g$ commutes with every factor from band $g'$ whenever $g eq.not g'$. Then $M = product_(g = 1)^K M_g$, where $M_g$ is the root of the same weighted tree with inputs $A_(j \, g)$. The factors $M_g$ commute.]
] <transport:means>

#proof[
  We first prove the assertions for one binary vertex. For an invertible $S$, put $hat(A) = S^(*) A S$ and $U = A^(1 \/ 2) S hat(A)^(- 1 \/ 2)$. Then $U$ is unitary and
  $ hat(A)^(- 1 \/ 2) S^(*) B S hat(A)^(- 1 \/ 2) = U^(*) \( A^(- 1 \/ 2) B A^(- 1 \/ 2) \) U . $
  Functional calculus proves $\( S^(*) A S \) \#_p \( S^(*) B S \) = S^(*) \( A \#_p B \) S$. After congruence to $A = I$, the identity $A \#_p B = B \#_(1 - p) A$ reduces to $C^p = C^(1 \/ 2) \( C^(- 1) \)^(1 - p) C^(1 \/ 2)$. For $0 < p < 1$, the scalar formula
  #[#set math.equation(numbering: n => "(7.5)")
   $ x^p = frac(sin \( pi p \), pi) integral_0^oo lambda^(p - 1) x \( x + lambda \)^(- 1) thin d lambda $ <transport:power-integral>]
  follows by substituting $lambda = x t$ in the beta integral. The inverse reverses the order of positive definite operators, so $C \( C + lambda I \)^(- 1) = I - lambda \( C + lambda I \)^(- 1)$ is increasing in $C$. Thus $C mapsto C^p$ is operator monotone. This proves monotonicity in $B$, and symmetry proves it in $A$. The endpoint cases are immediate. Scalar homogeneity at a vertex is $\( c A \) \#_p \( d B \) = c^(1 - p) d^p \( A \#_p B \)$.
  For the vector inequality let $r = chevron.l z \, A z chevron.r$ and $y = A^(1 \/ 2) z \/ sqrt(r)$. Scalar Jensen applied to the spectral measure of $C = A^(- 1 \/ 2) B A^(- 1 \/ 2)$ in the unit vector $y$ gives
  $ chevron.l z \, \( A \#_p B \) z chevron.r = r chevron.l y \, C^p y chevron.r lt.eq r chevron.l y \, C y chevron.r^p = chevron.l z \, A z chevron.r^(1 - p) chevron.l z \, B z chevron.r^p . $
  Induction proves the congruence, monotonicity, homogeneity, and vector inequality for the full tree.
  To prove (7.4), fix $0 < epsilon < 1$. For every leaf,
  $ A_j - \( 1 - epsilon \) c_j P = \( 1 - epsilon \) \( A_j - c_j P \) + epsilon A_j gt.eq epsilon lambda_min \( A_j \) I . $
  Choose a common $delta > 0$ so small that $\( 1 - epsilon \) c_j delta lt.eq epsilon lambda_min \( A_j \)$ for all leaves. Monotonicity and homogeneity applied to the strictly positive inputs $\( 1 - epsilon \) c_j \( P + delta I \)$ give
  $ M gt.eq \( 1 - epsilon \) (product_j c_j^(w_j)) \( P + delta I \) gt.eq \( 1 - epsilon \) (product_j c_j^(w_j)) P . $
  Let $epsilon$ decrease to zero. This argument needs no definition of the mean on singular inputs.
  For the last assertion, cross-band commutation implies
  $ (product_g D_g) \#_p (product_g E_g) = product_g \( D_g \#_p E_g \) . $
  Indeed the inverse square root of the first product factors, its whitened second input is the product of the commuting positive operators $D_g^(- 1 \/ 2) E_g D_g^(- 1 \/ 2)$, and the $p$th power factors. Induction over the tree completes the proof. ◻
]

We next describe how a perturbation at a leaf reaches the root. A linear map on matrices is completely positive if its entrywise action on every matrix amplification preserves positive semidefinite matrices. It is unital if it maps the identity to the identity.

#thm([Lemma 7.2.])[
  (Normalized derivative maps).  #emph[At a binary vertex with output $M$ and a child $D$ of positive edge weight $w$, define 
#[#set math.equation(numbering: n => "(7.6)")
 $ Phi_D \( Z \) = 1 / w M^(- 1 \/ 2) partial_D M \[ D^(1 \/ 2) Z D^(1 \/ 2) \] M^(- 1 \/ 2) . $ <transport:edge-map>]

 Here $partial_D$ is the Fréchet derivative with the other child and the weight fixed. This map is unital and completely positive. Composing these maps from a terminal leaf $j$ to the root gives a unital completely positive map $Phi_j$ such that 
#[#set math.equation(numbering: n => "(7.7)")
 $ M^(- 1 \/ 2) partial_(A_j) M \[ A_j^(1 \/ 2) Z A_j^(1 \/ 2) \] M^(- 1 \/ 2) = w_j Phi_j \( Z \) . $ <transport:leaf-map>]

 If all tree inputs are block diagonal for a fixed orthogonal decomposition, these maps preserve each matrix block. On the first diagonal block they are the normalized derivative maps for the tree of first diagonal blocks and do not depend on the other diagonal blocks.]
] <transport:cp>

#proof[
  Differentiating (7.5) gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ D \( C^p \) \[ H \] = frac(sin \( pi p \), pi) integral_0^oo lambda^p \( C + lambda I \)^(- 1) H \( C + lambda I \)^(- 1) thin d lambda . $ <transport:power-derivative>]
  The integral converges in operator norm: its integrand is $O \( lambda^p \)$ at zero and $O \( lambda^(p - 2) \)$ at infinity. Each integrand is a completely positive sandwich map. Formula (7.8), together with the congruences in (7.1), proves complete positivity for the second child. Exchange symmetry proves it for the first child. Scalar homogeneity gives $partial_D M \[ D \] = w M$, proving unitality. The chain rule, with the square-root normalizations cancelling at successive vertices, proves (7.7). Composition preserves both properties; the map along an empty path is the identity. In the derivative integral all sandwich factors are block diagonal when the inputs are block diagonal; their first blocks depend only on the first blocks of the inputs. The same is true after exchanging the children and composing the maps. ◻
]

=== 7.2 Fourier formulas for inverse powers <fourier-formulas-for-inverse-powers>

Write $"ad"_Q \( Z \) = Q Z - Z Q$. The functions below convert normalized matrix derivatives into derivatives of vector norms and into energy errors. Fix $0 < s < 1 \/ 2$ and set

#[#set math.equation(numbering: n => "(7.9)")
 $ g_s \( z \) = frac(sinh \( s z \), sinh \( z \/ 2 \)) \, #h(2em) m_s \( u \) = frac(sin \( 2 pi s \), cosh \( 2 pi u \) + cos \( 2 pi s \)) \, #h(2em) g_s \( 0 \) = 2 s . $ <transport:fourier-density>]

The function $g_s$ is a rescaling of the classical positive-definite hyperbolic-sine kernel studied in #cite(label("BhatiaParthasarathy2000")) Theorem 3.2. We give the Fourier normalization and the shifted-density comparison needed here.

#thm([Lemma 7.3.])[
  (The two Fourier multipliers).  #emph[For real $z$, 
#[#set math.equation(numbering: n => "(7.10)")
 $ g_s \( z \) = integral_(bb(R)) e^(i u z) m_s \( u \) thin d u \, #h(2em) m_s \( u \) > 0 \, #h(2em) integral_(bb(R)) m_s \( u \) thin d u = 2 s . $ <transport:g-fourier>]

 For $s = 1 \/ 4$, the functions 
#[#set math.equation(numbering: n => "(7.11)")
 $ h_plus.minus \( z \) = frac(e^(plus.minus s z) - 1, 2 sinh \( z \/ 2 \)) = plus.minus e^(plus.minus s z \/ 2) g_(s \/ 2) \( z \) $ <transport:h-def>]

 have Fourier densities 
#[#set math.equation(numbering: n => "(7.12)")
 $ q_plus.minus \( u \) = plus.minus m_(s \/ 2) \( u plus.minus i s \/ 2 \) \, #h(2em) \| q_plus.minus \( u \) \| lt.eq 1 / sqrt(2) m_s \( u \) . $ <transport:q-density>]

 The quotients in (7.11) are interpreted continuously at zero.]
] <transport:fourier>

#proof[
  For fixed real $z eq.not 0$, integrate $e^(i u z) m_s \( u \)$ around a rectangle between the lines $bb(R)$ and $bb(R) + i$. The vertical integrals tend to zero because the denominator grows exponentially with $\| Re u \|$. The two poles in the strip are $i \( 1 \/ 2 - s \)$ and $i \( 1 \/ 2 + s \)$, with residues of $m_s$ equal to $1 \/ \( 2 pi i \)$ and $- 1 \/ \( 2 pi i \)$, respectively. Since $m_s \( u + i \) = m_s \( u \)$, the residue theorem gives
  $ \( 1 - e^(- z) \) integral_(bb(R)) e^(i u z) m_s \( u \) thin d u = e^(- \( 1 \/ 2 - s \) z) - e^(- \( 1 \/ 2 + s \) z) . $
  Division gives (7.10); dominated convergence gives its value at zero. Positivity follows from the displayed denominator.
  The algebraic identities in (7.11) follow by factoring $e^(plus.minus s z) - 1$. The nearest poles of $m_(s \/ 2)$ have imaginary parts of absolute value $1 \/ 2 - s \/ 2$, larger than $s \/ 2$. Shifting its Fourier contour by $plus.minus i s \/ 2$ therefore crosses no pole and gives the densities in (7.12). To check the bound without losing a constant, write $c = cosh \( 2 pi u \)$. At $s = 1 \/ 4$,
  $ m_s \( u \) = c^(- 1) \, #h(2em) m_(s \/ 2) \( u plus.minus i s \/ 2 \) = frac(1, c + 1 plus.minus i sinh \( 2 pi u \)) . $
  Consequently
  $ frac(\| m_(s \/ 2) \( u plus.minus i s \/ 2 \) \|, m_s \( u \)) = sqrt(frac(c, 2 \( c + 1 \))) lt.eq 1 / sqrt(2) . $
  ◻
]

=== 7.3 Finite histories and entropy gains <finite-histories-and-entropy-gains>

We specify the data to which the transport estimate applies. Let $cal(V)$ be a fixed finite tensor product of one-copy physical and auxiliary spaces, and put $cal(S)_k = "Sym"^k cal(V)$. The metrics $W_(Q \, k)$ are defined in (6.10) and studied in Lemma 17, with the common padding dimension $dim cal(V)$. We suppress $k$ in $W_(Q \, k)$. A partition $\( P \, Y \, F \)$ of these tensor factors has band metric

#[#set math.equation(numbering: n => "(7.13)")
 $ A \( P \, Y \, F \) = \( W_P^(- 1) W_F^(- 1) W_Y \)^2 quad upright("on ") cal(S)_k . $ <transport:band-metric>]

All three factors in this formula commute and are positive definite.

Fix a positive integer $K$ and a finite weighted history tree with leaves $h in cal(H)$ and weights $w_h > 0$. For each $h$ and $g in { 1 \, dots.h \, K }$ choose an old partition $\( P_(h \, g) \, Y_(h \, g) \, F_(h \, g) \)$. At each history $h$ also fix a finite conditional choice tree with leaves $c in cal(C)_h$ and weights $q_(c divides h) > 0$. A choice specifies a new partition in every band. Each new partition is obtained either by doing nothing or by transferring a tensor subsystem $x subset.eq Y$ entirely to $P$ or entirely to $F$. Write $A_(h \, g)$ and $A_(h \, c \, g)$ for the old and new band metrics and set

$ A_h = product_(g = 1)^K A_(h \, g) \, #h(2em) A_(h \, c) = product_(g = 1)^K A_(h \, c \, g) . $

We impose the following commutation condition: every old or new metric from band $g$ commutes with every old or new metric from band $g'$ for $g eq.not g'$, including metrics at different histories and choices. No commutation within a band is required.

Let $B_h$ be the conditional choice-tree root with inputs $A_(h \, c)$. For one common parameter $p in \[ 0 \, 1 \]$, replace each old input of the history tree by $A_h \#_p B_h$ and call the resulting root $cal(M) \( p \)$. Its terminal leaves at $0 < p < 1$ are

#[#set math.equation(numbering: n => "(7.14)")
 $ j = \( h \, upright("old") \) \, quad pi_j = \( 1 - p \) w_h \, #h(2em) upright("or") #h(2em) j = \( h \, c \, upright("new") \) \, quad pi_j = p w_h q_(c divides h) . $ <transport:terminal-weights>]

Their metrics are $A_h$ and $A_(h \, c)$, respectively. At $p = 1$ this is the history tree with the conditional choice trees attached; it can serve as the old tree of a subsequent round. The same $p$ is used at every history in a round.

Figure 1 displays the two types of terminal leaf. The history and conditional-choice weights are products along paths; the single interpolation vertex contributes $1 - p$ or $p$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$cal(M) (p)$]])
  content((4, 0), [#text(size: 9pt)[$A_h\#_p B_h$]])
  content((7, 1.2), [#text(size: 9pt)[$A_h$]])
  content((7, -1.2), [#text(size: 9pt)[$B_h$]])
  content((11, -1.2), [#text(size: 9pt)[$A_(h,c)$]])
  line((3.328, 0), (0.5929, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"), mark: (end: (symbol: ">>", fill: black)))
  content((2, 0), [#text(size: 9pt)[history path#linebreak()product $w_h$]], anchor: "south", padding: 0.1176cm)
  line((6.693, 1.077), (4.672, 0.2689), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.5, 0.6), [#text(size: 9pt)[$1-p$]], anchor: "south-east", padding: 0.1176cm)
  line((6.693, -1.077), (4.672, -0.2689), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.5, -0.6), [#text(size: 9pt)[$p$]], anchor: "north-east", padding: 0.1176cm)
  line((10.58, -1.2), (7.307, -1.2), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"), mark: (end: (symbol: ">>", fill: black)))
  content((9, -1.2), [#text(size: 9pt)[choice path#linebreak()product $q_(c divides h)$]], anchor: "south", padding: 0.1176cm)
  content((7, 1.858), [#text(size: 9pt)[$pi_((h, upright("old") ))=(1-p)w_h$]])
  content((11, -1.841), [#text(size: 9pt)[$pi_((h,c, upright("new") ))="pw"_"hq"_(c divides h)$]])
})],
  caption: [Figure 1: One history and one conditional choice in a round. Arrows point toward the root and show metric evaluation; every internal vertex uses its specified geometric mean. Dotted arrows abbreviate whole paths, not single edges. The same interpolation parameter $p$ is used at every history. Trace adjoints of normalized derivatives carry states in the reverse direction. ],
) <transport:tree-figure>

For a unit vector $theta in cal(V)$, the entropy assigned to a move of $x$ to $P$, with $Y = x Y_0$, is

#[#set math.equation(numbering: n => "(7.15)")
 $ eta_(h \, c \, g) \( theta \) = S_theta \( x divides P \) + S_theta \( x divides Y_0 \) = I_theta \( x : F divides P \) gt.eq 0 . $ <transport:move-eta>]

For a move to $F$ exchange $P$ and $F$ in this definition. A choice that makes no move has $eta_(h \, c \, g) = 0$. The equality in (7.15) follows by purity on $P x Y_0 F$. Choose $ell gt.eq 1$ bounding $log \( e dim x \)$ for every transferred subsystem. Throughout, $a = 2 t > 0$ satisfies the smallness hypotheses of Lemmas 18 and 15; in particular $t < 1 \/ 4$ and $a ell$ is bounded by a sufficiently small absolute constant.

For the energy part of the estimate, let $0 lt.eq h_i lt.eq I$, $i$ in a finite index set, act on physical tensor factors, and let $D_i$ be a designated tensor support containing the actual support of $h_i$. For each terminal partition and each band, assume $D_i$ is contained in one of its three parts, except possibly in one band. In that exceptional band, $D_i$ meets $Y$ and exactly one of $P \, F$. Call this a split of $i$ at leaf $j$, and write $cal(J)_i$ for the set of such leaves. For a split put $x = D_i ∩ Y$, let the receiving side be the part $P$ or $F$ met by $D_i$, and define $eta_(i \, j)$ by the corresponding formula (7.15). In addition to the bounds for all transferred subsystems, require $log \( e dim D_i \) lt.eq ell$ for every $i$ with $cal(J)_i eq.not diameter$, retaining the smallness condition on $a ell$. No support-dimension bound is required for terms that are unsplit at every terminal leaf. These are explicit assumptions on a finite collection of partitions and supports; geometric ways to satisfy them are considered later.

Define

#[#set math.equation(numbering: n => "(7.16)")
 $ macron(h)_i = 1 / k sum_(r = 1)^k h_(i \, r)\|_(cal(S)_k) \, #h(2em) macron(H) = sum_i macron(h)_i \, #h(2em) W_i \( p \) = sum_(j in cal(J)_i) pi_j . $ <transport:replica-energy>]

If a leaf does not split $i$, its metric commutes with $macron(h)_i$. Indeed, when $D_i$ is contained in a partition part, the sum of its copy-translates commutes with every copy permutation on that part and with every permutation on its disjoint complement. It therefore commutes with the Schur-label functions defining that band’s metric. Apply this argument in every band.

For use in the statement, recall the coherent vectors and measures

#[#set math.equation(numbering: n => "(7.17)")
 $ P_(theta \, k) = \| theta^(⊗ k) chevron.r chevron.l theta^(⊗ k) \| \, quad D_k = dim cal(S)_k \, quad d mu_sigma \( theta \) = D_k "Tr" \( sigma P_(theta \, k) \) thin d theta \, $ <transport:coherent-measure>]

where $d theta$ is Haar probability on the unit sphere of $cal(V)$. For a density matrix $sigma$ on $cal(S)_k$, this is a probability measure, since $D_k integral P_(theta \, k) thin d theta = I_(cal(S)_k)$.

#thm([Proposition 7.4.])[
  (Entropy and energy transport).  #emph[Fix a finite one-copy space, history and conditional choice trees, partitions, cross-band commutation, positive parameter $a$, and positive contractions with designated supports as specified above. Let $ell$ bound the logarithmic dimensions of every transferred subsystem and every designated support $D_i$ for which $cal(J)_i eq.not diameter$, with the stipulated smallness of $a ell$. For every $k$ and nonzero $upright("pre") in cal(S)_k$, set 
#[#set math.equation(numbering: n => "(7.18)")
 $ s = 1 / 4 \, #h(2em) N \( p \) = lr(bar.v.double cal(M) \( p \)^(- s) upright("pre") bar.v.double) \, #h(2em) v \( p \) = frac(cal(M) \( p \)^(- s) upright("pre"), N \( p \)) . $ <transport:filtered-vector>]

 For every $0 < p < 1$, let $Phi_j$ be the normalized map from terminal leaf $j$ to $cal(M) \( p \)$ and define density matrices 
#[#set math.equation(numbering: n => "(7.19)")
 $ sigma_(j \, u) = Phi_j^(*) #scale(x: 120%, y: 120%)[\(] \| cal(M) \( p \)^(- i u) v \( p \) chevron.r chevron.l cal(M) \( p \)^(- i u) v \( p \) \| #scale(x: 120%, y: 120%)[\)] \, #h(2em) u in bb(R) . $ <transport:states>]

 The adjoint here is for the trace pairing: $"Tr" \( Phi_j^(*) \( sigma \) Z \) = "Tr" \( sigma Phi_j \( Z \) \)$. Write $sigma_(h \, u)$ for the state at $j = \( h \, upright("old") \)$, and put $C_h = A_h^(- 1 \/ 2) B_h A_h^(- 1 \/ 2)$. Then 
#[#set math.equation(numbering: n => "(7.20)")
 $ - partial_p log N \( p \)^2 = sum_h w_h integral_(bb(R)) m_s \( u \) "Tr" \( sigma_(h \, u) log C_h \) thin d u . $ <transport:exact-derivative>]

 There is $beta_k = O_(upright("fixed")) \( log \( k + 1 \) \)$, independent of $p$ and $upright("pre")$, such that 
#[#set math.equation(numbering: n => "(7.21)")
 $ - partial_p log N \( p \)^2 gt.eq  & k a sum_(h \, g) w_h integral_(bb(R)) m_s \( u \) integral sum_(c in cal(C)_h) q_(c divides h) eta_(h \, c \, g) \( theta \) thin d mu_(sigma_(h \, u)) \( theta \) thin d u\
 &  - C k a K a^(1 \/ 4) ell^C - beta_k . $ <transport:entropy-gain>]

 If in addition $macron(H) thin upright("pre") = E_0 upright("pre")$, then 
#[#set math.equation(numbering: n => "(7.22)")
 $ chevron.l v \, macron(H) v chevron.r lt.eq 2 E_0 + C a^2 ell^C sum_i W_i \( p \) sum_(j in cal(J)_i) pi_j integral_(bb(R)) m_s \( u \) integral eta_(i \, j) \( theta \)^(1 \/ 8) thin d mu_(sigma_(j \, u)) \( theta \) thin d u + o_k \( 1 \) . $ <transport:energy>]

 The remainder in (7.22) is uniform in $p in \( 0 \, 1 \)$, in nonzero $upright("pre")$ satisfying the eigenvector assumption, and in all replica states. The constants $C$ and the exponents denoted by $C$ in (7.21) and (7.22) are universal; support dimensions enter those coefficients only through $ell$. Only the implicit constant in $beta_k = O_(upright("fixed")) \( log \( k + 1 \) \)$ and the convergence rate of $o_k \( 1 \)$ may depend on the entire fixed finite data. Neither depends on $p$ or the replica state. The entropy estimate can be integrated over a closed subinterval of $\[ 0 \, 1 \]$ using the continuous endpoint values of $N$.]
] <prop:transport>

#proof[
  We first identify the derivative states and prove the entropy estimate. We then construct an auxiliary block tree for each physical term and derive (7.22) by a matrix Schwarz inequality.
  ===== 7.3.1 The derivative at an interpolating vertex. <the-derivative-at-an-interpolating-vertex.>
  At the vertex $M_h = A_h \#_p B_h$, put $V_h = C_h^(p \/ 2) A_h^(1 \/ 2) M_h^(- 1 \/ 2)$. Since $V_h^(*) V_h = I$, this matrix is unitary, and direct differentiation gives
  #[#set math.equation(numbering: n => "(7.23)")
   $ M_h^(- 1 \/ 2) partial_p M_h M_h^(- 1 \/ 2) = V_h^(*) \( log C_h \) V_h . $ <transport:node-p-derivative>]
  This is also the normalized old-child derivative applied to $log C_h$. To verify that assertion, perturb the old input to $A_h^(1 \/ 2) \( I + delta log C_h \) A_h^(1 \/ 2)$ while keeping $B_h$ fixed. After congruence the two inputs commute, so their mean is
  $ \( I + delta log C_h \) \#_p C_h = \( I + delta log C_h \)^(1 - p) C_h^p . $
  Its derivative at zero is $\( 1 - p \) C_h^p log C_h$. The normalization in (7.6) divides by $1 - p$ and proves the assertion. Composing with the ancestor maps therefore yields
  #[#set math.equation(numbering: n => "(7.24)")
   $ sans(H) := cal(M)^(- 1 \/ 2) \( partial_p cal(M) \) cal(M)^(- 1 \/ 2) = sum_h w_h Phi_(\( h \, upright("old") \)) \( log C_h \) . $ <transport:root-p-derivative>]
  The coefficient here is $w_h$, whereas the weight of the same terminal leaf in the full tree is $\( 1 - p \) w_h$.
  To differentiate the norm, diagonalize $cal(M)$ with eigenvalues $x_r > 0$ and substitute $upright("pre") = N cal(M)^s v$. The matrix coefficient, between the components $overline(v)_r$ and $v_t$, multiplying the $\( r \, t \)$ entry of $sans(H)$ is
  $ - \( x_r x_t \)^(s + 1 \/ 2) frac(x_r^(- 2 s) - x_t^(- 2 s), x_r - x_t) = g_s \( log x_r - log x_t \) \, $
  with the divided difference interpreted as a derivative when the eigenvalues agree. The common value in that case is $2 s$. Consequently
  #[#set math.equation(numbering: n => "(7.25)")
   $ - partial_p log N^2 = chevron.l v \, g_s \( "ad"_(log cal(M)) \) \( sans(H) \) v chevron.r . $ <transport:norm-derivative>]
  Insert (7.24) and the Fourier formula (7.10). Lemma 21 implies that (7.19) is positive and has trace one. Moving each map to its trace adjoint proves (7.20).
  ===== 7.3.2 Transfer of the relative metric lower bound. <transfer-of-the-relative-metric-lower-bound.>
  By Lemma 20, the old metrics, the conditional roots, the interpolated root $cal(M) = product_g cal(M)_g$, and the relative metrics factor over bands. Here $cal(M)_g$ is the full tree evaluated on the inputs from band $g$ alone. More precisely, if $B_(h \, g)$ is the conditional tree of new metrics in band $g$, then
  #[#set math.equation(numbering: n => "(7.26)")
   $ C_h = product_g C_(h \, g) \, #h(2em) C_(h \, g) = A_(h \, g)^(- 1 \/ 2) B_(h \, g) A_(h \, g)^(- 1 \/ 2) \, #h(2em) log C_h = sum_g log C_(h \, g) . $ <transport:relative-factorization>]
  Congruence covariance identifies $C_(h \, g)$ as the conditional choice tree of the single-move relative metrics $A_(h \, g)^(- 1 \/ 2) A_(h \, c \, g) A_(h \, g)^(- 1 \/ 2)$. Lemma 18 gives, for every unit $theta$,
  $ A_(h \, g)^(- 1 \/ 2) A_(h \, c \, g) A_(h \, g)^(- 1 \/ 2) gt.eq b_k exp #h(-0.16667em) (k a [eta_(h \, c \, g) \( theta \) - C a^(1 \/ 4) ell^C]) P_(theta \, k) \, $
  where $b_k > 0$ and $- log b_k = O_(upright("fixed")) \( log \( k + 1 \) \)$. The same $b_k$ and constant can be used for the finitely many moves. For a move of the empty subsystem the relative metric is the identity, and the assertion holds after decreasing $b_k$ to at most one. Projection transfer, (7.4), gives
  #[#set math.equation(numbering: n => "(7.27)")
   $ C_(h \, g) gt.eq b_k exp #h(-0.16667em) (k a [sum_c q_(c divides h) eta_(h \, c \, g) \( theta \) - C a^(1 \/ 4) ell^C]) P_(theta \, k) . $ <transport:conditional-pin>]
  The common polynomial factor occurs once, because the conditional weights sum to one.
  Here is the logarithmic passage from this pointwise rank-one inequality to an estimate valid in every state. Define the unital positive map
  $ cal(Q)_k \( f \) = D_k integral f \( theta \) P_(theta \, k) thin d theta . $
  The identity $cal(Q)_k \( 1 \) = I$ follows from the invariance of the integral and irreducibility of $"Sym"^k cal(V)$ under the full unitary group; its trace fixes the scalar. For a positive bounded function $f$ bounded away from zero, integration of the positive scalar block matrix with entries $f \, 1 \; 1 \, f^(- 1)$ gives
  $ mat(delim: "(", cal(Q)_k \( f \), I; I, cal(Q)_k \( f^(- 1) \)) gt.eq 0 \, #h(2em) cal(Q)_k \( f \)^(- 1) lt.eq cal(Q)_k \( f^(- 1) \) . $
  Apply this also to $f + lambda$ and integrate the scalar resolvent formula
  $ log x = integral_0^oo (\( 1 + lambda \)^(- 1) - \( x + lambda \)^(- 1)) d lambda . $
  It proves
  #[#set math.equation(numbering: n => "(7.28)")
   $ log cal(Q)_k \( f \) gt.eq cal(Q)_k \( log f \) . $ <transport:log-jensen>]
  The same inverse-order argument proves operator monotonicity of the logarithm. All these integrals converge in norm on compact positive spectral intervals.
  Integrating (7.27) against Haar probability gives
  $ C_(h \, g) gt.eq b_k / D_k thin cal(Q)_k #h(-0.16667em) (exp #h(-0.16667em) {k a [sum_c q_(c divides h) eta_(h \, c \, g) - C a^(1 \/ 4) ell^C]}) . $
  Thus operator log monotonicity and (7.28) turn the factor $D_k$ into an additive logarithmic loss:
  #[#set math.equation(numbering: n => "(7.29)")
   $ log C_(h \, g) gt.eq  & k a cal(Q)_k #h(-0.16667em) (sum_c q_(c divides h) eta_(h \, c \, g) - C a^(1 \/ 4) ell^C) + \( log b_k - log D_k \) I . $ <transport:log-relative>]
  The entropies are bounded in the fixed one-copy dimension, so the exponential symbol used here is positive and bounded away from zero for each fixed $k$. Also $D_k = binom(k + dim cal(V) - 1, dim cal(V) - 1)$ is polynomial in $k$. Taking the expectation in the trace-one state $sigma_(h \, u)$, summing (7.26), and using $sum_h w_h = 1$ and $integral m_s = 1 \/ 2$ proves (7.21). In particular the loss is logarithmic in $k$, without an additional factor $D_k$ after taking expectations.
  We have obtained the entropy gain against the old-leaf states. To control the energy in these same states, the remaining argument represents the commutator with each $macron(h)_i$ by a block matrix and transports its square through the same tree.
  ===== 7.3.3 An auxiliary positive metric for each energy term. <an-auxiliary-positive-metric-for-each-energy-term.>
  Fix $i$. Let $T : cal(S)_k arrow.r cal(D)$ be $h_i^(1 \/ 2)$ on the last copy, restricted to $cal(S)_k$, with codomain its image. Then $T^(*) T = macron(h)_i$: matrix elements of any marked copy coincide between symmetric vectors, and their average is the restriction in (7.16). If $T = 0$, the term contributes nothing and can be omitted. Otherwise $T$ is surjective onto $cal(D)$.
  We will add a second diagonal block to each leaf metric. This block is chosen so that the squared off-diagonal commutator recovers the absolute-value expression of Lemma 19. The first block remains the original metric, so Lemma 21 will preserve its derivative maps when the enlarged tree is evaluated. For every terminal leaf with input $A_j$, we construct a positive definite operator $B_(i \, j)$ on $cal(D)$. When $\[ A_j \, macron(h)_i \] = 0$, use the polar decomposition $T = U \| T \|$. Here $U$ is unitary from $"supp" \| T \|$ onto $cal(D)$, and this support is invariant under $A_j$. Set $B_(i \, j) = U \( A_j \|_("supp" \| T \|) \) U^(*)$. Commutation with $\| T \|$ gives
  #[#set math.equation(numbering: n => "(7.30)")
   $ Y_(i \, j) := B_(i \, j)^(1 \/ 2) T A_j^(- 1 \/ 2) = T = B_(i \, j)^(- 1 \/ 2) T A_j^(1 \/ 2) = : Z_(i \, j) . $ <transport:unsplit-block>]
  For a split leaf put
  $ O_(i \, j) = A_j^(- 1 \/ 2) macron(h)_i A_j^(1 \/ 2) \, #h(2em) S_j = T A_j^(- 1 \/ 2) \, #h(2em) Q_j = \| O_(i \, j)^(*) \| . $
  For any operator $O$, the notation $\| O \|$ means $\( O^(*) O \)^(1 \/ 2)$. The range of $O_(i \, j)$ is the range of $S_j^(*)$, namely $A_j^(- 1 \/ 2) "ran" T^(*)$. Since $S_j$ is surjective, $S_j S_j^(*)$ is positive definite on $cal(D)$. Define
  #[#set math.equation(numbering: n => "(7.31)")
   $ B_(i \, j) = \( S_j S_j^(*) \)^(- 1) S_j Q_j S_j^(*) \( S_j S_j^(*) \)^(- 1) . $ <transport:rank-deficient-B>]
  The operator $Q_j$ is strictly positive on $"ran" S_j^(*)$. Thus (7.31) is positive definite on $cal(D)$ and $S_j^(*) B_(i \, j) S_j = Q_j$; the latter follows because $S_j^(*) \( S_j S_j^(*) \)^(- 1) S_j$ is the projection onto $"ran" S_j^(*)$. Define $Y_(i \, j) \, Z_(i \, j)$ by the formulas in (7.30). They now satisfy
  $ Y_(i \, j)^(*) Y_(i \, j) = \| O_(i \, j)^(*) \| \, #h(2em) Y_(i \, j)^(*) Z_(i \, j) = O_(i \, j) . $
  The map $Y_(i \, j)$ is surjective. Consequently $Y_(i \, j) \( Y_(i \, j)^(*) Y_(i \, j) \)^(+) Y_(i \, j)^(*) = I_(cal(D))$, where the plus denotes the inverse on the support and zero on the kernel. Multiplying on the two sides by $Z_(i \, j)^(*)$ and $Z_(i \, j)$ shows
  $ Z_(i \, j)^(*) Z_(i \, j) = O_(i \, j)^(*) \| O_(i \, j)^(*) \|^(+) O_(i \, j) = \| O_(i \, j) \| . $
  The last equality follows, for example, from a singular value decomposition of $O_(i \, j)$. Hence
  #[#set math.equation(numbering: n => "(7.32)")
   $ sans(D)_(i \, j) := \( Y_(i \, j) - Z_(i \, j) \)^(*) \( Y_(i \, j) - Z_(i \, j) \) = \| O_(i \, j)^(*) \| + \| O_(i \, j) \| - O_(i \, j) - O_(i \, j)^(*) gt.eq 0 . $ <transport:skew-square>]
  For an unsplit leaf use $sans(D)_(i \, j) = 0$; it agrees with the same formula because $O_(i \, j) = macron(h)_i$. The construction has therefore included singular $macron(h)_i$ without ever inverting it on its kernel.
  ===== 7.3.4 Transporting the square with both Fourier kernels. <transporting-the-square-with-both-fourier-kernels.>
  Evaluate the full terminal tree on the block inputs
  $ M_(i \, j) = mat(delim: "(", A_j, 0; 0, B_(i \, j)) . $
  Its root is $bb(M)_i = "diag" \( cal(M) \, cal(B)_i \)$. Denote its normalized leaf maps by $hat(Phi)_(i \, j)$. Their first diagonal-block restrictions are exactly $Phi_j$, by Lemma 21, although the second blocks depend on $i$. Let
  $ L_i = mat(delim: "(", 0, T^(*); T, 0) \, #h(2em) K_(i \, j) = M_(i \, j)^(1 \/ 2) L_i M_(i \, j)^(- 1 \/ 2) - M_(i \, j)^(- 1 \/ 2) L_i M_(i \, j)^(1 \/ 2) . $
  Rotating every input by $e^(i t L_i)$ rotates the root by the same unitary, by congruence covariance. Differentiate at zero, normalize at the root, and cancel the common factor $- i$. The chain rule gives
  #[#set math.equation(numbering: n => "(7.33)")
   $ 2 sinh \( "ad"_(log bb(M)_i) \/ 2 \) L_i = sum_j pi_j hat(Phi)_(i \, j) \( K_(i \, j) \) . $ <transport:block-rotation>]
  The lower-left block of $K_(i \, j)$ is $Y_(i \, j) - Z_(i \, j)$, its upper-right block is the negative adjoint, and the upper-left block of $K_(i \, j)^(*) K_(i \, j)$ is $sans(D)_(i \, j)$. In particular $K_(i \, j) = 0$ for $j in.not cal(J)_i$.
  Apply $h_plus.minus \( "ad"_(log bb(M)_i) \)$ to (7.33). By (7.11), the lower-left block of the left side is
  #[#set math.equation(numbering: n => "(7.34)")
   $ E_(i \, plus.minus) = cal(B)_i^(plus.minus s) T cal(M)^(minus.plus s) - T . $ <transport:E-def>]
  The Fourier formula for the right side and preservation of blocks give an expression for $\( 0 \, E_(i \, plus.minus) v \)$ as a sum over split leaves of
  $ pi_j integral_(bb(R)) q_plus.minus \( u \) thin bb(M)_i^(i u) hat(Phi)_(i \, j) \( K_(i \, j) \) bb(M)_i^(- i u) \( v \, 0 \) thin d u . $
  The output phase is unitary. Cauchy–Schwarz with respect to the positive measure assigning mass $pi_j \| q_plus.minus \( u \) \| thin d u$ to $\( j \, u \)$ therefore bounds the squared norm by
  $ & W_i (integral_(bb(R)) \| q_plus.minus \( u \) \| thin d u) sum_(j in cal(J)_i) pi_j integral_(bb(R)) \| q_plus.minus \( u \) \| lr(bar.v.double hat(Phi)_(i \, j) \( K_(i \, j) \) \( cal(M)^(- i u) v \, 0 \) bar.v.double)^2 thin d u . $
  For a unital completely positive map $Psi$,
  #[#set math.equation(numbering: n => "(7.35)")
   $ Psi \( K \)^(*) Psi \( K \) lt.eq Psi \( K^(*) K \) . $ <transport:cp-schwarz>]
  Indeed apply its two-by-two amplification to the positive block matrix $mat(delim: "(", K^(*) K, K^(*); K, I)$ and take the Schur complement of the identity. By the first-block restriction of $hat(Phi)_(i \, j)$, this bounds the norm squared in the preceding display by $"Tr" \( sigma_(j \, u) sans(D)_(i \, j) \)$. Finally (7.12) and $integral m_s = 1 \/ 2$ give the exact estimate
  #[#set math.equation(numbering: n => "(7.36)")
   $ lr(bar.v.double E_(i \, plus.minus) v bar.v.double)^2 lt.eq 1 / 4 W_i sum_(j in cal(J)_i) pi_j integral_(bb(R)) m_s \( u \) "Tr" \( sigma_(j \, u) sans(D)_(i \, j) \) thin d u . $ <transport:block-bound>]
  This proves the bound for both signs. The first factor $W_i$ comes from Cauchy–Schwarz, and the sum contains a second total split weight. For example, a uniform bound on its trace integrals gives a bound proportional to $W_i^2$, rather than $W_i$.
  ===== 7.3.5 From the transported square to physical energy. <from-the-transported-square-to-physical-energy.>
  At a split leaf only one band fails to commute with $macron(h)_i$. The other factors cancel in its similarity transform $O_(i \, j)$. At such a leaf $j in cal(J)_i$, the assumed bound $log \( e dim D_i \) lt.eq ell$ applies. Our designated-support assumptions put this two-part split within the hypotheses of Lemma 19; Lemma 15 then gives, uniformly over density matrices $sigma$ on $cal(S)_k$,
  #[#set math.equation(numbering: n => "(7.37)")
   $ "Tr" \( sigma sans(D)_(i \, j) \) lt.eq C a^2 ell^C integral eta_(i \, j) \( theta \)^(1 \/ 8) thin d mu_sigma \( theta \) + r_k \, #h(2em) r_k arrow.r 0 . $ <transport:symbol-cost>]
  There are finitely many split term–leaf pairs, so one common $r_k gt.eq 0$ can be chosen for all of them; take $r_k = 0$ if there are none. Unsplit pairs have $sans(D)_(i \, j) = 0$ exactly and incur no symbol remainder or support-dimension factor. These terminal metrics do not depend on the interpolation parameter. Uniformity over $sigma$ makes (7.37) applicable to every $sigma_(j \, u)$, regardless of $p$, $u$, or the normalized vector.
  The two opposite powers of $cal(B)_i$ in (7.34) cancel in the pairing:
  #[#set math.equation(numbering: n => "(7.38)")
   $ Re chevron.l \( T + E_(i \, +) \) v \, \( T + E_(i \, -) \) v chevron.r & = Re chevron.l cal(M)^(- s) v \, macron(h)_i cal(M)^s v chevron.r\
 & gt.eq 1 / 2 lr(bar.v.double T v bar.v.double)^2 - 3 / 2 #scale(x: 120%, y: 120%)[\(] lr(bar.v.double E_(i \, +) v bar.v.double)^2 + lr(bar.v.double E_(i \, -) v bar.v.double)^2 #scale(x: 120%, y: 120%)[\)] . $ <transport:energy-similarity>]
  For the last inequality, expand the left pairing, bound each linear cross term by $1 / 4 lr(bar.v.double T v bar.v.double)^2 + lr(bar.v.double E_(i \, plus.minus) v bar.v.double)^2$, and bound the remaining mixed term by half the sum of the two error squares. Summing the equality in (7.38) over $i$ gives $E_0$: one has $cal(M)^s v = upright("pre") \/ N$, and $chevron.l cal(M)^(- s) v \, cal(M)^s v chevron.r = 1$. Thus
  $ chevron.l v \, macron(H) v chevron.r lt.eq 2 E_0 + 3 sum_(i \, plus.minus) lr(bar.v.double E_(i \, plus.minus) v bar.v.double)^2 . $
  Insert (7.36) and (7.37) to obtain (7.22). The total remainder is bounded by a fixed constant times $r_k sum_i W_i^2$ and hence tends to zero uniformly in $p$ and $v$.
  Finally, all tree inputs are positive definite, so for fixed $k$ the roots and $N$ are smooth up to $p = 0 \, 1$. The normalized maps are used only where their branch weights are positive; their being unital ensures bounds uniform as $p$ approaches an endpoint. The entropies are bounded in the fixed one-copy space, and all probability weights sum to one. Thus the entropy integrand and its error have the uniform bounds required to integrate (7.21) and pass to the endpoints. A finite sequence of rounds permits the same choices of polynomial losses and remainders by taking their maxima. ◻
]

The proposition separates two uses of a history. Its old-leaf state in (7.20) is exactly the state used for that leaf in (7.36). Only the scalar weights differ: $w_h$ in the derivative and $\( 1 - p \) w_h$ in the energy estimate. This identity allows a later averaging argument to select one common time and one common interpolation parameter while retaining control of all energy terms.

== 8 Norm comparisons from an auxiliary pair <sec:comparators>

The metric deformation of Section 7 provides a vector whose physical energy can be small. We now compare the norm defining that vector in two ways. Projecting the target and an auxiliary system onto an entangled pair gives an upper bound on the negative logarithm of the norm. A lower bound follows because most physical copies of a low-energy vector are in the ground state. The auxiliary systems retain large representation labels in this second comparison. Their contribution is what makes the two bounds useful.

We formulate the comparison for a finite collection of partitions. No traversal procedure or choice of geometric scales is needed in this section. All physical entropies below are in a fixed normalized pure vector $tilde(Omega) in cal(H)_(upright("phys"))$, unless another state is specified. Suppose that a positive Hamiltonian $tilde(H)$ has this unique ground vector, ground energy $tilde(E)_0$, and gap $tilde(g) > 0$. Fix a physical subsystem $X$. A status consists of $K$ partitions

$ cal(H)_(upright("phys")) = cal(H)_X ⊗ cal(H)_(U_g) ⊗ cal(H)_(Y_g) ⊗ cal(H)_(V_g) \, #h(2em) 1 lt.eq g lt.eq K . $

There are finitely many allowed statuses. We assume that, for every allowed choice of the two statuses and every $g < g'$, their physical sets satisfy

#[#set math.equation(numbering: n => "(8.1)")
 $ X U_g Y_g subset.eq X U_(g') . $ <comparator:nesting>]

As usual, juxtaposition joins disjoint tensor factors. The inclusion in (8.1) compares sets of physical sites. It ensures the commutation of the different bands’ metric algebras after complementary labels are identified on the symmetric space.

Here are the entropy data used in the comparisons. Write $S_X = S \( X \)$. Choose a nonempty set $E$ of positive Schmidt indices of $X$ such that, for some $w gt.eq 0$,

#[#set math.equation(numbering: n => "(8.2)")
 $ e^(- S_X - w) lt.eq p_i lt.eq e^(- S_X + w) quad \( i in E \) \, #h(2em) z = sum_(i in E) p_i > 0 . $ <comparator:typical-set>]

Put $d_(*) = \| E \|$, $p'_i = p_i \/ z$, and $S' = - sum_(i in E) p'_i log p'_i$. For the later choice of a scale parameter $n gt.eq 2$, Lemma 5 will supply $w = n^(3 \/ 5)$ and $z gt.eq 1 - n^(- 100)$. Only (8.2) is needed here. Directly from (8.2),

#[#set math.equation(numbering: n => "(8.3)")
 $ \| log d_(*) - S_X \| lt.eq w + \| log z \| \, #h(2em) \| S' - S_X \| lt.eq w + \| log z \| . $ <comparator:typical-entropies>]

For the rough upper bound, assume there is a finite nested collection $cal(R)$ of physical subsystems disjoint from $X$. For every status and band, each of $U_g$ and $U_g Y_g$ has a matched member of $cal(R)$ which contains it or is contained in it. Assume

#[#set math.equation(numbering: n => "(8.4)")
 $ S \( B \) lt.eq B_(upright("sh")) quad \( B in cal(R) \) \, #h(2em) 1 + log dim cal(H)_(B triangle.stroked.t Q) lt.eq B_(upright("exc")) $ <comparator:prefix-data>]

for every such matched pair $\( B \, Q \)$, where $Q = U_g$ or $U_g Y_g$. The symmetric difference here is simply the difference between the two nested sets. The added $1$ in $B_(upright("exc"))$ absorbs a fixed margin in a spectral cutoff.

The sharp bounds additionally use the following marginal moment assumption. For every set

$ Q in { X U_g \, V_g \, Y_g \, U_g \, U_g Y_g : upright("allowed statuses and bands") } \, $

let $rho_Q$ be the marginal of $tilde(Omega)$. There are constants $C_0 \, c_0 > 0$ and $cal(B) gt.eq 1$ such that

#[#set math.equation(numbering: n => "(8.5)")
 $ log "Tr" rho_Q^(thin 1 - u) lt.eq u S \( Q \) + C_0 cal(B) u^2 \, #h(2em) \| u \| lt.eq c_0 \/ sqrt(cal(B)) . $ <comparator:mgf-data>]

Only positive eigenvalues are used in this expression. We retain the parameter $cal(B)$ from the marginal estimate, including any logarithmic factors it contains.

Append systems $C \, R$ of dimension $d_(*)$, with bases indexed by $E$, and put

$ upright("Bell")_(C R) = d_(*)^(- 1 \/ 2) sum_(i in E) \| i chevron.r_C \| i chevron.r_R . $

Use the common-dimension Schur metrics of Section 6 on

$ cal(V) = cal(H)_(upright("phys")) ⊗ cal(H)_C ⊗ cal(H)_R \, #h(2em) cal(S)_k = "Sym"^k cal(V) . $

In particular the same scalar function of a partition label defines every $W_(Q \, k)$, with labels padded to $dim cal(V)$. Suppress $k$ when it is unambiguous. Fix $0 < a lt.eq a_0$, where $a_0 > 0$ is a sufficiently small absolute constant, set $t = a \/ 2$, $s = 1 \/ 4$, and $W = a K$. At a terminal leaf $j$ of any finite binary mean tree, put

#[#set math.equation(numbering: n => "(8.6)")
 $ P_(j \, g) = C X U_(j \, g) \, #h(2em) F_(j \, g) = R V_(j \, g) \, #h(2em) A_(j \, g) = \( W_(P_(j \, g))^(- 1) W_(F_(j \, g))^(- 1) W_(Y_(j \, g)) \)^2 \, #h(2em) A_j = product_(g = 1)^K A_(j \, g) . $ <comparator:metrics>]

Thus $X \, U_(j \, g) \, Y_(j \, g) \, V_(j \, g)$ are the physical factors, while $P_(j \, g) \, Y_(j \, g) \, F_(j \, g)$ form the full partition used by the metric. The target is $X$. The auxiliary factors $C \, R$ are initialized in the Bell pair above, and the same factors are used in every band. Only the physical factors contribute to the Hamiltonian.

Let $w_j$ be the terminal path probabilities, let $cal(M)$ be the mean-tree root with leaves $A_j$, and let $cal(M)_g$ use the same tree with leaves $A_(j \, g)$. Then $cal(M) = product_g cal(M)_g$, with commuting factors. We write

$ chevron.l f chevron.r_(upright("av")) = 1 / K sum_(g = 1)^K sum_j w_j f_(j \, g) $

for the full terminal-path and band average. In particular it includes both old and new terminal leaves when the tree contains an interpolation.

#thm([Proposition 8.1.])[
  (Upper and lower norm comparisons).  #emph[Fix the positive gapped Hamiltonian and physical target $X$ above, a finite collection of status partitions satisfying (8.1), a typical Schmidt set satisfying (8.2), and a mean tree with metrics (8.6). There is a sequence of common auxiliary labels $lambda_k$ and nonzero vectors 
#[#set math.equation(numbering: n => "(8.7)")
 $ upright("pre")_k = pi_R^(lambda_k) \( tilde(Omega) ⊗ upright("Bell")_(C R) \)^(⊗ k) in cal(S)_k \, #h(2em) parallel upright("pre")_k parallel lt.eq 1 \, $ <comparator:prevector>]

 Here $pi_R^(lambda_k)$ is the Schur-label projection on the $R$ copies. These vectors are physical mean-energy eigenvectors of eigenvalue $tilde(E)_0$ and have label $lambda_k$ on both $C$ and $R$. For every tree above, set 
$ N = parallel cal(M)^(- s) upright("pre")_k parallel \, #h(2em) v = cal(M)^(- s) upright("pre")_k \/ N \, #h(2em) E_(upright("def")) = frac(chevron.l v \, overline(tilde(H)) v chevron.r - tilde(E)_0, tilde(g)) \, #h(2em) overline(tilde(H)) = 1 / k sum_(i = 1)^k tilde(H)^(\( i \)) . $

 #emph[Rough comparisons.] For $0 < tau < 1 \/ 2$, the upper bound below uses the prefix data (8.4): 
#[#set math.equation(numbering: n => "(8.8)")
 $ - frac(log N^2, k) & lt.eq 2 log d_(*) - log z + 2 s W (frac(2 B_(upright("sh")), z) + 2 B_(upright("exc"))) + o_k \( 1 \) \,\
- frac(log N^2, k) & gt.eq 2 s W [2 S' - C (tau log d_(*) + frac(h \( tau \), a)) - C E_(upright("def")) / tau S'] - o_k \( 1 \) . $ <comparator:rough-upper>]

 Here $h$ is binary entropy. The lower bound does not require (8.4) or (8.5).]
  #emph[#emph[Sharp comparisons.] If (8.5) holds and $a lt.eq c \/ sqrt(cal(B))$, with $c$ sufficiently small in terms of $c_0$, define 
$ g_(j \, g)^(upright("pre")) & = S \( X U_(j \, g) \) + S \( V_(j \, g) \) - S \( Y_(j \, g) \) \,\
g_(j \, g)^(upright("post")) & = S \( U_(j \, g) \) + S \( U_(j \, g) Y_(j \, g) \) - S \( Y_(j \, g) \) \, #h(2em) g_max = max_(j \, g) g_(j \, g)^(upright("pre")) . $

 Then $g_(j \, g)^(upright("pre")) gt.eq 0$, and the sharp comparisons are 
#[#set math.equation(numbering: n => "(8.9)")
 $ - frac(log N^2, k) & lt.eq 2 log d_(*) - log z + 2 s W [chevron.l g^(upright("post")) chevron.r_(upright("av")) + C (a cal(B) + frac(\| log z \|, a))] + o_k \( 1 \) \,\
- frac(log N^2, k) & gt.eq 2 s W [2 S' + \( 1 - tau \) chevron.l g^(upright("pre")) chevron.r_(upright("av")) - C (tau log d_(*) + frac(h \( tau \), a) + a cal(B)) - C E_(upright("def")) / tau \( S' + g_max \)] - o_k \( 1 \) . $ <comparator:sharp-upper>]

 The upper sharp bound does not require (8.4). For every physical partition there is the exact identity 
#[#set math.equation(numbering: n => "(8.10)")
 $ 2 S_X + g_(j \, g)^(upright("pre")) - g_(j \, g)^(upright("post")) = I \( X : V_(j \, g) \) + I \( X : Y_(j \, g) V_(j \, g) \) . $ <comparator:entropy-identity>]

]
  #emph[All replica limits are taken with the physical system, auxiliary dimensions, finite status collection and tree, $a$, and $tau$ fixed. The errors are uniform over terminal probabilities, including their dependence on $k$, and over the symmetric vectors to which the lower comparison is applied. Constants or degrees in intermediate polynomial factors in $k$ may depend on the fixed entire system. They disappear in $o_k \( 1 \)$. The displayed constants in the rough bounds are universal; those in the sharp bounds may also depend on $C_0 \, c_0$. None has additional dependence on the system dimensions.]
] <prop:comparators>

=== 8.1 Labels selected by the auxiliary pair <labels-selected-by-the-auxiliary-pair>

We first record the entropy concentration of the labels that will be used. For a permutation-invariant density $rho$ on $k$ copies of a fixed region, let $L = - log rho$ on its support and let $F$ denote the logarithm of its Specht dimension. Lemma 16(5) gives

#[#set math.equation(numbering: n => "(8.11)")
 $ F lt.eq L \, #h(2em) \[ F \, L \] = 0 \, #h(2em) "Tr" rho thin e^(b \( L - F \)) lt.eq "poly" \( k \) \, quad 0 lt.eq b lt.eq 1 . $ <comparator:label-remainder>]

For an iid marginal satisfying (8.5), it follows that

#[#set math.equation(numbering: n => "(8.12)")
 $ log bb(E) exp { plus.minus u \( F_Q - k S \( Q \) \) } lt.eq C k cal(B) u^2 + O \( log \( k + 1 \) \) \, #h(2em) 0 lt.eq u lt.eq c \/ sqrt(cal(B)) . $ <comparator:signed-label-moments>]

For the positive sign use $F_Q lt.eq L$ and the iid moment bound. For the negative sign apply Cauchy–Schwarz to $e^(- u \( L - k S \( Q \) \)) e^(u \( L - F_Q \))$, using the moment bound at $- 2 u$ and (8.11) at $2 u$. Shrinking $c$ ensures both conditions. Only the $O \( log \( k + 1 \) \)$ term has fixed-system dependence.

Choose Schmidt vectors so that

$ tilde(Omega) = sum_i sqrt(p_i) thin \| i chevron.r_X \| w_i chevron.r \, #h(2em) psi = sum_(i in E) sqrt(p'_i) thin \| i chevron.r_R \| w_i chevron.r . $

Thus $psi$ is the normalized typical truncation with $X$ relabeled as $R$. Define the vector and projection used to pin the target:

$ B_(X C) = 1 / sqrt(d_(*)) sum_(i in E) \| i chevron.r_X \| i chevron.r_C \, #h(2em) upright("post")_k = B_(X C)^(⊗ k) ⊗ psi^(⊗ k) \, $

and let $sans(P)$ project $\( X C \)^(⊗ k)$ onto $B_(X C)^(⊗ k)$. The auxiliary label must have at least inverse polynomial probability in $upright("post")_k$. We therefore select it using $psi$, then impose it on the initial auxiliary pair. Its initial probability need only be nonzero; the prevector remains unnormalized.

In $psi^(⊗ k)$, the iid surprisal on $R$ is $k S' + o \( k \)$ in probability. For instance, at fixed system Chebyshev’s inequality gives a window of width $k^(3 \/ 4)$. By (8.11), the difference between that surprisal and $F_R$ exceeds $k^(3 \/ 4)$ with probability at most $"poly" \( k \) e^(- k^(3 \/ 4) \/ 2)$. The number of labels is polynomial. Consequently one can select $lambda_k$ such that

#[#set math.equation(numbering: n => "(8.13)")
 $ q_k := parallel pi_R^(lambda_k) psi^(⊗ k) parallel^2 gt.eq "poly" \( k \)^(- 1) \, #h(2em) log d_(lambda_k) = k S' + o \( k \) . $ <comparator:high-label>]

The same label has positive probability on the initial uniform pair: every label allowed for $d_(*)$ occurs in the tensor power of a full-rank maximally mixed density. This proves that (8.7) is nonzero. Its physical part is unchanged by the auxiliary projection, so it is an exact mean-energy eigenvector. On the repeated uniform pair, the $C$ and $R$ labels agree. Each metric preserves these two labels: a central permutation operator on an auxiliary system commutes with the simultaneous permutations on a larger region containing it. The tree preserves them as well.

The pinning calculation in one copy, and then in $k$ copies, gives

#[#set math.equation(numbering: n => "(8.14)")
 $ sans(P) upright("pre")_k = (sqrt(z) / d_(*))^k pi_R^(lambda_k) upright("post")_k . $ <comparator:bell-pin>]

The projector $sans(P)$ commutes with all metrics: $X C$ is contained in every $P_(j \, g)$, and the repeated vector $B_(X C)^(⊗ k)$ is invariant under simultaneous permutations on $X C$. In (8.14) the label projector is on $R$, disjoint from the pin. Therefore

#[#set math.equation(numbering: n => "(8.15)")
 $ N^2 gt.eq (z / d_(*)^2)^k parallel cal(M)^(- s) pi_R^(lambda_k) upright("post")_k parallel^2 . $ <comparator:pin-norm>]

On the pinned symmetric range, the $P_(j \, g)$ label is the $U_(j \, g)$ label. By complementarity the $F_(j \, g)$ label is that of $U_(j \, g) Y_(j \, g)$. Because the same label function defines all $W_Q$, restriction of the metric is exactly

#[#set math.equation(numbering: n => "(8.16)")
 $ tilde(A)_(j \, g) = \( W_(U_(j \, g))^(- 1) W_(U_(j \, g) Y_(j \, g))^(- 1) W_(Y_(j \, g)) \)^2 \, #h(2em) log tilde(A)_(j \, g) = a \( F_(U_(j \, g)) + F_(U_(j \, g) Y_(j \, g)) - F_(Y_(j \, g)) \) + O \( log \( k + 1 \) \) "id" . $ <comparator:pinned-metric>]

The final error notation means a bound in operator norm; it does not assert that the error is scalar. The restricted tree will be denoted $tilde(cal(M))$, with factors $tilde(cal(M))_g$.

=== 8.2 Upper comparisons <upper-comparisons>

For any physical $B$ disjoint from $X$, tracing the Schmidt truncation gives

#[#set math.equation(numbering: n => "(8.17)")
 $ rho_B = z rho_(psi \, B) + \( 1 - z \) rho_(upright("rem") \, B) \, #h(2em) rho_(psi \, B) lt.eq z^(- 1) rho_B \, #h(2em) S \( rho_(psi \, B) \) lt.eq S \( B \) \/ z \, $ <comparator:post-marginal>]

where the remainder is omitted if $z = 1$. The entropy inequality is concavity, with the nonnegative remainder entropy discarded.

For the rough comparison, simultaneously impose the cutoffs

$ F_B lt.eq k \( S \( B \) \/ z + 1 \) \, #h(2em) B in cal(R) \, $

on $upright("post")_k$. These spectral projections commute, since $cal(R)$ is nested. Each failure has exponentially small probability in $k$: under the iid marginal of $psi$, $F_B$ is at most the surprisal, whose one-copy law is bounded on its positive spectrum at this fixed system; exponential Markov and (8.17) then apply. The finite union of failures is still exponentially small. All these projections commute with $pi_R^(lambda_k)$. Their common projection of $pi_R^(lambda_k) upright("post")_k$ therefore has squared norm at least $"poly" \( k \)^(- 1)$ by (8.13). Normalize it to $phi$; then

#[#set math.equation(numbering: n => "(8.18)")
 $ \| chevron.l phi \, pi_R^(lambda_k) upright("post")_k chevron.r \|^2 gt.eq "poly" \( k \)^(- 1) . $ <comparator:rough-overlap>]

If $Q$ is matched to $B$, the nested label inequalities give $F_Q lt.eq F_B + k log dim cal(H)_(B triangle.stroked.t Q)$, in either inclusion direction. The two label operators commute. Thus $phi$ belongs to the spectral range

#[#set math.equation(numbering: n => "(8.19)")
 $ F_Q lt.eq k \( B_(upright("sh")) \/ z + B_(upright("exc")) \) \, #h(2em) Q = U_(j \, g) \, med U_(j \, g) Y_(j \, g) . $ <comparator:actual-cutoffs>]

An actual label need only commute with its matched cutoff to obtain this conclusion; no commutation with every imposed cutoff is being assumed. Within any one product leaf, all the labels in (8.16) commute by (8.1). Dropping the negative labels therefore gives

$ chevron.l phi \, product_g tilde(A)_(j \, g) phi chevron.r lt.eq "poly" \( k \) exp { 2 k a K \( B_(upright("sh")) \/ z + B_(upright("exc")) \) } . $

Equation (7.3), iterated through the tree, gives the same bound for $chevron.l phi \, tilde(cal(M)) phi chevron.r$. Since $2 s lt.eq 1$, another scalar Jensen inequality bounds the expectation of $tilde(cal(M))^(2 s)$ by the $2 s$ power of its expectation. Cauchy–Schwarz in (8.18), applied to $tilde(cal(M))^s phi$ and $tilde(cal(M))^(- s) pi_R^(lambda_k) upright("post")_k$, now proves (8.8) using (8.15).

For the sharp bound, instead normalize $pi_R^(lambda_k) upright("post")_k$ itself to a vector $hat(psi)_k$. Scalar Jensen for the exponential gives

$ parallel tilde(cal(M))^(- s) pi_R^(lambda_k) upright("post")_k parallel^2 gt.eq q_k exp { - 2 s chevron.l hat(psi)_k \, log tilde(cal(M)) thin hat(psi)_k chevron.r } . $

Split the logarithm into the commuting band factors. On each band, log Jensen, commutation with the auxiliary sector, and vector mean Jensen give

#[#set math.equation(numbering: n => "(8.20)")
 $ chevron.l hat(psi)_k \, log tilde(cal(M))_g hat(psi)_k chevron.r & lt.eq log chevron.l hat(psi)_k \, tilde(cal(M))_g hat(psi)_k chevron.r\
 & lt.eq O \( log \( k + 1 \) \) + sum_j w_j log chevron.l upright("post")_k \, tilde(A)_(j \, g) upright("post")_k chevron.r . $ <comparator:sharp-jensen>]

The conditioning cost is only $- log q_k = O \( log \( k + 1 \) \)$. For a leaf expectation in (8.20), use (8.16) and scalar Hölder with powers three on its three commuting signed label exponentials. Each corresponding post marginal is bounded by $z^(- k) rho_Q^(⊗ k)$, by (8.17). Apply (8.12) at $3 a$. The result is

$ log chevron.l upright("post")_k \, tilde(A)_(j \, g) upright("post")_k chevron.r lt.eq k a g_(j \, g)^(upright("post")) + C k a^2 cal(B) + k \| log z \| + O \( log \( k + 1 \) \) . $

Together with the pin norm this proves (8.9).

=== 8.3 The inverse metric on copies near the ground state <the-inverse-metric-on-copies-near-the-ground-state>

We next prove the lower comparison. The gap first bounds the vector’s mass outside a subspace with few excited physical copies. On that subspace we will bound the compression of each inverse metric; this will give an operator lower bound that can pass through the mean tree. Let $Q_i = "id" - \| tilde(Omega) chevron.r chevron.l tilde(Omega) \|$ on physical copy $i$. On the symmetric space with the two fixed auxiliary labels, let $Pi$ project onto $sum_i Q_i lt.eq tau k$. The full physical gap gives

#[#set math.equation(numbering: n => "(8.21)")
 $ overline(tilde(H)) - tilde(E)_0 "id" gt.eq tilde(g) / k sum_i Q_i \, #h(2em) chevron.l v \, Pi v chevron.r gt.eq 1 - E_(upright("def")) \/ tau . $ <comparator:defect-mass>]

The projection is compatible with symmetry and the auxiliary sectors because the defect count acts on physical copies only and is invariant under simultaneous copy permutations.

Fix a unit vector $u$ in the range of $Pi$. For a subset $B subset.eq { 1 \, dots.h \, k }$, let $u_B$ be its component with precisely the physical copies in $B$ excited. Then

$ u = sum_(\| B \| lt.eq tau k) u_B \, #h(2em) sum_B parallel u_B parallel^2 = 1 . $

In estimates for normalized components, omit the terms with $u_B = 0$. For $r = \| B \|$, $u_B$ is invariant under simultaneous permutations separately on the $k' = k - r$ good copies and the $r$ bad copies. It factors as $tilde(Omega)^(⊗ k')$ on the good physical factors, tensored with a vector on the remaining factors. Each $u_B$ still has the two whole-copy auxiliary labels $lambda_k$.

We first compare metrics on the full copy space, before evaluating on these components. Extend a band metric there by its disjoint $W$ formula. For any region $Q$, its whole label and its two subgroup labels commute. On a compatible triple,

#[#set math.equation(numbering: n => "(8.22)")
 $ F_Q^(upright("good")) + F_Q^(upright("bad")) lt.eq F_Q^(upright("whole")) lt.eq F_Q^(upright("good")) + F_Q^(upright("bad")) + log binom(k, r) . $ <comparator:restriction-dimensions>]

The first inequality is inclusion of a subgroup irreducible; the second holds because its coset translates span the whole irreducible. These are the subgroup dimension inequalities from Lemma 16. For the three disjoint regions $P \, Y \, F$, all labels needed in this comparison commute. With $G = F_P + F_F - F_Y$, the logarithmic approximation of the $W$ metrics yields the operator inequality

#[#set math.equation(numbering: n => "(8.23)")
 $ A_(j \, g)^(- 1) lt.eq "poly" \( k \) binom(k, r)^(C a) exp { - a G^(upright("good")) - a G^(upright("bad")) } . $ <comparator:whole-inverse>]

This step does not commute an individual physical-position projector through $A_(j \, g)$. Such a commutation would generally be false.

On the bad group, simultaneous symmetry implies $G^(upright("bad")) gt.eq 0$ on the measured support. It may be discarded in the expectation of (8.23); the good factors preserve that support because they act on disjoint copies. For each auxiliary system, (8.22) and its whole label give, on $u_B$,

#[#set math.equation(numbering: n => "(8.24)")
 $ F_C^(upright("good")) \, med F_R^(upright("good")) gt.eq k S' - r log d_(*) - log binom(k, r) - o \( k \) . $ <comparator:good-auxiliary>]

Indeed a bad-group Specht dimension is at most $d_(*)^r$, and (8.13) controls the whole label.

The good copies therefore retain both large auxiliary labels. To bound the inverse metric on each component, we now compare the combined physical–auxiliary labels with their separate labels. The physical factors will supply exact iid moments, and the loss from combining labels will have exponential moments bounded by polynomials in $k$. Suppress the good-group superscript for the next calculation and write $Q = X U_(j \, g)$, $V = V_(j \, g)$, $Y = Y_(j \, g)$. Define the merge deficits

$ D_C = F_Q + F_C - F_(Q C) \, #h(2em) D_R = F_V + F_R - F_(V R) \, #h(2em) G_(upright("phys")) = F_Q + F_V - F_Y . $

All these operators, as well as $F_C \, F_R$, commute. The deficits are nonnegative by the tensor-product dimension inequalities, and

#[#set math.equation(numbering: n => "(8.25)")
 $ G^(upright("good")) = G_(upright("phys")) + F_C + F_R - D_C - D_R . $ <comparator:merge-decomposition>]

The physical good copies are symmetric, so they lie in the spectral projection $sans(J) = upright(bold(1))_(\[ 0 \, oo \)) \( G_(upright("phys")) \)$. The projection $sans(J)$ commutes with both merge deficits: physical central labels commute with the larger-region simultaneous permutations which define the merged labels. Consequently it continues to enforce $G_(upright("phys")) gt.eq 0$ while the other commuting factors are measured. We use this compatible-physical-label projection, not an assertion that the full physical symmetric subspace is preserved by a merge.

We need dimension-independent exponential rates for the deficits. In a normalized component $u_B$, the marginal on $Q \, C$ is the tensor product of the iid physical marginal on $Q$ and a permutation-invariant auxiliary marginal on $C$. Conditional on their labels $gamma \, beta$, the two Specht factors are independent and maximally mixed. If $nu$ is their combined label, its conditional probability is

$ m_(gamma \, beta)^nu frac(d_nu, d_gamma d_beta) . $

Here the multiplicity $m_(gamma \, beta)^nu$ is polynomial in $k$ at fixed dimensions. To see this, embed one copy of $\[ gamma \] ⊗ \[ beta \]$ into $\( Q C \)^(⊗ k')$ by choosing vectors in the separate multiplicity spaces. Its multiplicity of $\[ nu \]$ cannot exceed the dimension of the combined multiplicity space, which is polynomial by Schur–Weyl decomposition. Thus, for $0 lt.eq b lt.eq 1$,

#[#set math.equation(numbering: n => "(8.26)")
 $ bb(E)_(u_B \/ parallel u_B parallel) e^(b D_C) lt.eq "poly" \( k \) \, #h(2em) bb(E)_(u_B \/ parallel u_B parallel) e^(b D_R) lt.eq "poly" \( k \) . $ <comparator:merge-moments>]

For example the conditional sum is $sum_nu m_(gamma \, beta)^nu \( d_nu \/ \( d_gamma d_beta \) \)^(1 - b) lt.eq sum_nu m_(gamma \, beta)^nu$. No iid hypothesis on the auxiliary marginal is used. Its permutation invariance follows by tracing the other factors from the good-group symmetric component.

For the rough estimate, use $sans(J)$ to discard $e^(- a G_(upright("phys")))$, and use Cauchy–Schwarz on $e^(a D_C) e^(a D_R)$ with (8.26). For the sharp estimate, use scalar Hölder with powers five on these two factors and the three factors $e^(- a F_Q) \, e^(- a F_V) \, e^(a F_Y)$. Their physical moments are evaluated in the exact iid state $tilde(Omega)^(⊗ k')$; apply (8.12). Choosing $a_0$ and $c$ small ensures that all fivefold moments and the negative-sign doubling in that estimate are allowed. Combining with (8.24) gives

#[#set math.equation(numbering: n => "(8.27)")
 $ frac(chevron.l u_B \, A_(j \, g)^(- 1) u_B chevron.r, parallel u_B parallel^2) lt.eq "poly" \( k \) exp { - 2 k a S' - \( k - r \) a g_(j \, g)^(upright("pre")) + 2 a r log d_(*) + C a log binom(k, r) + C k a^2 cal(B) + o \( k \) } . $ <comparator:component-inverse>]

For the rough estimate omit both the $g^(upright("pre"))$ and $a^2 cal(B)$ terms. The entropy $g_(j \, g)^(upright("pre"))$ is nonnegative because physical purity gives $S \( Y \) = S \( Q V \) lt.eq S \( Q \) + S \( V \)$.

There are at most $\( k + 1 \) e^(k h \( tau \))$ subsets with $r lt.eq tau k$, and $log binom(k, r) lt.eq k h \( tau \)$. Cauchy–Schwarz for $A_(j \, g)^(- 1 \/ 2) sum_B u_B$, followed by (8.27), proves

#[#set math.equation(numbering: n => "(8.28)")
 $ Pi A_(j \, g)^(- 1) Pi lt.eq exp { - k a L_(j \, g) + o \( k \) } Pi \, quad L_(j \, g) = 2 S' + \( 1 - tau \) g_(j \, g)^(upright("pre")) - C (tau log d_(*) + frac(h \( tau \), a) + a cal(B)) . $ <comparator:inverse-compression>]

In the rough version set $g^(upright("pre")) = 0$ and omit $a cal(B)$. The factor counting subsets is precisely the source of $h \( tau \) \/ a$. Taking the operator norm of $A_(j \, g)^(- 1 \/ 2) Pi$ shows that (8.28) is equivalent to the useful lower pin

#[#set math.equation(numbering: n => "(8.29)")
 $ A_(j \, g) gt.eq exp { k a L_(j \, g) - o \( k \) } Pi . $ <comparator:lower-pin>]

For instance, apply the norm bound for $Pi A_(j \, g)^(- 1 \/ 2)$ to $A_(j \, g)^(1 \/ 2) x$ to get the quadratic-form inequality for every $x$. No commutation of $A_(j \, g)$ with $Pi$ is required.

=== 8.4 Passing the lower pin through the tree <passing-the-lower-pin-through-the-tree>

The individual lower pins must be combined with the floor on the whole symmetric space before logarithms are taken. For a common polynomial $p \( k \)$, all the finitely many leaves satisfy $A_(j \, g) gt.eq p \( k \)^(- 1) "id"$ there. This follows from $F_Y lt.eq F_P + F_F$ on simultaneous symmetry and the logarithmic metric approximation. Restrict throughout to the common auxiliary sector and put $b_0 = \( 2 p \( k \) \)^(- 1)$. Averaging the floor and (8.29) yields

$ A_(j \, g) gt.eq b_0 \( "id" - Pi \) + b_(j \, g) Pi \, #h(2em) b_(j \, g) = b_0 + 1 / 2 exp { k a L_(j \, g) - o \( k \) } . $

The right sides all commute with each other. Mean monotonicity and scalar homogeneity therefore give

$ cal(M)_g gt.eq b_0 \( "id" - Pi \) + e^(ell_g) Pi \, #h(2em) ell_g = sum_j w_j log b_(j \, g) . $

Uniformly in the probabilities,

$ ell_g gt.eq k a sum_j w_j L_(j \, g) - o \( k \) \, #h(2em) 0 lt.eq ell_g - log b_0 lt.eq k a max_j \( L_(j \, g) \)_(+) + o \( k \) . $

Log monotonicity and (8.21) now imply

#[#set math.equation(numbering: n => "(8.30)")
 $ chevron.l v \, log cal(M)_g thin v chevron.r gt.eq k a [sum_j w_j L_(j \, g) - E_(upright("def")) / tau max_j \( L_(j \, g) \)_(+)] - o \( k \) . $ <comparator:tree-log-lower>]

One may first use $min \( 1 \, E_(upright("def")) \/ tau \)$ in the error, which also makes its uniformity in the state immediate, and then weaken to the displayed expression. In the rough case $max_j \( L_(j \, g) \)_(+) lt.eq 2 S'$; in the sharp case it is at most $2 S' + g_max$.

Finally,

$ N^2 chevron.l v \, cal(M)^(2 s) v chevron.r = parallel upright("pre")_k parallel^2 lt.eq 1 \, #h(2em) - log N^2 gt.eq log chevron.l v \, cal(M)^(2 s) v chevron.r gt.eq 2 s chevron.l v \, log cal(M) thin v chevron.r . $

Since $log cal(M) = sum_g log cal(M)_g$, summing (8.30) proves (8.8) and (8.9).

To finish, physical purity gives $S \( X V \) = S \( U Y \)$ and $S \( X Y V \) = S \( U \)$. Expanding the two mutual informations on the right of (8.10) proves that identity. The comparison is therefore complete: its rough form discounts the target entropy, while its sharp form bounds the target’s mutual information with the physical far systems.

All estimates above use maxima over finitely many statuses, fixed-dimension Schur polynomial bounds, and the single sequence of labels (8.13). The norm estimates for the defect components are uniform in their auxiliary states. Jensen and mean monotonicity introduce no inverse terminal probability. Consequently the replica errors are uniform in all terminal probabilities, including at zero weights by omitting those branches. This also permits a later choice of a different tree interpolation point for each $k$, followed by the limit $k arrow.r oo$ at the fixed finite physical system.

== 9 Scanning collars and improving the entropy bound <sec:scanner>

The preceding estimates compare the entropy gained by moving a small set across a partition with the energy cost of changing its metric. We now construct a finite schedule of such moves. Random initial offsets make any fixed interaction unlikely to cross a moving boundary; random choices of local moves give each crossing interaction a chance to be moved in full. Together these two features produce a small-energy interpolation. The rough norm comparison then improves the safe-box exponent, and the sharp comparison gives a sublinear mutual-information bound across a collar.

Fix the cut $A$, and write $Z$ for its crossing-edge endpoints. Throughout this section, depth means ambient integer sup-norm distance. Interaction supports and their truncations still use the graph metric of $Lambda$. In particular, a depth row is a set of sites at a fixed distance from the target, and need not be a horizontal lattice row.

=== 9.1 The moving partitions <the-moving-partitions>

Let $T subset bb(Z)^2$ be a finite ambient target. Write $T_j = T + \[ - j \, j \]_(bb(Z))^2$, $Q_j = A ∩ \( T_j \\ T \)$, and $X = A ∩ T$, and suppose $X eq.not diameter$. A useful example is a safe integer rectangle of maximal side length $s_0$: depth rows in a collar of width at most $s_0$ contain $O \( s_0 \)$ sites, so the row scale can be a fixed multiple of $s_0$. The safe-box estimate bounds its core entropy; covering a sufficiently narrow shell by safe squares gives the shell entropy input. We give this verification, and its extension to the polygonal unions needed by the final tiling, after deriving the general scanner estimate.

At an integer scale $n gt.eq 2$, choose

#[#set math.equation(numbering: n => "(9.1)")
 $ L = floor.l n^(1 - ell) floor.r \, quad m = floor.l n^mu floor.r \, quad K = floor.l L \/ \( 8 m \) floor.r \, quad D = ceil.l n^kappa ceil.r \, quad a = W \/ K \, $ <scanner:scales>]

where $0 < ell < 1$, $0 < kappa < mu < 1 - ell$, and $W gt.eq 1$. We work at large enough $n$ that $K gt.eq 1$. Assume

#[#set math.equation(numbering: n => "(9.2)")
 $ \| T \| lt.eq C n^2 \, #h(2em) \| T_j \\ T_(j - 1) \| lt.eq n quad \( 1 lt.eq j lt.eq L \) \, #h(2em) "dist"_oo \( T \, Z \) > 2 L + 10 r_0 \, $ <scanner:test-geometry>]

where $r_0 = ceil.l C log^2 n ceil.r$ is chosen as in Proposition 12. Increasing its constant fixes the truncation error at $n^(- 1000)$. We require $n$ large enough that $r_0 lt.double D lt.double m lt.double L$. The compact set used for that proposition is $S_0 = A ∩ T_L$; it has $O \( n^2 \)$ sites. Denote the resulting Hamiltonian, exact ground vector, ground energy, and spectral gap by $tilde(H) \, tilde(Omega) \, tilde(E)_0$, and $tilde(g)$, respectively. Write $tilde(h)_i$ for its terms and $tilde(X)_i$ for their designated supports, as in that proposition. In particular $tilde(E)_0 lt.eq n^(- 1000)$ and $tilde(g) gt.eq g \/ 2$. The target cut has $O \( n \)$ edges: an ambient edge leaving $T$ has its outside endpoint in the first positive-depth row, and the clearance excludes edges from $X$ to $Lambda \\ A$. This observation will control the target’s marginal spectrum even for these general targets.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Parameter
], table.cell(rowspan: 1, colspan: 1)[Role in the scan
]),
  table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[Number of padded slots in a depth row
],
  table.cell(rowspan: 1, colspan: 1)[$L$
], table.cell(rowspan: 1, colspan: 1)[Total collar depth
],
  table.cell(rowspan: 1, colspan: 1)[$m$
], table.cell(rowspan: 1, colspan: 1)[Window scale and number of possible offsets
],
  table.cell(rowspan: 1, colspan: 1)[$K$
], table.cell(rowspan: 1, colspan: 1)[Number of separated bands
],
  table.cell(rowspan: 1, colspan: 1)[$D$
], table.cell(rowspan: 1, colspan: 1)[Charge lookahead in depth
],
  table.cell(rowspan: 1, colspan: 1)[$r_0$
], table.cell(rowspan: 1, colspan: 1)[Graph radius of every splitting support
],
  table.cell(rowspan: 1, colspan: 1)[$a \, med W = a K$
], table.cell(rowspan: 1, colspan: 1)[Per-band and total scalar metric weights
],
)
]

The scalar $W$ is distinct from the subsystem operators $W_(Q \, k)$.

Order the sites of each positive-depth row, and pad that order to exactly $n$ slots. An absent site or a site outside $A$ is a blank for the scan. The order of these slots will remain fixed. For band $g' = 0 \, dots.h \, K - 1$, put $b_(g') = 8 g' m$, and choose an independent uniform offset $r_(g') in { 0 \, dots.h \, m - 1 }$. Its initial physical partition is

$ P_0 & = { x in A : "dist"_oo \( x \, T \) lt.eq b_(g') + m + r_(g') } = X U \,\
V & = \( Lambda \\ A \) union { x in A : "dist"_oo \( x \, T \) > b_(g') + 5 m + r_(g') } \,\
Y & = Lambda \\ \( P_0 union V \) . $

The two auxiliary systems of Proposition 24, denoted here by $C$ and $R$, give the full partition $P = C P_0$, $Y$, $F = R V$. Every band uses the same auxiliary systems, but has its own evolving physical partition.

There are two kinds of rounds. A #emph[fill] advances a nominal front according to a fixed schedule. A #emph[charge] chooses an interaction and attempts to move the entire unassigned part of its designated support. The random choices specify the weights of a finite history tree; the metric construction below uses the whole tree.

There are $n m$ fill rounds and $n m$ charge rounds, interleaved, with a fill first. A round performs one transition in every band. At fill rounds the receiving side alternates between the near and far sides. Its schedule consumes one slot of the original middle window, in increasing depth for the near side and decreasing depth for the far side. Within a row use its fixed order, reversed on the far side if necessary. If the slot is a site still in $Y$, move it to the receiving side. Consume the slot also when it is blank or was already assigned. In particular, a charge never changes the fill schedule.

For the near side use oriented depth $lambda = "dist"_oo \( dot.op \, T \)$, and for the far side use $lambda = - "dist"_oo \( dot.op \, T \)$. If $t_P \, t_F$ are the numbers of fills already assigned to the respective sides, their next incomplete row depths are

#[#set math.equation(numbering: n => "(9.3)")
 $ j_P = b_(g') + m + r_(g') + 1 + floor.l t_P \/ n floor.r \, #h(2em) j_F = - \( b_(g') + 5 m + r_(g') \) + floor.l t_F \/ n floor.r . $ <scanner:fronts>]

At a charge round choose a uniform side. On that side form the list of labelled term anchors with oriented depth in $\[ j - r_0 \, j + D \]$, counting anchor multiplicity, and pad it to a fixed integer $M_n = ceil.l C_1 n D ceil.r$. Here $C_1$ is a uniform constant large enough for every such list. Choose a uniform slot of this list. If its graph $r_0$-ball meets both the receiving physical side and $Y$, move all sites of that ball which remain in $Y$ to the side. Otherwise make no move. The choices are conditionally independent across bands. The band margins ensure that every unsigned depth appearing in these lists is between 1 and $L$.

The two probabilities needed later have different roles. Initial offsets will bound the probability that a fixed term splits by $O \( D \/ m \)$. Except on rare histories, a charge will select each term currently split with probability at least $c \/ \( n D \)$. The deterministic fill schedule is essential to both estimates: a charge never changes a nominal front. Figure 2 shows the nominal partitions and the possible lead of the charged sites.

A history records the offsets and all choices already made. Its probability is the classical path probability, before transporting any replica state. At each round form the conditional binary mean trees of the new choices and interpolate every old leaf by the same parameter $p in \[ 0 \, 1 \]$, as in Proposition 23. At $p = 1$ attach the choice trees to the history tree and proceed to the next round. The parameter $p$ is common to all old histories and all bands in that round. This gives the root metric $cal(M)$, the norm $N$, and the normalized replica vector $v$ used in the preceding two sections.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 1.25), (0.747, 1.9), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.747, 1.25), (2.656, 1.9), fill: rgb("#e0f0e0"), stroke: none)
  rect((2.656, 1.25), (5.146, 1.9), fill: rgb("#ffffc7"), stroke: none)
  rect((5.146, 1.25), (10.79, 1.9), fill: rgb("#ececec"), stroke: none)
  rect((0, 1.25), (10.79, 1.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.747, 1.25), (0.747, 1.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.656, 1.17), (2.656, 2.08), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.146, 1.17), (5.146, 2.08), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((2.656, 1.25), (3.112, 1.9), fill: black, stroke: none)
  rect((4.689, 1.25), (5.146, 1.9), fill: black, stroke: none)
  content((0.3735, 1.575), [#text(size: 9pt)[$X$]])
  content((1.702, 1.575), [#text(size: 9pt)[$U$]])
  content((3.901, 1.575), [#text(size: 9pt)[$Y$]])
  content((7.968, 1.575), [#text(size: 9pt)[$V$]])
  content((-0.1245, 1.575), [#text(size: 9pt)[band $g$]], anchor: "east", padding: 0.1176cm)
  line((2.656, 2.05), (3.403, 2.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.146, 2.05), (4.399, 2.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  rect((0, 0), (0.747, 0.65), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.747, 0), (6.723, 0.65), fill: rgb("#e0f0e0"), stroke: none)
  rect((6.723, 0), (9.213, 0.65), fill: rgb("#ffffc7"), stroke: none)
  rect((9.213, 0), (10.79, 0.65), fill: rgb("#ececec"), stroke: none)
  rect((0, 0), (10.79, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.747, 0), (0.747, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((6.723, -0.08), (6.723, 0.83), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((9.213, -0.08), (9.213, 0.83), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((6.723, 0), (7.179, 0.65), fill: black, stroke: none)
  rect((8.756, 0), (9.213, 0.65), fill: black, stroke: none)
  content((0.3735, 0.325), [#text(size: 9pt)[$X$]])
  content((3.735, 0.325), [#text(size: 9pt)[$U$]])
  content((7.968, 0.325), [#text(size: 9pt)[$Y$]])
  content((10, 0.325), [#text(size: 9pt)[$V$]])
  content((-0.1245, 0.325), [#text(size: 9pt)[band $g+1$]], anchor: "east", padding: 0.1176cm)
  line((6.723, 0.8), (7.47, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((9.213, 0.8), (8.466, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.656, 2.35), (3.112, 2.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2.884, 2.35), [#text(size: 9pt)[$D+O(r_0)$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.5), (10.79, -0.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((10.79, -0.5), [#text(size: 9pt)[depth]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: Schematic nominal depth partitions in two bands, not to scale. The horizontal coordinate records distance from the target, not a physical lattice direction. Dashed lines are the nominal fronts, and arrows show the fill directions. Charges may have assigned individual sites in the hatched intervals, so the actual sets $U \, Y \, V$ need not be depth intervals. The separated windows ensure that one support cannot split two bands. Every site of $Lambda \\ A$ also belongs to $V$ in each band. Auxiliary systems are not shown. ],
) <scanner:figure>

#thm([Lemma 9.1.])[
  (Geometry and probabilities of the scan).  #emph[Under (9.1)–(9.2), the preceding construction has the following properties for all sufficiently large $n$.]
  + #emph[Every splitting designated support is a graph $r_0$-ball wholly inside $A$. It splits at most one band, and there it meets $Y$ and exactly one of the two sides. The metric algebras generated by all statuses of distinct bands commute on the symmetric replica space.]
  + #emph[Every assigned site of $A$ has oriented depth at most $j + D + r_0$ on its side. Each actual set $U$ or $U Y$ is comparable by inclusion with a deterministic positive-depth prefix, and differs from that prefix by at most $C n D$ sites. The cuts of $U \, U Y \, Y \, P_0 \, V$ have at most $C n D$ edges. At most $C K n D$ terms split in any joint status.]
  + #emph[For every labelled term $i$, every round, and every common $p$, the sum of the full terminal-leaf probabilities on which it splits is at most $C D \/ m$.]
  + #emph[An old history is called good if no side has an assigned site of $A$ of oriented depth greater than $j + D \/ 2$. For every fixed $M > 0$, the probability of a history failing this condition at any time is at most $n^(- M)$, for sufficiently large $n$. At a charge round on a good old history, each split term is sampled on its splitting side with probability at least $c \/ \( n D \)$.]
  #emph[All probabilities here are the classical path probabilities of the history tree, before the transport of replica states.]
] <scanner:histories>

#proof[
  #strong[Deterministic geometry and nesting.] A truncated support meeting $S_0$ has radius $r_0$: when its anchor is at distance $d > 2 r_0$, the alternative radius $floor.l d \/ 2 floor.r$ cannot reach $S_0$. Every splitting support meets a compact part contained in $S_0$, so this observation applies. If an $r_0$-ball meeting $S_0$ also contained a site of $Lambda \\ A$, a graph path inside the ball would contain a cut edge with an endpoint at ambient distance at most $L + 2 r_0$ from $T$. This contradicts (9.2).
  At a charge the largest newly assigned oriented depth is at most $j + D + r_0$; subsequent movement of the nominal front only improves this bound. Each side receives at most $ceil.l n m \/ 2 ceil.r$ fills, so advances through at most $m \/ 2 + O \( 1 \)$ deterministic rows. Its charged lead is $D + O \( r_0 \) = o \( m \)$. The two fronts in a window remain separated by order $m$, as do the active regions of successive windows. This proves both that an opposite side cannot have consumed a scheduled slot and that a support cannot split two fronts. All nonblank slots strictly behind a nominal front have been assigned to that side.
  A near set contains its completed deterministic prefix and is contained in the prefix ending at its maximal allowed lead. The difference has at most $C n D$ sites. For $U Y$, take the complement of the assigned far suffix within the original shell prefix: it is contained in the deterministic prefix ending at the nominal far front and differs from it only in $O \( D \)$ rows. These deterministic comparison prefixes are all prefixes of one fixed ordered list of positive-depth slots and are consequently nested, even across histories and bands.
  A full depth prefix has $O \( n \)$ boundary edges. For its outer boundary at positive depth, use the last included row, since depth changes by at most one along an edge. For the boundary at depth zero, use the first positive row. Partial rows cost at most $4 n$ more edges. There are no compact-to-opposite-color edges, by the clearance. Changing at most $C n D$ sites then gives the claimed $O \( n D \)$ bound for all status cuts and their differences. Split anchors themselves lie in $O \( D \)$ rows around the nominal fronts, containing $O \( n D \)$ anchors per band. Summing gives $C K n D$.
  For two bands $g' < g''$, the entire near side together with the middle of the first band is contained in the near side of the second band, for every pair of histories. After adjoining $C$, this says $P_(g') Y_(g') subset P_(g'')$. Mirror the central function on $F_(g')$ to its complement $P_(g') Y_(g')$, using Lemma 16. The resulting functions from the first band commute with those of the second: they are disjoint from its $Y \, F$ parts and invariant under the joint permutations whose center acts on its $P$ part. This proves the asserted cross-band commutation.
  #strong[Dilution by the initial offsets.] For a fixed anchor to split, its oriented depth must lie between $j - O \( r_0 \)$ and $j + D + O \( r_0 \)$. Both formulas in (9.3) are affine, with coefficient $1$ or $- 1$, in the initial uniform offset. Thus only $O \( D \)$ of the $m$ offsets can permit this event, and only $O \( 1 \)$ bands can reach the fixed anchor. This proves $C D \/ m$ separately for the old and new leaf distributions, and hence also for their common-$p$ mixture. It does not require conditional independence of the split event and the later charge choices.
  #strong[Charge ancestry and availability.] We finally bound the probability that charged sites get too far ahead of a nominal front. This will ensure that every old split lies in the charge list. Suppose a side has an assigned site of $A$ leading its nominal front by more than $D \/ 2$. Trace the site’s first assignment backwards through the charge ball that assigned it, choosing a previously assigned same-side site in that ball, until an initial or deterministic assignment is reached. An ancestry with $j'$ charges changes oriented depth by at most $2 r_0 j'$. If its first charge is at time $t_1$ and the history is tested at time $t$, then
  $ 2 r_0 j' > D \/ 2 + j \( t \) - j \( t_1 \) - O \( 1 \) . $
  The fixed fill schedule gives $j \( t \) - j \( t_1 \) gt.eq \( t - t_1 \) \/ \( 4 n \) - O \( 1 \)$. Substitution in the preceding inequality yields both
  $ j' gt.eq c D \/ r_0 \, #h(2em) t - t_1 lt.eq C n r_0 j' . $
  Thus all ancestry times lie in this last interval of rounds. All sites in the ancestry are in $A$, including for the far side, because the charging balls are wholly in $A$.
  For a fixed endpoint, test time, and length $j'$, the time choices and spatial choices have at most
  $ binom(ceil.l C n r_0 j' ceil.r, j') \( C r_0^4 \)^(j') $
  possibilities. The spatial bound permits both an anchor and a predecessor within $O \( r_0 \)$ graph distance at each step, and includes the bounded anchor multiplicity. Conditional on earlier choices, a prescribed hit has probability at most $\( c n D \)^(- 1)$. The bound $binom(v, j') lt.eq \( e v \/ j' \)^(j')$ therefore makes the total probability at most
  $ "poly" \( n \) sum_(j' gt.eq c D \/ r_0) \( C r_0^5 \/ D \)^(j') . $
  The endpoints being counted are charged sites in $S_0$, of which there are $O \( n^2 \)$; the numbers of test times and bands are also polynomial in $n$. Thus no far-domain volume enters this factor. Since $r_0$ is polylogarithmic and $D = n^(kappa + o \( 1 \))$, the bound is smaller than every fixed inverse power of $n$.
  On a good old history, a split anchor has oriented depth at least $j - r_0$, because its ball meets an unassigned site, and at most $j + D \/ 2 + r_0$, because it meets the side. For large $n$ this interval lies in the sampling interval $\[ j - r_0 \, j + D \]$. Choosing the relevant side and its labelled slot has probability $1 \/ \( 2 M_n \) gt.eq c \/ \( n D \)$, and the resulting move is exactly the $Y$-part of that designated support. ◻
]

=== 9.2 Selecting a low-energy interpolation <selecting-a-low-energy-interpolation>

The scan provides the nested prefixes required by the norm comparisons and the two probability estimates required by entropy and energy transport. We now combine them to select one low-energy interpolation. The entropy input below concerns the original ground state; the polynomially accurate truncation transfers it to $tilde(Omega)$. No gap for a Hamiltonian restricted to the target or its collar is used.

#thm([Proposition 9.2.])[
  (The scanner estimate).  #emph[Assume (9.1) and (9.2), and let $0 < e < 1$ satisfy $kappa lt.eq e$. Suppose 
#[#set math.equation(numbering: n => "(9.4)")
 $ S_Omega \( X \) lt.eq C_e n^(1 + e) \, #h(2em) S_Omega \( Q_j \) lt.eq C_e \( n L^e + n \) quad \( 0 lt.eq j lt.eq L \) . $ <scanner:entropy-input>]

 Let $epsilon.alt = n^(- nu)$, where $nu > 0$ is fixed, and suppose $a r_0^2$ is sufficiently small. Construct the auxiliary systems, the fixed label sector, and the unnormalized vector $upright("pre")$ as in Proposition 24, using typical width $w = n^(3 \/ 5)$. For each sufficiently large replica count $k$, there are a charge round and a common parameter $p_k in \[ epsilon.alt \/ 2 \, epsilon.alt \]$ at which the normalized vector $v_k = cal(M)^(- s) upright("pre") \/ N$, $s = 1 \/ 4$, has defect energy 
$ E_(upright("def") \, k) = frac(chevron.l v_k \, overline(tilde(H)) v_k chevron.r - tilde(E)_0, tilde(g)) $

 bounded by 
#[#set math.equation(numbering: n => "(9.5)")
 $ E_(upright("def") \, k) lt.eq C n^ell D^2 W^2 \( log n \)^C #scale(x: 120%, y: 120%)[\(] delta_n^(1 \/ 8) + epsilon.alt + n^(- 100) #scale(x: 120%, y: 120%)[\)] + C n^(- 1000) + o_k \( 1 \) \, $ <scanner:energy-output>]

 where 
#[#set math.equation(numbering: n => "(9.6)")
 $ delta_n = C_e epsilon.alt^(- 1) #scale(x: 120%, y: 120%)[\(] n^(e - mu) + a^(1 \/ 4) \( log n \)^C #scale(x: 120%, y: 120%)[\)] . $ <scanner:density-output>]

 Here $overline(tilde(H))$ is the mean of the physical Hamiltonian over the copies. All norm comparisons of Proposition 24 apply at the selected points, with shell entropy bound $B_(upright("sh")) lt.eq C_e \( n L^e + n \)$, mismatch $B_(upright("exc")) lt.eq C n D$, and marginal parameter $cal(B) lt.eq C n D \( log n \)^C$. The sharp comparisons additionally require their stated condition on $a sqrt(cal(B))$.]
  #emph[The entire finite physical system, $n$, the scan, and all auxiliary dimensions are fixed before $k arrow.r oo$. The remainder is uniform over the selected round and parameter, although these may depend on $k$. Constants may depend on the fixed exponents and the input constant $C_e$.]
] <prop:scanner>

#proof[
  The transfer from $Omega$ to $tilde(Omega)$ costs $O \( n^(- 248) \)$ in any entropy in (9.4): the trace distance is $O \( n^(- 500) \)$, and the compact systems have $O \( n^2 \)$ sites, so Lemma 3 applies. A partial last depth row adds at most $n log q$. Lemma 25 then gives the matched-prefix and mismatch bounds required by the comparators. It also gives the $O \( n D \)$ status boundaries. A crossing support has Hilbert dimension at most $q^(C \( 1 + r_0 \)^2)$, and its anchor lies within distance $r_0$ of a cut edge. Consequently the marginal-tail parameter of Lemma 5 is at most $C n D \( log n \)^C$. At the target itself it is at most $C n \( log n \)^C$. The latter bound shows that the width $w = n^(3 \/ 5)$ has failure mass at most $n^(- 100)$ for all sufficiently large $n$. In fact its tail is bounded by $C exp \[ - c n^(1 \/ 10) \/ \( log n \)^C \]$.
  At a charge round write $h$ for an old joint history, of probability $w_h$, and $sigma_(h \, u)$ for its transported state in Proposition 23. Let $mu_sigma$ denote the coherent probability measure of Lemma 19. The entropy derivative uses the old-history weights $w_h$; the same transported states occur in the energy estimate with terminal weights $\( 1 - p \) w_h$. We therefore measure the entropy cost of the old splits by $cal(Q) \( p \)$, defined as
  #[#set math.equation(numbering: n => "(9.7)")
   $ sum_(h med upright("good")) w_h integral_(bb(R)) m_s \( u \) integral sum_(i med upright(s p l i t med i n) med h) eta_(i \, h) \( theta \) thin d mu_(sigma_(h \, u)) \( theta \) thin d u . $ <scanner:Q-definition>]
  Each split term in this sum has a unique splitting band, and its partition $P \, Y \, F$ is understood to be that band’s partition. If term $i$ splits on the near side, its moved set is $x = Y ∩ tilde(X)_i$, the unassigned part of its designated $r_0$-ball, and $eta_(i \, h) = S_theta \( x divides P \) + S_theta \( x divides Y \\ x \)$; on the far side exchange $P \, F$. These quantities are nonnegative. They are also bounded by $C \( log n \)^C$, because the moved sites lie in an $r_0$-ball. The measure $m_s \( u \) thin d u$ has fixed finite mass $2 s$.
  On every good old history each split term is sampled with probability at least $c \/ \( n D \)$, and its sampled move has exactly the corresponding $eta_(i \, h)$. Equation (7.21) therefore gives, at a charge round,
  #[#set math.equation(numbering: n => "(9.8)")
   $ - partial_p log N^2 gt.eq frac(c k a, n D) cal(Q) \( p \) - C k a K a^(1 \/ 4) \( log n \)^C - O_(upright("fixed")) \( log \( k + 2 \) \) . $ <scanner:charge-gain>]
  At fill rounds retain just the same negative error; the entropy gains are nonnegative. Here and below “fixed” means that the complete single-copy instance and the scanner have been fixed. No such constant survives the replica limit.
  Integrate over every full round, including fills. Adjacent endpoint metrics agree by construction, so the left sides telescope. Initially $- log N^2 gt.eq - O_(upright("fixed")) \( log \( k + 2 \) \)$: the floor (6.18) passes to the initial mean tree by Lemma 20, and $parallel upright("pre") parallel lt.eq 1$. At the last endpoint the rough upper comparison (8.8) gives
  $ - k^(- 1) log N^2 lt.eq 2 log d_(*) - log z + C_e W \( n L^e + n D + n \) + o_k \( 1 \) lt.eq C_e W n^(1 + e) + o_k \( 1 \) . $
  For the last inequality use $kappa lt.eq e$, $L lt.eq n$, and $log d_(*) = S_(tilde(Omega)) \( X \) + O \( w + \| log z \| \)$. Restrict the positive charge integrals in (9.8) to $\[ epsilon.alt \/ 2 \, epsilon.alt \]$, but pay the negative errors on all $2 n m$ full rounds. Since $a K = W$, the integrated inequality, normalized by the number of charge rounds, is
  $ frac(1, n m) sum_(upright("charge rounds")) integral_(epsilon.alt \/ 2)^epsilon.alt frac(cal(Q) \( p \), K n D) thin d p lt.eq C_e (n^e / m + a^(1 \/ 4) \( log n \)^C) + o_k \( 1 \) . $
  The interval has length $epsilon.alt \/ 2$, and $m asymp n^mu$. Averaging therefore gives a charge round and a $p_k$ in this interval such that
  #[#set math.equation(numbering: n => "(9.9)")
   $ frac(cal(Q) \( p_k \), K n D) lt.eq delta_n + o_k \( 1 \) . $ <scanner:selected-density>]
  The fixed factor two in the interval length is absorbed into constants. All integrands are bounded at fixed $k$, and continuous in the interior interpolation parameter, so ordinary averaging suffices for this selection.
  Apply the energy estimate (7.22) at this same point. For each term its split weight is at most $C D \/ m$. There are at most $C K n D$ split term occurrences in each joint leaf. On old good leaves the transported states are exactly those in (9.7); their full terminal weight differs only by the factor $1 - p_k lt.eq 1$. Hölder’s inequality, applied to the positive measure over histories, terms, $u$, and $theta$, bounds their sum of $eta^(1 \/ 8)$ by
  $ C K n D #scale(x: 120%, y: 120%)[\(] delta_n + o_k \( 1 \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 8) . $
  On bad old histories use the uniform local dimension bound and Lemma 25 with an arbitrarily large fixed tail power. On all new leaves use the same dimension bound and their total terminal weight $p_k lt.eq epsilon.alt$. After increasing the fixed logarithmic power, the energy estimate is therefore
  $ chevron.l v_k \, overline(tilde(H)) v_k chevron.r lt.eq 2 tilde(E)_0 + C a^2 D / m K n D \( log n \)^C #scale(x: 120%, y: 120%)[\(] delta_n^(1 \/ 8) + epsilon.alt + n^(- 100) #scale(x: 120%, y: 120%)[\)] + o_k \( 1 \) . $
  The factors in this expression have distinct origins: $D \/ m$ is the split probability of one fixed term, $K n D$ counts split occurrences, and $a^2$ is the local skew cost. Their product simplifies to
  $ a^2 D / m K n D = frac(W^2 n D^2, m K) lt.eq C W^2 n^ell D^2 . $
  Subtracting $tilde(E)_0$ and dividing by $tilde(g) gt.eq g \/ 2$ proves (9.5).
  Only splitting terms contribute to this energy error; all others have zero skew exactly. Thus its coefficient contains no total-volume factor. The symbol remainders can be summed over all terms before taking $k arrow.r oo$, because that complete term set is finite and fixed. Their uniformity in replica states and in the interpolation parameter also justifies the possibly $k$-dependent selection in (9.9). ◻
]

=== 9.3 Geometric targets and entropy inputs <geometric-targets-and-entropy-inputs>

We now supply the scanner’s geometric and entropy inputs for unions of rectangles and triangles. These include the geometric targets of the final tiling, whose number of pieces may grow with the scale. The constant $D_0$ and the function $F_(upright("box"))$ are those of Proposition 7. Fix the numerical constant $C_(upright("tpl"))$ large enough to absorb the layer-count constant in the proof below. The entropy bounds will be reused each time the safe-box exponent improves.

#prodef([Definition 9.3.])[
  (A template).  Let $s_0 gt.eq 1$ and $n$ be positive integers. A template with parameters $\( n \, s_0 \)$ is a nonempty finite set $T subset bb(Z)^2$ of the form
  $ T = union.big_(a = 1)^(N_0) \( P_a ∩ bb(Z)^2 \) \, #h(2em) n gt.eq C_(upright("tpl")) N_0 \( s_0 + 1 \) \, #h(2em) "diam"_oo T lt.eq n \, $
  where $N_0 gt.eq 1$ is an integer and each $P_a$ is a closed convex rectangle or triangle of sup-norm diameter at most $s_0$, all of whose sides have slope $0 \, oo \, 1$, or $- 1$. Empty sampled pieces can be omitted. For the fixed cut $A$, the template is separated from the cut if
  $ "dist"_oo \( T \, Z \) > 4 D_0 s_0 . $
  As above, $T_j$ is the ambient integer dilation, $X = A ∩ T$, and $Q_j = A ∩ \( T_j \\ T \)$, for $j gt.eq 0$.
] <scanner:template>

The diameter condition merely fixes a convenient common size parameter. The estimates below use the number and sizes of the pieces, rather than convexity of their union. They therefore allow the disconnected fragments which occur in the later tiling.

#thm([Lemma 9.4.])[
  (Rows, coverings, and shell entropy).  #emph[For $C_(upright("tpl"))$ sufficiently large, a template satisfies 
#[#set math.equation(numbering: n => "(9.10)")
 $ \| T \| lt.eq C n s_0 \, #h(2em) \| T_j \\ T_(j - 1) \| lt.eq n quad \( 1 lt.eq j lt.eq s_0 \) \, #h(2em) \| partial_(bb(Z)^2) T_j \| lt.eq C n quad \( 0 lt.eq j lt.eq s_0 \) . $ <scanner:template-geometry>]

 Suppose it is separated from the cut and, for some $0 < e < 1$, $F_(upright("box")) \( r \) lt.eq C_e r^(1 + e)$ for every integer $r gt.eq 1$. Then, for every integer $1 lt.eq L lt.eq s_0$, 
#[#set math.equation(numbering: n => "(9.11)")
 $ S_Omega \( X \) lt.eq C'_e n s_0^e \, #h(2em) S_Omega \( Q_j \) lt.eq C'_e n L^e quad \( 0 lt.eq j lt.eq L \) . $ <scanner:template-entropy>]

 The same shell bound, with an additional $C n$, holds for any prefix obtained by including all depth rows before one row and an arbitrary subset of that last row. All physical cuts of $X \, Q_j$, and $A ∩ T_j$ have $O \( n \)$ edges.]
] <scanner:templates>

#proof[
  Consider first one sampled piece. On an integer horizontal row its sites form an integer interval. Its left endpoint is a maximum of affine integer-valued functions with slopes in ${ - 1 \, 0 \, 1 }$, and its right endpoint is a minimum of such functions; horizontal sides impose an interval constraint on the row index. To obtain these formulas, round the intercepts of the defining line inequalities. Because the slopes are integers, this rounding is independent of the integer row index. The difference of the lower and upper bounds is convex, so the nonempty rows are consecutive. On consecutive nonempty rows each endpoint moves by at most one. Consecutive row intervals overlap or are adjacent as integer intervals.
  After integer sup-norm dilation by $j$, the interval on a row is the union of the original intervals in the window of rows at distance at most $j$, each extended by $j$ on both ends. This union is still an integer interval. Its endpoints are the sliding minimum and maximum of the old endpoints, minus or plus $j$. They again move by at most one between consecutive nonempty rows: the nonempty index windows at two consecutive rows have Hausdorff distance at most one, and the old endpoint functions are 1-Lipschitz. One more dilation changes each endpoint on an old row by at most two and adds at most two rows, each of length $O \( s_0 + j + 1 \)$. This proves a bound $C \( s_0 + j + 1 \)$ for both the new layer and the edge boundary of one piece. Summing over the pieces proves (9.10), with the layer constant absorbed in $C_(upright("tpl"))$. The area bound follows from $\| P_a ∩ bb(Z)^2 \| lt.eq C \( s_0 + 1 \)^2$.
  We also need a count at intermediate dyadic scales. In the usual dyadic partition of the lattice into integer squares, the number of side-$u$ squares containing both a site of a dilated piece and a site outside it is
  #[#set math.equation(numbering: n => "(9.12)")
   $ O #scale(x: 120%, y: 120%)[\(] \( s_0 + j + 1 \) \/ u + 1 #scale(x: 120%, y: 120%)[\)] \, #h(2em) u gt.eq 1 . $ <scanner:mixed-piece>]
  Indeed, in a block of $u$ consecutive nonempty rows the two endpoints vary by at most $u$. Only constantly many square columns near each endpoint can be mixed. At the first and last blocks count instead the whole width, which costs $O \( \( s_0 + j + 1 \) \/ u + 1 \)$ in total. A square mixed for a union, or for a difference of two unions, must be mixed for at least one of the constituent sets. Thus the corresponding count for $T$, $T_j$, or $T_j \\ T$, with $j lt.eq s_0$, is at most $C \( N_0 + n \/ u \)$.
  Cover $T_j \\ T$ by maximal contained dyadic squares, with side capped at the largest power of two not exceeding $L$. These squares partition the set: a single site is an admissible square, and the dyadic nesting makes distinct maximal squares disjoint. At the cap there are at most $C n \/ L$ squares because $\| T_j \\ T \| lt.eq n j lt.eq n L$. Below the cap, the parent of each maximal square is mixed. Equation (9.12) therefore bounds the number of squares of side $u$ by $C \( N_0 + n \/ u \) lt.eq C n \/ u$, since $u lt.eq L lt.eq s_0$ and $N_0 s_0 lt.eq n$. All these squares are safe: their sites lie in $T_j$, their sides are at most $s_0$, and
  $ "dist"_oo \( T_j \, Z \) gt.eq "dist"_oo \( T \, Z \) - j > 4 D_0 s_0 - s_0 > D_0 s_0 . $
  Subadditivity and the assumed box bound now give
  $ S_Omega \( Q_j \) lt.eq C_e n sum_(u lt.eq L\
u med upright("dyadic")) u^e lt.eq C'_e n L^e . $
  Covering $T$ in the same way, with cap comparable to $s_0$, uses $O \( n \/ s_0 \)$ squares at the cap and $O \( n \/ u \)$ below it, and gives the first bound in (9.11).
  Adding an arbitrary part of one depth row changes entropy by at most $n log q$. Finally, near these sets there is no edge joining $A$ to its complement: such an edge would have an endpoint in $Z$ within distance $s_0 + 1$ of $T$. Thus their physical boundaries are bounded by the ambient template and shell boundaries just counted. This argument does not count missing lattice edges as physical boundary edges. ◻
]

=== 9.4 A small safe-box exponent <a-small-safe-box-exponent>

We use the scanner first with a bounded total metric weight. The rough comparison is sufficient here, even when $a sqrt(cal(B))$ is large. This separates the bootstrap from the sharper concentration condition needed only in the final application.

#thm([Proposition 9.5.])[
  (Improved safe-box estimate).  #emph[There is a constant $C$, depending only on the Hamiltonian parameters, such that 
$ F_(upright("box")) \( r \) lt.eq C r^(1 + e_(*)) quad \( r gt.eq 1 \) \, #h(2em) e_(*) = 2 dot.op 10^(- 6) . $

]
] <prop:small-box>

#proof[
  Let $e_0 in \( 0 \, 1 \)$ be supplied by Proposition 7. If $e_0 lt.eq e_(*)$, the assertion already follows. Otherwise fix, once for the entire bootstrap,
  #[#set math.equation(numbering: n => "(9.13)")
   $ g_0 = \( 1 - e_0 \) \/ 2 \, quad mu = 1 - g_0 \, quad nu = g_0 \/ 1000 \, quad ell = nu \/ 100 \, quad kappa = min \( nu \/ 100 \, e_(*) \/ 4 \) \, quad W = 4 . $ <scanner:bootstrap-parameters>]
  These parameters will not change when the current entropy exponent improves.
  Suppose $F_(upright("box")) \( r \) lt.eq C_e r^(1 + e)$, where $e_(*) < e lt.eq e_0$. Take any safe integer rectangle $T$ of actual maximal side length $s_0$, and set $n = ceil.l C_2 s_0 ceil.r$ for a sufficiently large fixed $C_2$. If $A ∩ T$ is empty, its entropy is zero, so assume otherwise. For large $s_0$, $L = o \( s_0 \)$, so (9.2) holds. In particular the weaker safe-box clearance $D_0 s_0$, rather than the stronger template clearance of Definition 27, is enough for this application.
  Here is the shell entropy input explicitly. The shell $T_j \\ T$, $j lt.eq L$, has area $O \( n L \)$ and consists of a bounded number of rectangular strips. Its mixed dyadic squares of side $u$ number $O \( n \/ u + 1 \)$, by the boundary-line count. The maximal-contained-square argument of Lemma 28, capped at side comparable to $L$, therefore gives $S_Omega \( Q_j \) lt.eq C_e n L^e$. These covering squares are safe: their sides are at most $L$, and their distance from $Z$ is at least $D_0 s_0 - L > D_0 L$ once $s_0$ is large. This also covers thin rectangles. The target entropy is at most $C_e s_0^(1 + e)$. Adding a partial row costs $O \( n \)$, so all the hypotheses of Proposition 26 hold.
  We check its quantitative output. Since $K asymp n^(g_0 - ell)$, $a asymp n^(- g_0 + ell)$. In (9.6) the two powers before logarithms are at most
  $ e_0 - mu + nu = - 0.999 g_0 \, #h(2em) - \( g_0 - ell \) \/ 4 + nu = - 0.2489975 g_0 . $
  Thus $delta_n lt.eq n^(- 0.24 g_0)$ for sufficiently large $n$, after constants and fixed logarithmic powers have been absorbed. The energy prefactor has power $ell + 2 kappa lt.eq 0.00003 g_0$. Its slower decaying input is $epsilon.alt = n^(- 0.001 g_0)$, rather than $delta_n^(1 \/ 8) lt.eq n^(- 0.03 g_0)$. Hence
  #[#set math.equation(numbering: n => "(9.14)")
   $ E_(upright("def") \, k) lt.eq C n^(- nu \/ 2) + o_k \( 1 \) . $ <scanner:bootstrap-energy>]
  All scale conditions and the smallness of $a r_0^2$ hold at large $n$. No sharp marginal-moment condition has been used.
  Put $tau = n^(- nu \/ 4)$. Apply the rough upper and lower comparisons (8.8) and (8.8) at the selected interpolation. Write $S_X = S_(tilde(Omega)) \( X \)$. The upper pin cost has leading coefficient $2 S_X$; the lower coefficient is $4 s W S_X = 4 S_X$. Replacing $log d_(*)$ and $S'$ by $S_X$ costs $O \( w + \| log z \| \)$. The remaining relative loss in this coefficient is at most $C \( tau + E_(upright("def") \, k) \/ tau \)$, which is small after taking $k arrow.r oo$ and then $n$ sufficiently large. The two comparisons consequently imply
  #[#set math.equation(numbering: n => "(9.15)")
   $ S_X lt.eq C_e #scale(x: 120%, y: 120%)[\(] n L^e + n D + w + h \( tau \) \/ a + 1 #scale(x: 120%, y: 120%)[\)] . $ <scanner:bootstrap-comparison>]
  To justify the order of limits in this absorption, keep $n$ fixed in both norm comparisons and use (9.14). The resulting scalar inequality has the same $S_X$ for every $k$; all other remainders are uniform at the selected points and vanish. Only then choose the large-scale threshold making the coefficient loss smaller than the fixed margin between four and two.
  For $0 < tau < 1 \/ 2$, $h \( tau \) lt.eq C tau log \( e \/ tau \)$. Therefore
  $ h \( tau \) \/ a lt.eq C n^(g_0 - ell - nu \/ 4) log n = O \( n \) \, $
  because $g_0 < 1 \/ 2$. Also $w = n^(3 \/ 5) lt.eq n$, and $kappa lt.eq e_(*) \/ 4 < \( 1 - ell \) e$ while $e > e_(*)$. Equation (9.15), followed by the negligible transfer back to $Omega$, gives
  $ S_Omega \( A ∩ T \) lt.eq C'_e n^(1 + \( 1 - ell \) e) lt.eq C''_e s_0^(1 + \( 1 - ell \) e) . $
  Bounded $s_0$ are included by increasing the constant, using the volume bound. Taking the supremum over safe boxes thus replaces the current exponent $e$ by $\( 1 - ell \) e$.
  Starting from $e_0$, finitely many repetitions reach an exponent at most $e_(*)$, which can be loosened to $e_(*)$. Every iteration uses only the current safe-box estimate on the shell covering squares. The parameters in (9.13), and the finite number of iterations, depend only on the fixed Hamiltonian parameters. Thus the final constant is uniform over the domain and cut. ◻
]

=== 9.5 The collar mutual information <the-collar-mutual-information>

After the bootstrap we allow the total metric weight to grow slowly. The exact norm comparison then charges the remaining target pin cost by the reciprocal of that weight. This is the point at which the entropy identity in Proposition 24 gives a bound independent of the selected history.

#thm([Proposition 9.6.])[
  (A sublinear collar bound).  #emph[Let $T$ be a template separated from the cut, with parameters $\( n \, s_0 \)$ as in Definition 27. Set 
$ L = floor.l n^(1 - 10^(- 5)) floor.r \, #h(2em) X = A ∩ T \, #h(2em) S_0 = A ∩ T_L \, $

 and suppose $L lt.eq s_0$. For all sufficiently large $n$, 
#[#set math.equation(numbering: n => "(9.16)")
 $ I_Omega \( X : Lambda \\ S_0 \) lt.eq C n^(1 - epsilon) \, #h(2em) epsilon = 10^(- 5) . $ <scanner:collar-output>]

 The constant and threshold are independent of $T \, s_0 \, n \, Lambda$, and $A$. The cuts of $X \, S_0$, and $S_0 \\ X$ have $O \( n \)$ edges, and $\| S_0 \| = O \( n^2 \)$.]
] <prop:collar>

#proof[
  If $X$ is empty there is nothing to prove. Otherwise Proposition 29 and Lemma 28 supply (9.4) with $e = e_(*) = 2 dot.op 10^(- 6)$. Since $s_0 lt.eq n$, the core entropy is at most $C n^(1 + e)$. The template clearance and $L lt.eq s_0$ imply (9.2) at large $n$; the logarithmic truncation radius is negligible compared with $L$.
  Use the following fixed parameter choices:
  #[#set math.equation(numbering: n => "(9.17)")
   $ mu = 1 / 4 \, quad nu = 1 / 1000 \, quad ell = 1 / 100000 \, quad omega = 1 / 20000 \, quad kappa = 1 / 1000000 \, quad W = n^omega . $ <scanner:final-parameters>]
  Then $a asymp n^(- 0.74994)$. The two terms in (9.6) have powers $- 0.248998$ and $- 0.186485$, before the fixed logarithmic factors. Hence $delta_n lt.eq n^(- 0.18)$ at sufficiently large scales. The power of the energy prefactor is
  $ ell + 2 kappa + 2 omega = 0.000112 . $
  The $epsilon.alt = n^(- 0.001)$ term is again the limiting one, and Proposition 26 gives
  #[#set math.equation(numbering: n => "(9.18)")
   $ E_(upright("def") \, k) lt.eq C n^(- 0.0005) + o_k \( 1 \) . $ <scanner:final-energy>]
  Set $tau = n^(- 0.00025)$. All fixed multiples of $a$ lie in the marginal-moment interval required for the sharp comparisons, since
  $ a sqrt(cal(B)) lt.eq C n^(- 0.2499395) \( log n \)^C arrow.r 0 . $
  At each leaf write, as before, the physical partition as $X \, U \, Y \, V$. All entropies in the next calculation refer to $tilde(Omega)$. Let
  $ g_(upright("pre")) = S \( X U \) + S \( V \) - S \( Y \) \, #h(2em) g_(upright("post")) = S \( U \) + S \( U Y \) - S \( Y \) . $
  These are the quantities in the sharp norm comparisons. Their upper bounds are uniform in the status. In particular $S \( X U \) lt.eq S \( X \) + S \( U \) lt.eq C n^(1 + e)$, and by purity $S \( V \) = S \( X U Y \) lt.eq S \( X \) + S \( U Y \) lt.eq C n^(1 + e)$. Here the matched-prefix error $C n D$ is absorbed because $kappa < e$. Thus $0 lt.eq g_(upright("pre")) lt.eq C n^(1 + e)$.
  Denote the full terminal path and uniform band average by $chevron.l dot.op chevron.r_(upright("leaf"))$. Subtracting (8.9) from (8.9), and then dividing by $2 s W$, bounds $2 S \( X \) + chevron.l g_(upright("pre")) - g_(upright("post")) chevron.r_(upright("leaf"))$ by a constant times
  #[#set math.equation(numbering: n => "(9.19)")
   $ frac(S \( X \) + 1, W) + w + \( tau + E_(upright("def") \, k) \/ tau \) n^(1 + e) + frac(h \( tau \), a) + a cal(B) + frac(\| log z \|, a) + o_k \( 1 \) . $ <scanner:final-errors>]
  This calculation uses $S' = S \( X \) + O \( w + \| log z \| \)$ and the analogous estimate for $log d_(*)$. It also restores the lost $tau chevron.l g_(upright("pre")) chevron.r_(upright("leaf"))$ from the lower comparison using the preceding uniform bound.
  For each leaf separately, purity gives the exact identity
  #[#set math.equation(numbering: n => "(9.20)")
   $ 2 S \( X \) + g_(upright("pre")) - g_(upright("post")) = I \( X : V \) + I \( X : Y V \) . $ <scanner:entropy-identity>]
  Both $V$ and $Y V$ contain the fixed subsystem $Lambda \\ S_0$. Monotonicity of mutual information therefore makes the left side of (9.20) at least $I_(tilde(Omega)) \( X : Lambda \\ S_0 \)$, independently of the history. This remains true after the leaf average, even though the selected round and its weights can vary with $k$.
  For completeness, after $k arrow.r oo$ the terms in (9.19) have the following upper bounds on their powers of $n$, apart from fixed logarithms.
  #[
  #set par(justify: false)
#table(
  columns: 2,
  align: (left, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Error term
], table.cell(rowspan: 1, colspan: 1)[Power of $n$
]),
  table.cell(rowspan: 1, colspan: 1)[$\( S \( X \) + 1 \) \/ W$
], table.cell(rowspan: 1, colspan: 1)[$0.999952$
],
  table.cell(rowspan: 1, colspan: 1)[$w$
], table.cell(rowspan: 1, colspan: 1)[$0.6$
],
  table.cell(rowspan: 1, colspan: 1)[$\( tau + E_(upright("def") \, k) \/ tau \) n^(1 + e)$, after $k arrow.r oo$
], table.cell(rowspan: 1, colspan: 1)[$0.999752$
],
  table.cell(rowspan: 1, colspan: 1)[$h \( tau \) \/ a$
], table.cell(rowspan: 1, colspan: 1)[$0.74969$
],
  table.cell(rowspan: 1, colspan: 1)[$a cal(B)$
], table.cell(rowspan: 1, colspan: 1)[$0.250061$
],
  table.cell(rowspan: 1, colspan: 1)[$\| log z \| \/ a$
], table.cell(rowspan: 1, colspan: 1)[$- 99.25006$
],
)
]
  All are strictly below $1 - epsilon = 0.99999$. Equation (9.18) controls the mass-loss term uniformly before the limit. This proves $I_(tilde(Omega)) \( X : Lambda \\ S_0 \) lt.eq C n^(1 - epsilon)$.
  Finally write mutual information as $S \( X \) - S \( X divides Lambda \\ S_0 \)$ and use Lemma 3. Only $log dim cal(H)_X = O \( n^2 \)$ enters, even if the far subsystem is very large. The trace distance $O \( n^(- 500) \)$ between the original and truncated ground states therefore changes this mutual information by $O \( n^(- 248) \)$. This proves (9.16). The final size and boundary assertions were established in Lemma 28. ◻
]

The replica construction has now been eliminated: the conclusion of Proposition 30 is an inequality for the original finite ground state. The next section applies the exact positive quasi-local system to that state. In particular, the exponentially large auxiliary operator used there never multiplies a truncation or a replica error from the present argument.

== 10 Amplifying the collar estimate <sec:amplification>

Proposition 30 gives a sublinear bound on the mutual information between a target and the region beyond its collar. We now make this mutual information smaller than any fixed inverse power of the scale, at the cost of a slightly wider collar. Typical spectral subspaces first give a candidate restoring operator whose norm is controlled by the collar mutual information. Positive constraints suppress its excited component, yielding accurate restoration after localization. A polar decomposition then replaces this operator by a local unitary. An untouched reference copy records the target’s correlations with the remote system and witnesses their decoupling.

Throughout this section fix

#[#set math.equation(numbering: n => "(10.1)")
 $ epsilon = 10^(- 5) \, #h(2em) beta = 1 - 2 dot.op 10^(- 6) \, #h(2em) alpha = frac(p, p + 1) > 1 - 10^(- 6) \, $ <eq:amplification-exponents>]

where the integer $p$ is fixed. Apply Proposition 10 with this value of $p$. Thus, in this section, $H_F = sum_i k_i$ is a fresh exact positive system with

#[#set math.equation(numbering: n => "(10.2)")
 $ 0 lt.eq k_i lt.eq I \, quad k_i Omega = 0 \, quad H_F gt.eq g \( I - P_Omega \) \, #h(2em) P_Omega = \| Omega chevron.r chevron.l Omega \| \, $ <eq:amplification-positive-system>]

and $g > 0$ is independent of the finite domain. The scanner’s truncated Hamiltonian is no longer used. All neighborhoods below are neighborhoods in the induced graph: for $S subset.eq Lambda$ we write $N_r \( S \) = { y in Lambda : d_Lambda \( y \, S \) lt.eq r } = N_r^Lambda \( S \)$.

=== 10.1 Localizing products of positive constraints <localizing-products-of-positive-constraints>

The following estimate supplies the localization needed later. It is stated for a general operator, which may act on additional finite systems. These additional systems are spectators in the dynamics. The spatial truncation argument has the propagation structure of dissipative Lieb–Robinson estimates #cite(label("BarthelKliesch2012")) Theorems 1 and 2. We prove it here on coupled clock realizations, since the needed bound is an expectation of a norm.

#thm([Lemma 10.1.])[
  (Local constraint products).  #emph[Let positive contractions $k_i$, anchored at $a_i in Lambda$ with bounded multiplicity, satisfy 
$ parallel k_i - E_(i \, l) k_i parallel lt.eq C e^(- c l^alpha) #h(2em) \( l gt.eq 0 \) \, $

 where $E_(i \, l)$ is conditional expectation onto $N_l \( a_i \)$. Set $G_i = \( I - k_i \)^(1 \/ 2)$ and $K_i = k_i^(1 \/ 2)$. Fix $t gt.eq 0$ and an integer $r gt.eq 1$. At each anchor label run an independent rate-one Poisson clock on $\[ 0 \, t \]$. In occurrence order, with later factors on the left, let $D$ be the product of all $G_i$, and let $D_(upright("ret"))$ retain only events with $d_Lambda \( a_i \, S \) lt.eq r$, for a nonempty set $S subset.eq Lambda$. Let $L$ be the same retained product with each $G_i$ replaced by $G_(i \, r) = \( I - E_(i \, r) k_i \)^(1 \/ 2)$.]
  #emph[There are uniform constants $C \, c \, v > 0$ such that 
#[#set math.equation(numbering: n => "(10.3)")
 $ bb(E) parallel D_(upright("ret")) - L parallel lt.eq C t \| S \| \( 1 + r \)^2 e^(- c r^alpha) . $ <eq:amplification-product-truncation>]

 In particular $L$ is a contraction supported on $N_(2 r) \( S \)$. If $k_i Omega = 0$ and an operator $B$ is supported on $S$ and spectator systems, then, for every unit spectator vector $xi$, 
#[#set math.equation(numbering: n => "(10.4)")
 $ bb(E) parallel \( D - D_(upright("ret")) \) B \( Omega ⊗ xi \) parallel lt.eq C t \| S \| parallel B parallel e^(v t - c r^alpha) . $ <eq:amplification-product-omission>]

 Both bounds concern the same coupled clock realization. Their constants are independent of $\| Lambda \|$ and of spectator dimensions.]
] <lem:amplification-local-products>

#proof[
  We first prove an operator estimate for unital channels. Define
  $ cal(E)_i \( B \) = G_i B G_i + K_i B K_i \, #h(2em) cal(E)_(i \, l) \( B \) = G_(i \, l) B G_(i \, l) + K_(i \, l) B K_(i \, l) \, $
  where $K_(i \, l) = \( E_(i \, l) k_i \)^(1 \/ 2)$. When $k_i Omega = 0$, functional calculus gives $G_i Omega = Omega$ and $K_i Omega = 0$, so
  #[#set math.equation(numbering: n => "(10.5)")
   $ cal(E)_i \( C \) \( Omega ⊗ xi \) = G_i C \( Omega ⊗ xi \) $ <eq:amplification-channel-vector>]
  for every operator $C$ and spectator vector $xi$. Products of these channels therefore recover the contraction products when evaluated on the ground vector. We localize the channels first: their unitality makes each local channel fix the algebra outside its supporting ball. They are also completely positive, hence contractions in operator norm, including after adjoining spectators. Lemma 11 gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ parallel cal(E)_i - cal(E)_(i \, l) parallel_(upright("cb")) lt.eq C e^(- c l^alpha) . $ <eq:amplification-channel-approximation>]
  The completely bounded norm here is the supremum of the operator norms after adjoining identity maps on finite spectator systems. In this case the estimate follows directly from the norm bounds for the two square roots, so it has no dimension factor.
  Put $cal(E)_(i \, - 1) = "id"$ and $Delta_(i \, l) = cal(E)_(i \, l) - cal(E)_(i \, l - 1)$ for $l gt.eq 0$. By increasing $C$ to include $l = 0$,
  #[#set math.equation(numbering: n => "(10.7)")
   $ parallel Delta_(i \, l) parallel_(upright("cb")) lt.eq C e^(- c l^alpha) . $ <eq:amplification-channel-shells>]
  Both channels in this difference fix operators commuting with the algebra on $N_l \( a_i \)$. Thus the difference vanishes on that commutant. For an operator $B$ define its oscillation at a physical site $y$ by
  $ d_y \( B \) = sup_(U_y med upright("unitary")) parallel \[ U_y \, B \] parallel . $
  Average over the on-site unitaries in a set $Q$, one site at a time. The total norm change is at most $sum_(z in Q) d_z \( B \)$, and the result commutes with the algebra on $Q$. Consequently
  #[#set math.equation(numbering: n => "(10.8)")
   $ parallel Delta_(i \, l) \( B \) parallel lt.eq C e^(- c l^alpha) sum_(z in N_l \( a_i \)) d_z \( B \) . $ <eq:amplification-shell-oscillation>]
  This argument also applies to operators acting on spectators.
  To bound the oscillation after one event, suppose first that $m = d_Lambda \( a_i \, y \) < oo$. The channel $cal(E)_(i \, m - 1)$ does not act at $y$ and commutes with conjugation by $U_y$; hence it cannot increase $d_y$. Telescope the shells from radius $m$ onward and use $d_y \( C \) lt.eq 2 parallel C parallel$ to obtain
  #[#set math.equation(numbering: n => "(10.9)")
   $ d_y \( cal(E)_i B \) lt.eq d_y \( B \) + C sum_(l gt.eq d_Lambda \( a_i \, y \)) e^(- c l^alpha) sum_(z in N_l \( a_i \)) d_z \( B \) . $ <eq:amplification-oscillation-increment>]
  For $m = 0$ the initial channel is the identity. If $m = oo$, $cal(E)_i$ acts in a different component and cannot increase $d_y$. Exact component support follows either from the construction or by letting $l$ exceed the component diameter in the approximation assumption.
  Sum the increment in (10.9) over the retained anchor labels. Define the nonnegative matrix
  $ A_(y z) = C sum_(i med upright("retained")) sum_(l gt.eq 0) e^(- c l^alpha) upright(bold(1))_({ y \, z in N_l \( a_i \) }) \, $
  with the constant from (10.9). It has a uniformly bounded weighted row sum:
  #[#set math.equation(numbering: n => "(10.10)")
   $ sup_y sum_(z : thin d_Lambda \( y \, z \) < oo) A_(y z) e^(a d_Lambda \( y \, z \)^alpha) lt.eq v $ <eq:amplification-weighted-kernel>]
  for some $a > 0$. Indeed, at radius $l$ there are at most $C \( 1 + l \)^2$ anchor labels whose balls contain $y$, and at most $C \( 1 + l \)^2$ sites in each ball. Their distances from $y$ are at most $2 l$. The left side is therefore bounded by
  $ C sum_(l gt.eq 0) \( 1 + l \)^4 e^(- c l^alpha + a \( 2 l \)^alpha) \, $
  which is finite for sufficiently small $a$. There are no kernel entries between different components.
  Let $B_u$ be the result of the retained channel events up to time $u$, starting from $B$. The Poisson jump formula and (10.9) imply, in integral form, the differential upper bound
  $ frac(d, d u) bb(E) d_y \( B_u \) lt.eq sum_z A_(y z) bb(E) d_z \( B_u \) . $
  The site and anchor sums are finite for a fixed domain, and the radius sums converge absolutely with the uniform bounds in (10.10). Initially $d_y \( B \) lt.eq 2 parallel B parallel 1_S \( y \)$. On components meeting $S$, weight the last inequality by $e^(a d_Lambda \( y \, S \)^alpha)$. The triangle inequality and $0 < alpha < 1$ give
  $ d_Lambda \( y \, S \)^alpha - d_Lambda \( z \, S \)^alpha lt.eq d_Lambda \( y \, z \)^alpha . $
  The weighted supremum thus grows at rate at most $v$. Gronwall’s inequality yields
  #[#set math.equation(numbering: n => "(10.11)")
   $ bb(E) d_y \( B_u \) lt.eq 2 parallel B parallel e^(v u - a d_Lambda \( y \, S \)^alpha) . $ <eq:amplification-propagation>]
  Oscillations on components disjoint from $S$ remain zero.
  We can now remove the distant events. For an omitted anchor at finite distance $d = d_Lambda \( a_i \, S \) > r$, sum (10.8) over all $l gt.eq 0$ and apply (10.11). When $l lt.eq d \/ 2$, every $z in N_l \( a_i \)$ has $d_Lambda \( z \, S \) gt.eq d \/ 2$. The sum over these radii is bounded by $C parallel B parallel e^(v u - a \( d \/ 2 \)^alpha)$. For $l > d \/ 2$ use the shell decay and the ball cardinality instead. Absorbing its polynomial factor gives, in both cases,
  #[#set math.equation(numbering: n => "(10.12)")
   $ bb(E) parallel \( cal(E)_i - "id" \) \( B_u \) parallel lt.eq C parallel B parallel e^(v u - c' d^alpha) . $ <eq:amplification-omitted-event>]
  At infinite distance the left side is zero.
  Couple full and retained processes by using the same clocks. The difference of their products telescopes with earlier retained channels and later full channels. All the later channels contract the operator norm. The earlier retained process is independent of the omitted clocks, so their expected contributions are obtained by integrating the rate-one bound (10.12). There are at most $C \| S \| \( d + 1 \)^2$ anchor labels at distance $d$ from $S$. Summing the stretched-exponential tail and integrating time therefore prove the coupled expected-norm estimate
  #[#set math.equation(numbering: n => "(10.13)")
   $ bb(E) parallel cal(E)_(upright("full")) \( B \) - cal(E)_(upright("ret")) \( B \) parallel lt.eq C t \| S \| parallel B parallel e^(v t - c'' r^alpha) . $ <eq:amplification-channel-omission>]
  In particular this is a bound on the expectation of the norm, not merely on the norm of a difference of averaged operators.
  If $k_i Omega = 0$, evaluating both channel products on $Omega ⊗ xi$ and iterating (10.5) converts (10.13) into (10.4). Unitality is essential in the channel argument: the single map $C mapsto G_i C G_i$ need not fix operators on a disjoint system.
  Finally there are at most $C \| S \| \( 1 + r \)^2$ retained labels, and hence their expected number of events is at most $C t \| S \| \( 1 + r \)^2$. Each event’s contraction changes by at most $C e^(- c r^alpha)$ under radius-$r$ approximation. Telescoping the contraction products proves (10.3). A retained anchor is within $r$ of $S$, so every approximating factor is supported on $N_(2 r) \( S \)$. This completes the proof. ◻
]

Ground-state-preserving products that suppress excited states also occur in detectability-lemma constructions #cite(label("AnshuAradVidick2016")) Section III. For the random contractions here, the gap gives the following estimate. Under (10.2), for any vector $zeta$ including spectator systems,

#[#set math.equation(numbering: n => "(10.14)")
 $ bb(E) parallel D \( I - P_Omega \) zeta parallel^2 lt.eq e^(- g t) parallel \( I - P_Omega \) zeta parallel^2 . $ <eq:amplification-excited-decay>]

Here and below physical projections are tensored with the identity on spectators. To see this, every self-adjoint $G_i$ fixes $Omega$ and commutes with $P_Omega$. At a clock event the squared norm of an excited vector decreases by $chevron.l zeta \, k_i zeta chevron.r$. Summing the conditional rate of these decreases gives at least $g parallel zeta parallel^2$, and integrating proves (10.14). Thus the global gap is used for decay, while the preceding channel argument supplies locality.

=== 10.2 A local unitary from a small collar cost <a-local-unitary-from-a-small-collar-cost>

For an ambient set $T subset bb(Z)^2$, write $T_L = T + \[ - L \, L \]_(bb(Z))^2$ as in the scanner. The next proposition states explicitly the information it needs from that scanner.

#thm([Proposition 10.2.])[
  (Amplification).  #emph[Fix $C_0 > 0$ and let $epsilon \, beta \, alpha$ be as in (10.1). Suppose $n gt.eq 2$, $L = floor.l n^(1 - epsilon) floor.r$, and 
$ X = A ∩ T \, #h(2em) S_0 = A ∩ T_L \, #h(2em) Y = S_0 \\ X \, #h(2em) Z' = Lambda \\ S_0 . $

 Assume that $\| S_0 \| lt.eq C_0 n^2$, that each of the three cuts $X \, Y \, S_0$ has at most $C_0 n$ crossing edges, and that 
#[#set math.equation(numbering: n => "(10.15)")
 $ cal(I) := I_Omega \( X : Z' \) lt.eq C_0 n^(1 - epsilon) . $ <eq:amplification-input-information>]

 For every integer $M gt.eq 1$, at all sufficiently large $n$, there is an integer radius $r$ such that 
#[#set math.equation(numbering: n => "(10.16)")
 $ r lt.eq C_M n^(\( 1 - epsilon \) \/ alpha) \, #h(2em) L + 2 r = o \( n^beta \) \, $ <eq:amplification-radius>]

 and, simultaneously for every physical set $J subset.eq Lambda \\ N_(2 r) \( S_0 \)$, 
#[#set math.equation(numbering: n => "(10.17)")
 $ I_Omega \( X : J \) lt.eq C_M n^(- M) . $ <eq:amplification-output>]

 The same bound holds with any subset of $X$ in place of $X$. The constants and the threshold may depend on $C_0$ and $M$, but are independent of $Lambda \, A \, T$ subject to the stated assumptions.]
  #emph[If in addition 
#[#set math.equation(numbering: n => "(10.18)")
 $ "dist"_oo \( T \, Z \) > L + n^beta \, $ <eq:amplification-cut-clearance>]

 where $Z$ is the set of endpoints of the original cut, then $N_(2 r) \( S_0 \) subset.eq A$. In particular the remote set $J$ may include all of $Lambda \\ A$.]
] <prop:amplification>

#proof[
  The case $X = diameter$ is immediate; take $r = 1$. Suppose that $X$ is nonempty. We keep the entire physical system fixed while constructing the auxiliary operators; the estimates below are uniform in its volume.
  Set $w = n^(3 \/ 5)$. Lemma 5, applied in the original ground state to the three cuts, provides spectral projections $P_X \, T_Y \, Q_(S_0)$ onto their positive eigenvalues with surprisal in the intervals
  $ \[ S \( X \) - w \, S \( X \) + w \] \, quad \[ S \( Y \) - w \, S \( Y \) + w \] \, quad \[ S \( S_0 \) - w \, S \( S_0 \) + w \] \, $
  respectively. The original interactions have uniformly bounded support dimensions and at most $C n$ terms cross each cut. Thus each failed projection has probability at most $C exp \( - c n^(1 \/ 10) \)$. For any fixed integer $K gt.eq 1$, increasing the scale threshold makes these three probabilities at most
  #[#set math.equation(numbering: n => "(10.19)")
   $ delta = n^(- 2 K) . $ <eq:amplification-typical-error>]
  For a trivial subsystem its projection is the identity. All inverse eigenvalues used below are restricted to the selected positive spectrum, so no invertibility assumption is imposed on a marginal.
  Choose a full eigenbasis ${ \| x chevron.r }$ for $rho_X$, with eigenvalues $p_x gt.eq 0$, and write a Schmidt expansion
  $ Omega = sum_(y : thin p_y > 0) sqrt(p_y) thin \| y chevron.r_X \| omega_y chevron.r_(Y Z') . $
  Append two systems $s' \, e'$, each a copy of the Hilbert space on $X$, with fixed unit blank vectors denoted $\| 0 chevron.r$. Consider the unit vectors
  #[#set math.equation(numbering: n => "(10.20)")
   $ phi.alt & = \| 0 chevron.r_X \| 0 chevron.r_(s') sum_(y : thin p_y > 0) sqrt(p_y) \| y chevron.r_(e') \| omega_y chevron.r_(Y Z') \,\
eta & = Omega ⊗ sum_(x : thin p_x > 0) sqrt(p_x) \| x chevron.r_(s') \| x chevron.r_(e') . $ <eq:amplification-swapped-state>]
  In $phi.alt$, the original target has moved to $e'$, so its joint reduction with a remote physical system is unchanged after relabeling. In $eta$, $e'$ is purified by $s'$ and is independent of all physical systems. The unitary we construct will leave $e'$ untouched and act only on $s'$ and a graph neighborhood of $S_0$.
  For readability write $Q = Q_(S_0)$ and $T_0 = T_Y$. On $s' \, X \, Y$ define the square operator
  #[#set math.equation(numbering: n => "(10.21)")
   $ R_0 = sum_(x med upright("selected")) p_x^(- 1 \/ 2) \| x chevron.r chevron.l 0 \|_(s') ⊗ Q #scale(x: 120%, y: 120%)[\(] \| x chevron.r chevron.l 0 \|_X ⊗ T_0 #scale(x: 120%, y: 120%)[\)] . $ <eq:amplification-restoring-operator>]
  It acts trivially on $e'$ and $Z'$. The localization lemma applies to vectors of the form $B \( Omega ⊗ xi \)$ with a local operator $B$. To put $R_0 phi.alt$ in this form, define an operator supported on $S_0 \, s' \, e'$ by
  #[#set math.equation(numbering: n => "(10.22)")
   $ B_0 = sum_(x med upright("selected")\
y med upright(i n med t h e med f u l l med b a s i s)) p_x^(- 1 \/ 2) \| x chevron.r chevron.l 0 \|_(s') ⊗ \| y chevron.r chevron.l 0 \|_(e') ⊗ Q #scale(x: 120%, y: 120%)[\(] \| x chevron.r chevron.l y \|_X ⊗ T_0 #scale(x: 120%, y: 120%)[\)] . $ <eq:amplification-column-operator>]
  The summation over $y$ includes zero-probability eigenvectors. Direct substitution gives
  #[#set math.equation(numbering: n => "(10.23)")
   $ R_0 phi.alt = B_0 \( Omega ⊗ \| 00 chevron.r_(s' e') \) . $ <eq:amplification-column-identity>]
  We establish three estimates for these operators before introducing the constraint product. The first is a norm bound controlled by $cal(I)$. Let
  $ B_Y = sum_(x med upright("selected")) p_x^(- 1) T_0 chevron.l x \| Q \| x chevron.r T_0 gt.eq 0 . $
  Orthogonality of the output vectors in (10.21) gives $R_0^dagger R_0 = \| 0 chevron.r chevron.l 0 \|_(s') ⊗ \| 0 chevron.r chevron.l 0 \|_X ⊗ B_Y$. Similarly, $B_0^dagger B_0 = \| 00 chevron.r chevron.l 00 \|_(s' e') ⊗ I_X ⊗ B_Y$. The typical spectral inequalities are
  $ p_x^(- 1) lt.eq e^(S \( X \) + w) \, #h(2em) Q lt.eq e^(S \( S_0 \) + w) rho_(S_0) \, #h(2em) T_0 rho_Y T_0 lt.eq e^(- S \( Y \) + w) T_0 . $
  They imply
  #[#set math.equation(numbering: n => "(10.24)")
   $ parallel R_0 parallel \, med parallel B_0 parallel lt.eq M_0 \, #h(2em) M_0 = exp #scale(x: 120%, y: 120%)[\(] \( cal(I) + 3 w \) \/ 2 #scale(x: 120%, y: 120%)[\)] \, $ <eq:amplification-operator-norm>]
  because purity gives $S \( X \) + S \( S_0 \) - S \( Y \) = I \( X : Z' \) = cal(I)$.
  The second estimate is an adjoint identity with no factor $M_0$. Let $cal(R)_X$ be the isometry that relabels $X$ as $e'$ and inserts the blank vectors on $X \, s'$; thus $cal(R)_X Omega = phi.alt$. For every physical operator $L'$ the coefficients $sqrt(p_x)$ in (10.20) cancel the selected inverse square roots, giving exactly
  #[#set math.equation(numbering: n => "(10.25)")
   $ R_0^dagger \( L' \)^dagger eta = cal(R)_X \( P_X ⊗ T_0 \) Q \( L' \)^dagger Omega . $ <eq:amplification-adjoint-identity>]
  The three projections are contractions, whether or not they commute. Telescoping them on $Omega$ and using (10.19) therefore gives
  #[#set math.equation(numbering: n => "(10.26)")
   $ parallel R_0^dagger \( L' \)^dagger eta - phi.alt parallel lt.eq 3 sqrt(delta) + parallel \( L' \)^dagger Omega - Omega parallel . $ <eq:amplification-adjoint-error>]
  Third, although $R_0 phi.alt$ may have large norm, its physical ground component has norm at most one. Define
  $ M_X = "Tr"_Y #scale(x: 120%, y: 120%)[\[] \( I_X ⊗ T_0 \) rho_(S_0) Q #scale(x: 120%, y: 120%)[\]] . $
  Since $Q$ commutes with $rho_(S_0)$, one has $0 lt.eq rho_(S_0) Q lt.eq rho_(S_0)$. Cyclicity of the partial trace for operators on $Y$ allows a second $T_0$ on the right. Hence
  $ 0 lt.eq M_X lt.eq "Tr"_Y \[ \( I ⊗ T_0 \) rho_(S_0) \( I ⊗ T_0 \) \] lt.eq rho_X . $
  The last inequality follows by adding the analogous positive term with $I - T_0$; the two cross terms have zero partial trace. In particular $M_X$ vanishes on $ker rho_X$. On its support put $A_X = rho_X^(- 1 \/ 2) M_X rho_X^(- 1 \/ 2)$, so $0 lt.eq A_X lt.eq I$. With $rho_X^(+)$ denoting the inverse on the support and zero on the kernel,
  $ M_X rho_X^(+) M_X = rho_X^(1 \/ 2) A_X^2 rho_X^(1 \/ 2) lt.eq M_X . $
  The ancillary coefficient of $\| x chevron.r_(s') \| y chevron.r_(e')$ in $P_Omega R_0 phi.alt$ is $\( M_X \)_(y x) \/ sqrt(p_x)$ for selected $x$. It follows that
  #[#set math.equation(numbering: n => "(10.27)")
   $ parallel P_Omega R_0 phi.alt parallel^2 = sum_(x med upright("selected") \, y) frac(\| \( M_X \)_(y x) \|^2, p_x) lt.eq "Tr" \( M_X rho_X^(+) M_X \) lt.eq "Tr" M_X lt.eq 1 . $ <eq:amplification-ground-component>]
  We have now constructed a restoring operator whose norm is $e^(O \( cal(I) + w \))$, whose adjoint is accurate on the desired state, and whose ground component is bounded. Positive constraints will suppress the remaining component while preserving the last two properties.
  Run the clocks of Lemma 31 for time
  #[#set math.equation(numbering: n => "(10.28)")
   $ t_(*) = C \( cal(I) + w + K log n \) \, #h(2em) r = ⌈#scale(x: 120%, y: 120%)[\(] C' \( t_(*) + K log n \) #scale(x: 120%, y: 120%)[\)]^(1 \/ alpha)⌉ \, $ <eq:amplification-time-choice>]
  where $C$ and then $C'$ are chosen sufficiently large. Use $S = S_0$, and put $zeta = R_0 phi.alt$. The full, retained, and truncated products are denoted $D \, D_(upright("ret")) \, L'$ respectively. Equations (10.14) and (10.24) imply
  $ bb(E) parallel D \( I - P_Omega \) zeta parallel^2 lt.eq M_0^2 e^(- g t_(*)) . $
  Apply Lemma 31 with $B = B_0$, $xi = \| 00 chevron.r_(s' e')$, and $S = S_0$. The column representation (10.23) then gives
  $ bb(E) parallel \( D - D_(upright("ret")) \) zeta parallel & lt.eq C t_(*) \| S_0 \| M_0 e^(v t_(*) - c r^alpha) \,\
M_0 bb(E) parallel D_(upright("ret")) - L' parallel & lt.eq C t_(*) \| S_0 \| \( 1 + r \)^2 M_0 e^(- c r^alpha) . $
  All of these estimates are on the same clock space.
  Here is explicit control of the scale choices. First choose $C$ so that $g t_(*) gt.eq cal(I) + 3 w + 6 K log n$. The first expectation is then at most $n^(- 6 K)$. By (10.15), both $t_(*)$ and $r$ are bounded by fixed powers of $n$, with constants depending on $K$. Their polynomial prefactors and $\| S_0 \|$ therefore cost only $O_K \( log n \)$ in the logarithm. Since $log M_0 = \( cal(I) + 3 w \) \/ 2 lt.eq C t_(*)$, choosing $C'$ larger makes each of the last two expectations at most $n^(- 3 K)$ for large $n$. Markov’s inequality and a union bound consequently provide a realization satisfying
  #[#set math.equation(numbering: n => "(10.29)")
   $ parallel D \( I - P_Omega \) zeta parallel lt.eq n^(- K) \, quad parallel \( D - D_(upright("ret")) \) zeta parallel lt.eq n^(- K) \, quad M_0 parallel D_(upright("ret")) - L' parallel lt.eq n^(- K) . $ <eq:amplification-good-trajectory>]
  Indeed the three failure probabilities sum to at most $n^(- 4 K) + 2 n^(- 2 K) < 1$ at sufficiently large scales.
  Every exact factor fixes the ground vector in both directions. Thus $D$ preserves the ground component in (10.27), and $D_(upright("ret"))^dagger Omega = Omega$. Since $M_0 gt.eq 1$, (10.29) gives
  #[#set math.equation(numbering: n => "(10.30)")
   $ parallel L' R_0 phi.alt parallel lt.eq 1 + 3 n^(- K) \, #h(2em) parallel \( L' \)^dagger Omega - Omega parallel lt.eq n^(- K) . $ <eq:amplification-before-polar>]
  Combining the latter bound with (10.26), and writing $R' = L' R_0$, we obtain
  $ parallel \( R' \)^dagger eta - phi.alt parallel lt.eq 4 n^(- K) . $
  Because $phi.alt \, eta$ are unit vectors, the real overlap satisfies $Re chevron.l eta \, R' phi.alt chevron.r gt.eq 1 - 4 n^(- K)$. Expanding the square using (10.30) gives
  #[#set math.equation(numbering: n => "(10.31)")
   $ parallel R' phi.alt - eta parallel lt.eq C n^(- K \/ 2) . $ <eq:amplification-direct-error>]
  The square operator $R'$ is supported on $s'$ and $N_(2 r) \( S_0 \)$, and acts trivially on $e'$. Its polar decomposition extends on this finite local space to $R' = U' H_(+)$, where $U'$ is unitary and $H_(+) = \( R' ""^dagger R' \)^(1 \/ 2)$. Such a unitary extension exists even when $R'$ is singular: its two polar support spaces have equal dimension, as do their orthogonal complements. Tensor it with the identity elsewhere. For $xi = \( U' \)^dagger eta$ we have
  $ parallel H_(+) xi - phi.alt parallel lt.eq 4 n^(- K) \, #h(2em) parallel H_(+) phi.alt - xi parallel lt.eq C n^(- K \/ 2) . $
  Subtract these two errors in the identity
  $ \( I + H_(+) \) \( xi - phi.alt \) = \( H_(+) xi - phi.alt \) - \( H_(+) phi.alt - xi \) . $
  Since $parallel \( I + H_(+) \)^(- 1) parallel lt.eq 1$, this proves
  #[#set math.equation(numbering: n => "(10.32)")
   $ parallel U' phi.alt - eta parallel lt.eq C n^(- K \/ 2) . $ <eq:amplification-unitary-error>]
  In particular no bound on $parallel H_(+) parallel$ is needed.
  Let $J subset.eq Lambda \\ N_(2 r) \( S_0 \)$ be arbitrary. The unitary $U'$ changes neither $e'$ nor $J$, so their joint reduction in $U' phi.alt$ is exactly the original $X J$ reduction, with $X$ relabeled as $e'$. In $eta$ that joint reduction is a product. Apply Lemma 3 to $I \( e' : J \) = S \( e' \) - S \( e' \| J \)$ and (10.32). Only the dimension of $e'$ appears. It has $log dim e' = \| X \| log q lt.eq C n^2$, and therefore
  $ I_Omega \( X : J \) lt.eq C n^(2 - K \/ 4) . $
  Choose the fixed integer $K gt.eq 4 \( M + 3 \)$. This proves (10.17), uniformly for every such $J$. Discarding part of $X$ proves the assertion for its subsets.
  Finally (10.28) and (10.15) give $r lt.eq C_M n^(\( 1 - epsilon \) \/ alpha)$. The choices in (10.1) imply $\( 1 - epsilon \) \/ alpha < beta$ and $1 - epsilon < beta$, which prove (10.16). If a graph path of length at most $2 r$ from $S_0$ reached $Lambda \\ A$, it would contain an endpoint of the original cut. A starting point of this path has ambient distance at most $L$ from $T$, and each graph step changes ambient distance by at most one. That endpoint would be within $L + 2 r$ of $T$, contradicting (10.18) for large $n$. Thus the graph neighborhood lies in $A$, as claimed. ◻
]

The global gap enters through the marginal-tail estimate, the construction of positive constraints, and the excited-state decay. Its final entropy comparison is confined to the target dimension. The next section constructs tiles whose enlarged graph neighborhoods avoid all previously used tiles of the same family, so that Proposition 32 can be applied repeatedly.

== 11 Two families of regions and the area bound <sec:geometry>

The amplified collar estimate controls the mutual information between one region and any collection of sites outside its collar. To use it in an entropy chain, we need to divide $A$ into two families: within each family, the collar of a region must avoid all regions that precede it. We group cells in distance layers into primary tiles separated by sparse strips. Filling the strips with suitable labels leaves only point contacts between regions of the same family. We separate those contacts by recursively replacing small squares around them. The sites left at the end of this construction, and all the mutual-information errors, will be bounded by the number of cut edges.

The construction takes place in the ambient plane. Its use of ambient distance only supplies sufficient conditions for separation in the induced graph: every graph path of length $r$ has ambient displacement at most $r$. We never require an ambiently short path to exist in the domain.

=== 11.1 The entropy cancellation <the-entropy-cancellation>

We first isolate the elementary reason that two families suffice. This also specifies precisely the separation property that the geometry must provide.

#thm([Lemma 11.1.])[
  (Two-family entropy cancellation).  #emph[Let $psi$ be a pure state on a finite tensor product with site set $Lambda$. Suppose that 
$ A = D dot(union) union.big_(i in cal(I)_0) X_i dot(union) union.big_(i in cal(I)_1) X_i subset.eq Lambda $

 is a partition into disjoint sets, and fix an order on each finite index set $cal(I)_f$, $f in { 0 \, 1 }$. Write $B = Lambda \\ A$. If 
$ I_psi (X_i : B union union.big_(j in cal(I)_f\
j < i) X_j) lt.eq epsilon_i #h(2em) \( i in cal(I)_f \) \, $

 then 
$ S_psi \( A \) lt.eq S_psi \( D \) + 1 / 2 sum_i epsilon_i . $

]
] <geometry:cancellation>

#proof[
  Write $A_f = union.big_(i in cal(I)_f) X_i$ and $E_f = sum_(i in cal(I)_f) epsilon_i$. The entropy chain rule and purity give
  $ S_psi \( B A_f \) gt.eq S_psi \( B \) + sum_(i in cal(I)_f) S_psi \( X_i \) - E_f = S_psi \( A \) + sum_(i in cal(I)_f) S_psi \( X_i \) - E_f . $
  On the other hand, purity and subadditivity give
  $ S_psi \( B A_f \) = S_psi \( D A_(1 - f) \) lt.eq S_psi \( D \) + sum_(i in cal(I)_(1 - f)) S_psi \( X_i \) . $
  Adding the inequalities for $f = 0$ and $f = 1$ cancels every individual tile entropy and proves the claim. ◻
]

=== 11.2 The geometric statement <the-geometric-statement>

Keep the exponent $beta = 1 - 2 dot.op 10^(- 6)$ from Proposition 32, and put

#[#set math.equation(numbering: n => "(11.1)")
 $ delta_0 = 2 dot.op 10^(- 7) \, #h(2em) zeta = 1 - delta_0 / 2 \, #h(2em) rho_0 = frac(1 + beta, 2) \, #h(2em) ell = 10^(- 5) . $ <geometry:exponents>]

The inequalities we shall use are

#[#set math.equation(numbering: n => "(11.2)")
 $ \( 1 + 2 delta_0 \) beta < zeta < 1 \, #h(2em) \( 1 + 2 delta_0 \) \( 1 - ell \) < 1 \, #h(2em) 1 - ell < beta < rho_0 < 1 . $ <geometry:exponent-gaps>]

All their gaps are fixed positive numbers. Thresholds depending on these gaps may therefore be chosen independently of $Lambda$ and $A$.

A #emph[birth region] below is the bounded closed planar region assigned to a tile when that tile is created. Later steps only delete points from that tile. Its #emph[actual region] is the interior of its birth region remaining after all deletions. Different pieces with the same tile identifier are treated as one region; neither a birth region nor an actual region is required to be connected. Its ambient lattice template is the intersection of its birth region with $bb(Z)^2$. We distinguish the two family labels $0 \, 1$ from the two sides $A \, Lambda \\ A$ of the physical cut.

#thm([Proposition 11.2.])[
  (Two families with separated birth templates).  #emph[Fix the constants $D_0$ and $C_(upright("tpl"))$ in Definition 27, and a lower scale threshold $n_(*) gt.eq 1$. There is a constant $C$ with the following property. Let $Lambda$ be a finite induced subgraph of the square lattice, let $A subset.eq Lambda$, and suppose that $b = \| partial_Lambda A \| > 0$. Let $Z$ be the set of endpoints of those cut edges.]
  #emph[There are a set $D subset.eq A$, a finite ordered collection of disjoint nonempty sets $X_i subset.eq A$, labels $f_i in { 0 \, 1 }$, ambient templates $T_i subset bb(Z)^2$, and integers $n_i gt.eq n_(*)$ such that:]
  + #emph[$A = D dot(union) union.big_i X_i$ and $\| D \| lt.eq C b$.]
  + #emph[$X_i subset.eq A ∩ T_i$. Each $T_i$ is a template of Definition 27: it is a union of $N_i$ lattice samples of closed convex rectangles or triangles with side slopes $0 \, oo \, 1 \, - 1$, each of sup-norm diameter at most $s_i$, where 
$ "diam"_oo T_i lt.eq n_i \, #h(2em) n_i gt.eq C_(upright("tpl")) N_i \( s_i + 1 \) \, #h(2em) "dist"_oo \( T_i \, Z \) > 4 D_0 s_i . $

 Moreover $L_i = floor.l n_i^(1 - ell) floor.r lt.eq s_i$.]
  + #emph[The templates satisfy 
#[#set math.equation(numbering: n => "(11.3)")
 $ "dist"_oo \( T_i \, Z \) & > 2 n_i^beta \,\
"dist"_oo (T_i \, union.big_(j < i\
f_j = f_i) X_j) & > 2 n_i^beta . $ <geometry:cut-clearance>]

 As usual, the distance to the empty set is infinite.]
  + #emph[The scale losses are summable: 
$ sum_i n_i^(- 100) lt.eq C b . $

]
  #emph[The constant $C$ may depend on the fixed template constants and on $n_(*)$, but not on the domain or cut.]
] <prop:two-families>

We prove the proposition in stages. First we construct layers with sparse connecting strips. Next we remove their same-family vertex contacts. Finally we verify separation for the entire birth templates, not merely for the smaller actual regions.

=== 11.3 Layers and sparse strips <layers-and-sparse-strips>

Fix a translated origin

$ o = \( sqrt(2) \, sqrt(3) \) . $

Each of $o_1 \, o_2 \, o_1 + o_2 \, o_1 - o_2$ is nonintegral. On every dyadic scale $r = 2^k$, use the half-open cells

$ C_(k \, z) = o + r #scale(x: 120%, y: 120%)[\(] z + \[ 0 \, 1 \)^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) z in bb(Z)^2 . $

These grids are nested. Half-open cells determine indices; their closures will determine birth regions. Choose an integer $C_0$ sufficiently large compared with $D_0$, for example $C_0 > 100 \( D_0 + 1 \)$, and define

$ cal(Z)_k = { z : C_(k \, z) ∩ Z eq.not diameter } \, #h(2em) N_k = union.big_("dist"_oo \( z \, cal(Z)_k \) lt.eq C_0) C_(k \, z) . $

Here the distance in the subscript is the sup distance between integer cell indices. Passing to parents shows that $N_k subset.eq N_(k + 1)$: if two child indices differ by at most $C_0$ in each coordinate, their parent indices also differ by at most $C_0$. The sets $N_k$ exhaust the plane, since $Z eq.not diameter$ and $C_0 gt.eq 2$.

For a lower index $k_0$ to be fixed later, regard $N_(k_0)$ as one #emph[dummy tile], labeled by the parity of $k_0 - 1$. Its points will initially be exceptional. For $k gt.eq k_0$, the layer

$ D_k = N_(k + 1) \\ N_k $

is a union of cells of side $r = 2^k$. There are at most $C \| Z \| lt.eq C b$ of these cells: $N_(k + 1)$ has at most $\( 2 C_0 + 1 \)^2 \| Z \|$ cells of side $2 r$, each of which has four children. The cell-index definition also gives

#[#set math.equation(numbering: n => "(11.4)")
 $ C_0 r lt.eq "dist"_oo \( x \, Z \) lt.eq 2 \( C_0 + 1 \) r #h(2em) \( x in overline(D_k) \) . $ <geometry:layer-distance>]

For the lower bound, a cell outside $N_k$ differs from every endpoint-occupied cell by at least $C_0 + 1$ in one coordinate. For the upper bound use its parent in $N_(k + 1)$.

The function $x mapsto "dist"_oo \( x \, Z \)$ is 1-Lipschitz. Consequently, if $h gt.eq k + 2$, then

#[#set math.equation(numbering: n => "(11.5)")
 $ "dist"_oo \( overline(D_k) \, overline(D_h) \) gt.eq C_0 2^h - 2 \( C_0 + 1 \) 2^k gt.eq frac(C_0 - 1, 2) thin 2^h . $ <geometry:nonadjacent>]

Thus only the same layer or a neighboring layer can occur near a region whose size is much smaller than its layer scale.

In $D_k$ put

$ s_k = 2^(floor.l \( 1 + delta_0 \) k floor.r) \, #h(2em) t_k = 2^(floor.l zeta k floor.r) . $

For sufficiently large $k_0$, we have $t_k divides r divides s_k$ and $t_k lt.double r lt.double s_k$, uniformly as $k arrow.r oo$. Here $r$ is the layer-cell scale, $s_k$ is the pitch used to group fragments into primary tiles, and $t_k$ will be the width of the strips separating those tiles. The larger pitch makes the strips sparse within a layer; the $r$-cells will later supply the small pieces in each primary’s template. The fine cells of side $t_k$ have origin $o$. Choose two residue classes modulo $s_k \/ t_k$, one for each coordinate. A fine cell is called a #emph[belt cell] if either of its two indices lies in the corresponding selected residue class. The remaining fine cells lie in open pitch interiors, each a square between successive belt strips. For each such pitch interior, give all its fragments in $D_k$ one primary-tile identifier and the label $k med mod med 2$.

The shifts can be chosen so that few belt cells meet the layer. Indeed, the layer contains at most $C b \( r \/ t_k \)^2$ fine cells before any shift is chosen. Under a uniform choice of the two residue classes, each is a belt cell with probability at most $2 t_k \/ s_k$. Hence some shift satisfies

#[#set math.equation(numbering: n => "(11.6)")
 $ \# { upright("belt cells in ") D_k } lt.eq C b frac(r^2, s_k t_k) lt.eq C b thin 2^(- k delta_0 \/ 2) . $ <geometry:belt-count>]

We fix such a shift in each layer. This is an averaging argument on a predetermined collection of cells; no property of the state enters it. The geometric decay in $k$ absorbs any fixed power of $k$. Below, (11.11) will bound the number of repairs descended from one contact by just such a power, so sparse strips also control the total number of tiles created by the repairs.

Each $r$-cell meets only a bounded number of pitch interiors, so there are at most $C b$ primary tiles in a layer. The birth region of one primary is a union of at most

#[#set math.equation(numbering: n => "(11.7)")
 $ C \( s_k \/ r + 2 \)^2 $ <geometry:primary-pieces>]

closed rectangles of sup-norm diameter at most $r$, obtained as closures of the intersections of that pitch interior with the $r$-cells of the layer. Its whole sup-norm diameter is at most $s_k$. Distinct primaries in the same layer are separated by a belt strip of width at least $t_k$. Primaries in adjacent layers have opposite labels; primaries of the same label in different layers satisfy (11.5). Figure 3 shows why a primary can have several components even though it occupies a single pitch interior.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 1.05), (1.05, 2.1), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.05, 1.05), (2.1, 2.1), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.05, 2.1), (2.1, 3.15), fill: rgb("#d6d6ff"), stroke: none)
  rect((3.15, 0), (4.2, 1.05), fill: rgb("#d6d6ff"), stroke: none)
  rect((3.15, 1.05), (4.2, 2.1), fill: rgb("#d6d6ff"), stroke: none)
  rect((3.15, 2.1), (4.2, 3.15), fill: rgb("#d6d6ff"), stroke: none)
  rect((3.15, 3.15), (4.2, 4.2), fill: rgb("#d6d6ff"), stroke: none)
  rect((4.2, 1.05), (5.25, 2.1), fill: rgb("#d6d6ff"), stroke: none)
  rect((4.2, 2.1), (5.25, 3.15), fill: rgb("#d6d6ff"), stroke: none)
  rect((0, 1.05), (0.2625, 2.1), fill: rgb("#ffd3a6"), stroke: none)
  rect((3.15, 0), (4.2, 0.2625), fill: rgb("#ffd3a6"), stroke: none)
  rect((4.2, 1.05), (4.463, 3.15), fill: rgb("#ffd3a6"), stroke: none)
  line((0, 0), (0, 4.2), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.05, 0), (1.05, 4.2), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((2.1, 0), (2.1, 4.2), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.15, 0), (3.15, 4.2), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((4.2, 0), (4.2, 4.2), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.25, 0), (5.25, 4.2), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 0), (5.25, 0), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 1.05), (5.25, 1.05), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 2.1), (5.25, 2.1), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 3.15), (5.25, 3.15), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 4.2), (5.25, 4.2), stroke: (paint: rgb("#acacac"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  rect((0, 0), (4.2, 4.2), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.2625, 0), (0.2625, 4.2), (4.463, 0), (4.463, 4.2), (0, 0.2625), (5.25, 0.2625), stroke: (paint: rgb("#b25a00"), thickness: 0.45pt, miter-limit: 10))
  content((1.522, 1.575), [$P$])
  content((3.675, 2.573), [$P$])
  content((4.883, 1.575), [$Q$])
  content((5.617, 3.518), [$D_k$: shaded $r$-cells], anchor: "west", padding: 0.1176cm)
  rect((5.67, 2.783), (5.985, 3.098), fill: rgb("#d6d6ff"), stroke: none)
  content((6.143, 2.94), [primary fragments], anchor: "west", padding: 0.1176cm)
  rect((5.67, 2.152), (5.985, 2.468), fill: rgb("#ffd3a6"), stroke: none)
  content((6.143, 2.31), [belt cells], anchor: "west", padding: 0.1176cm)
  line((0, -0.42), (4.2, -0.42), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((2.1, -0.42), [pitch $s_k$], anchor: "north", padding: 0.1176cm)
  line((1.05, 4.567), (2.1, 4.567), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((1.575, 4.567), [$r$], anchor: "south", padding: 0.1176cm)
  line((4.2, 0.6825), (4.463, 0.6825), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: "<", end: ">"))
  line((4.2, 0.525), (4.2, 0.8925), (4.463, 0.525), (4.463, 0.8925), stroke: (thickness: 0.45pt, miter-limit: 10))
  content((4.62, 0.6825), [$t_k$], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 3: A schematic portion of one ambient layer, not to scale. Dashed lines mark the $r$-cells. The thick square is one pitch cell; its interior after removing the belt strips has side $s_k - t_k$. All blue fragments in that interior share the primary identifier $P$, even when disconnected. The neighboring fragment has identifier $Q$. Both primaries have family label $k med mod med 2$; the orange belt cells are filled and labeled in the next step. The drawing concerns the ambient layer $D_k$, before intersection with the physical set $A$. ],
) <geometry:layer-picture>

=== 11.4 Filling the belts <filling-the-belts>

The remaining construction colors the belt cells while making every positive-length interface between different tile identifiers join opposite labels. Point contacts will be dealt with separately.

Adjacent layer fine meshes have side ratio either 1 or 2. They have a common translated dyadic origin, including after the pitch shifts, which were by multiples of their fine-cell sides. Divide a side of a belt cell at any corner of an opposing cell. A larger side can be divided only at its midpoint. Along each resulting elementary segment, the opposing region is either one primary or dummy tile, or one elementary segment of another belt cell. A layer boundary cannot change in the interior of such a segment: layer edges lie on the coarser dyadic grids.

Join the center of each belt cell to the endpoints of its elementary segments. This makes a fan of at most eight triangles, with edges of slopes $0 \, oo \, 1 \, - 1$. A triangle facing a primary or dummy tile receives the opposite label. On a segment shared by two belt cells, assign any opposite pair of labels to its two incident triangles, consistently on both sides. Within each belt cell merge each cyclic run of consecutive triangles with the same label into one tile identifier. Distinct runs remain distinct identifiers; if all labels agree, the whole cell is one tile.

Every positive-length interface between distinct identifiers now joins opposite labels. Across a cell side this follows from the assignment; inside a fan it follows from merging equal-label neighbors. Primaries were already separated in the same layer, and adjacent-layer primaries have opposite labels. Thus a same-label contact between distinct tiles can only be a point, and every such contact involves a belt cell.

Mark the center, the four corners, and the four side midpoints of every belt cell. Some midpoint marks are unnecessary for its fan, but adding them simplifies the recursion. Deduplicate coincident marks, assigning a mark $v$ the scale $S_v$ equal to the smallest side length of a belt cell that marked it. There are at most nine times as many initial marks as belt cells.

#thm([Lemma 11.3.])[
  (Isolated stars of the initial mesh).  #emph[There is an absolute constant $a_0 > 0$, independent of the layer and the chosen shifts, such that, on taking $k_0$ sufficiently large:]
  + #emph[Distinct marks $v \, w$ satisfy $lr(bar.v.double v - w bar.v.double)_oo gt.eq a_0 max \( S_v \, S_w \)$.]
  + #emph[In the square $v + \[ - a_0 S_v \, a_0 S_v \]^2$, all active boundaries are straight rays from $v$ in the eight axis and diagonal directions. Each sector between consecutive active rays has one tile identifier, and consecutive sectors have opposite labels. If there is no active ray, the square is in one tile.]
  #emph[An active boundary here means an interface of distinct identifiers; seams removed by a merge are not boundaries.]
] <geometry:initial-stars>

#proof[
  Consider a belt cell of side $t = t_k$. In its $10 t$-neighborhood only its own and adjacent layers can occur, by (11.5) and $t_k \/ 2^k arrow.r 0$. All fine-cell sides there are $t \/ 2 \, t$, or $2 t$. Cell corners, fan centers, and side midpoints therefore lie on the affine mesh $o + \( t \/ 4 \) bb(Z)^2$. All active lines have one of the four allowed slopes and intercepts on this mesh. Marks have local scales comparable to $t$. Distinct marks have distance at least $t \/ 4$, and a supporting line that does not contain a given mark is at sup distance at least $t \/ 8$ from it. The same bounds apply to the nearest other endpoint of an incident segment. Choosing $a_0$ small gives both assertions locally. Apply this argument at the larger scale for a pair of nearby marks; pairs outside the local neighborhood already satisfy the asserted separation.
  The preceding coloring shows that two sectors separated by an active ray have opposite labels. Coincident boundary segments or inactive seams are counted only once, so this describes the actual tile regions near the mark. ◻
]

=== 11.5 Removing point contacts at successively smaller scales <removing-point-contacts-at-successively-smaller-scales>

The purpose of the next construction is to make the birth template of each newly created tile avoid the final actual sets of earlier tiles of the same label. Removing points only from the new tile would not provide that property. We remove a square from every old identifier incident with the mark before creating its replacement.

Choose a fixed stopping scale $S_(*)$ sufficiently large that, for every $S gt.eq S_(*)$, the dyadic halfside

#[#set math.equation(numbering: n => "(11.8)")
 $ d \( S \) = 2^(floor.l rho_0 log_2 S floor.r) $ <geometry:trim-radius>]

satisfies

#[#set math.equation(numbering: n => "(11.9)")
 $ 1 / 2 S^(rho_0) lt.eq d \( S \) lt.eq S^(rho_0) \, #h(2em) d \( S \) lt.eq a_0 / 1000 S . $ <geometry:trim-margins>]

We will increase $S_(*)$ later to accommodate the collar estimate. Choose $k_0$ so that all initial mark scales are at least $S_(*)$. At each generation perform the following operations simultaneously at every active mark $\( v \, S \)$:

+ Remove the closed square $Q_v = v + \[ - d \( S \) \, d \( S \) \]^2$ from every old tile identifier.
+ If $d \( S \) < S_(*)$, leave its interior unassigned and declare it a terminal exceptional square.
+ Otherwise, continue the incident active rays through the square to its center. In each resulting sector give the new region the label opposite to that of the corresponding exterior sector, with a new identifier for each sector. If there are no rays, use one opposite-label square. Mark the center, corners, and side midpoints of $Q_v$, all at scale $d \( S \)$, for the next generation.

A sector with angle exceeding $pi$ need not be convex; it is a union of at most eight of the triangles from the center to side corners and midpoints. Thus all replacement birth regions retain the required finite description. Every old ray meets the square perimeter at a corner or side midpoint. Figure 4 illustrates the label reversal and the marks used at the next generation.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-3.915, 0), (-2.465, 1.45), fill: rgb("#dbdbff"), stroke: none)
  rect((-2.465, 0), (-1.015, 1.45), fill: rgb("#ffe3c7"), stroke: none)
  rect((-2.465, -1.45), (-1.015, 0), fill: rgb("#dbdbff"), stroke: none)
  rect((-3.915, -1.45), (-2.465, 0), fill: rgb("#ffe3c7"), stroke: none)
  rect((-3.915, -1.45), (-1.015, 1.45), stroke: (thickness: 0.45pt, miter-limit: 10))
  line((-3.915, 0), (-1.015, 0), (-2.465, -1.45), (-2.465, 1.45), stroke: (thickness: 0.45pt, miter-limit: 10))
  rect((-3.074, -0.609), (-1.856, 0.609), stroke: (thickness: 0.45pt, miter-limit: 10, dash: "dashed"))
  content((-3.451, 0.986), [$0$])
  content((-1.479, 0.986), [$1$])
  content((-1.479, -0.986), [$0$])
  content((-3.451, -0.986), [$1$])
  circle((-2.465, 0), radius: 0.03881, fill: black, stroke: none)
  content((-2.465, -1.566), [An isolated contact], anchor: "north", padding: 0.1176cm)
  rect((1.015, 0), (2.465, 1.45), fill: rgb("#dbdbff"), stroke: none)
  rect((2.465, 0), (3.915, 1.45), fill: rgb("#ffe3c7"), stroke: none)
  rect((2.465, -1.45), (3.915, 0), fill: rgb("#dbdbff"), stroke: none)
  rect((1.015, -1.45), (2.465, 0), fill: rgb("#ffe3c7"), stroke: none)
  rect((1.856, 0), (2.465, 0.609), fill: rgb("#ffe3c7"), stroke: none)
  rect((2.465, 0), (3.074, 0.609), fill: rgb("#dbdbff"), stroke: none)
  rect((2.465, -0.609), (3.074, 0), fill: rgb("#ffe3c7"), stroke: none)
  rect((1.856, -0.609), (2.465, 0), fill: rgb("#dbdbff"), stroke: none)
  rect((1.015, -1.45), (3.915, 1.45), stroke: (thickness: 0.45pt, miter-limit: 10))
  line((1.015, 0), (3.915, 0), (2.465, -1.45), (2.465, 1.45), stroke: (thickness: 0.45pt, miter-limit: 10))
  rect((1.856, -0.609), (3.074, 0.609), stroke: (thickness: 0.45pt, miter-limit: 10))
  content((1.479, 0.986), [$0$])
  content((3.451, 0.986), [$1$])
  content((3.451, -0.986), [$0$])
  content((1.479, -0.986), [$1$])
  content((2.146, 0.319), [$1$])
  content((2.784, 0.319), [$0$])
  content((2.784, -0.319), [$1$])
  content((2.146, -0.319), [$0$])
  circle((1.856, -0.609), radius: 0.02999, fill: black, stroke: none)
  circle((1.856, 0), radius: 0.02999, fill: black, stroke: none)
  circle((1.856, 0.609), radius: 0.02999, fill: black, stroke: none)
  circle((2.465, -0.609), radius: 0.02999, fill: black, stroke: none)
  circle((2.465, 0), radius: 0.02999, fill: black, stroke: none)
  circle((2.465, 0.609), radius: 0.02999, fill: black, stroke: none)
  circle((3.074, -0.609), radius: 0.02999, fill: black, stroke: none)
  circle((3.074, 0), radius: 0.02999, fill: black, stroke: none)
  circle((3.074, 0.609), radius: 0.02999, fill: black, stroke: none)
  content((2.465, -1.566), [Replacement and next marks], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 4: A four-sector example of the repair. The square around the contact is removed from every old tile, and its new sectors receive the opposite labels. Positive-length interfaces still join opposite labels. Any same-label contacts involving the new tiles occur among the nine marked points; the next, smaller removal separates them. The proof also allows any configuration of the eight permitted ray directions with opposite labels in consecutive sectors. ],
) <geometry:repair-picture>

We now verify that this procedure continues with uniform geometric constants. In particular, neither the separation constant nor the isolation radius is allowed to deteriorate with the number of generations.

#thm([Lemma 11.4.])[
  (Uniform repair induction).  #emph[For a sufficiently small fixed choice of $a_0$ and the corresponding threshold $S_(*)$, every active mark $\( v \, S \)$ at every generation has a terminal-square-free isolated star $v + \[ - a_0 S \, a_0 S \]^2$ with the properties of Lemma 35. Distinct active marks satisfy the same separation inequality. The simultaneous removal squares are disjoint. Each replacement has opposite labels across every positive-length interface of distinct identifiers, and its same-label contacts with old remnants or peer replacements occur only at marks of the next generation. Every descendant mark and every descendant birth region of a mark $\( v \, S \)$ lies within sup distance $2 d \( S \)$ of $v$. Each branch terminates after finitely many generations.]
] <geometry:repair-induction>

#proof[
  Suppose the assertions hold at one generation. By (11.9), the squares of radius $6 d \( S \)$ are contained in their parent stars. They are also disjoint from all other current removal squares. Indeed for parent marks $\( v \, S \) \, \( w \, T \)$,
  $ lr(bar.v.double v - w bar.v.double)_oo gt.eq a_0 max \( S \, T \) \, #h(2em) 6 d \( S \) + d \( T \) lt.eq frac(7 a_0, 1000) max \( S \, T \) . $
  Thus each modification sees only its parent’s radial boundaries.
  Across a new perimeter segment away from ray hits, the new interior label was chosen opposite to the exterior label. Across an interior ray, the two labels remain opposite because the two exterior labels were opposite. All other positive-length interfaces are unchanged. Contacts not lying in the relative interior of one of these segments are among the center, corners, or side midpoints of the new square. This proves the coloring and contact assertions.
  Normalize one removal square to $\[ - 1 \, 1 \]^2$. Its post-replacement boundaries are subsets of the original eight radial rays together with the four lines supporting this square. The possible new marks are the nine points of ${ - 1 \, 0 \, 1 }^2$. Every nonincident supporting line stays at a fixed positive distance from a mark, and every other endpoint stays at distance at least one. Thus a fixed sufficiently small $a_0$ gives an isolated radial star at each child, on the child’s scale $d \( S \)$. This is the same finite line configuration at every generation, so no iteration of a shrinking constant is involved.
  Two children of the same parent are at least $d \( S \)$ apart. For children of different parents their separation is at least
  $ a_0 max \( S \, T \) - d \( S \) - d \( T \) gt.eq a_0 / 2 max \( S \, T \) \, $
  which is larger than $a_0 max \( d \( S \) \, d \( T \) \)$ by (11.9). Their isolated-star squares therefore satisfy the original separation invariant as well.
  The child stars lie inside the parent star. Consequently they avoid all terminal squares from earlier generations. A terminal square created at another parent in the current generation is excluded by the same cross-parent distance estimate. For a direct statement covering all later generations, each successive child displacement is at most the preceding removal radius, and subsequent radii shrink by the fixed factor at most $a_0 \/ 1000$. Their sum, including the radius of the final descendant birth square, is less than $2 d \( S \)$. Subtrees of distinct parents are therefore separated by the preceding inequalities, even if one subtree has already terminated. This proves the asserted terminal-square avoidance and descendant bound.
  Finally, as long as a branch continues, its successive scales satisfy $S_(j + 1) = d \( S_j \) lt.eq S_j^(rho_0)$ with $rho_0 < 1$. After finitely many steps the computed next halfside is below $S_(*)$, and that removal is terminal. This completes the induction. ◻
]

All geometric edges avoid lattice sites. Initially their vertices are in $o + bb(Z)^2$ because $r \, s_k \, t_k$ are dyadic integers, and the halfsizes and midpoints used are integral. In the recursion each new center, corner, and midpoint is obtained by adding an integer vector to the preceding center; the halfside $d \( S \)$ is an integer. Enlarge $S_(*)$ once so that a terminal halfside produced from $S gt.eq S_(*)$ is still at least two. Every supporting line consequently has equation

$ x_1 = o_1 + m \, quad x_2 = o_2 + m \, quad x_1 + x_2 = o_1 + o_2 + m \, quad upright("or") quad x_1 - x_2 = o_1 - o_2 + m \, #h(2em) m in bb(Z) . $

None contains a point of $bb(Z)^2$. We may therefore use open actual tile regions and closed birth regions without any convention for assigning a lattice site on an interface. The final open tile regions, the unaltered part of the dummy region, and terminal-square interiors partition all lattice sites.

=== 11.6 Separation from earlier actual regions <separation-from-earlier-actual-regions>

Order tile identifiers as follows: all primaries first, all initial belt tiles second, and then the replacement tiles by their generation of birth. Ties within each class can be broken arbitrarily. The dummy tile is excluded from this order. Primaries already have the required same-label separation from other primaries. The next lemma handles all remaining identifiers and explains why the order uses actual earlier regions.

#thm([Lemma 11.5.])[
  (Birth-template separation).  #emph[There is a fixed $c_1 > 0$ such that the following holds. Let $cal(B)$ be the closed birth region of an initial belt tile of side scale $u = t_k$, or of a replacement tile whose removal square has halfside $u$. Then its distance from the final actual region of every earlier or peer identifier of the same label is at least $c_1 u^(rho_0)$. A peer means another initial belt tile, or another replacement born at the same generation, respectively.]
] <geometry:birth-separation>

#proof[
  At the birth of an initial belt tile, compare its closure with the primary and belt closures at that time. At the birth of a replacement, compare it with the old remnants #emph[after] that generation’s removal squares have been cut out, and with the peer replacements. Each final actual region is a subset of the corresponding compared region. In particular an ancestor is compared after its square has been removed; its original birth region need not be disjoint from the new one.
  Restrict attention to a closed box obtained by enlarging the tile’s cell or removal square by $2 u$ in each direction. Points outside this box are at distance at least $2 u$ from the birth region. Translate by its cell corner, or by its removal center, and rescale lengths by $u$. Only finitely many local pairs of closed regions can arise:
  - For belts, the nearby active lines and endpoints lie on the affine quarter mesh, with their four prescribed slopes. In a bounded box there are only finitely many such lines and endpoints. The local closures are unions of faces of their arrangement; allowing all possible identifier groupings still leaves only finitely many pairs of unions. We classify only the restrictions to this box: disconnected pieces of an identifier outside it do not change the local pattern.
  - For a replacement, the enlarged box lies in the isolated star of its parent, by (11.9). It sees only the old radial layout and the new square and sectors. These lie on a fixed finite arrangement in the rescaled coordinates. Other parents’ simultaneous modifications do not enter this box.
  Thus there is a common positive scale for the isolation neighborhoods used in all these comparisons.
  The two compared closures of the same label have no positive-length interface. Their intersections, if any, are contact marks by the belt construction or Lemma 36. At a belt contact the mark scale is comparable with $u$ (neighboring belt scales differ by at most two); at a replacement contact it is $u$. Choose disjoint open contact squares of radius $lambda u$ inside the isolated stars, for a fixed sufficiently small $lambda > 0$.
  First consider pairs of points $\( x \, y \)$ in the two compared closures that do not both belong to the same open contact square. This condition specifies a closed subset of the compact product of the two local closures. On it the distance $lr(bar.v.double x - y bar.v.double)_oo$ has a positive minimum: if the minimum were zero, $x = y$ would be a common contact, and both points would belong to its open contact square. Since the list of rescaled patterns is finite, the minimum is uniformly at least $c_2 u$ whenever this subset is nonempty.
  It remains to consider $x \, y$ in one contact star centered at $v$. Inside that star each closure is a union of closed radial sectors. Their direction sets are disjoint. A shared direction would give a shared ray segment, contrary to the absence of positive-length same-label contacts. Their boundary directions are among the eight axis and diagonal directions, so the angle between their direction sets is at least $pi \/ 4$. Elementary Euclidean geometry, followed by comparison of Euclidean and sup norms, gives
  #[#set math.equation(numbering: n => "(11.10)")
   $ lr(bar.v.double x - y bar.v.double)_oo gt.eq c_3 max { lr(bar.v.double x - v bar.v.double)_oo \, lr(bar.v.double y - v bar.v.double)_oo } . $ <geometry:angular-gap>]
  For example, the squared Euclidean distance between radial vectors of lengths $a \, b$ and angle $theta gt.eq pi \/ 4$ is $\( a - b \)^2 + 2 a b \( 1 - cos theta \)$, which bounds a fixed multiple of $max \( a \, b \)^2$.
  At the immediately following trim, the compared old or peer identifier loses a square about $v$ of radius at least $c_4 u^(rho_0)$, by (11.8) and comparability of mark scales. This removal also occurs if the square is terminal. That identifier only shrinks afterward. Thus a point $y$ in its final actual region has $lr(bar.v.double y - v bar.v.double)_oo gt.eq c_4 u^(rho_0)$, and (11.10) supplies the required lower bound for pairs inside the contact star. Together with the preceding compactness estimate and the exterior-of-box estimate this proves the lemma. ◻
]

The lemma compares the entire new birth region with an older actual region. Later deletions from the new tile are irrelevant to this estimate. This is the form needed for applying the collar estimate to its untrimmed template and then discarding part of that template.

=== 11.7 Counting exceptional sites and verifying the templates <counting-exceptional-sites-and-verifying-the-templates>

Let an initial mark have scale $S$. Along a branch, $log S_j lt.eq rho_0^j log S$ until termination. Its depth is therefore at most

$ C + C log log \( e^e + S \) . $

There are at most nine children per mark. Consequently the number of marks and replacements descended from this initial mark is at most

#[#set math.equation(numbering: n => "(11.11)")
 $ C #scale(x: 120%, y: 120%)[\(] log \( S + 2 \) #scale(x: 120%, y: 120%)[\)]^C . $ <geometry:descendant-count>]

The constants are fixed; their magnitude is immaterial for a size-independent area bound. The scale of a mark initially belonging to layer $k$ is comparable with $t_k$, and hence its logarithm is at most $C \( k + 1 \)$. By (11.6), the total number of belt tiles, marks, and replacements is bounded by

#[#set math.equation(numbering: n => "(11.12)")
 $ C b sum_(k gt.eq k_0) 2^(- k delta_0 \/ 2) \( k + 1 \)^C lt.eq C' b . $ <geometry:total-repairs>]

In particular this total is finite, even before restricting the construction to the finite domain.

Each terminal square has halfside below the fixed $S_(*)$ and therefore contains at most $C S_(*)^2$ lattice sites. The dummy region has at most $C \| Z \|$ cells of the fixed side $2^(k_0)$ and hence at most $C b$ lattice sites. Let $D$ be the sites of $A$ that remain in the dummy identifier or lie in terminal squares. Sites overwritten by a replacement are no longer counted as dummy sites. Equations (11.11) and (11.12) give

#[#set math.equation(numbering: n => "(11.13)")
 $ \| D \| lt.eq C b . $ <geometry:bad-sites>]

This counts ambient sites and then intersects with $A$. Missing sites, holes, thin parts, and disconnected components of $Lambda$ can only reduce the count.

We now assign scanner scales to the birth templates. Let $T = cal(B) ∩ bb(Z)^2$ for a birth region $cal(B)$. For a primary in layer $k$, take

#[#set math.equation(numbering: n => "(11.14)")
 $ s_0 = r = 2^k \, #h(2em) n = ⌈C_P r^(1 + 2 delta_0)⌉ . $ <geometry:primary-scale>]

By (11.7), it has at most $N_0 lt.eq C \( s_k \/ r + 2 \)^2 lt.eq C r^(2 delta_0)$ rectangular pieces, each of sup-norm diameter at most $s_0$. Choosing $C_P$ large ensures

$ n gt.eq C_(upright("tpl")) N_0 \( s_0 + 1 \) \, #h(2em) "diam"_oo T lt.eq s_k lt.eq n . $

The birth template has endpoint distance at least $C_0 r$, so the safe clearance in Definition 27 follows from the choice of $C_0$. The exponent inequalities give, uniformly over primaries,

#[#set math.equation(numbering: n => "(11.15)")
 $ L = floor.l n^(1 - ell) floor.r = o \( r \) \, #h(2em) n^beta = o \( t_k \) \, #h(2em) n^beta = o \( r \) . $ <geometry:primary-limits>]

For a belt tile take $u = t_k$, $s_0 = u$, and $n = ceil.l C_B u ceil.r$. It is a union of at most eight of the closed fan triangles. For a replacement whose removal halfside is $u$, take $s_0 = 2 u$ and $n = ceil.l C_B u ceil.r$. Subdivision into the triangles from the center to corners and midpoints again uses at most eight pieces, including for a wide sector or a homogeneous square. Choose $C_B$ large enough for all of these templates to satisfy $n gt.eq C_(upright("tpl")) N_0 \( s_0 + 1 \)$ and $"diam"_oo T lt.eq n$. In both cases $L = o \( u \)$.

Their cut clearance remains much larger than their size. An initial belt cell in $D_k$ has endpoint distance at least $C_0 r$. A mark on its closure has the same lower bound. By Lemma 36, every descendant lies within $2 d \( S \) lt.eq 2 t_k^(rho_0) = o \( t_k \)$ of that mark. After increasing $k_0$, all its descendant birth templates therefore have endpoint distance at least $\( C_0 - 1 \) r$. This also covers replacements extending into the dummy region. Since their side scales are at most $2 t_k = o \( r \)$, their endpoint distance exceeds both $4 D_0 s_0$ and $2 n^beta$.

These checks establish the exact geometric hypotheses of Lemma 28. In particular, for every birth template, its dilated layers up to $L$ have the stipulated row and perimeter bounds, and the safe-box estimate yields the core and shell entropy bounds needed by Proposition 30. The verification uses the finite union of convex pieces; no assertion that a primary, a sector run, or its intersection with $A$ is a rectangle is needed.

For clarity, the relevant thresholds can be fixed in the following order. First fix $C_0 \, C_P \, C_B$ and the absolute isolation constant. Next increase $S_(*)$ until (11.9) holds, all belt and replacement scanner scales are at least $n_(*)$, and

#[#set math.equation(numbering: n => "(11.16)")
 $ c_1 u^(rho_0) > 2 ceil.l C_B u ceil.r^beta #h(2em) \( u gt.eq S_(*) \) . $ <geometry:fine-clearance>]

This is possible because $rho_0 > beta$. Finally increase $k_0$ to ensure that initial belt scales exceed $S_(*)$, that all primary scales exceed $n_(*)$, and that all the uniform large-scale inequalities just used hold. For primaries this includes their same-layer gap $t_k > 2 n^beta$, their nonadjacent-layer gaps, and (11.15). Floors and ceilings only change fixed multiplicative constants.

We can now finish the geometric proposition. Retain just identifiers whose final actual regions meet $A$, and let $X_i$ be those intersections, ordered as above. There are finitely many, since these nonempty sets are pairwise disjoint subsets of a finite set. They partition $A \\ D$, and each lies in its birth template. Equations (11.4), (11.15), and the descendant clearance prove (11.3). For primaries, earlier same-label primaries are separated by $t_k$ in the same layer or by (11.5) in other layers. For belts and replacements, Lemma 37 and (11.16) prove (11.3). Restricting an older actual region to $A$ preserves these lower bounds.

There are at most $C b$ primaries per layer, and their scales satisfy $n gt.eq c 2^(\( 1 + 2 delta_0 \) k)$. Their error sum is therefore bounded by

$ C b sum_(k gt.eq k_0) 2^(- 100 \( 1 + 2 delta_0 \) k) lt.eq C' b . $

The total number of other tiles is $O \( b \)$ by (11.12), and each has $n gt.eq 1$. Their error sum is also $O \( b \)$. This proves every assertion of Proposition 34.

=== 11.8 Proof of the area law <proof-of-the-area-law>

#proof[
  The empty domain and the empty or full region have zero entropy. Put $b = \| partial_Lambda A \|$. If $b = 0$, Lemma 4 gives $S_Omega \( A \) = 0$.
  Assume $b > 0$. Choose $n_(*)$ large enough for Proposition 30 and Proposition 32 with $M = 100$ to apply to the templates of Proposition 34, uniformly with the stated template bounds. Increase it so that every radius $r$ supplied by amplification at scale $n gt.eq n_(*)$ satisfies $L + 2 r < n^beta$. Let $D \, X_i \, T_i \, n_i \, f_i$ be the resulting geometric decomposition, and put
  $ S_i = A ∩ #scale(x: 120%, y: 120%)[\(] T_i + \[ - L_i \, L_i \]_(bb(Z))^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) J_i = \( Lambda \\ A \) union union.big_(j < i\
f_j = f_i) X_j . $
  Here $\[ - L_i \, L_i \]_(bb(Z))^2$ denotes the integer square. For each $i$, let $r_i$ be the radius supplied by amplification, using the size, boundary, and information bounds from Proposition 30. The resulting mutual-information estimate applies to $A ∩ T_i$ against any sites outside the graph neighborhood $N_(2 r_i)^Lambda \( S_i \)$.
  We verify this condition for the whole set $J_i$, rather than for its individual pieces. A graph path of length at most $2 r_i$ from $S_i$ stays within ambient distance $L_i + 2 r_i < n_i^beta$ of $T_i$. Equation (11.3) excludes every earlier same-family $X_j$ jointly. Such a path also cannot reach $Lambda \\ A$: its first crossing of the cut would put an endpoint of a cut edge within that ambient distance of $T_i$, contradicting (11.3). Thus
  $ J_i subset.eq Lambda \\ N_(2 r_i)^Lambda \( S_i \) . $
  Proposition 32 and monotonicity under discarding part of its first system yield
  $ I_Omega \( X_i : J_i \) lt.eq I_Omega \( A ∩ T_i : J_i \) lt.eq C n_i^(- 100) . $
  These estimates all concern the same original state $Omega$, although the auxiliary construction used to prove each estimate may differ.
  Apply Lemma 33 to the two labels. Since each site has dimension $q$,
  $ S_Omega \( A \) lt.eq \| D \| log q + C / 2 sum_i n_i^(- 100) lt.eq C' b . $
  Every choice of threshold and every constant in this proof depends only on the fixed local dimension, interaction range and norm bound, and spectral gap. None depends on the size, shape, connectedness, or holes of $Lambda$, or on the choice of $A$. This proves the theorem. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
