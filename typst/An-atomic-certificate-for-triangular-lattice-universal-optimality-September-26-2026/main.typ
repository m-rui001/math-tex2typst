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

#align(center)[#text(size: 16pt, weight: "bold")[An atomic certificate for triangular-lattice universal optimality]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

Universal optimality asks for one configuration that minimizes energy for an entire family of repulsive
  interactions. For the triangular lattice, the difficulty is not only to compare different lattices.
  A competing planar set may have no periods, arbitrarily close pairs,
  and arbitrarily large counts in small translated disks. We begin by isolating a Fourier comparison that uses
  only the asymptotic number of points in centered disks, and then construct functions that make this comparison sharp.

Put $b = sqrt(3) \/ 2$ and let

$ A = b^(- 1 \/ 2) { m \( 1 \, 0 \) + n \( 1 \/ 2 \, b \) : m \, n in bb(Z) } $

be the triangular lattice of covolume one. Write $B_R$ for the closed disk of radius $R$ centered at the origin.
  A locally finite set $cal(C) subset bb(R)^2$ has #emph[centered disk density one] if $N_R \/ \( pi R^2 \)
  arrow.r 1$, where $N_R = \# \( cal(C) ∩ B_R \)$. A smooth function $g : \( 0 \, oo \)
  arrow.r \[ 0 \, oo \)$ is #emph[completely monotone] if

$ \( - 1 \)^j g^(\( j \)) \( t \) gt.eq 0 wide \( j = 0 \, 1 \, 2 \, dots.h \, med t > 0 \) . $

For such a function, define its lower energy per particle by

$ E_g \( cal(C) \) = liminf_(R arrow.r oo) 1 / N_R sum_(x \, y in cal(C) ∩ B_R\
x eq.not y) g \( \| x - y \|^2 \) . $

The sum counts ordered pairs. Density one makes $N_R > 0$ for all sufficiently large $R$.
  Each finite-disk sum is finite, although the lower energy and the lattice series below may be infinite.

#thm([Theorem 1.1.])[
  (Universal energy minimum).  #emph[For every smooth nonnegative completely monotone function $g$ on
    $\( 0 \, oo \)$ and every locally finite planar set $cal(C)$ of centered disk density one,
$ E_g \( cal(C) \) gt.eq sum_(a in A \\ { 0 }) g \( \| a \|^2 \) = E_g \( A \) . $

 The comparison and the equality are in the extended nonnegative reals.]
] <thm:universal>

For example, the theorem applies to $g \( t \) = t^(- p)$ for every $p > 0$,
  including the parameters for which the lattice series diverges.
  A singularity of $g$ at zero causes no ambiguity in a finite sum, because only distinct points occur.
  The conclusion identifies the minimum; it does not classify the minimizing configurations.

Our Fourier convention is

$ hat(f) \( xi \) = integral_(bb(R)^2) f \( x \) e^(- 2 pi i x dot.op xi) thin d x \, $

and the dual lattice is $A^(*) = { xi in bb(R)^2 : xi dot.op a in bb(Z) upright(" for every ") a in A }$.
  Write $k_alpha \( x \) = e^(- pi alpha \| x \|^2)$ for $alpha > 0$.
  The analytic statement that supplies the energy comparison concerns each Gaussian separately.

#thm([Theorem 1.2.])[
  (Sharp Gaussian minorants).  #emph[For every $alpha > 0$ there is a real radial Schwartz function $f_alpha :
    bb(R)^2 arrow.r bb(R)$ such that
$ f_alpha \( x \) lt.eq k_alpha \( x \) \, wide hat(f)_alpha \( xi \) gt.eq 0 quad \( x \, xi in bb(R)^2 \) \, $

 and
$ f_alpha \( a \) = k_alpha \( a \) quad \( a in A \\ { 0 } \) \, wide hat(f)_alpha \( w \) =
  0 quad \( w in A^(*) \\ { 0 } \) . $

 For $alpha gt.eq 1$, the construction uses two finite $20$-by-$20$ interpolation blocks and an absolutely
   summable infinite correction.]
] <thm:gaussian>

The two theorems have different content. The functions $f_alpha$ give sharp analytic certificates for individual
  Gaussians. Positive mixtures of the resulting #emph[energy inequalities],
  rather than mixtures of the auxiliary functions, give Theorem 1.
  Taking the $alpha gt.eq 1$ construction as input, Section 2 proves the reciprocal-parameter extension and the
  complete energy deduction. The later construction and sign sections establish that input within this paper,
  thereby completing both theorems.

=== 1.1 Historical context <historical-context>

Classical work on the lattice-restricted problem proceeds through the binary Epstein zeta function.
  Rankin and Cassels studied its minimization, with corrections and refinements by Ennola and Diananda
  #cite(label("Rankin1953")) #cite(label("Cassels1959")) #cite(label("Cassels1963Corrigendum"))
  #cite(label("Ennola1964Lemma")) #cite(label("Diananda1964")).
  This line of work establishes the triangular minimum for convergent inverse-power lattice sums.
  Montgomery’s theta theorem gives the Gaussian minimum among planar lattices of fixed covolume for every positive
  parameter #cite(label("Montgomery1988")) Theorem 1. These lattice results do not by themselves compare the
  triangular lattice with a nonperiodic set.

The Fourier bounds of Cohn and Elkies for sphere packing #cite(label("CohnElkies2003")) provided a framework in
  which pointwise inequalities for a function and its transform control a geometric optimization problem.
  Cohn and Kumar developed the corresponding energy bounds and formulated the Euclidean universal-optimality
  program #cite(label("CohnKumar2007")) Proposition 9.3 and Conjecture 9.4.
  In dimensions eight and twenty-four, Cohn, Kumar, Miller, Radchenko,
  and Viazovska proved the $E_8$ and Leech lattice cases using sharp Gaussian auxiliaries and simultaneous Fourier
  interpolation formulas #cite(label("CKMRV2022")) Theorems 1.4, 1.7, and 1.9.

Other planar comparisons retain restrictions on the competitors or the allowed perturbations.
  Faulhuber, Shafkulovska, and Zlotnikov compare the triangular lattice with the honeycomb and further periodic
  classes #cite(label("FaulhuberShafkulovskaZlotnikov2023")) Theorems 1.1–1.2 and Corollary 1.3.
  Hardin and Tenpas treat four-point and six-point configurations on a fixed triangular torus and a fixed
  rectangular torus, respectively, with the extension from periodized Gaussians to completely monotone
  interactions subject to their rapid-decay hypothesis #cite(label("HardinTenpas2025")) Theorem 1.
  For interactions of finite triangular-lattice energy, Leblé proves local optimality under sufficiently small
  bounded displacements, including nonperiodic displacements,
  with the allowed size depending on the interaction #cite(label("Leble2025")) Theorems 1–2 and Remark 1.1.
  Theorem 1 imposes no assumption that the competitor is a bounded perturbation of a lattice.

A separate companion develops a modulo-$12$ interpolation construction for the same energy endpoint
  #cite(label("UniversalTriangular2026")). Its finite part uses $168$ positive-node coordinates in each block,
  frequency quadrature, and Gaussian-parameter intervals #cite(label("UniversalTriangular2026")) Section 3,
  especially Proposition 3.3. The construction here uses modulo-$36$ nodes and twenty positive-node coordinates in
  each block. The undamped finite columns are trigonometric polynomials in squared radius,
  so their spectral measures are finite sums of atoms, and one containing polytope controls the Gaussian data.
  The auxiliary statements of the two methods are not identical, even though their energy consequences agree.
  The smaller finite system does not enlarge the competitor class,
  and it does not eliminate the infinite correction or the estimates between nodes.

The interpolation mechanism has several precedents. Cardinal formulas built from squared sine or cosine factors
  and value-and-derivative data occur in Cohn and Kumar’s one-dimensional energy bound
  #cite(label("CohnKumar2007")) Proposition 9.6 and in the Gaussian extremal approximations of Carneiro, Littmann,
  and Vaaler #cite(label("CarneiroLittmannVaaler2013")) formulas (1.2)–(1.3).
  Radchenko and Viazovska developed simultaneous interpolation of an even real Schwartz function and its Fourier
  transform on the line #cite(label("RadchenkoViazovska2019")) Theorem 1.
  Sardari’s planar construction uses periodic supersets of triangular quadratic-form values and shows that the
  values and first radial derivatives of a function and its Fourier transform at the triangular shells do not
  determine the function uniquely in the full radial Schwartz class #cite(label("Sardari2021")) Section 6.1 and
  Theorem 1.7. The uniqueness established below is only for the specified summable coefficient problem.
  The sharp packing companion develops Gaussian cardinal functions, Fourier kernels,
  finite-block and infinite-tail inversion, and Bernstein sign certification that we adapt here
  #cite(label("SharpPlanar2026")) Sections 2–4. All parameter-dependent identities and estimates required for the
  present Gaussian functions are proved in this paper.

For the transfer to general configurations, Cohn and de Courcy-Ireland broaden the competitor class beyond
  periodic configurations to the present density-based class, using a real continuous, positive-definite,
  integrable auxiliary satisfying their minorant condition #cite(label("CohnDeCourcyIreland2018"))
  Proposition 2.2; see also #cite(label("CKMRV2022")) Proposition 1.6.
  We prove the Schwartz case needed here locally, using a Fourier cutoff near zero.
  The reciprocal-parameter construction is the Gaussian instance of the unnumbered duality calculation immediately
  following Conjecture 6.1 in #cite(label("CohnMiller2016")) Section 6.
  We also prove locally the Bernstein–Widder positive Laplace representation used to mix the Gaussian kernels
  #cite(label("Bernstein1929")) #cite(label("Widder1931")).
  Cohn–Kumar Conjecture 9.4 asks in addition for an auxiliary satisfying their Proposition 9.3 and proving
  sharpness for each sufficiently decaying completely monotone potential;
  it does not require that auxiliary to be Schwartz. Mixing the Gaussian energy inequalities does not by itself
  construct such an auxiliary for a general potential; the results here are the universal energy comparison and
  the sharp Gaussian functions.

=== 1.2 Proof overview <proof-overview>

Section 2 first explains why the Gaussian functions have exactly the properties needed for energy.
  For $cal(C)_R = cal(C) ∩ B_R$, define $M_R \( xi \) = sum_(x in cal(C)_R) e^(2 pi i x dot.op xi)$.
  Fourier inversion gives the finite identity

$ sum_(x \, y in cal(C)_R) f_alpha \( x - y \) = integral_(bb(R)^2) hat(f)_alpha \( xi \) \| M_R \( xi \) \|^2
  thin d xi . $

A smooth cutoff of the disk and the density assumption show that, for every fixed $epsilon > 0$,

$ liminf_(R arrow.r oo) 1 / N_R integral_(\| xi \| lt.eq epsilon) \| M_R \( xi \) \|^2 thin d xi gt.eq 1 . $

Nonnegativity and continuity of $hat(f)_alpha$ therefore give the off-diagonal lower bound $hat(f)_alpha \( 0 \) -
  f_alpha \( 0 \)$, after removing the $N_R$ diagonal terms. This step uses no count in a translated smaller disk.

The contact conditions identify that lower bound. The dual lattice is a quarter turn of $A$,
  and Poisson summation with unit covolume gives

$ hat(f)_alpha \( 0 \) - f_alpha \( 0 \) = sum_(a in A \\ { 0 }) k_alpha \( a \) . $

The same duality turns a minorant for $k_(1 \/ alpha)$ into one for $k_alpha$ when $0 < alpha < 1$,
  so only the construction for $alpha gt.eq 1$ remains. Finally a positive Laplace representation expresses $g$ as
  a mixture of Gaussian kernels. Fatou’s lemma is applied to their nonnegative energy sums along an arbitrary
  sequence of radii; this permits both an atom at the constant kernel and infinite total representing mass.
  These arguments prove the energy theorem from the later local construction,
  without requiring a sharp auxiliary for the mixed potential.

For $alpha gt.eq 1$, Section 3 works in the scalar coordinate $s = b \| x \|^2$.
  The interpolation nodes are the positive integers whose residues modulo $36$ are represented by $m^2 + m n +
  n^2$ for integers $m \, n$; they contain every coordinate $b \| a \|^2$ for $a in A \\ {
  0 }$ and may include additional nodes. A product of squared sine factors, one for each residue,
  has a double zero at every node. Multiplying it by suitable double- and simple-pole factors produces columns
  that prescribe a value and a derivative. Periodic pole columns handle ten positive nodes,
  together with fixed data at zero; rational columns with one pole location handle the remaining positive nodes.

The periodic columns use stronger Gaussian damping. Before damping they are trigonometric polynomials,
  so their spectral measures consist of finitely many atoms.
  They also contribute value-and-derivative data at later nodes in their residue classes modulo $36$;
  the stronger damping makes these repeated contributions summably small.
  The rational columns have absolutely continuous spectral measures with total variation bounded uniformly in
  their node. These representations prove that arbitrary absolutely summable tail coefficients give radial
  Schwartz functions, with all needed differentiations justified.
  Two real input functions $U_1 \, U_2$ are formed from the damped columns,
  together with opposite fixed multiples of the damped sine product. Define

$ F_1 = U_1 + hat(U)_2 \, wide F_2 = U_2 + hat(U)_1 . $

Fourier inversion and radiality give $hat(F)_1 = F_2$.

Section 4 constructs a finite approximation to the simultaneous value-and-slope equations.
  There are twenty unknown coordinates on each side; taking sums and differences separates the forty coupled
  coordinates into two blocks of order twenty. A single containing polytope encloses the Gaussian data.
  Outward-rational interval arithmetic certifies the fixed inverse bounds and coefficient bounds on that polytope.
  For the polynomial inequalities, every Bernstein coefficient is bounded on the whole polytope,
  with no mesh of parameter or spatial values. Appendix 7 gives the exact evaluation recipes and proves that their
  interval arithmetic encloses the required quantities.

Section 5 then proves uniform bounds for the maps between the finite lists and the full unweighted $ell^1$ tail
  space. These analytic bounds include the repeated jets of the periodic columns.
  Together with the finite inverse bounds, they permit a Schur elimination and a Neumann series on the full tail
  space. The resulting functions satisfy the interpolation equations #emph[exactly] at every node,
  including those beyond the finite block. The same argument bounds their difference from the finite
  approximation. Thus finite arithmetic supplies quantitative inputs,
  while the full-space argument supplies the exact infinite interpolation.

Section 6 proves the remaining pointwise inequalities on the entire half-line.
  Near a node, subtract the exact value and linear term before dividing by the squared displacement.
  The finite polynomial tests, correction bounds, and Gaussian comparison then control the exact functions on
  whole half-cells; a separate cubic argument handles the first right half-cell.
  Farther out, signed sine-product terms dominate the remaining curvature on every gap.
  Positive normalization gives the $alpha gt.eq 1$ minorant and closes the input to the energy reduction.

== 2 Energy from Gaussian minorants <energy:section>

We first isolate what the Gaussian construction must accomplish.
  Assuming the half-range statement (1) below, this section extends it to every positive Gaussian parameter and
  derives Theorem 1. Sections 3–6 will then establish the assumed statement.
  This order separates the configuration-level argument from the interpolation certificate.

The competitor needs only a centered disk density; no estimate on the number of points in a smaller translated
  disk will be used. The corresponding density-only linear programming statement is
  #cite(label("CohnDeCourcyIreland2018")) Definition 1.1 and Proposition 2.2.
  We give the needed Schwartz-function case by concentrating a Fourier test near zero.

For every $alpha gt.eq 1$, the construction will supply a real radial Schwartz function $f_alpha$ such that

#[#set math.equation(numbering: n => "(1)")
 $ f_alpha lt.eq k_alpha \, wide hat(f)_alpha gt.eq 0 \,\
f_alpha \( a \) = k_alpha \( a \) quad \( a in A \\ { 0 } \) \, wide hat(f)_alpha \( w \) =
  0 quad \( w in A^(*) \\ { 0 } \) . $ <energy:input>]

We first extend this statement to all positive Gaussian parameters and identify the exact lower bound it supplies.

