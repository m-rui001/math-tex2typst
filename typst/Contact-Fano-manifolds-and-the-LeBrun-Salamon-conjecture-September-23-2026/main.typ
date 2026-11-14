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

#align(center)[#text(size: 16pt, weight: "bold")[Contact Fano manifolds and the \
LeBrun--Salamon conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $X$ be a smooth connected complex projective variety of dimension $2 n + 1$, where $n gt.eq 1$.
  A #emph[contact structure] on $X$ is an exact sequence of algebraic vector bundles

#[#set math.equation(numbering: n => "(1.1)")
 $ 0 arrow.r F arrow.r T_X arrow.r^(med theta med) L arrow.r 0 \, $ <intro:contact-sequence>]

with $L$ a line bundle, such that the Levi pairing

$ F ⊗ F arrow.r L \, wide \( v \, w \) mapsto theta \( \[ v \, w \] \) $

is everywhere nondegenerate. In a local frame of $L$, write $alpha$ for the scalar one-form representing $theta$.
  The condition is equivalent to $alpha and \( d alpha \)^n$ being nowhere zero.
  We call $\( X \, F \)$ a #emph[contact Fano manifold] if $- K_X$ is ample.

For a simple complex Lie algebra $frak(g)$, let $cal(O)_min \( frak(g) \)$ be its nonzero nilpotent adjoint orbit
  of smallest dimension, and put

$ Y_(frak(g)) = bb(P) \( cal(O)_min \( frak(g) \) \) . $

This is the unique closed adjoint orbit in $bb(P) \( frak(g) \)$.
  Its canonical contact structure is obtained by projectivizing the Kirillov–Kostant–Souriau symplectic cone.

#thm([Theorem 1.1.])[
  #emph[Let $\( X \, F \)$ be a smooth connected complex projective contact Fano manifold of dimension $2 n + 1$,
    with $n gt.eq 1$, and let $L = T_X \/ F$. There exist a finite-dimensional simple complex Lie algebra
    $frak(g)$ and an algebraic isomorphism
$ phi : X arrow.r^(med tilde.op med) Y_(frak(g)) $

 whose differential carries the given distribution $F$ to the canonical contact distribution on $Y_(frak(g))$. Moreover,
$ L tilde.eq phi^(*) #scale(x: 120%, y: 120%)[\(] cal(O)_(bb(P) \( frak(g) \)) \( 1 \) \|_(Y_(frak(g)))
  #scale(x: 120%, y: 120%)[\)] . $

]
] <thm:main>

Throughout the paper, $bb(P) \( E \)$ parametrizes lines in $E$,
  with tautological subbundle $cal(O)_(bb(P) \( E \)) \( - 1 \)$. The two models separated by the Picard reduction are

$ X & L & frak(g)\
bb(P)^(2 n + 1) & cal(O) \( 2 \) & frak(s p)_(2 n + 2) \( bb(C) \)\
bb(P) \( T^(*) bb(P)^(n + 1) \) & cal(O) \( 1 \, 1 \) \|_X & frak(s l)_(n + 2) \( bb(C) \) . $

In the second row, $X$ is the incidence divisor of points and hyperplanes in $bb(P)^(n + 1)
  times \( bb(P)^(n + 1) \)^(*)$. In the first, the adjoint embedding is the quadratic Veronese embedding,
  so its hyperplane bundle is $cal(O) \( 2 \)$. The proof then treats the remaining case $"Pic" \( X \) =
  bb(Z) \[ L \]$.

Two consequences will be proved after the classification in Section 8.

#thm([Corollary 1.2.])[
  (Kähler–Einstein existence).  #emph[Let $\( X \, F \)$ be a smooth connected complex projective contact Fano
    manifold of complex dimension $2 n + 1$, where $n gt.eq 1$.
    Then $X$ admits a Kähler–Einstein metric of positive scalar curvature for its given complex structure.]
] <thm:contact-fano-ke>

For projective contact manifolds without a Fano hypothesis,
  the results of Demailly and Kebekus–Peternell–Sommese–Wiśniewski provide a reduction to which Theorem 1 applies.

#thm([Corollary 1.3.])[
  (Projective contact manifolds).  #emph[Let $\( X \, F \)$ be a smooth connected complex projective contact
    manifold of dimension $2 n + 1$, where $n gt.eq 1$. Its second Betti number determines the following alternatives.]
  + #emph[If $b_2 \( X \) = 1$, then $\( X \, F \)$ is contact-isomorphic to the adjoint variety $Y_(frak(g))$,
    with its canonical contact distribution, for a simple complex Lie algebra $frak(g)$.]
  + #emph[If $b_2 \( X \) gt.eq 2$, then there is a smooth connected complex projective manifold $Z$ of dimension
    $n + 1$ and a biholomorphism
$ X tilde.eq bb(P) \( T^(*) Z \) . $

 Here $bb(P) \( T^(*) Z \)$ parametrizes lines in cotangent spaces, equivalently hyperplanes in tangent spaces.
   This assertion identifies the underlying manifolds, without imposing compatibility with the given distribution $F$.]
  #emph[Conversely, every adjoint variety of complex dimension $2 n +
    1$ and every projectivized cotangent bundle in the second alternative admits a contact structure.
    Thus these are precisely the underlying manifolds of smooth connected complex projective contact manifolds in
    these dimensions.]
] <thm:projective-contact>

The Riemannian application concerns a smooth manifold of real dimension $4 m$, $m gt.eq 2$,
  whose metric has holonomy contained in $"Sp" \( m \) "Sp" \( 1 \)$ in its standard representation.
  Such a metric is called #emph[quaternionic-Kähler]; #emph[positive] here means that its scalar curvature is
  positive. The compact symmetric positive quaternionic-Kähler spaces are the #emph[Wolf spaces].

#thm([Corollary 1.4.])[
  #emph[Let $\( M^(4 m) \, g \)$ be a closed connected smooth Riemannian manifold, where $m gt.eq 2$,
    with holonomy contained in $"Sp" \( m \) "Sp" \( 1 \)$ in the standard representation and with positive scalar
    curvature. Then
$ nabla "Rm"_g = 0 . $

 Moreover, $\( M \, g \)$ is homothetic to a compact symmetric positive quaternionic-Kähler Wolf space.]
] <thm:quaternionic>

Theorem 1 resolves the smooth contact-Fano homogeneity conjecture positively.
  Corollary 4 gives the positive resolution of the Riemannian LeBrun–Salamon conjecture in every real dimension $4
  m$ with $m gt.eq 2$. The link is the positive twistor construction:
  the twistor space is contact Fano, so the general algebraic theorem applies to it.
  Simple connectivity of the contact Fano twistor space and its $S^2$-bundle structure show that the original
  manifold is simply connected. The metric is recovered from the resulting complex twistor space in Section 9.

=== History and prior work <history-and-prior-work>

The conjectural classification has two related settings. Wolf’s work relates compact quaternionic symmetric spaces
  to homogeneous complex contact spaces [30]; the adjoint-variety description of their twistor fibration is
  recalled in [17] Section 3.9, pp. 105–106. The twistor construction of Salamon,
  independently due to Bérard-Bergery, associates a contact Fano manifold to a closed connected positive
  quaternionic-Kähler manifold [27,20]. LeBrun’s converse characterizes the contact Fano manifolds arising in this
  way by the existence of a Kähler–Einstein metric [20] Theorem A.
  The finiteness and rigidity program of LeBrun and Salamon [19,21] provides the historical setting for the
  homogeneity conjecture. The general algebraic formulation, stated for example in [5] Conjecture 1.1,
  concerns every contact Fano manifold.

The projective-contact reduction has two ingredients. Kebekus, Peternell,
  Sommese and Wiśniewski classify projective contact manifolds with non-nef canonical bundle as either Fano with
  $b_2 = 1$ or projectivized cotangent bundles [12] Theorem 1.1.
  Demailly’s integrability theorem excludes pseudoeffectivity of the canonical bundle of a compact Kähler contact
  manifold; his Corollaries 3–4 give the reduction used in Corollary 3 [8] Corollaries 2–4.
  Within the Fano class, Mori’s ample-tangent theorem and the Kobayashi–Ochiai index theorem identify the
  incidence and projective-space alternatives [23,14]. In the remaining primitive case,
  Kebekus establishes the covering contact lines and the spanning of their tangent directions [11].
  For $n gt.eq 2$, the corrected contact-line theorem gives a smooth, possibly disconnected,
  Legendrian variety of directions [5] corrected version, Theorem 3.1 and Remark 3.2.
  The case $n = 1$ is treated directly in Section 3. These results identify the geometric objects from which the
  smoothing, tensor descent and diagonal arguments below begin.

Earlier low-dimensional classifications were obtained by Poon and Salamon for compact positive quaternionic-Kähler
  manifolds in real dimension eight [26], and by Ye and Druel for contact Fano manifolds in complex dimensions
  three and five, respectively [37,9]. Several classification results impose additional geometric or
  group-theoretic hypotheses. Beauville’s contact moment-map approach gives adjoint classification when the
  contact linear-system map is generically finite and the contact automorphism group is reductive [2] Theorem 0.1.
  Yasukura proves adjoint classification for compact connected complex contact manifolds whose contact line bundle
  defines a holomorphic immersion [34] Theorem 1.1. The first-jet generation obtained below supplies such an
  immersion; we give the resulting contact moment-map classification directly.
  Buczyński and Wiśniewski classify the closed positive quaternionic-Kähler manifolds in real dimensions twelve
  and sixteen, and the contact Fano manifolds in complex dimensions three through nine with reductive automorphism
  group [6] Theorems 1.1–1.2. Occhetta, Romano, Solá Conde,
  and Wiśniewski prove the adjoint classification in the primitive Picard case under reductivity and the rank
  bound $r gt.eq max { 2 \, \( n - 3 \) \/ 2 }$ in complex dimension $2 n + 1$,
  where $r$ is the rank of the contact automorphism group [25] Theorem 6.1.
  On the Riemannian side, Brendle and Semmelmann establish symmetry for compact positive quaternionic-Kähler
  manifolds of real dimension at least eight under nonnegative sectional curvature [4] Corollary 2.

The use of contact lines and two-line loci has substantial antecedents.
  Buczyński attributes the study of loci swept out by two contact lines to Wiśniewski [5] Introduction and
  develops their divisors, duality, and associated bilinear forms [5] Introduction and Theorem 1.3.
  The Legendrian secant geometry of Landsberg and Manivel [18] Proposition 17(2) and its proof is used in
  Buczyński’s Proposition 3.5, which also records the disjoint-join statement [5].
  Here a suitable pair of contact lines is smoothed, two vector lifts are extended across the unmarked degree-two
  boundary, and their common contact value descends to a symmetric tensor on the square.
  Its diagonal jets generate ordinary first jets of the contact line bundle at every point,
  which yields transitivity of contact automorphisms. The final jet criterion also applies to compact complex
  contact manifolds satisfying its tensor hypothesis, without a Fano assumption.

Kobayashi’s preprint claims the Wolf-space classification for complete locally irreducible positive
  quaternionic-Kähler manifolds of real dimension at least eight [13] Theorem 5.3 and states Kähler–Einstein
  existence for arbitrary contact Fano manifolds as a separate conjecture [13] Conjecture 1.3.
  Corollary 2 establishes this existence for the manifolds in Theorem 1.
  Earlier versions of Yasukura’s preprint asserted unrestricted contact-Fano and quaternionic-Kähler
  classifications [31] Theorem I and Corollary II, [33] Theorems C–D and Corollary E.
  The author’s later comments identify an error in Theorem 3.2(ii) of the former version [32],
  and identify Theorem A and Corollary B of the latter version as false [34].

=== The mechanism of the proof <the-mechanism-of-the-proof>

The #emph[contact degree] of a map $f : bb(P)^1 arrow.r X$ is $deg f^(*) L$.
  We call such a map a #emph[contact line] if its contact degree is one and a #emph[conic] if its contact degree
  is two; these terms impose no embedding assumption.

The objective is to produce enough global vector fields preserving $F$ to span every tangent space.
  After the two explicit Picard alternatives have been handled, we work with $"Pic" \( X \) =
  bb(Z) \[ L \]$ and construct a symmetric section

#[#set math.equation(numbering: n => "(1.2)")
 $ B in H^0 \( X times X \, L times.square L \) \, wide L times.square L = "pr"_1^(*) L ⊗ "pr"_2^(*) L \,
   $ <intro:global-section>]

where $"pr"_1 \, "pr"_2$ are the projections from $X times X$.
  Near two coincident points the section vanishes to second order,
  with leading term given by the square of the contact form.
  This local behavior will force the global contact fields to span. The construction has four stages.

First, at a general point choose two free contact lines, meaning that their pulled-back tangent bundles are
  globally generated. Their positive-degree tangent-bundle summands span $F_x$ and their tangent vectors have
  nonzero Levi pairing. Their union can be smoothed while its two outer values move.
  The key calculation concerns the contrary, fixed-end problem:
  a first-order smoothing keeping both values fixed would force the Levi pairing to vanish.
  The fixed-end obstruction space is one-dimensional, so varying the smoothing parameter supplies exactly the
  missing direction for two-point evaluation. The resulting conic $g : bb(P)^1 arrow.r X$ is #emph[very free],
  meaning that every summand of $g^(*) T_X$ has positive degree (Proposition 15).
  We keep all nearby parametrized maps, not just a chosen one-parameter smoothing,
  because the later diagonal calculation varies both their values and their velocities.

Second, compactify these conics in the unmarked stable-map space.
  Its universal-curve square parametrizes a source curve together with two variable evaluation points.
  On a smooth source, the coordinate-independent tensor

$ \( z - w \)^2 partial_z ⊗ partial_w $

gives two vector-valued sections, one retaining the tangent vector in the first factor and one retaining it in the
  second. Applying the contact form to both factors gives their common contact value.
  The singular unmarked sources have exactly two degree-one components.
  At a node of thickness $r$, the contact differential vanishes to order at least $r$,
  canceling each possible pole of the tensor. Both vector-valued sections consequently extend over the proper
  family (Proposition 17).

Third, the common contact value descends from this proper family to the section $B$ in (1.2).
  The two vector lifts test contact lines in the two factors of $X times X$.
  On every proper integral component dominating a test line,
  the relevant lift has constant projection to the trivial quotient of the pulled-back tangent bundle.
  This forces every generic sheet of the finite contact-value image to split over that line.
  A test line meeting a hypothetical branch divisor transversely would instead produce a sheet of degree greater
  than one. Purity and simple connectedness then complete the descent (Proposition 22).

Finally, on the full neighborhood of $g$ the section satisfies

$ B \( h \( z \) \, h \( w \) \) = \( z - w \)^2 thin theta \( h' \( z \) \) ⊗ theta \( h' \( w \) \) . $

The available value and velocity variations make its constant and linear diagonal terms vanish and identify the
  quadratic symbol with $theta^2$. Each of these intrinsic identities extends from a nonempty open subset to all
  of $X$. Symmetry then determines the cubic Taylor term in local coordinates and a line frame.
  The quadratic and cubic terms imply that global sections of $L$ generate first jets at every point.
  Contact Hamiltonians therefore span every tangent space, giving contact transitivity (Theorem 28).
  The contact moment map identifies the resulting homogeneous manifold, with its given distribution,
  with a simple adjoint variety (Proposition 30).

Two parts of this mechanism have independent formulations:
  contact-value descent from a proper family with the two vector lifts,
  and the symmetric-jet criterion on a connected compact complex contact manifold.
  The latter does not require projectivity or Fano positivity.
  Global diagonal identities are what pass from the initially general points to every point.
  After transitivity is proved, Corollary 32 supplies through every point in the primitive Picard case a conic
  transverse to $F$ with $u^(*) F tilde.eq cal(O) \( 1 \)^(xor 2 n)$.

=== Conventions and organization <conventions-and-organization>

All schemes, algebraic spaces and stacks are over $bb(C)$. Curve families have their scheme-theoretic fibers.
  “General” means outside a proper Zariski-closed subset unless an analytic open set is explicitly specified.
  For bundles $E_1 \, E_2$ on $X$, we similarly write $E_1 times.square E_2 = "pr"_1^(*) E_1 ⊗ "pr"_2^(*) E_2$.

Section 2 proves the Picard reduction. Section 3 selects the pair of contact lines,
  and Section 4 smooths it to a very free conic. Section 5 extends the two moving-point tensors over the unmarked
  boundary; Section 6 descends their contact value. Section 7 turns its diagonal jets into contact transitivity,
  and Section 8 identifies the adjoint model and completes Theorem 1.
  Section 9 gives the twistor construction and normalized metric recovery proving Corollary 4.

== 2 The contact line and the Picard alternatives <red:section>

Let $X$ be a smooth connected complex projective contact Fano manifold of dimension $d = 2 n + 1$, where $n gt.eq
  1$, with contact sequence

#[#set math.equation(numbering: n => "(2.1)")
 $ 0 arrow.r F arrow.r T_X arrow.r^theta L arrow.r 0 . $ <red:contact>]

In a local frame of $L$ we write $alpha$ for $theta$. With the Levi convention in Section 1, local sections $v \,
  w$ of $F$ satisfy $d alpha \( v \, w \) = - alpha \( \[ v \, w \] \)$.
  The top exterior power of $d alpha \|_F$ is nowhere zero. Taking determinants gives

#[#set math.equation(numbering: n => "(2.2)")
 $ det F tilde.eq L^(⊗ n) \, wide - K_X tilde.eq L^(⊗ \( n + 1 \)) . $ <red:determinant>]

In particular $L$ is ample.

#thm([Lemma 2.1.])[
  #emph[The manifold $X$ is simply connected, and its Picard group is a free abelian group of finite rank,
    canonically isomorphic to $H^2 \( X \, bb(Z) \)$.]
] <red:simply-connected>

#proof[
  We recall an argument that applies to every smooth complex Fano manifold.
    Yau’s prescribed-Ricci-form Theorem [35] Theorem 1, proved in [36],
    says that a real closed $\( 1 \, 1 \)$-form representing $2 pi
    c_1 \( X \)$ is the Ricci form of a Kähler metric in any prescribed Kähler class.
    Ampleness of $- K_X$ supplies a positive representative. For the resulting metric,
    compactness gives a uniform positive lower bound for the Ricci tensor.
    The Bonnet–Myers Theorem [24] makes the universal cover $q : tilde(X) arrow.r X$ compact,
    so $q$ has finite degree $r$.
  The cover is holomorphic and unramified, and the lifted metric is Kähler with positive Ricci tensor.
    In particular $- K_(tilde(X)) = q^(*) \( - K_X \)$ is positive.
    Kodaira’s projectivity Theorem [16] Section 3, p. 316 therefore makes the compact manifold $tilde(X)$
    projective. The graph of $q$ is a closed analytic subvariety of the projective product $tilde(X) times X$,
    so GAGA makes $q$ algebraic [28] Proposition 15. It is proper with finite fibers, hence finite,
    and its local analytic inverses show that it is étale. Thus both manifolds and their finite covering are
    algebraic before we apply projective vanishing and Riemann–Roch.
  Kodaira vanishing [15], applied to $cal(O) = K ⊗ K^(- 1)$, gives $H^i \( tilde(X) \, cal(O)_(tilde(X)) \) =
    H^i \( X \, cal(O)_X \) = 0$ for $i > 0$. Both holomorphic Euler characteristics are one.
    Since $T_(tilde(X)) = q^(*) T_X$, Hirzebruch–Riemann–Roch [10] gives
  $ 1 = chi \( tilde(X) \, cal(O)_(tilde(X)) \) = integral_(tilde(X)) q^(*) "td" \( T_X \) =
    r thin chi \( X \, cal(O)_X \) = r . $
  Thus $X$ is simply connected. This argument prescribes a Ricci form;
    it does not require the metric to be Kähler–Einstein.
  The exponential sequence and the vanishings of $H^1 \( X \, cal(O)_X \)$ and $H^2 \( X \, cal(O)_X \)$ identify
    the analytic Picard group with $H^2 \( X \, bb(Z) \)$; GAGA [28] identifies it with the algebraic Picard
    group. The cohomology group is finitely generated. The universal coefficient sequence has torsion term
    $"Ext"^1 \( H_1 \( X \, bb(Z) \) \, bb(Z) \) = 0$, since $H_1 \( X \, bb(Z) \) = 0$,
    and identifies $H^2 \( X \, bb(Z) \)$ with a subgroup of a finitely generated free abelian group.
    It is therefore free. ◻
]

#thm([Proposition 2.2.])[
  #emph[Either $"Pic" \( X \) = bb(Z) \[ L \]$, or $\( X \, F \)$ is contact-isomorphic to one of the following
    standard contact manifolds:]
  + #emph[the incidence variety
