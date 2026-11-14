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

#align(center)[#text(size: 16pt, weight: "bold")[Virasoro Constraints for Projective Complete Intersections]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Virasoro conjecture organizes the descendant Gromov–Witten invariants of a smooth projective variety into a
  system of differential equations. Its simplest instance is the intersection theory of the moduli spaces of
  curves: Witten’s conjecture and Kontsevich’s theorem identify the corresponding generating function with the
  distinguished solution of the KdV hierarchy #cite(label("Witten1991")) #cite(label("Kontsevich1992")).
  Eguchi, Hori, and Xiong proposed a target-dependent Virasoro system for Fano varieties #cite(label("EHX1997")).
  Eguchi, Jinzenji, and Xiong extended the free-field formulation to odd and off-diagonal Hodge classes,
  crediting Katz’s proposal to use a Hodge index in the grading #cite(label("EJX1998")).
  We use the first-Hodge-degree superspace operators and central normalization of Getzler #cite(label("Getzler1999")).

For a smooth projective variety $X$, let $F_g^X \( t \)$ be the generating series of its ordinary,
  unreduced genus-$g$ descendant invariants. The variables $t_m^a$ record insertions $tau_m \( phi.alt_a \)$ for a
  homogeneous cohomology basis ${ phi.alt_a }$, and Novikov variables record curve classes.
  The total descendant potential is

$ Z_X \( t \) = exp #h(-0.16667em) (sum_(g gt.eq 0) ℏ^(g - 1) F_g^X \( t \)) . $

The conjecture asserts

$ L_k^X Z_X = 0 wide \( k gt.eq - 1 \) \, $

where the target-dependent differential operators $L_k^X$ are formed from the Poincaré pairing,
  the first Hodge index $p$ on $H^(p \, q) \( X \)$, and cup product with $c_1 \( T X \)$.
  Their precise quantization, super signs, and scalar normalization are fixed in 2.
  All equations are formal coefficientwise identities.

#prodef([Theorem 1.1.])[
  #emph[Let $X subset bb(P)_(bb(C))^N$ be a smooth complete intersection.
    Its ordinary, unreduced total descendant potential satisfies the Virasoro constraints in every genus and curve
    class, with arbitrary insertions from $H^(*) \( X \; bb(C) \)$.]
] <thm:main>

Thus 1 resolves the Virasoro conjecture positively for projective-space complete intersections.
  Primitive and odd insertions are included, with no semisimplicity hypothesis.

The genus-zero constraints are known in general. Liu and Tian proved the decisive $L_1$ and $L_2$ identities for
  even-class inputs without a Fano hypothesis #cite(label("LiuTian1998")) Theorem 0.2.
  Dubrovin and Zhang proved the genus-zero Frobenius-manifold formulation and the semisimple genus-one case
  #cite(label("DubrovinZhang1999")) Main Theorem; Getzler treated the genus-zero superspace formulation used here
  #cite(label("Getzler1999")) Section 4.

Several all-genus cases are also established. Getzler proved the ordinary constraints for Calabi–Yau targets with
  $c_1 \( X \) = 0$ and $H^1 \( X \) = 0$ #cite(label("Getzler1999")) Theorem 7.1.
  Okounkov and Pandharipande proved the fixed-degree relative constraints for target curves,
  including odd descendants #cite(label("OP2003")) Theorem 3.
  Givental’s quantized semisimple construction, together with Teleman’s classification,
  covers the corresponding homogeneous semisimple geometric theories #cite(label("Givental2001"))
  #cite(label("Teleman2012")). More recently, Guo, Zhang, and Zhou proved genus-one constraints on the ambient
  state space of smooth Fano complete intersections and announced further full-cohomology genus-one extensions for
  several families, with details deferred to a forthcoming paper #cite(label("GuoZhangZhou2026")) Theorem 1 and
  Remark 3.10. The present argument addresses all genera and all insertions simultaneously through degeneration.

=== 1.1 Degeneration and primitive cohomology <degeneration-and-primitive-cohomology>

Degeneration expresses Gromov–Witten invariants through relative invariants of simpler pieces
  #cite(label("Li2001")) #cite(label("Li2002")) #cite(label("AF2016")).
  Relative reconstruction and equation splitting were developed by Maulik and Pandharipande
  #cite(label("MaulikPandharipande2006")). Argüz, Bousseau, Pandharipande,
  and Zvonkine used nodal invariants to reconstruct the full Gromov–Witten theory of complete intersections by
  induction on dimension and defining degrees #cite(label("ABPZ")) Theorem 5.3 and Section 5.3.
  We use the same geometric reduction; the additional objective is to transport the Virasoro equations,
  including their first-Hodge-weighted contractions.

The reduction has two stages. Factoring one defining equation and resolving the resulting family gives a degeneration

$ X arrow.r.squiggly U union_D tilde(M) \, wide tilde(M) = "Bl"_S M . $

Here $U$ and $M$ are complete intersections of smaller defining degree,
  while the seam $D$ and blowup center $S$ have smaller dimension.
  We first prove the constraints for $tilde(M)$ from those for $M$ and projective-bundle towers over $S$.
  We then prove them for $X$ from those for $U$, $tilde(M)$, and a ruled bundle over $D$.
  The needed bundles are towers of projectivizations of sums of line bundles,
  so toric-bundle transfer supplies their constraints from those of their bases #cite(label("CGT")).
  8 carries out this induction and verifies the first-Hodge convention in the bundle transfer.

Two difficulties prevent an immediate deduction from the numerical degeneration formula.
  Primitive insertions need not extend individually through a degeneration.
  Moreover, the Virasoro operators weight contracted indices by their first Hodge degrees,
  so their contractions cannot be treated as ungraded diagonal insertions.
  For fixed genus, degree, and descendant orders, we regard the coefficient of $L_k^X
  Z_X$ as a multilinear error tensor in its cohomology inputs.
  We transport scalar contractions of this tensor with coherently extending classes of fixed Hodge type,
  graded inverse pairings, and ordinary Gromov–Witten tensors from independent copies of the theory.
  These are the tests that will detect the error without extending each primitive input.

=== 1.2 The transport argument <the-transport-argument>

The transport needed in both stages rests on three constructions.

First, contractions are performed on the first page of the weight spectral sequence.
  Its pairing is perfect at the level of complexes and has an inverse tensor supported at vertices and edges of
  the degeneration graph. The first Hodge degree, including Tate twists, commutes with its differential.
  Multiplicative comparison and trace then evaluate the contracted tensor without choosing representatives in the
  surviving cohomology. We use Steenbrink’s limiting mixed Hodge structures and Fujisawa’s ordered model,
  multiplicative comparison, and trace #cite(label("Steenbrink1976")) #cite(label("Steenbrink1977"))
  #cite(label("Fujisawa2008")) #cite(label("Fujisawa2014")).

For this calculation, the virtual class pushed forward by evaluation at the recorded markings must extend to a
  resolved product of the family. Configurations of points on common expansions provide that product
  #cite(label("AFConfigurations")). We compute its component restrictions by virtual splitting before integration,
  keeping the recorded markings’ component assignments. When disconnected groups of maps are separated,
  we retain the joint evaluation of the group carrying those markings.
  These correspondence statements are stronger than a numerical degeneration identity and are proved in 4.

Second, relative caps reproduce the contact pairing at a seam.
  Ordinary descendants on one cap realize functionals on a bounded incoming contact space;
  descendants on the other prepare the corresponding states with all unwanted outgoing profiles canceled.
  The nonzero projective-space fiber invariants of Hu, Li, and Ruan #cite(label("HLR2008")) give the invertible
  linearization from which the full disconnected cap construction begins.
  In the blowup configuration, corrections of counting degree zero strictly decrease contact.
  Together with degree bounds, this makes every required inversion coefficientwise finite.

Insert many widely separated switches into a degeneration with a long chain of ruled components.
  At a switch, either keep the original joining or separate the two sides and add the prepared caps.
  The cap tests may use many auxiliary markings, but their ordinary insertions are integrated into the evaluation
  correspondence. A quadratic Virasoro operator modifies at most two existing labels.
  Thus the exposed cohomological operations occupy a bounded number of positions,
  independently of the auxiliary markings. The alternating sum over switch choices cancels by toggling the first
  switch away from these positions; see 1. Every nonempty surgery subset smooths to a disjoint union of the
  shorter targets described above, whose absolute constraints are known.
  The cancellation therefore proves every such scalar test of the error on the original target.

Third, these tests detect all primitive tensors. Hodge–Riemann gives a positive Hermitian form on primitive middle
  cohomology. Pairing a Virasoro error tensor with its conjugate in a second replica produces its squared norm.
  The contraction is among the allowed tests, and positivity forces the tensor itself to vanish.
  This argument has no bound on the number of primitive insertions.

Transport initially gives coefficients selected by the divisor degrees that extend coherently through the
  degenerations. To obtain the asserted result in each curve class,
  we verify that these degrees separate all relevant classes,
  retaining additional divisor degrees for exceptional surfaces and blowups.
  Deformation invariance and the same scalar-test argument then give the constraints on every smooth member.
  These are part of the final induction, not extra hypotheses on 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((1.35, 0.35), (3.15, 1.25), fill: rgb("#fff4e8"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  rect((8.2, 0.35), (10, 1.25), fill: rgb("#fff4e8"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10), radius: 3pt)
  content((2.25, 1.3), [#text(size: 7pt)[operation positions]], anchor: "south", padding: 0.1176cm)
  content((9.1, 1.3), [#text(size: 7pt)[operation positions]], anchor: "south", padding: 0.1176cm)
  content((0, 0.65), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$U$]])])
  content((1.8, 0.65), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$C$]])])
  content((3.55, 0.65), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$C$]])])
  content((6.85, 0.65), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$C$]])])
  content((8.6, 0.65), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$C$]])])
  content((10.4, 0.65), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$V$]])])
  line((0.34, 0.65), (1.46, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.14, 0.65), (3.21, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.89, 0.65), (6.51, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.19, 0.65), (8.26, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.94, 0.65), (10.06, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.2, 0.25), (5.2, 1.07), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"))
  content((5.2, 1.07), [#text(size: 7pt)[idle switch]], anchor: "south", padding: 0.1176cm)
  line((5.2, -0.05), (5.2, -0.65), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.4, -0.37), [#text(size: 9pt)[toggle]], anchor: "west", padding: 0.1176cm)
  content((0, -1.25), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$U$]])])
  content((1.8, -1.25), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$C$]])])
  content((3.55, -1.25), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$C$]])])
  content((6.85, -1.25), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$C$]])])
  content((8.6, -1.25), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$C$]])])
  content((10.4, -1.25), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[$V$]])])
  content((4.6, -1.25), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#edf6ed"), [#set text(hyphenate: false); #align(center + horizon)[$Q$]])])
  content((5.8, -1.25), [#box(width: 0.68cm, height: 0.55cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#edf6ed"), [#set text(hyphenate: false); #align(center + horizon)[$P$]])])
  line((0.34, -1.25), (1.46, -1.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.14, -1.25), (3.21, -1.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.89, -1.25), (4.26, -1.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((6.14, -1.25), (6.51, -1.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.19, -1.25), (8.26, -1.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.94, -1.25), (10.06, -1.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.2, -1.65), (6.2, -1.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.2, -1.82), [#text(size: 7pt)[identity cap tests]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: One idle switch in the transport argument. Here $U \, V$ are the ends, $C$ is a ruled neck, and $P \, Q$ are replacement caps; see 27. The marked neighborhoods carry the fixed cohomological operations. At a switch outside those neighborhoods, the prepared combination of cap tests reproduces the original contact identity. Toggling that switch changes the inclusion–exclusion sign and preserves the retained tensor data. ],
) <fig:sewing>

=== 1.3 Organization and scope of the inputs <organization-and-scope-of-the-inputs>

2 specifies the operators, tensor tests, and completions.
  Section 3, Section 4 establish the local Hodge calculation and its evaluation correspondence.
  5 constructs the cap tests, and 6 proves their transport theorem. 7 gives the positivity detector.
  8 assembles these results in the complete-intersection induction, including the surface and curve-class arguments.

Established degeneration, limiting-Hodge, toric-bundle, and intersection-theoretic results are used with their
  stated hypotheses. The local correspondence calculation, bounded cap preparation, grouped switch cancellation,
  and primitive tensor detector are proved here. In particular,
  the sewing theorem is not attributed to the numerical degeneration formula.
  The toric-bundle step explicitly passes from a half-total-degree convention to first Hodge degree at
  Hodge-neutral auxiliary parameters, with the corresponding central normalization.

== 2 Operators, tensor tests, and conventions <sec:conventions>

=== 2.1 The descendant theory <the-descendant-theory>

All varieties are smooth and projective over $bb(C)$, unless they occur as fibers of a specified semistable
  family. Cohomology has complex coefficients and its usual parity.
  Tensor products, symmetric powers, permutations, and derivatives are taken in super vector spaces.
  For a target $X$ of complex dimension $n$, write

$ \( a \, b \)_X = integral_X a union b \, wide mu_X \|_(H^(p \, q) \( X \)) = \( p - n \/ 2 \) upright("id") \,
  wide cal(R)_X \( a \) = c_1 \( T X \) union a . $

The pairing is perfect and even. Its coevaluation is the categorical inverse of this pairing;
  it includes the signs dictated by the super symmetry. We never insert a second parity involution into a node kernel.

Choose a Hodge-homogeneous basis ${ phi.alt_a }$ and let $t \( z \) = sum_(m gt.eq 0 \, a) t_m^a phi.alt_a z^m$,
  where $t_m^a$ has the parity of $phi.alt_a$. The connected potentials and total descendant potential are

#[#set math.equation(numbering: n => "(2.1)")
 $ F_g^X \( t \) & = sum_beta sum_(r gt.eq 0) frac(sans(Q)^beta, r !)
   integral_(\[ overline(cal(M))_(g \, r) \( X \, beta \) \]^(upright("vir"))) product_(i = 1)^r
   (sum_(m \, a) t_m^a psi_i^m "ev"_i^(*) phi.alt_a) \,\
Z_X \( t \) & = exp (sum_(g gt.eq 0) ℏ^(g - 1) F_g^X \( t \)) . $ <eq:potential>]

Only stable maps contribute. The $psi_i$ are cotangent classes at markings on the source of the stable map,
  not classes pulled back by stabilization to curves. In particular,
  the same convention is used in relative theories and in the fiber calculation below.

Equation (2.1) packages disconnected domains, with the empty domain contributing $1$.
  We use labelled coefficient extraction to discuss multilinear tensors:
  distinct formal variables distinguish all prescribed insertions, even when their values coincide.
  This convention accounts automatically for the factorials in (2.1).

All statements are coefficientwise. Fixing an ample integral curve degree, a finite list of markings,
  and a genus coefficient leaves finite sums of effective curve classes and discrete stable-map data.
  In intermediate relative theories we impose the additional contact and end-degree bounds specified in the cap
  construction. Laurent series in $ℏ$ are always bounded below at the finite auxiliary-variable and degree orders
  in use. For several replicas, the genus and curve variables are independent.
  The cap construction proves the corresponding boundedness when the counting polarization is only relatively ample.

=== 2.2 The positive Virasoro operators <the-positive-virasoro-operators>

Let

$ cal(H)_X = H^(*) \( X \) \( \( z^(- 1) \) \) \, wide Omega_X \( f \, g \) =
  "Res"_(z = 0) \( f \( - z \) \, g \( z \) \)_X thin d z . $

With the standard polarization $cal(H)_X = H^(*) \( X \) \[ z \] xor z^(- 1) H^(*) \( X \) \[ \[ z^(- 1) \] \]$, set

#[#set math.equation(numbering: n => "(2.2)")
 $ ell_0 = z partial_z + 1 / 2 + mu_X + cal(R)_X / z \, wide ell_k =
   ell_0 \( z ell_0 \)^k quad \( k gt.eq 1 \) . $ <eq:loop-operators>]

These are infinitesimal symplectic operators. For example, $mu_X^(*) = - mu_X$, $cal(R)_X^(*) = cal(R)_X$,
  and the sign from $z mapsto - z$ gives the required adjoints.
  The quadratic Hamiltonian of $ell_k$ is quantized with normal ordering.
  In Darboux coordinates this sends terms $p p \, p q \, q q$, respectively, to $ℏ$ times second derivatives,
  first-order vector fields, and multiplication by a quadratic polynomial divided by $ℏ$. Apply the dilaton translation

$ q \( z \) = t \( z \) - z thin 1_X . $

Up to the harmless simultaneous operator-sign convention,
  these are the positive operators $L_k^X$ in Getzler’s formulation #cite(label("Getzler1999")) Equation (1.2).
  There is no central scalar correction for $k > 0$. We fix the signs by that reference when invoking the Virasoro
  commutators.

For clarity, the proof uses the following finite description rather than a coordinate expansion of every coefficient.

#prodef([Proposition 2.1.])[
  (Positive coefficient rule).  #emph[A labelled coefficient of $L_k^X Z_X$, for fixed $k > 0$,
    is a finite linear combination of the following operations on the disconnected Gromov–Witten tensors:]
  + #emph[add one special unit marking, with prescribed descendant and $cal(R)_X$-powers;]
  + #emph[act on one existing marking, changing its descendant exponent and applying an $cal(R)_X$-power,
    with a coefficient polynomial in its first Hodge degree;]
  + #emph[add two markings joined by the coevaluation of $\( thin \, thin \)_X$, with descendant powers,
    first-Hodge-degree polynomials, and $cal(R)_X$-powers on its legs;]
  + #emph[remove two primary markings, leaving their two cohomology inputs in the classical pairing with
    $cal(R)_X^(k + 1)$, multiplied by the remaining disconnected Gromov–Witten tensor.]
  #emph[The numerical coefficients and genus powers are universal for targets of fixed dimension.
    At most two existing labels are used nonordinarily in one summand.]
] <conv:positive-rule>

#proof[
  Expand $ell_0 \( z ell_0 \)^k$ using $\[ z partial_z \, z \] = z$ and $\[ mu_X \, cal(R)_X \] = cal(R)_X$.
    The resulting coefficients are polynomials in the first Hodge index, composed with Chern-class powers.
    The three blocks of its quadratic Hamiltonian give the last three types of operation under normal ordering;
    the dilaton shift gives the special unit marking. The block with both variables on the positive polarization
    has its only relevant negative shift at the primary pair, giving the classical $cal(R)_X^(k + 1)$-pairing.
    This is also the three-block decomposition in the cited coordinate formula.
    Since the Hamiltonian is quadratic, at most two existing labels are involved.
    Super quantization uses the same calculation with graded derivatives and permutations. ◻
]

The two lower operators are the standard string operator $L_(- 1)$ and the quantization of $ell_0$ with scalar

$ C_X = frac(chi \( X \), 16) - 1 / 4 "str" \( mu_X^2 \) \, $

in Getzler’s first-Hodge convention; its Chern-number form appears in (8.3).
  The nonpositive constraints require no new transport theorem. The string equation gives $L_(- 1) Z_X = 0$.
  Together with $L_1 Z_X = 0$, the commutator $\[ L_1 \, L_(- 1) \] = 2 L_0$ gives $L_0 Z_X =
  0$ with this normalization. Equivalently one may use the usual dilaton, homogeneity, divisor,
  and genus-one Riemann–Roch identities. We therefore prove all positive constraints.

=== 2.3 Admissible scalar tests <admissible-scalar-tests>

An #emph[ordinary replica] means a separate copy of a disconnected Gromov–Witten tensor,
  with its own genus and degree variables. A #emph[tested positive constraint] consists of one coefficient rule
  from 2, applied to one specified replica, followed by a finite tensor contraction using:

+ ordinary replicas and classical cup integrals;
+ single classes obtained from algebraic classes on the relevant total families,
  allowing complex linear combinations and including units and Chern-class powers,
  or from homogeneous cohomology classes of fixed smooth projective sources through algebraic correspondences
  extending over those total families and inducing flat Hodge maps on their smooth loci;
+ coevaluations joining arbitrary pairs of slots, possibly on different replicas;
+ polynomials, or functions on the finite spectrum, of the first Hodge degree on any exposed leg;
+ cups with admissible single classes and numerical coefficients.

The arities of this test are fixed. Only the chosen replica is acted on by $L_k$;
  the test is then applied linearly to its coefficients. The test may be different for each coefficient that is to
  be proved zero.

When auxiliary cap markings are later inserted in the chosen replica, $L_k$ acts on those variables as well.
  Their ordinary occurrences are preintegrated into the evaluation correspondence.
  If the coefficient rule modifies one of them, or removes it into a classical pairing,
  it is exposed as an additional position. By 2, there are at most two such positions.
  Auxiliary cap labels on other replicas remain ordinary.

All contractions can be decomposed into homogeneous Hodge types.
  For a single supplied by a fixed smooth projective source,
  keep its cohomology slot exposed until the extending algebraic correspondence has been specialized;
  the homogeneous input itself need not be algebraic. A topologically extending class alone is not sufficient:
  its Hodge components need not be flat. Nor do we assert tested transport for an arbitrary flat Hodge
  correspondence without the specified algebraic extension over the total family.
  The first-index operations are permitted only in balanced numerical diagrams:
  the types of the algebraic correspondences, cups, and pairings must match the total input and output types.
  The limiting-Hodge calculation below explains why these numerical contractions are constant in smooth families
  and admit the required graded specialization.

#prodef([Definition 2.2.])[
  (Coherent data).  Admissible singles and numerical divisor-degree tests on several degenerations are
    #emph[coherent] if their restrictions agree on the common local component and stratum diagrams used in the
    comparison. For source-supplied singles this agreement is required for the specified extending algebraic
    correspondences with their cohomology slots exposed, before applying the fixed inputs.
    A class supported at a specified unaffected end is taken to have zero restriction on the other ends and
    replacement caps.
] <conv:coherent>