=== 2.1 Duality and the lattice normalization <duality-and-the-lattice-normalization>

The following lattice calculation is independent of the input (1).
  Let $M$ have columns $b^(- 1 \/ 2) \( 1 \, 0 \)$ and $b^(- 1 \/ 2) \( 1 \/ 2 \, b \)$, so that $A =
  M bb(Z)^2$ and $det M = 1$. If $J = mat(delim: "(", 0, - 1; 1, 0)$,
  the two-dimensional identity $M^(- sans(T)) = J M J^(- 1)$ gives

$ A^(*) = M^(- sans(T)) bb(Z)^2 = J A \, $

because $J^(- 1) bb(Z)^2 = bb(Z)^2$. Thus $A$ and $A^(*)$ have identical sets of radii,
  and the covolume in Poisson summation is exactly one.

#thm([Lemma 2.1.])[
  (Reciprocal Gaussian parameters).  #emph[If (1) holds for every $alpha gt.eq 1$, it holds for every $alpha > 0$.
    For each of these functions,
#[#set math.equation(numbering: n => "(2)")
 $ hat(f)_alpha \( 0 \) - f_alpha \( 0 \) = sum_(a in A \\ { 0 }) e^(- pi alpha \| a \|^2) . $ <energy:poisson>]

]
] <energy:reciprocal>

#proof[
  The Fourier complement follows the unnumbered duality calculation after Conjecture 6.1 in
    #cite(label("CohnMiller2016")) Section 6, p. 19. For $0 < alpha < 1$, set $beta = 1 \/ alpha$ and define
  $ f_alpha = k_alpha - alpha^(- 1) hat(f)_beta . $
  The planar Gaussian transform is $hat(k)_alpha = alpha^(- 1) k_(1 \/ alpha)$;
    the real case of the Gaussian integral proved in (15) gives this formula in our Fourier convention.
    Fourier inversion reflects the argument, and $f_beta$ is even; hence
  $ k_alpha - f_alpha = alpha^(- 1) hat(f)_beta gt.eq 0 \, wide hat(f)_alpha =
    alpha^(- 1) \( k_beta - f_beta \) gt.eq 0 . $
  Both functions remain real radial Schwartz functions. Radiality and $A^(*) = J A$ imply $hat(f)_beta \( a \) =
    0$ for $a in A \\ { 0 }$ and $f_beta \( w \) = k_beta \( w \)$ for $w in A^(*) \\ { 0 }$.
    These are exactly the two equalities required for $f_alpha$.
  For completeness, periodize $f_alpha$ over $A$. Schwartz decay makes $sum_(a in A)
    f_alpha \( x + a \)$ converge uniformly on compact sets with every derivative.
    Its Fourier coefficient at $w in A^(*)$, obtained by integration over a unit-area fundamental cell,
    is $hat(f)_alpha \( w \)$. These coefficients are absolutely summable, again by Schwartz decay.
    Evaluation of the Fourier series at zero gives
  $ sum_(a in A) f_alpha \( a \) = sum_(w in A^(*)) hat(f)_alpha \( w \) . $
  Substitute the two interpolation conditions in (1) and isolate the terms at zero to obtain (2). ◻
]

=== 2.2 A Fourier comparison using only centered density <a-fourier-comparison-using-only-centered-density>

Let $cal(C) subset bb(R)^2$ be locally finite, put $cal(C)_R = cal(C) ∩ B_R$ and $N_R = \# cal(C)_R$,
  and assume $N_R \/ \( pi R^2 \) arrow.r 1$. In particular, $N_R > 0$ for all sufficiently large $R$.

#thm([Lemma 2.2.])[
  (Fourier mass near zero).  #emph[For every fixed $epsilon > 0$, the exponential sum $M_R \( xi \) =
    sum_(x in cal(C)_R) e^(2 pi i x dot.op xi)$ satisfies
#[#set math.equation(numbering: n => "(3)")
 $ liminf_(R arrow.r oo) 1 / N_R integral_(\| xi \| lt.eq epsilon) \| M_R \( xi \) \|^2 thin d xi gt.eq
   1 . $ <energy:fourier-mass>]

]
] <energy:low-frequency>

#proof[
  Fix $d > 0$ and choose a smooth compactly supported function $phi.alt$ with $0 lt.eq phi.alt lt.eq 1$,
    equal to one on $B_1$, and supported in $B_(1 + d)$. Fourier inversion gives
  $ integral_(bb(R)^2) M_R \( xi \) R^2 hat(phi.alt) \( R xi \) thin d xi =
    sum_(x in cal(C)_R) phi.alt \( x \/ R \) = N_R . $
  The integral is absolutely convergent, since the sum is finite and $hat(phi.alt)$ is Schwartz.
    The elementary bound $\| M_R \| lt.eq N_R$ shows that the integral omitted on restricting to $\| xi \| lt.eq
    epsilon$ has modulus at most
  $ N_R integral_(\| u \| > epsilon R) \| hat(phi.alt) \( u \) \| thin d u = N_R delta_R \, wide delta_R arrow.r 0 . $
  Cauchy–Schwarz and Plancherel therefore give, for all sufficiently large $R$,
  $ N_R^2 \( 1 - delta_R \)^2 & lt.eq (integral_(\| xi \| lt.eq epsilon) \| M_R \( xi \) \|^2 thin d xi)
    (integral_(bb(R)^2) \| R^2 hat(phi.alt) \( R xi \) \|^2 thin d xi)\
 & = R^2 parallel phi.alt parallel_2^2 integral_(\| xi \| lt.eq epsilon) \| M_R \( xi \) \|^2 thin d xi . $
  Since $parallel phi.alt parallel_2^2 lt.eq pi \( 1 + d \)^2$,
    division by $N_R$ and passage to the lower limit yield the lower bound $\( 1 + d \)^(- 2)$. Let $d arrow.b 0$.
    This argument uses only the number $N_R$ and the fact that every point being summed lies in $B_R$. ◻
]

#thm([Proposition 2.3.])[
  (Density-only linear programming).  #emph[Let $f$ be a real even Schwartz function on $bb(R)^2$ with $hat(f)
    gt.eq 0$, and let $cal(C)$ be locally finite with $N_R \/ \( pi R^2 \) arrow.r 1$. Then
#[#set math.equation(numbering: n => "(4)")
 $ liminf_(R arrow.r oo) 1 / N_R sum_(x \, y in cal(C)_R\
x eq.not y) f \( x - y \) gt.eq hat(f) \( 0 \) - f \( 0 \) . $ <energy:lp-bound>]

 The same lower bound holds if the summands are replaced by $Phi \( x - y \)$, where $Phi \( z \) gt.eq
   f \( z \)$ for every $z eq.not 0$.]
] <energy:lp>

#proof[
  Fourier inversion and the finiteness of $cal(C)_R$ give the exact identity
  $ sum_(x \, y in cal(C)_R) f \( x - y \) = integral_(bb(R)^2) hat(f) \( xi \) \| M_R \( xi \) \|^2 thin d xi . $
  Write $a = hat(f) \( 0 \) gt.eq 0$. If $a = 0$, the right side is already nonnegative.
    If $a > 0$, fix $0 < delta < a$ and choose $epsilon > 0$ so that $hat(f) \( xi \) gt.eq a -
    delta$ whenever $\| xi \| lt.eq epsilon$. Nonnegativity on the complement and Lemma 4 imply that the lower
    limit of the displayed expression divided by $N_R$ is at least $a - delta$.
    Letting $delta arrow.b 0$ proves the diagonal-included bound $a$.
    There are exactly $N_R$ diagonal terms, each equal to $f \( 0 \)$.
    Their removal proves (4); the assertion for $Phi$ follows by termwise comparison of finite sums. ◻
]

Under the input (1), Lemma 3 and Proposition 5 give

#[#set math.equation(numbering: n => "(5)")
 $ liminf_(R arrow.r oo) 1 / N_R sum_(x \, y in cal(C)_R\
x eq.not y) e^(- pi alpha \| x - y \|^2) gt.eq sum_(a in A \\ { 0 }) e^(- pi alpha \| a \|^2)
  wide \( alpha > 0 \) . $ <energy:gaussian>]

Only nonnegative kernels will be mixed in the remaining argument;
  there is no need to integrate the auxiliary functions themselves.

=== 2.3 Positive mixtures without a boundedness assumption at zero <positive-mixtures-without-a-boundedness-assumption-at-zero>

The next lemma is the classical Bernstein representation of completely monotone functions;
  see #cite(label("Widder1931")) Theorem 8. For a related construction using Taylor coefficients and step
  functions, see #cite(label("Dubourdieu1940")) Sections I–II.
  We give the details here on the open half-line for a locally finite measure that may have infinite total mass
  and an atom at zero.

#thm([Lemma 2.4.])[
  (Positive Laplace representation).  #emph[Suppose $g : \( 0 \, oo \)
    arrow.r \[ 0 \, oo \)$ is smooth and $\( - 1 \)^j g^(\( j \)) \( s \) gt.eq 0$ for every integer $j gt.eq
    0$ and every $s > 0$. There is a positive locally finite Borel measure $nu$ on $\[ 0 \, oo \)$ such that
#[#set math.equation(numbering: n => "(6)")
 $ g \( s \) = integral_(\[ 0 \, oo \)) e^(- s t) thin d nu \( t \) wide \( s > 0 \) .
   $ <energy:laplace-representation>]

 The integral is finite for every $s > 0$; the mass $nu \( \[ 0 \, oo \) \)$ need not be finite.]
] <energy:laplace>

#proof[
  Fix $l > 0$ and put $q \( x \) = g \( l - x \)$ for $0 lt.eq x < l$. Every derivative of $q$ is nonnegative.
    Taylor’s theorem gives
  $ q \( x \) = sum_(j = 0)^m b_j \( l \) x^j + R_m \( x \) \, wide b_j \( l \) =
    frac(\( - 1 \)^j g^(\( j \)) \( l \), j !) gt.eq 0 \, $
  where
  $ R_m \( x \) = frac(1, m !) integral_0^x q^(\( m + 1 \)) \( u \) \( x - u \)^m thin d u gt.eq 0 . $
  For $0 < x < y < l$ and $0 lt.eq u lt.eq x$, $\( x - u \) \/ \( y - u \) lt.eq x \/ y$.
    Comparing the nonnegative remainder integrals therefore yields
  $ 0 lt.eq R_m \( x \) lt.eq \( x \/ y \)^m R_m \( y \) lt.eq \( x \/ y \)^m g \( l - y \) . $
  The right side tends to zero. Thus $g \( l - x \) = sum_(j gt.eq 0) b_j \( l \) x^j$ for every $0 lt.eq x < l$.
  For positive integers $l$, define the locally finite positive measure
  $ nu_l = sum_(j gt.eq 0) b_j \( l \) l^j delta_(j \/ l) . $
  The identity just proved, evaluated at $x = l e^(- s \/ l) < l$, gives
  #[#set math.equation(numbering: n => "(7)")
   $ L_l \( s \) := integral e^(- s t) thin d nu_l \( t \) =
     g #scale(x: 120%, y: 120%)[\(] l \( 1 - e^(- s \/ l) \) #scale(x: 120%, y: 120%)[\)] arrow.r
     g \( s \) wide \( s > 0 \) . $ <energy:approximate-transform>]
  For each $T > 0$, $nu_l \( \[ 0 \, T \] \) lt.eq e^T L_l \( 1 \)$ is uniformly bounded in $l$.
    We record explicitly the elementary measure compactness being used.
    Extend the cumulative functions $H_l \( t \) = nu_l \( \[ 0 \, t \] \)$ by zero to $t < 0$.
    A diagonal subsequence makes $H_l \( q \)$ converge to $a \( q \)$ for every rational $q$;
    the values at each fixed rational are bounded. The right-continuous nondecreasing function
  $ H \( t \) = inf_(q > t\
q in bb(Q)) a \( q \) $
  is zero for $t < 0$ and defines a locally finite Stieltjes measure $nu$ supported on $\[ 0 \, oo \)$.
    Rational bracketing gives $H_l \( t \) arrow.r H \( t \)$ at every continuity point of $H$.
    Step approximation on compact intervals, choosing their endpoints at continuity points, then gives
  $ integral psi thin d nu_l arrow.r integral psi thin d nu wide
    #scale(x: 120%, y: 120%)[\(] psi in C_c \( \[ 0 \, oo \) \) #scale(x: 120%, y: 120%)[\)] $
  along this one subsequence. For intervals meeting zero the same argument starts at a negative endpoint;
    it therefore retains any atom at zero.
  It remains to pass from compactly supported tests to Laplace transforms.
    Fix $s > 0$ and put $C_s = sup_l L_l \( s \/ 2 \) < oo$. Compactly supported nonnegative cutoffs and the
    preceding convergence imply $integral e^(- s t \/ 2) thin d nu \( t \) lt.eq C_s$.
    For either $mu = nu_l$ or $mu = nu$ we consequently have
  $ integral_(t > T) e^(- s t) thin d mu \( t \) lt.eq C_s e^(- s T \/ 2) . $
  Apply compact-test convergence to a continuous cutoff of $e^(- s t)$ that equals it on $\[ 0 \, T \]$,
    then let $T arrow.r oo$. It follows that $L_l \( s \) arrow.r
    integral e^(- s t) thin d nu \( t \)$ along the chosen subsequence.
    Combining this with (7) proves (6) for every $s > 0$. The subsequence was chosen independently of $s$. ◻
]

=== 2.4 Lower limits, singular interactions, and attainment <lower-limits-singular-interactions-and-attainment>

We now prove the energy theorem under the single input (1).
  Once Sections 3–6 establish that input, Lemma 3 also completes the all-parameter Gaussian theorem.

#proof[
  Let $nu$ be supplied by Lemma 6. Choose any sequence $R_n arrow.r oo$,
    discarding finitely many terms so that $N_(R_n) > 0$, and put
  $ A_n \( t \) = 1 / N_(R_n) sum_(x \, y in cal(C)_(R_n)\
x eq.not y) e^(- t \| x - y \|^2) \, wide L \( t \) = sum_(a in A \\ { 0 }) e^(- t \| a \|^2) . $
  These are nonnegative Borel functions of $t gt.eq 0$. For every $t > 0$, (5) with $alpha =
    t \/ pi$ gives $liminf_n A_n \( t \) gt.eq L \( t \)$. This also holds at $t = 0$, because $A_n \( 0 \) =
    N_(R_n) - 1 arrow.r oo = L \( 0 \)$. The identity for $g$, followed by Fatou’s lemma and Tonelli’s theorem,
    now gives
  $ & liminf_n 1 / N_(R_n) sum_(x \, y in cal(C)_(R_n)\
x eq.not y) g \( \| x - y \|^2 \)\
 & wide = liminf_n integral A_n \( t \) thin d nu \( t \) gt.eq
   integral liminf_n A_n \( t \) thin d nu \( t \) gt.eq integral L \( t \) thin d nu \( t \) =
   sum_(a in A \\ { 0 }) g \( \| a \|^2 \) . $
  Every step is valid in the extended nonnegative reals. Local finiteness makes each disk sum finite,
    and its distinct-point distances are positive, so the possible singularity of $g$ at zero does not enter a
    finite sum. No common minimizing sequence in the Gaussian parameter was selected:
    its lower bound holds along every sequence of radii. Since the sequence $R_n$ was arbitrary,
    the full radius lower-limit inequality follows.
  Finally, choose a bounded fundamental cell of $A$ with zero in its closure; its area is one.
    Comparing its translates with disks whose radii differ by its diameter proves
    $\# \( A ∩ B_R \) \/ \( pi R^2 \) arrow.r 1$. For any fixed $v in A \\ { 0 }$,
    the number $N_R \( v \)$ of $x in A ∩ B_R$ for which $x + v in B_R$ satisfies
  $ \# \( A ∩ B_(R - \| v \|) \) lt.eq N_R \( v \) lt.eq \# \( A ∩ B_R \) \, $
  for $R > \| v \|$. Hence $N_R \( v \) \/ \# \( A ∩ B_R \) arrow.r 1$.
    For any finite set $D subset A \\ { 0 }$, retaining the ordered displacements in $D$ gives a lower limit at
    least $sum_(v in D) g \( \| v \|^2 \)$. Taking the supremum over $D$ gives the full lattice sum,
    even when it diverges. Conversely, for each $x in A ∩ B_R$,
    its finite neighbor sum is at most the full nonnegative lattice sum.
    When that sum is finite, averaging gives the matching upper bound.
    These observations prove the assertion about the lattice limit. ◻
]

