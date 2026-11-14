#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The ordinary-double-point gap in every dimension]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Normalized volume, introduced by Chi Li #cite(label("Li18")),
  measures the size of a klt singularity by balancing the discrepancy of a valuation against the asymptotic
  colength of its valuation ideals. For a closed point $x$ of an $n$-dimensional normal complex variety that is
  klt near $x$, with zero boundary, it is

$ hat("vol") \( x \, X \) = inf_(v upright(" centered at ") x) A_X \( v \)^n "vol" \( v \) . $

Here $A_X \( v \)$ is log discrepancy, and $"vol" \( v \)$ is the leading colength of the ideals ${ f :
  v \( f \) gt.eq t }$, multiplied by $n !$. Section 2 gives the precise conventions for real valuations,
  including infinite discrepancy. In dimension $n$, the largest normalized volume is $n^n$,
  attained exactly at smooth points #cite(label("LX19")) Theorem 1.6.
  The ordinary double point gap conjecture predicts the next largest value:
  every singular klt germ should have normalized volume at most $2 \( n - 1 \)^n$,
  and this value should characterize the ordinary double point.
  Besides distinguishing a basic singularity by a numerical invariant,
  such a gap gives global restrictions on K-semistable Fano varieties through the local-to-global volume
  inequality #cite(label("Liu18")) Theorem 21.

An ordinary double point is the analytic hypersurface germ of a nondegenerate quadratic form.
  It is the simplest singular quadratic cone, and the asserted gap concerns all singular klt germs,
  not only hypersurfaces. Thus an essential part of the problem is to extract structural information from a
  numerical lower bound on volume.

#thm([Theorem 1.1.])[
  (The ordinary double point gap).  #emph[Let $n gt.eq 2$, and let $x$ be a singular closed point of a normal
    complex algebraic $n$-fold $X$. Suppose that $K_X$ is $bb(Q)$-Cartier and that $X$ is klt near $x$,
    with zero boundary. Then
$ hat("vol") \( x \, X \) lt.eq 2 \( n - 1 \)^n . $

 Equality holds if and only if
$ \( X \, x \)_(upright("an")) tilde.equiv ({ z_0^2 + dots.h.c + z_n^2 = 0 } subset bb(C)^(n + 1) \, 0) . $

]
] <thm:main>

The point need not be isolated in the singular locus. No structural assumption on the singularity is implicit in
  Theorem 1. We use log discrepancy, so the discrepancy of the exceptional divisor of the blowup of a smooth
  $n$-fold point is $n$. The normalized volume at the ordinary double point is $2 \( n - 1 \)^n$,
  including its interpretation as an infimum over all centered valuations.

The proof uses the fourfold theorem of the companion paper #emph[The normalized-volume gap in dimension four]
  #cite(label("FourfoldCompanion")) Theorem 1.1 as its sole companion input.
  That theorem has the same unrestricted boundary-zero scope and includes the analytic equality characterization;
  we restate it in Section 2. The induction from this base case, developed below,
  proves both the bound and the equality assertion in every higher dimension.

#thm([Corollary 1.2.])[
  (Global volume bounds).  #emph[Let $V$ be an $n$-dimensional K-semistable $bb(Q)$-Fano variety, where $n gt.eq
    2$. If $V$ is singular, then
$ \( - K_V \)^n lt.eq 2 (frac(n^2 - 1, n))^n < 2 n^n . $

 If $V tilde.nequiv bb(P)^n$, then $\( - K_V \)^n lt.eq 2 n^n$,
   with equality precisely when $V$ is a smooth quadric $Q^n subset bb(P)^(n + 1)$ or $bb(P)^1 times
   bb(P)^(n - 1)$. These two descriptions coincide for $n = 2$.]
] <cor:global>

Here a $bb(Q)$-Fano variety is normal, projective and klt, with ample $bb(Q)$-Cartier anticanonical divisor.
  The smaller singular bound in Corollary 2 is not accompanied by an assertion of sharpness or a classification of
  its equality cases.

=== 1.1 Earlier results <earlier-results>

The gap conjecture arose from the study of singular noncollapsed polarized Kähler–Einstein limits,
  where the volume density measures the size of a metric tangent cone.
  The algebraicity and uniqueness of these tangent cones were established by Donaldson–Sun
  #cite(label("DonaldsonSun17")). Spotti–Sun proposed that the ordinary double point has the largest density among
  singular Ricci-flat Kähler cones with isolated vertex, and formulated the corresponding normalized-volume
  conjecture for arbitrary singular klt germs #cite(label("SpottiSun17")) Conjectures 1.2 and 5.5.
  Their observation that density above $1 \/ 2$ forces Gorenstein canonical structure in the metric-limit setting
  #cite(label("SpottiSun17")) Proposition 3.7 already illustrates a central feature of the problem:
  a sufficiently large volume can force algebraic structure that is absent from the hypotheses.
  Here that principle is applied after stable degeneration, starting from an arbitrary klt germ.

The unrestricted low-dimensional cases precede the present induction.
  For surfaces, Li–Liu’s calculation $hat("vol") \( 0 \, bb(C)^2 \/ G \) =
  4 \/ \| G \|$ for finite groups acting freely in codimension one, together with the quotient classification,
  gives the bound and its equality case #cite(label("LL19")) Proposition 4.10.
  Liu–Xu proved the threefold theorem for arbitrary klt germs #cite(label("LX19")) Theorem 1.3.
  In higher dimensions, Liu proved the conjecture for local complete intersections #cite(label("Liu22"))
  Theorem 1.3. For singular $bb(Q)$-Gorenstein toric germs,
  Moraga–Süß proved the different sharp bound $hat("vol") lt.eq \( 16 \/ 27 \) n^n$ for $n gt.eq 3$,
  with equality precisely for the product of a three-dimensional ordinary double point and $bb(C)^(n - 3)$;
  in dimension two the bound is $2$, with equality at the surface ordinary double point
  #cite(label("MoragaSuess24")) Theorem 2. The fourfold companion supplies the remaining base case used here;
  the higher-dimensional argument does not assume either a complete-intersection or a toric structure.

The global application combines the local gap with a complementary smooth theorem.
  Li–Miao proved the bound $2 n^n$ and its equality classification for K-semistable Fano manifolds other than
  projective space #cite(label("LM25")) Theorem 1.1. Li–Miao–Zhang established the corresponding metric gap for
  compact Kähler manifolds other than projective space with $"Ric" \( omega \) gt.eq \( n + 1 \) omega$,
  and a global degree bound for K-semistable toric log Fano pairs whose underlying variety is not projective space
  #cite(label("LiMiaoZhang26")) Theorems 1.3 and 1.6. The local theorem here gives a strict improvement for
  singular K-semistable $bb(Q)$-Fano varieties, so that equality at $2
  n^n$ reduces to Li–Miao’s smooth classification. Further local refinements address the range below the threefold
  maximum: Liu proves the bound $9$ for Gorenstein canonical non-hypersurface threefolds and classifies all klt
  threefold germs with normalized volume at least $9$ #cite(label("LiuThreefold26")) Theorems 1.1 and 1.2.

The passage from metric cones to arbitrary klt singularities rests on the variational theory of normalized volume.
  Martelli–Sparks–Yau proved volume minimization among Reeb fields with fixed canonical weight
  #cite(label("MSY08")); Li–Liu and Li–Xu related cone metrics and K-stability to minimization over all centered
  valuations #cite(label("LL19")) Theorem 1.9#cite(label("LiXu18")) Theorem 1.3.
  For general klt germs, existence of a minimizer, its quasi-monomiality, uniqueness up to scaling,
  and finite generation were established by Blum, Xu, and Xu–Zhuang #cite(label("Blum18")) #cite(label("Xu20"))
  #cite(label("XZ21")) #cite(label("XZStable")). These results produce a K-semistable cone whose Reeb valuation
  computes the original normalized volume. The further degeneration of Li–Wang–Xu gives a K-polystable cone with
  the same value #cite(label("LWX21")) Theorem 1.2. Thus the cone reduction preserves the infimum over all
  valuations, which is essential for a gap theorem about arbitrary germs.

We also use lower semicontinuity #cite(label("BL21")) and the finite degree formula #cite(label("XZ21")) to derive
  smoothness of the puncture and Gorenstein structure from the density threshold.
  The new argument begins after that reduction: it must control integral gradings approximating the minimizing
  Reeb vector of an isolated Gorenstein cone, whose quotient is usually an orbifold.
  Passing to the coarse quotient too early loses the cyclic characters that control both rational curves and the
  eventual volume estimate.

Several classical methods enter at this point, in different roles.
  The use of rational curves belongs to the bend-and-break approach initiated by Mori #cite(label("Mori79")),
  with stack-theoretic extensions such as Chen–Tseng #cite(label("ChenTseng09")).
  The particular curve needed here has at most one stack point and comes from Li–Zhou #cite(label("LZ25")).
  Properness of twisted stable maps #cite(label("AOV11")) turns its minimal degree into a finite evaluation map.
  The Ricci-flat cone metric supplied by Collins–Székelyhidi #cite(label("CS19")) then bounds the weights of
  symmetric tensors obtained from this map. This is related in method to Reeb-weight obstructions for holomorphic
  functions #cite(label("GMSY07")), but the symmetric-tensor estimate is proved here.
  The final high-index classification is the projective-space and quadric characterization of Kobayashi–Ochiai
  #cite(label("KO73")); the needed ample-line-bundle formulation also follows from Araujo–Druel–Kovács
  #cite(label("ADK08")).

The other case uses an adjoint construction. Howald’s multiplier-ideal formula #cite(label("Howald01")) and
  Kawamata–Viehweg vanishing #cite(label("FujinoKV")) lift a prescribed leading Taylor monomial after the
  canonical shift. Hochster’s theorem and Stanley’s canonical-module formula #cite(label("Hochster72"))
  #cite(label("Stanley78")) subsequently convert the resulting normal semigroup into a Gorenstein degeneration.
  None of those statements alone forces the canonical point to be interior:
  that separate numerical assertion is the content of the exponential estimate in Section 4.
  Its semigroup counting follows the convex-geometric approach to graded linear series developed by Khovanskii,
  Okounkov, Lazarsfeld–Mustaţă, and Kaveh–Khovanskii #cite(label("Khovanskii1992")) #cite(label("Okounkov2003"))
  #cite(label("LazarsfeldMustata2009")) #cite(label("KavehKhovanskii2012")).
  The new exact saturation conclusion is stronger than the asymptotic count supplied by that method and requires
  the adjoint argument.

=== 1.2 The argument and its additional statements <the-argument-and-its-additional-statements>

Put $n = N + 1$ and

$ p_n = 2 (frac(n - 1, n))^n \, wide d \( x \, X \) = frac(hat("vol") \( x \, X \), n^n) . $

Starting from the known cases in dimensions two and three and the fourfold companion, we argue by induction.
  In the step $n gt.eq 5$, for a singular germ with $d \( x \, X \) gt.eq p_n$,
  stable degeneration preserves this density and bounds the original embedding dimension by that of a K-polystable
  cone $C$. The lower-dimensional gap and the finite degree formula force $C$ to be smooth off its vertex and
  Gorenstein. These are conclusions of the reduction, rather than assumptions on the germ.

A Reeb vector is a real torus grading positive on every nonconstant homogeneous function.
  Approximate the minimizing Reeb ray of $C$ by primitive integral gradings.
  For one such grading, let $r$ be the weight of a generating canonical form and let $m_max$ be the largest
  stabilizer order on the puncture. The quotient by the grading action is a smooth orbifold $B$,
  with faithful ample weight-one line bundle $L$ and $- K_B = r L$.
  The comparison of $m_max$ with $r \/ N$ separates the two parts of the argument.

When $m_max lt.eq r \/ N$, a minimal orbifold rational curve constrains the tangent characters.
  Unless those constraints already force the grading to be free,
  its deformations give a finite evaluation map onto $C$. Taking the product of their infinitesimal translations
  over the generic sheets produces a nonzero symmetric tensor.
  A weight bound from the Ricci-flat cone metric then forces a free grading with canonical weight $N$ or $N + 1$.
  The high-index classification identifies $\( B \, L \)$ as a quadric or projective space with its standard
  polarization, so $C$ is an ODP or is smooth.

For $m_max gt.eq r \/ N$, choose a point with maximal stabilizer and record each section’s degree and leading
  transverse Taylor exponent. These pairs form a semigroup $Gamma$ in the lattice determined by the stabilizer
  characters; write $K$ for its closed convex cone. The canonical form determines the lattice point
  $c_0 = \( r \, 1 \, dots.h \, 1 \)$. Two independent arguments give exact control of $Gamma$.
  Near-minimality of the Reeb grading gives moment inequalities,
  and an exponential expectation bound puts $c_0$ in $"int" K$.
  Adjoint vanishing lifts Taylor monomials whose indices, after the shift by $c_0$, lie in that interior.
  Together these facts force rational polyhedrality and exact saturation of $Gamma$.

Two filtrations convert this semigroup structure into a singular klt slice $Y$ of the same dimension $n$.
  A nontrivial stabilizer of order $h gt.eq 2$ for the second filtration action makes one character account for
  only $1 \/ h$ of the leading valuation colength on $Y$. This improves the volume comparison with $C$.
  The action and its order $h$ are different from those defining $m_max$;
  the quadratic-cone example in Section 6 makes the distinction explicit.

To use this same-dimensional slice without assuming the desired bound for it,
  let $M_n$ be the supremum of densities of singular boundary-zero klt $n$-fold germs. The comparison gives

$ d \( o \, C \) lt.eq frac(p_n + M_n, 2) . $

Applying this estimate to densities approaching $M_n$ proves $M_n lt.eq p_n$.
  The approximation of gradings is made separately on each fixed cone; the supremum need not be attained.
  In the equality case, a strict colength count and integral rounding return the cone to the small-stabilizer
  case. Its ODP embedding dimension then makes the original singular germ a hypersurface,
  and a weighted test forces a nondegenerate quadratic part.
  Figure 1 records this case split and the return in equality.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 12.02cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$n gt.eq 5$, $d(x,X) gt.eq p_n$: stable degeneration and induction#linebreak()An isolated Gorenstein K-polystable cone $C$]]])])
  content((-3.1, -2.183), [#box(width: 5.823cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$m_( max ) lt.eq r"/"N$#linebreak()Minimal curve: direct rigidity#linebreak()or finite evaluation and tensor estimate]]])])
  content((3.1, -2.214), [#box(width: 5.823cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$m_( max ) gt.eq r"/"N$#linebreak()Canonical point $c_0 in "int" K$#linebreak()Adjoint lifting and saturation]]])])
  content((-3.1, -4.412), [#box(width: 5.823cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Smooth projective quotient#linebreak()$( bb(P)^N, cal(O) (1))$ or $(Q^N, cal(O) (1))$#linebreak()Cone smooth or ODP]]])])
  content((3.1, -4.328), [#box(width: 5.823cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Two filtrations and a singular slice $Y$#linebreak()Character share $1"/"h$, $h gt.eq 2$]]])])
  content((3.1, -6.257), [#box(width: 5.823cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$d(o,C) lt.eq (p_n+M_n)"/"2$#linebreak()Hence $M_n lt.eq p_n$]]])])
  line((0, -0.5644), (0, -0.9644), (-3.1, -0.9644), (-3.1, -1.464), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((0, -0.5644), (0, -0.9644), (3.1, -0.9644), (3.1, -1.464), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((-3.1, -2.902), (-3.1, -3.702), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((3.1, -2.964), (3.1, -3.764), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((3.1, -4.892), (3.1, -5.692), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  line((3.1, -6.821), (0, -7.521), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, -7.521), (-3.612, -7.521), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-3.612, -7.521), (-3.612, -2.183), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-3.612, -2.183), (-6.012, -2.183), stroke: (paint: rgb("#404040"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#404040"))))
  content((-1.806, -7.521), [#text(size: 7pt)[Equality and integral rounding]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The induction step $n = N + 1 gt.eq 5$ for a singular germ of density at least $p_n$. Here $K$ is the cone of leading Taylor indices and $c_0$ its canonical lattice point. The same-dimensional slice enters only through the supremum $M_n$ of singular $n$-dimensional densities. Equality in the volume estimate returns the cone to the small stabilizer case. ],
) <fig:route>

===== 1.2.1 Organization. <organization.>

Section 2 fixes the valuation conventions, supplies the cone reduction,
  and proves the absolute grading approximation. Section 3 treats small stabilizers.
  For the other case, Section 4 proves canonical interiority and Section 5 independently establishes adjoint
  lifting before combining the two results. Section 6 constructs the two filtrations and the second stabilizer.
  Section 7 constructs the same-dimensional singular slice, proves the supremum inequality, and analyzes equality.
  Finally, Section 8 returns to the original germ and derives the Fano consequences.

== 2 Normalized volume and the cone reduction <sec:cones>

=== 2.1 Conventions and public inputs <conventions-and-public-inputs>

All varieties and stacks in the proof are over $bb(C)$. Boundaries are zero unless a boundary is explicitly
  introduced in a vanishing argument. For a klt germ $x in X$, write $R = cal(O)_(X \, x)$ and $frak(m) =
  frak(m)_x$. If $E$ is a prime divisor on a smooth proper birational model $mu : X' arrow.r X$, its log discrepancy is

$ A_X \( E \) = 1 + "coeff"_E \( K_(X') - mu^(*) K_X \) . $

For a real valuation $v$ of $K \( X \)$, trivial on $bb(C)$ and centered exactly at $x$, put

$ frak(a)_t \( v \) = { f in R : v \( f \) gt.eq t } \, wide "vol" \( v \) =
  lim_(t arrow.r oo) frac(n ! thin "length" \( R \/ frak(a)_t \( v \) \), t^n) . $

The ideals are $frak(m)$-primary. The limit exists by #cite(label("Cutkosky13")) Theorem 5.8:
  the local rings here are analytically unramified and equicharacteristic with perfect residue field.
  The integer-cutoff ideals form a graded family, and monotonicity extends the integer limit to real cutoffs.

We use the standard extension of log discrepancy to real valuations.
  On a smooth birational log model it is linear on each monomial cone;
  for an arbitrary valuation it is the supremum over its monomial retractions #cite(label("JM12")) Proposition 5.1
  and Corollary 5.4. For the singular $bb(Q)$-Gorenstein base one includes the relative canonical correction on a
  resolution, as in #cite(label("Li18")) Section 2.1. Define

$ hat("vol")_X \( v \) =
  cases(delim: "{", A_X \( v \)^n "vol" \( v \) \, & A_X \( v \) < + oo \,, + oo \, & A_X \( v \) = + oo .) $

Thus the definition never requires multiplying infinity by zero. Our normalization is

#[#set math.equation(numbering: n => "(2.1)")
 $ hat("vol") \( x \, X \) = inf_v hat("vol")_X \( v \) \, wide d \( x \, X \) =
   frac(hat("vol") \( x \, X \), n^n) . $ <cone:eq-density>]

The infimum is unchanged if restricted to positive multiples of divisorial valuations #cite(label("LiXu18"))
  Theorem 2.5. Rescaling a valuation does not change its normalized volume.

We use the following established facts in their boundary-zero form.

+ A klt germ has a minimizing valuation, unique up to positive scaling.
  It has finite discrepancy, is quasi-monomial, and has finitely generated associated graded.
  The latter is a K-semistable Fano cone, which admits a special equivariant degeneration to a K-polystable Fano
  cone. The minimizing Reeb vector and normalized volume are preserved #cite(label("XZStable")) Theorem 1.2,
  #cite(label("LWX21")) Theorem 1.2. Uniqueness also implies that a minimizer normalized by discrepancy is
  invariant under every automorphism of the germ #cite(label("XZ21")) Theorem 1.1 and Corollary 1.2.
+ Normalized volume is lower semicontinuous in $bb(Q)$-Gorenstein flat families of klt germs with section over a
  normal base #cite(label("BL21")) Theorem 1. In particular it is lower semicontinuous when the point moves along
  a curve in a fixed klt variety #cite(label("BL21")) Theorem 33(1).
  One has $d \( x \, X \) lt.eq 1$, with equality exactly at smooth points #cite(label("LX19")) Theorem 1.6.
+ For a finite Galois morphism of klt germs $f : \( Y \, y \) arrow.r \( X \, x \)$, with $f^(- 1) \( x \) =
  { y }$ set-theoretically and $K_Y = f^(*) K_X$, the finite degree formula is
  #[#set math.equation(numbering: n => "(2.2)")
   $ hat("vol") \( y \, Y \) = deg \( f \) hat("vol") \( x \, X \) . $ <cone:eq-cover>]
  We use this only for a quotient by a group without reflections and for the cyclic canonical index cover
    #cite(label("XZ21")) Theorem 1.3.
+ Isomorphic completed local rings have the same normalized volume #cite(label("Liu22")) Lemma 2.15.
  Thus étale germs at complex closed points have the same invariant.

These facts concern arbitrary klt germs. In particular, the first item does not require a divisorial minimizer,
  isolatedness, or smoothability.

=== 2.2 Products and embedding dimension <products-and-embedding-dimension>

#thm([Lemma 2.1.])[
  (A smooth factor).  #emph[Let $y in Y$ be an $N$-dimensional klt germ, where $N gt.eq 1$. Then
$ d \( \( y \, 0 \) \, Y times bb(A)^1 \) lt.eq d \( y \, Y \) . $

]
] <cone:product>

#proof[
  Take a divisorial test $v$ centered at $y$, of discrepancy $A > 0$ and volume $sigma$, and let $a = A \/ N$.
    The Gauss extension to the added parameter $t$ is
  $ \( v xor a \) (sum_i f_i t^i) = min_i { v \( f_i \) + i a } . $
  On a log resolution this is a monomial valuation along the divisor of $v$ and $t = 0$,
    so its log discrepancy is $A + a$. Completion does not change the finite colengths.
    In the power-series ring the quotient decomposes by powers of $t$, giving
  $ "length" #scale(x: 120%, y: 120%)[\(] R \[ \[ t \] \] \/ frak(a)_k \( v xor a \)
    #scale(x: 120%, y: 120%)[\)] = sum_(0 lt.eq i < k \/ a) "length" #scale(x: 120%, y: 120%)[\(] R \/
    frak(a)_(k - i a) \( v \) #scale(x: 120%, y: 120%)[\)] . $
  The defining asymptotic for $sigma$, followed by a Riemann sum, gives $"vol" \( v xor a \) = sigma \/ a$. Therefore
  $ frac(\( A + A \/ N \)^(N + 1), \( N + 1 \)^(N + 1)) frac(N sigma, A) = frac(A^N sigma, N^N) . $
  Take the infimum over the divisorial tests on $Y$. ◻
]

#thm([Lemma 2.2.])[
  (Lifting generators).  #emph[Let $v$ be a finite-discrepancy valuation of a klt germ,
    with finitely generated positively graded associated graded ring $"gr"_v R$. Then
$ "edim" \( R \) lt.eq "edim" \( "gr"_v R \) . $

]
] <cone:edim>

#proof[
  Choose minimal homogeneous algebra generators $macron(f)_1 \, dots.h \, macron(f)_e$ of $"gr"_v R$,
    all of positive value, and lift them to $f_1 \, dots.h \, f_e in frak(m)$.
    To show that their classes span $frak(m) \/ frak(m)^2$, start with $g in frak(m)$.
    Its initial form is a homogeneous polynomial in the $macron(f)_i$.
    Subtracting the corresponding polynomial in the $f_i$ either annihilates the remainder or strictly increases
    its value. Every positive value that occurs belongs to the semigroup generated by the positive numbers
    $v \( f_i \)$, so only finitely many such values lie below any fixed bound.
  The Izumi inequality for a finite-discrepancy valuation on a klt germ #cite(label("Li18")) Theorem 3.1 gives
    $v \( g \) lt.eq c thin "ord"_(frak(m)) \( g \)$, with a fixed constant $c$.
    In particular, a nonzero remainder of value greater than $c$ lies in $frak(m)^2$.
    The cancellation process therefore terminates modulo $frak(m)^2$ after finitely many steps.
    Every polynomial subtracted has no constant term, and modulo $frak(m)^2$ is a linear combination of the $f_i$.
    This proves the assertion. ◻
]

=== 2.3 The minimum at the ordinary double point <the-minimum-at-the-ordinary-double-point>

#thm([Lemma 2.3.])[
  (The ODP minimum).  #emph[For $n gt.eq 2$, the ordinary double point $Q_n$ has
$ hat("vol") \( 0 \, Q_n \) = 2 \( n - 1 \)^n . $

]
] <end:odp-value>

#proof[
  First take the exact quadratic cone
  $ Q_n = "Spec" R \, wide R = bb(C) \[ z_0 \, dots.h \, z_n \] \/ \( z_0^2 + dots.h.c + z_n^2 \) \, $
  with its ordinary grading. It is klt. For example, blowing up the vertex resolves it with smooth exceptional
    quadric, whose log discrepancy is $n - 1 > 0$; further smooth blowups preserve the klt condition.
  Normalize a minimizing valuation $v$ by its discrepancy. Uniqueness makes it invariant under all automorphisms,
    in particular under cone scalings and the connected orthogonal group $"SO" \( n + 1 \, bb(C) \)$.
    For each $j gt.eq 0$, the degree-$j$ piece $R_j$ is the irreducible representation of complex harmonic
    polynomials of degree $j$ in $n + 1$ variables. To identify the quotient,
    write $P_j$ for homogeneous complex polynomials of degree $j$ and $cal(H)_j$ for the subspace killed by $sum_i
    partial_(z_i)^2$; set $P_k = 0$ for $k < 0$. For $q = sum z_i^2$, the harmonic decomposition $P_j =
    cal(H)_j xor q P_(j - 2)$ identifies $R_j$ with $cal(H)_j$;
    see #cite(label("GrahamSwansonMatthews15")) Example 251 and Theorem 257.
    The complex representation is irreducible already under the compact group $"SO" \( n + 1 \)$,
    so an invariant subspace under $"SO" \( n + 1 \, bb(C) \)$ must be trivial or the whole space.
    For the classical harmonic-polynomial formulation and its extensions,
    see also #cite(label("LuoXu12")) Section 1. This includes $n = 2$ and $n = 3$.
    The exception for two ambient variables is outside the range under consideration.
  For each cutoff $t$, the subspace ${ f in R_j : v \( f \) gt.eq t }$ is invariant,
    so it is either zero or all of $R_j$. Every nonzero element of $R_j$ consequently has a common value $a_j$.
    If $0 eq.not f in R_1$, then $f^j eq.not 0$, and valuation multiplicativity gives $a_j = j a_1$.
    Invariance under cone scalings separates homogeneous pieces of a cutoff:
    a finite Vandermonde combination of scalings isolates each piece. Thus, for $g = sum_j g_j eq.not 0$,
  $ v \( g \) = a_1 min { j : g_j eq.not 0 } . $
  After localizing at the vertex the same assertion holds, since denominators nonzero at the vertex have value
    zero. The minimizer is therefore proportional to the ordinary degree valuation.
  That valuation is the order along the exceptional quadric of the vertex blowup.
    Hypersurface adjunction gives discrepancy $n - 1$, and its volume is the hypersurface multiplicity $2$.
    It follows that the infimum equals $2 \( n - 1 \)^n$.
  Finally, an analytic ordinary double point has the same completed local ring as this exact cone.
    Completion invariance #cite(label("Liu22")) Lemma 2.15 gives the same normalized volume. ◻
]

=== 2.4 The induction setup <the-induction-setup>

The companion paper #emph[The normalized-volume gap in dimension four] #cite(label("FourfoldCompanion"))
  Theorem 1.1 proves the following base case. We state the entire interface because its equality assertion is part
  of the theorem propagated here.

#thm([Theorem 2.4.])[
  (The fourfold gap).  #emph[Let $x$ be a singular closed point of a normal complex algebraic fourfold $X$.
    Suppose that $K_X$ is $bb(Q)$-Cartier and $X$ is klt near $x$, with zero boundary. Then
$ hat("vol") \( x \, X \) lt.eq 162 . $

 Equality holds if and only if the complex analytic germ is
$ ({ z_0^2 + z_1^2 + z_2^2 + z_3^2 + z_4^2 = 0 } \, 0) . $

 No isolatedness, complete-intersection, quotient, or smoothability assumption is made.]
] <inp:fourfold>

For $k gt.eq 2$ set

#[#set math.equation(numbering: n => "(2.3)")
 $ p_k = 2 (frac(k - 1, k))^k . $ <cone:eq-threshold>]

Let $M_k$ be the supremum of $d \( x \, X \)$ over all singular boundary-zero klt $k$-fold germs:
  the varieties are normal and complex algebraic, and their canonical divisors are $bb(Q)$-Cartier.
  This supremum is finite, since $M_k lt.eq 1$. The numbers $p_k$ are strictly increasing: for real $t > 1$,

$ frac(d, d t) [t log \( 1 - 1 \/ t \)] = log \( 1 - 1 \/ t \) + frac(1, t - 1) > 0 . $

The last inequality is $log \( 1 + u \) < u$, with $u = 1 \/ \( t - 1 \)$.

The dimension-two case of Theorem 1 follows from the quotient classification of klt surface singularities
  #cite(label("CKM88")) Proposition 6.11. The germ is analytically isomorphic to $\( bb(A)^2 \/ G \, 0 \)$,
  where $G$ is a finite effective linear group acting without reflections.
  Analytic isomorphism identifies the completed local rings,
  so completion invariance transfers the normalized volume to this algebraic quotient.
  The finite degree formula gives $d = 1 \/ \| G \|$. If the germ is singular, $\| G \| gt.eq 2$,
  and equality with $p_2 = 1 \/ 2$ forces an order-two action without a fixed hyperplane,
  namely $\( - 1 \, - 1 \)$. This is the $A_1$ surface singularity.
  The threefold case is #cite(label("LX19")) Theorem 1.3(1), and the fourfold case is Theorem 6.

Henceforth, until the induction is closed, assume Theorem 1 in dimensions below $n$, and fix

#[#set math.equation(numbering: n => "(2.4)")
 $ n = N + 1 gt.eq 5 \, wide d \( x \, X \) gt.eq p_n \, $ <cone:eq-induction>]

with $x$ singular. The only use of $M_n$ will be its definition as a supremum,
  not an unproved upper bound in dimension $n$.

#thm([Proposition 2.5.])[
  (Cone reduction).  #emph[Under (2.4), there is a singular K-polystable Fano cone $C = "Spec" S$,
    with vertex $o$, such that
$ d \( o \, C \) = d \( x \, X \) \, wide "edim" \( X \, x \) lt.eq "edim" \( C \, o \) . $

 The puncture $C \\ { o }$ is smooth, $S$ is a normal Gorenstein ring,
   and its canonical module has a homogeneous generator. The cone has zero boundary.]
] <cone:reduction>

#proof[
  Apply stable degeneration to a minimizer at $x$, and then take the K-polystable special degeneration.
    In the first passage the induced Reeb valuation has the same volume and discrepancy as the original minimizer
    #cite(label("LiXu18")) Lemma 4.10. In the second, equivariant flatness preserves the dimensions of the
    character spaces and hence the Reeb volume. The relative canonical character is constant,
    so its discrepancy is also preserved. Li–Xu’s characterization of K-semistability #cite(label("LiXu18"))
    Theorem 1.3 shows that the final Reeb valuation minimizes normalized volume over all centered valuations.
    Thus the two passages preserve the infimum in (2.1), not only the number of an arbitrary test.
  Lemma 4 gives the embedding-dimension inequality for the first passage.
    Upper semicontinuity along the vertex section of the special flat degeneration gives it for the second.
    The final vertex is therefore singular.
  Choose any positive integral grading of $S$, and let $P eq.not o$.
    Its grading orbit specializes to $o$, so lower semicontinuity gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ d \( o \, C \) lt.eq d \( P \, C \) . $ <cone:eq-orbit-density>]
  Choose a homogeneous function $f$, of degree $d > 0$, with $c = f \( P \) eq.not 0$, and put $Y_P = { f =
    c } subset C_f$. The action map
  $ Y_P times bb(G)_m arrow.r C_f \, wide \( Q \, a \) mapsto a dot.op Q \, $
  is the finite étale cover obtained by adjoining a root $a^d = f \/ c$.
    Near $\( P \, 1 \)$, it expresses the germ as the product of the $N$-dimensional slice $\( Y_P \, P \)$ and a
    smooth curve. The slice is klt by this étale description.
    If $P$ were singular, the slice would be singular as well.
    The induction hypothesis, Lemma 3, and étale invariance would then imply
  $ d \( P \, C \) lt.eq p_N < p_n lt.eq d \( o \, C \) \, $
  contrary to (2.5). Thus the puncture is smooth.
  Let $q$ be the canonical index at $o$. The cyclic index cover has degree $q$, is quasi-étale and crepant,
    and is klt. It has one point over $o$. Indeed, its algebra is the direct sum of the reflexive canonical powers
    modulo $q$. If a homogeneous element of a nonzero residue degree were not nilpotent in the fiber over $o$,
    a power returning to degree zero would be a unit. The corresponding section would trivialize a proper positive
    canonical power, contradicting minimality of $q$. Thus the nonzero residue-degree pieces are nilpotent,
    and the reduced fiber consists of one point. Equation (2.2) and the upper bound $d lt.eq
    1$ give $d \( o \, C \) lt.eq 1 \/ q$. Since $p_n > 1 \/ 2$, necessarily $q = 1$.
  Klt singularities are Cohen–Macaulay #cite(label("KollarCanonicalModels10")) Definition 117 and Theorem 120.
    The canonical module $omega_S$ is invertible at the vertex,
    and a homogeneous element generating its one-dimensional fiber there generates it after localization.
    Its graded cokernel has empty support: any nonempty closed support invariant under a positive grading contains
    the vertex. Since $omega_S$ is torsion-free, the resulting map $S arrow.r omega_S$ is injective as well.
    It is therefore an isomorphism, with a grading shift. ◻
]