The Chern-class insertion always has a coherent choice. The extension $-
  c_1 \( omega_(cal(Y) \/ B) \)$ restricts on a component $Y_i$ with boundary $D_i$ to
  $c_1 \( T Y_i \) - \[ D_i \]$, the logarithmic first Chern class. The local calculations use this class.
  They do not replace it silently by $c_1 \( T Y_i \)$.

The tensor manipulations do not require individual primitive insertions to extend.
  They use full coevaluations and finitely many coherent singles;
  the final detection argument recovers arbitrary primitive inputs only on the target being proved.

== 3 First-page contractions and locality <fp:section>

The inverse Poincaré pairing on a nearby fiber need not have a useful expression in terms of surviving classes on
  the components of a degeneration. We instead use an inverse pairing on a complex.
  Its individual terms have small support, although only their sum is closed. The distinction is essential:
  we identify a numerical contraction using the closed sum, and subsequently expand that sum into local terms.

Throughout this section, $pi : cal(Y) arrow.r Delta$ is a projective semistable family of relative dimension $n$,
  with smooth total space. Its central fiber $Y = union.big_(v in V)
  Y_v$ has smooth components and no triple intersections. Its dual graph is bipartite.
  We orient each edge from color $0$ to color $1$. An edge $e$ denotes a connected component $D_e$ of a double
  locus; its two inclusions are $i_(e \, 0)$ and $i_(e \, 1)$. Disconnected total spaces are allowed.
  All cohomology is rational unless complex coefficients or Hodge decompositions are specified.
  The Tate structure $bb(Q) \( - 1 \)$ has Hodge type $\( 1 \, 1 \)$.
  The parity in a complex is its #emph[total] cohomological degree.

=== 3.1 The three-column complex <the-three-column-complex>

We use the weight spectral sequence with indexing

#[#set math.equation(numbering: n => "(3.1)")
 $ E_1^(- 1 \, b) = xor.big_e H^(b - 2) \( D_e \) \( - 1 \) \, wide E_1^(0 \, b) = xor.big_v H^b \( Y_v \) \, wide
   E_1^(1 \, b) = xor.big_e H^b \( D_e \) . $ <fp:eone>]

All other columns are zero. The differential $d_1$ increases the first index by one and preserves the second.
  Write $C_Y = "Tot" \( E_1 \, d_1 \)$. There are identifications

#[#set math.equation(numbering: n => "(3.2)")
 $ C_Y^k = xor.big_v H^k \( Y_v \) xor xor.big_e H^(k - 1) \( D_e \) xor xor.big_e H^(k - 1) \( D_e \) \( - 1 \) .
   $ <fp:total-complex>]

Denote the last two kinds of elements by $a$ and $b$, respectively.
  We choose the signs of the residue identifications so that

#[#set math.equation(numbering: n => "(3.3)")
 $ d \( v \, a \, b \) = \( gamma b \, rho v \, 0 \) \, wide \( rho v \)_e = i_(e \, 1)^(*) v_1 -
   i_(e \, 0)^(*) v_0 \, wide gamma b = sum_e #scale(x: 120%, y: 120%)[\(] - i_(e \, 0 *) b_e +
   i_(e \, 1 *) b_e #scale(x: 120%, y: 120%)[\)] . $ <fp:differential>]

Here a term of $gamma$ belongs to the indicated component summand.
  These conventions are isomorphic to the usual residue conventions by signs on the summands.

For completeness, $rho gamma = 0$ can be seen directly. Distinct double loci on a fixed component are disjoint.
  At $D_e$, the remaining composition is multiplication by $c_1 \( N_(D_e \/ Y_0) \) + c_1 \( N_(D_e \/ Y_1) \)$,
  which is zero because the two normal bundles are dual in a semistable smoothing. Thus (3.3) is a differential.

The Steenbrink theorem identifies

#[#set math.equation(numbering: n => "(3.4)")
 $ H^k \( C_Y \) = xor.big_a E_2^(a \, k - a) = xor.big_a "Gr"_(k - a)^W H^k \( Y_t \)_(upright("lim")) \,
   $ <fp:abutment>]

with its pure Hodge structures and the displayed Tate twists;
  the weight spectral sequence degenerates at $E_2$ #cite(label("Steenbrink1976")) #cite(label("Steenbrink1977")).
  Here $W$ on the right is the usual weight filtration of the limiting mixed Hodge structure.
  In filtered-complex notation below, this incorporates the usual shift by cohomological degree.

#prodef([Lemma 3.1.])[
  (The first-page pairing).  #emph[The complex $C_Y$ has a perfect graded-symmetric chain pairing of degree $2
    n$ and Tate type $bb(Q) \( - n \)$. On elements of total degrees $k$ and $2 n - k$ it is
#[#set math.equation(numbering: n => "(3.5)")
 $ B_Y #scale(x: 120%, y: 120%)[\(] \( v \, a \, b \) \, \( w \, a' \, b' \) #scale(x: 120%, y: 120%)[\)] =  &
   sum_v integral_(Y_v) v_v union w_v + \( - 1 \)^k sum_e integral_(D_e) a_e union b'_e\
 & + \( - 1 \)^(k + 1) sum_e integral_(D_e) b_e union a'_e . $ <fp:pairing-formula>]

 It induces the weight-graded nearby Poincaré pairing under (3.4).
   Its categorical inverse-pairing tensor $Delta_(C_Y)$ is closed and is a sum of tensors supported on a single
   vertex or a single edge.]
] <fp:pairing>

#proof[
  Perfection follows from Poincaré duality on the smooth projective $Y_v$ and $D_e$.
    The edge summands pair with one another, not with themselves.
    Ordinary cup-commutativity gives graded symmetry with respect to total degree.
    The projection formula says that $gamma$ is transpose to $rho$ before the shift signs.
    If $x$ is in a component summand of degree $k$ and $y$ is in a $b$ summand of degree $2 n - k - 1$, the two terms of
  #[#set math.equation(numbering: n => "(3.6)")
   $ B_Y \( d x \, y \) + \( - 1 \)^k B_Y \( x \, d y \) = 0 $ <fp:chain-pairing>]
  are $\( - 1 \)^(k + 1) integral rho x union y$ and $\( - 1 \)^k integral rho x union y$. They cancel.
    The case with the $b$ summand first follows in the same way, and all other cases vanish.
    This proves the chain identity.
  We specify the compatibility with nearby integration below, in 9;
    it uses the multiplicative comparison and trace of Fujisawa.
    The residue calculation identifying that trace pairing with (3.5) is #cite(label("Fujisawa2014")) Lemma 6.13
    and proof of Theorem 8.11, after the sign choices in (3.3).
    Thus this compatibility does not require choosing representatives for the groups in (3.4).
  A perfect chain pairing identifies a finite complex with its shifted dual.
    Under this identification its inverse-pairing tensor corresponds to the identity chain map.
    It is therefore closed. Finally, (3.5) is block diagonal by vertices and by edges,
    so its inverse has the asserted support. All inverse tensors here and below use the categorical Koszul convention. ◻
]

#prodef([Lemma 3.2.])[
  (First Hodge index).  #emph[On $C_Y ⊗ bb(C)$, let $P$ act by the first Hodge index, including the Tate twist.
    Then $P d = d P$. Consequently $\( f \( P \) ⊗ upright("id") \)
    Delta_(C_Y)$ is closed for every function $f$ on the finite spectrum of $P$.]
] <fp:first-index>

#proof[
  A restriction preserves Hodge type. A Gysin map raises both Hodge indices by one,
    exactly as does the twist in its source $b$ summand. Thus both arrows of (3.3) preserve the first index.
    The last assertion follows by applying a chain map to a closed tensor.
    Notice that the total cohomological degree operator does not have this property: $d$ raises total degree by one. ◻
]

#prodef([Example 3.3.])[
  Let two rational curves meet in $m$ nodes, where $m = 1$ or $2$.
    Choose component units $u_0 \, u_1$, top classes $t_0 \, t_1$, and node generators $a_e \, b_e$. Then
  $ d u_0 = - sum_e a_e \, wide d u_1 = sum_e a_e \, wide d b_e = - t_0 + t_1 . $
  The first Hodge indices of $u \, a \, b \, t$ are $0 \, 0 \, 1 \, 1$. The inverse tensor is
  $ Delta_(C_Y) = sum_(i = 0)^1 \( u_i ⊗ t_i + t_i ⊗ u_i \) + sum_(e = 1)^m \( a_e ⊗ b_e - b_e ⊗ a_e \) . $
  Its differential vanishes by cancellation between vertex and edge terms.
    For $m = 1$ the cohomology dimensions are $\( 1 \, 0 \, 1 \)$; for $m = 2$ they are $\( 1 \, 2 \, 1 \)$.
    Thus the construction includes the graph contribution to nearby $H^1$.
    Individual vertex and edge terms are usually not closed.
] <fp:curve-example>

=== 3.2 Filtered multiplicative models and ordered pullbacks <filtered-multiplicative-models-and-ordered-pullbacks>

We use the ordered polynomial-log model of #cite(label("Fujisawa2008")) Sections 4.14–4.19 and 5.4,
  Proposition 5.8. In that model each nonempty subset of component indices occurs once, in its increasing order.
  This choice matters: it is not the unrestricted complex of all injective ordered tuples.
  Let $A_Z$ be the Steenbrink complex for a projective semistable central fiber $Z$,
  now allowing higher intersections, and write $K_Z$ for this ordered model.
  The standard hypotheses are properness and smooth Kähler components, which hold for our projective models.
  The comparison used below is a bifiltered map

#[#set math.equation(numbering: n => "(3.7)")
 $ phi.alt_Z : A_Z arrow.r K_Z $ <fp:comparison>]

inducing the limiting mixed-Hodge isomorphism and an isomorphism on second weight pages.
  We give the ordered interpretation of this comparison and of the trace explicitly,
  so no identification of different Čech conventions is implicit.

Here is the structure of the model that will be used. If $I$ is a nonempty set of component indices,
  $Z_I$ is their intersection with the induced absolute log structure and $omega_(Z_I)$ its absolute log de Rham
  complex. The local terms are

$ bb(C) \[ u \] ⊗ omega_(Z_I) \, wide nabla = 1 ⊗ d + \( 2 pi sqrt(- 1) \)^(- 1) partial_u ⊗ \( d log s and \) . $

Their component Čech total complex is $K_Z$. A power $u^r$ has weight $2 r$ and first Hodge degree $r$.
  In Čech degree $j$ its filtrations are

#[#set math.equation(numbering: n => "(3.8)")
 $ W_m K_Z & = sum_(r gt.eq 0) u^r ⊗ W_(m + j - 2 r) omega_(Z_I) \, & F^p K_Z & =
   sum_(r gt.eq 0) u^r ⊗ F^(p - r) omega_(Z_I) . $ <fp:k-filtrations>]

The $W$ on forms counts logarithmic factors. Residues describe its graded pieces by ordinary forms on closed
  intersections. The map $phi.alt_Z$ is a sum of residue maps multiplied by divided powers of $u$,
  with universal signs and Tate factors. Its summands only involve incident strata #cite(label("Fujisawa2014"))
  Definition 5.24 and Lemma 5.25.

Multiplication in $K_Z$ is polynomial multiplication, wedge product,
  and the ordered Čech Alexander–Whitney product, with its total-complex signs.
  The formulas in #cite(label("Fujisawa2014")) Sections 6.1–6.8 apply to increasing tuples:
  the two overlapping subtuples of an increasing tuple are increasing.
  Thus the product is a chain map preserving both filtrations.
  Evaluation at $u = 0$ followed by passage to relative log forms respects this product,
  so its cohomological product is ordinary nearby cup product.

#prodef([Lemma 3.4.])[
  (Ordered comparison).  #emph[The residue formula for $phi.alt_Z$, restricted to increasing tuples,
    gives (3.7) with the properties stated above.]
] <fp:ordered-comparison>

#proof[
  Restriction of a cochain indexed by all injective ordered tuples to increasing tuples commutes with the Čech
    differential, because every face of an increasing tuple is increasing.
    It commutes with the internal differential and preserves Čech degree and the two filtrations.
    Consequently restricting the explicit residue map of #cite(label("Fujisawa2014")) Definition 5.24 and
    Lemma 5.25 gives a bifiltered chain map into the ordered model.
    This conclusion only uses the formula and its chain identity,
    not a quasi-isomorphism assertion for an unrestricted tuple complex.
  Evaluate at $u = 0$ and pass to relative log forms. The comparison square in #cite(label("Fujisawa2014")) proof
    of Theorem 5.29 remains commutative after this restriction:
    its equality is an equality of residue maps on each intersection.
    Its other arrows are the Steenbrink comparison with relative log de Rham cohomology,
    the ordered relative-log Čech resolution #cite(label("Fujisawa2008")) Proposition 4.19,
    and the polynomial-log comparison #cite(label("Fujisawa2008")) Lemma 5.6 and Corollary 5.7.
    All three induce isomorphisms on cohomology. Therefore so does $phi.alt_Z$.
    The rational comparison is obtained by the same restricted Koszul-residue formula,
    and it has the same compatibility with Tate factors as the complex comparison.
    The source is a cohomological mixed Hodge complex, and the ordered target is a weak cohomological mixed Hodge
    complex by #cite(label("Fujisawa2008")) Proposition 5.8. Its cohomology carries the mixed Hodge structure of
    #cite(label("Fujisawa2008")) Theorem 5.9, and its weight spectral sequence degenerates at $E_2$ by
    #cite(label("Fujisawa2008")) Lemma A.6. Thus the cohomological isomorphism is one of mixed Hodge structures.
    Weight degeneration and strictness now give the asserted isomorphism of second pages,
    exactly as in #cite(label("Fujisawa2014")) Corollary 5.30. ◻
]

Let $tilde(cal(Y)^(thin r))$ be the ordered semistable configuration model for $r$ recorded points, as in 16.
  Locally it resolves

$ x_i y_i = s \, wide 1 lt.eq i lt.eq r \, $

by the ordered triangulation of $\[ 0 \, 1 \]^r$. Its vertices are assignments of components to the recorded
  points, and its simplices are chains of assignments in the coordinatewise order.
  Color $0$ precedes color $1$ in each factor. Order all vertices by the number of color-$1$ coordinates,
  breaking ties arbitrarily. This order is strictly increasing on every nonconstant step in such a simplex.
  Each coordinate projection is therefore weakly increasing on each ordered simplex.
  The same statement applies when some coordinates are fixed off the double locus, and on disconnected pieces.
  Only assignments lying on a common simplex matter; there is no comparison of points on disjoint strata.

#prodef([Lemma 3.5.])[
  (Ordered pullbacks).  #emph[Each projection of the ordered configuration model to $cal(Y)$ induces a bifiltered
    chain pullback of the $K$ models. On weight pages its terms are ordinary pullbacks on the relevant
    intersections and the maps on logarithmic generators modulo ordinary forms.
    These terms are determined by the incident strata, their normal data, and the chosen ordering.]
] <fp:pullback>

#proof[
  Write $f$ for the component assignment of a projection. For a source increasing tuple
    $J = \( j_0 \, dots.h \, j_k \)$, the component of the pullback of a Čech cochain $eta$ is
  #[#set math.equation(numbering: n => "(3.9)")
   $ \( f^(*) eta \)_J =
     cases(delim: "{", f_J^(*) eta_(f \( j_0 \) \, dots.h \, f \( j_k \)) \, & f \( j_0 \) < dots.h.c < f \(
     j_k \) \,, 0 \, & upright("some projected vertices repeat") .) $ <fp:cech-pullback>]
  In the second case the tuple is degenerate. Formula (3.9) commutes with the Čech differential:
    if a projected tuple has exactly one adjacent repetition,
    deleting either member produces the same restriction with opposite signs; all other faces remain degenerate.
    More repetitions give zero on both sides, and distinct tuples give the usual pullback identity.
    Weak monotonicity ensures that repetitions are adjacent. This also makes (3.9) compatible with the
    Alexander–Whitney product: a repeated adjacent pair lies in at least one of the two overlapping subtuples used
    by that product.
  On each intersection use the pullback of absolute log forms and set $f^(*) u = u$.
    The morphism is over the same base, so $f^(*) d log s = d log s$; it commutes with $nabla$.
    Ordinary forms pull back to ordinary forms, while a local log generator pulls back to a sum of log generators
    and an ordinary form. Thus log weight and form degree do not increase.
    Every nonzero term of (3.9) retains the same Čech degree, so (3.8) proves preservation of both filtrations.
  Finally, take residues. Ordinary corrections to a logarithmic generator have zero residue,
    and the remaining maps only use its orders along the incident divisors.
    A unit change of a local boundary equation does not change these residue maps.
    This proves the asserted dependence and locality. ◻
]

=== 3.3 Trace and specialization of correspondences <trace-and-specialization-of-correspondences>

If $Z$ has pure dimension $N$, the ordered model has a first-page functional

#[#set math.equation(numbering: n => "(3.10)")
 $ Theta_Z : E_1^(0 \, 2 N) \( K_Z \, W \) arrow.r bb(C) \, wide Theta_Z d_1 = 0 . $ <fp:theta>]

Here is its precise relation to the residue trace of #cite(label("Fujisawa2014")) Section 7.
  Extend an increasing-tuple cochain to all injective ordered tuples by the sign of the sorting permutation;
  denote this map by $"Alt"$. It is a bifiltered chain map,
  since sorting intertwines the alternating face sums and leaves internal differentials and Čech degree unchanged.
  Define $Theta_Z$ as Fujisawa’s explicit first-page functional composed with $"Alt"$.
  The formal identity $Theta d_1 = 0$ in #cite(label("Fujisawa2014")) Proposition 7.9 proves (3.10).
  This use of the identity does not assume that the unrestricted injective-tuple complex computes limiting cohomology.

Equivalently, $Theta_Z$ sums over increasing incidence flags.
  For a flag of length $j + 1$ its coefficient is $\( - 1 \)^(j \( j - 1 \) \/ 2) \( 2 pi sqrt(- 1) \)^j$,
  followed by the residue after $d log s and$ and integration over the closed intersection.
  The $\( j + 1 \) !$ orders in the unrestricted formula cancel its factor $1 \/ \( j + 1 \) !$:
  orientation of the residue and alternating extension have the same sorting sign.
  The functional uses the zero-$u$ part, as in #cite(label("Fujisawa2014")) Equation (7.8.1).
  In particular it is local on incidence flags. Extend it by zero to all other bidegrees of the total first page;
  it is then a chain functional.

The same-stratum pairing calculation also holds in this convention.
  #cite(label("Fujisawa2014")) Lemma 6.13 computes the product followed by residue for one specified ordered
  tuple. On that tuple it vanishes except when the two input residue strata coincide with its underlying
  intersection and their indices are opposite. Restricting that calculation to the increasing tuple and using the
  coefficient just given yields the signed integration pairing.
  This verifies directly the pairing formula used in 4; it does not require the alternating-extension map to
  preserve products.

#prodef([Lemma 3.6.])[
  (Normalization of the trace).  #emph[Normalize the residue and Tate factors so that the trace of an extending
    top class is the sum of its component integrals. Under multiplicative nearby comparison,
    the descended trace is ordinary integration on every connected nearby component.
    The first-page pairing of 4 consequently induces nearby Poincaré duality with this normalization.]
] <fp:trace-normalization>

#proof[
  Let $ell$ be the first Chern class of a relatively ample line bundle.
    On a connected nearby component of dimension $N$, its $N$th power is nonzero and spans top cohomology.
    Its integral is the sum of its integrals over the components of the corresponding central fiber,
    by specialization of a top intersection number. The residue trace has exactly this value by its stated
    normalization. Hence the two traces agree. The argument applies separately to disconnected total families.
    After a finite base change, which does not change the assertion,
    connected components of smooth fibers can be treated separately.
  Multiplicative comparison identifies cup products. Applying the identical traces to cup products identifies the
    pairings. Equivalently, the explicit residue calculation quoted in 4 gives component integration and
    opposite-column integration on the same double stratum, with no cross-stratum terms.
    This also identifies the induced inverse pairings. No comparison between two constructions of polarizations on
    the full limiting mixed Hodge structure is needed for this argument. ◻
]

#prodef([Lemma 3.7.])[
  (The leading specialization of an extending class).  #emph[Suppose $tilde(cal(Y)^(thin r)) arrow.r
    Delta$ is smooth and semistable and carries an algebraic class $Gamma$ of codimension $c$ restricting to a
    prescribed correspondence on the smooth fiber. The induced weight-graded specialization of this correspondence
    is represented on the first page by the ordinary restrictions $Gamma \|_(Z_v)$ to the smooth components of its
    central fiber, inserted through the specialization morphism into $K_Z$.
    The same assertion holds with fixed smooth projective source factors and algebraic correspondences extending
    over the total family, by first exposing their cohomology slots and then applying fixed homogeneous inputs.]
] <fp:leading-class>