== 3 The Gaussian interpolation construction <sec:construction>

It remains to establish (1) for $alpha gt.eq 1$. We construct a Fourier pair by prescribing values and derivatives
  at a periodic set of squared radii. The finite part uses trigonometric columns;
  stronger Gaussian damping makes their value-and-derivative contributions at later nodes in their residue classes
  modulo $36$ summably small. The infinite part uses columns with one removable pole each.
  Their spectral formulas will supply bounds uniform in the column index,
  which is the input needed to solve all interpolation equations at once.

Keep the Fourier convention, $b = sqrt(3) \/ 2$, and the lattice $A$ from the introduction. Set

$ B = b^(- 2) = 4 / 3 \, quad h = 17 / 50 \, quad H = 27 / 50 \, quad eta = H - h = 1 / 5 \, wide s = b \| x \|^2 . $

The same coordinate $s = b \| xi \|^2$ is used for frequency-space radial functions.
  A prime denotes differentiation in this scalar coordinate.
  The covolume-one and quarter-turn duality calculation in Section 2 shows that $A$ and $A^(*)$ have the same
  radii. For the displayed basis of $A$, the squared-radius coordinates are precisely the nonnegative values of
  $m^2 + m n + n^2$.

Define

$ I & = { 0 \, 1 \, 3 \, 4 \, 7 \, 9 \, 12 \, 13 \, 16 \, 19 \, 21 \, 25 \, 27 \, 28 \, 31 } \,\
cal(N) & = \( 36 bb(Z) + I \) ∩ \( 0 \, oo \) \,\
f & = { 1 \, 3 \, 4 \, 7 \, 9 \, 12 \, 13 \, 16 \, 19 \, 21 } \, wide T = cal(N) \\ f \, wide L = { 0 } union f . $

Every nonzero lattice squared-radius coordinate belongs to $cal(N)$.
  Indeed, modulo $3$ the quadratic form equals $\( m - n \)^2$.
  If $m - n$ is not divisible by $3$, its residue modulo $9$ is one of $1 \, 4 \, 7$; if $m = n + 3 j$,
  the form is $3 n^2$ modulo $9$, hence is $0$ or $3$. Modulo $4$ its possible values,
  checked by the parities and residues of $m \, n$, are $0 \, 1 \, 3$.
  Combining these two lists by the Chinese remainder theorem gives exactly the displayed residue set $I$.
  We impose interpolation at this superset, without needing it to consist entirely of actual lattice shells.

Set

$ kappa = pi \/ 36 \, wide t_j = j \/ 18 \, wide P \( s \) = product_(a in I) \( 2 sin kappa \( s - a \) \)^2 =
  sum_(j = - 15)^15 P_j e^(i pi t_j s) . $

The zeros are precisely $36 bb(Z) + I$, each of order two. For a zero $n$ define $Q_n > 0$ and $D_n in bb(R)$ by

#[#set math.equation(numbering: n => "(8)")
 $ P \( n + u \) = Q_n u^2 \( 1 + D_n u + O \( u^2 \) \) . $ <analytic:local-product>]

Both $Q_n$ and $D_n$ are periodic with period $36$. The rational tail columns and their Gaussian spectral
  treatment below adapt #cite(label("SharpPlanar2026")) Lemma 2.1 and Proposition 2.2 and
  #cite(label("UniversalTriangular2026")) Lemmas 2.2 and 2.4.
  The paired double and simple poles also occur in the one-dimensional constructions of
  #cite(label("CohnKumar2007")) Proposition 9.6 and #cite(label("CarneiroLittmannVaaler2013"))
  formulas (1.2)–(1.3). For each side $i = 1 \, 2$ introduce an input radial function $U_i$ by

#[#set math.equation(numbering: n => "(9)")
 $ U_i \( s \) =  & e^(- pi H s) P \( s \) sum_(n in L)
   (c_(i \, n) kappa^2 csc^2 kappa \( s - n \) + d_(i \, n) kappa cot kappa \( s - n \)) + C_i e^(- pi h s) P \( s \)\
 & + e^(- pi h s) P \( s \) sum_(n in T) (frac(c_(i \, n), \( s - n \)^2) + frac(d_(i \, n), s - n)) .
   $ <analytic:input-functions>]

Every apparent pole is removed by continuity. The tail coefficient lists will lie in $ell^1 \( T \; bb(R)^2 \)$
  with norm $sum_(n in T) \( \| c_(i \, n) \| + \| d_(i \, n) \| \)$. Fix

$ c_(1 \, 0) = c_(2 \, 0) = 11 / 25 \, quad d_(1 \, 0) = d_(2 \, 0) = 0 \, wide C_1 = - 3 / 500 \, quad C_2 = 3 /
  500 . $

The notation $U_i \( s \)$ denotes the same function as $x mapsto U_i \( b \| x \|^2 \)$;
  Fourier transforms always refer to the latter function on $bb(R)^2$. Define

$ F_1 = U_1 + hat(U)_2 \, wide F_2 = U_2 + hat(U)_1 \, wide J_i \( s \) = e^(pi h s) F_i \( s \) . $

The spectral argument proves that $U_i$ and $F_i$ are real radial Schwartz functions and that $F_2 =
  hat(F)_1$ for every summable coefficient list. The divided functions $J_i$ need not be Schwartz.

For $alpha gt.eq 1$, put

$ z = frac(1, pi \( alpha \/ b - h \)) > 0 \, wide G_z \( s \) = Q_1 z e^(\( 1 - s \) \/ z) . $

Our interpolation equations are

#[#set math.equation(numbering: n => "(10)")
 $ J_1 \( n \) & = G_z \( n \) \, & J'_1 \( n \) & = G'_z \( n \) \,\
J_2 \( n \) & = 0 \, & J'_2 \( n \) & = 0 &  & \( n in cal(N) \) . $ <analytic:all-positive-jets>]

The sign argument will additionally establish $J_1 \( s \) lt.eq G_z \( s \)$ and $J_2 \( s \) gt.eq
  0$ for $s gt.eq 0$. Then $F_1 \/ \( Q_1 z e^(1 \/ z) \)$ is the required Gaussian minorant, because

$ e^(- pi h s) G_z \( s \) \/ \( Q_1 z e^(1 \/ z) \) = e^(- \( pi h + 1 \/ z \) s) = e^(- pi alpha \| x \|^2) . $

The infinite system below establishes all the jets exactly, before any estimates between nodes are invoked.

=== 3.1 Spectral measures for the interpolation columns <spectral-measures-for-the-interpolation-columns>

We establish exact spectral formulas for the columns and prove that summable coefficient lists define Schwartz
  functions. These facts justify the infinite interpolation system and termwise differentiation.

A finite complex measure $mu$ on $\[ - 5 \/ 6 \, 5 \/ 6 \]$ will be called conjugate symmetric if reflection takes
  it to its complex conjugate. Then $integral e^(i pi t s) thin d mu \( t \)$ is real for real $s$.
  Its folded measure is

$ mu_(+) = mu \( { 0 } \) delta_0 + 2 mu \|_(\( 0 \, 5 \/ 6 \]) \, wide integral e^(i pi t s) thin d mu \( t \) =
  "Re" integral_(\[ 0 \, 5 \/ 6 \]) e^(i pi t s) thin d mu_(+) \( t \) . $

The atom at zero is not doubled. The total variations of these two measures agree,
  because the atom at zero is real and the positive and negative parts have equal total variation.

For $n in L$ consider the entire, real-valued columns obtained by removing their apparent poles:

$ A_n \( s \) = kappa^2 P \( s \) csc^2 kappa \( s - n \) \, wide B_n \( s \) =
  kappa P \( s \) cot kappa \( s - n \) . $

Set $b_j = 2 - upright(bold(1))_(j = 0)$. Their folded spectral measures are atomic at $t_j$, $0 lt.eq j lt.eq
  15$, with respective masses

#[#set math.equation(numbering: n => "(11)")
 $ M_(j \; c \, n) & = - 4 kappa^2 b_j sum_(l = j + 1)^15 \( l - j \) P_l e^(i pi \( t_l - t_j \) n) \,\
M_(j \; d \, n) & = i kappa b_j (P_j + 2 sum_(l = j + 1)^15 P_l e^(i pi \( t_l - t_j \) n)) . $ <analytic:atomic-c>]

The folded masses for the column $P \( s \)$ itself are $V_j = b_j P_j$.

To prove these identities, put $u = s - n$, $Y = e^(2 i kappa u)$, and $a_l = P_l e^(i pi t_l n)$.
  The Laurent polynomial $P \( n + u \) = sum_l a_l Y^l$ has a factor $\( Y - 1 \)^2$. Moreover,

$ csc^2 kappa u = - frac(4 Y, \( Y - 1 \)^2) \, wide cot kappa u = i (1 + frac(2, Y - 1)) . $

The products are therefore Laurent polynomials. Expanding at infinity,

$ frac(Y, \( Y - 1 \)^2) = sum_(r gt.eq 1) r Y^(- r) \, wide frac(1, Y - 1) = sum_(r gt.eq 1) Y^(- r) \, $

shows that the coefficients of $Y^j$, $j gt.eq 0$, in these products are $-
  4 kappa^2 sum_(l > j) \( l - j \) a_l$ and $i kappa \( a_j + 2 sum_(l > j) a_l \)$.
  Changing back from $Y^j$ to $e^(i pi t_j s)$ gives (11)–(11) after folding.
  The negative coefficients are conjugates of the positive coefficients.
  For completeness, $P \( n \) = P' \( n \) = 0$ give

$ P_0 + 2 "Re" sum_(l > 0) a_l = 0 \, wide "Im" sum_(l > 0) l a_l = 0 . $

Thus both displayed zero-frequency masses are real, as folding requires.

For $n in T$ the other two undamped columns are

$ C_n \( s \) = frac(P \( s \), \( s - n \)^2) \, wide D_n^(upright("col")) \( s \) = frac(P \( s \), s - n) \, $

again with removable values. Their folded spectral measures are absolutely continuous.
  On $t in \( t_(j - 1) \, t_j \)$, $1 lt.eq j lt.eq 15$, their densities are

#[#set math.equation(numbering: n => "(12)")
 $ rho_(c \, n) \( t \) & = - 2 pi^2 sum_(l = j)^15 \( t_l - t \) P_l e^(i pi \( t_l - t \) n) \,\
rho_(d \, n) \( t \) & = 2 i pi sum_(l = j)^15 P_l e^(i pi \( t_l - t \) n) . $ <analytic:tail-c>]

Indeed, for real $a$ the oriented integral identities

$ frac(e^(i pi a u) - 1, u) & = i pi integral_0^a e^(i pi t u) thin d t \,\
frac(e^(i pi a u) - 1 - i pi a u, u^2) & = - pi^2 integral_0^a \( a - t \) e^(i pi t u) thin d t $

hold first for $u eq.not 0$ and then by continuity for $u = 0$.
  They are valid also when $a < 0$, with the usual orientation of the integral.
  Since $sum_l a_l = sum_l t_l a_l = 0$, summing these identities with $a =
  t_l$ and coefficient $a_l$ gives the asserted columns. Replacing $u$ by $s - n$ yields the phase in (12)–(12).
  The negative-frequency densities are the conjugates of their reflected positive-frequency densities.
  The measures are absolutely continuous even at zero; endpoint values of their densities are immaterial.
  In particular, no zero-frequency atom is to be inserted when folding.

The phases depending on $n$ have modulus one. Consequently the variation of either folded measure on
  $\[ t_(j - 1) \, t_j \]$ is bounded by the corresponding entry of

#[#set math.equation(numbering: n => "(13)")
 $ W_(j \, *) =
   (2 \( pi \/ 18 \)^2 sum_(l = j)^15 \( l - j + 1 / 2 \) \| P_l \| \, \( 2 pi \/ 18 \) sum_(l = j)^15 \| P_l \|) \,\
W_(0 \, *) = \( 0 \, 0 \) . $ <analytic:tail-variation>]

For the first entry, integrate $t_l - t$ on this interval to obtain $\( l - j + 1 \/ 2 \) \/ 18^2$;
  for the second, the interval length is $1 \/ 18$. These bounds hold uniformly for every positive tail node $n$,
  however large it is.

=== 3.2 Schwartz convergence and the Fourier waves <schwartz-convergence-and-the-fourier-waves>

For $k > 0$ and $\| t \| lt.eq 5 \/ 6$ put

$ Phi_(k \, t) \( x \) = e^(- pi b \( k - i t \) \| x \|^2) \, wide x in bb(R)^2 . $

For each pair of multi-indices $beta \, gamma$ there is a finite constant $C_(beta \, gamma \, k)$,
  independent of $t$, such that

#[#set math.equation(numbering: n => "(14)")
 $ sup_(x in bb(R)^2) \| x^beta partial_x^gamma Phi_(k \, t) \( x \) \| lt.eq
   C_(beta \, gamma \, k) . $ <analytic:schwartz-uniform>]

To see this directly, differentiating the Gaussian gives a polynomial in $x$ with coefficients polynomial in
  $b \( k - i t \)$, times the same Gaussian. Those coefficients are uniformly bounded on the compact frequency
  interval, and the absolute value of the Gaussian is $e^(- pi b k \| x \|^2)$.
  Every polynomial times this fixed decaying Gaussian is bounded.

Thus integration of $Phi_(k \, t)$ against a finite measure defines a Schwartz function,
  and its $\( beta \, gamma \)$ seminorm is at most $C_(beta \, gamma \, k)$ times the measure’s total variation.
  Differentiation under the integral follows from the same bounds. In particular, define

$ w_c = sum_(j = 1)^15 W_(j \, c) \, wide w_d = sum_(j = 1)^15 W_(j \, d) . $

For any real lists satisfying $sum_(n in T) \( \| c_n \| + \| d_n \| \) < oo$,
  the series of tail measures converges in total variation and has total variation at most

$ w_c sum_(n in T) \| c_n \| + w_d sum_(n in T) \| d_n \| . $

The corresponding series of functions therefore converges in every Schwartz seminorm.
  This proves the claimed convergence for arbitrary summable coefficients;
  no moment condition such as $sum n^r \| c_n \| < oo$ is needed.
  It also justifies taking removable values and derivatives at every node.
  Equivalently, before damping, the $r$th $s$-derivative of each integral is bounded on the real axis by
  $\( 5 pi \/ 6 \)^r$ times its total variation, uniformly in $n$.
  The finitely many atomic columns cause no further convergence issue.

With Fourier kernel $e^(- 2 pi i x dot.op xi)$ the Gaussian integral in dimension two is

#[#set math.equation(numbering: n => "(15)")
 $ hat(Phi)_(k \, t) \( xi \) = frac(1, b \( k - i t \)) exp (- frac(pi \| xi \|^2, b \( k - i t \))) .
   $ <analytic:complex-gaussian>]

For a positive real parameter $a$, the one-dimensional identity $hat(e^(- pi a x^2)) \( xi \) =
  a^(- 1 \/ 2) e^(- pi xi^2 \/ a)$ follows by differentiating the Fourier integral in $xi$, integrating by parts,
  and using $integral e^(- pi a x^2) thin d x = a^(- 1 \/ 2)$ at $xi = 0$.
  Taking the product of two such integrals gives the two-dimensional formula.
  Both sides of that formula are holomorphic in $a$ on $"Re" a > 0$:
  compact subsets have a common integrable Gaussian bound for every parameter derivative.
  The identity theorem extends the formula to that half-plane and gives (15) with $a = b \( k - i t \)$.
  This argument fixes both the Fourier normalization and the complex prefactor without any square-root branch
  ambiguity in dimension two.

