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

#align(center)[#text(size: 16pt, weight: "bold")[Hellinger contraction with arbitrary Boolean output bias]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Hellinger conjecture asks whether a single coordinate maximizes a particular loss of Hellinger affinity under
  product noise, among all Boolean functions on a uniform cube.
  Its formulation retains the mean of the function, so biased functions are part of the question.
  Anantharam, Bogdanov, Chakrabarti, Jayram, and Nair formulated it in their 2017 manuscript and proved that it
  implies the Courtade–Kumar conjecture on the most informative Boolean function [1,10].
  This connection makes a sharp inequality for the square-root profile significant beyond that profile itself.

Let $X$ be uniform on ${ - 1 \, 1 }^n$. For $- 1 lt.eq rho lt.eq 1$, let $Y_i = X_i Z_i$,
  where the independent signs $Z_i$, also independent of $X$, satisfy $Pr \( Z_i = 1 \) = \( 1 + rho \) \/ 2$.
  The noise operator is

$ T_rho u \( x \) = bb(E) \[ u \( Y \) divides X = x \] . $

We write $H \( t \) = sqrt(1 - t^2)$ for $- 1 lt.eq t lt.eq 1$.

#thm([Theorem 1.1.])[
  (Hellinger conjecture).  #emph[For every $n gt.eq 1$, every Boolean function $f : { - 1 \, 1 }^n arrow.r { -
    1 \, 1 }$, and every $rho in \[ - 1 \, 1 \]$, writing $m = bb(E) f$, one has
#[#set math.equation(numbering: n => "(1.1)")
 $ H \( m \) - bb(E) H \( T_rho f \) lt.eq 1 - H \( rho \) . $ <eq:main>]

 Both expectations are with respect to the uniform probability measure.]
] <thm:main>

Thus the conjecture is resolved positively in its full, unbalanced form.
  Signed coordinate functions $f \( x \) = plus.minus x_i$, also called dictators,
  attain equality for every $rho$. The implication proved in [1] Proposition 1 also shows that signed coordinates
  maximize the mutual information between $f \( X \)$ and $Y$, which is the Courtade–Kumar conclusion.
  We state and prove this implication in Corollary 21, keeping its binary-entropy normalization explicit.
  Throughout the paper the input measure is uniform; arbitrary output bias means that no restriction is imposed on $m$.

To identify its Hellinger meaning, suppose $f$ is nonconstant and let $P_plus.minus$ be the conditional law of $Y$
  given $f \( X \) = plus.minus 1$. Bayes’ formula and symmetry of the noise kernel give $P_plus.minus \( y \) =
  2^(- n) \( 1 plus.minus T_rho f \( y \) \) \/ \( 1 plus.minus m \)$. Their Hellinger affinity is

$ A \( P_(+) \, P_(-) \) := sum_y sqrt(P_(+) \( y \) P_(-) \( y \)) = frac(bb(E) H \( T_rho f \), H \( m \)) . $

Thus the left side of Equation (1.1) is the weighted affinity loss $H \( m \) \( 1 - A \( P_(+) \, P_(-) \) \)$.

===== 1.1 Earlier results and methods. <earlier-results-and-methods.>

The original information problem of Courtade and Kumar [10] asks how much information a single Boolean summary
  retains about a noisy input. The square-root formulation of Anantharam et al. [1] replaces binary entropy by
  Hellinger affinity while preserving an implication to that information bound.
  It also supplies a compression principle for arbitrary convex profiles, whose concave form we use in Section 3.

Chen and Nair [9] Theorem 2, Equation (6), and Remark 5 proved a mean-dependent lower bound using the Gaussian
  isoperimetric profile. Let $phi.alt_(upright(G))$ and $Phi_(upright(G))$ be the standard Gaussian density and
  distribution function, and put $I_(upright(G)) \( p \) =
  phi.alt_(upright(G)) \( Phi_(upright(G))^(- 1) \( p \) \)$ for $0 < p < 1$, with $I_(upright(G)) \( 0 \) =
  I_(upright(G)) \( 1 \) = 0$. Writing $s = sqrt(1 - rho^2)$, their estimate is

$ bb(E) H \( T_rho f \) gt.eq 2 s thin I_(upright(G)) #h(-0.16667em) (frac(1 + m, 2)) . $

This bound holds for every Boolean mean. It implies the Hellinger inequality wherever its right side reaches
  $H \( m \) - 1 + s$, but at $m = 0$ it gives only $sqrt(2 \/ pi) thin s$, below the sharp value $s$ for $s > 0$.
  Their proof in Section III.B splits the cube into two sections and closes a recursion for a profile of their
  means. It connects this induction to Bobkov’s local two-point inequality and its tensorization on the discrete
  cube [3] Proposition 1 and Lemma 1. The induction below uses this local-to-product strategy with an asymmetric
  profile and a sheared two-point comparison; its scalar inequalities are proved here.

Durcik, Ivanisvili, Roos, and Xie [11] Theorem 1.1 and Section 5 proved the sharp square-root sensitivity
  inequality for balanced Boolean functions, confirming the low-noise consequence predicted by the Hellinger conjecture.

Recent preprints of Chen et al. [7], Ky and Tran [13], and Mahdavifar and Beirami [14] announce proofs of the
  ordinary Courtade–Kumar inequality. The Hellinger inequality studied here is a distinct functional statement:
  the implication in [1] runs from the Hellinger estimate to the ordinary Boolean information bound.

===== 1.2 Proof strategy. <proof-strategy.>

A differential approach to the Hellinger conjecture was developed by Chen, Gohari,
  and Nair in 2025 [8] Section III, Lemma 6 and Theorem 7. They express the noise-semigroup derivative of $bb(E)
  H \( T_rho f \)$ as a sum of edge costs and bound that derivative through scalar profiles.
  We use the same derivative identity, in the normalization specified in Section 4.
  The calibrated edge comparison and the spectral estimates needed for our continuation argument are proved below.

There are two complementary parts to the proof. For $s lt.eq .84$,
  we compress to increasing Boolean functions and induct in dimension.
  For each fixed $s$ we choose a concave function $G : \[ 0 \, 1 \]
  arrow.r \[ 0 \, oo \)$ and a nonnegative polynomial $B$ on $\[ - 1 \, 1 \]$, and prove the stronger bound

$ bb(E) G #scale(x: 120%, y: 120%)[\(] \( 1 + T_rho f \) \/ 2 #scale(x: 120%, y: 120%)[\)] gt.eq s B \( m \) . $

The identity $G \( p \) + G \( 1 - p \) = 2 H \( 2 p - 1 \)$ recovers the Hellinger profile when this bound is
  averaged with the bound for the increasing function $- f \( - x \)$.
  The polynomial $B$ is chosen so that the reflected lower bound is at least $H \( m \) - 1 + s$.
  The induction step controls the gain from mixing two sections by their probability difference after subtracting
  a multiple of their difference in $G$. Cauchy–Schwarz then gives an inequality involving only the section
  averages and their mean gap. Its monotone quadratic-root bound allows substitution of the induction hypotheses.
  A coordinate with small positive correlation with the output confines the comparison to a fixed scalar domain.

For $s gt.eq .84$, we continue from the established range.
  At a first failure of the target bound, its equality case would have semigroup energy no greater than the
  corresponding coordinate energy. The change of variable $F \( 0 \) = 0$, $F' =
  H^(- 3 \/ 2)$ bounds the energy below by the Dirichlet energy of $F \( T_rho f \)$.
  Near zero bias, a sharper edge bound uses a symmetric comparison pair $plus.minus x_0$ with $H \( x_0 \) =
  bb(E) H \( T_rho f \)$. This retains the exact cost of a noised coordinate.
  The resulting energy balance separates a variance gain from the possible spread of the first Fourier level;
  controlling that spread excludes a crossing unless $f$ is a signed coordinate.
  For intermediate biases, even–odd Fourier decomposition reduces the energy estimate to pointwise bounds with
  explicit bias margins. Large biases instead admit a direct proof from forward and reverse cube norm estimates.
  Figure 1 displays how their parameter ranges fit together.

The proof is computer-assisted only through fixed scalar inequalities, independent of $n$.
  Every decimal appearing as an inequality constant denotes its exact rational value.
  We give the transformations, domains, arithmetic recursions,
  and positive bounds that certify these inequalities; the supplementary sources reproduce the finite calculations.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 12.15cm, inset: 0.1764cm, radius: 4pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[For a nonconstant Boolean function, use#linebreak()$m= bb(E) f gt.eq 0$, $s= sqrt(1- rho^2)$, and $r=1-s^2$.]]])])
  content((-3.703, -2.029), [#box(width: 5.453cm, inset: 0.1764cm, radius: 4pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$0<s lt.eq .84$#linebreak()Asymmetric profile and dimension induction#linebreak()Theorem~3.1]]])])
  content((3.703, -2.223), [#box(width: 5.453cm, inset: 0.1764cm, radius: 4pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$.84 lt.eq s<1$#linebreak()Exclude a first crossing#linebreak()of the bound#linebreak()Lemma~4.1]]])])
  line((0, -0.5495), (0, -0.8495), (-3.703, -0.8495), (-3.703, -1.349), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -0.5495), (0, -0.8495), (3.703, -0.8495), (3.703, -1.349), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((-4.25, -5.623), [#box(width: 3.803cm, inset: 0.1764cm, radius: 4pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$0 lt.eq m lt.eq r^2"/"2$#linebreak()Calibrated energy#linebreak()Proposition~5.1]]])])
  content((0.05278, -5.623), [#box(width: 3.803cm, inset: 0.1764cm, radius: 4pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$r^2"/"2 lt.eq m lt.eq .74$#linebreak()Angular comparison#linebreak()and parity estimates#linebreak()Proposition~6.1]]])])
  content((4.356, -5.623), [#box(width: 3.803cm, inset: 0.1764cm, radius: 4pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$.74 lt.eq m<1$#linebreak()Direct norm estimate#linebreak()Proposition~7.1]]])])
  line((3.703, -3.097), (3.703, -3.497), (-4.25, -3.497), (-4.25, -4.899), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((3.703, -3.097), (3.703, -3.497), (0.05278, -3.497), (0.05278, -4.705), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((3.703, -3.097), (3.703, -3.497), (4.356, -3.497), (4.356, -4.926), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The proof covers all bias and noise parameters. The initial induction range supplies the starting point for continuation; the three lower boxes cover every possible nonnegative bias at a proposed crossing. The large-bias estimate proves the target directly. Endpoints and negative means are handled by continuity and symmetry. ],
) <fig:proof-regions>

===== 1.3 Organization. <organization.>

Section 2 fixes the cube conventions. Section 3 proves the dimension-induction range.
  Section 4 reduces the rest to excluding an energy crossing.
  Sections 5, 6, and 7 treat the three bias regimes and complete the proof.
  Appendix 9 records the exact-arithmetic conventions; Appendix 10 proves the scalar estimates needed for the induction.

== 2 Cube conventions and elementary reductions <sec:preliminaries>

All averages and inner products below use the uniform measure on the relevant cube.
  For a real function $u$ on ${ - 1 \, 1 }^n$, write

$ chi_S \( x \) = product_(i in S) x_i \, wide hat(u) \( S \) = bb(E) \[ u chi_S \] \, wide u =
  sum_(S subset.eq \[ n \]) hat(u) \( S \) chi_S . $

The functions $chi_S$ form an orthonormal basis: independence makes $bb(E) chi_S chi_T$ equal to $1$ if $S =
  T$ and to $0$ otherwise. Consequently,

$ "Var" \( u \) = sum_(S eq.not diameter) hat(u) \( S \)^2 . $

For later use set $W_k \( u \) = sum_(\| S \| = k) hat(u) \( S \)^2$.

Let $bb(E)_i$ average only coordinate $i$, and define

$ D_i = I - bb(E)_i \, wide cal(N) = sum_(i = 1)^n D_i . $

Thus $D_i u \( x \) = \( u \( x \) - u \( x^(\( i \)) \) \) \/ 2$, where $x^(\( i \))$ reverses coordinate $i$.
  The projections $D_i$ are self-adjoint and satisfy

#[#set math.equation(numbering: n => "(2.1)")
 $ bb(E) \[ u cal(N) v \] = sum_i bb(E) \[ D_i u thin D_i v \] =
   sum_S \| S \| thin hat(u) \( S \) hat(v) \( S \) . $ <eq:dirichlet>]

Independence in the noise definition gives $T_rho chi_S = rho^(\| S \|) chi_S$.
  Hence, for $tau gt.eq 0$, $T_(e^(- tau)) = e^(- tau cal(N))$.
  These elementary facts are also standard in the analysis of Boolean functions [16];
  their normalizations are specified here to fix every factor of two.

We first remove the endpoints and symmetries. The identity

$ T_(- rho) f \( x \) = T_rho f \( - x \) $

shows that it suffices to consider $rho gt.eq 0$. At $rho = 0$, the left side of Equation (1.1) is zero.
  At $rho = 1$, it equals $H \( m \) lt.eq 1$. For a constant $f$, it is again zero.
  For $0 < rho < 1$ and nonconstant $f$, every input has positive noise probability, so

$ - 1 < T_rho f \( x \) < 1 wide upright("for every ") x . $

All differentiations involving $H$ below are therefore legitimate.
  Finally, replacing $f$ by $- f$ preserves both sides of Equation (1.1) and reverses $m$.

== 3 Dimension induction <sec:induction>

We first prove the desired inequality in the range reached by dimension induction.
  Every decimal in this section denotes an exact rational number.

#thm([Theorem 3.1.])[
  #emph[Let $f : { - 1 \, 1 }^n arrow.r { - 1 \, 1 }$, let $m = bb(E) f$, and let $0 < rho < 1$.
    If $s = sqrt(1 - rho^2) lt.eq .84$, then
$ bb(E) H \( T_rho f \) gt.eq H \( m \) - 1 + s . $

]
] <thm:induction>

We strengthen the desired bound to an inequality for a nonsymmetric function of the noisy output.
  Averaging this inequality with its reflected version will recover $H$.
  The induction uses an asymmetric function $G$ and a polynomial profile $B$.
  The scalar inequalities that support it are stated in Lemma 5 and proved by the finite arithmetic certificates
  in Appendix 10. We first establish the two reductions that explain their domains.

=== 3.1 Compression and a small coordinate <compression-and-a-small-coordinate>

The following sorting argument is the concave-profile form of the compression principle of Anantharam, Bogdanov,
  Chakrabarti, Jayram, and Nair [1] Proposition 2. We include the short proof to specify its direction for $H$.
  We order the cube coordinatewise using $- 1 < 1$. A function is #emph[increasing] if it is nondecreasing in each
  coordinate.

#thm([Lemma 3.2.])[
  (Compression).  #emph[For every Boolean function $f$ there is an increasing Boolean function $tilde(f)$ with the
    same mean such that
$ bb(E) H \( T_rho tilde(f) \) lt.eq bb(E) H \( T_rho f \) . $

]
] <ind:lem:compression>

#proof[
  Fix a coordinate, and write $f_(-) \, f_(+)$ for its two sections.
    Replace them pointwise by $min \( f_(-) \, f_(+) \) \, max \( f_(-) \, f_(+) \)$, respectively.
    Let $T$ denote noise in the remaining coordinates and put
  $ a = T #scale(x: 120%, y: 120%)[\(] \( f_(-) + f_(+) \) \/ 2 #scale(x: 120%, y: 120%)[\)] \, wide c =
    T #scale(x: 120%, y: 120%)[\(] \( f_(+) - f_(-) \) \/ 2 #scale(x: 120%, y: 120%)[\)] . $
  Sorting preserves $a$ and replaces $c$ by
  $ c' = T #scale(x: 120%, y: 120%)[\(] \| f_(+) - f_(-) \| \/ 2 #scale(x: 120%, y: 120%)[\)] gt.eq \| c \| \, $
  since $T$ has a nonnegative kernel. The two fully noised values are $a plus.minus rho c$ before sorting and $a
    plus.minus rho c'$ afterwards. For fixed $a$, the function $u mapsto H \( a + u \) +
    H \( a - u \)$ is even and concave on its domain, and hence nonincreasing for $u gt.eq 0$.
    Thus sorting weakly decreases the pair average of $H$. It preserves the mean.
  Perform this operation once in each coordinate. If the function is already increasing in a different coordinate,
    both its sections are increasing in that coordinate; their pointwise minimum and maximum remain increasing.
    The resulting function is therefore increasing in every coordinate. ◻
]

Call a coordinate #emph[active] if the function depends on it.
  Inactive coordinates may be omitted from all expectations below. Define

#[#set math.equation(numbering: n => "(3.1)")
 $ b \( m \) = min {3 / 8 \, 9 / 16 - frac(\| m \|, 2) \, 1 - \| m \|} \, wide - 1 lt.eq m lt.eq 1 . $ <ind:eq:b>]

#thm([Lemma 3.3.])[
  (Choice of a coordinate).  #emph[If an increasing Boolean function of mean $m$ has at least four active
    coordinates, one of them has first-level coefficient
$ 0 < x = bb(E) \[ f \( X \) X_i \] lt.eq b \( m \) . $

 The two sections in this coordinate have means $m - x$ and $m + x$.]
] <ind:lem:coordinate>

#proof[
  For an increasing Boolean function, the coefficient of coordinate $i$ is
  $ x_i = bb(E) #scale(x: 120%, y: 120%)[\[] \( f_(+) - f_(-) \) \/ 2 #scale(x: 120%, y: 120%)[\]] . $
  The integrand takes values in ${ 0 \, 1 }$, so $x_i > 0$ precisely when the coordinate is active.
    Choose a coordinate with the least active coefficient $x$. For any four distinct active coordinates,
  $ x lt.eq frac(x_(i_1) + x_(i_2) + x_(i_3) + x_(i_4), 4) = bb(E) \[ f \( X \) Z \] \, wide Z =
    frac(X_(i_1) + X_(i_2) + X_(i_3) + X_(i_4), 4) . $
  The distribution of $Z$, in decreasing order, is
  $ z & 1 & 1 \/ 2 & 0 & - 1 \/ 2 & - 1\
Pr \( Z = z \) & 1 \/ 16 & 4 \/ 16 & 6 \/ 16 & 4 \/ 16 & 1 \/ 16 . $
  At fixed mean $m$, the largest possible $bb(E) \[ f Z \]$ is obtained by placing the positive values of $f$ at
    the largest values of $Z$, allowing a fraction of the threshold level.
    Indeed, transfer of positive mass from a smaller value of $Z$ to a larger one can only increase the objective;
    allowing fractional values is a relaxation and therefore gives an upper bound for Boolean $f$.
    Since $bb(E) Z = 0$ and the law of $Z$ is symmetric, this maximum is twice the integral over its top fraction
    $q = \( 1 - \| m \| \) \/ 2$. For $q in \[ 0 \, 1 \/ 2 \]$ that quantity is
  $
    cases(delim: "{", 2 q \, & 0 lt.eq q lt.eq 1 \/ 16 \,, q + 1 \/ 16 \, & 1 \/ 16 lt.eq q lt.eq 5 \/ 16 \,, 3 \/
    8 \, & 5 \/ 16 lt.eq q lt.eq 1 \/ 2 .) $
  These are exactly the three pieces of $b \( m \)$. Finally,
    the section means have average $m$ and half-difference $x$, proving the last claim. ◻
]

=== 3.2 The scalar interface <the-scalar-interface>

For the fixed value of $s$, use one row of Table 1 whose interval contains $s$.
  The profile polynomials use a finer subdivision of these same intervals, specified in Appendix 10.
  At a shared endpoint, choose the parameters and the profile consistently from one adjoining interval.
  Put $delta = \( 1 - rho \) \/ 2$, so that $4 delta \( 1 - delta \) = s^2$;
  the auxiliary bounds in the table satisfy $r_0^2 lt.eq delta lt.eq r_1^2$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 11,
  align: (right, right, right, right, right, right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[$s_(upright("lo"))$
], table.cell(rowspan: 1, colspan: 1)[$s_(upright("hi"))$
], table.cell(rowspan: 1, colspan: 1)[$r_0$
], table.cell(rowspan: 1, colspan: 1)[$r_1$
], table.cell(rowspan: 1, colspan: 1)[$L$
], table.cell(rowspan: 1, colspan: 1)[$U$
], table.cell(rowspan: 1, colspan: 1)[$V$
], table.cell(rowspan: 1, colspan: 1)[$alpha$
], table.cell(rowspan: 1, colspan: 1)[$Lambda$
], table.cell(rowspan: 1, colspan: 1)[$mu$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[70
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[36
], table.cell(rowspan: 1, colspan: 1)[940
], table.cell(rowspan: 1, colspan: 1)[$- 440$
], table.cell(rowspan: 1, colspan: 1)[300
], table.cell(rowspan: 1, colspan: 1)[960
], table.cell(rowspan: 1, colspan: 1)[1000
], table.cell(rowspan: 1, colspan: 1)[956
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[70
], table.cell(rowspan: 1, colspan: 1)[160
], table.cell(rowspan: 1, colspan: 1)[35
], table.cell(rowspan: 1, colspan: 1)[81
], table.cell(rowspan: 1, colspan: 1)[940
], table.cell(rowspan: 1, colspan: 1)[$- 440$
], table.cell(rowspan: 1, colspan: 1)[300
], table.cell(rowspan: 1, colspan: 1)[930
], table.cell(rowspan: 1, colspan: 1)[1050
], table.cell(rowspan: 1, colspan: 1)[953
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[160
], table.cell(rowspan: 1, colspan: 1)[300
], table.cell(rowspan: 1, colspan: 1)[80
], table.cell(rowspan: 1, colspan: 1)[152
], table.cell(rowspan: 1, colspan: 1)[886
], table.cell(rowspan: 1, colspan: 1)[$- 398$
], table.cell(rowspan: 1, colspan: 1)[250
], table.cell(rowspan: 1, colspan: 1)[860
], table.cell(rowspan: 1, colspan: 1)[1150
], table.cell(rowspan: 1, colspan: 1)[985
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[300
], table.cell(rowspan: 1, colspan: 1)[490
], table.cell(rowspan: 1, colspan: 1)[151
], table.cell(rowspan: 1, colspan: 1)[254
], table.cell(rowspan: 1, colspan: 1)[842
], table.cell(rowspan: 1, colspan: 1)[$- 335$
], table.cell(rowspan: 1, colspan: 1)[180
], table.cell(rowspan: 1, colspan: 1)[770
], table.cell(rowspan: 1, colspan: 1)[1150
], table.cell(rowspan: 1, colspan: 1)[1024
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[490
], table.cell(rowspan: 1, colspan: 1)[630
], table.cell(rowspan: 1, colspan: 1)[253
], table.cell(rowspan: 1, colspan: 1)[335
], table.cell(rowspan: 1, colspan: 1)[842
], table.cell(rowspan: 1, colspan: 1)[$- 335$
], table.cell(rowspan: 1, colspan: 1)[180
], table.cell(rowspan: 1, colspan: 1)[690
], table.cell(rowspan: 1, colspan: 1)[1150
], table.cell(rowspan: 1, colspan: 1)[1058
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[630
], table.cell(rowspan: 1, colspan: 1)[750
], table.cell(rowspan: 1, colspan: 1)[334
], table.cell(rowspan: 1, colspan: 1)[412
], table.cell(rowspan: 1, colspan: 1)[842
], table.cell(rowspan: 1, colspan: 1)[$- 335$
], table.cell(rowspan: 1, colspan: 1)[180
], table.cell(rowspan: 1, colspan: 1)[632
], table.cell(rowspan: 1, colspan: 1)[1160
], table.cell(rowspan: 1, colspan: 1)[1087
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[750
], table.cell(rowspan: 1, colspan: 1)[840
], table.cell(rowspan: 1, colspan: 1)[411
], table.cell(rowspan: 1, colspan: 1)[479
], table.cell(rowspan: 1, colspan: 1)[842
], table.cell(rowspan: 1, colspan: 1)[$- 335$
], table.cell(rowspan: 1, colspan: 1)[180
], table.cell(rowspan: 1, colspan: 1)[583
], table.cell(rowspan: 1, colspan: 1)[1160
], table.cell(rowspan: 1, colspan: 1)[1111
],
)
]],
  caption: [Table 1: Induction parameters. Every displayed entry except $i$ is $1000$ times the corresponding parameter. ],
)

Define

#[#set math.equation(numbering: n => "(3.2)")
 $ lambda \( h \) & = L + U h + V h^2 \,\
G \( p \) & = H \( 2 p - 1 \) (1 + frac(2 p - 1, 1 + H \( 2 p - 1 \) lambda \( H \( 2 p - 1 \) \))) \, wide
  0 lt.eq p lt.eq 1 . $ <ind:eq:G>]

All rows have $U < 0$, $V gt.eq 0$, and $L + U gt.eq .488$.
  Thus $lambda \( h \) gt.eq L + U > 0$ for $0 lt.eq h lt.eq 1$, and $G$ is nonnegative, with $G \( 0 \) =
  G \( 1 \) = 0$. Its defining asymmetry cancels under reflection:

#[#set math.equation(numbering: n => "(3.3)")
 $ G \( p \) + G \( 1 - p \) = 2 H \( 2 p - 1 \) . $ <ind:eq:G-reflection>]

The profiles in the next lemma are explicit polynomials of the form

#[#set math.equation(numbering: n => "(3.4)")
 $ B \( m \) = \( 1 - m^2 \) P \( m \) \, wide P \( m \) = 1 +
   10^(- 8) sum_(j gt.eq 1) c_j #scale(x: 120%, y: 120%)[\(] T_j \( m \) -
   T_j \( 0 \) #scale(x: 120%, y: 120%)[\)] \, $ <ind:eq:profile-def>]

where only finitely many $c_j$ are nonzero, and $T_0 \( u \) = 1$, $T_1 \( u \) = u$, $T_(j + 1) \( u \) =
  2 u T_j \( u \) - T_(j - 1) \( u \)$. The integer coefficients and their arithmetic verification are given in
  Appendix 10.

With these functions, the estimate we will propagate is

$ bb(E) G #scale(x: 120%, y: 120%)[\(] \( 1 + T_rho f \) \/ 2 #scale(x: 120%, y: 120%)[\)] gt.eq
  s B \( m \) wide \( m = bb(E) f \) $

for every increasing Boolean function $f$. Its dual $f^(*) \( x \) = - f \( - x \)$ is increasing and has mean $-
  m$. Noise commutes with input reversal, so averaging the proposed estimates for $f$ and $f^(*)$ and using
  Equation (3.3) would give

$ bb(E) H \( T_rho f \) gt.eq s / 2 #scale(x: 120%, y: 120%)[\(] B \( m \) +
  B \( - m \) #scale(x: 120%, y: 120%)[\)] . $

Thus we need a profile whose reflected average reaches $H \( m \) - 1 + s$,
  and an estimate for $G$ that passes from two sections to their parent.
  The next lemma supplies the two-point gap used in this passage, the reflected comparison,
  the condition that closes induction on the small-coordinate domain, and the initial cases.

#thm([Lemma 3.4.])[
  (Scalar inequalities).  #emph[For every $0 < s lt.eq .84$,
    choose the parameters and the polynomial $B$ as above. Then $B gt.eq 0$ on $\[ - 1 \, 1 \]$, $B \( 0 \) = 1$,
    $B \( plus.minus 1 \) = 0$, and the following four assertions hold.]
  + #emph[For $0 lt.eq p_0 lt.eq p_1 lt.eq 1$, write $z = p_1 - p_0$ and $p_u = p_0 + u z$, and set
$ D = frac(G \( p_delta \) + G \( p_(1 - delta) \) - G \( p_0 \) - G \( p_1 \), 2) \, wide S =
  alpha G \( p_1 \) + \( 1 - alpha \) G \( p_0 \) . $

 Then $D gt.eq 0$ and
#[#set math.equation(numbering: n => "(3.5)")
 $ D \( S + Lambda D \) gt.eq mu s^2 (z - frac(G \( p_1 \) - G \( p_0 \), 4 L))^2 . $ <ind:eq:pair>]

]
  + #emph[For every $m in \[ - 1 \, 1 \]$,
#[#set math.equation(numbering: n => "(3.6)")
 $ s / 2 #scale(x: 120%, y: 120%)[\(] B \( m \) + B \( - m \) #scale(x: 120%, y: 120%)[\)] gt.eq H \( m \) - 1 +
   s . $ <ind:eq:reflection-profile>]

]
  + #emph[For $m in \[ - 1 \, 1 \]$ and $0 < x lt.eq b \( m \)$, put
