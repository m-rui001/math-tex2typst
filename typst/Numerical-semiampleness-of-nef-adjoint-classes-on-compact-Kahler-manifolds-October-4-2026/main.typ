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

#align(center)[#text(size: 16pt, weight: "bold")[Numerical semiampleness of nef adjoint classes \
on compact Kähler manifolds]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

A central aim of abundance theory is to recover a holomorphic map from the positivity of an adjoint class.
  For an ordinary log canonical line, the expected conclusion is semiampleness of that line itself.
  Adding an arbitrary nef line introduces a different phenomenon: its flat part need not be torsion.
  The natural conclusion is then numerical semiampleness, namely the existence of a semiample line with the same
  real Chern class.

We prove this statement for smooth compact Kähler manifolds with a klt boundary.
  A #emph[rational line bundle] is an element of $"Pic" \( X \) ⊗_(bb(Z)) bb(Q)$.
  It is nef when its first Chern class belongs to the closure of the Kähler cone,
  and pseudo-effective when that class contains a closed positive $\( 1 \, 1 \)$-current.
  It is semiample when a positive integral multiple is a holomorphic line bundle generated everywhere by global
  sections.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a smooth connected compact Kähler manifold, let $B gt.eq
    0$ be a rational simple normal crossing divisor whose coefficients are strictly less than one,
    and let $M in "Pic" \( X \) ⊗_(bb(Z)) bb(Q)$. Assume that $K_X + B$ is pseudo-effective, $M$ is nef, and $D =
    K_X + B + M$ is nef. Then there is a semiample rational line bundle $L$ on $X$ such that
$ c_1 \( L \) = c_1 \( D \) quad upright("in ") H_(upright("BC"))^(1 \, 1) \( X \, bb(R) \) . $

]
] <thm:main>

The numerical formulation is essential even on an elliptic curve:
  a nontorsion degree-zero line $M$ is nef but has no section in any positive power,
  whereas its Chern class is represented by the trivial line. Theorem 1 allows exactly this change of flat part.
  It keeps the nef line $M$ on the original manifold; it is not a statement about an arbitrary nef b-divisor on a
  higher model.

=== 1.1 Context and the inputs to the proof <context-and-the-inputs-to-the-proof>

Lazić and Peternell formulated generalized abundance for projective klt pairs as precisely this numerical
  semiampleness problem #cite(label("LP1")) Generalised Abundance Conjecture.
  Their work relates it to ordinary abundance and to positivity on varieties with numerically trivial canonical
  class, using nef reduction and the positive part of the divisorial Zariski decomposition #cite(label("LP1"))
  #cite(label("LP2")). They proved the surface case and the threefold case in which the ordinary adjoint has
  positive numerical dimension #cite(label("LP1")) Corollaries C and D.
  The present proof uses the projective positive-part theorem of #cite(label("P")) Proposition 8.1 as an input.
  Our task is to pass from that projective statement to the analytic setting,
  where the nef summand need not be represented by a divisor and a manifold may have no nonconstant meromorphic
  functions.

The compact Kähler minimal model program has developed alongside these abundance questions.
  Höring and Peternell constructed minimal models for compact Kähler threefolds
  #cite(label("HoeringPeternell2016")). The threefold abundance results and their corrections
  #cite(label("CHP2016")) #cite(label("CHP2023")), and the log abundance theorem of Das and Ou
  #cite(label("DasOu2024")) #cite(label("DasOu2026")), establish important cases of the ordinary problem.
  Hacon and Xie’s analytic cone theorem #cite(label("HX")) supplies the rational curve length bound.
  The restricted Kähler model constructions and ordinary scaling in #cite(label("K")) Section 3 supply the
  detected projective steps used here. For ordinary adjoints in arbitrary dimension,
  we use that paper’s divisorial decomposition theorem, with its logarithmic Iitaka hypothesis supplied by
  #cite(label("LI")).

These are substantial inputs. Section 2 states their precise forms,
  retaining the distinction between actual rational line identities and equalities of real classes.
  The proof below supplies the further arguments needed for the nef summand.
  It uses Boucksom’s analytic divisorial decomposition #cite(label("Boucksom2004")),
  the compactness theory of cycle spaces #cite(label("Barlet")) #cite(label("LiebermanCycles"))
  #cite(label("Fujiki")), and the geometry of compact Kähler spaces of algebraic dimension zero
  #cite(label("COP")) #cite(label("BBYv2")) #cite(label("Ou")).
  The adjoint construction on a projective base follows the discriminant and moduli-line strategy of Ambro
  #cite(label("Ambro")) Theorem 0.2, using the period results of #cite(label("LI")) to accommodate a real polarization.

=== 1.2 The stronger statement and the proof <the-stronger-statement-and-the-proof>

For a pseudo-effective real $\( 1 \, 1 \)$-class $alpha$, denote by $N \( alpha \)$ its divisorial negative part:
  the effective real divisor whose coefficient along each prime is the least generic multiplicity forced in
  positive representatives, with arbitrarily small Kähler perturbations. A nef class has zero negative part.
  We prove a stronger statement in which the adjoint sum need not be nef.

The algebraic dimension $a \( T \)$ is the transcendence degree of the field of meromorphic functions on $T$.
  Its algebraic reduction, after modification, is a morphism $h : T arrow.r
  W$ to a smooth projective variety of dimension $a \( T \)$ whose meromorphic functions account for all those on $T$.

#thm([Theorem 1.2.])[
  #emph[Let $T$ be a smooth connected compact Kähler manifold, $B gt.eq
    0$ a rational simple normal crossing divisor with coefficients less than one,
    and $M$ a nef rational line bundle. Suppose $J = K_T + B$ is pseudo-effective.
    There are a smooth compact Kähler modification $mu : U arrow.r T$, a semiample rational line $P$ on $U$,
    and an effective rational divisor $R$ on $U$, such that
$ mu^(*) \( J + M \) equiv P + R \, wide R = N #scale(x: 120%, y: 120%)[\(] c_1 \( mu^(*) \( J + M \) \)
  #scale(x: 120%, y: 120%)[\)] . $

 Here $equiv$ denotes equality of real Chern classes. Moreover, if $a \( T \) = 0$, then $c_1 \( M \) = 0$.]
] <thm:decomposition>

We prove both assertions of Theorem 2 simultaneously by induction on dimension.
  Projective manifolds are covered by #cite(label("P")). For $a \( T \) = 0$,
  the ordinary decomposition and the decomposition theorem for Kähler klt pairs of Calabi–Yau type
  #cite(label("BBYv2")) Corollary 1.4 reduce the problem to tori and simple spaces carrying a generically
  symplectic form. The simple case requires a meromorphic nonvanishing statement for $K_T + M$.
  Section 5 develops the required extension of the two-diagonal argument in #cite(label("K")) Section 6.
  The new geometric input excludes a family of correspondences sweeping $T times T$:
  such a family would produce a nonzero holomorphic one-form on a fixed finite cover.

When $0 < a \( T \) < dim T$, the first objective is to descend $M$ numerically to $W$.
  Induction decomposes the adjoint on a very general fiber,
  but the associated flat twist on that fiber is not known to extend.
  Section 6 resolves this difficulty using countably many global maps constructed from relative cycles.
  Each map permits one fixed global choice of flat twist. Coherent base change then turns positive fiberwise
  Iitaka dimension into a meromorphic function contradicting the algebraic reduction.
  It follows that $M$ has zero class on a very general fiber,
  and the current-theoretic descent proved in Section 3 gives a nef rational line on $W$.

It remains to put the ordinary adjoint on a projective base.
  After adding a large multiple of an ample line from $W$, an ordinary negative program can be run entirely over
  $W$. Its semiample fibration yields

$ f : Y arrow.r Z \, wide K_Y + Delta tilde.op_(bb(Q)) f^(*) H \, $

where $Z$ is projective and $\( Y \, Delta \)$ is effective and klt.
  Section 4 proves that $H$ itself is an ordinary klt adjoint on $Z$.
  The key infinitesimal observation identifies the rank of the extreme Hodge-line period map with the full period
  rank. The rational period quotient then supplies the positivity needed to choose an effective klt boundary on $Z$.

The projective theorem now applies to the descended adjoint and nef summand.
  Section 7 identifies its pulled-back exceptional divisor with the entire analytic negative part using the mixed
  Hodge–Riemann relations. This finishes the induction. For a nef original sum, the negative part vanishes;
  invariance of $"Pic"^0$ under smooth modifications descends the semiample representative and proves Theorem 1.

The descent of rational nef classes, the countable construction of global twists,
  and the adjoint formula for a Kähler total space are stated separately because each can be used beyond this induction.

== 2 Rational lines and divisorial decompositions <sec:preliminaries>

The proof keeps two kinds of information separate: a real $\( 1 \, 1 \)$-class and the rational holomorphic line
  bundle representing it. We first set out this distinction and the precise ordinary and projective results used below.

=== 2.1 Conventions and changes of model <conventions-and-changes-of-model>

We work over $bb(C)$. A rational line bundle on a complex space $X$ means an element of $"Pic" \( X \) ⊗_(bb(Z))
  bb(Q)$; we use additive notation. The relation $L tilde.op_(bb(Q)) L'$ is equality in this group,
  so that sufficiently divisible integral multiples are isomorphic holomorphic line bundles.
  On a smooth compact Kähler manifold, $L equiv L'$ means $c_1 \( L \) =
  c_1 \( L' \)$ in real Bott–Chern cohomology. We also write ${ E } =
  c_1 \( cal(O)_X \( E \) \)$ for a real divisor $E$. The $partial
  macron(partial)$-lemma identifies real Bott–Chern $\( 1 \, 1 \)$-classes with real de Rham classes of type
  $\( 1 \, 1 \)$.

A class is #emph[pseudo-effective] if it contains a closed positive current;
  it is #emph[nef] if it lies in the closure of the Kähler cone.
  A rational line is #emph[semiample] if a positive integral multiple is generated by its global sections.
  On a smooth projective variety these notions, for divisor classes, agree with the corresponding algebraic ones,
  and equality of real divisor classes agrees with numerical equivalence.
  We use the analytic definitions on every nonprojective model.

All manifolds and normal spaces are connected unless otherwise stated.
  A modification is a proper bimeromorphic morphism. Resolutions, flattenings,
  and main components of fiber products are always followed, when necessary,
  by normalization and a smooth compact Kähler modification.
  Spaces in Fujiki class $cal(C)$ are used only through such models.
  Projective targets admit projective modifications. The resolution procedures can be chosen projective and
  functorial; finite covers of compact Kähler spaces are Kähler.

We use the usual discrepancy definition of a klt pair, with an effective rational boundary unless a signed
  boundary is expressly mentioned. A signed pair with all discrepancies greater than $- 1$ is called sub-klt.
  On a smooth model, a simple normal crossing boundary is klt precisely when all its coefficients are less than one.

For a normal klt pair $\( X \, B \)$ and a log resolution $mu : tilde(X) arrow.r X$, write

$ K_(tilde(X)) + tilde(B) = mu^(*) \( K_X + B \) . $

Replacing $tilde(B)$ by its coefficientwise positive part produces an effective simple normal crossing klt
  boundary $B^(+)$, and

#[#set math.equation(numbering: n => "(2.1)")
 $ K_(tilde(X)) + B^(+) = mu^(*) \( K_X + B \) + E \, wide E gt.eq
   0 upright(" exceptional over ") X . $ <pre:resolution-error>]

The exceptional support assertion uses effectiveness of $B$:
  the nonexceptional coefficients of $tilde(B)$ are already nonnegative.
  The pullback of a nef rational line remains nef. Thus this convention preserves the hypotheses of the induction.

#thm([Lemma 2.1.])[
  (Lines of zero class).  #emph[Let $mu : Y arrow.r X$ be a modification between smooth compact Kähler manifolds.]
  + #emph[A rational line whose real Chern class is zero belongs to $"Pic"^0 \( X \) ⊗_(bb(Z)) bb(Q)$.]
  + #emph[Pullback identifies $"Pic"^0 \( X \)$ with $"Pic"^0 \( Y \)$.]
  + #emph[If a rational line $L$ on $X$ has semiample pullback, then $L$ is semiample.]
] <pre:picard>

#proof[
  After clearing denominators, a line of zero real class has torsion integral Chern class.
    Another positive power has zero integral class, so belongs to $"Pic"^0$ by the exponential sequence.
    The second assertion is the standard bimeromorphic invariance of $"Pic"^0$:
    a smooth modification preserves $H^1 \( cal(O) \)$ and the integral lattice defining this torus.
    It also follows by factoring smooth bimeromorphic maps into blowups and blowdowns with smooth centers.
    Finally $mu_(*) cal(O)_Y = cal(O)_X$ by normality. The projection formula identifies the sections of every
    integral multiple of $L$ with those of its pullback. A base point downstairs would therefore be a base point
    at every point above it. ◻
]

=== 2.2 The analytic negative part <the-analytic-negative-part>

For a pseudo-effective real class $alpha$ on a smooth compact Kähler manifold, fix a Kähler form $omega$.
  If $E$ is a prime divisor, its minimal multiplicity is

$ nu_E \( alpha \) = lim_(epsilon arrow.b 0) inf { nu_E \( T \) : T in alpha \, quad T gt.eq - epsilon omega } . $

Here $nu_E \( T \)$ is the generic Lelong number. The definition is independent of $omega$,
  and currents with analytic singularities suffice. Boucksom’s divisorial decomposition is

$ N \( alpha \) = sum_E nu_E \( alpha \) E \, wide Z \( alpha \) = alpha - { N \( alpha \) } . $

Its negative part is an effective real divisor, and its positive part is #emph[modified nef]:
  all its minimal divisorial multiplicities vanish. For a rational line $L$, write $N \( L \) =
  N \( c_1 \( L \) \)$. The foundational analytic results are due to Boucksom #cite(label("Boucksom2004"))
  Sections 2–3 and 5. The following forms, including their use on smooth resolutions of normal Kähler spaces,
  are recorded and proved in #cite(label("K")) Section 2.

#thm([Lemma 2.2.])[
  (Negative-part calculus).  #emph[Let $alpha$ be pseudo-effective on a smooth compact Kähler manifold.]
  + #emph[Every positive current in $alpha$ contains $\[ N \( alpha \) \]$. If $0 lt.eq F lt.eq N \( alpha \)$, then
$ N \( alpha - { F } \) = N \( alpha \) - F . $

]
  + #emph[If $beta$ is nef, then $N \( alpha + beta \) lt.eq N \( alpha \)$. In particular $N \( beta \) = 0$.]
  + #emph[A modified nef class restricts pseudo-effectively to a resolution of every prime divisor.]
  + #emph[If $mu : Y arrow.r X$ is a smooth modification and $alpha = beta + { R }$, with $beta$ nef and $R =
    N \( alpha \)$, then
$ N \( mu^(*) alpha \) = mu^(*) R . $

]
  + #emph[Suppose $mu : Y arrow.r X$ is a modification from a smooth compact Kähler manifold to a normal compact
    Kähler space, $A$ is a rational line on $X$, and $E gt.eq 0$ is $mu$-exceptional.
    If $mu^(*) A + E$ is pseudo-effective, then $mu^(*) A$ is pseudo-effective and
$ N \( mu^(*) A + E \) = N \( mu^(*) A \) + E . $

]
] <pre:negative>

These are #cite(label("K")) Lemmas 2.2–2.4. The exceptional translation in part (5) also holds for a real class
  with smooth local potentials on the normal target. Part (3) concerns prime divisors;
  we do not use unrestricted pseudo-effective restriction to arbitrary subvarieties.
  Section 7 gives the related intersection argument needed when a map has positive-dimensional fibers.

Two consequences will be used repeatedly. An effective divisor representing a multiple $m L$ contains $m
  N \( L \)$, because its divisorial current is positive. Also,
  the decomposition sought in Theorem 2 is unchanged by taking a higher smooth model:
  part (4) pulls it up, and part (5) removes the error (2.1).

=== 2.3 The ordinary Kähler input <the-ordinary-kähler-input>

The first substantial input is ordinary log abundance, in its divisorial form.
  We state the full line-bundle information needed in the proof.

#thm([Theorem 2.3.])[
  (Ordinary divisorial decomposition).  #emph[Let $X$ be a smooth compact Kähler manifold,
    and let $B$ be a rational simple normal crossing divisor with coefficients in $\[ 0 \, 1 \]$.
    If $J = K_X + B$ is pseudo-effective, there is a smooth compact Kähler modification $mu : U arrow.r
    X$ and an identity
$ mu^(*) J tilde.op_(bb(Q)) P + R \, wide P upright(" semiample") \, wide R = N \( mu^(*) J \) gt.eq 0 \, $

 where $P$ is a rational line and $R$ is a rational divisor.]
] <pre:ordinary>

This is #cite(label("K")) Theorem 2.13, whose logarithmic Iitaka hypothesis is supplied by #cite(label("LI"))
  Corollary 6.2. More precisely, the required inequality is

$ kappa \( X \, K_X + D_X \) gt.eq kappa \( F \, K_F + D_X \|_F \) + kappa \( Y \, K_Y + D_Y \) $

for a surjective morphism $f : X arrow.r Y$ with connected fibers between smooth connected projective varieties,
  a very general smooth fiber $F$, reduced simple normal crossing boundaries $D_X \, D_Y$,
  and $"Supp" \( f^(*) D_Y \) subset.eq "Supp" \( D_X \)$. Thus the boundary condition in the input is retained.
  We use Theorem 5 in every dimension. It implies ordinary nonvanishing:
  a sufficiently divisible multiple of $J$ has a nonzero section.
  If $a \( X \) = 0$, its semiample part is rationally trivial, and hence $mu^(*) J tilde.op_(bb(Q)) R$.

We also use the following program consequence of ordinary decomposition.
  The version stated here is confined to its smooth starting models.

#thm([Proposition 2.4.])[
  (Contraction of a known negative part).  #emph[Let $\( X \, B \)$ be a smooth compact Kähler klt pair with
    rational simple normal crossing boundary. Suppose
$ K_X + B tilde.op_(bb(Q)) P + R \, wide P upright(" semiample") \, wide R = N \( K_X + B \) gt.eq 0 $

 with $P \, R$ rational. A finite ordinary $\( K_X + B \)$-negative program reaches a normal compact Kähler klt
   model on which the log canonical line is semiample. Its steps contract or flip detected analytic extremal rays,
   are $P$-trivial, and preserve a fixed generated Cartier multiple of $P$ as an actual line.
   The final adjoint is rationally linearly equivalent to the descended semiample line.
   The steps extract no divisors; on a common resolution the initial adjoint equals the pullback of the final
   adjoint plus an effective divisor exceptional over the final model.]
] <pre:contract>

This is the ordinary klt case of #cite(label("K")) Proposition 3.8,
  using the ordinary scaling construction of #cite(label("K")) Lemma 3.6 and its detected analytic rays.
  Smoothness supplies global strong $bb(Q)$-factoriality, the displayed identity and Lemma 4(4) supply its
  resolution hypothesis, and Theorem 5 supplies the lower-dimensional ordinary hypotheses in that proposition.
  The ray estimate used to keep this program over a prescribed projective base will be verified at the point of use.

=== 2.4 The projective input <the-projective-input>

The second substantial input is numerical semiampleness of the positive part for projective klt pairs.
  It is important to apply it to a nef line on the original model;
  the trace of its b-divisor on a later minimal model need not remain nef.

#thm([Proposition 2.5.])[
  (Projective positive parts).  #emph[Let $\( S \, Delta \)$ be a normal projective klt pair with rational
    boundary, and let $M$ be a nef rational Cartier divisor. Suppose $K_S + Delta$ is pseudo-effective.
    There is a smooth projective modification $u : S' arrow.r S$, a birational morphism $v : S' arrow.r
    S_m$ to a normal projective variety, a nef rational Cartier divisor $H_m$ on $S_m$,
    and an effective rational $v$-exceptional divisor $E$, such that
#[#set math.equation(numbering: n => "(2.2)")
 $ u^(*) \( K_S + Delta + M \) tilde.op_(bb(Q)) v^(*) H_m + E . $ <pre:projective-model>]

 On a sufficiently high such model, $v^(*) H_m$ is numerically equivalent to a semiample rational divisor and
$ N #scale(x: 120%, y: 120%)[\(] u^(*) \( K_S + Delta + M \) #scale(x: 120%, y: 120%)[\)] = E . $

]
] <pre:projective>

#proof[
  The positive-part assertion of #cite(label("P")) Proposition 8.1 gives a smooth model on which the rational
    positive part of the original adjoint is numerically semiample.
    Separately, take a small projective $bb(Q)$-factorialization and run a terminating generalized klt program as
    in #cite(label("P")) Theorem 2.3. Its fixed nef data are the pullback of $M$.
    The generalized discrepancies initially agree with the ordinary ones because $M$ descends,
    and the generalized adjoint is pseudo-effective. The resulting model has nef adjoint $H_m$.
    The comparison on a common resolution is (2.2), with effective exceptional error.
  Choose this resolution also to dominate the model furnished by the positive-part theorem.
    Lemma 4(5) and nefness of $v^(*) H_m$ identify $E$ as the negative part.
    Pulling up the first model’s decomposition by Lemma 4(4) identifies its numerically semiample positive class
    with $v^(*) H_m$. Algebraic and analytic negative parts agree on these smooth projective models. ◻
]

The generalized program used in this proof is the fixed-nef-data minimal-model theorem cited in #cite(label("P"));
  it is not an application of the numerical semiampleness assertion being proved here.
  The two inputs above will be used as stated theorems. The remaining sections prove the additional Kähler
  arguments, including the descent and period constructions that permit their application.

== 3 Descent of nef and flat lines <sec:descent>

A nef class that vanishes on the fibers of a fibration should come from its base.
  Singular fibers make this assertion more delicate than cohomological descent on a smooth family:
  the discrepancy can contain vertical divisors. We first remove those divisors,
  and then distinguish numerical descent from descent of an actual rational line.
  Throughout this section a #emph[fibration] is a surjective holomorphic map with connected fibers.

#thm([Proposition 3.1.])[
  (Numerical descent of a nef line).  #emph[Let $f : X arrow.r
    Y$ be a fibration of smooth connected compact Kähler manifolds,
    and let $M in "Pic" \( X \) ⊗ bb(Q)$ be analytically nef.
    Suppose that $c_1 \( M \|_(X_y) \) = 0$ on a general smooth fiber.
    There are smooth compact Kähler modifications $p : X' arrow.r X$ and $q : Y' arrow.r Y$, a fibration $g :
    X' arrow.r Y'$ satisfying $f p = q g$, and a rational line $N$ on $Y'$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ p^(*) M equiv g^(*) N . $ <desc:numerical-identity>]

 If $Y$ is projective, $Y'$ can be chosen projective and $N$ is nef.]
] <desc:nef>