Write $s = b \| xi \|^2$, $B = b^(- 2)$, and set

#[#set math.equation(numbering: n => "(16)")
 $ X_k \( t \) = frac(B, k^2 + t^2) \, wide lambda_k \( t \) = frac(k + i t, b \( k^2 + t^2 \)) \, wide
   zeta_(k \, v) \( t \) = - t X_k \( t \) + i #scale(x: 120%, y: 120%)[\(] k X_k \( t \) -
   v #scale(x: 120%, y: 120%)[\)] . $ <analytic:fourier-wave>]

After division by $e^(- pi v s)$, the right side of (15) is exactly $lambda_k \( t \)
  e^(i pi zeta_(k \, v) \( t \) s)$. The Fourier transform commutes with the above measure integrals by Fubini,
  since $integral \| Phi_(k \, t) \( x \) \| thin d x = 1 \/ \( b k \)$ uniformly in $t$.
  It also commutes with summation of the tail columns, either by the same domination or by convergence in the
  Schwartz space. At opposite frequencies the transformed waves are conjugates,
  so the same folded measures may be used, followed by taking the real part.

For $k \, v in { h \, H }$ the additional decay exponent is positive.
  Indeed $k X_k \( t \)$ decreases as $t^2$ increases; its smallest difference from $v$ is attained at $\| t \| =
  5 \/ 6$. With $h = 17 \/ 50$ and $H = 27 \/ 50$, the four endpoint differences,
  for $\( k \, v \) = \( h \, h \) \, \( h \, H \) \, \( H \, h \) \, \( H \, H \)$, are respectively

$ 100079 / 455650 \, quad 8949 / 455650 \, quad 216419 / 554650 \, quad 105489 / 554650 . $

In particular each is positive. The undivided transformed waves also have uniform Schwartz bounds:
  their Gaussian parameters $1 \/ \( b \( k - i t \) \)$ form a compact subset of the open right half-plane.
  All input functions and their transforms are consequently real radial Schwartz functions.
  If $U_1 \, U_2$ denote the two complete input sums, then

$ F_1 = U_1 + hat(U)_2 \, wide F_2 = U_2 + hat(U)_1 quad arrow.r.double quad hat(F)_1 = F_2 \, $

because Fourier inversion gives $hat(hat(U)_2) \( x \) = U_2 \( - x \)$ and $U_2$ is radial.

=== 3.3 Jets and repeated nodes <jets-and-repeated-nodes>

At a positive node $n$ let $v = H$ on $f$ and $v = h$ on $T$.
  After division of the input centered at $n$ by $e^(- pi v s)$, its value and first derivative at $n$ are

#[#set math.equation(numbering: n => "(17)")
 $ Q_n #scale(x: 120%, y: 120%)[\(] c_n \, d_n + D_n c_n #scale(x: 120%, y: 120%)[\)] . $ <analytic:direct-jets>]

For the rational columns this follows immediately from (8). For the trigonometric columns use

$ kappa^2 csc^2 kappa u = u^(- 2) + O \( 1 \) \, wide kappa cot kappa u = u^(- 1) + O \( u \) . $

Every other direct column has zero value and first derivative at $n$,
  except for a trigonometric column with the same residue modulo $36$.
  The direct constant column $P$ always has a double zero there.

For any additional divided contribution $Z \( s \)$, cancelling its jets requires the coefficient correction

$ Q_n^(- 1) #scale(x: 120%, y: 120%)[\(] - Z \( n \) \, D_n Z \( n \) - Z' \( n \) #scale(x: 120%, y: 120%)[\)] . $

Applying this to one Fourier wave from (16) yields exactly

#[#set math.equation(numbering: n => "(18)")
 $ Q_n^(- 1) lambda_k \( t \) e^(i pi zeta_(k \, v) \( t \) n) #scale(x: 120%, y: 120%)[\(] - 1 \, D_n -
   i pi zeta_(k \, v) \( t \) #scale(x: 120%, y: 120%)[\)] . $ <analytic:transformed-jet>]

Integration against the folded measures, followed by taking real parts,
  gives the full transformed contribution to the coefficient equations.

There is one additional direct contribution on the tail. For $n in
  L$ its positive repeated poles are precisely $m = n + 36 l$, $l gt.eq 1$.
  All belong to $T$ because $0 lt.eq n lt.eq 21$. At such $m$, divide by $e^(- pi h s)$.
  The original damping $H$ leaves $e^(- pi eta s)$, so the jets of this repeated column are

$ Q_m e^(- pi eta m) #scale(x: 120%, y: 120%)[\(] c_n \, d_n + \( D_m - pi eta \) c_n #scale(x: 120%, y: 120%)[\)] . $

In the tail coefficient coordinates of (17), this is $e^(- pi eta m) \( c_n \, d_n - pi eta c_n \)$.
  It must therefore be #emph[subtracted] from the desired coefficients at $m$.
  This includes the column centered at $0$; no division by an uncontrolled quotient $Q_m \/ Q_n$ appears.
  There are no other direct cross-terms: distinct residues have no pole at $m$,
  and a rational column has only its own possible pole. The induced map from the finite lists to the summable tail
  lists has norm at most

#[#set math.equation(numbering: n => "(19)")
 $ \( 1 + pi eta \) sum_(l gt.eq 1) e^(- 36 pi eta l) = frac(1 + pi eta, e^(36 pi eta) - 1) \,
   $ <analytic:repetition-norm>]

since $e^(- pi eta n) lt.eq 1$ for $n in L$.

Finally let $G \( s \) = Q_1 z e^(\( 1 - s \) \/ z)$, with $z > 0$ as defined for the Gaussian parameter,
  so the desired divided target at a node using damping $v$ is $e^(pi \( v - h \) s)
  G \( s \)$ on side $1$ and zero on side $2$. Applying the inverse of (17) to that target gives

#[#set math.equation(numbering: n => "(20)")
 $ Q_1 / Q_n e^(pi \( v - h \) n + \( 1 - n \) \/ z) #scale(x: 120%, y: 120%)[\(] z \, -
   1 + \( pi \( v - h \) - D_n \) z #scale(x: 120%, y: 120%)[\)] . $ <analytic:target-jet>]

Equations (18) and (20), together with subtraction of the repeated column contribution,
  therefore impose exactly the desired value and first derivative at every positive node.
  All operations used to derive these equations are justified for arbitrary summable tail coefficients by the
  spectral variation and Schwartz bounds above.

== 4 A finite atomic certificate <sec:finite-certificate>

The infinite interpolation problem will be solved by perturbing a finite system.
  Its unknowns are the value and derivative coefficients at

$ f = { 1 \, 3 \, 4 \, 7 \, 9 \, 12 \, 13 \, 16 \, 19 \, 21 } . $

Thus each side has twenty unknown coordinates. This section constructs the finite solution,
  certifies bounds needed to control the infinite correction,
  and verifies the polynomial inequalities used between the first few nodes.
  The analytic passage from these finite bounds to the whole half-line is made separately.

All vector norms in this section are sums of absolute values.
  Matrix norms are the induced norms, namely maximum absolute column sums.
  An absolute value around a matrix or vector, without a norm sign, is entrywise.
  The notation $\[ g \, S \] = max \( g \| S \| \)$ denotes the largest entry of the row obtained by multiplying
  the nonnegative row $g$ by $\| S \|$.

=== 4.1 Atoms, jets, and the finite system <atoms-jets-and-the-finite-system>

Use the folded matrices $M \, V$ of (11)–(11), with columns $c_n \,
  d_n$ for $n in L$ and the separate constant column $V$. The Fourier waves $X_k \, lambda_k \,
  zeta_(k \, v)$ are those in (16). For a folded atom column $S$,
  its opposite-side contribution to the change of the two coefficients at $n$ is

#[#set math.equation(numbering: n => "(21)")
 $ cal(R)_(k \, v) \( n \) S = 1 / Q_n "Re" sum_(j = 0)^15 lambda_k \( t_j \) e^(i pi zeta_(k \, v) \( t_j \) n)
   vec(- 1, D_n - i pi zeta_(k \, v) \( t_j \)) S_j . $ <eq:finite-jet-map>]

Indeed the direct coefficients supply jets $Q_n \( c_n \, d_n + D_n c_n \)$ after removing their own damping.
  Subtracting an opposite-side value $u$ and derivative $u'$ changes the coefficients by
  $Q_n^(- 1) \( - u \, D_n u - u' \)$, which is exactly (21).

For the finite equations use $v = H$, $k = H$ on $M$, and $k = h$ on $V$.
  After putting the fixed columns $c_0 \, d_0 \, C$ first, denote the resulting twenty-row matrix by
  $\( R_0 med R \)$, where $R$ is $20$ by $20$. The fixed coefficients are $c_(1 \, 0) = c_(2 \, 0) = 0.44$,
  $d_(1 \, 0) = d_(2 \, 0) = 0$, and $C_1 = - 0.006$, $C_2 = 0.006$.

The finite columns use damping $H$, whereas the prescribed functions $J_i$ use damping $h$.
  To obtain a finite coefficient pair, we therefore first multiply the target $G_z \( s \)$ by $e^(pi eta s)$ and
  then invert the direct jet map (17). Formula (20) gives the result.
  Its dependence on the Gaussian parameter enters through the two quantities $z
  e^(\( 1 - n \) \/ z)$ and $e^(\( 1 - n \) \/ z)$ at each node $n$.

For the finite approximation we retain the targets at $n = 1 \, 3 \, 4 \, 7$.
  Their exponential factors are $1 \, w \, u \, p$, respectively, where

$ w = e^(- 2 \/ z) \, wide u = e^(- 3 \/ z) \, wide p = e^(- 6 \/ z) . $

Thus the retained target pairs depend linearly on the eight coordinates

$ e = \( z \, 1 \, z w \, w \, z u \, u \, z p \, p \)^(sans(T)) . $

At the six remaining finite nodes $9 \, 12 \, 13 \, 16 \, 19 \, 21$,
  this approximation replaces the target pairs by zero. The exact interpolation conditions are not changed:
  the omitted target pairs are a small residual, bounded in Lemma 7 and restored by the infinite correction in
  Section 5.

We enclose these Gaussian data in a single polytope. Put

$ Z = 0.391 \, quad W_(*) = 0.0061 \, quad Delta_(*) = 0.00018 \, quad U_(*) = 0.00048 \, quad P_(*) = 0.0000003 \, $

and define

#[#set math.equation(numbering: n => "(22)")
 $ cal(E) = { & \( z \, 1 \, Z w - Delta \, w \, a \, u \, r \, p \)^(sans(T)) : quad 0 lt.eq z lt.eq Z \, quad
   0 lt.eq w lt.eq W_(*) \, quad 0 lt.eq Delta lt.eq Delta_(*) \,\
 & 0 lt.eq u lt.eq U_(*) \, quad 0 lt.eq a lt.eq Z u \, quad 0 lt.eq r \, p lt.eq P_(*) } . $ <eq:parameter-polytope>]

For $alpha gt.eq 1$ and $z = 1 \/ \( pi \( alpha \/ b - h \) \)$, the actual vector $e$ belongs to $cal(E)$.
  The finite checks below give $1 \/ \( pi \( 1 \/ b - h \) \) <
  Z$ and $\( e^(- 2 \/ Z) \, e^(- 3 \/ Z) \, e^(- 6 \/ Z) \) < \( W_(*) \, U_(*) \, P_(*) \)$ coordinatewise.
  The remaining coordinate is $Delta = \( Z - z \) e^(- 2 \/ z)$; its maximum occurs at $z = sqrt(1 + 2 Z) -
  1$ and is less than $0.00015 < Delta_(*)$. Also $z p lt.eq p lt.eq P_(*)$ because $Z < 1$.

Let $gamma_i e = \( 0.44 \, 0 \, C_i \)^(sans(T)) e_2$. Define the $20$-by-$8$ target matrix $Y_f$ by zero row
  pairs except at the first four nodes $n in f$. At the node in position $j in { 1 \, 2 \, 3 \, 4 }$ its row pair is

$ \( Y_f e \)_n = frac(Q_1 e^(pi eta n), Q_n) vec(e_(2 j - 1), - e_(2 j) + \( pi eta - D_n \) e_(2 j - 1)) . $

Let $A_i$ have twenty-three rows, ordered as $c_n \, d_n$ on $L$, followed by $C$.
  Fix its three prescribed rows by $gamma_i$ and solve

#[#set math.equation(numbering: n => "(23)")
 $ \( A_1 \)_f = R \( A_2 \)_f + R_0 gamma_2 + Y_f \, wide \( A_2 \)_f = R \( A_1 \)_f +
   R_0 gamma_1 . $ <eq:finite-system>]

The inverse bounds below prove unique solvability. Explicitly, put

$ U_plus.minus = \( I minus.plus R \)^(- 1) #scale(x: 120%, y: 120%)[\(] Y_f +
  R_0 \( gamma_2 plus.minus gamma_1 \) #scale(x: 120%, y: 120%)[\)] . $

Then $\( A_1 \)_f = \( U_(+) + U_(-) \) \/ 2$ and $\( A_2 \)_f = \( U_(+) - U_(-) \) \/ 2$.
  Recall that $J_i = e^(pi h s) F_i$. The finite function $tilde(J)_i$ is formed by the same rule,
  using coefficients $A_i e$ and no tail columns.

=== 4.2 The finite inequalities <the-finite-inequalities>

The coefficient bounds will control the infinite correction.
  For the sign bounds, it is important to compare curvature after removing the prescribed value and derivative at
  each node. For a twice continuously differentiable function $phi$ on an interval containing $m$ and $m + v$,
  define the second-order divided remainder

#[#set math.equation(numbering: n => "(24)")
 $ U_m \[ phi \] \( v \) =
   cases(delim: "{", frac(phi \( m + v \) - phi \( m \) - v phi' \( m \), v^2) \, & v eq.not 0 \,, phi'' \(
   m \) \/ 2 \, & v = 0 .) wide U_m \[ phi \] \( v \) = integral_0^1 \( 1 - t \) phi'' \( m + t v \) thin d t .
   $ <eq:deleted-jet>]

The integral identity follows by integrating twice and holds for either sign of $v$.
  It shows that a bound for $\| phi'' \| \/ 2$ on the joining segment also bounds $\| U_m \[ phi \] \( v \) \|$.
  If two functions have matching value and derivative at $m$, their difference at $m +
  v$ is $v^2$ times the difference of their divided remainders.
  We will use this identity for the exact interpolants; here we prepare polynomial estimates for the divided
  remainders of the finite approximations.

For $m in { 1 \, 3 \, 4 \, 7 \, 9 \, 12 \, 13 }$, let $y$ be each displacement from $m$ to the endpoints of its
  nearest-positive-node interval on $\[ 0 \, oo \)$. At $m = 1$ the two values are $- 1$ and $1$;
  elsewhere they are half the signed gaps to the neighboring positive nodes.
  The degree-twenty Taylor polynomial of $U_m \[ tilde(J)_i \] \( y tau \)$ is

#[#set math.equation(numbering: n => "(25)")
 $ T_i \( tau \; e \) = sum_(ell = 0)^20 frac(tilde(J)_i^(\( ell + 2 \)) \( m \) y^ell, \( ell + 2 \) !) tau^ell .
   $ <eq:finite-taylor-polynomial>]

Its coefficients are linear in $e$. In the exceptional case $m = y = 1$,
  write $A \( tau \)$ and $D \( tau \)$ for $- T_1$ at $z = 0$ and $z = Z$, fixing $w \, Delta \, r \,
  p$ and a chosen allowed pair $\( a \, u \)$ in (22). Only $z$ varies along this segment.
  These scalar polynomial names are distinct from the coefficient matrices $A_i$.

The matrix $W$ in (13) has columns ordered $\( c \, d \)$.
  Its row $j$ bounds the integrated folded variation on $\[ t_(j - 1) \, t_j \]$ of one tail column,
  uniformly in its node. Set $T_0 = { n in T : 25 lt.eq n < 61 }$.

