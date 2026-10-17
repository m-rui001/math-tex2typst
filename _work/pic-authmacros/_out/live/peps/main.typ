#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Polynomial PEPS approximation of gapped \
square-grid ground states]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A projected entangled-pair state (PEPS) represents a many-body vector by local tensors joined along the edges of its interaction lattice. The central approximation question is whether ground states of gapped local Hamiltonians admit such representations with modest virtual dimensions. An entropy area law controls every bipartite cut, but a global vector approximation requires more: the descriptions at different cuts must be compatible, their errors must remain small through the entire lattice, and the final tensor network must use the prescribed edges.

We prove a uniform polynomial bound for square lattices with arbitrary bounded on-site and nearest-neighbor interactions. The only spectral assumption is a unique ground vector and a positive gap for the full Hamiltonian. We use the entropy area law and the collar estimates of #cite(label("RepoAreaLaw")), always with their full-system hypotheses. The new argument establishes the stronger representation conclusion.

=== 1.1 Statement of the result <statement-of-the-result>

For an integer $L gt.eq 2$, let $Lambda_L = { 1 \, dots.h \, L }^2$, with the nearest-neighbor square-lattice edge set $E \( Lambda_L \)$ and open boundary conditions. Put

$ cal(H)_(Lambda_L) = ⨂_(v in Lambda_L) bb(C)^q . $

A PEPS on this grid is the contraction obtained by placing $sum_(a = 1)^(D_e) \| a chevron.r ⊗ \| a chevron.r$ on each edge $e$ and applying at each vertex an arbitrary linear map

$ A_v : ⨂_(e in.rev v) bb(C)^(D_e) arrow.r bb(C)^q . $

Its maximum bond dimension is $max_e D_e$. The maps need not be isometries, and the resulting vector need not be normalized.

#thm([Theorem 1.1.])[
  #emph[Fix an integer $q gt.eq 2$ and constants $J \, Delta > 0$. There are constants $C \, c > 0$, depending only on $q \, J \, Delta$, with the following property. For every $L gt.eq 2$, consider any Hermitian Hamiltonian 
$ H = sum_(v in Lambda_L) h_v + sum_(e in E \( Lambda_L \)) h_e \, #h(2em) lr(bar.v.double h_v bar.v.double) \, lr(bar.v.double h_e bar.v.double) lt.eq J \, quad "(1.1)" $ <eq:model>

 where each summand is supported on its designated site or edge. Suppose that $H$ has a unique normalized ground vector $Omega$, up to phase, with ground energy $E_0$, and 
$ H - E_0 I gt.eq Delta #scale(x: 120%, y: 120%)[\(] I - \| Omega chevron.r chevron.l Omega \| #scale(x: 120%, y: 120%)[\)] . quad "(1.2)" $ <eq:global-gap>

 Then there is a nonzero PEPS $Phi$ on the same grid with maximum bond dimension at most $C L^c$ such that 
$ min_(theta in bb(R)) ∥Phi / lr(bar.v.double Phi bar.v.double) - e^(i theta) Omega∥ lt.eq L^(- 1) . quad "(1.3)" $ <eq:target-error>

]
] <thm:main>

Theorem 1 gives an affirmative resolution of the polynomial PEPS approximation assertion for the stated open-square Hamiltonian class. The relation to other formulations of the PEPS conjecture is explained below. No gap for restrictions to subregions, frustration freeness, commutativity, translation invariance, or path from a product state is assumed. The error in (1.3) concerns the entire vector. The theorem makes no claim that its tensors can be found or contracted efficiently; their entries may depend arbitrarily on $H$ and $Omega$.

=== 1.2 History and significance <history-and-significance>

Projected entangled-pair states extend matrix product states to higher-dimensional lattices by contracting virtual pairs through local maps #cite(label("VerstraeteCirac2004PEPS")). Their local tensor structure makes them natural candidates for describing ground states whose entanglement is concentrated near region boundaries. In one dimension, quantitative Schmidt-tail truncation estimates connect entanglement spectra with global MPS approximation #cite(label("VerstraeteCirac2006MPS")). Hastings established the entropy area law for unique ground states of uniformly gapped spin chains with bounded finite-range interactions and obtained polynomial-dimension MPS approximations #cite(label("Hastings2007")). The higher-dimensional question requires a representation compatible across many intersecting cuts.

There are several distinct PEPS approximation questions. The global formulation in #cite(label("CiracGarreRubioPerezGarcia2019")) Section 2.2, Questions 7–8 asks whether a spectral gap ensures polynomial bond dimension at inverse-polynomial Hilbert-space norm error. That formulation uses translation-invariant finite-range Hamiltonians on a torus. Theorem 1 addresses the corresponding assertion for arbitrary bounded on-site and nearest-neighbor interactions on an open square. Local-observable formulations instead control expectations on fixed-size regions; the stronger structural formulation in #cite(label("SchwarzBuerschaperEisert2017")) Conjecture 2 also requires an injective approximant with a gapped parent Hamiltonian. The theorem here concerns the full vector and imposes no such structural requirements on the approximant.

A positive local approximation result is due to Huang #cite(label("Huang2026Local")) Theorem 3. For states satisfying a Rényi entropy area law of fixed order $0 < alpha < 1$ across every rectangle, he obtains PEPS of bond dimension $e^(O \( 1 \/ delta \))$, independent of lattice size, that approximate norm-one local-observable expectations to error $delta$. The observable support scale is held fixed in this bound. The Rényi hypothesis is stronger than a von Neumann entropy area law, and the conclusion controls local expectations rather than global vector error.

An entropy bound and a representation theorem are different statements. For arbitrary chain-state families, bounded von Neumann block entropy does not ensure efficient global MPS approximation #cite(label("SchuchWolfVerstraeteCirac2008")). In higher dimensions, Ge and Eisert constructed families satisfying strong area laws that have no efficient classical tensor-network descriptions #cite(label("GeEisert2016")) Definition 7 and Corollary 9. Their description model includes a bound on the classical complexity of tensor entries; it should be distinguished from a bound on virtual dimension with arbitrary complex entries. These examples concern general states, rather than the uniformly gapped ground-state class in Theorem 1. They explain why one must control compatible operations and their accumulated error, in addition to the spectra of separate marginals.

Thermal tensor networks provide another approach. Hastings constructed local spectral filters and tensor-network descriptions of Gibbs operators #cite(label("Hastings2006Local")). Molnár, Schuch, Verstraete, and Cirac refined the thermal approximation and derived quasipolynomial-dimension ground-state PEPS under a gap together with a low-energy density-of-states bound #cite(label("MolnarSchuchVerstraeteCirac2015")) Section III.C. At inverse-polynomial accuracy their bond bound is exponential in a squared logarithm of system size. The low-energy counting condition is an additional hypothesis. A different cooling and postselection construction approximates the unique ground state of a gapped $d$-dimensional local Hamiltonian at the boundary of a $\( d + 1 \)$-dimensional PEPS #cite(label("SchuchWolfVerstraeteCirac2007Complexity")) Section V; transferring that representation to the original lattice is a further problem.

Recent tensor-network results also distinguish the dimension and the approximation task. Arad, Firanko, and Jain obtained two-dimensional mutual-information bounds for locally gapped frustration-free systems and polynomial-bond matrix product operator approximations to maximally mixed ground states in one dimension #cite(label("AradFirankoJain2026")) Corollaries 2.7 and 2.9. Such entropy or one-dimensional operator bounds do not provide the simultaneous original-grid PEPS conclusion needed here.

Our analytic inputs are the entropy area law and the stronger collar estimates of the companion #cite(label("RepoAreaLaw")). The present proof adapts its nested-filter and two-family ideas, and then develops compatible changes of ownership, compression of a distributed density network, and routing on the prescribed grid. The representation theorem uses the full companion interface recorded in Appendix 9, rather than the cutwise entropy inequality alone. Its polynomial bond bound permits arbitrary tensor entries and is an existence statement. The distinction from efficient contraction is substantive: general PEPS contraction has worst-case complexity obstructions #cite(label("SchuchWolfVerstraeteCirac2007Complexity")), although that fact alone does not classify the particular approximants constructed here.

=== 1.3 Proof strategy <proof-strategy>

The main intermediate object is a distribution of the physical registers among auxiliary parties. A party owns a collection of registers and may perform arbitrary linear contractions on them privately. At the start, one party holds the entire vector $Omega$; at the end, each physical site has its own party. Preparing the initial vector is permitted because we seek a representation, rather than an algorithm for finding it. The constraint is on communication: each party must participate in only boundedly many operations with other parties over its whole lifetime. Each such operation must also have a polynomial-size expansion built from private contractions and normalized bipartite vectors or covectors. The bipartite states themselves may have arbitrarily large Schmidt rank.

===== 1.3.1 Distributing the state while preserving a reference vector. <distributing-the-state-while-preserving-a-reference-vector.>

The parties are indexed by dyadic squares. We pass from the ownership assignment on one scale to that on the next by giving each child square its physical registers. Intermediate assignments need not be dyadic, and we use additional independent copies of $Omega$. Each copy has its own registers and ownership assignment; its reference vector remains $Omega$ in the original site coordinates, up to the small-patch encodings described below. The operations approximate these reference vectors with an error small enough to sum over the whole construction.

There are two analytic inputs. First, information between regions becomes negligible when their separation tapers linearly toward finitely many points but stays above a sufficiently large multiple of $log L$ (Proposition 7). Small mutual information lets the owner of a separating buffer split its purification approximately into two factors. This implements a change of owner for the interior region, or an exchange of assignments between two copies, using private maps and bipartite resources. To prove the information estimate, an ordered partition into two tile families bounds the conditional-information cost of adding a cell. Gaussian filtering with the full-system gap then resets that cost to an inverse power of $L$ after each annular step.

Second, near a logarithmic-size square we can project with high accuracy onto a sum of mutually orthogonal subspaces. Writing $cal(H)_A = ⨂_(v in A) bb(C)^q$ for the registers in $A subset.eq Lambda_L$, these subspaces have the form

$ "span" { v_(j ell) }_(ell = 1)^(d_j) ⊗ cal(H)_(Lambda_L \\ X_j) \, #h(2em) sum_j d_j lt.eq C L^c \, $

where the $X_j$ are nested square samples within the specified patch and $v_(j ell) in cal(H)_(X_j)$ are orthonormal inside vectors (Proposition 8). The radius is allowed to depend on $j$. Recording $\( j \, ell \)$ in a small register and replacing the corresponding inside vector by a fixed product vector gives the encoding used near junctions. The proof combines optimized nested filters, the gap, and the entropy area law; it does not require an accurate truncation at a single prescribed boundary. Section 6 uses these encodings to express suitable changes on small patches in terms of pair states and effects, even when their underlying Hilbert spaces are large.

The remaining geometric problem is to arrange that these operations suffice. Along a long edge, our separation estimate may not justify changing an old owner directly to a new one: a third owner can touch the opposite side of the region being changed. Exchanging part of an auxiliary copy first supplies the surrounding regions needed for successive changes of owner. Small patches handle the finitely many endpoints and junctions, where the separation would otherwise vanish. Section 7 assembles these moves so that a block party participates only in boundedly many nearby repaintings at each of two adjacent scales. Its total participation in operations with other parties is therefore bounded.

===== 1.3.2 Compressing the density and returning to a vector. <compressing-the-density-and-returning-to-a-vector.>

The distribution initially uses pair resources of unrestricted dimension. Theorem 10 replaces them in the density calculation by polynomial sums of product operators. To bound the error from replacing a chosen set of resources, we expand only operations involving the parties that hold their endpoints. Bounded lifetime participation limits the resulting coefficient cost. A Gaussian second-moment bound then controls the trace-norm error independently of all private dimensions and resource Schmidt ranks. This produces an operator tensor network with polynomial virtual dimensions on the party graph. The compression theorem is independent of the planar construction.

The protocol retains norm close to one, so its density and the compressed operator both approximate $\| Omega chevron.r chevron.l Omega \|$ in absolute trace norm. One product-basis column of the compressed operator gives a nonzero ket approximation after normalization. Finally, the links join parties at comparable nearby dyadic scales. Routing them along rows and columns through their dyadic anchors has constant edge congestion, and therefore preserves polynomial bond dimension on the original square grid. Section 8 proves these last steps and the main theorem.

Section 2 fixes the conventions and states the area law. Sections 3 and 4 prove the two analytic inputs above; Appendix 9 records their exact companion interfaces. All error powers, geometric constants, and polynomial exponents are fixed before taking $L$ large, uniformly in the individual Hamiltonian.

== 2 Conventions and entropy inputs <sec:preliminaries>

Fix the parameters of Theorem 1, and abbreviate $Lambda = Lambda_L$. Unsubscripted norms denote the operator norm for maps and the Euclidean norm for vectors; $lr(bar.v.double dot.op bar.v.double)_1$ and $lr(bar.v.double dot.op bar.v.double)_2$ denote trace and Hilbert–Schmidt norms. All Hilbert spaces are finite dimensional. Empty tensor products have dimension one. Constants denoted by $C \, c$ may change between occurrences. They depend only on $q \, J \, Delta$ and explicitly fixed numerical powers, geometric templates, or tolerances. A polynomial bound means $C L^c$ with this uniform dependence.

Plane distances are sup-norm distances. For a plane set $T$, write $T^(+ r) = { x : "dist"_oo \( x \, T \) lt.eq r }$; sampling always means intersection with the lattice, and physical sampling includes intersection with $Lambda$. Graph neighborhoods, when used for Hamiltonian locality, are neighborhoods in the induced physical lattice and lie in the corresponding ambient sup-norm enlargement. Distances to the empty set are infinite. Region complements in entropy formulas refer to the full physical system, unless another system is specified. Adjacent region letters denote their disjoint union.

For a normalized state $omega$ and a region $A$, let $rho_(omega \, A)$ be its marginal, and set

$ S_omega \( A \) & = - "Tr" rho_(omega \, A) log rho_(omega \, A) \,\
I_omega \( A : C \) & = S_omega \( A \) + S_omega \( C \) - S_omega \( A C \) \,\
I_omega \( A : C divides B \) & = S_omega \( A B \) + S_omega \( B C \) - S_omega \( B \) - S_omega \( A B C \) . $

Logarithms are natural and $0 log 0 = 0$. We omit the state subscript when it is $Omega$.

=== 2.1 The imported area law <the-imported-area-law>

The following is the range-one square-domain specialization of the companion theorem. Stating its uniformity here is useful because later auxiliary regions are not themselves assigned gapped Hamiltonians.

#thm([Proposition 2.1.])[
  (Entropy area law, #cite(label("RepoAreaLaw")) Theorem 1.1 and Corollary 1.2).  #emph[Under (1.1)–(1.2), there is $C_A = C_A \( q \, J \, Delta \)$ such that every $A subset.eq Lambda$ satisfies 
$ S_Omega \( A \) lt.eq C_A \| partial_Lambda A \| \, #h(2em) partial_Lambda A = { { x \, y } in E \( Lambda \) : x in A \, med y in.not A } . $

 The same constant works for every $L$ and every Hamiltonian in the class.]
] <prop:area-law>

The companion theorem allows any finite induced square-lattice domain, with one bounded Hermitian summand per designated nonempty support of bounded graph diameter. In (1.1) the diameter bound is one. Its only spectral assumption is the unique full-system ground vector and (1.2). These are precisely the hypotheses used here. For a physical sample $X$ of a square of radius $r$, this implies $S_Omega \( X \) lt.eq C \( 1 + r \)$, including squares clipped by the outer boundary.

We also use the companion’s sublinear collar and amplification propositions. Their geometric and exponent requirements are checked explicitly in Proposition 4; neither is a PEPS approximation statement. Appendix 9 records their exact interfaces, including the positive constraints and two-family construction underlying the companion argument. The complete companion is #cite(label("RepoAreaLaw")).

=== 2.2 Finite-dimensional information facts <finite-dimensional-information-facts>

We use strong subadditivity, the chain rule, monotonicity of mutual information under discarding systems, and, for a pure state on $A B C D$, the duality

$ I \( A : C divides B \) = I \( A : C divides D \) . $

These are standard entropy identities and inequalities; see #cite(label("LiebRuskai1973")) and the preliminary section of #cite(label("RepoAreaLaw")). For example $\| S \( A divides B \) \| lt.eq log dim cal(H)_A$, so the entropy cost of a bounded set of individual sites is bounded by its cardinality times $log q$.

For normalized density operators define $F \( rho \, sigma \) = lr(bar.v.double sqrt(rho) sqrt(sigma) bar.v.double)_1$ and $D \( rho bar.v.double sigma \) = "Tr" rho \( log rho - log sigma \)$, with the usual infinite value when the support condition fails.

We recall the relative-entropy estimate through quantum affinity #cite(label("CarlenLieb2014")) Equation (2.9) and Uhlmann’s purification-overlap theorem #cite(label("Uhlmann1976")) Sections 2 and 5. The finite-dimensional proof below fixes our root-fidelity convention and includes nonminimal purifying spaces.

#thm([Lemma 2.2.])[
  #emph[For normalized finite-dimensional states, 
$ F \( rho \, sigma \) gt.eq e^(- D \( rho bar.v.double sigma \) \/ 2) \, #h(2em) D \( rho_(A C) bar.v.double rho_A ⊗ rho_C \) = I \( A : C \) \, quad "(2.1)" $ <eq:fidelity-information>

 Moreover, after enlarging the purifying space if necessary, an isometry on that space realizes overlap $F \( rho \, sigma \)$ between purifications. In particular a mutual-information bound $delta$ gives purifications of the joint state and product state at vector distance at most $sqrt(delta)$, after phase choice, since $2 \( 1 - e^(- delta \/ 2) \) lt.eq delta$.]
] <lem:fidelity>

#proof[
  Write the eigenvalues and orthonormal eigenvectors of $rho \, sigma$ as $\( p_i \, \| i chevron.r \)$ and $\( q_j \, \| j' chevron.r \)$. When $D \( rho bar.v.double sigma \)$ is finite, $w_(i j) = p_i \| chevron.l i \| j' chevron.r \|^2$ is a probability distribution on its positive entries, and
  $ D \( rho bar.v.double sigma \) = sum_(i \, j) w_(i j) log p_i / q_j . $
  Convexity of the exponential gives
  $ "Tr" sqrt(rho) sqrt(sigma) = sum_(i \, j) w_(i j) exp #h(-1em) (- 1 / 2 log p_i / q_j) gt.eq e^(- D \( rho bar.v.double sigma \) \/ 2) . $
  Terms with $p_i = 0$ contribute zero. The trace norm is at least the absolute trace, proving the first inequality; the infinite case is immediate. The relative-entropy identity follows by taking the trace against $log \( rho_A ⊗ rho_C \) = log rho_A ⊗ I + I ⊗ log rho_C$ on its support.
  Canonical purifications have coefficient matrices $sqrt(rho)$ and $sqrt(sigma)$. Varying a unitary on a common sufficiently large purifying space makes their overlap range over $"Tr" \( sqrt(rho) sqrt(sigma) thin U \)$, up to a harmless transpose convention. Polar decomposition gives the maximum absolute value $lr(bar.v.double sqrt(rho) sqrt(sigma) bar.v.double)_1$. Every other purification is obtained from the canonical one by an isometry on the purifying factor. Enlarge the common factor to accommodate the entire original purifying space, extend the isometries to unitaries there, and restrict the maximizing unitary to the original factor. This proves the stated isometry form, including unused directions in a nonminimal purification. Finally, the squared vector distance of unit purifications with positive overlap $F$ is $2 \( 1 - F \)$. ◻
]

If $1 / 2 lr(bar.v.double rho - sigma bar.v.double)_1 lt.eq epsilon.alt lt.eq 1$, conditional entropy obeys

$ \| S \( A divides B \)_rho - S \( A divides B \)_sigma \| lt.eq 2 epsilon.alt log dim cal(H)_A + \( 1 + epsilon.alt \) h #h(-1em) (frac(epsilon.alt, 1 + epsilon.alt)) \, quad "(2.2)" $ <eq:entropy-continuity>

where $h$ is binary entropy #cite(label("Winter2016")) Lemma 2. The dimension is that of $A$, regardless of the purifying or conditioning space. We may also use the weaker consequence $C sqrt(epsilon.alt) log \( e dim cal(H)_A \)$. All retained physical logarithmic dimensions are $O \( L^2 \)$; hence increasing a fixed error power absorbs the continuity loss.

Finally, the gap directly implies

$ min_theta lr(bar.v.double psi - e^(i theta) Omega bar.v.double)^2 lt.eq 2 / Delta chevron.l psi \, \( H - E_0 I \) psi chevron.r quad "(2.3)" $ <eq:energy-vector>

for every normalized $psi$. Indeed the excitation energy bounds $Delta \( 1 - \| chevron.l Omega \, psi chevron.r \|^2 \)$, while phase minimization gives $2 \( 1 - \| chevron.l Omega \, psi chevron.r \| \)$.

== 3 Information bounds for separated regions <sec:information>

Throughout this section, distances in the plane are measured in the sup norm. The distance used in a Hamiltonian propagation estimate is the nearest-neighbor graph distance on the physical square; every graph ball is contained in the corresponding ambient sup-norm ball. As in Section 2, $F^(+ r)$ denotes the ambient radius-$r$ enlargement of a plane set $F$. Its physical sample is $Lambda ∩ F^(+ r)$. Ambient rectangles and squares include their unoccupied locations as well. Constants may depend on $q \, J \, Delta$ and on explicitly fixed geometric parameters, but not on $L$ or on the Hamiltonian. A lower threshold on $L$, or on a geometric scale, always has the same uniformity.

The purpose of this section is to prove that information is negligible between regions whose separation decreases linearly toward a fixed number of points, provided the separation is never smaller than a sufficiently large multiple of $log L$. We first extract a coarse collar estimate from the companion results, then prove a conditional information bound for one cell. A separate consequence of the global gap, using Gaussian spectral filtering as in #cite(label("Hastings2006Local")), reduces an information cost to an arbitrarily small inverse power of $L$ after shrinking the regions by a width proportional to that cost plus $log L$. Applying that reduction after each annular step gives the required logarithmic minimum separation.

=== 3.1 The coarse collar interface <the-coarse-collar-interface>

We specify the additional companion statements used here, beyond the entropy area law in Proposition 2. The constants $C_(upright("tpl"))$ and $D_0$ below are fixed template constants from the companion. In the terminology of #cite(label("RepoAreaLaw")) Sections 9 and 10, a template is a nonempty ambient lattice set

$ T = union.big_(a = 1)^(N_0) \( P_a ∩ bb(Z)^2 \) \, #h(2em) n gt.eq C_(upright("tpl")) N_0 \( s_0 + 1 \) \, #h(2em) "diam"_oo T lt.eq n \, $

where the pieces are closed rectangles or triangles, have sup diameter at most $s_0$, and have sides of slopes $0 \, oo \, 1 \, - 1$. The companion also fixes a physical cut $A subset.eq Lambda$ and its set $Z_A$ of crossing-edge endpoints. Its template-clearance assumption is $"dist"_oo \( T \, Z_A \) > 4 D_0 s_0$. Put

$ epsilon_(upright("col")) = 10^(- 5) \, #h(2em) ell = floor.l n^(1 - epsilon_(upright("col"))) floor.r \, #h(2em) T_ell = T + \( \[ - ell \, ell \]^2 ∩ bb(Z)^2 \) . $

The Proposition “A sublinear collar bound” in #cite(label("RepoAreaLaw")) Section 9 states that, when $ell lt.eq s_0$ and the scale is sufficiently large,

$ X & = A ∩ T \, #h(2em) S_0 = A ∩ T_ell \,\
I_Omega \( X : Lambda \\ S_0 \) & lt.eq C n^(1 - epsilon_(upright("col"))) . quad "(3.1)" $ <eq:info-repository-collar>

It also supplies $\| S_0 \| lt.eq C n^2$ and $C n$ upper bounds for the numbers of physical crossing edges of all three cuts $X \, S_0 \, S_0 \\ X$. All constants and thresholds are uniform in the domain, cut, and admissible template.

The Proposition “Amplification” in #cite(label("RepoAreaLaw")) Section 10 uses precisely these size, three-cut, and information hypotheses, with any fixed common upper-bound constant. Its fixed exponents are

$ beta_0 = 1 - 2 dot.op 10^(- 6) \, #h(2em) alpha = frac(k, k + 1) > 1 - 10^(- 6) \, $

where $k$ is a sufficiently large fixed integer. For every fixed integer $M gt.eq 1$, it gives a graph radius $r$ such that

$ ell + 2 r = o \( n^(beta_0) \) \, #h(2em) I_Omega \( X : E \) lt.eq C_M n^(- M) quad upright("whenever ") E subset.eq Lambda \\ N_(2 r) \( S_0 \) . quad "(3.2)" $ <eq:info-repository-amplification>

Here $N_(2 r)$ is a physical graph neighborhood. The positive system required by that Proposition is furnished by the Proposition “Positive replacement of the Hamiltonian” in #cite(label("RepoAreaLaw")) Section 4, for each prescribed integer $k$. That replacement assumes the original full-system eigenvector and gap inequality. Its constants may depend on $k$, which is fixed here. It does not assume a gap for any restricted Hamiltonian. Our on-site and nearest-neighbor Hamiltonian has induced-graph range one and one bounded term per designated support, so it satisfies the bounded-interaction hypotheses of all these results.