=== 2.5 Integral gradings and orbifold quotients <integral-gradings-and-orbifold-quotients>

Fix the cone of Proposition 7. Let $bb(T)$ be an effective algebraic torus of automorphisms containing its Reeb
  vector $xi$, and normalize

$ A \( xi \) = n . $

Choose a $bb(T)$-eigen-generator $Omega_C$ of $omega_S$. Its character pairs with cocharacters as the linear
  discrepancy functional $A$ #cite(label("LiXu18")) Lemmas 2.16 and 2.18.
  Function weights use the convention $g \( a P \) = a^j g \( P \)$; the differential $d g$ has the same weight.
  The Reeb cone consists of cocharacters positive on all nonconstant homogeneous functions.

#thm([Lemma 2.6.])[
  (Fast primitive approximations).  #emph[There are primitive positive integral cocharacters $zeta_i$,
    of canonical weights $r_i = A \( zeta_i \) in bb(Z)_(> 0)$, such that
#[#set math.equation(numbering: n => "(2.6)")
 $ zeta_i = r_i / n xi + epsilon.alt_i \, wide epsilon.alt_i arrow.r 0 $ <cone:eq-fast>]

 in the real cocharacter space. If the ray of $xi$ is rational, the sequence may be chosen constant and exact.
   Otherwise $r_i arrow.r oo$.]
  #emph[The normalized volumes of the degree valuations $"wt"_(zeta_i)$ tend to $hat("vol") \( o \, C \)$.
    For any fixed finite set of homogeneous algebra generators,
    their $zeta_i$-degrees lie between $c r_i$ and $C r_i$ for positive constants $c \, C$.
    Consequently the largest stabilizer order $m_(max \, i)$ on the puncture is $O \( r_i \)$.]
] <cone:approximation>

#proof[
  In the quotient of real cocharacter space by its integral lattice, recurrence gives $t_i arrow.r
    oo$ and integral cocharacters $q_i$ with $q_i = t_i xi + e_i$, where $e_i arrow.r 0$.
    One may obtain such a sequence from simultaneous Dirichlet approximation,
    or from returns to zero of the one-parameter subgroup in its compact closure.
    Let $d_i$ be the gcd of $q_i$ in a lattice basis and put $zeta_i = q_i \/ d_i$. Then
  $ zeta_i - frac(A \( zeta_i \), n) xi = 1 / d_i (e_i - frac(A \( e_i \), n) xi) arrow.r 0 . $
  The cocharacters are positive for large $i$. If their positive integers $r_i =
    A \( zeta_i \)$ had a bounded subsequence, (2.6) would make $zeta_i$ bounded on that subsequence.
    A constant lattice subsequence would then give $zeta = \( r \/ n \) xi$, forcing the ray to be rational.
    The rational case is handled by its primitive generator.
  Choose homogeneous algebra generators $g_1 \, dots.h \, g_a$ with $bb(T)$-characters $chi_1 \, dots.h \, chi_a$.
    Each $chevron.l chi_j \, xi chevron.r$ is positive, so (2.6) gives the asserted two-sided bounds for their
    integral degrees. More precisely, the normalized cocharacters $\( n \/ r_i \) zeta_i$ converge to $xi$.
    Uniform comparison on the finite set of generator characters then compares their values on every occurring
    character: each is a sum of generator characters with nonnegative integer coefficients.
    It follows that the valuation ideals of the normalized degree valuations are squeezed between those of
    $"wt"_xi$ with cutoff factors tending to one. Their volumes therefore converge; their discrepancies are all $n$.
  At a nonvertex point some generator is nonzero. Its stabilizer for a primitive grading is cyclic,
    and its order divides the degree of every nonvanishing generator.
    It is therefore at most the largest generator degree, proving the final assertion. ◻
]

In what follows, #emph[sufficiently fast gradings] always means gradings in a sequence as in Lemma 8,
  including the exact constant sequence on a rational ray. All constants may depend on the fixed cone.
  No uniformity over the class defining $M_n$ is asserted or needed.

#thm([Lemma 2.7.])[
  (The quotient orbifold).  #emph[For a primitive positive integral grading $zeta$, of canonical weight $r$, let
$ B = \[ \( C \\ { o } \) \/ bb(G)_m \] . $

 Then $B$ is a smooth effective proper orbifold of dimension $N$, with projective coarse space $"Proj" S$.
   It has a faithful ample weight-one line bundle $L$ such that
#[#set math.equation(numbering: n => "(2.7)")
 $ S_j = H^0 \( B \, j L \) \, wide - K_B = r L . $ <cone:eq-section-ring>]

 Every stabilizer is a finite cyclic group. At a point of order $m$,
   a smooth transverse uniformizer carries a faithful $mu_m$-action, and $L$ has a faithful fiber character.]
] <cone:orbifold>

#proof[
  The smooth puncture has finite stabilizers for the positive grading,
    so its quotient stack is smooth and Deligne–Mumford. It is the usual stack associated with a positively graded
    affine ring away from its vertex; its coarse space is $"Proj" S$,
    and a sufficiently divisible positive power of the weight-one line descends to an ample coarse line bundle.
    This also proves properness.
  The grading is effective because the integral cocharacter is primitive in an effective torus.
    At a point, the finite stabilizer acts trivially on the tangent line of the orbit.
    If an element acted trivially also on a transverse tangent space,
    it would have identity differential on the smooth puncture.
    A finite-order automorphism in characteristic zero is formally linearizable at a fixed point;
    hence that element would be the identity on a neighborhood and thus on the irreducible cone,
    contrary to effectiveness. This proves faithfulness of the transverse representation and effectiveness of the
    orbifold. The weight-one character of the subgroup of $bb(G)_m$ is faithful by construction.
  Sections of $j L$ are the homogeneous functions of degree $j$ on the puncture.
    Normality and the codimension of the vertex extend them to $C$, giving the first equality in (2.7).
    Contracting $Omega_C$ with the Euler field gives a horizontal top form of character $r$, so $K_B = - r L$. ◻
]

We retain the stack $B$, its faithful line $L$, and the character information throughout the argument.
  In particular, we do not replace $L$ by a coarse line bundle before the stabilizers have been shown to be trivial.

== 3 Small stabilizers <small:section>

We use Proposition 7 and Lemmas 8 and 9. Thus $C = "Spec" S$ is a normal Gorenstein Fano cone of dimension $n =
  N + 1$, where $N gt.eq 4$, its puncture $C^compose = C \\ { o }$ is smooth,
  and the polarized cone $\( C \, xi \)$ is K-polystable, with minimizing Reeb vector normalized by $A \( xi \) =
  n$. Fix homogeneous torus eigenfunctions $f_1 \, dots.h \, f_q$ generating $S$,
  with torus characters $alpha_1 \, dots.h \, alpha_q$. For a primitive positive integral grading $zeta$, write

$ r = A \( zeta \) \, wide B = \[ C^compose \/ bb(G)_m \] \, wide - K_B = r L . $

Here $L$ is the faithful ample orbifold line bundle of weight one.
  The maximum stabilizer order for this grading is denoted by $m_max$.
  All constants in this section may depend on the fixed cone, its torus and the displayed generators.

#thm([Theorem 3.1.])[
  (Small-stabilizer classification).  #emph[Let $zeta_i$ be primitive positive integral gradings satisfying
#[#set math.equation(numbering: n => "(3.1)")
 $ zeta_i = r_i / n xi + epsilon.alt_i \, wide r_i = A \( zeta_i \) \, wide
   parallel epsilon.alt_i parallel arrow.r 0 \, wide m_max \( zeta_i \) lt.eq r_i / N . $ <small:fast-sequence>]

 For all sufficiently large $i$, every stabilizer is trivial and $r_i in { N \, N + 1 }$.
   More precisely, the polarized quotient is
$ \( B_i \, L_i \) tilde.equiv
  cases(delim: "{", \( bb(P)^N \, cal(O)_(bb(P)^N) \( 1 \) \) \, & r_i = N + 1 \,, \( Q^N \, cal(O)_(Q^N) \(
  1 \) \) \, & r_i = N \,) $

 where $Q^N subset bb(P)^(N + 1)$ is a smooth quadric. Consequently the cone $C$ is respectively smooth or an
   ordinary double point. The assertion includes the constant exact primitive grading when the ray of $xi$ is rational.]
] <small:classification>

We begin with a minimal orbifold rational curve. Its tangent characters either force $r =
  N$ and trivial stabilizers, or its deformations yield a finite evaluation map and hence a nonzero symmetric
  tensor of negative weight. A metric lower bound for homogeneous symmetric tensors,
  together with an approximation estimate uniform in their rank, gives the remaining rigidity.

=== 3.1 A minimal orbifold rational curve <a-minimal-orbifold-rational-curve>

For the moment fix one primitive grading satisfying

#[#set math.equation(numbering: n => "(3.2)")
 $ m_max lt.eq r \/ N . $ <small:stabilizer-assumption>]

The orbifold $B$ is smooth and effective, is proper with projective coarse space,
  and has ample anticanonical bundle $r L$. We use the orbifold rational-curve theorem of Li–Zhou
  #cite(label("LZ25")) Proposition 2.6. In this setting it supplies a representable nonconstant map from
  $bb(P) \( 1 \, ell \)$, where the only possible stack point is infinity,
  whose anticanonical degree plus the inverse age at that point is at most $dim B + 1$.
  In particular its anticanonical degree is at most $n$. No positivity assumption on $T_B$ is required for this
  assertion.

Choose a map of least positive $L$-degree among all representable nonconstant maps of this form, allowing $ell =
  1$. Such a minimum exists: representability embeds the source stabilizer in a target stabilizer,
  so the denominators of these degrees divide one of the finitely many integers at most $m_max$. Write

$ f : bb(P) \( 1 \, ell \) arrow.r B \, wide f^(*) L tilde.equiv cal(O) \( e \) \, wide e > 0 \, $

and let $m$ be the stabilizer order of its value at infinity. This endpoint order need not equal $m_max$.
  Thus $ell divides m$, and minimality and the existence theorem give $r e \/ ell lt.eq n$.
  On the other hand, $r \/ m gt.eq N$ by Equation (3.2). Hence

#[#set math.equation(numbering: n => "(3.3)")
 $ 1 lt.eq frac(e m, ell) = frac(r e \/ ell, r \/ m) lt.eq frac(N + 1, N) < 2 . $ <small:primitive-curve-degree>]

The expression $e m \/ ell$ is an integer. We obtain

#[#set math.equation(numbering: n => "(3.4)")
 $ e = 1 \, wide ell = m \, wide N lt.eq r \/ m lt.eq n . $ <small:curve-range>]

Choose an identification $f^(*) L tilde.equiv cal(O) \( 1 \)$. Passing to its grading torsor gives an equivariant map

$ F : bb(A)^2 \\ { 0 } arrow.r C^compose \, wide F \( t x \, t^m y \) = t dot.op F \( x \, y \) . $

Since $bb(A)^2$ is normal and $C$ is affine, the coordinate functions extend uniquely across the origin.
  Thus $F : bb(A)^2 \( 1 \, m \) arrow.r C$ is a homogeneous polynomial map.
  Set $P = F \( 0 \, 1 \)$; its stabilizer is $mu_m$. Conversely,
  a homogeneous map with no preimage of the vertex outside the origin,
  and with this degree-one torsor identification, gives a representable map to $B$:
  its maps on source inertia groups are the inclusions inherited from the identity homomorphism of the grading groups.

#thm([Lemma 3.2.])[
  (Deformations with a fixed lift).  #emph[Let $b'_1 \, dots.h \, b'_n in { 1 \, dots.h \,
    m }$ represent the characters of $mu_m$ on $T_(C \, P)$, with the trivial character represented by $m$.
    Every component through $F$ of the scheme of homogeneous maps $F' : bb(A)^2 \( 1 \, m \) arrow.r
    C$ satisfying $F' \( 0 \, 1 \) = P$ has dimension at least
#[#set math.equation(numbering: n => "(3.5)")
 $ chi = n + r / m - sum_(j = 1)^n b'_j / m . $ <small:chi>]

 In particular this dimension is at least $n$, except possibly when $r \/ m =
   N$ and the entire tangent action at $P$ is trivial.]
] <small:deformation>

#proof[
  Homogeneous maps form an affine scheme of finite type: in fixed homogeneous generators of $S$,
    each coordinate of the map is a polynomial of a specified weighted degree,
    and the relations of $S$ give polynomial equations in their finitely many coefficients.
    The condition of avoiding the vertex outside the origin is open,
    as may be checked on the proper weighted line. Near the given map,
    deformation theory can therefore be performed entirely in the smooth target $C^compose$.
  Let $E$ be the rank-$n$ bundle on $bb(P) \( 1 \, m \)$ obtained by descending $F^(*) T_(C^compose)$.
    Its determinant is $cal(O) \( r \)$, so $deg E = r \/ m$.
    We are deforming an equivariant map with its source and its grading torsor fixed; equivalently,
    we are deforming a section of the associated smooth bundle,
    with the canonical section obstruction theory of #cite(label("Webb22")) Theorem 4.13 and Equation (4.18).
    There is no quotient by source automorphisms or by changes of the torsor identification.
    If $D_oo$ denotes the residual gerbe at infinity, the tangent and obstruction spaces for fixing its value are
  $ H^0 \( bb(P) \( 1 \, m \) \, E \( - D_oo \) \) \, wide H^1 \( bb(P) \( 1 \, m \) \, E \( - D_oo \) \) . $
  Thus their Euler characteristic is a lower bound for the dimension of every component through the map.
  For completeness, orbifold Riemann–Roch here says $chi \( E \) = n + deg E - "age" \( E_oo \)$.
    It follows by taking the coarse pushforward: locally diagonalizing at the stack point subtracts the fractional
    character weights from the degree, after which ordinary Riemann–Roch on $bb(P)^1$ applies.
    Restriction to $D_oo$ has Euler characteristic equal to the dimension of the invariant fiber,
    because $mu_m$ is linearly reductive. Subtracting that invariant dimension is precisely the effect of
    representing each trivial character by $m$ instead of zero.
    The exact sequence for restriction to $D_oo$ therefore gives Equation (3.5).
  Since $sum b'_j \/ m lt.eq n$, we have $chi gt.eq r \/ m$. The Euler characteristic $chi$ is an integer.
    If $r \/ m > N$, it is at least $N + 1 = n$. If $r \/ m = N$ and some character is nontrivial,
    the inequality is strict and the same conclusion follows. ◻
]

=== 3.2 Finite evaluation and its symmetric tensor <finite-evaluation-and-its-symmetric-tensor>

Assume that the exception in Lemma 11 does not occur. Let $H$ be the reduced closure of an irreducible component
  of the open locus of maps avoiding the vertex outside the origin,
  in the affine scheme of homogeneous maps with $F' \( 0 \, 1 \) = P$. Then $H$ is integral and

#[#set math.equation(numbering: n => "(3.6)")
 $ dim H gt.eq n . $ <small:H-dimension>]

Precomposition with $\( x \, y \) mapsto \( a x \, y \)$ preserves the chosen component because the acting group
  $bb(G)_m$ is connected. It gives a positive grading on $H$:
  every coefficient involving $x$ has positive weight, whereas the coefficients involving only $y$ are fixed by
  $P$. All maps contract to the same map obtained by deleting the terms involving $x$.
  Consider the equivariant evaluation morphism

#[#set math.equation(numbering: n => "(3.7)")
 $ "ev" : H arrow.r C \, wide F' mapsto F' \( 1 \, 0 \) . $ <small:evaluation>]

#thm([Lemma 3.3.])[
  (Finite evaluation).  #emph[The morphism in Equation (3.7) is finite and surjective.
    Its fiber over $o$ is supported at the unique contracted map.]
] <small:finite-evaluation>