$ I = { \( ell \, H \) in bb(P)^(n + 1) times \( bb(P)^(n + 1) \)^(*) : ell subset H } \, wide L =
  cal(O)_I \( 1 \, 1 \) \; $

]
  + #emph[projective space $bb(P)^(2 n + 1)$ with the contact structure induced by a nondegenerate alternating
    form on $bb(C)^(2 n + 2)$, and $L = cal(O)_(bb(P)^(2 n + 1)) \( 2 \)$.]
  #emph[In both listed cases a connected algebraic group acts transitively and preserves the given distribution $F$.]
] <red:alternatives>

#proof[
  Suppose first that $"rank" "Pic" \( X \) > 1$. Lemma 5 gives $b_2 \( X \) > 1$, and $K_X$ is not nef.
    Theorem 1.1 of Kebekus–Peternell–Sommese–Wiśniewski [12] states that a projective contact manifold with
    non-nef canonical bundle is either Fano with $b_2 = 1$, or a projectivized tangent bundle over a smooth
    projective manifold. Their convention is the projectivization of one-dimensional quotients.
    In our convention of lines, the second alternative is
  $ X tilde.eq bb(P) \( T^(*) Z \) \, wide dim Z = n + 1 . $
  For a rank-$r$ bundle $E$ in the lines convention,
  $ K_(bb(P) \( E \)) = cal(O)_(bb(P) \( E \)) \( - r \) ⊗ pi^(*) \( K_Z ⊗ \( det E \)^(- 1) \) . $
  Taking $E = T^(*) Z$ cancels the factor pulled back from $Z$, so $- K_X =
    cal(O)_(bb(P) \( T^(*) Z \)) \( n + 1 \)$. Consequently $cal(O)_(bb(P) \( T^(*) Z \)) \( 1 \)$ is ample.
    This is precisely ampleness of $T_Z$, as defined by its tautological quotient line bundle.
    Mori’s Theorem [23], that a smooth complex projective manifold with ample tangent bundle is projective space,
    now gives $Z tilde.eq bb(P)^(n + 1)$. Thus $X tilde.eq I$.
  We verify the contact structure, rather than only the variety.
    Put $m = n + 1 gt.eq 2$ and $A = bb(P)^m times \( bb(P)^m \)^(*)$.
    The incidence variety is a smooth divisor of type $\( 1 \, 1 \)$, so adjunction gives $- K_I =
    cal(O)_I \( m \, m \)$. Equation (2.2) and torsion-freeness of $"Pic" \( I \)$ give $L =
    cal(O)_I \( 1 \, 1 \)$. Set $E = Omega_A^1 \( 1 \, 1 \) \|_I$. The restriction sequence is
  $ 0 arrow.r Omega_A^1 arrow.r Omega_A^1 \( 1 \, 1 \) arrow.r E arrow.r 0 . $
  The Euler sequence on $bb(P)^m$ gives $H^i \( bb(P)^m \, Omega_(bb(P)^m)^1 \( 1 \) \) =
    0$ for all $i$ and $h^1 \( bb(P)^m \, Omega_(bb(P)^m)^1 \) = 1$.
    The decomposition of $Omega_A^1$ and the Künneth formula imply
  $ H^0 \( A \, Omega_A^1 \( 1 \, 1 \) \) = H^1 \( A \, Omega_A^1 \( 1 \, 1 \) \) = 0 \, wide
    h^1 \( A \, Omega_A^1 \) = 2 . $
  Hence $h^0 \( I \, E \) = 2$. The twisted conormal sequence
  $ 0 arrow.r cal(O)_I arrow.r E arrow.r Omega_I^1 \( 1 \, 1 \) arrow.r 0 $
  and $H^1 \( I \, cal(O)_I \) = 0$ then give $h^0 \( I \, Omega_I^1 \( 1 \, 1 \) \) = 1$.
    The tautological contact form on $bb(P) \( T^(*) bb(P)^m \)$ is a nonzero section of this space.
    Indeed, at $\( ell \, H \)$ with $ell subset H subset bb(C)^(m + 1)$,
    the cotangent line is $ell ⊗ \( bb(C)^(m + 1) \/ H \)^(*)$.
    Thus the tautological subbundle is $cal(O)_I \( - 1 \, - 1 \)$ and its dual contact line is
    $cal(O)_I \( 1 \, 1 \)$. The given contact form is a nonzero scalar multiple of the tautological form,
    and the kernels agree. The simultaneous action of $"PGL"_(m + 1)$ on points and hyperplanes is transitive on
    $I$ and preserves this kernel.
  Suppose next that $"Pic" \( X \)$ has rank one. Choose its ample generator $A_1$ and write $L =
    A_1^(⊗ k)$ with $k > 0$. If $k gt.eq 2$, the Fano index is $\( n + 1 \) k gt.eq 2 n + 2 = d + 1$.
    The Kobayashi–Ochiai index Theorem [14] bounds the index of a smooth Fano $d$-fold by $d + 1$,
    with equality only for $bb(P)^d$. Thus $k = 2$, $X tilde.eq bb(P)^d$, and $L = cal(O) \( 2 \)$.
    For $X = bb(P) \( V \)$ the Euler sequence identifies
  $ H^0 \( X \, Omega_X^1 \( 2 \) \) tilde.eq and.big^2 V^(*) . $
  The twisted one-form corresponding to $sigma in and.big^2
    V^(*)$ vanishes at $\[ v \]$ if $v$ belongs to the radical of $sigma$.
    Our contact quotient is everywhere surjective, so its alternating form has zero radical.
    All nondegenerate alternating forms on $V$ are equivalent under $"GL" \( V \)$.
    This identifies the given contact distribution with the standard one,
    preserved by the transitive connected symplectic group.
  The only remaining alternative is $k = 1$. ◻
]

The two listed manifolds are the type $A_(n + 1)$ and $C_(n + 1)$ adjoint contact varieties.
  In the projective-space case the adjoint polarization is $cal(O) \( 2 \)$,
  so its adjoint embedding is the quadratic Veronese embedding.
  Their contact transitivity also allows them to be included in the uniform homogeneous identification at the end
  of the proof. In the intervening sections we assume

#[#set math.equation(numbering: n => "(2.3)")
 $ "Pic" \( X \) = bb(Z) \[ L \] . $ <red:primitive>]

== 3 Contact lines and a suitable pair <lines:section>

Throughout this section assume (2.3). A #emph[contact line] is a map $f : bb(P)^1 arrow.r X$ with $f^(*) L =
  cal(O) \( 1 \)$, as in Section 1. Every such map is birational onto its image,
  since a nontrivial cover would multiply the positive integral $L$-degree. It is horizontal:

#[#set math.equation(numbering: n => "(3.1)")
 $ theta compose d f = 0 \, $ <lines:horizontal>]

because $"Hom" \( cal(O) \( 2 \) \, cal(O) \( 1 \) \) = 0$.

Our goal is the pair in Proposition 11 at a general point $x$:
  two free contact lines whose positive tangent-bundle subspaces span $F_x$ and whose tangent vectors have nonzero
  Levi pairing.

We first specify the published contact-line results used below.
  Kebekus [11] Section 2.3 constructs an irreducible covering component $cal(H)$ of rational curves on a
  projective contact Fano manifold with $b_2 = 1$. Its minimal contact degree is one or two;
  degree two forces projective space. The latter has contact line bundle $cal(O) \( 2 \)$ and is excluded
  by (2.3). Thus we may fix a covering component of contact lines.
  The parameter space of these curves through a general point is proper.
  For a general $x in X$, Kebekus’s Proposition 3.3 gives smoothness of the lines through $x$,
  Corollary 3.4 supplies their tangent-direction morphism, and Lemma 3.5 gives the splitting

#[#set math.equation(numbering: n => "(3.2)")
 $ f^(*) T_X tilde.eq cal(O) \( 2 \) xor cal(O) \( 1 \)^(xor \( n - 1 \)) xor cal(O)^(xor \( n + 1 \)) .
   $ <lines:standard-splitting>]

Theorem 4.4 of [11] says that the tangent directions of the curves from $cal(H)$ through $x$ span
  $bb(P) \( F_x \)$. This is a statement about their union;
  no individual irreducible component of the set of directions is asserted to span.

For $n gt.eq 2$ we also use the corrected Theorem 3.1 of Buczyński [5],
  in the consolidated version arXiv:1002.0698v2. It says that the reduced variety $Z_x$ of these tangent
  directions at a general point is smooth and Legendrian in the contact projective space $bb(P) \( F_x \)$,
  and that its points are actual tangents to contact lines through $x$.
  The result allows a union of components of the family of contact lines.
  We use neither irreducibility of $Z_x$ nor an isomorphism between the line locus and its tangent cone;
  see the correction discussed in Remark 3.2 of that paper.
  Smoothness means that the irreducible components of $Z_x$ are disjoint.
  Each has dimension $n - 1$, and its affine cone is smooth away from the vertex,
  with Lagrangian tangent spaces for the symplectic form on $F_x$.

We record the deformation details needed to use these directions.
  For a morphism from a smooth projective curve to a smooth variety,
  the tangent space of the map scheme is $H^0 \( f^(*) T_X \)$;
  with specified point values it is the subspace of sections vanishing there.
  The corresponding $H^1$ is an obstruction space. In particular $H^1 \( f^(*) T_X \) =
  0$ implies smoothness of the map scheme at $f$; see [1] Theorem 5.
  These statements follow from local liftings across a square-zero extension:
  differences of liftings form a Čech cocycle in the pulled-back tangent bundle,
  and its $H^1$ class is the obstruction to gluing.

#thm([Lemma 3.1.])[
  (Freeness in fixed degree).  #emph[Let $A$ be an ample line bundle on a smooth projective variety $M$,
    and fix an integer $e > 0$. There is a dense open $M_e subset M$ such that every map $f : bb(P)^1 arrow.r
    M$ of $A$-degree $e$ whose image meets $M_e$ is free, that is, $f^(*) T_M$ is globally generated.]
] <lines:fixed-degree>

#proof[
  The degree-$e$ map scheme is of finite type: an embedding by a very ample power $A^a$ realizes it as the locus
    of maps into $M$ among degree-$a e$ maps to a fixed projective space.
    Stratify its reduction into finitely many smooth irreducible locally closed sets $S_j$.
    Consider evaluation at $0$ on each stratum. Discard the closures of the images of nondominant strata.
    For a dominant stratum discard also the closure of the image of its critical locus.
    The latter closure is proper: otherwise some reduced irreducible component $C$ of that critical locus would
    dominate $M$. On a smooth dense open of $C$, generic smoothness in characteristic zero would give a surjective
    differential to $M$. It factors through the differential on $S_j$, contradicting criticality.
  The complement $M_e$ of these finitely many proper closed sets is dense and open.
    At any map with $f \( 0 \) in M_e$, stratum tangent vectors give global sections of $f^(*)
    T_M$ whose values span $T_(f \( 0 \)) M$. In the splitting $f^(*) T_M = xor.big_i cal(O) \( a_i \)$,
    a negative summand would have no global sections and could not be generated at $0$.
    Hence every $a_i gt.eq 0$, giving global generation. Reparametrizing $bb(P)^1$ moves any specified point to
    $0$, proving the assertion for every map whose image meets $M_e$. ◻
]

#thm([Lemma 3.2.])[
  #emph[For a free contact line $f$, let $P_f subset f^(*) T_X$ be the positive part of its splitting.
    This subbundle is intrinsic, the quotient $f^(*) T_X \/ P_f$ is trivial, and
#[#set math.equation(numbering: n => "(3.3)")
 $ theta \( P_f \) = 0 . $ <lines:positive-horizontal>]

 Moreover $P_f$ is isotropic for the pulled-back Levi form, so $"rank" P_f lt.eq n$.]
] <lines:positive>

#proof[
  Freeness says that all splitting degrees are nonnegative.
    The sum of the positive summands is independent of the splitting:
    any homomorphism from a positive line bundle to a trivial bundle is zero,
    so the positive part of one splitting is contained in that of any other.
    The quotient is the sum of the degree-zero summands and is trivial.
  The nonzero differential $d f : cal(O) \( 2 \) arrow.r f^(*) F$, paired with the nondegenerate Levi form,
    gives a nonzero homomorphism
  $ f^(*) F arrow.r T_(bb(P)^1)^(*) ⊗ f^(*) L = cal(O) \( - 1 \) . $
  Consequently $f^(*) F$ is not globally generated: all global sections would map to zero in $cal(O) \( - 1 \)$.
    If $theta$ were nonzero on a positive summand $cal(O) \( a \)$, then $a = 1$ and that map to $f^(*) L =
    cal(O) \( 1 \)$ would be an isomorphism. It would split the pulled-back contact sequence.
    The kernel $f^(*) F$ would then be a direct summand of the globally generated bundle $f^(*) T_X$,
    a contradiction. This proves (3.3). Finally each component of the Levi pairing on positive summands is a
    homomorphism $cal(O) \( a + b \) arrow.r cal(O) \( 1 \)$ with $a \, b gt.eq 1$, and is zero.
    Isotropy and nondegeneracy of the rank-$2 n$ Levi form give the rank bound. ◻
]

#thm([Corollary 3.3.])[
  #emph[There is a smooth irreducible family $H$ of parametrized free contact lines with smooth dominant
    evaluation $H times bb(P)^1 arrow.r X$.]
] <lines:free-cover>

#proof[
  Take a component of the map scheme corresponding to the covering family $cal(H)$.
    Lemma 7 makes its free locus nonempty. Freeness is open, and at a free map both $H^1 \( f^(*) T_X \)$ and
    $H^1 \( f^(*) T_X \( - t \) \)$ vanish for every $t in bb(P)^1$.
    The first vanishing makes this locus smooth; the second makes evaluation smooth at every pair $\( f \, t \)$,
    by the deformation criterion above. A nonempty irreducible open in this locus gives $H$,
    and its evaluation remains dominant. ◻
]

=== 3.1 The dimension-three endpoint <the-dimension-three-endpoint>

When $n = 1$, the needed description of directions follows directly from Kebekus’s results, which have no $n gt.eq
  2$ hypothesis. Equation (3.2) becomes $f^(*) T_X = cal(O) \( 2 \) xor cal(O)^(xor 2)$.
  For a general $x$ and a line parametrization with $f \( 0 \) = x$,
  the space of maps with this value fixed is smooth of dimension

$ h^0 \( bb(P)^1 \, f^(*) T_X \( - 0 \) \) = h^0 \( bb(P)^1 \, cal(O) \( 1 \) \) = 2 . $

The reparametrizations fixing $0$ form a two-dimensional group.
  They act freely on each parametrization, since it is birational onto its image.
  Their orbits are consequently open in the smooth fixed-value map space near these maps.
  The projective tangent direction is constant on each orbit.
  Equivalently the local space of line images through $x$ has dimension zero;
  the proper parameter space of such images is therefore finite.
  Its reduced tangent-direction image $Z_x subset bb(P) \( F_x \) = bb(P)^1$ is a finite smooth set.
  Kebekus’s spanning Theorem supplies two distinct directions.
  Their affine cones are two distinct lines in the symplectic plane $F_x$,
  hence have nonzero mutual symplectic pairing and sum equal to $F_x$. Each is Lagrangian.
  This gives the required cone geometry in dimension three without using the higher-dimensional smoothness assertion.

=== 3.2 Addition of two Legendrian cones <addition-of-two-legendrian-cones>

The secant geometry behind this argument appears in Landsberg–Manivel [18] Proposition 17(2) and its proof and
  Buczyński [5] Proposition 3.5. We prove the pairwise assertion below for a possibly disconnected Legendrian
  variety; it will apply to the entire direction variety $Z_x$ without requiring any one of its components to span.

#thm([Lemma 3.4.])[
  #emph[Let $\( V \, omega \)$ be a symplectic vector space of dimension $2 n$.
    Let $Z subset bb(P) \( V \)$ be a smooth projective Legendrian variety, possibly disconnected.
    Write $U_i$ for the affine cones over its irreducible components.
    If $omega \( a \, b \) eq.not 0$ for some $a in U_i$, $b in U_j$, then the addition map
$ U_i times U_j arrow.r V \, wide \( a \, b \) mapsto a + b $

 is dominant.]
] <lines:cone-addition>

#proof[
  Each cone has dimension $n$, is smooth away from its vertex, and has Lagrangian tangent spaces there.
    Suppose addition is not dominant. Its source has dimension $2 n$,
    so its general fibers have positive dimension. The nonorthogonal pairs form a nonempty open subset of the
    irreducible source. Choose a general such pair in a fiber of positive dimension,
    and an irreducible algebraic curve $C$ in that fiber through the pair.
    Such a curve is obtained by intersecting an affine neighborhood in a positive-dimensional fiber component with
    sufficiently many general hyperplanes through the point. Write its two coordinate maps as $a \( t \) \,
    b \( t \)$, with fixed sum $s in V$.
  On the smooth dense open of $C$ where both coordinates are nonzero, their derivatives satisfy $dot(a) = -
    dot(b)$. The radial vector of a cone belongs to its tangent space. Lagrangianity therefore implies
  $ frac(d, d t) omega \( a \, b \) = omega \( dot(a) \, b \) + omega \( a \, dot(b) \) = 0 : quad
    omega \( dot(a) \, b \) = - omega \( dot(b) \, b \) = 0 \, quad omega \( a \, dot(b) \) = -
    omega \( a \, dot(a) \) = 0 . $
  In characteristic zero a rational function on an integral curve with zero differential is constant.
    Hence $omega \( a \, b \) = c eq.not 0$ on $C$. In particular neither coordinate is ever zero there.
  Normalize $C$ and take its smooth projective completion $overline(C)$.
    The vector-valued rational function $a$ is nonconstant, since $a + b = s$ and $C$ is a curve of pairs.
    At least one coordinate of $a$ has a pole on $overline(C)$,
    as regular functions on a connected projective curve are constant.
    Choose such a place, a uniformizer $t$, and let $k > 0$ be the maximal pole order of the coordinates of $a$. Then
  $ p \( t \) = t^k a \( t \) \, wide q \( t \) = - t^k b \( t \) $
  are regular near $0$, with
  #[#set math.equation(numbering: n => "(3.4)")
   $ p \( 0 \) = q \( 0 \) eq.not 0 \, wide p \( t \) - q \( t \) = t^k s . $ <lines:rescaling>]
  The closed conical property puts $p \( 0 \)$ in $U_i$ and $q \( 0 \)$ in $U_j$.
    Distinct components of the smooth variety $Z$ are disjoint.
    Their common nonzero point therefore forces $i = j$. Denote the resulting smooth cone germ by $U$.
  We claim that $omega \( p \, q \)$ on $U times U$ vanishes to order at least three along the diagonal.
    In local coordinates write $r \( z \)$ for the inclusion of $U$ into $V$. Conical Lagrangianity gives
  $ omega \( r \, r_i \) = 0 \, wide omega \( r_j \, r_i \) = 0 \, $
  where subscripts denote coordinate derivatives. Differentiating the first identity gives
    $omega \( r \, r_(i j) \) = 0$. Taylor expansion of $omega \( r \( z \) \, r \( z + h \) \)$ has zero terms of
    degrees zero, one, and two in $h$. These identities hold for every $z$,
    so the function belongs to the cube of the diagonal ideal on $U times U$;
    this proves the claim even when both arguments vary. Choose the local coordinates $z$ to be restrictions of
    linear coordinates on $V$ with independent differentials on $T_(p \( 0 \)) U$.
    Equation (3.4) then says that the local coordinates of $p \( t \)$ and $q \( t \)$ differ by $O \( t^k \)$.
    The claim yields
  $ omega \( p \( t \) \, q \( t \) \) = O \( t^(3 k) \) . $
  But its exact value is $- t^(2 k) omega \( a \( t \) \, b \( t \) \) = - c t^(2 k)$, of order $2 k$.
    This contradiction proves dominance. ◻
]

#thm([Proposition 3.5.])[
  (Suitable contact-line pair).  #emph[There exist a point $x in X$ and free parametrized contact lines $f_1 \,
    f_2 : bb(P)^1 arrow.r X$, with $f_1 \( 0 \) = f_2 \( 0 \) = x$, such that,
    for affine parameters at $0$ and $a = f'_1 \( 0 \)$, $b = f'_2 \( 0 \)$,
#[#set math.equation(numbering: n => "(3.5)")
 $ d alpha_x \( a \, b \) eq.not 0 \, wide P_(f_1) \|_0 + P_(f_2) \|_0 = F_x . $ <lines:pair>]

 In particular the two positive subspaces are complementary Lagrangian subspaces of $F_x$.]
] <lines:suitable-pair>

