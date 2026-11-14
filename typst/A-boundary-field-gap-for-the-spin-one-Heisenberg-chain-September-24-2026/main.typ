#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A boundary-field gap for the spin-one Heisenberg chain]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Equal positive magnetic fields at the endpoints of an odd open spin-one Heisenberg chain select a unique
  finite-volume ground state #cite(label("Tasaki2025")) Lemma 1.
  The remaining question is whether the excitation gap stays positive as the chain grows.
  We prove a quantitative gap for one fixed field in the pure bilinear model.
  This is the boundary formulation used by Tasaki to connect the Haldane gap problem to a nontrivial topological
  index #cite(label("Tasaki2025")).

In the orthonormal basis $e_m$, $m = - 1 \, 0 \, 1$, of $bb(C)^3$, let

$ S^z e_m = m e_m \, wide S^(+) e_m = sqrt(2 - m \( m + 1 \)) thin e_(m + 1) quad \( m < 1 \) \, wide S^(+) e_1 = 0 \, $

and put $S^(-) = \( S^(+) \)^(*)$, $S^x = \( S^(+) + S^(-) \) \/ 2$, and $S^y = \( S^(+) - S^(-) \) \/ \( 2 i \)$.
  Thus $sum_alpha \( S^alpha \)^2 = 2 I$. For $L gt.eq 1$ and $h > 0$,
  consider the operator on $\( bb(C)^3 \)^(⊗ \( 2 L + 1 \))$ given by

#[#set math.equation(numbering: n => "(1.1)")
 $ H_L \( h \) = sum_(j = - L)^(L - 1) sum_(alpha = x \, y \, z) S_j^alpha S_(j + 1)^alpha -
   h \( S_(- L)^z + S_L^z \) . $ <eq:target>]

There is no bond between the endpoints. Write $E_0 \( L \, h \) lt.eq
  E_1 \( L \, h \)$ for its two lowest eigenvalues, counted with multiplicity.
  We address the fixed-boundary-field gap assertion: for some single $h > 0$, the difference $E_1 \( L \, h \) -
  E_0 \( L \, h \)$ stays bounded away from zero as $L arrow.r oo$.

#thm([Theorem 1.1.])[
  #emph[For the Hamiltonian (1.1), with the spin normalization above,
$ E_1 \( L \, 3 \/ 5 \) - E_0 \( L \, 3 \/ 5 \) > frac(log 10, 392) wide upright("for every integer ") L gt.eq 960 . $

]
] <thm:main>

===== 1.1 Context and prior work. <context-and-prior-work.>

Haldane’s prediction, formulated in 1981 and published in 1983,
  distinguishes integer and half-odd-integer isotropic antiferromagnetic Heisenberg chains,
  with a positive bulk gap for positive integer spin #cite(label("Haldane1981")) #cite(label("Haldane1983PLA"))
  #cite(label("Haldane1983PRL")). For spin one-half, Lieb, Schultz and Mattis had already constructed excitations
  of the periodic chain whose energy above the ground state vanishes with its length #cite(label("LSM1961"))
  Appendix B. The Affleck–Kennedy–Lieb–Tasaki construction gave a rigorous gapped spin-one model
  #cite(label("AKLT1987")) #cite(label("AKLT1988")). Its interaction contains a biquadratic term:
  with $q = upright(bold(S))_j dot.op upright(bold(S))_(j + 1)$, it is proportional to $q +
  q^2 \/ 3$ up to an additive constant. Our Hamiltonian has the pure bilinear interaction $q$ and fixed endpoint fields.

The endpoint condition matters even when the bulk interaction is fixed.
  White and Huse numerically characterized the effective spin-one-half degrees of freedom at free ends
  #cite(label("WhiteHuse1993")). To estimate bulk properties, including the gap,
  they added physical spin-one-half endpoint sites and adjusted their couplings.
  Magnetic fields on the original spin-one endpoints give a different finite-volume model,
  whose gap requires its own boundary estimates.

Tasaki formulated precisely this boundary problem in his work on the topological character of the spin-one
  Heisenberg ground state #cite(label("Tasaki2025")). Equation (2) of that paper is the Hamiltonian (1.1);
  Lemma 1 proves uniqueness for every $L gt.eq 1$ and $h > 0$.
  Assumption 2 asks for a positive gap uniform in all sufficiently large $L$, at one fixed $h > 0$.
  Theorem 1 resolves this fixed-boundary-field Haldane gap assertion positively and establishes that assumption.
  Section 7 then derives Tasaki index $- 1$ for every boundary-selected subsequential local limit.

The topological viewpoint developed through several distinct descriptions.
  Den Nijs and Rommelse introduced nonlocal string order #cite(label("DenNijsRommelse1989")),
  and Kennedy and Tasaki connected it to hidden symmetry breaking #cite(label("KennedyTasaki1992")).
  Pollmann, Turner, Berg and Oshikawa described symmetry protection through matrix-product states and the
  entanglement spectrum #cite(label("Pollmann2010")); Ogata extended the bond-centered reflection index to
  infinite-chain states beyond the matrix-product description #cite(label("Ogata2021")).
  Tasaki’s local-twist index #cite(label("Tasaki2018")) instead uses the twist expectation studied by Nakamura and
  Todo #cite(label("NakamuraTodo2002")). The boundary-state theorem in #cite(label("Tasaki2025")) uses uniform $z$
  rotations and site-centered reflection. These invariances imply invariance under site reflection combined with a
  global $pi$ rotation about $z$, the symmetry studied by Fuji,
  Pollmann and Oshikawa #cite(label("FujiPollmannOshikawa2015")).
  Our consequence concerns Tasaki’s index in this precise symmetry setting;
  it does not identify the different diagnostics above.

===== 1.2 Methodological inputs. <methodological-inputs.>

For frustration-free chains, Lemm and Mozgunov proved finite-size criteria involving both interior and
  boundary-segment gaps #cite(label("LemmMozgunov2019")). Here the boundary information comes from weighted
  spatial moments and a coupled Gibbs-purity recurrence. The finite trial vectors use the matrix-product framework
  of finitely correlated states #cite(label("FNW1992")) and its finite-chain formulation
  #cite(label("PerezGarcia2007")); they certify energy upper bounds that initialize the recurrence.

The continuous-history representation is an instance of the time-ordered Poisson expansion of Aizenman and
  Nachtergaele #cite(label("AizenmanNachtergaele1994")). The particular spatial transfer operator and finite
  periodic estimates used here come from #cite(label("periodic")),
  which proves a uniform gap on even periodic rings. We retain that source’s spin normalization, coupling,
  and energy shift, and state explicitly the transfer and finite-input results used below.
  The endpoint pairings and all estimates specific to the open chain are proved here.

===== 1.3 Proof strategy. <proof-strategy.>

For each inverse temperature $b > 0$, a partition function of the periodic model is a trace of a power of a
  compact self-adjoint spatial operator $X_b$. For the open chain with #emph[opposite] endpoint fields,
  the corresponding partition function is instead a boundary pairing $chevron.l v_b \, X_b^n v_b chevron.r$,
  where $n$ is the number of sites. At even $n$, this is a positive weighted moment of the absolute spatial
  eigenvalues. A rotation of the right boundary vector produces the same-field Hamiltonian in (1.1).

The periodic estimates show that one spatial eigenvalue dominates sufficiently high even moments.
  For the open chain, however, the contribution of each eigenspace is weighted by its overlap with $v_b$,
  and this vector changes with temperature. Periodic concentration therefore leaves a boundary-overlap problem.
  We solve it by contracting the residual boundary-weighted moments while tracking the physical Gibbs purity (the
  sum of the squared Gibbs probabilities) of the opposite-field chain.
  These two estimates improve together when both length and inverse temperature double,
  without assuming a nonzero boundary overlap at the next temperature.
  Once the leading spatial line dominates the boundary pairing,
  its rotation invariance controls the same-field expression at every odd length in a full dyadic interval.
  The purity defect then decreases at a rate exponential in the inverse temperature,
  which yields a uniform physical gap.

Sections 2 and 3 establish the transfer representation and the periodic estimates in the form needed here.
  Section 4 proves the boundary recurrence. Section 5 initializes and iterates it,
  and Section 6 proves Theorem 1 at all the required odd lengths.
  Section 7 applies the resulting gap to the boundary-selected infinite-volume states.
  Appendices 8 and 9 give complete finite certificates for the boundary initialization.
  All terminating decimals used in inequalities denote exact rationals.

== 2 Spatial transfer with endpoint fields <sec:transfer>

We first put the periodic and open chains in the same transfer representation.
  The boundary vectors, including their complex phases, will distinguish the physical endpoint fields.
  The time-ordered bond expansion has a general formulation in #cite(label("AizenmanNachtergaele1994")) arXiv v1,
  Section 2.2, Equations (2.10)–(2.12). We prove the required boundary identity directly with the specified kernel
  and field coefficients.

=== 2.1 Hamiltonians and shifted partition functions <hamiltonians-and-shifted-partition-functions>

From now on set

#[#set math.equation(numbering: n => "(2.1)")
 $ h = 3 / 5 \, wide a = 700741 / 500000 \, wide b_0 = 49 / 4 \, wide b_j =
   2^j b_0 quad \( j gt.eq 0 \) . $ <tr:constants>]

It is convenient to label an $n$-site chain by $0 \, dots.h \, n - 1$.
  Write $S_j dot.op S_k = sum_alpha S_j^alpha S_k^alpha$ and define

#[#set math.equation(numbering: n => "(2.2)")
 $ H_n^(upright("opp")) & = sum_(j = 0)^(n - 2) S_j dot.op S_(j + 1) - h S_0^z + h S_(n - 1)^z \,\
H_n^(upright(s)) & = sum_(j = 0)^(n - 2) S_j dot.op S_(j + 1) - h S_0^z - h S_(n - 1)^z \,\
H_n^(upright("per")) & = sum_(j = 0)^(n - 2) S_j dot.op S_(j + 1) +
  S_(n - 1) dot.op S_0 quad \( n gt.eq 4 \) . $ <tr:Hopp>]

For $n = 2 L + 1$, $H_n^(upright(s))$ is (1.1) after relabeling.
  Our partition functions are ordinary traces over the entire physical Hilbert space:

#[#set math.equation(numbering: n => "(2.3)")
 $ Z_n \( b \) & = "Tr" e^(- b \( H_n^(upright("per")) + a n I \)) \,\
Y_n \( b \) & = "Tr" e^(- b \( H_n^(upright("opp")) + a n I \)) \, wide Y_n^(upright(s)) \( b \) =
  "Tr" e^(- b \( H_n^(upright(s)) + a n I \)) . $ <tr:partitions>]

The shift is per site, also for open chains. It will cancel from all physical Gibbs weight ratios.

=== 2.2 The spatial operator <the-spatial-operator>

We use the concrete spatial-transfer operator in #cite(label("periodic")) Proposition 3.1.
  Its auxiliary space records ordered bond events in imaginary time;
  each physical site contributes a kernel depending on its two incident histories.
  Use the unitarily equivalent Cartesian spin matrices $\( S^alpha \)_(r s) = -
  i epsilon_(alpha r s)$ and set $G_alpha = i S^alpha$. Then $G_alpha$ is real,
  $lr(bar.v.double G_alpha bar.v.double) = 1$, and

$ - S dot.op S = sum_(alpha = x \, y \, z) G_alpha ⊗ G_alpha . $

A history is an ordered list $omega = \( \( t_1 \, alpha_1 \) \, dots.h \, \( t_d \, alpha_d \) \)$ with $0 <
  t_1 < dots.h.c < t_d < b$ and $alpha_r in { x \, y \, z }$; the empty list is allowed.
  Give the disjoint union $Omega_b$ of these labeled simplexes Lebesgue measure on each simplex and mass one at
  the empty history. Its measure $mu_b$ has total mass $e^(3 b)$.

For two histories, merge their events in chronological order and take the trace of the resulting product of $G$
  matrices, with increasing time from left to right. Denote this real kernel by $k_b \( omega \, eta \)$.
  Set it to zero at nonempty time collisions, a null set, and use trace $3$ for the two empty histories.
  The kernel is symmetric: exchanging the two histories leaves their merged list unchanged.
  In particular, symmetry does not reverse a product of noncommuting matrices. Moreover $\| k_b \| lt.eq 3$.
  On $cal(K)_b = L^2 \( Omega_b \, mu_b \; bb(C) \)$ define

#[#set math.equation(numbering: n => "(2.4)")
 $ \( X_b f \) \( omega \) = e^(- a b) integral_(Omega_b) k_b \( omega \, eta \) f \( eta \) thin d
   mu_b \( eta \) . $ <tr:operator>]

It is real, self-adjoint, and Hilbert–Schmidt. The cited transfer Proposition identifies its periodic moments:

#[#set math.equation(numbering: n => "(2.5)")
 $ Z_n \( b \) = "Tr" X_b^n quad \( n gt.eq 4 \) \, wide sum_i \| mu_i \( b \) \|^k < oo quad \( k gt.eq 2 \) \,
   $ <tr:periodic>]

where $mu_i \( b \)$ lists its nonzero eigenvalues with multiplicity.
  This exact operator, with the shift in (2.1), is the one used for the periodic inputs in Section 3.

Rotations will let us change one endpoint field and, later, show that the leading spatial line is fixed.
  Let $D_2$ consist of the identity and the three diagonal rotations by $pi$,
  let $C$ cyclically permute the coordinate axes, and put $cal(G) = chevron.l D_2 \, C chevron.r$.
  This is a group of twelve proper signed permutations. If $g e_alpha =
  epsilon.alt_g \( alpha \) e_(sigma_g \( alpha \))$, write $sigma_g
  omega$ for relabeling the marks and $s_g \( omega \) = product_r epsilon.alt_g \( alpha_r \)$. The operators