#proof[
  We descend a positive current over the smooth fibers, remove the vertical divisor discrepancy over the remaining
    fibers, and finally recover the rationality of the descended class.
    If $Y$ is a point, the hypothesis says that $c_1 \( M \) = 0$.
    If the relative dimension is zero, $f$ is bimeromorphic; take a common smooth model as both $X'$ and $Y'$.
    We may therefore assume $k = dim Y > 0$ and $d = dim X - dim Y > 0$.
  Flatten $f$ after a smooth modification $q : Y' arrow.r Y$ #cite(label("HironakaFlattening")).
    Let $Z$ be the normalization of the main component of $X times_Y Y'$,
    and resolve it by a projective modification $r : X' arrow.r Z$. Write $g_0 : Z arrow.r Y'$ and $g = g_0 r$.
    The map $g_0$ is equidimensional; it and $g$ have connected fibers by Stein factorization and normality of
    $Y'$. All these spaces admit the asserted Kähler models. Write $p_0 : Z arrow.r
    X$ for the map to the original source, so that $p = p_0 r$ is a modification.
    If $Y$ is projective, the base modifications may be chosen projective.
    Figure 1 separates the equidimensional map from the resolution above it.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.35), [$X'$])
  content((2.6, 1.35), [$Z$])
  content((5.2, 1.35), [$X$])
  content((2.6, 0), [$Y'$])
  content((5.2, 0), [$Y$])
  line((0.3351, 1.35), (2.353, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.3, 1.35), [$r$], anchor: "south", padding: 0.1058cm)
  line((2.847, 1.35), (4.953, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.9, 1.35), [$p_0$], anchor: "south", padding: 0.1058cm)
  line((0.3351, 1.176), (2.265, 0.174), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.3, 0.675), [$g$], anchor: "north-east", padding: 0.1058cm)
  line((2.6, 1.124), (2.6, 0.2385), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.6, 0.675), [$g_0$], anchor: "west", padding: 0.1058cm)
  line((5.2, 1.124), (5.2, 0.2263), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.2, 0.675), [$f$], anchor: "west", padding: 0.1058cm)
  line((2.935, 0), (4.953, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.9, 0), [$q$], anchor: "north", padding: 0.1058cm)
})],
    caption: [Figure 1: The flattened main component $Z$ is equidimensional over $Y'$. A prime divisor on the resolution $X'$ whose image in $Y'$ has codimension at least two must therefore be exceptional for $r$. ],
  ) <desc:diagram>
  Put $alpha = c_1 \( p^(*) M \)$, choose a Kähler form $omega$ on $X'$,
    and choose a closed positive current $T$ representing $alpha$. The volume
  $ c = integral_(X'_y) omega^d $
  is positive and constant on the smooth-fibration locus. Define the closed positive $\( 1 \, 1 \)$-current
  #[#set math.equation(numbering: n => "(3.2)")
   $ S = c^(- 1) g_(*) \( T and omega^d \) $ <desc:base-current>]
  on $Y'$. We claim that $T = g^(*) S$ over that locus. Indeed $g_(*) \( T and omega^(d - 1) \)$ is a closed
    positive current of degree zero, hence a nonnegative constant.
    Its cohomology class is the fiber intersection of $alpha$ with $omega^(d - 1)$, which vanishes.
    Thus this current is zero. In local product coordinates this says that the vertical block of the positive
    matrix of measures defining $T$ vanishes. Positivity also forces its mixed block to vanish.
    Closedness then makes the horizontal coefficients independent of the fiber coordinates.
    Connectedness of the fibers makes these local currents descend,
    and Equation (3.2) identifies their common descent as $S$.
  The current $S$ has local plurisubharmonic potentials, so its pullback by the dominant map $g$ is defined on all
    of $X'$. The closed order-zero current $T - g^(*) S$ is supported on the inverse image of the complement of
    the smooth-fibration locus in $Y'$. The support theorem for currents #cite(label("DemaillyCADG")) Chapter III,
    Corollaries 2.11 and 2.14 therefore gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ T - g^(*) S = \[ D \] \, wide D = sum_E x_E E \, $ <desc:vertical-difference>]
  where $D$ is a signed real divisor supported on vertical primes.
    We next show that its components dominating base divisors come in whole pullbacks.
  Fix a prime divisor $Q subset Y'$ occurring among their images, and let $E_1 \, dots.h \,
    E_s$ be the primes of $X'$ dominating $Q$. Let $a_i > 0$ be their multiplicities in $g^(*) Q$,
    and let $x_i$ be their coefficients in $D$. For a Kähler form $eta$ on $Y'$, set
  #[#set math.equation(numbering: n => "(3.4)")
   $ C_(i j) = integral_(X') { E_i } { E_j } thin \( g^(*) eta \)^(k - 1) omega^(d - 1) . $ <desc:intersection-matrix>]
  For $i eq.not j$, these numbers are nonnegative. The inverse image $g^(- 1) \( Q \)$ is an effective Cartier
    divisor, hence has pure codimension one. After a generic choice of the point in $Q$,
    its fiber components all have pure dimension $d$. Distinct primes $E_i \,
    E_j$ have pure codimension-two intersection; if they meet over a general point of $Q$,
    that intersection dominates $Q$ and has fibers of dimension $d - 1$.
    It therefore contributes positively to $C_(i j)$. These dimension statements follow by generic flatness over
    $Q$, excluding the smaller base images. The graph having an edge when $C_(i j) > 0$ is consequently connected.
    Indeed, over a general point of $Q$ the irreducible components of the connected fiber have a connected
    intersection graph. Grouping those components according to the global prime $E_i$ containing them gives the
    graph above as a quotient, which is still connected. Moreover $C a = 0$, where $a = \( a_i \)$.
    To see this, pair $E_i$ with $g^(*) Q$ and $\( g^(*) eta \)^(k - 1) omega^(d - 1)$.
    Its image lies in $Q$, so the $k$ classes from the base give zero.
    Components of $g^(*) Q$ whose images have codimension at least two give zero separately in this pairing.
  Let $beta$ be the Bott–Chern class of $S$. Equation (3.3) gives ${ D } = alpha - g^(*) beta$.
    Pairing this identity with each $E_i \( g^(*) eta \)^(k - 1) omega^(d - 1)$ shows that
  $ C x gt.eq 0 . $
  Here the $alpha$ term is nonnegative by nefness, and the base term vanishes by dimension.
    Components of $D$ above other base divisors, or above sets of codimension at least two, also contribute zero.
    Since $a$ has strictly positive entries and $a^(sans(t)) C x = 0$, we obtain $C x = 0$.
    The kernel is precisely $bb(R) a$: indeed
  $ x^(sans(t)) C x = - sum_(i < j) C_(i j) a_i a_j (x_i / a_i - x_j / a_j)^2 \, $
  and the graph is connected. Consequently $x_i = t_Q a_i$ for one real number $t_Q$.
  Subtract $g^(*) \( sum_Q t_Q Q \)$ from $D$, and denote the resulting divisor by $D_0$.
    Its image in $Y'$ has codimension at least two. Equidimensionality of $g_0$ implies that every such prime on
    $X'$ is $r$-exceptional. Also
  $ { D_0 } = alpha - g^(*) beta' \, wide beta' = beta + sum_Q t_Q { Q } . $
  Both classes on the right come from classes with local potentials on $Z$:
    $alpha$ comes from the original source $X$, and $beta'$ comes from $Y'$.
    Thus $D_0$ has degree zero on every curve contracted by $r$.
    Relative negativity for a projective morphism of normal analytic spaces #cite(label("FujinoAnalyticBCHM"))
    Section 11, after Definition 11.1, applied to the exceptional divisors $D_0$ and $- D_0$, gives $D_0 = 0$.
    We have proved
  #[#set math.equation(numbering: n => "(3.5)")
   $ alpha = g^(*) beta' . $ <desc:real-pullback>]
  It remains to justify that the descended class is a rational line class;
    the use of $omega$ above does not supply rationality by itself. Pullback
  $ g^(*) : H^2 \( Y' \, bb(Q) \) arrow.r H^2 \( X' \, bb(Q) \) $
  is injective. Over $bb(R)$ a left inverse is obtained by pushing against $omega^d$ and dividing by $c$,
    so injectivity follows there and hence over $bb(Q)$. An injective rational linear map has a rational preimage
    for every rational vector in its real image. Since $alpha$ is rational,
    Equation (3.5) therefore makes $beta'$ rational. It has type $\( 1 \, 1 \)$,
    and the Lefschetz $\( 1 \, 1 \)$ theorem gives a rational line $N$ with $c_1 \( N \) = beta'$.
  Finally suppose that $Y'$ is projective. For any irreducible curve $C subset Y'$,
    resolve a component of $g^(- 1) \( C \)$ that dominates $C$,
    and factor its map through the normalization of $C$. The pullback of $alpha$ is nef.
    Pairing it with a Kähler power on that resolution gives a positive constant times $deg \( N \|_C \)$.
    This degree is nonnegative. The projective numerical criterion for nefness now shows that $N$ is nef. ◻
]

The preceding proposition descends the Chern class. For later use we also need an actual rational-line identity.
  The price is a single flat twist on the original source.

#thm([Corollary 3.2.])[
  (Choosing a descended representative).  #emph[In the notation and under the hypotheses of Proposition 8,
    there is a rational line $M^(*)$ on $X$ with $M^(*) equiv M$ such that
$ p^(*) M^(*) tilde.op_(bb(Q)) g^(*) N . $

]
] <desc:representative>

#proof[
  The rational line $g^(*) N - p^(*) M$ has zero real Chern class.
    After clearing denominators and torsion, it belongs to $"Pic"^0 \( X' \)$.
    Lemma 3(2) identifies $"Pic"^0 \( X \)$ with $"Pic"^0 \( X' \)$.
    Thus $g^(*) N - p^(*) M tilde.op_(bb(Q)) p^(*) F$ for some $F in "Pic"^0 \( X \) ⊗ bb(Q)$. Take $M^(*) = M + F$. ◻
]

The next lemma explains which fiberwise trivial flat twists already come from the base.
  Passing to rational lines allows us to remove finite meridian holonomy and torsion Chern classes.

#thm([Lemma 3.3.])[
  (Descent of a flat line).  #emph[Let $f : X arrow.r Y$ be a fibration of smooth connected compact Kähler
    manifolds, and let $F in "Pic"^0 \( X \) ⊗ bb(Q)$. If $F$ is trivial as a rational line on a general smooth
    fiber, then
$ F tilde.op_(bb(Q)) f^(*) G $

 for some $G in "Pic"^0 \( Y \) ⊗ bb(Q)$.]
] <desc:flat>

#proof[
  Take a positive multiple so that $F$ is a genuine unitary flat line and its restriction to one smooth fiber
    $X_y$ is holomorphically trivial. On a compact connected Kähler manifold,
    a holomorphically trivial unitary flat line has trivial holonomy.
    Thus the character of $F$ is trivial on $pi_1 \( X_y \)$.
  Choose a dense Zariski open $Y^compose$ over which $f$ is smooth, and write $X^compose =
    f^(- 1) \( Y^compose \)$. The homotopy sequence of the smooth proper fibration gives
  $ pi_1 \( X_y \) arrow.r pi_1 \( X^compose \) arrow.r pi_1 \( Y^compose \) arrow.r 1 . $
  The character of $F \|_(X^compose)$ therefore comes from a unitary character $chi$ of $pi_1 \( Y^compose \)$.
  Let $Q$ be a divisorial component of $Y \\ Y^compose$. Choose a prime dominating $Q$ and a transverse disk at a
    general point of that prime, away from the other components of the inverse image of $Y \\ Y^compose$.
    Its image winds $a_Q$ times around a small meridian of $Q$,
    where $a_Q > 0$ is the multiplicity of that prime in $f^(*) Q$.
    The disk lies in $X$, so the character of $F$ is trivial on its boundary.
    Hence $chi$ has finite order dividing $a_Q$ on the base meridian. There are finitely many such $Q$.
    A common power of $chi$ kills all their meridians and therefore factors through $pi_1 \( Y \)$;
    subsets of complex codimension at least two add no obstruction.
    The resulting unitary flat line on $Y$ has zero real Chern class,
    and another power removes any torsion in its integral Chern class. It then belongs to $"Pic"^0 \( Y \)$.
  The resulting characters agree after pullback on $X^compose$.
    Since $pi_1 \( X^compose \) arrow.r pi_1 \( X \)$ is surjective, they agree on $X$ as well.
    Dividing by the powers taken in the argument proves the asserted identity in $"Pic" \( X \) ⊗ bb(Q)$. ◻
]

== 4 An ordinary adjoint on the projective base <sec:adjoint>

The induction will produce a morphism to a projective variety for which an ordinary adjoint is pulled back from
  the base. To apply the projective numerical-semiampleness theorem,
  we must realize the line downstairs as an ordinary klt adjoint.
  The following proposition provides this realization. The total space need not be projective.

#thm([Proposition 4.1.])[
  (An adjoint on the base).  #emph[Let $\( Y \, D \)$ be an effective klt pair with rational boundary on a normal
    compact Kähler space. Let $f : Y arrow.r Z$ be a surjective morphism with connected fibers to a normal
    projective variety, and suppose that $dim Y > dim Z$. If $H$ is a rational Cartier line bundle on $Z$ and
#[#set math.equation(numbering: n => "(4.1)")
 $ K_Y + D tilde.op_(bb(Q)) f^(*) H \, $ <adj:initial>]

 then there is an effective rational divisor $D_Z$ such that $\( Z \, D_Z \)$ is klt and
$ H tilde.op_(bb(Q)) K_Z + D_Z . $

]
] <adj:base>

Ambro proves the corresponding statement for projective total spaces #cite(label("Ambro")) Theorem 0.2.
  We follow the same separation into a discriminant and a Hodge-theoretic moduli line.
  The two points requiring attention here are the real, possibly irrational polarization of a Kähler family and
  the construction of its cyclic cover without a meromorphic frame of $K_Y$.
  The period results recalled next address the first point;
  we give the cover and the required infinitesimal calculation explicitly.

=== 4.1 The period input and the discriminant <the-period-input-and-the-discriminant>

For a pure variation of Hodge structures on a smooth open set,
  the #emph[line period map] of a rank-one highest Hodge piece is the map to the projective space of the flat
  vector space that records this line in a local flat trivialization.
  Its generic differential rank is independent of the trivialization.
  The full period map records the entire Hodge filtration. For quasi-unipotent boundary monodromy,
  the #emph[parabolic extension] of the line is the rational line bundle obtained by making the monodromy
  unipotent on local finite covers, extending the highest Hodge piece,
  and descending with its rational boundary weights.

We use the following precise consequence of the period results in #cite(label("LI")) Lemmas 4.1 and 4.3 and
  Proposition 4.5.

#thm([Lemma 4.2.])[
  (Period quotient input).  #emph[Let $S$ be a smooth projective variety and let $S^compose subset
    S$ have simple normal crossing complement. Let $bb(V)$ be a real-polarizable pure variation on $S^compose$
    with an integral lattice and quasi-unipotent local monodromy.
    Suppose that a complex direct summand of $bb(V)_(bb(C))$, as a variation of Hodge structures,
    has a rank-one highest Hodge piece, with parabolic extension $L$.
    Then $L$ is nef, and its numerical dimension is the generic rank of its line period map.]
  #emph[After modification $tau : S' arrow.r S$, there are a smooth projective variety $Q$,
    a surjective morphism $p : S' arrow.r Q$ with connected fibers, and a nef rational line bundle $P$ on $Q$ such that
#[#set math.equation(numbering: n => "(4.2)")
 $ tau^(*) L tilde.op_(bb(Q)) p^(*) P . $ <adj:period-descent>]

 Moreover, $dim Q$ is at most the generic rank of the full period map of $bb(V)$.
   If $Q$ is a point, $tau^(*) L$ is rationally trivial.]
] <adj:period-input>

Here the identity is in $"Pic" \( S' \) ⊗ bb(Q)$, including the boundary.
  For clarity, the dimension assertion follows because the descended,
  generically immersive period map on $Q$ belongs to an adjoint variation obtained by tensor constructions from
  $bb(V)$. The rational adjoint reduction in #cite(label("LI")) Lemma 4.3 retains entire rational simple factors,
  so its monodromy is discrete even when the original real polarization is irrational.
  It also kills only finite scalar monodromy after taking a power.
  Thus (4.2) does not discard an arbitrary flat twist. We shall need exactly this actual line identity.

Choose a projective resolution $b : S arrow.r Z$, and normalize the main component of $Y times_Z S$.
  Choose its log resolution functorially with respect to local isomorphisms preserving the marked boundary;
  over the open where $b$ is an isomorphism this is a functorial log resolution of $\( Y \, D \)$.
  Denote the resulting smooth compact Kähler space by $X$, with maps $pi : X arrow.r Y$ and $g : X arrow.r S$.
  Such a resolution is available in the complex analytic category;
  see #cite(label("BierstoneMilman2008")) Theorem 1.1 and the preceding analytic remark.
  The functorial choice will matter when we lift local flows.
  Additional resolutions used to compute thresholds and fiber integrals are auxiliary and do not replace the
  family whose cohomology we use. Define the crepant rational divisor $D_X$ by

$ K_X + D_X = pi^(*) \( K_Y + D \) . $

Its exceptional coefficients may be negative; all its coefficients are strictly less than one.
  For a prime divisor $Q_0$ on $S$, let

$ t_(Q_0) = sup { c in bb(R) : \( X \, D_X + c g^(*) Q_0 \)
  upright(" is log canonical over the general point of ") Q_0 } . $

The definition is unchanged on a higher crepant resolution.
  It gives a positive rational number, computed by a log resolution as

#[#set math.equation(numbering: n => "(4.3)")
 $ t_(Q_0) = min_i frac(1 - u_i, a_i) \, $ <adj:threshold>]

where $g^(*) Q_0 = sum_i a_i E_i$ over its general point and $u_i$ is the coefficient of $E_i$ in the crepant
  boundary there. Define

#[#set math.equation(numbering: n => "(4.4)")
 $ Delta_S = sum_(Q_0) \( 1 - t_(Q_0) \) Q_0 \, wide L_S = b^(*) H - K_S - Delta_S . $ <adj:discriminant>]

Only finitely many terms of $Delta_S$ are nonzero: off a suitable proper analytic subset the resolved pair is
  relatively simple normal crossing, the map is smooth, and the threshold of a base prime is one.
  We may choose $S$ with a simple normal crossing divisor containing this exceptional set and the support of $Delta_S$.

The coefficients of $Delta_S$ are strictly less than one.
  To prove Proposition 11, we will show that $L_S$ has an effective rational representative whose addition to
  $Delta_S$ is sub-klt. The relevant positivity comes from the following root construction.

=== 4.2 The root cover and its highest Hodge line <the-root-cover-and-its-highest-hodge-line>

#thm([Lemma 4.3.])[
  (The root eigenline).  #emph[In the setting of Proposition 11,
    there is a dense Zariski open $S^compose subset S$ and a smooth proper family $h : V^compose arrow.r
    S^compose$ obtained from a cyclic cover and resolution, such that $R^l h_(*) bb(R)$, where $l = dim Y -
    dim Z$, is real-polarizable and has an integral lattice. One character summand of its complexification has a
    rank-one highest Hodge piece. On $S^compose$, this line agrees, as a rational line bundle, with $b^(*) H - K_S$.]
] <adj:root>

#proof[
  Choose an integer $m > 0$ clearing all divisors and rational line identities.
    A meromorphic section of the line $m b^(*) H$ exists because $S$ is projective. Its pullback, under the identity
  $ m \( K_X + D_X \) tilde.eq g^(*) \( m b^(*) H \) \, $
  and division by the canonical meromorphic section of $m D_X$ give a meromorphic section $sigma$ of $K_X^(⊗ m)$.
    On the open where $sigma$ has neither zeros nor poles, take its $m$th roots in the fibers of $K_X$.
    In local canonical frames this is the equation $z^m = sigma$;
    on overlaps the roots transform by the transition functions of $K_X$.
    The local covers therefore glue without a meromorphic trivialization of $K_X$, and without choosing a root of $H$.
  The Grauert–Remmert extension theorem for finite analytic covers #cite(label("SGA1")) Exposé XII,
    Proposition 5.3 and Theorem 5.4 extends it normally across the divisor of $sigma$,
    giving a finite cyclic cover of $X$, possibly disconnected. It is compact Kähler.
    Take a resolution functorial for the cyclic action and for local isomorphisms of the pair,
    as in #cite(label("Ambro")) Section 1.1 and Lemma 1.1. Thus both resolutions are functorial.
    A local flow preserving the original pair lifts through them once its lift to the root cover has been chosen;
    we will construct that lift explicitly below. The resulting compact manifold $V$ is Kähler.
    After deleting from $S$ the zeros and poles of the chosen base section and the degeneration locus,
    the map $h : V^compose arrow.r S^compose$ is smooth and proper.
    We take $S^compose$ inside the isomorphism locus of $b$. Shrinking it further,
    the original fibers of $Y arrow.r Z$ are normal effective klt pairs and the chosen resolutions restrict to
    resolutions of those pairs.
  Average a global Kähler class on $V$ under the cyclic group.
    Its restriction is a flat real section of $R^2 h_(*) bb(R)$ and polarizes the primitive pieces.
    Their Lefschetz decomposition supplies a flat real polarization of the full degree-$l$ cohomology.
    We retain the full cohomology local system, with lattice $R^l h_(*) bb(Z)$ modulo torsion;
    an irrational primitive summand is not required to carry its own lattice.
    The finite group action preserves this variation and its polarization.
  Locally over the base, the tautological root, divided by a local base volume form,
    gives a relative meromorphic top form $tau$ on the cover. It belongs to a fixed character of the cyclic group.
    The klt condition makes its squared volume locally integrable, including after resolution,
    so it extends holomorphically: a meromorphic top form with a divisorial pole cannot be locally square
    integrable. To see the orders directly, consider a boundary prime on the original normal fiber with
    coefficient $u = p \/ e in \( 0 \, 1 \)$ in lowest terms.
    At a general point the cover has local coordinate $x = y^e$, and the pulled-back root form has order
  #[#set math.equation(numbering: n => "(4.5)")
   $ e - 1 - e u = e - 1 - p in { 0 \, dots.h \, e - 2 } . $ <adj:root-order>]
  Away from the boundary its order at a nonexceptional prime is zero.
    The corresponding calculation on a crepant resolution uses coefficients less than one and proves integrability
    at exceptional divisors as well.
  Suppose that $tau'$ is another holomorphic top form of the same character on a fiber.
    The ratio $tau' \/ tau$ is an invariant meromorphic function and descends to the original normal connected
    fiber. A pole along a boundary prime downstairs would pull back with order at least $e$,
    whereas (4.5) permits only $e - 2$ zeros of $tau$. No such pole is possible.
    Away from the boundary, $tau$ has no divisorial zeros downstairs.
    Normality extends the ratio across codimension two, and compactness makes it constant.
    This also handles a disconnected cover, since the full root group acts transitively on its components over a
    connected fiber. The highest Hodge piece of the chosen character is therefore one-dimensional.
  Finally, changing a local frame of $m b^(*) H$ changes the root by an $m$th root of the corresponding base
    factor; changing the base volume form contributes the inverse canonical transition.
    Taking the $m$th tensor power removes the finite root ambiguities.
    These are precisely the transitions of $m \( b^(*) H - K_S \)$, proving the asserted identity on $S^compose$. ◻
]

#thm([Lemma 4.4.])[
  (Extension across the discriminant).  #emph[The parabolic extension of the eigenline in Lemma 13 is $L_S$ of
    (4.4). This identification persists on higher smooth base models with simple normal crossing complement.]
] <adj:extension>

