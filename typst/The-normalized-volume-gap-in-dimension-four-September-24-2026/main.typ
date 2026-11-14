#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The normalized-volume gap in dimension four]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:intro>

Normalized volume connects the birational geometry of a singularity with the asymptotic size of ideals in its
  local ring. For an $n$-dimensional klt germ $\( X \, x \)$, a real valuation $v$ centered at $x$ has valuation ideals

$ frak(a)_t \( v \) = { f in cal(O)_(X \, x) : v \( f \) gt.eq t } $

and volume $"vol" \( v \) = lim_(t arrow.r oo) n ! thin "length" \( cal(O)_(X \, x) \/ frak(a)_t \( v \) \) \/
  t^n$. Its log discrepancy is denoted by $A_X \( v \)$. The normalized volume introduced by Li [8] is

$ hat("vol") \( x \, X \) = inf_(v upright(" centered at ") x) A_X \( v \)^n "vol" \( v \) \, $

where valuations of infinite discrepancy contribute $+ oo$.
  The factor $A_X \( v \)^n$ makes the expression invariant under positive rescaling of $v$.
  Section 2 fixes the discrepancy convention and the equivalent divisorial definition used in our estimates.

The invariant has a distinguished largest value: $hat("vol") \( x \, X \) lt.eq n^n$,
  with equality exactly at smooth points [15] Theorem 1.6. The next possible value is a subtler question,
  because a general klt point comes with neither a simple local-ring presentation nor a distinguished exceptional
  divisor. Motivated by singular Kähler–Einstein limits, Spotti–Sun formulated the #emph[ordinary-double-point
  volume-gap conjecture] [19] Conjecture 5.5: a singular boundary-zero klt $n$-fold germ should have volume at
  most $2 \( n - 1 \)^n$, with equality precisely at an ordinary double point.
  The conjecture also appears in the K-stability problem list [25] Section 3.2, Problem 33.
  An ordinary double point means the analytic hypersurface germ defined by a nondegenerate quadratic form in $n +
  1$ variables. We prove the conjecture in dimension four.

#thm([Theorem 1.1.])[
  #emph[Let $x in X$ be a singular closed point of a normal complex algebraic variety of dimension four.
    Suppose that $K_X$ is $bb(Q)$-Cartier and that $X$ is klt near $x$, with boundary zero. Then
$ hat("vol") \( x \, X \) lt.eq 162 . $

 Equality holds if and only if the analytic germ $\( X \, x \)$ is isomorphic to
$ ({z_0^2 + z_1^2 + z_2^2 + z_3^2 + z_4^2 = 0} subset bb(C)^5 \, 0) . $

]
] <thm:main>

The theorem imposes no isolatedness, complete-intersection, quotient, or smoothability assumption.
  Its boundary is zero throughout. Nonisolated fourfold points already satisfy the strictly smaller bound $4096 \/
  27$ [13] Corollary 2.18; the essential new case is therefore an isolated point without a prescribed local-ring
  structure.

=== 1.1 Earlier results and the remaining obstacle <earlier-results-and-the-remaining-obstacle>

The low-dimensional and structurally restricted cases guide the proof.
  Liu–Xu established the full threefold gap, including its equality characterization [15] Theorem 1.3.
  Liu proved the conjecture for local complete intersections in every dimension [13] Theorem 2.12;
  this is the final input in our proof, after we have obtained a hypersurface presentation.
  Moraga–Süß proved that a nonsmooth $bb(Q)$-Gorenstein toric germ of dimension $n gt.eq
  3$ has normalized volume at most $16 n^n \/ 27$, with equality precisely for a three-dimensional ordinary double
  point times a smooth factor [17] Theorem 2. In dimension four their bound is already strictly below $162$.
  More recently, Li–Miao proved the ODP conjecture for affine cones over smooth K-semistable Fano manifolds $Y$,
  polarized by an ample line bundle $L$ with $- K_Y tilde.op r L$ for a positive integer $r$ [10] Theorem 4.17.
  Stable degeneration alone does not give such a smooth polarized base,
  so the general isolated fourfold case requires a further structural argument.

The use of a volume bound to constrain the local ring also has a close threefold precedent.
  Liu proved the sharp upper bound $9$ for Gorenstein canonical threefold singularities that are not hypersurfaces
  [14] Theorem 1.1. Our fourfold argument constructs a terminal Gorenstein threefold hyperplane section and uses
  its hypersurface structure to control the original embedding dimension.

The other foundation is the variational and degeneration theory of normalized volume.
  In Sasaki–Einstein geometry, Martelli–Sparks–Yau studied volume minimization as the Reeb field varies on a fixed
  canonical-charge slice [16]. Li’s normalized-volume program moved the problem to the space of valuations of an
  arbitrary klt germ [8]; Li–Liu established minimization over all centered valuations in Kähler–Einstein cone
  settings [9]. Minimization within a fixed Reeb cone and minimization over all valuations are different
  statements. The latter is the one required when we test transverse-jet valuations against the minimum.

Blum proved existence of a minimizing valuation [1]; Li–Xu established the relation between finitely generated
  quasi-monomial minimizers and K-semistable Fano cones [11]; Xu proved quasi-monomiality of minimizers [22];
  and Xu–Zhuang proved uniqueness up to rescaling and the finite-degree formula [23].
  Xu–Zhuang subsequently proved finite generation, completing the stable degeneration theorem used below [24].
  Together these developments yield the volume-preserving degeneration on which our structural reduction begins.
  A K-semistable Fano cone is used in this paper through its positive torus grading and its minimizing Reeb
  valuation; no metric or K-polystable refinement is required.

Stable degeneration replaces the original germ by a graded cone without changing its normalized volume.
  It does not, however, make that cone a complete intersection.
  Writing $"edim" \( x \, X \) = dim_(bb(C)) frak(m)_x \/ frak(m)_x^2$ for the embedding dimension,
  the central implication supplied by this paper is

#[#set math.equation(numbering: n => "(1.1)")
 $ hat("vol") \( x \, X \) gt.eq 162 quad arrow.r.double quad "edim" \( x \, X \) lt.eq 5 . $ <eq:strategy>]

A singular normal fourfold of embedding dimension at most five is a hypersurface.
  Liu’s established theorem then supplies both the sharp bound and analytic rigidity.
  Thus the proof must extract a local-ring constraint from the numerical hypothesis,
  not merely find another valuation on a known hypersurface.

=== 1.2 Main ideas and proof structure <main-ideas-and-proof-structure>

The first step, in Section 2, uses stable degeneration, the finite-degree formula,
  and the nonisolated bound to obtain an isolated Gorenstein cone $C$ with vertex $o$.
  Its embedding dimension bounds that of the original germ.
  Integral gradings close to its minimizing Reeb ray permit finite cyclic stabilizers to be studied using ordinary
  character spaces.

Section 3 counts jets on a smooth slice transverse to a grading orbit.
  A large stabilizer would give a valuation whose normalized volume is strictly smaller than that of the
  minimizing ray. Excluding it has two consequences. Geometrically,
  every primitive exceptional divisor centered at the vertex has log discrepancy at least three.
  Algebraically, after rescaling the grading, all nonzero pole frequencies of a Hilbert series lie outside a fixed
  interval. The use of transverse slices is compatible with the orbifold-cone construction of Li–Zhou [12];
  the character-sensitive jet estimate is proved directly here.

Section 4 converts the frequency gap into the existence of low-weight functions.
  We rescale the grading so that a generating canonical form has weight $5 \/ 2$.
  Stanley’s graded canonical-module duality [20] completes the one-sided Hilbert coefficients to a signed measure
  on the whole line. Periodic Hilbert corrections and Gorenstein symmetry also appear in the orbifold Riemann–Roch
  calculations of Buckley–Reid–Zhou [2] Theorem 1.3 and Section 2.4;
  our lemma instead applies to general positively graded normal Cohen–Macaulay domains under a stabilizer
  hypothesis. Poisson summation identifies the pairing with a band-limited test function with an explicit
  polynomial integral. Carefully chosen signs force a function of weight strictly between $0$ and $5 \/ 3$.
  The combination of Poisson summation and sign-changing polynomial multiples of squared Fourier transforms has a
  methodological parallel in Cohn–Elkies’ linear-programming bounds [3] Sections 3 and 6,
  although no sphere-packing theorem is an input here. We prove compatible statements on two- and
  three-dimensional graded subvarieties under an explicit positivity condition on their canonical modules;
  these statements need neither a Gorenstein assumption nor a complete-intersection presentation.

Section 5 applies those lower-dimensional statements to minimal log canonical centers.
  Write $frak(m)_o$ for the maximal ideal of the vertex and $"lct"_o \( C \; frak(m)_o \)$ for its log canonical
  threshold, the infimum of $A_C \( F \) \/ "ord"_F \( frak(m)_o \)$ over prime divisors centered at $o$.
  If this threshold were at most $3 \/ 2$, low-weight functions would construct a homogeneous log canonical
  boundary of weight smaller than the canonical weight. This inequality excludes the vertex as a log canonical
  center. The boundary construction therefore gives a positive-dimensional minimal center on which all the
  low-weight functions vanish. Fujino–Gongyo’s affine subadjunction theorem [5] makes that center a normal
  Cohen–Macaulay variety admitting a klt boundary. After verifying the needed positivity of its canonical module,
  the lower-dimensional Hilbert-series argument supplies a low-weight function on the center, a contradiction.
  Hence the maximal-ideal threshold is strictly greater than $3 \/ 2$.

