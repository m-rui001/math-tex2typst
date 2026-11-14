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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform indices for semi-log-canonical \
log Calabi--Yau pairs]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The index of a log Calabi–Yau pair measures the degree in which its rationally trivial log canonical class becomes
  an actual trivial line bundle. A uniform index theorem asks whether that degree can be chosen from the dimension
  and the boundary coefficients alone. For a nonnormal pair, this question includes a descent problem:
  trivializations on the components of the normalization need not agree along the double locus.

We work over an algebraically closed field $k$ of characteristic zero.
  A scheme is #emph[demi-normal] if it is reduced, satisfies Serre’s condition $S_2$, is seminormal,
  and has only nodes in codimension one. Let $X$ be a projective equidimensional demi-normal scheme,
  and let $B gt.eq 0$ be a rational Weil divisor with no component in the nonnormal locus.
  Write $nu : macron(X) arrow.r X$ for the normalization and $macron(C)$ for its conductor divisor.
  The pair $\( X \, B \)$ is #emph[semi-log-canonical], abbreviated slc, if $K_X + B$ is rational Cartier and

$ \( macron(X) \, macron(C) + nu_(*)^(- 1) B \) $

is log canonical. These are the singularities that allow normal components to meet along a double locus while
  retaining adjunction and pluricanonical descent #cite(label("Kollar2013")).
  We call $\( X \, B \)$ a log Calabi–Yau pair when, in addition, $K_X + B tilde.op_(bb(Q)) 0$:
  some positive Cartier multiple has trivial associated line bundle.
  The #emph[index] of the pair is the least such positive integer.

#thm([Theorem 1.1.])[
  #emph[For every integer $d gt.eq 4$ and every finite set $Phi subset \[ 0 \, 1 \] ∩ bb(Q)$,
    there is an integer $a \( d \, Phi \) > 0$ with the following property.
    Let $\( X \, B \)$ be a connected projective equidimensional semi-log-canonical log Calabi–Yau pair of
    dimension $d$ over $k$, with every nonzero coefficient of $B$ in $Phi$. Then
$ a \( d \, Phi \) \( K_X + B \) upright(" is Cartier") \, wide
  cal(O)_X #scale(x: 120%, y: 120%)[\(] a \( d \, Phi \) \( K_X + B \) #scale(x: 120%, y: 120%)[\)] tilde.eq
  cal(O)_X . $

]
] <thm:main>

The bound is independent of the number of irreducible components of $X$ and of the number of log canonical strata
  on their birational models. It is a common trivializing multiple,
  so it clears the local Cartier indices and kills the remaining global torsion at the same time.
  Together with the theorem in dimensions at most three of #cite(label("JiangLiu"), form: "prose") Corollary 1.6,
  this proves the finite-rational-coefficient slc index conjecture #cite(label("JiangLiu")) Conjecture 1.5.

=== 1.1 History and relation to earlier work <history-and-relation-to-earlier-work>

The distinction between existence of an index and a uniform index is already visible in numerical-dimension-zero
  abundance. Gongyo proved that a numerically trivial log canonical divisor on a projective slc pair is rationally
  linearly trivial #cite(label("Gongyo2013")) Theorem 1.5; the resulting trivializing multiple may depend on the
  pair. The index conjecture asks for a common multiple after fixing the dimension and the boundary coefficients.
  Its finite-rational-coefficient slc formulation is stated, for example,
  in #cite(label("JiangLiu"), form: "prose") Conjecture 1.5.
  The nonnormal setting is important because slc pairs occur as limits in moduli problems;
  see #cite(label("Kollar2013"), form: "prose") and the boundedness theory for polarized slc Calabi–Yau pairs in
  #cite(label("Birkar2023"), form: "prose").

Pluricanonical representations have long connected index problems to descent.
  Fujino developed admissible sections in his abundance theorem for slc threefolds #cite(label("Fujino2000")),
  and formulated uniform boundedness of canonical representations for canonical varieties with trivial canonical
  divisor #cite(label("Fujino2001")) Conjecture 3.2. His local-index results and Ishii’s global-index theorem for
  non-klt log canonical threefold pairs with standard coefficients made this connection explicit
  #cite(label("Fujino2001")) #cite(label("Ishii2000")). Here the standard coefficients are $1$ and $1 -
  1 \/ q$ for positive integers $q$. Fujino–Gongyo subsequently proved finiteness of the log pluricanonical
  representation for every projective lc pair with semiample log canonical divisor
  #cite(label("FujinoGongyo2014")) Theorem 1.1. Uniform boundedness of these finite images is the additional issue
  in the index problem.

Xu organized reductions among the normal index conjecture, its slc version,
  and boundedness of pluricanonical representations #cite(label("Xu2019")).
  In particular, his Theorem 1.11 gives the implication from normal indices in dimension $d$ and bounded
  representations in dimension $d - 1$ to slc indices in dimension $d$.
  Jiang proved the global index bound for boundary-free klt threefolds #cite(label("Jiang2021")) Corollary 1.7.
  Jiang–Liu bounded the representations of lc surfaces with a fixed trivializing multiple,
  obtaining the slc index theorem in dimensions at most three and the non-klt lc case in dimension four
  #cite(label("JiangLiu")) Theorem 1.4 and Corollaries 1.6–1.7.
  Xu also treated klt fourfold pairs with nonzero boundary #cite(label("Xu2019")) Theorem 1.14.

Several more recent results give bounds under different geometric hypotheses.
  Birkar proved the index conjecture for rationally connected klt pairs in every dimension,
  allowing a fixed rational DCC coefficient set #cite(label("Birkar2025")) Corollary 1.8.
  Filipazzi–Mauri–Moraga obtained sharp bounds for coregularity-zero pairs,
  including slc pairs #cite(label("FMM2025")); here coregularity zero means that a dlt model of the normalization
  with its induced boundary has a zero-dimensional minimal lc stratum.
  Figueroa–Filipazzi–Moraga–Peng developed corresponding index and complement results in low coregularity
  #cite(label("FFMP2025")). Masamura proved boundedness of the indices of smooth Calabi–Yau fourfolds
  #cite(label("Masamura2025")) Corollary 1.6. Uniform bounds need not be numerically small:
  Singh constructed smooth Calabi–Yau varieties whose indices grow doubly exponentially with dimension
  #cite(label("Singh2026")).

The proof here follows the established normal-to-slc strategy.
  It uses the uniform normal log canonical index theorem of the companion #emph[Uniform Pluricanonical Iitaka
  Fibrations] #cite(label("UPI")) Theorem 1.2, together with the all-dimensional good-model theorem of #emph[Log
  abundance in characteristic zero] #cite(label("LA")) Theorem 11.1. These are substantial inputs.
  Integral cohomology already bounds pluricanonical characters in terms of middle Betti numbers of suitable covers
  #cite(label("JiangLiu")) Lemma 2.7. The additional uniformity comes from a rank bound for the rational Hodge
  structure generated by a holomorphic top form and the resulting character bound for arbitrary integral klt pairs
  with fixed index. The latter is the klt case of the bounded-representation problem formulated in
  #cite(label("JiangLiu"), form: "prose") Conjecture 1.1. The final comparison of conductor residues uses Kollár’s
  linking theorem and its even-degree residue compatibility #cite(label("KollarSources")) Theorem 10 and Proposition 14.

The rank argument combines local positivity, moving subvarieties, and section counts.
  Its order propagation belongs to the Ein–Küchle–Lazarsfeld method #cite(label("EKL1995"));
  we use the precise chain and scalar constructions of #cite(label("U4"), form: "prose") Sections 5–6 and
  #cite(label("UPI"), form: "prose") Section 6. Cotangent semipositivity #cite(label("GKP2016"))
  #cite(label("CP2019")), divisorial Zariski decomposition #cite(label("Nakayama2004"))
  #cite(label("Boucksom2004")) #cite(label("BFJ2009")), and effective birationality #cite(label("Birkar2023"))
  supply the positivity estimates. The character argument builds on Matsumura–Wang’s decomposition of klt log
  Calabi–Yau pairs #cite(label("MatsumuraWang2025")) and the singular Beauville–Bogomolov theory
  #cite(label("GKP2016")) #cite(label("Druel2018")) #cite(label("GGK2019")) #cite(label("HoringPeternell2019")).
  For rationally connected factors we use Han–Jiang’s boundedness theorem and Jiang–Liu’s bounded-family
  representation theorem #cite(label("HanJiang")) #cite(label("JiangLiu")).
  The proofs below isolate the new uniform estimates and explain the adaptations of these earlier constructions.

=== 1.2 The character obstruction and the proof <the-character-obstruction-and-the-proof>

We first describe the descent problem that dictates the proof.
  The uniform normal index theorem of #cite(label("UPI"), form: "prose") Theorem 1.2 supplies one even integer
  $m$, depending only on $d$ and $Phi$, for all the normalization components.
  On the $i$th component its trivialization can be written as a rational $m$-canonical form $theta_i$ with the
  prescribed logarithmic poles. On a crepant divisorial log terminal model,
  logarithmic residue restricts this form to the conductor strata.
  At a generic node, the two residues differ by a nonzero scalar $r_e$;
  the existence of some global trivializing multiple ensures that the ratio is constant.

Make a finite graph whose vertices are normalization components and whose edges are the generic nodes.
  Rescaling $theta_i$ changes its incident edge ratios. Thus simultaneous matching amounts to making every product
  of ratios around a closed walk equal to one. A uniform power of all the forms will accomplish this if the orders
  of these products are uniformly bounded.

Minimal log canonical strata supply the necessary interpretation of a closed walk. Their adjoint pairs are klt.
  Inside one normalization component, $bb(P)^1$-linking identifies any two minimal strata by a crepant birational
  map that preserves the even-degree residue. Across an edge,
  we prove a corresponding birational residue comparison with multiplier $r_e$.
  A closed walk therefore induces a crepant birational self-map of one minimal klt stratum,
  whose action on its trivializing form is exactly the product of the edge ratios.
  Section 7 carries out these comparisons, including nonsplit nodes and the final $S_2$ extension.

The main uniformity problem is consequently the following one.
  For a projective integral klt pair $\( V \, Delta \)$ satisfying $m \( K_V + Delta \) tilde.op 0$, bound,
  in terms of $dim V$ and $m$, the order of the scalar by which a crepant birational self-map acts on a
  trivializing $m$-canonical form. We prove this in Theorem 17.
  The structural decomposition of such pairs separates a rationally connected factor, an abelian factor,
  and irreducible Calabi–Yau or symplectic factors. The rationally connected factor is controlled by boundedness
  and log pluricanonical representations. For the other factors, the character appears in integral middle cohomology.

The relevant cohomology is the smallest rational Hodge substructure $T \( U \) subset
  H^n \( U \, bb(Q) \)$ containing the holomorphic top forms of a smooth projective resolution $U$.
  It is birationally invariant and carries a polarized integral lattice.
  A bound for its rank therefore bounds the degree of the cyclotomic polynomial of a top-form character.
  Theorem 9 provides that rank bound under the rational-image hypotheses satisfied by the irreducible factors.

Two parts of the rank argument are useful independently. First,
  a dimension-dependent estimate for the variation of a Hodge norm gives a strict improvement over the largest
  possible metric growth whenever a specified top cup product vanishes.
  Applied to a class on the blowup of the diagonal, it bounds $dim
  T \( U \)$ from a normalized volume and a lower Seshadri bound. These arguments occupy Sections 3 and 4.
  Second, Section 5 removes the Seshadri hypothesis. Small-order moving subvarieties determine rational
  fibrations; a maximal such fibration reduces the issue to vertical jets and horizontal section counts.
  A calibrated big divisor keeps the two counts on the same scale,
  and a finite power-map argument makes the horizontal estimate linear in the sheaf rank.

Section 6 converts this rank bound into the required uniform character exponent. Section 7 then proves Theorem 1.
  The substantial companion inputs—the normal index theorem, good minimal models,
  and the scalar and structural results used in these reductions—are stated with their precise roles in Section 2
  and at their points of use.

== 2 Forms, birational maps, and uniform inputs <sec:preliminaries>

The analytic and Hodge-theoretic arguments are over $bb(C)$.
  We return to an arbitrary algebraically closed characteristic-zero field at the end of the proof.
  Varieties in the intervening sections are normal, integral, and projective unless otherwise specified.
  We use the standard discrepancy conventions for klt, dlt, and lc pairs #cite(label("Kollar2013")).
  For normal varieties, $m \( K_X + Delta \) tilde.op 0$ means that this is an #emph[integral principal divisor].
  In particular it is Cartier. This convention is stronger than rational linear triviality of the same multiple.

=== 2.1 Trivializations as rational forms <trivializations-as-rational-forms>

Let $F = bb(C) \( X \)$ for an $n$-fold $X$. A rational $m$-canonical form is a nonzero element of
  $\( and.big^n Omega_(F \/ bb(C)) \)^(⊗ m)$. If $eta$ is a rational top form and $theta = u eta^(⊗ m)$, put

$ "Div" \( theta \) = "Div" \( u \) + m "Div" \( eta \) . $

The divisor on the right is independent of the expression for $theta$.
  The equality $m \( K_X + Delta \) tilde.op 0$ is equivalent to the existence of such a form with

#[#set math.equation(numbering: n => "(2.1)")
 $ "Div" \( theta \) = - m Delta . $ <eq:form-trivialization>]

All forms satisfying this identity differ by a nonzero constant. The identity also implies that $m Delta$ is integral.

A birational map between pairs is #emph[$B$-birational], or #emph[crepant birational],
  if the log canonical pullbacks agree on a common resolution, with canonical divisors chosen compatibly.
  We write $"Bir" \( X \, Delta \)$ for the group of these self-maps.
  A #emph[pseudo-automorphism] is a birational self-map which is an isomorphism on open subsets with complements
  of codimension at least two.

#thm([Lemma 2.1.])[
  #emph[Let $\( X \, Delta \)$ and $\( Y \, Delta_Y \)$ be normal projective pairs, and let $theta_X \,
    theta_Y$ be degree-$m$ rational forms satisfying (2.1) for the respective boundaries.
    A birational map $f : X arrow.r.dashed Y$ is $B$-birational if and only if
$ f^(*) theta_Y = c theta_X quad upright("for some ") c in bb(C)^(*) . $

]
] <lem:form-crepant>

#proof[
  Choose a common smooth projective resolution $W$, and use one rational top form to represent $K_W$.
    Write the two pulled-back forms as $u_X eta^(⊗ m)$ and $u_Y eta^(⊗ m)$.
    If $K_W + Delta_W^X$ and $K_W + Delta_W^Y$ are the corresponding crepant pullbacks, then
  $ m \( K_W + Delta_W^X \) = - "Div" \( u_X \) \, wide m \( K_W + Delta_W^Y \) = - "Div" \( u_Y \) . $
  Their equality is equivalent to $"Div" \( u_Y \/ u_X \) = 0$.
    A rational function with zero divisor on the normal projective integral variety $W$ is a nonzero constant. ◻
]

Thus a $B$-birational self-map acts on the one-dimensional space of trivializing forms by a scalar.
  Theorem 17 will bound its order uniformly. No finiteness assumption on the order of the birational map itself is made.

=== 2.2 The normal index and good-model inputs <the-normal-index-and-good-model-inputs>

We isolate two substantial companion results. This makes clear which uniformity is already available on normal
  varieties and which must be proved for descent across the conductor.

#thm([Theorem 2.2.])[
  (Normal index theorem #cite(label("UPI")) Theorem 1.2).  #emph[For every integer $d gt.eq
    0$ and every rational set $I subset \[ 0 \, 1 \]$ satisfying the descending chain condition,
    there is an integer $a_(upright("lc")) \( d \, I \) > 0$ such that every normal projective integral lc pair
    $\( X \, Delta \)$ of dimension $d$, with coefficients in $I$ and $K_X + Delta tilde.op_(bb(Q)) 0$, satisfies
$ a_(upright("lc")) \( d \, I \) \( K_X + Delta \) tilde.op 0 . $

]
] <input:normal-index>

#thm([Theorem 2.3.])[
  (Good minimal models #cite(label("LA")) Theorem 11.1).  #emph[A projective lc pair over $bb(C)$ with effective
    rational boundary and pseudo-effective log canonical divisor has a good log minimal model.
    In particular its adjoint is nonvanishing and its transform on the good model is semiample.]
] <input:good-model>

For a klt pair with a good minimal model, an MMP with scaling may be chosen to terminate at such a model.
  We use this consequence together with the extraction, small $bb(Q)$-factorialization,
  and big-adjoint finite-generation results of #cite(label("BCHM2010"), form: "prose").
  When the adjoint is merely pseudo-effective, the good-model theorem above is the nonvanishing and semiampleness input.

We also use the uniform pluricanonical degree theorem #cite(label("UPI")) Theorem 1.1:
  for smooth projective varieties of each fixed dimension and nonnegative Kodaira dimension,
  one complete pluricanonical system defines the Iitaka fibration.
  Section 5 states the chain and tracking consequences in the precise forms needed there.

=== 2.3 Bounded comparison models for rationally connected bases <bounded-comparison-models-for-rationally-connected-bases>

The rank argument uses a boundedness consequence of the canonical bundle formula.
  Recall that a #emph[contraction] $h : V arrow.r Y$ is a projective surjective morphism of normal varieties with
  $h_(*) cal(O)_V = cal(O)_Y$. Two normal varieties are isomorphic in codimension one if they have isomorphic open
  subsets whose complements have codimension at least two.

#thm([Proposition 2.4.])[
  #emph[Fix $n$. Let $h : V arrow.r Y$ be a contraction over $bb(C)$, where $V$ is klt of dimension $n$,
    $K_V tilde.op_(bb(Q)) 0$, and $0 < b = dim Y < n$. Suppose that a smooth projective resolution of $Y$ is
    rationally connected. Then $Y$ is isomorphic in codimension one to a normal projective variety $hat(Y)$ in a
    bounded family depending only on $n$. In particular $hat(Y)$ has a very ample Cartier divisor $H$ for which
#[#set math.equation(numbering: n => "(2.2)")
 $ H^b lt.eq C_n \, wide \| K_(hat(Y)) dot.op H^(b - 1) \| lt.eq C_n . $ <eq:bounded-base-degrees>]

 The canonical intersection is the degree of the canonical Weil divisor on a general complete-intersection curve
   in the smooth locus.]
] <input:bounded-base>

#proof[
  The bounded moduli denominator proposition of #cite(label("UPI"), form: "prose") Proposition 4.1 applies to $h$.
    Its lower-dimensional normal-index hypotheses are supplied by Theorem 3.
    It gives a generalized klt pair $\( Y \, B_Y + M_Y \)$ with effective boundary in a dimension-dependent
    rational DCC set, b-nef moduli data with a uniformly bounded b-Cartier denominator, and
  $ K_Y + B_Y + M_Y tilde.op_(bb(Q)) 0 . $
  Here the last equivalence follows from the exact canonical bundle formula and $h_(*) cal(O)_V = cal(O)_Y$.
    The proof of the rationally connected generalized torsion result #cite(label("UPI")) Proposition 4.5 shows
    that these bases are uniformly generalized $epsilon.alt$-lc and applies
    #cite(label("Birkar2025"), form: "prose") Theorem 1.7 to obtain boundedness up to isomorphism in codimension
    one. Its normal bounded comparison models give $hat(Y)$.
  Choose very ample divisors from bounded projective embeddings of this family. Their top degrees are bounded.
    A general curve cut out by $b - 1$ such divisors is smooth and avoids the singular locus,
    and its degree and genus are bounded. Adjunction gives
  $ K_(hat(Y)) dot.op H^(b - 1) = 2 g \( C \) - 2 - \( b - 1 \) H^b \, $
  which proves the second bound. For $b = 1$ use the normal curve itself. ◻
]