#proof[
  Fix a general point of a prime $Q_0 = \( t = 0 \)$ on $S$.
    We normalize the root form by a nonvanishing local frame of $b^(*) H - K_S$.
    More explicitly, if the meromorphic section of $m b^(*) H$ chosen in Lemma 13 is $a$ times a nonvanishing
    local frame, divide its root by $a^(1 \/ m)$ and by the local base volume form.
    This is an ordinary frame after a finite power substitution;
    the finite ambiguity is precisely part of the parabolic convention.
    Thus zeros or poles of the chosen meromorphic base section do not enter the following exponent.
    Tangential base coordinates may be treated as parameters. On a log resolution,
  $ t = product_(i = 1)^k x_i^(a_i) $
  up to a nowhere-zero factor, and the squared absolute root form has vertical density factors $\|
    x_i \|^(- 2 u_i)$. Horizontal boundary factors are integrable because their coefficients are less than one.
    The squared Hodge norm of the relative form is its fiber integral.
    Writing $s_i = - log \| x_i \|$, the integral is computed on slices
  $ sum_i a_i s_i = - log \| t \| $
  with exponential weight $exp \( - 2 sum_i \( 1 - u_i \) s_i \)$.
    Conversion to the ordinary base area element contributes $\| t \|^(- 2)$.
    The minimum in (4.3) thus gives constants $C \, N > 0$ such that, on a sufficiently small punctured disk,
  #[#set math.equation(numbering: n => "(4.6)")
   $ C^(- 1) \| t \|^(2 \( t_(Q_0) - 1 \)) \( - log \| t \| \)^(- N) lt.eq parallel tau parallel^2 lt.eq
     C \| t \|^(2 \( t_(Q_0) - 1 \)) \( - log \| t \| \)^N . $ <adj:norm-power>]
  Indeed, the slice has at most polynomial volume in $- log \| t \|$,
    which proves the upper estimate after factoring out the least exponential decay.
    For the lower estimate take a chart along a component attaining the minimum,
    away from all other vertical components, and integrate over a fixed compact set in the remaining directions.
    Compactness allows finitely many charts; the integrable horizontal factors do not alter the power of $\| t \|$.
  After a local power substitution making monodromy unipotent,
    extending Hodge frames and their duals have norms bounded by powers of $- log \| t \|$.
    These are the nilpotent-orbit estimates of Schmid and Cattani–Kaplan–Schmid #cite(label("Schmid"))
    #cite(label("CKS")), in the form used in #cite(label("LI")) Section 4.1.
    Consequently the comparison between a frame of $b^(*) H -
    K_S$ and an extending Hodge frame has rational order $t_(Q_0) - 1$.
    Multiplication by $t^(1 - t_(Q_0))$, on a cover where this power is integral, removes exactly that order.
    Both the corrected comparison and its inverse have at most logarithmic growth.
    A holomorphic function on a punctured disk with such growth has no pole;
    applying this to the inverse excludes a zero. The same argument with tangential parameters extends the
    identification across each divisor, and normal extension treats codimension two. Thus the extending line is
  $ b^(*) H - K_S + sum_(Q_0) \( t_(Q_0) - 1 \) Q_0 = L_S . $
  For the last assertion, first make the boundary monodromies unipotent.
    In canonical extending frames a local monomial pullback $t_i =
    upright("unit") dot.op product_j s_j^(a_(i j))$ replaces the commuting nilpotent residues $N_i$ by $sum_i
    a_(i j) N_i$, which are again nilpotent. Both the canonical flat extension and its extending Hodge filtration
    therefore pull back without an additional divisor. Descending with rational weights incorporates the
    finite-monodromy parts and gives the same conclusion for the parabolic line,
    including exceptional base divisors; see #cite(label("LI")) Section 4. ◻
]

We have now identified the moduli line with an extreme Hodge line,
  so Lemma 12 makes it nef and gives an actual line descent.
  To obtain a big line on the quotient, we must compare the variation seen by this one line with that seen by the
  whole family. Effectivity of the original boundary is decisive in this comparison.

=== 4.3 The line detects the full period rank <the-line-detects-the-full-period-rank>

#thm([Lemma 4.5.])[
  (Equality of period ranks).  #emph[For the family of Lemma 13,
    the line period map of its root eigenline and the full period map of $R^l h_(*)
    bb(R)$ have the same generic differential rank.]
] <adj:rank>

#proof[
  Work in an open patch on which the ranks are constant, and let $xi$ be a holomorphic base vector field in the
    kernel of the line period map. Choose a local frame $tau$ of the eigenline,
    viewed as a relative top form on $V^compose$. The infinitesimal period formula says that contraction with
    $tau$ sends the Kodaira–Spencer class of $xi$ to zero in the fiber cohomology $H^1 \( Omega^(l - 1) \)$.
  Here is the corresponding lifting construction. Pull back the tangent sequence to the line generated by $xi$ and
    push it out along
  $ T_(V^compose \/ S^compose) arrow.r T_(V^compose \/ S^compose) ⊗ K_(V^compose \/ S^compose) tilde.eq
    Omega_(V^compose \/ S^compose)^(l - 1) \, wide v mapsto iota_v tau . $
  Write $U$ for a sufficiently small Stein base patch and put $cal(F) = Omega_(V_U \/ U)^(l - 1)$.
    The pushed-out extension is
  $ 0 arrow.r cal(F) arrow.r cal(E) arrow.r cal(O)_(V_U) arrow.r 0 \, $
  with class in $H^1 \( V_U \, cal(F) \)$. Shrink within the generic locus so that $R^1 h_(*)
    cal(F)$ is locally free and coherent base change holds. The contraction formula makes the image of this class
    in $H^0 \( U \, R^1 h_(*) cal(F) \)$ zero. The Leray exact sequence and the vanishing
    $H^1 \( U \, h_(*) cal(F) \) = 0$ show that $H^1 \( V_U \, cal(F) \) arrow.r
    H^0 \( U \, R^1 h_(*) cal(F) \)$ is injective. The extension class is therefore zero,
    and a holomorphic splitting exists on the entire $V_U$. Where $tau$ is nonzero,
    divide the vertical part of the splitting by $tau$. This gives a meromorphic vector field $tilde(xi)$ on the
    resolved cover projecting to $xi$, with poles bounded by the zero divisor of $tau$.
    Average it under the root group. Its projection remains $xi$, and the averaged field is invariant.
  We check this field at codimension-one points of the original normal total space.
    At a boundary prime use the ramification coordinate $x = y^e$ from (4.5).
    A tangential coefficient of an invariant vector field has Laurent exponents congruent to zero modulo $e$.
    Its permitted pole order is at most $e - 2$, so every exponent is nonnegative.
    The coefficient of $partial \/ partial y$ has exponents congruent to one modulo $e$.
    Its first possible negative exponent is $1 - e$, which is again excluded.
    The normal coefficient is therefore divisible by $y$. Thus the descended vector field is holomorphic and
    tangent to the boundary. At a prime outside the boundary the root form has no zero, and the conclusion is immediate.
  The resolution is an isomorphism at the codimension-one points just used.
    Remaining exceptional divisors map into codimension at least two in the original normal space.
    Holomorphic derivations extend across that subset, so the descended field is holomorphic everywhere on the
    family over our base patch and still projects to $xi$. Its local flow preserves the boundary components,
    their coefficients, and the singular locus. By the functorial choice made above,
    the flow first lifts to $X$ and preserves its crepant boundary $D_X$.
  This flow then lifts holomorphically to the root cover. Indeed,
    on the good base patch the defining pluriform has divisor exactly the negative multiple of the boundary.
    Pullback by a pair-preserving flow gives a pluriform with the same divisor.
    Their ratio is a holomorphic unit on the normal space; its $m$th root can be chosen starting at one in the
    flow parameter. The root normalized at flow time zero is unique as a germ.
    Thus the local cover lifts agree on overlaps of the unbranched open and glue by normality.
    Functorial resolution then lifts the flow to $V^compose$.
    Consequently the Kodaira–Spencer class of the resolved family vanishes on $xi$,
    and so does its full period differential. The reverse kernel inclusion holds because the line is part of the
    full Hodge filtration. The two kernels, and therefore the generic ranks, are equal. ◻
]

The argument is the analytic counterpart of Ambro’s infinitesimal comparison #cite(label("Ambro"))
  Proposition 2.1. Notice exactly where it uses $D gt.eq 0$:
  the strict pole bound in (4.5) is imposed at primes of the original pair.
  Negative crepant exceptional coefficients are allowed because their images have codimension at least two.

=== 4.4 Replacing the moduli line by a klt boundary <replacing-the-moduli-line-by-a-klt-boundary>

#proof[
  Apply Lemma 12 to the variation of Lemma 13. Its monodromy is quasi-unipotent by the monodromy theorem for this
    proper Kähler family #cite(label("Schmid")). Lemma 14 identifies its parabolic line with $L_S$.
    Passing to the indicated higher smooth projective model, and keeping the notation $S$, we have
  $ L_S tilde.op_(bb(Q)) p^(*) P $
  for a nef rational line $P$ on a smooth projective quotient $Q$.
    Let $r$ be the generic rank of the line period map. Numerical dimension of a nef line is unchanged by a
    surjective pullback, so
  $ r = nu \( L_S \) = nu \( P \) lt.eq dim Q lt.eq "rank" \( d Phi \) = r \, $
  where $Phi$ is the full period map and the last equality is Lemma 15. Thus $P$ is big if $dim Q > 0$.
    If $Q$ is a point, $L_S$ is rationally trivial.
  Suppose first that $dim Q > 0$. By Kodaira’s lemma write $P tilde.op_(bb(Q)) A + E$,
    with $A$ ample rational and $E gt.eq 0$ rational. For every small positive rational $epsilon$,
  #[#set math.equation(numbering: n => "(4.7)")
   $ P tilde.op_(bb(Q)) A_epsilon + epsilon E \, wide A_epsilon = \( 1 - epsilon \) P + epsilon A quad
     upright("ample") . $ <adj:small-fixed-part>]
  The pair $\( S \, Delta_S \)$ is sub-klt. On a fixed log resolution of $Delta_S + p^(*) E$,
    choose $epsilon$ sufficiently small that $\( S \, Delta_S + epsilon p^(*) E \)$ remains sub-klt.
    Choose a sufficiently large divisible integer $N$ and a general member $G in \| N A_epsilon \|$.
    The system $\| N p^(*) A_epsilon \|$ is basepoint-free; on that resolution its general member meets the fixed
    boundary transversely. Taking $N$ large makes its coefficient $1 \/ N$ less than one.
    Bertini therefore gives an effective rational divisor
  $ E_S = epsilon p^(*) E + 1 / N p^(*) G tilde.op_(bb(Q)) L_S $
  with $\( S \, Delta_S + E_S \)$ sub-klt. In the point case take $E_S = 0$. In either case,
  #[#set math.equation(numbering: n => "(4.8)")
   $ K_S + Delta_S + E_S tilde.op_(bb(Q)) b^(*) H . $ <adj:upstairs-presentation>]
  Set $D_Z = b_(*) \( Delta_S + E_S \)$. This divisor is effective.
    Indeed, for each prime of the original normal base, some component of its pullback on $Y$ dominates it.
    That component has multiplicity $a gt.eq 1$ and boundary coefficient $u gt.eq 0$,
    so its threshold is at most $\( 1 - u \) \/ a lt.eq 1$. Thus the coefficient of the discriminant at every
    nonexceptional base prime is nonnegative, and $E_S$ is effective.
  Choose compatible canonical divisors and a rational Cartier divisor representing $H$.
    The line identity (4.8) gives an integer $m > 0$ and a rational function $phi$ in the common function field of
    $S$ and $Z$ such that
  $ K_S + Delta_S + E_S - b^(*) H = 1 / m "div"_S \( phi \) . $
  Pushing down gives
  $ K_Z + D_Z - H = 1 / m "div"_Z \( phi \) . $
  In particular, $K_Z + D_Z$ is rational Cartier and rationally linearly equivalent to $H$.
    Pulling the latter divisor equality back and comparing with the former proves the crepant identity
  $ K_S + Delta_S + E_S = b^(*) \( K_Z + D_Z \) . $
  Since the pair upstairs is sub-klt, the effective pair $\( Z \, D_Z \)$ is klt. This proves the proposition. ◻
]

== 5 Nef classes in algebraic dimension zero <sec:zero>

A semiample line bundle on a space of algebraic dimension zero is rationally trivial.
  The induction therefore requires a stronger conclusion in this case:
  the additional nef class must itself vanish. The ordinary adjoint decomposition reduces this assertion to a
  question about nef line bundles on simple manifolds. We first carry out that geometric reduction.
  The remaining argument adapts the meromorphic nonvanishing construction of #cite(label("K")) Section 6 to a line
  bundle that need not be canonical.

#thm([Proposition 5.1.])[
  #emph[Let $n gt.eq 1$. Assume that the algebraic-dimension-zero assertion of Theorem 2 holds in every dimension
    less than $n$. Let $T$ be a smooth connected compact Kähler $n$-fold with $a \( T \) = 0$,
    and let $B$ be an effective rational simple normal crossing boundary with coefficients less than one.
    If $K_T + B$ is pseudo-effective, then every nef rational holomorphic line bundle $M$ on $T$ satisfies
    $c_1 \( M \) = 0$.]
] <zero:vanishing>

For intersections in this Section, a line bundle and its first Chern class are distinguished when necessary by
  braces: ${ H } = c_1 \( H \)$. An inequality between real $\( 1 \, 1 \)$-classes is in pseudo-effective order.
  A compact manifold is #emph[simple] if no positive-dimensional proper compact analytic subvariety passes through
  a very general point. Here, as usual, “very general” permits deletion of a countable union of proper analytic subsets.

=== 5.1 Reduction to a simple symplectic manifold <reduction-to-a-simple-symplectic-manifold>

The following elementary intersection test lets us use finite covers without requiring the nef line bundle to
  descend through them.

#thm([Lemma 5.2.])[
  #emph[Let $V$ be a smooth compact Kähler $n$-fold, where $n gt.eq 1$, and let $gamma$ be a nef class,
    and let $C$ be a nef and big class. If $gamma dot.op C^(n - 1) = 0$, then $gamma = 0$.
    In particular, if $V$ admits a generically finite surjective morphism to a complex torus of algebraic
    dimension zero, every nef rational line class on $V$ is zero.]
] <zero:mass-test>

#proof[
  Choose a Kähler class $omega$ and $epsilon > 0$ such that $C - epsilon omega$ is pseudo-effective.
    When $n gt.eq 2$, the identity
  $ C^(n - 1) - \( epsilon omega \)^(n - 1) = \( C - epsilon omega \) sum_(j = 0)^(n - 2)
    C^(n - 2 - j) \( epsilon omega \)^j $
  and nonnegativity of intersections of a pseudo-effective class with nef classes give
  $ 0 = gamma dot.op C^(n - 1) gt.eq epsilon^(n - 1) gamma dot.op omega^(n - 1) gt.eq 0 . $
  The same conclusion is immediate when $n = 1$. A positive current in $gamma$ thus has zero mass, so it vanishes.
  For the last assertion, write $f : V arrow.r A$ for the morphism.
    The pushforward of the nef rational line class is a rational pseudo-effective $\( 1 \, 1 \)$-class on $A$.
    Averaging a positive current under translations represents it by a constant semipositive form.
    The kernel of a rational such form is the tangent space of a subtorus; the induced positive integral form,
    after clearing denominators, polarizes the quotient. Since $a \( A \) = 0$, this quotient is a point,
    and hence $f_(*) gamma = 0$. For a Kähler class $eta$ on $A$, the class $C = f^(*) eta$ is nef and big and
  $ gamma dot.op C^(n - 1) = \( f_(*) gamma \) dot.op eta^(n - 1) = 0 . $
  Apply the first assertion. ◻
]

#thm([Lemma 5.3.])[
  #emph[Under the induction hypothesis of Proposition 16, it suffices to prove the following assertion:
    every nef rational line class on a smooth simple compact Kähler manifold of algebraic dimension zero carrying
    a generically nondegenerate holomorphic two-form is zero.]
] <zero:geometric-reduction>

#proof[
  Apply the ordinary good divisorial decomposition to $K_T + B$.
    On a smooth modification its semiample part is rationally trivial, because $a \( T \) = 0$.
    After the klt modification convention of Section 2, the resulting ordinary adjoint still equals its rational
    negative divisor as an actual rational line bundle. The contraction of a known negative part #cite(label("K"))
    Theorem 2.13 and Proposition 3.8, with nef part zero, produces an ordinary compact Kähler klt pair
    $\( T_0 \, B_0 \)$ such that $K_(T_0) + B_0 tilde.op_(bb(Q)) 0$.
  The decomposition theorem of Matsumura–Wang–Wu–Zhang #cite(label("BBYv2")) Corollary 1.4 applies to this pair:
    its nef b-part is zero. A finite quasi-étale cover of $T_0$ is a product of a rationally connected factor,
    strict Calabi–Yau factors, irreducible holomorphic symplectic factors, and a torus.
    Algebraic dimension is unchanged by proper generically finite maps and by modifications.
    No positive-dimensional rationally connected factor can occur,
    since a Kähler resolution of such a factor is projective by algebraic connectedness
    #cite(label("Campana1981")). A strict Calabi–Yau factor of dimension at least three has no holomorphic
    two-forms. Extension of forms for klt spaces #cite(label("KebekusSchnell2021")) gives the same vanishing on a
    resolution, which is projective by Kodaira’s criterion. Such factors are also excluded.
    Dimension-two factors of Calabi–Yau type are counted among the symplectic factors.
    A resolution of an irreducible symplectic factor has $h^(2 \, 0) = 1$,
    generated by a generically nondegenerate form.
  Resolve the cover and the maps to $T$ and to smooth models of all its factors.
    We obtain a smooth compact Kähler manifold $V$, with the pulled-back nef line class $gamma$,
    mapping generically finitely to $T$ and to a product $X_1 times dots.h.c times X_r$.
    If $r gt.eq 2$, let $C$ be the pullback of a sum of Kähler classes from the factors.
    For the projection omitting $X_i$, every component of a smooth general fiber maps generically finitely to
    $X_i$. This fiber has algebraic dimension zero and a nonzero top form,
    obtained by pulling back either a torus volume form or a power of a symplectic form.
    Its canonical class is therefore pseudo-effective. Its dimension is less than $n$,
    so the induction hypothesis, with zero boundary, makes the restriction of $gamma$ zero.
  Expand $C^(n - 1)$. A nonzero term has top powers from all factors except one,
    where precisely one power is missing. Integration over the fibers just considered shows that its pairing with
    $gamma$ is zero. Thus $gamma dot.op C^(n - 1) = 0$, and Lemma 17 gives $gamma = 0$.
    Vanishing descends to $T$ by push–pull for a generically finite map.
    A single torus factor is covered by the last assertion of that lemma.
  It remains to consider one symplectic factor. On a smooth model $X$ we have $a \( X \) =
    0$ and $H^0 \( X \, Omega_X^2 \) = bb(C) sigma$, with $sigma$ generically nondegenerate.
    There is no dominant meromorphic fibration from $X$ to an intermediate-dimensional compact base.
    Indeed, on smooth Kähler models such a base has algebraic dimension zero,
    hence is nonprojective and has a nonzero holomorphic two-form by Kodaira’s criterion.
    Its pullback would be a nonzero degenerate holomorphic two-form on $X$, which is impossible.
  The minimal-fibration theorem of Campana, in the form #cite(label("COP")) Theorem 2.3(3) and Corollary 2.5(2),
    now says that $X$ is isotypically semi-simple. This means that $X$ and a power $S^r$ of a simple manifold have
    a common generically finite cover; we may take smooth Kähler models.
    If $r gt.eq 2$, repeat the preceding product intersection argument. The smaller-dimensional fibers are simple:
    simplicity is preserved by generically finite maps between spaces of algebraic dimension zero.
    Indeed, a covering family of proper subvarieties upstairs or downstairs gives such a family on the other space
    by images or inverse images at points where the map is finite;
    the countability of compact cycle components gives the very general formulation.
    They are not uniruled, and hence their canonical bundles are pseudo-effective by #cite(label("Ou"))
    Theorem 1.1. The induction hypothesis again applies. If $r = 1$,
    the common smooth cover is simple and carries the pullback of $sigma$,
    a generically nondegenerate holomorphic two-form. This is precisely the assertion stated in the lemma. ◻
]

=== 5.2 Finite correspondences and cotangent slopes <finite-correspondences-and-cotangent-slopes>

We next isolate the two geometric properties needed for the nonvanishing argument.
  The first controls subvarieties of a product; the second controls line subsheaves of cotangent tensors.

#thm([Lemma 5.4.])[
  #emph[Let $X$ be a smooth simple compact Kähler manifold of algebraic dimension zero,
    carrying a generically nondegenerate holomorphic two-form.
    Suppose that every smooth connected compact Kähler manifold mapping generically finitely onto $X$ has
    irregularity zero. Through a very general point of $X^2$,
    the only positive-dimensional proper irreducible compact analytic subvarieties are the two factor slices.]
] <zero:no-correspondences>

#proof[
  Fix a generically nondegenerate holomorphic two-form $sigma$ on $X$.
    A moving correspondence would produce a holomorphic one-form on a fixed finite cover of $X$.
    To see this, we identify its first projection with a fixed finite cover over a parameter ball,
    and then contract the pulled-back two-form in a direction varying the second projection.
  For a subvariety through a pair whose coordinates are very general,
    simplicity makes each projection image either a point or all of $X$.
    If both projections dominate, their fibers through general points are either zero-dimensional or the full
    other factor. A proper such subvariety must therefore be a generically finite correspondence.
  Suppose these correspondences sweep $X^2$. The compact cycle spaces of a compact Kähler manifold have countably
    many compact irreducible components #cite(label("LiebermanCycles")).
    One component must have incidence image equal to $X^2$. Resolve that component and the relevant incidence
    component, obtaining a compact Kähler parameter space $S$, a smooth incidence space $Y$, and maps
  $ h : Y arrow.r S \, wide F_1 \, F_2 : Y arrow.r X . $
  For a general parameter, the fiber is smooth and irreducible,
    and each $F_i$ restricts to a generically finite map. The map $\( F_1 \, h \) : Y arrow.r X times
    S$ is generically finite. Its normal finite Stein factor is a finite cover of the smooth product.
  By purity, the branch locus of this cover is divisorial. Every branch component dominating $S$ has a proper
    image in $X$: otherwise its divisorial fibers over $S$ would sweep $X$, contradicting simplicity.
    Compactness of $S$ makes these images closed analytic subsets.
    Remove the images in $S$ of the remaining branch components and take a small ball $B$ about a general
    parameter. There is a fixed proper analytic subset $A subset
    X$ such that the cover is étale over $\( X \\ A \) times B$.
    Since $B$ is simply connected, this étale cover is pulled back from a fixed cover of $X \\ A$.
    Normalize $X$ in that cover. Uniqueness of normal finite extension then identifies the cover over $X times
    B$ with the product of this fixed normal cover and $B$; see #cite(label("SGA1")) Exposé XII,
    Proposition 5.3 and Theorem 5.4.
  Let $tilde(X)$ be a smooth Kähler resolution of the fixed cover.
    The second projection gives a meromorphic map $G : tilde(X) times B arrow.r.dashed X$.
    The pullback $G^(*) sigma$ is a holomorphic two-form: resolve the meromorphic map and descend holomorphic
    forms across a modification of a smooth space. Dominance of $\( F_1 \, F_2 \)$ implies that,
    at suitable general points, the derivatives of $G$ in the parameter directions span $T_X$,
    while the derivative along $tilde(X)$ is an isomorphism. Choose a constant tangent vector on $B$ for which
    this parameter derivative is nonzero at such a point. Contracting $G^(*)
    sigma$ with that vector and restricting to $tilde(X) times
    { t }$ yields a nonzero global holomorphic one-form on $tilde(X)$. This contradicts the hypothesis on irregularity.
  Each component parametrizing generically finite correspondences thus has proper incidence image.
    Their countable union misses a very general pair, proving the assertion. ◻
]

#thm([Lemma 5.5.])[
  #emph[Let $X$ be a smooth simple compact Kähler manifold of dimension $n gt.eq 2$,
    algebraic dimension zero and irregularity zero, and suppose $K_X$ is pseudo-effective.
    Let $cal(L)$ be a holomorphic line bundle such that $L = c_1 \( cal(L) \) gt.eq
    c_1 \( K_X \)$ in pseudo-effective order. For every nonzero map $cal(H) arrow.r Omega_X^(⊗ k)$,
    where $cal(H)$ is a line bundle and $k gt.eq 0$,
#[#set math.equation(numbering: n => "(5.1)")
 $ c_1 \( cal(H) \) lt.eq k L . $ <zero:slope-X>]

 For every very general $x in X$, write $a : Y = "Bl"_x X arrow.r X$.
   Every nonzero line map $cal(H)_Y arrow.r \( a^(*) Omega_X \)^(⊗ k)$ satisfies