#proof[
  The central restriction of $Gamma$ defines a morphism from $bb(Q) \( - c \)$ into central-fiber cohomology,
    and its image in nearby cohomology is obtained by the functorial specialization map.
    For the ordinary central-fiber Čech complex, the weight-$2 c$ part of degree $2 c$ is represented by
  $ #scale(x: 120%, y: 120%)[\(] Gamma \|_(Z_v) #scale(x: 120%, y: 120%)[\)]_v in xor.big_v H^(2 c) \( Z_v \) . $
  The restrictions agree on every double intersection, because they come from one class on the total space.
    Thus this tuple is a cycle in the first ordinary weight differential.
    Higher Čech-degree terms in total degree $2 c$ have smaller weight.
  The map from the ordinary Čech model to the nearby log model sends this tuple to the corresponding zero-log,
    zero-$u$ component restrictions. It is a morphism of filtered complexes and gives the usual specialization on
    cohomology. Taking its weight-$2 c$ graded part gives the asserted representative.
    Strictness of morphisms of mixed Hodge structures ensures that passing to this graded part loses no part of
    the induced map from the pure source. This statement concerns that induced graded map;
    it does not assert that an arbitrary representative in the entire limiting complex has no lower-weight terms.
  For such an extending source correspondence, apply the same argument to each pure cohomology group of its fixed
    source, with the prescribed weight shift. Exposing its inputs before restriction and applying them afterwards
    is the projection formula. This also treats preintegrated admissible homogeneous singles. ◻
]

For GW theory, the hypothesis that $Gamma$ is a class on the smooth #emph[total] configuration family is
  substantial. It is furnished by 16, which constructs the virtual pushforward and computes its component
  restrictions before integration. An arbitrary decomposition of a cycle on the unresolved special fiber would not
  suffice for 10.

=== 3.4 Scalar diagrams on complexes <scalar-diagrams-on-complexes>

We record two algebraic facts that explain why the preceding constructions compute the desired numbers.

#prodef([Lemma 3.8.])[
  (Graded limits of scalar diagrams).  #emph[Consider a closed tensor diagram made from flat Hodge tensors of
    prescribed types, flat singles of fixed Hodge type, pairings and inverse pairings,
    and functions of the first Hodge index on its legs. Assume its total type is that of a scalar.
    Its value on the smooth fibers is locally constant and equals the value obtained on the associated Hodge and
    weight gradeds of the limiting mixed Hodge structures, with all Tate shifts retained.]
] <fp:scalar-limit>

#proof[
  Work in a local flat trivialization. All factors except the Hodge-index projectors are constant.
    The derivative of a projector onto a summand of the Hodge decomposition has only off-diagonal blocks:
    differentiation of $Pi_p^2 = Pi_p$ gives $Pi_p \( d Pi_p \) Pi_p = 0$, and differentiation of $Pi_p Pi_q =
    0$ gives the other diagonal blocks. In a derivative of the closed diagram,
    exactly one such factor has been replaced by an off-first-index block.
    At every other vertex the prescribed Hodge indices balance.
    Summing these balances over the diagram leaves the nonzero index change at the exceptional factor,
    so the resulting scalar contraction is zero. This proves local constancy;
    a function on the finite index spectrum is a linear combination of projectors.
  One may equivalently make the entire contraction on the associated Hodge graded bundles.
    The canonical extensions of the Hodge filtrations in a semistable degeneration are locally free,
    and flat morphisms of variations extend as filtered morphisms.
    Their graded tensor contraction therefore extends with the same scalar value.
    Finally, the limiting objects are mixed Hodge structures.
    Tensor products, duals, and morphisms are strict for their weight filtrations.
    Taking weight gradeds of the closed contraction, whose shifts cancel at the scalar output,
    leaves its value unchanged. Hodge and weight gradeds can be taken successively;
    the resulting double graded spaces retain the first index including every Tate shift. ◻
]

#prodef([Lemma 3.9.])[
  (Contraction on a complex).  #emph[Let $C$ be a finite complex with a perfect chain pairing and let $T$ be a
    chain functional on a tensor product of copies of $C$, possibly with fixed cycles and fixed degree shifts.
    Contract any paired slots against its closed inverse-pairing tensor.
    The resulting scalar is the contraction of the induced functional on cohomology against the induced inverse
    pairing. The assertion is unchanged if a pairing leg is acted on by a chain map.]
] <fp:chain-contraction>

#proof[
  Over a field, the Künneth map identifies the cohomology of a finite tensor product with the tensor product of
    the cohomologies. The inverse-pairing cycle represents the inverse of the induced perfect pairing,
    since the chain-level evaluation and coevaluation identities descend to cohomology.
    The tensor product of all inserted cycles is a cycle. A chain functional annihilates its boundaries,
    so its value depends only on that cohomology class. Applying chain maps to its legs preserves this argument.
    Koszul symmetry gives the same statement for loops: the resulting contraction is the categorical supertrace.
    No splitting of cycles modulo boundaries enters the calculation. ◻
]

#prodef([Proposition 3.10.])[
  (Local first-page algebra).  #emph[Fix the arities of a scalar test as in 2,
    applied to one coefficient operation of 2. For each of its evaluation correspondences,
    assume the extending class and assignment-sensitive component restriction rule of 16.
    Assume its degree tests extend coherently and its singles are coherent admissible singles:
    extending algebraic classes and their complex linear combinations,
    or homogeneous cohomology inputs from fixed smooth projective sources through algebraic correspondences
    extending over the relevant total families and inducing flat Hodge maps on their smooth loci.
    Then its numerical value has an expansion with these properties.]
  + #emph[Each term of its cohomological calculation uses only a bounded number of positions of the dual graph and
    closed incidence neighborhoods of bounded radius. The bounds depend on the fixed arities and dimensions,
    not on the length of inserted chains.]
  + #emph[The terms are obtained from component restrictions of the evaluation classes, pullbacks, cups, residues,
    integrations, and the vertex and edge blocks of $Delta_(C_Y)$.
    A Hodge-graded coevaluation uses one vertex or one edge neighborhood.]
  + #emph[Identical component and stratum diagrams, normal data, orders,
    and restriction classes in these neighborhoods give identical terms, with the same signs and Tate factors.
    Changing the smoothing or its connectedness away from these neighborhoods imposes no extra condition on a term.]
  #emph[Ordinary singles already integrated into an evaluation class need not be counted as exposed positions.
    If an operator subsequently acts on one of those singles, that slot must instead be exposed and counted.]
] <fp:local-algebra>

#proof[
  First use 11 to pass to the Hodge and weight gradeds of nearby cohomology.
    For every coevaluation use the cycle $Delta_(C_Y)$ in the small complex (3.2);
    first-index factors are chain maps by 5. Extending cup classes give chain maps with their usual bidegree shifts.
  For a tensor with $r$ exposed evaluation slots, use its own ordered configuration model.
    Transfer each input by $phi.alt_Y$ and pull it to that model by 8.
    Multiply the inputs in $K_Z$, multiply by the specialization from 10, and apply $Theta_Z$.
    All these operations induce chain maps on first pages, and $Theta_Z$ is a chain functional by (3.10).
    The construction represents the desired cohomological evaluation by multiplicative comparison and 9.
    Use separate models for separate evaluation tensors; only their exposed slots are linked.
    For a classical cup tensor, use $K_Y$ itself, cup all its inputs there, and apply $Theta_Y$.
    The resulting closed diagram is therefore a finite tensor contraction of chain functionals and cycle
    coevaluations. By 12 it equals the original weight-graded contraction.
    An isomorphism on second pages in (3.7) is sufficient: it identifies the induced functionals and pairings,
    while all maps used to perform the calculation go forward.
  Now expand these actual chain maps and tensors into their residue and component summands.
    A block of the inverse pairing uses one vertex or edge. A comparison summand uses an incidence of strata.
    A product summand uses intersecting strata in the ordered Čech diagram.
    A trace summand uses one incidence flag. Finally, a closed stratum of the ordered configuration model projects
    in each target coordinate to one component or to an adjacent double stratum.
    These descriptions prove that each summand is supported in a union of bounded incidence neighborhoods of the
    exposed positions.
  The bounds are uniform. A model with $r$ recorded factors has relative dimension $n
    r$ and consequently bounded lengths of nonempty incidence flags.
    The input weight indices are bounded by the fixed number of legs; by (3.8),
    only bounded powers of $u$ can occur in the relevant weight and total degree.
    For preintegrated source inputs, these are the degrees of the image after the Gysin, descendant,
    and pushforward shifts. That image lies in the cohomology of the retained configuration,
    whose degree range is bounded by its dimension. Thus the same bound applies regardless of the number of
    ordinary auxiliary inputs. Each slot contributes finitely many local index types.
    Increasing the number of components may increase the number of summands,
    but does not enlarge the support or index ranges of any one summand.
    The total number of exposed slots and tensor vertices was fixed in advance. This proves (i) and (ii).
  Every formula just used consists of ordinary maps on these strata, the induced normal data,
    and universal index signs and Tate factors. Unit changes in equations disappear after residue.
    Hence it is unchanged when the specified local diagrams are unchanged, proving (iii).
    At no step did we choose a representative of a surviving nearby class or test whether two positions lie in the
    same connected smooth component. Disconnected spaces are handled by direct sums of their complexes and
    componentwise traces. Thus their cohomological connectedness is already encoded by the differential and its
    closed Casimir.
  Lastly, preintegration changes the coefficient correspondence rather than its exposed arity.
    Its actual extending class and its component restrictions are still the ones supplied by 16.
    Applying a new cohomological operation to one of its markings requires exposing that slot;
    it then contributes one further position. This gives the final assertion. ◻
]

The proposition is a statement about cohomological operations.
  The factorization of an unused collection of relative maps,
  while retaining the joint evaluations of other groups, is the separate virtual statement 19.
  Together these two statements permit the idle-switch comparison in 29.

== 4 Evaluation correspondences on expanded configurations <ev:section>

We construct the extending correspondence required in 13 and determine its restriction to each component.
  The restriction retains a joint evaluation into a configuration space.
  We subsequently prove a product formula which preserves this joint evaluation when other disconnected target
  pieces are integrated out. All virtual classes in this section are ordinary, unreduced classes.

=== 4.1 The configuration family <the-configuration-family>

Let $pi : cal(Y) arrow.r B$ be a projective semistable degeneration over a nonsingular pointed curve
  $\( B \, 0 \)$, with smooth total space and

$ Y_0 = X_0 union_D X_1 . $

The two sides and $D$ may be disconnected; $D$ is a smooth divisor in each side and there are no triple
  intersections. We fix this coloring of the sides. In particular,
  “order” below refers to travel from $X_0$ to $X_1$ along an expanded interval,
  and does not impose an additional ordering on the connected components of $D$.
  All constructions can be restricted to an analytic disk about $0$ after they have been made over $B$.

For a finite set $I$ of recorded ordinary markings, write

$ cal(Q)_I = cal(Y)_pi^(\[ I \]) \, wide q_I : cal(Q)_I arrow.r cal(Y)_B^I $

for the space of stable expanded configurations. Its objects are expansions of $cal(Y) \/
  B$ with $I$-labelled points in their smooth locus, such that every exceptional level contains at least one of
  these points. Points are allowed to coincide. For a smooth pair $\( X \, D \)$,
  use similarly $cal(Q)_I \( X \, D \) = X_D^(\[ I \])$; its points avoid the distinguished relative divisor.
  We set $cal(Q)_diameter = B$ and $cal(Q)_diameter \( X \, D \) = upright("pt")$.

The existence, smoothness, and projectivity of these spaces over the ordinary products are the configuration-space
  results #cite(label("AFConfigurations")) Propositions 1.2.5 and 1.5.4.
  We record the additional local descriptions that we will use.

#prodef([Lemma 4.1.])[
  (Ordered charts and central components).  #emph[The family $cal(Q)_I arrow.r B$ is projective and semistable,
    with smooth total space. Its projections to the factors of $cal(Y)$ are logarithmic maps.
    Let $I = I_0 union.sq I_1$ be an assignment of the recorded marks to the two sides.
    The corresponding central component is canonically
#[#set math.equation(numbering: n => "(4.1)")
 $ Q_(I_0 \, I_1) = cal(Q)_(I_0) \( X_0 \, D \) times cal(Q)_(I_1) \( X_1 \, D \) . $ <ev:component-product>]

 When a side is disconnected, this formula can be restricted to any prescribed connected target component for each
   recorded mark. The aligned configuration space of all marks on a side is retained in this formula.]
] <ev:configuration>

#proof[
  Near a collection of double-locus points, write the fiber product as
  $ x_i y_i = s \, wide 1 lt.eq i lt.eq m = \| I \| \, $
  omitting smooth coordinates along the double loci. For a permutation $sigma$ of the recorded labels,
    an ordered chart has coordinates $a_0 \, dots.h \, a_m$ and equations
  #[#set math.equation(numbering: n => "(4.2)")
   $ x_(sigma \( i \)) = product_(k = 0)^(i - 1) a_k \, wide y_(sigma \( i \)) = product_(k = i)^m a_k \, wide s =
     product_(k = 0)^m a_k . $ <ev:monomial-chart>]
  These are the charts for the subdivision of the cube by ordered coordinates. The simplices are unimodular.
    Thus the total space is smooth and the central fiber is reduced with simple normal crossings.
    Factors away from the double locus are treated by making the appropriate coordinates invertible.
    The projections are monomial in these charts and hence logarithmic.
  The charts have an intrinsic interpretation: put the recorded points on a common expansion and contract
    precisely those exceptional levels containing none of them.
    Ratios of normal coordinates on a retained level record the relative positions of its points.
    Changing a local equation of $D$ multiplies such a coordinate by a unit and changes the normal coordinate by
    the transition function of its divisor line bundle. Consequently the descriptions glue globally.
    They are the configuration spaces above, whose projectivity is supplied by the cited construction.
  The divisor $a_j = 0$ in (4.2) puts the first $j$ marks on one side of a cut and the remaining marks on the
    other. Gluing the distinguished divisors of the two expanded pairs on the right of (4.1) gives a configuration
    in this component. All exceptional levels remain occupied,
    so this gluing does not require a further contraction. Conversely,
    a stable configuration in the indicated component has a unique cut with exactly $I_0$ on the $X_0$ side.
    Two distinct such cuts would enclose an exceptional level containing no recorded point.
    Cutting there recovers the two factors of (4.1). Scheme theoretically, on $a_j =
    0$ the remaining coordinates separate into $a_0 \, dots.h \, a_(j - 1)$ and $a_m \, dots.h \, a_(j + 1)$.
    These are the ordered charts of the left relative configuration and the right relative configuration with
    reversed order. The smooth coordinates along $D$ accompany their respective labels.
    Further vanishing coordinates describe deeper strata inside the two factors.
    This also proves that the constructions commute with base change and are inverse as morphisms.
    There is no additional fiber product over $D$: the divisors of the targets are glued,
    whereas the recorded interior positions have independent projections to $D$.
    If $I_0$ or $I_1$ is empty, its relative configuration is the unexpanded pair with no recorded positions,
    represented by $upright("pt")$.
  For disconnected sides the collapsed evaluation of a point determines its connected component of $X_i$.
    Restricting this locally constant choice gives the last assertion.
    In particular, no independent expansion is chosen for each connected component within a side. ◻
]

Forgetting any subset of recorded positions defines a morphism between the corresponding configuration spaces:
  after forgetting, contract the levels that have become empty.
  This is the target stabilization used throughout this section.
  It does not forget or stabilize any marking of the source curve of a stable map.

=== 4.2 The extending virtual correspondence <the-extending-virtual-correspondence>

Fix discrete map data and a finite set of ordinary markings containing $I$. The source may be disconnected.
  Let $cal(M)$ be the fixed-data twisted transverse-map stack of Abramovich–Fantechi over the universal expansion
  stack; its coarse maps are predeformable. Throughout the correspondence, cap,
  and sewing arguments we use this expansion convention. Its levels are globally aligned even when $D$ is
  disconnected, exactly as in the configuration spaces of 14;
  we do not identify this stack with a presentation allowing independent expansion lengths on the connected
  components of $D$. In this paper “ordinary relative theory” means scheme-target invariants with ordinary
  coarse-source insertions computed in this aligned formalism.
  Properness of the coarse predeformable-map stack in this universal model follows from
  #cite(label("AFConfigurations")) Corollary 2.2.9, and twisted-map properness and relative virtual classes follow
  from #cite(label("AF2016")) Theorem 3.26 and Section 4.7.
  We retain stable unmarked rootless components in this labelled theory;
  the common-expansion obstruction comparison below applies to them directly.

The descendant class is the cotangent line of the coarse source at an ordinary marking on the expanded map.
  Stabilization over the unexpanded target, retaining all ordinary and relative markings,
  is an isomorphism near each ordinary marking #cite(label("AF2016")) Definition 4.1 and Section 4.3.
  Thus this line is also the pullback of the ordinary stable-map cotangent line used in the comparison of relative
  theories #cite(label("AMWComparison")) Corollary 1.1.3 and Section 2.3.
  Target-level stabilization, cutting, and the group separation below preserve the same neighborhood and hence
  this cotangent line; see also #cite(label("AF2016")) Section 5.10 for gluing.
  On a smooth fiber there are no target expansions, so this is the ordinary map cotangent.
  When smooth curve data have several specializations, take their full finite sum with the specified extending
  numerical degree weights. No individual lifted homology class is chosen across different smoothings.
  The usual bounded-degree conditions make these constructions finite coefficient by coefficient.

An ordinary marking lies in the smooth interior of the expanded target.
  Retain the images of the markings in $I$ and stabilize these target positions. This gives a morphism

#[#set math.equation(numbering: n => "(4.3)")
 $ e_I : cal(M) arrow.r cal(Q)_I . $ <ev:lift>]

For twisted expansions we first take their coarse expansion coordinates.
  Ordinary interior positions have no ambiguity under this operation. The morphism is proper:
  $cal(M)$ is proper over $B$ and $cal(Q)_I$ is separated over $B$.
  Target stabilization is defined for families, either by the preceding configuration construction or by
  multiplying the smoothing parameters at the contracted levels in (4.2).

Let

$ Theta = product_j psi_j^(b_j) product_(j in.not I) "ev"_j^(*) gamma_j $

denote the ordinary descendant powers and preintegrated insertions. The $psi_j$ are cotangent classes on maps.
  Initially suppose that the $gamma_j$ are extending algebraic classes.
  Push forward the virtual class over the full base:

#[#set math.equation(numbering: n => "(4.4)")
 $ xi_I = \( e_I \)_(*) #scale(x: 120%, y: 120%)[\(] Theta ∩ \[ cal(M) \]^(upright("vir"))
   #scale(x: 120%, y: 120%)[\)] in A_(*) \( cal(Q)_I \)_(bb(Q)) \, wide Gamma_I = "cl" \( xi_I \) . $ <ev:total-class>]

We use the identification of Chow homology with Chow cohomology on the smooth total space to write its cycle class
  as $Gamma_I$. If the correspondence has codimension $c$, then $Gamma_I$ has cohomological degree $2
  c$ and Tate type $\( c \, c \)$. Restriction to a noncentral fiber of (4.4) is the usual descendant evaluation
  correspondence. This follows from virtual base change and proper pushforward,
  since over that fiber there are no exceptional target levels.

The construction is made before any nonalgebraic constant-source inputs are contracted.
  More explicitly, expose such inputs as cohomology slots of their fixed smooth projective sources and use the
  algebraic correspondences extending over the total family.
  The virtual pushforward with these slots exposed is a morphism of Hodge structures with its prescribed Tate
  shift. Contracting with the fixed inputs afterward gives the required preintegrated correspondence.
  If desired, one can record their target positions as additional factors, apply the same construction,
  and push forward while contracting the source slots. The projection formula makes the two procedures equal.
  The number of positions used in the later local calculation is therefore the number in $I$,
  not the number of ordinary preintegrated markings. General cohomology inputs in these fixed slots follow by linearity.

#prodef([Lemma 4.2.])[
  (Labelled cut in the aligned expansion).  #emph[Fix bounded discrete data for labelled connected source
    components in $cal(M)$, permitting their disjoint union, and choose one cut of the globally aligned target
    expansion. Let $eta$ range over the resulting splittings with ordered labels on their $r$ paired relative
    roots of contact orders $c_1 \, dots.h \, c_r$. The side source graphs may contain rootless vertices or be
    empty. Let $cal(M)_(eta \, i)$ denote the relative map stack of the #emph[whole] side source graph over one
    shared side expansion. On the normalized target cut, the virtual boundary class is the sum,
    over these labelled splittings, of the gluing pushforwards of
#[#set math.equation(numbering: n => "(4.5)")
 $ frac(product_(j = 1)^r c_j, r !) Delta_(D^r)^(!)
   #scale(x: 120%, y: 120%)[\(] \[ cal(M)_(eta \, 0) \]^(upright("vir"))
   times \[ cal(M)_(eta \, 1) \]^(upright("vir")) #scale(x: 120%, y: 120%)[\)] . $ <ev:aligned-cut-formula>]

 There is no additional factor for a source component or a connected component of $D$.
   For $r = 0$, the product and diagonal are the identity. The formula is an equality of virtual classes before
   evaluation pushforward. The $r !$ forgets the ordered root labels;
   the finite quotient by permutations of identical source components is taken on the whole indexed sum,
   not again on each root-labelled side factor.]
] <ev:aligned-cut>

