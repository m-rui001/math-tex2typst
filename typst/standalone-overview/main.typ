#set page(paper: "us-letter", margin: (left: 59.5pt, right: 59.5pt, top: 56.7pt, bottom: 56.7pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[standalone-overview]]
#align(center)[]
#align(center)[]

#smallcaps[Mathematics OpenAI]

#strong[OpenAI Research Catalog]

372 result families in 722 manuscripts October 6, 2026

An overview of the #link("https://github.com/openai/math")[manuscript collection].
  Results are grouped by subject; entry numbers follow the catalog order and do not indicate a ranking.
  PDF links follow each summary.

#strong[Contents]

#link(<subject1>)[Number theory]#context counter(page).at(<subject1>).first()

#link(<subject3>)[Algebraic and complex geometry]#context counter(page).at(<subject3>).first()

#link(<subject10>)[Real and complex analysis]#context counter(page).at(<subject10>).first()

#link(<subject8>)[Convex and metric geometry]#context counter(page).at(<subject8>).first()

#link(<subject14>)[Theoretical computer science]#context counter(page).at(<subject14>).first()

#link(<subject12>)[Dynamical systems and ergodic theory]#context counter(page).at(<subject12>).first()

#link(<subject13>)[Combinatorics]#context counter(page).at(<subject13>).first()

#link(<subject2>)[Algebra]#context counter(page).at(<subject2>).first()

#link(<subject15>)[Probability and statistical mechanics]#context counter(page).at(<subject15>).first()

#link(<subject6>)[Mathematical logic]#context counter(page).at(<subject6>).first()

#link(<subject5>)[Group theory]#context counter(page).at(<subject5>).first()

#link(<subject17>)[Mathematical physics]#context counter(page).at(<subject17>).first()

#link(<subject16>)[Operator algebras]#context counter(page).at(<subject16>).first()

#link(<subject4>)[Topology]#context counter(page).at(<subject4>).first()

#link(<subject11>)[Functional analysis]#context counter(page).at(<subject11>).first()

#link(<subject7>)[Differential geometry]#context counter(page).at(<subject7>).first()

#link(<subject9>)[Partial differential equations]#context counter(page).at(<subject9>).first()

#metadata(none)
#label("subject1")

#strong[Number theory]

#metadata(none)
#label("result001")

#strong[001.Milne’s rationality conjecture.]Proves Milne’s rationality conjecture for abelian varieties over
  $overline(bb(Q))$ with good reduction: specialized Hodge classes pair rationally with complementary divisor
  products, independently of cohomology theory. Together with result 032,
  every specialized Hodge class is represented by a single rational algebraic cycle simultaneously in all
  prime-to-$p$ and crystalline realizations, for every residue characteristic $p$.

#metadata(none)
#label("result002")

#strong[002.The full Birch–Swinnerton-Dyer formula in Selmer coranks zero and one.]Proves the full
  Birch–Swinnerton-Dyer leading-term formula for every elliptic curve over $bb(Q)$ whose full $q$-power Selmer
  group has corank zero or one for some prime $q$, including finiteness of the Tate–Shafarevich group.
  With result 006, this gives full BSD for a density-one set of quadratic twists of every elliptic curve over $bb(Q)$.

#metadata(none)
#label("result003")

#strong[003.The quasi-Riemann hypothesis.]Proves that every Dirichlet $L$-function, including $zeta \( s \)$,
  is zero-free in $Re s > 7 \/ 8$, resolving the quasi-Riemann hypothesis.
  The same half-plane is zero-free for every finite-order Hecke $L$-function over $bb(Q) \( sqrt(- 3) \)$.
  A companion gives a different proof of the zero-free half-plane $Re s > 11 \/ 12$.

#metadata(none)
#label("result004")

#strong[004.Hilbert’s tenth problem over $bb(Q)$.]Proves that no algorithm decides whether an integer-coefficient
  polynomial in an arbitrary number of variables has a rational zero,
  resolving Hilbert’s tenth problem over $bb(Q)$ negatively.

#metadata(none)
#label("result005")

#strong[005.Irrationality of Catalan’s constant.]Proves that Catalan’s constant $G =
  sum_(j gt.eq 0) \( - 1 \)^j \/ \( 2 j + 1 \)^2$ is irrational.

#metadata(none)
#label("result006")

#strong[006.Goldfeld’s conjecture.]Proves Goldfeld’s conjecture for quadratic twists of every elliptic curve over
  $bb(Q)$: analytic ranks zero and one each have density $1 \/ 2$, and the mean analytic rank tends to $1 \/ 2$.
  Both statements order signed squarefree twist parameters by absolute value.

#metadata(none)
#label("result007")

#strong[007.Two-point Chowla and the corrected binary Elliott conjecture.]Proves the ordinary two-point Chowla
  conjecture, with a bound $O \( X \/ \( log X \)^c \)$ for Liouville correlation sums along fixed nonproportional
  affine forms, where $c > 0$ is absolute. More generally, proves the binary corrected Elliott conjecture for
  complex multiplicative functions bounded by one when one factor is uniformly nonpretentious against each fixed
  Dirichlet character times $n^(i t)$ for $\| t \| lt.eq X$.

#metadata(none)
#label("result008")

#strong[008.The Deligne–Drinfeld conjecture.]Proves that the rational Grothendieck–Teichmüller Lie algebra,
  with the Ihara bracket, is freely generated by one element in each odd weight $3 \, 5 \, 7 \, dots.h$,
  resolving the Deligne–Drinfeld conjecture.

#metadata(none)
#label("result009")

#strong[009.Bogomolov–Pop and Milnor $K$-theoretic reconstruction.]Reconstructs function fields of transcendence
  degree at least two over algebraically closed constants from $K_1^(upright(M)) \/ ell$,
  $K_2^(upright(M)) \/ ell$, and their product. These data recover the perfect closure and constants when $ell$
  differs from the characteristic, and the original field and its named base in equal characteristic.
  Also proves Bogomolov–Pop reconstruction from abelian-by-central pro-$ell$ Galois data away from the characteristic.

#metadata(none)
#label("result010")

#strong[010.Fontaine–Mazur modularity at the prime $2$ and $2$-adic pro-modularity.]Every continuous odd
  absolutely irreducible two-dimensional $2$-adic representation of $G_(bb(Q))$ unramified outside finitely many
  primes occurs in a completed Hecke algebra at some odd tame level.
  Also proves classical modularity up to Tate twist for irreducible odd representations with these finiteness
  conditions that are de Rham at $2$ with distinct Hodge–Tate weights,
  resolving the dyadic Fontaine–Mazur case without residual restrictions.

#metadata(none)
#label("result011")

#strong[011.The Ford–Konyagin–Luca conjecture on prime predecessors.]Proves that the normalized ordered logarithms
  of the prime factors of $p - 1$, counted with multiplicity,
  converge jointly to the Poisson–Dirichlet law $upright("PD") \( 1 \)$ as $p$ ranges uniformly over primes up to
  $x$ and $x arrow.r oo$. This resolves the Ford–Konyagin–Luca conjecture.
  It also proves that infinitely many integers $n$ have more than $n^(1 - epsilon)$ totient preimages,
  for every $epsilon > 0$.

#metadata(none)
#label("result012")

#strong[012.Independent largest prime factors of consecutive integers.]Resolves the Erdős–Pomerance joint Dickman
  conjecture: the logarithmic sizes of the largest prime factors of $n$ and $n +
  1$ are asymptotically independent in ordinary natural density.
  In particular, the integers satisfying $P^(+) \( n \) < P^(+) \( n + 1 \)$ have density $1 \/ 2$.

#metadata(none)
#label("result013")

#strong[013.Ostmann’s inverse Goldbach conjecture.]Proves that no finite modification of the primes can be written
  as $A + B$ with $A \, B subset.eq bb(Z)_(gt.eq 0)$ each containing at least two elements.
  This resolves Ostmann’s inverse Goldbach conjecture on additive indecomposability.

#metadata(none)
#label("result014")

#strong[014.Restricted geometric Langlands, generic Ramanujan and Arthur parameters.]Proves the restricted
  geometric Langlands equivalence for connected reductive groups on smooth projective connected curves over
  $overline(bb(F))_q$ under the four stated Lie-theoretic characteristic hypotheses.
  Over arbitrary algebraically closed fields of characteristic $p > 0$,
  the same conclusion holds assuming additionally that $p$ is very good for the group and $p divides.not \|
  W_G \|$. Over global function fields, proves Ramanujan at every place for globally generic cuspidal
  representations of split adjoint absolutely simple exceptional groups,
  without characteristic or ramification-depth restrictions,
  and at every unramified place for cuspidal representations of split adjoint absolutely simple groups with a
  generic unramified component. Assuming the finite-level Ramanujan–Arthur decomposition,
  constructs global Arthur enhancements of occurring cuspidal excursion parameters for split connected semisimple
  groups at full finite level, recovering the given parameters by diagonal specialization on the entire Weil
  group, including inertia.

#metadata(none)
#label("result015")

#strong[015.Torus-packet equidistribution in prime, quartic,
  and sextic degrees.]Proves Haar equidistribution without escape of mass for complete volume-weighted torus
  packets from totally real fields: arbitrary lattices and prescribed local types in fixed prime degree at least
  five, arbitrary-order Picard packets in primitive quartic fields,
  and maximal-order ideal-class packets in primitive sextic fields.
  Here primitive means having no proper intermediate field; the relevant order or field discriminant tends to infinity.

#metadata(none)
#label("result016")

#strong[016.Zilber–Pink in abelian varieties and the Siegel threefold.]Proves the abelian Zilber–Pink conjecture
  over $overline(bb(Q))$: every irreducible subvariety has finitely many maximal atypical subvarieties relative to
  its smallest containing torsion coset. It also proves the full curve case in the Siegel threefold $cal(A)_2$ for
  Hodge-generic curves defined over $overline(bb(Q))$, without boundary or reduction assumptions.

#metadata(none)
#label("result017")

#strong[017.The irrationality exponent of $pi$ is $2$.]Proves that the irrationality exponent of $pi$ is exactly
  $2$: for every $epsilon > 0$ and all sufficiently large denominators $q$,
  every rational $p \/ q$ satisfies $\| pi - p \/ q \| gt.eq q^(- 2 - epsilon)$.
  This also proves convergence of the Flint–Hills series $sum_(n gt.eq 1) 1 \/ \( n^3 sin^2 n \)$,
  with angles in radians.

#metadata(none)
#label("result018")

#strong[018.The Margulis–Platonov conjecture over global fields.]Proves the Margulis–Platonov conjecture over
  every global field, including function fields of characteristic two.
  For an absolutely almost simple simply connected algebraic group $G$ over $k$,
  every noncentral abstract normal subgroup of $G \( k \)$ is the inverse image of an open normal subgroup in the
  finite product of its anisotropic nonarchimedean local groups.

#metadata(none)
#label("result019")

#strong[019.The $p$-adic section conjecture.]Proves that rational points on every smooth proper geometrically
  connected curve of genus at least two over a finite extension of $bb(Q)_p$ correspond bijectively to conjugacy
  classes of sections of its full arithmetic étale fundamental group.
  It also proves Grothendieck’s section conjecture over $bb(Q)$ for the modular curves $X_0 \( N \)$ and
  $X_1 \( N \)$ of genus at least two.

#metadata(none)
#label("result020")

#strong[020.Squarefree quartics and power-free polynomial values.]Proves the squarefree-values conjecture for
  irreducible integer quartics with no fixed prime-square divisor:
  squarefree values on positive integers have the predicted positive Euler-product density.
  More generally, establishes the $\( d - 2 \)$-power-free density for irreducible integer polynomials of degrees
  four through eight under the necessary local condition; together with Browning’s higher-degree theorem,
  this covers every $d gt.eq 4$.

#metadata(none)
#label("result021")

#strong[021.A quadratic bound for Jacobsthal’s function.]Answers Jacobsthal’s quadratic-bound question:
  every interval of $C k^2$ consecutive integers contains an integer coprime to any prescribed positive integer
  with at most $k$ distinct prime divisors, for an absolute constant $C$.
  The bound is uniform over prime sets and interval positions and removes the classical logarithmic loss.

#metadata(none)
#label("result022")

#strong[022.The weak inhomogeneous Duffin–Schaeffer conjecture.]Proves that for every real shift $gamma$ and
  finite-valued $psi : bb(N) arrow.r \[ 0 \, oo \)$, divergence of $sum_q phi.alt \( q \) psi \( q \) \/
  q$ implies $parallel q x - gamma parallel < psi \( q \)$ for infinitely many $q$, for almost every $x$.
  Here $phi.alt$ is Euler’s totient and the norm is distance to the nearest integer.
  Numerators are unrestricted; no monotonicity or Diophantine condition on $gamma$ is needed.

#metadata(none)
#label("result023")

#strong[023.Patterson’s first moment for cubic Gauss sums.]Proves unconditionally the all-primary-prime form of
  Patterson’s first-moment asymptotic: normalized cubic Gauss sums over primary Eisenstein primes of norm at most
  $X$, including both conjugates, have an explicit positive main term of order $X^(5 \/ 6) \/ log X$.
  Every fixed nonzero prime-angle Fourier mode has smaller order.

#metadata(none)
#label("result024")

#strong[024.An asymptotic formula for the number of totients.]Gives an asymptotic equivalent for the number
  $V \( x \)$ of distinct totient values up to $x$, with a positive bounded phase-dependent factor determined by
  convergent arithmetic approximations. In particular, $V \( c x \) \/ V \( x \) arrow.r
  c$ for every fixed $c > 0$, answering Erdős and Hall’s scaling question.

#metadata(none)
#label("result025")

#strong[025.Erdős’s short Egyptian-fraction conjecture.]Every rational $a \/ b$ with $1 lt.eq
  a < b$ is a sum of $O \( log log b \)$ distinct positive unit fractions.
  The worst-case minimum number of terms has the same order, resolving Erdős’s conjecture on short Egyptian fractions.

#metadata(none)
#label("result026")

#strong[026.Positive lower density of large prime gaps.]For every fixed $C > 0$,
  a positive proportion of consecutive prime gaps exceed $C log p_n$,
  throughout every sufficiently large initial segment of the primes. The proportion may depend on $C$.
  Consequently, the indices where $p_n \/ n$ increases have positive lower density, answering Erdős and Prachar.

#metadata(none)
#label("result027")

#strong[027.Integral density on curve character varieties.]Resolves the determinant-one curve case of Litt’s
  integral-density question. For every smooth connected complex algebraic curve and every rank,
  integral points become Zariski dense in every component of its $upright("SL")_r$ character variety over the full
  ring of integers of one number field. Prescribed quasi-unipotent boundary conjugacy classes are allowed,
  including nonsemisimple classes.

#metadata(none)
#label("result028")

#strong[028.The Gaussian moat conjecture.]Proves the Gaussian moat conjecture:
  no infinite walk through distinct Gaussian primes can have uniformly bounded steps.
  More strongly, for every distance bound $D$, the graph joining Gaussian primes at distance at most $D$ has
  uniformly bounded finite component sizes, depending only on $D$, including primes on the coordinate axes.

#metadata(none)
#label("result029")

#strong[029.Artin’s primitive root conjecture: infinitude for every base.]Proves the infinitude assertion in
  Artin’s primitive root conjecture for every integer $a$ that is neither $- 1$ nor a square.
  For each such base, at least $c_a x \/ \( log x \)^2$ primes in every sufficiently large interval
  $\( x \, 2 x \)$ have primitive root $a$, with $c_a > 0$.

#metadata(none)
#label("result030")

#strong[030.Modularity over imaginary quadratic fields.]Proves the modularity conjecture for elliptic curves over
  imaginary quadratic fields: every elliptic curve over every imaginary quadratic field is modular,
  with matching local parameters at every place.

#metadata(none)
#label("result031")

#strong[031.Uchida’s conjecture for open Galois homomorphisms.]Proves Uchida’s conjecture:
  every continuous open homomorphism between Galois groups of possibly infinite solvably closed Galois extensions
  of number fields comes from a unique equivariant field embedding in the opposite direction.
  No restriction on the kernel or separate cyclotomic-compatibility assumption is needed.

#metadata(none)
#label("subject3")

#strong[Algebraic and complex geometry]

#metadata(none)
#label("result032")

#strong[032.The rational Hodge conjecture for CM abelian varieties and products of K3 surfaces.]Proves the
  rational Hodge conjecture for every complex CM abelian variety, in every dimension and codimension.
  Through Milne’s theorems, this also gives the Tate conjecture for all abelian varieties over finite fields and
  the Hodge standard conjecture for abelian varieties in every characteristic.
  Companion results prove rational Hodge for arbitrary products of projective complex K3 surfaces and algebraicity
  of the Kuga–Satake correspondence for every such surface.

#metadata(none)
#label("result033")

#strong[033.Campana’s orbifold Iitaka conjecture and logarithmic subadditivity.]Proves Campana’s orbifold Iitaka
  subadditivity conjecture for smooth Fujiki-class-$cal(C)$ manifolds with rational simple-normal-crossing
  boundaries. For projective fibrations $f : U arrow.r V$ of smooth complex quasi-projective varieties with
  connected fibers, general fiber $F$, and $macron(kappa) \( V \) gt.eq 0$,
  proves Popa’s inequality $macron(kappa) \( U \) gt.eq kappa \( F \) + max { macron(kappa) \( V \) \,
  "Var" \( f \) }$, where variation measures the whole geometric generic fiber.

#metadata(none)
#label("result034")

#strong[034.Log abundance and effective Iitaka fibrations.]Using logarithmic Iitaka subadditivity,
  proves log abundance in every dimension for normal compact Kähler log canonical pairs with effective rational
  boundary: an analytically nef $bb(Q)$-Cartier adjoint is semiample.
  It also proves projective log abundance over every algebraically closed field of characteristic zero and the
  effective Iitaka fibration conjecture for smooth projective varieties of nonnegative Kodaira dimension in that
  setting. A further result resolves the finite-rational-coefficient index conjecture for connected projective
  semi-log-canonical log Calabi–Yau pairs over such fields in each fixed dimension and for each fixed finite set
  of rational boundary coefficients, with a uniform index independent of the number of components.

#metadata(none)
#label("result035")

#strong[035.Threefold log abundance in numerical dimension one in characteristic $p >
  3$.]Proves log abundance for projective log canonical threefold pairs over algebraically closed fields of
  characteristic $p > 3$ when the effective boundary is rational and the $bb(Q)$-Cartier adjoint is nef of
  numerical dimension one. The adjoint is semiample, without requiring the original variety to be terminal or
  $bb(Q)$-factorial.

#metadata(none)
#label("result036")

#strong[036.Numerical semiampleness and generalized minimal models.]Proves numerical semiampleness for nef
  adjoints $K_X + B + M$ with $K_X + B$ pseudo-effective and $M$ nef rational,
  for projective klt rational pairs over algebraically closed characteristic-zero fields and smooth compact Kähler
  rational klt simple-normal-crossing pairs, using Bott–Chern cohomology in the latter case.
  Separately, projective generalized log canonical rational pairs over such fields admit minimal models for
  pseudo-effective adjoints and Mori fiber spaces otherwise, with nef b-data fixed.

#metadata(none)
#label("result037")

#strong[037.The sharp ordinary-double-point volume gap.]Proves the ordinary-double-point volume-gap conjecture:
  every singular complex algebraic klt germ of dimension $n gt.eq 2$, with zero boundary,
  has normalized volume at most $2 \( n - 1 \)^n$. Equality holds precisely for an analytic ordinary double point.

#metadata(none)
#label("result038")

#strong[038.Fujita’s freeness conjecture.]Proves Fujita’s freeness conjecture at its sharp bound in every
  dimension: for a smooth projective complex variety $X$ of dimension $n$ and an ample line bundle $L$,
  the adjoint $K_X + m L$ is globally generated for every integer $m gt.eq n + 1$.

#metadata(none)
#label("result039")

#strong[039.Nagata’s conjecture and maximal Seshadri constants.]Proves Nagata’s strict inequality $sum_i m_i < d
  sqrt(r)$ for every nonzero effective plane curve of degree $d$ through $r gt.eq 10$ very general complex points,
  with arbitrary multiplicities $m_i$. It also proves maximal multipoint Seshadri constants
  $\( L^n \/ r \)^(1 \/ n)$ for every smooth polarized projective variety of dimension $n gt.eq
  2$ and all sufficiently large $r$: at very general points over $bb(C)$,
  and at the geometric generic tuple over any algebraically closed field of positive characteristic.

#metadata(none)
#label("result040")

#strong[040.Bloch’s conjecture for complex surfaces.]Proves Bloch’s conjecture:
  for every smooth connected projective complex surface $S$ with $p_g \( S \) = 0$,
  the Albanese map $upright("CH")_0 \( S \)^0 arrow.r upright("Alb") \( S \) \( bb(C) \)$ on integral degree-zero
  zero-cycles is an isomorphism. This combines the new $p_g = q = 0$ theorem with the classical theorem of Bloch,
  Kas, and Lieberman.

#metadata(none)
#label("result041")

#strong[041.Hyperkähler SYZ and projective-space bases.]Proves the strong hyperkähler SYZ conjecture:
  every holomorphic line bundle with nonzero nef isotropic first Chern class on a compact irreducible holomorphic
  symplectic Kähler manifold is semiample. It also proves that every projective Lagrangian fibration with normal
  projective base has projective space as its base, in every dimension and deformation type.

