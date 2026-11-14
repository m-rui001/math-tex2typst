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

#align(center)[#text(size: 16pt, weight: "bold")[Relative denominators and effective systems for log Calabi-Yau fibrations]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

Let $\( X \, B \)$ be a projective log canonical pair over $bb(C)$, and let $f : X arrow.r Z$ be a contraction:
  a surjective projective morphism of normal projective varieties with $f_(*) cal(O)_X = cal(O)_Z$. We consider the case

$ K_X + B tilde.op_(bb(Q)) f^(*) D \, $

where $D$ is a rational Cartier divisor on $Z$. The adjoint of the generic fibre is then rationally linearly
  trivial. The canonical bundle formula separates the contribution of singular fibres from a moduli part on the
  base. Its qualitative form places that moduli part on a birational model as a nef rational Cartier divisor.
  For effective applications, one needs a Cartier multiple controlled by the dimension and boundary coefficients,
  rather than by the individual fibration.

This is a question about a chosen rational presentation. Replacing a base divisor by an arbitrary rationally
  linearly equivalent divisor changes the moduli part by a rational principal divisor and can introduce
  arbitrarily large denominators. We prove that, when $dim X lt.eq
  4$ and the coefficients of $B$ belong to a fixed finite rational set,
  one can choose an exact pullback presentation whose moduli part has a uniform Cartier denominator.

We recall the base data in the statement. For the given $f$, the #emph[discriminant] $B_Z$ has coefficient $1 -
  t_P$ at a prime divisor $P subset Z$, where $t_P$ is the log canonical threshold of $f^(*)
  P$ over the generic point of $P$. This is computed on a neighbourhood of that point where $P$ is Cartier.
  The moduli data form a rational b-divisor $upright(bold(M))$.
  On a birational model $q : W arrow.r Z$ where it descends,
  it is represented by a rational Cartier divisor $M_W$ and its pullbacks to higher models;
  its trace on $Z$ is $M_Z = q_(*) M_W$. The b-divisor is #emph[b-nef] if $M_W$ is nef,
  and $p upright(bold(M))$ is #emph[b-Cartier] if $p M_W$ is Cartier.
  A generalized pair $\( Z \, B_Z + M_Z \)$ has $K_Z + B_Z + M_Z$ rational Cartier,
  and its crepant boundaries are defined by

$ K_W + B_W + M_W = q^(*) \( K_Z + B_Z + M_Z \) $

and by the same rule on higher models. It is generalized lc if all coefficients of these boundaries are at most
  one, and generalized klt if they are strictly less than one.
  The crepant boundaries on higher models may have negative coefficients.

#thm([Theorem 1.1.])[
  (Uniform relative denominators).  #emph[Fix a finite set $Phi subset \[ 0 \, 1 \] ∩ bb(Q)$ and an integer $1
    lt.eq d lt.eq 4$. There are positive integers $p_0 divides p$, with $p_0$ clearing $Phi$,
    and a rational DCC set $cal(B) subset \[ 0 \, 1 \]$, depending only on $d$ and $Phi$,
    with the following property. Suppose $\( X \, B \)$ is a projective lc pair of dimension $d$ with coefficients
    in $Phi$, and
$ f : X arrow.r Z \, wide dim Z > 0 \, wide K_X + B tilde.op_(bb(Q)) f^(*) D \, $

 where $f$ is a contraction and $D$ is a rational Cartier divisor.
   There exist $psi in bb(C) \( X \)^(*)$ and $D_Z tilde.op_(bb(Q)) D$ such that
#[#set math.equation(numbering: n => "(1.1)")
 $ K_X + B + 1 / p_0 "Div" \( psi \) = f^(*) D_Z \, wide D_Z = K_Z + B_Z + M_Z . $ <eq:relative-exact-presentation>]

 Here $B_Z$ is effective with coefficients in $cal(B)$, the pair $\( Z \, B_Z + M_Z \)$ is generalized lc,
   and $upright(bold(M))$ is b-nef with $p upright(bold(M))$ b-Cartier.
   If $\( X \, B \)$ is klt, the generalized pair is generalized klt.]
] <thm:relative-denominators>

The first equality in (1.1) is an equality of actual rational divisors,
  for compatible choices of canonical divisors and the displayed rational function.
  It selects the representative $D_Z tilde.op_(bb(Q)) D$ to which the moduli bound applies.
  The two integers have distinct roles: $p_0$ gives the principal correction and, on the generic fibre,
  a trivialization in that degree; $p$ clears the moduli trace on a model determining $upright(bold(M))$.
  The discriminant is controlled instead by the fixed DCC set $cal(B)$.

=== 1.1 Denominators, positivity, and earlier work <denominators-positivity-and-earlier-work>

Fujino and Mori bound the denominator of the semistable divisor accompanying $b
  K_X$ in their canonical bundle formula, where $b$ is the least nonvanishing pluricanonical degree of the generic
  fibre. Their bound uses the middle Betti number of a smooth model of a cyclic cover of the fibre of Kodaira
  dimension zero. The proof reduces to a curve and controls a finite character through this cohomology [12]
  Theorem 3.1 and Sections 3.3, 3.6–3.8. In their klt log Iitaka setting,
  Todorov and Xu obtain a bound for the moduli denominator in terms of the boundary coefficients in relative
  dimension two, with arbitrary total dimension [21] Theorem 1.3.
  Their proof first controls surface indices and the second Betti number of a resolution of the cyclic cover,
  then applies the Fujino–Mori character method.

When the generic fibre is a rational curve, Floris bounds a common integer clearing all moduli coefficients in
  terms of the fibre Cartier index. Her examples rule out every polynomial bound for such an integer as the index
  varies [9] Theorem 1.6. For the lc total spaces of dimension at most four considered here,
  the curve reduction produces reduced special fibres of dimension at most three.
  The index of the whole reduced fibre supplies the source of uniformity in our proof.

Qualitative moduli theory supplies a different part of the argument.
  Ambro establishes rational b-Cartier descent and positivity in the klt-trivial setting [1,2],
  and Fujino and Gongyo extend b-nefness to lc-trivial fibrations [11] Theorem 3.6.
  These results put the moduli data on a suitable base model and make the determining divisor nef;
  their Cartier multiple may depend on the fibration. We use this descent and nefness after fixing the exact
  rational trivialization and verifying the required rank-one condition,
  and obtain a common multiple by a separate special-fibre calculation.
  The preprint of Bakker, Filipazzi, Mauri and Tsimerman proves qualitative b-semiampleness for lc-trivial
  fibrations with generically effective boundary [3] Theorem 1.5.
  Their Section 7.2.4 discusses the general effective question and known special cases,
  where one seeks a uniform multiple that is base point free on a determining model.
  A bound for the Cartier denominator makes a multiple Cartier on such a model;
  base point freeness is an additional condition, and is not used here.

The argument on a reducible fibre also has an established ancestry.
  Fujino’s admissible and preadmissible sections organize pluricanonical descent across the conductor [10]
  Definition 4.1 and Lemma 4.2. Gongyo uses this framework in the abundance theorem for numerically trivial slc
  adjoints [13] Theorem 1.5 and Section 5. Jiang and Liu supply the uniform index theorem for projective slc log
  Calabi–Yau pairs through dimension three that we use below [16] Corollary 1.6, arXiv version 1.
  The relevant output is one trivialization on the slc pair itself, with its conductor gluing.
  It is this global form that permits the cyclic-character comparison in the present proof.

=== 1.2 The route to the relative bound <the-route-to-the-relative-bound>

Section 3 applies the lower-dimensional index theorem to the geometric generic fibre,
  whose dimension is at most three, and descends its principalization by Hilbert 90 in the same degree $p_0$.
  This fixes the exact presentation (1.1). Threshold ACC supplies the DCC set for $B_Z$.
  After applying the qualitative canonical bundle formula and passing to a smooth determining model $W arrow.r Z$,
  it remains to control one moduli coefficient at a time. For a prime $P subset W$,
  let $alpha$ be the coefficient of the pullback of $D_Z$, and let $t_P$ be the threshold computed from the
  crepant sub-pair on a resolved diagram over $W$. The coefficient of $M_W$ differs from $alpha +
  t_P$ by an integer. Section 4 takes a transverse curve slice and runs a relative dlt MMP to obtain an exact
  local identity on a dlt model. Adjunction in Section 5 then gives an slc pair $\( T \, B_T \)$ on the whole
  connected reduced special fibre, with $dim T lt.eq 3$ and $K_T + B_T tilde.op_(bb(Q)) 0$.

The decisive uniform input is a form on this entire fibre.
  Global ACC places the different coefficients in a fixed finite set.
  The Jiang–Liu index theorem then gives a nowhere-vanishing log pluricanonical form $u$ on $T$ in one even
  multiple $p$ of $p_0$. The local residue test compares its pullback with the residues of an ambient form on a
  normalized cyclic cover; that ambient form carries the character recording the remaining denominator.
  The comparison may use a larger, pair-dependent degree for ambient adjunction,
  but it yields one scalar on each normalized component of the connected reduced covering fibre $T_Y$.
  In the uniform degree $p$, the local conductor calculation shows that each tuple has matching nonzero next
  residues at a generic crossing of two components. Their scalars therefore agree across intersections and hence
  on all of $T_Y$. The ambient tuple is therefore one scalar multiple of the invariant pullback of $u$,
  even when the cyclic group permutes components. Its character is trivial in degree $p$,
  giving $p \( alpha + t_P \) in bb(Z)$ and the required Cartier bound.

=== 1.3 Effective systems and torsion <effective-systems-and-torsion>

When $D$ is big, Proposition 3 gives an integer $m = m \( d \, Phi \)$ such that,
  for every positive multiple $l$ of $m$, the complete rounded divisorial system

$ lr(|⌊l \( K_X + B \)⌋|) $

is nonempty and its section ratios generate exactly $bb(C) \( Z \) subset bb(C) \( X \)$.
  Here the sheaf is the rank-one reflexive divisorial sheaf.
  Equality of the embedded fields recovers the finite part of the fibration as well as the dimension of its image.

For every positive $l$ divisible by $p_0$, Section 6 uses the exact presentation to identify the full section
  spaces inside $bb(C) \( X \)$:

$ H^0 #h(-0.16667em) (X \, cal(O)_X \( floor.l l \( K_X + B \) floor.r \)) =
  psi^(l \/ p_0) f^(*) H^0 #h(-0.16667em) (Z \, cal(O)_Z \( floor.l l D_Z floor.r \)) \, $

where $f^(*)$ means pullback of rational functions. The valuation argument works for reflexive sheaves without
  requiring $l \( K_X + B \)$ to be Cartier. Birkar–Zhang’s polarized effective birationality theorem applies to
  the resulting big lc adjoint on $W$, with fixed DCC boundary coefficients and $p
  M_W$ nef Cartier [6] Theorem 1.3. Choosing $m$ divisible by $p_0$ and their uniform degrees,
  the equality above transfers the full base field to every required source system:
  the common factor cancels in ratios. Their separate Iitaka-fibration bound [6] Theorem 1.2 retains dependence on
  a fibre nonvanishing degree and a Betti number of a cyclic fibre cover.

Proposition 4 is a separate torsion result. Fix $1 lt.eq e lt.eq 4$, a rational DCC set $I subset \[ 0 \, 1 \]$,
  and a positive integer $p$. For projective generalized klt pairs $\( Z \, B_Z + M_Z \)$ of dimension $e$,
  with boundary coefficients in $I$, b-nef rational data $upright(bold(M))$ for which $p
  upright(bold(M))$ is b-Cartier, and a rationally connected smooth projective resolution of $Z$,
  it gives one integer $ell = ell \( e \, I \, p \)$ such that

