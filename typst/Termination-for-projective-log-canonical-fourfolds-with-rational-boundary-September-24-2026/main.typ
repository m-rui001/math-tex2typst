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

#align(center)[#text(size: 16pt, weight: "bold")[Termination for projective log canonical fourfolds \
with rational boundary]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction and statement <sec:introduction>

The minimal model program seeks to simplify a projective variety by operations on which its canonical divisor,
  or an adjoint divisor $K_X + B$, is negative. A divisorial contraction removes a divisor.
  A flip replaces a small contraction by a birational model on which the adjoint becomes relatively ample.
  The expected endpoint is a nef adjoint or a Mori fibre space.
  Existence of the required operations makes the program possible;
  termination ensures that a sequence of choices actually reaches an endpoint.
  It is stronger than the existence of one minimal model or the termination of a particular program with scaling.

The three-dimensional log minimal model program established the basic pattern;
  see #cite(label("KollarEtAl1992")) #cite(label("KM98")). In higher dimensions,
  Birkar–Cascini–Hacon–McKernan proved klt flip existence and minimal-model existence for klt pairs with big
  boundary and pseudo-effective adjoint #cite(label("BCHM")).
  Fujino’s cone and contraction theorem and Birkar’s lc flip theorem supply the corresponding operations for log
  canonical pairs #cite(label("FujinoFoundations")) #cite(label("BirkarLC")).
  In dimension four, Shokurov’s ordered-termination method constructed minimal models or Mori fibre spaces;
  Birkar gave a short proof of the klt case #cite(label("ShokurovOrdered")) #cite(label("BirkarShokurov")).
  These constructions use selected programs, and do not establish termination for every successive choice of
  negative ray.

The difficulty method studies arbitrary sequences by combining discrepancy improvement with the geometry of the
  exceptional loci. Shokurov introduced discrepancy-counting difficulty #cite(label("Shokurov1985"))
  Definition 2.15 and Corollaries 2.16–2.17. Kawamata proved termination for terminal fourfolds
  #cite(label("KMM87")), and Fujino extended the method to canonical pairs with rational boundary;
  the weighted difficulty and precise hypotheses are corrected in #cite(label("FujinoCanonical"))
  #cite(label("FujinoCanonicalAddendum")). Algebraic cycle classes account for the remaining flips of type
  $\( 2 \, 1 \)$ in these arguments. Alexeev–Hacon–Kawamata developed weighted difficulties that subtract the
  families of valuations arising along a boundary component and include cycle-rank terms on its normalization
  #cite(label("AHK")). Their Theorem 3.2 proves termination of klt fourfold flips when $- \( K_X + B \)$ is
  numerically equivalent to an effective divisor. This numerical effectivity hypothesis does not follow from
  non-pseudo-effectivity of $K_X + B$.

Arbitrary termination for pseudo-effective lc fourfolds is now available through the generalized-pair theorem of
  Chen–Tsakanikas #cite(label("ChenTsakanikas")) Theorem 1.1 and Moraga’s termination theorem
  #cite(label("Moraga2025")) Theorem 1. Both cover ordinary pairs with real boundary and impose no initial
  $bb(Q)$-factoriality in their statements about sequences of flips.
  The unrestricted theorem of Chen–Tsakanikas is three-dimensional.
  More recently, Han–Liu–Zhuang proved termination of every klt fourfold MMP with big boundary,
  including the non-pseudo-effective case #cite(label("HanLiuZhuang2025")) Corollary 3.2(3).

The result below treats ordinary lc fourfolds with rational boundary without a pseudo-effectivity or big-boundary
  hypothesis. It also includes mixed birational operations on models which need not be $bb(Q)$-factorial.
  The proof follows the difficulty approach: its additional ingredient controls the normalization branches that
  enter the correction terms when coefficients on the auxiliary terminal models continue to decrease.

We prove the projective four-dimensional case of the Termination of Flips Conjecture for ordinary log canonical
  pairs with rational boundary; see #cite(label("ChenTsakanikas")) Introduction for the conjecture and its
  generalized-pair formulation. Our program always starts from the given model.
  We first prove the theorem over $bb(C)$, where the branch estimate uses topology,
  and then transfer the full assertion to every algebraically closed characteristic-zero field.

Throughout, a pair $\( X \, B \)$ consists of a normal integral variety and an effective $bb(Q)$-divisor such that
  $K_X + B$ is $bb(Q)$-Cartier. Canonical divisors on birational models are chosen using the same rational top
  differential. For a normalized divisorial valuation $v = "ord"_E$, with $E$ on a smooth model $p : W arrow.r X$,
  our convention is

$ a \( v \; X \, B \) = 1 + "coeff"_E #scale(x: 120%, y: 120%)[\(] K_W -
  p^(*) \( K_X + B \) #scale(x: 120%, y: 120%)[\)] . $

Thus $a$ is the #emph[log discrepancy]. Its center $c_X \( v \)$ is the closed irreducible center.
  A valuation is exceptional over $X$ when this center has codimension at least two.
  Log canonical (lc) and klt mean, respectively, that every log discrepancy is nonnegative and positive.
  A terminal pair is klt and has $a \( v \; X \, B \) > 1$ for every exceptional valuation.
  The boundaries in the pair statements are effective; the crepant pullback divisors used on log resolutions may
  have negative coefficients.

#prodef([Definition 1.1.])[
  (Programs and mixed steps).  Let $\( X \, B \)$ be a projective lc pair.
    Set $\( X_0 \, B_0 \) = \( X \, B \)$ and $D_i = K_(X_i) + B_i$.
    At a non-nef stage choose any $D_i$-negative extremal ray of $overline("NE") \( X_i \)$ and its projective
    contraction
  $ f_i : X_i arrow.r Z_i \, wide \( f_i \)_(*) cal(O)_(X_i) = cal(O)_(Z_i) \, wide rho \( X_i \/ Z_i \) = 1 . $
  The target is normal, and $- D_i$ is relatively ample. Stop if $f_i$ is of fibre type.
    If it is birational, a permitted step is
  $ X_i arrow.r^(med f_i med) Z_i arrow.l^(med f_i^(+) med) X_(i + 1) \, $
  where $f_i^(+)$ is small and projective birational, possibly an isomorphism,
    $\( X_(i + 1) \, B_(i + 1) \)$ is lc, $B_(i + 1)$ is the strict transform of $\( f_i \)_(*) B_i$,
    and $D_(i + 1)$ is $bb(Q)$-Cartier and $f_i^(+)$-ample. There is no condition on $rho \( X_(i + 1) \/ Z_i \)$.
  This includes divisorial contractions, flips, and a divisorial contraction followed by a small modification.
    We call the last possibility a #emph[mixed step]. Stop at a nef adjoint as well.
    Flops, extra blowups, and inserted isomorphisms are not steps.
    A program is maximal if it is continued whenever neither stopping condition holds.
    The broader face-contracting convention in #cite(label("HanLiuZhuang2025")) Definition 2.5 also allows such
    birational diagrams; here the negative contraction is required to contract one extremal ray.
] <def:program>

#thm([Theorem 1.2.])[
  #emph[Let $k$ be an algebraically closed field of characteristic zero,
    and let $\( X \, B \)$ be a projective lc pair of dimension four with rational boundary.
    No $bb(Q)$-factoriality or pseudo-effectivity is assumed.]
  + #emph[Every negative extremal ray at every stage has the contraction and, when birational,
    a positive model required by Definition 1.]
  + #emph[Every program of Definition 1 starting from $\( X \, B \)$ has finitely many birational steps,
    for every sequence of permitted choices.]
  + #emph[Every maximal program ends either at a projective lc pair with nef adjoint, or at a Mori fibre space:
    a projective contraction with connected fibres, relative Picard number one, lower-dimensional normal base,
    and relatively ample negative adjoint.]
  #emph[An already nef input has a zero-step completed program.]
] <thm:main>

The auxiliary terminal and dlt models used in the proof retain the initial model and every prescribed downstairs
  choice. Theorem 2 is a termination statement; semiampleness of a nef endpoint requires abundance.
  Section 10 gives that consequence using #cite(label("OpenAILogAbundance2026")).
  It also obtains uniform local complements and Cartier sections at $epsilon.alt$-lc Mori endpoints over $bb(C)$
  from #cite(label("OpenAIComplements2026")) and #cite(label("OpenAICartier2026")), respectively.

=== The difficulty and the branch estimate <the-difficulty-and-the-branch-estimate>

The proof reduces termination to a numerical problem on auxiliary terminal models.
  Ranks of divisor cycle classes first remove all steps that lose divisors, including mixed steps.
  A remaining klt small tail lifts to crepant terminal junctions,
  joined by coefficient decreases and finite small terminal programs.
  The same finite set of boundary labels persists throughout this chain.
  Surface minimal log discrepancy ACC confines every label whose coefficient keeps varying to a divisor mapped
  downstairs to a curve or a point.

A weighted discrepancy count on these models has an ordinary family of contributions at each surface on a single
  boundary component. We subtract that family’s default weight locally, before summing,
  and add divisor-cycle ranks on the boundary normalizations. This produces a finite integer $cal(D)$.
  The weights are ceilings $w \( u \) = ceil.l N max { u \, 0 } ceil.r$,
  with $N$ clearing only the original and fixed coefficients;
  a valuation of log discrepancy $a$ has weight $w \( 2 - a \)$.
  At a surface $V$ with $r gt.eq 1$ varying normalization branches,
  the sum of their individual defaults can exceed the weight paid by the first blowup. The elementary inequality

$ ceil.l x_1 + dots.h.c + x_r ceil.r gt.eq sum_(j = 1)^r ceil.l x_j ceil.r - \( r - 1 \) $

identifies the possible deficit as $r - 1$. Section 4 constructs $cal(D)$ and proves this local bound,
  including the higher default contributions.

The geometric input, Theorem 17, bounds the total excess of normalization branches along surfaces of the varying
  boundary. It pays for that excess using divisor-cycle ranks of its normalized components and distinct valuations
  centered on curves, with log discrepancy below two. These are already positive terms in $cal(D)$,
  so the estimate makes $cal(D)$ nonnegative at every crepant junction.
  The branches are algebraic prime divisors over the generic field of the surface;
  residue degrees enter their cycle pushforward.

To prove the estimate, normalization relations first give a bound through weight-four degree-five cohomology.
  Projective decomposition and a support estimate isolate punctured degree-two local systems along singular
  curves. Finite monodromy and norms represent invariant classes by line bundles over each curve’s original
  function field. Formal existence and approximation extend these bundles to a pointed étale neighbourhood with
  unchanged residue field. Degrees on a small model produce distinct divisorial valuations of the original
  function field, each with zero-boundary log discrepancy two.
  The positive boundary lowers their discrepancies strictly.
  The topological and valuation arguments occupy Sections 5 and 6.

Section 7 returns to the terminal chain. Exact cancellation between normalization ranks and branch defaults makes
  $cal(D)$ nonincreasing. Every positive-side bad surface forces a unit decrease:
  the relevant endpoint discrepancy has an integral scaled deficit,
  so strict discrepancy improvement crosses a ceiling threshold. Hence only finitely many such surfaces occur.
  A second cycle-rank comparison and the graph dimension bound finish klt termination.
  Section 8 uses special termination and nonempty dlt bridges to transfer this conclusion to each prescribed lc
  program, and proves continuation through every chosen negative ray.
  Section 9 transfers an entire hypothetical countable program to $bb(C)$ and spreads the finite continuation data
  back to the stated characteristic-zero fields.

=== Foundational inputs <foundational-inputs>

We use the cone and contraction theorems, the klt existence and relative big results of BCHM,
  surface minimal log discrepancy ACC, lower-dimensional log MMP and dlt special termination,
  and Birkar’s rational complemented-pair existence theorem. Their hypotheses are specified at their applications.
  On the topological side, Deligne’s mixed Hodge theory #cite(label("Deligne1971")) #cite(label("Deligne1974")),
  the intersection complexes of Goresky–MacPherson #cite(label("GM1983")),
  and the decomposition theorem of Beilinson–Bernstein–Deligne–Gabber #cite(label("BBD1982")),
  with Saito’s Hodge-module refinement #cite(label("Saito1988")) #cite(label("Saito1989")),
  supply the weights and support bounds. Formal functions, Grothendieck existence and Artin approximation are used
  with the actual scheme fibres. Sections 2–8 work over $bb(C)$;
  the field transfer applies to every program in the theorem.
  The termination proof is independent of the companion results used for the endpoint consequences.

== 2 Graph comparisons and cycle ranks <sec:comparisons>

We work over $bb(C)$. We will reduce termination to controlling how often the positive model of a step contains a
  surface above the base locus where either morphism fails to be an isomorphism.
  The graph comparison identifies exactly where discrepancies improve, including in a mixed step.
  Ranks of algebraic cycle classes then remove the steps that lose divisors;
  after these positive-side surfaces have disappeared, a second rank comparison removes the corresponding
  negative-side surfaces as well.

We use the negativity lemma in the following form: if $q : T arrow.r V$ is projective birational,
  $E$ is an $bb(R)$-Cartier divisor, $- E$ is $q$-nef, and $q_(*) E gt.eq 0$, then $E gt.eq 0$;
  see #cite(label("KM98")) Lemma 3.39. In particular, an exceptional divisor which is relatively numerically
  trivial is zero, by applying the lemma to both signs. All varieties in this section are projective.

=== 2.1 The full bad loci <the-full-bad-loci>

Consider a birational diagram

#[#set math.equation(numbering: n => "(2.1)")
 $ X^(-) arrow.r^(thin f^(-) thin) Z arrow.l^(thin f^(+) thin) X^(+) \, $ <eq:step-diagram>]

where the varieties are normal fourfolds, the morphisms have connected fibres, $f^(+)$ is small,
  and the divisors $D^plus.minus = K_(X^plus.minus) + B^plus.minus$ are $bb(Q)$-Cartier.
  The boundary on $X^(+)$ is the strict transform of $f_(*)^(-) B^(-)$, and $-
  D^(-)$ and $D^(+)$ are ample over $Z$. The arguments here do not require the positive pair to be lc in advance.

Let $U subset Z$ be the largest open over which both morphisms are isomorphisms, and put

#[#set math.equation(numbering: n => "(2.2)")
 $ Sigma = Z \\ U \, wide W^(-) = \( f^(-) \)^(- 1) Sigma \, wide W^(+) = \( f^(+) \)^(- 1) Sigma \, $ <eq:bad-loci>]

with reduced structures. These sets include the inverse image of the bad locus of the other morphism.
  In particular, $W^(+)$ can be nonempty when $f^(+)$ is an isomorphism.

#thm([Lemma 2.1.])[
  #emph[Let $G$ be the normalization of the graph of the birational map in (2.1), with projections $u : G arrow.r
    X^(-)$ and $v : G arrow.r X^(+)$. Then
$ H = u^(*) D^(-) - v^(*) D^(+) gt.eq 0 \, wide "Supp" H = \( G arrow.r Z \)^(- 1) Sigma . $

 The divisor $H$ is exceptional over $X^(+)$, and $- H$ is ample over $Z$.
   For every divisorial valuation $xi$ of the common function field,
#[#set math.equation(numbering: n => "(2.3)")
 $ a \( xi \; X^(+) \, B^(+) \) - a \( xi \; X^(-) \, B^(-) \) = xi \( H \) gt.eq 0 . $ <eq:discrepancy-comparison>]

 The inequality is strict exactly when $c_(X^(-)) \( xi \) subset W^(-)$,
   equivalently when $c_(X^(+)) \( xi \) subset W^(+)$.]
  #emph[For a nontrivial step,
#[#set math.equation(numbering: n => "(2.4)")
 $ dim W^(-) + dim W^(+) gt.eq 3 . $ <eq:graph-dimension>]

 Always $dim W^(+) lt.eq 2$. If $f^(-)$ is also small, then $dim W^(-) lt.eq 2$ and $dim Sigma lt.eq 1$.]
] <lem:graph>

#proof[
  Every prime divisor on $X^(+)$ maps to a prime divisor on $Z$, since $f^(+)$ is small.
    Its strict transform on $X^(-)$ has the same adjoint coefficient:
    use the compatible canonical divisors and the stated boundary transform. Thus $v_(*) H = 0$.
    The normalization map from $G$ to its closed graph in $X^(-) times_Z X^(+)$ is finite.
    The sum of the pullbacks of the relatively ample divisors $-
    D^(-)$ and $D^(+)$ is relatively ample on that product; its finite pullback is $- H$.
    In particular, $- H$ is $v$-nef, and negativity gives $H gt.eq 0$.
  For a proper birational morphism onto a normal variety, its nonisomorphism locus on the target is exactly its
    positive-dimensional-fibre locus. Indeed, over the zero-dimensional-fibre locus the morphism is finite locally
    on the target, hence an isomorphism by normality. Consequently each graph fibre over $Sigma$ has positive
    dimension: it maps surjectively to each of the two fibres and at least one of those fibres has positive
    dimension. Graph fibres are connected, by Stein factorization for the proper birational map $G arrow.r Z$.
  Every closed point of a connected positive-dimensional projective fibre lies on a curve in that fibre.
    To see this, a point which lies on no positive-dimensional irreducible component would be an isolated
    zero-dimensional component, contradicting connectedness; a positive-dimensional projective component contains
    a curve through each of its points. If a point of the graph fibre were outside $"Supp" H$,
    choose such a curve through it. That curve is not contained in the effective $bb(Q)$-Cartier divisor $H$,
    so its intersection with $H$ is nonnegative. This contradicts the relative ampleness of $- H$.
    Thus the whole inverse image of $Sigma$ lies in the support.
    On the common isomorphism open the adjoints agree, so the reverse inclusion holds as well.
  Pull the divisor identity back to a smooth common model carrying $xi$. Compatible canonical divisors give (2.3).
    The order of an effective $bb(Q)$-Cartier divisor at a valuation is positive exactly when its center lies in
    the support. Since this support is the full inverse image of $Sigma$, the two descriptions of strictness follow.
  For a nontrivial step the support is nonempty and contains a prime divisor of the fourfold $G$.
    This divisor has dimension three. Its map into $W^(-) times W^(+)$ is finite onto its image, giving (2.4).
  The assertion about $W^(+)$ also follows from $v_(*) H = 0$:
    a prime divisor in $W^(+)$ would have a divisorial strict transform on $G$ lying in $"Supp" H$,
    contrary to the zero pushforward. If $f^(-)$ is small, codimension-one comparison similarly gives $u_(*) H =
    0$, so $dim W^(-) lt.eq 2$. Finally each component of $Sigma$ is a positive-dimensional-fibre locus for at
    least one of the two morphisms. Its full inverse image on that side has dimension at least one larger,
    so $dim Sigma lt.eq 1$. ◻
]

#thm([Corollary 2.2.])[
  #emph[Under the hypotheses of Lemma 3, lc and klt are preserved.
    For a small step, an effective terminal pair remains terminal.
    At a divisor-losing step the discrepancy of every lost prime divisor increases strictly.]
] <cor:singularities-preserved>

#proof[
  Use (2.3). In a small step the same valuations are exceptional on both models.
    A lost prime divisor is contained in $W^(-)$. ◻
]

=== 2.2 Ranks of cycle classes <ranks-of-cycle-classes>

The use of algebraic cycle classes to count fourfold flips goes back to #cite(label("KMM87"));
  see also #cite(label("FujinoCanonical")) Lemma 10, preprint version.
  We use the same homological principle for the full bad loci, so that it also detects divisor loss in a mixed step.

For a projective variety $V$ define

$ rho_r \( V \) = dim_(bb(Q)) "span" { \[ A \] in H_(2 r) \( V \, bb(Q) \) : A subset V upright(" irreducible") \,
  med dim A = r } . $

For an open variety use Borel–Moore homology in the same definition.
  On a normal projective threefold $S$ we write $rho_(*) \( S \) = rho_2 \( S \)$.
  This is a rank of divisor cycle classes; we do not identify it with a Picard number on a singular variety.