$ B_plus.minus = B \( m plus.minus x \) \, wide C = frac(B_(+) - B_(-), 2 x) \, wide A =
  frac(2 B \( m \) - B_(+) - B_(-), 2 x^2) . $

 Then
#[#set math.equation(numbering: n => "(3.7)")
 $ A #scale(x: 120%, y: 120%)[\[] B \( m \) + \( 2 alpha - 1 \) x C + \( Lambda - 1 \) x^2 A
   #scale(x: 120%, y: 120%)[\]] lt.eq mu (1 - frac(s, 2 L) C)^2 . $ <ind:eq:profile>]

]
  + #emph[Every increasing Boolean function depending on at most three coordinates satisfies
#[#set math.equation(numbering: n => "(3.8)")
 $ bb(E) G #scale(x: 120%, y: 120%)[\(] \( 1 + T_rho f \) \/ 2 #scale(x: 120%, y: 120%)[\)] gt.eq
   s B \( bb(E) f \) . $ <ind:eq:base>]

]
] <lem:scalar>

The four assertions of Lemma 5, including the entire three-coordinate base case, are proved in Appendix 10.
  We now show how the pair bound and profile comparison propagate the asymmetric estimate from three active
  coordinates to arbitrary dimension.

=== 3.3 Averaging and dimension induction <averaging-and-dimension-induction>

#thm([Proposition 3.5.])[
  #emph[For the fixed $s$, parameters, and profile above, every increasing Boolean function satisfies
#[#set math.equation(numbering: n => "(3.9)")
 $ bb(E) G #scale(x: 120%, y: 120%)[\(] \( 1 + T_rho f \) \/ 2 #scale(x: 120%, y: 120%)[\)] gt.eq
   s B \( bb(E) f \) . $ <ind:eq:all-dimensions>]

]
] <ind:prop:asymmetric>

#proof[
  Induct on the number of active coordinates. Lemma 5(4) provides the cases with at most three.
    Otherwise choose the coordinate in Lemma 4, and denote its increasing sections by $f_(-)$ and $f_(+)$,
    with means $m - x$ and $m + x$. On the smaller cube let
  $ p_0 = frac(1 + T_rho f_(-), 2) \, wide p_1 = frac(1 + T_rho f_(+), 2) . $
  In these expressions, $T_rho$ acts only on the remaining coordinates.
    Positivity of its kernel gives $p_0 lt.eq p_1$, and $bb(E) \( p_1 - p_0 \) = x$.
    At the two values of the chosen coordinate the parent noise probabilities are $p_delta$ and $p_(1 - delta)$.
  Apply Equation (3.5) pointwise, allowing $p_0 = p_1$, in which case both $D$ and the expression on the right
    vanish. Set
  $ y = frac(bb(E) G \( p_1 \), s) \, wide t = frac(bb(E) G \( p_0 \), s) \, wide e = frac(bb(E) D, s) \, wide k =
    frac(s, 2 L) \, wide Q = alpha y + \( 1 - alpha \) t . $
  All of $y \, t \, e \, Q$ are nonnegative. To average the pair inequality, write $w = p_1 -
    p_0 - \( G \( p_1 \) - G \( p_0 \) \) \/ \( 4 L \)$. Cauchy–Schwarz yields
  $ \( bb(E) D \) thin bb(E) \( S + Lambda D \) & gt.eq (bb(E) sqrt(D \( S + Lambda D \)))^2\
 & gt.eq mu s^2 \( bb(E) \| w \| \)^2 gt.eq mu s^2 \( bb(E) w \)^2 . $
  No fixed sign of $w$ is required. Since $bb(E) w = x - k \( y - t \) \/ 2$, division by $s^2$ gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ e \( Q + Lambda e \) gt.eq mu [x - k / 2 \( y - t \)]^2 . $ <ind:eq:averaged-pair>]
  The parent expectation divided by $s$ equals $\( y + t \) \/ 2 + e$.
    Solving Equation (3.10) for the nonnegative variable $e$ therefore gives the lower bound
  #[#set math.equation(numbering: n => "(3.11)")
   $ R_x \( y \, t \) = frac(y + t, 2) + frac(sqrt(Q^2 + 4 Lambda mu v^2) - Q, 2 Lambda) \, wide v = x - k /
     2 \( y - t \) . $ <ind:eq:R>]
  We next justify substitution of the induction bounds into this root. Put $Delta = sqrt(Q^2 + 4 Lambda mu v^2)$.
    For $y \, t > 0$,
  $ partial_y R_x & = 1 / 2 - frac(alpha, 2 Lambda) + frac(alpha Q - 2 Lambda mu k v, 2 Lambda Delta) \,\
partial_t R_x & = 1 / 2 - frac(1 - alpha, 2 Lambda) + frac(\( 1 - alpha \) Q + 2 Lambda mu k v, 2 Lambda Delta) . $
  Using $Q gt.eq 0$ and $\| v \| \/ Delta lt.eq 1 \/ \( 2 sqrt(Lambda mu) \)$, each derivative is at least
  #[#set math.equation(numbering: n => "(3.12)")
   $ 1 / 2 (1 - frac(max \( alpha \, 1 - alpha \), Lambda) - k sqrt(mu / Lambda)) > 0 . $ <ind:eq:root-derivative>]
  For completeness, the strict sign follows by rational arithmetic from Table 1.
    If $a = 1 - max \( alpha \, 1 - alpha \) \/ Lambda$, every row has $a > 0$ and
  $ a^2 - (frac(s_(upright("hi")), 2 L))^2 mu / Lambda gt.eq 12133 / 44180000 > 0 . $
  Since $s lt.eq s_(upright("hi"))$, this proves the sign in Equation (3.12).
    Continuity extends coordinatewise monotonicity of $R_x$ to the whole nonnegative quadrant.
  Each section has fewer active coordinates, so the induction hypothesis implies $y gt.eq B_(+)$ and $t gt.eq
    B_(-)$. We have consequently obtained the lower bound $R_x \( B_(+) \, B_(-) \)$ for the normalized parent
    expectation. In the notation of Lemma 5(3), at these arguments
  $ frac(B_(+) + B_(-), 2) = B \( m \) - x^2 A \, wide Q = B \( m \) - x^2 A + \( 2 alpha - 1 \) x C \, wide v =
    x \( 1 - k C \) . $
  If $A lt.eq 0$, the first of these terms is already at least $B \( m \)$,
    and the root correction in Equation (3.11) is nonnegative. Suppose $A > 0$.
    The correction is the nonnegative solution $u$ of $u \( Q + Lambda u \) = mu x^2 \( 1 - k C \)^2$.
    Because $Q gt.eq 0$ and $Lambda > 0$, the left side is increasing for $u gt.eq 0$.
    Equation (3.7), multiplied by $x^2$, states that
  $ \( x^2 A \) \( Q + Lambda x^2 A \) & = x^2 A #scale(x: 120%, y: 120%)[\[] B \( m \) + \( 2 alpha - 1 \) x
    C + \( Lambda - 1 \) x^2 A #scale(x: 120%, y: 120%)[\]]\
 & lt.eq mu x^2 \( 1 - k C \)^2 . $
  Thus the correction is at least $x^2 A$, and again $R_x \( B_(+) \, B_(-) \) gt.eq B \( m \)$.
    This completes the induction. ◻
]

#proof[
  By Lemma 3, it suffices to consider increasing $f$. Its dual $f^(*) \( x \) = -
    f \( - x \)$ is also increasing and has mean $- m$. Noise commutes with input reversal,
    so $T_rho f^(*) \( x \) = - T_rho f \( - x \)$. Apply Proposition 6 to $f$ and $f^(*)$,
    average the two inequalities, and change variables $x mapsto - x$ in the second expectation. Equation (3.3) gives
  $ bb(E) H \( T_rho f \) gt.eq s / 2 #scale(x: 120%, y: 120%)[\(] B \( m \) +
    B \( - m \) #scale(x: 120%, y: 120%)[\)] gt.eq H \( m \) - 1 + s \, $
  where the last inequality is Equation (3.6). ◻
]

== 4 A continuation criterion <sec:continuation>

The notation in this section and the next three is independent of the induction parameters.
  Fix a nonconstant Boolean $f$, use output-sign symmetry to take $m = bb(E) f gt.eq 0$, and put

#[#set math.equation(numbering: n => "(4.1)")
 $ s = sqrt(1 - rho^2) \, wide r = rho^2 = 1 - s^2 \, wide d = T_rho f \,\
h = H \( m \) \, wide b = bb(E) H \( d \) \, wide v = 1 - s \, wide K = r / s . $ <eq:continuation-notation>]

We work with $.84 lt.eq s < 1$, so $0 < r lt.eq .2944$.

Define

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(E) \( d \) = bb(E) sum_i D_i d thin D_i #h(-0.16667em) (frac(d, H \( d \))) . $ <eq:energy-definition>]

For the parameter $tau = - log rho$, one has $partial_tau d = - cal(N) d$.
  Since $H' \( z \) = - z \/ H \( z \)$, Equation (2.1) yields

#[#set math.equation(numbering: n => "(4.3)")
 $ frac(d b, d tau) = cal(E) \( d \) \, wide frac(d s, d tau) = r / s = K . $ <eq:energy-derivative>]

This identity is the Hellinger edge derivative of Chen, Gohari, and Nair [8] Section III,
  Lemma 6 in our generator normalization: their parameter has $rho = e^(- 2 t)$, so $tau = 2 t$ here.

#thm([Lemma 4.1.])[
  (Crossing criterion).  #emph[Suppose Equation (1.1) is known for $s lt.eq .84$.
    If it fails for some $s > .84$, then for the same function there is a parameter $.84 lt.eq s < 1$ for which
#[#set math.equation(numbering: n => "(4.4)")
 $ b = h - 1 + s \, wide cal(E) \( d \) lt.eq K . $ <eq:crossing>]

 It is enough to exclude Equation (4.4) for functions other than signed coordinates.]
] <lem:crossing>

#proof[
  The desired inequality is $b - h + 1 - s gt.eq 0$. If this expression is negative at some finite semigroup time,
    take the left endpoint $tau_0$ of the connected component of strict negativity containing that time,
    restricted to times after $s = .84$. Continuity gives equality at $tau_0$.
    The right difference quotients there are nonpositive, so differentiability and Equation (4.3) give the energy
    inequality in Equation (4.4). For $f = plus.minus x_i$, one has $m = 0$, $d = plus.minus rho x_i$, and $b =
    s$, so the desired inequality is an identity for every parameter. ◻
]

The following change of variable will be used in the two smaller bias regimes:

#[#set math.equation(numbering: n => "(4.5)")
 $ F \( x \) = integral_0^x \( 1 - z^2 \)^(- 3 \/ 4) thin d z \, wide g = F \( d \) . $ <eq:F-definition>]

The function $F$ is odd, increasing, and has finite limits at $plus.minus 1$.

#thm([Lemma 4.2.])[
  (Basic energy comparison).  #emph[With the preceding notation,
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(E) \( d \) gt.eq sum_i bb(E) \( D_i g \)^2 gt.eq "Var" \( g \) . $ <eq:basic-energy>]

]
] <lem:basic-energy>

#proof[
  For the two values $z_(-) lt.eq z_(+)$ of $d$ on an edge, the edge contributions have the respective forms
  $ 1 / 4 \( z_(+) - z_(-) \) (frac(z_(+), H \( z_(+) \)) - frac(z_(-), H \( z_(-) \))) \, wide 1 /
    4 \( F \( z_(+) \) - F \( z_(-) \) \)^2 . $
  The derivative of $x \/ H \( x \)$ is $H \( x \)^(- 3) = \( F' \( x \) \)^2$,
    so Cauchy–Schwarz on $\[ z_(-) \, z_(+) \]$ compares these in the required direction.
    The case $z_(-) = z_(+)$ follows by continuity. Summing over edges proves the first inequality.
    The second follows from Equation (2.1), since every nonconstant Fourier degree is at least one. ◻
]

The two smaller bias ranges will combine these energy comparisons with upper bounds on the variance of $d$ and its
  odd part. Booleanity supplies the following bounds.

#thm([Lemma 4.3.])[
  (Boolean spectral bounds).  #emph[Set
$ p = frac(1 - m, 2) \, wide w = min {2 p \, thick 4 sqrt(3 / 2) thin p^(3 \/ 2)} . $

 Then
#[#set math.equation(numbering: n => "(4.7)")
 $ W_1 \( f \) & lt.eq w \,\
"Var" \( d \) & lt.eq r \[ \( 1 - r \) w + r h^2 \] . $ <eq:first-level-bound>]

 If $d_(upright(o)) \( x \) = \( d \( x \) - d \( - x \) \) \/ 2$ is the odd part of $d$, then
#[#set math.equation(numbering: n => "(4.8)")
 $ bb(E) d_(upright(o))^2 lt.eq r \[ \( 1 - r^2 \) w + r^2 h^2 \] . $ <eq:odd-variance-bound>]

]
] <lem:fourier-bounds>

#proof[
  Write $L_(+) = max \( L \, 0 \)$ and $L_(-) = max \( - L \, 0 \)$.
    For a homogeneous linear form $L = sum_i a_i x_i$ with $bb(E) L^2 = 1$, symmetry gives $bb(E) L_(+)^2 =
    1 \/ 2$, while expansion gives
  $ bb(E) L^4 = 3 (sum_i a_i^2)^2 - 2 sum_i a_i^4 lt.eq 3 \, wide bb(E) L_(+)^4 lt.eq 3 \/ 2 . $
  Let $A = { f = - 1 }$, of measure $p$. Since $bb(E) L = 0$, $bb(E) f L = - 2 bb(E) \[ 1_A L \]$.
    The absolute value of the last integral is at most the larger of $bb(E) \[ 1_A L_(+) \]$ and
    $bb(E) \[ 1_A L_(-) \]$. Hölder’s inequality therefore gives
  $ \| bb(E) f L \| lt.eq 2 min {sqrt(p \/ 2) \, thick \( 3 \/ 2 \)^(1 \/ 4) p^(3 \/ 4)} . $
  Maximizing over $L$ and squaring proves Equation (4.7). Parseval and Booleanity give $sum_(k gt.eq 1)
    W_k \( f \) = 1 - m^2 = h^2$. Thus
  $ "Var" \( d \) = sum_(k gt.eq 1) r^k W_k \( f \) lt.eq r W_1 \( f \) + r^2 \( h^2 - W_1 \( f \) \) \, $
  which proves Equation (4.7). The odd part retains only odd degrees.
    Every retained degree above one is at least three, so
  $ bb(E) d_(upright(o))^2 lt.eq r W_1 \( f \) + r^3 \( h^2 - W_1 \( f \) \) \, $
  proving Equation (4.8). ◻
]

At a hypothetical crossing, the fixed mean lies either in the central band $0 lt.eq m lt.eq r^2 \/ 2$,
  in the intermediate band $r^2 \/ 2 lt.eq m lt.eq .74$, or in the large-bias band $.74 lt.eq m < 1$.
  The next sections exclude the crossing in the first two bands and prove the target directly in the third.

== 5 The central band <sec:central>

We retain the notation of Section 4. In the band containing the signed coordinates,
  we sharpen the basic energy comparison to preserve their exact edge cost.
  The resulting bound will force any function satisfying the crossing conditions to be a signed coordinate.

#thm([Proposition 5.1.])[
  #emph[Let $f$ be a nonconstant Boolean function, let $0 < rho < 1$, and suppose that $s gt.eq .84$ and $0 lt.eq
    m lt.eq r^2 \/ 2$. If
#[#set math.equation(numbering: n => "(5.1)")
 $ b = h - 1 + s \, wide cal(E) \( d \) lt.eq K = r / s \, $ <cen:crossing>]

 then $f$ is a signed coordinate.]
] <prop:central>

Throughout the proof all terminating decimals denote exact rational numbers. Under (5.1), set

#[#set math.equation(numbering: n => "(5.2)")
 $ y = sqrt(b) \, wide x_0 = sqrt(1 - b^2) \, wide alpha = frac(F \( x_0 \), x_0) \, wide M =
   F \( x_0 \)^2 . $ <cen:calibration>]

The symbol $alpha$ is local to this section. Write $R_0 = .2944$.
  Since $0 < r lt.eq R_0$ and $m lt.eq R_0^2 \/ 2$, the exact comparison $\( .999 \)^2 < 1 - R_0^4 \/ 4$ gives

#[#set math.equation(numbering: n => "(5.3)")
 $ h > .999 \, wide .839 < b lt.eq s < 1 \, wide y > .91595 > .915 \,\
0 lt.eq s - b = frac(m^2, 1 + h) < .001 \, wide M gt.eq x_0^2 gt.eq r > 0 . $ <cen:domain>]

Here $F \( x \) gt.eq x$ for $x gt.eq 0$, and $\( .91595 \)^2 < .839$.
  The symmetric pair of values $plus.minus x_0$ has $H \( x_0 \) = b$,
  so its $H$-average equals that of $d$ and its transformed squared amplitude is $M$.
  Its edge energy is $x_0^2 \/ b$. When $m = 0$, the crossing identity gives $b = s$ and $x_0 = rho$,
  recovering a noised coordinate.

=== 5.1 The calibrated edge cost <the-calibrated-edge-cost>

For $0 lt.eq v < F \( 1 \)^2$, define

#[#set math.equation(numbering: n => "(5.4)")
 $ Phi \( v \) = frac(x^2, H \( x \)) - v \, wide x = F^(- 1) \( sqrt(v) \) \, wide j \( v \) =
   cases(delim: "{", Phi \( v \) \/ v \, & v > 0 \,, 0 \, & v = 0 .) $ <cen:phi>]

The endpoint value $F \( 1 \)$ is finite, since the integrand defining $F$ has an integrable singularity of order
  $3 \/ 4$ at $1$.

#thm([Lemma 5.2.])[
  (Calibrated edge comparison).  #emph[For every coordinate edge,
#[#set math.equation(numbering: n => "(5.5)")
 $ D_i d thin D_i #h(-0.16667em) (frac(d, H \( d \))) gt.eq \( D_i g \)^2 +
   Phi #scale(x: 120%, y: 120%)[\(] \( D_i g \)^2 #scale(x: 120%, y: 120%)[\)] . $ <cen:edge-bound>]

 The functions $j$ and $Phi$ are nonnegative, increasing, and convex.
   Furthermore, $Phi' \( v \) \/ v$ is increasing for $v > 0$.]
] <cen:edge>