$ K_Z + B_Z + M_Z tilde.op_(bb(Q)) 0 quad arrow.r.double quad
  ell \( K_Z + B_Z + M_Z \) upright(" is an integral principal divisor") . $

Using suitable extractions, global ACC places the boundary coefficients in a fixed finite set and gives a uniform
  positive lower bound for generalized log discrepancies. Birkar’s boundedness theorem [5] Theorem 1.7 bounds the
  varieties up to isomorphism in codimension one. The proof combines their smooth-locus topology with Kummer
  theory and finite generation of the divisor class group $"Cl" \( Z \)$ from the rationally connected resolution
  to give a uniform exponent for torsion in $"Cl" \( Z \)$.
  A separate uniform multiple clears the coefficients of the actual adjoint before that torsion bound is applied.
  Birkar’s ordinary-pair index consequence, observed by Totaro [5] Corollary 1.8 and Section 9.5,
  is a close predecessor.

Corollary 5 combines this result with Theorem 1. A projective klt fourfold pair with fixed finite rational
  boundary coefficients and $K_X + B tilde.op_(bb(Q)) 0$ has a uniform integral principal multiple of $K_X +
  B$ whenever it admits a contraction to a positive-dimensional base with a rationally connected smooth projective
  resolution. The statement includes $B = 0$.

== 2 Divisors and the lower-dimensional index input <sec:preliminaries>

We fix the divisor conventions needed for the exact pullback identities, the rounded systems,
  and the index theorem on the reduced fibre. All varieties are over $bb(C)$.
  Unless stated otherwise, they are integral and normal. In the global statements, all varieties are projective,
  including the bases of the contractions. The reduced fibres may be reducible and nonnormal,
  and their normalizations may have several connected components.
  In the local curve arguments, the total spaces are projective over the indicated curves.
  After a curve is shrunk to an open neighbourhood, neither it nor its total space need be projective over
  $bb(C)$. A contraction is a surjective projective morphism $f$ with $f_(*) cal(O) = cal(O)$.

Boundaries are effective rational divisors; crepant sub-boundaries may have negative coefficients.
  We use the usual discrepancy conventions for lc, klt, and dlt pairs.
  A reduced pair $\( T \, B_T \)$ is slc if $T$ is pure-dimensional, $S_2$, and nodal in codimension one,
  no component of $B_T$ is contained in the conductor, $K_T + B_T$ is rational Cartier,
  and the normalization with the conductor included in the boundary is lc.
  In particular, the conductor has coefficient one on each normalized branch.
  The fibres to which we apply this definition will be proved to have the required pure dimension and depth properties.

Canonical divisors are chosen using rational top forms, and we retain those choices in exact divisor identities.
  For rational divisors on a normal variety, $D_1 tilde.op_(bb(Q))
  D_2$ means that some positive integer multiple of $D_1 - D_2$ is the divisor of a rational function.
  An equality of rational divisors is coefficientwise for the chosen representatives.
  In particular, $r D$ being an #emph[integral principal divisor] means

$ r D = "Div" \( v \) $

for an actual rational function $v$; it includes integrality of every coefficient of $r D$.

For an integral Weil divisor $G$ on a normal variety $X$, the reflexive divisorial sheaf is

$ cal(O)_X \( G \) \( U \) = { v in bb(C) \( X \) : "Div" \( v \) \|_U + G \|_U gt.eq 0 } union { 0 } . $

For a rational divisor $D$, its rounded system is the complete system of $cal(O)_X \( floor.l D floor.r \)$.
  A nonzero rational function $v$ is a section exactly when

$ "Div" \( v \) + D gt.eq 0 \, $

because its valuations are integers. This criterion does not require $D$ or $floor.l D floor.r$ to be Cartier.
  The field generated by a nonempty system is the subfield of $bb(C) \( X \)$ generated by all ratios of nonzero
  sections. It distinguishes the full embedded field from a proper subfield of the same transcendence degree.

A subset of $bb(R)$ satisfies the descending chain condition (DCC) if it contains no infinite strictly decreasing
  sequence. The ascending chain condition (ACC) is defined by reversing the inequalities. Both enter the proof:
  threshold ACC gives a DCC set for discriminant coefficients,
  and global ACC will reduce certain numerically trivial pairs to finite coefficient sets.

The index input needed for the relative theorem is in fibre dimension at most three.
  We use the following established theorem: for every finite set $I subset \[ 0 \, 1 \] ∩ bb(Q)$,
  there is a positive integer $n \( I \)$ such that every projective slc pair $\( T \, B_T \)$ of dimension at
  most three with coefficients in $I$ and $K_T + B_T tilde.op_(bb(Q)) 0$ satisfies

#[#set math.equation(numbering: n => "(2.1)")
 $ n \( I \) \( K_T + B_T \) tilde.op 0 . $ <eq:lower-slc-index>]

This includes normal pairs and the zero boundary [16] Corollary 1.6, arXiv version 1.
  We may enlarge $n \( I \)$ to clear $I$. The conclusion means that the log pluricanonical sheaf
  $cal(O)_T \( n \( I \) \( K_T + B_T \) \)$ is invertible and trivial on $T$ itself.
  A choice of generator is a global form whose restrictions to the normalized components satisfy the conductor
  gluing. This global trivialization, rather than separate trivializations on the components,
  is the input required by the residue argument.

We also need this conclusion when the coefficients initially lie in a fixed rational DCC set $I
  subset \[ 0 \, 1 \]$. On each normalized irreducible component, include the conductor with coefficient one.
  The resulting pair is projective lc with effective boundary coefficients in the DCC set $I union { 1 }$,
  and its adjoint is numerically trivial. Global ACC [15] Theorem 1.5 places all its nonzero coefficients in a
  fixed finite rational subset, depending only on $I$ and the dimension bound.
  The coefficients of $B_T$ therefore also lie in a fixed finite set.
  Applying (2.1) to the slc pair $T$ supplies one uniform global trivialization, including the gluing.
  The possibly larger degree used later to restrict an ambient pluricanonical sheaf to $T$ may depend on the
  ambient pair; it is kept separate from this uniform index.

== 3 An exact pullback and the coefficient to be controlled <sec:generic>

We begin the proof of Theorem 1. Put $k = dim Z$ and $K = bb(C) \( Z \)$.
  The contraction condition makes $K$ algebraically closed in $bb(C) \( X \)$,
  so this function-field extension is regular in characteristic zero.
  The generic fibre is therefore geometrically integral. It is normal by localization from $X$,
  and normality is geometric for a finite-type variety over the perfect field $K$.
  Choose a rational top form on $Z$. Together with the form defining $K_X$,
  the determinant sequence for function-field differentials determines a rational relative top form on the generic
  fibre $X_eta$. We use its divisor as $K_(X_eta)$. At codimension-one points of $X_eta$,
  which are smooth over $K$, this divisor is the coefficientwise localization of $K_X$; vertical primes disappear.
  If $d = k$, then $X_eta = "Spec" K$ and the relative form is a nonzero $0$-form with zero divisor.
  Restrict a log resolution and its crepant sub-boundary to the geometric generic fibre.
  Generic smoothness makes the horizontal strata SNC there, so the original geometric generic pair is lc.
  That pair is projective of dimension $d - k lt.eq 3$, its boundary coefficients belong to $Phi$,
  and its adjoint is rationally linearly trivial.

The lower-dimensional index theorem applies to this pair over $overline(K)$.
  For completeness, $K$ is finitely generated over $bb(C)$,
  so $overline(K)$ and $bb(C)$ are algebraically closed fields of characteristic zero with the same transcendence
  degree over $bb(Q)$. An abstract field isomorphism therefore identifies the pair with a complex pair to which
  the theorem applies.

Choose a common integer $p_0$, also clearing $Phi$, which principalizes the adjoint of every such geometric
  generic fibre. This principalization descends to $K$ without enlarging the degree.
  Indeed, choose a finite Galois extension $L \/ K$ over which a principalizing function is defined.
  The quotient of any two of its Galois conjugates has zero divisor on the proper geometrically integral normal
  fibre over $L$, hence belongs to $L^(*)$. These quotients form a multiplicative Galois cocycle.
  Hilbert 90 rescales the function to make it invariant, and it then descends to $K$.
  Consequently there is $psi in bb(C) \( X \)^(*)$ such that

$ p_0 \( K_X + B \) + "Div" \( psi \) $

is vertical over $Z$.

Choose $a$ divisible by $p_0$ and $phi.alt in bb(C) \( X \)^(*)$ with

$ a \( K_X + B \) + "Div" \( phi.alt \) = f^(*) \( a D \) . $

The divisor of $psi^(a \/ p_0) \/ phi.alt$ is vertical. On the proper normal generic fibre this function has
  neither zeros nor poles, so it belongs to $K^(*)$. Denoting it by $h$, set

$ D_Z = D + 1 / a "Div" \( h \) . $

Substitution gives the first equality of (1.1) as an equality of actual rational divisors.
  In particular, $D_Z$ is rational Cartier and $D_Z tilde.op_(bb(Q)) D$.

We can now apply the lc-trivial-fibration theorem [11] Theorem 3.6.
  Besides generic log canonicity and the rational pullback relation, it requires a rank-one condition.
  On a log resolution, the modified discrepancy divisor $upright(bold(A))^(*)$ omits the discrepancy $- 1$ terms.
  Because $0 lt.eq B lt.eq 1$, rounding up leaves, over the generic point of the base,
  only an effective exceptional divisor over $X$: strict transforms contribute zero.
  The associated divisorial sheaf pushes forward to $cal(O)_X$ by normality.
  Pushing on to $Z$ thus has rank one, as required.

For a prime divisor $P$ on any birational base model, let $t_P$ be the lc threshold of its pullback over the
  generic point of $P$, computed with the crepant sub-pair on a resolved diagram.
  The discriminant coefficient is $1 - t_P$. The crepant sub-pair is sub-lc, so $t_P gt.eq 0$;
  in the klt case it is sub-klt and $t_P > 0$. These inequalities on every base model give the asserted
  generalized singularities. On the original base $Z$, the boundary upstairs is effective and a pullback component
  dominating $P$ has positive integral multiplicity. Hence $t_P lt.eq 1$, which gives $B_Z gt.eq 0$.

For primes $P$ on $Z$, the thresholds satisfy ACC uniformly.
  Shrink about the generic point of $P$ so that $P$ is Cartier.
  In a log resolution computing the threshold, only divisors with positive order along the pullback of $P$ matter.
  Remove the images of those whose images are proper subsets of $P$.
  Then $t_P$ is an ordinary lc threshold of an effective Cartier divisor, with positive integral coefficients,
  against an lc pair with coefficients in $Phi$. The threshold ACC theorem [15] Theorem 1.1 applies.
  These thresholds are rational and lie in $\[ 0 \, 1 \]$, so their complements form the required rational DCC set
  $cal(B) subset \[ 0 \, 1 \]$.

The qualitative theorem makes the moduli b-divisor b-nef and gives its descent to a nef rational Cartier divisor
  on a sufficiently high smooth projective model $W arrow.r Z$. This holds for our chosen presentation:
  changing a rational trivialization adds a rational principal b-divisor from the base,
  which preserves nefness and rational Cartier descent. Write

$ D_W = \( W arrow.r Z \)^(*) D_Z \, wide M_W = D_W - K_W - B_W . $

For $P subset W$, put $alpha = "coeff"_P D_W$. Since $"coeff"_P B_W = 1 -
  t_P$ and the coefficient of $K_W$ is an integer,