#thm([Proposition 3.1.])[
  (Coarse information outside a sublinear collar).  #emph[Fix an integer $N_0 gt.eq 1$ and a constant $A_0 gt.eq 1$. There are $beta < 1$, $C < oo$, and $u_0 < oo$ such that the following holds. Let $u gt.eq u_0$ and let $T$ be the full ambient lattice sample of a union of at most $N_0$ axis-parallel rectangles, with $"diam"_oo T lt.eq A_0 u$. For every physical set $E subset.eq Lambda$ satisfying 
$ "dist"_oo \( E \, T \) > u^beta \, $

 one has 
$ I_Omega \( Lambda ∩ T : E \) lt.eq C . $

 The same statement holds for any subset of $Lambda ∩ T$ in its first argument, for rectangles with consistently assigned open or closed sides, and after a common translation of the lattice coordinates.]
] <prop:coarse>

#proof[
  An empty ambient sample gives the assertion immediately. Otherwise omit the empty pieces, choose an integer $s_0$ comparable to $u$ and large enough to bound every piece diameter, and then choose an integer $n$ comparable to a sufficiently large fixed multiple of $u$. These choices ensure both template inequalities. The prescribed cut is $A = Lambda$. Consequently $Z_A = diameter$, so all template-clearance conditions are vacuous. Since the ratio $n \/ s_0$ is fixed,
  $ floor.l n^(1 - epsilon_(upright("col"))) floor.r lt.eq s_0 $
  for all sufficiently large $u$. Equation (3.1) therefore supplies every hypothesis of (3.2); fix its common constant once and apply it, for example, with $M = 1$.
  Choose $beta$ strictly between $beta_0$ and $1$. Because $n$ is a fixed multiple of $u$,
  $ ell + 2 r < u^beta $
  for sufficiently large $u$. A graph neighborhood of $S_0$ of radius $2 r$ is contained in the physical sample of the ambient enlargement of $T$ by $ell + 2 r$. Hence every $E$ in the statement is an allowable remote set in (3.2). The bound $C_1 n^(- 1)$ is in particular uniformly bounded. Discarding part of the first system cannot increase mutual information.
  On the lattice, a rectangle with some open sides has the same sample as a closed rectangle with suitably shifted sides; the shifts can be arbitrarily small unless an endpoint lies on a lattice line, in which case they can still be chosen without changing the selected sites. The diameter bounds change by at most a fixed additive amount. A common coordinate translation can be undone before using the companion statements. Increasing the threshold and constants proves these versions too. ◻
]

=== 3.2 A conditional information bound for a cell <a-conditional-information-bound-for-a-cell>

The next construction adapts the two-family ordering in #cite(label("RepoAreaLaw")) Section 11 to a cell with arbitrary exterior conditioning. We prove the construction and its conditioning order here. We use ambient colors in the next construction. Missing physical sites are simply ignored when taking entropies. Boundaries of all chambers are assigned by one consistent infinitesimal generic displacement; equivalently, one works with open chambers, uses their closures for distance estimates, and then samples with a common tie convention. Only finitely many chamber boundaries occur at a fixed instance. No color is assigned exclusively to a lower-dimensional face.

#thm([Lemma 3.2.])[
  (Conditional information of one cell).  #emph[Fix $c > 0$. Tile the plane by an axis-parallel grid of squares of side $s gt.eq 1$. Let $G$ be the physical sample of one cell, let $B$ be the physical sample of any union of other cells, and let $C subset.eq Lambda \\ \( B union G \)$ satisfy 
$ "dist"_oo \( C \, overline(G)_(upright("amb")) \) gt.eq c s \, $

 where $overline(G)_(upright("amb"))$ denotes the full closed ambient cell. There are fixed constants $C_1 \, K < oo$ such that 
$ I_Omega \( G : C divides B \) lt.eq C_1 \( 1 + log s \)^K . quad "(3.3)" $ <eq:info-cell-cmi>

 The constants are independent of which exterior cells comprise $B$ and of the shape of $C$ away from the cell.]
] <lem:cell-cmi>

#proof[
  Outside the chosen cell, color all cells of $B$ by forbidden color $0$ and all other cells by forbidden color $1$. In particular this colors also the physical sites outside $B \, G \, C$. The interior of the chosen cell is initially allowed. We construct two ordered tile families $cal(F)_0 \, cal(F)_1$, together with a set of exceptional sites. The order in a family is its order of creation. Whenever an allowed region is assigned to family $i$, give it forbidden color $i$ for all subsequent stages. A tile $U$ in family $i$ will satisfy
  $ I_Omega #scale(x: 120%, y: 120%)[\(] U : C union F_i union { upright("earlier tiles of family ") i } #scale(x: 120%, y: 120%)[\)] lt.eq C_2 \, quad "(3.4)" $ <eq:info-tile-cost>
  where $F_i$ is the physical exterior of the initial cell of forbidden color $i$. Tile notation in an entropy denotes its physical sample.
  Assume for the moment that such a partition has been constructed. Its information cost bounds the desired conditional information as follows. Apply the chain rule for $I \( G : C divides B \)$ by listing first $cal(F)_0$ in creation order, then all exceptional sites, then $cal(F)_1$ in reverse creation order. For a tile $U$ the chain-rule term is $I \( U : C divides Z \)$, where $Z$ is $B$ together with previously listed sites. In family $0$,
  $ I \( U : C divides Z \) = I \( U : C Z \) - I \( U : Z \) lt.eq I \( U : C Z \) \, $
  and $Z$ consists of forbidden-$0$ exterior sites and earlier family-$0$ tiles. Equation (3.4) applies. For a family-$1$ tile, purity on the whole physical system gives
  $ I \( U : C divides Z \) = I #scale(x: 120%, y: 120%)[\(] U : C divides \( U C Z \)^c #scale(x: 120%, y: 120%)[\)] . $
  The complementary conditioning set contains only forbidden-$1$ exterior sites and as-yet unprocessed family-$1$ tiles. Because this family is processed in reverse order, those tiles were created earlier than $U$. Bounding the last conditional mutual information by the ordinary mutual information with $C union \( U C Z \)^c$ again invokes (3.4). Each exceptional one-site term is at most $2 log q$, by the conditional entropy dimension bound. Thus the desired bound follows once the number of tiles and exceptional sites is at most $C \( 1 + log s \)^K$. This explains both the two exterior colors and the opposite orders in which the two families will be read.
  We now construct that partition by an ambient recursion. Fix
  $ beta < gamma < gamma' < 1 \, $
  with $beta$ from Proposition 4 for bounded rectangular unions. At a given generation, all allowed residual material lies in active axis-parallel squares of a common side $u$. Distinct active squares have mutual distance greater than $10 u$. In the ambient radius-$u$ padding of each active square, the three labels (allowed, forbidden $0$, forbidden $1$) are constant on chambers of boundedly many horizontal and vertical lines. The square sides are included, and distinct parallel lines are at least $u \/ 8$ apart. Initially there is one active square, the original grid cell, with $u = s$. Its padded window meets only boundedly many grid lines, which verifies the invariant regardless of the exterior color choices.
  Choose a sufficiently large fixed stopping threshold $u_(*)$. At a nonterminal square put $t_0 = u^gamma$. Increase $u_(*)$ so that all inequalities below hold for $u gt.eq u_(*)$. Around each represented line intersection within distance $10 t_0$ of the square, reserve a closed square of radius $4 t_0$ for the next generation. Reserving a hole does not change a previously fixed color; only still-allowed material is reserved. The hole squares are disjoint. Every allowed point of the active square outside these holes can see at most one forbidden color within distance $t_0$. Indeed it cannot see two parallel represented lines, because $2 t_0 < u \/ 8$. If it sees both orientations, their intersection is within distance $t_0$ of the point and belongs to a reserved hole, a contradiction. Thus its neighborhood sees at most one line. The chamber on its own side is allowed, and the chamber on the other side has at most one forbidden color.
  Using the colors as they were at the start of this generation, assign to family $1$ every remaining allowed point within distance $t_0$ of forbidden color $0$. Assign all other remaining allowed points to family $0$. The new family-$0$ tile is at least $t_0$ from the old forbidden-$0$ set. The new family-$1$ tile is at least $t_0$ from the old forbidden-$1$ set, by the preceding one-color observation. There is at most one tile of each family per active square. Tiles of the same family in different active squares are farther apart still, so they may be ordered arbitrarily within the generation. The distance tests in the sup norm are unions of axis-parallel box enlargements; after also deleting the bounded list of holes, each new tile is a union of boundedly many rectangular chambers of total diameter $O \( u \)$.
  The ambient template of such a tile is at distance at least $t_0$ from the physical old forbidden set of its own family. It is also at distance at least $c s$ from $C$, since the tile lies in the original cell. Since $u lt.eq s$ and $gamma > beta$, both distances exceed the collar required by Proposition 4 after increasing $u_(*)$. This proves (3.4) for every new tile. In particular, it bounds the information with the union of all earlier tiles of that family, not just with any one earlier tile.
  The new active squares are the reserved holes that contain allowed material. Their side is
  $ u' = 8 t_0 . $
  Distinct represented intersections are separated by at least $u \/ 8$. Thus, for sufficiently large $u_(*)$, the new squares are at mutual distance greater than $10 u'$. Squares descending from different parents inherit even larger separation. To verify the chamber invariant, consider a child’s radius-$u'$ padded window, of radius $12 t_0$ about its center. The old line spacing implies that the only old horizontal and vertical lines in this window are the lines through its center. New boundaries in the window occur only at offsets
  $ 0 \, quad plus.minus t_0 \, quad plus.minus 4 t_0 $
  from those two lines: these account for the distance test, the reserved hole, and any clipping by the old active-square sides. Other holes and old parallel lines are outside the window. Consequently the new parallel-line spacing is at least $t_0 = u' \/ 8$, and the number of lines is uniformly bounded. This proves the invariant at the next generation. The same verification covers a reserved hole centered on or slightly outside a parent side; old fixed colors are retained and only the allowed intersection is processed.
  At scale below $u_(*)$, stop and make every remaining physical site exceptional. There are boundedly many children per active square and boundedly many sites in each terminal square. Choose $u_(*)$ also so that
  $ 8 u^gamma lt.eq u^(gamma') #h(2em) \( u gt.eq u_(*) \) . $
  The number of generations is $O \( 1 + log log \( s + e \) \)$. Bounded branching therefore bounds the total number of tiles and exceptional sites by $C \( 1 + log s \)^K$ for some fixed $C \, K$. If $s < u_(*)$, the direct bound $I \( G : C divides B \) lt.eq 2 \| G \| log q$ already has this form. The boundary convention stated before the Lemma preserves all separation estimates on closures. Each sampled tile remains a sampled rectangular union, so it is covered by Proposition 4. The entropy reduction at the start of the proof now gives (3.3). ◻
]

=== 3.3 Reducing a collar information cost with the global gap <reducing-a-collar-information-cost-with-the-global-gap>

We use Lemma 3 in the following form. For density operators with $"supp" rho subset.eq "supp" sigma$,

$ lr(bar.v.double sqrt(rho) sqrt(sigma) bar.v.double)_1 gt.eq exp (- 1 / 2 "Tr" rho \( log rho - log sigma \)) \, quad "(3.5)" $ <eq:info-relative-entropy-overlap>

and, after enlarging the purifying space if necessary, an isometry on that space realizes the corresponding overlap with a prescribed purification. In particular the original purifying buffer need not be minimal. All enlarged factors will be removed before a Hamiltonian locality estimate is applied.

#thm([Lemma 3.3.])[
  (Information reset).  #emph[For every fixed $p > 0$ there is $C_p < oo$ with the following property for all sufficiently large $L$. Let $R \, C subset.eq Lambda$ be disjoint, let $R_0 subset.eq R$ and $C_0 subset.eq C$, and suppose 
$ I_Omega \( R : C \) lt.eq b \, #h(2em) b gt.eq 0 . $

 If 
$ "dist"_oo \( R_0 \, Lambda \\ R \) > w \, #h(2em) "dist"_oo \( C_0 \, Lambda \\ C \) > w \, #h(2em) w = C_p \( 1 + b + log L \) \, quad "(3.6)" $ <eq:info-reset-width>

 then 
$ I_Omega \( R_0 : C_0 \) lt.eq L^(- p) . $

 Only the original full-system gap is assumed.]
] <lem:reset>

#proof[
  If either core is empty there is nothing to prove. Use two replicas and put
  $ Psi = Omega^(⊗ 2) \, #h(2em) F = F_R \, #h(2em) Phi = F Psi \, $
  where $F_R$ exchanges the two replicas on $R$. Our aim is to construct a unitary $U$, supported outside $R_0 union C_0$ in both replicas, for which $U Psi$ is close to $Phi$. Such a unitary leaves the joint core marginal in one replica unchanged. In $Phi$, however, $R_0$ and $C_0$ come from different original replicas, so this marginal is $rho_(R_0) ⊗ rho_(C_0)$. Closeness of the two vectors will therefore force small information between the cores.
  We first obtain a controlled overlap using an operator on the physical buffer $Q = \( R union C \)^c$ of the two replicas. Spectral filtering and localization will turn it into a two-sided approximation to the desired map; its polar factor will supply $U$ on the same physical support.
  The relative entropy of $rho_(R C)$ from $rho_R ⊗ rho_C$ is $I_Omega \( R : C \)$. The required support inclusion holds: positivity implies that a joint state is supported on the tensor product of the supports of its marginals. For example, the expectation of the positive joint state on the kernel projector of either marginal is zero, so that projector annihilates the joint state. Equation (3.5) and the purification formula therefore give an isometry
  $ V : cal(H)_Q arrow.r cal(H)_(b_R) ⊗ cal(H)_(b_C) $
  and normalized vectors $a_(R b_R)$, $a'_(C b_C)$ such that
  $ \| chevron.l a ⊗ a' \, \( "id"_(R C) ⊗ V \) Omega chevron.r #scale(x: 120%, y: 120%)[\|] gt.eq e^(- b \/ 2) . quad "(3.7)" $ <eq:info-split-overlap>
  The factors $b_R \, b_C$ may first be enlarged by blank ancillary factors so that the product purification and an isometric embedding of the whole original buffer both fit. Let $tilde(Omega) = \( "id"_(R C) ⊗ V \) Omega$. Its largest Schmidt probability across $R b_R divides C b_C$ is at least $e^(- b)$, hence
  $ "Tr" rho_(tilde(Omega) \, R b_R)^2 gt.eq e^(- 2 b) . $
  Pull the swap on $b_R$ back to the original doubled buffer:
  $ W = \( V^dagger ⊗ V^dagger \) F_(b_R) \( V ⊗ V \) . $
  It is a Hermitian contraction on the two physical copies of $Q$. The auxiliary spaces have now disappeared. Since $V$ acts outside $R$, the swap identity for purity gives the real positive number
  $ z := chevron.l Phi \, W Psi chevron.r = chevron.l tilde(Omega)^(⊗ 2) \, F_R F_(b_R) tilde(Omega)^(⊗ 2) chevron.r = "Tr" rho_(tilde(Omega) \, R b_R)^2 gt.eq e^(- 2 b) . quad "(3.8)" $ <eq:info-reset-overlap>
  Write $bb(H)$ for the sum of the original Hamiltonian on the two replicas and $bb(H)' = F bb(H) F^dagger$. Treat the pair of replica registers at a site as one site. Both Hamiltonians have range one and uniformly bounded interaction degree and strength. Their unique ground vectors are $Psi \, Phi$, their common ground energy is $cal(E) = 2 E_0$, and their gaps are at least $Delta$. Their difference is supported on endpoints of edges crossing $R$: terms entirely inside $R$ merely exchange the two identical replica terms, and all other noncrossing terms are unchanged.
  Put $B_(*) = 1 + b + log L$ and choose a fixed error exponent $r_(*) = 2 p + 10$. For $h > 0$, let
  $ g_h \( t \) = \( 2 pi h \)^(- 1 \/ 2) e^(- t^2 \/ \( 2 h \)) \, #h(2em) M = integral_(bb(R)) g_h \( t \) e^(i t bb(H)') W e^(- i t bb(H)) thin d t . $
  This is a contraction. The spectral theorem gives
  $ M Psi = e^(- h \( bb(H)' - cal(E) \)^2 \/ 2) W Psi \, #h(2em) M^dagger Phi = e^(- h \( bb(H) - cal(E) \)^2 \/ 2) W^dagger Phi . $
  Consequently
  $ lr(bar.v.double M Psi - z Phi bar.v.double) \, quad lr(bar.v.double M^dagger Phi - z Psi bar.v.double) lt.eq e^(- h Delta^2 \/ 2) . quad "(3.9)" $ <eq:info-gaussian-two-sided>
  Choose $h = A B_(*)$ with $A Delta^2 \/ 2 gt.eq 10 + r_(*) + 20$. The errors in (3.9) are then bounded by $e^(- 10 b) L^(- r_(*))$ up to a harmless fixed factor. Truncate the integral to $\| t \| lt.eq T = T_0 B_(*)$. The resulting operator-norm error is at most
  $ 2 e^(- T^2 \/ \( 2 h \)) = 2 e^(- T_0^2 B_(*) \/ \( 2 A \)) . $
  Choosing $T_0$ after $A$ with $T_0^2 \/ \( 2 A \) gt.eq 10 + r_(*) + 20$ gives the same error bound.
  For completeness we prove the finite-time locality estimate needed to localize this truncated integral. It is the usual commutator argument for bounded finite-range interactions; see also #cite(label("NachtergaeleOgataSims2006")). For a norm-one single-site operator $B_y$, define
  $ c_y \( S \, t \) = sup_("supp" A subset.eq S\
lr(bar.v.double  bar.v.double) A lt.eq 1) lr(bar.v.double \[ tau_t \( A \) \, B_y \] bar.v.double) \, #h(2em) tau_t \( A \) = e^(i t K) A e^(- i t K) \, $
  where $K$ is either doubled Hamiltonian. If its interaction terms are $k_Z$, then, for $t gt.eq 0$,
  $ c_y \( S \, t \) lt.eq c_y \( S \, 0 \) + 2 sum_(Z : Z ∩ S eq.not diameter) lr(bar.v.double k_Z bar.v.double) integral_0^t c_y \( Z \, v \) thin d v . quad "(3.10)" $ <eq:info-commutator-recursion>
  Indeed $\[ K \, A \]$ contains only interactions meeting the initial support $S$. Differentiate $\[ tau_t \( A \) \, B_y \]$ and use Jacobi’s identity. The homogeneous part is commutation by the Hermitian operator $sum_(Z : Z ∩ S eq.not diameter) tau_t \( k_Z \)$ and is removed by a unitary change of frame. The remaining term for $Z$ has norm at most $2 lr(bar.v.double  bar.v.double) A lr(bar.v.double k_Z bar.v.double) c_y \( Z \, t \)$, proving (3.10). Negative times have the same bound.
  Iteration produces chains of overlapping interaction supports with factorial time denominators. Only chains reaching $y$ contribute an initial commutator. The first support has at most $C \| S \|$ choices, each subsequent support has at most a fixed number of choices, and a chain reaching distance $d_K \( S \, y \)$ must have length at least a fixed multiple of that distance, up to an additive constant. Here $d_K$ is the physical site-graph distance; for either doubled Hamiltonian it is the original nearest-neighbor distance. Bounding the resulting exponential series with a weight on chain length yields constants $v \, mu \, C > 0$ such that
  $ lr(bar.v.double \[ tau_t \( A \) \, B_y \] bar.v.double) lt.eq C \| S \| lr(bar.v.double  bar.v.double) A exp #scale(x: 120%, y: 120%)[\(] v \| t \| - mu d_K \( S \, y \) #scale(x: 120%, y: 120%)[\)] . quad "(3.11)" $ <eq:info-lr>
  The remainder of the iteration vanishes by its factorial denominator. The constants depend only on the fixed local interaction bounds.
  For a site set $D$, let $cal(P)_D$ be conditional expectation onto operators supported on $D$, obtained by averaging over independent unitaries at all sites outside $D$. It contracts operator norm and preserves Hermitian operators. Successively averaging single sites and using (3.11) gives
  $ lr(bar.v.double tau_t \( A \) - cal(P)_(N_ell \( S \)) tau_t \( A \) bar.v.double) lt.eq C \| S \| L^2 lr(bar.v.double  bar.v.double) A thin e^(v \| t \| - mu ell) . quad "(3.12)" $ <eq:info-operator-localization>
  No Hilbert-space dimension appears in this averaging bound.
  Let $Z_R$ be the endpoints of edges crossing $R$, and put
  $ V \( t \) = e^(i t bb(H)') e^(- i t bb(H)) . $
  Its left generator is
  $ frac(d, d t) V \( t \) = i G \( t \) V \( t \) \, #h(2em) G \( t \) = e^(i t bb(H)') \( bb(H)' - bb(H) \) e^(- i t bb(H)') . $
  The difference $bb(H)' - bb(H)$ is a sum of $O \( L^2 \)$ uniformly bounded terms, each on at most two sites of $Z_R$. Apply (3.12) to those terms separately and replace $G \( t \)$ by $G_ell \( t \) = cal(P)_(N_ell \( Z_R \)) G \( t \)$. This replacement is Hermitian, and
  $ lr(bar.v.double G \( t \) - G_ell \( t \) bar.v.double) lt.eq C L^4 e^(v \| t \| - mu ell) . $
  The evolution $V_ell \( t \)$ generated by $G_ell \( t \)$, with $V_ell \( 0 \) = "id"$, is unitary and supported on $N_ell \( Z_R \)$. Duhamel’s formula for two unitary evolutions therefore gives
  $ lr(bar.v.double V \( t \) - V_ell \( t \) bar.v.double) lt.eq C L^4 \| t \| e^(v \| t \| - mu ell) . $
  Localize $e^(i t bb(H)') W e^(- i t bb(H)')$ by conditional expectation onto $N_ell \( Q \)$. It stays a contraction, and its error is at most $C L^4 e^(v \| t \| - mu ell)$. The factorization
  $ e^(i t bb(H)') W e^(- i t bb(H)) = #scale(x: 120%, y: 120%)[\(] e^(i t bb(H)') W e^(- i t bb(H)') #scale(x: 120%, y: 120%)[\)] V \( t \) $
  thus has a contraction approximation supported on
  $ S = N_ell \( Q union Z_R \) $
  with operator-norm error at most $C L^4 \( 1 + T \) e^(v T - mu ell)$ uniformly for $\| t \| lt.eq T$. If $Q$ or $Z_R$ is empty, its factor is already a scalar or the identity and needs no localization.
  Take $ell = ceil.l K_(upright("loc")) B_(*) ceil.r$. Because $log L lt.eq B_(*)$ and $log \( 1 + T \) lt.eq C + B_(*)$, a sufficiently large fixed $K_(upright("loc"))$, chosen after $T_0$, makes the last error at most $C e^(- 10 b) L^(- r_(*))$. Averaging the localized integrands against the truncated Gaussian gives a square operator $M_(upright("loc"))$ supported on $S$, with $lr(bar.v.double M_(upright("loc")) bar.v.double) lt.eq 1$. Combining the three errors, we have
  $ lr(bar.v.double M_(upright("loc")) Psi - z Phi bar.v.double) \, quad lr(bar.v.double M_(upright("loc"))^dagger Phi - z Psi bar.v.double) lt.eq C e^(- 10 b) L^(- r_(*)) . quad "(3.13)" $ <eq:info-local-two-sided>
  Set $D = M_(upright("loc")) \/ z$. We arranged both estimates in (3.13) so that, besides mapping $Psi$ close to $Phi$, $D$ is almost isometric on $Psi$: applying $D^dagger$ to the first error and adding the second controls $\( D^dagger D - "id" \) Psi$. By (3.8) and (3.13),
  $ lr(bar.v.double  bar.v.double) D & lt.eq e^(2 b) \,\
lr(bar.v.double D Psi - Phi bar.v.double) \, quad lr(bar.v.double D^dagger Phi - Psi bar.v.double) & lt.eq C e^(- 8 b) L^(- r_(*)) \,\
lr(bar.v.double \( D^dagger D - "id" \) Psi bar.v.double) & lt.eq C e^(- 6 b) L^(- r_(*)) . quad "(3.14)" $ <eq:info-reset-polar-errors>
  For the last estimate, write the defect as $D^dagger \( D Psi - Phi \) + \( D^dagger Phi - Psi \)$. The polar partial isometry of $D$, as a square operator on the finite space $cal(H)_S$, extends to a unitary $U$ on that same space. Indeed its two support subspaces have the same dimension, as do their orthogonal complements. Tensor this unitary with the identity outside $S$. If $\| D \| = \( D^dagger D \)^(1 \/ 2)$, then the scalar inequality $\( sqrt(x) - 1 \)^2 lt.eq \( x - 1 \)^2$ for $x gt.eq 0$ gives
  $ lr(bar.v.double \( U - D \) Psi bar.v.double) = lr(bar.v.double \( "id" - \| D \| \) Psi bar.v.double) lt.eq lr(bar.v.double \( "id" - D^dagger D \) Psi bar.v.double) . $
  Consequently
  $ lr(bar.v.double U Psi - Phi bar.v.double) lt.eq C e^(- 6 b) L^(- r_(*)) lt.eq C L^(- r_(*)) . quad "(3.15)" $ <eq:info-reset-unitary>
  In particular, the large norm of $D$ has been explicitly paid for in (3.14); no unitary dilation on an additional system is used.
  We check the support against both cores. Every site of $Q$ is more than $w$ from $R_0$ and from $C_0$. For an edge crossing $R$, write its endpoints as $x in R$ and $y in.not R$. The point $y$ is more than $w$ from $R_0$, so $x$ is more than $w - 1$ from $R_0$. Since $R ∩ C$ is empty, $x in C^c$ is more than $w$ from $C_0$, so $y$ is more than $w - 1$ from $C_0$. Thus every site of $Z_R$ is more than $w - 1$ from both cores. Choose $C_p$ in (3.6) larger than $K_(upright("loc")) + 3$. Then $S = N_ell \( Q union Z_R \)$ is disjoint from both cores in both replicas, including the rounding of $ell$.
  The unitary $U$ therefore leaves their joint two-copy marginal unchanged. In $Phi = F_R Psi$, retaining $R_0$ and $C_0$ from one replica gives exactly $rho_(R_0) ⊗ rho_(C_0)$, because $R_0$ came from the other original replica and $C_0$ did not. Equation (3.15) and trace-norm contractivity under partial trace show that the original $R_0 C_0$ marginal is within trace distance $C L^(- r_(*))$ of this product. The conditional entropy continuity bound
  $ \| S \( A divides B \)_rho - S \( A divides B \)_sigma \| lt.eq 2 delta log dim cal(H)_A + \( 1 + delta \) h (frac(delta, 1 + delta)) lt.eq C sqrt(delta) log \( e dim cal(H)_A \) \, $
  where $delta = 1 / 2 lr(bar.v.double rho - sigma bar.v.double)_1$ and $h$ is binary entropy, is valid for normalized finite-dimensional states #cite(label("Winter2016")). Applied to $I \( R_0 : C_0 \) = S \( R_0 \) - S \( R_0 divides C_0 \)$, it costs at most $C sqrt(delta) thin L^2$, since $q$ is fixed. We conclude
  $ I_Omega \( R_0 : C_0 \) lt.eq C L^(2 - r_(*) \/ 2) = C L^(- p - 3) lt.eq L^(- p) $
  for sufficiently large $L$. This proves the Lemma. ◻
]

=== 3.4 Regions tapering toward finitely many points <regions-tapering-toward-finitely-many-points>

#thm([Proposition 3.4.])[
  (Information under angular separation).  #emph[Fix $a > 0$, $A_0 gt.eq 1$, an integer $m_0 gt.eq 0$, and $p > 0$. There is $D < oo$ such that the following holds for all sufficiently large $L$. Let $cal(V)$ be a set of at most $m_0$ marked points in the plane, let $X \, E subset.eq Lambda$ be disjoint, and let 
$ D log L lt.eq n lt.eq A_0 L \, #h(2em) "diam"_oo X lt.eq A_0 n . $

 Put $s_min = D log L$ and $d_(cal(V)) \( x \) = min_(v in cal(V)) \| x - v \|_oo$, with $d_diameter = + oo$. Suppose that for every $x in X$, 
$ "dist"_oo \( x \, E \) gt.eq a max { s_min \, min \( n \, d_(cal(V)) \( x \) \) } . quad "(3.16)" $ <eq:info-angular-separation>

 Then 
$ I_Omega \( X : E \) lt.eq L^(- p) . $

 The constant $D$ and the scale threshold are uniform in the marked points, physical sets, and Hamiltonian.]
] <prop:angular>

#proof[
  An empty target or exterior is immediate. Fix a small constant $a' > 0$, for example $a' < min \( a \/ 100 \, 1 \/ 100 \)$, and then fix $0 < d < a' \/ 4$. These choices depend only on the fixed geometric data. Choose dyadically decreasing scales
  $ s_j = 2^(- j) n quad \( 0 lt.eq j lt.eq m \) \, #h(2em) s_min lt.eq s_m < 2 s_min . $
  We process $X$ from farthest to nearest the marked points. If $m gt.eq 1$, the first layer is ${ x in X : d_(cal(V)) \( x \) gt.eq n }$, including all greater distances. For $1 lt.eq j < m$, the new layer is ${ x in X : s_j lt.eq d_(cal(V)) \( x \) < 2 s_j }$. The last layer consists of all remaining points, namely those with $d_(cal(V)) \( x \) < 2 s_m$. When $m = 0$, there is just one layer, equal to $X$. Denote the cumulative processed set at scale $s_j$ by $A_j$. In every case (3.16) implies
  $ "dist"_oo \( A_j \, E \) gt.eq a / 2 s_j . quad "(3.17)" $ <eq:info-cumulative-separation>
  For all nonfinal layers one may replace $a \/ 2$ by $a$; the factor $1 \/ 2$ allows the last scale to be as large as $2 s_min$.
  Each new layer has a cover by a bounded number of ambient squares of side $s_j$. Away from the first layer, it lies in the union of the radius-$2 s_j$ squares about the at most $m_0$ marked points. For the first or sole layer the diameter bound on $X$ gives such a cover. The bound depends on $A_0 \, m_0$ but not on the shapes of the layers.
  After processing scale $s = s_j$, we establish the invariant
  $ I_Omega \( Lambda ∩ A_j^(+ a' s) : Lambda ∩ E^(+ a' s) \) lt.eq L^(- p) . quad "(3.18)" $ <eq:info-annular-invariant>
  Suppose first that the preceding scale $2 s$ has been processed; write $A_(upright("old")) = A_(j - 1)$. At the first scale take $A_(upright("old")) = diameter$ and use the same argument with an empty initial group. Use an ambient grid of cells of side $d s$, and let $R$ be the physical sample of the union of all cells touching the ambient radius-$1.5 a' s$ enlargement of $A_j$. Put
  $ C = Lambda ∩ E^(+ 1.5 a' s) . $
  Among the selected cells, first group together those touching the radius-$1.5 a' s$ enlargement of $A_(upright("old"))$. Every such cell lies in the ambient radius-$\( 1.5 a' + d \) s$ enlargement of $A_(upright("old"))$ and hence inside its previous radius-$2 a' s$ enlargement. Also $C subset.eq Lambda ∩ E^(+ 2 a' s)$. By the preceding invariant and data processing, the mutual information of the entire initial group with $C$ is at most $L^(- p)$.
  Every remaining selected cell touches the radius-$1.5 a' s$ enlargement of the new layer: the enlargement of a union is the union of its enlargements. By the bounded square cover of that layer and the fixed ratio $d$, there are only boundedly many remaining cells. For any selected cell, (3.17) and the definition of $R \, C$ give its distance from $C$ as at least
  $ #scale(x: 120%, y: 120%)[\(] a \/ 2 - 3 a' - d #scale(x: 120%, y: 120%)[\)] s > 0 . quad "(3.19)" $ <eq:info-cell-clearance>
  This is a fixed positive multiple of its side $d s$. In particular $R$ and $C$ are disjoint. Add the remaining cells one at a time. The previously included physical sites are a union of whole cells, so the chain rule and Lemma 5 apply at each addition. For all sufficiently large $L$, $d s gt.eq d D log L$ is above that Lemma’s fixed scale threshold. Thus, after absorbing the bounded number of additions and the initial $L^(- p)$,
  $ I_Omega \( R : C \) lt.eq C_b \( 1 + log s \)^K . quad "(3.20)" $ <eq:info-before-reset>
  Here $C_b \, K$ are fixed independently of $D \, L$ and of the current layer.
  Apply Lemma 6 with
  $ R_0 = Lambda ∩ A_j^(+ a' s) \, #h(2em) C_0 = Lambda ∩ E^(+ a' s) . $
  The set $R$ contains the physical radius-$1.5 a' s$ enlargement of $A_j$. Both cores therefore have distance at least $a' s \/ 2$ from the respective physical complements of $R \, C$. We can safely use any strictly smaller available width $c_(*) s$, for instance $c_(*) = a' \/ 3$. In view of (3.20), the width required by the reset is bounded by
  $ w \( s \) lt.eq C_3 \( 1 + log s \)^K + C_4 log L . quad "(3.21)" $ <eq:info-reset-scale-cost>
  We verify uniformly over all layers that this is less than $c_(*) s$. First fix all constants in the cell bound and reset, including $K$, $C_3 \, C_4 \, c_(*)$. Choose the fixed number
  $ D gt.eq frac(4 C_4, c_(*)) . $
  The function $f \( s \) = \( 1 + log s \)^K \/ s$ has logarithmic derivative
  $ frac(f' \( s \), f \( s \)) = 1 / s (frac(K, 1 + log s) - 1) \, $
  so it is decreasing for $s > e^(K - 1)$. Increase the fixed threshold $L_0$ so that, for all $L gt.eq L_0$,
  $ D log L gt.eq e^(max \( K \, 1 \)) \, #h(2em) C_3 frac(\( 1 + log \( D log L \) \)^K, D log L) lt.eq c_(*) / 2 . $
  Such a threshold exists because $\( log log L \)^K \/ log L arrow.r 0$ for every fixed $K$. For every scale $s gt.eq D log L$ it follows that
  $ frac(w \( s \), s) lt.eq C_3 f \( D log L \) + C_4 / D lt.eq frac(3 c_(*), 4) < c_(*) . $
  This argument allows $K$ to be arbitrarily large but fixed; scales near $e^K$ lie below the smallest processed scale once $L gt.eq L_0$. No constant or exponent is chosen as a function of $L$.
  The hypotheses of Lemma 6 now hold, and its conclusion is exactly (3.18). This proves the invariant by induction. Notice that the information cost is reset to $L^(- p)$ after each layer, so it does not accumulate over the number of layers. At the final layer $A_m = X$. Discarding the padding from both systems in (3.18) gives $I_Omega \( X : E \) lt.eq L^(- p)$, as required. ◻
]