#thm([Lemma 2.3.])[
  #emph[Let $V$ be projective and $A subset V$ closed of dimension at most $r$.
    Restriction to $V \\ A$ maps the span of $r$-cycle classes onto the corresponding Borel–Moore cycle span.
    Its kernel is exactly the span of the classes of the $r$-dimensional irreducible components of $A$. In particular,]
  + #emph[removing a set of dimension less than $r$ does not change this rank;]
  + #emph[removing a set with an $r$-dimensional component strictly lowers the rank.]
  #emph[For a sequence of diagrams as in Lemma 3, only finitely many steps lose a prime divisor.
    On a small tail with no positive-side bad surfaces, only finitely many steps have a negative-side bad surface.]
] <lem:cycle-rank>

#proof[
  Every irreducible closed $r$-dimensional subvariety of the open complement is the restriction of its closure in
    $V$. Hence the restriction of cycle spans is onto. The localization sequence
  $ H_(2 r) \( A \, bb(Q) \) arrow.r H_(2 r) \( V \, bb(Q) \) arrow.r H_(2 r)^(upright("BM")) \( V \\ A \, bb(Q) \) $
  is exact. Since $dim A lt.eq r$, its first group is generated by the fundamental classes of its $r$-dimensional
    components. These images already belong to the cycle span, proving the kernel assertion.
    If such a component exists, its class in $V$ is nonzero: intersection with the $r$th power of an ample divisor
    has positive degree.
  In a step the complements of $W^(-)$ and $W^(+)$ are isomorphic. Apply the first assertion with $r = 3$.
    The positive bad set has dimension at most two, so the positive-side rank equals the rank on this common open.
    The negative-side rank is at least that rank, and is strictly larger if a divisor is lost.
    These nonnegative integer ranks cannot strictly decrease infinitely often.
    This proves the first finiteness assertion, including mixed steps.
  After passing to a small tail, both bad sets have dimension at most two.
    If the positive sets have dimension at most one, repeat the argument with $r = 2$.
    Each negative-side surface gives a strict rank decrease. ◻
]

#thm([Corollary 2.4.])[
  #emph[To prove termination of a fourfold program it suffices to show that, on its small tail,
    positive-side bad surfaces occur only finitely often.]
] <cor:surfaces-suffice>

#proof[
  After the two applications of Lemma 5, both bad sets have dimension at most one.
    Their dimensions then contradict (2.4) at every further nontrivial step. ◻
]

=== 2.3 Identifying a prescribed ample end <identifying-a-prescribed-ample-end>

The following elementary comparison will be used for both terminal and dlt bridges.
  All divisor equalities are equalities of actual $bb(Q)$-divisors with compatible canonical choices.
  It is the usual comparison of nef birational ends by negativity; see also #cite(label("BirkarLC")) Remark 2.7.

#thm([Lemma 2.5.])[
  #emph[Let $V_1$ and $V_2$ be normal projective birational models over a normal base $Z$,
    with relatively nef $bb(Q)$-Cartier divisors $D_1 \, D_2$.
    On a smooth common model $W$, with projections $q_j : W arrow.r V_j$, suppose
$ A = q_1^(*) D_1 + F_1 = q_2^(*) D_2 + F_2 \, $

 where $F_j gt.eq 0$ is exceptional over $V_j$. Then $q_1^(*) D_1 = q_2^(*) D_2$.
   If $D_2$ is ample over $Z$, the birational map $V_1 arrow.r.dashed V_2$ is a morphism $h$, and $D_1 = h^(*) D_2$.]
] <lem:two-ends>

#proof[
  Put $E = q_1^(*) D_1 - q_2^(*) D_2 = F_2 - F_1$. Its pushforward to $V_1$ is effective.
    On curves contracted by $q_1$, the divisor $E$ is the negative of a nef divisor, so $- E$ is $q_1$-nef.
    Negativity gives $E gt.eq 0$. Interchanging the two ends gives $- E gt.eq 0$, hence $E = 0$.
  If $D_2$ is relatively ample, every curve in a fibre of $q_1$ has zero degree against $q_2^(*) D_2$,
    and is therefore contracted by $q_2$. The image under $q_2$ of that projective connected fibre must be a
    point. Indeed a positive-dimensional projective image would contain a curve,
    and projective hyperplane sections of its inverse image supply a curve mapping onto it.
    The graph factorization lemma for a proper morphism with connected fibres onto a normal variety gives $q_2 =
    h q_1$. Equality of pullbacks and birational pushforward yield $D_1 = h^(*) D_2$. ◻
]

For a finite negative birational program extracting no prime divisor,
  repeated use of Lemma 3 writes the input adjoint pullback as the final pullback plus an effective
  final-exceptional divisor. Thus Lemma 7 applies to finite programs and a prescribed ample model whenever both
  comparisons have this form.

== 3 Terminal junctions and the coefficients that can vary <sec:terminal>

We work over $bb(C)$. Lemma 5 reduces a hypothetical infinite klt program to a small tail.
  We lift that tail to crepant terminal models, joined by coefficient decreases and finite strings of small flips,
  and show that every coefficient which keeps varying belongs to a divisor whose downstairs center has codimension
  at least three.

Two finiteness statements make this construction useful. Finiteness of the exceptional valuations with log
  discrepancy at most one lets us stabilize the divisors extracted on the terminal models.
  The description of valuations below discrepancy two then identifies the ordinary families that must be
  subtracted to obtain a finite difficulty. Both follow from the same log-smooth calculation.

=== 3.1 A log-smooth calculation <a-log-smooth-calculation>

We use characteristic-zero resolution and principalization in the form originating with Hironaka
  #cite(label("Hironaka1964I")) #cite(label("Hironaka1964II")):
  the chosen resolution can make the finitely many divisor supports and ideal transforms simple normal crossings
  while preserving the open set where they already have that form.

#thm([Lemma 3.1.])[
  #emph[Let $pi : W arrow.r X$ be a log resolution of a klt pair,
    and include the exceptional locus and the crepant boundary support in a simple normal crossings (SNC) divisor
    $sum_j T_j$. Write $a_j = a \( T_j \; X \, B \) > 0$, assigning $a_j =
    1$ to any auxiliary component of coefficient zero. If $J$ indexes the components through the generic center of
    a divisorial valuation $xi$ on $W$, then
#[#set math.equation(numbering: n => "(3.1)")
 $ a \( xi \; X \, B \) = sum_(j in J) xi \( T_j \) a_j + e \( xi \) . $ <eq:snc-formula>]

 Here $e \( xi \)$ is a nonnegative integer, the log discrepancy for the reduced SNC boundary near that center.
   If the center has codimension $c$ in $W$, then
$ e \( xi \) gt.eq c - \| J \| . $

 If $e \( xi \) = 0$, then $xi$ is the monomial valuation associated to a primitive positive integral vector over
   the generic point of an SNC stratum. In particular there are finitely many such valuations when their orders
   $xi \( T_j \)$ are bounded.]
] <lem:snc-valuations>

#proof[
  Near the center the crepant boundary is $sum_(j in J) \( 1 - a_j \) T_j$.
    Subtracting it from the reduced boundary gives (3.1). The reduced SNC pair is lc and has integral Cartier
    adjoint, so its log discrepancies are nonnegative integers.
    At the generic center choose $c - \| J \|$ additional regular parameters cutting that center inside its
    stratum. Adjoining their divisors with coefficient one still gives an SNC pair locally.
    Log canonicity of this larger reduced boundary implies $e \( xi \) gt.eq sum_ell xi \( t_ell \) gt.eq c - \| J \|$.
  For completeness, the zero-error assertion can be seen by a toroidal modification.
    The orders along the crossing equations give a positive integral vector in the cone of the stratum.
    Make a regular fan subdivision containing its primitive ray; the resulting local toric modification,
    pulled back through the crossing coordinates, is log crepant for the reduced SNC structure.
    The lifted center lies in the open stratum of the divisor for this ray.
    If it were a proper subvariety of that stratum, the preceding transverse-parameter argument would give
    positive reduced-SNC discrepancy. Thus it is the generic point of that divisor,
    and the normalized valuation is its order. The toric construction is split over the residue field of the
    original stratum, so a primitive vector determines one divisor there.
    There are finitely many strata and finitely many bounded integral vectors. ◻
]

#thm([Lemma 3.2.])[
  #emph[For a fixed klt pair $\( X \, B \)$ there are finitely many exceptional divisorial valuations with
    $a \( xi \; X \, B \) lt.eq 1$.]
] <lem:small-discrepancies>

#proof[
  Choose the resolution of Lemma 8 with SNC exceptional divisor.
    If the lifted center meets that SNC divisor and contributes discrepancy at most one,
    positivity of its $a_j$ forces $e \( xi \) = 0$ and bounds every positive order in (3.1).
    There are finitely many resulting monomial valuations. If the center avoids the SNC divisor,
    an exceptional valuation has center of codimension at least two on the smooth isomorphism open,
    and hence log discrepancy at least two. Divisors already on the resolution form a finite list of possible
    exceptionals. These cases exhaust the valuations. ◻
]

#thm([Lemma 3.3.])[
  (Echoes below log discrepancy two).  #emph[Let $\( Y \, Theta \)$ be an effective terminal pair on a projective
    $bb(Q)$-factorial fourfold. Label finitely many prime divisors $S_h$ containing $"Supp" Theta$,
    and write $Theta = sum_h b_h S_h$, allowing $b_h = 0$. Then:]
  + #emph[Only finitely many exceptional valuations with $a \( xi \; Y \, Theta \) <
    2$ have center of codimension at least three.]
  + #emph[At each fixed surface center there are only finitely many exceptional valuations with log discrepancy
    less than two.]
  + #emph[Apart from finitely many surface centers, every valuation with surface center and log discrepancy less
    than two is centered on the one-label smooth open. In regular parameters $x \, t$ at its generic point,
    with $x = 0$ defining that label $S_h$, the contributing valuations are exactly the monomial orders
#[#set math.equation(numbering: n => "(3.2)")
 $ xi \( x \) = j \, quad xi \( t \) = 1 \, wide a \( xi \; Y \, Theta \) = 1 + j \( 1 - b_h \) < 2 \, wide
   j gt.eq 1 . $ <eq:echo-values>]

]
  #emph[More strongly, all exceptional valuations below two which are not of the form (3.2) on that one-label
    smooth open belong to a finite list.]
] <lem:echoes>

#proof[
  The underlying variety $Y$ is terminal. Indeed $Theta$ is effective and $bb(Q)$-Cartier,
    so its removal only increases discrepancies. In particular $Y$ is smooth in codimension two.
    Choose a closed set $A$ of codimension at least two containing $"Sing" Y$, the nonsmooth loci of the labels,
    and every intersection of two distinct labels. On $Y \\ A$ the ambient space is smooth and at most one smooth
    label is present.
  Resolve and principalize the ideal of $A$, simultaneously with the label divisors,
    by a morphism isomorphic over $Y \\ A$. The full inverse image of $A$ has SNC divisorial support,
    all of whose components are exceptional over $Y$. Their log discrepancies for $\( Y \, Theta \)$ are strictly
    greater than one. Any valuation centered in $A$ has its lifted center in one of these exceptional components.
    If its discrepancy is less than two, (3.1) therefore forces $e \( xi \) = 0$;
    all orders are bounded because all coefficients $a_j$ are positive.
    Lemma 8 gives only finitely many such valuations.
  On the smooth open away from all labels, an exceptional valuation has discrepancy at least two.
    At a center of codimension $c$ in a single label of coefficient $b_h$, the same formula gives
  $ a \( xi \; Y \, Theta \) = \( 1 - b_h \) xi \( S_h \) + e \( xi \) \, wide e \( xi \) gt.eq c - 1 . $
  Since $1 - b_h > 0$, discrepancy less than two forces $c = 2$.
    At its generic point choose regular parameters $x \, t$, with $x$ the label equation.
    Add $t = 0$ as an auxiliary component of coefficient zero to the SNC calculation. Then
  $ a \( xi \; Y \, Theta \) = \( 1 - b_h \) xi \( x \) + xi \( t \) + e' \( xi \) . $
  The strict bound and positivity force $xi \( t \) = 1$ and $e' \( xi \) = 0$.
    The zero-error characterization gives precisely (3.2). Conversely each such primitive vector defines the
    indicated divisorial order and discrepancy. Only finitely many $j$ satisfy the displayed inequality.
    Combining this with the finite list over $A$ proves every assertion. ◻
]

The local classification in Lemma 10 is the echo phenomenon underlying the difficulties of #cite(label("AHK"))
  Example 1.4 and Lemma 1.5; their discrepancy convention is one less than ours.
  We have included the argument in order to specify the finite correction terms used later.

=== 3.2 Crepant terminalizations and the finite bridges <crepant-terminalizations-and-the-finite-bridges>

Lifting a prescribed program to terminal models with decreasing exceptional coefficients is also used in
  #cite(label("HanLiuZhuang2025")) Lemma 2.8. We give the construction here,
  including the comparison that identifies the prescribed positive end.

Suppose now that $\( X_i \, B_i \) arrow.r.dashed \( X_(i + 1) \, B_(i + 1) \)$ is a small klt tail,
  with step bases $Z_i$. By Lemmas 3 and 9, the sets

$ I_i = { xi : xi upright(" exceptional over ") X_i \, med a \( xi \; X_i \, B_i \) lt.eq 1 } $

are nested finite sets: exceptional status is unchanged under a small map.
  After truncation they equal one fixed set $I_0$. Write $a_i \( xi \) = a \( xi \; X_i \, B_i \)$.

#thm([Proposition 3.4.])[
  #emph[There are projective birational morphisms $p_i : Y_i arrow.r X_i$ extracting exactly $I_0$,
    with $Y_i$ $bb(Q)$-factorial and
#[#set math.equation(numbering: n => "(3.3)")
 $ K_(Y_i) + Theta_i = p_i^(*) \( K_(X_i) + B_i \) \, wide Theta_i = B_i^(upright("str")) +
   sum_(s in I_0) \( 1 - a_i \( s \) \) E_(i \, s) \, $ <eq:terminal-crepant>]

 such that each $\( Y_i \, Theta_i \)$ is effective terminal. Consecutive junctions can be joined by:]
  + #emph[decreasing the coefficient of each $E_(i \, s)$ to $1 - a_(i + 1) \( s \)$ on $Y_i$;]
  + #emph[a finite sequence, possibly empty, of small negative terminal flips over $Z_i$.]
  #emph[Every labeled prime persists through the chain. All coefficients are nonincreasing,
    and the discrepancy of every valuation is nondecreasing, including across coefficient changes.]
] <prop:terminal-chain>