$ "coeff"_P M_W = alpha + t_P - 1 - "coeff"_P K_W . $

It remains to prove, uniformly in $P$, that

#[#set math.equation(numbering: n => "(3.1)")
 $ p \( alpha + t_P \) in bb(Z) . $ <eq:relative-coefficient-target>]

Then $p M_W$ is an integral divisor on the smooth variety $W$, hence Cartier.

== 4 Reduction to a dlt fibre over a curve <sec:curve>

Our objective is the integrality condition (3.1). Fix a prime $P subset W$.
  Take a smooth projective model $V arrow.r X$ mapping to $W$ by $g$,
  with SNC markings for the crepant boundary $B_V^c$, the exceptional divisors over $X$,
  and the support of $g^(*) P$. The morphism $g$ has connected fibres:
  its function field extension is $bb(C) \( W \) = bb(C) \( Z \) subset bb(C) \( V \) = bb(C) \( X \)$,
  which is regular. Its Stein factor is therefore finite birational over the normal variety $W$ and hence is $W$
  itself. Let $theta_V$ be the rational top form compatible with the chosen canonical divisor on $X$,
  and put $K_V = "Div" \( theta_V \)$. Crepant pullback gives

#[#set math.equation(numbering: n => "(4.1)")
 $ K_V + B_V^c + 1 / p_0 "Div" \( psi \) = g^(*) D_W . $ <eq:relative-resolution-presentation>]

Put $t = t_P$. At the generic point of $P$, the boundary $B_V^c + t g^(*) P$ has coefficients at most one,
  with equality on at least one component dominating $P$. This is the SNC threshold calculation.

Choose sufficiently general very ample divisors $A_1 \, dots.h \, A_(k - 1)$ on $W$ and put $C =
  A_1 ∩ dots.h.c ∩ A_(k - 1)$, taking $C = W$ when $k = 1$.
  Bertini, applied successively to the pullback linear systems and the finitely many marked strata,
  makes $C$ and $V_C = g^(- 1) C$ smooth, with SNC restricted markings.
  The curve $C$ is connected, and the restriction of $g$ has connected fibres,
  so $V_C$ is connected and hence integral. We also require $C subset.not "Supp" D_W$ and $V_C subset.not "Supp"
  K_V union "Supp" B_V^c union "Supp" "Div" \( psi \)$. The dimension of $V_C$ is $d - k + 1 lt.eq 4$.
  Choose an intersection point $c in C ∩ P$ transverse and general on $P$.
  We may avoid at $c$ all other components of $"Supp" D_W$, the bad strata loci on $P$,
  and the images of all relevant nondominating strata which do not contain $P$.

Let $h : V_C arrow.r C$, $F = h^(*) \[ c \]$, and $B^c = B_V^c \|_(V_C)$.
  We specify the canonical divisor in complete-intersection adjunction in order to retain the coefficient of $P$.
  Choose general representatives $A'_j tilde.op A_j$ avoiding $c$,
  and rational functions $chi_j in bb(C) \( W \)^(*)$ with $"Div" \( chi_j \) = A'_j - A_j$.
  Define $theta_C$ as the iterated Poincaré residue, in the order of the cuts, of

$ theta_V product_(j = 1)^(k - 1) g^(*) chi_j $

along $g^(- 1) A_1 \, dots.h \, g^(- 1) A_(k - 1)$, taking each residue on the preceding cut.
  The generality of the divisors makes this a nonzero rational top form on $V_C$.
  For $k = 1$ the product is empty and the residue is the identity.
  Each $chi_j$ supplies a simple pole along the cutting divisor and a zero along its chosen representative.
  Cancelling the cutting divisors before restriction, the residue formula gives an equality of actual divisors:

$ K_(V_C) := "Div" \( theta_C \) & = ("Div" (theta_V product_j g^(*) chi_j) + sum_j g^(*) A_j) \|_(V_C)\
 & = (K_V + sum_j g^(*) A'_j) \|_(V_C) . $

Set $psi_C = psi \|_(V_C)$ and $D'_C = \( D_W + sum_j A'_j \) \|_C$.
  All these restrictions are defined by generality. Restricting (4.1) now gives

#[#set math.equation(numbering: n => "(4.2)")
 $ K_(V_C) + B^c + 1 / p_0 "Div" \( psi_C \) = h^(*) D'_C \, wide "coeff"_c D'_C =
   alpha . $ <eq:relative-curve-presentation>]

The coefficient assertion follows because $C$ meets $P$ transversely at $c$,
  while the $A'_j$ and all other components of $"Supp" D_W$ avoid $c$.

Along $F$, the coefficients of $B^c + t F$ are at most one, with equality on a component of $F$.
  Indeed, the marked divisors dominating $P$ restrict transversely and reducedly,
  and near the selected point $g^(*) P \|_(V_C) = F$. Over the generic point of $C$ there is still a projective
  birational comparison with the normal fibre of the original model $X$,
  and the restricted exceptional divisors are exceptional there.
  To justify this last assertion, the generic point of $C$ lies where $W arrow.r Z$ is an isomorphism.
  Generic flatness and openness of geometric normality and integrality give normal integral original fibres on an
  open base, and the birational isomorphism locus is fibrewise dense there.
  Shrinking further makes the exceptional images have fibre codimension at least two.

On $V_C$ define an effective boundary $Gamma$ by taking $F_(upright("red"))$,
  the horizontal strict transforms of the original boundary with their original coefficients,
  and all horizontal restricted exceptional divisors with coefficient one.
  Then $\( V_C \, Gamma \)$ is log smooth, its horizontal coefficients belong to the fixed set $Phi union { 1 }$, and

#[#set math.equation(numbering: n => "(4.3)")
 $ E = Gamma - B^c - t F $ <eq:relative-error>]

is effective near $c$ and has coefficient zero on a component of $F$. On the generic fibre $E$ is effective:
  its horizontal nonexceptional terms cancel, while every horizontal exceptional term has coefficient $1 -
  "coeff" B^c gt.eq 0$. Its support there is exceptional over the original normal fibre by the preceding
  birational comparison. Equation (4.2) gives the exact identity

$ K_(V_C) + Gamma + 1 / p_0 "Div" \( psi_C \) = h^(*) \( D'_C + t \[ c \] \) + E . $

We run a minimal-model program over $C$. All negative coefficients of $E$ are vertical and occur over finitely
  many points, so there is an effective rational divisor $A$ on $C$ with $E^(+) := E + h^(*) A gt.eq 0$.
  The preceding identity becomes

$ K_(V_C) + Gamma + 1 / p_0 "Div" \( psi_C \) = h^(*) \( D'_C + t \[ c \] - A \) + E^(+) . $

In particular, $K_(V_C) + Gamma tilde.op_(bb(Q) \, C) E^(+)$;
  its restriction to a very general fibre is rationally linearly equivalent to an effective divisor,
  so it is pseudo-effective over $C$.

The existence and preservation results recalled in [7] Remark 2.11,
  arXiv version 2 permit an MMP with scaling of an ample divisor over the base for an lc generalized pair whose
  underlying variety is $bb(Q)$-factorial klt. We apply this to the $bb(Q)$-factorial dlt pair
  $\( V_C \, Gamma \)$ over $C$; the same reference states that its stages remain $bb(Q)$-factorial and dlt.
  Each birational step is negative for the transformed adjoint.
  The zero nef datum satisfies the source’s NQC hypothesis.
  In dimension four, [7] Theorem 1.1, arXiv version 2 terminates every sequence of flips over $C$ for an NQC lc
  generalized pair whose adjoint is pseudo-effective over $C$.
  The three-dimensional statement [7] Theorem 1.2, arXiv version 2 has no pseudo-effectivity hypothesis.

These results supply the program and terminate a possible flip tail.
  We check that its endpoint is nef and retains the exact identity.
  Use $theta_C$ to choose canonical divisors on every birational stage $h_i : V_i arrow.r C$,
  and let $Gamma_i$ and $E_i^(+)$ denote the pushforwards. Every step is over $C$,
  so the preceding identity pushes forward to

$ K_(V_i) + Gamma_i + 1 / p_0 "Div" \( psi_C \) = h_i^(*) \( D'_C + t \[ c \] - A \) + E_i^(+) \, wide
  E_i^(+) gt.eq 0 . $

Thus the adjoint remains pseudo-effective over $C$. A fibre-type negative extremal contraction is impossible:
  a general positive-dimensional contracted fibre has a curve $ell$ not contained in $"Supp" E_i^(+)$.
  Since $V_i$ is $bb(Q)$-factorial, a Cartier multiple of $E_i^(+)$ restricts to an effective divisor on the
  normalization of $ell$. Hence

$ 0 lt.eq E_i^(+) dot.op ell = \( K_(V_i) + Gamma_i \) dot.op ell < 0 \, $

a contradiction. Divisorial contractions strictly decrease the relative Picard number,
  so an infinite program would eventually consist only of flips.
  The cited termination statements exclude such a tail in dimensions three and four;
  in dimensions at most two no flips occur. The endpoint is a projective morphism $f_N : N arrow.r
  C$ with $N$ $bb(Q)$-factorial, $\( N \, Gamma_N \)$ dlt, and $K_N + Gamma_N$ nef over $C$.
  Its unchanged regular function-field extension and Stein factorization give connected fibres,
  so $f_N$ is a contraction.

Let $E_N^(+)$ be the transform of $E^(+)$ on $N$. The pushforward of $h^(*) A$ is $f_N^(*) A$, so $E_N :=
  E_N^(+) - f_N^(*) A$ is the pushforward of the original $E$.
  Substituting $E_N^(+) = E_N + f_N^(*) A$ into the transformed identity gives

#[#set math.equation(numbering: n => "(4.4)")
 $ K_N + Gamma_N + 1 / p_0 "Div" \( psi_C \) = f_N^(*) \( D'_C + t \[ c \] \) + E_N . $ <eq:relative-output-error>]

We claim that $E_N = 0$ near $c$. Take a common resolution with maps $r : tilde(V) arrow.r V_C$ and $r' :
  tilde(V) arrow.r N$. Discrepancy comparison for the $K + Gamma$ MMP gives

$ r^(*) \( K_(V_C) + Gamma \) - r' ""^(*) \( K_N + Gamma_N \) gt.eq 0 $

by [19] Lemmas 3.38–3.39. Pulling back the exact input and output identities cancels the common base pullbacks and
  the common principal divisor, giving

#[#set math.equation(numbering: n => "(4.5)")
 $ r' ""^(*) E_N lt.eq r^(*) E . $ <eq:relative-error-monotonicity>]

Let $eta$ be the generic point of $C$ and $q : tilde(V)_eta arrow.r
  X_eta$ the morphism to the normal original fibre. The restriction of $E_N$ to $N_eta$ is effective,
  being the pushforward of the effective restriction of $E$;
  hence the restriction of $r' ""^(*) E_N$ is effective as well.
  The restriction of $r^(*) E$ is effective and $q$-exceptional,
  so (4.5) makes the restriction of $r' ""^(*) E_N$ $q$-exceptional.
  Finally, (4.4) gives $E_N equiv_C K_N + Gamma_N$, so that restriction is nef, in particular $q$-nef.
  The negativity lemma makes it zero. Thus $E_N$ has no horizontal component.
  After shrinking about $c$, it is effective and supported on the special fibre, and it remains nef over $C$.

Write

$ F_N = f_N^(*) \[ c \] = sum_i e_i S_i \, wide E_N = sum_i q_i S_i \, wide e_i > 0 \, quad q_i gt.eq 0 \, $

and set $lambda = max_i \( q_i \/ e_i \)$. The divisor $Delta = lambda F_N - E_N$ is effective, anti-nef over $C$,
  and misses at least one component of the fibre. Suppose the fibre has positive dimension and $Delta eq.not 0$.
  Connectedness gives a component $S$ outside $"Supp" Delta$ that meets it.
  Since $N$ is $bb(Q)$-factorial, choose a positive integer $b$ so that $b Delta$ is Cartier.
  Its restriction to the integral projective component $S$ is a nonzero effective Cartier divisor.
  If $n = dim S$ and $A_S$ is a very ample Cartier divisor on $S$, then

$ #scale(x: 120%, y: 120%)[\(] \( b Delta \) \|_S #scale(x: 120%, y: 120%)[\)] dot.op A_S^(n - 1) > 0 . $

Here $A_S^(n - 1)$ is represented by an effective curve cycle in the fibre (by $S$ itself when $n = 1$),
  so anti-nefness gives the opposite inequality. This contradiction proves $Delta = 0$, hence $E_N = lambda F_N$.
  For a zero-dimensional fibre, $f_N$ is an isomorphism of normal curves and the same proportionality is
  immediate. Finally,

$ r' ""^(*) F_N = r^(*) F \, $

and the original $E$ has coefficient zero on a component of $F$.
  Taking the coefficient of its strict transform in (4.5) forces $lambda = 0$,
  whether or not that component survives on $N$. This proves the claim.

Shrink $C$ about $c$ and set $T = \( f_N^(*) \[ c \] \)_(upright("red"))$.
  No divisor was extracted in the program, so every surviving component of this fibre has coefficient one in
  $Gamma_N$. Thus $Gamma_N = T + H$, where $H$ is horizontal and has coefficients in the fixed set $Phi union {
  1 }$. The reduced fibre $T$ is connected and projective. Its components have dimension $d - k lt.eq 3$,
  since they are the components of the effective Cartier divisor $f_N^(*) \[ c \]$ on the integral variety $N$.
  Removing all boundary from the $bb(Q)$-factorial dlt pair shows that $N$ is klt.
  Shrink again so that $D'_C$ is supported at most at $c$. For the integral Weil divisor $L =
  p_0 \( K_N + T + H \)$, the exact relation is now

#[#set math.equation(numbering: n => "(4.6)")
 $ L + "Div" \( psi_C \) = p_0 \( alpha + t \) f_N^(*) \[ c \] . $ <eq:relative-local-cyclic>]

== 5 The denominator detected by residues on the whole fibre <sec:residue>

In the application to (4.6), the coefficient below is $beta = alpha + t$.
  Write $p_0 beta = a \/ m$ in lowest terms, with $m > 0$. An $m$th root of a base uniformizer produces a log
  pluricanonical generator with character $zeta^(- a)$ for $zeta in mu_m$.
  We compare its $p \/ p_0$th power with the pullback of a degree-$p$ form on the whole reduced fibre.
  Divisible adjunction will first make their ratios constant on each normalized component.
  Residues along the conductor will then make those constants equal,
  forcing the character to be trivial and hence $m divides p \/ p_0$.

#thm([Lemma 5.1.])[
  (The reduced fibre and the cyclic residue test).  #emph[Fix a finite set $Phi subset \[ 0 \, 1 \] ∩
    bb(Q)$ and a positive integer $p_0$ clearing its denominators.
    There is a positive integer $p$, depending only on $Phi$ and $p_0$, divisible by $p_0$,
    with the following property. Let
$ f : N arrow.r C $

 be a projective contraction from a normal integral variety to a smooth complex curve, let $c in C$,
   and suppose $1 lt.eq dim N lt.eq 4$. Set $F = f^(*) \[ c \]$ and $T = F_(upright("red"))$.
   Assume that $N$ is $bb(Q)$-factorial, that $\( N \, T + H \)$ is dlt,
   and that $H$ is an effective horizontal $bb(Q)$-divisor with coefficients in $Phi$.
   Suppose, on a neighbourhood of $F$, that there are $beta in bb(Q)$ and $psi in
   bb(C) \( N \)^(*)$ such that the following is an equality of actual $bb(Q)$-divisors, for a fixed canonical divisor:
#[#set math.equation(numbering: n => "(5.1)")
 $ p_0 \( K_N + T + H \) + "Div" psi = p_0 beta F . $ <eq:slc-local-relation>]

 Then $p beta in bb(Z)$.]
] <lem:slc-residue-test>