We use three kinds of envelopes. Jet envelopes bound the coefficient maps of the interpolation system.
  Curvature envelopes, after weighting by the relevant coefficient bounds,
  bound half the absolute second derivative of the pole-column and transformed-constant contributions to $J_i$.
  Taylor envelopes bound the degree-twenty truncation error in the divided Taylor expansion of the finite
  approximation $tilde(J)_i$. For input damping $k in { h \, H }$,
  divide the direct wave by $e^(- pi h s)$ and its Fourier transform by $e^(- pi v s)$, where $v in { h \, H }$.
  At frequency $t_j$, let $ell = \| lambda_k \( t_j \) \|$ be the transformed-wave amplitude.
  Let $d_a \, d_b$ be the absolute derivative multipliers of the divided direct and transformed waves, and $E_a \,
  E_b$ their decay rates. Explicitly, put

$ ell = sqrt(X_k) \, quad d_a = pi sqrt(t_j^2 + \( k - h \)^2) \, quad E_a = pi \( k - h \) \,\
d_b = pi sqrt(v^2 + \( B - 2 k v \) X_k) \, wide E_b = pi \( k X_k - v \) . $

The row for the jet envelope at $n$ is

$ psi_j \( n \) = frac(\( 1 + \| D_n \| + d_b \) ell e^(- E_b n), Q_n) \, wide Psi_(f \, k \, H) \( S \) =
  [sum_(n in f) psi \( n \) \, S] . $

For $Psi_(T \, k \, h) \( S \)$, sum over $T_0$ and divide its $j$th entry by $1 - e^(- 36 E_b \( t_j \))$.
  Periodicity makes this the exact geometric sum of the node envelope over $T$. The missing-target envelopes are

$ Q_1 sum_(n in f ∩ \[ 9 \, 21 \]) frac(1 + Z + Z \| pi eta - D_n \|, Q_n) e^(pi eta n + \( 1 - n \) \/ Z) $

and the sum over $T_0$ of $Q_1 \( 1 + Z + Z \| D_n \| \) e^(\( 1 - n \) \/ Z) \/ Q_n$, divided by $1 - e^(- 36 \/ Z)$.

The raw $L$ curvature expression is

$ 1 / 2 \[ d_a^2 e^(- s E_a) \, M \] + 1 / 2 \[ d_b^2 ell e^(- s E_b) \, M \] wide \( k = H \, med v = h \) . $

For the transformed constant it is $1 / 2 \[ d_b^2 ell e^(- s E_b) \, V \]$, with $k = v = h$. For $T$, use

$ 60 #scale(x: 120%, y: 120%)[\(] d_a \( 5 \/ 6 \)^2 + d_b \( t_(*) \)^2 ell \( t_(*) \) e^(- s E_b \( t_(*) \))
  #scale(x: 120%, y: 120%)[\)] \, wide k = v = h \, $

where $t_(*) = 0$ at $s = 0$ and $t_(*) = 5 \/ 6$ at the other listed values.
  The factor $60$ bounds one half of $parallel W parallel$.
  The frequency-extremum justification and the passage to uniform curvature bounds are given in Lemma 9.

For the Taylor remainder, define

$ g_(m \, y) \( d \, E \) = frac(d^2 \( \| y \| d \)^21, 23 !) frac(e^(- m E), 1 - \| y \| d \/ 24) \, wide
  cal(E)_(m \, y) \( k \, S \) = \[ g_(m \, y) \( d_a \, E_a \) \, S \] + \[ ell g_(m \, y) \( d_b \, E_b \) \,
  S \] \, $

using $v = h$. Every denominator is positive. The tested envelope is $3 cal(E)_(m \, y) \( H \, M \) +
  0.006 cal(E)_(m \, y) \( h \, V \)$. The geometric majorant of the exponential Taylor series explains precisely
  this remainder: after the degree-twenty divided polynomial, the first term has derivative order $23$,
  and subsequent absolute-term ratios are at most $\| y \| d \/ 24 < 1$.

#thm([Lemma 4.1.])[
  (Finite certificate).  #emph[The following strict inequalities hold for the constants and matrices defined above.]
  + #emph[The pivots of diagonal-order Gauss–Jordan elimination on $I - R$ and $I +
    R$ have absolute values between $0.12$ and $1.74$. Moreover,
$ parallel \( I - R \)^(- 1) parallel < 16.16 < 17 \, wide parallel \( I + R \)^(- 1) parallel < 3.89 < 5 \,\
sup_(e in cal(E)) parallel A_1 e parallel < 2.58 \, wide sup_(e in cal(E)) parallel A_2 e parallel < 2.80 . $

]
  + #emph[The node quantities satisfy $0.157 < Q_n < 40$ and $\| D_n \| < 2.83$ for every residue node,
    and $min_(n = 16 \, 19 \, 21) Q_n > 16$. For successive gaps of one period, starting with $\( 0 \, 1 \)$,
    the midpoint values of $P \( s \) \/ \( s - m \)^2$, with $m$ either endpoint, exceed respectively
$ 0.165 \, med 0.120 \, med 0.054 \, med 0.482 \, med 0.656 \, med 1.11 \, med 0.337 \,\
3.13 \, med 9.26 \, med 8.19 \, med 19.08 \, med 2.34 \, med 0.706 \, med 6.80 \, med 14.1 . $

]
  + #emph[For the jet envelope sums $Psi_(N \, k \, v) \( S \)$ just defined,
    including geometric summation over all tail periods, the bounds are
$ N & S & k & v & upright("upper bound")\
f & W & h & H & 335\
T & M & H & h & 7 dot.op 10^(- 15)\
T & W & h & h & 2.3 dot.op 10^(- 8)\
T & V & h & h & 1.27 dot.op 10^(- 7) $

 Here $parallel W parallel < 119$, and the repetition bound is
$ frac(1 + pi eta, e^(36 pi eta) - 1) < 2.5 dot.op 10^(- 10) . $

 The omitted target envelope sums over $f ∩ \[ 9 \, 21 \]$ and $T$ are less than $8.1 dot.op 10^(- 8)$ and $9.2
   dot.op 10^(- 29)$ respectively.]
  + #emph[The raw curvature envelope sums defined above have upper bounds
$ s & 0 & 1 & 2 & 14.5 & 23\
L & 1498 & 45.1 & 13.8 & 0.00458 & 0.000022\
upright("transformed constant") & 13530 & 151 & 31 & 0.00122 & 0.000004\
T & 26500 & 1160 & 800 & 800 & 800 $

 The divided Taylor remainder envelope is less than $0.00161$ when $m =
   1$ and less than $0.0000075$ at every other listed $m$, for both listed displacements $y$.]
  + #emph[For every $e in cal(E)$ and $0 lt.eq tau lt.eq 1$,
    the following polynomials have the stated strict lower bounds:
#[#set math.equation(numbering: n => "(26)")
 $ m \, y & upright("polynomial") & upright("lower bound")\
1 \, - 1 & T_2 & 0.174\
1 \, - 1 & Q_1 \/ \( 2 Z \) - T_1 & 0.057\
1 \, 1 & T_2 & 0.011\
3 \, med upright("either") & 0.8 Q_1 w - T_1 & 0.00055\
3 \, med upright("either") & T_2 & 0.00097\
4 \, med upright("either") & - T_1 & 0.00047\
4 \, med upright("either") & T_2 & 0.00097\
7 \, med upright("either") & - T_1 \, med T_2 & 0.0028\
9 \, med upright("either") & - T_1 \, med T_2 & 0.0039\
12 \, 13 \, med upright("either") & - T_1 \, med T_2 & 0.0020 $ <eq:finite-sign-tests>]

 For $m = y = 1$, put $v = tau$ and $B_0 = v^2$, $B_1 = v^2 + 2 Z v$, $B_2 = v^2 + 4 Z v + 6 Z^2$. Then
#[#set math.equation(numbering: n => "(27)")
 $ upright("polynomial") & upright("lower bound")\
Q_1 + v A & 0.046\
Q_1 \( v + Z \) + \( 2 B_1 A + B_0 D \) \/ 3 & 0.056\
Q_1 \( v + 2 Z \) + \( B_2 A + 2 B_1 D \) \/ 3 & 0.024\
Q_1 \( v + 3 Z \) + B_2 D & 0.027 $ <eq:exceptional-tests>]

 This last table holds uniformly for all allowed $w \, Delta \, r \, p$ and all pairs $\( a \, u \)$ with $0 lt.eq
   u lt.eq U_(*)$ and $0 lt.eq a lt.eq Z u$.]
] <lem:finite-certificate>

#proof[
  All quantities in the lemma are finite expressions in the constants, matrices, and polynomials defined above.
    Appendix 7 proves the stated inequalities by giving their exact evaluation recipes and a rigorous
    outward-rounded enclosure calculation. In particular, its Bernstein row bounds hold throughout the parameter
    polytope, not only at sampled points. ◻
]

The lemma is the finite computational input, not the conclusion of the construction.
  The next section proves the uniform frequency and all-node operator bounds and solves the infinite system.
  Section 6 then transfers the finite polynomial inequalities to the exact functions and proves their signs at
  every real radius.

== 5 The full infinite correction <sec:infinite>

The finite interpolant does not yet satisfy the equations at all positive nodes.
  We now control its interactions with the tail and correct its residual on the full summable coefficient space.
  The result needed for the sign argument is the following exact interpolation and approximation statement.

#thm([Proposition 5.1.])[
  (Exact interpolation and approximation).  #emph[For every $alpha gt.eq 1$,
    let $z$ and $e$ be its Gaussian parameter and data vector defined in Sections 3 and 4.
    Retain the fixed coefficients $c_(i \, 0) \, d_(i \, 0) \, C_i$ in (9). There are unique real coefficient lists
$ u_i in bb(R)^20 \, wide w_i in ell^1 \( T \; bb(R)^2 \) wide \( i = 1 \, 2 \) \, $

 indexed respectively by the pairs $\( c_(i \, n) \, d_(i \, n) \)$ on $f$ and $T$, for which the functions $J_i =
   e^(pi h s) F_i$ from that construction satisfy
$ J_1 \( n \) = G_z \( n \) \, quad J'_1 \( n \) = G'_z \( n \) \, wide J_2 \( n \) = J'_2 \( n \) =
  0 wide \( n in cal(N) \) . $

 Relative to the finite coefficient lists $A_i e$, they obey
#[#set math.equation(numbering: n => "(28)")
 $ parallel w_i parallel_1 < 3 dot.op 10^(- 9) \, wide parallel u_i - \( A_i e \)_f parallel_1 < 10^(- 5)
   wide \( i = 1 \, 2 \) . $ <analytic:individual-errors>]

 The resulting $F_i$ are real radial Schwartz functions with $hat(F)_1 = F_2$.
   Uniqueness concerns these coefficient lists with the prescribed fixed columns,
   not all radial Schwartz functions with the same interpolation data.]
] <prop:exact-interpolation>

We first bound the maps coupling the finite and tail lists,
  including the direct repetitions of the periodic columns.
  We then solve the full system by eliminating the finite variables and applying a Neumann series on the tail.
  Applying the same inverse to the finite interpolant’s residual will give the quantitative bounds (28).

=== 5.1 Bounds for the infinite coefficient maps <bounds-for-the-infinite-coefficient-maps>

We use the sum of absolute values on every coefficient list.
  For a matrix between such lists, the operator norm is the supremum of its absolute column sums.
  The same characterization holds for infinite matrices acting on $ell^1$:
  a uniform finite bound on all column sums gives absolute convergence of all matrix sums by Tonelli’s theorem,
  and a bounded operator follows first on finite lists and then by density.

We explain why the finite wave estimates control every tail node.
  For $k \, v in { h \, H }$ and $0 lt.eq t lt.eq 5 \/ 6$, let

$ X = X_k \( t \) \, quad ell = sqrt(X) \, quad d_b = pi sqrt(v^2 + \( B - 2 k v \) X) \, quad E_b =
  pi \( k X - v \) . $

Equation (16) gives $\| lambda_k \| = ell$ and $\| i pi zeta_(k \, v) \| = d_b$.
  The sum of the absolute values of the two entries in the jet correction (18) is therefore at most

#[#set math.equation(numbering: n => "(29)")
 $ psi_(k \, v \, n) \( t \) = frac(\( 1 + \| D_n \| + d_b \) ell, Q_n) e^(- E_b n) . $ <analytic:jet-envelope>]

Its use with atomic columns requires only summation over their atoms.
  For a tail column its value at the right endpoint $t_j$ bounds the whole frequency interval
  $\[ t_(j - 1) \, t_j \]$. Here is the monotonicity needed for that assertion.
  Since $B - 2 k v > 0$, the logarithmic derivative in $X$ of the increasing factor $\( 1 + \| D_n \| + d_b \)
  sqrt(X)$ is at most $1 \/ X$. The logarithmic derivative of the exponential contributes $- pi k n$. For $n gt.eq 1$,

$ 1 / X lt.eq frac(k^2 + 25 \/ 36, B) < 3 k < pi k n wide \( k = h \, H \) . $

The middle inequalities are direct rational inequalities at $k = 17 \/ 50 \, 27 \/ 50$.
  Thus (29) decreases in $X$ and increases in $t$ on the nonnegative frequency interval.
  Multiplication by the interval variation bounds $W_(j \, *)$ of the finite certificate therefore gives a valid
  bound without quadrature or sampling.

The real numbers $Q_n \, D_n$ are periodic with period $36$.
  If $T_0 = cal(N) ∩ \[ 25 \, 61 \)$, then every element of $T$ is uniquely $n +
  36 l$ with $n in T_0$ and $l gt.eq 0$. Consequently for each frequency entry the full tail sum is exactly
  bounded by the finite-period sum using

#[#set math.equation(numbering: n => "(30)")
 $ sum_(m in T) psi_(k \, h \, m) \( t \) = frac(sum_(n in T_0) psi_(k \, h \, n) \( t \), 1 - e^(- 36 E_b)) .
   $ <analytic:tail-geometric-sum>]

The denominator is positive by the decay established above.
  Together with the repeated-node norm (19), these formulas are the analytic justification of the finite-to-tail,
  tail-to-finite and tail-to-tail bounds in Lemma 7.

To express these estimates as operator bounds, measure coefficient corrections after removing the local damping
  and inverting the direct jet map (17). Finite lists lie in $bb(R)^20$, indexed by the coefficient pairs on $f$,
  and tail lists lie in $ell^1 \( T \; bb(R)^2 \)$. The map $cal(B)$ takes opposite-side tail lists to finite
  corrections; $cal(C)$ takes opposite-side finite trigonometric lists to tail corrections;
  and $cal(D)$ takes opposite-side tail lists to tail corrections.
  The map $cal(A)$ takes own-side finite trigonometric lists to direct repeated-node contributions on the tail.
  The equations below subtract these direct contributions. Finally,
  $cal(K)_(T \, V)$ takes a scalar constant-column coefficient to its transformed tail correction.

Integrating the row of (29) against the entrywise absolute atomic matrix $\| M \|$, the constant column $\| V \|$,
  or the tail variation matrix $W$, and adding the direct repetition bound, gives

#[#set math.equation(numbering: n => "(31)")
 $ parallel cal(B) parallel & < 340 \, & parallel cal(D) parallel & < 3 dot.op 10^(- 8) \,\
parallel cal(C) parallel + parallel cal(A) parallel & < beta :=
  3 dot.op 10^(- 10) \, & parallel cal(K)_(T \, V) parallel & < 1.3 dot.op 10^(- 7) . $ <analytic:block-bounds>]

The stated bound for $cal(C)$ and $cal(A)$ remains valid when the fixed trigonometric columns at zero are
  included. It follows from the stricter bounds $7 dot.op 10^(- 15)$ for the transformed columns and $2.5 dot.op
  10^(- 10)$ for the repetitions. There is no direct repetition map on the tail:
  each rational column has only one possible pole.

=== 5.2 Solving every interpolation equation <solving-every-interpolation-equation>

We adapt the finite-block and summable-tail elimination in #cite(label("SharpPlanar2026")) Lemma 3.3 and
  Proposition 3.4 and #cite(label("UniversalTriangular2026")) Proposition 4.1, proof,
  now including the own-side repetition map of the periodic finite columns.