#proof[
  For klt input, #cite(label("BCHM")) Corollary 1.4.3 extracts precisely any prescribed finite set of exceptional
    valuations with log discrepancies at most one by a projective birational morphism with $bb(Q)$-factorial
    source. The restriction in that corollary on discrepancy-one centers is vacuous for a klt pair.
    Apply it to $I_0$. The boundary in (3.3) is effective with coefficients less than one.
    Any valuation exceptional over $Y_i$ is exceptional over $X_i$ and is not one of the extracted divisors;
    it therefore has discrepancy greater than one. This proves terminality.
  Put
  $ Theta'_i = B_i^(upright("str")) + sum_(s in I_0) \( 1 - a_(i + 1) \( s \) \) E_(i \, s) \, wide A_i =
    K_(Y_i) + Theta'_i . $
  The new coefficients lie in $\[ 0 \, 1 \)$ and are no larger than their old values.
    Since $Y_i$ is $bb(Q)$-factorial, the removed effective boundary is $bb(Q)$-Cartier.
    Its order at every valuation is nonnegative, so this move preserves terminality and increases discrepancies weakly.
  On a smooth common model $W$ of $Y_i$ and $X_(i + 1)$ over $Z_i$, with projections $q$ and $r$, consider
  $ E = q^(*) A_i - r^(*) D_(i + 1) . $
  The divisor $A_i$ is the divisorial trace on $Y_i$ of the pullback of $D_(i + 1)$.
    At primes from $X_i$ this follows from smallness downstairs.
    At each marked prime $E_(i \, s)$ it is exactly the definition of its new coefficient using
    $a_(i + 1) \( s \)$. Thus $q_(*) E = 0$. Also $- E$ is $q$-nef because $D_(i + 1)$ is ample over $Z_i$.
    Negativity gives $E gt.eq 0$. Every prime on $X_(i + 1)$ corresponds to a prime on $Y_i$ with the same
    coefficient, so $E$ is exceptional over $X_(i + 1)$ as well.
  Run a chosen finite klt MMP for $A_i$ over $Z_i$. The precise existence input is #cite(label("BCHM"))
    Theorem 1.2 and Corollary 1.4.2: a $bb(Q)$-factorial klt pair with relatively big boundary admits a
    terminating program with suitable scaling. Here $Y_i arrow.r Z_i$ is birational,
    so both its boundary and its adjoint are relatively big; their generic fibre is a point,
    as in #cite(label("BCHM")) Definition 3.1.1(7). Choose a general effective rational scaling divisor with
    sufficiently positive class and sufficiently small component coefficients,
    so the augmented pair remains klt and its adjoint is relatively nef.
    A fibre-type output over $Z_i$ is impossible by dimensions.
    Hence a finite choice reaches a relatively nef end $\( hat(Y) \, hat(Theta) \)$.
  For this finite program, the input pullback equals the nef-end pullback plus an effective end-exceptional
    divisor. We already have the comparison with the ample divisor $D_(i + 1)$ on $X_(i + 1)$.
    Lemma 7 therefore gives a morphism $hat(p) : hat(Y) arrow.r X_(i + 1)$ and the actual crepant identity
  $ K_(hat(Y)) + hat(Theta) = hat(p)^(*) D_(i + 1) . $
  No marked divisor can have been contracted during the finite program:
    its discrepancy at the input after the coefficient decrease is $a_(i + 1) \( s \)$,
    and crepancy gives the same value at the end, whereas a contraction losing it would give strict improvement by
    Lemma 3. No other prime can have been lost either. Such a prime comes from $X_i$, hence from $X_(i + 1)$,
    and a birational morphism to the normal $X_(i + 1)$ has a strict transform of that prime.
    The program extracts no divisors, so a lost prime could not reappear.
  Every step was consequently small. Terminality persists by Corollary 4,
    and the end again extracts exactly $I_0$. Set it equal to $Y_(i + 1)$.
    This constructs the junctions inductively and proves all discrepancy and coefficient assertions.
    Figure 1 summarizes the construction. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$\( Y_i \, Theta_i \)$])
  content((3.179, 0), [$\( Y_i \, Theta'_i \)$])
  content((6.623, 0), [$\( Y_(i + 1) \, Theta_(i + 1) \)$])
  content((0, -1.585), [$\( X_i \, B_i \)$])
  content((3.179, -1.585), [$Z_i$])
  content((6.623, -1.585), [$\( X_(i + 1) \, B_(i + 1) \)$])
  line((0.864, 0), (2.249, 0), mark: (end: ">"))
  content((1.557, 0.2266), [#text(size: 0.73em)[$Theta_i arrow.br Theta'_i$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.4186, -0.7927), [#text(size: 0.73em)[$p_i$]])
  line((4.109, 0), (5.495, 0), stroke: (dash: "dashed"), mark: (end: ">"))
  content((4.802, 0.2266), [#text(size: 0.73em)[$upright("finite small flips")$]])
  line((6.623, -0.2725), (6.623, -1.313), mark: (end: ">"))
  content((7.138, -0.7927), [#text(size: 0.73em)[$p_(i + 1)$]])
  line((0.864, -1.585), (2.711, -1.585), mark: (end: ">"))
  content((1.788, -1.812), [#text(size: 0.73em)[$f_i$]])
  line((5.495, -1.585), (3.647, -1.585), mark: (end: ">"))
  content((4.571, -1.812), [#text(size: 0.73em)[$f_i^(+)$]])
})],
  caption: [Figure 1: The terminal junctions are crepant over the prescribed downstairs models. Coefficients decrease before the finite relative bridge; the original downstairs choices remain fixed. ],
) <fig:terminal-bridge>

Let $S_h$ label the strict transforms of the original boundary components and the finitely many marked extractions
  throughout this chain, retaining labels whose coefficient becomes zero.
  Write the current boundary as $Theta = sum_h b_h S_h$. The coefficient $b_h$ is constant at the original
  boundary labels and nonincreasing at every extracted label.
  Call a label #emph[fixed] if its coefficient is eventually constant, and #emph[varying] otherwise.
  After truncating once more, all fixed coefficients are constant.
  A varying coefficient is positive at every remaining junction, since reaching zero would make it fixed.

=== 3.3 Surface mld ACC and the centers of varying labels <surface-mld-acc-and-the-centers-of-varying-labels>

For a codimension-two subvariety $V subset X_i$, write

$ "mld"_(eta_V) \( X_i \, B_i \) = inf { a_i \( xi \) : c_(X_i) \( xi \) = V } . $

We use two surface facts. Minimal log discrepancies at points of klt surfaces with coefficients in a fixed finite
  set satisfy ACC; this follows from #cite(label("Alexeev1993")) Theorems 3.1 and 3.8.
  To spell out the fixed-set reduction, omit zero coefficients.
  If the smallest permitted positive coefficient is $c$, the local coefficient-sum bound $sum b_j lt.eq
  2$ bounds the number of components through the point by $floor.l 2 \/ c floor.r$.
  Only finitely many coefficient multisets occur. A strictly increasing sequence of mld values would therefore
  have a subsequence with one constant coefficient vector, contradicting Theorem 3.8 of that reference.
  If the positive coefficient set is empty, the vector is already constant and empty.
  This argument also allows coefficients repeated by splitting on a surface section.
  A singular codimension-two point of an effective log pair has mld at most one;
  see #cite(label("Ambro1999")) Proposition 3.2, arXiv version.

#thm([Lemma 3.5.])[
  #emph[The numbers $"mld"_(eta_V) \( X_i \, B_i \)$, as $i$ and $V$ vary,
    belong to the set of surface mld values with the same finite set of boundary coefficients.
    Each minimum is attained.]
] <lem:transverse-mld>

#proof[
  Fix a model and a center $V$. Choose a projective log resolution which also principalizes the ideal of $V$.
    Its divisorial inverse image has finitely many components dominating $V$.
    The mld in question is the minimum of their log discrepancies.
    Indeed every valuation centered at $eta_V$ has its lifted center in at least one such component,
    and the positive-coefficient formula (3.1) bounds its discrepancy below by that component’s discrepancy.
    Conversely those component valuations have center $V$.
  Cut the fourfold by two general sufficiently ample hyperplanes so that the resulting surface meets $V$ at
    general points and avoids the proper closed images in $V$ of resolution strata which do not dominate it.
    Use simultaneous Bertini for the finitely many relevant strata.
    The downstairs surface is normal; the two pulled-back cuts on the smooth resolution are smooth and transverse
    to the SNC data. They contain no exceptional divisor as a component,
    because neither general hyperplane contains an exceptional image.
    Their complete intersection has no component contained in the exceptional locus:
    each exceptional divisor has image of dimension at most two,
    and two general pulled-back cuts leave dimension at most one there.
  Adjunction cancels the two normal determinant factors on the source and target of the restricted resolution.
    Thus the crepant coefficients on the surface resolution are the restrictions of the original coefficients.
    The boundary on the normal surface has the original finite coefficient set:
    generic hyperplane sections of each boundary prime are reduced, and no new boundary divisor is introduced.
    All sliced crepant coefficients have positive log discrepancy, so the surface pair is klt.
    Components of the principalized inverse image dominating $V$ cut to divisors with the same discrepancies over
    each chosen general intersection point. Strata with proper image were avoided.
    Applying (3.1) on the slice now gives the same minimum as above. This proves the assertion. ◻
]

#thm([Proposition 3.6.])[
  #emph[After truncating the small downstairs tail, every surface contained in either bad locus of every remaining
    step has generic-point mld greater than one and is generically in the smooth locus of its ambient model.
    At each remaining crepant junction, every varying label has downstairs center of codimension at least three.
    Consequently the reduced union of varying labels is mapped by $p_i$ to a set of dimension at most one.]
] <prop:codim-two>

#proof[
  Suppose infinitely many steps have a bad surface with mld at most one on one specified side.
    A computing divisor is exceptional downstairs and belongs to the stabilized finite set $I_0$.
    Some fixed member $s$ computes the mld at infinitely many such occurrences.
    Its discrepancies along this subsequence increase strictly.
    On the negative side, strict improvement occurs in the step immediately following the occurrence;
    on the positive side, it occurs immediately before the occurrence.
    Monotonicity between occurrences then gives strict increase in either case.
    By Lemma 12, these are surface mld values with a fixed finite coefficient set, contradicting ACC.
    Apply this to both sides and discard finitely many initial steps.
    Ambro’s bound gives generic ambient smoothness at the remaining bad surfaces.
  If an extracted label with discrepancy at most one has a codimension-two center $V$ downstairs at some remaining
    junction, $V$ cannot be contained in the following negative bad locus.
    Otherwise its mld would be at most the discrepancy of that label, contradicting the first assertion.
    The birational step is therefore an isomorphism near the generic point of $V$,
    and the center and its discrepancy persist on the next model. The same argument repeats at every later step.
    This label’s coefficient is hence constant from that junction onward.
    A varying label cannot have such a center. It is exceptional downstairs,
    so its center has codimension at least three; in dimension four its image has dimension at most one. ◻
]

== 4 The difficulty and its local deficit <sec:difficulty-setup>

We now construct the integer that will measure progress along the terminal chain of Proposition 11.
  Its definition subtracts the ordinary families of codimension-two valuations from a weighted discrepancy count
  and adds divisor-cycle ranks on the boundary normalizations,
  following the framework of #cite(label("AHK")) Section 2.
  The ceiling weight used here can leave a negative correction where several normalization branches meet.
  We identify that correction before proving the geometric estimate needed to bound it.

Work over $bb(C)$ and suppose that a small klt program is infinite.
  Use its terminal chain, with persistent prime labels $S_h$ and nonincreasing coefficients $b_h in \[ 0 \, 1 \)$,
  as constructed in Section 3. Retain zero-coefficient labels.
  Make the truncation in Proposition 13, so that the fixed coefficients are constant and,
  at every crepant junction, the varying labels have positive coefficients and map downstairs to dimension at most
  one. Coefficients change only before each finite string of small terminal flips.

In the big-boundary application of #cite(label("HanLiuZhuang2025")),
  uniform Cartier-index bounds make discrepancies discrete,
  so the finitely many extracted coefficients eventually stabilize #cite(label("HanLiuZhuang2025")) Lemma 3.4 and
  the proof of Theorem 3.1. Here they may continue to decrease.
  We clear denominators only for the coefficients that have stabilized and control the rounding error from the
  remaining labels by the branch inequality.

=== 4.1 Weights and finite local corrections <weights-and-finite-local-corrections>

Choose a positive integer $N$ clearing the denominators of the original downstairs boundary coefficients and of
  the fixed coefficients on the terminal chain. No denominator condition is imposed on the varying coefficients. Define

#[#set math.equation(numbering: n => "(4.1)")
 $ w \( u \) = ⌈N max { u \, 0 }⌉ \, wide w_v \( Y \, Theta \) = w #scale(x: 120%, y: 120%)[\(] 2 -
   a \( v \; Y \, Theta \) #scale(x: 120%, y: 120%)[\)] \, wide d_h =
   sum_(j gt.eq 1) w #scale(x: 120%, y: 120%)[\(] 1 - j \( 1 - b_h \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:difficulty-weights>]

By Lemma 10, $d_h$ is the default total echo weight at a surface on the smooth one-label locus of $S_h$.
  Only exceptional valuations over $Y$ will enter the difficulty.
  The notation $w_v$ will be used when the pair is understood.

#thm([Lemma 4.1.])[
  #emph[Each $d_h$ is a finite nonnegative integer and is nonincreasing along the terminal chain.
    After discarding finitely many junctions, all $d_h$ are constant,
    including throughout every intervening finite bridge.]
] <difficulty:preparation>

#proof[
  Since $b_h < 1$, a summand in (4.1) can be positive only if $j < 1 \/ \( 1 - b_h \)$. Thus the sum is finite.
    Each summand is nonincreasing when $b_h$ decreases. At all subsequent stages the possible indices $j$ are
    bounded by the bound at the initial stage under consideration.
    Consequently $d_h$ is a nonincreasing sequence of nonnegative integers and is eventually constant.
    There are only finitely many labels. Coefficients change only at the coefficient-decrease move of a bridge,
    and stay unchanged during its small flips. Constancy at consecutive junctions therefore gives constancy
    throughout the bridge as well. ◻
]

We henceforth make the truncation in Lemma 14. The constants $d_h$ may depend on the chosen infinite tail;
  a bound uniform over different programs is neither asserted nor needed.

For an irreducible surface $V subset Y$, let $r_(V \, h)$ be the number of prime divisors of $S_h^nu$ mapping onto
  $V$, with $r_(V \, h) = 0$ when $V subset.not S_h$. Here and below this is a count of algebraic prime divisors
  over $kappa \( eta_V \)$, not of their geometric sheets. Recall that $rho_(*) \( S_h^nu \) =
  rho_2 \( S_h^nu \)$ is the rank of the span of divisor cycle classes in $H_4 \( S_h^nu \, bb(Q) \)$.

#prodef([Definition 4.2.])[
  For a terminal pair $\( Y \, Theta \)$ on the prepared chain, define
  #[#set math.equation(numbering: n => "(4.2)")
   $ cal(D) \( Y \, Theta \) =  & sum_("codim"_Y c_Y \( v \) gt.eq 3) w_v\
 & + sum_(V subset Y upright(" irreducible")\
dim V = 2) (sum_(c_Y \( v \) = V) w_v - sum_h r_(V \, h) d_h) + sum_h d_h rho_(*) \( S_h^nu \) . $ <eq:difficulty>]
  The correction in parentheses is performed at each individual surface before summing over surfaces.
] <def:difficulty>

Lemma 10 makes this an integer defined by finite sums of nonzero terms.
  Indeed, the positive-weight contributions in codimension at least three are finite,
  as are those at any one surface center. Outside finitely many exceptional surface centers,
  a surface with a nonzero contribution lies generically in the log-smooth locus on a single positive-coefficient
  label. Its contributing valuations are exactly the echoes with orders $\( j \, 1 \)$,
  whose log discrepancies are $1 + j \( 1 - b_h \)$. Their total weight is exactly $d_h$,
  and the local correction is zero. Zero-coefficient labels have $d_h = 0$ and do not affect this cancellation.
  Thus (4.2) is not a formal subtraction of two divergent valuation sums.
  Its local brackets, and initially its entire value at an intermediate stage, are allowed to be signed.

=== 4.2 The local ceiling error <the-local-ceiling-error>

#thm([Lemma 4.3.])[
  #emph[Let $V subset Y$ be an irreducible surface on a terminal model in the prepared chain, and set
$ r_V^(upright("var")) = sum_(h upright(" varying")) r_(V \, h) . $

 Then
#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(c_Y \( v \) = V) w_v - sum_h r_(V \, h) d_h med gt.eq med - max { r_V^(upright("var")) - 1 \,
   0 } . $ <eq:local-ceiling-bound>]

 The assertion does not require the boundary to have simple normal crossings at $eta_V$.]
] <lem:ceiling-error>

#proof[
  The variety $Y$ is terminal and hence smooth in codimension two.
    Its local ring at $eta_V$ is therefore regular of dimension two.
    Write $m_h$ for the multiplicity there of $S_h$, taking $m_h = 0$ if the label does not contain $V$.
    The ordinary blowup of the closed point of this local surface defines a valuation $v_1$ with
  #[#set math.equation(numbering: n => "(4.4)")
   $ a \( v_1 \; Y \, Theta \) = 2 - sum_h m_h b_h > 1 . $ <eq:surface-first-blowup>]
  In particular $sum_h m_h b_h < 1$, and the weight supplied by this valuation is $w \( sum_h m_h b_h \)$.
  We first justify the branch multiplicity inequality
  #[#set math.equation(numbering: n => "(4.5)")
   $ r_(V \, h) lt.eq m_h . $ <eq:branch-multiplicity>]
  For a label containing $V$, let $R$ be the one-dimensional local domain defined by its prime equation in this
    regular local surface. Its finite normalization $overline(R)$ is semilocal. For a general parameter $t$,
  $ m_h = "length"_R \( R \/ t R \) = "length"_R \( overline(R) \/ t overline(R) \) =
    sum_(frak(q)) \[ kappa \( frak(q) \) : kappa \( eta_V \) \] "ord"_(frak(q)) \( t \) \, $
  where the sum runs over the branches of the normalization above the closed point.
    The middle equality follows by applying multiplication by $t$ to the finite-length module $overline(R) \/ R$:
    its kernel and cokernel have equal length. Each summand in the last expression is a positive integer.
    This proves (4.5), with the residue degrees included.
  For fixed labels $N b_h$ is integral. Apply the elementary inequality $ceil.l x_1 + dots.h.c + x_r ceil.r gt.eq
    sum_(ell = 1)^r ceil.l x_ell ceil.r - \( r - 1 \)$ for $r gt.eq 1$ to the varying branches,
    repeating $N b_h$ once for each branch of that label. When there are no varying branches the same comparison
    is an equality for the fixed part. Effectiveness and (4.5) give
  #[#set math.equation(numbering: n => "(4.6)")
   $ w (sum_h m_h b_h) gt.eq sum_h r_(V \, h) w \( b_h \) - max { r_V^(upright("var")) - 1 \,
     0 } . $ <eq:first-default-error>]
  Only the varying branches can cause this rounding error.
  It remains to pay the terms with $j gt.eq 2$ in the defaults. A positive such term requires $b_h > 1 \/ 2$.
    By (4.4), at most one label through $V$ has this property, and its multiplicity must be one.
    Its prime equation is therefore a regular parameter, which we denote by $x$;
    complete it to regular parameters $\( x \, t \)$. In particular this label has precisely one normalization
    branch at $V$. For each $j gt.eq 2$ with positive default, the monomial valuation with orders $v_j \( x \) =
    j$, $v_j \( t \) = 1$ is a normalized divisorial valuation centered at $V$.
    These valuations are pairwise distinct and different from $v_1$.
    If $b_h$ is the coefficient of $x = 0$, effectiveness of the other boundary components gives
  $ a \( v_j \; Y \, Theta \) = 1 + j - j b_h - sum_(ell eq.not h) b_ell v_j \( S_ell \) lt.eq 1 + j \( 1 - b_h \) . $
  Thus $w_(v_j) gt.eq w \( 1 - j \( 1 - b_h \) \)$. These distinct valuations pay all higher default terms,
    while $v_1$ gives (4.6). Summing proves (4.3). ◻
]

=== 4.3 The geometric bound still needed <the-geometric-bound-still-needed>

At a crepant junction $p : Y arrow.r X_i$, let

$ Q = union.big_(h upright(" varying")) S_h $

with its reduced structure. For a surface $V subset Q$, the number $r_V^(upright("var"))$ counts the prime
  divisors above $V$ on the disjoint normalizations of the components of $Q$, and is at least one.
  Surfaces outside $Q$ have no negative allowance in Lemma 16. Summing that lemma therefore gives

#[#set math.equation(numbering: n => "(4.7)")
 $ cal(D) \( Y \, Theta \) gt.eq sum_("codim"_Y c_Y \( v \) gt.eq 3) w_v + sum_h d_h rho_(*) \( S_h^nu \) -
   sum_(V subset Q) \( r_V^(upright("var")) - 1 \) . $ <eq:difficulty-local-deficit>]

If $Q$ is empty, this already proves nonnegativity. Otherwise every component of $Q$ has positive coefficient,
  so its default satisfies $d_h gt.eq w \( b_h \) gt.eq 1$.
  Every valuation centered on a curve in $Q$ with log discrepancy below two likewise contributes at least one to
  the first sum. None of these valuations has a surface center.

Thus nonnegativity will follow if the total branch excess in the last sum is bounded by the unweighted
  divisor-cycle ranks of the components of $Q$, together with the number of these curve-centered valuations.
  The next two sections prove precisely that bound, in Theorem 17.
  Its geometric hypotheses hold here because $dim p \( Q \) lt.eq 1$.
  The lower bound is needed at the crepant junctions; Section 7 will show that neither the coefficient changes nor
  the small flips between them increase $cal(D)$.

== 5 The branch inequality: topology and weights <sec:branch-topology>

The negative term in (4.7) counts excess normalization branches along surfaces of the varying boundary.
  We now bound this branch excess by divisor-cycle ranks on the normalizations and valuations centered on singular
  curves. The estimate applies to any terminal pair and birational morphism satisfying the hypotheses below.

The proof has two parts. Normalization relations and the comparison with intersection cohomology first bound the
  excess by divisor-cycle ranks and punctured degree-two cohomology along singular curves.
  In Section 6, classes in that local cohomology fixed by monodromy produce distinct divisorial valuations of the
  original function field. Those valuations supply the remaining term of the estimate.

All cohomology and homology in these two sections have rational coefficients and refer to the complex analytic
  topology. We use the perverse normalization of intersection complexes:
  if $Y$ is smooth of dimension four, then $upright("IC")_Y = bb(Q)_Y \[ 4 \]$.

#thm([Theorem 5.1.])[
  (Branch inequality).  #emph[Let $p : Y arrow.r X$ be a projective birational morphism of normal projective
    fourfolds over $bb(C)$. Suppose that $Y$ is $bb(Q)$-factorial and terminal and that $\( Y \, Theta \)$ is an
    effective terminal pair with rational boundary. Let
$ Q = union.big_(j = 1)^m Q_j $

 be a reduced union of distinct positive-coefficient components of $Theta$, and assume $dim p \( Q \) lt.eq 1$.
   Write $Q_j^nu$ for the normalization of $Q_j$. For each irreducible surface $V subset Q$,
   let $r_V$ be the number of prime divisors of $product.co_j Q_j^nu$ mapping onto $V$. Then
#[#set math.equation(numbering: n => "(5.1)")
 $ sum_(V subset Q) \( r_V - 1 \) & lt.eq sum_(j = 1)^m rho_(*) \( Q_j^nu \)\
 & quad + \# { v : "codim"_Y c_Y \( v \) = 3 \, thick c_Y \( v \) subset Q \,
   thick a \( v \; Y \, Theta \) < 2 #scale(x: 120%, y: 120%)[}] . $ <eq:branch-inequality>]

 Here the valuations are normalized divisorial orders, and the sum on the left has only finitely many nonzero terms.]
] <thm:branch>

The branches in this statement are algebraic prime divisors.
  In particular, an irreducible divisor mapping to $V$ with degree greater than one counts as one branch;
  its degree will occur in the pushforward map. No crepancy assumption on $p$ is made.

Set

#[#set math.equation(numbering: n => "(5.2)")
 $ C = p \( Q \)_(upright("red")) \, wide P = \( p^(- 1) C \)_(upright("red")) . $ <eq:branch-loci>]

Let $P_1$ be the reduced union of the three-dimensional components of $P$.
  Thus $Q subset P_1 subset P$, and $P \\ P_1$ has complex dimension at most two.
  If $Q$ is empty, the theorem is immediate; in what follows we may assume otherwise.

=== 5.1 Normalization relations <normalization-relations>

For a projective variety $R$, its homology carries the mixed Hodge structure dual to its cohomology.
  In particular the top homology $H_4 \( F \)$ of a projective variety of dimension at most two is freely
  generated by the fundamental classes of its irreducible surfaces and is pure of weight $- 4$.
  We write $W$ for the weight filtration.

#thm([Lemma 5.2.])[
  (Conductor estimate).  #emph[With the notation above,
#[#set math.equation(numbering: n => "(5.3)")
 $ sum_(V subset Q) \( r_V - 1 \) - sum_j rho_(*) \( Q_j^nu \) lt.eq
   "rank" "Gr"_4^W #scale(x: 120%, y: 120%)[\[] H^5 \( P \) arrow.r
   H^5 \( Q \) #scale(x: 120%, y: 120%)[\]] . $ <eq:conductor-rank>]

]
] <lem:conductor>