#proof[
  We may shrink $C$ about $c$ throughout. In particular, we take a uniformizer $z in bb(C) \( C \)$ with $"Div"_C
    z = \[ c \]$ on this neighbourhood. The fibre $T$ is connected and projective,
    since $f$ is a projective contraction. Its irreducible components have dimension $dim N - 1$:
    the divisor $F$ is an effective Cartier divisor on the integral variety $N$,
    and its support is the whole fibre. When $dim N = 1$, the contraction $f$ is an isomorphism of normal curves.
    Comparing the coefficient at $c$ in (5.1) gives $p_0 beta in bb(Z)$, so this case is immediate.
    Henceforth $1 lt.eq dim T lt.eq 3$.
  #emph[Adjunction on the entire reduced fibre.] Write $T = union.big_i T_i$.
    By dlt adjunction and the structure theorem for dlt strata, each $T_i$ is normal and
  #[#set math.equation(numbering: n => "(5.2)")
   $ \( K_N + T + H \) \|_(T_i) tilde.op_(bb(Q)) K_(T_i) + Theta_i \, $ <eq:slc-component-adjunction>]
  where $\( T_i \, Theta_i \)$ is lc and $Theta_i$ is the effective different;
    see [17] Sections 4.1–4.2 and Theorems 4.16 and 4.19. We use the residue form of this adjunction [18]
    Definition 11.14, author version. If $n$ is sufficiently divisible,
    the $n$th tensor power of the ordinary residue at the generic point of $T_i$ extends to an isomorphism
  $ cal(O)_N #scale(x: 120%, y: 120%)[\(] n \( K_N + T + H \) #scale(x: 120%, y: 120%)[\)] \|_(T_i) tilde.eq
    cal(O)_(T_i) #scale(x: 120%, y: 120%)[\(] n \( K_(T_i) + Theta_i \) #scale(x: 120%, y: 120%)[\)] . $
  The different is defined so that the generic residue extends uniquely to this canonical isomorphism once the
    ambient Cartier index is cleared. Here $T_i$ is normal, so its normalization does not change the target.
    The isomorphism therefore identifies actual rational pluricanonical forms.
    The same form of adjunction will be used for normal dlt components upstairs.
    Intersections of distinct components of $T$ are unions of lc strata.
    At the generic point of an intersection of codimension two in $N$, the pair is simple normal crossing,
    precisely two components of $T$ pass through the point, and $H$ is absent.
    The corresponding conductor prime on either branch occurs in $Theta_i$ with coefficient one.
  The remaining coefficients of the differents belong to the set
  #[#set math.equation(numbering: n => "(5.3)")
   $ cal(D) \( Phi \) = {frac(r - 1 + b, r) med mid(bar.v) med r in bb(N)_(> 0) \, quad n_phi.alt in bb(Z)_(gt.eq 0) \,\
b = sum_(phi.alt in Phi union { 1 }) n_phi.alt phi.alt lt.eq 1} ∩ \[ 0 \, 1 \] . $ <eq:slc-different-coefficients>]
  This is the usual coefficient rule for the different; see [15] Lemma 4.1.
    The positive elements of $Phi union { 1 }$ have a positive minimum, so the possible sums $b lt.eq
    1$ form a finite set. For each such sum, the displayed coefficients are nondecreasing in $r$ and converge to
    one. Consequently $cal(D) \( Phi \)$ is a fixed rational DCC set.
    We include the conductor coefficient one in this set.
  To apply the index theorem to $T$, we must glue this component adjunction on the reduced scheme itself.
    We will prove that $T$ is demi-normal and that divisible residues identify its log pluricanonical sheaf with
    an ambient restriction. The degree needed for this adjunction may depend on the pair.
    Conductor-compatible descent is also the issue addressed by the admissible-section methods of Fujino [10]
    Definition 4.1 and Lemma 4.2 and Gongyo [13] Section 5; here we give the local comparison needed for the later
    uniform degree.
  Apply the depth theorem [18] Theorem 11.18, author version to the dlt pair $\( N \, T + H \)$ with the effective
    integral divisor $D = T lt.eq floor.l T + H floor.r$ and $L = 0$.
    It gives that $cal(O)_N$, $cal(O)_N \( - T \)$, and $cal(O)_T$ are Cohen–Macaulay.
    Here $cal(O)_N \( - T \)$ is the ideal of the reduced union of the prime divisors $T_i$:
    on the normal variety $N$, it is the intersection of their height-one prime ideals,
    equivalently the regular functions vanishing to order at least one at every $T_i$.
    Thus the subscheme in the depth theorem is the reduced fibre used here. In particular, $T$ satisfies $S_2$.
  The normality of the $T_i$ and the generic normal crossing description show that $T$ has only smooth points and
    ordinary double crossings in codimension one. It is also seminormal.
    By the square–cube criterion, an element of the total quotient ring whose square and cube are regular lies in
    the local ring at each codimension-one point, where seminormality is explicit.
    The $S_2$ extension property then puts it in $cal(O)_T$. Thus $T$ is demi-normal.
    Its normalization is the disjoint union of the $T_i$, and its conductor divisor is the union of the
    double-crossing divisors described above.
  Remove the coefficient-one conductor divisors from the $Theta_i$ and push the remaining boundary cycles to $T$;
    denote the result by $B_T$. Off the conductor the normalization is an isomorphism in codimension one,
    so this does not double count any prime. The boundary $B_T$ is effective,
    has coefficients in $cal(D) \( Phi \)$, and has no component contained in the conductor.
  Choose an open immersion $j : T^compose arrow.r.hook T$ whose complement has codimension at least two,
    such that $T^compose$ has only smooth points and ordinary double crossings.
    We may also arrange that at each crossing the ambient pair is simple normal crossing with just the two
    vertical branches, and that the support of $B_T \|_(T^compose)$ is contained in the smooth locus.
    The dualizing sheaf of $T^compose$ is invertible, and the relevant multiples of $B_T \|_(T^compose)$ are
    Cartier. For such a multiple $n$, interpret $cal(O)_T \( n \( K_T + B_T \) \)$ initially as
  $ j_(*) #scale(x: 120%, y: 120%)[\(] omega_(T^compose)^(⊗ n) ⊗ cal(O)_(T^compose) \( n B_T \|_(T^compose) \)
    #scale(x: 120%, y: 120%)[\)] . $
  We claim that for every sufficiently divisible positive integer $n$, the residue maps give a natural isomorphism
  #[#set math.equation(numbering: n => "(5.4)")
   $ cal(O)_N #scale(x: 120%, y: 120%)[\(] n \( K_N + T + H \) #scale(x: 120%, y: 120%)[\)] \|_T tilde.eq cal(O)_T
     #scale(x: 120%, y: 120%)[\(] n \( K_T + B_T \) #scale(x: 120%, y: 120%)[\)] . $ <eq:slc-ambient-restriction>]
  Choose $n$ even and divisible enough that the ambient sheaf is invertible and the component residue isomorphisms
    hold. Away from the conductor, these isomorphisms give (5.4) on $T^compose$.
    At a node, take local normal crossing coordinates $x \, y$ for the two branches.
    Hypersurface adjunction for $x y = 0$ identifies the restriction of the ambient log canonical line with the
    dualizing line of the node. The two iterated residues of $d x \/ x and d y \/ y$ differ by a sign;
    their $n$th tensor powers give the dualizing-sheaf gluing and have equal next residues when $n$ is even.
    This proves the claimed residue identification on $T^compose$.
  An invertible sheaf on the $S_2$ scheme $T$ equals the extension of its restriction from $T^compose$.
    Applying this to the left side of (5.4) and using the definition of the right side proves the isomorphism on
    $T$. In particular, the defined extension is invertible in these degrees,
    and the isomorphism retains the actual rational residue forms on every normalized branch.
  It follows that $K_T + B_T$ is $bb(Q)$-Cartier. Its pullback to the normalization is $K_(T_i) + Theta_i$,
    with the conductor included, so $\( T \, B_T \)$ is slc. Equation (5.1), together with $F =
    "Div" \( f^(*) z \)$, makes $K_N + T + H$ rationally linearly trivial near $T$.
    Restricting a sufficiently divisible trivialization in (5.4) gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ K_T + B_T tilde.op_(bb(Q)) 0 . $ <eq:slc-fibre-trivial>]
  #emph[A uniform degree on the slc fibre.] Apply global ACC to the projective normalized component pairs
    $\( T_i \, Theta_i \)$, whose adjoints are numerically trivial by (5.5).
    Their dimensions are at most three and their coefficients lie in the fixed DCC set $cal(D) \( Phi \)$;
    hence their nonzero coefficients lie in a fixed finite rational set [15] Theorem 1.5.
    The same is true of $B_T$. The bounded index theorem for projective slc log Calabi–Yau pairs in dimensions at
    most three now gives a common integer annihilating $K_T + B_T$ [16] Corollary 1.6, arXiv version 1.
    Enlarging this integer, choose once and for all an even multiple $p$ of $p_0$,
    depending only on $Phi$ and $p_0$, such that
  #[#set math.equation(numbering: n => "(5.6)")
   $ p B_T upright(" is integral") \, wide p \( K_T + B_T \) tilde.op 0 . $ <eq:slc-uniform-index>]
  Choose a nowhere-vanishing generator $u$ of this trivial log pluricanonical line.
    On the normalization it is a tuple of rational $p$-pluricanonical forms $u_i$ on the $T_i$,
    with the prescribed boundary poles and conductor gluing.
  The comparison uses two degrees for different purposes. A sufficiently divisible degree $n =
    b p$ makes $u^b$ a generating ambient restriction and will control divisors of componentwise ratios.
    The conductor comparison will then take place in the uniform degree $p$,
    using only the ordinary node description there.
  #emph[The root cover.] Write
  #[#set math.equation(numbering: n => "(5.7)")
   $ p_0 beta = a / m \, wide a in bb(Z) \, quad m in bb(N)_(> 0) \, quad gcd \( a \, m \) = 1 . $ <eq:slc-denominator>]
  Thus the goal is $m divides p \/ p_0$. The case $m = 1$ is immediate; assume $m > 1$.
    Let $C' arrow.r C$ be the normalization in $bb(C) \( C \) \( w \)$, where $w^m = z$, and let $pi : Y arrow.r
    N$ be the normalization of the dominating component of $N times_C C'$.
    The polynomial $w^m - z$ is Eisenstein at $c$. Thus $C'$ has a unique point $c'$ over $c$,
    with total ramification of degree $m$ there. Since $f$ is a contraction of normal varieties,
    $bb(C) \( C \)$ is algebraically closed in $bb(C) \( N \)$;
    in characteristic zero this is a regular function-field extension.
    It is consequently linearly disjoint from $bb(C) \( C' \) \/ bb(C) \( C \)$.
    The map $pi$ has degree $m$ and cyclic Galois group $mu_m$, acting by $w mapsto zeta w$.
    Write $f_Y : Y arrow.r C'$ for the induced morphism and put $T_Y = \( pi^(- 1) T \)_(upright("red"))$.
    Figure 1 records these maps and their reduced special fibres;
    the total space $Y$ is the normalization of the base change.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$T_Y$])
  content((2.651, 0), [$T$])
  content((0, -1.585), [$Y$])
  content((2.651, -1.585), [$N$])
  content((0, -3.171), [$C'$])
  content((2.651, -3.171), [$C$])
  line((0.468, 0), (2.315, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((0, -0.2725), (0.3, -0.2725))
  line((2.651, -0.2725), (2.651, -1.313), mark: (end: ">"))
  line((2.651, -0.2725), (2.951, -0.2725))
  line((0.336, -1.585), (2.315, -1.585), mark: (end: ">"))
  content((1.326, -1.359), [#text(size: 0.73em)[$pi$]])
  line((0, -1.858), (0, -2.898), mark: (end: ">"))
  content((-0.4186, -2.378), [#text(size: 0.73em)[$f_Y$]])
  line((2.651, -1.858), (2.651, -2.898), mark: (end: ">"))
  content((2.973, -2.378), [#text(size: 0.73em)[$f$]])
  line((0.402, -3.171), (2.315, -3.171), mark: (end: ">"))
  content((1.359, -3.397), [#text(size: 0.73em)[$w^m = z$]])
})],
    caption: [Figure 1: The normalized cyclic base change and its whole reduced special fibres over $c'$ and $c$. The covering group may permute components of $T_Y$, so the residue comparison must use their conductor gluing. ],
  ) <fig:root-cover>
  The morphism $f_Y$ is projective. Its function field is regular over $bb(C) \( C' \)$,
    because regularity is preserved by this base change. Stein factorization therefore gives $\( f_Y \)_(*)
    cal(O)_Y = cal(O)_(C')$. In particular, $T_Y$ is connected and projective.
    The divisor $p_0 \( K_N + T + H \)$ in (5.1) is integral.
    If $F = sum_i e_i T_i$, comparison of coefficients in that equation and (5.7) gives $m divides
    e_i$ for every $i$. At the generic point of $T_i$, write $f^(*) z = tau^(e_i) v$ with $v$ a unit.
    After dividing $w$ by $tau^(e_i \/ m)$, the normalized extension is obtained by extracting an $m$th root of
    $v$ and is étale. Away from $T$ the function $f^(*) z$ is a unit, and the same conclusion holds.
    Hence $pi$ is étale in codimension one.
  Put $H_Y = pi^(*) H$, and choose canonical divisors compatibly.
    Since $pi$ is quasi-étale and the coefficient-one divisor pulls back without divisorial ramification, we have
  #[#set math.equation(numbering: n => "(5.8)")
   $ K_Y + T_Y + H_Y = pi^(*) \( K_N + T + H \) . $ <eq:slc-cover-crepant>]
  The pair on the left is dlt. Indeed, finite crepant discrepancy comparison multiplies a downstairs log
    discrepancy by the ramification index of a divisorial prolongation [19] Proposition 5.20.
    Thus the upstairs pair is lc, and every upstairs lc centre maps onto a downstairs lc centre.
    The pair downstairs is simple normal crossing near the generic point of each such centre.
    A finite quasi-étale map is étale over the smooth locus of its target,
    by purity of the branch locus [20] Tag 0BMB. Consequently the upstairs pair is simple normal crossing at the
    generic points of all its lc centres. A log resolution chosen to be an isomorphism over this log smooth open
    has no exceptional divisor of log discrepancy zero, which is the dlt condition.
    This argument does not require $Y$ to be $bb(Q)$-factorial.
    In particular, each irreducible component $T_(Y \, j)$ of $T_Y$ is normal.
  Let $theta$ be the rational top differential form defining $K_N$. Define the rational $p_0$-pluricanonical form
  #[#set math.equation(numbering: n => "(5.9)")
   $ s = \( pi^(*) theta \)^(⊗ p_0) thin pi^(*) psi thin w^(- a) . $ <eq:slc-cover-generator>]
  Since $pi^(*) F = m "Div"_Y w$, equations (5.1)–(5.8) give
  $ "Div" \( s \) + p_0 \( T_Y + H_Y \) = 0 . $
  Thus $s$ generates the degree-$p_0$ divisorial log pluricanonical sheaf on $Y$.
    In particular its sufficiently divisible powers generate the corresponding invertible log pluricanonical sheaves.
  #emph[Residue comparison on each component.] Let $T_i$ be the component of $T$ dominated by $T_(Y \, j)$,
    and write $rho_j : T_(Y \, j) arrow.r T_i$ for the induced finite morphism.
    At their generic points the map is étale. The ordinary generic residue
  $ v_j = "res"_(T_(Y \, j)) #scale(x: 120%, y: 120%)[\(] s^(p \/ p_0) #scale(x: 120%, y: 120%)[\)] $
  is therefore a nonzero rational $p$-pluricanonical form. The form $rho_j^(*) u_i$ is also nonzero, and the quotient
  #[#set math.equation(numbering: n => "(5.10)")
   $ r_j = frac(v_j, rho_j^(*) u_i) in bb(C) \( T_(Y \, j) \)^(*) $ <eq:slc-residue-ratio>]
  is a rational function. We prove that $r_j$ is constant by comparing sufficiently divisible powers.
  Choose a multiple $n = b p$ sufficiently divisible for (5.4) and for component adjunction upstairs.
    Then $v_j^b$ is a nowhere-vanishing generator of the degree-$n$ adjunction sheaf on $T_(Y \, j)$.
    The same is true of $rho_j^(*) u_i^b$. For the latter assertion, work near any point of $T$.
    By (5.4), the section $u^b$ is a generator of the restriction of the invertible sheaf
    $cal(O)_N \( n \( K_N + T + H \) \)$. Relative to a local ambient generator it is a unit on $T$.
    Such a unit lifts, after restricting the neighbourhood, to a unit on $N$.
    Hence $u^b$ is the residue restriction of a local ambient log generator. Pull that generator back to $Y$.
    It remains a log generator by (5.8); its residue on $T_(Y \, j)$ generates the upstairs adjunction sheaf.
    At the generic point residue commutes with the étale pullback,
    so this residue is exactly the rational form $rho_j^(*) u_i^b$.
    This identifies the rational forms everywhere they are defined,
    and proves the assertion at every point of $T_(Y \, j)$.
  It follows that $r_j^b$ has zero divisor on $T_(Y \, j)$, and hence so does $r_j$.
    A rational function with zero divisor on a normal projective integral variety is an invertible global
    function, and therefore a nonzero complex constant. We have proved
  #[#set math.equation(numbering: n => "(5.11)")
   $ v_j = r_j rho_j^(*) u_i \, wide r_j in bb(C)^(*) . $ <eq:slc-component-scalar>]
  #emph[Gluing the scalars and killing the character.] Suppose two distinct components $T_(Y \, j)$ and
    $T_(Y \, j')$ meet. Their intersection contains a stratum of codimension two in $Y$ along which the pair is
    generically simple normal crossing. Its image is a codimension-two lc centre downstairs.
    At the generic point of this image the map $pi$ is étale and the downstairs pair is simple normal crossing.
    The two downstairs vertical branches are distinct: étale inverse images of one smooth divisor cannot give two
    intersecting branches. Moreover $H$ is absent at this generic crossing.
  At the generic point $xi$ of the upstairs crossing, choose the two normal coordinates $x \,
    y$ and a regular ambient $\( dim Y - 2 \)$-form $eta$ whose restriction is a nonzero top form on the smooth
    stratum. Such choices are available in normal crossing coordinates.
    Since $s^(p \/ p_0)$ is a log generator, it has the local form
  $ s^(p \/ p_0) = epsilon (frac(d x, x) and frac(d y, y) and eta)^(⊗ p) \, wide epsilon in cal(O)_(Y \, xi)^(*) . $
  The two next residues differ by $\( - 1 \)^p$ and are nonzero because $epsilon$ is a unit. They therefore agree.
    The components of the tuple $u$ have the same matching, nonzero next residues downstairs:
    $u$ is a generator of the slc log pluricanonical line, whose local description at the node is the even tensor
    power of the dualizing line. Their étale pullbacks retain this property.
    Taking next residues in (5.11) now gives $r_j = r_(j')$.
  Since $T_Y$ is connected, its component-incidence graph is connected.
    All the constants $r_j$ are consequently equal to one scalar $r in bb(C)^(*)$.
    In tuple notation on the normalized components of $T_Y$, we have
  #[#set math.equation(numbering: n => "(5.12)")
   $ #scale(x: 120%, y: 120%)[\(] "res"_(T_(Y \, j)) \( s^(p \/ p_0) \) #scale(x: 120%, y: 120%)[\)]_j =
     r thin pi^(*) u . $ <eq:slc-global-scalar>]
  The tuple $pi^(*) u$ is invariant under the covering group,
    with the natural action also permuting the components. On the other hand, (5.9) shows that for $zeta in mu_m$,
  $ zeta^(*) \( s^(p \/ p_0) \) = zeta^(- a p \/ p_0) s^(p \/ p_0) . $
  Residue is natural under this action, including its permutation of the components.
    The nonzero scalar comparison (5.12) forces this character to be trivial. Thus $m divides a p \/ p_0$.
    Since $gcd \( a \, m \) = 1$, we obtain $m divides p \/ p_0$. Finally
  $ p beta = p / p_0 a / m in bb(Z) \, $
  which proves the lemma. ◻
]

Apply Lemma 2 to (4.6), with $beta = alpha + t$ and the fixed coefficient set $Phi union { 1 }$.
  It gives a single multiple $p$ of $p_0$ for which (3.1) holds at every prime $P$ of the determination $W$.
  Consequently $p M_W$ is integral and Cartier. Since the moduli b-divisor descends on $W$,
  the b-divisor $p upright(bold(M))$ is b-Cartier. All constructions used only the dimensions at most four and the
  fixed coefficient set. This completes the proof of Theorem 1.

== 6 Effective systems recovering the entire base field <sec:effective>

The exact presentation in the denominator theorem identifies complete section spaces on the total space and the
  base. We combine this identification with effective birationality on a base model.

#thm([Proposition 6.1.])[
  #emph[Under the hypotheses of Theorem 1, suppose in addition that $D$ is big.
    There is a positive integer $m = m \( d \, Phi \)$ such that, for every positive multiple $l$ of $m$,
    the complete divisorial system
$ lr(|⌊l \( K_X + B \)⌋|) $

 is nonempty and generates precisely the subfield $bb(C) \( Z \) subset bb(C) \( X \)$.
   Its rational map is therefore birationally equivalent to $f$ and to the Iitaka fibration of $K_X + B$.]
] <prop:effective-base>

#proof[
  Put $L = K_X + B$ and $K = bb(C) \( Z \)$, and use the exact presentation (1.1).
    For every positive integer $l$ divisible by $p_0$, we first prove the equality of subspaces of $bb(C) \( X \)$
  #[#set math.equation(numbering: n => "(6.1)")
   $ H^0 #h(-0.16667em) (X \, cal(O)_X \( floor.l l L floor.r \)) =
     psi^(l \/ p_0) f^(*) H^0 #h(-0.16667em) (Z \, cal(O)_Z \( floor.l l D_Z floor.r \)) .
     $ <eq:relative-section-spaces>]
  Here $f^(*)$ on the right means pullback of rational functions. For $v in K^(*)$, the exact divisor identity gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ l L + "Div"_X #h(-0.16667em) (psi^(l \/ p_0) f^(*) v) =
     f^(*) #h(-0.16667em) (l D_Z + "Div"_Z \( v \)) . $ <eq:relative-section-divisors>]
  If $v$ is a section of the rounded system on $Z$, then $l D_Z + "Div"_Z \( v \) gt.eq
    0$ by the section convention of Section 2. This divisor is rational Cartier,
    so local effective Cartier multiples show that its pullback is effective.
    Equation (6.2) gives the inclusion from right to left in (6.1).
  Conversely, let $u$ be a nonzero section on the left, and let $X_eta$ be the generic fibre over $K$.
    The exact presentation rewrites the section inequality as $"Div"_X \( u \/ psi^(l \/ p_0) \) +
    l f^(*) D_Z gt.eq 0$. Its horizontal valuations give
  $ "Div"_(X_eta) #h(-0.16667em) (u \/ psi^(l \/ p_0)) gt.eq 0 . $
  The generic fibre is normal, so this quotient is regular there.
    The contraction condition $f_(*) cal(O)_X = cal(O)_Z$ gives $H^0 \( X_eta \, cal(O)_(X_eta) \) = K$.
    Hence $u = psi^(l \/ p_0) f^(*) v$ for some $v in K^(*)$.
    By (6.2), the source section inequality is $f^(*) G gt.eq 0$, where $G = l D_Z +
    "Div"_Z \( v \)$ is rational Cartier. Effectivity of $G$ descends to $Z$:
    near the generic point of any prime $P subset Z$, write a Cartier multiple of $G$ as $a P$,
    with $P$ locally principal. The local Cartier pullback of $P$ has a prime component dominating $P$,
    with positive multiplicity $e$, because $f$ is surjective.
    Its coefficient in the pullback of the chosen multiple of $G$ is $a e$.
    Thus $f^(*) G gt.eq 0$ forces $a gt.eq 0$. Doing this for every $P$ proves $G gt.eq 0$,
    so $v$ is a section on $Z$. This proves (6.1). Since $p_0$ clears $Phi$, the divisor $l L$ is integral Weil.
    The argument applies to its reflexive sheaf even when $l L$ is not Cartier.
  We now produce birational sections on the base. Choose a smooth projective determination $q : W arrow.r
    Z$ of the nef data which also resolves the boundary, and write
  $ K_W + B_W^(upright("cr")) + M_W = q^(*) D_Z . $
  Let $A$ be the strict transform of $B_Z$ plus the reduced exceptional divisor.
    On nonexceptional primes $A$ agrees with $B_W^(upright("cr"))$; on exceptional primes its coefficient is one,
    at least the coefficient of $B_W^(upright("cr"))$ by generalized log canonicity. Thus
  #[#set math.equation(numbering: n => "(6.3)")
   $ K_W + A + M_W = q^(*) D_Z + E_W \, wide E_W = A - B_W^(upright("cr")) gt.eq
     0 upright(" exceptional over ") Z . $ <eq:relative-big-model>]
  Put $Lambda = cal(B) union { 1 }$. The pair $\( W \, A \)$ is an ordinary log smooth lc pair with coefficients
    in the fixed DCC set $Lambda$, and $p M_W$ is nef Cartier.
    Since $D$ is big and $D_Z tilde.op_(bb(Q)) D$, the adjoint on the left of (6.3) is big.
  For each $1 lt.eq k lt.eq d$, let $b_k = b \( Lambda \, k \, p \)$ be the integer in Birkar–Zhang’s polarized
    effective birationality theorem [6] Theorem 1.3. Its conclusion is that
  $ lr(|⌊l \( K_W + A + M_W \)⌋|) $
  is birational for every positive $l$ divisible by $b_k$ when $dim W = k$; the floor is taken on the whole adjoint. Set
  $ m = "lcm" \( p_0 \, b_1 \, dots.h \, b_d \) . $
  This integer depends only on $d$ and $Phi$. Fix any positive multiple $l$ of $m$ and take $k = dim Z$.
    For a rational section $v in bb(C) \( W \) = K$ of the displayed birational system,
    pushforward of its divisor inequality using (6.3) gives
  $ "Div"_Z \( v \) + l D_Z gt.eq 0 . $
  Thus these sections belong to the complete rounded system on $Z$,
    and their ratios generate $K$ because the system on $W$ is birational.
    The complete system on $Z$ is therefore nonempty and generates $K$.
    Equation (6.1) transfers precisely these ratios to $X$, since the common factor $psi^(l \/ p_0)$ cancels.
    The complete source system is nonempty and generates the embedded field $K subset bb(C) \( X \)$ for every such $l$.
  The function field of the image of a system’s rational map is generated by its section ratios,
    so each of these maps is birationally equivalent to $f$. To compare with the Iitaka fibration,
    choose for the individual pair an integer $r > 0$ such that $r L$ is Cartier.
    Degrees divisible by $"lcm" \( m \, r \)$ form a cofinal divisible subsequence of the Cartier section series
    of $L$. Such a subsequence has the same field of section ratios:
    given $u \/ v$ in one degree, choose $a gt.eq 1$ so that the multiplied degree lies in the subsequence and
    write $u \/ v = \( u v^(a - 1) \) \/ v^a$. The field defining the Iitaka fibration is therefore $K$,
    and $kappa \( L \) = "trdeg"_(bb(C)) K = dim Z$. This identifies $f$ with the Iitaka fibration up to
    birational equivalence. The individual index $r$ is used only for this comparison and does not enter $m$. ◻
]

== 7 Integral principal multiples over rationally connected bases <sec:torsion>

We now bound a common principal multiple of the actual generalized adjoint, including its denominators.
  This will supply uniform trivializations on rationally connected bases.

#thm([Proposition 7.1.])[
  #emph[Fix an integer $1 lt.eq d lt.eq 4$, a DCC set $I subset \[ 0 \, 1 \] ∩ bb(Q)$, and a positive integer $p$.
    There exists a positive integer $ell = ell \( d \, I \, p \)$ with the following property.
    Let $Z$ be a normal projective complex variety of dimension $d$ with a rationally connected smooth projective
    resolution. Suppose that $\( Z \, B + M_Z \)$ is generalized klt, that $B gt.eq 0$ has coefficients in $I$,
    and that the b-nef rational b-divisor $upright(bold(M))$ has $p upright(bold(M))$ b-Cartier. If
$ D = K_Z + B + M_Z tilde.op_(bb(Q)) 0 \, $

 then $ell D$ is an integral principal divisor. Consequently, for every integer $a gt.eq 1$,
   the divisor $a ell D$ is principal and
$ h^0 #scale(x: 120%, y: 120%)[\(] Z \, cal(O)_Z \( a ell D \) #scale(x: 120%, y: 120%)[\)] = 1 . $

 The same integer can be chosen for all dimensions in any fixed subset of ${ 1 \, 2 \, 3 \, 4 }$.]
] <prop:rc-torsion>