=== 2.4 Generic data and section orders <generic-data-and-section-orders>

All finite collections of varieties, divisors, maps, and forms can be defined over a finitely generated subfield
  of $bb(C)$. Geometric generic fibres and moving subvarieties may be studied after algebraically closed field
  extension; sections commute with that extension, and the singularity conditions can be checked on a descended
  log resolution. We use very general points when countably many section-order conditions must hold
  simultaneously. Equivalently, the points may be taken geometric generic over a countable field containing the
  data. Dominant extensions of parameter spaces used to define models preserve this genericity.

For a big rational divisor $D$ on an $n$-fold, write $"vol" \( D \) =
  limsup_(m arrow.r oo) n ! h^0 \( m D \) \/ m^n$, with degrees divisible enough to make the divisor integral.
  Divisors compared by an effective rationally linearly equivalent difference give inclusions of these complete
  section spaces. Section 5 will use such inclusions on resolutions,
  where orders are measured at smooth generic points. Object-dependent divisibility and asymptotic thresholds are
  permitted; the asserted final bounds depend only on the parameters specified in the corresponding statements.

== 3 The Hodge structure generated by the top forms <sec:hodge>

We will bound the order of a birational map on a one-dimensional space of pluricanonical forms by realizing its
  scalar as an eigenvalue of an integral Hodge structure of bounded rank.
  The relevant Hodge structure is usually much smaller than the full middle cohomology.
  We first recall its basic properties and prove the metric estimate that will make its rank accessible in Section 4.

For a smooth projective complex $n$-fold $U$, let

$ T \( U \) subset H^n \( U \, bb(Q) \) $

be the smallest rational Hodge substructure whose complexification contains $H^(n \, 0) \( U \)$,
  and put $r \( U \) = dim_(bb(Q)) T \( U \)$. Such a smallest substructure exists:
  intersections are Hodge substructures, and finite dimensionality reduces an arbitrary intersection to a finite one.

#thm([Lemma 3.1.])[
  #emph[The Hodge structure $T \( U \)$ is birationally invariant.
    Cup product with any rational divisor class annihilates $T \( U \)$; in particular,
    $T \( U \)$ is primitive for every rational ample class. Moreover, if $f : Z arrow.r
    U$ is a morphism from a smooth projective variety with $dim f \( Z \) < n$, then $f^(*) T \( U \) = 0$.]
] <hodge:basic>

#proof[
  For a birational morphism $p : W arrow.r U$ between smooth projective varieties, $p^(*) :
    H^n \( U \, bb(Q) \) arrow.r H^n \( W \, bb(Q) \)$ is an injective Hodge morphism, with left inverse $p_(*)$.
    Birational invariance of holomorphic top forms gives $H^(n \, 0) \( W \) = p^(*) H^(n \, 0) \( U \)$.
    The image $p^(*) T \( U \)$ therefore contains $T \( W \)$ by minimality.
    Its inverse image of $T \( W \)$ is a Hodge substructure containing $H^(n \, 0) \( U \)$,
    and hence equals $T \( U \)$. Thus $T \( W \) = p^(*) T \( U \)$.
    Common resolutions give the assertion for birational maps.
  The kernel of cup product with a rational divisor class is a rational Hodge substructure,
    with the usual Tate twist in the target. It contains $H^(n \, 0) \( U \)$ because $H^(n + 1 \, 1) \( U \) =
    0$, so it contains $T \( U \)$. Finally, $f^(*)$ vanishes on holomorphic top forms when its image has
    dimension less than $n$. Its kernel is again a rational Hodge substructure, which proves the last assertion. ◻
]

For a normal projective variety $V$, we also write $r \( V \) = r \( U \)$,
  where $U$ is any smooth projective resolution. Lemma 6 makes this independent of the choice of $U$.

We use the Hodge norm $lr(bar.v.double z bar.v.double)_omega$ of a cohomology class on a compact Kähler manifold:
  this is the $L^2$-norm of its $omega$-harmonic representative.
  It is also the minimum $L^2$-norm among closed representatives of the class.
  We use the usual Lefschetz decomposition, Hodge–Riemann bilinear relations,
  and commutation of the Kähler Lefschetz operator with the Laplacian; see, for example,
  #cite(label("Voisin2002"), form: "prose").

The next estimate concerns a Kähler metric stretched in at most half of the complex tangent directions.
  Without its cohomological hypothesis, a middle-degree norm can grow like $R^(n \/ 2)$.
  The cohomological hypothesis forces a uniform loss in this growth rate.
  The proof combines pointwise variation of the norm with orthogonality of harmonic and exact top-degree forms.

#thm([Lemma 3.2.])[
  (A quantitative Hodge norm gap).  #emph[Let $M$ be a compact Kähler manifold of complex dimension $2 n$,
    where $n gt.eq 1$, let $D$ be a Kähler form, and let $H$ be a smooth closed semipositive $\( 1 \, 1 \)$-form
    of pointwise rank at most $n$. If $z in H^(n \, n) \( M \)$ satisfies $\[ H \]^n z = 0$, then,
    for every $R gt.eq 1$,
#[#set math.equation(numbering: n => "(3.1)")
 $ lr(bar.v.double z bar.v.double)_(D + R H) lt.eq R^(\( n - delta_n \) \/ 2)
   lr(bar.v.double z bar.v.double)_(D + H) \, wide delta_n = frac(1, binom(2 n, n) + 2) . $ <hodge:gap>]

]
] <lem:hodge-gap>

#proof[
  Fix $R$ and write $omega = D + R H$, $Q = R H$. Let $gamma$ be the $omega$-harmonic representative of $z$.
    In an $omega$-unitary coframe diagonalizing $Q$, write its eigenvalues as $b_i in \[ 0 \, 1 \]$ and set $b_I =
    sum_(i in I) b_i$ for an $n$-element subset $I$ of ${ 1 \, dots.h \, 2 n }$.
    Keeping $gamma$ fixed while differentiating its squared norm with respect to $log R$ gives,
    relative to the present volume form,
  #[#set math.equation(numbering: n => "(3.2)")
   $ sum_(\| I \| = \| J \| = n) #scale(x: 120%, y: 120%)[\(] "Tr" Q - b_I -
     b_J #scale(x: 120%, y: 120%)[\)] \| gamma_(I macron(J)) \|^2 . $ <hodge:variation>]
  Indeed the volume contributes $"Tr" Q$, while the covariant holomorphic and antiholomorphic factors contribute
    $- b_I$ and $- b_J$. Define the nonnegative pointwise deficit
  $ e = n \| gamma \|^2 - sum_(I \, J) \( "Tr" Q - b_I - b_J \) \| gamma_(I macron(J)) \|^2 . $
  We will prove
  #[#set math.equation(numbering: n => "(3.3)")
   $ integral_M e thin thin upright(d) V_omega gt.eq delta_n lr(bar.v.double gamma bar.v.double)_omega^2 .
     $ <hodge:integrated-deficit>]
  Put $N_n = binom(2 n, n)$. If $"rank" Q < n$, then $"Tr" Q lt.eq n - 1$ and $e gt.eq \| gamma \|^2$.
    If $"rank" Q = n$, denote its $n$-dimensional kernel by $K$, the coefficient $gamma_(K macron(K))$ by $a$, and put
  $ d_0 = n - "Tr" Q \, wide p = product_(b_i > 0) b_i . $
  Every coefficient other than $a$ involves a positive eigenvalue in at least one index set.
    Subtracting that eigenvalue from $"Tr" Q$ leaves a sum of at most $n - 1$ numbers at most one. Consequently
  #[#set math.equation(numbering: n => "(3.4)")
   $ e gt.eq d_0 \| a \|^2 + sum_(\( I \, J \) eq.not \( K \, K \)) \| gamma_(I macron(J)) \|^2 .
     $ <hodge:tensor-deficit>]
  Since $0 lt.eq b_i lt.eq 1$, we also have
  $ \( 1 - p \)^2 lt.eq d_0 \, wide 1 - p^2 lt.eq 2 d_0 . $
  Consider the top-degree forms
  $ A = frac(omega^n, n !) and gamma \, wide B = frac(Q^n, n !) and gamma . $
  In normalized exterior bases, the coefficient of $A$ is a signed sum of the $N_n$ diagonal coefficients of
    $gamma$. The coefficient of $B$ is $p a$, with the same sign as the $a$ term in $A$.
    Thus Cauchy–Schwarz and (3.4) give
  #[#set math.equation(numbering: n => "(3.5)")
   $ \| A - B \|^2 lt.eq N_n e \, wide \| B \|^2 gt.eq \| gamma \|^2 - 2 e . $ <hodge:top-form-bounds>]
  The same inequalities hold when $"rank" Q < n$: then $B = 0$ and $e gt.eq \| gamma \|^2$.
  The form $A$ is harmonic, because multiplication by $omega$ commutes with the Laplacian.
    The form $B$ is exact, because $Q$ is closed and
  $ \[ B \] = frac(R^n, n !) \[ H \]^n z = 0 . $
  They are therefore $L^2$-orthogonal. Integrating (3.5) yields
  $ N_n integral_M e thin thin upright(d) V_omega gt.eq lr(bar.v.double A - B bar.v.double)_omega^2 gt.eq
    lr(bar.v.double B bar.v.double)_omega^2 gt.eq lr(bar.v.double gamma bar.v.double)_omega^2 -
    2 integral_M e thin thin upright(d) V_omega \, $
  which is (3.3).
  For completeness, varying the metric does not require differentiating the harmonic representative.
    At the current value of $R$, keeping it fixed supplies an upper derivative for the minimum defining
    $lr(bar.v.double z bar.v.double)_(D + R H)^2$. These minimum norms are locally Lipschitz in $log R$,
    by comparison of nearby metrics. Equations (3.2) and (3.3) therefore imply almost everywhere
  $ frac(thin upright(d), thin upright(d) log R) lr(bar.v.double z bar.v.double)_(D + R H)^2
    lt.eq \( n - delta_n \) lr(bar.v.double z bar.v.double)_(D + R H)^2 . $
  Integration from $1$ to $R$ proves (3.1). ◻
]

== 4 A diagonal estimate for the Hodge rank <sec:diagonal>

We now show that a lower bound for local positivity of a normalized polarization bounds $r \( U \)$.
  The geometric part of the proof constructs a Kähler class on a modification of the blown-up diagonal,
  with all uncontrolled corrections supported on subvarieties that fail to dominate one factor.
  Lemma 6 makes these corrections invisible to $T \( U \)$.
  The resulting diagonal class has a fixed nonzero intersection but a norm that decreases with $r \( U \)$;
  Lemma 7 converts this comparison into the required bound.

For an ample rational divisor $h$ on a projective variety and a smooth point $x$, its Seshadri constant is

$ epsilon.alt \( h \; x \) = inf_(C in.rev x) frac(h dot.op C, "mult"_x C) \, $

where the infimum runs over integral curves through $x$. Equivalently,
  it is the largest $s$ for which $sigma^(*) h - s E_x$ is nef on the blowup $sigma$ of $x$.

#thm([Lemma 4.1.])[
  (Diagonal estimate).  #emph[Fix an integer $n gt.eq 2$ and a real number $c > 0$.
    Let $X$ be a normal projective complex $n$-fold with canonical singularities and $K_X tilde.op
    0$ as an integral principal divisor. Suppose $h$ is an ample rational divisor such that
$ 1 lt.eq h^n lt.eq 2 \, wide epsilon.alt \( h \; x \) > c quad upright("at very general smooth points ") x in X . $

 Then $r \( U \) = dim_(bb(Q)) T \( U \)$, for any smooth projective resolution $U$ of $X$,
   is bounded by a constant depending only on $n$ and $c$.]
] <lem:diagonal>