#[#set math.equation(numbering: n => "(2.6)")
 $ \( U_g f \) \( omega \) = s_g \( sigma_g^(- 1) omega \) f \( sigma_g^(- 1) omega \) $ <tr:rotations>]

form a real unitary representation and commute with $X_b$.
  This follows either directly by rotating every matrix in the kernel, or from the same Proposition.
  In particular, fix $P = "diag" \( 1 \, - 1 \, - 1 \)$, so $P e_z = - e_z$.

=== 2.3 Boundary vectors <boundary-vectors>

Define $v_b in cal(K)_b$ by

#[#set math.equation(numbering: n => "(2.7)")
 $ v_b \( omega \) =
   cases(delim: "{", \( i h \)^d \, & upright("all ") d upright(" marks of ") omega upright(" equal ") z \,,
   0 \, & upright("otherwise") .) $ <tr:vector>]

The empty-history value is one. The simplex volumes give $lr(bar.v.double v_b bar.v.double)^2 =
  sum_(d gt.eq 0) b^d h^(2 d) \/ d ! = e^(b h^2)$. The inner product below is conjugate linear in its first argument.

#thm([Proposition 2.1.])[
  (Open-chain transfer).  #emph[For $b > 0$, $n gt.eq 2$, and $g in cal(G)$, the pairing $chevron.l v_b \,
    X_b^n U_g v_b chevron.r$ is the shifted partition function of the open chain with left field $-
    h S_0^z$ and right field $+ h S_(n - 1)^(g e_z)$. Consequently
#[#set math.equation(numbering: n => "(2.8)")
 $ Y_n \( b \) = chevron.l v_b \, X_b^n v_b chevron.r \, wide Y_n^(upright(s)) \( b \) = chevron.l v_b \,
   X_b^n U_P v_b chevron.r . $ <tr:open>]

 Here $S^u = sum_alpha u_alpha S^alpha$ for a real vector $u$.]
] <tr:boundary>

#proof[
  Expand the negative Hamiltonian exponential into its ordered-time series.
    Each bond event inserts two $G_alpha$ matrices, by the Cartesian identity above.
    At the left endpoint, the conjugated coefficient in (2.7) gives $\( - i h \) G_z = + h S^z$ per event;
    at the right endpoint the coefficient is $\( i h \) G_z = - h S^z$.
    Relabeling by $g$ and multiplying its signs changes this last insertion to $- h S^(g e_z)$.
    These are exactly the two field insertions in the negative Hamiltonian stated in the Proposition.
  Regroup the series by the boundary histories $omega_0 \, omega_n$ and the $n - 1$ bond histories $omega_1 \,
    dots.h \, omega_(n - 1)$. Their interleavings partition each full time simplex up to null collisions.
    At site $r$, $0 lt.eq r < n$, the trace is $k_b \( omega_r \, omega_(r + 1) \)$,
    in the original chronological order. Integrating these $n$ kernel factors against the two boundary
    coefficients gives $X_b^n$ and the shift factor $e^(- b a n)$. No bond joins the endpoints.
  This regrouping is legitimate: the absolute sum of traced terms is bounded by $3^n exp {
    b \[ 3 \( n - 1 \) + 2 h \] }$ before the scalar shift. All sums and integrals are therefore absolutely
    convergent. Choosing $g = 1$ and $g = P$ gives (2.8). ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$X_b$]]])])
  content((1.6, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$X_b$]]])])
  content((3.2, 0), [#text(size: 9pt)[$dots.h$]])
  content((4.8, 0), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$X_b$]]])])
  line((-1.6, 0), (-0.45, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.45, 0), (1.15, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.05, 0), (2.75, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.65, 0), (4.35, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.25, 0), (6.4, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.6, 0), [#text(size: 9pt)[$overline(v)_b$]], anchor: "east", padding: 0.1176cm)
  content((0, -1.8), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$X_b$]]])])
  content((1.6, -1.8), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$X_b$]]])])
  content((3.2, -1.8), [#text(size: 9pt)[$dots.h$]])
  content((4.8, -1.8), [#box(width: 0.9cm, height: 0.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$X_b$]]])])
  line((-1.6, -1.8), (-0.45, -1.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.45, -1.8), (1.15, -1.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.05, -1.8), (2.75, -1.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.65, -1.8), (4.35, -1.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.25, -1.8), (6.4, -1.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.6, -1.8), [#text(size: 9pt)[$overline(v)_b$]], anchor: "east", padding: 0.1176cm)
  content((6.4, 0), [#text(size: 9pt)[$v_b$]], anchor: "west", padding: 0.1176cm)
  content((6.4, -1.8), [#text(size: 9pt)[$U_"Pv"_b$]], anchor: "west", padding: 0.1176cm)
  content((-0.2, 0.45), [#text(size: 9pt)[left: $-"hS"^z$]], anchor: "south", padding: 0.1176cm)
  content((5, 0.45), [#text(size: 9pt)[right: $+"hS"^z$]], anchor: "south", padding: 0.1176cm)
  content((-0.2, -2.25), [#text(size: 9pt)[left: $-"hS"^z$]], anchor: "north", padding: 0.1176cm)
  content((5, -2.25), [#text(size: 9pt)[right: $-"hS"^z$]], anchor: "north", padding: 0.1176cm)
  line((6.7, -0.45), (6.7, -1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.45, -0.9), [#text(size: 9pt)[$P e_z=-e_z$]], anchor: "east", padding: 0.1176cm)
  content((2.4, -0.65), [#text(size: 9pt)[$n$ site kernels]])
})],
  caption: [Figure 1: The two spatial boundary pairings. Each box contributes one site kernel; the internal integrations represent the $n - 1$ bonds. Replacing the right boundary vector by $U_P v_b$ changes the right physical field. This is an identity between transfer representations, not a claim that the two physical Hamiltonians are unitarily equivalent. ],
) <fig:boundary-pairings>

For even lengths, the opposite-field expression is the positive moment $Y_n \( b \) =
  chevron.l v_b \, \| X_b \|^n v_b chevron.r$. At odd lengths,
  the powers of $X_b$ retain the signs of its eigenvalues. We first concentrate the even opposite-field moments.
  The resulting leading-line estimate will then control the signed same-field pairing at odd lengths;
  Figure 1 distinguishes the two boundary pairings.

== 3 Periodic concentration estimates <sec:periodic>

The boundary argument requires quantitative information about the spatial spectrum,
  including the change of its leading eigenvalue when the inverse temperature doubles.
  We extract that information from finite periodic-chain estimates in #cite(label("periodic")).
  The extraction is given in detail because the periodic gap theorem alone does not provide these boundary
  estimates. Throughout, terminating decimals denote exact rational numbers, and eigenvalue lists count multiplicities.

For even $n gt.eq 4$, put

#[#set math.equation(numbering: n => "(3.1)")
 $ S \( n \, b \) = frac(Z_(2 n) \( b \), Z_n \( b \)^2) \, wide T \( n \, b \) =
   frac(Z_n \( 2 b \), Z_n \( b \)^2) . $ <per:purities>]

The first is the purity of the spatial probabilities $\| mu_i \( b \) \|^n \/ Z_n \( b \)$,
  where $\( mu_i \( b \) \)$ is the nonzero spectrum of $X_b$;
  the second is the purity of the physical Gibbs probabilities. Both lie in $\( 0 \, 1 \]$.
  Doubling $n$ squares the first probability list, whereas doubling $b$ squares the second.

#thm([Lemma 3.1.])[
  (Squaring and concentration).  #emph[Let $\( w_i \)$ be a finite or countable probability list,
    and suppose its purity is at least $1 - u$, where $0 lt.eq u < 1$.
    Normalizing the squares $w_i^2$ gives a list with purity defect at most
#[#set math.equation(numbering: n => "(3.2)")
 $ f \( u \) = frac(u^2, 2 \( 1 - u \)^2) . $ <per:f>]

 If $u < 1 \/ 2$, the largest weight is unique and at least $1 - u$.
   Writing $x$ for the sum of all the other weights, one has
#[#set math.equation(numbering: n => "(3.3)")
 $ x lt.eq frac(1 - sqrt(1 - 2 u), 2) . $ <per:concentration-elementary>]

 In particular, for $0 lt.eq u lt.eq .1$,
#[#set math.equation(numbering: n => "(3.4)")
 $ frac(x, 1 - x) lt.eq d \( u \) \, wide d \( u \) = frac(u, 2 - 3 u) . $ <per:d>]

]
] <per:purity>

#proof[
  Set $P = sum_i w_i^2$ and let $P'$ be the purity after squaring.
    Nonnegativity justifies rearrangement of the countable sums, and
  $ 1 - P' = frac(2 sum_(i < k) w_i^2 w_k^2, P^2) lt.eq frac(2 \( sum_(i < k) w_i w_k \)^2, P^2) =
    frac(\( 1 - P \)^2, 2 P^2) lt.eq f \( u \) . $
  Here $f$ is increasing on $\[ 0 \, 1 \)$. A summable nonzero nonnegative list attains its maximum, and $P lt.eq
    max_i w_i$. If $u < 1 \/ 2$, the maximum therefore exceeds $1 \/ 2$ and is unique. Thus $x lt.eq u < 1 \/ 2$, and
  $ 2 x \( 1 - x \) lt.eq 1 - P lt.eq u \, $
  which gives (3.3). Also $x lt.eq u \/ \[ 2 \( 1 - x \) \] lt.eq u \/ \[ 2 \( 1 - u \) \]$;
    applying the increasing function $x mapsto x \/ \( 1 - x \)$ proves (3.4). ◻
]

For later reference we also record explicitly the interaction of the two periodic purities.
  This is #cite(label("periodic")) Lemma 4.2; we include its short proof by partition-function cancellation.

#thm([Lemma 3.2.])[
  (Coupled update).  #emph[Suppose that $n gt.eq 4$ is even, $b > 0$, and $S \( n \, b \) gt.eq s$,
    $T \( 2 n \, b \) gt.eq t$, with $0 < s \, t lt.eq 1$. Set
$ p_(+) = f \( 1 - s^2 t \) . $

 If $p_(+) < 1$, then
#[#set math.equation(numbering: n => "(3.5)")
 $ 1 - S \( 2 n \, 2 b \) lt.eq p_(+) \, wide 1 - T \( 4 n \, 2 b \) lt.eq f #scale(x: 120%, y: 120%)[\(] 1 -
   t^2 \( 1 - p_(+) \) #scale(x: 120%, y: 120%)[\)] . $ <per:coupled-formula>]

 Either upper defect bound may be increased before subsequent use, provided it stays below one.]
] <per:coupled>

#proof[
  Directly from (3.1),
  $ S \( n \, 2 b \) = S \( n \, b \)^2 frac(T \( 2 n \, b \), T \( n \, b \)^2) gt.eq s^2 t . $
  Apply spatial squaring and Lemma 3. A second cancellation then gives
  $ T \( 4 n \, b \) = T \( 2 n \, b \)^2 frac(S \( 2 n \, 2 b \), S \( 2 n \, b \)^2) gt.eq t^2 \( 1 - p_(+) \) . $
  Physical squaring proves the second inequality. Monotonicity of $f$ justifies increasing either defect bound. ◻
]

We next state the finite inputs gathered in the companion #cite(label("periodic")) Corollary 5.6.
  Its shift, spin normalization and unit bilinear coupling are exactly those used here.
  In particular, we use an intermediate row in the initialization proof, not merely its final conclusion.

#thm([Proposition 3.3.])[
  (Finite periodic inputs from #cite(label("periodic"))).  #emph[Set
#[#set math.equation(numbering: n => "(3.6)")
 $ ell = .999 \, quad U = 1.00139 \, quad V = .872 \, quad m_J = 1.0657205 \, quad m_N = .2783155 . $ <per:constants>]

 At $b_0 = 49 \/ 4$, the spatial eigenvalue list decomposes as one list $J$ and three identical lists $N$.
   Here $J$ is the spectrum on the subspace fixed by every $U_g$, $g in D_2$,
   and $N$ is the common spectrum on each of the other three simultaneous eigenspaces of these commuting
   operators. In $J$ the absolute eigenvalues are at most $U$, and their twelfth powers sum to at most $m_J$;
   in each $N$ they are at most $V$, and their twelfth powers sum to at most $m_N$.
   There is an eigenvalue in $J$ whose modulus exceeds $ell$. Furthermore,
#[#set math.equation(numbering: n => "(3.7)")
 $ 1 - S \( 72 \, b_1 \) lt.eq 151249 / 2500000 = .0604996 . $ <per:native-first-row>]

 For the periodic chains of $72$ and $120$ sites, the shifted ground energy is strictly negative.
   Consequently, at each of these lengths and every $b > 0$,
   an individual unnormalized ground Boltzmann weight is greater than one.]
] <per:native>

No boundary Hamiltonian occurs in Proposition 5. The finite periodic thermal and variational certificates
  supporting it are given in the cited source. We now deduce all the spatial estimates that will be used for
  boundaries. The residual ratios will contract the boundary-weighted tails.
  The upper and lower bounds comparing successive leading eigenvalues will control the change of temperature in
  the boundary concentration and physical-purity estimates, respectively.
  Finally, positivity and rotation invariance of the leading line will control the same-field pairing at odd lengths.

#thm([Proposition 3.4.])[
  (Concentration at the doubling scales).  #emph[For every $j gt.eq 0$,
    $X_(b_j)$ has a unique simple eigenvalue of largest modulus.
    This eigenvalue is positive; denote it by $lambda_j = parallel X_(b_j) parallel$.
    Its eigenspace is fixed pointwise by $cal(G)$. Let $rho_j$ be the supremum of the absolute values of all other
    eigenvalues divided by $lambda_j$. Then
#[#set math.equation(numbering: n => "(3.8)")
 $ ell < lambda_0 lt.eq U \, wide rho_0 < .874 \, wide rho_1 < .9525 \, wide rho_2 < .971 . $ <per:initial-ratios>]

 For $j gt.eq 2$, define
#[#set math.equation(numbering: n => "(3.9)")
 $ n_j = 120 thin 2^(j - 2) \, wide M_j = 2 n_j \, wide u_2 = .052 \, wide u_(j + 1) = 6 u_j^2 . $ <per:scales>]

 The following bounds hold for every $j gt.eq 2$:
#[#set math.equation(numbering: n => "(3.10)")
 $ 1 - S \( n_j \, b_j \) & lt.eq u_j \, & 1 - T \( M_j \, b_j \) & lt.eq u_j \,\
rho_j^(n_j) & lt.eq d \( u_j \) . &  & $ <per:tracked-purities>]

 Finally, put $r_j = lambda_(j + 1) \/ lambda_j^2$. Then
#[#set math.equation(numbering: n => "(3.11)")
 $ 0 < r_j lt.eq 1 quad \( j gt.eq 0 \) \, wide r_j^(M_j) gt.eq \( 1 - u_j \) \( 1 - u_(j + 1) \)
   quad \( j gt.eq 2 \) . $ <per:lambda-ratios>]

]
] <per:concentration>