#proof[
  There are three steps. Global ACC gives a finite coefficient set and a uniform positive lower bound for
    generalized log discrepancies. Boundedness up to isomorphism in codimension one then bounds torsion in the
    divisor class group. Finally we clear the coefficients of the actual adjoint before applying that torsion bound.
  #emph[Finite coefficients and uniform discrepancies.] We first construct the small modifications and the
    one-divisor extractions that will allow us to use global ACC.
    If an exceptional prime divisor $E$ over $Z$ is marked, assume that its generalized log discrepancy is $a
    in \( 0 \, 1 \)$. Choose a sufficiently high projective log resolution $g : W arrow.r
    Z$ on which the nef data descend and on which $E$ appears, when marked. Write
  $ K_W + B_W + M_W = g^(*) D . $
  The support of $B_W$ is SNC, all its coefficients are less than one, and $B_W$ need not be effective.
  We can also arrange that there is an effective exceptional Cartier divisor $F$ on $W$ such that $-
    F$ is $g$-ample and $"Supp" \( B_W \) union "Supp" \( F \)$ is SNC.
    To see this, construct a resolution by blowups with centres over the singular locus of the normal variety $Z$,
    and then resolve the nef model, the marked valuation, and the boundary by further blowups.
    The latter can be taken with centres of codimension at least two on smooth models.
    All the resulting exceptional divisors therefore have images of codimension at least two on $Z$.
    At each blowup the negative of its effective Cartier exceptional divisor is relatively ample.
    Adding sufficiently large multiples of the pullbacks of the divisors chosen at the preceding stages gives an
    effective exceptional Cartier divisor whose negative is ample for the composite morphism.
    Additional blowups resolving the union of the two supports preserve this construction.
  Choose a positive rational number $delta$ sufficiently small that all coefficients of $B_W +
    delta F$ are still less than one and, when $E$ is marked, $delta "mult"_E F < a$.
    For a sufficiently positive ample Cartier divisor $A$ on $Z$, the divisor
  $ M_W + g^(*) A - delta F $
  is ample. Choose a general effective rational divisor $Lambda tilde.op_(bb(Q)) M_W + g^(*) A -
    delta F$ by dividing a general member of a sufficiently divisible very ample multiple.
    Bertini’s theorem and the SNC condition on the union of the supports show that
    $\( W \, B_W + delta F + Lambda \)$ is sub-klt. There is a rational principal divisor $P$ on $W$ such that
  $ delta F + Lambda = M_W + g^(*) A + P . $
  Since $g$ is birational, $P = g^(*) \( g_(*) P \)$. Pushing forward gives
  $ K_Z + B + g_(*) Lambda = D + A + g_(*) P \, $
  and pulling this equality back gives
  $ g^(*) \( K_Z + B + g_(*) Lambda \) = K_W + B_W + delta F + Lambda . $
  Thus, setting $Xi = B + g_(*) Lambda$, the pair $\( Z \, Xi \)$ is an ordinary effective rational klt pair.
    If $E$ is marked, the general divisor $Lambda$ does not contain $E$, so its ordinary log discrepancy is
  $ a \( E \, Z \, Xi \) = a - delta "mult"_E F . $
  This lies in $\( 0 \, 1 \)$ by the choice of $delta$ and the original bound $a < 1$.
  Take a log resolution of $\( Z \, Xi \)$ dominating $W$, so that it exhibits $E$ when marked.
    Apply the extraction corollary [4] Corollary 1.4.3 and its proof with the prescribed set ${ E }$,
    or with the empty set when no valuation is marked. The klt pair $\( Z \, Xi \)$ satisfies the lc hypothesis,
    and $Xi$ itself can be used as the auxiliary klt boundary.
    When a divisor is marked, its discrepancy is less than one,
    so the extra condition for selected discrepancy-one valuations is vacuous. We obtain a birational morphism
  $ h : Z^(+) arrow.r Z $
  with $Z^(+)$ $bb(Q)$-factorial and with exactly the prescribed exceptional prime divisors.
    The construction in the cited proof is a log terminal model over $Z$, hence $h$ is projective.
    In the empty case it is a small $bb(Q)$-factorial modification.
  Restore the original generalized data on $Z^(+)$ by setting
  $ K_(Z^(+)) + B^(+) + M_(Z^(+)) = h^(*) D \, $
  with the same nef b-divisor $upright(bold(M))$. The resulting pair is generalized klt and its adjoint is
    rationally linearly trivial. Moreover, $B^(+)$ is effective:
    it is the strict transform of $B$, together with $\( 1 - a \) E$ in the extraction case.
    If a marked divisor is already a prime on $Z$, the small modification given by the empty-list construction suffices.
  We next apply global ACC to these effective generalized pairs,
    whenever their boundary coefficients belong to a fixed DCC set. There are two cases.
    If the nef trace is not numerically trivial on a model determining $upright(bold(M))$,
    then on a common higher model the nef part has the form
  $ M_W = 1 / p \( p M_W \) \, $
  where $p M_W$ is a nef Cartier divisor that is not numerically trivial.
    The generalized global ACC theorem [6] Theorem 1.6 applies:
    the dimension is fixed, the pair is projective generalized lc, its total adjoint is numerically trivial,
    the boundary coefficients belong to the chosen DCC set, and the single nef weight is $1 \/ p$.
    We adjoin this fixed weight to that DCC set. It follows that the possible boundary coefficients belong to a
    finite set.
  If instead $M_W equiv 0$, take a common higher model $pi : tilde(W) arrow.r
    Z^(+)$ on which the nef data descend. Since $Z^(+)$ is $bb(Q)$-factorial,
    the trace $M_(Z^(+))$ is $bb(Q)$-Cartier. The divisor
  $ M_(tilde(W)) - pi^(*) M_(Z^(+)) $
  is exceptional and numerically trivial over $Z^(+)$. Applying the negativity lemma to it and to its negative
    shows that it is zero. Consequently $M_(Z^(+)) equiv 0$: every curve on $Z^(+)$ is dominated by a curve on
    $tilde(W)$, and we use the projection formula. Since the nef data are pulled back from $Z^(+)$,
    the generalized discrepancies are the ordinary discrepancies of $\( Z^(+) \, B^(+) \)$.
    This is an ordinary klt pair with $K_(Z^(+)) + B^(+) equiv 0$,
    so ordinary global ACC [15] Theorem 1.5 again gives a finite set of boundary coefficients.
  Applying this discussion to the small modification with no marked divisor first shows that the coefficients of
    $B$ lie in a fixed finite rational set $I_0 subset I$. It also shows that the original generalized pairs are
    uniformly generalized $epsilon$-lc for some $epsilon = epsilon \( d \, I \, p \) > 0$.
    Indeed, otherwise we could choose a sequence of such pairs and marked valuations whose generalized log
    discrepancies satisfy
  $ 1 > a_1 > a_2 > dots.h.c > 0 \, wide a_i arrow.r 0 . $
  Perform the extraction just constructed when the marked valuation is exceptional,
    and otherwise take the small modification. The boundary coefficients of the resulting pairs belong to
  $ I med union med { 1 - a_i : i gt.eq 1 } \, $
  which is a DCC set because the added sequence is strictly increasing.
    Global ACC would force the coefficients $1 - a_i$ to belong to a finite set, a contradiction.
  #emph[Bounded topology and class-group torsion.] We have obtained the uniform singularity bound without choosing
    any bound for the class group. We now turn this geometric information into a finite topological list.
  Birkar’s boundedness theorem [5] Theorem 1.7 now applies to the original varieties $Z$.
    Its hypotheses are projectivity, fixed dimension, generalized $epsilon$-lc singularities, effective boundary,
    a real-linearly trivial generalized adjoint, and rational connectedness.
    The singularity bound was just proved, the adjoint is even rationally linearly trivial,
    and rational connectedness follows from that of the given smooth projective resolution.
    Thus, for every $Z$, the theorem gives a projective variety $V_Z$, chosen from one bounded set,
    that is isomorphic to $Z$ in codimension one. Replacing each $V_Z$ by its finite normalization preserves this
    property: normalization is an isomorphism over the common normal open subset,
    and the complement still has codimension at least two. These normalizations still form a bounded set,
    as in [5] Section 9.5. Hence there is a projective morphism $cal(V) arrow.r S$,
    with $S$ of finite type over $bb(C)$, such that for every $Z$ some fibre $V_s := cal(V)_s$,
    $s in S \( bb(C) \)$, is normal and isomorphic to $Z$ in codimension one.
  We explain explicitly how this boundedness controls torsion. Put $U = Z_(upright("reg"))$. The groups
  $ H_1 #scale(x: 120%, y: 120%)[\(] U \( bb(C) \) \, bb(Z) #scale(x: 120%, y: 120%)[\)] $
  are finitely generated and take only finitely many isomorphism types.
    First, this group is invariant under isomorphism in codimension one of normal varieties.
    The common open subset, intersected with the regular loci,
    is obtained from each regular locus by removing a closed subset of complex codimension at least two.
    Removing such a subset from a smooth complex variety does not change its fundamental group:
    choose a smooth stratification of the removed subset and perturb paths and homotopies,
    relative to their prescribed boundaries, to be transverse to its strata.
    All these strata have real codimension at least four, so the perturbed paths and two-dimensional homotopies
    avoid them. The assertion for $H_1$ follows by abelianization.
  Second, we prove the assertion for the selected fibres $V_s$.
    Replace $S$ by its reduction and partition it into finitely many locally closed strata over which the family
    is flat. Cover these strata by finitely many affine opens. On any one of these opens, still denoted $S$, let
  $ cal(U) = "Sm" \( cal(V) \/ S \) $
  be the full relative smooth locus. Flatness and finite presentation give
  $ cal(U)_s = "Sm" \( cal(V)_s \/ bb(C) \) = \( V_s \)_(upright("reg")) $
  for each selected normal fibre, since regularity and smoothness agree over $bb(C)$.
    Embed $cal(V)$ in $bb(P)_(bb(C))^N times S$. Identify $bb(P)^N \( bb(C) \)$ with the real algebraic set of
    Hermitian matrices $H$ satisfying $H^2 = H$ and $"tr" H = 1$, by $\[ z \] mapsto z z^(*) \/ \( z^(*) z \)$,
    where $z^(*)$ is conjugate transpose. With real and imaginary coordinates on the affine $S$, the entire map
  $ cal(U) \( bb(C) \) arrow.r S \( bb(C) \) $
  is then a continuous semialgebraic map between affine semialgebraic spaces.
    The semialgebraic triviality theorem of Delfs and Knebusch [8] Theorem 6.4 gives a finite partition of
    $S \( bb(C) \)$ into semialgebraic pieces over each of which the whole inverse image is a product.
    Thus the selected regular loci have only finitely many homeomorphism types.
    Each semialgebraic fibre has the homotopy type of a finite simplicial complex by [8] Theorem 2.1 and
    Propositions 2.4–2.5. The asserted finite list of finitely generated groups $H_1$ follows.
  For each individual $Z$, the group $"Cl" \( Z \)$ is also finitely generated.
    Indeed, let $r : Y arrow.r Z$ be a smooth projective rationally connected resolution.
    Weil divisor pushforward gives a surjection
  $ "Pic" \( Y \) arrow.r "Cl" \( Z \) : $
  strict transforms give surjectivity on divisors, and principal divisors push forward to principal divisors.
    The Albanese map of $Y$ is constant on every rational curve and therefore constant on $Y$,
    since rational curves connect general points. Consequently $"Pic"^0 \( Y \) = 0$,
    and Néron–Severi finiteness makes $"Pic" \( Y \)$ finitely generated.
  Normality and projectivity give $Gamma \( U \, cal(O)_U^(*) \) = bb(C)^(*)$,
    and restriction gives $"Pic" \( U \) = "Cl" \( Z \)$ because $U$ is regular and contains every codimension-one
    point. The $n$th-power map on $bb(C)^(*)$ is surjective. For every $n gt.eq 1$,
    the étale Kummer sequence [20] Tag 03PK gives the first isomorphism below.
    Riemann existence for finite étale covers [14] Exposé XII,
    Théorème 5.1 and Corollaire 5.2 gives the second by classification of finite abelian torsors and abelianization:
  #[#set math.equation(numbering: n => "(7.1)")
   $ "Cl" \( Z \) \[ n \] tilde.eq H_(upright(acute(e) t))^1 \( U \, mu_n \) tilde.eq "Hom"
     #scale(x: 120%, y: 120%)[\(] H_1 \( U \( bb(C) \) \, bb(Z) \) \,
     mu_n \( bb(C) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:rc-kummer>]
  For a fixed $Z$, the orders of the groups on the left are bounded as $n$ varies,
    because $"Cl" \( Z \)$ is finitely generated. If $H_1 \( U \( bb(C) \) \, bb(Z) \)$ had a free summand of
    positive rank, the orders of the groups on the right would grow without bound.
    Hence $H_1 \( U \( bb(C) \) \, bb(Z) \)$ is finite. Only finitely many such finite groups occur by the
    preceding paragraph, so there is a uniform integer $T$ divisible by all their exponents.
    Every torsion class $c in "Cl" \( Z \)$ is killed by $T$:
    take $n$ equal to its order and apply (7.1), whose right-hand side has exponent dividing $T$.
  #emph[An integral principal multiple.] Finally, $p M_Z$ is an integral Weil divisor,
    being the pushforward of a Cartier divisor on a model determining the nef data.
    Choose a uniform integer $q$ divisible by $p$ and by all denominators in the finite set $I_0$.
    Then $q D$ is an integral Weil divisor. The relation $D tilde.op_(bb(Q)) 0$ makes the class $\[ q D \] in
    "Cl" \( Z \)$ torsion: if $n D = "Div" \( v \)$ for some $n gt.eq 1$ and $v in bb(C) \( Z \)^(*)$,
    then $n \( q D \) = "Div" \( v^q \)$. Hence $T q D$ is principal.
    Taking $ell = T q$ proves the proposition for dimension $d$.
    Taking a common multiple of the finitely many resulting integers handles the stated range of dimensions.
    All positive multiples of $ell D$ are principal, and projectivity and integrality of $Z$ give the last
    assertion about sections. ◻
]

