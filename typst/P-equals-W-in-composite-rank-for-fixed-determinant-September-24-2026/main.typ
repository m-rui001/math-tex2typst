#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[$P = W$ in composite rank for fixed determinant]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Nonabelian Hodge theory identifies two moduli spaces whose cohomology carries very different geometric
  filtrations. On the Higgs-bundle side, the Hitchin map defines the perverse Leray filtration.
  On the character-variety side, the mixed Hodge structure defines the weight filtration.
  The $P = W$ conjecture asserts that these filtrations coincide after doubling the indices of the first.

The geometric setting comes from Hitchin’s moduli spaces and integrable systems
  #cite(label("Hitchin1987SelfDuality")) #cite(label("Hitchin1987Integrable")).
  The analytic correspondence rests on the foundational work of Hitchin, Donaldson, Corlette,
  and Simpson #cite(label("Hitchin1987SelfDuality")) #cite(label("Donaldson1987")) #cite(label("Corlette1988"))
  #cite(label("Simpson1992")). We use its twisted, fixed-determinant form,
  including the action by torsion line bundles, as described by Hausel and Thaddeus #cite(label("HT2003"))
  Sections 2 and 5.

Let $C$ be a smooth projective complex curve of genus $g gt.eq 2$.
  Fix an integer $n gt.eq 2$, an integer $d$ coprime to $n$, and a line bundle $L in "Pic"^d \( C \)$. Write

$ X = M_(upright("Dol"))^L \( "SL"_n \) $

for the moduli space of stable rank-$n$ Higgs bundles $\( E \, theta \)$ with $det E tilde.eq L$ and $"tr" theta =
  0$. Here stability means that every proper nonzero $theta$-invariant subbundle has slope smaller than $d \/ n$.
  Its Hitchin map is

$ h : X arrow.r A = xor.big_(i = 2)^n H^0 \( C \, K_C^i \) \, $

given by the coefficients of the characteristic polynomial. Put

$ R = \( n^2 - 1 \) \( g - 1 \) \, wide b = frac(n \( n - 1 \), 2) \, wide zeta = exp \( 2 pi sqrt(- 1) d \/ n \) . $

The corresponding twisted character variety is

#[#set math.equation(numbering: n => "(1.1)")
 $ X^B = {\( A_1 \, B_1 \, dots.h \, A_g \, B_g \) in "SL"_n \( bb(C) \)^(2 g) :
   product_(j = 1)^g \[ A_j \, B_j \] = zeta I_n} \/ \/ "SL"_n \( bb(C) \) \, $ <intro:betti>]

where the group acts by simultaneous conjugation and $\[ A \, B \] = A B A^(- 1) B^(- 1)$.
  Coprimality makes both spaces smooth and makes every representation in (1.1) irreducible.
  Nonabelian Hodge theory gives a diffeomorphism between them #cite(label("HT2003")) #cite(label("Simpson1997")).

We use rational cohomology unless complex coefficients are indicated.
  The Hitchin map is proper, $dim X = 2 R$, $dim A = R$, and

$ dim \( X times_A X \) - dim X = R . $

Thus the standard $P = W$ normalization is

#[#set math.equation(numbering: n => "(1.2)")
 $ P_k H^m \( X \) = "im" {H^(m - R) #h(-0.16667em) (A \, zws^p tau_(lt.eq k) R h_(*) bb(Q)_X \[ R \]) arrow.r
   H^m \( X \)} . $ <intro:P>]

Here $zws^p tau$ denotes truncation for the middle perverse $t$-structure.
  We recall the dimension and shift conventions in Section 2.
  Transport $P$ to $H^(*) \( X^B \)$ by nonabelian Hodge theory,
  and let $W$ denote Deligne’s weight filtration there #cite(label("Deligne1971")) #cite(label("Deligne1974")).

#thm([Theorem 1.1.])[
  #emph[For every smooth projective complex curve $C$ of genus $g gt.eq 2$, every composite integer $n gt.eq 4$,
    every integer $d$ with $gcd \( n \, d \) = 1$, and every $L in "Pic"^d \( C \)$, one has
$ P_k H^m \( X^B \, bb(Q) \) = W_(2 k) H^m \( X^B \, bb(Q) \) = W_(2 k + 1) H^m \( X^B \, bb(Q) \) $

 for all $m \, k gt.eq 0$.]
] <thm:main>

The assertion concerns the entire cohomology. The group $Gamma =
  "Pic"^0 \( C \) \[ n \]$ acts on $X$ by tensor product. Its averaging projector

$ "av"_Gamma = frac(1, \| Gamma \|) sum_(gamma in Gamma) gamma^(*) $

has image $H^(*) \( X \, bb(Q) \)^Gamma$ and kernel the #emph[variant cohomology]
  $H_(upright("var"))^(*) \( X \, bb(Q) \)$. Thus, after complexification,
  the theorem includes every nontrivial $Gamma$-character, not only the invariant part.
  Combining Theorem 1 with the established prime-rank cases #cite(label("MS2024")) Theorem 0.3 resolves the smooth
  coprime fixed-determinant, trace-free $P = W$ conjecture in every rank $n gt.eq 2$.

=== 1.1 History and the fixed-determinant problem <history-and-the-fixed-determinant-problem>

The weight symmetries behind $P = W$ arose from the arithmetic study of character varieties by Hausel and
  Rodriguez-Villegas #cite(label("HRV2008")), extended to generic puncture data by Hausel, Letellier,
  and Rodriguez-Villegas #cite(label("HLRV2011")). De Cataldo, Hausel,
  and Migliorini formulated the filtration comparison and established it in rank two #cite(label("dCHM2012")).
  Their theorem relates the topology of an algebraic integrable system to the mixed Hodge theory of an affine
  character variety: relative hard Lefschetz on the Higgs side explains curious hard Lefschetz on the Betti side.

Tautological classes have been central to the higher-rank problem.
  For $"GL"_n$, generation by these classes was established in rank two by Hausel and Thaddeus
  #cite(label("HTGenerators2004")) and in arbitrary rank by Markman #cite(label("Markman2002")) Theorem 7;
  Shende determined their Betti weights #cite(label("Shende2017")).
  De Cataldo, Maulik, and Shen proved $P = W$ for $"GL"_n$ in genus two and obtained the required perversity
  bounds for tautological classes in arbitrary genus #cite(label("dCMSJAMS2022")) Theorems 0.2 and 0.4–0.6.

Maulik and Shen proved the coprime $"GL"_n$ conjecture in arbitrary rank and genus #cite(label("MS2024")).
  Further proofs use the Hecke-algebra action of Hausel, Mellit, Minets,
  and Schiffmann #cite(label("HMMS2025")) and the Fourier-transform method of Maulik, Shen,
  and Yin #cite(label("MSY2025")) Theorem 0.4.

For fixed determinant, the quotient by $Gamma$ detects the invariant cohomology,
  and the projective tautological generation theorem applies to this quotient #cite(label("MS2024"))
  Theorem 2.1(i). It does not generate the variant part. De Cataldo, Maulik,
  and Shen determined the two filtrations on the variant part in prime rank and reduced $"SL"_p$ to $"GL"_p$
  #cite(label("dCMS2022")); together with the general $"GL"_p$ theorem,
  this gives the prime-rank cases cited above. In arbitrary rank,
  Maulik and Shen constructed endoscopic correspondences compatible with the perverse filtrations
  #cite(label("MSEndoscopy2021")) Theorem 5.4, without identifying the full filtrations in composite rank.
  Corollary 31 combines our all-rank equality with cover-side $"GL"_r$ $P =
  W$ to give the exact Betti-weight image equality asked in #cite(label("MSEndoscopy2021")) Question 5.5,
  for the canonical-twist operator transported by nonabelian Hodge theory.

Our argument constructs an operator on the full cohomology, before taking $Gamma$-invariants.
  Its algebraic pattern follows the common $frak(s l)_2$ structure and flag-correspondence methods of Hausel,
  Mellit, Minets, and Schiffmann #cite(label("HMMS2025")) Proposition 7.9 and Section 8.
  The fixed-determinant construction requires two further geometric steps.
  First, we pull Mellit’s toric stratifications through a determinant-root cover and prove integral local
  constancy and ordinary base change. The inputs include the relative product stratification over ordered
  eigenvalues, including collisions #cite(label("Mellit2025")) Section 7.4, Theorem 7.5,
  and proof of Proposition 8.7. This yields curious hard Lefschetz on the full fixed-determinant cohomology,
  rather than only its invariant part.

Second, we use a finite diagram of algebraic fibers to give weight zero to the cochains of a topological
  moving-point base. Shende used this weight convention for simplicial bases and tautological classes
  #cite(label("Shende2017")) proof of the main Theorem. Here the construction also carries variations and proper
  Gysin maps, using mixed Hodge modules and their coherent enhancement #cite(label("SaitoExtension1990"))
  #cite(label("TubachStacks2025")). Its finite weight-graded monodromy supplies the lowering operator.
  These diagram weights are distinct from the usual weights of an algebraic moving-point curve;
  that distinction is needed for integration over the curve to have weight shift zero.

=== 1.2 The operator behind the comparison <the-operator-behind-the-comparison>

The universal projective bundle on $C times X$ has local vector-bundle lifts $cal(E)$.
  The following characteristic class is independent of the lift and descends to $C times X$; integration over $C$ gives

$ e = integral_C ("ch"_2 \( cal(E) \) - frac(c_1 \( cal(E) \)^2, 2 n)) =
  frac(1, 2 n) integral_C "ch"_2 \( "End" cal(E) \) in H^2 \( X \) . $

We also write $e$ for cup product by this class. Section 2 proves that $H^2 \( X \) =
  bb(Q) e$ and that $e$ satisfies relative hard Lefschetz, with center $R$.
  Section 3 proves curious hard Lefschetz for the same class and the half-weight grading, again with center $R$.

It remains to construct one degree-$- 2$ operator $f$ such that

#[#set math.equation(numbering: n => "(1.3)")
 $ f P_k subset P_(k - 2) \, wide f W_j subset W_(j - 4) \, wide \[ \[ f \, e \] \, e \] = -
   2 e . $ <intro:operator-goal>]

An elementary Lefschetz-module argument then identifies both filtrations as sums of eigenspaces of the same
  operator $\[ e \, f \]$. It also handles extensions between filtration grades.

To construct $f$, allow one logarithmic pole, move it over a finite cover $S arrow.r C$,
  and choose a full flag at the pole. The logarithmic $lambda$-connection parameter interpolates between Higgs
  bundles at $lambda = 0$ and connections at $lambda = 1$. The underlying moduli constructions and semistable
  reduction come from #cite(label("dCFHLogHodge")) #cite(label("FHZ2025"));
  the restriction argument uses the semiprojective geometry of #cite(label("HRV2015")).
  We verify the fixed determinant, residue, and flag conditions,
  as well as compatibility with the full nonabelian-Hodge identification.
  Write $X_lambda$ for the fixed-pole scalar-residue moduli space, with $X_0 = X$.
  At scalar residue, the flag space fits into a correspondence

$ X_lambda arrow.l^(med "pr" med) S times X_lambda arrow.l^(med pi med) Z_lambda arrow.r^(med iota med)
  Y_(lambda \, 0) . $

Here $Y_(lambda \, 0)$ permits a flag-preserving residue with prescribed scalar diagonal,
  while $Z_lambda$ requires the residue itself to be scalar.
  We first deform the ordered residues to distinct values and shift two residue eigenline lattices in opposite
  directions. Restriction isomorphisms from the total logarithmic Hodge family transport the resulting translation
  to a degree-zero operator $T$ on $H^(*) \( Y_(lambda \, 0) \)$.
  On the connection side, $T$ is eigenvalue monodromy. A power has unipotent action,
  and its logarithm $N$ lowers the diagram weights by two.

At $lambda = 0$, the resulting operator, before multiplication by a nonzero scalar, is

$ f' = "pr"_(*) pi_(*) iota^(*) N^2 iota_(*) pi^(*) "pr"^(*) . $

The flag shifts cancel. The square $N^2$ lowers weights by four,
  and integration over $S$ has weight shift zero in the diagram construction.
  On the Higgs side, nearby cycles realize this same operator as a morphism $R h_(*) bb(Q)_X arrow.r
  R h_(*) bb(Q)_X \[ - 2 \]$, giving the perverse bound. A lattice Riemann–Roch calculation then gives the double
  commutator in (1.3) after explicit rescaling.

The proof keeps three comparison statements separate: ordinary base change for the Betti family,
  restriction isomorphisms for the logarithmic Hodge family, and specialization over the Hitchin base.
  Each is proved with its own hypotheses. Section 2 gives the Lefschetz comparison criterion.
  Section 3 proves ordinary base change and curious hard Lefschetz for the full fixed-determinant Betti family.
  Section 4 constructs the diagram weights, and Section 5 establishes the logarithmic restriction isomorphisms and
  full-cohomology comparison. Section 6 constructs the common operator and proves its weight bound;
  Section 7 proves its perverse bound by specialization. Section 8 computes the double commutator,
  and Section 9 assembles these results to prove Theorem 1.

== 2 Lefschetz operators and the comparison criterion <sec:lefschetz>

For the proof of Theorem 1, assume that $n gt.eq 4$ is composite.
  We first fix the perverse normalization and identify a common candidate for the two Lefschetz operators.
  We then give the linear-algebra argument that will compare the filtrations once a common lowering operator has
  been constructed. Throughout this section, cohomology has rational coefficients.

=== 2.1 The normalized perverse filtration <the-normalized-perverse-filtration>

Recall that $X$ parametrizes stable, trace-free Higgs bundles of rank $n$ and determinant $L$ on $C$,
  and that $h : X arrow.r A$ is its Hitchin map. The standard geometry of this system gives a proper surjective
  morphism from a smooth quasi-projective variety, together with a holomorphic symplectic form of weight one for
  Higgs-field scaling; see #cite(label("dCMS2022")) Section 1.1.

#thm([Lemma 2.1.])[
  #emph[Set $R = \( n^2 - 1 \) \( g - 1 \)$. Then $dim X = 2 R$, $dim A = R$,
    and every fiber of $h$ has dimension $R$. In particular,
$ r := dim \( X times_A X \) - dim X = R . $

]
] <norm:dimensions>

#proof[
  Riemann–Roch gives
  $ dim A = sum_(i = 2)^n h^0 \( C \, K_C^i \) = sum_(i = 2)^n \( 2 i - 1 \) \( g - 1 \) = R . $
  The trace-free Higgs deformation complex has vanishing zeroth and second hypercohomology,
    by stability and Serre duality. Its Euler characteristic is $- 2 R$,
    so the tangent space has dimension $2 R$ at every point.
  We recall why the fiber bound holds also over the singular Hitchin values.
    Higgs-field scaling makes $X$ semiprojective: properness of $h$ extends each scaling orbit at zero,
    since its Hitchin value extends there, and the fixed locus is closed in the proper fiber $h^(- 1) \( 0 \)$.
    For the Białynicki–Birula decomposition #cite(label("BialynickiBirula1973")) in this semiprojective setting,
    see #cite(label("HRV2015")) Section 1.2. At a fixed point,
    the symplectic form pairs a tangent weight $w$ with weight $1 - w$.
    The weights are integers, so the nonpositive tangent weights account for exactly half the tangent dimension.
    Consequently each repelling stratum, including its fixed component, has dimension $R$.
  The union of these strata is $h^(- 1) \( 0 \)$. Indeed, a point with a limit at infinity must have zero Hitchin
    value, because every Hitchin coordinate has positive scaling weight.
    Conversely, an orbit in $h^(- 1) \( 0 \)$ has a limit at infinity because that fiber is proper.
    Thus $dim h^(- 1) \( 0 \) = R$. Pulling $h$ back along the weighted scaling curve from any $a in A$ to zero,
    upper semicontinuity of fiber dimension for a proper morphism gives $dim h^(- 1) \( a \) lt.eq R$.
    The dimension inequality for a morphism from a smooth $2 R$-dimensional variety to an $R$-dimensional variety
    gives the reverse inequality on each nonempty fiber. Surjectivity therefore proves the asserted
    equidimensionality. It follows that $dim \( X times_A X \) = R + 2 R = 3 R$. ◻
]

Put

$ K = R h_(*) bb(Q)_X \[ R \] . $

We normalize the perverse filtration by

#[#set math.equation(numbering: n => "(2.1)")
 $ P_k H^m \( X \) = "Im" {H^(m - R) #scale(x: 120%, y: 120%)[\(] A \,
   zws^p tau_(lt.eq k) K #scale(x: 120%, y: 120%)[\)] arrow.r H^m \( X \)} . $ <norm:perverse-filtration>]

This is the normalization of #cite(label("MS2024")) Section 1.1.
  The fiber bound implies that $R h_(*) bb(Q)_X \[ 2 R \]$ has perverse cohomology only in degrees
  $\[ - R \, R \]$: the upper bound follows from the support criterion,
  and the lower bound follows by Verdier duality. Indeed its ordinary stalk cohomology vanishes in positive
  degrees, and every support has dimension at most $R$. After shifting by $\[ - R \]$,
  the perverse degrees of $K$ lie in $\[ 0 \, 2 R \]$. In particular,

#[#set math.equation(numbering: n => "(2.2)")
 $ P_(- 1) H^(*) \( X \) = 0 \, wide P_(2 R) H^(*) \( X \) = H^(*) \( X \) . $ <norm:perverse-range>]

We will use the following shift convention repeatedly. A morphism $K arrow.r
  K \[ s \]$ induces a map of cohomological degree $s$ sending $P_k$ into $P_(k + s)$, since

#[#set math.equation(numbering: n => "(2.3)")
 $ zws^p tau_(lt.eq k) \( K \[ s \] \) = \( zws^p tau_(lt.eq k + s) K \) \[ s \] . $ <norm:shift-rule>]

Thus an actual morphism $R h_(*) bb(Q)_X arrow.r R h_(*) bb(Q)_X \[ - 2 \]$ will supply precisely the lowering
  bound needed below.

=== 2.2 The degree-two class <the-degree-two-class>