#[#set math.equation(numbering: n => "(5.2)")
 $ c_1 \( cal(H)_Y \) lt.eq k a^(*) L . $ <zero:slope-blowup>]

 The exceptional set of points can be chosen simultaneously for all $cal(H)_Y$ and $k$.]
] <zero:cotangent-slope>

#proof[
  We give the slope argument from #cite(label("K")) Lemma 6.2,
    indicating why it does not require any hypothesis about canonical sections.
    Let $gamma$ belong to the full dual of the pseudo-effective cone.
    Ou’s convention calls precisely these classes movable, and Harder–Narasimhan filtrations exist for them
    #cite(label("Ou")) Definition 4.2 and Lemma 4.3. If the minimum $gamma$-slope of $Omega_X$ were negative,
    the first Harder–Narasimhan subsheaf $cal(T) subset T_X$ would have positive slope and be semistable.
    Tensor slope inequalities make its bracket into $T_X \/ cal(T)$ zero, so it is a foliation.
    Its dual has negative maximum slope and is non-pseudo-effective.
    By #cite(label("Ou")) Theorem 1.4, Lemmas 4.3–4.4 and Proposition 4.5,
    its leaves have compact closures given by a meromorphic fibration.
    The rank of $cal(T)$ is strictly less than $dim X$, since $c_1 \( T_X \) dot.op gamma lt.eq 0$.
    A general leaf closure contradicts simplicity.
  All Harder–Narasimhan quotient slopes of $Omega_X$ are consequently nonnegative,
    and its maximum slope is at most $c_1 \( K_X \) dot.op gamma$. Tensor slopes give
  $ c_1 \( cal(H) \) dot.op gamma lt.eq k c_1 \( K_X \) dot.op gamma lt.eq k L dot.op gamma . $
  Separation by the dual cone proves (5.1).
  Irregularity zero embeds $"Pic" \( X \)$ in the countable group $H^2 \( X \, bb(Z) \)$.
    For any vector bundle on $X$, linearly independent global sections are generically pointwise independent:
    the coefficients expressing one section in a maximal pointwise independent subfamily are meromorphic
    functions, hence constants because $a \( X \) = 0$. Evaluation is therefore injective outside a proper
    analytic subset. Apply this simultaneously to $cal(H)^(- 1) ⊗ Omega_X^(⊗ k)$ for all lines $cal(H)$ and all $k$.
  For a point outside the resulting countable exceptional union, write $cal(H)_Y =
    a^(*) cal(H) ⊗ cal(O)_Y \( m F \)$, where $F$ is the exceptional divisor.
    A nonzero map as in the statement extends away from $F$ to a section on $X$ by Hartogs.
    If $m > 0$, that section vanishes at $x$, because $a_(*) cal(O)_Y \( - m F \) = cal(I)_x^m$,
    contrary to injectivity of evaluation. Thus $m lt.eq 0$, and (5.1) proves (5.2). ◻
]

=== 5.3 Meromorphic nonvanishing from cotangent slope bounds <meromorphic-nonvanishing-from-cotangent-slope-bounds>

The next proposition extracts the line-bundle content of the construction in #cite(label("K")) Section 6.
  Its hypotheses deliberately separate cotangent slopes from the identity of the chosen line bundle.
  This is what permits the application to the sum of the canonical bundle and a nef line bundle.

#thm([Proposition 5.6.])[
  #emph[Let $X$ be a smooth simple compact Kähler manifold of dimension $n gt.eq 2$, with $a \( X \) =
    0$ and irregularity zero. Assume that the only positive-dimensional proper compact irreducible analytic
    subvarieties through a very general point of $X^2$ are its factor slices.
    Let $cal(L)$ be a holomorphic line bundle with pseudo-effective class $L$.
    Assume the following line-subsheaf bounds:]
  + #emph[For every line bundle $cal(H)$, every integer $k gt.eq 0$, and every nonzero map $cal(H) arrow.r
    Omega_X^(⊗ k)$, one has $c_1 \( cal(H) \) lt.eq k L$.]
  + #emph[Outside a countable union of proper analytic subsets of $X$, every point $x$ has this property:
    if $a : Y = "Bl"_x X arrow.r X$, then for every line bundle $cal(H)_Y$, every $k gt.eq 0$,
    and every nonzero map $cal(H)_Y arrow.r \( a^(*) Omega_X \)^(⊗ k)$, one has $c_1 \( cal(H)_Y \) lt.eq k a^(*) L$.]
  #emph[Then some positive power of $cal(L)$ has a nonzero meromorphic section.]
] <zero:line-nonvanishing>

We prove the proposition by comparing point poles with vanishing along a diagonal.
  Assume, throughout the proof, that no positive power of $cal(L)$ has a nonzero meromorphic section.
  A normalized big class on $X$ has bounded pole order at a very general point.
  On the rank-two projective bundle over $X^2$ formed from the two pullbacks of $cal(L)$,
  a class of growing volume produces a large family of symmetric cotangent tensors.
  The diagonal in $X^2$ forces a large common vanishing order in their determinant.
  The slope inequalities then turn that vanishing into an impossible point pole on $X$.

The proof below follows the volume and two-diagonal construction of #cite(label("K")) results 6.3–6.10.
  We retain its analytic estimates and give their proofs along with the determinant calculations,
  so that the chosen line bundle enters only through the hypotheses stated above.

==== 5.3.1 Point pole thresholds <point-pole-thresholds>

We will use several standard facts about volumes of real $\( 1 \, 1 \)$-classes.
  Our normalization is $"vol" \( alpha \) = integral alpha^e$ for a nef class on an $e$-fold.
  Volume is continuous, homogeneous, monotone in pseudo-effective order, invariant under modification,
  and its $e$-th root is concave on the big cone. Analytic Fujita approximation computes it by Kähler parts on
  smooth projective modifications. Here a #emph[smooth projective modification] means a projective modification
  whose source is smooth; the sources used here are compact Kähler manifolds obtained by resolving coherent
  analytic ideals. For a smooth irreducible divisor $D$ and a big class $alpha$,
  write $"vol"_(thin \| D) \( alpha \)$ for the numerical restricted volume.
  It is zero when $D$ is contained in the non-Kähler locus #cite(label("Vu2023")) Theorem 1.1;
  otherwise it is the supremum of the masses on $D$ of restrictions of Kähler currents with analytic singularities
  that are not generically singular on $D$ #cite(label("CollinsTosatti2018")) Lemma 2.7.
  The divisorial derivative and its continuity on the big cone are

#[#set math.equation(numbering: n => "(5.3)")
 $ frac(upright(d), upright(d) u) "vol" \( alpha - u { D } \) = -
   e thin "vol"_(thin \| D) \( alpha - u { D } \) \; $ <zero:volume-derivative>]

see #cite(label("Vu2023")) Theorem 1.1. We apply this formula only on smooth manifolds while the varying class is big.

Here is a useful precise form of the approximation in the restricted volume formula.
  Resolve the log-ideal singularities of a current restricted to $D$.
  Its pullback is an effective real divisor plus a positive residual current with locally bounded potentials.
  The latter dominates a positive multiple of the pulled-back Kähler form.
  A current with locally bounded potentials has zero Lelong numbers, so Demailly regularization makes its class,
  after subtracting that multiple, nef #cite(label("DemaillyRegularization1992")) Theorem 1.1.
  On a projective modification there is an effective exceptional divisor whose negative is relatively ample.
  Subtracting a sufficiently small multiple of this divisor from the residual class therefore makes that class
  Kähler; add the same multiple to the divisor part. Round all divisor coefficients slightly upwards to rational
  numbers. Openness of the Kähler cone preserves the Kähler property.
  These changes can be arbitrarily small in top intersections,
  which compute the original mass by the bounded-potential product formula. Thus we may approximate a restricted mass by

#[#set math.equation(numbering: n => "(5.4)")
 $ h^(*) \( alpha \|_D \) = beta + { D' } \, wide beta med upright("Kähler") \, quad D' gt.eq 0 med
   upright("a rational divisor") . $ <zero:rational-fujita>]

Moreover, $D'$ has at least the log-ideal orders of the original restriction on every further resolution.
  We will use this last property to turn poles into vanishing conditions.
  Only $D'$ is made rational; the class $beta$ and the horizontal part of $alpha$ remain real.

#thm([Lemma 5.7.])[
  (A point pole bound).  #emph[Let $W$ be a smooth compact Kähler manifold of dimension $e gt.eq 2$,
    $alpha$ a big real $\( 1 \, 1 \)$-class, and $z in W$. Suppose a smooth projective modification $mu :
    W' arrow.r W$, which is an isomorphism near $z$, admits a decomposition
$ mu^(*) alpha = K + { D } \, wide K med upright("Kähler") \, quad D gt.eq 0 \, $

 where $D$ misses the point $z'$ over $z$. If the ordinary analytic Seshadri constant $epsilon.alt \( K \, z' \)$
   is at least $eta > 0$, then, on the blowup $b : hat(W) = "Bl"_z W arrow.r W$ with exceptional divisor $G$,
#[#set math.equation(numbering: n => "(5.5)")
 $ sup { u gt.eq 0 : b^(*) alpha - u { G } gt.eq 0 } lt.eq eta / 2 +
   2^(e - 1) "vol" \( alpha \) eta^(- \( e - 1 \)) . $ <zero:pole-formula>]

]
] <zero:pole-threshold>

#proof[
  Set $u_0 = eta \/ 2$. Blowing up $z'$, the class $K - u_0 { G' }$ is Kähler.
    The Fujita decomposition is unchanged near $G'$, so it supplies a Kähler current for $alpha_(u_0) =
    b^(*) alpha - u_0 { G }$ that is smooth near $G$. Its restriction there has class $u_0
    c_1 \( cal(O)_(bb(P)^(e - 1)) \( 1 \) \)$. The restricted volume is consequently $u_0^(e - 1)$:
    the current gives this lower bound, and the volume of the restricted class gives the opposite bound.
  Let $tau$ denote the left side of Equation (5.5). The classes $alpha_u = b^(*) alpha -
    u { G }$ are big for $0 lt.eq u < tau$, since $alpha_0$ is big and the pseudo-effective cone is convex.
    The concave function $f \( u \) = "vol" \( alpha_u \)^(1 \/ e)$ satisfies, by Equation (5.3),
  $ f' \( u_0 \) = - frac(u_0^(e - 1), f \( u_0 \)^(e - 1)) . $
  Its tangent line at $u_0$ must remain positive up to $tau$. Therefore
  $ tau lt.eq u_0 + frac(f \( u_0 \)^e, u_0^(e - 1)) lt.eq u_0 + frac("vol" \( alpha \), u_0^(e - 1)) \, $
  which is Equation (5.5). ◻
]

Fix a Kähler class $omega$ on $X$. The class $L$ is not big:
  a big holomorphic line bundle would make $X$ Moishezon, contrary to $a \( X \) = 0$. For $t > 0$ define

#[#set math.equation(numbering: n => "(5.6)")
 $ P = r \( L + t omega \) \, wide r = "vol" \( L + t omega \)^(- 1 \/ n) . $ <zero:normalization>]

Then $P$ is a big real class, $"vol" \( P \) = 1$, $L lt.eq P \/ r$, and $r arrow.r oo$ as $t arrow.b 0$.
  Choose a smooth Fujita model $mu : Y_P arrow.r X$ with Kähler part $P'$ satisfying

#[#set math.equation(numbering: n => "(5.7)")
 $ mu^(*) P = P' + { D_P } \, wide v := integral_(Y_P) \( P' \)^n > 1 / 2 . $ <zero:P-prime>]

At a very general point $y$ of this model there is no positive-dimensional proper subvariety:
  its image would be one through a very general point of $X$, and $y$ avoids the exceptional locus.
  The ordinary Seshadri formula for a Kähler class,

$ epsilon.alt \( K \, y \) = inf_(W in.rev y\
dim W > 0) (frac(integral_W K^(dim W), "mult"_y W))^(1 \/ dim W) \, $

therefore gives $epsilon.alt \( P' \, y \) = v^(1 \/ n) gt.eq 2^(- 1 \/ n)$.
  This is the ordinary nef/Kähler formula #cite(label("Tosatti2016")) Theorem 2.8;
  see also #cite(label("CollinsTosatti2018")) Equation (1.5) and the Kähler cone criterion of
  #cite(label("DemaillyPaun2004")). We use this ordinary formula in both applications below.
  Lemma 22, with $"vol" \( P \) = 1$, now yields a constant $C_n$ depending only on $n$ such that,
  for a very general $x$,

#[#set math.equation(numbering: n => "(5.8)")
 $ tau \( P \, x \) := sup { u gt.eq 0 : a^(*) P - u { F } gt.eq 0 } lt.eq C_n \, wide a : "Bl"_x X arrow.r
   X . $ <zero:point-bound>]

Here and below positive constants denoted $c_n \, C_n$ may be decreased or increased from one occurrence to the
  next. They are independent of all parameters and choices of currents and modifications.

==== 5.3.2 A projective bundle with controlled volume <a-projective-bundle-with-controlled-volume>

We now produce a class whose volume grows, while its point pole threshold grows much more slowly.
  On $X^2$, let $cal(L)_i$ and $L_i$ denote the pullbacks of $cal(L)$ and $L$ from the $i$-th factor.
  Use the quotient convention and put

$ pi : Z = bb(P)_(X^2) \( cal(L)_1 xor cal(L)_2 \) arrow.r X^2 \, wide xi = c_1 \( cal(O)_Z \( 1 \) \) \, wide d =
  dim Z = 2 n + 1 . $

Thus $pi_(*) cal(O)_Z \( m \) = "Sym"^m \( cal(L)_1 xor cal(L)_2 \)$ for $m gt.eq 0$.
  The zero divisor $A_i$ of $pi^(*) cal(L)_i arrow.r cal(O)_Z \( 1 \)$ has class $xi - L_i$;
  it is the section on which $xi$ restricts to $L_(3 - i)$. In particular $xi = { A_i } + L_i gt.eq 0$.

#thm([Lemma 5.8.])[
  #emph[For the projective bundle $Z$ just defined, the only positive-dimensional compact irreducible analytic
    subvarieties through a very general point are a fiber of $pi$,
    the full inverse images of the two factor slices, and $Z$ itself.]
] <zero:subvarieties>

#proof[
  The image of such a subvariety in $X^2$ is a point, a factor slice, or all of $X^2$,
    by the hypothesis of Proposition 21. Generic relative dimension one gives the full inverse image.
    Otherwise, except for a point, the subvariety is a multisection of the restricted projective line bundle.
    On the slice or product $S$, its divisor line is $cal(O) \( k \) ⊗ pi^(*) cal(H)$, with $k > 0$.
    Its homogeneous equation has coefficients in
  $ H^0 #scale(x: 120%, y: 120%)[\(] S \, cal(H) ⊗ cal(L)_1^(⊗ i) ⊗ cal(L)_2^(⊗ \( k - i \))
    #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq i lt.eq k . $
  A single nonzero monomial cuts out only axes and vertical divisors.
    A non-axis multisection therefore has two nonzero coefficients.
    Their quotient is a meromorphic section of a nonzero power of $cal(L)_1 ⊗ cal(L)_2^(- 1)$.
    Restricting to a general factor slice gives a meromorphic section of a nonzero power of $cal(L)$;
    inversion makes the power positive if necessary. This contradicts the standing contrary hypothesis.
    The axes avoid a very general point of $Z$, proving the lemma. ◻
]

Let $q$ tend to infinity through positive integers. For each sufficiently large $q$, choose $t =
  t \( q \)$ in Equation (5.6) so that $r = r \( q \) gt.eq q^2$, and use the resulting normalized class $P =
  P \( q \)$. Define the real class and the scale

#[#set math.equation(numbering: n => "(5.9)")
 $ M = P_1 + P_2 + q xi \, wide A_q = q^(1 \/ d) . $ <zero:M-definition>]

The quantitative goal can now be stated. On the blowup $a : "Bl"_x X arrow.r X$ of a very general point,
  with exceptional divisor $F$, we will produce a positive rational scale $s$ satisfying $c_n A_q lt.eq s lt.eq
  C_n A_q$ and

$ 2 a^(*) P + \( s + 2 q \) a^(*) L - c_n s { F } gt.eq 0 . $

Since $L lt.eq P \/ r$, this would imply

$ frac(c_n s, 2 + \( s + 2 q \) \/ r) lt.eq tau \( P \, x \) lt.eq C_n . $

The denominator stays bounded because $r gt.eq q^2$, while the numerator tends to infinity.
  To obtain the class inequality, the first diagonal will produce a subsheaf occupying a fixed positive fraction
  of a symmetric cotangent power. An incidence construction will then force its determinant to vanish to order
  proportional to $s$. We begin with the volume that supplies this rank fraction.

#thm([Lemma 5.9.])[
  #emph[For these choices, $M$ is big and
#[#set math.equation(numbering: n => "(5.10)")
 $ c_n q lt.eq "vol" \( M \) lt.eq C_n q \, wide tau \( M \, z \) := sup { u gt.eq 0 : b_z^(*) M - u { F_z } gt.eq
   0 } lt.eq C_n A_q $ <zero:M-bounds>]

 at a very general point $z in Z$, where $b_z : "Bl"_z Z arrow.r Z$ has exceptional divisor $F_z$.]
] <zero:two-slot-volume>

#proof[
  Pull $Z$ to the Fujita model $Y_P^2$ from Equation (5.7), and put $H = P'_1 + P'_2$ on this pulled-back bundle.
    There is a further smooth projective modification $nu : hat(Z) arrow.r
    bb(P)_(Y_P^2) \( mu^(*) cal(L)_1 xor mu^(*) cal(L)_2 \)$ and a Fujita decomposition of the pullback of $M$
    whose Kähler part is exactly
  #[#set math.equation(numbering: n => "(5.11)")
   $ K = 1 / 2 nu^(*) H + Theta \, $ <zero:exact-K>]
  where $Theta$ is Kähler and has degree $q$ on a general vertical line.
    The modification and the divisor part miss that line.
  Here is the construction. It suffices to decompose $H \/ 2 + q xi$ as $Theta$ plus an effective divisor,
    clean on a whole general vertical line. Since $cal(O) \( 1 \)$ is relatively ample,
    a small positive class of the form $delta \( xi + c H \)$ is Kähler for some $c > 0$.
    Choose $delta > 0$ so small that $delta < q$ and the remaining horizontal part of $H \/ 2$ is Kähler.
    Represent the remaining $xi$ first as ${ A_1 } + L_1$ and then as ${ A_2 } + L_2$.
    Regularize the pseudo-effective classes $L_i$ with analytic singularities,
    paying their arbitrarily small negative errors from that horizontal Kähler part.
    This gives two Kähler currents in $H \/ 2 + q xi$, each smooth off its own axis and a proper horizontal
    analytic set. The maximum of their potentials is locally bounded along an entire general vertical line,
    since the two axes are disjoint. Analytic regularization preserving a smaller Kähler lower bound
    #cite(label("Boucksom2004")) Theorem 2.1(ii) gives a Kähler current with analytic singularities missing that
    line. Resolve its singularities and make the small Kähler adjustment described before Lemma 22.
    The divisor still misses a general vertical line, so the residual class $Theta$ has degree exactly $q$ there.
    Adding the other half of $H$ and the pullbacks of the divisor parts $D_P$ gives Equation (5.11).
    Its two summands are nef, with $Theta$ Kähler, so every mixed intersection used in the following bounds is
    nonnegative.
  At a very general point of $hat(Z)$, Lemma 23 lists the possible positive-dimensional subvarieties:
    the vertical line, the strict transforms of the two full bundles over slices, and $hat(Z)$.
    They have multiplicity one there. By Equation (5.11) and nonnegativity of mixed intersections of nef classes,
    their top intersections are respectively bounded below by
  #[#set math.equation(numbering: n => "(5.12)")
   $ K dot.op \( upright("vertical line") \) & = q \,\
integral_(upright("slice")) K^(n + 1) & gt.eq frac(n + 1, 2^n) thin q v \,\
integral_(hat(Z)) K^d & gt.eq d / 2^(2 n) binom(2 n, n) thin q v^2 . $ <zero:K-intersections>]
  For example, the middle line is the term containing one factor $Theta$ and $n$ factors from the varying $P'$;
    pushforward of $Theta$ along a general vertical line is $q$.
    The last line is the term with one $Theta$ and $2 n$ horizontal factors.
    These intersections give $"vol" \( M \) gt.eq c_n q$. The ordinary Seshadri formula and $q gt.eq
    1$ give $epsilon.alt \( K \, z' \) gt.eq c_n q^(1 \/ d) = c_n A_q$ at a very general $z'$:
    each possible dimension is at most $d$, and every numerator in that formula is at least $c_n q$.
  For the upper bound, subtract the axis $A_1$. For $0 lt.eq u lt.eq q$ put
  $ M_u = M - u { A_1 } = P_1 + P_2 + u L_1 + \( q - u \) xi . $
  The endpoint $M_q$ is pulled back from $X^2$ and has zero volume on the $d$-fold $Z$.
    It is pseudo-effective, and $M_0$ is big by the preceding construction, so $M_u$ is big for $u < q$.
    The restriction of $M_u$ to $A_1 tilde.eq X^2$ is
  $ \( P + u L \)_1 + \( P + \( q - u \) L \)_2 . $
  The restricted volume along $A_1$ is at most the volume of this restriction.
    For big classes $alpha_i$ on manifolds of dimensions $e_i$,
  #[#set math.equation(numbering: n => "(5.13)")
   $ "vol" \( "pr"_1^(*) alpha_1 + "pr"_2^(*) alpha_2 \) = binom(e_1 + e_2, e_1) "vol" \( alpha_1 \)
     "vol" \( alpha_2 \) . $ <zero:product-volume>]
  One can see this directly from the non-pluripolar product formula #cite(label("BEGZ2010")):
    the envelope with minimal singularities of a sum on a product is the sum of the two envelopes,
    by testing the defining inequality on successive slices. Its top product has only the indicated binomial term.
    Since $L lt.eq P \/ r$ and $r gt.eq q^2$, monotonicity and Equation (5.13) bound the restriction volume by
  $ binom(2 n, n) \( 1 + u \/ r \)^n \( 1 + \( q - u \) \/ r \)^n lt.eq C_n . $
  Integrating Equation (5.3) from $0$ to $q$ gives $"vol" \( M \) lt.eq C_n q$.
    Finally apply Lemma 22 with $e = d$, $eta = c_n A_q$, and $"vol" \( M \) lt.eq C_n q$.
    Both terms on the right of Equation (5.5) are at most $C_n A_q$, since $A_q^d = q$. This proves Equation (5.10). ◻
]

==== 5.3.3 The first diagonal <the-first-diagonal>

We now use the volume of $M$ to obtain a high-rank subsheaf of a symmetric cotangent power on $Z$.
  Distinguish the two copies of $Z$ by bracketed indices and blow up their diagonal:

$ b : B = "Bl"_(Delta_Z) \( Z times Z \) arrow.r Z times Z \, wide E = b^(- 1) \( Delta_Z \) . $

Thus $E = bb(P)_Z \( Omega_Z \)$; its points are normal lines in $T_Z$.
  The dimensions are $dim B = 2 d$ and $dim E = 2 d - 1$, and $E arrow.r Z$ has relative dimension $d - 1$.
  Put $zeta = c_1 \( cal(O)_E \( 1 \) \)$, so that ${ E } \|_E = - zeta$. For $s gt.eq 0$ define

$ C_s = b^(*) \( M_(\[ 1 \]) + M_(\[ 2 \]) \) - s { E } \, wide s_max = sup { s gt.eq 0 : C_s gt.eq 0 } . $

The class $C_0$ is big, so $s_max > 0$ and $C_s$ is big for $0 lt.eq s < s_max$.
  Restricting a Kähler current with analytic singularities to the fiber of the first projection at a very general
  $z in Z$ gives the class $b_z^(*) M - s { F_z }$. The current can be restricted for a general such $z$,
  and Lemma 24 therefore gives