#thm([Corollary 7.2.])[
  #emph[Fix a finite rational coefficient set $Phi subset \[ 0 \, 1 \] ∩ bb(Q)$.
    There is a positive integer $r = r \( Phi \)$ such that the following holds.
    Let $\( X \, B \)$ be a projective klt fourfold pair with effective boundary having coefficients in $Phi$,
    and suppose that $K_X + B tilde.op_(bb(Q)) 0$. If there is a contraction $f : X arrow.r
    Z$ with $dim Z > 0$ and with a rationally connected smooth projective resolution of $Z$,
    then $r \( K_X + B \)$ is an integral principal divisor. This includes $B = 0$,
    and every positive multiple is also principal.]
] <cor:relative-rc-torsion>

#proof[
  Apply Theorem 1 to $f$ with the zero divisor as the rational pullback class.
    It gives uniformly bounded integers $p_0 divides p$, a rational function $psi in bb(C) \( X \)^(*)$,
    and an exact divisor identity
  #[#set math.equation(numbering: n => "(7.2)")
   $ K_X + B + 1 / p_0 "Div" \( psi \) = f^(*) D_Z \, wide D_Z = K_Z + B_Z + M_Z \, $ <eq:rc-exact-relative>]
  where $\( Z \, B_Z + M_Z \)$ is generalized klt, $B_Z$ is effective with coefficients in a fixed rational DCC
    set, and $p upright(bold(M))$ is b-Cartier with nef data. The divisor $D_Z$ is rationally linearly trivial.
    This also follows directly from $f^(*) D_Z tilde.op_(bb(Q)) 0$:
    choose a positive multiple making $D_Z$ Cartier and its pullback linearly trivial, and use $f_(*) cal(O)_X =
    cal(O)_Z$ and the projection formula to trivialize that multiple on $Z$.
  Proposition 4 gives a uniform integer $ell$ and $v in bb(C) \( Z \)^(*)$ such that $ell D_Z = "Div" \( v \)$.
    Choose $r$ divisible by both $ell$ and $p$, so that $p_0 divides r$. Multiplying (7.2) by $r$ gives
  $ r \( K_X + B \) = "Div" #h(-0.16667em) (\( v compose f \)^(r \/ ell) psi^(- r \/ p_0)) . $
  Both exponents are integers, so this is an equality to the divisor of an actual rational function and includes
    the integrality of the adjoint multiple. All constants depend only on $Phi$,
    since the possible dimensions of $Z$ form a finite set and the denominator theorem supplies uniform $p_0 \,
    p$ and a fixed DCC set. ◻
]