#proof[
  For a reduced projective pure threefold $R$, let $nu_R : N_R arrow.r R$ be its normalization.
    Choose a closed reduced subset $A_R subset R$ of dimension at most two such that $nu_R$ is an isomorphism away
    from $A_R$, and put $F_R = \( nu_R^(- 1) A_R \)_(upright("red"))$.
    The normalization square is a proper excision square. Its homology sequence,
    compatible with mixed Hodge structures, contains
  #[#set math.equation(numbering: n => "(5.4)")
   $ H_5 \( R \) arrow.r^(partial_R) H_4 \( F_R \) arrow.r H_4 \( A_R \) xor H_4 \( N_R \) .
     $ <eq:normalization-excision>]
  This follows by comparing the localization sequences for $\( R \, A_R \)$ and $\( N_R \, F_R \)$,
    whose open complements are isomorphic; the mixed Hodge structures and their functoriality are those of
    #cite(label("Deligne1974")) Proposition 8.2.2 and Proposition 8.3.9.
  Apply this construction first to $R = P_1$, taking $A_(P_1)$ to contain the nonisomorphism locus of its
    normalization. For $R = Q$ take $A_Q = Q ∩ A_(P_1)$. The normalization $N_Q =
    product.co_j Q_j^nu$ is a union of entire components of $N_(P_1)$,
    so these choices give a morphism between the two normalization squares.
  Let $V$ run over the surface components of $A_Q$. Write $E_(V \, 1) \, dots.h \,
    E_(V \, r_V)$ for the surface components of $F_Q$ over $V$,
    and let $e_(V \, alpha) = \[ bb(C) \( E_(V \, alpha) \) : bb(C) \( V \) \]$.
    On their fundamental classes, the first component of the map in (5.4) is
  $ xor.big_(alpha = 1)^(r_V) bb(Q) \[ E_(V \, alpha) \] arrow.r bb(Q) \[ V \] \, wide
    sum_alpha t_alpha \[ E_(V \, alpha) \] mapsto #scale(x: 180%, y: 180%)[\(] sum_alpha e_(V \, alpha) t_alpha
    #scale(x: 180%, y: 180%)[\)] \[ V \] . $
  Its kernel has dimension $r_V - 1$. Every surface with $r_V > 1$ lies in $A_Q$,
    because normalization is an isomorphism elsewhere. Consequently the kernel $B$ of $H_4 \( F_Q \) arrow.r
    H_4 \( A_Q \)$ satisfies
  $ dim B = sum_(V subset Q) \( r_V - 1 \) . $
  All these terms are finite in number. The image of $B arrow.r
    H_4 \( N_Q \)$ lies in the span of divisor classes, whose dimension is $sum_j rho_(*) \( Q_j^nu \)$. Therefore
  $ U := ker #scale(x: 120%, y: 120%)[\[] B arrow.r H_4 \( N_Q \) #scale(x: 120%, y: 120%)[\]] \, wide dim U gt.eq
    sum_(V subset Q) \( r_V - 1 \) - sum_j rho_(*) \( Q_j^nu \) . $
  By exactness, $U$ is the image of $partial_Q$.
  The map $H_4 \( F_Q \) arrow.r H_4 \( F_(P_1) \)$ is injective:
    each surface generator of the source is the same surface in one of the selected normalization components of
    $P_1$, and different such generators remain distinct. Naturality of the boundary maps now shows that
    $partial_(P_1)$ maps the image of $H_5 \( Q \) arrow.r H_5 \( P_1 \)$ onto a space containing a copy of $U$.
    Since $H_4 \( F_(P_1) \)$ is pure of weight $- 4$, strictness of morphisms of mixed Hodge structures
    #cite(label("Deligne1971")) Théorème 2.3.5(iii) gives
  $ dim U lt.eq "rank" "Gr"_(- 4)^W #scale(x: 120%, y: 120%)[\[] H_5 \( Q \) arrow.r
    H_5 \( P_1 \) #scale(x: 120%, y: 120%)[\]] . $
  Finally the localization sequence in Borel–Moore homology contains
  $ H_6^(upright("BM")) \( P \\ P_1 \) arrow.r H_5 \( P_1 \) arrow.r H_5 \( P \) . $
  Its first term vanishes by the dimension bound, so its second arrow is injective.
    Duality between homology and cohomology, with weight sign reversed, proves (5.3). ◻
]

=== 5.2 A purity statement over a curve <a-purity-statement-over-a-curve>

The conductor estimate has reduced the problem to the weight-four part of $H^5 \( P \) arrow.r H^5 \( Q \)$.
  We next prove that $bb(H)^1 \( P \, upright("IC")_Y \|_P \)$ is pure of weight five.
  Comparison with ordinary cohomology will then isolate the weight-four contribution on singular curves.
  The decomposition theorem is applied before restriction to $C$;
  the support estimates below identify which of its summands can contribute in degree one.

#thm([Lemma 5.3.])[
  (Intersection-complex restriction).  #emph[Let $p : Y arrow.r
    X$ be a projective birational morphism of normal projective fourfolds over $bb(C)$,
    and let $C subset X$ be a closed reduced subset of dimension at most one.
    Put $P = \( p^(- 1) C \)_(upright("red"))$. Then
$ bb(H)^1 \( P \, upright("IC")_Y \|_P \) $

 is pure of weight five.]
] <lem:restriction-purity>

#proof[
  We use intersection complexes and direct images in the derived category of mixed Hodge modules,
    and use the same symbols for their underlying rational complexes.
    The intersection complex of the irreducible fourfold $Y$ is pure of weight four.
    The projective decomposition theorem gives a finite direct sum
  #[#set math.equation(numbering: n => "(5.5)")
   $ R p_(*) upright("IC")_Y tilde.eq upright("IC")_X xor xor.big_(\( Z \, i \)) M_(Z \, i) \[ - i \] \,
     $ <eq:ic-decomposition>]
  where each $Z$ is a proper irreducible closed subset of $X$,
    and $M_(Z \, i)$ is a pure Hodge module of strict support $Z$ and weight $4 + i$.
    Multiple summands with the same support and index are allowed.
    Birationality gives the unique full-support summand $upright("IC")_X$ in degree zero.
    The weight and decomposition statements used here are #cite(label("Saito1989")) §§1.6–1.8, 1.12–1.13.
  We claim that every proper-support summand in (5.5) satisfies
  #[#set math.equation(numbering: n => "(5.6)")
   $ i + z lt.eq 2 \, wide z = dim Z . $ <eq:proper-support-bound>]
  Choose an algebraic stratification adapted to $upright("IC")_Y$ and refine it by $p^(- 1) Z$.
    Also stratify the target so that over a dense smooth open subset $Z^compose$ of $Z$ every source stratum
    meeting a fibre has constant fibre dimension; strata whose images are not dense in $Z$ are avoided by
    shrinking $Z^compose$. This is possible by constructibility and generic stratified triviality.
    In particular it includes the strata introduced by fibre-dimension jumps before shrinking.
  Let $B subset p^(- 1) Z$ be one of the refined strata dominating $Z$, and put $u = dim B$.
    Since $p$ is birational and $Z$ is proper, $p^(- 1) Z$ is a proper closed subset of $Y$, and hence $u lt.eq
    3$. On $B$ we have
  #[#set math.equation(numbering: n => "(5.7)")
   $ cal(H)^q \( upright("IC")_Y \) \|_B = 0 quad upright("for ") q > - u - 1 . $ <eq:source-stalk-bound>]
  Indeed, if $B$ lies in the smooth open stratum, the only degree is $- 4 lt.eq - u - 1$.
    Otherwise let $t gt.eq u$ be the dimension of the original stratum containing it.
    The strict support condition for an intersection complex gives vanishing for $q > - t - 1$,
    and this implies (5.7). This is the stalk support condition in the middle-extension axioms
    #cite(label("GM1983")) §2.3 and §3.3, axiom \[AX1\] (c).
  For $x in Z^compose$, the stratum $B ∩ p^(- 1) \( x \)$ has dimension $u - z$.
    Compactly supported cohomology on this stratum vanishes above degree $2 \( u - z \)$.
    By (5.7) its contribution to the cohomology of the fibre with coefficients in $upright("IC")_Y$ vanishes in
    degrees greater than
  $ - u - 1 + 2 \( u - z \) = u - 2 z - 1 lt.eq 2 - 2 z . $
  A finite filtration by strata and proper base change give the same upper bound for the stalk of $R p_(*)
    upright("IC")_Y$ at $x$. On a sufficiently small $Z^compose$,
    the nonzero stalk of $M_(Z \, i) \[ - i \]$ is in degree $i - z$.
    Since it is a direct summand, $i - z lt.eq 2 - 2 z$, proving (5.6).
  Consider now a support $Z$ not contained in $C$. Stratify $Z ∩ C$ compatibly with $M_(Z \, i)$,
    and let $S$ be a stratum of dimension $s$. Then $s lt.eq z - 1$.
    The stalks of $M_(Z \, i)$ on $S$ vanish above degree $- s - 1$:
    on the local-system open of $Z$ their only degree is $- z lt.eq - s - 1$,
    and elsewhere this follows from the strict support condition, including after refinement as above.
    Thus the largest possible degree of a contribution from $S$ to the compactly supported cohomology of
    $M_(Z \, i) \[ - i \] \|_C$ is
  $ i - s - 1 + 2 s = i + s - 1 lt.eq i + z - 2 lt.eq 0 . $
  Filtration by strata shows that this summand contributes nothing to degree one on $C$.
    For the full-support summand $upright("IC")_X$, each stratum of $C$ has dimension $s lt.eq
    1$ and the same stalk argument gives the upper bound $- s - 1 + 2 s = s - 1 lt.eq 0$.
    It too contributes nothing in degree one.
  It remains to consider $Z subset C$. Such a support is projective, and its contribution is
  $ bb(H)^(1 - i) \( Z \, M_(Z \, i) \) \, $
  which is pure of weight $\( 4 + i \) + \( 1 - i \) = 5$ by projective direct-image purity.
    Proper base change identifies the degree-one cohomology of (5.5) restricted to $C$ with
    $bb(H)^1 \( P \, upright("IC")_Y \|_P \)$. All its nonzero summands are therefore pure of weight five, as claimed. ◻
]

=== 5.3 The comparison cone and singular curves <the-comparison-cone-and-singular-curves>

Return to the hypotheses of Theorem 17, and write $j : Y_(upright("reg")) arrow.r.hook
  Y$ for the smooth-locus inclusion. Terminality implies $dim "Sing" Y lt.eq 1$.
  For every irreducible curve $T subset "Sing" Y$, choose a connected smooth dense open subset $T^compose$ on
  which the complexes below have locally constant cohomology.
  We may remove further finitely many points whenever needed. Define

#[#set math.equation(numbering: n => "(5.8)")
 $ cal(V)_T = \( R^2 j_(*) bb(Q)_(Y_(upright("reg"))) \) \|_(T^compose) \, wide b_T =
   dim H_c^2 \( T^compose \, cal(V)_T \) . $ <eq:curve-local-system>]

Equivalently, $b_T$ is the dimension of the coinvariant space of a fibre of $cal(V)_T$ under its monodromy
  representation. Removing finitely many further points does not change this number.

#thm([Lemma 5.4.])[
  (Local-system bound).  #emph[For $P$ and $Q$ in (5.2),
#[#set math.equation(numbering: n => "(5.9)")
 $ "rank" "Gr"_4^W #scale(x: 120%, y: 120%)[\[] H^5 \( P \) arrow.r H^5 \( Q \) #scale(x: 120%, y: 120%)[\]] lt.eq
   sum_(T upright(" irreducible curve")\
T subset "Sing" Y ∩ Q) b_T . $ <eq:local-system-rank>]

]
] <lem:local-system-bound>

#proof[
  There is a comparison morphism, equal to the identity on $Y_(upright("reg"))$,
    in the derived category of mixed Hodge modules #cite(label("Saito1989")) §1.14. Let $cal(T)$ be its cone:
  #[#set math.equation(numbering: n => "(5.10)")
   $ bb(Q)_Y \[ 4 \] arrow.r upright("IC")_Y arrow.r cal(T) arrow.r bb(Q)_Y \[ 5 \] . $ <eq:comparison-triangle>]
  The same comparison complex is studied by Park–Popa #cite(label("ParkPopaHodge")) Definition 6.1 as their
    rational-homology-manifold defect complex shifted by one.
    Restricting to $P$ yields the exact sequence of mixed Hodge structures
  #[#set math.equation(numbering: n => "(5.11)")
   $ bb(H)^0 \( P \, cal(T) \|_P \) arrow.r^(delta_P) H^5 \( P \) arrow.r
     bb(H)^1 \( P \, upright("IC")_Y \|_P \) . $ <eq:comparison-cohomology>]
  Lemma 19 makes the last term pure of weight five. Consequently
  $ W_4 H^5 \( P \) subset "im" delta_P . $
  Naturality under $Q subset P$ implies that the image of $W_4
    H^5 \( P \)$ in $H^5 \( Q \)$ is contained in the image of
  $ delta_Q : bb(H)^0 \( Q \, cal(T) \|_Q \) arrow.r H^5 \( Q \) . $
  Strictness of the restriction map for the weight filtration therefore gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ "rank" "Gr"_4^W #scale(x: 120%, y: 120%)[\[] H^5 \( P \) arrow.r
     H^5 \( Q \) #scale(x: 120%, y: 120%)[\]] lt.eq dim bb(H)^0 \( Q \, cal(T) \|_Q \) . $ <eq:cone-rank>]
  The cone is supported on $"Sing" Y$. On a stratum of this locus of dimension $s in { 0 \, 1 }$,
    the strict stalk bound for $upright("IC")_Y$ and the triangle (5.10) give
  $ cal(H)^q \( cal(T) \) = 0 wide \( q > - s - 1 \) . $
  In particular a point stratum has no contribution in degree zero.
    On $T^compose$ the only possible contribution in total degree zero is
  $ H_c^2 \( T^compose \, cal(H)^(- 2) \( cal(T) \) \|_(T^compose) \) . $
  At the generic codimension-three stratum, the middle-extension construction retains the cohomology of $R j_(*)
    bb(Q)$ through unshifted degree two. Thus, by the attaching truncation in #cite(label("GM1983")) §3.1
    and §3.3, axiom \[AX1\] (d),
  #[#set math.equation(numbering: n => "(5.13)")
   $ cal(H)^(- 2) \( cal(T) \) \|_(T^compose) = cal(H)^(- 2) \( upright("IC")_Y \) \|_(T^compose) =
     cal(V)_T . $ <eq:cone-stalk>]
  The first equality also follows directly from (5.10), since the constant complex has stalk cohomology only in
    degree $- 4$.
  Take the $T^compose$ to be disjoint and to omit every intersection point of singular curves.
    The intersection of a singular curve not contained in $Q$ with $Q$ consists of finitely many points.
    Hence the complement in $"Sing" Y ∩ Q$ of the $T^compose$ for curves $T subset Q$ is finite.
    The open–closed cohomology sequence and the point-stratum vanishing give a surjection
  $ xor.big_(T subset "Sing" Y ∩ Q) bb(H)_c^0 \( T^compose \, cal(T) \|_(T^compose) \) arrow.r
    bb(H)^0 \( Q \, cal(T) \|_Q \) . $
  The compact-support spectral sequence on a curve, together with the stalk bound and (5.13),
    identifies its summands with $H_c^2 \( T^compose \, cal(V)_T \)$.
    The dimension bound from this surjection and (5.12) prove the lemma. ◻
]

#proof[
  Lemmas 18 and 20 give
  #[#set math.equation(numbering: n => "(5.14)")
   $ sum_(V subset Q) \( r_V - 1 \) lt.eq sum_j rho_(*) \( Q_j^nu \) +
     sum_(T subset "Sing" Y ∩ Q) b_T . $ <eq:branch-before-valuations>]
  Proposition 21, proved in the next section, constructs for each such curve $T$ at least $b_T$ distinct
    normalized divisorial valuations $v$ satisfying
  $ c_Y \( v \) = T \, wide a \( v \; Y \, 0 \) = 2 \, wide a \( v \; Y \, Theta \) < 2 . $
  Valuations arising from different curves have different centers and are distinct.
    Lemma 10 ensures that the set of valuations of discrepancy below two with codimension-three center is finite.
    Substituting their number for the last sum in (5.14) gives (5.1). ◻
]

== 6 From local cohomology to divisorial valuations <sec:local-valuations>

We prove the local assertion used in Theorem 17. Throughout this section the ground field is $bb(C)$.
  A fibre is its scheme fibre unless explicitly given the reduced structure.
  In particular, line bundles and coherent cohomology on a resolution fibre are taken on that scheme,
  including its possible nilpotents.

#thm([Proposition 6.1.])[
  #emph[Let $Y$ be a normal projective $bb(Q)$-factorial fourfold,
    and let $\( Y \, Theta \)$ be an effective terminal pair with rational boundary.
    Let $T$ be an irreducible curve in $"Sing" Y$ contained in a positive-coefficient component of $Theta$. Put
$ j : Y_(upright("reg")) arrow.r.hook Y \, wide cal(V)_T = \( R^2 j_(*) bb(Q) \) \|_(T^compose) \, wide b_T =
  dim_(bb(Q)) H_c^2 \( T^compose \, cal(V)_T \) \, $

 where $T^compose$ is a sufficiently small smooth dense open on which the indicated sheaf is a local system.
   There are at least $b_T$ distinct normalized divisorial valuations $v$ of $bb(C) \( Y \)$ such that
$ c_Y \( v \) = T \, wide a \( v \; Y \, 0 \) = 2 \, wide a \( v \; Y \, Theta \) < 2 . $

 The valuations obtained for different curves $T$ are distinct.]
] <prop:local-valuations>

The argument has two descent steps. Norms first produce line bundles over the function field of $T$ itself.
  Approximation then extends those bundles to a pointed #emph[ordinary] étale neighbourhood,
  with the same residue field at the chosen point. This last condition is needed to keep the resulting valuations
  distinct. On a small $bb(Q)$-factorial model of this neighbourhood,
  the extended bundles give independent degree vectors on the irreducible curve components of the fibre over the
  chosen point. These components are counted over the function field of $T$ (Lemma 26).
  Blowing up their surface closures at their generic points gives log-discrepancy-two valuations,
  and Lemma 27 makes their restrictions to $bb(C) \( Y \)$ distinct.

=== 6.1 Resolution fibres and their monodromy <resolution-fibres-and-their-monodromy>

Fix a projective resolution

$ pi : tilde(Y) arrow.r Y $

which is an isomorphism over $Y_(upright("reg"))$. Since terminal singularities are smooth in codimension two,
  $dim "Sing" Y lt.eq 1$. After shrinking $T^compose$, the fibres of $pi$ over $T^compose$ have dimension at most
  two. Indeed, a component of $pi^(- 1) \( T \)$ dominating $T$ has dimension at most three,
  because it is a proper closed subset of the fourfold $tilde(Y)$.
  Upper semicontinuity then removes the finitely many possible dimension jumps. We also shrink so that

$ cal(F) = tilde(Y) times_Y T^compose arrow.r T^compose $

is flat and projective and $cal(W) = \( R^2 pi_(*) bb(Q) \) \|_(T^compose)$ is a local system.

#thm([Lemma 6.2.])[
  #emph[Restriction to the smooth open defines a split surjection of rational local systems
$ r : cal(W) arrow.r cal(V)_T . $

 The splitting is available on $T^compose$ itself, before passing to any cover.]
] <local:split-punctured>