#proof[
  Choose a resolution $rho : U arrow.r X$, isomorphic over the smooth locus, obtained by blowups,
    and an effective exceptional divisor $N$ such that $- N$ is $rho$-ample. The canonical form trivializing $K_X$ gives
  $ K_U gt.eq 0 \, wide K_U upright(" exceptional over ") X . $
  Put $H = rho^(*) h$ and $l = H^n in \[ 1 \, 2 \]$. We also denote by $H$ a smooth closed semipositive
    representative, obtained by pulling back a Fubini–Study form from an embedding given by a multiple of $h$. Let
  $ Y = U times U \, wide pi : P = "Bl"_Delta Y arrow.r Y $
  be the blowup of the diagonal, with exceptional divisor $E$.
    Subscripts $1 \, 2$ indicate pullback from the two factors, on every subsequent model.
    A subvariety of any such model will be called #emph[double dominant] if its maps to both copies of $U$ are dominant.
  === Diagonal conditions and the number of sections <diagonal-conditions-and-the-number-of-sections>
  Fix rational numbers
  $ t = 1 / 4 \, wide tau = n - 1 + t \, wide L = 10 n^2 \, $
  and choose a rational $a_2$ depending only on $n \, c$, sufficiently large that $a_2 > L \/ c$ and $a_2 >
    tau \( 1 + 1 \/ \( 10 n \) \)$. Set $a_1 = 10 n a_2$ and $A = a_1 H_1 + a_2 H_2$.
    These choices give the strict inequalities
  #[#set math.equation(numbering: n => "(4.1)")
   $ a_2 > tau \( 1 + a_2 \/ a_1 \) \, wide frac(n, 1 + n \/ L) > tau \( 1 + a_2 \/ a_1 \) . $ <diag:parameter-margins>]
  They remain true after sufficiently small rational perturbations of $a_1 \, a_2 \, t$. We first prove that
  #[#set math.equation(numbering: n => "(4.2)")
   $ G = A - tau E upright(" is big") \, wide upright(bold(B)) \( A - t E \)
     upright(" has no double-dominant component") \, $ <diag:base-locus-goal>]
  where $upright(bold(B))$ denotes the stable base locus.
  For sufficiently divisible positive integers $m$, put
  $ Q_m = H^0 \( Y \, m A \) \, wide V_m = H^0 \( P \, m G \) = H^0 \( Y \, m A ⊗ cal(I)_Delta^(m tau) \) subset Q_m . $
  The conormal bundle of the diagonal is $Omega_U^1$. Its infinitesimal layers therefore give
  #[#set math.equation(numbering: n => "(4.3)")
   $ dim \( Q_m \/ V_m \) lt.eq sum_(0 lt.eq j < m tau) h^0 #scale(x: 120%, y: 120%)[\(] U \,
     cal(O)_U \( m \( a_1 + a_2 \) H \) ⊗ "Sym"^j Omega_U^1 #scale(x: 120%, y: 120%)[\)] . $ <diag:layers>]
  We need an estimate uniform in $j$, because $j$ grows with $m$.
  The reflexive cotangent sheaf of $X$ is slope semistable of degree zero with respect to $h$.
    This follows from generic semipositivity for the cotangent bundle and $K_X equiv 0$;
    the precise singular-variety semistability and restriction statements we use are #cite(label("GKP2016"))
    Theorem 5.3 and Proposition 5.4; see also #cite(label("CP2019")) Theorem 1.3.
    Choose a fixed sufficiently positive general complete-intersection flag on $U$,
    cut by pullbacks of hypersurfaces on $X$, terminating in a smooth curve $C$ avoiding the exceptional locus.
    Its members are smooth and integral. The bundle $Omega_U^1 \|_C$ is semistable of degree zero,
    as is every symmetric power in characteristic zero.
  Write $D_0 = m_0 H$, with $m_0 h$ very ample, and $r_j = binom(j + n - 1, n - 1)$.
    On $C$, a negative twist of $"Sym"^j Omega_U^1 \|_C$ has no sections.
    For $k gt.eq 0$, subtracting $k deg_C D_0 + 1$ points gives
  $ h^0 #scale(x: 120%, y: 120%)[\(] C \, cal(O)_C \( k D_0 \) ⊗ "Sym"^j Omega_U^1 \|_C
    #scale(x: 120%, y: 120%)[\)] lt.eq r_j \( k deg_C D_0 + 1 \) . $
  Negative twists also have no sections on higher flag members:
    general curves of this kind sweep out a dense subset, and their restrictions have negative slope.
    If a hypersurface cut in the flag has degree $e$ with respect to $D_0$,
    write $b_(Z \, j) \( k \)$ for the section dimension on the member $Z$.
    The restriction sequences and negative-twist vanishing give
  $ b_(Z \, j) \( k \) lt.eq sum_(a = 0)^(floor.l k \/ e floor.r) b_(Z' \, j) \( k - a e \) \, wide
    Z' in \| e D_0 \|_Z . $
  Since $D_0^(i - 1) dot.op Z' = e \( D_0^i dot.op Z \)$, summing the degree-$\( i - 1 \)$ leading term on $Z'$
    divides its coefficient by $e i$. Induction gives, on an $i$-dimensional flag member $Z$,
  $ h^0 #scale(x: 120%, y: 120%)[\(] Z \, cal(O)_Z \( k D_0 \) ⊗ "Sym"^j Omega_U^1 \|_Z
    #scale(x: 120%, y: 120%)[\)] lt.eq r_j (frac(\( D_0^i dot.op Z \) k^i, i !) + O \( \( k + 1 \)^(i - 1) \)) \, $
  with the implied constant independent of $j$. Since $sum_(j < q) r_j = q^n \/ n ! + O \( q^(n - 1) \)$, (4.3) becomes
  #[#set math.equation(numbering: n => "(4.4)")
   $ dim \( Q_m \/ V_m \) lt.eq frac(l \( a_1 + a_2 \)^n tau^n, \( n ! \)^2) m^(2 n) +
     o \( m^(2 n) \) . $ <diag:section-upper>]
  All asymptotic errors in this proof concern the fixed variety and fixed divisors;
    their thresholds need not be uniform in $X$. On the other hand,
  $ dim Q_m = frac(l^2 a_1^n a_2^n, \( n ! \)^2) m^(2 n) + o \( m^(2 n) \) . $
  The first inequality in (4.1), together with $l gt.eq 1$,
    makes the difference of the leading coefficients positive. Thus $G$ is big.
  We next show that, for all sufficiently large divisible $m$,
    there is no divisorial valuation $v$ over $Y$ whose centre is double dominant and satisfies
  #[#set math.equation(numbering: n => "(4.5)")
   $ v \( V_m \) gt.eq m A_Y \( v \) . $ <diag:excluded-valuation>]
  Here $v \( V_m \)$ is the order of the base ideal of $V_m subset H^0 \( Y \, m A \)$,
    and $A_Y \( v \)$ is the log discrepancy. The Seshadri assumption and $a_2 c > L$ imply that $m a_2
    H$ separates jets modulo the $L m$-th power of the maximal ideal on a dense open subset of $U$,
    for all sufficiently large divisible $m$. Indeed, at a smooth point satisfying the Seshadri bound the divisor
    $a_2 h - L E_x$ on its blowup is ample. Serre vanishing supplies the jet separation,
    and surjectivity of evaluation is open.
  If (4.5) held, localize a resolution carrying $v$ over the generic point of the first factor and extend to
    $overline(bb(C) \( U \))$. The divisor remains horizontal;
    its discrepancy and its base-ideal order become the corresponding quantities on this smooth geometric generic
    fibre. Double dominance ensures that its centre meets the second-factor jet-separation open.
    At a closed point $y$ of that intersection, the restricted base ideal $I$ would satisfy $"lct"_y \( I \) lt.eq
    1 \/ m$. For $J = I + frak(m)_y^(L m)$, the sum-of-ideals inequality gives
  $ "lct"_y \( J \) lt.eq "lct"_y \( I \) + frac(n, L m) lt.eq frac(1 + n \/ L, m) $
  #cite(label("dFEM2011")) Lemma 2.18. The threshold–colength inequality #cite(label("dFEM2004")) Theorem 1.1 then gives
  #[#set math.equation(numbering: n => "(4.6)")
   $ s := "length" \( cal(O)_y \/ J \) gt.eq frac(m^n, n !) (frac(n, 1 + n \/ L))^n . $ <diag:colength>]
  Jet separation allows us to choose $s$ sections $g_1 \, dots.h \, g_s$ of $m a_2 H$, defined over $bb(C)$,
    whose images modulo $J$ are linearly independent over $overline(bb(C) \( U \))$.
    Namely, after scalar extension the images of any complex basis span the quotient,
    so one can select a basis among them. If $f_1 \, dots.h \,
    f_q$ is a complex basis of $H^0 \( U \, m a_1 H \)$, their $q s$ products $f_i
    g_j$ are linearly independent modulo $V_m$. To see this, restrict a complex linear relation to the geometric
    generic fibre and reduce modulo $J$. Independence of the $g_j$ there makes each coefficient $sum_i c_(i j)
    f_i$ zero at the generic point. These are complex linear relations among the $f_i$, so all $c_(i j)$ vanish.
  Consequently (4.6) gives the lower leading coefficient
  $ frac(l a_1^n, \( n ! \)^2) (frac(n, 1 + n \/ L))^n $
  for $m^(- 2 n) dim \( Q_m \/ V_m \)$. By the second inequality in (4.1),
    this exceeds the upper coefficient in (4.4), a contradiction.
    The numerical bounds are uniform over the chosen jet-separation open,
    so the sufficiently large $m$ can be fixed independently of the hypothetical valuation.
  This exclusion controls the discrepancies of a general divisor with the prescribed diagonal vanishing along
    every double-dominant centre. We now turn that discrepancy control into the second assertion of (4.2),
    by comparing an adjoint ample model with the diagonal blowup near such centres.
  === Removing base components that dominate both factors <removing-base-components-that-dominate-both-factors>
  Fix such an $m$, also large enough that $\| m G \|$ has generically finite map.
    First choose a log resolution $p_0 : W arrow.r P$ of its base ideal, together with $E$ and $N_K = pi^(*) K_Y$.
    Then choose $Delta_P in 1 / m \| m G \|$ general. Bertini makes its free part smooth and transverse to the
    fixed normal crossings divisor, so the resulting boundary on $W$ is log smooth. Write
  $ K_W + Delta_W = p_0^(*) \( K_P + Delta_P \) . $
  Every double-dominant divisor on $W$ has coefficient less than one in $Delta_W$. To verify this, use
  #[#set math.equation(numbering: n => "(4.7)")
   $ K_P + Delta_P = pi^(*) \( K_Y + pi_(*) Delta_P \) - t E . $ <diag:canonical-blowup>]
  For the finitely many exceptional or fixed divisors on this resolution,
    a general member has valuation $v \( V_m \) \/ m$ after pushforward to $Y$.
    Its coefficient in $Delta_W$ is therefore
  $ 1 - A_Y \( v \) + frac(v \( V_m \), m) - t v \( E \) < 1 $
  when its centre is double dominant, by the exclusion of (4.5).
    Components of the general free part have coefficient $1 \/ m < 1$.
    Formula (4.7) remains valid if $E$ occurs in the fixed part of $\| m G \|$:
    pulling back the pushforward restores exactly the prescribed multiplicity $m tau E$.
  Replace negative coefficients of $Delta_W$ by zero, and decrease all coefficients at least one to rational
    numbers strictly below one. The resulting boundary $B_W$ is klt. Set $L_W = K_W + B_W$; then
  #[#set math.equation(numbering: n => "(4.8)")
   $ K_W + B_W = p_0^(*) \( D' + N_K \) + G_e - F_N \, wide D' = K_P + Delta_P - N_K tilde.op_(bb(Q)) A - t E \,
     $ <diag:adjusted-boundary>]
  where $N_K gt.eq 0$, $G_e gt.eq 0$ is $p_0$-exceptional, and every component of $F_N gt.eq
    0$ fails to be double dominant. The assertion about $G_e$ follows because $Delta_P$ is effective:
    negative coefficients can occur only on $p_0$-exceptional divisors.
    The assertion about $F_N$ is the preceding coefficient bound.
  The divisor $K_W + B_W$ is big. Indeed, $K_W$ is effective,
    and $B_W$ contains with positive coefficient the big free part of $\| m G \|$.
    The existence of ample models for big klt adjoints #cite(label("BCHM2010")) gives a projective klt pair
    $\( V \, B_V \)$, the ample rational adjoint divisor $D_V = K_V + B_V$, and a common smooth resolution
  $ r_0 : S arrow.r W \, wide q : S arrow.r V \, wide p = p_0 r_0 : S arrow.r P $
  such that
  #[#set math.equation(numbering: n => "(4.9)")
   $ r_0^(*) \( K_W + B_W \) = q^(*) D_V + E_V \, wide E_V gt.eq
     0 upright(" is ") q upright("-exceptional") . $ <diag:ample-model>]
  We choose divisor representatives compatibly throughout these formulas.
  Suppose that $upright(bold(B)) \( A - t E \)$ has a double-dominant component.
    Its image in $Y$ contains a point $z = \( x \, y \)$ satisfying two conditions:
    neither $x$ nor $y$ lies on the image of a nonconstant rational curve in $U$,
    and $z$ avoids the images of $N_K$ and $F_N$. Such a point exists.
    The effective canonical divisor makes $U$ non-uniruled, so images of rational curves are contained in a
    countable union of proper closed subsets. Double dominance, and uncountability of $bb(C)$,
    allow us to avoid their inverse images and the finitely many other indicated subsets.
  Every fibre of $q$ is rationally chain connected because $\( V \, B_V \)$ is klt,
    by #cite(label("HM2007")) Corollary 1.6. If a fibre meets $\( pi p \)^(- 1) \( z \)$,
    all its rational chains have constant image in both copies of $U$:
    a nonconstant image would be a rational curve through $x$ or $y$. Thus that entire fibre maps to $z$.
    This uses the all-fibres statement; chains through special points may equivalently be obtained by proper
    specialization.
  It follows that $V$ maps to $Y$ near the points lying over $z$. Here is the precise local argument.
    Let $Gamma subset V times Y$ be the closure of the graph of the birational map $V arrow.r.dashed Y$.
    Every fibre of $Gamma arrow.r V$ meeting $V times { z }$ is a singleton,
    by the preceding paragraph and the map $S arrow.r Gamma$.
    Properness makes this projection finite near each such fibre,
    and finite birationality over normal $V$ makes it an isomorphism there.
    The image in $Y$ of its non-isomorphism locus is closed and avoids $z$.
    Removing it, and the images of $N_K \, F_N$, gives an open $Y^0 in.rev z$ for which the graph is an open $V^0
    subset V$, proper over $Y^0$, and $S_(Y^0) = q^(- 1) \( V^0 \)$.
  Over $Y^0$, Equations (4.8) and (4.9) reduce to
  #[#set math.equation(numbering: n => "(4.10)")
   $ p^(*) D' + r_0^(*) G_e = q^(*) D_V + E_V . $ <diag:relative-models>]
  The divisors $D'$ on $P_(Y^0)$ and $D_V$ on $V^0$ are relatively ample over $Y^0$:
    the first has relative class $- t E$, and the second is the restriction of an ample divisor.
    Adding an effective exceptional divisor to a birational pullback does not change its pushforward section
    algebra, by normality. The relative Proj of the two sides of (4.10) therefore identifies $P_(Y^0) tilde.eq
    V^0$. On this common model, pushforward gives $D' = D_V$, and (4.10) gives $E_V = r_0^(*) G_e$.
  For divisible $k$, the model formulas give the following map of complete section spaces:
  #[#set math.equation(numbering: n => "(4.11)")
   $ H^0 \( V \, k D_V \) & tilde.eq H^0 \( W \, k L_W \) arrow.r^(med dot.op s_(k F_N) med)
     H^0 \( W \, k \( L_W + F_N \) \)\
 & tilde.eq H^0 \( P \, k \( D' + N_K \) \) . $ <diag:section-transfer>]
  The first isomorphism pulls sections to $S$, multiplies by the canonical section of $k E_V$,
    and descends to $W$. The last uses $L_W + F_N = p_0^(*) \( D' + N_K \) +
    G_e$ and removes the effective exceptional divisor $G_e$ by pushforward.
    Large divisible multiples of $D_V$ are globally generated. Their images in (4.11) generate above $z$:
    there $F_N = N_K = 0$, and $E_V = r_0^(*) G_e$ shows that multiplication and removal of the exceptional
    factors cancel. Thus under $P_(Y^0) tilde.eq V^0$ the transported section is exactly the original section of
    $k D_V$. Finally $N_K$ is a fixed divisor and can be removed.
    Indeed, under $Y arrow.r X times X$, $K_Y$ is effective exceptional and $A$ is pulled back from $X times X$, so
  $ H^0 \( Y \, k \( A + K_Y \) \) = s_(k K_Y) H^0 \( Y \, k A \) $
  for divisible $k$. Its pullback $N_K$ has zero coefficient along $E$;
    dividing by its canonical section therefore preserves the vanishing condition imposed by $- k t E$. Hence
  $ H^0 \( P \, k \( A - t E + N_K \) \) = s_(k N_K) H^0 \( P \, k \( A - t E \) \) . $
  Generation above $z$ contradicts the assumed base component. This proves (4.2).
  === An ample class with controlled corrections <an-ample-class-with-controlled-corrections>
  The preceding argument controls where base conditions occur, rather than their number or multiplicity.
    This is enough: on each correction, Lemma 6 annihilates the pullback of $T \( U \)$ from at least one factor.
  Choose an ample rational divisor on $P$ of the form
  $ J = m' \( H_1 + H_2 \) - N_1 - N_2 - lambda E \, $
  with $m'$ large and $lambda > 0$ small. For sufficiently small rational $epsilon > 0$,
    the stable base locus of $A - t E - epsilon J$ still has no double-dominant component. In fact
  $ A - t E - epsilon J = \( a_1 - epsilon m' \) H_1 + \( a_2 - epsilon m' \) H_2 - \( t - epsilon lambda \) E +
    epsilon \( N_1 + N_2 \) . $
  The first three terms satisfy (4.2) by the strict margins in (4.1);
    adding the last effective term can introduce base components only in its non-double-dominant support.
  Take a divisible multiple whose base locus is the stable base locus,
    and principalize its base ideal on a smooth $w : tilde(P) arrow.r P$,
    with normal crossings support also including $E$. This can be done without changing the complement of the base
    locus. Write
  $ w^(*) \( A - t E - epsilon J \) = M + F_(upright("fix")) \, $
  where $M$ is semiample and $F_(upright("fix")) gt.eq 0$ has only non-double-dominant components.
    Choose an effective $w$-exceptional $T$ with $- T$ relatively ample.
    For sufficiently small rational $u > 0$, $epsilon w^(*) J - u T$ is ample. Consequently
  $ D = w^(*) \( A - t E \) - F_(upright("fix")) - u T + H_1 + H_2 $
  is ample and has a Kähler representative with $D gt.eq H_1 + H_2$. If $F$ is the strict transform of $E$, then
  #[#set math.equation(numbering: n => "(4.12)")
   $ D = \( a_1 + 1 \) H_1 + \( a_2 + 1 \) H_2 - t F - Z \, wide Z = t \( w^(*) E - F \) + F_(upright("fix")) +
     u T gt.eq 0 . $ <diag:ample-class>]
  Its components are smooth and fail to be double dominant.
    All further constants $C$ depend only on $n \, c$, and may increase from line to line.
    Volume monotonicity in (4.12) gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ integral_(tilde(P)) D^(2 n) lt.eq binom(2 n, n) \( a_1 + 1 \)^n \( a_2 + 1 \)^n l^2 lt.eq C . $ <diag:volume>]
  For general $x in U$, the fibre $tilde(P)_x$ over the first projection is smooth and birational to $U$.
    All the correction components avoid the fibre above the diagonal point $\( x \, x \)$:
    for each one, at least one projection has proper image. Thus the original exceptional space there is unchanged and
  #[#set math.equation(numbering: n => "(4.14)")
   $ F_x tilde.eq bb(P)^(n - 1) \, quad cal(O) \( F_x \) \|_(F_x) = cal(O)_(bb(P)^(n - 1)) \( - 1 \) \, quad
     D \|_(F_x) = t thin c_1 \( cal(O)_(bb(P)^(n - 1)) \( 1 \) \) \, quad D_x^n gt.eq l \, $ <diag:fibre-intersections>]
  where $D_x = D \|_(tilde(P)_x)$. The last inequality follows from $D_x gt.eq H_2 \|_(tilde(P)_x)$.
  === The diagonal class and its norm <the-diagonal-class-and-its-norm>
  We will construct a middle-degree class $v$ whose intersection with $D^n$ is fixed,
    but whose norm is small when $r \( U \)$ is large. A test class with the same intersection and the improved
    growth of Lemma 7 will then force an upper bound for $r \( U \)$.
  Put $r = r \( U \) > 0$; positivity follows from the canonical generator,
    since $H^(n \, 0) \( U \)$ is one-dimensional. By Lemma 6, $T \( U \)$ is primitive.
    Choose a Hodge-homogeneous basis $alpha_1 \, dots.h \, alpha_r$ of $T \( U \)_(bb(C))$,
    orthonormal for its Hodge–Riemann Hermitian form, so that
  $ integral_U alpha_i overline(alpha_j) = c_i delta_(i j) \, wide \| c_i \| = 1 . $
  Put $beta_i = overline(alpha_i) \/ c_i$ and, on $tilde(P)$, set
  $ v = l / r sum_(i = 1)^r alpha_i ⊗ beta_i in H^(n \, n) \( tilde(P) \) \, $
  using pullback from $Y$. The graded product rule and the dual-basis normalization give
  #[#set math.equation(numbering: n => "(4.15)")
   $ \( - 1 \)^n integral_(tilde(P)) v overline(v) = l^2 / r \, wide H_1 v = H_2 v = 0 . $ <diag:self-pairing>]
  On the diagonal, the class $v$ has integral $l$; hence its restriction to $F$ is $H_1^n \|_F$.
    On every component of $Z$, one projection has image of dimension less than $n$,
    so Lemma 6 kills the corresponding factor in $v$. The projection formula and (4.12) now give
  #[#set math.equation(numbering: n => "(4.16)")
   $ D v = - t \[ F \] H_1^n \, wide integral_(tilde(P)) v D^n = - t^n l . $ <diag:intersection>]
  For the second identity, integrate over the first factor and use $integral_(F_x) D_x^(n - 1) = t^(n - 1)$ from (4.14).
  For $R gt.eq 1$, consider $omega = D + R H_1$. We claim that
  #[#set math.equation(numbering: n => "(4.17)")
   $ lr(bar.v.double \[ F \] H_1^n bar.v.double)_omega lt.eq C R^(- n \/ 2) . $ <diag:exceptional-norm>]
  By Hodge-star duality, it suffices to pair with harmonic $\( n - 1 \, n - 1 \)$-forms $g$.
    On the general fibre, Lefschetz decomposition of the $\( 1 \, 1 \)$-class $\[ F_x \]$ bounds its squared Hodge
    norm by a dimensional constant times
  $ \| F_x^2 D_x^(n - 2) \| + frac(\( F_x D_x^(n - 1) \)^2, D_x^n) . $
  This is bounded by (4.14), since the two numerators are $t^(n - 2)$ and $t^(2 n - 2)$. Consequently
  $ lr(|integral_(tilde(P)_x) \[ F_x \] g \|_(tilde(P)_x)|) lt.eq
    C lr(bar.v.double g \|_(tilde(P)_x) bar.v.double)_(L^2 \( D_x \)) . $
  Here replacing a closed restricted form by its harmonic representative can only decrease its norm.
    Integrate against $H^n$ on $U$ and apply Cauchy–Schwarz. Pointwise restriction to the vertical tangent space
    does not increase the norm, while
  $ H_1^n and omega^n lt.eq C R^(- n) omega^(2 n) . $
  Fibre integration outside the measure-zero exceptional sets therefore gives
  $ integral_U lr(bar.v.double g \|_(tilde(P)_x) bar.v.double)_(L^2 \( D_x \))^2 H^n \( x \) lt.eq
    C R^(- n) lr(bar.v.double g bar.v.double)_omega^2 . $
  Since $integral_U H^n = l lt.eq 2$, this proves (4.17).
  Decompose $v = v_0 + v_1$ into its primitive and nonprimitive parts for $omega$.
    Lefschetz linear algebra has a dimension-only inverse bound on the nonprimitive middle-degree part.
    Equations (4.15), (4.16), and (4.17) imply
  $ lr(bar.v.double v_1 bar.v.double)_omega lt.eq C lr(bar.v.double omega v bar.v.double)_omega lt.eq C R^(- n \/ 2) . $
  Hodge–Riemann positivity on $v_0$, and orthogonality of Lefschetz summands for both the Hodge norm and the
    middle intersection pairing, then give
  #[#set math.equation(numbering: n => "(4.18)")
   $ lr(bar.v.double  bar.v.double) v_omega lt.eq C #scale(x: 120%, y: 120%)[\(] r^(- 1 \/ 2) +
     R^(- n \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <diag:small-norm>]
  Indeed, the signed self-pairing of $v_0$ is its squared norm,
    whereas the absolute self-pairing of $v_1$ is bounded by its squared norm;
    (4.15) supplies the remaining term $l^2 \/ r$.
  To test the fixed intersection in (4.16), set
  $ z' = D^n - c' H_2^n \, wide c' = frac(integral H_1^n D^n, integral H_1^n H_2^n) = frac(integral H_1^n D^n, l^2) . $
  Thus $H_1^n z' = 0$, and $\| c' \| lt.eq C$ by $H_i lt.eq D$ and (4.13).
    The same inequalities give $lr(bar.v.double z' bar.v.double)_(D + H_1) lt.eq C$:
    the indicated smooth representatives have bounded pointwise norm for $D + H_1$, whose volume is bounded.
    The form $H_1$ has rank at most $n$, so Lemma 7 yields
  $ lr(bar.v.double z' bar.v.double)_(D + R H_1) lt.eq C R^(\( n - delta_n \) \/ 2) . $
  Since $v H_2 = 0$, cup-product Cauchy–Schwarz and (4.18) now imply
  $ t^n lt.eq t^n l = lr(|integral v z'|) lt.eq C #scale(x: 120%, y: 120%)[\(] r^(- 1 \/ 2) +
    R^(- n \/ 2) #scale(x: 120%, y: 120%)[\)] R^(\( n - delta_n \) \/ 2) . $
  Choose $R$ depending only on $n \, c$ so large that the term $C R^(- delta_n \/ 2)$ is at most $t^n \/ 2$.
    The remaining inequality bounds $r$ in terms of $n \, c$, as required. ◻
]

== 5 A uniform bound for the top-form Hodge structure <sec:rank>

The diagonal estimate bounds the top-form Hodge rank from a uniform positive lower bound for the Seshadri constant
  of a normalized polarization. Here we remove that additional hypothesis for varieties whose smaller rational
  images are rationally connected.

#thm([Theorem 5.1.])[
  #emph[For every integer $n gt.eq 2$ there is a constant $R_n$ with the following property.
    Let $T$ be a projective $bb(Q)$-factorial terminal complex $n$-fold with $K_T tilde.op 0$.
    Suppose that a smooth projective resolution $U$ has $h^1 \( U \, cal(O)_U \) = 0$,
    and that every positive-dimensional rational image of $T$ of dimension less than $n$ has a rationally
    connected smooth projective resolution. Then
$ r \( T \) = dim_(bb(Q)) T \( U \) lt.eq R_n . $

]
] <thm:rank>