#[#set math.equation(numbering: n => "(5.14)")
 $ s_max lt.eq C_n A_q . $ <zero:smax>]

Write $v_E \( s \) = "vol"_(thin \| E) \( C_s \)$ for $0 < s < s_max$. The restriction class is

#[#set math.equation(numbering: n => "(5.15)")
 $ C_s \|_E = 2 M + s zeta . $ <zero:restriction-class>]

The intermediate target is a rational $s$ comparable to $A_q$ and a current in $C_s$ whose restriction to $E$ has
  a Kähler part

$ h^(*) \( 2 M + s zeta \) = beta + { D' } \, wide h : U arrow.r E \, $

on a smooth projective modification, with $D' gt.eq 0$ rational, for which the general fiber volume over $Z$ satisfies

$ w := integral_(U_z) beta^(d - 1) gt.eq c_n s^(d - 1) . $

For such a part, let $f : U arrow.r Z$ be the natural map and put $Lambda = s h^(*) cal(O)_E \( 1 \) -
  cal(O)_U \( D' \)$. The direct images $cal(F)_j = f_(*) cal(O)_U \( j Lambda \)$,
  for sufficiently divisible $j$, are subsheaves of $"Sym"^(j s) Omega_Z$, since $D' gt.eq 0$.
  The direct-image formula below will show that their rank fraction tends to $w \/ s^(d - 1)$.
  We now prove the bounds needed to obtain this positive fraction from the total restricted mass.

==== 5.3.4 A direct-image estimate <a-direct-image-estimate>

We need to bound a Kähler volume upstairs by a class on the base whose size can be controlled through
  determinants. The base need not be projective, and the horizontal class is allowed to be real.

The analytic issue is to replace a positive pushforward class by a nef class on a modified base.
  Flattening removes the possible concentration of mass caused by fibers of excessive dimension.

#thm([Lemma 5.10.])[
  #emph[Let $f : U arrow.r Z_0$ be a surjective projective morphism of smooth connected compact Kähler manifolds,
    with $dim Z_0 = b_0 gt.eq 1$ and $dim U = b_0 + e$, where $e gt.eq 1$.
    Let $beta$ be a Kähler class, $w = integral_(U_z) beta^e$ its general fiber volume, and
$ B_0 = frac(f_(*) beta^(e + 1), \( e + 1 \) w) . $

 There are smooth projective modifications $p : Z'_0 arrow.r Z_0$ and $q : U' arrow.r U$, and a morphism $f' :
   U' arrow.r Z'_0$ with $p f' = f q$, such that
$ B'_0 := frac(f'_(*) \( q^(*) beta \)^(e + 1), \( e + 1 \) w) = p^(*) B_0 - { D_0 } $

 is nef and $D_0$ is an effective $p$-exceptional real divisor.]
] <zero:nef-pushforward>

#proof[
  Take a smooth projective flattening modification $p : Z'_0 arrow.r Z_0$,
    the equidimensional main transform $overline(U)$ of $U times_(Z_0) Z'_0$, and a resolution $U' arrow.r
    overline(U)$. Write $f' : U' arrow.r Z'_0$ and $q : U' arrow.r U$ for the maps and $beta' = q^(*) beta$. The class
  $ B'_0 = frac(f'_(*) \( beta' \)^(e + 1), \( e + 1 \) w) $
  is nef. It is enough to show that the positive pushforward current representing this class has zero Lelong
    numbers. This current can be computed by integration on the cycle $overline(U)$ of the smooth form pulled back
    from $U$. At a base point, cover the compact fiber by finitely many coordinate neighborhoods,
    each embedded in a product of base coordinates and ambient coordinates.
    In the mass over a base ball of radius $delta$, after wedging with a base Euclidean form to power $b_0 - 1$,
    the integrand is bounded by a finite sum of projection volume forms using $b_0 - 1$ base coordinates and $e +
    1$ generic linear combinations of all coordinates of the ambient product,
    including the remaining base direction. These projections can be chosen finite on the neighborhoods:
    fixing the $b_0 - 1$ base coordinates leaves local dimension at most $e + 1$, by equidimensionality,
    and generic ambient coordinates finish a finite projection.
    Choose finite proper local representatives of these projections and then shrink to compact subneighborhoods.
    Their degrees are bounded by the fixed finite projection degrees;
    singularities and cycle multiplicities are included in this bound.
    The finite projections form an open dense set of linear choices.
    We can therefore choose a finite collection whose exterior-coordinate forms span, and hence control,
    the finitely many coordinate-minor terms of the integrand.
    Change of variables therefore bounds each integral by $O \( delta^(2 \( b_0 - 1 \)) \)$ times the measure of
    the remaining coordinate range. On each compact subneighborhood these ranges, taken over closed base balls,
    are nested compact sets whose intersection is the image of the central fiber.
    That image has measure zero in the $e + 1$ coordinates, because the fiber has dimension $e$.
    Continuity of finite measure from above shows that the range measures tend to zero. Thus the mass is
  $ o #scale(x: 120%, y: 120%)[\(] delta^(2 \( b_0 - 1 \)) #scale(x: 120%, y: 120%)[\)] . $
  This also covers $b_0 = 1$, when it asserts absence of an atom.
    The pushforward current has zero Lelong numbers at every point,
    and Demailly regularization #cite(label("DemaillyRegularization1992")) Theorem 1.1 proves that its class
    $B'_0$ is nef.
  Pushforward under $p$ gives $p_(*) B'_0 = B_0$. For a modification between smooth compact Kähler manifolds,
    the kernel of pushforward on real Bott–Chern $\( 1 \, 1 \)$-classes is generated by the classes of its
    exceptional prime divisors. Since $p_(*) p^(*) B_0 = B_0$, it follows that $B'_0 -
    p^(*) B_0$ is an exceptional real divisor class. It is $p$-nef because $B'_0$ is nef.
    Apply relative negativity to this exceptional real divisor.
    Locally over the base, the usual proof for a projective modification cuts by general hyperplanes to a surface
    and uses the negative definite intersection matrix of exceptional curves;
    it forces every coefficient of a relatively nef exceptional divisor to be nonpositive. Thus
  $ B'_0 = p^(*) B_0 - { D_0 } \, wide D_0 gt.eq 0 med p upright("-exceptional") . $
  In particular
  #[#set math.equation(numbering: n => "(5.16)")
   $ integral_(Z'_0) \( B'_0 \)^(b_0) = "vol" \( B'_0 \) lt.eq "vol" \( p^(*) B_0 \) =
     "vol" \( B_0 \) . $ <zero:flattened-volume>]
  ◻
]

The next result combines this nef replacement with the determinant formula.
  It is the quantitative direct-image estimate used in the construction of symmetric cotangent tensors.

#thm([Lemma 5.11.])[
  #emph[Let $f : U arrow.r Z_0$ be a surjective projective morphism of smooth connected compact Kähler manifolds,
    with $dim Z_0 = b_0 gt.eq 1$ and $dim U = b_0 + e$, $e gt.eq 1$. Suppose
$ beta = f^(*) G + c_1 \( Lambda \) $

 is a Kähler class, where $G in H_(upright("BC"))^(1 \, 1) \( Z_0 \, bb(R) \)$ and $Lambda in "Pic" \( U \) ⊗
   bb(Q)$. Put
$ w = integral_(U_z) beta^e > 0 $

 on a general fiber. For sufficiently large divisible integers $j$, let $cal(F)_j =
   f_(*) cal(O)_U \( j Lambda \)$ and $R_j = "rk" cal(F)_j$.
   Here $j Lambda$ is an actual line bundle and $c_1 \( cal(F)_j \)$ means $c_1 \( det cal(F)_j \)$. Then
#[#set math.equation(numbering: n => "(5.17)")
 $ R_j & = frac(w, e !) j^e + O \( j^(e - 1) \) \,\
B_0 := G + lim_j frac(c_1 \( cal(F)_j \), j R_j) & = frac(f_(*) beta^(e + 1), \( e + 1 \) w) gt.eq 0 \,\
integral_U beta^(b_0 + e) & lt.eq \( e + 1 \)^(b_0) w thin "vol" \( B_0 \) . $ <zero:GRR-rank>]

 The limit in Equation (5.17) is a limit of real Bott–Chern classes.]
] <zero:direct-image>

#proof[
  The restriction of $c_1 \( Lambda \)$ to each fiber is represented by the restriction of the Kähler form $beta$.
    The fiberwise criterion for relative ampleness makes $Lambda$ relatively ample after clearing denominators.
    Relative Serre vanishing then kills the higher direct images for all sufficiently large divisible $j$.
    Analytic Grothendieck–Riemann–Roch #cite(label("LevyGRR")), in degrees zero and two, gives
  $ R_j = frac(f_(*) c_1 \( Lambda \)^e, e !) j^e + O \( j^(e - 1) \) \, wide c_1 \( cal(F)_j \) =
    frac(f_(*) c_1 \( Lambda \)^(e + 1), \( e + 1 \) !) j^(e + 1) + O \( j^e \) . $
  The degree-zero pushforward is $w$. Expanding $beta = f^(*) G + c_1 \( Lambda \)$ shows that
  $ f_(*) beta^(e + 1) = f_(*) c_1 \( Lambda \)^(e + 1) + \( e + 1 \) w G \, $
  because terms with at least two horizontal factors have negative fiber degree after pushforward.
    This proves the equality in Equation (5.17); the cohomological GRR equality is an equality in Bott–Chern
    cohomology by the $partial macron(partial)$-lemma on compact Kähler manifolds.
    Pushforward of the positive form $beta^(e + 1)$ is a positive closed $\( 1 \, 1 \)$-current,
    so $B_0$ is pseudo-effective.
  Apply Lemma 25 to choose $p : Z'_0 arrow.r Z_0$, $q : U' arrow.r U$, and $f' : U' arrow.r Z'_0$,
    and put $beta' = q^(*) beta$. The resulting class $B'_0$ is nef and satisfies Equation (5.16).
    Choose a Kähler class $omega'$ on $Z'_0$ and put $C = B'_0 + epsilon omega'$. For $0 lt.eq k lt.eq b_0$, set
  $ I_k = integral_(U') \( beta' \)^(e + k) \( f' ""^(*) C \)^(b_0 - k) . $
  These are mixed intersections of nef classes. The first two satisfy
  $ I_0 = w integral_(Z'_0) C^(b_0) \, wide I_1 = \( e + 1 \) w integral_(Z'_0) B'_0 C^(b_0 - 1) lt.eq \( e + 1 \)
    w integral_(Z'_0) C^(b_0) . $
  The mixed nef inequalities make the sequence $I_k$ log-concave. Every $I_k$ is positive:
    on the dense open where $q$ is a local biholomorphism and $f'$ is a submersion,
    $beta'$ is positive definite and $f' ""^(*) C$ has rank $b_0$, so the defining top form is strictly positive.
    The successive ratios are therefore at most $I_1 \/ I_0 lt.eq e + 1$. Thus
  $ integral_U beta^(b_0 + e) = I_(b_0) lt.eq \( e + 1 \)^(b_0) w integral_(Z'_0) C^(b_0) . $
  Letting $epsilon arrow.b 0$ and using Equation (5.16) proves Equation (5.17). ◻
]

We will also use the determinant formula without its volume bound.

#thm([Corollary 5.12.])[
  #emph[Let $Y$ be a smooth compact Kähler manifold and $cal(E)$ a holomorphic vector bundle of rank at least two.
    Write $pi_(cal(E)) : bb(P)_Y \( cal(E) \) arrow.r Y$ and $zeta_(cal(E)) =
    c_1 \( cal(O)_(bb(P) \( cal(E) \)) \( 1 \) \)$. Suppose that a real class $D$ on $Y$ satisfies
$ c_1 \( cal(H) \) lt.eq k D quad upright("whenever") quad 0 eq.not #scale(x: 120%, y: 120%)[\(] cal(H) arrow.r
  cal(E)^(⊗ k) #scale(x: 120%, y: 120%)[\)] $

 for a line bundle $cal(H)$ and integer $k gt.eq 0$. For a real class $A$ on $Y$ and a real number $b gt.eq 0$,
#[#set math.equation(numbering: n => "(5.18)")
 $ pi_(cal(E))^(*) A + b zeta_(cal(E)) gt.eq 0 quad arrow.r.double quad A + b D gt.eq
   0 . $ <zero:slope-descent-equation>]

]
] <zero:slope-descent>

#proof[
  If $Y$ is a point, both $A$ and $D$ vanish and the assertion is immediate. Suppose $dim Y gt.eq 1$.
    Choose a real class $H_0$ on $Y$ so that $zeta_(cal(E)) + pi_(cal(E))^(*) H_0$ is Kähler;
    relative ampleness of $cal(O) \( 1 \)$ permits such a choice.
    Take numbers $delta arrow.b 0$ with $b + delta > 0$ rational.
    Adding $delta \( zeta_(cal(E)) + pi_(cal(E))^(*) H_0 \)$ to the pseudo-effective class in Equation (5.18)
    makes it big. A Fujita decomposition on a smooth projective modification $h : U arrow.r bb(P)_Y \( cal(E) \)$,
    with the divisor coefficients rounded upwards as in Equation (5.4), has the form
  $ beta = f^(*) \( A + delta H_0 \) + c_1 \( Lambda \) \, wide Lambda = \( b + delta \) h^(*) cal(O) \( 1 \) -
    cal(O)_U \( D' \) med upright("in ") "Pic" \( U \) ⊗ bb(Q) \, $
  where $f = pi_(cal(E)) h$, $beta$ is Kähler, and $D' gt.eq 0$ is rational. For divisible $j$,
  $ f_(*) cal(O)_U \( j Lambda \) med subset.eq med "Sym"^(j \( b + delta \)) cal(E) . $
  Its determinant of rank $R_j$ consequently maps into $cal(E)^(⊗ j \( b + delta \) R_j)$.
    The assumed line inequality gives
  $ frac(c_1 \( cal(F)_j \), j R_j) lt.eq \( b + delta \) D . $
  Lemma 26 makes $A + delta H_0 + lim c_1 \( cal(F)_j \) \/ \( j R_j \)$ pseudo-effective.
    Adding the preceding pseudo-effective difference shows that $A +
    delta H_0 + \( b + delta \) D$ is pseudo-effective. Let $delta arrow.b 0$. This proves the corollary.
    In this argument only $b + delta$ and the coefficients of $D'$ are rational; $A$, $H_0$,
    and $D$ remain real classes. ◻
]

For the forthcoming application over the $d$-fold $Z$, with fibers of dimension $d - 1$,
  Lemma 26 has a useful concrete consequence. Once we prove $B_0 lt.eq C_n M$, the bound $"vol" \( M \) lt.eq
  C_n q$ gives

$ integral_U beta^(2 d - 1) lt.eq C_n w q . $

Thus an upper bound for the normalized determinant class will convert a lower bound for total mass into a lower
  bound for the fiber volume $w$. The next calculation supplies the required determinant control.

==== 5.3.5 Cotangent lines on the projective bundle <cotangent-lines-on-the-projective-bundle>

We return to $Z = bb(P)_(X^2) \( cal(L)_1 xor cal(L)_2 \)$.
  The following calculation is where the chosen line bundle enters the first determinant estimate.
  A line mapping into a cotangent tensor has nonpositive degree on a general projective-line fiber;
  the calculation also controls its horizontal class.

#thm([Lemma 5.13.])[
  #emph[Let $cal(H)$ be a holomorphic line bundle on $Z$, and suppose there is a nonzero map $cal(H) arrow.r
    Omega_Z^(⊗ k)$, with $k gt.eq 0$. Then
$ cal(H) = pi^(*) \( cal(Q)_1 times.square cal(Q)_2 \) ⊗ cal(O)_Z \( ell \) $

 for lines $cal(Q)_i$ on $X$ and an integer $ell$, and
$ ell lt.eq 0 \, wide c_1 \( cal(Q)_1 \)_1 + c_1 \( cal(Q)_2 \)_2 lt.eq \( k - ell \) \( L_1 + L_2 \) . $

]
] <zero:cotangent-Z>

#proof[
  Irregularity zero and Künneth give $"Pic" \( X^2 \) = "pr"_1^(*) "Pic" \( X \) xor "pr"_2^(*) "Pic" \( X \)$,
    and the projective-bundle formula for $"Pic" \( Z \)$ gives the asserted expression. Filter the target using
  $ 0 arrow.r pi^(*) Omega_(X^2) arrow.r Omega_Z arrow.r cal(O)_Z \( - 2 \) ⊗ pi^(*) \( cal(L)_1 ⊗ cal(L)_2 \)
    arrow.r 0 . $
  Choose a nonzero associated graded component. Suppose it has $i$ relative factors and $k_1 \,
    k_2$ cotangent factors from the two copies of $X$, so $k_1 + k_2 = k - i$. Its relative degree is $- 2 i$.
    Pushing to $X^2$ forces $m = - 2 i - ell gt.eq 0$; hence $ell lt.eq - 2 i lt.eq 0$.
    A nonzero monomial in $"Sym"^m \( cal(L)_1 xor cal(L)_2 \)$, with first exponent $m_1$,
    gives on the two general slices
  $ c_1 \( cal(Q)_1 \) lt.eq \( i + m_1 + k_1 \) L \, wide c_1 \( cal(Q)_2 \) lt.eq \( i + m - m_1 + k_2 \) L . $
  These are exactly the assumed cotangent-line bounds on $X$,
    applied after moving the indicated powers of $cal(L)$ to the source.
    Each coefficient on the right is at most $k - ell$. Since $L gt.eq 0$,
    pullback and addition prove the claimed bound. ◻
]

==== 5.3.6 Extracting a positive rank fraction <extracting-a-positive-rank-fraction>

#thm([Lemma 5.14.])[
  #emph[There are constants $c_n \, C_n > 0$ such that, for every sufficiently large $q$,
    one can choose a rational number
$ c_n A_q lt.eq s lt.eq C_n A_q $

 and a Kähler current $T$ in $C_s$ with analytic singularities, not generically singular on $E$,
   with the following property. On a smooth projective modification $h : U arrow.r E$,
   its restricted mass has a rational-divisor approximation
#[#set math.equation(numbering: n => "(5.19)")
 $ h^(*) \( 2 M + s zeta \) = beta + { D' } \, wide beta med upright("Kähler") \, quad D' gt.eq 0 med
   upright("rational") \, $ <zero:selected-decomposition>]

 which retains all log-ideal orders of $T \|_E$. If $f : U arrow.r Z$ is the natural map and
$ w = integral_(U_z) beta^(d - 1) $

 on a general fiber, then
#[#set math.equation(numbering: n => "(5.20)")
 $ w gt.eq c_n s^(d - 1) . $ <zero:selected-w>]

]
] <zero:diagonal-mass>

#proof[
  First let $s$ be any rational number in $\( 0 \, s_max \)$ with $v_E \( s \) > 0$,
    and use the approximation in Equation (5.4) for any current used to compute this restricted volume.
    In Lemma 26, the data for Equation (5.15) are
  $ b_0 = d \, quad e = d - 1 \, quad G = 2 M \, quad Lambda = s h^(*) cal(O)_E \( 1 \) - cal(O)_U \( D' \) med
    upright("in ") "Pic" \( U \) ⊗ bb(Q) . $
  For large divisible $j$, the associated sheaves satisfy
  #[#set math.equation(numbering: n => "(5.21)")
   $ cal(F)_j = f_(*) cal(O)_U \( j Lambda \) subset.eq "Sym"^(j s) Omega_Z \, wide R_j = "rk" cal(F)_j \, wide
     0 < w lt.eq s^(d - 1) . $ <zero:symmetric-inclusion>]
  The inclusion follows by pushing $cal(O)_U \( - j D' \) subset.eq cal(O)_U$ through $h$.
    For the last inequality restrict the decomposition to a general $bb(P)^(d - 1)$-fiber:
    monotonicity of volume bounds the Kähler volume there by $"vol" \( s zeta \) = s^(d - 1)$.
  We claim that the class $B_0$ of Equation (5.17) satisfies
  #[#set math.equation(numbering: n => "(5.22)")
   $ 0 lt.eq B_0 lt.eq C_n M . $ <zero:B0-bound>]
  By Lemma 28, write
  $ det cal(F)_j = pi^(*) \( cal(Q)_(j \, 1) times.square cal(Q)_(j \, 2) \) ⊗ cal(O)_Z \( ell_j \) \, wide Q_j =
    c_1 \( cal(Q)_(j \, 1) \)_1 + c_1 \( cal(Q)_(j \, 2) \)_2 . $
  The determinant of the inclusion in Equation (5.21) gives a nonzero map into $Omega_Z^(⊗ j s R_j)$.
    It is defined off codimension two and extends across that set. The lemma consequently gives
  #[#set math.equation(numbering: n => "(5.23)")
   $ ell_j lt.eq 0 \, wide Q_j lt.eq \( j s R_j - ell_j \) \( L_1 + L_2 \) . $ <zero:determinant-bound-Z>]
  Lemma 26 supplies a limit of the entire determinant class divided by $j R_j$.
    The projective-bundle decomposition of Bott–Chern cohomology gives separate limits $Q$ and $ell$ of the two
    displayed components. Since
  $ B_0 = 2 \( P_1 + P_2 \) + \( 2 q + ell \) xi + Q gt.eq 0 \, $
  testing on a general vertical line gives $2 q + ell gt.eq 0$.
    Equation (5.23) gives $ell lt.eq 0$ and $Q lt.eq \( s - ell \) \( L_1 + L_2 \)$.
    Use $xi gt.eq 0$, $- ell lt.eq 2 q$, $L lt.eq P \/ r$, $r gt.eq q^2$, and $s lt.eq C_n A_q lt.eq C_n q$. They give
  $ B_0 lt.eq 2 \( P_1 + P_2 \) + 2 q xi + \( s + 2 q \) \( L_1 + L_2 \) lt.eq C_n M \, $
  which proves Equation (5.22).
  Volume monotonicity, Lemma 24, and Equation (5.17) now imply
  #[#set math.equation(numbering: n => "(5.24)")
   $ integral_U beta^(2 d - 1) lt.eq C_n w q \, wide v_E \( s \) lt.eq
     C_n q thin s^(d - 1) . $ <zero:restriction-mass-bound>]
  For the second inequality, approximate the mass of each current arbitrarily closely by $beta$ and use $w lt.eq
    s^(d - 1)$, then take the supremum over currents. This proves it for rational $s$;
    continuity of divisorial restricted volume extends it to every $s in \( 0 \, s_max \)$.
  At $s_max$ the class is on the boundary of the pseudo-effective cone, so its volume is zero.
    The product formula in Equation (5.13), modification invariance, and the derivative formula in Equation (5.3) yield
  #[#set math.equation(numbering: n => "(5.25)")
   $ 2 d integral_0^(s_max) v_E \( s \) thin upright(d) s = "vol" \( C_0 \) = binom(2 d, d) "vol" \( M \)^2 gt.eq
     c_n q^2 . $ <zero:total-diagonal-mass>]
  Choose a fixed small $theta_n > 0$. The contribution of $0 < s < theta_n A_q$, by Equation (5.24),
    is at most $C_n theta_n^d q^2$. Fix $theta_n$ small enough that this is less than half the last lower bound.
    The remaining interval has length at most $C_n A_q$, by Equation (5.14).
    Continuity therefore permits a rational $s in \[ theta_n A_q \, s_max \)$ such that
  $ v_E \( s \) gt.eq c_n q^2 \/ A_q = c_n q A_q^(d - 1) gt.eq c_n q s^(d - 1) . $
  Choose a current with restricted mass at least three quarters of $v_E \( s \)$,
    and then an approximation as in Equation (5.19) with $integral_U beta^(2 d - 1) gt.eq v_E \( s \) \/ 2$.
    The first inequality of Equation (5.24) gives $w gt.eq c_n s^(d - 1)$, as claimed. ◻
]