== 4 Adaptive finite-rank constraints on small patches <sec:patches>

The next construction gives an accurate constraint near any specified square of logarithmic radius. Its conclusion allows the radius of the finite-rank part to vary between terms. This freedom is essential: the proposition does not assert an accurate finite-rank truncation at one prescribed boundary. We use a regularized version of the nested filter method in #cite(label("RepoAreaLaw")). The optimizing filters need not commute, so their conjugations must be handled in the order supplied by the nested squares.

For a center $z in bb(R)^2$ and $r gt.eq 0$, write

$ X \( r \) = { v in Lambda : \| v - z \|_oo lt.eq r } \, #h(2em) cal(H)_Y = ⨂_(v in Y) bb(C)^q . $

In particular, these are closed square samples, possibly clipped by the physical boundary. The Hilbert space of an empty set is $bb(C)$. For a subspace $S subset.eq cal(H)_X$, the cylinder $S ⊗ cal(H)_(Lambda \\ X)$ has #emph[inside rank] $dim S$.

#thm([Proposition 4.1.])[
  (Adaptive patch constraint).  #emph[Fix $B_0 > 0$ and $p > 0$. There are constants $C \, c > 0$, depending only on $q \, J \, Delta \, B_0 \, p$, with the following property. For every $L gt.eq 2$, center $z in bb(R)^2$, and $0 < u lt.eq B_0 log L$, there is an orthogonal projection $P$, supported on $X \( 2 u \)$, such that 
$ lr(bar.v.double \( "id" - P \) Omega bar.v.double) lt.eq L^(- p) . $

 There are radii $u lt.eq r_1 lt.eq dots.h.c lt.eq r_m lt.eq 2 u$, sets $X_j = X \( r_j \)$, and unit vectors $v_(j ell) in cal(H)_(X_j)$, $1 lt.eq ell lt.eq d_j$, for which 
$ P = sum_(j = 1)^m sum_(ell = 1)^(d_j) \| v_(j ell) chevron.r chevron.l v_(j ell) \|_(X_j) ⊗ "id"_(Lambda \\ X_j) \, #h(2em) sum_(j = 1)^m d_j lt.eq C L^c . quad "(4.1)" $ <eq:patch-cylinder-projection>

 All the summands in (4.1) have pairwise orthogonal ranges as operators on $cal(H)_Lambda$. No bound on the internal tensor complexity of the individual $v_(j ell)$ is asserted.]
] <prop:patch>

#proof[
  #emph[Nested squares and regularized filters.] If $u < 4$, take $P = "id"$, expanded in an orthonormal basis on $X \( u \)$. That set has at most $81$ sites, so the expansion has at most $q^81$ terms. This also covers empty square samples. We henceforth suppose $u gt.eq 4$.
  Choose
  $ m = floor.l u \/ 2 floor.r + 1 \, #h(2em) r_j = u + 2 \( j - 1 \) \, #h(2em) X_j = X \( r_j \) \, #h(2em) a_j = kappa / m \, $
  where $0 < kappa lt.eq 1 \/ 2$ will be fixed below using only the physical parameters. Then $r_m lt.eq 2 u$, $m gt.eq u \/ 2$, and $sum_j a_j = kappa$. The samples need not be distinct.
  For $R gt.eq 0$ put $b = e^(- R)$. Minimize over density operators $x_j$ on $cal(H)_(X_j)$, independently for each $j$, the quantity
  $ N \( R \) & = min_(x_j gt.eq 0\
"Tr" x_j = 1) lr(bar.v.double M \( R \, x \) Omega bar.v.double) \,\
M \( R \, x \) & = L_m dots.h.c L_1 \, #h(2em) L_j = \( x_j + b "id" \)^(- a_j \/ 2) . quad "(4.2)" $ <eq:patch-variational-problem>
  Operators on $X_j$ are extended by the identity on its complement. The feasible set is compact, and every filter is positive and invertible. Since $0 lt.eq x_j lt.eq "id"$,
  $ \( 1 + b \)^(- kappa \/ 2) lt.eq lr(bar.v.double M \( R \, x \) Omega bar.v.double) lt.eq b^(- kappa \/ 2) . quad "(4.3)" $ <eq:patch-elementary-norm-bounds>
  The lower bound follows by multiplying the least singular values of the factors, and does not require them to commute. Thus the minimum is attained and is positive. At any minimizing tuple set
  $ phi.alt = frac(L_m dots.h.c L_1 Omega, N \( R \)) \, #h(2em) rho_j = "Tr"_(Lambda \\ X_j) \| phi.alt chevron.r chevron.l phi.alt \| . $
  All subsequent statements about minimizers apply to every minimizing tuple, even when it is not unique.
  The reason for this minimization is the following chain of estimates. Stationarity will bound the excitation energy of $phi.alt$ independently of $R$. The gap will then make its marginals close enough to those of $Omega$ that the area law supplies a subspace of rank $e^(O \( 1 + u \))$ carrying all but a fixed small fraction of each marginal. This will force the optimized norm to grow slowly: $log N \( R \) lt.eq kappa R \/ 8 + O \( 1 + u \)$. To return from $phi.alt$ to $Omega$, we will split each inverse filter into a part of inside rank at most $e^R$ and a remaining part of norm at most $\( 2 e^(- R) \)^(a_j \/ 2)$. The term using only the remaining parts thus has norm at most $N \( R \) \( 2 e^(- R) \)^(kappa \/ 2)$, which decays exponentially in $R$. Every other term has a first finite-rank factor; nesting places it in a cylinder at that factor’s radius. This is why the conclusion uses several possible radii.
  #emph[Descending stationarity without commuting filters.] We first prove, in decreasing order of $j$, that
  $ \[ L_j \, rho_j \] = \[ x_j \, rho_j \] = 0 . quad "(4.4)" $ <eq:patch-stationarity-commutation>
  The trace identity behind the induction is the following. If $\[ L_k \, rho_k \] = 0$ and $T$ is supported on $X_k$, then
  $ chevron.l phi.alt \, L_k T L_k^(- 1) phi.alt chevron.r = "Tr" #scale(x: 120%, y: 120%)[\(] L_k^(- 1) rho_k L_k T #scale(x: 120%, y: 120%)[\)] = chevron.l phi.alt \, T phi.alt chevron.r . quad "(4.5)" $ <eq:patch-trace-stripping>
  In a product of outer conjugations this identity can be applied successively from the largest square inward: by nesting, the operator remaining inside each conjugation is supported on that square.
  Assume that (4.4) has been proved for $k > j$, and let $B$ be any anti-Hermitian operator on $X_j$. Vary $x_j$ by $x_j \( s \) = e^(s B) x_j e^(- s B)$, keeping all other variables fixed. Functional calculus gives
  $ L_j \( s \) = e^(s B) L_j e^(- s B) \, #h(2em) frac(d L_j \( s \), d s)\|_(s = 0) L_j^(- 1) = B - L_j B L_j^(- 1) . $
  For a differentiable invertible $M \( s \)$, its logarithmic norm derivative on the fixed input $Omega$ is
  $ frac(d, d s) log lr(bar.v.double M \( s \) Omega bar.v.double)\|_(s = 0) = "Re" chevron.l phi.alt \, M' \( 0 \) M \( 0 \)^(- 1) phi.alt chevron.r . $
  Here $M' \( 0 \) M \( 0 \)^(- 1)$ is $B - L_j B L_j^(- 1)$ conjugated by $L_m dots.h.c L_(j + 1)$. Strip those outer conjugations using (4.5). Stationarity at the minimum yields
  $ 0 = "Re" "Tr" #scale(x: 120%, y: 120%)[\(] rho_j \( B - L_j B L_j^(- 1) \) #scale(x: 120%, y: 120%)[\)] = - "Re" "Tr" #scale(x: 120%, y: 120%)[\(] L_j^(- 1) rho_j L_j B #scale(x: 120%, y: 120%)[\)] . $
  The term $"Tr" \( rho_j B \)$ is purely imaginary. An operator whose real trace pairing with every anti-Hermitian operator vanishes is Hermitian. Consequently
  $ L_j^(- 1) rho_j L_j = L_j rho_j L_j^(- 1) \, #h(2em) rho_j L_j^2 = L_j^2 rho_j . $
  Positivity of $L_j$ gives commutation with $L_j$; functional calculus then gives commutation with $x_j$. This starts at $j = m$ with no outer filters and proves the induction. Notice that no commutation between two different filters has been claimed.
  In a common eigenbasis of $x_j$ and $rho_j$, write $x_i$ and $p_i$ for their eigenvalues. A diagonal variation of $x_j$ within the probability simplex has logarithmic norm derivative
  $ - a_j / 2 sum_i frac(p_i, x_i + b) thin d x_i . quad "(4.6)" $ <eq:patch-simplex-derivative>
  Again, this follows by stripping the outer conjugations; the diagonal variation commutes with $x_j + b "id"$. For two indices with $x_i \, x_k > 0$, mass can be moved in either direction, so the ratios $p_i \/ \( x_i + b \)$ agree. Moving mass from an index with $x_i > 0$ to any zero coordinate gives the one-sided inequality. Thus there is $lambda > 0$ such that
  $ frac(p_i, x_i + b) = lambda quad \( x_i > 0 \) \, #h(2em) p_i / b lt.eq lambda quad \( x_i = 0 \) . quad "(4.7)" $ <eq:patch-kkt>
  Indeed, if the common ratio on the positive coordinates were zero, the second inequality would force every $p_i$ to be zero. Writing $r$ for the number of positive $x_i$, we also have
  $ lambda \( 1 + b r \) = sum_(x_i > 0) p_i lt.eq 1 \, #h(2em) upright("so") #h(2em) 0 < lambda lt.eq 1 . $
  Equivalently,
  $ x_i + b = max { p_i \/ lambda \, b } . quad "(4.8)" $ <eq:patch-clipped-eigenvalues>
  If $ell_i = \( x_i + b \)^(- a_j \/ 2)$ is the corresponding eigenvalue of $L_j$, then for $p_i \, p_k > 0$,
  $ \| log \( ell_i \/ ell_k \) \| lt.eq a_j / 2 \| log \( p_i \/ p_k \) \| . quad "(4.9)" $ <eq:patch-log-ratio>
  This follows because $t mapsto max { t \, log b }$ is $1$-Lipschitz, applied to $log \( p_i \/ lambda \)$. The regularization keeps all $ell_i$ finite, including on zero marginal eigenspaces; no ratio of zero probabilities is used.
  #emph[A dimension-independent energy estimate.] We next show that the minimizing vector has uniformly small excitation energy. The two distances $\| x - z \|_oo$ and $\| y - z \|_oo$ at the endpoints of a nearest-neighbor edge differ by at most one. A closed square of radius $r$ cuts that edge only when
  $ min { \| x - z \|_oo \, \| y - z \|_oo } lt.eq r < max { \| x - z \|_oo \, \| y - z \|_oo } . $
  Since selected radii differ by at least two, an interaction crosses at most one selected square. If it crosses $X_j$, its support is disjoint from every $X_k$ with $k < j$, and is contained in every $X_k$ with $k > j$. This argument includes exact boundary equalities and repeated clipped samples.
  The ground equation gives
  $ M H M^(- 1) phi.alt = E_0 phi.alt . $
  For an interaction $h$ crossing $X_j$, remove the conjugations by the containing outer filters using (4.5). The smaller filters commute with $h$ by disjointness. Therefore
  $ chevron.l phi.alt \, M h M^(- 1) phi.alt chevron.r = chevron.l phi.alt \, L_j h L_j^(- 1) phi.alt chevron.r . quad "(4.10)" $ <eq:patch-single-crossing>
  For a term crossing none of the selected squares the same argument leaves its original expectation unchanged: strip the containing filters, then commute past all disjoint ones. On-site terms never cross a square.
  Consider now a Hermitian nearest-neighbor term $h$ crossing $X_j$. Use the Schmidt decomposition
  $ phi.alt = sum_(i : p_i > 0) sqrt(p_i) thin e_i ⊗ f_i $
  across $X_j$ and its complement, where the $e_i$ are chosen in a simultaneous eigenbasis of $L_j$ and $rho_j$. Put
  $ h_(i k) = chevron.l e_i ⊗ f_i \, thin h \( e_k ⊗ f_k \) chevron.r . $
  Hermiticity gives $h_(k i) = overline(h_(i k))$. Pairing the $\( i \, k \)$ and $\( k \, i \)$ terms consequently gives
  $ & "Re" chevron.l phi.alt \, L_j h L_j^(- 1) phi.alt chevron.r - chevron.l phi.alt \, h phi.alt chevron.r\
 & #h(2em) = sum_(i \, k : p_i p_k > 0) sqrt(p_i p_k) #scale(x: 120%, y: 120%)[\(] cosh \( log \( ell_i \/ ell_k \) \) - 1 #scale(x: 120%, y: 120%)[\)] "Re" h_(i k) . quad "(4.11)" $ <eq:patch-hermitian-pairing>
  For $0 lt.eq a lt.eq 1$, the power series of the hyperbolic cosine shows that
  $ cosh \( a y \) - 1 lt.eq a^2 \( cosh y - 1 \) lt.eq a^2 cosh y . $
  Using (4.9) and $sqrt(p_i p_k) cosh \( 1 / 2 log \( p_i \/ p_k \) \) = \( p_i + p_k \) \/ 2$, the nonnegative coefficient in (4.11) is bounded by
  $ sqrt(p_i p_k) #scale(x: 120%, y: 120%)[\(] cosh \( log \( ell_i \/ ell_k \) \) - 1 #scale(x: 120%, y: 120%)[\)] lt.eq a_j^2 / 2 \( p_i + p_k \) . quad "(4.12)" $ <eq:patch-quadratic-coefficient>
  Zero Schmidt probabilities contribute zero to the expectation and need no separate limiting argument.
  Here is the step that prevents a Schmidt-rank factor from entering. For operators $A$ on $X_j$ and $B$ on its complement, let $A_(i k) = chevron.l e_i \, A e_k chevron.r$ and $B_(i k) = chevron.l f_i \, B f_k chevron.r$, restricted to the displayed Schmidt vectors. Cauchy–Schwarz in a row and in a column gives
  $ sum_k \| A_(i k) B_(i k) \| lt.eq lr(bar.v.double A bar.v.double) lr(bar.v.double B bar.v.double) \, #h(2em) sum_i \| A_(i k) B_(i k) \| lt.eq lr(bar.v.double A bar.v.double) lr(bar.v.double B bar.v.double) . $
  It follows that
  $ sum_(i \, k) \( p_i + p_k \) \| A_(i k) B_(i k) \| lt.eq 2 lr(bar.v.double A bar.v.double) lr(bar.v.double B bar.v.double) . quad "(4.13)" $ <eq:patch-weighted-row-column>
  Expand $h$ in matrix units on its endpoint inside $X_j$:
  $ h = sum_(a \, b = 1)^q \| a chevron.r chevron.l b \| ⊗ h_(a b) \, #h(2em) lr(bar.v.double h_(a b) bar.v.double) lt.eq lr(bar.v.double h bar.v.double) lt.eq J . $
  The other factors are extended by identities within their respective sides of the cut. Combining (4.11)–(4.13) term by term yields the explicit bound
  $ \| "Re" chevron.l phi.alt \, L_j h L_j^(- 1) phi.alt chevron.r - chevron.l phi.alt \, h phi.alt chevron.r \| lt.eq q^2 J thin a_j^2 . quad "(4.14)" $ <eq:patch-one-term-energy>
  The ambient sample of a square of radius at most $2 u$ has at most $16 u + 4$ crossing lattice edges. Intersecting with the physical square cannot add a physical crossing edge. Hence, using the ground equation, (4.10), and (4.14),
  $ 0 lt.eq chevron.l phi.alt \, \( H - E_0 "id" \) phi.alt chevron.r & lt.eq q^2 J \( 16 u + 4 \) sum_(j = 1)^m a_j^2\
 & lt.eq 36 q^2 J thin kappa^2 . quad "(4.15)" $ <eq:patch-energy-bound>
  The last inequality uses $m gt.eq u \/ 2$ and $u gt.eq 4$. This bound is independent of $R$, the private dimensions of the filters, and the choice of a minimizer.
  Set $C_E = 36 q^2 J$, and now fix
  $ 0 < kappa lt.eq min {1 / 2 \, sqrt(frac(Delta, 1024 C_E))} . quad "(4.16)" $ <eq:patch-kappa-choice>
  The full-system gap implies
  $ 1 - \| chevron.l Omega \, phi.alt chevron.r \|^2 lt.eq frac(C_E kappa^2, Delta) . $
  In particular, up to a phase, $lr(bar.v.double phi.alt - Omega bar.v.double) lt.eq sqrt(2 C_E \/ Delta) thin kappa$. The trace norm distance of the two pure-state density operators is $2 sqrt(1 - \| chevron.l Omega \, phi.alt chevron.r \|^2)$. After partial trace, (4.16) therefore gives
  $ lr(bar.v.double rho_j - rho_(Omega \, X_j) bar.v.double)_1 lt.eq 1 / 16 quad upright("for every ") j . quad "(4.17)" $ <eq:patch-marginal-closeness>
  Only the original full-system gap has been used.
  #emph[Constant-tail ranks from the area law.] Proposition 2, together with the crossing-edge count, gives a constant $C_S gt.eq 1$, depending only on the physical parameters, such that
  $ S_Omega \( X_j \) lt.eq C_S \( 1 + u \) . $
  Let $Q_j$ be the spectral projection of $rho_(Omega \, X_j)$ onto eigenvalues at least $exp \[ - 16 C_S \( 1 + u \) \]$. Summing the eigenvalues shows
  $ "rank" Q_j lt.eq e^(C_Q \( 1 + u \)) \, #h(2em) C_Q = 16 C_S . $
  Markov’s inequality for the marginal surprisal gives
  $ "Tr" #scale(x: 120%, y: 120%)[\(] rho_(Omega \, X_j) \( "id" - Q_j \) #scale(x: 120%, y: 120%)[\)] lt.eq 1 / 16 . $
  By (4.17),
  $ "Tr" #scale(x: 120%, y: 120%)[\(] rho_j \( "id" - Q_j \) #scale(x: 120%, y: 120%)[\)] lt.eq 1 / 8 . quad "(4.18)" $ <eq:patch-constant-tail>
  These $Q_j$ come from the original ground state. We have not applied entropy continuity to the filtered state.
  At a minimizer define the commuting positive product
  $ T_j = rho_j thin b \( x_j + b "id" \)^(- 1) . $
  Equation (4.7) shows that its eigenvalues obey
  $ 0 lt.eq frac(p_i b, x_i + b) lt.eq b \, #h(2em) frac(p_i b, x_i + b) lt.eq p_i . $
  Thus $0 lt.eq T_j lt.eq b "id"$ and $T_j lt.eq rho_j$. The projector $Q_j$ need not commute with $T_j$; the positive operator inequalities suffice to give
  $ "Tr" T_j & = "Tr" \( Q_j T_j \) + "Tr" \( \( "id" - Q_j \) T_j \)\
 & lt.eq b thin "rank" Q_j + "Tr" \( \( "id" - Q_j \) rho_j \) lt.eq e^(- R + C_Q \( 1 + u \)) + 1 / 8 . quad "(4.19)" $ <eq:patch-regulator-trace>
  Choose, for example,
  $ C_0 = C_Q + log 8 \, #h(2em) R_(upright("start")) = C_0 \( 1 + u \) . $
  Then $"Tr" T_j lt.eq 1 \/ 4$ whenever $R gt.eq R_(upright("start"))$, uniformly over all minimizers.
  #emph[The nonsmooth minimum and its growth.] The regulator estimate will bound the growth of $log N \( R \)$. Its rate must stay below $kappa \/ 2$, the exponential decay rate of the inverse-filter remainder described above. Write
  $ f \( R \, x \) = log lr(bar.v.double M \( R \, x \) Omega bar.v.double) \, #h(2em) g \( R \) = log N \( R \) = min_x f \( R \, x \) . $
  We justify the envelope calculation without choosing a continuous family of minimizers. For fixed $x$,
  $ frac(partial L_j, partial R) = a_j / 2 thin b \( x_j + b "id" \)^(- 1) L_j \, #h(2em) lr(bar.v.double frac(partial L_j, partial R) bar.v.double) lt.eq a_j / 2 lr(bar.v.double L_j bar.v.double) . $
  On $0 lt.eq R lt.eq T$, the product rule and (4.3) therefore give
  $ lr(bar.v.double frac(partial M, partial R) bar.v.double) lt.eq kappa / 2 e^(kappa T \/ 2) \, #h(2em) lr(bar.v.double M Omega bar.v.double) gt.eq 2^(- kappa \/ 2) . $
  Consequently
  $ \| partial_R f \( R \, x \) \| lt.eq kappa / 2 thin 2^(kappa \/ 2) e^(kappa T \/ 2) quad \( 0 lt.eq R lt.eq T \) . quad "(4.20)" $ <eq:patch-uniform-local-lipschitz>
  The bound holds for every feasible $x$ and is independent of all Hilbert-space dimensions and of $m$. The minimum $g$ inherits the same Lipschitz bound on each bounded interval, and hence is locally absolutely continuous.
  Fix $R$ and any minimizing tuple $x_R$. For $h > 0$,
  $ g \( R + h \) - g \( R \) lt.eq f \( R + h \, x_R \) - f \( R \, x_R \) . $
  The upper right Dini derivative of $g$ is therefore at most $partial_R f \( R \, x_R \)$. At the minimizer the descending trace rule removes the outer filters in each term of the product derivative, giving
  $ partial_R f \( R \, x_R \) = sum_(j = 1)^m a_j / 2 "Tr" #scale(x: 120%, y: 120%)[\(] rho_j b \( x_j + b "id" \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  By (4.19), this is at most $kappa \/ 8$ for $R gt.eq R_(upright("start"))$. At almost every point where $g$ is differentiable its derivative has this upper bound, so absolute continuity permits integration. Using $g \( R_(upright("start")) \) lt.eq kappa R_(upright("start")) \/ 2$ from (4.3), we obtain the convenient estimate
  $ g \( R \) lt.eq kappa / 2 (R_(upright("start")) + R / 4) quad \( R gt.eq R_(upright("start")) \) . quad "(4.21)" $ <eq:patch-minimum-growth>
  Neither differentiability of a minimizing tuple nor uniqueness of that tuple is required.
  #emph[An ordered expansion and a small all-tail remainder.] Choose $R gt.eq R_(upright("start"))$ and a minimizing tuple at that value. Let $Pi_j$ be the spectral projection of $x_j$ onto eigenvalues at least $b = e^(- R)$. Split the inverse filter, on its inside space, as
  $ F_j = L_j^(- 1) \, #h(2em) F_j^(upright(h)) = F_j Pi_j \, #h(2em) F_j^(upright(t)) = F_j \( "id" - Pi_j \) . $
  Since $"Tr" x_j = 1$,
  $ "rank" F_j^(upright(h)) lt.eq b^(- 1) \, #h(2em) lr(bar.v.double F_j^(upright(t)) bar.v.double) lt.eq \( 2 b \)^(a_j \/ 2) . quad "(4.22)" $ <eq:patch-head-tail-bounds>
  The rank in this display is on $cal(H)_(X_j)$, before extension by the outside identity.
  Inverting the ordered filter product gives $Omega = N \( R \) F_1 dots.h.c F_m phi.alt$. Expand by the first head in this left-to-right order:
  $ F_1 dots.h.c F_m = sum_(j = 1)^m F_1^(upright(t)) dots.h.c F_(j - 1)^(upright(t)) F_j^(upright(h)) F_(j + 1) dots.h.c F_m + F_1^(upright(t)) dots.h.c F_m^(upright(t)) . quad "(4.23)" $ <eq:patch-first-head-expansion>
  This identity uses distributivity only and never changes the order of noncommuting factors. Every factor preceding the $j$-th head acts inside $X_j$. Hence the $j$-th summand applied to $phi.alt$ lies in
  $ cal(C)_j = S_j ⊗ cal(H)_(Lambda \\ X_j) \, #h(2em) dim S_j lt.eq b^(- 1) \, $
  where $S_j$ is the range on $cal(H)_(X_j)$ of $F_1^(upright(t)) dots.h.c F_(j - 1)^(upright(t)) F_j^(upright(h))$. The preceding factors may alter the head subspace, but cannot increase its dimension.
  The remaining vector has norm at most
  $ N \( R \) product_j lr(bar.v.double F_j^(upright(t)) bar.v.double) lt.eq N \( R \) \( 2 b \)^(kappa \/ 2) . $
  By (4.21), its logarithm is at most
  $ kappa / 2 [C_0 \( 1 + u \) + log 2 - frac(3 R, 4)] . quad "(4.24)" $ <eq:patch-all-tail-log>
  To make this choice explicit and uniform, set
  $ R_0 = 4 / 3 [C_0 (B_0 + frac(1, log 2)) + 1 + frac(2 p, kappa)] \, #h(2em) R = R_0 log L . quad "(4.25)" $ <eq:patch-explicit-radius>
  For $L gt.eq 2$ and $u lt.eq B_0 log L$,
  $ C_0 \( 1 + u \) lt.eq C_0 (B_0 + frac(1, log 2)) log L \, #h(2em) log 2 lt.eq log L . $
  Thus $R gt.eq R_(upright("start"))$, and (4.24) is at most $- p log L$. Writing $cal(E) = sum_j cal(C)_j$, we have consequently proved
  $ "dist" \( Omega \, cal(E) \) lt.eq L^(- p) \, #h(2em) dim S_j lt.eq L^(R_0) . quad "(4.26)" $ <eq:patch-distance-to-cylinders>
  #emph[Orthogonalization at variable radii.] Let $P$ be the orthogonal projection onto $cal(E)$. We finish by putting it in the required form, keeping the radius associated with each new summand. Process the cylinders in increasing $j$. By nesting, the earlier span can be written
  $ cal(E)_(j - 1) := sum_(i < j) cal(C)_i = W_j ⊗ cal(H)_(Lambda \\ X_j) $
  for a subspace $W_j subset.eq cal(H)_(X_j)$. Let $P_(W_j)$ be its orthogonal projection, and define
  $ tilde(S)_j = \( "id" - P_(W_j) \) S_j . $
  This is the #emph[projected image] of $S_j$, not its intersection with $W_j^perp$. It has dimension at most $dim S_j$, and
  $ cal(E)_(j - 1) + cal(C)_j = cal(E)_(j - 1) med xor med #scale(x: 120%, y: 120%)[\(] tilde(S)_j ⊗ cal(H)_(Lambda \\ X_j) #scale(x: 120%, y: 120%)[\)] . $
  Choose an orthonormal basis $v_(j ell)$ of each $tilde(S)_j$; if that space is zero there are no terms for that $j$. The resulting cylinder ranges are pairwise orthogonal and their direct sum is $cal(E)$, proving (4.1). Because $X_j subset.eq X \( 2 u \)$, this projection is supported on $X \( 2 u \)$. Equation (4.26) gives its stated error.
  Finally,
  $ sum_j d_j lt.eq m L^(R_0) lt.eq (B_0 / 2 log L + 1) L^(R_0) . $
  This is bounded by $C L^(R_0 + 1)$; enlarging $C$ covers the previous bounded-$u$ case. The choices of $kappa \, C_0 \, R_0$ depend only on the fixed parameters in the proposition, and all bounds are uniform in the center, the Hamiltonian, and $L$. ◻
]