#proof[
  Until positivity has been proved, write $lambda_j = parallel X_(b_j) parallel$ for the maximal spectral modulus.
  #emph[The initial spatial spectrum.] Remove an eigenvalue in $J$ whose modulus exceeds $ell$.
    The remaining twelfth-power mass in $J$ is at most $m_J - ell^12 < ell^12$,
    while $V < ell$ bounds each of the other three sectors. The removed eigenvalue is therefore the unique simple
    eigenvalue of maximal modulus. The exact rational inequalities
  $ m_J - ell^12 < \( .874 ell \)^12 \, wide V < .874 ell $
  prove $rho_0 < .874$.
  We need the total residual moments as well as this individual ratio bound. For every real $k gt.eq 12$, define
  #[#set math.equation(numbering: n => "(3.12)")
   $ D \( k \) =
     frac(\( m_J - ell^12 \)^(k \/ 12) + 3 #scale(x: 120%, y: 120%)[\[] V^k + \( m_N - V^12 \)^(k \/ 12)
     #scale(x: 120%, y: 120%)[\]], ell^k) . $ <per:D>]
  The sum of the $k$th powers of all nondominant absolute eigenvalue ratios at $b_0$ is at most $D \( k \)$.
    Indeed, $V^12 < m_N < 2 V^12$; for a nonnegative list with entries at most $V^12$ and total mass at most
    $m_N$, convexity of $x^(k \/ 12)$ bounds the sum by $\( V^12 \)^(k \/ 12) + \( m_N - V^12 \)^(k \/ 12)$.
    This follows by moving mass to fill one entry before the next;
    finite sublists followed by a limit give the countable case.
    Without an entry cap, the corresponding bound is simply the total mass to the power $k \/ 12$.
    Applying these facts to the four sectors proves the claim. In particular, for even $k gt.eq 12$,
  #[#set math.equation(numbering: n => "(3.13)")
   $ Z_k \( b_0 \) lt.eq U^k \( 1 + D \( k \) \) . $ <per:Z-initial>]
  #emph[Reseeding at $\( 120 \, b_2 \)$.] Our next goal is to make both $1 - S \( 120 \, b_2 \)$ and $1 -
    T \( 240 \, b_2 \)$ at most $.052$, so that one quadratic recurrence will control them.
    A coupled update will give these bounds from spatial and physical seeds at $\( 60 \, b_1 \)$ and
    $\( 120 \, b_1 \)$, respectively. To obtain the spatial seed,
    we combine a leading-eigenvalue lower bound from length $72$ with a residual-moment upper bound at length
    $32$, then increase the moment order to $60$. The same residual estimate also supplies the ratio $rho_1$
    needed in the first boundary updates.
  By (3.7) and Lemma 3, the spatial list at $\( 72 \, b_1 \)$ has a unique largest weight.
    Thus $X_(b_1)$ also has a unique simple eigenvalue of maximal modulus. Moreover,
  $ .0604996 < 2 \( .032 \) \( .968 \) $
  implies that this weight exceeds $.968$. The periodic trial at length $72$ gives $Z_72 \( b_1 \) > 1$, so
  #[#set math.equation(numbering: n => "(3.14)")
   $ lambda_1^72 > .968 . $ <per:lambda1>]
  Physical squaring at length $32$ gives $Z_32 \( b_1 \) lt.eq Z_32 \( b_0 \)^2$.
    Subtracting the dominant spatial contribution and using (3.13) and (3.14) therefore yields
  #[#set math.equation(numbering: n => "(3.15)")
   $ sum_(i eq.not 0) lr(|frac(mu_i \( b_1 \), lambda_1)|)^32 lt.eq
     U^64 \( 1 + D \( 32 \) \)^2 \( .968 \)^(- 32 \/ 72) - 1 < .9525^32 . $ <per:tail32>]
  This proves $rho_1 < .9525$. For any nonnegative list $\( a_i \)$ and $q gt.eq p > 0$,
    one has $sum_i a_i^q lt.eq \( sum_i a_i^p \)^(q \/ p)$ whenever the right side is finite.
    Applying this to (3.15) gives a residual $60$th moment below $.9525^60$.
    Retaining only the dominant term in the numerator of $S \( 60 \, b_1 \)$ proves
  #[#set math.equation(numbering: n => "(3.16)")
   $ S \( 60 \, b_1 \) gt.eq s := \( 1 + .9525^60 \)^(- 2) . $ <per:seed-s>]
  For the physical spectrum at length $120$, choose one ground Boltzmann weight at $b_0$ and divide every other
    weight by it. The chosen weight is greater than one by Proposition 5.
    Hence the sum of the other ratios is bounded above by
  $ R = U^120 \( 1 + D \( 120 \) \) - 1 . $
  When $b$ doubles, these ratios square, so their sum is at most $R^2$.
    Keeping the chosen ground weight in the purity numerator now gives
  #[#set math.equation(numbering: n => "(3.17)")
   $ T \( 120 \, b_1 \) gt.eq t := \( 1 + R^2 \)^(- 2) . $ <per:seed-t>]
  This reasoning neither assumes ground-state simplicity nor discards multiplicities.
  Here are rational checks sufficient for every numerical comparison just used and for the ensuing seed:
  #[#set math.equation(numbering: n => "(3.18)")
   $ D \( 32 \) & < & .0442 \,\
D \( 120 \) & < & .00000025 \,\
\( .9856 \)^9 & < & \( .968 \)^4 \,\
U^64 \( 1 + .0442 \)^2 \/ .9856 - 1 & < & .2092 < .9525^32 \,\
s & > & .9002 \, wide t > .9372 \,\
f \( 1 - .9002^2 thin .9372 \) & < & .0502 \,\
f \( 1 - .9372^2 \( 1 - .0502 \) \) & < & .0198 . $ <per:scalar-checks>]
  All comparisons are between explicit rational numbers after bounding the cube roots in $D \( 32 \)$ by
  $ \( m_J - ell^12 \)^(1 \/ 3) < .426635 \, wide \( m_N - V^12 \)^(1 \/ 3) < .439736 . $
  Cubing verifies these two bounds; raising the bounds to the eighth power gives the displayed bound on
    $D \( 32 \)$. For $D \( 120 \)$ no roots are needed. The bound on $t$ follows already with $D \( 120 \)$
    replaced by $.00000025$. Lemma 4, applied to (3.16)–(3.17) at $\( n \, b \) = \( 60 \, b_1 \)$, now gives
  $ 1 - S \( 120 \, b_2 \) < .052 \, wide 1 - T \( 240 \, b_2 \) < .052 . $
  #emph[Induction.] For $0 lt.eq u lt.eq .052$,
  #[#set math.equation(numbering: n => "(3.19)")
   $ f #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - u \)^3 #scale(x: 120%, y: 120%)[\)] = G \( u \) u^2 \, wide
     G \( u \) = 1 / 2 (sum_(r = 1)^3 \( 1 - u \)^(- r))^2 . $ <per:G>]
  The function $G$ is increasing, and exact substitution gives $G \( .052 \) < 5.583 < 6$.
    Also $6 u^2 lt.eq u$ on this interval. Thus, if the two defects in (3.10) are at most $u_j$,
    the first coupled output is at most $6 u_j^2 = u_(j + 1) lt.eq u_j$.
    Using this upper bound in the second output bounds that output by the same number.
    This proves (3.10) for every $j gt.eq 2$. Each spatial purity exceeds $1 \/ 2$,
    so the maximal spatial modulus remains unique and simple. Applied to its probability list, Lemma 3 also gives
  $ sum_(i eq.not 0) lr(|frac(mu_i \( b_j \), lambda_j)|)^(n_j) lt.eq d \( u_j \) \, $
  which proves (3.10). The rational comparison $d \( .052 \) < .971^120$ gives $rho_2 < .971$.
  #emph[The sign and the rotation symmetry.] At every level we have proved uniqueness of the eigenvalue of maximal
    modulus. If it were $- lambda_j$, then $"Tr" \( X_(b_j)^n \) \/ lambda_j^n$ would tend to $-
    1$ through odd integers $n$. Indeed, the residual ratios are bounded by some number below one,
    and their fourth powers have finite sum, so their $n$th-power sum vanishes as $n arrow.r oo$.
    This contradicts the strictly positive physical partition function $Z_n \( b_j \)$ at odd $n gt.eq 5$.
    The leading eigenvalue is therefore $+ lambda_j$.
  Its eigenspace has a real unit vector, since $X_(b_j)$ is real.
    The real unitaries $U_g$ commute with $X_(b_j)$, so they act on that line by signs.
    The order-three cyclic rotation $C$ must act by $+ 1$. It conjugates the three nonidentity elements of $D_2$
    cyclically, so they have the same sign on the line. Since the product of any two is the third,
    that common sign equals its square and hence is $+ 1$. Thus every element of $cal(G) = chevron.l D_2 \,
    C chevron.r$ fixes the leading eigenspace pointwise.
  #emph[Comparing the leading eigenvalues.] For every even $N gt.eq 4$,
    physical squaring gives $Z_N \( b_(j + 1) \) lt.eq Z_N \( b_j \)^2$.
    The residual-tail estimate used above gives $Z_N \( b_j \) \/ lambda_j^N = 1 + o \( 1 \)$,
    so $Z_N \( b_j \)^(1 \/ N) arrow.r lambda_j$. Taking $N$th roots and letting $N$ tend to infinity through even
    integers therefore yields $lambda_(j + 1) lt.eq lambda_j^2$.
    For the opposite direction at the reference scale, recall that $M_j = n_(j + 1)$.
    The leading spatial probability at $\( M_j \, b_(j + 1) \)$ is at least $1 - u_(j + 1)$, so
  $ lambda_(j + 1)^(M_j) & gt.eq \( 1 - u_(j + 1) \) Z_(M_j) \( b_(j + 1) \)\
 & = \( 1 - u_(j + 1) \) T \( M_j \, b_j \) Z_(M_j) \( b_j \)^2\
 & gt.eq \( 1 - u_(j + 1) \) \( 1 - u_j \) lambda_j^(2 M_j) . $
  This proves (3.11) and completes the proof. ◻
]

== 4 Concentration of boundary-weighted moments <sec:boundary>

We now pass from unweighted spatial traces to the boundary pairing for the opposite-field chain.
  We will control two quantities together: the fraction of an even boundary moment outside the leading spatial
  line, and the defect of the physical Gibbs purity. The boundary coefficients depend on temperature.
  We compare the weighted moments across temperatures through physical partition-function identities,
  while contracting the residual spatial powers at a fixed temperature.

Use the simple positive leading eigenvalue $lambda_j$ and residual ratio $rho_j$ from Section 3.
  Let $P_j$ be the orthogonal projection onto its line, and put

#[#set math.equation(numbering: n => "(4.1)")
 $ c_j & = lr(bar.v.double P_j v_(b_j) bar.v.double)^2 \,\
B_k \( j \) & = chevron.l v_(b_j) \, \( \| X_(b_j) \| \/ lambda_j \)^k v_(b_j) chevron.r \, wide e_k \( j \) =
  frac(B_k \( j \) - c_j, B_k \( j \)) \,\
A \( m \, j \) & = frac(Y_m \( b_(j + 1) \), Y_m \( b_j \)^2) . $ <be:definitions>]

We use $k \, m$ even and at least two. Then $B_k \( j \) = Y_k \( b_j \) \/ lambda_j^k > 0$,
  so $e_k \( j \)$ is defined even if $c_j = 0$. Also $0 lt.eq e_k \( j \) lt.eq 1$ and $0 < A \( m \, j \) lt.eq
  1$. Thus $e_k \( j \)$ is the residual fraction of a spatial boundary moment,
  whereas $A \( m \, j \)$ is the physical Gibbs purity of the opposite-field chain at inverse temperature $b_j$.

The normalized absolute spatial eigenvalues are at most one.
  Thus $B_m \( j \) lt.eq B_k \( j \)$ when $m gt.eq k$. More precisely, if $D_k \( j \) = B_k \( j \) - c_j$,
  the spectral theorem gives

#[#set math.equation(numbering: n => "(4.2)")
 $ 0 lt.eq D_m \( j \) lt.eq rho_j^(m - k) D_k \( j \) wide \( m gt.eq k \) . $ <be:residual>]