The proof proceeds by contradiction. Large $r \( T \)$ produces covering subvarieties of Kodaira dimension zero on
  which complete systems of the restricted polarization have small orders.
  The rational functions constant on these members define fields that can be realized by contractions on small
  terminal models. We choose a contraction with maximal proper base dimension and use a bounded comparison model
  for its base. A suitable big divisor then lets us compare two section counts:
  vertical jets bound the number of independent restrictions to a fibre,
  while slopes on the base bound the number of global sections these restrictions can produce.
  Their product is too small to account for the divisor’s volume.

Unless another dependence is displayed, constants depend only on the dimension.
  Thresholds for taking a sufficiently divisible multiple of a divisor may depend on that divisor and its variety.
  We write $D_1 prec.curly.eq D_2$ when $D_2 - D_1$ is rationally linearly equivalent to an effective rational
  divisor; such a comparison is restricted only to subvarieties not contained in the chosen effective difference.

=== 5.1 Section orders and the covering-family inputs <section-orders-and-the-covering-family-inputs>

Let $P$ be a big, nef, semiample rational Cartier divisor on an integral projective variety $V$.
  At a smooth point $x$, set

$ gamma \( P \; V \, x \) = sup_(m > 0 upright(" sufficiently divisible")\
0 eq.not s in H^0 \( tilde(V) \, m mu^(*) P \)) frac("ord"_x \( s \), m) \, $

where $mu : tilde(V) arrow.r V$ is a smooth projective resolution that is an isomorphism near $x$.
  Birational pushforward makes this independent of the resolution.
  We always use these complete section spaces, even when $V$ occurs as a subvariety of another variety.
  Write $gamma \( P \; V \)$ for the very general value. In dimension $d$, counting sections and jet conditions gives

#[#set math.equation(numbering: n => "(5.1)")
 $ gamma \( P \; V \) gt.eq \( P^d \)^(1 \/ d) . $ <eq:rank:order-volume>]

Indeed, the two leading counts are $P^d m^d \/ d !$ and $k^d \/
  d !$ for sections and conditions of order at least $k$, respectively.

We use three results from the scalar-order construction of #cite(label("UPI"), form: "prose") Section “Scalar
  order and curve estimates”. We state exactly the parts needed below.
  A #emph[marked covering family] consists of an integral parameter space $S$, a dominant mark map $u : S arrow.r
  V$, and an incidence $cal(I) subset S times V$ whose geometric generic fibre $C_b$ is integral,
  positive-dimensional, and contains $u \( b \)$. A generic movement from a generic mark chooses a generic
  parameter over that mark and then a generic point of its member.
  Each new choice is generic over all preceding data. Dominant extensions of parameter spaces are allowed to
  specify geometric components and models.

#thm([Input 5.2.])[
  (Generic chains).  #emph[A finite nonempty collection of marked covering families determines a rational
    fibration $xi : V arrow.r.dashed M$ with geometrically integral generic fibre.
    If its generic fibre, called a leaf, has dimension $h$, then $1 lt.eq h lt.eq dim V$,
    every generic member lies in a leaf, and at most $h$ generic movements reach a point generic in the leaf over
    the algebraic closure of the field of its starting mark. Suppose that, for each family, either
$ gamma \( P \|_(C_b) \; C_b \, u \( b \) \) lt.eq B \, wide upright("or") wide dim C_b = 1 \, quad
  frac(P dot.op C_b, "mult"_(u \( b \)) C_b) lt.eq B . $

 For a smooth model $F$ of the geometric generic leaf, with $P$ pulled back, one then has
#[#set math.equation(numbering: n => "(5.2)")
 $ gamma \( P \|_F \; F \) lt.eq h B \, wide \( P \|_F \)^h lt.eq \( h B \)^h . $ <eq:rank:chain-bound>]

]
] <input:rank:chains>

This is #cite(label("UPI")) Lemma 6.2. The assertion about endpoints also identifies its function field:
  $bb(C) \( M \)$ consists exactly of the rational functions constant on the geometric generic members.
  In fact, enlarge the field of definition to contain the function being tested.
  Constancy along successive movements then gives constancy at a generic endpoint of the leaf,
  hence constancy on that geometric generic leaf.

#thm([Input 5.3.])[
  (Tracking and canonical degrees).  #emph[Let $Z$ be projective, $bb(Q)$-factorial and klt of dimension $d gt.eq
    2$, and let $N$ be big, nef and semiample. If $d + 1$ equally spaced positive rational levels,
    with spacing $Delta > 0$, lie strictly between $\( N^d \)^(1 \/ d)$ and $gamma \( N \; Z \)$,
    there is a covering family of subvarieties $W subset Z$, of dimension $0 < e < d$,
    such that a smooth geometric generic model $W^(*)$ satisfies
#[#set math.equation(numbering: n => "(5.3)")
 $ N^e W & lt.eq \( 2 \/ Delta \)^(d - e) N^d \,\
K_(W^(*)) \( N \|_(W^(*)) \)^(e - 1) & lt.eq #scale(x: 120%, y: 120%)[\(] K_Z + \( 2 d \/ Delta \) N
  #scale(x: 120%, y: 120%)[\)] \|_W \( N \|_W \)^(e - 1) . $ <eq:rank:tracking-degree>]

 If a smooth model of $Z$ has nonnegative Kodaira dimension, so does $W^(*)$.
   The same inheritance statement holds for arbitrary covering families.]
] <input:rank:tracking>

This is #cite(label("UPI")) Lemma 6.3; its section order argument uses the parameter differentiation of
  #cite(label("EKL1995"), form: "prose") Proposition 2.3. For the inheritance statement,
  cut the parameter space until incidence evaluation is generically finite and dominant, resolve,
  and restrict the ramification formula to a geometric generic parameter fibre.
  The cuts can be chosen with independent generic coefficients,
  so the construction still tests the original geometric generic member.

#thm([Input 5.4.])[
  (Small volumes on Iitaka fibres).  #emph[Fix $e gt.eq 1$ and $C' > 0$.
    Let $W_i$ be smooth projective $e$-folds with $kappa \( W_i \) gt.eq 0$, and let $L_i$ be big, nef,
    semiample rational divisors such that
$ L_i^e arrow.r 0 \, wide K_(W_i) L_i^(e - 1) lt.eq C' L_i^e . $

 After passing to a subsequence and resolving their Iitaka fibrations,
   the smooth geometric generic fibres $U_i$ have a fixed positive dimension, satisfy $kappa \( U_i \) = 0$, and obey
$ "vol" \( K_(U_i) + L_i \|_(U_i) \) arrow.r 0 . $

 The restrictions $L_i \|_(U_i)$ remain big, nef and semiample.
   When the Iitaka base is a point, $U_i$ is the entire smooth model.]
] <input:rank:small-fibre>

This is #cite(label("UPI")) Lemma 6.4. Its uniform Iitaka hypothesis is supplied by that paper’s uniform
  pluricanonical Iitaka theorem. We use the conclusion in arbitrary lower dimensions,
  including a zero-dimensional Iitaka base. All three inputs hold at geometric generic data:
  their finite constructions spread after dominant parameter extensions.
  A countable field of definition includes the section-order conditions in all sufficiently divisible degrees.
  Thus the analytic and model-theoretic inputs over $bb(C)$ apply to these data without specializing a previously
  generic parameter.

=== 5.2 Large rank produces subvarieties of small order <large-rank-produces-subvarieties-of-small-order>

The transition is indirect: small Seshadri constants force large ambient section orders,
  and the tracking input turns these orders into subvarieties of small polarized degree.
  Passing to Iitaka fibres and repeating in decreasing dimension eventually produces small complete-system orders
  on Kodaira-dimension-zero members.

#thm([Lemma 5.5.])[
  #emph[Fix $n gt.eq 2$ and $eta > 0$. There is a number $R \( n \, eta \)$ such that if $T$ is as in Theorem 9
    and $r \( T \) > R \( n \, eta \)$, the following holds. For every normal projective canonical $V$ birational
    to $T$ with $K_V tilde.op 0$, and every ample rational Cartier divisor $P$ on $V$,
    there is a marked covering family of subvarieties $C_b$ with $0 < dim C_b < n$,
    whose smooth geometric generic models satisfy
#[#set math.equation(numbering: n => "(5.4)")
 $ kappa \( C_b^(*) \) = 0 \, wide gamma \( P \|_(C_b) \; C_b \, u \( b \) \) lt.eq eta \( P^n \)^(1 \/ n) \,
   $ <eq:rank:low-order>]

 where the mark is smooth on the member.]
] <lem:rank:low-order>

#proof[
  We explain the two scalar-order arguments from #cite(label("UPI")) used here,
    since the additional fibration hypothesis in its full scalar-estimate Proposition 6.1 is unnecessary for this
    conclusion.
  #emph[From small Seshadri constants to large ambient orders.] Suppose that $1 lt.eq P_i^n lt.eq
    2$ and that the very general Seshadri constants $epsilon \( P_i \)$ tend to zero. Then
  #[#set math.equation(numbering: n => "(5.5)")
   $ gamma \( P_i \; V_i \) arrow.r oo $ <eq:rank:large-order>]
  after passing to a subsequence. Otherwise the orders are bounded by some $D_0$.
    Curves realizing arbitrarily small Seshadri ratios spread into marked covering curve families.
    Input 10 produces leaves of a fixed dimension $h$ with $\( P_i \|_(F_i) \)^h arrow.r 0$.
    Since $P_i^n gt.eq 1$, eventually $0 < h < n$. Resolve the leaf fibration and choose a very general smooth
    fibre $F_i$; put $q = n - h$. Its normal bundle is trivial.
    Therefore restriction to its $u$th infinitesimal neighbourhood has rank at most
  $ binom(u + q - 1, q) h^0 \( F_i \, m P_i \|_(F_i) \) . $
  Set $u = ceil.l D m ceil.r$ for a fixed $D > D_0$. For each fixed fibration the leading coefficient of this
    expression in $m^n$ is
  $ frac(D^q, q ! h !) \( P_i \|_(F_i) \)^h \, $
  whereas the ambient section count has coefficient at least $1 \/ n !$.
    First take $i$ large, then $m$ sufficiently divisible and large.
    A nonzero ambient section vanishes on that neighbourhood,
    so has order at least $u$ at a very general point of $F_i$. This contradicts the bound $D_0$.
    This argument is the proof of the second scalar inequality in #cite(label("UPI")),
    with its order bound as an explicit hypothesis.
  #emph[From large ambient orders to small orders on moving members.] If the lemma were false,
    choose counterexamples with $r \( T_i \) arrow.r oo$ and rescale $P_i$ rationally to have $1 lt.eq P_i^n lt.eq
    2$. Lemma 8 forces $epsilon \( P_i \) arrow.r 0$, and hence (5.5) holds.
    Take small projective $bb(Q)$-factorializations and pull back $P_i$.
    They are klt, have principal canonical divisor, and preserve the complete section spaces.
    Choose $n + 1$ order levels with spacing $Delta_i arrow.r
    oo$ between $\( P_i^n \)^(1 \/ n)$ and $gamma \( P_i \; V_i \)$.
    Input 11 produces members of a fixed dimension $e < n$ on a subsequence.
    With $W_i$ their smooth models and $L_i = P_i \|_(W_i)$,
  $ kappa \( W_i \) gt.eq 0 \, wide L_i^e arrow.r 0 \, wide K_(W_i) L_i^(e - 1) lt.eq C' L_i^e . $
  Here $K_(V_i) tilde.op 0$, so $C'$ can be fixed. Input 12 gives positive-dimensional Iitaka fibres $U_i$ with
    $kappa \( U_i \) = 0$ and adjoint volume tending to zero.
  Represent $L_i \|_(U_i)$ by a divided general free member $Gamma_i$ for which $\( U_i \, Gamma_i \)$ is klt.
    A $bb(Q)$-factorial good model $Z'_i$ of this big adjoint exists by #cite(label("BCHM2010"));
    write $N'_i$ for its big semiample adjoint. Then
  $ \( N'_i \)^(dim Z'_i) arrow.r 0 \, wide K_(Z'_i) prec.curly.eq N'_i \, wide kappa \( Z'_i \) = 0 . $
  On a common resolution, with maps $x_i$ to $U_i$ and $y_i$ to $Z'_i$, there is also the effective comparison
  #[#set math.equation(numbering: n => "(5.6)")
   $ x_i^(*) \( L_i \|_(U_i) \) prec.curly.eq y_i^(*) N'_i . $ <eq:rank:polarization-comparison>]
  To prove it, write $x_i^(*) \( K_(U_i) + Gamma_i \) tilde.op_(bb(Q)) y_i^(*) N'_i + F_i$ with $F_i gt.eq
    0$ exceptional over $Z'_i$. Since $kappa \( U_i \) = 0$, choose an effective $D_i tilde.op_(bb(Q)) K_(U_i)$.
    In divisible degrees, the pullback of $D_i$ plus a general member of the free polarization system contains the
    fixed part $F_i$. The latter general member contains none of the finitely many components of $F_i$,
    hence $F_i lt.eq x_i^(*) D_i$. Subtracting proves (5.6).
  If $gamma \( N'_i \; Z'_i \) arrow.r 0$ along a subsequence, stop.
    Otherwise take a subsequence on which it has a positive lower bound.
    More generally, the data at this stage have fixed dimension $d$, are $bb(Q)$-factorial klt, and satisfy
  $ N_i^d arrow.r 0 \, wide kappa \( Z_i \) gt.eq 0 \, wide K_(Z_i) prec.curly.eq a_0 N_i \, wide
    gamma \( N_i \; Z_i \) gt.eq a_1 > 0 $
  for fixed positive $a_0 \, a_1$. Choose $d + 1$ equally spaced fixed levels below $a_1$;
    they eventually exceed $\( N_i^d \)^(1 \/ d)$. The tracking and Iitaka-fibre inputs apply again,
    since their canonical-degree bound is at most $\( a_0 + 2 d \/ Delta \) L_i^e$.
    They produce another good model of strictly smaller positive dimension,
    with polarization volume tending to zero, Kodaira dimension zero,
    canonical class bounded above by the new polarization, and comparison (5.6).
    At this new stage we make the same dichotomy: either the orders tend to zero along a subsequence and we stop,
    or they have a positive lower bound on a subsequence and the construction repeats.
    Every repetition decreases dimension. In dimension one the order is bounded by the degree,
    which tends to zero, so the construction must terminate with order tending to zero.
  Trace these members through the successive covering families and Iitaka fibres to the original $V_i$.
    Fibres sweep the preceding member; the birational comparisons are isomorphisms on opens met by the next
    geometric generic members. Thus the composite members map birationally to their images and have Kodaira
    dimension zero. Each effective comparison restricts to the next member,
    which is not contained in its extra divisor. Restricting successively and pulling back to a common smooth
    model of the final descendant compares the original restricted polarization with the final polarization by an
    effective difference. Multiplication by that difference injects their #emph[complete] section spaces.
    At a generic mark outside the difference it preserves order.
    Thus the resulting members satisfy $gamma \( P_i \|_(C_b) \; C_b \, u \( b \) \) arrow.r 0$.
    They eventually satisfy (5.4), a contradiction. This is the dimension-decreasing part of the first
    scalar-estimate proof in #cite(label("UPI")), stopped before its separate fibration contradiction. ◻
]

We will also apply this lemma to a big rational divisor $D$ on a $bb(Q)$-factorial canonical model $X$ birational
  to $T$, with $K_X tilde.op 0$. Choose a small effective klt boundary proportional to $D$ and run its MMP.
  Its ample model $X_D$ is canonical with $K_(X_D) tilde.op 0$:
  the canonical generator remains principal on every model,
  and all these birational steps are crepant for the zero boundary.
  Let $P_D$ be the ample polarization induced by $D$. On a common resolution,

#[#set math.equation(numbering: n => "(5.7)")
 $ p^(*) D tilde.op_(bb(Q)) q^(*) P_D + E \, wide E gt.eq 0 upright(" exceptional over ") X_D \, wide v \( D \) :=
   "vol" \( D \)^(1 \/ n) = \( P_D^n \)^(1 \/ n) . $ <eq:rank:ample-model>]

Multiplication by the fixed part identifies sufficiently divisible section spaces.
  The low-order lemma applies to $\( X_D \, P_D \)$ because $r \( T \)$ is birationally invariant.

=== 5.3 Realizing chain fields by contractions <realizing-chain-fields-by-contractions>

The chain fibration just constructed is initially rational.
  Its realization as a morphism on a small terminal model will make its base accessible to the boundedness input.
  Call a subfield of $bb(C) \( T \)$ #emph[attained] if it is the field of a contraction $T' arrow.r Y$,
  where $T'$ is $bb(Q)$-factorial terminal and is equipped with a crepant birational map to $T$ that is an
  isomorphism in codimension one.

#thm([Lemma 5.6.])[
  #emph[If $0 < eta < 1 \/ n$, every chain field obtained from a family in Lemma 13 is attained and has
    transcendence degree strictly between $0$ and $n$.]
] <lem:rank:attainment>

#proof[
  Its leaves have positive dimension. A leaf cannot fill $V$,
    since (5.2) and (5.4) would give $gamma \( P \; V \) lt.eq n eta \( P^n \)^(1 \/ n)$, contradicting (5.1).
    Its function field is relatively algebraically closed in $bb(C) \( T \)$ by the geometric integrality of its leaves.
  Choose a smooth projective base model $M$ for this field.
    For $phi.alt : T arrow.r.dashed M$, let $J$ be the closure on $T$ of the inverse image of a general member
    $H_M$ of a very ample system on $M$. The map is defined in codimension one,
    and these divisors form a movable system. On a smooth resolution $p : tilde(T) arrow.r T$ resolving $phi.alt$,
  #[#set math.equation(numbering: n => "(5.8)")
   $ p^(*) J = tilde(phi.alt)^(*) H_M + E_M \, wide E_M gt.eq
     0 upright(" exceptional over ") T . $ <eq:rank:movable-base>]
  Choose $H_M$ general for this resolution as well. With the canonical generator used to represent $K_(tilde(T))$,
    terminality gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ K_(tilde(T)) gt.eq a E_M $ <eq:rank:terminal-domination>]
  for some positive rational $a$.
  We claim that all ratios of sections of divisible multiples of $J$ are constant on the generic members of the
    covering family, transferred to $tilde(T)$. Here is why (5.9) may be used on a member.
    Cut the parameter space by the dimension of a generic evaluation fibre,
    choosing hyperplanes with independent generic coefficients.
    The resulting incidence evaluates generically finitely and dominantly to $tilde(T)$.
    Nonempty zero-dimensional cuts of the generic evaluation fibre avoid the added boundary in a projective
    closure. The universal choices of hyperplanes still dominate the original parameter space.
    After a geometric component and a resolution are chosen, the ramification formula on this total space,
    restricted to its smooth geometric generic parameter fibre $C^(*)$, gives
  $ K_(C^(*)) succ.curly.eq a E_M \|_(C^(*)) . $
  The map $tilde(phi.alt)$ is constant on $C^(*)$, so (5.8) identifies the restricted polarization with
    $E_M \|_(C^(*))$. Two independent restricted sections in any common degree,
    followed by a suitable power and multiplication by the effective canonical difference,
    would give two independent sections of a pluricanonical system on $C^(*)$.
    That would contradict $kappa \( C^(*) \) = 0$. Ambient nonzero sections remain nonzero at these generic data.
    The claim follows.
  By the function-field characterization after Input 10, the section-ratio field of $J$ is contained in
    $bb(C) \( M \)$. The reverse inclusion follows from ratios of hyperplane pullbacks, since $H_M$ is very ample.
    Thus this section-ratio field is exactly $bb(C) \( M \)$.
  For a small positive rational $epsilon$, the pair $\( T \, epsilon J \)$ is klt and its adjoint is
    pseudo-effective. Theorem 4 gives a terminating MMP to a good model. There are no divisorial steps:
    the divisor is movable, whereas the exceptional divisor of a negative divisorial contraction is contained in
    its fixed part. Movability persists through the flips. These steps are crepant for the zero boundary;
    the resulting $T'$ is again terminal and isomorphic to $T$ in codimension one.
    The semiample contraction, with Stein factorization, realizes the section-ratio field $bb(C) \( M \)$,
    which is already relatively algebraically closed. This proves attainment. ◻
]