The universal projective bundle on $C times X$ determines the characteristic class

$ tilde("ch")_2 \( E \) = "ch"_2 \( E \) - frac(c_1 \( E \)^2, 2 n) = frac(1, 2 n) "ch"_2 \( "End" E \) . $

The last expression also defines it when a universal vector bundle has not been chosen. Define

#[#set math.equation(numbering: n => "(2.4)")
 $ e = integral_C tilde("ch")_2 \( E \) in H^2 \( X \) . $ <norm:e>]

We also write $e$ for cup product by this class.

#thm([Lemma 2.2.])[
  #emph[For the composite ranks $n gt.eq 4$ under consideration,
$ H^0 \( X \) = bb(Q) \, wide H^1 \( X \) = 0 \, wide H^2 \( X \) = bb(Q) e \, wide e eq.not 0 . $

 Every ample class on $X$ is a nonzero scalar multiple of $e$.]
] <norm:low-cohomology>

#proof[
  The finite group $Gamma = "Pic"^0 \( C \) \[ n \]$ acts on $X$ by tensor product.
    Averaging over $Gamma$ decomposes rational cohomology into its invariant summand and its complementary variant
    summand. Let $p$ be the smallest prime divisor of $n$, and put
  $ c = n \( n - n \/ p \) \( g - 1 \) . $
  Proposition 1.4 of #cite(label("dCMS2022")), which applies to arbitrary rank, gives
  $ H_(upright("var"))^i \( X \) = P_(i - c) H_(upright("var"))^i \( X \) . $
  Here $c gt.eq n^2 \/ 2 gt.eq 8$, so (2.2) makes the variant summand vanish in degrees $0$, $1$, and $2$.
  The invariant summand is the rational cohomology of the corresponding $upright("PGL")_n$ moduli space.
    Markman’s generation theorem #cite(label("Markman2002")) Theorem 7,
    in the projective-bundle formulation of #cite(label("MS2024")) Theorem 2.1(i),
    states that this algebra is generated by the Künneth components of the projective Chern characters with
    indices $j gt.eq 2$. These components have degrees $2 j$, $2 j - 1$, and $2 j - 2$ on the moduli space.
    There are therefore no degree-one generators and only one possible degree-two generator,
    namely a nonzero normalization of the expression defining $e$.
    This proves $H^0 \( X \) = bb(Q)$, $H^1 \( X \) = 0$, and $H^2 \( X \) = bb(Q) e$,
    with nonvanishing still to be checked.
  Choose an ample line bundle on $X$. By Lemma 2, a Hitchin fiber is projective of positive dimension,
    and hence contains an integral projective curve. The ample bundle has positive degree on that curve,
    so its first Chern class is nonzero in $H^2 \( X \)$. The one-dimensional upper bound just proved now gives $e
    eq.not 0$ and the final assertion. ◻
]

#thm([Proposition 2.3.])[
  #emph[Cup product by $e$ sends $P_k H^m \( X \)$ into $P_(k + 2) H^(m + 2) \( X \)$.
    For every $i gt.eq 0$ and every $m$, it induces an isomorphism
#[#set math.equation(numbering: n => "(2.5)")
 $ e^i : "Gr"_(R - i)^P H^m \( X \) arrow.r^(med tilde.op med) "Gr"_(R + i)^P H^(m + 2 i) \( X \) .
   $ <norm:relative-hl>]

]
] <norm:relative-lefschetz>

#proof[
  The filtration shift follows from (2.3) applied to the cup-product morphism.
    Choose an ample class on $X$, which is also relatively ample for the proper morphism $h$,
    making $h$ projective. The decomposition theorem and relative hard Lefschetz #cite(label("BBD1982"))
    Theorems 6.2.5 and 6.2.10 give (2.5) for that class: the perverse degrees of $R h_(*)
    bb(Q)_X \[ 2 R \]$ have center zero, and the shift to $K$ moves the center to $R$.
    The decomposition theorem also makes the perverse cohomology spectral sequence degenerate,
    so these sheaf-theoretic isomorphisms give the displayed isomorphisms on associated-graded cohomology.
    Lemma 3 replaces the ample class by a nonzero scalar multiple of $e$, without changing invertibility. ◻
]

=== 2.3 A common lowering operator determines the filtration <a-common-lowering-operator-determines-the-filtration>

For a finite graded vector space $V = xor.big_k V_k$ and a degree-two operator $E$,
  say that $E$ is #emph[Lefschetz with center $r$] if

$ E^i : V_(r - i) arrow.r^tilde.op V_(r + i) quad upright("for every ") i gt.eq 0 . $

Here $r$ is an integer, and grades outside the finite support are zero.
  Proposition 4 gives this property for the total perverse associated graded, with center $R$.
  The next statement explains the role of the lowering operator in the proof.
  The use of an $frak(s l)_2$-operator to determine the perverse filtration is also central to
  #cite(label("HMMS2025")) Propositions 7.9 and 8.2–8.3. We prove the precise two-filtration criterion needed
  here, including the passage from associated gradeds to the filtrations themselves.

#thm([Proposition 2.4.])[
  (Comparison by a common lowering operator).  #emph[Let $H$ be a finite-dimensional vector space over a field of
    characteristic zero, with finite, exhaustive, separated increasing integer-indexed filtrations $F_bullet$ and
    $G_bullet$. Suppose that $e \, f in "End" \( H \)$ satisfy, for $A_bullet = F_bullet$ and $A_bullet = G_bullet$,
$ e \( A_k \) subset.eq A_(k + 2) \, wide f \( A_k \) subset.eq A_(k - 2) . $

 Assume that the induced raiser on each associated graded is Lefschetz with the same center $r$, and that
#[#set math.equation(numbering: n => "(2.6)")
 $ \[ \[ f \, e \] \, e \] = - 2 e \, wide \[ u \, v \] = u v - v u . $ <alg:double-commutator>]

 Then $F_k = G_k$ for every integer $k$. If $H$ has a further grading respected by both filtrations, and $e \,
   f$ have degrees $2 \, - 2$ for that grading, the equality holds degree by degree.]
] <alg:comparison>

#proof[
  Fix either associated graded, and denote its raiser by $E$.
    The Lefschetz decomposition expresses it as a sum of primitive strings
  $ v \, E v \, dots.h \, E^ell v \, wide deg v = r - ell . $
  On each string set
  $ F_0 \( E^j v \) = j \( ell - j + 1 \) E^(j - 1) v . $
  If $H_0$ acts by $k - r$ on grade $k$, direct calculation gives
  $ \[ E \, F_0 \] = H_0 \, wide \[ H_0 \, E \] = 2 E \, wide \[ H_0 \, F_0 \] = - 2 F_0 . $
  Thus $\( E \, H_0 \, F_0 \)$ is an $frak(s l)_2$-triple, and $\[ \[ F_0 \, E \] \, E \] = - 2 E$.
  We claim that a degree $- 2$ endomorphism satisfying this last identity must equal $F_0$.
    On the endomorphism space, the adjoint $frak(s l)_2$-action identifies grading degree $-
    2$ with $H_0$-weight $- 2$. Decompose this finite-dimensional representation into irreducibles.
    In any irreducible summand containing weight $- 2$, two raising steps map that weight space nontrivially to
    weight $2$. Consequently
  $ \( "ad" E \)^2 : "End" \( "Gr"^A H \)_(- 2) arrow.r "End" \( "Gr"^A H \)_2 $
  is injective. Applying this to $"Gr"^A \( f \) - F_0$ and (2.6) proves the claim.
  It follows that the single operator $h_0 = \[ e \, f \]$ on $H$ preserves both filtrations and acts on their
    grade $k$ by $k - r$. Choose integers $a lt.eq b$ containing all their nonzero grades. For either filtration,
  $ \( h_0 - \( k - r \) \) A_k subset.eq A_(k - 1) . $
  Applying these factors successively from $k = b$ down to $k = a$ gives
  $ product_(k = a)^b \( h_0 - \( k - r \) \) = 0 . $
  The polynomial has distinct roots, so $h_0$ is semisimple.
    Every $h_0$-stable subspace is therefore the direct sum of its intersections with the eigenspaces.
    If a nonzero eigenvector first belongs to $A_j$, its image in $"Gr"_j^A H$ shows that its eigenvalue is $j -
    r$. Since each $A_k$ is $h_0$-stable, this proves
  #[#set math.equation(numbering: n => "(2.7)")
   $ A_k = xor.big_(j lt.eq k) ker #scale(x: 120%, y: 120%)[\(] h_0 - \( j - r \) #scale(x: 120%, y: 120%)[\)] .
     $ <alg:eigenspace-filtration>]
  The right side is independent of the choice of filtration, proving $F_k = G_k$.
    In the additionally graded setting, $h_0$ has degree zero,
    so its eigenspaces and (2.7) decompose degree by degree. ◻
]

We also record a cancellation fact for the Betti Lefschetz argument.

#thm([Lemma 2.5.])[
  #emph[Let $V \, W$ be nonzero finite integer-graded vector spaces over a field of characteristic zero,
    and let $E_V \, E_W$ have degree two. If $E_V ⊗ 1 + 1 ⊗ E_W$ is Lefschetz with center $r$ on $V ⊗ W$,
    then $E_V$ and $E_W$ are Lefschetz with centers $r_V \, r_W$, respectively, where $r_V + r_W = r$.]
] <alg:tensor>

#proof[
  Choose homogeneous Jordan-string decompositions for the two operators,
    which are nilpotent because the gradings have finite support.
    The tensor product of any pair of strings is a graded invariant direct summand, with invariant complement,
    for the sum operator. Each Lefschetz isomorphism is block diagonal with respect to these summands,
    so it is an isomorphism on each of them.
  For a string whose lowest and highest grades are $p$ and $q$, call $\( p + q \) \/ 2$ its center.
    The average of the lowest and highest grades of a tensor product of two strings is the sum of their centers.
    Its Lefschetz symmetry forces that sum to equal $r$, for every pair of strings.
    Fixing one string in either factor shows that all strings in the other factor have the same center.
    A Jordan string is Lefschetz about its own center, which proves the conclusion. ◻
]

We will apply Proposition 5 to total cohomology, with $F_k = P_k$ and $G_k =
  W_(2 k)$ under nonabelian Hodge theory. Section 3 proves that $e$ is also Lefschetz for the half-weight grading,
  with center $R$, and that all odd weight-graded pieces vanish.
  The remaining geometric construction supplies one operator $f : H^m \( X \) arrow.r
  H^(m - 2) \( X \)$ satisfying both lowering bounds and (2.6).
  The proposition then identifies the two filtrations in every cohomological degree;
  the separate even-weight assertion gives $W_(2 k) = W_(2 k + 1)$.

== 3 Curious hard Lefschetz on the full character variety <sec:betti>

We now establish the Betti Lefschetz statement needed for the comparison criterion.
  The point requiring care is the full cohomology of the fixed-determinant space.
  We obtain it from a finite cover of a $upright("GL")_n$ family, retaining every component of every lifted stratum.

For a finite-dimensional vector space graded by half weights,
  a class of cohomological degree two and weight four acts with grading degree two.
  We say it satisfies #emph[Lefschetz with center $c$] if its $i$th power is an isomorphism from grade $c -
  i$ to grade $c + i$, in the corresponding cohomological degrees, for every $i gt.eq 0$.

A mixed Hodge structure is #emph[Hodge–Tate] if its odd weight-graded pieces vanish and its weight-$2
  r$ piece has only Hodge type $\( r \, r \)$.

#thm([Theorem 3.1.])[
  #emph[The mixed Hodge structure on $H^(*) \( X^(upright(B)) \, bb(Q) \)$ is Hodge–Tate.
    Under the nonabelian-Hodge identification, the class $e$ has nonzero image in $"Gr"_4^W
    H^2 \( X^(upright(B)) \, bb(Q) \)$, and
$ e^i : "Gr"_(2 R - 2 i)^W H^m \( X^(upright(B)) \, bb(Q) \) arrow.r^(med tilde.op med) "Gr"_(2 R + 2 i)^W
  H^(m + 2 i) \( X^(upright(B)) \, bb(Q) \) wide \( i gt.eq 0 \) . $

 In particular, $W_(2 k) = W_(2 k + 1)$ on this cohomology.
   These assertions concern the entire cohomology, including all nontrivial $Gamma$-character summands after
   complexification.]
] <betti:lefschetz>

=== 3.1 The ordered family and its scalar fiber <the-ordered-family-and-its-scalar-fiber>

Let

$ V = {\( t_1 \, dots.h \, t_n \) in \( bb(C)^(*) \)^n : product_i t_i = 1 \, quad
  product_(i in I) t_i eq.not 1 upright(" for ") diameter eq.not I subset.neq { 1 \, dots.h \, n }} \, wide
  q = \( zeta \, dots.h \, zeta \) . $

The space $V$ is a connected smooth open subset of a torus, and $q in V$ since $zeta$ has order $n$.
  Write $nu = product_(j = 1)^g \[ A_j \, B_j \]$. The fiber $Y_t^(upright(B))$ parametrizes tuples
  $\( A_1 \, B_1 \, dots.h \, A_g \, B_g \) in upright("SL")_n^(2 g)$ together with a full flag preserved by $nu$,
  on whose ordered graded lines $nu$ acts by $t_1 \, dots.h \, t_n$, modulo simultaneous conjugation.
  Repeated eigenvalues are allowed.

Every such tuple is irreducible. Indeed, on a common invariant proper subspace the determinant of $nu$ is one,
  while its eigenvalues form a proper nonempty submultiset of the $t_i$. This contradicts the definition of $V$.
  Thus conjugation gives geometric quotients by a free $upright("PGL")_n$ action.
  They may be constructed by the usual étale-local principal-bundle charts on irreducible tuples;
  with a full flag, these charts can also be obtained by completing its first line to a basis using words in the
  matrices.

#thm([Lemma 3.2.])[
  #emph[The morphism $Y^(upright(B)) arrow.r V$ is smooth of relative dimension $2 R + 2 b$. There is a correspondence
$ X^(upright(B)) arrow.l^(med pi med) Z^(upright(B)) arrow.r^(med iota med) Y_q^(upright(B)) \, $

 where $Z^(upright(B))$ imposes $nu = zeta I$ and $pi$ is the full flag bundle.
   The map $iota$ is a regular embedding of codimension $b$ with normal bundle $T_pi^(*)$. The cohomological operators
$ sans(A) = pi_(*) iota^(*) \, wide sans(B) = iota_(*) pi^(*) $

 have degrees $- 2 b$ and $2 b$, respectively, and satisfy
#[#set math.equation(numbering: n => "(3.1)")
 $ sans(A) sans(B) = \( - 1 \)^b n ! thin upright("id") . $ <betti:split>]

 Here and below a covariant star denotes the Gysin map.]
] <betti:geometry>

#proof[
  The commutator-product map is a submersion at every irreducible tuple. We give the differential check.
    For a pair $a \, b'$ set $c = a b' a^(- 1) b' ""^(- 1)$. Its right-translated differential has terms
  $ \( 1 - "Ad"_(a b' a^(- 1)) \) u \, wide \( "Ad"_a - "Ad"_c \) v . $
  Using the trace pairing, an annihilating vector $z$ is fixed by $a b' a^(- 1)$ and satisfies $"Ad"_(a^(- 1)) z =
    "Ad"_(b') z$. It is therefore fixed by $a b'$, hence by $a$ and $b'$.
    For a product of commutators one applies this argument to the testing vector conjugated by each prefix.
    Since the vector is fixed by the current commutator, it stays unchanged from one pair to the next.
    It consequently centralizes every matrix. Irreducibility forces a scalar, and the trace-free condition forces zero.
  The space of a matrix in a flag Borel, with its flag, is smooth over its ordered diagonal torus,
    with fibers of dimension $2 b$. Pulling this space back along the submersion and then taking the free quotient
    gives smoothness. The relative dimension is
  $ 2 g \( n^2 - 1 \) + 2 b - 2 \( n^2 - 1 \) = 2 R + 2 b . $
  At $q$, the section $zeta^(- 1) nu - I$ takes values in the nilradical bundle over the flag space.
    Its zero locus is $Z^(upright(B))$, and submersivity proves that this section is regular.
    The trace pairing identifies the nilradical with the dual of the flag tangent space,
    so its associated bundle is $T_pi^(*)$. Self-intersection and the projection formula now give
  $ sans(A) sans(B) \( alpha \) = pi_(*) #scale(x: 120%, y: 120%)[\(] c_b \( T_pi^(*) \) pi^(*) alpha
    #scale(x: 120%, y: 120%)[\)] = \( - 1 \)^b chi \( upright("Fl")_n \) alpha = \( - 1 \)^b n ! alpha . $
  All constructions descend through $upright("PGL")_n$ and apply to full cohomology. ◻
]

=== 3.2 Lifting the toric stratifications <lifting-the-toric-stratifications>

Set $D_1 = \( bb(C)^(*) \)^(2 g)$ and $hat(Y)^(upright(B)) = Y^(upright(B)) times D_1$.
  Multiplying each of the $2 g$ matrices by its corresponding scalar gives

#[#set math.equation(numbering: n => "(3.2)")
 $ hat(Y)^(upright(B)) arrow.r Y_(upright("GL"))^(upright(B)) \, $ <betti:cover>]

where the target is the same ordered family with matrices in $upright("GL")_n$.
  This is the pullback of the $n$th-power map on the $2 g$ determinant coordinates,
  hence is finite étale of degree $n^(2 g)$. Its source is the indicated product:
  dividing by the chosen determinant roots gives matrices in $upright("SL")_n$, without changing commutators or flags.

We use Mellit’s toric stratifications of the $upright("GL")_n$ family #cite(label("Mellit2025")).
  To identify the family exactly, take two punctures with first monodromy $zeta^(- 1) I$ and last monodromy $zeta
  nu^(- 1)$. The latter has ordered eigenvalues $\( zeta t_i^(- 1) \)_i$.
  The product relation is $nu zeta^(- 1) I dot.op zeta nu^(- 1) = I$,
  and the genericity condition of #cite(label("Mellit2025")) Definition 4.9 is precisely the subproduct condition
  in the definition of $V$. Its identity last monodromy corresponds to $q$.
  The ordering condition in that reference is automatic for the scalar first monodromy and for the
  distinct-eigenvalue last monodromy.

We recall the two features of the stratifications which will be used.
  First, at a parameter with distinct $t_i$, an auxiliary rank-$b$ vector bundle over
  $Y_(upright("GL") \, t)^(upright(B))$ has a finite stratification refined into vector bundles over products of
  tori and affine spaces. The restriction of Mellit’s degree-two class gives compact-support curious Lefschetz on
  every final stratum, with the same middle weight. If $delta = dim Y_(upright("GL") \, t)^(upright(B))$,
  that middle #emph[actual] weight is $delta + 2 b$; removal of the vector-bundle shift gives $delta$
  #cite(label("Mellit2025")) Theorem 6.14, Section 7.4, and Theorem 7.5.
  Second, over all of $V$, an auxiliary affine bundle of rank $b$ has a finite stratification whose refinements
  are vector bundles over

$ bb(A)^a times \( bb(C)^(*) \)^s times V $

with structural map the projection to $V$ #cite(label("Mellit2025")) proof of Proposition 8.7.
  These assertions are about the final torus–affine refinements,
  not about arbitrary braid strata occurring earlier in their construction.

Here is the additional finite-cover argument needed for (3.2).

#thm([Lemma 3.3.])[
  #emph[Pulling the preceding auxiliary bundles and stratifications back along (3.2) has the following consequences.]
  + #emph[Every fiber of $hat(Y)^(upright(B)) arrow.r V$ and of $Y^(upright(B)) arrow.r
    V$ has Hodge–Tate cohomology. For $hat(Y)^(upright(B))$ at a parameter with distinct eigenvalues,
    the pulled-back class satisfies curious hard Lefschetz on ordinary cohomology with half-weight center
    $delta \/ 2 = R + b + g$.]
  + #emph[The cohomology sheaves of both ordinary and compact-support integral direct images over $V$ are locally
    constant and finitely generated. Ordinary direct image commutes with restriction to every fiber.
    The same assertions hold for $Y^(upright(B)) arrow.r V$.]
] <betti:finite-cover>