#proof[
  The untwisted target stack with a chosen global cut normalizes its normal-crossings boundary with pure degree
    one #cite(label("ACFW")) Proposition 7.4.1. Base-changing the map stack and its relative obstruction theory to
    this normalization gives the virtual cut class by the virtual pushforward comparison used in
    #cite(label("AF2016")) Sections 5.4–5.6. This target-stack statement does not depend on the source graph or on
    the number of components of $D$. For a twist index $R$, the reduced twisted split stack has degree $1 \/
    R$ over the corresponding nonreduced boundary; hence this step contributes $R$ to the virtual class.
  Normalize the source at its nodes mapping to the selected cut.
    A rootless component remains wholly on one side, including when it maps into an expanded level.
    On fixed labelled data the split-map stack is the fiber product of the two relative-map stacks over the
    matching root evaluations and the #emph[single] target-gluing stack.
    Relative to this common target-expansion base, the AF map-deformation complex on a disjoint union is a direct
    sum. Its source-normalization triangle has exactly the normal complex of the matching-root diagonal as the
    difference between split and glued complexes #cite(label("AF2016")) Proposition 5.16;
    there is no term at a rootless component. Thus the compatible obstruction theories give the refined diagonal
    pullback in (4.5). The common-refinement comparison for disconnected source maps #cite(label("AF2016"))
    Proposition 4.14 and its proof keeps one expansion per side;
    it does not duplicate the target deformation for each source component.
    Although the published degeneration formula indexes connected glued graphs,
    its target normalization and this labelled source-normalization comparison do not use that condition.
    When both sides are nonempty, connectedness ensures that every side vertex has a root.
    Here rootless vertices and empty sides are retained, and source-component labels are kept until their finite
    quotient is taken.
  The universal split target over the two side expansion stacks is one $mu_R$-gerbe,
    of degree $1 \/ R$ #cite(label("ACFW")) Proposition 7.4.2;
    this cancels the preceding $R$ #cite(label("AF2016")) Lemma 5.15.
    The separate comparison from rigidified root evaluations to the ordinary diagonal has degree $product_j
    c_j$ #cite(label("AF2016")) Proposition 5.18. These are rootwise factors even if the roots lie on different
    connected components of $D$; the target-twist factor remains global.
  If a side source graph is empty, every positive-length expansion on that side has an unstabilized level-scaling
    automorphism. Its stable relative-map stack is therefore the point represented by the unexpanded pair,
    with zero relative obstruction complex and virtual class $\[ upright("pt") \]$.
    For an empty root profile choose $R = 1$; the target gerbe is trivial, $D^0 = upright("pt")$,
    and both contact and root-permutation factors are one. A nonempty rootless source component on a bubble is
    retained on its side and is not confused with this empty unit.
    Finally, forgetting the ordered root labels is an $r !$-cover and gives the denominator in (4.5).
    Quotienting the fixed source-component labels by permutations of identical components gives their separate
    stack weights. ◻
]

#prodef([Proposition 4.3.])[
  (Restriction with recorded assignments).  #emph[The class $Gamma_I$ is an actual extending correspondence on the
    smooth total configuration family. Let $i_epsilon.alt : Q_epsilon.alt arrow.r.hook
    cal(Q)_I$ be a central component, with the recorded side and connected-component assignment $epsilon.alt$.
    Its restriction $i_epsilon.alt^(*) Gamma_I$ is given by the virtual degeneration formula restricted to
    splitting data with that assignment, retaining on each side the joint relative evaluation into the
    corresponding factor of (4.1). This is an equality of correspondence classes on $Q_epsilon.alt$ before further
    cohomology insertions are applied.]
  #emph[Concretely, in the scheme case let $eta$ range over admissible splittings with that assignment,
    with $r$ labelled matching relative roots of orders $c_1 \, dots.h \, c_r$.
    Let $cal(M)_(eta \, 0)$ and $cal(M)_(eta \, 1)$ be the relative moduli, and let
$ G_eta = cal(M)_(eta \, 0) times_(D^r) cal(M)_(eta \, 1) . $

 The root matching is the refined diagonal pullback. With the usual labelled-root convention,
   the restriction is the cycle class of
#[#set math.equation(numbering: n => "(4.6)")
 $ sum_(eta upright(" of assignment ") epsilon.alt) frac(product_(j = 1)^r c_j, r !) thin \( e_eta \)_(*)
   (Theta_eta ∩ Delta_(D^r)^(!) #scale(x: 120%, y: 120%)[\(] \[ cal(M)_(eta \, 0) \]^(upright("vir")) times \[
   cal(M)_(eta \, 1) \]^(upright("vir")) #scale(x: 120%, y: 120%)[\)]) . $ <ev:restriction-formula>]

 Here $e_eta : G_eta arrow.r Q_epsilon.alt$ retains the two aligned relative evaluations;
   it is allowed to have image on the boundary of $Q_epsilon.alt$.
   Source-component labeling or quotient conventions are held fixed throughout.
   Equivalently, summing over unlabelled root data replaces $r !$ by the usual root-permutation stabilizer.
   For $I = diameter$ the assertion is the ordinary special-fiber virtual degeneration formula.]
] <ev:restriction>

#proof[
  We have already constructed the extending class. We prove the assignment-specific statement by a Cartier divisor
    calculation, then apply virtual splitting on each resulting boundary divisor.
  On a chart of the stack of expanded targets let $t_0 \, dots.h \, t_ell$ be the untwisted smoothing parameters,
    so that $s = t_0 dots.h.c t_ell$. At an ordinary recorded point the normal coordinate along its level is a
    unit. Order the recorded points by their levels. Evaluation into (4.2) has the following form:
    each $e_I^(*) a_j$ is a unit times the product of the $t_k$ belonging to the interval between the two
    successive recorded levels, with the two end intervals used for $j = 0 \, m$.
    Points on the same level give unit ratios. Consequently, as divisor line bundles with their defining sections,
  #[#set math.equation(numbering: n => "(4.7)")
   $ e_I^(*) \( a_j = 0 \) = sum_(k in J_j) \( t_k = 0 \) \, $ <ev:cut-divisor>]
  where $J_j$ consists exactly of the cuts putting the recorded marks on the sides specified by $a_j = 0$.
    There is order one on each of these divisors in untwisted target coordinates and order zero on the other cut
    divisors. Empty unrecorded levels simply contribute more factors to the same interval product.
    On a normalized splitting divisor, the connected component of a side containing a recorded mark is also
    discrete. Selecting that choice gives precisely the refinement from the side assignment to $epsilon.alt$.
  Here the notation in (4.7) means the factorization of the pulled-back section and its line bundle.
    It does not assert that this section is regular on every component of $cal(M)$.
    The virtual boundary intersections below are refined pullbacks of the boundary divisors on the expansion
    stack. Their additivity under this factorization therefore also applies to components of the map space
    supported over $s = 0$.
  The equations change by units under normal-coordinate transitions,
    so (4.7) is an equality of the corresponding divisor line bundles and sections,
    not just an equality on an open set of maps. In particular,
    it controls refined intersection also when the evaluation image lies in a deeper central stratum.
    The map from each normalized cut divisor to $Q_epsilon.alt$ is obtained by cutting the expansion and
    stabilizing the recorded positions on its two sides. The uniqueness argument in 14 shows that this is the map
    occurring in (4.1).
  Refined Cartier pullback commutes with proper pushforward.
    Applied to (4.4), it identifies the homological class corresponding to $i_epsilon.alt^(*)
    Gamma_I$ with the pushforward of the virtual intersection with the left side of (4.7).
    Intersect the right side one boundary at a time. The virtual splitting identities in the proof of the
    degeneration formula identify each such intersection with the matching relative virtual classes and their
    refined root diagonal. The required identity for disconnected sources and an empty side is 15,
    applied before evaluation pushforward. The additional assertion beyond the numerical degeneration formulas
    #cite(label("AF2016")) Sections 5.3–5.9 and #cite(label("ABPZ")) Theorem 2.3 is the retained correspondence
    with its recorded assignment and the full labelled source graph, including rootless components.
  A target level is retained when stabilized by the union of its source components; after cutting,
    each side is stabilized separately. Bounded expanded-map stacks supply properness and finite type.
    The target-cut normalization and Cartier equation (4.7) depend only on the target expansion and the recorded
    assignment, so they are unchanged by the source graph.
  Passing to unlabelled disconnected sources divides both sides by the finite permutation group of isomorphic
    components; intrinsic map automorphisms remain in the stack virtual classes.
    Two identical closed components on one side, for example, contribute $1 \/ 2 !$,
    while the two labelled assignments with one on each side cancel that quotient.
    Labelling the relative roots and dividing by $r !$ gives the convention of (4.6).
    This proves the formula as a correspondence class before further cohomology insertions or numerical
    integration, with the aligned evaluation in $Q_epsilon.alt$ retained.
  For clarity about multiplicities, a twisted node parameter $tau$ has untwisted parameter $t = tau^r$.
    Pulling back the untwisted component equation therefore gives its twisting multiplicity.
    The gerbe degree in gluing and the root-pairing normalization in the twisted splitting identity combine with
    it to give the ordinary contact coefficient in (4.6). One must not replace this calculation by an assertion of
    multiplicity one in source-node or twisted coordinates. We have used multiplicity one only in the untwisted
    target boundary equation (4.7).
  Cutting and gluing a target leave the curve unchanged in a neighborhood of every ordinary marking.
    Hence its ordinary cotangent line and all powers of that line restrict as used in $Theta_eta$.
    Preintegrated extending classes restrict by the projection formula.
    For constant-source Hodge inputs the equality is first made with the source slots exposed and then contracted,
    as described above. Finally, with no recorded positions the sole component equation is $s =
    0$ and all cuts occur; the same proof gives the usual formula. ◻
]

#prodef([Remark 4.4.])[
  The enhancement in 16 is the calculation (4.7) and its use before evaluation pushforward.
    The standard virtual degeneration theorem supplies the splitting of each boundary class.
    A numerical formula alone would not determine the restriction to an individual component of the resolved
    configuration family.
] <ev:refinement-not-numerical>

#prodef([Example 4.5.])[
  (A diagonal near the double locus).  For two recorded points a chart is
  $ x_1 = a \, quad x_2 = a v \, quad y_1 = v b \, quad y_2 = b \, quad s = a v b . $
  The lifted diagonal of equal points is $v = 1$. It misses the mixed-assignment component $v = 0$,
    and the other ordered chart gives the same statement for the opposite mixed assignment.
    Thus the degree-zero constant-map diagonal has zero restriction on those components.
    For three equal recorded points all intermediate ratios in (4.2) equal one.
    This illustrates why restrictions must be computed on the configuration resolution,
    and is consistent with 16 for a stable constant three-marked genus-zero map.
] <ev:diagonal-example>

=== 4.3 Separating groups of relative maps <separating-groups-of-relative-maps>

We next consider a fixed pair $\( X \, D \)$, with a parametrized original target $X$.
  This is relative theory, not rubber theory. Fix discrete relative data $Xi$ for a disconnected source and divide
  its connected components into groups

$ Xi = Xi^(\( 1 \)) union.sq dots.h.c union.sq Xi^(\( u \)) . $

A group may itself be disconnected. The groups and all source, ordinary-marking,
  and relative-root labels are fixed in this statement. Write $cal(K)_Xi$ for maps on a common expansion and
  $cal(K)_(Xi^(\( a \)))$ for the separately stabilized group. There is a separation morphism

#[#set math.equation(numbering: n => "(4.8)")
 $ epsilon : cal(K)_Xi arrow.r product_(a = 1)^u cal(K)_(Xi^(\( a \))) . $ <ev:separation>]

For each group choose a subset $I_a$ of its ordinary marks and let $e_a$ be their joint evaluation into
  $cal(Q)_(I_a) \( X \, D \)$. An empty $I_a$ gives the constant map to $upright("pt")$.

#prodef([Proposition 4.6.])[
  (Group product with retained evaluations).  #emph[The separation morphism satisfies
#[#set math.equation(numbering: n => "(4.9)")
 $ epsilon_(*) \[ cal(K)_Xi \]^(upright("vir")) = times_(a = 1)^u \[ cal(K)_(Xi^(\( a \))) \]^(upright("vir")) .
   $ <ev:group-vfc>]

 Ordinary cotangent classes and joint evaluations of the retained positions are preserved under separation.
   Thus if $Theta_a$ is a product of ordinary descendants and insertions on group $a$,
   and $e = \( e_1 \, dots.h \, e_u \) compose epsilon$, then
#[#set math.equation(numbering: n => "(4.10)")
 $ e_(*) (product_a Theta_a ∩ \[ cal(K)_Xi \]^(upright("vir"))) =
   times_(a = 1)^u \( e_a \)_(*) (Theta_a ∩ \[ cal(K)_(Xi^(\( a \))) \]^(upright("vir"))) . $ <ev:group-correspondence>]

 The same assertion holds after grouping by connected components of a disconnected target and retaining the
   aligned evaluation of any chosen group. Factors with no recorded positions can therefore be preintegrated as
   ordinary relative invariants. The identities with algebraic insertions hold in Chow groups;
   for arbitrary cohomology insertions we apply the cycle class map and the cohomological projection formula.]
] <ev:groups>

#proof[
  For groups consisting of single connected source components,
    (4.9) is the relative disconnected product rule #cite(label("AF2016")) Proposition 4.14.
    We describe its comparison with groups retained, since the additional evaluation assertion cannot be obtained
    merely by quoting numerical factorization.
  Let $cal(T)$ denote the stack of expansions of the pair, with the twisting choices used in the transverse
    formulation when needed. Form the auxiliary stack $cal(T)'$ of one common expansion $cal(X)$ and partial
    contractions
  $ cal(X) arrow.r cal(X)_a \, wide 1 lt.eq a lt.eq u \, $
  where each $cal(X)_a$ is an expansion, and every exceptional level of $cal(X)$ is retained by at least one
    contraction. The twists and partial untwistings are included as in #cite(label("AF2016"))
    Sections 4.7.3–4.7.4; alternatively they may be put under a common dominating twisting choice.
    The comparison with the product expansion stack has pure degree one:
    both stacks have the same dense locus of unexpanded targets.
    The forgetful map from $cal(T)'$ to the common expansion stack is the same local etale comparison as in that
    construction.
  The square
  #[#set math.equation(numbering: n => "(4.11)")
   $ cal(K)_Xi & arrow.r^(med epsilon med) & product_a cal(K)_(Xi^(\( a \)))\
arrow.b &  & arrow.b\
cal(T)' & arrow.r & cal(T)^u $ <ev:group-square>]
  is cartesian in the transverse expanded-map comparison. Indeed,
    given maps from the separate groups and a specified common refinement,
    pull each map back along $cal(X) arrow.r cal(X)_a$. Transversality makes this pullback a curve with the
    canonical trivial cylinders at the levels contracted in $cal(X)_a$.
    The markings lift uniquely, and the disjoint union of the lifted groups is a map to the common expansion.
    The requirement that each level is retained by at least one group gives stability of the combined map.
    Conversely, separating a map and contracting the levels unstable for an individual group recovers this
    construction. No step uses connectedness inside a group.
  The relative map obstruction complex on a disjoint union is the direct sum of the complexes on its groups.
    Under the partial curve contraction $c : C'_a arrow.r C_a$ above,
    the contracted components are trivial rational cylinders and $R c_(*) cal(O)_(C'_a) = cal(O)_(C_a)$.
    The target-relative complex in the transverse comparison pulls back to the corresponding complex on $C'_a$.
    Projection formula therefore identifies the relative obstruction theory upstairs with the pullback of the
    direct-sum theory on the product. This is exactly the obstruction-theory comparison of #cite(label("AF2016"))
    Lemmas 4.16–4.18, with a disjoint union in place of each individual connected source.
    Its degree-one virtual pushforward argument applied to (4.11) proves (4.9).
  Consider an ordinary marking belonging to group $a$. A level containing its image cannot be trivial for that
    group: the nontrivial scaling of a fiber of that level cannot fix an interior marked point while preserving
    the map. Consequently the curve contractions used in separation are isomorphisms near all ordinary marks of
    the retained group. They preserve their cotangent lines. They also preserve their evaluation positions on the
    remaining levels. Stabilizing these recorded positions before or after separation gives the same
    configuration, because in either case the final expansion contracts precisely the levels empty of those
    positions. Thus $e$ and each $Theta_a$ factor through (4.8). Projection formula and proper pushforward give (4.10).
  The source exposition of the product comparison assumes every connected component carries a marking or a
    relative root, expressly for simplicity #cite(label("AF2016")) Section 4.7.1.
    Its proof of the product-class identity extends directly to stable labelled components with neither.
    A level occupied by a positive-degree map is retained when contracting it would destroy transversality or
    stability. A rootless closed component of collapsed degree zero cannot have a nonconstant fiber-only part:
    a complete nonconstant curve in a ruled fiber meets its boundary,
    and predeformability propagates this to a root or positive collapsed degree.
    Thus the remaining unmarked component is constant and has genus at least two by stability.
    The cartesian common-refinement square, etale expansion comparison,
    and direct-sum obstruction theory in #cite(label("AF2016")) Lemmas 4.16–4.18 depend on these stable maps and
    their universal curves, not on the presence of a mark or root.
    Their degree-one virtual pushforward proves (4.9) for these components as well.
    The empty source graph is the unit $\[ upright("pt") \]$.
  Finally, a connected source curve mapping into a disconnected target lies in one connected target component.
    We may collect all such source components into the desired target groups.
    The same argument applies, keeping one expansion and one aligned evaluation for each group until (4.10) is
    used. With cohomology inputs of odd parity, the products and permutations in this argument are taken in the
    graded tensor category. This inserts the usual Koszul signs and does not change any of the virtual pushforward
    equalities. ◻
]

=== 4.4 The correspondence data used in sewing <the-correspondence-data-used-in-sewing>

The component formula of 16 retains the aligned relative evaluations required by the local first-page operations.
  If a disconnected target piece contains none of their recorded positions,
  19 permits its ordinary relative data to be integrated out while preserving the retained correspondence.
  The statement remains valid when that piece carries arbitrarily many ordinary preintegrated auxiliary labels,
  since those labels occur only in its factor of (4.10).

Both assertions hold for fixed discrete data and hence for any finite coefficientwise linear combination allowed
  by the degree and genus bounds. They impose no extra test of connectedness in a smoothed target.
  Each relative root matching remains the ordinary diagonal contraction,
  with its contact and automorphism weights; the smooth-theory tensor contractions of 13 are performed on the
  retained correspondence after this virtual splitting. This is the form needed at an idle switch in 29.

== 5 Cap tests for the contact identity <cap:section>

We construct the tests used at a switch. The construction concerns ordinary relative invariants of fixed pairs,
  with disconnected domains permitted. All descendant lines are the ordinary lines at marked points of maps.
  Coefficients used to combine tests are external to the Gromov–Witten operations.
  In particular, the positive operator of 2 acts on the auxiliary descendant labels,
  but does not act on these coefficients.

=== 5.1 Geometry, contact spaces, and coefficient conventions <cap:setup>

The geometric realizations and smoothings of the following pairs are given in 27. We specify the data needed here. Write

$ C = bb(P)_D \( cal(O) xor N \) \, wide D_l = bb(P)_D \( N \) \, wide D_r = bb(P)_D \( cal(O) \) \, $

using the convention of lines. The normal bundles of these sections are $N^(- 1)$ and $N$, respectively.
  For a class $beta$ on $C$, put $alpha = "pr"_(*) beta$ and $k_l = D_l dot.op beta$, $k_r = D_r dot.op beta$.
  The divisor relation gives

#[#set math.equation(numbering: n => "(5.1)")
 $ k_r - k_l = integral_alpha c_1 \( N \) . $ <cap:flux>]

The left cap is $P = \( C \, D_r \)$. In the ordinary configuration the right cap is $Q = \( C \, D_l \)$.
  In the blowup configuration,

$ U = "Bl"_S M \, quad D = bb(P)_S \( N_(S \/ M) \) \, quad N = cal(O)_D \( - 1 \) \, wide Q =
  #scale(x: 120%, y: 120%)[\(] bb(P)_S \( N_(S \/ M) xor cal(O) \) \,
  bb(P)_S \( N_(S \/ M) \) #scale(x: 120%, y: 120%)[\)] . $

The right end of the uncut chain in the latter configuration is $V = C$, relative at $D_l$.

The counting degree $q \( beta \)$ is integral and nonnegative on all effective classes used here.
  Ordinarily it comes from a relative polarization ample on the two original ends and restricts on each neck to a
  pullback of an ample class on $D$. In the blowup configuration it is pulled back from an ample class on $M$,
  and on bundle pieces from its restriction to $S$. We also record any compatible extending divisor degrees
  required in an application. The blowup configuration records the degree against the nonjoining section $D_r$ of
  the final $V$, separately on its connected parts if necessary. This last degree is not charged to inserted caps.
  We use the letter $q$ for the corresponding formal variable as well.

For a smooth, possibly disconnected seam $D$, define the contact superspace

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(F)_a \( D \) = xor.big_(\( m_1 \, m_2 \, dots.h \) thin \; med m_e gt.eq 0\
sum_e e m_e = a) ⨂_(e gt.eq 1) "Sym"^(m_e) H^(*) \( D \; bb(C) \) \, wide cal(F)_(lt.eq H) \( D \) =
  xor.big_(0 lt.eq a lt.eq H) cal(F)_a \( D \) . $ <cap:states>]

Here $"Sym"$ is graded symmetric: odd factors anticommute. Only finitely many $m_e$ can be nonzero.
  A contact with a disconnected seam also carries its component label.
  In particular, $cal(F)_0 \( D \) = bb(C)$ contains the empty profile.
  These spaces are finite dimensional for finite $H$.

Let $G_ℏ$ denote the contact gluing form, with its normalization fixed by the ordinary degeneration formula.
  On ordered roots of orders $e_1 \, dots.h \, e_ell$, gluing inserts the categorical Poincare coevaluation and
  the factor

$ \( e_1 dots.h.c e_ell \) ℏ^ell . $

One then performs the graded symmetrizations and finite permutation quotients prescribed by that formula.
  This describes our normalization without identifying an ordered profile with an unnormalized monomial.
  All permutation denominators and contact factors are nonzero,
  and Poincare duality implies that $G_ℏ$ is perfect on every $cal(F)_(lt.eq H) \( D \)$ over
  $bb(C) \( \( ℏ \) \)$. Profiles with different orders are orthogonal.
  No parity involution is added to the categorical coevaluation. The exponent of $ℏ$ follows from