Assume now that $r \( T \) > R \( n \, eta \)$, where $eta$ will be chosen uniformly at the end.
  There is an attained field of transcendence degree between $0$ and $n$.
  Among all attained fields of transcendence degree less than $n$,
  choose one whose transcendence degree $b$ is maximal, and write its contraction as

$ h : T' arrow.r Y \, wide s = n - b > 0 . $

The rational-image hypothesis in Theorem 9 makes a smooth resolution of $Y$ rationally connected.
  Proposition 5 therefore provides a normal comparison model $hat(Y)$, isomorphic to $Y$ in codimension one,
  and a very ample Cartier divisor $H$ with

#[#set math.equation(numbering: n => "(5.10)")
 $ N := H^b lt.eq C \( n \) \, wide \| K_(hat(Y)) H^(b - 1) \| lt.eq C \( n \) . $ <eq:rank:base-degree>]

We make one further modification so that divisors pulled back from the common big opens of these bases extend
  without ambiguity upstairs. Let $F_0$ be the sum of the prime divisors of $T'$ whose image in $Y$ has
  codimension at least two. There are finitely many: they are among the components of the closed locus where the
  fibre dimension is larger than $s$. Choose a very ample $H_0$ on $Y$ and a rational number $a > 2 n$.
  Run a terminating MMP for a klt boundary rationally equivalent to

$ epsilon F_0 + a h^(*) H_0 \, $

with $epsilon > 0$ small; the latter summand is represented by divided general members.
  The length bound $2 n$ for negative extremal rays, applied to the pair omitting this summand,
  forces every step to be over $Y$. Indeed a horizontal extremal curve has $h^(*) H_0$-degree at least one,
  so the added summand makes its total degree positive. This argument repeats after each step,
  and the morphism to $Y$ descends through contractions and flips.

Every component of $F_0$ is contracted. To see this, over the complement of their images the sections of the
  displayed adjoint come from $a H_0$: the fibres are connected and the adjoint restricts trivially there.
  These base sections extend across the omitted codimension-two set by normality.
  Thus every surviving component of $F_0$ would be a fixed component in all sufficiently divisible systems,
  contradicting semiampleness on the good model. Write that model as

#[#set math.equation(numbering: n => "(5.11)")
 $ h : X arrow.r Y . $ <eq:rank:working-fibration>]

It is $bb(Q)$-factorial canonical, has $K_X tilde.op 0$, and defines the same field as before.
  Its resolution still has irregularity zero. Crucially, #emph[no prime divisor of $X$ maps to a subset of
  codimension at least two in $Y$]. Terminality is no longer required for this working model;
  any later chain field is attained by applying Lemma 14 on the original terminal $T$.

=== 5.4 A big divisor calibrated by the degree on the base <subsec:rank:calibration>

To compare orders on fibres with slopes on the base, we need a linear functional on divisor classes of $X$ that
  agrees with base degree on pullbacks and is nonnegative on effective divisors.
  We construct this functional together with a big divisor whose volume root and functional value are controlled
  by one parameter. The base polarization alone has zero volume on $X$,
  whereas an arbitrary ample divisor need not satisfy the required degree bound.

#thm([Lemma 5.7.])[
  (Calibration).  #emph[Let $h : X arrow.r Y$ be a contraction of normal projective complex varieties,
    where $X$ is a $bb(Q)$-factorial canonical $n$-fold with $K_X tilde.op
    0$ and irregularity zero on a resolution. Suppose that $0 < b :=
    dim Y < n$ and that no prime divisor of $X$ maps into a subset of codimension at least two in $Y$.
    Let $hat(Y)$ be a normal projective variety isomorphic to $Y$ in codimension one,
    and let $H$ be a very ample divisor on $hat(Y)$ satisfying
$ H^b lt.eq N_0 \, wide \| K_(hat(Y)) dot.op H^(b - 1) #scale(x: 120%, y: 120%)[\|] lt.eq N_0 . $

 Pullback from the common smooth open subsets of the bases defines
$ W = h^(*) "Cl" \( Y \)_(bb(R)) = h^(*) "Cl" \( hat(Y) \)_(bb(R)) subset N^1 \( X \)_(bb(R)) \, wide
  ell \( h^(*) L \) = L dot.op H^(b - 1) . $

 Let $A = h^(*) H$, represented by an effective integral Weil divisor.
   There is a linear extension $ell_X : N^1 \( X \)_(bb(R)) arrow.r bb(R)$ of $ell$,
   nonnegative on the pseudo-effective cone, and there are a rational number $delta >
   0$ and a big rational divisor $D$ such that
#[#set math.equation(numbering: n => "(5.12)")
 $ c delta lt.eq v \( D \) lt.eq C delta \, wide D - delta / 3 A upright(" is big") \, wide ell_X \( D \) lt.eq
   C delta . $ <eq:rank:calibration>]

 Here $v \( D \) = "vol" \( D \)^(1 \/ n)$, $c > 0$ depends only on $n$, and $C$ depends only on $n \, N_0$.]
] <lem:rank:calibration>

The two conditions beyond $v \( D \) asymp delta$ have distinct roles.
  The bigness of $D - delta A \/ 3$ will force the low-order families to be vertical.
  The bound on $ell_X \( D \)$ will convert cotangent semipositivity into a slope bound on the base.

#proof[
  We first construct a supporting functional for the pseudo-effective cone and then choose a point on which volume
    has the required scale. The hypothesis on irregularity, together with $bb(Q)$-factoriality, gives
  $ "Cl" \( X \)_(bb(R)) = "Pic" \( X \)_(bb(R)) = N^1 \( X \)_(bb(R)) . $
  Indeed pullback to a resolution detects numerically trivial line bundles,
    whose classes are torsion when the Picard variety is zero.
    We can therefore pass between real linear equivalence and numerical classes throughout the proof.
  Choose common smooth big open subsets of $Y$ and $hat(Y)$.
    Their inverse image in $X$ has complement of codimension at least two,
    so Cartier pullbacks there extend uniquely as Weil divisors on $X$.
    This defines the indicated pullback on class groups. It is injective:
    if $s = n - b$ and $Q$ is an ample Cartier divisor on $X$, the operation
  $ B mapsto h_(*) \( B dot.op Q^s \) $
  on divisor classes is a left inverse to pullback, up to multiplication by the positive degree of $Q^s$ on the
    generic fibre. The same operation sends effective classes to effective classes or zero,
    by using general representatives of sufficiently divisible multiples of $Q$.
  The degree $ell$ is strictly positive on $W ∩ overline("Eff") \( X \) \\ { 0 }$.
    To see the point requiring care, choose a finite linear projection $f : hat(Y) arrow.r
    bb(P)^b$ with $f^(*) cal(O)_(bb(P)^b) \( 1 \) = cal(O)_(hat(Y)) \( H \)$.
    For every effective real Weil divisor $L$ on $hat(Y)$,
  #[#set math.equation(numbering: n => "(5.13)")
   $ ell \( L \) H - L quad upright("has an effective representative") . $ <eq:rank:degree-dominates>]
  In fact $f^(*) f_(*) L - L gt.eq 0$ and $f_(*) L tilde.op_(bb(R)) ell \( L \) cal(O)_(bb(P)^b) \( 1 \)$.
    The intersect-and-push operation just described shows that if a pullback class is pseudo-effective on $X$,
    its base class lies in the closure of effective base classes.
    Applying (5.13) to approximating classes and pulling back shows that a degree-zero such class and its negative
    are both pseudo-effective on $X$. The pseudo-effective cone in $N^1 \( X \)_(bb(R))$ contains no line,
    so the class is zero. This also proves that the formula defining $ell$ is well defined on $W$.
  Fix an ample class $P_0$ on $X$, and minimize $ell \( L \)$ on the set
  $ { L in W : P_0 + L in overline("Eff") \( X \) } . $
  The set is nonempty. Its subsets on which $ell$ is bounded above are bounded:
    otherwise, dividing an unbounded sequence by its norm and passing to a limit would give a nonzero
    pseudo-effective class in $W$ of nonpositive degree. Closedness therefore gives a minimum $c_0 =
    ell \( L_0 \)$. Put $d_0 = P_0 + L_0$. The open big cone is disjoint from
  $ P_0 + { L in W : ell \( L \) lt.eq c_0 } . $
  Indeed a big point in this affine half-space would remain big after subtracting a sufficiently small positive
    multiple of $A$, contradicting minimality. Separating these two convex sets gives a nonzero linear functional
    $lambda$, nonnegative on the pseudo-effective cone, with $lambda \( d_0 \) = 0$.
    Its restriction to $W$ is a nonnegative multiple of $ell$:
    it vanishes on $ker ell$, and the orientation follows from the half-space being separated.
    That multiple is positive, since otherwise $lambda \( P_0 \) = lambda \( d_0 \) = 0$,
    whereas a nonzero nonnegative functional is strictly positive at an interior point of the cone.
    Normalize $lambda$ to obtain $ell_X$.
  For $t > 0$, set $d_t = d_0 + t A$. These classes are big.
    For large $t$, $L_0 + t A$ is pseudo-effective, since sufficiently large multiples of $H$ added to any fixed
    real Weil class on the base are effective; convexity with the pseudo-effective class $d_0$ then proves the
    assertion for every $t > 0$. On the other hand, $A$ is not big:
    its restriction to the positive-dimensional generic fibre is trivial. Continuity and homogeneity of volume give
  #[#set math.equation(numbering: n => "(5.14)")
   $ frac(v \( d_t \), t) = v \( A + t^(- 1) d_0 \) arrow.r 0 wide \( t arrow.r oo \) \, wide ell_X \( d_t \) =
     t H^b . $ <eq:rank:large-calibration-parameter>]
  It remains to bound this volume ratio from below for small $t$.
    This is where the trivial canonical class enters the construction.
  Let $p : tilde(X) arrow.r X$ be a smooth projective resolution and write the divisorial Zariski decomposition of
    $tilde(d)_0 = p^(*) d_0$ as
  $ tilde(d)_0 = P_sigma \( tilde(d)_0 \) + N_sigma \( tilde(d)_0 \) . $
  We use its numerical formulation, as in #cite(label("Nakayama2004")) Chapter III and
    #cite(label("Boucksom2004")). Fix the dimension-dependent integer $M =
    M \( n \)$ in Birkar’s Calabi–Yau effective birationality theorem #cite(label("Birkar2023")) Corollary 1.4.
    Suppose first that $P_sigma \( tilde(d)_0 \)$ is numerically nonzero.
    For an ample class $J$ on $tilde(X)$, monotonicity of positive intersection products gives
  $ "vol" \( tilde(d)_0 + u J \) & = chevron.l \( tilde(d)_0 + u J \)^n #scale(x: 120%, y: 120%)[chevron.r]\
 & gt.eq u^(n - 1) P_sigma \( tilde(d)_0 + u J \) dot.op J^(n - 1) . $
  Here the trace of the one-class positive product is the positive part of the divisorial Zariski decomposition;
    see #cite(label("BFJ2009")) Definition 2.10, Proposition 2.13, Theorem 3.1, and Section 3.4.
    As $u arrow.b 0$, the intersection on the right tends to $P_sigma \( tilde(d)_0 \) dot.op J^(n - 1) > 0$.
    Choose $a > 0$ such that $p^(*) d_1 - a J$ is pseudo-effective.
    For $0 < t < 1$, the identity $d_t = \( 1 - t \) d_0 + t d_1$ and volume monotonicity yield
  $ "vol" \( d_t \) gt.eq \( 1 - t \)^n "vol" (tilde(d)_0 + frac(a t, 1 - t) J) . $
  Consequently $v \( d_t \) \/ t arrow.r oo$ as $t arrow.b 0$.
    The constants in this divergence may depend on $X$; no uniform threshold in $t$ is needed.
  Suppose instead that $P_sigma \( tilde(d)_0 \)$ is numerically zero.
    Then $d_0$ has a unique effective real representative $N'_0$.
    For existence, push forward $N_sigma \( tilde(d)_0 \)$; numerical and real linear equivalence agree here.
    For uniqueness, the pullback of any effective representative of $d_0$ dominates $N_sigma \( tilde(d)_0 \)$.
    Their difference is effective and numerically zero, hence zero. Let $E_0$ be the reduced support of $N'_0$.
    It has Kodaira dimension zero: if some multiple of $E_0$ had a different effective representative,
    replacing a sufficiently small positive multiple of $E_0$ inside $N'_0$ would contradict uniqueness.
  Choose a small positive rational $epsilon$ for which $\( X \, epsilon E_0 \)$ is klt.
    Theorem 4 gives a terminating MMP for this pair and a good model $overline(X)$.
    Precisely the components of $E_0$ are contracted. Any divisorial step must contract a component of its
    transform, since $K tilde.op 0$ and a curve outside the effective boundary has nonnegative intersection with
    it. Conversely, semiampleness on the good model and $kappa \( E_0 \) =
    0$ force the effective pushforward of $E_0$ to vanish. These steps are crepant for the zero boundary,
    so $overline(X)$ is again $bb(Q)$-factorial canonical with principal canonical divisor.
    The pushforward $overline(A)$ of $A$ is an integral Weil divisor and is big:
    the big class $d_t$ pushes forward to $t overline(A)$. Birkar’s theorem now gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ "vol" \( overline(A) \) gt.eq M^(- n) wide #cite(label("Birkar2023"))upright(" Corollary 1.4") .
     $ <eq:rank:integral-volume-lower-bound>]
  Its hypotheses are exactly that $overline(X)$ is projective klt, $K_(overline(X)) tilde.op_(bb(R)) 0$,
    and $overline(A)$ is big and integral; no Cartier-index bound is required.
  A single rational number $u gt.eq 0$ gives inclusions
  $ H^0 \( overline(X) \, m overline(A) \) subset.eq H^0 \( X \, m \( A + u E_0 \) \) $
  for every sufficiently divisible $m$. Indeed, on a common resolution pull back $overline(A)$ and push forward to
    $X$. The resulting rational divisor differs from $A$ only on $E_0$,
    and its difference is bounded above by $u E_0$. Thus $"vol" \( A + u E_0 \) gt.eq "vol" \( overline(A) \)$.
    For all sufficiently small $t > 0$ we have $N'_0 gt.eq t u E_0$, and hence
  $ "vol" \( d_t \) = "vol" \( N'_0 + t A \) gt.eq t^n "vol" \( A + u E_0 \) gt.eq t^n M^(- n) . $
  The same conclusion includes $E_0 = 0$, with $u = 0$.
  In both cases the ratio $v \( d_t \) \/ t$ is at least $M^(- 1)$ for all sufficiently small $t > 0$.
    By (5.14) and continuity, it takes the value $\( 2 M \)^(- 1)$ at some $t > 0$. At this parameter,
  $ d_t - t / 3 A = d_(2 t \/ 3) upright(" is big") \, wide ell_X \( d_t \) = t H^b lt.eq N_0 t . $
  Approximate $t$ by a positive rational number $delta$ and $d_t$ by a rational class $D$.
    Openness of the big cone and continuity of volume and $ell_X$ preserve these assertions with, for example,
    lower constant $1 \/ \( 4 M \)$ and suitable upper constant depending only on $n \, N_0$.
    Since $X$ is $bb(Q)$-factorial, the rational class has a rational Cartier divisor representative.
    This proves (5.12). ◻
]

=== 5.5 Vertical orders and horizontal section counts <subsec:rank:count>

We now apply the low-order families to the divisor supplied by Lemma 15.
  Keep the contraction $h : X arrow.r Y$, its bounded comparison model $hat(Y)$,
  and the very ample divisor $H$ on $hat(Y)$. Write $b = dim Y$, $s = n - b$, $A = h^(*) H$, and $N = H^b$.
  Thus $0 < b < n$, and both $N$ and $\| K_(hat(Y)) dot.op H^(b - 1) \|$ are bounded in terms of $n$.
  There is no divisor of $X$ mapping into the codimension-two sets omitted when identifying $Y$ with $hat(Y)$.
  Let $D$ and $delta > 0$ be the calibrated divisor and parameter.
  In this subsection $C$ denotes constants depending only on $n$, independently of $0 < eta lt.eq 1$;
  the threshold for a sufficiently large divisible integer $m$ may depend on all the fixed geometric data.

For sufficiently large divisible $m$, our target is the estimate

#[#set math.equation(numbering: n => "(5.16)")
 $ h^0 \( X \, cal(O)_X \( m D \) \) lt.eq C #scale(x: 120%, y: 120%)[\(] m eta v \( D \)
   #scale(x: 120%, y: 120%)[\)]^s \( m delta \)^b . $ <eq:rank:count-target>]

The first factor will bound, over the base function field,
  the number of independent restrictions to the generic fibre, using vertical jets.
  The second will bound their contribution to global sections,
  using slopes on the base and a section estimate linear in the sheaf rank.
  Since $v \( D \)$ is comparable to $delta$, this would contradict the volume asymptotic $h^0 \( X \, m D \)
  tilde.op m^n v \( D \)^n \/ n !$ when $eta$ is sufficiently small.

===== 5.5.1 The families are vertical. <the-families-are-vertical.>

Apply Lemma 13 to the ample model $X_D$ of $D$. If a geometric generic member $C_t$ has nonconstant image in
  $hat(Y)$, choose a hyperplane in $\| H \|$ through the image of its marked point $x_t$ without containing the
  image of $C_t$. Since $D - delta A \/ 3$ is big, choose a section of a sufficiently divisible multiple of this
  divisor whose divisor avoids the generic mark. This section,
  multiplied by the corresponding power of the hyperplane section, gives

$ gamma \( P_D \|_(C_t) \; C_t \, x_t \) gt.eq delta \/ 3 . $

Here one works on a common resolution and uses (5.7). The mark lies in the birational isomorphism locus and avoids
  the fixed divisor; the chosen section remains nonzero on the member.
  Hyperplane pullbacks extend in codimension one on $X$ because no divisor maps into the omitted base sets.
  The same construction is valid over the geometric generic coefficient field.
  The low-order bound is at most $eta v \( D \) lt.eq C eta delta$,
  contradicting this inequality when $eta$ is sufficiently small in terms of $n$.

The family is therefore vertical for $h$. Its chain field contains $bb(C) \( Y \)$ and is attained.
  Both fields are relatively algebraically closed in $bb(C) \( X \)$;
  maximality of $dim Y$ among proper attained fields forces them to coincide.
  Indeed the chain field is proper by Input 10 and the choice $eta < 1 \/ n$,
  and an inclusion of equal transcendence degree would be algebraic.
  On a smooth model $F$ of the geometric generic fibre of $h$, also resolving the ample-model map,
  the chain estimate (5.2) now gives