#proof[
  Take $F_0 in H$ with $F_0 \( 1 \, 0 \) = o$. Choose a pointed curve in $H$ through $F_0$,
    with general point in the locus avoiding the vertex, and normalize it.
    Its generic map gives a twisted stable graph map to $B times bb(P)^1$:
    the second map is the coarse identification of $bb(P) \( 1 \, m \)$ with $bb(P)^1$, and infinity is marked.
    This graph is stable even before any contraction because its second map has degree one.
    After a finite base change, properness of twisted stable maps gives a limiting graph map #cite(label("AOV11"))
    Theorem 4.3. The target is a tame proper smooth Deligne–Mumford stack with projective coarse space,
    as required by that theorem.
  There is a unique component of the limiting coarse source of second degree one.
    It maps isomorphically to $bb(P)^1$; call it the horizontal component.
    All other components form rational trees attached to it, since the total arithmetic genus is zero.
    The first map on the horizontal component is the coarse rational map defined by $F_0$,
    after cancellation of its basepoints. Indeed the two maps agree on the open set where the limiting homogeneous
    coordinates do not vanish simultaneously.
  We spell out why a positive-degree tail occurs over the finite basepoint $\[ 1 : 0 \]$.
    Choose a sufficiently divisible integer $k$ such that $k L$ descends to a very ample bundle on the coarse
    space of $B$, and $m divides k$. Its pullback along the original maps is the coarse bundle
    $cal(O)_(bb(P)^1) \( k \/ m \)$. The limiting projective coordinates are binary forms of that degree.
    They have a common zero at $\[ 1 : 0 \]$, because $F_0 \( 1 \, 0 \) = o$, and are not all zero,
    because $F_0 \( 0 \, 1 \) = P eq.not o$. Cancelling their common divisor loses positive degree at
    $\[ 1 : 0 \]$. A general hyperplane avoiding the value of the canceled map at that point has the lost positive
    number of inverse-image points specializing there. In the limiting stable map these points cannot lie on the
    horizontal component. They are therefore accounted for by positive first degree on a tree over $\[ 1 : 0 \]$.
    This also proves the degree assertion directly, without making an assumption about components that might occur
    over infinity.
  Choose a terminal leaf of that tree. It does not contain the infinity marking,
    since its second image is $\[ 1 : 0 \]$. It has one node and no markings.
    If its first map had degree zero, it would be constant in both factors and unstable:
    stability requires the induced coarse map to be a Kontsevich stable map #cite(label("AOV11")) Section 4,
    and an unmarked constant terminal leaf has only one special point. Hence its first degree is positive.
    Its normalization is a twisted rational curve with at most one stack point:
    the only allowed stack points of a twisted source are nodes and markings.
    Projection from the product target to $B$ preserves representability, since $bb(P)^1$ has trivial inertia.
    The leaf consequently gives a representable nonconstant map $bb(P) \( 1 \, ell' \) arrow.r
    B$ of the type used in the minimum.
  Its $L$-degree is at least the original minimal degree $1 \/ m$.
    Degree is additive on the limiting source and every component has nonnegative $L$-degree,
    while the total degree is $1 \/ m$. Thus this leaf consumes the full first degree.
    The horizontal component has first degree zero, and its constant value is the coarse image of $P$.
    It follows that the image of the affine map $F_0$ lies in the closure of the grading orbit of $P$.
  The normalization of that orbit closure is $bb(A)^1$, with a parameter of grading weight $m$,
    normalized to have value one at $P$. To see the weight, the gcd of the degrees of the coordinates nonzero at
    $P$ is its stabilizer order $m$. The map from the normal source $bb(A)^2$ factors through this normalization:
    its parameter is integral over the coordinate ring of the orbit curve and hence regular on $bb(A)^2$.
    The parameter pulled back along $F_0$ is a weighted homogeneous polynomial of degree $m$, so it has the form
  $ y + c x^m . $
  The coefficient of $y$ is one because the value at $\( 0 \, 1 \)$ is fixed.
    Evaluation at $\( 1 \, 0 \)$ is the vertex only if $c = 0$.
    Therefore the vertex fiber is supported at the single contracted map.
  Finally, let $R_H$ be the positively graded coordinate ring of $H$.
    The preceding fiber statement says that $R_H \/ S_(+) R_H$ is finite dimensional.
    Lift a homogeneous basis of this quotient. Induction on the positive degree shows that these lifts generate
    $R_H$ as an $S$-module; this is graded Nakayama. Thus evaluation is finite.
    Its image is closed and has dimension $dim H gt.eq n$, by Equation (3.6).
    Since $C$ is integral of dimension $n$, the image is all of $C$, and $dim H = n$. ◻
]

#thm([Lemma 3.4.])[
  (A tensor of negative integral weight).  #emph[Let $b$ be the degree of the finite evaluation in Lemma 12.
    There is a nonzero algebraic section
$ s in H^0 \( C^compose \, "Sym"^b T_(C^compose) \) $

 of integral-grading weight $- b m$.]
] <small:norm-tensor>

#proof[
  The source automorphisms $\( x \, y \) mapsto \( x \, y + t x^m \)$, for $t in bb(C)$,
    preserve the homogeneous-map scheme, the fixed value at $\( 0 \, 1 \)$,
    and its open locus avoiding the vertex. The connected additive group therefore preserves the component $H$.
    Its vector field is nonzero: a coordinate nonzero at $P$ has a nonzero pure power of $y$,
    whose derivative under this action is nonzero in characteristic zero.
    Differentiating evaluation gives a regular vector $V$ along evaluation over $C^compose$.
    It is generically nonzero, since the finite dominant evaluation is generically separable and hence has
    injective differential on a nonempty smooth open set. For a target coordinate of degree $d$,
    its component is $partial_y F' \( 1 \, 0 \)$, of coefficient-grading degree $d - m$.
    Thus $V$, as a vector along evaluation, has derivation weight $- m$.
  Over the generic point, take the symmetric product of the vectors on all $b$ sheets.
    This gives a nonzero element of $"Sym"^b T_(C^compose)$ over $bb(C) \( C \)$; the product,
    unlike the ordinary trace, cannot cancel. It is invariant under permutation of the sheets and so descends to
    that field. It is regular as well. On a smooth affine open set of $C^compose$ trivializing the tangent bundle,
    the components of $V$ lie in a finite algebra over the base ring.
    The coefficients of their symmetric product are therefore integral over the base ring and lie in its fraction
    field. Normality of the base makes them regular. This argument does not require $H$ to be normal;
    alternatively one can first use its finite normalization.
    The construction is equivariant and multiplies weights by $b$, giving weight $- b m$. ◻
]

=== 3.3 A bound for homogeneous symmetric tensors <a-bound-for-homogeneous-symmetric-tensors>

The tensor just constructed has negative weight for the integral grading.
  To exploit this, we first bound the Reeb weight of a homogeneous symmetric tensor.
  By the Fano cone Yau–Tian–Donaldson theorem #cite(label("CS19")) Theorem 1.1 and Definitions 2.1–2.2,
  $C^compose$ carries a Ricci-flat Kähler cone metric with Reeb vector $xi$.
  The theorem applies here because the puncture is smooth and the singularity is Q-Gorenstein and klt.
  The condition called K-stability in that reference allows equality only for an isomorphic central fiber,
  and is the K-polystability condition used here. With $A \( xi \) = n$,
  the real homothetic dilations have infinitesimal generator $- J xi$,
  and their pullback multiplies the metric by the square of the dilation factor.

#thm([Lemma 3.5.])[
  (Tensor weight bound).  #emph[Let $b gt.eq 1$, and let $s$ be a nonzero homogeneous algebraic section of
    $"Sym"^b T_(C^compose)$, of $xi$-weight $tau$, with vector fields weighted as derivations. Then
$ tau gt.eq - b . $

]
] <small:tensor-bound>

#proof[
  The Chern connection induced on $"Sym"^b T_(C^compose)$ has zero mean curvature:
    contraction of the curvature on $T_(C^compose)$ is Ricci curvature,
    and contraction commutes with the induced tensor and symmetric power operations. Put $u = \| s \|^2$.
    The holomorphic Bochner formula and Cauchy–Schwarz give, with a consistent positive complex-Laplacian normalization,
  $ Delta u = \| nabla^(1 \, 0) s \|^2 gt.eq 0 \, wide \| partial u \|^2 lt.eq u thin Delta u . $
  Consequently $log \( u + a \)$ is subharmonic for each $a > 0$,
    and so is $\( u + a \)^(p \/ 2)$ for every $p > 0$, by the chain rule applied to the increasing convex
    exponential function. Letting $a$ decrease to zero shows that $\|
    s \|^p$ is subharmonic in the distributional sense, including across the zero set of $s$.
  Let $rho$ be the metric radial coordinate and $M = { rho = 1 }$ its compact smooth link.
    A contravariant tensor of rank $b$ and derivation weight $tau$ has norm of radial degree $tau + b$.
    If $tau + b < 0$, choose $p > 0$ such that
  $ d = p \( tau + b \) in \( 2 - 2 n \, 0 \) . $
  Then $\| s \|^p = rho^d phi.alt$ for a nonnegative continuous function $phi.alt$ on $M$ with positive integral.
    The cone-Laplacian formula, valid also distributionally, is
  $ Delta \( rho^d phi.alt \) = rho^(d - 2) #scale(x: 120%, y: 120%)[\(] d \( d + 2 n - 2 \) phi.alt +
    Delta_M phi.alt #scale(x: 120%, y: 120%)[\)] . $
  Integrating the angular term over $M$ gives zero. Testing subharmonicity against a nonnegative radial function
    supported in an annulus would therefore imply $d \( d + 2 n - 2 \) integral_M phi.alt gt.eq 0$,
    which is impossible. Thus $tau + b gt.eq 0$. ◻
]

=== 3.4 Uniform control of characters and the conclusion <uniform-control-of-characters-and-the-conclusion>

The tensor rank in Lemma 13 can vary with the grading. The following estimate makes the approximation error
  independent of that rank.

#thm([Lemma 3.6.])[
  (Character estimate).  #emph[There is a constant $c > 0$ with the following property for all sufficiently close
    gradings in Equation (3.1). If a nonzero rank-$b$ tensor on $C^compose$ has integral-grading weight $- b m$,
    with $m > 0$, then it has a nonzero torus eigencomponent of character $chi$ satisfying
$ parallel chi parallel lt.eq c b . $

 Consequently, if the tensor is as in Lemma 13, then
#[#set math.equation(numbering: n => "(3.8)")
 $ m lt.eq r / n + c parallel epsilon.alt parallel . $ <small:m-bound>]

]
] <small:character-estimate>

#proof[
  For the fixed eigen-generators $f_j$, positivity of $xi$ and absolute convergence of the error give constants
    $c_1 \, c_2 > 0$ such that their integral degrees $d_j = alpha_j \( zeta \)$ satisfy
  #[#set math.equation(numbering: n => "(3.9)")
   $ c_1 r lt.eq d_j lt.eq c_2 r quad upright("for every ") j . $ <small:generator-weights>]
  These bounds include the exact rational grading.
  The differentials $d f_j$ span the cotangent bundle of $C^compose$.
    Pairing a symmetric tensor with all ordered $b$-tuples of these differentials embeds its space of sections
    into a finite tuple of regular functions on $C^compose$. Normality extends these functions over $o$.
    This also shows that the torus action on sections is locally finite,
    so the tensor has a nonzero torus eigencomponent; every such component retains its specified $zeta$-weight.
  Let $chi$ be the character of a nonzero component, and choose a nonzero pairing with $d f_(j_1) ⊗ dots.h.c ⊗ d
    f_(j_b)$. Its function has character $beta = chi + alpha_(j_1) + dots.h.c + alpha_(j_b)$ and integral degree
  $ 0 lt.eq d = - b m + d_(j_1) + dots.h.c + d_(j_b) lt.eq c_2 r b . $
  It has a polynomial lift in the generators consisting of monomials of character $beta$,
    by torus equivariance of the polynomial presentation of $S$.
    Each such monomial contains at most $d \/ \( c_1 r \) lt.eq \( c_2 \/ c_1 \) b$ factors, by Equation (3.9).
    As the generator characters are fixed, this proves $parallel beta parallel = O \( b \)$,
    and then $parallel chi parallel = O \( b \)$, uniformly in the tensor, its rank and the grading.
  Put $tau = chi \( xi \)$. The eigencomponent satisfies Lemma 14, so $tau gt.eq - b$. On the other hand,
  $ - b m = chi \( zeta \) = r / n tau + chi \( epsilon.alt \) gt.eq - r / n b - c b parallel epsilon.alt parallel . $
  Dividing by $b$ proves Equation (3.8). ◻
]

#proof[
  For each grading choose the minimal curve and its stabilizer order $m$ as above.
    If the exceptional case in Lemma 11 occurs, then $r \/ m =
    N$ and the $mu_m$-action on $T_(C \, P)$ is trivial. Faithfulness of the transverse tangent action implies
    $m = 1$, hence $r = N$. Equation (3.2) then forces $m_max = 1$.
  For the remaining indices, Lemmas 12 and 13 apply. The character estimate and Equation (3.4) give
  $ 0 lt.eq n m - r lt.eq n c parallel epsilon.alt parallel . $
  The left side is an integer. Since the error tends to zero, we have $n m =
    r$ for all sufficiently large indices. For a rational ray with its constant exact grading the error is zero,
    so this equality holds directly.
  Now the finite evaluation has $dim H = n$, whereas its deformation dimension satisfies
  $ n = dim H gt.eq n + r / m - sum_(j = 1)^n b'_j / m = 2 n - sum_(j = 1)^n b'_j / m gt.eq n . $
  All equalities must hold. In particular every $b'_j = m$, so the tangent action is trivial.
    Its faithfulness again gives $m = 1$, and now $r = n = N + 1$. Finally
  $ m_max lt.eq frac(N + 1, N) < 2 $
  forces $m_max = 1$.
  The quotient is therefore an ordinary smooth projective Fano $N$-fold and $L$ an actual ample line bundle.
    The Kobayashi–Ochiai theorem in its ample-line-bundle formulation #cite(label("KO73")),
    also supplied by #cite(label("ADK08")) Theorems 1.1 and 1.3, applied to $- K_B = r L$ with $r = N + 1$ or $N$,
    gives precisely the two polarized varieties stated in the theorem.
    The polarization is the standard one, as also follows by substituting into their Picard groups.
    By the section-ring identity from the cone setup,
  $ S = xor.big_(j gt.eq 0) H^0 \( B \, j L \) . $
  This is the polynomial ring for $\( bb(P)^N \, cal(O) \( 1 \) \)$,
    and the homogeneous coordinate ring of a nondegenerate quadratic hypersurface for
    $\( Q^N \, cal(O) \( 1 \) \)$. Its affine cone is respectively smooth or the $n$-dimensional ordinary double
    point. ◻
]

== 4 Jet cones and the canonical interior point <jet:section>

We work with the fixed cone supplied by Proposition 7. Thus $C = "Spec" S$ has dimension $n = N + 1$,
  its puncture is smooth, and its canonical module has a homogeneous nowhere-vanishing generator on the puncture.
  The minimizing Reeb vector $xi$ is normalized by $A_C \( xi \) = n$. Throughout this section,

#[#set math.equation(numbering: n => "(4.1)")
 $ hat("vol") \( o \, C \) gt.eq 2 N^n . $ <jet:density-hypothesis>]

Take the primitive positive gradings of Lemma 8, so that

$ zeta_nu = \( r_nu \/ n \) xi + epsilon.alt_nu \, wide r_nu = A_C \( zeta_nu \) \, wide epsilon.alt_nu arrow.r 0 $

in absolute cocharacter norm. In the rational case we use the exact constant grading.
  Consider a subsequence on which the largest stabilizer order satisfies $m_nu gt.eq r_nu \/ N$,
  and choose a point attaining that order. We suppress the index $nu$ when discussing a single grading.
  Constants carrying a subscript $C$ may depend on this fixed cone and on $N$;
  no uniformity over different cones is needed.

=== 4.1 Leading Taylor terms and the real cone <leading-taylor-terms-and-the-real-cone>

Let $B$ and $L$ be the smooth quotient orbifold and its weight-one line bundle from Lemma 9. In particular,

$ S_j = H^0 \( B \, j L \) \, wide - K_B = r L . $

At the chosen point, take a smooth equivariant uniformizer with parameters $z_1 \, dots.h \,
  z_N$ and stabilizer $mu_m$. Choose the parameters and the frame of $L$ so that their characters are respectively
  $b_1 \, dots.h \, b_N in bb(Z) \/ m$ and $1$. We choose these algebraically:
  averaging regular lifts of a cotangent eigenbasis gives an equivariant map to $bb(A)^N$ that is étale at the
  chosen point, and averaging a nonvanishing local frame gives the specified line character.
  After shrinking, these are equivariant algebraic étale coordinates and an algebraic frame.
  A section of $j L$ is then represented by a power series $F \( z \)$ satisfying

$ F \( epsilon^(b_1) z_1 \, dots.h \, epsilon^(b_N) z_N \) = epsilon^j F \( z \) . $

Order monomials first by total degree and then lexicographically, with the smallest monomial first.
  Write $"in" \( s \) = z^gamma$ for the leading monomial, omitting its nonzero scalar coefficient, and put

#[#set math.equation(numbering: n => "(4.2)")
 $ Gamma & = { \( j \, gamma \) : 0 eq.not s in S_j \, med "in" \( s \) = z^gamma } \,\
Lambda & = { \( j \, gamma \) in bb(Z) times bb(Z)^N : j equiv sum_i b_i gamma_i med \( mod med m \) } \,\
K & = overline("cone" \( Gamma \)) subset bb(R) times bb(R)^N . $ <jet:semigroup>]

Here $\( 0 \, 0 \) in Gamma$, and $gamma = 0$ denotes a nonzero constant Taylor term,
  including those of sections of positive degree. The degree coordinate in Equations (4.2)–(4.2) is the
  #emph[original] degree $j$.

For integrations only, introduce the scaled degree and the number

#[#set math.equation(numbering: n => "(4.3)")
 $ s = frac(r, N m) lt.eq 1 \, wide D_0 = frac(j, s m) = frac(N j, r) . $ <jet:scaling>]

We distinguish the coordinate $D_0$ from $j$ throughout. Write $tilde(K)$, $tilde(Gamma)$,
  and $tilde(Lambda)$ for the images of $K$, $Gamma$, and $Lambda$ under $\( j \, x \) mapsto \( N j \/ r \, x \)$.

#thm([Proposition 4.1.])[
  (Jet setup).  #emph[The following assertions hold.]
  + #emph[$Gamma$ is an additive semigroup with one-dimensional leaves,
    and its generated group is exactly $Lambda$. Every finite compatible Taylor jet is realized by sections of all
    sufficiently large degrees in each admissible progression.]
  + #emph[$K$ is a full-dimensional closed convex cone, contains the positive constant ray,
    projects onto the whole exponent orthant, and satisfies $K = overline("int" K)$.
    Its bounded-degree sections are bounded. More precisely, uniformly in the chosen point and nearby grading,
#[#set math.equation(numbering: n => "(4.4)")
 $ \| gamma \| := sum_i gamma_i lt.eq C_C j / r wide \( \( j \, gamma \) in K \) . $ <jet:bezout-bound>]

 Its scaled image has the form
#[#set math.equation(numbering: n => "(4.5)")
 $ tilde(K) = { \( D_0 \, x \) : x in bb(R)_(gt.eq 0)^N \, med D_0 gt.eq f \( x \) } \, $ <jet:epigraph>]

 where $f$ is finite, positively homogeneous, convex, and
#[#set math.equation(numbering: n => "(4.6)")
 $ f \( x \) gt.eq c_C \| x \| wide \( x in bb(R)_(gt.eq 0)^N \) $ <jet:f-coercive>]

 for a constant $c_C > 0$ independent of the nearby grading and chosen point.]
  + #emph[In the scaled coordinates the lattice density is $s$.
    If $ell$ is a linear functional strictly positive on $tilde(K) \\ { 0 }$, then
#[#set math.equation(numbering: n => "(4.7)")
 $ & \# { gamma' in tilde(Gamma) : ell \( gamma' \) < q }\
 & wide = s thin "Leb" { \( D_0 \, x \) in tilde(K) : ell \( D_0 \, x \) < 1 } thin q^n + o \( q^n \) \, $ <jet:count>]

 with Lebesgue measure in the scaled coordinates. No saturation assumption on $Gamma$ is required.]
  + #emph[The vector
#[#set math.equation(numbering: n => "(4.8)")
 $ c_0 = \( r \, upright(bold(1)) \) wide upright("in the original ") \( j \, gamma \) upright(" coordinates")
   $ <jet:canonical-vector>]

 belongs to $Lambda$. Its scaled coordinates are $\( N \, upright(bold(1)) \)$.]
] <jet:setup>

#proof[
  Leading monomials multiply, and the associated leading coefficient is a scalar.
    This proves additivity and the one-dimensional-leaf assertion.
    In particular, each leading index in a fixed degree accounts for one dimension of $S_j$.
  Choose an integer $M > 0$ divisible by all stabilizer orders such that $M
    L$ descends to an ample line bundle on the coarse space. In a fixed residue class $j_0$ modulo $M$,
    prescribe a finite compatible Taylor jet of a section of $j_0 L$.
    The kernel of the map to that finite jet space is coherent.
    Serre vanishing after tensoring by sufficiently large powers of $M L$,
    or after exact tame pushdown to the coarse space, makes the map on global sections surjective.
    Thus the prescribed jet is realized in every sufficiently large degree $j_0 + k M$.
    Taking all the finitely many admissible residue classes proves the assertion about progressions.
    In particular, constants occur in all sufficiently large degrees divisible by $m$,
    and each monomial $z^gamma$ occurs as a leading term in sufficiently large compatible degrees.
  Differences of two such constant indices whose degrees differ by $m$ give $\( m \, 0 \)$ in the generated group.
    For each $i$, a realized linear jet gives an index $\( j_i \, e_i \)$ with $j_i equiv
    b_i med \( mod med m \)$. The vectors $\( m \, 0 \) \, \( j_1 \, e_1 \) \,
    dots.h \, \( j_N \, e_N \)$ generate the full congruence lattice in Equation (4.2).
    All indices satisfy that congruence, proving equality of groups.
    These same indices show that the cone contains the positive constant ray, has full dimension,
    and projects onto the exponent orthant.
  We next prove the uniform estimate. Fix torus eigen-generators of $S$ and the resulting affine embedding of $C$.
    Their $zeta_nu$-degrees are bounded below by a fixed positive multiple of $r_nu$ for all sufficiently large
    $nu$, because their $xi$-weights are positive. A section of degree $j$ has a homogeneous polynomial lift in
    these generators, of ordinary polynomial degree at most $C j \/ r$.
    At a smooth point of the punctured cone, a homogeneous function has the same local vanishing order as its
    restriction to a transverse slice: in orbit and slice coordinates it is a unit power of the orbit coordinate
    times its slice expression.
  Take a general complete-intersection curve through the smooth point,
    cut out by affine hyperplanes in the fixed embedding. It is smooth there and is not contained in the zero
    locus of the nonzero function. The local intersection multiplicity with the function is at least its local
    vanishing order. Bézout’s inequality bounds this multiplicity by the polynomial degree times the degree of the
    fixed embedded cone. This proves Equation (4.4) for $Gamma$, and then for $K$ by homogeneity and closure.
    In particular, bounded degree cuts are compact.
  The positive constant ray makes every nonempty fiber over an exponent $x$ an upper ray in degree.
    Every exponent fiber is nonempty, since nonnegative combinations of the indices $\( j_i \, e_i \)$ reach every
    $x gt.eq 0$. Closedness and the degree bound make the lowest degree in each fiber attainable.
    Hence $K$ is the epigraph of a finite convex positively homogeneous function in the scaled coordinates.
    Equation (4.4) becomes Equation (4.6). A full-dimensional closed convex cone is the closure of its interior.
  The original lattice has covolume $m$. The coordinate change $\( j \, gamma \)
    mapsto \( N j \/ r \, gamma \)$ multiplies covolumes by $N \/ r$; the resulting covolume is $N m \/ r =
    1 \/ s$. For clarity, we give the nonsaturated semigroup counting argument.
    This is the conductor-and-exhaustion method for value semigroups #cite(label("KavehKhovanskii2012"))
    Theorems 1.4 and 1.6, also used for graded linear series in #cite(label("LazarsfeldMustata2009"))
    Proposition 2.1. Its asymptotic conclusion does not assert exact saturation.
    Let $Gamma_0$ be a finitely generated subsemigroup with full generated group $Lambda$,
    and let $K_0$ be its cone. There is a vector $c in Gamma_0$ such that
  #[#set math.equation(numbering: n => "(4.9)")
   $ c + \( K_0 ∩ Lambda \) subset Gamma_0 . $ <jet:conductor>]
  Indeed every lattice point of $K_0$ lies in a cone generated by a linearly independent subset of the finite
    generating set. Removing the integer parts of its nonnegative coefficients writes it as a semigroup element
    plus a lattice point in one of finitely many bounded parallelepipeds.
    There are only finitely many possible remainders $v$. Since the group is $Lambda$,
    write each such remainder as $v = v_(+) - v_(-)$ with $v_plus.minus in Gamma_0$.
    The sum of all the $v_(-)$ is a single $c$ for which Equation (4.9) holds.
    Translating a bounded linear cutoff changes its scale by a constant,
    so ordinary lattice counting between $c + \( K_0 ∩ Lambda \)$ and $K_0 ∩
    Lambda$ gives its leading lattice volume. After the coordinate change this is Euclidean volume with density $s$.
  Now exhaust $"int" K$ by cones of finitely many indices of $Gamma$,
    always retaining a fixed finite set whose group is $Lambda$.
    Every interior point belongs to the interior of one of these finite cones:
    choose a small simplex surrounding it in $"int" K$ and approximate the simplex vertices by elements of
    $"cone" \( Gamma \)$. The resulting finite cones give the lower leading count.
    Counting all lattice points of $K$ gives the upper count.
    Compact convex cutoff bodies have boundary of Lebesgue measure zero,
    and their volumes are exhausted from the interior. This proves Equation (4.7).
  Finally, on the uniformizer the canonical character is the negative of the sum of the coordinate characters,
    in the convention for equivariant line bundles used here.
    The identity $- K_B = r L$ therefore gives $r equiv sum_i b_i med \( mod med m \)$, proving Equation (4.8). ◻
]

=== 4.2 Discrepancy and moment tests <discrepancy-and-moment-tests>

#thm([Lemma 4.2.])[
  (The degree and Taylor-order test).  #emph[For $delta in bb(Q)_(gt.eq 0)$, the rule