The powers act on the residual spectrum; no upper bound for the total boundary norm is needed in this comparison.

#thm([Lemma 4.1.])[
  (Transfer between temperatures).  #emph[Let $j gt.eq 0$ and let $m > k gt.eq 2$ be even.
    Suppose $e_k \( j \) < 1$ and $0 < q < 1$ with $q gt.eq rho_(j + 1)^(m - k)$.
    Define, for $0 lt.eq e < 1$ and $0 < t lt.eq 1$,
#[#set math.equation(numbering: n => "(4.3)")
 $ F \( q \, e \, t \) = frac(q, 1 - q) (frac(1, \( 1 - e \)^2 t) - 1) . $ <be:F>]

 Then
#[#set math.equation(numbering: n => "(4.4)")
 $ e_m \( j + 1 \) lt.eq F \( q \, e_k \( j \) \, A \( m \, j \) \) . $ <be:step>]

 In particular, an upper bound strictly below one on the right proves $c_(j + 1) > 0$ without presupposing it.]
] <be:recurrence>

#proof[
  At the new temperature, (4.2) yields $B_m \( j + 1 \) - c_(j + 1) lt.eq q \[ B_k \( j + 1 \) - c_(j + 1) \]$.
    Subtract and rearrange to obtain
  $ e_m \( j + 1 \) lt.eq frac(q, 1 - q) (frac(B_k \( j + 1 \), B_m \( j + 1 \)) - 1) . $
  Write $r_j = lambda_(j + 1) \/ lambda_j^2$. From the definitions,
  #[#set math.equation(numbering: n => "(4.5)")
   $ frac(B_k \( j + 1 \), B_m \( j + 1 \)) = frac(A \( k \, j \), A \( m \, j \))
     (frac(B_k \( j \), B_m \( j \)))^2 r_j^(m - k) . $ <be:ratio>]
  Section 3 gives $r_j lt.eq 1$, and physical purity gives $A \( k \, j \) lt.eq 1$.
    The hypothesis $e_k \( j \) < 1$ implies $c_j > 0$, and $B_m \( j \) gt.eq
    c_j$ gives $B_k \( j \) \/ B_m \( j \) lt.eq \( 1 - e_k \( j \) \)^(- 1)$. Substitution proves (4.4).
    Only the old overlap $c_j$ has been divided by. The new overlap follows from $e_m \( j + 1 \) <
    1$ and $B_m \( j + 1 \) > 0$. ◻
]

To couple this residual estimate to physical purity, we use a shorter reference length for the boundary defect.
  Recall $M_j = 240 thin 2^(j - 2)$ and $u_j$ from Proposition 6. For $j gt.eq 2$ let

#[#set math.equation(numbering: n => "(4.6)")
 $ k_2 = 142 \, wide k_(j + 1) = M_j . $ <be:k>]

We track upper bounds $E_j$ on $e_(k_j) \( j \)$ and $eta_j$ on $1 - A \( M_j \, j \)$.
  The difference $M_j - k_j$ supplies residual contraction at the next temperature.
  Its output at length $k_(j + 1) = M_j$ then controls the ratio $B_(2 M_j) \( j + 1 \) \/
  B_(M_j) \( j + 1 \)$ needed to improve physical purity. The notation $eta_j$ denotes only this physical purity defect.

#thm([Proposition 4.2.])[
  (Coupled boundary update).  #emph[Suppose $j gt.eq 2$, $0 lt.eq E_j \, eta_j < 1$, and
$ e_(k_j) \( j \) lt.eq E_j \, wide A \( M_j \, j \) gt.eq 1 - eta_j . $

 Let $E_(j + 1) \, eta_(j + 1) in \[ 0 \, 1 \)$ satisfy
#[#set math.equation(numbering: n => "(4.7)")
 $ E_(j + 1) & gt.eq F (d \( u_(j + 1) \)^(\( M_j - k_j \) \/ M_j) \, E_j \, 1 - eta_j) \,\
eta_(j + 1) & gt.eq f (1 - \( 1 - eta_j \) \( 1 - u_j \) \( 1 - u_(j + 1) \) \( 1 - E_(j + 1) \)) . $ <be:Eupdate>]

 Then $e_(k_(j + 1)) \( j + 1 \) lt.eq E_(j + 1)$ and $A \( M_(j + 1) \, j + 1 \) gt.eq 1 - eta_(j + 1)$.]
] <be:coupled>

#proof[
  Here $M_j > k_j$ and $n_(j + 1) = M_j$. The periodic residual bound gives
  $ rho_(j + 1)^(M_j - k_j) lt.eq d \( u_(j + 1) \)^(\( M_j - k_j \) \/ M_j) < 1 . $
  The function $F$ increases in $q \, e$ and decreases in $t$ on the stated domains.
    Lemma 7 therefore proves (4.7)’s conclusion, including $c_(j + 1) > 0$.
  Put $M = M_j$. Exact cancellation in (4.1) gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ frac(A \( 2 M \, j \), A \( M \, j \)) = r_j^M frac(B_(2 M) \( j + 1 \), B_M \( j + 1 \))
     (frac(B_M \( j \), B_(2 M) \( j \)))^2 . $ <be:physical-cancellation>]
  The squared factor is at least one, and the first boundary ratio is at least $c_(j + 1) \/ B_M \( j + 1 \) gt.eq
    1 - E_(j + 1)$. Thus Proposition 6 gives
  $ A \( 2 M \, j \) gt.eq \( 1 - eta_j \) \( 1 - u_j \) \( 1 - u_(j + 1) \) \( 1 - E_(j + 1) \) . $
  At the fixed physical length $2 M$, passing from $b_j$ to $b_(j + 1)$ normalizes the squares of the Gibbs
    probabilities. Lemma 3 bounds the resulting defect by $f$ of the preceding defect.
    Since $M_(j + 1) = 2 M$, this is (4.7). ◻
]

== 5 Finite initialization and quadratic improvement <sec:initialization>

We now initialize the boundary recurrence and show that it continues indefinitely.
  The sixth boundary moment starts a sequence of residual estimates at $\( 34 \, b_0 \)$, $\( 78 \, b_1 \)$,
  and $\( 142 \, b_2 \)$. A physical-purity estimate at $\( 240 \, b_2 \)$ then starts the coupled update.
  The inputs are four variational energies and thermal moments on at most six sites.

#thm([Proposition 5.1.])[
  (Finite boundary data).  #emph[Let $alpha = .4042$ and $P_(*) \( x \) = x^3 - .14 x^2 - .18 x$.
    For the opposite-field Hamiltonian (2.2),
#[#set math.equation(numbering: n => "(5.1)")
 $ E_0 \( H_m^(upright("opp")) \) + a m < alpha wide \( m = 34 \, 78 \, 142 \, 240 \) . $ <in:trials>]

 At inverse temperature $b_0$,
#[#set math.equation(numbering: n => "(5.2)")
 $ Y_6 \( b_0 \) < .027 \, wide c_0 P_(*) \( lambda_0 \)^2 < .003745 . $ <in:thermal>]

]
] <in:finite>

#proof[
  Proposition 17 proves (5.1) with explicit integer trial vectors.
    Proposition 15 proves (5.2) by finite thermal recurrences with certified rounding errors.
    The appendices give all matrix and boundary data and the precise finite inequalities. ◻
]

=== 5.1 Starting residual and physical-purity bounds <starting-residual-and-physical-purity-bounds>

The thermal estimates bound the residual and leading contributions to $Y_m \( b_0 \)$,
  while the variational estimate supplies a lower bound for one ground weight.
  Keep $ell \, U$ from the periodic seed and define, for each of the four lengths in (5.1),

#[#set math.equation(numbering: n => "(5.3)")
 $ epsilon.alt \( m \) = .027 e^(b_0 alpha) U^m .874^(m - 6) / ell^6 \, wide R \( m \) = e^.132 U^m +
   epsilon.alt \( m \) - 1 . $ <in:epsR>]

#thm([Lemma 5.2.])[
  #emph[At these four lengths,
#[#set math.equation(numbering: n => "(5.4)")
 $ e_m \( 0 \) lt.eq epsilon.alt \( m \) \, wide A \( m \, j \) gt.eq #scale(x: 120%, y: 120%)[\(] 1 +
   R \( m \)^(2^j) #scale(x: 120%, y: 120%)[\)]^(- 2) quad \( j gt.eq 0 \) . $ <in:seedineq>]

]
] <in:seedbounds>

#proof[
  By (4.2), $rho_0 lt.eq .874$, and $ell < lambda_0 lt.eq U$,
  $ lambda_0^m D_m \( 0 \) lt.eq U^m .874^(m - 6) frac(Y_6 \( b_0 \), ell^6) < e^(- b_0 alpha) epsilon.alt \( m \) . $
  The trial bound supplies a physical ground weight greater than $e^(- b_0 alpha)$ and hence $Y_m \( b_0 \) >
    e^(- b_0 alpha)$. Dividing gives the first inequality.
  To bound the full physical partition function from above, factor $P_(*) \( x \) =
    x \( x - 1 \/ 2 \) \( x + 9 \/ 25 \)$. On $\[ ell \, U \]$ it is positive and $x P'_(*) \( x \) < 4
    P_(*) \( x \)$. For example the latter is the positivity of $4 P_(*) \( x \) - x P'_(*) \( x \) =
    x \( x^2 - .28 x - .54 \)$ on this interval. It follows that $x^m \/ P_(*) \( x \)^2$ is increasing for $m >
    8$. Consequently (5.2) gives
  $ e^(b_0 alpha) lambda_0^m c_0 lt.eq U^m frac(.003745 e^(b_0 alpha), P_(*) \( U \)^2) < e^.132 U^m . $
  The last scalar comparison has left coefficient below $1.133226$, whereas $e^.132 > 1.141108$.
    Combining the leading and residual estimates yields $e^(b_0 alpha) Y_m \( b_0 \) lt.eq 1 + R \( m \)$.
  Select one physical ground eigenvector; uniqueness is not needed.
    Its unnormalized weight $g$ is greater than $e^(- b_0 alpha)$,
    so the sum of the remaining weights divided by $g$ is at most $R \( m \)$. In particular $R \( m \) gt.eq 0$.
    At $b_j = 2^j b_0$, the corresponding rest-to-ground ratio is at most $R \( m \)^(2^j)$,
    since a sum of nonnegative $2^j$th powers is at most the $2^j$th power of the sum.
    The purity is at least the square of the normalized weight of this chosen ground eigenvector.
    This proves the second inequality. ◻
]

In particular $epsilon.alt \( 34 \) < .0928 < 1$, proving $c_0 > 0$.
  The estimates $rho_1 lt.eq .953$ and $rho_2 lt.eq .971$ now allow two applications of Lemma 7:

#[#set math.equation(numbering: n => "(5.5)")
 $ e_78 \( 1 \) & lt.eq F #scale(x: 120%, y: 120%)[\(] .953^44 \, .093 \, \( 1 + R \( 78 \) \)^(- 2)
   #scale(x: 120%, y: 120%)[\)] < .133 \,\
e_142 \( 2 \) & lt.eq F #scale(x: 120%, y: 120%)[\(] .971^64 \, .133 \, \( 1 + R \( 142 \)^2 \)^(- 2)
  #scale(x: 120%, y: 120%)[\)] < .14 . $ <in:78>]

The bound at $m = 240$, $j = 2$ gives $1 - A \( 240 \, 2 \) < .21$. Thus the induction of Proposition 8 starts with

#[#set math.equation(numbering: n => "(5.6)")
 $ E_2 = .14 \, wide eta_2 = .21 . $ <in:initial>]

Both new leading overlaps have also been proved positive by the strict defect bounds;
  no overlap was assumed at the next temperature.

=== 5.2 Explicit finite comparisons <explicit-finite-comparisons>

We record numerical margins to make the initialization reproducible. The three lower bounds from Lemma 10 used above are

#[#set math.equation(numbering: n => "(5.7)")
 $ \( 1 + R \( 78 \) \)^(- 2) & > .6180 \,\
\( 1 + R \( 142 \)^2 \)^(- 2) & > .7533 \,\
\( 1 + R \( 240 \)^4 \)^(- 2) & > .7923 . $ <in:puritynumbers>]

Using the full expressions in (5.3) gives upper outputs below $.132129$, $.137301$, and $.207518$ in (5.5), (5.5),
  and $1 - A \( 240 \, 2 \)$ respectively. The lower bounds in (5.7) are rounded for display.

Starting from (5.6), the following rounded bounds satisfy Proposition 8:

#[#set math.equation(numbering: n => "(5.8)")
 $ j & E_j & eta_j & upright("upper bound on the ") q upright(" used for step ") j arrow.r j + 1\
2 & .14 & .21 & .142\
3 & .12 & .155 & .0282\
4 & .016 & .026 & .0028\
5 & .001 & .001 & upright("—") $ <in:table>]

The exponents $\( M_j - k_j \) \/ M_j$ are $98 \/ 240$, $1 \/ 2$, $1 \/ 2$.
  The successive upper outputs for $E_(j + 1)$ are below $.117754 \, .015328 \, .000170$;
  those for $eta_(j + 1)$ are below $.147078 \, .025188 \, .000432$.
  In computing the latter outputs one uses the displayed rounded $E_(j + 1)$, so each line closes with the next.

For clarity, all the scalar comparisons here and in the periodic initialization have an elementary rational
  verification. For $0 lt.eq t lt.eq 10$, put $T_80 \( t \) = sum_(r = 0)^80 t^r \/ r !$. Then

#[#set math.equation(numbering: n => "(5.9)")
 $ T_80 \( t \) lt.eq e^t lt.eq T_80 \( t \) + 2 t^81 \/ 81 ! . $ <in:exp-enclosure>]