#metadata(none)
#label("result042")

#strong[042.Oka classification for K3 surfaces and other compact complex surfaces.]Proves that every complex K3
  surface is Oka, including nonprojective surfaces. More generally,
  every connected minimal compact complex surface of Kodaira dimension zero is Oka;
  a connected minimal compact complex surface of class VII is Oka exactly when it is a Hopf or Enoki surface.

#metadata(none)
#label("result043")

#strong[043.$P = W$ for fixed-determinant moduli spaces.]Proves $P_k = W_(2 k) =
  W_(2 k + 1)$ on the full rational cohomology of smooth coprime fixed-determinant,
  trace-free Higgs moduli spaces and their character varieties for composite ranks over smooth projective complex
  curves of genus at least two. This includes variant cohomology and, together with the known prime-rank theorems,
  establishes the fixed-determinant $P = W$ conjecture in every coprime rank.

#metadata(none)
#label("result044")

#strong[044.The equivariant cohomological Hikita conjecture for quivers.]Proves the equivariant cohomological
  Hikita correspondence for every finite quiver, including loops and multiple arrows,
  with arbitrary dimension and framing vectors and commuting flavor torus.
  When every semistable point is stable and the gauge action is free,
  the equivariant cohomology of the Nakajima variety is canonically the coordinate ring of the scheme-theoretic
  cocharacter-fixed locus of its flavor-deformed Coulomb branch.

#metadata(none)
#label("result046")

#strong[046.Counterexamples to Shafarevich holomorphic convexity.]Constructs a smooth projective complex fourfold
  with large fundamental group whose universal cover contains no positive-dimensional compact analytic subvariety
  but is neither Stein nor holomorphically convex. A separate smooth projective complex surface already disproves
  unrestricted Shafarevich holomorphic convexity in dimension two.

#metadata(none)
#label("result047")

#strong[047.Complex counterexamples to cancellation and affine fibrations.]Constructs an integral complex affine
  fourfold $X tilde.nequiv bb(A)^4$ with $X times bb(A)^1 tilde.equiv bb(A)^5$,
  disproving affine-space cancellation over $bb(C)$ in dimension four.
  It also disproves the Dolgachev–Weisfeiler affine-fibration conjecture:
  smooth surjections $X arrow.r bb(A)^1$ and $bb(A)^5 arrow.r
  bb(A)^2$ have every residue-field fiber isomorphic to affine three-space but are not Zariski-locally trivial.

#metadata(none)
#label("result048")

#strong[048.A characteristic-zero counterexample to Lipman–Zariski.]Constructs a singular normal affine complex
  surface with free rank-two tangent sheaf, disproving the characteristic-zero Lipman–Zariski conjecture.

#metadata(none)
#label("result049")

#strong[049.A stable-coordinate counterexample in four variables.]Constructs a polynomial in four complex
  variables that is not a coordinate but becomes one after adjoining a single variable,
  disproving the Stable Coordinate conjecture in four variables.
  Every fiber is affine three-space, yet none of its embeddings is rectifiable,
  also disproving the Abhyankar–Sathaye conjecture even when all fibers are affine spaces.

#metadata(none)
#label("result050")

#strong[050.A counterexample to Griffiths’ positivity conjecture.]Constructs ample rank-two bundles on $bb(P)^1
  times bb(P)^1$ with no smooth Hermitian metric of strictly Griffiths-positive curvature,
  disproving Griffiths’ positivity conjecture already on the quadric surface.

#metadata(none)
#label("result051")

#strong[051.Kobayashi’s canonical-ampleness conjecture.]Every compact connected Kähler manifold of positive
  complex dimension with no nonconstant entire curve has ample canonical bundle and is therefore projective.
  This proves Kobayashi’s canonical-ampleness conjecture in the smooth compact Kähler setting.

#metadata(none)
#label("result052")

#strong[052.Tangent-bundle splittings and universal covers.]A splitting of the tangent bundle of a compact Kähler
  manifold into two integrable holomorphic subbundles induces a compatible product decomposition of its universal
  cover, proving the two-summand form of Beauville’s splitting conjecture.
  On smooth rationally connected projective manifolds, both summands are automatically integrable,
  establishing Höring’s conjecture and the corresponding product decomposition.

#metadata(none)
#label("result053")

#strong[053.A counterexample to Pixton’s original completeness conjecture.]Constructs a tautological relation on a
  moduli space of stable pointed curves that vanishes in rational Chow, hence in rational cohomology,
  but lies outside Pixton’s original relation span. This disproves the Chow and rational-cohomological forms of
  his original completeness conjecture.

#metadata(none)
#label("result054")

#strong[054.Counterexamples to Kuznetsov’s rationality conjecture.]For every sufficiently large admissible Hassett
  discriminant, a very general smooth complex cubic fourfold is irrational despite having both an untwisted
  geometric K3 category and an integral Hodge-theoretic K3 association.
  This disproves Kuznetsov’s rationality conjecture and the sufficiency of the associated-K3 criterion for
  rationality; the discriminant threshold is ineffective.

#metadata(none)
#label("result055")

#strong[055.Toda’s Gepner conjecture and large-volume stability.]Proves Toda’s Gepner conjecture for every smooth
  complex quintic threefold, constructing a numerical Bridgeland stability condition with the prescribed phase
  shift $2 \/ 5$. Also constructs numerical Bridgeland stability conditions at every sufficiently large volume on
  all smooth projective complex threefolds with trivial canonical bundle,
  with the exact ordinary and square-root-Todd central charges.

#metadata(none)
#label("result056")

#strong[056.Termination of fourfold minimal model programs.]Proves termination of every existing generalized log
  canonical flip sequence on globally Weil $bb(Q)$-factorial compact Kähler fourfolds, with rational boundary,
  fixed rational analytically nef b-data, and projective small flip diagrams with the prescribed ample signs.
  Also proves termination of arbitrary permitted minimal model programs for projective log canonical fourfolds
  with rational boundary in characteristic zero.

#metadata(none)
#label("result057")

#strong[057.Campana’s abelianity conjecture and special varieties.]Proves Campana’s abelianity conjecture:
  special compact Kähler manifolds have virtually abelian fundamental groups.
  Using this theorem, establishes the same conclusion for order-two root orbifolds of smooth projective complex
  fourfolds along one nonempty smooth connected divisor, when special in the stated differential-line sense.
  For smooth special complex quasi-projective varieties, proves that every finite-dimensional complex linear
  representation of the fundamental group has virtually nilpotent image of class at most two.

#metadata(none)
#label("result058")

#strong[058.The Kollár–Pardon universal-cover conjecture.]Proves the Kollár–Pardon conjecture:
  the semialgebraic universal covers of connected normal projective complex varieties are exactly products $D
  times bb(C)^m times F$, with $D$ bounded symmetric and $F$ simply connected, normal, and projective.
  A universal cover is quasi-projective exactly when the bounded symmetric factor is absent.
  In particular, a smooth projective variety covered by $bb(C)^n$ has a finite étale cover by an abelian variety.

#metadata(none)
#label("result059")

#strong[059.Counterexamples to Zariski’s multiplicity conjecture.]Disproves Zariski’s multiplicity conjecture by
  constructing reduced holomorphic hypersurface germs that are ambiently homeomorphic but have different
  multiplicities. The examples include hypersurfaces in $bb(C)^4$ with isolated critical points and multiplicities
  four and five.

#metadata(none)
#label("result060")

#strong[060.The Global Spherical Shell conjecture.]Every connected minimal compact complex surface of class VII
  with $b_2 > 0$ contains a global spherical shell, proving the positive-$b_2$ Global Spherical Shell conjecture.
  Such a shell is a holomorphically embedded neighborhood of the standard three-sphere in $bb(C)^2 \\ {
  0 }$ whose complement is connected.

#metadata(none)
#label("result062")

#strong[062.The LeBrun–Salamon conjecture and projective contact classification.]Proves the LeBrun–Salamon
  conjecture: every closed connected positive quaternionic-Kähler manifold of real dimension at least eight is
  homothetic to a compact symmetric Wolf space. It also proves contact-Fano homogeneity and classifies smooth
  connected complex projective contact manifolds of complex dimension at least three:
  those with $b_2 = 1$ are adjoint varieties with their canonical contact structures, while those with $b_2 gt.eq
  2$ have underlying manifold $bb(P) \( T^(*) Z \)$ for a smooth projective variety $Z$.

#metadata(none)
#label("result063")

#strong[063.The generalized Mukai conjecture.]Proves the generalized Mukai conjecture:
  every positive-dimensional smooth complex projective Fano manifold of dimension $n$,
  Picard number $rho$ and pseudoindex $iota$ satisfies $rho \( iota - 1 \) lt.eq n$,
  with equality exactly for $\( bb(P)^(iota - 1) \)^rho$. Here the pseudoindex is the least anticanonical degree
  of a rational curve.

#metadata(none)
#label("result064")

#strong[064.The $mu$-constant problem for surface singularities.]Proves topological right-triviality for every
  holomorphic one-parameter family of isolated hypersurface singularities in $bb(C)^3$ with constant Milnor
  number, resolving the surface case of the $mu$-constant problem.
  After shrinking the parameter disk and representatives, ambient homeomorphisms vary jointly continuously,
  fix the origin section and preserve the defining functions.

#metadata(none)
#label("result065")

#strong[065.Virasoro constraints for complete intersections and projective bundles.]Proves the full ordinary
  unreduced descendant Virasoro conjecture for smooth complete intersections in complex projective space,
  in every genus and curve class with arbitrary cohomology insertions.
  The constraints also pass from any smooth projective complex base satisfying them to the projectivization of
  every algebraic vector bundle of rank at least two, and hence to projective-bundle towers.

#metadata(none)
#label("result066")

#strong[066.Bounded klt complements for Fano contractions.]Proves the finite-rational-coefficient form of
  Shokurov’s bounded-klt-complement conjecture for $epsilon.alt$-lc complex Fano-type pairs with nef
  anti-log-canonical divisor. For $epsilon.alt$-lc Fano contractions over any algebraically closed
  characteristic-zero field, it gives klt complements near every base point,
  with index bounded only by dimension and positive rational $epsilon.alt$.

#metadata(none)
#label("result067")

#strong[067.The Campana–Peternell conjecture in dimension six.]Proves the Campana–Peternell conjecture in complex
  dimension six: every smooth connected complex projective Fano sixfold with nef tangent bundle is rational homogeneous.

#metadata(none)
#label("result068")

#strong[068.Anticanonical nonvanishing under smooth semipositivity.]If $X$ is a smooth connected complex
  projective variety and $- K_X$ admits a smooth Hermitian metric with nonnegative curvature,
  then $H^0 \( X \, - m K_X \) eq.not 0$ for some $m > 0$. Thus smooth semipositivity forces a nonzero section of
  a positive tensor power of the anticanonical bundle in every dimension.

#metadata(none)
#label("result069")

#strong[069.Quantum geometric Langlands at irrational level.]Proves the unramified de Rham quantum geometric
  Langlands equivalence for every connected simple complex algebraic group on every smooth projective connected
  complex curve, at every shifted level $c in bb(C) \\ bb(Q)$.
  It identifies the full derived categories of twisted $D$-modules for the group and its Langlands dual,
  retaining all global forms and connected components.

#metadata(none)
#label("subject10")

#strong[Real and complex analysis]

#metadata(none)
#label("result071")

#strong[071.Koebe’s circle-domain conjecture and circle-domain rigidity.]Resolves the existence part of Koebe’s
  circle-domain conjecture: every domain in the Riemann sphere is conformally equivalent to a domain whose
  complementary components are round disks or points. It also proves that circle domains with conformally
  removable boundary are rigid, meaning every conformal equivalence to another circle domain is Möbius,
  establishing this direction of the He–Schramm conjecture.

#metadata(none)
#label("result072")

#strong[072.Brennan’s conjecture and a counterexample to Kraetzer’s prediction.]Proves Brennan’s conjecture:
  for every conformal bijection $phi.alt$ from a simply connected plane domain onto the disk,
  $\| phi.alt' \|^s$ is area-integrable for $4 \/ 3 < s < 4$.
  The sharp universal integral-means identity is $B_(cal(S)) \( t \) = \| t \| - 1$ for $t lt.eq - 2$.
  A strict bound $B_b \( - 1 \) < 1 \/ 4$ for bounded univalent functions disproves Kraetzer’s prediction at that
  parameter.

#metadata(none)
#label("result073")

#strong[073.The Falconer distance conjecture.]Resolves the Falconer distance conjecture in every dimension $d
  gt.eq 2$: every compact set $E subset bb(R)^d$ with Hausdorff dimension greater than $d \/
  2$ determines a set of Euclidean distances of positive Lebesgue measure.

#metadata(none)
#label("result074")

#strong[074.Kakeya in three and four dimensions.]Resolves the Kakeya maximal conjecture in three dimensions and
  the Hausdorff-dimension conjecture in four. In three dimensions,
  the radius-$delta$ tube maximal operator maps $L^3 \( bb(R)^3 \)$ to $L^3 \( S^2 \)$ with norm
  $O_epsilon \( delta^(- epsilon) \)$ for every $epsilon > 0$.
  In four dimensions, every set containing a unit segment in every direction has Hausdorff dimension four.

#metadata(none)
#label("result075")

#strong[075.The $L log L$ Fourier-convergence conjecture.]Proves that the ordinary symmetric Fourier partial sums
  of every complex-valued function in $L log L \( bb(T) \)$ converge almost everywhere along the full sequence.
  This resolves the classical sufficiency conjecture at the $L log L$ scale.

#metadata(none)
#label("result076")

#strong[076.Ultraflat real Littlewood polynomials.]Constructs polynomials with $N$ consecutive coefficients in
  ${ - 1 \, 1 }$ whose modulus is $\( 1 + o \( 1 \) \) sqrt(N)$ uniformly on the entire unit circle,
  for every sufficiently large integer length $N$. Thus real Littlewood polynomials are ultraflat,
  including at the real endpoints. Their binary merit factors tend to infinity,
  disproving Turyn’s bounded-merit-factor conjecture.

#metadata(none)
#label("result077")

#strong[077.Fourier restriction for positively curved surfaces.]Proves the diagonal Fourier extension conjecture
  for positively curved surfaces in three dimensions. For every compact smooth positively curved surface $Sigma
  subset bb(R)^3$, including surfaces with boundary, the extension operator is bounded from $L^p \( Sigma \)$ to
  $L^p \( bb(R)^3 \)$ for every $p > 3$.

#metadata(none)
#label("result078")

#strong[078.The three-dimensional Bochner–Riesz conjecture.]Resolves the three-dimensional Bochner–Riesz
  conjecture in its strict range: the Bochner–Riesz multipliers of order $delta$ are bounded on
  $L^p \( bb(R)^3 \)$ for every $1 lt.eq p lt.eq oo$ whenever $delta > max { 3 \| 1 \/ p - 1 \/ 2 \| - 1 \/ 2 \, 0 }$.

#metadata(none)
#label("result079")

#strong[079.Sogge’s local smoothing conjecture in dimension three.]Resolves Sogge’s local smoothing conjecture for
  the Euclidean wave equation in three spatial dimensions. The estimate holds throughout the full strict range
  $2 < p < oo$, with Sobolev regularity above $max { 0 \, 1 - 3 \/ p }$.
  In particular, the critical $L^3$ estimate holds with every positive Sobolev loss.

#metadata(none)
#label("result080")

#strong[080.The Sobolev endpoint in Carleson’s Schrödinger convergence problem.]Proves almost-everywhere
  convergence $e^(i t Delta) f arrow.r f$ as $t arrow.b 0$ for every $f in
  H^(n \/ \( 2 \( n + 1 \) \)) \( bb(R)^n \)$ and every dimension $n gt.eq 2$.
  This attains the sharp Sobolev equality case of Carleson’s Schrödinger convergence problem,
  including the planar endpoint $H^(1 \/ 3)$.

#metadata(none)
#label("result081")

#strong[081.The David–Semmes Riesz-transform problem in higher codimension.]Resolves the remaining
  higher-codimension Riesz-transform rectifiability problem:
  for $d gt.eq 4$ and $2 lt.eq n lt.eq d - 2$, an $n$-Ahlfors–David regular Radon measure on $bb(R)^d$ is
  uniformly $n$-rectifiable whenever its $n$-dimensional Riesz transform is uniformly $L^2$-bounded over all
  positive hard truncations. The rectifiability bounds depend only on dimension, regularity and operator bounds.

#metadata(none)
#label("result082")

#strong[082.Maximal and variational bounds for the triangular Hilbert transform.]Proves maximal and annular
  $r$-variation bounds, for every $r > 2$, from complex $L^3 \( bb(R)^2 \) times
  L^3 \( bb(R)^2 \)$ to $L^(3 \/ 2) \( bb(R)^2 \)$. The maximal estimate controls both hard truncation endpoints
  and gives almost-everywhere and norm convergence. Pairing with a third input settles the triangular Hilbert
  transform estimate at the symmetric $L^3 times L^3 times L^3$ point.

#metadata(none)
#label("result083")

#strong[083.Stein’s conjecture for Hilbert transforms along Lipschitz directions.]Proves a uniform strong $L^2$
  bound for the planar Hilbert transform along any Lipschitz unit vector field,
  at integration lengths bounded by an absolute multiple of its reciprocal Lipschitz constant.
  The estimate is uniform over inner truncations and yields an $L^2$-bounded principal-value operator,
  establishing Stein’s weak-type conjecture at this short scale.

#metadata(none)
#label("result084")

#strong[084.The geometric case of the Erdős similarity conjecture.]For every fixed $q in \( 0 \, 1 \)$,
  constructs compact subsets of $\[ 0 \, 1 \]$ with measure arbitrarily close to one containing no translated and
  nontrivially dilated copy of ${ q^n : n gt.eq 1 }$, with dilations of either sign.
  This resolves the geometric-progression case of the Erdős similarity conjecture for every ratio.

#metadata(none)
#label("result085")

#strong[085.Endpoint regularity of the planar centered maximal function.]Resolves the planar centered-disk case of
  the Hajłasz–Onninen maximal-function regularity problem. For every real $f in W^(1 \, 1) \( bb(R)^2 \)$,
  the centered disk maximal function satisfies $parallel nabla M f parallel_1 lt.eq
  C parallel nabla f parallel_1$ with an absolute constant.
  It belongs locally to $W^(1 \, 1)$ and has a globally integrable weak gradient.

#metadata(none)
#label("result086")

#strong[086.An $L^3$ bound for the trilinear Hilbert transform.]Proves that the principal-value trilinear Hilbert
  transform with shifts $x - t$, $x - 2 t$, $x - 3 t$ is bounded from $L^3 \( bb(R) \)^3$ to $L^1 \( bb(R) \)$.
  This resolves the $L^3$ exponent case of the standard conjecture for slopes $1 \, 2 \, 3$.

#metadata(none)
#label("subject8")

#strong[Convex and metric geometry]

#metadata(none)
#label("result087")

#strong[087.The Mahler conjectures and symplectic width.]Resolves the symmetric and nonsymmetric geometric Mahler
  conjectures in every dimension, with Hanner polytopes and simplices as the respective volume-product minimizers
  and all equality cases classified. The corresponding sharp functional Mahler inequalities also hold.
  For $n gt.eq 2$, every symmetric polar product $K times K^compose$ in dimension $2 n$ has Gromov width $4$.

#metadata(none)
#label("result088")

#strong[088.Petty’s projection-volume conjecture and simplex counterexamples.]Proves Petty’s projection-volume
  conjecture in the remaining dimensions $n gt.eq 4$: ellipsoids uniquely minimize projection-body volume at fixed
  body volume. Also establishes the full Lutwak–Petty projection inequalities.
  In contrast, products of simplices exceed Brannen’s proposed simplex maximum for normalized projection-body
  volume by an exponential factor in every sufficiently large dimension.

#metadata(none)
#label("result089")

#strong[089.Bounded-distortion $L_1$ embeddings of planar and bounded-treewidth graphs.]Resolves the planar and
  bounded-treewidth cases of the Gupta–Newman–Rabinovich–Sinclair conjecture.
  Shortest-path metrics of finite connected graphs with arbitrary positive edge lengths embed into real $L_1$ with
  universal distortion for planar graphs, and distortion depending only on treewidth for bounded-treewidth graphs.
  The corresponding multicommodity flow–cut gaps are uniformly bounded.

#metadata(none)
#label("result090")

#strong[090.Universal optimality of the triangular lattice.]Proves that the triangular lattice minimizes the lower
  limit of energy per particle for every nonnegative completely monotone potential of squared distance among
  locally finite planar configurations of centered-disk density one.
  It also minimizes unit-background renormalized Riesz energies for $0 < s < 2$ and Coulomb energy,
  resolving Sandier–Serfaty and the two-dimensional Brauchart–Hardin–Saff conjecture on the linear term of optimal
  spherical logarithmic energy.

#metadata(none)
#label("result091")

#strong[091.The logarithmic Brunn–Minkowski conjecture.]Proves the logarithmic Brunn–Minkowski inequality for
  origin-symmetric convex bodies in every dimension, and the scalar-dilation B-conjecture for all even log-concave
  Radon measures. For Lebesgue volume it also proves the additive $L_p$ Brunn–Minkowski inequality for
  full-dimensional origin-symmetric convex bodies throughout $0 < p < 1$.

#metadata(none)
#label("result092")