#heading(level: 1)[References]
#bibitem([1])[F.~Ambro, #emph[Shokurov's boundary property], J. Differential Geom.
  #strong[67] (2004), no.~2, 229--255. #link("https://doi.org/10.4310/jdg/1102536201")[doi:10.4310/jdg/1102536201].]
#bibitem([2])[F.~Ambro, #emph[The moduli b-divisor of an lc-trivial fibration], Compos. Math.
  #strong[141] (2005), no.~2, 385--403.
  #link("https://doi.org/10.1112/S0010437X04001071")[doi:10.1112/S0010437X04001071].]
#bibitem([3])[B.~Bakker, S.~Filipazzi, M.~Mauri, and J.~Tsimerman,
  #emph[Baily--Borel compactifications of period images and the b-semiampleness conjecture], preprint,
  #link("https://arxiv.org/abs/2508.19215v2")[arXiv:2508.19215v2], 18 December 2025.]
#bibitem([4])[C.~Birkar, P.~Cascini, C.~D.~Hacon, and J.~McKernan,
  #emph[Existence of minimal models for varieties of log general type], J. Amer. Math. Soc.
  #strong[23] (2010), no.~2, 405--468.
  #link("https://doi.org/10.1090/S0894-0347-09-00649-3")[doi:10.1090/S0894-0347-09-00649-3].
  #link("https://arxiv.org/abs/math/0610203v2")[arXiv:math/0610203v2].]