== 5 Compression of distributed density networks <sec:compression>

We approximate the physical density produced by a distributed construction after tracing out its private registers. The private work spaces and bipartite resources may have arbitrary finite dimensions. We first replace pair effects by operations using only prepared pair sources, then replace the source operators in the density calculation by sums of product operators. The error is controlled after contraction of the whole construction. The result is an operator tensor network, with one ket and one bra physical leg at each party; it need not be positive.

We use a size parameter $L gt.eq 2$. A quantity is #emph[uniformly polynomial] if it is at most $C L^a$, where $C \, a$ are independent of the particular construction and of all its private Hilbert-space dimensions. These constants may depend on a prescribed, fixed accuracy exponent. Every Hilbert space below is finite dimensional, but an unspecified dimension has no size bound.

=== 5.1 Distributed constructions and pair effects <distributed-constructions-and-pair-effects>

A party is a label for a collection of registers. At every time the memory is a tensor product of the parties’ current Hilbert spaces. A gate has specified input and output spaces for each participating party; these spaces may differ. Registers outside the participating parties are spectators. A #emph[private] gate has one participating party. Gates are linear contractions. Registers to be discarded are retained as part of their owner’s memory until the end, so the entire construction is a pure linear calculation before its final partial trace.

An allowed monomial in a gate expansion is a finite composition of local contractions, preparations of normalized vectors shared between two participating parties, and contractions by normalized bras shared between two participating parties. A transferred register of dimension $d$ can also be allowed when $d$ is uniformly polynomial: expand its identity transfer as

$ sum_(a = 1)^d \| a chevron.r_(upright("receiver")) chevron.l a \|_(upright("sender")) . $

Each summand consists of local norm-one maps. A bounded number of such transfers therefore changes a polynomial gate expansion by only a polynomial factor. We make this expansion first whenever such messages occur.

The density argument will sample prepared pair sources. The following lemma converts pair effects to that form while approximating the original gate in operator norm. The ideal extra output is the same fixed garbage vector in every branch; this common comparison lets us sum the branchwise operator-norm errors.

#thm([Lemma 5.1.])[
  (Elimination of normalized pair effects).  #emph[Let $G$ be a contraction with an expansion $G = sum_xi c_xi M_xi$ into $K$ allowed monomials on a fixed set of parties. Suppose each monomial has at most $r$ pair effects. For every integer $m gt.eq 1$ there is a gate $tilde(G)_m$, with additional garbage registers, and a fixed normalized garbage vector $Gamma_m$, such that 
$ lr(bar.v.double tilde(G)_m - G ⊗ \| Gamma_m chevron.r bar.v.double) lt.eq r / sqrt(m) sum_xi \| c_xi \| . quad "(5.1)" $ <eq:compression-effect-error>

 The gate $tilde(G)_m$ has an expansion using only local contractions and normalized pair sources. It has at most $K m^r$ monomials, and their absolute coefficient sum is at most $sum_xi \| c_xi \|$. Its additional registers are owned by the original participating parties. All sources on the same pair of parties may be combined into one normalized pair source.]
] <lem:effects>

#proof[
  First consider a single normalized pair vector $eta in cal(U) ⊗ cal(V)$. Its effect consumes a pair of registers in this space. Append $m - 1$ copies of $eta$, and average the $m$ cyclic permutations of the $m$ pair registers. Each permutation is the tensor product of the same cyclic permutation of the $cal(U)$ registers at one party and of the $cal(V)$ registers at the other. Denote the resulting map by
  $ T_m : cal(U) ⊗ cal(V) arrow.r \( cal(U) ⊗ cal(V) \)^(⊗ m) . $
  It is a contraction, being an average of isometries. It sends $eta$ to $eta^(⊗ m)$. If $v perp eta$, its $m$ insertion positions among the copies of $eta$ are pairwise orthogonal and each has norm $lr(bar.v.double v bar.v.double)$. Consequently
  $ lr(bar.v.double T_m - \| eta chevron.r^(⊗ m) chevron.l eta \| bar.v.double) = m^(- 1 \/ 2) quad "(5.2)" $ <eq:compression-one-effect>
  unless the perpendicular subspace is zero, in which case the left side is zero. This operator-norm estimate is unchanged by adjoining spectators. The permutation average has $m$ terms, each with coefficient $1 \/ m$ and consisting of local unitaries after normalized source preparation.
  For the whole gate, index every prescribed effect occurrence by its monomial and its position within that monomial. Give each such occurrence its own output stack of $m$ pair registers, with the dimensions and endpoint parties of its vector $eta$. In the branch using that occurrence, replace its effect by $T_m$ and leave the stack idle thereafter. In every other branch append the full fixed stack $eta^(⊗ m)$ as a pair source. Thus every branch has the same additional output space, and its ideal additional output is the same vector
  $ Gamma_m = ⨂_(upright("prescribed occurrences ") o) eta_o^(⊗ m) . $
  Different branches may consume different internal registers in their original effects; the occurrence-specific output stacks still give a common external output space. No subsequent operation acts on a stack.
  All original monomial factors, their ideal augmented replacements, and the maps $T_m$ are contractions. Telescoping the at most $r$ replacements in one monomial bounds its error by $r \/ sqrt(m)$. Summing with the original coefficients proves (5.1). Expanding the active permutation averages creates at most $m^r$ terms per original monomial. Their averaging coefficients are nonnegative and sum to one, so this expansion does not increase the absolute coefficient sum. The inactive stacks require no extra summation labels. Finally, a tensor product of normalized pair vectors on a fixed pair of parties is a normalized pair vector on the tensor products of their respective half-spaces. ◻
]

=== 5.2 The density-compression theorem <the-density-compression-theorem>

#thm([Theorem 5.2.])[
  (Distributed density compression).  #emph[Consider a family of distributed constructions indexed by $L gt.eq 2$ with the following uniform properties.]
  + #emph[The number of parties and gates is uniformly polynomial. The initial vector is a tensor product of normalized private vectors, one at each party, and every gate is a contraction.]
  + #emph[There is a constant $b$ such that each nonprivate gate involves at most $b$ parties, and each party participates in at most $b$ nonprivate gates over the entire construction.]
  + #emph[Each nonprivate gate is a sum of uniformly polynomially many allowed monomials with uniformly polynomially bounded scalar coefficients. There is a constant $r$ bounding the number of pair sources, pair effects, and polynomial-dimensional messages in each monomial. All constituent local maps are contractions.]
  + #emph[At the end, the intended physical output space of each party has uniformly polynomial dimension. All other registers are traced out party by party.]
  #emph[Write $rho$ for the resulting physical output density operator; it is positive and may have trace less than one. For every fixed $p > 0$, there is an operator tensor network $sigma$ satisfying 
$ lr(bar.v.double sigma - rho bar.v.double)_1 lt.eq L^(- p) . $

 It has one node per party, a bounded number of incident virtual links at each node, and uniformly polynomial link dimensions. Every link joins two parties which participate in a common nonprivate gate of the original construction. The physical legs at a node are the ket and bra legs of that party’s intended output. The constants in these bounds depend only on $p$ and the fixed uniform data in the assumptions, including $b \, r$ and the polynomial bounds, and not on private dimensions or source Schmidt ranks.]
  #emph[The same conclusion holds if the gate expansions in the third assumption are available to every fixed inverse-polynomial operator-norm accuracy, with uniform polynomial bounds at each fixed accuracy.]
] <thm:compression>