#proof[
  Choose $x$ in the common general locus of the contact-line results and Lemma 7 for degree one,
    so that every line map through $x$ is free. Fix a local frame of $L$ and put $omega = d alpha_x \|_(F_x)$.
    The description of $Z_x$ above applies for $n gt.eq 2$, and its direct dimension-three replacement applies for
    $n = 1$. Since $Z_x$ spans $bb(P) \( F_x \)$, some pair of its cone components $U_i \,
    U_j$ has $omega \( a \, b \) eq.not 0$ for a pair of points:
    otherwise bilinearity would make $omega$ zero on all of $F_x$.
    Lemma 10 makes their addition dominant (for $n = 1$ it is already a linear isomorphism).
  Consider the finite-type reduced space of maps with $f \( 0 \) = x$.
    Taking the derivative at $0$ defines an algebraic map to $F_x$.
    Every nonzero vector in $U_i$ or $U_j$ is realized: each projective direction comes from an actual smooth
    contact line, and reparametrizations fixing $0$ multiply its derivative by any nonzero scalar.
    Thus we can choose irreducible locally closed subspaces of the map space whose derivative images are dense in
    $U_i$ and $U_j$. On their product the derivative-sum map is dominant.
    Restricting to the nonempty open where the two derivatives have nonzero pairing preserves dominance.
    Generic smoothness on a smooth dense open of this reduced product supplies a pair where its differential
    surjects onto $F_x$.
  It remains to identify where that differential takes values.
    A tangent vector to maps with $f \( 0 \) = x$ is a section $psi in H^0 \( bb(P)^1 \, f^(*) T_X \( - 0 \) \)$.
    Its projection to the trivial quotient $f^(*) T_X \/ P_f$ is a constant section vanishing at $0$,
    hence zero everywhere. Thus $psi$ takes values in $P_f$. Because $psi \( 0 \) = 0$,
    its derivative at $0$ is intrinsically in $P_f \|_0$: differentiating a local frame of $P_f$ contributes only
    terms multiplied by the zero value of $psi$. In target coordinates this derivative is exactly the variation of
    $f' \( 0 \)$. Consequently the surjective differential of the sum map has image contained in $P_(f_1) \|_0 +
    P_(f_2) \|_0$. Lemma 8 puts this sum inside $F_x$, proving (3.5).
    Each summand is isotropic of dimension at most $n$; since their sum has dimension $2 n$,
    both have dimension $n$ and their intersection is zero. ◻
]

== 4 Smoothing two contact lines <sm:section>

Choose the two free contact lines $f_i : bb(P)^1 arrow.r X$ supplied by Proposition 11.
  Write $f_1 \( 0 \) = f_2 \( 0 \) = x$, and choose affine parameters $u \, v$ on their sources.
  In target coordinates centered at $x$, and a local frame of $L$ representing $theta$ by $alpha$, put

#[#set math.equation(numbering: n => "(4.1)")
 $ a = f'_1 \( 0 \) \, wide b = f'_2 \( 0 \) \, wide d alpha_x \( a \, b \) eq.not 0 \,
   wide \( P_(f_1) \)_0 + \( P_(f_2) \)_0 = F_x . $ <sm:pair>]

Here $P_(f_i)$ is the positive subbundle of $f_i^(*) T_X$.
  We will smooth this pair while allowing its two outer values to move.
  The resulting family will contain a map of contact degree two that is #emph[very free]:
  every splitting summand of its pulled-back tangent bundle has positive degree.

=== 4.1 The source family and the evaluation cokernel <the-source-family-and-the-evaluation-cokernel>

Use homogeneous coordinates $\[ U_0 : U_1 \]$, $\[ V_0 : V_1 \]$, with $u = U_1 \/ U_0$ and $v = V_1 \/ V_0$. Consider

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(C) = { U_1 V_1 = s U_0 V_0 } subset bb(P)^1 times bb(P)^1 times bb(A)_s^1 \, wide pi : cal(C) arrow.r
   bb(A)_s^1 . $ <sm:source>]

The affine equation $u v = s$ and the charts at infinity show that this is a projective flat family of nodal
  genus-zero curves. Its central fiber $C = C_1 union C_2$ consists of the two axes $C_1 = { v = 0 }$ and $C_2 =
  { u = 0 }$, meeting at $o = \( 0 \, 0 \)$. For $s eq.not 0$ the fiber is smooth,
  and projection to the first factor identifies it with $bb(P)^1$. There are disjoint sections

$ p \( s \) = \( oo \, 0 \) \, wide q \( s \) = \( 0 \, oo \) \, $

both in the relative smooth locus. The maps $f_1$ and $f_2$ agree at $o$, so glue to $f_0 : C arrow.r X$.
  Set $E = f_0^(*) T_X$ and $E_i = f_i^(*) T_X$.

We recall precisely the deformation statement needed here.

#thm([Lemma 4.1.])[
  (Relative deformation of maps).  #emph[Let $S$ be a smooth irreducible complex curve, let $cal(Y) arrow.r
    S$ be a projective flat family of nodal curves, and let $Z$ be a smooth projective variety.
    The relative scheme of maps
$ "Hom"_S \( cal(Y) \, Z times S \) arrow.r S $

 is locally of finite type. At a map $f : Y_(s_0) arrow.r Z$ its relative tangent space is
   $H^0 \( Y_(s_0) \, f^(*) T_Z \)$. If $H^1 \( Y_(s_0) \, f^(*) T_Z \) = 0$,
   the displayed morphism is smooth at $\[ f \]$. In particular its total space is smooth there and its
   differential onto $T_(s_0) S$ is surjective.]
] <sm:relative-hom>

#proof[
  This is the relative-Hom smoothness Theorem of [1] Theorem 15, specialized to a constant smooth target.
    That Theorem requires a proper flat source, a smooth relative target,
    and a central source without embedded points. Our projective flat source and its nodal central fiber satisfy
    these hypotheses; the source need not be smooth. Representability follows from the graph construction.
    For completeness, local lifts of a map over a small square-zero extension exist by smoothness of the target.
    Their differences are sections of $f^(*) T_Z$ tensored with the extension ideal,
    and the obstruction to gluing them lies in its first cohomology.
    Vanishing of $H^1 \( f^(*) T_Z \)$ gives formal smoothness,
    hence smoothness for this locally finite-type scheme of maps;
    the same description gives the asserted tangent space. This concerns the full relative scheme of maps.
    It does not require choosing an extension over the original base without an #emph[étale] base change;
    compare [1] Warning 16 and Application 17. ◻
]

The normalization sequence is

#[#set math.equation(numbering: n => "(4.3)")
 $ 0 arrow.r E arrow.r \( i_1 \)_(*) E_1 xor \( i_2 \)_(*) E_2 arrow.r^(med "ev"_o - "ev"_o med) T_x X ⊗ cal(O)_o
   arrow.r 0 \, $ <sm:normalization>]

where $i_i : C_i arrow.r C$ are the inclusions. Freeness gives $H^1 \( C_i \, E_i \) =
  0$ and surjectivity of evaluation at $o$. Thus

#[#set math.equation(numbering: n => "(4.4)")
 $ H^1 \( C \, E \) = 0 . $ <sm:unconstrained-vanishing>]

Let $cal(H)$ denote the relative scheme of maps for (4.2), near $\[ f_0 \]$, and let $sigma : cal(H) arrow.r
  bb(A)^1$ be its projection. Lemma 12 makes $sigma$ smooth at $\[ f_0 \]$. Evaluation at the two sections defines

$ "Ev" : cal(H) arrow.r X times X \, wide \[ f : cal(C)_s arrow.r X \]
  mapsto \( f \( p \( s \) \) \, f \( q \( s \) \) \) . $

Put $y_1 = f_1 \( oo \)$ and $y_2 = f_2 \( oo \)$.

#thm([Lemma 4.2.])[
  #emph[The cokernel of evaluation on the vertical tangent space is canonically
#[#set math.equation(numbering: n => "(4.5)")
 $ "coker" #scale(x: 120%, y: 120%)[\[] H^0 \( C \, E \) arrow.r
   T_(y_1) X xor T_(y_2) X #scale(x: 120%, y: 120%)[\]] tilde.eq H^1 \( C \, E \( - p - q \) \) tilde.eq T_x X \/
   F_x . $ <sm:cokernel>]

 In particular it has dimension one.]
] <sm:vertical-cokernel>

#proof[
  Here $p \, q$ also denote the corresponding smooth points of $C$. Twisting the normalization sequence gives
  $ 0 arrow.r E \( - p - q \) arrow.r \( i_1 \)_(*) E_1 \( - p \) xor \( i_2 \)_(*) E_2 \( - q \) arrow.r
    T_x X ⊗ cal(O)_o arrow.r 0 . $
  All splitting degrees of $E_i$ are nonnegative. Consequently $H^1 \( E_1 \( - p \) \) =
    H^1 \( E_2 \( - q \) \) = 0$, and the images at $o$ of their spaces of sections are exactly $\( P_(f_1) \)_0$
    and $\( P_(f_2) \)_0$: the trivial summands contribute no sections after the twist,
    and each positive summand remains generated at $o$. Equation (4.1) identifies the resulting cokernel with $T_x
    X \/ F_x$. Finally the sequence
  $ 0 arrow.r E \( - p - q \) arrow.r E arrow.r E \|_p xor E \|_q arrow.r 0 $
  and (4.4) identify the same group with the evaluation cokernel in (4.5). ◻
]

=== 4.2 The obstruction with both ends fixed <the-obstruction-with-both-ends-fixed>

It remains to show that smoothing supplies this missing evaluation direction;
  we do so by ruling out a first-order smoothing that fixes both endpoint values.

#thm([Lemma 4.3.])[
  #emph[There is no tangent vector $zeta in T_(\[ f_0 \]) cal(H)$ such that
$ d sigma \( zeta \) = 1 \, wide d "Ev" \( zeta \) = 0 . $

]
] <sm:fixed-ends>

#proof[
  Such a vector would give a map to $X$ from the pullback of (4.2) under $s = epsilon.alt$, where $epsilon.alt^2 =
    0$, reducing to $f_0$ and fixing the two endpoint values to first order. Near the node its source has equation
  $ u v = epsilon.alt . $
  On $C_1 \\ { o }$ this first-order source is trivialized by $u$, including at infinity:
    in the coordinate $w = 1 \/ u$ its second coordinate is $v = epsilon.alt w$.
    The infinitesimal difference from $f_1$ is therefore an intrinsic section $A$ of $E_1$ on this punctured
    component. Similarly there is a section $D$ of $E_2$ on $C_2 \\ { o }$. The fixed endpoint conditions say
  #[#set math.equation(numbering: n => "(4.6)")
   $ A \( oo \) = D \( oo \) = 0 . $ <sm:endpoint-zeros>]
  Use the same target coordinates centered at $x$ on both branches.
    Let $g_1 \( u \) \, g_2 \( v \)$ be the vector-valued coordinate expressions of $f_1 \, f_2$;
    their constant terms are zero. In the completed local ring
  $ bb(C) \[ \[ u \, v \, epsilon.alt \] \] \/ \( u v - epsilon.alt \, epsilon.alt^2 \) \, $
  the hypothetical map has coordinate expression
  #[#set math.equation(numbering: n => "(4.7)")
   $ g_1 \( u \) + g_2 \( v \) + epsilon.alt R \( u \, v \) $ <sm:node-lift>]
  for a vector of formal power series $R$. Indeed its reduction modulo $epsilon.alt$ agrees with $g_1$ and $g_2$
    on the two axes, so the remaining difference is divisible by $epsilon.alt$.
    Substitute $v = epsilon.alt \/ u$, respectively $u = epsilon.alt \/ v$, in (4.7).
    Since $g'_1 \( 0 \) = a$, $g'_2 \( 0 \) = b$, and $epsilon.alt^2 = 0$, the Laurent expansions are
  #[#set math.equation(numbering: n => "(4.8)")
   $ A \( u \) = b / u + c + O \( u \) \, wide D \( v \) = a / v + c + O \( v \) \, wide c =
     R \( 0 \, 0 \) . $ <sm:shared-constant>]
  The vector $c$ is independent of the choice of $R$. Indeed,
    the local ring is $bb(C) \[ \[ u \, v \] \] \/ \( \( u v \)^2 \)$, with $epsilon.alt =
    u v$ and $"Ann" \( epsilon.alt \) = \( epsilon.alt \)$, so an ambiguity in $R$ has zero constant term.
    Thus the regular constants agree. Mixed monomials in $epsilon.alt R$ do not affect them,
    since $epsilon.alt u v = epsilon.alt^2 = 0$. This equality also survives a change of target coordinates:
    if its derivative and Hessian at $x$ are $J$ and $B$, the two constants become $J c +
    B \( a \, b \)$ and $J c + B \( b \, a \)$, which agree by symmetry of $B$.
  Consider the sections
  $ W_1 = u A quad upright("and") quad W_2 = v D . $
  They extend over the node by (4.8). At infinity the simple poles of $u$ and $v$ are canceled by the zeros in
    (4.6). Thus $W_i in H^0 \( C_i \, E_i \)$ are global sections.
    In our common target coordinates their jets at the node are
  #[#set math.equation(numbering: n => "(4.9)")
   $ W_1 \( 0 \) = b \, quad W'_1 \( 0 \) = c \, wide W_2 \( 0 \) = a \, quad W'_2 \( 0 \) = c . $ <sm:auxiliary-jets>]
  Freeness makes the ordinary scheme of maps smooth at each $f_i$,
    so $W_i$ is the velocity of a local deformation of that degree-one map.
    Every member of each such deformation is horizontal: its contact differential is a homomorphism
    $cal(O) \( 2 \) arrow.r cal(O) \( 1 \)$ and hence vanishes.
    We use the infinitesimal horizontality calculation in the proof of [11] Proposition 3.1.
    For a variation of $f_i$ with velocity $W_i$, differentiation of horizontality in the chosen frame and target
    coordinates gives
  $ 0 = \( partial_(W_i) alpha \) \( f'_i \) + alpha \( W'_i \) . $
  Here $partial$ differentiates the coefficient functions of $alpha$. Evaluating at the node and using (4.9) yields
  $ \( partial_b alpha \)_x \( a \) + alpha_x \( c \) = 0 \, wide \( partial_a alpha \)_x \( b \) +
    alpha_x \( c \) = 0 . $
  Subtracting gives $d alpha_x \( a \, b \) = 0$, contradicting (4.1).
    Horizontality was used for the auxiliary degree-one deformations, whose velocities are $W_1 \, W_2$. ◻
]

=== 4.3 A very free conic and its full neighborhood <a-very-free-conic-and-its-full-neighborhood>

#thm([Proposition 4.4.])[
  #emph[There is a map $g : bb(P)^1 arrow.r X$ with $deg g^(*) L = 2$ and
#[#set math.equation(numbering: n => "(4.10)")
 $ g^(*) T_X tilde.eq cal(O) \( 2 \) xor cal(O) \( 1 \)^(xor 2 n) . $ <sm:positive-splitting>]

 The full scheme $"Hom"_2 \( bb(P)^1 \, X \)$ of degree-two maps is smooth at $g$,
   and evaluation at two fixed distinct parameters is submersive there.
   Its irreducible component through $g$ therefore dominates $X times X$ by two-point evaluation.
   Moreover $g$ is an immersion, and strict positivity of the tangent splitting persists on an open neighborhood
   of $g$.]
] <sm:very-free>

#proof[
  Let $T = T_(\[ f_0 \]) cal(H)$ and $T_0 = ker d sigma$. Lemma 12 supplies $zeta in T$ with $d sigma \( zeta \) =
    1$. By Lemma 13, the subspace $V = d "Ev" \( T_0 \)$ has codimension one in $T_(y_1) X xor T_(y_2) X$.
    If $d "Ev" \( zeta \)$ belonged to $V$, subtracting a vector of $T_0$ would contradict Lemma 14.
    Thus the image of $zeta$ supplies the missing direction and $d "Ev" : T arrow.r
    T_(y_1) X xor T_(y_2) X$ is surjective. Since its source and target are smooth at the points in question,
    $"Ev"$ is smooth at $\[ f_0 \]$.
  Shrink to a neighborhood $cal(U)$ on which both $sigma$ and $"Ev"$ are smooth.
    This neighborhood meets $s eq.not 0$, since a smooth morphism is open.
    The contact degree of maps in $cal(U)$ is two: degree is locally constant in a projective flat family carrying
    a line bundle, and its value at $f_0$ is $1 + 1$. Over $bb(G)_m$ the source family is explicitly the product
    $bb(P)^1 times bb(G)_m$, with isomorphism
  #[#set math.equation(numbering: n => "(4.11)")
   $ \( \[ U_0 : U_1 \] \, s \) mapsto #scale(x: 120%, y: 120%)[\(] \[ U_0 : U_1 \] \, \[ U_1 : s U_0 \] \,
     s #scale(x: 120%, y: 120%)[\)] . $ <sm:trivialization>]
  The sections $p \, q$ correspond to the fixed parameters $oo \, 0$.
    Consequently the degree-two relative scheme of maps on this locus is
  $ "Hom"_2 \( bb(P)^1 \, X \) times bb(G)_m \, $
  and $"Ev"$ is $\( h \, s \) mapsto \( h \( oo \) \, h \( 0 \) \)$.
    In particular its differential in the $s$ direction is zero.
    Choose a point $\( g \, s \) in cal(U)$ with $s eq.not 0$.
    Smoothness of $sigma$ makes the full scheme of maps smooth at $g$,
    and surjectivity of $d "Ev"$ implies surjectivity of
  #[#set math.equation(numbering: n => "(4.12)")
   $ H^0 \( bb(P)^1 \, g^(*) T_X \) arrow.r T_(g \( oo \)) X xor T_(g \( 0 \)) X . $ <sm:two-values>]
  Thus the base parameter contributes no artificial evaluation direction.
  Write $g^(*) T_X = xor.big_(j = 1)^d cal(O) \( a_j \)$, where $d = 2 n + 1$.
    For a line bundle on $bb(P)^1$, evaluation of sections at two distinct points is surjective exactly when its
    degree is at least one. Equation (4.12) therefore gives $a_j gt.eq 1$ for every $j$. Also
  $ sum_(j = 1)^d a_j = deg g^(*) \( - K_X \) = 2 \( n + 1 \) = d + 1 \, $
  which proves (4.10). The unique local irreducible component of the smooth scheme of maps at $g$ has a submersive
    two-point evaluation, hence dominates $X times X$. The nonconstant map $g$ has nonzero differential in
    characteristic zero. In (4.10) a homomorphism $T_(bb(P)^1) = cal(O) \( 2 \) arrow.r
    g^(*) T_X$ takes values in the unique degree-two summand,
    and is a nonzero constant isomorphism onto that summand. Thus $g$ is an immersion.
    Finally strict positivity is equivalent to $H^1 \( bb(P)^1 \, g^(*) T_X \( - 2 \) \) = 0$,
    an open condition by semicontinuity. This proves the neighborhood assertion. ◻
]

We record how this full neighborhood passes to the unmarked stable-map space used below.

#thm([Lemma 4.5.])[
  #emph[Let $beta$ be the numerical curve class of $g$, specified by its degree functional on $"Pic" \( X \)$.
    The stack $overline(cal(M))_(0 \, 0) \( X \, beta \)$ is smooth at $\[ g \]$,
    and has a unique irreducible component through that point.
    If $cal(S)$ is the normalization of that reduced component,
    it agrees with the original stack on an open neighborhood of $\[ g \]$.
    After shrinking an open neighborhood $cal(H)$ of $g$ in $"Hom"_2 \( bb(P)^1 \, X \)$,
    the map forgetting parametrization factors through $cal(S)$,
    and the universal stable-map family pulls back to the full family $cal(H) times bb(P)^1 arrow.r X$.]
] <sm:full-germ>

#proof[
  Since $"Pic" \( X \) = bb(Z) \[ L \]$, contact degree two determines $beta$,
    so the class-$beta$ scheme of maps is $"Hom"_2 \( bb(P)^1 \, X \)$.
    A nonconstant map from $bb(P)^1$ has finite automorphism group and is stable without marks.
    On the open locus of smooth sources the stable-map stack is the quotient of the corresponding scheme of
    parametrized maps by $"PGL"_2$: smooth families of rational curves acquire parametrizations locally in the
    smooth topology. By Proposition 15 and smoothness of $"PGL"_2$, this quotient is smooth near $\[ g \]$.
    It is consequently normal and has a unique local irreducible component there.
    Normalization of the reduced component is therefore an isomorphism on that neighborhood.
    Pulling it back to the scheme of maps gives an open neighborhood $cal(H)$ of $g$,
    with its original universal family. The neighborhood $cal(H)$ is open in the full scheme
    $"Hom"_2 \( bb(P)^1 \, X \)$, so its tangent space at each $h in
    cal(H)$ is still $H^0 \( bb(P)^1 \, h^(*) T_X \)$. This retains every infinitesimal variation used in the
    first-jet argument below. ◻
]

== 5 Extension of the moving-pair tensors <ext:section>

Fix the degree-two very free map $g : bb(P)^1 arrow.r X$ supplied by Proposition 15.
  We continue in the primitive Picard case. The construction in this section uses only the ampleness of $L$,
  the contact form, and this one map with its two-point evaluation property. Both points on the source will vary.