Finally, Section 6 combines that threshold with the integral discrepancy bound.
  A general hyperplane section is a terminal Gorenstein threefold.
  Reid’s classification [18] makes it a hypersurface of embedding dimension at most four;
  adding back the hyperplane bounds the cone’s embedding dimension by five.
  Figure 1 records how the two estimates combine. The proof of the main theorem then transfers the
  embedding-dimension bound to the original germ and invokes the lci volume theorem.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 1,
  align: (center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[$hat("vol") \( x \, X \) gt.eq 162$$arrow.r.double$isolated Gorenstein cone $C$
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[transverse jets and the stabilizer bound
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.bl$$arrow.br$
],
  table.cell(rowspan: 1, colspan: 1)[$A_C \( F \) gt.eq 3$ Hilbert duality and low-weight functions
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[$"lct"_o \( C \; frak(m)_o \) > 3 \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.br$$arrow.bl$
],
  table.cell(rowspan: 1, colspan: 1)[terminal Gorenstein threefold section
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[$"edim" \( x \, X \) lt.eq "edim" \( o \, C \) lt.eq 5$
],
)
]],
  caption: [Figure 1: The structural reduction. Here $F$ is any primitive prime divisor centered at $o$. Its discrepancy bound and the maximal-ideal threshold are separate consequences of the stabilizer estimate; both are needed to make the threefold section terminal. The remaining sharp volume and equality statement comes from the established lci theorem. ],
) <fig:proof-route>

== 2 Volume conventions and the cone reduction <sec:reduction>

All varieties are over $bb(C)$. We use log discrepancies:
  for a prime divisor $F$ on a smooth proper birational model $mu : Y arrow.r X$,

$ A_X \( F \) = 1 + "coeff"_F \( K_Y - mu^(*) K_X \) . $

For $F$ centered exactly at $x$, let $R = cal(O)_(X \, x)$ and

$ frak(a)_t \( F \) = { f in R : "ord"_F \( f \) gt.eq t } \, wide "vol" \( F \) =
  lim_(t arrow.r oo) frac(n !, t^n) "length" \( R \/ frak(a)_t \( F \) \) . $

Then

$ hat("vol") \( x \, X \) = inf_(c_X \( F \) = x) A_X \( F \)^n "vol" \( F \) . $

Since Kollár-component valuations are divisorial, [11] Theorem 2.5 identifies this with the infimum over all real
  valuations centered at $x$. We use the usual extension of discrepancy to such valuations.
  For a pair $\( X \, Delta \)$ with $K_X + Delta$ $bb(Q)$-Cartier, the divisor formula is

$ A_(X \, Delta) \( F \) = 1 + "coeff"_F #scale(x: 120%, y: 120%)[\(] K_Y -
  mu^(*) \( K_X + Delta \) #scale(x: 120%, y: 120%)[\)] . $

When $K_X$ is itself $bb(Q)$-Cartier, this is $A_X \( F \) - "ord"_F \( Delta \)$.
  The pair is klt, respectively lc, when all prime divisors over it have positive, respectively nonnegative,
  log discrepancies. For an lc pair, an #emph[lc center] is the center on $X$ of a prime divisor with log
  discrepancy zero; a #emph[minimal lc center] is minimal under inclusion.
  A normal $bb(Q)$-Gorenstein variety is terminal when every exceptional prime divisor has log discrepancy greater
  than one. Replacing a valuation by a positive multiple leaves its normalized volume unchanged.
  Every rational monomial valuation used below is proportional to a prime divisor,
  which may be placed on a smooth proper birational model by resolution.
  We use resolution and principalization in characteristic zero in the forms of [6] Theorems 26–27.

For an ideal $frak(a)$, $"lct"_x \( X \; frak(a) \)$ means the threshold for log canonicity in a neighborhood of
  $x$. Its valuative formula allows centers containing $x$.
  If $frak(a) = frak(m)_x$, only divisors centered exactly at $x$ have positive order on the ideal.

We use the following established results:

+ Stable degeneration produces a quasi-monomial minimizing valuation with finitely generated associated graded
  ring [24] Theorem 1.2. The induced Reeb valuation preserves its volume and discrepancy and minimizes among all
  centered valuations [11] Lemma 4.10 and Theorem 1.3. Thus the cone has the same normalized volume as the
  original germ.
+ A finite Galois quasi-étale crepant morphism of klt germs multiplies normalized volume by its degree [23] Theorem 1.3.
+ The universal upper bound is $n^n$. A nonsmooth local complete intersection (lci) klt germ satisfies the ODP
  bound with equality precisely at an ODP. In dimension four,
  a nonisolated klt point has volume at most $4096 \/ 27$ [13] Theorems 2.11–2.12 and Corollary 2.18.

All these statements allow boundary zero, as used here. When the bibliography lists a versioned preprint alongside
  a journal reference, theorem and section numbers in citations refer to that preprint.

For an affine cone with a torus action and constant invariant ring, write $S =
  xor.big_chi S_chi$ for its character decomposition. A #emph[Reeb vector] $xi$ is a real cocharacter with
  $chevron.l chi \, xi chevron.r > 0$ for every nonzero occurring character. Its weight valuation is

$ "wt"_xi #h(-0.16667em) (sum_chi f_chi) = min_(f_chi eq.not 0) chevron.l chi \, xi chevron.r . $

The set of such vectors is the open Reeb cone. An integral cocharacter gives an integer grading;
  its weight valuation is the #emph[degree valuation]. We use K-semistability only through the minimizing and
  volume-preserving assertions of stable degeneration.

#thm([Lemma 2.1.])[
  #emph[Let $v$ be a valuation centered at a klt point $x$, of finite log discrepancy.
    If $"gr"_v R$ is finitely generated, then
$ "edim" \( R \) lt.eq "edim" \( "gr"_v R \) . $

]
] <lem:edim>

#proof[
  Choose minimal homogeneous algebra generators of $"gr"_v R$ and lift them to $f_1 \, dots.h \,
    f_e in frak(m)_x$. Their weights are positive. The additive semigroup generated by finitely many positive real
    numbers has finitely many elements below any fixed bound.
  Given $f in frak(m)_x$, subtract a polynomial in the $f_i$ with the same initial form.
    Unless the remainder is zero, its value strictly increases. Li’s Izumi estimate [8] Theorem 3.1 gives
  $ v \( g \) lt.eq M "ord"_(frak(m)_x) \( g \) $
  for a finite constant $M$. Successive cancellation therefore reaches a remainder of value $> M$, or zero,
    after finitely many steps. That remainder lies in $frak(m)_x^2$.
    Consequently the classes of the $f_i$ span $frak(m)_x \/ frak(m)_x^2$. ◻
]

#thm([Proposition 2.2.])[
  #emph[Suppose that $x in X$ satisfies the hypotheses of Theorem 1 and that
$ V := hat("vol") \( x \, X \) gt.eq 162 . $

 There is a positively graded affine fourfold $C = "Spec" S$, with vertex $o$, such that:]
  + #emph[$C$ is Gorenstein and klt, and $C \\ { o }$ is smooth;]
  + #emph[$hat("vol") \( o \, C \) = V$, and $"edim" \( x \, X \) lt.eq "edim" \( o \, C \)$;]
  + #emph[an effective torus acts on $C$, with a minimizing Reeb vector $xi_(*)$.
    Primitive positive integral gradings along rational rays approaching $xi_(*)$ have degree valuations of
    discrepancies $r in bb(Z)_(> 0)$ and volumes $h > 0$, with
$ r^4 h gt.eq V \, wide r^4 h arrow.r V . $

 For each such grading, the canonical module has a homogeneous generator of degree $r$.]
  #emph[Moreover, $o$ is singular.]
] <prop:cone>