With the coefficient lists $u_i \, w_i$ of Proposition 8 and the finite opposite-side coefficient-correction
  matrix $R$, the finite equations are

$ u_1 = R u_2 + cal(B) w_2 + r_1 \, wide u_2 = R u_1 + cal(B) w_1 + r_2 . $

Here $r_i$ collect the target data in finite coefficient coordinates and the coefficient corrections from the
  opposite-side transformed fixed columns. The tail equations have the form

$ w_1 = cal(C) u_2 + cal(D) w_2 - cal(A) u_1 + s_1 \, wide w_2 = cal(C) u_1 + cal(D) w_1 - cal(A) u_2 + s_2 . $

Each $s_i$ is the sum of the target data in tail coefficient coordinates and the corrections from transformed
  fixed columns, minus the repeated-node contribution from the fixed trigonometric columns at zero.
  It is summable: the fixed-column contributions are summable by (31),
  and the targets decay geometrically by (20) with $v = h$ on $T$ and $z > 0$.

For $epsilon in { 1 \, - 1 }$ define $u_epsilon = u_1 + epsilon u_2$ and $w_epsilon = w_1 + epsilon w_2$,
  and define $r_epsilon \, s_epsilon$ in the same manner. The two sides then separate exactly as

#[#set math.equation(numbering: n => "(32)")
 $ \( I - epsilon R \) u_epsilon - epsilon cal(B) w_epsilon & = r_epsilon \,\
\( I - epsilon cal(D) \) w_epsilon - \( epsilon cal(C) - cal(A) \) u_epsilon & = s_epsilon . $ <analytic:split-system>]

The own-side repeated-node map has the same minus sign for both $epsilon$;
  it does not exchange sides when the lists are subtracted.

Lemma 7 establishes

$ parallel \( I - R \)^(- 1) parallel < N_(+) := 17 \, wide parallel \( I + R \)^(- 1) parallel < N_(-) := 5 . $

Write $L_epsilon = \( I - epsilon R \)^(- 1)$. Eliminating the finite variables from (32) yields the tail equation

#[#set math.equation(numbering: n => "(33)")
 $ & \[ I - epsilon cal(D) - \( epsilon cal(C) - cal(A) \) L_epsilon epsilon cal(B) \] w_epsilon\
 & wide  = s_epsilon + \( epsilon cal(C) - cal(A) \) L_epsilon r_epsilon . $ <analytic:schur-tail>]

The operator subtracted from the identity has norm less than

$ delta + 340 beta N_epsilon \, wide delta = 3 dot.op 10^(- 8) \, $

which is less than one for both values of $epsilon$. The Neumann series therefore inverts this operator on the
  full Banach space $ell^1 \( T \; bb(R)^2 \)$ with norm at most

#[#set math.equation(numbering: n => "(34)")
 $ \( 1 - delta - 340 beta N_epsilon \)^(- 1) . $ <analytic:tail-inverse-bound>]

Recover $u_epsilon = L_epsilon \( r_epsilon + epsilon cal(B) w_epsilon \)$ and then take half-sums and
  half-differences. These reversible steps give the unique finite and summable tail lists.
  The spectral convergence in Section 3 makes their inputs and Fourier pair Schwartz functions,
  and (18)–(20) identify the solved equations with all positive-node jets.
  It remains to bound the correction to the finite interpolant.

=== 5.3 Error relative to the finite interpolant <error-relative-to-the-finite-interpolant>

Let $A_i e$ be the finite coefficient lists from the arithmetic construction, with no tail columns.
  They contain the same fixed coefficients as the exact lists,
  satisfy the finite equations with the truncated target $Y_f e$,
  and obey $parallel A_i e parallel_1 < 3$ for actual parameter data. Their omitted target residual has norm less than

$ d = 8.2 dot.op 10^(- 8) quad upright("on ") f \, wide 10^(- 26) quad upright("on ") T . $

Because the target appears only on side one, the same bound $d$ applies to each of the sum and difference
  residuals. The sum of the norms of the two finite trigonometric lists is less than six,
  so their total tail effect is less than $6 beta$. The constant columns cancel in the sum because $C_1 + C_2 =
  0$; in the difference their absolute coefficient is $\| C_1 - C_2 \| = 0.012$. Thus valid tail residual bounds are

$ d'_(+) = 10^(- 26) + 6 beta \, wide d'_(-) = 10^(- 26) + 6 beta + 0.012 \( 1.3 dot.op 10^(- 7) \) . $

Apply the same Schur elimination to the difference between the exact solution and this finite interpolant.
  From (33)–(34), its sum and difference errors are bounded on the tail by

#[#set math.equation(numbering: n => "(35)")
 $ e'_epsilon = frac(d'_epsilon + beta N_epsilon d, 1 - delta - 340 beta N_epsilon) \, $ <analytic:tail-error>]

and on the finite unknowns by

#[#set math.equation(numbering: n => "(36)")
 $ e_epsilon = N_epsilon \( d + 340 e'_epsilon \) . $ <analytic:finite-error>]

All constants here are rational. Direct rational evaluation gives

$ & e'_epsilon & e_epsilon\
epsilon = 1 & < 1.800004 dot.op 10^(- 9) & < 1.179803 dot.op 10^(- 5)\
epsilon = - 1 & < 3.360002 dot.op 10^(- 9) & < 6.122004 dot.op 10^(- 6) . $

Taking half the sum of the two bounds gives the individual estimates (28), completing the proof of Proposition 8.
  It is not necessary that either sum/difference finite bound be below $10^(- 5)$ separately;
  the individual side is controlled by their average. The same observation applies to the difference tail bound.
  These are the uniform error bounds used by the global sign argument.

== 6 Signs between the interpolation nodes <sec:global-signs>

We now pass from exact interpolation to the required signs on the entire half-line.
  The common mechanism is to remove the value and derivative at a positive interpolation node,
  so that each desired inequality becomes a comparison of second-order remainders.
  On the first seven positive-node cells, finite polynomial tests and a Gaussian comparison control these
  remainders. Farther out, the fixed terms $C_1 P = - .006 P$ and $C_2 P = .006
  P$ dominate the curvature of all remaining terms, including the infinite correction.
  Figure 1 shows these two ranges and the stronger intermediate sine-product bound needed to join them.

The comparison by deleted interpolation jets and Bernstein polynomial tests follows the sign-certification method
  of #cite(label("SharpPlanar2026")) Section 4, especially Section 4.2 and #cite(label("UniversalTriangular2026"))
  Sections 3.4–3.6 and 5.1–5.3, with the parameter and error bounds established here.

We use the functions $J_i = e^(pi h s) F_i$ constructed above and their finite approximations $tilde(J)_i$.
  Proposition 8 gives

#[#set math.equation(numbering: n => "(37)")
 $ J_1 \( m \) = G \( m \) \, quad J'_1 \( m \) = G' \( m \) \, wide J_2 \( m \) = J'_2 \( m \) =
   0 wide \( m in cal(N) \) \,\
G \( s \) = Q_1 z e^(\( 1 - s \) \/ z) \, wide 0 < z lt.eq Z = .391 . $ <eq:sign-exact-jets>]

Recall the deleted-jet remainder $U_m$ from (24). The exact jets give

#[#set math.equation(numbering: n => "(38)")
 $ G \( m + v \) - J_1 \( m + v \) & = v^2 #scale(x: 120%, y: 120%)[\(] U_m \[ G \] \( v \) -
   U_m \[ J_1 \] \( v \) #scale(x: 120%, y: 120%)[\)] \,\
J_2 \( m + v \) & = v^2 U_m \[ J_2 \] \( v \) . $ <eq:sign-deleted-identities>]

Thus, away from the node, it is enough to prove $U_m \[ J_1 \] lt.eq U_m \[ G \]$ and $U_m \[ J_2 \] gt.eq 0$.
  The integral formula in (24) also shows that a bound for $\| phi'' \| \/ 2$ along the segment from $m$ to $m +
  v$ bounds $\| U_m \[ phi \] \( v \) \|$ by the same number.
  This is why curvature bounds control the errors without losing the exact contact at a node.