#proof[
  Put $G = F \( x \)$ and $ell \( G \) = log F' \( x \)$. Direct differentiation gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ ell' \( G \) = frac(3 x, 2 sqrt(H \( x \))) \, wide ell'' \( G \) = 3 / 4 (H \( x \) + frac(1, H \( x \))) \,
     wide ell''' \( G \) = frac(3 x^3, 4 H \( x \)^(3 \/ 2)) . $ <cen:ell>]
  Thus $ell$ is even and convex, and $ell''$ is increasing on the nonnegative half of its domain.
  Consider an edge with distinct $g$-values $G_(-) < G_(+)$, and let $I = \[ G_(-) \, G_(+) \]$.
    Changing variables from $x$ to $G$ in the two differences shows that the ratio of its energy to $\( D_i g \)^2$ is
  $ (frac(1, \| I \|) integral_I e^(ell \( G \)) thin d G)
    (frac(1, \| I \|) integral_I e^(- ell \( G \)) thin d G) =
    bb(E) cosh #scale(x: 120%, y: 120%)[\(] ell \( U \) - ell \( V \) #scale(x: 120%, y: 120%)[\)] \, $
  where $U \, V$ are independent uniform points of $I$. For a fixed separation $delta = \| U - V \|$,
    the midpoint is uniform on the interval of length $\| I \| - delta$ with the same center as $I$. The function
  $ A_delta \( c \) = ell \( c + delta \/ 2 \) - ell \( c - delta \/ 2 \) $
  is odd, and is increasing because $A'_delta \( c \) = ell' \( c + delta \/ 2 \) -
    ell' \( c - delta \/ 2 \) gt.eq 0$. Consequently $cosh A_delta \( c \)$ is even and increasing in $\| c \|$.
    The integral of any such function over an interval of fixed length is minimized by centering that interval at
    zero: for positive center $c$, the derivative of the integral is the value at the right endpoint minus the
    value at the left endpoint, which is nonnegative. The domain of $ell$ is the symmetric interval
    $\( - F \( 1 \) \, F \( 1 \) \)$. Moving the center of $I$ toward zero while keeping its length fixed keeps
    $I$, and hence every conditional midpoint interval, in this domain.
    Applying the preceding fixed-length integral comparison conditionally on $delta$ proves that the displayed
    product of averages is minimized when $I$ is centered at zero.
  If that centered interval has endpoints $plus.minus a$, its corresponding $d$-values are $plus.minus x$,
    where $F \( x \) = a$. Its energy is exactly $x^2 \/ H \( x \) = a^2 + Phi \( a^2 \)$.
    Since $a^2 = \( D_i g \)^2$, this proves (5.5). A zero difference gives the same statement directly.
  The symmetric-interval computation also gives, for $v > 0$,
  #[#set math.equation(numbering: n => "(5.7)")
   $ j \( v \) = 1 /
     4 integral_(- 1)^1 integral_(- 1)^1
     [cosh #scale(x: 120%, y: 120%)[\(] ell \( sqrt(v) thin a \) - ell \( sqrt(v) thin c \)
     #scale(x: 120%, y: 120%)[\)] - 1] thin d a thin d c . $ <cen:j-average>]
  To prove convexity of the integrand in $v$, use evenness of $ell$ and $cosh$ to replace $\( a \, c \)$ by
    numbers $A gt.eq C gt.eq 0$. For $B \( v \) = ell \( A sqrt(v) \) - ell \( C sqrt(v) \)$, differentiation gives
  $ B' \( v \) = frac(z_A ell' \( z_A \) - z_C ell' \( z_C \), 2 v) \, wide B'' \( v \) =
    frac(Q \( z_A \) - Q \( z_C \), 4 v^2) \, quad z_A = A sqrt(v) \, med z_C = C sqrt(v) \, $
  where $Q \( z \) = z \( z ell'' \( z \) - ell' \( z \) \)$.
    The function $z ell' \( z \)$ is increasing on $z gt.eq 0$, and
  $ Q' \( z \) = z ell'' \( z \) - ell' \( z \) + z^2 ell''' \( z \) gt.eq 0 . $
  Indeed, $ell' \( 0 \) = 0$ and increasing $ell''$ imply $ell' \( z \) lt.eq z ell'' \( z \)$,
    and (5.6) gives $ell''' \( z \) gt.eq 0$. Thus $B$ is nonnegative, increasing, and convex.
    Its composition with $cosh - 1$ has the same properties. Averaging proves these properties for $j$,
    including its continuous extension $j \( 0 \) = 0$. Now $Phi \( v \) = v j \( v \)$ gives $Phi' = j +
    v j' gt.eq 0$ and $Phi'' = 2 j' + v j'' gt.eq 0$. Finally, convexity and $j \( 0 \) =
    0$ imply that $j \( v \) \/ v$ is increasing, while $j'$ is increasing. Therefore
  $ frac(Phi' \( v \), v) = frac(j \( v \), v) + j' \( v \) $
  is increasing as claimed. ◻
]

Define the slope and energy excess at the calibration by

#[#set math.equation(numbering: n => "(5.8)")
 $ p_(*) := Phi' \( M \) = frac(1 + b^2, 2 alpha b^(3 \/ 2)) - 1 \, wide Delta := M + Phi \( M \) -
   K = \( s - b \) (1 + frac(1, b s)) . $ <cen:pdelta>]

The first identity follows by differentiating $x^2 \/ H \( x \)$ with respect to $F \( x \)^2$;
  the second uses $M + Phi \( M \) = \( 1 - b^2 \) \/ b$ and $K = \( 1 - s^2 \) \/ s$.
  In particular, $p_(*) \, Delta gt.eq 0$.

#thm([Lemma 5.3.])[
  (Calibration bounds).  #emph[At a crossing in the central band,
#[#set math.equation(numbering: n => "(5.9)")
 $ frac(Phi \( M \), M) < .0063 \, wide p_(*) < .019 \, wide p_(*) / M < .0532 \, wide Delta /
   M < .008 . $ <cen:four-constants>]

]
] <cen:constants>

#proof[
  As $b$ decreases, $M$ increases. Lemma 11 therefore reduces the first three upper bounds to $b_0 = .839$.
    Set $alpha_0 = F \( sqrt(1 - b_0^2) \) \/ sqrt(1 - b_0^2)$.
    At this endpoint the positive binomial series, integrated term by term, gives
  $ alpha_0 gt.eq sum_(j = 0)^5 frac(\( 3 \/ 4 \)_j \( 1 - b_0^2 \)^j, j ! \( 2 j + 1 \)) > a_0 := 1.08834 \, wide
    sqrt(b_0) > y_0 := .91595 \, $
  where $\( 3 \/ 4 \)_0 = 1$ and $\( 3 \/ 4 \)_j = \( 3 \/ 4 \) \( 7 \/ 4 \) dots.h.c \( 3 \/ 4 + j - 1 \)$.
    Using $Phi \( M \) \/ M = 1 \/ \( b alpha^2 \) - 1$ and (5.8), exact rational comparisons give
  $ frac(1, b_0 a_0^2) - 1 & < .006257 < .0063 \,\
P_0 := frac(1 + b_0^2, 2 a_0 b_0 y_0) - 1 & < .018641 < .019 \,\
frac(P_0, \( 1 - b_0^2 \) a_0^2) & < .053154 < .0532 . $
  For the last bound, (5.3) and $m^2 lt.eq r^4 \/ 4$ give
  $ Delta / M lt.eq frac(r^3, 4 \( 1 + h \)) (1 + frac(1, b s)) < frac(R_0^3, 4 \( 1.999 \))
    (1 + frac(1, \( .839 \) \( .84 \))) < .007720 < .008 . $
  The numerical comparisons above are exact rational inequalities.
    The four bounds in (5.9) are also verified by the central-band certificate described in Appendix 9. ◻
]

=== 5.2 Reduction to variance and first-level estimates <reduction-to-variance-and-first-level-estimates>

Let $a_i$ be the degree-one Fourier coefficients of $g$, and put

$ q = sum_i a_i^2 \, wide l = max_i a_i^2 \, wide H_0 = "Var" g - q . $

Thus $H_0$ is the Fourier weight above degree one. Counting degrees gives $sum_i bb(E) \( D_i g \)^2 gt.eq
  "Var" g + H_0$. All arguments of $Phi$ used below belong to its open domain:
  since the cube is finite, $G_max := max \| g \| < F \( 1 \)$;
  every half-difference $\| D_i g \|$ and coefficient $\| a_i \|$ is at most $G_max$, while $M =
  F \( x_0 \)^2 < F \( 1 \)^2$ because $b > 0$. In a coordinate attaining $l$,
  Jensen’s inequality and monotonicity of $Phi$ give $bb(E) Phi \( \( D_i g \)^2 \) gt.eq
  Phi \( bb(E) \( D_i g \)^2 \) gt.eq Phi \( l \)$. Lemma 11 and the tangent inequality for $Phi$ at $M$ yield

#[#set math.equation(numbering: n => "(5.10)")
 $ cal(E) \( d \) & gt.eq "Var" g + H_0 + Phi \( l \)\
 & gt.eq K + \( 1 + p_(*) \) \( "Var" g - M \) + \( 1 - p_(*) \) H_0 - p_(*) \( q - l \) +
   Delta . $ <cen:spectral-energy>]

Here $q - l$ is the degree-one weight outside a largest coordinate. Put

#[#set math.equation(numbering: n => "(5.11)")
 $ V_0 = bb(E) \( g^2 - M \)^2 \, wide C_0 = .034 . $ <cen:V0>]

We will prove

#[#set math.equation(numbering: n => "(5.12)")
 $ "Var" g - M gt.eq C_0 V_0 - frac(Delta, 1 + p_(*)) \, $ <cen:variance-gain>]

with strict inequality unless $m = 0$ and $g^2 = M$ everywhere.
  Substituting this estimate into (5.10) cancels $Delta$. We will then control the remaining negative term by proving

$ p_(*) \( q - l \) lt.eq \( 1 + p_(*) \) C_0 V_0 + \( 1 - p_(*) \) H_0 . $

These two bounds give $cal(E) \( d \) > K$ whenever the variance inequality is strict.
  We first prove that inequality, then establish the first-level comparison and treat the remaining equality case.

=== 5.3 A variance gain around the calibration <a-variance-gain-around-the-calibration>

Define, on $0 lt.eq t < 1$,

$ k \( t \) = frac(F \( sqrt(1 - t^4) \), sqrt(1 - t^4)) \, wide k \( 1 \) = 1 . $

Writing $u = sqrt(H \( d \))$, one has $g = k \( u \) d$, $k \( y \) = alpha$, and

#[#set math.equation(numbering: n => "(5.13)")
 $ k' \( t \) = - frac(2 \( 1 - t^3 k \( t \) \), 1 - t^4) \, wide g^2 - M = -
   4 integral_y^u k \( t \) thin d t . $ <cen:k-ode>]

Both identities follow by differentiation; the second also holds at $u = 1$ by continuity.

#thm([Lemma 5.4.])[
  (Bounds for the comparison function).  #emph[For $0 lt.eq t lt.eq 1$,
#[#set math.equation(numbering: n => "(5.14)")
 $ 2 - t + 1 / 2 \( 1 - t \)^2 lt.eq k \( t \) lt.eq 2 - t + 3 / 4 \( 1 - t \)^2 \, wide 1 lt.eq -
   k' \( t \) lt.eq min { 2 \, 1 + 3 / 2 \( 1 - t \) } . $ <cen:k-estimates>]

 At $t = 1$, the derivative is understood as its left limit.]
] <cen:k-bounds>

#proof[
  For $P_c \( t \) = 2 - t + c \( 1 - t \)^2$, define the differential residual
  $ E_c \( t \) = - \( 1 - t^4 \) P'_c \( t \) - 2 \( 1 - t^3 P_c \( t \) \) . $
  Expansion yields
  $ frac(E_(1 \/ 2) \( t \), \( 1 - t \)^2) & = t \( 2 t^2 - 2 t - 1 \) lt.eq 0 \,\
frac(E_(3 \/ 4) \( t \), \( 1 - t \)^2) & = 1 / 2 \( 2 t + 1 \) \( 3 t^2 - 3 t + 1 \) > 0 . $
  The first sign uses $2 t^2 - 2 t - 1 lt.eq - 1$; for the second, $3 t^2 - 3 t + 1 = 3 \( t - 1 \/ 2 \)^2 +
    1 \/ 4$. To justify backward comparison despite the singular endpoint, fix $t < v < 1$.
    The error $e = k - P_c$ satisfies $e' - 2 t^3 e \/ \( 1 - t^4 \) = E_c \/ \( 1 - t^4 \)$, whence
  $ e \( t \) = sqrt(frac(1 - v^4, 1 - t^4)) thin e \( v \) -
    integral_t^v sqrt(frac(1 - z^4, 1 - t^4)) frac(E_c \( z \), 1 - z^4) thin d z . $
  Both $k \( v \)$ and $P_c \( v \)$ tend to $1$. The first term therefore vanishes as $v arrow.t 1$,
    and the integral converges. Its sign proves the two polynomial comparisons in (5.14).
  Substitute these comparisons into (5.13). The sufficient numerators for the three derivative inequalities are,
    respectively,
  $ 2 \( 1 - t^3 P_(3 \/ 4) \) - \( 1 - t^4 \) & = 1 / 2 \( 1 - t \)^2 \( - 3 t^3 + 6 t^2 + 4 t + 2 \) \,\
2 \( 1 - t^4 \) - 2 \( 1 - t^3 P_(1 \/ 2) \) & = t^3 \( t - 5 \) \( t - 1 \) \,\
frac(5 - 3 t, 2) \( 1 - t^4 \) - 2 \( 1 - t^3 P_(1 \/ 2) \) & = 1 / 2 \( 1 - t \)^2 \( 5 t^3 - 3 t^2 - t + 1 \) . $
  The first two are nonnegative on $\[ 0 \, 1 \]$. For the last cubic, on $\[ 0 \, .6 \]$ use $5 t^3 -
    3 t^2 + .16 = \( 5 t + 1 \) \( 5 t - 2 \)^2 \/ 25 gt.eq 0$, leaving at least $.24$.
    On $\[ .6 \, 1 \]$ write the cubic as $t^2 \( 5 t - 3 \) + \( 1 - t \) gt.eq 0$.
    This proves the derivative bounds for $t < 1$. The Taylor expansion $F \( x \) \/ x = 1 + x^2 \/ 4 +
    O \( x^4 \)$ at $x = 0$ shows that $k' \( 1 \) = - 1$. ◻
]

To estimate the variance of $g$, separate its mean from the known mean $bb(E) d = m$ by subtracting $alpha d$. Define

#[#set math.equation(numbering: n => "(5.15)")
 $ R = g - alpha d \, wide D \( u \) = g^2 - M - R^2 + frac(2 alpha, y) \( u^2 - y^2 \) . $ <cen:RD>]

The right side defining $D$ depends only on $u$, because $R^2 = \( 1 - u^4 \) \( k \( u \) - alpha \)^2$.
  The added multiple of $u^2 - y^2$ has zero expectation. Since $bb(E) u^2 = b = y^2$, $bb(E) g = bb(E) R +
  alpha m$, and $\( bb(E) R \)^2 lt.eq bb(E) R^2$, one obtains

#[#set math.equation(numbering: n => "(5.16)")
 $ "Var" g - M gt.eq bb(E) #scale(x: 120%, y: 120%)[\[] D - 2 alpha m \| R \| #scale(x: 120%, y: 120%)[\]] -
   alpha^2 m^2 . $ <cen:variance-rearrange>]

#thm([Lemma 5.5.])[
  (Pointwise remainder bound).  #emph[Under the central-band crossing hypotheses of Proposition 10,
    for every $0 lt.eq u lt.eq 1$,
#[#set math.equation(numbering: n => "(5.17)")
 $ D \( u \) - 2 alpha m \| R \| + .88 m^2 gt.eq C_0 \( g^2 - M \)^2 + .20 \( u^2 - y^2 \)^2 . $ <cen:pointwise-bound>]

 The inequality is strict whenever $u eq.not y$.]
] <cen:pointwise>

#proof[
  The integral identity in (5.13) gives exactly
  #[#set math.equation(numbering: n => "(5.18)")
   $ D \( u \) = frac(2 alpha, y) \( u - y \)^2 + 4 integral_u^y \( k \( t \) - alpha \) thin d
     t - \( 1 - u^4 \) \( k \( u \) - alpha \)^2 . $ <cen:D-integral>]
  Let $L = \| u - y \|$ and $lambda = \| k \( u \) - k \( y \) \|$.
    Monotonicity of $k$ makes the integral nonnegative. A function with slope of magnitude at most $2$ needs
    length at least $lambda \/ 2$ to rise from $0$ to $lambda$;
    the triangle of that base and height is a lower bound for its integral. Thus
  $ 4 integral_u^y \( k \( t \) - alpha \) thin d t gt.eq lambda^2 . $
  The lower derivative bound in Lemma 13 gives $lambda gt.eq L$, so (5.18) implies
  #[#set math.equation(numbering: n => "(5.19)")
   $ D \( u \) gt.eq (frac(2 alpha, y) + u^4) L^2 . $ <cen:D-lower>]
  For explicit estimates, put $a = 1 - u$, $c = 1 - y$, and
  $ A_(-) & = 1 + c + 1 / 2 c^2 \, & A_(+) & = 1 + c + 3 / 4 c^2 \,\
B & = 1 + 1 / 2 \( a + c \) + 1 / 4 \( a^2 + a c + c^2 \) \, & J & = 1 + 3 / 4 \( a + c \) . $
  Lemma 13, and its averages over the interval joining $u$ and $y$, give
  #[#set math.equation(numbering: n => "(5.20)")
   $ A_(-) lt.eq alpha lt.eq A_(+) \, wide \| g^2 - M \| lt.eq 4 B L \, wide \| R \| lt.eq
     J L sqrt(1 - u^4) . $ <cen:BJ>]
  In fact $B$ is the average of the upper quadratic bound for $k$,
    and $J$ is the average of the upper linear bound for $- k'$. Define
  #[#set math.equation(numbering: n => "(5.21)")
   $ S \( u \, y \) = 2 A_(-) + y #scale(x: 120%, y: 120%)[\(] u^4 -
     16 C_0 B^2 - .20 \( u + y \)^2 #scale(x: 120%, y: 120%)[\)] . $ <cen:S>]
  By (5.19)–(5.20), the left side minus the right side of (5.17) is at least
  #[#set math.equation(numbering: n => "(5.22)")
   $ L^2 / y S - 2 A_(+) J m L sqrt(1 - u^4) + .88 m^2 . $ <cen:pointwise-reduction>]
  If $u lt.eq .8$, then $L = y - u > 0$. Since $b lt.eq s$ and $2 m lt.eq r^2$,
  $ 2 m lt.eq r^2 lt.eq \( 1 - b^2 \)^2 = \( 1 - y^4 \)^2 . $
  Dropping $.88 m^2$ and bounding $sqrt(1 - u^4) lt.eq 1$ makes (5.22) at least $L P_1 \/ y$, where
  #[#set math.equation(numbering: n => "(5.23)")
   $ P_1 \( u \, y \) = \( y - u \) S - A_(+) J \( 1 - y^4 \)^2 y . $ <cen:P1>]
  If $u gt.eq .8$ and $L > 0$, the elementary inequality
  $ 2 A_(+) J m L sqrt(1 - u^4) lt.eq .88 m^2 + frac(\( A_(+) J \)^2 L^2 \( 1 - u^4 \), .88) $
  makes the same expression at least $L^2 P_2 \/ \( .88 y \)$, where
  #[#set math.equation(numbering: n => "(5.24)")
   $ P_2 \( u \, y \) = .88 S - \( A_(+) J \)^2 \( 1 - u^4 \) y . $ <cen:P2>]
  It therefore suffices, when $L > 0$, to prove the polynomial signs
  #[#set math.equation(numbering: n => "(5.25)")
   $ P_1 \( u \, y \) & > 0 &  & \( 0 lt.eq u lt.eq .8 \, med .915 lt.eq y lt.eq 1 \) \,\
P_2 \( u \, y \) & > 0 &  & \( .8 lt.eq u lt.eq 1 \, med .915 lt.eq y lt.eq 1 \) . $ <cen:polynomial-signs>]
  Here is a finite rational certificate for these signs, using the Bernstein coefficient formula of Appendix 9.
    Map each stated rectangle affinely to $\[ 0 \, 1 \]^2$, with the $u$ coordinate first.
    If the resulting power coefficients are $c_(a b)$, its Bernstein coefficient of index $\( i \, j \)$ and order
    $\( N_1 \, N_2 \)$ is
  #[#set math.equation(numbering: n => "(5.26)")
   $ beta_(i j) = sum_(a lt.eq i \, thin b lt.eq j) c_(a b) binom(i, a) / binom(N_1, a) binom(j, b) /
     binom(N_2, b) . $ <cen:bernstein-formula>]
  The orders and row minima are as follows; the final column records $floor.l 1000 min_j beta_(i j)
    floor.r$ for successive $i$.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Polynomial
], table.cell(rowspan: 1, colspan: 1)[Order $\( N_1 \, N_2 \)$
], table.cell(rowspan: 1, colspan: 1)[Scaled row minima
]),
  table.cell(rowspan: 1, colspan: 1)[$P_1$
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, 12 \)$
], table.cell(rowspan: 1, colspan: 1)[$134 \, 353 \, 365 \, 278 \, 214 \, 46$
],
  table.cell(rowspan: 1, colspan: 1)[$P_2$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$179 \, 364 \, 559 \, 765 \, 983 \, 1214 \, 1457$
],
)
]
  Thus every coefficient is strictly positive. Bernstein basis functions are nonnegative and sum to one on the
    unit square, proving (5.25) on the closed rectangles. The formula and the explicit polynomials specify all
    arithmetic in the table; the executable certificate is #raw("verification/central_band.py").
    Appendix 9 gives the general certificate convention.
  The two lower bounds above are therefore strictly positive whenever $L > 0$.
    Finally, when $u = y$, all terms in (5.17) vanish except $.88 m^2$, which is nonnegative.
    This also proves the asserted strictness. ◻
]

#thm([Lemma 5.6.])[
  (Strict variance gain).  #emph[Inequality (5.12) holds. If $m > 0$, the stronger bound
#[#set math.equation(numbering: n => "(5.27)")
 $ "Var" g - M > C_0 V_0 - frac(Delta, 1 + p_(*)) + .016 m^2 $ <cen:positive-margin>]

 holds. If $m = 0$, (5.12) is strict unless $g^2 = M$ at every point of the cube.]
] <cen:strict-variance>

#proof[
  Write $T = bb(E) \( u^2 - y^2 \)^2 = bb(E) \( H \( d \) - b \)^2$.
    Since $bb(E) d = m$ and $H \( d \)^2 = 1 - d^2$, $T = h^2 - b^2 - "Var" d$.
    Lemma 9, using $w lt.eq 1 - m$, therefore gives
  $ T gt.eq \( 1 - r^2 \) h^2 - b^2 - r s^2 \( 1 - m \) . $
  The crossing identity implies $s h - b = \( 1 - s \) \( 1 - h \) gt.eq 0$. Substituting $b^2 lt.eq s^2 h^2$ proves
  #[#set math.equation(numbering: n => "(5.28)")
   $ T gt.eq r s^2 \( m - m^2 \) . $ <cen:T-lower>]
  For $m > 0$ this yields
  #[#set math.equation(numbering: n => "(5.29)")
   $ T / m^2 gt.eq s^2 (2 / r - r) gt.eq \( 1 - R_0 \) (2 / R_0 - R_0) > 4.5 . $ <cen:T-ratio>]
  Both positive factors in the middle expression decrease with $r$ on $0 < r lt.eq R_0$,
    and the final inequality is rational.
  We also need to compare the calibration loss with $alpha^2 m^2$.
    The upper bound for $k \( y \)$ gives $alpha < 1.1$ and
  $ alpha y lt.eq \( 1 - c \) \( 1 + c + 3 / 4 c^2 \) = 1 - 1 / 4 c^2 - 3 / 4 c^3 lt.eq 1 \, wide c = 1 -
    y in \[ 0 \, .085 \] . $
  Using (5.8) and $s - b = m^2 \/ \( 1 + h \)$, for $m > 0$ we obtain
  #[#set math.equation(numbering: n => "(5.30)")
   $ frac(Delta, \( 1 + p_(*) \) m^2) & = alpha / y thin frac(2, 1 + h) (1 - frac(s - b, s \( 1 + b^2 \)))\
 & > alpha^2 - frac(\( 1.1 \)^2 \( .001 \), .84) > alpha^2 - .004 . $ <cen:delta-cancel>]
  In the first factor of (5.30), $alpha \/ y gt.eq alpha^2$; also $2 \/ \( 1 + h \) gt.eq 1$.
    The subtracted relative loss is less than $.001 \/ .84$, by (5.3), which proves the next line.
  Averaging (5.17) and applying (5.16) now gives
  $ "Var" g - M gt.eq C_0 V_0 + .20 T - \( alpha^2 + .88 \) m^2 . $
  For $m > 0$, insert (5.29) and (5.30). The remaining strict margin is $.20 \( 4.5 \) - .88 - .004 = .016$,
    proving (5.27). For $m = 0$ one has $b = s$ and $Delta = 0$; the same averaged inequality proves (5.12).
    If any cube point has $u eq.not y$, Lemma 14 makes the averaged inequality strict.
    Since $k > 0$ in (5.13), the condition $u = y$ is equivalent to $g^2 = M$, completing the strictness statement. ◻
]

=== 5.4 Concentration of the first Fourier level <concentration-of-the-first-fourier-level>

#proof[
  Recall that $q$ is the total degree-one Fourier weight of $g$, $l$ is its largest coordinate weight, and $H_0 =
    "Var" g - q$ is its weight above degree one.
  The resources available to control $q - l$ follow without losing the $Delta$ term.
    Namely, (5.1), (5.10), and (5.12) imply
  #[#set math.equation(numbering: n => "(5.31)")
   $ H_0 + C_0 V_0 lt.eq Phi \( M \) - frac(p_(*) Delta, 1 + p_(*)) lt.eq Phi \( M \) \, wide q gt.eq M -
     Phi \( M \) - Delta > .985 M > 0 . $ <cen:resources>]
  Indeed, substituting the variance gain into the first energy bound gives
  $ H_0 + C_0 V_0 lt.eq K - M + frac(Delta, 1 + p_(*)) - Phi \( l \) = Phi \( M \) -
    frac(p_(*) Delta, 1 + p_(*)) - Phi \( l \) . $
  Since $Phi \( l \) gt.eq 0$, this proves the first resource bound.
    Combining it with the variance gain once more yields
  $ q gt.eq M - Phi \( M \) + 2 C_0 V_0 + frac(p_(*) - 1, 1 + p_(*)) Delta gt.eq M - Phi \( M \) - Delta . $
  Thus the second inequality retains the full calibration loss; Lemma 12 gives $1 - .0063 - .008 = .9857 > .985$.
  Let
  $ L_1 \( x \) = sum_i a_i x_i \, wide P = L_1^2 - q \, wide W = bb(E) P^2 = 2 (q^2 - sum_i a_i^4) . $
  Since $sum_i a_i^4 lt.eq l q$,
  #[#set math.equation(numbering: n => "(5.32)")
   $ q - l lt.eq frac(W, 2 q) . $ <cen:spread>]
  Write $g = mu + L_1 + Z$, with $mu = bb(E) g$ and $Z$ containing only Fourier degrees at least two;
    thus $bb(E) Z^2 = H_0$. The degree-three part of $L_1 P$ has coefficient $6 a_i a_j a_k$ on $x_i x_j x_k$,
    so its squared norm is
  $ 36 sum_(i < j < k) a_i^2 a_j^2 a_k^2 lt.eq 3 q W . $
  To see the last inequality, write $W = 4 sum_(i < j) a_i^2 a_j^2$:
    in $q W$ each distinct triple occurs three times, with total coefficient $12$,
    and all remaining terms are nonnegative. Only that degree-three part of $L_1 P$ pairs with $Z$.
    Also $P gt.eq - q$, $bb(E) P = bb(E) L_1 P = 0$, and $bb(E) L_1^2 P = W$.
    Expanding $g^2 P$ and applying Cauchy–Schwarz therefore gives
  #[#set math.equation(numbering: n => "(5.33)")
   $ sqrt(V_0 W) gt.eq bb(E) \[ g^2 P \] gt.eq W - \( 2 sqrt(3 q) + 2 \| mu \| \) sqrt(W H_0) -
     q H_0 . $ <cen:quadratic>]
  The first inequality uses $bb(E) \[ g^2 P \] = bb(E) \[ \( g^2 - M \) P \]$.
    For the last inequality the three error terms are $2 bb(E) \( L_1 P Z \)$, $2 mu bb(E) \( P Z \)$,
    and $bb(E) \( Z^2 P \)$, bounded below by $- 2 sqrt(3 q W H_0)$, $- 2 \| mu \| sqrt(W H_0)$, and $-
    q H_0$ respectively.
  The mean term is small. Lemma 13 and (5.13) give
  $ \| g - alpha d \| lt.eq 2 \| u - y \| lt.eq 1 / 2 \| g^2 - M \| . $
  Together with (5.31) this proves
  #[#set math.equation(numbering: n => "(5.34)")
   $ frac(\| mu \|, sqrt(q)) lt.eq frac(m \/ x_0 + 1 / 2 sqrt(.0063 \/ C_0), sqrt(.985)) lt.eq
     frac(R_0 \( .543 \) \/ 2 + .431 \/ 2, .9924) < .298 < .31 . $ <cen:mean-bound>]
  Here $m \/ x_0 lt.eq r^(3 \/ 2) \/ 2$, and the rational comparisons $\( .543 \)^2 > R_0$,
    $\( .431 \)^2 > .0063 \/ .034$, and $\( .9924 \)^2 < .985$ justify all square-root bounds.
  Set $A = sqrt(V_0)$, $B_0 = sqrt(q H_0)$, and $z = sqrt(W)$. Equations (5.33) and (5.34) imply
  $ z^2 lt.eq A z + \( 2 sqrt(3) + .62 \) B_0 z + B_0^2 . $
  Writing $c_0 = 2 sqrt(3) + .62$, the positive root of this quadratic is at most $A + 4.32 B_0$.
    Indeed, substituting that value in the polynomial $z^2 - \( A + c_0 B_0 \) z - B_0^2$ gives
  $ \( 4.32 - c_0 \) A B_0 + \( 4.32^2 - 4.32 c_0 - 1 \) B_0^2 gt.eq 0 \, $
  and the substituted value is beyond its vertex. Both coefficients are positive:
    $sqrt(3) < 1.73206$ gives $4.32 > c_0$ and $4.32^2 > 1 + 4.32 c_0$ by rational comparison.
    The degenerate cases $B_0 = 0$ or $W = 0$ obey the same bound. Thus
  #[#set math.equation(numbering: n => "(5.35)")
   $ sqrt(W) lt.eq sqrt(V_0) + 4.32 sqrt(q H_0) . $ <cen:W-bound>]
  The constants leave a strict margin for absorbing this spread:
  #[#set math.equation(numbering: n => "(5.36)")
   $ frac(p_(*), \( 1 + p_(*) \) q C_0) + frac(p_(*) \( 4.32 \)^2, 1 - p_(*)) & <
     frac(.0532, \( .985 \) \( .034 \)) + frac(.019 \( 4.32 \)^2, .981)\
 & < 1.95 < 2 . $ <cen:absorption-constant>]
  For clarity, the middle rational number is $444890776 \/ 228150625$, which is strictly less than $39 \/ 20$.
    Weighted Cauchy–Schwarz, applied to (5.35), now gives
  #[#set math.equation(numbering: n => "(5.37)")
   $ frac(p_(*) W, 2 q) & lt.eq 1 / 2 (frac(p_(*), \( 1 + p_(*) \) q C_0) + frac(p_(*) \( 4.32 \)^2, 1 - p_(*)))
     #scale(x: 120%, y: 120%)[\(] \( 1 + p_(*) \) C_0 V_0 + \( 1 - p_(*) \) H_0 #scale(x: 120%, y: 120%)[\)]\
 & lt.eq \( 1 + p_(*) \) C_0 V_0 + \( 1 - p_(*) \) H_0 . $ <cen:absorption>]
  All denominators are positive by (5.31) and $0 lt.eq p_(*) < .019$.
  If (5.12) is strict, substitute it into (5.10), then use (5.32) and (5.37). The result is
  $ cal(E) \( d \) > K + \( 1 + p_(*) \) C_0 V_0 + \( 1 - p_(*) \) H_0 - p_(*) \( q - l \) gt.eq K \, $
  contradicting (5.1). Lemma 15 therefore leaves only $m = 0$ and $g^2 = M$ everywhere.
  In this exceptional case $b = s$, so $x_0 = sqrt(1 - s^2) = rho$.
    Because $F$ is odd and strictly increasing, $g^2 = M$ implies $\| d \| = rho$ everywhere.
    If $W_k \( f \)$ denotes the Fourier weight of $f$ at degree $k$, Parseval and $m = 0$ give
  $ sum_(k gt.eq 1) W_k \( f \) = 1 \, wide sum_(k gt.eq 1) r^k W_k \( f \) = bb(E) d^2 = r . $
  Subtracting the second identity from $r$ times the first gives $sum_(k gt.eq 2) \( r - r^k \) W_k \( f \) = 0$.
    Every coefficient $r - r^k$ is positive for $0 < r < 1$, so all weights above degree one vanish.
    Hence $f = sum_i c_i x_i$, with $sum_i c_i^2 = 1$. The identity $f^2 =
    1$ has degree-two coefficients $2 c_i c_j = 0$ for every $i eq.not j$.
    At most one $c_i$ is nonzero, and its square is $1$. Thus $f$ is a signed coordinate, proving Proposition 10. ◻
]

== 6 Intermediate biases <sec:intermediate>

We retain the notation of Section 4. In particular, $21 \/ 25 lt.eq s < 1$, $r = 1 - s^2$, $d = T_rho f$, $m =
  bb(E) f gt.eq 0$, $h = H \( m \)$, $b = bb(E) H \( d \)$, and $g = F \( d \)$, where $F \( 0 \) = 0$ and $F' =
  H^(- 3 \/ 2)$. The first-level bound of Lemma 9 is denoted by

$ w = min { 2 p \, 4 sqrt(3 \/ 2) thin p^(3 \/ 2) } \, wide p = \( 1 - m \) \/ 2 . $

All terminating decimals in this section denote exact rational numbers.

#thm([Proposition 6.1.])[
  (Exclusion of an intermediate-bias crossing).  #emph[Let $f$ be a nonconstant Boolean function and suppose
$ r^2 / 2 lt.eq m lt.eq 37 / 50 \, wide 21 / 25 lt.eq s < 1 . $

 If $b = h - 1 + s$, then $cal(E) \( d \) > r \/ s$. Consequently a crossing as in Lemma 7 cannot occur in this range.]
] <prop:intermediate>

=== 6.1 Parity and an energy reduction <parity-and-an-energy-reduction>

For a function $u$ on the cube, write

$ u_e \( x \) = frac(u \( x \) + u \( - x \), 2) \, wide u_o \( x \) = frac(u \( x \) - u \( - x \), 2) . $

These are the projections onto the even and odd Fourier degrees.
  Every nonconstant even degree is at least two, whereas an odd degree other than one is at least three.
  As in Lemma 9, Parseval and $W_1 \( f \) lt.eq w$ give

#[#set math.equation(numbering: n => "(6.1)")
 $ "Var" \( d_o \) lt.eq r W_1 \( f \) + r^3 #scale(x: 120%, y: 120%)[\(] h^2 -
   W_1 \( f \) #scale(x: 120%, y: 120%)[\)] lt.eq r #scale(x: 120%, y: 120%)[\[] \( 1 - r^2 \) w +
   r^2 h^2 #scale(x: 120%, y: 120%)[\]] . $ <mid:odd-cap>]

The edge comparison of Lemma 8, followed by the same degree count for $g$, gives

#[#set math.equation(numbering: n => "(6.2)")
 $ cal(E) \( d \) gt.eq sum_i bb(E) \( D_i g \)^2 gt.eq "Var" \( g \) + "Var" \( g_e \) . $ <mid:parity-energy>]

To use the extra even-degree contribution, we compare $g = F \( d \)$ with its affine approximation at $m$.
  Set $v = 1 - s$ and $a = F' \( m \) = h^(- 3 \/ 2)$. The tangent deficit of $H$ at $m$ is

#[#set math.equation(numbering: n => "(6.3)")
 $ V = h - H \( d \) - frac(m \( d - m \), h) . $ <mid:V>]

Concavity gives $V gt.eq 0$, and at a putative crossing,

#[#set math.equation(numbering: n => "(6.4)")
 $ bb(E) V = h - b = v . $ <mid:EV>]

The variance expansion

$ "Var" \( g \) = "Var" \( g - a d \) + 2 a bb(E) #scale(x: 120%, y: 120%)[\[] \( d - m \) \( g - F \( m \) \)
  #scale(x: 120%, y: 120%)[\]] - a^2 "Var" \( d \) $

is valid without any assumption on $bb(E) g$. On the nonconstant even subspace, apply the identity

$ parallel u - v_0 parallel_2^2 + parallel u parallel_2^2 = 2 parallel u - v_0 \/ 2 parallel_2^2 +
  parallel v_0 parallel_2^2 \/ 2 $

with $u = g_e - bb(E) g$ and $v_0 = a \( d_e - m \)$. Dropping the odd part of $"Var" \( g - a d \)$ then gives

$ "Var" \( g - a d \) + "Var" \( g_e \) gt.eq a^2 / 2 "Var" \( d_e \) . $

This compensates for half the even part of the variance penalty. Define the remaining pointwise expression by

#[#set math.equation(numbering: n => "(6.5)")
 $ Psi = 2 a \( d - m \) #scale(x: 120%, y: 120%)[\(] g - F \( m \) #scale(x: 120%, y: 120%)[\)] - a^2 /
   2 \( d - m \)^2 - 3 V . $ <mid:Psi>]

Inserting the variance expansion into (6.2) and using (6.1) now gives

#[#set math.equation(numbering: n => "(6.6)")
 $ cal(E) \( d \) gt.eq 3 v + bb(E) Psi - a^2 / 2 "Var" \( d_o \) gt.eq 3 v + bb(E) Psi - r / 2 Q \, wide Q =
   frac(\( 1 - r^2 \) w, h^3) + r^2 / h . $ <mid:energy-reduction>]

Define

#[#set math.equation(numbering: n => "(6.7)")
 $ Q_(*) = frac(2 \( 2 s - 1 \), s \( 1 + s \)) = frac(6, 1 + s) - 2 / s . $ <mid:Qstar>]

Since $r = v \( 1 + s \)$, the identity $3 v - r Q_(*) \/ 2 =
  r \/ s$ shows that the following strict inequality suffices:

#[#set math.equation(numbering: n => "(6.8)")
 $ bb(E) Psi > r / 2 \( Q - Q_(*) \) . $ <mid:target>]

=== 6.2 Pointwise bounds and the bias margins <pointwise-bounds-and-the-bias-margins>

Near $m = r^2 \/ 2$, a positive multiple of $V^2$ supplies the needed gain because $bb(E) V = v$.
  For $m gt.eq 1 \/ 5$, the gap $Q_(*) - Q$ will instead allow a small negative multiple of $V$.
  We first use these estimates to prove Proposition 16, then prove the estimates in angular coordinates.

#thm([Lemma 6.2.])[
  #emph[For every $- 1 < d < 1$, with $V \, Psi$ defined by (6.3) and (6.5), one has
#[#set math.equation(numbering: n => "(6.9)")
 $ Psi gt.eq \( 1 / 2 - 2 m^2 \) V^2 \, & 0 lt.eq m lt.eq 1 / 5 \,\
Psi gt.eq - 1 / 100 V \, & 1 / 5 lt.eq m lt.eq 2 / 3 \,\
Psi gt.eq - 1 / 50 V \, & 2 / 3 lt.eq m lt.eq 37 / 50 . $ <mid:pointwise-bounds>]

]
] <mid:pointwise>

#proof[
  Assume $b = h - 1 + s$. Since $s gt.eq 21 \/ 25$,
  #[#set math.equation(numbering: n => "(6.10)")
   $ r^2 lt.eq \( 184 \/ 625 \)^2 < 87 \/ 1000 . $ <mid:r-bound>]
  The first term of the bound on $w$, namely $w lt.eq 1 - m$, gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ Q lt.eq Q_0 := frac(1 + r^2 m, h \( 1 + m \)) . $ <mid:Qzero>]
  First suppose $r^2 \/ 2 lt.eq m lt.eq 1 \/ 5$. In particular $m > 0$. On this interval,
  $ h gt.eq 1 - 51 / 100 m^2 \, $
  as follows by squaring: the difference of the squares is $m^2 \( 1 \/ 50 - 2601 m^2 \/ 10000 \) gt.eq 0$. Consequently
  #[#set math.equation(numbering: n => "(6.12)")
   $ frac(1 - Q_0, m) & = 1 / h [frac(1 - r^2, 1 + m) - frac(1 - h, m)] gt.eq L \( m \) :=
     frac(913, 1000 \( 1 + m \)) - frac(51 m, 100) . $ <mid:small-margin-left>]
  Here the bracket is positive, since it is at least $L \( m \) gt.eq L \( 1 \/ 5 \) = 3953 \/ 6000 > 0$;
    thus the factor $1 \/ h gt.eq 1$ has been removed in the correct direction.
  We compare $L \( m \)$ with
  #[#set math.equation(numbering: n => "(6.13)")
   $ R \( m \, s \) := frac(2 v, 1 + s) (frac(v, s m) + 2 m) . $ <mid:small-margin-right>]
  For $m lt.eq 3 \/ 50$, the hypothesis $m gt.eq r^2 \/ 2$ gives
  $ R \( m \, s \) lt.eq frac(4, s \( 1 + s \)^3) + frac(4 v m, 1 + s) lt.eq
    frac(4, \( 21 \/ 25 \) \( 46 \/ 25 \)^3) + frac(4 \( 4 \/ 25 \) \( 3 \/ 50 \), 46 \/ 25) . $
  For $3 \/ 50 lt.eq m lt.eq 1 \/ 5$, use instead
  $ R \( m \, s \) lt.eq frac(2 \( 4 \/ 25 \)^2, \( 21 \/ 25 \) \( 46 \/ 25 \) \( 3 \/ 50 \)) +
    frac(4 \( 4 \/ 25 \) \( 1 \/ 5 \), 46 \/ 25) . $
  Since $L$ decreases, the exact comparisons are
  $ upright("range of ") m & upright("lower bound for ") L \( m \) & upright("upper bound for ") R \( m \, s \)\
\( 0 \, 3 \/ 50 \] & 220141 / 265000 > 4 / 5 & 10032241 / 12775350 < 4 / 5\
 & 3953 / 6000 > 16 / 25 & 4504 / 7245 < 16 / 25 . $
  Equations (6.12)–(6.13) therefore give $\( 1 - Q \) \/ m > R \( m \, s \)$. Since
  $ 1 - Q_(*) = frac(v \( 2 - s \), s \( 1 + s \)) \, $
  rearranging this strict inequality yields
  #[#set math.equation(numbering: n => "(6.14)")
   $ frac(1 + s, 2 v) \( Q - Q_(*) \) < 1 / 2 - 2 m^2 . $ <mid:small-final-margin>]
  The first line of Lemma 17, Jensen’s inequality, and (6.4) give
  $ bb(E) Psi gt.eq \( 1 / 2 - 2 m^2 \) bb(E) V^2 gt.eq \( 1 / 2 - 2 m^2 \) v^2 > r / 2 \( Q - Q_(*) \) \, $
  where the last step uses $r = v \( 1 + s \)$ and (6.14).
  Next suppose $1 \/ 5 lt.eq m lt.eq 2 \/ 3$. For fixed $a_0 = r^2 lt.eq 87 \/ 1000$,
  $ \( log Q_0 \)' = frac(a_0, 1 + a_0 m) + frac(2 m - 1, 1 - m^2) \, wide \( log Q_0 \)'' = -
    frac(a_0^2, \( 1 + a_0 m \)^2) + frac(2 \( m^2 - m + 1 \), \( 1 - m^2 \)^2) > 0 . $
  For the last sign, the positive term is at least $3 \/ 2$, and $a_0^2 < 1$.
    Convexity bounds $Q_0$ by its endpoint maximum; it also increases with $a_0$.
    At $a_0 = 87 \/ 1000$, the two endpoint values are
  $ Q_0 \( 1 \/ 5 \) = frac(5087, 2400 sqrt(6)) < 433 / 500 = .866 \, wide Q_0 \( 2 \/ 3 \) =
    frac(4761, 2500 sqrt(5)) < 213 / 250 = .852 . $
  The strict comparisons follow respectively from
  $ 25435^2 < 6 dot.op 10392^2 \, wide 4761^2 < 5 dot.op 2130^2 . $
  Thus $Q < .866$ throughout this range.
  Finally suppose $2 \/ 3 lt.eq m lt.eq 37 \/ 50$. The second term of the bound on $w$ gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ Q lt.eq R_0 \( m \, a_0 \) := \( 1 - a_0 \) frac(sqrt(3), \( 1 + m \)^(3 \/ 2)) + a_0 / sqrt(1 - m^2) \, wide
     a_0 = r^2 lt.eq 87 \/ 1000 . $ <mid:Qhigh>]
  The coefficient of $a_0$ is positive, because $\( 1 + m \)^2 > 3 \( 1 - m \)$ on this interval.
    Hence it suffices to take $a_0 = 87 \/ 1000$. Moreover,
  $ frac(partial R_0, partial m) = - frac(3 \( 1 - a_0 \) sqrt(3), 2 \( 1 + m \)^(5 \/ 2)) +
    frac(a_0 m, \( 1 - m^2 \)^(3 \/ 2)) < 0 . $
  Here is a rational comparison proving the last sign on the entire interval.
    Since $h > 2 \/ 3$, the positive term is less than $\( 87 \/ 1000 \) \( 37 \/ 50 \) \( 27 \/ 8 \) < 1 \/ 4$.
    Since $sqrt(3) > 5 \/ 3$, $\( 1 + m \)^(5 \/ 2) < 6$, and $1 - a_0 gt.eq 913 \/ 1000$,
    the magnitude of the negative term is greater than $4565 \/ 12000 > 1 \/ 3$. At the left endpoint,
  $ R_0 \( 2 \/ 3 \, 87 \/ 1000 \) = frac(4761, 2500 sqrt(5)) < .852 \, $
  so $Q < .852$ in the final range.
  To finish both remaining ranges, observe that
  $ Q'_(*) \( s \) = frac(2 + 4 s \( 1 - s \), s^2 \( 1 + s \)^2) > 0 \, wide Q_(*) \( 21 \/ 25 \) = 425 /
    483 > .879 \, wide frac(1 + s, 2) gt.eq 23 / 25 = .92 . $
  The exact positive margins after the respective pointwise losses are
  $ frac(1 + s, 2) \( Q_(*) - Q \) - 1 / 100 & > .92 \( .879 - .866 \) - .01 = 49 / 25000 > 0 \, &  & 1 \/ 5 lt.eq
    m lt.eq 2 \/ 3 \,\
frac(1 + s, 2) \( Q_(*) - Q \) - 1 / 50 & > .92 \( .879 - .852 \) - .02 = 121 / 25000 > 0 \, &  & 2 \/ 3 lt.eq
  m lt.eq 37 \/ 50 . $
  By the appropriate line of Lemma 17, $bb(E) Psi gt.eq - epsilon bb(E) V = - epsilon v$;
    the last inequalities and $r = v \( 1 + s \)$ therefore imply (6.8).
    All three ranges give $cal(E) \( d \) > r \/ s$ by (6.6), completing the proof. ◻
]

=== 6.3 Proof of the pointwise comparison <proof-of-the-pointwise-comparison>

#proof[
  Introduce the midpoint and signed half-difference of the two angles:
  $ beta = arcsin m \, wide t = frac(arcsin d - beta, 2) \, wide c = t + beta . $
  Then $\| c \| + \| t \| = max { \| arcsin d \| \, \| beta \| } < pi \/ 2$.
    The case $t = 0$ gives $d = m$ and $V = Psi = 0$; hence assume $t eq.not 0$. Elementary angle identities give
  $ d - m = 2 cos c sin t \, wide m d + h H \( d \) = cos \( 2 t \) . $
  Changing variables $z = sin theta$ in the integral defining $F$ gives,
    with the orientation of the integral retained if $t < 0$,
  $ g - F \( m \) = integral_(c - t)^(c + t) frac(d theta, sqrt(cos theta)) . $
  Normalize this integral by setting
  $ T = m / h \, wide q = frac(cos c, h) = cos t - T sin t > 0 \, wide G = tan c . $
  It follows that
  #[#set math.equation(numbering: n => "(6.16)")
   $ V = frac(2 sin^2 t, h) \, wide Psi / V = 4 sqrt(q) thin A - q^2 - 3 \, wide A = frac(t, sin t) 1 /
     2 integral_(- 1)^1 \( cos \( t u \) - G sin \( t u \) \)^(- 1 \/ 2) thin d u . $ <mid:angular-identities>]
  To bound $A$ from below, we keep the first three terms of a positive expansion.
    If $y = sin^2 \( t u \)$, symmetry in $u$ expresses the averaged integrand as
  $ sum_(j gt.eq 0) binom(4 j, 2 j) / 16^j G^(2 j) y^j \( 1 - y \)^(- j - 1 \/ 4) . $
  This expansion is convergent because $\| G tan \( t u \) \| < 1$,
    and its power coefficients in $y$ are nonnegative. Keeping the terms through degree two therefore gives the
    lower bound
  $ 1 + (1 / 4 + frac(3 G^2, 8)) y + (5 / 32 + frac(15 G^2, 32) + frac(35 G^4, 128)) y^2 . $
  Concavity of sine on $\[ 0 \, pi \/ 2 \]$ implies $sin^2 \( t u \) gt.eq u^2 sin^2 t$.
    Averaging and writing $Y = sin^2 t$, we obtain
  $ 1 / 2 integral_(- 1)^1 \( cos \( t u \) - G sin \( t u \) \)^(- 1 \/ 2) thin d u gt.eq 1 +
    (1 / 12 + G^2 / 8) Y + (1 / 32 + frac(3 G^2, 32) + frac(7 G^4, 128)) Y^2 . $
  Multiply by the positive-series bound $t \/ sin t gt.eq 1 + Y \/ 6 + 3 Y^2 \/ 40$,
    and discard terms of degree at least three. The result is
  #[#set math.equation(numbering: n => "(6.17)")
   $ frac(4 \( A - 1 \), sin^2 t) gt.eq P_0 \, wide P_0 = 1 + G^2 / 2 +
     sin^2 t (173 / 360 + frac(11 G^2, 24) + frac(7 G^4, 32)) . $ <mid:Taylor>]
  To express the remaining terms rationally, put $x = tan \( t \/ 2 \)$. Then
  $ q - 1 = - sin t \( T + x \) \, wide 4 sqrt(q) - q^2 - 3 = - \( q - 1 \)^2 (1 + frac(2, \( 1 + sqrt(q) \)^2)) . $
  Equations (6.16) and (6.17) therefore imply
  #[#set math.equation(numbering: n => "(6.18)")
   $ Psi / V gt.eq sin^2 t [sqrt(q) thin P_0 - \( T + x \)^2 (1 + frac(2, \( 1 + sqrt(q) \)^2))] . $ <mid:bracket>]
  We now bound these square-root coefficients on the required angular domains.
  For $m lt.eq 1 \/ 5$, $T lt.eq 1 \/ sqrt(24) < 21 \/ 100$ and $beta < 21 \/ 100$.
    For $m lt.eq 37 \/ 50$, $beta < 21 \/ 25$. These bounds on $beta$ follow from $sin u gt.eq u -
    u^3 \/ 6$ at the respective rational values. Moreover,
  $ - frac(pi \/ 2 + beta, 4) < t / 2 < pi / 8 \, wide tan \( pi \/ 8 \) = sqrt(2) - 1 < 21 / 50 . $
  Using $pi < 22 \/ 7$, the lower angle in absolute value is less than $9 \/ 20$ in the first range,
    and less than $603 \/ 1000$ in the second. The bounds
  $ tan \( 9 \/ 20 \) < 1 \/ 2 \, wide tan \( 603 \/ 1000 \) < 7 \/ 10 $
  follow by dividing $sin u lt.eq u - u^3 \/ 6 + u^5 \/ 120$ by $cos u gt.eq 1 - u^2 \/ 2 > 0$;
    the resulting comparisons are rational. Thus $m lt.eq 1 \/ 5$ gives $0 lt.eq T lt.eq
    21 \/ 100$ and $\| x \| lt.eq 1 \/ 2$, whereas the two larger ranges have $- 7 \/ 10 lt.eq x lt.eq 21 \/ 50$.
    The corresponding bounds on $T$ are
  $ T lt.eq 2 \/ sqrt(5) < 9 \/ 10 quad \( m lt.eq 2 \/ 3 \) \, wide T lt.eq
    37 \/ sqrt(1131) < 111 \/ 100 quad \( m lt.eq 37 \/ 50 \) . $
  On the small rectangle, $q = \( 1 - x^2 - 2 T x \) \/ \( 1 + x^2 \) gt.eq \( 27 \/ 50 \) \/ \( 5 \/ 4 \) =
    54 \/ 125 = .432$, so $sqrt(q) > 13 \/ 20$. The exact identity
  #[#set math.equation(numbering: n => "(6.19)")
   $ sqrt(q) = 1 + frac(q - 1, 2) - frac(\( q - 1 \)^2, 2 \( 1 + sqrt(q) \)^2) $ <mid:root-identity>]
  and the rational comparisons
  $ 200 / 1089 < 19 / 100 \, wide 1889 / 1089 < 7 / 4 $
  give
  $ sqrt(q) gt.eq 1 + frac(q - 1, 2) - 19 / 100 \( q - 1 \)^2 \, wide 1 + frac(2, \( 1 + sqrt(q) \)^2) < 7 / 4 . $
  For the two larger ranges we use a bound on the actual angular domain:
  $ q gt.eq frac(cos \( \( pi \/ 2 + beta \) \/ 2 \), h) = 1 / sqrt(2 \( 1 + m \)) gt.eq 5 / sqrt(87) > 53 / 100 . $
  In particular $sqrt(q) > 18 \/ 25$, and
  $ 625 / 3698 < 17 / 100 \, wide 3099 / 1849 < 42 / 25 . $
  Equation (6.19) therefore gives
  $ sqrt(q) gt.eq 1 + frac(q - 1, 2) - 17 / 100 \( q - 1 \)^2 \, wide 1 + frac(2, \( 1 + sqrt(q) \)^2) < 42 / 25 . $
  These quadratic lower bounds for $sqrt(q)$ make the bracket in (6.18) rational in $T \, x$.
    We clear its positive denominators using the polynomials
  #[#set math.equation(numbering: n => "(6.20)")
   $ & D = 1 + x^2 \, wide N = 1 - x^2 - 2 T x \, wide z = 2 x \, wide k = 2 x + T \( 1 - x^2 \) \,\
 & P = D^2 (N^4 + frac(k^2 N^2, 2)) + z^2 (frac(173 N^4, 360) + frac(11 k^2 N^2, 24) + frac(7 k^4, 32)) \,\
 & R_e = D^2 + frac(\( N - D \) D, 2) - e \( N - D \)^2 . $ <mid:polynomial-variables>]
  At the angular parameters,
  #[#set math.equation(numbering: n => "(6.21)")
   $ q = N / D \, wide G = k / N \, wide sin t = z / D \, wide P_0 = frac(P, D^2 N^4) \,\
D > 0 \, wide N > 0 \, wide P > 0 . $ <mid:positive-denominators>]
  The needed polynomial signs are
  #[#set math.equation(numbering: n => "(6.22)")
   $ cal(S) \( T \, x \) & := R_(19 \/ 100) P - D^4 N^4 [1 - 33 / 10 T^2 + 7 / 4 \( T + x \)^2] gt.eq 0\
 & #h(35mm)  \( 0 lt.eq T lt.eq 21 \/ 100 \, med \| x \| lt.eq 1 \/ 2 \) \,\
cal(L)_epsilon \( T \, x \) & := z^2 [R_(17 \/ 100) P - 42 / 25 D^4 N^4 \( T + x \)^2] + epsilon D^6 N^4 > 0\
 & #h(10mm)  \( 0 lt.eq T lt.eq T_0 \, med - 7 \/ 10 lt.eq x lt.eq 21 \/ 50 \) \, $ <mid:small-sign>]
  where $\( T_0 \, epsilon \) = \( 9 \/ 10 \, 1 \/ 100 \)$ or $\( 111 \/ 100 \, 1 \/ 50 \)$.
    Their exact finite verification is given below.
  For $m lt.eq 1 \/ 5$, the lower bound for $sqrt(q)$ is $R_(19 \/ 100) \/ D^2$.
    Hence (6.22) makes the bracket in (6.18) at least $1 - \( 33 \/ 10 \) T^2$.
    To compare this with the claimed bound, put $y = T^2 lt.eq 441 \/ 10000$.
    Both sides in the following squared comparison are nonnegative, and
  $ (1 - 33 / 10 y)^2 \( 1 + y \) - \( 1 - 3 y \)^2 = y (2 / 5 - 471 / 100 y + 1089 / 100 y^2) gt.eq 0 . $
  Indeed $2 \/ 5 - \( 471 \/ 100 \) \( 441 \/ 10000 \) > 0$. Consequently
  $ 1 - 33 / 10 T^2 gt.eq frac(1 - 3 T^2, sqrt(1 + T^2)) = frac(1 - 4 m^2, h) . $
  Together with $V = 2 sin^2 t \/ h$, this proves the first line of (6.9).
  For the two larger ranges the lower bound for $sqrt(q)$ is $R_(17 \/ 100) \/ D^2$,
    and the coefficient of $\( T + x \)^2$ is at most $42 \/ 25$.
    Since $sin^2 t = z^2 \/ D^2$, Equation (6.22) implies $Psi \/ V > - epsilon$.
    This proves the other two lines for $t eq.not 0$, and their nonstrict form also holds at $t = 0$.
    Notice that division by $N$ has only been used at actual angular points, where (6.21) holds.
    A larger certification rectangle may contain $N lt.eq 0$;
    its polynomial sign assertion remains valid and is more than is needed here. ◻
]

=== 6.4 The six exact polynomial certificates <the-six-exact-polynomial-certificates>

For completeness, we specify the entire finite calculation behind (6.22)–(6.22).
  It uses rational arithmetic and the tensor Bernstein basis described in Appendix 9.
  Explicitly, for $U \( A \, B \) = sum_(a \, b) u_(a b) A^a
  B^b$ of coordinate degrees at most $\( n_1 \, n_2 \)$, its coefficients in that basis are

#[#set math.equation(numbering: n => "(6.23)")
 $ cal(B)_(i j) \( U \; n_1 \, n_2 \) = sum_(a = 0)^i sum_(b = 0)^j u_(a b)
   frac(binom(i, a) binom(j, b), binom(n_1, a) binom(n_2, b))
   quad \( 0 lt.eq i lt.eq n_1 \, med 0 lt.eq j lt.eq n_2 \) . $ <mid:Bernstein-transform>]

The Bernstein basis functions are nonnegative on the unit square and sum to one.
  Thus a positive minimum of these coefficients proves positivity throughout that square.

For $cal(S)$, use $\( A \, B \) in \[ 0 \, 1 \]^2$, $sigma in { - 1 \, 1 }$, and the two charts

#[#set math.equation(numbering: n => "(6.24)")
 $ C_(1 \, sigma) \( A \, B \) & = \( 21 sqrt(A) \/ 100 \, med sigma B sqrt(A) \/ 2 \) \,\
C_(2 \, sigma) \( A \, B \) & = \( 21 B sqrt(A) \/ 100 \, med sigma sqrt(A) \/ 2 \) . $ <mid:chart-one>]

They cover the required rectangle: choose the first chart when $T \/ \( 21 \/ 100 \) gt.eq \|
  x \| \/ \( 1 \/ 2 \)$, and the second when the reverse inequality holds.
  In each chart $cal(S) compose C_(j \, sigma)$ has a factor $A$.
  To make the expansion entirely explicit, if $cal(S) \( T \, x \) = sum c_(i j) T^i x^j$,
  then every nonzero term has $i + j$ even and at least two, and the divided polynomials are

#[#set math.equation(numbering: n => "(6.25)")
 $ U_(1 \, sigma) & = sum_(i \, j) c_(i j) \( 21 \/ 100 \)^i \( sigma \/ 2 \)^j A^(\( i + j \) \/ 2 - 1) B^j \,\
U_(2 \, sigma) & = sum_(i \, j) c_(i j) \( 21 \/ 100 \)^i \( sigma \/ 2 \)^j A^(\( i + j \) \/ 2 - 1) B^i .
  $ <mid:chart-expansion-one>]

Their degrees are at most $\( 8 \, 18 \)$ and $\( 8 \, 6 \)$, respectively.
  The values at $A = 0$ are polynomial extensions; after multiplying back by $A gt.eq 0$,
  the origin is included in the nonstrict sign claim.

For $cal(L)_epsilon$, subdivide into sixteen equal rectangles. For $j \, k in { 0 \, 1 \, 2 \, 3 }$, use the affine map

#[#set math.equation(numbering: n => "(6.26)")
 $ T = T_0 / 4 \( j + A \) \, wide x = - 7 / 10 + 7 / 25 \( k + B \) \,
   wide \( A \, B \) in \[ 0 \, 1 \]^2 . $ <mid:large-map>]

Each resulting polynomial has coordinate degrees at most $\( 6 \, 20 \)$.
  If the untransformed coefficient of $T^i x^j$ is $c_(i j)$,
  the coefficient of $A^a B^b$ after any affine map $\( T \, x \) = \( ell_T + w_T A \, ell_x + w_x B \)$ is exactly

#[#set math.equation(numbering: n => "(6.27)")
 $ sum_(i gt.eq a \, med j gt.eq b) c_(i j) binom(i, a) binom(j, b) ell_T^(i - a) w_T^a ell_x^(j - b) w_x^b .
   $ <mid:affine-coefficients>]

Thus (6.20)–(6.20), (6.22)–(6.22), and (6.23)–(6.27) specify every coefficient by a finite rational sum.

Table 2 records the minimum coefficients. An entry $M$ in the last column means $floor.l C min cal(B)_(i j)
  floor.r = M$, with the minimum also taken over all sixteen boxes in the last two rows.
  In particular the minimum is at least $M \/ C > 0$. These six integer comparisons are the finite arithmetic part
  of the pointwise proof; the accompanying exact reconstruction scripts implement the displayed sums.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (left, left, left, left, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Polynomial
], table.cell(rowspan: 1, colspan: 1)[Domain map
], table.cell(rowspan: 1, colspan: 1)[Orders
], table.cell(rowspan: 1, colspan: 1)[Scale $C$
], table.cell(rowspan: 1, colspan: 1)[$M$
]),
  table.cell(rowspan: 1, colspan: 1)[$U_(1 \, -)$
], table.cell(rowspan: 1, colspan: 1)[(6.24), $sigma = - 1$
], table.cell(rowspan: 1, colspan: 1)[$\( 8 \, 18 \)$
], table.cell(rowspan: 1, colspan: 1)[$1000$
], table.cell(rowspan: 1, colspan: 1)[90
],
  table.cell(rowspan: 1, colspan: 1)[$U_(1 \, +)$
], table.cell(rowspan: 1, colspan: 1)[(6.24), $sigma = 1$
], table.cell(rowspan: 1, colspan: 1)[$\( 8 \, 18 \)$
], table.cell(rowspan: 1, colspan: 1)[$1000$
], table.cell(rowspan: 1, colspan: 1)[27
],
  table.cell(rowspan: 1, colspan: 1)[$U_(2 \, -)$
], table.cell(rowspan: 1, colspan: 1)[(6.24), $sigma = - 1$
], table.cell(rowspan: 1, colspan: 1)[$\( 8 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[$1000$
], table.cell(rowspan: 1, colspan: 1)[293
],
  table.cell(rowspan: 1, colspan: 1)[$U_(2 \, +)$
], table.cell(rowspan: 1, colspan: 1)[(6.24), $sigma = 1$
], table.cell(rowspan: 1, colspan: 1)[$\( 8 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[$1000$
], table.cell(rowspan: 1, colspan: 1)[120
],
  table.cell(rowspan: 1, colspan: 1)[$cal(L)_(1 \/ 100)$
], table.cell(rowspan: 1, colspan: 1)[(6.26), $T_0 = 9 \/ 10$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 20 \)$
], table.cell(rowspan: 1, colspan: 1)[$10000$
], table.cell(rowspan: 1, colspan: 1)[53
],
  table.cell(rowspan: 1, colspan: 1)[$cal(L)_(1 \/ 50)$
], table.cell(rowspan: 1, colspan: 1)[(6.26), $T_0 = 111 \/ 100$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 20 \)$
], table.cell(rowspan: 1, colspan: 1)[$10000$
], table.cell(rowspan: 1, colspan: 1)[26
],
)
]],
  caption: [Table 3: Exact Bernstein certificate minima for the intermediate band. ],
)

== 7 Large biases <sec:large-bias>

The last bias range admits a direct estimate. We retain the reduction $0 lt.eq rho lt.eq 1$.
  As throughout the proof, $H \( t \) = sqrt(1 - t^2)$, expectation is uniform on the cube, and

$ m = bb(E) f \, wide d = T_rho f \, wide h = H \( m \) \, wide b = bb(E) H \( d \) \, wide r = rho^2 = 1 - s^2 . $

All terminating decimals in this section denote exact rational numbers.

#thm([Proposition 7.1.])[
  #emph[If $f : { - 1 \, 1 }^n arrow.r { - 1 \, 1 }$ has $0.74 lt.eq m < 1$ and $0.84 lt.eq s lt.eq 1$, then
$ h - b lt.eq 1 - s . $

]
] <prop:large-bias>

Write $U = T_rho upright(bold(1))_({ f = - 1 }) = \( 1 - d \) \/ 2$, so that $H \( d \) = 2 sqrt(U) sqrt(1 - U)$.
  Expanding $sqrt(1 - U)$ will reduce the desired lower bound on $b$ to a lower bound on $bb(E)
  U^(1 \/ 2)$ and upper bounds on the higher moments $bb(E) U^(k + 1 \/ 2)$, $k gt.eq 1$.
  These are supplied by reverse and forward cube norm inequalities, respectively.

The forward inequality belongs to the classical hypercontractive theory of Bonami and Beckner [4,2];
  the reverse inequality is due to Borell [5]. We derive both from the cube logarithmic Sobolev inequality using
  Gross’s semigroup method [12]. The sharp reverse time constant is also given by Mossel, Oleszkiewicz,
  and Sen [15] Equation (1.2) and Theorem 1.10 with logarithmic Sobolev constant $2$.
  The proof below fixes the uniform-bit normalization and the limiting argument for inputs with zeros.

=== 7.1 The cube norm inequalities <the-cube-norm-inequalities>

For a positive function $z$ on a finite probability space, write

$ "Ent" \( z \) = bb(E) \( z log z \) - \( bb(E) z \) log \( bb(E) z \) . $

Recall the operators from Section 2: on the cube, let $bb(E)_i$ average only coordinate $i$, and set $D_i = I -
  bb(E)_i$ and $cal(N) = sum_i D_i$. These self-adjoint projections give

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E) v cal(N) w = sum_i bb(E) \( D_i v \) \( D_i w \) . $ <lb:dirichlet>]

In particular, if $v_(+) \, v_(-)$ and $w_(+) \, w_(-)$ are the two values on a coordinate edge,
  its conditional contribution is

$ bb(E)_i \[ v D_i w \] = frac(\( v_(+) - v_(-) \) \( w_(+) - w_(-) \), 4) . $

#thm([Lemma 7.2.])[
  (Cube logarithmic Sobolev inequality).  #emph[For every positive function $a$ on the uniform cube,
#[#set math.equation(numbering: n => "(7.2)")
 $ "Ent" \( a^2 \) lt.eq 2 bb(E) a cal(N) a . $ <lb:entropy-bound>]

]
] <lb:log-sobolev>

#proof[
  First consider one bit. Both sides are homogeneous of degree two in $a$.
    After dividing by $bb(E) a^2$ and exchanging the two endpoints if necessary,
    we may suppose that $a_plus.minus^2 = 1 plus.minus x$, where $0 lt.eq x < 1$. The entropy then equals
  $ J \( x \) = frac(\( 1 + x \) log \( 1 + x \) + \( 1 - x \) log \( 1 - x \), 2) \, $
  whereas the right side of (7.2) equals
  $ frac(\( a_(+) - a_(-) \)^2, 2) = 1 - sqrt(1 - x^2) . $
  Both expressions vanish at zero. Their derivatives satisfy
  $ J' \( x \) = "arctanh" x lt.eq x / sqrt(1 - x^2) . $
  Indeed, the difference on the right minus the left vanishes at zero and has derivative
    $\( 1 - x^2 \)^(- 3 \/ 2) - \( 1 - x^2 \)^(- 1) gt.eq 0$.
    Integration proves the one-bit inequality, including its constant $2$.
  For completeness, entropy is convex in its positive input. Its second variation in the direction $w$ is
  $ bb(E) w^2 / z - frac(\( bb(E) w \)^2, bb(E) z) gt.eq 0 $
  by Cauchy–Schwarz. Let $"Ent"_i$ denote entropy on bit $i$ with the other bits fixed. The exact decomposition
  $ "Ent" \( z \) = bb(E) "Ent"_1 \( z \) + "Ent" \( bb(E)_1 z \) $
  and induction on the remaining coordinates imply
  #[#set math.equation(numbering: n => "(7.3)")
   $ "Ent" \( z \) lt.eq sum_i bb(E) "Ent"_i \( z \) . $ <lb:tensorization>]
  To see the induction step explicitly, for $i eq.not 1$ convexity gives $"Ent"_i \( bb(E)_1 z \) lt.eq
    bb(E)_1 "Ent"_i \( z \)$: conditional averaging in coordinate $1$ is a convex combination of the two positive
    vectors indexed by coordinate $i$. Apply the one-bit inequality to $z = a^2$ in every summand of (7.3),
    and then sum the edge energies using (7.1). ◻
]

#thm([Lemma 7.3.])[
  (Forward and reverse cube norm bounds).  #emph[Let $u_0 gt.eq 0$ be a real function on the cube, $tau gt.eq 0$,
    and $r = e^(- 2 tau)$. For every $q > 0$, $q eq.not 1$, put $p_q = 1 + r \( q - 1 \)$. Then
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E) \( T_(e^(- tau)) u_0 \)^q
   cases(delim: "{", lt.eq \( bb(E) u_0^(p_q) \)^(q \/ p_q) \, & q > 1 \,, gt.eq \( bb(E) u_0^(p_q) \)^(q \/
   p_q) \, & 0 < q < 1 .) $ <lb:norm-moments>]

]
] <lb:norm-bounds>

#proof[
  We begin with strictly positive $u_0$. The noise semigroup is $T_(e^(- t)) = e^(- t cal(N))$, so $u \( t \) =
    T_(e^(- t)) u_0$ satisfies $u' = - cal(N) u$. This identity follows, for example,
    because $cal(N)$ multiplies a character of degree $j$ by $j$, while noise multiplies it by $e^(- t j)$.
  For positive edge values $A > B$ and any $q > 0$, $q eq.not 1$, Cauchy–Schwarz in the interval $\[ B \, A \]$ gives
  $ 4 / q^2 \( A^(q \/ 2) - B^(q \/ 2) \)^2 & = (integral_B^A t^(q \/ 2 - 1) thin d t)^2\
 & lt.eq \( A - B \) integral_B^A t^(q - 2) thin d t = frac(\( A - B \) \( A^(q - 1) - B^(q - 1) \), q - 1) . $
  The last quotient is positive also when $0 < q < 1$. The inequality is symmetric in $A \,
    B$ and holds by continuity when they coincide. Summing it with the edge factor $1 \/ 4$ yields
  #[#set math.equation(numbering: n => "(7.5)")
   $ frac(bb(E) u^(q - 1) cal(N) u, q - 1) gt.eq 4 / q^2 bb(E) u^(q \/ 2) cal(N) \( u^(q \/ 2) \) . $ <lb:power-energy>]
  To reach a prescribed final exponent $q$, vary the exponent along
  $ theta \( t \) = 1 + \( q - 1 \) e^(2 \( t - tau \)) \, wide 0 lt.eq t lt.eq tau . $
  This path is positive, stays on the same side of $1$ as $q$, and satisfies $theta' = 2 \( theta - 1 \)$,
    $theta \( 0 \) = p_q$, and $theta \( tau \) = q$. For $M \( t \) = bb(E) u \( t \)^(theta \( t \))$,
    direct differentiation gives
  $ M' = theta' bb(E) \( u^theta log u \) - theta bb(E) u^(theta - 1) cal(N) u . $
  Consequently, with $parallel u parallel_theta = \( bb(E) u^theta \)^(1 \/ theta)$ also for $0 < theta < 1$,
  #[#set math.equation(numbering: n => "(7.6)")
   $ frac(d, d t) log parallel u parallel_theta & = theta' / theta^2 frac("Ent" \( u^theta \), M) -
     frac(bb(E) u^(theta - 1) cal(N) u, M)\
 & = frac(theta - 1, M) [2 / theta^2 "Ent" \( u^theta \) - frac(bb(E) u^(theta - 1) cal(N) u, theta - 1)] .
   $ <lb:norm-derivative>]
  Lemma 19, applied to $u^(theta \/ 2)$, and (7.5) show that the bracket is nonpositive.
    Thus the derivative is nonpositive when $q > 1$ and nonnegative when $0 < q < 1$.
    Integrating, and raising the resulting norm inequality to the positive power $q$, proves (7.4).
    For general $u_0 gt.eq 0$, apply the result to $u_0 + epsilon$ and let $epsilon arrow.b 0$.
    The cube is finite, and all exponents involved are positive, so both sides converge continuously. ◻
]

=== 7.2 Reduction to a series of powers <reduction-to-a-series-of-powers>

#proof[
  We first use the norm inequalities to bound a positive series of moments.
    We then bound its terms and tail uniformly on four intervals of $r$.
    Finally, exact rational estimates make the resulting bound smaller than $1 - s$ on each interval.
  The case $s = 1$ has $rho = 0$ and $d = m$, hence $h - b = 0$.
    We may therefore assume $0.84 lt.eq s < 1$, so $0 < r lt.eq 0.2944$. Write
  $ p = Pr \( f = - 1 \) = frac(1 - m, 2) in \( 0 \, 0.13 \] \, wide U = T_rho upright(bold(1))_({ f = - 1 }) =
    frac(1 - d, 2) . $
  The preceding approximation argument applies to this indicator input.
    After taking its limit, $0 lt.eq U lt.eq 1$ and $H \( d \) = 2 sqrt(U) sqrt(1 - U)$.
  For $0 lt.eq z lt.eq 1$, the binomial expansion has positive coefficients:
  #[#set math.equation(numbering: n => "(7.7)")
   $ 1 - sqrt(1 - z) = sum_(k gt.eq 1) c_k z^k \, wide c_k = frac(binom(2 k, k), \( 2 k - 1 \) 4^k) \, wide c_1 =
     1 / 2 \, quad c_(k + 1) = c_k frac(k - 1 \/ 2, k + 1) . $ <lb:binomial>]
  The usual Taylor expansion gives this identity for $z < 1$;
    positivity and monotone convergence as $z arrow.t 1$ give $sum_(k gt.eq 1) c_k = 1$ and the identity at $z =
    1$. It follows that
  #[#set math.equation(numbering: n => "(7.8)")
   $ h - b = 2 \( sqrt(p) - bb(E) sqrt(U) \) + 2 sum_(k gt.eq 1) c_k #scale(x: 120%, y: 120%)[\(] bb(E)
     U^(k + 1 \/ 2) - p^(k + 1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <lb:series-identity>]
  The interchange with expectation is justified by the nonnegative series for each of the two terms;
    both series are bounded by $sum_k c_k = 1$. Lemma 20 with $q =
    1 \/ 2$ bounds the first expectation from below, and with $q_k = k +
    1 \/ 2$ bounds the other moments from above. Thus
  #[#set math.equation(numbering: n => "(7.9)")
   $ h - b lt.eq 2 #scale(x: 120%, y: 120%)[\[] p^(1 \/ 2) - p^(1 \/ \( 2 - r \)) #scale(x: 120%, y: 120%)[\]] +
     2 sum_(k gt.eq 1) c_k [p^(q_k \/ \( 1 + r \( q_k - 1 \) \)) - p^(q_k)] . $ <lb:series-bound>]
  Every bracket on the right increases with $p$ on $\[ 0 \, 0.13 \]$. Indeed, if $1 \/ 2 lt.eq a < b$ and $p > 0$, then
  $ frac(d, d p) \( p^a - p^b \) gt.eq 0 quad arrow.l.r.double quad p lt.eq \( a \/ b \)^(1 \/ \( b - a \)) . $
  Since $log \( b \/ a \) lt.eq \( b - a \) \/ a$, this threshold is at least $e^(- 1 \/ a) gt.eq e^(- 2) > 0.13$;
    the last strict inequality follows also from the logarithm bounds established in (7.11) below.
    The exponents in (7.9) have this ordering, since $0 < r < 1$.
    We can therefore replace $p$ by $p_(*) = 13 \/ 100$ throughout its right side.
  === 7.3 Uniform bounds on the four noise intervals <uniform-bounds-on-the-four-noise-intervals>
  Put $L = log \( 100 \/ 13 \)$ and $L_0 = 2041 \/ 1000$. To replace powers of $p_(*)$ by rational expressions, define
  #[#set math.equation(numbering: n => "(7.10)")
   $ S_N \( x \) = sum_(j = 0)^N frac(x^j, j !) \, wide E \( z \) =
     frac(1, S_40 \( \( 51 \/ 25 \) z \)) quad \( z gt.eq 0 \) . $ <lb:exponential-envelope>]
  We have the exact rational comparisons
  #[#set math.equation(numbering: n => "(7.11)")
   $ S_15 #h(-0.16667em) (51 / 25) +
     frac(\( 51 \/ 25 \)^16, 16 ! #scale(x: 120%, y: 120%)[\(] 1 - \( 51 \/ 25 \) \/ 17
     #scale(x: 120%, y: 120%)[\)]) & < 7691 / 1000 < 100 / 13\
 & < 7698 / 1000 < S_15 #h(-0.16667em) (2041 / 1000) . $ <lb:log-brackets>]
  For $x = 51 \/ 25$, the remainder after term $15$ in $e^x$ is at most $x^16 \/ \[ 16 ! \( 1 - x \/ 17 \) \]$:
    every ratio after the first omitted term is at most $x \/ 17 < 1$.
    The truncated sum at $2041 \/ 1000$ is less than its full exponential. Therefore (7.11) proves
  #[#set math.equation(numbering: n => "(7.12)")
   $ 2.04 < L < 2.041 = L_0 \, wide sqrt(p_(*)) < 0.361 \, wide p_(*)^z lt.eq
     E \( z \) quad \( z gt.eq 0 \) . $ <lb:rational-envelopes>]
  The middle inequality follows from $0.361^2 > 0.13$. For the last one, $S_40 \( 2.04 z \) lt.eq e^(2.04 z) lt.eq
    e^(L z)$; no upper estimate for the omitted exponential tail is needed there.
  Fix one of the four intervals
  #[#set math.equation(numbering: n => "(7.13)")
   $ \[ sigma_(-) \, sigma_(+) \] in
     { \[ 0.84 \, 0.88 \] \, \[ 0.88 \, 0.92 \] \, \[ 0.92 \, 0.96 \] \, \[ 0.96 \, 1 \] } \, $ <lb:noise-intervals>]
  and let
  $ ell = 1 - sigma_(+)^2 \, wide R = 1 - sigma_(-)^2 . $
  For $s$ in this interval and $s < 1$, we have $0 < r lt.eq R$ and $r gt.eq ell$.
    Every expression with $ell$ in its denominator below is omitted when $ell = 0$.
  First, put $delta = r \/ \[ 2 \( 2 - r \) \]$, so that $1 \/ \( 2 - r \) = 1 \/ 2 + delta$.
    Convexity of $t mapsto e^(- L t)$ gives the trapezoid estimate
  $ frac(2 \[ p_(*)^(1 \/ 2) - p_(*)^(1 \/ \( 2 - r \)) \], 1 - s) =
    frac(2 sqrt(p_(*)) L, 1 - s) integral_0^delta e^(- L t) thin d t lt.eq
    sqrt(p_(*)) L frac(1 + s, 1 + s^2) frac(1 + p_(*)^delta, 2) . $
  Here we used $delta \/ \( 1 - s \) = \( 1 + s \) \/ \[ 2 \( 1 + s^2 \) \]$.
    The function $\( 1 + s \) \/ \( 1 + s^2 \)$ decreases for $s gt.eq 0.84$,
    since its derivative has numerator $1 - 2 s - s^2 < 0$. Also $delta$ increases with $r$,
    whence $p_(*)^delta lt.eq p_(*)^(ell \/ \[ 2 \( 2 - ell \) \])$. Using (7.12), define the resulting rational bound
  #[#set math.equation(numbering: n => "(7.14)")
   $ B = L_0 \( 0.361 \) frac(1 + sigma_(-), 1 + sigma_(-)^2) frac(1 + E \( ell \/ \[ 2 \( 2 - ell \) \] \), 2) .
     $ <lb:B>]
  We next bound each remaining difference after division by $r$. For $q = q_k = k + 1 \/ 2$, put
  $ z_q \( t \) = frac(q, 1 + t \( q - 1 \)) \, wide a = z_q \( R \) \, wide b_1 = z_q \( ell \) \, wide
    F_q \( t \) = p_(*)^(z_q \( t \)) - p_(*)^q . $
  For every $q gt.eq 3 \/ 2$ and $0 lt.eq t lt.eq R lt.eq 184 \/ 625$, all the exponents in use satisfy
  #[#set math.equation(numbering: n => "(7.15)")
   $ z_q \( t \) gt.eq frac(3 \/ 2, 1 + \( 184 \/ 625 \) \/ 2) = 625 / 478 > 1.3 . $ <lb:exponent-range>]
  To verify the first inequality, $z_q \( t \)$ decreases in $t$ and increases in $q$, because $t < 1$.
    By $L > 2.04$, the functions $z p_(*)^z$ and $z^2 p_(*)^z$ strictly decrease for $z gt.eq 1.3$:
    their derivative signs are those of $1 - L z$ and $2 - L z$, respectively.
  There are three useful estimates for $F_q \( r \) \/ r$.
  + Differentiation gives
    $ F'_q \( t \) = L \( 1 - 1 \/ q \) z_q \( t \)^2 p_(*)^(z_q \( t \)) . $
    Since $F_q \( 0 \) = 0$ and $z_q \( t \) gt.eq a$ for $0 lt.eq t lt.eq r$,
      integration and the decreasing property just proved give
    $ frac(F_q \( r \), r) lt.eq L_0 \( 1 - 1 \/ q \) a^2 E \( a \) . $
  + If $ell > 0$, discarding the subtracted power and using $r gt.eq ell$ gives the direct estimate
    $ frac(F_q \( r \), r) lt.eq p_(*)^(z_q \( r \)) / ell lt.eq frac(E \( a \), ell) . $
  + Integration in the exponent, followed by the trapezoid bound, gives, with $z = z_q \( r \)$,
    $ frac(F_q \( r \), r) & = L / r integral_z^q p_(*)^t thin d t lt.eq
      frac(L \( q - z \), 2 r) \( p_(*)^z + p_(*)^q \)\
 & = frac(L \( q - 1 \), 2) #scale(x: 120%, y: 120%)[\[] z p_(*)^z + z p_(*)^q #scale(x: 120%, y: 120%)[\]] lt.eq
   frac(L_0 \( q - 1 \), 2) #scale(x: 120%, y: 120%)[\[] a E \( a \) + b_1 E \( q \) #scale(x: 120%, y: 120%)[\]] . $
    Here $q - z = r \( q - 1 \) z$, the first summand uses the decrease of $z p_(*)^z$ and $z gt.eq a$,
      and the second uses $z lt.eq b_1$.
  It follows that, for $1 lt.eq k lt.eq 10$,
  #[#set math.equation(numbering: n => "(7.16)")
   $ frac(F_(q_k) \( r \), r) lt.eq B_k := min { & L_0 \( 1 - 1 \/ q_k \) a^2 E \( a \) \,
     thick frac(E \( a \), ell) \,\
 & frac(L_0 \( q_k - 1 \), 2) \[ a E \( a \) + b_1 E \( q_k \) \] #scale(x: 240%, y: 240%)[}] . $ <lb:Bk>]
  For the tail, set
  #[#set math.equation(numbering: n => "(7.17)")
   $ a_11 = frac(23 \/ 2, 1 + R \( 21 \/ 2 \)) \, wide B' = min {L_0 a_11^2 E \( a_11 \) \,
     thick frac(E \( a_11 \), ell)} . $ <lb:Btail>]
  For $k gt.eq 11$, $z_(q_k) \( R \) gt.eq a_11$, again by its increase with $q$.
    The first estimate for $F_q \( r \) \/ r$, with $1 - 1 \/ q lt.eq 1$,
    is therefore bounded by $L_0 a_11^2 E \( a_11 \)$, using the decrease of $z^2
    p_(*)^z$ before replacing the power by $E$. The direct estimate is bounded by $E \( a_11 \) \/
    ell$ in the same way. This proves $F_(q_k) \( r \) \/ r lt.eq B'$ for every $k gt.eq 11$.
    In the interval ending at $1$, only the first of these tail estimates is used; no division by zero occurs.
  Finally, define
  #[#set math.equation(numbering: n => "(7.18)")
   $ S & = sum_(k = 1)^10 c_k B_k \, wide T = (1 - sum_(k = 1)^10 c_k) B' \,\
C & = B + 2 \( 1 + sigma_(+) \) \( S + T \) . $ <lb:finite-tail-sums>]
  Since $r \/ \( 1 - s \) = 1 + s lt.eq 1 + sigma_(+)$, Equations (7.9), (7.14), (7.16), and (7.17) imply
  #[#set math.equation(numbering: n => "(7.19)")
   $ frac(h - b, 1 - s) lt.eq C . $ <lb:final-reduction>]
  === 7.4 Exact rational evaluation <exact-rational-evaluation>
  Here are the coefficient data and arithmetic recipe for the final check.
    The first ten coefficients from (7.7), and their remaining mass, are exactly
  #[#set math.equation(numbering: n => "(7.20)")
   $ \( c_1 \, dots.h \, c_10 \) & =
     (1 / 2 \, 1 / 8 \, 1 / 16 \, 5 / 128 \, 7 / 256 \, 21 / 1024 \, 33 / 2048 \, 429 / 32768 \, 715 / 65536 \,
     2431 / 262144) \,\
1 - sum_(k = 1)^10 c_k & = 46189 / 262144 . $ <lb:coefficient-data>]
  For rational $x$, compute $S_N \( x \)$ entirely rationally by starting $t_0 = 1$ and successively taking $t_j =
    t_(j - 1) x \/ j$, then summing $t_0 + dots.h.c + t_N$. This evaluates the two order-$15$ comparisons in
    (7.11) and every order-$40$ expression in (7.10). Substitution in (7.14)–(7.18),
    using only rational multiplication, addition, division, and comparison, gives Table 3.
    A minimum in (7.16) or (7.17) is found by comparing its rational candidates;
    the candidate with denominator $ell$ is excluded when $ell = 0$.
  In the table, $overline(B) = ceil.l 10^9 B ceil.r$, $overline(S) = ceil.l 10^9 S ceil.r$, and $overline(T) =
    ceil.l 10^9 T ceil.r$ are #emph[integers]. Thus the table also supplies the simpler rational upper bound
  #[#set math.equation(numbering: n => "(7.21)")
   $ C lt.eq frac(overline(B) + 2 \( 1 + sigma_(+) \) \( overline(S) + overline(T) \), 10^9) . $ <lb:rounded-total>]
  For an exact fraction $x = A \/ D$ with positive denominator,
    its required ceiling is $ceil.l 10^9 A \/ D ceil.r$, evaluated by integer division.
    The recipe therefore involves no floating-point operations, including in the rounding step.
    The executable companion #raw("verification/large_bias.py") checks these coefficient data,
    the logarithm brackets, each table entry, and the final comparisons.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 7,
  align: (center, center, center, right, right, right, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$\[ sigma_(-) \, sigma_(+) \]$
], table.cell(rowspan: 1, colspan: 1)[$ell$
], table.cell(rowspan: 1, colspan: 1)[$R$
], table.cell(rowspan: 1, colspan: 1)[$overline(B)$
], table.cell(rowspan: 1, colspan: 1)[$overline(S)$
], table.cell(rowspan: 1, colspan: 1)[$overline(T)$
], table.cell(rowspan: 1, colspan: 1)[upper bound
]),
  table.cell(rowspan: 1, colspan: 1)[$\[ 0.84 \, 0.88 \]$
], table.cell(rowspan: 1, colspan: 1)[$141 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[$184 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[$746521967$
], table.cell(rowspan: 1, colspan: 1)[$60049597$
], table.cell(rowspan: 1, colspan: 1)[$2525240$
], table.cell(rowspan: 1, colspan: 1)[$0.982$
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 0.88 \, 0.92 \]$
], table.cell(rowspan: 1, colspan: 1)[$96 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[$141 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[$748896408$
], table.cell(rowspan: 1, colspan: 1)[$56019174$
], table.cell(rowspan: 1, colspan: 1)[$1084482$
], table.cell(rowspan: 1, colspan: 1)[$0.969$
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 0.92 \, 0.96 \]$
], table.cell(rowspan: 1, colspan: 1)[$49 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[$96 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[$750555827$
], table.cell(rowspan: 1, colspan: 1)[$51401364$
], table.cell(rowspan: 1, colspan: 1)[$283275$
], table.cell(rowspan: 1, colspan: 1)[$0.954$
],
  table.cell(rowspan: 1, colspan: 1)[$\[ 0.96 \, 1 \]$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$49 \/ 625$
], table.cell(rowspan: 1, colspan: 1)[$751524751$
], table.cell(rowspan: 1, colspan: 1)[$46967364$
], table.cell(rowspan: 1, colspan: 1)[$36923$
], table.cell(rowspan: 1, colspan: 1)[$0.940$
],
)
]],
    caption: [Table 4: Exact integer ceilings for the rational bounds. The expression in (7.21) is strictly below the final column in every row. ],
  )
  For explicit final arithmetic, the four right sides of (7.21) are, in order,
  $ 24545083853 / 25000000000 < 982 / 1000 \, wide 3025545147 / 3125000000 < 969 / 1000 \,\
23828990297 / 25000000000 < 954 / 1000 \, wide 939541899 / 1000000000 < 940 / 1000 . $
  Every displayed upper bound is strictly below $1$. The four intervals cover $0.84 lt.eq s < 1$,
    so (7.19) proves $h - b lt.eq 1 - s$ throughout the claimed range.
    The already treated endpoint $s = 1$ completes the proof. ◻
]

== 8 Completion of the proof <sec:completion>

#proof[
  The endpoint and symmetry reductions in Section 2 reduce the problem to $0 < rho <
    1$ and a nonconstant function. Theorem 2 proves Equation (1.1) when $0 < s lt.eq .84$.
    For larger $s$, replace $f$ by $- f$ if necessary so that $m gt.eq 0$.
    Proposition 18 gives the desired inequality whenever $m gt.eq .74$.
    If $m < .74$ and the inequality were ever to fail, Lemma 7 would provide a parameter satisfying
    Equation (4.4). At that parameter, either $m lt.eq r^2 \/ 2$ or $m gt.eq r^2 \/ 2$.
    Propositions 10 and 16 exclude these possibilities unless $f$ is a signed coordinate,
    for which equality is already known. This proves the theorem for every $n \, f \, rho$. ◻
]

=== 8.1 The information-theoretic consequence <the-information-theoretic-consequence>

For $0 lt.eq p lt.eq 1$, write

$ h_2 \( p \) = - p log_2 p - \( 1 - p \) log_2 \( 1 - p \) \, $

with $0 log_2 0 = 0$. Mutual information in the next statement is measured in bits.
  The argument is the implication of Anantharam, Bogdanov, Chakrabarti, Jayram,
  and Nair [1] Proposition 1 and Lemma 1, reproduced here in our normalization.
  It applies to Boolean summaries of a uniform input, including summaries with nonzero mean.

#thm([Corollary 8.1.])[
  (Courtade–Kumar bound).  #emph[Let $X$ be uniform on ${ - 1 \, 1 }^n$, let $f$ be Boolean, and let $Y_i =
    X_i Z_i$, where the $Z_i$ are independent of $X$ and each other, with $Pr \( Z_i = - 1 \) =
    epsilon in \[ 0 \, 1 \/ 2 \]$. Then
$ I \( f \( X \) \; Y \) lt.eq 1 - h_2 \( epsilon \) . $

 Signed coordinates attain equality.]
] <cor:ck>

#proof[
  Put $rho = 1 - 2 epsilon$, $d = T_rho f$, $m = bb(E) f$, $h = H \( m \)$, $b = bb(E) H \( d \)$, and $s =
    H \( rho \)$. Define
  $ phi \( t \) = h_2 (frac(1 - sqrt(1 - t^2), 2)) \, wide 0 lt.eq t lt.eq 1 . $
  This function is increasing and convex. In fact, for $0 < t < 1$, writing $v = sqrt(1 - t^2)$ gives
  $ phi' \( t \) = frac(t, 2 v log 2) log frac(1 + v, 1 - v) gt.eq 0 \, wide phi'' \( t \) =
    frac(log \( \( 1 + v \) \/ \( 1 - v \) \) - 2 v, 2 v^3 log 2) gt.eq 0 . $
  The last numerator is nonnegative because its derivative with respect to $v$ is $2 v^2 \/ \( 1 - v^2 \) gt.eq
    0$ and its value at zero is zero. Continuity extends monotonicity and convexity to $\[ 0 \, 1 \]$.
  The symmetric noise kernel gives $Pr \( f \( X \) = 1 divides Y \) = \( 1 + d \( Y \) \) \/ 2$.
    The identity $h_2 \( \( 1 + u \) \/ 2 \) = phi \( H \( u \) \)$, valid for every $u in \[ - 1 \, 1 \]$,
    and Jensen’s inequality therefore imply
  $ I \( f \( X \) \; Y \) = phi \( h \) - bb(E) phi \( H \( d \) \) lt.eq phi \( h \) - phi \( b \) . $
  Concavity of $H$ gives $b lt.eq h$, and Theorem 1 gives $delta := h - b lt.eq 1 - s$.
    For a convex function its increments over intervals of fixed length are increasing with the left endpoint.
    Since $h lt.eq 1$,
  $ phi \( h \) - phi \( b \) lt.eq phi \( 1 \) - phi \( 1 - delta \) lt.eq phi \( 1 \) - phi \( s \) = 1 -
    h_2 \( epsilon \) . $
  The same reasoning includes $delta = 0$ and the noise endpoints by continuity.
    A signed coordinate is a uniform bit observed through a binary symmetric channel,
    whose mutual information is $1 - h_2 \( epsilon \)$. ◻
]

== 9 Exact arithmetic conventions <app:arithmetic>

All constants in the certificates are rational; a terminating decimal denotes the corresponding rational number
  exactly. This appendix explains the common sign-certification rules.
  The individual polynomials, parameter maps, and subdivision orders are specified where they are used.

=== 9.1 Bernstein coefficients <bernstein-coefficients>

We use the standard enclosure supplied by the Bernstein form of a polynomial;
  see Cargo and Shisha [6] Section 3 for the univariate coefficient identity and range bound.
  We include the tensor-product formula and its proof to make the rational checks explicit.
  Let $P \( x \, y \) = sum_(k = 0)^N sum_(ell = 0)^K a_(k ell) x^k y^ell$.
  On the unit square its Bernstein expansion is

#[#set math.equation(numbering: n => "(9.1)")
 $ P \( x \, y \) = sum_(i = 0)^N sum_(j = 0)^K b_(i j) binom(N, i) x^i \( 1 - x \)^(N - i) binom(K, j)
   y^j \( 1 - y \)^(K - j) \, $ <eq:bernstein-expansion>]

where

#[#set math.equation(numbering: n => "(9.2)")
 $ b_(i j) = sum_(0 lt.eq k lt.eq i\
0 lt.eq ell lt.eq j) a_(k ell) binom(i, k) / binom(N, k) binom(j, ell) / binom(K, ell) . $ <eq:bernstein-coefficients>]

Indeed,

$ x^k = sum_(i = k)^N binom(i, k) / binom(N, k) binom(N, i) x^i \( 1 - x \)^(N - i) \, $

by the binomial theorem after factoring out $x^k$; multiplying two such identities proves the formula.
  The basis functions in Equation (9.1) are nonnegative and sum to one. Therefore

#[#set math.equation(numbering: n => "(9.3)")
 $ P \( x \, y \) gt.eq min_(i \, j) b_(i j) wide \( 0 lt.eq x \, y lt.eq 1 \) . $ <eq:bernstein-lower>]

The univariate version is obtained by omitting $y$.

For a rational rectangle, first substitute the affine maps from the unit square.
  For a polynomial obtained after a rational or algebraic change of variables,
  the displayed denominator is cleared only where it is positive, as verified in the corresponding argument.
  A positive common scale may be applied to all coefficients, making every calculation integral.
  If a table reports $floor.l C min b_(i j) floor.r$ for a stated $C > 0$,
  a positive table entry is an exact strict sign certificate.

Subintervals can be handled either by direct substitution or by de Casteljau subdivision.
  For subdivision at $1 \/ 2$, start from a Bernstein row $\( b_0 \, dots.h \, b_N \)$,
  repeatedly replace neighboring entries by their arithmetic mean,
  and take the left and right outer diagonals as the Bernstein rows on the two halves.
  This rule follows by substituting $x = t \/ 2$ and $x = \( 1 + t \) \/ 2$ into the basis expansion.
  It is exact over the rationals; a common power of two clears all new denominators.
  For rectangles, apply the rule separately in each coordinate.

=== 9.2 Intervals and derivative enclosures <intervals-and-derivative-enclosures>

An interval $\[ a \, b \]$ encloses a real quantity if $a lt.eq x lt.eq b$.
  Addition, subtraction, multiplication, and reciprocal use the endpoint extrema,
  with a reciprocal taken only when zero is excluded. Square roots are taken only on nonnegative intervals.
  For a positive integer scale $Q$, rounding a lower endpoint down to a multiple of $1 \/
  Q$ and an upper endpoint up preserves enclosure. Scaled square roots reduce to integer square-root bounds:
  for an integer $A gt.eq 0$,

$ floor.l sqrt(A) floor.r^2 lt.eq A < \( floor.l sqrt(A) floor.r + 1 \)^2 . $

Consequently no floating-point operation is needed for an interval certificate.

A derivative enclosure supplies a second bound on a box. If a function has center enclosure $I_0$,
  coordinate half-widths $h_i$, and derivative magnitude bounds $M_i$, then

#[#set math.equation(numbering: n => "(9.4)")
 $ P \( upright("box") \) subset.eq I_0 + [- sum_i h_i M_i \, thick sum_i h_i M_i] . $ <eq:mean-value-box>]

This follows by integrating the derivative along a segment from the center.
  The same statement holds with bounded limiting derivatives at a boundary whenever the resulting Lipschitz
  estimate extends continuously. At a square-root singularity the direct interval enclosure is used instead.
  The pair certificate in Appendix 10 specifies which bounds are used and how uncertified boxes are subdivided.
  An undefined local interval operation causes further subdivision, never acceptance.

=== 9.3 Supplementary sources <supplementary-sources>

The complete certificate sources accompany the paper in the directory #raw("verification/").
  They are organized as follows.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Source
], table.cell(rowspan: 1, colspan: 1)[Certified calculations
]),
  table.cell(rowspan: 1, colspan: 1)[#raw("interval_certificate.cpp")
], table.cell(rowspan: 1, colspan: 1)[The three pair cases in Appendix 10.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("profile_certificate.py")
], table.cell(rowspan: 1, colspan: 1)[The polynomial profiles, their branch inequalities, and the three-bit base cases.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("central_band.py")
], table.cell(rowspan: 1, colspan: 1)[The central-band polynomial signs and rational constant bounds.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("intermediate_bias.py")
], table.cell(rowspan: 1, colspan: 1)[The six intermediate-bias Bernstein bounds.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("large_bias.py")
], table.cell(rowspan: 1, colspan: 1)[The four norm-estimate bounds, including the series tail.
],
  table.cell(rowspan: 1, colspan: 1)[#raw("profile_formula_audit.py")
], table.cell(rowspan: 1, colspan: 1)[An independent coefficient reconstruction of the profile formulas and
  printed data.
],
)
]

The accompanying README gives the compiler and Python requirements and a single command to reproduce the
  calculations. The C++ source uses outward-rounded integer intervals with signed extended 128-bit intermediates;
  Appendix 10 gives the relevant bounds. The principal Python profile certificate uses arbitrary-precision integer
  arithmetic. The symbolic reconstruction scripts use exact rational coefficients.
  The arguments proving the enclosure rules, the complete domain coverage,
  and the passage from the scalar inequalities to the dimension-free theorem are part of the paper.

== 10 The scalar certificates <app:scalar>

This appendix proves the scalar assertions of Lemma 5. We first verify the two-point inequality in three regions.
  The normalized checks near the two endpoints also prove concavity of $G$,
  which is then used in the third region. We next verify the polynomial conditions that make the reflected profile
  reach the target and close the dimension induction. Finally,
  we prove the initial estimate on at most three coordinates.
  In the profile and base checks the noise parameter varies over a whole interval;
  endpoint bounds and interval enclosures, respectively, will control that variation.
  All decimal numbers in this appendix are exact terminating decimals.
  The seven choices of $\( L \, U \, V \, alpha \, Lambda \, mu \)$ and the bounds $\( r_0 \, r_1 \)$ are those of
  Table 1. A parameter choice is fixed throughout each calculation.
  At an endpoint shared by two ranges one uses an entire row, including its profile, consistently.
  The finite computations below involve only fixed polynomials and functions of at most three real variables;
  there is no dimension-dependent search. Their arithmetic recursions and all numerical input data are specified
  here. The accompanying files #raw("verification/interval_certificate.cpp") and
  #raw("verification/profile_certificate.py") implement these recursions.

=== 10.1 Reduction of the pair inequality <sc:pair-reduction>

Write $delta = \( 1 - rho \) \/ 2$, so $s^2 = 4 delta \( 1 - delta \)$.
  The table bounds $r_0^2 lt.eq delta lt.eq r_1^2$ follow by comparing

$ 4 r_0^2 \( 1 - r_0^2 \) lt.eq s_(upright("lo"))^2 \, wide 4 r_1^2 \( 1 - r_1^2 \) gt.eq s_(upright("hi"))^2 \,
  wide r_1^2 < 1 / 2 . $

These are rational comparisons, and $a mapsto 4 a \( 1 - a \)$ is increasing on $\[ 0 \, 1 \/ 2 \]$.
  We prove the pair assertion for $s > 0$ and $p_0 < p_1$; when $p_0 = p_1$, both its deficit and its shear are zero.

For a smooth function $F$, use divided differences

$ F \[ a \, b \] = frac(F \( b \) - F \( a \), b - a) \, wide F \[ a \, b \, c \] =
  frac(F \[ b \, c \] - F \[ a \, b \], c - a) \, $

with repeated arguments interpreted by continuous extension whenever the function is smooth there.
  Put $z = p_1 - p_0$, $p_t = p_0 + t z$, and

#[#set math.equation(numbering: n => "(10.1)")
 $ K = - frac(G \[ p_0 \, p_delta \, p_1 \] + G \[ p_0 \, p_(1 - delta) \, p_1 \], 8) \, wide W = 1 -
   frac(G \[ p_0 \, p_1 \], 4 L) . $ <sc:KW>]

The interpolation identity

$ G \( p_t \) - \( 1 - t \) G \( p_0 \) - t G \( p_1 \) = - t \( 1 - t \) z^2 G \[ p_0 \, p_t \, p_1 \] $

gives $D = s^2 z^2 K$. Moreover, the shear in Equation (3.5) is $z W$. Thus the strict inequality

#[#set math.equation(numbering: n => "(10.2)")
 $ Delta := K \( S + Lambda D \) - mu W^2 > 0 $ <sc:Delta>]

implies its required nonstrict inequality. We will also prove $D gt.eq 0$.

The following change of variable gives smooth normalized expressions near the endpoints,
  where derivatives of $G$ otherwise interfere with interval evaluation.
  For $0 lt.eq y < 1$, put $q = sqrt(1 - y^2)$, $h = 2 q y$, and $e = \( 1 + h lambda \( h \) \)^(- 1)$, and define

#[#set math.equation(numbering: n => "(10.3)")
 $ N \( y \) & = 4 q \( y + q lambda \( h \) \) e \,\
R \( y \) & = 4 q^2 \( q + y lambda \( h \) \) e \,\
M \( y \) & = 4 { L y + q \[ 2 L^2 - 1 - 2 U q^2 + h \( 2 L U - 2 V q^2 + 2 L V h \) \]
  #scale(x: 120%, y: 120%)[}] e . $ <sc:NRM>]

Direct substitution into Equation (3.2), or multiplication by $1 + h lambda \( h \)$, proves

#[#set math.equation(numbering: n => "(10.4)")
 $ G \( y^2 \) = y^2 N \( y \) = 4 L y^2 - y^3 M \( y \) \, wide G \( 1 - y^2 \) = y R \( y \) . $ <sc:representations>]

For every parameter row, $U < 0$, $V > 0$, and $lambda \( h \) gt.eq L + U gt.eq .488$ on $\[ 0 \, 1 \]$.
  Consequently all the denominators just used are positive, and $N \, R \,
  M$ are smooth at the arguments used below, which stay strictly below $1$.
  Also $N \( y \) \, R \( y \) > 0$ for $0 lt.eq y < 1$.

The three expressions separate different endpoint behaviors.
  $N$ removes the factor $p$ from $G \( p \)$ at $p = 0$, while $R$ removes the factor $sqrt(1 - p)$ at $p = 1$.
  The second representation of $G \( y^2 \)$ shows that the right derivative is $G' \( 0 \) = 4 L$:
  $M$ measures the remainder after subtracting this tangent.
  Consequently the shear $z - \( G \( p_1 \) - G \( p_0 \) \) \/ \( 4 L \)$ vanishes for the linear function
  $G \( p \) = 4 L p$. Using $M$ in the first endpoint region preserves this cancellation before any interval
  bounds are taken; using $R$ in the second removes the square-root factor there.

===== 10.1.1 Two endpoint regions. <two-endpoint-regions.>

Case 1 is

$ p_0 = v^2 u^2 \, quad p_1 = v^2 \, wide \( u \, v \) in \[ 0 \, 1 \] times \[ 0 \, .8 \] . $

Case 2 is

$ p_0 = 1 - v^2 \, quad p_1 = 1 - v^2 u^2 \, wide \( u \, v \) in \[ 0 \, 1 \] times \[ 0 \, .8 \] . $

In both cases introduce $j in \[ 0 \, r_1 \]$ and set

#[#set math.equation(numbering: n => "(10.5)")
 $ d = j \( 2 u + \( 1 - u \) j \) \, quad w = u + \( 1 - u \) j \, quad t = sqrt(1 - \( 1 - u \) d) \, quad
   delta = frac(d, 1 + u) \, $ <sc:uwt>]

retaining only parameters with $r_0^2 lt.eq delta lt.eq r_1^2$. Indeed

$ delta = j^2 + frac(2 u, 1 + u) j \( 1 - j \) \, quad partial_u delta = frac(2 j \( 1 - j \), \( 1 + u \)^2) \,
  quad partial_j delta = frac(2 \( u + \( 1 - u \) j \), 1 + u) . $

It increases in both variables and, for each fixed $u$, runs continuously from $0$ to at least $r_1^2$.
  Hence every required $delta$ is represented. The identities

$ w^2 = u^2 + delta \( 1 - u^2 \) \, wide t^2 = 1 - delta \( 1 - u^2 \) $

identify the two noisy mixture points (their order is reversed in Case 2). They also give $u lt.eq w \, t lt.eq 1$.

Let $m^i$, for $i = w \, t$, be the divided-difference tuple of the function $a mapsto
  M \( v a \)$ in Case 1 and $a mapsto R \( v a \)$ in Case 2 at the three nodes $\( u \, i \, 1 \)$.
  Its seven entries are indexed by $0 \, 1 \, 2 \, 01 \, 02 \, 12 \, 012$; for example,
  $m_02^i$ is the first divided difference on the endpoint nodes.
  The common endpoint entries are written $m_0 \, m_2 \, m_02$. Set

$ cal(E) \( a \, b \) = frac(a^2, a + b) quad \( 0 lt.eq a lt.eq b \) \, wide cal(E) \( 0 \, 0 \) = 0 . $

In Case 1 define

#[#set math.equation(numbering: n => "(10.6)")
 $ F & = (1 + frac(u^2, 1 + u)) m_2 + frac(u^3, 1 + u) m_02 \,\
S_0 & = alpha \( 4 L - v m_2 \) + \( 1 - alpha \) u^2 \( 4 L - v u m_0 \) \,\
P_i & =
  frac(\( 1 - cal(E) \( u \, i \) \/ \( 1 + u \) \) m_2 + \( i + cal(E) \( u \, i \) \) m_12^i + cal(E) \( u \,
  i \) u \( m_012^i - m_02 \/ \( 1 + u \) \), 1 + i) \, quad i = w \, t \,\
Z & = frac(P_w + P_t, 8) . $ <sc:case1-data>]

The finite sign check in Subsection 10.2 proves

#[#set math.equation(numbering: n => "(10.7)")
 $ Z S_0 + 4 Lambda d \( 1 - u \) \( 1 - w^2 \) v Z^2 - frac(mu v F^2, \( 4 L \)^2) > 0 . $ <sc:case1>]

Here the endpoint first difference of $b^(3 \/ 2) M \( v sqrt(b) \)$ on $\( u^2 \, 1 \)$ is $F$,
  and its second difference on $\( u^2 \, i^2 \, 1 \)$ is $P_i$.
  For clarity, the identities behind the latter statement are

$ \( b^(3 \/ 2) \) \[ u^2 \, i^2 \] & = i + cal(E) \( u \, i \) \,\
\( b^(3 \/ 2) \) \[ u^2 \, i^2 \, 1 \] & = frac(1 - cal(E) \( u \, i \) \/ \( 1 + u \), 1 + i) \,\
\( M \( v sqrt(b) \) \) \[ u^2 \, i^2 \, 1 \] & = frac(m_012^i - m_02 \/ \( 1 + u \), \( u + i \) \( 1 + i \)) . $

They follow by factoring differences of squares and applying the product rule for divided differences stated
  below. The final formula in Equation (10.6) has a continuous extension at the corner $u = i = 0$.
  Using Equation (10.4) gives, for a nondegenerate pair,

$ K = Z \/ v \, wide W = v F \/ \( 4 L \) \, wide S = v^2 S_0 \, wide s^2 \( 1 - u^2 \)^2 =
  4 d \( 1 - u \) \( 1 - w^2 \) . $

The left side of Equation (10.7) is therefore $Delta \/ v$.
  Since $v > 0$ for an actual pair, Equation (10.7) implies Equation (10.2) in Case 1.

In Case 2 define

#[#set math.equation(numbering: n => "(10.8)")
 $ F & = frac(m_2 + u m_02, 1 + u) \,\
Z & = 1 / 8 [frac(F - m_12^w - u m_012^w, 1 + w) + frac(u + w, u + t) frac(F - m_12^t - u m_012^t, 1 + t)] \,\
S_1 & = \( alpha - Lambda \/ 2 \) u m_0 + \( 1 - alpha - Lambda \/ 2 \)
  m_2 + \( Lambda \/ 2 \) \( w m_1^w + t m_1^t \) . $ <sc:case2-data>]

The second finite sign check is

#[#set math.equation(numbering: n => "(10.9)")
 $ Z S_1 - mu \( u + w \) (v + frac(F, 4 L))^2 > 0 . $ <sc:case2>]

Applying the same difference-of-squares identities to $sqrt(b) R \( v sqrt(b) \)$ now gives

$ K v^3 \( u + w \) = Z \, quad W = 1 + F \/ \( 4 L v \) \, quad S + Lambda D = v S_1 . $

Thus the left side of Equation (10.9) equals $v^2 \( u + w \) Delta$.
  For a required pair $v > 0$; and $u + w = 0$ would force $u = j = 0$ and $delta = 0$, excluded here.
  This proves Equation (10.2) in Case 2.

===== 10.1.2 Strict concavity, before the third region. <strict-concavity-before-the-third-region.>

The preceding sign checks also hold at repeated nodes, by their smooth normalized formulas.
  Fix $u = 1$ and any permitted $j = delta > 0$. Such a value lies in the certified interval $\[ 0 \, r_1 \]$,
  since $delta lt.eq r_1^2 < r_1$. Then $w = t = 1$. In Case 1, $S_0 =
  N \( v \) > 0$ and the $Z^2$ term of Equation (10.7) vanishes, so that inequality directly forces $Z > 0$.
  In Case 2, $S_1 = R \( v \) > 0$, and Equation (10.9) likewise directly forces $Z > 0$.
  No prior sign of $K$ is used in either inference. For $v > 0$ the identities above imply $K = -
  G'' \( p_0 \) \/ 8 > 0$ on, respectively, $\( 0 \, .64 \]$ and $\[ .36 \, 1 \)$.
  These intervals cover $\( 0 \, 1 \)$; hence $G$ is strictly concave there.
  Since $G$ is continuous on $\[ 0 \, 1 \]$, its interpolation deficit is strictly positive for any distinct
  endpoint pair and any interpolation weight in $\( 0 \, 1 \)$, including pairs containing $0$ or $1$.
  It follows that $D > 0$ and $K > 0$ for every actual pair under consideration.
  This proves the separate assertion $D gt.eq 0$ and supplies the sign of $K$ needed next.

===== 10.1.3 The remaining region. <the-remaining-region.>

Cases 1 and 2 cover $p_1 lt.eq .64$ and $p_0 gt.eq .36$. Any pair outside them is in Case 3:

$ p_0 = l^2 \, quad p_1 = 1 - u^2 \, wide \( l \, u \, r \) in \[ 0 \, .6 \]^2 times \[ r_0 \, r_1 \] \, wide
  delta = r^2 . $

Put

#[#set math.equation(numbering: n => "(10.10)")
 $ z & = 1 - l^2 - u^2 \, quad b = r^2 z \, quad l' = sqrt(l^2 + b) \, quad u' = sqrt(u^2 + b) \,\
P & = N \( l' \) + cal(E) \( l \, l' \) N \[ l \, l' \] \, wide Q = R \( u' \) + u R \[ u \, u' \] \,\
Z & = frac(Q + \( u + u' \) P, 8 \( 1 - r^2 \) z) \, wide W = 1 -
  frac(u R \( u \) - l^2 N \( l \), 4 L z) . $ <sc:case3-data>]

Here $z gt.eq .28$, so these denominators stay positive. The endpoint increments in $G$ are $b
  P$ and $\( u' - u \) Q$, respectively. As $b = \( u + u' \) \( u' - u \)$,
  this proves $Z = \( u + u' \) K$ and identifies $W$ with Equation (10.1). Set

#[#set math.equation(numbering: n => "(10.11)")
 $ Y_0 =  & Z #scale(x: 120%, y: 120%)[\[] \( alpha - Lambda \/ 2 \) u R \( u \) + \( Lambda \/ 2 \) u'
   R \( u' \) + \( 1 - alpha \) l^2 N \( l \) + \( Lambda \/ 2 \) b P #scale(x: 120%, y: 120%)[\]] -
   mu \( u + u' \) W^2 \,\
Y_1 =  & Z #scale(x: 120%, y: 120%)[\[] \( alpha \/ 2 \) R \( u \) + \( Lambda \/ 2 \) \( u' - u \) P
  #scale(x: 120%, y: 120%)[\]] - mu W^2 \,\
Y_2 =  & Z #scale(x: 120%, y: 120%)[\[] \( Lambda \/ 2 \) Q + \( Lambda \/ 2 \) \( u' - u \) P
  #scale(x: 120%, y: 120%)[\]] - mu W^2 . $ <sc:Y>]

The third finite check proves the disjunction

#[#set math.equation(numbering: n => "(10.12)")
 $ Y_0 > 0 quad upright("or") quad \( Y_1 > 0 med upright("and") med Y_2 > 0 \) . $ <sc:case3>]

The first alternative suffices because $Y_0 = \( u + u' \) Delta$.
  In the second alternative take the convex combination of the brackets in $Y_1 \,
  Y_2$ with weights $2 u \/ \( u + u' \)$ and $\( u' - u \) \/ \( u + u' \)$. It is

$ frac(alpha u R \( u \) + \( Lambda \/ 2 \) \( u' - u \) Q + \( Lambda \/ 2 \) b P, u + u') =
  frac(S + Lambda D - \( 1 - alpha \) l^2 N \( l \), u + u') lt.eq frac(S + Lambda D, u + u') . $

For $s > 0$ we have $u + u' > 0$, and the concavity already proved gives $Z = \( u + u' \) K > 0$.
  Therefore the second alternative also implies Equation (10.2).
  The three regions prove Equation (3.5), subject only to the following explicit finite sign checks.

=== 10.2 Interval arithmetic for the three pair regions <sc:interval>

===== 10.2.1 Enclosures and derivatives. <enclosures-and-derivatives.>

All intervals may have rational endpoints. The particular certificate rounds outwards after every operation to
  multiples of $Q_(*)^(- 1)$, where $Q_(*) = 10^12$. Store an interval as $\[ a \/ Q_(*) \, b \/ Q_(*) \]$ with
  integers $a lt.eq b$. Addition and subtraction use their ordinary endpoint rules.
  For multiplication, take the least and greatest of the four endpoint products and round their quotients by
  $Q_(*)$ down and up. For a positive interval its reciprocal endpoints are

$ Q_(*)^(- 1) ⌊Q_(*)^2 / b⌋ \, wide Q_(*)^(- 1) ⌈Q_(*)^2 / a⌉ . $

For a nonnegative interval the square-root endpoints are $Q_(*)^(- 1) floor.l sqrt(a Q_(*))
  floor.r$ and $Q_(*)^(- 1) ceil.l sqrt(b Q_(*)) ceil.r$; integer square comparison computes these exactly.
  Failed positivity or domain conditions never certify a box.
  A power with a nonnegative small integer exponent is evaluated by repeated interval multiplication,
  including for squares; this may overestimate but remains an enclosure.

An interval expression may be augmented by its three first derivatives. Use the sum and product rules, and

$ partial_i \( X^(- 1) \) = - X^(- 2) partial_i X \, wide partial_i sqrt(X) = frac(partial_i X, 2 sqrt(X)) . $

The latter derivative is used only when the lower bound for the root is strictly positive.
  In Case 3 the radicands defining $l' \, u'$ are known nonnegative on the whole box;
  direct #emph[value] evaluation may therefore replace a negative interval lower endpoint by zero.
  Derivative evaluation does not use this clipping and fails at an uncertified root singularity.

The function $cal(E) \( a \, b \)$ has a special rule on $0 lt.eq a lt.eq b$.
  Enclose $h = a \/ \( a + b \)$ by $\[ 0 \, 1 \/ 2 \]$, intersecting with direct interval division if $a +
  b$ has a positive lower bound. Its value is enclosed by $a h$, and its differential by

#[#set math.equation(numbering: n => "(10.13)")
 $ d cal(E) = h \( 2 - h \) thin d a - h^2 thin d b . $ <sc:E-derivative>]

At $\( 0 \, 0 \)$ the function is continuous and Lipschitz on this cone,
  so the same difference bounds hold by limits from its interior; differentiability at that point is not assumed.
  The required order relations $u lt.eq w \, t$ and $l lt.eq l'$ hold throughout each parameter box,
  not just on its $delta$-restricted subset. Thus these enclosures apply on the line segments used in the
  mean-value estimate below.

===== 10.2.2 Tuples without division by node distances. <tuples-without-division-by-node-distances.>

For three nodes let $a$ denote the tuple of values and divided differences of a function.
  Addition is componentwise. For $c = a b$, the product rule is

#[#set math.equation(numbering: n => "(10.14)")
 $ c_p = a_p b_p \, quad c_(p q) = a_p b_(p q) + a_(p q) b_q med \( p < q \) \, quad c_012 = a_0 b_012 +
   a_01 b_12 + a_012 b_2 . $ <sc:tuple-product>]

For $a = c^(- 1)$ use

#[#set math.equation(numbering: n => "(10.15)")
 $ a_p = 1 \/ c_p \, quad a_(p q) = - c_(p q) a_p a_q \, quad a_012 = - a_0 \( c_012 a_2 + c_01 a_12 \) \;
   $ <sc:tuple-reciprocal>]

for $a = sqrt(c)$ use

#[#set math.equation(numbering: n => "(10.16)")
 $ a_p = sqrt(c_p) \, quad a_(p q) = frac(c_(p q), a_p + a_q) \, quad a_012 =
   frac(c_012 - a_01 a_12, a_0 + a_2) . $ <sc:tuple-root>]

The last two formulas solve $a c = 1$ and $a^2 = c$ using Equation (10.14).
  They remain valid at repeated nodes by continuity and use no inverse node distance.
  All entries can themselves be intervals, or intervals augmented by the three derivatives.
  A constant tuple has that constant in its three value entries and zero in the other entries.
  Write $X \( a \, b \, c \, g \)$ for the tuple with value entries $\( a \, b \, c \)$,
  all three first differences $g$, and second difference zero.

To specify the evaluation completely, the tuple-valued function $"table" \( x \, k \)$ is obtained by the
  following straight-line recipe; $"sq"$ means multiplication of an expression by itself.

#raw(block: true, lang: "", "q2 = 1-x*x; q = sqrt(q2); h = 2*(q*x)\na = L+h*(U+V*h); e = inv(1+h*a)\nif k==1:\n  return 4*(L*x+q*((2*sq(L)-1)-2*U*q2\n                  +h*((2*L*U)-2*V*q2+(2*L*V)*h)))*e\nif k==2: return 4*(q2*(q+x*a))*e\nreturn 4*(q*(x+q*a))*e")

These are exactly $M \, R \, N$ in that order. The expressions to test are specified below,
  retaining the evaluation order of the certificate. Tuple subscripts are strings of node indices,
  so $12$ and $012$ denote first and second divided differences.
  Products and quotients on one line associate from left to right.
  The symbols #raw("alpha"), #raw("Lambda"), #raw("mu"), and #raw("E") stand for $alpha \, Lambda \, mu \,
  cal(E)$, respectively.

#raw(block: true, lang: "", "term(m,u,i):\n  e = E(u,i); o = inv(1+u)\n  return ((1-o*e)*m[2]+(i+e)*m[12]\n                         +e*u*(m[012]-o*m[02]))/(1+i)\n")

#raw(block: true, lang: "", "expr(u,v,j,k):\n  d = j*(2*u+(1-u)*j); w = u+(1-u)*j\n  t = sqrt(1-(1-u)*d)\n  m = table(X(v*u,v*w,v,v),k)\n  n = table(X(v*u,v*t,v,v),k)\n  if k==1:\n    F = (1+u*u/(1+u))*m[2]+u*u*u*m[02]/(1+u)\n    Z = .125*(term(m,u,w)+term(n,u,t))\n    H0 = alpha*(4*L-v*m[2])\n                            +(1-alpha)*u*u*(4*L-v*u*m[0])\n    di = d*(1-u); wi = 1-sq(w)\n    return [Z*H0+(4*Lambda)*di*wi*v*sq(Z)\n                                      -mu*v*sq(F)/sq(4*L)]\n  half = .5*Lambda\n  F = (m[2]+u*m[02])/(1+u)\n  Z = .125*((F-m[12]-u*m[012])/(1+w)\n                 +(u+w)/(u+t)*(F-n[12]-u*n[012])/(1+t))\n  H0 = (alpha-half)*u*m[0]+(1-alpha-half)*m[2]\n                                       +half*(w*m[1]+t*n[1])\n  return [Z*H0-mu*(u+w)*sq(v+F/(4*L))]\n")

#raw(block: true, lang: "", "expr3(l,u,r):\n  z = 1-sq(l)-sq(u); b = sq(r)*z\n  lp = nroot(sq(l)+b); up = nroot(sq(u)+b)\n  n = table(X(l,l,lp,1),3); a = table(X(u,u,up,1),2)\n  P = n[2]+E(l,lp)*n[02]; Q = a[2]+u*a[02]\n  Z = (Q+(u+up)*P)/(8*(1-sq(r))*z)\n  W2 = sq(1-(u*a[0]-l*l*n[0])/(4*L*z))\n  half = .5*Lambda\n  Y0 = Z*((alpha-half)*u*a[0]+half*up*a[2]\n                    +(1-alpha)*l*l*n[0]+half*b*P)\n                                            -mu*(u+up)*W2\n  rest = half*(up-u)*P\n  Y1 = Z*((.5*alpha)*a[0]+rest)-mu*W2\n  Y2 = Z*(half*Q+rest)-mu*W2\n  return [Y0,Y1,Y2]")

Here #raw("nroot") is the square-root operation with the value-only clipping already specified;
  on derivative tuples it is the ordinary strict-domain root.
  These recipes are the normalized expressions in Equations (10.7), (10.9), and (10.11).

===== 10.2.3 The box test. <the-box-test.>

An initial box has coordinates $\( u \, v \, j \)$ in Cases 1 and 2 and $\( l \, u \, r \)$ in Case 3,
  with the ranges specified above. A subdivision bisects all three coordinates, giving eight children.
  First exclude a box in Cases 1 and 2 if the interval between the low-low and high-high corner values of
  $delta \( u \, j \)$ misses $\[ r_0^2 \, r_1^2 \]$. The monotonicity in Equation (10.5) proves this exclusion
  sound, with the corner arithmetic rounded outwards.

For every remaining scalar expression $F$ one may certify $F >
  0$ either by a positive lower endpoint of its interval value on the whole box,
  or by the following derivative test. Let $c_i \, h_i$ be the exact center and half-width of its coordinate
  intervals, and normalize the coordinates by $x_i = c_i + h_i xi_i$ with $\| xi_i \| lt.eq 1$.
  Initialize the derivative of coordinate $x_i$ with respect to $xi_i$ to an outward enclosure of $h_i$,
  and its other derivatives to zero. If $I_c$ encloses $F \( c \)$ and $J_i$ encloses $partial F \/ partial
  xi_i$ on the full box, the sufficient test is

#[#set math.equation(numbering: n => "(10.17)")
 $ inf I_c > sum_(i = 1)^3 max \( \| inf J_i \| \, \| sup J_i \| \) . $ <sc:center-test>]

The mean-value theorem, with the limiting argument for Equation (10.13) when needed, proves the test.
  In Case 3 different components can use different tests: the box is good if the first component is positive,
  or if both the second and third are positive. It is unnecessary for the same branch of the disjunction to hold
  on different boxes.

More formally, with $d$ the remaining permitted depth, the entire finite decision procedure is

#raw(block: true, lang: "", "verify(box,d):\n  if the box is excluded by the delta restriction: return true\n  attempt interval values and, if needed, center/derivative bounds\n  if the Case 1 or 2 expression is certified positive: return true\n  if Case 3 has component 0 positive, or components 1 and 2 positive:\n      return true\n  # An invalid arithmetic operation never certifies a box.\n  if d==0: return false\n  return AND(verify(child,d-1) for the eight children)")

In the supplied implementation any invalid attempt immediately proceeds to subdivision;
  it does not turn a failed bound into a certificate. A sign-certified leaf proves the required inequality on its
  entire box; an excluded leaf has empty intersection with the required delta range.
  Induction up the finite subdivision tree therefore proves the inequalities on the initial region subject to that
  restriction.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 8,
  align: (left, right, right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Parameter group
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[6
]),
  table.cell(rowspan: 1, colspan: 1)[Case 1
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
],
  table.cell(rowspan: 1, colspan: 1)[Case 2
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[8
],
  table.cell(rowspan: 1, colspan: 1)[Case 3
], table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[7
],
)
]],
  caption: [Table 6: Sufficient maximum subdivision depths for the pair certificates; the initial box has depth zero. ],
)

Evaluation of the recursions with $Q_(*) = 10^12$ gives #raw("true") for all 21 initial boxes at the depths in
  Table 4. This is a finite list of integer comparisons, as specified above.
  In particular it proves the strict sign assertions in Equations (10.7), (10.9), and (10.12),
  including the normalized boundary values used for the concavity argument.
  The recorded execution of the accompanying C++ certificate has no failed terminal leaf.

===== 10.2.4 Arithmetic range and trust. <arithmetic-range-and-trust.>

The mathematical procedure can use arbitrary-precision integers.
  The supplied C++ implementation instead guards each stored scaled endpoint by $\| a \| \, \| b \| lt.eq 10^18$.
  Endpoint sums and differences before the guard are at most $2 dot.op 10^18$ in magnitude,
  and the sum of three derivative magnitudes in Equation (10.17) is at most $3 dot.op 10^18$;
  these fit signed 64-bit integers. Each endpoint product is at most $10^36$, below the signed 128-bit maximum;
  the reciprocal numerator is $10^24$, and root radicands are at most $10^30$.
  The integer root search uses upper bound $10^15 + 1$, whose square also fits signed 128 bits.
  At depths at most $14$, dyadic grid indices are below $2^14$;
  the pre-conversion grid products in the source are below $2 dot.op 10^16$.
  Its unguarded integer constructor receives only the displayed small constants.
  Thus intermediate operations as well as stored values fit their integer types.
  An overflow guard failure causes subdivision, not acceptance.
  The computational verification uses ordinary exact integer arithmetic and reviewed source execution;
  it does not require floating-point rounding assumptions or claim proof-assistant verification.

=== 10.3 The seventeen polynomial profiles <sc:profiles>

It remains to choose a profile that satisfies the reflected comparison and the induction closure condition,
  Lemma 5(2)–(3). We use seventeen polynomials of the form

#[#set math.equation(numbering: n => "(10.18)")
 $ B \( m \) = \( 1 - m^2 \) P \( m \) \, wide P \( m \) = 1 +
   10^(- 8) sum_(j gt.eq 1) c_j #scale(x: 120%, y: 120%)[\(] T_j \( m \) -
   T_j \( 0 \) #scale(x: 120%, y: 120%)[\)] \, $ <sc:profile-def>]

where $T_0 = 1$, $T_1 = m$, and $T_(j + 1) = 2 m T_j - T_(j - 1)$.
  The form in Equation (10.18) gives $B \( 0 \) = 1$ and $B \( plus.minus 1 \) = 0$ exactly.
  The coefficient data below assign each polynomial to a closed interval $\[ s_0 \, s_1 \]$ contained in one
  parameter group. Before giving those data, we reduce the remaining properties to five sign checks.

===== 10.3.1 The required signs and their implications. <the-required-signs-and-their-implications.>

Use the polynomial quotients

#[#set math.equation(numbering: n => "(10.19)")
 $ E_B \( m \) & = frac(\( B \( m \) + B \( - m \) \) \/ 2 - 1, m^2) \,\
C \( m \, x \) & = frac(B \( m + x \) - B \( m - x \), 2 x) \, wide A \( m \, x \) =
  frac(2 B \( m \) - B \( m + x \) - B \( m - x \), 2 x^2) \,\
J_s & = 1 - frac(s, 2 L) C \, wide cal(V)_s = mu J_s^2 - A #scale(x: 120%, y: 120%)[\[]
  B \( m \) + \( 2 alpha - 1 \) x C + \( Lambda - 1 \) x^2 A #scale(x: 120%, y: 120%)[\]] . $ <sc:quotients>]

They are polynomial identities, including at $m = 0$ or $x = 0$.
  For $B \( m \) = sum b_k m^k$, explicit coefficient recipes are

$ C & = sum_k sum_(1 lt.eq j lt.eq k\
j med upright("odd")) binom(k, j) b_k m^(k - j) x^(j - 1) \,\
A & = - sum_k sum_(2 lt.eq j lt.eq k\
j med upright("even")) binom(k, j) b_k m^(k - j) x^(j - 2) \, wide E_B = sum_(k gt.eq 2\
k med upright("even")) b_k m^(k - 2) . $

There is thus no evaluation of a quotient by a vanishing variable.

For each of the seventeen profiles on its assigned interval, we verify

#[#set math.equation(numbering: n => "(10.20)")
 $ P \( m \) & > 0 &  & \( - 1 lt.eq m lt.eq 1 \) \,\
1 + s_1 E_B \( m \) \( 1 + H \( m \) \) & > 0 &  & \( 0 lt.eq m lt.eq 1 \) \,\
J_(s_1) \, med cal(V)_(s_0) \, med
  cal(V)_(s_1) & > 0 &  & \( - 1 lt.eq m lt.eq 1 \, med 0 lt.eq x lt.eq b \( m \) \) . $ <sc:profile-signs>]

Here the piecewise affine upper boundary $b \( m \)$ is completely specified by the successive knot pairs,
  multiplied by $16$,

#[#set math.equation(numbering: n => "(10.21)")
 $ \( - 16 \, 0 \) \, med \( - 14 \, 2 \) \, med \( - 6 \, 6 \) \, med \( 6 \, 6 \) \, med \( 14 \, 2 \) \,
   med \( 16 \, 0 \) . $ <sc:knots>]

In particular $b \( m \) lt.eq 1 - \| m \|$, so all arguments $m plus.minus x$ are in $\[ - 1 \, 1 \]$.

These sign assertions suffice for the reflection and profile parts of the scalar lemma, as follows.
  First $B = \( 1 - m^2 \) P gt.eq 0$. The polynomial $E_B$ is even, and $1 - H \( m \) =
  m^2 \/ \( 1 + H \( m \) \)$, whence

#[#set math.equation(numbering: n => "(10.22)")
 $ s / 2 #scale(x: 120%, y: 120%)[\(] B \( m \) + B \( - m \)
   #scale(x: 120%, y: 120%)[\)] - \( H \( m \) - 1 + s \) = m^2 (s E_B \( m \) + frac(1, 1 + H \( m \))) .
   $ <sc:reflection-difference>]

For $E_B < 0$ the certified bound at $s_1$ implies the one at any $0 lt.eq s lt.eq s_1$; for $E_B gt.eq
  0$ it is immediate. Thus Equation (3.6) follows, including $m = 0$, where both sides equal $s$, and $m =
  plus.minus 1$.

For fixed $\( m \, x \)$, $J_s$ is affine in $s$, $J_0 = 1$, and the certificate gives $J_(s_1) > 0$.
  Therefore $J_s > 0$ on $\[ 0 \, s_1 \]$, and its square is monotone there:
  decreasing when $C > 0$, increasing when $C < 0$, constant when $C = 0$. Consequently

$ J_s^2 gt.eq min \( J_(s_0)^2 \, J_(s_1)^2 \) wide \( s_0 lt.eq s lt.eq s_1 \) . $

The expression subtracted from $mu J_s^2$ in $cal(V)_s$ is independent of $s$ within the row.
  The two endpoint certificates therefore imply $cal(V)_s > 0$ throughout the row.
  This proves Equation (3.7) for either sign of $A$ or $C$.
  It is the positivity of the affine factor that justifies this step;
  endpoint positivity of a general quadratic alone would not suffice.

=== 10.4 Profile data and exact sign verification <sc:bernstein>

===== 10.4.1 Coefficient data. <coefficient-data.>

Each line below lists $1000 s_1$ followed by $\( c_1 \, c_2 \, dots.h \)$; unlisted coefficients are zero.
  Its interval is $\[ s_0 \, s_1 \]$, where $s_0$ is the previous endpoint, starting at zero.
  The group is the first row of Table 1 whose upper endpoint is at least $s_1$;
  no profile interval straddles a group boundary.

#strong[5:] 26797227, 21421001, 5128970, 9234452, 692060, 4904060, -868991, 3430822, -1620202, 2642536, -1572003,
  1611382, -790463, 573913, -196263, 125941, -28650, 17140.

#strong[17:] 26545421, 20782313, 4702871, 8733755, 262302, 4632398, -1223407, 3219225, -1751136,
  2367765, -1499679, 1323103, -650254, 364146, -98062, 32125.

#strong[39:] 23422612, 23811053, 2720392, 9481334, 342747, 3521407, 293182, 1243280, 94220, 628296, -211618,
  367918, -115140, 71341.

#strong[70:] 28627418, 18132350, 6560313, 4688850, 3090858, 280132, 2014606, -721794, 1092862, -413975, 251954, -30987.

#strong[108:] 25845226, 21339334, 2692615, 7536216, -587180, 2879744, -642549, 859994, -135519, 99765.

#strong[160:] 28111431, 22222528, 3686628, 6969749, 260698, 2311757, -230942, 626183, -39197, 65219.

#strong[220:] 31980620, 22310973, 3943312, 6252289, 221019, 1801879, -204196, 345834.

#strong[300:] 37050025, 22730221, 6023971, 4990611, 1410047, 1047683, 133030, 195650.

#strong[400:] 46891988, 25975928, 8279226, 5707508, 1896038, 1189721, 225195, 190389.

#strong[490:] 57774207, 30017282, 10752796, 6552311, 2404507, 1338857, 310628, 193643.

#strong[570:] 67261317, 34557385, 13515609, 7744945, 3024441, 1590294, 428436, 214704.

#strong[630:] 76105766, 38746702, 15974003, 8801748, 3567377, 1794423, 517893, 232715.

#strong[700:] 92621845, 50731247, 23924150, 14690765, 6918336, 4309886, 1672440, 1096916, 239750, 209175.

#strong[750:] 100973193, 55145076, 26634158, 15924290, 7601086, 4546032, 1797080, 1099352, 246042, 192495.

#strong[800:] 114390772, 63949520, 33959789, 20265973, 11129205, 6354835, 3302519, 1693517, 778655, 305292, 118236.

#strong[827:] 126357200, 73807375, 40646383, 25693312, 14417512, 9123323, 4734690, 2955541, 1274070, 786030,
  225052, 144665.

#strong[840:] 140455073, 85610577, 50361189, 33435466, 20391097, 13705759, 8022488, 5381807, 2815510, 1892888,
  793925, 548406, 137909, 116217.

We now verify the five sign conditions in Equation (10.20) for these data.

===== 10.4.2 Bernstein bounds. <bernstein-bounds.>

For a polynomial in coordinates $\( u \, v \) in \[ 0 \, 1 \]^2$, of degree at most $N$ in $u$ and $K$ in $v$,
  write $R \( u \, v \) = sum r_(i j) u^i v^j$. The formula of Appendix 9 gives its Bernstein coefficients of
  orders $\( N \, K \)$ as

#[#set math.equation(numbering: n => "(10.23)")
 $ beta_(n k) = sum_(i = 0)^n sum_(j = 0)^k r_(i j) binom(n, i) / binom(N, i) binom(k, j) / binom(K, j) \, wide
   0 lt.eq n lt.eq N \, quad 0 lt.eq k lt.eq K . $ <sc:bernstein-transform>]

The Bernstein enclosure proved in Appendix 9 puts the polynomial between the least and greatest coefficients on
  the full box. For a univariate polynomial set $K = 0$ and omit the second coordinate.

For $P$ start with $\[ - 1 \, 1 \]$; for $E_B$ use $\[ 0 \, 1 \]$.
  For the other three polynomials use each consecutive pair of knots $\( a \, c \) \, \( a + h \, c + d \)$ from
  Equation (10.21), in their actual rational units, and substitute

$ m = a + h u \, wide x = v \( c + d u \) \, wide \( u \, v \) in \[ 0 \, 1 \]^2 . $

For each polynomial $S$ to be checked, sufficient orders are $N = deg_(upright("tot")) S$ and $K =
  deg_x S$ before substitution, because $m^i x^j$ has $u$-degree at most $i + j$ and $v$-degree $j$.
  These rectangles cover the entire closed domain. Subdivision bisects both coordinates.
  Equivalently, on a subdivided rectangle $m in \[ a \, a + h \]$, $t in \[ c \, c + d \]$, substitute

$ m = a + h u \, quad t = c + d v \, quad x = t #scale(x: 120%, y: 120%)[\(]
  b \( a \) + \( b \( a + h \) - b \( a \) \) u #scale(x: 120%, y: 120%)[\)] . $

All these substitutions and Equation (10.23) are rational.

For the columns $P \, J \, cal(V)$ every final coefficient must be strictly positive.
  For the $E_B$ column, on each interval with lower endpoint $a$, each negative coefficient $e$ must instead satisfy

#[#set math.equation(numbering: n => "(10.24)")
 $ 1 + s_1 e > 0 \, wide \( 1 + s_1 e \)^2 > \( s_1 e \)^2 \( 1 - a^2 \) . $ <sc:E-test>]

These two comparisons prove $1 + s_1 e \( 1 + H \( a \) \) > 0$ with the sign checked before squaring.
  Since $H \( m \) lt.eq H \( a \)$ on that interval and the polynomial is bounded below by its least Bernstein
  coefficient, this proves the second line of Equation (10.20) everywhere on the interval.
  If its least coefficient is nonnegative there is nothing to check.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 7,
  align: (right, right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 5, align: center)[Bisection depths
], table.cell(rowspan: 1, colspan: 1)[Base lower bound
]),
  table.cell(rowspan: 1, colspan: 1)[2-6(l)7-7 $1000 s_1$
], table.cell(rowspan: 1, colspan: 1)[$P$
], table.cell(rowspan: 1, colspan: 1)[$E_B$
], table.cell(rowspan: 1, colspan: 1)[$J_(s_1)$
], table.cell(rowspan: 1, colspan: 1)[$cal(V)_(s_0)$
], table.cell(rowspan: 1, colspan: 1)[$cal(V)_(s_1)$
], table.cell(rowspan: 1, colspan: 1)[],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[7
],
  table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[7
],
  table.cell(rowspan: 1, colspan: 1)[39
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[8
],
  table.cell(rowspan: 1, colspan: 1)[70
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[10
],
  table.cell(rowspan: 1, colspan: 1)[108
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[7
],
  table.cell(rowspan: 1, colspan: 1)[160
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[14
],
  table.cell(rowspan: 1, colspan: 1)[220
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[78
],
  table.cell(rowspan: 1, colspan: 1)[300
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[69
],
  table.cell(rowspan: 1, colspan: 1)[400
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[146
],
  table.cell(rowspan: 1, colspan: 1)[490
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[224
],
  table.cell(rowspan: 1, colspan: 1)[570
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[233
],
  table.cell(rowspan: 1, colspan: 1)[630
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[255
],
  table.cell(rowspan: 1, colspan: 1)[700
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[236
],
  table.cell(rowspan: 1, colspan: 1)[750
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[222
],
  table.cell(rowspan: 1, colspan: 1)[800
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[191
],
  table.cell(rowspan: 1, colspan: 1)[827
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[177
],
  table.cell(rowspan: 1, colspan: 1)[840
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[176
],
)
]],
  caption: [Table 7: Sufficient bisection depths for the five profile sign checks, and lower bounds for the scaled base-case difference defined in Equation (10.29). ],
)

For each row in Table 5, perform the five Bernstein checks with its listed depths and coefficients.
  The rational comparisons in Equations (10.23)–(10.24) all hold.
  One can stop early on boxes whose signs are already certified:
  subsequent Bernstein coefficients are convex combinations of the previous ones.
  This supplies a finite arithmetic verification of Equation (10.20).
  For completeness, the following integer scalings specify exactly how the accompanying Python certificate
  performs these rational calculations.

===== 10.4.3 Exact integer scaling and subdivision. <exact-integer-scaling-and-subdivision.>

Put $D_(*) = 10^8$, and write

$ ell = 1000 L \, quad a_(*) = 1000 alpha \, quad lambda_(*) = 1000 Lambda \, quad nu = 1000 mu \, quad S_i =
  1000 s_i . $

The Chebyshev recurrence first forms the integer polynomials $hat(P) = D_(*) P$, $hat(B) = D_(*) B$.
  Applying the coefficient recipes following Equation (10.19) to $hat(B)$ gives $hat(E) = D_(*) E_B$, $hat(A) =
  D_(*) A$, $hat(C) = D_(*) C$. The five polynomials supplied to the coefficient checker are

$ & hat(P) \, quad hat(E) \, quad hat(J) \( S_1 \) \, quad hat(V) \( S_0 \) \, quad hat(V) \( S_1 \) \,\
hat(J) \( S \) & = 2 ell D_(*) - S hat(C) \,\
hat(V) \( S \) & = nu hat(J) \( S \)^2 - \( 2 ell \)^2 hat(A) #scale(x: 120%, y: 120%)[\[] 1000
  hat(B) + \( 2 a_(*) - 1000 \) x hat(C) + \( lambda_(*) - 1000 \) x^2 hat(A) #scale(x: 120%, y: 120%)[\]] . $

Thus their positive scale factors relative to the mathematical polynomials $P \, E_B \, J_s \, cal(V)_s \,
  cal(V)_s$ are, respectively,

#[#set math.equation(numbering: n => "(10.25)")
 $ D_(*) \, quad D_(*) \, quad 2 ell D_(*) \, quad 1000 \( 2 ell \)^2 D_(*)^2 \, quad
   1000 \( 2 ell \)^2 D_(*)^2 . $ <sc:scalings>]

For an integer polynomial $p \( m \, x \) = sum p_(i j) m^i x^j$ and an initial map

$ m = \( a + b u \) \/ d_(*) \, wide x = v \( c + d u \) \/ d_(*) \, $

multiply the power coefficients after substitution by $d_(*)^N$. Explicitly add

$ p_(i j) d_(*)^(N - i - j) binom(i, k) a^(i - k) b^k binom(j, l) c^(j - l) d^l $

to the coefficient of $u^(k + l) v^j$, for $0 lt.eq k lt.eq i$, $0 lt.eq l lt.eq j$. Transform the first axis by

$ T_(k i)^(\( N \)) = binom(k, i) frac(N !, binom(N, i)) $

and the second by $T^(\( K \))$. The divisions are exact, since $N ! \/ binom(N, i) = i ! \( N - i \) !$.
  The resulting integer matrix is $d_(*)^N N ! K !$ times its Bernstein coefficient array, a positive scale.

For an axis of order $n$, its left-half subdivision matrix has entries

$ L_(i k)^(\( n \)) = 2^(n - i) binom(i, k) wide \( 0 lt.eq i \, k lt.eq n \) \, $

with $binom(i, k) = 0$ for $k > i$. This is $2^n$ times the usual de Casteljau half-subdivision.
  Reversing both row and column indices gives the right-half matrix.
  Apply both matrices on both axes at each subdivision, retaining their positive common factors.
  Order-zero axes have only one child. Positivity tests are therefore tests of integers.

For the $E_B$ column with depth $d$, set $q_(*) = 2^d$ and, on $\[ i \/ q_(*) \, \( i + 1 \) \/ q_(*) \]$,
  let $c$ be the least integer coefficient produced by the preceding transformation with $d_(*) = q_(*)$.
  Its scale relative to $E_B$ is $D_(*) q_(*)^N N !$. Define

$ h_(*) = - S_1 c \, wide C_(*) = 1000 D_(*) q_(*)^N N ! . $

If $h_(*) lt.eq 0$, the test passes immediately. Otherwise the exact tests are

#[#set math.equation(numbering: n => "(10.26)")
 $ C_(*) > h_(*) \, wide \( \( C_(*) - h_(*) \) q_(*) \)^2 > h_(*)^2 \( q_(*)^2 - i^2 \) . $ <sc:E-integer>]

They are precisely Equation (10.24) for the minimum coefficient.
  This accounts for every factor of $1000$, $2$, and $D_(*)$ in the certificate.
  Python uses unbounded integers and exact rational evaluation here,
  so integer overflow is not an additional hypothesis.

=== 10.5 The three-coordinate base case <sc:base>

We finish by proving Lemma 5(4). An increasing function on fewer than three coordinates can be viewed as a
  function on three. Constants satisfy Equation (3.8) because $G \( 0 \) = G \( 1 \) = B \( plus.minus 1 \) = 0$.
  Consider a nonconstant function whose positive set has size at most four.
  Up to coordinate permutations, a positive set of size one is the top vertex;
  one of size two adds one of its three neighbors; and one of size three adds two of those neighbors.
  A vertex with only one positive coordinate would force its entire upper subcube of size four to be positive.
  Hence a positive set of size four either is that subcube, giving a dictator,
  or consists of the three vertices with two positive coordinates and the top vertex, giving majority.
  Larger positive sets are obtained from these by the duality $f^(*) \( x \) = - f \( - x \)$.

For a dictator, $T_rho f = rho x_i$ and Equation (3.3) gives equality in Equation (3.8), since $B \( 0 \) = 1$.
  For majority,

$ f \( x \) = frac(x_1 + x_2 + x_3 - x_1 x_2 x_3, 2) . $

Again the asymmetric term averages to zero by input reversal.
  Evaluating the two absolute-value classes of $T_rho f$ gives

$ frac(bb(E) H \( T_rho f \), s) = frac(s sqrt(3 + s^2) + 3 sqrt(8 - 5 s^2 + s^4), 8) gt.eq 1 . $

Indeed, $s sqrt(3 + s^2) gt.eq 2 s^2$ for $0 lt.eq s lt.eq 1$, while, with $u = s^2$,

$ \( 8 - 5 u + u^2 \) - (2 + 3 / 4 \( 1 - u \))^2 = 7 / 16 \( 1 - u \)^2 gt.eq 0 . $

The resulting lower bound for the numerator is $33 \/ 4 - s^2 \/ 4 gt.eq 8$.
  Thus only the three unbalanced positive sets ${ 7 }$, ${ 7 \, 6 }$, and ${ 7 \, 6 \,
  5 }$ in binary coding (identify $- 1$ with $0$ and $+ 1$ with $1$,
  then read the three bits as a binary integer), and their duals, require the scalar base certificates below.
  In particular the base assertion treats both orientations of $B$; no symmetry of $B$ is assumed.

For $D in { { 7 } \, { 7 \, 6 } \, { 7 \, 6 \, 5 } }$ put $m_D = \| D \| \/ 4 - 1$ and $sigma_i =
  2 upright(bold(1))_D \( i \) - 1$, where $i in { 0 \, dots.h \, 7 }$. If $d_(i j)$ denotes Hamming distance, define

#[#set math.equation(numbering: n => "(10.27)")
 $ delta & = frac(s^2, 2 \( 1 + sqrt(1 - s^2) \)) \, wide I_i = 1 /
   4 sum_(upright(bold(1))_D \( i \) eq.not upright(bold(1))_D \( j \))
   delta^(d_(i j) - 1) \( 1 - delta \)^(2 - d_(i j)) \,\
e_i & = s^2 I_i \, wide h_i = 2 sqrt(I_i \( 1 - e_i \)) \,\
q_i & =
  frac(sigma_i \( 1 - 2 e_i \), 1 + s h_i #scale(x: 120%, y: 120%)[\(] L + s h_i \( U + s h_i V \)
  #scale(x: 120%, y: 120%)[\)]) . $ <sc:base-formulas>]

A noise transition from $i$ to an opposite point $j$ has probability
  $delta^(d_(i j)) \( 1 - delta \)^(3 - d_(i j))$. Since $s^2 = 4 delta \( 1 - delta \)$,
  $e_i$ is exactly the boundary-crossing probability. Thus $d_i := T_rho f \( i \) = sigma_i \( 1 - 2 e_i \)$,
  $H \( d_i \) \/ s = h_i$, and $d_i \/ \( 1 + H \( d_i \) lambda \( H \( d_i \) \) \) = q_i$.
  It follows that the two quantities to bound below are exactly

#[#set math.equation(numbering: n => "(10.28)")
 $ 1 / 8 sum_(i = 0)^7 h_i \( 1 + eta q_i \) - B \( eta m_D \) \, wide eta in { - 1 \, 1 } . $ <sc:base-normalized>]

For the dual, global input reversal merely reindexes the average and negates its noised output,
  which explains the sign $eta$ in both places.

There is no division by $s$ in Equation (10.27). Opposite points are distinct, so $1 lt.eq d_(i j) lt.eq 3$;
  the sole possible negative power is $\( 1 - delta \)^(- 1)$, nonsingular over all the row intervals.
  These formulas have continuous extensions to $s = 0$, even if $I_i = 0$.
  In that limit $I_i$ is one quarter of the number of opposite neighbors, $e_i = 0$,
  $h_i$ is the square root of that number, and $q_i = sigma_i$.
  The two limits of $bb(E) G \/ s$ are, for the three listed sets in order,

$ \( sqrt(3) \/ 4 \, med 3 \/ 4 \) \, quad \( sqrt(2) \/ 2 \, med 1 \) \,
  quad \( \( 1 + 2 sqrt(2) \) \/ 4 \, med \( 3 + sqrt(2) \) \/ 4 \) . $

Accordingly the first closed row interval is a valid domain for the normalized certificate,
  although Equation (3.8) itself only needs $s > 0$.

For each profile row divide $\[ s_0 \, s_1 \]$ into exactly $128$ equal subintervals.
  On each, evaluate Equation (10.27) in the displayed order with the interval arithmetic at scale $Q_(*) =
  10^12$ from Subsection 10.2, and form the average in Equation (10.28).
  All signed profile evaluations $B \( eta m_D \)$ are exact rational numbers.
  The base column of Table 5 is a lower bound, simultaneously for all $128$ intervals, all three sets,
  and both signs, for

#[#set math.equation(numbering: n => "(10.29)")
 $ ⌊10^4 (inf [1 / 8 sum_(i = 0)^7 h_i \( 1 + eta q_i \)] - B \( eta m_D \))⌋ . $ <sc:base-column>]

Equivalently, compare $10^4 \( upright("interval lower bound") - B \( eta m_D \) \)$ directly with the listed
  integer. No approximate floor operation is needed. The $128$ outward-enclosed intervals cover the entire row,
  including both endpoints. Every entry in the base column is positive,
  which proves Equation (3.8) for the unbalanced cases and hence for all increasing functions on at most three
  coordinates.

Together the pair-region certificates, the profile signs, and the base certificate prove all assertions of Lemma 5.

#heading(level: 1)[References]
#bibitem([1])[Venkat Anantharam, Andrej Bogdanov, Amit Chakrabarti, T.~S.~Jayram, and Chandra Nair.
  A conjecture regarding optimality of the dictator function under Hellinger distance.
  Manuscript presented at the Information Theory and Applications Workshop (ITA), February 2017.
  #link("https://chandra.ie.cuhk.edu.hk/pub/papers/HC/hel-conj.pdf").]
#bibitem([2])[William Beckner. Inequalities in Fourier analysis.
  #emph[Annals of Mathematics], 102(1):159--182, 1975. #link("https://doi.org/10.2307/1970980").]
#bibitem([3])[S.~G.~Bobkov. An isoperimetric inequality on the discrete cube,
  and an elementary proof of the isoperimetric inequality in Gauss space.
  #emph[Annals of Probability], 25(1):206--214, 1997. #link("https://doi.org/10.1214/aop/1024404285").]
#bibitem([4])[Aline Bonami. Étude des coefficients de Fourier des fonctions de $L^p \( G \)$.
  #emph[Annales de l'Institut Fourier], 20(2):335--402, 1970. #link("https://doi.org/10.5802/aif.357").]
#bibitem([5])[Christer Borell. Positivity improving operators and hypercontractivity.
  #emph[Mathematische Zeitschrift], 180(2):225--234, 1982. #link("https://doi.org/10.1007/BF01318906").]
#bibitem([6])[G.~T.~Cargo and O.~Shisha. The Bernstein form of a polynomial.
  #emph[Journal of Research of the National Bureau of Standards, Section B], 70B(1):79--81, 1966.
  #link("https://doi.org/10.6028/jres.070B.005").]
#bibitem([7])[Zijie Chen, Amin Gohari, Adel Javanmard, Honghao Lin, Vahab Mirrokni, Chandra Nair,
  and David P.~Woodruff. A proof of the most informative Boolean function conjecture.
  #emph[arXiv:2609.24931v1], September 21, 2026. #link("https://arxiv.org/abs/2609.24931v1").]
#bibitem([8])[Zijie Chen, Amin Gohari, and Chandra Nair. A differential equation approach to the most-informative
  Boolean function conjecture. In #emph[2025 IEEE International Symposium on Information Theory (ISIT)], 2025.
  #link("https://doi.org/10.1109/ISIT63088.2025.11195377"). Extended version:
  #emph[arXiv:2502.10019v2], revised August 5, 2026, #link("https://arxiv.org/abs/2502.10019v2").
  References to sections, equations, and pages are to this extended version.]
#bibitem([9])[Zijie Chen and Chandra Nair. On the optimality of dictator functions and isoperimetric inequalities
  on Boolean hypercubes. In #emph[2024 IEEE International Symposium on Information Theory (ISIT)],
  pages 3380--3385, 2024. #link("https://doi.org/10.1109/ISIT57864.2024.10619180"). Extended author version:
  #link("https://chandra.ie.cuhk.edu.hk/pub/papers/HC/BF-conj.pdf"). Locators refer to the extended version.]
#bibitem([10])[Thomas A.~Courtade and Gowtham R.~Kumar. Which Boolean functions maximize mutual information on
  noisy inputs? #emph[IEEE Transactions on Information Theory], 60(8):4515--4525, 2014.
  #link("https://doi.org/10.1109/TIT.2014.2326877").]
#bibitem([11])[Polona Durcik, Paata Ivanisvili, Joris Roos, and Xinyuan Xie.
  Sharp isoperimetric inequalities on the Hamming cube II: The critical exponent.
  #emph[arXiv:2602.20462v1], February 24, 2026. #link("https://arxiv.org/abs/2602.20462v1").]
#bibitem([12])[Leonard Gross. Logarithmic Sobolev inequalities.
  #emph[American Journal of Mathematics], 97(4):1061--1083, 1975. #link("https://doi.org/10.2307/2373688").]
#bibitem([13])[Vu Khac Ky and Tuan Tran. Dictators are most informative.
  #emph[arXiv:2609.24184v1], September 21, 2026. #link("https://arxiv.org/abs/2609.24184v1").]
#bibitem([14])[Hessam Mahdavifar and Ahmad Beirami. The most informative bit and beyond:
  a proof of the Courtade--Kumar conjecture and multibit extensions.
  #emph[arXiv:2609.26444v1], September 22, 2026. #link("https://arxiv.org/abs/2609.26444v1").]
#bibitem([15])[Elchanan Mossel, Krzysztof Oleszkiewicz, and Arnab Sen. On reverse hypercontractivity.
  #emph[Geometric and Functional Analysis], 23(3):1062--1097, 2013.
  #link("https://doi.org/10.1007/s00039-013-0229-4"). Author manuscript: #link("https://arxiv.org/abs/1108.1210").]
#bibitem([16])[Ryan O'Donnell. #emph[Analysis of Boolean Functions]. Cambridge University Press, 2014.
  #link("https://doi.org/10.1017/CBO9781139814782"). Revised author text (2021):
  #link("https://arxiv.org/abs/2105.10386").]