#proof[
  We give the estimates for a target error $0 < epsilon.alt lt.eq 1$ whose inverse is uniformly polynomial; take $epsilon.alt = L^(- p)$ at the end. Expand the small messages as above. This preserves all constant incidence and participation bounds and gives a uniformly polynomial absolute coefficient sum for every gate.
  After eliminating effects, we will replace each source operator $\| eta chevron.r chevron.l tilde(eta) \|$ in the density calculation by an unbiased sum of $k$ product operators. We estimate the resulting physical output, allowing the sampled factors themselves to have large norms. Expanding the error by the positions where a centered correction is used makes the lifetime participation bound decisive: $s$ corrected positions have at most $2 s$ endpoint parties, which together participate in at most $2 b s$ nonprivate gates. We expand only those gates into monomials; all other gates remain aggregate contractions. Thus the coefficient and physical-output choices cost a fixed polynomial per corrected position, rather than a product over every gate in the construction.
  For each fixed choice, the remaining task is a mean trace-norm estimate of $k^(- s \/ 2)$. Normalized probability weights from the corrected endpoints and the exact sources crossing the boundary of their party set make this estimate independent of all private dimensions. Summing over correction positions will then give a small error with polynomial $k$.
  ===== 5.2.1 Reduction to source-only gates. <reduction-to-source-only-gates.>
  Let $M$ bound the number of nonprivate gates. If $M = 0$, the output is a product of private densities and the assertion is immediate. Otherwise choose $delta = epsilon.alt \/ \( 8 M \)$. Apply Lemma 9 at every nonprivate gate, choosing one sufficiently large polynomial integer $m$ so that its error is at most $delta$. This choice is made using the #emph[original] coefficient sum and number of effects, before expanding the permutation averages. Afterward there are polynomially many monomials, and their absolute coefficient sum has not increased. Thus the choice of $m$ is not circular.
  The gate $tilde(G)_m$ has norm at most $1 + delta$. Replace it by $tilde(G)_m \/ \( 1 + delta \)$, a contraction within $2 delta$ of the original gate with its fixed garbage appended. Keep these garbage registers idle. The augmented original circuit has the same physical output density as the original circuit, since all the appended garbage vectors are fixed and normalized. Telescoping products of contractions shows that the two final pure vectors differ by at most $2 M delta$. For vectors of norm at most one,
  $ lr(bar.v.double \| v chevron.r chevron.l v \| - \| w chevron.r chevron.l w \| bar.v.double)_1 lt.eq \( lr(bar.v.double v bar.v.double) + lr(bar.v.double w bar.v.double) \) lr(bar.v.double v - w bar.v.double) lt.eq 2 lr(bar.v.double v - w bar.v.double) . $
  Partial trace does not increase this norm. Hence the source-only circuit’s physical density, denoted $rho'$, satisfies
  $ lr(bar.v.double rho' - rho bar.v.double)_1 lt.eq 4 M delta lt.eq epsilon.alt \/ 2 . quad "(5.3)" $ <eq:compression-effect-circuit-error>
  The number of gates and the list of participating parties have not changed. The new polynomial exponents are now fixed. The sampling parameter introduced below is chosen only after this reduction.
  Each nonprivate gate of this new circuit can be written
  $ G_g = sum_(xi in Xi_g) c_(g \, xi) #scale(x: 180%, y: 180%)[\(] ⨂_P B_(g \, P \, xi) #scale(x: 180%, y: 180%)[\)] [#scale(x: 180%, y: 180%)[\(] ⨂_(e in E_g) \| eta_(g \, e \, xi) chevron.r #scale(x: 180%, y: 180%)[\)] ⊗ "id"_(upright("in"))] \, #h(2em) lr(bar.v.double G_g bar.v.double) lt.eq 1 . quad "(5.4)" $ <eq:compression-source-gate>
  Here $E_g$ contains one slot for each participating pair of parties, each $eta_(g \, e \, xi)$ is normalized, and every $B_(g \, P \, xi)$ is a local contraction. Unused pairs have a one-dimensional source. To obtain this form, prepare a monomial’s sources in fresh registers before their first use, and tensor the preceding local maps with identities on those registers. This preserves their norms and their chronological action. Then combine sources on each pair, and compose the local maps at each party. This procedure stores fresh registers; it does not commute an existing source half through an earlier map.
  ===== 5.2.2 Common private slot spaces. <common-private-slot-spaces.>
  The dimensions of a source slot can depend on $xi$. For each endpoint $P$ of $e$, embed its half-space for branch $xi$ isometrically into
  $ cal(H)_(g \, P \, e) = xor.big_(xi in Xi_g) cal(H)_(g \, P \, e \, xi) . $
  Embed the branch source accordingly, and extend $B_(g \, P \, xi)$ by orthogonal projection onto its branch’s source sectors. Its norm remains at most one. All external gate input and output spaces are already fixed by the memory layout and, in the preceding reduction, by the common inventory of stacks. Formula (5.4) therefore has one fixed ambient space for each slot. These direct sums are private spaces; no bound on their dimensions will be used.
  Fix uniformly polynomial bounds $B \( L \)$ and $d \( L \)$ such that
  $ sum_(xi in Xi_g) \| c_(g \, xi) \| lt.eq B \( L \) \, #h(2em) dim cal(H)_(P \, upright("phys")) lt.eq d \( L \) quad "(5.5)" $ <eq:compression-polynomial-bounds>
  for all gates and parties. The cardinalities $\| Xi_g \|$ are also uniformly polynomial. We may increase $B \, d$ to be at least one.
  ===== 5.2.3 A random replacement for one density source. <a-random-replacement-for-one-density-source.>
  For a ket branch $xi$ and bra branch $zeta$ at a slot, write Schmidt decompositions, in their respective bases, as
  $ \| eta chevron.r = sum_a sqrt(lambda_a) \| u_a chevron.r \| v_a chevron.r \, #h(2em) \| tilde(eta) chevron.r = sum_c sqrt(mu_c) \| tilde(u)_c chevron.r \| tilde(v)_c chevron.r . $
  Both probability lists sum to one; their lengths need not agree. Let $g_(a c)^(\( j \))$, for $1 lt.eq j lt.eq k$, be independent standard circular complex Gaussians, normalized by $bb(E) \| g_(a c)^(\( j \)) \|^2 = 1$. Put
  $ U_j & = sum_(a \, c) \( lambda_a mu_c \)^(1 \/ 4) g_(a c)^(\( j \)) \| u_a chevron.r chevron.l tilde(u)_c \| \,\
V_j & = sum_(b \, d) \( lambda_b mu_d \)^(1 \/ 4) overline(g_(b d)^(\( j \))) \| v_b chevron.r chevron.l tilde(v)_d \| \,\
hat(X) & = 1 / k sum_(j = 1)^k U_j ⊗ V_j \, #h(2em) X = \| eta chevron.r chevron.l tilde(eta) \| \, #h(2em) Delta = hat(X) - X . quad "(5.6)" $ <eq:compression-random-source>
  These matrices act between the corresponding bra and ket source supports in the common ambient half-spaces. No bound on their sampled operator norms is claimed or needed. Since $bb(E) \[ g_(a c) overline(g_(b d)) \] = delta_(a b) delta_(c d)$, $bb(E) hat(X) = X$.
  The centered coefficient of $Delta$ with ket endpoint indices $\( a \, b \)$ and bra endpoint indices $\( c \, d \)$ is
  $ \( lambda_a lambda_b mu_c mu_d \)^(1 \/ 4) (1 / k sum_(j = 1)^k g_(a c)^(\( j \)) overline(g_(b d)^(\( j \))) - delta_(a b) delta_(c d)) . $
  For composite Gaussian indices $alpha \, beta \, gamma \, delta$, the complex Gaussian pairing formula #cite(label("Isserlis1918")) #cite(label("FassinoPistoneRogantin2019")) gives the fourth-moment identity
  $ bb(E) [\( g_alpha overline(g_beta) - delta_(alpha beta) \) overline(\( g_gamma overline(g_delta) - delta_(gamma delta) \))] = delta_(alpha gamma) delta_(beta delta) . quad "(5.7)" $ <eq:compression-gaussian-covariance>
  Indeed independence, circular symmetry, and $bb(E) \| g_alpha \|^4 = 2$ give the two Gaussian pairings $delta_(alpha beta) delta_(gamma delta) + delta_(alpha gamma) delta_(beta delta)$, and centering removes the first. Thus the coefficient covariance is diagonal and its diagonal entry is
  $ 1 / k sqrt(lambda_a lambda_b mu_c mu_d) . quad "(5.8)" $ <eq:compression-slot-variance>
  Take fresh independent samples for each slot location and each ordered pair of monomial labels at that gate.
  ===== 5.2.4 Expansion by corrected positions. <expansion-by-corrected-positions.>
  Let $cal(E) = { \( g \, e \) : e in E_g }$ be the set of slot locations and $N = \| cal(E) \|$. It is uniformly polynomial. In the density calculation for each gate, substitute $X + Delta$ for each source operator inside its sum over ket and bra labels. Expanding these products throughout the circuit gives
  $ hat(rho) - rho' = sum_(diameter eq.not S subset.eq cal(E)) F_S . quad "(5.9)" $ <eq:compression-subset-expansion>
  A set $S$ specifies which #emph[positions] use centered corrections; it does not specify their monomial labels. At a gate with no selected position, summing its labels gives exactly $G_g \( . \) G_g^dagger$.
  Fix $S$, write $s = \| S \|$, and let $cal(A)$ be the parties which are endpoints of its slots. Then $\| cal(A) \| lt.eq 2 s$. Expand the ket and bra labels at every nonprivate gate touching $cal(A)$, whether or not that gate has a selected slot. There are at most $2 b s$ such gates. All other gates lie entirely in the exterior and remain their exact aggregate contractions. Also fix ket and bra basis entries $x \, y$ of the physical outputs at parties in $cal(A)$. The total weighted cost of these choices is at most
  $ B \( L \)^(4 b s) d \( L \)^(4 s) = Q \( L \)^s \, #h(2em) Q \( L \) := B \( L \)^(4 b) d \( L \)^4 . quad "(5.10)" $ <eq:compression-choice-cost>
  Here each expanded gate contributes at most $\( sum_xi \| c_(g \, xi) \| \)^2$; the number of physical matrix entries is at most $d \( L \)^(2 \| cal(A) \|)$. Scalar coefficients are removed from the maps and charged in this bound.
  From now on fix one such deterministic choice of labels and physical entries. The samples used at its different corrected positions are independent. There is no sample-dependent selection of a branch. We will apply the triangle inequality over these choices, so no cross-branch covariance assumption is necessary. It remains to bound the mean trace norm for this fixed choice by $k^(- s \/ 2)$, with no private-dimension factor; the normalized source weights will provide that bound.
  ===== 5.2.5 The two separated contractions. <the-two-separated-contractions.>
  Both ends of every corrected source lie in $cal(A)$. All sources crossing from $cal(A)$ to its exterior are therefore exact. Their tensor product is a normalized pure vector on the ket side and a possibly different normalized pure vector on the bra side. In their Schmidt bases let the probability matrices be $tau$ and $tilde(tau)$. Their diagonal entries sum to one. Empty lists of sources are represented by a one-dimensional space and the scalar probability one.
  For every corrected slot retain both ket endpoint indices as free indices; collect them in $i$. Similarly collect the bra endpoint indices in $l$. Define normalized product probability lists $p_i$ and $tilde(p)_l$ by giving a corrected slot the respective factors $lambda_a lambda_b$ and $mu_c mu_d$. In particular the two endpoint indices are independent summation indices, even though an exact pure source would identify them. If $z_(i l)$ is the product of the centered coefficients at these slots, independence and (5.8) give
  $ bb(E) \[ z_(i l) overline(z_(i' l')) \] = k^(- s) sqrt(p_i tilde(p)_l) thin delta_(i i') delta_(l l') . quad "(5.11)" $ <eq:compression-product-covariance>
  Regard all corrected endpoint registers and all affected-side halves of exact crossing sources as free inputs supplied at the beginning of the separated calculation. This again means keeping fresh registers idle until first use. Prepare all exact sources internal to either side as normalized vectors on that side. Every previously expanded crossing gate now consists of local contractions and these exact sources. Thus there is no remaining communication between the two sides. Gates wholly in the exterior which were not expanded remain their aggregate contractions; their internal branch sums are not opened.
  Let $cal(I)$ be the ket space with basis $i$ and $cal(T)$ the affected-side ket Schmidt-support space with basis $t$ for $tau$. Use tildes for their bra analogues. Including final physical basis projection, the affected calculations give contractions
  $ A_x : cal(I) ⊗ cal(T) arrow.r cal(F) \, #h(2em) tilde(A)_y : tilde(cal(I)) ⊗ tilde(cal(T)) arrow.r cal(F) . $
  The codomain $cal(F)$ contains all affected discard registers. It is the same on ket and bra because the external memory spaces are fixed; the inventory construction ensured this also for the added garbage. These are contractions on #emph[all] free inputs: each operation in their construction is a contraction, an isometric preparation, an identity on an idle register, or a physical basis projection. No normalization of an output vector has occurred. Therefore
  $ O := tilde(A)_y^dagger A_x : cal(I) ⊗ cal(T) arrow.r tilde(cal(I)) ⊗ tilde(cal(T)) \, #h(2em) lr(bar.v.double O bar.v.double) lt.eq 1 . quad "(5.12)" $ <eq:compression-block-contraction>
  Write its blocks as $O_(l i) : cal(T) arrow.r tilde(cal(T))$.
  The exterior calculations similarly give contractions from their crossing-source half-spaces to the exterior physical output and garbage. In the matching Schmidt coordinate spaces denote them by $K$ and $tilde(K)$. They can differ on ket and bra but do not depend on $i \, l$. Those indices are free inputs only on the affected side, and fixing all crossing-gate labels removed every other means of communication across the division. For any rectangular operator $Z$ between the two exterior input spaces,
  $ lr(bar.v.double "Tr"_(upright("garbage")) \( K Z tilde(K)^dagger \) bar.v.double)_1 lt.eq lr(bar.v.double Z bar.v.double)_1 . quad "(5.13)" $ <eq:compression-exterior-contraction>
  To see this, test the output against an arbitrary matrix $M$ of operator norm at most one. The pulled-back test is $tilde(K)^dagger \( M ⊗ "id" \) K$, of norm at most one. Trace-norm duality proves the inequality even when $Z$ is neither Hermitian nor positive.
  ===== 5.2.6 The second-moment bound. <the-second-moment-bound.>
  Density-weighted comparisons between trace and Hilbert–Schmidt norms also occur in privacy amplification and decoupling #cite(label("Renner2005Security")) Lemma 5.1.3 #cite(label("DupuisBertaWullschlegerRenner2014")) Lemma 3.7. Here we use a two-weight rectangular form of Schatten Hölder, proved below. Tracing the affected garbage gives the following exterior input operator for the fixed labels and $x \, y$:
  $ Z = sum_(i \, l) z_(i l) thin tau^(1 \/ 2) O_(l i)^T tilde(tau)^(1 \/ 2) . quad "(5.14)" $ <eq:compression-exterior-input>
  Indeed its $\( t \, t' \)$ coefficient is $sum_(i \, l) z_(i l) sqrt(tau_t tilde(tau)_(t')) chevron.l tilde(A)_y \( l \, t' \) \, A_x \( i \, t \) chevron.r$. The transpose in (5.14) is the ordinary full matrix transpose in these bases, including when the matrix is rectangular; it preserves all Schatten norms.
  For an operator $W$ between these coordinate spaces, Schatten Hölder with exponents $4 \, 2 \, 4$ gives
  $ lr(bar.v.double tau^(1 \/ 2) W tilde(tau)^(1 \/ 2) bar.v.double)_1 lt.eq lr(bar.v.double tau^(1 \/ 4) bar.v.double)_4 thin lr(bar.v.double tau^(1 \/ 4) W tilde(tau)^(1 \/ 4) bar.v.double)_2 thin lr(bar.v.double tilde(tau)^(1 \/ 4) bar.v.double)_4 = lr(bar.v.double tau^(1 \/ 4) W tilde(tau)^(1 \/ 4) bar.v.double)_2 . quad "(5.15)" $ <eq:compression-quarter-powers>
  The subscript $2$ here denotes the Hilbert–Schmidt norm, and the quarter-power Schatten-$4$ norms equal one because the probability matrices have trace one. Applying this and transposing the middle matrix in (5.14) yields
  $ lr(bar.v.double Z bar.v.double)_1 lt.eq lr(bar.v.double sum_(i \, l) z_(i l) tilde(tau)^(1 \/ 4) O_(l i) tau^(1 \/ 4) bar.v.double)_2 . $
  By (5.11), the expected square of the right side is
  $ k^(- s) sum_(i \, l) sqrt(p_i tilde(p)_l) thin lr(bar.v.double tilde(tau)^(1 \/ 4) O_(l i) tau^(1 \/ 4) bar.v.double)_2^2 . quad "(5.16)" $ <eq:compression-block-second-moment>
  Define trace-one positive diagonal matrices on the full free input spaces by
  $ R = "diag" \( p_i \) ⊗ tau \, #h(2em) tilde(R) = "diag" \( tilde(p)_l \) ⊗ tilde(tau) . $
  The sum in (5.16) is exactly $lr(bar.v.double tilde(R)^(1 \/ 4) O R^(1 \/ 4) bar.v.double)_2^2$: its $\( l \, i \)$ block is $tilde(p)_l^(1 \/ 4) p_i^(1 \/ 4) tilde(tau)^(1 \/ 4) O_(l i) tau^(1 \/ 4)$, and the Hilbert–Schmidt squares of disjoint blocks add. Another application of Schatten Hölder and (5.12) gives
  $ lr(bar.v.double tilde(R)^(1 \/ 4) O R^(1 \/ 4) bar.v.double)_2 lt.eq lr(bar.v.double tilde(R)^(1 \/ 4) bar.v.double)_4 lr(bar.v.double O bar.v.double) lr(bar.v.double R^(1 \/ 4) bar.v.double)_4 lt.eq 1 . quad "(5.17)" $ <eq:compression-dimension-free>
  This bound contains no rank or dimension of a source, an input, or a discard space. Cauchy–Schwarz for the expectation now proves
  $ bb(E) lr(bar.v.double Z bar.v.double)_1 lt.eq k^(- s \/ 2) . quad "(5.18)" $ <eq:compression-one-choice>
  Applying the exterior map preserves this bound by (5.13). Reinserting the affected physical matrix unit $\| x chevron.r chevron.l y \|$ preserves the trace norm, since that matrix unit has trace norm one.
  ===== 5.2.7 Summation and realization as a network. <summation-and-realization-as-a-network.>
  Summing over the fixed choices with (5.10) gives
  $ bb(E) lr(bar.v.double F_S bar.v.double)_1 lt.eq Q \( L \)^(\| S \|) k^(- \| S \| \/ 2) . $
  Consequently
  $ bb(E) lr(bar.v.double hat(rho) - rho' bar.v.double)_1 lt.eq (1 + frac(Q \( L \), sqrt(k)))^N - 1 . quad "(5.19)" $ <eq:compression-total-error>
  If $N = 0$, there is no sampling error. Otherwise choose an integer $k$ with
  $ frac(Q \( L \), sqrt(k)) lt.eq frac(epsilon.alt, 8 N) . $
  It is uniformly polynomial. The right side of (5.19) is at most $e^(epsilon.alt \/ 8) - 1 lt.eq epsilon.alt \/ 4$. Hence there is a realization with $lr(bar.v.double hat(rho) - rho' bar.v.double)_1 lt.eq epsilon.alt \/ 2$, for example by Markov’s inequality. Fix one such realization and set $sigma = hat(rho)$. Together with (5.3), this proves the asserted error.
  It remains to check the network dimensions and link locality. At a gate, the common label $\( xi \, zeta \)$ ranges over a polynomial set. Choose one participating party and share this label along a star to the other participating parties, using one virtual index of that polynomial dimension on each star edge. Each slot’s sample index $j in { 1 \, dots.h \, k }$ is shared directly between its two endpoint parties. The local source matrices in (5.6) are determined by these labels and the fixed samples. Put the gate’s scalar coefficient and averaging factors into any one local tensor. All local maps, private source preparations, intermediate memories, and final garbage traces can then be contracted within each party to give a single tensor with its physical ket and bra legs. In particular, coordinates in the common private direct sums are contracted locally and are not virtual link indices.
  There are at most $b - 1$ star links and $binom(b, 2)$ sample links per gate. Every party belongs to at most $b$ nonprivate gates, so the resulting network has bounded incidence. Each link joins two participants of one original gate. Parallel links can be left separate or combined; only boundedly many meet a party, so combining them preserves a polynomial dimension bound. Sampled tensor entries need not be bounded. Their existence and link dimensions, rather than their numerical size or efficient computation, are what is required.
  Finally, suppose only approximate gate expansions are provided. At any prescribed fixed accuracy exponent their operator-norm errors can be made smaller than $epsilon.alt$ divided by a sufficiently large polynomial bound on the number of gates. A near-contraction can be rescaled by its known bound $1 + delta$ to be a contraction at an additional error at most $delta$. The same telescoping estimate as above absorbs these errors. Apply the proved result at a fixed smaller error budget. All subsequent choices remain uniform polynomials at that precision, which proves the last assertion. ◻
]

#prodef([Remark 5.3.])[
  (Absolute error and retained norm).  Theorem 10 approximates the subnormalized density produced by the contraction circuit. It does not normalize that density. In its later application, the construction separately ensures that its physical output is close in trace norm to a normalized pure state; in particular, the retained norm is close to one. The theorem’s absolute error can then be added directly to that approximation error. No bound on the private dimensions or on the Schmidt ranks of the supplied pair vectors is needed for this use.
] <rem:compression-retained-norm>

== 6 Encoded frames and changes of ownership <sec:frames>

We next construct the elementary operations that will distribute the ground vector among the parties of Theorem 10. These are contractions between specified register layouts. A change of layout is part of the map to be constructed: a raw register cannot be transferred to a different party merely by changing its name. Private operations, in contrast, may act on all the registers of one party, irrespective of their spatial positions.

=== 6.1 Sheets and adaptive encodings <sheets-and-adaptive-encodings>

For a physical set $A subset.eq Lambda$, write $cal(H)_A = ⨂_(x in A) bb(C)^q$. A #emph[sheet] has one raw register $bb(C)^q$ at each $x in Lambda$ and a specified owner for each register. Different sheets have distinct registers. Their canonical raw reference vectors are independent copies of $Omega$, with sites indexed by position. Thus ownership does not permute the positions in the definition of the reference vector.

Fix a constant $B_0 > 0$. In this section all applications of Proposition 8 use accuracy

$ epsilon = L^(- 60) . quad "(6.1)" $ <eq:frame-epsilon>

For a center $c in bb(R)^2$ and $0 < h lt.eq B_0 log L$, let

$ Q^(-) \( c \, h \) = { x : \| x - c \|_oo lt.eq h } \, #h(2em) Q^(+) \( c \, h \) = { x : \| x - c \|_oo lt.eq 2 h } $

be the inner and outer squares. Their register sets are their intersections with $Lambda$. Choose the projector from Proposition 8 in the form

$ P_(c \, h) = sum_(j = 1)^m sum_(ell = 1)^(d_j) #scale(x: 120%, y: 120%)[\(] \| v_(j ell) chevron.r chevron.l v_(j ell) \| #scale(x: 120%, y: 120%)[\)]_(D_j) ⊗ "id"_(Lambda \\ D_j) \, #h(2em) lr(bar.v.double \( "id" - P_(c \, h) \) Omega bar.v.double) lt.eq epsilon . quad "(6.2)" $ <eq:hole-projector>

Here the $D_j$ are nested square samples, every one containing $Q^(-) \( c \, h \) ∩ Lambda$ and contained in $Q^(+) \( c \, h \) ∩ Lambda$; the vectors $v_(j ell) in cal(H)_(D_j)$ are normalized; the displayed cylinder ranges are mutually orthogonal; and $sum_j d_j$ is bounded by one fixed power of $L$. The exponent may depend on $B_0$ and the fixed physical parameters. Fix these choices once for each center and scale used in the construction, and use the same choices on different sheets.

Let $cal(J)_(c \, h)$ be a tag register with orthonormal basis ${ \| j \, ell chevron.r }$. With a fixed one-site unit vector $\| 0 chevron.r$, define

$ K_(c \, h) = sum_(j \, ell) \| j \, ell chevron.r_(cal(J)_(c \, h)) ⊗ [#scale(x: 120%, y: 120%)[\(] \| 0 chevron.r^(⊗ D_j) chevron.l v_(j ell) \| #scale(x: 120%, y: 120%)[\)]_(D_j) ⊗ "id"_(Lambda \\ D_j)] . quad "(6.3)" $ <eq:hole-encoder>

The notation $\| 0 chevron.r^(⊗ D_j)$ denotes the product zero vector on the sites of $D_j$. Orthogonality of the tag basis gives the exact identity

$ K_(c \, h)^dagger K_(c \, h) = P_(c \, h) \, #h(2em) lr(bar.v.double K_(c \, h) bar.v.double) lt.eq 1 . quad "(6.4)" $ <eq:encoder-contraction>

In particular, the encoding retains raw registers at every site, even inside the hole. Its tag records which radius and which inside vector were used; it does not assert a low-rank approximation at one common radius. If the outer square has empty physical sample, we use the identity encoding with a one-dimensional tag.

#prodef([Definition 6.1.])[
  (Encoded frame).  An encoded frame $cal(F)$ consists of a raw ownership assignment on one sheet, a collection of holes $\( c \, h \)$ with pairwise disjoint outer squares, and a specified party holding each hole’s tag. Its encoding $K_(cal(F))$ is the product of the maps (6.3), with a fixed ordering of the newly appended tags, and its reference vector is
  $ Omega_(cal(F)) = K_(cal(F)) Omega . quad "(6.5)" $ <eq:frame-vector>
  A frame without holes is a raw sheet. An ownership guide in the plane specifies such an assignment by sampling its labels at the physical sites.
] <def:frame>

Encodings of distinct holes have disjoint raw supports and separate tags, so they commute after the canonical identification of tag orderings. If the frame has $r$ holes, their projectors also commute, and therefore

$ lr(bar.v.double Omega_(cal(F)) bar.v.double) = ∥product_(a = 1)^r P_a Omega∥ \, #h(2em) 1 - r epsilon lt.eq lr(bar.v.double Omega_(cal(F)) bar.v.double) lt.eq 1 . quad "(6.6)" $ <eq:frame-norm>

For the lower bound, expand $product_a P_a - "id"$ by successive factors and use contractivity and (6.2). We always compare vectors in their canonical site and sheet coordinates while separately specifying the owners of their input and output registers. Auxiliary sheets may eventually be retained as private discard registers.

We shall call a change #emph[bounded] if it uses a fixed number of parties and gates of the type admitted by Theorem 10. The number of normalized pair resources per monomial is fixed; their Hilbert-space dimensions need not be bounded. For every fixed $a > 0$, an operator-norm approximation of error $O \( L^(- a) \)$ is allowed, with a polynomial expansion whose exponent can depend on $a$. Scaling such an approximation by a factor $1 + O \( L^(- a) \)$ restores contractivity.

=== 6.2 A tensor estimate for bounded patch networks <a-tensor-estimate-for-bounded-patch-networks>

The following elementary tensor estimate permits us to replace a complicated bounded patch network by pair resources without a dependence on the dimensions of its open wires. A normalized vector shared by three or more parties is not itself one of the permitted pair resources. We therefore need products of vectors whose factors each belong to at most two parties. The estimate below first produces a controlled number of product terms, keeping all open legs of each original tensor together as one group. In the patch rewrite that follows, we will verify that each such group belongs to at most two owners. These groups are determined by the individual input bras and output kets, rather than by the parties.

For a matrix $M$, write $lr(bar.v.double M bar.v.double)_1$ for its sum of singular values and $lr(bar.v.double M bar.v.double)_2$ for its Hilbert–Schmidt norm. The Hilbert-space norm of a tensor equals the Hilbert–Schmidt norm of every matrix reshaping of that tensor.

#thm([Lemma 6.2.])[
  (Whole-group tensor bound).  #emph[Let a finite graph carry at each vertex a Hilbert-space tensor of norm at most one. Contract its internal edges by the usual coordinate pairing, and suppose there are no edges from a vertex to itself. Group the open legs according to their original vertices. The resulting tensor $Z$ has norm at most one and has matrix nuclear norm at most one across every bipartition into whole open-leg groups.]
  #emph[If there are $g$ nonempty open-leg groups, then, for every integer $k gt.eq 1$, there are subspaces of dimension at most $k$ in the respective group spaces whose tensor-product projection sends $Z$ to a tensor $Z_k$ with 
$ lr(bar.v.double Z - Z_k bar.v.double) lt.eq g / sqrt(k) . quad "(6.7)" $ <eq:group-truncation>

 In orthonormal bases of those subspaces, $Z_k$ has at most $k^g$ product terms, with coefficients of absolute value at most one.]
] <lem:group-tensor>

#proof[
  Merge two vertices, contracting all edges between them at the same time. After grouping their common indices, the new tensor is a matrix product up to a transpose, and
  $ lr(bar.v.double A B bar.v.double)_2 lt.eq lr(bar.v.double A bar.v.double)_2 lr(bar.v.double B bar.v.double)_2 . $
  If there are no common edges, use a tensor product instead. Continue by merging components and always contracting all edges between the two components being merged. No internal self-contraction is left behind. This proves the norm bound, and proves the same bound for every partially contracted subgraph with its remaining legs left open. It applies equally to graphs with cycles.
  For a bipartition of the whole open-leg groups, assign vertices without open legs to either side. Contract each side internally. The two tensors so obtained have norms at most one. If all cross edges are grouped into one index, the desired flattening is $A B^(sans(T))$. Hence
  $ lr(bar.v.double A B^(sans(T)) bar.v.double)_1 lt.eq lr(bar.v.double A bar.v.double)_2 lr(bar.v.double B bar.v.double)_2 lt.eq 1 . quad "(6.8)" $ <eq:group-nuclear>
  No dimension enters this estimate.
  Flatten $Z$ across one open-leg group and its complement. Let $s_1 gt.eq s_2 gt.eq dots.h.c gt.eq 0$ be its singular values. By (6.8), $sum_j s_j lt.eq 1$, and consequently
  $ sum_(j > k) s_j^2 lt.eq s_(k + 1) sum_(j > k) s_j lt.eq frac(1, k + 1) . $
  Projection onto its first $k$ left singular directions thus has error at most $k^(- 1 \/ 2)$. Do this for every original open-leg group. The projections act on disjoint tensor factors, so telescoping their product gives (6.7). The resulting tensor has norm at most one; every coefficient in any product orthonormal basis therefore has absolute value at most one. Empty or one-group cases have the same conclusion, with the natural scalar or one-factor interpretation. ◻
]

=== 6.3 Changing a frame on small patches <changing-a-frame-on-small-patches>

For a frame $cal(F)$, let $H^(-) \( cal(F) \)$ and $H^(+) \( cal(F) \)$ be the unions of the physical samples of its inner and outer hole squares. A tag is unchanged only if its hole, its encoding, and its owner are unchanged.