#proof[
  Apply stable degeneration to $\( x \, X \)$, with boundary zero, and quotient the acting torus by its kernel.
    This gives the volume assertions and, by Lemma 2, the embedding-dimension comparison.
  If a singular point of $C$ lies away from $o$, its positive-grading orbit is nonconstant and its closure
    contains $o$. The singular locus is closed and invariant, so it has dimension at least one at $o$.
    The nonisolated bound gives $V lt.eq 4096 \/ 27 < 162$, a contradiction.
  Let $d$ be the canonical index at $o$. Its cyclic index-one cover is finite Galois and quasi-étale of degree
    $d$, and is crepant and klt. It has a single point above $o$.
    To see this, write its local algebra as the sum of the reflexive canonical powers in residue degrees modulo
    $d$. A homogeneous element whose power is a unit would itself be a unit;
    multiplication by it would identify its canonical-power summand with the degree-zero local ring.
    In nonzero residue degree this would trivialize a proper canonical power, contradicting the definition of $d$.
    Thus each homogeneous element of nonzero degree is nilpotent in the special fiber,
    whose reduction is consequently $bb(C)$. The finite-degree formula and the universal upper bound now give
  $ d V lt.eq 256 . $
  Since $V gt.eq 162$, necessarily $d = 1$.
  The canonical module is locally free at $o$, and its fiber there is one-dimensional.
    A homogeneous lift of a basis generates the graded module by graded Nakayama.
    It freely generates because the module has rank one and is torsion-free.
    Klt singularities are rational and Cohen–Macaulay [7] Theorem 120, so $C$ is Gorenstein.
  For completeness, finite generation also proves the required approximation continuity.
    On finitely many homogeneous generators, nearby Reeb weights lie between $1 - epsilon.alt$ and $1 +
    epsilon.alt$ times the original weights. The same holds on every occurring character,
    and sandwiches the valuation ideals. Volumes consequently converge.
    The discrepancy is the canonical-weight linear function [11] Lemma 2.18 and Remark 2.19.
    Rational Reeb rays give divisorial valuations up to scale [11] Lemma 2.16.
    Dividing an integral cocharacter by its common factor makes it primitive, without changing normalized volume.
    Since the torus is effective, a primitive cocharacter gives an effective one-parameter action.
    A homogeneous canonical generator then has an integer degree $r$,
    equal to the discrepancy of the degree valuation, and $r > 0$ by klt.
  Finally, a smooth cone would have $"edim" \( o \, C \) = 4$.
    The embedding-dimension comparison would make $x$ smooth, contrary to hypothesis. ◻
]

We will prove $"edim" \( o \, C \) lt.eq 5$ for the cone in Proposition 3.
  Until the final section, all geometry concerns this cone.

== 3 Stabilizers and discrepancies <sec:stabilizers>

Our goal is to bound the stabilizers on the smooth puncture and deduce a lower bound for every divisor centered at
  the vertex. We first construct the grading extraction, which places both questions on finite smooth slice charts.

Fix an effective positive integral grading $S = xor.big_(j gt.eq 0) S_j$, with $S_0 = bb(C)$,
  and write $r$ for its canonical degree. We use the convention

$ f_j \( s dot.op P \) = s^j f_j \( P \) \; $

in particular, $d f_j$ has weight $j$.

#thm([Lemma 3.1.])[
  #emph[There is a proper birational morphism $pi : tilde(C) arrow.r C$, an isomorphism away from $o$,
    with reduced exceptional fiber $E$, such that
$ K_(tilde(C)) = pi^(*) K_C + \( r - 1 \) E . $

 At a point of $E$ represented by a punctured-cone point with stabilizer order $m$,
   the completed local model is a smooth quotient with parameters $\( u \, z_1 \, z_2 \, z_3 \)$.
   The group $mu_m$ acts faithfully on the line coordinate and faithfully on the slice tangent space.
   The quotient is étale in codimension one, $m E$ is locally Cartier, and $\( tilde(C) \, E \)$ is log canonical.]
] <lem:extraction>

#proof[
  Take the coarse quotient of $\( C \\ { o } \) times bb(A)_u^1$ by the grading action on the first factor and
    weight $- 1$ on $u$. The map to $C$ is defined by
  $ f_j mapsto u^j f_j \( P \) \, $
  and $E tilde.eq "Proj" S$ is the reduced zero section.
  For a homogeneous $g in S_d$ nonzero at a base point, use the slice $g = 1$. It is smooth:
    the orbit derivative of $g$ on this level set is the nonzero number $d$.
    The chart is the quotient of the slice times $bb(A)^1$ by $mu_d$,
    and the corresponding chart of $"Proj" S$ is the quotient of the slice.
    If $B$ is the slice ring, then $B$ is finite over $B^(mu_d)$, while $u^d$ is the pullback of $g$.
    Thus $B \[ u \]$, and then its invariant ring, is finite over the image of the ring of the corresponding chart
    of $C times "Proj" S$. The morphism into $C times "Proj" S$ is finite, so $pi$ is proper.
    For $u eq.not 0$ it is visibly an isomorphism.
  At a point of the zero section, the completed local quotient is the quotient by its stabilizer $mu_m$.
    The stabilizer action on $u$ is faithful. If an element acted trivially on the slice tangent space,
    it would also act trivially on the orbit tangent line, hence on the tangent space of the smooth punctured
    cone. Finite-group linearization would make it the identity near the point, and then on the irreducible cone.
    Effectiveness excludes this for a nonidentity element. Hence the slice representation is faithful.
    A nonidentity element fixes only $u = 0$ and a proper subset of the slice,
    so the total quotient has no codimension-one ramification.
    In the completed quotient, the invariant equation $u^m$ cuts out $m E$.
    Cartierness descends from completion, which is faithfully flat, so $m E$ is locally Cartier on $tilde(C)$.
  Let $eta$ be the homogeneous canonical generator. On the smooth chart its pullback has the form
  $ u^(r - 1) thin d u and beta \, $
  where $beta$ is a nonvanishing local top form on the slice.
    This follows from homogeneity and from the absence of zeros or poles away from $u = 0$.
    The quotient is étale in codimension one, giving the asserted relative canonical coefficient.
    Finally the smooth pair with boundary $u = 0$ is lc and descends to $\( tilde(C) \, E \)$.
    This is also the orbifold-cone construction in [12] Section 2 and Proposition 2.1. ◻
]

#prodef([Remark 3.2.])[
  At a generic smooth base point, the same construction works for any normal $bb(Q)$-Gorenstein positively graded
    cone. If a homogeneous generator of a reflexive pluricanonical power of index $q$ has weight $w$,
    its effective degree valuation has discrepancy $w \/ q$. Indeed the pullback of that generator has $u$-order
    $w - q$. We will use this only to infer positivity of a canonical weight on a klt surface cone.
] <rem:degree>

Write

$ sum_(j gt.eq 0) \( dim S_j \) e^(- s j) = h / s^4 + O \( s^(- 3) \) quad \( s arrow.b 0 \) . $

Then $h$ is the volume of the degree valuation.

#thm([Lemma 3.3.])[
  #emph[If a punctured-cone point has stabilizer order $m$, then for every rational $alpha > 0$,
#[#set math.equation(numbering: n => "(3.1)")
 $ V lt.eq \( r + 3 alpha \)^4 thin frac(h, \( 1 + alpha \( m h \)^(1 \/ 3) \)^3) . $ <eq:jet-volume>]

]
] <lem:jet>

#proof[
  On the smooth algebraic slice cover of a chart in Lemma 4, take the monomial valuation $w_alpha$ with weights
  $ \( 1 \, alpha \, alpha \, alpha \) $
  in $u$ and regular slice parameters centered at the chosen lift.
    Restrict it to the subfield $K \( C \)$, setting $v_alpha = w_alpha \|_(K \( C \))$.
    This valuation is proportional to a prime divisor over $C$;
    we retain this scaling instead of normalizing its value group.
    It is centered exactly at $o$, since every positive-degree function has positive value.
    The finite-map discrepancy formula on the algebraic slice cover, which is étale in codimension one,
    and Lemma 4 then give
  $ A_C \( v_alpha \) = \( 1 + 3 alpha \) + \( r - 1 \) = r + 3 alpha . $
  For $f_j in S_j$,
  $ v_alpha \( f_j \) = j + alpha "ord" \( f_j \|_(upright("slice")) \) . $
  A sum of distinct homogeneous degrees takes the minimum of these values:
    the corresponding Taylor series have distinct powers of the independent variable $u$.
  For a cutoff $N$, the image of $S_j$, $0 lt.eq j < N$, in the quotient by the valuation ideal is the image of
    its slice-jet evaluation map. Its dimension is at most
  $ min #h(-0.16667em) {dim S_j \, med dim #scale(x: 120%, y: 120%)[\(]
    upright("slice jets of order ") < \( N - j \) \/ alpha upright(" in character ") j #scale(x: 120%, y: 120%)[\)]} . $
  After linearizing the cyclic slice action, its three character weights generate $bb(Z) \/ m bb(Z)$.
    Counting nonnegative lattice points in a simplex in a fixed congruence class therefore gives
  #[#set math.equation(numbering: n => "(3.2)")
   $ dim \( upright("one character of jets of order ") < ell \) = frac(ell^3, 6 m) +
     O \( \( ell + 1 \)^2 \) . $ <eq:jets>]
  For example, in boxes of side $m$ each character has exactly $m^2$ representatives;
    boxes meeting the simplex boundary contribute $O \( ell^2 \)$.
  Also
  #[#set math.equation(numbering: n => "(3.3)")
   $ dim S_j = h / 6 j^3 + O \( \( j + 1 \)^2 \) . $ <eq:hilbert-leading>]
  To see that its leading coefficient has no periodic oscillation,
    choose a period for the eventual Hilbert quasipolynomial.
    Multiplication by a nonzero homogeneous element injects one residue class into its translate,
    comparing their cubic leading coefficients. Iterating the translation around its finite cycle forces equality.
    Since the grading is effective, the occurring degrees generate $bb(Z)$;
    all residue classes thus have the same leading coefficient,
    whose value is determined by the displayed expansion defining $h$.
  Summing (3.2) and (3.3), multiplying by $4 ! \/ N^4$, and taking $N arrow.r oo$ gives
  $ "vol" \( v_alpha \) lt.eq 4 integral_0^1 min #h(-0.16667em) {h z^3 \, frac(\( 1 - z \)^3, m alpha^3)} thin d z . $
  Localization at the vertex does not change these finite lengths.
    The two integrands cross at $z_0 = \( 1 + alpha \( m h \)^(1 \/ 3) \)^(- 1)$; integration gives
  $ 4 integral_0^1 min #h(-0.16667em) {h z^3 \, frac(\( 1 - z \)^3, m alpha^3)} thin d z =
    frac(h, \( 1 + alpha \( m h \)^(1 \/ 3) \)^3) . $
  Testing the divisorial infimum with $v_alpha$ proves (3.1). ◻
]