Write $"pr"_i : X times X arrow.r X$ for the projections and set

$ cal(E)_12 = T_X times.square L \, wide cal(E)_21 = L times.square T_X \, wide cal(M)_X = L times.square L . $

The contact form induces maps $cal(E)_12 arrow.r cal(M)_X$ and $cal(E)_21 arrow.r cal(M)_X$.

#thm([Proposition 5.1.])[
  (The proper moving-pair construction).  #emph[There are a proper integral algebraic space $Y$,
    a dominant morphism $p : Y arrow.r X times X$, and sections
$ W_12 in H^0 \( Y \, p^(*) cal(E)_12 \) \, wide W_21 in H^0 \( Y \, p^(*) cal(E)_21 \) $

 with common contact value
$ xi = \( theta times.square 1 \) \( W_12 \) = \( 1 times.square theta \) \( W_21 \) in
  H^0 \( Y \, p^(*) cal(M)_X \) . $

 There is an involution $iota$ of $Y$ over the interchange of the two factors of $X times X$,
   under which $xi$ is invariant using the canonical interchange of the line factors.]
  #emph[Moreover, for a full open neighborhood $cal(H)$ of $g$ in $"Hom"_2 \( bb(P)^1 \, X \)$ there is a morphism
$ j : cal(H) times bb(P)^1 times bb(P)^1 arrow.r Y \, wide
  p \( j \( h \, z \, w \) \) = \( h \( z \) \, h \( w \) \) . $

 In an affine coordinate containing $z \, w$, its pullbacks satisfy
#[#set math.equation(numbering: n => "(5.1)")
 $ j^(*) W_12 \( h \, z \, w \) & = \( z - w \)^2 h' \( z \) ⊗ theta \( h' \( w \) \) \,\
j^(*) W_21 \( h \, z \, w \) & = \( z - w \)^2 theta \( h' \( z \) \) ⊗ h' \( w \) \, $ <ext:hom-vectors>]

 and hence
#[#set math.equation(numbering: n => "(5.2)")
 $ j^(*) xi \( h \, z \, w \) = \( z - w \)^2 theta \( h' \( z \) \) ⊗ theta \( h' \( w \) \) . $ <ext:hom-identity>]

 These formulas are independent of the coordinate.]
] <ext:moving-pair>

We construct the two vector sections first on the universal square over smooth sources.
  Normality then reduces their extension to boundary divisors (Lemma 18).
  A singular unmarked degree-two source has two components.
  At a node of thickness $r$, the contact differential vanishes to order at least $r$ (Lemma 20),
  while the tensor has a pole of order at most $r$ on the mixed products, as in Equation (5.16).
  One contact factor therefore extends each vector lift. Passing to the coarse space then gives $Y$ and the full family.

=== 5.1 The normalized component and its universal-curve square <the-normalized-component-and-its-universal-curve-square>

Let $beta$ be the numerical curve class specified by the degree functional of $g$ on $"Pic" \( X \)$,
  as in the convention of Behrend–Manin. Since $"Pic" \( X \) = bb(Z) \[ L \]$,
  fixing $L$-degree two fixes this functional. The stable-map Theorem gives a proper Deligne–Mumford stack of
  finite type

$ overline(cal(M))_(0 \, 0) \( X \, beta \) . $

Here the target is smooth and projective, the class is nonzero, and the ground field has characteristic zero.
  These are the applicable hypotheses of [3] Theorem 3.14 and Corollary 4.8;
  in characteristic zero the characteristic bound in Theorem 3.14 is automatic.
  The number of stability markings is zero. Its universal source is a proper flat family of geometrically
  connected nodal curves of arithmetic genus zero, with its universal map to $X$.
  The universal-curve statement also follows from [3] Corollary 4.6.

By Lemma 16, the stack is smooth at $\[ g \]$ and has a unique irreducible component there.
  Give this closed component its reduced structure and normalize it, obtaining $cal(S)$.
  The normalization is finite: on an #emph[étale] scheme atlas, the component is of finite type over $bb(C)$,
  hence Nagata, and its normalization is finite. These normalizations agree under étale base change and therefore
  descend to the stack [29] Tags #link("https://stacks.math.columbia.edu/tag/0GMJ")[#raw("0GMJ")],
  #link("https://stacks.math.columbia.edu/tag/035B")[#raw("035B")],
  and #link("https://stacks.math.columbia.edu/tag/035S")[#raw("035S")].
  Consequently $cal(S)$ is proper, integral and normal. The normalization is an isomorphism on a full smooth
  neighborhood of $\[ g \]$.

Pull back the universal source and form its fiber square:

#[#set math.equation(numbering: n => "(5.3)")
 $ pi : cal(C) arrow.r cal(S) \, wide e : cal(C) arrow.r X \, wide cal(D) = cal(C) times_(cal(S)) cal(C) \, wide
   tilde(p) = \( e_1 \, e_2 \) : cal(D) arrow.r X times X . $ <ext:universal>]

These are proper Deligne–Mumford stacks. On scheme charts the source families are projective:
  if $A_X$ is an ample line bundle on $X$, then $omega_pi ⊗ e^(*)
  A_X^(⊗ k)$ has positive degree on every source component for sufficiently large $k$, by stability,
  and is a relative polarization. In particular all the proper-curve arguments below take place on schemes after
  passing to such charts.

The points of $cal(D)$ select two points on the #emph[unmarked] source. They may coincide and they may be nodes.
  They do not add stability markings to that source. The identification of a universal curve with a moduli stack
  having one more marking uses stabilization at a node; it does not change the fiber of the universal curve used
  in (5.3).

By Lemma 16, a full open neighborhood $cal(H)$ of $g$ in the parametrized Hom scheme maps to $cal(S)$,
  and the source pulled back there is $cal(H) times bb(P)^1$. It therefore gives a morphism

#[#set math.equation(numbering: n => "(5.4)")
 $ tilde(j) : cal(H) times bb(P)^1 times bb(P)^1 arrow.r cal(D) . $ <ext:hom-to-stack>]

Two-point evaluation at $g$ is submersive by Proposition 15.
  Its factorization through $tilde(p)$ proves that $tilde(p)$ is dominant.
  In particular, this construction retains the entire nearby parametrized family.

=== 5.2 The invariant tensor on smooth sources <the-invariant-tensor-on-smooth-sources>

On $bb(P)^1 times bb(P)^1$ define

#[#set math.equation(numbering: n => "(5.5)")
 $ frak(b) \( z \, w \) = \( z - w \)^2 partial_z ⊗ partial_w in
   H^0 \( bb(P)^1 times bb(P)^1 \, T_(bb(P)^1) times.square T_(bb(P)^1) \) . $ <ext:bivector>]

For a fractional-linear coordinate change $T$ one has

$ \( T \( z \) - T \( w \) \)^2 = \( z - w \)^2 T' \( z \) T' \( w \) . $

This proves coordinate independence and regularity at infinity.
  The tensor vanishes to order two on the diagonal and is unchanged by simultaneous reparametrization.
  A smooth proper family of genus-zero curves admits parametrizations locally in the smooth topology;
  the displayed invariance therefore descends the tensor algebraically to its relative square.
  It also accounts for every finite automorphism of a stable map,
  including a possible deck transformation of a multiple cover.

Let $cal(S)^compose subset cal(S)$ be the nonempty open of smooth sources, and put $cal(D)^compose =
  cal(D) \|_(cal(S)^compose)$. On this open stack define

#[#set math.equation(numbering: n => "(5.6)")
 $ W_12^compose & = \( d_pi e_1 ⊗ theta d_pi e_2 \) \( frak(b) \) in
   H^0 \( cal(D)^compose \, tilde(p)^(*) cal(E)_12 \) \,\
W_21^compose & = \( theta d_pi e_1 ⊗ d_pi e_2 \) \( frak(b) \) in
  H^0 \( cal(D)^compose \, tilde(p)^(*) cal(E)_21 \) . $ <ext:initial-vectors>]

Here the relative differentials are taken in the two source variables.
  Their contact values agree and are invariant under interchange of those variables.
  We will extend the #emph[vector] sections in (5.6).

=== 5.3 Normality and the divisors to be checked <normality-and-the-divisors-to-be-checked>

The formulas above define sections on the smooth-source open.
  We now prove that $cal(D)$ is integral and normal, so these sections are rational sections and their extension
  can be checked at divisors.

#thm([Lemma 5.2.])[
  (Normality and the divisorial points).  #emph[Let $B$ be a normal integral locally Noetherian scheme,
    and let $C_i arrow.r B$, for $1 lt.eq i lt.eq k$, be flat nodal-curve families of finite presentation.
    Suppose the #emph[entire] generic fiber of each family is smooth and geometrically integral.
    Then $P = C_1 times_B dots.h.c times_B C_k$ is integral and normal.
    Every height-one point of $P$ lies either over the generic point of $B$,
    or at a generic point of a fiber component over a height-one point of $B$.
    In the latter case every selected point of every $C_i$ is relatively smooth.]
] <ext:normal-products>

#proof[
  The morphism $P arrow.r B$ is flat and of finite presentation.
    Its fibers are geometrically reduced and are local complete intersections:
    étale locally, a product of nodal curves is cut out by nodal equations in disjoint sets of variables.
    They are therefore Cohen–Macaulay. Their component generic points are smooth over the residue field.
    These assertions also follow from the syntomic description of nodal families and its stability under base
    change and composition [29] Tags #link("https://stacks.math.columbia.edu/tag/0C59")[#raw("0C59")],
    #link("https://stacks.math.columbia.edu/tag/01UH")[#raw("01UH")],
    and #link("https://stacks.math.columbia.edu/tag/01UI")[#raw("01UI")].
  For reducedness, on affine charts flatness over the domain defining an affine open of $B$ makes the coordinate
    algebra inject into its generic localization. The latter is reduced, since the entire generic fiber is smooth.
    Thus the total space is reduced. Every nonempty open of $P$ has nonempty open image in $B$,
    by flatness and finite presentation, so it meets the generic fiber.
    Two such opens intersect on that geometrically integral fiber. Hence $P$ is irreducible and therefore integral.
  For Serre’s condition $S_2$, use the following flat ascent statement:
    a flat homomorphism of Noetherian rings whose base and fiber rings are $S_2$ has $S_2$ total ring [29]
    Lemma 10.163.4, Tag #link("https://stacks.math.columbia.edu/tag/0339")[#raw("0339")].
    The normal base is $S_2$ and our fibers are Cohen–Macaulay, so the statement applies.
    If $q in P$ has height one and maps to $b in B$, the flat local dimension formula [29] Tag
    #link("https://stacks.math.columbia.edu/tag/00ON")[#raw("00ON")] gives
  $ 1 = dim cal(O)_(P \, q) = dim cal(O)_(B \, b) + dim cal(O)_(P_b \, q) . $
  If $b$ is generic, $cal(O)_(P \, q)$ is regular because the entire generic fiber is smooth.
    Otherwise $b$ has height one, $cal(O)_(B \, b)$ is a DVR, and $q$ is a component generic point of the fiber.
    All its coordinates are then smooth points of the nodal fibers.
    The product morphism is smooth there, so its total space is regular over the regular local base.
    This proves $R_1$. Serre’s criterion now gives normality [29] Tag
    #link("https://stacks.math.columbia.edu/tag/031S")[#raw("031S")],
    and also proves the claimed description of height-one points. ◻
]

The hypothesis about the generic fiber in Lemma 18 is stronger than generic smoothness of the individual fibers.
  It is satisfied here: $cal(S)^compose$ contains $\[ g \]$,
  so it is a nonempty open in the integral stack $cal(S)$. On every integral normal étale chart of $cal(S)$,
  the entire generic source is a smooth geometrically integral genus-zero curve.
  Lemma 18 applies for $k = 1 \, 2$ and proves normality of $cal(C)$ and $cal(D)$.
  Their global irreducibility can also be checked directly:
  the images of two nonempty opens under their flat structure maps intersect in $cal(S)^compose$,
  and the two opens then intersect on its geometrically integral fiber. Thus both stacks are integral.

In particular, no height-one point of $cal(D)$ lies over a base stratum of codimension at least two.
  Over a base divisor it must be a generic point of a product of source components.
  A point selecting a node in either factor cannot be such a generic point.
  These facts specify exactly the divisors that must be checked for extension.

=== 5.4 The unmarked boundary and its contact order <the-unmarked-boundary-and-its-contact-order>

#thm([Lemma 5.3.])[
  (The degree-two source trees).  #emph[A geometric source of an unmarked stable map of genus zero and $L$-degree
    two is either smooth, or is exactly two copies $A \, J$ of $bb(P)^1$, joined at one node,
    with $L$-degree one on each. There are no contracted components.]
] <ext:trees>

#proof[
  The dual graph of a connected nodal curve of arithmetic genus zero is a tree,
    and every component is a smooth rational curve. Ampleness of $L$ gives positive integral degree on every
    nonconstant component, so there are at most two such components.
    A contracted component must have at least three incident nodes for unmarked stability;
    in particular every leaf is nonconstant. A nontrivial tree has at least two leaves.
    There must therefore be exactly two leaves, each of degree one, and the tree is a path.
    All its possible interior vertices would be contracted of valence two and thus unstable. There are none.
    A one-vertex tree is a smooth rational source of degree two. ◻
]

By normality, it suffices to extend at height-one points,
  since the two target bundles in (5.6) are locally free on all of $cal(D)$.
  The only unexamined points lie over divisors of $cal(S)$ with singular source.
  Take the corresponding DVR $R_0$ on an integral normal étale scheme chart of $cal(S)$.
  For computing valuations we may pass to its completed strict henselization $R$.
  This is a faithfully flat DVR extension with algebraically closed residue field $k$ of characteristic zero.
  Write $tau$ for a uniformizer. The special components and node are now split.
  Regularity at their generic points is detected after this replacement:
  both before and after it the local rings are DVRs, and $tau$ has order one because the special fibers are
  reduced. A pole would retain its negative valuation on a component above it.

Let $C arrow.r "Spec" R$ be the pulled-back source and retain the notation $e : C arrow.r X$.
  Its entire generic fiber is smooth and geometrically integral.
  Lemma 18, which also applies to this Noetherian DVR base, makes $C$ and $C times_R C$ integral and normal.
  By Lemma 19, $C_k = A union J$ with one node $o$. The completed local ring at $o$ is

#[#set math.equation(numbering: n => "(5.7)")
 $ hat(cal(O))_(C \, o) tilde.eq Q := R \[ \[ u \, v \] \] \/ \( u v - tau^r \) \, wide r gt.eq 1 \, wide
   A = \( v \, tau \) \, quad J = \( u \, tau \) . $ <ext:node>]

Indeed the nodal local-form Lemma assumes a locally finite-type map, a Noetherian local base,
  flatness at the point, and a split node in the fiber; all hold here [29] Lemma 53.20.11,
  Tag #link("https://stacks.math.columbia.edu/tag/0CBX")[#raw("0CBX")].
  Its smoothing parameter is nonzero since the generic fiber is smooth;
  write it as a unit times $tau^r$ and absorb the unit into one coordinate.
  We do not assume that the total space is regular at $o$ or that the individual special components are Cartier.

Figure 1 records the source geometry and the role of the two evaluation points.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  bezier((-2.55, -0.8), (0, 0), (-1.7, -0.55), (-0.65, -0.22), stroke: (thickness: 0.65pt, miter-limit: 10))
  bezier((0, 0), (2.55, 0.8), (0.65, 0.22), (1.7, 0.55), stroke: (thickness: 0.65pt, miter-limit: 10))
  bezier((-2.55, 0.8), (0, 0), (-1.7, 0.55), (-0.65, 0.22), stroke: (thickness: 0.65pt, miter-limit: 10))
  bezier((0, 0), (2.55, -0.8), (0.65, -0.22), (1.7, -0.55), stroke: (thickness: 0.65pt, miter-limit: 10))
  content((-2.6, -0.8), [$A tilde.eq bb(P)^1$], anchor: "east", padding: 0.1176cm)
  content((2.6, -0.8), [$J tilde.eq bb(P)^1$], anchor: "west", padding: 0.1176cm)
  content((-1.8, -1.2), [$deg_A e^*L=1$])
  content((1.8, -1.2), [$deg_J e^*L=1$])
  circle((0, 0), radius: 0.05644, fill: black, stroke: none)
  content((0, 0.1764), [$o$], anchor: "south", padding: 0.1176cm)
  circle((-1.55, -0.49), radius: 0.0635, fill: black, stroke: none)
  content((-1.6, -0.4401), [$z$], anchor: "south-east", padding: 0.1176cm)
  circle((1.55, -0.49), radius: 0.0635, fill: black, stroke: none)
  content((1.6, -0.4401), [$w$], anchor: "south-west", padding: 0.1176cm)
  content((0, 1.3), [local family at $o$: $"uv"= tau^r$])
})],
  caption: [Figure 1: The split special source $A union J$, shown schematically. The two crossing curves represent the rational components of contact degree one. Their square has component types $A times A$, $A times J$, $J times A$ and $J times J$. The displayed pair $\( z \, w \)$ lies in the mixed component $A times J$ of the source square; this is one of the two component types where the bivector may have a pole. The evaluation points are not stability marks: either may also lie at the node, and they may coincide. The picture represents the source curve, not its image in $X$. The bounds in Equation (5.16) and the contact vanishing of Lemma 20 explain the cancellation. ],
) <fig:unmarked-boundary>

#thm([Lemma 5.4.])[
  (Contact vanishing at a boundary trait).  #emph[On the relatively smooth locus at the generic point of either
    $A$ or $J$, the bundle map $theta d_pi e : T_(C \/ R) arrow.r e^(*) L$ is divisible by $tau^r$.]
] <ext:contact-order>

#proof[
  Nodal fibers are Gorenstein curves. Thus $omega_(C \/ R)$ is an invertible sheaf and its formation commutes with
    base change [29] Tag #link("https://stacks.math.columbia.edu/tag/0E6R")[#raw("0E6R")]. Put
  $ cal(N) = e^(*) L ⊗ omega_(C \/ R) . $
  On either special component the dualizing degree is $- 2 + 1 = - 1$, so $cal(N)$ has multidegree $\( 0 \, 0 \)$.
    Trivializations on $A$ and $J$ can be rescaled to agree at their common node.
    Hence $cal(N) \|_(C_k) tilde.eq cal(O)_(C_k)$, with $h^0 = 1$ and $H^1 = 0$.
    On the geometric generic rational curve its degree is $2 - 2 = 0$,
    so its geometric generic restriction is trivial as well.
  We spell out the needed cohomology and base change over $R$.
    For any line bundle $cal(Q)$ on $C$ with $H^1 \( C_k \, cal(Q) \|_(C_k) \) = 0$, multiplication by $tau$ gives
  $ 0 arrow.r cal(Q) arrow.r^(med tau med) cal(Q) arrow.r cal(Q) \|_(C_k) arrow.r 0 . $
  Proper coherent cohomology is finite over the Noetherian ring $R$ [29] Section 30.19,
    Tag #link("https://stacks.math.columbia.edu/tag/02O3")[#raw("02O3")].
    The long exact sequence and Nakayama’s Lemma therefore give $H^1 \( C \, cal(Q) \) = 0$ and
  #[#set math.equation(numbering: n => "(5.8)")
   $ H^0 \( C \, cal(Q) \) \/ tau H^0 \( C \, cal(Q) \) tilde.eq H^0 \( C_k \, cal(Q) \|_(C_k) \) .
     $ <ext:dvr-base-change>]
  The finite module $H^0 \( C \, cal(Q) \)$ is torsion-free, hence free over $R$.
    Its localization is the space of sections on the generic fiber by flat base change [29] Section 30.5,
    Tag #link("https://stacks.math.columbia.edu/tag/02KE")[#raw("02KE")].
    If $cal(Q) \|_(C_k)$ is globally generated, the evaluation cokernel vanishes on the special fiber by (5.8) and
    Nakayama. Its support is proper over $R$, so if nonempty it would meet the special fiber.
    Thus evaluation is surjective everywhere.
  Apply this to $cal(N)$. Its pushforward is free of rank one,
    and evaluation is a surjection between line bundles and hence an isomorphism.
    In particular there is a nowhere-vanishing global generator $m$ of $cal(N)$.
  The pullback of the contact form, followed by the natural differential-to-dualizing map, is
  $ e^(*) L^(- 1) arrow.r Omega_(C \/ R)^1 arrow.r omega_(C \/ R) . $
  Equivalently it is a section $eta$ of $cal(N)$. There is therefore a scalar $h_R in R$ such that
  #[#set math.equation(numbering: n => "(5.9)")
   $ eta = h_R m . $ <ext:eta>]
  After completing the coherent map $Omega_(C \/ R)^1 arrow.r omega_(C \/ R)$ at the node,
    a dualizing generator in $Q$ is represented by $gamma = d u \/ u = - d v \/ v$.
    The canonical map sends $d u$ to $u gamma$ and $d v$ to $- v gamma$.
    This follows either from the hypersurface dualizing formula or by checking on the two smooth coordinate
    charts; the expressions respect $v thin d u + u thin d v = 0$ and extend in the invertible dualizing sheaf.
    In a local frame of $e^(*) L$, the coefficient of $eta$ consequently belongs to $\( u \, v \) subset Q$.
    Write $m = c$ times the product of this frame with $gamma$, where $c in Q^times$.
    The coefficient of $eta = h_R m$ is $h_R c$; multiplying by $c^(- 1)$ preserves the ideal $\( u \, v \)$.
    Thus (5.9) implies
  #[#set math.equation(numbering: n => "(5.10)")
   $ h_R in \( u \, v \) ∩ R = \( tau^r \) . $ <ext:ideal-intersection>]
  The ideal intersection is exact: $Q \/ \( u \, v \) = R \/ \( tau^r \)$.
    At either component generic point, $m$ is a unit and $tau$ has order one.
    Moreover $Omega_(C \/ R)^1 arrow.r omega_(C \/ R)$ is an isomorphism there,
    since that point is relatively smooth. Thus (5.10) gives the claimed order for the actual contact differential
    on both components. ◻
]