#proof[
  Consider first a final stratum $F = \( bb(C)^(*) \)^s times bb(A)^a$, or a vector bundle over such a stratum.
    Its homotopy type is that of a torus. Each connected component $tilde(F)$ of its finite étale preimage
    corresponds to a finite-index subgroup of $bb(Z)^s$. The pullback
  $ H^(*) \( F \, bb(Q) \) arrow.r H^(*) \( tilde(F) \, bb(Q) \) $
  is therefore an isomorphism: both rings are the exterior algebras of the rational duals of these lattices.
    Since the map is algebraic, it is an isomorphism of mixed Hodge structures.
    Both spaces are smooth of the same dimension, and finite-degree trace together with Poincaré duality gives the
    same assertion for compact supports. These isomorphisms commute with cup product by the pulled-back class.
  We apply this argument to each connected component separately.
    The cohomology of a disconnected preimage is their direct sum,
    and all components have the same Lefschetz center. Preimages of the closed filtration of the original
    stratification still give a finite closed filtration. In the compact-support localization sequences,
    strictness of mixed Hodge morphisms #cite(label("Deligne1971")) Theorem 2.3.5 permits passage to
    weight-gradeds. Comparing these exact sequences by a fixed power of the common class and using the five lemma
    passes the Lefschetz isomorphisms from the strata to the entire auxiliary space.
    The same sequences show that its cohomology is Hodge–Tate.
  The pulled-back auxiliary bundle has the same rank $b$. Its Thom isomorphism shifts cohomological degree and
    actual weight by $2 b$. Thus the compact-support middle weight drops from $delta + 2 b$ to $delta$.
    Smooth Poincaré duality sends weight $w$ to $2 delta - w$,
    so ordinary cohomology has the same middle weight $delta$, or center $delta \/ 2$ in half weights.
    The relative product stratification proves the Hodge–Tate assertion on every fiber,
    including repeated eigenvalues, by the same componentwise argument and the affine-bundle Thom isomorphism.
  For integral local constancy, use the relative stratification and choose a small contractible analytic open set
    $U subset V$. A finite cover of $F times U$ is pulled back from a finite cover of $F$,
    since $pi_1 \( F times U \) = pi_1 \( F \)$. The same statement holds for the total space of a vector bundle
    over $F times U$, which is homotopy equivalent to its base.
    Topologically the bundle may be identified, in the $U$ direction,
    with the pullback of its restriction over one point. Equivalently,
    one may use the integral Thom isomorphism for its complex orientation.
    It follows that the compact-support cohomology sheaves of each covered stratum are locally constant finitely
    generated abelian groups on $U$. Localization triangles pass this conclusion through the finite
    stratification: kernels, cokernels, and extensions of locally constant sheaves are locally constant.
    The auxiliary affine-bundle trace removes its shift.
  Write $f$ for the covered smooth family of relative dimension $delta$.
    The complex $K = R f_(!) bb(Z)$ is locally perfect: its cohomology is bounded and finitely generated,
    and $bb(Z)$ has finite global dimension. Smooth Verdier duality gives
  $ R f_(*) bb(Z) tilde.eq R cal(H) o m \( K \, bb(Z)_V \) \[ - 2 delta \] . $
  The right side is locally constant and perfect, so taking its stalk commutes with this duality.
    Compact-support base change and the fiberwise cup–trace pairing identify its stalk with $R
    Gamma \( f^(- 1) \( t \) \, bb(Z) \)$. This identification is precisely the natural ordinary base-change
    morphism: both are adjoint to the cup product followed by the smooth orientation trace,
    whose formation commutes with compact-support base change.
    This proves the ordinary assertion, without using a nonproper smooth base-change principle.
    Finally, write $p : Y^(upright(B)) times D_1 arrow.r Y^(upright(B))$ for the projection and $s$ for its
    section at the identity of $D_1$. For ordinary direct images, $s^(*) p^(*) =
    upright("id")$ gives the required summand. For compact supports use the Gysin map of the closed section,
    followed by integration over $D_1$: these maps have degrees $4 g$ and $- 4 g$ and compose to the identity.
    Equivalently, the integral compact-support Künneth complex of $D_1$ has its top class as a split summand.
    Thus both local-constancy assertions pass to $Y^(upright(B))$,
    and natural ordinary base change passes through the first splitting.
    The ordinary splitting is algebraic on each fiber, so it also proves the asserted Hodge–Tate property for
    $Y^(upright(B))$. ◻
]

=== 3.3 The scalar summand and the determinant factor <the-scalar-summand-and-the-determinant-factor>

We have now obtained Lefschetz on a regular-semisimple fiber of the cover and cohomological local constancy over
  the entire ordered base. We next pass to $q$ and then remove the flag and determinant factors.

For a smooth algebraic family whose ordinary direct images are lisse (that is,
  have locally constant cohomology sheaves) and satisfy fiberwise base change,
  mixed Hodge module direct image gives admissible graded-polarizable variations of mixed Hodge structure on these
  local systems. In particular, parallel transport preserves the weight filtration;
  cup products are parallel as well. The construction and its diagram version are given in Proposition 10.
  Apply this fact to the family in Lemma 9. Along a path in the connected space $V$,
  transport a Lefschetz class from a distinct-eigenvalue fiber to $q$. We obtain

$ omega in "Gr"_4^W H^2 \( hat(Y)_q^(upright(B)) \, bb(C) \) $

with Lefschetz center $R + b + g$. A choice of path suffices;
  no assertion that this class is invariant under all monodromy is needed.

Take the product of the correspondence in Lemma 8 with $D_1$, writing $hat(X)^(upright(B)) = X^(upright(B)) times
  D_1$ and $hat(Z)^(upright(B)) = Z^(upright(B)) times D_1$.
  The flag bundle has rational algebraic Leray–Hirsch classes.
  More explicitly, the ratios of the ordered graded lines descend for the universal projective bundle,
  and their first Chern classes restrict to generators of the flag cohomology over $bb(Q)$.
  Indeed, differences of Chern roots generate rationally because the sum of the roots vanishes on the flag fiber.
  Polynomial representatives of a fiber basis therefore give the required global classes.
  The additional degree-two classes have weight two. Consequently

$ pi^(*) : "Gr"_4^W H^2 \( hat(X)^(upright(B)) \, bb(C) \) arrow.r^(med tilde.op med) "Gr"_4^W
  H^2 \( hat(Z)^(upright(B)) \, bb(C) \) . $

There is a unique class $xi$ in the space on the left such that $iota^(*) omega = pi^(*) xi$ on the weight-graded.

By the projection formula, $sans(A)$ and $sans(B)$ intertwine multiplication by $omega$ and $xi$ on
  weight-gradeds. Their actual weight shifts are $- 2 b$ and $2 b$.
  Equation (3.1) exhibits the image of $sans(B)$ as a graded stable summand, with stable complement $ker sans(A)$.
  Each Lefschetz isomorphism for $omega$ is block diagonal for this decomposition and thus restricts to an
  isomorphism on the summand. The half-weight shift of $sans(B)$ is $b$, so $xi$ has center $R +
  g$ on $H^(*) \( hat(X)^(upright(B)) \, bb(C) \)$. This correspondence also makes its cohomology a summand of a
  Tate twist of the Hodge–Tate cohomology upstairs, hence Hodge–Tate.

It remains to remove $D_1$. By Lemma 3 and the given nonabelian-Hodge diffeomorphism, $H^0 \( X^(upright(B)) \) =
  bb(Q)$ and $H^1 \( X^(upright(B)) \) = 0$. Künneth therefore gives

$ xi = xi_X + xi_D \, wide xi_X in "Gr"_4^W H^2 \( X^(upright(B)) \, bb(C) \) \, quad xi_D in H^2 \( D_1 \, bb(C) \) . $

The tensor-factor Lefschetz lemma, Lemma 6, shows that each factor has a common Lefschetz center and that the two
  centers add to $R + g$. The cohomology of $D_1$ is an exterior algebra on $2
  g$ generators of cohomological degree one and weight two.
  Its smallest and largest half-weight grades are $0$ and $2 g$, so its center is $g$. Thus $xi_X$ has center $R$.
  Projection and a section also show that $X^(upright(B))$ itself has Hodge–Tate cohomology.

Since $H^0 \( X^(upright(B)) \) eq.not 0$ and $R > 0$, this Lefschetz operator $xi_X$ is nonzero.
  Lemma 3 gives $H^2 \( X^(upright(B)) \, bb(Q) \) = bb(Q) e$ as a vector space,
  so the image of $e$ in $"Gr"_4^W$ is nonzero and is a nonzero scalar multiple of $xi_X$.
  Here $e in W_4 H^2$ because $X^(upright(B))$ is smooth. Rescaling a Lefschetz operator preserves all its
  isomorphisms. They hold over $bb(Q)$, since the rational maps in question become isomorphisms over $bb(C)$.
  This proves Theorem 7. No step took invariants under the finite group $Gamma$.

== 4 Weights for flat bundles of algebraic families <sec:diagram>

Consider first a product $S times X^(upright(B))$, with $S$ a closed oriented smooth surface.
  The moving-point construction in the proof overview requires integration over $S$ to lower cohomological degree
  by two while preserving weights. On this product, give the Künneth factor $H^a \( S \, bb(Q) \)$ pure weight
  zero and Hodge type $\( 0 \, 0 \)$ in every degree, and retain Deligne’s mixed Hodge structure on
  $H^(*) \( X^(upright(B)) \, bb(Q) \)$. Integration over $S$ then acts on the first factor without a Tate twist.
  Even when $S$ is an algebraic curve, this convention differs from its ordinary Deligne weights.

The moving-puncture flag spaces need not be products. We therefore extend this convention to bundles whose
  transition maps are locally constant algebraic automorphisms of a fiber family.
  A finite diagram of algebraic fibers will give the mixed Hodge structures together with their compatibility with
  parallel transport and proper Gysin maps. Section 5 will construct the required bundles and identify the scalar
  unflagged bundle as an actual flat product. The simplicial mixed-Hodge formalism goes back to Deligne
  #cite(label("Deligne1974")) Section 8.3; Shende uses weight-zero simplicial cochains to compute weights of
  tautological classes on character varieties #cite(label("Shende2017")) proof of the main Theorem.
  Here we supply the relative construction and the Gysin compatibility needed for the moving-point correspondence.

=== 4.1 The finite diagram <the-finite-diagram>

Let $V$ be a smooth connected complex algebraic variety and let $p : H arrow.r
  V$ be an algebraic morphism of finite type. We assume that $R p_(*) bb(Z)_H$ has bounded, locally constant,
  finitely generated cohomology sheaves and that its natural ordinary base-change maps

#[#set math.equation(numbering: n => "(4.1)")
 $ i_t^(*) R p_(*) bb(Z)_H arrow.r R Gamma \( H_t \, bb(Z) \) $ <diag:basechange>]

are isomorphisms for all $t in V$, where $i_t : { t } arrow.r.hook V$.
  These are hypotheses about ordinary direct image; smoothness alone would not imply them for a nonproper morphism.

Let $S$ be a compact smooth manifold. A #emph[flat bundle of the family $H arrow.r
  V$ over $S$] means a space $cal(H)$ with a map to $S times V$ and local identifications

$ cal(H) \|_(U_i times V) tilde.eq U_i times H $

whose transition maps have the form $\( s \, h \) mapsto \( s \, g_(i j) \( h \) \)$,
  with $g_(i j)$ an algebraic automorphism over $V$, locally constant in $s$.
  The maps $g_(i j)$ satisfy the cocycle identity. Write $cal(H)_t$ for the total space over $S$ at $t in V$.
  Thus $cal(H)_t$ includes the parameter space $S$; it need not be an algebraic variety.

A map of flat bundles will mean one which, in simultaneous flat trivializations,
  is the identity on $S$ times an algebraic map of the fiber families.

Choose a finite good cover $cal(U) = { U_i }$ refining a flat trivializing cover.
  Every nonempty intersection $U_I = ⋂_(i in I) U_i$ is contractible. Choose a trivialization on each $U_I$.
  Inclusion of intersections then gives a finite diagram of copies $p_I : H_I arrow.r
  V$ and algebraic isomorphisms over $V$. The cocycle identity makes this a diagram of maps of varieties,
  before passing to cohomology. Its index category is the poset of nonempty intersections,
  ordered in the direction of cohomological restriction.

We use the enhanced bounded derived category of mixed Hodge modules,
  whose six operations and rational realization are compatible with diagrams #cite(label("TubachStacks2025"))
  Section 2.1, Theorem 2.1.1, Remark 2.1.2, and Proposition 4.2.6.
  For an algebraic variety $T$, let $bb(Q)_T^H$ denote the constant mixed-Hodge-module complex with underlying
  complex $bb(Q)_T$, without a dimension shift. Define

#[#set math.equation(numbering: n => "(4.2)")
 $ K_(cal(H)) = upright("holim")_I R p_(I *) bb(Q)_(H_I)^H quad
   upright("in ") D^b upright("MHM") \( V \) . $ <diag:complex>]

Here the homotopy limit means the derived limit, retaining the transition maps and their compatibilities.
  The index poset has a finite-dimensional nerve, so this is a finite limit and remains bounded.
  In particular, (4.2) uses the full derived diagram, not only the cohomology groups of its terms.

#thm([Proposition 4.1.])[
  (Diagram weights).  #emph[Under the preceding hypotheses,
    $H^j \( cal(H)_t \, bb(Q) \)$ carries a graded-polarizable mixed Hodge structure,
    functorial for maps of flat bundles that are algebraic in flat trivializations.
    As $t$ varies, these structures form an admissible graded-polarizable variation of mixed Hodge structures,
    with an integral underlying local system up to torsion. They are computed by $H^j \( i_t^(*) K_(cal(H)) \)$.]
  #emph[If $H^j \( H_t \, bb(Q) \)$ is Hodge–Tate for every $j$ and $t$,
    then $H^j \( cal(H)_t \, bb(Q) \)$ is Hodge–Tate as well.
    We call its weight filtration the #emph[diagram weight filtration].]
] <diag:variation>

#proof[
  First we identify the underlying ordinary complex. Open-cover descent computes the ordinary direct image of
    $cal(H) arrow.r V$ from the spaces $U_I times H_I$. Projection to $H_I$ induces a quasi-isomorphism on direct
    images over $V$: over any open subset of $V$, its fiber in this product is the contractible space $U_I$.
    These projections commute with the transition maps. Their derived limit therefore identifies the rational
    realization of $K_(cal(H))$ with the ordinary direct image of $cal(H) arrow.r V$.
    The same argument works with integral coefficients.
  A finite limit of bounded complexes with locally constant cohomology again has locally constant cohomology.
    Its integral cohomology sheaves have finite type. Point pullback commutes with finite limits,
    and the termwise base-change maps are isomorphisms by (4.1).
    The corresponding maps in mixed Hodge modules are isomorphisms because rational realization is conservative.
    It follows that $i_t^(*) K_(cal(H))$ computes the derived diagram of the algebraic fibers $H_(I \, t)$ and
    that its underlying cohomology is $H^(*) \( cal(H)_t \, bb(Q) \)$.
  Put $v = dim V$. Since the ordinary cohomology sheaves of $K_(cal(H))$ are locally constant,
    its perverse cohomology $zws^p H^(j + v) \( K_(cal(H)) \)$ is a smooth mixed Hodge module.
    Smooth mixed Hodge modules, after the dimension shift, are admissible graded-polarizable variations
    #cite(label("SaitoExtension1990")) Section 3.2, Equation (3.2.1).
    Applying point pullback to the perverse truncations shows that the fiber of this variation is
    $H^j \( i_t^(*) K_(cal(H)) \)$: a smooth perverse object has only one nonzero fiber degree, namely $- v$.
  Finally, mixed Hodge structures whose weight gradeds have only Hodge types $\( r \, r \)$ are closed under
    subobjects, quotients, and extensions. The long exact sequence of a cone thus shows that complexes with
    Hodge–Tate cohomology are closed under finite limits. Applying this observation to the fiber diagram proves
    the last assertion. Algebraic maps of the diagrams give the stated functoriality.
    A common good refinement compares different choices of cover and trivializations:
    its comparison maps are isomorphisms after ordinary descent, hence also in mixed Hodge modules by conservativity. ◻
]