For the selected $s \, T \, h \, beta \, D'$ and $w$, retain the natural map $f : U arrow.r Z$ and put

$ Lambda = s h^(*) cal(O)_E \( 1 \) - cal(O)_U \( D' \) \, wide cal(F)_j = f_(*) cal(O)_U \( j Lambda \) \, wide
  R_j = "rk" cal(F)_j \, $

where $j$ is sufficiently large and divisible. Here $Lambda$ is a rational line,
  and Equation (5.21) gives $cal(F)_j subset.eq "Sym"^(j s) Omega_Z$.
  With $q$ and these selected data fixed, Equations (5.17) and (5.20) give

#[#set math.equation(numbering: n => "(5.26)")
 $ "rk" "Sym"^(j s) Omega_Z = binom(j s + d - 1, d - 1) \, wide lim_j frac(R_j, "rk" "Sym"^(j s) Omega_Z) = w /
   s^(d - 1) gt.eq c_n . $ <zero:selected-rank-fraction>]

The limit is through divisible integers. Thus the first diagonal has produced a subsheaf occupying a fixed
  positive proportion of the symmetric power for all sufficiently large divisible $j$.
  The remaining proof carries this rank bound to a modification of $Z$ and converts it into a large common order
  of vanishing for the determinant map on that model.

==== 5.3.7 A pole along the incidence <a-pole-along-the-incidence>

We next locate a large pole of the selected current $T$ along a smooth incidence submanifold of $B$.
  This will impose vanishing conditions on the symmetric-power subsheaf in Equation (5.21).

Let $U_0 = pi^(- 1) \( Delta_X \) subset Z$, where $Delta_X$ is the diagonal in $X^2$.
  Since $cal(L)_1 \|_(Delta_X) = cal(L)_2 \|_(Delta_X) = cal(L)$, there is a canonical identification

$ U_0 = X times bb(P)^1 . $

For $lambda in bb(P)^1$ write $D_lambda = X times { lambda } subset Z$. Inside $Z times Z$ consider

$ cal(V)_0 = { \( \( x \, x \, lambda \) \, \( y \, y \, lambda \) \) : x \, y in X \, med
  lambda in bb(P)^1 } tilde.eq X^2 times bb(P)^1 . $

It meets $Delta_Z$ in $Delta_X times bb(P)^1$. The strict transform $V subset B$ is $"Bl"_(Delta_X times bb(P)^1)
  cal(V)_0$; it is smooth, of dimension $d = 2 n + 1$. Its first projection is a smooth family over $U_0$.
  Over $z = \( x \, x \, lambda \)$ its fiber is

$ Y = "Bl"_x D_lambda tilde.eq "Bl"_x X \, $

and its intersection with $E$ in that fiber is the projective space of lines in $T_z D_lambda$,
  inside the projective space of lines in $T_z Z$. These assertions follow either from the blowup of the section
  $y = x$ in this family or from the coordinates used below.

Let $rho_V : "Bl"_V B arrow.r B$ have exceptional divisor $G_V$.
  Denote by $b_V gt.eq 0$ the generic divisorial pole of $rho_V^(*) T$ along $G_V$.
  Equivalently, it is the generic log-ideal order of $T$ along $V$, with the coefficient of the logarithm included.

#thm([Lemma 5.15.])[
  #emph[The pole just defined satisfies
#[#set math.equation(numbering: n => "(5.27)")
 $ b_V gt.eq s - C_n . $ <zero:pole-transfer>]

]
] <zero:incidence-pole>

#proof[
  Remove $b_V \[ G_V \]$ from $rho_V^(*) T$. Its residual positive current can be restricted to $G_V$:
    for analytic singularities removal of the generic divisorial pole leaves a potential that is not identically
    $- oo$ on that divisor. Choose $z = \( x \, x \, lambda \) in
    U_0$ general enough for all restrictions and for Equation (5.2) and Lemma 22. On the bundle
  $ G_V \|_Y = bb(P)_Y \( N_(V \/ B)^(*) \|_Y \) \, wide Y = "Bl"_x X \, $
  this restriction is a positive current in the class
  #[#set math.equation(numbering: n => "(5.28)")
   $ a^(*) \( 2 P + q L \) - s { F } + b_V zeta_V \, $ <zero:incidence-restriction>]
  where $zeta_V = c_1 \( cal(O)_(bb(P) \( N_(V \/ B)^(*) \|_Y \)) \( 1 \) \)$.
    Indeed $M \|_(D_lambda) = 2 P + q L$, the first projection to $Z$ is constant on $Y$, and $E \|_Y = F$.
    Also $G_V \|_(G_V) = - zeta_V$, explaining the positive sign of the last term.
  The conormal bundle in Equation (5.28) has exact sequences
  #[#set math.equation(numbering: n => "(5.29)")
   $ 0 arrow.r cal(O)_Y^(xor n) & arrow.r N_(V \/ B)^(*) \|_Y arrow.r
     a^(*) N_(D_lambda \/ Z)^(*) ⊗ cal(O)_Y \( F \) arrow.r 0 \,\
0 arrow.r Omega_X & arrow.r N_(D_lambda \/ Z)^(*) arrow.r cal(O)_X arrow.r 0 . $ <zero:incidence-conormal>]
  The first constant term is the conormal of $U_0$ in the first copy of $Z$, evaluated at $z$.
    For the last term in Equation (5.29), the conormal of the strict transform of $D_lambda$ in $"Bl"_z
    Z$ is $a^(*) N_(D_lambda \/ Z)^(*) ⊗ cal(O)_Y \( F \)$: in a blowup chart,
    a normal coordinate is divided by an exceptional coordinate, giving precisely the twist by $F$ for conormals.
    Equation (5.29) is the conormal sequence for $D_lambda subset U_0 subset Z$;
    the diagonal in $X^2$ has conormal $Omega_X$, and the $lambda$-normal direction is constant on $X$.
  Filter a $k$-fold tensor of $N_(V \/ B)^(*) \|_Y$ by these sequences. A graded term has the form
  $ cal(O)_Y \( h F \) ⊗ \( a^(*) Omega_X \)^(⊗ k') ⊗ \( upright("a constant vector space") \) \, wide 0 lt.eq
    k' lt.eq h lt.eq k . $
  For any nonzero line map into that tensor, take a nonzero graded component. Equation (5.2) gives
  $ c_1 \( cal(H)_Y \) lt.eq h { F } + k' a^(*) L lt.eq k \( { F } + a^(*) L \) \, $
  since both ${ F }$ and $a^(*) L$ are pseudo-effective. Apply Corollary 27 to Equation (5.28), with $D = { F } +
    a^(*) L$. We obtain
  #[#set math.equation(numbering: n => "(5.30)")
   $ a^(*) \( 2 P + \( q + b_V \) L \) - \( s - b_V \) { F } gt.eq 0 . $ <zero:incidence-base>]
  If $b_V gt.eq s$, the conclusion is immediate. Otherwise $b_V < s lt.eq C_n A_q lt.eq C_n q$, and $L lt.eq
    P \/ r$ gives
  $ (2 + frac(q + b_V, r)) a^(*) P - \( s - b_V \) { F } gt.eq 0 . $
  Use the point bound in Equation (5.8). Since $r gt.eq q^2$, its consequence
  $ s - b_V lt.eq C_n (2 + frac(q + b_V, r)) $
  is bounded by a dimensional constant. This proves Equation (5.27). ◻
]

==== 5.3.8 From incidence order to determinant vanishing <from-incidence-order-to-determinant-vanishing>

Blow up $U_0$ in the base of $E$:

$ p_(+) : Z^(+) = "Bl"_(U_0) Z arrow.r Z \, wide J_(+) = p_(+)^(- 1) \( U_0 \) . $

This is the bundle $Z$ pulled to $"Bl"_(Delta_X) \( X^2 \)$, since $U_0 = pi^(- 1) \( Delta_X \)$.
  In particular $Z^(+)$ is smooth. Put

$ E^(+) = E times_Z Z^(+) = bb(P)_(Z^(+)) \( p_(+)^(*) Omega_Z \) . $

Extend the incidence ideal from $B$ to $E$, and then to $E^(+)$:

$ cal(J) = \( cal(I)_V dot.op cal(O)_E \) dot.op cal(O)_(E^(+)) . $

The products denote extension of ideals under the indicated maps.
  Figure 2 locates $V ∩ E$ and this extension of the incidence ideal to $E^(+)$.

#figure(
  [#grid(
    columns: (0.47fr, 0.5fr,),
    column-gutter: 3%,
    [
      #cetz.canvas({
  import cetz.draw: *
  content((0, 1.5), [$V$])
  content((2.7, 1.5), [$B$])
  content((0, 0), [$cal(V)_0$])
  content((2.7, 0), [$Z times Z$])
  line((0.2657, 1.5), (2.434, 1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.35, 1.5), [$subset$], anchor: "south", padding: 0.1176cm)
  line((0.4421, 0), (2.178, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.35, 0), [$subset$], anchor: "south", padding: 0.1176cm)
  line((0, 1.255), (0, 0.2716), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.75), [$b|_V$], anchor: "east", padding: 0.1176cm)
  line((2.7, 1.255), (2.7, 0.2597), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.7, 0.75), [$b$], anchor: "west", padding: 0.1176cm)
})
      $ V_z = "Bl"_x X \,\
\( V ∩ E \)_z = bb(P) \( T_z^(*) D_lambda \) subset E_z = bb(P) \( T_z^(*) Z \) . $
    ],
    [
      #cetz.canvas({
  import cetz.draw: *
  content((0, 1.5), [$E^+$])
  content((3, 1.5), [$E= bb(P)_Z( Omega_Z)$])
  content((0, 0), [$Z^+$])
  content((3, 0), [$Z$])
  line((0.3275, 1.5), (1.928, 1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 1.24), (0, 0.2601), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3, 1.199), (3, 0.2451), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.3275, 0), (2.734, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.5, 0), [$p_+= "Bl"_(U_0)$], anchor: "north", padding: 0.1176cm)
})
      $ J_(+) = p_(+)^(- 1) \( U_0 \) \, wide U_0 = X times bb(P)^1 \,\
cal(J) = \( cal(I)_V dot.op cal(O)_E \) dot.op cal(O)_(E^(+)) . $
    ],
  )],
  caption: [Figure 2: Two geometric constructions used in the determinant estimate. On the left, the strict transform $V subset B$ meets $E_z$ in the directions tangent to $D_lambda$. Under the quotient convention, the displayed projectivized cotangent spaces parametrize tangent lines. On the right, $E^(+)$ is the Cartesian base change over $Z^(+) = "Bl"_(U_0) Z$, whose exceptional divisor is $J_(+)$. The restricted incidence ideal extends to $cal(J)$ on $E^(+)$. The ensuing local calculation identifies the normal parameter of $J_(+)$ among its generators. ],
) <zero:two-diagonals>

The next lemma turns the pole bound in Equation (5.27) into a common vanishing order for the coefficients of each
  determinant map.

#thm([Lemma 5.16.])[
  #emph[On a smooth projective modification $h_(+) : U^(+) arrow.r E^(+)$ one can choose an approximation
#[#set math.equation(numbering: n => "(5.31)")
 $ h_(+)^(*) \( 2 p_(+)^(*) M + s zeta \) = beta^(+) + { D^(+) } \, wide beta^(+) med upright("Kähler") \, quad
   D^(+) gt.eq 0 med upright("rational") \, $ <zero:plus-decomposition>]

 retaining the log-ideal orders of $T \|_E$, such that the general fiber volume $w^(+)$ of $beta^(+)$ over $Z^(+)$
   satisfies $w^(+) gt.eq w \/ 2$. Let $f_(+) : U^(+) arrow.r Z^(+)$ be the natural map and put
$ Lambda^(+) = s h_(+)^(*) cal(O)_(E^(+)) \( 1 \) - cal(O)_(U^(+)) \( D^(+) \) \, wide
  cal(F)_j^(+) = \( f_(+) \)_(*) cal(O)_(U^(+)) \( j Lambda^(+) \) \, wide R_j^(+) = "rk" cal(F)_j^(+) . $

 For every sufficiently large divisible $j$, write
$ iota_j : cal(F)_j^(+) arrow.r.hook p_(+)^(*) "Sym"^(j s) Omega_Z \, wide phi_j : det cal(F)_j^(+) arrow.r
  and.big^(R_j^(+)) #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] p_(+)^(*) "Sym"^(j s) Omega_Z
  #scale(x: 120%, y: 120%)[\)] $

 for the inclusion and its nonzero determinant map. Here $det
   cal(F)_j^(+) = \( and.big^(R_j^(+)) cal(F)_j^(+) \)^(* *)$,
   and the determinant map extends across the complement of the locally free locus,
   which has codimension at least two. Localize a coordinate local ring of $Z^(+)$ at the height-one prime of
   $J_(+)$, obtaining a discrete valuation ring $R$ with uniformizer $u$. In local frames over $R$, define
$ h_j = min { "ord"_u \( c \) : c upright(" is a nonzero coefficient of ") phi_j } . $

 Equivalently, $h_j$ is the minimum order of the maximal minors of $iota_j$; it is independent of the frames.
   If $sigma_(J_(+))$ is the canonical section of $cal(O)_(Z^(+)) \( J_(+) \)$, then $phi_j$ factors as
$ det cal(F)_j^(+) arrow.r^(med dot.op sigma_(J_(+))^(h_j) med) det cal(F)_j^(+) \( h_j J_(+) \)
  arrow.r^(med tilde(phi)_j med) and.big^(R_j^(+)) #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] p_(+)^(*)
  "Sym"^(j s) Omega_Z #scale(x: 120%, y: 120%)[\)] \, $

 where $tilde(phi)_j$ is holomorphic. The common order satisfies
#[#set math.equation(numbering: n => "(5.32)")
 $ h_j gt.eq c_n thin j R_j^(+) s \, $ <zero:determinant-order-equation>]

 provided $q$ is sufficiently large.]
] <zero:determinant-order>

#proof[
  Blow up $cal(J)$ and take a common smooth projective resolution with $U arrow.r E$ from Equation (5.19).
    Pull back $beta$ and $D'$. Subtracting a sufficiently small rational multiple of an effective exceptional
    divisor whose negative is relatively ample makes the pulled-back Kähler class Kähler on this resolution;
    add that multiple to the effective part. Further upward rational rounding may be arbitrarily small.
    This gives Equation (5.31) with all original orders retained.
    Its general fiber intersection is as close to $w$ as desired, so arrange $w^(+) gt.eq w \/ 2$.
    Lemma 26 and the effective divisor give
  #[#set math.equation(numbering: n => "(5.33)")
   $ cal(F)_j^(+) subset.eq p_(+)^(*) "Sym"^(j s) Omega_Z \, wide R_j^(+) = frac(w^(+), \( d - 1 \) !) j^(d - 1) +
     O \( j^(d - 2) \) . $ <zero:plus-rank>]
  We spell out the local order imposed on the polynomials in this inclusion.
    Near $z = \( x \, x \, lambda \)$, use coordinates $\( upright(bold(x)) \, upright(bold(a)) \, lambda \)$ on
    the first $Z$, where $upright(bold(x))$ and $upright(bold(a))$ each have $n$ components and
    $U_0 = \( upright(bold(a)) = 0 \)$. Write the second coordinates as
    $\( upright(bold(x)) + upright(bold(h)) \, upright(bold(a)) + upright(bold(k)) \, lambda + mu \)$,
    with $upright(bold(h)) \, upright(bold(k))$ each having $n$ components. Then
  $ cal(V)_0 = \( upright(bold(a)) = upright(bold(k)) = mu = 0 \) \, wide
    Delta_Z = \( upright(bold(h)) = upright(bold(k)) = mu = 0 \) . $
  In a blowup chart meeting the lines tangent to $D_lambda$, take
  $ h_1 = v \, quad h_i = v alpha_i med \( 2 lt.eq i lt.eq n \) \, quad k_i = v y_i med \( 1 lt.eq i lt.eq n \) \,
    quad mu = v y_(n + 1) . $
  Here $E = \( v = 0 \)$,
    while the strict transform is $V = \( a_1 = dots.h.c = a_n = y_1 = dots.h.c = y_(n + 1) = 0 \)$. In particular,
  #[#set math.equation(numbering: n => "(5.34)")
   $ cal(I)_V \|_E = \( a_1 \, dots.h \, a_n \, y_1 \, dots.h \, y_(n + 1) \) . $ <zero:ideal-before>]
  On a chart of the blowup of $U_0$, write $a_1 = u$ and $a_i = u tau_i$ for $i gt.eq 2$.
    Along the general point of $J_(+) = \( u = 0 \)$, the ideal $cal(J)$ is exactly
  #[#set math.equation(numbering: n => "(5.35)")
   $ \( u \, y_1 \, dots.h \, y_(n + 1) \) . $ <zero:joint-ideal>]
  Here $u$ measures vanishing along $J_(+)$, while the $y_i$ measure transverse fiber directions.
    Thus a term of transverse degree $ell$ can contribute at most $ell$ to the incidence order;
    the remaining order must come from its coefficient in $u$. We now make this statement precise.
  Suppose locally that the singularities of $T$ are $c log \| frak(a) \| + O \( 1 \)$,
    with the logarithmic normalization for which a divisorial coefficient is $c$ times the ideal order.
    If $k = "ord"_V \( frak(a) \)$, then $b_V = c k$. The normal Taylor coefficients of degree less than $k$
    vanish on a dense open set of $V$, hence on $V$ locally. Thus $frak(a) subset.eq
    cal(I)_V^k$ also near a general point of $V ∩ E$. Restricting to $E$ and pulling to $E^(+)$ gives the
    corresponding order in Equation (5.35). At its general center the displayed generators are regular
    coordinates. If $H_(cal(J))$ is the exceptional divisor of their blowup,
    its valuation is the ordinary ideal-adic order:
  $ "ord"_(H_(cal(J))) \( g \) = max { k : g in \( u \, y_1 \, dots.h \, y_(n + 1) \)^k } . $
  The common resolution dominates this blowup. Pullback preserves the effective difference between $D'$ and the
    resolved log divisor, and the later adjustments only increase the effective part.
    Thus $D^(+)$ has coefficient at least $b_V$ at this valuation.
    Every polynomial image of a section of $cal(F)_j^(+)$ has integral valuation at least $ceil.l j b_V ceil.r$.
    Locally bounded remainders have zero order at this valuation.
  There are $n$ homogeneous coordinates along $T_z D_lambda$ and $n +
    1$ transverse homogeneous coordinates in $T_z Z$. Denote these two groups by $H_1 \, dots.h \,
    H_n$ and $Y_1 \, dots.h \, Y_(n + 1)$. For $m = j s$, a local polynomial in $"Sym"^m \( p_(+)^(*) Omega_Z \)$
    has the form
  $ sum_(\| alpha \| + \| gamma \| = m) c_(alpha \, gamma) \( u \) thin H^alpha Y^gamma . $
  Work over the discrete valuation ring $R$ used to define $h_j$, choosing the chart parameter $u$ as uniformizer,
    and let $kappa$ be its residue field. The coefficients $c_(alpha \, gamma)$ lie in $R$.
    Equation (5.35) implies, monomial by monomial,
  #[#set math.equation(numbering: n => "(5.36)")
   $ "ord"_u \( c_(alpha \, gamma) \) gt.eq max { 0 \, ceil.l j b_V ceil.r - \| gamma \| } . $ <zero:coefficient-order>]
  Indeed, on the chart $H_1 eq.not 0$, group the dehomogenized polynomial as
  $ sum_gamma P_gamma \( H_2 \/ H_1 \, dots.h \, H_n \/ H_1 \) \( Y \/ H_1 \)^gamma \, wide
    P_gamma in R \[ H_2 \/ H_1 \, dots.h \, H_n \/ H_1 \] . $
  Put $b_j = ceil.l j b_V ceil.r$. At the general center of $\( u \, Y \/ H_1 \)$,
    order at least $b_j$ forces $P_gamma$ to be divisible by $u^(b_j - \| gamma \|)$ whenever $\| gamma \| < b_j$.
    Otherwise its first nonzero reduction would be a nonzero polynomial over $kappa$,
    which stays nonzero in $kappa \( H_2 \/ H_1 \, dots.h \, H_n \/ H_1 \)$;
    in the associated graded ring it would give a nonzero term of total $\( u \, Y \/ H_1 \)$-degree less than
    $b_j$. The transverse monomials there are independent. Comparing the internal polynomial coefficients over the
    base residue field $kappa$ now gives Equation (5.36).
  We compare the number of monomials with the rank estimate in Equation (5.33).
    The ambient rank and the number of monomials of transverse degree $ell$ are
  $ N_m = binom(m + 2 n, 2 n) \, wide N_(m \, ell) = binom(ell + n, n) binom(m - ell + n - 1, n - 1) . $
  For fixed $delta in \( 0 \, 1 \)$, let $H_m \( delta \)$ count the monomials with $ell > \( 1 - delta \) m$.
    Summing instead over their internal degree gives
  $ H_m \( delta \) lt.eq binom(m + n, n) binom(ceil.l delta m ceil.r + n, n) \, wide
    limsup_(m arrow.r oo) frac(H_m \( delta \), N_m) lt.eq binom(2 n, n) delta^n . $
  On the other hand, $w^(+) gt.eq w \/ 2$ and Equation (5.33) show that the approximation on $E^(+)$ retains at
    least half the rank fraction in Equation (5.26):
  $ lim_(j arrow.r oo) R_j^(+) / N_(j s) = w^(+) / s^(d - 1) gt.eq frac(w, 2 s^(d - 1)) gt.eq c_n > 0 . $
  Fix $delta > 0$, depending only on $n$, so small that, for each fixed $q$ and its selected data,
    fewer than $R_j^(+) \/ 2$ monomials have transverse degree greater than $\( 1 - delta \) j
    s$ for all sufficiently large divisible $j$. For each remaining monomial, Equation (5.36) and Lemma 30 give
  $ "ord"_u \( c_(alpha \, gamma) \) gt.eq j \( s - C_n \) - \( 1 - delta \) j s = j \( delta s - C_n \) gt.eq
    frac(delta j s, 2) . $
  The last inequality holds once $q$ is large, since $s gt.eq c_n A_q arrow.r oo$.
  Over the same discrete valuation ring $R$, the torsion-free sheaf $cal(F)_j^(+)$ becomes a free module of rank
    $R_j^(+)$. Write its inclusion into the symmetric power as a matrix with the monomials as rows.
    Every maximal minor uses at least $R_j^(+) \/ 2$ of the rows whose coefficients have order at least $delta j
    s \/ 2$. All maximal minors therefore have order at least $delta j R_j^(+) s \/ 4$.
    By the definition of $h_j$, this proves Equation (5.32). Dividing the determinant map by $sigma_(J_(+))^(h_j)$
    gives a holomorphic map at every point of codimension one:
    the coefficients have the required order along $J_(+)$, and its local equation is a unit away from $J_(+)$.
    Hartogs’ theorem extends the divided map across the remaining set of codimension at least two,
    giving the stated factorization through $det cal(F)_j^(+) \( h_j J_(+) \)$. ◻
]

==== 5.3.9 Cancellation on the point blowup <cancellation-on-the-point-blowup>