=== 5.5 A contraction and the possible tensor poles <a-contraction-and-the-possible-tensor-poles>

To measure the possible poles of $frak(b)$, we identify the generic source with $bb(P)^1$ by a morphism that
  preserves one special component and contracts the other. The invariant tensor on $bb(P)^1$ is regular.
  Transporting it to the source uses the inverse differential of this morphism,
  whose vanishing orders will therefore bound the poles.

Choose a $k$-point of $A \\ { o }$. Smoothness at that point and henselianity give a section $sigma :
  "Spec" R arrow.r C$ through it. Its image lies in the relatively smooth locus and is a Cartier divisor.
  The line bundle $cal(O)_C \( sigma \)$ has multidegree $\( 1 \, 0 \)$ on $A union J$.
  Its sections on $A$ extend uniquely as constant sections on $J$ with matching value at $o$.
  This proves global generation, $h^0 = 2$, and $H^1 = 0$ on the special fiber,
  for example by the normalization sequence. The argument (5.8) gives a free rank-two pushforward and surjective
  evaluation on $C$. Choosing a basis defines

#[#set math.equation(numbering: n => "(5.11)")
 $ phi.alt : C arrow.r bb(P)_R^1 . $ <ext:contraction>]

It is an isomorphism on $A$ and contracts $J$. On the generic fiber the line bundle has degree one,
  and its complete linear system is an isomorphism to $bb(P)_("Frac" \( R \))^1$:
  this may be checked after an algebraic closure and then descended.
  Thus no split-conic assumption on the original generic source was needed.

The differential of (5.11), composed with $Omega_(C \/ R)^1 arrow.r omega_(C \/ R)$, is a section

$ delta_phi.alt in H^0 \( C \, cal(M) \) \, wide cal(M) = omega_(C \/ R) ⊗ phi.alt^(*) T_(bb(P)_R^1 \/ R) . $

It is nowhere zero on the entire generic fiber, because $phi.alt$ is an isomorphism there.
  Its zero divisor is therefore effective and vertical. Write its Weil divisor on the normal surface $C$ as

#[#set math.equation(numbering: n => "(5.12)")
 $ "div" \( delta_phi.alt \) = b_A A + b_J J . $ <ext:differential-divisor>]

At the generic point of $A$ the ordinary differential of $phi.alt \|_A$ is nonzero, so $b_A = 0$.

#thm([Lemma 5.5.])[
  (The contracted-component order).  #emph[With the notation above, $b_J = r$.]
] <ext:differential-order>

#proof[
  Set $b = b_J$ and normalize the generic order along $J$ first:
  $ delta' = tau^(- b) delta_phi.alt . $
  This rational section has order zero in the component DVR of $J$.
    It therefore has a well-defined nonzero #emph[generic restriction] $s_J$ to $J$,
    a rational section of $cal(M) \|_J$. This operation means reduction of a unit in that DVR,
    and is not the usual residue of a meromorphic differential.
    At any point of $J \\ { o }$, the local Weil divisor of $delta'$ is zero.
    In a local line frame, its coefficient and inverse are regular by normality,
    so $s_J$ has neither zero nor pole there. Its divisor on $J$ is supported at $o$.
  We compute the order at $o$ without restricting a section having a pole along $J$.
    First the completed local ring $Q$ in (5.7) is normal. It is a hypersurface over a regular complete DVR,
    hence Cohen–Macaulay. A prime containing both $u \, v$ also contains $tau$ and is the height-two maximal
    ideal. Thus at a height-one prime one of $u \, v$ is invertible, and the hypersurface is regular there,
    as its corresponding partial derivative is a unit. Serre’s criterion proves normality;
    as a local normal ring it is a domain. In this ring,
  #[#set math.equation(numbering: n => "(5.13)")
   $ "div" \( v \) = r A \, wide "div" \( tau \) = A + J . $ <ext:local-divisors>]
  For example, at the generic point of $A$, $u$ is a unit and $v = tau^r \/ u$; on $J$, $v$ is a unit.
    There are no horizontal components in the divisor of $v$, since $u v = tau^r$.
  Choose a frame of $cal(M)$ in the local ring $cal(O)_(C \, o)$,
    and let $a$ be the coefficient of $delta_phi.alt$. Since $delta_phi.alt$ is nowhere zero on the entire generic
    fiber, $a$ and $a^(- 1)$ belong to $cal(O)_(C \, o) \[ 1 \/ tau \]$.
    Their images are therefore units of $Q \[ 1 \/ tau \]$: every height-one prime of $Q$ avoiding $tau$ has
    valuation zero on $a$. In particular completion introduces no horizontal zero or pole.
    The two height-one primes containing $tau$ are the component primes $A$ and $J$.
    Their DVRs dominate the corresponding component DVRs of $cal(O)_(C \, o)$,
    with $tau$ of order one in both rings because the special fibers are reduced.
    A local expression $a = tau^j a_0$ with $a_0$ a unit therefore retains its order $j$,
    since the image of $a_0$ is still a unit. Consequently, for the coefficient $f =
    tau^(- b) a$ of $delta'$ in the completed frame,
  $ "div"_Q \( f \) = - b A . $
  It follows from (5.13) that $f^r v^b$ has zero valuation at every height-one prime of $Q$.
    A normal Noetherian domain is the intersection of its height-one local rings inside its fraction field [29]
    Tag #link("https://stacks.math.columbia.edu/tag/031T")[#raw("031T")].
    Applying this to both the function and its inverse gives
  #[#set math.equation(numbering: n => "(5.14)")
   $ f^r = v^(- b) epsilon \, wide epsilon in Q^times . $ <ext:unit-equation>]
  Now reduce (5.14) at the generic point of $J$. This reduction is legitimate because $f$ has order zero there.
    The image of $v$ is a parameter on the smooth curve $J$ at $o$,
    and the image of $epsilon$ is a unit of $k \[ \[ v \] \]$. Hence $s_J^(⊗ r)$ has order $- b$ at $o$.
    It has no other zero or pole. On the other hand,
  $ deg \( cal(M) \|_J \) = deg \( omega_(C \/ R) \|_J \) + deg \( phi.alt^(*) T_(bb(P)_R^1 \/ R) \|_J \) = - 1 +
    0 = - 1 . $
  The degree of the divisor of $s_J^(⊗ r)$ is therefore $- r$. Thus $- b = - r$, proving $b_J = r$.
    The proof only used the Weil divisors of the components; it did not assume that $A$ or $J$ is Cartier when
    $r > 1$. ◻
]

=== 5.6 The four product components and extension <the-four-product-components-and-extension>

The special fiber of $C times_R C$ has the four irreducible components

$ A times A \, wide A times J \, wide J times A \, wide J times J \, $

where products in this display are over $k$. At each of their generic points both source variables are relatively
  smooth. Thus there are two ordinary relative tangent lines in which to measure the order of $frak(b)$.
  The local ring of the product at such a generic point is a DVR with uniformizer $tau$.
  Pullback from a component generic point of $C$ preserves order,
  since it sends $tau$ to this same uniformizer and a unit to a unit.

On the generic fiber, invariance of the canonical tensor gives

#[#set math.equation(numbering: n => "(5.15)")
 $ \( d phi.alt ⊗ d phi.alt \) \( frak(b) \) = \( phi.alt times phi.alt \)^(*) frak(b)_(bb(P)_R^1) .
   $ <ext:contracted-bivector>]

The right-hand side is regular. At these relatively smooth points,
  the component orders of $d phi.alt$ are the orders of $delta_phi.alt$:
  they are $0$ on $A$ and $r$ on $J$, by Lemma 21. Inverting the two differentials in (5.15) therefore costs no
  order on $A times A$, and at most $r$ on either mixed component.
  For $J times J$, repeat the construction with a section through a smooth point of $J$,
  obtaining a contraction that preserves $J$ and contracts $A$.
  Both differential orders on $J times J$ are then zero. Altogether the bounds are

#[#set math.equation(numbering: n => "(5.16)")
 $ upright("component") & A times A & A times J & J times A & J times J\
"ord" \( frak(b) \) upright(" at least") & 0 & - r & - r & 0 . $ <ext:pole-table>]

Each same-component product uses a contraction preserving that component.
  On each mixed product, exactly one inverse differential contributes a possible pole of order $r$.

Lemma 20 supplies order at least $r$ for the contact differential in #emph[either] variable.
  For $W_12^compose$ use the contact differential in the second variable,
  and for $W_21^compose$ use it in the first. In each case this cancels the only possible negative order in
  (5.16). The remaining ordinary differential $d_pi e$ is a regular homomorphism at these relatively smooth
  generic points. Thus each vector section has nonnegative order on all four product components.

We have checked every height-one point not already in $cal(D)^compose$.
  On a normal Noetherian scheme, a rational section of a locally free sheaf which is regular at all height-one
  points is regular everywhere: trivialize the sheaf and use the normal-domain intersection criterion.
  Apply this on the scheme charts of $cal(D)$ to the locally free bundles $tilde(p)^(*)
  cal(E)_12$ and $tilde(p)^(*) cal(E)_21$. It yields unique sections

#[#set math.equation(numbering: n => "(5.17)")
 $ tilde(W)_12 in H^0 \( cal(D) \, tilde(p)^(*) cal(E)_12 \) \, wide
   tilde(W)_21 in H^0 \( cal(D) \, tilde(p)^(*) cal(E)_21 \) . $ <ext:extended-vectors>]

Uniqueness makes the extensions agree on overlaps and respect the stack descent data.
  This step uses local freeness of the #emph[target] bundles;
  it asserts no local freeness of a relative tangent sheaf at a node.
  Nodes, coincident points, and all strata of higher codimension are included by this normal extension.

The two contact values of (5.17) agree on the dense smooth-source open and therefore everywhere.
  Denote their common value by $tilde(xi)$. The involution of $cal(D)$ interchanging its two factors likewise
  preserves $tilde(xi)$, with the canonical interchange of the two line factors, because it does so on that dense open.

=== 5.7 Coarse space and the full family identity <coarse-space-and-the-full-family-identity>

Let $rho : cal(D) arrow.r Y$ be the coarse moduli morphism.
  We use the following precise form of the coarse-space Theorem:
  an algebraic stack locally of finite presentation over a scheme,
  with quasi-compact separated diagonal and finite inertia, has a coarse algebraic space;
  its coarse morphism is proper, surjective and quasi-finite,
  the coarse space is separated when the stack is separated,
  and is locally of finite type over a locally Noetherian base. Moreover

#[#set math.equation(numbering: n => "(5.18)")
 $ rho_(*) cal(O)_(cal(D)) = cal(O)_Y $ <ext:coarse-functions>]

on the étale site [7] Theorem 1.1 and the following note.
  Here $cal(D)$ is a proper finite-type Deligne–Mumford stack, so its diagonal is quasi-compact and separated,
  its inertia is finite, and the stated hypotheses hold. It follows that $Y$ is of finite type and separated over
  $bb(C)$; universal closedness follows from properness of $cal(D)$ and surjectivity of its coarse morphism,
  also after every base change. Thus $Y$ is proper. Its underlying space is irreducible as the image of the
  integral stack $cal(D)$, and (5.18) makes it reduced. It is therefore an integral algebraic space.

By the universal property, $tilde(p)$ factors uniquely as $p rho$ for a morphism $p : Y arrow.r X times X$,
  which is dominant. The involution of $cal(D)$ similarly descends to an involution $iota$ of $Y$.
  Both bundles in (5.17) are pullbacks of bundles from $Y$, namely $p^(*) cal(E)_12$ and $p^(*) cal(E)_21$.
  The projection formula and (5.18) give, for either bundle $cal(V)$,

$ H^0 \( cal(D) \, rho^(*) cal(V) \) = H^0 \( Y \, cal(V) \) . $

This identity can equally be checked on étale opens trivializing $cal(V)$, where it is (5.18) in each coordinate.
  Thus (5.17) descend to the desired $W_12 \, W_21$, with the same equality of contact values and the same
  symmetry. No descent assertion about arbitrary bundles on a stack is being used.

Finally take $j = rho tilde(j)$ in (5.4). Its entire source lies over smooth source curves,
  so the original definition (5.6) gives (5.1) and (5.2) on the full neighborhood $cal(H)$.
  This completes the proof of Proposition 17.

== 6 Descent of the common contact value <des:section>

The common contact value constructed in Section 5 is a section on a proper family over $X times X$.
  We must show that its value depends only on the two points of $X$.
  Properness first gives finitely many possible values over each pair.
  The two vector lifts then control these values along contact lines in opposite factors.
  These tests exclude branching; purity and simple connectedness then give a single value.
  We formulate this descent independently of the stable-map construction. Throughout this section put

$ Z = X times X \, wide M = L times.square L . $

#thm([Proposition 6.1.])[
  (Contact-value descent on the square).  #emph[Let $X$ be a smooth simply connected complex projective contact
    Fano manifold with $"Pic" \( X \) = bb(Z) \[ L \]$. Assume that a family of free contact lines covers a dense
    open subset of $X$. Let $p : Y arrow.r Z$ be dominant, where $Y$ is a proper integral algebraic space over
    $bb(C)$. Suppose that there are regular sections
$ W_12 in H^0 #scale(x: 120%, y: 120%)[\(] Y \, p^(*) \( T_X times.square L \) #scale(x: 120%, y: 120%)[\)] \,
  wide W_21 in H^0 #scale(x: 120%, y: 120%)[\(] Y \, p^(*) \( L times.square T_X \) #scale(x: 120%, y: 120%)[\)] $

 with the same contact value
#[#set math.equation(numbering: n => "(6.1)")
 $ xi = \( theta times.square 1 \) \( W_12 \) = \( 1 times.square theta \) \( W_21 \) in H^0 \( Y \, p^(*) M \) .
   $ <des:common-value>]

 Then there is a unique section $B in H^0 \( Z \, M \)$ such that $p^(*) B = xi$.]
] <des:descent>

#proof[
  #strong[The finite image and its normalization.] The section $xi$ defines a morphism $a : Y arrow.r
    "Tot" \( M \)$ over $Z$. It is proper: its graph is closed because $"Tot" \( M \)$ is separated over $bb(C)$,
    and projection from $Y times "Tot" \( M \)$ is proper. Let $S_0$ be its reduced closed image.
    This is an integral scheme, and $a$ factors through a proper surjection $Y arrow.r S_0$, since $Y$ is reduced.
  The scheme $S_0$ is proper over $bb(C)$. Indeed it is separated and of finite type,
    and universal closedness descends along the surjection $Y arrow.r S_0$:
    after any base change, a closed subset of $S_0$ has closed inverse image in $Y$ with the same image in the
    base. Since $S_0$ is closed in the line-bundle total space, $q_0 : S_0 arrow.r Z$ is affine.
    It is also proper, hence finite. Dominance of $p$ makes $q_0$ surjective.
  Let $nu : S arrow.r S_0$ be the normalization and put $q = q_0 nu$.
    A scheme of finite type over $bb(C)$ is Nagata, so normalization is finite [29] Tags
    #link("https://stacks.math.columbia.edu/tag/035B")[#raw("035B")] and
    #link("https://stacks.math.columbia.edu/tag/035S")[#raw("035S")].
    Thus $q$ is a finite dominant morphism of integral schemes, $S$ is normal,
    and $q$ is generically étale by characteristic zero. We require an open set in the #emph[base] on which
    normalization causes no change. The morphism $nu$ is an isomorphism over a dense open $V subset S_0$.
    The finite image $q_0 \( S_0 \\ V \)$ is a proper closed subset of $Z$,
    since finite maps preserve the dimension of closed subsets.
    The image under $q$ of its non-étale locus is likewise proper and closed. Deleting both images gives a dense open
  #[#set math.equation(numbering: n => "(6.2)")
   $ U subset Z quad upright("such that") quad S times_Z U tilde.eq S_0 times_Z U arrow.r
     U upright(" is finite étale") . $ <des:base-open>]
  No morphism from $Y$ to the normalization $S$ is required.
  #strong[Every generic sheet splits over either type of line.] Choose a smooth irreducible open family $H$ of
    parametrized free contact lines with smooth dominant evaluation
  $ "ev" : H times bb(P)^1 arrow.r X . $
  This is possible by Corollary 9: freeness gives $H^1 \( bb(P)^1 \, f^(*) T_X \( - t \) \) = 0$ for every $t$,
    so evaluation is smooth at every pair $\( f \, t \)$ on the chosen open of the Hom scheme.
    For each $f in H$, let $P_f$ be the positive part of $f^(*) T_X$. Thus
  #[#set math.equation(numbering: n => "(6.3)")
   $ f^(*) T_X \/ P_f tilde.eq cal(O)_(bb(P)^1)^(xor r_f) \, wide theta \( P_f \) = 0 . $ <des:line-quotient>]
  The second assertion is Lemma 8.
  Consider a map
  $ c : bb(P)^1 arrow.r Z \, wide c = \( f \, y \) \, quad f in H \, $
  whose image meets $U$. Set $T = bb(P)^1 times_Z Y$, and let $D subset
    T$ be any reduced irreducible component dominating $bb(P)^1$, with projection $pi_D : D arrow.r bb(P)^1$.
    It is a proper integral algebraic space over $bb(C)$, and $H^0 \( D \, cal(O)_D \) = bb(C)$.
    For the latter assertion, a regular function gives a morphism to $bb(P)^1$ whose proper irreducible image
    avoids infinity, hence is a point.
  Pull $W_12$ back to $D$ and project to
  $ pi_D^(*) #scale(x: 120%, y: 120%)[\(] \( f^(*) T_X \/ P_f \) ⊗ L_y #scale(x: 120%, y: 120%)[\)] . $
  In a global trivialization this section is a constant vector,
    by (6.3) and the preceding assertion about functions. The contact map factors through this quotient.
    Consequently there exists a section
  #[#set math.equation(numbering: n => "(6.4)")
   $ a_D in H^0 \( bb(P)^1 \, c^(*) M \) \, wide xi \|_D = pi_D^(*) a_D . $ <des:component-section>]
  For the other type $c = \( y \, f \)$, the identical argument uses $W_21$ and proves the same assertion.
  We spell out why this accounts for #emph[all] sheets. Write $K = bb(C) \( bb(P)^1 \)$ and $eta = "Spec" K$.
    The surjection $Y arrow.r S_0$ remains surjective after base change, so
  $ T_eta arrow.r \( bb(P)^1 times_Z S_0 \)_eta $
  is surjective. There are finitely many irreducible components of $T$;
    the components that do not dominate $bb(P)^1$ disappear over $eta$.
    Every point of $T_eta$ therefore belongs to the generic fiber of one of the components $D$ just considered.
    Trivialize $c^(*) M$ over $K$. Then $\( bb(P)^1 times_Z S_0 \)_eta$ is a finite closed subscheme of
    $bb(A)_K^1$, and (6.4) puts the image of $D_eta$ at the $K$-rational point whose coordinate is
    $a_D \( eta \)$. Indeed the induced map from the coordinate algebra $K \[ zeta \]$ sends $zeta$ to the scalar
    $a_D \( eta \) in K$, so it factors through $K \[ zeta \] \/ \( zeta - a_D \( eta \) \) = K$.
    This does not require a $K$-rational point of $D_eta$. Surjectivity shows that every point of this finite
    subscheme is $K$-rational. By (6.2) the subscheme agrees with $\( bb(P)^1 times_Z S \)_eta$ and is finite
    étale, hence reduced. Its algebra is therefore a product of copies of $K$.
  In particular, for #emph[every] $c$ of either type that meets $U$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ C subset \( bb(P)^1 times_Z S \)_(upright("red")) upright(" an irreducible component") \, quad C arrow.r
     bb(P)^1 upright(" dominant")\