Indeed the ratio of consecutive omitted terms is at most $10 \/ 82 < 1 \/ 2$.
  For negative exponents use reciprocal intervals. Rational positive root comparisons can be checked by raising
  both sides to their integer powers; for example the first $q$ bound in (5.8) is $d \( u_3 \)^49 < .142^120$.
  Every denominator is positive. These rules, exact rational input values,
  and the displayed formulas suffice to verify the finite comparisons without floating-point assumptions.
  The supplementary scalar certificate records all of them.

=== 5.3 Indefinite continuation <indefinite-continuation>

We now enlarge the three defect bounds at $j = 5$ to $.01$ so that a single quadratic recurrence controls all
  later levels.

#thm([Proposition 5.3.])[
  #emph[Define $x_5 = .01$ and $x_(j + 1) = 10 x_j^2$ for $j gt.eq 5$. Then, for every $j gt.eq 5$,
#[#set math.equation(numbering: n => "(5.10)")
 $ u_j lt.eq x_j \, wide e_(k_j) \( j \) lt.eq x_j \, wide 1 - A \( M_j \, j \) lt.eq x_j . $ <in:common>]

 In particular
#[#set math.equation(numbering: n => "(5.11)")
 $ x_j = 10^(- 1 - 2^(j - 5)) . $ <in:xexplicit>]

]
] <in:quadratic>

#proof[
  The table proves the two boundary inequalities at $j = 5$, and $u_5 < .000015 < .01$.
    Suppose (5.10) holds, and write $x = x_j lt.eq .01$. Here $k_j = M_j \/ 2$ and $u_(j + 1) = 6 u_j^2 lt.eq
    6 x^2$. The first argument of $F$ in (4.7) satisfies
  $ sqrt(d \( u_(j + 1) \)) lt.eq sqrt(frac(6 x^2, 2 - 18 x^2)) lt.eq 2 x . $
  The first output is therefore bounded by $F \( 2 x \, x \, 1 - x \)$. For $x > 0$, division by $x^2$ gives
  $ frac(F \( 2 x \, x \, 1 - x \), x^2) = frac(2, 1 - 2 x)
    #scale(x: 120%, y: 120%)[\(] \( 1 - x \)^(- 1) + \( 1 - x \)^(- 2) + \( 1 - x \)^(- 3)
    #scale(x: 120%, y: 120%)[\)] . $
  This expression is increasing on $\[ 0 \, .01 \]$ after its continuous extension at zero.
    Its endpoint value is $42430000 \/ 6792093 < 10$. Thus we may take $E_(j + 1) = 10 x^2$.
  For factors in $\[ 0 \, 1 \]$, the defect of their product is at most the sum of their defects.
    Thus the four-factor product in (4.7) has defect at most $x + x + 6 x^2 + 10 x^2 = 2 x + 16 x^2$. Moreover
  $ frac(f \( 2 x + 16 x^2 \), x^2) = frac(\( 2 + 16 x \)^2, 2 \( 1 - 2 x - 16 x^2 \)^2) $
  is increasing on $\[ 0 \, .01 \]$ and has endpoint value $3645000 \/ 1495729 < 10$.
    Thus we may also take $eta_(j + 1) = 10 x^2$. Finally $u_(j + 1) lt.eq 6 x^2 lt.eq 10 x^2$.
    This proves (5.10) at the next level; the sequence remains in $\[ 0 \, .01 \]$.
    Solving its recurrence gives (5.11). ◻
]

== 6 Same fields, odd lengths, and the physical gap <sec:conclusion>

The estimates obtained so far concern even moments of the opposite-field chain.
  We now use the rotation-invariant leading line to control the same-field partition function at every odd length
  in a dyadic interval.

#thm([Lemma 6.1.])[
  (Signed boundary comparison).  #emph[For $j gt.eq 0$, an even $M gt.eq 2$, and any integer $n gt.eq M$,
    define $Q_j \( n \) = Y_n^(upright(s)) \( b_j \) \/ lambda_j^n$. Then
#[#set math.equation(numbering: n => "(6.1)")
 $ \| Q_j \( n \) - c_j \| lt.eq B_M \( j \) - c_j . $ <co:error>]

]
] <co:signed>

#proof[
  The leading spatial line is fixed by $U_P$, and its eigenvalue is $+ lambda_j$.
    Thus its contribution to $Q_j \( n \)$ is exactly $c_j$. For every other eigenvalue $xi$ of $X_(b_j)$,
    let $P_xi$ be its spectral projection. The unitary $U_P$ commutes with that projection, so Cauchy–Schwarz gives
  $ \| chevron.l P_xi v_(b_j) \, U_P P_xi v_(b_j) chevron.r \| lt.eq lr(bar.v.double P_xi v_(b_j) bar.v.double)^2 . $
  Consequently the absolute residual is at most
  $ sum_(xi eq.not lambda_j) \( \| xi \| \/ lambda_j \)^n lr(bar.v.double P_xi v_(b_j) bar.v.double)^2 lt.eq
    B_M \( j \) - c_j . $
  The series converges absolutely, being bounded by $lr(bar.v.double v_(b_j) bar.v.double)^2$.
    The kernel of $X_(b_j)$ contributes zero because all exponents are positive.
    Negative spatial eigenvalues and odd powers are therefore included in the estimate. ◻
]

One concentrated even moment therefore controls the normalized same-field pairing $Q_j \( n \)$ at every longer
  length, including odd lengths. To compare two temperatures, we use the common even reference length $M_j =
  k_(j + 1)$. The lower bound for $r_j^(M_j)$ will cover the interval $M_j lt.eq n lt.eq 2 M_j$.

#thm([Proposition 6.2.])[
  #emph[For $j gt.eq 5$ and every integer $n$ with $M_j lt.eq n lt.eq 2 M_j$,
#[#set math.equation(numbering: n => "(6.2)")
 $ frac(Y_n^(upright(s)) \( b_(j + 1) \), Y_n^(upright(s)) \( b_j \)^2) gt.eq 1 - 4 x_j . $ <co:purity-bound>]

]
] <co:purity>

#proof[
  Put $M = M_j$. At temperature $b_j$, Lemma 12 gives $Q_j \( n \) lt.eq B_M \( j \)$.
    This upper bound can be squared because the physical partition function, and hence $Q_j \( n \)$, is positive.
    At temperature $b_(j + 1)$, use the same even length $M = k_(j + 1)$:
  $ Q_(j + 1) \( n \) gt.eq 2 c_(j + 1) - B_M \( j + 1 \) gt.eq \( 1 - 2 x_(j + 1) \) B_M \( j + 1 \) > 0 . $
  The last step uses Proposition 11. It follows that
  #[#set math.equation(numbering: n => "(6.3)")
   $ frac(Y_n^(upright(s)) \( b_(j + 1) \), Y_n^(upright(s)) \( b_j \)^2) & gt.eq \( 1 - 2 x_(j + 1) \)
     A \( M \, j \) r_j^(n - M)\
 & gt.eq \( 1 - 2 x_(j + 1) \) \( 1 - x_j \) \( 1 - u_j \) \( 1 - u_(j + 1) \) . $ <co:product>]
  Indeed $0 < r_j lt.eq 1$ and $0 lt.eq n - M lt.eq M$ give $r_j^(n - M) gt.eq
    r_j^M gt.eq \( 1 - u_j \) \( 1 - u_(j + 1) \)$. Using $x_(j + 1) = 10 x_j^2$, $u_j lt.eq x_j$,
    and $u_(j + 1) lt.eq 6 x_j^2$, the defect of the last product is at most
  $ 20 x_j^2 + x_j + x_j + 6 x_j^2 = 2 x_j + 26 x_j^2 lt.eq 4 x_j \, $
  as $x_j lt.eq .01$. This proves (6.2). ◻
]

#proof[
  Fix an odd $n$ in $\[ M_j \, 2 M_j \]$ with $j gt.eq 5$. Let $p_0 gt.eq p_1 gt.eq
    dots.h.c$ be the Gibbs probabilities of $H_n^(upright(s))$ at inverse temperature $b_j$,
    listing energies with multiplicity. The left side of (6.2) is $sum_i p_i^2$.
    Since $sum_i p_i^2 lt.eq p_0 sum_i p_i = p_0$, we have $p_0 gt.eq 1 - 4 x_j > 1 \/ 2$.
    In particular the physical ground state is simple, and
  #[#set math.equation(numbering: n => "(6.4)")
   $ e^(- b_j \( E_1 - E_0 \)) = p_1 / p_0 lt.eq frac(1 - p_0, p_0) lt.eq
     frac(4 x_j, 1 - 4 x_j) < 10^(- 2^(j - 5)) . $ <co:ratio>]
  For the strict last inequality, use (5.11) and $4 \/ \[ 10 \( 1 - .04 \) \] < 1$.
    Because $b_j = 392 thin 2^(j - 5)$, taking logarithms yields $E_1 - E_0 > log \( 10 \) \/ 392$.
  Finally $M_5 = 1920$ and $M_(j + 1) = 2 M_j$. The intervals $\[ M_j \, 2 M_j \]$, $j gt.eq 5$,
    cover every integer $n gt.eq 1920$. Every odd length $n = 2 L + 1$ with $L gt.eq 960$ is therefore covered.
    Relabeling the sites gives precisely (1.1), with the single field $h = 3 \/ 5$ fixed in (2.1). ◻
]

== 7 The boundary-selected infinite-volume state <sec:topology>

The gap just proved supplies the hypothesis of Tasaki’s topological-index theorem.
  We formulate the consequence for subsequential local limits,
  so that no convergence or uniqueness of the infinite-volume state is presupposed.

A local observable is a matrix acting on finitely many sites of $bb(Z)$,
  extended by the identity on the other sites. A state on these observables is a normalized positive linear
  functional. Write $phi.alt_L$ for a normalized ground vector of $H_L \( 3 \/ 5 \)$ and set $omega_L \( A \) =
  chevron.l phi.alt_L \, A phi.alt_L chevron.r$ whenever the support of $A$ lies in $\[ - L \, L \]$.
  For $L gt.eq 960$ the vector is unique up to phase by Theorem 1, so this functional is well defined.
  Compactness of the density matrices on each finite interval,
  followed by a diagonal subsequence over the intervals, gives integers $L_k arrow.r oo$ for which

#[#set math.equation(numbering: n => "(7.1)")
 $ omega \( A \) = lim_(k arrow.r oo) omega_(L_k) \( A \) $ <top:limit>]

exists for every local observable. The limits are consistent on nested intervals and therefore define a state.
  We call any such state #emph[boundary-selected].

The bulk Hamiltonian is the formal sum $H_(upright("bulk")) = sum_(j in bb(Z)) S_j dot.op S_(j + 1)$.
  For a local $A$, its commutator $\[ H_(upright("bulk")) \, A \]$ is the finite sum of the commutators with bonds
  meeting the support of $A$. To specify the index, for $epsilon > 0$ define the local twist

#[#set math.equation(numbering: n => "(7.2)")
 $ U_epsilon = exp [- i sum_(j in bb(Z) ∩ \[ - pi \/ epsilon \, pi \/ epsilon \]) \( pi + epsilon j \) S_j^z] .
   $ <top:twist>]

The rotations by $0$ and $2 pi$ outside this interval act trivially for spin one.
  For the symmetric gapped states considered below, Tasaki’s theorem guarantees the existence of the index
  $"Ind" \( omega \) = lim_(epsilon arrow.b 0) omega \( U_epsilon \) in { - 1 \, 1 }$;
  we use precisely the twist convention in #cite(label("Tasaki2025")) Equations (10)–(13).

#thm([Corollary 7.1.])[
  #emph[Every boundary-selected state (7.1) is invariant under uniform rotations about the $z$ axis and under
    reflection $j mapsto - j$. With $gamma_(*) = \( log 10 \) \/ 392$, it satisfies
#[#set math.equation(numbering: n => "(7.3)")
 $ omega #scale(x: 120%, y: 120%)[\(] A^(*) \[ H_(upright("bulk")) \, A \] #scale(x: 120%, y: 120%)[\)] gt.eq
   gamma_(*) #scale(x: 120%, y: 120%)[\(] omega \( A^(*) A \) - \| omega \( A \) \|^2 #scale(x: 120%, y: 120%)[\)]
   wide upright("for every local ") A . $ <top:local-gap>]

 In particular it is a locally-unique gapped ground state in the sense of #cite(label("Tasaki2025")) Definition
   11, and its Tasaki index is $- 1$.]
] <cor:topology>