#[#set math.equation(numbering: n => "(4.10)")
 $ v_delta #scale(x: 180%, y: 180%)[\(] sum_j s_j #scale(x: 180%, y: 180%)[\)] =
   min_(s_j eq.not 0) {frac(N j, r) + delta "ord"_z \( s_j \)} $ <jet:test-rule>]

 defines a valuation centered at the vertex. It is divisorial up to positive rescaling, and
#[#set math.equation(numbering: n => "(4.11)")
 $ A_C \( v_delta \) & = N + N delta \,\
A_C \( v_delta \)^n "vol" \( v_delta \) & = N^n \( 1 + delta \)^n s integral_(bb(R)_(gt.eq 0)^N)
  e^(- f \( x \) - delta \| x \|) thin d x . $ <jet:test-discrepancy>]

]
] <jet:test>

#proof[
  Use the local line-bundle extraction over the chosen uniformizer.
    Write $t$ for its line coordinate, of grading weight one. Its finite quotient presentation has the action
  $ \( t \, z_1 \, dots.h \, z_N \) mapsto \( epsilon^(- 1) t \, epsilon^(b_1) z_1 \, dots.h \, epsilon^(b_N) z_N \) . $
  A homogeneous function of degree $j$ pulls back to $t^j F_j \( z \)$. The monomial valuation with costs
  $ v \( t \) = N \/ r = 1 \/ \( s m \) \, wide v \( z_i \) = delta $
  therefore restricts to Equation (4.10). Distinct original degrees have different powers of $t$,
    so even when scalar values agree their lowest monomials cannot cancel.
    Rational positive costs give a divisorial monomial valuation up to rescaling.
    At $delta = 0$ the rule is the rescaled ordinary degree valuation.
    The positive degree cost and the positivity of all algebra-generator degrees imply that its center is the vertex.
  Let $Omega_C$ be the homogeneous canonical generator of weight $r$. On this chart it has the form
  $ t^(r - 1) u \( z \) thin d t and d z_1 and dots.h.c and d z_N \, wide u \( 0 \) eq.not 0 . $
  The exponent follows from homogeneity, and the coefficient is a unit because $Omega_C$ is nonvanishing on the
    punctured cone. Computing discrepancy from this pulled-back form,
    including the finite-chart ramification in the restricted value scaling, gives
  $ A_C \( v_delta \) = N / r + N delta + \( r - 1 \) N / r = N + N delta . $
  Equivalently one can take a weighted monomial extraction on the smooth chart and apply the canonical divisor
    formula there; the same calculation descends to the quotient. For $delta = 0$ it is the canonical degree formula.
  In each $S_j$, a leading-term basis is compatible with total Taylor order.
    Thus the colength below a cutoff $q$ is the number of indices of $Gamma$ satisfying $D_0 + delta \| x \| < q$.
    These finite quotients are supported at the vertex, so computing them in $S$ or in its local ring gives the
    same length. Proposition 16 applies to this strictly positive cutoff functional.
    Since $K$ has dimension $n$, homogeneity and integration by layers give
  $ n ! "Leb" { \( D_0 \, x \) in tilde(K) : D_0 + delta \| x \| < 1 } =
    integral_(tilde(K)) e^(- D_0 - delta \| x \|) thin d D_0 thin d x =
    integral_(bb(R)_(gt.eq 0)^N) e^(- f \( x \) - delta \| x \|) thin d x . $
  Combining this identity with the lattice density and Equation (4.11) proves Equation (4.11). ◻
]

Let $X_1 \, dots.h \, X_N$ be independent exponential random variables of mean one. For the current grading put

#[#set math.equation(numbering: n => "(4.12)")
 $ B_0 \( x \) = f \( x \) - \| x \| \, wide H = bb(E) e^(- B_0 \( X \)) =
   integral_(bb(R)_(gt.eq 0)^N) e^(- f \( x \)) thin d x . $ <jet:moment-notation>]

#thm([Lemma 4.3.])[
  (The two moment inequalities).  #emph[Along the fixed-cone sequence of gradings, there are numbers $eta_nu gt.eq
    0$ tending to zero such that
#[#set math.equation(numbering: n => "(4.13)")
 $ H gt.eq 2 / s \, wide bb(E) \[ \( 1 + B_0 \( X \) \) e^(- B_0 \( X \)) \] gt.eq -
   eta_nu H . $ <jet:moment-inequalities>]

 For an exact minimizing rational grading one may take $eta_nu = 0$.]
] <jet:moments>

#proof[
  Write $F \( delta \)$ for the right side of Equation (4.11). The volume hypothesis and the test at zero give
  $ 2 N^n lt.eq hat("vol") \( o \, C \) lt.eq F \( 0 \) = N^n s H \, $
  which is the first inequality.
  Consider the probability measure $d mu_f = H^(- 1) e^(- f \( x \)) d x$.
    Positive homogeneity gives, for every $t > 0$,
  $ integral e^(- t f \( x \)) d x = t^(- N) H . $
  Differentiating, justified by Equation (4.6), yields
  #[#set math.equation(numbering: n => "(4.14)")
   $ bb(E)_(mu_f) f = N \, wide bb(E)_(mu_f) f^2 = N \( N + 1 \) . $ <jet:homogeneous-moments>]
  In particular,
  #[#set math.equation(numbering: n => "(4.15)")
   $ frac(F' \( 0 \), F \( 0 \)) & = n - bb(E)_(mu_f) \| x \|\
 & = 1 + bb(E)_(mu_f) \( f - \| x \| \) = frac(bb(E) \[ \( 1 + B_0 \) e^(- B_0) \], H) . $ <jet:first-derivative>]
  We check the uniformity needed for near-minimality. Equation (4.6) and Equation (4.14) give uniform first and
    second moments of $\| x \|$ under $mu_f$. Indeed they are at most $c_C^(- 1) N$ and $c_C^(- 2) N \( N + 1 \)$,
    respectively. Since
  $ frac(F \( delta \), F \( 0 \)) = \( 1 + delta \)^n bb(E)_(mu_f) e^(- delta \| x \|) \, $
  twice differentiating shows
  #[#set math.equation(numbering: n => "(4.16)")
   $ sup_(0 lt.eq delta lt.eq 1) frac(\| F'' \( delta \) \|, F \( 0 \)) lt.eq C'_C $ <jet:second-derivative>]
  for a fixed finite constant. The three terms are bounded by constant multiples of $1$, $bb(E)_(mu_f) \| x \|$,
    and $bb(E)_(mu_f) \| x \|^2$, because $e^(- delta \| x \|) lt.eq 1$.
  The test at zero is a rescaling of the current degree valuation, so Lemma 8 gives $F_nu \( 0 \) arrow.r
    hat("vol") \( o \, C \)$. If $F'_nu \( 0 \) \/ F_nu \( 0 \)$ were bounded above by a fixed negative number
    along a subsequence, Taylor’s formula and Equation (4.16) would give a fixed small positive rational $delta$
    and a fixed $rho > 0$ such that $F_nu \( delta \) lt.eq \( 1 - rho \) F_nu \( 0 \)$.
    This is incompatible with $F_nu \( delta \) gt.eq hat("vol") \( o \, C \) > 0$ and the preceding convergence.
    Thus $F'_nu \( 0 \) \/ F_nu \( 0 \) gt.eq - eta_nu$ for some $eta_nu arrow.r 0$.
    Equation (4.15) proves the second inequality. At an exactly minimizing degree valuation,
    every positive rational test has volume at least $F \( 0 \)$, so its right derivative is nonnegative. ◻
]

=== 4.3 A uniform exponential expectation inequality <a-uniform-exponential-expectation-inequality>

We need to bound $H$ when $B_0$ is bounded below by a linear function whose coefficients sum to zero.
  The second inequality in Lemma 18 controls the expectation of $\( 1 + B_0 \) e^(- B_0)$.
  Combining it with $H$ leads, for $u > 0$, to $\( 1 + \( 1 + B_0 \) \/ u \) e^(- B_0)$,
  whose pointwise upper envelope is the truncated exponential below.

Define the continuously differentiable function

#[#set math.equation(numbering: n => "(4.17)")
 $ g \( y \) = cases(delim: "{", 1 \, & y lt.eq 0 \,, \( 1 + y \) e^(- y) \, & y > 0 \,) $ <prob:g>]

Here $0 lt.eq g lt.eq 1$.

For any real $v$ and any $u > 0$, elementary differentiation gives

#[#set math.equation(numbering: n => "(4.18)")
 $ sup_(b gt.eq v) (1 + frac(1 + b, u)) e^(- b) = e^u / u g \( u + v \) . $ <jet:envelope>]

Indeed the derivative of the expression on the left before maximization is $- \( u + b \) e^(- b) \/ u$,
  so its maximum is attained at $b = - u$ when $v lt.eq - u$, and at $b = v$ otherwise.

#thm([Theorem 4.4.])[
  (The exponential bound).  #emph[For $u = 4 \/ 3$ one has
#[#set math.equation(numbering: n => "(4.19)")
 $ sup_(N gt.eq 1) med sup_(a in bb(R)^N\
sum_i a_i = 0) e^u / u bb(E) g \( u + a dot.op X \) = C_(*) := 3 / 4 e^(4 \/ 3) - e / 3 < 2 . $ <prob:universal-bound>]

 The supremum over dimensions is approached by the vectors
   $\( 2 \, - 2 \/ \( N - 1 \) \, dots.h \, - 2 \/ \( N - 1 \) \)$ as $N arrow.r oo$.]
] <prob:bound>

The theorem gives a bound strictly below the threshold $2$ in Lemma 18.
  We prove it before applying it to the canonical point. For the proof, put $h = 1 - g$; then

#[#set math.equation(numbering: n => "(4.20)")
 $ h' \( y \) = y e^(- y) upright(bold(1))_({ y > 0 }) \, wide k \( y \) :=
   h'' \( y \) = \( 1 - y \) e^(- y) upright(bold(1))_({ y > 0 }) $ <prob:kernel>]

holds almost everywhere. In particular $h'$ is globally Lipschitz and $k$ is bounded.

#thm([Lemma 4.5.])[
  (Log-concavity and a barycenter half-space bound).  #emph[A nonzero mean-zero linear combination of independent
    mean-one exponentials has a positive continuous log-concave density on the whole real line.
    Adding further independent scaled exponentials, with either sign of coefficient, preserves these properties.
    If $Z$ has such a density, then
#[#set math.equation(numbering: n => "(4.21)")
 $ 1 / e lt.eq bb(P) \( Z lt.eq bb(E) Z \) lt.eq 1 - 1 / e . $ <prob:grunbaum>]

]
] <prob:logconcavity>

#proof[
  The preservation of log-concavity under convolution is a special case of the classical theory of Prékopa
    #cite(label("Prekopa1973")) Theorems 7–8; we give the elementary exponential-specific argument needed here.
    A nonzero coefficient vector with sum zero has a positive and a negative coefficient.
    The difference $a E - b E'$ for $a \, b > 0$ has density
  $ p \( x \) = frac(1, a + b) cases(delim: "{", e^(x \/ b) \, & x lt.eq 0 \,, e^(- x \/ a) \, & x gt.eq 0 .) $
  It is positive, continuous, and log-concave.
  Let $r$ be a positive log-concave function for which the indicated one-sided integrals are finite.
    Set $R \( x \) = integral_(- oo)^x r \( y \) d y$. For $t gt.eq 0$,
    concavity of $log r$ implies that $r \( x - t \) \/ r \( x \)$ is nondecreasing in $x$. Thus
  $ frac(R \( x \), r \( x \)) = integral_0^oo frac(r \( x - t \), r \( x \)) d t $
  is nondecreasing, and $\( log R \)' = r \/ R$ is nonincreasing. Consequently $R$ is log-concave.
    The same argument with $r \( x + t \) \/ r \( x \)$ shows that $T \( x \) =
    integral_x^oo r \( y \) d y$ is log-concave: $T \/ r$ is nonincreasing, so $\( log T \)' = -
    r \/ T$ is nonincreasing. These statements can equivalently be read almost everywhere;
    the positive functions involved are locally absolutely continuous.
  If $p$ is a positive log-concave probability density, adding $c E$ or $- c E$, $c > 0$,
    produces respectively the densities
  $ e^(- x \/ c) / c integral_(- oo)^x e^(y \/ c) p \( y \) d y \, wide e^(x \/ c) /
    c integral_x^oo e^(- y \/ c) p \( y \) d y . $
  The integrands are exponential tilts of $p$, hence log-concave,
    and the appropriate one-sided integrals are finite. The preceding argument proves log-concavity of the new
    densities. Positivity and continuity are immediate from the displayed formulas.
    Induction starting with $a E - b E'$ proves the assertions about finite exponential sums,
    and translation does not affect them.
  For completeness, Equation (4.21) is the one-dimensional log-concave form of Grünbaum’s centroid inequality
    #cite(label("Grunbaum1960")); see #cite(label("LovaszVempala2007")) Lemma 5.4 and #cite(label("MNRY18"))
    Section 3. It follows directly here from the same integral argument.
    If $G$ is the distribution function of $Z$, both $G$ and $1 - G$ are log-concave.
    Since $G \( Z \)$ is uniform on $\( 0 \, 1 \)$, Jensen’s inequality gives
  $ log G \( bb(E) Z \) gt.eq bb(E) log G \( Z \) = integral_0^1 log t thin d t = - 1 . $
  Applying the same reasoning to $1 - G$ gives $log \( 1 - G \( bb(E) Z \) \) gt.eq - 1$.
    All the means in the present application are finite, and both logarithmic expectations just used equal $- 1$.
    These two inequalities give Equation (4.21). ◻
]

#thm([Lemma 4.6.])[
  (Strict single crossing).  #emph[Let $Z$ have a positive log-concave probability density on $bb(R)$,
    and let $E$ be an independent mean-one exponential. If
$ bb(E) k \( Z + c_(*) E \) = 0 \, $

 then $bb(E) k \( Z + c E \) > 0$ for every $c < c_(*)$ and $bb(E) k \( Z + c E \) < 0$ for every $c > c_(*)$.]
] <prob:single-crossing>

#proof[
  Write $p$ for the density of $Z$ and first consider
  $ psi \( t \) = bb(E) k \( Z + t \) = integral_0^oo \( 1 - y \) e^(- y) p \( y - t \) d y . $
  This is continuous, by continuity of translation in $L^1$ and boundedness of $k$.
    A positive log-concave density has a continuous representative whose logarithm is finite and concave.
    For $t_1 < t_2$, the ratio
  $ r \( y \) = p \( y - t_2 \) \/ p \( y - t_1 \) $
  is nondecreasing in $y$. If $psi \( t_1 \) = 0$, subtraction of the constant $r \( 1 \)$ gives
  $ psi \( t_2 \) = integral_0^oo k \( y \) p \( y - t_1 \) \( r \( y \) - r \( 1 \) \) d y lt.eq 0 : $
  the integrand is nonpositive on both $\( 0 \, 1 \)$ and $\( 1 \, oo \)$.
    Equality would force $r$ to be constant on $\( 0 \, oo \)$, by positivity and continuity.
    Thus $log p$ would have constant increments across the fixed interval length $t_2 - t_1$ on a half-line.
    Concavity forces it to be affine there: its almost-everywhere derivative is nonincreasing,
    and equality of this derivative across a fixed shift makes it constant on that half-line.
    Integrability then gives $p \( y - t_1 \) = A e^(- lambda y)$ for $y > 0$, with $A \, lambda > 0$. But
  $ psi \( t_1 \) = A integral_0^oo \( 1 - y \) e^(- \( 1 + lambda \) y) d y =
    frac(A lambda, \( 1 + lambda \)^2) > 0 \, $
  a contradiction. Hence the inequality is strict. Reversing the likelihood-ratio comparison proves strict
    positivity to the left of a zero. Continuity shows that $psi$ either has one strict sign everywhere or has
    exactly one zero, with positive sign to its left and negative sign to its right.
  Now put $F \( c \) = bb(E) psi \( c E \)$. For $c eq.not 0$, the density of $c E$ is
  $ q_c \( t \) = \| c \|^(- 1) e^(- t \/ c) upright(bold(1))_({ t c > 0 }) . $
  If $c_1 < c_2$ have the same sign, then on their common support
  $ frac(q_(c_2) \( t \), q_(c_1) \( t \)) = frac(\| c_1 \|, \| c_2 \|) exp #scale(x: 120%, y: 120%)[\(]
    t \( 1 \/ c_1 - 1 \/ c_2 \) #scale(x: 120%, y: 120%)[\)] $
  is strictly increasing in $t$. This holds on the negative half-line as well as on the positive half-line.
    If $F \( c_(*) \) = 0$ and $c_(*) eq.not 0$, then $psi$ must have its strict crossing inside that half-line.
    Subtracting the likelihood ratio at this crossing proves strict positivity of $F \( c \)$ for $c <
    c_(*)$ and strict negativity for $c > c_(*)$ within the same parameter half-line.
  The comparisons across zero are also strict. If $c_(*) > 0$, the crossing of $psi$ lies in $\( 0 \, oo \)$,
    so $psi > 0$ on $\( - oo \, 0 \]$ and $F \( c \) > 0$ for $c lt.eq 0$.
    If $c_(*) < 0$, the crossing lies in $\( - oo \, 0 \)$, giving $F \( c \) < 0$ for $c gt.eq 0$.
    Finally $F \( 0 \) = psi \( 0 \)$; a zero there gives the two required signs directly from those of $psi$.
    This proves the assertion for all real parameters. ◻
]

#thm([Lemma 4.7.])[
  (Finite critical points).  #emph[Fix $u > 0$ and $N gt.eq 2$. Every nonzero finite local maximum of
$ a mapsto bb(E) g (u + sum_(i = 1)^N a_i X_i) \, wide sum_i a_i = 0 \, $

 has, after permutation, the form
#[#set math.equation(numbering: n => "(4.22)")
 $ a = \( t \, - t \/ \( N - 1 \) \, dots.h \, - t \/ \( N - 1 \) \) wide \( t > 0 \) . $ <prob:exceptional-vector>]

]
] <prob:critical-points>

#proof[
  Equivalently consider a local minimum of $bb(E) h \( Y \)$, where $Y = u + sum_i a_i X_i$.
    At a nonzero coefficient vector, Lemma 20 supplies a continuous positive log-concave density for $Y$.
    First and second differentiation under the expectation are justified by boundedness of $h'$,
    its global Lipschitz property, the finite second moments of the variables $X_i$,
    and the absence of an atom at $Y = 0$. Stationarity in the direction $e_i - e_j$ gives
  #[#set math.equation(numbering: n => "(4.23)")
   $ 0 = bb(E) \[ \( X_i - X_j \) h' \( Y \) \] = \( a_i - a_j \) bb(E) \[ X_i X_j k \( Y \) \] . $ <prob:stationarity>]
  To see the second equality, condition on all other variables and on $S = X_i + X_j$.
    Given $S = s$, $X_i$ is uniform on $\[ 0 \, s \]$ and $X_j = s - X_i$.
    Integration by parts with $x \( s - x \)$, whose endpoint values vanish and whose derivative is $s - 2 x$,
    gives exactly Equation (4.23).
  For distinct indices, weighting by $X_i X_j$ changes those two independent exponential laws into independent
    Gamma$\( 2 \, 1 \)$ laws. Since $bb(E) X_i X_j = 1$, no normalization factor appears. Thus
  #[#set math.equation(numbering: n => "(4.24)")
   $ bb(E) \[ X_i X_j k \( Y \) \] = bb(E) k \( Y + a_i E' + a_j E'' \) \, $ <prob:size-bias>]
  where the added exponentials are independent of all variables in $Y$.
    If three distinct coefficient values occurred, fix an index $i$ at one value and choose indices at the other
    two. Equations (4.23) and (4.24) would give two distinct zeros of
  $ c mapsto bb(E) k \( Y + a_i E' + c E'' \) . $
  Its base variable has a positive full-support log-concave density by Lemma 20, contradicting Lemma 21.
    Therefore there are at most two coefficient values.
  Suppose the two values are $b < c$ and the higher value occurs at indices $i eq.not j$.
    A high-low pair gives a zero at $b$ of $d mapsto bb(E) k \( Y + c E' + d E'' \)$.
    Strict single crossing makes its value at $c$ negative. By Equation (4.24),
    this says $bb(E) \[ X_i X_j k \( Y \) \] < 0$. As $a_i = a_j$, $Y$ depends on this pair only through $S$, and
  $ bb(E) \[ \( X_i - X_j \)^2 divides S \] = S^2 \/ 3 \, wide bb(E) \[ X_i X_j divides S \] = S^2 \/ 6 . $
  Consequently the Hessian in the permissible splitting direction is
  $ bb(E) \[ \( X_i - X_j \)^2 k \( Y \) \] = 2 bb(E) \[ X_i X_j k \( Y \) \] < 0 \, $
  contradicting a minimum. The higher value therefore occurs once.
    The sum-zero constraint forces it to be positive and gives Equation (4.22). ◻
]

The preceding lemmas leave only one possible shape for a finite nonzero optimizer.
  To obtain a bound uniform in the dimension, it remains to control escape to infinity and then solve the
  resulting one-variable maximization.

#proof[
  Put $Phi_N \( a \) = \( e^u \/ u \) bb(E) g \( u + a dot.op X \)$ and let $cal(P)_N$ be its supremum under the
    sum-zero constraint. First control escape to infinity with $N$ fixed.
    From an unbounded sequence $a_k$, pass to a subsequence with $a_k \/ parallel a_k parallel arrow.r
    b eq.not 0$. The vector $b$ has sum zero, so $b dot.op X$ has mean zero and a continuous log-concave density.
    Almost surely away from its zero set,
  $ g \( u + a_k dot.op X \) arrow.r upright(bold(1))_({ b dot.op X < 0 }) . $
  Bounded convergence and Equation (4.21) imply that every such subsequential limit is at most
  #[#set math.equation(numbering: n => "(4.25)")
   $ B_(*) := e^u / u \( 1 - 1 \/ e \) . $ <prob:boundary-value>]
  Thus, if $cal(P)_N > B_(*)$, a maximizing sequence is bounded and a finite maximizer exists by continuity.
    The zero vector has value $1 + 1 \/ u = 7 \/ 4$. Every other finite maximizer has the form in Lemma 22.
    If $cal(P)_N lt.eq B_(*)$, the boundary estimate already suffices; we make no assertion of attainment in that case.
  Appending a zero coefficient shows that $cal(P)_N$ is nondecreasing in $N$, and it is bounded by $e^u \/ u$.
    Consider its limit. If that limit is at most $max \( B_(*) \, 7 \/ 4 \)$, those two values suffice.
    Otherwise sufficiently large dimensions have finite nonzero maximizers.
    After permutation write them as in Equation (4.22), with exceptional coefficient $t_N > 0$.
    On a common probability space their arguments are
  $ Y_N = u + t_N (X_1 - frac(1, N - 1) sum_(i = 2)^N X_i) . $
  Pass to a subsequence on which $t_N$ converges in $\[ 0 \, oo \]$.
    If $t_N arrow.r t < oo$, the law of large numbers and bounded convergence give
  $ Phi_N \( a_N \) arrow.r Phi_oo \( t \) := e^u / u bb(E) g \( u + t \( X_1 - 1 \) \) . $
  If $t_N arrow.r oo$, then $Y_N \/ t_N arrow.r X_1 - 1$ almost surely.
    The limit has no atom at zero; on its positive and negative sets, respectively, $Y_N$ tends to $+ oo$ and $-
    oo$. Hence bounded convergence gives
  $ Phi_N \( a_N \) arrow.r e^u / u bb(P) \( X_1 < 1 \) = B_(*) . $
  This argument uses no comparison between the growth of $t_N$ and $sqrt(N)$.
  It remains to maximize the scalar expression. For $0 lt.eq t lt.eq u$, the argument $u +
    t \( X_1 - 1 \)$ is nonnegative, and direct integration gives
  #[#set math.equation(numbering: n => "(4.26)")
   $ Phi_oo \( t \) =
     cases(delim: "{", e^t / u (frac(1 + u - t, 1 + t) + frac(t, \( 1 + t \)^2)) \, & 0 lt.eq t lt.eq u \,, e^u /
     u (1 - e^(- 1 + u \/ t) frac(t^2, \( 1 + t \)^2)) \, & t gt.eq u .) $ <prob:scalar-formula>]
  For the second branch, split the exponential integral at $X_1 = 1 - u \/ t$;
    above that point translate the integration variable so that the argument of $g$ is $t$ times the new variable.
    The integral there is $e^(- 1 + u \/ t) \( \( 1 + t \)^(- 1) + t \( 1 + t \)^(- 2) \)$,
    which yields the displayed formula.
  The derivative of the first branch has the sign of $t \( - t^2 + u t + u - 1 \)$.
    For $u = 4 \/ 3$, the second factor is positive throughout $\[ 0 \, u \]$,
    as its endpoint values are positive and it is concave. On the second branch,
    the logarithmic derivative of the positive quantity being subtracted is
  $ - u / t^2 + 2 / t - frac(2, 1 + t) = frac(\( 2 - u \) t - u, t^2 \( 1 + t \)) . $
  Thus this branch is maximal at $t = u \/ \( 2 - u \) = 2$, and its value is
  $ Phi_oo \( 2 \) = 3 / 4 e^(4 \/ 3) - e / 3 = C_(*) . $
  In particular $C_(*) > Phi_oo \( 0 \) = 7 \/ 4$. Moreover
  $ C_(*) - B_(*) = 3 / 4 e^(1 \/ 3) - e / 3 > 0 \, $
  because $e^(1 \/ 3) > 1 + 1 \/ 3$ and $e < 3$. The preceding compactness and limit argument proves the upper
    bound $sup_N cal(P)_N lt.eq C_(*)$. Taking $t_N = 2$ and applying the law of large numbers proves the reverse
    inequality and the asserted approach to the supremum.
  Finally the strict gap has an elementary rational certificate.
    The exponential series gives $e > 1359 \/ 500$ and $e^(4 \/ 3) < 1897 \/ 500$.
    For the latter bound one may retain terms through degree eight and bound the remaining tail by its first term
    divided by $1 - \( 4 \/ 3 \) \/ 10$. Therefore
  $ C_(*) < 3 / 4 1897 / 500 - 1 / 3 1359 / 500 = 3879 / 2000 < 2 . $
  ◻
]