arrow.r.double wide deg \( C^nu \/ bb(P)^1 \) = 1 \, $ <des:all-sheets>]
  where $C^nu$ denotes the normalization of $C$. This conclusion uses neither flatness of $T$ nor connectedness or
    reducedness of its fibers. The embedding of $S_0$ in a line bundle is what converts the componentwise contact
    values into rational sheets.
  #strong[The local model at a ramification divisor.] Suppose that $q$ is not unramified at the generic point of
    some prime divisor $R subset S$. Its image is a prime divisor $Delta subset Z$, since $q$ is finite.
    Put $N = dim Z = 2 dim X$. There is a dense smooth open $Delta^0 subset
    Delta$ such that every point above $Delta^0$ is smooth in $S$,
    and the reduced divisors $R_i$ above $Delta$ are smooth, disjoint, and étale over $Delta^0$.
    To obtain this open, delete from $Delta$ the finite image of $"Sing" \( S \) ∩
    q^(- 1) \( Delta \)$ and those of the singular loci of the $R_i$, their pairwise intersections,
    and the non-étale loci of $R_i arrow.r Delta$, as well as the singular locus of $Delta$.
    These are proper closed subsets of $Delta$: normality makes $S$ regular at every divisorial generic point,
    and the finite maps of reduced divisors are generically separable in characteristic zero.
  At a point $s in R_i$ over $x in Delta^0$, choose local analytic coordinates $\( x_1 \, dots.h \, x_N \)$ on $Z$
    with $Delta = \( x_1 = 0 \)$. If $z_1$ locally defines $R_i$, then $q^(*) x_1 = u z_1^(e_i)$ for a unit $u$.
    Absorb an analytic $e_i$-th root of $u$ into $z_1$ and take $q^(*) x_2 \, dots.h \,
    q^(*) x_N$ as the remaining coordinates; their restrictions are coordinates along $R_i$ because its map to
    $Delta^0$ is étale. The map becomes
  #[#set math.equation(numbering: n => "(6.6)")
   $ \( z_1 \, dots.h \, z_N \) mapsto \( z_1^(e_i) \, z_2 \, dots.h \, z_N \) . $ <des:branch-model>]
  At least one $e_i$ is greater than one. Otherwise this model would make $q$ unramified at every generic point
    over $Delta$, contrary to the choice of $R$. Each point of $Delta^0$ has a preimage on such a ramified $R_i$,
    since $R_i arrow.r Delta$ is finite surjective.
  #strong[A test line detects every possible divisor.] Let $d = dim X$.
    If $Delta arrow.r X$ under the second projection is dominant,
    then for general $y in X$ its intersection with $X times {
    y }$ is a nonempty effective Cartier divisor $Delta_y$ on $X$.
    It is Cartier by restricting a local equation of $Delta$ to a fiber not contained in $Delta$,
    and its nonemptiness and dimension $d - 1$ follow from properness and the fiber dimension Theorem.
    Write $cal(O)_X \( Delta_y \) = L^(⊗ a)$. A nonzero effective divisor has positive intersection with
    $L^(d - 1)$, so $a > 0$. For every contact line $f$ not contained in $Delta_y$,
  $ deg f^(*) cal(O)_X \( Delta_y \) = a deg f^(*) L = a > 0 . $
  Thus a general test line of the first type $\( f \, y \)$ meets $Delta$.
  If $Delta$ does not dominate the second factor, its closed image $D subset X$ has dimension at least $d - 1$,
    because $dim Delta = 2 d - 1$ and its fibers have dimension at most $d$.
    Hence $D$ is a prime divisor, and the inclusion $Delta subset X times
    D$ between irreducible varieties of the same dimension is equality.
    In this case $cal(O)_X \( D \) = L^(⊗ a)$ with $a > 0$ by the same intersection argument,
    and a general line of the second type $\( y \, f \)$ meets $Delta = X times D$.
  For completeness, the required general-position assertions concern the whole chosen line family,
    whose evaluation need only be dominant. For either type let $P = H times X$, put $m = dim P$,
    and denote the universal evaluation by
  $ E : P times bb(P)^1 arrow.r Z . $
  It is smooth and dominant. If $A = Delta \\ Delta^0$, then $A$ is closed of codimension at least two in $Z$ and
  $ dim E^(- 1) \( A \) lt.eq m - 1 . $
  Projection to $P$ is proper, so the image of $E^(- 1) \( A \)$ is a proper closed subset of $P$.
    A general test line therefore avoids $A$. The scheme $E^(- 1) \( Delta^0 \)$ is smooth of pure dimension $m$.
    Discard the closures of the images of its nondominating components,
    and apply generic smoothness to the projections of its dominating components to $P$.
    For general parameters their fibers are smooth of dimension zero.
    These fibers are the inverse images of $Delta^0$ on the test line, so all intersections are transverse.
    Finally, meeting $U$ and not being contained in $Delta$ are nonempty open conditions on $P$:
    they are images under the open projection $P times bb(P)^1 arrow.r
    P$ of the corresponding nonempty open inverse images under $E$.
    All these open conditions hold simultaneously because $P$ is irreducible.
    For the type selected in the preceding two paragraphs, positive intersection ensures at least one intersection
    with $Delta^0$.
  #strong[Ramification contradicts the split sheets.] Choose this test line $c$,
    a transverse intersection $c \( t_0 \) in Delta^0$, and a ramified point $s$ above it.
    In (6.6) let $e = e_i > 1$ and take a local parameter $t$ at $t_0$.
    Eliminating the tangential coordinates, the analytic local ring of $bb(P)^1 times_Z S$ at $\( t_0 \, s \)$ is
  #[#set math.equation(numbering: n => "(6.7)")
   $ bb(C) { z_1 \, t } \/ \( z_1^e - a \( t \) \) \, wide a \( 0 \) = 0 \, quad
     a' \( 0 \) eq.not 0 . $ <des:pullback-germ>]
  It is isomorphic to $bb(C) { z_1 }$ by the analytic inverse function Theorem.
    Thus this pullback germ itself is smooth, reduced, and irreducible, and $t$ has order $e$ on it.
    In particular no vertical or embedded component passes through this germ,
    whatever happens elsewhere in the finite pullback. The unique reduced irreducible component through it
    dominates $bb(P)^1$. Its normalization is unchanged near this smooth point,
    and the resulting finite map of normal curves has ramification index $e$.
    The degree of that map is at least $e$, by the degree formula for a fiber of a finite map of smooth curves.
    This contradicts (6.5). We have proved that $q$ is unramified at every codimension-one point of $S$.
  #strong[Purity and simple connectedness.] We check the local hypotheses of purity at an arbitrary nongeneric
    point $s in S$, with $z = q \( s \)$. Both schemes are Noetherian, $cal(O)_(S \, s)$ is normal,
    $cal(O)_(Z \, z)$ is regular, and $q$ is quasi-finite at $s$ because it is finite. Moreover
  $ dim cal(O)_(S \, s) = dim cal(O)_(Z \, z) > 0 . $
  Indeed, on affine charts the corresponding finite extension of domains has going down because the base domain is
    integrally closed [29] Proposition 10.38.7,
    Tag #link("https://stacks.math.columbia.edu/tag/00H8")[#raw("00H8")].
    Going down and incomparability of primes in an integral extension give equality of the heights of
    corresponding primes, including nonclosed points. For every generization $s'$ of $s$ with $dim
    cal(O)_(S \, s') = 1$, the map $q$ is unramified at $s'$ by the preceding paragraph.
    These are precisely the local hypotheses of purity of the branch locus,
    which makes $q$ étale at $s$ [29] Lemma 58.21.4,
    Tag #link("https://stacks.math.columbia.edu/tag/0BMB")[#raw("0BMB")].
    The generic point is already étale by separability. In particular flatness is a conclusion here,
    not a premise about $q$ or its line pullbacks.
  The analytic space $Z^(upright("an")) = X^(upright("an")) times X^(upright("an"))$ is simply connected.
    The finite étale map $q$ analytifies to a finite covering, which is connected because $S$ is integral.
    It has degree one. Consequently $S_0 arrow.r Z$ is finite birational and hence an isomorphism,
    since $Z$ is normal [29] Lemma 29.55.8, Tag #link("https://stacks.math.columbia.edu/tag/0AB1")[#raw("0AB1")].
    Its closed inclusion into $"Tot" \( M \)$ is the graph of a global section $B$ with $p^(*) B = xi$.
    Finally, pullback of sections of a line bundle along a dominant map of integral spaces is injective.
    This proves uniqueness. ◻
]

#thm([Corollary 6.2.])[
  (Symmetry and the full local family).  #emph[Apply Proposition 22 to the space and tensors of Proposition 17.
    The resulting section $B in H^0 \( X times X \, L times.square L \)$ is symmetric under exchange of the
    factors, using the canonical exchange of the two line factors.
    For the full neighborhood $cal(H)$ of $g$ in the space of parametrized degree-two maps provided there, one has
#[#set math.equation(numbering: n => "(6.8)")
 $ B #scale(x: 120%, y: 120%)[\(] h \( z \) \, h \( w \) #scale(x: 120%, y: 120%)[\)] = \( z - w \)^2 thin theta
   #scale(x: 120%, y: 120%)[\(] d h \( partial_z \) #scale(x: 120%, y: 120%)[\)] ⊗ theta
   #scale(x: 120%, y: 120%)[\(] d h \( partial_w \) #scale(x: 120%, y: 120%)[\)] \, wide
   h in cal(H) . $ <des:family-identity>]

 This identity holds for all pairs of source points, including the diagonal;
   its displayed expression uses any common affine coordinate.]
] <des:family>

#proof[
  Let $sigma : Z arrow.r Z$ exchange the two factors, and let $iota : Y arrow.r
    Y$ be the involution in Proposition 17. Under the canonical line-bundle identifications, $p iota =
    sigma p$ and $iota^(*) xi = xi$. Hence
  $ p^(*) \( sigma^(*) B \) = iota^(*) \( p^(*) B \) = iota^(*) xi = xi = p^(*) B . $
  Dominance of $p$ gives $sigma^(*) B = B$.
  The equality $p^(*) B = xi$ pulls back along the morphism $cal(H) times bb(P)^1 times bb(P)^1 arrow.r
    Y$ supplied by Proposition 17. Its smooth-source formula (5.2) gives (6.8).
    Here $cal(H)$ is a neighborhood in the full Hom space by Lemma 16,
    so no deformation directions at $g$ are lost. Coordinate independence and regularity at infinity follow from
    the invariant tensor $\( z - w \)^2 partial_z ⊗ partial_w$;
    its double zero on the diagonal also proves the asserted diagonal identity. ◻
]

== 7 Diagonal jets and contact transitivity <jet:section>

Corollary 23 provides a symmetric section

$ B in H^0 \( X times X \, L times.square L \) $

and the identity

#[#set math.equation(numbering: n => "(7.1)")
 $ B \( h \( z \) \, h \( w \) \) = \( z - w \)^2 theta \( h' \( z \) \) ⊗ theta \( h' \( w \) \) $ <jet:family>]

on the full neighborhood $cal(H)$ of the very free parametrized map $g$ of Proposition 15.
  Here $z \, w$ belong to one affine coordinate chart of $bb(P)^1$,
  and $h'$ denotes differentiation in that coordinate. We first determine the diagonal symbol of $B$ at every
  point of $X$. We then prove a criterion that applies to any compact complex contact manifold with such a
  symmetric section.

=== 7.1 From the full family to the diagonal <from-the-full-family-to-the-diagonal>

#thm([Lemma 7.1.])[
  #emph[Fix the parameter $0 in bb(P)^1$ and its affine coordinate.
    There is a Zariski-open neighborhood $cal(U) subset cal(H)$ of $g$ on which the value–velocity morphism
$ cal(U) arrow.r T_X \, wide h mapsto #scale(x: 120%, y: 120%)[\(] h \( 0 \) \,
  h' \( 0 \) #scale(x: 120%, y: 120%)[\)] \, $

 is smooth. Its image is open in $T_X$. Its projection is a nonempty open subset $U subset X$,
   and for each $x in U$ the velocities of maps in $cal(U)$ with $h \( 0 \) =
   x$ form a nonempty open subset of $T_x X$.]
] <jet:value-velocity>

#proof[
  Put $E = g^(*) T_X$. Every splitting summand of $E$ has degree at least one,
    so $H^1 \( E \( - 2 dot.op 0 \) \) = 0$. The exact sequence
  $ 0 arrow.r E \( - 2 dot.op 0 \) arrow.r E arrow.r E \|_(2 dot.op 0) arrow.r 0 $
  therefore makes $H^0 \( E \) arrow.r H^0 \( E \|_(2 dot.op 0) \)$ surjective.
    The Hom space is smooth at $g$ and has tangent space $H^0 \( E \)$.
    In target coordinates its joint value and velocity differential is
  $ psi mapsto #scale(x: 120%, y: 120%)[\(] psi \( 0 \) \, psi' \( 0 \) #scale(x: 120%, y: 120%)[\)] \, $
  which is precisely this restriction map, expressed in the coordinate trivialization along $g$. It is surjective.
    The source and target are smooth at the points in question,
    so the smooth locus of this morphism contains a Zariski-open neighborhood $cal(U) subset cal(H)$ of $g$.
    Its image in $T_X$ is open. Projection to $X$ and intersection with its fibers give the final assertions. ◻
]

Let $Delta subset X times X$ be the diagonal, let $cal(I)$ be its ideal sheaf, and put $M = L times.square L$.
  We identify $cal(I) \/ cal(I)^2$ with $Omega_X^1$ by sending the class of $f \( y \) - f \( x \)$ to $d f$.
  Since $Delta$ is a regular embedding,

#[#set math.equation(numbering: n => "(7.2)")
 $ \( cal(I)^k \/ cal(I)^(k + 1) \) ⊗ M \|_Delta tilde.eq "Sym"^k Omega_X^1 ⊗ L^(⊗ 2) . $ <jet:symbol-bundles>]

We write $theta^2$ for the symmetric square of the $L$-valued one-form $theta$,
  with quadratic value $v mapsto theta \( v \)^2$.

#thm([Proposition 7.2.])[
  #emph[The section $B$ vanishes to order at least two along $Delta$, and its second diagonal symbol is
#[#set math.equation(numbering: n => "(7.3)")
 $ B in H^0 \( X times X \, cal(I)^2 ⊗ M \) \, wide \[ B \]_2 = theta^2 quad
   upright("in ") H^0 \( X \, "Sym"^2 Omega_X^1 ⊗ L^(⊗ 2) \) . $ <jet:second-symbol>]

]
] <jet:diagonal>

#proof[
  Choose local coordinates and one local frame $e$ of $L$, used in both factors.
    Write $theta = e alpha$ and $B \( x \, y \) = b \( x \, y \) e \( x \) ⊗ e \( y \)$.
    Fix $x in U$ as in Lemma 24. Setting $z = 0$ in Equation (7.1), for a nearby map with $h \( 0 \) =
    x$ and $h' \( 0 \) = a$, gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ b \( x \, h \( w \) \) = w^2 alpha_x \( a \) alpha_(h \( w \)) \( h' \( w \) \) = w^2 alpha_x \( a \)^2 +
     O \( w^3 \) . $ <jet:curve-expansion>]
  The constant term proves $B \|_Delta = 0$ on $U$. As this restriction is a global holomorphic section of
    $L^(⊗ 2)$ on connected $X$, it vanishes everywhere.
  The first symbol is now intrinsically a section of $Omega_X^1 ⊗ L^(⊗ 2)$.
    On $U$, its value on $a$ is the coefficient of $w$ in Equation (7.4).
    That coefficient vanishes for a nonempty open set of velocities, so the linear form is zero.
    The first symbol consequently vanishes on all of $X$, again by the identity Theorem.
    Thus $B$ belongs to $cal(I)^2 ⊗ M$ globally.
  Its second symbol is now the global section in Equation (7.2) for $k = 2$.
    Because the linear term has vanished, the acceleration $h'' \( 0 \)$ contributes nothing to the coefficient of
    $w^2$ in Equation (7.4). The quadratic symbol takes the value $alpha_x \( a \)^2$ on a nonempty open set of
    $a$, and hence equals $alpha_x^2$ as a quadratic form. The difference $\[ B \]_2 -
    theta^2$ is a holomorphic section of the displayed symbol bundle, zero on $U$; it is therefore zero on $X$.
    Each continuation has been performed after the preceding lower symbol vanished,
    so all three identities are intrinsic. ◻
]

=== 7.2 A symmetric-jet criterion <a-symmetric-jet-criterion>

The remainder of the argument uses only symmetry and Equation (7.3).
  The quadratic symbol records contact values of tangent vectors. Symmetry determines the next Taylor term.
  Differentiating this expansion in the first slot reveals the Levi form,
  which will detect directions inside the contact plane. We first make this local calculation,
  then use it to prove Theorem 28.

#thm([Lemma 7.3.])[
  #emph[Let $B$ be symmetric and satisfy Equation (7.3) on a complex contact manifold.
    In local coordinates and a frame as above, put $s = y - x$ and
    $A_x \( u \, v \) = \( partial_u alpha \)_x \( v \)$, where $partial$ differentiates the coefficients of
    $alpha$. Then
#[#set math.equation(numbering: n => "(7.5)")
 $ b \( x \, x + s \) = alpha_x \( s \)^2 + alpha_x \( s \) A_x \( s \, s \) + O \( s^4 \) . $ <jet:cubic>]

 Differentiation in the first slot, with the second slot held fixed, gives
#[#set math.equation(numbering: n => "(7.6)")
 $ D_v^(\( 1 \)) b \( x \, x + s \) =  & - 2 alpha_x \( s \) alpha_x \( v \) + alpha_x \( s \) d alpha_x \( v \, s \)\
 & #h(8mm)  - alpha_x \( v \) A_x \( s \, s \) + O \( s^3 \) . $ <jet:fixed-second>]

]
] <jet:local-calculation>

#proof[
  Write the expansion initially as $b \( x \, x + s \) = Q_x \( s \) + C_x \( s \) + O \( s^4 \)$,
    where $Q_x \( s \) = alpha_x \( s \)^2$ and $C_x$ is homogeneous of degree three.
    Symmetry, with the same frame in both slots, gives
  $ Q_x \( s \) + C_x \( s \) = Q_(x + s) \( - s \) + C_(x + s) \( - s \) + O \( s^4 \) . $
  The two terms on the right are respectively
  $ alpha_x \( s \)^2 + 2 alpha_x \( s \) A_x \( s \, s \) + O \( s^4 \) \, wide - C_x \( s \) + O \( s^4 \) . $
  Thus $C_x \( s \) = alpha_x \( s \) A_x \( s \, s \)$, proving Equation (7.5).
  For the first-slot derivative, $y$ is fixed and hence $s = y - x$ has derivative $- v$. The quadratic term contributes
  $ - 2 alpha_x \( s \) alpha_x \( v \) + 2 alpha_x \( s \) A_x \( v \, s \) . $
  Through degree two, the cubic term contributes only through its arguments $s$, giving
  $ - alpha_x \( v \) A_x \( s \, s \) - alpha_x \( s \) #scale(x: 120%, y: 120%)[\(] A_x \( v \, s \) +
    A_x \( s \, v \) #scale(x: 120%, y: 120%)[\)] . $
  Their sum is Equation (7.6), since $d alpha_x \( v \, s \) = A_x \( v \, s \) - A_x \( s \, v \)$.
    Differentiating the holomorphic remainder with $y$ fixed lowers its order by at most one.
  These scalar formulas also keep track of changes of line frame. If $e' = q e$ and $rho = q^(- 1)$, then
  $ alpha' = rho alpha \, wide b' \( x \, y \) = rho \( x \) rho \( y \) b \( x \, y \) . $
  The cubic coefficient transforms as
  $ C'_x \( s \) = rho \( x \)^2 C_x \( s \) + rho \( x \) d rho_x \( s \) alpha_x \( s \)^2 =
    alpha'_x \( s \) \( partial_s alpha' \)_x \( s \) . $
  Moreover the derivative at fixed $y$ transforms by
  $ D_v^(\( 1 \)) b' = rho \( x \) rho \( y \) D_v^(\( 1 \)) b + d rho_x \( v \) rho \( y \) b . $
  In particular, it includes exactly the first-slot frame term.
    The cubic is a coordinate expression; the symbol in Equation (7.3) is intrinsic. ◻
]

#thm([Lemma 7.4.])[
  (Contact Hamiltonians).  #emph[On a complex contact manifold,
    contact value identifies the holomorphic vector fields preserving $F$ with $H^0 \( X \, L \)$ [20]
    Proposition 2.1. For $a in H^0 \( X \, L \)$, write $K_a$ for the corresponding field.
    In a frame $theta = e alpha$, $a = e f$, it is characterized by