$ g_(upright("total")) - 1 = sum_v \( g_v - 1 \) + \# { upright("glued pairs of roots") } \, $

where disconnected arithmetic genus is defined by Euler characteristic. This formula includes the empty domain.

Fix a contact bound $H$. Our goal is to reproduce $G_ℏ \( x \, y \)$ by ordinary descendants on two detached caps.
  Only the incoming state $x$ is initially bounded: the $Q$ cap must realize every functional on
  $cal(F)_(lt.eq H) \( D \)$, whereas $P$ must prepare a prescribed state on the full outgoing space,
  cancelling all unwanted profiles. We first invert the fiber contributions.
  In the exceptional configuration, further terms of counting degree zero strictly lower the outgoing contact;
  these are inverted next, before correcting positive counting degrees.
  The outgoing bound will hold for each ordinary descendant test before cancellation,
  so it survives the later Virasoro action on auxiliary labels.
  This use of triangular cap calculations is related to the relative-to-absolute reconstruction of
  #cite(label("MaulikPandharipande2006")) Theorem 2 and Sections 2.2–2.4 and #cite(label("HLR2008")) Theorem 5.15.
  The contact identity needed here will be proved below, using the fiber scalar of #cite(label("HLR2008")) Theorem 7.1.

We fix a counting bound $d$ throughout each construction.
  Auxiliary markings are encoded by commuting variables for even classes and exterior variables for odd classes;
  variables also record descendant indices. Every coefficient in these variables has only finitely many markings.
  A #emph[coefficient row] is the relative functional obtained by extracting one specified auxiliary monomial from
  the disconnected cap series, leaving its contact inputs and its degree and genus series uncontracted.
  We work coefficientwise in these variables, modulo $q^(d + 1)$, with Laurent series in $ℏ$ bounded below.
  For finitely many chosen auxiliary variables the auxiliary completion is
  $bb(C) \( \( ℏ \) \) \[ \[ upright(bold(t))_(upright("even")) \] \] ⊗
  and.big \( upright(bold(t))_(upright("odd")) \)$. If divisor fugacities are retained, they are invertible;
  finite support in their exponents at each step will be proved below.
  The argument never requires a lower bound on the $ℏ$-valuation uniform over all auxiliary monomials.

=== 5.2 The fiber block <the-fiber-block>

Consider, more generally, the cap

#[#set math.equation(numbering: n => "(5.3)")
 $ \( B \, E \) = #scale(x: 120%, y: 120%)[\(] bb(P)_T \( L xor cal(O) \) \,
   bb(P)_T \( L \) #scale(x: 120%, y: 120%)[\)] \, wide "rk" L = r \, $ <cap:bundle>]

with zero section $i : T arrow.r.hook B$ disjoint from $E$.
  Allowed ordinary insertions are $tau_m \( i_(*) gamma \)$ with $gamma in H^(*) \( T \)$.
  Their first Hodge degrees include the Gysin shift by $r$.
  The ordinary right cap has this form with $L = N$; the left cap has it with $L =
  N^(- 1)$ after tensoring the projective bundle by $N^(- 1)$. The blowdown cap has $L = N_(S \/ M)$.

#prodef([Lemma 5.1.])[
  (Single-root linearization).  #emph[Restrict (5.3) to classes with zero projection to $T$.
    For any finite bound on contact order, the connected genus-zero single-root generating series have jointly
    surjective linearization in the auxiliary variables. Consequently one can choose finitely many variables whose
    linearization is an isomorphism onto their coefficients in the contact spaces with one root.]
] <cap:linearization>

#proof[
  Choose a homogeneous basis of $H^(*) \( T \)$ and use the projective bundle basis $1 \, H_f \, dots.h \,
    H_f^(r - 1)$ on $E$, where $H_f = c_1 \( cal(O)_E \( 1 \) \)$.
    For root order $e gt.eq 1$ and $0 lt.eq b < r$, use the variable corresponding to
  #[#set math.equation(numbering: n => "(5.4)")
   $ tau_(r \( e - 1 \) + b) \( i_(*) gamma \) . $ <cap:linear-row>]
  At a possibly different root order $e'$, pushforward by the relative evaluation has codimension beyond $gamma$
    equal to
  #[#set math.equation(numbering: n => "(5.5)")
   $ r \( e - e' \) + b . $ <cap:output-codimension>]
  Indeed, writing $t = dim T$, the relative virtual dimension with one ordinary and one full-contact relative
    marking is $t + r - 1 + r e'$. Subtract the insertion codimension $r +
    "codim" gamma$ and its descendant exponent, and compare with $dim E = t + r - 1$.
    The projection formula factors out $gamma$, so a negative value in (5.5) forces zero even if the degree of
    $gamma$ itself is large. Thus orders $e' > e$ do not occur.
  At $e' = e$, the output is a nonzero scalar times $H_f^b gamma$ plus terms of smaller fiber power with
    additional base degree. To compute the scalar, restrict to a point of $T$.
    A connected genus-zero domain with constant base projection has $H^1 \( C \, cal(O)_C \) ⊗ T_t T = 0$;
    horizontal deformations supply the base factor and no horizontal obstruction.
    The calculation is therefore the relative invariant of $\( bb(P)^r \, bb(P)^(r - 1) \)$. The exact formula is
  #[#set math.equation(numbering: n => "(5.6)")
   $ ⟨tau_(r e - 1 - j) \( upright("pt") \) divides
     H_f^j⟩_(0 \, e \[ upright("line") \])^(\( bb(P)^r \, bb(P)^(r - 1) \)) =
     frac(1, e^(r - j) \( \( e - 1 \) ! \)^r) \, wide 0 lt.eq j lt.eq r - 1 . $ <cap:HLR>]
  This is #cite(label("HLR2008")) Theorem 7.1, for one ordinary marking and one relative marking of full contact
    $e$, using the ordinary marked-point cotangent line. To match the expansion convention used here,
    apply the AF-to-Li virtual pushforward of #cite(label("AMWComparison")) Theorem 1.1.2.
    That comparison takes the relative coarse source without contracting its components
    #cite(label("AMWComparison")) Section 4.1, so it preserves the ordinary cotangent line.
  For this particular scalar, the jet calculation of #cite(label("HLR2008")) Lemmas 7.2–7.4 can be performed on
    Li’s algebraic relative-map space. Impose evaluation at a point $p in.not bb(P)^(r - 1)$,
    and denote its ordinary marking by $x$. The first $e - 1$ jets at $x$ form an algebraic section of a bundle
    with successive quotients $\( L_x^(⊗ k) \)^(xor r)$, $1 lt.eq k < e$.
    Its top Chern class is $\( \( e - 1 \) ! \)^r psi_x^(r \( e - 1 \))$.
    The component containing $x$ cannot be constant: stability would give at least two branches,
    each forced to contain the unique relative root, contradicting the genus-zero tree.
    At a zero of the jet section, a generic hyperplane through $p$ has intersection multiplicity at least $e$ at
    $x$, so this component uses the full degree $e$. Every remaining rubber branch would have to carry an outer
    root by contact conservation. The single-root and genus-zero conditions therefore leave one full-contact
    attachment; any remaining unmarked rubber cylinders are unstable.
    Thus the zero locus has unexpanded target and maps $w mapsto a w^e$.
    Near it the point-constrained moduli have the smooth polynomial chart
    $\[ \( a_1 \, dots.h \, a_e \) \, med a_e eq.not 0 thin \/ bb(C)^(*) \]$, with $a_k in bb(C)^r$.
    The jet equations are regular there, so their localized Euler class meets the virtual cycle with multiplicity
    one. The zero locus is a $mu_e$-gerbe over $bb(P)^(r - 1)$ and $L_x^(⊗ e) = cal(O) \( 1 \)$ on it.
    Its remaining integral is $e^(- \( r - j \))$, giving (5.6).
    This argument only compares the stated one-root fiber invariant.
  With $j = r - 1 - b$, the leading scalar is $e^(- \( b + 1 \)) \( \( e - 1 \) ! \)^(- r)$.
  Order the blocks by root order and, within each block, by fiber power.
    The preceding vanishing and nonzero diagonal give a triangular matrix with invertible diagonal blocks.
    Corrections with positive base degree are triangular in fiber power;
    alternatively their repeated composition is nilpotent because the base has bounded cohomological degree.
    This proves the assertion in both parities. ◻
]

#prodef([Lemma 5.2.])[
  (Finite cap spanning).  #emph[For the fiber classes of (5.3),
    finitely many coefficient rows in the ordinary zero-section variables span the full dual of
    $cal(F)_(lt.eq H) \( E \)$ over $bb(C) \( \( ℏ \) \)$. Equivalently,
    after using $G_ℏ$ to identify states and their duals, they span all states.
    The empty profile and odd labels are included.]
] <cap:span>

#proof[
  Write $Z_(upright("cl")) \( upright(bold(t)) \, ℏ \)$ for the disconnected factor formed by connected components
    without relative markings. The relative product rule in 19 gives the same factor at every profile,
    so it may be divided out before selecting rows. In fiber degree, a component without roots has degree zero:
    its intersection with the relative hyperplane is zero. At $upright(bold(t)) =
    0$ its disconnected series is $1 + O \( ℏ \)$, because unmarked constant maps in genus zero or one are
    unstable. It is therefore invertible over $bb(C) \( \( ℏ \) \)$;
    its inverse is well defined coefficientwise in $upright(bold(t))$.
    At a fixed auxiliary monomial, only finitely many coefficients enter multiplication or division by this series.
  After this normalization every connected component has at least one root.
    For a profile $lambda$ with $ell \( lambda \)$ roots, its lowest possible genus exponent is $-
    ell \( lambda \)$. Equality holds exactly when every connected component has one root and genus zero.
    Its coefficient is therefore, up to the nonzero finite labeling factor,
    the signed product of the connected genus-zero single-root series associated with the entries of $lambda$.
  Let these single-root coordinates be $f_1 \( upright(bold(t)) \) \, dots.h \,
    f_s \( upright(bold(t)) \)$ in homogeneous bases. By 20, choose $s$ auxiliary variables with invertible super
    Jacobian and set the others to zero. The formal inverse function theorem applied to $f_i -
    f_i \( 0 \)$ identifies the completed super power series algebras in these variables.
    Substitution by the $f_i$ is therefore injective on the algebra of polynomials in even variables and exterior
    variables in odd degree. Nonzero constant terms in the even $f_i$ merely translate the polynomial variables.
    It follows that the finitely many signed monomials corresponding to a basis of $cal(F)_(lt.eq H) \( E \)$ are
    linearly independent.
  For completeness, finite coefficient detection here involves no compactness assumption on formal series.
    Intersect the kernels of successively more coefficient functionals on the finite-dimensional span of these
    monomials. If their intersection were nonzero, it would contain a nonzero series with every coefficient zero.
    The decreasing sequence of subspaces stabilizes, so a finite set of coefficients already has zero kernel.
    Choose a square full-rank submatrix of those coefficient rows.
    Multiply each column of the corresponding full Gromov–Witten matrix by $ℏ^(ell \( lambda \))$.
    Its constant matrix is the just chosen invertible coefficient matrix,
    and the remaining entries have positive $ℏ$-valuation. It is invertible over $bb(C) \[ \[ ℏ \] \]$;
    undoing the column shifts gives a Laurent inverse.
  Finally, each of the finitely many normalized rows used above is a finite linear combination of unnormalized
    coefficient rows, with Laurent coefficients coming from $Z_(upright("cl"))^(- 1)$.
    Enlarge the row collection by these finitely many contributing original rows.
    Their span still has full rank, so a square subset of original rows has an invertible Laurent matrix.
    Thus all rows can be taken to be genuine tests by finitely many ordinary markings.
    Perfectness of $G_ℏ$ gives the equivalent assertion for inserted states. ◻
]

=== 5.3 Degree bounds and Laurent completion <degree-bounds-and-laurent-completion>

We record the finiteness statement needed to deform the preceding fiber matrices.
  Bounds always refer to effective classes occurring in the relative splitting formula,
  not to all integral classes with the same intersection numbers.

#prodef([Lemma 5.3.])[
  (Bounded rows).  #emph[Fix a finite list of auxiliary rows and a counting bound $d$.]
  + #emph[For $Q$, a bound on its relative contact total bounds its effective curve degrees.]
  + #emph[For $P$, a fixed nonnegative degree $h$ against $D_l$,
    together with nonnegative outgoing contact at $D_r$, bounds its effective curve degrees.
    Moreover its outgoing contact satisfies $a lt.eq h + C_0 q \( beta \)$, for a constant $C_0 gt.eq
    0$ independent of the row.]
  + #emph[Under these bounds every entry of the finite row matrices is a Laurent series in $ℏ$ bounded below.
    At each counting order there are finitely many curve classes and finitely many exponents of additional divisor
    fugacities.]
] <cap:bounded-rows>

#proof[
  In the ordinary configuration the projected degree on $D$ is bounded by the ample counting degree.
    The section relation (5.1), together with either specified section degree,
    then fixes the remaining numerical fiber degree. In the blowdown cap,
    the relative hyperplane is relatively ample over $S$; a large multiple of the ample counting class on $S$ plus
    this hyperplane is ample. Its intersection is bounded by $C d + a$, where $a$ is the relative contact total.
    This proves (i).
  In the exceptional left cap, $- c_1 \( N \)$ is relatively ample on $D arrow.r S$.
    For a sufficiently large integer $A$,
  $ A q \|_D - c_1 \( N \) $
  is ample on $D$. The same argument, or ampleness of $q \|_D$ in the ordinary case,
    gives $c_1 \( N \) dot.op alpha lt.eq C_0 q \( alpha \)$.
    Since $a = h + c_1 \( N \) dot.op alpha gt.eq 0$, one also has $c_1 \( N \) dot.op alpha gt.eq - h$.
    Thus the projected ample degree is at most $A d + h$. The section degree $h$ then fixes the remaining fiber
    coordinate on $P$. An ample class on $P$ has bounded degree, proving (ii).
  A bound on an integral ample degree bounds the homology classes of effective curves,
    not just their numerical images. One way to see this is to choose a Kahler metric representing that ample
    class: the integral of every fixed smooth real two-form over a holomorphic curve is bounded in absolute value
    by a constant times its area. Apply this to finitely many representatives of a basis of real cohomology,
    and use the integral homology lattice and its finite torsion subgroup.
    Hence only finitely many integral classes occur. In particular all extra divisor exponents have finite support.
  For a fixed auxiliary row, let $m$ be its number of ordinary marks.
    The number of nonconstant connected components is bounded by their total degree against the chosen integral
    ample class. Constant connected genus-zero components require at least three ordinary marks if they have no
    roots, and degree-zero components cannot have positive total contact.
    Their number is consequently bounded by $m$. These are the only connected components contributing a negative
    power of $ℏ$. Thus each entry has a lower bound on its $ℏ$-valuation.
    For a specified total exponent, genera are bounded; unmarked constant components of genus at least two
    contribute positive powers, while marked genus-one constants consume ordinary marks.
    Consequently the disconnected exponential and the finite matrix products are well defined coefficientwise.
    This also proves (iii) for finite lists of rows. ◻
]

=== 5.4 Preparing incoming and outgoing tests <preparing-incoming-and-outgoing-tests>

#prodef([Lemma 5.4.])[
  (Incoming tests from $Q$).  #emph[Modulo $q^(d + 1)$, the $Q$ cap realizes every linear functional on
    $cal(F)_(lt.eq H) \( D \)$ by finitely many ordinary coefficient rows with external coefficients having
    nonnegative $q$-powers and Laurent $ℏ$-coefficients.]
] <cap:Q>

#proof[
  At $q = 0$, projection to the base of $Q$ is zero: that base is $D$ in the ordinary configuration and $S$ in the
    blowdown configuration, and the counting class there is ample.
    Choose the finite invertible fiber matrix $M_0$ of 21. Apply the same rows at all counting degrees to obtain
  $ M \( q \) = M_0 + q M_1 + dots.h.c + q^d M_d med \( mod med q^(d + 1) \) . $
  Its entries are well defined by 22. If $B = M_0^(- 1) \( M \( q \) - M_0 \)$, then
  #[#set math.equation(numbering: n => "(5.7)")
   $ M \( q \)^(- 1) = (sum_(j = 0)^d \( - B \)^j) M_0^(- 1) med \( mod med q^(d + 1) \) . $ <cap:Qinverse>]
  This is a finite sum, and uses no negative $q$-powers. The target classes in a $Q$ row are already bounded by
    the incoming contact. No independent fiber-degree selection on the smooth segment containing $Q$ is required. ◻
]

The left cap requires an additional degree selection. The degree against its nonjoining section $D_l$ is supported
  on that cap and extends to the smoothed segment. Select its coefficient $h gt.eq 0$.
  This is an external coefficient selection on that smooth target, not an insertion on a relative root.
  The corresponding section continues on a segment of type $P \| Q$ as well.

#prodef([Lemma 5.5.])[
  (Outgoing states from $P$).  #emph[Modulo $q^(d + 1)$, every prescribed state supported in
    $cal(F)_(lt.eq H) \( D \)$ can be prepared by finite combinations of $P$ rows with imposed nonnegative
    left-section degrees. The coefficients have nonnegative $q$-powers.
    Every summand of the preparation, including before cancellation, has outgoing total at most $H +
    C_0 d$ at total counting order at most $d$. The same bound holds if ordinary auxiliary insertions are
    replaced, removed, or assigned to a classical operation while their imposed degree conditions are retained.]
] <cap:P>

#proof[
  First take projected class $alpha = 0$. Then (5.1) says $a = h$.
    The rank-one case of 21, restricted to total contact $h$, supplies an invertible block of ordinary rows,
    with no output at other contact totals. Normalize these rows by that inverse.
  If $q \( alpha \) = 0$ but $alpha eq.not 0$ in the exceptional configuration, $alpha$ is vertical over $S$.
    The line bundle $- N$ is ample on every fiber, and hence
  #[#set math.equation(numbering: n => "(5.8)")
   $ c_1 \( N \) dot.op alpha < 0 \, wide a < h . $ <cap:exceptional-down>]
  Thus the full $q = 0$ matrix at bounded imposed flux is block triangular in contact,
    with precisely the invertible fiber blocks on the diagonal.
    Correcting successively downward in contact inverts it: its strictly contact-decreasing part is nilpotent on
    the finite range $0 \, dots.h \, H$. This step includes empty-profile errors.
    For example, over a point with rank-two normal bundle, $D =
    bb(P)^1$ and $P$ is the Hirzebruch surface $bb(F)_1$. A projected class of degree $m$ has $a = h - m$,
    so $0 lt.eq m lt.eq h$; the term $m = h$ indeed has empty boundary.
  We now correct in increasing $q$-order. Suppose a remaining error has coefficient $q^j$ and contact $a$.
    Use imposed flux $h = a$ and the already inverted $q = 0$ triangular block to remove it.
    Any new error of positive additional counting degree $k$ has contact at most $a + C_0 k$, by 22.
    Starting with contact at most $H$ at order zero proves inductively the sharper bound
  #[#set math.equation(numbering: n => "(5.9)")
   $ a lt.eq H + C_0 j quad upright("for errors corrected at order ") q^j . $ <cap:weighted-bound>]
  At each order the contact-decreasing corrections terminate by (5.8); only $d + 1$ counting orders are inspected.
    There are therefore finitely many required imposed fluxes and finitely many coefficient rows,
    and only nonnegative powers of $q$ have been used.
  A row introduced with coefficient divisible by $q^j$ has imposed flux at most $H + C_0 j$.
    If its cap class has counting degree $k$ and $j + k lt.eq d$, its outgoing contact is at most $H + C_0 j +
    C_0 k lt.eq H + C_0 d$. This argument is an estimate on each row’s curve classes;
    it does not use cancellation or its insertion values. Altering auxiliary labels,
    including removing a label to a classical factor, leaves it valid as long as the external degree conditions
    are unchanged. ◻
]

Extra compatible divisor fugacities cause no enlargement to a field of arbitrary rational functions in those
  variables. In the fiber blocks, a fixed contact fixes the fiber class,
  so its fugacity is a fixed monomial for that column. Factor out these finitely many monomials before inversion.
  At $q = 0$ the exceptional corrections decrease contact and have finite degree support by 22;
  their nilpotent inverse is finite. At positive $q$-order the truncated inversion and the preceding recursion use
  only finitely many products. They therefore introduce only finite Laurent support at the prescribed bounds.
  In particular the final nonjoining-section degree is neither used nor altered by these inverse matrices.

#prodef([Proposition 5.6.])[
  (Cap realization of the contact identity).  #emph[Fix $H \, d gt.eq 0$ in either configuration.
    Replace a seam by a right cap $Q$ on its left and a left cap $P$ on its right.
    There is a finite combination of ordinary descendant coefficient rows on these caps,
    with external joint coefficients and the left-section coefficient selections described above,
    which equals the original contact gluing form on every incoming state in $cal(F)_(lt.eq H) \( D \)$ and every
    outgoing state, modulo $q^(d + 1)$. This is equality on the full cohomologically decorated relative state
    spaces, including the empty profile.]
  #emph[The coefficients have nonnegative $q$-powers and bounded-below Laurent $ℏ$-expansions.
    At the inspected counting orders all row summands have outgoing total at most $H + C_0 d$,
    even when their auxiliary labels undergo the modifications in 24.
    The equality holds after tensoring with any fixed external graded space and separately for each replica.]
] <cap:identity>