=== 4.4 Interiority of the canonical vector <interiority-of-the-canonical-vector>

#thm([Theorem 4.8.])[
  (Canonical interior point).  #emph[For every sufficiently large grading in the subsequence under consideration,
#[#set math.equation(numbering: n => "(4.27)")
 $ c_0 = \( r \, upright(bold(1)) \) in "int" K wide upright("in the original degree coordinates") .
   $ <jet:interior-conclusion>]

 Equivalently, $f \( upright(bold(1)) \) < N$. For an exact minimizing rational grading with $m gt.eq r \/ N$,
   the conclusion holds without passage to a limit.]
] <jet:interior>

#proof[
  Suppose that $f \( upright(bold(1)) \) gt.eq N$. At the interior point $upright(bold(1))$ of the exponent
    orthant, choose a subgradient $p$ of $f$. Positive homogeneity gives $p dot.op upright(bold(1)) =
    f \( upright(bold(1)) \)$ and $f \( x \) gt.eq p dot.op x$ on the orthant.
    Therefore $B_0 \( x \) gt.eq \( p - upright(bold(1)) \) dot.op x$, and the coefficient sum of $p -
    upright(bold(1))$ is nonnegative. Subtracting the same nonnegative number from each coefficient gives a vector
    $a$ with sum zero and
  #[#set math.equation(numbering: n => "(4.28)")
   $ B_0 \( x \) gt.eq a dot.op x wide \( x in bb(R)_(gt.eq 0)^N \) . $ <jet:supporting-plane>]
  Take $u = 4 \/ 3$. Applying Equation (4.18) pointwise to Equation (4.28), and using Lemma 18, gives
  $ \( 1 - eta_nu \/ u \) H & lt.eq bb(E) [(1 + frac(1 + B_0 \( X \), u)) e^(- B_0 \( X \))]\
 & lt.eq e^u / u bb(E) g \( u + a dot.op X \) lt.eq C_(*) < 2 . $
  All expectations are finite by Equation (4.6). But $H gt.eq 2 \/ s gt.eq 2$,
    so the displayed inequality is impossible once $eta_nu$ is sufficiently small.
    Hence $f \( upright(bold(1)) \) < N$ for all sufficiently large gradings.
    At an exact minimizing rational grading, $eta_nu = 0$ gives the contradiction immediately.
  The scaled coordinates of $c_0$ are $\( N \, upright(bold(1)) \)$,
    and $upright(bold(1))$ is interior to the exponent orthant.
    The strict epigraph inequality is therefore precisely Equation (4.27).
    Its membership in the lattice was already proved in Proposition 16. ◻
]

== 5 Adjoint jets and the saturated semigroup <adj:section>

We retain the orbifold and jet data of Proposition 16. In particular,
  $B$ is a smooth effective proper complex orbifold of dimension $N$, its coarse space is projective,
  $L$ is an ample orbifold line bundle, and $- K_B = r L$. At the chosen point the stabilizer is $mu_m$,
  the fiber character of $L$ is faithful, and equivariant transverse parameters $z_1 \, dots.h \,
  z_N$ have characters $b_1 \, dots.h \, b_N$. We use the original, unscaled degree coordinate:

$ Lambda = {\( j \, gamma \) in bb(Z) times bb(Z)^N : j equiv sum_i b_i gamma_i med \( mod med m \)} \, wide
  c_0 = \( r \, upright(bold(1)) \) . $

The semigroup $Gamma$ records the total-degree-then-lexicographic Taylor initials of sections of $j L$,
  and $K$ is its closed real cone. It has full dimension, contains the positive constant ray,
  and has bounded slices of bounded original degree. Its projection onto the exponent coordinates is the
  nonnegative orthant. The canonical character identity gives $c_0 in Lambda$.

The adjoint lifting statement below uses these data but does #emph[not] assume that $c_0$ itself lies in the
  interior of $K$. We use Theorem 23 only after proving that statement.

=== 5.1 Vanishing on the smooth orbifold models <vanishing-on-the-smooth-orbifold-models>

We first record the precise form of vanishing needed on a weighted blowup and its resolution.
  Divisors and line bundles on a stack are written additively.
  Nefness and bigness of their rational classes are understood on the projective coarse space.

#thm([Lemma 5.1.])[
  (Orbifold vanishing).  #emph[Let $cal(X)$ be a smooth proper Deligne–Mumford stack over $bb(C)$,
    with trivial generic stabilizer and projective coarse space.
    Let $Theta$ be an effective rational divisor with simple normal crossing support and coefficients less than
    one. If $D$ is a Cartier divisor and $D - \( K_(cal(X)) + Theta \)$ is nef and big, then
$ H^q \( cal(X) \, cal(O)_(cal(X)) \( D \) \) = 0 wide \( q > 0 \) . $

]
] <adj:vanishing>

#proof[
  Let $q : cal(X) arrow.r X$ be the coarse morphism. For a prime divisor $B subset X$,
    let $e_B$ be the stabilizer order at the generic point of its inverse image.
    A rational divisor $A$ on $cal(X)$ has a coarse rational divisor $A_c$,
    characterized in codimension one by $q^(*) A_c = A$. Locally the coarse map is given in the normal direction
    by $t = z^(e_B)$, so
  $ K_(cal(X)) = q^(*) \( K_X + R \) \, wide R = sum_B \( 1 - 1 \/ e_B \) B . $
  Only divisors with $e_B > 1$ contribute to $R$.
  The coefficient of $D_c$ at $B$ is an integral multiple of $1 \/ e_B$. Consequently
  #[#set math.equation(numbering: n => "(5.1)")
   $ Delta = R + Theta_c - { D_c } $ <adj:coarse-boundary>]
  is effective: the fractional coefficient being subtracted is at most $\( e_B - 1 \) \/ e_B$.
    The pair $\( X \, Delta \)$ is klt. Indeed, on a smooth finite quotient uniformizer $U arrow.r X$,
    the log pullback of $Delta$ is the pullback of $Theta$ minus the effective pullback of ${ D_c }$.
    This boundary is bounded above by the simple normal crossing boundary $Theta \|_U$ with coefficients less than
    one. All its log discrepancies are therefore positive. The finite-map discrepancy formula,
    with ramification included in the displayed canonical identity, gives the same positivity downstairs.
  Normal extension from codimension one identifies
  $ q_(*) cal(O)_(cal(X)) \( D \) = cal(O)_X \( floor.l D_c floor.r \) . $
  For completeness, on a finite quotient chart the pushforward is the invariant part of an invertible module on a
    normal smooth scheme. Sections extend across sets of codimension at least two there and then remain invariant,
    so this pushforward is the rank-one reflexive sheaf prescribed by its codimension-one orders.
    Those orders are exactly $floor.l D_c floor.r$. Taking invariants is exact in characteristic zero, which also gives
  $ H^q \( cal(X) \, cal(O)_(cal(X)) \( D \) \) = H^q \( X \, cal(O)_X \( floor.l D_c floor.r \) \) . $
  The coarse space has quotient singularities and is locally $bb(Q)$-factorial.
    Thus $floor.l D_c floor.r$ is an integral $bb(Q)$-Cartier Weil divisor. By Equation (5.1),
  $ floor.l D_c floor.r - \( K_X + Delta \) = D_c - \( K_X + R + Theta_c \) \, $
  which is the nef and big class descended from $D - \( K_(cal(X)) + Theta \)$.
    Kawamata–Viehweg vanishing for a klt pair and an integral $bb(Q)$-Cartier Weil divisor now applies
    #cite(label("FujinoKV")). It gives the claimed vanishing.
    This argument requires neither flatness of the coarse morphism nor ampleness in place of nefness and bigness. ◻
]

=== 5.2 The adjoint lifting implication <the-adjoint-lifting-implication>

#thm([Lemma 5.2.])[
  (Adjoint lattice points).  #emph[For the orbifold jet data above,
#[#set math.equation(numbering: n => "(5.2)")
 $ \( j \, alpha \) in Lambda \, wide \( j \, alpha \) + c_0 in "int" K quad
   arrow.r.double quad \( j \, alpha \) in Gamma . $ <adj:adjoint-implication>]

]
] <adj:implication>

#proof[
  The coordinate inequalities of $K$ imply $alpha_i + 1 > 0$. Since $alpha_i$ is integral, $alpha_i gt.eq 0$.
    The bounded-slice property and the positivity of the degree coordinate on $K \\ { 0 }$ give $j + r > 0$.
    Choose a rational number
  $ 0 < j_0 < j + r quad upright("such that") quad p = \( j_0 \, alpha + upright(bold(1)) \) in "int" K . $
  We construct a section of $j L$ with the required Taylor initial.
  ===== 5.2.1 Replacing finitely many initials by scalar weights. <replacing-finitely-many-initials-by-scalar-weights.>
  There are finitely many sections whose initial indices span a polyhedral cone containing $p$ in its interior.
    To see this without assuming finite generation of $Gamma$,
    choose a small simplex around $p$ inside $K$ and approximate its vertices by points in the cone generated by
    $Gamma$. Sufficiently close approximations still surround $p$,
    and each uses only finitely many semigroup elements. The union of those finite lists has the desired property.
  For this list of sections, choose positive primitive integral weights $u_1 \, dots.h \,
    u_N$ such that scalar $u$-order has exactly their specified Taylor initials, each as a single monomial.
    Here is the finite-order justification. Let $d$ exceed the total degrees of those initials and the total
    degree of $alpha$. Weights sufficiently close to a common positive value preserve all strict total-degree
    comparisons through degree $d$ and place every monomial of total degree greater than $d$ above the relevant
    initials. Among monomials of equal degree at most $d$, successive sufficiently small rational perturbations of
    the weights realize the chosen lexicographic order. There are only finitely many such comparisons.
    We can include all monomials preceding $alpha$ among them,
    and then clear denominators and divide by the common divisor. Thus, in addition,
  #[#set math.equation(numbering: n => "(5.3)")
   $ gamma upright(" precedes ") alpha quad arrow.r.double quad
     u dot.op gamma < u dot.op alpha . $ <adj:scalar-order-choice>]
  This handles formal Taylor series as well as polynomial expansions,
    since positivity of the weights excludes all sufficiently high total degrees at once.
  Set
  $ p_0 = u dot.op alpha \, wide U = u dot.op \( alpha + upright(bold(1)) \) = p_0 + sum_i u_i . $
  The affine plane given by original degree $j_0$ and scalar cost $U$ meets the finite cone just chosen in a
    relative neighborhood of $p$. Choose finitely many rational points in that neighborhood surrounding $p$ in the
    plane. Their expressions as nonnegative combinations of the integral cone generators can be taken rational.
    Clear all denominators simultaneously. Multiplication of the corresponding sections then gives a positive
    integer $a$ and sections $s_1 \, dots.h \, s_t$ of $a j_0 L$ with single $u$-initials $z^(beta^(\( 1 \))) \,
    dots.h \, z^(beta^(\( t \)))$, after rescaling, such that
  #[#set math.equation(numbering: n => "(5.4)")
   $ u dot.op beta^(\( k \)) = a U \, wide alpha + upright(bold(1)) in "relint" "conv" { beta^(\( 1 \)) \/ a \,
     dots.h \, beta^(\( t \)) \/ a } subset { x : u dot.op x = U } . $ <adj:surrounding>]
  The relative interior here contains a neighborhood in the entire displayed affine plane.
    Products preserve single initials, so no claim about generation of the full section ring has entered this
    construction.
  ===== 5.2.2 The weighted blowup stack. <the-weighted-blowup-stack.>
  Use the algebraic equivariant parameters fixed in Section 4.
    For $k gt.eq 0$, let $I_k$ be the ideal generated locally by monomials of $u$-weight at least $k$.
    Each $I_k$ contains an ordinary power of the maximal ideal,
    so its quotient is determined on a finite infinitesimal neighborhood of the chosen residual gerbe.
    Equivariance descends this quotient to $B$, and extending its kernel as the unit ideal off the center gives a
    global coherent ideal. On a chart with a larger finite group,
    use the translates at all points of the finite orbit. One fixed parameter system defines every $I_k$,
    so these ideals form a multiplicative filtration, including after passage to the completed Taylor ring.
  The weighted Rees algebra
  $ cal(A) = xor.big_(k gt.eq 0) I_k sans(q)^k $
  is locally generated over the coordinate ring by $z_i sans(q)^ell$, $1 lt.eq ell lt.eq u_i$:
    distribute $k$ among the factors of a monomial of weight at least $k$,
    assigning at most $u_i$ to each occurrence of $z_i$. Define $pi : cal(Z) arrow.r
    B$ as the stack quotient by the grading $bb(G)_m$ of $"Spec"_B cal(A) \\ V \( cal(A)_(+) \)$.
    This global construction commutes with the etale parameter charts and is the identity away from the center,
    where $I_k = cal(O)_B$.
  We identify its local smooth model to retain the exceptional inertia. Put $x_i = z_i sans(q)^(u_i)$.
    These elements cover the irrelevant open by their nonvanishing loci, because
  $ \( z_i sans(q)^ell \)^(u_i) = x_i^ell z_i^(u_i - ell) . $
  On $x_i eq.not 0$, the ratio $t = \( z_i sans(q)^(u_i - 1) \) \/ x_i$ is regular, including when $u_i = 1$,
    and $z_j = t^(u_j) x_j$. Thus before taking the original cyclic quotient our model is
  $
    [#scale(x: 120%, y: 120%)[\(] bb(A)_(x_1 \, dots.h \, x_N \, t)^(N + 1) \\ { x_1 = dots.h.c = x_N = 0 }
    #scale(x: 120%, y: 120%)[\)] \/ bb(G)_m] \, wide rho dot.op \( x_i \, t \) = \( rho^(u_i) x_i \, rho^(- 1) t \) . $
  The original $mu_m$ acts by its characters on $x_i$ and trivially on $t$.
    The atlas is smooth and all stabilizers are finite. The exceptional Cartier divisor $E$ is $t = 0$;
    it is $\[ bb(P) \( u_1 \, dots.h \, u_N \) \/ mu_m \]$, with any generic stabilizer retained.
    The coarse modification is the relative projective weighted Rees blowup.
    A sufficiently divisible $cal(O)_(cal(Z)) \( - q E \)$ descends to its relatively ample tautological line
    bundle. Since the coarse space of $B$ is projective, so is that of $cal(Z)$.
  The Jacobian calculation in these coordinates gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ K_(cal(Z)) + E = pi^(*) K_B + #scale(x: 180%, y: 180%)[\(] sum_i u_i #scale(x: 180%, y: 180%)[\)] E .
     $ <adj:weighted-canonical>]
  Indeed $and.big_i d z_i$ has order $sum_i u_i - 1$ along $t = 0$ on each uniformizer.
    Keeping the stack structures makes this the Cartier divisor identity asserted in Equation (5.5).
  Define the line bundle divisors
  $ P_0 = pi^(*) \( j L \) - p_0 E \, wide H_0 = pi^(*) \( a j_0 L \) - a U E . $
  The canonical shift cancels the exceptional order because $U = p_0 + sum_i u_i$.
    Together with $- K_B = r L$, this gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ P_0 - \( K_(cal(Z)) + E \) - 1 / a H_0 = \( j + r - j_0 \) pi^(*) L . $ <adj:positive-difference>]
  Its right side is nef and big, with strictly positive coefficient;
    this is the positivity needed to lift from $E$. After their common exceptional order is removed,
    the sections $s_1 \, dots.h \, s_t$ define sections of $H_0$. Let $frak(b)$ be their base ideal.
    It does not vanish identically on $E$, and its restriction there is generated locally by the indicated
    monomial initials.
  ===== 5.2.3 Multiplier-ideal membership on the exceptional divisor. <multiplier-ideal-membership-on-the-exceptional-divisor.>
  The congruence $\( j \, alpha \) in Lambda$ says that $z^alpha$ has exactly the character required to be a
    global section of $P_0 \|_E$. Its scalar degree is $p_0$, and $cal(O)_E \( - E \) =
    cal(O)_E \( 1 \)$ in the weighted projective convention. We claim that
  #[#set math.equation(numbering: n => "(5.7)")
   $ z^alpha in H^0 (E \, P_0 \|_E ⊗ cal(J)_E \( \( frak(b) \|_E \)^(1 \/ a) \)) . $ <adj:multiplier-membership>]
  On the chart where $x_k eq.not 0$, pass to the smooth finite uniformizer that sets $x_k = 1$.
    More precisely the chart is $\[ bb(A)^(N - 1) \/ H_k \]$, where
  $ H_k = { \( rho \, zeta \) in bb(G)_m times mu_m : rho^(u_k) zeta^(b_k) = 1 } . $
  This is a finite extension of $mu_m$ by $mu_(u_k)$, acting on the remaining coordinates by $x_i mapsto rho^(u_i)
    zeta^(b_i) x_i$. It need not be a direct product or act effectively.
    On the underlying affine uniformizer, $P_0 \|_E$ and $H_0 \|_E$ are trivial line bundles with the respective
    $H_k$-characters $rho^(p_0) zeta^j$ and $rho^(a U) zeta^(a j_0)$.
    Thus the generators of the restricted ideal become the ordinary monomials
    $x_(upright("rem"))^(beta_(upright("rem"))^(\( i \)))$, and the proposed section becomes
    $x_(upright("rem"))^(alpha_(upright("rem")))$. For example, on $H_k$,
  $ product_(i eq.not k) \( rho^(u_i) zeta^(b_i) \)^(alpha_i) = rho^(p_0) zeta^j \, $
  by the defining relation of $H_k$ and the congruence for $alpha$. There are no fractional exponents:
    the root needed to set $x_k = 1$ has already been taken in the smooth atlas.
    Any generic stabilizer of $E$ is retained in $H_k$ and imposes exactly these character conditions,
    without changing the smooth-atlas multiplier formula. Projection from the plane $u dot.op x =
    U$ by dropping coordinate $k$ is an affine isomorphism. Hence Equation (5.4) places $alpha_(upright("rem")) +
    upright(bold(1))$ in the ordinary interior of the convex hull of the projected scaled generators,
    and therefore in the interior of their scaled Newton polyhedron.
  The monomial multiplier-ideal formula says that $x^nu$ belongs to $cal(J) \( I^c \)$ precisely when $nu +
    upright(bold(1))$ is in the interior of $c$ times the Newton polyhedron of $I$ #cite(label("Howald01")).
    Its hypotheses hold on this smooth affine chart. Applying it with $c =
    1 \/ a$ proves the claimed membership on every uniformizer.
    The ideal and the section are equivariant, so these memberships descend and prove Equation (5.7).
    No ordinary smoothness of the coarse exceptional divisor is being assumed.
  ===== 5.2.4 Adjoint vanishing and restriction. <adjoint-vanishing-and-restriction.>
  We apply the positivity in Equation (5.6) on a projective log resolution $sigma : cal(Y) arrow.r
    cal(Z)$ of $E$ and $frak(b)$, isomorphic at the generic point of $E$. We use smooth stacks throughout:
    functorial log resolution in smooth etale charts #cite(label("KollarResolution07")) Theorems 35–36 descends.
    Arrange that the total boundary, including the strict transform $tilde(E)$, has simple normal crossings,
    and that the restricted morphism $tau : tilde(E) arrow.r E$ resolves $frak(b) \|_E$. Write
  $ frak(b) cal(O)_(cal(Y)) = cal(O)_(cal(Y)) \( - G_0 \) . $
  The effective divisor $G_0$ does not contain $tilde(E)$, and $sigma^(*) H_0 -
    G_0$ is globally generated by the pulled-back sections.
  Consider the integral line bundle divisor
  $ A_(cal(Y)) = K_(cal(Y)) + sigma^(*) \( P_0 - K_(cal(Z)) - E \) - floor.l G_0 \/ a floor.r . $
  Its difference from $K_(cal(Y)) + { G_0 \/ a }$ is
  #[#set math.equation(numbering: n => "(5.8)")
   $ \( j + r - j_0 \) sigma^(*) pi^(*) L + 1 / a \( sigma^(*) H_0 - G_0 \) . $ <adj:resolution-positivity>]
  The first term is nef and big and the second is nef. The fractional boundary has simple normal crossings and
    coefficients less than one. Lemma 24 gives $H^1 \( cal(Y) \, cal(O)_(cal(Y)) \( A_(cal(Y)) \) \) = 0$.
    The divisor restriction sequence therefore gives a surjection
  #[#set math.equation(numbering: n => "(5.9)")
   $ H^0 \( cal(Y) \, A_(cal(Y)) + tilde(E) \) arrow.r
     H^0 \( tilde(E) \, \( A_(cal(Y)) + tilde(E) \) \|_(tilde(E)) \) . $ <adj:restriction-surjection>]
  Adjunction identifies the bundle on the right with
  #[#set math.equation(numbering: n => "(5.10)")
   $ tau^(*) \( P_0 \|_E \) + K_(tilde(E)) - tau^(*) K_E - ⌊\( G_0 \|_(tilde(E)) \) \/ a⌋ . $ <adj:restricted-adjoint>]
  Here round-down commutes with restriction. Indeed, simple normal crossings of $tilde(E) +
    "Supp" G_0$ prevents distinct components of $G_0$ from sharing a divisor on $tilde(E)$.
    If an individual intersection is disconnected, its coefficient is the same on each component,
    so the equality still holds. Moreover $G_0 \|_(tilde(E))$ is the divisor of the pulled-back restricted ideal.
    Thus Equation (5.10) is precisely the bundle in the log-resolution definition of the multiplier ideal
    appearing in Equation (5.7). That membership supplies a section of Equation (5.10) whose rational section is
    the pullback of $z^alpha$. Surjectivity in Equation (5.9) lifts it to $cal(Y)$.
  ===== 5.2.5 Regular pushdown and recovery of the initial. <regular-pushdown-and-recovery-of-the-initial.>
  The difference between the lifting bundle and $sigma^(*) P_0$ is
  #[#set math.equation(numbering: n => "(5.11)")
   $ K_(cal(Y)) - sigma^(*) K_(cal(Z)) - sigma^(*) E + tilde(E) -
     floor.l G_0 \/ a floor.r . $ <adj:pushdown-correction>]
  The part preceding the last term is effective and exceptional over $cal(Z)$.
    This can be checked during a resolution by smooth blowups:
    a center of codimension $c gt.eq 2$ contributes $c - 1$, or $c -
    2$ when contained in the strict transform of $E$, in addition to pullbacks of already effective exceptional
    terms. The same calculation holds in the etale smooth charts.
    The final term in Equation (5.11) is the negative of an effective divisor.
    It follows that the lifted rational section has no pole along any nonexceptional prime divisor.
    It pushes down to a regular section of $P_0$ on the normal stack $cal(Z)$.
    Its restriction to $E$ agrees generically with $z^alpha$, and hence agrees everywhere,
    since both are regular sections on the integral smooth stack $E$.
  Finally $p_0 gt.eq 0$, so $P_0$ is a subsheaf of $pi^(*) \( j L \)$.
    Normal extension across the center, or the local weighted blowup charts, gives $pi_(*) cal(O)_(cal(Z)) =
    cal(O)_B$. Pushing down thus produces a section of $j L$.
    The exceptional order and the specified restriction say exactly that its $u$-initial is $z^alpha$,
    with no term of smaller $u$-cost. Equation (5.3) then excludes every Taylor monomial preceding $alpha$ in the
    original order. This proves Equation (5.2). ◻
]

=== 5.3 Integral support forms and saturation <integral-support-forms-and-saturation>

We now use the interior conclusion from the preceding section.
  The next argument explains why the adjoint implication forces a polyhedral cone,
  rather than merely imposing a condition on facets that might happen to be rational.

#thm([Theorem 5.3.])[
  (The saturated jet semigroup).  #emph[Suppose $c_0 in "int" K$. Then the following statements hold:]
  + #emph[$K$ is a rational polyhedral cone.]
  + #emph[Every facet has a primitive nonnegative support form $eta in Lambda^(*)$ satisfying $eta \( c_0 \) = 1$.]
  + #emph[The semigroup and its interior lattice points satisfy
#[#set math.equation(numbering: n => "(5.12)")
 $ Gamma = K ∩ Lambda \, wide "int" K ∩ Lambda = c_0 + Gamma . $ <adj:saturation-identities>]

]
  #emph[In particular, $Gamma$ is a finitely generated saturated affine semigroup with group $Lambda$.
    These conclusions apply to every sufficiently far grading and chosen point covered by Theorem 23,
    including its exact rational case.]
] <adj:saturation>