#[#set math.equation(numbering: n => "(5.17)")
 $ gamma \( P_D \|_F \; F \) lt.eq s eta v \( D \) . $ <eq:rank:vertical-order>]

For sufficiently divisible $m$, put $V_m = H^0 \( X \, cal(O)_X \( m D \) \)$ and let $r_m$ be the dimension over
  $bb(C) \( Y \)$ of its span in the generic fibre of $h_(*) cal(O)_X \( m D \)$.
  After extending to the geometric generic field, this span identifies with a subspace of
  $H^0 \( F \, m P_D \|_F \)$ multiplied by the fixed part in (5.7). At a general mark that fixed part is a unit.
  Thus (5.17) bounds the order of every nonzero element of the span,
  including arbitrary scalar combinations over that field. Its vertical $k$-jet map is injective for

$ k = ceil.l m s eta v \( D \) ceil.r . $

Consequently, for $m$ sufficiently large,

#[#set math.equation(numbering: n => "(5.18)")
 $ r_m lt.eq binom(s + k, s) lt.eq C #scale(x: 120%, y: 120%)[\(] m eta v \( D \) #scale(x: 120%, y: 120%)[\)]^s .
   $ <eq:rank:vertical-rank>]

Saturate the subsheaf generically spanned by $V_m$ in $h_(*) cal(O)_X \( m D \)$,
  transfer it across the common big open of $Y$ and $hat(Y)$, and extend reflexively.
  This gives a reflexive sheaf $cal(E)_m$ on $hat(Y)$ of rank $r_m$, with

#[#set math.equation(numbering: n => "(5.19)")
 $ dim V_m lt.eq h^0 \( hat(Y) \, cal(E)_m \) . $ <eq:rank:sections-in-span>]

We must bound the number of these sections without losing a further power of $r_m$.

===== 5.5.2 A slope bound from jets along the fibres. <a-slope-bound-from-jets-along-the-fibres.>

For a torsion-free sheaf $cal(S)$ on $hat(Y)$ write

$ mu_H \( cal(S) \) = frac(c_1 \( cal(S) \) dot.op H^(b - 1), "rank" cal(S)) . $

Let $cal(S) subset cal(E)_m$ be saturated of rank $d > 0$.
  On a smooth big open of $X$, the saturated relative tangent sheaf $cal(T) =
  ker \( d h \)$ and its quotient in $cal(T)_X$ are vector bundles.
  We remove their codimension-two defects, while retaining the generic points of divisors where the differential
  of $h$ drops rank. The evaluation map from $h^(*) cal(S)$ to $L = cal(O)_X \( m D \)$ is defined there.
  Since $cal(T)$ is integrable, the bundles of jets along $cal(T)$ have a filtration with quotients

$ L ⊗ "Sym"^i \( cal(T)^(*) \) \, wide 0 lt.eq i lt.eq k . $

For completeness, these bundles can be constructed by taking ordered derivatives in local frames of $cal(T)$.
  The product rule makes changes of frames triangular in the order;
  integrability identifies the degree-$i$ symbol with $"Sym"^i \( cal(T)^(*) \)$.
  The cocycle identities agree with ordinary fibrewise jets on the dense smooth locus of $h$ and hence hold
  throughout this open.

Functions from the base have zero derivative along $cal(T)$.
  Taking jets of the evaluation map therefore gives an $cal(O)_X$-linear map

$ h^(*) cal(S) arrow.r J_(cal(T))^k \( L \) \, $

generically injective by (5.17). Take its top exterior power and a nonzero component in the induced graded
  filtration. In characteristic zero, the symmetric and exterior powers occurring there embed in direct sums of
  tensor powers. Selecting a nonzero summand gives

#[#set math.equation(numbering: n => "(5.20)")
 $ h^(*) det cal(S) arrow.r \( cal(T)^(*) \)^(⊗ j) ⊗ L^d \, wide 0 lt.eq j lt.eq k d . $ <eq:rank:jet-determinant>]

Wedge with the pulled-back base differentials defines a regular map

#[#set math.equation(numbering: n => "(5.21)")
 $ cal(T)^(*) arrow.r and.big^(b + 1) Omega_X^1 ⊗ cal(O)_X \( - h^(*) K_(hat(Y)) \) \, $ <eq:rank:base-wedge>]

which is generically injective. To check regularity, extend a local leafwise covector to an ordinary covector and
  wedge it with the pulled-back base volume form. Two extensions differ by a conormal covector,
  whose wedge is zero. This also proves regularity along multiple-fibre divisors:
  the pulled-back volume form may vanish there but has no pole.

Combining (5.20) and (5.21), and moving the twists to the source, gives a nonzero map from a line bundle of class

#[#set math.equation(numbering: n => "(5.22)")
 $ h^(*) det cal(S) - d m D + j h^(*) K_(hat(Y)) $ <eq:rank:source-line>]

to a tensor power of $Omega_X^1$. We test this map by the functional $ell_X$ from Lemma 15.
  On a smooth resolution $p : Z arrow.r X$, define $Lambda \( M \) = ell_X \( p_(*) M \)$.
  This is nonnegative on pseudo-effective divisor classes and vanishes on exceptional classes.
  The canonical class of $Z$ is effective and exceptional, since $X$ is canonical and $K_X tilde.op 0$,
  so $Lambda \( K_Z \) = 0$.

Saturate the line defined by the map on $Z$. Campana–Păun’s cotangent theorem #cite(label("CP2019")) Theorem 1.3
  says that every torsion-free quotient of a cotangent tensor power on $Z$ has pseudo-effective determinant.
  The determinant of the tensor power itself is a multiple of $K_Z$.
  It follows that the saturated line has $Lambda$-degree at most zero.
  Its pushforward differs from (5.22) by an effective divisor,
  because the original map is regular in codimension one. Thus

#[#set math.equation(numbering: n => "(5.23)")
 $ ell \( det cal(S) \) & lt.eq d m ell_X \( D \) - j ell \( K_(hat(Y)) \)\
 & lt.eq C d m delta . $ <eq:rank:slope-bound>]

The last inequality uses $j lt.eq k d$, $eta lt.eq 1$, the bounded canonical degree of $hat(Y)$,
  and $v \( D \) lt.eq C delta$; the ceiling in $k$ is absorbed once $m delta gt.eq 1$.
  If $j = 0$, the same conclusion follows directly from the effective divisor of the map to $cal(O)_X$.
  Since $cal(S)$ was arbitrary, this proves $mu_(max \, H) \( cal(E)_m \) lt.eq C m delta$.

===== 5.5.3 Counting sections without a rank loss. <counting-sections-without-a-rank-loss.>

The following elementary consequence of the Grauert–Mülich–Spindler theorem removes the rank from inside the
  polynomial section bound.

#thm([Lemma 5.8.])[
  #emph[Let $b gt.eq 1$. A torsion-free slope-semistable sheaf $cal(G)$ on $bb(P)_(bb(C))^b$,
    of rank $u$ and slope $mu$ with respect to $cal(O)_(bb(P)^b) \( 1 \)$, satisfies
$ h^0 \( bb(P)^b \, cal(G) \) lt.eq C_b u #scale(x: 120%, y: 120%)[\(] 1 + max { 0 \,
  mu } #scale(x: 120%, y: 120%)[\)]^b \, $

 where $C_b$ depends only on $b$.]
] <lem:rank:section-count>

#proof[
  If $mu < 0$, a nonzero section would yield a subsheaf of slope at least zero, contradicting semistability.
    Suppose $mu gt.eq 0$. For $b gt.eq 2$, the Grauert–Mülich–Spindler theorem #cite(label("GrauertMulich1975"))
    #cite(label("Spindler1979")), in its torsion-free form #cite(label("HuybrechtsLehn2010")) Corollary 3.1.6,
    bounds the highest degree $a$ of the splitting on a general line by $a lt.eq mu + \( u - 1 \) \/ 2 lt.eq mu +
    u$. For $b = 1$, the splitting theorem on $bb(P)^1$ and semistability give the stronger equality $a = mu$.
  A general linear flag gives, for any torsion-free sheaf with highest general-line splitting degree $a$,
  #[#set math.equation(numbering: n => "(5.24)")
   $ h^0 \( cal(G) \) lt.eq u binom(a + b, b) quad \( a gt.eq 0 \) \, wide h^0 \( cal(G) \) =
     0 quad \( a < 0 \) . $ <eq:rank:preliminary-count>]
  Indeed the successive restrictions can be chosen torsion-free:
    embed the sheaf in a vector bundle and choose the cuts general for the associated primes of the quotient as
    well. Testing general lines shows that twists by integers below $- a$ have no sections.
    Starting with the bound $u \( a + 1 \)$ on a line, the hyperplane restriction sequences and the identity
    $sum_(i = 0)^a binom(i + b - 1, b - 1) = binom(a + b, b)$ prove (5.24) inductively.
  For an integer $t gt.eq 1$, let
  $ f_t : bb(P)^b arrow.r bb(P)^b \, wide \[ x_0 : dots.h.c : x_b \] mapsto \[ x_0^t : dots.h.c : x_b^t \] . $
  Finite separable pullback preserves semistability #cite(label("Weissmann2024")) Lemma 2.1.
    Since $f_t$ is flat, $cal(G)_t = f_t^(*) cal(G) ⊗ cal(O)_(bb(P)^b) \( b \( t - 1 \) \)$ is torsion-free and
    semistable, of rank $u$ and slope $t mu + b \( t - 1 \)$. Moreover
  #[#set math.equation(numbering: n => "(5.25)")
   $ h^0 \( cal(G)_t \) gt.eq t^b h^0 \( cal(G) \) . $ <eq:rank:power-sections>]
  To see this, multiply the pulled-back sections by the $t^b$ homogeneous monomials
  $ x_0^(thin b \( t - 1 \) - sum_(i = 1)^b e_i) product_(i = 1)^b x_i^(e_i) \, wide 0 lt.eq e_i < t . $
  On $x_0 eq.not 0$, these monomials form a basis of the upper function field over the field generated by the
    $t$-th powers of the affine coordinates. A linear relation among their products with pulled-back sections
    therefore separates into linear relations among the original sections, which proves (5.25).
  Apply (5.24) to $cal(G)_t$, whose highest general-line degree is at most $t mu + b \( t - 1 \) + u$.
    Divide the resulting bound by $t^b$ and let $t arrow.r oo$, keeping $cal(G)$ and $u$ fixed. This yields
  $ h^0 \( cal(G) \) lt.eq frac(u, b !) \( mu + b \)^b \, $
  and hence the asserted bound, for example with $C_b = b^b \/ b !$. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 9.] Choose a finite linear projection $f : hat(Y) arrow.r
    bb(P)^b$ for the embedding defined by $H$. It has degree $N = H^b$ and $f^(*) cal(O)_(bb(P)^b) \( 1 \) =
    cal(O)_(hat(Y)) \( H \)$. The torsion-free sheaf $f_(*) cal(E)_m$ has rank $N r_m$ and
  #[#set math.equation(numbering: n => "(5.26)")
   $ mu_max \( f_(*) cal(E)_m \) lt.eq C m delta \/ N . $ <eq:rank:pushforward-slope>]
  For this, let $cal(A)$ be its first Harder–Narasimhan term.
    Adjunction gives a nonzero map $f^(*) cal(A) arrow.r cal(E)_m$.
    After removing torsion and extending across codimension two,
    it gives a map from the reflexive pullback $f^(\[ * \]) cal(A)$ to the reflexive sheaf $cal(E)_m$;
    denote its torsion-free image by $cal(Q)$. Finite separable reflexive pullback preserves semistability and
    multiplies slopes for these polarizations by $N$ #cite(label("Weissmann2024")) Lemma 2.1. Consequently
  $ N mu \( cal(A) \) lt.eq mu_H \( cal(Q) \) lt.eq mu_(max \, H) \( cal(E)_m \) lt.eq C m delta \, $
  proving (5.26). No injectivity of the adjunction map is required.
  Apply Lemma 16 to the semistable Harder–Narasimhan factors of $f_(*) cal(E)_m$ and sum their section bounds.
    Their ranks sum to $N r_m$, and $N$ is bounded in terms of $n$. For all sufficiently large divisible $m$, this gives
  $ dim V_m lt.eq h^0 \( hat(Y) \, cal(E)_m \) lt.eq C r_m \( m delta \)^b lt.eq
    C #scale(x: 120%, y: 120%)[\(] m eta v \( D \) #scale(x: 120%, y: 120%)[\)]^s \( m delta \)^b . $
  This is the target estimate (5.16). Divide by $m^n$ and use the volume asymptotic in divisible degrees.
    Since $n = s + b$, we obtain
  $ frac(v \( D \)^n, n !) lt.eq C eta^s v \( D \)^s delta^b . $
  The lower calibration bound $v \( D \) gt.eq c delta$ then implies $c^b \/ n ! lt.eq C eta^s$.
    This is impossible for a sufficiently small positive $eta$ depending only on $n$.
    There are only finitely many pairs $b \, s > 0$ with $b + s = n$, so choose $eta$ for all of them at once,
    also satisfying the earlier verticality and chain requirements,
    and then impose the rank threshold in Lemma 13. The resulting contradiction bounds $r \( T \)$ in terms of $n$
    alone. ◻
]

== 6 Uniform exponents for klt pluricanonical characters <sec:characters>

The rank bound now gives a uniform exponent for the scalar by which a crepant birational transformation acts on a
  log volume form. We work over $bb(C)$ throughout this section. The transformation itself may have infinite order.

#thm([Theorem 6.1.])[
  (Uniform klt character exponent).  #emph[For integers $n gt.eq 0$ and $m gt.eq 1$,
    there is an integer $L \( n \, m \) > 0$ with the following property.
    Let $\( X \, Delta \)$ be an integral projective klt $n$-fold pair, with $Delta gt.eq
    0$ and $m \( K_X + Delta \) tilde.op 0$ as an integral principal divisor.
    Choose a rational $m$-canonical form $theta$ with $"Div" \( theta \) = - m Delta$.
    For every B-birational self-map $f$ of $\( X \, Delta \)$, write $f^(*) theta = c theta$,
    where $c in bb(C)^(*)$. Then $c^(L \( n \, m \)) = 1$.]
] <thm:characters>

The proof separates the action into its rationally connected, abelian, and nonabelian boundary-free factors.
  The main issue is that an arbitrary birational transformation need not preserve a given product cover.
  We first construct a cover admitting a lift, and then recover the factor fields from their tangent directions.
  This costs only the exponent $n !$, independently of the degrees of the covers.

=== 6.1 A terminal model for the action <a-terminal-model-for-the-action>

Passing to a terminal pair makes the action an isomorphism in codimension one.
  We will then lift it through a finite cover of the smooth locus.

#thm([Lemma 6.2.])[
  #emph[In the setting of Theorem 17, there is a projective crepant birational morphism
$ \( V \, B_V \) arrow.r \( X \, Delta \) $

 such that $V$ is $bb(Q)$-factorial, $B_V gt.eq 0$, and the pair $\( V \, B_V \)$ is terminal.
   Every B-birational self-map of $\( X \, Delta \)$ induces a pseudo-automorphism of $V$ preserving $B_V$.]
] <char:terminal-model>

#proof[
  The extraction and $bb(Q)$-factorialization theorem for klt pairs #cite(label("BCHM2010")) Corollary 1.4.3
    extracts the exceptional divisors with discrepancy at most zero. There are only finitely many such divisors.
    To recall why, take a log resolution with crepant subboundary $sum b_j D_j$, where every $b_j < 1$.
    For an exceptional divisorial valuation $v$ over this resolution,
  $ A_(sum b_j D_j) \( v \) = A_(sum D_j) \( v \) + sum_j \( 1 - b_j \) v \( D_j \) . $
  The first term is a nonnegative integer. If it is positive and the centre is contained in the support,
    the displayed sum is strictly greater than one. If the generic point of the centre lies outside the support,
    smoothness gives log discrepancy at least two. Thus valuations of log discrepancy at most one are lc places of
    the reduced simple normal crossings divisor. Such places are toroidal;
    their positive integral weights are bounded by $sum_j \( 1 - b_j \) v \( D_j \) lt.eq 1$.
    Together with the finitely many divisors on the resolution, this proves finiteness.
    Extracting these places gives the asserted terminal pair,
    and its boundary is effective because each extracted discrepancy is nonpositive.
  Pull $theta$ back to $V$. Its order at every prime divisor of $V$ is nonpositive,
    whereas its order at every exceptional divisor over $V$ is strictly positive by terminality.
    A transformation multiplying $theta$ by a nonzero constant cannot exchange these two kinds of divisorial
    valuations. Neither it nor its inverse therefore contracts a prime divisor.
    It is a pseudo-automorphism, and the orders of $theta$ show that it preserves the boundary coefficients. ◻
]

=== 6.2 Product covers and their factor fields <product-covers-and-their-factor-fields>

We state the structural input in the form needed here. A finite surjective morphism of normal varieties is
  #emph[quasi-étale] if it is étale in codimension one. By purity it is étale over the smooth locus of its target.
  We write $Omega^(\[ j \])$ for the reflexive extension of $j$-forms from the smooth locus.

#thm([Input 6.3.])[
  (Product cover).  #emph[Let $\( V \, B_V \)$ be an integral projective klt pair with $B_V gt.eq 0$,
    $K_V$ rational Cartier, and $K_V + B_V tilde.op_(bb(Q)) 0$. There is a finite quasi-étale cover
$ P = product_(i in I) P_i arrow.r V $

 whose positive-dimensional factors have the following properties.
   There is at most one abelian factor and at most one rationally connected factor $\( F \, H \)$,
   where $\( F \, H \)$ is klt, $H gt.eq 0$, and $K_F + H tilde.op_(bb(Q)) 0$;
   the entire pulled-back boundary is the pullback of $H$, and is zero if that factor is absent.
   All factors are $bb(Q)$-Gorenstein. All other factors are irreducible Calabi–Yau or irreducible holomorphic
   symplectic varieties. They, and every connected normal finite quasi-étale cover of them,
   have canonical singularities and Cartier trivial canonical class.
   Their reflexive form algebra is generated by a top form in the Calabi–Yau case and by a symplectic form in the
   symplectic case. In particular they have no reflexive one-forms or vector fields.]
  #emph[The cover can be chosen so that every connected normal finite quasi-étale cover of $F$ is rationally
    connected. On every such cover, reflexive one-forms and vector fields tangent to the pulled-back boundary vanish.]
] <char:product-input>

The product decomposition is proved in #cite(label("LOGI"), form: "prose") Proposition 5.1,
  using the decomposition theorem of #cite(label("MatsumuraWang2025"), form: "prose") Theorem 1.3 and the singular
  Beauville–Bogomolov theorem #cite(label("HoringPeternell2019")) Definition 1.4 and Theorem 1.5.
  The statements about further covers and logarithmic vector fields are respectively Lemmas 5.3 and 5.2 of
  #cite(label("LOGI"), form: "prose"). The abelian factor includes all one-dimensional boundary-free factors.
  A connected normal finite quasi-étale cover of an abelian variety is étale,
  and is again abelian after choosing an origin.

The following argument adapts the factor-direction construction in #cite(label("LOGI"), form: "prose")
  Proposition 5.4. That proposition treats finite regular actions;
  we give the argument needed for arbitrary pseudo-automorphisms.