#proof[
  Use the perverse normalization for $upright("IC")_Y$, so that its restriction to $Y_(upright("reg"))$ is
    $bb(Q) \[ 4 \]$. The decomposition theorem for the projective morphism $pi$ provides an inclusion of the
    full-support summand
  $ s : upright("IC")_Y arrow.r R pi_(*) bb(Q) \[ 4 \] $
  whose restriction to $Y_(upright("reg"))$ is the identity;
    see #cite(label("Saito1988")) Theorem 5.3.1 and #cite(label("Saito1989")) §§1.7–1.13.
    Restriction upstairs gives a natural morphism
  $ R pi_(*) bb(Q) \[ 4 \] arrow.r R j_(*) bb(Q) \[ 4 \] . $
  Its composite with $s$ is the canonical comparison $upright("IC")_Y arrow.r R j_(*) bb(Q) \[ 4 \]$.
    In fact, adjunction identifies morphisms from $upright("IC")_Y$ to $R j_(*)
    bb(Q) \[ 4 \]$ with morphisms from $j^(*) upright("IC")_Y = bb(Q) \[ 4 \]$ to itself,
    and the indicated composite restricts to the identity.
  At the generic curve stratum, which has complex codimension three,
    the middle-extension construction retains the ordinary unshifted cohomology through degree two.
    Consequently the comparison induces
  $ cal(H)^(- 2) \( upright("IC")_Y \) \|_(T^compose)
    arrow.r^(med tilde.op med) \( R^2 j_(*) bb(Q) \) \|_(T^compose) . $
  This is the middle-perversity truncation description of intersection cohomology #cite(label("GM1983")) §2;
    subsequent extension across the zero-dimensional strata does not change this restriction.
    Taking degree $- 2$ in the two morphisms above proves the assertion:
    the map induced by $s$, composed with the inverse of this comparison isomorphism, is a right inverse to $r$. ◻
]

#thm([Lemma 6.3.])[
  #emph[Let $y in Y$ be a point for which the scheme fibre $F_y =
    tilde(Y) times_Y "Spec" kappa \( y \)$ has dimension at most two. Then
$ H^2 \( F_y \, cal(O)_(F_y) \) = 0 . $

 If $y$ is a closed complex point, first Chern classes of algebraic line bundles span $H^2 \( F_y \, bb(Q) \)$.]
] <local:scheme-fibre-vanishing>

#proof[
  The variety $Y$ has rational singularities, since it is klt #cite(label("KM98")) Theorem 5.22.
    In particular, $R^2 pi_(*) cal(O)_(tilde(Y)) = 0$. Write $A = cal(O)_(Y \, y)$,
    let $frak(m)$ be its maximal ideal, and put
  $ F_n = tilde(Y) times_Y "Spec" \( A \/ frak(m)^(n + 1) \) wide \( n gt.eq 0 \) . $
  Every $F_n$ has the same underlying topological space as $F_0 = F_y$. In the exact sequence
  $ 0 arrow.r J_n arrow.r cal(O)_(F_(n + 1)) arrow.r cal(O)_(F_n) arrow.r 0 \, $
  the coherent kernel has $H^3 \( J_n \) = 0$, by the dimension bound.
    Therefore $H^2 \( F_(n + 1) \, cal(O)_(F_(n + 1)) \) arrow.r H^2 \( F_n \, cal(O)_(F_n) \)$ is surjective.
    Proper formal functions #cite(label("Stacks")) Tag 02OD gives
  $ "proj lim"_n H^2 \( F_n \, cal(O)_(F_n) \) = \( R^2 pi_(*) cal(O)_(tilde(Y)) \)_y^and = 0 . $
  For an inverse sequence of surjective maps the limit maps surjectively to each term, by successive lifting.
    Hence every term, in particular $H^2 \( F_y \, cal(O)_(F_y) \)$, is zero.
    This argument applies also when $y$ is the generic point of $T$; no flatness at $y$ is required.
  For closed $y$, the analytic exponential sequence on the projective complex scheme $F_y$ gives
  $ "Pic" \( F_y^(upright("an")) \) arrow.r^(med c_1 med) H^2 \( F_y^(upright("an")) \, bb(Z) \) arrow.r
    H^2 \( F_y^(upright("an")) \, cal(O)_(F_y^(upright("an"))) \) . $
  The exponential sequence remains exact in the presence of nilpotents:
    the exponential and logarithm are inverse on a nilpotent ideal,
    and the usual sequence is exact on the reduction. The scheme form of GAGA #cite(label("RaynaudSGA1XII"))
    Corollary 4.3 and Theorem 4.4, extending Serre’s projective comparison #cite(label("SerreGAGA")),
    identifies the last group with the group already proved to vanish and identifies analytic line bundles with
    algebraic ones, including on this possibly nonreduced proper scheme.
    Thus $c_1$ is surjective integrally, and tensoring with $bb(Q)$ proves the assertion. ◻
]

#thm([Lemma 6.4.])[
  #emph[The local systems $cal(W)$ and $cal(V)_T$ have finite monodromy.
    Put $K_T = kappa \( eta_T \)$ and $F_(eta_T) = tilde(Y) times_Y "Spec" K_T$. There are $b_T$ line bundles
$ L_1 \, dots.h \, L_(b_T) in "Pic" \( F_(eta_T) \) $

 whose spreads over a sufficiently small $T^compose$ have linearly independent images under $r$ in every fibre of
   $cal(V)_T$.]
] <local:generic-lines>

#proof[
  We give the parameter argument because the bundles are needed over $K_T$,
    rather than only over its algebraic closure. Fix a relatively ample line bundle $cal(O)_(cal(F)) \( 1 \)$.
    Every line bundle on a closed fibre is a quotient of some $cal(O)_(F_t) \( - m \)^(xor N)$.
    Let $m$, $N$, and the Hilbert polynomial vary. Grothendieck’s Quot-scheme theorem
    #cite(label("GrothendieckHilbert1961")) Theorems 3.1–3.2 gives the corresponding countable collection of
    schemes of finite type over $T^compose$. On each, take the open locus where the universal quotient is
    invertible on the whole pulled-back fibre family. These loci still parameterize every line bundle on every
    closed fibre. To justify openness, the family and the universal quotient are flat over the Quot scheme;
    a fibrewise locally free quotient of rank one is locally free near that fibre by the local criterion for
    flatness. Properness then removes the image of the complementary closed locus.
  There are only countably many irreducible components of these parameter spaces.
    Choose a very general $t in T^compose \( bb(C) \)$ outside the closures of the images of all components which
    do not dominate $T^compose$. Lemma 23 supplies finitely many line bundles on $F_t$ whose classes $c_1 \,
    dots.h \, c_N$ span $cal(W)_t$. Each is represented by a point of a dominating irreducible parameter
    component. The first Chern class of the universal line bundle gives a section of the pullback of $cal(W)$ to
    that component: this follows by restricting its class on the total family to the fibres and applying proper
    base change. The analytic space of this irreducible complex parameter component is path connected.
  Choose a closed point of the generic fibre of this parameter component. Its residue field is finite over $K_T$.
    Spreading the point, normalizing, and shrinking the base yields a connected finite étale cover of a dense open
    of $T^compose$, together with a line bundle on the pulled-back family.
    Choose a path in the parameter component from the original quotient point to a point on this cover.
    Flatness of the universal Chern class identifies the transported $c_i$ with the class at that cover point.
    The finite-index subgroup fixing the chosen sheet fixes this class;
    conjugating by the projected path gives a finite-index subgroup fixing $c_i$ at the original basepoint.
    Shrinking a smooth complex curve does not diminish the monodromy image of a local system originally defined on
    it: the induced map on fundamental groups is surjective. It follows that each $c_i$ has a finite orbit under
    $Gamma = pi_1 \( T^compose \, t \)$. Intersecting the stabilizers of this finite spanning set gives a subgroup
    of finite index acting trivially on $cal(W)_t$. The image $G$ of $Gamma$ in $"GL" \( cal(W)_t \)$ is therefore
    finite. Lemma 22 gives the same conclusion for $cal(V)_T$.
    Take a common dense open where all these covers are finite étale, move the basepoint into it,
    and transport the $c_i$ along one common path to the new basepoint, still denoted $t$.
    They still span $cal(W)_t$. Each cover class is a monodromy translate of the corresponding transported $c_i$.
    Changing its sheet realizes every element of that orbit, so choose a sheet giving $c_i$ itself.
  We next take norms of actual line bundles, not merely invariant points of a Picard functor.
    For the connected cover associated with $c_i$, let $H_i subset Gamma$ be the subgroup fixing its chosen sheet,
    and let $d_i = \[ Gamma : H_i \]$. The cover carries a line bundle $cal(L)_i$ whose class at that sheet is
    $c_i$ and is fixed by $H_i$. Its norm along the finite locally free map of fibre families is a line bundle on
    the original family; norms commute with base change #cite(label("Stacks")) Tags 0BCY and 0BD2.
    At $t$ its first Chern class is
  #[#set math.equation(numbering: n => "(6.1)")
   $ c_1 \( "Nm" cal(L)_i \) = sum_(gamma in Gamma \/ H_i) gamma c_i = d_i "Av"_G \( c_i \) \, wide
     "Av"_G \( c \) = frac(1, \| G \|) sum_(g in G) g c . $ <eq:local-norm-average>]
  For completeness, $H_i$ need not contain the kernel of $Gamma arrow.r G$.
    Nevertheless its image fixes $c_i$, and each element of the finite $G$-orbit of $c_i$ occurs equally often in
    the coset sum. Both expressions in (6.1) are $d_i$ times the orbit average,
    which proves the equality with its stated factor.
  The averages of a spanning set span $cal(W)_t^G$. Moreover,
    the surjection $r$ induces a surjection on invariants: averaging any lift of an invariant vector gives an
    invariant lift. Poincaré duality on the connected oriented real surface $T^compose$ identifies the dimension
    of $H_c^2 \( T^compose \, cal(V)_T \)$ with the dimension of the coinvariants of its monodromy representation.
    For a finite group over $bb(Q)$, invariants and coinvariants have the same dimension,
    since averaging identifies the latter with the former. Thus
  $ b_T = dim \( cal(V)_(T \, t) \)^G . $
  The norm bundles have generic fibres defined over $K_T$ itself, and their images span these invariants.
    Select $b_T$ of them whose images form a basis and rename their generic fibres $L_1 \, dots.h \, L_(b_T)$.
    On a common smaller open, their images are independent flat sections, proving the claim.
    Their invariant dimension, and hence $b_T$, is unchanged by further shrinking. ◻
]

=== 6.2 Extending line bundles without changing the residue field <extending-line-bundles-without-changing-the-residue-field>

The independent punctured classes are now represented by line bundles on the generic scheme fibre over $K_T$.
  We next extend these bundles in transverse directions while keeping that residue field unchanged.

#thm([Lemma 6.5.])[
  #emph[Let $L_1 \, dots.h \, L_b$ be finitely many line bundles on $F_(eta_T)$.
    There exist a normal integral quasi-projective variety $Y_e$, an étale morphism $q : Y_e arrow.r Y$,
    and a point $eta' in Y_e$ above $eta_T$ such that
$ K_T = kappa \( eta_T \) arrow.r^(med tilde.op med) kappa \( eta' \) $

 is the residue-field map, and every $L_i$ extends to a line bundle $tilde(L)_i$ on $tilde(Y)_e =
   tilde(Y) times_Y Y_e$. The extensions restrict to the specified $L_i$ on the same scheme fibre.
   The variety $tilde(Y)_e$ is smooth and integral, and $tilde(Y)_e arrow.r Y_e$ is projective and birational.]
] <local:etale-lines>

#proof[
  Write $A = cal(O)_(Y \, eta_T)$, $frak(m) = frak(m)_A$, and $Z = tilde(Y) times_Y "Spec" A$.
    The ring $A$ is an excellent local ring essentially of finite type over $bb(C)$, with residue field $K_T$.
    Let $hat(A)$ be its completion, and write $F_n = Z times_A A \/ frak(m)^(n + 1)$ as in the proof of Lemma 23.
  For $n gt.eq 0$, the square-zero ideal for $F_n subset F_(n + 1)$ is
  $ J_n = frak(m)^(n + 1) cal(O)_Z \/ frak(m)^(n + 2) cal(O)_Z . $
  Multiplication gives a surjection
  $ \( frak(m)^(n + 1) \/ frak(m)^(n + 2) \) ⊗_(K_T) cal(O)_(F_0) arrow.r.twohead J_n . $
  Its source is a finite direct sum of $cal(O)_(F_0)$. The kernel is coherent and has vanishing third cohomology,
    since $dim F_0 lt.eq 2$. Lemma 23 therefore implies $H^2 \( J_n \) = 0$.
    The exact sequence of units for a square-zero thickening, with $1 + J_n tilde.eq J_n$ additively,
    shows that the obstruction to lifting a line bundle from $F_n$ to $F_(n + 1)$ lies in this zero group
    #cite(label("Stacks")) Tag 0C6R. Each $L_i$ consequently has compatible lifts to every $F_n$.
  Grothendieck’s existence theorem #cite(label("EGAIII1")),
    in the projective form #cite(label("Stacks")) Tag 0885, for the scheme $Z_(hat(A))$ algebraizes these
    compatible systems of coherent sheaves and their morphisms. It produces invertible sheaves:
    algebraize the systems of inverse line bundles at the same time,
    and use full faithfulness to algebraize their tensor-product isomorphisms with $cal(O)$.
    Denote the resulting line bundles on $Z_(hat(A))$ by $hat(L)_i$.
    Their restrictions to $F_0$ are the specified $L_i$, with the chosen identifications.
  The finite-presentation limit property for invertible sheaves and their isomorphisms #cite(label("Stacks"))
    Tags 0B8W and 01ZR descends all $hat(L)_i$ to line bundles on $Z_R$ for a single finitely generated
    $A$-algebra $R$ equipped with a map $phi.alt : R arrow.r hat(A)$.
    One may include their inverses and the evaluation isomorphisms in these data.
    Since $A$ is noetherian, $R$ has a finite presentation. Applying Artin approximation to its finite system of
    equations gives a map
  $ psi : R arrow.r A^h $
  whose reduction in $K_T$ agrees with that of $phi.alt$, where $A^h$ is the ordinary henselization of $A$,
    whose completion is $hat(A)$. Only approximation modulo $frak(m)$ is used.
    This is the approximation theorem for an essentially finite-type local ring over a field
    #cite(label("Artin1969")) Theorem 1.10; the pointed étale formulation, including equality of residue fields,
    is #cite(label("Stacks")) Tag 07QZ.
  Pulling the descended line bundles back by $psi$ gives line bundles on $Z_(A^h)$ with the required special
    fibres. More explicitly, the two maps $R arrow.r K_T$ are identical,
    so their restrictions are the same pullbacks of the line bundles on $Z_R$ to $Z_(K_T) = F_0$.
    Thus the argument preserves bundles on the entire scheme fibre; it does not merely preserve their numerical classes.
  The ordinary henselization is the filtered colimit of pointed étale neighbourhoods with unchanged residue field
    #cite(label("Stacks")) Tags 0A02 and 0A03. The same finite-presentation property descends our finite list of
    bundles to one such neighbourhood. Spreading it from $"Spec" A$ to an affine open of $Y$ gives $q :
    Y_e arrow.r Y$ and $eta'$ as claimed, after shrinking around $eta'$.
    Since $Y$ is normal, its étale neighbourhood is normal. Its irreducible components are open and closed;
    take the one containing $eta'$. It is integral and dominant over $Y$, since an étale map is open.
    We may take $Y_e$ quasi-projective by the affine construction.
  Finally $tilde(Y)_e$ is smooth, since it is étale over the smooth variety $tilde(Y)$.
    Its irreducible components are disjoint and open. Every component has nonempty open image in $tilde(Y)$,
    and hence meets $pi^(- 1) \( Y_(upright("reg")) \)$. Over this dense open the base change is the nonempty
    integral open $q^(- 1) \( Y_(upright("reg")) \)$ of $Y_e$.
    Every component meeting that integral open forces there to be just one component.
    Hence $tilde(Y)_e$ is integral. Its map to $Y_e$ is projective and is an isomorphism over
    $q^(- 1) \( Y_(upright("reg")) \)$, so it is birational. ◻
]

Apply the lemma to the bundles in Lemma 24, put $b = b_T$, and let $T' subset Y_e$ be the closure of $eta'$.
  Write $pi_e : tilde(Y)_e arrow.r Y_e$ for the base-changed resolution and $j_e : \( Y_e \)_(upright("reg"))
  arrow.r.hook Y_e$ for the smooth-locus inclusion. The induced map $T' arrow.r
  T$ is an isomorphism on suitable dense opens: it is generically an isomorphism by the residue-field identity.
  On that open the restrictions of $tilde(L)_i$ agree with the spreads used in Lemma 24.
  Indeed, their isomorphisms on the generic scheme fibre spread after shrinking, by finite presentation.
  At a closed complex point an étale map is a local analytic isomorphism.
  The local systems of punctured cohomology and the maps from resolution-fibre cohomology are therefore identified
  near these points. It follows that the images of $c_1 \( tilde(L)_1 \) \, dots.h \,
  c_1 \( tilde(L)_b \)$ in punctured degree-two cohomology along a dense open of $T'$ remain independent.

=== 6.3 Degrees on a small model <degrees-on-a-small-model>

Although $Y$ is $bb(Q)$-factorial, its étale neighbourhood $Y_e$ need not be.
  We pass to a small $bb(Q)$-factorial model to make the extended divisor classes $bb(Q)$-Cartier and measure them
  by degrees on its fibre curves. The variety $Y_e$ is terminal, so the small $bb(Q)$-factorialization theorem,
  the empty-extraction case of #cite(label("BCHM")) Corollary 1.4.3, supplies a projective small morphism

$ g : Y' arrow.r Y_e $

with $Y'$ $bb(Q)$-factorial. Since $g$ is small and $K_(Y_e)$ is $bb(Q)$-Cartier,