The construction also preserves the cup product. Each algebraic direct image of the constant complex has its
  functorial cup product, and the transition pullbacks preserve it. The derived limit inherits this product.
  Under the open-cover comparison in the proof of Proposition 10,
  it is the ordinary cup product on $H^(*) \( cal(H)_t \, bb(Q) \)$.
  Thus parallel transport in $V$ preserves both the cohomology ring and its weight filtration.

=== 4.2 Products and proper Gysin maps <products-and-proper-gysin-maps>

We next identify the maps that preserve these weights.

#thm([Proposition 4.2.])[
  (Weight shifts).  #emph[The diagram weight filtrations have the following properties.]
  + #emph[For the product $S times M$, with $M$ a complex algebraic variety,
    the ordinary Künneth isomorphism identifies its mixed Hodge structure with that on
$ H^(*) \( S \, bb(Q) \) ⊗ H^(*) \( M \, bb(Q) \) \, $

 where every $H^a \( S \, bb(Q) \)$ is pure of weight zero and type $\( 0 \, 0 \)$,
   and $H^(*) \( M \, bb(Q) \)$ has its Deligne mixed Hodge structure.
   If $S$ is oriented and closed of real dimension $d_S$, projection pullback and integration over $S$ preserve
   weight; the latter has cohomological degree $- d_S$.]
  + #emph[Pullbacks by maps of flat bundles preserve weight.]
  + #emph[Suppose $u : cal(H)_t arrow.r cal(H)'_t$ is a proper map of flat bundles with smooth equidimensional
    algebraic fibers. Put $c = dim_(bb(C)) H'_t - dim_(bb(C)) H_t$.
    With the complex orientations on the fibers, its ordinary Gysin map satisfies
$ u_(*) : W_a H^j \( cal(H)_t \) arrow.r W_(a + 2 c) H^(j + 2 c) \( cal(H)'_t \) . $

 If $S$ is oriented, this is the Gysin map for the induced orientations on the total spaces.]
] <diag:gysin>

#proof[
  For a product, the diagram is constant. Its derived limit is
  $ C^(*) \( N cal(U) \, bb(Q) \( 0 \) \) ⊗ R Gamma \( M \, bb(Q)_M^H \) \, $
  where $N cal(U)$ is the finite nerve of the good cover. The first complex has a copy of $bb(Q) \( 0 \)$ for each
    simplex, with its ordinary simplicial differential. All its cohomology therefore has weight zero.
    The external-product comparison on the cover gives exactly the ordinary Künneth map.
    Evaluation on a simplicial fundamental cycle defines
  $ C^(*) \( N cal(U) \, bb(Q) \( 0 \) \) arrow.r bb(Q) \( 0 \) \[ - d_S \] . $
  This is a morphism of complexes of mixed Hodge structures and realizes ordinary integration over $S$.
    It has no Tate twist. Projection pullback is induced by the unit of the same cochain complex.
    This proves the first assertion; functoriality of algebraic pullbacks proves the second.
  For the third assertion, fix $t$ and choose simultaneous trivializations of the map.
    On each algebraic fiber map $u_(I \, t) : H_(I \, t) arrow.r H'_(I \, t)$,
    smooth dualizing complexes and the proper counit give the Gysin morphism
  #[#set math.equation(numbering: n => "(4.3)")
   $ R u_(I \, t *) bb(Q)_(H_(I \, t))^H arrow.r bb(Q)_(H'_(I \, t))^H \[ 2 c \] \( c \) . $ <diag:trace>]
  Its degree and Tate twist give the displayed weight shift.
    Complex orientations are preserved by the algebraic transition isomorphisms, and the proper counit is natural.
    Consequently (4.3) gives a coherent map of the finite diagrams and hence of their derived limits.
  It remains to identify its ordinary realization. On $U_I times
    H_(I \, t)$ the map is the identity on $U_I$ times $u_(I \, t)$.
    The orientation trace for this product is the fiber trace, tensored with the identity on $U_I$.
    It is compatible with restriction to intersections and with the transition isomorphisms.
    Open-cover descent therefore identifies the realized map with the ordinary topological Gysin map of the total
    spaces. In particular, the construction gives the actual Gysin map,
    not merely a map with the same source and target. ◻
]

=== 4.3 Finite monodromy on weight gradeds <finite-monodromy-on-weight-gradeds>

The diagram construction has now supplied a variation on the cohomology of the total spaces.
  Hodge–Tate fibers and the integral structure put a strong restriction on its monodromy.

#thm([Lemma 4.3.])[
  #emph[Assume the Hodge–Tate hypothesis of Proposition 10.
    The combined monodromy action on all $"Gr"_a^W H^j \( cal(H)_t \, bb(Q) \)$ has finite image.
    For any loop with cohomology monodromy $T$, there is an integer $M > 0$ such that $T^M$ is unipotent and
#[#set math.equation(numbering: n => "(4.4)")
 $ N = 1 / M log \( T^M \) quad upright("satisfies") quad N \( W_a \) subset W_(a - 2) . $ <diag:log>]

 The logarithm is a finite polynomial. On the total cohomology ring, $N$ is a derivation of cohomological degree zero.]
] <diag:finite>

#proof[
  Each nonzero weight graded is a polarizable variation of pure type $\( r \, r \)$ and weight $2 r$.
    After the conventional sign, its flat polarization is positive definite on the underlying real vector space.
    Let $cal(L)$ be the torsion-free quotient of the integral cohomology local system.
    Intersecting $cal(L)$ with the rational weight sub-local systems and taking successive quotients gives an
    invariant full lattice in each rational graded piece. These intersections are saturated because the subspaces
    are rational.
  The automorphisms of a lattice preserving a positive definite form constitute a finite group:
    in a fixed lattice basis, every column of such an automorphism has a prescribed bounded norm and hence lies in
    a finite set. Thus each graded monodromy image is finite.
    Only finitely many cohomological degrees and weights occur, which proves the combined assertion.
  Choose $M$ killing the action of the specified loop on all weight gradeds. Then
  $ \( T^M - 1 \) W_a subset W_(a - 1) = W_(a - 2) $
  whenever $a$ is even; the identical conclusion for odd $a$ follows because successive odd and even steps
    coincide. The operator $T^M - 1$ is nilpotent, since the weight filtration is finite.
    Its finite logarithm has the same lowering bound.
  Parallel transport preserves cup products. For every integer $k gt.eq 0$,
    the polynomial operator $exp \( k M N \) = T^(M k)$ is therefore a ring automorphism.
    For cohomology classes $alpha \, beta$, the identity
  $ exp \( k M N \) \( alpha beta \) = exp \( k M N \) \( alpha \) exp \( k M N \) \( beta \) $
  is an equality of polynomials in $k$. Comparing linear coefficients proves $N \( alpha beta \) =
    N \( alpha \) beta + alpha N \( beta \)$. Monodromy preserves cohomological degree, so $N$ does as well. ◻
]

To apply these results, we will verify locally constant algebraic transition maps for the family with a moving
  marked point, together with simultaneous such transitions for its flag correspondence.
  We will also identify the scalar unflagged bundle as a flat product.
  Once those inputs are established, Proposition 11 controls its push-pull maps,
  and Lemma 12 supplies the weight-lowering logarithm on the same ordinary cohomology groups.

== 5 Moving logarithmic poles and cohomology comparisons <sec:logarithmic>

We now construct a single family through which the Higgs and Betti correspondences can be compared.
  The point carrying the full flag must move over a compact curve.
  Its motion changes the determinant, so the first step is to compensate for that change by a line bundle.
  The resulting comparison will apply to the whole fixed-determinant cohomology.

=== 5.1 The determinant correction and the scalar correspondence <the-determinant-correction-and-the-scalar-correspondence>

Choose a point $x_0 in C$. For the construction we first take $L = cal(O)_C \( d x_0 \)$;
  we return to an arbitrary determinant at the end of this section.
  The line bundle $cal(O)_C \( d x \)$ has a canonical logarithmic connection $d_(d x)$:
  its canonical meromorphic section is horizontal. Its residue at $x$ is $- d$.
  Multiplying a connection by $lambda$ produces a $lambda$-connection, whose Leibniz rule is $D \( f s \) =
  lambda thin d f ⊗ s + f D \( s \)$.

Pull back the finite #emph[étale] map $\[ n \] : "Pic"^0 \( C \) arrow.r "Pic"^0 \( C \)$ by

$ C arrow.r "Pic"^0 \( C \) \, wide x mapsto cal(O)_C \( d x - d x_0 \) \, $

and choose a connected component $S$ of this pullback. Then $S$ is a smooth projective connected curve,
  and its map $x : S arrow.r C$ is finite #emph[étale] and surjective.
  Write $Delta subset C times S$ for the graph of $x$. A Poincaré bundle gives a line bundle $J$ on $C times
  S$ such that

#[#set math.equation(numbering: n => "(5.1)")
 $ J^(⊗ n) tilde.eq cal(O)_(C times S) #scale(x: 120%, y: 120%)[\(] d Delta -
   d \( x_0 times S \) #scale(x: 120%, y: 120%)[\)] ⊗ "pr"_S^(*) B $ <log:root>]

for some line bundle $B$ on $S$. The possible base factor is the only ambiguity in this equality of families.

A line pulled back from $S$ has a canonical relative connection along $C$.
  Equip the right side of (5.1) with the relative logarithmic connection given by its canonical meromorphic
  section and this connection on the base factor. Dividing its local connection forms by $n$ defines a unique
  compatible connection on $J$. This division glues: the transition equation for $J^(⊗ n)$ is $n$ times the
  equation for $J$. Let $D_(J \, lambda)$ be the resulting relative $lambda$-connection.
  Its residues are $- lambda d \/ n$ along $Delta$ and $+ lambda d \/ n$ along $x_0 times S$.

Put

$ frak(t)_0 = { \( u_1 \, dots.h \, u_n \) in bb(A)^n : sum_i u_i = 0 } \, wide Lambda = bb(A)_lambda^1 times
  frak(t)_0 . $

Let $cal(X) arrow.r bb(A)_lambda^1$ parametrize stable logarithmic $lambda$-connections on rank-$n$ bundles,
  with determinant $\( cal(O)_C \( d x_0 \) \, lambda d_(d x_0) \)$ and residue $-
  lambda \( d \/ n \) I$ at $x_0$. Stability here and below is slope stability for subbundles preserved by the
  operator. At $lambda = 0$ the scalar residue is zero, so the fiber $X_0$ is the ordinary trace-free Higgs moduli
  space $X$.

Let $cal(Y) arrow.r S times Lambda$ parametrize the following data:

- a stable logarithmic $lambda$-connection $\( E \, D \)$ with its only possible pole at $x \( s \)$ and
  determinant $\( cal(O)_C \( d x \( s \) \) \, lambda d_(d x \( s \)) \)$;
- a full flag of $E_(x \( s \))$, preserved by the residue,
  on whose ordered graded lines $Q_i$ the residue acts by $- lambda d \/ n + u_i$.

The flag does not enter the stability condition. We write $Y_(lambda \, u)$ for the fiber over $\( lambda \, u \)
  in Lambda$, #emph[retaining all of $S$]. Thus $Y_(lambda \, u)$ is itself a family over the moving-point curve.

At $u = 0$, let $cal(Z)$ be the closed locus where the residue is scalar,
  and let $cal(O)$ be the same scalar-residue family with the flag forgotten.
  The correspondence over $bb(A)_lambda^1$ is shown fiberwise in Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$X_lambda$])
  content((2.717, 0), [$O_lambda tilde.eq S times X_lambda$])
  content((5.435, 0), [$Z_lambda$])
  content((7.822, 0), [$Y_(lambda \, 0)$])
  line((1.787, 0), (0.402, 0), mark: (end: ">"))
  content((1.095, 0.2266), [#text(size: 0.73em)[$"pr"$]])
  line((5.033, 0), (3.647, 0), mark: (end: ">"))
  content((4.34, 0.2266), [#text(size: 0.73em)[$pi$]])
  line((5.837, 0), (7.222, 0), mark: (end: ">"))
  line((5.837, 0), (5.837, 0.3))
  content((6.53, 0.2266), [#text(size: 0.73em)[$iota$]])
})],
  caption: [Figure 1: The scalar correspondence. All moving-pole spaces retain the curve $S$; $"pr"$ has fiber $S$, $pi$ is a flag projection of relative dimension $b$, and $iota$ has codimension $b$. The residue on $Y_(lambda \, 0)$ may have a strictly flag-lowering nilpotent part in addition to its prescribed scalar part; $Z_lambda$ requires that nilpotent part to vanish. The derived morphisms and their cohomological and diagram-weight shifts are recorded in Table 1. ],
) <log:scalar-correspondence>

Here $pi$ forgets the flag and $iota$ is the scalar-residue inclusion.
  The first map comes from the following product identification.

#thm([Lemma 5.1.])[
  #emph[Tensoring by $\( J \, D_(J \, lambda) \)$ gives an algebraic isomorphism $cal(O) tilde.eq S times
    cal(X)$ over $S times bb(A)^1$. At $lambda = 0$ it preserves the ordinary Hitchin coefficients.]
] <log:scalar-product>

#proof[
  By (5.1), tensoring fixed-pole data by $J$ changes its determinant to $cal(O)_C \( d x \( s \) \)$,
    up to a base line, and changes its determinant operator to the prescribed one.
    At $x_0$, the residue $+ lambda d \/ n$ of $J$ cancels the residue $-
    lambda d \/ n$ of the original rank-$n$ connection.
  This cancellation also holds where the moving and fixed sections meet.
    In a coordinate $z$ with moving section $z = a \( s \)$, the scalar polar part contributed by $J$ is
  $ - frac(lambda d, n) frac(d z, z - a \( s \)) + frac(lambda d, n) frac(d z, z) . $
  Adding the fixed-pole form leaves only the first term. The identity is an identity of relative meromorphic forms
    over the whole local base, including $a \( s \) = 0$. Thus the tensor product has a single logarithmic pole at
    the moving point. The inverse construction tensors by $J^(- 1)$.
  Base-line twists do not change the induced map to coarse moduli, and $deg J_s = 0$ preserves stability.
    When $lambda = 0$, the Higgs field of $J$ is zero, so the characteristic polynomial is unchanged. ◻
]

The relative quasiprojective moduli of logarithmic $lambda$-connections exist by the standard construction;
  we use the formulation in #cite(label("dCFHLogHodge")) Section 2.2.
  Fixed determinant is obtained by taking the inverse image of its rank-one section.
  Adding a residue-invariant full flag is projective over the unflagged moduli;
  its ordered residue eigenvalues are then regular functions on the flag parameter space.
  The prescribed-residue equations are closed.

We will use universal bundles only #emph[étale] locally. Coprimality makes semistable pairs stable,
  with scalar automorphisms. Their stack is a scalar gerbe over its coarse space,
  or a $mu_n$-gerbe after choosing a determinant isomorphism;
  compare #cite(label("dCFHLogHodge")) Lemma 5.3 and Remark 5.4.
  The universal projective bundle, $"End" E$, and the line ratios $Q_i ⊗
  Q_j^(- 1)$ have trivial scalar action and descend. Individual $Q_i$ need not descend,
  and no construction below requires them to do so.

=== 5.2 Smooth families and actual restriction isomorphisms <smooth-families-and-actual-restriction-isomorphisms>

Our next objective is to identify the cohomology of all fibers by restriction from the total space.
  Smoothness alone would not suffice, because these moduli spaces are not proper.
  The scaling action supplies the additional compactness property that is needed.

#thm([Proposition 5.2.])[
  #emph[The morphism $cal(Y) arrow.r S times Lambda$ is smooth of relative dimension $2 R + 2 b$,
    and $cal(X) arrow.r bb(A)^1$ is smooth of relative dimension $2 R$.
    Their total spaces are semiprojective for scaling the operators,
    which scales $lambda$ and every $u_i$ with weight one. The same holds for the inverse image in $cal(Y)$ of
    every linear subspace of $Lambda$ through zero. In Figure 1,
    $pi$ is a smooth proper flag projection of relative dimension $b$,
    and $iota$ is a regular embedding of codimension $b$ with normal bundle $T_pi^(*)$.]
] <log:families>