#thm([Proposition 3.4.])[
  #emph[For all integral gradings sufficiently close to the minimizing ray in Proposition 3,
    every stabilizer order on $C \\ { o }$ satisfies
#[#set math.equation(numbering: n => "(3.4)")
 $ m < frac(r, 5 \/ 2) . $ <eq:stabilizer>]

 Consequently
#[#set math.equation(numbering: n => "(3.5)")
 $ A_C \( F \) gt.eq 3 $ <eq:discrepancy-three>]

 for every primitive prime divisor $F$ centered at $o$.]
] <prop:stabilizer>

#proof[
  Divide (3.1) by $r^4 h$ and put $delta = alpha \/ r$. If $m \/ r gt.eq 2 \/ 5$, then
  $ Q := m h r^3 gt.eq 2 / 5 r^4 h gt.eq 324 / 5 > 64 $
  and
  $ frac(V, r^4 h) lt.eq frac(\( 1 + 3 delta \)^4, \( 1 + delta Q^(1 \/ 3) \)^3) . $
  For fixed $delta > 0$, the right side decreases with $Q$.
    At $Q = 324 \/ 5$, its derivative with respect to $delta$ at zero is $12 - 3 \( 324 \/ 5 \)^(1 \/ 3) < 0$.
    Choose one sufficiently small positive rational $delta$. Its value at $Q =
    324 \/ 5$ is then a fixed number $kappa < 1$, which bounds the right side for every $Q gt.eq 324 \/ 5$.
    This contradicts $V \/ \( r^4 h \) arrow.r 1$ along any sequence of offending gradings approaching the
    minimizing ray. Notice that $alpha = r delta$ is rational.
    The error constants in Lemma 6 need not be uniform in the grading:
    the cutoff limit was already taken for each individual valuation.
  Fix a grading satisfying (3.4). Properness centers any $F$ as in the statement inside $E$.
    At a point of its center with stabilizer order $m$, local Cartierness gives
  $ m "ord"_F \( E \) in bb(Z)_(> 0) \, wide "ord"_F \( E \) gt.eq 1 \/ m . $
  Using the lc pair in Lemma 4,
  $ A_C \( F \) = A_(tilde(C) \, E) \( F \) + r "ord"_F \( E \) gt.eq r \/ m > 5 \/ 2 . $
  Since $K_C$ is Cartier, $A_C \( F \)$ is an integer, proving (3.5).
    In particular $C$ is terminal, since it is smooth away from $o$. ◻
]

Fix this grading for the rest of the proof. Rescale its degrees by

#[#set math.equation(numbering: n => "(3.6)")
 $ y = lambda j \, wide lambda = frac(5 \/ 2, r) \, wide D = 5 / 3 . $ <eq:rescale>]

We call $y$ a #emph[weight]. The canonical weight is $5 \/ 2$ and

#[#set math.equation(numbering: n => "(3.7)")
 $ lambda m < 1 quad upright("at every point of ") C \\ { o } . $ <eq:spectral-assumption>]

The primitive orders in (3.5) are unchanged by this rescaling. The constants satisfy $\( 3 \/ 2 \) D = 5 \/ 2$:
  a boundary constructed from a threshold at most $3 \/ 2$ and functions of weights below $D$ will have total
  weight strictly below the canonical weight. This strict inequality will exclude the vertex as a log canonical
  center in Section 5.

== 4 Hilbert series and short weights <sec:hilbert>

The stabilizer bound will make certain weighted sums of Hilbert coefficients equal exact polynomial integrals.
  Sign-changing Fourier tests will then force functions of weight below $D$;
  the lower-dimensional versions will be applied to log canonical centers in Section 5.

We first work with a general finitely generated positively graded normal Cohen–Macaulay domain $T$, with $T_0 =
  bb(C)$ and dimension $n gt.eq 1$. Integer degrees are rescaled by $lambda > 0$,
  so all weights lie in $lambda bb(Z)$. The canonical module $omega_T$ carries the natural action on forms.
  Assume that every nonvertex stabilizer order $m$ satisfies $lambda m < 1$. The action on $T$ need not be effective.

Let

$ H_T \( s \) = sum_y \( dim T_y \) e^(- s y) . $

If its polar part at zero is

$ sum_(j = 0)^(n - 1) frac(a_j j !, s^(j + 1)) \, wide upright("put") wide P_T \( y \) = sum_(j = 0)^(n - 1) a_j y^j . $

The leading coefficient of $P_T$ is positive. Define the signed measure

#[#set math.equation(numbering: n => "(4.1)")
 $ mu_T = sum_y dim T_y thin delta_y + \( - 1 \)^(n - 1) sum_y dim \( omega_T \)_y thin delta_(- y) . $ <eq:measure>]

Its coefficients have polynomial growth.

#thm([Lemma 4.1.])[
  (Hilbert-series identity).  #emph[If $F$ is a Schwartz function whose smooth Fourier transform,
    in the convention $hat(F) \( t \) = integral_(bb(R)) F \( y \) e^(- 2 pi i y t) thin d y$,
    is supported in $\( - 1 \, 1 \)$, then
#[#set math.equation(numbering: n => "(4.2)")
 $ integral_(bb(R)) F thin d mu_T = integral_(bb(R)) F \( y \) P_T \( y \) thin d y . $ <eq:hilbert-identity>]

]
] <lem:hilbert>

#proof[
  Write the integer-graded Hilbert series as $H \( z \)$, where $z = e^(- lambda s)$.
    It is rational with denominator a product of factors $1 - z^d$.
  A pole at a root of unity $zeta eq.not 1$ requires a point other than the vertex fixed by the grading element
    $zeta$. Indeed, if no such point exists, the homogeneous functions whose characters at $zeta$ are nontrivial
    cut out only the vertex. Choose finitely many of them with the same zero locus.
    Their Koszul homology modules have finite length, and the graded Euler characteristic gives
  $ H \( z \) product_i \( 1 - z^(d_i) \) = upright("a polynomial") . $
  None of the factors on the left vanishes at $zeta$, excluding a pole there.
  If such a pole root has order $d$, then $d$ divides the stabilizer order of a nonvertex fixed point.
    Thus $lambda d < 1$. Every nonzero frequency $t$ with $e^(- 2 pi i lambda t) =
    zeta$ has absolute value at least $1 \/ \( lambda d \) > 1$.
    For the identity root the nonzero frequencies are $k \/ lambda$, also outside $\[ - 1 \, 1 \]$,
    because the stabilizer assumption implies $lambda < 1$.
  Graded canonical duality gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ H_(omega_T) \( z \) = \( - 1 \)^n H \( z^(- 1) \) . $ <eq:duality>]
  One can obtain this identity by dualizing a graded free resolution over a weighted polynomial ring into its
    canonical module; Cohen–Macaulayness leaves just the relevant Ext module.
    This fixes the grading by the natural action on forms. See also [20] Theorem 6.1(ii).
  It follows from (4.3) that $mu_T$ is the coefficient measure of the expansion of $H$ at zero minus its expansion
    at infinity. A finite Laurent-polynomial part cancels exactly between these expansions.
    For a partial-fraction term $\( 1 - z \/ zeta \)^(- ell)$, the difference has, at every integer $k$, coefficient
  $ binom(k + ell - 1, ell - 1) zeta^(- k) \, $
  where the binomial is interpreted as a polynomial in $k$.
    Thus $mu_T$ is a sum of polynomially weighted lattice combs at the pole frequencies.
  Poisson summation for polynomial times Schwartz functions now annihilates every nonzero frequency.
    If $Q \( k \)$ is the coefficient polynomial at the root $1$,
    the surviving density is $Q \( y \/ lambda \) \/ lambda$. This is exactly $P_T \( y \)$:
    the polar part obtained by summing each monomial on the positive lattice is its Laplace integral, using
  $ integral_0^oo y^j e^(- s y) thin d y = frac(j !, s^(j + 1)) . $
  Other roots give functions holomorphic at $s = 0$. This proves (4.2). ◻
]