#thm([Lemma 6.4.])[
  (Lifting and separating a birational action).  #emph[Let $\( V \, B_V \)$ be as in Lemma 18,
    of dimension $n > 0$. Choose a product cover $P = product_(i in I) P_i arrow.r V$ as in Input 19,
    and let $f$ be a B-birational self-map with $f^(*) theta = c theta$.
    There are normal integral projective varieties $R \, R_i$, finite quasi-étale maps
$ R arrow.r^(med psi med) product_(i in I) R_i arrow.r product_(i in I) P_i arrow.r V \, $

 and birational self-maps $h_i$ of $R_i$ with the following properties.
   Each $R_i arrow.r P_i$ is a finite quasi-étale cover. Write $H_i$ for its boundary,
   zero except on the rationally connected factor, and put $p_i = m$ on that factor and $p_i = 1$ on the others.
   There are rational $p_i$-canonical forms $theta_i$ with
$ "Div" \( theta_i \) = - p_i H_i \, wide h_i^(*) theta_i = d_i theta_i quad \( d_i in bb(C)^(*) \) \, $

 and
#[#set math.equation(numbering: n => "(6.1)")
 $ c^(n !) = product_(i in I) d_i^(m \/ p_i) . $ <char:scalar-product>]

 In particular each $h_i$ is B-birational for $\( R_i \, H_i \)$.]
] <char:factor-actions>

#proof[
  #emph[A cover admitting a lift.] Put $U = V_(upright("sm"))$.
    The connected étale cover $P_U arrow.r U$ corresponds to a finite-index subgroup of
    $pi_1^(upright("top")) \( U \)$. This fundamental group is finitely generated,
    so it has only finitely many subgroups of any fixed index.
    Their intersection is a finite-index characteristic subgroup contained in the subgroup defining $P_U$.
    Riemann existence gives its connected algebraic étale cover.
    Normalize $V$ in its function field to obtain a finite quasi-étale cover $R arrow.r V$ factoring through $P$.
  The pseudo-automorphism $f$ identifies two open subsets of $U$ with complements of codimension at least two.
    Removing such subsets does not change the fundamental group of a complex manifold, by transversality.
    Characteristicity therefore lifts this isomorphism to the chosen cover.
    Riemann existence makes the lift algebraic, and it induces a pseudo-automorphism $g$ of $R$.
    If $H_R$ and $theta_R$ denote the pulled-back boundary and form, then
  $ g^(*) theta_R = c theta_R \, $
  and $g$ preserves $H_R$ in codimension one. No degree bound for $R arrow.r V$ is required.
  #emph[Preserving the factor directions.] Over the product of the smooth loci of the $P_i$, the map $R arrow.r
    P$ is étale. The tangent directions of the factors give a splitting there, whose reflexive extension is
  $ cal(T)_R = xor.big_(i in I) cal(E)_i . $
  Let $cal(T)_R \( - log "Supp" H_R \)$ be the reflexive sheaf of derivations preserving the reduced ideal of
    every boundary component, a condition tested at codimension-one points.
    Consider the finite-dimensional $bb(C)$-algebra
  $ cal(A) = { u in H^0 \( R \, "End" \( cal(T)_R \) \) : u \( cal(T)_R \( - log "Supp" H_R \) \) subset.eq
    cal(T)_R \( - log "Supp" H_R \) } . $
  Conjugation by $g$ acts on $cal(A)$: both the tangent sheaf and the logarithmic condition are determined on a
    big open set.
  Every member of $cal(A)$ has zero entries between different $cal(E)_i$.
    To see this, fix general smooth points in the complementary factors and slice in one factor direction.
    Each connected component over that factor’s smooth locus extends by normalization to a connected normal finite
    quasi-étale cover of the factor. The omitted set has codimension at least two,
    since a divisorial point of a finite cover lies over a divisorial, hence smooth, point of the normal factor.
    The ambient cover is étale on this open slice, so restricted entries are regular and extend reflexively across
    its complement. On the slice its tangent directions are $cal(E)_i$, while complementary summands are trivial.
    An entry in either direction involving a nonabelian boundary-free factor therefore gives reflexive one-forms
    or vector fields on its cover, and these vanish by Input 19.
    For the only remaining case, an abelian and a rationally connected factor,
    slice in the rationally connected direction. An entry towards the abelian summand gives one-forms;
    an entry in the reverse direction gives vector fields tangent to the boundary:
    that boundary is pulled back from the rationally connected factor,
    so the ideal-preservation condition restricts at every divisorial point of the slice. These vanish as well.
    The slices cover a dense open of $R$, proving the assertion.
  Consequently every block projection is a central idempotent of $cal(A)$.
    The primitive central idempotents give nonzero direct summands of the rank-$n$ tangent sheaf,
    so there are at most $n$ of them. Conjugation by $g$ permutes these idempotents. Therefore
  $ h = g^(n !) $
  fixes every primitive central idempotent. Every central idempotent is a sum of primitive central idempotents,
    so $h$ fixes every block projection and preserves each factor direction.
  #emph[Recovering the factor fields.] Let $K_i$ be the relative algebraic closure of $bb(C) \( P_i \)$ in
    $bb(C) \( R \)$, and let $R_i$ be the normalization of $P_i$ in $K_i$.
    Equivalently, $R arrow.r R_i arrow.r P_i$ is the Stein factorization of the projection.
    At the generic point of $R$, the directions complementary to $i$ span $"Der"_(bb(C) \( P_i \)) bb(C) \( R \)$.
    In characteristic zero their common field of constants is exactly $K_i$.
    Preservation of these directions thus gives a birational self-map $h_i$ of $R_i$.
  The map $psi : R arrow.r product_i R_i$ is proper and has finite fibres, because its composite to $P$ is finite.
    It is finite and, by dimension, surjective. The maps $R_i arrow.r P_i$ are quasi-étale.
    Indeed, since $bb(C) \( P \) \/ bb(C) \( P_i \)$ is a regular extension, the product $R_i times
    product_(j eq.not i) P_j$ is an intermediate normal finite cover of $P$.
    Ramification over a prime of $P_i$ would persist in this product and then in a prolongation to $R$,
    contradicting quasi-étaleness of $R arrow.r P$. The same ramification calculation in the tower proves that
    $psi$ is quasi-étale. In particular the pulled-back pairs $\( R_i \, H_i \)$ are klt.
    The relation between $h$ and the $h_i$ is rational equivariance of $psi$;
    no regularity assertion about the $h_i$ is needed.
  #emph[Comparing the forms.] On each boundary-free $R_i$, choose a generator $theta_i$ of its trivial canonical
    sheaf. For the rationally connected factor, restrict the degree-$m$ trivialization pulled back from $V$ to
    that factor of $P$, using smooth complementary points and the external product of canonical lines.
    The resulting form has divisor $- m H$ on that factor; pull it back to $R_i$.
    This constructs the forms of degree $p_i$ in the statement. Their product, in any fixed order, satisfies
  #[#set math.equation(numbering: n => "(6.2)")
   $ theta_R = a thin psi^(*) (and.big_i theta_i^(⊗ m \/ p_i)) wide \( a in bb(C)^(*) \) . $ <char:form-product>]
  Here the wedge denotes external product of pluricanonical lines.
    Indeed both sides have divisor $- m H_R$, so their ratio is a global unit on the normal projective integral
    variety $R$.
  Write $u_i = h_i^(*) theta_i \/ theta_i in bb(C) \( R_i \)^(*)$.
    Pulling (6.2) back by $h$ shows that the pullback of $product_i u_i^(m \/ p_i)$ is the constant $c^(n !)$.
    Since $psi$ is dominant, the product is constant on $product_i R_i$.
    Fixing general points in all complementary factors shows that every $u_i^(m \/ p_i)$, and hence every $u_i$,
    is constant. Denote it by $d_i$. This proves (6.1); proportionality of the forms proves that each $h_i$ is
    B-birational. ◻
]

We have reduced the character on $V$ to characters on finite covers of the individual factors.
  Their dimensions are at most $n$, and the integer $m$ has not changed.
  We next bound these factor characters, using bounded families on the rationally connected factor and the rank
  bound on the other nonabelian factors.

=== 6.3 Characters on the factors <characters-on-the-factors>

#thm([Lemma 6.5.])[
  (Rationally connected factors).  #emph[For $r \, m gt.eq 1$ there is an integer
    $E_(upright("rc")) \( r \, m \) > 0$ that kills the degree-$m$ B-birational character of every integral
    projective rationally connected klt pair $\( F \, H \)$ of dimension $r$ with $H gt.eq
    0$ and $m \( K_F + H \) tilde.op 0$ integral principal.]
] <char:rc-bound>

#proof[
  By #cite(label("HanJiang"), form: "prose") Theorem 1.2, the underlying varieties are bounded modulo flops:
    they are isomorphic in codimension one to normal members $Y$ of a bounded family.
    The theorem applies because $- m \( K_F + H \)$ is Cartier and nef.
    In dimension one one can instead use $F tilde.eq bb(P)^1$ directly.
  Let $B_Y$ be the strict transform of $H$. A degree-$m$ log trivializing form has divisor $- m B_Y$ on $Y$,
    by the codimension-one identification. Thus $m \( K_Y + B_Y \) tilde.op 0$ is integral principal,
    and the map is B-birational by the form criterion. In particular the transformed pair is klt.
    Choose very ample divisors $A$ in bounded projective embeddings of these $Y$, with $A^r$ uniformly bounded.
    Since $m B_Y$ is integral,
  #[#set math.equation(numbering: n => "(6.3)")
   $ \( "Supp" B_Y \) A^(r - 1) lt.eq m B_Y A^(r - 1) = - m K_Y A^(r - 1) lt.eq
     m #scale(x: 120%, y: 120%)[\(] 2 + \( r - 1 \) A^r #scale(x: 120%, y: 120%)[\)] . $ <char:boundary-degree>]
  For the last inequality, take a general complete-intersection curve of $r - 1$ members of $\| A \|$.
    It is smooth and avoids the singular locus of the normal variety $Y$, and adjunction gives $- K_Y A^(r - 1) =
    2 - 2 g + \( r - 1 \) A^r$.
  Reduced subvarieties of bounded degree in bounded projective embeddings form a bounded family.
    Moreover, the nonzero coefficients of $B_Y$ lie in ${ 1 \/ m \, dots.h \, \( m - 1 \) \/ m }$,
    since the pair is klt. Thus the pairs are log bounded modulo B-birational contractions.
    (A birational map that is an isomorphism in codimension one is a birational contraction in this terminology.)
  #cite(label("JiangLiu"), form: "prose") Theorem 3.2, which applies in every dimension, now gives integers $k \,
    N > 0$ depending only on $r \, m$ such that $k \( K_F + H \) tilde.op
    0$ and the image of the degree-$k$ B-representation has order at most $N$.
    If a map acts by $d$ on a degree-$m$ generator and by $e$ on a degree-$k$ generator,
    then comparison in degree $k m$ gives $d^k = e^m$. Since $e^(N !) = 1$, we obtain $d^(k N !) = 1$.
    We may take $E_(upright("rc")) \( r \, m \) = k N !$. ◻
]

#thm([Lemma 6.6.])[
  (Boundary-free factors).  #emph[For each $r gt.eq 1$ there is an integer $E_0 \( r \) >
    0$ with the following property. Let $Y$ be a connected normal finite quasi-étale cover of an $r$-dimensional
    abelian, irreducible Calabi–Yau, or irreducible holomorphic symplectic factor of Input 19.
    Every birational self-map of $Y$ acts on its canonical volume form by a scalar killed by $E_0 \( r \)$.]
] <char:hodge-bound>

#proof[
  Let $U$ be a smooth projective resolution of $Y$. The canonical singularities and trivial canonical class give
    $h^(r \, 0) \( U \) = 1$. For a nonabelian factor, #cite(label("UPI"), form: "prose") Lemma 5.2 shows that
    $q \( U \) = 0$ and that every positive-dimensional rational image of smaller dimension has rationally
    connected smooth resolution. Its hypotheses hold for $Y$ itself, using the identity cover,
    because the defining form-algebra properties persist under all further connected normal finite quasi-étale
    covers. Take a crepant projective $bb(Q)$-factorial terminalization of $Y$.
    It still has principal canonical divisor, and the two properties just stated are birational invariants.
    Theorem 9 therefore bounds $dim_(bb(Q)) T \( U \)$ in terms of $r$.
    Nonabelian factors here have dimension at least two. For an abelian factor, take $U = Y$ and use instead
  $ dim_(bb(Q)) T \( U \) lt.eq dim_(bb(Q)) H^r \( U \, bb(Q) \) = binom(2 r, r) . $
  Thus there is a common dimension bound $b \( r \)$ in either case.
  Let $p \, q : W arrow.r U$ be a smooth projective common resolution of the induced birational self-map of $U$.
    By Lemma 6, birational invariance of the Hodge structure generated by the top form gives
  $ T \( W \) = p^(*) T \( U \) = q^(*) T \( U \) . $
  Consequently $A = p_(*) q^(*)$ preserves $T \( U \)$ and the cup-product pairing there;
    its inverse is $q_(*) p^(*)$. Pullback and pushforward are integral on cohomology modulo torsion,
    so $A$ preserves the full lattice
  $ T \( U \) ∩ #scale(x: 120%, y: 120%)[\(] H^r \( U \, bb(Z) \) \/ upright("torsion") #scale(x: 120%, y: 120%)[\)] . $
  Moreover, $T \( U \)$ is primitive for every rational ample class:
    the kernel of cup product by that class is a rational Hodge substructure containing $H^(r \, 0) \( U \)$.
    The Hodge–Riemann relations therefore turn the cup pairing and Hodge decomposition on $T \( U \)$ into a
    positive-definite Hermitian form, preserved by $A$.
  The scalar $d$ on the canonical volume form is an eigenvalue of this integral operator.
    It is an algebraic integer, and all its conjugates occur among the eigenvalues of $A$, hence have modulus one.
    Kronecker’s theorem makes $d$ a root of unity. If its order is $e$,
    the degree of its cyclotomic polynomial is Euler’s totient $phi \( e \)$, so
  $ phi \( e \) lt.eq b \( r \) . $
  There are only finitely many positive integers with this property.
    Their least common multiple is a permissible choice of $E_0 \( r \)$. ◻
]

#proof[
  For $n = 0$ the pair is a point and the character is trivial, so take $L \( 0 \, m \) = 1$. Suppose $n > 0$.
    Lemmas 18 and 20 express $c^(n !)$ as in (6.1). The rationally connected factor satisfies the hypotheses of
    Lemma 21; in particular it remains rationally connected by the cover-stable choice in Input 19.
    Every other factor satisfies Lemma 22. Define
  $ E \( n \, m \) = "lcm"_(1 lt.eq r lt.eq n) { E_(upright("rc")) \( r \, m \) \, E_0 \( r \) } \, wide
    L \( n \, m \) = n ! E \( n \, m \) . $
  Each $d_i^(E \( n \, m \)) = 1$, and (6.1) gives $c^(L \( n \, m \)) = 1$.
    Every bound depends only on the factor dimensions and $m$, and therefore only on $n \, m$. ◻
]

== 7 Residues and descent across the conductor <sec:residues>

The normal index theorem gives a uniformly bounded trivializing degree on each component of the normalization.
  The remaining question is whether these trivializations can be chosen compatibly along the conductor.
  We will express each obstruction around a conductor cycle as the character of a birational self-map of a single
  klt pair. Theorem 17 then kills every obstruction with the same exponent,
  independently of the number of components and the length of the cycle.
  This follows the established reduction from normal indices and bounded pluricanonical representations to slc
  indices #cite(label("Xu2019")) Theorem 1.11. We give the residue comparison explicitly,
  using Kollár’s compatibility theorem inside each normalization component and keeping the degree fixed throughout.

We first work over $bb(C)$. Throughout this section $m$ is a positive even integer.
  For a dlt pair $\( Y \, Gamma \)$, a #emph[stratum] means $Y$ itself or an lc centre.
  A minimal stratum is minimal for inclusion; thus it is $Y$ if the pair is klt.
  Dlt strata are normal, iterated adjunction gives effective dlt pairs $\( W \, Gamma_W \)$ on them,
  and the strata of $\( W \, Gamma_W \)$ are exactly the strata of $\( Y \, Gamma \)$ contained in $W$.
  In particular, minimal strata are klt; see #cite(label("Kollar2013")) Chapter 4 and
  #cite(label("KollarSources")) Definition 4.

=== 7.1 Residues in a fixed degree <residues-in-a-fixed-degree>

Suppose that $\( Y \, Gamma \)$ is a projective integral dlt pair and that a rational $m$-canonical form $theta$
  satisfies

#[#set math.equation(numbering: n => "(7.1)")
 $ "Div" \( theta \) = - m Gamma . $ <res:form>]

At the generic point of a codimension-$k$ stratum $W$, the pair is simple normal crossing.
  In local coordinates in which the coefficient-one components through $W$ are $x_1 dots.h.c x_k = 0$, write

$ theta = f (frac(d x_1, x_1) and dots.h.c and frac(d x_k, x_k) and d y_1 and dots.h.c and d y_(dim W))^(⊗ m) . $

Here $f$ is a unit at the generic point of $W$. Its logarithmic residue is the rational $m$-canonical form

$ theta_W = f \|_W thin \( d y_1 and dots.h.c and d y_(dim W) \)^(⊗ m) . $

The usual residue transformation rule makes this definition independent of the coordinates.
  Reordering the normal coordinates changes an ordinary residue by a sign, which disappears because $m$ is even.
  Consequently residues along flags agree with direct iterated residues. For $W = Y$, set $theta_W = theta$.

These forms satisfy the actual degree-$m$ identity

#[#set math.equation(numbering: n => "(7.2)")
 $ "Div" \( theta_W \) = - m Gamma_W \, wide m \( K_W + Gamma_W \) tilde.op 0 . $ <res:adjunction>]

Indeed, pluricanonical adjunction with the different gives this identity for $theta_W^(⊗ b)$ when $b$ is
  sufficiently divisible #cite(label("KollarSources")) Definition 13.
  The generic residue construction commutes with tensor powers,
  so division of that divisor identity by $b$ gives (7.2). In particular, $m Gamma_W$ is integral.
  No enlargement of $m$ depending on the stratum is required.

#thm([Lemma 7.1.])[
  (Comparison within a dlt pair).  #emph[Let $\( Y \, Gamma \)$ and $theta$ satisfy (7.1).
    For any two minimal strata $A \, A'$, there is a B-birational map $phi.alt : \( A \, Gamma_A \)
    arrow.r.dashed \( A' \, Gamma_(A') \)$ such that
$ phi.alt^(*) theta_(A') = theta_A . $

]
] <res:within>

#proof[
  There is nothing to prove if the pair is klt. Otherwise apply #cite(label("KollarSources"), form: "prose")
    Proposition 14 to the morphism $Y arrow.r "Spec" bb(C)$. Its hypotheses hold in degree $m$:
    the pair is dlt, its log canonical divisor is rationally trivial,
    and $omega_Y^(\[ m \]) \( m Gamma \) tilde.eq cal(O)_Y$. That proposition provides a birational comparison
    commuting exactly with the degree-$m$ residue maps, and hence the displayed identity.
    The divisor identities (7.2) imply B-birationality.
  The exact equality, rather than proportionality, can also be seen in the proof of that proposition.
    The minimal centres are joined by $bb(P)^1$-links #cite(label("KollarSources")) Theorem 10.
    Over the function field of a link’s base, the two sections are $0 \, oo$ on $bb(P)^1$,
    and the logarithmic form is a base form times $\( d z \/ z \)^(⊗ m)$.
    Its residues at the two sections agree for even $m$. Composition along the links preserves this equality. ◻
]