#strong[092.The optimal order of convex-body covering density.]Determines the optimal worst-case covering density
  as $Theta \( n log n \)$, for both lattice and unrestricted translative coverings.
  Every convex body in $bb(R)^n$, $n gt.eq 2$, admits a lattice covering of density at most $C n log n$;
  centrally symmetric examples in every sufficiently large dimension require at least $c n log
  n$ even without the lattice restriction, for absolute $c \, C > 0$.

#metadata(none)
#label("result093")

#strong[093.Dimension-free logarithmic Sobolev inequality for subgaussian log-concave measures.]Proves a
  dimension-free logarithmic Sobolev inequality for centered log-concave densities with uniformly subgaussian
  linear marginals, with constant bounded by a universal multiple of the squared linear subgaussian parameter.

#metadata(none)
#label("result094")

#strong[094.Subpolynomial dimension reduction in $L_p$.]For every fixed $1 < p < oo$ and distortion $D > 1$,
  every $n$-point subset of real $L_p$ embeds into $ell_p^d$ with distortion at most $D$ and dimension $d =
  n^(o \( 1 \))$, answering Naor’s sublinear-dimension question for $p eq.not 2$.
  In contrast, exact embeddings require worst-case dimension $Theta \( n^2 \)$ when $p eq.not 2$.

#metadata(none)
#label("result095")

#strong[095.Hyperbolicity cones without semidefinite lifts.]Disproves the Projected Lax conjecture:
  some hyperbolicity cones are not spectrahedral shadows. The examples admit no exact finite affine semidefinite
  lift, regardless of the number of auxiliary variables or the real coefficients used.
  This also disproves the generalized Lax conjecture that every hyperbolicity cone is spectrahedral.

#metadata(none)
#label("result096")

#strong[096.The Gaussian propeller conjecture.]Proves that the sum of squared Gaussian first moments of any finite
  measurable partition is at most $9 \/ \( 8 pi \)$. In dimension at least two,
  three planar sectors of angle $2 pi \/ 3$, extended orthogonally, attain the bound.
  Combined with the separate Unique Games theorem, this proves NP-hardness of improving the loss factor
  $\( 8 pi \/ 9 \) \( 1 - 1 \/ k \)$ for identity-target kernel clustering with fixed $k gt.eq
  3$ on rational centered positive semidefinite inputs.

#metadata(none)
#label("result097")

#strong[097.The Euclidean Steinitz–Bergström conjecture.]Proves that any finite sequence in the Euclidean unit
  ball of $bb(R)^d$ admits signs keeping every partial sum within $C sqrt(d)$, independently of length.
  Consequently every zero-sum family can be reordered with the same bound on unsigned partial sums.
  A matching lower bound gives the optimal order $S_2 \( d \) = Theta \( sqrt(d) \)$.

#metadata(none)
#label("result098")

#strong[098.A negative answer to the Lang–Plaut problem.]Every infinite-dimensional real Banach space contains a
  compact doubling set that admits no bi-Lipschitz embedding into any finite-dimensional normed space.
  The doubling constant is universal. This answers the Lang–Plaut problem negatively,
  even for compact subsets of Hilbert space.

#metadata(none)
#label("result099")

#strong[099.The sharp distortion of edit distance into $ell_1$.]Determines the least distortion of embedding edit
  distance on words of length at most $d$ into real $ell_1$:
  it is $exp \( Theta \( sqrt(log d thin log log d) \) \)$.
  Insertions, deletions and substitutions have unit cost. The constants are uniform over all finite alphabets with
  at least two symbols, even when the alphabet grows with $d$; binary words already force the lower bound.

#metadata(none)
#label("result100")

#strong[100.A counterexample to Bang’s cylinder-covering bound.]Covers the entire closed regular tetrahedron by
  finitely many cylinders with compact triangular perpendicular bases whose total area is less than half its
  smallest orthogonal projection area. This disproves Bang’s half-area cylinder-covering bound and the stronger
  directionwise normalized conjecture in dimension three.

#metadata(none)
#label("result101")

#strong[101.The sharp simplex conjecture for isotropic constants.]Proves that simplices uniquely maximize the
  isotropic constant among convex bodies in every dimension, resolving the strong isotropic constant conjecture.
  Also establishes the sharp entropy lower bound for log-concave probability densities,
  with equality precisely for invertible affine images of products of one-sided exponential laws.

#metadata(none)
#label("subject14")

#strong[Theoretical computer science]

#metadata(none)
#label("result102")

#strong[102.The Unique Games Conjecture and optimal approximation thresholds.]Proves Khot’s Unique Games
  Conjecture. Independent direct reductions also establish NP-hardness, on unweighted graphs,
  of approximation beyond the Goemans–Williamson ratio for Max-Cut, below factor two for Vertex Cover,
  and within any fixed constant factor for Min-UnCut and directed feedback vertex set.
  These direct proofs use established PCP and Label Cover hardness results.

#metadata(none)
#label("result103")

#strong[103.Derandomization of logarithmic space: $sans(L) = sans(R L) = sans(B P L)$.]Proves $sans(L) =
  sans(R L) = sans(B P L)$, resolving derandomization for bounded-error logarithmic-space computation.
  An effective compiler converts each randomized polynomial-time logarithmic-space machine deciding a language
  with one-sided or two-sided error into a deterministic logarithmic-space decider with explicit polynomial
  running-time bounds.

#metadata(none)
#label("result104")

#strong[104.Quasipolynomial algorithms for mean-payoff, stochastic and parity games.]Gives deterministic
  algorithms using $2^(O \( \( log \( L + 2 \) \)^2 \))$ bit operations, for complete binary input length $L$,
  for ordinary mean-payoff games and two separate extensions.
  They compute exact values and optimal positional strategies in ordinary games,
  the nonnegative expectation-of-liminf value set in turn-based stochastic games,
  and the winning set for nonnegative liminf mean payoff conjoined with parity.
  Signed rewards, rational chance probabilities, and parity priorities are unrestricted and binary-encoded.

#metadata(none)
#label("result105")

#strong[105.The 2-to-1 Games Conjecture with perfect completeness.]Proves Khot’s 2-to-1 Games Conjecture with
  perfect completeness: for every fixed rational $delta in \( 0 \, 1 \)$,
  it is NP-hard to distinguish satisfiable games from games whose optimum is at most $delta$,
  on explicit unweighted instances. The alphabet depends only on $delta$,
  and every right-hand label has exactly two preimages under each constraint map.

#metadata(none)
#label("result106")

#strong[106.Hardness of coloring three-colorable graphs.]It is NP-hard to color a three-colorable graph using any
  fixed number $c gt.eq 3$ of colors. More strongly, for every fixed $0 < delta < 1 \/ 3$,
  a deterministic polynomial-time reduction from $3$SAT produces simple unweighted graphs that are three-colorable
  in the satisfiable case and have no independent set of size $delta n$ otherwise, where $n$ is the number of vertices.

#metadata(none)
#label("result107")

#strong[107.Matrix multiplication with exponent at most $9 \/ 4$.]Proves $omega lt.eq 9 \/ 4$ over $bb(C)$,
  giving $O_epsilon \( n^(9 \/ 4 + epsilon) \)$ arithmetic operations for square matrix multiplication.
  In characteristic zero, some inner dimension $n^a$ with $a >
  0.465$ permits $n^(2 + o \( 1 \))$ rectangular multiplication.
  Further square bounds give $omega < 2.258$ outside finitely many positive characteristics and $omega <
  2.371054886006746$ over every fixed field.

#metadata(none)
#label("result108")

#strong[108.A cubic permanent–determinant lower bound.]Proves an $Omega \( n^3 \)$ lower bound for the border
  determinantal complexity of the $n times n$ permanent over $bb(C)$.
  Even coefficientwise limits of determinants of affine-linear matrices require matrix size at least $c n^3$,
  for an absolute $c > 0$ and all sufficiently large $n$; the same bound therefore holds for exact representations.

#metadata(none)
#label("result109")

#strong[109.Integer multiplication below $n log n$.]Multiplies two $n$-bit integers exactly at every input length
  in deterministic worst-case time $O \( n \( log n \)^(1 - kappa) \)$, with $kappa = 2^(- 182)$,
  on one fixed finite-alphabet Turing machine with finitely many one-dimensional tapes.
  This disproves the Schönhage–Strassen $n log n$ optimality conjecture in the ordinary multitape bit model.

#metadata(none)
#label("result110")

#strong[110.Optimal-order randomized $k$-server on arbitrary metrics.]Establishes a randomized competitive ratio
  $O \( log^2 \( k + 1 \) \)$ for $k$-server on every metric space, matching the worst-case lower-bound order.
  One policy serves every finite oblivious request sequence, including on infinite unbounded metrics.
  On finite rational metrics, a uniform implementation has polynomial preprocessing and per-request bit cost in
  the input length and $log \( t + 1 \)$ at request $t$, with a finite instance-dependent additive movement constant.

#metadata(none)
#label("result111")

#strong[111.One-sample matroid prophet inequalities against an almighty adversary.]For every finite matroid known
  in advance, gives a distribution-independent online rule using one independent sample per element and earning a
  universal constant fraction of the expected offline optimum.
  Values are independent and nonnegative, with finite expected optimum.
  The guarantee holds even when the arrival-order adversary sees all samples, values,
  and the rule’s entire random seed; no polynomial-time implementation is asserted.

#metadata(none)
#label("result112")

#strong[112.Beyond the square-root exponent for depth-three circuits.]Constructs a single language in
  deterministic polynomial time whose $n$-bit membership function requires $2^(omega \( sqrt(n) \))$ total gates
  in unbounded-fan-in OR–AND–OR circuits, at every sufficiently large input length.
  This crosses the square-root-exponent threshold for explicit depth-three Boolean circuit lower bounds.

#metadata(none)
#label("result113")

#strong[113.Approximate counting and the perfect-matching entropy conjecture.]Gives a fully polynomial randomized
  approximation scheme for counting perfect matchings in arbitrary finite simple graphs,
  with exact detection of zero counts. Also proves the perfect-matching entropy conjecture of Anari, Oveis Gharan,
  and Vinzant, bounding the maximum entropy of a matching law at every feasible edge-marginal vector in a loopless
  labelled multigraph, including boundary points.

#metadata(none)
#label("result114")

#strong[114.Approximate counting of common integer polymatroid bases.]Gives a fully polynomial randomized
  approximation scheme for counting common integer bases of two integral polymatroids of equal total rank,
  supplied by exact rank-value oracles. Capacities are binary-encoded, each integer vector counts once,
  and oracle calls and bit operations outside the oracles are polynomial on every execution.
  For matroids presented by independence oracles, the results also cover common independent sets of prescribed,
  unrestricted, or maximum cardinality, even when the ranks differ.

#metadata(none)
#label("result115")

#strong[115.Sampling and counting contingency tables with arbitrary margins.]For nonnegative integer matrices with
  prescribed row and column sums, gives exact uniform sampling in expected polynomial bit time and almost-uniform
  sampling in worst-case polynomial bit time. The dimensions and binary-encoded margins are unrestricted.
  Also gives a fully polynomial randomized approximation scheme for counting such tables with arbitrary individual
  cell bounds, including structural zeros, with polynomial cost on every execution.

#metadata(none)
#label("result116")

#strong[116.Uniform identity testing for noncommutative formulas.]For each characteristic,
  constructs in deterministic polynomial bit time a polynomial-dimensional matrix tuple detecting every nonzero
  division-free noncommutative formula of bounded size over any field of that characteristic.
  Rational formulas over $bb(Q)$ also admit polynomial-size hitting lists whenever they have a defined
  rational-matrix evaluation.

#metadata(none)
#label("result117")

#strong[117.Uniform sparsest cut: hardness and semidefinite gaps.]Proves that approximating Uniform Sparsest Cut
  within any fixed constant factor is NP-hard, even with nonnegative rational capacities and unit demands.
  The Goemans–Linial semidefinite relaxation also has integrality gaps of order at least
  $sqrt(log n) \/ \( log log n \)^3$, approaching the square-root-logarithmic upper bound.

#metadata(none)
#label("result118")

#strong[118.Unbounded bin-packing gaps and the modified integer round-up conjecture.]Disproves the modified
  integer round-up conjecture of Scheithauer and Terno: the integral bin-packing optimum can exceed its
  configuration linear-programming value by an arbitrarily large additive constant.
  Approximating the optimum within any fixed additive constant is also NP-hard,
  even when every item exceeds $1 \/ 6$ and each bin holds at most five items.

#metadata(none)
#label("result119")

#strong[119.The Courtade–Kumar and Hellinger conjectures.]Proves the Courtade–Kumar conjecture:
  among Boolean functions of independent uniform bits, a single coordinate retains the most mutual information
  after independent bit-flip noise. A stronger theorem treats randomized binary summaries at fixed initial
  information. The Hellinger conjecture is also proved for every Boolean output bias and noise correlation.

#metadata(none)
#label("result120")

#strong[120.Almost-linear-time exact matching in general graphs.]Gives a randomized algorithm finding an exact
  maximum-cardinality matching in any simple undirected graph in $\( n + m \)^(1 + o \( 1 \))$ word time,
  with success probability at least $2 \/ 3$. The time bound holds on every computation path.
  The same guarantees apply to finding a spanning subgraph with prescribed admissible vertex degrees,
  or deciding that none exists.

#metadata(none)
#label("result121")

#strong[121.Almost-linear expected-time approximation of edit distance.]For every fixed rational $epsilon
  in \( 0 \, 1 \)$, gives a randomized $\( 1 + epsilon \)$ approximation to unit-cost edit distance in worst-case
  expected time $N^(1 + o \( 1 \))$, with success probability at least $2 \/ 3$.
  The strings have total length $N$ and polynomially bounded integer symbols.
  This is an asymptotic guarantee at fixed accuracy.

#metadata(none)
#label("result122")

#strong[122.Superpolynomial lower bounds and quasipolynomial reconstruction from deletion traces.]At every fixed
  deletion probability in $\( 0 \, 1 \)$, reconstructing an arbitrary length-$n$ binary string requires
  $n^(Omega \( log log n \))$ independent traces, ruling out polynomial-sample reconstruction.
  A uniform decoder achieves quasipolynomial sample and running-time bounds for known fixed rational retention
  probabilities. When the deletion probability is at most $n^(- epsilon)$ for fixed $epsilon > 0$,
  both bounds become polynomial in the input and parameter encoding.

#metadata(none)
#label("result124")

#strong[124.Polynomial-time scheduling on three identical machines.]Resolves the three-processor unit-job
  scheduling problem of Garey and Johnson: a deterministic polynomial-time algorithm minimizes makespan for
  nonpreemptive unit-length jobs with arbitrary precedence constraints on three identical parallel machines.
  For an explicitly given precedence graph, it decides deadline feasibility exactly and constructs a feasible schedule.

#metadata(none)
#label("result125")

#strong[125.The approximation threshold for metric $k$-median.]Gives a deterministic polynomial-time
  $\( 1 + 2 \/ e + epsilon \)$-approximation for finite rational metric $k$-median with specified candidate
  facilities, for every fixed $epsilon > 0$. Assuming $P eq.not N P$,
  the optimal infimum approximation factor is $1 + 2 \/ e$.

#metadata(none)
#label("result126")

#strong[126.Exponential semidefinite complexity of perfect matching.]Proves that every exact semidefinite lift of
  the perfect matching polytope has exponential size, answering Rothvoss’s polynomial-size lift question
  negatively. The bound holds even for the positive semidefinite rank of its odd-cut slack matrix after any fixed
  shift $0 < rho < 1$, allowing arbitrary real positive semidefinite factors.

#metadata(none)
#label("result127")

#strong[127.The asymptotic Gotsman–Linial conjecture.]Proves that a degree-at-most-$d$ polynomial threshold
  function on the uniform $n$-dimensional Boolean cube has average sensitivity at most $8 d sqrt(n)$,
  uniformly for $1 lt.eq d lt.eq n$. Average sensitivity counts expected output changes under single-bit flips.
  This establishes the asymptotic Gotsman–Linial conjecture, allowing polynomial zeros with $"sign" \( 0 \) = 1$.

#metadata(none)
#label("result128")

#strong[128.A factor-two approximation for shortest common superstring.]Gives a deterministic polynomial-time
  algorithm constructing a common superstring of length at most twice the optimum for every finite family of
  explicitly represented strings. The running time is polynomial in the full encoded input length,
  including symbol labels.

#metadata(none)
#label("result129")

#strong[129.Exponential state costs for two-way automata.]Proves exponential lower bounds both for complementing
  two-way nondeterministic finite automata and for simulating one-way nondeterministic automata by two-way
  deterministic ones. The latter resolves the Sakoda–Sipser state-succinctness conjecture over growing finite
  alphabets; both results rule out polynomial state bounds independent of alphabet size.

#metadata(none)
#label("result130")

#strong[130.Fourier transforms below $n log n$.]Gives a deterministic length-$n$ discrete Fourier transform
  algorithm using $O \( n \( log n \)^(1 - delta) \)$ operations for every $n$, with explicit $delta = 10^(- 13)$.
  The model uses exact complex arithmetic, unrestricted coefficients and a supplied root of unity,
  and counts scalar preparation and logarithmic-word indexing.

#metadata(none)
#label("result131")

#strong[131.Polynomial mixing of graph switches with prescribed degrees.]Resolves the simple-undirected
  Kannan–Tetali–Vempala conjecture: the lazy edge-switch chain mixes in $O \( n^8 \)$ time for every graphical
  labeled degree sequence. The same degree-constrained graphs can also be sampled exactly uniformly by an
  almost-surely terminating algorithm with expected polynomial bit running time.

#metadata(none)
#label("result132")

#strong[132.A counterexample to the quadratic sensitivity conjecture.]Constructs total Boolean functions with
  block sensitivity $"bs" \( f \) gt.eq s \( f \)^alpha$ for a fixed $alpha > 2$,
  disproving the quadratic strengthening of the Sensitivity Conjecture.
  Here $s \( f \)$ counts influential individual-bit flips,
  while block sensitivity allows disjoint groups of bits to change together.

#metadata(none)
#label("result133")

#strong[133.The complexity of Weisfeiler–Leman refinement.]Proves unconditional $n^(Omega \( k \))$ deterministic
  time lower bounds for joint and separate $k$-dimensional Weisfeiler–Leman equivalence,
  for sufficiently large fixed $k$ in the specified sequential adjacency-matrix models.
  With dimension as input, joint equivalence is EXPTIME-complete even on subcubic graphs;
  deciding whether refinement identifies a graph is also EXPTIME-complete.

#metadata(none)
#label("result134")

#strong[134.Generalized star height at most three.]Every regular language over a finite alphabet has a generalized
  regular expression with at most three nested Kleene stars, allowing union,
  concatenation and complement over the same alphabet. This establishes an absolute bound independent of automaton
  size, resolving the uniform-boundedness version of the generalized star-height problem.

#metadata(none)
#label("result135")

#strong[135.Sharp homogeneous depth-five complexity of matrix products.]Over every characteristic-zero field,
  the $\( 1 \, 1 \)$ entry of a product of $n$ independent $n times
  n$ variable matrices requires $n^(Theta \( sqrt(n) \))$ gates in homogeneous depth-five sum–product circuits.
  This sharp bound allows shared gates and bottom linear forms involving all variables.

#metadata(none)
#label("result136")

#strong[136.The quasilinear PCP-for-PPAD conjecture.]Resolves the quasilinear PCP-for-PPAD conjecture.
  An End-of-Line instance of length $N$ reduces to numerical circuit constraints of total length
  $N \( log N \)^(O \( 1 \))$ such that any polynomially encoded rational assignment satisfying all but a fixed
  fraction to fixed accuracy yields an endpoint solution. Such assignments always exist,
  giving robust local verification with only quasilinear size overhead.

#metadata(none)
#label("result137")

#strong[137.One-tape time simulation in two-fifths-power space.]Determines the halting and finite-control outcome
  of a fixed deterministic one-writable-tape machine up to time $T$ using $O \( T^(2 \/ 5) log^C \( T + 2 \) \)$
  space, improving the square-root exponent. Heads move at most one cell per step;
  finitely many read-only input heads are allowed. Initial contents are independent of $T$,
  and contents and input symbols have polylogarithmic-space access. Simulation time is unrestricted.

#metadata(none)
#label("result138")

#strong[138.Subset Sum in $O \( 2^(0.49 n) \)$ time.]Gives a uniform randomized classical algorithm for worst-case
  Subset Sum in ordinary $O \( 2^(0.49 n) \)$ word-RAM time on polynomial-bit inputs,
  where $n$ counts the integers. The time bound holds on every execution and success probability is at least $2 \/
  3$ on every input. Inputs may repeat positive integers; words have $O \( n + b \)$ bits for maximum input bit
  length $b$.

#metadata(none)
#label("result139")

#strong[139.Subpolynomial queries for log-concave sampling.]For $C^2$ potentials with a supplied minimizer and $I
  prec.curly.eq nabla^2 V prec.curly.eq 2 I$, proves that sampling within total variation $1 \/
  10$ requires only $C_epsilon d^epsilon$ exact value-and-gradient queries for every fixed $epsilon > 0$.
  The bound holds on every run, with unrestricted computation between queries.
  A logarithmic lower bound also holds, so the optimal power-law exponent in this oracle model is zero.

#metadata(none)
#label("result140")