To force a function weight in $\( 0 \, D \)$, we will choose a test for which the signed atoms of $mu_T$ give one
  inequality and the polynomial integral gives the opposite one.
  The two- and three-dimensional tests will use two additional facts:
  the reflected canonical atoms lie strictly to the left of zero,
  and the coefficient of $y^(n - 2)$ in $P_T$ is positive. A homogeneous injection from a reflexive canonical
  power into $T$ that lowers weights by a positive amount supplies both, even when the canonical module is not free.

#thm([Lemma 4.2.])[
  (Canonical-module positivity).  #emph[Suppose $n gt.eq 2$. If there is a homogeneous injection
#[#set math.equation(numbering: n => "(4.4)")
 $ omega_T^(\[ q \]) arrow.r T $ <eq:injection>]

 lowering weights by $e > 0$, for some integer $q gt.eq 1$,
   then every nonzero homogeneous section of $omega_T$ has positive weight,
   and the coefficient of $y^(n - 2)$ in $P_T$ is positive. Here $M^(\[ q \]) = \( M^(⊗ q) \)^(* *)$ denotes a
   reflexive power.]
] <lem:canonical-positive>

#proof[
  A canonical section of weight $w$ has nonzero $q$-th power in the rank-one reflexive module.
    Its image under (4.4) has weight $q w - e gt.eq 0$, so $w gt.eq e \/ q > 0$.
  Write the two highest pole terms as
  $ H_T \( s \) = L / s^n + L_1 / s^(n - 1) + dots.h.c . $
  By (4.3), those for $omega_T$ are $L \/ s^n - L_1 \/ s^(n - 1)$.
  For a rank-one graded reflexive module $M$, denote its subleading coefficient by $B \( M \)$. We claim
  #[#set math.equation(numbering: n => "(4.5)")
   $ B \( M^(\[ q \]) \) - B \( T \) = q #scale(x: 120%, y: 120%)[\(] B \( M \) -
     B \( T \) #scale(x: 120%, y: 120%)[\)] . $ <eq:reflexive-add>]
  Choose a nonzero homogeneous section of $M$, of weight $a$, and form
  $ 0 arrow.r T \( - a \) arrow.r M arrow.r Q arrow.r 0 . $
  Every rank-one module here has leading coefficient $L$, and
  $ B \( M \) - B \( T \) = - a L + b \( Q \) \, $
  where $b \( Q \)$ is the coefficient of $s^(- \( n - 1 \))$ in $H_Q$.
    A graded prime filtration expresses $b \( Q \)$ as the sum, over height-one primes $frak(p)$,
    of the length of $Q_(frak(p))$ times the leading coefficient of $T \/ frak(p)$.
    Shifts of these factors do not change that leading coefficient.
    At such a prime, $T_(frak(p))$ is a DVR and $M_(frak(p))$ is free of rank one.
    Powering the chosen section multiplies its zero order, hence that quotient length, by $q$;
    its weight becomes $q a$. This proves (4.5). Terms in codimension at least two affect only lower poles,
    so reflexive powers need not be Cohen–Macaulay.
  Applying (4.5) to $omega_T$ gives
  $ B \( omega_T^(\[ q \]) \) = \( 1 - 2 q \) L_1 . $
  The image in (4.4) has Hilbert series $e^(e s) H_(omega_T^(\[ q \])) \( s \)$.
    The quotient in $T$ has dimension at most $n - 1$, so its coefficient of $s^(- \( n - 1 \))$ is nonnegative, whence
  $ \( 1 - 2 q \) L_1 + e L lt.eq L_1 . $
  Thus $L_1 gt.eq e L \/ \( 2 q \) > 0$. Since $L_1 = \( n - 2 \) ! a_(n - 2)$, the claimed sign follows. ◻
]

The Hilbert-series identity now converts a sign condition on the summands of the discrete pairing into an
  inequality for a polynomial integral. We will multiply the squared absolute value of a band-limited function by
  a polynomial chosen to have the required sign, and evaluate the integral from a few moments.
  The following profiles provide the needed moment values while permitting approximation by the Schwartz tests in
  Lemma 8. Define

$ g_b \( x \) = integral_(- 1 \/ 2)^(1 \/ 2) cos^b \( pi t \) e^(2 pi i x t) thin d t \, wide b = 1 \, 2 \, 3 . $

Here $H^b \( bb(R) \)$ is the Sobolev space of square-integrable functions whose weak derivatives through order
  $b$ are square-integrable. The zero-extended frequency profile belongs to $H^b \( bb(R) \)$:
  its boundary traces through order $b - 1$ vanish. Smooth functions supported strictly inside
  $\( - 1 \/ 2 \, 1 \/ 2 \)$ approximate it in $H^b$. Their transforms converge in weighted $L^2$,
  controlling all moments of the squared transform through degree $2 b$,
  and at every fixed point by $L^1$ convergence of the profiles.
  Translation and the finite linear combinations used below preserve these properties; parity can be preserved.

For each smooth approximant, a polynomial times its squared absolute transform is a valid test in Lemma 8:
  the Fourier transform of the squared absolute value is a convolution supported compactly inside
  $\( - 1 \, 1 \)$, and polynomial multiplication differentiates it without enlarging its support.
  We first obtain a support inequality for that test and then pass only its polynomial integrals and finitely many
  fixed evaluations to the limit. We never need to interchange a limit and an infinite discrete sum.

Plancherel gives the following centered moments, normalized by mass:

#[#set math.equation(numbering: n => "(4.6)")
 $ frac(integral x^2 \| g_1 \( x \) \|^2 thin d x, integral \| g_1 \( x \) \|^2 thin d x) = 1 / 4 \, wide
   frac(integral x^2 \| g_2 \( x \) \|^2 thin d x, integral \| g_2 \( x \) \|^2 thin d x) =
   frac(integral x^4 \| g_2 \( x \) \|^2 thin d x, integral \| g_2 \( x \) \|^2 thin d x) = 1 /
   3 . $ <eq:basic-moments>]

The masses are $1 \/ 2$ and $3 \/ 8$, respectively. These identities follow by integrating squared derivatives of
  the profiles, with factors $\( 2 pi \)^(- 2 j)$.

#thm([Proposition 4.3.])[
  (Short-interval nonvanishing).  #emph[Let $D = 5 \/ 3$.]
  + #emph[The ring $S$, with the rescaled grading (3.6), has a nonzero homogeneous element of weight in $\( 0 \, D \)$.]
  + #emph[Let $T$ satisfy the hypotheses of Lemma 8, with $n = 2$ or $3$,
    and admit an injection (4.4) lowering weights by a positive amount.
    Then $T$ has a nonzero homogeneous element of weight in $\( 0 \, D \)$.]
] <prop:short>