#proof[
  We first establish zero limits for scaling. Given an unflagged object,
    keep its bundle fixed and scale its operator. This extends the orbit to the stack of all logarithmic
    $lambda$-connections, without imposing semistability on the special fiber.
    Semistable reduction #cite(label("FHZ2025")) Proposition 4.48 replaces this DVR family by a semistable one
    after a finite extension, without changing its generic fiber.
    Its hypotheses hold for $upright("GL")_n$ over $bb(C)$.
  The determinant of the replacement and the prescribed determinant agree generically,
    hence agree over the DVR by separatedness of the rank-one moduli space.
    A generic flag extends because the flag variety of the extended bundle at the pole is proper.
    Residue preservation and the #emph[ordered] diagonal residue equations are closed,
    and therefore persist at the special fiber. Coprimality makes the limiting semistable pair stable.
    The same reasoning applies to the scalar-residue condition.
  A finite extension of the DVR is enough for a limit in the original coarse space.
    Indeed, embed this quasiprojective space in projective space as a locally closed subvariety.
    The original orbit has a unique projective limit. The limit after finite base change is that point and belongs
    to the coarse moduli space, so the original orbit extends there. This proves the required zero-limit property.
  We next check smoothness over $lambda = u = 0$. At such a point put
  $ cal(F) = "ParEnd"_0 \( E \) \, wide cal(G) = cal(F)^or ⊗ K_C \, $
  where $cal(F)$ is the sheaf of trace-free endomorphisms preserving the flag at $x \( s \)$.
    Trace pairing identifies $cal(G)$ with the trace-free logarithmic Higgs fields having strictly flag-lowering
    residue. The relative deformation complex is
  #[#set math.equation(numbering: n => "(5.2)")
   $ cal(F) arrow.r^(\[ theta \, - \]) cal(G) . $ <log:deformation>]
  Here is the lifting argument, including the parameter directions.
    For a small Artin extension with prescribed lifts of $s \, lambda \, u$, the bundle,
    determinant isomorphism and flag lift because the obstruction lies in $H^2 \( C \, cal(F) \) = 0$.
    In local frames respecting the lifted flag, the operator lifts with its prescribed determinant and diagonal
    residues: these are affine-linear conditions, and trace splits in characteristic zero.
    Its gluing obstruction lies in $H^1 \( C \, cal(G) \)$ tensored with the square-zero ideal.
    Changing the bundle and flag gluing changes this obstruction by the image of $H^1 \( C \, cal(F) \)$ under (5.2).
  This map on $H^1$ is surjective. Its Serre dual is, up to sign, the map on $H^0$ in (5.2);
    its kernel consists of trace-free automorphisms of the stable Higgs pair preserving the flag, hence is zero.
    Thus every such lifting problem has a solution. Since
  $ chi \( cal(F) \) = - \( n^2 - 1 \) \( g - 1 \) - b = - R - b \, $
  the relative tangent dimension is $- 2 chi \( cal(F) \) = 2 R + 2 b$.
    For the scalar unflagged family, replace $cal(F)$ by $"End"_0 \( E \)$ and obtain dimension $2
    R$ in the same way. Finite scalar stabilizers act trivially on these deformations,
    so the calculation also proves smoothness of the coarse spaces.
  The nonsmooth locus of the morphism is closed and scaling invariant.
    If it contained a point, it would contain that point’s zero limit,
    contradicting the calculation over $lambda = u = 0$. This proves smoothness everywhere.
  A scaling-fixed point has $lambda = u = 0$. Its logarithmic Hitchin coefficients vanish,
    because their scaling weights are positive. The logarithmic Hitchin map is proper;
    its base has coefficients in $H^0 \( C \, K_C \( x \( s \) \)^(⊗ i) \)$ as in #cite(label("dCFHLogHodge"))
    Section 2.4, Equation (4). The fixed locus is closed in its nilpotent fiber after adding flags and imposing
    determinant and residue conditions. Since flags and $S$ are proper, that fixed locus is proper.
    Together with the zero limits, this proves semiprojectivity.
    The inverse image of a linear subspace through zero is smooth by base change and inherits both properties.
  Finally $pi$ is the full flag bundle of the universal projective bundle.
    On the $u = 0$ family, subtracting the prescribed scalar from the residue gives a section of the bundle of
    strictly flag-lowering matrices. Its zero scheme is $cal(Z)$.
    The smoothness and dimensions just proved show that it is a regular zero scheme of codimension $b$.
    Trace pairing identifies this residue bundle along $cal(Z)$ with the cotangent bundle of the flag fibers,
    giving $N_iota tilde.eq T_pi^(*)$. ◻
]

#thm([Corollary 5.3.])[
  #emph[For every $\( lambda \, u \) in Lambda$, restriction induces an isomorphism
#[#set math.equation(numbering: n => "(5.3)")
 $ rho_(lambda \, u) : H^(*) \( cal(Y) \, bb(Q) \) arrow.r^(med tilde.op med)
   H^(*) \( Y_(lambda \, u) \, bb(Q) \) . $ <log:rho>]

 Restriction to the inverse image of any line through zero in $Lambda$ is also an isomorphism,
   as is restriction from that inverse image to any of its fibers.
   The analogous restriction isomorphisms hold for all four families in Figure 1 over the $lambda$-line.
   They commute with pullbacks and with the proper Gysin maps in that correspondence,
   including integration in the $S$ factor.]
] <log:restriction>

#proof[
  Recall that the core of a smooth semiprojective variety is the union of the sets whose scaling orbits have
    limits as the parameter tends to infinity. Its inclusion induces a cohomology isomorphism
    #cite(label("HRV2015")) Theorem 1.3.1. Because every coordinate on $Lambda$ has positive weight,
    a point of $cal(Y)$ with such a limit must lie over zero.
    Hence $cal(Y)$ and its inverse image $cal(Y)_ell$ of any line $ell$ through zero have the same core.
    Their restrictions to the core commute, so $H^(*) \( cal(Y) \) arrow.r H^(*) \( cal(Y)_ell \)$ is an isomorphism.
  The map $cal(Y)_ell arrow.r ell$ is smooth and surjective.
    For surjectivity, its image is a scaling-invariant open subset containing zero,
    and therefore contains the whole affine line. Apply #cite(label("HRV2015")) Corollary 1.3.3:
    for a smooth surjection from a smooth semiprojective variety to the affine line,
    equivariant for a positive base weight, restriction to each fiber is an isomorphism.
    This proves (5.3) and its line version. The same proof applies to $cal(X)$, $cal(O)$ and $cal(Z)$.
  Pullback compatibility is functorial. For Gysin maps, the families are smooth over the line,
    the scalar embedding is transverse to fiber restriction, and the flag and product projections are smooth
    proper. The transverse base-change identities for Gysin maps give the claimed compatibilities. ◻
]

=== 5.3 Riemann–Hilbert with a moving puncture <riemannhilbert-with-a-moving-puncture>

Let $V$, $q$ and $Y^(upright(B)) arrow.r V$ be the ordered eigenvalue family from Section 3.
  The exponent domain we need is

#[#set math.equation(numbering: n => "(5.4)")
 $ U = {u in frak(t)_0^(upright("an")) : t \( u \) = #scale(x: 120%, y: 120%)[\(] zeta e^(- 2 pi sqrt(- 1) u_i)
   #scale(x: 120%, y: 120%)[\)]_i in V \, quad u_i - u_j in.not bb(Z) \\ { 0 }} . $ <log:nonresonance>]

Notice that zero differences are allowed. In particular $0 in U$, which is essential for the scalar correspondence.

There is a flat bundle over $S$ with algebraic fiber family $Y^(upright(B)) arrow.r V$.
  To define it, use local trivializations of the punctured surfaces $C \\ {
  x \( s \) }$ and record a full flag of local subsystems near the puncture.
  We choose the peripheral-loop convention in which its monodromy is the product of commutators used to define
  $Y^(upright(B))$. Changes of surface markings act on the handle matrices by group words and on the peripheral
  flag by the corresponding conjugating word. They are algebraic maps over $V$.

These transition maps are locally constant and satisfy the cocycle condition as algebraic maps on the coarse
  spaces. To check this precisely, let $delta$ be the product of commutators in the free fundamental group of the
  punctured surface. A change of marking gives an outer automorphism represented by $phi$, with $phi \( delta \) =
  w delta w^(- 1)$. Word evaluation transforms a representation to $rho phi$ and its flag by $rho \( w \)$.
  Changing $phi$ by an inner automorphism gives simultaneous conjugation.
  Changing $w$ multiplies it on the right by an element centralizing $delta$.
  The cyclically reduced word $delta$ is not a proper power: each positive handle generator occurs just once.
  Its centralizer in the free group is therefore $chevron.l delta chevron.r$.
  Thus this last ambiguity is a power of peripheral monodromy and preserves every invariant flag,
  including those with repeated eigenvalues or nonsemisimple monodromy.
  The resulting maps compose strictly after passage to the geometric quotient.
  Consequently no choice of eigenlines or higher homotopy of transitions is needed.
  The scalar flag correspondence from Section 3 gives a corresponding diagram of flat bundles over $S$.

#thm([Proposition 5.4.])[
  #emph[Over $U$, Riemann–Hilbert identifies $Y_(1 \, u)$ with the total space over $S$ of this flat bundle at
    parameter $t \( u \)$. These identifications are homeomorphisms of families.
    At $u = 0$ they identify the scalar correspondence of Figure 1 at $lambda =
    1$ with the flat Betti scalar correspondence, compatibly with its pullbacks and Gysin maps.]
] <log:rh>

#proof[
  The local exponents of a connection are $r_i = - d \/ n + u_i$.
    For the regular-singular correspondence and logarithmic lattices,
    including Manin’s extension theorem and Katz’s nonresonance corollary,
    see Deligne #cite(label("Deligne1970")) II, Proposition 5.4, Remark 5.5(ii), Corollary 5.6, and Theorem 5.9.
    We spell out the nonresonant local construction to track the ordered flags and dependence on the moving
    parameters. In a disc coordinate $z$, write a logarithmic connection as $d + A \( z \) thin d z \/ z$,
    with $A \( 0 \) = A_0$. The regular-singular reduction to $d +
    A_0 thin d z \/ z$ by a gauge equal to the identity at zero is obtained recursively using the operators $k +
    "ad" \( A_0 \)$, $k gt.eq 1$. Their eigenvalues are $k + r_i - r_j$, so they are invertible under (5.4),
    even when $A_0$ has repeated eigenvalues or a nonzero nilpotent part.
    On a small parameter neighborhood their inverse norms are $O \( 1 \/ k \)$ for large $k$.
    The usual power-series majorant for the analytic coefficients therefore gives convergence on a common smaller
    disc and continuous dependence on parameters.
  In this constant-residue model a residue-invariant flag gives a monodromy-invariant flag.
    Conversely, the prescribed exponents select one logarithm for each monodromy eigenvalue:
    equal exponential values have equal selected exponents, by (5.4).
    Functional calculus on each generalized eigenspace then gives a logarithm of monodromy preserving its
    invariant flag. This constructs the inverse logarithmic extension with the specified ordered residues.
    Coordinate and logarithm changes in the constant-residue model act by functions of the residue,
    and hence preserve the flag; the construction is intrinsic.
    In rank one the same construction gives exactly $\( cal(O)_C \( d x \( s \) \) \, d_(d x \( s \)) \)$,
    so the determinant is the required one. The subproduct condition defining $V$ makes the representation
    irreducible, and thus ensures stability.
  Holonomy along local moving generators, together with this local normal form,
    makes the forward maps continuous in the bundle and in $s \, u$.
    Regard the Betti family as pulled back to $U$ via $t$; there is no assertion that $t$ is globally injective.
    The forward map is a continuous bijection between manifolds of equal real dimension,
    by Proposition 14 and the Betti smoothness. Invariance of domain gives its inverse continuity.
    For a fixed point of $S$ it is holomorphic on the moduli fibers, so it preserves their complex orientations.
  At $u = 0$, scalar residues correspond to scalar monodromy,
    and forgetting or retaining the flag commutes with this construction.
    The proper maps in the correspondence have their usual complex orientations in the algebraic fibers and the
    same orientation on $S$. Consequently their topological Gysin maps agree under these homeomorphisms. ◻
]

#thm([Lemma 5.5.])[
  #emph[The product identification in Lemma 13, at $lambda = 1$,
    identifies the scalar unflagged Betti family with $S times
    X^(upright(B))$ as a flat bundle with algebraic fiber. Its projection to $X^(upright(B))$ corresponds to $"pr"$.]
] <log:scalar-flat-product>

#proof[
  Away from the fixed and moving poles, the nth power of the connection on $J$ is the canonically trivial
    connection. Its holonomies therefore lie in $mu_n$. Locally in $S$,
    take a disc containing $x_0$ and the moving point, and choose the handle generators outside that disc.
    Their line holonomies depend continuously on $s$ and take values in the finite group $mu_n$,
    so are locally constant. Tensoring multiplies the handle matrices by these constant scalars,
    an algebraic map on the representation variety. The argument also applies in collision neighborhoods.
    Thus the algebraic product identification of the scalar connection family is compatible with the locally
    constant algebraic Betti transitions. ◻
]

We have now obtained the actual flat diagrams to which Section 4 will be applied.
  In particular, when that construction gives weight zero to the cochains of $S$,
  its product and integration statements concern the same projection $"pr"$ as the logarithmic correspondence.

=== 5.4 The nonabelian-Hodge comparison on full cohomology <the-nonabelian-hodge-comparison-on-full-cohomology>

The restriction isomorphisms for $cal(X)$ and Riemann–Hilbert give

#[#set math.equation(numbering: n => "(5.5)")
 $ H^(*) \( X^(upright(B)) \) arrow.r^(med tilde.op med) H^(*) \( X_1 \) arrow.l^(med tilde.op med)
   H^(*) \( cal(X) \) arrow.r^(med tilde.op med) H^(*) \( X \) . $ <log:comparison>]

We must check that this comparison transports the weight filtration specified by nonabelian Hodge theory,
  including its nontrivial $Gamma$-character summands. Agreement only after taking $Gamma$-invariants would not suffice.

#thm([Lemma 5.6.])[
  #emph[Let a finite group $G$ act algebraically on a smooth connected complex variety $B$, and let $q : B arrow.r
    B \/ G$ be the quotient. Suppose $g : A arrow.r B$ is a homeomorphism and $f : A arrow.r
    B$ is continuous with $q f = q g$. Then $f = gamma g$ for a single $gamma in G$.]
] <log:finite-ambiguity>

#proof[
  Divide out the kernel of the action. Smoothness and connectedness make $B$ irreducible.
    Removing the fixed loci of the nonidentity elements gives a dense connected Zariski open $B^compose$ on which
    the action is free. For $a in g^(- 1) \( B^compose \)$ there is a unique $gamma \( a \)$ with $f \( a \) =
    gamma \( a \) g \( a \)$. The free finite quotient is a covering there,
    so $gamma \( a \)$ is locally constant. It is constant because this open set is connected.
    Continuity extends the equality over its closure, which is all of $A$. ◻
]

#thm([Proposition 5.7.])[
  #emph[The comparison (5.5) transports the Deligne weight filtration on the whole
    $H^(*) \( X^(upright(B)) \, bb(Q) \)$ in the same way as the nonabelian-Hodge identification.
    The conclusion is unchanged when $cal(O)_C \( d x_0 \)$ is replaced by an arbitrary $L in
    "Pic"^d \( C \)$ and the Higgs spaces are identified by tensoring with a degree-zero nth root of their
    determinant ratio.]
] <log:nah>

#proof[
  The full fixed-determinant nonabelian-Hodge diffeomorphism, including its $Gamma$-equivariance,
    is part of the twisted construction in #cite(label("HT2003")) Sections 2 and 5.
    We compare its cohomology map with the particular logarithmic family above.
  For $\( E \, theta \) in X$, choose a harmonic metric $H$ normalized to a fixed metric on its determinant.
    Let $partial_H$ denote the $\( 1 \, 0 \)$ part of its Chern connection.
    For real $0 lt.eq tau lt.eq 1$ consider the holomorphic structure and logarithmic $tau$-operator
  #[#set math.equation(numbering: n => "(5.6)")
   $ macron(partial)_E + tau theta^(dagger_H) \, wide tau partial_H + theta + tau /
     n #scale(x: 120%, y: 120%)[\(] d_(d x_0)^(1 \, 0) - partial_(det H) #scale(x: 120%, y: 120%)[\)] I .
     $ <log:harmonic-path>]
  Its projectivization is the usual harmonic preferred section #cite(label("Simpson1997")) Section 4.
    We verify the scalar adjustment. The trace of $theta$ and of $theta^(dagger_H)$ is zero,
    so the determinant holomorphic structure stays fixed and the determinant operator is exactly $tau d_(d x_0)$.
    The trace-free holomorphicity equation follows from $macron(partial)_E theta = 0$,
    $partial_H theta^(dagger_H) = 0$ and the projective Hitchin equation.
    The scalar equation is that of the prescribed logarithmic determinant connection.
    The only nonregular term is the scalar logarithmic term at $x_0$.
  For $tau eq.not 0$, divide the operator by $tau$. Its puncture monodromy is $zeta I$.
    A proper invariant subspace of rank $r$ would have $zeta^r =
    1$ by taking determinants of the commutator relation, contrary to $gcd \( n \, d \) = 1$.
    Thus these connections are irreducible and stable. At $tau = 0$ we recover the original Higgs pair.
    Hence (5.6) lies in $cal(X)$ throughout.
  This construction is a continuous homotopy of maps $X arrow.r cal(X)$.
    One may work in local families of stable Higgs pairs. The normalized harmonic metrics vary smoothly:
    their trace-free metric linearization is self-adjoint elliptic,
    and its kernel consists of infinitesimal symmetries, which stability kills.
    This is also the parameter dependence used for preferred sections in #cite(label("Simpson1997")) Section 4.
    To pass to the analytic topology of coarse moduli, choose a sufficiently positive twist near any one parameter
    so the underlying bundles are generated and have vanishing $H^1$.
    The kernels of the corresponding Dolbeault operators then give continuously varying bases of sections.
    Their evaluations give continuous quotient presentations; the logarithmic operators,
    viewed as morphisms from the first jet bundle with fixed symbol,
    also have continuous coefficients in such presentations. Passing to the stable quotient gives the asserted
    continuity, independently of the local choices.
  At $tau = 0$ the homotopy is the inclusion $X arrow.r.hook cal(X)$.
    At $tau = 1$ it factors through $X_1$, and then through Riemann–Hilbert to a map $F : X arrow.r
    X^(upright(B))$. The pullback $F^(*)$ is therefore precisely (5.5),
    because both restrictions from $cal(X)$ are isomorphisms.
    Projectivizing $F$ gives the usual projective nonabelian-Hodge map.
  Let $Phi : X arrow.r X^(upright(B))$ be the fixed-determinant nonabelian-Hodge diffeomorphism.
    The maps $F$ and $Phi$ agree after projectivization. Two determinant-one lifts of the same projective
    representation differ on each handle generator by an nth root of unity;
    thus their classes differ by the finite group of determinant-preserving characters, identified with $Gamma$.
    The low-degree calculation of Section 2 gives $H^0 \( X^(upright(B)) \) = bb(Q)$,
    so $X^(upright(B))$ is connected; it is smooth in the coprime setting.
    Lemma 18 therefore gives $F = gamma Phi$ for one $gamma in Gamma$.
    Its action on $X^(upright(B))$ is algebraic and preserves Deligne weights.
    Consequently $F^(*)$ and $Phi^(*)$ transport the weight filtration identically on every cohomology group.
    No averaging or projection to invariants occurs.
  Finally choose $M in "Pic"^0 \( C \)$ with $M^(⊗ n) tilde.eq L ⊗ cal(O)_C \( - d x_0 \)$.
    Tensoring by $M$ identifies the two Higgs moduli spaces algebraically over the same Hitchin base.
    Their projective Higgs bundles, and therefore their projective harmonic correspondences, are unchanged.
    Applying the same finite-character argument to the two fixed-determinant nonabelian-Hodge maps shows that this
    identification also preserves the transported weight filtration.
    It preserves the perverse filtration because it is an isomorphism over the Hitchin base. ◻
]