We also need a comparison between two different dlt pairs.
  A crepant birational map need not be defined along a chosen minimal stratum,
  so ordinary restriction of that map is insufficient. The following argument constructs appropriate strata on a
  common resolution and checks that passage to them introduces no additional scalar.

#thm([Lemma 7.2.])[
  (Comparison across a birational map).  #emph[Let $\( S \, Delta_S \)$ and $\( T \, Delta_T \)$ be projective
    integral dlt pairs of the same dimension, with rational $m$-canonical forms satisfying
$ "Div" \( theta_S \) = - m Delta_S \, wide "Div" \( theta_T \) = - m Delta_T . $

 Suppose $tau : S arrow.r.dashed T$ is birational and $tau^(*) theta_T = r theta_S$ for $r in bb(C)^(*)$.
   Then there are minimal strata $A subset S$ and $A' subset T$ and a B-birational map $psi : \( A \, Delta_A \)
   arrow.r.dashed \( A' \, Delta_(A') \)$ such that
#[#set math.equation(numbering: n => "(7.3)")
 $ psi^(*) theta_(A') = r theta_A . $ <res:across-identity>]

]
] <res:across>

#proof[
  The form identity makes $tau$ B-birational. If one pair is klt, both are klt, and we take $A = S$, $A' = T$,
    and $psi = tau$. Suppose therefore that there are proper lc centres.
    Put $n = dim S$ and let $k > 0$ be the largest codimension of an lc centre of $S$. Choose such a centre $A$.
  #emph[Corresponding strata on a common resolution.] Take a projective log resolution of $S$ which is unchanged
    over the simple-normal-crossing neighbourhood of the generic point of $A$ #cite(label("Szabo1994")) Resolution
    Lemma, p. 633. Resolve the map to $T$ and its boundary, using smooth blowup centres having normal crossings
    with the accumulated boundary #cite(label("KollarSeattle2007")) Definition 25 and Theorem 35.
    This gives a common smooth model $p : W arrow.r S$, $q : W arrow.r T$. Write
  $ K_W + Delta_W = p^(*) \( K_S + Delta_S \) = q^(*) \( K_T + Delta_T \) \, $
  with compatible canonical divisors. The subboundary $Delta_W$ need not be effective,
    but its total support is simple normal crossing.
  There is a codimension-$k$ component $Z$ of an intersection of $k$ coefficient-one divisors of $Delta_W$
    dominating $A$. To verify this during the chosen blowups, start with $A$ on the initial snc open.
    A blowup whose centre misses the generic point of the currently chosen intersection leaves that intersection
    unchanged there. If its centre contains that generic point,
    the centre is locally defined by a subset of the $k$ boundary parameters:
    any additional tangential equation would cut the intersection properly and so could not contain its generic
    point. For a nontrivial such blowup, the subset has size $h gt.eq
    2$ and the exceptional divisor has coefficient $h - \( h - 1 \) = 1$; in each relevant coordinate chart,
    the exceptional divisor and the surviving strict transforms again have a codimension-$k$ intersection
    dominating the old one. This proves the assertion inductively.
    In making the resolution, include the full total transforms of both boundaries among the normal-crossing
    divisors, including exceptional components of crepant coefficient zero.
  Let $C = q \( Z \)$. The intersection $Z$ determines an lc place:
    for $k = 1$ it is itself a coefficient-one divisor, and for $k > 1$ blow up its generic intersection.
    Hence $C$ is an lc centre of $T$. Since $dim C lt.eq dim Z = n - k$, its codimension is at least $k$.
    Repeating the same construction with $S \, T$ interchanged shows that the largest codimensions of their lc
    centres agree. It follows that $"codim"_T C = k$, and both $A$ and $C$ are minimal strata.
    In particular $Z arrow.r A$ and $Z arrow.r C$ are generically finite.
  #emph[Birationality and the exact residue comparison.] We claim that these two maps are birational and that
    pullback through either one commutes exactly with the degree-$m$ residue. We prove this for $q$.
    At the generic points of $C$ and $Z$, choose regular parameters $x_1 \, dots.h \, x_k$ and $z_1 \, dots.h \,
    z_k$ for the respective coefficient-one divisors, completed by separating coordinates $y_1 \, dots.h \,
    y_(n - k)$ and $w_1 \, dots.h \, w_(n - k)$ along the strata. The total transforms have normal crossings, so
  #[#set math.equation(numbering: n => "(7.4)")
   $ q^(*) x_i = u_i product_(j = 1)^k z_j^(e_(i j)) \, wide u_i in cal(O)_(W \, eta_Z)^(*) \, quad
     e_(i j) in bb(Z)_(gt.eq 0) . $ <res:monomial>]
  In these coordinates the logarithmic Jacobian is the matrix expressing $q^(*) \( d x_i \/ x_i \) \,
    q^(*) d y_l$ in terms of $d z_j \/ z_j \, d w_l$. Its determinant is a unit at $eta_Z$:
    the pullback of $theta_T$ has exactly the logarithmic poles prescribed by the coefficient-one components
    through $Z$, and no other zero or pole there. Modulo the ideal of $Z$, the matrix has the form
  $ mat(delim: "(", E, *; 0, J_C) \, wide E = \( e_(i j) \) \, $
  where $J_C$ is the Jacobian along $Z arrow.r C$. In particular $det E eq.not 0$.
  We now use birationality of the ambient map to strengthen this to
  #[#set math.equation(numbering: n => "(7.5)")
   $ \| det E \| = 1 \, wide bb(C) \( Z \) = bb(C) \( C \) . $ <res:unimodular>]
  Choose positive real numbers $alpha_1 \, dots.h \, alpha_k$ linearly independent over $bb(Q)$,
    and take the monomial valuation at $eta_Z$ assigning $z_j$ the value $alpha_j$.
    It can be constructed in the completed regular local ring and restricted to $bb(C) \( W \)$.
    Its value group is $sum_j bb(Z) alpha_j$, and its residue field is $bb(C) \( Z \)$.
  Here is the local calculation that also identifies this valuation from the target.
    If a real valuation $v$ is centred on a regular local ring $R$ with parameters $t_1 \, dots.h \, t_k$,
    and their positive values are $bb(Q)$-linearly independent, then
  #[#set math.equation(numbering: n => "(7.6)")
   $ v #scale(x: 120%, y: 120%)[\(] \( "Frac" R \)^(*) #scale(x: 120%, y: 120%)[\)] = sum_i bb(Z) v \( t_i \) \,
     wide kappa \( v \) = kappa \( R \) . $ <res:valuation-fact>]
  To check the assertions, expand any nonzero $f in R$ modulo $frak(m)_R^N$ as a polynomial in the $t_i$,
    with coefficients lifting residue classes. Nonzero coefficients have value zero,
    distinct monomials have distinct values, and the remainder has value at least $N min_i v \( t_i \)$.
    Taking $N$ so large that this exceeds $v \( f \)$ gives a unique term of least value.
    Thus $v \( f \)$ is an integral combination of the parameter values.
    For a quotient of two elements of equal value, independence forces their least terms to have the same exponent
    vector, so its residue is the ratio of their coefficients in $kappa \( R \)$.
    Residue classes already have lifts in $R$, proving the reverse inclusion as well.
  By (7.4), the values of the $x_i$ are the rows of $E$ applied to $\( alpha_j \)$;
    they are positive and independent. Apply (7.6) to $cal(O)_(T \, eta_C)$.
    Since $q$ is birational, its fraction field and that of $cal(O)_(W \, eta_Z)$ are the same.
    The value groups and residue fields computed in the two rings must therefore agree.
    Equality of the value groups says that $E$ is unimodular,
    while equality of the residue fields gives $bb(C) \( Z \) = bb(C) \( C \)$. This proves (7.5).
  Taking the logarithmic residue of $q^(*) theta_T$ along $Z$ now gives the pullback of $theta_C$ multiplied by
    $\( det E \)^m = 1$. The tangential Jacobian $J_C$ is precisely the one appearing in pullback of the stratum
    form. The identical argument for $p$ compares the residue along $Z$ with $theta_A$ and proves that $Z arrow.r
    A$ is birational. The equality $q^(*) theta_T = r p^(*) theta_S$ therefore gives (7.3), with $A' =
    C$ and the birational map induced through $Z$. Finally (7.2) shows that this map is B-birational. ◻
]

=== 7.2 The local descent rule at a node <the-local-descent-rule-at-a-node>

Let $xi$ be a codimension-one point of a demi-normal variety at which it is not normal.
  After a faithfully flat extension splitting the node and completion, its local ring has the form

$ A = F \[ \[ x \, y \] \] \/ \( x y \) \, wide macron(A) = F \[ \[ x \] \] xor F \[ \[ y \] \] \, $

where $F$ is the residue field after that extension. The image of $A$ in $macron(A)$ consists of the pairs with
  the same constant term. A canonical generator has branch expressions

#[#set math.equation(numbering: n => "(7.7)")
 $ (frac(d x, x) \, - frac(d y, y)) and eta \, $ <res:node-generator>]

where $eta$ is a nonzero top differential in the tangential directions.
  One obtains this calculation for absolute canonical forms by first lifting a separating transcendence basis of
  the node’s residue field and performing the nodal curve calculation over the resulting function field.

Thus the branch residues of a degree-$a$ canonical generator differ by $\( - 1 \)^a$.
  Conversely, if two branch forms are generators and their residues satisfy this rule,
  divide them by the branches of (7.7) to the power $a$. The resulting branch units have matching nonzero constant
  terms. They form a unit of $A$, so the forms come from a generator at the node.
  Faithfully flat descent gives the same criterion before splitting or completion.
  For a nonsplit node the two residues are compared by the nontrivial automorphism of its quadratic branch-field
  extension. A boundary whose support avoids $xi$ does not change this calculation.

=== 7.3 Uniform trivialization on the demi-normal pair <uniform-trivialization-on-the-demi-normal-pair>

#proof[
  First let the ground field be $bb(C)$. Write $D = K_X + B$ and let $nu : macron(X) arrow.r
    X$ be the normalization, with conductor divisor $macron(C)$. The normalization formula is
  $ nu^(*) D = K_(macron(X)) + macron(C) + nu_(*)^(- 1) B . $
  Denote its component pairs by $\( X_i \, Delta_i \)$, $i in I$.
    They are projective integral lc $d$-folds with effective boundary coefficients in $Phi union {
    1 }$ and $K_(X_i) + Delta_i tilde.op_(bb(Q)) 0$. By Theorem 3,
    there is a common principal multiple depending only on $d \, Phi$.
    Choose an even multiple $m = m \( d \, Phi \)$ which also clears the coefficients of $Phi$.
    Fix rational $m$-canonical forms $theta_i$ with
  $ "Div" \( theta_i \) = - m Delta_i . $
  Choose projective crepant $bb(Q)$-factorial dlt modifications $\( Y_i \, Gamma_i \)
    arrow.r \( X_i \, Delta_i \)$ #cite(label("KollarSources")) Proposition 5.
    Use the same notation for the pulled-back forms, whose divisors are $- m Gamma_i$.
  Form a finite graph with vertices $I$ and one edge for each generic point of the double locus of $X$.
    At a split node its two branches give conductor components on the normalization, possibly on the same $X_i$.
    Their strict transforms are strata $S subset Y_i$, $T subset Y_j$,
    and the identification of the branch function fields gives a birational map $tau : S arrow.r.dashed T$.
    At a nonsplit node there is one conductor component with a quadratic function-field extension over the node;
    use it twice and take $tau$ to be the nontrivial involution. This gives a loop at the corresponding vertex.
    The graph may have multiple edges and loops. We can treat its connected components separately.
  The assumed rational linear triviality of $D$ supplies a principal Cartier multiple $M D$,
    with $M$ divisible by $m$. A generator in degree $M$ pulls back to $b_i theta_i^(⊗ M \/ m)$ for constants $b_i
    in bb(C)^(*)$: on each projective normal component the ratio has zero divisor.
    Its branch residues satisfy the node rule. Since $M$ is even, for an oriented edge $e : i arrow.r j$ this gives
  $ (frac(tau^(*) theta_T, theta_S))^(M \/ m) = b_i / b_j . $
  The ratio is therefore a nonzero constant in the conductor function field. Write
  #[#set math.equation(numbering: n => "(7.8)")
   $ tau^(*) theta_T = r_e theta_S \, wide r_e in bb(C)^(*) \, wide r_(macron(e)) = r_e^(- 1) . $ <res:edge>]
  In particular the induced map of the two adjoint pairs is B-birational.
    The integer $M$ is used only to establish these constant comparisons; it will not enter the uniform bound.
  For each oriented edge, Lemma 24 supplies minimal strata on its two branches and a birational comparison with
    multiplier $r_e$. By adjunction these strata are also minimal strata of the corresponding $Y_i$.
    Along any closed walk in the graph, join successive choices within a vertex by Lemma 23.
    These intermediate maps have multiplier one. Composing all comparisons gives a B-birational self-map $f$ of
    one projective integral klt pair $\( A \, Gamma_A \)$, with
  #[#set math.equation(numbering: n => "(7.9)")
   $ f^(*) theta_A = (product_(e upright(" in the walk")) r_e) theta_A . $ <res:cycle>]
  The product respects the orientations of the walk. Moreover $dim A lt.eq d -
    1$ and $m \( K_A + Gamma_A \) tilde.op 0$ by (7.2). Figure 1 displays the composition for a three-edge cycle.
    The same argument includes loops, including the involution at a nonsplit node.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.6912, -0.672), (0.6912, 2.16), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 4pt)
  rect((2.16, 0.9792), (6.451, 2.16), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 4pt)
  rect((2.16, -0.672), (6.451, 0.4608), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 4pt)
  content((-0.9984, 0.7488), [#text(size: 9pt)[$Y_1$]])
  content((4.301, 2.4), [#text(size: 9pt)[$Y_2$]])
  content((4.301, -0.912), [#text(size: 9pt)[$Y_3$]])
  content((0, 1.584), [#text(size: 9pt)[$A_1^+$]])
  content((2.88, 1.584), [#text(size: 9pt)[$A_2^-$]])
  content((5.76, 1.584), [#text(size: 9pt)[$A_2^+$]])
  content((5.76, -0.096), [#text(size: 9pt)[$A_3^-$]])
  content((2.88, -0.096), [#text(size: 9pt)[$A_3^+$]])
  content((0, -0.096), [#text(size: 9pt)[$A_1^-$]])
  line((0.3866, 1.584), (2.493, 1.584), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.44, 1.584), [#text(size: 9pt)[$r_(e_1)$]], anchor: "south", padding: 0.1176cm)
  line((3.267, 1.584), (5.373, 1.584), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.32, 1.584), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  line((5.76, 1.295), (5.76, 0.1933), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.76, 0.744), [#text(size: 9pt)[$r_(e_2)$]], anchor: "west", padding: 0.1176cm)
  line((5.373, -0.096), (3.267, -0.096), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.32, -0.096), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  line((2.493, -0.096), (0.3866, -0.096), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.44, -0.096), [#text(size: 9pt)[$r_(e_3)$]], anchor: "south", padding: 0.1176cm)
  line((0, 0.1933), (0, 1.295), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.744), [#text(size: 9pt)[$1$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: A conductor cycle represented by birational maps between minimal strata. Each dashed box groups two choices inside one dlt component; it does not depict geometric intersections. The arrows are birational comparisons, labelled by their pullback multipliers. Their composition acts on $A_1^(+)$ with multiplier $r_(e_1) r_(e_2) r_(e_3)$. ],
  ) <res:figure>
  Choose
  #[#set math.equation(numbering: n => "(7.10)")
   $ L = "lcm" { L \( q \, m \) : 0 lt.eq q lt.eq d - 1 } \, wide a = m L \, $ <res:uniform-exponent>]
  where $L \( q \, m \)$ is given by Theorem 17. Applying that theorem to (7.9) shows that the product of $r_e^L$
    around every closed walk is one. Consequently there are constants $c_i in bb(C)^(*)$ satisfying
  #[#set math.equation(numbering: n => "(7.11)")
   $ c_i = c_j r_e^L quad upright("for every oriented edge ") e : i arrow.r j . $ <res:scales>]
  For completeness, choose a spanning tree in each connected component, set $c_i = 1$ at one vertex,
    and determine the other constants along its tree paths. Every additional edge is consistent because it closes
    a walk with product one. A loop imposes precisely $r_e^L = 1$, already proved.
  The forms $c_i theta_i^(⊗ L)$ now have equal residues on every pair of conductor branches.
    Regard their tuple as a rational $a$-canonical form $sigma$ on $X$:
    it is an element of the product of the degree-$a$ canonical lines of the component function fields,
    a rank-one module over the total quotient ring $product_i bb(C) \( X_i \)$.
    At every normal codimension-one point, its divisor says that it generates the line corresponding to $a D$.
    At each generic node, its branches are generators and have matching residues,
    so the local rule (7.7) makes it a generator there as well; $a$ is even and $B$ avoids those points.
  We explain why this proves Cartierness, rather than only triviality after normalization.
    Choose a big open immersion $j : U arrow.r.hook X$ containing all codimension-one points,
    such that $X$ is Gorenstein on $U$, $a B$ is Cartier on $U$,
    and the preceding local comparisons make $sigma$ a generator of
  $ cal(L)_(a \, U) = omega_U^(⊗ a) \( a B \|_U \) . $
  The divisorial sheaf associated with $a D$ is its $S_2$ extension $cal(F)_a = j_(*) cal(L)_(a \, U)$.
    The generator identifies this sheaf with $j_(*) cal(O)_U = cal(O)_X$, the last equality following from $S_2$.
    Hence $cal(F)_a$ is invertible. Equivalently, divide $sigma$ by the $a$th power of a rational canonical form,
    chosen to generate at the generic nodes. The ratio is an invertible element of the total quotient ring whose
    principal divisor is $- a D$ on $U$ and therefore on $X$. Thus $a D$ is principal Cartier.
    Isolated vertices of the conductor graph cause no difficulty:
    their chosen forms already satisfy the required condition.
  Finally let the ground field $k$ be any algebraically closed field of characteristic zero.
    All the data descend to an algebraically closed subfield $k_0 subset
    k$ of finite transcendence degree over $bb(Q)$, including the normalization, conductor,
    a principal Cartier multiple of $D$, and a log resolution of the normalized pair.
    The field $k_0$ embeds in $bb(C)$. The hypotheses persist under these algebraically closed field extensions:
    $S_2$ and the smooth or nodal codimension-one charts are preserved,
    normalization and conductor commute with them, and the coefficients on the chosen log resolution test log
    canonicity after extension. We therefore obtain the degree-$a$ conclusion over $bb(C)$ with the same integer (7.10).
  On a fixed big Gorenstein open over $k_0$, form $cal(F)_a$ as above.
    The open immersion is quasi-compact and separated, since $X$ is noetherian.
    Flat base change for quasi-coherent sheaves therefore shows that this extension by $j_(*)$ commutes with field
    extension, so its pullback to $bb(C)$ is trivial. Invertibility descends faithfully flatly.
    For the resulting line bundle, proper cohomology and field extension identify its space of global sections
    after extension with $H^0 \( X_(bb(C)) \, cal(O)_(X_(bb(C))) \) = bb(C)$.
    Its one-dimensional space over $k_0$ therefore has a nonzero section whose evaluation becomes an isomorphism
    over $bb(C)$ and hence is already an isomorphism over $k_0$.
    Thus $cal(F)_a tilde.eq cal(O)$ over $k_0$, and extending to $k$ proves the theorem. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