#proof[
  #emph[The four-dimensional ring $S$.] Put $p = 5 \/ 4$ and translate the coordinate by $x = y + p$.
    The canonical generator has weight $2 p$, so the measure in (4.1) becomes odd:
    a positive atom at $x = y + p gt.eq p$ is paired with its negative mirror.
    The constant function gives masses $1 \, - 1$ at $p \, - p$.
    The polynomial density is therefore odd as well, by uniqueness of the zero-frequency part in Lemma 8.
    Indeed, arbitrary Fourier-transform jets at zero detect every coefficient of a polynomial. Write it as
  $ a \( x^3 + c x \) \, wide a = frac(h, 6 lambda^4) = frac(r^4 h, 6 \( 5 \/ 2 \)^4) gt.eq 432 / 625 . $
  The test $x \| g_2 \( x \) \|^2$, understood through the approximants above,
    has nonnegative pairing with the odd measure. The second and fourth moments in (4.6) both equal one third of
    the mass, so this test gives $a \( 1 + c \) integral \| g_2 \|^2 \/ 3 gt.eq 0$, hence $c gt.eq - 1$.
  Suppose that no function has weight in $\( 0 \, D \)$, and set $l = p + D = 35 \/ 12$.
    For an even transform $g$, the test $x \( l^2 - x^2 \) \|
    g \( x \) \|^2$ has nonpositive signed contributions at every supported atom except the pair at $plus.minus
    p$. At $plus.minus l$ it vanishes. Hence
  #[#set math.equation(numbering: n => "(4.7)")
   $ a integral_(bb(R)) \( x^4 + c x^2 \) \( l^2 - x^2 \) \| g \( x \) \|^2 thin d x lt.eq
     2 p \( l^2 - p^2 \) \| g \( p \) \|^2 . $ <eq:four-test>]
  To choose a test, write $M_(2 j) = integral_(bb(R)) x^(2 j) \| g \( x \) \|^2 thin d x$. The left side of (4.7) is
  $ a #scale(x: 120%, y: 120%)[\[] \( l^2 M_4 - M_6 \) + c \( l^2 M_2 - M_4 \) #scale(x: 120%, y: 120%)[\]] . $
  We seek $l^2 M_2 - M_4 > 0$, so that $c gt.eq - 1$ gives a lower bound.
    The remaining moment expression must then dominate the contribution of the constant atoms at $plus.minus p$.
    The explicit choice
  $ g \( x \) = g_3 \( x - 1 \) + g_3 \( x + 1 \) $
  meets these requirements. Its frequency profile is
  $ 2 cos \( 2 pi t \) cos^3 \( pi t \) = cos \( pi t \) + 3 / 4 cos \( 3 pi t \) + 1 / 4 cos \( 5 pi t \) . $
  It has even smooth approximants in $H^3$. Orthogonality of these three modes and Plancherel give
  $ M_(2 j) = 1 / 2 [\( 1 \/ 2 \)^(2 j) + 9 / 16 \( 3 \/ 2 \)^(2 j) + 1 / 16 \( 5 \/ 2 \)^(2 j)] \, wide j = 0 \,
    1 \, 2 \, 3 \, $
  and thus
  $ M_2 = 61 / 64 \, wide M_4 = 685 / 256 \, wide M_6 = 11101 / 1024 . $
  In particular,
  $ l^2 M_2 - M_4 = 50065 / 9216 > 0 \, wide l^2 \( M_4 - M_2 \) - M_6 + M_4 = 26581 / 4096 > 0 . $
  Using first $c gt.eq - 1$ and then $a gt.eq 432 \/ 625$, the left side of (4.7) is at least
  $ 432 / 625 dot.op 26581 / 4096 = 717687 / 160000 . $
  Direct integration of the cosine expansion gives
  $ g_3 \( v \) = frac(12 cos \( pi v \), pi \( 1 - 4 v^2 \) \( 9 - 4 v^2 \)) \, $
  with removable singularities understood. Therefore
  $ g \( p \) = frac(1088 sqrt(2), 1155 pi) < 544 / 1155 < 1 / 2 . $
  The right side of (4.7) is consequently less than $625 \/ 144$. This is impossible, since
  $ 717687 / 160000 - 625 / 144 = 209183 / 1440000 > 0 . $
  Every integral used here has polynomial degree at most six after multiplication by the density,
    so the stated $H^3$ approximation suffices.
  #emph[Dimension three.] Lemma 9 gives
  $ P_T \( y \) = a \( y^2 + u y + c \) \, wide a > 0 \, quad u > 0 . $
  The measure $mu_T$ is positive. Testing with $\| g_1 \( y + u \/ 2 \) \|^2$ and using (4.6) gives
  $ c - u^2 \/ 4 gt.eq - 1 \/ 4 . $
  All reflected canonical atoms lie at strictly negative weights, by Lemma 9.
    If $T$ has no weights in $\( 0 \, D \)$, the measure thus has no atom in that interval.
    Put $d = D \/ 2 = 5 \/ 6$. The test
  $ y \( D - y \) \| g_2 \( y - d \) \|^2 $
  is nonpositive on the support of the measure, so its integral is at most zero.
    After division by $a$ and by the mass of $\| g_2 \|^2$, its polynomial integral is
  $ \( d^2 - 1 / 3 \) \( d^2 + u d + c \) + d^2 / 3 - 1 / 3 . $
  Because $d^2 - 1 \/ 3 > 0$, $u > 0$, and $c gt.eq u^2 \/ 4 - 1 \/ 4$, this is at least
  $ \( d^2 - 1 / 3 \) \( d^2 - 1 / 4 \) + d^2 / 3 - 1 / 3 = 19 / 324 > 0 \, $
  a contradiction.
  #emph[Dimension two.] Now $P_T \( y \) = a \( y + c \)$, with $a \, c > 0$,
    and the reflected canonical atoms are negative both in location and in sign.
    If $\( 0 \, D \)$ contains no function weight, the test
  $ y^2 \( D - y \) \| g_2 \( y - beta \) \|^2 \, wide beta = 2 / 3 \, $
  has nonpositive pairing with $mu_T$: it is nonnegative at negative locations, vanishes at zero,
    and is nonpositive at every positive atom. On the other hand, using the centered moments (4.6),
    its polynomial integral divided by $a$ and the mass is
  $ \( D - beta \) beta^3 + frac(3 D beta - 6 beta^2, 3) - 1 / 3 +
    c (\( D - beta \) beta^2 + frac(D - 3 beta, 3)) = 5 / 27 + c / 3 > 0 . $
  This is the final contradiction. The last two cases use moments through degree four,
    supplied by the $H^2$ approximation. ◻
]

== 5 The log canonical threshold <sec:threshold>

We now return to the cone $C$, the fixed grading (3.6), and the stabilizer bound (3.7).

#thm([Proposition 5.1.])[
  #emph[At the vertex,
$ "lct"_o \( C \; frak(m)_o \) > 3 / 2 . $

]
] <prop:threshold>

#proof[
  Suppose instead that the threshold is at most $3 \/ 2$. We will construct a homogeneous lc pair whose boundary
    weight is less than $5 \/ 2$ and on whose lc centers every function of weight in $\( 0 \, D \)$ vanishes.
    A minimal lc center will have positive dimension, and Proposition 10(b),
    together with the elementary curve case, will give a contradiction.
  Take a homogeneous vector-space basis $f_1 \, dots.h \, f_s$ of
  $ xor.big_(0 < y < D) S_y . $
  This space is finite-dimensional and nonzero by Proposition 10(a).
    Write $w_i = "wt" \( f_i \)$ and $d_0 = max_i w_i < D$. Choose a common weight $B$ such that all $B \/
    w_i$ are positive integers, and put
  $ frak(b) = \( f_i^(B \/ w_i) : 1 lt.eq i lt.eq s \) . $
  For every divisor $F$ centered at $o$,
  $ d_0 / B "ord"_F \( frak(b) \) = min_i d_0 / w_i "ord"_F \( f_i \) gt.eq "ord"_F \( frak(m)_o \) . $
  These divisors suffice to test the maximal-ideal threshold. The ideal $frak(b)$ need not be $frak(m)_o$-primary:
    its threshold also allows other centers containing $o$, so testing only divisors centered at $o$ gives an
    upper bound. Thus, for
  $ t = "lct"_o \( C \; frak(b)^(d_0 \/ B) \) \, $
  we have
  #[#set math.equation(numbering: n => "(5.1)")
   $ 0 < t lt.eq 3 / 2 \, wide t d_0 < 5 / 2 . $ <eq:threshold-numerics>]
  The threshold is positive, finite and rational, as is seen on a log resolution.
  Set $c = t d_0 \/ B$. Choose sufficiently many general divisors $H_1 \, dots.h \,
    H_N$ from the linear system spanned by the powered functions and form
  $ G = c / N \( H_1 + dots.h.c + H_N \) . $
  Choose $N > c$, with generality on a log resolution of $frak(b)$. To justify the properties needed below, write
  $ frak(b) thin cal(O)_Y = cal(O)_Y \( - F \) \, wide K_Y + Delta_Y = pi_Y^(*) K_C . $
  After removing $F$, the transformed system is base-point-free.
    Its general members $M_j$ meet the existing strata with simple normal crossings, and the log pullback of $G$ is
  $ Delta_Y + c F + c / N sum_j M_j . $
  The fixed coefficients are at most one, with some equal to one at the threshold;
    each moving coefficient is less than one. Hence $\( C \, G \)$ is lc near $o$, and has an lc center.
    Every lc center is the image of a stratum of coefficient-one fixed components and lies in the common zero
    locus of the $f_i$. Indeed $\( C \, 0 \)$ is klt, so such a fixed component has positive order on $frak(b)$.
    If the original system is one-dimensional, its moving part is empty and the same argument applies.
  Each equation of $H_j$ is homogeneous of weight $B$. The pair is invariant, with total boundary weight $t d_0$.
    It is globally lc: a nonempty closed invariant non-lc locus would contain $o$,
    because every grading orbit specializes to $o$. The finite collection of lc centers is fixed termwise by the
    connected group $bb(G)_m$, and each center contains $o$.
  We first show that $o$ itself is not an lc center. On the extraction of Lemma 4,
    write $tilde(G)$ for the strict transform. In each smooth finite chart,
    its equations depend only on the slice parameters, by homogeneity.
    Since the pair is lc for $u eq.not 0$, the slice pair is lc.
    Taking its product with the line and adding $u = 0$ preserves log canonicity, and finite descent gives
  $ \( tilde(C) \, E + tilde(G) \) quad upright("lc") . $
  The total coefficient of $E$ in $pi^(*) G$ is $t d_0 \/ lambda$, so
  $ K_(tilde(C)) + E + tilde(G) = pi^(*) \( K_C + G \) + \( r - t d_0 \/ lambda \) E . $
  Every divisor $F'$ centered exactly at $o$ has center on $tilde(C)$ inside $E$. Thus
  $ A_(C \, G) \( F' \) = A_(tilde(C) \, E + tilde(G)) \( F' \) + \( r - t d_0 \/ lambda \) "ord"_(F') \( E \) > 0 $
  by (5.1) and (3.6). This excludes the vertex as an lc center.
  Choose a minimal lc center $Z$. It is positive-dimensional by the preceding argument and proper because it lies
    in the zero locus of the nonzero functions $f_i$, so
  $ 1 lt.eq dim Z lt.eq 3 . $
  The affine subadjunction theorem [5] Theorem 7.2 supplies an effective boundary on $Z$ making it klt.
    Its hypotheses hold: $C$ is normal affine, $G$ is an effective rational boundary, $K_C +
    G$ is $bb(Q)$-Cartier, and $\( C \, G \)$ is lc. In particular, $Z$ is normal with rational singularities,
    hence Cohen–Macaulay; this implication for klt pairs does not require $K_Z$ itself to be $bb(Q)$-Cartier [7]
    Theorem 120.
  Let $I_Z subset S$ be its homogeneous prime ideal and put $T = S \/ I_Z$.
    The grading on $T$ is the one induced by the original $bb(G)_m$-action.
    Its stabilizer at each nonvertex point of $Z$ is the same as the stabilizer of that point in $C$,
    so $lambda m < 1$ holds even if this action on $Z$ has a kernel.
    Moreover, each graded piece $T_y$ is the image of $S_y$. Every basis element $f_i$ vanishes on $Z$; hence
  $ T_y = 0 wide \( 0 < y < D \) . $
  For $dim Z = 2$ or $3$, Proposition 10(b) will contradict this vanishing once we construct a homogeneous
    injection $omega_T^(\[ q \]) arrow.r T$ lowering weights by a positive amount.
    The curve case follows directly from the stabilizer bound.
  #emph[If $dim Z = 1$:] a normal affine curve is regular at the vertex.
    A homogeneous generator of its cotangent space generates its positive ideal by graded Nakayama and
    consequently its algebra, so $T = bb(C) \[ z \]$. The integral degree of $z$ is the stabilizer order at a
    nonzero point. Its weight is therefore $< 1 < D$, a contradiction.
  #emph[If $dim Z = 2$:] a klt surface pair has $bb(Q)$-factorial underlying surface;
    see [4] Proposition 7.2 and Corollary 7.15. Removing the effective boundary makes $Z$ itself
    $bb(Q)$-Gorenstein and klt. Some $omega_T^(\[ q \])$ is free at the vertex,
    so graded Nakayama gives a global homogeneous generator.
  Its weight is positive. Indeed, divide the integral grading by its common factor to make it effective.
    The ineffective kernel acts identically on the variety and hence on its natural differential forms,
    so the intrinsic action on forms descends to that grading.
    Remark 5 identifies the generator’s weight divided by $q$ with the degree discrepancy,
    which is positive by klt. Restoring the positive common factor preserves the sign.
    Sending the generator to $1$ gives the injection in Lemma 9, lowering weights by a positive amount.
    Proposition 10(b) gives the contradiction.
  #emph[If $dim Z = 3$:] set $V^compose = C \\ { o }$ and $U = Z \\ { o }$.
    The prime divisor $U$ is Cartier on smooth $V^compose$, even where $U$ itself is singular.
    Equivariant dualizing-sheaf adjunction gives
  $ omega_U tilde.eq \( omega_(V^compose) ⊗ cal(O)_(V^compose) \( U \) \) \|_U . $
  This is Cartier-divisor duality, as in [21] Section 48.14.
    Applying duality to the natural Cartier sequence for $U$ is compatible with the grading action,
    so the isomorphism carries the natural weights of differential forms.
  Choose a nonzero $f_i$, write $b = "wt" \( f_i \) < D$, and put $q = "ord"_Z \( f_i \) gt.eq 1$.
    Multiplication by $f_i$ defines
  $ cal(O)_(V^compose) \( q U \) arrow.r cal(O)_(V^compose) . $
  Locally, if $U = \( h \)$, this sends $h^(- q)$ to $f_i \/ h^q$.
    Its restriction to $U$ is generically nonzero because the order along $U$ is exactly $q$.
    If $eta$ is the canonical generator of $C$, divide the canonical factor in adjunction by $eta^q$ and apply
    this multiplication map. We obtain
  $ omega_U^(⊗ q) arrow.r cal(O)_U $
  of degree $b - q \( 5 \/ 2 \)$, lowering weights by $q \( 5 \/ 2 \) - b > 0$.
  The omitted vertex has codimension three in the normal variety $Z$.
    For $j : U arrow.r.hook Z$, reflexive extension therefore gives
  $ j_(*) cal(O)_U = cal(O)_Z \, wide j_(*) \( omega_U^(⊗ q) \) = omega_Z^(\[ q \]) \; $
  see [21] Lemma 31.13.12. Pushing forward the map yields a homogeneous injection
  $ omega_T^(\[ q \]) arrow.r T $
  of the same degree: it is injective because its source is torsion-free of rank one and it is generically
    nonzero. No $bb(Q)$-Gorenstein hypothesis on all of $Z$ is needed. Proposition 10(b) gives the last contradiction. ◻
]