#proof[
  Fix such jet data, with $c_0 in "int" K ∩ Lambda$. Put $phi \( x \) = \( r \/ N \) f \( x \)$,
    so the epigraph of $phi$ uses the original degree coordinate $j$, rather than $D_0 = N j \/ r$.
    On the open positive orthant, $phi$ is a finite convex function and is locally Lipschitz.
  ===== 5.3.1 A support at a differentiability point has height one. <a-support-at-a-differentiability-point-has-height-one.>
  Let $x$ be a differentiability point of $phi$ in the positive orthant,
    and let $y = \( phi \( x \) \, x \) in partial K$. Homogeneity gives $phi \( x \) =
    nabla phi \( x \) dot.op x$. The unique supporting normal ray at $y$ is therefore generated by
  $ eta \( j' \, x' \) = j' - nabla phi \( x \) dot.op x' \, $
  and $eta \( c_0 \) > 0$. Suppose either that this ray is irrational relative to $Lambda$,
    or that its primitive integral generator has value greater than one at $c_0$.
    In both cases there exists $w in Lambda$ with
  #[#set math.equation(numbering: n => "(5.13)")
   $ - eta \( c_0 \) < eta \( w \) < 0 . $ <adj:forbidden-strip>]
  For an integral primitive form of height at least two, take an element of value $- 1$.
    For an irrational ray, the subgroup $eta \( Lambda \) subset bb(R)$ is dense:
    any nondense additive subgroup of $bb(R)$ is discrete, and discreteness here would make a positive multiple of
    $eta$ primitive integral. This proves the assertion in the irrational case as well.
  There are integers $k_nu arrow.r oo$ and lattice points $l_nu in Lambda$ such that
  #[#set math.equation(numbering: n => "(5.14)")
   $ e_nu = l_nu - k_nu y arrow.r 0 . $ <adj:recurrence>]
  This is recurrence of the multiples of $y$ in the compact torus $bb(R)^(N + 1) \/ Lambda$.
    It also follows directly by the pigeonhole principle applied to successively finer finite partitions of a
    lattice fundamental domain. If the resulting return times stay bounded,
    one of them is an exact period and its unbounded multiples give Equation (5.14) instead.
  Now $l_nu + w$ is outside $K$ for large $nu$, since its $eta$-value tends to the negative number $eta \( w \)$.
    In contrast,
  #[#set math.equation(numbering: n => "(5.15)")
   $ l_nu + w + c_0 = k_nu (y + frac(w + c_0 + e_nu, k_nu)) in "int" K $ <adj:inward-recurrence>]
  for large $nu$. To justify this strict inclusion, set $v = w + c_0$, so $eta \( v \) > 0$ by Equation (5.13).
    Differentiability gives, uniformly for $v'$ in a small neighborhood of $v$,
  $ phi \( x + t v'_x \) = phi \( x \) + t nabla phi \( x \) dot.op v'_x + o \( t \) . $
  Thus the $j$-coordinate of $y + t v'$ exceeds $phi \( x + t v'_x \)$ for every sufficiently small positive $t$;
    the exponent coordinates remain positive as well. Apply this with $t = 1 \/ k_nu$ and $v' = v +
    e_nu$ to obtain Equation (5.15). Lemma 25, applied to the lattice point $l_nu + w$,
    would then put this point in $Gamma subset K$, a contradiction.
    Every supporting ray at a differentiability point therefore has a primitive integral form of height one at $c_0$.
  ===== 5.3.2 Only finitely many support forms occur. <only-finitely-many-support-forms-occur.>
  Choose $epsilon.alt > 0$ such that the Euclidean ball of radius $epsilon.alt$ about $c_0$ is contained in $K$.
    If a nonnegative support form has $eta \( c_0 \) = 1$, testing it on this ball gives $parallel eta parallel
    lt.eq 1 \/ epsilon.alt$. Since $Lambda^(*)$ is a lattice,
    only finitely many primitive integral forms satisfy this bound.
    Denote the forms obtained at differentiability points by $eta_1 \, dots.h \, eta_t$.
  These forms, together with the coordinate inequalities, define $K$.
    Indeed, convex functions are differentiable almost everywhere on their open domain.
    At any given positive $x_0$, take differentiability points $x_nu arrow.r x_0$.
    Local Lipschitz continuity bounds their gradients, and therefore
  $ phi \( x_nu \) + nabla phi \( x_nu \) dot.op \( x_0 - x_nu \) arrow.r phi \( x_0 \) . $
  Each expression is the value at $x_0$ of a supporting linear function.
    Hence the supports at these differentiability points recover the epigraph on the positive orthant.
    Since only the finite list above occurs, $K$ and
  $ K' = { \( j \, x \) : x_i gt.eq 0 upright(" for all ") i \, med eta_a \( j \, x \) gt.eq
    0 upright(" for all ") a } $
  agree there. We already have $K subset K'$. Conversely, for $q in K'$, the point $q +
    t c_0$ lies in $K'$ and has positive exponent coordinates whenever $t > 0$.
    It is thus in $K$, and closedness gives $q in K$ on letting $t arrow.b 0$.
    This proves $K = K'$ and rational polyhedrality.
  The coordinate form $\( j \, x \) mapsto x_i$ is primitive on $Lambda$:
    one can prescribe $x = e_i$ and choose $j$ in the requisite congruence class. Its value on $c_0$ is one.
    All other defining forms also have height one. Every facet of the full-dimensional polyhedral cone is cut out
    by a form from an irredundant sublist, so its primitive support has the asserted height.
  ===== 5.3.3 Saturation and the interior translation. <saturation-and-the-interior-translation.>
  If $q in K ∩ Lambda$, then $q + c_0 in "int" K$: translate a small ball about $c_0$ by $q$ and use addition in
    the convex cone. Lemma 25 gives $q in Gamma$, proving the first identity in Equation (5.12).
    If $q in "int" K ∩ Lambda$, each primitive facet form takes a positive integral value on $q$,
    hence a value at least one. Since its value on $c_0$ is one, all facet inequalities hold for $q - c_0$.
    Thus $q - c_0 in K ∩ Lambda = Gamma$. The reverse inclusion $c_0 +
    Gamma subset "int" K ∩ Lambda$ follows from the same ball-translation argument. This proves the second identity.
  Finally, triangulate the rational polyhedral cone into finitely many rational simplicial cones and choose
    lattice generators for their rays. A lattice point in any such cone is a nonnegative integral combination of
    its ray generators plus a lattice point in their bounded half-open parallelepiped.
    There are only finitely many such remainder points. Taking their union over the triangulation proves finite
    generation of $K ∩ Lambda$. If a positive integral multiple of $q in Lambda$ lies in this semigroup,
    then $q in K$ by homogeneity, so $q$ already lies in it; this is saturation.
    The group is $Lambda$ by Proposition 16. ◻
]

== 6 Two filtrations and a second stabilizer <filt:section>

Fix one of the gradings and points furnished by Theorem 26.
  We retain the original degree $j$ and put $n = N + 1$, with $N gt.eq 4$.
  Thus $S = bb(C) \[ C \]$ is a positively graded normal Gorenstein domain, its vertex $o$ is singular,
  and its canonical module has a homogeneous generator of original degree $r$.
  The Taylor semigroup and its lattice satisfy

#[#set math.equation(numbering: n => "(6.1)")
 $ Gamma = K ∩ Lambda \, wide "int" \( K \) ∩ Lambda = c_0 + Gamma \, wide
   c_0 = \( r \, 1 \, dots.h \, 1 \) . $ <filt:semigroup-input>]

Here $K$ is rational polyhedral. We also use the finite Taylor-order bound and the eventual realization of
  compatible jets from Proposition 16. The only volume hypothesis in this section is

#[#set math.equation(numbering: n => "(6.2)")
 $ hat("vol") \( o \, C \) gt.eq 2 N^n . $ <filt:volume-hypothesis>]

The first filtration separates total Taylor order from original degree.
  We then assign positive cost to the constant Taylor direction as well.
  The resulting second graded ring has a nontrivial stabilizer,
  which will supply the same-dimensional slice in Section 7.

=== 6.1 The first associated graded ring <the-first-associated-graded-ring>

For an original-homogeneous section $s in S_j$, let $T \( s \)$ be its total Taylor order at the chosen orbifold
  point, computed in the fixed smooth uniformizing chart and local frame.
  Extend the filtration by direct sums in original degree, and write

$ overline(S) = "gr"_T S . $

Its bidegrees will always mean original degree and $T$-degree, in that order.
  If $tau$ is a bookkeeping variable for original degree, then $overline(S)$ is the subalgebra of
  $bb(C) \[ tau \, z_1 \, dots.h \, z_N \]$ consisting of homogeneous Taylor forms $tau^j
  P \( z \)$ obtained from sections. Each such form satisfies the stabilizer congruence.
  Taking its further monomial initial with the fixed lexicographic refinement gives the algebra $bb(C) \[ Gamma \]$.

The saturated monomial algebra will determine normality and the canonical degree of $overline(S)$.
  A second consequence of saturation is a section whose Taylor form is the constant $tau^m$.
  Inverting that section recovers every compatible Taylor monomial;
  this will determine the Hilbert series of its zero fiber and give a basis for the next filtration.

#thm([Lemma 6.1.])[
  (The Taylor graded ring).  #emph[The algebra $overline(S)$ is finitely generated, normal, Cohen–Macaulay,
    and Gorenstein. Its canonical module has a homogeneous generator of bidegree $\( r \, N \)$.
    There is a section $v in S_m$ whose initial $overline(v)$ is $tau^m$. In particular $T \( v \) = 0$, and
#[#set math.equation(numbering: n => "(6.3)")
 $ overline(S) \[ overline(v)^(- 1) \] tilde.eq
   bb(C) \[ overline(v) \, overline(v)^(- 1) \, u_1 \, dots.h \, u_N \] \, wide T \( u_i \) = 1 \, quad
   T \( overline(v) \) = 0 . $ <filt:laurent-product>]

 The ring $D = overline(S) \/ \( overline(v) \)$ is an equidimensional Cohen–Macaulay Gorenstein ring of dimension
   $N$, with
#[#set math.equation(numbering: n => "(6.4)")
 $ "Hilb"_T D \( z \) = \( 1 - z \)^(- N) \, wide deg omega_D = \( r - m \, N \) . $ <filt:D-series>]

 Its $T$-degree-zero piece is $bb(C)$. A bihomogeneous vector-space basis of $D$ can be lifted to sections $e_i in
   S$ such that, on putting $T_i = T \( e_i \)$,
#[#set math.equation(numbering: n => "(6.5)")
 $ { v^a e_i : a in bb(N) } $ <filt:S-basis>]

 is a vector-space basis of $S$, compatible with original degree and $T$-order.
   The unique vector of this basis with $a + T_i = 0$ is $1$.]
] <filt:first-ring>

#proof[
  We first transfer the structure of the monomial algebra to $overline(S)$.
    By Equation (6.1), $Gamma$ is a finitely generated normal affine semigroup.
    Hochster’s theorem makes $bb(C) \[ Gamma \]$ Cohen–Macaulay,
    and the canonical-module formula for normal affine semigroup rings identifies its canonical module with the
    monomial ideal of interior lattice points; see #cite(label("Hochster72")) and #cite(label("Stanley78"))
    Theorem 6.7 and its following normal-monoid reformulation.
    The second identity in Equation (6.1) makes this ideal principal,
    generated in multidegree $\( r \, 1 \, dots.h \, 1 \)$. Thus its bidegree is $\( r \, N \)$.
    The interior-translation identity, rather than saturation alone, is essential here.
  Choose a finite set of generators of $Gamma$ and bihomogeneous lifts in $overline(S)$ of their monomials.
    We lift generation by degreewise subduction, in the terminology of Khovanskii bases
    #cite(label("KavehManon2019")) Algorithm 2.11 and Proposition 2.13.
    Subtracting products of the lifts cancels any selected initial monomial.
    Within a fixed original degree there are only finitely many Taylor orders,
    and within each order only finitely many monomials. Consequently this subtraction terminates and the chosen
    lifts generate $overline(S)$.
  The same finite list gives a one-parameter flat monomial degeneration.
    Choose positive integral costs on the $z_i$ that preserve the selected monomial initial of every one of these
    finitely many lifts. Such costs exist by approximating the specified lexicographic refinement on this finite
    list. The scalar initial algebra contains $bb(C) \[ Gamma \]$.
    In each original bidegree its dimension is the dimension of $overline(S)$ in that bidegree,
    which is also the number of the corresponding points of $Gamma$.
    The inclusion is therefore an equality in every bidegree.
    Lifting the generators again, with the same degreewise terminating subtraction,
    shows that the extended Rees algebra for this scalar filtration is finite type.
    As a subalgebra of a Laurent-polynomial extension it is torsion-free, hence flat, over its parameter line.
    Its zero fiber is $bb(C) \[ Gamma \]$ and its nonzero fibers are $overline(S)$.
  Write $R$ for this extended Rees algebra and $lambda$ for its parameter.
    It retains original degree and $T$-degree, and has the additional scalar filtration grading,
    with scalar weight $- 1$ on $lambda$. A sufficiently large multiple of original degree minus scalar weight
    gives a positive grading on $R$, including positive degree for $lambda$.
    At its vertex, the local ring $A$ has a normal Gorenstein quotient $A \/ \( lambda \)$.
    Lifting through the nonzerodivisor $lambda$ makes $A$ Cohen–Macaulay and Gorenstein;
    for the latter equivalence see #cite(label("StacksProject")) Tag 0BJJ.
  The local ring $A$ is also normal. Here is a direct verification using $R_1 + S_2$.
    It is already Cohen–Macaulay. Let $P$ be a height-one prime of $A$.
    If $lambda in P$, reducedness of $A \/ \( lambda \)$ makes $A_P \/ \( lambda \)$ a field, so $A_P$ is regular.
    Otherwise choose $Q$ minimal over $\( P \, lambda \)$. Since $A$ is a local domain essentially of finite type
    over $bb(C)$, the dimension formula and the principal ideal theorem give $"ht" Q lt.eq 2$.
    The normal ring $A_Q \/ \( lambda \)$ has dimension at most one and is regular.
    Lifting a regular system of parameters together with $lambda$ shows that $A_Q$ is regular,
    and then so is its localization $A_P$.
  The normal and Gorenstein loci of $"Spec" R$ are open, contain its vertex,
    and are invariant under the positive grading action. Every orbit contracts to that vertex;
    hence $R$ is normal and Gorenstein everywhere. Its generic fiber, a localization of $R$,
    is $overline(S) ⊗_(bb(C)) bb(C) \( lambda \)$ and is normal.
    Normality descends under this faithfully flat field extension, proving normality of $overline(S)$.
    Quotienting $R$ by $lambda - 1$ proves the Cohen–Macaulay and Gorenstein assertions for $overline(S)$ as well.
  Adjunction tracks the canonical bidegree. The parameter $lambda$ has original degree and $T$-degree both zero,
    so it contributes no shift in these two degrees. Choose a lift of the central canonical generator homogeneous
    also for the scalar grading, with its adjunction shift. Its cokernel in the canonical module of $R$ is equal
    to its product by $lambda$. Graded Nakayama for the positive combined grading therefore makes the cokernel
    zero. Restriction to $lambda = 1$ forgets the scalar grading but preserves original degree and $T$-degree.
    Thus the canonical generator of $overline(S)$ has bidegree $\( r \, N \)$.
  We next use the constant Taylor direction to describe $overline(S)$ over a polynomial parameter.
    The vector $\( m \, 0 \)$ lies on the constant ray of $K$ and belongs to $Lambda$.
    Equation (6.1) provides a section with this leading index. Rescale its value to obtain $overline(v) = tau^m$.
    Choose integer representatives $b_i$ of the stabilizer characters.
    Eventual compatible jet separation shows that, after inverting $tau^m$, every monomial $tau^j z^gamma$ with
  $ j - sum_i b_i gamma_i in m bb(Z) $
  occurs. Set $u_i = tau^(b_i) z_i$ in that localization. The displayed congruence expresses each allowed monomial
    uniquely as a Laurent power of $overline(v)$ times a monomial in the $u_i$.
    This proves Equation (6.3), including its $T$-grading. It also shows directly that there is no residual finite
    quotient in a nonzero $overline(v)$ fiber.
  For each $q gt.eq 0$, consider the $T$-degree-$q$ piece of $overline(S)$ as a module over
    $bb(C) \[ overline(v) \]$. It is torsion-free. It is also finite:
    in each original-degree residue class modulo $m$, multiplication by $overline(v)$ identifies its pieces with
    an increasing sequence of subspaces of the finite-dimensional space of compatible degree-$q$ Taylor forms.
    These subspaces are eventually the full compatible space by jet separation.
    Thus there are only finitely many necessary module generators.
    This module is consequently free over the principal ideal domain $bb(C) \[ overline(v) \]$.
    Equation (6.3) shows that its rank is
  $ binom(q + N - 1, N - 1) . $
  Reduction modulo $overline(v)$ consequently has exactly this dimension in $T$-degree $q$,
    proving the Hilbert series in Equation (6.4).
  Since $overline(v)$ is a nonzerodivisor in the normal Cohen–Macaulay domain $overline(S)$,
    its quotient is equidimensional of dimension $N$ and Cohen–Macaulay.
    Adjunction makes the quotient Gorenstein and subtracts $\( m \, 0 \)$ from the canonical degree.
    The Hilbert series shows that the $T$-degree-zero piece of $D$ is $bb(C)$.
  It remains to obtain a basis of $S$ compatible with the filtration.
    Lift a bihomogeneous basis of $D$ to $overline(S)$. These lifts are a $bb(C) \[ overline(v) \]$-basis:
    generation follows by subtracting modulo $overline(v)$ and descending in original degree,
    and independence follows by reducing a putative relation modulo $overline(v)$ and successively removing its
    smallest power. Now lift them through the $T$-filtration to original-homogeneous sections $e_i$ of the
    indicated orders $T_i$. Their products with powers of $v$ have the just-constructed basis as initials.
    Terminating cancellation in original degree proves Equation (6.5).
    Choose $e_i = 1$ for the sole basis vector of $T$-degree zero; all other $T_i$ are positive. ◻
]

=== 6.2 Canonical forms on extended Rees spaces <canonical-forms-on-extended-rees-spaces>

We make the discrepancy comparison used for both filtrations explicit.
  If $F$ is a nonnegative decreasing multiplicative integral filtration on $S$, set $F_p S = S$ for $p lt.eq
  0$ and use the extended Rees convention

#[#set math.equation(numbering: n => "(6.6)")
 $ R_F = sum_(p in bb(Z)) lambda^(- p) F_p S subset S \[ lambda \, lambda^(- 1) \] . $ <filt:rees-convention>]

The filtration action has weight zero on $S$ and weight $- 1$ on $lambda$.
  In particular, $R_F \/ \( lambda \) = "gr"_F S$ and $R_F \[ lambda^(- 1) \] = S \[ lambda \, lambda^(- 1) \]$.
  The inclusion $S \[ lambda \] subset R_F$ gives a birational morphism $"Spec" R_F arrow.r C times bb(A)^1$.

#thm([Lemma 6.2.])[
  (Rees discrepancy comparison).  #emph[Suppose $F$ respects original degree,
    has finite length in each original homogeneous piece, and $"gr"_F S$ is finitely generated.
    Suppose also that $frak(X) = "Spec" R_F$ is normal and Gorenstein,
    and that $"gr"_F S$ is Cohen–Macaulay and Gorenstein with a canonical generator of bidegree $\( r \, Q \)$.
    Then $R_F$ is finite type and its absolute canonical module has a homogeneous generator of bidegree
    $\( r \, Q - 1 \)$, which on $lambda eq.not 0$ is
#[#set math.equation(numbering: n => "(6.7)")
 $ Omega_(frak(X)) = c lambda^(- Q) Omega_C and d lambda \, wide c in bb(C)^(*) . $ <filt:canonical-form>]

 For a quasi-monomial valuation $V$ centered on $frak(X)$ over $lambda = 0$, put $ell =
   V \( lambda \) > 0$ and $w = V \|_(bb(C) \( C \))$. If $w$ is centered at $o$, then
#[#set math.equation(numbering: n => "(6.8)")
 $ A_C \( w \) lt.eq A_(frak(X)) \( V \) + \( Q - 1 \) ell . $ <filt:discrepancy-inequality>]

 The same inequality holds whenever the discrepancies involved are finite and defined by valuation retractions.]
] <filt:discrepancy>

#proof[
  Lift homogeneous generators of $"gr"_F S$ to $s_i in S$, of filtration orders $p_i$.
    Cancellation of initial forms, terminating within each original degree,
    shows that $R_F$ is generated by $lambda$ and $lambda^(- p_i) s_i$.
    Indeed, an element of $F_p S$ has an expression as a sum of monomials in the $s_i$ whose filtration orders are
    at least $p$; multiplication by $lambda^(- p)$ then introduces only nonnegative extra powers of $lambda$.
    Taking a sufficiently large multiple of original degree minus filtration degree makes every one of these
    generators positive, with $deg lambda = 1$.
  Cartier adjunction #cite(label("StacksProject")) Tag 0B4A for the nonzerodivisor $lambda$ identifies the
    reduction of the canonical module of $R_F$ with that of $"gr"_F S$, with the shift coming from $d lambda$.
    Since $lambda$ has filtration weight $- 1$, a lift of the specified central generator has bidegree
    $\( r \, Q - 1 \)$. This lift generates the whole canonical module:
    its cokernel is equal to its product by $lambda$, and a finite module bounded below in the positive combined
    grading cannot have that property unless it is zero. As the canonical module is torsion-free of rank one over
    the domain $R_F$, the resulting generator is free.
  On $lambda eq.not 0$, both this generator and $Omega_C and d lambda$ generate the same canonical module.
    Their ratio is a unit of $S \[ lambda \, lambda^(- 1) \]$.
    The units of the positively graded domain $S$ are the nonzero constants, so such a unit is $c lambda^a$.
    The filtration weight of $Omega_C and d lambda$ is $- 1$, and the weight of the lifted generator is $Q - 1$.
    It follows that $a = - Q$, proving Equation (6.7). Computing on a common smooth birational model gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ A_(C times bb(A)^1) \( V \) = A_(frak(X)) \( V \) + Q ell . $ <filt:discrepancy-product>]
  This computation uses rational top forms and does not require the Rees morphism itself to be proper.
  On the other hand,
  #[#set math.equation(numbering: n => "(6.10)")
   $ A_(C times bb(A)^1) \( V \) gt.eq A_C \( w \) + ell . $ <filt:product-lower>]
  To see this directly, take any smooth proper birational log model of $C$ used to retract $w$,
    and take its product with the parameter line. Include $lambda = 0$ among the simple-normal-crossing divisors.
    The monomial retraction of $V$ on this product has discrepancy equal to the discrepancy of the corresponding
    retraction of $w$ plus $ell$. Log discrepancy dominates its value on each such retraction #cite(label("JM12"))
    Corollary 5.4 and Remark 5.6; taking the supremum over the models of $C$ proves Equation (6.10).
    Combining it with Equation (6.9) proves the lemma. ◻
]

=== 6.3 Reducedness and the second filtration <reducedness-and-the-second-filtration>

#thm([Lemma 6.3.])[
  (Reducedness of the quotient).  #emph[Under Equation (6.2), $D$ is reduced.]
] <filt:reduced>

#proof[
  The $T$-Rees algebra is finite type by Lemma 27 and the generator-lifting argument in Lemma 28.
    Its nonzero fibers are $S$, and its central fiber $overline(S)$ is normal, Cohen–Macaulay, and Gorenstein.
    The regular parameter and these fiber properties imply that the total space is Cohen–Macaulay and Gorenstein.
    It is normal as well: away from the central fiber it is $C times bb(G)_m$,
    and at every codimension-one point of the central fiber the quotient by $lambda$ is a field.
    Thus it is regular in codimension one and satisfies Serre’s condition $S_2$.
  Let $H$ be an irreducible component of the divisor $overline(v) = 0$ in $"Spec" overline(S)$, and write $nu =
    "ord"_H \( overline(v) \) gt.eq 1$. At its generic point the normal central fiber is a discrete valuation
    ring. The total space is therefore regular there, of local dimension two,
    with parameters $lambda$ and a lift $t$ of a central uniformizer. In this local ring
  $ v = a t^nu + lambda b $
  for a unit $a$ and a regular element $b$. Take the monomial valuation with costs $V \( lambda \) =
    1$ and $V \( t \) = 1 \/ nu$. Its discrepancy on the total space is $1 + 1 \/ nu$.
    For its restriction $w$ to $bb(C) \( C \)$ one has
  $ w \( v \) gt.eq 1 \, wide w \( e_i \) gt.eq T_i \, $
  because $lambda^(- T_i) e_i$ is regular on the Rees space. Hence $w \( v^a e_i \) gt.eq a + T_i$.
  By Lemma 27, every nonconstant original-homogeneous basis vector has a strictly positive lower bound $a + T_i$.
    Thus $w$ is centered exactly at $o$. The series counting the basis with these costs is
  $ sum_(a \, i) z^(a + T_i) = \( 1 - z \)^(- 1) "Hilb"_T D \( z \) = \( 1 - z \)^(- n) . $
  The vectors of cost below $k$ consequently number $k^n \/ n ! + O \( k^(n - 1) \)$.
    They span the valuation quotient, so
  #[#set math.equation(numbering: n => "(6.11)")
   $ "vol" \( w \) lt.eq 1 . $ <filt:first-volume>]
  These finite-colength quotients of $S$ are supported at $o$;
    their lengths agree with those after localization at the vertex.
  Apply Lemma 28 with $Q = N$ and $ell = 1$. It gives
  $ A_C \( w \) lt.eq N + 1 \/ nu . $
  If $nu gt.eq 2$, Equation (6.11) yields
  $ hat("vol") \( o \, C \) lt.eq \( N + 1 \/ 2 \)^(N + 1) < 2 N^(N + 1) . $
  For the strict inequality, use
  $ \( N + 1 \) log (1 + frac(1, 2 N)) < frac(N + 1, 2 N) lt.eq 5 / 8 < log 2 \, wide N gt.eq 4 . $
  This contradicts Equation (6.2). All the multiplicities of $overline(v)$ are therefore one.
    Its quotient $D$ is generically reduced, and it is Cohen–Macaulay, hence satisfies $S_1$.
    The reducedness criterion $R_0 + S_1$ proves the assertion; see #cite(label("StacksProject")) Tag 033P. ◻
]