#proof[
  #emph[Completion of the proof of Proposition 21.] Fix $q$ sufficiently large for the preceding lemmas,
    with its chosen $P \, s \, T$ and modifications. Choose a very general point $x$ in the first factor of $X^2$.
    The slice of $Z^(+)$ above $x$ is
  $ S = bb(P)_Y \( cal(O)_Y xor a^(*) cal(L) \) \, wide a : Y = "Bl"_x X arrow.r X \, $
  and $J_(+) \|_S$ is the pullback of $F$. We choose $x$ so that Equation (5.2), Equation (5.8),
    the restrictions of the currents below, and all determinant maps for divisible $j$ can be tested on this
    slice. These exclude at most countably many proper analytic sets and the measure-zero exceptional sets for
    current restrictions.
  Write the restricted determinant line as
  $ \( det cal(F)_j^(+) \) \|_S = pi_S^(*) cal(Q)_j^(+) ⊗ cal(O)_S \( ell_j^(+) \) \, wide Q_j^(+) =
    c_1 \( cal(Q)_j^(+) \) . $
  Factoring the common zero of order $h_j$ from the determinant map gives a nonzero map whose source on $S$ is
  $ pi_S^(*) \( cal(Q)_j^(+) ⊗ cal(O)_Y \( h_j F \) \) ⊗ cal(O)_S \( ell_j^(+) \) . $
  The plus sign of $h_j F$ follows because division of the map by the local equation of $J_(+)^(h_j)$ enlarges its
    source from $det cal(F)_j^(+)$ to $det cal(F)_j^(+) ⊗ cal(O) \( h_j J_(+) \)$.
    Its target embeds into the $j s R_j^(+)$-fold tensor of the restriction of $p_(+)^(*) Omega_Z$.
    In particular we use the cotangent bundle of the original $Z$, with its restricted filtration
  $ 0 arrow.r pi_S^(*) \( cal(O)_Y^(xor n) xor a^(*) Omega_X \) arrow.r \( p_(+)^(*) Omega_Z \) \|_S arrow.r
    cal(O)_S \( - 2 \) ⊗ pi_S^(*) a^(*) cal(L) arrow.r 0 . $
  The same homogeneous-monomial calculation as in Equation (5.23),
    now applying Equation (5.2) to the second factor of $X^2$, gives
  #[#set math.equation(numbering: n => "(5.37)")
   $ ell_j^(+) lt.eq 0 \, wide Q_j^(+) + h_j { F } lt.eq \( j s R_j^(+) - ell_j^(+) \) a^(*) L .
     $ <zero:determinant-bound-slice>]
  More explicitly, if the chosen graded term has $i$ relative factors, the pushed polynomial has degree $- 2 i -
    ell_j^(+) gt.eq 0$. Its exponent in $a^(*) cal(L)$, together with the $i$ relative factors and the cotangent
    order from the second factor of $X^2$, is at most $j s R_j^(+) - ell_j^(+)$.
    The cotangent factors from the first factor of $X^2$ are constant.
    This proves the displayed inequality using the tensors of $a^(*) Omega_X$,
    without introducing $Omega_Y$ or $Omega_(Z^(+))$.
  Apply Lemma 26 to the decomposition in Equation (5.31). Equation (5.17) shows that the limits of the restricted
    determinant components divided by $j R_j^(+)$ exist; denote them by $Q^(+)$ and $ell^(+)$.
    Divide Equation (5.37) by $j R_j^(+)$, use Equation (5.32), and pass to the closed pseudo-effective cone. We obtain
  #[#set math.equation(numbering: n => "(5.38)")
   $ ell^(+) lt.eq 0 \, wide Q^(+) + c_n s { F } lt.eq \( s - ell^(+) \) a^(*) L . $ <zero:slice-upper>]
  The pseudo-effective class in Equation (5.17), restricted to the very general slice $S$, is
  #[#set math.equation(numbering: n => "(5.39)")
   $ pi_S^(*) \( Q^(+) + 2 a^(*) P \) + \( ell^(+) + 2 q \) xi gt.eq 0 . $ <zero:slice-psef>]
  Testing on a general vertical line gives $ell^(+) + 2 q gt.eq 0$.
    Let $A subset S$ be the axis of $bb(P)_Y \( cal(O)_Y xor a^(*) cal(L) \)$ with divisor class ${ A } = xi$.
    On $A tilde.eq Y$, its normal class is ${ A } \|_A = xi \|_A = a^(*) L gt.eq 0$.
    Add an arbitrarily small Kähler class to the class in Equation (5.39),
    and choose a Kähler current with analytic singularities in the resulting big class.
    Remove its generic divisorial pole along $A$ and restrict the residual current to $A$.
    Adding back the removed nonnegative multiple of $a^(*) L$ preserves pseudo-effectivity. Passing to the limit gives
  #[#set math.equation(numbering: n => "(5.40)")
   $ Q^(+) + 2 a^(*) P + \( ell^(+) + 2 q \) a^(*) L gt.eq 0 . $ <zero:slice-lower>]
  The slope bound in Equation (5.38) supplies the pseudo-effective class $\( s - ell^(+) \) a^(*) L - Q^(+) -
    c_n s { F }$. Adding it to Equation (5.40) cancels the entire normalized determinant class restricted to the
    axis, $Q^(+) + ell^(+) a^(*) L$, leaving
  $ 2 a^(*) P + \( s + 2 q \) a^(*) L - c_n s { F } gt.eq 0 . $
  Since $L lt.eq P \/ r$, the point bound in Equation (5.8) implies
  #[#set math.equation(numbering: n => "(5.41)")
   $ frac(c_n s, thin 2 + \( s + 2 q \) \/ r thin) lt.eq C_n . $ <zero:contradiction>]
  The denominator is bounded independently of $q$, because $s lt.eq C_n q^(1 \/ d)$ and $r gt.eq q^2$.
    The numerator tends to infinity, because $s gt.eq c_n q^(1 \/ d)$.
    Equation (5.41) is impossible for arbitrarily large $q$.
  For each $q$, the choice of $t \( q \)$, the rational $s$, the current $T$,
    and the modifications precedes the limit in $j$. The monomial cutoff $delta$ depends only on $n$,
    while the required lower bound for divisible $j$ may depend on the fixed data.
    We choose the very general points after those data are fixed.
    Thus every simultaneous general-point test above involves at most countably many conditions,
    and no bound depends on the point. The contradiction disproves the contrary hypothesis and proves Proposition 21. ◻
]

=== 5.4 Vanishing on the simple model <vanishing-on-the-simple-model>

We now apply Proposition 21 to the sum of the canonical bundle and the nef line bundle whose class we wish to
  eliminate. The remaining use of the ordinary adjoint decomposition is particularly short:
  it turns meromorphic nonvanishing into both signs of pseudo-effectivity.

#thm([Proposition 5.17.])[
  #emph[Let $X$ be a smooth simple compact Kähler manifold of algebraic dimension zero carrying a generically
    nondegenerate holomorphic two-form. Every nef rational holomorphic line bundle on $X$ has zero first Chern class.]
] <zero:simple-vanishing>

#proof[
  The assertion is immediate for a point. A positive-dimensional space of algebraic dimension zero cannot be a
    curve, so assume $dim X gt.eq 2$. If $q \( X \) > 0$, its Albanese map is generically finite onto its image,
    by simplicity. Ueno’s structure theorem for subvarieties of complex tori makes this image a translate of a
    torus: its quotient by the connected stabilizer is of general type,
    and positive dimension of that quotient would contradict algebraic dimension zero #cite(label("Ueno")).
    Lemma 17 proves the conclusion.
  The same argument applies after any smooth generically finite Kähler cover of $X$ having positive irregularity.
    Such a cover is still simple and has algebraic dimension zero; vanishing upstairs descends by push–pull.
    We may therefore suppose that every such cover has irregularity zero.
    Lemma 19 then describes the subvarieties through a very general point of $X^2$.
  Clear denominators and let $N_0$ be the resulting nef holomorphic line bundle.
    A top wedge of the generically nondegenerate two-form is a nonzero holomorphic section of $K_X$.
    In particular $K_X$ is effective. Set
  $ cal(L) = K_X + N_0 \, wide L = c_1 \( cal(L) \) . $
  The class $L$ is pseudo-effective and dominates $c_1 \( K_X \)$. Lemma 20 supplies both slope inequalities.
    Every hypothesis of Proposition 21 is now satisfied. Some positive power of $K_X +
    N_0$ therefore has a nonzero meromorphic section. Dividing by the corresponding power of a canonical section
    shows that $N_0$, as a rational line bundle, is represented by a signed divisor.
  Resolve its positive and negative parts. On the resulting smooth Kähler model write
  $ N_0 tilde.op_(bb(Q)) E - G \, wide E \, G gt.eq 0 \, $
  with rational coefficients and simple normal crossing union of their supports;
    we suppress the pullback notation for $N_0$. The canonical bundle $K'$ of this model remains effective.
    Choose a small rational $u > 0$ so that both $u E$ and $u G$ are klt boundaries.
    The ordinary decomposition, Theorem 5, applies to $K' + u E$ and $K' + u G$.
    On a common higher model, denote their pulled back classes by $alpha_E$ and $alpha_G$.
    Algebraic dimension zero makes each semiample part rationally trivial,
    so that the pulled back rational lines equal their negative divisors.
    Since $alpha_E - alpha_G = u { N_0 }$ is nef, Lemma 4 (2) gives
  $ N \( alpha_E \) lt.eq N \( alpha_G \) \, wide u { N_0 } = { N \( alpha_E \) - N \( alpha_G \) } . $
  Thus $- { N_0 }$ is pseudo-effective, whereas ${ N_0 }$ is nef.
    Pairing both classes with a Kähler power gives zero mass, and hence ${ N_0 } = 0$.
    Pullback injectivity yields the same conclusion on $X$. ◻
]

#proof[
  Lemma 18 reduces the assertion to Proposition 32, which proves it.
    In particular, once the induction has reached dimension $n$, the ordinary decomposition of $K_T +
    B$ also proves the decomposition assertion of Theorem 2 in algebraic dimension zero:
    adding the nef line changes no Chern class. Its semiample positive part is rationally trivial,
    and its negative part is unchanged. ◻
]

== 6 The nef summand on the algebraic-reduction fibers <sec:cycles>

Let $T$ be a smooth compact Kähler manifold of dimension $n$, and suppose that $0 < a \( T \) < n$.
  After resolving its algebraic reduction, we have a fibration $h : T arrow.r W$ with $W$ smooth projective.
  The objective of this section is to show that a nef rational line bundle $M$ occurring in the adjoint
  decomposition theorem has numerically trivial restriction to a general fiber of $h$.
  Proposition 8 will then descend its class to $W$, after modifications.

The inductive decomposition on an individual fiber supplies a semiample positive part only up to a flat twist.
  To obtain sections on the total space, we must choose the twists from a countable collection of global line
  bundles. Relative divisor cycles provide the required countable collection of maps.
  We first isolate the two ingredients of this construction.

=== 6.1 Sections and coherent base change <sections-and-coherent-base-change>

#thm([Lemma 6.1.])[
  #emph[Let $h : X arrow.r W$ be a holomorphic algebraic reduction of a smooth connected compact complex manifold,
    with connected fibers and smooth projective base. Let $\( L_i \)_(i in I)$ be a countable collection of
    rational holomorphic line bundles on $X$. Outside a countable union of nowhere dense subsets of $W$,
    a smooth fiber $F$ of $h$ satisfies
$ kappa \( F \, L_i \|_F \) lt.eq 0 wide upright("for every ") i in I . $

 Any prescribed countable collection of further conditions holding on dense open subsets of $W$ can be imposed on
   the same fiber.]
] <cycle:sections>

#proof[
  Choose a positive integer $q_i$ such that $q_i L_i$ is an actual line bundle.
    For every positive multiple $m$ of $q_i$, the proper direct-image theorem gives a coherent analytic sheaf
  $ cal(E)_(i \, m) = h_(*) cal(O)_X \( m L_i \) $
  on $W$. Work over the smooth-fibration locus, where the line bundle is flat over the base.
    On a dense open set where the dimension of fiberwise sections is locally constant,
    coherent base change gives the isomorphism
  #[#set math.equation(numbering: n => "(6.1)")
   $ cal(E)_(i \, m) ⊗ bb(C) \( w \) tilde.eq H^0 \( X_w \, cal(O)_(X_w) \( m L_i \|_(X_w) \) \) $ <cycle:base-change>]
  by #cite(label("Grauert")) Section 7, Satz 5. It suffices here to delete proper analytic subsets within dense
    open sets of $W$. Fix an ample line bundle $H$ on $W$. By GAGA and Serre’s theorem,
    $cal(E)_(i \, m) ⊗ H^(k_(i \, m))$ is generated by global sections for some integer $k_(i \, m)$.
    The projection formula and (6.1) therefore show that all sections of $m L_i \|_(X_w)$ lift,
    after choosing a nonzero frame of $H^(k_(i \, m))$ at $w$, to global sections of
  $ cal(O)_X \( m L_i \) ⊗ h^(*) H^(k_(i \, m)) . $
  There are only countably many pairs $\( i \, m \)$. Choose $w$ in the smooth locus of $h$,
    outside all the base-change exceptions and the further generic exceptions in the statement.
    If $kappa \( X_w \, L_i \|_(X_w) \) > 0$, some divisible $m$ has two sections whose ratio is nonconstant on
    the connected fiber $X_w$. Lifting these sections as above gives a meromorphic function on $X$ whose
    restriction to $X_w$ is that ratio. Every meromorphic function on $X$ factors through its algebraic reduction.
    Such a function, when defined on a nonempty open subset of the smooth fiber $X_w$, is constant there:
    a local holomorphic section of $h$ through a point where the quotient is holomorphic shows that the base
    function extends holomorphically at $w$. This contradicts the chosen nonconstant ratio.
  The countable simultaneous choice is legitimate by Baire’s theorem.
    If a generic assertion is initially established on a dense open set,
    a proper analytic exceptional subset of that open is still nowhere dense in $W$.
    Thus such generic assertions can also be included in the choice. ◻
]

=== 6.2 Divisor incidence and a countable collection of fibrations <divisor-incidence-and-a-countable-collection-of-fibrations>

We use the cycle-space results of Barlet, Lieberman, and Fujiki #cite(label("Barlet"))
  #cite(label("LiebermanCycles")) #cite(label("Fujiki1978")) #cite(label("Fujiki")).
  In the form needed here, the spaces of effective cycles of a compact Kähler manifold have countably many
  irreducible components; each component is compact and belongs to Fujiki’s class $cal(C)$;
  see #cite(label("Fujiki")) p. 189. The locus of cycles contained in a fiber of a proper map is an analytic
  relative cycle space #cite(label("Fujiki1978")) Proposition 3.2.
  We also use the meromorphic fiber map obtained by analytic flattening:
  after modifying the base, the flat strict transform has an analytic family of fiber cycles and hence a
  holomorphic map to the cycle space #cite(label("Barlet")) Chapter V.
  All parameter spaces and images in class $cal(C)$ will be replaced by smooth compact Kähler models when needed.

The following observation explains why the numerical class of a divisor can detect a semiample fibration without
  fixing its flat twist.

#thm([Lemma 6.2.])[
  #emph[Let $F$ be a smooth connected compact Kähler manifold, let $A$ be a rational line bundle on $F$,
    and suppose that a modification $rho : hat(F) arrow.r F$ from a smooth compact Kähler manifold satisfies
#[#set math.equation(numbering: n => "(6.2)")
 $ rho^(*) A equiv P + R \, wide P upright(" semiample") \, wide R =
   N \( c_1 \( rho^(*) A \) \) upright(" a rational divisor") . $ <cycle:fiber-decomposition>]

 Let $g : hat(F) arrow.r Q$ be the fibration defined by $P$,
   so that $Q$ is normal projective and $P tilde.op_(bb(Q)) g^(*) H_Q$ for an ample rational line bundle $H_Q$.
   There is a dense open subset $U subset F$, independent of the divisors below,
   with the following properties for every sufficiently divisible positive integer $m$.]
  + #emph[There exists an analytic family of effective divisors on $F$ with class $m
    c_1 \( A \)$ that distinguishes the general fibers of the meromorphic fibration $g compose rho^(- 1)$.]
  + #emph[For every effective divisor $D$ with class $m c_1 \( A \)$,
    membership in $"Supp" D$ is constant along the intersection of $U$ with a general smooth fiber of that
    meromorphic fibration.]
] <cycle:divisors>

#proof[
  The difference between the two sides of (6.2) is flat as a rational line bundle.
    By Lemma 3, there is a flat rational line bundle $eta$ on $F$ such that
  $ rho^(*) \( A + eta \) tilde.op_(bb(Q)) P + R . $
  Choose $m$ clearing the denominators and such that $m H_Q$ is very ample. The divisors
  $ g^(*) D_Q + m R \, wide D_Q in \| m H_Q \| \, $
  descend to an analytic family of divisors on $F$ with class $m c_1 \( A \)$.
    Indeed $rho_(*) cal(O)_(hat(F)) = cal(O)_F$, so the projection formula identifies sections of
    $m \( A + eta \)$ with sections of its pullback. On the isomorphism locus of $rho$, away from $"Supp" R$,
    they distinguish general $g$-fibers, since hyperplanes distinguish points of $Q$.
  For an arbitrary effective divisor $D$ of this class, Lemma 4(1) gives
  $ rho^(*) D gt.eq m R . $
  The residual divisor $D' = rho^(*) D - m R$ is effective and has class $m c_1 \( P \)$.
    Let $G$ be a smooth compact connected fiber of $g$. If $D'$ does not contain $G$,
    its restriction is an effective divisor of class zero on $G$, hence is empty:
    in positive dimension this follows by integrating against a Kähler form to the appropriate power.
    Consequently $"Supp" D'$ either contains $G$ or misses it.
    For a point fiber the same alternative is immediate. Taking the image of the isomorphism locus of $rho$,
    and deleting $"Supp" R$ and the nonsmooth locus of $g$, gives the stated open set $U$.
    This choice uses only $rho$, $R$, and $g$, and works for all the divisors simultaneously. ◻
]

#thm([Lemma 6.3.])[
  #emph[Let $h : X arrow.r W$ be a fibration of smooth connected compact Kähler manifolds with $dim W < dim X$,
    and let $A$ be a rational line bundle on $X$. There is a countable collection of diagrams
(6.3)
#cetz.canvas({
  import cetz.draw: *
  content((0, 1.15), [$X_i$])
  content((2.7, 1.15), [$Z_i$])
  content((0, 0), [$X$])
  content((2.7, 0), [$W$])
  line((0.3275, 1.15), (2.373, 1.15), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.35, 1.15), [$f_i$], anchor: "south", padding: 0.1176cm)
  line((0, 0.8784), (0, 0.2451), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.575), [$p_i$], anchor: "east", padding: 0.1176cm)
  line((2.7, 0.8784), (2.7, 0.2451), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.7, 0.575), [$k_i$], anchor: "west", padding: 0.1176cm)
  line((0.2657, 0), (2.434, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.35, 0), [$h$], anchor: "north", padding: 0.1176cm)
})

 where $p_i$ is a modification, $f_i$ is a fibration, and $X_i \, Z_i$ are smooth compact Kähler manifolds,
   with the following property.]
  #emph[For a very general smooth fiber $F = X_w$, suppose that a smooth compact Kähler modification $rho :
    hat(F) arrow.r F$ has a decomposition (6.2) for $A \|_F$, and that the fibration $g : hat(F) arrow.r
    Q$ defined by $P$ has positive-dimensional base. For some $i$,
    the restriction of $f_i$ over $w$ is bimeromorphically equivalent to $g$.
    In particular, on a common resolution, their general fibers coincide.
    The collection and the exceptional subsets of $W$ can be fixed before $F$, $rho$, $P$, and $R$ are chosen.]
] <cycle:detection>

#proof[
  We associate a map to each component of the relative divisor space by recording all its divisors through a
    point. On a fiber with the stated decomposition, Lemma 34 makes these incidence supports constant along the
    semiample fibration. Integral multiplicities will then give constancy of the cycle maps themselves,
    while the distinguishing linear system will give the converse.
  Put $d = dim X - dim W$, and let $W^compose$ be the smooth-fibration locus of $h$.
    Consider the relative cycle spaces whose points are pairs $\( w \, D \)$,
    where $D$ is an effective $\( d - 1 \)$-cycle in $X_w$. They are closed subspaces of the product of $W$ with
    the corresponding compact cycle components of $X$. Thus they have countably many compact irreducible
    components in class $cal(C)$.
  For each positive integer $m$ clearing the denominator of $A$,
    retain the components meeting $W^compose$ on which the divisor class is $m c_1 \( A \|_(X_w) \)$.
    This is a condition on an entire component over $W^compose$:
    in a smooth family the cohomology class of an analytic family of cycles is locally constant,
    and $c_1 \( A \)$ supplies a global section of the same cohomology local system.
    After resolving a component, its open part over $W^compose$ is connected,
    so equality at one point implies equality throughout that part.
    Components not dominating $W$ have proper analytic images; exclude all these images from the eventual choice of $w$.
  Fix a retained dominating component and a smooth compact Kähler resolution $S$ of it.
    Denote its divisor at $s in S$ by $D_s$ and form the incidence
  $ cal(I)_S = { \( x \, s \) in X times S : x in "Supp" D_s } . $
  We take the incidence of the analytic cycle family, including its limits from the open part over $W^compose$.
    Over that open part it is a family of pure $\( d - 1 \)$-dimensional cycles.
    Hence every irreducible component there dominates $S$ and has dimension $dim S + d - 1$.
    Let $I_1 \, dots.h \, I_t$ be the incidence components that dominate $X$.
    The other components have proper analytic images in $X$; outside those images they contribute nothing to incidence.
  For each $I_j arrow.r X$, analytic flattening gives a meromorphic map recording its generic fiber as an
    effective cycle in $S$. All these cycles have dimension
  $ e = dim S + d - 1 - dim X . $
  Taking the tuple of these maps, together with $h$, gives a meromorphic map $Phi_S$ from $X$ into $W$ times a
    finite product of compact cycle components of $S$. On a dense open subset of $X$,
    the union of the supports of the recorded cycles is precisely
  #[#set math.equation(numbering: n => "(6.4)")
   $ { s in S : x in "Supp" D_s } . $ <cycle:incidence-support>]
  In obtaining this open set we discard the images of the nondominating incidence components and the exceptional
    sets of the fiber maps. The target components and the image of $Phi_S$ belong to class $cal(C)$.
    Resolving the graph, taking Stein factorization, and replacing the base by a smooth compact Kähler model
    therefore gives a diagram (6.3). The coordinate $h$ ensures that its base maps to $W$.
    If there is no dominating incidence component, we retain only the coordinate $h$;
    such a component will not be needed to detect a positive-dimensional $Q$.
  This construction gives countably many diagrams. Fix their models, their incidence-recording open sets,
    and their Stein factorizations. We may simultaneously require that their fibers over the eventual $w$ be
    smooth, that $p_i$ restrict to a modification over $w$, and that each of the dense open sets used meet the
    corresponding fiber densely. For any one diagram these are generic conditions, by properness,
    generic smoothness, and the fiber-dimension theorem. In particular,
    let $U_i subset Z_i$ be the locus over which $f_i$ is smooth.
    We require that $k_i^(- 1) \( w \)$ meet $U_i$ densely. To justify this condition,
    a component of $Z_i \\ U_i$ that does not dominate $W$ has proper image,
    whereas a component dominating $W$ has general fiber of dimension strictly less than $dim Z_i - dim W$.
    Since the general $k_i$-fiber is smooth of that pure dimension,
    it cannot have a component contained in $Z_i \\ U_i$. The same conditions may be imposed after any preselected
    countable collection of further modifications of these diagrams.
  We now choose such a very general $w$ and a decomposition on $F = X_w$ as in the statement.
    By Lemma 34, a projective linear system of divisors of class $m
    c_1 \( A \|_F \)$ distinguishes the general $g$-fibers for some $m$.
    Its image in the relative cycle space is irreducible and lies in one irreducible component.
    That component dominates $W$, since all images of nondominating components were excluded.
    It is therefore one of the components used above. Passing to its parameter resolution $S$ preserves the
    distinguishing property: every divisor still has a preimage in $S$.
  The map $Phi_S \|_F$ distinguishes general $g$-fibers. Indeed two different general points of $Q$ are separated
    by a divisor in the chosen linear system, so their incidence supports (6.4) differ.
    Conversely, fix a general smooth connected $g$-fiber $G$.
    On the common open set of Lemma 34 and the incidence recording,
    membership in every divisor $D_s$ is constant along $G$. Thus the support in (6.4) is fixed as the point moves
    in that open part of $G$.
  This support assertion also gives constancy of the recorded #emph[cycles].
    Their fixed union of supports is pure $e$-dimensional and has finitely many irreducible components.
    Since all recorded cycles have dimension $e$, there are only countably many possible tuples of effective
    cycles supported there: their multiplicities are nonnegative integers.
    A holomorphic map from a connected complex manifold with countable image is constant.
    Removing a proper analytic subset from the smooth connected $G$ leaves a connected open set,
    so $Phi_S$ is constant on a general $g$-fiber. Point fibers require no separate argument.
  Constancy on the general connected fibers gives a meromorphic factorization through $Q$.
    One can see this by taking the image of the graph in $Q$ times the target:
    its projection to $Q$ has one-point general fibers and is bimeromorphic.
    The distinguishing property makes the induced map from $Q$ generically one-to-one onto its image.
    Hence $Phi_S \|_F$ defines the same meromorphic fibration as $g$.
  Finally, the restriction of $f_i$ over $w$ still has connected fibers:
    its fibers are exactly the corresponding fibers of $f_i$.
    Its base over $w$ is connected, being the image of the connected source fiber.
    The finite map in Stein factorization cannot split a connected general $g$-fiber:
    a map from that fiber into a finite set is constant. The preselected resolutions restrict to modifications
    over $w$. Thus the same comparison holds for $f_i$, proving the assertion. ◻
]