#proof[
  Choose a homogeneous basis $u_i$ of $cal(F)_(lt.eq H) \( D \)$ and its algebraic dual $epsilon.alt_i$.
    Express the original gluing as
  $ G_ℏ \( x \, y \) = sum_i epsilon.alt_i \( x \) thin G_ℏ \( u_i \, y \) \, wide x in cal(F)_(lt.eq H) \( D \) \, $
  understood as a categorical contraction in the displayed order.
    If another order is chosen, insert its Koszul sign. By 23,
    finite $Q$ tests realize each $epsilon.alt_i$ on the incoming bounded domain,
    with the new seam gluing included. By 24, finite $P$ tests realize the state $u_i$ on the entire outgoing
    space: in particular they cancel every extraneous outgoing profile through order $d$.
    Compose these tests with the actual gluing tensors. Perfectness of $G_ℏ$ absorbs all contact orders,
    permutation denominators, and genus shifts into the external coefficients.
    Thus the two new gluings have exactly the weight of the original single gluing, rather than its square.
    The stated formula proves the desired identity.
  All inversions and products used are finite at the given bounds, with the completions justified in 22.
    The outgoing estimate is the summandwise estimate of 24. Equality before contraction with any outside state
    makes tensoring and independent replicas immediate. The empty basis vector has been included throughout Lemma
    5.2, Lemma 5.5; no nonempty-profile qualification is implicit. ◻
]

=== 5.5 Preparation at several switches <preparation-at-several-switches>

#prodef([Lemma 5.7.])[
  (Uniform preparation).  #emph[For any finite ordered list of switches and a fixed counting bound,
    the preceding tests can be chosen successively so that they are valid for every subset of switch replacements.
    All effective degrees occurring in the resulting coefficient calculations are bounded,
    after fixing the final nonjoining-section degree in the blowup configuration.
    These bounds persist when auxiliary markings are modified at any switches while their external degree
    selections are retained.]
] <cap:uniform>

#proof[
  At the original left end, an ordinary ample counting class bounds the initial matching flux.
    In the blowup case, if $E_U$ is the exceptional divisor, choose $A$ such that $A q - E_U$ is ample.
    For an effective class on this end,
  $ E_U dot.op beta lt.eq A q \( beta \) . $
  Its matching flux is $E_U dot.op beta gt.eq 0$, so both flux and ample degree on $U$ are bounded.
    In a neck, the increase in matching flux is at most $C_0$ times its counting degree, by (5.1).
    Nonnegative counting degrees on the complete chain have total at most $d$.
  Choose the incoming bound for the first switch accordingly.
    If that switch is retained, flux continues under the same neck estimate.
    If it is replaced, 25 gives a bound on the new outgoing flux before cancellation,
    depending only on the chosen incoming bound and $d$. Take the larger of these two bounds,
    propagate to the next switch, and repeat. Since there are finitely many switches,
    this produces finite bounds for all subset replacements without a circular choice of rows.
  For an exceptional neck with two matching seams, let its section degrees be $k_l \, k_r gt.eq 0$.
    The already proved flux bounds and (5.1) give a lower bound on $c_1 \( N \) dot.op alpha$.
    The ample class $A q \|_D - c_1 \( N \)$ consequently bounds the projected degree;
    either section degree fixes the remaining fiber coordinate.
    On the final $V$, the same reasoning uses its recorded value $k_r$ and bounded incoming $k_l$,
    even if the recorded value is negative. On inserted ends it uses the imposed $h$ or the bounded relative
    contact, as in 22. Ordinary ends are bounded by their ample counting degree.
    This exhausts the pieces and proves the effective-degree assertion.
  For fixed rows, their total ordinary arity is finite. The genus argument in 22 now applies to every piece,
    and to their finite products with inverse-matrix coefficients.
    Thus extraction at fixed powers of all replica parameters is legitimate.
    Modifying or removing an auxiliary insertion changes neither a selected degree nor a section-difference
    relation; it can only change a finite marking bound. The same geometric and Laurent bounds therefore remain valid. ◻
]

The ordinary cap markings in this construction are supported away from the joining divisor.
  In the normal-cone models they extend from their zero-section sources and may be specialized entirely to the
  chosen caps. Two disjoint caps have independent such extensions even if the resulting classes on a smoothing
  satisfy linear relations. One may choose homogeneous bases on the sources and expand all inverse tests
  accordingly. These observations will let 29 preintegrate ordinary auxiliary markings while recording as
  positions only those on which an operator actually acts.

== 6 Transport by capped chains <sew:section>

We now combine the local calculation of 13, the evaluation correspondences of Proposition 4.3, Proposition 4.6,
  and the cap identity of 25. The conclusion concerns tests of an absolute Virasoro error.
  The relative theories entering its proof are ordinary relative Gromov–Witten theories;
  no Virasoro constraint for a relative pair is an input.

=== 6.1 Geometry and coherent data <geometry-and-coherent-data>

#prodef([Notation 6.1.])[
  All targets in a chain have complex dimension $n$. Let $D$ be a smooth projective variety,
    possibly disconnected, and let $N$ be a line bundle on $D$.
    We use the convention that $bb(P) \( E \)$ parametrizes lines in $E$. Set
  $ C = bb(P)_D \( cal(O)_D xor N \) \, wide D_l = bb(P)_D \( N \) \, wide D_r = bb(P)_D \( cal(O)_D \) . $
  The normals of $D_l \, D_r$ in $C$ are $N^(- 1) \, N$, respectively. Thus a chain, written in its geometric order, is
  #[#set math.equation(numbering: n => "(6.1)")
   $ U divides C_1 divides dots.h.c divides C_m divides V \, wide C_i tilde.equiv C . $ <sew:chain>]
  Every displayed junction identifies a right section with a left section,
    or identifies the corresponding divisor on an end. Geometric order will be kept distinct from the bipartite
    coloring used in 13.
  At an internal junction, a #emph[surgery] separates the chain and attaches a cap $Q$ to the part on the left and
    a cap $P$ to the part on the right. In both configurations below,
  $ P = \( C \, D_r \) . $
  The following table specifies the other data. A “short target” is the smooth fiber of the indicated capped
    segment; any number of necks may be inserted into that segment.
  $ & upright("main smooth target") & Q & U divides Q & P divides Q & P divides V\
upright("ordinary") & X & \( C \, D_l \) & U & C & V\
upright("blowup") & "Bl"_S M & \( Q \, D \) & M & Q & C $
  In the ordinary row, $X$ is a smooth fiber of a given projective degeneration with smooth total space and
    central fiber $U union_D V$; $N = N_(D \/ U)$ and $N_(D \/ V) = N^(- 1)$.
    In the blowup row, $S subset M$ is a smooth center of codimension at least two,
  $ U = "Bl"_S M \, wide D = bb(P)_S \( N_(S \/ M) \) \, wide N = cal(O)_D \( - 1 \) \, wide V = C . $
  The absolute space underlying the right cap is $Q = bb(P)_S \( N_(S \/ M) xor cal(O)_S \)$,
    with relative infinity divisor $D = bb(P)_S \( N_(S \/ M) \)$.
    Here $D$ is also the exceptional divisor in $U$, and $V$ is joined along $D_l$.
    Empty centers require no blowup and may be omitted.
] <sew:configurations>

For a curve class $gamma$ in a neck, write $alpha = "pr"_(*) gamma$ and $k_l = D_l dot.op gamma$, $k_r =
  D_r dot.op gamma$. The divisor relation is

#[#set math.equation(numbering: n => "(6.2)")
 $ \[ D_r \] - \[ D_l \] = "pr"^(*) c_1 \( N \) \, wide k_r - k_l = integral_alpha c_1 \( N \) . $ <sew:flux>]

At joining sections the intersection numbers are the nonnegative total contact orders of the relative maps.
  At a nonjoining section the intersection number is an ordinary divisor degree and may have either sign.
  For disconnected $D$, all formulas and, when required, their degree conditions are imposed on its individual
  components.

#prodef([Lemma 6.2.])[
  (Realization and common local geometry).  #emph[For either configuration in 27,
    chains of arbitrarily large length and all unions of capped subchains obtained from them have projective
    semistable realizations with smooth total space. They can be colored with two colors so that every junction
    has oppositely colored ends. On any fixed region disjoint from the surgeries,
    the component and double-stratum diagrams, boundary normal identifications,
    and first-page residue operations can be identified across all the realizations.]
] <sew:geometry>

#proof[
  In the ordinary configuration start with the given two-piece family.
    After a finite base change, resolve the chain singularity;
    in a transverse chart this is the projective semistable resolution of $x y = t^a$.
    It inserts the required copies of $C$. The resolution is obtained by blowups, so is projective,
    and its total space is smooth. The same construction applied to deformation to the normal cone of the divisor
    $D subset U$, or $D subset V$, gives the capped segments with smooth fibers $U$ and $V$.
    Deformation to the normal cone of either section of $C$ gives the middle segments with smooth fiber $C$.
  For the blowup configuration, deformation to the normal cone of $D subset U$ supplies the main chain,
    with smooth fiber $U$. Deformation of $M$ to the normal cone of $S$ has central fiber $U union_D
    Q$ and gives the left capped segment. In $Q$ the normal of its infinity divisor $D$ is $cal(O)_D \( 1 \) =
    N^(- 1)$; deformation to the normal cone of that divisor gives $P divides Q$, with smooth fiber $Q$.
    The remaining segment is obtained by the divisor normal-cone degeneration of $C$.
    Inserting further levels by the same base change and resolution gives any required length.
    Take disjoint unions of these families to realize several capped segments simultaneously.
  Color the original chain alternately. At a cut, give each new cap the color opposite to its neighbor.
    Each color is consequently a disjoint union of smooth components,
    and the central fiber is a two-sided degeneration without triple intersections.
    This is the form to which the two-sided degeneration formula applies.
  Away from a surgery the smooth pairs and normal bundles have not changed.
    Their logarithmic charts factor the base generator at the same double divisors.
    Units in these local equations do not change the graded residue maps.
    The ordered configuration spaces in 16 are constructed from these same divisors and normal bundles.
    Their projected incidence neighborhoods, and the pullback, cup and trace operations on those neighborhoods,
    therefore agree by 13. This assertion concerns the local operations before passage to cohomology and makes no
    choice of global representatives for surviving cohomology classes. ◻
]

Fix coherent admissible singles, in the sense of 2, and divisor degrees in these realizations.
  The singles come from algebraic classes on the relevant total families, allowing complex linear combinations,
  or from homogeneous cohomology classes of fixed smooth projective sources through algebraic correspondences
  extending over those total families and inducing flat Hodge maps on their smooth loci.
  Coherence means that their restrictions to every common component and stratum agree,
  with the prescribed Hodge shifts. For source-supplied singles this agreement is required for the specified
  extending algebraic correspondences with their cohomology slots exposed, before applying the fixed inputs.
  Retain these correspondences until specialization and then apply their fixed inputs.
  An end-supported class is assigned zero on a capped segment not containing that end.
  In particular, zero-section Gysin classes on a cap have fixed smooth projective sources and are treated with
  their actual Gysin shifts. For the target first Chern class use $- c_1 \( omega_(cal(Y) \/ Delta) \)$;
  on a component $Y$ it restricts to $c_1 \( T Y \) - \[ partial Y \]$.
  Thus the powers of the Chern-class operation in the positive operators have coherent logarithmic restrictions on
  all common pieces.

In the ordinary configuration, choose an integral relative polarization on the original family.
  Its degree, denoted by $q$, is ample on $U$ and $V$ and is pulled back from $D$ on inserted necks and caps.
  We also denote its formal variable by $q$. In the blowup configuration,
  choose an ample integral class on $M$ and use its pullback to $U$, its restriction to $S$,
  and the further pullbacks on the bundle pieces. Every effective contribution has nonnegative counting degree.
  This counting class need not be ample on a bundle piece.

One may record additional coherent numerical divisors. In the ordinary configuration they extend over the original
  degeneration; their common seam restrictions are pulled back to the necks and caps.
  It suffices to choose lifts in the central restriction diagram, modulo the usual opposite seam twists.
  In the blowup configuration the additional divisors used away from the final end are pulled back from $M$ and
  $S$. Give their variables invertible fugacities, so fixed degree shifts in the cap coefficients are permitted.

There is one further degree condition in the blowup configuration:
  retain the degree against the nonjoining section $D_r subset V$, component by component if necessary.
  This section continues to the exceptional divisor on the main smoothing.
  Use an extension supported at that final end, with zero restriction on all other components.
  Consequently this degree is still measured on the segment containing $V$ after any surgery;
  none of the inserted caps contributes to it. The degrees against the nonjoining $D_l$ sections of inserted $P$
  caps, used in 25, are separate conditions. They continue as divisors on the corresponding short smooth targets,
  including a segment of type $P divides Q$.

Here the supported extensions can be constructed in the normal-cone families themselves.
  If $T subset Y$ is the center, the strict transform of $T times
  Delta$ in $"Bl"_(T times { 0 }) \( Y times Delta \)$ is a constant family with central fiber the zero section in
  its cap. Gysin from this family extends every class from the constant source $H^(*) \( T \)$,
  with specialization supported on that zero section. For a divisor center it also supplies the nonjoining-section
  degree class. When both ends are capped, the centers on the short smoothing are disjoint:
  they are the two sections of $C$ ordinarily, and the infinity divisor and zero section of $Q$ in the blowup
  middle segment. The two normal-cone constructions can be performed simultaneously along these disjoint centers;
  further chain insertions do not meet the zero sections. Thus both sets of supported extensions can be chosen
  independently. Relations between their classes on a smooth fiber do not prevent these choices of extensions or
  the use of labelled multilinear insertions.

=== 6.2 The tested transport statement <the-tested-transport-statement>

Let $s gt.eq 1$. Write $Z_Y^(\( r \))$ for independent replicas of the disconnected descendant potential of a
  smooth target $Y$, with independent descendant, degree, and genus variables;
  in particular the genus variables are $ℏ_1 \, dots.h \, ℏ_s$.
  Fix one replica, numbered $1$, and a positive integer $k$.
  An admissible test $sans(T)$ means a finite tensor test of the class in 2:
  it uses coherent admissible singles, first-Hodge-index functions, cups, coevaluations between arbitrary slots,
  classical integrations, and ordinary GW amplitudes in the other replicas.
  Its exposed arities, descendant orders and numerical tensor operations are fixed.
  Each test is first decomposed into homogeneous terms. Coefficient extraction in the independent replicas is part
  of the test.

#prodef([Theorem 6.3.])[
  (Tested transport).  #emph[Consider either configuration of 27,
    with the coherent admissible singles and degree data just specified.
    Suppose that all three short target types satisfy the absolute Virasoro constraints in every genus,
    every curve class, and with all cohomology insertions. Then, for every $k > 0$,
    every finite number $s$ of independent replicas, and every admissible test $sans(T)$, all coefficients of
#[#set math.equation(numbering: n => "(6.3)")
 $ sans(T) (\( L_(k \, X)^(\( 1 \)) Z_X^(\( 1 \)) \) ⊗ ⨂_(r = 2)^s Z_X^(\( r \))) $ <sew:tested-error>]

 vanish, where $X$ is the main smooth target. The coefficients are selected by the coherent degree data,
   with the final exceptional degrees retained in the blowup configuration.
   The operator acts only on replica $1$, before the test is applied.]
] <sew:transport>

The theorem is deliberately stated with the specified degree tests.
  When these distinguish all relevant curve classes, it holds per curve class;
  the curve-class verification in the application is made in 40.
  The proof will not identify individual lifted homology classes in different smoothings.

=== 6.3 Uniform preparations at the switches <uniform-preparations-at-the-switches>

Fix the test in (6.3), a desired coefficient in each $ℏ_r$,
  and a finite counting-degree bound $d_r$ in each replica. We may use their maximum $d$ for all preparations.
  Fix also the additional degree coefficients, including the final exceptional end degrees when present.
  All calculations below are in the coefficientwise completion of 25, modulo $q_r^(d_r + 1)$ in replica $r$.
  A claim of equality always refers to this completion, before the final coefficient is read.

#prodef([Lemma 6.4.])[
  (Preparations valid for every subset).  #emph[For any fixed finite ordered list of switches,
    one can choose a contact bound and cap identity test at each switch so that the following hold simultaneously
    for every subset of surgeries:]
  + #emph[all incoming states lie in the chosen bounded domain;]
  + #emph[the chosen rows themselves bound outgoing contact,
    even when a positive-operator summand acts on their auxiliary labels;]
  + #emph[every coefficient calculation is finite in the degree and auxiliary-label orders under consideration and
    is bounded below in each genus variable;]
  + #emph[at a switch with no exposed operation, the total capped correspondence is the original contact-gluing
    correspondence on all outside states.]
  #emph[Each replica has its own preparation and ordinary contact gluing.]
] <sew:preparation>

#proof[
  This is the geometric application of Proposition 5.6, Lemma 5.7;
    we spell out the bounds that are used in the cancellation.
    There are constants $C_0 \, C_1$ such that, on effective classes,
  #[#set math.equation(numbering: n => "(6.4)")
   $ integral_alpha c_1 \( N \) lt.eq C_0 q \( alpha \) \, wide D dot.op beta_U lt.eq
     C_1 q \( beta_U \) . $ <sew:degree-bounds>]
  Ordinarily these follow from ampleness on $D$ and $U$. For the blowup configuration, $-
    N$ is relatively ample over $S$, and minus the exceptional divisor is relatively ample over $M$.
    Adding sufficiently large pullbacks of the chosen ample classes gives the inequalities.
    At the initial relative end the contact is nonnegative, so the second inequality bounds its total.
    Through an unchanged neck, (6.2) bounds any increase of contact by the counting degree spent on that neck.
  At a surgically inserted $P$, the preparation imposes one of a bounded list of nonnegative initial fluxes $h$.
    Its outgoing total is
  #[#set math.equation(numbering: n => "(6.5)")
   $ a = h + integral_alpha c_1 \( N \) lt.eq h + C_0 d . $ <sew:p-flux>]
  This conclusion uses only the imposed degree condition. Altering a descendant,
    applying a grading or a Chern-class power to an auxiliary label,
    or removing labels to a classical operation does not change that condition.
    Choose the bound at the first switch from (6.4). Choose the next one using the largest of the unchanged-neck
    bound and all outgoing bounds in (6.5) from the preceding preparation.
    Continue from left to right, taking the maximum over the finitely many earlier choices.
    This proves uniformity over all subsets without requiring the identity property at a busy switch.
  For clarity, the zero-counting-degree exceptional classes have not been removed in this argument.
    If $alpha eq.not 0$ is effective and $q \( alpha \) = 0$ in the blowup configuration,
    it is vertical over $S$ and $integral_alpha c_1 \( N \) < 0$. Such terms strictly lower the outgoing contact.
    They are included in the decreasing-contact part of the inverse construction in 25.
  In the final $V$ of the blowup configuration, let $e$ be its recorded nonjoining section degree and let $a$ be
    the incoming contact. Then
  $ integral_alpha c_1 \( N \) = e - a . $
  The fixed $e$ and bounded nonnegative $a$ give the lower bound missing from a counting-degree bound alone.
    Together with relative ampleness, this bounds the effective horizontal degrees there.
    The imposed $h$ supplies the corresponding bound at inserted ends.
    At a $Q$ end, bounded incoming contact and bounded base degree bound the fiber degree.
    These are precisely the end conditions used in 26 to bound the effective degrees on all intervening pieces.
    Extra divisor fugacities consequently have finite support in the bounded blocks.
  The cap inverse has nonnegative counting-degree powers and finitely many selected auxiliary coefficient rows at
    these orders. Its genus coefficients are Laurent series bounded below.
    The same holds for the virtual sums with these bounds: the number of negative-genus-power components is
    bounded at fixed degree and marking order, unmarked constant genus-zero and genus-one components being
    unstable. Higher genus unmarked constants have positive genus power.
    This proves the needed coefficientwise finiteness, including for separate genus variables.
    Finally 25 is an equality on the full bounded relative state space,
    so it gives assertion (iv) before any contraction with the outside data. ◻
]

The auxiliary rows in this lemma need not have the same arity.
  Their ordinary markings will be preintegrated in the evaluation correspondences.
  None of the forthcoming bounds on exposed positions will depend on this variable arity.

=== 6.4 The alternating sum and its local terms <the-alternating-sum-and-its-local-terms>

We prove 29. Choose a long chain and a set $I = { 1 \, dots.h \, b }$ of widely separated internal switches.
  The number and separation will be fixed below using only the exposed test and operator data,
  before selecting any cap rows. For $A subset I$, let $X_A$ be the smooth disjoint union obtained by surgery at
  precisely the switches in $A$; let $X_diameter = X$. If $A eq.not diameter$,

#[#set math.equation(numbering: n => "(6.6)")
 $ X_A tilde.equiv
   cases(delim: "{", U product.co C^(product.co \( \| A \| - 1 \)) product.co V \, & upright("ordinary") \,, M
   product.co Q^(product.co \( \| A \| - 1 \)) product.co C \, & upright("blowup") \,) $ <sew:short-unions>]

where $Q$ in the second line denotes its absolute total space.
  These identifications concern the smooth target types, with the coherent extensions of labels and degrees
  specified above.

At every switch in $A$ and in every replica insert the prepared cap tests of 30.
  A row choice $rho$ specifies actual ordinary cap descendants, their graded coefficients,
  and the required degree projections. Write $c_(A \, rho)$ for its external coefficient,
  $sans(D)_rho^(\( r \))$ for labelled extraction of its auxiliary descendants in replica $r$,
  and $sans(P)_(A \, rho)$ for its degree projections and compensating shifts.
  Let $sans(T)_A$ be the fixed original test interpreted on $X_A$ with the chosen coherent data. Define