#[#set math.equation(numbering: n => "(7.7)")
 $ alpha \( K_a \) = f \, wide d f \( w \) + d alpha \( K_a \, w \) =
   0 quad \( w in F \) . $ <jet:hamiltonian-equations>]

 Its value at a point depends only on the ordinary first jet of $a$.]
] <jet:hamiltonian>

#proof[
  Choose a local holomorphic field $R$ with $alpha \( R \) = 1$ and write $K_a = f R + Z$ with $Z in F$.
    The second equation determines $Z$ uniquely and holomorphically because $d alpha \|_F$ is nondegenerate.
    Cartan’s formula identifies that equation with $\( cal(L)_(K_a) alpha \) \|_F = 0$,
    equivalently $\[ K_a \, F \] subset F$. It also proves that every field preserving $F$ satisfies the equations
    for its contact value.
  For completeness, under a frame change $alpha' = rho alpha$, $f' = rho f$, and for $w in F$, we have
  $ d f' \( w \) + d alpha' \( K_a \, w \) = rho #scale(x: 120%, y: 120%)[\(] d f \( w \) +
    d alpha \( K_a \, w \) #scale(x: 120%, y: 120%)[\)] \, $
  since the extra terms are $d rho \( w \) f - d rho \( w \) alpha \( K_a \) = 0$.
    The first equation transforms by the same factor. Uniqueness therefore makes the local fields independent of
    the chosen frame and lift $R$, and they glue. The displayed equations use only $f \( x \)$ and $d
    f_x$ to determine $K_a \( x \)$. This also proves naturality under contact automorphisms. ◻
]

#thm([Theorem 7.5.])[
  (Symmetric-jet criterion).  #emph[Let $X$ be a connected compact complex contact manifold with contact quotient
    $theta : T_X arrow.r L$, and let $cal(I)_Delta$ be the ideal sheaf of the diagonal in $X times X$.
    Suppose that a symmetric section $B in H^0 \( X times X \, L times.square L \)$ satisfies
$ B in H^0 \( X times X \, cal(I)_Delta^2 ⊗ \( L times.square L \) \) \,\
""_2 = theta^2 quad upright("in ") H^0 \( X \, "Sym"^2 Omega_X^1 ⊗ L^(⊗ 2) \) . $

 Then the ordinary first-jet evaluation map
#[#set math.equation(numbering: n => "(7.8)")
 $ H^0 \( X \, L \) arrow.r J_x^1 L $ <jet:jet-generation>]

 is surjective at every $x in X$. Global contact vector fields span $T_x X$ at every point,
   and the identity component of the holomorphic contact automorphism group acts transitively.]
] <jet:criterion>

#proof[
  Put $d = dim X$ and $V = H^0 \( X \, L \)$, a finite-dimensional vector space by compactness.
    Write $B_x$ for the restriction of $B$ to ${ x } times X$, viewed as an element of $L_x ⊗ V$.
    Point evaluations followed by fiber functionals span $V^(*)$,
    since only the zero section vanishes at every point. Choose a basis $epsilon_1 \, dots.h \,
    epsilon_r$ among these functionals, and let $s_1 \, dots.h \, s_r$ be its dual basis in $V$.
    Contracting the second factor of $B$ by $epsilon_j$ gives a global section $t_j$ of $L$ on the first factor.
    For each $x$, all the $epsilon_j$ kill $B_x - sum_j t_j \( x \) ⊗ s_j$, so that difference is zero.
    Hence $B = sum_j t_j ⊗ s_j$, and in particular
  $ B in H^0 \( X \, L \) ⊗ V = H^0 \( X \, L ⊗ \( V ⊗ cal(O)_X \) \) . $
  For each $x$, the vector $B_x in L_x ⊗ V$ is nonzero. Indeed $B_x =
    0$ would say that $B \( x \, y \)$ vanishes identically in $y$,
    contradicting its nonzero quadratic term $alpha_x \( s \)^2$. Thus $B$ gives a line subbundle and a holomorphic map
  #[#set math.equation(numbering: n => "(7.9)")
   $ L^(- 1) arrow.r.hook V ⊗ cal(O)_X \, wide beta : X arrow.r bb(P) \( V \) \, wide
     beta^(*) cal(O)_(bb(P) \( V \)) \( 1 \) tilde.eq L . $ <jet:beta>]
  We claim that $beta$ is an immersion. In a local frame write $B = e ⊗ w$,
    with $w$ a holomorphic $V$-valued function. If $d beta_x \( v \) = 0$, then $partial_v w \( x \) =
    k w \( x \)$ for a scalar $k$, independent of the second variable.
    Evaluating these global sections in the frame at $y$ gives
  #[#set math.equation(numbering: n => "(7.10)")
   $ D_v^(\( 1 \)) b \( x \, y \) = k b \( x \, y \) . $ <jet:kernel>]
  The linear terms of Equation (7.6) imply $alpha_x \( v \) = 0$, because $alpha_x$ is a nonzero linear form.
    The quadratic terms then give the polynomial identity
  $ alpha_x \( s \) d alpha_x \( v \, s \) = k alpha_x \( s \)^2 . $
  Cancelling the nonzero linear polynomial $alpha_x \( s \)$ shows $d alpha_x \( v \, dot.op \) = k alpha_x$.
    Its restriction to $F_x$ is zero. Since $v in F_x$, contact nondegeneracy gives $v = 0$.
  We now pass explicitly from this immersion to actual global sections. Every $lambda in V^(*)$ gives
  $ t_lambda = \( "id" ⊗ lambda \) B in H^0 \( X \, L \) \, wide \( t_lambda \)_(upright("loc")) = lambda \( w \) . $
  If $v_1 \, dots.h \, v_d$ is a basis of $T_x X$, the $d + 1$ vectors
  $ w \( x \) \, med partial_(v_1) w \( x \) \, dots.h \, partial_(v_d) w \( x \) $
  are linearly independent: a dependence with nonzero tangent part would contradict immersion,
    and a dependence with zero tangent part contradicts $w \( x \) eq.not 0$. Dualizing gives surjectivity of
  $ V^(*) arrow.r L_x xor \( T_x^(*) X ⊗ L_x \) \, wide lambda mapsto #scale(x: 120%, y: 120%)[\(]
    t_lambda \( x \) \, d \( t_lambda \)_(upright("loc") \, x) #scale(x: 120%, y: 120%)[\)] \, $
  where the target is the local-frame description of $J_x^1 L$.
    Recall its intrinsic exact sequence $0 arrow.r Omega_X^1 ⊗ L arrow.r J^1 L arrow.r L arrow.r 0$.
    Since every $t_lambda$ belongs to $H^0 \( X \, L \)$, this proves Equation (7.8).
    No nondegeneracy of $B$ as a tensor in $V ⊗ V$ is required.
  Given $u in T_x X$, prescribe a first jet $j_x^1 a$ whose scalar representative satisfies
  $ f \( x \) = alpha_x \( u \) \, wide d f_x \|_(F_x) = - d alpha_x \( u \, dot.op \) \|_(F_x) . $
  Extend the prescribed covector arbitrarily from $F_x$ to $T_x X$.
    First-jet surjectivity realizes this jet by a global section $a$.
    Lemma 27 and uniqueness in Equation (7.7) imply $K_a \( x \) = u$.
    Thus global contact fields span every tangent space.
  A global holomorphic vector field on a compact complex manifold has a global flow for sufficiently small complex
    time. Compactness allows a common time disk for all initial points,
    and the inverse is supplied by negative time. For a contact field these automorphisms preserve $F$ and form a
    path through the identity. At any point, compositions of such flows for a spanning set of fields have
    surjective differential at zero. Every orbit of the identity component therefore contains a neighborhood of
    each of its points. All orbits are open, and connectedness of $X$ implies that there is only one. ◻
]

=== 7.3 The algebraic action <the-algebraic-action>

#thm([Corollary 7.6.])[
  #emph[For every smooth contact Fano manifold in Theorem 1, the identity component $G =
    "Aut" \( X \, F \)^0$ is a connected linear algebraic group acting transitively on $X$.]
] <jet:transitive>

#proof[
  In the primitive Picard case, Proposition 25 and Theorem 28 give holomorphic contact transitivity.
    Proposition 6 supplies a connected transitive contact group in both remaining Picard alternatives.
  Choose $m > 0$ such that $- m K_X$ is very ample. Its canonical functoriality embeds $"Aut" \( X \)$ as the
    closed stabilizer of $X$ in the projective linear group of this anticanonical embedding.
    Preserving $F$ is also a closed condition: under the induced action on $bb(P) \( T_X \)$ it is the condition
    of stabilizing the closed subvariety $bb(P) \( F \)$. Thus $"Aut" \( X \, F \)$ is linear algebraic.
    Holomorphic automorphisms of projective $X$ are algebraic,
    and the contact flows in the proof of Theorem 28 belong to its identity component:
    their action on the anticanonical embedding varies continuously from the identity.
    Consequently $G$ acts transitively in the primitive case as well. ◻
]

== 8 Identification with a simple adjoint variety <hom:section>

We finish with the algebraic consequence of contact transitivity.
  The argument uses the Borel fixed-point Theorem and standard highest-weight theory,
  rather than a classification of homogeneous contact manifolds.

#thm([Proposition 8.1.])[
  #emph[Let $\( X \, F \)$ be a smooth connected complex projective contact manifold with ample contact line $L$.
    Suppose a connected algebraic group $G$ acts effectively and transitively on $X$, preserving $F$.
    Then $frak(g) = "Lie" \( G \)$ is simple, and contact values of fundamental vector fields define an isomorphism
$ Phi : \( X \, F \) arrow.r^(med tilde.op med) #scale(x: 120%, y: 120%)[\(]
  bb(P) \( cal(O)_min \( frak(g) \) \) \, F_(upright("can")) #scale(x: 120%, y: 120%)[\)] . $

 Under this isomorphism, $L$ is the restriction of the hyperplane line bundle of $bb(P) \( frak(g) \)$.]
] <hom:adjoint>

#proof[
  The contact determinant formula gives $- K_X = L^(⊗ \( n + 1 \))$, so $X$ is Fano.
    The algebraic action canonically linearizes a sufficiently high anticanonical power,
    giving an algebraic homomorphism to the projective linear group of the resulting embedding.
    It has trivial kernel by effectivity and, in characteristic zero, identifies $G$ with its closed image.
    Thus $G$ is linear algebraic. Let $R \( G \)$ be its connected solvable radical.
    The Borel fixed-point Theorem for a connected solvable linear algebraic group acting on a nonempty complete
    variety gives an $R \( G \)$-fixed point $x_0$ [22] Corollary 17.3.
    Normality gives, for $r in R \( G \)$ and $g in G$,
  $ r \( g x_0 \) = g \( g^(- 1) r g \) x_0 = g x_0 . $
  Transitivity and effectivity therefore imply $R \( G \) = 1$. Thus $G$ is semisimple.
  For $D in frak(g)$, write $D_X \( x \) = frac(d, d t)\|_0 exp \( t D \) x$.
    The quotient $L = T_X \/ F$ has its natural $G$-linearization.
    Transitivity in characteristic zero makes evaluation of fundamental fields surjective onto $T_X$,
    so their contact values give a surjection
  $ frak(g) ⊗ cal(O)_X arrow.r L \, wide D mapsto theta \( D_X \) . $
  Its dual is a line subbundle of $frak(g)^(*) ⊗ cal(O)_X$.
    With our convention that projective spaces parametrize lines, this defines the $G$-equivariant morphism
  #[#set math.equation(numbering: n => "(8.1)")
   $ Phi : X arrow.r bb(P) \( frak(g)^(*) \) \, wide Phi^(*) cal(O)_(bb(P) \( frak(g)^(*) \)) \( 1 \) tilde.eq L .
     $ <hom:moment>]
  It is finite onto its image: otherwise a positive-dimensional projective fiber would contain a curve on which
    $L$ has degree zero, contrary to ampleness. Its image is a single closed $G$-orbit,
    since $X$ is projective and $G$ acts transitively.
  Choose a Borel subgroup $B = T U$ of $G$ and a $B$-fixed point of $X$.
    Its image is a $B$-stable line $bb(C) ell subset frak(g)^(*)$.
    We spell out the highest-weight argument, including the possibility of several simple factors.
    Decompose into simple ideals and their dual representations:
  $ frak(g) = xor.big_(i = 1)^s frak(g)_i \, wide frak(g)^(*) = xor.big_(i = 1)^s frak(g)_i^(*) . $
  Each $frak(g)_i^(*)$ is irreducible. Its $U$-fixed subspace is its one-dimensional highest-weight space [22]
    Definition 22.16 and Theorem 22.18. The weights $lambda_i$ of these spaces are nonzero and distinct:
    on $"Lie" \( T \)$ each is supported on the Cartan subalgebra of the $i$th simple ideal,
    and is zero on the other summands. These are the standard highest-weight properties of the adjoint
    representation; see the proof of [2] Proposition 2.6 for the simple case.
    Because a unipotent group has no nontrivial characters, $U$ fixes $ell$,
    while $T$ acts on $bb(C) ell$ by a single character. Writing $ell = sum_i ell_i$,
    every nonzero $ell_i$ would therefore have that same weight $lambda_i$.
    Distinctness forces exactly one nonzero component. Thus $bb(C)
    ell$ is the highest-weight line of one simple coadjoint summand.
  Let $x$ be the chosen point and put $H = "Stab"_G \( x \)$ and $Q = "Stab"_G \( \[ ell \] \)$.
    Equivariance gives $H subset Q$, and finiteness of $Phi$ gives $dim H = dim Q$.
    The subgroup $Q$ contains $B$, so it is parabolic and is connected by [22] Corollary 17.49.
    This statement applies to every connected semisimple $G$, without a simply connectedness hypothesis.
    A connected algebraic group is irreducible; its closed subgroup $H$ of the same dimension must therefore be
    all of $Q$. Consequently the homogeneous map
  $ X tilde.eq G \/ H arrow.r G \/ Q = Phi \( X \) $
  is an isomorphism. Every other simple factor acts trivially on the chosen coadjoint summand, hence on $X$.
    Effectivity excludes these factors, and $frak(g)$ is simple.
  The Killing form now identifies $frak(g)^(*)$ with $frak(g)$ equivariantly.
    The highest-weight line becomes the line of a highest-root vector $e$, which is nilpotent.
    Its orbit $cal(O) = G dot.op e$ is stable under nonzero scalar multiplication:
    the nonzero root character of $T$ takes all values in $bb(C)^(*)$. Thus $bb(P) \( cal(O) \) = Phi \( X \)$.
    For completeness, this is exactly the projectivization of the unique smallest nonzero nilpotent orbit.
    Indeed every nonzero nilpotent orbit is a cone: the Jacobson–Morozov Theorem supplies an $frak(s l)_2$-triple
    and hence the scalings. Its projective closure contains a Borel-fixed point,
    necessarily the unique highest-weight line. It therefore contains $bb(P) \( cal(O) \)$.
    Its dimension is at least $dim bb(P) \( cal(O) \)$, with equality only when its projective closure equals that
    closed orbit. Since both nilpotent orbits are cones, equality then gives the same orbit.
    This also proves uniqueness; compare [2] Section 2.4 and Proposition 2.6.
  It remains to identify the given distribution. We do this on the coadjoint cone, retaining the convention
  $ \( "ad"^(*) \( A \) ell \) \( D \) = - ell \( \[ A \, D \] \) \, wide
    omega_ell \( "ad"^(*) \( A \) ell \, "ad"^(*) \( D \) ell \) = ell \( \[ A \, D \] \) $
  for the coadjoint action and the Kirillov–Kostant–Souriau form.
    The latter is a closed nondegenerate form on the orbit. Under scalar multiplication it has weight one.
    If $E$ is the Euler vector field and $lambda = iota_E omega$, then $d lambda = omega$ and $lambda \( E \) =
    0$. The form $lambda$ has weight one, so it descends under $cal(O) arrow.r
    bb(P) \( cal(O) \)$ to an $cal(O)_(bb(P) \( frak(g)^(*) \)) \( 1 \)$-valued one-form.
    Explicitly, the cone is the tautological line bundle with its zero section removed.
    For a tangent vector $u$ at $\[ ell \]$, assign to $ell$ the scalar $lambda_ell \( tilde(u) \)$,
    where $tilde(u)$ is a lift of $u$. The equality $lambda \( E \) = 0$ makes this independent of the lift,
    and weight one makes it linear in $ell$. Its value thus lies in the dual tautological line.
    Its kernel is the canonical contact distribution; contact nondegeneracy follows from
  $ lambda and omega^n = frac(1, n + 1) thin iota_E \( omega^(n + 1) \) eq.not 0 . $
  This is the symplectic-cone construction of [2] Sections 2.1–2.2.
  At $Phi \( x \) = \[ ell \]$, choose the nonzero functional on $L_x$ that represents $ell$ in the dual of the
    contact-value map. For $frak(h) = "Lie" \( H \)$, evaluation identifies $T_x X$ with $frak(g) \/ frak(h)$, and
  #[#set math.equation(numbering: n => "(8.2)")
   $ frak(h) subset ker ell \, wide F_x = \( ker ell \) \/ frak(h) . $ <hom:hyperplane>]
  Choose $A_0 in frak(g)$ with $"ad"^(*) \( A_0 \) ell = ell$;
    at a highest-weight vector one takes a Cartan element of weight one,
    and conjugation gives the assertion throughout the orbit. This represents the Euler vector, and our conventions give
  $ lambda_ell \( "ad"^(*) \( D \) ell \) = omega_ell \( "ad"^(*) \( A_0 \) ell \, "ad"^(*) \( D \) ell \) =
    ell \( \[ A_0 \, D \] \) = - ell \( D \) . $
  Its kernel on the projective tangent space is precisely (8.2).
    Changing the sign convention for $omega$ changes neither kernel.
    Thus $d Phi$ carries the original $F$ to $F_(upright("can"))$, as required; see also [2] Remark 2.3. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] In the primitive Picard case,
    Corollary 29 gives connected algebraic contact transitivity.
    In the two other cases, Proposition 6 gives it directly. Apply Proposition 30 to the effective identity
    component of the contact automorphism group. The resulting algebraic isomorphism identifies both $F$ and its
    quotient $L$, proving Theorem 1 for every $n gt.eq 1$. ◻
]

=== 8.1 Consequences <consequences>

#thm([Corollary 8.2.])[
  #emph[The incidence and projective-space alternatives in Proposition 6 are the adjoint contact varieties of
    $frak(s l)_(n + 2) \( bb(C) \)$ and $frak(s p)_(2 n + 2) \( bb(C) \)$, respectively.
    Their adjoint polarizations are $cal(O) \( 1 \, 1 \)$ and $cal(O) \( 2 \)$.]
] <hom:models>

#proof[
  For $V = bb(C)^(n + 2)$ the incidence embedding is
  $ \( \[ v \] \, \[ f \] \) mapsto \[ v ⊗ f \] in bb(P) \( frak(s l) \( V \) \) \, wide f \( v \) = 0 . $
  These are the rank-one nilpotent matrices, the orbit of a highest-root line.
    The embedding is the restricted Segre embedding, so its hyperplane line is $cal(O) \( 1 \, 1 \)$.
    For the tautological contact form the contact value of $D in frak(s l) \( V \)$ is $f \( D v \) =
    "tr" \( \( v ⊗ f \) D \)$; the Killing form is a nonzero multiple of this trace pairing.
    This is therefore precisely the projective contact-value map of Proposition 30.
  For a symplectic space $\( W \, sigma \)$ of dimension $2 n + 2$, put $N_v \( w \) = sigma \( v \, w \) v$.
    Then $N_v in frak(s p) \( W \)$, and
  $ \[ v \] mapsto \[ N_v \] in bb(P) \( frak(s p) \( W \) \) $
  is the quadratic Veronese embedding under $frak(s p) \( W \) tilde.eq "Sym"^2 W$.
    Its image is the orbit of the highest-root line, and its hyperplane line is $cal(O)_(bb(P) \( W \)) \( 2 \)$.
    The symplectic projective contact form has value $sigma \( v \, D v \) =
    "tr" \( N_v D \)$ on a fundamental field, so this too is the contact-value map under the Killing pairing.
    Both identifications preserve the given contact distributions by Propositions 6 and 30; compare [2] Examples 2.7. ◻
]

#thm([Corollary 8.3.])[
  #emph[In the primitive Picard case, every point of $X$ lies on an immersed rational curve $u : bb(P)^1 arrow.r
    X$ satisfying
$ u^(*) L tilde.eq cal(O) \( 2 \) \, wide theta thin d u : T_(bb(P)^1) arrow.r^tilde.op u^(*) L \, wide
  u^(*) F tilde.eq cal(O) \( 1 \)^(xor 2 n) . $

]
] <jet:good-curves>