=== 6.3 Vanishing of the nef class on the fibers <vanishing-of-the-nef-class-on-the-fibers>

We can now choose the flat twists on the total space. The order of choice is essential:
  the following proof fixes a countable collection of global representatives before it chooses the smooth fiber.

#thm([Proposition 6.4.])[
  #emph[Assume Theorem 2 in dimensions less than $n$. Let $T$ be a smooth connected compact Kähler $n$-fold with
    $0 < a \( T \) < n$, and let $h : T arrow.r W$ be a holomorphic algebraic reduction with smooth projective
    base and connected fibers. Let $B$ be an effective rational SNC divisor with coefficients less than one,
    assume that $J = K_T + B$ is pseudo-effective, and let $M$ be a nef rational line bundle. Then
$ c_1 \( M \|_F \) = 0 $

 for a general smooth fiber $F$ of $h$.]
] <cycle:nef-summand>

#proof[
  Set $A = J + M$. By Theorem 5, fix an effective rational divisor $E$ with $J tilde.op_(bb(Q)) E$.
    Apply Lemma 35 to $h$ and $A$, and fix its countable collection $\( p_i \, f_i \, k_i \)$.
    Let $I_0$ be the subset of indices for which $c_1 \( p_i^(*) M \)$ vanishes on the general smooth fiber of
    $f_i$. For every $i in I_0$, apply Corollary 9 to $p_i^(*) M$ on $X_i$.
    It gives a representative on $X_i$ differing from $p_i^(*) M$ by a flat rational line.
    By Lemma 3(2), that flat difference comes from $T$. We therefore obtain a rational line bundle $M_i^(*)$ on
    $T$, with
  $ M_i^(*) equiv M \, $
  whose pullback is an actual rational pullback from the intermediate base,
    after further modifications of the diagram. Fix one such representative and one such diagram for every $i in
    I_0$. In particular, $M_i^(*)$ restricts rationally trivially to a general fiber of that modified fibration.
    This is a countable collection of choices on $T$.
  Choose $w in W$ simultaneously satisfying the detection lemma and its generic conditions for all the further
    diagrams just fixed. Require also the conclusion of Lemma 33 for the countable collection
  $ \( J + M_i^(*) \)_(i in I_0) . $
  We take $F = T_w$ smooth, with $B \|_F$ an SNC klt boundary.
    We also require that the defining section of $E$ restrict nontrivially to $F$; then
  $ J_F := K_F + B \|_F tilde.op_(bb(Q)) E_F := E \|_F gt.eq 0 . $
  All the choices preceding $w$ depend only on data on the total space.
  Suppose, towards a contradiction, that $M \|_F equiv.not 0$.
    The lower-dimensional decomposition theorem gives a modification $rho : hat(F) arrow.r F$ and
  #[#set math.equation(numbering: n => "(6.5)")
   $ rho^(*) \( J_F + M \|_F \) equiv P_F + R_F \, wide R_F = N \( c_1 \( rho^(*) \( J_F + M \|_F \) \) \) \,
     $ <cycle:inductive-decomposition>]
  where $P_F$ is semiample and $R_F$ is a rational effective divisor.
    Lemma 4, applied to the nef summand $rho^(*) \( M \|_F \)$, gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ R_F lt.eq N \( c_1 \( rho^(*) J_F \) \) lt.eq rho^(*) E_F \, wide P_F equiv \( rho^(*) E_F - R_F \) +
     rho^(*) \( M \|_F \) . $ <cycle:residual-effective>]
  Let $g : hat(F) arrow.r Q$ be the fibration defined by $P_F$.
    If $Q$ were a point, the last equality would make a nef class and an effective divisor sum to zero.
    Pairing with a Kähler power would give $rho^(*) \( M \|_F \) equiv 0$, contrary to the assumption.
    Hence $dim Q > 0$.
  On a general smooth $g$-fiber $G$, the class of $P_F$ is zero.
    Restricting the last equality in (6.6) and using the same positivity argument shows that
  #[#set math.equation(numbering: n => "(6.7)")
   $ c_1 \( rho^(*) \( M \|_F \) \|_G \) = 0 \, wide G ∩ "Supp" \( rho^(*) E_F - R_F \) =
     diameter . $ <cycle:restriction-zero>]
  If $G$ is a point, the first assertion is automatic and the second holds for a general point.
    In positive dimension, choose a general fiber not contained in the effective divisor, restrict it,
    and integrate the effective and nef classes against a Kähler power. Both nonnegative masses must vanish.
  Lemma 35 gives an index $i$ such that the restriction of $f_i$ over $w$ and $g$ have the same general fibers up
    to modifications. By (6.7) and injectivity of pullback on cohomology,
    $p_i^(*) M$ has class zero on a smooth $f_i$-fiber above $w$.
    Such a fiber can be chosen in the smooth-fibration locus of $f_i$, by the generic conditions already imposed.
    Over the connected smooth locus in $Z_i$, the restrictions of this Chern class form a locally constant section
    of $R^2 \( f_i \)_(*) bb(R)$. Vanishing at one fiber therefore implies vanishing at every fiber in this locus.
    Thus $i in I_0$; its representative $M_i^(*)$ was already chosen before $w$.
  We claim that
  #[#set math.equation(numbering: n => "(6.8)")
   $ kappa \( F \, J_F + M_i^(*) \|_F \) > 0 . $ <cycle:positive-kappa>]
  On a common resolution of the maps on $F$, the line $M_i^(*) \|_F$ is rationally trivial on a general $g$-fiber
    because it is a pullback from the intermediate base of $f_i$.
    This triviality descends between smooth models of the fiber:
    for a modification, pullback on line bundles is injective by normality and the projection formula. The difference
  $ Lambda = rho^(*) \( J_F + M_i^(*) \|_F \) - P_F - R_F $
  is a flat rational line bundle by (6.5). Its restriction to a general $G$ is rationally trivial.
    Indeed $P_F \|_G$ is trivial, $M_i^(*) \|_G$ is trivial, and (6.7) makes
    $cal(O)_(hat(F)) \( rho^(*) E_F - R_F \) \|_G$ trivial, while $J_F tilde.op_(bb(Q)) E_F$.
  Resolve $Q$ and the induced map, and continue to denote the resulting fibration between smooth models by $g$.
    By Lemma 10, $Lambda tilde.op_(bb(Q)) g^(*) lambda$ for a flat rational line bundle $lambda$ on the smooth
    projective base. The line $P_F$ is the pullback of the ample rational line on the original $Q$;
    on its resolution the corresponding base line $H'_Q$ is nef and big. Twisting by $lambda$ preserves bigness.
    On these models we have an actual rational identity
  $ rho^(*) \( J_F + M_i^(*) \|_F \) tilde.op_(bb(Q)) g^(*) \( H'_Q + lambda \) + R_F . $
  Multiplication by the canonical section of a divisible multiple of $R_F$ embeds the section spaces of the big
    base line into the section spaces on $hat(F)$. Since $dim Q > 0$, this proves (6.8).
  This contradicts the instance of Lemma 33 imposed on $J + M_i^(*)$ when $w$ was chosen.
    Hence $M \|_F equiv 0$ for the chosen fiber. Finally, restrictions of $c_1 \( M \)$ form a locally constant
    section of $R^2 h_(*) bb(R)$ on the connected smooth locus of $h$.
    Their vanishing therefore holds on every fiber in that locus, and in particular on a general smooth fiber. ◻
]

#thm([Corollary 6.5.])[
  #emph[Under the assumptions of Proposition 36, there are modifications $p : T' arrow.r T$ and $b : W' arrow.r
    W$, with $T'$ smooth compact Kähler and $W'$ smooth projective, a fibration $h' : T' arrow.r W'$ lifting $h$,
    and a nef rational line bundle $N$ on $W'$ such that
$ p^(*) M equiv \( h' \)^(*) N . $

]
] <cycle:base-descent>

#proof[
  Proposition 36 supplies the fiberwise vanishing required in Proposition 8.
    Apply that proposition to $h$ and $M$. The modified base remains projective,
    so the descended rational class is nef. ◻
]

== 7 Completion of the induction <sec:completion>

We now combine the preceding constructions. The main geometric step is to make the ordinary adjoint semiample
  after adding a sufficiently positive line from the algebraic base, while preserving the map to that base.
  The adjoint formula of Proposition 11 then puts the problem on a projective variety.
  We first isolate the negative-part calculation needed to pull the projective answer back.

=== 7.1 Divisors above subsets of codimension at least two <divisors-above-subsets-of-codimension-at-least-two>

#thm([Lemma 7.1.])[
  #emph[Let $r : V arrow.r S$ be a surjective morphism from a smooth compact Kähler manifold to a normal
    projective variety. Let $H$ be a nef rational Cartier divisor on $S$.
    If $E gt.eq 0$ is a real divisor on $V$ whose every component has image of codimension at least two in $S$, then
$ N \( r^(*) H + E \) = E . $

]
] <finish:exceptional>

#proof[
  Put $n = dim V$, $beta = c_1 \( r^(*) H \)$, and $alpha = beta + { E }$. Nefness gives $N \( alpha \) lt.eq E$.
    Suppose
  $ U = E - N \( alpha \) > 0 . $
  Then $beta + { U } = Z \( alpha \)$ is modified nef. Write $U = sum_i u_i U_i$, with $u_i > 0$, and choose
  $ s = max_i dim r \( U_i \) lt.eq dim S - 2 . $
  In particular $0 lt.eq s lt.eq n - 2$. Let $eta$ be the pullback of an ample class on $S$,
    and let $omega$ be a Kähler class on $V$. Consider the symmetric bilinear form
  $ Q \( gamma \, delta \) = integral_V gamma thin delta thin eta^s omega^(n - s - 2) quad
    upright("on ") H^(1 \, 1) \( V \, bb(R) \) . $
  Since the image of each $U_i$ has dimension at most $s$, any pairing on $U_i$ with $s +
    1$ classes from $S$ vanishes. Therefore
  #[#set math.equation(numbering: n => "(7.1)")
   $ Q \( { U } \, eta \) = 0 \, wide Q \( { U } \, beta \) = 0 . $ <finish:orthogonal>]
  By Lemma 4(3), $Z \( alpha \)$ restricts pseudo-effectively to a resolution of $U_i$.
    Pairing there with the nef classes $eta^s omega^(n - s - 2)$ and summing over $i$ gives
  $ 0 lt.eq Q \( { U } \, Z \( alpha \) \) = Q \( { U } \, { U } \) . $
  On the other hand,
  $ Q \( eta \, eta \) = integral_V eta^(s + 2) omega^(n - s - 2) > 0 \, $
  because $s + 2 lt.eq dim S$. The mixed Hodge–Riemann relations #cite(label("DinhNguyen")) Theorem A,
    applied with $eta + epsilon omega$ and then passed to the limit,
    show that $Q$ has at most one positive eigenvalue. Thus its restriction to $eta^perp$ is negative
    semidefinite. Equations (7.1) force $Q \( { U } \, { U } \) = 0$.
    A zero-square vector for a negative semidefinite form belongs to its radical;
    decomposing every class into a multiple of $eta$ and an element of $eta^perp$ shows that ${
    U }$ belongs to the radical of the whole form $Q$.
  This contradicts
  $ Q \( { U } \, omega \) = sum_i u_i integral_(U_i) eta^s omega^(n - s - 1) > 0 . $
  Indeed every term is nonnegative, and a component with image dimension $s$ gives a strictly positive integral on
    its smooth generic locus. Consequently $U = 0$. ◻
]

This proof is the codimension-two part of the lifting argument in #cite(label("K")) Section 5.
  Its formulation above also applies to maps with positive-dimensional fibers;
  birational exceptional translation alone would not suffice at that point of our proof.

=== 7.2 Keeping the ordinary program over the algebraic base <keeping-the-ordinary-program-over-the-algebraic-base>

#thm([Proposition 7.2.])[
  #emph[Let $T$ be a smooth compact Kähler manifold of dimension $n$,
    let $\( T \, B \)$ be a rational simple normal crossing klt pair with $J = K_T + B$ pseudo-effective,
    and let $h : T arrow.r W$ be a surjective morphism to a smooth projective variety.
    There are a smooth compact Kähler modification $T_1 arrow.r T$,
    an effective klt adjoint $J_1$ on $T_1$ as in (2.1), and a finite ordinary $J_1$-negative program over $W$,
    ending at a normal compact Kähler klt pair $\( Y \, Delta \)$,
    such that for some positive integer $b$ and an ample Cartier divisor $A_W$ on $W$,
$ K_Y + Delta + b h_Y^(*) A_W $

 is semiample. Here $h_Y : Y arrow.r W$ is the descended morphism.]
] <finish:over-base>

#proof[
  Choose $A_W$ very ample and an integer $b > 2 n$, and set $C = h^(*) A_W$.
    A general member of a sufficiently high multiple of the free system $\| C \|$,
    divided by that multiple and multiplied by $b$, gives an effective rational representative of $b C$.
    Bertini’s theorem, with the multiple chosen large enough,
    makes its sum with $B$ an effective simple normal crossing klt boundary.
    Theorem 5 therefore gives a decomposition of $J + b C$.
  Pass to a higher smooth model $T_1$ and apply the convention (2.1) to the original pair $\( T \, B \)$.
    Write $J_1 = K_(T_1) + B_1$ and $C_1 = h_1^(*) A_W$. The exceptional error and Lemma 4 retain an actual identity
  #[#set math.equation(numbering: n => "(7.2)")
   $ J_1 + b C_1 tilde.op_(bb(Q)) P_1 + R_1 \, wide P_1 upright(" semiample") \, wide R_1 =
     N \( J_1 + b C_1 \) gt.eq 0 \, $ <finish:augmented-decomposition>]
  with rational terms. On this fixed model choose a fresh general fractional representative of $b C_1$,
    so that its sum with $B_1$ is again simple normal crossing and klt.
    Apply Proposition 6 to this augmented ordinary adjoint and its known negative part in (7.2).
    Its finite ordinary scaling contracts or flips detected analytic extremal rays negative for the augmented
    adjoint. It preserves the actual semiample positive line $P_1$, with a fixed generated Cartier multiple,
    and contracts the negative part $R_1$.
  The positive line $P_1$ and the fixed algebraic-base line $C_1 = h_1^(*) A_W$ have distinct roles;
    they need not be equal or proportional. Preservation of $C_1$ and of the specific morphism to $W$ follows from
    a separate ray estimate. We check inductively that each step is over $W$.
    Suppose the current model $T_i$ still has a morphism $h_i : T_i arrow.r W$ and the unaugmented pair is klt. Put
  $ J_i = K_(T_i) + B_i \, wide C_i = h_i^(*) A_W . $
  An extremal ray negative for $J_i + b C_i$ is $J_i$-negative because $C_i$ is nef.
    The Kähler klt cone theorem #cite(label("HX")) Theorem 1.3, with zero nef b-part,
    supplies a rational curve $Gamma$ generating this ray and satisfying
  $ 0 < - J_i dot.op Gamma lt.eq 2 n . $
  If $C_i dot.op Gamma > 0$, Cartier integrality gives
  $ \( J_i + b C_i \) dot.op Gamma gt.eq - 2 n + b > 0 \, $
  a contradiction. Hence $C_i$ is numerically trivial on the contracted ray.
  The contracted fibers are projective, and all their curves have class in the contracted ray.
    If their image under $h_i$ had positive dimension, a curve on a fiber would have positive degree against
    $h_i^(*) A_W$; thus $h_i$ is constant on each contracted fiber.
    Connected-fiber descent to the normal contraction base factors $h_i$ through it.
    For a flip, composing the morphism from the flipped space with this base map gives the next $h_i$.
    The added line is consequently the same Cartier pullback $C_(i + 1) = h_(i + 1)^(*) A_W$ on the next model.
    Each step is also $J_i$-negative, and the unaugmented ordinary klt pair persists.
    This proves the induction through the finite program. On a common resolution the two pullbacks of the line
    from $W$ agree. Subtracting $b$ times this pullback from the augmented comparison therefore gives an effective
    exceptional comparison for the unaugmented adjoints as well.
    Writing $P_Y$ for the descended positive line, the final actual rational-line identity is
  $ K_Y + Delta + b h_Y^(*) A_W tilde.op_(bb(Q)) P_Y . $
  The line $P_Y$ is semiample by Proposition 6, which proves the required semiampleness of the augmented adjoint. ◻
]

The degree argument is the familiar way of preserving a nef Cartier line in an adjoint program;
  compare #cite(label("K")) Lemma 3.6 and #cite(label("P")) Section 8.2.
  Here preservation of the line also preserves the specific morphism to $W$.

=== 7.3 The strengthened decomposition <the-strengthened-decomposition>

#proof[
  We induct simultaneously on $n = dim T$ for both assertions of the theorem. Dimension zero is immediate.
    Suppose both assertions hold in every dimension less than $n$.
    The projective case of the decomposition is Proposition 7.
    If $a \( T \) = 0$, Proposition 16 gives $M equiv 0$; ordinary decomposition then proves the required
    statement for $J + M$. It remains to treat
  $ 0 < a \( T \) < n . $
  Resolve the algebraic reduction. This changes the ordinary adjoint by (2.1),
    so we may work on the resulting smooth Kähler model and remove its exceptional error at the end.
    We obtain a morphism $h : T arrow.r W$ with connected fibers and smooth projective $W$, where $dim W =
    a \( T \)$. By Proposition 36 and Corollary 37, after further modifications if needed,
    there is a nef rational line $N_W$ on $W$ such that
  #[#set math.equation(numbering: n => "(7.3)")
   $ M equiv h^(*) N_W . $ <finish:nef-descent>]
  Apply Proposition 39. On its final model $Y$, write $J_Y = K_Y + Delta$.
    The map defined by a generated multiple of $J_Y + b h_Y^(*) A_W$, together with $h_Y$,
    has image in a product of projective varieties. Its Stein factorization is
  $ f : Y arrow.r Z \, wide j : Z arrow.r W \, $
  where $Z$ is normal projective, $f$ has connected fibers, and $h_Y = j compose f$.
    The semiample augmented line comes from $Z$; subtracting $b j^(*) A_W$ gives a rational Cartier divisor $H$ with
  #[#set math.equation(numbering: n => "(7.4)")
   $ J_Y tilde.op_(bb(Q)) f^(*) H . $ <finish:adjoint-base>]
  Surjectivity to $W$ and the definition of algebraic dimension give
  $ a \( T \) = dim W lt.eq dim Z lt.eq a \( Y \) = a \( T \) . $
  In particular $f$ has positive relative dimension.
  A divisible multiple of $J_1$ has a nonzero section by Theorem 5.
    The effective exceptional comparisons in the ordinary negative program preserve these section spaces.
    Equation (7.4) and $f_(*) cal(O)_Y = cal(O)_Z$ therefore give a nonzero section of a multiple of $H$;
    in particular $H$ is pseudo-effective. Proposition 11 gives
  $ H tilde.op_(bb(Q)) K_Z + Delta_Z $
  for an effective rational boundary $Delta_Z$ with $\( Z \, Delta_Z \)$ klt. The divisor
  $ H + j^(*) N_W $
  now satisfies exactly the hypotheses of Proposition 7.
  Accordingly, take a smooth projective modification $u : Z' arrow.r Z$ and a birational morphism $v : Z' arrow.r
    Z_m$ such that
  #[#set math.equation(numbering: n => "(7.5)")
   $ u^(*) \( H + j^(*) N_W \) tilde.op_(bb(Q)) v^(*) H_m + E \, $ <finish:projective-decomposition>]
  where $H_m$ is nef rational Cartier, $E gt.eq 0$ is rational and $v$-exceptional,
    and $v^(*) H_m$ is numerically equivalent to a semiample rational line $P_(Z')$.
  Take a smooth compact Kähler common resolution $V$ of the program and of the main transform over $Z'$.
    Denote its morphisms by
  $ q : V arrow.r T_1 \, wide p : V arrow.r Y \, wide g : V arrow.r Z' \, wide r = v compose g . $
  Thus $f compose p = u compose g$. Pulling back (7.5) gives
  $ p^(*) \( J_Y + h_Y^(*) N_W \) tilde.op_(bb(Q)) r^(*) H_m + g^(*) E . $
  Every component of $g^(*) E$ maps into a subset of codimension at least two in $Z_m$. Lemma 38 therefore identifies
  $ N #scale(x: 120%, y: 120%)[\(] p^(*) \( J_Y + h_Y^(*) N_W \) #scale(x: 120%, y: 120%)[\)] = g^(*) E . $
  Its positive class is represented by the semiample rational line $g^(*) P_(Z')$.
  Finally, the ordinary program comparison gives
  $ q^(*) J_1 tilde.op_(bb(Q)) p^(*) J_Y + F \, wide F gt.eq 0 upright(" exceptional over ") Y . $
  The line from $W$ is unchanged throughout the program. Combining this equality with (7.3) yields
  $ q^(*) \( J_1 + M_1 \) equiv g^(*) P_(Z') + g^(*) E + F \, $
  where $M_1$ is the pullback of $M$. By exceptional translation,
  $ N #scale(x: 120%, y: 120%)[\(] q^(*) \( J_1 + M_1 \) #scale(x: 120%, y: 120%)[\)] = g^(*) E + F . $
  This is the required decomposition on the model $T_1$. Removing the effective resolution errors by Lemma 4(5)
    proves it for the original $T$. The zero-algebraic-dimension assertion and the decomposition have now both
    been established in dimension $n$, completing the simultaneous induction. ◻
]

=== 7.4 Descent of the semiample representative <descent-of-the-semiample-representative>

#proof[
  Apply Theorem 2 to $D = K_X + B + M$. It gives a smooth compact Kähler modification $mu : U arrow.r X$ and
  $ mu^(*) D equiv P + R \, wide P upright(" semiample") \, wide R = N \( mu^(*) D \) . $
  Since $D$ is nef, $mu^(*) D$ is nef and $R = 0$. Thus $P - mu^(*) D$ has zero real Chern class.
    By Lemma 3, it is the pullback of a rational line $F in "Pic"^0 \( X \) ⊗_(bb(Z)) bb(Q)$. Set $L = D + F$.
    Then $c_1 \( L \) = c_1 \( D \)$ and $mu^(*) L tilde.op_(bb(Q)) P$.
    The last assertion of Lemma 3 descends semiampleness to $L$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