#[#set math.equation(numbering: n => "(6.7)")
 $ cal(E)_A = sum_rho c_(A \, rho) thin sans(P)_(A \, rho) thin sans(T)_A
   (sans(D)_rho^(\( 1 \)) \( L_(k \, X_A)^(\( 1 \)) Z_(X_A)^(\( 1 \)) \) ⊗ ⨂_(r = 2)^s sans(D)_rho^(\( r \))
   Z_(X_A)^(\( r \))) . $ <sew:subset-error>]

All descendant extractions are evaluated with the remaining auxiliary variables zero.
  Any tensor-valued row coefficients in this notation are contracted in their fixed graded order.

The order of operations in (6.7) is essential: $L_k$ acts on the full descendant potential of replica $1$ before
  its auxiliary descendants are extracted. Thus it acts on auxiliary cap labels just as on original labels,
  including a pair used by the classical quadratic term. It does not act on the external $c_(A \, rho)$ or on any
  descendant variable in another replica. In particular no differentiation of the degree or genus series defining
  the cap inverse is intended. Multilinear extraction with distinct label variables implements all marking
  multiplicities.

For $A eq.not diameter$ one has

#[#set math.equation(numbering: n => "(6.8)")
 $ cal(E)_A = 0 . $ <sew:nonempty-zero>]

Indeed, for a disjoint union of targets, the potential is the product of the potentials and the Virasoro operator
  is their sum, since the cohomology and pairing are orthogonal direct sums.
  By the hypotheses and (6.6), its full error therefore vanishes for all descendant labels.
  The auxiliary extractions, degree projections, and graded tensor tests,
  even those supplied by other GW replicas, preserve that zero identity.
  No constraint is required for any of the extra test replicas. It remains to prove

#[#set math.equation(numbering: n => "(6.9)")
 $ sum_(A subset I) \( - 1 \)^(\| A \|) cal(E)_A = 0 . $ <sew:alternating-zero>]

#prodef([Lemma 6.5.])[
  (A bound on busy switches).  #emph[There are constants $B$ and $r_0$, depending on the fixed test, $k$, and $n$,
    but independent of chain length, surgery subset, contact bounds and auxiliary row arities,
    with the following property. Each local summand in the expansion of any $cal(E)_A$ has at most $B$ busy
    switches if switches and ends are separated by more than $2 r_0 + 2$ necks.
    All its cohomological operations occur in recorded incidence neighborhoods of radius at most $r_0$.
    A switch is busy if its surgery region meets one of these neighborhoods or if an auxiliary label at that
    switch is used nonordinarily by $L_k$.]
] <sew:busy-bound>

#proof[
  Expand the fixed operator coefficient by 2. There are finitely many tensor operation patterns.
    Record the fixed original slots and every additional special GW slot.
    Record also any auxiliary slot moved to a classical operation or otherwise modified by this summand of $L_k$.
    There are at most two such exceptional auxiliary slots: the linear part acts on one existing slot,
    the classical quadratic part can use two, and the second-order part creates its own pair of slots.
    A modified auxiliary class may be evaluated using its fixed,
    Gysin-shifted first Hodge index and the coherent Chern-class cup operation.
    Its support remains at its cap; it is nevertheless counted as a position.
  All other auxiliary labels are ordinary insertions from constant cap sources.
    Integrate them into the GW correspondence, retaining only the exposed evaluations just listed.
    The construction of 16 applies with precisely that retained list;
    19 permits the other group of labels to be preintegrated without altering it.
    The dimensions of the recorded products thus have a bound determined by the original expression and the two
    exceptional slots, independently of the number of auxiliary labels.
  Now apply 13. Every first-page Casimir summand has a single local vertex or edge support,
    even when its two legs enter different replicas. All pulls,
    cups and traces involve bounded incidence neighborhoods of the recorded slots.
    Finitely many operation patterns on these bounded products give a uniform bound on their number and on a
    radius $r_0$. Increase the bound to include the finitely many projected positions from all replicas and all
    classical operations. With the stated switch separation, each such neighborhood can affect at most one switch;
    without this separation one could instead multiply by a fixed bound for its number of vertices.
    Counting inserted-cap positions at their insertion switch therefore gives a constant $B$ of the required kind.
    The argument does not count an ordinary preintegrated cap marking as a recorded factor,
    so neither the number of rows nor their arities enters $B$. ◻
]

Choose $b > B$, the indicated separation, and enough necks at both ends. Then make the preparations of 30.
  Expand every summand of (6.9) by the two-sided component rule of 16 and by the first-page calculation of 13.
  The appropriate color classes may be disconnected. In particular no condition that distant recorded positions
  lie on the same connected smooth target or on the same connected domain is imposed on the individual local summands.

=== 6.5 Cancellation of grouped correspondences <cancellation-of-grouped-correspondences>

#prodef([Lemma 6.6.])[
  (Equality at an idle switch).  #emph[Fix a local operation pattern and a switch $j$ outside its busy set.
    Keep its recorded component assignments and all data off the surgery region at $j$.
    Sum all relative-map histories, auxiliary row choices and degree decompositions inside that region.
    The resulting correspondence is equal with $j$ uncut and with $j$ cut and capped.
    This is an equality with the retained aligned evaluations and ordinary cotangent classes,
    before the remaining cohomological operations and tests are applied.]
] <sew:idle-equality>

#proof[
  At an idle switch there is no recorded position on either inserted cap,
    and no auxiliary label there is modified by $L_k$. By 28,
    all retained local component and stratum data agree on the two sides of the comparison.
    The component restriction formula of 16 is applied with these assignments fixed.
    Each color is a disjoint union of ends, necks, and caps, so every connected component of a side source lies
    over one connected component of that color. In each color,
    collect all source components mapping to the retained outside pieces into one group,
    with all of that color’s recorded positions. Use separate groups for the cap pieces at $j$.
    The retained group is allowed to be disconnected.
  Apply 19 with this grouping. Its common-refinement comparison preserves the full joint evaluation of the
    retained group into its aligned configuration space. The retained ordinary marks stabilize their own levels,
    so their cotangent classes are preserved as well. Projection formula integrates the ordinary cap groups,
    which have no recorded positions. The outside pairs and their recorded data agree on the two sides;
    hence this leaves the same outside relative correspondence,
    with two uncontracted contact-state inputs at $j$ in each replica.
    The only remaining difference is the bilinear kernel contracting these states.
    With $j$ uncut it is the ordinary contact kernel $G_(ℏ_r)$ of 25.
    With $j$ cut it is the sum of the two cap kernels with their prepared coefficients and degree conditions.
    By 25, these kernels are equal on every allowed incoming state and on every compatible outgoing state.
    30 ensures that those domains include all terms under consideration,
    including histories in which other switches are busy.
  The comparison is made separately in each replica, with its own $q_r$, $ℏ_r$, states and contact joins.
    Tensor the resulting equalities in the fixed order. Equality on the full relative state spaces permits
    subsequent contraction with arbitrary outside tensors, including tensors correlating different replicas.
    It never requires gluing a contact from one replica to a contact in another.
    All contact-order factors, finite permutation quotients, and one genus factor per joined root are already
    present in $G_(ℏ_r)$. Consequently changes in domain connectedness or in the distribution of handles require
    no supplementary sign or condition. The only signs for odd labels are the categorical tensor signs fixed throughout.
  Finally the histories are summed using the extended degree tests,
    with the compensating shifts of the cap coefficients. Their coefficientwise sums exist by 30.
    One has not chosen individual homology classes to match across different smoothings.
    The equality is therefore one of the full weighted virtual correspondences needed as input to the remaining
    local operations, as asserted. ◻
]

We finish the proof of 29. Group first by the position pattern, operator roles,
  component assignments for each recorded evaluation, and incidence and orientation data in the retained
  neighborhoods. These data determine the busy set. Every such pattern has an idle switch;
  let $j$ be its first idle switch in the fixed left-to-right order.
  Refine this grouping by the calculation outside the region at $j$, and sum all relative-map histories,
  ordinary auxiliary labels, and inverse-matrix row choices inside that region.
  These internal choices are not part of the recorded position pattern.
  The sums are legitimate coefficientwise by 30; the resolved products on the two sides have the same recorded
  factors even if the numbers of preintegrated cap markings differ.

Replacing $A$ by $A triangle.stroked.t { j }$ changes only the unrecorded history at $j$.
  It preserves the position pattern and all operator roles;
  in particular any exceptional auxiliary modifications at other switches remain the same.
  It consequently preserves the busy set and its first idle switch.
  This gives an involution on the grouped comparisons. By 32,
  the two groups supply identical tensors to every retained cohomological operation.
  They have opposite inclusion–exclusion signs, since the subset cardinality changes by one.
  Fixing the order of chain components, marked slots and cap coefficient spaces once and for all also identifies
  the graded permutation conventions on both sides.

This cancellation is between summed correspondences. It does not assert a bijection between individual stable maps
  or individual inverse-matrix rows. Empty boundary profiles, components without ordinary insertions,
  and the classical term carrying two removed labels are included:
  the first two are part of the disconnected cap identity, and the last is part of the recorded local operation
  pattern. Ordinary marks are distinguished in multilinear coefficient extraction,
  so changing a row’s number of preintegrated marks introduces no unaccounted placement multiplicity.

We have proved (6.9). All its nonempty-subset terms vanish by (6.8), leaving $cal(E)_diameter = 0$.
  This is exactly the prescribed coefficient of (6.3). The degree truncations, genus coefficients,
  additional degree coefficients and test were arbitrary. The tested transport theorem follows.

== 7 Detection of primitive error tensors <sec:detection>

The sewing theorem proves scalar identities. We now show that its class of tests detects every coefficient of the
  Virasoro error, without a restriction on the number of primitive insertions.

#prodef([Definition 7.1.])[
  A #emph[detection subspace] for a smooth projective $n$-fold $X$ is a real rational Hodge substructure
  $ B_0 subset H^(*) \( X \; bb(Q) \) $
  such that:
  + $B_0$ is spanned by homogeneous coherent admissible singles of type $\( j \, j \)$;
  + the integration pairing is nondegenerate on $B_0$;
  + $B_0$ contains all cohomology outside $H^n \( X \)$, and contains the nonprimitive middle cohomology for some
    polarization.
  We write $J = B_0^perp$, so $H^(*) \( X \; bb(C) \) = B_(0 \, bb(C)) xor J_(bb(C))$ orthogonally and $J subset
    H^n \( X \)$ is primitive.
] <det:setup>

Only the target on which an error tensor is detected needs a detection subspace.
  On the shorter targets used in sewing, the same formal combinations of coherent singles need not define projectors.

#prodef([Lemma 7.2.])[
  (Available primitive operations).  #emph[Suppose $X$ has a detection subspace.
    Its primitive coevaluation and any function of either Hodge index on a primitive leg are finite linear
    combinations of the admissible operations of 2. The same holds for the second-index operator on the full
    cohomology, after decomposition into $B_0$ and $J$.]
] <det:operations>

#proof[
  Choose a homogeneous real rational basis $b_1 \, dots.h \, b_s$ of $B_0$ from the coherent singles in 33,
    and let $g^(a b)$ be the inverse of its pairing matrix. Rational linear combinations of those singles remain
    coherent. Since these classes are even, its coevaluation is
  $ Delta_(B_0) = sum_(a \, b) g^(a b) b_a ⊗ b_b . $
  Orthogonality and nondegeneracy give
  #[#set math.equation(numbering: n => "(7.1)")
   $ Delta_J = Delta_X - Delta_(B_0) . $ <eq:primitive-coevaluation>]
  This is a full coevaluation minus a finite sum of coherent singles.
    A first-index function on either leg is admissible. On $J^(p \, q)$, one has $p + q = n$,
    so a second-index function is the corresponding function of $n - p$. On each $b_a$ both indices are known.
    Decomposing a propagator by (7.1) therefore realizes the required second-index factors as well.
  The same construction gives the projectors onto $B_0$ and $J$ by contracting one leg with the integration
    pairing. All of these are finite diagrams of permitted coevaluations, singles, and cups.
    On another target, the resulting expressions still make sense as formal test diagrams even if they no longer
    have the projector interpretation. ◻
]

#prodef([Lemma 7.3.])[
  (A positive scalar test).  #emph[Let $E in \( J_(bb(C))^(*) \)^(⊗ r)$ be a coefficient tensor obtained by
    applying one positive Virasoro coefficient rule, with fixed coherent $B_0$-inputs in all other slots.
    Its positive Hermitian squared norm can be written as a finite linear combination of admissible scalar tests
    of that same coefficient rule.]
] <det:norm>

#proof[
  The ordinary Gromov–Witten tensors and the positive coefficient operations are even,
    and every fixed $B_0$-input is even. If $n r$ is odd, the coefficient tensor $E$ therefore vanishes and the
    assertion is immediate. In the remaining cases $E$ is an even tensor.
  Let $Q_J \( v \, w \) = integral_X v union w$ and let $C_J$ be the Weil operator,
    acting by $i^(p - q)$ on $J^(p \, q)$. Hodge–Riemann gives the positive Hermitian form
  #[#set math.equation(numbering: n => "(7.2)")
   $ h_J \( v \, w \) = \( - 1 \)^(n \( n - 1 \) \/ 2) Q_J \( C_J v \, overline(w) \) . $ <eq:primitive-hermitian>]
  Our convention is linearity in the first variable. The induced Hermitian form on the dual tensor power is
    positive definite for every $r$. In an $h_J$-orthonormal basis its squared norm is
  #[#set math.equation(numbering: n => "(7.3)")
   $ parallel E parallel^2 = sum_(a_1 \, dots.h \, a_r) lr(|E \( e_(a_1) \, dots.h \, e_(a_r) \)|)^2 .
     $ <eq:error-norm>]
  For $r = 0$ this means the squared absolute value of the scalar error.
  More precisely, put $B_J \( v \, w \) = \( - 1 \)^(n \( n - 1 \) \/ 2) Q_J \( C_J v \, w \)$ and let $K_J =
    B_J^(- 1)$ be its inverse bilinear kernel. Explicitly,
  $ K_J = \( - 1 \)^(n \( n - 1 \) \/ 2) \( C_J ⊗ upright("id") \) Delta_J . $
  Pair $E$ with $E^(\#) \( w_1 \, dots.h \, w_r \) = overline(E \( macron(w)_1 \, dots.h \, macron(w)_r \))$
    through one copy of $K_J$ per corresponding slot. We order the slots as $\( 1 \, 1' \) \,
    dots.h \, \( r \, r' \)$; converting from the block order $\( 1 \, dots.h \, r \, 1' \, dots.h \, r' \)$
    contributes the fixed Koszul permutation, which is $\( - 1 \)^(r \( r - 1 \) \/ 2)$ when $J$ is odd.
    Since $E$ and $E^(\#)$ are even, their tensor-product evaluation contributes no further parity sign.
    Including the interleaving sign in the numerical coefficient makes the contraction equal to (7.3),
    the ordinary positive tensor norm rather than a supertrace.
    By 34, $K_J$ uses only admissible propagators and first-index functions, since $q = n - p$ on $J$.
    Thus it remains to realize the conjugate coefficient tensor.
  Expand $E$ by 2. The ordinary Gromov–Witten correspondence is a real cohomology class:
    it is obtained from a rational virtual cycle and ordinary evaluation and cotangent operations.
    The integration pairing and the coherent rational classes are real as well.
    Complex conjugation consequently replaces each first-index factor by the corresponding second-index factor,
    conjugates numerical coefficients, and leaves the ordinary Gromov–Witten amplitudes unchanged.
    A Chern-class multiplication has the fixed bidegree shift $\( 1 \, 1 \)$.
    Use a second ordinary replica, expand the conjugated coefficient rule term by term,
    and realize its grading factors by 34. Any classical term remains an allowed cup integral.
    Extract the specified curve and genus coefficients independently in the two replicas.
  There is no assertion that the operator acts on both replicas in the sewing theorem.
    The first replica carries the positive constraint; every summand of the conjugated expansion on the second
    replica is part of its fixed test. The latter is a finite diagram at the coefficient in question.
  Finally, order all tensor slots once. Every vector in $J$ has parity $n med mod med 2$.
    Converting the fixed order in the bilinear diagram to the ordinary positive sum (7.3) therefore introduces
    only the prescribed fixed Koszul signs; these can be included in the numerical coefficients of the tests.
    In particular, we take the norm in the full underlying tensor power,
    rather than a supertrace which could cancel positive terms. No bound on $r$ enters the argument. ◻
]

#prodef([Theorem 7.4.])[
  (Detection).  #emph[Assume that $X$ has a detection subspace,
    and that all admissible scalar tests of every positive Virasoro coefficient vanish,
    with degree weights distinguishing the curve classes under consideration.
    Then $L_k^X Z_X = 0$ for every $k > 0$, for all cohomology insertions and in each such curve class.]
] <det:detection>

#proof[
  Fix $k$, genus and curve coefficients, descendant exponents, and a labelled list of slots.
    Decompose each slot as $B_(0 \, bb(C)) xor J_(bb(C))$. In any summand put specified basis vectors of $B_0$
    into its $B_0$-slots. The remaining error is a tensor $E$ on a power of $J$.
    Every scalar test in 35 vanishes by hypothesis; hence $parallel E parallel^2 = 0$. Positivity gives $E = 0$.
    Since the fixed coefficients and all choices of slots and basis vectors were arbitrary,
    multilinearity proves the assertion. ◻
]

#prodef([Remark 7.5.])[
  The coefficients in (7.1) and the functions which describe second Hodge degree are chosen for $X$.
    Under a surgery they remain fixed external numerical data in the test.
    Their failure to describe an orthogonal projection or a positive norm on a shorter target causes no
    difficulty: the complete Virasoro identity on that target vanishes under every such linear test.
    Positivity is used only after transport, on $X$ itself.
] <det:other-targets>

== 8 Induction for complete intersections <ind:section>

We apply the transport theorem with all the tests allowed in 2.
  Throughout this section Virasoro means the ordinary descendant constraints,
  with the first Hodge grading and the super conventions fixed there.
  The two results used from the preceding sections are the tested transport statement 29 and the primitive
  detection statement 36.

=== 8.1 The toric bundle input with the first Hodge grading <the-toric-bundle-input-with-the-first-hodge-grading>

We first specify the form of the standard toric bundle result needed below.
  Let $B$ be a smooth projective variety, let $L_1 \, dots.h \, L_N$ be line bundles on $B$, and let $E arrow.r
  B$ be a smooth projective toric bundle obtained by taking, fiberwise,
  the toric quotient of $L_1 xor dots.h.c xor L_N$ by a fixed subtorus.
  The toric fiber is assumed smooth and projective. These are the bundles of #cite(label("CGT")) §1.6;
  in particular they include projectivizations of sums of line bundles.
  Write $s$ for the number of torus fixed points in the fiber.
  The fixed locus in $E$ consists of $s$ sections isomorphic to $B$.

Theorem 1.4 of #cite(label("CGT")) constructs a symplectic loop transformation $M$, with a nonequivariant limit,
  for which

#[#set math.equation(numbering: n => "(8.1)")
 $ Z_E = c thin hat(M) thin Z_B^(⊗ s) . $ <ind:descendant-transform>]

Here $c$ is a nonzero scalar independent of the descendant variables; its value is immaterial to the constraints.
  This is an identity of total descendant potentials on full super cohomology.
  The classical transformation respects the grading operators.
  We explain the passage from the half-total-degree notation in that paper to our first-index convention,
  including the normalization after quantization.

#prodef([Proposition 8.1.])[
  (Toric bundle transfer).  #emph[Suppose that the first-Hodge Virasoro constraints hold for $B$,
    in all genera and with all descendant insertions. They then hold for $E$ with the same scope.
    The assertion can be iterated for towers of the toric bundles described above.]
] <ind:toric>