#proof[
  Both finite-volume symmetries commute with $H_L \( 3 \/ 5 \)$.
    Simplicity of the ground eigenspace implies invariance of $omega_L$ under them;
    passing to (7.1) proves the asserted invariances.
  For $L gt.eq 960$, the finite spectral theorem and Theorem 1 give
  $ chevron.l A phi.alt_L \, \( H_L \( 3 \/ 5 \) - E_0 \( L \, 3 \/ 5 \) \) A phi.alt_L chevron.r gt.eq
    gamma_(*) #scale(x: 120%, y: 120%)[\(] omega_L \( A^(*) A \) - \| omega_L \( A \) \|^2
    #scale(x: 120%, y: 120%)[\)] . $
  The expression on the left is $omega_L \( A^(*) \[ H_L \( 3 \/ 5 \) \, A \] \)$.
    Once the support of $A$ and its adjacent sites lie strictly inside $\[ - L \, L \]$,
    this commutator equals $\[ H_(upright("bulk")) \, A \]$: the endpoint fields and all omitted bonds commute
    with $A$. Taking the limit proves (7.3). Its right side is nonnegative by the Cauchy–Schwarz inequality for a
    state; for $omega \( A \) = 0$ it is the local gap inequality.
    The strict finite-volume lower bound has consequently yielded the non-strict lower bound $gamma_(*)$ in the limit.
  Finally the Hamiltonians, spin normalization and endpoint-field signs are exactly those of
    #cite(label("Tasaki2025")) Equation (2). Theorem 1 verifies that paper’s Assumption 2 with the single field
    $h = 3 \/ 5$, $L_0 = 960$ and $gamma = gamma_(*)$. Its Theorem 3,
    with the subsequential interpretation specified in its End Matter, Equation (27),
    therefore applies to every state (7.1). To make the sign and limit order explicit,
    Tasaki’s finite-chain twist interpolation begins at the uniform $pi$ rotation.
    Its expectation is $- 1$, because the finite ground state has total $S^z = 1$ by that paper’s Lemma 1.
    Reflection makes the twist expectation real, and the uniform gap prevents it from crossing zero while the
    twist parameter is sufficiently small. More precisely, #cite(label("Tasaki2025")) Lemmas 6–8 and Equations
    (17)–(18) gives, for every sufficiently small fixed $epsilon > 0$ and all sufficiently large $L$,
  $ - 1 lt.eq omega_L \( U_epsilon \) lt.eq - sqrt(1 - frac(4 \( pi + epsilon \) epsilon, gamma_(*))) . $
  Here $L gt.eq pi \/ epsilon$ ensures that the finite-chain twist equals the local operator (7.2).
    Passing first to (7.1) and then letting $epsilon arrow.b 0$ gives $"Ind" \( omega \) = - 1$. ◻
]

The corollary evaluates the twist index for the selected states.
  It does not require the full sequence $omega_L$ to converge or identify these states with every ground state of
  the infinite chain. In particular, the additional global uniqueness hypothesis of the half-chain conclusion in
  #cite(label("Tasaki2025")) Corollary 4 is not part of our result.

== 8 Certified short-chain thermal moments <app:thermal>

This appendix proves the two short-chain estimates used to initialize the boundary argument.
  Throughout, $h = 3 \/ 5$, $a = 700741 \/ 500000$, and $b_0 = 49 \/ 4$.
  All terminating decimals below denote exact rational numbers.

#thm([Proposition 8.1.])[
  #emph[Let $lambda_0$ be the positive leading eigenvalue of $X_(b_0)$,
    and let $c_0$ be the squared norm of the projection of $v_(b_0)$ onto its eigenspace. For
$ P_(*) \( x \) = x^3 - .14 x^2 - .18 x \, $

 one has
#[#set math.equation(numbering: n => "(8.1)")
 $ Y_6 \( b_0 \) < .027 \, wide c_0 P_(*) \( lambda_0 \)^2 < .003745 . $ <appth:conclusions>]

]
] <appth:bounds>

The first bound controls the residual contribution to $Y_m \( b_0 \)$ in Lemma 10;
  the second controls the leading contribution. We first reduce both bounds to fifteen short-chain partition
  functions, then enclose these traces using matrices of order at most $3^6 = 729$.

=== 8.1 Reduction to fifteen thermal traces <reduction-to-fifteen-thermal-traces>

For $2 lt.eq n lt.eq 6$ and $g in { 1 \, - 1 \, 0 }$, define

#[#set math.equation(numbering: n => "(8.2)")
 $ H_(n \, g) & = sum_(j = 0)^(n - 2) upright(bold(S))_j dot.op upright(bold(S))_(j + 1) - 3 / 5 S_0^z + 3 /
   5 R_g \, & R_g & = cases(delim: "{", g S_(n - 1)^z \, & g = 1 \, - 1 \,, S_(n - 1)^x \, & g = 0 \,)\
Z_(n \, g) & = "Tr" exp \[ - b_0 \( H_(n \, g) + a n I \) \] . $ <appth:H>]

Thus $Z_(n \, 1) = Y_n \( b_0 \)$ and $Z_(n \, - 1) = Y_n^(upright(s)) \( b_0 \)$.
  The first bound in Proposition 15 concerns $Z_(6 \, 1)$. For the second,
  average the right-field direction over the rotation group.

Let $cal(G)$ be the rotation group generated by the diagonal half-turns and the cyclic permutation of the
  coordinate axes, and let

$ Pi = frac(1, \| cal(G) \|) sum_(gamma in cal(G)) U_gamma \, wide I \( n \) = chevron.l v_(b_0) \,
  X_(b_0)^n Pi v_(b_0) chevron.r . $

The group has order $12$, and the orbit of $z$ is the six signed coordinate axes, each with the same multiplicity.
  The boundary transfer identity therefore writes $I \( n \)$ as the average of the six corresponding right-field
  partition functions. Global rotations about $z$ identify the four perpendicular orientations. Hence

#[#set math.equation(numbering: n => "(8.3)")
 $ I \( n \) = frac(Z_(n \, 1) + Z_(n \, - 1) + 4 Z_(n \, 0), 6) . $ <appth:average>]

The averaging operator $Pi$ is an orthogonal projection commuting with $X_(b_0)$.
  By Proposition 6, $cal(G)$ fixes the leading line pointwise. Therefore

#[#set math.equation(numbering: n => "(8.4)")
 $ c_0 P_(*) \( lambda_0 \)^2 & lt.eq parallel P_(*) \( X_(b_0) \) Pi v_(b_0) parallel^2\
 & = chevron.l v_(b_0) \, P_(*) \( X_(b_0) \)^2 Pi v_(b_0) chevron.r\
 & = I \( 6 \) - .28 I \( 5 \) - .3404 I \( 4 \) + .0504 I \( 3 \) + .0324 I \( 2 \) . $ <appth:polynomial>]

In particular, no positivity of the individual odd powers of $X_(b_0)$ is being assumed.

It therefore suffices to enclose $Z_(n \, g)$ for $2 lt.eq n lt.eq 6$ and $g in { 1 \, - 1 \, 0 }$.
  The remaining subsections provide these enclosures and evaluate (8.4).

=== 8.2 An integer matrix for the thermal approximation <an-integer-matrix-for-the-thermal-approximation>

Set

#[#set math.equation(numbering: n => "(8.5)")
 $ C_n = 3 ⌊frac(n - 1, 2)⌋ + 2 #scale(x: 120%, y: 120%)[\(] \( n - 1 \) med mod med
   2 #scale(x: 120%, y: 120%)[\)] + 6 / 5 \, wide A = I - frac(H_(n \, g) + C_n I, 8) . $ <appth:C>]

The operator $A$ is a self-adjoint contraction. Here is a direct verification with the spin normalization in the
  theorem. A single bond has eigenvalues $- 2 \, - 1 \, 1$.
  For two consecutive bonds, couple the two outside spins to spin $t in { 0 \, 1 \,
  2 }$ and then couple this with the middle spin to total spin $j$. The operator

$ upright(bold(S))_1 dot.op upright(bold(S))_2 + upright(bold(S))_2 dot.op upright(bold(S))_3 =
  upright(bold(S))_2 dot.op \( upright(bold(S))_1 + upright(bold(S))_3 \) $

has eigenvalues $\[ j \( j + 1 \) - t \( t + 1 \) - 2 \] \/ 2$, with $\| t - 1 \| lt.eq j lt.eq t + 1$.
  Its minimum is $- 3$. Pairing consecutive bonds, with one single bond left over if necessary,
  and using the total boundary-field norm $6 \/ 5$ gives

$ 0 lt.eq H_(n \, g) + C_n I lt.eq (n - 1 + 6 / 5 + C_n) I lt.eq 16 I . $

Adding the lower bounds for the paired bonds is valid even where the three-site supports overlap.
  In order $n = 2 \, dots.h \, 6$, the displayed upper bounds are $5.4 \, 7.4 \, 10.4 \, 12.4 \, 15.4$.
  Thus $- I lt.eq A lt.eq I$; positivity of $A$ itself is not required.

Index the spin-weight basis by words $w = \( w_0 \, dots.h \, w_(n - 1) \)$ in ${ - 1 \, 0 \, 1 }^n$, and let

$ p_w = (sum_(j = 0)^(n - 1) w_j) med mod med 2 in { 0 \, 1 } \, wide J_(w w) = sqrt(1 + p_w) \, wide D =
  80 J A J^(- 1) . $

The matrix $D$ is integral. Indeed, its diagonal is

#[#set math.equation(numbering: n => "(8.6)")
 $ eta \( w \) = 80 - 10 C_n - 10 sum_(j = 0)^(n - 2) w_j w_(j + 1) + 6 w_0 - 6 g w_(n - 1) . $ <appth:diagonal>]

Each allowed bond hop $w arrow.l.r w + sigma \( upright(bold(e))_j - upright(bold(e))_(j + 1) \)$, $sigma =
  plus.minus 1$, has entry $- 10$: the corresponding entry of the spin-one bond is $1$,
  and such a hop preserves $p_w$. When $g = 0$, an allowed end hop from column $r = w +
  sigma upright(bold(e))_(n - 1)$ to row $w$ has entry $- 3 \( 1 + p_w \)$.
  To see this coefficient, the end-field entry before similarity is $3 sqrt(2) \/ 10$,
  and the two parities are opposite, so

$ - 10 frac(3 sqrt(2), 10) sqrt(frac(1 + p_w, 1 + p_r)) = - 3 \( 1 + p_w \) . $

These are all the entries of $D$.

=== 8.3 The exact recurrence <the-exact-recurrence>

The recurrence approximates the half-temperature exponential

$ E = exp \[ - b_0 \( H_(n \, g) + C_n I \) \/ 2 \] = e^(- 49) exp \( 49 A \) . $

For a finite matrix $M$, write $parallel M parallel_(upright(F))^2 =
  "Tr" \( M^(*) M \)$ for its squared Frobenius norm. Since $E$ is self-adjoint,
  $parallel E parallel_(upright(F))^2$ is the thermal trace $"Tr" exp \[ - b_0 \( H_(n \, g) + C_n I \) \]$.
  We approximate $E$ by a normalized Poisson polynomial in the contraction $A$; the similarity $D =
  80 J A J^(- 1)$ permits an integer Horner recurrence.

Put

#[#set math.equation(numbering: n => "(8.7)")
 $ K = 192 \, wide Q = 2^50 \, wide s_i = frac(49^i K !, i !) \, wide S_K = sum_(i = 0)^K s_i \, wide
   t_i = ⌊frac(Q s_i, S_K)⌋ . $ <appth:coefficients>]

Starting with the zero matrix $cal(X)_(K + 1)$, compute

#[#set math.equation(numbering: n => "(8.8)")
 $ cal(X)_i = ⌊frac(D cal(X)_(i + 1), 80)⌋ + t_i I \, wide i = K \, K - 1 \, dots.h \, 0 . $ <appth:horner>]

Matrix floors are entrywise, and every floor, including one with a negative argument, is toward $- oo$. Define

#[#set math.equation(numbering: n => "(8.9)")
 $ hat(E) = J^(- 1) cal(X)_0 / Q J \, wide W_(n \, g) = parallel hat(E) parallel_(upright(F))^2 . $ <appth:W>]

For completeness, the following scalar version specifies the recurrence without matrix construction.
  Number words, if desired, by $sum_j \( w_j + 1 \) 3^j$, and interpret a lookup outside ${ - 1 \, 0 \,
  1 }^n$ as zero. Initialize $x \( w \, r \) = 0$ for all pairs of words.
  At stage $i = K \, dots.h \, 0$, use the current array to form

#[#set math.equation(numbering: n => "(8.10)")
 $ z \( w \, r \) =  & eta \( w \) x \( w \, r \) - 10 sum_(j = 0)^(n - 2) sum_(sigma = plus.minus 1) x
   #scale(x: 120%, y: 120%)[\(] w + sigma \( upright(bold(e))_j - upright(bold(e))_(j + 1) \) \,
   r #scale(x: 120%, y: 120%)[\)]\
 & #h(5mm)  - upright(bold(1))_({ g = 0 }) thin 3 \( 1 + p_w \) sum_(sigma = plus.minus 1)
   x \( w + sigma upright(bold(e))_(n - 1) \, r \) \,\
x_(upright("new")) \( w \, r \) =  & t_i upright(bold(1))_({ w = r }) + ⌊frac(z \( w \, r \), 80)⌋ . $ <appth:scalar>]

Replace all entries simultaneously. At the end, the required table entry is the integer quotient

#[#set math.equation(numbering: n => "(8.11)")
 $ k_(n \, g) := ⌊10^16
   W_(n \, g)⌋ = ⌊frac(10^16 sum_(w \, r) x \( w \, r \)^2 \( 2 - p_w \) \( 1 + p_r \), 2 Q^2)⌋ . $ <appth:quotient>]

The weight follows from $\( 1 + p_r \) \/ \( 1 + p_w \) = \( 2 - p_w \) \( 1 + p_r \) \/ 2$.
  All operations in (8.7), (8.10), and (8.11) are integer operations;
  they may be performed with arbitrary-precision integers.

The resulting fifteen entries are

#[#set math.equation(numbering: n => "(8.12)")
 $ n without g & 1 & - 1 & 0\
2 & 10185296075298 & 4160017987 & 583578389575\
3 & 259254948723 & 571111660440989 & 47796720049308\
4 & 318278534893 & 661347985 & 43971049724\
5 & 260908126900 & 29917222640283 & 5659378873682\
6 & 16467340956 & 328219854 & 4086161507 $ <appth:integer-table>]

Equations (8.7), (8.10), and (8.11) provide a finite exact-arithmetic verification of every entry.

=== 8.4 Error of the matrix approximation <error-of-the-matrix-approximation>

#thm([Lemma 8.2.])[
  #emph[For every pair $\( n \, g \)$ in (8.12),