#strong[140.Memory–sample lower bounds for noiseless Gaussian regression.]For fixed $A > 0$,
  a one-pass learner with $A d^2$ persistent bits needs $Omega_A \( d log \( 1 \/ epsilon.alt \) \)$ noiseless
  Gaussian samples to recover a unit vector to angular error $0 < epsilon.alt lt.eq
  1 \/ 10$ with probability $2 \/ 3$, uniformly in accuracy for large $d$.
  Computation and randomized updates are unrestricted, but output uses only the terminal state,
  stopping index and fresh randomness.

#metadata(none)
#label("result141")

#strong[141.The existential theory of the reals and existential–universal sentences in the counting
  hierarchy.]Proves that the existential theory of the reals lies in the counting hierarchy.
  More generally, truth of existential–universal real sentences can be decided at one fixed level of that
  hierarchy, even when their integer polynomials are specified by arithmetic circuits.

#metadata(none)
#label("result142")

#strong[142.Deterministic polynomial factorization over prime fields.]Gives a uniform deterministic algorithm that
  completely factors every nonzero dense degree-$n$ polynomial over a prime field $bb(F)_p$,
  including multiplicities, in bit complexity polynomial in $\( n + 1 \) log p$. The prime is supplied in binary.
  No randomness, integer-factorization or primitive-root oracle, or GRH assumption is required.

#metadata(none)
#label("subject12")

#strong[Dynamical systems and ergodic theory]

#metadata(none)
#label("result143")

#strong[143.Uniform limit-cycle bounds in Hilbert’s sixteenth problem.]Resolves the uniform boundedness assertion
  in Hilbert’s sixteenth problem: the number of isolated periodic orbits of a real planar polynomial vector field
  is bounded by a finite constant depending only on its degree.
  For classical quintic Liénard systems, the exact maximum is two limit cycles.

#metadata(none)
#label("result144")

#strong[144.Banach’s simple Lebesgue-spectrum problem.]Resolves the probability-preserving form of Banach’s simple
  Lebesgue-spectrum problem within smooth dynamics. A smooth volume-preserving diffeomorphism of the
  standard-volume three-torus has simple Lebesgue spectrum on its entire complex mean-zero $L^2$ space:
  the bilateral iterates of one real observable form an orthonormal basis of that space.

#metadata(none)
#label("result145")

#strong[145.Rokhlin’s multiple-mixing problem.]Proves that every invertible mixing probability-preserving
  transformation is mixing of all finite orders, resolving Rokhlin’s multiple-mixing problem for a single
  transformation. Correlations among any finite collection of measurable sets converge to the product of their
  measures whenever all pairwise time separations diverge.

#metadata(none)
#label("result146")

#strong[146.Sinai’s positive-entropy conjecture for the standard map.]Proves that the standard sine map on the
  two-dimensional torus has positive metric entropy with respect to area for every sufficiently large positive
  parameter. This establishes Sinai’s positive-parameter-measure conjecture for the original family,
  with the stronger conclusion of a full parameter tail.

#metadata(none)
#label("result147")

#strong[147.The near-boundary Birkhoff conjecture.]Resolves the near-boundary Birkhoff conjecture for smooth
  strictly convex planar billiards of positive curvature. Such a billiard is an ellipse whenever a full grazing
  annulus is continuously foliated by individually invariant essential curves.
  A continuous physical collar of smooth closed convex caustics also suffices.

#metadata(none)
#label("result148")

#strong[148.The dimension formula for self-similar measures on the line.]For every self-similar measure on the
  line generated by finitely many contracting similarities, proves $dim_(upright(H)) mu = min { 1 \,
  h_(upright("RW")) \/ chi }$, where $h_(upright("RW"))$ is the entropy rate of random composed maps and $chi$ the
  average logarithmic contraction. This resolves the entropy-rate dimension conjecture without a separation
  assumption, allowing exact overlaps and unequal contraction ratios.

#metadata(none)
#label("result149")

#strong[149.Permanence for weakly reversible reaction networks.]Proves the permanence conjecture for every finite
  weakly reversible mass-action system with fixed positive rate constants.
  Every positive stoichiometric compatibility class, even an unbounded one,
  has a common compact convex forward-invariant absorbing set.
  All positive trajectories in that class therefore eventually share positive lower and finite upper concentration
  bounds.

#metadata(none)
#label("result150")

#strong[150.Weak mixing of irrational triangular billiards.]Proves that the billiard flow in every nondegenerate
  Euclidean triangle with at least one angle irrational relative to $pi$ is weakly mixing for normalized area
  times uniform direction. This strengthens ergodicity on the entire irrational-angle class,
  with no genericity or Diophantine restrictions.

#metadata(none)
#label("result151")

#strong[151.A $C^1$ counterexample to Shub’s entropy conjecture.]Constructs a noninvertible $C^1$ self-map of a
  compact smooth manifold with zero topological entropy but eigenvalue $2$ on second homology.
  This disproves the homological entropy lower bound for general $C^1$ self-maps:
  homological growth need not force positive orbit complexity.

#metadata(none)
#label("result152")

#strong[152.Zero entropy does not guarantee a smooth positive-volume model.]Constructs a zero-entropy ergodic
  invertible transformation of a standard nonatomic probability space that is not measurably conjugate to any
  $C^oo$ diffeomorphism preserving a strictly positive smooth probability density on a compact finite-dimensional
  manifold. One example rules out every finite dimension.

#metadata(none)
#label("result153")

#strong[153.Arithmetic classification of Bernoulli convolutions.]Classifies singular and absolutely continuous
  unbiased Bernoulli convolutions for every $lambda in \( 0 \, 1 \)$ by an infinite,
  one-sided approximation condition using explicit finite sets of algebraic units.
  It also proves singularity at reciprocals of every quartic Salem number in $\( 1 \, 2 \)$,
  giving examples beyond reciprocal Pisot parameters.

#metadata(none)
#label("result154")

#strong[154.Pointwise multiple ergodic averages for mixing transformations.]Proves almost-everywhere convergence
  of consecutive multiple ergodic averages of every finite length for invertible mixing probability-preserving
  transformations. For each fixed tuple of bounded functions, the limit is the product of their integrals,
  along all positive averaging lengths. No mixing rate or standardness assumption on the probability space is required.

#metadata(none)
#label("subject13")

#strong[Combinatorics]

#metadata(none)
#label("result155")

#strong[155.A counterexample to periodic tiling in dimension three.]Constructs a finite translational tile in
  $bb(Z)^3$ that tiles space but admits no fully periodic tiling,
  disproving the periodic tiling conjecture in the smallest possible lattice dimension.
  Its unit-cube thickening gives the same counterexample in $bb(R)^3$, even with arbitrary real translation vectors.

#metadata(none)
#label("result156")

#strong[156.Borsuk’s conjecture fails in dimension nine.]Constructs a compact subset of $bb(R)^9$ that cannot be
  covered by ten sets of strictly smaller diameter, disproving Borsuk’s covering assertion already in dimension
  nine. The example consists of rank-one orthogonal projectors onto lines in $bb(R)^4$, with the Frobenius metric.

#metadata(none)
#label("result157")

#strong[157.Counterexamples to the Hadwiger and Colin de Verdière conjectures.]Disproves Hadwiger’s conjecture
  even for fractional coloring: arbitrarily large finite simple graphs with independence number at most two
  satisfy $chi_f \( G \) > h \( G \)$, where $h \( G \)$ is the largest clique-minor order.
  Also disproves the fractional Colin de Verdière chromatic bound $chi_f \( G \) lt.eq mu \( G \) + 1$.
  In the positive direction, every finite nonempty graph satisfies $chi_(upright("list")) \( G \) lt.eq
  C h \( G \)$ for a universal constant $C$.

#metadata(none)
#label("result158")

#strong[158.The Euclidean plane cannot be colored with five colors.]Proves that every five-coloring of the
  Euclidean plane has a monochromatic pair at distance one, with no restriction on the color classes.
  This advances the Hadwiger–Nelson problem: together with the classical seven-coloring,
  only six and seven remain possible chromatic numbers of the plane.

#metadata(none)
#label("result159")

#strong[159.Erdős’s reciprocal-sum conjecture and quasipolynomial Szemerédi bounds.]Proves Erdős’s conjecture that
  every set of positive integers with divergent reciprocal sum contains arithmetic progressions of every finite
  length. Quantitatively, for each fixed $k gt.eq 3$, every subset of ${ 1 \, dots.h \,
  N }$ with no nonconstant $k$-term progression has size at most $C_k N exp \[ - c_k \( log N \)^(epsilon_k) \]$,
  with positive constants depending only on $k$.

#metadata(none)
#label("result160")

#strong[160.Superexponential van der Waerden numbers.]Resolves Erdős’s superexponential-growth question for van
  der Waerden numbers. If $W_r \( k \)$ is the least interval length forcing a monochromatic $k$-term progression
  in every $r$-coloring, then $W_r \( k \) > k^(c k floor.l log_2 r floor.r)$ for an absolute $c > 0$,
  all $r gt.eq 2$ and sufficiently large $k$, uniformly in $r$.
  In particular, $W_r \( k \)^(1 \/ k) arrow.r oo$ for each fixed $r$.

#metadata(none)
#label("result161")

#strong[161.Counterexamples to Sidorenko’s conjecture and the forcing conjecture.]Disproves Sidorenko’s conjecture
  with a connected bipartite pattern on $35$ vertices and $66$ edges that occurs less frequently than in a random
  graph of the same edge density. The same pattern disproves the forcing conjecture of Skokan and Thoma:
  matching its density and the edge density of a constant graphon need not force quasirandomness.

#metadata(none)
#label("result162")

#strong[162.Counterexamples to Ryser’s covering and Gyárfás’s tree-cover conjectures.]Disproves Ryser’s covering
  conjecture by constructing intersecting $\( q + 1 \)$-partite,
  $\( q + 1 \)$-uniform hypergraphs with covering number $q + 1$, rather than the predicted bound $q$,
  for every sufficiently large prime $q$. A separate construction over extension fields also disproves Gyárfás’s
  monochromatic tree-cover conjecture.

#metadata(none)
#label("result164")

#strong[164.Hindman’s finite sums and products conjecture.]Proves Hindman’s finite sums and products conjecture:
  every finite coloring of the positive integers contains sets of any prescribed finite size whose nonempty subset
  sums and nonempty subset products all have one common color.

#metadata(none)
#label("result165")

#strong[165.Exact crossing numbers of complete and complete bipartite graphs.]Resolves the Harary–Hill conjecture
  and Turán’s brickyard problem in the Zarankiewicz formulation,
  determining the crossing numbers of every complete and complete bipartite graph.
  The result proves the optimality of the classical drawings among all plane drawings with continuous edge arcs.

#metadata(none)
#label("result166")

#strong[166.The higher-dimensional Erdős distinct-distances conjecture.]For every fixed $d gt.eq 3$, any $n gt.eq
  2$ distinct points in $bb(R)^d$ determine at least $c_d n^(2 \/ d)$ distinct distances,
  with $c_d > 0$ depending only on dimension. This matches the integer-grid order and resolves the
  higher-dimensional Erdős distinct-distances conjecture with a constant-factor bound.

#metadata(none)
#label("result167")

#strong[167.Pinned distances and a power saving for planar unit distances.]Proves the weak pinned Erdős distance
  conjecture: for every fixed $epsilon > 0$, all but $o \( n \)$ points of any $n$-point planar set determine at
  least $n^(1 - epsilon)$ distinct nonzero distances. A complementary theorem bounds the number of unit-distance
  pairs by $O \( n^(4 \/ 3 - delta) \)$ for an absolute $delta > 0$.

#metadata(none)
#label("result168")

#strong[168.Combinatorial invariance of Kazhdan–Lusztig polynomials.]Resolves the full combinatorial invariance
  conjecture: isomorphic Bruhat intervals in arbitrary Coxeter systems have identical equal-parameter
  Kazhdan–Lusztig polynomials. Thus the abstract order of the interval determines the polynomial,
  even across different Coxeter systems.

#metadata(none)
#label("result169")

#strong[169.The Shareshian–Wachs $e$-positivity conjecture.]Resolves the elementary-positivity part of the
  Shareshian–Wachs conjecture: the chromatic quasisymmetric function of every natural unit interval graph has
  elementary-basis coefficients in $bb(N) \[ q \]$. The coefficients count explicitly described permutations,
  giving a combinatorial explanation of positivity.

#metadata(none)
#label("result170")

#strong[170.Sharp logarithmic exponents for off-diagonal Ramsey numbers.]For every fixed integer $s gt.eq 5$,
  proves $r \( s \, t \) = t^(s - 1) \/ \( log t \)^(s - 2 + o \( 1 \))$ as $t arrow.r oo$,
  determining the logarithmic exponent and matching the classical upper bound at that scale.
  Here $r \( s \, t \)$ is the least number of vertices forcing an $s$-clique or a $t$-vertex independent set.

#metadata(none)
#label("result171")

#strong[171.The hypercube Ramsey conjecture.]Resolves the Burr–Erdős hypercube Ramsey conjecture:
  the two-color Ramsey number of the $n$-dimensional cube is $Theta \( 2^n \)$.
  Thus every red-blue coloring of a complete graph on a universal constant times the cube’s number of vertices
  contains a monochromatic copy of the cube.

#metadata(none)
#label("result172")

#strong[172.Classification of finite Euclidean Ramsey configurations.]Classifies finite point configurations that
  occur monochromatically, at their original scale, in every finite coloring of sufficiently high-dimensional
  Euclidean space. The characterization is an algebraic condition over the coordinate field.
  It also disproves the Leader–Russell–Walters conjecture that every such configuration is a subset of a finite
  transitive set.

#metadata(none)
#label("result173")

#strong[173.Seymour’s second-neighborhood conjecture.]Proves Seymour’s second-neighborhood conjecture:
  every nonempty finite oriented graph has a vertex with at least as many vertices at directed distance exactly
  two as at directed distance one. Oriented graphs may be arbitrary apart from the exclusion of loops and
  oppositely directed edge pairs.

#metadata(none)
#label("result174")

#strong[174.Deterministic construction of strong thin spanning trees.]Resolves the strong thin-tree conjecture
  constructively. Every finite loopless $k$-edge-connected multigraph on at least two vertices has a spanning tree
  containing at most a universal $C \/ k$ fraction of the edges of every cut.
  Such a tree can be found deterministically in polynomial time, even with binary-encoded parallel-edge multiplicities.

#metadata(none)
#label("result175")

#strong[175.Talagrand’s conjectures and graph decompositions at expectation thresholds.]Proves that integral and
  fractional expectation thresholds differ by at most a universal factor,
  and resolves Talagrand’s discrete-convexity conjecture. An application proves the Ascoli–He–Park–Talagrand
  graph-decomposition conjecture: every graph’s edges split into a universally bounded number of fixed pieces,
  each with containment threshold at most a universal constant times the original graph’s integral expectation
  threshold. The pieces’ embeddings need not agree on shared vertices.

#metadata(none)
#label("result176")

#strong[176.The second Kahn–Kalai conjecture.]Proves the second Kahn–Kalai conjecture:
  for every finite simple graph $H$ with $h gt.eq 1$ edges and at most $n$ vertices,
  its appearance threshold in $G \( n \, p \)$ is at most $C p_(upright(E)) \( n \, H \) \( 1 + log_2 h \)$,
  with universal $C$. Here $p_(upright(E))$ is the least density at which every subgraph of $H$ has expected copy
  count at least $1 \/ 2$.

#metadata(none)
#label("result177")

#strong[177.Bounded-degree coboundary expanders in every dimension.]Constructs arbitrarily large finite
  $d$-dimensional simplicial complexes, for every $d gt.eq 3$,
  with uniformly bounded vertex degrees and uniform $bb(F)_2$ coboundary expansion in every degree below $d$.
  Together with the known graph and two-dimensional cases, this establishes the existence of such expanders in
  every positive dimension.

#metadata(none)
#label("result178")

#strong[178.Deterministic nonbipartite Ramanujan graphs in every fixed degree.]For every fixed $d gt.eq 3$,
  constructs a simple $d$-regular nonbipartite Ramanujan graph on every sufficiently large even number $n$ of
  vertices, with every nonconstant adjacency eigenvalue strictly between $- 2 sqrt(d - 1)$ and $2 sqrt(d - 1)$.
  A deterministic algorithm outputs the full adjacency list in polynomial bit time, with exponent depending on $d$.

#metadata(none)
#label("result179")

#strong[179.The circulant Hadamard conjecture.]Proves that real circulant Hadamard matrices exist exactly in
  orders $1$ and $4$, resolving the circulant Hadamard conjecture.
  Together with classical Barker-sequence results, this shows that binary sequences whose nontrivial aperiodic
  autocorrelations have magnitude at most $1$ exist at lengths $n > 1$ exactly when $n in { 2 \, 3 \, 4 \, 5 \,
  7 \, 11 \, 13 }$.

#metadata(none)
#label("result180")

#strong[180.Barnette’s Hamiltonian-cycle conjecture.]Proves that every finite simple cubic bipartite planar
  $3$-vertex-connected graph has a Hamiltonian cycle, resolving Barnette’s conjecture.
  Equivalently, every three-edge path in a finite simple cubic $3$-vertex-connected bipartite Pfaffian graph lies
  in a Hamiltonian cycle.

#metadata(none)
#label("result181")

#strong[181.The Erdős–Gallai cycle-decomposition conjecture.]Proves that the edges of every finite simple
  undirected graph on $n$ vertices can be partitioned into at most $C n$ simple cycles and single edges,
  for an absolute constant $C$. This resolves the Erdős–Gallai cycle-decomposition conjecture,
  bounding the number of pieces linearly even for dense graphs.

#metadata(none)
#label("result182")

#strong[182.Power savings for polynomial-difference-free sets.]For every fixed intersective integer polynomial $h$
  of degree $k gt.eq 2$ with positive leading coefficient, proves that a subset of ${ 1 \, dots.h \,
  N }$ avoiding nonzero values $h \( 1 \) \, h \( 2 \) \, dots.h$ as differences has size $O_h \( N^(1 - c_k) \)$,
  with $c_k > 0$ depending only on degree. Here intersective means having a root modulo every modulus.
  For prime arguments, a power saving also holds when $h$ has a unit root modulo every modulus,
  with exponent allowed to depend on $h$.

#metadata(none)
#label("result183")

#strong[183.Power savings for planar halving lines and $k$-sets.]Improves the planar halving-line bound to
  $O \( n^(4 \/ 3 - epsilon) \)$ for sets with no three collinear and an absolute $epsilon > 0$.
  More generally, an $n$-point set with no three collinear has $O \( n \( k + 1 \)^(1 \/ 3 - epsilon_0) \)$
  strictly separable $k$-subsets for $1 lt.eq k lt.eq n \/ 2$, with an absolute $epsilon_0 > 0$.
  The constants and positive exponents are nonquantitative.

#metadata(none)
#label("result184")

#strong[184.Coloring and independence in graphs with forbidden subgraphs.]Proves the Alon–Krivelevich–Sudakov
  coloring conjecture in correspondence-coloring form: graphs avoiding any fixed subgraph $F$ need
  $O_F \( Delta \/ log Delta \)$ colors when their maximum degree $Delta$ is sufficiently large.
  Also proves the Ajtai–Erdős–Komlós–Szemerédi independence conjecture:
  for fixed $r gt.eq 4$, every $n$-vertex $K_r$-free graph of average degree $d gt.eq
  2$ has an independent set of size $Omega_r \( n log d \/ d \)$.

#metadata(none)
#label("result185")

#strong[185.Counterexamples to infinite matroid intersection and packing/covering.]Disproves the unrestricted
  infinite matroid intersection and packing/covering conjectures in ZFC,
  using two self-dual partitional matroids on a countably infinite ground set.
  The same examples answer Joó’s partitional-matroid question negatively.
  They are neither finitary nor cofinitary, so Nash-Williams’ original finitary conjecture remains outside the result.

#metadata(none)
#label("result186")

#strong[186.The Friedgut–Kalai graph and hypergraph threshold conjectures.]Proves the Friedgut–Kalai
  threshold-width conjectures for graphs and fixed-uniformity hypergraphs.
  For fixed $0 < epsilon < 1 \/ 2$, every nontrivial increasing relabeling-invariant property crosses from
  probability $epsilon$ to $1 - epsilon$ within width $O \( \( log n \)^(- 2) \)$ for graphs and
  $O_r \( \( log n \)^(- r \/ \( r - 1 \)) \)$ for $r$-uniform hypergraphs, $r gt.eq 3$.
  The hypergraph influence bound also applies to nonmonotone properties.

#metadata(none)
#label("result187")

#strong[187.Snaky in 21 Maker moves.]Settles the Snaky achievement problem:
  Maker can force the six-cell Snaky shape within 21 of its own moves on the initially empty infinite square
  board. Maker moves first, each player claims one free cell per turn, and translations,
  rotations and reflections count as wins.

#metadata(none)
#label("result188")

#strong[188.The sharp constant in random triangle removal.]Starting from the complete graph on $n$ vertices,
  repeatedly delete a uniformly chosen remaining triangle. The terminal edge count is asymptotic to
  $n^(3 \/ 2) \/ \( 2 sqrt(2) \)$, with mean-square convergence after normalization by $n^(3 \/ 2)$.
  This proves the triangle case of the Joos–Kühn sharp-constant conjecture.

#metadata(none)
#label("result189")