== 6 A common cohomological operator <sec:translation>

We now use the logarithmic families to turn an elementary modification of Higgs bundles into monodromy of Betti
  spaces. All cohomology identifications in this section are the restriction maps of Corollary 15.
  This specifies a single operator before we estimate its effect on either filtration.

=== 6.1 Modification of two eigenlines <modification-of-two-eigenlines>

Choose $v in sqrt(- 1) bb(R)^n$ with sum zero, distinct entries, and no vanishing proper nonempty partial sum.
  Such vectors exist because the excluded conditions form finitely many proper real hyperplanes. Set

$ ell = \( 1 \, - 1 \, 0 \, dots.h \, 0 \) . $

At a logarithmic operator with distinct residue eigenvalues,
  a positive elementary modification allows a simple pole in a chosen residue eigenline;
  a negative one takes the kernel of the projection to that eigenline at $x$.
  With the convention that a positive shift replaces a local generator $s$ by $z^(- 1) s$,
  the $lambda$-Leibniz rule changes its residue eigenvalue by $- lambda$.
  A negative shift changes it by $+ lambda$. We perform the shifts specified by $ell$ successively:
  first the positive modification on the first labeled eigenline, then,
  after reselecting the labeled eigenspaces of the new residue,
  the negative modification on the second labeled eigenline.
  The ordered eigenspaces of the final residue define the final flag.

#thm([Lemma 6.1.])[
  #emph[The two modifications define a continuous family of isomorphisms
#[#set math.equation(numbering: n => "(6.1)")
 $ F_a : Y_(a \, v) arrow.r Y_(a \, v - a ell) \, wide 0 lt.eq a lt.eq 1 . $ <trans:path>]

 At $a = 0$ they define an algebraic automorphism of $Y_(0 \, v)$.
   More generally, the same modification defines an automorphism over the punctured Higgs line
   $\( lambda \, u \) = \( 0 \, z v \)$, $z eq.not 0$, preserving the logarithmic Hitchin map.
   At $a = 1$, the Riemann–Hilbert identifications make $F_1$ the identity on the underlying Betti space.]
] <trans:translation>

#proof[
  For each single modification, choose a local frame adapted to its current residue eigenspaces.
    The off-diagonal coefficients involving the chosen eigenline vanish at the pole,
    so the singly modified lattice remains preserved by the logarithmic operator.
    The preceding calculation gives its new residue eigenvalues.
    Their imaginary parts remain distinct throughout (6.1), including after the first step.
    We can therefore reselect the residue eigenspaces before performing the second modification.
    The two-step composite preserves the determinant and its operator because the lattice shifts have sum zero.
    Its inverse performs the opposite single modifications in reverse order,
    again reselecting eigenspaces between steps. These elementary transformations and their inverses vary
    algebraically where the successive residue eigenvalues are distinct, giving the asserted continuous family.
  We check stability, which is not supplied by lattice modification alone.
    On the Higgs line with $z eq.not 0$, a proper invariant saturated subbundle would have a trace Higgs
    differential with a single possible simple pole. Its residue would be $z sum_(i in I)
    v_i$ for a proper nonempty subset $I$. This is nonzero, contrary to the residue theorem.
    The modified Higgs bundles satisfy the same argument. Distinct residue eigenvalues split the local Higgs
    operator into formal eigenline summands; shifting these summands and shifting them back proves invertibility.
  For $a > 0$, divide the operator by $a$. A proper invariant monodromy subspace would have determinant monodromy
    one around the puncture. The imaginary part of the sum of its exponents is $a^(- 1) sum_(i in I) "Im" v_i$,
    which is nonzero. Thus no such subspace exists. Differences of exponents have nonzero imaginary part,
    so no nonzero integral resonance occurs. The inverse modifications are valid and remain stable by the same tests.
  The characteristic polynomial on the Higgs line is unchanged away from the pole and hence unchanged as a
    meromorphic polynomial on $C$. Finally, modifications of a connection change only its logarithmic lattice at
    the puncture. At $a = 1$ the exponent changes are integers,
    so the meromorphic flat bundle and the ordered monodromy eigenlines are unchanged.
    This is precisely the endpoint identification asserted in the lemma. ◻
]

=== 6.2 Translation as eigenvalue monodromy <translation-as-eigenvalue-monodromy>

Write $T = F_0$ and transport its pullback to the total family:

#[#set math.equation(numbering: n => "(6.2)")
 $ sans(T) = rho_(0 \, v)^(- 1) T^(*) rho_(0 \, v) quad upright("on ") H^(*) \( cal(Y) \, bb(Q) \) . $ <trans:global-T>]

To compare this operator with the endpoint $F_1$, we need constancy along the two families in (6.1).
  Their fibers are nonproper; the restriction isomorphisms, rather than properness, supply the following criterion.

#thm([Lemma 6.2.])[
  #emph[Let $I$ be a connected real interval and let $p : M arrow.r I$ and $q : N arrow.r
    I$ be smooth submersions, with finite-dimensional rational cohomology on their fibers.
    Suppose there are spaces $A \, B$ and continuous maps $a : M arrow.r A$, $b : N arrow.r
    B$ whose restrictions induce isomorphisms
$ alpha_t : H^(*) \( A \, bb(Q) \) arrow.r^tilde.op H^(*) \( M_t \, bb(Q) \) \, wide beta_t :
  H^(*) \( B \, bb(Q) \) arrow.r^tilde.op H^(*) \( N_t \, bb(Q) \) $

 for every $t in I$. If $F : M arrow.r N$ is continuous over $I$, then $alpha_t^(- 1) F_t^(*) beta_t :
   H^(*) \( B \, bb(Q) \) arrow.r H^(*) \( A \, bb(Q) \)$ is independent of $t$.]
] <log:compact-cycles>

#proof[
  Fix a degree and a parameter $t_0$. Choose finitely many compact singular cycles forming a rational homology
    basis of $M_(t_0)$. A lift of the interval vector field near the compact union of their carriers has a flow
    for a common short time. It transports these cycles to nearby fibers;
    the resulting cycles sweep homologies in $M$. Their images in $A$ are therefore homologous,
    so their pairings with the restrictions of a fixed basis of $H^(*) \( A \)$ are constant.
    The restriction isomorphisms show that the transported cycles remain a basis of the fiber homology.
  Applying the continuous map $b F$ to these swept cycles gives homologies in $B$.
    Hence their pairings with every fixed class of $H^(*) \( B \)$ are also constant.
    These pairings are the matrix coefficients of $alpha_t^(- 1) F_t^(*) beta_t$, relative to the fixed bases.
    The operator is thus locally constant, including one-sided neighborhoods of interval endpoints,
    and therefore constant on $I$. ◻
]

Apply the lemma with $I = \[ 0 \, 1 \]$ and with $M \, N$ the pullbacks of $cal(Y) arrow.r Lambda$ along

$ a mapsto \( a \, v \) \, wide a mapsto \( a \, v - a ell \) \, $

respectively. These are smooth submersions by Proposition 14, and (6.1) gives the continuous map $F : M arrow.r
  N$. Take both ambient spaces in the lemma to be $cal(Y)$, with the natural maps from the two pullbacks.
  Their fiber restrictions induce the isomorphisms of Corollary 15. The constancy conclusion therefore gives

#[#set math.equation(numbering: n => "(6.3)")
 $ sans(T) = rho_(1 \, v)^(- 1) F_1^(*) rho_(1 \, v - ell) . $ <trans:endpoint>]

In particular, this identification does not require the nonproper smooth families to be globally locally trivial.

Recall the eigenvalue map

$ t \( u \) = \( zeta e^(- 2 pi sqrt(- 1) u_i) \)_(i = 1)^n . $

The path $u = v - a ell$, $0 lt.eq a lt.eq 1$, maps to a loop in $V$.
  Every forbidden proper subproduct has modulus different from one because the corresponding partial sum of $v$
  has nonzero imaginary part. The same condition excludes resonance along the entire path.
  By Proposition 16, this is a path in the actual moving-puncture Betti family.
  Restrictions of classes from $cal(Y)$ are flat sections along this path:
  the Betti direct images satisfy ordinary base change and are locally constant.
  Since $F_1$ is the endpoint identity, (6.3) identifies $sans(T)$ with the pullback convention for its eigenvalue
  monodromy.

#thm([Lemma 6.3.])[
  #emph[There is an integer $M > 0$ such that
#[#set math.equation(numbering: n => "(6.4)")
 $ N = 1 / M log \( sans(T)^M \) $ <trans:N>]

 is a well-defined nilpotent derivation of $H^(*) \( cal(Y) \, bb(Q) \)$.
   Let $N_(lambda \, u) = rho_(lambda \, u) N rho_(lambda \, u)^(- 1)$.
   On $H^(*) \( Y_(1 \, 0) \, bb(Q) \)$, equipped with the diagram weights of Section 4, one has
$ N_(1 \, 0) W_j subset W_(j - 2) . $

]
] <trans:logarithm>

#proof[
  The full-flag Betti family has integral lisse direct images, ordinary base change,
    and Hodge–Tate fibers by Section 3. The moving-puncture transition maps are algebraic and locally constant by
    Proposition 16. The finite-monodromy statement of Section 4 therefore applies to this very family.
    Choose $M$ that kills the monodromy action on every weight-graded piece of its total cohomology.
    There are finitely many such pieces. Then $sans(T)^M - 1$ is nilpotent, and (6.4) is a finite logarithmic sum.
    The weights are even, so $N$ lowers them by at least two at $\( 1 \, v \)$.
  The path $\( 1 \, a v \)$, $0 lt.eq a lt.eq 1$, stays in the nonresonant inverse image of $V$.
    At $a = 0$, the scalar point belongs to $V$ because $zeta$ has order $n$.
    For $a > 0$, the imaginary-part argument applies again. Parallel transport preserves the diagram weights and
    coincides with the restriction identifications. This gives the stated estimate at $\( 1 \, 0 \)$.
  Lemma 12 makes the logarithm a derivation on the moving-puncture Betti cohomology.
    The restriction identifications are ring isomorphisms, so this property transports to
    $H^(*) \( cal(Y) \, bb(Q) \)$. ◻
]

=== 6.3 Flag push-pull and the weight bound <flag-push-pull-and-the-weight-bound>

For the scalar correspondence at $lambda$, put

$ sans(A)_lambda = pi_(lambda \, *) iota_lambda^(*) \, wide sans(B)_lambda = iota_(lambda \, *) pi_lambda^(*) . $

Its unflagged moving-pole space is $S times X_lambda$, with projection $"pr"_lambda$. We define

#[#set math.equation(numbering: n => "(6.5)")
 $ f' = "pr"_(0 \, *) thin sans(A)_0 N_(0 \, 0)^2 sans(B)_0 thin "pr"_0^(*) : H^m \( X \, bb(Q) \) arrow.r
   H^(m - 2) \( X \, bb(Q) \) . $ <trans:fprime>]

The flag embedding and projection have opposite degree shifts, $2 b$ and $- 2 b$.
  Integration over the compact curve $S$ supplies the remaining degree $- 2$.
  Table 1 records the individual derived morphisms and their degree and weight shifts.
  Section 7 derives the perverse bound from their composite over the Hitchin base. We first prove the weight bound.

#thm([Proposition 6.4.])[
  #emph[Under nonabelian Hodge theory, the operator (6.5) satisfies
$ f' W_j H^m \( X^B \, bb(Q) \) subset W_(j - 4) H^(m - 2) \( X^B \, bb(Q) \) . $

]
] <trans:weights>

#proof[
  The scalar correspondence and its Gysin maps commute with the restriction identifications of Corollary 15.
    Thus (6.5) transports to the same expression at $lambda = 1$.
    By Proposition 19, these identifications transport the ordinary Betti weight filtration on the full cohomology
    of $X^B$. The possible difference from a chosen nonabelian-Hodge identification is one algebraic
    $Gamma$-action, which preserves every weight subspace, including those in variant cohomology.
  At $lambda = 1$, the scalar Betti space is the flat algebraic product $S times X^B$ of Lemma 17.
    Its diagram mixed Hodge structure assigns weight zero to the cochains of $S$ and the ordinary Deligne weights
    to $H^(*) \( X^B \)$. Hence both $"pr"_1^(*)$ and $"pr"_(1 \, *)$ preserve weights.
    The flag maps are maps of the same flat transition diagrams.
    Their ordinary topological Gysin maps are the diagram Gysin maps,
    with weight shifts $2 b$ for $sans(B)_1$ and $- 2 b$ for $sans(A)_1$.
    These shifts cancel, while $N_(1 \, 0)^2$ lowers weight by four by Lemma 22. ◻
]

We have constructed the operator and proved its weight bound.
  The remaining tasks are to realize it over the Hitchin base, which gives the perverse bound,
  and to compute its double commutator with $e$.

== 7 Specialization over a Higgs line <sec:specialization>

We now prove the perverse-filtration bound for the operator $f'$ in (6.5).
  The translation is defined over a logarithmic Hitchin base away from zero on a Higgs line.
  Nearby cycles extend its action to the zero fiber as a sheaf endomorphism.
  A final integration over the moving-point curve supplies the shift by $- 2$.
  The essential comparison with ordinary cohomology uses the restriction isomorphisms of Corollary 15;
  it does not require the parameter morphism to be proper.

=== 7.1 The proper morphism and its relative translation <the-proper-morphism-and-its-relative-translation>

Keep the vector $v$ and the translation from Section 6. Let $p_C : C times S arrow.r
  S$ be the projection and let $Delta subset C times S$ be the graph of $x : S arrow.r C$.
  The vector bundle of trace-free logarithmic Hitchin coefficients is

$ cal(E) = xor.big_(i = 2)^n p_(C \, *) #scale(x: 120%, y: 120%)[\(] K_(C times S \/ S) \( Delta \)^(⊗ i)
  #scale(x: 120%, y: 120%)[\)] . $

We use the same notation for its total space. These direct images are locally free and commute with base change:
  each twisting line on a fiber has degree $i \( 2 g - 1 \) > 2 g - 2$, so its first cohomology vanishes.
  The inclusion of ordinary coefficient spaces defines a closed vector-subbundle embedding

$ j : S times A arrow.r.hook cal(E) . $

Indeed both the ordinary spaces and the logarithmic spaces commute with base change,
  and their quotient has constant rank.

Let $D = bb(A)_z^1$, let $D^(*) = D \\ { 0 }$, and define

$ cal(Y)_v = cal(Y) times_Lambda D \, wide z mapsto \( 0 \, z v \) . $

Thus its fiber at $z$ is $Y_(0 \, z v)$, including the moving-point coordinate in $S$.
  Characteristic coefficients and the parameter define

#[#set math.equation(numbering: n => "(7.1)")
 $ g_v : cal(Y)_v arrow.r cal(E) times D . $ <spec:hitchin-line>]

Write $g_0 : Y_(0 \, 0) arrow.r cal(E)$ for its zero fiber.

#thm([Lemma 7.1.])[
  #emph[The morphism $g_v$ is proper, and $cal(Y)_v arrow.r D$ is smooth.
    The translation defines an automorphism $T_v$ of $cal(Y)_v \|_(D^(*))$ over $cal(E) times D^(*)$.
    Scaling gives an isomorphism
$ cal(Y)_v \|_(D^(*)) tilde.eq Y_(0 \, v) times D^(*) $

 over $D^(*)$, and restriction from $H^(*) \( cal(Y)_v \)$ to either $Y_(0 \, 0)$ or $Y_(0 \, v)$ is an isomorphism.]
] <spec:geometry>

#proof[
  Smoothness and the restriction assertions follow from Proposition 14 and Corollary 15.
    For properness, start with the relative logarithmic Higgs Hitchin morphism over $S$.
    Imposing determinant $cal(O)_C \( d x \( s \) \)$ and trace zero gives a closed subspace.
    Adding a residue-invariant full flag is projective over that subspace.
    Finally the requirement that the ordered diagonal residues equal $z v_i$ is closed after adjoining $z$.
    The properness of the logarithmic Hitchin morphism from Section 5 therefore implies properness of (7.1).
    Coprimality ensures that the semistable limits in this argument remain stable.
  For $z eq.not 0$ the residual eigenvalues $z v_i$ are distinct,
    so the elementary modifications defining $T_v$ and their inverses are algebraic in $z$.
    They remain in the stable moduli by the trace-residue argument of Section 6.
    A modified Higgs field agrees with the original meromorphic Higgs field away from the pole.
    Their characteristic coefficients are consequently equal as sections of $K_C \( x \( s \) \)^(⊗ i)$,
    which proves that $T_v$ is over $cal(E)$. Multiplying the Higgs field by $z$ identifies the fiber at $1$ with
    that at $z$; division by $z$ is its inverse. This gives the claimed product over $D^(*)$.
    The product need not fix the Hitchin coefficient in $cal(E)$; only the translation must do so. ◻
]

=== 7.2 Specialization and ordinary cohomology <specialization-and-ordinary-cohomology>

Here is the comparison needed for the noncompact spaces in Lemma 24.
  Throughout, nearby cycles are unshifted; we use the nearby-cycle and proper-base-change formalism recalled in
  #cite(label("dCM2009")) Sections 5.5 and 5.8.

#thm([Lemma 7.2.])[
  #emph[Let $Y arrow.r D = bb(A)^1$ be a smooth morphism of complex algebraic varieties, and let $g : Y arrow.r
    B times D$ be a proper morphism commuting with the maps to $D$.
    Suppose that $Y \|_(D^(*))$ is isomorphic to $Y_1 times D^(*)$ over $D^(*)$ and that the actual restriction maps