Define a second filtration by assigning the basis in Equation (6.5) the costs

#[#set math.equation(numbering: n => "(6.12)")
 $ W \( v^a e_i \) = a + T_i $ <filt:W-definition>]

and taking spans of basis vectors of cost at least the indicated level.
  Unlike $T$, this filtration is positive on every nonconstant original-homogeneous vector.

There is also a description independent of the lifted basis.
  Write $T_q S = { s : T \( s \) gt.eq q }$, with $T_q S = S$ for $q lt.eq 0$.
  For the distinguished section $v$ fixed above, one has

#[#set math.equation(numbering: n => "(6.13)")
 $ W_p S = sum_(a = 0)^p v^a T_(p - a) S wide \( p gt.eq 0 \) . $ <filt:W-intrinsic>]

Indeed, every basis term $v^b e_i$ on the right has $b + T_i gt.eq p$.
  Conversely, for such a term choose $a = min { p \, b }$; then $v^(b - a) e_i in T_(p - a) S$.
  Thus changing the compatible lifts $e_i$ does not change $W$.
  The multiplicativity of $T$ also makes the right side of Equation (6.13) multiplicative.
  The remaining point is to identify the associated graded algebra, not merely its Hilbert function.

#thm([Proposition 6.4.])[
  (The two-filtration structure).  #emph[The filtration $W$ is multiplicative, with
#[#set math.equation(numbering: n => "(6.14)")
 $ G = "gr"_W S tilde.eq D \[ mono(v) \] \, wide deg_W mono(v) = 1 \, wide deg_W \|_D = T . $ <filt:second-graded>]

 Here $mono(v)$ is a regular polynomial variable of original degree $m$. Moreover
#[#set math.equation(numbering: n => "(6.15)")
 $ "Hilb"_W G \( z \) = \( 1 - z \)^(- n) \, wide deg omega_G = \( r \, n \) . $ <filt:G-series>]

 The $W$-Rees space is a finite-type normal Gorenstein variety.
   Its canonical generator has bidegree $\( r \, n - 1 \)$ and, on $lambda eq.not 0$,
   is $c lambda^(- n) Omega_C and d lambda$.]
] <filt:structure>

#proof[
  Expand a product $e_i e_j$ in the basis $v^a e_k$. Compatibility of that basis with total Taylor initials shows
    that every nonzero term has $T_k gt.eq T_i + T_j$. Its $W$-cost $a + T_k$ is therefore at least $T_i + T_j$.
    Terms with equality have precisely $a = 0$ and $T_k = T_i + T_j$;
    their images are the product of the images of $e_i \, e_j$ in $D = overline(S) \/ \( overline(v) \)$.
    Factoring out the displayed powers of $v$ proves multiplicativity and the algebra isomorphism in
    Equation (6.14). In particular the variable $mono(v)$ is regular even if $D$ has several components.
  The Hilbert series follows from Equation (6.4). Adjoining the polynomial variable of bidegree $\( m \, 1 \)$
    changes the canonical degree $\( r - m \, N \)$ to $\( r \, n \)$.
    Thus $G$ is reduced, Cohen–Macaulay, and Gorenstein. The $W$-filtration has finite length in fixed original
    degree, as is clear from its basis description; lifting finitely many generators of $G$ proves finite
    generation of its Rees algebra.
  The nonzero fibers of this Rees family are $S$, and its central fiber is $G$.
    Consequently the total space is Cohen–Macaulay and Gorenstein.
    For normality, away from $lambda = 0$ it is $C times bb(G)_m$.
    A codimension-one point on $lambda = 0$ is the generic point of a central component.
    Since $G$ is reduced, its local ring there is a field, and the total local ring has maximal ideal generated by
    the nonzerodivisor $lambda$. It is regular. The total space satisfies $R_1$ and $S_2$, hence is normal.
    Notice that normality of $D$ or of $G$ is not required in this argument.
    Finally Lemma 28, with $Q = n$, gives the canonical generator and top-form identity. ◻
]

===== 6.3.1 Example: the quadratic cone. <example-the-quadratic-cone.>

The two stabilizers and filtrations can already differ for an ordinary double point. Let

$ S = bb(C) \[ a \, z_1 \, dots.h \, z_N \, b \] \/ \( a b - q \( z \) \) \, wide q \( z \) = sum_(i = 1)^N z_i^2 \, $

with all original degrees equal to one. Here $r = N$ and $m = 1$.
  At the quotient point $\[ a : z : b \] = \[ 1 : 0 : 0 \]$, the chart $a = 1$ has $b = q \( z \)$.
  Taking $v = a$, the three degrees are

$ & a & z_i & b\
upright("original degree") & 1 & 1 & 1\
T & 0 & 1 & 2\
W & 1 & 1 & 2\ $

The first Taylor graded ring has the same presentation as $S$, and $D =
  bb(C) \[ z_1 \, dots.h \, z_N \, b \] \/ \( q \( z \) \)$.
  The family $"Spec" overline(S) arrow.r bb(A)_t^1$ defined by $t = overline(v) =
  a$ has invariant parameter for the $T$-action. After inverting $t$, $b =
  q \( z \) \/ a$ gives the polynomial family of Equation (6.3).
  With $sans(a) = lambda^(- 1) a$, $sans(z)_i = lambda^(- 1) z_i$, and $sans(b) = lambda^(- 2) b$,
  the second Rees space is

$ frak(X) = { lambda sans(a) sans(b) - q \( sans(z) \) = 0 } . $

Its action has weights $\( - 1 \, 1 \, 1 \, 2 \)$ on $\( lambda \, sans(a) \, sans(z)_i \, sans(b) \)$.
  The central point with $sans(b) = 1$ and all other coordinates zero therefore has stabilizer $h = 2$.
  Its transverse slice

$ Y = { sans(b) = 1 } = { lambda sans(a) - q \( sans(z) \) = 0 } $

is again an ordinary double point of dimension $n = N + 1$.
  Thus the original stabilizer $m = 1$ and the new stabilizer $h = 2$ play different roles,
  and taking this slice preserves the original dimension.

=== 6.4 A nontrivial stabilizer on the new central ring <a-nontrivial-stabilizer-on-the-new-central-ring>

#thm([Lemma 6.5.])[
  (Free gradings and polynomial rings).  #emph[Let $E$ be a finitely generated positively graded reduced
    equidimensional Cohen–Macaulay $bb(C)$-algebra of dimension $N gt.eq 2$, with $E_0 =
    bb(C)$ and $"Hilb" E \( z \) = \( 1 - z \)^(- N)$. If the grading action has trivial stabilizer at every
    nonvertex closed point of $"Spec" E$, then $E$ is a polynomial ring on $N$ generators of degree one.]
] <filt:free-grading>

#proof[
  We first justify that weight one defines an honest line bundle on $Z = "Proj" E$.
    Choose positive homogeneous algebra generators $a_j$, with degrees $w_j$.
    At a nonvertex closed point $q$, its grading stabilizer is
  $ mu_(gcd { w_j : a_j \( q \) eq.not 0 }) . $
  By hypothesis this gcd is one. Invert the product $f$ of those active generators.
    Bézout’s identity supplies integers $c_j$ with $sum_j c_j w_j = 1$, so $u =
    product_j a_j^(c_j)$ is an invertible homogeneous element of degree one in $E_f$. Consequently
  #[#set math.equation(numbering: n => "(6.16)")
   $ E_f = \( E_f \)_0 \[ u \, u^(- 1) \] . $ <filt:torsor-chart>]
  These open sets cover the puncture: they contain all its closed points,
    and a finite-type scheme over $bb(C)$ is Jacobson. Their degree-zero charts cover $Z$.
    Equation (6.16) gives a Zariski $bb(G)_m$-torsor over $Z$, and makes $L_Z = cal(O)_Z \( 1 \)$ invertible,
    with $cal(O)_Z \( k \) = L_Z^(⊗ k)$. A positive power of this line bundle is ample by the construction of
    $"Proj"$, so $L_Z$ is ample.
  The same charts show that $Z$ is reduced, equidimensional, and Cohen–Macaulay, of dimension $N - 1$.
    The Hilbert leading coefficient gives $L_Z^(N - 1) = 1$. Each irreducible projective component has a positive
    integral degree for this actual ample line bundle. There is therefore only one component,
    and reducedness makes $Z$ integral. The image $V_0$ of $E_1$ in $H^0 \( Z \, L_Z \)$ has dimension $N$:
    restriction is injective, since a nonzero homogeneous element in a reduced positive-dimensional
    equidimensional ring cannot vanish on its whole puncture.
  We construct successive Cartier sections while tracking the images of $V_0$,
    not assuming surjectivity onto full spaces of sections. Suppose $Z_i$ is a positive-dimensional integral
    projective Cohen–Macaulay scheme obtained after $i$ cuts,
    and that the image $V_i$ of $V_0$ on it has dimension $N - i$. Choose a nonzero section $s_i in V_i$.
    Its zero scheme $Z_(i + 1)$ is an effective Cartier divisor.
    It is nonempty, because $L_Z \|_(Z_i)$ is ample of positive degree, and it is pure and Cohen–Macaulay.
    Its degree is again one. The component-degree formula forces a single component of generic multiplicity one;
    the $S_1$ property then makes this divisor reduced, hence integral.
    The kernel of restriction $V_i arrow.r H^0 \( Z_(i + 1) \, L_Z \|_(Z_(i + 1)) \)$ is exactly $bb(C) s_i$:
    division by $s_i$ identifies that kernel with regular global functions on the proper integral scheme $Z_i$,
    and those functions are constant. Thus $dim V_(i + 1) = N - i - 1$.
  After $N - 1$ cuts, the resulting scheme is a single reduced point and the remaining image space has dimension
    one. Choose a final section nonzero at that point. Lifting all these sections to $E_1$ gives $N$ elements
    whose common zero on $"Proj" E$ is empty. Their ideal is therefore irrelevant-primary and they form a
    homogeneous system of parameters. Cohen–Macaulayness makes the sequence regular. The quotient has Hilbert series
  $ \( 1 - z \)^N "Hilb" E \( z \) = 1 . $
  It is $bb(C)$, so induction on degree, or graded Nakayama, shows that these $N$ linear elements generate $E$.
    The resulting surjection from a polynomial ring on $N$ degree-one variables is an isomorphism by the same
    Hilbert series. ◻
]

#thm([Corollary 6.6.])[
  (A nontrivial second stabilizer).  #emph[There is a nonvertex closed point of $"Spec"
    D$ whose $T$-grading stabilizer has order $h gt.eq 2$.]
] <filt:stabilizer>

#proof[
  Otherwise Lemma 31 would make $D$ a polynomial ring on $N$ degree-one generators,
    and Proposition 30 would make $G$ a polynomial ring on $n = N + 1$ generators.
    Choose these generators homogeneous also for original degree and lift them to $S$.
    Terminating cancellation in the $W$-filtration shows that the lifts generate $S$.
    A surjection from a polynomial ring on $n$ variables to the $n$-dimensional domain $S$ has zero kernel.
    Thus $C$ would be smooth, contrary to our standing hypothesis.
    Stabilizers at nonvertex points of a positive grading are finite, so the asserted order $h gt.eq 2$ exists. ◻
]

== 7 The slice estimate and the supremum bootstrap <boot:section>

Throughout this section, $n = N + 1 gt.eq 5$, and the local theorem is assumed in dimensions smaller than $n$.
  Recall that $p_n = 2 \( N \/ n \)^n$ and that $M_n$ is the supremum of $d \( x \, X \)$ over all singular
  boundary-zero klt germs of dimension $n$. The smooth-value upper bound gives $M_n lt.eq 1$;
  no bound by $p_n$ is assumed. We first work with a fixed singular cone $o in C =
  "Spec" S$ obtained from Proposition 7, such that $d \( o \, C \) gt.eq p_n$.
  Its minimizing Reeb vector $xi$ is normalized by $A_C \( "wt"_xi \) = n$.

Choose a sufficiently fast grading from Lemma 8 in the large-stabilizer range, and take $m = m_max gt.eq r \/ N$.
  All constructions in Proposition 30 then apply. We shall use, in particular,

#[#set math.equation(numbering: n => "(7.1)")
 $ macron(S) = "gr"_T S \, wide D = macron(S) \/ \( macron(v) \) \, wide G = "gr"_W S = D \[ mono(v) \] \, wide
   "Hilb"_G \( z \) = \( 1 - z \)^(- n) . $ <boot:algebra-data>]

Here $W \( mono(v) \) = 1$, $W \|_D = T$, and $D$ has a positive $T$-grading.
  The Rees total space $frak(X) = "Spec" "Rees"_W S$ is normal and Gorenstein.
  Its parameter $lambda$ has action weight $- 1$, and the action is trivial on $S$.
  The central ring $G$ has canonical filtration shift $n$. We also use the family $"Spec" macron(S) arrow.r
  bb(A)_t^1$ defined by $t = macron(v)$, whose parameter has $T$-degree zero.
  Away from $t = 0$ it has the graded description

#[#set math.equation(numbering: n => "(7.2)")
 $ macron(S) \[ macron(v)^(- 1) \] tilde.eq bb(C) \[ macron(v) \, macron(v)^(- 1) \] \[ u_1 \, dots.h \, u_N \] \,
   wide T \( macron(v) \) = 0 \, quad T \( u_i \) = 1 . $ <boot:polynomial-family>]

The equivariance in Equation (7.2) will be essential below.

=== 7.1 A slice through a point with nontrivial stabilizer <a-slice-through-a-point-with-nontrivial-stabilizer>

By Corollary 32, there is a nonvertex closed point $y_D in "Spec" D$ whose $T$-grading stabilizer is $mu_h$,
  with $h gt.eq 2$. Set $y = \( y_D \, 0 \) in "Spec" D \[ mono(v) \]$,
  considered as a point of the central fiber of $frak(X)$. Its stabilizer for the Rees action is the same $mu_h$.

#thm([Lemma 7.1.])[
  (The uniformizing slice and its tests).  #emph[There is a normal Gorenstein algebraic germ $y in
    Y$ of dimension $n$, preserved by $mu_h$, with a nonzero function $lambda_Y in
    frak(m)_(Y \, y)$ of character $- 1$, such that $Y$ is klt away from $lambda_Y = 0$.
    Every quasi-monomial valuation $u$ centered at $y$ gives a quasi-monomial valuation $w$ centered at $o in C$.
    Writing $ell = u \( lambda_Y \) > 0$, one has
#[#set math.equation(numbering: n => "(7.3)")
 $ A_C \( w \) lt.eq N ell + A_Y \( u \) \, wide "vol" \( w \) lt.eq ell^(- n) . $ <boot:basic-test>]

 The comparison is valid before klt at $y$ has been established.]
] <boot:slice-tests>

#proof[
  Choose a positive-$W$-degree homogeneous function $f$ on $frak(X)$ with $f \( y \) eq.not 0$.
    Such a function exists because $y_D$ is not the vertex of the positively graded ring $D$;
    lift a nonvanishing homogeneous function from the central fiber.
    Write $d = W \( f \) > 0$ and $c = f \( y \)$. On the open set $U = { f eq.not 0 } subset frak(X)$,
    take the level slice $Y_0 = { f = c }$. The action map
  $ theta : Y_0 times bb(G)_m arrow.r U \, wide \( q \, a \) mapsto a dot.op q \, $
  is finite étale: it is the cover obtained by adjoining a root $a^d = f \/ c$ of an invertible function.
    We take the germ of $Y_0$ at $y$ and denote it by $Y$. Normality and the Gorenstein property descend from the
    étale product description, and $dim Y = dim frak(X) - 1 = n$.
    The subgroup $mu_h$ fixes $y$ and preserves the level slice, since $h$ divides $d$.
  The restriction $lambda_Y$ of $lambda$ has character $- 1$. It is a nonzero divisor on $Y$:
    its pullback to $Y times bb(G)_m$ differs from the pullback of $lambda$ only by the invertible group character
    $a^(- 1)$. It vanishes at $y$. Since $frak(X)_(lambda eq.not 0) tilde.eq C times bb(G)_m$ is klt,
    the étale product description also shows that $Y$ is klt away from $lambda_Y = 0$.
  We record the function-field relation to $C$. In $K \( C \) \( lambda \)$ the action fixes $K \( C \)$ and gives
    $lambda$ weight $- 1$, so
  $ f = lambda^(- d) s quad upright("for some ") s in S \, wide lambda_Y^d = s \/ c quad upright("on ") Y . $
  After inverting $lambda_Y$, each component of the slice is finite over the open set ${ s eq.not 0 } subset C$.
    It dominates this open set: the equation is monic in $lambda_Y$,
    and the resulting finite algebra is flat over $S \[ s^(- 1) \]$.
    Moreover $lambda_Y$ does not vanish identically on any component through $y$.
    Thus $K \( Y \)$ is a finite extension of $K \( C \)$, and $S$ injects into $K \( Y \)$.
  Extend $u$ to $K \( Y \) \( a \)$ by the Gauss rule with $a$ of value zero and residue transcendental over the
    residue field of $u$. This is the extension trivial on the group factor.
    Denote by $V$ its restriction through $theta$ to $K \( frak(X) \)$.
    Its center is the generic point of the orbit through $y$, and
  #[#set math.equation(numbering: n => "(7.4)")
   $ A_(frak(X)) \( V \) = A_Y \( u \) \, wide V \( lambda \) = ell . $ <boot:etale-discrepancy>]
  Indeed, on the product a log smooth model defining $u$ may simply be multiplied by $bb(G)_m$;
    the group parameter contributes no discrepancy. Pulling back log smooth models by the finite étale chart
    preserves the canonical divisor and discrepancy in the restricted-value scaling.
    These assertions do not require $u$ to be $mu_h$-invariant.
  Let $w = V \|_(K \( C \))$. Since elements of $S$ are invariant under the Rees action,
    their pullbacks to $Y times bb(G)_m$ are independent of $a$, and
  #[#set math.equation(numbering: n => "(7.5)")
   $ w \( s' \) = u \( s' \|_Y \) wide \( s' in S \) . $ <boot:restriction-values>]
  Equivalently, $w$ is the restriction of $u$ along the finite extension $K \( Y \) \/ K \( C \)$.
    The Abhyankar equality is preserved by finite extension and restriction,
    so $w$ is quasi-monomial #cite(label("JM12")) Proposition 3.7.
  Write $F^p S = { W gt.eq p }$ for the second filtration. If $s' in F^p S$,
    the Rees function $lambda^(- p) s'$ is regular on $frak(X)$, hence its restriction is regular at $y$. Therefore
  #[#set math.equation(numbering: n => "(7.6)")
   $ w \( s' \) gt.eq p ell . $ <boot:filtration-domination>]
  Since $F^1 S$ is the vertex maximal ideal, this proves that $w$ is centered exactly at $o$.
    Applying Lemma 28 with canonical shift $Q = n$, and then Equation (7.4),
    gives the discrepancy inequality in Equation (7.3).
  Finally, Equation (7.1) implies
  #[#set math.equation(numbering: n => "(7.7)")
   $ dim_(bb(C)) S \/ F^p S = frac(p^n, n !) + O \( p^(n - 1) \) . $ <boot:hilbert-cutoff>]
  For $p = ceil.l k \/ ell ceil.r$, Equation (7.6) gives $F^p S subset.eq frak(a)_k \( w \)$.
    The valuation ideal has support only at $o$, so its colength is the same before and after localizing $S$ at
    the vertex. Taking leading coefficients in Equation (7.7) proves $"vol" \( w \) lt.eq ell^(- n)$. ◻
]

#thm([Lemma 7.2.])[
  (The slice is klt).  #emph[The germ $y in Y$ is klt.]
] <boot:slice-klt>

#proof[
  If it were not klt, there would be a prime divisor $E$ on a log resolution of $Y$ with $A_Y \( E \) lt.eq
    0$ and center containing $y$. By Lemma 33, its center is contained in $lambda_Y = 0$, so $a =
    "ord"_E \( lambda_Y \) > 0$. Choose a log resolution also resolving this function and the ideal of $y$,
    and choose a closed point $q$ of $E$ over $y$. In local regular parameters at $q$,
    give a parameter defining $E$ cost $1$ and the other parameters positive costs tending to zero.
    The resulting quasi-monomial valuations $u_epsilon$, centered exactly at $y$, satisfy
  $ A_Y \( u_epsilon \) = A_Y \( E \) + O \( epsilon \) \, wide ell_epsilon = u_epsilon \( lambda_Y \) = a +
    O \( epsilon \) . $
  Their restrictions $w_epsilon$ are centered at $o$. Since $C$ is klt, $A_C \( w_epsilon \) > 0$;
    hence Equation (7.3) either already gives a contradiction through a nonpositive upper bound for this
    discrepancy, or gives
  $ 2 N^n lt.eq hat("vol") \( o \, C \) lt.eq A_C \( w_epsilon \)^n "vol" \( w_epsilon \) lt.eq
    (N + frac(A_Y \( u_epsilon \), ell_epsilon))^n . $
  The quantity inside the last power is positive whenever this chain is applicable,
    and its limit superior is at most $N$. Letting $epsilon$ tend to zero contradicts $2 N^n > N^n$. ◻
]

#thm([Lemma 7.3.])[
  (Singularity of the slice).  #emph[The germ $y in Y$ is singular.]
] <boot:slice-singular>

#proof[
  Suppose that $Y$ were smooth at $y$. The étale product chart then implies that $frak(X)$ is smooth at the
    corresponding point. In its regular local ring, $lambda$ is an eigenfunction of character $- 1$ for $mu_h$.
    Lift the product parameter $mono(v) in G = D \[ mono(v) \]$ equivariantly to a function $tilde(v)$ of
    character $1$. Its differential is nonzero: the class of $mono(v)$ is nonzero in the cotangent space of
    $"Spec" G$ at $\( y_D \, 0 \)$, which is a quotient of the cotangent space of $frak(X)$.
  Consequently $H = { tilde(v) = 0 } subset frak(X)$ is smooth at $y$,
    and the germ of $"Spec" D$ at $y_D$ is the hypersurface cut out in $H$ by $lambda \|_H$.
    This is a nonzero equation: $lambda$ and $tilde(v)$ form a regular sequence because $mono(v)$ is regular in
    $G$. If $lambda \|_H$ has a nonzero linear part, $D$ is smooth at $y_D$.
    Otherwise it is a minimal hypersurface equation whose character is $- 1 med \( mod med h \)$,
    and this character is nontrivial.
  We now use the other deformation $macron(S)$ over $t = macron(v)$.
    Its special fiber is $D$, and $t$ is invariant under the $T$-action and therefore under $mu_h$.
    Complete its local ring at the point $y_D$ of the special fiber.
    The completion is flat over $bb(C) \[ \[ t \] \]$. Choose a minimal system of eigen-coordinates of the
    completed local ring of $D$ and lift them equivariantly. Complete Nakayama gives a surjection
  $ P = bb(C) \[ \[ t \, x_1 \, dots.h \, x_e \] \] arrow.r hat(cal(O))_("Spec" macron(S) \, y_D) $
  with kernel $I$, where $t$ is fixed and every $x_i$ is an eigen-coordinate.
    Flatness identifies $I \/ t I$ with the kernel of the special-fiber presentation.
  If $D$ is smooth at $y_D$, this kernel is zero and Nakayama gives $I = 0$.
    In the other case it is generated by the minimal hypersurface relation of character $- 1$.
    Lift that generator to $I$ and average it to its character to obtain a relation $tilde(F)$ of character $- 1$.
    Nakayama gives $I = \( tilde(F) \)$. Because the base parameter is invariant and $-
    1$ is a nontrivial character, one has
  $ tilde(F) \( t \, 0 \, dots.h \, 0 \) = 0 . $
  In both cases, substituting $x_1 = dots.h.c = x_e = 0$ defines a $mu_h$-fixed formal section over
    $bb(C) \[ \[ t \] \]$ through $y_D$.
  Since $y_D$ is not the vertex, there is a positive-$T$-degree homogeneous element of $D$ nonzero at $y_D$.
    Lift it homogeneously to $macron(S)$. Its value on the formal section is a unit,
    so remains nonzero after passing to $bb(C) \( \( t \) \)$.
    On the other hand, Equation (7.2) identifies this generic fiber, with its $mu_h$-action,
    with standard affine $N$-space: each coordinate has character $1$.
    For $h gt.eq 2$ its fixed-point scheme is exactly the origin,
    where every positive-$T$-degree function vanishes. This is the required contradiction. ◻
]