== 6 A terminal threefold section and the main theorem <sec:finish>

#thm([Proposition 6.1.])[
  #emph[For the cone $C$ of Proposition 3, a general affine hyperplane section through $o$ is a terminal
    Gorenstein threefold near $o$. In particular,
$ "edim" \( o \, C \) lt.eq 5 . $

]
] <prop:section>

#proof[
  Choose a log resolution $rho : Y arrow.r C$ of $frak(m)_o$, isomorphic away from $o$, and write
  $ frak(m)_o cal(O)_Y = cal(O)_Y (- sum_i b_i E_i) \, wide K_Y = rho^(*) K_C + sum_i \( A_i - 1 \) E_i . $
  Every exceptional divisor has center $o$, so $b_i gt.eq 1$ is an integer and $A_i gt.eq 3$ by Proposition 7.
    For a general section $H$ from the affine embedding coordinates,
  $ rho^(*) H = H_Y + sum_i b_i E_i \, $
  where $H_Y$ is smooth and transverse to the exceptional strata.
  The section $H$ is normal Gorenstein near $o$: it is a Cartier section of a Gorenstein Cohen–Macaulay fourfold,
    and is smooth away from $o$ by Bertini. Thus it is $S_2$ and $R_1$, and is generically reduced, giving normality.
  Proposition 11 yields $A_i \/ b_i > 3 \/ 2$. If $b_i gt.eq 2$, then
  $ A_i - b_i > b_i / 2 gt.eq 1 \; $
  if $b_i = 1$, the bound $A_i gt.eq 3$ gives $A_i - b_i gt.eq 2$.
    Hence every coefficient $A_i - 1 - b_i$ is strictly positive.
    Adjunction on $H_Y$ gives precisely these ordinary discrepancy coefficients along the components of
    $E_i \|_(H_Y)$. Subsequent exceptional divisors over the smooth $H_Y$ have positive ordinary discrepancy,
    and the pullback of the already effective relative canonical divisor cannot decrease it. Thus $H$ is terminal.
  A singular Gorenstein terminal threefold point is an isolated compound Du Val (cDV) point by [18] Theorem (1.1),
    hence an analytic hypersurface by [18] Section (0.5). A smooth point also has embedding dimension at most
    four. Therefore $"edim" \( o \, H \) lt.eq 4$, and quotienting by one local equation gives
  $ "edim" \( o \, C \) lt.eq "edim" \( o \, H \) + 1 lt.eq 5 . $
  ◻
]

#proof[
  If $hat("vol") \( x \, X \) < 162$, the bound is already strict. Otherwise Proposition 3 and Proposition 12 give
  $ "edim" \( x \, X \) lt.eq 5 . $
  A singular normal complex algebraic fourfold germ of embedding dimension at most five is a hypersurface.
    Here is an algebraic local argument, so no approximation or descent from a formal hypersurface is needed.
    Embed a neighborhood of $x$ in smooth affine space of dimension $N$, and put $e = "edim" \( x \, X \)$.
    The linear parts of the local defining ideal have rank $N - e$.
    Choose $N - e$ equations with independent linear parts; their common zero set is smooth of dimension $e$ near
    $x$ and contains $X$. Thus $cal(O)_(X \, x)$ is a domain quotient of a regular local ring of dimension $e$.
    The regular case $e = 4$ is excluded by singularity. Hence $e = 5$,
    and the defining ideal is a height-one prime in a regular local ring.
    Such a ring is a UFD [21] Tag 0AG0, so that prime ideal is principal.
  Liu’s lci theorem [13] Theorem 2.12 now gives $hat("vol") \( x \, X \) lt.eq 162$,
    and equality forces an ordinary double point. Conversely,
    the ordinary double point has normalized volume $2 dot.op 3^4 = 162$,
    by the same established equality theorem and ODP calculation.
    Normalized volume is unchanged under isomorphism of completed local rings [13] Lemma 2.15,
    so this gives the claimed analytic characterization. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Harold Blum, #emph[Existence of valuations with smallest normalized volume],
  Compositio Mathematica #strong[154] (2018), no.~4, 820--849.
  #link("https://doi.org/10.1112/S0010437X17008016")[doi:10.1112/S0010437X17008016].
  #link("https://arxiv.org/abs/1606.08894v3")[arXiv:1606.08894v3].]
#bibitem([2])[Anita Buckley, Miles Reid, and Shengtian Zhou, #emph[Ice cream and orbifold Riemann--Roch],
  Izvestiya: Mathematics #strong[77] (2013), no.~3, 461--486.
  #link("https://doi.org/10.1070/IM2013v077n03ABEH002644")[doi:10.1070/IM2013v077n03ABEH002644].
  #link("https://arxiv.org/abs/1208.0457v1")[arXiv:1208.0457v1].]