$ r_i : H^(*) \( Y \, bb(Q) \) arrow.r H^(*) \( Y_i \, bb(Q) \) \, wide i = 0 \, 1 \, $

 are isomorphisms. An automorphism $T$ of $Y \|_(D^(*))$ over $B times
   D^(*)$ then induces an endomorphism $tau_0$ of $R g_(0 \, *) bb(Q)_(Y_0)$ whose cohomological action is
$ H^(*) \( tau_0 \) = r_0 r_1^(- 1) T_1^(*) r_1 r_0^(- 1) . $

 Neither $B$ nor $Y_i$ is required to be proper.]
] <spec:specialization>

#proof[
  Smoothness gives the canonical isomorphism $bb(Q)_(Y_0) tilde.eq psi bb(Q)_Y$.
    Compatibility of nearby cycles with proper direct image gives
  $ R g_(0 \, *) bb(Q)_(Y_0) tilde.eq R g_(0 \, *) psi bb(Q)_Y tilde.eq psi \( R g_(*) bb(Q)_Y \) . $
  Apply nearby cycles to the pullback endomorphism induced by $T$ on the punctured direct image,
    and use these isomorphisms to define $tau_0$.
  We verify its action on global cohomology without interchanging nearby cycles with a nonproper direct image to a
    point. Put $K = R g_(*) bb(Q)_Y$ on $B times D$. Let $tilde(D)^(*) arrow.r D^(*)$ be the universal cover and write
  $ tilde(j)_B : B times tilde(D)^(*) arrow.r B times D \, wide i_B : B times { 0 } arrow.r.hook B times D \, wide
    tilde(K) = tilde(j)_B^(*) K . $
  Set $tilde(Y)^(*) = Y \|_(D^(*)) times_(D^(*)) tilde(D)^(*)$.
    Proper base change identifies $tilde(K)$ with the direct image of the constant sheaf from $tilde(Y)^(*)$.
    The nearby-cycle formula downstairs is $psi K = i_B^(*) R tilde(j)_(B \, *) tilde(K)$.
    Restriction of this complex gives a natural morphism
  #[#set math.equation(numbering: n => "(7.2)")
   $ R Gamma \( tilde(Y)^(*) \, bb(Q) \) & tilde.eq R Gamma \( B times D \, R tilde(j)_(B \, *) tilde(K) \)\
 & arrow.r R Gamma \( B \, psi K \) tilde.eq R Gamma \( Y_0 \, bb(Q) \) . $ <spec:comparison-map>]
  The last isomorphism uses proper nearby-cycle compatibility and smoothness of $Y arrow.r D$.
    The composite of (7.2) with restriction from $R Gamma \( Y \, bb(Q) \)$ is ordinary restriction to $Y_0$.
    Indeed the specialization unit for $K$ corresponds, under proper direct image,
    to the unit $bb(Q)_(Y_0) arrow.r psi bb(Q)_Y$, which is the canonical smooth isomorphism used above.
  Choose a lift of $1 in D^(*)$. The assumed product and the contractibility of $tilde(D)^(*)$ identify
    $H^(*) \( tilde(Y)^(*) \)$ with $H^(*) \( Y_1 \)$ by actual restriction to that lift.
    Pullback from $H^(*) \( Y \)$ therefore becomes $r_1$ and is an isomorphism.
    Since its composite with (7.2) is $r_0$, the latter map is also an isomorphism on cohomology.
  The comparison was constructed on $B times D$ so that it is equivariant for the required operator:
    because $T$ is over $B times D^(*)$, it induces an endomorphism of $K \|_(B times D^(*))$ and hence of
    $tilde(K)$, $R tilde(j)_(B \, *) tilde(K)$, and $psi K$. Every arrow in (7.2) respects these actions.
    Restricting at the chosen lift identifies the action on its domain with $T_1^(*)$,
    and its action on the codomain is $H^(*) \( tau_0 \)$. Thus the displayed formula for $H^(*) \( tau_0 \)$
    follows. No extension of $T$ to an automorphism of $Y$ is asserted or needed. ◻
]

Apply Lemma 25 to (7.1). The resulting endomorphism $tau_0$ of $R g_(0 \, *)
  bb(Q)_(Y_(0 \, 0))$ acts on cohomology as the translation transported to $Y_(0 \, 0)$ by Corollary 15.
  In particular its action is the operator whose logarithm is $N_(0 \, 0)$ in Section 6.

A finite polynomial suffices to realize this logarithm over the Hitchin base.
  Choose $M$ as in Lemma 22, and choose an integer $r gt.eq 1$ for which $\( sans(T)^M - 1 \)^r =
  0$ on total cohomology. Put

$ p \( t \) = 1 / M sum_(a = 1)^(r - 1) frac(\( - 1 \)^(a + 1), a) \( t^M - 1 \)^a . $

The polynomial $p \( tau_0 \)$ is a legitimate endomorphism of $R g_(0 \, *) bb(Q)_(Y_(0 \, 0))$,
  and its action on cohomology is $N_(0 \, 0)$. No unipotence assertion about $tau_0$ in the derived category is needed.

=== 7.3 The derived shift <the-derived-shift>

We have now realized the middle operator in $f'$ over the Hitchin base.
  We next include the flag correspondence and the moving-point integration, keeping every shift explicit.

#thm([Proposition 7.3.])[
  #emph[The operator $f'$ of (6.5) is induced by a morphism
#[#set math.equation(numbering: n => "(7.3)")
 $ R h_(*) bb(Q)_X arrow.r R h_(*) bb(Q)_X \[ - 2 \] $ <spec:derived-lowering>]

 in the constructible derived category on $A$. Consequently
$ f' \( P_k H^m \( X \, bb(Q) \) \) subset.eq P_(k - 2) H^(m - 2) \( X \, bb(Q) \) $

 for all integers $m \, k$.]
] <spec:perverse-lowering>

#proof[
  Let $O_0 = S times X$ using the scalar product identification of Lemma 13, and write $q = "id"_S times h$.
    Both maps in the scalar flag correspondence of Figure 1 at $lambda = 0$ are over $cal(E)$.
    The flag projection has relative complex dimension $b$, and the scalar inclusion has complex codimension $b$.
    Thus their pullbacks and proper Gysin maps give, with
  $ F_O = j_(*) R q_(*) bb(Q)_(O_0) \, wide F_Y = R g_(0 \, *) bb(Q)_(Y_(0 \, 0)) \,\
F_Z = R \( g_0 compose iota \)_(*) bb(Q)_(Z_0) \, $
  morphisms
  $ sans(B)_0 : F_O arrow.r F_Y \[ 2 b \] \, wide sans(A)_0 : F_Y arrow.r F_O \[ - 2 b \] . $
  Composing these with the appropriate shifts of $p \( tau_0 \)^2$ gives an endomorphism of $F_O$ with zero net
    shift. Its cohomological action is $sans(A)_0 N_(0 \, 0)^2 sans(B)_0$.
    Since direct image by the closed embedding $j$ is fully faithful,
    this is an endomorphism of $R q_(*) bb(Q)_(O_0)$ over $S times A$.
  Let $p_S : S times A arrow.r A$ be the projection, and write $K = R h_(*) bb(Q)_X$. The product identification gives
  $ R p_(S \, *) R q_(*) bb(Q)_(O_0) tilde.eq K ⊗ R Gamma \( S \, bb(Q) \) . $
  Push the preceding endomorphism to $A$, precompose with the projection unit $K arrow.r
    K ⊗ R Gamma \( S \, bb(Q) \)$, and postcompose with the orientation trace
  $ K ⊗ R Gamma \( S \, bb(Q) \) arrow.r K \[ - 2 \] . $
  This constructs (7.3). On ordinary cohomology the unit is $"pr"_0^(*)$, the trace is $"pr"_(0 \, *)$,
    and the middle map is the flag composite already identified. Hence the resulting operator is exactly $f'$.
  For completeness, set $K_(upright("norm")) = K \[ R \]$, the normalization used in the statement of the theorem.
    Functoriality of perverse truncation applied to (7.3) gives
  $ zws^p tau_(lt.eq k) K_(upright("norm")) arrow.r
    zws^p
    tau_(lt.eq k) \( K_(upright("norm")) \[ - 2 \] \) = \( zws^p tau_(lt.eq k - 2) K_(upright("norm")) \) \[ - 2 \] . $
  Taking hypercohomology in degree $m - R$ and then its image in ordinary cohomology proves the stated inclusion.
    This uses neither a splitting nor multiplicativity of the perverse filtration. ◻
]

We finish by recording the derived morphisms and their shifts.
  Retain the complexes $F_O \, F_Z \, F_Y$ and $K$ from the proof, and put $K_S = K ⊗ R Gamma \( S \, bb(Q) \)$.

The first panel of Table 1 consists of morphisms on $cal(E)$.
  Compose the flag maps and $p \( tau_0 \)^2$ there to obtain an endomorphism of $F_O$, descend it through $j$,
  and then apply $R p_(S \, *)$. This produces the degree-zero endomorphism of $K_S$ in the second panel,
  whose base is $A$. The unit and trace then give $K arrow.r K \[ - 2 \]$;
  it is this complete morphism that yields the normalized perverse bound above.
  No perverse exactness of $R p_(S \, *)$ is used. The weight columns refer to the cohomological actions after
  transport to $lambda = 1$ and use the diagram weights of Section 4.
  In particular $p \( tau_0 \)$ acts as $N_(1 \, 0)$ after this comparison,
  while the unit and trace preserve weight because the cochains of $S$ have weight zero.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, left, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 4, align: center)[Morphisms on $cal(E)$
]),
  table.cell(rowspan: 1, colspan: 1)[Operation
], table.cell(rowspan: 1, colspan: 1)[Morphism
], table.cell(rowspan: 1, colspan: 1)[Degree
], table.cell(rowspan: 1, colspan: 1)[$Delta W$
],
  table.cell(rowspan: 1, colspan: 1)[$pi_0^(*)$
], table.cell(rowspan: 1, colspan: 1)[$F_O arrow.r F_Z$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[$iota_(0 \, *)$
], table.cell(rowspan: 1, colspan: 1)[$F_Z arrow.r F_Y \[ 2 b \]$
], table.cell(rowspan: 1, colspan: 1)[$2 b$
], table.cell(rowspan: 1, colspan: 1)[$2 b$
],
  table.cell(rowspan: 1, colspan: 1)[$p \( tau_0 \)$
], table.cell(rowspan: 1, colspan: 1)[$F_Y arrow.r F_Y$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$- 2$
],
  table.cell(rowspan: 1, colspan: 1)[$p \( tau_0 \)^2$
], table.cell(rowspan: 1, colspan: 1)[$F_Y arrow.r F_Y$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$- 4$
],
  table.cell(rowspan: 1, colspan: 1)[$iota_0^(*)$
], table.cell(rowspan: 1, colspan: 1)[$F_Y arrow.r F_Z$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[$pi_(0 \, *)$
], table.cell(rowspan: 1, colspan: 1)[$F_Z arrow.r F_O \[ - 2 b \]$
], table.cell(rowspan: 1, colspan: 1)[$- 2 b$
], table.cell(rowspan: 1, colspan: 1)[$- 2 b$
],
  table.cell(rowspan: 1, colspan: 1)[Flag composite
], table.cell(rowspan: 1, colspan: 1)[$F_O arrow.r F_O$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$- 4$
],
  table.cell(rowspan: 1, colspan: 4, align: center)[Morphisms on $A$
],
  table.cell(rowspan: 1, colspan: 1)[Operation
], table.cell(rowspan: 1, colspan: 1)[Morphism
], table.cell(rowspan: 1, colspan: 1)[Degree
], table.cell(rowspan: 1, colspan: 1)[$Delta W$
],
  table.cell(rowspan: 1, colspan: 1)[Projection unit
], table.cell(rowspan: 1, colspan: 1)[$K arrow.r K_S$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[Pushed composite
], table.cell(rowspan: 1, colspan: 1)[$K_S arrow.r K_S$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$- 4$
],
  table.cell(rowspan: 1, colspan: 1)[Orientation trace
], table.cell(rowspan: 1, colspan: 1)[$K_S arrow.r K \[ - 2 \]$
], table.cell(rowspan: 1, colspan: 1)[$- 2$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[Complete $f'$
], table.cell(rowspan: 1, colspan: 1)[$K arrow.r K \[ - 2 \]$
], table.cell(rowspan: 1, colspan: 1)[$- 2$
], table.cell(rowspan: 1, colspan: 1)[$- 4$
],
)
]],
  caption: [Table 1: Derived degrees and diagram-weight bounds for the correspondence maps. A weight bound $s$ means that $W_k$ maps into $W_(k + s)$ after transport to the Betti side. The row for $p \( tau_0 \)$ records $N$ separately; the flag composite uses its square. ],
)

== 8 The translation class and the double commutator <sec:commutator>

The preceding sections give the two filtration bounds for the same operator $f'$.
  We now compute its double commutator with $e$. The calculation has two parts:
  an elementary modification differentiates the universal degree-two class into a difference of flag classes,
  and flag integration converts the square of that difference back into $e$.

=== 8.1 The characteristic class under translation <the-characteristic-class-under-translation>

The universal projective bundle on $C times cal(Y)$ defines a universal endomorphism bundle. Let

$ e_(cal(Y)) = frac(1, 2 n) integral_C "ch"_2 \( "End" E \) in H^2 \( cal(Y) \, bb(Q) \) . $

Individual ordered flag lines $Q_i$ can be taken on local universal-bundle charts;
  their ratios $Q_i ⊗ Q_j^(- 1)$ descend to the coarse moduli space. We use the global classes

$ y = c_1 \( Q_1 ⊗ Q_2^(- 1) \) \, wide t_C = x^(*) c_1 \( T_C \) \, $

where the second is pulled back from $S$. We retain the same notation for the restrictions of these classes to a
  fiber $Y_(lambda \, u)$.

#thm([Lemma 8.1.])[
  #emph[For the translation $T : Y_(0 \, v) arrow.r Y_(0 \, v)$ associated with
    $ell = \( 1 \, - 1 \, 0 \, dots.h \, 0 \)$ and every integer $k gt.eq 0$,
#[#set math.equation(numbering: n => "(8.1)")
 $ T^(k *) e_(cal(Y)) = e_(cal(Y)) + k y + k^2 t_C . $ <calc:translation-polynomial>]

 Consequently the logarithm from Section 6 satisfies
#[#set math.equation(numbering: n => "(8.2)")
 $ N \( e_(cal(Y)) \) = y $ <calc:logarithm>]

 on $H^(*) \( cal(Y) \, bb(Q) \)$ and, by restriction, on every fiber.]
] <calc:translation-formula>

#proof[
  Work first on $Y_(0 \, v)$. Denote by $i : Delta arrow.r.hook C times Y_(0 \, v)$ the graph of the moving point.
    Its normal line is the pullback of $x^(*) T_C$, so
  $ cal(O) \( Delta \) \|_Delta tilde.eq x^(*) T_C \, wide c_1 \( N_Delta \) = t_C . $
  The residue eigenvalues $v_i$ are distinct. Consequently the Higgs operator has uniquely labeled eigenline
    summands on the formal neighborhood of $Delta$. This follows by lifting its simple residual eigenvalues and
    their idempotent projectors to every finite order. Multiplying a local frame of the logarithmic canonical line
    by a unit does not change those projectors. Thus the formal summands are intrinsic,
    and any finite number of their jets suffices for an elementary modification.
  The $k$-fold translation replaces the $i$th formal line lattice by its twist by $k ell_i Delta$.
    On the $\( i \, j \)$ block of $"End" E$, the lattice shift is therefore
  $ m_(i j) = k \( ell_i - ell_j \) . $
  If a line block has restriction $F$ to $Delta$, its K-theory change under an integer shift $m$ is
  #[#set math.equation(numbering: n => "(8.3)")
   $ \[ upright("new block") \] - \[ upright("old block") \] =
     sum_(a = 1)^m \[ i_(*) \( F ⊗ N_Delta^(⊗ a) \) \] . $ <calc:signed-jets>]
  For $m < 0$, the right side means the negative of the sum over $m < a lt.eq 0$; for $m = 0$ it is zero.
    For positive $m$, the formula follows by successive quotients of the lattices at pole orders $1 \, dots.h \,
    m$. For negative $m$, apply the same quotient sequence between the smaller lattice and the original one.
    In particular $m = - 1$ contributes $- \[ i_(*) F \]$, as it must for the kernel elementary transformation.
  The resulting identity for $"End" E$ is global in K-theory, before applying a characteristic class.
    Indeed the intrinsic formal idempotents lie in the descended endomorphism algebra,
    so its $\( i \, j \)$ blocks are global formal line bundles.
    Identify the original and modified endomorphism bundles away from $Delta$,
    and choose a common sufficiently small lattice inside both.
    Their quotients by this lattice are supported on a finite infinitesimal neighborhood of $Delta$.
    The formal block projectors and the filtration by pole order give global finite filtrations of these
    quotients. Their associated graded terms are graph pushforwards of the descended line bundles $Q_i ⊗
    Q_j^(- 1) ⊗ N_Delta^(⊗ a)$. Subtracting the two quotient classes cancels the common pole orders and leaves
    exactly the signed sums in (8.3). Additivity for these filtrations therefore gives the identity in the
    Grothendieck group of coherent sheaves on $C times Y_(0 \, v)$; the common lattice also cancels.
  Grothendieck–Riemann–Roch for the graph #cite(label("Fulton1998")) Section 15.2 gives
  $ "ch" \( i_(*) F \) = i_(*) #scale(x: 120%, y: 120%)[\(] "ch" \( F \) "td" \( N_Delta \)^(- 1)
    #scale(x: 120%, y: 120%)[\)] . $
  Hence the contribution of a summand in (8.3) to $integral_C "ch"_2$ is
  $ c_1 \( F \) + \( a - 1 / 2 \) t_C . $
  This also exhibits the sign of the normal-bundle correction:
    the normal line is the tangent line, and its inverse Todd class starts with $1 - t_C \/ 2$.
    For the signed sums just specified, the elementary identities
  $ sum_(a = 1)^m 1 = m \, wide sum_(a = 1)^m \( a - 1 / 2 \) = m^2 / 2 $
  hold for every integer $m$.
  Write $w_i = c_1 \( Q_i \)$ on a universal-bundle chart. Only $w_i -
    w_j$ and expressions invariant under common translation of the $w_i$ will occur.
    Summing the contributions for $F = Q_i ⊗ Q_j^(- 1)$ gives
  $ T^(k *) e_(cal(Y)) - e_(cal(Y)) = frac(1, 2 n) sum_(i \, j)
    (k \( ell_i - ell_j \) \( w_i - w_j \) + k^2 / 2 \( ell_i - ell_j \)^2 t_C) . $
  Since $sum_i ell_i = 0$,
  $ sum_(i \, j) \( ell_i - ell_j \) \( w_i - w_j \) = 2 n sum_i ell_i w_i \, wide
    sum_(i \, j) \( ell_i - ell_j \)^2 = 2 n sum_i ell_i^2 . $
  For the chosen cocharacter these are $2 n y$ and $4 n$, respectively, proving (8.1).
    Since the lattice identity was global on the coarse moduli space before applying Grothendieck–Riemann–Roch,
    this is a global cohomological identity there.
  Let $M$ be the integer used to define $N$. Replace $k$ by $M q$ in (8.1).
    Since $sans(T)^(M q) = exp \( M q N \)$, both sides are polynomial functions of the nonnegative integer $q$
    with values in a finite-dimensional cohomology group. They agree as polynomials.
    Their linear coefficients are respectively $M N \( e_(cal(Y)) \)$ and $M y$, giving (8.2) on $Y_(0 \, v)$.
    Corollary 15 transports this identity to $H^(*) \( cal(Y) \)$ and then to all its fibers:
    the three classes in (8.1) are restrictions of the global classes just defined. ◻
]