$ ∥hat(E) - exp \[ - b_0 \( H_(n \, g) + C_n I \) \/ 2 \]∥_(upright(F)) < 2 dot.op 10^(- 10) . $

]
] <appth:matrix-error>

#proof[
  Write $d = 3^n$. Since $b_0 \/ 2 = 49 \/ 8$, the exact target is
  $ E = e^(- 49) exp \( 49 A \) = sum_(i = 0)^oo e^(- 49) frac(49^i, i !) A^i . $
  The polynomial with coefficients $q_i = s_i \/ S_K$ is the truncation of this Poisson expansion,
    renormalized to have coefficient sum one. Its coefficient $ell^1$ error is twice the omitted Poisson mass,
    at most $2 R$, where
  #[#set math.equation(numbering: n => "(8.13)")
   $ R = frac(49^193, 193 !) frac(1, 1 - 49 \/ 194) < 3.152 dot.op 10^(- 33) . $ <appth:tail>]
  In bounding the omitted Poisson mass by $R$, we have discarded the factor $e^(- 49)$.
    This coefficient estimate is used in #cite(label("FoxGlynn1988")) proof of Proposition 1;
    here it is applied to powers of a contraction. Because $A$ is a contraction,
    the corresponding Frobenius error is at most $2 sqrt(d) thin R$.
  At each Horner stage the coefficient replacement $q_i mapsto t_i \/ Q$ contributes less than $sqrt(d) \/
    Q$ in Frobenius norm. The entrywise floor contributes less than $d \/ Q$ before undoing the similarity,
    and hence less than $sqrt(2) thin d \/ Q$ afterwards, since $parallel J^(- 1) parallel thin parallel J
    parallel lt.eq sqrt(2)$. Subsequent propagation is left multiplication by $A$ and cannot increase the
    Frobenius norm. Thus the contraction is used after undoing the similarity;
    no contraction property of the generally nonsymmetric integer matrix $D$ is asserted. The total error is less than
  #[#set math.equation(numbering: n => "(8.14)")
   $ 2 sqrt(d) thin R + frac(193 \( sqrt(d) + sqrt(2) thin d \), Q) lt.eq 54 R +
     frac(193 \( 27 + sqrt(2) thin 729 \), 2^50) < 54 R + 432513 /
     2^51 < 2 dot.op 10^(- 10) . $ <appth:frobenius-error>]
  The penultimate inequality uses only $sqrt(2) < 3 \/ 2$; the last one is a rational comparison using (8.13). ◻
]

Squaring the Frobenius norm converts this estimate into a thermal trace.
  In fact, $E$ is self-adjoint and $parallel E parallel_(upright(F))^2 =
  "Tr" exp \[ - b_0 \( H_(n \, g) + C_n I \) \]$. Consequently

#[#set math.equation(numbering: n => "(8.15)")
 $ lr(|Z_(n \, g) - e^(b_0 \( C_n - a n \)) W_(n \, g)|) < e^(b_0 \( C_n - a n \))
   (4 dot.op 10^(- 10) sqrt(W_(n \, g)) + 4 dot.op 10^(- 20)) . $ <appth:partition-error>]

This follows from $\| parallel E parallel_(upright(F))^2 - parallel hat(E) parallel_(upright(F))^2 \| lt.eq
  2 parallel E - hat(E) parallel_(upright(F)) parallel hat(E) parallel_(upright(F)) + parallel E -
  hat(E) parallel_(upright(F))^2$.

=== 8.5 Rational intervals from the printed table <rational-intervals-from-the-printed-table>

The displayed integer floors suffice to verify the needed estimates; no unprinted digits of $W_(n \, g)$ are used.
  For an entry $k = k_(n \, g)$, put

#[#set math.equation(numbering: n => "(8.16)")
 $ L = k / 10^16 \, wide U = frac(k + 1, 10^16) \, wide r = frac(floor.l sqrt(k + 1) floor.r + 1, 10^8) \, wide
   epsilon = 4 dot.op 10^(- 10) r + 4 dot.op 10^(- 20) . $ <appth:interval-data>]

Then $L lt.eq W_(n \, g) < U$ and $sqrt(W_(n \, g)) < r$. In every entry $L - epsilon > 0$, so (8.15) gives

#[#set math.equation(numbering: n => "(8.17)")
 $ e^(b_0 \( C_n - a n \)) \( L - epsilon \) < Z_(n \, g) < e^(b_0 \( C_n - a n \)) \( U + epsilon \) .
   $ <appth:partition-interval>]

The square root in (8.16) is just an integer square root. To enclose the remaining exponential by rational numbers, set

$ T_80 \( y \) = sum_(j = 0)^80 frac(y^j, j !) . $

For $0 lt.eq y lt.eq 10$, comparison of consecutive tail terms gives

#[#set math.equation(numbering: n => "(8.18)")
 $ T_80 \( y \) lt.eq e^y lt.eq T_80 \( y \) + frac(2 y^81, 81 !) . $ <appth:scalar-exp>]

For a negative argument, take reciprocals and reverse the endpoints.
  All arguments $b_0 \( C_n - a n \)$ here lie between $- .0544635$ and $9.691073$.
  Thus (8.16)–(8.18) require only rational arithmetic and integer square roots. In particular they give

#[#set math.equation(numbering: n => "(8.19)")
 $ .0266319440 < Z_(6 \, 1) < .0266319607 < .027 . $ <appth:Y6-interval>]

Using (8.17) and (8.18) in (8.3) gives the following rational centers, each with absolute error less than $10^(- 7)$:

#[#set math.equation(numbering: n => "(8.20)")
 $ n & 2 & 3 & 4 & 5 & 6\
upright("center of ") I \( n \) & .02703074 & .01203562 & .01193511 & .00931560 & .00893272 . $ <appth:moment-centers>]

Substitution of these centers in the right-hand side of (8.4) gives $.003744031780$.
  The sum of the absolute polynomial coefficients is $1.7032$,
  so the total possible error is less than $1.7032 dot.op 10^(- 7)$.
  The right-hand side of (8.4) is consequently less than

$ .003744031780 + .00000017032 = .0037442021 < .003745 . $

Together with (8.19), this proves Proposition 15.

== 9 Exact trial vectors for opposite fields <app:trials>

We prove the four variational inequalities used to initialize the boundary argument. Throughout this appendix,

$ a = 700741 / 500000 \, wide h = 3 / 5 \, wide alpha = 2021 / 5000 = .4042 \, $

and the unshifted opposite-field Hamiltonian on $m$ sites is

#[#set math.equation(numbering: n => "(9.1)")
 $ H_m^(upright("opp")) = sum_(j = 1)^(m - 1) upright(bold(S))_j dot.op upright(bold(S))_(j + 1) - 3 / 5 S_1^z +
   3 / 5 S_m^z . $ <apptr:hamiltonian>]

The bulk matrices below are those of the periodic variational construction in #cite(label("periodic")) Section
  “Two variational inputs”. We give their complete integer specification and the new endpoint vectors,
  so the present finite estimates can be reproduced without importing a variational bound for open chains.

#thm([Proposition 9.1.])[
  #emph[Let $E_0^(upright("opp")) \( m \)$ be the smallest eigenvalue of $H_m^(upright("opp"))$. Then
#[#set math.equation(numbering: n => "(9.2)")
 $ E_0^(upright("opp")) \( m \) + a m < alpha wide upright("for ") m in { 34 \, 78 \, 142 \,
   240 } . $ <apptr:four-bounds>]

]
] <apptr:bound>

The proof consists of a fixed integer matrix-product vector, an exact contraction for its norm and energy,
  and four integer comparisons. No spectral approximation enters the calculation.

=== 9.1 The complete tensor and endpoint data <the-complete-tensor-and-endpoint-data>

Let $cal(V)$ have the $26$ labels

#[#set math.equation(numbering: n => "(9.3)")
 $ \( i \, d \) \, wide 1 lt.eq i lt.eq 8 \, wide d = - ell_i \, - ell_i + 2 \, dots.h \, ell_i \,
   wide \( ell_i \)_(i = 1)^8 = \( 1 \, 1 \, 1 \, 1 \, 3 \, 3 \, 3 \, 5 \) . $ <apptr:virtual-labels>]

Order them first by $i$ and then by increasing $d$. Three real $26$-by-$26$ matrices $A_s$, $s in { - 1 \, 0 \,
  1 }$, are specified as follows. At row $\( i \, d \)$ and column $\( j \, e \)$ put $ell = ell_i$, $k = ell_j$,
  and $r = \( ell + d \) \/ 2$. The entry is zero unless

#[#set math.equation(numbering: n => "(9.4)")
 $ e = d + 2 s \, wide \| k - ell \| lt.eq 2 \, wide k = ell med arrow.r.double med i = j . $ <apptr:support>]

For an allowed entry, multiply the coefficient in the second column of Table 1 by the factor in its $s$ column.
  The parameters $D_i$ and $P_(i j)$ appear in Tables 2 and 3.
  The latter parameter is defined only when $ell_j = ell_i + 2$.
  All labels in these rules must belong to (9.3); an out-of-range column is absent.

Define columns $upright(bold(b)) \, upright(bold(c)) in bb(R)^26$ by

#[#set math.equation(numbering: n => "(9.5)")
 $ upright(bold(b))_(\( i \, d \)) = cases(delim: "{", beta_i \, & d = - 1 \,, 0 \, & d eq.not - 1 \,) wide
   upright(bold(c))_(\( i \, d \)) = cases(delim: "{", kappa_i beta_i \, & d = - 1 \,, 0 \, & d eq.not - 1 .)
   $ <apptr:endpoints>]

All their parameters are included in Table 2.

For each $m gt.eq 2$, the physical vector is

#[#set math.equation(numbering: n => "(9.6)")
 $ psi_m = sum_(s_1 \, dots.h \, s_m = - 1)^1 #scale(x: 120%, y: 120%)[\(] upright(bold(b))^(sans(t)) A_(s_1)
   dots.h.c A_(s_m) upright(bold(c)) #scale(x: 120%, y: 120%)[\)] e_(s_1) ⊗ dots.h.c ⊗ e_(s_m) .
   $ <apptr:physical-vector>]

This is the open-boundary matrix-product form of #cite(label("PerezGarcia2007")) Section 3.1, Equation (11),
  with endpoint rows and columns absorbed into the first and last matrices.
  The vectors $e_(- 1) \, e_0 \, e_1$ are the orthonormal spin basis fixed in the statement of the problem.
  In particular, the coefficients in (9.6) are ordinary real amplitudes:
  no virtual inner product or physical basis weights are inserted.
  Normalization of the matrices $A_s$ is unnecessary. The support rule forces a nonzero amplitude to have $sum_j
  s_j = 0$, because both endpoints have virtual weight $- 1$.
  This restriction on the trial vector does not restrict the variational upper bound on the smallest eigenvalue of
  the full Hamiltonian.

The following tables complete the integer specification of these matrices and endpoints.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[coefficient
], table.cell(rowspan: 1, colspan: 1)[$s = - 1$
], table.cell(rowspan: 1, colspan: 1)[$s = 0$
], table.cell(rowspan: 1, colspan: 1)[$s = 1$
]),
  table.cell(rowspan: 1, colspan: 1)[$k = ell + 2$
], table.cell(rowspan: 1, colspan: 1)[$P_(i j)$
], table.cell(rowspan: 1, colspan: 1)[$2 \( ell + 1 - r \) \( ell + 2 - r \)$
], table.cell(rowspan: 1, colspan: 1)[$2 \( r + 1 \) \( ell - r + 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( r + 1 \) \( r + 2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$k = ell$
], table.cell(rowspan: 1, colspan: 1)[$D_i$
], table.cell(rowspan: 1, colspan: 1)[$2 \( ell - r + 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$- \( r + 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$k = ell - 2$
], table.cell(rowspan: 1, colspan: 1)[$- P_(j i)$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$- 2$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
)
]],
  caption: [Table 1: Every allowed entry of $A_s$ is the coefficient times the listed factor. All other entries are zero. ],
)

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[$ell_i$
], table.cell(rowspan: 1, colspan: 1)[$D_i$
], table.cell(rowspan: 1, colspan: 1)[$beta_i$
], table.cell(rowspan: 1, colspan: 1)[$kappa_i$
]),
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 289$
], table.cell(rowspan: 1, colspan: 1)[10000
], table.cell(rowspan: 1, colspan: 1)[12
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 84$
], table.cell(rowspan: 1, colspan: 1)[5620
], table.cell(rowspan: 1, colspan: 1)[12
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$- 9$
], table.cell(rowspan: 1, colspan: 1)[2456
], table.cell(rowspan: 1, colspan: 1)[12
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[33
], table.cell(rowspan: 1, colspan: 1)[4868
], table.cell(rowspan: 1, colspan: 1)[12
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$- 22$
], table.cell(rowspan: 1, colspan: 1)[82
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[27
], table.cell(rowspan: 1, colspan: 1)[$- 809$
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[71
], table.cell(rowspan: 1, colspan: 1)[12475
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$- 11$
], table.cell(rowspan: 1, colspan: 1)[$- 9645$
], table.cell(rowspan: 1, colspan: 1)[1
],
)
]],
  caption: [Table 2: Virtual types, diagonal tensor parameters, and endpoint parameters. The left and right endpoints are supported on $d = - 1$. ],
)

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, right, center, right, center, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$\( i \, j \)$
], table.cell(rowspan: 1, colspan: 1)[$P_(i j)$
], table.cell(rowspan: 1, colspan: 1)[$\( i \, j \)$
], table.cell(rowspan: 1, colspan: 1)[$P_(i j)$
], table.cell(rowspan: 1, colspan: 1)[$\( i \, j \)$
], table.cell(rowspan: 1, colspan: 1)[$P_(i j)$
]),
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 11$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 49$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[9
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 35$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 6$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 32$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 28$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 25$
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, 8 \)$
], table.cell(rowspan: 1, colspan: 1)[1
],
  table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 23$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 20$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 8 \)$
], table.cell(rowspan: 1, colspan: 1)[2
],
  table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 34$
], table.cell(rowspan: 1, colspan: 1)[$\( 7 \, 8 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 16$
],
)
]],
  caption: [Table 3: All fifteen couplings with $ell_j = ell_i + 2$. ],
)