#strong[189.Exact cycle–clique Ramsey numbers.]Proves the Erdős–Faudree–Rousseau–Schelp conjecture:
  $R \( C_m \, K_n \) = \( m - 1 \) \( n - 1 \) + 1$ for every $m gt.eq n gt.eq 3$, except $R \( C_3 \, K_3 \) =
  6$. This is the exact threshold forcing a red $m$-cycle or a blue $n$-clique in every red–blue coloring of a
  complete graph.

#metadata(none)
#label("result190")

#strong[190.Polynomial removal fails for ordered binary matrices.]Disproves polynomial ordered binary matrix
  removal with one fixed $66 times 66$ zero–one pattern. Matrices can require many binary-entry changes to become
  pattern-free while their copy density is smaller than every proposed polynomial bound in that distance.
  Copies preserve row and column orders and match both zeros and ones.

#metadata(none)
#label("result191")

#strong[191.A power improvement in the Heilbronn triangle problem.]For every sufficiently large $n$,
  constructs $n$ points in the unit square such that every triangle has area at least $n^(- 2 + c)$ for one
  absolute $c > 0$. This disproves the conjectured almost-$n^(- 2)$ upper bound in Heilbronn’s triangle problem,
  which asks how large the smallest determined triangle can be.

#metadata(none)
#label("result192")

#strong[192.A counterexample to the Gopalan–Servedio conjecture.]Disproves the proposed square-root bound relating
  a Boolean function’s linear Fourier coefficients to its polynomial degree.
  For every $C > 0$, there is a sign-valued Boolean function $f$ with $sum_i hat(f) \( { i } \) > C
  sqrt(deg \( f \))$. Thus its total signed correlation with individual input bits can exceed the proposed bound
  by an arbitrary factor.

#metadata(none)
#label("subject2")

#strong[Algebra]

#metadata(none)
#label("result193")

#strong[193.Serre’s intersection-multiplicity conjecture.]Proves strict positivity of Serre’s intersection
  multiplicity $chi^R \( M \, N \)$ for nonzero finitely generated modules over any regular local ring,
  provided $M ⊗_R N$ has finite length and $dim M + dim N = dim R$.
  This resolves the positivity conjecture, including ramified mixed characteristic.

#metadata(none)
#label("result194")

#strong[194.Lech’s multiplicity conjecture.]Proves $e \( R \) lt.eq
  e \( S \)$ for every flat local homomorphism of nonzero Noetherian local rings,
  where $e$ is Hilbert–Samuel multiplicity. This resolves Lech’s conjecture in every dimension and characteristic.

#metadata(none)
#label("result195")

#strong[195.A counterexample to the small Cohen–Macaulay module conjecture.]Constructs a three-dimensional
  complete Noetherian normal local domain over $bb(C)$ with no nonzero finitely generated maximal Cohen–Macaulay
  module. A three-dimensional local domain essentially of finite type over $bb(C)$ has the same property,
  disproving the domain form of the small Cohen–Macaulay module conjecture.

#metadata(none)
#label("result196")

#strong[196.A counterexample to Kaplansky’s zero-divisor conjecture.]Constructs a finitely presented torsion-free
  group $G$ whose group algebra $bb(F)_2 \[ G \]$ has nonzero zero divisors,
  disproving Kaplansky’s zero-divisor conjecture. The group has a finite two-dimensional classifying space.

#metadata(none)
#label("result197")

#strong[197.Nonsofic groups and group-ring counterexamples.]Constructs a finitely presented torsion-free nonsofic
  group whose group algebra over $bb(F)_2$ is not directly finite,
  disproving Kaplansky’s conjecture even without torsion. Companion examples give injective nonsurjective cellular
  automata on all configurations, refuting Gottschalk’s surjunctivity conjecture.
  Another counterexample is an integral group-ring matrix, invertible over the rational group ring,
  with Fuglede–Kadison determinant strictly between zero and one, disproving the unrestricted Determinant Conjecture.

#metadata(none)
#label("result198")

#strong[198.A counterexample to the little finitistic-dimension conjecture.]Constructs a finite-dimensional
  complex algebra whose finite-dimensional modules have unbounded finite projective dimensions.
  This disproves the little finitistic-dimension conjecture.

#metadata(none)
#label("result199")

#strong[199.Counterexamples to conjectures of Auslander–Reiten, Tachikawa,
  and Nakayama.]Constructs finite-dimensional algebras over a characteristic-two rational-function field that
  disprove the Auslander–Reiten and Gorenstein-projective conjectures, and Tachikawa’s second conjecture.
  An associated endomorphism algebra also disproves the classical, generalized and strong Nakayama conjectures,
  the Auslander–Gorenstein conjecture, and the Wakamatsu tilting conjecture.
  The counterexamples persist under every extension of the base field.

#metadata(none)
#label("result200")

#strong[200.Eisenbud–Green–Harris and lex-plus-powers in characteristic zero.]Proves the Eisenbud–Green–Harris and
  lex-plus-powers conjectures over every characteristic-zero field.
  Any homogeneous ideal containing a regular sequence, of arbitrary length and degrees at least two,
  admits a lex-plus-powers ideal with the same Hilbert function and no smaller graded Betti numbers.

#metadata(none)
#label("result201")

#strong[201.A counterexample to Kurosh’s division-ring problem.]Constructs a countable characteristic-zero
  division ring that is algebraic over its center and generated by two elements over that center,
  but has infinite dimension over it. This answers Kurosh’s division-ring problem on local finiteness negatively.

#metadata(none)
#label("result202")

#strong[202.The blockwise Alperin weight conjecture.]Proves the numerical blockwise Alperin weight conjecture for
  every prime and every finite group: the number of irreducible Brauer characters in a block equals the number of
  conjugacy classes of its weights.

#metadata(none)
#label("result203")

#strong[203.Donovan’s conjecture over fields and discrete valuation rings.]Proves Donovan’s conjecture:
  over each fixed algebraically closed field of characteristic $p$,
  blocks of finite groups with bounded defect-group order have only finitely many Morita-equivalence classes,
  for every prime $p$. Also proves the integral form over each fixed complete mixed-characteristic discrete
  valuation ring with algebraically closed residue field.

#metadata(none)
#label("result204")

#strong[204.Tensor saturation for even spin groups.]Proves saturation factor one for $"Spin" \( 2 n \)$, $n gt.eq
  2$: for three dominant integral weights whose sum lies in the root lattice,
  an invariant at any common positive integral dilation already gives an invariant at the original weights.
  This resolves the type-$D$ part of the simply-laced saturation conjecture.

#metadata(none)
#label("result205")

#strong[205.Saxl’s conjecture and universal tensor squares.]Proves Saxl’s conjecture:
  the tensor square of every staircase representation contains every irreducible complex representation of the
  corresponding symmetric group. More generally, every $S_n$ with $n in.not { 2 \, 4 \,
  9 }$ has an irreducible representation whose tensor square contains all irreducibles.

#metadata(none)
#label("result206")

#strong[206.Finite lattice representation: counterexamples and undecidability.]Some finite lattices are not
  congruence lattices of any finite algebra, answering the finite lattice representation problem negatively.
  Moreover, no algorithm decides whether a finite lattice has such a representation,
  or whether it is a full subgroup interval of a finite group.

#metadata(none)
#label("result207")

#strong[207.The $ell^1$-Bass and complex Bass trace conjectures.]Proves the $ell^1$-Bass conjecture for every
  discrete group: Hattori–Stallings traces of idempotent matrices over $ell^1 \( G \)$ are supported on finitely
  many finite-order conjugacy classes. The algebraic companion proves the integral Bass trace conjecture and
  Kaplansky’s idempotent conjecture for torsion-free groups over every commutative unital characteristic-zero domain.

#metadata(none)
#label("result208")

#strong[208.The finite Benson–Etingof–Ostrik conjecture.]Proves that every finite symmetric tensor category over
  an algebraically closed field $k$ of characteristic $p > 0$ admits a $k$-linear exact faithful strong symmetric
  monoidal fiber functor to a higher Verlinde category $upright("Ver")_(p^n)$.
  The level may depend on the category, and the theorem includes characteristic two,
  resolving the finite case of the Benson–Etingof–Ostrik conjecture.

#metadata(none)
#label("result209")

#strong[209.Integral counterexamples to Gersten’s conjecture.]Disproves unrestricted integral Gersten injectivity
  in degrees $3$ and $5$. Two explicit two-dimensional ramified regular local rings of mixed characteristic
  $\( 0 \, 5 \)$ have nonzero integral $K$-theory classes that vanish over their fraction fields.

#metadata(none)
#label("result210")

#strong[210.Foulkes’ conjecture for sixth powers and quadratic stabilization.]Proves the sixth case of Foulkes’
  conjecture: $"Sym"^6 \( "Sym"^b V \)$ embeds equivariantly in $"Sym"^b \( "Sym"^6 V \)$ for every $b gt.eq
  6$ and finite-dimensional complex $V$. More generally, the canonical multiplication map $"Sym"^b \( "Sym"^a V \)
  arrow.r "Sym"^a \( "Sym"^b V \)$ is surjective for $a gt.eq 2$ and $b gt.eq a \( a - 1 \)$,
  giving dimension-independent quadratic stabilization.

#metadata(none)
#label("subject15")

#strong[Probability and statistical mechanics]

#metadata(none)
#label("result211")

#strong[211.Geometry, diffusion, and spectra of random planar maps.]Critical Fortuin–Kasteleyn planar maps
  converge to Liouville quantum gravity spheres for $0 < q lt.eq
  4$ and to the Brownian continuum random tree for $q > 4$, establishing the surface-to-tree geometric transition.
  For FK–Ising and spanning-tree-weighted maps, stationary random walks converge to Liouville Brownian motion on
  the limiting sphere. The FK–Ising spectral result also gives convergence of eigenvalues and heat traces,
  using the stated Brownian/LQG inputs.

#metadata(none)
#label("result212")

#strong[212.No bigeodesics and smooth limit shapes in planar first-passage percolation.]Proves that planar
  first-passage percolation has no doubly infinite geodesic for iid nonnegative nonatomic edge weights when the
  minimum of four weights has finite second moment. For exponential weights,
  the limit shape is strictly convex with $C^1$ boundary. Differentiability also holds for every Gamma law with
  positive shape and rate.

#metadata(none)
#label("result213")

#strong[213.No infinite critical clusters on quasi-transitive graphs.]Resolves the Benjamini–Schramm criticality
  conjecture for bond percolation on every infinite connected locally finite quasi-transitive graph with $p_c <
  1$: at the critical probability, there is almost surely no infinite cluster.
  The family also establishes this conclusion for both nearest-neighbor bond and site percolation on $bb(Z)^3$.

#metadata(none)
#label("result214")

#strong[214.The Benjamini–Schramm nonuniqueness conjecture.]Proves $p_c <
  p_u$ for Bernoulli bond percolation on every infinite connected locally finite nonamenable quasi-transitive
  graph, resolving the Benjamini–Schramm nonuniqueness conjecture.
  Thus there is a nonempty range of probabilities with infinitely many infinite clusters.
  A stronger operator bound also establishes the critical triangle condition.

#metadata(none)
#label("result215")

#strong[215.Massive continuum limits and exact mass asymptotics for planar $O \( n \)$ models.]Constructs the
  canonical continuum limit of the two-dimensional nearest-neighbor $O \( 3 \)$ model:
  a non-Gaussian local relativistic theory with a unique vacuum and a positive mass gap.
  For the square-lattice $O \( 4 \)$ model, determines the exact leading asymptotic of the full transfer gap,
  $m_(upright("lat")) \( beta \) tilde.op 32 e^(pi \/ 4 - 1 \/ 2) sqrt(beta) thin e^(- pi beta)$.
  The family also proves exponential spin-correlation decay for two-dimensional nearest-neighbor $O \( n \)$
  models with $n gt.eq 3$ at every positive temperature.

#metadata(none)
#label("result216")

#strong[216.Critical logarithmic corrections and BKT scaling for the planar XY model.]For the square-lattice
  nearest-neighbor cosine XY model, proves critical axis correlations $C_(beta_c) \( r \) tilde.op A
  r^(- 1 \/ 4) \( log r \)^(1 \/ 8)$ and the Berezinskii–Kosterlitz–Thouless essential singularity
  $sqrt(beta_c - beta) log xi \( beta \) arrow.r B$, with $A \, B > 0$ after the free-box thermodynamic limit.
  For finite square-symmetric interactions containing nearest neighbors,
  discrete Gaussian heights converge to Gaussian fields throughout the rough phase, including its threshold,
  along geometric torus sizes. Critical center-magnetization and spin-field conclusions retain their stated
  height, renormalization, and field-input assumptions.

#metadata(none)
#label("result217")

#strong[217.The low-temperature Sherrington–Kirkpatrick fluctuation law.]For every fixed inverse temperature
  $beta > 1$, determines the fluctuation scale and limiting law of the zero-field Gaussian Sherrington–Kirkpatrick
  log partition function. Its variance is asymptotic to $c_beta n^(1 \/ 3)$, with $c_beta > 0$,
  confirming the predicted $n^(1 \/ 6)$ standard-deviation scale.
  Exact centering and standardization give full-sequence convergence to a uniquely characterized nondegenerate law.

#metadata(none)
#label("result218")

#strong[218.Conformal universality for weakly interacting and disordered Ising models.]Weak finite-range
  square-symmetric even multispin perturbations of the square-lattice Ising model preserve critical bulk spin and
  energy limits; weak square-symmetric contour interactions also yield chordal $upright("SLE")_3$ interface
  limits. With sufficiently weak iid bond disorder of any fixed bounded nondegenerate mean-zero law,
  critical spin interfaces converge to the same law in probability over environments.

#metadata(none)
#label("result219")

#strong[219.GOE universality for random regular graphs with weak disorder.]For every fixed degree $d gt.eq 3$,
  the bulk adjacency-eigenvalue point process of a uniform simple random $d$-regular graph converges to the
  Gaussian orthogonal ensemble law, including for cubic graphs.
  The same fixed-energy universality persists under sufficiently weak fixed iid uniform diagonal disorder,
  throughout compact bands strictly inside the clean spectral edges.

#metadata(none)
#label("result220")

#strong[220.Directional zero–one laws and ballisticity in random environments.]On $bb(Z)^d$, $d gt.eq 3$,
  directional escape has probability zero or one for iid strictly elliptic nearest-neighbor environments,
  and for stationary ergodic finite-range-dependent environments under uniform ellipticity.
  In iid uniformly elliptic environments with $d gt.eq 2$, almost-sure directional transience implies a
  deterministic limiting velocity with positive projection in that direction, resolving the ballisticity conjecture.

#metadata(none)
#label("result221")

#strong[221.The Mézard–Parisi formula for diluted spin glasses.]Proves the Mézard–Parisi hierarchical cavity
  formula for Poisson-diluted even-arity Ising models satisfying the Panchenko–Talagrand factorization and
  positivity assumptions, with only first-moment integrability.
  The limiting free energy equals the infimum over finite-depth hierarchical trial laws.
  This includes the Viana–Bray model, symmetric diluted even-spin models, and weighted soft even-$K$ satisfiability.

#metadata(none)
#label("result222")

#strong[222.Perceptron free energies and microscopic jamming.]Determines finite-temperature variational free
  energies for Gaussian Ising perceptrons with bounded Borel log-potentials and Gaussian spherical perceptrons
  with bounded continuous potentials, at every positive pattern density.
  A spherical extension treats bi-orthogonally invariant disorder with compact limiting singular-value
  distributions and no outliers. At margin $- 1$, the quadratic-penalty spherical model has a sharp feasibility
  threshold and limiting gap and force laws, with system size, zero temperature,
  and critical density taken in that order.

#metadata(none)
#label("result223")

#strong[223.Conformal limits of square-lattice random-cluster interfaces.]Proves chordal $upright("SLE")_kappa$
  limits for critical square-lattice random-cluster interfaces for $0 < q lt.eq 4$, with $kappa =
  4 pi \/ arccos \( - sqrt(q) \/ 2 \)$: bounded Jordan domains are allowed for $q gt.eq 1$,
  and smooth Jordan domains for $q < 1$, under the stated marked-boundary approximations.
  For $1 lt.eq q lt.eq 4$, complete nested plane loops converge to $upright("CLE")_kappa$.

#metadata(none)
#label("result224")

#strong[224.Critical and near-critical universality for Voronoi percolation.]Proves Cardy’s formula for annealed
  critical Poisson–Voronoi crossing probabilities in every bounded Jordan quadrilateral.
  With each model normalized by its own expected unit-square pivotal count,
  the conditional joint near-critical crossing-threshold laws for rational polygonal quads converge in environment
  probability to the triangular-lattice reference law. This establishes quenched near-critical universality for
  crossing thresholds.

#metadata(none)
#label("result225")

#strong[225.Gaussian free field limits for the balanced six-vertex model.]The balanced square-lattice six-vertex
  height field with $a = b = 1$ and $0 < c lt.eq 2$ converges to a Gaussian free field,
  including at the endpoint $c = 2$. The plane state is defined by balanced-torus limits.
  For unit height increments and Green kernel $- \( 2 pi \)^(- 1) log \| x - y \|$,
  the exact variance multiplier is $1 \/ arcsin \( c \/ 2 \)$.

#metadata(none)
#label("result226")

#strong[226.The double-dimer $upright("CLE")_4$ conjecture in the half-plane.]Resolves the half-plane Temperleyan
  form of the double-dimer scaling-limit conjecture: the complete loop ensemble formed by two independent dimer
  coverings of the Temperleyan square lattice converges to nested $upright("CLE")_4$.
  Convergence matches every macroscopic loop as an unparametrized curve,
  upgrading convergence of loop observables to convergence of the loops themselves.

#metadata(none)
#label("result227")

#strong[227.The dynamical phase transition in the Sherrington–Kirkpatrick model.]For zero-field Gaussian SK
  heat-bath dynamics with rate-one updates per spin, proves worst-start cutoff on the $log n$ scale for fixed $0
  lt.eq beta < 1$, mixing time $n^(2 \/ 3 + o \( 1 \))$ at $beta = 1$,
  and stretched-exponential mixing from a Gibbs-sampled fixed starting configuration for $beta > 1$,
  in probability over disorder. At criticality, rescaled stationary and quench autocorrelation processes have
  universal random limits for Gaussian and Rademacher disorder; the quench limit relaxes to the stationary limit.

#metadata(none)
#label("result228")

#strong[228.Continuum phase transitions for radial pair potentials.]Constructs stable distance-dependent pair
  interactions for three-dimensional classical particles with a first-order phase transition:
  the canonical free energy has a derivative jump at one inverse temperature throughout an open density interval.
  One potential has a divergent repulsive core; another is bounded and continuous with an integrable power-law
  tail, realizing the type of transition sought in Simon’s continuum problem.

#metadata(none)
#label("result229")

#strong[229.Sharp three- and four-state reconstruction thresholds.]Proves the exact reconstruction threshold $d
  lambda^2 > 1$, with nonreconstruction at equality, for three-state symmetric and four-state ferromagnetic
  broadcasting on regular trees ($d gt.eq 2$) and observed Poisson trees (mean $d > 1$ and $d > 0$, respectively),
  with Poisson advantage averaged without conditioning on survival.
  The three-state theorem allows both signs of $lambda$ and gives the exact weak-recovery threshold for the
  symmetric three-community stochastic block model.

#metadata(none)
#label("result230")

#strong[230.Exact Hausdorff measure for SLE.]Resolves Schramm’s Hausdorff-measure question for chordal
  $upright("SLE")_kappa$, $0 < kappa < 8$. The explicit gauge $r^d \( log log \( 1 \/ r \) \)^(\( 2 - d \) \/ 2)$,
  $d = 1 + kappa \/ 8$, gives almost surely positive finite measure to every trace segment
  $gamma \( \[ s \, t \] \)$ with $0 < s < t < oo$, and finite expected measure to the trace in every bounded disk.

#metadata(none)
#label("result231")

#strong[231.The free uniform spanning forest is a factor of IID.]On every infinite connected locally finite simple
  unweighted graph, the free uniform spanning forest is a factor of independent vertex labels,
  by one isomorphism-equivariant rule using no root. Translation-invariant strongly Rayleigh binary processes on
  every countable group, including invariant determinantal processes with Hermitian positive-contraction kernels,
  are also factors of IID.

#metadata(none)
#label("result232")

#strong[232.Gaussian fields and SLE interfaces for Lipschitz heights.]Proves Gaussian free field limits on bounded
  smooth simply connected domains for triangular-lattice height models:
  uniform odd heights with increments $0 \, plus.minus 2$ and two-arc boundary values $plus.minus 1$,
  and zero-boundary integer Lipschitz heights weighted by fixed $x in \[ 1 \/ sqrt(2) \, 1 \]$.
  Uniform real Lipschitz heights also converge to a Gaussian field; at a tuned opposite-boundary amplitude,
  their interface converges to chordal $upright("SLE")_4$, establishing Schramm’s real-field/interface predictions.

#metadata(none)
#label("result233")

#strong[233.The joint critical Ashkin–Teller scaling limit.]Identifies the joint scaling limit of Ashkin–Teller
  heights and both complete current-cluster collections throughout the critical line,
  including the four-state Potts endpoint. In bounded Jordan domains with admissible lattice approximations and
  wired primal/free dual boundaries, the height converges to the predicted Gaussian free field,
  and the clusters to canonical recursive sets of that same field, retaining every nesting depth.