#proof[
  Lemma 24 gives a map $u$ near $g$ with $theta \( u' \( 0 \) \) eq.not 0$.
    We may keep $u^(*) T_X$ strictly positive: this is the open condition $H^1 \( u^(*) T_X \( - 2 \) \) = 0$.
    Its rank is $d = 2 n + 1$ and its degree is $\( - K_X \) dot.op u_(*) \( bb(P)^1 \) = 2 \( n + 1 \) = d + 1$.
    Therefore its splitting is
  $ u^(*) T_X tilde.eq cal(O) \( 2 \) xor cal(O) \( 1 \)^(xor 2 n) . $
  The map $theta thin d u : cal(O) \( 2 \) arrow.r cal(O) \( 2 \)$ is nonzero at $0$, hence an isomorphism.
    In particular $u$ is immersive. Its differential maps into the unique degree-two summand,
    because $"Hom" \( cal(O) \( 2 \) \, cal(O) \( 1 \) \) = 0$, and identifies that summand with $T_(bb(P)^1)$.
    The contact quotient therefore splits by $d u$, and $u^(*) F tilde.eq cal(O) \( 1 \)^(xor 2 n)$.
    Finally, Corollary 29 carries $u \( 0 \)$ to any prescribed point by a contact automorphism,
    preserving all these properties. ◻
]

#proof[
  Theorem 1 gives an algebraic isomorphism $phi : X arrow.r Y_(frak(g))$.
    Wolf’s correspondence identifies $Y_(frak(g))$, with its complex structure,
    as the twistor space of a compact symmetric positive quaternionic-Kähler model [30]; see also [20] Section 2.
    A constant rescaling normalizes the model metric without changing its twistor complex structure.
    LeBrun’s positive twistor theorem then gives a Kähler–Einstein metric $h$ on $Y_(frak(g))$ with $"Ric"_h =
    lambda h$ for some $lambda > 0$; the theorem includes $n =
    1$ under the four-dimensional self-dual Einstein convention [20] Theorem 2.1 and Definition 2.3.
    Since $phi$ is biholomorphic, $phi^(*) h$ is Kähler for the given complex structure on $X$,
    and naturality of Ricci curvature gives $"Ric"_(phi^(*) h) = lambda phi^(*) h$. ◻
]

#proof[
  An ample divisor has a nonzero class in $H^2 \( X \, bb(Q) \)$, so $b_2 \( X \) gt.eq 1$.
    Projectivity also makes $X$ compact Kähler. If $b_2 \( X \) = 1$,
    Demailly’s Corollary 3 [8] gives ampleness of $- K_X$, and Theorem 1 identifies the given contact distribution
    with the canonical one on an adjoint variety.
  If $b_2 \( X \) gt.eq 2$, Demailly’s Corollary 4 [8], obtained from Theorem 1.1 of
    Kebekus–Peternell–Sommese–Wiśniewski [12], gives the asserted cotangent-bundle isomorphism over a smooth
    projective manifold $Z$. The base is connected because it is the image of $X$ under the bundle projection,
    and $dim X = 2 dim Z - 1$ gives $dim Z = n + 1$.
  The adjoint varieties carry the canonical contact structures recalled above.
    For the cotangent bundles, let $pi : bb(P) \( T^(*) Z \) arrow.r Z$ be the projection.
    At $\( z \, \[ xi \] \)$, the condition $xi \( d pi \( v \) \) =
    0$ on a tangent vector $v$ defines the tautological contact distribution,
    with contact line $cal(O)_(bb(P) \( T^(*) Z \)) \( 1 \)$ [8] Section 1. This proves the converse. ◻
]

== 9 Twistor spaces and the quaternionic Kähler metric <tw:section>

To prove Corollary 4, we apply Theorem 1 to the twistor space of a positive quaternionic Kähler manifold.
  The complex classification then determines the Riemannian metric after its scale has been fixed.

=== 9.1 The normalized metric and its twistor space <the-normalized-metric-and-its-twistor-space>

For $m gt.eq 2$, the holonomy containment in the corollary makes $g$ Einstein [27];
  see also [20] Definition 1.1 and the following discussion.
  Thus, writing $s > 0$ for its constant scalar curvature, we have $"Ric"_g = \( s \/ 4 m \) g$.
  The manifold $M$ is compact and connected by hypothesis.

We fix the scale at this point. Set

#[#set math.equation(numbering: n => "(9.1)")
 $ hat(g) = frac(s, 16 m \( m + 2 \)) thin g \, wide "Scal"_(hat(g)) = 16 m \( m + 2 \) . $ <tw:normalization>]

A constant positive rescaling preserves the Levi–Civita connection and the parallel quaternionic structure.

The holonomy reduction determines a parallel rank-three bundle $Q subset
  "End" \( T M \)$ whose fibers are the imaginary quaternions. Its sphere of complex structures is the twistor bundle

$ pi : X = { J in Q : J^2 = - "id" } arrow.r M . $

The Levi–Civita connection gives a horizontal distribution.
  Combining the complex structure $J$ on each horizontal tangent space with the standard complex structure on the
  sphere fiber gives the twistor complex structure. The positive twistor theorem [27],
  in the form of [20] Theorem 2.1, says that it is integrable and that $X$ is a complex contact manifold of
  dimension $2 m + 1$. Its contact distribution $F$ is horizontal,
  and $X$ carries a Kähler–Einstein metric of scalar curvature $8 \( m + 1 \) \( 2 m + 1 \)$.
  The fibers are holomorphically embedded copies of $bb(P)^1$ with normal bundle $cal(O) \( 1 \)^(xor 2 m)$.
  In the normalized metrics, $pi$ is a Riemannian submersion with totally geodesic sphere fibers of curvature $4$.
  The antipodal map on the fibers is a free antiholomorphic involution of $X$.

The total space $X$ is compact and connected, since it is a sphere bundle over the compact connected manifold $M$.
  The positive Ricci form of its Kähler–Einstein metric is the curvature form of the anticanonical bundle.
  The Kodaira embedding theorem [16] therefore makes $X$ projective with $- K_X$ ample.
  The holomorphic contact sequence is algebraic by GAGA [28]. Writing $L = T_X \/ F$, the contact pairing gives

#[#set math.equation(numbering: n => "(9.2)")
 $ det F tilde.eq L^(⊗ m) \, wide - K_X tilde.eq L^(⊗ \( m + 1 \)) . $ <tw:determinants>]

Thus $L$ is ample as well.

The Fano property also settles the topology of the original manifold. Lemma 5 gives $pi_1 \( X \) = 0$.
  Since the fiber $S^2$ is connected and simply connected, the homotopy exact sequence of $X arrow.r M$ gives

$ pi_1 \( M \) tilde.eq pi_1 \( X \) = 0 . $

Thus the metric recovery below will identify $M$ itself with the symmetric model.

The cohomological properties used in the algebraic argument follow here as well.
  Kodaira vanishing [15], applied to $K_X ⊗ \( - K_X \)$, gives $H^1 \( X \, cal(O)_X \) =
  H^2 \( X \, cal(O)_X \) = 0$. The exponential sequence identifies $"Pic" \( X \)$ with $H^2 \( X \, bb(Z) \)$,
  which is finitely generated and torsion-free by the universal coefficient theorem and $H_1 \( X \, bb(Z) \) = 0$.

Every point of $X$ lies on its own twistor fiber. For a parametrization $u :
  bb(P)^1 arrow.r.hook X$ of any such fiber, horizontality makes $u^(*) F$ complementary to $d
  u \( T_(bb(P)^1) \)$. The normal bundle assertion and the contact quotient $theta : T_X arrow.r L$ consequently give

#[#set math.equation(numbering: n => "(9.3)")
 $ u^(*) F tilde.eq N_(u \( bb(P)^1 \) \/ X) tilde.eq cal(O) \( 1 \)^(xor 2 m) \, wide theta thin d u :
   T_(bb(P)^1) arrow.r^tilde.op u^(*) L \,\
u^(*) L tilde.eq cal(O) \( 2 \) \, wide u^(*) T_X = d u \( T_(bb(P)^1) \) xor u^(*) F tilde.eq cal(O) \( 2 \) xor
  cal(O) \( 1 \)^(xor 2 m) . $ <tw:fiber-splitting>]

In particular, these are contact-degree-two curves transverse to $F$ through every point.

=== 9.2 The symmetric model and metric recovery <the-symmetric-model-and-metric-recovery>

#proof[
  The preceding construction produces a smooth connected projective contact Fano manifold $\( X \, F \)$.
    Theorem 1 therefore gives a contact isomorphism from $\( X \, F \)$ to the adjoint contact variety of a simple
    complex Lie algebra. It also identifies $L$ with the restriction of the hyperplane bundle in the adjoint embedding.
  Wolf’s correspondence [30] identifies this adjoint variety with the complex twistor space of a compact simply
    connected symmetric positive quaternionic Kähler model $\( M_0 \, g_0 \)$;
    the correspondence for every simple Lie type is described in [17] Section 3.9, pp. 105–106.
    Since the twistor space has complex dimension $2 m + 1$, the model has real dimension $4 m$.
    Rescale $g_0$ to a metric $hat(g)_0$ of scalar curvature $16 m \( m + 2 \)$, as in (9.1).
  LeBrun’s metric uniqueness theorem [20] Corollary 3.4, with the standing normalization specified after
    Definition 1.2 of that paper, now applies: the biholomorphism of the two complex twistor spaces yields an isometry
  $ \( M \, hat(g) \) tilde.eq \( M_0 \, hat(g)_0 \) . $
  The corollary asserts the existence of a base isometry from the complex isomorphism class of the twistor space.
    It does not require the initially given biholomorphism to preserve the chosen real structures or twistor fibrations.
  Undoing the two constant rescalings shows that $\( M \, g \)$ itself is homothetic to the compact symmetric Wolf
    space $\( M_0 \, g_0 \)$. Its curvature is therefore parallel.
    Indeed, constant rescaling leaves the Levi–Civita connection unchanged and multiplies the covariant curvature
    tensor by the same constant, so it preserves the equation $nabla "Rm" = 0$. Hence
  $ nabla "Rm"_g = 0 . $
  ◻
]

#heading(level: 1)[References]
#bibitem([1])[C.~Araujo and J.~Kollár, #emph[Rational curves on varieties],
  in #emph[Higher Dimensional Varieties and Rational Points] (K.~Böröczky, Jr., J.~Kollár, and T.~Szamuely, eds.),
  Bolyai Society Mathematical Studies #strong[12], Springer-Verlag, Berlin, 2003, 13--68.
  #link("https://arxiv.org/abs/math/0203173v2").]
#bibitem([2])[A.~Beauville, #emph[Fano contact manifolds and nilpotent orbits], Comment. Math. Helv.
  #strong[73] (1998), no.~4, 566--583. #link("https://doi.org/10.1007/s000140050069"). Author's copy:
  #link("https://math.univ-cotedazur.fr/u/beauvill/pubs/contact.pdf").]
#bibitem([3])[K.~Behrend and Yu.~Manin, #emph[Stacks of stable maps and Gromov--Witten invariants], Duke Math. J.
  #strong[85] (1996), no.~1, 1--60. #link("https://doi.org/10.1215/S0012-7094-96-08501-4").
  #link("https://arxiv.org/abs/alg-geom/9506023v2").]
#bibitem([4])[S.~Brendle and U.~Semmelmann, #emph[Quaternionic-Kähler manifolds with nonnegative sectional
  curvature], arXiv:2506.22181v1, 27 June 2025. #link("https://arxiv.org/abs/2506.22181v1").]
#bibitem([5])[J.~Buczyński, #emph[Duality and integrability on contact Fano manifolds], Doc. Math.
  #strong[15] (2010), 821--841. Published article:
  #link("https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-15/25.pdf").
  Corrected version incorporating the erratum, arXiv:1002.0698v2, 15 February 2021:
  #link("https://arxiv.org/abs/1002.0698v2"). Citations to Theorem~3.1, Remark~3.2,
  and Proposition~3.5 refer to this corrected version; Remark~3.2 explains the gap in the earlier irreducibility
  assertion for the variety of contact lines through a general point.]
#bibitem([6])[J.~Buczyński and J.~A.~Wiśniewski, #emph[Algebraic torus actions on contact manifolds],
  with an appendix by A.~Weber, J. Differential Geom. #strong[121] (2022), no.~2, 227--289.
  #link("https://doi.org/10.4310/jdg/1659987892"). #link("https://arxiv.org/abs/1802.05002v3").]
#bibitem([7])[B.~Conrad, #emph[The Keel--Mori theorem via stacks], unpublished manuscript, 27 November 2005.
  #link("https://math.stanford.edu/~conrad/papers/coarsespace.pdf").]
#bibitem([8])[J.-P.~Demailly, #emph[On the Frobenius integrability of certain holomorphic $p$-forms],
  arXiv:math/0004067v2, 1 May 2000. #link("https://arxiv.org/abs/math/0004067v2").]
#bibitem([9])[S.~Druel, #emph[Structures de contact sur les variétés algébriques de dimension 5], C. R. Acad. Sci.
  Paris Sér. I Math. #strong[327] (1998), no.~4, 365--368.
  #link("https://druel.perso.math.cnrs.fr/textes/contact5.pdf").]
#bibitem([10])[F.~Hirzebruch, #emph[Arithmetic genera and the theorem of Riemann--Roch for algebraic varieties],
  Proc. Natl. Acad. Sci. USA #strong[40] (1954), 110--114. #link("https://doi.org/10.1073/pnas.40.2.110").]
#bibitem([11])[S.~Kebekus, #emph[Lines on contact manifolds], J. Reine Angew. Math. #strong[539] (2001), 167--177.
  #link("https://doi.org/10.1515/crll.2001.072"). #link("https://arxiv.org/abs/math/0004103v3").]
#bibitem([12])[S.~Kebekus, T.~Peternell, A.~J.~Sommese, and J.~A.~Wiśniewski, #emph[Projective contact manifolds],
  Invent. Math. #strong[142] (2000), no.~1, 1--15. #link("https://doi.org/10.1007/PL00005791").
  #link("https://arxiv.org/abs/math/9810102v2").]
#bibitem([13])[R.~Kobayashi, #emph[Ricci flow unstable cell centered at an Einstein metric on the twistor space of
  positive quaternion Kähler manifolds of dimension $gt.eq 8$], arXiv:0801.2605v7, 14 October 2008.
  #link("https://arxiv.org/abs/0801.2605v7").]
#bibitem([14])[S.~Kobayashi and T.~Ochiai, #emph[Characterizations of complex projective spaces and
  hyperquadrics], J. Math. Kyoto Univ. #strong[13] (1973), no.~1, 31--47.
  #link("https://doi.org/10.1215/kjm/1250523432").]
#bibitem([15])[K.~Kodaira, #emph[On a differential-geometric method in the theory of analytic stacks], Proc. Natl.
  Acad. Sci. USA #strong[39] (1953), 1268--1273. #link("https://doi.org/10.1073/pnas.39.12.1268").]
#bibitem([16])[K.~Kodaira, #emph[On Kähler varieties of restricted type], Proc. Natl. Acad. Sci.
  USA #strong[40] (1954), 313--316. #link("https://doi.org/10.1073/pnas.40.5.313").]
#bibitem([17])[J.~M.~Landsberg and L.~Manivel, #emph[Representation theory and projective geometry],
  in #emph[Algebraic Transformation Groups and Algebraic Varieties],
  Encyclopaedia of Mathematical Sciences #strong[132], Springer-Verlag, Berlin, 2004, 71--122.
  #link("https://people.tamu.edu/~jml/LMpopreprint.pdf").]
#bibitem([18])[J.~M.~Landsberg and L.~Manivel, #emph[Legendrian varieties], Asian J. Math.
  #strong[11] (2007), no.~3, 341--360. #link("https://people.tamu.edu/~jml/AJM-11-3-A1-Landsberg.pdf").]
#bibitem([19])[C.~LeBrun, #emph[A finiteness theorem for quaternionic-Kähler manifolds with positive scalar
  curvature], in #emph[The Penrose Transform and Analytic Cohomology in Representation Theory],
  Contemporary Mathematics #strong[154], American Mathematical Society, Providence, RI, 1993, 89--101.
  #link("https://arxiv.org/abs/alg-geom/9302005v1").]
#bibitem([20])[C.~LeBrun, #emph[Fano manifolds, contact structures, and quaternionic geometry], Internat. J. Math.
  #strong[6] (1995), no.~3, 419--437. #link("https://doi.org/10.1142/S0129167X95000146").
  #link("https://arxiv.org/abs/dg-ga/9409001v1").]
#bibitem([21])[C.~LeBrun and S.~Salamon, #emph[Strong rigidity of positive quaternion-Kähler manifolds], Invent.
  Math. #strong[118] (1994), 109--132. #link("https://doi.org/10.1007/BF01231528").]
#bibitem([22])[J.~S.~Milne, #emph[Algebraic Groups: The Theory of Group Schemes of Finite Type over a Field],
  Cambridge University Press, Cambridge, 2017; corrected reprint, 2022.
  #link("https://www.jmilne.org/math/Books/iAG2022.pdf").]
#bibitem([23])[S.~Mori, #emph[Projective manifolds with ample tangent bundles], Ann. of Math.
  (2) #strong[110] (1979), no.~3, 593--606. #link("https://doi.org/10.2307/1971241").]
#bibitem([24])[S.~B.~Myers, #emph[Riemannian manifolds with positive mean curvature], Duke Math. J.
  #strong[8] (1941), 401--404. #link("https://doi.org/10.1215/S0012-7094-41-00832-3").]
#bibitem([25])[G.~Occhetta, E.~A.~Romano, L.~E.~Solá Conde, and J.~A.~Wiśniewski,
  #emph[High rank torus actions on contact manifolds], Selecta Math. (N.S.) #strong[27] (2021), article~10, 33~pp.
  #link("https://doi.org/10.1007/s00029-021-00621-w").]
#bibitem([26])[Y.~S.~Poon and S.~M.~Salamon, #emph[Quaternionic Kähler 8-manifolds with positive scalar
  curvature], J. Differential Geom. #strong[33] (1991), no.~2, 363--378.
  #link("https://doi.org/10.4310/jdg/1214446322").]
#bibitem([27])[S.~Salamon, #emph[Quaternionic Kähler manifolds], Invent. Math.
  #strong[67] (1982), no.~1, 143--171. #link("https://doi.org/10.1007/BF01393378").]
#bibitem([28])[J.-P.~Serre, #emph[Géométrie algébrique et géométrie analytique], Ann. Inst.
  Fourier #strong[6] (1956), 1--42. #link("https://www.numdam.org/article/AIF_1956__6__1_0.pdf").]
#bibitem([29])[The Stacks Project Authors, #emph[The Stacks Project], #link("https://stacks.math.columbia.edu/"),
  accessed 23 September 2026. Individual tags are linked at their points of use.]
#bibitem([30])[J.~A.~Wolf, #emph[Complex homogeneous contact manifolds and quaternionic symmetric spaces], J.
  Math. Mech. #strong[14] (1965), 1033--1047. #link("https://doi.org/10.1512/iumj.1965.14.14065").]
#bibitem([31])[O.~Yasukura, #emph[Hamiltonian homogeneity of Fano complex contact manifolds], arXiv:0905.2656v3,
  31 August 2009. #link("https://arxiv.org/abs/0905.2656v3").]
#bibitem([32])[O.~Yasukura, #emph[Hamiltonian homogeneity on a complex contact manifold], arXiv:0905.2656v4,
  2 November 2009. #link("https://arxiv.org/abs/0905.2656v4").]
#bibitem([33])[O.~Yasukura, #emph[Power generatedness of a holomorphic line bundle and an application to
  complex-contact manifolds], arXiv:0905.2656v11, 28 September 2022. #link("https://arxiv.org/abs/0905.2656v11").]
#bibitem([34])[O.~Yasukura, #emph[Immersivity of the contact line bundle of a complex-contact manifold and an
  application to the automorphism group], arXiv:0905.2656v12, 3 October 2023.
  #link("https://arxiv.org/abs/0905.2656v12").]
#bibitem([35])[S.-T.~Yau, #emph[Calabi's conjecture and some new results in algebraic geometry], Proc. Natl. Acad.
  Sci. USA #strong[74] (1977), no.~5, 1798--1799. #link("https://doi.org/10.1073/pnas.74.5.1798").]
#bibitem([36])[S.-T.~Yau, #emph[On the Ricci curvature of a compact Kähler manifold and the complex Monge--Ampère
  equation, I], Comm. Pure Appl. Math. #strong[31] (1978), no.~3, 339--411.
  #link("https://doi.org/10.1002/cpa.3160310304").]
#bibitem([37])[Y.-G.~Ye, #emph[A note on complex projective threefolds admitting holomorphic contact structures],
  Invent. Math. #strong[115] (1994), 311--314. #link("https://doi.org/10.1007/BF01231762").]