=== 7.2 The character contribution to colength <the-character-contribution-to-colength>

By Lemma 34, a minimizing valuation $u_(*)$ exists at $y in
  Y$ and is quasi-monomial #cite(label("XZStable")) Theorem 1.2(1). It is invariant under $mu_h$:
  this follows from uniqueness up to scaling and invariance of log discrepancy under automorphisms,
  or directly from #cite(label("XZ21")) Theorem 1.1 and Corollary 1.2. Write

$ A' = A_Y \( u_(*) \) \, wide ell = u_(*) \( lambda_Y \) > 0 \, wide sigma = "vol" \( u_(*) \) > 0 \, $

and let $w$ be the valuation of $C$ constructed in Lemma 33.

#thm([Lemma 7.4.])[
  (Equal leading character lengths).  #emph[Let $R = cal(O)_(Y \, y)$ and let $frak(a)_t = { g in R :
    u_(*) \( g \) gt.eq t }$. For every character $chi in bb(Z) \/ h bb(Z)$,
$ dim_(bb(C)) \( R \/ frak(a)_t \)_chi = frac(sigma, h thin n !) t^n + o \( t^n \) wide \( t arrow.r oo \) . $

]
] <boot:character-shares>

#proof[
  The valuation ideals are $mu_h$-invariant, so these character quotients are defined.
    Multiplication by $lambda_Y^j$ gives an injection
  $ \( R \/ frak(a)_(t - j ell) \)_chi arrow.r.hook \( R \/ frak(a)_t \)_(chi - j) wide \( j gt.eq 0 \) . $
  Indeed, the value of a product is the sum of the values, so the kernel is exactly the indicated valuation
    cutoff. For any two characters one may choose $0 lt.eq j lt.eq h - 1$ connecting them.
    With $H_0 = \( h - 1 \) ell$, this gives, for each fixed $chi$,
  $ "length" \( R \/ frak(a)_(t - H_0) \) lt.eq h dim_(bb(C)) \( R \/ frak(a)_t \)_chi lt.eq
    "length" \( R \/ frak(a)_(t + H_0) \) . $
  The total length has asymptotic $sigma t^n \/ n ! + o \( t^n \)$, proving the assertion.
    The argument uses the primitive character of the nonzero function $lambda_Y$,
    and requires no assumption on the tangent representation. ◻
]

#thm([Proposition 7.5.])[
  (The refined slice estimate).  #emph[For the minimizing slice valuation and its restriction,
#[#set math.equation(numbering: n => "(7.8)")
 $ "vol" \( w \) lt.eq min_(0 lt.eq x lt.eq 1) {x^n / ell^n + \( 1 - x \)^n sigma / h} . $ <boot:refined-volume>]

]
] <boot:refined-estimate>

#proof[
  Set $frak(a)_k = { s in S : w \( s \) gt.eq k }$. For a positive integer $p$, the colength splits exactly as
  #[#set math.equation(numbering: n => "(7.9)")
   $ dim_(bb(C)) S \/ frak(a)_k = dim_(bb(C)) S \/ \( F^p S + frak(a)_k \) +
     dim_(bb(C)) F^p S \/ \( F^p S ∩ frak(a)_k \) . $ <boot:exact-split>]
  The first term is bounded by $dim S \/ F^p S$. For the second, restriction and division define a linear map
  $ F^p S arrow.r R \, wide s mapsto lambda_Y^(- p) \( s \|_Y \) . $
  It is regular because $lambda^(- p) s$ belongs to the Rees algebra.
    Its image has character $p med \( mod med h \)$, since $s$ is invariant and $lambda_Y$ has character $- 1$.
    By Equation (7.5), it induces the injection
  #[#set math.equation(numbering: n => "(7.10)")
   $ frac(F^p S, F^p S ∩ frak(a)_k) arrow.r.hook (R \/ frak(a)_(k - p ell))_(p med mod med h) .
     $ <boot:quotient-injection>]
  In particular, this step is a comparison of one character quotient, not a comparison with the full length upstairs.
  Fix $0 < x < 1$ and take $p = floor.l k x \/ ell floor.r$.
    Apply Equation (7.7) to the first term in Equation (7.9), and Lemma 36 to Equation (7.10).
    There are only finitely many characters for the fixed slice, so the error is uniform as $p med mod med
    h$ varies. Multiplication by $n ! \/ k^n$ and passage to the limit give
  $ "vol" \( w \) lt.eq x^n / ell^n + \( 1 - x \)^n sigma / h . $
  Continuity extends this bound to the endpoints. Taking its minimum proves Equation (7.8). ◻
]

#thm([Lemma 7.6.])[
  (Optimization).  #emph[For the fixed cone and large-stabilizer construction,
#[#set math.equation(numbering: n => "(7.11)")
 $ d \( o \, C \) & lt.eq
   frac(#scale(x: 120%, y: 120%)[\(] \( N \/ n \) ell + A' \/ n #scale(x: 120%, y: 120%)[\)]^n,
   #scale(x: 120%, y: 120%)[\(] ell^(n \/ N) + \( h \/ sigma \)^(1 \/ N) #scale(x: 120%, y: 120%)[\)]^N)\
 & lt.eq \( N \/ n \)^n + \( A' \/ n \)^n sigma \/ h lt.eq p_n / 2 + M_n / 2 . $ <boot:optimized>]

 Equality in the middle, Hölder, inequality holds precisely when
#[#set math.equation(numbering: n => "(7.12)")
 $ \( A' \)^N ell thin sigma / h = N^N . $ <boot:holder-equality>]

]
] <boot:holder>

#proof[
  For positive $ell$ and $sigma$, direct differentiation gives
  $ min_(0 lt.eq x lt.eq 1) {ell^(- n) x^n + sigma / h \( 1 - x \)^n} =
    #scale(x: 120%, y: 120%)[\(] ell^(n \/ N) + \( h \/ sigma \)^(1 \/ N) #scale(x: 120%, y: 120%)[\)]^(- N) . $
  The minimum is attained at the unique interior point
  #[#set math.equation(numbering: n => "(7.13)")
   $ x = frac(ell^(n \/ N), ell^(n \/ N) + \( h \/ sigma \)^(1 \/ N)) . $ <boot:optimal-split>]
  Together with the discrepancy bound in Equation (7.3), this proves Equation (7.11).
  Apply Hölder with conjugate exponents $n \/ N$ and $n$ to the vectors
  $ #scale(x: 120%, y: 120%)[\(] ell \, \( h \/ sigma \)^(1 \/ n) #scale(x: 120%, y: 120%)[\)] \, wide
    #scale(x: 120%, y: 120%)[\(] N \, A' \( sigma \/ h \)^(1 \/ n) #scale(x: 120%, y: 120%)[\)] . $
  Their scalar product is $N ell + A'$. This gives
  $ \( N ell + A' \)^n lt.eq #scale(x: 120%, y: 120%)[\(] ell^(n \/ N) + \( h \/ sigma \)^(1 \/ N)
    #scale(x: 120%, y: 120%)[\)]^N #scale(x: 120%, y: 120%)[\(] N^n + \( A' \)^n sigma \/ h
    #scale(x: 120%, y: 120%)[\)] \, $
  with equality exactly as in Equation (7.12). Finally, Lemmas 34 and 35 show that $y in
    Y$ is a singular boundary-zero klt germ of dimension $n$. Since $u_(*)$ computes its minimum,
  $ \( A' \/ n \)^n sigma = d \( y \, Y \) lt.eq M_n . $
  Using $h gt.eq 2$ proves Equation (7.11). ◻
]

=== 7.3 The upper bound without a same-dimensional assumption <the-upper-bound-without-a-same-dimensional-assumption>

#thm([Theorem 7.7.])[
  (The upper bound).  #emph[Assume the local ODP volume theorem in all dimensions smaller than $n$.
    Then $M_n lt.eq p_n$. Equivalently, every singular boundary-zero klt $n$-dimensional germ satisfies
$ hat("vol") \( x \, X \) lt.eq 2 \( n - 1 \)^n . $

]
] <boot:upper>

#proof[
  Suppose $M_n > p_n$. Choose singular klt germs whose densities $d_i > p_n$ tend to $M_n$.
    Proposition 7 gives for each of them a singular Gorenstein K-polystable cone $o_i in C_i$,
    smooth off the vertex, with the same density $d_i$.
  Fix $i$ and choose the fast gradings of Lemma 8 for this cone.
    If $m_max lt.eq r \/ N$ holds along an infinite subsequence,
    Theorem 10 implies that $C_i$ is smooth or the standard ODP cone.
    The first possibility contradicts its singularity. The second contradicts $d_i > p_n$,
    since the normalized volume at an ODP is $2 \( n - 1 \)^n$ by Lemma 5.
    Thus the large-stabilizer condition holds for all sufficiently far terms. Applying Lemma 38 to one such term gives
  $ d_i lt.eq p_n \/ 2 + M_n \/ 2 . $
  Letting $i$ tend to infinity yields $M_n lt.eq p_n \/ 2 + M_n \/ 2$, contrary to $M_n > p_n$.
  All choices of sufficiently fast gradings in this argument are made separately for each fixed cone $C_i$.
    Neither an attained supremum nor approximation estimates uniform over different cones are required.
    The slice bound used only the definition of $M_n$, so the argument assumes no same-dimensional ODP estimate. ◻
]

=== 7.4 Equality, a strict count, and the maximal stabilizer <equality-a-strict-count-and-the-maximal-stabilizer>

Suppose now that the fixed cone satisfies $d \( o \, C \) = p_n$. Theorem 39 is available.
  For every sufficiently fast grading in the large-stabilizer range, take $m = m_max$ and make the construction above.

#thm([Lemma 7.8.])[
  (Consequences of equality).  #emph[One has $h = 2$, $d \( y \, Y \) = p_n$, and $A' = N ell$.
    After rescaling $u_(*)$ so that $ell = 1$, the resulting restriction $w$ satisfies
#[#set math.equation(numbering: n => "(7.14)")
 $ A' = N \, wide sigma = 2 \, wide A_C \( w \) = 2 N \, wide "vol" \( w \) = 2^(- N) \, wide w =
   frac(2 N, n) "wt"_xi . $ <boot:equality-identities>]

 The optimal splitting fraction in Equation (7.8) is $x = 1 \/ 2$,
   and all inequalities producing that estimate are equalities at the level of leading coefficients.]
] <boot:equality-data>

#proof[
  The left endpoint of Equations (7.11)–(7.11) is now $p_n$, and the right endpoint is at most $p_n$.
    Every inequality is therefore an equality. In particular,
  $ h = 2 \, wide \( A' \)^n sigma = 2 N^n . $
  Combining this with Equation (7.12) gives
  $ N^N = \( A' \)^N ell thin sigma \/ 2 = N^n ell \/ A' \, $
  so $A' = N ell$. Rescaling $u_(*)$ by $ell^(- 1)$ makes $ell = 1$, hence $A' = N$ and $sigma = 2$.
    Equation (7.13) then gives $x = 1 \/ 2$ and the refined volume bound becomes $"vol" \( w \) lt.eq 2^(- N)$.
    The discrepancy bound becomes $A_C \( w \) lt.eq 2 N$.
  Since $w$ is an admissible centered valuation,
  $ 2 N^n = hat("vol") \( o \, C \) lt.eq A_C \( w \)^n "vol" \( w \) lt.eq \( 2 N \)^n 2^(- N) = 2 N^n . $
  Both factors are positive. Thus both displayed upper bounds are attained,
    and $w$ computes the normalized volume minimum. Uniqueness up to scaling #cite(label("XZ21")) Theorem 1.1,
    together with $A_C \( "wt"_xi \) = n$, gives the last identity in Equation (7.14). ◻
]

#thm([Lemma 7.9.])[
  (The distinguished section cannot have value greater than two).  #emph[In the normalization of Lemma 40,
    the section $v in S_m$ used to define the two filtrations satisfies $w \( v \) lt.eq 2$.]
] <boot:strict-count>

#proof[
  Suppose $w \( v \) > 2$. Choose a fixed real number $t$ with
  $ frac(1, w \( v \)) < t < 1 / 2 \, $
  and set $a_k = ceil.l t k ceil.r$ and $p_k = floor.l k \/ 2 floor.r$. For large $k$ one has $p_k - a_k > 0$.
    Use the vector-space basis $v^b e_i$ supplied by Lemma 27; it is adapted to $W$, with $W \( v^b e_i \) = b +
    T_i$. Let $E_k$ be the span of its basis vectors with level less than $p_k - a_k$.
  Multiplication by $v^(a_k)$ maps $E_k$ injectively into $S \/ F^(p_k) S$.
    To see injectivity modulo this filtration, the initial form of $v$ is the regular polynomial variable
    $mono(v)$ in $G = D \[ mono(v) \]$. Hence multiplication by $v^(a_k)$ raises every nonzero initial level by
    exactly $a_k$ and kills no initial form. Moreover, every element of $v^(a_k)
    E_k$ has $w$-value greater than $k$: $w$ is nonnegative on $S$ and $a_k w \( v \) > k$.
  Thus the kernel of
  $ S \/ F^(p_k) S arrow.r S \/ \( F^(p_k) S + frak(a)_k \) $
  has dimension at least
  $ dim E_k = dim S \/ F^(p_k - a_k) S = frac(\( 1 \/ 2 - t \)^n, n !) k^n + o \( k^n \) . $
  This is a strict positive leading-order loss in the first term of the exact splitting Equation (7.9).
    The second term still satisfies the character estimate in Equation (7.10).
    At $x = 1 \/ 2$, $ell = 1$, and $sigma \/ h = 1$, these estimates give
  $ "vol" \( w \) lt.eq 2^(- n) + 2^(- n) - \( 1 \/ 2 - t \)^n < 2^(- N) \, $
  contradicting Lemma 40. Only the single exponent $a_k$ is used at each cutoff,
    so there is no overlap between collections of powers to count. ◻
]

#thm([Lemma 7.10.])[
  (Rounding the maximal stabilizer).  #emph[Along the fast gradings of the fixed equality cone,
    the large-stabilizer construction implies $N m_max lt.eq r$ for every sufficiently far term.]
] <boot:rounding>

#proof[
  Choose fixed torus eigen-generators $g_1 \, dots.h \, g_q$ of $S$, with characters $chi_1 \, dots.h \, chi_q$. Write
  $ zeta = r / n xi + epsilon \, wide parallel epsilon parallel arrow.r 0 . $
  The $xi$-weights of the generators are positive. Consequently there are fixed constants $c_1 \,
    c_2 > 0$ such that their $zeta$-degrees lie between $c_1 r$ and $c_2 r$ for all sufficiently far gradings.
    Also $m = m_max lt.eq max_i deg_zeta g_i = O \( r \)$, by Lemma 8.
  The section $v in S_m$ has a polynomial lift in these generators homogeneous for $zeta$.
    Every monomial in such a lift uses a bounded number of generators, because its degree is $m =
    O \( r \)$ and each generator degree is at least $c_1 r$.
    Its possible torus characters therefore belong to a fixed finite set,
    independent of the grading and of the chosen section $v$.
    If $chi$ is any character occurring nontrivially in $v$, then
  $ m = chevron.l zeta \, chi chevron.r = r / n chevron.l xi \, chi chevron.r + chevron.l epsilon \, chi chevron.r \, $
  and hence, uniformly for these characters,
  $ chevron.l xi \, chi chevron.r = frac(n m, r) + O \( parallel epsilon parallel \/ r \) . $
  Taking the minimum over the nonzero character components of $v$ is precisely $"wt"_xi \( v \)$;
    the same estimate therefore holds even when $v$ is not itself a torus eigenfunction. Lemma 40 gives
  #[#set math.equation(numbering: n => "(7.15)")
   $ w \( v \) = frac(2 N m, r) + O \( parallel epsilon parallel \/ r \) = frac(2 N m, r) +
     o \( 1 \/ r \) . $ <boot:changing-section-error>]
  By Lemma 41, $w \( v \) lt.eq 2$. Thus $N m - r lt.eq O \( parallel epsilon parallel \) = o \( 1 \)$.
    The left side is an integer, so it is nonpositive for all sufficiently far terms.
    On an exact rational ray the error is zero, and the same conclusion is immediate.
    All constants here concern the fixed cone $C$ only. ◻
]

#thm([Theorem 7.11.])[
  (The equality cone).  #emph[If a singular cone obtained in Proposition 7 satisfies $d \( o \, C \) = p_n$,
    then it is the standard ordinary double point cone.]
] <boot:equality-cone>

#proof[
  Take the fast primitive gradings of Lemma 8. A term either already has $N m_max lt.eq r$,
    or lies in the large-stabilizer range. In the latter range,
    all constructions above are available for sufficiently far terms, and Lemma 42 again gives $N m_max lt.eq r$.
    The entire sequence therefore eventually satisfies the small-stabilizer hypothesis.
    Theorem 10 identifies $C$ with the smooth affine cone or the standard quadratic cone.
    Since $o in C$ is singular, only the ordinary double point remains. ◻
]

== 8 Equality at the original germ and global consequences <sec:conclusion>

We complete the return from the cone to the original singularity.
  The lci case of the gap theorem is already known #cite(label("Liu22")) Theorem 1.3.
  We include the hypersurface argument needed here, so that the source of strictness in the equality case is explicit.

=== 8.1 A weighted hypersurface bound <a-weighted-hypersurface-bound>

#thm([Lemma 8.1.])[
  (A hypersurface test).  #emph[Let $x in X$ be a klt hypersurface germ of dimension $n$,
    with equation $F$ in regular ambient parameters $z_0 \, dots.h \, z_n$.
    For positive rational weights $w_0 \, dots.h \, w_n$, write $d_F$ for the weighted order of $F$. Then
#[#set math.equation(numbering: n => "(8.1)")
 $ hat("vol") \( x \, X \) lt.eq
   frac(d_F #scale(x: 120%, y: 120%)[\(] sum_(i = 0)^n w_i - d_F #scale(x: 120%, y: 120%)[\)]^n, product_(i = 0)^n
   w_i) . $ <end:eq-hypersurface-test>]

]
] <end:hypersurface-test>

#proof[
  Both sides of (8.1) are unchanged by a common scaling of the weights.
    We may therefore assume that they are positive integers. Choose a positive common multiple $D_1$ of the $w_i$,
    and in $cal(O)_(X \, x)$ put
  $ I = \( z_i^(D_1 \/ w_i) : 0 lt.eq i lt.eq n \) . $
  This ideal is $frak(m)_x$-primary.
  The ambient weighted valuation has log discrepancy $sum_i w_i$, gives value $d_F$ to $F$,
    and value $D_1$ to the ambient ideal defining $I$. Hypersurface inversion of adjunction
    #cite(label("EinMustata04")) Theorem 1.1, applied to the smooth ambient space with $F$ of coefficient one, gives
  #[#set math.equation(numbering: n => "(8.2)")
   $ "lct"_X \( I \) lt.eq frac(sum_i w_i - d_F, D_1) . $ <end:eq-threshold-test>]
  In particular the numerator on the right is positive, because $X$ is klt and $I$ is primary.
  Let $J_t$ be the quotient weighted-order filtration on the hypersurface.
    The elementary monomial floor inequality gives
  $ J_(\( k + n + 1 \) D_1) subset I^k subset J_(k D_1) . $
  Indeed, for a monomial of weight at least $\( k + n + 1 \) D_1$,
    the sum of the integers $floor.l alpha_i w_i \/ D_1 floor.r$ is at least $k$.
    The associated graded of the quotient filtration is
  $ bb(C) \[ z_0 \, dots.h \, z_n \] \/ \( "in"_w F \) \, wide H \( t \) =
    frac(1 - t^(d_F), product_i \( 1 - t^(w_i) \)) . $
  This formula holds even if $"in"_w F$ is reducible or nonreduced: it is a nonzero equation in a polynomial ring.
    The two filtration inclusions and the leading Hilbert coefficient give
  #[#set math.equation(numbering: n => "(8.3)")
   $ e \( I \) = frac(D_1^n d_F, product_i w_i) . $ <end:eq-multiplicity>]
  Choose a divisor $E$ computing $"lct"_X \( I \)$, and put $q = "ord"_E \( I \) > 0$.
    Its center is $x$, since $I$ is primary. The inclusion $I^k subset frak(a)_(k q) \( E \)$ implies
  $ q^n "vol" \( E \) lt.eq e \( I \) . $
  Testing the normalized-volume infimum with $E$, then using (8.2) and (8.3), yields
  $ hat("vol") \( x \, X \) lt.eq A_X \( E \)^n "vol" \( E \) lt.eq "lct"_X \( I \)^n e \( I \) \, $
  which is (8.1). ◻
]

#thm([Proposition 8.2.])[
  (Hypersurface equality).  #emph[If $x in X$ is a singular klt hypersurface germ of dimension $n gt.eq 2$, then
$ hat("vol") \( x \, X \) lt.eq 2 \( n - 1 \)^n . $

 If equality holds, the quadratic part of a local equation is nondegenerate,
   and $\( X \, x \)$ is analytically an ordinary double point.]
] <end:hypersurface>

#proof[
  Let $q = "mult"_x \( F \) gt.eq 2$. Weights all equal to one in Lemma 44 give
  $ hat("vol") \( x \, X \) lt.eq q \( n + 1 - q \)^n \, $
  and klt implies $q < n + 1$. The function $b \( t \) = t \( n + 1 - t \)^n$ satisfies
  $ b' \( t \) = \( n + 1 \) \( 1 - t \) \( n + 1 - t \)^(n - 1) < 0 quad \( 1 < t < n + 1 \) . $
  Thus $q > 2$ gives a strict bound below $2 \( n - 1 \)^n$.
  Suppose $q = 2$ and the quadratic part is degenerate. After a linear change of coordinates,
    choose a direction absent from the quadratic part. Give it weight $1 - epsilon.alt$,
    and give every other direction weight one, where $0 < epsilon.alt < 1 \/ 3$ is rational.
    Every term of ordinary degree at least three has weight greater than two, so $d_F = 2$. The bound becomes
  $ frac(2 \( n - 1 - epsilon.alt \)^n, 1 - epsilon.alt) . $
  Its logarithmic derivative at $epsilon.alt = 0$ is $- n \/ \( n - 1 \) + 1 = - 1 \/ \( n - 1 \) < 0$.
    It is therefore strictly smaller than $2 \( n - 1 \)^n$ for sufficiently small $epsilon.alt > 0$.
    Equality forces a nondegenerate quadratic part, and the holomorphic Morse Lemma gives the asserted analytic germ. ◻
]

=== 8.2 Completion of the induction <completion-of-the-induction>

#proof[
  The cases $n = 2 \, 3 \, 4$ were established in Section 2, the last by Theorem 6.
    Suppose the theorem is known in lower dimensions and let $n = N + 1 gt.eq 5$.
    The supremum argument of Theorem 39 gives $M_n lt.eq p_n$, hence the asserted inequality for every singular germ.
  Now suppose $d \( x \, X \) = p_n$. Apply Proposition 7 to obtain a K-polystable cone $C$ with the same density
    and $"edim" \( X \, x \) lt.eq "edim" \( C \, o \)$. The equality argument of Theorem 43 makes $C$ an ordinary
    double point. Therefore $"edim" \( X \, x \) lt.eq n + 1$.
  Since $x$ is singular, its embedding dimension is exactly $n + 1$, and it is a hypersurface germ.
    To see this algebraically, start with an embedding in a smooth ambient variety and use equations with
    independent linear parts to cut the ambient germ down to dimension $n + 1$.
    The remaining ideal is a height-one prime in a regular local ring, so is principal.
    Proposition 45 shows that its equation has nondegenerate quadratic part and hence that the analytic germ is ODP.
  Conversely, Lemma 5 gives equality at every analytic ODP.
    This proves both directions of the equality statement and completes the induction. ◻
]

=== 8.3 The global comparison <the-global-comparison>

#proof[
  For every closed point $x$ of a K-semistable $bb(Q)$-Fano $n$-fold $V$, the local-to-global comparison gives
  $ \( - K_V \)^n lt.eq (frac(n + 1, n))^n hat("vol") \( x \, V \) . $
  This follows from #cite(label("Liu18")) Theorem 21; K-semistability and Ding semistability agree in this setting
    by #cite(label("Liu18")) Theorem 13(2). If $V$ is singular, apply Theorem 1 at a singular closed point:
  $ \( - K_V \)^n lt.eq (frac(n + 1, n))^n 2 \( n - 1 \)^n = 2 (frac(n^2 - 1, n))^n < 2 n^n . $
  If $V$ is smooth and $V tilde.nequiv bb(P)^n$, the theorem of Li–Miao gives $\( - K_V \)^n lt.eq 2 n^n$;
    its equality cases are a smooth quadric and $bb(P)^1 times bb(P)^(n - 1)$ #cite(label("LM25")) Theorem 1.1.
    Both have Kähler–Einstein metrics, given by the homogeneous quadric metric and the suitably scaled
    Fubini–Study product metric, respectively. They are therefore K-polystable #cite(label("Berman16"))
    Theorem 1.1. Their degrees are
  $ \( - K_(Q^n) \)^n = \( n H \)^n = 2 n^n \,
    wide \( - K_(bb(P)^1 times bb(P)^(n - 1)) \)^n = \( 2 H_1 + n H_2 \)^n = 2 n^n . $
  For $n = 2$, a smooth quadric surface is $bb(P)^1 times bb(P)^1$.
    The strict singular bound excludes every other equality case. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