#metadata(none)
#label("result234")

#strong[234.All-temperature pressure for orthogonally invariant Ising spin glasses.]Gives an exact variational
  formula for the limiting pressure of orthogonally invariant Ising spin glasses at every fixed temperature,
  both almost surely and in expectation. The coupling matrix is a Haar-random rotation of a deterministic spectrum
  converging to a compactly supported law, with extreme eigenvalues converging to its support edges.
  The zero-field ground-state energy follows as temperature tends to zero.

#metadata(none)
#label("result235")

#strong[235.Random-SAT thresholds, sharp variance and computability.]For random $k$-SAT with independent uniformly
  signed proper clauses sampled with replacement, proves finite positive limiting thresholds and hitting-time
  variance $Theta_k \( n \)$ for every fixed $k gt.eq 3$, and computability of the 3-SAT threshold.
  We credit Gaia Carenini with priority for resolving the threshold-existence conjecture in her concurrent
  #link("https://eccc.weizmann.ac.il/report/2026/229/")[ECCC TR26-229], made public October 5, 2026;
  this family supplies another proof and the sharper variance and computability results.

#metadata(none)
#label("result236")

#strong[236.The factor-of-IID threshold for free Ising states on trees.]Determines when the free zero-field
  ferromagnetic Ising state on the infinite $d$-regular tree is a factor of independent vertex labels:
  exactly when $tanh beta lt.eq \( d - 1 \)^(- 1 \/ 2)$, including equality, for $d gt.eq 3$ and $beta gt.eq 0$.
  The construction uses no root and is almost surely equivariant for each fixed tree automorphism,
  resolving the ferromagnetic case of Lyons’s question.

#metadata(none)
#label("result237")

#strong[237.The three-quarter diameter exponent for honeycomb walks.]Proves the diameter form of Nienhuis’s
  predicted three-quarter exponent: a uniformly chosen $n$-step self-avoiding walk on the honeycomb lattice has
  diameter $n^(3 \/ 4 + o \( 1 \))$. Its local mass and covering numbers have exponent $4 \/ 3$.
  These estimates hold at every sufficiently large fixed length, simultaneously across scales,
  with arbitrarily high polynomial probability.

#metadata(none)
#label("result238")

#strong[238.Optimal logarithmic mixing of the Thorp shuffle.]Proves that the Thorp shuffle randomizes $N =
  2^d$ labeled cards in $Theta \( log N \)$ physical shuffles,
  settling its optimal mixing order for power-of-two deck sizes.
  Convergence is in total variation from the worst initial ordering and concerns the entire permutation,
  not just individual card positions.

#metadata(none)
#label("result239")

#strong[239.Sharp singularity rates for symmetric sign matrices.]Determines the sharp exponential singularity rate
  of symmetric random sign matrices with independent entries on and above the diagonal.
  Uniform signs give $Pr \( det A_n = 0 \) = \( 1 \/ 2 + o \( 1 \) \)^n$;
  for fixed bias $p in \( 0 \, 1 \) \\ { 1 \/ 2 }$, the rate is $\( p^2 + \( 1 - p \)^2 + o \( 1 \) \)^n$.
  In the biased case, agreeing rows attain this rate.

#metadata(none)
#label("subject6")

#strong[Mathematical logic]

#metadata(none)
#label("result240")

#strong[240.Shelah’s eventual categoricity conjecture.]Proves Shelah’s eventual categoricity conjecture in ZFC:
  for each bound on the Löwenheim–Skolem number, a uniform threshold makes categoricity of an abstract elementary
  class in one cardinal above that threshold imply categoricity throughout the same tail.
  Categoricity means uniqueness up to isomorphism at a given cardinality.
  Under the continuum hypothesis, a proposed specific Hanf threshold need not suffice.

#metadata(none)
#label("result241")

#strong[241.Rigidity of the Turing degrees.]Every order automorphism of the Turing degrees is the identity,
  resolving their rigidity problem. Thus no nontrivial relabeling of degrees preserves the ordering by relative
  computability.

#metadata(none)
#label("result242")

#strong[242.Single-fold Diophantine representations.]Every recursively enumerable set of tuples of natural numbers
  has a Diophantine representation with exactly one auxiliary solution for each member and none for nonmembers.
  This proves the single-fold conjecture and hence the finite-fold conjecture.
  Diophantine solvability over the nonnegative integers remains undecidable even with an at-most-one-solution promise.

#metadata(none)
#label("result243")

#strong[243.Choiceless counting does not capture polynomial time.]Confirms the Blass–Gurevich–Shelah noncapture
  conjecture: consistency of a linear system over $bb(F)_3$ defines a polynomial-time query on unordered finite
  structures that choiceless polynomial time with counting cannot express.
  A separate result shows that adding witnessed symmetric choice strictly increases expressive power.
  Both separations hold for the full counting formalism, allowing hereditarily finite sets of arbitrary finite rank.

#metadata(none)
#label("result244")

#strong[244.The partition principle does not imply choice.]Assuming ZF is consistent,
  constructs a model in which every surjective image of a set injects into that set,
  yet the axiom of choice fails. Choice for ordinal-indexed families still holds.
  From any countable transitive model of ZFC, a separate construction gives a transitive symmetric extension with
  these properties and no new countable sequences of ground-model elements.

#metadata(none)
#label("result245")

#strong[245.The $beta$-Barendregt–Geuvers–Klop conjecture.]Proves that weak normalization implies strong
  normalization for every pure type system: if every legal expression in every valid context has a $beta$-normal
  form, every $beta$-reduction sequence terminates. This resolves the $beta$-Barendregt–Geuvers–Klop conjecture,
  including nonfunctional rules and open contexts.

#metadata(none)
#label("subject5")

#strong[Group theory]

#metadata(none)
#label("result246")

#strong[246.Cannon’s conjecture.]Every word-hyperbolic group with boundary homeomorphic to $S^2$ admits a proper
  cocompact isometric action on hyperbolic three-space with finite kernel, proving Cannon’s conjecture.
  Every torsion-free such group is therefore the fundamental group of a closed hyperbolic three-manifold.

#metadata(none)
#label("result247")

#strong[247.An infinite finitely presented residually finite $2$-group.]Constructs an infinite finitely presented
  residually finite group whose elements all have finite $2$-power order,
  answering the finitely presented Burnside problem negatively even in this class.
  The construction also yields an infinite-dimensional finitely presented nil associative $bb(F)_2$-algebra and a
  finitely presented infinite-dimensional algebraic unitization,
  giving negative answers to the corresponding nilpotence and Kurosh finiteness questions.

#metadata(none)
#label("result248")

#strong[248.Thompson’s group $F$ is nonamenable.]Proves that Thompson’s group $F$,
  the group of dyadic piecewise linear homeomorphisms of the interval, is nonamenable,
  resolving its longstanding amenability problem.

#metadata(none)
#label("result249")

#strong[249.A finitely generated counterexample to Eilenberg–Ganea.]Constructs a finitely generated residually
  finite group with integral cohomological dimension two and geometric dimension three,
  disproving the Eilenberg–Ganea conjecture. It has no two-dimensional classifying space,
  even with infinitely many cells.

#metadata(none)
#label("result250")

#strong[250.The Boone–Higman conjecture and higher finiteness.]A finitely generated group has decidable word
  problem exactly when it embeds in a finitely presented simple group, proving the Boone–Higman conjecture.
  The target can have type $F_oo$: a classifying space with finitely many cells in each dimension.
  A single group of type $F_oo$ can also contain every finitely presented group.

#metadata(none)
#label("result251")

#strong[251.Amenability, unitarizability, and Ulam stability.]Resolves Dixmier’s problem for all discrete groups:
  amenability is equivalent to every uniformly bounded Hilbert-space representation being similar to a unitary
  representation. For countable discrete groups, amenability is also equivalent to strong Ulam stability:
  sufficiently accurate unitary approximate representations are uniformly close in operator norm to genuine
  representations on the same, possibly infinite-dimensional, Hilbert space.

#metadata(none)
#label("result252")

#strong[252.A non-residually-finite torsion-free hyperbolic group.]Constructs a torsion-free word-hyperbolic group
  that is not residually finite, answering the residual-finiteness question negatively.
  One fixed nonidentity element is killed by every finite-dimensional linear representation over every commutative
  field, so the group is not linear over any such field.

#metadata(none)
#label("result253")

#strong[253.An infinite finitely presented simple amenable group.]Constructs an infinite finitely presented simple
  amenable group, answering the longstanding question of whether these properties can occur simultaneously.

#metadata(none)
#label("result254")

#strong[254.Classifying spaces and geometric obstructions for Artin groups.]The Salvetti complex of every
  finite-rank Artin group is aspherical, proving the Artin $K \( pi \, 1 \)$ conjecture.
  Arbitrary intersections of its parabolic subgroups are parabolic, proving the Parabolic Intersection Conjecture.
  An explicit Artin group admits no proper cocompact isometric action on any nonempty proper CAT$\( 0 \)$ space.

#metadata(none)
#label("result255")

#strong[255.Quasi-isometric rigidity of virtually polycyclic groups.]Proves that every finitely generated group
  quasi-isometric to a finitely generated virtually polycyclic group is virtually polycyclic,
  resolving the Eskin–Fisher–Whyte lattice-recognition conjecture.
  Equivalently, a group quasi-isometric to a lattice in a connected simply connected solvable Lie group is
  virtually a uniform lattice in some such Lie group, possibly a different one.

#metadata(none)
#label("result256")

#strong[256.Howie’s conjecture on equations over groups.]Proves that every finite system of equations over an
  arbitrary group whose exponent-sum matrix has full row rank over $bb(Q)$ has a simultaneous solution in an
  overgroup, resolving Howie’s conjecture. The coefficient group embeds in the presented quotient.
  A companion proves Kervaire’s conjecture: adjoining one generator and one relation cannot trivialize a
  nontrivial group.

#metadata(none)
#label("result257")

#strong[257.A hyperbolic group with no geometric CAT(0) action.]Answers negatively whether every word-hyperbolic
  group is a CAT(0) group. Constructs one with a finite classifying space but no proper cocompact isometric action
  on any proper complete $"CAT" \( 0 \)$ space, in any dimension.

#metadata(none)
#label("result258")

#strong[258.Gersten’s conjecture for one-relator groups.]Proves Gersten’s conjecture:
  every finitely generated one-relator group containing no Baumslag–Solitar subgroup $upright("BS") \( m \, n \)$,
  with $m \, n eq.not 0$, is word-hyperbolic. It also proves that every word-hyperbolic one-relator group is
  virtually compact special.

#metadata(none)
#label("result259")

#strong[259.A group without fixed price.]Constructs a finitely generated group with two essentially free
  probability-measure-preserving actions of different costs, answering the general fixed-price problem negatively.
  Its Bernoulli action has cost bounded away from one, while a sequence of finite height extensions has costs
  tending to one.

#metadata(none)
#label("subject17")

#strong[Mathematical physics]

#metadata(none)
#label("result260")

#strong[260.Spacetime Penrose inequalities and rigidity.]Proves the sharp enclosing-area spacetime Penrose
  inequality for smooth one-ended asymptotically flat initial data in every spatial dimension $n gt.eq 3$,
  under dominant energy, weak future trapping, positive enclosing area, and the stated decay assumptions.
  It bounds invariant ADM mass below using minimum enclosing area,
  with equality rigidity under additional horizon hypotheses.
  Charged upper-area bounds treat dyonic three-dimensional data;
  the higher-dimensional purely electric extension uses the matched neutral theorem.

#metadata(none)
#label("result261")

#strong[261.Localization and delocalization in the Anderson model.]Resolves the predicted spectral contrast for
  the lattice Anderson model with independent uniform site potentials.
  In dimension two, every positive disorder strength gives almost surely pure-point spectrum.
  In every fixed dimension $d gt.eq 3$, sufficiently weak positive disorder gives purely absolutely continuous
  spectrum on a fixed open interval with nonzero spectral weight.

#metadata(none)
#label("result262")

#strong[262.Sharp one-dimensional Lieb–Thirring inequalities.]Proves the sharp one-dimensional Lieb–Thirring
  inequality for $1 \/ 2 < gamma < 3 \/ 2$ and arbitrary finite-matrix potentials $W gt.eq
  0$ with $integral "tr" \( W^(gamma + 1 \/ 2) \) < oo$: the optimal constant is the scalar one-bound-state value,
  independent of matrix size. All equality cases are direct sums, in one constant unitary basis,
  of scalar $"sech"^2$ solitons with independent scales and centers, and zero channels.

#metadata(none)
#label("result263")

#strong[263.The ionization and generalized ionization conjectures.]For the full nonrelativistic Coulomb model with
  two electron spin states, proves that a molecule with $M$ fixed nuclei of charges at least one and total charge
  $Z$ strictly binds at most $Z + C M$ electrons. Neutral-atom first ionization energies and radii containing all
  but an expected half-electron have universal positive upper and lower bounds.
  The energy cost of removing $m$ electrons has Thomas–Fermi asymptotics as $m arrow.r oo$ and $Z \/ m arrow.r
  oo$; neutral-atom outer radii have the corresponding iterated-limit asymptotics, taking $Z arrow.r oo$ first.

#metadata(none)
#label("result264")

#strong[264.Strong cosmic censorship near two-ended Kerr data.]Proves local strong cosmic censorship near each
  fixed rotating subextremal Kerr bridge. A dense $G_delta$ subset of a weighted smooth neighborhood of smooth
  complete two-ended asymptotically flat vacuum data has full maximal globally hyperbolic developments with no
  future continuous nondegenerate extension whose weak connection is locally square-integrable.
  No symmetry is imposed; extensions need not satisfy the vacuum equations.

#metadata(none)
#label("result265")

#strong[265.The two-dimensional gapped area law.]Proves an entropy area law for unique ground states of
  finite-range Hamiltonians on arbitrary finite induced square-lattice domains,
  using only a uniform full-system spectral gap and bounds on the local interactions.
  On open $L times L$ squares, uniformly gapped nearest-neighbor ground states also admit projected entangled-pair
  state approximations with polynomial bond dimension and global vector error at most $L^(- 1)$.

#metadata(none)
#label("result266")

#strong[266.Exactly three mutually unbiased bases in dimension six.]Proves $N \( 6 \) = 3$,
  resolving Zauner's dimension-six mutually unbiased bases conjecture:
  three such bases exist in $bb(C)^6$, but four cannot. The exclusion is a complete certified computation under
  the stated binary64 arithmetic and compiler conditions. An independent companion proves the
  Matolcsi–Ruzsa–Weiner Fourier-vanishing conjecture for order-six complex Hadamard matrices outside Tao's cubic
  equivalence class.

#metadata(none)
#label("result267")

#strong[267.Positive-temperature Bose–Einstein condensation and quantum depletion.]Proves Bose–Einstein
  condensation for the exact canonical Gibbs state of the three-dimensional hard-sphere gas:
  each fixed exclusion distance and sufficiently small fixed density admit a strictly positive temperature,
  independent of volume, with positive condensate fraction in the thermodynamic limit.
  At zero temperature, proves the Bogoliubov leading quantum-depletion law for hard spheres and fixed bounded
  nonnegative radial finite-range potentials of positive scattering length,
  taking the thermodynamic limit before the dilute limit.

#metadata(none)
#label("result268")

#strong[268.The spin-one Haldane gap.]Proves the spin-one Haldane gap conjecture for the pure antiferromagnetic
  Heisenberg chain on even periodic rings: the spectral gap stays uniformly positive as the chain grows.
  A companion establishes a gap for odd open chains with endpoint field $h =
  3 \/ 5$ and gives boundary-selected infinite-volume states with topological index $- 1$.

#metadata(none)
#label("result269")

#strong[269.The Laughlin gap and stability under scalar disorder.]Proves the fermionic Laughlin spectral-gap
  conjecture for the full $V_1$ interaction at filling $1 \/ 3$ on the round sphere.
  The unique ground state remains uniformly gapped under sufficiently weak bounded real scalar one-body potentials
  projected to the lowest Landau level. Both the gap and disorder threshold are uniform over all sufficiently
  large particle numbers and all normalized potential profiles.

#metadata(none)
#label("result270")

#strong[270.Threshold and positive-energy bound states of the BFSS model.]Proves that the undeformed relative
  $upright("SU") \( N \)$ BFSS model has exactly one normalizable zero-energy state for every finite $N gt.eq 2$,
  resolving the threshold-bound-state conjecture. For $upright("SU") \( 2 \)$,
  a companion proves infinitely many normalizable positive-energy eigenstates with unbounded energies,
  contradicting the original BFSS paper's exclusion of additional bound states at $N = 2$.

#metadata(none)
#label("result271")

#strong[271.Bloch’s law and spontaneous ferromagnetic order.]Proves Bloch’s $T^(3 \/ 2)$ law with its exact
  coefficient for three-dimensional quantum Heisenberg ferromagnets at every positive quantum spin,
  allowing nonnegative symmetric finite-range couplings whose support generates $bb(Z)^3$.
  The thermodynamic limit precedes the zero-field derivative and low-temperature limit.
  The family also proves spontaneous magnetization for nearest-neighbor models in every dimension $d gt.eq
  3$ and determines the first lattice correction for three-dimensional nearest-neighbor couplings.

#metadata(none)
#label("result272")

#strong[272.Entanglement without secret key and the PPT-square conjecture.]Constructs an entangled state on
  $bb(C)^10 ⊗ bb(C)^10$ with zero distillable secret key for the specified local-instrument protocols that
  complete almost surely. These allow joint local processing and authenticated two-way public communication,
  with no other shared private resource and an eavesdropper holding the input purification and public record.
  A trace-preserving PPT channel on $M_21 \( bb(C) \)$ whose square is not entanglement breaking disproves
  Christandl's PPT-square conjecture.

#metadata(none)
#label("result273")

#strong[273.The entropy photon-number inequality.]Proves the entropy photon-number inequality for beam-splitter
  mixing of two independent finite-energy bosonic inputs in any finite number of modes:
  the output's entropy photon number is at least the transmissivity-weighted average of the inputs'.
  Arbitrary entanglement within each input is allowed, and product thermal inputs attain equality even when their
  entropies differ.

#metadata(none)
#label("result274")

#strong[274.Moore’s parity conjecture for $upright("QAC")^0$.]Resolves Moore’s parity conjecture in the
  measured-output model: constant-depth quantum circuits with arbitrary one-qubit gates,
  unbounded-arity Toffoli gates and polynomially many total qubits cannot compute parity with any fixed positive
  worst-case advantage. Ancillas start in zero, one output qubit is measured,
  and all other registers may be discarded. Xu–Li’s reductions give the same bounded-error obstruction for strict
  majority.

#metadata(none)
#label("result275")

#strong[275.QMA-hardness of continuum Coulomb energy.]Proves QMA-hardness of approximating the electronic Coulomb
  energy infimum in three dimensions, minimizing over the full spinful fermionic continuum space.
  Deterministic polynomial-time reductions work even with only unit-charge nuclei at distinct rational positions,
  polynomially many electrons and an energy-threshold separation of at least one.

#metadata(none)
#label("result276")

#strong[276.The classical capacity of generalized amplitude damping.]Determines the unassisted classical capacity
  of every qubit generalized amplitude-damping channel, including all damping and thermal parameters.
  An explicit one-variable optimization gives the capacity,
  attained by independent two-state signal ensembles with collective decoding.
  Holevo capacity, minimum output entropy and regularized classical capacity are additive when tensoring with any
  finite-dimensional quantum channel.

#metadata(none)
#label("result277")

#strong[277.Threshold repetition for entangled games.]Proves exponential threshold repetition for every finite
  two-player one-round game: if its entangled value is $v < 1$,
  the probability of winning at least a fraction $v + delta$ of $k$ independent repetitions decays exponentially
  in $k$, for $0 < delta < 1 - v$. Arbitrary joint finite-dimensional entangled strategies and correlated question
  distributions are allowed.

#metadata(none)
#label("result278")

#strong[278.Failure of Kohn–Sham ensemble representation.]Constructs a three-electron Coulomb molecule with two
  equal positive-integer-charge nuclei whose absolute ground-state density has no noninteracting ground-state
  ensemble representation by a single real spin-independent local potential in $L^(3 \/ 2) \( bb(R)^3 \) +
  L^oo \( bb(R)^3 \)$. This disproves Kohn–Sham ensemble representability for that potential class;
  the required nuclear charge is specified nonnumerically.

#metadata(none)
#label("result279")

#strong[279.Exact quantum factoring over a fixed finite gate set.]Gives a polynomial-time uniform quantum circuit
  family that outputs the complete prime factorization of every integer with probability one.
  Both gate count and qubit count are polynomial in the input length, and one fixed finite gate set suffices.

#metadata(none)
#label("result280")

#strong[280.Strong locality for strongly rational unitary vertex operator algebras.]Proves the strongly rational
  case of the strong-locality conjecture: every simple unitary strongly rational complex vertex operator algebra
  generates a completely rational conformal net. Its simple modules are unitarizable,
  and its representation category agrees with the net’s finite-index sectors as a braided unitary tensor category.

#metadata(none)
#label("result281")

#strong[281.QAOA optimality for the SK model.]Proves that QAOA approaches the ground-state energy of the Gaussian
  zero-field Sherrington–Kirkpatrick model when system size tends to infinity before circuit depth.
  For every accuracy, finite depth and deterministic angles independent of size and disorder achieve the required
  limiting expected energy per spin. This also yields leading-order optimal expected MaxCut values on large-degree
  random regular graphs, with size tending to infinity before degree.