#[#set math.equation(numbering: n => "(6.2)")
 $ K_(Y') = g^(*) K_(Y_e) \; $ <eq:local-small-crepant>]

in particular $Y'$ is terminal.

The morphism $g$ is an isomorphism over the smooth locus of $Y_e$.
  To see this directly, push a relatively ample divisor on $Y'$ down to a Weil divisor on $Y_e$.
  On the smooth locus it is Cartier, and its pullback equals the original divisor there,
  since $g$ has no exceptional divisors. Positive-dimensional fibres would then have both positive and zero degree
  against this divisor, a contradiction. A proper quasi-finite birational morphism to a normal variety is an
  isomorphism.

After shrinking $Y_e$ around $eta'$, all its singular points lie on $T'$,
  and every fibre of $g$ has dimension at most one. For the last assertion,
  a component of $g^(- 1) \( T' \)$ with generic fibre dimension at least two would be a divisor in $Y'$
  contracted to a curve, contradicting smallness; the remaining fibre-dimension jumps form a closed set which does
  not contain $eta'$ and may be removed.

Choose Cartier divisors $tilde(D)_i$ representing the line bundles $tilde(L)_i$ on the smooth integral variety
  $tilde(Y)_e$. Let $D_i$ be their pushforwards to $Y_e$ and $D'_i$ their strict transforms on $Y'$.
  Each $D'_i$ is $bb(Q)$-Cartier. Let

$ C_1 \, dots.h \, C_s $

be the distinct irreducible curve components of $g^(- 1) \( eta' \)$, with their reduced structures,
  counted over $kappa \( eta' \) = K_T$.

#thm([Lemma 6.6.])[
  #emph[The vectors
$ #scale(x: 120%, y: 120%)[\(] D'_i dot.op C_1 \, dots.h \,
  D'_i dot.op C_s #scale(x: 120%, y: 120%)[\)] in bb(Q)^s \, wide 1 lt.eq i lt.eq b \, $

 are linearly independent. In particular $s gt.eq b$.]
] <local:degree-independence>

#proof[
  Suppose that $D' = sum_i lambda_i D'_i$, with $lambda_i in bb(Q)$, has zero degree on every $C_j$.
    We will show that $D'$ is numerically trivial over a neighbourhood of $eta'$ and that a multiple therefore
    descends to $Y_e$. A line bundle from $Y_e$ has zero punctured Chern class,
    so this descent will contradict the independence of the original classes unless every $lambda_i$ is zero.
  Choose an algebraic closure of $K_T$. The geometric irreducible components of an integral $K_T$-curve $C_j$ are
    permuted transitively by the absolute Galois group. The divisor $D'$ is defined over $K_T$,
    so its degrees on these components are equal. Degree is preserved under extension of the ground field and adds
    over the components of the fundamental cycle. The equality $D' dot.op C_j =
    0$ therefore implies zero degree on every geometric curve component.
    This argument also accounts for any multiplicities if the whole scheme fibre is nonreduced.
  All the reduced geometric components are defined over one finite extension of $K_T$.
    Normalize a dense open of $T'$ in that extension, and shrink until the resulting curve cover is finite étale.
    Take the closures of the geometric components in the pulled-back projective family.
    By generic flatness and openness of geometric integrality,
    we may make their curve families flat with geometrically integral fibres.
    Their degrees against a Cartier multiple of $D'$ are then constant and equal to zero.
    Include any zero-dimensional generic components in this construction as well; after shrinking,
    their fibres remain zero-dimensional. The union of these closures accounts set-theoretically for the whole
    family after another shrinking. Indeed its complement has constructible image in the base curve,
    and this image does not contain the generic point, so its closure is a finite set.
    Thus every curve in every remaining fibre over $T'$ has degree zero.
    There are no vertical curves away from $T'$, where $g$ is an isomorphism.
    Removing the finitely many discarded points from $Y_e$ proves the desired relative numerical triviality.
  Choose a positive integer $m$ such that $L = m D'$ is Cartier. It is $g$-nef.
    By (6.2), $L - K_(Y')$ is also $g$-nef. It is $g$-big: relative bigness is tested on the generic fibre,
    which is a point for this birational morphism. The relative base point free theorem for the effective klt pair
    $\( Y' \, 0 \)$ therefore makes $L$ semiample over $Y_e$;
    the saturation hypothesis in its sub-klt formulation is automatic here #cite(label("FujinoBPF")) Theorem 2.1
    and Remark 3.16.
  We explain why a multiple descends all the way to $Y_e$. Its semiample morphism,
    followed by Stein factorization, gives
  $ Y' arrow.r^h W arrow.r^k Y_e \, $
  where $h$ has connected fibres, $W$ is normal, $k$ is projective,
    and a positive multiple of $L$ is the pullback of a $k$-ample line bundle on $W$.
    Because $L$ has degree zero on all $g$-vertical curves, $h$ contracts every curve in every $g$-fibre.
    These fibres have dimension at most one and are connected,
    the latter because $g$ is proper birational with normal target.
    Their images under $h$ are consequently single points. Thus every fibre of $k$ is zero-dimensional.
    The morphism $k$ is finite and birational, and normality of $Y_e$ makes it an isomorphism. We have proved that
  #[#set math.equation(numbering: n => "(6.3)")
   $ cal(O)_(Y') \( m' D' \) tilde.eq g^(*) M $ <eq:local-line-descent>]
  for a positive integer $m'$ and a line bundle $M$ on $Y_e$, with $m'$ also clearing all the $lambda_i$.
  On the smooth open of $Y_e$, both $g$ and the resolution are isomorphisms.
    By construction of the pushforwards $D_i$, (6.3) identifies the restriction there of
  $ ⨂_i tilde(L)_i^(⊗ m' lambda_i) $
  with the pullback of $M$. At a general closed point of $T'$,
    the bundle $M$ is trivial on a neighbourhood in the base.
    Its first Chern class on the punctured smooth neighbourhood is therefore zero.
    Naturality of $R pi_(e *) bb(Q) arrow.r R j_(e *) bb(Q)$ says that the image of a resolution-fibre Chern class
    is precisely this punctured Chern class of the same bundle. Hence
  $ sum_i lambda_i thin r #scale(x: 120%, y: 120%)[\(] c_1 \( tilde(L)_i \) #scale(x: 120%, y: 120%)[\)] = 0 $
  along a dense open of $T'$. The independence established after Lemma 25 forces every $lambda_i$ to be zero.
    This proves the lemma. ◻
]

=== 6.4 Restriction of the valuations <restriction-of-the-valuations>

We isolate the residue-field argument that prevents distinct valuations from merging under restriction.
  The étale neighbourhood in this statement is not required to be finite.

#thm([Lemma 6.7.])[
  #emph[Let $q : Y_e arrow.r Y$ be a dominant étale morphism of normal integral complex varieties, let $eta in Y$,
    and fix $eta' in Y_e$ above $eta$ such that $kappa \( eta \) arrow.r kappa \( eta' \)$ is an isomorphism.
    Suppose that $Y$ is $bb(Q)$-Gorenstein. On normalized divisorial valuations of $bb(C) \( Y_e \)$ with centre
    the closure of $eta'$, restriction to $bb(C) \( Y \)$ is already normalized, remains divisorial,
    and is injective. Moreover
$ a \( w \; Y_e \, 0 \) = a \( w \|_(bb(C) \( Y \)) \; Y \, 0 \) . $

]
] <local:restriction-injective>

#proof[
  The function-field extension $bb(C) \( Y_e \) \/ bb(C) \( Y \)$ is finite,
    because the dominant étale morphism is quasi-finite. The elementary finite-extension inequalities for
    valuations imply that the restriction of a nontrivial discrete valuation is nontrivial and discrete,
    that its value group has finite index in the original group,
    and that the residue-field extension is finite #cite(label("Stacks")) Tag 0ASH.
    Consequently, if $w$ is divisorial, the normalized restriction $v$ has residue transcendence degree $dim Y -
    1$ and is divisorial. One can see the last assertion without any choice of a completion:
    choose $dim Y - 1$ value-zero rational functions with algebraically independent residues,
    resolve their maps to $bb(P)^1$ on a proper birational model of $Y$, and then resolve that model.
    The centre of $v$ has dimension at least $dim Y - 1$, by those residues, and is not the generic point,
    since $v$ is nontrivial. Thus it is a divisor.
  Choose a projective birational morphism $mu : Z arrow.r Y$ with $Z$ smooth and carrying the prime divisor $E$
    with $v = "ord"_E$, and form
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$Z_e = Z times_Y Y_e$])
  content((2.849, 0), [$Z$])
  content((0, -1.585), [$Y_e$])
  content((2.849, -1.585), [$Y .$])
  line((1.062, 0), (2.513, 0), mark: (end: ">"))
  content((1.788, 0.2266), [#text(size: 0.73em)[$p$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.3705, -0.7927), [#text(size: 0.73em)[$mu_e$]])
  line((2.849, -0.2725), (2.849, -1.313), mark: (end: ">"))
  content((3.123, -0.7927), [#text(size: 0.73em)[$mu$]])
  line((0.468, -1.585), (2.447, -1.585), mark: (end: ">"))
  content((1.458, -1.812), [#text(size: 0.73em)[$q$]])
})
  The scheme $Z_e$ is smooth, because $p$ is étale. It is also integral with function field $bb(C) \( Y_e \)$.
    Indeed, its irreducible components are disjoint and open, and each has nonempty open image in $Z$.
    Every component therefore meets the inverse image of a dense open $U subset
    Y$ over which $mu$ is an isomorphism. That inverse image is the nonempty integral open $q^(- 1) \( U \) subset
    Y_e$. There can be only one component. The projective map $mu_e$ is an isomorphism over $q^(- 1) \( U \)$,
    proving the function-field assertion.
  By properness of $mu_e$, the valuation $w$ has a centre $x$ on $Z_e$.
    Its image on $Z$ is $eta_E$, since its restriction is a positive multiple of $v$,
    and its image on $Y_e$ is $eta'$. The points lying above this specified pair are the points of
  #[#set math.equation(numbering: n => "(6.4)")
   $ "Spec" #scale(x: 120%, y: 120%)[\(] kappa \( eta_E \) ⊗_(kappa \( eta \)) kappa \( eta' \)
     #scale(x: 120%, y: 120%)[\)] = "Spec" kappa \( eta_E \) . $ <eq:local-residue-point>]
  There is therefore exactly one possible point $x$. Since $p$ is étale,
    its local ring $cal(O)_(Z_e \, x)$ is a discrete valuation ring,
    and its maximal ideal is generated by a uniformizer of $cal(O)_(Z \, eta_E)$.
    Thus the ramification index is one. Any normalized valuation of $bb(C) \( Y_e \)$ centred at this DVR equals
    its order: every nonzero element of the fraction field is a power of a uniformizer times a unit of the DVR,
    and a centred valuation is zero on such units. It follows that $w$ is uniquely determined by $v$ and $eta'$.
    Its restriction is exactly $v$, not a larger integral multiple.
    This proves both injectivity and the normalization assertion.
  Finally choose compatible canonical divisors in the displayed étale square. Then
  $ K_(Z_e) - mu_e^(*) K_(Y_e) = p^(*) \( K_Z - mu^(*) K_Y \) . $
  The coefficient at the divisor with generic point $x$ is the coefficient at $E$,
    because its ramification index is one. Adding one to these coefficients proves equality of log discrepancies. ◻
]

#proof[
  If $b_T = 0$ there is nothing to prove. Otherwise apply Lemmas 24 and 25 and use the small model $g : Y' arrow.r
    Y_e$ constructed above. Lemma 26 gives at least $b_T$ distinct arithmetic curve components $C_i$ of
    $g^(- 1) \( eta' \)$. Their closures $S_i subset Y'$ are distinct surfaces.
    They have codimension two, so terminality makes $Y'$ smooth at their generic points.
    The ordinary blowup of each smooth generic centre $S_i$ has a unique exceptional prime there.
    Let $w_i$ be its normalized divisorial valuation. The codimension-two blowup formula gives
  $ a \( w_i \; Y' \, 0 \) = 2 . $
  Their centres $S_i$ distinguish them. By (6.2), they have the same log discrepancy over $Y_e$,
    and their centres on $Y_e$ are exactly $T'$.
  Lemma 27 now gives distinct normalized divisorial valuations $v_i = w_i \|_(bb(C) \( Y \))$,
    each with centre $T$ and with
  $ a \( v_i \; Y \, 0 \) = 2 . $
  Choose a prime component $D$ of $Theta$ with positive coefficient and containing $T$.
    Since $Y$ is $bb(Q)$-factorial, a positive multiple of $D$ is Cartier near $eta_T$,
    with a local equation in the maximal ideal of $cal(O)_(Y \, eta_T)$.
    A valuation centred there has strictly positive value on this equation.
    Effectivity of $Theta$ consequently gives $v_i \( Theta \) > 0$, and hence
  $ a \( v_i \; Y \, Theta \) = 2 - v_i \( Theta \) < 2 . $
  The centres distinguish the valuations arising from different curves. This completes the proof. ◻
]

Summing this proposition over the singular curves contained in $Q$ bounds the final sum in (5.14) by the
  codimension-three valuation count. Lemma 10 makes this count finite,
  completing the branch inequality as explained at the end of Section 5.

== 7 Descent of the difficulty and klt termination <sec:difficulty>

Return to the prepared terminal chain of Section 4. Its labels $S_h$ persist,
  their coefficients are nonincreasing, and their default echo weights $d_h$ are constant.
  The integer $cal(D)$ is the finite corrected sum in Definition 15.

The branch theorem now supplies the lower bound isolated in (4.7).
  To obtain termination, we must also compare this integer across every move of the chain.
  The normalization-rank correction was chosen so that its change cancels exactly the change in the subtracted
  branch defaults. We prove this identity first, then show that each positive-side surface downstairs forces an
  integer weight to drop between consecutive junctions.

=== 7.1 Divisor ranks on the normalizations <divisor-ranks-on-the-normalizations>

We record explicitly the homological fact which will cancel the changes of the defaults under a small flip.

#thm([Lemma 7.1.])[
  #emph[Let $q : S arrow.r T$ be a projective birational morphism of normal projective threefolds.
    The cycle classes in $H_4 \( S \, bb(Q) \)$ of the prime divisors contracted by $q$ are linearly independent.]
] <difficulty:normalization-independence>

#proof[
  Take a projective resolution $r : tilde(S) arrow.r S$ which is an isomorphism over $U = S_(upright("reg"))$,
    and put $E = r^(- 1) \( S \\ U \)$. Normality gives $dim \( S \\ U \) lt.eq 1$, so $dim E lt.eq 2$.
    Suppose a rational combination of the contracted divisors has zero class in $H_4 \( S \, bb(Q) \)$.
    The corresponding combination of their strict transforms has zero restriction to
    $H_4^(upright("BM")) \( U \, bb(Q) \)$. The localization sequence
  $ H_4 \( E \, bb(Q) \) arrow.r H_4 \( tilde(S) \, bb(Q) \) arrow.r H_4^(upright("BM")) \( U \, bb(Q) \) $
  is exact. Its first group is generated by the fundamental classes of the irreducible surface components of $E$;
    components of dimension at most one contribute nothing in degree four.
    Consequently one can correct the strict-transform combination by a rational combination of
    resolution-exceptional divisors to obtain a divisor with zero homology class on $tilde(S)$.
  Every divisor in this corrected combination is exceptional over $T$.
    This is true for the original strict transforms by assumption.
    For a resolution-exceptional divisor it follows because its image in $S$ has dimension at most one,
    and hence so does its image in $T$. On the smooth projective threefold $tilde(S)$,
    a homologically trivial divisor is numerically trivial. Applying the negativity lemma to this exceptional
    divisor and to its negative shows that it is zero as a divisor.
    None of the strict transforms is resolution-exceptional, so all original coefficients vanish. ◻
]

Consider now one of the small terminal flips of our chain, written $Y^(-) arrow.r Z arrow.l Y^(+)$,
  with the full bad sets $W^(-) \, W^(+)$. For a label $S_h$,
  let $T_h$ be the normalization of its common image in $Z$. Since the ambient maps are small, the two maps

$ \( S_h^(-) \)^nu arrow.r T_h arrow.l \( S_h^(+) \)^nu $

are projective birational morphisms. Let $e_h^plus.minus$ be the number of divisors in these normalizations lying
  over the corresponding bad set. They are exactly the divisors counted by $r_(V \, h)$ for surfaces $V subset
  W^plus.minus$.

Indeed, normalization is finite and so preserves the dimension of these images in $S_h^plus.minus$.
  A divisor in the normalization has a surface image. The bad locus on the ambient base has dimension at most one
  by Lemma 3; consequently all these divisors are contracted over $T_h$.
  Conversely, outside the bad set the ambient maps, and hence the normalizations of their labeled divisors,
  identify. Thus all exceptional divisors of the displayed morphisms occur in this list.

Restriction to the common open identifies the spans of the restricted divisor cycle classes:
  every divisor on that open has a closure on either projective normalization.
  By localization, the kernels of these restrictions are the spans of the bad-locus divisors.
  Lemma 28 computes their dimensions as $e_h^plus.minus$. We obtain the exact equality

#[#set math.equation(numbering: n => "(7.1)")
 $ rho_(*) \( \( S_h^(-) \)^nu \) - rho_(*) \( \( S_h^(+) \)^nu \) = e_h^(-) - e_h^(+) . $ <difficulty:rank-difference>]

This equality concerns divisor cycle classes on the normalizations;
  it does not require a Picard-number identity for the ambient flip.

=== 7.2 Boundedness and monotonicity <boundedness-and-monotonicity>

#thm([Proposition 7.2.])[
  #emph[On the prepared terminal chain, the integer $cal(D) \( Y \, Theta \)$ has the following properties.]
  + #emph[It is nonnegative at every crepant junction.]
  + #emph[It is nonincreasing under every coefficient decrease and every small terminal flip.]
  + #emph[If the weight of one exceptional valuation strictly decreases in one of these moves,
    then the difficulty strictly decreases.]
  #emph[No separate nonnegativity assertion is required for the intermediate models in a bridge.]
] <prop:difficulty>

#proof[
  At a crepant junction $p : Y arrow.r X_i$, let $Q$ be the reduced union of the varying labels.
    If this union is empty, Lemma 16 already makes every surface bracket nonnegative,
    and all other terms of (4.2) are nonnegative. Otherwise each component of $Q$ has positive coefficient and,
    by Proposition 13, $dim p \( Q \) lt.eq 1$. For every surface in $Q$,
    its branch number in Theorem 17 equals $r_V^(upright("var"))$.
    Surfaces outside $Q$ have no negative allowance in (4.3).
  For a varying label $b_h > 0$, so $d_h gt.eq w \( b_h \) gt.eq 1$.
    Moreover, every valuation in the right-hand count of Theorem 17 has a codimension-three center and weight at
    least one, and thus is counted in the first term of (4.2). It follows from that theorem that
  $ sum_(V subset Q) \( r_V^(upright("var")) - 1 \) lt.eq sum_(h upright(" varying")) d_h rho_(*) \( S_h^nu \) +
    sum_("codim"_Y c_Y \( v \) gt.eq 3) w_v . $
  Substitution in (4.7) proves (i). The valuations on the right have codimension-three centers,
    so none has been reused as a valuation in a surface bracket.
  For a coefficient decrease the variety, all centers, all branch numbers,
    and all normalization ranks remain fixed. The boundary removed is effective and $bb(Q)$-Cartier;
    hence every discrepancy is nondecreasing and every weight is nonincreasing.
    The $d_h$ remain unchanged by our preparation. To check that this comparison is a finite one,
    take the union of the exceptional surface centers in Lemma 10 for the two boundaries.
    Outside this finite set a nonzero local contribution consists of the echoes on a single label.
    Each of their finitely many possibly positive weights is nonincreasing,
    while their sum is the unchanged $d_h$. Thus each such echo weight is unchanged.
    The codimension-at-least-three contributions, and the contributions at the finitely many exceptional surface
    centers, can therefore be compared as finite sums with unchanged corrections.
    Their weights only decrease; a strict decrease of any exceptional valuation strictly decreases the total.
    This proves (ii) and (iii) for a coefficient move.
  For a small flip, all prime labels and all exceptional divisorial valuations correspond on the two sides.
    By Lemma 3, the set
  $ cal(A) & = { v : med v upright(" is exceptional and ") c_(Y^(-)) \( v \) subset W^(-) }\
 & = { v : med v upright(" is exceptional and ") c_(Y^(+)) \( v \) subset W^(+) } $
  is the same on both sides. Set
  $ cal(A)_0 = { v in cal(A) : med w_v \( Y^(-) \, Theta^(-) \) + w_v \( Y^(+) \, Theta^(+) \) > 0 } . $
  This is finite. Each bad set has dimension at most two and has finitely many surface components;
    a valuation with a surface center contained in it has one of these centers.
    Lemma 10 gives finiteness at each of them and finiteness of all positive-weight terms with centers of
    codimension at least three.
  The generic centers not contained in the bad sets identify on the common open.
    Their discrepancies, local corrections, and labels therefore agree.
    Write $w_v^plus.minus = w_v \( Y^plus.minus \, Theta^plus.minus \)$.
    Separating the finite bad-set contributions in (4.2) gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ cal(D) \( Y^(-) \, Theta^(-) \) - cal(D) \( Y^(+) \, Theta^(+) \) =  &
     sum_(v in cal(A)_0) \( w_v^(-) - w_v^(+) \) - sum_h d_h \( e_h^(-) - e_h^(+) \)\
 & + sum_h d_h #scale(x: 120%, y: 120%)[\(] rho_(*) \( \( S_h^(-) \)^nu \) -
   rho_(*) \( \( S_h^(+) \)^nu \) #scale(x: 120%, y: 120%)[\)]\
=  & sum_(v in cal(A)_0) \( w_v^(-) - w_v^(+) \) . $ <difficulty:flip-difference>]
  The second equality is exactly (7.1). Discrepancy monotonicity makes every summand in the last expression
    nonnegative. A strict weight drop gives a positive summand and hence a strict drop of the difficulty.
    Valuations whose centers change from a surface to a curve, or conversely,
    are still counted once in the raw part on each side; they merely move between the first two displayed sums of
    (4.2). Positive weights becoming zero are included in $cal(A)_0$.
    Thus neither kind of change is lost in the comparison. This completes (ii) and (iii). ◻
]

#prodef([Remark 7.3.])[
  The local bracket at a bad surface may cancel the weight of a generic echo.
    Formula (7.2) shows why this cannot absorb a strict decrease:
    the change of that default is matched exactly by the normalization-rank term.
    This remains true when a varying coefficient tends to zero while its positive default stays constant.
    An intermediate difficulty may initially have been defined as a signed integer;
    Proposition 29 then bounds it below by the nonnegative value at the next junction.
]