The quadratic term in (8.1) is consistent with the behavior of the flag lines themselves.
  Restricting a shifted lattice to $Delta$ gives

$ T^(k *) y = y + 2 k t_C \, wide N \( y \) = 2 t_C \, wide N \( t_C \) = 0 . $

In particular one must not assume $N \( y \) = 0$ in the commutator calculation.

=== 8.2 The flag integral <the-flag-integral>

We record explicitly the permutation identity that evaluates the flag correspondence.
  It applies to projective bundles because every polynomial used below is invariant under simultaneous translation
  of the roots.

#thm([Lemma 8.2.])[
  #emph[Let $pi : "Fl" \( V \) arrow.r B$ be the full-flag bundle of a rank-$n$ complex vector bundle,
    and let $w_1 \, dots.h \, w_n$ be its formal Chern roots.
    For a polynomial $F$ in the first Chern classes of the ordered flag lines,
$ pi_(*) #scale(x: 120%, y: 120%)[\(] F \( Q_bullet \) c_b \( T_pi \) #scale(x: 120%, y: 120%)[\)] =
  sum_(sigma in frak(S)_n) F \( w_(sigma \( 1 \)) \, dots.h \, w_(sigma \( n \)) \) . $

 If $sum_i ell_i = 0$, then
#[#set math.equation(numbering: n => "(8.4)")
 $ sum_(sigma in frak(S)_n) (sum_i ell_i w_(sigma \( i \)))^2 =
   n \( n - 2 \) ! parallel ell parallel^2 (sum_i w_i^2 - frac(\( sum_i w_i \)^2, n)) . $ <calc:permutation>]

 Both identities, when their expressions are invariant under common translation of the roots,
   hold for the associated flag bundle of a principal $upright("PGL")_n$-bundle with rational coefficients.]
] <calc:flag-sum>

#proof[
  The projective-bundle pushforward formula is a sum over the roots,
    with denominator the product of the other-root differences.
    Iterating it along the full-flag tower gives the sum over ordered roots,
    with denominator the tangent Euler class at that ordering.
    Multiplication by $c_b \( T_pi \)$ cancels this denominator, giving the first identity.
    One may perform this calculation after passing to a splitting space and inverting root differences;
    the resulting equality is a polynomial identity in the universal Chern classes,
    so it holds without the inversion. The projective-bundle pushforward is characterized by its Chern-polynomial
    relation and the normalization that the top power of the hyperplane class integrates to one;
    using the complex tangent Euler class fixes the orientation signs in the displayed cancellation.
  For (8.4), a fixed root occurs $\( n - 1 \) !$ times at a fixed position,
    and a fixed ordered pair of distinct roots occurs $\( n - 2 \) !$ times at two prescribed distinct positions.
    Since $sum_(i eq.not j) ell_i ell_j = - parallel ell parallel^2$, expansion of the square gives
  $ & \( n - 1 \) ! parallel ell parallel^2 sum_i w_i^2 - \( n - 2 \) ! parallel ell parallel^2 sum_(i eq.not j)
    w_i w_j\
 & #h(15mm)  = n \( n - 2 \) ! parallel ell parallel^2 (sum_i w_i^2 - frac(\( sum_i w_i \)^2, n)) . $
  Finally, rational pullback from $B upright("PGL")_n$ to $B upright("GL")_n$ is injective:
    on a maximal torus it is the inclusion of symmetric polynomials in the root differences into symmetric
    polynomials in all roots. Universal characteristic-class identities invariant under common root translation
    can therefore be checked after this pullback, proving the last assertion. ◻
]

=== 8.3 The common lowering operator <the-common-lowering-operator>

#thm([Proposition 8.3.])[
  #emph[Let $delta = deg \( x : S arrow.r C \)$. The operator $f'$ of (6.5) satisfies
#[#set math.equation(numbering: n => "(8.5)")
 $ \[ \[ f' \, e \] \, e \] = 8 \( - 1 \)^b n \( n - 2 \) ! delta thin e . $ <calc:scalar>]

 Consequently
#[#set math.equation(numbering: n => "(8.6)")
 $ f = frac(\( - 1 \)^(b + 1), 4 n \( n - 2 \) ! delta) thin f' $ <calc:f>]

 has cohomological degree $- 2$, lowers perversity by two and Betti weights by four,
   and satisfies $\[ \[ f \, e \] \, e \] = - 2 e$.]
] <calc:double-commutator>

#proof[
  Work on the scalar correspondence at $lambda = 0$. The restriction of $e_(cal(Y))$ along $iota :
    Z_0 arrow.r.hook Y_(0 \, 0)$ equals $pi^(*) "pr"_0^(*) e$:
    the universal projective characteristic class is unchanged by the line twist $J$ in the scalar product
    identification. Projection formulas therefore show that the maps outside $N_(0 \, 0)^2$ in $f'$ intertwine
    multiplication by the corresponding classes $e$ and $e_(cal(Y))$.
  For a degree-zero derivation $N$ and an even class $a$, write $m_a$ for multiplication by $a$.
    Then $\[ N \, m_a \] = m_(N \( a \))$, and direct expansion gives
  $ \[ \[ N^2 \, m_a \] \, m_a \] = 2 m_(N \( a \)^2) . $
  Indeed the first commutator is $m_(N^2 \( a \)) + 2 m_(N \( a \)) N$; the first term commutes with $m_a$,
    while the second contributes $2 m_(N \( a \)^2)$. Thus no vanishing assertion about $N^2 \( a \)$ is needed.
    By Lemma 27,
  #[#set math.equation(numbering: n => "(8.7)")
   $ \[ \[ f' \, e \] \, e \] = 2 "pr"_(0 \, *) sans(A)_0 \( y^2 union - \) sans(B)_0 "pr"_0^(*) .
     $ <calc:middle-commutator>]
  The normal bundle of $iota$ is $T_pi^(*)$. Self-intersection therefore replaces $iota^(*) iota_(*)$ in (8.7) by
  $ c_b \( T_pi^(*) \) union - = \( - 1 \)^b c_b \( T_pi \) union - . $
  For a class pulled back from $X$, the projection formula and Lemma 28 reduce the flag integral to the symmetric class
  $ sum_(sigma in frak(S)_n) \( w_(sigma \( 1 \)) - w_(sigma \( 2 \)) \)^2 & =
    2 n \( n - 2 \) ! (sum_i w_i^2 - frac(\( sum_i w_i \)^2, n))\
 & = 4 n \( n - 2 \) ! thin tilde("ch")_2 \( E_(x \( s \)) \) . $
  Here $E_(x \( s \))$ denotes the universal projective data restricted to the graph of $x$;
    the normalized expression is well defined without an honest universal vector bundle.
  Under $O_0 tilde.eq S times X$, this characteristic class is the pullback of $tilde("ch")_2 \( E \)$ from $C
    times X$ along $x times "id"_X$. Tensoring by $J$ contributes nothing to it.
    Integration along $S$ multiplies integration along $C$ by $delta$:
  $ "pr"_(0 \, *) tilde("ch")_2 \( E_(x \( s \)) \) = delta e . $
  This follows directly from the degree formula $x_(*) \[ S \] = delta \[ C \]$,
    or from the $C$-degree-two term in the Künneth decomposition. The other curve degrees integrate to zero.
    Combining this equality, the factor $2$ in (8.7), and the self-intersection sign proves (8.5).
  The integer $delta$ is positive because $x$ is a nonempty finite étale cover of connected projective curves.
    Thus (8.6) is a nonzero rational rescaling and gives the stated double commutator.
    The degree of $f'$ is $- 2$, since the two flag shifts cancel and integration over $S$ has degree $- 2$.
    The filtration bounds are Propositions 26 and 23; they are unchanged by the rescaling. ◻
]

== 9 Equality of the filtrations <sec:conclusion>

We assemble the preceding results on the same vector space $H^(*) \( X \, bb(Q) \)$,
  identified with $H^(*) \( X^B \, bb(Q) \)$ by nonabelian Hodge theory.

#proof[
  First take $L = cal(O)_C \( d x_0 \)$. Proposition 4 gives hard Lefschetz for cup product by $e$ on $"Gr"^P
    H^(*) \( X \)$, with grading shift two and center $R$. Section 3 gives the same statement on $"Gr"^W
    H^(*) \( X^B \)$ when actual weight $2 k$ is assigned grade $k$.
    It also proves that all odd weight-graded pieces vanish.
  Let $delta = deg \( S arrow.r C \) > 0$ and set
  $ f = frac(\( - 1 \)^(b + 1), 4 n \( n - 2 \) ! thin delta) thin f' . $
  Propositions 23 and 26 show that $f$ lowers the half-weight filtration and the perverse filtration by two.
    The calculation in Section 8 gives $\[ \[ f \, e \] \, e \] = - 2 e$.
    Apply Proposition 5 to $P_k$ and $W_(2 k)$. It follows that $P_k H^m \( X \) =
    W_(2 k) H^m \( X^B \)$ in every cohomological degree. The vanishing of odd weight-graded pieces gives
    $W_(2 k) = W_(2 k + 1)$.
  For arbitrary $L in "Pic"^d \( C \)$, choose $M in "Pic"^0 \( C \)$ with $M^n tilde.eq L ⊗
    cal(O)_C \( - d x_0 \)$. Tensoring by $M$ identifies the Higgs spaces over the Hitchin base.
    Proposition 19 proves that this identification transports the full Betti weight filtration as well.
    This proves the theorem for every determinant. ◻
]

#thm([Corollary 9.1.])[
  #emph[Let $C$ be a smooth projective complex curve of genus $g gt.eq 2$, let $n gt.eq
    2$ and $d$ be coprime integers, and let $L in "Pic"^d \( C \)$.
    For the moduli space $X$ of stable rank-$n$, determinant-$L$,
    trace-free Higgs bundles and its corresponding twisted $"SL"_n$ character variety $X^B$,
    nonabelian Hodge theory identifies
$ P_k H^m \( X \, bb(Q) \) = W_(2 k) H^m \( X^B \, bb(Q) \) = W_(2 k + 1) H^m \( X^B \, bb(Q) \) wide
  upright("for all integers ") m \, k . $

 The equality holds on full rational cohomology, including its $"Pic"^0 \( C \) \[ n \]$-variant part.]
]

#proof[
  The composite ranks are Theorem 1; the prime ranks are #cite(label("MS2024")) Theorem 0.3. ◻
]

#thm([Corollary 9.2.])[
  (Endoscopic weight compatibility).  #emph[Keep $C \, n \, d \, L$ as in the preceding corollary.
    Put $Gamma = "Pic"^0 \( C \) \[ n \]$, let $gamma in Gamma$ have order $m$,
    and let $kappa in hat(Gamma)$ be the character $kappa \( gamma' \) = chevron.l gamma \,
    gamma' chevron.r_Gamma$ defined by the Weil pairing in #cite(label("MSEndoscopy2021")) Section 1.3.
    Let $pi : C' arrow.r C$ be the associated cyclic étale cover, set $r = n \/ m$, and put
$ d_gamma = "codim"_(cal(A)^(K_C)) cal(A)_gamma^(K_C) \, $

 where $cal(A)_gamma^(K_C)$ is their endoscopic Hitchin base.
   For $D = K_C$ and $D' = pi^(*) K_C = K_(C')$, let $frak(p)_kappa^B$ denote their nonabelian-Hodge-transported
   operator in #cite(label("MSEndoscopy2021")) Section 5.4. Write $tilde(cal(M))_(r \, d)^B \( C' \)$ for the full
   degree-$d$ twisted $"GL"_r$ character variety and $cal(M)_(n \, L)^B \( C \) =
   X^B$ for the fixed-determinant twisted $"SL"_n$ character variety.
   On complexified cohomology, for all integers $i \, k gt.eq 0$,
$ frak(p)_kappa^B #h(-0.16667em) (W_(2 k) H^i \( tilde(cal(M))_(r \, d)^B \( C' \) \, bb(C) \))\
= W_(2 k + 2 d_gamma) H^(i + 2 d_gamma) \( cal(M)_(n \, L)^B \( C \) \, bb(C) \)_kappa \, $

 where the subscript $kappa$ denotes the pullback-action summand on which $gamma' ""^(*) alpha =
   kappa \( gamma' \) alpha$ for every $gamma' in Gamma$.]
] <cor:endoscopic-weights>

#proof[
  Since $r divides n$, one has $gcd \( r \, d \) = 1$, and étale Riemann–Hurwitz gives $g \( C' \) =
    m \( g - 1 \) + 1 gt.eq 2$. The all-rank $"GL"_r$ theorem #cite(label("MS2024")) Theorem 0.2 therefore
    identifies $W_(2 k)$ with $P_k$ on the source, including when $r = 1$.
    The preceding corollary identifies $P_(k + d_gamma)$ with $W_(2 k + 2 d_gamma)$ on the target after
    complexification and passage to the $Gamma$-$kappa$ summand:
    the $Gamma$-action preserves both filtrations, and the target nonabelian-Hodge identification is
    $Gamma$-equivariant. With the common defect normalization,
    #cite(label("MSEndoscopy2021")) Theorem 5.4 gives the exact image of $P_k H^i$ as $P_(k + d_gamma)
    H_kappa^(i + 2 d_gamma)$. Writing $eta_s \, eta_t$ for the source and target nonabelian-Hodge cohomology
    identifications from Betti to Dolbeault, the definition $frak(p)_kappa^B =
    eta_t^(- 1) frak(p)_kappa eta_s$ then gives the claim. Its nonzero scalar ambiguity does not affect images. ◻
]

The standard implication from $P = W$ to perverse multiplicativity #cite(label("dCMSJAMS2022")) Section 0.4.3,
  equation (10) now applies to the full fixed-determinant cohomology.

#thm([Corollary 9.3.])[
  (Multiplicativity of the perverse filtration).  #emph[In the setting of the all-rank corollary above,
    use the normalization (1.2). For all $i \, j gt.eq 0$ and $a \, b in bb(Z)$,
$ P_a H^i \( X \, bb(Q) \) smile P_b H^j \( X \, bb(Q) \) subset.eq P_(a + b) H^(i + j) \( X \, bb(Q) \) . $

 Put $Gamma = "Pic"^0 \( C \) \[ n \]$ and $P_a H^i \( X \, bb(C) \) = P_a H^i \( X \, bb(Q) \) ⊗_(bb(Q)) bb(C)$.
   For the pullback-action isotypic parts indexed by $chi \, psi in hat(Gamma) =
   "Hom" \( Gamma \, bb(C)^times \)$, one also has
$ #scale(x: 120%, y: 120%)[\(] P_a H^i \( X \, bb(C) \) #scale(x: 120%, y: 120%)[\)]_chi smile
  #scale(x: 120%, y: 120%)[\(] P_b H^j \( X \, bb(C) \) #scale(x: 120%, y: 120%)[\)]_psi subset.eq
  #scale(x: 120%, y: 120%)[\(] P_(a + b) H^(i + j) \( X \, bb(C) \) #scale(x: 120%, y: 120%)[\)]_(chi psi) . $

 This includes trivial and distinct characters, with the same normalized $P$ on every character summand.]
] <cor:perverse-multiplicativity>

#proof[
  The nonabelian-Hodge diffeomorphism induces a graded ring isomorphism $eta : H^(*) \( X^B \, bb(Q) \) arrow.r
    H^(*) \( X \, bb(Q) \)$ #cite(label("HT2003")) Sections 2 and 5.
    Cup product is a morphism of mixed Hodge structures #cite(label("Deligne1974")) Corollaire (8.2.11),
    so it sends $W_(2 a) H^i \( X^B \, bb(Q) \) smile W_(2 b) H^j \( X^B \, bb(Q) \)$ into $W_(2 \( a + b \))
    H^(i + j) \( X^B \, bb(Q) \)$. Transport by $eta$ and the all-rank $P = W$ equality give the first assertion.
    The filtration is $Gamma$-stable, and $gamma^(*) \( alpha smile beta \) =
    gamma^(*) alpha smile gamma^(*) beta$ multiplies the two eigencharacters, giving the second assertion. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