#metadata(none)
#label("result282")

#strong[282.Scale-to-conformal enhancement in four-dimensional QFT.]Under the stated bounded-local-net and
  field-reconstruction hypotheses, proves that scale symmetry implies local conformal symmetry for
  four-dimensional unitary positive-energy theories with a discrete bounded-below scaling spectrum of finite
  multiplicity, finite scaling support and a physical local scale current.
  The stress tensor has a traceless improvement with unchanged spacetime charges.
  The conclusion concerns local Ward identities, not a global conformal action on the whole net.

#metadata(none)
#label("result283")

#strong[283.Polynomial-time, constant-error unitary synthesis from a Boolean oracle.]Solves the constant-error
  Aaronson–Kuperberg unitary synthesis problem: a uniform polynomial-size quantum oracle circuit approximates
  every $n$-qubit unitary channel within diamond-norm error $1 \/ 2$, after a suitable Boolean oracle is chosen.
  Gates, qubits, oracle calls and query length are polynomially bounded.
  The target-dependent oracle may have an unrestricted truth table;
  its efficient classical construction is not asserted.

#metadata(none)
#label("result284")

#strong[284.The optimal randomized–quantum query exponent.]Shows that the universal bound $R \( f \) =
  O \( \( 1 + Q \( f \) \)^4 \)$ for total Boolean functions is sharp in its exponent,
  ruling out every smaller power and disproving the conjectured cubic relation.
  Here $R$ and $Q$ are randomized and quantum worst-case bit-query complexities with error at most $1 \/ 3$;
  computation between queries is unrestricted.

#metadata(none)
#label("subject16")

#strong[Operator algebras]

#metadata(none)
#label("result285")

#strong[285.Counterexamples to Baum–Connes and Kadison–Kaplansky.]Disproves the coefficient-free reduced
  Baum–Connes conjecture through a failure of rational injectivity and a separate failure of surjectivity of
  assembly. A finitely generated torsion-free example witnesses the injectivity failure.
  Separately, a torsion-free group has a nontrivial projection in its reduced group $C^(*)$-algebra,
  disproving the Kadison–Kaplansky conjecture.

#metadata(none)
#label("result286")

#strong[286.Arithmetic rigidity of lattice von Neumann algebras.]Classifies finite-index bimodules between
  scalar-twisted group factors of ICC groups commensurable with property-$\( T \)$ lattices over
  characteristic-zero local fields and arbitrary ICC group factors.
  Every such bimodule is a summand of finite sums of models arising from finite-index subgroup isomorphisms and
  finite-dimensional projective representations. The classification also recovers the group,
  scalar cocycle and amplification scale up to the stated stable equivalence.

#metadata(none)
#label("result287")

#strong[287.All nonabelian free group factors are isomorphic.]Resolves the free group factor isomorphism problem:
  $L \( bb(F)_2 \) tilde.equiv L \( bb(F)_3 \)$, and hence all interpolated free group factors,
  including $L \( bb(F)_oo \)$, are isomorphic. Their common factor has fundamental group $bb(R)_(> 0)$.

#metadata(none)
#label("result288")

#strong[288.Kadison’s similarity conjecture.]Proves Kadison’s similarity conjecture:
  every bounded complex-linear unital algebra homomorphism from a unital complex $C^(*)$-algebra to operators on a
  Hilbert space becomes a $*$-homomorphism after conjugation by a bounded invertible operator.

#metadata(none)
#label("result289")

#strong[289.The strong Kadison–Kastler conjecture.]Proves that sufficiently close unital von Neumann algebras on
  the same Hilbert space are conjugate by a unitary arbitrarily close to the identity,
  with a universal tolerance in the operator-norm distance between unit balls.
  Counterexamples show that near-identity conjugacy fails for one-sided near inclusions,
  and that arbitrarily close norm-separable $C^(*)$-algebras need not be ambiently unitarily conjugate.

#metadata(none)
#label("result290")

#strong[290.Connes’ bicentralizer conjecture and relative bicentralizers.]Proves Connes’ bicentralizer conjecture
  for every type $upright("III")_1$ factor with separable predual and every faithful normal state.
  More generally, for every inclusion $N subset M$ of von Neumann algebras with separable preduals admitting a
  faithful normal conditional expectation, constructs an amenable expected subalgebra $P subset N$ with $P' ∩
  c \( M \) = N' ∩ c \( M \)$, resolving the relative bicentralizer conjecture.

#metadata(none)
#label("result291")

#strong[291.Toms–Winter and equivariant Jiang–Su stability.]Proves equivariant Jiang–Su stability for every
  countable discrete amenable group action on a simple separable unital infinite-dimensional nuclear stably finite
  Jiang–Su-stable $C^(*)$-algebra, resolving this case of Szabó’s conjecture without restrictions on trace
  dynamics. The family also proves the unital Toms–Winter conjecture, equating strict comparison,
  finite nuclear dimension and Jiang–Su stability in the simple separable unital infinite-dimensional nuclear setting.

#metadata(none)
#label("result292")

#strong[292.A counterexample to Kirchberg’s norm-ultrapower embedding problem.]Constructs an explicit separable
  unital full group $C^(*)$-algebra that cannot embed unitally into the norm ultrapower of any fixed nonzero
  unital nuclear $C^(*)$-algebra, for any free ultrafilter on the natural numbers.
  Taking the target to be $cal(O)_2$ answers Kirchberg’s norm-ultrapower embedding problem negatively.

#metadata(none)
#label("result293")

#strong[293.A counterexample to the hyperinvariant-subspace problem.]Constructs a nonzero norm-quasinilpotent
  operator on every infinite-dimensional separable complex Hilbert space with no nonzero proper closed subspace
  invariant under every commuting operator. The construction also gives operators with no nontrivial invariant
  projection in the hyperfinite type $upright("II")_1$ factor.

#metadata(none)
#label("result294")

#strong[294.A counterexample to Kaplansky’s quasitrace conjecture.]Disproves Kaplansky’s quasitrace conjecture by
  constructing a separable unital complex $C^(*)$-algebra admitting normalized $2$-quasitraces,
  all of which are nonadditive. As a consequence, two unital simple stably finite $C^(*)$-algebras can have a
  properly infinite minimal tensor product, with one factor $C_r^(*) \( bb(F)_2 \)$.

#metadata(none)
#label("result295")

#strong[295.The Kadison–Ringrose cohomology conjecture.]Proves that every bounded Hochschild cocycle of degree at
  least two on a complex von Neumann algebra, with coefficients in the algebra itself, has a bounded primitive.
  Equivalently, all higher bounded Hochschild cohomology groups vanish, resolving the Kadison–Ringrose conjecture.

#metadata(none)
#label("result296")

#strong[296.The generator problem for finite factors.]Proves that every type $upright("II")_1$ factor with
  separable predual is generated by a single operator, equivalently by two self-adjoint operators,
  resolving the generator problem. More strongly, for every irreducible inclusion $P subset M$ of such factors,
  the unitaries $u$ with $M = W^(*) \( P \, u \)$ form a dense $G_delta$ subset in the trace $2$-norm topology.

#metadata(none)
#label("result297")

#strong[297.A ZFC counterexample to Naimark’s problem.]Gives an alternative to
  #link("https://arxiv.org/abs/2609.26930v1")[Tanaka’s ZFC construction] of a unital infinite-dimensional simple
  complex $C^(*)$-algebra with a faithful tracial state and exactly one nonzero irreducible representation up to
  unitary equivalence. Thus the unrestricted compact-operator characterization fails without additional
  set-theoretic assumptions; the counterexample is nonseparable.

#metadata(none)
#label("result298")

#strong[298.A counterexample to Voiculescu’s free-entropy equality conjecture.]Constructs a bounded self-adjoint
  tuple in a tracial von Neumann algebra whose microstates and nonmicrostates free entropies satisfy $-
  oo < chi < chi^(*) < oo$. This answers Voiculescu’s finite-entropy equality question negatively:
  the matrix-approximation and free-Fisher-information definitions differ even when both are finite.

#metadata(none)
#label("result299")

#strong[299.The Kirchberg–Rørdam character criterion.]A nonzero unital separable complex $C^(*)$-algebra is
  Jiang–Su stable exactly when its norm central-sequence algebra has no characters, for every free ultrafilter.
  This answers the Kirchberg–Rørdam character question. Also,
  the infinite minimal tensor power of every such algebra without characters is Jiang–Su stable,
  answering the Dadarlat–Toms question.

#metadata(none)
#label("result300")

#strong[300.The Popa–Vaes quadratic strong-operator paving conjecture.]Proves that every self-adjoint element of a
  complex von Neumann algebra admits strong-operator paving relative to any maximal abelian subalgebra with
  $O \( epsilon^(- 2) \)$ blocks. The norm bound holds after compression by a projection arbitrarily close to the
  identity in the strong topology, resolving the Popa–Vaes quadratic paving conjecture.

#metadata(none)
#label("result301")

#strong[301.Classification by trace cones after Razak–Jacelon stabilization.]Classifies separable nuclear complex
  $C^(*)$-algebras after tensoring with the Razak–Jacelon algebra and the compact operators,
  using their full topological cones of extended lower-semicontinuous tracial weights.
  This answers Robert’s trace-cone question, including algebras with arbitrary ideal structure and both finite and
  infinite subquotients.

#metadata(none)
#label("result302")

#strong[302.The Phillips–Toms formula for minimal integer actions.]For every minimal homeomorphism $h$ of an
  infinite compact metrizable space $X$, the radius of comparison of $C \( X \) times.r_h bb(Z)$ equals $1 /
  2 upright("mdim") \( X \, h \)$, including infinite values.
  Zero mean dimension is equivalent to the small boundary property,
  Jiang–Su stability and finite nuclear dimension; in this case nuclear dimension is at most one.

#metadata(none)
#label("result303")

#strong[303.From ordinary to strong pure infiniteness.]Resolves the ordinary-to-strong pure-infiniteness question
  of Kirchberg and Rørdam for complex $C^(*)$-algebras. For exact algebras,
  proper infiniteness of one fixed finite amplification of every positive element also suffices.
  Consequently, every separable nuclear algebra with this property absorbs $cal(O)_oo$,
  without unitality or simplicity assumptions.

#metadata(none)
#label("subject4")

#strong[Topology]

#metadata(none)
#label("result304")

#strong[304.The Hilbert–Smith conjecture in every dimension.]Every locally compact second-countable Hausdorff
  group acting faithfully and jointly continuously on a connected finite-dimensional topological manifold is a Lie
  group. This proves the Hilbert–Smith conjecture in all finite dimensions,
  for Hausdorff second-countable manifolds without boundary.

#metadata(none)
#label("result305")

#strong[305.Counterexamples to disk embedding and Wall’s manifold conjecture.]The unrestricted four-dimensional
  disk-embedding conjecture fails: framed algebraic dual spheres do not suffice to obtain disjoint locally flat
  spanning disks. In particular, the free group $F_2$ is not good in the sense of Freedman–Quinn.
  Also constructs a finitely presented integral Poincaré duality group of dimension four with a finite classifying
  space but no realization as the fundamental group of a closed aspherical topological four-manifold,
  disproving Wall’s conjecture.

#metadata(none)
#label("result306")

#strong[306.The purely cosmetic surgery conjecture for knots in $S^3$.]Distinct Dehn surgery slopes on a
  nontrivial smooth knot in $S^3$ never produce orientation-preservingly homeomorphic manifolds,
  proving the purely cosmetic surgery conjecture. The statement includes the meridional slope.

#metadata(none)
#label("result307")

#strong[307.Failure of rational injectivity for maximal coarse assembly.]Constructs a uniformly discrete
  bounded-geometry space whose maximal coarse assembly map is not rationally injective.
  The example is a coarse disjoint union of finite connected graphs of uniformly bounded degree,
  with an infinite-order kernel class. A companion gives the analogous failure for reduced coarse assembly,
  disproving the rational coarse Novikov conjecture.

#metadata(none)
#label("result308")

#strong[308.Smith–Toda complexes at every height with varying primes.]For every $n gt.eq 0$,
  constructs a finite Smith–Toda spectrum at a prime $p$ depending on $n$,
  with Brown–Peterson homology $B P_(*) \/ \( p \, v_1 \, dots.h \, v_n \)$ and the canonical comodule structure.
  Thus Smith–Toda complexes exist at every height when the prime may vary;
  an explicit example realizes $V \( 4 \)$ at $p = 1009$.

#metadata(none)
#label("result309")

#strong[309.The Kervaire invariant problem at the prime three.]Resolves the odd-primary Kervaire invariant problem
  at the prime three: exactly the standard classes with indices $0$, $2$,
  and $3$ survive in the mod-three Adams spectral sequence, in stems $10$, $106$, and $322$.
  Each surviving detection coset contains an element of exact additive order three.

#metadata(none)
#label("result310")

#strong[310.Quillen’s conjecture in rational homology.]Proves the rational-homology form of Quillen’s conjecture
  for every finite group and every prime. If the largest normal $p$-subgroup of $G$ is trivial,
  the poset of nontrivial elementary abelian $p$-subgroups has nonzero augmented reduced rational homology and is
  therefore not contractible.

#metadata(none)
#label("result311")

#strong[311.Chai’s invariant-ideal conjecture.]Proves Chai’s invariant-ideal conjecture for Lubin–Tate deformation
  rings over finite residue fields, at every prime and positive height $n$.
  Through the implication of Barthel–Heard–Naumann, this proves the Hovey–Strickland conjecture:
  dualizable $K \( n \)$-local spectra have exactly $n + 2$ thick tensor ideals,
  and their Balmer spectrum is a chain of $n + 1$ points.

#metadata(none)
#label("result312")

#strong[312.The Grothendieck homotopy hypothesis.]Proves the Grothendieck homotopy hypothesis for $oo$-groupoids
  associated with every Grothendieck coherator in the Ara–Henry convention:
  these algebraic objects recover the homotopy theory of spaces.

#metadata(none)
#label("result313")

#strong[313.Finite generation for the $K \( n \)$-local sphere.]Answers the degreewise finiteness question of
  Hovey and Hovey–Strickland: every homotopy group of the $K \( n \)$-local sphere is a finitely generated
  $bb(Z)_p$-module, for every prime, positive height and integer degree.
  The same conclusion holds after $K \( n \)$-localizing any finite $p$-local spectrum.

#metadata(none)
#label("result314")

#strong[314.The chromatic Smith fixed-point problem for finite $p$-groups.]Determines the optimal chromatic loss
  from geometric $H$-fixed points to geometric $G$-fixed points for every subgroup $H$ of a finite $p$-group $G$.
  At every nonnegative height, the loss equals the shortest subnormal-chain length from $H$ to $G$ with cyclic
  quotients. Each quotient counts once regardless of order, and finite spectra witness sharpness.

#metadata(none)
#label("result315")

#strong[315.The four-dimensional Singer conjecture.]Proves that the $L^2$-Betti numbers of the universal cover of
  every closed connected aspherical topological four-manifold vanish outside degree two.
  More generally, the same conclusion holds for every finite connected aspherical integral Poincaré complex of
  formal dimension four, proving the four-dimensional Singer conjecture in this wider class.

#metadata(none)
#label("result316")

#strong[316.Curtis’s conjecture.]Proves Curtis’s conjecture:
  the positive-degree mod-two stable Hurewicz image of the sphere is spanned by the images of the
  Hopf-invariant-one classes $eta \, nu \, sigma$ and the Kervaire-invariant-one classes that exist.

#metadata(none)
#label("result317")

#strong[317.Thomason model structures in every strict higher dimension.]Resolves the Ara–Maltsiniotis conjecture:
  for every $n gt.eq 1$ and $n = omega$, small strict globular $n$-categories admit proper combinatorial Thomason
  model structures Quillen equivalent to simplicial sets. Thus strict higher categories model the homotopy theory
  of spaces in every stated dimension.

#metadata(none)
#label("result318")

#strong[318.Chromatic splitting: counterexamples and filtrations.]Disproves strong chromatic splitting at height
  three for primes $p gt.eq 5$, and weak splitting for the derived $p$-completed sphere at heights $p$ ($p gt.eq
  5$) and $p + 1$ ($p gt.eq 7$). Nevertheless, for $n gt.eq 1$ and $p > n + 1$,
  the overlap $L_(n - 1) L_(K \( n \)) S_p^and$ admits a $2^n$-stage filtration by the predicted localized-sphere
  pieces. At height three and prime three, even finite assembly from such pieces fails in the category of
  $E \( 2 \)$-local modules over the derived completed sphere.

#metadata(none)
#label("result319")

#strong[319.Counterexamples to the Hahn–Wilson conjecture at height two.]Refutes the Hahn–Wilson conjecture at
  chromatic height two. For every sufficiently large prime $p$,
  constructs a connective $p$-complete spectrum of exact fp-type two that cannot be built from completed
  $upright("BP") chevron.l 2 chevron.r$ by finitely many sums, shifts, cones and retracts.
  The examples nevertheless satisfy the finite and telescopic localization comparisons.

#metadata(none)
#label("result320")

#strong[320.A four-dimensional counterexample to Borel rigidity.]Constructs closed connected aspherical
  topological four-manifolds that are homotopy equivalent but not homeomorphic,
  with a common word-hyperbolic fundamental group. This disproves even the homeomorphism-existence formulation of
  the Borel conjecture in dimension four.

#metadata(none)
#label("result321")

#strong[321.A counterexample to Wall’s finite D(2) conjecture.]Constructs a finite connected three-dimensional CW
  complex whose universal cover has no integral homology above degree two and whose third cohomology vanishes for
  every local coefficient module, but which has no finite two-dimensional homotopy model.
  This disproves Wall’s finite D(2) conjecture; the example has infinite fundamental group.

#metadata(none)
#label("subject11")

#strong[Functional analysis]

#metadata(none)
#label("result322")

#strong[322.Tingley’s sphere-isometry problem.]Resolves Tingley’s problem:
  every surjective isometry between the unit spheres of nonzero real Banach spaces extends uniquely to a
  surjective real-linear isometry of the whole spaces. No dimension restriction is imposed,
  so the metric geometry of the unit sphere determines the Banach space up to linear isometry.

#metadata(none)
#label("result323")

#strong[323.Relative independence of the separable quotient problem.]Establishes,
  relative to the consistency of a measurable cardinal, that the separable quotient problem is independent of ZFC.
  The assertion that every infinite-dimensional Banach space has a separable infinite-dimensional quotient can
  hold for all real and complex Banach spaces, whereas the continuum hypothesis yields counterexamples over both fields.

#metadata(none)
#label("result324")

#strong[324.Lipschitz equivalence without linear isomorphism.]Constructs separable real Banach spaces that are
  globally bi-Lipschitz equivalent but not linearly isomorphic,
  resolving the separable Lipschitz-isomorphism problem negatively.
  Thus even the complete metric structure up to bi-Lipschitz equivalence does not determine a separable Banach
  space’s linear isomorphism class.

#metadata(none)
#label("result325")

#strong[325.The complete Crouzeix conjecture.]Resolves the complete Crouzeix conjecture:
  for every bounded operator $A$ on a complex Hilbert space and every finite matrix-valued polynomial $P$,
  one has $lr(bar.v.double P \[ A \] bar.v.double) lt.eq 2 sup_(z in W \( A \))
  lr(bar.v.double P \( z \) bar.v.double)$, where $W \( A \)$ is the numerical range.
  The constant $2$ is sharp, independent of the matrix size, and valid in infinite dimensions.

#metadata(none)
#label("result326")

#strong[326.The cotype–cotype conjecture under the approximation property.]Resolves the cotype–cotype conjecture
  for real Banach spaces with the approximation property. Such a nonzero space is $K$-convex if and only if both
  it and its dual have finite Rademacher cotype, with possibly different exponents.
  Equivalently, these cotype assumptions force nontrivial Rademacher type.

#metadata(none)
#label("result327")

#strong[327.Markov type characterizes superreflexivity.]Proves that every real Banach space with Markov type $p$
  for some $p > 1$ admits an equivalent uniformly convex norm, answering Naor’s renorming question.
  Together with the known converse, this characterizes superreflexivity by nontrivial Markov type.

#metadata(none)
#label("result328")

#strong[328.Fixed points of nonexpansive maps in reflexive Banach spaces.]Resolves Kirk’s reflexive-space
  fixed-point problem: every nonexpansive selfmap of a nonempty closed bounded convex subset of a real reflexive
  Banach space has a fixed point. The result uses the original norm, without assuming uniform convexity.

#metadata(none)
#label("result329")

#strong[329.A counterexample to Pietsch’s metric-entropy duality conjecture.]Disproves Pietsch’s dimension-free
  duality conjecture for metric entropy. Origin-symmetric convex bodies violate every proposed choice of universal
  constants in the conjectured comparison between covering numbers and those of the polar bodies,
  even when the covering body is a cube.

#metadata(none)
#label("result330")

#strong[330.A negative answer to Kalton’s Lipschitz-free approximation question.]Constructs a countable uniformly
  discrete metric space whose real Lipschitz-free Banach space has the approximation property but not the bounded
  approximation property, answering Kalton’s question negatively.
  Finite-rank operators approximate the identity on every compact set, but their norms cannot share a finite bound.

#metadata(none)
#label("result331")