#proof[
  For a smooth projective target $Y$, set
  $ mu_Y^(upright("tot")) \|_(H^(p \, q) \( Y \)) = frac(p + q - dim Y, 2) \, wide nu_Y \|_(H^(p \, q) \( Y \)) =
    frac(p - q, 2) . $
  Thus $mu_Y = mu_Y^(upright("tot")) + nu_Y$. Divisors, line-bundle Chern classes,
    and toric and equivariant parameters have Hodge difference zero.
    A Gromov–Witten correspondence preserves total Hodge difference:
    its algebraic virtual class, descendant powers, and evaluation pushforward have diagonal Hodge type.
    Consequently the transformations built from these correspondences and characteristic classes are equivariant
    for Hodge difference.
  There is a small parameter issue in applying this observation.
    Fundamental solutions at an arbitrary auxiliary parameter are Hodge-equivariant as #emph[families],
    with the corresponding action on the parameter. We need an intertwining identity on cohomology at a fixed
    parameter. Choose the auxiliary base parameter $tau_B = 0$ and retain only the toric divisor parameters.
    Such a specialization is permitted: the total descendant potentials are independent of the auxiliary
    parameters, and a single auxiliary value suffices in the construction #cite(label("CGT")) §4, footnote 11.
    It imposes no restriction on the descendant variables in (8.1).
  For completeness, this equivariance can be checked on the final nonequivariant transformation rather than on
    separate singular localization factors. In the notation of #cite(label("CGT")) §4.4,
    the transformation is the product of the matrix $T$ with the inverse of the stationary-phase matrix of the
    oscillating integral $cal(I)$; write $cal(I)_(upright("as"))$ for that matrix.
    Both matrices have columns indexed by a toric basis class times a homogeneous base class $phi.alt_b$.
    On this common column space define $nu_(upright("col"))$ to have eigenvalue $\( p_b - q_b \) \/
    2$ when $phi.alt_b$ has type $\( p_b \, q_b \)$. The toric basis classes have Hodge difference zero.
  At $tau_B = 0$, every column of the base fundamental solution has the Hodge difference of its input,
    because its coefficients are algebraic Gromov–Witten correspondences.
    The toric operations producing $T$ preserve this difference.
    The construction of $cal(I)_(upright("as"))$ uses the same base solution and differentiates it only in the
    line-bundle Chern-class directions. These directions, the toric differential operators,
    and the scalar stationary-phase coefficients all have Hodge difference zero. Consequently
  $ nu_E T = T nu_(upright("col")) \, wide nu_(B^(union.sq s)) cal(I)_(upright("as")) =
    cal(I)_(upright("as")) nu_(upright("col")) . $
  These identities include the columns indexed by odd classes.
    Forming $T cal(I)_(upright("as"))^(- 1)$ and taking its nonequivariant limit $M$ gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ nu_E M = M nu_(B^(union.sq s)) . $ <ind:nu-intertwining>]
  The classical grading identity proved in #cite(label("CGT")) §4.4, Equations (42) and (44) is
  $ (z partial_z + 1 / 2 + mu_E^(upright("tot")) + frac(c_1 \( E \) union, z)) M =
    M (z partial_z + 1 / 2 + mu_(B^(union.sq s))^(upright("tot")) + frac(c_1 \( B^(union.sq s) \) union, z)) . $
  Adding (8.2) gives the same identity with $mu$ in place of $mu^(upright("tot"))$.
    Since $M$ commutes with multiplication by $z$, it intertwines all the classical positive operators obtained
    from $l_0 \( z l_0 \)^k$.
  We use the central normalization for this new grading. For a target $Y$ of dimension $d$, the scalar in $L_0$ is
  #[#set math.equation(numbering: n => "(8.3)")
   $ C_Y = frac(chi \( Y \), 16) - 1 / 4 "str" \( mu_Y^2 \) = 1 /
     48 integral_Y #scale(x: 120%, y: 120%)[\(] \( 3 - d \) c_d \( Y \) -
     2 c_1 \( Y \) c_(d - 1) \( Y \) #scale(x: 120%, y: 120%)[\)] . $ <ind:central-normalization>]
  The equality is the Hodge-index Riemann–Roch identity, and the first-Hodge grading equation $L_0 Z_Y =
    0$ is the usual Hori equation #cite(label("Getzler1999")) Theorem 2.1 and Proposition 2.6.
    For a zero-dimensional target the second Chern-number term is omitted.
    No half-total-degree grading equation is being asserted here.
  Quantization is in the super symplectic space; the resulting cocycle uses supertrace.
    Conjugation of the first-Hodge quantized operators by $hat(M)$ can differ from the target operators only by
    scalars. For $k = 0$ the scalar difference is zero, because both operators annihilate the same nonzero
    potential in (8.1), by their first-Hodge grading equations.
    For $k eq.not 0$ the commutator with $L_0$ forces the scalar difference to vanish.
    This is precisely the argument of #cite(label("CGT")) Proposition 1.3,
    now applied with the first-Hodge operators and (8.3). In particular one need not, and in general cannot,
    identify $C_E$ with $s C_B$: the quantization cocycle accounts for their difference.
    Equation (8.1) now transfers all constraints. The same argument applies at each stage of a tower. ◻
]

=== 8.2 The splitting degeneration <the-splitting-degeneration>

Let $X subset bb(P)^(n + r)$ be a smooth complete intersection with positive degrees $\( d_1 \, dots.h \, d_r \)$,
  and choose $d_r = a + b$ with $a \, b > 0$. After a smooth deformation we can take general defining equations
  $f_1 \, dots.h \, f_r$ and general forms $g_a \, g_b$ of degrees $a \, b$. Consider the family

#[#set math.equation(numbering: n => "(8.4)")
 $ f_1 = dots.h.c = f_(r - 1) = 0 \, wide g_a g_b = t f_r . $ <ind:pencil>]

Its two central components before resolution are

$ U = { f_1 = dots.h.c = f_(r - 1) = g_a = 0 } \, wide M = { f_1 = dots.h.c = f_(r - 1) = g_b = 0 } . $

Their intersection is the smooth complete intersection

$ D = { f_1 = dots.h.c = f_(r - 1) = g_a = g_b = 0 } . $

The singular locus of the total family is

$ S = { f_1 = dots.h.c = f_(r - 1) = g_a = g_b = f_r = 0 } . $

It has dimension $n - 2$ when nonempty. Bertini gives the required smoothness and transversality for these
  choices. In $M$ its ideal is the regular sequence $\( g_a \, f_r \)$, so

#[#set math.equation(numbering: n => "(8.5)")
 $ N_(S \/ M) tilde.eq cal(O)_S \( a \) xor cal(O)_S \( d_r \) . $ <ind:split-normal>]

Transverse to $S$ the local equation of (8.4) is $x y = t z$.
  Blowing up the ideal of the appropriate central component resolves this ordinary double-point family.
  The resulting total space is smooth, its central fiber is a transverse union

#[#set math.equation(numbering: n => "(8.6)")
 $ U union_D tilde(M) \, wide tilde(M) = "Bl"_S M \, $ <ind:resolved-splitting>]

and the strict transform of $D$ is again $D$, since $S$ is a Cartier divisor in $D$.
  The two normal bundles of the seam are dual. The construction is projective,
  being a blowup of a projective family. These are also the splitting data in #cite(label("ABPZ")) Theorem 5.3 and
  its proof; we use that result here for the geometry and its curve-class qualifications,
  not as a Virasoro theorem. If $S$ is empty, no blowup is necessary.
  In dimension one $D$ can be a disconnected zero-dimensional smooth scheme and $S$ is empty.

The two ends $U$ and $M$ have smaller total degree than $X$. The seam $D$ and center $S$ have smaller dimension.
  Thus this construction is compatible with induction first on dimension and then, at fixed dimension, on

#[#set math.equation(numbering: n => "(8.7)")
 $ kappa \( d_1 \, dots.h \, d_r \) = sum_i \( d_i - 1 \) . $ <ind:complexity>]

Linear equations can be eliminated and do not change $kappa$.
  Replacing $d_r$ by either $a$ or $b$ strictly decreases $kappa$.

=== 8.3 Coherent classes for the blowup step <coherent-classes-for-the-blowup-step>

For a positive-dimensional connected complete intersection $Y$,
  let $A_Y subset H^(*) \( Y \, bb(Q) \)$ denote the image of projective-space cohomology.
  For a nonempty zero-dimensional complete intersection, let $A_Y$ be the span of its unit, that is,
  the sum of the units of its points. These subspaces are nondegenerate for their induced Poincare pairings.
  Their complements occur only in middle cohomology, by weak and hard Lefschetz.
  The zero-dimensional convention will be useful when several points form a single center.

#prodef([Lemma 8.2.])[
  (Blowup detection data).  #emph[Let $M$ be an $n$-dimensional smooth complete intersection and let $S subset
    M$ be a smooth codimension-two complete intersection cut by two ambient equations.
    Write $p : tilde(M) = "Bl"_S M arrow.r M$, $j : E arrow.r.hook tilde(M)$, and $pi : E arrow.r S$. Then
#[#set math.equation(numbering: n => "(8.8)")
 $ B_0 = p^(*) A_M xor j_(*) pi^(*) A_S $ <ind:blowup-B0>]

 is a nondegenerate rational Hodge subspace generated by diagonal Hodge classes.
   It contains all cohomology outside $H^n \( tilde(M) \)$ and all nonprimitive middle classes for a polarization
   $p^(*) H - epsilon.alt E$, with $epsilon.alt > 0$ sufficiently small and rational.
   Its indicated generators have coherent single-class lifts in the blowup configuration of 29.]
] <ind:blowup-data>

#proof[
  The codimension-two blowup formula gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ H^k \( tilde(M) \, bb(Q) \) = p^(*) H^k \( M \, bb(Q) \) xor j_(*) pi^(*) H^(k - 2) \( S \, bb(Q) \) .
     $ <ind:blowup-cohomology>]
  The second summand has Hodge shift $\( 1 \, 1 \)$. The only possible nonambient summands in (8.9) therefore
    occur for $k = n$. Put $xi = c_1 \( cal(O)_E \( 1 \) \)$, with $N_(E \/ tilde(M)) = cal(O)_E \( - 1 \)$.
    The push-pull and self-intersection formulas give, in complementary degrees,
  #[#set math.equation(numbering: n => "(8.10)")
   $ integral_(tilde(M)) p^(*) u thin j_(*) pi^(*) a & = 0 \,\
integral_(tilde(M)) j_(*) pi^(*) a thin j_(*) pi^(*) b & = - integral_E xi thin pi^(*) \( a b \) = -
  integral_S a b . $ <ind:orthogonal>]
  For the first equality, the integrand on $E$ is pulled back from $S$ and has no fiber hyperplane factor.
    These identities prove nondegeneracy of (8.8).
  The subspace $B_0$ is stable under multiplication by the ambient hyperplane and by $E$.
    Indeed the projective bundle relation expresses powers of $xi$ through Chern classes of $N_(S \/ M)$,
    and those Chern classes are ambient; the pushforward of $S$ in $M$ is ambient as well.
    Equivalently the blowup ring formula closes on the two ambient summands in (8.8).
    For small positive rational $epsilon.alt$, $p^(*) H - epsilon.alt E$ is ample.
    Since $H^(n - 2) \( tilde(M) \)$ is contained in $B_0$, so is its image under this Lefschetz operator.
    That image is the nonprimitive part of $H^n \( tilde(M) \)$.
    Orthogonality then implies that $J = B_0^perp$ is primitive middle cohomology, with its Hodge–Riemann polarization.
  When $n = 2$ and $S = { s_1 \, dots.h \, s_m }$, the exceptional part of $B_0$ is generated by $E_1 + dots.h.c +
    E_m$. Formula (8.10) has matrix $- I_m$ on the individual exceptional classes.
    The omitted differences, with coefficient sum zero, are primitive for $p^(*) H - epsilon.alt sum_i E_i$.
    They are included in $J$, not discarded. This also proves directly that the ambient constant on a
    zero-dimensional center suffices in (8.8).
  It remains to describe the lifts needed for transport. Pullbacks of ambient classes on $M$ extend by pullback
    through the normal-cone families and their inserted ruled levels.
    Each exceptional generator in (8.8) is $E$ multiplied by an ambient pullback.
    In the normal-cone expansion along $E$, the divisor $E$ follows into the nonjoining section of the final ruled
    component. Use the class Gysin-pushed from that section, multiplied by the corresponding ambient class.
    It is disjoint from the joining boundary, and hence its restriction there is zero.
    Give it zero restriction on all other pieces. These are the specializations of the indicated absolute classes,
    as can be seen from the strict transform of $E times bb(A)^1$ in the deformation to its normal cone.
    The same construction after inserting additional levels places the class at the unchanged final section.
    At a surgery it remains on the segment containing that end,
    and is zero on segments from which the end was removed. Thus all retained component restrictions agree in the
    comparisons required by 29. ◻
]

=== 8.4 Curve classes and deformation <curve-classes-and-deformation>

The degree statement in the transport theorem concerns the divisors which extend through the families.
  We record why sufficiently many such divisors are available here.

#prodef([Lemma 8.3.])[
  (Degree separation).  #emph[The ordinary and blowup configurations used in (8.6) can be equipped with coherent
    numerical divisor tests which distinguish every curve class with a possibly nonzero ordinary Gromov–Witten
    contribution, after choosing very general smooth fibers when necessary.
    The same conclusion holds for disconnected total classes.]
] <ind:degrees>

#proof[
  If a positive-dimensional complete intersection has dimension different from two,
    its integral curve homology is detected by the hyperplane degree.
    For curves this follows from $H_2 \( Y \, bb(Z) \) = bb(Z)$;
    for dimension at least three it follows from the integral Lefschetz theorem. There is no torsion ambiguity.
    Complete-intersection surfaces are simply connected, so Poincare duality and the universal coefficient theorem
    also show that their $H_2$ is torsion free.
  For a complete-intersection surface with all linear equations eliminated,
    the very general rational algebraic cohomology is ambient unless the surface is $bb(P)^2$, a quadric, a cubic,
    or an intersection of two quadrics. This is the complete-intersection Noether–Lefschetz statement used in
    #cite(label("ABPZ")) §5.2. In the nonexceptional case, ambient degree therefore distinguishes all effective
    classes on a very general fiber. A class with a nonzero primitive part is not algebraic there and cannot carry
    a stable map. Deformation invariance makes its ordinary invariant zero also on any special smooth fiber,
    with the curve class and insertions transported locally. An effective disconnected total is itself an
    algebraic class, so this argument applies to disconnected coefficients as well.
  For the exceptional surfaces, all of $H^2$ has type $\( 1 \, 1 \)$.
    Their primitive integral lattice is negative definite by Hodge–Riemann.
    The monodromy, which preserves that lattice and the hyperplane class, is consequently finite.
    The local monodromy of (8.6) is also unipotent, since the total space is smooth and the central fiber is
    semistable. It is therefore the identity. In these exceptional-surface splittings the seam $D$ is a line or a
    smooth conic, hence $H^1 \( D \, bb(Q) \) = 0$; the projective-plane base case needs no splitting.
    The Mayer–Vietoris sequence consequently identifies $H^2 \( U union_D tilde(M) \, bb(Q) \)$ with the kernel of
    the difference of the two restrictions to $H^2 \( D \, bb(Q) \)$.
    The invariant cycle theorem, with trivial monodromy, supplies a central-fiber lift of every rational divisor
    class on the nearby surface. Its image in this kernel is a matching pair
  #[#set math.equation(numbering: n => "(8.11)")
   $ \( delta_U \, delta_(tilde(M)) \) in H^2 \( U \, bb(Q) \) xor H^2 \( tilde(M) \, bb(Q) \) \, wide
     delta_U \|_D = delta_(tilde(M)) \|_D \, $ <ind:matching-divisors>]
  modulo the opposite boundary-divisor relation. One way to see the Hodge type of these representatives is to use
    the column-zero weight-complex description: restriction and Gysin are Hodge morphisms,
    and strictness permits a type-$\( 1 \, 1 \)$ representative for a pure invariant divisor class.
    Equivalently, one may take closures of invariant divisors in the resolved family.
  These representatives extend coherently across surgery. Keep the class on each retained end,
    and on every ruled neck and cap take the pullback of the common class on $D$.
    On each shortened smoothing these are the usual extensions in the deformation to a normal cone.
    Opposite boundary twists change a representative, but their contributions to the sum of degrees cancel at a
    matching contact. A basis of $H^2 \( X \, bb(Q) \)$ among these tests distinguishes all integral curve classes
    on the exceptional surface, since the latter lattice has no torsion.
  Finally, for $tilde(M) = "Bl"_S M$, the integral curve lattice is
  $ H_2 \( tilde(M) \, bb(Z) \) tilde.eq H_2 \( M \, bb(Z) \) xor H_0 \( S \, bb(Z) \) . $
  Retain the needed divisor degrees from $M$ by pullback and the degrees against each connected component of the
    exceptional divisor. The latter are represented by the nonjoining sections at the final end of the blowup
    configuration; hence they are not altered by the cap bookkeeping at an internal surgery.
    The pullback classes distinguish the first summand, and exceptional intersection distinguishes the second,
    with nonzero diagonal coefficient on its fiber generators.
    If $M$ is a nonexceptional surface we choose it very general;
    if it is exceptional we retain all its divisor degrees. The hyperplane degree and these additional tests are
    among the compatible degrees of 29. Finiteness at a fixed hyperplane and exceptional bound is part of that
    theorem. This proves the claim. ◻
]

#prodef([Lemma 8.4.])[
  (Passage to special smooth fibers).  #emph[Suppose the tested constraints,
    and hence the constraints detected by 36, hold on very general members of one of the smooth
    complete-intersection families or nested blowup families above.
    They then hold on every smooth member, for every locally transported curve class.]
] <ind:deformation>

#proof[
  Work locally in the smooth parameter space, using a topological trivialization of the cohomology and curve-class
    local systems. The ordinary Gromov–Witten evaluation tensors are flat morphisms of Hodge structures with fixed
    Tate shifts. The cup pairing and the ambient classes are flat,
    as are the ambient and exceptional subspaces in (8.8). Thus their orthogonal projectors are flat.
    Connected components of a zero-dimensional center may be labelled locally;
    their possible global permutation is irrelevant.
  Fix a coefficient error and its Hermitian-square test from 36.
    All contractions in that test have balanced Hodge type. The only nonflat ingredients in its expression in a
    flat cohomology trivialization are first-Hodge-index projectors and functions of them.
    The derivative of such a projector is first-index off-diagonal:
    differentiating its idempotence and its constant eigenspace decomposition shows that its diagonal blocks
    vanish. Replacing one projector by its derivative in the balanced contraction changes the total first Hodge
    degree while leaving all other tensor morphisms at their fixed type. The resulting scalar is zero.
    The product rule therefore shows that the Hermitian-square scalar is locally constant.
    This is the same Hodge-balance argument used for numerical tests in the degeneration calculation.
  The square vanishes on the very general fibers under consideration,
    so it vanishes throughout the connected smooth parameter space.
    Positivity in 36 proves vanishing of the error on each fiber, for all its primitive inputs.
    The ambient inputs follow from the same scalar argument without free primitive slots.
    If a curve class is nonalgebraic on a very general fiber,
    all its ordinary Gromov–Witten tensors are zero there; the preceding reasoning still applies.
    Coefficient extraction for the disconnected potential is legitimate at each fixed polarized degree and genus
    power by the finiteness conventions of 29. ◻
]

The general choices required here can be made simultaneously.
  Choose the defining forms, factors, and smoothing form in the open parameter space where all the indicated
  intersections are smooth. A fixed nonzero smooth fiber of (8.4) ranges over general complete intersections when
  its smoothing equation ranges freely. The ends and nested centers likewise range over their smooth complete
  intersection parameter spaces. Removing the relevant countable Noether–Lefschetz loci thus allows the very
  general degree assertions at every surface stage. Subsequent passage to arbitrary smooth members is supplied by 41.

=== 8.5 Completion of the induction <ind:complete>

#proof[
  A zero-dimensional smooth complete intersection is a disjoint union of points.
    The point constraints are the Witten–Kontsevich theorem #cite(label("Witten1991"))
    #cite(label("Kontsevich1992")). For a disjoint union, the potential is the product and each Virasoro operator
    is the sum of the component operators, so the assertion follows in dimension zero.
  Assume the assertion in dimensions below $n$. In dimension $n$, induct on (8.7).
    Complexity zero is projective space after eliminating linear equations.
    This is a toric bundle over a point, so 38 proves the base case.
    At positive complexity choose $d_r gt.eq 2$ and a splitting $d_r = a + b$. Use (8.6).
    Both $U$ and $M$ have smaller complexity, and $D \, S$ have smaller dimension.
    Their full constraints are therefore available by induction.
  We first establish the constraints for $tilde(M)$. If $S$ is empty, this is the assertion for $M$ already known.
    Otherwise set
  $ E = bb(P)_S \( N_(S \/ M) \) \, wide C_E = bb(P)_E \( cal(O)_E xor cal(O)_E \( - 1 \) \) \, wide Q_S =
    bb(P)_S \( N_(S \/ M) xor cal(O)_S \) . $
  In the blowup configuration of 29, the main smoothing is $tilde(M)$,
    and the three shorter target types are $M \, Q_S \, C_E$.
    By (8.5), $E$ and $Q_S$ are projectivizations of sums of line bundles over $S$,
    and $C_E$ is one more such projectivization over $E$. The constraints for $S$ and 38 give the full constraints
    for $Q_S$ and $C_E$. Thus all shorter targets required by transport are known.
  Apply 29 to obtain every tested positive constraint on $tilde(M)$.
    Use the hyperplane degree pulled back from $M$ and retain the additional degrees in 40,
    including individual exceptional degrees when the center is disconnected.
    The coherent subspace in 39 meets all the hypotheses of 36.
    Detection proves every positive constraint for $tilde(M)$, with arbitrary insertions.
    The degree tests distinguish its relevant curve classes, and 41 includes special smooth choices of the nested
    intersections. The string and grading equations, or the string equation and Virasoro commutators with the
    normalization (8.3), supply the nonpositive constraints.
  We now use the ordinary configuration for $U union_D tilde(M)$.
    Its shorter targets are $U$, $tilde(M)$, and the ruled neck
  $ C_D = bb(P)_D \( cal(O)_D xor N_(D \/ U) \) . $
  The first two have just been treated and $C_D$ has the constraints by 38 and the induction hypothesis for $D$.
    All these statements include all descendants, so they remain valid after every allowed test or auxiliary
    insertion used by transport.
  Take $B_0 = A_X$ on the smooth main target. Weak and hard Lefschetz show that $B_0$ contains the nonmiddle
    cohomology and the nonprimitive middle part, and that $B_0^perp$ is primitive. Its classes are coherent:
    restrict ambient projective classes to the two ends, and pull their common restriction on $D$ to every neck
    and cap. These are the natural extensions in the pencil and the normal-cone families.
    Theorem 29, followed by 36, proves the positive constraints for $X$ for every coefficient measured by the
    compatible degrees. By 40 this gives the constraints per curve class on the very general fibers;
    in the exceptional surface cases all divisor degrees have been retained throughout.
    Lemma 41 then gives the conclusion on every smooth complete intersection of the chosen multidegree.
    The nonpositive constraints follow as in the blowup step.
  Both induction parameters strictly decrease where invoked,
    and no restriction on genus or on the number or parity of primitive insertions was imposed.
    This proves the theorem. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