#thm([Lemma 6.3.])[
  (Small-patch rewrite).  #emph[Consider old and new one-sheet frames. Only a bounded number of their holes are affected; all other holes, encodings, and tag owners agree. Suppose there are $m = O \( 1 \)$ additional square patches $\( c_i \, u_i \)$, with $0 < u_i lt.eq B_0 log L$, satisfying the following conditions.]
  + #emph[Every patch’s outer square avoids the physical outer footprints of the untouched holes. Affected old and new holes also avoid those untouched footprints.]
  + #emph[The union of the patch inner squares contains every site whose raw owner changes and the entire physical outer footprints of every affected old or new hole.]
  + #emph[In each patch’s outer square, sites outside $H^(-) \( cal(F)_(upright("old")) \)$ have at most two old owners. Separately, sites outside $H^(-) \( cal(F)_(upright("new")) \)$ have at most two new owners.]
  + #emph[All raw owners on the involved patch and affected-hole footprints, and all affected tag owners, belong to a specified bounded list of parties.]
  #emph[The patches may overlap, and an old affected hole may overlap new affected holes. There is a canonical contraction $M$ between the two layouts with 
$ lr(bar.v.double M Omega_(cal(F)_(upright("old"))) - Omega_(cal(F)_(upright("new"))) bar.v.double) lt.eq \( m + r_(upright("old")) \) epsilon \, quad "(6.9)" $ <eq:rewrite-reference-error>

 where $r_(upright("old"))$ is the number of affected old holes. For every fixed $a > 0$, $M$ admits a contractive approximation $M_a$ with $lr(bar.v.double M_a - M bar.v.double) lt.eq L^(- a)$ and a polynomial sum expansion of the kind required by Theorem 10, using only the specified parties. In particular the rewrite is a bounded change with reference-vector error $O \( L^(- 20) \)$.]
] <lem:small-rewrite>

#proof[
  Write $K_(upright("old"))$ and $K_(upright("new"))$ for the products of just the affected hole encodings, and $K_0$ for the common untouched encodings. For the additional patches, let $P_1 \, dots.h \, P_m$ be the projectors of Proposition 8, again with error $epsilon$. Fix any order of the patches, and set
  $ M = K_(upright("new")) P_m dots.h.c P_1 K_(upright("old"))^dagger . quad "(6.10)" $ <eq:rewrite-map>
  This formula uses canonical raw indices between its factors and interprets the final raw and tag indices with their new owners. It is the identity on all other registers. Every factor is contractive.
  The untouched encodings commute through the displayed factors, by the first condition. Moreover, $K_(upright("old"))^dagger K_(upright("old"))$ is the product of the affected old-hole projectors. For arbitrary contractions $A_1 \, dots.h \, A_s$, the elementary identity
  $ A_s dots.h.c A_1 - "id" = sum_(j = 1)^s A_s dots.h.c A_(j + 1) \( A_j - "id" \) $
  holds; its first summand is $A_s dots.h.c A_2 \( A_1 - "id" \)$ and its last is $A_s - "id"$. Thus
  $ lr(bar.v.double \( A_s dots.h.c A_1 - "id" \) Omega bar.v.double) lt.eq sum_(j = 1)^s lr(bar.v.double \( A_j - "id" \) Omega bar.v.double) . $
  Apply this to all the patch and old-hole projectors in the order in which they occur. Multiplication by $K_0$ and $K_(upright("new"))$ can only decrease the norm, giving (6.9). This estimate does not assume that projectors of overlapping patches commute.
  We now construct the required sum expansion of (6.10). Expand each tag and each patch projector using (6.2)–(6.3). There are polynomially many complete branch choices, because the number of factors is bounded. Fix one such branch. On each selected old-hole square the branch of $K_(upright("old"))^dagger$ consumes the input tag by its basis bra, consumes the raw inputs by product zero-state bras, and supplies a decoded normalized ket $v_(j ell)$. On a new-hole square the branch of $K_(upright("new"))$ contracts against a normalized bra $chevron.l v_(j ell) \|$ and supplies product zeros and a fixed tag. A selected patch term has a normalized bra and a normalized ket on its selected square; keep these as #emph[two distinct tensor vertices].
  Factor out the fixed tag bras and kets, the one-site zero bras and kets, and every raw wire that continues directly from an input to an output without encountering any selected action. The first two sorts of factors are private norm-one maps. Every direct wire is private as well: a changed site belongs to some patch inner square, so it belongs to that patch’s selected square in every radius branch and cannot be such a wire. The old and new owner of a remaining direct wire are therefore equal. In particular, no factor $"id"_(cal(H)_A)$ with a large Hilbert–Schmidt norm needs to enter a tensor norm estimate.
  Follow the other site wires in their chronological order through the selected actions. Each one connects a normalized ket vertex to a later normalized bra vertex, or gives a raw open input or output. Actions that do not contain the site simply let its wire continue. This leaves a graph of boundedly many normalized tensors and no self-contractions. We claim that each nonempty group of open legs at an original vertex is either entirely input or entirely output, and belongs to at most two parties.
  First, every leg of an old-hole decoded ket encounters a later patch bra. Indeed its selected square lies in that hole’s outer footprint, the whole of which is covered by patch inner squares. Thus this decoded ket has no open output legs. Dually, every leg of a new-hole encoding bra encounters an earlier patch ket, so that bra has no open input legs. These assertions hold for every choice of the old and new radii, including unequal radii and overlaps between old and new holes.
  The only remaining vertices with open legs are patch bras and patch kets. A patch bra can have only raw input legs, and a patch ket can have only raw output legs. An input site inside an old inner hole is always consumed by the old decoder’s zero-state bra, since every selected hole square contains its inner square. It is therefore not an open input of a patch bra. Consequently all open inputs of a patch bra lie in that patch’s outer square outside the old inner holes, and the third condition limits their old owners to two. The corresponding output argument uses the new encoder’s zero-state kets and gives at most two new owners for the open legs of each patch ket. Intersections of selected patches only add internal ket-to-later-bra wires; they do not change these statements about open legs. This establishes the claim branch by branch, without any disjointness assumption on the patches.
  Let $Z$ be the remaining open tensor, with groups given by these original vertices. Lemma 13 supplies an approximation $Z_k$ with error $g \/ sqrt(k)$, where $g = O \( 1 \)$, and a sum of at most $k^g$ product terms. An output group vector in such a term is a normalized state on one party or a normalized bipartite state on its two owners. An input group vector, reshaped with the conjugate coordinates as appropriate, is a normalized private or bipartite covector. Their order can be chosen by first contracting all input effects and then appending all output states, since the groups have disjoint open legs. After restoring the factored private maps and direct identities, each product term is precisely a monomial allowed by Theorem 10. It uses only boundedly many pair states and effects, and its scalar coefficient has absolute value at most one. A scalar residual tensor is already a coefficient of absolute value at most one.
  For completeness, the Hilbert-space error on $Z$ bounds the operator-norm error of this branch. Consume its factored input bras, apply the residual tensor reshaped as a map, tensor that map with the direct identities, and append the factored output kets. All the outer maps are contractions, and the operator norm of a matrix is at most its Hilbert–Schmidt norm. Tensoring with a direct identity preserves its operator norm. Hence the branch error is at most $g \/ sqrt(k)$, with no factor involving the dimensions of the bypassing wires.
  Let $N lt.eq L^(C_1)$ bound the number of branches, absorbing fixed prefactors by enlarging $C_1$ for $L gt.eq 2$, and let $g lt.eq g_0$. Summing their errors gives an operator-norm error at most $N g_0 \/ sqrt(k)$. Choose a polynomial $k$ so this quantity is at most $1 / 2 L^(- a)$, and call the resulting sum $tilde(M)$. Since $M$ is contractive, $lr(bar.v.double tilde(M) bar.v.double) lt.eq 1 + 1 / 2 L^(- a)$. Then
  $ M_a = frac(tilde(M), 1 + 1 / 2 L^(- a)) quad upright("satisfies") quad lr(bar.v.double M_a bar.v.double) lt.eq 1 \, #h(2em) lr(bar.v.double M_a - M bar.v.double) lt.eq L^(- a) . $
  The total number of monomials is at most $N k^(g_0)$, their coefficients are bounded, and their participating parties are the prescribed ones. Taking, for example, $a = 30$ proves the final assertion. ◻
]

=== 6.4 Splitting a raw buffer and changing a homogeneous owner <splitting-a-raw-buffer-and-changing-a-homogeneous-owner>

The next two operations use small mutual information. We state the purification consequence with its dimension-independent error explicitly.

#thm([Lemma 6.4.])[
  (Splitting consequence).  #emph[Let $T \, U \, E$ partition $Lambda$, and let $b = I_Omega \( T : E \)$. There are finite-dimensional spaces $cal(B)_T$ and $cal(B)_E$, an isometry 
$ V : cal(H)_U arrow.r cal(B)_T ⊗ cal(B)_E \, $

 and normalized vectors $s in cal(H)_T ⊗ cal(B)_T$ and $s' in cal(H)_E ⊗ cal(B)_E$ such that 
$ lr(bar.v.double \( "id"_(T E) ⊗ V \) Omega - s ⊗ s' bar.v.double) lt.eq sqrt(2 \( 1 - e^(- b \/ 2) \)) lt.eq sqrt(b) . quad "(6.11)" $ <eq:frame-splitting>

 There is no bound on the dimensions of the two new spaces. In particular, if $b lt.eq L^(- 60)$, the error is at most $L^(- 30)$.]
] <lem:splitting>

#proof[
  Set $rho = rho_(T E)$ and $sigma = rho_T ⊗ rho_E$. Positivity shows that $"supp" rho subset.eq "supp" sigma$: the expectation of the projector onto the kernel of either marginal, tensored with identity, is zero, so that projector annihilates the support of $rho$. In particular $D \( rho bar.v.double sigma \) = b$ is well defined on this support.
  Choose separate purifications $s$ of $rho_T$ and $s'$ of $rho_E$. Enlarge their purifying factors, if necessary by appending pure ancillas, so that $cal(B)_T ⊗ cal(B)_E$ also has room for an isometric image of the entire $cal(H)_U$. Lemma 3 and (2.1) give a purification overlap
  $ F \( rho \, sigma \) gt.eq e^(- D \( rho bar.v.double sigma \) \/ 2) = e^(- b \/ 2) . $
  Its purification characterization supplies an isometry $V$ on the support used by $Omega$, attaining this overlap, with real positive phase, with $s ⊗ s'$. Extra unused dimensions allow extension to an isometry on all of $cal(H)_U$; this extension does not change the overlap. Both vectors have norm one, so their squared distance is at most $2 \( 1 - e^(- b \/ 2) \) lt.eq b$. ◻
]

The isometry in Lemma 15 will always act privately: all of $U$, and both of its enlarged output factors, will be at one party.

#thm([Lemma 6.5.])[
  (Homogeneous birth and death).  #emph[In an encoded frame, let $T$ be a set of raw sites owned by $P_compose$ and disjoint from every outer hole footprint. The proposed birth changes only the owner of $T$, from $P_compose$ to $Q_compose$. Keep every hole, its encoding, and its tag owner fixed. Define 
$ E = { x : upright("the old raw owner of ") x eq.not P_compose } union H^(+) \( cal(F) \) \, #h(2em) U = Lambda \\ \( T union E \) . quad "(6.12)" $ <eq:birth-partition>

 If $I_Omega \( T : E \) lt.eq L^(- 60)$, the birth is a bounded change involving only $P_compose \, Q_compose$, with reference-vector error at most $L^(- 30)$. The reversed death obeys the same bound whenever these ownership and information conditions hold in its surrounding frame, namely the frame #emph[after] the death.]
] <lem:birth>

#proof[
  Put $cal(V) = "id"_(T E) ⊗ V$, with $V$ from Lemma 15, and use its normalized vectors $s \, s'$. All of $T \, U$ initially belongs to $P_compose$. At that party apply $V$ on $U$, contract $T cal(B)_T$ with $chevron.l s \|$, and supply the normalized pair state $s$ on $T cal(B)_T$ with $T$ now held by $Q_compose$ and $cal(B)_T$ still held by $P_compose$. Finally apply $V^dagger$ to $cal(B)_T cal(B)_E$ at $P_compose$. The associated canonical map is
  $ B = cal(V)^dagger (\| s chevron.r chevron.l s \|_(T cal(B)_T) ⊗ "id"_(E cal(B)_E)) cal(V) . quad "(6.13)" $ <eq:birth-map>
  It is a Hermitian contraction. Writing $Pi$ for the middle projector,
  $ lr(bar.v.double \( B - "id" \) Omega bar.v.double) lt.eq lr(bar.v.double \( Pi - "id" \) cal(V) Omega bar.v.double) = lr(bar.v.double \( Pi - "id" \) \( cal(V) Omega - s ⊗ s' \) bar.v.double) lt.eq L^(- 30) . $
  Every hole encoder is supported in $E$, on whose raw registers this map acts as the identity. It also acts as the identity on tags. Commuting the encoders through the map therefore gives the same error bound on the encoded reference vectors, by their contractivity.
  For the reversed operation, first apply $V$ privately on $U$ at $P_compose$, use the normalized bipartite effect $chevron.l s \|$ on $T cal(B)_T$ held by $Q_compose \, P_compose$, and reinsert $s$ wholly at $P_compose$. Applying $V^dagger$ gives the same canonical operator $B = B^dagger$, with the reverse input and output ownership. This has one pair effect rather than one pair source. Both procedures have the required bounded expansion. If the two owner labels agree, all these maps are private; the identity also realizes the ownership change. ◻
]

In the geometric construction the information hypothesis is supplied by Proposition 7, with its exponent set to $60$. In particular, for finitely many marked points and a fixed clearance constant, the logarithmic floor $t = D log L$ can be chosen so that any eligible tapering pair $T \, E$ satisfies the hypothesis. The set $E$ in (6.12) includes outer hole footprints even when all their raw owners happen to be $P_compose$; this keeps the splitting isometry off every encoding support.

=== 6.5 Exchanging assignments between two sheets <exchanging-assignments-between-two-sheets>

#thm([Lemma 6.6.])[
  (Two-sheet exchange).  #emph[Consider two encoded frames, and a plane region $Y$. Suppose every hole’s entire outer square lies on one side of $partial Y$. Inside $Y$, exchange the two raw ownership assignments and the two lists of encoded holes, including their tag owners; outside $Y$, keep both frames unchanged. Let $P_compose$ be a party, and on the physical square put 
$ Z & = { x : upright("the two old raw owners of ") x upright(" are not both ") P_compose } union H^(+) \( cal(F)_1 \) union H^(+) \( cal(F)_2 \) \,\
T & = Z ∩ Y \, #h(2em) E = Z \\ Y \, #h(2em) U = Lambda \\ Z . quad "(6.14)" $ <eq:exchange-Z>

 If $I_Omega \( T : E \) lt.eq L^(- 60)$, the exchange can be implemented by private contractions and register renaming, with reference-vector error at most $4 L^(- 30)$. It uses $P_compose$ and the owners of the registers and tags being renamed. Thus, when these parties form a bounded list, it is a bounded change in the sense of Theorem 10.]
] <lem:exchange>

#proof[
  Let $K_(upright("in"))$ and $K_(upright("out"))$ denote the products of the two frames’ encoders before and after the exchange. For $A subset.eq Lambda$, write $F_A$ for the unitary swapping the two raw sheets at the positions in $A$. First rename the two sheets inside $Y$, together with each tag of a hole there, leaving every physical register at its present party. Call this map $cal(R)$. This is a private identification of tensor factors: the output owner of sheet 1 at $x in Y$ is precisely the old owner of sheet 2 there, and conversely. The same assertion holds for a tag moved with its whole hole. In canonical raw coordinates the exact intertwining identity is
  $ cal(R) K_(upright("in")) = K_(upright("out")) F_(Y ∩ Lambda) . quad "(6.15)" $ <eq:exchange-intertwining>
  It follows by checking each site outside holes and each whole hole encoding separately. For a hole within $Y$, all selected raw squares and its tag change sheet together; for a hole outside $Y$, nothing changes. The assumption on the outer square ensures this for every selected radius.
  All registers of $U$ on both sheets are raw, outside every hole, and held by $P_compose$ both before and after this renaming. Apply Lemma 15 to the one-copy partition $T \, U \, E$, and again write $cal(V) = "id"_(T E) ⊗ V$. Let
  $ D_U = \( V^(⊗ 2) \)^dagger F_(cal(B)_T) V^(⊗ 2) quad "(6.16)" $ <eq:exchange-buffer-correction>
  on the two copies of $U$, where $F_(cal(B)_T)$ swaps the two enlarged $cal(B)_T$ factors. The whole map is a private contraction at $P_compose$: apply the two copies of $V$, swap the indicated factors, and apply their adjoints.
  Set $A = Y ∩ U$. After $cal(R)$, first apply the private swap $F_A$, and then $D_U$. These two corrections need not commute, so we retain this order. Both corrections commute through $K_(upright("out"))$, since they act only on raw sites of $U$, away from every hole, and act trivially on tags. As $Y ∩ Lambda = T union.sq A$, their net action on raw two-copy coordinates is
  $ D_U F_A F_(Y ∩ Lambda) & = D_U F_T\
 & = \( cal(V)^(⊗ 2) \)^dagger F_(T cal(B)_T) cal(V)^(⊗ 2) . quad "(6.17)" $ <eq:exchange-net-map>
  The last equality uses that $F_T$ acts outside $U$ and hence commutes through its isometries. Consequently the implemented encoded map $C = D_U F_A cal(R)$ satisfies
  $ C K_(upright("in")) = K_(upright("out")) \( cal(V)^(⊗ 2) \)^dagger F_(T cal(B)_T) cal(V)^(⊗ 2) . quad "(6.18)" $ <eq:exchange-exact-map>
  Put $zeta = s ⊗ s'$ and $delta = lr(bar.v.double cal(V) Omega - zeta bar.v.double) lt.eq L^(- 30)$. Both vectors are normalized, so
  $ lr(bar.v.double \( cal(V) Omega \)^(⊗ 2) - zeta^(⊗ 2) bar.v.double) lt.eq 2 delta . $
  The vector $zeta^(⊗ 2)$ is fixed by $F_(T cal(B)_T)$, which swaps the two identical $s$ factors. Since $\( cal(V)^(⊗ 2) \)^dagger cal(V)^(⊗ 2) = "id"$, we obtain
  $ & ∥\( cal(V)^(⊗ 2) \)^dagger F_(T cal(B)_T) cal(V)^(⊗ 2) Omega^(⊗ 2) - Omega^(⊗ 2)∥\
 & thin lt.eq lr(bar.v.double \( F_(T cal(B)_T) - "id" \) \( \( cal(V) Omega \)^(⊗ 2) - zeta^(⊗ 2) \) bar.v.double) lt.eq 4 delta . $
  Multiplication by the contraction $K_(upright("out"))$ and (6.18) give the claimed error between the product of the old encoded reference vectors and the product of the new ones. All actual operations are private at the indicated parties; the apparent partial raw swap was induced by the change of sheet names and corrected using the common owner’s buffer. No raw register is transferred by this renaming. ◻
]

Proposition 7 will again verify the one-copy information bound in Lemma 17. Including holes from #emph[both] sheets in (6.14) ensures that the private correction commutes with every encoding. Exchanging whole outer squares ensures that all tag and radius branches use the same register identification. The second sheet may be discarded after the exchange and any subsequent point treatments; its encoded reference vector is retained in the error comparison until that discard is taken.

== 7 A finite planar distribution protocol <sec:geometry>

We now construct a schedule to which the compression rule applies. The parties will be attached to dyadic squares. Their memories need not be spatially localized: a party may initially hold an entire auxiliary copy of $Omega$, and may act on all of its own registers. What we must control is the number of parties involved in a gate, each party’s total participation in gates with other parties, and the distances between the squares to which those parties are attached.

#thm([Proposition 7.1.])[
  (Distribution through a dyadic hierarchy).  #emph[For all sufficiently large $L$, there is a protocol with the following properties. All constants in this statement are uniform in the Hamiltonian and $L$.]
  + #emph[There are $O \( L^2 \)$ parties, one for each square in a padded dyadic hierarchy and at most a fixed number of additional parties for each repainting of a square. Initialization is a pure product across parties. One party initially holds the main copy of $Omega$; all auxiliary copies are initialized privately at their designated parties.]
  + #emph[The schedule has at most $C L^3$ changes. Each change is implemented by a fixed number of contraction gates involving at most a fixed number of parties and having the bipartite-resource expansions established in Lemmas 14, 16, and 17. The expansions can be made accurate to any fixed inverse power of $L$ in operator norm where an approximation is needed. Each party participates in at most a fixed number of gates involving other parties over its entire lifetime.]
  + #emph[Every linked gate involves parties at the same or adjacent dyadic scales. Parties at a gate have addresses at distance $O \( n \)$ from one another, where $n$ is either endpoint scale; additional parties have the scale and address of the square to whose repainting they belong.]
  + #emph[There is a designated reference vector at every stage, formed from the main encoded frame and the auxiliary encoded frames. All its factors have norm at most one. Each change takes its preceding reference vector within $C L^(- 20)$ in vector norm of its following reference vector. At the end, the reference is 
$ Omega ⊗ Xi \, #h(2em) 1 - C L^(3 - 60) lt.eq lr(bar.v.double Xi bar.v.double) lt.eq 1 \, $

 where $Xi$ contains only registers to be discarded. Every original physical site is a raw register at its own unit-square party. No other party has a physical output, so every party’s physical output dimension is at most $q$.]
] <prop:protocol>

The conservative exponent $3$ in the schedule and reference-norm bounds will be convenient for error accounting. The construction below in fact has $O \( L^2 \)$ changes. We prove the proposition by specifying all its guides and verifying the hypotheses of the three frame operations.

=== 7.1 Ambient guides, holes, and the hierarchy <ambient-guides-holes-and-the-hierarchy>

Translate the lattice so that its sites are the cell centers $\( i + 1 / 2 \, j + 1 / 2 \)$, $0 lt.eq i \, j < L$. Let $N$ be a power of two with $L lt.eq N < 2 L$. The dyadic hierarchy consists of the aligned squares in $\[ 0 \, N \]^2$ of side $n = 2^j$, including the root square. Unoccupied cells of this padded square carry no registers. A different party is assigned to each dyadic square.

A #emph[guide] is a finite polygonal partition of the ambient plane, whose labels name the parties owning the raw registers at its sampled sites. All guides below are specified by their open polygonal chambers. Use one consistent tie convention for all boundaries in the finite schedule: move a sampled point by an arbitrarily small generic vector into an incident chamber, consistently across all descriptions, and take the resulting label. Equivalently, choose a sufficiently small generic displacement after all the finitely many guides are specified. No label is introduced solely on a boundary face. Separation estimates will be stated for closures, and consequently remain valid for these sampled labels. Squares used for the patch constraints retain their closed-square sampling convention.

We pass successively from the uniform assignment by $2 n$-squares to the uniform assignment by $n$-squares, for $n = N \/ 2 \, N \/ 4 \, dots.h \, 1$. At a given level, view each old $2 n$-square label as constant on its four $n$-square children, and repaint one $n$-square at a time to its new party. At the beginning and end of a repainting, every other $n$-square has either its old $2 n$-square label or its final $n$-square label. In particular, the guide along an open edge of the square being repainted has a single label on each side.

At the beginning and end of such a repainting, the exterior of $\[ 0 \, N \]^2$ has one placeholder label. During that repainting it is represented by a fresh additional party attached to the square being repainted. At the next repainting its identity may be replaced. This does not transfer any main raw register: at those transition times the placeholder owns no physical main-sheet site. We will also ensure that it holds no persistent main-sheet tag. Temporary operations may give it physical main-sheet registers within a treated neighborhood, but the repainting restores the prescribed exterior assignment before that party is retired.

Fix, in an order made precise below, constants $D > 0$ and $epsilon.alt_0 > 0$, and write

$ t = D log L \, #h(2em) h_n = epsilon.alt_0 min \( n \, t \) . quad "(7.1)" $ <eq:geometry-scales>

A #emph[true vertex] of a guide is a point lying in the closures of at least three distinct actual labels. The guides we construct have only finitely many such points. At every true vertex use the encoded hole of Definition 12, with inner radius $h_n$ and outer radius $2 h_n$, and with test exponent $60$. We will choose $epsilon.alt_0$ so that the outer squares are disjoint within each guide. For a given center and radius, make the same choice of the adaptive constraint on every sheet. Thus each branch of a hole uses a square with radius between $h_n$ and $2 h_n$.

Choose the tag holder canonically among the actual incident labels other than the placeholder, for example by a fixed order on genuine block parties. The placeholder is omitted from this choice, regardless of its current identity. A true vertex has at least two other incident labels, so the rule is always possible. An empty physical outer square uses the trivial one-branch encoding. When a guide is exchanged between sheets, use the same tag rule; its tag then accompanies the whole hole.

Before entering a new hierarchy level, resize existing main-sheet holes to its value of $h_n$, one hole at a time, without changing the guide. These resizings will also be small-patch rewrites. A fresh auxiliary sheet has a uniform guide on the whole plane and therefore no holes. An auxiliary sheet that has been retired is kept idle, with its registers and tags at their current parties, until the final discard. Its holes are not resized at subsequent levels.

=== 7.2 The edge construction before point treatment <the-edge-construction-before-point-treatment>

Choose a large fixed constant $K_0$. For $n lt.eq K_0 t$ we will repaint the square directly by a small-patch rewrite. We first describe the large-scale construction, for $n > K_0 t$, before treating its finitely many contact points.