#strong[331.Asymptotic midpoint uniform convexity without asymptotically uniformly convex renorming.]Constructs a
  real reflexive Banach space with an asymptotically midpoint uniformly convex norm but no equivalent
  asymptotically uniformly convex norm, extending Baudier’s separation to reflexive spaces.
  In the same space, depth-$k$ countably branching diamonds require distortion at least $sqrt(1 + k \/ 12)$,
  so midpoint uniform convexity does not force uniformly bounded diamond distortion even under reflexivity.

#metadata(none)
#label("result332")

#strong[332.Metric Markov cotype two for $ell_1$.]Proves that real $ell_1$ has metric Markov cotype two,
  answering Mendel and Naor’s question. Consequently, every Lipschitz map from an arbitrary subset of a real
  Hilbert space into $ell_1$ extends to the whole space with a universal multiplicative loss in its Lipschitz
  constant, resolving Ball’s extension problem for this target.

#metadata(none)
#label("subject7")

#strong[Differential geometry]

#metadata(none)
#label("result333")

#strong[333.Smooth isometric immersions of surfaces into $bb(R)^4$.]Every closed smooth Riemannian surface admits
  a smooth isometric immersion into $bb(R)^4$, resolving the closed-surface form of the four-dimensional
  isometric-immersion problem. This includes nonorientable surfaces and metrics of arbitrary Gaussian curvature.

#metadata(none)
#label("result334")

#strong[334.A smooth surface metric with no local immersion in $bb(R)^3$.]Constructs a smooth positive-definite
  metric on $\( - 1 \, 1 \)^2$ for which no neighborhood of the origin admits a smooth isometric immersion into
  $bb(R)^3$. This answers the unrestricted smooth local isometric realization problem for surfaces negatively,
  even after shrinking the neighborhood.

#metadata(none)
#label("result335")

#strong[335.Gromov’s integral scalar-curvature inequality.]Proves $integral_M \( upright("Scal")_g^(-) \)^(n \/ 2)
  thin d V_g gt.eq a_n lr(bar.v.double M bar.v.double)$ for every closed connected oriented smooth $n$-manifold,
  $n gt.eq 3$, and every smooth metric, with $a_n > 0$ depending only on dimension.
  Here $upright("Scal")_g^(-) = max { 0 \, - upright("Scal")_g }$ and $lr(bar.v.double M bar.v.double)$ is real
  simplicial volume. Also proves rational inessentiality under positive scalar curvature,
  resolving the Gromov–Lawson conjecture; every nonnegative-scalar-curvature metric on a closed aspherical
  manifold is flat.

#metadata(none)
#label("result336")

#strong[336.Spectral scalar curvature and codimension-two width.]Every complete connected smooth boundaryless
  $n$-manifold, $n gt.eq 3$, satisfying $- 4 Delta + upright("Scal") gt.eq
  1$ as a quadratic-form inequality admits a continuous map to a simplicial complex of dimension at most $n -
  2$ whose entire fibers have diameter bounded only by $n$ in the original metric.
  This strengthens Gromov’s width conclusion to spectral scalar curvature.
  Universal covers of closed positive-scalar-curvature manifolds also have continuous macroscopic dimension at
  most $n - 2$ for every $n gt.eq 2$.

#metadata(none)
#label("result337")

#strong[337.Cartan–Hadamard isoperimetry and CAT$\( 0 \)$ fillings.]Proves generalized Cartan–Hadamard
  isoperimetry in every dimension: in a complete simply connected manifold with sectional curvature at most $kappa
  lt.eq 0$, every finite-volume finite-perimeter set satisfies the sharp comparison with the equal-volume model
  ball. Bounded positive-volume equality regions for $kappa = 0$ are Euclidean balls.
  Also proves sharp Euclidean filling bounds for compactly supported integral $n$-cycles, $n gt.eq 2$,
  in arbitrary proper CAT$\( 0 \)$ spaces.

#metadata(none)
#label("result338")

#strong[338.Yau’s uniformization conjecture.]Proves Yau’s uniformization conjecture:
  every complete connected noncompact Kähler manifold with strictly positive holomorphic bisectional curvature is
  biholomorphic to $bb(C)^n$.

#metadata(none)
#label("result339")

#strong[339.Katok’s entropy rigidity conjecture.]Proves Katok’s entropy rigidity conjecture for closed connected
  Riemannian manifolds of dimension at least three with strictly negative sectional curvature:
  normalized Liouville measure maximizes entropy for the geodesic flow if and only if the metric is locally symmetric.

#metadata(none)
#label("result340")

#strong[340.A counterexample to the nearby Lagrangian conjecture.]Disproves the unrestricted nearby Lagrangian
  conjecture. For some sufficiently large even $N$, constructs a closed exact embedded Lagrangian in
  $T^(*) \( S^9 times S^(N - 1) \)$ that is diffeomorphic to the base but not Hamiltonian isotopic to its zero section.

#metadata(none)
#label("result341")

#strong[341.Donaldson’s hypersymplectic deformation conjecture.]Proves Donaldson’s hypersymplectic deformation
  conjecture in a cohomology-preserving form. Every positive triple of smooth closed two-forms on a closed
  connected oriented four-manifold, normalized by $integral omega_i and omega_j = delta_(i j)$,
  deforms through positive closed triples to a hyperkähler triple while preserving all three cohomology classes.
  Any positive triple can first be normalized by a constant linear change.

#metadata(none)
#label("result342")

#strong[342.Donaldson’s tamed-to-compatible conjecture.]Proves Donaldson’s tamed-to-compatible conjecture:
  every smooth almost complex structure on a closed four-manifold that is tamed by a symplectic form admits a
  compatible symplectic form. The almost complex structure stays fixed; the form’s cohomology class may change.

#metadata(none)
#label("result343")

#strong[343.Sharp symplectic ball-packing criteria in higher dimensions.]Resolves the Siegel–Yao conjecture for
  arbitrary capacities in every dimension $2 n gt.eq 6$. Finitely many closed symplectic balls of capacities
  $R_1 \, dots.h \, R_k$ embed disjointly into an open ball of capacity $R$ exactly when $sum_i R_i^n <
  R^n$ and $R_i + R_j < R$ for every distinct pair $i \, j$.

#metadata(none)
#label("result344")

#strong[344.The metric Blaschke conjecture.]Proves the metric Blaschke conjecture:
  every closed connected Riemannian manifold of positive dimension whose injectivity radius equals its diameter
  is, up to scaling, a standard compact rank-one symmetric space.

#metadata(none)
#label("result345")

#strong[345.Infinitely many closed geodesics on spheres and three-manifolds.]Proves that every smooth Riemannian
  metric on $S^n$, $n gt.eq 2$, has infinitely many prime closed geodesics with pairwise distinct images.
  The same conclusion holds on every closed manifold admitting a finite smooth spherical cover and on every closed
  three-manifold, without orientability or nondegeneracy restrictions.

#metadata(none)
#label("result346")

#strong[346.Sharp singular-set bounds for stationary integral varifolds.]Proves that every stationary integral
  $m$-varifold in a Euclidean open set has singular set of Hausdorff dimension at most $m - 1$,
  a sharp bound in every positive dimension and codimension.
  On round spheres, the family also proves almost-everywhere regularity:
  the singular set has zero $m$-dimensional Hausdorff measure.

#metadata(none)
#label("result347")

#strong[347.Counterexamples to strong forms of Arnold’s fixed-point conjecture.]Disproves stable-Morse lower
  bounds for nondegenerate Hamiltonian fixed points: on simply connected closed Kähler manifolds of real dimension
  $22$, the deficit below the stable Morse number is unbounded.
  A separate Hamiltonian diffeomorphism of the complex quadric threefold has exactly three fixed points,
  fewer than the four critical points required of every smooth function.

#metadata(none)
#label("result348")

#strong[348.Nonnegatively curved Einstein four-manifolds and a topological gap.]Classifies closed connected
  Einstein four-manifolds with positive Einstein constant and nonnegative sectional curvature:
  up to scaling, their universal Riemannian covers are the round $S^4$, Fubini–Study $bb(C P)^2$,
  or a product of equal round two-spheres. A closed simply connected nonnegatively curved four-manifold is
  diffeomorphic to one of these whenever the scale-invariant $L^2$ norm of its trace-free Ricci curvature lies
  below a universal positive constant.

#metadata(none)
#label("result349")

#strong[349.The Solomon–Yau least-volume conjecture.]Proves the Solomon–Yau least-volume conjecture for minimal
  hypersurfaces of round spheres. For every $m gt.eq 2$, a closed connected minimal immersion into the unit sphere
  $S^(m + 1)$ with non-totally-geodesic image has volume at least that of the smallest minimal Clifford product,
  counting covering multiplicity.

#metadata(none)
#label("result350")

#strong[350.Yau’s nodal conjecture: surfaces and counterexamples.]Proves the sharp $C
  sqrt(lambda)$ upper bound for nodal length on every fixed smooth closed surface,
  completing Yau’s conjecture there. The upper bound fails for fixed smooth metrics in dimensions three and four,
  including metrics on $S^3$ arbitrarily close to round. In dimension five,
  nodal measure can grow faster than $lambda^(1 \/ 2 + epsilon_0)$ for some fixed $epsilon_0 > 0$,
  ruling out even arbitrarily small power losses.

#metadata(none)
#label("result351")

#strong[351.Scalar curvature detects four-dimensional Ricci-flow singularities.]Proves that a smooth Ricci flow on
  a closed four-manifold extends past any finite time at which scalar curvature remains uniformly bounded.
  A higher-dimensional counterexample has bounded scalar curvature but unbounded full curvature at its finite
  maximal time, disproving the unrestricted scalar-curvature extension conjecture.

#metadata(none)
#label("result352")

#strong[352.Finite-time singularity of Calabi flow.]Disproves Chen’s smooth long-time existence conjecture for
  Calabi flow by constructing a smooth $U \( 10 \)$-invariant Kähler metric on $bb(C P)^10$ whose flow develops a
  finite-time singularity. The metric lies in the Fubini–Study class,
  so the failure occurs even in a class containing a constant-scalar-curvature metric.

#metadata(none)
#label("result353")

#strong[353.The sharp dimension threshold for affine Bernstein rigidity.]Proves that every smooth locally
  uniformly convex affine-maximal graph of dimension three through nine,
  complete for its induced Euclidean metric, is an elliptic paraboloid.
  A smooth entire nonquadratic example in dimension ten makes this range sharp.
  In dimensions three through nine, the paraboloid classification also holds for connected open locally uniformly
  convex affine-maximal hypersurfaces complete for the affine Berwald–Blaschke metric.

#metadata(none)
#label("result354")

#strong[354.Isoperimetric regions in the cubic three-torus.]Determines the isoperimetric profile of the unit cubic
  flat three-torus and classifies every finite-perimeter minimizer:
  balls, circular tubes around shortest closed geodesics, coordinate slabs, and their complements.
  The transition volumes are $4 pi \/ 81$ and $1 \/ pi$, with exactly the adjacent two types minimizing at each
  transition.

#metadata(none)
#label("result355")

#strong[355.Unique tangent flows at the first surface singularity.]Proves the first-singular-time case of
  tangent-flow uniqueness for smooth compact connected embedded surfaces without boundary in $bb(R)^3$.
  At every singular point, all fixed-center backward tangent flows agree as area measures at every negative time
  in the original ambient coordinates, without mean-convexity or a prescribed tangent model.

#metadata(none)
#label("result356")

#strong[356.Gigli’s characterization of Alexandrov curvature.]Proves Gigli’s conjecture:
  in every integer dimension $n gt.eq 2$, Alexandrov curvature at least $kappa$ is characterized by the
  full-support $"RCD" \( \( n - 1 \) kappa \, n \)$ condition with reference measure $cal(H)^n$ and distributional
  sectional curvature at least $kappa$ in the original global test classes. The RCD condition is unreduced.

#metadata(none)
#label("result357")

#strong[357.Bi-Lipschitz coordinates at every regular RCD point.]Proves that every regular point of a noncollapsed
  $"RCD" \( K \, n \)$ space, for $K in bb(R)$ and integer $n gt.eq 2$,
  has an open neighborhood bi-Lipschitz to an open subset of $bb(R)^n$.
  Regularity requires all pointed tangents to be Euclidean, the reference measure is exactly $cal(H)^n$,
  and the chart compares ambient distances with a point-dependent finite constant.

#metadata(none)
#label("result358")

#strong[358.A three-manifold with no conjugate points and no nonpositively curved metric.]Constructs a closed
  connected orientable smooth three-manifold that admits a metric without conjugate points but no metric of
  nonpositive sectional curvature. This answers negatively, already in dimension three,
  whether the first metric-existence property implies the second.

#metadata(none)
#label("result359")

#strong[359.Negative Kähler curvature without bounded holomorphic coordinates.]Constructs a contractible domain in
  $bb(C)^3$ with a complete negatively pinched Kähler metric but no bounded holomorphic coordinates,
  disproving bounded-domain uniformization in this setting.
  A higher-dimensional example has sectional curvature at most $-
  1$ and only constant bounded holomorphic functions; its curvature is not bounded below.

#metadata(none)
#label("result360")

#strong[360.Villani’s convexity conjecture and regular optimal transport.]On every closed connected Riemannian
  manifold of dimension at least two satisfying weak Ma–Trudinger–Wang curvature,
  all tangent injectivity domains are convex, resolving Villani’s conjecture in this setting.
  For squared-distance transport between measurable probability densities bounded above and away from zero,
  the optimal map and its inverse are Hölder continuous.

#metadata(none)
#label("result361")

#strong[361.Counterexamples to Yau’s harmonic dimension bound.]Disproves Yau’s proposed Euclidean dimension bound
  for harmonic functions of integer growth on manifolds with nonnegative Ricci curvature.
  For every sufficiently large integer $k$, a complete smooth metric on $bb(R)^3$ has at least $\( k + 2 \)^2$
  independent harmonic functions of growth at most $k$, exceeding the Euclidean count $\( k + 1 \)^2$.
  The metric may depend on $k$.

#metadata(none)
#label("subject9")

#strong[Partial differential equations]

#metadata(none)
#label("result362")

#strong[362.Global smoothness for relativistic Vlasov–Maxwell.]Proves large-data global existence and uniqueness
  for the three-dimensional, one-species relativistic Vlasov–Maxwell system.
  Smooth admissible initial data may be arbitrary provided the particle density is compactly supported and the
  electromagnetic fields have finite energy and bounded derivatives of every order;
  the solution remains smooth on every finite time interval.

#metadata(none)
#label("result363")

#strong[363.Boltzmann nonuniqueness with exact local conservation.]Constructs two distinct global entropy
  solutions of the three-dimensional periodic hard-sphere Boltzmann equation from the same nonnegative initial
  density, with bounded velocity support and finite mass, energy and absolute entropy.
  Both are strongly continuous in $L^1$ and satisfy exact local conservation of mass, momentum and kinetic energy.

#metadata(none)
#label("result364")

#strong[364.Kinetic limits and fluctuations over the Boltzmann lifespan.]Derives the nonlinear Boltzmann equation
  from three-dimensional grand-canonical Newtonian gases throughout every regular kinetic interval with uniform
  Gaussian decay. Stable finite-range radial potentials may have attractive wells and a singular repulsive core;
  initial pair exclusion and spatially summable Gaussian density and gradient bounds are assumed.
  A companion gives finite-dimensional hard-sphere Gaussian fluctuations,
  centered at the exact microscopic expectation and governed by the linear fluctuating Boltzmann equation.

#metadata(none)
#label("result365")

#strong[365.Joint metric and connection recovery from one boundary patch.]Zero-frequency measurements on any
  nonempty open boundary patch determine a smooth metric and smooth unitary connection on a trivial Hermitian
  rank-two bundle over a compact connected manifold of dimension at least three,
  up to diffeomorphism and gauge fixed on that patch. Inputs and observations use the same patch.
  In contrast, distinct uniformly positive bounded measurable scalar conductivities on a three-dimensional ball
  can have identical full-boundary data.

#metadata(none)
#label("result366")

#strong[366.The planar Mumford–Shah regularity conjecture.]Resolves the interior regularity conjecture for reduced
  absolute planar Mumford–Shah minimizers with bounded fidelity data.
  Locally, the closed discontinuity set is a $C^(1 \, alpha)$ arc, a regular crack tip,
  or three arcs meeting at $120^compose$; only finitely many global connected components meet any compact interior
  region.

#metadata(none)
#label("result367")

#strong[367.The critical dimension for the one-phase Bernoulli problem.]Establishes seven as the first dimension
  admitting a nonflat, one-homogeneous global minimizer of the one-phase Bernoulli energy.
  Consequently, minimizing free boundaries are smooth through dimension six,
  and their singular sets have dimension at most $n - 7$ in higher dimensions.

#metadata(none)
#label("result368")

#strong[368.The three-dimensional Ball–Evans approximation problem.]Resolves the three-dimensional Ball–Evans
  approximation problem: every $W^(1 \, p)$ homeomorphism between arbitrary bounded domains in $bb(R)^3$,
  for $1 lt.eq p < oo$, is a strong $W^(1 \, p)$ limit of smooth diffeomorphisms onto the same target.

#metadata(none)
#label("result369")

#strong[369.The hot spots conjecture for simply connected planar domains.]Proves a strict form of Burdzy’s simply
  connected hot spots conjecture. On every smooth bounded simply connected planar domain,
  each nonzero eigenfunction for the first positive Neumann eigenvalue has no interior critical point,
  so all global extrema lie on the boundary. Eigenvalue multiplicity is allowed.

#metadata(none)
#label("result370")

#strong[370.The subcritical Lane–Emden and Hénon–Lane–Emden conjectures.]Resolves the subcritical Lane–Emden
  conjecture and its weighted Hénon extension. For $n gt.eq 2$, $p \, q > 0$ and real $A \, B$, the system $-
  Delta u = \| x \|^A v^p$, $- Delta v = \| x \|^B u^q$ has no positive entire solution when
  $\( n + A \) \/ \( p + 1 \) + \( n + B \) \/ \( q + 1 \) > n - 2$,
  with solutions continuous at the origin and classical elsewhere. No symmetry or growth assumption is needed.
  Known radial existence gives the exact existence criterion for $n gt.eq 3$ and $A \, B > - 2$.

#metadata(none)
#label("result371")

#strong[371.Stable blowup for a defocusing Schrödinger equation.]For a sufficiently large odd nonlinearity power,
  constructs a nonempty open set of initial data in $H^k \( bb(T)^12 \)$, with $k > 8$,
  whose solutions of the scalar defocusing nonlinear Schrödinger equation blow up in finite time.
  Thus finite-time blowup is stable under Sobolev perturbations in this supercritical regime.

#metadata(none)
#label("result372")

#strong[372.Global uniqueness in smooth isotropic elasticity.]Proves that full static boundary
  displacement-to-traction data determine both smooth real Lamé moduli on every bounded connected smooth domain in
  $bb(R)^3$, provided $mu > 0$ and $3 lambda + 2 mu > 0$ on the closure.
  Neither analyticity, proximity to constant coefficients nor prior knowledge near the boundary is required.

#metadata(none)
#label("result373")

#strong[373.Nonattainment in three-marginal Coulomb transport.]An optimal three-particle Coulomb configuration
  need not be a deterministic function of the first particle, even for smooth identical spatial densities.
  The Monge and Kantorovich infima agree, but the Monge infimum is not attained.
  The same phenomenon occurs for every inverse-power Riesz exponent in each dimension at least two,
  with a suitable density in each case.

#metadata(none)
#label("result374")

#strong[374.Sharp one-third stability of optimal transport maps.]For uniform source measure $rho$ on a compact
  convex body with interior in dimension at least two, quadratic optimal transport maps satisfy $parallel T_mu -
  T_nu parallel_(L^2 \( rho \)) lt.eq C W_2 \( mu \, nu \)^(1 \/ 3)$ uniformly over targets in a fixed compact
  set. The exponent is sharp, even for three-atom targets, disproving Letrouit’s conjectured square-root bound.

#metadata(none)
#label("result375")

#strong[375.De Giorgi’s conjecture in dimension eight.]Proves De Giorgi’s conjecture at its sharp dimension-eight
  endpoint: every entire $C^2$ solution $u : bb(R)^8 arrow.r \( - 1 \, 1 \)$ of $Delta u = u^3 -
  u$ that is strictly increasing in one direction depends on only one linear coordinate.
  A stronger theorem classifies all stable entire solutions $v :
  bb(R)^7 arrow.r \[ - 1 \, 1 \]$ as constant wells or planar transitions, without an energy-growth assumption.

#metadata(none)
#label("result376")

#strong[376.Universal computation in forced Navier–Stokes flows.]Constructs viscous incompressible flows starting
  from rest on a fixed flat three-dimensional domain that perform universal computation under smooth external
  forcing. A terminating compiler turns a Turing machine and input into a finite program for the force,
  so a designated particle reaches a fixed region exactly when the machine halts.
  The viscosity is fixed, positive and computable.

#metadata(none)
#label("result377")

#strong[377.Interior $C^(1 \, alpha)$ regularity for infinity-harmonic functions.]Proves uniform interior
  $C^(1 \, alpha_d)$ regularity for bounded infinity-harmonic functions in every dimension $d gt.eq 3$,
  for a positive exponent depending only on dimension. The gradient’s supremum norm and Hölder seminorm on the
  half unit ball are bounded by a dimension-dependent constant times the oscillation on the unit ball.
  The exponent is not explicit.