#bibitem([5])[C.~Birkar, #emph[Singularities on Fano fibrations and beyond], preprint,
  #link("https://arxiv.org/abs/2305.18770v2")[arXiv:2305.18770v2] (2025).]
#bibitem([6])[C.~Birkar and D.-Q.~Zhang, #emph[Effectivity of Iitaka fibrations and pluricanonical systems of
  polarized pairs], Publ. Math. Inst. Hautes Études Sci. #strong[123] (2016), 283--331.
  #link("https://doi.org/10.1007/s10240-016-0080-x")[doi:10.1007/s10240-016-0080-x].]
#bibitem([7])[G.~Chen and N.~Tsakanikas, #emph[On the termination of flips for log canonical generalized pairs],
  Acta Math. Sin. (Engl. Ser.) #strong[39] (2023), 967--994.
  #link("https://doi.org/10.1007/s10114-023-0116-3")[doi:10.1007/s10114-023-0116-3]. Preprint:
  #link("https://arxiv.org/abs/2011.02236v2")[arXiv:2011.02236v2].]
#bibitem([8])[H.~Delfs and M.~Knebusch, #emph[On the homology of algebraic varieties over real closed fields], J.
  reine angew. Math. #strong[335] (1982), 122--163.
  #link("https://doi.org/10.1515/crll.1982.335.122")[doi:10.1515/crll.1982.335.122].
  #link("https://epub.uni-regensburg.de/12717/1/ubr05118_ocr.pdf")[Repository copy].]
#bibitem([9])[E.~Floris, #emph[Bounds on the denominators in the canonical bundle formula], Ann. Inst.
  Fourier (Grenoble) #strong[63] (2013), no.~5, 1951--1969.
  #link("https://doi.org/10.5802/aif.2819")[doi:10.5802/aif.2819].]
#bibitem([10])[O.~Fujino, #emph[Abundance theorem for semi log canonical threefolds], Duke Math. J.
  #strong[102] (2000), no.~3, 513--532.
  #link("https://doi.org/10.1215/S0012-7094-00-10237-2")[doi:10.1215/S0012-7094-00-10237-2].
  #link("https://www.math.kyoto-u.ac.jp/~fujino/Abundance.pdf")[Author's copy of the published article].]
#bibitem([11])[O.~Fujino and Y.~Gongyo, #emph[On the moduli b-divisors of lc-trivial fibrations], Ann. Inst.
  Fourier (Grenoble) #strong[64] (2014), no.~4, 1721--1735.
  #link("https://doi.org/10.5802/aif.2894")[doi:10.5802/aif.2894].]
#bibitem([12])[O.~Fujino and S.~Mori, #emph[A canonical bundle formula], J. Differential Geom.
  #strong[56] (2000), no.~1, 167--188. #link("https://doi.org/10.4310/jdg/1090347529")[doi:10.4310/jdg/1090347529].]
#bibitem([13])[Y.~Gongyo, #emph[Abundance theorem for numerically trivial log canonical divisors of semi-log
  canonical pairs], J. Algebraic Geom. #strong[22] (2013), no.~3, 549--564.
  #link("https://doi.org/10.1090/S1056-3911-2012-00593-1")[doi:10.1090/S1056-3911-2012-00593-1].
  #link("https://www.ms.u-tokyo.ac.jp/~gongyo/papers/abundance_sub7.pdf")[Author version].]
#bibitem([14])[A.~Grothendieck (dir.), #emph[Revêtements étales et groupe fondamental (SGA~1)],
  Séminaire de Géométrie Algébrique du Bois Marie 1960--61, augmenté de deux exposés de M.~Raynaud,
  Documents Mathématiques #strong[3], Société Mathématique de France, Paris, 2003.
  #link("https://arxiv.org/abs/math/0206203")[arXiv:math/0206203].]
#bibitem([15])[C.~D.~Hacon, J.~McKernan, and C.~Xu, #emph[ACC for log canonical thresholds], Ann. of Math.
  (2) #strong[180] (2014), no.~2, 523--571.
  #link("https://doi.org/10.4007/annals.2014.180.2.3")[doi:10.4007/annals.2014.180.2.3].]
#bibitem([16])[C.~Jiang and H.~Liu, #emph[Boundedness of log pluricanonical representations of log Calabi--Yau
  pairs in dimension 2], Algebra Number Theory #strong[15] (2021), no.~2, 545--567.
  #link("https://doi.org/10.2140/ant.2021.15.547")[doi:10.2140/ant.2021.15.547]. Preprint:
  #link("https://arxiv.org/abs/2002.11928v1")[arXiv:2002.11928v1].]
#bibitem([17])[J.~Kollár, with the collaboration of S.~Kovács, #emph[Singularities of the minimal model program],
  Cambridge Tracts in Mathematics, vol.~200, Cambridge University Press, Cambridge, 2013.
  #link("https://doi.org/10.1017/CBO9781139547895")[doi:10.1017/CBO9781139547895].]
#bibitem([18])[J.~Kollár, with the collaboration of K.~Altmann and S.~J.~Kovács,
  #emph[Families of varieties of general type], Cambridge Tracts in Mathematics, vol.~231,
  Cambridge University Press, Cambridge, 2023.
  #link("https://doi.org/10.1017/9781009346115")[doi:10.1017/9781009346115].
  #link("https://web.math.princeton.edu/~kollar/FromMyHomePage/modbook-final.pdf")[Author version dated 8 August 2022].]
#bibitem([19])[J.~Kollár and S.~Mori, #emph[Birational Geometry of Algebraic Varieties],
  Cambridge Tracts in Mathematics #strong[134], Cambridge University Press, Cambridge, 1998.
  #link("https://doi.org/10.1017/CBO9780511662560")[doi:10.1017/CBO9780511662560].]
#bibitem([20])[The Stacks Project Authors, #emph[The Stacks Project], Lemma~58.21.4,
  Tag #link("https://stacks.math.columbia.edu/tag/0BMB")[0BMB] (purity of the branch locus),
  and Tag #link("https://stacks.math.columbia.edu/tag/03PK")[03PK] (Kummer theory).]
#bibitem([21])[G.~Todorov and C.~Xu, #emph[Effectiveness of the log Iitaka fibration for 3-folds and 4-folds],
  Algebra Number Theory #strong[3] (2009), no.~6, 697--710.
  #link("https://doi.org/10.2140/ant.2009.3.697")[doi:10.2140/ant.2009.3.697].]