=== 7.3 Detecting positive-side surfaces <detecting-positive-side-surfaces>

#thm([Theorem 7.4.])[
  #emph[Every program in Definition 1 starting with a projective klt fourfold pair over $bb(C)$ with rational
    boundary has finitely many birational steps. No pseudo-effectivity hypothesis is needed.]
] <thm:klt-termination>

#proof[
  Suppose that such a program has infinitely many birational steps.
    Lemma 5, applied in cycle dimension three, removes all divisor-losing steps after a finite prefix.
    The remaining program is small. Construct its terminal chain by Proposition 11,
    and make the truncations in Proposition 13 and Lemma 14. By Proposition 29,
    the difficulties at its crepant junctions are nonnegative integers and are nonincreasing.
  Consider a downstairs step with an irreducible surface $V subset W_i^(+)$.
    Proposition 13 says that the ambient variety is smooth at $eta_V$ and that its minimal log discrepancy there
    exceeds one. The ordinary generic blowup of $V$ defines a normalized valuation $v$ whose positive-side
    discrepancy is
  $ a^(+) = a \( v \; X_(i + 1) \, B_(i + 1) \) = 2 - sum_h m'_h b'_h > 1 \, $
  where $m'_h$ are boundary multiplicities at $eta_V$ and $b'_h$ are the original boundary coefficients carried by
    strict transform downstairs. Effectiveness gives $a^(+) lt.eq 2$, and the choice of $N$ gives
  $ M := N \( 2 - a^(+) \) = N sum_h m'_h b'_h in bb(Z)_(gt.eq 0) . $
  By the full bad-set strictness in Lemma 3, $a^(-) := a \( v \; X_i \, B_i \) < a^(+)$. Consequently
  #[#set math.equation(numbering: n => "(7.3)")
   $ w \( 2 - a^(-) \) gt.eq M + 1 \, wide w \( 2 - a^(+) \) = M . $ <eq:difficulty-unit-drop>]
  In particular the argument includes $a^(+) = 2$, when the positive-side weight is zero.
    Strict discrepancy increase alone would not imply this unit drop without the integral final deficit.
  The valuation $v$ is exceptional downstairs on both sides, since the step is small.
    It does not belong to the stabilized list $I_0$: its positive-side discrepancy exceeds one,
    whereas $I_0$ is the common list of exceptional valuations of discrepancy at most one.
    The terminal junctions extract exactly $I_0$, so $v$ is exceptional on both junction models.
    Every intervening birational move is small, and a coefficient change does not alter the model.
    Hence $v$ stays exceptional throughout this finite bridge.
    Crepancy at its endpoints identifies its junction weights with those in (7.3).
    At least one move in the bridge therefore strictly lowers its weight.
    By Proposition 29, the difficulty strictly decreases between these consecutive junctions.
  A nonincreasing sequence of nonnegative integers has only finitely many strict decreases.
    Thus only finitely many downstairs steps have positive-side bad surfaces. Discard them.
    On the remaining small tail, Lemma 5 in cycle dimension two removes negative-side bad surfaces after finitely
    many further steps. Both bad loci of every subsequent step would then have dimension at most one,
    contradicting the inequality $dim W_i^(-) + dim W_i^(+) gt.eq 3$ of Lemma 3.
    This contradiction proves termination. ◻
]

== 8 Log canonical pairs and continuation of the program <sec:lc>

We continue to work over $bb(C)$. We first deduce termination for elementary $bb(Q)$-factorial dlt programs from
  Theorem 31. We then lift a prescribed small tail of an arbitrary lc program to such a program.
  The lift is an auxiliary construction in the proof: it does not replace the given initial model in Definition 1.
  For the standard definition of dlt pairs, see #cite(label("KM98")).

=== 8.1 Elementary dlt steps and special termination <elementary-dlt-steps-and-special-termination>

An elementary step in this subsection means the usual divisorial contraction or flip of a negative extremal ray on
  a $bb(Q)$-factorial dlt pair. Their existence follows from the klt contraction and flip theorems and relative
  base point freeness.

#thm([Lemma 8.1.])[
  #emph[Let $\( U \, Delta \)$ be a projective $bb(Q)$-factorial dlt pair with rational boundary,
    and let $R$ be a $\( K_U + Delta \)$-negative extremal ray. Its elementary contraction exists.
    If it is birational and small, its flip exists, is projective, and is a $\( K_U + Delta \)$-flip.
    Divisorial contractions and flips preserve $bb(Q)$-factoriality and the dlt property.]
] <lem:dlt-elementary>

#proof[
  Put $D = K_U + Delta$ and $F = floor.l Delta floor.r$. For a sufficiently small positive rational number
    $epsilon$, the pair
  $ \( U \, Delta_epsilon \) \, wide Delta_epsilon = Delta - epsilon F \, $
  is klt, and $D_epsilon = K_U + Delta_epsilon$ is negative on $R$.
    Here $F$ is $bb(Q)$-Cartier by $bb(Q)$-factoriality. Decreasing an effective $bb(Q)$-Cartier part of a dlt
    boundary preserves dlt, and a dlt boundary with no coefficient one is klt;
    see #cite(label("KM98")) Corollary 2.39 and Proposition 2.41.
    Negativity on $R$ is an open condition on $epsilon$, since it can be checked on one nonzero numerical class in
    this ray.
  The klt cone and contraction theorem gives the contraction $f : U arrow.r V$ of $R$,
    with normal projective target and connected fibres. It has relative Picard number one.
    If $f$ is small, klt flip existence gives a projective small map $f^(+) : U^(+) arrow.r
    V$ on which $D_epsilon^(+) = K_(U^(+)) + Delta_epsilon^(+)$ is relatively ample;
    see #cite(label("BCHM")) Corollary 1.4.1. The output is $bb(Q)$-factorial;
    the elementary statements are also recorded in #cite(label("BCHM")) Lemma 3.10.2.
  We check the positive sign for the full boundary. In $N^1 \( U \/ V \)$ there is a positive rational number $t$
    such that
  $ D equiv_V t D_epsilon . $
  Indeed both classes have negative degree on $R$, this relative space has dimension one,
    and their degrees on an integral curve are rational. The $bb(Q)$-Cartier divisor $L = D -
    t D_epsilon$ is numerically trivial over $V$. A Cartier multiple of $L$ is relatively nef,
    and its difference from $D_epsilon$ is relatively ample. Relative klt base point freeness therefore makes a
    positive multiple of $L$ semiample over $V$; the applicable statement is #cite(label("BCHM")) Theorem 3.9.1.
    Its associated morphism contracts every curve in every $f$-fibre.
    A projective image of positive dimension contains a curve, and a curve in such an image has a curve lift.
    Consequently that morphism is constant on each connected $f$-fibre.
    Normality and the usual factorization through a proper morphism with connected fibres show that it factors
    through $V$. Equivalently, after a further multiple its semiample model is finite and birational over $V$,
    hence is $V$. Thus
  $ L tilde.op_(bb(Q)) f^(*) M $
  for a $bb(Q)$-Cartier divisor $M$ on $V$.
  Since the flip is small on both sides, this identity of rational line bundles transforms into
  $ K_(U^(+)) + Delta^(+) tilde.op_(bb(Q)) t D_epsilon^(+) + \( f^(+) \)^(*) M . $
  The full adjoint is therefore ample over $V$. The graph comparison of Lemma 3 applies to these adjoints and
    their strict boundaries and proves discrepancy improvement; in particular the full positive pair is lc.
    The same comparison gives the usual dlt preservation. More explicitly,
    every valuation of log discrepancy zero on the positive side had discrepancy zero on the negative side,
    and its centre was not contained in the bad locus. Its generic centre is consequently in the unchanged snc
    neighbourhood supplied by the dlt property. The characterization of dlt by such snc neighbourhoods,
    or directly #cite(label("BCHM")) Lemma 3.10.10(1), gives dlt on $U^(+)$.
  For an elementary divisorial contraction the target is $bb(Q)$-factorial by the usual klt contraction theorem,
    so the pushforward full adjoint is $bb(Q)$-Cartier. The same discrepancy argument gives dlt preservation;
    see also #cite(label("BCHM")) Remark 3.10.5 and Lemma 3.10.10(1). ◻
]

#thm([Theorem 8.2.])[
  #emph[Every program of elementary negative birational steps starting from a projective $bb(Q)$-factorial dlt
    fourfold pair with rational boundary has finitely many steps, independently of its successive ray choices.]
] <thm:dlt-termination>

#proof[
  Suppose such a program were infinite. By Lemma 5, only finitely many of its steps lose a prime divisor.
    Discard that finite prefix, leaving a sequence of elementary dlt flips.
  We use special termination in its ordinary dlt form: #cite(label("FujinoSpecial")) Theorem 4.2.1 and
    Remark 4.2.2. This theorem assumes the log MMP for $bb(Q)$-factorial dlt pairs in dimensions at most one less
    than the dimension in question. For rational boundaries it needs only the rational-boundary forms of those
    lower-dimensional results. Here they are the classical at-most-three-dimensional log MMP,
    including flip existence and arbitrary termination, as in #cite(label("KollarEtAl1992")).
    In particular we do not invoke termination for four-dimensional lc pairs.
    The required fourfold special-termination conclusion is also stated directly in #cite(label("FujinoFourfold"))
    Theorem 1.2: eventually both the flipping and the flipped loci are disjoint from the round-down of the boundary.
  After this further truncation, replace each boundary $Delta_i$ by $Delta_i - floor.l Delta_i floor.r$.
    These pairs are klt. The removed divisors miss the surgery on both sides,
    so they have degree zero on all curves of the two elementary contractions.
    Thus the same negative rays and the same two relative signs remain valid for the decreased boundaries.
    Relative ampleness is unchanged by this relatively numerically trivial difference.
    We have obtained an infinite program from a projective klt fourfold pair with rational boundary,
    contrary to Theorem 31. ◻
]

=== 8.2 Lifting every prescribed lc tail <lifting-every-prescribed-lc-tail>

Lifting prescribed birational steps to finite dlt programs is standard;
  see #cite(label("LazicMoragaTsakanikas")) Lemma 3.1 and #cite(label("HanLiuZhuang2025")) Lemma 2.6;
  compare the scaling construction in #cite(label("BirkarLC")) Remark 2.9.
  We record the construction here, including the nonemptiness of each bridge and its identification with the
  prescribed positive model.

The following elementary convex observation is useful because a crepant dlt lift has adjoint-zero curves over the
  model downstairs.

#thm([Lemma 8.3.])[
  #emph[Let $\( U \, Delta \)$ be a projective lc pair, and let $h : U arrow.r
    Z$ be a projective morphism to a projective variety. If $K_U + Delta$ is not nef over $Z$,
    there is a $\( K_U + Delta \)$-negative extremal ray of the absolute cone $overline(upright("NE")) \( U \)$
    which is contracted by $h$. Its contraction factors $h$. If $h$ is birational, that contraction is birational.]
] <lem:vertical-ray>

#proof[
  Choose ample divisors $A$ on $U$ and $H$ on $Z$. The cone
  $ F_h = overline(upright("NE")) \( U \) ∩ \( h^(*) H \)^perp $
  is a closed face of the absolute cone. A negative vertical curve exists by the failure of relative nefness.
    Hence the linear functional $K_U + Delta$ has negative minimum on the compact slice $F_h ∩ { A dot.op gamma =
    1 }$. It has a negative extreme point there, which generates an extremal ray of $F_h$ and therefore of
    $overline(upright("NE")) \( U \)$. The lc cone theorem represents this negative ray by a curve.
    Its zero intersection with $h^(*) H$ says that it is vertical, since $H$ is ample.
  The absolute contraction contracts only curves in this ray.
    It follows that $h$ is constant on each of its connected fibres:
    otherwise a positive-dimensional projective image would contain a curve,
    which could be lifted to a curve in the fibre. The factorization through its normal target follows by the
    usual proper connected-fibre factorization. If $h$ is birational,
    a fibre-type contraction would force the dimension of that target to be smaller than $dim Z = dim U$,
    although it dominates $Z$. This is impossible. ◻
]

#thm([Proposition 8.4.])[
  #emph[Every program in Definition 1 starting from a projective lc fourfold pair over $bb(C)$ with rational
    boundary has finitely many birational steps.]
] <prop:lc-lift>

#proof[
  Suppose the contrary. Lemma 5 discards only finitely many steps and leaves an infinite small tail
  $ \( X_i \, B_i \) arrow.r Z_i arrow.l \( X_(i + 1) \, B_(i + 1) \) \, wide i gt.eq i_0 \, $
  in which both morphisms are small. All choices in this tail are kept fixed.
  Take a projective crepant $bb(Q)$-factorial dlt modification
  $ p_(i_0) : \( U_(i_0) \, Delta_(i_0) \) arrow.r \( X_(i_0) \, B_(i_0) \) . $
  The dlt blowup theorem provides such a morphism, with
  $ Delta_(i_0) = \( p_(i_0) \)_(*)^(- 1) B_(i_0) + "Exc" \( p_(i_0) \)_(upright("red")) \, wide K_(U_(i_0)) +
    Delta_(i_0) = p_(i_0)^(*) D_(i_0) \; $
  see #cite(label("FujinoFoundations")) Theorem 10.4. In particular every extracted prime has coefficient one and
    log discrepancy zero.
  Inductively suppose that $p_i : \( U_i \, Delta_i \) arrow.r \( X_i \, B_i \)$ is such a crepant dlt lift.
    Over $Z_i$ run elementary dlt MMP steps for $K_(U_i) + Delta_i$ until it becomes relatively nef.
    At any non-nef intermediate stage, Lemma 34 gives a negative #emph[absolute] extremal ray inside the vertical
    face. The face need not be entirely negative. The elementary step exists by Lemma 32,
    its contraction factors the map to $Z_i$, and it is birational because that map is birational.
    Every total space is projective and $bb(Q)$-factorial dlt.
    An infinite choice of such relative steps would consequently be an infinite absolute elementary dlt program,
    excluded by Theorem 33. The chosen relative program therefore reaches a nef end, say $\( U'_i \, Delta'_i \)$.
  This finite bridge is nonempty. Choose a curve $C$ contracted by $X_i arrow.r Z_i$. It has $D_i dot.op C < 0$.
    Projectivity of $p_i$ provides a curve $tilde(C)$ dominating $C$:
    take a component of the inverse image dominating $C$ and cut by sufficiently many general ample divisors.
    Crepancy gives
  $ \( K_(U_i) + Delta_i \) dot.op tilde(C) = deg \( tilde(C) \/ C \) D_i dot.op C < 0 . $
  Thus the starting lift was not nef over $Z_i$.
  We identify the end with a crepant lift of the #emph[prescribed] positive model $X_(i + 1)$.
    On a common smooth model of $U_i$, $U'_i$, and $X_(i + 1)$,
    the pullback of the starting adjoint can be written in two ways.
    The relative MMP writes it as the pullback of $K_(U'_i) +
    Delta'_i$ plus an effective divisor exceptional over $U'_i$.
    Crepancy of $p_i$ and Lemma 3 write it as the pullback of $D_(i + 1)$ plus an effective divisor exceptional
    over $X_(i + 1)$. One end is nef over $Z_i$ and the other is ample there.
    Lemma 7 gives a projective birational morphism
  $ p_(i + 1) : U'_i arrow.r X_(i + 1) \, wide K_(U'_i) + Delta'_i = p_(i + 1)^(*) D_(i + 1) . $
  Every prime exceptional for $p_(i + 1)$ is the transform of a prime already exceptional for $p_i$.
    Indeed the downstairs map is small, every downstairs prime persists,
    and the elementary program upstairs extracts no primes. Each remaining extracted prime therefore still has
    coefficient one. Setting $\( U_(i + 1) \, Delta_(i + 1) \) = \( U'_i \, Delta'_i \)$ supplies the next crepant
    dlt lift without any additional modification.
  Concatenating these finite nonempty bridges produces an infinite absolute elementary dlt program from
    $\( U_(i_0) \, Delta_(i_0) \)$. This again contradicts Theorem 33.
    The argument has followed every prescribed downstairs step;
    it has not replaced their ray choices by a program with scaling. ◻
]

=== 8.3 Continuation through mixed steps <continuation-through-mixed-steps>

It remains to construct an output whenever the chosen negative contraction is birational.
  The relative lc existence theorem supplies a good model over its base;
  the graph comparison will show that its ample model gives a permitted step.

#thm([Proposition 8.5.])[
  #emph[Let $\( X \, B \)$ be a projective lc fourfold pair over $bb(C)$ with rational boundary, with $D = K_X +
    B$ $bb(Q)$-Cartier. Every $D$-negative extremal ray has a projective contraction with normal projective
    target, connected fibres, relative Picard number one, and relatively ample $- D$.
    If this contraction is birational, it has an output in the precise convention of Definition 1:
    the positive map is small, possibly an isomorphism, and its actual adjoint with the strict boundary is
    relatively ample and lc. If it is of fibre type, it is a Mori fibre-space endpoint in that convention.]
] <prop:continuation>

#proof[
  The lc cone and contraction theorem applies without $bb(Q)$-factoriality;
    see #cite(label("FujinoFoundations")) Theorem 1.1. It gives, for the chosen negative extremal ray,
    the stated contraction $f : X arrow.r Z$. Its target is projective.
    Relative Picard number one and the negative degree of $D$ give relative ampleness of $- D$.
    The fibre-type case already has precisely the required endpoint properties, so assume $f$ birational.
  Choose a sufficiently divisible integer $r > 1$ and an ample Cartier divisor $H$ on $Z$ such that
  $ cal(O)_X \( - r D + f^(*) H \) $
  is generated by global sections. This is possible by relative ampleness and an ample base twist.
    A general member $G$ gives an effective rational $bb(Q)$-Cartier divisor $A = G \/ r$ with
  $ D + A tilde.op_(bb(Q)) 0 \/ Z \, wide \( X \, B + A \) med upright("lc") . $
  For the latter assertion, take a log resolution of $\( X \, B \)$ and choose $G$ generally in the free system.
    Its pullback has no exceptional component and is transverse to the finitely many SNC strata on the resolution.
    Adding its coefficient $1 \/ r$ keeps every coefficient at most one in the crepant log-smooth calculation.
    This proves lc, including when the original pair has coefficient-one components.
  We apply #cite(label("BirkarLC")) Theorem 1.1(1)–(2) in its published rational complemented-pair form.
    Its hypotheses are that $\( X \/ Z \, B + A \)$ is lc, $B \, A$ are effective rational divisors,
    $A$ is $bb(Q)$-Cartier, the structural morphism is projective and surjective, and $K_X + B +
    A tilde.op_(bb(Q)) 0 \/ Z$. It does not assume $bb(Q)$-factoriality or ampleness of $A$.
    It gives a log minimal model or a Mori fibre space for $\( X \/ Z \, B \)$,
    and the adjoint on a nef log minimal model is semiample over $Z$.
    A Mori fibre space over $Z$ is impossible here: its intermediate base would have dimension less than four and
    would dominate the four-dimensional birational base $Z$. We therefore obtain a good log minimal model
    $\( M \, B_M \)$ over $Z$.
  Let $q : M arrow.r V$ be its relative semiample contraction.
    Since $M arrow.r Z$ is birational, this is a birational contraction, and $V arrow.r
    Z$ is projective and birational. There is an ample-over-$Z$ $bb(Q)$-Cartier divisor $L$ on $V$ with $K_M +
    B_M tilde.op_(bb(Q)) q^(*) L$. Put $B_V = q_(*) B_M$. Pushing the linear equivalence forward shows that the
    actual divisor
  $ D_V = K_V + B_V $
  is $bb(Q)$-Cartier and $bb(Q)$-linearly equivalent to $L$. Moreover
  $ K_M + B_M = q^(*) D_V . $
  Indeed the difference is $q$-exceptional and relatively numerically trivial,
    so negativity in both signs makes it zero. Thus the ample divisor on $V$ is its actual adjoint,
    not just a numerical substitute.
  The log-minimal-model discrepancy comparison gives, on a smooth common resolution $a : W arrow.r X$, $b :
    W arrow.r M$,
  $ a^(*) D = b^(*) \( K_M + B_M \) + E \, wide E gt.eq 0 \, wide E med upright("exceptional over ") M \; $
  see #cite(label("BirkarLC")) Remark 2.6. This also explains possible extractions in the definition of a log
    minimal model. A prime extracted on $M$ is given coefficient one; its coefficient in $E$ is then $-
    a \( v \; X \, B \) lt.eq 0$. Effectivity forces this coefficient to vanish, so that extraction is crepant.
    After composition with $q$, the same $E$ is effective and exceptional over $V$.
  We prove that $V arrow.r Z$ is small, although $X arrow.r Z$ need not be.
    Let $G_0$ be the normalized graph of $X arrow.r.dashed V$, with projections $u : G_0 arrow.r X$ and $v :
    G_0 arrow.r V$, and set
  $ H_0 = u^(*) D - v^(*) D_V . $
  The pullback of $H_0$ to a smooth model dominating $W$ and $G_0$ is $E$ pulled back. Pushing down gives
  $ H_0 gt.eq 0 \, wide v_(*) H_0 = 0 . $
  Its negative is ample over $Z$: it is the sum of the pullbacks of $- D$ and $D_V$ from the two factors,
    and the graph maps finitely into their fibre product. As in the support argument of Lemma 3,
    every graph fibre over a point where one of the two maps to $Z$ is nonisomorphic is contained in $"Supp" H_0$.
    Indeed that fibre is connected and positive-dimensional, every closed point lies on a contracted curve,
    and anti-ampleness contradicts effectivity on a curve not contained in the support.
  If a prime divisor on $V$ were exceptional over $Z$, the preceding support property would force a component of
    $H_0$ to dominate it. This contradicts $v_(*) H_0 = 0$. Hence $V arrow.r Z$ is small.
    Every prime on $V$ consequently corresponds to a prime on $X$ through their common codimension-one open over
    $Z$. Thus $B_V$ is exactly the strict transform of $f_(*) B$; there are no additional boundary primes on $V$.
    The effective discrepancy difference gives
  $ a \( xi \; X \, B \) lt.eq a \( xi \; V \, B_V \) $
  for every divisorial valuation, so $\( V \, B_V \)$ is lc.
    The diagram $X arrow.r Z arrow.l V$ is the required step,
    including a mixed step when $f$ loses a divisor and $V arrow.r Z$ is a nontrivial small modification.
    No positive-side relative Picard-number assertion has been used. ◻
]