On each side, the coefficient correction has $ell^1$ norm less than $10^(- 5)$ on $f$ and $3 dot.op
  10^(- 9)$ on $T$; the fixed coefficients at zero and the constant coefficient do not change.
  Each input list in the finite approximation has norm less than $3$.
  The finite norm bounds the Taylor truncation error, and the correction norms control the difference between the
  exact and finite deleted jets. Adding the finite and correction bounds will also control the remaining curvature
  in the unbounded range.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (11.22, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((11.22, 0), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  circle((0.34, 0), radius: 0.05292, fill: black, stroke: none)
  circle((1.02, 0), radius: 0.05292, fill: black, stroke: none)
  circle((1.36, 0), radius: 0.05292, fill: black, stroke: none)
  circle((2.38, 0), radius: 0.05292, fill: black, stroke: none)
  circle((3.06, 0), radius: 0.05292, fill: black, stroke: none)
  circle((4.08, 0), radius: 0.05292, fill: black, stroke: none)
  circle((4.42, 0), radius: 0.05292, fill: black, stroke: none)
  circle((5.44, 0), radius: 0.05292, fill: black, stroke: none)
  circle((6.46, 0), radius: 0.05292, fill: black, stroke: none)
  circle((7.14, 0), radius: 0.05292, fill: black, stroke: none)
  circle((8.5, 0), radius: 0.05292, fill: black, stroke: none)
  circle((9.18, 0), radius: 0.05292, fill: black, stroke: none)
  circle((9.52, 0), radius: 0.05292, fill: black, stroke: none)
  circle((10.54, 0), radius: 0.05292, fill: black, stroke: none)
  content((0.34, -0.1058), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((1.36, -0.1058), [#text(size: 9pt)[$4$]], anchor: "north", padding: 0.1176cm)
  content((2.38, -0.1058), [#text(size: 9pt)[$7$]], anchor: "north", padding: 0.1176cm)
  content((3.06, -0.1058), [#text(size: 9pt)[$9$]], anchor: "north", padding: 0.1176cm)
  content((4.42, -0.1058), [#text(size: 9pt)[$13$]], anchor: "north", padding: 0.1176cm)
  content((5.44, -0.1058), [#text(size: 9pt)[$16$]], anchor: "north", padding: 0.1176cm)
  content((6.46, -0.1058), [#text(size: 9pt)[$19$]], anchor: "north", padding: 0.1176cm)
  content((7.14, -0.1058), [#text(size: 9pt)[$21$]], anchor: "north", padding: 0.1176cm)
  content((8.5, -0.1058), [#text(size: 9pt)[$25$]], anchor: "north", padding: 0.1176cm)
  content((9.52, -0.1058), [#text(size: 9pt)[$28$]], anchor: "north", padding: 0.1176cm)
  content((10.54, -0.1058), [#text(size: 9pt)[$31$]], anchor: "north", padding: 0.1176cm)
  line((0, 0.62), (4.93, 0.62), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((4.93, 0.62), (7.82, 0.62), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10))
  line((7.82, 0.62), (10.88, 0.62), stroke: (paint: rgb("#808080"), thickness: 1.2pt, miter-limit: 10), mark: (end: ">"))
  line((4.93, -0.08), (4.93, 1.08), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((7.82, -0.08), (7.82, 1.08), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((2.465, 0.65), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[Finite tests + errors]]], anchor: "south", padding: 0.1176cm)
  content((6.375, 0.65), [#text(fill: rgb("#cc6600"))[#text(size: 9pt)[Larger sine bound]]], anchor: "south", padding: 0.1176cm)
  content((9.52, 0.65), [#text(size: 9pt)[Uniform sine bound]], anchor: "south", padding: 0.1176cm)
  content((4.93, 1.12), [#text(size: 9pt)[$14.5$]], anchor: "south", padding: 0.1176cm)
  content((7.82, 1.12), [#text(size: 9pt)[$23$]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: On the first seven positive-node cells, the finite tests combine with analytic error and Gaussian estimates to prove the signs on $\[ 0 \, 14.5 \]$. Beyond them, the direct sine-product term dominates the curvature of the remaining terms. The larger quadratic lower bound for $P$ on $\[ 14.5 \, 23 \]$ joins a uniform bound obtained by periodicity of $P$; the full interpolation functions need not be periodic. ],
) <fig:sign-ranges>

=== 6.1 Curvature and Taylor remainders <curvature-and-taylor-remainders>

For a direct wave after division by $e^(- pi h s)$, write its exponent as $w_a = i pi t - pi \( k - h \)$.
  For a transformed wave write $w_b = i pi zeta_(k \, h)$, with amplitude $lambda_k$. Set

$ d_a = \| w_a \| \, wide E_a = - "Re" w_a = pi \( k - h \) \,\
d_b = \| w_b \| \, wide E_b = - "Re" w_b = pi \( k X_k - h \) \,\
ell = \| lambda_k \| = sqrt(X_k) \, wide X_k = frac(B, k^2 + t^2) . $

Thus $d_a = pi sqrt(t^2 + \( k - h \)^2)$ and $d_b = pi sqrt(h^2 + \( B - 2 k h \) X_k)$.
  The decay rates $E_b$ are strictly positive, and $E_a gt.eq 0$.
  For a nonnegative row $g$ and a matrix $S$ of folded spectral coefficients, abbreviate $\[ g \, S \] =
  max_c sum_j g_j \| S_(j c) \|$.

#thm([Lemma 6.1.])[
  (Curvature envelopes).  #emph[Suppose that on each side the finite pole coefficients, indexed by $L$,
    have norm at most $a_L$, and the tail coefficients have norm at most $a_T$.
    The contribution of these coefficients to either $J_i$ has half its absolute second derivative bounded by $a_L
    cal(L) \( s_0 \) + a_T cal(T) \( s_0 \)$ for every $s gt.eq s_0$, where
#[#set math.equation(numbering: n => "(39)")
 $ s_0 & 0 & 1 & 2 & 14.5 & 23\
cal(L) \( s_0 \) & 1510 & 46 & 14 & .00465 & .000023\
cal(T) \( s_0 \) & 26500 & 1160 & 800 & 800 & 800 $ <eq:curvature-envelope-table>]

 The transformed constant column has half its absolute second derivative at most $.002$ per unit coefficient on $s
   gt.eq 14.5$.]
] <lem:curvature-envelopes>

#proof[
  Twice differentiating a wave gives modulus at most $d_a^2 e^(- s E_a)$ on the direct side and $d_b^2 ell
    e^(- s E_b)$ on the transformed side. The finite pole columns therefore contribute at most
  $ a_L / 2 #scale(x: 120%, y: 120%)[\(] \[ d_a^2 e^(- s_0 E_a) \, M \] + \[ d_b^2 ell e^(- s_0 E_b) \, M \]
    #scale(x: 120%, y: 120%)[\)] \, wide k = H . $
  The two terms account for the two input lists, each of norm at most $a_L$; there is no additional factor of two.
    The corresponding bound for the transformed constant column is $\[ d_b^2 ell e^(- s_0 E_b) \, V \] \/ 2$,
    with $k = h$. Lemma 7 bounds these finite sums. Increasing $s$ can only decrease their nonnegative exponential
    factors.
  For a tail column, the folded total variation is less than $119$, uniformly in its node.
    Since $k = h$, the direct derivative factor $pi^2 t^2$ is largest at $t = 5 \/ 6$.
    The transformed factor, apart from a positive constant, is
  $ \( h^2 + \( B - 2 h^2 \) X \) sqrt(X) thin e^(- pi \( h X - h \) s) . $
  At $s = 0$ it is increasing in $X$, so its maximum occurs at $t = 0$.
    For $s gt.eq 1$, its logarithmic derivative is at most
  $ frac(3, 2 X) - pi h s < 0 . $
  Indeed $X gt.eq B \/ \( h^2 + 25 \/ 36 \)$ and $3 \( h^2 + 25 \/ 36 \) \/ \( 2 B \) < pi h$.
    Consequently its maximum for $s gt.eq 1$ occurs at $t = 5 \/ 6$.
    Half the sum of the direct and transformed bounds is less than $60$ times the sum of these two maxima.
    The finite endpoint evaluations in Lemma 7 give the second row of (39).
    Uniform variation bounds justify differentiation and summation of the tail,
    so this estimate applies to its whole $ell^1$ coefficient list. ◻
]

We first apply these curvature bounds to the difference between the exact and finite deleted jets.
  The cells of the first seven #emph[positive] interpolation nodes, and their signed half-gap lengths, are

#[#set math.equation(numbering: n => "(40)")
 $ m & upright("cell") & upright("two values of ") y\
1 & \[ 0 \, 2 \] & - 1 \, med 1\
3 & \[ 2 \, 3.5 \] & - 1 \, med .5\
4 & \[ 3.5 \, 5.5 \] & - .5 \, med 1.5\
7 & \[ 5.5 \, 8 \] & - 1.5 \, med 1\
9 & \[ 8 \, 10.5 \] & - 1 \, med 1.5\
12 & \[ 10.5 \, 12.5 \] & - 1.5 \, med .5\
13 & \[ 12.5 \, 14.5 \] & - .5 \, med 1.5 $ <eq:near-cells>]

Each half-cell is $s = m + y tau$, $0 lt.eq tau lt.eq 1$. The first cell includes $s = 0$:
  its definition uses positive interpolation nodes, although $P$ itself also vanishes at zero.

#thm([Lemma 6.2.])[
  (Accuracy after deleting the jets).  #emph[Let $T_i \( tau \)$ be the degree-$20$ Taylor polynomial (25) for
    $U_m \[ tilde(J)_i \] \( y tau \)$. Uniformly for the cells in (40) and $0 lt.eq tau lt.eq 1$,
#[#set math.equation(numbering: n => "(41)")
 $ \| U_m \[ J_i \] \( y tau \) -
   T_i \( tau \) \| <
   cases(delim: "{", .018 \, & m = 1 \, med y = - 1 \,, .003 \, & m = 1 \, med y = 1 \,, .00016 \, & m gt.eq 3 .)
   $ <eq:deleted-jet-error>]

]
] <lem:deleted-jets>

#proof[
  For a wave $e^(w s)$, $"Re" w = - E$ and $\| w \| = d$, the deleted-jet expansion is
  $ U_m \[ e^(w dot.op) \] \( v \) = e^(w m) w^2 sum_(j gt.eq 0) frac(\( w v \)^j, \( j + 2 \) !) . $
  The first term omitted at degree $20$ has denominator $23 !$.
    For $\| v \| lt.eq \| y \|$, the remaining successive ratios are at most $\| y \| d \/ 24$.
    Hence the remainder is bounded by
  $ g \( d \, E \) = frac(d^2 \( \| y \| d \)^21, 23 !) frac(e^(- m E), 1 - \| y \| d \/ 24) . $
  Here $d_a < 3$ and $d_b lt.eq pi \( B \/ h - h \) < 12$: for $d_b$, use $B -
    2 k h > 0$ and maximize $X_k$ at $t = 0$. Since $\| y \| lt.eq 1.5$, the denominator is positive.
    Summing the wave bounds gives
  $ 3 #scale(x: 120%, y: 120%)[\(] \[ g \( d_a \, E_a \) \, M \] + \[ ell g \( d_b \, E_b \) \, M \]
    #scale(x: 120%, y: 120%)[\)] + .006
    #scale(x: 120%, y: 120%)[\(] \[ g \( d_a \, E_a \) \, V \] + \[ ell g \( d_b \, E_b \) \, V \]
    #scale(x: 120%, y: 120%)[\)] \, $
  where $k = H$ for $M$ and $k = h$ for $V$. By Lemma 7, this is less than $.002$ at $m =
    1$ and $.00001$ at the other nodes.
  The fixed coefficients cancel in $J_i - tilde(J)_i$. Lemma 9, the two correction norms,
    and (24) bound its deleted-jet contribution. The whole left half-cell at $1$ lies in $s gt.eq 0$,
    the right half-cell lies in $s gt.eq 1$, and every later cell lies in $s gt.eq 2$.
    Adding the Taylor remainder gives, respectively,
  $ 1510 dot.op 10^(- 5) + 26500 dot.op 3 dot.op 10^(- 9) + .002 & = .0171795 < .018 \,\
46 dot.op 10^(- 5) + 1160 dot.op 3 dot.op 10^(- 9) + .002 & = .00246348 < .003 \,\
14 dot.op 10^(- 5) + 800 dot.op 3 dot.op 10^(- 9) + .00001 & = .0001524 < .00016 . $
  ◻
]

=== 6.2 The Gaussian comparison near the first nodes <the-gaussian-comparison-near-the-first-nodes>

#thm([Lemma 6.3.])[
  #emph[For $G \( s \) = Q_1 z e^(\( 1 - s \) \/ z)$, $z > 0$, and every $m \, v$,
#[#set math.equation(numbering: n => "(42)")
 $ U_m \[ G \] \( v \) gt.eq
   Q_1 e^(\( 1 - m \) \/ z)
   cases(delim: "{", \( 2 z \)^(- 1) \, & v lt.eq 0 \,, frac(3 z + v, 6 z^2 + 4 z v + v^2) \, & v gt.eq 0 .)
   $ <eq:gaussian-divided-difference>]

 Both bounds have their continuous meaning at $v = 0$.]
] <lem:gaussian-divided-difference>

#proof[
  We have $G'' \( s \) = Q_1 z^(- 1) e^(\( 1 - s \) \/ z)$.
    If $v lt.eq 0$, insert $G'' \( m + t v \) gt.eq G'' \( m \)$ into (24). For $v gt.eq 0$, put $x = v \/ z$.
    The function
  $ q \( x \) = e^(- x) \( 6 + 4 x + x^2 \) - 6 + 2 x $
  satisfies $q \( 0 \) = q' \( 0 \) = 0$ and $q'' \( x \) = x^2 e^(- x) gt.eq 0$, and therefore is nonnegative. Since
  $ \( e^(- x) - 1 + x \) \( 6 + 4 x + x^2 \) - x^2 \( 3 + x \) = q \( x \) \, $
  division by $x^2 \( 6 + 4 x + x^2 \)$ and continuity at zero prove the claim. ◻
]

#thm([Proposition 6.4.])[
  (Global signs).  #emph[The exact interpolation functions satisfy
$ J_1 \( s \) lt.eq G \( s \) \, wide J_2 \( s \) gt.eq 0 wide \( s gt.eq 0 \) . $

]
] <prop:global-signs>

#proof[
  At an interpolation node the assertion follows from (37).
    Off the node, (38) reduces the assertion to the two deleted-jet comparisons.
  On the left half-cell at $1$, the polynomial tests (26) give $T_2 > .05$ and $Q_1 \/ \( 2 Z \) - T_1 > .05$.
    Since $z lt.eq Z$, Lemmas 10 and 11 leave a margin greater than $.05 - .018 = .032$ for each comparison.
    On the right half-cell at $1$, the side-two margin is greater than $.01 - .003 = .007$.
  At $m = 3$ the displacement satisfies $v lt.eq .5$. For $v gt.eq
    0$ the rational function $r \( z \, v \) = \( 3 z + v \) \/ \( 6 z^2 + 4 z v + v^2 \)$ decreases in both
    variables: the numerators of its partial derivatives are respectively $- 18 z^2 - 12 z v - v^2$ and $- 6 z^2 -
    6 z v - v^2$. Consequently
  $ r \( z \, v \) gt.eq r \( Z \, .5 \) = 836500 / 974643 > .8 . $
  For $v lt.eq 0$, $\( 2 z \)^(- 1) gt.eq \( 2 Z \)^(- 1) > .8$.
    Thus $U_3 \[ G \] \( v \) gt.eq .8 Q_1 w$, with $w = e^(- 2 \/ z)$.
    The tests at $3$, followed by (41), give a margin greater than $.0004 - .00016 = .00024$ for both signs.
    At each of the remaining nodes in (40), use $U_m \[ G \] gt.eq 0$, which follows from convexity,
    and the tests $T_2 > .0004$, $- T_1 > .0004$. The same margin applies.
  It remains to compare side one on the right half-cell at $1$.
    Here the Gaussian lower bound is rational in $z$, whereas $-
    T_1$ is affine in $z$ on each segment of the containing polytope.
    Multiplying their comparison by the positive quadratic denominator produces a cubic polynomial.
    Its four Bernstein coefficients are the reason for the four exceptional tests in (27).
  Write $v = tau in \[ 0 \, 1 \]$. Fix any allowed $w \, Delta \, r \,
    p$ and any pair $\( a \, u \)$ with $0 lt.eq u lt.eq U_(*)$ and $0 lt.eq a lt.eq Z u$.
    Let $A \( v \) \, D \( v \)$ denote $- T_1 \( v \)$ at the two endpoints $z = 0 \, Z$.
    Only the first component of $e = \( z \, 1 \, Z w - Delta \, w \, a \, u \, r \, p \)^(sans(T))$ changes when
    $z$ varies in this segment, so
  $ - T_1 \( v \) = \( 1 - z \/ Z \) A \( v \) + \( z \/ Z \) D \( v \) . $
  This affine interpolation concerns the finite test polynomial on the containing polytope;
    it does not interpolate the physical exponential data as functions of $z$.
  Put $cal(B) \( z \) = v^2 + 4 z v + 6 z^2$ and $B_0 = v^2$, $B_1 = v^2 + 2 Z v$, $B_2 = v^2 + 4 Z v + 6 Z^2$.
    By Lemmas 10 and 11, the desired comparison follows if
  $ Q_1 \( v + 3 z \) +
    cal(B) \( z \) #scale(x: 120%, y: 120%)[\(] \( 1 - z \/ Z \) \( A - .003 \) + \( z \/ Z \) \( D - .003 \)
    #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  Before the decrease by $.003$, the four degree-three Bernstein coefficients in $z \/ Z$ are
  $ & v \( Q_1 + v A \) \,\
 & Q_1 \( v + Z \) + \( 2 B_1 A + B_0 D \) \/ 3 \,\
 & Q_1 \( v + 2 Z \) + \( B_2 A + 2 B_1 D \) \/ 3 \,\
 & Q_1 \( v + 3 Z \) + B_2 D . $
  These follow by multiplying the quadratic Bernstein coefficients $\( B_0 \, B_1 \, B_2 \)$ by the linear
    coefficients $\( A \, D \)$ and elevating the linear term $Q_1 \( v + 3 z \)$ to degree three.
    They are exactly the expressions in (27), with the first expression multiplied by $v$.
    On $0 lt.eq v lt.eq 1$ we have $0 lt.eq B_0 lt.eq B_1 lt.eq B_2 lt.eq 3.481286 < 3.5$.
    After decreasing $A \, D$ by $.003$, the first coefficient is nonnegative,
    and is greater than $.017 v$ if $v > 0$; each of the other three remains greater than $.02 - .003 dot.op
    3.5 = .0095$. The Bernstein basis is nonnegative on $\[ 0 \, 1 \]$, proving the claim.
    At $v = 0$ its first coefficient vanishes, but the actual $z >
    0$ gives a positive weight to at least one of the other coefficients.
    Also $cal(B) \( z \) > 0$ for the actual $z > 0$, so division by $cal(B) \( z \)$ is legitimate.
    This completes the comparison on the exceptional half-cell.
    Equation (38) and the cell coverage prove the assertion through $s = 14.5$. ◻
]

=== 6.3 The sine product and the unbounded range <the-sine-product-and-the-unbounded-range>

We next turn the finite midpoint bounds into a lower bound for $P$ between every pair of consecutive zeros.

#thm([Lemma 6.5.])[
  (Sine-product lower bound).  #emph[If $m$ is a nearest zero of $P$ to $s$ and $s eq.not m$, then
$ P \( s \) > .054 \( s - m \)^2 . $

 For $14.5 lt.eq s lt.eq 23$, choose a nearest node from ${ 16 \, 19 \, 21 }$; if $s eq.not m$,
   then $P \( s \) > 3 \( s - m \)^2$.]
] <lem:sine-barrier>

#proof[
  The residues in $I$ are distinct modulo $36$, so every zero $m$ is double,
    and $P \( s \) \/ \( s - m \)^2$ has positive removable value $Q_m$ at $m$.
    On each half-gap from $m$ to an adjacent gap midpoint, this quotient is positive and log-concave.
    Indeed, the logarithmic second derivative of each ordinary sine-square factor is $-
    2 kappa^2 csc^2 \( kappa \( s - a \) \)$. The factor whose zero is divided out contributes
  $ 2 #scale(x: 120%, y: 120%)[\(] \( s - m \)^(- 2) - kappa^2 csc^2 \( kappa \( s - m \) \)
    #scale(x: 120%, y: 120%)[\)] lt.eq 0 \, $
  using $\| sin x \| lt.eq \| x \|$. Continuity gives the log-concave extension at $m$.
    Concavity of the logarithm now bounds the quotient below by the smaller of its two endpoint values.
  Lemma 7 gives $Q_m > .157$, uniformly by periodicity. The lower bounds at the consecutive midpoints in one
    period are as follows; the quotient uses either adjacent node.
  $ upright("midpoint") & upright("bound") & upright("midpoint") & upright("bound") & upright("midpoint") &
    upright("bound")\
.5 & .165 & 10.5 & 1.11 & 23 & 19.08\
2 & .120 & 12.5 & .337 & 26 & 2.34\
3.5 & .054 & 14.5 & 3.13 & 27.5 & .706\
5.5 & .482 & 17.5 & 9.26 & 29.5 & 6.80\
8 & .656 & 20 & 8.19 & 33.5 & 14.1 $
  Every entry exceeds or equals $.054$, with a strict inequality for the actual quotient,
    proving the global bound. For the specified part of the period, the relevant midpoints are $14.5 \, 17.5 \,
    20 \, 23$, whose bounds all exceed $3$; the node values $Q_16 \, Q_19 \, Q_21$ exceed $16$.
    The same half-gap argument therefore gives the stronger bound. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 12.] Write $J_i = C_i P + J_i^0$.
    Removing the direct constant column does not change the positive-node jets, since $P \( m \) = P' \( m \) =
    0$. For $14.5 lt.eq s lt.eq 23$ choose a nearest node as follows:
    $m = 16$ on $\[ 14.5 \, 17.5 \]$, $m = 19$ on $\[ 17.5 \, 20 \]$, and $m = 21$ on $\[ 20 \, 23 \]$.
    Either choice works at an internal tie; at the external endpoints choose $16$ at $14.5$ and $21$ at $23$.
    The entire segment joining $s$ to $m$ then stays in $\[ 14.5 \, 23 \]$.
    If $s > 23$, every nearest node has $m gt.eq 25$, and the joining segment stays strictly above $23$.
  The finite pole lists have norm less than $3 + 10^(- 5) < 3.01$ on each side,
    and the tail lists have norm less than $3 dot.op 10^(- 9)$.
    The transformed constant column remains in $J_i^0$, with coefficient of magnitude $.006$.
    Lemma 9 therefore bounds $\| \( J_i^0 \)'' \| \/ 2$ throughout the appropriate segment by
  $ K = 3.01 q + 800 dot.op 3 dot.op 10^(- 9) + .006 dot.op .002 \, wide q =
    cases(delim: "{", .00465 \, & 14.5 lt.eq s lt.eq 23 \,, .000023 \, & s > 23 .) $
  The exact numerical comparisons with the sine-product barrier are
  $ upright("range") & K & .006 thin P \( s \) \/ \( s - m \)^2 upright(" exceeds") & upright("remaining margin")\
 & .0140109 & .018 & .0039891\
\( 23 \, oo \) & .00008363 & .000324 & .00024037 $
  for $s eq.not m$, by Lemma 13. On side two, the zero jets and (24) imply
  $ J_2 \( s \) = .006 P \( s \) + \( s - m \)^2 U_m \[ J_2^0 \] \( s - m \) gt.eq .006 P \( s \) -
    K \( s - m \)^2 gt.eq 0 . $
  On side one, convexity of $G$ and the matching jets give
  $ J_1 \( s \) & = - .006 P \( s \) + G \( m \) + \( s - m \) G' \( m \) + \( s - m \)^2 U_m \[ J_1^0 \] \( s - m \)\
 & lt.eq G \( s \) - .006 P \( s \) + K \( s - m \)^2 lt.eq G \( s \) . $
  At a node the inequalities are the exact interpolation identities.
    The preceding argument treats every later gap, including all nodes outside the finite system,
    and completes the proof on $\[ 0 \, oo \)$. ◻
]

=== 6.4 Normalization and completion of the theorems <normalization-and-completion-of-the-theorems>

Finally $Q_1 z e^(1 \/ z) > 0$ and, because $s = b \| x \|^2$ and $z^(- 1) = pi \( alpha \/ b - h \)$,

$ frac(e^(- pi h s) G \( s \), Q_1 z e^(1 \/ z)) = e^(- pi alpha \| x \|^2) . $

Thus $f_alpha = F_1 \/ \( Q_1 z e^(1 \/ z) \)$ is the claimed Gaussian minorant for $alpha gt.eq 1$.
  Its Fourier transform is $F_2 \/ \( Q_1 z e^(1 \/ z) \) gt.eq 0$,
  and its contact and Fourier-zero conditions follow from the exact positive-node jets.
  Every nonzero squared-radius coordinate of $A$ or $A^(*)$ belongs to $cal(N)$;
  the exact positive-node jets therefore supply every contact required by (1).
  This proves that input for every $alpha gt.eq 1$. Lemma 3 completes Theorem 2 for all $alpha > 0$,
  and the deduction in Section 2 completes Theorem 1.

== 7 Exact evaluation of the finite certificate <app:finite-certificate>

This appendix supplies the arithmetic proof of Lemma 7. All its quantities retain the definitions in Section 4;
  the continuous operator and sign arguments remain in Sections 5 and 6.

#proof[
  We give the finite recipes and justify the enclosure arithmetic.
    They provide a reproducible certificate for every inequality in the lemma; the accompanying Python checker,
    #raw("verification/check_certificate.py"), implements exactly these recipes using integers and assertions.
    No floating-point arithmetic, spatial mesh, Gaussian-parameter subdivision, or frequency quadrature is used.
  First form the Laurent coefficients from
  $ product_(a in I) #scale(x: 120%, y: 120%)[\(] 2 - e^(- i pi a \/ 18) X -
    e^(i pi a \/ 18) X^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  Ordinary convolution stores degrees $- 15 \, dots.h \, 15$; the entries at array indices $15 \, dots.h \,
    30$ are $P_0 \, dots.h \, P_15$. For $p_j = P_j e^(i pi t_j n)$, compute
  $ Q_n = "Re" sum_(j = 0)^15 p_j \( i pi t_j \)^2 \, wide D_n =
    frac("Re" sum_(j = 0)^15 p_j \( i pi t_j \)^3, 3 Q_n) . $
  The missing factor two from folding cancels the factors $2$ and $6$ in $P'' \( n \) = 2 Q_n$ and $P''' \( n \) =
    6 Q_n D_n$, respectively. All node quantities repeat with period $36$. Equations (11)–(11) give $M \, V$.
    At a gap midpoint $s = \( a + a' \) \/ 2$, the required ratio is evaluated as $4 "Re" sum_j V_j
    e^(i pi t_j s) \/ \( a' - a \)^2$.
  Construct $R_0 \, R$ by (21). On each augmented matrix $\( I minus.plus R divides I \)$,
    use diagonal-order Gauss–Jordan elimination. All pivot intervals exclude zero and meet the stated bounds.
    The right half encloses the inverse, so its maximum absolute column sum certifies the inverse-norm bounds.
    Form $A_i$ by (23). For the bound on $parallel A_i e parallel$,
    the first two columns are combined before taking absolute values:
    their norm is a convex function of $z$, so its maximum on $\[ 0 \, Z \]$ occurs at $0$ or $Z$.
    Bound the other column contributions separately using
  $ \( \| e_3 \| \, \| e_4 \| \, \| e_5 \| \, \| e_6 \| \, \| e_7 \| \, \| e_8 \| \)
    lt.eq \( 0.0024 \, W_(*) \, Z U_(*) \, U_(*) \, P_(*) \, P_(*) \) . $
  Here $\| Z w - Delta \| lt.eq max \( Z W_(*) \, Delta_(*) \) < 0.0024$.
  For explicit polynomial rows, put $w_a = i pi \( t_j + i \( k - h \) \)$ and $w_b =
    i pi zeta_(k \, h) \( t_j \)$. For each $\( k \, S \) = \( H \, M \) \, \( h \, V \)$ start with
  $ a_0 = w_a^2 e^(m w_a) \/ 2 \, quad b_0 = w_b^2 e^(m w_b) lambda_k \/ 2 \, wide a_(r + 1) =
    y w_a a_r \/ \( r + 3 \) \, quad b_(r + 1) = y w_b b_r \/ \( r + 3 \) . $
  If $A_i^S$ denotes the rows belonging to $S$, the degree-$r$ row acting on $e$ in $T_i$ is the sum over these
    two matrices and the frequencies of
  $ "Re" #scale(x: 120%, y: 120%)[\(] a_r \( S A_i^S \)_j + b_r \( S A_(3 - i)^S \)_j #scale(x: 120%, y: 120%)[\)] . $
  Constants in the tests are added to column $2$, and a multiple of $w$ to column $4$.
    To produce the exceptional polynomials, substitute $z = 0 \,
    Z$ in the negative side-one rows by adding column $1$ times the chosen endpoint to column $2$,
    then zeroing column $1$. Multiplication by $tau$ or $tau^2$ shifts the power rows.
  We use the standard power-to-Bernstein conversion and coefficient range enclosure;
    see #cite(label("TitiGarloff2019")) Section 3, equations (9)–(10).
    For a degree-$N$ power-row array $t_0 \, dots.h \, t_N$, the Bernstein rows are
  #[#set math.equation(numbering: n => "(43)")
   $ b_i = sum_(r = 0)^i binom(i, r) / binom(N, r) t_r \, wide 0 lt.eq i lt.eq N . $ <eq:bernstein-row-conversion>]
  This follows from $tau^r = sum_(i = r)^N binom(i, r) binom(N, r)^(- 1) binom(N, i) tau^i \( 1 - tau \)^(N - i)$.
    Use $N = 20$ for (26) and $N = 22$ for (27), padding with zero rows when necessary.
    For any scalar row $\( b \, c \, l \, d \, k \, j \, n \, r \)$, its exact minimum on $cal(E)$ is
  #[#set math.equation(numbering: n => "(44)")
   $ & c + Z min \( b \, 0 \) + W_(*) min \( d + Z l \, 0 \) + Delta_(*) min \( - l \, 0 \)\
 & wide + U_(*) min \( 0 \, j \, j + Z k \) + P_(*) #scale(x: 120%, y: 120%)[\(] min \( n \, 0 \) +
   min \( r \, 0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:polytope-row-minimum>]
  Indeed the free $z \, w \, Delta \, r \, p$ coordinates minimize independently, and the triangle $0 lt.eq
    u lt.eq U_(*)$, $0 lt.eq a lt.eq
    Z u$ has vertices $\( a \, u \) = \( 0 \, 0 \) \, \( 0 \, U_(*) \) \, \( Z U_(*) \, U_(*) \)$.
    Applying (44) to every Bernstein row gives the displayed tables,
    since the Bernstein basis is nonnegative and sums to one on $\[ 0 \, 1 \]$.
  The ordinary table comprises $27$ degree-$20$ polynomial tests on the $14$ signed half-cells:
    side two on every half-cell and side one on all but the right half-cell at $1$.
    There are $21$ Bernstein rows per test. The four exceptional tests have degree at most $22$ and use $23$ rows
    each. Thus the sign tables require $27 dot.op 21 + 4 dot.op 23 = 659$ row minima,
    each over the full stated polytope, not values at sampled parameter points.
  We finally justify rigorous evaluation of these finite expressions.
    Represent each real interval by two integers divided by $10^60$.
    After addition, multiplication, division, and integer powers,
    round the lower endpoint downward and the upper endpoint upward.
    Multiplication takes the minimum and maximum of all four endpoint products.
    Reciprocal endpoints are reversed, and reciprocation is performed only when zero is excluded.
    Square roots are enclosed by integer square roots of the scaled endpoints;
    a negative lower endpoint is clipped to zero only when the quantity being square-rooted is known nonnegative.
    Complex intervals are rectangles with these real component intervals.
    For minima and maxima, apply the operation separately to lower and upper endpoints.
    These operations enclose their exact real or complex results, regardless of dependencies among arguments.
  The interval for $pi$ is
  $ 3.14159265358979323846264338327950288419716939937510 + \[ 0 \, 10^(- 50) \] . $
  It is checked using $16 arctan \( 1 \/ 5 \) - 4 arctan \( 1 \/ 239 \)$ and the alternating series through power
    $81$. The total omitted absolute error is less than $16 \/ \( 83 dot.op 5^83 \) +
    4 \/ \( 83 dot.op 239^83 \) < 10^(- 58)$; the Machin identity follows directly from the tangent addition
    formula and the angles’ location in $\( 0 \, pi \/ 2 \)$.
    To enclose $e^w$, divide $w$ by $1024$, checking $\| w \/ 1024 \| lt.eq 1$.
    Sum its Taylor terms through degree $60$, add $\[ - 10^(- 60) \, 10^(- 60) \]$ to each real component used,
    then square ten times. The omitted complex-modulus error is at most $2 \/ 61 ! < 10^(- 60)$,
    so this process encloses $e^w$. Integer phase arguments for $e^(i pi n \/ 18)$ are reduced modulo $36$.
  Interval Gauss–Jordan elimination is sound by induction: each exact pivot lies in its computed interval,
    each allowed division preserves inclusion, and each subsequent row operation does likewise.
    Entries known algebraically to be zero or one after an elimination step may be set to those exact values.
    Thus no approximate inverse is silently treated as exact.
    Each threshold comparison made by the checker’s #raw("lt") helper compares the upper endpoint of the smaller
    quantity with the lower endpoint of the larger; separate assertions enforce the interval, type, pivot,
    and range preconditions. Every asserted strict comparison succeeds with this fixed precision.
    This certifies the finite inequalities in the lemma. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Serge Bernstein. Sur les fonctions absolument monotones. , 52:1--66, 1929.
  #link("https://doi.org/10.1007/BF02592679")[doi:10.1007/BF02592679].]
#bibitem([2])[Emanuel Carneiro, Friedrich Littmann, and Jeffrey~D. Vaaler.
  Gaussian subordination for the Beurling--Selberg extremal problem. , 365(7):3493--3534, 2013.
  #link("https://doi.org/10.1090/S0002-9947-2013-05716-9")[doi:10.1090/S0002-9947-2013-05716-9].]
#bibitem([3])[J.~W.~S. Cassels. On a problem of Rankin about the Epstein zeta-function. , 4(2):73--80, 1959.
  See corrigendum, volume 6 (1963), page 116, and the 1964 corrections by Ennola and Diananda.
  #link("https://doi.org/10.1017/S2040618500033906")[doi:10.1017/S2040618500033906].]
#bibitem([4])[J.~W.~S. Cassels. Corrigendum. , 6(2):116, 1963.
  Corrigendum to "On a problem of Rankin about the Epstein zeta-function".
  #link("https://doi.org/10.1017/S2040618500034833")[doi:10.1017/S2040618500034833].]
#bibitem([5])[Henry Cohn and Matthew de~Courcy-Ireland. . , 167(13):2417--2455, 2018.
  #link("https://doi.org/10.1215/00127094-2018-0018")[doi:10.1215/00127094-2018-0018].]
#bibitem([6])[Henry Cohn and Noam Elkies. . , 157(2):689--714, 2003.
  #link("https://doi.org/10.4007/annals.2003.157.689")[doi:10.4007/annals.2003.157.689].]
#bibitem([7])[Henry Cohn and Abhinav Kumar. . , 20(1):99--148, 2007.
  #link("https://doi.org/10.1090/S0894-0347-06-00546-7")[doi:10.1090/S0894-0347-06-00546-7].]
#bibitem([8])[Henry Cohn, Abhinav Kumar, Stephen~D. Miller, Danylo Radchenko, and Maryna Viazovska. . ,
  196(3):983--1082, 2022. #link("https://doi.org/10.4007/annals.2022.196.3.3")[doi:10.4007/annals.2022.196.3.3].]
#bibitem([9])[Henry Cohn and Stephen~D. Miller. Some properties of optimal functions for sphere packing in
  dimensions $8$ and $24$, 2016. Version 1, March 15, 2016. #link("https://arxiv.org/abs/1603.04759v1").]
#bibitem([10])[P.~H. Diananda. Notes on two lemmas concerning the Epstein zeta-function. , 6(4):202--204, 1964.
  #link("https://doi.org/10.1017/S2040618500035036")[doi:10.1017/S2040618500035036].]
#bibitem([11])[M.~J. Dubourdieu. Sur un théorème de M. S.
  Bernstein relatif à la transformation de Laplace-Stieltjes. , 7:96--111, 1940.
  #link("https://www.numdam.org/item/CM_1940__7__96_0/").]
#bibitem([12])[Veikko Ennola. A lemma about the Epstein zeta-function. , 6(4):198--201, 1964.
  #link("https://doi.org/10.1017/S2040618500035024")[doi:10.1017/S2040618500035024].]
#bibitem([13])[Markus Faulhuber, Irina Shafkulovska, and Ilia Zlotnikov. . , 11:664--679, 2024.
  #link("https://doi.org/10.1090/bproc/247")[doi:10.1090/bproc/247].]
#bibitem([14])[Douglas~P. Hardin and Nathaniel~J. Tenpas.
  Universally optimal periodic configurations in the plane. , 2025. Paper No. 26, 63 pp.
  #link("https://doi.org/10.19086/da.144978")[doi:10.19086/da.144978].]
#bibitem([15])[Thomas Leblé. The hexagonal lattice is universally locally optimal, 2025.
  Version 1, submitted November 5, 2025. #link("https://arxiv.org/abs/2511.03353v1").]
#bibitem([16])[Hugh~L. Montgomery. . , 30(1):75--85, 1988.
  #link("https://doi.org/10.1017/S0017089500007047")[doi:10.1017/S0017089500007047].]
#bibitem([17])[OpenAI. .
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/A-sharp-Fourier-certificate-for-planar-circle-packing-September-23-2026/paper.pdf")[OAI:A-sharp-Fourier-certificate-for-planar-circle-packing-September-23-2026],
  2026.]
#bibitem([18])[OpenAI. .
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Universal-optimality-of-the-triangular-lattice-September-23-2026/paper.pdf")[OAI:Universal-optimality-of-the-triangular-lattice-September-23-2026],
  2026.]
#bibitem([19])[Danylo Radchenko and Maryna Viazovska. Fourier interpolation on the real line. , 129:51--81, 2019.
  #link("https://doi.org/10.1007/s10240-018-0101-z")[doi:10.1007/s10240-018-0101-z].]
#bibitem([20])[R.~A. Rankin. A minimum problem for the Epstein zeta-function. , 1(4):149--158, 1953.
  #link("https://doi.org/10.1017/S2040618500035668")[doi:10.1017/S2040618500035668].]
#bibitem([21])[Naser Talebizadeh~Sardari. Higher Fourier interpolation on the plane, 2021. Version 2, May 4, 2021.
  #link("https://arxiv.org/abs/2102.08753v2").]
#bibitem([22])[Jihad Titi and Jürgen Garloff. Matrix methods for the tensorial Bernstein form. ,
  346:254--271, 2019. #link("https://doi.org/10.1016/j.amc.2018.08.049")[doi:10.1016/j.amc.2018.08.049].]
#bibitem([23])[D.~V. Widder. Necessary and sufficient conditions for the representation of a function as a Laplace
  integral. , 33(4):851--892, 1931.
  #link("https://doi.org/10.1090/S0002-9947-1931-1501621-6")[doi:10.1090/S0002-9947-1931-1501621-6].]

#bibliography("refs.bib", style: "ieee", title: [References])
