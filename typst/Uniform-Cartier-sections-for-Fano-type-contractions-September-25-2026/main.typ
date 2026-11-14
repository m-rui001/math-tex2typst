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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform Cartier sections for Fano type contractions]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== Introduction <introduction>

Through a prescribed point of a singular variety, can one choose a Cartier hypersurface whose log canonical
  threshold is bounded away from zero? For a Fano type contraction $f : X arrow.r Z$,
  the corresponding question asks for a hypersurface on $Z$ whose pullback has controlled singularities along the
  entire fibre. The hypersurface may depend on the contraction and the point.
  The desired lower bound depends only on the dimension of $X$ and a positive lower bound for its log discrepancies.

We work over an algebraically closed field of characteristic zero.
  A #emph[contraction] is a projective surjective morphism of normal integral varieties with connected fibres,
  expressed by $f_(*) cal(O)_X = cal(O)_Z$. It is of #emph[Fano type] if an effective rational boundary $C$ exists
  such that $\( X \, C \)$ is klt and $- \( K_X + C \)$ is ample over $Z$.
  This auxiliary boundary need not equal the boundary in the following theorem.

A rational pair $\( X \, B \)$ has effective rational boundary $B$ and rationally Cartier log canonical divisor
  $K_X + B$. If $p : W arrow.r X$ is a smooth birational model and $E$ is a prime divisor on $W$,
  our discrepancy convention is

$ a \( E \; X \, B \) = 1 + "coeff"_E #scale(x: 120%, y: 120%)[\(] K_W -
  p^(*) \( K_X + B \) #scale(x: 120%, y: 120%)[\)] . $

Thus $epsilon.alt$-lc means $a \( E \; X \, B \) gt.eq epsilon.alt$ for every such $E$;
  lc means that they are nonnegative; and klt means that they are strictly positive.

The obstruction is visible in a single ratio. If $D$ has local equation $g$ on the base,
  log canonicity after adding $t f^(*) D$ requires

$ t lt.eq frac(a \( E \; X \, B \), "ord"_E \( f^(*) g \)) $

for every prime divisor $E$ over the relevant inverse image with positive denominator.
  A discrepancy bound alone does not control those orders. Even on a smooth curve,
  the divisor $m \[ z \]$ has threshold $1 \/ m$. The problem is therefore to choose an equation through $z$ for
  which all these inequalities hold with one uniform positive $t$.

#thm([Theorem 1.])[
  (Uniform Cartier sections).  #emph[For every integer $d > 0$ and every real number $epsilon.alt > 0$,
    there is a real number $tau = tau \( d \, epsilon.alt \) > 0$ with the following property.
    Let $\( X \, B \)$ be an $epsilon.alt$-lc rational pair of dimension $d$, and let $f : X arrow.r
    Z$ be a Fano type contraction of normal integral quasi-projective varieties with $dim Z > 0$.
    Suppose that $- \( K_X + B \)$ is nef over $Z$. For every closed point $z in Z$,
    there are an open neighbourhood $U$ of $z$ and a nonzero effective Cartier divisor $D$ on $U$,
    with $z in "Supp" D$, such that
$ #scale(x: 120%, y: 120%)[\(] f^(- 1) \( U \) \, B \|_(f^(- 1) \( U \)) +
  tau f^(*) D #scale(x: 120%, y: 120%)[\)] quad upright("is log canonical.") $

]
] <thm:main>

The conclusion of Theorem 1 concerns the whole inverse image of a neighbourhood of $z$.
  The constant is independent of Cartier indices, boundary denominators, and any choice of polarization.
  It is non-effective; the divisor and the neighbourhood may depend on the contraction and the point.

===== 1 Cartier sections and complements. <cartier-sections-and-complements.>

For the identity contraction, the question above concerns arbitrary $epsilon.alt$-lc singularities.
  Equivalently, it asks for a uniform positive lower bound for the log canonical threshold of the maximal ideal at
  a closed point; the passage to a general element of that ideal is recalled in Lemma 59.
  The general contraction requires the corresponding bound for the pulled-back point ideal.
  This is a different local question from bounding the discriminant coefficients in the canonical bundle formula:
  those coefficients are defined by thresholds over generic points of divisors on birational models of the base.
  A Cartier section through a prescribed point must control the whole fibre at once.

The complement formulation asks for a uniformly bounded complement index.
  Over a neighbourhood of a base point, a #emph[monotonic klt $n$-complement] of $\( X \, B \)$ is an effective
  rational divisor $Lambda gt.eq B$ such that $\( X \, Lambda \)$ is klt and

$ n \( K_X + Lambda \) tilde.op 0 . $

Here linear equivalence includes the assertion that the displayed divisor is Cartier.
  In Shokurov’s boundedness conjecture, as formulated in #cite(label("Chen2025")) Conjecture 1.1,
  the index $n$ depends only on the total dimension $d$, the discrepancy bound $epsilon.alt > 0$,
  and a fixed finite set $frak(R) subset \[ 0 \, 1 \] ∩ bb(Q)$ containing the coefficients of $B$.
  The geometric hypotheses are those of Theorem 1, with the zero-dimensional base also allowed.

Complements entered birational geometry through Shokurov’s work on threefold log flips,
  including bounded local lc complements for surfaces #cite(label("ShokurovFlips")) Section 5.
  His surface theorem and bounded-complement conjectures developed the relation between mild singularities and
  bounded complement indices #cite(label("ShokurovSurfaces")) Conjecture 1.3 and Main Theorem 1.4.
  The stronger expectation that bounded complements preserve a positive lower bound on log discrepancies appears
  in his 2004 formulation #cite(label("ShokurovBounded2004")).
  Birkar proved boundedness of lc complements in arbitrary dimension for Fano type pairs with hyperstandard
  coefficients #cite(label("BirkarComplements")) Theorems 1.7–1.8.
  Those lc complements provide the bounded initial index used below.
  A klt complement must have strictly positive discrepancies,
  and obtaining this additional property uniformly is the issue addressed here.

Several earlier results describe the reach of the Cartier-section problem.
  Sankaran and Santos bounded the smallest weight of an $epsilon.alt$-lc weighted blowup of affine space
  #cite(label("SankaranSantos")) Theorem 1.3, proving the weighted-blowup case of Birkar’s question.
  For torus-invariant boundaries with coefficients in a fixed DCC set (one with no infinite strictly decreasing
  sequence), Ambro constructed invariant Cartier sections through torus-fixed base points in the toric setting
  #cite(label("AmbroToric")) Theorem 3.12, arXiv version 2.
  Under his hyperstandard coefficient hypothesis, his Theorem 1.2 also gives bounded complements preserving a
  positive discrepancy bound. Birkar’s control of base singularities gives the Cartier assertion over curves,
  together with bounded klt complements in the curve-base case #cite(label("BirkarCY")) Theorem 1.1 and
  Corollary 1.4. These curve and toric results illustrate two distinct ways to control the orders appearing in the
  threshold inequalities.

Over $bb(C)$, Chen proves the decisive general reduction.
  For each bound $ell$ on the base dimension, bounded klt complements, the Cartier-section assertion,
  and its identity-contraction case are equivalent; on the complement side,
  birational contractions with zero boundary suffice #cite(label("Chen2025")) Theorem 1.6.
  He proves the surface local assertion with coefficient $epsilon.alt^2 \/ 24$,
  and hence both conjectures for bases of dimension at most two #cite(label("Chen2025")) Theorem 1.7 and
  Corollary 1.8. He also removes the coefficient restriction in the toric Cartier-section assertion
  #cite(label("Chen2025")) Theorem 1.11. We use the precise local formulation of the Birkar–Shokurov conjecture in
  #cite(label("Chen2025")) Conjecture 1.3; the relatively ample formulation also appears in
  #cite(label("BirkarSurvey")) Conjecture 1.27.

Theorem 1 proves the rational-boundary assertion in characteristic zero,
  and Corollary 3 below gives the real-boundary formulation over $bb(C)$.
  The conjecture is therefore resolved positively in these settings.
  The new input to Chen’s reduction is the following birational theorem.

#thm([Theorem 2.])[
  (Birational klt complements).  #emph[For each $d > 0$ and $epsilon.alt > 0$, there is a positive integer $n =
    n \( d \, epsilon.alt \)$ such that the following holds. Let $X$ be an $epsilon.alt$-lc rationally Gorenstein
    variety of dimension $d$, and let $f : X arrow.r Z$ be a birational Fano type contraction with $-
    K_X$ nef over $Z$. For every closed $z in Z$, there is an effective rational divisor $Delta$ over a
    neighbourhood of $z$ such that $\( X \, Delta \)$ is klt there and $n \( K_X + Delta \)$ is Cartier and
    linearly trivial there, after shrinking the neighbourhood.]
] <thm:birational>

The companion article #cite(label("OpenAIComplements")) Theorem 1.1 and Corollary 1.2 treats bounded klt
  complements for Fano contractions and their finite-rational-coefficient extension by an independent argument.
  The present proof establishes Theorem 2 directly, through its own character and pinning obstruction.

Applying Chen’s Theorem 1.6 in arXiv version 4, implication (2)$arrow.r.double$(3),
  transfers Theorem 2 to Theorem 1. For a fixed total dimension $d$, use the base-dimension bound $ell =
  d$ and the birational theorem in every dimension at most $d$, for every positive discrepancy gap.
  Implication (2)$arrow.r.double$(1) of the same theorem also supplies the finite-rational-coefficient complement
  assertion stated above over $bb(C)$. Its Cartier-section conclusion already allows real boundaries,
  giving the following extension.

#thm([Corollary 3.])[
  (Real boundaries).  #emph[Over $bb(C)$, the conclusion of Theorem 1 holds for effective real boundaries $B$ with
    $K_X + B$ real Cartier, with the same uniform dependence on $d$ and $epsilon.alt$.]
] <cor:real-boundaries>

The reduction requires rationalization only in the zero-boundary birational case:
  an integral Weil divisor that is real Cartier is rationally Cartier,
  and a real klt log Fano witness can be chosen rational. Section 8 supplies these details,
  the reduction from arbitrary algebraically closed characteristic-zero fields to $bb(C)$ for Theorem 1,
  and the passage between point-ideal thresholds and individual Cartier divisors.
  No approximation of the arbitrary nef real boundary in Corollary 3 is required.

===== 2 The argument. <the-argument.>

Suppose that Theorem 2 fails. Section 8 uses bounded lc complements to construct a sequence of complex klt germs
  $x_i in S_i$ of bounded dimension, with finite cyclic groups $Gamma_i$ fixing $x_i$. The quotient maps

$ S_i arrow.r S_i \/ Gamma_i $

are quasi-étale, meaning étale outside subsets of codimension at least two,
  and the quotient germs have a fixed positive discrepancy gap for primitive prime orders.
  On $S_i$, a nonzero regular function $h_i$ and a nowhere-vanishing canonical generator have the same character
  $chi_i$. The pair $\( S_i \, "div" \( h_i \) \)$ is lc, and a centred quasi-monomial valuation $T_i$ satisfies

$ A_(S_i) \( T_i \) = T_i \( h_i \) = 1 \, $

where $A_(S_i)$ is the log-discrepancy function with zero boundary.
  Failure of bounded klt complements gives the stronger condition

$ forall m in bb(Z)_(> 0) med exists i \( m \) med forall i gt.eq i \( m \) : wide T_i \( s \) gt.eq m quad
  upright("for every nonzero regular ") s upright(" of character ") chi_i^m upright(".") $

Thus the order bound holds for every section in each fixed character degree,
  rather than for a selected sequence of sections. The reduction uses a canonical cover in the isomorphism case
  and a signed anti-canonical grading for other birational contractions.

Character relations become concrete after division by powers of $h_i$.
  For a section $s$ of character $chi_i^m$, the rational function $Y = s \/ h_i^m$ is $Gamma_i$-invariant and

$ T_i \( Y \) = T_i \( s \) - m . $

Requiring nonnegative order for both $Y$ and $Y^(- 1)$ forces the exact equality $T_i \( Y \) = 0$.
  The construction uses pairs of ratios with opposite orders to impose these two inequalities.
  The induction builds and retains relations of this kind. It optimizes valuations on the constrained $h_i$-lc
  slice, passes to finitely generated central algebras, and imposes further invariant relations while preserving
  the algebraic independence of the variables already obtained.
  Either it produces another independent variable or the remaining character direction yields a quotient prime of
  arbitrarily small discrepancy. Dimension bounds the first process,
  while the discrepancy gap excludes the second. Theorem 48 formalizes this obstruction,
  and Section 8 uses it to prove the birational theorem before applying Chen’s equivalence.

The proof requires uniform geometric estimates and exact control of the valuation constraints.
  Sections 1–3 establish the discrepancy comparisons, phase nonvanishing,
  and saturation statements for fields obtained by cutting off small discrepancy directions.
  Their geometric inputs include Birkar’s boundedness of weak log Fano varieties #cite(label("BirkarBAB"))
  Theorem 1.1, boundedness of rationally connected generalized Calabi–Yau varieties up to isomorphism in
  codimension one #cite(label("BirkarCY")) Theorem 1.7, and effective birationality for nef and big integral Weil
  divisors #cite(label("BirkarPolarised")) Theorem 1.1. The latter theorem also requires the polarization minus
  the canonical divisor to be pseudo-effective. These results apply without a prior bound on the nef divisors’
  Cartier indices. Filipazzi’s generalized canonical bundle formula supplies the generalized-pair structures on
  successive bases #cite(label("Filipazzi")) Theorem 1.4; the uniform discrepancy comparisons needed here are
  established in Section 1.

For the local optimization, the normalized-volume theory of Li, Blum, Xu, Li–Xu, and Xu–Zhuang supplies existence,
  quasi-monomiality, uniqueness, and stable degeneration for ordinary klt-pair minimizers #cite(label("LiIzumi"))
  #cite(label("Blum")) #cite(label("XuQuasimonomial")) #cite(label("LiXuStable")) #cite(label("XuZhuangUnique"))
  #cite(label("XuZhuangStable")). The order inequalities above impose additional constraints.
  Section 5 constructs an effective rational klt pair whose ordinary minimizer lies exactly on the constrained
  slice; only then is the stable-degeneration theorem applied.
  Section 6 transfers the resulting equalities and signs through later degenerations and changes of grading.
  Together with the character counts of Section 4, these exact transfers ensure that each step of the induction in
  Section 7 retains the earlier relations.

===== 3 Conventions on generalized pairs and sequences. <conventions-on-generalized-pairs-and-sequences.>

For a generalized pair, a rationally Cartier nef b-divisor $upright(bold(M))$ is determined and nef on a model
  $pi : Y arrow.r X$. On that model the boundary is defined by

$ K_Y + B_Y + upright(bold(M))_Y = pi^(*) \( K_X + B + upright(bold(M))_X \) . $

Discrepancies on higher models are the ordinary discrepancies of the resulting, possibly noneffective, boundary.
  The order of a rationally Cartier b-divisor is computed after pulling it back from a determining model.
  Unless expressly stated otherwise, rational divisor data are used for MMPs.

Orders and discrepancies extend homogeneously to positive multiples of divisorial valuations.
  A lower discrepancy bound on genuine singularities is always imposed on primitive orders $"ord"_E$,
  not on all of their positive rescalings. This distinction is essential when valuations on covers, quotients,
  and subfields are compared.

The auxiliary arguments concern sequences in bounded dimension.
  The symbols $O \( 1 \)$ and $o \( 1 \)$ refer to those sequences,
  with additional fixed parameters indicated at the point of use.
  Sequence conditions are required on every subsequence. We pass to further subsequences when proving a
  contradiction and choose auxiliary growth rates slowly enough to satisfy the preceding finite sets of
  requirements. Each uniform conclusion keeps this order of choices explicit.
  In Sections 5–8, germs are complex algebraic germs. An $h$-lc valuation means a valuation of zero discrepancy
  for the pair with boundary $"div" \( h \)$, using a power to descend the rational divisor through a finite
  quotient when necessary.

== 1 Discriminant comparison and uniform chambers <sec:A>

We establish three comparison results for generalized Calabi–Yau data.
  Their proofs reduce to bounded generic Fano fibres, but impose no bound on the Cartier indices of the nef
  b-divisors. The geometric input is a family of charts with a uniform bound on angular variation of
  discrepancies; the contact of a trait with the parameter space is allowed to be arbitrarily large.

=== 1.1 Conventions and the canonical bundle formula <conventions-and-the-canonical-bundle-formula>

We use the usual generalized pair notation. A nef part $upright(bold(M))$ is a $bb(Q)$-Cartier b-divisor
  determined and nef on some model (nef over the point unless indicated).
  In particular all pullbacks involved in forming generalized discrepancies are ordinary pullbacks on sufficiently
  high models. Write $a \( v \)$ for log discrepancy, extended to positive multiples of $upright("ord")_E$ by
  homogeneity; unless specified, numerical conditions on divisorial valuations are imposed for #emph[primitive]
  ones ($upright("ord")_E$). Coefficient functions of b-divisors are extended by homogeneity in the same way.
  Under a generically finite pullback use log pullback, so discrepancies just compose with restriction
  (ramification formula, characteristic zero). Restriction of a divisorial valuation to a finitely generated
  subfunction field is a multiple of a divisorial valuation or trivial.
  Indeed, let $L \/ K$ be the extension, of transcendence degree $q$, and let $v$ be divisorial on $L$,
  with nontrivial restriction $w$. Both value groups have rational rank one and

$ "trdeg"_(kappa \( w \)) kappa \( v \) lt.eq q \, wide "trdeg"_k kappa \( w \) lt.eq "trdeg"_k K - 1 . $

Equality $"trdeg"_k kappa \( v \) = "trdeg"_k L - 1$ forces equality in both inequalities. Thus $w$ is divisorial.
  If $v$ has integral values, its restricted value group is a subgroup of $bb(Z)$,
  so the multiple of the primitive order is a positive integer.

Here and below an #emph[effective generalized CY over $S$] (possibly not lc) on $X arrow.r
  S$ means data as above with $B gt.eq 0$ on $X$ and $K_X + B +
  upright(bold(M))_X tilde.op_(bb(Q)) f^(*) L$ for some $bb(Q)$-Cartier $L$ on $S$.
  CY will also indicate its discrepancy function. Assertions about varying pairs below need only be read on the
  #emph[rational] parameter values (piecewise linear discrepancy functions can of course be extended on their
  intervals). For an affine discrepancy family it suffices to choose common resolutions for finitely many defining
  members: differences of generalized discrepancies are Cartier b-evaluations.
  No denominator bounds on the nef parts are assumed. Varieties in the statements below are projective normal in
  characteristic zero; one can work over algebraically closed fields.
  The bounds/sequence statements work also with fields allowed to vary:
  boundedness, complements and families used below are uniform in characteristic zero (or one can work with
  descents to characteristic zero subfields embeddable in $bb(C)$).
  We limit the dimension of the total space by a fixed integer.

We use the klt MMP with big boundary and the extraction and Mori dream space consequences of #cite(label("BCHM"));
  preservation of Fano type under rational contractions #cite(label("ProkhorovShokurov")) p. 155 and Lemma 2.8;
  rational connectedness of projective klt log Fano pairs #cite(label("HaconMcKernan")) Corollary
  1.13#cite(label("ZhangRC")) Theorem 1; BAB #cite(label("BirkarBAB")) Theorem 1.1;
  and ordinary bounded lc complements #cite(label("BirkarComplements")) Theorems 1.7 and 1.8.
  For complements, the seed coefficients used below are only $0$ and $1$,
  the varieties are of Fano type over the relevant base, and the negative log canonical divisor is nef.
  The conversion to ordinary data will be proved below; no generalized complement theorem with an unstated
  nef-index hypothesis is used. We also use the generalized klt-trivial canonical bundle formula
  #cite(label("Filipazzi")) Theorem 1.4 and Sections 4–5. Recall the latter in the projective rational case:
  for a contraction $g : X arrow.r W$, data with nef $bb(Q)$-Cartier b-part, $K_X + B +
  upright(bold(M))_X tilde.op_(bb(Q)) g^(*) L_W$, $B$ effective over the generic point,
  generalized klt generically there, the discriminant is given on every model by

#[#set math.equation(numbering: n => "(1.1)")
 $ b \( P \) = min_(T \|_(k \( W \)) = e thin upright("ord")_P \, med e > 0) a \( T \) \/ e
   $ <eq:A-discriminant-minimum>]

(log-discrepancy convention) and $L_W$ minus the sum of canonical and discriminant-boundary terms (that is,
  $L_W - \( K_W + B_W \)$, on higher models using pullback of $L_W$) gives a b-nef $bb(Q)$-Cartier moduli part.
  This is the b-nefness/b-Cartier theorem for a generalized klt-trivial fibration;
  the generic rank condition follows by generic klt and horizontal effectivity on $X$ (on a resolution the
  rounded-up negative boundary over the generic field is effective exceptional), using $g_(*) cal(O)_X =
  cal(O)_W$. All data here are projective with nef part over the point, NQC by rationality.
  We only need the generically klt case as stated here (no global klt condition).
  To fit the subboundary convention in the cited theorem when some vertical trace coefficients exceed one,
  subtract $g^(*) G$ for a sufficiently large effective Cartier divisor $G$ on the base containing the images of
  those components, and replace $L_W$ by $L_W - G$. Generic klt is unchanged.
  The discriminant boundary changes from $B_W$ to $B_W - G$, so the moduli b-divisor is unchanged.
  Thus this harmless shift permits the stated application to arbitrary vertical coefficients.
  Minima are finite and attained (work over the generic DVR of $P$).
  We apply this to $g$ over $S$ with $L_W$ a pullback of $L$.
  If $B$ is effective on $X$, the induced trace $B_W$ is effective because any prime on $W$ is covered by a prime
  in its inverse image. Discriminants compose by the minimum formula,
  including through crepant changes and birational contractions preserving the CY discrepancy data.
  In fact pushing traces in small modifications and birational contractions over $S$ (not extracting) preserves
  effectivity and discrepancies; crepancy follows by writing total log canonical divisor as a pullback from $S$
  plus a rational principal divisor.

=== 1.2 The comparison statements <the-comparison-statements>

Here are three sequence versions. Subscripts indexing a sequence will often be suppressed;
  “eventually” allows discarding finitely many indices. Every assertion about a test sequence of valuations is
  required on every subsequence of the original sequence as well.
  Bounds may depend on the fixed dimension and on the fixed parameters explicitly appearing in a statement.
  In particular, a condition on every test sequence is uniform against a diagonal choice of counterexamples.
  A subsequent diagonal passage may make any auxiliary divergent parameter grow more slowly.

#thm([Lemma 1.1.])[
  (Comparison along long parameter intervals).  #emph[Let $X arrow.r
    S$ be a sequence of Fano type contractions as above. Suppose $a_t$ are effective generalized CYs over $S$,
    continuous finite rational piecewise affine families of discrepancies (with a finite subdivision of parameter
    per example, so the pieces can be treated on a common resolution), on $0 lt.eq t lt.eq L_i$ or $- L_i lt.eq
    t lt.eq L_i$ with $L_i arrow.r oo$. Pieces and endpoints can be taken rational.
    Values at each valuation are concave in $t$, and $a_0$ is klt.
    Assume the corresponding one of the following (one-sided for $0 lt.eq t lt.eq L_i$; two-sided for $- L_i lt.eq
    t lt.eq L_i$):]
  + #emph[(one-sided) the discrepancy functions are nonincreasing, and whenever $a_0 \( T \) arrow.r 0$,
    $a_t \( T \) \/ a_0 \( T \) arrow.r 1$ for every fixed $t$;]
  + #emph[(two-sided) for some fixed $delta > 0$, whenever $a_0 \( T \) < delta$,
    $a_t \( T \) \/ a_0 \( T \) arrow.r 1$ for every fixed signed $t$.]
  #emph[As throughout these lemmas, tests on sequences of valuations include along subsequences.
    Then on every fixed bounded parameter range the data are eventually klt over the generic point of $S$.
    Write $b_t$ for their discriminant discrepancies on $S$. In case (i),
    they are nonincreasing and satisfy $b_t \( P \) \/ b_0 \( P \) arrow.r
    1$ for every fixed $t$ whenever $b_0 \( P \) arrow.r 0$. In case (ii),
    some fixed $delta' > 0$ gives the same convergence for every fixed signed $t$ whenever $b_0 \( P \) < delta'$.
    These conclusions include every subsequence and primitive prime orders on every birational model of $S$.]
] <lem:A-comparison>

#thm([Lemma 1.2.])[
  (Phases under pure pullback).  #emph[Let $a$ be a sequence of klt effective generalized CYs over $S$ in the same
    Fano type setting, and let $H$ be a sequence of $bb(Q)$-Cartier $bb(Q)$-divisors on the respective bases $S$.
    Suppose for some fixed positive integer $m$, for every $a \( T \) arrow.r
    0$ the phase $v_T \( m f^(*) H \) med mod med 1$ has lifts to $bb(R)$ of size $O \( a \( T \) \)$ bounded
    below by $- o \( a \( T \) \)$. Then with discriminant $b$, for some fixed positive multiple $m'$,
    $v_P \( m' H \)$ satisfies the same phase condition wherever $b \( P \) arrow.r 0$.]
] <lem:A-pullback-phases>

#thm([Lemma 1.3.])[
  (A uniform linear chamber).  #emph[In the same setting suppose $a$ is an lc effective generalized CY over $S$,
    with values in $\( 1 \/ p \) bb(Z)$ for fixed $p$, and $a + t d$ for $0 lt.eq t lt.eq
    t_0$ are effective generalized CYs, klt for positive $t$, $d gt.eq 0$ on all divisorials; take $L_t$ affine,
    and $t_0 > 0$ fixed rational. Then eventually there is a uniform smaller $t_1 >
    0$ on which discriminants equal $a' + t d'$ with $a'$ of bounded denominator (i.e.,
    the same $p'$ works on all models). There is also the following version with extra data:]
  + #emph[$a + lambda h + s c$ are effective generalized CYs over $S$ for $0 < lambda lt.eq lambda_0 \, med
    0 < s lt.eq lambda theta_0$, $lambda_0 \, theta_0 > 0$ fixed, $h$ of bounded denominator, $c gt.eq 0$;]
  + #emph[on $a = 0$, $d lt.eq c lt.eq C d$, $- eta_i c lt.eq h lt.eq C c$ with fixed $C$ and $eta_i arrow.r 0^(+)$.]
  #emph[Then there are uniform $lambda_1 \, theta_1 > 0$, with $lambda_1 lt.eq lambda_0$ and $theta_1 lt.eq
    theta_0$, such that eventually, on the sector $0 < lambda lt.eq lambda_1$, $0 < s lt.eq lambda theta_1$,
    the data are klt generically over $S$, their discriminants are exactly $a' + lambda h' + s c'$,
    and $h'$ has bounded denominator. Moreover, eventually there is #emph[no] divisorial $T$ horizontal over $S$
    with $a \( T \) = 0 \, med h \( T \) < 0$. In particular for $S$ a point exact nonnegativity on $a =
    0$ follows even though only the approximate bound $- eta_i c$ was assumed.]
  #emph[In this statement the minima are lexicographic: first minimize $a \/ e$,
    then $d \/ e$ on its minimum locus; for the extra data first minimize $a \/ e$, then $h \/ e$, then $c \/ e$.
    Here $e "ord"_P = T \|_(k \( S \))$. Thus $a'$ itself is the discriminant in discrepancy convention even if
    the endpoint is not klt generically. The family $a' + t d'$, #emph[including its endpoint at zero],
    has the generalized effective log data (with nef b-part and total logarithmic divisor $L_t$).]
] <lem:A-linear-chamber>

The endpoint assertion follows from the positive-parameter assertion.
  Indeed, for positive parameters use the generalized canonical bundle formula.
  The moduli b-parts chosen using $L_t$ are affine on #emph[all] models by the affine discrepancies;
  thus the limit b-divisor at zero is a difference of $bb(Q)$-Cartier b-divisors by extrapolation,
  and nef by passage to the limit on a common determination.
  The same applies on any intermediate base using pullback of $L_t$.

We give details of the geometry and proofs of these lemmas.
  Boundedness of denominators here and later does not require that the b-parts of the input have bounded Cartier index.

=== 1.3 Extraction and the Mori step <subsec:A-mori>

We can pass to a small $bb(Q)$-factorialization on which the families still have effective traces.
  Given an effective generalized klt CY $A$ over $S$ and Fano type,
  we can extract all exceptional divisors with $A < delta_(*)$ ($0 < delta_(*) <
  1$) to a $bb(Q)$-factorial Fano type model over $S$, extracting no others (or just select any subset of this
  list). There are finitely many: on a log resolution where the nef part descends any further ones must be
  toroidal for the snc support (the integral reduced-log discrepancy otherwise contributes at least 1:
  all lc places of a reduced snc pair are monomial at the strata),
  and all their weights are bounded using positivity on the finitely many components.
  For extraction one can pass to an ordinary big klt CY over $S$ having the selected divisors still strictly
  positive in log-pulled boundary. For clarity, mix the given data with small weight of auxiliary crepant sub-data
  with ample b-part determined on that resolution, horizontal and vertical trace on $X$ effective and containing a
  general relatively ample contribution; these auxiliary data with total $tilde.op_(bb(Q)) 0 \/
  S$ exist by taking the ample b-part sufficiently small and using a klt log Fano pair on $X \/ S$.
  More explicitly subtract the small pushforward of the ample divisor and a small ample divisor on $X$ from the
  log Fano ample class (twist by a pullback if needed). Sub-klt persists on a common resolution after mixing,
  as do effectivity on $X$ and positive coefficients at the selected divisors.
  Replace the resulting ample moduli contribution on the high model by general representatives (over $S$,
  twisting by pullback), with small coefficients. Apply klt extraction;
  the log transform is effective and still big over $S$ by the general ample contribution on $X$ avoiding the
  finitely many centres. Big klt CY implies Fano type.

Other CY families retain effective traces on the extracted model provided their discrepancies at the extracted
  divisors are at most $1$. Each application below verifies this condition.
  When the whole list is retained, the resulting #emph[ordinary variety] is $delta_(*)$-lc.
  For an exceptional divisor on a higher determination, effectivity of the trace and the negativity lemma for the
  difference between the pullback of the nef-part trace and its nef determination give $A_X \( T \) gt.eq
  A \( T \)$. Every divisor for which $A \( T \) < delta_(*)$ is already on the extracted model;
  its ordinary discrepancy there is $1$. The remaining exceptional divisors have $A_X \( T \) gt.eq
  A \( T \) gt.eq delta_(*)$. A $K$-MMP over $S$, if $dim X > dim S$,
  now ends at a $delta_(*)$-lc Fano Mori step $g : X_1 arrow.r W$ over $S$ with $dim W < dim X$,
  preserving the CY discrepancies/effectivity we arranged and Fano type.
  Here $- K_X$ is big over $S$, and the ordinary discrepancies stay bounded below by monotonicity in the $K$-MMP;
  the geometric generic fibre $F$ of $g$ (we also write $F$ for the fibre over $k \( W \)$) is a bounded Fano by
  BAB (generic discrepancies via horizontal divisors and separable constant extensions).
  $W$ is Fano type over $S$ (image of Fano type). If instead the contraction to $S$ is birational no further step
  is needed: the function fields agree and the discriminant is the original discrepancy function.
  This is the terminal case in each induction.

=== 1.4 Tailored complements and connected minimizing places <tailored-complements-and-connected-minimizing-places>

#thm([Lemma 1.4.])[
  (Tools at an lc place).  #emph[Let $g : X_1 arrow.r W$ be a Mori step as above,
    and let $A_(*)$ be an effective generalized CY discrepancy on $X_1$ over $S$.]
  + #emph[Suppose that $A_(*)$ is lc over the generic point of $W$,
    and that an effective generalized klt CY over $S$ is available for perturbation.
    Any prescribed horizontal divisorial lc place remains an lc place of an ordinary boundary $Omega$,
    effective on the generic fibre $F$, with $n \( K_F + Omega_F \) tilde.op 0$, for a bounded positive integer $n$.]
  + #emph[For $P$ on a birational model of $W$, suppose $A_(*)$ is klt generically and $T$ computes the
    discriminant $b_(*) \( P \)$. There is an ordinary $n$-CY over the DVR,
    lc in its b-discrepancies and effective horizontally on $F$, with $n$ bounded, keeping $T$ as an lc place.
    Here $n$-CY means that the ordinary total log canonical divisor, multiplied by $n$,
    is linearly trivial over the trait. Moreover for the adjusted discrepancy $A_(*) - b_(*) \( P \) e$,
    any two minimizing divisorials can be joined by a chain/interpolation of lc places in the following sense:
    on a log resolution over the generic DVR their strict divisors (or extractions of them) belong to a connected
    snc floor consisting of vertical coefficient-one divisors with monomial cones at the intersections.
    One can include any additional finite discrepancy data in the resolution.
    In particular normalized evaluations $a \/ e$ of such other data interpolate continuously along the chain,
    using rational weights to approximate intermediate values by divisorial evaluations.]
] <lem:A-lc-place-tools>

#proof[
  Here everything over a generic DVR can be carried out by shrinking about a generic point of a prime in a smooth
    model over $k$. Only assertions over the generic fibre and that DVR are needed.
    #emph[A model retaining the selected fibre components.] Write $R$ for the trait ring.
    Fix a nonempty finite collection of divisors computing $b_(*) \( P \)$ and choose a log resolution $Z$ over
    $"Spec" R$ on which they occur. For the adjusted generalized data $A_(*) - b_(*) \( P \) e$,
    they have boundary coefficient one. We first construct an ordinary klt pair on $Z$ whose minimal model
    contracts every other special-fibre component and every horizontal divisor exceptional over $F$.
  Subtract a sufficiently small positive multiple of the fibre from the adjusted boundary.
    The resulting generalized subpair is sub-klt, and its coefficients on the selected components remain positive.
    Mix it with a sufficiently small amount of auxiliary sub-CY data having an ample b-part on $Z$ and effective
    nonexceptional horizontal trace. Such data exist because $F$ is Fano:
    a small pushed ample contribution can be subtracted from $- K_F$,
    and vertical terms can be adjusted freely over the trait.
    The pushforward is rationally Cartier on the $bb(Q)$-factorial total space $X_1$.
    Replace the mixed ample b-part by general relatively free representatives.
    Make these choices on a common resolution and retain a general big contribution avoiding the components whose
    coefficients will be changed.
  Increase the coefficients of all horizontal divisors exceptional over $F$ and all special-fibre components
    outside the selected collection, strictly and to values in $\[ 0 \, 1 \)$.
    We obtain an effective ordinary klt boundary $Delta$, big over the trait, and
  $ K_Z + Delta tilde.op_(bb(Q) \, R) E \, $
  where $E gt.eq 0$ is supported precisely on the divisors just increased.
    In particular at least one special-fibre component is absent from $"Supp" E$.
  Here the relative fixed part can be computed directly. For divisible $m$,
    a rational section of $cal(O)_Z \( m E \)$ restricts on the generic fibre to a rational function with poles
    only along divisors exceptional over the normal projective variety $F$.
    It descends to a regular function on $F$, and is therefore a constant in the trait field.
    The section condition on a retained special-fibre component, whose coefficient in $E$ is zero,
    forces that constant to have nonnegative DVR order. Conversely every element of $R$ gives such a section.
    Thus the relative section module is $R$, and the relative fixed part of $\| m E \|$ is exactly $m E$.
  The good minimal model theorem for klt pairs with big boundary now applies,
    after spreading over an open neighbourhood of the generic point of $P$.
    Every curve in a negative extremal ray lies in $"Supp" E$, so no divisor outside this support is contracted.
    The section ring is preserved by the MMP. On its semiample output the surviving trace of $E$ must therefore
    vanish, since otherwise it would remain a nonzero fixed part.
    Consequently every component of $E$ is contracted. Call the output $Y$.
    Its boundary remains big and klt and its log canonical divisor is rationally trivial over the trait,
    so $Y$ is of Fano type there. Its generic fibre agrees with $F$ in codimension one.
    The original adjusted generalized data are crepant through these birational operations.
    Their trace on $Y$ is effective: the only special-fibre components are the retained ones,
    with coefficient one, and the surviving horizontal coefficients are the effective nonexceptional coefficients
    over $F$.
  #emph[Connectedness of the minimizing locus.] Let $pi : tilde(Y) arrow.r
    Y$ be a log resolution on which the nef part of the original adjusted data descends.
    Write $B^log$ for its boundary and $H = \( B^log \)^(= 1)$.
    The negative boundary is $pi$-exceptional because the trace on $Y$ is effective.
    Moreover $- \( K_(tilde(Y)) + B^log \)$ is nef over $Y$, and is big over $Y$ because $pi$ is birational.
    The birational connectedness lemma therefore makes $H$ connected over each fibre of $pi$.
  One can see the relevant structure-sheaf assertion directly.
    Put $G = ceil.l - \( B^log \)^(< 1) ceil.r$, an effective exceptional divisor.
    Relative Kawamata–Viehweg vanishing for $cal(O)_(tilde(Y)) \( G - H \)$ gives a surjection
  $ cal(O)_Y arrow.r pi_(*) cal(O)_H \( G \) . $
  The image factors through $pi_(*) cal(O)_H$, which injects into $pi_(*) cal(O)_H \( G \)$.
    Hence $pi_(*) cal(O)_H$ is the structure sheaf of the reduced image.
    This image is the entire reduced special fibre of $Y$, since all its components have coefficient one.
    The special fibre is connected by Stein factorization. Thus $H$ is connected,
    and the prescribed divisors lie in one connected snc coefficient-one locus.
    Generic klt ensures that every component of this locus is vertical.
    Monomial valuations along its intersections join its divisorial orders continuously;
    the uniformizer has positive value throughout. Evaluations of any additional discrepancy data are linear on
    these cones after taking a common resolution, so their ratios to $e$ interpolate continuously.
    Rational weights recover the required divisorial interpolants.
  #emph[An ordinary complement preserving the chosen place.] For a tailored ordinary $Omega$,
    use the model above (or horizontally, extract the horizontal place using a CY slightly perturbed towards klt
    as funding). Write $T_0$ for the resulting prime, which has coefficient one.
    Run a $- \( K + T_0 \)$-MMP; this divisor is pseudo-effective over the trait (respectively generically) by the
    effective generalized CY containing $T_0$. On every model the pair with strict $T_0$ is lc by comparison with
    the generalized data and b-nef negativity. At the nef model take a bounded ordinary lc complement
    (coefficients only 0 and 1, Fano type; in the relative case use Birkar’s complement over a closed point of the
    relevant prime/open, after appropriate shrinkings as above,
    containing the generic trait/field in the resulting neighbourhood).
    Indeed over the trait/field the final nef divisor is semiample by Fano type;
    generation of a multiple spreads out, as does a Fano type witness (relative ampleness and klt) and lc of the
    indicated pair via resolution, shrinking by projectivity to ensure the conditions for complements over an
    open. Its crepant pullback boundary on the model with $T_0$ still dominates $T_0$:
    it adds the pull of the effective complement addition and the effective MMP discrepancy of $- \( K + T_0 \)$.
    In particular contraction of $T_0$ in a negative step would even contradict lc.
    Push generically to $F$, preserving effective boundary there.
    All complement indices use only the absolute dimension bound. This proves both assertions. ◻
]

=== 1.5 Uniform charts and discrepancy estimates <uniform-charts-and-discrepancy-estimates>

#thm([Proposition 1.5.])[
  (Uniform charts).  #emph[At a chosen vertical place in Lemma 4(ii),
    after a bounded degree extension of $k \( W \)$ and a chosen extension of the DVR and of the place,
    there is a toroidal cone representing the place, with nonnegative coordinates
#[#set math.equation(numbering: n => "(1.2)")
 $ \( x \, e_(*) \) \, wide M x = r e_(*) . $ <eq:A-contact-cone>]

 Here $M$ ranges over a finite list of integral matrices of bounded sizes, $r$ is integral (possibly huge),
   $e_(*)$ is value of the new uniformizer, and original uniformizer value is $rho
   e_(*)$ with positive bounded $rho$. Nonzero integral solutions on the cone give divisorial valuations (not
   necessarily primitive after restriction); evaluations of discrepancy data always refer to homogeneous values by
   restriction. For horizontal places as in the first bullet one just has an orthant on a bounded generic
   resolution, without $e_(*)$. For #emph[any] effective generalized CY data $A$ on $X_1$ over $S$,
   values on these cones are finite continuous homogeneous piecewise linear,
   and are Lipschitz in $x$ with uniform constant #emph[at fixed] $e_(*) >
   0$ (uniform homogeneous Lipschitz in the horizontal case).
   Constants depend on the boundedness in this Mori step and the complement indices, #emph[not] on $r$,
   vertical coefficients, or the nef part index or the chosen data $A$.
   In particular finitely many differences at fixed parameter separations have uniform Lipschitz bounds as well.]
] <prop:A-uniform-charts>

The proof separates the construction of the charts from the metric estimate.
  The first lemma keeps track of their integral lattices and logarithmic coordinates;
  the second converts generic-fibre degree into an angular bound.
  We then replace the nef part at two chosen valuations to apply that bound to arbitrary generalized CY data.

#thm([Lemma 1.6.])[
  (Bounded toroidal charts).  #emph[For the prescribed place and tailored complement in Proposition 5,
    there are charts with its stated contact equations and integral-valuation property.
    The prescribed place is monomial on one of these charts. They have rational functions $z_1 \, dots.h \, z_f$,
    $f = dim F$, with uniformly bounded pole degrees on a bounded embedding of $F$, such that:]
  + #emph[their logarithmic differentials form a relative log basis in the vertical case and an absolute log basis
    over the generic field in the horizontal case;]
  + #emph[their orders are linear functions of the chart coordinates with uniformly bounded slopes;]
  + #emph[every rational monomial valuation in the vertical chart with $e_(*) >
    0$ restricts to a Gauss valuation on $K_1 \( z_1 \, dots.h \, z_f \)$,
    where $K_1 \/ k \( W \)$ is the bounded extension used in constructing the chart.
    Horizontally the same assertion holds with the trivial valuation on the generic field.]
  #emph[Here Gauss means that evaluating a polynomial in the $z_j$ gives the minimum of its coefficient-adjusted
    monomial weights, without cancellation among terms of equal weight.]
] <lem:A-toroidal-charts>

#proof[
  #emph[Bounded marked fibres and descent of an embedding.] The pairs $\( F \, upright("Supp") thin Omega_F \)$
    are in bounded embedded families over the geometric field.
    Indeed boundedness gives a very ample class $cal(H)$ of bounded degree and embedding dimension on each bounded
    $F$. One can use the complete system here (dimension still bounded by degree for the nondegenerate image).
    To bound the anticanonical degree, let $f = dim F$ and take a smooth complete-intersection curve $C$ of $f -
    1$ general members of the very ample system $cal(H)$, avoiding the singular locus. Adjunction gives
  $ - K_F dot.op cal(H)^(f - 1) = \( f - 1 \) cal(H)^f + 2 - 2 g \( C \) lt.eq \( f - 1 \) cal(H)^f + 2 . $
  For $f = 1$, the same formula is the usual degree formula on the smooth curve $F$.
    The nonzero coefficients of $Omega_F$ are at least $1 \/ n$, so
  $ deg_(cal(H)) "Supp" Omega_F lt.eq n deg_(cal(H)) Omega_F = - n K_F dot.op cal(H)^(f - 1) . $
  The support therefore has bounded degree. In the DVR case we can secure the embedding over a bounded degree
    extension of $k \( W \)$. The geometric Picard group is free abelian of bounded rank:
    it injects by normality into the Picard group of a smooth projective resolution,
    which is rationally connected (rational connectedness for klt Fano) and has bounded Betti numbers for a
    suitable resolution, by resolving the bounded families after stratification.
    We use here the usual characteristic zero Picard consequences of smooth rational connectedness (in particular
    trivial connected Picard and no torsion). The finite image of Galois on the discrete Picard lattice has
    bounded order. One way to see the uniformity is to reduce a finite subgroup of $"GL"_r \( bb(Z) \)$ modulo
    $3$: the principal congruence subgroup at $3$ is torsion free, so this reduction is injective,
    and $\| "GL"_r \( upright(bold(F))_3 \) \|$ bounds its order.
    After bounded extension the chosen $cal(H)$ is invariant;
    its complete linear system descends projectively as a projective-space form of bounded dimension (the
    ambiguity on section maps is scalar), which splits after another bounded extension (Severi–Brauer index
    bound). This suffices. Bounded-degree embedded varieties and their marked reduced divisors as above are
    parametrized by finitely many Chow families #cite(label("KollarChow2017")) Definition 3.21, (3.21.1)–(3.21.3).
    Here we use effective cycles and their reduced supports, with the universal cycles restricted to smooth
    characteristic-zero strata.
  #emph[Toroidalization of the fixed families.] Apply marked weak toroidalization
    #cite(label("AbramovichDenefKaru")) Theorem 1.1 to these families.
    Its source and base modifications can be taken projective and birational;
    allowing a fixed alteration would give the same construction after a bounded extension.
    Here are the uniformity and chart details we use. By compactification and noetherian stratification,
    for a dense open of each parameter stratum we can use a single proper toroidalized family over a modification
    (an alteration would also suffice) of its compactified base.
    Over the dense open (which can always be shrunk, treating its complement by noetherian induction) the new
    fibres give birational models of the original varieties. Here one works stratum by stratum starting with
    geometrically integral generic fibres, retaining these and birationality in the spread-out open (in case of
    base alteration it suffices to modify the base-changed family birationally).
    The hypotheses on the fibres parametrized, such as geometric integrality and marked support of lower
    dimension, can be imposed by ordinary Hilbert stratification.
    The compactification of a stratum serves to extend traits whose #emph[field] point is in that dense open;
    their closed points need not parametrize good pairs at all. We include horizontal markings as follows:
    first resolve the generic fibre with its marked support over this stratum, spread out over an open,
    and mark the strict boundary and the exceptional locus; arrange their preimage in the toroidalization to be in
    the boundary. Thus on the resulting generic-fibre models relevant to us any #emph[positive] crepant
    coefficient of $Omega_F$ is supported on the toroidal boundary:
    outside the old marking one had smooth with crepant subboundary $lt.eq 0$.
    We arrange the dense open to be interior on the toroidal base of the family.
    We may use smooth strict toroidal models (also by toroidal resolution);
    all modifications here are of fixed finite type families.
    Any base alteration only requires bounded degree field extension to lift the field point on the chosen dense
    open. Thus after bounded degree extension of $k \( W \)$, say to $K_1$, and extension of the place,
    we have a lift of the whole new trait to this base by properness, with its generic point interior.
    Write $R$ for the new trait ring, $t_(*)$ for its uniformizer,
    $rho$ the ramification index over the original DVR (bounded).
    We always use log pullback over the finite extension. One may view the trait as the localization at a prime
    divisor in a smooth model over $k$, working close to the generic point of that divisor (and spreading the map
    to such a neighbourhood, shrinking to pull the base boundary only to the closed-point boundary there).
    In particular the divisorial log structure of the trait comes from a log-smooth $k$-pair locally.
  #emph[Full character rank and the log chart.] We verify log smoothness at the strata,
    including the case in which the map on boundary exponent groups has a kernel.
    In a completed toroidal description use the full character lattices of the toric models.
    These include invertible torus characters as well as the characters cutting out the boundary.
    Dominance gives an injective map of full character lattices after tensoring with $bb(Q)$.
    In their logarithmic differential bases its matrix has constant integral entries.
    It therefore has full target rank at the closed stratum as well as at the generic point.
    Any lattice torsion is tame in characteristic zero. The unit characters are essential here:
    two target boundary characters can have the same boundary exponents on the source while their quotient pulls
    back to a nonconstant unit, whose differential supplies the missing direction.
  To detail the algebraic chart check, at closed points in these smooth strict models write the target boundary
    equations $y_j \, med 1 lt.eq j lt.eq s$, as pulling to $u_j x^(alpha_j)$ with $x_1 \, dots.h \,
    x_m$ source boundary parameters and $u_j$ units. The map of log differential fibres has full target rank (as
    above in the completed toroidal models, where boundary equations match up to units).
    For $alpha : bb(Z)^s arrow.r bb(Z)^m$ the exponent map, let $K = ker \( alpha \)$.
    The quotient $bb(Z)^s \/ K$ is the free group $"im" \( alpha \)$,
    so $K$ is saturated and admits an integral projection $p : bb(Z)^s arrow.r K$.
    The unit homomorphism $u$ from $bb(Z)^s$ factors as its kernel-direction contribution via this projection,
    times a homomorphism on $upright("im") \( alpha \)$. The latter extends to $bb(Z)^m$ after adjoining unit
    roots étale locally, so can be absorbed by rescaling the $x_ell$ by units.
    We now have the chart $bb(N)^s arrow.r bb(N)^m xor K$ using $alpha$ and the projection,
    with the free group summand mapping on the source by unit functions $u \|_K$.
    This is injective on groupifications with tame cokernel torsion.
    The induced map to the product of the target with the source toric chart scheme over $bb(A)^s$ is smooth near
    the point: besides the rescaled $x_ell$, one needs independent ordinary differentials for those kernel units
    and the pulled target transverse coordinates along the source stratum.
    Exactly these are independent there by full log differential rank (their boundary-weight entries are zero).
    This proves the smoothness required in Kato’s chart criterion #cite(label("KatoLog")) Theorem 3.5 and
    Remark 3.6; see also the statement and proof in #cite(label("FumiharuKatoLog")) Theorem 4.1,
    Remark 4.2 and Section 6. In particular the required rank at a closed stratum follows from the constant
    full-character matrix; it does not require specializing an arbitrary ordinary differential minor.
  #emph[The trait and its integral contact cone.] Take the fine saturated log fibre product with the trait
    equipped with its closed-point divisorial log structure. Log smoothness is preserved by fs base change and
    composition #cite(label("IllusieNakayamaTsuji")) Section 1.1.
    Spread the trait to the log-smooth $k$-pair described above and form the same fs fibre product there.
    Its source is log smooth over $k$ with the trivial log structure.
    It therefore admits smooth local charts over affine toric varieties #cite(label("FumiharuKatoLog"))
    Theorem 4.7 and Section 7. In these charts the monomial stratum quotient is regular,
    and its dimension plus the characteristic-monoid rank is the ambient dimension.
    Thus the spread-out source is log regular; localization gives this property for the fs fibre product over the
    trait. Its main component is proper over the trait and gives the desired generic model.
    Indeed the map from the fs fibre product to the ordinary one is proper here (in charts,
    integralization and finite toric saturation); the trivial-log open is dense in a log regular model,
    and maps to the generic point of the trait. At a stratum with boundary generators from the total family and
    from the trait, the cone of nonnegative orders is given precisely by $M x = r e_(*) \, med x \, e_(*) gt.eq
    0$. Here rows come from the toroidal base boundary equations,
    pulled to total boundary monomials times units with multiplicities $M$, and to the trait with contacts $r$;
    thus $M$, unlike $r$, comes from fixed chart types. These are the matching conditions from the pushout chart
    (the total family and its base before this log base change can have smooth strict toroidal structures,
    hence boundary-coordinate charts). After spreading near the trait the base has also ordinary
    residue/transverse coordinates, with the prime divisor as its single boundary near the generic point in use;
    only its boundary weight thus enters these equations. Units have weight zero;
    at the point used only boundary generators vanishing at its images in the factors are counted.
    No further independent zero conditions on weights arise from units of the saturated monoid becoming units at
    the point: a positive multiple of such an element comes from the original generators and if it is a unit
    cannot involve any generator vanishing at the point. An integral match defines an integer-valued homomorphism
    on the groupification of the pushout monoid. Saturation takes place in that same groupification,
    so this homomorphism remains integer-valued on the saturated monoid.
    We may work in strict étale local charts at a geometric stratum and then restrict valuations.
    Thus nonzero rational weights give monomial divisorial evaluations (and the zero vector the trivial
    evaluation); integral ones restrict to integral multiples of primitive divisorials when nontrivial.
    Indeed in the split toroidal chart one is taking the dual cone of the characteristic monoid at the stratum.
    A nonzero rational ray even on a face can be introduced in a toroidal subdivision (over the corresponding
    generization stratum for a face); the primitive vector for its toric lattice then gives a boundary-divisor
    order. Matched integral weights as just described are integral in this lattice.
    For $e_(*) > 0$ the restriction to $K_1$ is $e_(*) upright("ord")_R$.
    This description is equivalently obtained by fs pulling back the log-smooth monomial charts and subdividing
    toroidally. Use the family of monomial valuations for one chosen lift of the stratum in a split local chart
    (cones/subdivisions there, then restrict to the original function field);
    integral points give integral orders since they already do so in such a chart.
    No degree bound on further strict étale local charts is needed here:
    restriction of an integer-valued valuation still has value group a subgroup of $bb(Z)$,
    hence is an integral multiple of a primitive divisorial order. It is never divided by the chart degree.
    Only the initial field extension contributes the separately bounded ramification index $rho$.
    The rational functions used in the metric estimate below are taken on the fixed total family itself.
  All special components are log boundary on this model. The subboundary of the crepantly pulled ordinary $Omega$
    is bounded above by the reduced log boundary (coefficient bound by lc,
    horizontal positive support marked as above). Thus its chosen lc place is a place also of the reduced-log
    pair, since the difference is effective $bb(Q)$-Cartier. Such lc places are monomial on the log regular model:
    pass to a toroidal snc subdivision and use the lc place description for an snc pair.
    We take a cone as above containing the extended chosen place.
    For a horizontal place as in the first bullet one just takes a bounded stratified log resolution of the
    generic pairs $\( F \, upright("Supp") thin Omega_F \)$; same reasoning yields an ordinary snc monomial cone
    (over the generic field, or its extension).
  #emph[Logarithmic coordinates and Gauss restriction.] For the later metric estimate,
    choose rational log coordinates $z_1 \, dots.h \, z_f$, $f = dim F$,
    on charts of the #emph[fixed] toroidalized families, such that $d log
    z_j$ form a basis of relative log differentials near the stratum in question.
    Indeed the latter are locally free by log smoothness, and one can choose among boundary parameters and
    invertible functions giving generators from the smooth total chart.
    Finitely many choices of genuine rational functions on opens of smooth strict charts suffice (Cartier local
    boundary equations and local units generate logarithmic differentials).
    Their weights are bounded linear forms in the cone coordinates (boundary parameters or units),
    and the basis property persists under fs base change and toroidal resolution.
    Moreover the $z_j$ have bounded pole degrees on the embedded $F$’s for these charts:
    they are chosen on fixed families birational to the embedded ones,
    so on a sufficiently shrunk dense open of each stratum they give fixed bounded-degree rational maps on the
    embedded fibres. This shrinking can be built into the stratification (express each function by fractions of
    bounded-degree embedded coordinates on the generic fibre of the family and spread).
    Use the analogous absolute log bases in the horizontal generic case.
  A rational toroidal valuation here with $e_(*) > 0$ restricts to a Gauss valuation on
    $K_1 \( z_1 \, dots.h \, z_f \)$. To check, rescale to a primitive divisor on a toroidal subdivision.
    Write $nu_j = v \( z_j \) in bb(Z)$, $e_(*) = v \( t_(*) \) > 0$.
    At this divisor the residues of $z_j^(e_(*)) t_(*)^(- nu_j)$ have independent log differentials.
    Indeed relative log cotangent there, modulo the divisor, is identified with residue differentials over the
    base residue field: $t_(*) = pi^(e_(*)) dot.op \( upright("unit") \)$, for uniformizer $pi$,
    eliminates $d log pi$, while base unit differentials restrict as usual.
    This also follows from the exact sequences for log differentials at the generic smooth divisors (and
    separability). The indicated unit log differentials are $e_(*)$ times the chosen basis in relative log
    cotangent. The residues are thus algebraically independent.
    In particular a lattice basis of the weight ties (monomials $z^gamma$ with $nu dot.op
    gamma$ a multiple of $e_(*)$, adjusted by that power of $t_(*)$) has algebraically independent residues too,
    so no cancellation occurs at equal coefficient-adjusted weights.
    Horizontally one keeps $d log pi$, without a base uniformizer;
    for a nontrivial monomial valuation of integral rank one weights,
    a basis of the kernel characters of the weight gives independent residues by the same log basis calculation.
    This again gives Gauss, now for the trivial base valuation. ◻
]

#thm([Lemma 1.7.])[
  (Degrees control angular variation).  #emph[On a chart of Lemma 6,
    the order of a nonzero rational function is continuous, homogeneous and finite piecewise linear,
    including on the faces. If its pole divisor on the embedded generic fibre has degree at most $m$,
    where $m gt.eq 1$, its Lipschitz constant in $x$ at fixed $e_(*) > 0$ is at most $C m$.
    Horizontally this bound holds on the entire cone. The constant $C$ depends only on the fixed families and
    chart choices. A function with pole degree less than one is constant on the generic fibre and has zero angular
    variation.]
] <lem:A-function-slopes>

#proof[
  #emph[Piecewise linearity and faces.] On these cones rational functions have continuous homogeneous finite
    piecewise linear values, including faces. For example subdivide a split chart toroidally to snc (subfaces
    using the corresponding generization strata in the subdivision) and use the monomial order formula at the
    generic stratum (after splitting a chart if necessary), by expanding at the snc parameters:
    minima on power series supports are finite polyhedral by monomial noetherianity.
    The same minima using weights zero off a subcollection of parameters give the values on its face, i.e.
    at the more general stratum. Indeed the monomial ideals in the retained parameters test order there;
    membership is still tested in the power series ring localized along the prime of those parameters (faithful
    flatness and the monomial formula; a positive-threshold monomial ideal for the retained parameters only is
    primary to their prime, as seen already in completion). This gives continuity and compatibility across
    subdivisions. In a local split toroidal chart the subdivisions are toric subdivisions at that stratum;
    one is using the corresponding monomial order family throughout (weight ideals of boundary monomials),
    so that subfaces common to two cones use the same such orders.
  #emph[A degree bound for angular slopes.] Suppose a nonzero rational function $g$ on $F$ over the extended field
    has pole degree $lt.eq m \, med m gt.eq 1$, in the bounded embedding.
    It satisfies a polynomial equation over the $z$’s of bounded degree in $g$ and degree $O \( m \)$ in the
    $z$’s. Use the equation of the image hypersurface of $\( z \, g \)$ in a product of projective lines.
    Its multidegrees are bounded by intersecting general level divisors of all but one coordinate on $F$ on the
    locus of definition: individual divisor degrees are bounded by their pole degrees,
    so projective Bézout bounds isolated general solutions by a constant times the product bound (characteristic
    zero). Equivalently intersect the product of those level-divisor supports with diagonal conditions of bounded
    degree in a product of projective spaces, counting isolated points (the product variety has Segre degree
    bounded by a fixed multiple of the product of individual degrees). Write this equation as
  $ sum_(j = 0)^q c_j \( z \) g^j = 0 \, wide q lt.eq C \, wide deg_z c_j lt.eq C m . $
  By the Gauss property, $v \( c_j \)$ is a minimum of affine functions whose $x$-slopes have norm at most $C m$.
    Their constant terms can involve arbitrary orders of coefficients in the trait field,
    but at fixed $e_(*)$ these terms do not vary. At least two nonzero terms of the equation attain its least
    valuation. Consequently $v \( g \)$ is one of the finitely many quantities
  $ frac(v \( c_i \) - v \( c_j \), j - i) wide \( i eq.not j \) . $
  Each is $C m$-Lipschitz after enlarging the fixed constant.
    Along a segment the continuous, finite piecewise linear function $v \( g \)$ selects from this finite list;
    subdividing at its finitely many switches gives the same Lipschitz bound on the entire segment.
    Rational weights are dense, so the estimate holds also for real weights.
    Horizontally the argument applies on the entire cone. If the pole degree itself is $<
    1$ the function is constant along the generic fibre. ◻
]

#proof[
  Lemma 6 supplies the chart, the prescribed monomial place and the integral orders.
    We first extend the piecewise-linearity assertion of Lemma 7 from rational functions to the discrepancy data.
    Evaluations of $bb(Q)$-Cartier b-divisors are also finite piecewise linear:
    locally over an affine neighbourhood of the stratum write a determining Cartier multiple on a projective model
    as a difference of relatively generated divisors, then it uses minima on finite sets of rational functions.
    Generalized discrepancies differ on this cone from the reduced-log discrepancy (identically zero) by such
    Cartier b-evaluations. Piecewise-linearity here need not have bounded combinatorial complexity.
  #emph[Two-point replacement of the nef part.] Fix two rational valuations on one cone with the same $e_(*)$,
    and choose a common high model on which their centres and the determination of the nef part are visible.
    On that model let $L$ be an ample divisor, relative to the trait, and choose a rational $epsilon > 0$.
    After twisting by a pullback from the base, take general effective representatives
  $ E_(+) tilde.op_(bb(Q)) upright(bold(M)) + epsilon L \, wide E_(-) tilde.op_(bb(Q)) epsilon L $
  which contain neither centre. The ample perturbation is selected #emph[after] the high model:
    its coefficient can therefore be made so small that its pushed horizontal degree is arbitrarily small.
    Add $E_(+) - E_(-)$ to the crepant generalized boundary and remove the nef part.
    Since both representative divisors have order zero at both chosen valuations,
    the resulting ordinary divisor data have exactly the prescribed discrepancies at these two valuations.
  Let $Theta$ be its horizontal trace on the bounded fibre $F$.
    Write degrees with respect to the bounded very ample class.
    The original trace $B_F$ is effective, and the trace of the nef part has nonnegative degree.
    Relative triviality gives
  $ deg B_F + deg upright(bold(M))_F = - deg K_F . $
  Negative exceptional crepant coefficients on the high model disappear when pushed to $F$.
    Hence, if $L_F$ denotes the pushed ample contribution, then
  $ deg Theta^(+) lt.eq - deg K_F + epsilon deg L_F \, wide deg Theta^(-) lt.eq epsilon deg L_F . $
  Both degrees are uniformly bounded. This estimate uses no bound on the height of the determination or the
    denominator of $upright(bold(M))$. For divisible $l$, relative rational triviality supplies a rational
    $l$-pluriform $sigma$ for these ordinary data. Its divisor on the generic fibre is $- l Theta$;
    the possible pullback term from the trait has constant value on a slice with fixed $e_(*)$.
    Divide by the $l$-power of the log form $psi$ from wedging our relative $d log
    z_j$’s with a base log volume near this DVR. At either evaluation the discrepancy is
    $v \( sigma \/ psi^l \) \/ l$ up to the base term constant at fixed $e_(*)$,
    since $psi$ is a log generator at the toroidal divisors. The generic pole degree of this ratio is $O \( l \)$:
    the log volume of the $z_j$ has controlled poles (on the regular codimension one locus of $F$),
    hence controlled zeros by the canonical degree (nonpositive here by log CY effectivity horizontally),
    and the horizontal boundary degree was just bounded. Lemma 7 applied to $sigma \/ psi^l$,
    followed by division by $l$, proves the uniform metric assertion. The integer $l$ may be arbitrarily large.
    Continuity extends the estimate from the two rational endpoint valuations to any two real valuations on the
    slice. Thus neither the nef-part index nor the vertical contact enters the constant.
    Horizontal traces and these canonical-degree computations on the generic fibre can use forms divided by a
    separating base volume (the absolute log order at a horizontal divisor is the fibre log order,
    by taking independent base residues). Horizontally use exactly the same replacement and log volume over the
    generic field. ◻
]

#thm([Corollary 1.8.])[
  (Horizontal variants).  #emph[The chart and metric conclusions have the following two variants.]
  + #emph[The same tailorable bounded complement and homogeneous chart argument works if we are working over an
    algebraically closed generic field, with the relevant effective CYs on a $bb(Q)$-factorial model of Fano type,
    and have boundedness only up to isomorphism in codimension one of these models.]
  + #emph[A Cartier rational b-order function $N$ with effective trace of degree $O \( xi \)$ on the bounded
    model, b-linearly $bb(Q)$-equivalent to a difference of b-nef parts both of trace degrees $O \( xi \)$,
    has horizontal Lipschitz constant $O \( xi \)$, including when $xi arrow.r 0^(+)$.]
] <cor:A-horizontal-variants>

#proof[
  For (i), tailor the complement on the Fano type model using the klt perturbation in Lemma 4,
    and then push the complement and the effective CY data crepantly to the bounded normal small model.
    Their total divisors are $bb(Q)$-linearly trivial. This supplies the bounded embedded marked family and all
    the degree estimates in Proposition 5; the anticanonical degree is bounded by the same curve slicing argument.
  For (ii), use the two-point construction for each of the two b-nef parts,
    taking the pushed ample errors to be $o \( xi \)$. As above replace those parts by general effective
    representatives after the same arbitrarily tiny ample addition on a high determination, avoiding both centres.
    The residual rational principal term for $N$ now uses functions with pole degree divided by denominator
    $O \( xi \)$ on $F$; apply Lemma 7 (using constancy if pole degree $< 1$). ◻
]

=== 1.6 Integral approximation on the cones <integral-approximation-on-the-cones>

The charts now give a bound on how discrepancy changes with the angular coordinates,
  even when the trait contact is large. We next approximate real chart points by integral ones.
  Integrality makes the resulting orders positive integral multiples of prime orders,
  so the small-prime hypotheses in the comparison lemmas can be used without changing their normalization.

The following approximation does not require uniform smoothness over the DVR.
  All norms are fixed Euclidean norms; the matrices range over a fixed finite list,
  so their kernel lattices have uniformly equivalent coordinate norms.

#thm([Lemma 1.9.])[
  (Integral approximation).  #emph[]
  + #emph[Let $u_i$ lie in a fixed nonnegative orthant and $\| u_i \| arrow.r oo$.
    After passing to a subsequence there are $s_i arrow.r 0^(+)$, nonzero nonnegative integral vectors $n_i$,
    and a fixed, possibly subsequence-dependent, $C_(*)$ such that
#[#set math.equation(numbering: n => "(1.3)")
 $ \| n_i - s_i u_i \| lt.eq C_(*) s_i \, wide s_i \| u_i \| arrow.r oo . $ <eq:A-horizontal-approximation>]

]
  + #emph[Let $M_i x_i = r_i$, where $x_i gt.eq 0$, $r_i$ is integral and $M_i$ belongs to a fixed finite list of
    integral matrices. If $alpha_i > 0$ tends to zero, then after passing to a subsequence there are positive
    integers $E_i$, nonnegative integral $n_i$, and a fixed $C_(*)$ such that
#[#set math.equation(numbering: n => "(1.4)")
 $ M_i n_i = r_i E_i \, wide s_i = E_i alpha_i arrow.r 0^(+) \, wide \| n_i - E_i x_i \| lt.eq
   C_(*) s_i . $ <eq:A-vertical-approximation>]

]
  + #emph[For every sufficiently small fixed $gamma > 0$, the same matching equations admit $n_i gt.eq
    0$ integral and $1 lt.eq E_i lt.eq J \( gamma \)$ with
#[#set math.equation(numbering: n => "(1.5)")
 $ \| n_i - E_i x_i \| lt.eq gamma \, $ <eq:A-bounded-dirichlet>]

 where $J \( gamma \)$ is uniform in $i$ and in the contact vectors $r_i$.]
] <lem:A-lattice-approximation>

#proof[
  For (i), pass diagonally so that for every integral character $gamma$, the numbers $chevron.l gamma \,
    u_i chevron.r$ either converge in $bb(R)$ or diverge in absolute value.
    The characters with bounded values form a subgroup $Gamma$.
    Their limits are additive and extend to evaluation on a vector $u_(*)$.
    For a fixed interval $I = \[ a \, b \] subset \( 0 \, oo \)$,
    the probability distribution of $s \( u_i - u_(*) \)$ modulo the lattice, with $s$ uniform on $I$,
    tends to Haar measure on $Gamma^perp$. Indeed its Fourier coefficient at a character in $Gamma$ tends to one;
    for a character outside $Gamma$, integration of the exponential bounds the coefficient by
  $ frac(2, 2 pi \( b - a \) \| chevron.l gamma \, u_i - u_(*) chevron.r \|) arrow.r 0 . $
  Trigonometric approximation proves weak convergence. Every neighborhood of zero in $Gamma^perp$ has positive
    Haar measure. Choose intervals tending to zero sufficiently slowly and neighborhoods of radius $o \( s_i \)$,
    while also requiring $s_i \| u_i \| arrow.r oo$. A diagonal choice gives an integral $n_i$ with $\| n_i -
    s_i \( u_i - u_(*) \) \| = o \( s_i \)$, proving (1.3). The error is eventually less than one in each
    coordinate. Since $s_i u_i gt.eq 0$, an integral coordinate of $n_i$ cannot be negative.
    Its norm tends to infinity, so $n_i eq.not 0$.
  For (ii), pass to a subsequence with $M_i = M$. Elementary integer linear algebra gives a rational $x_(0 \, i)$
    with $M x_(0 \, i) = r_i$ and $l x_(0 \, i)$ integral for a positive integer $l$ depending only on $M$.
    For example, solve using a fixed maximal nonzero minor and take $l$ divisible by its determinant.
    Put $H_0 = ker M$, $Lambda = H_0 ∩ bb(Z)^m$, and $U_i = x_i - x_(0 \, i)$.
    On the dual lattice of $Lambda$, pass diagonally so that every normalized distance
  $ frac("dist" \( chevron.l gamma \, l U_i chevron.r \, bb(Z) \), l alpha_i) $
  converges to a finite value, with a signed residual, or tends to infinity.
    The characters in the first case form a subgroup $Gamma$.
    Their signed residual limits are additive; choose $u_(*) in H_0$ whose evaluations give these limits.
  Sample positive integers $j$ for which $s = j l alpha_i in \[ a \, b \]$,
    with $\[ a \, b \] subset \( 0 \, oo \)$ fixed. The distributions of $j
    l \( U_i - alpha_i u_(*) \)$ in $H_0 \/ Lambda$ tend to Haar measure on $Gamma^perp$,
    which may be disconnected. For $gamma in Gamma$ the frequency, reduced modulo $bb(Z)$, is $o \( alpha_i \)$,
    so its Fourier coefficient tends to one. Otherwise the geometric-series bound is at most
  $ frac(C alpha_i, "dist" \( chevron.l gamma \, l \( U_i - alpha_i u_(*) \) chevron.r \, bb(Z) \)) arrow.r 0 . $
  Use neighborhoods of zero and a slow diagonal choice as before.
    There are $j_i > 0$ and $k_i in Lambda$ such that, with $s_i = j_i l alpha_i arrow.r 0$,
  $ \| k_i - j_i l \( U_i - alpha_i u_(*) \) \| = o \( s_i \) . $
  Set $E_i = l j_i$ and $n_i = E_i x_(0 \, i) + k_i$. These are integral matches and $\| n_i - E_i x_i \| lt.eq
    C_(*) s_i$. The same coordinate argument proves $n_i gt.eq 0$.
  For (iii), apply simultaneous Dirichlet approximation to $l U_i$ on the fixed kernel torus.
    It supplies a positive $j_i lt.eq J_0 \( gamma \)$ with $"dist" \( j_i l U_i \, Lambda \) lt.eq gamma$.
    Use the same definition of $n_i$ and $E_i = l j_i$. Matching is exact, positivity follows when $gamma < 1$,
    and the bound on $E_i$ is independent of $r_i$. ◻
]

In a horizontal discrepancy application take $u_i = w_i \/ a_0 \( w_i \)$.
  In a vertical application of (1.2), take $x_i = w_i \/ e_(* \, i)$ and $alpha_i =
  a_0 \( w_i \, e_(* \, i) \) \/ e_(* \, i)$. The constant $C_(*)$ in the vanishing-error conclusions is allowed
  to depend on the selected subsequence; the bound $J \( gamma \)$ in (1.5) is uniform.

=== 1.7 Proofs of the comparison statements <proofs-of-the-comparison-statements>

We apply the two preceding tools in tandem. The tailored complement places a minimizing divisor in a bounded
  chart; integral approximation then replaces it by a prime order of small discrepancy.
  This turns a failure of comparison on the base into a violation of the corresponding hypothesis upstairs.

#proof[
  We induct on the dimension of the total space; the birational case was settled in Subsection 1.3.
  #emph[Extraction and effectivity.] Extract using $a_0$ with $delta_(*)$ fixed small and take the Mori step $X_1
    arrow.r W$. Effectivity of all parameters on the extraction holds by monotonicity,
    or in the two-sided case by the ratio hypothesis taking $delta_(*) < min \( delta \, 1 \) \/ 3$,
    after trimming $L_i arrow.r oo$ more slowly. Indeed concavity using the opposite endpoint of a fixed interval
    controls interior upper ratios too. For example, if $0 lt.eq t lt.eq T$, then concavity at zero gives
  $ a_t \( T' \) lt.eq \( 1 + t \/ T \) a_0 \( T' \) - \( t \/ T \) a_(- T) \( T' \) . $
  The hypothesis on all test subsequences makes the right side $\( 1 + o \( 1 \) \) a_0 \( T' \)$,
    uniformly on the extracted divisors. The other sign is identical.
    Apply this for each fixed rational $T$, then choose a slowly increasing interval by diagonalization.
    At subsequent Mori steps the discrepancy families are discriminants of the original family.
    They need not have a common global piecewise affine presentation.
    For each fixed prime $P$, however, resolve the original family over its generic DVR and include the fibre in
    the snc support. In the trimmed range, original divisorial valuations trivial on the current function field
    already have positive discrepancy. The discriminant is therefore the minimum of the finitely many vertical
    component ratios on that resolution. Minima compose under the nested field restrictions,
    so the finite rational parameter transitions used below persist at each step.
    Generic klt over the next base can likewise be tested on a resolution of the original family over its generic field.
  #emph[Generic klt over the next base.] We claim generic klt over $W$ in the Mori step for all bounded parameters
    eventually. Otherwise take a sign and a first horizontal lc threshold $t_(*) eq.not 0$ with $\|
    t_(*) \|$ bounded, and a horizontal minimizing divisorial $T$.
    This first threshold is rational by resolution; if tested on the original family,
    a place giving it restricts nontrivially to the current field (by the previous generic klt),
    hence gives an lc place there too. Tailor the chart using $a_(t_(*))$. Concavity at this place gives
  $ a_(plus.minus L) lt.eq \( 1 - L \/ \| t_(*) \| \) a_0 $
  for arbitrarily large fixed rational $L$, sign as chosen. Let $w$ be the chart vector representing $T$.
    Put $u = w \/ a_0 \( w \)$, and bound $\| t_(*) \|$ by a fixed $T_0$.
    If $\| u \|$ were bounded along a subsequence, the uniform homogeneous Lipschitz bound would bound $\|
    a_(plus.minus L) \( u \) \|$ independently of fixed $L$, whereas $a_(plus.minus L) \( u \) lt.eq 1 -
    L \/ T_0$. Choosing $L$ large gives a contradiction. Thus, after a further subsequence, $\| u \| arrow.r oo$.
    Lemma 9(i) gives $\| n_i - s_i u_i \| lt.eq C_(*) s_i$, $n_i eq.not 0$, and hence
  $ 0 < a_0 \( n_i \) lt.eq \( 1 + C C_(*) \) s_i \, wide a_(plus.minus L) \( n_i \)
    lt.eq \( 1 - L \/ T_0 + C C_(*) \) s_i . $
  The same $C$ works for every effective CY discrepancy $a_(plus.minus L)$.
    Choose $L > T_0 \( 1 + C C_(*) \)$ after fixing the subsequence.
    The restriction of $n_i$ is $k_i "ord"_(T_i)$, with $k_i gt.eq 1$.
    Therefore $a_0 \( T_i \) arrow.r 0$, while $a_(plus.minus L) \( T_i \) < 0$,
    contradicting the appropriate ratio hypothesis. This proves the claim;
    trim again to keep generic klt throughout and induce effective generalized data on $W$.
  #emph[Transfer of the ratio hypothesis.] We must pass the corresponding ratio hypothesis to $b_t \( P \)$ on
    $W$. Suppose there is failure with $b_0 \( P \) arrow.r 0$,
    respectively with $b_0 \( P \) < delta'$ where $delta' > 0$ is fixed sufficiently small below.
    Concavity (also using the other sign in the two-sided case) gives a bounded parameter with $b_t lt.eq 0$.
    Move from zero along a sign to the first $b_t = b_0 \/ 2$; we may take $b_s lt.eq 2 b_0$ up to that time:
    if there is a higher peak use the opposite sign, where the drop is then forced.
    In the one-sided case this uses monotonicity instead.
  There is a rational parameter $p$ on this segment and a simultaneous minimizer over $P$ with
  $ a_0 \( T \) \/ e \( T \) arrow.r
    0 quad \( upright("respectively ") med a_0 \( T \) \/ e \( T \) lt.eq 10 delta' \) \, wide a_p \( T \) lt.eq
    1 / 2 a_0 \( T \) . $
  Indeed take a cutoff radius $sqrt(b_0)$ or $8 delta'$. At zero all minimizers have ratio $a_0 \/ e = b_0$.
    At the half-drop any minimizer below the cutoff works. If minimizers exit the cutoff first,
    at a transition interpolate where a minimizer below and one at/above tie, to obtain a ratio near the cutoff,
    where the desired discrepancy drop holds since $a_p \/ e = b_p lt.eq 2 b_0$.
    It suffices to track the finite minimizing candidates from log resolution (or the divisorial restrictions of
    the finite candidates minimizing in the original family at each parameter;
    restriction of any minimizing original candidate gives a current minimizer by composition);
    use the LC-place connected interpolation above at the rational transition parameter.
  Tailor the vertical chart to this $T$. In its notation $alpha =
    rho thin a_0 \( T \) \/ e \( T \)$ and concavity gives a decrease as above by arbitrarily large factors at a
    fixed signed $L$. If $alpha arrow.r 0$, kernel approximation and uniform Lipschitz at fixed uniformizer value
    give again
  $ a_0 \( n \, E \) = O \( s \) \, wide a_(plus.minus L) \( n \, E \) < 0 $
  for sufficiently large fixed $L$, impossible. Otherwise we are in the two-sided case with $alpha lt.eq
    C delta'$ but bounded below after passage to a subsequence.
    Use the bounded Dirichlet approximation with $gamma$ so small that the Lipschitz error for $a_0$ is $<
    delta \/ 2$. The constants here (also ramification and $J$) are uniform for this Mori step,
    so choose $delta'$ small enough that $E alpha < delta \/ 2$.
    A sufficiently large signed $L$ fixed #emph[on the subsequence] still makes the discrepancy negative by the
    uniform Lipschitz bound even for $a_(plus.minus L)$. This contradicts the strong ratio hypothesis.
    We have thus transferred that hypothesis with fixed $delta' >
    0$ (and the one-sided hypothesis without a fixed cutoff as required).
    Iterate using $dim W < dim X$, stopping if birational over $S$. This proves Lemma 1. ◻
]

#proof[
  Absorb the input multiple into $H$. Use the same Mori and discriminant steps with fixed klt CY $a$.
    For $b \( P \) arrow.r 0$ at a step choose a minimizer, so in the vertical chart $alpha =
    a \( w \, e_(*) \) \/ e_(*) = rho b \( P \) arrow.r 0$. Here write $h =
    v_P \( H_W \)$ where $H_W$ is the base pullback. Use the kernel argument on the augmented torus with sampling
    vector $l \( U \, rho h \)$. Write $\( u_(*) \, z_(*) \)$ for an extension of the signed limits divided by $l
    alpha$ on the bounded-frequency subgroup $Gamma$. The same sampling equidistributes modulo the augmented
    lattice after subtracting $s \( u_(*) \, z_(*) \)$.
  Every vector in the Lie space of $Gamma^perp$ must have last coordinate zero.
    Otherwise choose its sign with negative last coordinate and target a small multiple $xi v$ with $xi arrow.r
    0^(+)$ on that torus. By taking intervals $0 < s lt.double xi arrow.r
    0$ sufficiently slowly and approximating the target to $o \( xi \)$ along a diagonal subsequence,
    the integral matched valuation has angular error $O \( xi \)$, hence $a \( n \, E \) = O \( xi \)$,
    but signed phase $xi v_(upright("last")) + o \( xi \)$, contradicting the lower sign bound.
    The sign bound applies to integral multiples whenever their total discrepancy tends to zero.
    Indeed, for $v_i = k_i "ord"_(T_i)$ with $a \( v_i \) arrow.r 0$,
    the primitive discrepancies also tend to zero. If their phase lifts are $r_i = O \( a \( T_i \) \)$,
    $r_i gt.eq - epsilon_i a \( T_i \)$, with $epsilon_i arrow.r 0$, then $k_i r_i$ are lifts with
  $ k_i r_i = O \( a \( v_i \) \) \, wide k_i r_i gt.eq - epsilon_i a \( v_i \) . $
  They tend to zero, so no phase wrapping affects the sign.
    The projection of the compact subgroup $Gamma^perp$ to its last circle now has zero Lie algebra,
    hence finite image. Some $q > 0$ annihilates this image; by character duality $\( 0 \, q \) in Gamma$.
    Consequently $upright("dist") \( q l rho h \, bb(Z) \) = O \( l alpha \)$.
    Its normalized residual limit is nonnegative: indeed $z_(*) gt.eq
    0$ by the same sign test targeting zero on the torus with precision $o \( s \)$, angular error $O \( s \)$.
    Pass to a subsequence with $l \, rho$ fixed.
  For every test sequence $b \( P \) arrow.r 0$ we thus have a subsequence and a fixed multiple there giving both
    the $O \( b \)$ bound and the lower $- o \( b \)$. There exists a #emph[single] fixed multiple giving the
    upper size bound for all such sequences. Otherwise choose diagonal violations with
  $ upright("dist") \( k ! h \, bb(Z) \) > k ! thin k thin b \( P \) \, wide b \( P \) arrow.r 0 . $
  The subsequence property gives a fixed good multiple $M$ on a further subsequence,
    with $upright("dist") \( M h \, bb(Z) \) lt.eq C b \( P \)$. For large $k$, $M divides k !$, and thus
  $ upright("dist") \( k ! h \, bb(Z) \) lt.eq \( k ! \/ M \) upright("dist") \( M h \, bb(Z) \)
    lt.eq \( k ! \/ M \) C b \( P \) \, $
  a contradiction. Fix such a multiple $M_0$. If its small lift has a negative ratio to $b \( P \)$ bounded away
    from zero along a subsequence, apply the subsequence property again and take a common multiple of $M_0$ and
    the resulting good multiple. Both small lifts, multiplied by fixed positive integers,
    tend to zero and represent the same phase, so eventually they are equal.
    Their incompatible lower signs give a contradiction. This proves the required lower $-
    o \( b \( P \) \)$ bound for $M_0$. This gives the required induction and proves Lemma 2. ◻
]

#proof[
  Use the Mori step extracting by $a + t_0 d$. Since $a$ has bounded denominator and $d gt.eq 0$,
    all extracted divisors with this discrepancy tiny have $a = 0 \, med d$ tiny.
    Thus in the extra-data case too, effectivity on the extraction holds uniformly, by the upper bounds on $a = 0$.
  #thm([Claim 1.10.])[
    (Quantized chart cells).  #emph[The bounded-denominator functions $a \, h$, when present,
      have only a bounded finite set of possible slopes in a horizontal chart,
      or in integral kernel coordinates on a vertical slice $e_(*) = 1$.
      Their vertical affine constant terms belong to a rational grid with bounded denominator,
      although their magnitudes need not be bounded. Their common cells are cut out by a fixed finite set of
      possible normal vectors, with offsets of bounded denominator.
      They are pointed, their vertices have bounded denominator, and they satisfy a uniform polyhedral distance bound.]
  ] <claim:A-quantized-cells>
  #proof[
    Horizontally, the functions of bounded denominator $a \, h$ have homogeneous linear pieces with slopes in a
      fixed bounded finite rational grid: their Lipschitz constants are bounded using values of effective CY
      discrepancies at finitely many fixed parameters, and their values on integral vectors lie in a prescribed
      rational grid, which controls the linear form on any full-dimensional open conical piece (take lattice
      differences there). Thus their cells can be cut by the comparisons of those finitely many linear forms.
      Vertically work on $e_(*) = 1$, writing $x = x_0 + U$ as before in an integral kernel basis.
      Linear parts in $U$ again belong to a bounded finite rational grid,
      and the possibly unbounded constant terms at $x_0$ to a rational grid with bounded denominator (test lattice
      differences on the open #emph[homogeneous] pieces, using integrality after multiplying $x_0$ by $l$).
      Coordinates forced zero on the slice can first be dropped (use $x_0$ for the reduced system),
      giving full relative dimension in $x_0 + ker M$. More explicitly,
      an interior of linearity there lifts by homogeneity to an open in the linear space of matches.
      Take a lattice point interior to this homogeneous piece and translate a sufficiently large positive multiple
      of it by each of $\( l x_0 \, l \)$ and the kernel basis vectors (with last coordinate zero).
      Both evaluations in each difference are on integral matches in the same linearity piece,
      which gives the intercept and kernel-slope quantization regardless of the size of $x_0$.
      Closures of cells can be cut by inequalities from a finite set of normals,
      with offsets of bounded denominator: compare pairs of the affine forms occurring and include nonnegativity
      constraints. Values are affine on these comparison cells by continuity.
      Vertices have bounded denominator, and the polyhedra are pointed.
      We also use the elementary polyhedral error bound (Hoffman’s bound):
      distance to a nonempty polyhedron with rows in a fixed finite list is bounded by a constant times the
      maximum violation. Here is the distance estimate explicitly.
      Write a nonempty polyhedron as $P = { y : R_nu y lt.eq b_nu }$, with rows $R_nu$ in the fixed finite list.
      If $y$ is the nearest point of $P$ to $x$, express $x - y$ in its normal cone using independent active rows:
    $ x - y = sum_(nu in I) lambda_nu R_nu^(sans(T)) \, wide lambda_nu gt.eq 0 \, wide
      sum_(nu in I) lambda_nu lt.eq C \| x - y \| . $
    The constant is uniform because only finitely many independent row sets can occur.
      Taking the scalar product with $x - y$ gives
    $ \| x - y \|^2 = sum_(nu in I) lambda_nu \( R_nu x - b_nu \) lt.eq C \| x - y \| max_nu \( R_nu x - b_nu \)_(+) . $
    Cancel $\| x - y \|$ when it is nonzero. ◻
  ]
  #emph[Horizontal signs and generic klt.] First in the extra-data case,
    $h < 0$ on a horizontal $a$-lc place over $W$ is impossible eventually. Tailor using $a$.
    The homogeneous comparison cells for $a \, h$ come from finitely many rational cones.
    On a cell containing a witness, the face $a = 0$ is rational and $h$ is linear.
    Some extremal ray of that face has $h < 0$. The possible primitive integral ray generators form a bounded
    finite set, so there is a bounded nonzero integral witness $a = 0 \, med h < 0$.
    But $c$ on it is bounded by Lipschitz (again by fixed parameters), and $h$ quantized and $gt.eq - eta_i c$,
    impossible. Next generic klt for $a + lambda \( h + theta c \)$ holds uniformly for small $lambda > 0$,
    $0 < theta lt.eq theta_0$: otherwise take $lambda_i arrow.r
    0$ equal to a first positive lc threshold with the corresponding fixed $theta_i$ in each example.
    There is such a first threshold by common resolution, since on horizontal $a = 0$ we have $h gt.eq 0 \, med
    c > 0$. Tailor using this threshold place. In the homogeneous chart distance from its vector $w$ to $a =
    0$ (including the zero vector) is bounded by $C_1 a \( w \)$ by the slope/polyhedral bound.
    On that set $h + theta_i c gt.eq 0$, by the divisorial conditions and rational approximation there.
    Thus $h + theta_i c gt.eq - C_2 a \( w \)$ at $w$, inconsistent with the threshold tending to zero
    ($a \( w \) > 0$).
  #emph[Lexicographic minima and their denominators.] For $P$ over $W$ denote the claimed lexicographic minima by
    $a' \, d'$ (and $a' \, h' \, c'$). They exist: on a common resolution over the DVR use the vertical components
    and the formula for discrepancies by monomial orders plus the nonnegative reduced-log discrepancy.
    Horizontal $a$ is nonnegative, and in the extra-data case on horizontal $a = 0$,
    $h$ is nonnegative and $c > 0$. Explicitly include the fibre among the divisors on the resolution,
    so $e$ is a nonnegative linear combination of vertical orders only.
    At a generically klt parameter a minimizer has reduced-log discrepancy zero (on the resolution) and all its
    positive orders in those coordinates lie on minimizing vertical components,
    by subtracting the minimum times $e$; thus tracking these finitely many components captures departures from
    the faces in the argument. For each example and $P$, sufficiently small strictly positive parameters in
    lexicographic order thus have only lexicographically minimizing components,
    and give a simultaneous minimizer for tailoring using a generically klt parameter.
    On that chart the minimum $a \/ e_(*)$ is $rho a'$, and likewise for $h$ on the minimizing locus if used.
    By linear optimization at cell vertices on the slice $e_(*) = 1$,
    both of these minima have bounded denominator. Thus so do $a'$ and $h'$, uniformly in $P$.
  #emph[Uniformity of the chambers.] If minimizers of $a + t
    d$ leave the $a$-minimum for some $t$ tending to zero, take the first (strictly positive rational) transition
    where minimizers of both types tie. Connected interpolation gives a simultaneous minimizing place with
    $\( a \/ e \) - a' \( P \)$ arbitrarily small positive. Tailor at that place for the transition discrepancy.
    On the cell of its normalized weights (value $e_(*) = 1$), the affine function $a -
    rho a' \( P \)$ is nonnegative. Its minimum is attained at a vertex, because the cell is pointed.
    Both the vertex values of $a$ and $rho a' \( P \)$ lie in a fixed rational grid.
    A strictly positive minimum would therefore be bounded below by a fixed positive number.
    Taking the interpolated excess smaller than this number forces the face $a =
    rho a' \( P \)$ in that cell to be nonempty. Let $epsilon = a \( w \) - rho a' \( P \) > 0$.
    The distance estimate in Claim 10 gives $w_0$ on that face with $\| w - w_0 \| lt.eq C_1 epsilon$.
    If $C_2$ is the Lipschitz constant of $d$, then
  $ \( a + t d \) \( w_0 \) - \( a + t d \) \( w \) lt.eq - epsilon + t C_1 C_2 epsilon < 0 $
  for a uniformly small $t > 0$. This contradicts minimality;
    continuity permits the comparison at real weights and rational approximation recovers divisorial tests.
    This proves uniform exact minimization on the $a$-face for $a + t d$.
    Identical reasoning with $h + theta c$ yields uniform small $lambda$ with #emph[all] minimizers still on the
    $a$-face for every $0 < theta lt.eq theta_0$ in the extra-data case.
    Fix a uniformly positive small such $lambda$. If first positive $theta$-transitions away from the $h$-minimum
    within the $a$-minimum approach zero, now interpolate with tiny positive excess of $h \/ e$ above $h'$;
    all simultaneous minimizers stay on the $a$-minimum. Use joint $a \,
    h$ cells with the additional affine face $a = rho a'$; the grid and distance argument within this face applied
    to $h$ contradicts minimality for $h + theta c$. Within the $a$-minimum the minimizer condition no longer
    depends on the magnitude of $lambda > 0$, only on $theta$.
    Thus the full formulas hold uniformly on a smaller sector.
  #emph[Induction on the base.] For induction $a' + t d'$ gives klt data for positive $t$ by the minimum formula,
    and data at zero by the endpoint limit already explained.
    In the extra-data case on $a' = 0$, $d' lt.eq c'$, $h' gt.eq - eta_i c'$,
    and testing at a $d'$-minimizer at fixed uniform small $theta > 0$ gives $h' + theta c' lt.eq
    C_3 d'$ by the exact formula. Hence $c' lt.eq C_4 d'$ and $h' lt.eq C_3 d'$ there.
    All hypotheses now hold at the next step. Any negative $h$ at $a =
    0$ vertical in this step marks a negative $h'$ at $a' = 0$, by restriction.
    Induct to the base to obtain all assertions. ◻
]

== 2 Nonvanishing from signed phases <sec:B>

We seek sections of a bounded positive multiple of a rational polarization,
  even when its denominators are unbounded. The hypothesis will control the fractional orders of the polarization
  at primes whose discrepancies tend to zero. The sign of that control will determine which corrections can be
  removed in the proof.

For a rational Weil divisor $H$ on a normal variety, set

#[#set math.equation(numbering: n => "(2.1)")
 $ R \( H \) = sum_P (1 - 1 / r_P) P \, wide r_P = min { r in bb(Z)_(> 0) :
   r "coeff"_P \( H \) in bb(Z) } . $ <eq:B-ramification-boundary>]

Only finitely many terms are nonzero. When $H$ is $bb(Q)$-Cartier,
  its order at a higher divisor means the order of its Cartier b-pullback, rather than a rounded trace.
  A #emph[signed phase] of this order is a lift of its image in $bb(R) \/ bb(Z)$;
  whenever this lift tends to zero, it is eventually the unique lift in $\( - 1 \/ 2 \, 1 \/ 2 \)$.

We use the comparison results of Section 1 and two boundedness theorems.
  Rationally connected projective varieties carrying effective generalized $delta$-lc Calabi–Yau data in bounded
  dimension are bounded up to isomorphism in codimension one #cite(label("BirkarCY")) Theorem 1.7.
  No bound on the Cartier index of the nef b-divisor occurs in that theorem.
  We also use effective birationality for a nef and big integral Weil divisor $N$ on a projective $delta$-lc
  variety when $N - K$ is pseudo-effective #cite(label("BirkarPolarised")) Theorem 1.1.
  Our applications of the latter theorem take place on $bb(Q)$-factorial models, so that $N$ is $bb(Q)$-Cartier,
  but need not be Cartier.

#thm([Lemma 2.1.])[
  (Phase nonvanishing).  #emph[Let $\( V_i \, H_i \)$ be a sequence in bounded dimension,
    where $V_i$ is projective of Fano type and $H_i$ is a nef and big $bb(Q)$-Cartier rational Weil divisor.
    Suppose that, for rational $t in \[ 0 \, L_i \]$, where $L_i arrow.r oo$,
    there are generalized data with discrepancies $a_i \( t \)$ such that
#[#set math.equation(numbering: n => "(2.2)")
 $ B_i \( t \) gt.eq R \( H_i \) \, wide K_(V_i) + B_i \( t \) +
   upright(bold(M))_i \( t \)_(V_i) tilde.op_(bb(Q)) t H_i \, wide
   upright(bold(M))_i \( t \) upright(" is b-nef and ") bb(Q) upright("-Cartier") . $ <eq:B-family>]

 Assume that $a_i \( 0 \)$ is klt and that $a_i \( t \)$ is nondecreasing in $t$ at every divisorial valuation.]
  #emph[Assume the following condition, also after restriction to any subsequence.
    For every choice of rational $t_i arrow.r oo$ in the parameter range,
    one can pass to a further subsequence and choose a fixed positive integer $q$ such that,
    for every sequence of primitive divisorial valuations $T_i$ with $a_i \( t_i \, T_i \) arrow.r 0$,
    the signed phases $theta_i \( T_i \)$ of $q H_i \( T_i \)$ satisfy
#[#set math.equation(numbering: n => "(2.3)")
 $ - o #scale(x: 120%, y: 120%)[\(] a_i \( t_i \, T_i \) #scale(x: 120%, y: 120%)[\)] lt.eq
   theta_i \( T_i \) lt.eq O #scale(x: 120%, y: 120%)[\(] a_i \( t_i \, T_i \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:B-phase-hypothesis>]

 Then there is an integer $M > 0$ such that for every $i$ some $m_i in { 1 \, dots.h \,
   M }$ satisfies $\| floor.l m_i H_i floor.r \| eq.not diameter$.
   Equivalently, after replacing $M$ by a common multiple, the same positive degree works for all $i$.]
] <lem:B-phase-nonvanishing>

All the constants in this lemma are sequence bounds. In particular,
  the phase condition is tested along arbitrary subsequences and with arbitrarily chosen divisors.
  This quantifier has two useful consequences. First, at a fixed growing parameter and after the allowed scaling,
  there are $C > 0$ and a sufficiently small fixed $eta > 0$ such that all phases at $a_i \( t_i \, T \) <
  eta$ have their small lifts bounded in absolute value by $C a_i \( t_i \, T \)$, eventually.
  Otherwise one selects $a_i \( t_i \, T_i \) arrow.r 0$ with an unbounded ratio.
  Second, the condition also applies to integral multiples $w_i =
  e_i "ord"_(T_i)$ whenever $a_i \( t_i \, w_i \) arrow.r 0$. Indeed, $a_i \( t_i \, T_i \) arrow.r 0$, and

#[#set math.equation(numbering: n => "(2.4)")
 $ e_i theta_i \( T_i \) = O #scale(x: 120%, y: 120%)[\(] a_i \( t_i \, w_i \) #scale(x: 120%, y: 120%)[\)]
   arrow.r 0 \, wide e_i theta_i \( T_i \) gt.eq - o #scale(x: 120%, y: 120%)[\(] a_i \( t_i \, w_i \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:B-multiple-phase>]

Thus multiplication introduces no wrap around the phase circle.
  This observation is needed each time a divisorial valuation restricts to a multiple of an angular prime.

=== 2.1 Seifert bundles and two consequences of comparison <seifert-bundles-and-two-consequences-of-comparison>

We use the graded-algebra description of Seifert bundles and its compactification #cite(label("KollarSeifert"))
  Definition 5, Theorem 7 and Section 14. The discrepancy and phase formulas needed here are proved below.

#thm([Lemma 2.2.])[
  (Bundle construction and discrepancies).  #emph[Let $V$ be projective normal,
    and let $H$ be a $bb(Q)$-Cartier rational divisor. There is a projective normal compactified Seifert bundle
    $p : Y arrow.r V$ with disjoint $bb(Q)$-Cartier zero and infinity sections $E_0 \,
    D$ and a rational fibre coordinate $z$ such that
#[#set math.equation(numbering: n => "(2.5)")
 $ "div" \( z \) = p^(*) H + E_0 - D \, wide K_Y + E_0 + D = p^(*) #scale(x: 120%, y: 120%)[\(] K_V +
   R \( H \) #scale(x: 120%, y: 120%)[\)] . $ <eq:B-bundle-identities>]

 The second equality uses compatible canonical divisors. The divisor $D$ is relatively ample; if $H$ is nef,
   then $D$ is nef, and if $H$ is nef and big, then $D + p^(*) H$ is nef and big.]
  #emph[In these identities, pullback of a rational Weil divisor along the equidimensional map $p$ is defined at
    the generic points of its prime components, using the multiplicities of their inverse images.
    This agrees with Cartier pullback whenever the divisor is $bb(Q)$-Cartier.
    Orders of $H$, $E_0$, and $D$ on higher models use their Cartier b-pullbacks.]
  #emph[Suppose $B gt.eq R \( H \)$ and $upright(bold(M))$ is a nef $bb(Q)$-Cartier b-divisor on $V$.
    Give $Y$ boundary $p^(*) \( B - R \( H \) \)$ and nef part $p^(*) upright(bold(M))$.
    Write $a$ for the generalized discrepancy on $V$ and $A$ for that on $Y$.
    If a primitive divisorial valuation $v$ of $k \( Y \)$ restricts nontrivially to $w$ on $k \( V \)$, then
#[#set math.equation(numbering: n => "(2.6)")
 $ A \( v \) = a \( w \) + \| h \( v \) \| + "def" \( v \) \, wide h \( v \) = v \( E_0 \) - v \( D \) equiv -
   w \( H \) med \( mod med bb(Z) \) \, $ <eq:B-bundle-discrepancy>]

 where $"def" \( v \)$ is a nonnegative integer. It vanishes precisely for the Gauss, or fibre-torus-invariant,
   valuations. If $w = 0$, the primitive valuations are the ordinary places of the generic $bb(P)^1$,
   and have discrepancy $1$. Consequently klt base data give klt data on $Y$ without the two sections;
   adding both sections gives lc data whose non-klt locus is contained in the sections.]
] <lem:B-seifert>

#proof[
  The two affine charts are the relative spectra of the algebras of rational monomials $g
    z^j$ satisfying $"div" \( g \) + j H gt.eq 0$, with $j gt.eq 0$ and $j lt.eq 0$, respectively.
    If $ell H = "div" \( b \)$ locally, these charts are finite cyclic quotients of the ordinary line charts
    obtained using $b^(1 \/ ell)$ and the coordinate $z \/ b^(1 \/ ell)$.
    They glue to the stated normal projective bundle. This description gives the two sections,
    their $bb(Q)$-Cartier property, and the first equality in (2.5).
    The restriction of $D$ to itself is numerically $H$, while its restriction to $E_0$ is trivial;
    this and relative ampleness give the positivity assertions.
  At a prime $P$ of $V$ the reduced vertical divisor has multiplicity $r_P$.
    Computing the relative canonical divisor by $d log z$ therefore gives the second equality in (2.5),
    including exactly the coefficient $1 - 1 \/ r_P$.
  For the discrepancy formula, write $w = e "ord"_T$ on a smooth base model and choose a uniformizer $x$ at $T$.
    Wedge a base logarithmic volume form with $d log z$. The additional logarithmic order is a nonnegative
    integer; it is zero exactly when the residue of the valuation-zero monomial $z^e \/
    x^(v \( z \))$ is transcendental over $kappa \( T \)$. This is the Gauss condition.
    Removing the two sections from the boundary adds $v \( E_0 \) + v \( D \) = \| h \( v \) \|$,
    since their supports are disjoint. Evaluating the first identity in (2.5) gives the congruence.
    The same calculation on a determination of the nef part proves the generalized formula.
    For trivial restriction the assertion is the usual discrepancy calculation on $bb(P)_(k \( V \))^1$. ◻
]

In the setting of (2.2), the data without the sections have total logarithmic divisor

#[#set math.equation(numbering: n => "(2.7)")
 $ K_Y + p^(*) \( B \( t \) - R \( H \) \) + p^(*) upright(bold(M)) \( t \)_Y tilde.op_(bb(Q)) \( t + 1 \) p^(*)
   H - 2 D . $ <eq:B-bundle-total>]

At $t = 0$, adding both sections instead gives effective generalized lc Calabi–Yau data.

#thm([Lemma 2.3.])[
  (Clearing the small denominators).  #emph[In bounded dimension,
    suppose $V$ is projective of Fano type and carries effective generalized klt Calabi–Yau data with $B gt.eq
    R \( H \)$. After multiplying $H$ by a bounded positive integer,
    there is an ordinary klt log Fano boundary $Theta gt.eq R \( H \)$.
    For this scaled divisor the Seifert bundle is of Fano type.
    The assertion does not require a bound on the Cartier index of the nef b-divisor.]
] <lem:B-denominator-clearing>

#proof[
  Take a small $bb(Q)$-factorialization. The class $- \( K_V + R \( H \) \)$ is pseudo-effective,
    because it is the sum of $B - R \( H \)$ and the trace of a b-nef divisor.
    Moreover $\( V \, R \( H \) \)$ is ordinarily klt: its discrepancies dominate the given generalized
    discrepancies, by $B gt.eq R \( H \)$ and b-nef negativity.
    Run its anticanonical MMP, using Fano type to obtain a nef model.
    Ordinary lc comparison holds along this MMP by the negativity argument of Section 1.
    The coefficients of $R \( H \)$ belong to the fixed hyperstandard set ${ 1 - 1 \/ r : r in bb(N) }$.
    The bounded ordinary lc complement theorem #cite(label("BirkarComplements")) Theorems 1.7–1.8,
    followed by pullback through this MMP, gives an ordinary lc boundary $Delta gt.eq
    R \( H \)$ with $n \( K_V + Delta \) tilde.op 0$, where $n$ is bounded in terms of dimension.
    The pullback dominates $R \( H \)$ because the MMP has the anticanonical sign;
    this is the same complement pullback used in Lemma 4.
  If $r_P > n$, the $1 \/ n$-quantization of $Delta$ forces $"coeff"_P \( Delta \) = 1$.
    Multiply $H$ by the least common multiple of the integers at most the bound for $n$.
    All smaller denominators disappear. Every remaining component of $R \( H \)$ is therefore contained in
    $floor.l Delta floor.r$. Let $Theta_0$ be any klt log Fano boundary on $V$.
    For a sufficiently small positive rational $rho$, chosen separately for each variety,
  $ Theta = \( 1 - rho \) Delta + rho Theta_0 $
  is klt, dominates the new $R \( H \)$, and has ample negative log canonical class.
    No uniform lower bound for $rho$ is needed.
  On the bundle use boundary $p^(*) \( Theta - R \( H \) \) + \( 1 - rho' \) \( E_0 + D \)$,
    with $rho' > 0$ sufficiently small. Lemma 12 proves klt. If $A = - \( K_V + Theta \)$,
    its negative log canonical class is $p^(*) \( A - rho' H \) + 2 rho' D$,
    which is ample for small $rho'$ by relative ampleness and base positivity. Thus the bundle is of Fano type. ◻
]

#thm([Lemma 2.4.])[
  (An unbounded-index obstruction).  #emph[Let $F_i$ be projective of positive bounded dimension and let $G_i$ be
    ample $bb(Q)$-Cartier rational divisors such that $\( F_i \, R \( G_i \) \)$ is klt and
$ - \( K_(F_i) + R \( G_i \) \) tilde.op_(bb(Q)) I_i G_i \, wide I_i > 0 \, quad I_i arrow.r oo . $

 Let $C_i$ be the compactified Seifert cone obtained by contracting the zero section,
   and denote its infinity divisor by $D_i$. Then $C_i$ is klt of Fano type, $D_i$ is ample, and $-
   K_(C_i) tilde.op_(bb(Q)) \( I_i + 1 \) D_i$. It is impossible that
#[#set math.equation(numbering: n => "(2.8)")
 $ v_i \( D_i \) = o #scale(x: 120%, y: 120%)[\(] A_(C_i) \( v_i \) #scale(x: 120%, y: 120%)[\)]
   $ <eq:B-cone-small-height>]

 for every sequence of primitive divisorial valuations with $A_(C_i) \( v_i \) arrow.r 0$.]
] <lem:B-unbounded-index>

#proof[
  The contraction exists by semiampleness of the infinity divisor.
    One can also construct it by the finite fibre-power map to the ordinary compactified bundle for a very ample
    Cartier multiple of $G_i$, contracting its zero section and then Stein factorizing. The bundle identity gives
  $ K_Y + \( 1 - I_i \) E_0 + \( 1 + I_i \) D tilde.op_(bb(Q)) 0 . $
  The pair with subboundary $\( 1 - I_i \) E_0$ is sub-klt by (2.6);
    the discrepancy of the contracted zero section is $I_i > 0$.
    This proves the assertions about the cone and its canonical divisor.
    Near infinity the discrepancy formula reads, for $u = v \( D \) > 0$,
  #[#set math.equation(numbering: n => "(2.9)")
   $ A_C \( v \) = A_(F \, R \( G \)) \( w \) + u + "def" \( v \) \, wide u equiv
     w \( G \) med \( mod med bb(Z) \) . $ <eq:B-infinity-formula>]
  If (2.8) held, apply Lemma 1 over a point to the nonincreasing family with discrepancies $A_C - t v \( D \)$,
    boundary $t D$, and nef part $\( I_i + 1 - t \) D$ on a range tending to infinity.
    The phase-free ratio hypothesis is exactly (2.8). The comparison lemma would make this family klt on every
    fixed bounded parameter range, whereas at $t = 1$ the prime $D$ has discrepancy zero. This is a contradiction. ◻
]

#thm([Lemma 2.5.])[
  (Bounding a principalization order).  #emph[Let $F_i$ be projective of Fano type in bounded dimension,
    and let $P_i tilde.op_(bb(Q)) 0$ be $bb(Q)$-Cartier rational divisors.
    Suppose that $F_i$ carries effective generalized klt Calabi–Yau data with discrepancies $a_i$ and boundary at
    least $R \( P_i \)$. Suppose, after a fixed integral scaling if necessary,
    that the signed phases of $P_i$ at every sequence with $a_i \( T_i \) arrow.r
    0$ lie in $\[ - o \( a_i \( T_i \) \) \, O \( a_i \( T_i \) \) \]$.
    Then the least positive integer $q_i$ for which $q_i P_i$ is principal is bounded.]
  #emph[More generally, the same cyclic-cover argument applies whenever the induced isotrivial fibration below has
    $u = o \( A \)$ at its small-discrepancy divisors over zero.
    This formulation permits the argument to be used after an independent estimate of the height $u$.]
] <lem:B-principal-order>

#proof[
  Apply Lemma 13 to obtain, after a further bounded scaling, ordinary klt log Fano data dominating $R \( P_i \)$.
    This does not affect boundedness of the original principalization orders.
    A small $bb(Q)$-factorialization preserves all the data and these orders.
    Suppress the index and suppose for contradiction that $q arrow.r oo$. Write
  $ "div" \( phi.alt \) = q P \, wide tilde(F) = "Norm"_F #scale(x: 120%, y: 120%)[\(] k \( F \) \( r \)
    #scale(x: 120%, y: 120%)[\)] \, wide r^q = phi.alt . $
  The degree is $q$ by minimality of $q$ and the Kummer criterion over a field containing all roots of unity.
    The ramification in codimension one is encoded by $R \( P \)$.
    In particular the log pullbacks of both the ordinary log Fano boundary and the generalized boundary are
    effective and klt.
  Form the diagonal quotient
  #[#set math.equation(numbering: n => "(2.10)")
   $ X = \( tilde(F) times bb(P)_y^1 \) \/ mu_q arrow.r bb(P)_(y^q)^1 \, $ <eq:B-cyclic-fibration>]
  where $mu_q$ acts inversely on $y$ and $r$, so that $y r$ is invariant.
    The map from the product to $X$ is quasi-étale: a nonidentity element has a fixed locus of codimension at
    least one on $tilde(F)$ and only the two fixed points on $bb(P)^1$. The generic fibre of (2.10) is connected.
    Log pulling the ordinary log Fano data to the product and descending proves that $X$ is of Fano type over the curve.
  Pull back the generalized data to the product and descend them.
    They give effective generalized klt Calabi–Yau data over the curve.
    The invariant nef b-divisor descends on a sufficiently high finite quotient;
    its $bb(Q)$-Cartier property and relative rational triviality descend by taking norms.
    For a primitive valuation over zero put $u = v \( y^q \) \/ q > 0$,
    and let $w$ be its restriction to $k \( F \)$. The product discrepancy calculation gives
  #[#set math.equation(numbering: n => "(2.11)")
   $ A \( v \) gt.eq a \( w \) + u \, wide u equiv - w \( P \) med \( mod med bb(Z) \) \, $ <eq:B-cyclic-height>]
  where $a \( w \) = 0$ if $w = 0$. The congruence follows by evaluating the invariant function $y r$.
    These formulas can equally be computed upstairs and divided by the ramification index,
    using log pullback and homogeneous discrepancies.
  If $A \( v_i \) arrow.r 0$, trivial restriction is impossible because it would make $u_i$ a positive integer.
    For nontrivial restriction, (2.4) and (2.11) give $u_i = o \( A \( v_i \) \)$:
    all terms tend to zero, so there is no wrap, and the lower bound for the signed phase bounds the positive
    number $u_i$ from above.
  Apply Lemma 1 over the curve to $A - t thin v \( f^(*) \[ 0 \] \) \/ q$.
    These are effective generalized Calabi–Yau data obtained by adding $t f^(*) \[ 0 \] \/ q$ to the boundary;
    the nef part is unchanged. The parameter range may tend to infinity.
    The reduced zero fibre has discrepancy $1$ and multiplicity $q$,
    hence its initial discriminant discrepancy satisfies $0 < b_0 \( 0 \) lt.eq 1 \/ q$.
    Since the perturbation is a pure base pullback,
  $ b_t \( 0 \) = b_0 \( 0 \) - t \/ q \, wide b_1 \( 0 \) lt.eq 0 . $
  This contradicts the ratio conclusion of Lemma 1, because $b_0 \( 0 \) arrow.r 0$. ◻
]

=== 2.2 Proof of phase nonvanishing <proof-of-phase-nonvanishing>

We now prove the main nonvanishing lemma. The first task is to subtract small positive phase corrections from the
  polarization and show that the remaining divisor is not big.
  Its subsequent MMP will either contradict the unbounded-index obstruction or produce a lower-dimensional base to
  which the same phase hypotheses descend.

#proof[
  #emph[Choosing the phase corrections.] We argue by dimension induction. The assertion for a point is immediate.
    If the assertion fails in positive dimension, pass to a sequence and choose integers $N_i arrow.r oo$ such that
  #[#set math.equation(numbering: n => "(2.12)")
   $ \| floor.l m H_i floor.r \| = diameter quad upright("for all integers ") 1 lt.eq m lt.eq
     N_i . $ <eq:B-no-sections>]
  Choose rational $k_i arrow.r oo$ sufficiently slowly relative to $N_i$ and $L_i$.
    Use the phase hypothesis at $k_i$ and Lemma 13, pass to a subsequence,
    and scale $H_i$ by fixed positive integers. Reparametrize the given families by these same factors,
    and decrease $N_i$ by bounded factors. We retain (2.12), obtain the phase hypothesis without a displayed
    scaling at $k_i$, and have Fano type Seifert bundles. These bounded changes never replace the given
    discrepancy families by different ones.
  Fix a sufficiently small constant $eta > 0$. Extract precisely the exceptional primes $T$ with
    $a \( k_i \, T \) < eta$ whose small signed phase $f_T$ of $H \( T \)$ is positive.
    Include the original primes with the same property in the list of corrections. This is a finite list:
    monotonicity gives $a \( 0 \, T \) lt.eq a \( k_i \, T \) < eta$,
    and the extraction and finiteness argument of Section 1 applies to the klt data $a \( 0 \)$.
    Write the resulting Fano type model as $U arrow.r V$. For small fixed $eta$ we have, eventually,
  #[#set math.equation(numbering: n => "(2.13)")
   $ 0 < f_T lt.eq C a \( k_i \, T \) lt.eq C eta \, wide C_U = sum_T f_T T \, wide P_U = H_U - C_U \,
     $ <eq:B-positive-corrections>]
  where $H_U$ is the pullback of $H$. We first prove that $P_U$ is not big, eventually.
  #emph[The threshold contradiction under bigness.]
  Suppose instead that $P_U$ is big. On the Seifert bundle let $A$ be the discrepancy of the data at $k_i$ without
    the sections. Choose a small fixed $0 < delta < 1 \/ 4$, sufficiently small relative to $eta$ and the phase
    bound. Extract every exceptional prime with $A < delta$, and let $cal(S)$ be the reduced sum of #emph[all]
    primes with $A < delta$ on this extraction, including original primes.
    Lemma 12 shows that they are Gauss valuations. Their extraction is funded by the effective zero-parameter
    generalized Calabi–Yau data with both sections, mixed with a sufficiently small ordinary klt log Fano
    contribution as in Section 1. Thus the extraction is of Fano type, and the trace boundary of $A$ is effective on it.
  Put $upright(bold(H)) = p^(*) H$, and denote by $upright(bold(D))$ the b-pullback of $D$. The b-divisor
  $ upright(bold(J)) = upright(bold(D)) + upright(bold(H)) $
  is nef and big and has integral Weil trace on the original bundle:
    the multiplicities $r_P$ clear the coefficients of $H$ at all vertical primes.
    Let $tau$ be the pseudo-effective threshold for subtracting $cal(S)$ from its trace on the extraction. We claim that
  #[#set math.equation(numbering: n => "(2.14)")
   $ cal(S) eq.not 0 \, wide k_i tau_i arrow.r 0 . $ <eq:B-threshold-small>]
  To prove the claim, if it fails pass to a subsequence and choose integers $k_i \,
    tau_i^(- 1) lt.double m_i lt.double N_i$; omit $tau_i^(- 1)$ when $cal(S) = 0$.
    Round the coefficients on the extracted primes to obtain
  $ Q = sum_(T subset cal(S)) q_T T \, quad 1 lt.eq q_T lt.eq 2 \, wide N = m upright(bold(J))_U - Q $
  big and integral. All nonintegral coefficients of $m upright(bold(J))_U$ are on the extracted primes,
    so this rounding suffices. When $cal(S) = 0$, use $N = m J$. Run the $N$-MMP to a nef and big model.
    Here and in what follows a prime denotes the output trace,
    and a star denotes its Cartier b-pullback to a common resolution. Set
  $ e_H = \( H' \)^(*) - upright(bold(H)) \, wide e_D = \( D' \)^(*) - upright(bold(D)) \, wide e_J = e_H + e_D . $
  B-nef negativity and MMP negativity give
  #[#set math.equation(numbering: n => "(2.15)")
   $ e_H \, e_D gt.eq 0 \, wide m e_J lt.eq \( Q' \)^(*) - Q^(*) \, wide \( Q' \)^(*) lt.eq
     2 \( cal(S)' \)^(*) . $ <eq:B-rounded-errors>]
  The total logarithmic divisor for $A$ has trace-pull error $\( k_i + 1 \) e_H - 2 e_D$, by (2.7).
    Its effective trace boundary dominates $\( 1 - delta \) cal(S)'$.
    Comparing generalized and ordinary discrepancies on the output therefore gives
  #[#set math.equation(numbering: n => "(2.16)")
   $ A'_(upright("ord")) & gt.eq A + \( 1 - delta \) \( cal(S)' \)^(*) - \( k_i + 1 \) e_H\
 & gt.eq A + (1 - delta - frac(2 \( k_i + 1 \), m)) \( cal(S)' \)^(*) gt.eq A + 1 /
   2 \( cal(S)' \)^(*) . $ <eq:B-ordinary-gap>]
  The comparison also discards only a nonnegative trace-pull error of the nef part.
  This gives a gap at contracted primes as well as surviving ones.
    Indeed, every primitive $T$ with $A \( T \) < delta$ was put on the extraction, and hence $Q^(*) \( T \) =
    q_T gt.eq 1$, even if the subsequent MMP contracts $T$. Equation (2.15) implies
  #[#set math.equation(numbering: n => "(2.17)")
   $ \( Q' \)^(*) \( T \) gt.eq Q^(*) \( T \) gt.eq 1 \, wide \( cal(S)' \)^(*) \( T \) gt.eq 1 /
     2 . $ <eq:B-contracted-prime-bound>]
  Such a prime has $A'_(upright("ord")) \( T \) gt.eq 1 \/ 4$ by (2.16);
    all other primitive primes have $A'_(upright("ord")) \( T \) gt.eq A \( T \) gt.eq delta$.
    Thus the output is ordinarily $min { delta \, 1 \/ 4 }$-lc.
  Fano type makes $- K'$ pseudo-effective, so $N' - K'$ is pseudo-effective.
    Integral-Weil effective birationality #cite(label("BirkarPolarised")) Theorem 1.1 supplies a nonzero section
    of a bounded multiple of $N'$. MMP negativity pulls it back to the same multiple of $N$,
    and then to a bounded multiple of $m upright(bold(J))$. The fibre torus acts on the latter section space,
    so it contains a weight vector $g z^j$. A section of $ell J$ satisfies
  #[#set math.equation(numbering: n => "(2.18)")
   $ 0 lt.eq j lt.eq ell \, wide "div" \( g \) + \( j + ell \) H gt.eq 0 . $ <eq:B-angular-section>]
  Indeed the coefficients of its divisor along $E_0 \, D$ are $j \, ell - j$, respectively, by (2.5).
    Thus it gives a section of $floor.l \( j + ell \) H floor.r$ in positive degree at most $2 ell =
    O \( m_i \) lt.double N_i$, contrary to (2.12). This proves (2.14).
  Run the MMP of $J - tau cal(S)$ to its semiample nonbig model and let its Iitaka fibration be $Y' arrow.r
    Z_tau$. The threshold is rational because the extraction is of Fano type. Negativity now gives
  #[#set math.equation(numbering: n => "(2.19)")
   $ 0 lt.eq e_J lt.eq tau #scale(x: 120%, y: 120%)[\(] \( cal(S)' \)^(*) -
     cal(S)^(*) #scale(x: 120%, y: 120%)[\)] . $ <eq:B-threshold-errors>]
  Choose a small fixed $c$ with $0 < c < 1 - delta$. On this output use the boundary $B'_Y -
    c cal(S)'$ and nef b-divisor
  #[#set math.equation(numbering: n => "(2.20)")
   $ upright(bold(M))^(\#) = upright(bold(M)) \( k_i \) + (2 + c / tau) upright(bold(D)) +
     (c / tau - k_i - 1) upright(bold(H)) . $ <eq:B-threshold-nef-part>]
  This boundary is effective. Both displayed coefficients in the nef part are eventually nonnegative by (2.14);
    in particular the nefness is absolute, and uses no Cartier-index bound.
    Its total logarithmic divisor is $bb(Q)$-linearly equivalent to $\( c \/ tau \) \( J' - tau cal(S)' \)$.
    The discrepancies are
  #[#set math.equation(numbering: n => "(2.21)")
   $ A^(\#) = A + c (\( cal(S)' \)^(*) - e_J / tau) gt.eq A + c cal(S)^(*) . $ <eq:B-modified-gap>]
  Every primitive prime with $A < delta$ has $cal(S)^(*) \( T \) = 1$, including a prime contracted along the MMP.
    The remaining primes have $A gt.eq delta$. Thus $A^(\#)$ has a uniform generalized gap $min { c \, delta }$.
  On a geometric generic fibre $F$ of $Y' arrow.r Z_tau$ these are effective generalized Calabi–Yau data.
    Restriction can be computed using horizontal divisors on all higher models over the generic field,
    and then separable extension of constants; it is crepant and preserves the displayed gap.
    The fibre is of Fano type and rationally connected. Apply #cite(label("BirkarCY")) Theorem 1.7 to $A^(\#)$ on
    $F$ and take a bounded normal model isomorphic to it in codimension one.
    Normalization of the bounded models is still bounded after stratification and spreading,
    and does not add divisors to a codimension-one isomorphism.
  The effective boundary $B'_Y - c cal(S)'$ has coefficients at least $1 - delta - c$ on $cal(S)'$.
    Intersecting its Calabi–Yau equality with a fixed bounded polarization bounds its degree:
    the trace of the nef b-part is pseudo-effective, and the canonical degree is bounded in the bounded family.
    Consequently
  #[#set math.equation(numbering: n => "(2.22)")
   $ deg cal(S)' = O \( 1 \) \, wide deg J' = O \( tau \) \, wide deg upright(bold(H))_F \, med
     deg upright(bold(D))_F = O \( tau \) . $ <eq:B-small-degrees>]
  Here $J' tilde.op_(bb(Q)) tau cal(S)'$ on the fibre, and the last two degrees are nonnegative and sum to that of $J'$.
  We now use the assumed bigness of $P_U$. It gives an effective rational divisor $Sigma tilde.op_(bb(Q))
    H$ such that for every $v$ listed in $cal(S)$, with restriction $w$, one has
  #[#set math.equation(numbering: n => "(2.23)")
   $ w \( Sigma \) > v \( D \) - v \( E_0 \) . $ <eq:B-strict-improvement>]
  For completeness, if $v \( D \) > 0$, write $w = e "ord"_T$.
    The discrepancy formula gives $e a \( k_i \, T \) < delta$ and $v \( D \) < delta$.
    Since $e \| f_T \| lt.eq C e a \( k_i \, T \)$ and $delta$ is sufficiently small,
    the congruence has no wrap and $v \( D \) = e f_T$. Thus $f_T > 0$, and this prime was corrected in $P_U$.
    An effective representative of the big class $P_U$ may be chosen to vanish strictly at these primes and at any
    of the remaining finitely many projected centres. Every listed valuation has nontrivial angular restriction,
    since trivial restriction would give $A = 1$; its centre on $U$ is therefore proper.
    Reserve a tiny ample summand and choose a sufficiently divisible member through all these centres.
    Adding back $C_U$ gives (2.23). Pushing down yields an effective representative of $H$ on $V$;
    the representative on $U$ is its pullback, since it differs from $H_U$ by a rational principal divisor.
  Every homogeneous normalized threshold section has divisor
  #[#set math.equation(numbering: n => "(2.24)")
   $ \( 1 - b \) D + b E_0 + p^(*) Xi \, wide 0 lt.eq b lt.eq 1 \, wide
     Xi tilde.op_(bb(Q)) \( 1 + b \) H . $ <eq:B-threshold-section>]
  If $b < 1$, replace $b$ by $b + alpha$ and $Xi$ by $Xi + alpha
    Sigma$ for a sufficiently small positive rational $alpha$.
    The divisor remains effective, while every $tau cal(S)$ constraint improves strictly by (2.23).
    The finite list of strict improvements would increase the pseudo-effective threshold, a contradiction.
    Hence $b = 1$ for every such section. All these systems are torus invariant,
    because the listed valuations and the original $J$ are torus invariant.
    Equal-degree ratios therefore lie in $k \( V \)$, by their weight decompositions and $b = 1$.
    The valuation $v_0 = "ord"_(E_0)$ is trivial on this field, so it is horizontal over the Iitaka base $Z_tau$.
  We obtain a contradiction on the geometric generic fibre.
    Tailor a bounded ordinary lc complement preserving $v_0$ as an lc place,
    using the effective zero-parameter generalized Calabi–Yau data with the two sections and the Fano type funding
    of Lemma 4. This may first be done on a small $bb(Q)$-factorialization of the fibre,
    using the horizontal lift of $v_0$, and then transferred to the bounded model.
    Work on its homogeneous horizontal chart. Proposition 5 bounds the Lipschitz constant of $A^(\#)$.
    The difference $A^(\#) - A$ is the order of
  $ c / tau (upright(bold(J)) - \( J' - tau cal(S)' \)^(*)) . $
  The parenthesized b-divisor has effective trace $tau cal(S)'$ of degree $O \( tau \)$ on this fibre and is b-nef
    up to a rational principal divisor. The shrinking-degree estimate of Corollary 8 therefore gives an
    $O \( 1 \)$ Lipschitz bound for the difference, and hence for $A$.
  The same estimate gives an $O \( tau \)$ Lipschitz bound for $h_0 \( v \) = v \( E_0 \)$.
    Indeed $E_0$ has effective trace and is b-linearly equivalent to $upright(bold(D)) - upright(bold(H))$,
    whose two nef terms have degree $O \( tau \)$ by (2.22). In applying the estimate one replaces these nef terms
    by effective representatives with arbitrarily small error, avoiding the two centres in question.
    The function-degree argument on the bounded chart then applies:
    a rational function with pole degree strictly below $1$ is constant.
    This is why the Lipschitz bound tends to zero, rather than merely remaining bounded.
  Let $w_0$ be a chart vector representing $v_0$. We have $h_0 \( w_0 \) = A \( w_0 \) > 0$.
    The shrinking Lipschitz bound implies $\| w_0 \/ A \( w_0 \) \| arrow.r oo$.
    The horizontal approximation in Lemma 9, applied to this ray,
    gives integral divisorial vectors $n$ and numbers $s arrow.r 0^(+)$ such that
  $ A \( n \) = O \( s \) arrow.r 0 \, wide h_0 \( n \) gt.eq s \/ 2 . $
  On the other hand, any such small-discrepancy valuation with $h_0 > 0$ has $v \( D \) = 0$.
    Formula (2.6) and the lower signed phase bound at $a \( k_i \)$, including (2.4), imply $h_0 = o \( A \)$;
    trivial restriction would instead make $h_0$ a positive integer and is impossible.
    This contradicts the two displayed estimates. We have proved that $P_U$ is not big.
  #emph[Running the correction MMP.]
  Diagonalize the preceding conclusion to choose $eta_i arrow.r
    0^(+)$ sufficiently slowly so that $P_U$ is still not big. Run its MMP.
    All parameters used from now on may grow more slowly, remain below $k_i$, and be $o \( 1 \/ eta_i \)$.
    On the output put $cal(T)'$ equal to the reduced sum of surviving correction primes.
    With $upright(bold(H))$ now denoting the original angular b-pullback, MMP negativity and b-nefness give
  #[#set math.equation(numbering: n => "(2.25)")
   $ 0 lt.eq C_U^(*) lt.eq E := upright(bold(H)) - \( P' \)^(*) lt.eq \( C' \)^(*) \, wide C' lt.eq
     O \( eta_i \) cal(T)' . $ <eq:B-correction-errors>]
  More explicitly, if $e_H = \( H' \)^(*) - upright(bold(H)) gt.eq 0$, then $E = \( C' \)^(*) - e_H$,
    and $P$-negativity gives $\( C' \)^(*) - C_U^(*) gt.eq e_H$.
  #emph[Excluding a Mori fibre output.] Suppose first that $P_U$ is not pseudo-effective.
    On the geometric generic fibre $F$ of the final anti-$P'$ Mori contraction, put $G = - P'$, which is ample.
    Choose a new slow parameter $s_i arrow.r oo$, with $s_i eta_i arrow.r 0$,
    and obtain the phase condition at $a \( s_i \)$ after a fixed scaling. Scale $H \, P_U \, C_U$ together.
    The correction coefficients remain $O \( eta_i \)$, and $P_U$ is integral at correction primes:
    subtracting their phases was precisely what made those coefficients integral.
    Thus $R \( G \)$ is supported away from $cal(T)'$, and the pushed boundary satisfies
  $ B \( s_i \)' gt.eq R \( G \) + \( 1 - o \( 1 \) \) cal(T)' . $
  Comparing with ordinary discrepancies on $F$, the only adverse total-divisor error is $s_i e_H$,
    which is at most $s_i \( C' \)^(*)$. B-nef negativity for the moduli part and (2.25) therefore give
  #[#set math.equation(numbering: n => "(2.26)")
   $ A_(F \, R \( G \)) gt.eq a \( s_i \) + 1 / 2 \( cal(T)' \)^(*) . $ <eq:B-negative-discrepancy>]
  In particular $\( F \, R \( G \) \)$ is klt. A uniform ordinary gap is not asserted or needed in this case.
  The relative Picard number of the Mori contraction is one.
    The classes used here, including $R \( G \)$, are restrictions from this model.
    Horizontal prime coefficients restrict unchanged over the generic field and split with unchanged
    multiplicities after a separable constant extension, so the same class comparisons hold on the geometric
    generic fibre. There we have
  $ G + H' = C' lt.eq O \( eta_i \) cal(T)' \, $
  where $H'$ is pseudo-effective. The zero-parameter generalized Calabi–Yau equality also shows that
    $- \( K_F + R \( G \) \)$ dominates a fixed positive multiple of $cal(T)'$ in this one-dimensional space of
    restricted classes: its boundary contributes $\( 1 - o \( 1 \) \) cal(T)'$,
    and the moduli trace is pseudo-effective. Consequently
  #[#set math.equation(numbering: n => "(2.27)")
   $ - \( K_F + R \( G \) \) tilde.op_(bb(Q)) I_i G \, wide I_i arrow.r oo . $ <eq:B-large-index>]
  Initially this is a numerical proportionality, with $I_i gt.double 1 \/ eta_i$.
    It is rational linear proportionality after clearing denominators because $F$ is rationally connected:
    pull numerically trivial Cartier multiples to a smooth rationally connected resolution,
    where they are torsion, and descend the resulting rational equivalence.
  Consider the compactified cone for $\( F \, G \)$ and a primitive divisorial valuation with ordinary discrepancy
    $A arrow.r 0$ and infinity height $u > 0$. Its angular restriction $w$ has $A_(F \, R \( G \)) \( w \) lt.eq
    A$ and $u lt.eq A$ by (2.9). Moreover (2.25) and (2.26) imply
  #[#set math.equation(numbering: n => "(2.28)")
   $ 0 lt.eq E \( w \) lt.eq O \( eta_i \) A_(F \, R \( G \)) \( w \) lt.eq
     O \( eta_i \) A . $ <eq:B-negative-error-small>]
  Divisorial tests on the geometric fibre lift to homogeneous horizontal tests on the original model.
    Thus the signed phase bound for $H$ applies, and
  $ u equiv w \( G \) equiv - w \( H \) + E \( w \) med \( mod med bb(Z) \) . $
  All three quantities have small signed representatives. There is no wrap,
    so the lower phase bound and (2.28) give $u = o \( A \)$.
    If $w = 0$, the congruence makes $u$ a positive integer, already impossible.
    Valuations with $u = 0$ satisfy the same conclusion trivially. This contradicts Lemma 14 and (2.27).
  #emph[Descent from the semiample output.] We are left with a semiample nonbig $P'$ and its contraction $g :
    U' arrow.r W$. For a newly trimmed parameter range tending to infinity, with $t eta_i arrow.r
    0$ uniformly on that range, use boundary and nef part
  #[#set math.equation(numbering: n => "(2.29)")
   $ tilde(B) \( t \) = B \( t \/ 2 \)' - t C' \, wide tilde(upright(bold(M))) \( t \) =
     upright(bold(M)) \( t \/ 2 \) + \( t \/ 2 \) upright(bold(H)) . $ <eq:B-new-family>]
  Their total logarithmic divisor is $t P'$ up to rational linear equivalence, and their discrepancies are exactly
  #[#set math.equation(numbering: n => "(2.30)")
   $ tilde(a) \( t \) = a \( t \/ 2 \) + t E . $ <eq:B-new-discrepancy>]
  To see the equality, first pushing the old total divisor contributes $- \( t \/ 2 \) e_H$;
    adding the nef term and subtracting $t C'$ contributes another $- \( t \/ 2 \) e_H + t \( C' \)^(*)$.
    Their sum is $t E$.
  The new boundary dominates $R \( P' \)$. At correction primes $P'$ is integral,
    the old boundary has coefficient $1 - o \( 1 \)$, and the amount subtracted is $O \( t eta_i \) = o \( 1 \)$.
    Away from them the old denominator condition is unchanged.
    The nef part is b-nef; (2.30) and $E gt.eq 0$ show that the discrepancies are increasing and klt,
    with effective Calabi–Yau data at zero.
  This family has the required signed phase condition for $P'$.
    Indeed, at a new growing parameter, apply the original condition to $a \( t \/ 2 \)$ and scale all the
    relevant divisors by the resulting fixed integer. If $tilde(a) \( t \, T \) arrow.r 0$, then
  $ a \( t \/ 2 \, T \) lt.eq tilde(a) \( t \, T \) \, wide E \( T \) lt.eq tilde(a) \( t \, T \) \/ t =
    o \( tilde(a) \( t \, T \) \) . $
  Since $P' \( T \) = H \( T \) - E \( T \)$, subtracting this negligible nonnegative order preserves the lower $-
    o \( tilde(a) \)$ bound and the upper $O \( tilde(a) \)$ bound for the phase.
  On the geometric generic fibre of $g$, the divisor $P'$ is $bb(Q)$-linearly trivial.
    Its integral principalization order is bounded by Lemma 15:
    along any putative unbounded-order subsequence choose one growing parameter with the just-proved phase bound,
    use the restricted effective generalized klt Calabi–Yau data,
    and clear the remaining bounded small denominators as in that lemma.
    These operations use only fixed multipliers. A small $bb(Q)$-factorialization of the geometric fibre preserves
    all the divisor orders and permits the cyclic-cover construction.
  The principalization descends from the geometric generic fibre to its field of definition.
    Indeed being Cartier descends faithfully flatly, and the geometrically trivial line bundle is trivial by
    Hilbert 90; equivalently its one-dimensional space of trivializing rational functions descends.
    Thus for a bounded positive integer $q$ and some $phi.alt in k \( U' \)^(*)$, the divisor $q P' -
    "div" \( phi.alt \)$ has no horizontal terms. There is then an exact equality
  #[#set math.equation(numbering: n => "(2.31)")
   $ q P' - "div" \( phi.alt \) = g^(*) H_W $ <eq:B-exact-descent>]
  for an ample $bb(Q)$-Cartier rational divisor $H_W$. To justify exactness,
    semiampleness already gives $P' tilde.op_(bb(Q)) g^(*) A_W$ with $A_W$ ample.
    After clearing denominators the difference between the left side of (2.31) and $q g^(*)
    A_W$ is principal and vertical. A rational function with vertical divisor restricts to a nowhere vanishing
    regular function on the projective generic fibre, hence belongs to $k \( W \)^(*)$ because $g$ is a
    contraction. Absorb this rational principal divisor into $q A_W$ to obtain $H_W$.
  If $W$ is a point, (2.31) and $E gt.eq 0$ already give a section of a bounded multiple of $H$.
    Otherwise $W$ has strictly smaller dimension than $V$. It is of Fano type.
    Apply the generalized canonical bundle formula to (2.29), and replace the old parameter $s$ by $s = q t$.
    The induced data on $W$ are effective generalized data with total $t H_W$,
    klt at zero and with nondecreasing discrepancies. Their nef parts are b-nef and $bb(Q)$-Cartier.
  We check the denominator condition on $W$ explicitly. For a prime $P$ on $W$,
    choose a nonexceptional vertical component $T$ above it with multiplicity $e$.
    Let $r$ be the denominator of $"coeff"_T \( P' \)$ and let $r'$ be that of
    $"coeff"_T \( q P' - "div" \( phi.alt \) \)$. Then $r' divides r$.
    The denominator $r_P$ of $H_W$ divides $e r'$, by (2.31).
    Since the upstairs boundary dominates $R \( P' \)$, the discriminant discrepancy at $P$ satisfies
  $ b_t \( P \) lt.eq frac(1, e r) lt.eq frac(1, e r') lt.eq 1 / r_P . $
  Thus the discriminant boundary dominates $R \( H_W \)$.
  For each growing parameter, the pure pullback phase condition descends by Lemma 2,
    after its allowed fixed multiple. Every hypothesis of Lemma 11 is now satisfied in smaller dimension.
    Induction gives bounded-degree sections of $H_W$. They pull back through (2.31) to bounded-degree sections of
    $P'$, and the b-divisor inequality $upright(bold(H)) gt.eq \( P' \)^(*)$ in (2.25) carries them to sections of
    the same bounded multiples of $H$ on $V$. This contradicts (2.12) and completes the induction.
  The contradiction excludes every sequence of failures with $N_i arrow.r oo$,
    and hence proves boundedness for the original sequence. Any finite initial segment omitted in an eventual
    assertion can also be included: each of its big divisors has a section in some positive degree.
    Taking a common multiple of the bounded degrees gives the common degree in the statement. ◻
]

== 3 Cutoff fields, phase bounds, and section counts <sec:C>

We continue to work with sequences of bounded dimension, and with the subsequence convention of Section 1.
  In particular, a statement about all valuations with an order tending to zero is required on every subsequence.
  All constants below may depend on the dimension bound and on the fixed constants explicitly present in the
  hypotheses. They do not depend on an individual member of a sequence.
  Unless explicitly stated otherwise, quantified divisorial tests are primitive prime orders.
  Homogeneous estimates extend to integral multiples; arbitrary positive rescaling is used only for homogeneous
  inequalities or exact zero conditions.

=== 3.1 Polarized discrepancy data and cutoff fields <subsec:C-cutoffs>

Let $V$ be a projective variety of Fano type. Let $a$ be the discrepancy function of an effective generalized
  rational lc Calabi–Yau pair over the point, and suppose that

$ a \( T \) in bb(Z) wide \( T upright(" a primitive prime order") \) . $

Let $D$ be an effective nef and big rational $bb(Q)$-Cartier divisor on $V$.
  Its Cartier b-pullback is denoted by $upright(bold(D))$. Assume that $b = a +
  upright(bold(D))$ is klt and has effective trace on $V$, or equivalently $b \( Q \) lt.eq
  1$ for primes $Q$ on $V$. This generalized pair is obtained by adding $upright(bold(D))$ to the nef part and
  subtracting its trace from the boundary; its total log canonical class is unchanged.
  We call a prime order $T$ with $a \( T \) = 0$ a #emph[floor prime].
  Thus on $V$ every positive coefficient of $D$ lies on the floor, and every nonfloor prime has $a \( Q \) =
  1$ and $D \( Q \) = 0$.

For a rational divisor $A$ on a normal projective model, put

#[#set math.equation(numbering: n => "(3.1)")
 $ S \( A \) = { 0 } union { f in k \( V \)^(*) : "div" \( f \) + A gt.eq 0 } . $ <eq:C-function-space>]

Tests on this space always mean tests on its nonzero elements.
  If $A gt.eq 0$, it contains $1$, so the field it generates is unambiguous.
  We take the varying main scale $L gt.eq 1$ to be rational.
  Rational upper approximations within a fixed factor give the same statements for real scales,
  after changing constants. A $bb(Q)$-principal order is the order function of a rational principal divisor.
  Unless a new trace model is specified, orders of rational divisors on $V$ mean their b-pullbacks.

We shall also use geometric generic fibres. Divisors on such a fibre spread over a finite extension of the generic
  field, and their closures on resolutions give horizontal divisors on the total space.
  Conversely, horizontal divisors restrict divisorially. Finite extensions of the field of constants in
  characteristic zero are separable and are etale on these generic-field models,
  so actual prime orders restrict to primitive horizontal orders;
  integral multiples restrict to integral multiples. Canonical divisors from the base have horizontal order zero,
  and discrepancies and Cartier b-orders therefore agree by homogeneity. Nef b-parts restrict on a determination.
  Relative numerical proportionality for a Picard-number-one Mori contraction remains true on a geometric generic
  fibre: spread any test curve over a finite extension and specialize. These fibres are of Fano type.
  Consequently rational numerical equivalence on them implies rational linear equivalence,
  by rational connectedness and the Fano type basepoint-free consequences recalled in Section 1.

Apply the extraction construction of Subsection 1.3, funded by $a + upright(bold(D)) \/ 2$,
  to obtain a projective $bb(Q)$-factorial Fano type model $U arrow.r
  V$ containing every primitive prime with $a = 0$ and $upright(bold(D)) lt.eq 1$, and extracting no other prime.
  The list is finite: each selected prime has discrepancy at most $1 \/ 2$ for the fixed generalized klt pair $a +
  upright(bold(D)) \/ 2$. On $U$, precisely the floor primes form $"Supp" D_U$,
  and their coefficients lie in $\( 0 \, 1 \]$. For rational $0 < beta lt.eq 1$, set

#[#set math.equation(numbering: n => "(3.2)")
 $ I_beta = { Q : a \( Q \) = 0 \, med D \( Q \) lt.eq beta } \, wide P_beta = D_U -
   sum_(Q in I_beta) D \( Q \) Q . $ <eq:C-cutoff>]

All the primes in this sum occur on $U$. Run a negative $P_beta$-MMP and let

$ p : U' arrow.r W_beta $

be the contraction defined by the semiample output $P'_beta$.
  The semiample divisor is the pullback of an ample rational divisor, allowing a point as the base.
  In fact there is an effective ample rational divisor $D_W$ such that

#[#set math.equation(numbering: n => "(3.3)")
 $ P'_beta = p^(*) D_W \, wide D' = p^(*) D_W + sum_(Q in I_beta) D \( Q \) Q' . $ <eq:C-cutoff-pullback>]

To check the first equality as divisors, rather than just as classes,
  $P'_beta$ is effective and has no horizontal component. A rational principal difference between it and a
  pullback has divisor zero on the projective generic fibre, hence is a function from the base.
  Absorb that function into the divisor downstairs. Here the connected-fibre property makes $k \( W_beta \)$
  relatively algebraically closed in $k \( V \)$. Writing $upright(bold(P))$ for the nef Cartier b-divisor defined
  by $P'_beta$, MMP negativity gives

#[#set math.equation(numbering: n => "(3.4)")
 $ 0 lt.eq upright(bold(P)) lt.eq P_beta^(*) lt.eq upright(bold(D)) . $ <eq:C-cutoff-errors>]

Every prime in $I_beta$ survives the MMP. Its coefficient in $P_beta^(*)$ is zero,
  so the effective error $P_beta^(*) - upright(bold(P))$ has value zero there;
  a prime contracted by a negative MMP would instead have strictly positive error.

Define

$ K_beta = k \( W_beta \) subset k \( V \) . $

The field is generated by the spaces $S \( m P_beta \)$, $m in bb(N)$, and is relatively algebraically closed.
  These fields decrease with $beta$. A strict inclusion of two nested relatively algebraically closed subfields
  decreases transcendence degree: if their transcendence degrees were equal,
  the larger would be algebraic over the smaller. Thus there are at most $dim V$ strict changes.
  We have $K_1 = k$, and $K_(0^(+)) = k \( V \)$, since below the least coefficient in the finite support of $D_U$
  the divisor $P_beta$ equals the big divisor $D_U$.

The following maximal-order condition, called (C-$alpha$), will recur:

#[#set math.equation(numbering: n => "(3.5)")
 $ T \( Gamma \) lt.eq \( 1 + eta \) D \( T \) quad upright("for every effective ") Gamma tilde.op_(bb(Q)) D \,
   wide a \( T \) = 0 . $ <eq:C-alpha>]

The quantifier over $Gamma$ is part of the condition. When imposed on a set of valuations in a sequence,
  the same $eta = eta_i$ works for that entire set.

#thm([Lemma 3.1.])[
  (Uniform cutoff models and order functions).  #emph[Suppose $dim W_beta > 0$.
    After passage to a subsequence there is a fixed $delta > 0$ and a projective $bb(Q)$-factorial Fano type
    extraction $hat(W) arrow.r W_beta$ such that $hat(W)$ has ordinary $delta$-lc singularities and every positive
    coefficient of the pullback of $D_W \/ beta$ is at least $delta$.
    A bounded constant $C$ can be chosen so that $S \( C D_W \/ beta \)$ generates $k \( W_beta \)$.]
  #emph[There are algebraically independent functions $phi.alt_1 \, dots.h \,
    phi.alt_(dim W_beta)$ in this space and a b-nef $bb(Q)$-Cartier order function $H$ on $k \( W_beta \)$,
    pulled back to $k \( V \)$, with uniformly bounded denominator of its values on primitive orders, such that:]
  + #emph[If $a \( T \) = 0$, then $H \( T \) lt.eq C D \( T \) \/ beta$.
    If $T$ is nontrivial on $K_beta$ and all $T \( phi.alt_j \) gt.eq 0$, then $H \( T \) lt.eq - 1$.]
  + #emph[If $D \( Q \) = 0$ and $a \( Q \) lt.eq 1$, then $H \( Q \) lt.eq 0$.]
  + #emph[If $a \( T \) = 0$ and (3.5) holds at $T$, then $H \( T \) gt.eq - C eta D \( T \) \/ beta$.]
  #emph[In particular, if (3.5) holds on all of $I_beta$ with $eta_i arrow.r 0$,
    those primes are eventually horizontal over $K_beta$; that is, their restrictions to $K_beta$ are trivial.]
] <lem:C-cutoff-claims>

#proof[
  On $U' arrow.r W_beta$ consider
  #[#set math.equation(numbering: n => "(3.6)")
   $ d = frac(upright(bold(D)) - upright(bold(P)), beta) + upright(bold(P)) . $ <eq:C-cutoff-direction>]
  It is nonnegative and strictly positive on $a = 0$. The discrepancies $a +
    t d$ have effective traces for $0 lt.eq t lt.eq 1$: at a surviving prime in $I_beta$ their trace increment is
    $t D \( Q \) \/ beta lt.eq 1$, and at an unremoved floor prime it is $t D \( Q \) lt.eq 1$.
    Realize the family by a nef increment $t upright(bold(D)) \/ beta$ and total log canonical divisor equal,
    up to a rational principal divisor, to the pullback of $t \( 1 \/ beta - 1 \) D_W$.
    Lemma 3 gives, on a fixed smaller interval, discriminants
  $ a' + t d' $
  with $a'$ an effective generalized lc Calabi–Yau discrepancy over the point and with uniformly bounded
    denominator. These are klt for positive $t$.
  We first make explicit a lifting consequence needed here.
    If $a' \( E_i \) = 0$, $d' \( E_i \) arrow.r 0$, and $k_i > 0$ tends to zero, then, after a subsequence,
    there are primitive lifts $T_i$ with
  #[#set math.equation(numbering: n => "(3.7)")
   $ T_i \|_(k \( W \)) = e_i "ord"_(E_i) \, wide a \( T_i \) = 0 \, wide d \( T_i \) arrow.r 0 \, wide
     e_i k_i arrow.r 0 . $ <eq:C-small-lifts>]
  At one Mori step, choose a minimizer of $d$ on the $a$-minimum by computing the discriminant at a sufficiently
    small positive parameter. Its tailored vertical chart from Proposition 5 has normalized values $0 \,
    rho d'$ on the slice $e_(*) = 1$. Lemma 9, with a fixed small error $gamma$,
    gives an integral point with $e_(*) = l j$ bounded in terms of $gamma$,
    by rounding $l j U$ in the kernel lattice. The error in $a$ is less than the gap of its value lattice;
    nonnegativity and quantization therefore give $a = 0$ exactly. The slope bound in the same chart gives
  $ d lt.eq e_(*) rho d' + C gamma . $
  First fix $gamma$ and go sufficiently far in the sequence,
    then let $gamma arrow.b 0$ diagonally slowly enough that also $e_(*) k_i arrow.r 0$.
    Primitivizing the resulting order only decreases the orders and the restriction multiplicity.
    Iterate through the bounded chain of Mori steps, at each step including the already accumulated multiplicity
    times $k_i$ among the quantities required to be negligible.
    Birational steps preserve the discrepancy functions. This proves (3.7) without asserting a uniform bound for $e_i$.
  There cannot be a sequence of primes $E$ with, for one fixed sufficiently small $t > 0$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ \( a' + t d' \) \( E \) arrow.r 0 \, wide 0 < D_W \( E \) \/ beta arrow.r 0 . $ <eq:C-excluded-small-coefficients>]
  The bounded denominator gives $a' \( E \) = 0$ eventually. Apply (3.7) with $k_i = D_W \( E \) \/ beta$. It gives
  $ a \( T \) = 0 \, wide frac(D \( T \), beta) lt.eq d \( T \) + frac(e D_W \( E \), beta) arrow.r 0 . $
  Thus $T in I_beta$, where $upright(bold(P)) \( T \) = 0$, whereas $upright(bold(P)) \( T \) =
    e D_W \( E \) > 0$, a contradiction. Nor can an original prime $E$ of $W$ have $0 < D_W \( E \) \/ beta
    arrow.r 0$. A prime $Q$ above it on $U'$ satisfies
  $ D \( Q \) = upright(bold(P)) \( Q \) = e D_W \( E \) > 0 \, quad a \( Q \) = 0 \, quad a' \( E \) = 0 \, quad
    d' \( E \) lt.eq D_W \( E \) . $
  It would again give (3.8).
  Choose fixed rational $0 < t lt.eq 1 \/ 4$ in the chamber.
    Extract every exceptional prime of $A = a' + t d'$ below a sufficiently small fixed $delta_(*) < 1 \/ 4$.
    This finite extraction is funded by mixing $a'$ slightly with an ordinary klt Calabi–Yau pair,
    as in Subsection 1.3; the extracted primes have $a' = 0$ and positive boundary coefficient.
    The preceding exclusions imply a uniform positive lower bound on all nonzero coefficients of
  $ E_0 = \( D_W \/ beta \) \|_(hat(W)) . $
  Here and below the notation means the rational pullback. The ordinary discrepancies on the extraction dominate
    those of $A$, by b-nef negativity and $bb(Q)$-factoriality.
    Every remaining exceptional primitive prime has $A gt.eq delta_(*)$,
    and every extracted prime has ordinary discrepancy one. This proves a uniform ordinary gap on $hat(W)$.
  For completeness, we verify the additional ordinary gap needed to apply polarized birationality to an integral
    Weil divisor. Let $B_A$ be the trace boundary of $A$ on $hat(W)$.
    On every component of $E_0$ its coefficient is at least $1 \/ 2$.
    For an original component the covering-prime calculation above gives $a' = 0$ and $d' lt.eq
    D_W \( dot.op \) lt.eq 1$; extracted components have $A < delta_(*)$.
    Choose a fixed integer $m > 4 \/ delta$ and an integral divisor
  $ N = m E_0 - Q_0 \, $
  where the coefficients of $Q_0$ belong to $\[ 1 \, 2 \]$ on $"Supp" E_0$ and are zero elsewhere.
    Such rounding is possible coefficient by coefficient. Since $m E_0 -
    Q_0$ dominates a positive multiple of $E_0$, $N$ is big. Run an $N$-MMP to a nef and big integral Weil divisor
    $N^(+)$ on a $bb(Q)$-factorial model. With stars denoting pullbacks to a common determination,
    b-nef negativity and MMP negativity give
  #[#set math.equation(numbering: n => "(3.9)")
   $ 0 lt.eq e_E = \( E_0^(+) \)^(*) - E_0^(*) \, wide m e_E lt.eq \( Q_0^(+) \)^(*) -
     Q_0^(*) . $ <eq:C-rounded-errors>]
  The total generalized log canonical divisor of $A$ is $t \( 1 - beta \) E_0$ up to a rational principal divisor.
    Comparing its nef part before and after the MMP, ordinary discrepancies on the output are at least
  #[#set math.equation(numbering: n => "(3.10)")
   $ A + \( B_A^(+) \)^(*) - t \( 1 - beta \) e_E med gt.eq med A +
     (1 / 4 - t / m) \( Q_0^(+) \)^(*) . $ <eq:C-rounded-gap>]
  Indeed $B_A^(+) gt.eq Q_0^(+) \/ 4$ and $e_E lt.eq \( Q_0^(+) \)^(*) \/ m$ by (3.9).
    If a primitive prime with $A < delta_(*)$ is in $"Supp" E_0$, it has $\( Q_0^(+) \)^(*) gt.eq Q_0^(*) gt.eq
    1$. If it is not in this support, then it is already a prime on $hat(W)$ and cannot be contracted by the
    $N$-MMP: $N$ has coefficient zero there, the output pullback is effective,
    and a contraction would require strictly positive MMP error. Its ordinary discrepancy on the output is one.
    All other primitive orders have $A gt.eq delta_(*)$. Formula (3.10) therefore gives a uniform ordinary gap on
    the output. Also $N^(+) - K^(+)$ is pseudo-effective, since the output is of Fano type.
    Birkar’s integral-Weil polarized birationality theorem #cite(label("BirkarPolarised")) Theorem 1.1 now gives
    birational sections of a bounded multiple of $N^(+)$. Negativity identifies these with sections of that
    multiple of $N$, hence with functions in $S \( C D_W \/ beta \)$ for bounded $C$.
    This proves the field-generation assertion.
  Choose algebraically independent $phi.alt_j$ in this space. If $omega = and.big_j d phi.alt_j$, define on the base
  #[#set math.equation(numbering: n => "(3.11)")
   $ H \( E \) = a' \( E \) - nu_(log \, E) \( omega \) \, wide nu_(log \, E) \( omega \) = 1 +
     "ord"_E \( omega \) . $ <eq:C-logarithmic-order>]
  The Calabi–Yau identity shows that $H$ is the moduli b-divisor after a rational principal adjustment.
    It is thus b-nef and $bb(Q)$-Cartier, and its values have bounded denominator because $a'$ does and the log
    orders are integral. If $T \|_(k \( W \)) = e "ord"_E$ and $a \( T \) = 0$,
    the discriminant minimum gives $a' \( E \) = 0$. Pole bounds for the $phi.alt_j$ on every model give
  $ nu_(log \, E) \( omega \) gt.eq - C D_W \( E \) \/ beta . $
  If all $E \( phi.alt_j \) gt.eq 0$, the form is regular at that discrete valuation ring and its logarithmic
    order is at least one. These prove (i). For (ii), if restriction is nontrivial, then $D_W \( E \) =
    0$ by $upright(bold(P)) lt.eq upright(bold(D))$, so the functions are regular and
  $ H \( Q \) = e a' \( E \) - e nu_(log \, E) \( omega \) lt.eq a \( Q \) - e lt.eq 0 . $
  The trivial restriction gives $H \( Q \) = 0$ directly.
  On $W$ itself we also have $H_W lt.eq C D_W \/ beta$: use $a' lt.eq 1$, the lower coefficient bound,
    and the same log-order estimate. For any arbitrarily small positive rational $lambda$,
    choose on a determining model an effective
  $ Sigma tilde.op_(bb(Q)) H + lambda upright(bold(D))_W \/ beta \; $
  this is possible because the displayed class is nef and big. The rational principal order
  $ chi = upright(bold(Sigma)) - H - lambda upright(bold(D))_W \/ beta $
  has poles at most $C D_W \/ beta$ on $W$, and therefore at most $C upright(bold(D)) \/ beta$ upstairs.
    Condition (3.5), applied to $D + \( beta \/ C \) chi$, gives $chi \( T \) lt.eq C eta D \( T \) \/ beta$.
    Since $upright(bold(Sigma)) gt.eq 0$,
  $ H \( T \) gt.eq - C eta D \( T \) \/ beta - lambda upright(bold(P)) \( T \) \/ beta . $
  Let $lambda arrow.b 0$ to prove (iii). Finally, for $T in I_beta$, $upright(bold(P)) \( T \) = 0$,
    so each $phi.alt_j$ has nonnegative order there. If the restriction were nontrivial, (i) and (iii),
    together with $D \( T \) lt.eq beta$, would give $- 1 gt.eq H \( T \) gt.eq - C eta_i$,
    which is impossible eventually. ◻
]

=== 3.2 A phase estimate at a varying scale <a-phase-estimate-at-a-varying-scale>

The cutoff construction identifies the part of the function field visible at a prescribed pole cost.
  We next use it to control the denominators of rational principal orders at floor primes of very small
  polarization order. This is the phase estimate needed to regularize cone characters in Section 4.

#thm([Lemma 3.2.])[
  (Scaled phase bound).  #emph[Assume (3.5) with $eta_i arrow.r 0$ whenever $a \( T \) =
    0$ and $L D \( T \) arrow.r 0$, along arbitrary subsequences. Let $ell$ be a rational principal order.
    Suppose that for every nonfloor prime $Q$ on $V$ there is an integer $p_Q$ with
#[#set math.equation(numbering: n => "(3.12)")
 $ \| p_Q - ell \( Q \) \| lt.eq G \( Q \) \, wide G gt.eq 0 \, wide G tilde.op_(bb(Q)) c_g L D \,
   $ <eq:C-nonfloor-phase>]

 where $c_g gt.eq 0$ is rational and uniformly bounded. There is a fixed positive integer $q$ such that
#[#set math.equation(numbering: n => "(3.13)")
 $ "dist" \( q ell \( T \) \, bb(Z) \) = O \( L D \( T \) \) quad upright("if ") a \( T \) =
   0 upright(" and ") L D \( T \) arrow.r 0 . $ <eq:C-scaled-phase>]

]
] <lem:C-scaled-phase>

#proof[
  The hypothesis on nonfloor primes also holds on $U$, since every additional extracted prime is on the floor.
    If $c_g > 0$, condition (3.5) applies to $G \/ \( c_g L \)$.
    If $c_g = 0$, the effective rationally trivial divisor $G$ is zero.
    Consequently, at every floor order to which the smallness hypothesis applies,
  #[#set math.equation(numbering: n => "(3.14)")
   $ G \( T \) lt.eq c_g L \( 1 + eta_i \) D \( T \) . $ <eq:C-G-small>]
  Suppose the conclusion fails. Factorial diagonalization gives a subsequence and primitive targets $T$ with
  #[#set math.equation(numbering: n => "(3.15)")
   $ a \( T \) = 0 \, quad beta = D \( T \) \, quad L beta arrow.r 0 \, wide
     frac("dist" \( q ell \( T \) \, bb(Z) \), L beta) arrow.r oo quad
     upright("for each fixed ") q in bb(N)_(> 0) . $ <eq:C-phase-failure>]
  To justify the simultaneous last assertion, at stage $i$ choose a failure for the multiplier $i !$ with ratio
    tending sufficiently quickly to infinity. For $q divides i !$,
    $"dist" \( i ! x \, bb(Z) \) lt.eq \( i ! \/ q \) "dist" \( q x \, bb(Z) \)$;
    choosing the failure ratio larger than all these factors gives the claimed diagonal sequence.
    Among such sequences maximize the eventually constant $"trdeg" K_beta$.
    Lemma 16 says that $T$ is horizontal over this field. Let $tau$ be the first positive cutoff for which
    $K_tau = K_beta$. It exists because there are finitely many coefficient cutoffs and the field $K_(0^(+)) =
    k \( V \)$ cannot have a nonzero horizontal divisorial valuation. In particular,
  #[#set math.equation(numbering: n => "(3.16)")
   $ 0 < tau lt.eq beta \, wide L tau arrow.r 0 . $ <eq:C-first-change-scale>]
  After multiplying $ell$ and $G$ by one fixed integer, maximality implies a uniform bound
  #[#set math.equation(numbering: n => "(3.17)")
   $ "dist" \( ell \( Q \) \, bb(Z) \) lt.eq C L D \( Q \) quad \( a \( Q \) = 0 \, med D \( Q \) < tau \) .
     $ <eq:C-before-threshold>]
  Indeed, a failure of this assertion for every fixed multiple would, by the same factorial diagonalization,
    produce a sequence at a cutoff strictly before $tau$, hence at strictly larger transcendence degree.
  ===== 3.2.1 The first threshold. <the-first-threshold.>
  We first prove (3.17) with $D \( Q \) lt.eq tau$, after another fixed multiplication.
    If it fails, choose a primitive $S$ with $D \( S \) = tau$ such that every fixed multiple has phase mismatch
    much larger than $L tau$. The prime $S$ lies on $U$. Fix rational $0 < gamma < 1 \/ 4$ and put
  #[#set math.equation(numbering: n => "(3.18)")
   $ cal(S) = S + sum_(Q upright(" on ") U thin \, med a \( Q \) = 0\
Q eq.not S) gamma min { 1 \, D \( Q \) \/ tau } thin Q . $ <eq:C-threshold-divisor>]
  Let $t$ be the pseudo-effective threshold of $D_U - t cal(S)$. It is rational, since $U$ is of Fano type.
    The divisor $D_U - tau cal(S)$ is effective, while an effective representative of $D_U -
    t cal(S)$ would give an effective divisor rationally equivalent to $D$ whose order at $S$ is at least $t$.
    Rational pseudo-effectivity on a Fano type model is realized by such an effective representative.
    Hence (3.5) at $S$ gives
  #[#set math.equation(numbering: n => "(3.19)")
   $ tau lt.eq t lt.eq \( 1 + eta_i \) tau \, wide eta_i arrow.r 0 . $ <eq:C-threshold-location>]
  Run the threshold MMP and take the semiample nonbig fibration. On its generic fibre,
  #[#set math.equation(numbering: n => "(3.20)")
   $ D' tilde.op_(bb(Q)) t cal(S)' \, wide sum_(Q eq.not S) D \( Q \) Q' prec.tilde 2 eta_i tau S' .
     $ <eq:C-threshold-comparison>]
  Here $A prec.tilde B$ means that $B - A$ is rationally linearly equivalent to an effective rational divisor.
    To see the second inequality, the coefficient of every $Q' eq.not S'$ in $D' -
    t cal(S)'$ is at least $D \( Q \) \/ 2$ for large $i$, whereas the coefficient of $S'$ is at least $-
    eta_i tau$. Restriction of the rationally trivial threshold class proves the claim.
    Enlarge $eta_i$ rationally if necessary. The restriction of $D'$ is big,
    so $S'$ is horizontal and big on this generic fibre. For the threshold MMP and every subsequent MMP over its
    base, the pullback errors satisfy
  #[#set math.equation(numbering: n => "(3.21)")
   $ 0 lt.eq e_D = \( D'' \)^(*) - upright(bold(D)) lt.eq t #scale(x: 120%, y: 120%)[\(] \( cal(S)'' \)^(*) -
     cal(S)^(*) #scale(x: 120%, y: 120%)[\)] . $ <eq:C-threshold-error>]
  The first comparison uses that $upright(bold(D))$ is nef; the second is MMP negativity for $D - t cal(S)$,
    followed by its crepancy over the threshold base.
  We need a signed integral multiplier, allowed to grow slowly, for which
  #[#set math.equation(numbering: n => "(3.22)")
   $ m = m_i eq.not 0 \, quad sigma = { m ell \( S \) } arrow.r 0^(+) \, wide eta_i + \| m \| L tau =
     o \( sigma \) . $ <eq:C-phase-amplification>]
  Pass first to a limiting phase. If it is irrational, choose fixed signed powers whose limiting residues approach
    zero from above, and then let these powers vary sufficiently slowly.
    For a rational limit, first take a fixed multiple clearing that limit.
    Its signed residual $zeta_i arrow.r 0$ satisfies $\| zeta_i \| \/ \( L tau \) arrow.r
    oo$ by the assumed failure. Choose its sign positive and multiply it by an integer so that the resulting
    residual still tends to zero but dominates $eta_i$. This is possible with no wrap:
    choose a target residual $s_i arrow.r 0$ with $s_i gt.double eta_i + \| zeta_i \|$,
    and a multiplier of size $s_i \/ \| zeta_i \|$. Its product with $L tau$, divided by the new residual,
    is $O \( L tau \/ \| zeta_i \| \) arrow.r 0$. This proves (3.22).
  On the threshold model choose a rational correction $n$ so that $N = m ell' + n$ is an integral Weil divisor,
    as follows:
  #[#set math.equation(numbering: n => "(3.23)")
   $ n \( S' \) & = - sigma \,\
\| n \( Q' \) \| & lt.eq C \| m \| L D \( Q \) &  & \( Q eq.not S \, med a \( Q \) = 0 \, med D \( Q \) < tau \) \,\
0 lt.eq n \( Q' \) & < 1 &  & \( Q eq.not S \, med a \( Q \) = 0 \, med D \( Q \) gt.eq tau \) \,\
\| n \( Q' \) \| & lt.eq \| m \| G' \( Q' \) &  & \( a \( Q \) > 0 \) . $ <eq:C-rounded-phase-data>]
  Use nearest integers in the second line, upward rounding in the third, and $m p_Q$ in the last;
    outside the finite relevant support the correction is zero.
    Since $ell'$ is rational principal, (3.20) bounds the positive errors in class by
  $ C \| m \| L D' + \| m \| G' + tau^(- 1) sum_(Q eq.not S) D \( Q \) Q' prec.tilde O \( \| m \| L tau + eta_i \)
    S' . $
  Thus
  $ N prec.tilde - \( sigma - o \( sigma \) \) S' \, $
  and $N$ is not relatively pseudo-effective. Run its Mori fibre MMP over the threshold base.
    On the geometric generic fibre $F$ of the last Picard-number-one contraction,
  #[#set math.equation(numbering: n => "(3.24)")
   $ H_1 = - N'' upright(" is integral and ample") \, wide H_1 prec.tilde \( sigma + o \( sigma \) \) S'' .
     $ <eq:C-large-index-threshold>]
  The upper comparison uses the lower bounds in (3.23); all the generic class comparisons survive pushing and
    restricting. The variety $F$ is of Fano type, and $- K_F$ dominates $S'' \|_F$ numerically.
    In fact the pushed crepant boundary of $a$ is effective and contains $S''$ with coefficient one,
    while the moduli trace on $F$ is pseudo-effective. For this last assertion restrict its nef determination
    first, add arbitrarily small ample errors and a pullback of an ample divisor if needed,
    and push effective approximations to $F$. Letting the errors tend to zero proves pseudo-effectivity.
    Picard-number-one proportionality on the total contraction,
    followed by its geometric generic restriction and rational linear equivalence on $F$, therefore gives
  #[#set math.equation(numbering: n => "(3.25)")
   $ - K_F tilde.op_(bb(Q)) I_i H_1 \, wide I_i arrow.r + oo . $ <eq:C-unbounded-index>]
  We verify the small-discrepancy hypothesis that contradicts Lemma 14.
    Let $w$ be an integral divisorial angular evaluation on $F$, allowing a nonprimitive one,
    with ordinary discrepancy $A_F \( w \) arrow.r 0$. Generalized-to-ordinary comparison gives
  #[#set math.equation(numbering: n => "(3.26)")
   $ A_F \( w \) gt.eq a \( w \) + w \( \( cal(S)'' \)^(*) \) . $ <eq:C-small-angular>]
  Indeed the pushed boundary has coefficient one at every surviving floor prime, dominates $cal(S)''$,
    and b-nef negativity controls the moduli trace. Hence integrality gives $a \( w \) = 0$ eventually and,
    by (3.21), $w \( cal(S)^(*) \) lt.eq w \( \( cal(S)'' \)^(*) \) arrow.r 0$.
    The formula on $U$ gives $upright(bold(D)) lt.eq C cal(S)^(*)$, with fixed $C$ because $D \( Q \) lt.eq
    1$ and $tau lt.eq 1$. Thus the primitive restriction of $w$ is eventually one of the primes extracted on $U$.
    Since $w \( cal(S)^(*) \) arrow.r 0$, that prime is neither $S$ nor a floor prime of coefficient at least
    $tau$: their $cal(S)$-coefficients are respectively $1$ and $gamma$.
    The remaining coefficient is $gamma D \( Q \) \/ tau$, so
  #[#set math.equation(numbering: n => "(3.27)")
   $ D \( w \) lt.eq C tau A_F \( w \) . $ <eq:C-small-D-threshold>]
  The solved estimate (3.17), extended by integral homogeneity,
    and (3.22) imply that $m ell \( w \)$ has a residual $o \( A_F \( w \) \)$ modulo $bb(Z)$.
    Equations (3.14) and (3.21) also give
  #[#set math.equation(numbering: n => "(3.28)")
   $ \| m \| w \( \( G'' \)^(*) \) = \| m \| #scale(x: 120%, y: 120%)[\(] G \( w \) +
     c_g L e_D \( w \) #scale(x: 120%, y: 120%)[\)] = o \( A_F \( w \) \) . $ <eq:C-G-threshold-error>]
  The equality holds because $G - c_g L D$ is rational principal and its pullback is unchanged.
    In the estimate, $e_D \( w \) lt.eq t thin w \( \( cal(S)'' \)^(*) \) = O \( tau A_F \( w \) \)$.
  The signs of the rounding corrections now matter. Their negative part is at most
  $ sigma \( S'' \)^(*) + C \| m \| L \( D'' \)^(*) + \| m \| \( G'' \)^(*) \; $
  its value is $o \( A_F \( w \) \)$ by the preceding bounds.
    The positive unit-size errors are supported on floor components,
    whose reduced sum has order at most $A_F \( w \)$ by boundary comparison. Thus
  #[#set math.equation(numbering: n => "(3.29)")
   $ - o \( A_F \( w \) \) lt.eq w \( \( n'' \)^(*) \) lt.eq O \( A_F \( w \) \) . $ <eq:C-signed-rounding>]
  All these are inequalities between effective divisors pulled back from $bb(Q)$-factorial models before
    restriction to $F$.
  Consider the compact Seifert cone associated to the integral polarization $H_1$.
    For a divisorial evaluation over infinity with positive height $u$ and ordinary discrepancy $A arrow.r 0$,
    Lemma 12 gives $A gt.eq u + A_F \( w \)$ and
  $ u equiv - m ell \( w \) - w \( \( n'' \)^(*) \) med \( mod med bb(Z) \) . $
  The trivial angular restriction is impossible when $A arrow.r 0$, since then $u$ is a positive integer.
    Otherwise all terms tend to zero, so there is no wrap in this congruence.
    The residual of $m ell \( w \)$ is $o \( A_F \( w \) \)$ and the negative part in (3.29) is
    $o \( A_F \( w \) \)$; positivity of $u$ therefore forces $u = o \( A \)$.
    Orders with centre outside infinity have $v \( D \) = 0$,
    so the same small-height conclusion holds for every small-discrepancy prime.
    This contradicts Lemma 14 and (3.25). We have proved the phase estimate also at $D \( S \) = tau$,
    after a fixed multiplication.
  ===== 3.2.2 Rational triviality on the cutoff fibre. <rational-triviality-on-the-cutoff-fibre.>
  Return to the cutoff model $U^tau arrow.r W_tau$. On its generic fibre,
  $ D' = sum_(Q in I_tau) D \( Q \) Q' \, $
  and no other floor prime on this model is horizontal. With the fixed multiplications already made,
    choose an integral Weil divisor $N = ell' + n$ whose horizontal trace satisfies
  #[#set math.equation(numbering: n => "(3.30)")
   $ \| n \| lt.eq C L D' + G' . $ <eq:C-cutoff-rounding>]
  If either $N$ or $- N$ is not relatively pseudo-effective, run its Mori fibre MMP.
    On the final geometric generic Mori fibre, put $R = sum_(Q in I_tau) Q''$.
    The same pullback and class comparisons give
  #[#set math.equation(numbering: n => "(3.31)")
   $ H_1 = minus.plus N'' prec.tilde O \( L tau \) R \, wide 0 lt.eq upright(bold(D)) lt.eq \( D'' \)^(*) lt.eq
     tau R^(*) . $ <eq:C-second-large-index>]
  Again $- K$ dominates $R$ numerically, so the integral ample divisor $H_1$ has anticanonical index tending to
    infinity. If $A_F \( w \) arrow.r 0$, ordinary comparison gives $a \( w \) = 0$, $w \( R^(*) \) lt.eq
    A_F \( w \)$, and hence
  $ D \( w \) = O \( tau A_F \( w \) \) \, wide w \( \( G'' \)^(*) \) = O \( L tau A_F \( w \) \) . $
  For the latter estimate use (3.14) at the primitive restriction and the positive trace-pullback error bounded by
    $\( D'' \)^(*)$. That primitive restriction is eventually in $I_tau$, since $D \( w \) arrow.r 0$,
    and all such primes survive on $U^tau$. Its solved phase gives a residual $o \( A_F \( w \) \)$ for
    $ell \( w \)$. Equation (3.30), pulled back after the MMP, gives $w \( \( n'' \)^(*) \) =
    o \( A_F \( w \) \)$. The Seifert congruence consequently forces $u = o \( A \)$ as before, contradicting Lemma 14.
  Both $N$ and $- N$ are therefore relatively pseudo-effective.
    On a Fano type generic fibre they each have effective rationally equivalent representatives,
    by semiample termination. Their sum is an effective rationally trivial divisor and is zero,
    so $N$ is rationally linearly trivial on that fibre.
  ===== 3.2.3 A bounded principalization multiple. <a-bounded-principalization-multiple.>
  Run an MMP over $W_tau$ making $R = sum_(I_tau) Q''$ nef.
    On the geometric generic fibre the integral divisor $N''$ remains rationally principal,
    and its pullback agrees with that of $N$, since a rationally trivial divisor is crepant through these
    modifications. Fix $0 < c < 1$. The discrepancies
  #[#set math.equation(numbering: n => "(3.32)")
   $ a_(*) = a + c R^(*) $ <eq:C-torsion-CY>]
  are an effective generalized klt Calabi–Yau pair. The trace is effective because $R$ is reduced and lies on the
    floor; klt follows from $upright(bold(D)) lt.eq tau R^(*)$ and positivity of $upright(bold(D))$ on $a = 0$.
    The additional b-part is nef. The same small-order argument shows
  $ "dist" \( N'' \( w \) \, bb(Z) \) = o \( a_(*) \( w \) \) quad upright("whenever ") a_(*) \( w \) arrow.r 0 . $
  We record why this bounds its torsion order. If its minimal principalization order $l$ were unbounded,
    write $l N'' = "div" \( g \)$ and take the normalization in a root of $g$.
    The cover is connected by minimality of $l$ and is unramified in codimension one because $N''$ is integral.
    Thus ordinary Fano type data pull back without an angular ramification boundary.
    Form the product with $upright(bold(P))^1$ and take the finite diagonal cyclic quotient, as in Lemma 15.
    The product-to-quotient map is quasi-etale; over zero the fibration has multiplicity $l$.
    The log pullback of (3.32), product with the line factor,
    and descent provide effective generalized klt Calabi–Yau data over the curve.
  For a prime over zero, put $u = "ord" \( upright("base coordinate") \) \/ l > 0$.
    Its discrepancy satisfies $A gt.eq u + a_(*) \( w \)$, and the cyclic congruence is $u equiv -
    w \( N'' \) med \( mod med bb(Z) \)$. A trivial angular restriction makes $u$ a positive integer and hence
    cannot occur when $A arrow.r 0$. For a nontrivial restriction the preceding phase estimate and the absence of
    wrap give $u = o \( A \)$. Add the rational divisor $f^(*) \[ 0 \] \/ l$ with varying coefficient,
    extending the height by zero away from the origin. The discrepancies $A -
    s u$ remain an effective generalized Calabi–Yau family over the curve for arbitrarily long nonnegative
    parameter intervals. Lemma 1 applies because every $A arrow.r 0$ has $u = o \( A \)$.
    But the base discrepancy at zero is at most $1 \/ l arrow.r 0$ and is nonpositive after the coefficient $s =
    1$ is added. This contradicts its conclusion. Thus $l$ is bounded.
  The bounded principalization descends to the original generic field.
    Cartierness descends under the algebraically closed field extension for the corresponding Weil divisor,
    and a geometrically trivial line bundle and its inverse each have a nonzero section over the original field by
    flat base change. Their product is a nonzero constant, so those sections give a trivialization.
    This also explains explicitly why no unbounded field extension is absorbed into the asserted bounded multiple.
  ===== 3.2.4 The final two-sided comparison. <the-final-two-sided-comparison.>
  There is now a fixed positive integer $q$ and a rational function $chi$ on the generic fibre,
    hence in $k \( V \)$, such that the rational principal order
  $ h = q ell - "div" \( chi \) $
  has horizontal trace on $U^tau$ bounded by
  #[#set math.equation(numbering: n => "(3.33)")
   $ \| h' \| lt.eq C L D' + q G' . $ <eq:C-final-horizontal-bound>]
  For example, take $"div" \( chi \) = q N$ on that fibre, so $h' = - q n$.
    The original target $T$ is horizontal over $K_tau = K_beta$,
    and subtracting an integral principal order does not remove its phase failure:
  #[#set math.equation(numbering: n => "(3.34)")
   $ frac(\| h \( T \) \|, L D \( T \)) arrow.r oo . $ <eq:C-final-h-failure>]
  On the geometric generic fibre consider
  #[#set math.equation(numbering: n => "(3.35)")
   $ a_0 = a + c upright(bold(D)) \/ tau \, wide a_s = a_0 +
     frac(s h - q \| s \| upright(bold(G)), J_i L tau) . $ <eq:C-final-family>]
  Choose $J_i arrow.r oo$ sufficiently slowly compared with the ratio in (3.34),
    and then a two-sided parameter range $\| s \| lt.eq R_i arrow.r oo$ with $R_i \/ J_i arrow.r 0$.
    These are concave, finite piecewise affine effective generalized Calabi–Yau data.
    Indeed (3.33) and $D' lt.eq tau sum_(I_tau) Q'$ give trace effectivity for this range;
    off the floor the term $- q \| s \| upright(bold(G))$ absorbs the possible positive trace of $s h$.
    Up to rational principal terms the added nef part has $upright(bold(D))$-coefficient $c \/ tau -
    q \| s \| c_g \/ \( J_i tau \) > 0$. Thus b-nefness also holds.
  The central member is klt. If a primitive geometric generic order satisfies $a_0 < min { 1 \, c } \/ 2$,
    then $a = 0$ and $D < tau \/ 2$. Its primitive horizontal restriction is therefore a surviving prime of
    $I_tau$ on $U^tau$. Equations (3.14) and (3.33) give
  $ \| h \| + q upright(bold(G)) = O \( L upright(bold(D)) \) $
  there, uniformly for all such orders: these are primes already on the model where the horizontal trace bound was
    proved. Thus the fixed discrepancy cutoff controls every order required by the two-sided comparison lemma.
    For every fixed signed $s$ the relative difference $\( a_s - a_0 \) \/
    a_0$ is consequently $O \( \| s \| \/ J_i \) arrow.r 0$. This is the strong two-sided hypothesis of Lemma 1,
    with a fixed positive discrepancy cutoff. Its conclusion over a point says that $a_s$ is klt for fixed $s$
    eventually. At the lift of $T$, however, choose $s = 1$ or $s = -
    1$ so that $s h \( T \) = - \| h \( T \) \|$. Equations (3.35) and (3.34), with the choice of $J_i$,
    give $a_s \( T \) < 0$. This contradiction proves the lemma. ◻
]

=== 3.3 Exact saturation of neutral fields <exact-saturation-of-neutral-fields>

For the pinning argument, a small error on a fixed list of functions is not enough:
  later steps use rational expressions of unrestricted degree in those functions.
  The next lemma puts every bounded-cost function in one relatively algebraically closed cutoff field and makes
  the relevant valuations exactly trivial on that field. Its count estimates use one normalization for both the
  upper and lower bounds.

#thm([Lemma 3.3.])[
  (Saturation and section counts).  #emph[Let $f_1 \, dots.h \,
    f_s$ be a finite list of genuine rational functions on $V$, whose length may vary with the sequence, and let
#[#set math.equation(numbering: n => "(3.36)")
 $ J \( T \) = max { 0 \, max_j \( - T \( f_j \) \) } \, wide 0 lt.eq J lt.eq C L_0 upright(bold(D)) \, wide
   1 lt.eq L_0 = O \( L \) . $ <eq:C-neutral-polarization>]

 Thus $J$ is an integral basepoint-free Cartier b-divisor on a high model.
   Suppose (3.5) holds uniformly with $eta_i arrow.r 0$ on
$ cal(L) = { T : a \( T \) = 0 \, med J \( T \) = 0 } . $

 In addition, on every subsequence on which $L_0 arrow.r oo$,
   assume that all valuations in $cal(L)$ eventually restrict trivially to the #emph[field generated by]
   $S \( L_0 D \)$.]
  #emph[After passage to a subsequence, there are cutoff fields $K_(*)$ of fixed transcendence degree $p$,
    a fixed constant $B$, and positive real numbers $v_i$ with the following properties.]
  + #emph[For every fixed $C_1 > 0$, eventually $S \( C_1 L D \) subset K_(*)$.]
  + #emph[Eventually $S \( B L D \)$ generates $K_(*)$. If $T in cal(L)$ is nonnegative on this space,
    its restriction to $K_(*)$ is trivial.]
  + #emph[There is $C' > 0$, independent of the positive integer $n$, such that for every fixed $n$, eventually
#[#set math.equation(numbering: n => "(3.37)")
 $ dim S \( n L D \) lt.eq C' v_i n^p \, wide dim "Span" { g_1 dots.h.c g_n : g_j in S \( B L D \) } gt.eq
   v_i n^p . $ <eq:C-uniform-counts>]

]
  #emph[The eventual index in (i) may depend on $C_1$, and that in (iii) may depend on $n$;
    $B$ and $C'$ are fixed before $n$. All assertions concern divisorial evaluations.
    Exact triviality also holds on rational monomial subcones cut out by the indicated conditions.]
] <lem:C-saturation-count>

#proof[
  Because $J$ is integral and $L_0 = O \( L \)$, choose a fixed small $c > 0$ so that
  $ a \( T \) = 0 \, quad L D \( T \) lt.eq c quad arrow.r.double quad J \( T \) = 0 . $
  There is, after a subsequence, a single field plateau containing two cutoffs
  #[#set math.equation(numbering: n => "(3.38)")
   $ 0 < beta_0 lt.eq beta_1 lt.eq c \/ L \, wide L beta_0 arrow.r 0 \, wide L beta_1 gt.eq c' > 0 \, wide
     K_(beta_0) = K_(beta_1) = K_(*) . $ <eq:C-plateau>]
  Here is a precise reason for this choice. Pass to limits of the finitely many change locations multiplied by
    $L$, adding dummy endpoints if the number of changes varies.
    The last change tending to zero lies below a cutoff $beta_0$ with $L beta_0 arrow.r 0$;
    choose it decreasing slowly enough to lie beyond that change.
    The next change either has a positive limiting scaled location or lies beyond $c \/ L$.
    Choose $beta_1$ strictly before it, with $L beta_1$ fixed positive and at most $c$. This gives (3.38).
    Passing again fixes $p = "trdeg" K_(*)$.
  All $I_(beta_1)$ belong to $cal(L)$, so Lemma 16 makes them horizontal over $K_(*)$.
    It follows, for #emph[every] rational $m > 0$, that
  #[#set math.equation(numbering: n => "(3.39)")
   $ S \( m P_(beta_0) \) = S \( m P_(beta_1) \) . $ <eq:C-exact-plateau-spaces>]
  Indeed a function in the left side belongs to $K_(*)$: enlarge $m$ to an integer and use the section-field
    description. Its order at every removed prime in $I_(beta_1)$ is zero by horizontality.
    Removing those pole allowances therefore leaves it in the right side.
    The reverse inclusion follows from $P_(beta_1) lt.eq P_(beta_0)$.
    For fixed $C_1$, a function in $S \( C_1 L D \)$ has no pole at $I_(beta_0)$ eventually,
    because its order is integral and $C_1 L beta_0 < 1$. Hence
  $ S \( C_1 L D \) subset S \( C_1 L P_(beta_0) \) = S \( C_1 L P_(beta_1) \) subset K_(*) . $
  This proves (i). The cutoff generation statement at $beta_1$, and $beta_1 gt.eq c' \/ L$,
    place a birational field-generating space for $K_(*)$ inside $S \( B_0 L D \)$ for fixed $B_0$.
    Enlarging $B$ will therefore make $S \( B L D \)$ generate $K_(*)$;
    a basis contains $p$ algebraically independent elements, by greedily choosing a transcendence basis from any
    field-generating set.
  We prove that some fixed $B$ forces the asserted exact triviality.
    Otherwise choose $B_i arrow.r oo$ slowly and $T_i in cal(L)$ that are nonnegative on $S \( B_i L D \)$ but
    nontrivial on $K_(*)$. Since $K_1 = k$, there is a change at $beta gt.eq
    beta_1$ where $T$ is trivial on $K_beta$ but nontrivial on the preceding field $K_(beta_(-))$.
    Take $beta_(-)$ sufficiently close to $beta$ from below that $beta_(-) > beta \/ 2$.
    Use $H \, phi.alt_j$ from Lemma 16 at $beta_(-)$. Their pole bounds are $C upright(bold(D)) \/ beta$,
    and $1 \/ beta = O \( L \)$; thus $T \( phi.alt_j \) gt.eq 0$ eventually. Its nontrivial restriction gives
  #[#set math.equation(numbering: n => "(3.40)")
   $ H \( T \) lt.eq - 1 . $ <eq:C-negative-cutoff-order>]
  If $L_0 beta arrow.r oo$, then $L_0 arrow.r oo$ because $beta lt.eq 1$.
    The same bounded-cost field-generating space for $K_(beta_(-))$ is contained in $S \( L_0 D \)$ eventually.
    The hypothesis of triviality on the #emph[field] generated by the latter space contradicts the choice of $T$.
    It remains to treat a subsequence on which $L_0 beta$ is bounded.
  Restrict to the geometric generic fibre of the cutoff contraction $U^beta arrow.r W_beta$. There $T$ is horizontal and
  $ D' lt.eq beta sum_(I_beta) Q' . $
  Apply the extra-data part of Lemma 3, over a point, with
  #[#set math.equation(numbering: n => "(3.41)")
   $ tilde(a) = a + kappa J \, wide d = c_(*) = upright(bold(D)) \/ beta \, wide h = H \, $ <eq:C-saturation-chamber>]
  where $kappa > 0$ is fixed rational and sufficiently small;
    $c_(*)$ denotes the additional nonnegative direction of that lemma. We verify all its hypotheses.
    The orders $tilde(a)$ have bounded denominator because $a$ and $J$ are integral.
    The order $H$ has bounded denominator by the cutoff lemma.
    Both $J$ and $upright(bold(D)) \/ beta$ are b-nef, and $H$ is pulled back from a b-nef divisor on
    $K_(beta_(-))$; after a birational determination it restricts to a b-nef divisor on this fibre.
    Their Calabi–Yau realizations hold the total class rationally trivial. At floor primes on this fibre,
  $ H lt.eq C D \/ beta \, wide J lt.eq C D \/ beta \, $
  where the second bound uses boundedness of $L_0 beta$. At other primes on the model, $a = 1$, $D = 0$, $J = 0$,
    and $H lt.eq 0$. These inequalities give effective traces on uniform small positive ranges in (3.41),
    including the family with $lambda H + s c_(*)$ for $0 < s lt.eq lambda theta_0$.
    The family $tilde(a) + t d$ is klt for $t > 0$ because $D$ is positive on $a = 0$. Finally,
  $ tilde(a) = 0 quad arrow.l.r.double quad a = J = 0 \, wide - C eta_i c_(*) lt.eq H lt.eq C c_(*) quad
    upright("on this zero set") . $
  The lower bound is part (iii) of the cutoff lemma, using the assumed uniform (3.5).
    Thus the exact sign conclusion of Lemma 3 over a point prohibits $H < 0$ at the lift of $T$,
    contradicting (3.40). This proves (ii).
  The proof of (iii), including its common normalization $v_i$,
    is given below after establishing the adjoint lattice-point statement.
    For the extension to rational monomial subcones, take any finite list of tested functions,
    resolve their divisors, and subdivide the cone so their orders are linear on each piece.
    Divisorial rational rays are dense in each rational piece.
    The exact zero assertions extend by continuity; applying this separately to each function gives triviality on
    the whole field. ◻
]

=== 3.4 Adjoint lattice points for integral Weil polarizations <subsec:C-adjoint>

We prove the precise lattice-point supply needed for the lower count.
  The polarization will be nef and big and may be an integral Weil divisor with unbounded Cartier index.
  The rounding and pushdown steps below keep those hypotheses throughout.

The weighted-blowup and adjoint-lifting construction below adapts the “Adjoint lattice points” and “Orbifold
  vanishing” lemmas in #cite(label("OpenAIAdjointSemigroup")).
  Here the argument is developed for a nef and big integral Weil polarization with a klt Calabi–Yau boundary,
  including the rounding and global regularity checks given below; the earlier theorem is not used as a black box.

#thm([Lemma 3.4.])[
  (Vanishing on a smooth orbifold).  #emph[Let $cal(X)$ be a smooth proper Deligne–Mumford stack over an
    algebraically closed field of characteristic zero, with trivial generic stabilizer and projective coarse
    space. Let $Theta$ be an effective rational divisor with simple normal crossing support and coefficients less
    than one. If $D$ is an integral Cartier divisor and $D - \( K_(cal(X)) + Theta \)$ is nef and big,
    then $H^q \( cal(X) \, cal(O)_(cal(X)) \( D \) \) = 0$ for $q > 0$.]
] <lem:C-orbifold-vanishing>

#proof[
  Write $q : cal(X) arrow.r X$ for the coarse morphism. For each prime $B$ of $X$,
    let $P$ be its reduced inverse-image divisor and $e_B$ its generic stabilizer order. Thus $q^(*) B = e_B P$.
    Rational divisors on $cal(X)$ descend uniquely to rational divisors on $X$;
    use a subscript $c$ for the descended divisor. The local normal-direction equation $t = z^(e_B)$ gives
  $ K_(cal(X)) = q^(*) \( K_X + R \) \, wide R = sum_B \( 1 - e_B^(- 1) \) B . $
  Choose compatible canonical divisors using one rational top form. Set $Delta = R + Theta_c - { D_c }$.
    If the coefficients of $D$ and $Theta$ at $P$ are $d in bb(Z)$ and $theta in \[ 0 \, 1 \)$, write $d = e_B n +
    s$ with $0 lt.eq s < e_B$, also when $d$ is negative. Then
  $ "coeff"_B Delta = frac(e_B - 1 + theta - s, e_B) in \[ 0 \, 1 \) . $
  In particular $Delta$ is effective.
  The pair $\( X \, Delta \)$ is klt, including at higher-codimensional quotient singularities.
    Indeed, etale locally on $X$ there is a finite quotient presentation $\[ U \/ G \]$, with $U$ smooth and $f :
    U arrow.r U \/ G$ finite. Its log pullback boundary is $Theta_U - f^(*) { D_c }$.
    This possibly negative boundary is bounded above by the simple normal crossing boundary $Theta_U$.
    Thus for every divisorial valuation $F$ over $U$,
  $ A \( F \; U \, Theta_U - f^(*) { D_c } \) = A \( F \; U \, Theta_U \) + F \( f^(*) { D_c } \) > 0 . $
  The finite-map discrepancy formula multiplies downstairs log discrepancies by positive ramification indices,
    so the downstairs pair is klt. This argument requires only local quotient charts.
  The coarse pushforward is
  $ q_(*) cal(O)_(cal(X)) \( D \) = cal(O)_X \( floor.l D_c floor.r \) . $
  To check it, a rational section $h$ is regular along $P$ precisely when $e_B "ord"_B \( h \) + d gt.eq 0$,
    equivalently $"ord"_B \( h \) + floor.l d \/ e_B floor.r gt.eq 0$.
    Both sides extend these codimension-one conditions across codimension at least two:
    on a smooth finite quotient chart this follows by normal extension and then taking invariants.
    The stack is tame in characteristic zero, so coarse pushforward is exact and identifies the cohomology groups.
  Quotient singularities are locally $bb(Q)$-factorial. Consequently $M =
    floor.l D_c floor.r$ is an integral $bb(Q)$-Cartier Weil divisor, and
  $ M - \( K_X + Delta \) = D_c - \( K_X + R + Theta_c \) $
  is nef and big. Kawamata–Viehweg vanishing for a klt pair and an integral $bb(Q)$-Cartier Weil divisor gives the
    result. We use #cite(label("FujinoVanishing")) Theorem 3.2.4, manuscript version of 9 October 2023;
    the additional log-bigness condition on log canonical centres is vacuous for a klt pair.
    The characteristic-zero statement also follows from its complex form by descending the finite-type data to a
    finitely generated field and using invariance of nefness,
    bigness and cohomology under algebraically closed field extension. ◻
]

#thm([Lemma 3.5.])[
  (Adjoint Taylor exponents).  #emph[Let $X$ be a projective $bb(Q)$-factorial variety of Fano type of dimension
    $p > 0$, and let $N$ be a nef and big integral Weil divisor.
    Suppose that $H^0 \( X \, cal(O)_X \( N \) \)$ defines a birational map.
    Choose an effective rational boundary $Delta$ with $\( X \, Delta \)$ klt and $K_X +
    Delta tilde.op_(bb(Q)) 0$. At a general smooth point outside the supports of $N$ and $Delta$,
    fix regular parameters and take total-degree-then-lexicographic Taylor initial exponents,
    using the compatible local trivializations of the powers of $N$. Let
$ K = overline("conv") {frac(nu \( s \), j) : j in bb(Z)_(> 0) \, quad
  0 eq.not s in H^0 \( X \, cal(O)_X \( j N \) \)} . $

 If $t$ is a positive integer and $alpha in bb(Z)_(gt.eq 0)^p$ satisfies $alpha +
   upright(bold(1)) in "int" \( t K \)$, then some section of $t N$ has initial exponent $alpha$.]
] <lem:C-adjoint-lattice>

#proof[
  The shift by $upright(bold(1))$ supplies the adjoint correction in this argument.
    A weighted blowup will convert it into the canonical discrepancy,
    and the same shift will place the required monomial in a multiplier ideal on the exceptional divisor.
    Vanishing then lifts that monomial to a global section.
  #emph[Preparing sections with weighted initials.] Resolve $\( X \, Delta \)$ by $f : Y arrow.r X$,
    isomorphically over a neighborhood of the chosen point $x$.
    Put $N_Y = f^(*) N$ and define the log pullback $Delta_Y$ by
  $ K_Y + Delta_Y = f^(*) \( K_X + Delta \) . $
  The exceptional coefficients of $Delta_Y$ may be negative. This will cause no difficulty:
    our vanishing boundary will be a fractional rounding correction, not $Delta_Y$.
    Both $N_Y$ and $Delta_Y$ have zero divisor support near $x$ after compatible local trivialization.
    Choose canonical divisors with no support near $x$ as well.
  Let $C$ be the closed cone generated by the actual pairs $\( j \, nu \( s \) \)$.
    It has slice $K$ at degree one. Choose rational $0 < t_0 < t$ with $\( t_0 \, alpha + upright(bold(1)) \) in
    "int" C$. There is a cone generated by finitely many actual pairs that already contains this point in its
    interior: approximate the vertices of a small simplex around the point by finite nonnegative combinations of
    actual pairs. Sufficiently close approximations still surround the point.
  Choose positive primitive integral weights $u_1 \, dots.h \,
    u_p$ that replace the Taylor order by scalar weight on this finite list,
    each listed section having its specified initial as a single weight initial. Also require
  $ gamma upright(" precedes ") alpha quad arrow.r.double quad u dot.op gamma < u dot.op alpha . $
  Here is the finite-order justification. Take an integer $d$ at least the total degree of every listed initial
    and of $alpha$. Weights sufficiently close to $\( 1 \, dots.h \, 1 \)$ preserve every strict total-degree
    comparison through degree $d$, and satisfy $\( d + 1 \) min u_i > d max u_i$,
    so all higher-degree monomials are larger than every relevant initial.
    Successive sufficiently small rational perturbations realize lexicographic comparisons within the finitely
    many monomials of degree at most $d$. Clearing denominators and dividing by the common divisor preserves all
    strict comparisons. This also proves the assertion for formal Taylor expansions.
  Put $p_0 = u dot.op alpha$ and $U = u dot.op \( alpha + upright(bold(1)) \)$.
    The finite cone meets the plane with degree $t_0$ and weight $U$ in a neighborhood of
    $\( t_0 \, alpha + upright(bold(1)) \)$ relative to that entire plane.
    Choose finitely many rational points surrounding it there.
    Write these points as nonnegative rational combinations of the cone generators and clear denominators.
    Taking products, and then common powers as necessary, gives a sufficiently divisible positive integer $l$ and
    sections of the Cartier divisor $l t_0 N_Y$ with single weight initials $z^(beta^(\( 1 \))) \, dots.h \,
    z^(beta^(\( r \)))$ such that
  $ u dot.op beta^(\( a \)) = l U \, wide alpha + upright(bold(1)) in "relint" "conv" { beta^(\( 1 \)) \/ l \,
    dots.h \, beta^(\( r \)) \/ l } . $
  The relative interior contains a neighborhood in the whole plane $u dot.op v = U$.
    Pulling these sections to $Y$ is legitimate after clearing denominators:
    the effective divisor of each product is $bb(Q)$-Cartier and its rational pullback is effective.
  #emph[The weighted modification and the vanishing divisor.] Let $pi : cal(Z) arrow.r
    Y$ be the smooth stack weighted blowup at $x$ with weights $u$,
    and let $E$ be its exceptional Cartier divisor. On the coordinate model it is
  $ [\( bb(A)_(x_1 \, dots.h \, x_p \, tau)^(p + 1) \\ { x_1 = dots.h.c = x_p = 0 } \) \/ bb(G)_m] \, wide
    rho dot.op \( x_i \, tau \) = \( rho^(u_i) x_i \, rho^(- 1) tau \) \, wide z_i = tau^(u_i) x_i . $
  Its exceptional divisor is the weighted projective stack $bb(P) \( u \)$.
    This description pulls back along an etale parameter map near $x$ and glues to the identity away from $x$.
    Equivalently use the weighted ideal filtration generated by monomials of weight at least $k$;
    each ideal is supported on a finite infinitesimal neighborhood of $x$ and extends as the unit ideal outside
    $x$. The finitely generated weighted Rees algebra makes the coarse modification projective.
    The stack is smooth with finite stabilizers and trivial generic stabilizer.
    On the displayed atlas the Jacobian gives
  $ K_(cal(Z)) = pi^(*) K_Y + \( sum_i u_i - 1 \) E . $
  For $p = 1$ this construction is the identity modification and $E = x$;
    the same formulas and restriction sequence apply.
  Write $Delta_(cal(Z)) = pi^(*) Delta_Y$, supported away from $E$, and define
  $ P_0 = pi^(*) \( t N_Y \) - p_0 E \, wide H_0 = pi^(*) \( l t_0 N_Y \) - l U E . $
  The divisor $P_0$ is rational globally but integral Cartier near $E$; $H_0$ is Cartier globally.
    The selected sections, after their common weighted order is removed, are sections of $H_0$.
    Their base ideal $frak(b)$ does not vanish identically on $E$,
    and its restriction to $E$ is generated by their monomial initials.
    Take a projective log resolution $sigma : cal(Y) arrow.r cal(Z)$ of these data and all rational divisor
    supports used below, with strict transform $tilde(E)$. Arrange that the total support is simple normal
    crossing, that $sigma$ is an isomorphism at the generic point of $E$, and that $tau : tilde(E) arrow.r
    E$ resolves $frak(b) \|_E$. First resolve the additional divisor supports,
    then principalize the ideal with the resulting simple normal crossing boundary,
    including the transform of $E$, on smooth charts #cite(label("WlodarczykResolution")) Theorems 2.4.1–2.4.3.
    Smooth functoriality identifies these constructions on chart overlaps,
    so they descend to the required smooth stack; the sequence of blowups has projective coarse space. Write
  $ frak(b) cal(O)_(cal(Y)) = cal(O)_(cal(Y)) \( - G \) . $
  Then $G gt.eq 0$ does not contain $tilde(E)$, and $sigma^(*) H_0 - G$ is globally generated.
  Set
  $ Q = P_0 - K_(cal(Z)) - Delta_(cal(Z)) - E \, quad R = sigma^(*) Q - G \/ l \, quad A = K_(cal(Y)) +
    ceil.l R ceil.r \, quad Theta = ceil.l R ceil.r - R . $
  Thus $A$ is an integral Cartier divisor, and $Theta$ is effective with simple normal crossing support and
    coefficients in $\[ 0 \, 1 \)$. The weighted canonical identity, $U - p_0 = sum u_i$, and $K_Y +
    Delta_Y tilde.op_(bb(Q)) 0$ give
  $ Q - H_0 \/ l tilde.op_(bb(Q)) \( t - t_0 \) pi^(*) N_Y . $
  Consequently
  $ A - \( K_(cal(Y)) + Theta \) = R tilde.op_(bb(Q)) \( t - t_0 \) sigma^(*) pi^(*)
    N_Y + \( sigma^(*) H_0 - G \) \/ l . $
  The first summand is nef and big and the second is nef. Lemma 19 therefore gives
    $H^1 \( cal(Y) \, cal(O) \( A \) \) = 0$ and the restriction surjection
  $ H^0 \( cal(Y) \, A + tilde(E) \) arrow.r H^0 \( tilde(E) \, \( A + tilde(E) \) \|_(tilde(E)) \) . $
  #emph[The boundary monomial.] We now exhibit the required section on the exceptional divisor.
    Near $E$ the original boundary vanishes and $P_0$ is integral. Thus, on a neighborhood of $tilde(E)$,
  $ A = K_(cal(Y)) + sigma^(*) \( P_0 - K_(cal(Z)) - E \) - floor.l G \/ l floor.r . $
  Adjunction identifies the restricted bundle with
  $ tau^(*) \( P_0 \|_E \) + K_(tilde(E)) - tau^(*) K_E - floor.l \( G \|_(tilde(E)) \) \/ l floor.r . $
  Round-down commutes with this restriction: simple normal crossings prevent two components of $G$ from
    restricting to a common prime divisor on $tilde(E)$, and each disconnected intersection retains the same
    coefficient. This is the log-resolution expression for $P_0 \|_E ⊗ cal(J)_E \( \( frak(b) \|_E \)^(1 \/ l) \)$.
  The weighted-homogeneous monomial $z^alpha$ is a global section of $P_0 \|_E = cal(O)_E \( p_0 \)$,
    after the fixed local frame. On the chart $x_k eq.not 0$, use the smooth finite atlas setting $x_k = 1$,
    with residual group $mu_(u_k)$. The ideal becomes the ordinary monomial ideal generated by
    $x_(upright("rem"))^(beta_(upright("rem"))^(\( a \)))$ and the proposed section becomes
    $x_(upright("rem"))^(alpha_(upright("rem")))$. Dropping coordinate $k$ is an affine isomorphism from the plane
    $u dot.op v = U$ to $bb(R)^(p - 1)$, because $u_k > 0$. Hence $alpha_(upright("rem")) +
    upright(bold(1))$ lies in the ordinary interior of the convex hull of the projected vectors
    $beta_(upright("rem"))^(\( a \)) \/ l$, and therefore in the interior of the scaled Newton polyhedron.
    Howald’s monomial multiplier-ideal formula #cite(label("Howald")) Main Theorem gives the required membership
    on this smooth atlas. It is equivariant for $mu_(u_k)$, so descends on every chart.
    No fractional coordinate exponents are introduced: the root needed to set $x_k = 1$ is already part of the atlas.
  #emph[Lifting and pushing down.] The restriction surjection now lifts this monomial.
    Near $E$ its lifting bundle differs from $sigma^(*) P_0$ by
  $ K_(cal(Y)) - sigma^(*) K_(cal(Z)) - sigma^(*) E + tilde(E) - floor.l G \/ l floor.r . $
  The part preceding the last term is exceptional over $cal(Z)$;
    indeed it is effective by the smooth blowup discrepancy calculation for the smooth pair $\( cal(Z) \, E \)$.
    At every nonexceptional prime the displayed correction is nonpositive.
    Therefore the lifted rational section pushes down to a regular section of $P_0$ near $E$.
    Its restriction to $E$ is $z^alpha$, initially generically and then everywhere by regularity.
    Pushing further to the smooth neighborhood of $x$ gives a regular section with weight initial exactly $z^alpha$.
  It remains to check global regularity downstairs, since $N_Y$ was rational and $Delta_Y$ could have negative
    coefficients. At an original prime $B$ of $X$ away from $x$, write $n_B = "coeff"_B \( t N \) in bb(Z)$,
    $delta_B = "coeff"_B Delta gt.eq 0$, and let $g_B gt.eq 0$ be the corresponding coefficient of $G$.
    Canonical coefficients cancel inside the ceiling, and the allowed divisor coefficient of the pushed lifting
    bundle is
  $ n_B + ceil.l - delta_B - g_B \/ l ceil.r lt.eq n_B . $
  Thus no forbidden pole appears at any original prime. The point $x$ was already handled by the local weighted
    calculation (also when $p = 1$). Normality now gives a section of $cal(O)_X \( t N \)$.
    Its weight initial excludes every monomial preceding $alpha$ in the original Taylor order,
    by the choice of $u$, and the coefficient of $z^alpha$ is nonzero. Its Taylor initial is therefore $alpha$. ◻
]

#thm([Lemma 3.6.])[
  (Uniform count from the jet body).  #emph[In the setting of Lemma 20,
    $K$ is bounded and contains the standard simplex $Sigma = "conv" \( 0 \, e_1 \, dots.h \, e_p \)$.
    For every integer $n gt.eq 1$,
$ h^0 \( X \, n N \) lt.eq \( n + p \)^p "vol" \( K \) . $

 Fix any integer $t > 1 + 2 p$. The space spanned by products of $n$ sections of $t N$ has dimension at least $n^p
   "vol" \( K \)$.]
] <lem:C-jet-count>

#proof[
  On a nonempty open set, the map given by $\| N \|$ is an immersion and has no base point,
    because it is birational in characteristic zero. At the chosen general point its values and first derivatives
    thus span all first jets. Suitable linear combinations give initial exponents $0 \, e_1 \, dots.h \, e_p$,
    proving $Sigma subset K$. The order of vanishing at this point of a section of $j N$ is at most $C j$:
    intersect its effective divisor with a general complete intersection curve through the point,
    chosen not to lie in its support. Its degree is $j N dot.op H^(p - 1)$ for a fixed sufficiently ample $H$,
    and bounds the local intersection multiplicity. The constant may depend on this individual example,
    which suffices to make $K$ bounded.
  For a finite-dimensional space of germs, the number of distinct leading exponents is its dimension,
    by successive elimination of leading coefficients; alternatively use the filtration by the well-ordered
    monomials, whose nonzero graded pieces are one-dimensional.
    The exponent set at degree $n$ is contained in $n K ∩ bb(Z)^p$.
    The disjoint half-open unit boxes based at these lattice points lie in
  $ n K + \[ 0 \, 1 \]^p subset n K + p Sigma subset \( n + p \) K . $
  Their total volume is their number, proving the upper bound.
  For the lower bound let $y = n x in n K$. Write $x_i = a_i + f_i$ with $a_i in bb(Z)_(gt.eq 0)$ and $0 lt.eq
    f_i < 1$. Choose $n$ integers in coordinate $i$, namely $a_i +
    1$ in exactly $floor.l n f_i floor.r$ of the positions and $a_i$ in the others.
    Doing this independently in every coordinate gives $alpha^(\( 1 \)) \, dots.h \, alpha^(\( n \))$ with
  $ sum_(r = 1)^n alpha^(\( r \)) = floor.l y floor.r \, wide 0 < alpha_i^(\( r \)) + 1 - x_i < 2 . $
  When $f_i = 0$ all entries equal $a_i$, so the strict inequalities still hold.
    Therefore $alpha^(\( r \)) + upright(bold(1)) - x in "int" \( \( t - 1 \) Sigma \)$:
    all coordinates are positive and their sum is less than $2 p < t - 1$.
    Since $Sigma subset K$ and $x in K$, a neighborhood of $alpha^(\( r \)) +
    upright(bold(1))$ lies in $K + \( t - 1 \) K = t K$. Lemma 20 supplies a degree-$t$ section with each exponent
    $alpha^(\( r \))$. Their product has exponent $floor.l y floor.r$.
  Consequently all lattice points $floor.l y floor.r$, for $y in n K$, occur among product initials.
    Their unit boxes cover $n K$, so their number is at least $"vol" \( n K \) = n^p "vol" \( K \)$.
    Sections with distinct initials are linearly independent, proving the claimed lower bound.
    The case $p = 0$ is immediate separately. ◻
]

=== 3.5 Completion of the saturation count <completion-of-the-saturation-count>

The field and exact-triviality assertions are already established.
  We finish by placing both section counts on one nef integral Weil polarization.
  The preceding two lemmas then give the same jet-body volume as the normalization in the upper and lower estimates.

#proof[
  If $p = 0$, then $K_(*) = k$. By part (i), each fixed-cost section space is eventually the one-dimensional
    constant space. Take $v_i = 1$. Assume $p > 0$ and use the extraction $hat(W)$ from Lemma 16 at $beta_1$ of
    (3.38). Let $D_(*)$ be the pullback of $D_W$ to $hat(W)$.
    For every rational $m > 0$, the cutoff spaces identify exactly as function spaces:
  #[#set math.equation(numbering: n => "(3.42)")
   $ S \( m P_(beta_1) \) = S \( m D_(*) \) . $ <eq:C-cutoff-base-spaces>]
  The negative-MMP error is effective and exceptional, so pushing and pulling the divisor inequality for an
    individual rational function identifies the space with the one on the semiample output.
    A function in that space belongs to $k \( W \)$; the equality $P'_(beta_1) =
    p^(*) D_W$ then identifies its inequalities with those downstairs. Pullback to $hat(W)$ does not change them.
    This argument works for each rational $m$, with no requirement that $m P_(beta_1)$ be Cartier.
  Every positive coefficient of $L D_(*)$ is at least $c' delta$, because $L beta_1 gt.eq
    c'$ and the coefficients of $D_(*) \/ beta_1$ are at least $delta$.
    Choose a fixed sufficiently large integer $M$ and put
  #[#set math.equation(numbering: n => "(3.43)")
   $ N = floor.l M L D_(*) floor.r . $ <eq:C-count-polarization>]
  The coefficient lower bound gives $N gt.eq L D_(*)$ once $M$ is large enough.
    Increase $M$ so that $N gt.eq C D_(*) \/ beta_1$, with the constant from the field-generation construction.
    Then $S \( N \)$ defines a birational map and $N$ is big and integral.
    Run its MMP to a nef and big integral Weil divisor $N'$ on a $bb(Q)$-factorial projective Fano type variety
    $X'$. For every positive integer $j$, negativity gives
  #[#set math.equation(numbering: n => "(3.44)")
   $ S \( j N \) = S \( j N' \) \, wide S \( j N' \) subset S \( j M L D \) . $ <eq:C-count-mmp-spaces>]
  Indeed the first equality follows by pushing an effective divisor and, in the reverse direction,
    adding the effective exceptional MMP error; the second follows from $N lt.eq M L D_(*)$ and (3.42).
    For every fixed positive integer $n$, part (i) and the exact plateau identities give eventually
  #[#set math.equation(numbering: n => "(3.45)")
   $ S \( n L D \) subset S \( n L D_(*) \) subset S \( n N \) = S \( n N' \) . $ <eq:C-count-upper-inclusion>]
  Choose an effective ordinary rational klt Calabi–Yau boundary $Delta$ on $X'$.
    Such a boundary is obtained from a klt Fano type boundary by adding a general sufficiently divisible rational
    member of its ample anti-log-canonical class. At a general smooth point outside the boundary and divisor
    supports, let $K_i$ be the jet body of $N'$ in Lemma 20. Its volume is positive and finite by Lemma 21. Set
  $ v_i = "vol" \( K_i \) . $
  Equations (3.45) and Lemma 21 imply
  $ dim S \( n L D \) lt.eq \( n + p \)^p v_i lt.eq \( p + 1 \)^p v_i n^p . $
  Fix once and for all an integer $t > 1 + 2 p$. The same lemma supplies a space of products of $n$ sections of $t
    N'$ of dimension at least $v_i n^p$. By (3.44), $S \( t N' \) subset S \( t M L D \)$.
    Enlarge the constant $B$ in part (ii) to at least $t M$. Those products then lie in the product space in
    (3.37), proving the lower bound with the same $v_i$. Both $t$ and $M$, and hence $B$, were fixed before $n$.
    This completes the lemma. ◻
]

#thm([Corollary 3.7.])[
  (Fixed generators and neutral algebraic extensions).  #emph[In Lemma 18, let $g_(i \, 1) \, dots.h \,
    g_(i \, r_i)$ be any finite list contained in $S \( C_1 L_i D_i \)$ for one fixed $C_1$.
    For all sufficiently large $i$, the entire field $F_i = k \( g_(i \, 1) \, dots.h \, g_(i \, r_i) \)$,
    and its relative algebraic closure inside $k \( V_i \)$, lie in $K_(* \, i)$.
    Thus every test from part (ii) is exactly zero on every nonzero element of these fields at that same index,
    without a degree-dependent eventual qualification. More generally,
    a valuation trivial on a subfield remains trivial on any algebraic extension of it inside its valued overfield.]
] <cor:C-neutral-field>

#proof[
  Part (i) of the lemma includes the whole space $S \( C_1 L_i D_i \)$ at a single eventual index;
    it does not supply separate indices for its individual elements. Field closure gives $F_i subset K_(* \, i)$.
    The cutoff field is relatively algebraically closed, so it contains the stated relative algebraic closure as
    well. To see the last assertion directly, let $x eq.not 0$ be algebraic and choose a polynomial relation for
    it with nonzero constant term and coefficients in the trivially valued subfield.
    If the value of $x$ were positive, the constant term would have uniquely least value; if it were negative,
    the highest nonzero term would have uniquely least value. Neither is possible in a vanishing sum.
    Hence its value is zero. This applies to every rational expression and every polynomial degree once the finite
    generators have been included, rather than by a further limit in that degree. ◻
]

== 4 Characters and regularization on affine cones <sec:D>

We translate the projective results of Sections 2 and 3 into statements about homogeneous functions on affine
  cones. The distinction between a primitive prime order and a rescaled valuation is essential in this translation.

=== 4.1 Angular fields and the discrepancy normalization <angular-fields-and-the-discrepancy-normalization>

Let $breve(R)$ be a finitely generated normal domain over $k$,
  equipped with a positive torus grading and a commuting diagonal action of a finite cyclic group $G$.
  Positivity means that there is a linear functional strictly positive on every nonzero occurring weight and that
  the degree-zero ring is $k$. Set $R = breve(R)^G$ and $X = "Spec" R$,
  and assume that $X$ is $bb(Q)$-Gorenstein and klt. We use the effective torus acting on $R$,
  with character lattice $M$ of rank $r_T > 0$. Write

$ C = "cone" { m : R_m eq.not 0 } subset M_(bb(R)) \, wide sigma = C^or subset "Hom" \( M \, bb(R) \) \, wide
  cal(K) = "Frac" \( R \)^(bb(T)) . $

Thus $C$ is a full-dimensional pointed rational polyhedral cone.
  Choose a multiplicative splitting $m mapsto z^m$ of the homogeneous rational functions.
  Such a splitting exists because $M$ is free abelian, and it gives

#[#set math.equation(numbering: n => "(4.1)")
 $ "Frac" \( R \) = cal(K) \( z^M \) . $ <eq:D-angular-field>]

Let $h in breve(R)$ be a nonzero homogeneous function of $G$-character $chi$ and torus weight $upright(bold(u)) in
  M_(bb(Q))$. If $r_G$ is the order of $G$, set $H = r_G^(- 1) "div" \( h^(r_G) \)$ on $X$.
  Assume that there is a torus-invariant rational top form $theta$ on $X$ such that

#[#set math.equation(numbering: n => "(4.2)")
 $ K_X \( theta \) + H = 0 \, wide \( X \, H \) upright(" is lc") . $ <eq:D-log-form>]

Evaluation of a semi-invariant function always means evaluation of an invariant power, divided by its exponent.
  In particular, writing $h^(r_G) = f_h z^(r_G upright(bold(u)))$ gives

#[#set math.equation(numbering: n => "(4.3)")
 $ \( P \, y \) \( h \) = gamma \( P \) + chevron.l y \, upright(bold(u)) chevron.r \, wide gamma = 1 /
   r_G "div" \( f_h \) . $ <eq:D-height-evaluation>]

For a primitive divisorial valuation $P$ of $cal(K)$, define

#[#set math.equation(numbering: n => "(4.4)")
 $ Delta_P = {y in "Hom" \( M \, bb(R) \) : P \( f \) + chevron.l y \, m chevron.r gt.eq
   0 upright(" whenever ") f z^m in R} . $ <eq:D-polyhedron>]

The inequalities for finitely many homogeneous algebra generators suffice. The polyhedron is nonempty:
  adding a sufficiently large multiple of a strictly positive grading satisfies all these inequalities.
  For rational $y in Delta_P$, the Gauss rule

$ \( P \, y \) (sum_m f_m z^m) = min_(f_m eq.not 0) #scale(x: 120%, y: 120%)[\(] P \( f_m \) + chevron.l y \,
  m chevron.r #scale(x: 120%, y: 120%)[\)] $

defines a valuation nonnegative on $R$. After a positive rational rescaling it is a primitive divisorial
  valuation. For trivial restriction to $cal(K)$, the corresponding Gauss valuations are the nonzero rational pure
  weights $y in sigma$, with value $chevron.l y \, m chevron.r$ on $f z^m$.

Choose a basis $z_1 \, dots.h \, z_(r_T)$ of the weight monomials.
  Torus invariance gives a rational top form $theta_0$ on $cal(K)$ such that

$ theta = theta_0 and d log z_1 and dots.h.c and d log z_(r_T) . $

Here $theta_0$ is a nonzero constant when $cal(K) = k$. For a primitive $P$ put $a \( P \) =
  nu_(log \, P) \( theta_0 \)$, where log order is the order of a top form plus one.
  Extend $a$ homogeneously to positive multiples of prime orders.

#thm([Proposition 4.1.])[
  (Cone dictionary).  #emph[In the above setting the following statements hold.]
  + #emph[The discrepancy of $\( X \, H \)$ at $\( P \, y \)$ is $a \( P \)$,
    and its discrepancy at a pure weight is zero. Thus $a \( P \)$ is a nonnegative integer for every primitive
    $P$, and $upright(bold(u)) in "int" C$.]
  + #emph[For rational $mu in "int" C$, the ray quotient $V_mu$ is normal and projective,
    with function field $cal(K)$. The order function
#[#set math.equation(numbering: n => "(4.5)")
 $ upright(bold(L)) \( mu \) \( P \) = min_(y in Delta_P) chevron.l y \, mu chevron.r $ <eq:D-polarization>]

 is the b-pullback of an ample rational divisor on $V_mu$. Consequently
#[#set math.equation(numbering: n => "(4.6)")
 $ upright(bold(D)) \( P \) = min_(y in Delta_P) \( P \, y \) \( h \) = gamma \( P \) +
   upright(bold(L)) \( upright(bold(u)) \) \( P \) $ <eq:D-height-divisor>]

 is the b-pullback of an effective ample rational divisor $D$ on $V_(upright(bold(u)))$.]
  + #emph[At every actual prime $P$ of $V_mu$, a minimizer $y$ of (4.5) can be chosen so that $e \( P \, y \)$ is
    a primitive prime order on $X$, for some positive integer $e$. For this choice,
#[#set math.equation(numbering: n => "(4.7)")
 $ a \( P \) + \( P \, y \) \( h \) = 1 / e \, wide e y in "Hom" \( M \, bb(Z) \) . $ <eq:D-actual-prime>]

 On each $V_mu$, $a$ is the discrepancy function of an effective ordinary lc Calabi–Yau pair, and $a +
   upright(bold(D))$ is that of an effective generalized klt Calabi–Yau pair with nef part $upright(bold(D))$.
   Each $V_mu$ is of Fano type. At an actual prime outside the floor ${ a = 0 }$, the same minimizer satisfies
#[#set math.equation(numbering: n => "(4.8)")
 $ a \( P \) = 1 \, wide e = 1 \, wide \( P \, y \) \( h \) = 0 . $ <eq:D-off-floor>]

]
] <prop:D-cone-dictionary>

#proof[
  Take a uniformizer $t$ at $P$ and separating residue coordinates $s_1 \, dots.h \, s_(p - 1)$, where $p =
    "trdeg"_k cal(K)$. Up to a unit the base form is $t^(a \( P \)) d log t and d s_1 and dots.h.c and
    d s_(p - 1)$. For a rational Gauss extension, integral powers of the $z_j$ can be adjusted by powers of $t$ to
    obtain angular units with algebraically independent residues.
    The resulting logarithmic wedge has log order zero. Together with (4.2), this proves the discrepancy formula.
    The calculation with trivial restriction to $cal(K)$ is the same,
    using a basis of the kernel of the pure weight. Nonnegativity follows from lc.
    Integrality is the ordinary integral log order of $theta_0$.
    At a nonzero rational pure weight $y$, klt of $X$ gives $A_X \( y \) = y \( h \) = chevron.l y \,
    upright(bold(u)) chevron.r > 0$. Positivity on the nonzero rays of $sigma$ is equivalent to $upright(bold(u))
    in "int" C$.
  Choose a positive integer $d$ with $d mu in M$ and set
  $ V_mu = "Proj" xor.big_(j gt.eq 0) R_(j d mu) . $
  The ray ring is finitely generated and normal: it is the appropriate diagonalizable invariant subring, followed,
    if necessary, by a Veronese subring. Its degree-zero part is $k$, so its Proj is projective.
    An invariant rational function is a ratio of two homogeneous elements of the same weight.
    Multiplying their common weight by a suitable occurring weight moves both elements onto a sufficiently
    divisible multiple of the interior ray. To see the latter assertion directly,
    express $mu$ as a strictly positive rational combination of all the finitely many generating weights and clear
    denominators; sufficiently high multiples leave room to subtract any prescribed occurring weight.
    This proves $k \( V_mu \) = cal(K)$.
  Write the algebra generators as $f_j z^(m_j)$. Linear programming duality gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ min_(y in Delta_P) chevron.l y \, mu chevron.r = max {- sum_j lambda_j P \( f_j \) : lambda_j gt.eq 0 \, med
     sum_j lambda_j m_j = mu} . $ <eq:D-linear-program>]
  The polytope on the right is compact because the grading is positive.
    Its rational vertices depend on the weights and $mu$, not on $P$.
    After clearing their denominators and taking a Veronese generated in degree one,
    these vertices give actual monomials on the ray. Conversely,
    a sum of monomials has no worse pole order than its worst summand.
    Therefore (4.9) is exactly the maximum allowed pole order in the homogeneous linear system,
    expressed using $z^(d mu)$ as rational frame. On the Proj this system is basepoint-free in sufficiently
    divisible degree. Its maximum-pole formula on every higher model is the pullback of its ample tautological
    divisor. This proves (ii), including the b-divisor assertion.
    Formula (4.3) identifies $upright(bold(D))$ with a rational principal adjustment of this polarization.
    Since $h$ is regular upstairs, its invariant powers have nonnegative value at every Gauss extension,
    so $upright(bold(D)) gt.eq 0$.
  For (iii), choose a homogeneous section $s$ on the defining ray whose nonvanishing chart contains the generic
    point of $P$. The map $"Spec" R_s arrow.r "Spec" \( R_s \)_0$ is the torus quotient,
    and the latter is the corresponding chart of $V_mu$. Localize the base at $P$.
    Its uniformizer remains a nonunit upstairs: the invariant ring is a direct summand,
    and an inverse upstairs would give an inverse downstairs by taking its invariant part.
    A component of its zero divisor therefore has height one and dominates $P$, by the principal ideal theorem.
    Such a component is torus invariant, since a connected torus cannot permute its finitely many irreducible
    components nontrivially.
  The primitive order of a torus-invariant prime is Gauss. Indeed its valuation ideals are torus invariant,
    hence are direct sums of weight spaces; there is no cancellation between different weights,
    and on each weight space restriction to $cal(K)$ supplies the indicated base order.
    Write the resulting valuation as $e \( P \, y \)$. Its restriction to $cal(K)$ is an integral multiple $e P$,
    and its values on $z^M$ are integral. Invertibility of $s$ implies that $y$ minimizes the ray polarization.
    A prime on a normal variety has ordinary log discrepancy one.
    Thus $1 = e #scale(x: 120%, y: 120%)[\(] a \( P \) + \( P \, y \) \( h \) #scale(x: 120%, y: 120%)[\)]$,
    which proves (4.7). Notice that this argument concerns actual primes on $V_mu$;
    it asserts no such identity at an arbitrary exceptional prime.
  On $V_mu$ set $Omega = - K_(V_mu) \( theta_0 \)$. The log discrepancies of $\( V_mu \, Omega \)$ are $a$,
    and $K_(V_mu) \( theta_0 \) + Omega = 0$. At actual primes (4.7) gives $0 lt.eq a lt.eq 1$;
    hence $Omega$ is effective. Moreover $a \( P \) + upright(bold(D)) \( P \) lt.eq 1$ there.
    At every divisorial $P$, a rational minimizer for (4.6) gives a Gauss extension,
    so klt of $X$ implies $a \( P \) + upright(bold(D)) \( P \) > 0$.
    Subtracting the trace of $upright(bold(D))$ from $Omega$ and taking $upright(bold(D))$ as nef part gives the
    claimed generalized klt Calabi–Yau data.
  For completeness these data imply Fano type without any uniform index assumption.
    On a common resolution on which $upright(bold(D))$ is semiample,
    replace it by a general divided member of a sufficiently divisible free system.
    Added to the generalized boundary this gives an ordinary klt sub-pair;
    its pushdown has effective boundary and is crepant, with total log canonical divisor rationally trivial.
    The added divisor is big. Choose an effective ample divisor $A$ on $V_mu$.
    Bigness permits a second effective representative of $upright(bold(D))$ containing a small positive multiple
    of the pullback of $A$. Mixing this representative with the general free representative with sufficiently
    small positive weight preserves klt. The resulting effective boundary downstairs contains $epsilon
    A$ for some $epsilon > 0$. Subtracting that summand leaves an effective klt boundary whose negative log
    canonical class is $bb(Q)$-linearly equivalent to $epsilon A$, hence ample.
    Finally, at a non-floor prime the integer $a \( P \) > 0$ in (4.7) forces (4.8). ◻
]

=== 4.2 Which divisorial lc tests occur <which-divisorial-lc-tests-occur>

#thm([Lemma 4.2.])[
  (All divisorial lc tests are Gauss).  #emph[Every nontrivial divisorial valuation nonnegative on $R$ and having
    zero discrepancy for $\( X \, H \)$ is Gauss. Its restriction to $cal(K)$ is either $e P$ with $a \( P \) =
    0$, or trivial, in which case it is a nonzero pure weight in $sigma$.
    Conversely every rational Gauss extension with $a \( P \) = 0$, and every nonzero rational pure weight,
    has zero discrepancy and a center whose closure contains the contracting vertex.]
  #emph[If $"Spec" breve(R) arrow.r X$ is quasi-étale and the pairs are related by log pullback,
    every divisorial $h$-lc test upstairs restricts to one of these tests, up to scaling.
    Conversely all the rational tests just listed lift to divisorial $h$-lc tests upstairs whose center closures
    contain the upstairs vertex. These statements suffice in particular for testing invariant rational functions.]
] <lem:D-lc-tests>

#proof[
  Let $v$ be a primitive divisorial valuation as in the first assertion.
    By the divisorial restriction statement in Section 1, a nontrivial restriction to $cal(K)$ has the form $e P$,
    with $P$ primitive and $e$ a positive integer. Use the uniformizer $t$ and separating residue coordinates from
    the proof of Proposition 23. Every remaining logarithmic differential has nonnegative log order at $v$. Thus
  #[#set math.equation(numbering: n => "(4.10)")
   $ A_(X \, H) \( v \) gt.eq e a \( P \) . $ <eq:D-log-defect>]
  More explicitly, pass to the finite-index sublattice of $M$ on which $v \( z^m \)$ is divisible by $e$,
    and replace each of its basis monomials by the unit $z^m t^(- v \( z^m \) \/ e)$.
    If their residues are algebraically dependent over the residue field of $P$,
    their leading differential wedge vanishes, so the inequality in (4.10) is strict.
    Zero discrepancy therefore forces $a \( P \) = 0$ and independence of these angular unit residues.
    For a finite sum of tied terms, divide by a term of least value.
    All differences of its exponents lie in that finite-index lattice;
    independence of the adjusted residues prevents cancellation.
    Thus $v$ is exactly the Gauss valuation determined by its restrictions to $cal(K)$ and $z^M$.
  If the restriction to $cal(K)$ is trivial, use a separating transcendence basis of $cal(K)$ in the same wedge
    computation. If all angular weights were zero, the unit residues could have transcendence degree at most
    $r_T - 1$ over $cal(K)$, and the leading top wedge would vanish.
    Zero log discrepancy therefore forces a nonzero angular weight.
    It further forces algebraic independence, over $cal(K)$, of the residues of a basis of the weight-zero
    monomials. The same tied-sum argument now proves that $v$ is a pure Gauss weight.
    Nonnegativity on $R$ places that weight in $sigma$.
  The converse discrepancy assertion was computed in Proposition 23.
    The center of a Gauss valuation is torus invariant. A positive grading contracts its closure to the vertex,
    so the vertex lies in that closure; the valuation need not itself be centered at the closed vertex.
  For a finite quasi-étale map with log-pulled pairs, the ramification formula makes discrepancies homogeneous
    under restriction. Hence an upstairs lc valuation restricts to a downstairs lc valuation,
    and every divisorial extension of a downstairs lc valuation is lc upstairs.
    Such extensions exist by taking the normalization of a model carrying the downstairs prime.
    The finite image of an upstairs center closure is the downstairs center closure and contains the vertex.
    There is only one point upstairs over that vertex: every positive homogeneous semi-invariant generator has an
    invariant positive power, which vanishes there. Therefore the upstairs center closure contains the upstairs
    vertex as claimed. ◻
]

=== 4.3 Sections and a uniform sandwich argument <sections-and-a-uniform-sandwich-argument>

Let $xi = f z^k in "Frac" \( R \)$ be a nonzero rational eigenfunction, invariant under the finite group,
  and let $m in bb(Z)$ satisfy $mu = k + m upright(bold(u)) in "int" C$. Define

#[#set math.equation(numbering: n => "(4.11)")
 $ upright(bold(J))_m \( P \) = min_(y in Delta_P) \( P \, y \) \( xi h^m \) = "div" \( f \) \( P \) +
   m gamma \( P \) + upright(bold(L)) \( k + m upright(bold(u)) \) \( P \) . $ <eq:D-section-divisor>]

This is the b-pullback of an ample rational divisor $J_m$ on $V_mu$; the divisor itself may be signed.
  At a non-floor prime of $V_mu$ it has integral coefficient,
  by (4.8) and the integral value of the finite-group invariant function $xi$ at a primitive cone prime.

For a rational b-divisor $upright(bold(A))$ that descends to a model, write

$ S \( upright(bold(A)) \) = { 0 } union { g in cal(K)^(*) : "div" \( g \) + upright(bold(A)) gt.eq 0 } . $

Testing on its determining model is equivalent to testing all divisorial orders.
  This notation agrees with that of Section 3 and also applies to signed divisors.

#thm([Lemma 4.3.])[
  (Sections as regular symbols).  #emph[For every positive integer $q$ and every $g in cal(K)$,
#[#set math.equation(numbering: n => "(4.12)")
 $ g in S \( q upright(bold(J))_m \) quad arrow.l.r.double quad
   g xi^q h^(q m) in breve(R) . $ <eq:D-symbol-equivalence>]

 In particular the neutral functions of cost $b in bb(N)$ are precisely
#[#set math.equation(numbering: n => "(4.13)")
 $ { g in cal(K) : g h^b in breve(R) } = S \( b upright(bold(D)) \) . $ <eq:D-neutral-functions>]

]
] <lem:D-section-symbols>

#proof[
  Regularity implies all Gauss inequalities, hence the implication to the left.
    Conversely take a sufficiently divisible power so that the semi-invariant becomes invariant,
    its weight is on the integral ray, and its degree is large enough for the ray ring to agree with the section
    ring of the tautological polarization in that degree. The divisor inequalities and (4.9) then put that power
    in $R$. The original function belongs to $"Frac" \( breve(R) \)$ and is integral over $breve(R)$,
    so normality puts it in $breve(R)$. The second formula is the case $xi = 1$.
    When $cal(K) = k$, the same argument says that an interior weight becomes effective in a divisible degree and
    then uses normality. ◻
]

All statements that follow are sequence statements in bounded dimension.
  Constants implicit in $O \( dot.op \)$ are uniform in the sequence,
  and hypotheses about small divisorial orders are imposed along every subsequence, as in Sections 1–3.

#thm([Proposition 4.4.])[
  (Sandwich regularization).  #emph[Let $L gt.eq 1$ vary with the sequence.
    Choose integers $m > m_0$ with $m - m_0 gt.eq c L$ for a fixed $c > 0$, and suppose both $k +
    m_0 upright(bold(u))$ and $k + m upright(bold(u))$ are interior.
    Assume that whenever primitive divisorial valuations $P$ satisfy $a \( P \) =
    0$ and $L upright(bold(D)) \( P \) arrow.r 0$, there are integers $j_P$ such that
#[#set math.equation(numbering: n => "(4.14)")
 $ j_P lt.eq upright(bold(J))_(m_0) \( P \) lt.eq upright(bold(J))_m \( P \) lt.eq j_P +
   O \( L upright(bold(D)) \( P \) \) . $ <eq:D-sandwich-hypothesis>]

 Then there is a bounded positive integer $q$ and a nonzero $g in S \( q upright(bold(J))_m \)$.
   Equivalently, $g xi^q h^(q m)$ is regular on $"Spec" breve(R)$.]
] <prop:D-sandwich>

#proof[
  For $cal(K) = k$ the preceding lemma gives the assertion with $q = 1$.
    Otherwise work first on $V_mu$, where $mu = k + m upright(bold(u))$.
    Use the generalized klt Calabi–Yau discrepancy $a + upright(bold(D))$ to extract onto a $bb(Q)$-factorial Fano
    type model $U$ all exceptional primes below a fixed small positive discrepancy cutoff,
    and no other exceptional primes. The extraction statement is supplied by Section 1.
    All extracted primes are floor primes: $a$ is integral and nonnegative.
    On $U$, the positive coefficients of the trace $D_U$ are precisely the floor primes, and they are at most one.
    This holds for surviving primes by (4.7), and for extracted primes by their small $a +
    upright(bold(D))$ discrepancy.
  For each floor prime $Q$ on $U$ put $rho_Q = min { 1 \, L upright(bold(D)) \( Q \) }$.
    Choose a small fixed rational $c_1 > 0$, with $2 c_1 lt.eq c$, and an effective correction $R_c$,
    supported on these primes, such that
  #[#set math.equation(numbering: n => "(4.15)")
   $ c_1 rho_Q lt.eq R_c \( Q \) lt.eq 2 c_1 rho_Q \, wide "den" #scale(x: 120%, y: 120%)[\(] J_m \( Q \) -
     R_c \( Q \) #scale(x: 120%, y: 120%)[\)] lt.eq C_1 \/ rho_Q . $ <eq:D-rounding>]
  Here $"den"$ is the reduced positive denominator. Such a choice is obtained by taking a rational grid of mesh at
    most $c_1 rho_Q$ and denominator at most $C_1 \/ rho_Q$ in the interval
    $\[ J_m \( Q \) - 2 c_1 rho_Q \, J_m \( Q \) - c_1 rho_Q \]$. There is no correction outside the floor:
    no such primes were extracted, and $J_m$ is integral there.
  Minima of sums give the b-divisor inequality
  #[#set math.equation(numbering: n => "(4.16)")
   $ upright(bold(J))_m - upright(bold(J))_(m_0) gt.eq \( m - m_0 \) upright(bold(D)) . $ <eq:D-height-difference>]
  Since $R_c lt.eq 2 c_1 L D_U$, the divisor $P_U = \( J_m \)_U -
    R_c$ dominates the trace of $upright(bold(J))_(m_0)$ and is big.
    Run its MMP on $U$ to a nef big semiample divisor $P'$ on a $bb(Q)$-factorial Fano type model $U'$.
    On a common higher model, denote pullback from a displayed model by a star. Then
  #[#set math.equation(numbering: n => "(4.17)")
   $ upright(bold(J))_m gt.eq \( P' \)^(*) gt.eq upright(bold(J))_(m_0) \, wide R_c^(*) lt.eq upright(bold(E)) :=
     upright(bold(J))_m - \( P' \)^(*) lt.eq \( R'_c \)^(*) . $ <eq:D-mmp-sandwich>]
  Here is justification for both sides, including the comparison with the possibly different ray $m_0$.
    The divisor $J_m$ descends on $U$, and MMP negativity gives $\( P' \)^(*) lt.eq P_U^(*) = upright(bold(J))_m -
    R_c^(*)$. For the middle inequality, every divisible section of $upright(bold(J))_(m_0)$ is a section of
    $P_U$, hence of $P'$ by the MMP. The maximum-pole description of semiample divisors,
    applied on a common determination, gives $\( P' \)^(*) gt.eq upright(bold(J))_(m_0)$.
    Finally b-nef negativity gives $upright(bold(J))_m lt.eq \( J'_m \)^(*)$; since $J'_m = P' + R'_c$,
    this is the last inequality in (4.17). Also $rho_Q gt.eq D_U \( Q \)$, so
  $ upright(bold(E)) gt.eq R_c^(*) gt.eq c_1 \( D_U \)^(*) gt.eq c_1 upright(bold(D)) . $
  The final comparison is again b-nef negativity for $upright(bold(D))$.
  We apply Lemma 11 to the polarization $P'$. Choose fixed rational $delta_2 >
    0$ small enough for the denominator bound below, and then $0 < delta_1 lt.eq delta_2 c_1$.
    For $0 lt.eq t lt.eq delta_2$ use the discrepancy family and nef part
  $ a_t & = a + \( 1 - t \/ delta_2 \) delta_1 upright(bold(D)) + t upright(bold(E)) \,\
upright(bold(M))_t & = \( 1 - t \/ delta_2 \) delta_1 upright(bold(D)) + t upright(bold(J))_m . $
  Their total log canonical divisor is $bb(Q)$-linearly equivalent to $t P'$.
    For $t gt.eq delta_2$ keep $a_t = a + delta_2 upright(bold(E))$ and add $\( t - delta_2 \) \( P' \)^(*)$ to
    the nef part. This gives families on arbitrarily long parameter intervals.
    They are nondecreasing, klt, and have nef $bb(Q)$-Cartier b-parts.
  We check effectivity and the denominator trace requirement of that lemma. Every prime of $U'$ survives from $U$.
    At a non-floor prime, $a = 1$, $upright(bold(D)) = upright(bold(E)) = 0$, and $P'$ has integral coefficient.
    At a surviving floor prime $Q$, $upright(bold(E)) \( Q \) = R_c \( Q \) lt.eq 2 c_1 rho_Q$, while
  $ frac(1, "den" \( P' \( Q \) \)) gt.eq rho_Q / C_1 . $
  Take $2 delta_2 c_1 C_1 lt.eq 1$. Monotonicity gives $0 < a_t \( Q \) lt.eq
    delta_2 R_c \( Q \)$ throughout the family, so $a_t \( Q \) lt.eq 1 \/ "den" \( P' \( Q \) \)$.
    Equivalently, its effective boundary dominates the denominator boundary $R \( P' \)$ used in Section 2.
  It remains to check the signed phase hypothesis. At a growing parameter, small discrepancies mean $a \( P \) =
    0$ and $upright(bold(E)) \( P \) arrow.r 0$. Because $upright(bold(E)) gt.eq c_1 upright(bold(D))$,
    these valuations eventually belong to the fixed-cutoff list already extracted on $U$.
    On that list, (4.15) and (4.17) give
  $ upright(bold(E)) \( P \) gt.eq c_1 min { 1 \, L upright(bold(D)) \( P \) } . $
  Thus $L upright(bold(D)) \( P \) arrow.r 0$ and $L upright(bold(D)) \( P \) = O \( upright(bold(E)) \( P \) \)$.
    Combining (4.14) with (4.17) yields
  $ j_P lt.eq \( P' \)^(*) \( P \) lt.eq j_P + O \( upright(bold(E)) \( P \) \) . $
  The phase of $\( P' \)^(*) \( P \)$ therefore has a nonnegative lift of size $O \( a_t \( P \) \)$,
    which is stronger than the signed phase hypothesis. Lemma 11 supplies a nonzero section in a bounded positive
    degree of $P'$. By (4.17) it lies in $S \( q upright(bold(J))_m \)$, and Lemma 25 finishes the proof. ◻
]

=== 4.4 Bounded multiples, character counts, and tilted heights <bounded-multiples-character-counts-and-tilted-heights>

The sandwich proposition turns a phase interval into a regular symbol. We use it in three forms:
  to supply symbols for bounded-width lattice characters, to count symbols with one character and weight,
  and to supply a symbol whose cost reflects a small tilted height.
  The last form will be used on newly optimized cones before any further rank refinement.

#thm([Corollary 4.5.])[
  (Bounded-multiple character regularization).  #emph[Suppose that the order condition (3.5) on
    $V_(upright(bold(u)))$, with error $eta_i arrow.r 0$, holds whenever $a \( P \) =
    0$ and $L upright(bold(D)) \( P \) arrow.r 0$. Fix $C_0 > 0$. If $k in M$ satisfies
#[#set math.equation(numbering: n => "(4.18)")
 $ \| chevron.l y \, k chevron.r \| lt.eq C_0 L chevron.l y \, upright(bold(u)) chevron.r wide \( y in sigma \) \,
   $ <eq:D-width>]

 there are a bounded positive integer $q$, a nonzero invariant rational eigenfunction $Y = f z^(q k)$,
   and a positive integer $b lt.eq C_2 L$ such that $h^b Y in breve(R)$. The constants are uniform in $k$.
   Both signs of $k$ may be treated with the same bounded multiplier,
   and their costs may be increased to a common cost $O \( L \)$.]
  #emph[The same bounds hold uniformly if $L$ is replaced by any $L' gt.eq L$ and (4.18) is imposed at scale $L'$.]
] <cor:D-regularization>

#proof[
  Choose an integer $m_1 asymp L$ with $m_1 > C_0 L$, so that both $plus.minus k +
    m_1 upright(bold(u))$ lie in $"int" C$. Bigness of their ray polarizations supplies rational-power functions
    $g_(+) \, g_(-)$ on $cal(K)$ such that
  $ \( P \, y \) \( z^(plus.minus k) h^(m_1) \) + P \( g_plus.minus \) gt.eq 0 quad
    upright("for every ") P upright(" and ") y in Delta_P . $
  Here a rational-power function means a positive integral root of an element of $cal(K)^(*)$ used only through
    its $bb(Q)$-principal order; it need not be an element of $cal(K)$. Put
  $ ell = - "div" \( g_(+) \) \, wide G = 2 m_1 D + "div" \( g_(+) g_(-) \) . $
  Adding the two Gauss inequalities and taking the height minimum shows that $G gt.eq
    0$ on $V_(upright(bold(u)))$, and $G tilde.op_(bb(Q)) 2 m_1 D$.
    At a non-floor prime $Q$ of this model, choose the integral minimizing $y$ in (4.8).
    Since its height is zero, the two inequalities give
  $ 0 lt.eq chevron.l y \, k chevron.r - ell \( Q \) lt.eq G \( Q \) \, wide chevron.l y \, k chevron.r in bb(Z) . $
  Lemma 17 therefore gives a fixed positive integer $q_0$ and a fixed $A > 0$ such that,
    on all tiny sequences in the statement, one can choose integers $j_P$ with
  $ \| q_0 ell \( P \) - j_P \| lt.eq A L upright(bold(D)) \( P \) . $
  Apply Proposition 26 to $xi = z^(q_0 k)$. For any sufficiently large integer $m_0 = O \( L \)$ and $m = 2 m_0$,
    the first Gauss inequality gives
  $ upright(bold(J))_(m_0) gt.eq q_0 ell + \( m_0 - q_0 m_1 \) upright(bold(D)) . $
  At a height-minimizing angular vector the second inequality gives
  $ upright(bold(J))_m lt.eq q_0 ell + \( m - q_0 m_1 \) upright(bold(D)) + q_0 upright(bold(G)) lt.eq
    q_0 ell + \( m + q_0 m_1 \) upright(bold(D)) + q_0 upright(bold(G)) . $
  The order condition (3.5), applied to $G \/ \( 2 m_1 \) tilde.op_(bb(Q)) D$,
    bounds $upright(bold(G)) \( P \) lt.eq 2 m_1 \( 1 + eta_i \) upright(bold(D)) \( P \)$ on the tiny sequences.
    Choose $m_0 - q_0 m_1 gt.eq A L$. These estimates give exactly (4.14).
    A bounded further multiplier $q_1$ then supplies $g z^(q_1 q_0 k) h^(q_1 m) in breve(R)$.
    This is the desired regularization.
  Apply the argument to $- k$ as well, raise the two resulting functions to bounded powers to align their
    multipliers, and multiply by powers of $h$ to align their costs.
    Uniformity in the weight follows by applying the sequence argument to any proposed sequence of exceptions.
    For an enlarged scale $L' gt.eq L$, its tiny sequences satisfy $L upright(bold(D)) \( P \) arrow.r 0$ as well.
    All the preceding hypotheses therefore hold with $L'$ in place of $L$.
    A sequence of exceptional pairs $\( L' \, k \)$ would contradict the same proof;
    this proves the stated uniformity, including for growing $L' \/ L$. ◻
]

#thm([Corollary 4.6.])[
  (Count for a single character and weight).  #emph[Assume the hypotheses of Lemma 18 on $V_(upright(bold(u)))$,
    and use its notation $p$ and $v_i$. For a fixed $C_0 > 0$,
    let $W_(t \, k)$ be the space of regular symbols in $breve(R)$ of finite-group character $chi^t$ and torus
    weight $t upright(bold(u)) + k$. For every fixed positive integer $n$, eventually
#[#set math.equation(numbering: n => "(4.19)")
 $ dim_k W_(t \, k) lt.eq C_3 v_i n^p $ <eq:D-character-bound>]

 simultaneously for all integers $0 lt.eq t lt.eq C_0 n L$ and all weights satisfying
$ \| chevron.l y \, k chevron.r \| lt.eq C_0 n L chevron.l y \, upright(bold(u)) chevron.r wide \( y in sigma \) . $

 The constant $C_3$ is independent of $n \, t \, k$.]
] <cor:D-character-count>

#proof[
  If $W_(t \, k) eq.not 0$, divide any nonzero member by $h^t$.
    This is a finite-group invariant rational eigenfunction, so $k in M$.
    Let $upright(bold(J))^(upright("test"))$ denote the integral basepoint-free test b-divisor called $J$ in
    Lemma 18. That lemma has $0 lt.eq upright(bold(J))^(upright("test")) lt.eq C L_0 upright(bold(D))$ with $L_0 =
    O \( L \)$. At a primitive $P$ with $a \( P \) = 0$ and $L upright(bold(D)) \( P \) arrow.r 0$,
    its nonnegative integral value is eventually zero. Such $P$ belong to that lemma’s test set $cal(L)$ and hence
    satisfy (3.5). We may therefore apply Corollary 27 at the enlarged scale $n L$.
  Choose an opposite invariant eigenfunction $Y$ of weight $- q k$,
    with $q$ bounded and $h^b Y$ regular for $b lt.eq C_4 n L$. For $F in W_(t \, k)$ the neutral function
  $ Phi \( F \) = frac(F^q Y, h^(q t)) $
  satisfies $h^(q t + b) Phi \( F \) = F^q h^b Y in breve(R)$.
    By (4.13), it belongs to $S \( \( q t + b \) upright(bold(D)) \) subset.eq S \( C_5 n L upright(bold(D)) \)$.
    Although $Phi$ need not be linear, it is a homogeneous polynomial map of degree $q$,
    nonzero away from the origin, and induces an injective morphism
  $ bb(P) \( W_(t \, k) \) arrow.r bb(P) #scale(x: 120%, y: 120%)[\(] S \( C_5 n L upright(bold(D)) \)
    #scale(x: 120%, y: 120%)[\)] . $
  Indeed proportional images imply that $\( F_1 \/ F_2 \)^q in k^(*)$;
    algebraic closedness of $k$ then implies $F_1 \/ F_2 in k^(*)$.
    An injective morphism of projective varieties preserves the dimension of its source in its image,
    so $dim W_(t \, k) lt.eq dim S \( C_5 n L upright(bold(D)) \)$.
    The upper count in Lemma 18, used at an integer at most $\( C_5 + 1 \) n$, proves (4.19);
    $p$ is bounded by the ambient dimension. The uniform enlarged-scale assertion in Corollary 27 makes $q \,
    C_4 \, C_5$ independent of $n \, t \, k$. The eventual assertion retains the quantifier that $n$ is fixed
    before passing sufficiently far along the sequence. ◻
]

#thm([Corollary 4.7.])[
  (Characters for a tilted height).  #emph[Suppose there are boundedly many invariant rational eigenfunctions
    $Y_j^plus.minus$ of weights $plus.minus k_j$, with
$ h^(m_j) Y_j^plus.minus in breve(R) \, wide 0 < m_j lt.eq A L_j \, wide 1 lt.eq L_j lt.eq L \, $

 where $A$ is fixed. Fix bounded real numbers $u_j$ and $delta > 0$.
   Assume that, at every nonzero pure weight and at all Gauss extensions over primitive $P$ with $a \( P \) = 0$,
   $L upright(bold(D)) \( P \) arrow.r 0$, the evaluations satisfy
#[#set math.equation(numbering: n => "(4.20)")
 $ y_j = v \( Y_j^(+) \) = - v \( Y_j^(-) \) \, wide sum_j frac(u_j y_j, L_j) lt.eq
   delta v \( h \) . $ <eq:D-tilt-hypothesis>]

 It suffices to check these inequalities on rational vectors.
   For fixed $M_0$ sufficiently large compared with $1 \/ delta$, choose integers
$ r_j = M_0 u_j L \/ L_j + O \( 1 \) \, $

 with uniformly bounded rounding errors. Then there is a regular nonzero symbol of finite-group character
   $chi^(q m)$ and torus weight
#[#set math.equation(numbering: n => "(4.21)")
 $ q (m upright(bold(u)) - sum_j r_j k_j) \, wide 0 < m lt.eq C_6 M_0 delta L \, $ <eq:D-tilt-weight>]

 for a bounded positive integer $q$. The constant $C_6$ depends only on the fixed bounds for the number of
   functions, their costs, the $u_j$, and rounding errors; it is independent of $delta$ and $M_0$.
   The bound for $q$ may depend on the fixed choices $delta \, M_0$. No order condition (3.5) is assumed here.]
] <cor:D-tilted-characters>

#proof[
  Set $xi = product_j \( Y_j^(+) \)^(- r_j)$, which has weight $- sum_j r_j k_j$.
    Regularity and opposite evaluations imply $\| y_j \| lt.eq m_j v \( h \)$ at every test under consideration.
    Hence, with a fixed constant $C_7$ controlling the rounding errors,
  #[#set math.equation(numbering: n => "(4.22)")
   $ sum_j r_j y_j lt.eq \( M_0 delta + C_7 \) L v \( h \) . $ <eq:D-tilt-lower>]
  Choose $M_0 delta gt.eq 2 C_7 + 2$ and an integer $m_0 asymp M_0 delta
    L$ strictly larger than $\( M_0 delta + C_7 \) L$, and set $m = 2 m_0$.
    The constants in these choices are independent of $delta \, M_0$.
    At pure weights (4.22) implies strict positivity of the weights of $xi h^(m_0)$ and $xi h^m$ on $sigma \\ {
    0 }$; both rays are therefore interior. At the angular tests it gives $upright(bold(J))_(m_0) \( P \) gt.eq 0$.
  At a height-minimizing angular vector, the elementary estimate
  $ lr(|sum_j r_j y_j|) lt.eq sum_j \| r_j \| m_j upright(bold(D)) \( P \) lt.eq
    C_8 \( M_0 + 1 \) L upright(bold(D)) \( P \) $
  also holds. Consequently $0 lt.eq upright(bold(J))_(m_0) \( P \) lt.eq upright(bold(J))_m \( P \) lt.eq
    C_9 \( M_0 \, delta \) L upright(bold(D)) \( P \)$ on the tiny sequences.
    Proposition 26 applies with $j_P = 0$ and produces $g xi^q h^(q m) in breve(R)$ for bounded $q$.
    Its character, weight, and cost are exactly those in (4.21). ◻
]

== 5 Optimization on common log canonical slices <sec:E>

Throughout this section, $x in S$ is a fixed normal complex affine germ of positive dimension $n$,
  $S$ is $bb(Q)$-Gorenstein and klt, and $R = cal(O)_(S \, x)$, $frak(m) = frak(m)_x$, and $A = A_S$.
  A valuation #emph[over $x$] is nonnegative on $R$; its centre may be a proper generization of $x$.
  A valuation #emph[centred at $x$] has $v \( frak(m) \) > 0$.
  Unless otherwise stated, valuations are nontrivial quasi-monomial real valuations.
  Discrepancy is extended linearly in the weights on a log-smooth presentation.
  For every valuation $v$ over $x$, put $v \( 0 \) = + oo$ and, for $t gt.eq 0$, set

$ frak(a)_t \( v \) = { f in R : v \( f \) gt.eq t } \, wide frak(a)_(> t) \( v \) = { f in R : v \( f \) > t } . $

The associated graded algebra and initial form are

$ "gr"_v R = xor.big_(t gt.eq 0) frak(a)_t \( v \) \/ frak(a)_(> t) \( v \) \, wide
  "in"_v \( f \) = \[ f \]_(v \( f \)) quad \( f eq.not 0 \) . $

Degrees outside the value semigroup have zero summand. These conventions also apply when the centre is a proper
  generization of $x$. For a valuation centred at $x$, set

$ "vol" \( v \) = lim_(t arrow.r oo) frac(n ! thin "length" \( R \/ frak(a)_t \( v \) \), t^n) . $

The limit exists by Cutkosky’s theorem for graded families of $frak(m)$-primary ideals
  #cite(label("CutkoskyVolumes")) Theorem 1.1 (=5.5). Its hypothesis on the nilradical of the completion holds
  because $R$ is excellent and normal, hence has reduced completion.
  The theorem applies first to integral thresholds; squeezing between adjacent integral thresholds gives the
  displayed real-parameter limit. For a klt pair $\( S \, Delta \)$ and a centred valuation of finite log
  discrepancy, the normalized volume is

$ hat("vol")_(S \, Delta) \( v \) = A_(S \, Delta) \( v \)^n "vol" \( v \) . $

Its $n$th root is $A_(S \, Delta) \( v \) "vol" \( v \)^(1 \/ n)$, with the same minimizers.
  Here and throughout the volume formulas, $n = dim S$.

Fix a nonzero $h in R$ such that $\( S \, H \)$ is lc, where $H = "div" \( h \)$,
  and finitely many nonzero $F_j in R$ and $m_j in bb(Z)_(> 0)$. The #emph[common lc slice] is

#[#set math.equation(numbering: n => "(5.1)")
 $ cal(Q) = { v : A \( v \) = v \( h \) = 1 \, quad v \( F_j \) gt.eq m_j upright(" for every ") j } . $ <eq:E-slice>]

Assume that it contains a centred valuation. Its cone of rays is defined by $A \( v \) =
  v \( h \) > 0$ and $v \( F_j \) gt.eq m_j v \( h \)$. An allowed height is

#[#set math.equation(numbering: n => "(5.2)")
 $ b \( v \) = b_0 v \( h \) - sum_ell b_ell v \( G_ell \) \, wide b_ell gt.eq 0 \, quad G_ell in R \\ { 0 } \,
   wide b \|_(cal(Q)) > 0 . $ <eq:E-height>]

On centred valuations for which $b \( v \) > 0$, the degree-one homogeneous height $b$ similarly gives the
  scale-invariant quantity $b \( v \)^n "vol" \( v \)$ and its $n$th root $b \( v \) "vol" \( v \)^(1 \/ n)$,
  with the same minimizers. All constants in this section may depend on this individual germ and its finite data.
  The constants in the strict volume gap below depend only on dimension and the stated separation.

Our goal is to minimize this functional on the common lc rays and, for rational heights,
  realize its minimizer as an ordinary normalized-volume minimizer of an effective rational klt pair.
  The realization must be exact: finite generation will be applied to that pair and its actual minimizer.
  We first control retraction to the lc locus and volume under interpolation;
  these estimates will allow one rational perturbation to exclude every competing valuation outside the common slice.

=== 5.1 Retractions, jets, and the topology of the slice <retractions-jets-and-the-topology-of-the-slice>

Let $P arrow.r S$ be a smooth model, $F$ a reduced snc divisor on $P$, and $v$ a valuation with centre on $P$.
  Write $r_F \( v \)$ for its monomial retraction using the components of $F$ through the centre,
  with their $v$-weights. It is the trivial valuation if there are no such components.
  Retraction decreases the value of every function regular on the chart and preserves the values of its boundary
  monomials; see #cite(label("JonssonMustata")) Lemma 4.7, Corollary 4.8, and Proposition 5.1.
  The following quantitative strengthening is needed here.

#thm([Lemma 5.1.])[
  (Logarithmic jet estimate).  #emph[Fix finitely many regular affine functions on $S$.
    On a fixed resolution $P$, with $F$ reduced snc, there is a constant $C$ such that,
    for every polynomial $g eq.not 0$ of degree at most $D$ in those functions and every quasi-monomial $v$ over $x$,
#[#set math.equation(numbering: n => "(5.3)")
 $ r_F \( v \) \( g \) lt.eq v \( g \) lt.eq r_F \( v \) \( g \) + C \( D + 1 \) A_(P \, F) \( v \) . $ <eq:E-jet>]

 The same constant works when the centre is not closed and when some weights disappear on passing to a face of the
   monomial cone.]
] <lem:E-log-jet>

#proof[
  Cover the relevant part of $P$ by finitely many smooth etale coordinate charts.
    At the centre of $v$, write the coordinates of the components of $F$ through that centre as $z_1 \, dots.h \,
    z_s$ and the remaining coordinates as $y_1 \, dots.h \, y_(n - s)$. Thus $v \( z_i \) > 0$.
    Choose a closed specialization of the centre in this chart, avoiding the other components of $F$,
    and translate the $y$-coordinates to vanish there. Both $v$ and its retraction are nonnegative on this
    closed-point local ring: the original centre generalizes this point.
    A unit in that ring consequently has value zero for both valuations.
    Put $a_i = v \( z_i \)$ and expand $g$ in the completed local ring. The least $z$-weight is
  $ d_0 = min { chevron.l a \, alpha chevron.r : \[ z^alpha y^beta \] g eq.not 0 upright(" for some ") beta } . $
  We first prove a degree bound independent of $a$.
  The function field of the chart is a finite extension of $bb(C) \( z \, y \)$.
    In a fixed basis, multiplication by each of the finitely many affine functions has a matrix with fixed
    rational-function entries. A polynomial of degree at most $D$ in these matrices has a common denominator of
    degree $O \( D + 1 \)$ and numerator entries of the same degree.
    Its characteristic equation, after clearing denominators, gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ sum_(j = 0)^q p_j \( z \, y \) g^j = 0 \, wide deg p_j lt.eq C_0 \( D + 1 \) \, $ <eq:E-algebraic-equation>]
  where $q$ is fixed and the coefficients are not all zero.
    Translations of coordinates do not change this degree bound.
    Give #emph[all] coordinates strictly positive rationally independent weights.
    Let $gamma$ be the leading exponent of $g$, and let $delta_j$ be the leading exponent of a nonzero $p_j$.
    At least two distinct powers, say $j$ and $k$, have the least weight in (5.4). Independence of the weights gives
  $ delta_j + j gamma = delta_k + k gamma . $
  Consequently $\| gamma \| lt.eq C_1 \( D + 1 \)$, after enlarging the constant.
    This conclusion holds for every such choice of positive weights.
  Now give the $z$-coordinates their fixed positive weights and give the $y$-coordinates weight zero.
    There are finitely many $z$-exponents of weight $d_0$, and only finitely many in a sufficiently small fixed
    neighbourhood of this weight. Every vertex of the convex hull of the tied $z$-exponents is exposed by a small
    generic perturbation of the $z$-weights. Give the transverse coordinates sufficiently small positive generic
    weights afterwards. The leading exponent projects to that vertex:
    the positive gap to the other $z$-weights prevents an exponent outside the least face from entering.
    The preceding bound therefore bounds every vertex, and convexity bounds #emph[every] tied $z$-exponent by
    $C_1 \( D + 1 \)$. The same perturbation supplies at least one pair $\( alpha \, beta \)$ on the least face
    with $\| alpha \| + \| beta \| lt.eq C_1 \( D + 1 \)$.
  For this choice of $alpha$, apply the product, over the $z$-coordinates, of the operators
  $ product_(0 lt.eq l lt.eq C_1 \( D + 1 \)\
l eq.not alpha_i) \( z_i partial_(z_i) - l \) . $
  It kills every other tied $z$-exponent and multiplies the chosen coefficient by a nonzero constant.
    Apply a transverse derivative $partial_y^beta$ for a bounded exponent occurring in that coefficient.
    Its new constant term is nonzero. These operators have total order $O \( D + 1 \)$,
    and do not change any $z$-exponent. Their result $g'$ satisfies
  #[#set math.equation(numbering: n => "(5.5)")
   $ g' = u z^alpha med \( mod med I_(> d_0) \) \, wide u upright(" a local unit") \, $ <eq:E-isolated-jet>]
  where $I_(> d_0)$ is the monomial ideal generated by the $z$-monomials of weight greater than $d_0$.
    This ideal is finitely generated. The assertion descends from completion by faithful flatness.
    More explicitly, faithful flatness first gives $g' = u z^alpha + q$ with $u$ regular and $q in I_(> d_0)$.
    In the completion, $u$ differs from the formal unit coefficient by an element of $\( I_(> d_0) : z^alpha \)$.
    This colon ideal is proper, because $z^alpha$ has weight $d_0$, and hence lies in the local maximal ideal.
    Thus $u$ is a unit. Each monomial generator of $I_(> d_0)$ has value greater than $d_0$ for both $v$ and
    $r_F \( v \)$, and its regular coefficients have nonnegative value. Thus
  $ v \( g' \) = r_F \( v \) \( g' \) = d_0 = r_F \( v \) \( g \) . $
  This also explains why a nonclosed centre causes no problem.
  For completeness, a regular logarithmic vector field $L$ satisfies
  #[#set math.equation(numbering: n => "(5.6)")
   $ v \( L f \) gt.eq v \( f \) - A_(P \, F) \( v \) . $ <eq:E-log-derivative>]
  For a prime-order valuation, take a local logarithmic volume form $eta$ for $\( P \, F \)$ and use
  $ \( L f \) eta = f thin d log \( f \) and iota_L eta . $
  At the prime on a higher smooth model, logarithmic coordinate forms and $d
    log \( f \)$ have nonnegative logarithmic order. Comparing the two sides gives (5.6).
    Homogeneity gives it for rational monomial weights, and rational approximation gives it for arbitrary
    quasi-monomial weights. In this approximation the signs on a fixed chart ring can be retained:
    the values of its finitely many generators are rational piecewise linear functions on the monomial weight
    cone, so one approximates in their common sign cells. Discrepancy and the finitely many function values in
    question are continuous there. The Euler operators and transverse derivatives used above are logarithmic
    vector fields, and subtracting a scalar does not worsen the estimate.
    Iterating (5.6) and using (5.5) proves the upper bound in (5.3). The lower bound is the retraction inequality. ◻
]

Suppose more generally that $Psi$ is an effective lc rational sum of Cartier divisors.
  Resolve its support and any further finite list of ideals and divisors, and write

$ K_P + B_P = pi^(*) \( K_S + Psi \) \, wide F = B_P^(= 1) \, wide e = A_(S \, Psi) \( v \) \, wide r = r_F \( v \) . $

If $E$ is the reduced union of the support of $B_P$, the exceptional locus, and the additional resolved divisors, then

$ e = A_(P \, E) \( v \) + sum_(D subset E) \( 1 - "coeff"_D B_P \) v \( D \) . $

All summands are nonnegative. The positive numbers $1 - "coeff"_D B_P$ for $D subset.not
  F$ have a positive minimum on this fixed resolution. Therefore

#[#set math.equation(numbering: n => "(5.7)")
 $ A_(P \, F) \( v \) lt.eq C e \, wide \| A_S \( v \) - A_S \( r \) \| lt.eq C e \, $ <eq:E-retraction-errors>]

and the evaluations of each resolved ideal or divisor differ at $v$ and $r$ by at most $C e$.
  These statements follow also when $B_P$ has negative coefficients:
  the displayed coefficients $1 - "coeff"_D B_P$ are still positive away from $F$.
  In particular, if $e = 0$, then Lemma 30 gives equality on every polynomial in the fixed affine generators.
  Equality extends to the local ring and its fraction field by localization. Hence $v = r$.

#thm([Lemma 5.2.])[
  (Compactness and uniform centring).  #emph[The slice $cal(Q)$ is a compact finite polyhedral complex of monomial
    valuations on any log resolution adapted to $h$ and the $F_j$.
    Evaluations of fixed functions are continuous on it. For centred valuations with $A \( v \) = 1$,
    there are constants $c \, C > 0$ depending on the germ such that
#[#set math.equation(numbering: n => "(5.8)")
 $ "vol" \( v \) gt.eq c \, wide "vol" \( v \) gt.eq frac(c, v \( frak(m) \)) . $ <eq:E-centering>]

 Volume is continuous on the centred part of $cal(Q)$.]
] <lem:E-compactness>

#proof[
  Apply (5.7) to $Psi = H$. Every zero-discrepancy valuation is monomial on the coefficient-one part of the fixed
    resolution. Conversely those monomial valuations have zero discrepancy for $\( S \, H \)$.
    Retain the strata whose closed images contain $x$. This condition is preserved when a stratum is replaced by a
    larger stratum, so the retained cones include their faces.
    On a cone with primitive generators $E_i$ the equation $A \( v \) = sum_i a_i A \( E_i \) =
    1$ cuts out a compact simplex, because $A \( E_i \) > 0$.
    The additional inequalities are linear on an adapted resolution. There are finitely many cones.
    Function evaluations are monomial minima on them and agree on faces by localization to the larger stratum,
    proving compactness and continuity.
  We use Li’s Izumi estimate #cite(label("LiIzumi")) Theorem 3.1:
  #[#set math.equation(numbering: n => "(5.9)")
   $ v \( f \) lt.eq
     C_I A \( v \) "ord"_(frak(m)) \( f \) quad \( f in R \\ { 0 } \, med v upright(" centred") \) . $ <eq:E-izumi>]
  Thus, when $A \( v \) = 1$, the valuation ideal $frak(a)_t \( v \)$ is contained in
    $frak(m)^(ceil.l t \/ C_I ceil.r)$. Hilbert–Samuel growth gives the first bound in (5.8).
    Choose fixed generators $z_1 \, dots.h \, z_q$ of $frak(m)$, and let $z = z_i$ have $v \( z \) = delta =
    v \( frak(m) \)$. Since $R$ is a domain,
  $ \( frak(a)_t \( v \) : z^j \) = frak(a)_(t - j delta) \( v \) . $
  Filtering $R \/ frak(a)_t \( v \)$ by the images of $z^j R$ gives
  $ "length" \( R \/ frak(a)_t \( v \) \) = sum_(0 lt.eq j < t \/ delta) "length" #scale(x: 120%, y: 120%)[\(]
    R \/ \( frak(a)_(t - j delta) \( v \) + \( z \) \) #scale(x: 120%, y: 120%)[\)] . $
  For $j lt.eq t \/ \( 2 delta \)$, Izumi bounds this summand below by
    $"length" \( R \/ \( frak(m)^(ceil.l t \/ \( 2 C_I \) ceil.r) + \( z \) \) \)$.
    The latter grows as a positive constant times $t^(n - 1)$; this includes $n = 1$,
    when it is a positive constant. Since $z$ belongs to a fixed finite list,
    the lower constant can be chosen uniformly. Divide by $t^n \/ n !$ to obtain the second bound in (5.8).
  To prove continuity, consider valuations converging on one monomial cone to a centred limit.
    Drop the components whose weights tend to zero, and call the resulting retractions $r_i$.
    The retained positive weights converge multiplicatively. On regular functions,
    the $r_i$ are therefore multiplicatively $1 + o \( 1 \)$ equivalent to the limit.
    Their maximal-ideal values, and those of the original valuations, are bounded below.
    The reduced-log discrepancy measuring the dropped weights tends to zero.
    Lemma 30 upgrades this fact to a multiplicative comparison on #emph[all] regular functions as follows.
  Write $q = "ord"_(frak(m)) \( f \) gt.eq 1$. With $c_0 > 0$ a common lower bound for maximal-ideal values and
    $C_0 q$ the common Izumi upper bound for the values of $f$, fix $L$ with $L c_0 > 2 C_0$.
    Represent $f$ modulo $frak(m)^N$, $N = ceil.l L q ceil.r$,
    by a polynomial $p$ of degree at most $N$ in fixed generators of $frak(m)$.
    Such a representative exists also for localized regular functions by expanding their unit denominators modulo
    $frak(m)^N$. The error has value greater than both values of $f$, so $v_i \( p \) =
    v_i \( f \)$ and $r_i \( p \) = r_i \( f \)$. The jet estimate bounds their difference by $o \( 1 \) q$,
    uniformly in $f$. Since $r_i \( f \) gt.eq c_0 q$, it follows that $r_i lt.eq
    v_i lt.eq \( 1 + o \( 1 \) \) r_i$ on all regular functions. Units have value zero.
    Inclusion of valuation ideals now proves volume continuity.
    Every convergent sequence has a subsequence in one of the finitely many cones,
    which proves the assertion on the whole centred part. ◻
]

We record explicitly the uniform version of the truncation argument.

#thm([Corollary 5.3.])[
  (Simultaneous approximation).  #emph[In the situation of (5.7),
    suppose $A_S \( v \)$ and $A_S \( r \)$ are bounded above and $v \( frak(m) \) \, r \( frak(m) \) gt.eq
    c_0 > 0$. Then a single constant $C$ works for every such $v$ and every $f in R$:
#[#set math.equation(numbering: n => "(5.10)")
 $ r \( f \) lt.eq v \( f \) lt.eq \( 1 + C e \) r \( f \) . $ <eq:E-all-functions>]

 In particular, $"vol" \( v \)^(1 \/ n) gt.eq \( 1 + C e \)^(- 1) "vol" \( r \)^(1 \/ n)$.]
] <cor:E-all-functions>

#proof[
  Use $N = ceil.l L "ord"_(frak(m)) \( f \) ceil.r$ with the single constant $L$ chosen in the preceding proof.
    Equations (5.3) and (5.7) give $v \( f \) - r \( f \) lt.eq C e "ord"_(frak(m)) \( f \) lt.eq
    C e thin r \( f \) \/ c_0$. Enlarge $C$. The ideal inclusions give the volume inequality. ◻
]

=== 5.2 Convex domination and strict volume comparison <convex-domination-and-strict-volume-comparison>

#thm([Lemma 5.4.])[
  (Convex domination).  #emph[For $v_1 \, dots.h \, v_k in cal(Q)$ and $p_s gt.eq 0$ with $sum_s p_s = 1$,
    there is $u in cal(Q)$ such that
#[#set math.equation(numbering: n => "(5.11)")
 $ u \( f \) gt.eq sum_s p_s v_s \( f \) wide \( f in R \) . $ <eq:E-convexity>]

 If a positive-weight term is centred, then $u$ is centred.
   On the cone of common lc rays, the same statement holds with $A \( u \) = sum_s p_s A \( v_s \)$,
   without requiring $A \( v_s \) = 1$. For an allowed height, $b \( u \) lt.eq sum_s p_s b \( v_s \)$.]
] <lem:E-convexity>

#proof[
  Fix finitely many functions $g_i$ whose averaged target values $s_i = sum_s p_s v_s \( g_i \)$ are positive,
    and choose positive rational $s'_i lt.eq s_i$. Include $h$ with the #emph[exact] target $1$ and each $F_j$
    with target $m_j$. Choose $N$ so that every $N \/ s'_i$ is integral, and put $frak(a) =
    sum_i \( g_i^(N \/ s'_i) \)$. We claim that $\( S \, frak(a)^(1 \/ N) \)$ is not klt at $x$.
    The multiplier-ideal summation formula on normal $bb(Q)$-Gorenstein complex varieties gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ cal(J) \( frak(a)^(1 \/ N) \) = sum_(t_i gt.eq 0\
sum_i s'_i t_i = 1) cal(J) #scale(x: 180%, y: 180%)[\(] product_i \( g_i \)^(t_i) #scale(x: 180%, y: 180%)[\)] .
  $ <eq:E-multiplier-sum>]
  This is the mixed-ideal formula of #cite(label("Takagi")) Theorem 3.2 and #cite(label("JowMiller")) Corollary 2
    and Theorem 3.6; there is no smoothness or Jacobian correction in this particular formula.
    If the left side were the unit ideal at $x$, some summand would be the unit ideal in the local ring.
    The resulting mixed pair would be klt, so for every positive-weight $v_s$,
    $sum_i t_i v_s \( g_i \) < A \( v_s \) = 1$. Averaging contradicts
  $ sum_i t_i sum_s p_s v_s \( g_i \) = sum_i t_i s_i gt.eq sum_i t_i s'_i = 1 . $
  The failure of klt is witnessed by a prime $E$ whose centre contains $x$, and $A \( E \) lt.eq
    min_i { "ord"_E \( g_i \) \/ s'_i }$. Thus $u = "ord"_E \/ A \( E \)$ meets all the lower targets.
    In particular $u \( h \) gt.eq 1$, whereas lc of $\( S \, H \)$ gives $u \( h \) lt.eq A \( u \) = 1$.
    It is already in $cal(Q)$.
  Here is the geometric mechanism behind (5.12). Resolve the summand ideals and their sum,
    with fixed divisors $D_i \, D$, and subdivide ${ p_i gt.eq 0 : sum p_i =
    1 \/ N }$ by the rounding walls of $cal(O)_P \( ceil.l K_(P \/ S) - sum_i p_i D_i ceil.r \)$.
    The cellular complex indexed by chains of nonempty cells,
    with the usual alternating face maps and inclusions on removing the first cell,
    resolves $cal(O)_P \( ceil.l K_(P \/ S) - D \/ N ceil.r \)$.
    In completed snc coordinates its exactness is coefficientwise:
    the cells admitting a given Laurent monomial form a convex relatively open subset of the exponent simplex,
    and their barycentric order complex is contractible when nonempty.
    This subset is nonempty exactly for monomials in the target.
    Indeed, locally one summand divided by the invertible sum ideal is a unit,
    so its fixed divisor there equals $D$. Local vanishing for each mixed multiplier-ideal term preserves the
    surjective augmentation under pushforward. This gives the stated sum formula in precisely the singular setting
    used above.
  Let the rational lower targets increase to their averaged values.
    Compactness from Lemma 31 gives a point meeting the finite list exactly as lower bounds.
    The closed sets imposing these lower bounds, indexed by all regular functions,
    have the finite intersection property. Compactness supplies a single $u$ satisfying (5.11) for every function.
    Positivity on generators of $frak(m)$ proves the centring assertion.
    For unnormalized inputs, put $a = sum_s p_s A \( v_s \)$,
    apply the normalized assertion with weights $p_s A \( v_s \) \/ a$ to $v_s \/ A \( v_s \)$,
    and multiply the result by $a$. The formula for $b$ and the equality for $u \( h \)$ prove its height bound. ◻
]

#thm([Corollary 5.5.])[
  (Opposite ratios).  #emph[Suppose rational functions $q \,
    q'$ have regular numerators and power-of-$h$ denominators, and $v \( q' \) = - v \( q \)$ on $cal(Q)$.
    The interpolant in Lemma 33 has $u \( q \) = sum_s p_s v_s \( q \)$ and $u \( q' \) = sum_s p_s v_s \( q' \)$.
    The assertion holds simultaneously for any number of such pairs.]
] <cor:E-opposite-ratios>

#proof[
  Apply domination to both numerators and use the exact value of $h$.
    The two lower inequalities have opposite sides and so must be equalities. ◻
]

#thm([Lemma 5.6.])[
  (Volume interpolation and a strict gap).  #emph[Let $w$ be centred, let $v$ be over $x$, and suppose $u gt.eq
    t w + \( 1 - t \) v$ on $R$ for $0 < t < 1$. For $f eq.not 0$ with $w \( f \) > 0$,
#[#set math.equation(numbering: n => "(5.13)")
 $ "vol" \( u \) lt.eq t^(- n) frac(t w \( f \), t w \( f \) + \( 1 - t \) v \( f \)) "vol" \( w \) .
   $ <eq:E-volume-interpolation>]

 If $v$ is also centred, $t = 1 \/ 2$, and $v \( f \) gt.eq \( 1 + gamma \) w \( f \) > 0$ for $0 < gamma lt.eq 1$, then
#[#set math.equation(numbering: n => "(5.14)")
 $ "vol" \( w \) + "vol" \( v \) - 2 "vol" \( u \) gt.eq c \( n \, gamma \) "vol" \( w \) \, $ <eq:E-volume-gap>]

 where $c \( n \, gamma \) > 0$ depends only on $n \, gamma$.
   Consequently valuations whose volumes are within relative $o \( 1 \)$ of the minimum on the same $A =
   1$ common slice are multiplicatively $1 + o \( 1 \)$ equal on #emph[all] regular functions.
   The conclusion is uniform when the dimension is bounded. A sufficiently small fixed relative error similarly
   gives any prescribed fixed multiplicative closeness to one.]
] <lem:E-volume-interpolation>

#proof[
  For a centred filtration, write its Laplace sum as the sum over its jumps $a$ of
    $dim_(bb(C)) \( frak(a)_a \/ frak(a)_(> a) \) e^(- a \/ N)$. Integration of the cumulative dimension function gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ lim_(N arrow.r oo) N^(- n) sum_a dim_(bb(C)) \( frak(a)_a \/ frak(a)_(> a) \) e^(- a \/ N) =
     "vol" \( v \) . $ <eq:E-laplace>]
  There are finitely many jumps below each bound, and polynomial growth controls the tail.
  Choose a homogeneous basis of $"gr"_w R \/ \( "in"_w f \)$, lift it homogeneously,
    and multiply the lifts by all nonnegative powers of $"in"_w f$. This is a basis of $"gr"_w R$:
    its independence follows from the domain property, and successive division lowers the degree by $w \( f \) >
    0$, proving spanning. Lift this basis to products $a_i f^j$ in $R$.
    They span modulo arbitrary high $w$-ideals, hence modulo high $u$-ideals since $u gt.eq t w$.
    The $u$-value of $a_i f^j$ is at least $t w \( a_i \) + j \( t w \( f \) + \( 1 - t \) v \( f \) \)$.
    Consequently its Laplace sum is at most the $w$-Laplace sum at $N \/ t$, multiplied by
  $ frac(1 - e^(- t w \( f \) \/ N), 1 - e^(- \( t w \( f \) + \( 1 - t \) v \( f \) \) \/ N)) . $
  Use (5.15) to obtain (5.13).
  For the strict gap, fix $T > 3$ and work in $V_N = R \/ frak(m)^(ceil.l C T N ceil.r)$,
    where $C$ is large enough for this fixed triple of centred valuations.
    The indicated power is contained in all their threshold-$T N$ ideals.
    Cap both the $w$ and $v$ flags at $T N$ and choose a basis simultaneously adapted to these two flags;
    denote its capped values by $W_i \, V_i$. Lifts have $u$-value at least $\( W_i + V_i \) \/ 2$. The identity
  $ e^(- W_i \/ N) + e^(- V_i \/ N) - 2 e^(- \( W_i + V_i \) \/ \( 2 N \)) =
    #scale(x: 120%, y: 120%)[\(] e^(- W_i \/ \( 2 N \)) - e^(- V_i \/ \( 2 N \)) #scale(x: 120%, y: 120%)[\)]^2 $
  therefore bounds twice the capped $u$-Laplace sum above by the sum of the other two, less the sum of these squares.
  Choose a vector-space complement to $frak(a)_(gamma N \/ 4) \( w \)$ in $R$ and multiply it by
    $f^(floor.l N \/ w \( f \) floor.r)$. Every nonzero resulting element has $w$-value less than
    $\( 1 + gamma \/ 4 \) N$ and, for large $N$, has $v$-value at least $\( 1 + 2 gamma \/ 3 \) N$.
    Multiplication is injective, and this subspace remains injective in $V_N$ by its upper $w$-value bound.
    Its dimension is asymptotic to
  $ frac("vol" \( w \), n !) \( gamma N \/ 4 \)^n . $
  Its projection from the high-$v$ subspace modulo the high-$w$ subspace has this rank.
    Hence at least this many entries of a simultaneously adapted basis satisfy $W_i < \( 1 + gamma \/ 4 \)
    N$ and $V_i gt.eq \( 1 + 2 gamma \/ 3 \) N$. Each contributes at least
  $ (e^(- \( 1 + gamma \/ 4 \) \/ 2) - e^(- \( 1 + 2 gamma \/ 3 \) \/ 2))^2 $
  to the preceding sum of squares. Divide by $N^n$, first let $N arrow.r oo$, and then let $T arrow.r oo$.
    The capped tail errors are bounded by polynomial functions of $T$ times $e^(- T)$ and disappear.
    This proves (5.14), for example with any smaller positive constant than
  $ frac(\( gamma \/ 4 \)^n, n !) (e^(- \( 1 + gamma \/ 4 \) \/ 2) - e^(- \( 1 + 2 gamma \/ 3 \) \/ 2))^2 . $
  Finally interpolate two near-minimizers by Lemma 33. Their interpolant has at least the minimum volume.
    If their values on some regular function differed by a fixed factor greater than one, apply (5.14),
    interchanging the valuations if necessary. It gives a fixed relative loss, contrary to near-minimality.
    This proves the simultaneous all-functions assertion and its fixed-error version. ◻
]

=== 5.3 Exact realization by a rational klt pair <exact-realization-by-a-rational-klt-pair>

We have established compactness, a uniform comparison with monomial retraction,
  and strict volume improvement when two valuations differ.
  The remaining task is to encode the finite order constraints in an lc boundary and then choose one rational
  perturbation for which every ordinary minimizer lies exactly on its zero-discrepancy locus.
  The parameter must work for all competing valuations at once.

#thm([Lemma 5.7.])[
  (A boundary encoding the common slice).  #emph[Choose positive rational numbers $theta_j$ with $sum_j theta_j <
    1$. For sufficiently general scalars $a_j$, put $E_j = "div" \( h^(m_j) + a_j F_j \)$ and
#[#set math.equation(numbering: n => "(5.16)")
 $ Psi = \( 1 - sum_j theta_j \) H + sum_j theta_j / m_j E_j . $ <eq:E-slice-boundary>]

 Then $Psi$ is effective and lc, and its nonzero zero-discrepancy rays over the germ are exactly the common lc
   rays. On every such ray,
#[#set math.equation(numbering: n => "(5.17)")
 $ v \( h^(m_j) + a_j F_j \) = m_j v \( h \) . $ <eq:E-pencil-order>]

 In particular, the coefficients $theta_j$ may be chosen arbitrarily small while retaining these conclusions.]
] <lem:E-slice-boundary>

#proof[
  Set $frak(b)_j = \( h^(m_j) \, F_j \)$. For any valuation,
  $ A \( v \) & - \( 1 - sum_j theta_j \) v \( h \) - sum_j theta_j / m_j v \( frak(b)_j \)\
 & = A \( v \) - v \( h \) + sum_j theta_j (v \( h \) - min { v \( h \) \, v \( F_j \) \/ m_j }) gt.eq 0 . $
  Equality holds exactly on the common lc rays, together with the trivial valuation.
    Resolve the ideals and choose the $E_j$ as general members of their pencils.
    On the resolution the residual free members meet the existing boundary with snc support and contain none of
    its strata. Their coefficients $theta_j \/ m_j$ are less than one.
    They therefore introduce no new zero-discrepancy strata, proving the assertion about $Psi$.
    On the coefficient-one monomial skeleton, each free residual member has value zero because it contains no
    stratum. The value of its pencil member is consequently the fixed-ideal value $min { m_j v \( h \) \,
    v \( F_j \) } = m_j v \( h \)$, proving (5.17). ◻
]

#thm([Theorem 5.8.])[
  (Exact common-slice minimizer).  #emph[For every allowed height $b$,
    the homogeneous functional $b \( v \) "vol" \( v \)^(1 \/ n)$ on centred common lc rays has a unique
    minimizing ray. Its $A = 1$ representative depends continuously on the coefficients of $b$ while the height
    stays strictly positive on the fixed slice. It is fixed by every automorphism preserving the slice and the height.]
  #emph[If the coefficients of $b$ are rational, its minimizer $w$ is the normalized-volume minimizer of an
    effective rational klt pair on $x in S$. More precisely, one can choose an effective rational lc Cartier
    boundary $Psi$ with exactly the common lc rays as its zero-discrepancy locus,
    and one positive rational number $lambda$, fixed independently of the competing valuation, such that
#[#set math.equation(numbering: n => "(5.18)")
 $ Psi_lambda = Psi - lambda b_0 H + lambda sum_ell b_ell "div" \( G_ell \) $ <eq:E-klt-perturbation>]

 is effective and klt, and $w$ minimizes $hat("vol")_(S \, Psi_lambda)$ among all centred valuations.
   On the common lc rays its discrepancy is $lambda b$.]
  #emph[For the same rational height, the algebra $"gr"_w R$ is finitely generated and normal.
    Its spectrum $S^0$ is a klt $bb(Q)$-Gorenstein cone. Write $h^0 \, F_j^0 \, G_ell^0$ for initial forms,
    $w^0$ for the grading valuation, and $cal(Q)^0 \, b^0$ for the analogous central slice and height.
    Then $\( S^0 \, "div" \( h^0 \) \)$ is lc, $A_(S^0) \( w^0 \) = w^0 \( h^0 \) = 1$, $w^0 in cal(Q)^0$,
    and $b^0$ is strictly positive on $cal(Q)^0$. The valuation $w^0$ minimizes $b^0
    "vol"^(1 \/ n)$ on its centred part.]
] <thm:E-exact-minimizer>

#proof[
  #emph[Attainment, uniqueness, and continuity.] Compactness gives $min_(cal(Q)) b > 0$.
    A minimizing sequence has bounded volume, so (5.8) bounds its maximal-ideal values away from zero.
    A subsequence converges in $cal(Q)$ to a centred valuation.
    Lemma 31 gives volume continuity and hence attainment. If two minimizing rays existed, normalize each by $b =
    1$. Their midpoint has a dominating common lc interpolant $u$ with $b \( u \) lt.eq 1$.
    If the minimum value of $b "vol"^(1 \/ n)$ is $M$, then $"vol" \( u \) gt.eq M^n \/ b \( u \)^n gt.eq M^n$.
    The strict gap (5.14) contradicts this unless the two height-normalized valuations agree on every regular
    function. Thus they are the same ray. For heights whose coefficients converge to those of a positive height,
    the minimum heights stay bounded below and one fixed centred competitor bounds the minimum values above.
    The same compactness argument shows that every subsequential limit of minimizers is the unique limiting
    minimizer. This proves continuity. Automorphisms preserving the data preserve the functional,
    so uniqueness proves equivariance.
  #emph[Perturbing the boundary.] Assume from now on that the height is rational.
    Choose $Psi$ by Lemma 36, and resolve additionally all $G_ell$ and $frak(m)$.
    For small rational $lambda > 0$, (5.18) is effective, since the coefficient of $H$ in (5.16) is positive.
    It is klt near $x$: on each coefficient-one component its new discrepancy is $lambda b > 0$,
    while the other finitely many resolved discrepancies remain positive for sufficiently small $lambda$.
    The log-smooth criterion then tests every valuation.
  #emph[Uniform control of every relevant competitor.] Let $v$ be a centred quasi-monomial valuation with
    $A \( v \) = 1$ and
  #[#set math.equation(numbering: n => "(5.19)")
   $ A_(S \, Psi_lambda) \( v \) "vol" \( v \)^(1 \/ n) lt.eq lambda M_0 \, $ <eq:E-sublevel>]
  where $M_0$ is the value of $b "vol"^(1 \/ n)$ at one fixed centred point of $cal(Q)$.
    This includes every normalized-volume minimizer of the klt pair.
    Existence and quasi-monomiality for effective rational klt pairs are supplied by #cite(label("Blum"))
    Section 7 and #cite(label("XuQuasimonomial")) Theorem 1.2.
    The following constants are uniform over #emph[all] valuations in (5.19) and all sufficiently small $lambda$.
  Put $e = A_(S \, Psi) \( v \) gt.eq 0$ and retract $v$ to the coefficient-one part of the fixed resolution,
    obtaining $r$. Izumi bounds every fixed function value at $v$ when $A \( v \) = 1$;
    thus $\| b \( v \) \| lt.eq C$. The first bound in (5.8) and (5.19) give
  $ e + lambda b \( v \) lt.eq C lambda \, wide e lt.eq C lambda . $
  Equation (5.7) yields
  #[#set math.equation(numbering: n => "(5.20)")
   $ A_S \( r \) = 1 + O \( e \) \, wide b \( v \) = b \( r \) + O \( e \) . $ <eq:E-uniform-retraction>]
  For small $lambda$, $r$ is nontrivial and its normalized ray lies in $cal(Q)$.
    Strict positivity of $b$ on the compact slice therefore gives uniform constants $beta \, B > 0$ with
  $ beta lt.eq b \( r \) lt.eq B \, wide b \( v \) gt.eq beta \/ 2 . $
  The sublevel inequality now bounds $"vol" \( v \)$ above.
    The second bound in (5.8) bounds $v \( frak(m) \)$ below; since $frak(m)$ was resolved,
    its value at $r$ differs by $O \( e \)$. Thus $r \( frak(m) \)$ is also bounded below and $r$ is an admissible
    centred competitor. Corollary 32 supplies
  #[#set math.equation(numbering: n => "(5.21)")
   $ v \( f \) lt.eq \( 1 + C e \) r \( f \) wide upright("for every ") f in R \, $ <eq:E-fixed-comparison>]
  with a single $C$ independent of $f$, $v$, and small $lambda$.
  #emph[One fixed parameter forces exactness.] Use (5.20) and (5.21) to obtain
  #[#set math.equation(numbering: n => "(5.22)")
   $ & \( e + lambda b \( v \) \) "vol" \( v \)^(1 \/ n) - lambda b \( r \) "vol" \( r \)^(1 \/ n)\
 & #h(1cm)  gt.eq frac(e thin \[ 1 - lambda C' - lambda C b \( r \) \], 1 + C e) "vol" \( r \)^(1 \/ n) .
   $ <eq:E-exact-excess>]
  Choose #emph[one] positive rational $lambda$ small enough for all preceding bounds and for
    $lambda \( C' + C B \) < 1$. This choice depends only on the fixed germ, boundary, and height;
    it is independent of every competitor in (5.19) and of every regular function.
    If such a competitor has $e > 0$, (5.22) is strictly positive,
    so retraction strictly improves its normalized-volume root functional.
    An actual klt minimizer consequently has $e = 0$, lies exactly on the common lc slice,
    and is $w$ by uniqueness. Every competitor outside (5.19) already has larger value than the fixed slice
    competitor. This proves exact realization for this single rational parameter;
    it is not merely a limiting assertion as $lambda arrow.r 0$.
    The argument applies for every smaller positive rational parameter satisfying the same bounds.
  #emph[Stable degeneration of this actual minimizer.] We now apply stable degeneration to the effective rational
    klt pair $\( S \, Psi_lambda \)$ and its actual minimizer $w$.
    By #cite(label("XuZhuangStable")) Theorems 1.1–1.2, its associated graded is finitely generated and defines a
    normal klt log Fano cone pair $\( S^0 \, Psi_lambda^0 \; w^0 \)$.
    The grading minimizes normalized volume on the central pair;
    ordinary volume and pair discrepancy are preserved, as in #cite(label("LiXuStable")) Lemma 4.10 and
    Theorem 3.5, arXiv version. The general uniqueness theorem for the klt-pair minimizer is
    #cite(label("XuZhuangUnique")) Theorem 1.1; the constrained uniqueness needed here was proved before invoking it.
  Each component used in (5.18) is the divisor of a regular function.
    For a principal ideal $\( f \)$ and a valuation filtration,
    multiplicativity gives $"in"_w \( \( f \) \) = \( "in"_w f \)$.
    Equivalently its Rees homogenization, using its exact order, cuts a Cartier divisor without a fibre component.
    Hence $Psi_lambda^0$ is an effective rational sum of principal Cartier divisors.
    Since $K_(S^0) + Psi_lambda^0$ is $bb(Q)$-Cartier, so is $K_(S^0)$,
    and removing the effective boundary shows that $S^0$ is klt.
    Preservation of pair discrepancy and of all equation orders gives
  $ A_(S^0) \( w^0 \) = A_S \( w \) = 1 \, quad w^0 \( h^0 \) = 1 \, quad w^0 \( F_j^0 \) = w \( F_j \) gt.eq m_j . $
  The choice of the $theta_j$ can be made arbitrarily small.
    For each such choice the exact minimizer is still the unique $w$,
    and thus the graded algebra remains the same. Choose the corresponding $lambda$ smaller as necessary.
    The central effective klt boundaries then contain $\( 1 - o \( 1 \) \) "div" \( h^0 \)$.
    For every prime over $S^0$, the resulting discrepancy inequalities imply, on taking the coefficient limit,
    $A_(S^0) \( E \) gt.eq "ord"_E \( h^0 \)$. This proves that $\( S^0 \, "div" \( h^0 \) \)$ is lc.
  Finally take $v' in cal(Q)^0$. By (5.17), the initial equation of $h^(m_j) +
    a_j F_j$ is either $\( h^0 \)^(m_j)$, or $\( h^0 \)^(m_j) + a_j F_j^0$ when $w \( F_j \) = m_j$.
    In either case its $v'$-value is at least $m_j v' \( h^0 \)$. Therefore
  #[#set math.equation(numbering: n => "(5.23)")
   $ 0 < A_(S^0 \, Psi_lambda^0) \( v' \) lt.eq lambda b^0 \( v' \) \, $ <eq:E-central-discrepancy>]
  with equality on the right at $w^0$. The left inequality proves positivity of $b^0$ on the entire common slice,
    including its noncentred faces. For centred $v'$, central normalized-volume minimality and (5.23) give
  $ lambda b^0 \( v' \) "vol" \( v' \)^(1 \/ n) gt.eq A_(S^0 \, Psi_lambda^0) \( v' \) "vol" \( v' \)^(1 \/ n)
    gt.eq lambda b^0 \( w^0 \) "vol" \( w^0 \)^(1 \/ n) . $
  This is the required constrained minimality on the central slice. ◻
]

#thm([Corollary 5.9.])[
  (Near-minimizers for a height).  #emph[Fix an allowed height $b$ and normalize its common rays by $b = 1$.
    If $w_i \, v_i$ have functional values within relative $o \( 1 \)$ of the minimum,
    then $w_i = \( 1 + o \( 1 \) \) v_i$ on all regular functions, with an error independent of the function.
    The same conclusion, after $A = 1$ normalization, holds for minimizers of heights whose coefficients converge
    to those of $b$.]
] <cor:E-height-near-minimizers>

#proof[
  For the height-normalized pair, the midpoint interpolant has height at most one.
    Its volume is therefore at least the minimum of volume on the height-one slice.
    The proof using (5.14) applies verbatim: any fixed separation on one function would force a fixed relative
    volume loss. For converging heights $b_i$, positivity on the compact slice gives $b_i \/ b = 1 +
    o \( 1 \)$ uniformly. Their minimizing rays, normalized by $b = 1$, are thus near-minimizers for $b$,
    and the preceding assertion applies. Evaluation on $h$, which equals $A$ on the common rays,
    shows that the factors needed to normalize by $A = 1$ converge as well. ◻
]

#thm([Corollary 5.10.])[
  (Domination by the minimizer).  #emph[For the minimizing ray $w$ and every $v in cal(Q)$,
#[#set math.equation(numbering: n => "(5.24)")
 $ frac(v \( f \), b \( v \)) lt.eq 2^n frac(w \( f \), b \( w \)) wide \( f in R \) . $ <eq:E-domination>]

 For rational heights the same statement holds on the central slice with all symbols carrying a superscript $0$.]
] <cor:E-domination>

#proof[
  Normalize both rays by $b = 1$ and interpolate them with weights $1 \/ 2$.
    The resulting centred $u$ has $b \( u \) lt.eq 1$, so minimality gives $"vol" \( u \) gt.eq "vol" \( w \)$.
    For $w \( f \) > 0$, (5.13) gives
  $ 1 lt.eq 2^n frac(w \( f \), w \( f \) + v \( f \)) . $
  Thus $v \( f \) lt.eq \( 2^n - 1 \) w \( f \)$, which implies the stated bound.
    If $f$ is a unit both values are zero. The central assertion follows from the same argument and Theorem 37. ◻
]

#thm([Lemma 5.11.])[
  (One-sided height tilt).  #emph[Let $G in R \\ { 0 }$, $m in bb(Z)_(> 0)$, and $g \( v \) = v \( G \) \/ m -
    v \( h \)$. Suppose $g \( v \) \/ v \( h \) gt.eq 2 c$ on some common lc ray, where $c > 0$ is rational. Set
$ M = max_(cal(Q)) g gt.eq 2 c \, wide mu_(*) = \( M - c \)^(- 1) \, wide b_mu \( v \) = v \( h \) +
  mu \( c v \( h \) - g \( v \) \) . $

 For $0 lt.eq mu < mu_(*)$ the height is positive. There is a rational $mu$ in this interval whose $A =
   1$ minimizing valuation $w$ satisfies
$ g \( w \) > 0 \, wide b_mu \( w \) gt.eq 1 . $

 Moreover $b_mu lt.eq 2 + 1 \/ c$ on $cal(Q)$, and the corresponding central height obeys the same bound on $cal(Q)^0$.]
] <lem:E-one-sided-tilt>

#proof[
  As $mu arrow.t mu_(*)$, the minimum of $b_mu "vol"^(1 \/ n)$ tends to zero.
    To prove this even when an endpoint zero occurs at a noncentred valuation $v$,
    interpolate $v$ with one fixed centred point $w_1 in cal(Q)$, giving $w_1$ weight $t$.
    For $0 < mu_(*) - mu lt.eq t$, the interpolant $u$ has $b_mu \( u \) = O \( t \)$.
    Since $v \( h \) = w_1 \( h \) = 1$, the improved volume estimate (5.13), applied with $f = h$,
    gives $"vol" \( u \) lt.eq t^(1 - n) "vol" \( w_1 \)$. Hence $b_mu \( u \) "vol" \( u \)^(1 \/ n) =
    O \( t^(1 \/ n) \)$. The lower volume bound in (5.8) then forces the minimizing height to tend to zero.
    In particular its minimizing valuation eventually has $g \( w \) > c$.
  If the minimizer at $mu = 0$ has $g \( w \) > 0$, take $mu = 0$.
    Otherwise continuous dependence in Theorem 37 gives a nonempty open interval of parameters for which $0 <
    g \( w \) < c$. Choose a rational parameter in that interval.
    Then $b_mu \( w \) = 1 + mu \( c - g \( w \) \) gt.eq 1$.
    Finally $v \( G \) gt.eq 0$ gives $g \( v \) gt.eq - 1$ on the normalized slice, while $mu < mu_(*) lt.eq
    1 \/ c$. Thus $b_mu \( v \) lt.eq 1 + \( c + 1 \) \/ c = 2 + 1 \/ c$.
    The same calculation applies centrally because $G^0$ is regular and $v' \( h^0 \) = 1$ on $cal(Q)^0$. ◻
]

== 6 Degeneration, exact sign transfer, and rank refinement <sec:F>

We work with a complex klt germ $x in S$ of dimension $n$,
  a nonzero regular function $h$ such that $\( S \, H \)$ is lc, where $H = "div" \( h \)$,
  and a rational top form $omega$ with $"div"_S \( omega \) = 0$.
  Thus the reflexive canonical sheaf is trivialized by $omega$.
  A finite cyclic group $G$ fixes $x$ and acts quasi-étale on $S$; we replace it by its effective image.
  Suppose that $h$ and $omega$ have the same character $chi$.
  In particular, $omega \/ h$ descends to the quotient. Fix invariant ratios

$ f_j = F_j \/ h^(m_j) \, wide F_j in cal(O)_(S \, x) \\ { 0 } \, quad m_j in bb(N)_(> 0) . $

The common slice consists of the $h$-lc valuations satisfying $q \( f_j \) gt.eq 0$,
  with the convention on centres from Section 5: the closed image of the centre contains $x$.
  Unless another normalization is displayed, $q \( h \) = A_S \( q \) = 1$.

Let $w$ be a centred $G$-invariant quasi-monomial valuation for which

$ breve(R) = "gr"_w cal(O)_(S \, x) $

is finitely generated, normal, and klt. These are hypotheses here;
  they are supplied in our applications by the exact optimizer of Section 5.
  Write $S^0 = "Spec" breve(R)$, with vertex $o$, and denote initial symbols by a bar.
  The fine grading is by the finitely generated value group $Lambda_w subset bb(R)$,
  so evaluation at $w$ is injective on this lattice. Its torus will be denoted by $bb(T)_w$.
  Taking invariants in each filtered exact sequence gives

#[#set math.equation(numbering: n => "(6.1)")
 $ "gr"_w \( cal(O)_(S \, x)^G \) = breve(R)^G . $ <eq:F-invariant-graded>]

Indeed, the Reynolds operator makes taking invariants exact in characteristic zero.
  The weight lattices of $breve(R)$ and $breve(R)^G$ have finite index in one another, and hence the same rank.

=== 6.1 Presentations and rational approximations <presentations-and-rational-approximations>

#thm([Lemma 6.1.])[
  (Weighted presentations).  #emph[Choose $x_1 \, dots.h \, x_N in frak(m)_x$ whose symbols generate $breve(R)$,
    and put $alpha_i = w \( x_i \) > 0$. Any prescribed finite list of functions of positive $w$-value can be
    included in this list. Then
#[#set math.equation(numbering: n => "(6.2)")
 $ hat(cal(O))_(S \, x) = bb(C) \[ \[ X_1 \, dots.h \, X_N \] \] \/ I \, wide breve(R) =
   bb(C) \[ X_1 \, dots.h \, X_N \] \/ "in"_alpha I \, $ <eq:F-presentation>]

 where initial forms have least weight. The valuation ideals are exactly the images of the ideals generated by
   monomials of weight at least the prescribed threshold. The same description holds before completion by intersection.]
  #emph[For every sufficiently nearby linear functional $L : Lambda_w ⊗ bb(R) arrow.r bb(R)$,
    positive on the listed weights, the vector $alpha_L = \( L \( alpha_i \) \)$ gives the same initial ideal,
    with its grading composed with $L$. Its filtration defines a centred quasi-monomial valuation $w_L$.
    The functionals can be chosen rational, and the resulting valuations can be computed monomially on a fixed
    smooth chart for $w$.]
] <lem:F-presentation>

#proof[
  Subduction subtracts a polynomial in the $x_i$ with the prescribed initial symbol,
    then repeats at a strictly larger value. There are only finitely many values in a bounded interval:
    each is a nonnegative integral combination of the finitely many positive $alpha_i$.
    The Izumi upper bound for the fixed valuation $w$ implies that remainders whose $w$-values tend to infinity
    tend to zero in the $frak(m)_x$-adic topology. In particular $frak(m)_x subset \( x_1 \, dots.h \, x_N \) +
    frak(m)_x^2$, and Nakayama’s lemma shows that the $x_i$ generate $frak(m)_x$.
    Completed subduction proves both assertions in (6.2) and the assertion about threshold ideals.
    Monomial threshold ideals are finitely generated. Their completed extensions intersect the local ring in the
    original ideals, by faithful flatness of completion.
  We record why the dimension and primeness arguments used below are valid also for other positive weight vectors.
    For any such vector $gamma$, its monomial filtration is bounded above and below by fixed linear reindexings of
    the $frak(m)_x$-adic filtration. Consequently its cumulative quotient lengths grow with exponent $n$.
    The associated graded algebra is $bb(C) \[ X \] \/ "in"_gamma I$;
    comparison of its positive weighted filtration with ordinary polynomial degree shows that its growth exponent
    is its Krull dimension. Thus this dimension is $n$. If $"in"_gamma I$ is prime,
    the filtration is multiplicative and separated, and defines a valuation.
    If its value group has rational rank $r$, the degree-zero homogeneous fraction field is its residue field and
    has transcendence degree $n - r$. This proves Abhyankar equality.
    Local monomialization of Abhyankar valuations in characteristic zero #cite(label("JonssonMustata"))
    Proposition 3.7 then makes the valuation quasi-monomial.
  Take finitely many series in $I$ whose $alpha$-initials generate $"in"_alpha I$.
    Their leading faces persist after composition with $L$: ties are preserved because their fine weights are
    equal, and positivity leaves only finitely many other terms that could compete in a fixed neighbourhood of
    $alpha$. Therefore
  $ "in"_alpha I subset "in"_(alpha_L) I . $
  The first ideal is prime, and both quotients have dimension $n$.
    A nonzero ideal in a finitely generated domain lowers its dimension, so this inclusion is equality.
  For the final assertion, use a smooth monomial chart for $w$ at its stratum and expand the finitely many $x_i$
    over the residue coefficient field. Their leading faces are finite polynomials in the stratum parameters.
    The weights of these parameters belong to $Lambda_w$. Composing them with nearby rational $L$ preserves the
    same leading polynomials. The resulting monomial valuation dominates the presentation filtration.
    The induced map from the presentation graded algebra to the graded ring of this monomial valuation is
    injective: the polynomial relations among these leading polynomials are exactly the old relations,
    unchanged by regrading. Hence the two valuations agree on every function. ◻
]

=== 6.2 The canonical calculation before lc equality <the-canonical-calculation-before-lc-equality>

Xu–Zhuang study specialization of non-degenerate reflexive differential forms under stable degeneration of klt
  singularities #cite(label("XuZhuangForms")) Theorem 1.1 and Section 3.
  The calculation below tracks a divisor-free canonical generator,
  including its finite-group character and any additional grading,
  under the finitely generated degeneration used here. We give this calculation before imposing lc equality
  because it will also be used to prove that equality after two gradings are compressed.

#thm([Proposition 6.2.])[
  (Canonical forms under degeneration).  #emph[Under the hypotheses preceding Lemma 41,
    $S^0$ has a divisor-free reflexive canonical generator $omega^0$. It has the $G$-character of $omega$.
    It is homogeneous for $bb(T)_w$, and its weight $kappa$ satisfies
#[#set math.equation(numbering: n => "(6.3)")
 $ chevron.l w \, kappa chevron.r = A_S \( w \) . $ <eq:F-canonical-weight>]

 If an additional torus acts on the original germ, preserves $w$, and makes $omega$ homogeneous,
   its character is preserved separately. None of these assertions assumes $A_S \( w \) = w \( h \)$.
   Moreover the action of $G$ on $S^0$ is quasi-étale.]
] <prop:F-canonical-degeneration>

#proof[
  First track discrepancy under the rational approximations of Lemma 41.
    On a fixed monomial chart with stratum parameters $z_1 \, dots.h \,
    z_r$ and separating residue coordinates $y_1 \, dots.h \, y_(n - r)$, write
  $ omega = psi thin frac(d z_1, z_1) and dots.h.c and frac(d z_r, z_r) and d y_1 and dots.h.c and d y_(n - r) . $
  The quasi-monomial discrepancy formula gives $A_S \( w \) = w \( psi \) in Lambda_w$.
    Include numerators and denominators of the rational function $psi$ among the finite functions whose leading
    faces are tracked. The same formula on the same chart then gives the exact identity
  #[#set math.equation(numbering: n => "(6.4)")
   $ A_S \( w_L \) = L \( A_S \( w \) \) . $ <eq:F-discrepancy-approximation>]
  In particular this is an identity of linear weights, rather than only a limiting assertion about discrepancies.
  Choose rational $L$ and multiply it by a positive integer so that the presentation weights are positive
    integers. In this paragraph write $v$ for this integral scaling of $w_L$, and $a_i = v \( x_i \)$.
    After shrinking to a $G$-stable affine neighbourhood, the $x_i$ have common zero set ${ x }$.
    Define the extended Rees algebra
  #[#set math.equation(numbering: n => "(6.5)")
   $ cal(R) = cal(O) \( S \) \[ t \, x_1 t^(- a_1) \, dots.h \, x_N t^(- a_N) \] subset
     cal(O) \( S \) \[ t \, t^(- 1) \] . $ <eq:F-rees>]
  The threshold-ideal description proves that its special fibre is the graded algebra in (6.2);
    positive-level quotients are supported at $x$, so the affine and local constructions have the same special
    fibre. This algebra is of finite type and torsion free over $bb(C) \[ t \]$, hence flat.
    Let $cal(S) = "Spec" cal(R)$ and $E = \( t = 0 \)$. The divisor $E$ is normal, integral, reduced, and Cartier,
    and $cal(S) \\ E = S times bb(G)_m$.
  The total space is normal. Away from $E$ this follows from the normality of $S$.
    At points on $E$, the nonzerodivisor $t$ and the $S_2$ property of $cal(R) \/ \( t \)$ imply $S_2$ for
    $cal(R)$. At the generic point of $E$, the quotient by $t$ is a field,
    so the total local ring is a regular discrete valuation ring. These observations give $R_1$ as well.
  The order along $E$ restricts to $v$ on $bb(C) \( S \)$ and takes value one on $t$.
    Indeed, the residues of $f t^(- v \( f \))$ are the nonzero graded symbols of $f$,
    and the direct grading prevents cancellation between distinct such leading terms.
    It is the Gauss extension of $v$. The monomial log-form computation gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ "div"_(cal(S)) (omega and frac(d t, t)) = \( A_S \( v \) - 1 \) E . $ <eq:F-rees-log-order>]
  For example, on a model where the rational valuation $v$ is $c "ord"_P$,
    use a uniformizer of $P$ and separating residue coordinates.
    The extension has weights $\( c \, 1 \)$ on that uniformizer and $t$;
    the wedge of their logarithmic differentials has log order zero,
    while the remaining coefficient has value $c A_S \( "ord"_P \) = A_S \( v \)$.
    This proves the coefficient in (6.6). There are no other divisor coefficients,
    since off $E$ the form is the product of the divisor-free $omega$ and $d t \/ t$.
  Since $K_S$ is Cartier and $v$ has integral values, $A_S \( v \)$ is an integer. Therefore
  $ eta = t^(- A_S \( v \)) omega and frac(d t, t) wide upright("satisfies") wide "div"_(cal(S)) \( eta \) = - E . $
  This establishes that the ordinary canonical divisor of the total space is Cartier.
    At every codimension-one point of $E$, the fibre is regular and the flat morphism to the line is smooth.
    The residue of $eta$ is consequently a rational top form on $E$ with neither zeros nor poles at any
    codimension-one point. It trivializes the reflexive canonical sheaf of $E$.
    In particular this establishes ordinary canonical Cartierness, not just Cartierness after adding a boundary.
  Give $t$ weight $- 1$ and $x_i t^(- a_i)$ weight $a_i$. The residue has weight $A_S \( v \)$ and the same
    $G$-character as $omega$. If an old torus is present, choose homogeneous generators;
    $t$ is invariant for that torus, so its canonical character is unchanged.
    In the cone case such homogeneous generators have common zero only at the vertex:
    their common zero set is invariant and is isolated there,
    whereas the closure of every positive-grading orbit contains the vertex.
  Units of a positively graded affine domain with degree-zero part $bb(C)$ are constant.
    Hence any two divisor-free canonical generators on $E$ differ by a scalar.
    The full fine grading torus therefore acts on the generator by a character $kappa$,
    independent of the rational regrading used to construct it.
    For all nearby rational $L$, its evaluation is $L \( A_S \( w \) \)$ by (6.4) and the residue computation.
    Equality on this open set of rational functionals identifies the two lattice weights and proves (6.3),
    including its equivariant version.
  Finally suppose a nonidentity element of $G$ acquired a fixed locus of codimension at most one on $E$.
    At a general point of that locus the fibre, and hence the morphism $cal(S) arrow.r bb(A)^1$, is smooth.
    The fixed locus of the cyclic subgroup generated by that element is smooth there.
    Its tangent space is the invariant tangent subspace, and it maps surjectively to the tangent space of the
    line: averaging a lift of the base tangent vector gives an invariant lift.
    Thus this fixed locus is smooth over the line and has the same fibre codimension on nearby nonzero fibres.
    This contradicts quasi-étaleness of the original effective action. The action on $S^0$ is therefore quasi-étale. ◻
]

#thm([Corollary 6.3.])[
  (Lc equality and principal boundaries).  #emph[If $w$ is $h$-lc,
    then $\( S^0 \, "div" \( macron(h) \) \)$ is lc and $omega^0$ has the same fine torus weight and $G$-character
    as $macron(h)$. Consequently $omega^0 \/ macron(h)$ is invariant,
    and the quotient cone has the log-form data of Section 4.
    If $Delta$ is any effective rational sum of principal divisors near $x$,
    with $\( S \, Delta \)$ lc and $A_S \( w \) = w \( Delta \)$, its initial boundary $Delta^0$ is lc on $S^0$.
    All these assertions also hold with specified additional equivariant gradings.]
] <cor:F-lc-degeneration>

#proof[
  Include the finitely many boundary equations in the presentation.
    Their orders and discrepancy equality persist exactly under rational regrading.
    In (6.5), each equation $f$ has homogenization $f t^(- v \( f \))$,
    which is a nonzerodivisor and has no component $E$; it restricts to $macron(f)$ on $E$.
    In particular the initial boundary is rationally Cartier.
    The morphism $cal(S) arrow.r S times bb(A)^1$ is birational.
    Comparing the coefficient at its only vertical prime by (6.6) shows that
  $ \( cal(S) \, E + Delta_(cal(S)) \) arrow.r \( S times bb(A)^1 \, Delta times bb(A)^1 + S times { 0 } \) $
  is crepant precisely when $A_S \( v \) = v \( Delta \)$. Its source is therefore lc,
    and lc adjunction gives the stated central pair. At codimension-one points of the normal Cartier fibre the
    morphism is smooth, so the different is exactly the ordinary restriction of the homogenized boundary.
    Apply this to $Delta = H$. Formula (6.3) and injectivity of evaluation on $Lambda_w$ identify the weight of
    $omega^0$ with that of $macron(h)$. Quasi-étaleness and the finite-map discrepancy formula descend klt, lc,
    and the invariant log form to the quotient. A suitable power of $omega^0$ descends to a divisor-free
    pluricanonical form. ◻
]

=== 6.3 An exact bridge for inequalities <an-exact-bridge-for-inequalities>

#thm([Proposition 6.4.])[
  (Sign transfer).  #emph[Suppose $w$ is common $h$-lc and $w \( f_j \) = 0$ for every $j$.
    Let $g = U \/ h^b$, where $0 eq.not U in cal(O)_(S \, x)$, $b in bb(N)_(> 0)$, and $w \( g \) = 0$.
    Let $cal(Q)$ be the actual common slice and $cal(Q)^0$ the common slice defined by $macron(h)$ and the
    $macron(f)_j$ on $S^0$. Then
#[#set math.equation(numbering: n => "(6.7)")
 $ q \( g \) lt.eq 0 quad \( q in cal(Q) \) quad arrow.l.r.double quad q^0 \( macron(g) \) lt.eq
   0 quad \( q^0 in cal(Q)^0 \) . $ <eq:F-bridge>]

 One may add any finite list of tests of value zero at $w$.
   There is no bound on the degree or the cost of $g$ in this statement.]
] <prop:F-bridge>

#proof[
  Use Lemma 36 to encode the common slice. Choose positive rational $theta_j$ with $sum_j theta_j <
    1$ and sufficiently general scalars $lambda_j$, and set
  #[#set math.equation(numbering: n => "(6.8)")
   $ P_j = h^(m_j) + lambda_j F_j \, wide Psi = \( 1 - sum_j theta_j \) H + sum_j theta_j /
     m_j "div" \( P_j \) . $ <eq:F-test-boundary>]
  The lemma says that $Psi$ is effective and lc, with exactly the common rays as its nonzero zero-discrepancy
    rays. It also gives $q \( P_j \) = m_j q \( h \)$ on every common ray.
    These two properties let us express a sign inequality as log canonicity of a small boundary perturbation.
  Assume the left side of (6.7). For sufficiently small positive rational $delta$ the divisor
  #[#set math.equation(numbering: n => "(6.9)")
   $ Psi_delta = Psi + delta \( "div" \( U \) - b H \) $ <eq:F-perturbed-boundary>]
  is effective and lc near $x$. Here is the exact reason for smallness sufficing.
    The coefficient of $H$ in (6.8) has a positive reserve, which preserves effectivity.
    On a fixed log resolution including $U$, every coefficient below one stays below one for small $delta$;
    for a coefficient-one prime the discrepancy change is $- delta q \( g \) gt.eq 0$.
    Checking these finitely many components checks lc on the entire resolution.
    Restricting the germ if necessary discards centres whose closed image does not contain $x$.
    No uniform choice of $delta$ in $U$ is needed.
  All equations in (6.9) have their expected orders at $w$, and $A_S \( w \) =
    w \( Psi_delta \)$ because $w \( g \) = w \( f_j \) = 0$. Corollary 43 gives an lc initial boundary.
    For every $q^0 in cal(Q)^0$,
  $ q^0 \( overline(P_j) \) gt.eq m_j q^0 \( macron(h) \) . $
  Consequently
  $ 0 lt.eq A_(S^0 \, Psi_delta^0) \( q^0 \) lt.eq - delta q^0 \( macron(g) \) \, $
  which proves the right side of (6.7).
  Conversely assume that right side. Carry out exactly the same boundary construction on $S^0$,
    choosing the $lambda_j$ general for both the actual and central constructions.
    The intersection of these finitely many nonempty open conditions is nonempty.
    The assumed sign and a log resolution of the central equations give a small rational $delta >
    0$ for which $Psi_delta^0$ is effective and lc near $o$. Choose an integral rational regrading that preserves
    all the equations involved. Homogenize them in the Rees family.
    Their rational linear combination $Delta_(cal(S))$ is an effective rationally Cartier horizontal boundary,
    disjoint in components from $E$, and its restriction is $Psi_delta^0$.
  The total space is normal, $E$ is normal and Cartier, and its ordinary canonical divisor is Cartier by
    Proposition 42. Thus $K_(cal(S)) + E + Delta_(cal(S))$ is $bb(Q)$-Cartier.
    The different is the ordinary restriction, as checked above.
    Inversion of adjunction for log canonicity #cite(label("Kawakita")) Theorem now makes
    $\( cal(S) \, E + Delta_(cal(S)) \)$ lc near $o$. The section with all rescaled coordinates $x_i
    t^(- a_i)$ zero specializes to $o$, so this neighbourhood meets it over a nonzero parameter.
    Off $E$ the family and its horizontal boundary are the product with $\( S \, Psi_delta \)$.
    Hence the latter pair is lc near $x$. For a common actual ray,
    the initial boundary encoding has zero discrepancy, and the last perturbation subtracts $delta q \( g \)$.
    It follows that $q \( g \) lt.eq 0$, proving the converse.
  The resolution computations give inequalities on every divisorial ray,
    and continuity on the monomial cones of the lc skeleton gives them on the full quasi-monomial slices.
    Additional finite tests are treated in the same boundary and presentation. ◻
]

#thm([Corollary 6.5.])[
  (Exact tests and pure weights).  #emph[Suppose $w$ is common $h$-lc.
    If every common actual valuation satisfies $q \( f_j \) = 0$,
    then every common cone valuation satisfies $q^0 \( macron(f)_j \) = 0$.
    The symbols $macron(f)_j$ are invariant under $G$ and $bb(T)_w$.
    Every nonzero pure weight valuation of the cone is $h$-lc and, after normalization by $macron(h) = 1$,
    is common. Pure weights on the boundary of the dual weight cone are allowed under the closed-centre convention.]
] <cor:F-exact-tests>

#proof[
  Apply Proposition 44 to $g = f_j$, and combine its upper bound with the defining lower bound.
    The equality $w \( f_j \) = 0$ and injectivity of the fine grading imply that $macron(f)_j$ has weight zero.
    The invariant log form $omega^0 \/ macron(h)$ has weight zero,
    so the pure-weight discrepancy computation of Section 4 gives lc equality for every pure weight.
    The test ratios then all have value zero. Klt implies that $macron(h)$ is strictly positive on every nonzero
    such weight, so the stated normalization is possible. ◻
]

=== 6.4 Compression of two gradings <compression-of-two-gradings>

A second optimization takes place on the first cone. To iterate the construction on the original germ,
  we must realize these two successive gradings by one actual valuation there.
  The canonical-character calculation will prove its lc equality,
  while the exact bridge keeps the previous order constraints.

#thm([Lemma 6.6.])[
  (Compression).  #emph[Suppose $w$ is as above, is $h$-lc, and satisfies $w \( f_j \) = 0$ for every $j$.
    Let $v$ be a centred $G times bb(T)_w$-invariant, $macron(h)$-lc quasi-monomial valuation on $S^0$,
    with normal finitely generated klt graded algebra $R^00$. Suppose also $v \( macron(f)_j \) = 0$.
    The algebra $R^00$ has its joint grading by the old torus and the $v$-grading.
    For arbitrarily small positive $delta$ outside a countable exceptional set,
    it is the associated graded of an actual centred quasi-monomial valuation $w_delta$ on $S$,
    whose grading evaluates a joint degree $\( a \, b \)$ as $a + delta b$.
    The valuation $w_delta$ is $h$-lc, is exact on all $f_j$, and, after $h = 1$ normalization,
    tends multiplicatively to $w$ uniformly on all nonzero regular functions.
    If $v$ is nonzero on an old degree-zero rational function,
    the rational rank of $w_delta$ is strictly larger than that of $w$.]
] <lem:F-compression>

#proof[
  Choose old-homogeneous elements of $breve(R)$ whose $v$-symbols generate $R^00$ and lift them to regular
    functions $x_i$ on $S$. Enlarge the list to generate the first graded algebra and to include $h \,
    F_j$ and every other specified equation. Use $G$-eigenvectors throughout.
    Put $alpha_i = w \( x_i \)$ and $beta_i = v \( macron(x)_i \) > 0$. Both successive subductions of Lemma 41 give
  #[#set math.equation(numbering: n => "(6.10)")
   $ R^00 = bb(C) \[ X \] \/ "in"_beta \( "in"_alpha I \) . $ <eq:F-iterated-initial>]
  Completion of the first ideal does not change its initial ideal for positive $beta$.
  Choose finitely many generators of the prime ideal on the right that are iterated initials of elements of $I$.
    This is possible by first choosing $alpha$-homogeneous elements of $"in"_alpha
    I$ with the desired $beta$-initials; such elements lift with their prescribed $alpha$-initial.
    For each of these finitely many series, positivity and finiteness of the relevant leading faces imply that its
    iterated initial is its $\( alpha + delta beta \)$-initial for all sufficiently small $delta > 0$. Hence
  $ "in"_beta "in"_alpha I subset "in"_(alpha + delta beta) I . $
  The first ideal is prime and both quotients have dimension $n$. They are equal.
    Lemma 41 supplies the actual multiplicative valuation $w_delta$ and its quasi-monomiality.
    Avoiding countably many values of $delta$ makes $\( a \, b \) mapsto a + delta b$ injective on the joint lattice.
  We now prove the lc equality, after constructing the valuation.
    The first degeneration has canonical character equal to the weight of $macron(h)$.
    Apply Proposition 42 to $v$ on that cone, keeping the old torus action.
    Since $v$ is $macron(h)$-lc, the resulting canonical generator has exactly the joint character of
    $macron(macron(h))$. Independently apply the same proposition to the actual valuation $w_delta$,
    whose normal finitely generated graded algebra has just been identified with $R^00$.
    Its discrepancy is the evaluation of this canonical character under compression. Therefore
  #[#set math.equation(numbering: n => "(6.11)")
   $ A_S \( w_delta \) = chevron.l w_delta \, "wt" \( macron(macron(h)) \) chevron.r =
     w_delta \( h \) . $ <eq:F-compressed-lc>]
  This uses no prior lc assumption about $w_delta$. The included coordinates identify the specified symbols,
    and the joint degree of each $macron(macron(f)_j)$ is zero; hence $w_delta \( f_j \) = 0$.
  For the uniform comparison, if $\( 1 - epsilon \) alpha_i lt.eq alpha_i +
    delta beta_i lt.eq \( 1 + epsilon \) alpha_i$ for every $i$,
    the same inequalities hold for every monomial weight. The threshold-ideal description,
    including its intersection with the actual local ring, gives
  $ \( 1 - epsilon \) w \( f \) lt.eq w_delta \( f \) lt.eq \( 1 + epsilon \) w \( f \)
    wide \( 0 eq.not f in cal(O)_(S \, x) \) . $
  Normalization by $h$ changes the factors by another quantity tending to one.
    Finally the joint lattice surjects onto the old lattice. A degree-zero rational function with nonzero
    $v$-value provides a nonzero vector in its kernel. Injective compression therefore strictly increases rational
    rank. ◻
]

=== 6.5 Balanced cones satisfying the angular order condition <balanced-cones-satisfying-the-angular-order-condition>

#thm([Proposition 6.7.])[
  (Rank refinement).  #emph[Consider a sequence of the preceding data in dimensions at most $n_0$.
    Suppose that the common actual slices satisfy $q \( f_j \) = 0$ identically,
    that $w$ is a centred point of the slice with the stipulated normal finitely generated klt graded algebra,
    and that the cones satisfy the following balance condition with one constant $C$ along the sequence:
#[#set math.equation(numbering: n => "(6.12)")
 $ q^0 \( s \) lt.eq C w^0 \( s \) quad 0 eq.not s in breve(R) upright(" fine-homogeneous") \,\
q^0 upright(" common") \, quad q^0 \( macron(h) \) = w \( h \) = 1 . $ <eq:F-balance>]

 After passage to a subsequence, the $w$ can be replaced by $w'$ with all these properties,
   with a new fixed balance constant, and with
#[#set math.equation(numbering: n => "(6.13)")
 $ w' \( f \) = \( 1 + o \( 1 \) \) w \( f \) wide \( 0 eq.not f in cal(O)_(S \, x) \) \,
   $ <eq:F-refinement-comparison>]

 uniformly in $f$ in the normalization $w' \( h \) = w \( h \) = 1$.
   On the angular model $V_(upright(bold(u)))$ of the new cone, the notation of Section 4 then satisfies
#[#set math.equation(numbering: n => "(6.14)")
 $ T \( Gamma \) lt.eq \( 1 + eta_i \) D \( T \) \, wide eta_i arrow.r 0 \, $ <eq:F-angular-order>]

 for every effective $bb(Q)$-divisor $Gamma tilde.op_(bb(Q))
   D$ and every primitive divisorial $T$ such that $a \( T \) = 0$ and $T \( macron(f)_j \) gt.eq 0$ for all $j$.
   This is condition (C-$alpha$) of Section 3. The initial symbols here refer to $w'$.]
  #emph[The balance hypothesis holds when $w$ is the exact minimizer on the common slice for the height $q \( h \)$.]
] <prop:F-refinement>

#proof[
  The last assertion is the central domination estimate in Corollary 39;
    equivariance follows from the uniqueness of the slice minimizer.
    At every stage, Corollary 45 makes all common central test values zero and makes every pure weight common.
    The $macron(f)_j$ are genuine functions of the angular field $cal(K)$.
    At a height-minimizing Gauss extension of $T$, regularity of $macron(F)_j$ gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ T \( macron(f)_j \) gt.eq - m_j D \( T \) . $ <eq:F-angular-test-cost>]
  Suppose (6.14) fails along a subsequence. There are a fixed rational $c > 0$, primitive witnesses $T$,
    and effective divisors
  $ Gamma = D + 1 / m "div" \( phi.alt \) \, wide m in bb(N)_(> 0) \, quad phi.alt in cal(K)^(*) \, $
  such that $a \( T \) = 0$, $T \( macron(f)_j \) gt.eq 0$, and
  #[#set math.equation(numbering: n => "(6.16)")
   $ T \( Gamma \) - D \( T \) gt.eq 2 c D \( T \) . $ <eq:F-refinement-witness>]
  Here $D \( T \) > 0$ because $a + upright(bold(D))$ is klt.
    After clearing denominators, the ray-ring description in Section 4 makes $G_0 =
    macron(h)^m phi.alt$ a regular homogeneous function upstairs.
    Choose a rational Gauss extension minimizing $macron(h)$ at $T$.
    It is $macron(h)$-lc, and its lift to the finite quasi-étale cover cone remains lc.
    Its centre has the vertex in its closed image: this holds downstairs for a Gauss valuation,
    and finiteness and the unique point over the vertex give it upstairs. It is common, and (6.16) reads
  $ frac(g \( q \), q \( macron(h) \)) gt.eq 2 c \, wide g \( q \) = 1 / m q \( G_0 \) - q \( macron(h) \) . $
  Apply the one-sided tilt of Lemma 40 to this cone. Its exact minimizer $v$, normalized by $v \( macron(h) \) =
    1$, is centred, $G times bb(T)_w$-invariant, and has normal finitely generated klt associated graded.
    Localization at the vertex does not change this graded algebra: a unit has constant initial term.
    The valuation $v$ is common, hence exact on the old tests, and the tilt gives
  $ v \( phi.alt \) > 0 \, wide b \( v \) gt.eq 1 . $
  The tilted height $b$ is bounded above by a fixed constant on both the old and the new common slice,
    with constants depending only on $n_0$ and the fixed $c$ at this stage.
    Central domination therefore gives, on the new cone,
  #[#set math.equation(numbering: n => "(6.17)")
   $ q^00 \( s \) lt.eq C_1 v^0 \( s \) $ <eq:F-tilt-balance>]
  for common $q^00$ normalized by $macron(macron(h)) = 1$. The joint canonical character equals that of
    $macron(macron(h))$ by Proposition 42, including its old-torus assertion.
  Compress these two gradings by Lemma 46. Since $phi.alt$ has old weight zero and $v \( phi.alt \) > 0$,
    rational rank strictly increases. The resulting actual valuation is $h$-lc, exact on the tests,
    and can be chosen arbitrarily close to $w$ uniformly on every regular function.
    We check balance, which is necessary to repeat the argument.
    A joint-homogeneous $s$ has an old-homogeneous lift $tilde(s) in breve(R)$;
    the $v$-filtration splits into old weight spaces. If its joint degree is $\( a \, b \)$, then
  $ b = v \( tilde(s) \) lt.eq C a $
  by (6.12), since $v$ is common. In the normalization $w \( h \) = v \( macron(h) \) = 1$,
    the compressed degree is $\( a + delta b \) \/ \( 1 + delta \)$. Thus
  $ v^0 \( s \) = b lt.eq C \( 1 + delta \) w_delta^0 \( s \) . $
  Together with (6.17) this is the next balance estimate, with a fixed constant.
    A generic compression makes every fine-homogeneous element joint-homogeneous,
    so this checks precisely all elements required in (6.12).
  If the angular order condition still fails, pass to a subsequence with a fixed positive defect and repeat.
    Each repetition raises rational rank, which is at most the dimension. There can be at most $n_0$ repetitions.
    At a final stage the supremum of the positive normalized defects must tend to zero. This supremum is finite:
    a height-minimizing Gauss witness and (6.12), applied to $G_0$ of grading value $m$,
    bound $T \( Gamma \) \/ D \( T \)$ by the balance constant.
    Taking these suprema, or slightly larger positive numbers, gives the single sequence $eta_i$ in (6.14),
    uniformly for all its displayed tests and divisors. At each of the boundedly many compressions choose the
    all-functions multiplicative error to tend to zero; their product still tends to one and proves (6.13).
    All exact test equalities, equivariance, canonical characters,
    and quasi-étaleness have been preserved at every step. ◻
]

== 7 Pinning the gradings <sec:G>

We now combine the character supply of Section 4 with the optimization and transfer results of Sections 5 and 6.
  The discrepancy gap in this section is always a gap for primitive divisors on the actual quotient germs.
  No such gap is imposed on the auxiliary central cones.

The local phase assertion of #cite(label("OpenAILocalPhase2026")) Theorem 3.1 constructs centred divisorial
  valuations with bounded homogeneous discrepancy and cyclic-character congruences,
  after passage to a subsequence, under its hypotheses on Gorenstein klt germs of fixed dimension $n gt.eq 2$.
  It does not guarantee that these valuations lie on the prescribed $h$-lc slice $A \( T \) = T \( h \) =
  1$ below, so it does not replace the pinning obstruction.

#thm([Theorem 7.1.])[
  (Pinning obstruction).  #emph[Fix an integer $n > 0$ and $epsilon.alt > 0$.
    There is no sequence of the following data satisfying all the conditions below.
    For each index $i$, let $x_i in S_i$ be an $n$-dimensional complex klt germ with an action of a finite cyclic
    group $Gamma_i$ fixing $x_i$, such that the quotient map is quasi-étale and $S_i \/
    Gamma_i$ is $epsilon.alt$-lc. Suppose $K_(S_i)$ has a nowhere-vanishing local eigen-generator $omega_i$,
    and let $h_i$ be a nonzero regular eigenfunction with the same character $chi_i$ as $omega_i$.
    The character need not be faithful. Assume that $\( S_i \, "div" \( h_i \) \)$ is lc and admits a centred
    quasi-monomial valuation $T_i$ with
$ A_(S_i) \( T_i \) = T_i \( h_i \) = 1 . $

 The excluded additional condition is: for every fixed integer $m > 0$, there is an index $i \( m \)$ such that,
   for all $i gt.eq i \( m \)$ and every regular semi-invariant $s$ of character $chi_i^m$,
#[#set math.equation(numbering: n => "(7.1)")
 $ T_i \( s \) gt.eq m . $ <eq:G-input>]

]
] <thm:G-pinning>

All constants in the proof are uniform along the sequence under consideration;
  they may depend on the dimension and on the finitely many previous stages of the construction.
  An assertion made eventually also holds after any further subsequence.
  We suppress $i$ whenever this does not obscure a limit. We may successively pass to subsequences,
  since the number of stages and of subsidiary row additions will be bounded.

=== 7.1 Costs and the induction data <costs-and-the-induction-data>

An invariant rational function $Y$ has #emph[cost at most $m$] if $h^m Y$ is regular,
  where $m$ is a nonnegative integer. We increase costs to positive integers and to common denominators when
  convenient. Costs are subadditive under multiplication. The same terminology applies on a graded cone,
  with $h$ replaced by its initial symbol. Every homogeneous ratio on such a cone of cost $m$ lifts to an actual
  invariant ratio of the same cost: lift its regular numerator,
  and project to the character $chi^m$ by linear reductivity of the finite group.

We keep the test functions and accumulated variables on the original germ,
  while replacing the working valuation and its cone. Algebraic independence of the accumulated symbols is the
  quantity that will force termination. Their weights may nevertheless become rationally proportional:
  suitable ratios of monomials then have weight zero and retain information in the angular field.
  Pinning the weights to a line therefore need not reduce the transcendence degree of the accumulated symbols.

The following data are retained at the beginning of each stage.

+ There are finitely many actual invariant test ratios $f_j$, each of cost $O \( L_(-) \)$,
  where initially $L_(-) = 1$. The common actual slice
  #[#set math.equation(numbering: n => "(7.2)")
   $ cal(Q) = { q : A_S \( q \) = q \( h \) = 1 \, med q \( f_j \) gt.eq 0 upright(" for every ") j } $ <eq:G-slice>]
  contains a centred valuation, and every test has value exactly zero throughout this slice.
+ There are accumulated pairs $Y_j^(+) \, Y_j^(-)$ of invariant ratios of cost $O \( L_(-) \)$,
  with opposite values on $cal(Q)$. We write $y_j \( q \) = q \( Y_j^(+) \) = - q \( Y_j^(-) \)$.
  The products $Y_j^(+) Y_j^(-)$ occur among the exact tests.
  Consequently the equality of the pair values also holds on every later common cone slice, by Proposition 44.
+ Either all $y_j$ vanish on $cal(Q)$, or their vector lies on a single rational line.
  In the latter case one accumulated variable, indexed by $0$, is an #emph[anchor].
  It was chosen at an unbounded scale $L_1$; its pair has cost $O \( L_1 \)$, and $L_1 lt.eq L_(-)$.
  For each other accumulated variable there are integers $t_j \, d_j$, with $d_j > 0$ bounded, such that
  #[#set math.equation(numbering: n => "(7.3)")
   $ y_j = \( t_j \/ d_j \) y_0 \, wide \| t_j \| = O \( L_(-) \/ L_1 \) . $ <eq:G-proportions>]
  These equations include the point where all values are zero and are imposed by tests of both signs.
    In the all-zero case there is no anchor.
+ The optimization height $frak(B)$ is rational and positive on $cal(Q)$, and in the normalization $q \( h \) =
  1$ satisfies
  #[#set math.equation(numbering: n => "(7.4)")
   $ rho lt.eq frak(B) \( q \) lt.eq C $ <eq:G-baseline-bounds>]
  for fixed positive constants. Initially $frak(B) \( q \) = q \( h \)$.
    It can change once, when an anchor is first chosen, to
  #[#set math.equation(numbering: n => "(7.5)")
   $ frak(B) \( q \) = q \( h \) - mu q \( Y_0^(upright("sign")) \) \/ L_1 \, wide mu gt.eq 0 \, $ <eq:G-baseline>]
  where either member of the anchor pair can be used and $mu$ is bounded. This is an allowed height in Theorem 37.
    On a common central slice the same expression has a uniform upper bound after normalizing $q' \( h \) = 1$,
    because both anchor ratios have cost $O \( L_1 \)$.
+ Take the exact $frak(B)$-minimizer and apply the rank refinement of Proposition 47,
  choosing the approximation error to tend to zero. This produces an equivariant centred working valuation $w$,
  with finitely generated normal graded algebra, whose values on all regular functions are multiplicatively $1 +
  o \( 1 \)$ times those of the exact minimizer. Its $frak(B)$-normalized volume is within $1 +
  o \( 1 \)$ of the minimum. Its cone satisfies the balance estimate (6.12) and the order condition (3.5),
  with error $eta_i arrow.r 0$, on the angular tests $cal(L)$ specified by the current initial tests.
  The symbols of all accumulated $Y_j^(+)$ are algebraically independent. If there is an anchor,
  #[#set math.equation(numbering: n => "(7.6)")
   $ \| w \( Y_0^(+) \) \| gt.eq c L_1 $ <eq:G-anchor-size>]
  for a fixed $c > 0$.

The balance hypothesis needed for the refinement in (7.5) follows from the preceding height bounds.
  Let $v$ be the exact $frak(B)$-minimizer, normalized by $v \( h \) = 1$.
  For every common central $q^0$ with $q^0 \( h \) = 1$, Corollary 39 gives

$ q^0 \( s \) lt.eq 2^n frac(frak(B)^0 \( q^0 \), frak(B) \( v \)) v^0 \( s \) lt.eq
  frac(2^n C, rho) v^0 \( s \) wide \( 0 eq.not s upright(" regular and homogeneous") \) . $

Here only the upper bound for $frak(B)^0$ is used on the central slice;
  the denominator is bounded below at the actual minimizer. Proposition 47 then preserves balance with a fixed constant.

Initially there are no tests and no pairs, so these conditions follow from the centred point $T$ and Sections 5–6.
  Corollary 38 applies to $frak(B)$. Indeed, normalize two valuations by $frak(B) = 1$.
  The radially scaled version of Lemma 33 fixes the averaged value of $h =
  A$ and gives exact interpolation of the opposite anchor pair. In particular its allowed height is at most $1$.
  Its volume is therefore at least the minimum in height-one normalization.
  The same gap argument gives multiplicative comparison on all functions.
  The bounds (7.4) then convert that comparison back to $h = 1$.
  Applied to numerators and $h$-powers, it controls ratio values up to the corresponding cost times the relative error.

Let $M \, upright(bold(u)) \, sigma$ be the invariant character lattice, the weight of $h$,
  and the cone from Proposition 23, for the working algebra. Equip $M_(bb(R))$ with

#[#set math.equation(numbering: n => "(7.7)")
 $ parallel k parallel = max_(y in sigma\
chevron.l y \, upright(bold(u)) chevron.r = 1) \| chevron.l y \, k chevron.r \| . $ <eq:G-width>]

Fine weights evaluate injectively under $w$. Thus the exact equations in (7.3) imply the same equations for the
  weights of the symbols. In the line case write $kappa_0 = "wt" \( "in"_w Y_0^(+) \)$.
  Opposition on pure common tests and the paired costs give $parallel kappa_0 parallel = O \( L_1 \)$,
  whereas (7.6) gives the reverse bound. Hence

#[#set math.equation(numbering: n => "(7.8)")
 $ parallel kappa_0 parallel asymp L_1 . $ <eq:G-anchor-width>]

After a stage with $L_(-) arrow.r oo$, we will additionally retain:

+ Every lattice vector of width $O \( L_(-) \)$ belongs to $bb(Q) kappa_0$ if an anchor is present,
  and is zero otherwise. In the line case the index of $bb(Z) kappa_0$ in $M ∩ bb(Q) kappa_0$ is bounded.
+ The angular tests in $cal(L)$, namely $a = 0$ with nonnegative orders on all initial tests,
  restrict trivially to the field generated by $S \( L_(-) D \)$.

Here $a \, D \, S \( dot.op \)$ have the angular meanings of Sections 3–4.
  No assertion (7.8) or (7.8) is required while $L_(-)$ remains bounded, and there is then no anchor.
  These two assertions will be proved for the next stage after the high-scale pin,
  without being used to construct its rank refinement.

=== 7.2 The next character block and the terminal case <the-next-character-block-and-the-terminal-case>

Suppose first that an anchor is present and $M$ has no direction transverse to its line.
  Write $kappa_0 = ell k_0$, where $k_0$ is primitive in $M$; assertion (7.8) bounds $ell$.
  The restriction of $w$ to the actual quotient field has rational rank one and is Abhyankar.
  To justify that this is the actual value group, take invariants in every level of the finite-group-stable
  filtration: exactness of invariants identifies the invariant graded algebra with the graded algebra of the
  quotient filtration. Its homogeneous fraction weights generate $M$, and evaluation is injective.
  Thus the quotient value group is generated by

$ gamma = \| w \( Y_0^(+) \) \| \/ ell . $

Abhyankar equality is preserved under the finite field extension,
  so this rank-one valuation is divisorial up to scaling. Its primitive normalization is
  $w \|_("Frac" \( S \/ Gamma \)) \/ gamma$. Quasi-étale log pullback and $A_S \( w \) =
  1$ give its discrepancy as $1 \/ gamma$. By (7.6) and $L_1 arrow.r oo$, this tends to zero,
  contradicting $epsilon.alt$-lc of the actual quotient. Rank zero of $M$ is impossible,
  since a finite extension of the quotient field cannot support a nontrivial valuation with trivial restriction.
  This disposes of the terminal possibilities.

Otherwise choose a block of lattice directions as follows.
  With an anchor use the quotient norm modulo $bb(R) kappa_0$ on the projected lattice; without one use (7.7).
  After a previous high stage its shortest nonzero length divided by $L_(-)$ tends to infinity.
  For if a projected vector had length $O \( L_(-) \)$, lift it and subtract the nearest multiple of the primitive
  line vector. Its remaining line contribution is $O \( L_1 \)$ by (7.8) and the bounded index,
  producing a transverse lattice vector of width $O \( L_(-) \)$, contrary to assertion (7.8).

Before the first high stage, if some successive minima remain bounded,
  choose a nonempty maximal bounded block of independent directions, of width $O \( L \)$ with $1 lt.eq L =
  O \( 1 \)$. This is a #emph[bounded stage]. In every other case choose an integral scale $L arrow.r
  oo$ comparable to the first successive minimum, and take the whole first block of successive minima comparable
  to $L$. After a subsequence, the next successive minimum, if any, divided by $L$ tends to infinity.
  These are #emph[high stages]. Lift the selected directions $k_j$ to $M$ by rounding along the anchor line when
  necessary. They have width $O \( L \)$, and $L_(-) = O \( L \)$.

In a high stage, let $s$ denote the block size plus one when an old anchor is present,
  and just the block size otherwise. Put

#[#set math.equation(numbering: n => "(7.9)")
 $ R_(*) = L \/ L_1 quad upright("with an old anchor") \, wide R_(*) = 1 quad upright("without one") . $ <eq:G-Rstar>]

For every fixed $N gt.eq 1$, eventually

#[#set math.equation(numbering: n => "(7.10)")
 $ \# { k in M : parallel k parallel lt.eq C N L } lt.eq C' R_(*) N^s \, $ <eq:G-lattice-count>]

with $C'$ independent of $N$. Indeed, the gap to the next successive minimum confines these vectors to the
  first-block span modulo the line. Distinct projected lattice points have separation at least $c L$,
  so a norm-ball packing in its bounded dimension gives $O \( N^(s - 1) \)$ points when there is an anchor,
  and $O \( N^s \)$ otherwise. Above each projected point, the number of lifts in the ball is
  $O \( N L \/ L_1 \)$, since the lattice step on the anchor line has width comparable to $L_1$. This proves (7.10).

=== 7.3 Neutral tests and simultaneous non-cancellation <neutral-tests-and-simultaneous-non-cancellation>

Apply Lemma 18 at scale $L$. Its test-cost hypothesis uses $L_(-) = O \( L \)$; its additional field hypothesis,
  when $L_(-) arrow.r oo$, is precisely assertion (7.8). Write its outputs as $K_(*) \, p \, v_i \, B$.
  If the angular field is the constant field, set $p = 0$ and $v_i = 1$.
  Increase the fixed constant $B$ if needed. Lift a basis of $S \( B L D \)$ to actual ratios $G_a$ of cost
  $O \( L \)$ with the prescribed neutral initial symbols. This basis is finite for each germ,
  but its cardinality may grow along the sequence; the cost constant is uniform. We include $1$ in the basis.
  We may also arrange that $p$ basis members have algebraically independent initial symbols:
  the cutoff plateau has an endpoint $beta_1 gt.eq c \/ L$,
  and its bounded birational system in $D_W \/ beta_1$ pulls back into $S \( B L D \)$ and generates $K_(*)$ as a
  field. A transcendence basis can be chosen from a field-generating set and extended to a vector-space basis.

For each selected direction $k_j$, Corollary 27 supplies homogeneous invariant ratios of weights $plus.minus q_j
  k_j$, with bounded positive integers $q_j$, and cost $O \( L \)$.
  Align the two multipliers by taking bounded powers and lift the ratios to pairs $Y_j^plus.minus$ on the actual
  germ. Its small-height hypothesis holds: on a primitive angular test with $a = 0$ and $L D arrow.r 0$,
  an old test of cost $O \( L_(-) \)$ has negative order bounded in absolute value by $O \( L_(-) D \) =
  o \( 1 \)$. Its order is integral, hence is nonnegative eventually.
  Such a test therefore belongs to $cal(L)$, where the required (3.5) holds.

Add the $G_a$ and the new products $Y_j^(+) Y_j^(-)$ as tests,
  before imposing any individual new pair or proportionality constraint.
  Call the result the #emph[pre-pinning slice]. All these tests have value zero at $w$,
  so this slice contains $w$. On the working cone, the old tests together with the $G_a$ tests force trivial
  restriction on $K_(*)$ by saturation: nonnegativity on a vector-space basis implies nonnegativity on its whole
  linear system. The assertion also holds for pure tests, which are trivial on the angular field.
  Lemma 24 supplies the homogeneous Gauss description and the finite-cover lifts for all other common lc tests.
  Rational monomial tests suffice, and the equalities extend to their real subcones.
  The $G_a$ and the new pair products have initials in $K_(*)$, since their neutral costs are $O \( L \)$.
  The bridge therefore gives value at most zero on the actual pre-pinning slice.
  Their test inequalities give the reverse sign, proving exactness and opposition there.

#thm([Lemma 7.2.])[
  (Non-cancellation in every degree).  #emph[At the preceding stage,
    consider any finite linear combination of monomials in the accumulated and newly added $Y_j^(+)$ and the
    current $G_a$, with nonnegative exponents. Suppose its least-$w$ group has a nonzero sum of initial symbols.
    If all its terms have the same value at an actual point of the pre-pinning slice, their sum has that value.
    This assertion holds eventually simultaneously in all polynomial degrees.
    Moreover, at a later working valuation on this slice where these terms are tied,
    the same non-cancellation assertion transfers to its cone at every common test where the terms remain tied and
    the pair values are opposite.]
] <lem:G-noncancellation>

#proof[
  Write $A_j = "in"_w Y_j^(+)$ and $B_j = "in"_w Y_j^(-)$. The pair products $A_j B_j$ lie in $K_(*)$.
    With an old anchor, the finitely many old relations
  $ "wt" \( A_j \) = \( t_j \/ d_j \) kappa_0 $
  give neutral rational functions $A_j^(d_j) A_0^(- t_j)$. Each is a quotient of two neutral functions of cost
    $O \( L \)$. More explicitly, for $t_j gt.eq 0$ write it as
  $ frac(A_j^(d_j) B_0^(t_j), \( A_0 B_0 \)^(t_j)) \; $
  for $t_j < 0$ its numerator is simply $A_j^(d_j) A_0^(\| t_j \|)$.
    The required costs are bounded by a fixed multiple of $d_j L_(-) + \| t_j \| L_1 = O \( L_(-) \) = O \( L \)$.
    There are at most $n$ accumulated variables, and their denominators $d_j$ are bounded.
    Thus one fixed constant works for this entire finite collection.
    The inclusion $S \( C L D \) subset K_(*)$ puts their numerators and denominators in $K_(*)$ at one eventual
    index. Without an anchor all the old $A_j$ themselves are neutral and of bounded cost,
    and belong to $K_(*)$ instead.
  The new weights are independent modulo the old line, or modulo zero.
    Consequently a monomial relation of total weight zero has zero net exponent in each new variable.
    Clearing the bounded old denominators expresses a power of every remaining weight-kernel monomial in the
    finite neutral generators just described. Every such monomial is therefore algebraic over $K_(*)$.
    This is a simultaneous algebraic statement: once the finite generators have entered $K_(*)$,
    there is no further eventual index depending on the exponents.
  Choose a term in the least-$w$ group, and multiply the whole sum by the opposite factors $Y_j^(-)$ corresponding
    to its $Y_j^(+)$ factors. Its $G_a$ factors already have value zero.
    The complemented sum has a nonzero $w$-initial of weight zero.
    Each term of that initial is algebraic over $K_(*)$ by the preceding kernel argument,
    so the initial itself is algebraic over $K_(*)$. Every common cone test is trivial on this element.
    Here we use the elementary fact that a valuation trivial on a field is trivial on its algebraic extension
    inside a valued field: a polynomial equation with nonzero constant term would otherwise have a unique term of
    smallest value.
  The complemented sum is an invariant ratio with a regular numerator after multiplication by some power of $h$.
    Its cost is allowed to depend on the chosen polynomial. Proposition 44 has no uniform cost restriction,
    and yields an actual upper bound zero on the pre-pinning slice.
    At a point where the original terms tie, opposition and the zero values of $G_a$ give value zero for every
    complemented term. The valuation inequality gives the lower bound zero.
    The complemented sum thus has exact value zero, which proves non-cancellation.
  At a later working valuation $w'$ where the terms tie, this establishes exact value zero before any new bridge
    is invoked. Its initial symbol there is nonzero. Apply the bridge in the other direction,
    using only tests exact at $w'$. At a common test on the new cone where the terms remain tied,
    the transferred upper bound and the same termwise lower bound again give equality.
    This proves the onward assertion. ◻
]

The enlarged collection of positive symbols is algebraically independent at $w$:
  the new weights are independent modulo the old line, and the old symbols were independent.
  It remains independent at every later working valuation on the pre-pinning slice.
  Indeed, a proposed polynomial relation among the later symbols can be grouped by their later grading.
  Each nonempty group has a nonzero least-part initial at $w$,
  and Lemma 49 forbids cancellation of that group at the later valuation.

At a bounded stage, add both new members $Y_j^plus.minus$ individually as tests. Their values must then be zero.
  The original centred point $T$ remains in the slice by (7.1), because every cost used so far is bounded.
  This invocation is uniform over the finite interval of possible integral costs,
  and applies to every numerator in each of the corresponding semi-invariant spaces.
  Thus the bounded stage is complete: replace $L_(-)$ by $L$ and optimize and refine again.
  No assertion of (7.1) at an unbounded cost has been used.

=== 7.4 The count at a high scale <the-count-at-a-high-scale>

The neutral tests now prevent cancellation and preserve the independent symbols when the working valuation
  changes. At an unbounded scale, the input saturation condition does not directly control all newly chosen costs.
  We instead bound the number of symbols available at that scale.
  The high-scale pin will force enough exact relations to avoid violating this bound.

We now work at a high stage. For each fixed integer $N gt.eq 1$, each integer $0 lt.eq t lt.eq C N L$,
  and the character $chi^t$, the span of regular homogeneous symbols of that character of grading value at most $C
  N L$ has dimension at most

#[#set math.equation(numbering: n => "(7.11)")
 $ C' R_(*) v_i N^(p + s) . $ <eq:G-count>]

The constant $C'$ is independent of $N$ and $t$. To see this, divide a symbol by $h^t$.
  It becomes an invariant homogeneous fraction with weight in $M$.
  Balance (6.12), tested on rational pure rays, bounds its width by $O \( N L \)$.
  Those rays are common tests because all current test weights are zero.
  For each weight, Corollary 28 bounds its dimension by $C'' v_i N^p$. Sum over (7.10).

The same upper bound, with only a fixed change of constant,
  holds on the cone of any other actual equivariant centred valuation $v$ with

#[#set math.equation(numbering: n => "(7.12)")
 $ v gt.eq c w $ <eq:G-domination>]

on all regular functions, in $h = 1$ normalization, for fixed $c > 0$.
  Indeed the order ideals satisfy $frak(a)_(a \/ c) \( w \) subset.eq frak(a)_a \( v \)$.
  The resulting surjection of finite colength quotients is equivariant.
  Taking each finite-group eigenspace is exact, so the cumulative dimensions of its associated graded pieces have
  the asserted comparison. The strict or weak endpoint of a grading cutoff can be handled by slightly increasing
  its fixed constant. In particular we transfer (7.11) from the original working cone;
  we never replace it by a count with a constant depending on a later tilt.

We record the elementary product estimate used below.

#thm([Lemma 7.3.])[
  (Uniform product growth).  #emph[Let $V$ be a finite-dimensional subspace of a function field over an
    algebraically closed field, containing $1$. Put $g = dim V$ and $a = "trdeg" k \( V \) lt.eq n$.
    If $V^(\( N \))$ is the span of $N$-fold products of members of $V$, there is $c_n > 0$,
    depending only on $n$, such that
$ dim V^(\( N \)) gt.eq c_n g N^a wide \( N gt.eq 1 \) . $

]
] <lem:G-product-growth>

#proof[
  The rational map defined by $V$ has a nondegenerate integral projective image of dimension $a$ in
    $upright(bold(P))^(g - 1)$. Its degree-$N$ homogeneous coordinate space is $V^(\( N \))$.
    Successively cut by general hyperplanes. In positive dimension the reduced hyperplane section is nondegenerate
    in its hyperplane. One way to see the required nondegeneracy is to pass to the normalization:
    a general hyperplane divisor is reduced in codimension one,
    so another linear form vanishing on its reduced support has a regular ratio with the cutting form,
    and the ratio is constant. The reduced section is integral until the last curve section by Bertini;
    the final reduced set of points spans its hyperplane and has Hilbert function at least its dimension in degree
    one in every higher degree. For the homogeneous coordinate ring,
    multiplication by a nonzero cutting linear form is injective,
    and the quotient surjects onto the coordinate ring of the reduced cut.
    Thus successive differences of Hilbert functions dominate the Hilbert functions of these cuts.
    Summing these inequalities gives, for $a > 0$, the sufficient bound
  $ dim V^(\( N \)) gt.eq \( g - a \) binom(N + a - 1, a) . $
  Since $g gt.eq a + 1$, one has $g - a gt.eq g \/ \( a + 1 \)$, giving the asserted constant.
    For $a = 0$ the image is a point, $g = 1$, and the assertion is immediate. ◻
]

=== 7.5 The high-scale pin <the-high-scale-pin>

At a high stage the new costs grow with $L$, so the original input (7.1) no longer supplies a centred point after
  individual values are forced to zero. We instead constrain their proportions while retaining a centred point
  close enough to the current minimum.

#thm([Proposition 7.4.])[
  (High-scale pin).  #emph[Consider a high stage with pre-pinning slice, working valuation $w$,
    baseline height $frak(B)$, scale $L$, and $s$ selected values as above.
    After passage to a subsequence, finitely many invariant tests of cost $O \( L \)$ can be added with the
    following properties.]
  + #emph[The resulting slice contains a centred valuation.
    The added tests are exact on that slice, all old tests and proportionalities remain in force,
    and the accumulated positive symbols remain algebraically independent at the exact minimizer and working
    valuation in (iii) below.]
  + #emph[The selected values either vanish or lie on a single rational line.
    In the line case their proportions have the bounds (7.3), with $L_(-) = L$.
    An old anchor remains the anchor; if a new anchor is chosen, its scale is $L_1 = L$.]
  + #emph[The baseline height is retained unless an anchor is first chosen,
    in which case it may change to the rational height (7.5). It satisfies (7.4) on the new actual slice.
    At its exact minimizer $v'$, and at an arbitrarily close rank refinement $w'$, the anchor, when present,
    satisfies $\| v' \( Y_0^(+) \) \| \, \| w' \( Y_0^(+) \) \| gt.eq c L_1$.
    Both valuations dominate a fixed positive multiple of $w$ on every regular function. In particular,
$ w' gt.eq c w . $

]
  #emph[Consequently Section 7.1–(7.5) hold with $L_(-) = L$.
    The next-scale assertions (7.8)–(7.8) are not assumed in constructing the pin or its rank refinement.]
] <prop:G-high-pin>

Domination preserves the counting bound on the original working cone.
  The rational proportions permit equations of cost $O \( L \)$,
  and the nonzero anchor size will detect a small primitive quotient discrepancy if only its line remains.
  We first construct this pin, then prove that it also gives the next-scale field and lattice assertions.

=== 7.6 Finding all necessary relations <subsec:G-pin-rows>

We begin the proof of Proposition 51. Within this stage, progress is measured by the rank of the integral
  relations imposed on the $s$ selected values. This row rank is separate from the transcendence degree used to
  terminate the outer induction.

For the $s$ selected variables put $L_j = L_1$ for an old anchor, and $L_j = L$ for every new variable, and set

$ x \( q \) = \( y_j \( q \) \/ L_j \)_(j = 1)^s . $

When there is an anchor we include its index $0$ in this notation.
  Opposition and the paired costs bound all coordinates uniformly on the actual pre-pinning slice.
  Lemma 33 and Corollary 34 give exact convex interpolation of the coordinates,
  so their image is compact and convex. Its points can be realized by centred valuations whenever the
  interpolation assigns positive weight to a centred input.

We successively impose integral rows

#[#set math.equation(numbering: n => "(7.13)")
 $ sum_j k_j y_j = 0 \, wide hat(k) = \( k_j L_j \/ L \)_j \, wide parallel hat(k) parallel_(upright("Eucl")) =
   O \( 1 \) . $ <eq:G-row>]

A row is imposed by testing two opposite monomials. For its positive sign use

$ M_k = product_(k_j gt.eq 0) \( Y_j^(+) \)^(k_j) product_(k_j < 0) \( Y_j^(-) \)^(- k_j) \; $

exchange the signs to obtain the other monomial. Each has cost $O \( sum_j \| k_j \| L_j \) = O \( L \)$,
  and opposition makes the two inequalities equivalent to the row equality.

Let $cal(R)_i subset bb(R)^s$ denote the span of the normalized rows already imposed.
  We retain a comparator $v_0$ on the current slice whose $frak(B)$-normalized volume is within $1 +
  o \( 1 \)$ of the minimum on the actual slice at the start of this high stage. Initially use $w$.
  The gap estimate then gives $v_0 = \( 1 + o \( 1 \) \) w$ on all regular functions.
  With an old anchor, $\| y_0 \( v_0 \) \| \/ L_1$ stays bounded away from zero.
  Pass to subsequences so the row spaces converge and the limits of the chosen rows are independent.

For clarity, independence of their transverse integer rows is equivalent to independence of these normalized row
  limits in the present situation. The non-anchor coefficients $k_j$ are bounded integers,
  hence become fixed on a subsequence. If a rational combination of their transverse rows vanished,
  the same combination of full rows would be supported only on the anchor. Its exact value at $v_0$ must vanish.
  Since the anchor coordinate is nonzero, its anchor coefficient vanishes as well.
  Thus any dependence in the transverse rows is a dependence of the full rows.
  Conversely independent transverse rows keep the full normalized rows independent in the limit.
  With no anchor, all coefficients are bounded integers and the statement is immediate.

Let $K_i$ be the projection image ${ x \( q \) }$ of the current constrained slice, and let

$ C_i = "conv" \( { 0 } union K_i \) = \[ 0 \, 1 \] K_i . $

After a subsequence these bounded compact convex sets converge in Hausdorff distance.
  Their limit lies in $cal(R)_oo^perp = lim cal(R)_i^perp$. We first handle the case

#[#set math.equation(numbering: n => "(7.14)")
 $ "span" \( lim C_i \) eq.not cal(R)_oo^perp . $ <eq:G-thin>]

Choose a unit vector $u in cal(R)_oo^perp$ perpendicular to the left-hand span, and rational vectors $u_i arrow.r
  u$. Then

#[#set math.equation(numbering: n => "(7.15)")
 $ u_i dot.op x \( q \) = o \( 1 \) $ <eq:G-projection-small>]

uniformly on the current slice. Fix a sufficiently small $delta > 0$, with its size chosen below,
  and consider the rational height

#[#set math.equation(numbering: n => "(7.16)")
 $ b \( q \) = delta frak(B) \( q \) - sum_j u_(i j) y_j \( q \) \/ L_j . $ <eq:G-thin-height>]

We take the scales integral, so all coefficients can be rational.
  According to the sign of $u_(i j)$, use $Y_j^(+)$ or $Y_j^(-)$,
  and absorb its $h$-denominator into the coefficient of $q \( h \)$.
  This puts $b$ in the allowed form with nonnegative coefficients on the subtracted regular numerator values.
  Equations (7.4) and (7.15) show that it is positive and equals $\( 1 + o \( 1 \) \) delta
  frak(B)$ uniformly on this slice.

Let $v$ be its exact minimizer. Comparison with $v_0$ shows that the $frak(B)$-normalized volume of $v$ is within
  $1 + o \( 1 \)$ of the original stage minimum. Consequently

#[#set math.equation(numbering: n => "(7.17)")
 $ v = \( 1 + o \( 1 \) \) w $ <eq:G-thin-close>]

on all regular functions, and $v$ is exact on all present tests.
  On its cone every nonzero pure test, and every Gauss test over a primitive angular divisor with $a =
  0$ and $L D arrow.r 0$, is common. Indeed all test weights are zero, their costs are $O \( L \)$,
  and the integral angular orders cannot be negative of size $o \( 1 \)$.
  All pair equalities transfer to this cone. Positivity of the induced height, supplied by Theorem 37,
  and the uniform central upper bound for $frak(B)$ imply

#[#set math.equation(numbering: n => "(7.18)")
 $ sum_j u_(i j) y'_j \/ L_j lt.eq C delta q' \( h \) $ <eq:G-central-tilt>]

on these tests.

Apply Corollary 29. For a fixed $M_0 gt.double 1 \/ delta$, choose integers

#[#set math.equation(numbering: n => "(7.19)")
 $ r_j = M_0 u_(i j) L \/ L_j + O \( 1 \) . $ <eq:G-rounding>]

It gives a homogeneous invariant ratio $Z$ on the cone of $v$, of weight

#[#set math.equation(numbering: n => "(7.20)")
 $ - q sum_j r_j "wt" \( "in"_v Y_j^(+) \) \, $ <eq:G-cheap-weight>]

where $q$ is a bounded positive integer, and of cost at most

#[#set math.equation(numbering: n => "(7.21)")
 $ C q M_0 delta L . $ <eq:G-cheap-cost>]

The constant $C$ is fixed before $delta$ and $M_0$ are chosen. The bound on $q$ may depend on these fixed choices.
  This distinction follows from the proof of the tilted-character result:
  its height correction has size $O \( M_0 delta L \)$; the $O \( L \)$ rounding error and the fixed constant in
  (7.18) are absorbed by first taking $M_0 gt.double 1 \/ delta$.
  Only the later regularizing multiplier need depend on these parameters.
  The absolute grading value of $Z$ has the same bound. In fact (7.20) evaluates to

$ - q M_0 L thin u_i dot.op x \( v \) + O \( q L \) \, $

which is bounded by (7.21) eventually, by (7.15) and the chosen size of $M_0$.
  No assumption (3.5) on this newly tilted cone is used.

#thm([Claim 7.5.])[
  #emph[After a subsequence there is an additional row of the form (7.13), exact at $v$,
    whose transverse part is independent of the previously imposed transverse rows.]
] <clm:G-new-row>

#proof[
  Suppose otherwise. Then, for each fixed bound on normalized coefficient size,
    every exact integral tie at $v$ eventually belongs to the old row span.
    To verify this assertion, a tie with transverse part outside the old span would give the desired row after
    fixing its bounded integer transverse coefficients. If its transverse part lies in the old span,
    subtract the corresponding rational combination of the fixed old transverse rows.
    The remainder is a pure-anchor tie. It is zero because (7.17) preserves the nonzero anchor value at $v$.
    Without an anchor there is no remainder. The claimed eventual assertion for all ties with a given bound
    follows by choosing a failing tie along a subsequence if necessary.
  Let $tilde(u)_i$ be a unit vector in $cal(R)_i^perp$ tending to $u$.
    Choose a large fixed integer $N gt.double q M_0$. In the exponent box
  $ 0 lt.eq e_j lt.eq floor.l N L \/ L_j floor.r \, wide hat(e) = \( e_j L_j \/ L \)_j \, $
  there are at least $c R_(*) N^s$ integer points. The range of $tilde(u)_i dot.op hat(e)$ has length $O \( N \)$.
    Partition this range into intervals of width $q M_0 \/ 4$. One slab contains at least
  #[#set math.equation(numbering: n => "(7.22)")
   $ c R_(*) N^(s - 1) q M_0 $ <eq:G-slab-size>]
  points. For each exponent in this slab, consider on $"gr"_v$ its positive-variable monomial multiplied by $Z^l$, where
  #[#set math.equation(numbering: n => "(7.23)")
   $ 0 lt.eq l lt.eq ⌊N \/ \( q M_0 delta \)⌋ \, $ <eq:G-powers>]
  and by a basis of the products of $N$ of the $G_a$ whose $w$-initials are independent.
    Saturation and counting supply at least $v_i N^p$ such products.
  Different powers $l$ have disjoint grading values in this construction. A collision would give the exact integral tie
  $ e - e' - q \( l - l' \) r . $
  Its normalized size is bounded with $N \, M_0 \, delta \, q$ fixed.
    Under our supposition it belongs to the old row span, so its normalized dot product with $tilde(u)_i$ is zero.
    The slab bounds the contribution from $e - e'$ by $q M_0 \/ 4$. But (7.19) gives
  $ hat(r) = M_0 u_i + O \( 1 \) \, wide \| tilde(u)_i dot.op hat(r) \| gt.eq M_0 \/ 2 $
  eventually, after increasing the fixed $M_0$. For $l eq.not l'$ the other contribution has magnitude at least $q
    M_0 \/ 2$, a contradiction. It is essential here that $tilde(u)_i$ is orthogonal to the entire old normalized
    row span.
  At any one power $l$, the slab size times $v_i N^p$ symbols are linearly independent.
    Before changing to $v$, the selected variable weights separate the exponent vectors,
    and the chosen $G_a$ products have independent initials at $w$.
    Any possible relation after the change can be grouped by its $v$-grading,
    and Lemma 49 rules out cancellation in each group. Multiplication by the nonzero $Z^l$ preserves this
    independence. Combining with disjoint grading values for different $l$ gives at least
  #[#set math.equation(numbering: n => "(7.24)")
   $ c delta^(- 1) R_(*) v_i N^(p + s) $ <eq:G-excess-count>]
  independent ratios.
  Every ratio just counted has cost and absolute grading value at most $C_0 N L$,
    where $C_0$ is independent of $delta \, M_0 \, q$. The slab monomials cost $O \( N L \)$;
    the $G_a$ products do too; and (7.21) multiplied by the exponent bound (7.23) costs $O \( N L \)$.
    A common $h$-denominator gives regular numerators of one finite character and degree $O \( N L \)$.
    By (7.17), eventually $v gt.eq w \/ 2$, so the transferred upper bound (7.11) has a constant independent of
    the tilt. It contradicts (7.24) if $delta$ is sufficiently small.
  The order of choices is as follows. First fix the current stage constants, the old rows,
    the saturation constant and the original counting constant.
    Then fix $delta > 0$ small enough for this last contradiction.
    Next fix $M_0$ sufficiently large compared with $1 \/ delta$ and the rounding constants.
    The character construction then gives a bound $Q$ for $q$; pass to a subsequence fixing $q$,
    or choose using $Q$. Only now choose a sufficiently large fixed $N$,
    and finally let $i$ be large enough for all of these fixed-parameter assertions.
    Thus $delta$ never tends to zero with $i$, and no eventual count is used at a variable product degree.
    This proves the claim. ◻
]

Impose the new row by both signs and retain $v$ as the new comparator.
  It is centred and still within $1 + o \( 1 \)$ of the original stage minimum.
  The limits of the enlarged rows stay independent because their transverse integer projections are fixed and
  independent. Each time (7.14) holds, Claim 52 increases this rank.
  There are at most $s$ such increases, and at most $s - 1$ with a retained nonzero anchor.
  Therefore this procedure reaches the alternative

#[#set math.equation(numbering: n => "(7.25)")
 $ "span" \( lim C_i \) = cal(R)_oo^perp . $ <eq:G-full-span>]

This is strict finite progress within a stage.

=== 7.7 Rational directions and anchor size <subsec:G-pin-directions>

Fix a small positive number $lambda$. Mix the comparator projection with the full current projection set:

$ K_i^lambda = \( 1 - lambda \) x \( v_0 \) + lambda K_i . $

These points have actual centred realizations $q$ with $q gt.eq \( 1 - lambda \) v_0$ on all regular functions,
  by Lemma 33. Their baseline heights interpolate exactly because the height depends only on $h$ and the anchor
  coordinate. The bounds on $frak(B)$ show, for sufficiently small fixed $lambda$,
  that their $frak(B)$-normalized volumes are within any prescribed small fixed relative error of the original
  stage minimum. For example domination gives the volume factor $\( 1 - lambda \)^(- n)$,
  and the height changes by $O \( lambda \)$ relative to its positive lower bound.

The radial hull $\[ 0 \, 1 \] K_i^lambda$ still has a full-dimensional limit in $cal(R)_oo^perp$.
  Indeed $K_i^lambda$ contains $x \( v_0 \)$, and differences from that point span
  $lambda \( K_i - x \( v_0 \) \)$. Its linear span is therefore the same as that of $K_i$.
  The same statement holds in the limit. A compact convex set of full linear span containing zero has nonempty
  relative interior, so by Hausdorff convergence these radial hulls contain relative balls of radius bounded below
  in $cal(R)_i^perp$, unless that space has dimension zero.
  If there is an old anchor, choose such a ball away from anchor-coordinate zero:
  the comparator has nonzero anchor coordinate, and a convex combination with an interior point gives an interior
  point retaining that property. Radial truncation is used only to choose a direction;
  every nonzero direction chosen in it has an actual mixed representative, with the centred domination just established.

With an old anchor, write an integral row matrix as $\( b_i \, A \)$, where $A$ is its transverse part.
  After the subsequences already taken, $A$ is a fixed integral matrix of full row rank,
  and the entries of $b_i$ are $O \( R_(*) \)$. The feasible ratios $z_j = y_j \/ y_0$ satisfy

#[#set math.equation(numbering: n => "(7.26)")
 $ A z = - b_i . $ <eq:G-rational-affine>]

Directions in the ball away from $x_0 = 0$ give a relative ball of feasible ratios, in coordinates $z \/ R_(*)$.
  We can choose a point there with bounded common denominator and $z_j = O \( R_(*) \)$.
  To make the denominator assertion explicit, a fixed invertible minor of $A$ gives a particular solution of
  (7.26) with denominator dividing its determinant and size $O \( R_(*) \)$.
  The rational kernel of $A$ has a fixed lattice basis. Round in a fixed sufficiently fine denominator refinement
  of that lattice. Since $R_(*) gt.eq 1$, its mesh after division by $R_(*)$ is uniformly small enough to enter
  the specified ball. If the affine solution space has dimension zero,
  the particular solution is already the required exact ratio.
  Thus the denominator is bounded and the numerator bounds are $O \( L \/ L_1 \)$.

Without an old anchor, the full row matrix is fixed integral.
  If its orthogonal space is nonzero, the ball contains a nonzero rational direction of bounded complexity.
  Choose a nonzero coordinate as the new anchor and put $L_1 = L$.
  Choose the ball and direction so that this coordinate has absolute value at least a fixed positive constant;
  its actual mixed representative has that same lower bound or a larger one,
  since the radial factor lies in $\( 0 \, 1 \]$. If the orthogonal space has dimension zero,
  all selected values are already zero.

Impose the chosen proportions, or all zero values, by both-sign monomial tests. Their costs are $O \( L \)$:
  with an old anchor a row $d_j y_j - t_j y_0 = 0$ has cost $O \( d_j L + \| t_j \| L_1 \)$ with $d_j$ bounded and
  $\| t_j \| = O \( L \/ L_1 \)$; with a new anchor both coefficients are bounded.
  The selected actual mixed representative survives all these equations,
  so the new slice contains a centred point. Old proportionalities are retained by the old tests.
  In the cases with no new anchor, the exact baseline minimum on the pinned slice is as close to the preceding
  working valuation $w$ on all functions as desired, by choosing $lambda$ sufficiently small and applying the gap
  estimate on the original stage slice. In particular an old anchor still has $\| y_0 \| gt.eq c L_1$,
  and domination by a fixed multiple of $w$ holds.

When a new anchor is chosen, a further step is needed: equations on ratios alone do not prevent the minimizing
  vector from moving to zero. The prior baseline is then $q \( h \)$.
  Let $z$ denote the centred mixed comparator on the pinned slice. Choose the sign of the anchor so that

$ p_0 \( q \) = q \( Y_0^(upright("sign")) \) \/ L_1 \, wide p_0 \( z \) gt.eq c_1 > 0 . $

Its ordinary volume is within a prescribed small fixed error of the prior ordinary minimum $V_(*)$.
  Let $M = max p_0$ on this compact, $h = 1$-normalized slice. Thus $M gt.eq c_1$ and $M = O \( 1 \)$.
  For $0 lt.eq mu lt.eq \( 1 - rho \) \/ M$, consider

#[#set math.equation(numbering: n => "(7.27)")
 $ b_mu \( q \) = q \( h \) - mu p_0 \( q \) \, $ <eq:G-anchor-height>]

where $rho > 0$ is a small fixed number. These heights are bounded below by $rho$ and uniformly above.
  The exact minimizing ray varies continuously with $mu$, by Theorem 37.

At the endpoint $mu_(*) = \( 1 - rho \) \/ M$ the minimizer $v_(*)$ has $p_0 \( v_(*) \) gt.eq
  M \/ 2$ for small enough $rho$. Here are the estimates. Interpolate a maximizing witness for $p_0$ with $z$,
  assigning weight $rho$ to $z$. The interpolant $u$ is centred, has $b_(mu_(*)) \( u \) lt.eq 2 rho$, and (5.13),
  applied with $f = h$ and both inputs normalized by $h = 1$, gives

$ "vol" \( u \) lt.eq rho^(1 - n) "vol" \( z \) . $

Minimality and $"vol" \( v_(*) \) gt.eq V_(*)$ yield

$ b_(mu_(*)) \( v_(*) \) lt.eq 2 rho^(1 \/ n) #scale(x: 120%, y: 120%)[\(] "vol" \( z \) \/ V_(*)
  #scale(x: 120%, y: 120%)[\)]^(1 \/ n) < 1 / 2 $

for sufficiently small fixed $rho$. Therefore $p_0 \( v_(*) \) > M \/ \[ 2 \( 1 - rho \) \] gt.eq M \/ 2$.

If the minimizer at $mu = 0$ already has $p_0 gt.eq c_1 \/ 4$, use $mu = 0$.
  Otherwise continuity gives a nonempty open interval of parameters where $c_1 \/ 4 < p_0 \( v_mu \) < c_1 \/ 3$,
  and we choose a rational $mu$ in that interval. Since $p_0 \( z \) gt.eq c_1$,
  one has $b_mu \( z \) < b_mu \( v_mu \)$. Tilted minimality consequently gives

#[#set math.equation(numbering: n => "(7.28)")
 $ "vol" \( v_mu \) lt.eq (frac(b_mu \( z \), b_mu \( v_mu \)))^n "vol" \( z \) lt.eq
   "vol" \( z \) . $ <eq:G-anchor-volume>]

The same final bound is immediate at $mu = 0$. Thus the new minimizer still lies as near the original ordinary
  minimum as required, while its anchor value is bounded below by $c_1 L_1 \/ 4$.
  The gap estimate gives the required all-functions domination.
  Adopt this rational height as $frak(B)$ for all subsequent stages. It has the form (7.5) and bounds (7.4).

Finally take the rank refinement with error tending to zero,
  sufficiently small to preserve the anchor lower bound. This preserves the pinning equalities,
  the exact pair and test identities, and the independent symbols by Lemma 49.
  It supplies balance and (3.5) and does not use the next-scale field and lattice assertions.
  Thus Section 7.1–(7.5) hold with $L_(-) = L$, proving Proposition 51.
  It remains to verify the two next-scale assertions.

=== 7.8 Field and lattice consequences of the pin <subsec:G-pin-consequences>

#thm([Lemma 7.6.])[
  #emph[The working valuation $w'$ furnished by Proposition 51 satisfies (7.8)–(7.8) at the next scale $L_(-) = L$.]
] <lem:G-pin-consequences>

#proof[
  The proposition supplies the new exact tests, rational proportions and, when present, the anchor lower bound.
    It also gives $w' gt.eq c w$ on all regular functions, so the transferred count (7.11) remains available with
    a fixed constant.
  Use double bars for the initial symbols at $w'$. Let $E$ be the field generated by the $p$ chosen algebraically
    independent $overline(overline(G_a))$ and the $s$ selected variable symbols.
    These have transcendence degree $p + s$, by Lemma 49: they were independent together at $w$,
    since the selected variable weights were independent and the chosen $G_a$ were neutral.
    Write $E^0$ for its subfield of weight zero. Every common test on the new cone is trivial on $E^0$.
    Indeed, the both-sign pinning equations also hold on that cone.
    If there is an anchor, its nonzero value at $w'$ ensures that two selected monomials with equal weight at $w'$
    have equal value at every common test; in the all-zero case this is immediate.
    Lemma 49 then gives the predicted exact value for each nonzero homogeneous polynomial.
    Ratios of homogeneous polynomials of equal weight generate $E^0$, proving the assertion.
  There is also a space $V_0$ of invariant ratios on this new cone, of cost and absolute grading value $O \( L \)$, with
  #[#set math.equation(numbering: n => "(7.29)")
   $ dim V_0 gt.eq c R_(*) v_i . $ <eq:G-large-space>]
  Take the double-bar symbols of the whole $G_a$ basis, and, if an old anchor was present,
    multiply by its powers with exponent from $0$ to $floor.l R_(*) floor.r$. Their costs remain $O \( L \)$.
    They are linearly independent at $w$ by their distinct anchor weights and the basis property,
    and remain so by Lemma 49.
  Choose an enlargement $V$ of $V_0$, with the same type of fixed cost and grading bounds, containing $1$,
    the specified generators of $E$, and every neutral function in $S \( L D_(upright("next")) \)$.
    We may also include in $V$ a nonzero homogeneous ratio of weight a bounded positive multiple of any chosen new
    lattice vector $k$ of width $O \( L \)$. For the latter use Corollary 27 at $w'$:
    the refined cone satisfies (3.5), and tiny $L D_(upright("next"))$ forces all new tests by the same
    integrality and cost argument as before. The space $V$ is spanned by homogeneous ratios.
    Give all products of $N$ members of $V$ one common denominator $h^t$, where $t = O \( N L \)$;
    their regular numerators then have a single finite character and degree $O \( N L \)$.
    The transferred upper bound (7.11) applies.
  If the field generated by $V$ had transcendence degree $a > p + s$,
    Lemma 50 and (7.29) would give at least $c R_(*) v_i N^a$ independent products,
    against $C' R_(*) v_i N^(p + s)$. Choose one sufficiently large fixed $N$ and then let $i$ be sufficiently
    large. This contradiction shows that the field generated by $V$ is algebraic over $E$.
    Uniformity for the chosen $k$ follows by applying this argument to any alleged sequence of failing choices.
  A neutral element algebraic over $E$ is algebraic over $E^0$.
    In fact, clear denominators in an algebraic equation so that its coefficients are polynomials in the
    homogeneous generators of $E$, take a nonzero homogeneous part of the equation,
    and divide by a nonzero coefficient of that weight. All resulting coefficients have weight zero.
    Common tests are trivial on $E^0$, and hence on these algebraic elements.
    The Gauss description and finite-cover lifting translate this back to every angular test in $cal(L)$,
    proving assertion (7.8) for the next scale.
  The same algebraic equation argument shows that the weight of an algebraic homogeneous element lies in the
    rational span of the weights of $E$. The latter is the anchor line or zero.
    This proves the first part of assertion (7.8). To bound its index in the line case write $kappa'_0 =
    ell k'_0$ with $k'_0$ primitive. Its width is $O \( L_1 \)$ by the paired anchor costs.
    If $ell arrow.r oo$, apply the bounded-multiple construction at the current scale $L$ to all $j k'_0$,
    $1 lt.eq j lt.eq ell$. Their widths are $O \( L_1 \)$ and $L_1 lt.eq L$.
    There are symbols of weights $q_j j k'_0$, with $1 lt.eq q_j lt.eq Q$ for fixed $Q$,
    and cost and absolute grading value $O \( L \)$. These bounds are uniform over all these choices:
    otherwise a sequence of failing $j_i$ would contradict the arbitrary-sequence version of Corollary 27.
  Let $D_0$ be a fixed common multiple of the bounded denominators of the finitely many pinned variable weights.
    The subgroup generated by those weights has primitive step $h_i gt.eq ell \/ D_0$, and $h_i$ divides $ell$.
    Among the integers $q_j j$, an integer has at most $Q$ preimages,
    and each residue modulo $h_i$ has at most $Q D_0 + 1$ representatives in $\[ 1 \, Q ell \]$. Hence at least
  $ frac(ell, Q \( Q D_0 + 1 \)) $
  distinct residues occur. All weights of the original space $V_0$ in (7.29) lie in this subgroup.
    With an old anchor its basis consists of neutral symbols multiplied by powers of that anchor;
    when the pin has just chosen a new anchor, $V_0$ consists only of neutral symbols.
    Multiplying this original $V_0$ by symbols representing distinct residues yields a direct sum,
    since the weight supports are disjoint. Its dimension is an unbounded multiple of $R_(*) v_i$,
    while its costs and degrees are $O \( L \)$. The fixed-$N$ version of (7.11) forbids this.
    Thus $ell$ is bounded, completing assertion (7.8). ◻
]

=== 7.9 Termination <termination>

#proof[
  Assume the excluded sequence exists. The initial data satisfy Section 7.1–(7.5).
    At every stage, either the sole remaining anchor line gives the primitive-discrepancy contradiction above,
    or a nonempty independent block of new directions can be chosen.
    A bounded block is pinned directly by (7.1); a high block is pinned by the finite row procedure,
    the rational-direction choice, and, if required, the anchor-height adjustment.
    The next-stage invariants then hold by the field and lattice argument.
    Each nonterminal stage adds at least one new positive variable,
    and their initial symbols remain algebraically independent at the next working valuation.
    A function field of dimension $n$ cannot contain more than $n$ algebraically independent elements.
    Thus the process cannot have more than $n$ nonterminal stages,
    whereas all its terminal alternatives have been excluded. This contradiction proves the theorem. ◻
]

== 8 From complement failure to the pinning input <sec:H>

We prove Theorem 2 by translating a failure of bounded klt complements into the sequence excluded by Theorem 48.
  The construction uses a canonical cover when the birational morphism is an isomorphism,
  and a signed anti-canonical torsor otherwise. We then apply Chen’s equivalence and justify the passage between
  algebraically closed fields of characteristic zero.

=== 8.1 A prime saturating the complete systems <a-prime-saturating-the-complete-systems>

Fix a dimension $d > 0$ and $0 < epsilon.alt lt.eq 1$, and suppose the birational complement assertion fails over
  $bb(C)$. Birkar’s relative complement theorem gives an integer $b =
  b \( d \) > 0$ such that every example has an lc $b$-complement near its specified point
  #cite(label("BirkarComplements")) Theorem 1.8. The hypotheses are precisely Fano type, the zero boundary,
  and nef $- K_X$; in particular no generalized nef-part index is being imposed.
  Choose a sequence with no klt $M_i$-complement, where $M_i > 1$ tends to infinity, $b divides M_i$,
  and every fixed positive integer divides $M_i$ eventually.
  For example, sufficiently large factorials have these properties.
  Failure of a uniform index allows this choice for each prescribed $M_i$.

We may assume $- K_X$ is ample over $Z$. On a variety of Fano type,
  the relative Mori dream space consequences of the klt MMP imply that nef $-
  K_X$ is semiample #cite(label("BCHM")). Since $f$ is birational, this divisor is relatively big.
  Its ample model is thus a birational contraction $g : X arrow.r X^(upright(a))$ over $Z$.
  A divisible multiple of $- K_X$ is the pullback of its ample model divisor.
  Pushing compatible canonical divisors forward identifies the latter with the corresponding multiple of $-
  K_(X^(upright(a)))$, so $K_X = g^(*) K_(X^(upright(a)))$ after compatible choices.
  Equivalently, a possible rational principal adjustment descends because the function fields agree.
  Thus the contraction is crepant, $X^(upright(a))$ remains $epsilon.alt$-lc and of Fano type over $Z$,
  and klt complements on it pull back to klt complements on $X$ #cite(label("ProkhorovShokurov")).
  Applying the lc complement theorem on this model and replacing $X$ by it preserves the failure under consideration.

Shrink $Z$ to an affine neighbourhood of the specified point.
  For every integer $k$, a section of $cal(O)_X \( - k K_X \)$ is represented by a rational function $s$ with

#[#set math.equation(numbering: n => "(8.1)")
 $ Delta_s = "div" \( s \) - k K_X gt.eq 0 . $ <eq:H-section-divisor>]

The degree-$b$ complement is represented by $s_b$ and satisfies $\( X \, Delta_(s_b) \/ b \)$ lc.
  Here and below all section systems are complete relative systems on this neighbourhood.

#thm([Proposition 8.1.])[
  (Factorial saturation).  #emph[For each example there is a primitive divisorial order $w$ over $X$ whose image
    centre on $Z$ contains the specified point and for which
#[#set math.equation(numbering: n => "(8.2)")
 $ w \( Delta_s \) gt.eq k A_X \( w \) quad \( k > 0 \, med k divides M_i \) \, wide w \( Delta_(s_b) \) =
   b A_X \( w \) . $ <eq:H-saturation>]

 After replacing the example by a geometric generic slice,
   one may assume that the image centre is a closed point $z$, that $1 lt.eq dim X = dim Z lt.eq d$,
   and that all the inequalities hold for the complete local systems at $z$.]
] <prop:H-saturation>

#proof[
  The coherent sheaf $f_(*) cal(O)_X \( - M_i K_X \)$ has finitely many generators on the affine base.
    Resolve their fractional ideal of ratios to a fixed section, together with the relevant divisors.
    On the resulting smooth model $p : Y arrow.r X$, their pulled-back divisor system has a common fixed
    $bb(Q)$-divisor $F$ and a basepoint-free residual system.
    This construction is valid even if $M_i K_X$ is not Cartier:
    each section divisor is $bb(Q)$-Cartier, their differences are principal,
    and principalizing the fractional ratio ideal makes the moving differences Cartier.
    The fixed divisor has order equal to the minimum of the section orders at every prime on the model.
  The section $s_b^(M_i \/ b)$ belongs to this system. Therefore $F \/ M_i lt.eq p^(*) \( Delta_(s_b) \/ b \)$,
    and the fixed-order discrepancy
  $ A_X \( E \) - frac("ord"_E \( F \), M_i) $
  is nonnegative for every prime $E$ over $X$. Take the support on $Y$ to be simple normal crossings.
    A general residual member, with coefficient $1 \/ M_i < 1$, is transverse to this support.
    If every fixed-order discrepancy were strictly positive over a neighbourhood of the specified point,
    this general member would give a klt $M_i$-complement there.
    The only possible zero discrepancies of the fixed log smooth data come from strata containing a
    coefficient-one component. There are finitely many such components,
    and their images in $Z$ are closed because $Y arrow.r Z$ is proper.
    Thus the absence of a klt complement on every neighbourhood implies that one component $E$ with image
    containing the specified point has $"ord"_E \( F \) = M_i A_X \( E \)$. Set $w = "ord"_E$.
  For $k divides M_i$ and any section $s$ in degree $k$, its power $s^(M_i \/ k)$ is in degree $M_i$.
    Hence $\( M_i \/ k \) w \( Delta_s \) gt.eq "ord"_E \( F \) = M_i A_X \( w \)$.
    The same inequality for $s_b$, together with lc of the chosen complement, gives equality in degree $b$.
    These statements also apply to local sections: coefficients in the local base ring have nonnegative $w$-order,
    and shrinking the base only inverts functions of order zero whenever the centre still contains the specified point.
  Write $W$ for the image centre of $w$ on $Z$. It is a proper closed subset:
    $w \( Delta_(s_b) \) > 0$ and a divisorial centre cannot dominate the birational base.
    If $q = dim W > 0$, choose a general linear projection $Z arrow.r
    upright(bold(A))^q$ that is dominant and generically finite on $W$.
    Pass to the geometric generic fibre and follow a component of $E$.
    The image of that component in the new base is a closed point, and the new dimension is $dim X - q gt.eq 1$.
  Here are the required preservation details. The prime $E$ is horizontal over $upright(bold(A))^q$.
    After shrinking its base, the chosen resolution and its finitely many relevant strata are smooth wherever they
    dominate this base. Dividing a top form by a base volume form therefore restricts compatible canonical
    divisors to the generic fibre, preserving the log discrepancies and section-divisor orders.
    Extending the generic constant field separably does not ramify these prime orders:
    the nonzero discriminant of a finite separable constant extension is a unit in their valuation rings.
    Geometric integrality can be obtained by choosing the corresponding components after this extension.
  Divisorial sheaves restrict to the corresponding divisorial sheaves by localization and separable scalar
    extension, as is seen on the smooth locus and then in codimension one.
    Flat base change for the proper morphism shows that the original generators generate the new complete systems;
    only the finitely many degrees dividing $M_i$ and the degree $b$ are needed here.
    Their inequalities hence hold for every local section at the new image point.
    Normality, birationality, the discrepancy bound, relative ampleness of $- K_X$,
    and a Fano type witness are preserved by this operation. Thus all the conclusions survive the slice.
    The algebraically closed generic field of the complex base is isomorphic to $bb(C)$;
    alternatively the finite data can again be embedded into $bb(C)$.
    We retain the notation $X \, Z \, z \, w$ for these new data. ◻
]

After a subsequence the new dimension and which of the following two constructions applies are fixed.
  We keep the original bounded integer $b$, even if the dimension has decreased.

=== 8.2 The canonical cover and the signed torsor <the-canonical-cover-and-the-signed-torsor>

#thm([Lemma 8.2.])[
  (The isomorphic case).  #emph[Suppose $f$ is an isomorphism near $z$.
    There is a normal integral cyclic cover $S_0 arrow.r X$, with a unique point $o$ over $z$,
    a quasi-étale cyclic action fixing $o$, and a divisor-free canonical generator of character one.
    It has a regular eigenfunction $f_b = s_b t^b$ of character $b$ and a divisorial valuation $w_0$ centred at
    $o$ such that, with $A_0 = A_(S_0) \( w_0 \) > 0$,
#[#set math.equation(numbering: n => "(8.3)")
 $ \( S_0 \, "div" \( f_b \) \/ b \) upright(" is lc") \, wide w_0 \( f_b \) = b A_0 \, wide w_0 \( a \) gt.eq
   k A_0 $ <eq:H-upstairs-saturation>]

 for every regular eigenfunction $a$ of character $k$ when $k > 0$ and $k divides M_i$. The variety $S_0$ is klt.]
] <lem:H-canonical-cover>

#proof[
  Let $r$ be the local Cartier index of $K_X$ and shrink so that $r K_X = "div" \( c \)$. Normalize $X$ in
  $ t^r = c^(- 1) \, $
  with the cyclic group acting on $t$ by its standard character. The cover is integral of degree $r$.
    Indeed a smaller Kummer degree would make $c^(- 1)$ a $p$th power for a prime $p divides r$,
    and then $\( r \/ p \) K_X$ would be principal, contrary to minimality.
    At a prime of $X$, $K_X$ is Cartier and the exponent of $c$ is divisible by $r$.
    The codimension-one Kummer calculation shows that the cover is quasi-étale.
    If $"div" \( omega_X \) = K_X$, the form $t omega_X$ has divisor zero upstairs.
    Finite crepant pullback proves that $S_0$ is klt.
  A fibre of this finite quotient is a single orbit: invariant functions separate distinct finite orbits.
    If the fibre over $z$ had more than one point, regular functions separating its points would have a nontrivial
    eigencomponent nonzero at one, hence at every, point of that orbit.
    After shrinking by its invariant norm, it would be an eigenunit. Write it $s t^j$ with $0 < j < r$.
    The codimension-one calculation gives $"div" \( s \) = j K_X$, contradicting the minimal index.
    Thus the fibre is one fixed point.
  For every integer $k$, the regular functions of character $k$ are precisely $s t^k$ with $s in
    cal(O)_X \( - k K_X \)$; changing $k$ by $r$ is accommodated by $t^r = c^(- 1)$.
    Their divisors are the pullbacks of $Delta_s$. Extend $w$ to a primitive divisorial valuation $w_0$ on the
    cover. Its centre is $o$. If its restriction is $e w$, finite crepant pullback gives $A_(S_0) \( w_0 \) =
    e A_X \( w \)$ and $w_0 \( s t^k \) = e w \( Delta_s \)$. Equation (8.2) proves all the assertions. ◻
]

For the second construction, retain the grading variable $t$ as an indeterminate, and write $K = bb(C) \( X \) =
  bb(C) \( Z \)$. Choose a rational top form $omega_X$ with $"div" \( omega_X \) = K_X$.
  The positive degrees record the anti-canonical section inequalities. We also keep negative degrees:
  after restriction to a finite scalar group, one character space contains degrees of both signs.
  Bounds on both signs will therefore be needed to control every section of a fixed character.

#thm([Lemma 8.3.])[
  (The signed anti-canonical torsor).  #emph[Suppose $f$ is not an isomorphism near $z$. The signed algebra
#[#set math.equation(numbering: n => "(8.4)")
 $ R = xor.big_(k in bb(Z)) H^0 \( X \, cal(O)_X \( - k K_X \) \) t^k \, wide S_0 = "Spec" R \, $ <eq:H-signed-algebra>]

 over the affine base is a finitely generated normal domain of dimension $dim X + 1$.
   Write $R_k = H^0 \( X \, cal(O)_X \( - k K_X \) \) t^k$ for its homogeneous part of degree $k$.
   Its #emph[positive chamber] is the open
$ S_0^(+) = union.big_(k > 0) med union.big_(0 eq.not a in R_k) D_(S_0) \( a \) \, $

 where $D_(S_0) \( a \)$ is the principal open on which $a$ does not vanish.
   This chamber has complement of codimension at least two. The form
#[#set math.equation(numbering: n => "(8.5)")
 $ Omega_0 = t omega_X and d log t $ <eq:H-torsor-form>]

 is a divisor-free canonical generator of grading weight one,
   and every finite scalar grading subgroup acts quasi-étalely.]
  #emph[The variety $S_0$ is klt, and $\( S_0 \, "div" \( s_b t^b \) \/ b \)$ is lc.
    There is a grading-fixed closed point $o$ over $z$ and a rational Gauss valuation $w_0$ centred there which
    satisfies (8.3) for every actual positive degree $k divides M_i$.
    Moreover there are numbers $alpha > 0$ and $F_w > alpha$, depending on the example,
    for which every nonzero homogeneous section satisfies
#[#set math.equation(numbering: n => "(8.6)")
 $ w_0 \( s t^k \) gt.eq cases(delim: "{", k alpha \, & k > 0 \,, \| k \| \( F_w - alpha \) \, & k < 0 .)
   $ <eq:H-two-slopes>]

]
] <lem:H-signed-torsor>

#proof[
  #emph[Finite generation and normality.] The positive algebra is finitely generated by relative ampleness of $-
    K_X$. For the negative algebra, take a small $bb(Q)$-factorialization and a $K$-MMP over $Z$.
    Fano type gives termination and a semiample output, since every divisor is relatively big for a birational
    contraction #cite(label("BCHM")). The integral-degree section spaces are preserved in these steps.
    To check this without assuming a Cartier index in degree one, on a common model write $p^(*) K_(X_1) =
    q^(*) K_(X_2) + E$ for a $K$-MMP step, where $E$ is effective and $q$-exceptional.
    An effective section divisor $"div" \( s \) + m K_(X_1)$ pushes to an effective section divisor on $X_2$.
    Conversely, the pullback of an effective section divisor on $X_2$, plus $m E$, is effective,
    and pushes to its section divisor on $X_1$. These are rational pullbacks,
    valid for every integral $m > 0$ because the divisors involved are $bb(Q)$-Cartier;
    one can equivalently verify the inequalities after taking a Cartier power.
    The initial small modification identifies the divisorial sheaves in codimension one.
    On the semiample output $Y$, let $g : Y arrow.r Y^(upright(c))$ be the semiample contraction and choose $r
    K_Y = g^(*) L$ with $L$ relatively ample. For each $0 lt.eq j < r$,
    the projection formula identifies the residue module with
  $ xor.big_(a gt.eq 0) H^0 #scale(x: 120%, y: 120%)[\(] Y^(upright(c)) \,
    g_(*) cal(O)_Y \( j K_Y \) ⊗ cal(O)_(Y^(upright(c))) \( a L \) #scale(x: 120%, y: 120%)[\)] . $
  The pushforward is coherent by properness, so this is finite over the ample section ring.
    The Cartier Veronese is finitely generated and the finitely many residue modules are finite over it.
    The negative algebra is therefore finitely generated. The union of generators of the two half-algebras
    generates $R$.
  The ring $R$ is the intersection of $K \[ t \, t^(- 1) \]$ with the Gauss valuation rings specified,
    for every prime $D$ of $X$, by
  $ "ord"_D \( s \) - k "coeff"_D \( K_X \) gt.eq 0 quad upright("on ") s t^k . $
  This follows from the codimension-one description of a divisorial sheaf, and proves normality.
    Its fraction field is $K \( t \)$: the fraction field of degree zero is $K$,
    and the generic fibre contains every integral degree. In particular $dim S_0 = dim X + 1$.
  #emph[The positive chamber and the canonical form.] We prove that every prime divisor meets the positive
    chamber, where the canonical form can be computed on a Laurent bundle.
    Suppose that a prime divisor $P$ lies outside it. The connected grading torus preserves every irreducible
    component of this complement, so $P$ is homogeneous. It cannot contain all nonzero graded pieces.
    Indeed the locus where they all vanish is a closed subscheme of $Z$ missing its generic point,
    where the signed algebra is $K \[ t \, t^(- 1) \]$. That locus has dimension at most $dim Z - 1 = dim S_0 - 2$.
  Choose a negative homogeneous element $q$ of degree $- m$ not in $P$. Set
  $ A = R \[ q^(- 1) \] = R_(lt.eq 0) \[ q^(- 1) \] \, wide C = A_0 . $
  The equality follows by multiplying any positive-degree element by sufficiently many powers of $q$.
    The ring $C \[ q \, q^(- 1) \]$ is a Laurent polynomial ring: its nonzero powers have different degrees.
    For a homogeneous $a in A_k$ the identity
  #[#set math.equation(numbering: n => "(8.7)")
   $ a^m q^k in C \, wide a^m = \( a^m q^k \) q^(- k) $ <eq:H-laurent-integrality>]
  proves integrality over this Laurent ring. Both formulas are valid for negative $k$,
    because $q$ is a unit on this chart. Finite generation then makes $A$ finite over $C \[ q \, q^(- 1) \]$.
    The ring $C$ contains the affine base ring $R_0$ and lies in $K$, so $"Frac" C = K$.
  The height-one homogeneous prime induced by $P$ contracts to a height-one homogeneous prime of
    $C \[ q \, q^(- 1) \]$. Since $q$ is invertible, that contracted prime is generated by its intersection with
    $C$ and lies over a prime divisor of $"Spec" C$, a chart of the negative Proj.
    This also excludes trivial restriction to $K$: there is no homogeneous prime divisor solely in the invertible
    Laurent direction. The negative Proj is the relatively ample $K$-model obtained by the small modification,
    the $K$-MMP and its semiample contraction. None of these operations extracts divisors.
    The prime in question therefore has a strict transform $D$ on $X$; its restriction has the form $w' =
    e "ord"_D$, $e > 0$.
  There are sections of both sufficiently divisible signs whose $Delta$-orders at $D$ are zero.
    For the positive sign this is relative generation of a multiple of $- K_X$.
    For the negative sign use a generated multiple of $K$ on its ample model avoiding the surviving prime.
    The birational map identifies the two generic DVRs and their compatible canonical coefficients.
    Its section lifts through the preserved section space, and the effective MMP correction has zero coefficient
    at this strict divisor. Thus its $Delta$-order on $X$ is also zero.
    Relative generation supplies both sections globally over the affine base with the indicated degree signs.
  Let $v = "ord"_P$, and put $beta = v \( t \) + w' \( K_X \)$,
    where $w' \( K_X \)$ means rational pullback order. For a homogeneous element,
  #[#set math.equation(numbering: n => "(8.8)")
   $ v \( s t^k \) = w' \( Delta_s \) + k beta . $ <eq:H-gauss-order>]
  Nonnegativity of $v$ on the two zero-multiplicity sections forces $beta gt.eq 0$ and $beta lt.eq 0$.
    Hence $beta = 0$, and the positive section just chosen has value zero,
    contrary to $P$ being outside the positive chamber. This proves the codimension assertion.
  On the positive chamber the signed algebra is the usual Laurent divisorial bundle over $X$.
    To see this on a Proj chart, localize at a divisible positive section.
    Poles along its complementary Cartier divisor can be cleared by its powers,
    identifying every degree piece with the corresponding localized divisorial sheaf on $X$.
    A Cartier Veronese is a line bundle with its zero section removed,
    and the full chart is finite over that bundle by taking powers.
    In particular the inverse image of a codimension-at-least-two subset of $X$ has codimension at least two.
    At a regular codimension-one point write $K_X = "div" \( c \)$; then $c t$ is an invertible Laurent coordinate and
  $ t omega_X and d log t = \( c t \) \( omega_X \/ c \) and d log \( c t \) . $
  This is a nowhere-vanishing top form, and every nonidentity finite scalar acts freely there.
    The established codimension-two complements extend these conclusions to the assertions about $Omega_0$ and
    quasi-étaleness on $S_0$.
  #emph[Discrepancies and the lc boundary.] The form also controls valuations whose centres lie outside the
    positive chamber. We will use its discrepancy estimate both for the boundary defined by $s_b
    t^b$ and for the finite quotients in Lemma 57. If a divisorial multiple $v$ centred on $S_0$ has nontrivial
    restriction $w'$ to $K$, the relative Abhyankar inequality makes $w'$ a divisorial multiple:
    its value group is discrete, and adjoining $t$ increases residue transcendence degree by at most one,
    forcing its residue field to have transcendence degree $dim X - 1$ over $bb(C)$.
    Its centre exists on $X$ by properness. Relative generation of a positive Cartier multiple gives $beta =
    v \( t \) + w' \( K_X \) gt.eq 0$. The top form gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ A_(S_0) \( v \) gt.eq A_X \( w' \) + beta \, $ <eq:H-torsor-discrepancy>]
  with equality for a Gauss extension. One can compute this on a smooth model at the prime defining $w'$.
    Choose a uniformizer $x$ and separating residue coordinates $y_1 \, dots.h \, y_(dim X - 1)$.
    The ratio of $omega_X$ to $d log x and d y_1 and dots.h.c and d y_(dim X - 1)$ has $w'$-order $A_X \( w' \) +
    w' \( K_X \)$. After wedging with $d log t$, the remaining logarithmic differential has nonnegative log order
    at $v$. Indeed, at an upstairs uniformizer $rho$, every logarithmic differential has at most a simple $d
    rho \/ rho$ pole, at most one such factor survives a wedge,
    and the differentials of the residue-coordinate units are regular.
    At a Gauss valuation its residues are independent and this log order is zero. Multiplication by $t$ yields (8.9).
  If $w'$ is trivial, work on the smooth generic fibre $"Spec" K \[ t \, t^(- 1) \]$;
    a centred valuation there has $v \( t \) = 0$ and positive discrepancy. Thus $S_0$ is klt.
    For a nontrivial restriction, (8.8), (8.9), and lc of the actual degree-$b$ complement give
  $ A_(S_0) \( v \) - frac(v \( s_b t^b \), b) gt.eq A_X \( w' \) - frac(w' \( Delta_(s_b) \), b) gt.eq 0 . $
  For trivial restriction, $v \( s_b t^b \) = 0$. Consequently the displayed boundary pair is lc.
    It has the lc place constructed next and is not being asserted to be klt.
  #emph[A centred order with two slopes.] It remains to construct the closed point and its saturated valuation.
    The positive slope will come from a choice of Gauss weight;
    the negative slope comes from vanishing on the fibre. Every irreducible component of the reduced fibre over
    $z$ has positive dimension. An isolated zero-dimensional component would disconnect the fibre unless the whole
    fibre were finite; a proper birational morphism to a normal base with a finite fibre is an isomorphism after
    shrinking, the excluded case. A negative-degree section, raised to a Cartier power,
    restricts on each such projective component to a section of an antiample line bundle.
    It is therefore zero on every component. Its effective divisor contains the entire reduced fibre,
    so its order at the specified $w$ is strictly positive. This argument only concerns reduced supports and also
    covers nonreduced fibres.
  Choose finitely many negative-ring generators $s_j t^(- m_j)$ over the degree-zero ring and set
  $ F_w = min_j frac(w \( Delta_(s_j) \), m_j) > 0 . $
  Every negative homogeneous section is a homogeneous polynomial in these generators with base coefficients of
    nonnegative $w$-order. It follows that $w \( Delta_s \) gt.eq \| k \| F_w$ for $k < 0$.
    Choose a rational $0 < alpha < F_w$, and let $w_0$ be the Gauss extension of $w$ with $w_0 \( t \) +
    w \( K_X \) = alpha$. Formula (8.8) defines it, and gives (8.6);
    for the positive sign use effectivity of $Delta_s$. All nonzero degrees have strictly positive value,
    while the degree-zero maximal ideal is $frak(m)_z$. Thus $w_0$ is centred at the fixed closed point with ideal
    generated by these elements. A rational Gauss extension of a divisorial valuation is itself divisorial up to
    scaling. Equality in (8.9) gives $A_0 = A_X \( w \) + alpha$,
    and (8.2) now yields (8.3) in actual positive degrees. ◻
]

=== 8.3 The quotient gap and matching the canonical character <the-quotient-gap-and-matching-the-canonical-character>

In the canonical-cover case retain its cyclic group. In the torsor case choose any finite scalar subgroup $mu_r$;
  its order will be fixed below, after the individual slopes in (8.6) are known.
  All characters in the next lemma are expressed relative to the standard character of this cyclic group.

#thm([Lemma 8.4.])[
  (Padding and the actual quotient discrepancy).  #emph[In either construction, set
$ S = S_0 times upright(bold(A))^(b - 1) \, wide \( o \, 0 \) in S \, $

 and give every added coordinate $u_j$ character one. Then $S$ is klt, the finite quotient $Y =
   S \/ mu_r$ is $epsilon.alt$-lc, and the canonical generator on $S$ has character $b$.
   There is a regular function $h$ of character $b$ such that $\( S \, "div" \( h \) \)$ is lc and a centred
   quasi-monomial valuation $T_0$ such that
#[#set math.equation(numbering: n => "(8.10)")
 $ A_S \( T_0 \) = T_0 \( h \) = b A_0 . $ <eq:H-padding-equality>]

]
] <lem:H-padding>

#proof[
  The product is klt. The action remains quasi-étale: the fixed locus of every nonidentity element has codimension
    at least two already in $S_0$. Wedging its canonical generator with $d u_1 and dots.h.c and
    d u_(b - 1)$ gives a divisor-free generator of character $b$.
    A suitable power descends through the finite quotient, so $K_Y$ is $bb(Q)$-Cartier and the quotient map is crepant.
  Quasi-étaleness alone would not preserve a prescribed discrepancy gap.
    Let $E$ be an actual prime divisor over $Y$, and normalize an extension $v$ to $bb(C) \( S \)$ so that its
    restriction to $bb(C) \( Y \)$ is $"ord"_E$. Finite crepant pullback, with homogeneous discrepancies,
    gives $A_Y \( E \) = A_S \( v \)$. Although $v$ may take fractional values upstairs, the field $K =
    bb(C) \( X \)$ is pointwise invariant and is contained in $bb(C) \( Y \)$.
    If $w' = v \|_K$ is nontrivial, its values are integral. The relative Abhyankar inequality then gives
  $ w' = e "ord"_F quad upright("for a prime ") F upright(" over ") X quad upright("and an integer ") e gt.eq 1 . $
  For the torsor, the log-form calculation above, with the additional coordinate forms, yields
  $ A_S \( v \) gt.eq A_X \( w' \) + beta + sum_j v \( u_j \) gt.eq e epsilon.alt gt.eq epsilon.alt . $
  Here $beta gt.eq 0$ by positive generation, each $u_j$ is regular,
    and the non-Gauss logarithmic differential defect is nonnegative.
    For the canonical cover, first restrict to $bb(C) \( S_0 \)$ and use the product log-form estimate;
    finite crepant pullback from $S_0$ to $X$ then gives the same lower bound $A_X \( w' \)$.
  If $w'$ is trivial, the valuation lies over the common generic point of the birational varieties $X$ and $Z$.
    The generic quotient is smooth: the canonical cover there is a cyclic torsor,
    and the signed construction is a Laurent line with a free scalar action;
    their products with the coordinate representation have smooth quotients.
    Generic restriction of the ordinary prime $E$ is still a primitive prime,
    since localization at the trivially valued base field does not change its value group or uniformizer.
    Its discrepancy on this smooth generic quotient is at least one, hence at least $epsilon.alt$.
    This proves the required gap for every actual quotient prime.
  Put $f_b = s_b t^b$ and take a general combination
  #[#set math.equation(numbering: n => "(8.11)")
   $ h = a_0 f_b + a_1 u_1^b + dots.h.c + a_(b - 1) u_(b - 1)^b . $ <eq:H-h-function>]
  We check lc using the ideal $I = \( f_b \, u_1^b \, dots.h \, u_(b - 1)^b \)$.
    For any divisorial valuation $v$ with nontrivial restriction $v_0$ to $bb(C) \( S_0 \)$,
    that restriction is divisorial up to scaling and the product differential calculation gives
  $ A_S \( v \) gt.eq A_(S_0) \( v_0 \) + sum_j v \( u_j \) gt.eq frac(v \( f_b \), b) + sum_j v \( u_j \) gt.eq
    min { v \( f_b \) \, b v \( u_1 \) \, dots.h \, b v \( u_(b - 1) \) } . $
  If the restriction is trivial, $v \( f_b \) = 0$ and the same ideal inequality holds because $S$ is klt.
    Therefore $\( S \, I \)$ is lc. On a resolution of the ideal,
    a general residual member is smooth and transverse to the fixed log smooth boundary;
    with coefficient one this proves $\( S \, "div" \( h \) \)$ lc. All summands of $h$ have character $b$.
  Finally extend $w_0$ by the joint Gauss valuation giving every $u_j$ weight $A_0$.
    It is centred at $\( o \, 0 \)$ and quasi-monomial, and its product discrepancy is $A_0 + \( b - 1 \) A_0 =
    b A_0$. Every summand of $h$ has that value. Their initials do not cancel for a general choice of the $a_j$
    (the added coordinates are independent), giving (8.10). When $b =
    1$ there are no added coordinates and $h$ is simply a nonzero scalar multiple of $f_b$. ◻
]

#thm([Proposition 8.5.])[
  (The pinning input).  #emph[The failure sequence produces, after a subsequence,
    a fixed-dimensional sequence satisfying every hypothesis of Theorem 48.]
] <prop:H-g-input>

#proof[
  Let $chi$ be character $b$ of the chosen cyclic group; it need not be faithful.
    Normalize $T = T_0 \/ \( b A_0 \)$. The preceding lemma gives
  $ A_S \( T \) = T \( h \) = 1 \, wide \( S \, "div" \( h \) \) upright(" lc") \, wide
    S \/ mu_r upright(" is ") epsilon.alt upright("-lc") \, $
  and $h$ and the divisor-free canonical generator both have character $chi$.
    It remains to check, for each fixed positive integer $m$, that eventually
  #[#set math.equation(numbering: n => "(8.12)")
   $ T \( a \) gt.eq m quad upright("for every regular eigenfunction ") a upright(" of character ") chi^m .
     $ <eq:H-final-saturation>]
  Expand a polynomial eigenfunction in monomials in the added coordinates.
    A monomial of total degree $j$ has $T_0$-value $j A_0$. If $j gt.eq b m$, this already suffices,
    since its coefficient is regular and has nonnegative value. Otherwise its coefficient on $S_0$ has character
  $ k = b m - j > 0 . $
  In the canonical-cover case, that entire eigenspace is the degree-$k$ section space described in Lemma 55.
    Since every fixed $k$ divides $M_i$ eventually, its coefficients have value at least $k A_0$.
    The monomial therefore has value at least $\( j + k \) A_0 = b m A_0$.
  In the signed torsor, coefficients decompose into actual degrees $k + ell r$, $ell in bb(Z)$.
    For $ell = 0$ use the same factorial saturation. For $ell eq.not 0$ use both strict slopes in (8.6).
    At example $i$, choose $r_i > i$ so large that
  #[#set math.equation(numbering: n => "(8.13)")
   $ \( r_i - i \) min { alpha \, F_w - alpha } gt.eq i A_0 . $ <eq:H-cyclic-order>]
  For $1 lt.eq k lt.eq i$, every nonzero residue shift has $\| k + ell r_i \| gt.eq r_i - i$,
    so its value is at least $i A_0 gt.eq k A_0$. This also gives the desired monomial bound.
    The choice is made after $alpha \, F_w \, A_0$ are known; no uniform lower bound on either slope is needed.
    For fixed $m$, eventually $b m lt.eq i$, and every required unshifted degree divides $M_i$.
  A finite sum cannot have value smaller than the minimum of its terms.
    The argument therefore proves (8.12) in the affine coordinate ring.
    It also proves it in the local ring at the fixed point. Indeed any local function can be written with an
    invariant unit denominator: multiply an initial denominator by its other group translates and use its
    invariant norm. For an eigenfunction the resulting numerator has the same character.
    The invariant denominator has value zero, so the inequality is unchanged.
  The dimensions satisfy
  $ dim S =
    cases(delim: "{", dim X + b - 1 \, & upright("canonical-cover case") \,, dim X + b \, &
    upright("signed-torsor case") \,) wide upright("and hence") wide dim S lt.eq d + b . $
  They are thus bounded independently of $i$, and a subsequence has fixed dimension.
    The valuations are centred and quasi-monomial, the covers are finite cyclic and quasi-étale,
    and every remaining requirement of Theorem 48 was checked above. ◻
]

=== 8.4 Chen’s reduction and change of field <chens-reduction-and-change-of-field>

We use the following form of Chen’s reduction. For every positive integer $ell$, Chen’s Theorem 1.6,
  assertions (2) and (3), identifies the following two assertions #cite(label("Chen2025")):

+ bounded monotonic klt complements for birational Fano type contractions with zero boundary and $dim Z lt.eq ell$;
+ the Cartier-section assertion for Fano type contractions with $dim Z lt.eq ell$,
  with a constant depending on the total-space dimension and the discrepancy gap.

In (i), the total-space and base dimensions are equal. Consequently,
  Theorem 2 in each of the finitely many positive dimensions at most $ell$,
  for every positive discrepancy parameter, supplies (i); its dimension-zero case is trivial.
  One may take a common multiple of the finitely many complement indices for each fixed discrepancy parameter.
  Thus the birational inputs have dimension at most $ell$, whereas assertion (ii) also allows total spaces of
  higher dimension.

The real-pair conventions in Chen’s statement cause no extra hypothesis in (i).
  If an integral Weil divisor $K_X$ is $bb(R)$-Cartier, express it locally as a finite real combination of Cartier
  divisors. Comparing Weil coefficients gives a finite linear system with rational coefficients and rational
  right-hand side. A real solution implies a rational solution, so $K_X$ is $bb(Q)$-Cartier.
  Similarly, a real effective log Fano witness can be replaced by a rational one.
  Keep its finite boundary support and its zero coefficients.
  On a finite open cover, choose Cartier representations of its log canonical class,
  using the same boundary coefficient variables on every chart.
  These impose finitely many rational affine equations. Rational points are dense in their real solution space.
  Every rational solution defines a global rational divisor whose log canonical divisor is locally
  $bb(Q)$-Cartier; clearing denominators on the finite cover makes it $bb(Q)$-Cartier on $X$.
  A rational affine basis of the solution space therefore places all its log canonical divisors in a fixed
  finite-dimensional real span of global $bb(Q)$-Cartier divisors. Relative ampleness is open in that span.
  On a fixed log resolution, the klt condition and positivity of the remaining boundary coefficients also persist
  under a sufficiently small perturbation. Hence the rational birational statement proves the full zero-boundary
  assertion needed in Chen’s real-pair formulation.

#thm([Lemma 8.6.])[
  (Point ideals and change of field).  #emph[It suffices to prove Theorem 1 over $bb(C)$.
    More precisely, a uniform positive lower bound for the log canonical threshold of $frak(m)_z
    cal(O)_X$ implies the Cartier-section assertion after replacing the bound by a smaller number less than one.
    Both the hypotheses and this ideal threshold are preserved by algebraically closed field extensions of
    characteristic zero.]
] <lem:H-field-reduction>

#proof[
  Shrink $Z$ to an affine neighbourhood of $z$, choose generators $g_1 \, dots.h \, g_N$ of $frak(m)_z$,
    and resolve both $\( X \, B \)$ and the pulled-back ideal.
    If $p : Y arrow.r X$ is the resulting log resolution, write
  $ K_Y + B_Y = p^(*) \( K_X + B \) \, wide frak(m)_z cal(O)_Y = cal(O)_Y \( - F \) . $
  The ideal threshold is the minimum of $A_(X \, B) \( E \) \/
    "ord"_E \( F \)$ over the finitely many components of $F$ having positive order.
    Its interpretation is lc on the inverse image of a neighbourhood of $z$.
    Indeed the ideal is the unit ideal away from $f^(- 1) \( z \)$, and the original pair is already lc there.
  For a general linear combination $g = sum a_j g_j$, the pullback of $"div" \( g \)$ is $F + H$,
    where $H$ is a general member of a basepoint-free system.
    On a further restriction of the base, $H$ is smooth and transverse to the fixed simple normal crossings
    support. If $0 < t < 1$ is at most the ideal threshold, then $\( Y \, B_Y + t F + t H \)$ is lc,
    hence so is $\( X \, B + t f^(*) "div" \( g \) \)$. Choose $g eq.not 0$.
    Since $g in frak(m)_z$, $D = "div" \( g \)$ is a nonzero effective Cartier divisor containing $z$.
    Conversely, a Cartier divisor through $z$ has a local equation $g in frak(m)_z$,
    so that $v \( frak(m)_z cal(O)_X \) lt.eq v \( f^(*) g \)$ for every valuation.
    Thus an admissible coefficient for that divisor is also a lower bound for the ideal threshold.
  All the varieties, morphisms, rational boundaries, a rational Fano type witness, generators,
    and the chosen resolutions descend to an algebraically closed subfield $k_0$ of finite transcendence degree
    over $overline(bb(Q))$. Such a field embeds in $bb(C)$. Normality,
    geometric integrality and the identity $f_(*) cal(O)_X = cal(O)_Z$ are unchanged by algebraically closed
    extension; the latter also follows from flat base change for the proper morphism.
    Projectivity and relative ampleness are geometric properties. Relative nefness is geometric as well:
    any curve on an extension can be spread over a finite-type parameter scheme and specialized to a curve cycle
    over the smaller algebraically closed field, with the same intersection number.
    Thus a negative intersection after extension would already yield a negative intersection before extension.
  For discrepancies one can use the same log resolution. In the nonvacuous range $0 < epsilon.alt lt.eq 1$,
    a log smooth sub-boundary with all coefficients at most $1 - epsilon.alt$ is $epsilon.alt$-lc.
    At a stratum this follows by comparing with its reduced simple normal crossings support:
    a primitive monomial order has at least one positive integral weight,
    and each boundary weight contributes at least $epsilon.alt$;
    a nonmonomial prime has a further nonnegative discrepancy,
    with an integral contribution at least one when needed away from the strata.
    This also shows preservation of the discrepancy bound after extension.
    The coefficients and orders in the displayed resolution formula are unchanged,
    so the ideal threshold is unchanged. The complex assertion therefore gives the same lower bound over $k_0$ and
    over the original field, where the preceding general-member construction finishes the proof. ◻
]

=== 8.5 Conclusion of the two theorems <conclusion-of-the-two-theorems>

#proof[
  Over $bb(C)$, a failure in any fixed dimension and with any fixed $0 < epsilon.alt lt.eq 1$ would,
    by Proposition 58, give the sequence prohibited by Theorem 48.
    Therefore a uniform positive integral complement index exists.
    The range $epsilon.alt > 1$ in positive dimension is vacuous,
    since a prime divisor on the smooth locus has log discrepancy one.
  The birational conclusion also descends to every algebraically closed field of characteristic zero.
    Increase the complex uniform index to a multiple greater than one, which preserves the complement assertion.
    Descend a given example, its Fano type witness, and a resolution to an algebraically closed field embeddable
    in $bb(C)$. For the complex uniform index $n$, the complete relative system $f_(*)
    cal(O)_X \( - n K_X \)$ commutes with these field extensions.
    Resolve its finitely generated fractional base ideal as in Proposition 54.
    A klt member over $bb(C)$ implies that every fixed-order discrepancy relevant to the fibre is strictly
    positive. Those discrepancies are unchanged by extension.
    A general member over the original infinite field consequently gives a klt $n$-complement after shrinking,
    since the general residual coefficient $1 \/ n$ is less than one.
    Its section divisor $Delta_s$ defines $Delta = Delta_s \/ n gt.eq 0$, and $n \( K_X + Delta \) =
    "div" \( s \)$ is Cartier and linearly trivial on the chosen neighbourhood, as required. ◻
]

#proof[
  First work over $bb(C)$ and fix the total-space dimension $d$ and gap $epsilon.alt > 0$.
    Theorem 2 in every dimension $1 \, dots.h \, d$ and for every positive discrepancy parameter,
    together with its trivial dimension-zero case and the rationalization above,
    verifies Chen’s assertion (2) for base dimension bound $ell = d$.
    His Theorem 1.6 therefore gives assertion (3), with a positive constant depending only on $d$ and
    $epsilon.alt$ #cite(label("Chen2025")). Every base of a contraction from a $d$-dimensional variety has
    dimension at most $d$, so this applies to the given $f$. It supplies lc on the full inverse image of a
    neighbourhood of $z$. Lemma 59, decreasing the coefficient below one if necessary,
    transports the uniform constant to an arbitrary algebraically closed characteristic-zero field and produces a
    nonzero effective Cartier divisor through $z$ there. This proves the stated neighbourhood assertion. ◻
]

#proof[
  The same application of Chen’s implication (2)$arrow.r.double$(3) over $bb(C)$ gives his full real-boundary
    assertion. Only the zero-boundary birational inputs to (2) were rationalized above.
    The resulting assertion (3) already allows arbitrary effective real $B$ with $K_X + B$ real Cartier,
    and supplies the same dependence on $d$ and $epsilon.alt$. No perturbation of the nef real boundary is involved. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