#prodef([Remark 8.6.])[
  The existence input in Proposition 36 is Theorem 1.1 of #cite(label("BirkarLC")), not merely its Corollary 1.2,
    whose literal formulation begins with a small contraction.
    The effective supplement and the graph argument supply the additional mixed-step scope needed here.
    The ACC-dependent generalization in that paper is unnecessary for this rational complemented application.
]

== 9 Change of algebraically closed field <sec:field>

The preceding arguments use complex topology. We now explain both transfers needed for Theorem 2:
  a whole countable hypothetical program is transferred to $bb(C)$ for the termination argument,
  whereas existence is transferred one finite diagram at a time.
  These are different assertions; existence of one terminating complex program would not suffice for the first of them.

#thm([Lemma 9.1.])[
  #emph[Let $k_0 subset K$ be algebraically closed fields of characteristic zero and let $X_0$ be a projective
    variety over $k_0$. Base extension identifies their real numerical divisor and curve spaces and their closed
    effective curve cones:
$ N^1 \( X_0 \)_(bb(R)) tilde.eq N^1 \( X_(0 \, K) \)_(bb(R)) \, wide
  N_1 \( X_0 \)_(bb(R)) tilde.eq N_1 \( X_(0 \, K) \)_(bb(R)) \, wide overline(upright("NE")) \( X_0 \) =
  overline(upright("NE")) \( X_(0 \, K) \) . $

 In fact every numerical class of an integral curve on the extension is represented by an integral curve over
   $k_0$. For a projective morphism between projective varieties,
   these identifications commute with pullback of numerical divisor classes and preserve the relative Picard number.]
] <lem:numerical-extension>

#proof[
  Injectivity on numerical divisors follows by testing against curves defined over $k_0$.
    For surjectivity, a line bundle $cal(L)$ on $X_(0 \, K)$ spreads to a line bundle on $X_0 times S$,
    where $S$ is an integral finite-type $k_0$-scheme and the given map $"Spec" K arrow.r S$ is dominant.
    Shrink $S$ if necessary and choose a closed point $s in S \( k_0 \)$.
    The line bundles $cal(L)$ and $\( cal(L)_s \)_K$ have the same numerical class on $X_(0 \, K)$.
    Indeed they are fibres of the same line-bundle family on the fixed variety $X_(0 \, K)$.
    Since $k_0$ is algebraically closed, $S$ is geometrically integral;
    hence the parameter scheme $S_K$ is connected. The family’s degree on any fixed integral curve in $X_(0 \, K)$
    is constant. This last assertion is the constancy of degree in a line-bundle family on a proper curve,
    or follows from constancy of its Euler characteristic. Thus every numerical divisor class comes from $k_0$.
  Similarly, an integral curve on $X_(0 \, K)$ spreads to a flat projective family of geometrically integral
    curves in $X_0 times S$ after shrinking an integral finite-type parameter space.
    Geometric integrality is available since the given extension field is algebraically closed.
    Specialize to a $k_0$-point of this open parameter space.
    Degrees against every line bundle on $X_0$ are unchanged by flatness,
    so the resulting integral curve represents the same numerical class.
    The already established statement for numerical divisors makes these precisely all necessary degree tests.
    Conversely, an integral curve over an algebraically closed field stays integral on algebraically closed
    extension. The effective curve classes, their positive spans, and their closures therefore identify.
    The usual nondegenerate numerical pairings give the asserted identification of curve spaces.
  Pullback commutes with base extension. For a projective morphism $f_0 : X_0 arrow.r Z_0$ with projective target,
    choose an ample line bundle $H$ on $Z_0$. An integral curve is contracted precisely when its degree against
    $f_0^(*) H$ is zero. If a curve on the extension is contracted,
    its integral numerical representative over $k_0$ has the same zero degree and is also contracted.
    Conversely, every contracted integral curve over $k_0$ stays integral and contracted on extension.
    The identifications therefore preserve the span of contracted curve classes in $N_1 \( X_0 \)_(bb(R))$.
    The relative numerical divisor space is dual to this span, so its dimension, the relative Picard number,
    is preserved. ◻
]

#thm([Proposition 9.2.])[
  #emph[Let $k$ be any algebraically closed field of characteristic zero.
    A countable program of the kind in Definition 1, including all its prescribed ray choices,
    descends to a common countable algebraically closed subfield of $k$.
    After embedding that subfield in $bb(C)$, it gives a program with the same step types and relative signs,
    the same boundary coefficients, and the same singularity properties.
    In particular an infinite birational program over $k$ would give an infinite birational program over $bb(C)$.]
] <prop:field-transfer>

#proof[
  At each index the varieties, maps, boundaries, chosen rational canonical divisors,
    and their compatibility involve only finitely many coefficients.
    Include equations for projective embeddings, ample line bundles, relative ample multiples of the two adjoints,
    the Cartier multiples defining their $bb(Q)$-Cartier property, and the relevant bundle isomorphisms.
    Include a log resolution at each index, with its SNC divisors and crepant pullback coefficients.
    There are only countably many such data. They are therefore all defined over one countably generated field
    over $bb(Q)$. Its algebraic closure inside $k$ is a countable algebraically closed field $k_0$ over which the
    whole diagram is defined. It admits an embedding into $bb(C)$.
  These algebraically closed extensions preserve normality, integrality, dimension, projectivity, birationality,
    smallness, and whether a morphism is an isomorphism. Relative ampleness is preserved and is detected by
    faithful field extension. The chosen canonical divisors and Cartier data preserve the actual adjoints and the
    strict-transform or pushforward boundary identities. The descended log resolutions are smooth with the same
    SNC data. Their crepant coefficients preserve lc and klt wherever asserted.
    For lc, the calculation in Lemma 8 uses only the identity $a \( v \) = sum_j v \( T_j \) a_j +
    e \( v \)$ with $a_j gt.eq 0$ and $e \( v \) gt.eq 0$; the coefficients $a_j$ may vanish.
    No finiteness assertion requiring their positivity is used.
  Lemma 38, applied at every index, preserves extremality, negativity,
    and the relative Picard number of each chosen contraction.
    An ample polarization on its target identifies the contracted integral curves by degree zero against its
    pullback, so these curve classes are preserved as well. Connected fibres of the birational maps follow from
    properness and normality. For a prescribed fibre-type endpoint, the identity $f_(*) cal(O)_X =
    cal(O)_Z$ is detected over $k_0$ by proper flat base change along the faithful field extension $k_0 subset k$,
    and preserved by the same theorem along $k_0 subset bb(C)$. This keeps the prescribed endpoint itself.
    Each nontrivial birational step remains nontrivial. Consequently all indices of an infinite proposed program
    survive under this single embedding.
  Only the original countable program and the data testing its properties are descended here.
    The auxiliary terminalizations, valuation constructions, and Hodge-theoretic objects in the contradiction may
    then be constructed over $bb(C)$. ◻
]

#thm([Lemma 9.3.])[
  #emph[Proposition 36 holds over any algebraically closed characteristic-zero field,
    with exactly the contraction and mixed-step conventions stated there.]
] <lem:finite-existence-transfer>

#proof[
  Let $\( X \, B \)$ be a pair over $k$ and let $R$ be a negative extremal ray.
    Choose a countable algebraically closed field of definition $k_0 subset
    k$ for $\( X \, B \)$ and embed $k_0$ into $bb(C)$. By Lemma 38,
    $R$ identifies with a negative extremal ray on both $X_0$ and $X_(0 \, bb(C))$.
    Proposition 36 produces the required complex contraction and, in the birational case, its lc positive model.
  These outputs are finite-presentation data. Spread them over an integral finite-type $k_0$-scheme $S$ whose
    function field embeds in $bb(C)$, keeping the input equal to the fixed product $X_0 times S$.
    Include projective embeddings and polarizations of the targets,
    Cartier multiples and relative ample bundles for the adjoints,
    the boundary divisors and strict-transform identities, and log resolutions with their crepant coefficients.
    After shrinking $S$, the geometric fibres of the targets are normal and integral with the same dimensions,
    and the required morphisms are surjective and projective.
    In the birational case they are birational, and the positive map is small.
    To see the latter assertions directly, spread the isomorphisms on dense opens together with their inverses.
    The complements on the positive source can be kept of dimension at most two;
    this excludes an exceptional prime in every remaining fibre.
    Smoothness and the SNC conditions on the finitely many resolutions, and the exact crepant pullback formulas,
    can likewise be retained after shrinking. The resulting boundaries are the prescribed transforms and the
    resulting pairs are lc.
  The relative signs are retained by spreading ample line-bundle data.
    For example, choose a relatively very ample power of each relevant adjoint multiple and a sufficiently
    positive base twist making it generated. Spread the resulting projective embedding.
    Its restriction preserves relative ampleness. All these requirements concern a finite diagram and hold on a
    nonempty open subset of $S$.
  We check that the #emph[particular] ray is preserved, including its relative Picard number.
    Write $f_(bb(C)) : X_(0 \, bb(C)) arrow.r Z_(bb(C))$ for the complex contraction.
    Choose an ample line bundle $H$ on its target and include it in the spread.
    Its pullback is a line bundle on the fixed product $X_0 times S$,
    so its numerical class is constant on the connected parameter space, by the argument of Lemma 38. Thus
  $ alpha = \[ f_(bb(C))^(*) H \] in N^1 \( X_0 \)_(bb(R)) $
  is the same at every specialization.
  Choose an integral curve $C_0$ over $k_0$ with nonzero class in $R$,
    using the integral-curve part of Lemma 38 and a curve spanning the complex negative ray.
    Its degree against a fixed ample line bundle on $X_0$ is positive.
    For any closed point $s in S \( k_0 \)$ in the chosen open and every integral curve $C subset X_0$,
  $ f_s \( C \) upright(" is a point") & quad arrow.l.r.double quad alpha dot.op C = 0\
 & quad arrow.l.r.double quad f_(bb(C)) \( C_(bb(C)) \) upright(" is a point")\
 & quad arrow.l.r.double quad \[ C \] in R . $
  The first two equivalences follow from the projection formula, ampleness of the target polarizations,
    and constancy of $alpha$. The last is the defining property of the original complex contraction.
    Hence $f_s$ contracts precisely the given ray. Since it contracts $C_0$,
    the span of its contracted curve classes is the nonzero one-dimensional span of $R$.
    Its relative Picard number is therefore one. The fixed class $alpha$ thus controls the contracted curves at
    every specialization.
  For a birational output, connected fibres follow from proper birationality and normality of the targets.
    In the fibre-type case, one may take the Stein factorization of $f_s$.
    Its intermediate target is normal because $X_0$ is normal, is finite over $Z_s$, and has the same dimension.
    The pullback of $H_s$ to that target remains ample. Consequently the contracted integral curves and the span
    of their classes are unchanged, so the relative Picard number remains one.
    Relative ampleness of $- D$ persists under this factorization.
    We now have connected fibres and the required fibre-type endpoint.
  Choose a $k_0$-point of the nonempty open parameter space;
    such a point exists because $k_0$ is algebraically closed.
    The preceding construction gives the desired finite diagram over $k_0$. Extend it to $k$.
    Normality, lc singularities, the relative signs, the exact contracted ray, the relative Picard number,
    and the stipulated smallness are preserved. This is the required output for the original chosen ray. ◻
]

#proof[
  If an allowed program over $k$ had infinitely many birational steps,
    Proposition 39 would transfer that entire prescribed program to $bb(C)$. This contradicts Proposition 35.
    Thus every allowed program has finitely many birational steps.
  At any stage with non-nef adjoint, there is a negative extremal ray.
    This follows from the lc cone theorem, or from its complex form using Lemma 38.
    Every selected such ray has the contraction and output of Lemma 40.
    A finite prefix at which neither stopping condition holds therefore extends.
    A maximal program can stop only at a nef pair or at a fibre-type contraction.
    The latter has connected fibres, smaller-dimensional normal projective target, relative Picard number one,
    and relatively ample negative adjoint, exactly as required for the Mori fibre-space endpoint in Definition 1.
    An initially nef pair needs no operation.
  These arguments prove continuation, finiteness for every sequence of permitted choices,
    and the asserted alternatives for a maximal program. ◻
]

== 10 Consequences for the endpoints <sec:endpoints>

Theorem 2 makes every maximal program finite. The following consequences use log abundance and bounded complements
  to describe its endpoint more precisely. The semiample-endpoint statement holds over every algebraically closed
  field of characteristic zero; the uniform local statements are over $bb(C)$.

#thm([Corollary 10.1.])[
  (Semiample endpoints).  #emph[Let $k$ be an algebraically closed field of characteristic zero,
    and let $\( X \, B \)$ be a projective lc fourfold pair over $k$ with rational boundary.
    Suppose that $K_X + B$ is pseudo-effective. Then every maximal program of Definition 1 ends at a projective lc
    pair $\( Y \, B_Y \)$ for which some positive Cartier multiple of $K_Y + B_Y$ is generated by global sections.]
] <cor:semiample-endpoints>

#proof[
  Fix a maximal program $X_0 arrow.r.dashed dots.h.c arrow.r.dashed X_r$, finite by Theorem 2, and put $D_i =
    K_(X_i) + B_i$. The section-space comparison in #cite(label("OpenAILogAbundance2026")) proof of
    Corollary 12.1(i) identifies the sections of the pseudo-effective $D_0$ with those of a semiample birational
    adjoint. Hence $D_0$ has a nonzero section in some positive Cartier degree.
    Choose a common positive multiple $N$ of that degree and the Cartier indices of $D_0 \, dots.h \, D_r$.
    A suitable power of the section is represented by a rational function $s$ satisfying $"div"_(X_0) \( s \) +
    N D_0 gt.eq 0$. At a birational step, push the effective divisor $"div"_(X_i) \( s \) +
    N D_i$ through $f_i$ and take its strict transform through $f_i^(+)$.
    The boundary rule and compatible canonical divisors, together with smallness of $f_i^(+)$,
    identify the result with $"div"_(X_(i + 1)) \( s \) + N D_(i + 1) gt.eq 0$.
    Thus the section passes through every divisorial, flipping or mixed step.
  A Mori fibre endpoint has a positive-dimensional fibre meeting the complement of this effective Cartier zero
    divisor; choose an integral curve $C$ in that fibre through such a point.
    Its intersection with the zero divisor is nonnegative, but equals $N D_r dot.op C <
    0$ by relative ampleness of $- D_r$, a contradiction. The endpoint is therefore nef,
    and log abundance #cite(label("OpenAILogAbundance2026")) Theorem 1.1 makes its rational adjoint semiample. ◻
]

For $epsilon.alt > 0$, a pair is #emph[$epsilon.alt$-lc] if every normalized divisorial valuation has log
  discrepancy at least $epsilon.alt$. A projective contraction $h : Y arrow.r
  S$ is #emph[of Fano type] if some effective rational boundary $Gamma$ on $Y$ makes $\( Y \, Gamma \)$ klt and
  $- \( K_Y + Gamma \)$ ample over $S$. The next consequence uses this condition at a Mori endpoint.

#thm([Corollary 10.2.])[
  (Uniform local complements at Mori endpoints).  #emph[Fix a real number $epsilon.alt > 0$ and a finite set $I
    subset \[ 0 \, 1 \] ∩ bb(Q)$. There is a positive integer $M =
    M \( 4 \, epsilon.alt \, I \)$ with the following property.
    Let $\( X \, B \)$ be a projective $epsilon.alt$-lc fourfold pair over $bb(C)$ with coefficients in $I$ and
    with $K_X + B$ not pseudo-effective. Every maximal program of Definition 1 ends at a Mori contraction
    $h : \( Y \, B_Y \) arrow.r S$. For every closed $s in S$,
    there is an effective $bb(Q)$-divisor $B_Y^(+) gt.eq B_Y$ such that,
    on the inverse image of some neighbourhood of $s$, the pair $\( Y \, B_Y^(+) \)$ is klt and
    $M \( K_Y + B_Y^(+) \)$ is Cartier and linearly trivial.]
] <cor:uniform-mori-complements>

#proof[
  Theorem 2 makes the program finite. Lemma 3 shows that log discrepancies do not decrease,
    including at mixed steps, while the boundary rule and smallness of the positive maps retain or delete the
    original coefficients. On a common smooth projective model $p : W arrow.r X$, $q : W arrow.r Y$,
    the graph comparisons give $p^(*) \( K_X + B \) = q^(*) \( K_Y + B_Y \) + E$ with $E gt.eq 0$.
    If the final adjoint were nef, this identity and birational invariance of pseudo-effectivity for rational
    Cartier divisors would make $K_X + B$ pseudo-effective. The endpoint is therefore Mori.
    It remains $epsilon.alt$-lc, hence klt, and $B_Y$ itself witnesses that $Y$ is of Fano type over $S$,
    since $- \( K_Y + B_Y \)$ is $h$-ample. The varieties are projective,
    so #cite(label("OpenAIComplements2026")) Corollary 1.2 applies and gives the claimed index,
    independent of the program and its endpoint. ◻
]

Under the hypotheses of Corollary 42, when $dim S > 0$, #cite(label("OpenAICartier2026")) Theorem 1 also gives a
  uniform $tau = tau \( 4 \, epsilon.alt \) > 0$ such that, for each closed $s in S$,
  some neighbourhood $U in.rev s$ carries a nonzero effective Cartier divisor $T$ through $s$ with
  $\( h^(- 1) \( U \) \, B_Y \|_(h^(- 1) \( U \)) + tau h^(*) T \)$ log canonical.

#bibliography("refs.bib", style: "ieee", title: [References])