Let $S$ be the $n$-square being repainted, with old label $A$ and final label $B$. For any of its edges let $s in \( 0 \, n \)$ be the coordinate parallel to that edge, measured from one endpoint, and let $d$ be the normal coordinate, positive into $S$. Set

$ w \( s \) = 10^(- 3) min \( s \, n - s \) \, #h(2em) x = frac(d, w \( s \)) . quad "(7.2)" $ <eq:geometry-band>

An interval in $x$ always refers only to this parallel-coordinate span. These intervals define polygonal bands, with their only bends at $s = n \/ 2$.

First birth $B$ in the central part of $S$, leaving the four inward edge bands $0 < x < 1$ with label $A$. More explicitly, the changed open chambers are the points of the interior of $S$ lying beyond the $x = 1$ boundary for every edge. Their closure meets the exterior of $S$ only at the four corners. These four corners are the marked contact points for this birth. Now process the four edges one at a time. At the start of an edge operation its normal word is

$ C quad A quad B \, #h(2em) x < 0 \, quad 0 < x < 1 \, quad x > 1 \, $

in the neighborhood of the edge. Here $C$ is the label on the unique exterior neighboring $n$-square, or the placeholder at an exterior edge. Nominal names in all the words below are permitted to coincide; adjacent equal labels are simply one actual region. The marked points for an edge operation are its two endpoints.

The reason for using an auxiliary sheet is already visible when $A \, B \, C$ are distinct. A direct death of the $A$ strip into $B$ would leave the surrounding word $C divides B$. The closure of the changed strip meets $C$ along the entire original edge, so it has zero separation from the non-$B$ owners. The angular-information estimate therefore does not supply the hypothesis needed for Lemma 16. We instead prepare additional $A$ and $B$ strips on an auxiliary sheet and exchange them into the exterior. The resulting $C$ strip is surrounded by $A$ and can die into it; the combined $A$ strip is then surrounded by $B$ and can die in turn. A final birth and death restore the original exterior assignment. The construction below supplies these buffers away from the endpoints; the subsequent point treatment supplies the logarithmic clearance there.

Perform the following finite sequence.

+ Initialize a fresh auxiliary $Omega$ sheet uniformly at $C$. On this sheet birth $B$ in $- 6 < x < - 1$, then $A$ in $- 5 < x < - 2$, then $C$ in $- 4 < x < - 3$. Each insertion lies strictly inside its surrounding band. The resulting auxiliary word is
  $ C divides B divides A divides C divides A divides B divides C \, #h(2em) - 6 \, - 5 \, - 4 \, - 3 \, - 2 \, - 1 quad "(7.3)" $ <eq:geometry-aux-word>
  where the numbers list successive interfaces.
+ Exchange the two sheet assignments on the lens
  $ Y = { 0 < s < n : med - 7 < x < - 7 \/ 2 } . quad "(7.4)" $ <eq:geometry-lens>
  Both of its open sides lie in common-$C$ corridors: the side $x = - 7$ lies in the auxiliary $C$ sector $x < - 6$, and the other passes through the auxiliary $C$ band $\( - 4 \, - 3 \)$. The main sheet was $C$ throughout this exterior strip. After the exchange its word is
  $ C divides B divides A divides C divides A divides B \, #h(2em) - 6 \, - 5 \, - 4 \, 0 \, 1 . quad "(7.5)" $ <eq:geometry-main-word>
  The auxiliary sheet is then retired, after completing the point treatments for this exchange as described below.
+ On the main sheet, kill the $C$ band $\( - 4 \, 0 \)$ into $A$, and then kill the resulting $A$ band $\( - 5 \, 1 \)$ into $B$. The word is now $C divides B$ with interface at $- 6$. Birth $C$ in $\( - 3 \, 0 \)$ inside $B$, and kill the remaining $B$ band $\( - 6 \, - 3 \)$ into $C$. The final word is $C divides B$ with interface at zero.

Figure 1 records the complete normal-word sequence at a fixed parallel coordinate.

#figure(
  [#raw(block: true, lang: "latex", "\\begin{tikzpicture}[\n  x=.86cm,y=1cm,\n  bandA/.style={fill=orange!35,draw=black!35,line width=.3pt},\n  bandB/.style={fill=cyan!28,draw=black!35,line width=.3pt},\n  bandC/.style={fill=black!12,draw=black!35,line width=.3pt},\n  lens/.style={draw=red!65!black,dashed,line width=.8pt}\n]\n  \\foreach \\geometrytick in {-8,-7,...,2} {\n    \\draw[black!10,line width=.3pt]\n      (\\geometrytick,.48) -- (\\geometrytick,-5.17);\n    \\draw[black!60,line width=.35pt]\n      (\\geometrytick,.55) -- (\\geometrytick,.65);\n    \\node[above,font=\\scriptsize] at (\\geometrytick,.67)\n      {$\\geometrytick$};\n  }\n  \\draw[->,black!70] (-8.13,.60) -- (2.25,.60)\n    node[right,font=\\small] {$x$};\n  \\node[font=\\scriptsize] at (-4,1.32) {exterior: $d<0$};\n  \\node[font=\\scriptsize] at (1,1.32) {interior: $d>0$};\n\n  \\geometryrow{0}{\\textbf{Main: initial}\\\\before the exchange}\n  \\geometryband{0}{-8}{0}{C}\n  \\geometryband{0}{0}{1}{A}\n  \\geometryband{0}{1}{2}{B}\n\n  \\geometryrow{-.82}{\\textbf{Auxiliary}\\\\three nested births}\n  \\geometrybandat{-.82}{-8}{-6}{C}{-7.22}\n  \\geometryband{-.82}{-6}{-5}{B}\n  \\geometryband{-.82}{-5}{-4}{A}\n  \\geometrybandat{-.82}{-4}{-3}{C}{-3.72}\n  \\geometryband{-.82}{-3}{-2}{A}\n  \\geometryband{-.82}{-2}{-1}{B}\n  \\geometryband{-.82}{-1}{2}{C}\n  \\draw[lens] (-7,-1.07) rectangle (-3.5,-.57);\n  \\node[below,inner sep=0pt,font=\\scriptsize,text=red!65!black] at (-5.25,-1.09)\n    {exchange lens $Y=(-7,-7/2)$};\n\n  \\geometryrow{-1.64}{\\textbf{Main: exchange}\\\\auxiliary retired}\n  \\geometryband{-1.64}{-8}{-6}{C}\n  \\geometryband{-1.64}{-6}{-5}{B}\n  \\geometryband{-1.64}{-5}{-4}{A}\n  \\geometryband{-1.64}{-4}{0}{C}\n  \\geometryband{-1.64}{0}{1}{A}\n  \\geometryband{-1.64}{1}{2}{B}\n\n  \\geometryrow{-2.46}{\\textbf{Main: first death}\\\\$C\\to A$ on $(-4,0)$}\n  \\geometryband{-2.46}{-8}{-6}{C}\n  \\geometryband{-2.46}{-6}{-5}{B}\n  \\geometryband{-2.46}{-5}{1}{A}\n  \\geometryband{-2.46}{1}{2}{B}\n\n  \\geometryrow{-3.28}{\\textbf{Main: second death}\\\\$A\\to B$ on $(-5,1)$}\n  \\geometryband{-3.28}{-8}{-6}{C}\n  \\geometryband{-3.28}{-6}{2}{B}\n\n  \\geometryrow{-4.10}{\\textbf{Main: birth}\\\\$B\\to C$ on $(-3,0)$}\n  \\geometryband{-4.10}{-8}{-6}{C}\n  \\geometryband{-4.10}{-6}{-3}{B}\n  \\geometryband{-4.10}{-3}{0}{C}\n  \\geometryband{-4.10}{0}{2}{B}\n\n  \\geometryrow{-4.92}{\\textbf{Main: final death}\\\\$B\\to C$ on $(-6,-3)$}\n  \\geometryband{-4.92}{-8}{0}{C}\n  \\geometryband{-4.92}{0}{2}{B}\n\\end{tikzpicture}")],
  caption: [Figure 1: Normal-band words at one fixed $0 < s < n$, in the coordinate $x = d \/ w \( s \)$ with $w \( s \) = 10^(- 3) min \( s \, n - s \)$; the chart displays only $- 8 lt.eq x lt.eq 2$. The auxiliary starts uniformly at $C$ before the three nested births shown in its row. Exchanging the two sheets on the dashed lens creates the next main row: both displayed transverse boundaries lie in $C$ corridors on both sheets. The two deaths leave the interface at $x = - 6$; the last birth and death move it to $x = 0$, restoring the exterior label $C$. These are nominal labels: $A \, B \, C$ may coincide. This is a transverse schematic away from the edge endpoints and their point treatments. ],
) <fig:geometry-bands>

Every band used in this sequence is contained in $- 8 < x < 2$. Such bands along distinct edges of $S$ have disjoint interiors. Opposite edges are separated by $n$, whereas their bands have width at most $0.004 n$ on either relevant side. For adjacent edges, a common point in the parallel-coordinate spans would have to lie inside $S$ near the shared corner. If its two distances from those edges are $r_1 \, r_2$, membership in both enlarged bands would imply $r_1 < 0.008 r_2$ and $r_2 < 0.008 r_1$, which is impossible. The negative part of an edge band lies in its one exterior neighboring square, and cannot enter the parallel-coordinate span of an adjacent edge. Consequently an already completed edge does not alter the normal word needed at the next one. At the end of the four edge operations $S$ has label $B$ and every other square has its original label. The same description is valid along the placeholder exterior: all temporary plane changes there are restored at the end.

=== 7.3 Uniform angular separation <uniform-angular-separation>

We record precisely the geometry needed to invoke the information estimate. For a given elementary operation let $cal(V)$ be its set of marked corners or endpoints and put $d_(cal(V)) \( y \) = min_(v in cal(V)) \| y - v \|_oo$. For a birth, its #emph[surrounding guide] is the guide before the insertion; for a death, it is the guide after the removal. In that surrounding guide the changed region lies within a single label $P_compose$.

#thm([Lemma 7.2.])[
  (Separation of the unmodified bands).  #emph[There is a fixed $a_0 > 0$ such that every unmodified elementary birth or death above has changed region $R$ of diameter $O \( n \)$ and surrounding guide $f$ satisfying 
$ "dist" #scale(x: 120%, y: 120%)[\(] y \, overline({ f eq.not P_compose }) #scale(x: 120%, y: 120%)[\)] gt.eq a_0 min { n \, d_(cal(V)) \( y \) } \, #h(2em) y in overline(R) . quad "(7.6)" $ <eq:geometry-birth-clearance>

 For an unmodified lens exchange, every point in the closure of the positions that are not common $C$ on its two before guides satisfies 
$ "dist" \( y \, partial Y \) gt.eq a_0 min { n \, d_(cal(V)) \( y \) } . quad "(7.7)" $ <eq:geometry-exchange-clearance>

 Here and throughout this section distances are ambient sup distances.]
] <lem:geometry-angular>

#proof[
  For the central birth the closed changed region is separated from the exterior of $S$ by the four edge bands, except at the four corners. Near a corner its two distances from the adjacent edges are bounded below by a fixed positive fraction of its sup distance from that corner. This gives the asserted conical separation there. Away from the corners the margin is a fixed positive fraction of $n$.
  The first auxiliary insertion has a uniform surrounding guide. The second and third have closed normal intervals strictly inside the surrounding intervals $\( - 6 \, - 1 \)$ and $\( - 5 \, - 2 \)$, respectively. For the first main death the surrounding $A$ interval is $\( - 5 \, 1 \)$ and the changed interval is $\( - 4 \, 0 \)$. For the second main death the surrounding $B$ sector includes $\( - 6 \, 2 \)$ and the changed interval is $\( - 5 \, 1 \)$. For the last birth the surrounding $B$ sector again includes $\( - 6 \, 2 \)$, while the inserted interval is $\( - 3 \, 0 \)$. For the last death the surrounding $C$ sector includes $\( - 8 \, 0 \)$ and the changed interval is $\( - 6 \, - 3 \)$. All these margins are strict. The enlarged edge bands avoid unrelated edges and blocks by the preceding disjointness check.
  For the exchange, the main guide is $C$ throughout the open exterior band. Both lens thresholds $- 7$ and $- 7 \/ 2$ lie strictly inside $C$ sectors of the auxiliary word in (7.3). Hence the lens boundary can meet the closed noncommon-$C$ region only at its two marked endpoints.
  In a fixed neighborhood of every marked point, in units of $n$, all these interfaces are straight rays. The relevant closed conical sets have no common direction: away from their center they are disjoint by the strict interval margins just checked. Their intersections with a unit sup sphere therefore have positive separation. Homogeneity gives (7.6) and (7.7) near the marked points. On the remaining bounded region, compactness after scaling by $n$ gives a positive minimum separation. Points far from the bounded lens are harmless for (7.7).
  Only finitely many scaled configurations occur: the baseline nearby $n$-squares have a finite number of label-equality patterns, and the band prescriptions are fixed. Thus one $a_0$ works for all of them. Identifying two nominal labels only removes parts of the obstructing sets or makes an operation an identity, and never worsens a separation already proved. This includes equality with the single placeholder label. ◻
]

All true vertices of an unmodified guide are separated on scale $n$. Indeed the baseline vertices are grid corners. The new band interfaces are disjoint except at their indicated endpoints. Their bends at $s = n \/ 2$ have only two incident labels and so are not true vertices. In a fixed-radius neighborhood of a marked point, in units of $n$, the only possible true vertex is the marked point itself.

=== 7.4 Point treatment and the actual bulk operations <point-treatment-and-the-actual-bulk-operations>

Before implementing one elementary birth or death, homogenize each involved sheet inside the radius-$t$ square around every mark to its surrounding label $P_compose$. Make the same modification in the target guide of that elementary operation. Thus its actual bulk recoloring is truncated by those squares. For an exchange, homogenize both sheets there to $C$; the lens $Y$ itself need not be altered because the assignments coincide throughout the homogenized portions. After the bulk operation, remove the point treatment by changing to the specified target guide. We prove below that every homogenization and every removal is a small-patch rewrite.

Choose $K_0$ large enough that, when $n > K_0 t$, the tenfold enlargements of the treated squares are disjoint, contain no other unmodified true vertices, and lie inside the straight-ray charts used above. In a treated neighborhood, any newly created true vertex is at the intersection of a ray with the square rim. The set of possible rim intersection points is finite after scaling by $t$. Coincident points count as one point. There is therefore a positive minimum separation between distinct possible centers, uniformly over the finite pattern family. Take $epsilon.alt_0$ small compared with these separations, with the ordinary grid separations, and with $a_0$. This makes the outer holes disjoint, including in the temporary guides.