=== 9.2 Norm, fields, and the bond insertion <norm-fields-and-the-bond-insertion>

For $s \, t in { - 1 \, 0 \, 1 }$, put $B_(s t) = A_s A_t$ and define

#[#set math.equation(numbering: n => "(9.7)")
 $ T_(*) & = sum_(s = - 1)^1 A_s ⊗ A_s \, & G_(*) & = sum_(s = - 1)^1 s A_s ⊗ A_s \,\
O_(*) & = sum_(s \, t = - 1)^1 s t thin B_(s t) ⊗ B_(s t)\
 & quad + sum_(s = - 1 \, 0\
t = 0 \, 1) #scale(x: 120%, y: 120%)[\(] B_(s t) ⊗ B_(s + 1 \, t - 1) +
  B_(s + 1 \, t - 1) ⊗ B_(s t) #scale(x: 120%, y: 120%)[\)] . $ <apptr:one-site-transfers>]

We use the usual Kronecker convention $\( C ⊗ D \)_(\( v \, w \) \, \( v' \, w' \)) = C_(v \, v') D_(w \, w')$. Write

#[#set math.equation(numbering: n => "(9.8)")
 $ L_0 = \( upright(bold(b)) ⊗ upright(bold(b)) \)^(sans(t)) \, wide u = upright(bold(c)) ⊗ upright(bold(c)) \,
   wide L_i = L_0 T_(*)^i . $ <apptr:boundary-tensors>]

#thm([Lemma 9.2.])[
  #emph[With the data above, the norm $V_m = chevron.l psi_m \, psi_m chevron.r$ and the scaled shifted energy numerator
$ H_m^(*) = 500000 thin chevron.l psi_m \, \( H_m^(upright("opp")) + a m I \) psi_m chevron.r $

 satisfy
#[#set math.equation(numbering: n => "(9.9)")
 $ V_m & = L_m u \,\
H_m^(*) & = 500000 sum_(r = 0)^(m - 2) L_0 T_(*)^r O_(*) T_(*)^(m - 2 - r) u - 300000 L_0 G_(*) T_(*)^(m - 1) u\
 & quad + 300000 L_(m - 1) G_(*) u + 700741 m L_m u . $ <apptr:norm>]

 In particular, $V_m$ and $H_m^(*)$ are integers.]
] <apptr:contractions>

#proof[
  Expanding $T_(*)^m$ sums the products of two identical real amplitudes over all physical words.
    This proves (9.9) directly in the orthonormal physical basis.
    Inserting $G_(*)$ at one site instead of $T_(*)$ multiplies the summand by the weight $s$ and therefore
    inserts $S^z$ at that site.
  For a bond, the spin normalization gives
  $ upright(bold(S)) dot.op upright(bold(S)) = S^z ⊗ S^z + 1 / 2 \( S^(+) ⊗ S^(-) + S^(-) ⊗ S^(+) \) . $
  Its diagonal entry on $\( s \, t \)$ is $s t$. Its off-diagonal entries are $1$ between $\( s \, t \)$ and
    $\( s + 1 \, t - 1 \)$ for $s in { - 1 \, 0 }$ and $t in { 0 \, 1 }$,
    since each allowed ladder entry is $sqrt(2)$. The two summands in each parenthesis of (9.7) give the two
    directions of that matrix element. Thus $O_(*)$ inserts exactly one unit-coupling bond,
    with no extra factor or metric. Its position after $r$ sites gives the $r$th summand of (9.9).
  The left and right endpoint insertions have coefficients $500000 \( - 3 \/ 5 \) = -
    300000$ and $500000 \( 3 \/ 5 \) = 300000$, respectively.
    The constant shift contributes $500000 a m = 700741 m$ times the norm.
    There are $m - 1$ bond positions and no closing bond, giving the stated formula.
    Every matrix, row, and column in that formula is integral. ◻
]

=== 9.3 The invariant 162-dimensional contraction <the-invariant-162-dimensional-contraction>

All contractions in Lemma 18 can be carried out in a single $162$-dimensional space.
  On a paired virtual label $\( \( i \, d \) \, \( j \, e \) \)$, consider the difference $d - e$.
  Each nonzero entry of $A_s$ changes virtual weight by $2 s$ from row to column.
  Consequently every summand $A_s ⊗ A_s$ of $T_(*)$ or $G_(*)$ preserves this difference.
  A nonzero entry of $B_(s t)$ changes weight by $2 \( s + t \)$.
  The two factors in every tensor summand of $O_(*)$ have the same total physical weight,
  including the pair $\( s \, t \)$ and $\( s + 1 \, t - 1 \)$ in the off-diagonal terms.
  Each such summand also preserves $d - e$.

Let $cal(K)_0$ be the coordinate subspace with paired labels

#[#set math.equation(numbering: n => "(9.10)")
 $ cal(Q) = { \( \( i \, d \) \, \( j \, d \) \) : \( i \, d \) \, \( j \, d \) in cal(V) } .
   $ <apptr:restricted-labels>]

The multiplicities of the virtual weights $d = - 5 \, - 3 \, - 1 \, 1 \, 3 \, 5$ are $1 \, 4 \, 8 \, 8 \, 4 \, 1$,
  respectively; hence

#[#set math.equation(numbering: n => "(9.11)")
 $ dim cal(K)_0 = 1^2 + 4^2 + 8^2 + 8^2 + 4^2 + 1^2 = 162 . $ <apptr:restricted-dimension>]

The preceding argument shows that $T_(*) \, G_(*) \, O_(*)$ are block diagonal by weight difference.
  Both $L_0$ and $u$ are supported in $cal(K)_0$, because the two endpoint vectors are supported on $d = - 1$.
  We may therefore restrict these three matrices to (9.10) before multiplying them, taking powers,
  or forming the expressions of Lemma 18. In particular, squaring the restricted $T_(*)$ gives the restriction of
  $T_(*)^2$; there is no contribution through a discarded state.
  From now on the same symbols denote these restricted integer matrices and endpoint tensors,
  ordered by the inherited lexicographic order.

=== 9.4 An exact row recurrence <an-exact-row-recurrence>

The energy sum in (9.9) need not be evaluated separately at every bond. Define integer rows by

#[#set math.equation(numbering: n => "(9.12)")
 $ L_i & = L_(i - 1) T_(*) quad \( i gt.eq 1 \) \,\
N_1 & = - 300000 L_0 G_(*) \,\
N_i & = N_(i - 1) T_(*) + L_(i - 2) #scale(x: 120%, y: 120%)[\(] 500000 O_(*) +
  700741 T_(*)^2 #scale(x: 120%, y: 120%)[\)] quad \( i gt.eq 2 \) . $ <apptr:recurrence>]

Then

#[#set math.equation(numbering: n => "(9.13)")
 $ V_m = L_m u \, wide H_m^(*) = #scale(x: 120%, y: 120%)[\(] N_m + 300000 L_(m - 1) G_(*) +
   700741 L_m #scale(x: 120%, y: 120%)[\)] u . $ <apptr:energy-recurrence>]

To verify the latter identity, induction on $m$ in (9.12) gives

#[#set math.equation(numbering: n => "(9.14)")
 $ N_m = - 300000 L_0 G_(*) T_(*)^(m - 1) + sum_(r = 0)^(m - 2) L_0 T_(*)^r \( 500000 O_(*) + 700741 T_(*)^2 \)
   T_(*)^(m - 2 - r) . $ <apptr:N-expansion>]

Its bond contributions and left field are exactly those in (9.9).
  Each of its $m - 1$ shift contributions equals $700741 L_m$.
  The final term $700741 L_m$ in (9.13) supplies the remaining site shift,
  and the other final term supplies the right field with the required positive sign. This proves (9.13).

For specificity, the whole contraction can be implemented by keeping just three rows. Begin with

$ x = L_0 \, wide y = L_0 T_(*) \, wide w = - 300000 L_0 G_(*) . $

For each $m = 2 \, 3 \, dots.h \, 240$, make the following updates, whose right-hand sides all use the old rows:

#[#set math.equation(numbering: n => "(9.15)")
 $ w_(upright("new")) & = w T_(*) + 500000 x O_(*) + 700741 \( x T_(*) \) T_(*) \,\
x_(upright("new")) & = y \, wide y_(upright("new")) = y T_(*) . $ <apptr:algorithm>]

After this iteration, $\( x \, y \, w \) = \( L_(m - 1) \, L_m \, N_m \)$. At a required length compute

#[#set math.equation(numbering: n => "(9.16)")
 $ V = y u \, wide H = w u + 300000 x \( G_(*) u \) + 700741 V . $ <apptr:readout>]

Thus $\( V \, H \) = \( V_m \, H_m^(*) \)$. The initialization realizes the same invariant at $m = 1$,
  which proves the indexing of the algorithm. Ordinary exact integer matrix multiplication suffices throughout;
  sparsity can reduce the work but changes no operation or comparison.

=== 9.5 The integer comparisons <the-integer-comparisons>

Table 4 gives the results of (9.15)–(9.16). The integers $p_m$, $q_m$,
  and $k_m$ in the table have the following exact meanings:

#[#set math.equation(numbering: n => "(9.17)")
 $ 10^(p_m - 1) & lt.eq V_m < 10^(p_m) \,\
q_m 10^(p_m - 6) & lt.eq V_m < \( q_m + 1 \) 10^(p_m - 6) \,\
k_m V_m & lt.eq 20 H_m^(*) < \( k_m + 1 \) V_m . $ <apptr:certificate-inequalities>]

The last comparison is equivalent to $k_m = floor.l 10^7 H_m^(*) \/ \( 500000 V_m \) floor.r$,
  since $10^7 \/ 500000 = 20$. The first comparison in particular certifies that the vector $psi_m$ is nonzero.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (right, right, right, right, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$m$
], table.cell(rowspan: 1, colspan: 1)[$p_m$
], table.cell(rowspan: 1, colspan: 1)[$q_m$
], table.cell(rowspan: 1, colspan: 1)[$k_m$
], table.cell(rowspan: 1, colspan: 1)[$H_m^(*) \/ \( 500000 V_m \)$ lies in
]),
  table.cell(rowspan: 1, colspan: 1)[34
], table.cell(rowspan: 1, colspan: 1)[202
], table.cell(rowspan: 1, colspan: 1)[715867
], table.cell(rowspan: 1, colspan: 1)[4031974
], table.cell(rowspan: 1, colspan: 1)[$\[ .4031974 \, .4031975 \)$
],
  table.cell(rowspan: 1, colspan: 1)[78
], table.cell(rowspan: 1, colspan: 1)[440
], table.cell(rowspan: 1, colspan: 1)[747265
], table.cell(rowspan: 1, colspan: 1)[4041175
], table.cell(rowspan: 1, colspan: 1)[$\[ .4041175 \, .4041176 \)$
],
  table.cell(rowspan: 1, colspan: 1)[142
], table.cell(rowspan: 1, colspan: 1)[787
], table.cell(rowspan: 1, colspan: 1)[121288
], table.cell(rowspan: 1, colspan: 1)[4041110
], table.cell(rowspan: 1, colspan: 1)[$\[ .4041110 \, .4041111 \)$
],
  table.cell(rowspan: 1, colspan: 1)[240
], table.cell(rowspan: 1, colspan: 1)[1317
], table.cell(rowspan: 1, colspan: 1)[165352
], table.cell(rowspan: 1, colspan: 1)[4041006
], table.cell(rowspan: 1, colspan: 1)[$\[ .4041006 \, .4041007 \)$
],
)
]],
  caption: [Table 4: Exact integer contraction certificates. The intervals are rational intervals obtained from integer division, with strict upper endpoints. ],
)

All four strict comparisons

#[#set math.equation(numbering: n => "(9.18)")
 $ 202100 V_m - H_m^(*) > 0 wide \( m = 34 \, 78 \, 142 \, 240 \) $ <apptr:strict-margin>]

follow as well. They are recorded directly in the full integer output,
  and they also follow from the last line of (9.17), since every displayed $k_m + 1$ is less than $4042000 =
  20 dot.op 202100$.

The accompanying computational files make the integer comparison fully reproducible.
  The program constructs the matrices from the data in this appendix and executes the row recurrence with
  arbitrary-precision integers. The file contains every entry of $A_s$, the endpoint vectors,
  the restricted paired labels, and the matrices $T_(*) \, G_(*) \, O_(*)$.
  The file contains the full integers $V_m$, $H_m^(*)$, and $202100 V_m - H_m^(*)$ for each row,
  rather than only their shortened display in Table 4. The equations and tables of this appendix specify the
  calculation independently of these files.

#proof[
  For each of the four lengths, the integer $V_m = chevron.l psi_m \, psi_m chevron.r$ is positive by (9.17).
    The variational principle, Lemma 18, and (9.18) give
  $ E_0^(upright("opp")) \( m \) + a m lt.eq
    frac(chevron.l psi_m \, \( H_m^(upright("opp")) + a m I \) psi_m chevron.r, chevron.l psi_m \, psi_m
    chevron.r) = frac(H_m^(*), 500000 V_m) < 202100 / 500000 = alpha . $
  This proves all four inequalities with the same fixed field $h = 3 \/ 5$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