#bibitem([3])[Henry Cohn and Noam Elkies, #emph[New upper bounds on sphere packings I],
  Annals of Mathematics (2) #strong[157] (2003), no.~2, 689--714.
  #link("https://doi.org/10.4007/annals.2003.157.689")[doi:10.4007/annals.2003.157.689].
  #link("https://arxiv.org/abs/math/0110009")[arXiv:math/0110009].]
#bibitem([4])[Tommaso de Fernex and Christopher D. Hacon, #emph[Singularities on normal varieties],
  Compositio Mathematica #strong[145] (2009), no.~2, 393--414.
  #link("https://doi.org/10.1112/S0010437X09003996")[doi:10.1112/S0010437X09003996].
  #link("https://arxiv.org/abs/0805.1767v2")[arXiv:0805.1767v2].]
#bibitem([5])[Osamu Fujino and Yoshinori Gongyo, #emph[On canonical bundle formulas and subadjunctions],
  Michigan Mathematical Journal #strong[61] (2012), no.~2, 255--264.
  #link("https://doi.org/10.1307/mmj/1339011526")[doi:10.1307/mmj/1339011526].
  #link("https://arxiv.org/abs/1009.3996v1")[arXiv:1009.3996v1].
  Affine Theorem~7.2 is cited from the #link("https://www.math.kyoto-u.ac.jp/~fujino/subadjunction5.pdf")[author
  preprint], internal version~1.17, 12 September 2010.]
#bibitem([6])[János Kollár, #emph[Resolution of Singularities---Seattle Lecture], Preprint (2007).
  #link("https://arxiv.org/abs/math/0508332v3")[arXiv:math/0508332v3].
  Theorems~26--27 are cited with this preprint's numbering.]
#bibitem([7])[János Kollár, #emph[Canonical models], author-hosted draft chapter, 1 June 2010.
  Section~4, written in collaboration with Sándor J. Kovács, contains the cited Theorem~120.
  #link("https://web.math.princeton.edu/~kollar/book/chap2.pdf")[Author chapter].]
#bibitem([8])[Chi Li, #emph[Minimizing normalized volumes of valuations],
  Mathematische Zeitschrift #strong[289] (2018), no.~1--2, 491--513.
  #link("https://doi.org/10.1007/s00209-017-1963-3")[doi:10.1007/s00209-017-1963-3].
  #link("https://arxiv.org/abs/1511.08164v4")[arXiv:1511.08164v4].]
#bibitem([9])[Chi Li and Yuchen Liu, #emph[Kähler--Einstein metrics and volume minimization],
  Advances in Mathematics #strong[341] (2019), 440--492.
  #link("https://doi.org/10.1016/j.aim.2018.10.038")[doi:10.1016/j.aim.2018.10.038].]
#bibitem([10])[Chi Li and Minghao Miao, #emph[On the volume of K-semistable Fano manifolds], Preprint (2025;
  revised 2026). #link("https://arxiv.org/abs/2506.17420v3")[arXiv:2506.17420v3].]
#bibitem([11])[Chi Li and Chenyang Xu, #emph[Stability of valuations:
  higher rational rank], Peking Mathematical Journal #strong[1] (2018), no.~1, 1--79.
  #link("https://doi.org/10.1007/s42543-018-0001-7")[doi:10.1007/s42543-018-0001-7].
  #link("https://arxiv.org/abs/1707.05561v2")[arXiv:1707.05561v2].]
#bibitem([12])[Chi Li and Zhengyi Zhou, #emph[Minimal log discrepancy and orbifold curves],
  Journal of Mathematical Study #strong[59] (2026), no.~1, 1--15.
  #link("https://doi.org/10.4208/jms.v59n1.26.01")[doi:10.4208/jms.v59n1.26.01].
  #link("https://arxiv.org/abs/2502.11847v1")[arXiv:2502.11847v1].]
#bibitem([13])[Yuchen Liu, #emph[K-stability of cubic fourfolds],
  Journal für die reine und angewandte Mathematik #strong[786] (2022), 55--77.
  #link("https://doi.org/10.1515/crelle-2022-0002")[doi:10.1515/crelle-2022-0002].
  #link("https://arxiv.org/abs/2007.14320v2")[arXiv:2007.14320v2].]
#bibitem([14])[Yuchen Liu, #emph[Optimal bounds for local volumes of threefold singularities], Preprint (2025;
  revised 2026). #link("https://arxiv.org/abs/2512.05429v2")[arXiv:2512.05429v2].]
#bibitem([15])[Yuchen Liu and Chenyang Xu, #emph[K-stability of cubic threefolds],
  Duke Mathematical Journal #strong[168] (2019), no.~11, 2029--2073.
  #link("https://doi.org/10.1215/00127094-2019-0006")[doi:10.1215/00127094-2019-0006].
  #link("https://arxiv.org/abs/1706.01933v3")[arXiv:1706.01933v3].]
#bibitem([16])[Dario Martelli, James Sparks, and Shing-Tung Yau,
  #emph[Sasaki--Einstein manifolds and volume minimisation],
  Communications in Mathematical Physics #strong[280] (2008), 611--673.
  #link("https://doi.org/10.1007/s00220-008-0479-4")[doi:10.1007/s00220-008-0479-4].
  #link("https://arxiv.org/abs/hep-th/0603021v5")[arXiv:hep-th/0603021v5].]
#bibitem([17])[Joaquín Moraga and Hendrik Süß, #emph[Bounding toric singularities with normalized volume],
  Bulletin of the London Mathematical Society #strong[56] (2024), no.~6, 2212--2229.
  #link("https://doi.org/10.1112/blms.13052")[doi:10.1112/blms.13052].]
#bibitem([18])[Miles Reid, #emph[Minimal models of canonical 3-folds],
  in #emph[Algebraic Varieties and Analytic Varieties (Tokyo, 1981)], Shigeru Iitaka (ed.),
  Advanced Studies in Pure Mathematics 1, Kinokuniya, Tokyo, and North-Holland, Amsterdam, 1983, 131--180.
  #link("https://webhomes.maths.ed.ac.uk/cheltsov/quotient/pdf/reid2.pdf")[Original paper scan].]
#bibitem([19])[Cristiano Spotti and Song Sun, #emph[Explicit Gromov--Hausdorff compactifications of moduli spaces
  of Kähler--Einstein Fano manifolds], Pure and Applied Mathematics Quarterly #strong[13] (2017), no.~3, 477--515.
  #link("https://doi.org/10.4310/PAMQ.2017.v13.n3.a5")[doi:10.4310/PAMQ.2017.v13.n3.a5].
  #link("https://arxiv.org/abs/1705.00377v1")[arXiv:1705.00377v1].]
#bibitem([20])[Richard P. Stanley, #emph[Hilbert functions of graded algebras],
  Advances in Mathematics #strong[28] (1978), no.~1, 57--83.
  #link("https://doi.org/10.1016/0001-8708(78)90045-2")[doi:10.1016/0001-8708(78)90045-2].
  #link("https://math.mit.edu/~rstan/pubs/pubfiles/30.pdf")[Author copy].]
#bibitem([21])[The Stacks Project Authors, #emph[The Stacks Project].
  #link("https://stacks.math.columbia.edu/tag/0B4A")[Section~48.14 (Tag~0B4A)],
  #link("https://stacks.math.columbia.edu/tag/0EBJ")[Lemma~31.13.12 (Tag~0EBJ)],
  and #link("https://stacks.math.columbia.edu/tag/0AG0")[regular local rings are UFDs (Tag~0AG0)].]
#bibitem([22])[Chenyang Xu, #emph[A minimizing valuation is quasi-monomial],
  Annals of Mathematics #strong[191] (2020), no.~3, 1003--1030.
  #link("https://doi.org/10.4007/annals.2020.191.3.6")[doi:10.4007/annals.2020.191.3.6].
  #link("https://arxiv.org/abs/1907.01114")[arXiv:1907.01114].]
#bibitem([23])[Chenyang Xu and Ziquan Zhuang, #emph[Uniqueness of the minimizer of the normalized volume
  function], Cambridge Journal of Mathematics #strong[9] (2021), no.~1, 149--176.
  #link("https://doi.org/10.4310/CJM.2021.v9.n1.a2")[doi:10.4310/CJM.2021.v9.n1.a2].
  #link("https://arxiv.org/abs/2005.08303v1")[arXiv:2005.08303v1].]
#bibitem([24])[Chenyang Xu and Ziquan Zhuang, #emph[Stable degenerations of singularities],
  Journal of the American Mathematical Society #strong[38] (2025), no.~3, 585--626.
  #link("https://doi.org/10.1090/jams/1055")[doi:10.1090/jams/1055].
  #link("https://arxiv.org/abs/2205.10915v2")[arXiv:2205.10915v2].]
#bibitem([25])[Chenyang Xu and Ziquan Zhuang, #emph[Open problems in K-stability of Fano varieties],
  Preprint (2026). #link("https://arxiv.org/abs/2601.15576v2")[arXiv:2601.15576v2].]