Figure 2 illustrates how a true vertex can move to the rim during a point treatment.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-4.73, -1.72), (-1.29, 1.72), fill: rgb("#f0f0f0"))
  rect((-3.01, 0), (-1.29, 1.72), fill: rgb("#d1d1ff"))
  rect((-3.01, -1.72), (-1.29, 0), fill: rgb("#ffebc7"))
  line((-3.01, -1.72), (-3.01, 1.72))
  line((-3.01, 0), (-1.29, 0))
  rect((-3.87, -0.86), (-2.15, 0.86), stroke: (paint: rgb("#808080"), dash: "dashed"))
  rect((-3.148, -0.1376), (-2.872, 0.1376), stroke: (paint: rgb("#bf0000")))
  rect((-3.285, -0.2752), (-2.735, 0.2752), stroke: (paint: rgb("#bf0000"), dash: "dashed"))
  circle((-3.01, 0), radius: 0.05292, fill: black)
  content((-4.257, 0.473), [$P$])
  content((-1.72, 1.29), [$A$])
  content((-1.72, -1.29), [$B$])
  content((-3.01, -1.875), [Before clearing], anchor: "north")
  content((-3.01, 1.849), [Original true vertex#linebreak()at the mark], anchor: "south")
  line((-0.946, 0), (0.946, 0), mark: (end: ">"))
  content((0, 0.1032), [fill the square#linebreak()with $P$], anchor: "south")
  rect((1.29, -1.72), (4.73, 1.72), fill: rgb("#f0f0f0"))
  rect((3.01, 0), (4.73, 1.72), fill: rgb("#d1d1ff"))
  rect((3.01, -1.72), (4.73, 0), fill: rgb("#ffebc7"))
  rect((2.15, -0.86), (3.87, 0.86), fill: rgb("#f0f0f0"))
  rect((2.15, -0.86), (3.87, 0.86), stroke: (paint: rgb("#808080"), dash: "dashed"))
  line((3.01, 1.72), (3.01, 0.86), (3.87, 0.86), (3.87, -0.86), (3.01, -0.86), (3.01, -1.72))
  line((3.87, 0), (4.73, 0))
  rect((3.732, -0.1376), (4.008, 0.1376), stroke: (paint: rgb("#bf0000")))
  rect((3.595, -0.2752), (4.145, 0.2752), stroke: (paint: rgb("#bf0000"), dash: "dashed"))
  circle((3.87, 0), radius: 0.05292, fill: black)
  circle((3.01, 0), radius: 0.05292, stroke: (paint: rgb("#808080")))
  content((1.763, 0.473), [$P$])
  content((3.01, 0.387), [$P$])
  content((4.3, 1.29), [$A$])
  content((4.3, -1.29), [$B$])
  content((3.01, -1.875), [After clearing], anchor: "north")
  content((3.01, 1.849), [New true vertex#linebreak()on the rim], anchor: "south")
})],
  caption: [Figure 2: A point treatment for three distinct labels, shown in units of $t$. The dashed gray square is the radius-one treated square; solid black lines are actual label interfaces. After filling with $P$, the only true vertex in this example is the meeting of $P \, A \, B$ on the right rim. The other ray/rim contacts involve only two labels. Red solid and dashed squares illustrate the inner and outer holes at the actual true vertices, enlarged for visibility. In the protocol their radii are $h_n$ and $2 h_n$, with one uniformly small $epsilon.alt_0$; the same construction handles the finitely many ray patterns in the proof. ],
) <fig:geometry-points>

For a birth or death, a point of the remaining closed changed region lies outside the interiors of the treated squares. Consequently $d_(cal(V)) \( y \) gt.eq t$, and homogenization to the surrounding label can only remove its other-label obstructions. By (7.6), after decreasing a fixed constant if necessary, its separation from the other labels is bounded below by

$ a_1 max { t \, min \( n \, d_(cal(V)) \( y \) \) } \, #h(2em) a_1 > 0 . quad "(7.8)" $ <eq:geometry-floor>

Every true vertex of the surrounding temporary guide belongs to the closure of positions of labels different from $P_compose$. Enlarging such a center to its outer hole square subtracts at most $2 h_n$ from this separation. Since $h_n = epsilon.alt_0 t$ in the present large-scale case, a further fixed decrease of $a_1$ preserves (7.8) for all outer hole sites too.

There are no changed true vertices in the bulk recoloring. To see this also at the treated rims, the closure of the truncated changed region has a positive neighborhood containing only $P_compose$ in the surrounding guide. A birth or reversed death introduces only one additional label in that neighborhood. Thus any newly drawn interface, including where it meets a treated-square rim, has at most two incident labels. Existing true vertices are separated from this closed change and retain their guides, holes, and tag holders. The raw target $T$ is therefore outside all holes, compactly located in diameter $O \( n \)$, and satisfies the tapering hypothesis against the set $E$ consisting of other owners and all outer hole sites. The remaining raw buffer has a single owner. Lemma 16, in its forward or reverse form, implements the bulk change.

For the exchange, homogenization removes all noncommon-$C$ positions inside the treated squares. By (7.7), every remaining such position has the same floor at $t$ in its distance from $partial Y$. This also holds for new rim vertices: a rim true vertex belongs to the closure of an outside sector that is not $C$, and the original angular estimate applies at that point. Thus $partial Y$, including each of its intersections with a treated-square rim, lies in an open common-$C$ corridor. No new true vertex is created by exchanging the guides along that boundary.

Every true vertex on either sheet belongs to the closure of a noncommon-$C$ region. Its distance from $partial Y$ is at least a fixed multiple of $t$ in a treated neighborhood, and obeys the larger angular bound elsewhere. The full outer hole square, of radius $2 epsilon.alt_0 t$, therefore lies strictly on one side of the lens boundary. The same tapered bound holds at every point of an outer hole, not only at its center: both $y mapsto "dist" \( y \, partial Y \)$ and $y mapsto d_(cal(V)) \( y \)$ are $1$-Lipschitz. If $c$ is the center and $\| x - c \|_oo lt.eq 2 epsilon.alt_0 t$, put $Q_x = max { t \, min \( n \, d_(cal(V)) \( x \) \) }$. A center clearance $a_(*) max { t \, min \( n \, d_(cal(V)) \( c \) \) }$ gives

$ "dist" \( x \, partial Y \) gt.eq a_(*) Q_x - 2 epsilon.alt_0 \( a_(*) + 1 \) t gt.eq 1 / 2 a_(*) Q_x $

after fixing $epsilon.alt_0$ small enough. In particular, #emph[every] selected variable-radius square in that hole lies on the same side, since its radius is at most $2 h_n$. Exchanging a neighborhood of such a vertex substitutes one complete sheet guide and carries its entire hole and tag. It does not splice sectors of two guides at a vertex.

For Lemma 17, let $T$ be the positions inside $Y$ that are not common $C$, together with all inside outer hole sites, and let $E$ be the analogous set outside $Y$. The set $T$ has diameter $O \( n \)$. Any segment from a point of $T$ to a point of $E$ crosses $partial Y$, so its length is at least the distance of that point of $T$ from the boundary. The preceding clearance bounds, including the outer-hole enlargement, therefore give the required tapering separation of $T$ from $E$. On the remaining positions both raw copies are held by $C$. This proves all hypotheses of the exchange lemma, including its condition on whole holes and their tags.

All statements use actual labels. Coalescing nominal labels cannot create a meeting of three actual owners: the closure of an identified region is the union of its finitely many former closures. If a nominal vertex disappears under such an identification, at most two actual owners meet there and no vertex encoding is required. The same argument covers the exterior placeholder. Empty physical targets need no information estimate.

Choose one fixed $a > 0$ smaller than all the surviving constants in these tapering bounds. Proposition 7, at accuracy $L^(- 60)$, then supplies a sufficiently large fixed $D$ in (7.1). The birth and exchange errors are $O \( L^(- 30) \)$, as required by their lemmas. The constants used to choose $a$ depend only on the fixed geometric templates, not on $D$.

=== 7.5 The small-patch covers <the-small-patch-covers>

We verify every invocation of Lemma 14. The following compactness observation makes the two-owner condition uniform, including along the boundary of an inner hole.

Fix a compact working neighborhood and one scaled guide. For each actual label $c$, let $F_c$ be the closure of its region in that neighborhood, with all open inner hole squares removed. Each $F_c$ is compact. No three $F_c$ with distinct actual labels have a common point, because every true vertex lies strictly inside its own inner hole. It follows that there is a positive footprint diameter such that no smaller footprint meets three of these sets. Otherwise take a sequence of shrinking footprints, pass to constant label choices and convergent points in the compact working neighborhood, and obtain a point common to three distinct $F_c$.

This remains uniform for our small-scale and resizing radius parameters. After scaling, these parameters range over compact intervals bounded away from zero. The joint sets of a parameter and a point belonging to $F_c$ are closed: being outside an open square is a non-strict distance inequality. The same convergent-subsequence argument applies to the joint sets. There are only finitely many label-equality types, so take the minimum positive footprint bound over those types. Apply the test separately to the old and new guides, then take the smaller bound. Different old and new hole centers do not mix the two tests.

Notice that the #emph[center] of a footprint may lie inside a hole. The condition counts labels only at footprint points outside the relevant inner holes. Thus this observation permits a net of small patches to cover the #emph[whole outer] hole footprints, as required by Lemma 14.

===== 7.5.1 Point homogenization and removal. <point-homogenization-and-removal.>

For one mark in the large-scale case, work in its radius-$2 t$ neighborhood. Include as affected every old and new hole at the marked center or on the treated-square rim. These are all possible changed true vertices, and their outer squares lie strictly inside that neighborhood for small $epsilon.alt_0$. There are no other holes nearby. In units of $t$, the old and new guides are from a finite family of ray patterns, with or without the square clearing, and the inner hole radius is $epsilon.alt_0$.

Choose a fixed sufficiently small $nu > 0$. Patches with inner radius $u = nu t$, centered on a square net of mesh at most $u$, cover the treated square and all affected outer holes. Take the centers within $u$ of the set to be covered. With $nu$ small, their outer squares are still inside the working neighborhood and avoid every untouched hole. The compactness observation gives at most two old owners outside the old inner holes and at most two new owners outside the new inner holes in each outer patch. The number of patches is fixed: the working diameter is $O \( t \)$ and the patch radius is $nu t$. Their raw owners and affected tag holders are among the bounded list of parties in this local diagram. Apply Lemma 14, one mark and one sheet at a time. The separated marked neighborhoods do not change one another’s diagrams. The same verification applies when removing the point treatment after the bulk operation, using its actual target guide.

===== 7.5.2 Direct repainting when $n lt.eq K_0 t$. <direct-repainting-when-nle-k_0t.>

Before and after a direct repainting, true vertices are grid corners. Only the four corners of the square being repainted can change their true-vertex status or their tag holder. Treat every old or new hole at those corners as affected. The hole radius obeys

$ frac(epsilon.alt_0, max \( K_0 \, 1 \)) lt.eq h_n / n lt.eq epsilon.alt_0 . quad "(7.9)" $ <eq:geometry-small-radius>

In units of $n$, the old/new label patterns form a finite collection, and the possible radius ratios lie in the displayed compact positive interval. The compactness observation gives a uniform sufficiently small patch radius $u = nu n$. A fine net covers $S$ and the entire affected outer holes with a fixed number of such patches. Every untouched grid-corner hole is a fixed scaled distance from the set to be covered: corners of $S$ have all been included, and any other grid corner is at distance at least $n$ from $S$. Choosing $epsilon.alt_0$ and then $nu$ small makes all outer patches avoid those holes. All hypotheses of Lemma 14 follow. This directly repaints $S$ without using an auxiliary sheet.

===== 7.5.3 Hole resizing. <hole-resizing.>

Entering level $n$, the old and new radii are $epsilon.alt_0 min \( 2 n \, t \)$ and $epsilon.alt_0 min \( n \, t \)$. If they differ, then $n < t$, in particular $n lt.eq K_0 t$, and their ratio lies between one and two. The current guide is unchanged and is uniform on $2 n$-blocks. Resize one true-vertex hole at a time. The union of its two outer footprints has diameter $O \( n \)$; other true vertices are separated on that scale. The same compactness and fine-net argument covers both footprints, avoids all other holes, and gives the separate old/new two-owner tests. Intermediate configurations with some holes already resized obey the same positive radius and separation bounds. This proves the required small-patch rewrite for each resize.

For completeness, these covers apply uniformly to every selected adaptive radius in a rewrite branch. A selected patch square contains its inner square, so every changed raw site and every site of an affected selected hole is intercepted by a patch. A raw input-to-output identity wire that remains unintercepted cannot change owner. An old-hole decoded ket therefore has no open leg directly at a new raw output, and a new-hole encoding bra has none directly at an old raw input. Overlapping patches merely connect an earlier patch ket to a later patch bra. Open patch-bra legs come from raw inputs outside all old inner holes, and open patch-ket legs go to raw outputs outside all new inner holes. Their owner counts are exactly the separate two-owner counts just proved. Thus the geometric hypotheses give the branchwise support facts used in the tensor expansion of Lemma 14, even when old and new holes have different radii.

There is no circular choice of constants. First fix the band templates and obtain $a_0$ and their radial-chart constants; then choose $K_0$, then $epsilon.alt_0$, and then the fixed mesh parameter $nu$ from the compact families just described. Choose the smaller clearance $a$ and the information scale constant $D$ afterward. Finally choose $B_0$ large enough that all hole radii and all added patch radii are at most $B_0 log L$. A fixed multiple of $K_0 D$ suffices, since the point patches have size $O \( t \)$, the direct patches have size $O \( n \) lt.eq O \( K_0 t \)$, and all holes have size $O \( t \)$. The adaptive patch ranks may depend on this fixed $B_0$, but every selected support still lies between its predetermined inner and outer square, so no geometric constant has to be chosen again.

=== 7.6 Party lifetimes and the protocol bounds <party-lifetimes-and-the-protocol-bounds>

Each elementary birth, death, or exchange has a fixed number of marks. The point treatments have a fixed number of patches and parties. The edge word uses a fixed number of elementary operations and four auxiliary sheets at most per repainting. Consequently each repainting, and each junction resize, uses a uniformly bounded number of linked gates and parties. Small-patch rewrites can be replaced by arbitrarily accurate polynomial expansions and rescaled near one to remain contractions. Together with the $L^(- 60)$ patch tests and the $O \( L^(- 30) \)$ splitting errors, choose their precision so that each change has reference-vector error at most $C L^(- 20)$.

At a level-$n$ repainting, every active main owner is an $n$- or $2 n$-block owner. On the affected footprints those blocks lie at distance $O \( n \)$ from the repainted square. The same is true of their tag holders, since tags are held by incident labels. An auxiliary uses only the labels of the local edge and point diagrams; its uniform initial owner $C$ is the actual neighboring-block owner, even though it privately holds a whole copy of $Omega$. The placeholder party is attached to the repainted block at scale $n$. Resizing uses the current block labels near its junction. Private buffer isometries may act on registers at much more distant physical positions, but create no additional party or link.

The following stronger invariant concerns active main owners; the inactive exterior placeholder is omitted at the start and end of a level. It proves the lifetime claim, rather than just locality at an individual step:

$ upright("start of level ") n & : upright(" only ") 2 n upright("-block main labels") \;\
upright("during level ") n & : upright(" only ") 2 n upright("- and ") n upright("-block main labels,
 plus its temporary placeholder") \;\
upright("end of level ") n & : upright(" only ") n upright("-block main labels") . quad "(7.10)" $ <eq:geometry-active-labels>

Main tags always use incident non-placeholder labels. Hence a party of side $m$ disappears from every main tag as well as every main guide region by the end of level $m \/ 2$. In particular, when the last incident child square repaints, its corner rewrite updates the tag at that junction. Resizing introduces no obsolete owner. Thus this party can occur in linked gates only at levels $m$ and $m \/ 2$ and their intervening transition. At these scales there are only a fixed number of repaintings or junctions within distance $O \( m \)$ of its block.

Frozen auxiliary frames do not invalidate this invariant. Each is initialized, used in its one edge construction, returned from its point treatment to its specified final frame, and permanently retired before the repainting ends. Its remaining entangled registers and tags are kept idle at their owners. No subsequent gate undoes that exchange, and no later auxiliary initialization consults a frozen label: its $C$ is always selected from the current main guide. Therefore frozen memory contributes no further linked incidence. The same applies to a retired placeholder party. A fresh placeholder identity at the next repainting has no raw main register or persistent main tag to inherit. This proves a uniform bound on every party’s total linked participation.

For later routing, a square of side $n = 2^j$ and block indices $\( r \, s \)$ has the integer address

$ a \( S \) = cases(delim: "{", \( n r + n \/ 2 \, thin n s + n \/ 2 \) \, & j gt.eq 1 \,, \( r \, s \) \, & j = 0 .) quad "(7.11)" $ <eq:geometry-addresses>

Use the same address for its additional parties. The preceding locality statement gives $O \( n \)$ address distances for parties sharing a gate, and their scales are equal or adjacent. The addresses lie in ${ 0 \, dots.h \, N - 1 }^2$; unit-square physical outputs have their actual site indices as addresses.

There are $O \( \( N \/ n \)^2 \)$ repaintings and junctions at scale $n$. Summing over dyadic scales gives $O \( N^2 \) = O \( L^2 \)$ in total. The number of block parties, additional parties, auxiliary sheets, and changes is therefore $O \( L^2 \)$, and in particular bounded by $C L^3$. Each frozen auxiliary has only a fixed number of holes: its guide differs from its uniform guide only in one bounded edge template and its endpoint treatments. Even the weaker total bound $C L^3$ on frozen auxiliary holes will suffice.

Initialize all required copies of $Omega$ privately at their future owners, including the main copy at the root. This is a pure product initialization across parties, with no restriction on private state complexity. At the beginning the main guide has only the root label and the exterior placeholder, so it has no true vertex and no hole. At every stage use the tensor product of the designated main frame, active auxiliary frames, idle initial copies, and frozen final auxiliary frames as its reference vector. Untouched factors have norm at most one, so the local reference-error bounds remain valid with all these spectators.

At level $n = 1$, choose $epsilon.alt_0 < 1 \/ 4$. A grid-corner outer hole then has radius $2 epsilon.alt_0 < 1 \/ 2$ and contains no cell-center physical site. Its encoding is trivial. Thus all remaining main registers are raw at their unit-square parties and the main reference is exactly $Omega$, apart from trivial tags. The other reference factors comprise $Xi$. Each encoded auxiliary frame has norm at least one minus its number of holes times $L^(- 60)$, by the frame constraint and contraction bounds. Multiplying these lower bounds and using the total frozen-hole count gives $1 - C L^(3 - 60) lt.eq lr(bar.v.double Xi bar.v.double) lt.eq 1$. All auxiliary registers and all nonphysical outputs can be discarded party by party.

This proves every assertion of Proposition 18.

== 8 From the protocol to a PEPS <sec:assembly>

We now turn the distributed construction into the vector approximation of Theorem 1. All private registers, including frozen sheets and effect inventories, are kept until the last trace. This preserves the normalization information needed when passing from an operator network to a ket.

=== 8.1 Error and normalization <error-and-normalization>

Apply Proposition 18 with patch and information power $60$. The initial state is a product #emph[by party]: the root privately holds the main $Omega$, and every future auxiliary copy of $Omega$ is held privately by its designated initializing party. Private dimensions and initial vectors are unrestricted in Theorem 10. The main initial guide has one label and needs no holes.

There are at most $C L^3$ changes and at most $C L^3$ holes across all frozen auxiliary reference frames. Each encoding is contractive, and its failure on $Omega$ is at most the number of its holes times $L^(- 60)$. Thus the final reference vector has the form

$ Omega ⊗ Xi \, #h(2em) 1 - C L^(- 57) lt.eq lr(bar.v.double Xi bar.v.double) lt.eq 1 . quad "(8.1)" $ <eq:reference-junk>

At unit scale all physical outputs are raw at their unit parties; any remaining main hole has empty physical support and a trivial tag.

Instantiate the protocol using the contractive polynomial approximants of Lemma 14, with operator-norm error at most $L^(- 25)$, for every small-patch rewrite. The birth, death, and exchange maps already have the required form. Each selected change therefore takes its reference vector within $O \( L^(- 20) \)$ of the next one, and the actual protocol uses these selected contractions throughout. Telescoping a product of contractions bounds the accumulated vector error by the sum of the individual errors. Consequently the actual final vector $Psi$ satisfies

$ lr(bar.v.double Psi - Omega ⊗ Xi bar.v.double) lt.eq C L^(- 17) \, #h(2em) lr(bar.v.double Psi bar.v.double) lt.eq 1 . $

For vectors of norm at most one, $lr(bar.v.double \| u chevron.r chevron.l u \| - \| v chevron.r chevron.l v \| bar.v.double)_1 lt.eq 2 lr(bar.v.double u - v bar.v.double)$. Tracing the private outputs and using (8.1) gives

$ ∥"Tr"_(upright("private")) \| Psi chevron.r chevron.l Psi \| - \| Omega chevron.r chevron.l Omega \|∥_1 lt.eq C L^(- 17) + C L^(- 57) lt.eq C L^(- 10) . quad "(8.2)" $ <eq:protocol-density>

In particular the protocol does not rely on renormalizing an exponentially small success amplitude.

Every party has physical output dimension at most $q$, every linked gate has the expansion required in Theorem 10, and linked incidence is bounded over the whole lifetime of each party. That theorem, with accuracy $L^(- 5)$, therefore gives a party operator network $sigma$ with polynomial link dimensions and

$ lr(bar.v.double sigma - \| Omega chevron.r chevron.l Omega \| bar.v.double)_1 lt.eq C L^(- 5) . quad "(8.3)" $ <eq:compressed-density>

The network has only boundedly many links per party, between parties participating in the same local change. The sampling need not make $sigma$ positive or Hermitian.

=== 8.2 Extracting one ket column <extracting-one-ket-column>

#thm([Lemma 8.1.])[
  #emph[Let $Omega$ be a unit vector on a tensor product of finite-dimensional spaces. If an operator $sigma$ satisfies $lr(bar.v.double sigma - \| Omega chevron.r chevron.l Omega \| bar.v.double)_1 lt.eq eta < 1$, then some product-basis column $v = sigma \| z chevron.r$ is nonzero and satisfies 
$ min_theta ∥frac(v, lr(bar.v.double  bar.v.double) v) - e^(i theta) Omega∥ lt.eq 2 eta . $

 Fixing this column in an operator tensor network leaves all its virtual dimensions unchanged.]
] <lem:columns>

#proof[
  Put $E = sigma - \| Omega chevron.r chevron.l Omega \|$ and $a_z = chevron.l Omega \| z chevron.r$. Then
  $ sum_z lr(bar.v.double E \| z chevron.r bar.v.double)^2 = lr(bar.v.double  bar.v.double) E_2^2 lt.eq eta^2 \, #h(2em) sum_z \| a_z \|^2 = 1 . $
  Thus at least one $z$ with $a_z eq.not 0$ obeys $lr(bar.v.double E \| z chevron.r bar.v.double) lt.eq eta \| a_z \|$. For this $z$, $w = v \/ a_z$ satisfies $lr(bar.v.double w - Omega bar.v.double) lt.eq eta$, so $w eq.not 0$ and $\| lr(bar.v.double  bar.v.double) w - 1 \| lt.eq eta$. It follows that $lr(bar.v.double w \/ lr(bar.v.double  bar.v.double) w - Omega bar.v.double) lt.eq 2 eta$. Fixing the input basis index separately in each physical tensor selects the same column without altering a virtual leg. No lower bound on $\| a_z \|$ and no positivity assumption on $sigma$ are used. ◻
]

For sufficiently large $L$, the bound $C L^(- 5)$ is less than one, so Lemma 20 applies to (8.3). We obtain a nonzero ket network on the party graph with normalized error at most $C L^(- 5)$. It remains to realize that graph on the prescribed grid.

=== 8.3 Constant congestion on dyadic anchors <constant-congestion-on-dyadic-anchors>

Let $N$ be the least power of two with $N gt.eq L$, so $N < 2 L$. Shift genuine lattice coordinates to ${ 0 \, dots.h \, L - 1 }^2$ and work first on the padded grid ${ 0 \, dots.h \, N - 1 }^2$. A dyadic block of side $n = 2^j$ with block indices $\( r \, s \)$ has anchor

$ a_(j \, r \, s) = cases(delim: "{", \( 2^j r + 2^(j - 1) \, thin 2^j s + 2^(j - 1) \) \, & j gt.eq 1 \,, \( r \, s \) \, & j = 0 .) quad "(8.4)" $ <eq:anchors>

Temporary parties use the anchor of their creating block; only boundedly many are attached to any block. All anchors lie on the padded grid.

The scale-separated network-to-PEPS embedding has a precedent in Barthel–Kliesch–Eisert #cite(label("BarthelKlieschEisert2010")) Section III.C, Eqs. (7)–(12). The proof below gives the routing for the present bounded-lifetime network with polynomial link dimensions and treats finite-square boundary folding explicitly.

#thm([Lemma 8.2.])[
  #emph[The links of the party network can be routed on the padded grid with constant edge congestion. After reflection into the genuine $L times L$ grid, congestion is still constant and physical output coordinates are unchanged.]
] <lem:routing>

#proof[
  Orient each link arbitrarily. Route it horizontally from the first anchor, then vertically to the second. Proposition 18 ensures that the endpoint scales are equal or adjacent and their separation is at most a fixed multiple of either scale.
  A horizontal segment whose first endpoint has scale $2^j$, $j gt.eq 1$, lies on row $y = 2^(j - 1) \( 2 s + 1 \)$. The exact two-adic valuation of $y$ is $j - 1$; in particular such a row is nonzero and determines a unique nonunit scale. For a fixed horizontal edge on that row, only boundedly many anchors of that scale can be within the allowed horizontal travel distance, since successive anchors are $2^j$ apart. Each anchor carries boundedly many parties of bounded degree. This gives a constant horizontal congestion. Scale $j = 0$ adds a separate constant, because its links have bounded length. For vertical segments the same argument uses the column of the second endpoint and its scale. Crossings are permitted: a grid-vertex tensor carries all crossing virtual indices independently.
  Define on padded coordinates
  $ f \( x \) = cases(delim: "{", x \, & 0 lt.eq x lt.eq L - 1 \,, 2 \( L - 1 \) - x \, & L lt.eq x lt.eq N - 1 .) $
  Because $N < 2 L$, its values lie in ${ 0 \, dots.h \, L - 1 }$. Adjacent coordinates map to adjacent coordinates. Every coordinate and every one-dimensional edge has at most two preimages. Hence each horizontal or vertical edge of the physical square has at most four padded edge preimages, counting repeated traversals of folded paths. The congestion increases by at most four. The map fixes genuine output coordinates. Zero-length links and coincident party tensors are contracted locally. ◻
]

Each continued path carries an identity tensor on its virtual index. At a crossing, take the product of the continuing index factors and any party tensors located there. Group all indices traversing a grid edge into a tensor-product index. If each original link has dimension at most $C_1 L^r$ and congestion is at most $chi$, the new edge dimensions are at most

$ \( C_1 L^r \)^chi . quad "(8.5)" $ <eq:final-bond>

The single tensor at a genuine vertex, including its physical output, is exactly an arbitrary map of the PEPS convention in Theorem 1. Vertices without additional operations contribute the requisite identity factors. Thus the ket network is a PEPS on the same physical square.

=== 8.4 Order of constants and small sizes <order-of-constants-and-small-sizes>

For completeness, the following order makes every uniformity assertion explicit. Fix $q \, J \, Delta$, the numerical error powers, and the exponents used by the rectangular recursion. The finite band templates determine their conical clearances. Choose the large point-treatment factor, then the small hole fraction and the finite patch mesh. Choose a residual clearance $a > 0$, and then choose $D$ from Proposition 7 at information power $60$. The largest patch scale constant $B_0$ is selected afterwards to cover all patches of scale at most a fixed multiple of $D log L$.

Proposition 8 then determines a fixed rank exponent. Only boundedly many such cylinder expansions occur in a change, so their total branch count is polynomial. Choose the singular-subspace dimensions in Lemma 14 next, to obtain operator error $L^(- 25)$. Choose the effect-inventory stack lengths from the #emph[original] weighted expansion error in Lemma 9; only afterwards expand the permutation averages. Finally choose the Gaussian sample count in Theorem 10. None of these algebraic choices changes an earlier geometric support or clearance. The resulting $C_1 \, r$ and the congestion $chi$ in (8.5) depend only on the fixed parameters and templates.

Increase a fixed threshold $L_0$ so that every preceding asymptotic inequality holds and the error $C L^(- 5)$ is at most $L^(- 1)$ for $L gt.eq L_0$. For the finitely many smaller sizes, every vector has an exact PEPS on a spanning tree of the square grid. One explicit construction uses a common index for the $q^(L^2)$ product-basis configurations on all tree edges, equality tensors at tree vertices that also output the local basis state of that common configuration, and puts each expansion coefficient at one chosen root. Non-tree edges have dimension one. This bond bound is finite and independent of the Hamiltonian at each fixed $L$. Enlarging the single prefactor $C$ handles all $2 lt.eq L < L_0$. Equation (8.5) and Lemma 20 now prove Theorem 1 for every $L$.

== 9 Exact interfaces with the area-law companion <app:companion>

The companion #cite(label("RepoAreaLaw")), #emph[A two-dimensional area law from a global spectral gap], is used on the original ground state $Omega$. This appendix records the hypotheses and the division of work between the two articles. A subregion is always a subsystem of that state; it is never assigned a new gap assumption.

===== 9.1 Hamiltonians, metrics, and entropy. <hamiltonians-metrics-and-entropy.>

The companion permits any finite induced domain $Gamma subset bb(Z)^2$ with local dimension $q$ and one Hermitian term $h_X$ of norm at most $J$ for each nonempty support of induced-graph diameter at most a fixed $R$. It assumes a unique unit ground vector and $H - E_0 I gt.eq Delta \( I - \| Omega chevron.r chevron.l Omega \| \)$. Constants depend on $q \, R \, J \, Delta$ and explicitly fixed auxiliary parameters, uniformly in the domain and Hamiltonian. All entropy logarithms are natural. Its Theorem 1.1 and Corollary 1.2 give the area inequality stated in Proposition 2. Here $Gamma = Lambda_L$ and $R = 1$, exactly covering (1.1).

===== 9.2 Positive replacement. <positive-replacement.>

The Proposition “Positive replacement of the Hamiltonian” in #cite(label("RepoAreaLaw")) Section 4 gives, for every fixed integer $k gt.eq 1$ and $alpha = k \/ \( k + 1 \)$, positive contractions $k_i$ at the original interaction anchors, of uniformly bounded anchor multiplicity, satisfying

$ k_i Omega = 0 \, #h(2em) sum_i k_i gt.eq c_(*)^(- 1) \( H - E_0 I \) gt.eq \( Delta \/ c_(*) \) \( I - \| Omega chevron.r chevron.l Omega \| \) \, #h(2em) parallel k_i - bb(E)_(N_r \( a_i \)) k_i parallel lt.eq C e^(- c r^alpha) . $

Here $bb(E)_(N_r \( a_i \))$ is conditional expectation onto the induced-graph ball, for every integer $r gt.eq 0$; $c_(*) \, C \, c$ may depend on $k$ and the fixed physical parameters. This input underlies the companion amplification. It does not replace the original Hamiltonian by a finite-range frustration-free Hamiltonian.

===== 9.3 Templates, collars, and amplification. <templates-collars-and-amplification.>

Definition “A template” and Proposition “A sublinear collar bound” in #cite(label("RepoAreaLaw")) Section 9 use a cut $A subset.eq Gamma$, its crossing-edge endpoints $Z_A$, and a nonempty ambient lattice set

$ T = union.big_(a = 1)^(N_0) \( P_a ∩ bb(Z)^2 \) \, #h(2em) n gt.eq C_(upright("tpl")) N_0 \( s_0 + 1 \) \, quad "diam"_oo T lt.eq n \, quad "dist"_oo \( T \, Z_A \) > 4 D_0 s_0 . $

The $P_a$ are closed convex rectangles or triangles of sup diameter at most $s_0$, with side slopes $0 \, oo \, 1 \, - 1$; $n \, s_0$ are positive integers and $s_0 gt.eq 1$. With $epsilon.alt = 10^(- 5)$, set $ell = floor.l n^(1 - epsilon.alt) floor.r lt.eq s_0$, $T_ell = T + \[ - ell \, ell \]_(bb(Z))^2$, $X = A ∩ T$, $S_0 = A ∩ T_ell$, and $Y = S_0 \\ X$. At all sufficiently large scales the input guarantees

$ I_Omega \( X : Gamma \\ S_0 \) lt.eq C n^(1 - epsilon.alt) \, #h(2em) \| S_0 \| lt.eq C n^2 \, #h(2em) \| partial_Gamma X \| \, \| partial_Gamma Y \| \, \| partial_Gamma S_0 \| lt.eq C n . $

The Proposition “Amplification” in #cite(label("RepoAreaLaw")) Section 10 requires these three bounds with any fixed common constant $C_0$ and $alpha = k \/ \( k + 1 \) > 1 - 10^(- 6)$. Put $beta_0 = 1 - 2 dot.op 10^(- 6)$. For every fixed integer $M gt.eq 1$ it supplies a radius

$ r lt.eq C_M n^(\( 1 - epsilon.alt \) \/ alpha) \, #h(2em) ell + 2 r = o \( n^(beta_0) \) \, #h(2em) I_Omega \( X' : E \) lt.eq C_M n^(- M) $

simultaneously for every $X' subset.eq X$ and $E subset.eq Gamma \\ N_(2 r) \( S_0 \)$. The radius and constants are independent of the remote set and total volume. If also $"dist"_oo \( T \, Z_A \) > ell + n^(beta_0)$, then $N_(2 r) \( S_0 \) subset.eq A$. In Proposition 4 we take $A = Lambda$, so $Z_A = diameter$, choose $s_0 \, n$ comparable to the target scale with fixed ratios, and use $M = 1$. A graph neighborhood lies in the corresponding ambient enlargement; this is the precise conversion used to obtain the ambient-separation statement.

===== 9.4 The two-family interface and its adaptation. <the-two-family-interface-and-its-adaptation.>

The Lemma “Two-family entropy cancellation” in #cite(label("RepoAreaLaw")) Section 11 states that, for a pure state and a partition $A = D dot(union) union.big_i X_i$ into two ordered families, bounds

$ I (X_i : A^c union union.big_(j < i \, thin f_j = f_i) X_j) lt.eq delta_i quad \( f_i in { 0 \, 1 } \) quad arrow.r.double quad S \( A \) lt.eq S \( D \) + 1 / 2 sum_i delta_i . $

Its Proposition “Two families with separated birth templates” constructs such regions for every cut with $b = \| partial_Gamma A \| > 0$ and any fixed lower scale $n_(*)$. It gives $\| D \| lt.eq C b$, $X_i subset.eq A ∩ T_i$, admissible separated templates with $n_i gt.eq n_(*)$ and $floor.l n_i^(1 - epsilon.alt) floor.r lt.eq s_i$, and

$ "dist"_oo \( T_i \, Z_A \) > 2 n_i^(beta_0) \, #h(2em) "dist"_oo (T_i \, union.big_(j < i \, thin f_j = f_i) X_j) > 2 n_i^(beta_0) \, #h(2em) sum_i n_i^(- 100) lt.eq C b . $

The constant may depend on $n_(*)$ and the template constants but not on the cut or domain. These statements are used within the companion’s area-law proof. Lemma 5 adapts their ordering principle to a cell with arbitrary exterior conditioning and proves that local variant in full. In particular, we do not infer a conditional-information bound merely by conditioning an ordinary mutual-information inequality.

The companion’s replica limit is taken at each fixed finite physical instance and schedule, before the geometric scale tends to infinity. Its exported bounds concern the original one-copy state with the uniform constants above. The later tapering construction, adaptive patch constraints, density compression, encoded protocol, and routing are proved in this article.


#bibliography("refs.bib", style: "ieee", title: [References])
