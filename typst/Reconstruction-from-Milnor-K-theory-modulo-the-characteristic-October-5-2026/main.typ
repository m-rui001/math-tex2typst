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

#align(center)[#text(size: 16pt, weight: "bold")[Reconstruction from Milnor $K$-theory \
modulo the characteristic]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Milnor $K$-theory records multiplication in a field together with relations arising from addition.
  A reconstruction problem asks whether this information determines the field,
  and whether isomorphisms of the invariant come from field isomorphisms.
  We study this question in characteristic $p$ using only the first two Milnor $K$-groups modulo $p$.

Fix a prime $p$ and write $Lambda = upright(bold(F))_p$. For a field $F$ of characteristic $p$, set

$ V_F = F^times \/ \( F^times \)^p = upright(K)_1^(upright(M)) \( F \) \/ p . $

We write $\[ f \]$ for the class of $f in F^times$ and use additive notation in $V_F$:
  thus $\[ f \] + \[ g \] = \[ f g \]$, $r \[ f \] = \[ f^r \]$ for $r in upright(bold(Z))$, and $\[ 1 \] = 0$.
  Define the Steinberg relation subspace

$ R_F = "Span"_Lambda { \[ f \] ⊗ \[ 1 - f \] : f in F \\ { 0 \, 1 } } subset V_F ⊗_Lambda V_F . $

The quotient $W_F = \( V_F ⊗_Lambda V_F \) \/ R_F$ is $upright(K)_2^(upright(M)) \( F \) \/
  p$ by the tensor presentation of Milnor $K$-theory #cite(label("Milnor1970")) Section 1.
  We denote the image of $\[ f \] ⊗ \[ g \]$ in $W_F$ by ${ f \, g }_F$.

Let $"Isom"_(upright(M)) \( V_K \, V_L \)$ be the set of $Lambda$-linear isomorphisms $Theta : V_K arrow.r
  V_L$ satisfying

$ \( Theta ⊗ Theta \) \( R_K \) = R_L . $

We call these isomorphisms #emph[compatible]. Equivalently,
  $Theta$ extends to an isomorphism of the degree-one and degree-two groups respecting their product pairing.
  Scalar multiplication by $Lambda^times$ acts on this set.
  For specified subfields $k subset K$ and $l subset L$, write $"Isom" \( K \, k \; L \, l \)$ for the field
  isomorphisms $alpha : K arrow.r L$ with $alpha \( k \) = l$.
  Such an isomorphism induces $alpha_(*) \( \[ f \] \) = \[ alpha \( f \) \]$ and carries $R_K$ onto $R_L$.

#thm([Theorem 1.1.])[
  #emph[Let $K \/ k$ and $L \/ l$ be finitely generated extensions of algebraically closed fields of
    characteristic $p$, with
$ "trdeg" \( K \/ k \) gt.eq 2 \, wide "trdeg" \( L \/ l \) gt.eq 2 . $

 The canonical map
$ "Isom" \( K \, k \; L \, l \) arrow.r "Isom"_(upright(M)) \( V_K \, V_L \) \/ Lambda^times \, wide
  alpha mapsto \[ alpha_(*) \] \, $

 is bijective.]
] <thm:main>

The invariant therefore determines the field and its isomorphisms,
  with exactly the scalar identification in the displayed target.
  The argument also recovers the named algebraically closed base from the field itself.

=== 1.1 Context and method <context-and-method>

Bogomolov and Tschinkel developed a reconstruction method that recovers projective lines from multiplication and
  algebraic dependence, and applied it to Milnor $K$-theory in characteristic zero
  #cite(label("BogomolovTschinkel2009")). Cadoret and Pirutka extended reconstruction from the multiplicative
  group modulo constants and algebraic dependence to finitely generated regular extensions of perfect fields
  #cite(label("CadoretPirutka2021")) Theorem 4. For algebraically closed or finite base fields,
  they also obtained reconstruction from suitable quotients of the Milnor $K$-ring
  #cite(label("CadoretPirutka2021")) Corollary 10.

Reconstruction from other reduced forms of $K$-theory has also been studied.
  For a prime $ell$ different from the characteristic, Topaz recovers perfect closures from mod-$ell$ data
  together with rational subgroups for function fields over algebraically closed bases in transcendence degree at
  least five #cite(label("Topaz2016")) Theorem B. His work on rational Milnor $K$-theory reconstructs perfect
  closures for fields of absolute transcendence degree at least five #cite(label("Topaz2023")) Main Theorem.
  Theorem 1 concerns reduction modulo the characteristic and starts directly from $V_F$ and $R_F$;
  neither rational subgroups nor algebraic-dependence data are supplied.

The geometric framework of our proof has close predecessors.
  A differential approach to line recovery appears in an argument of Rovinsky recorded by Bogomolov and Tschinkel
  #cite(label("BogomolovTschinkel2012")) Proposition 9. In positive characteristic,
  Cadoret and Pirutka recover projective lines over the subfield of $p$th powers after a common power correction,
  using a differential intersection calculation #cite(label("CadoretPirutka2021")) Section 1.3, Lemma 23,
  and Proposition 27. Here the intersection calculation involves only degree-$p$ extensions of the subfield of
  $p$th powers. The resulting intersection statement, Proposition 6,
  and the passage from vanishing symbols to these subextensions are given complete elementary proofs below.
  These are the two structural ingredients that allow the degree-two mod-$p$ relations to supply the required
  projective geometry.

=== 1.2 Outline of the proof <outline-of-the-proof>

Put $C_F = F^p$. Since $\( F^times \)^p = C_F^times$, the underlying set of $V_F$ is the projective point set
  $upright(bold(P))_(C_F) \( F \)$. Its point $\[ 1 \]$ is the zero of the group $V_F$;
  its projective lines are the sets of one-dimensional subspaces in two-dimensional $C_F$-subspaces of $F$.
  The field degree is finite:

$ \[ F : C_F \] = p^("trdeg" \( F \/ kappa \)) $

for $F \/ kappa$ as in the theorem. This is a projective geometry over $C_F$,
  not over the original constant field $kappa$.

The first step constrains pairs with vanishing symbol. If $s in.not C_F$ and ${ s \, t }_F = 0$,
  then $t in C_F \( s \)$. To prove this implication, consider a $p$-independent pair $s \, t$,
  meaning that $\[ C_F \( s \, t \) : C_F \] = p^2$. Extend it to a monomial basis and take the determinant of two
  logarithmic derivatives. This pairing kills Steinberg relations and is nonzero on the independent pair.
  Section 2 supplies the details.

The fields $C_F \( s \)$ need not themselves be two-dimensional over $C_F$,
  so this implication does not yet recover projective lines.
  The key calculation in Section 3 uses intersections of two multiplicative translates of such subfields.
  For a $p$-independent pair $X \, Y$, suppose $U in C_F \( X \)^times$ and $V in
  C_F \( Y \)^times$ are not scalar multiples of powers of $X \, Y$, respectively. A nonzero element of

$ X thin C_F \( Y \/ X \) med ∩ med U thin C_F \( V \/ U \) $

forces, for a unique $1 lt.eq n < p$,

$ U^n in C_F + C_F X^n \, wide V^n in C_F + C_F Y^n . $

Euler derivations give this common exponent and show that either inclusion determines it.

Section 4 produces the required intersections from Steinberg relations.
  Uniqueness propagates the exponent across a connected graph,
  giving one scalar $n$ for which $n Theta$ preserves every projective line.
  Applying the argument to the inverse, and using the fact that no nontrivial scalar preserves projective lines,
  yields preservation in both directions. Section 5 then proves the needed projective lifting theorem and uses the
  multiplicative group law to turn the normalized semilinear lift into a field isomorphism.
  Finally, the identity $⋂_(m gt.eq 1) F^(p^m) = kappa$ recovers the original base and completes the theorem.

== 2 Symbols and projective points over $p$th powers <sec:symbols>

Let $F \/ kappa$ be a finitely generated extension of an algebraically closed field of characteristic $p$, and put

$ C = F^p \, wide d = "trdeg" \( F \/ kappa \) . $

Since $\( F^times \)^p = C^times$, the underlying set of $V_F$ is the point set of the projective space
  $upright(bold(P))_C \( F \)$: the class $\[ f \]$ represents the one-dimensional $C$-subspace $C f$.
  These projective points also carry the $upright(bold(F))_p$-vector-space structure
  $\[ f \] + \[ g \] = \[ f g \]$, whose zero is $\[ 1 \]$.
  We will use both structures, keeping their two scalar fields distinct.
  Our first task is to extract from a vanishing symbol the field-theoretic constraint that will allow us to
  recover projective lines.

#thm([Lemma 2.1.])[
  #emph[With the notation above, $\[ F : C \] = p^d$.]
] <lem:p-degree>

#proof[
  Choose a transcendence basis $t_1 \, dots.h \, t_d$ over $kappa$, and write $F_0 =
    kappa \( t_1 \, dots.h \, t_d \)$. Perfectness of $kappa$ gives $F_0^p =
    kappa \( t_1^p \, dots.h \, t_d^p \)$. The monomials $t_1^(i_1) dots.h.c t_d^(i_d)$ with $0 lt.eq
    i_j < p$ form a basis of $F_0$ over $F_0^p$: group polynomial exponents modulo $p$,
    and for rational functions use $a \/ b = a b^(p - 1) \/ b^p$.
    Linear independence follows by clearing denominators and separating the exponent classes.
    Thus $\[ F_0 : F_0^p \] = p^d$.
  The extension $F \/ F_0$ is finite, and Frobenius induces an isomorphism of extensions $F \/ F_0 tilde.eq F^p \/
    F_0^p$. Computing $\[ F : F_0^p \]$ in the two towers through $F_0$ and $F^p$ gives
  $ \[ F : F_0 \] p^d = \[ F : F^p \] \[ F^p : F_0^p \] = \[ F : F^p \] \[ F : F_0 \] . $
  Cancellation proves the assertion without a separability assumption. ◻
]

A list $s_1 \, dots.h \, s_r in F$ is #emph[$p$-independent over $C$] if $\[ C \( s_1 \, dots.h \, s_r \) : C \] =
  p^r$. A $p$-independent list generating $F$ over $C$ is called a #emph[$p$-basis].
  Its monomials supply derivations that record one exponent at a time.

#thm([Lemma 2.2.])[
  #emph[Let $F$ be any field of characteristic $p$, and put $C = F^p$.
    If $C subset.eq M subset.eq F$ and $s in F \\ M$, then $\[ M \( s \) : M \] = p$.
    If $\[ F : C \]$ is finite, every $p$-independent list extends to a $p$-basis $s_1 \, dots.h \,
    s_e$ of $F \/ C$, with $\[ F : C \] = p^e$ and monomial basis
$ { s_1^(i_1) dots.h.c s_e^(i_e) : 0 lt.eq i_j < p } . $

 For such a basis there are commuting $C$-linear derivations $D_1 \, dots.h \, D_e$ on $F$ satisfying
$ D_j \( s_1^(i_1) dots.h.c s_e^(i_e) \) = i_j s_1^(i_1) dots.h.c s_e^(i_e) . $

 On $C \( s_j \)$ the kernel of $D_j$ is $C$, and its nonzero eigenvectors with eigenvalue in $C$ are precisely
   the elements $c s_j^i$, where $c in C^times$ and $0 lt.eq i < p$;
   their eigenvalues are $i in upright(bold(F))_p$. Moreover, $C \( s_j \) ∩ C \( s_k \) = C$ when $j eq.not k$.]
] <lem:p-basis>

#proof[
  Since $s^p in C$, the minimal polynomial of $s$ over $M$ divides $T^p - s^p = \( T - s \)^p$.
    If its degree were $1 lt.eq e < p$, it would be $\( T - s \)^e$, and its coefficient $-
    e s$ of $T^(e - 1)$ would force $s in M$. Thus every strict adjunction has degree $p$.
    When $\[ F : C \]$ is finite, successive adjunctions must terminate,
    so they extend any $p$-independent list to a generating list.
    If its length is $e$, the tower formula gives $\[ F : C \] = p^e$,
    and the usual basis of each simple extension gives the asserted monomial basis.
  Define the $D_j$ on these monomials and extend $C$-linearly.
    When two monomials are multiplied, reducing an exponent by $p$ only removes a factor in $C$ and leaves its
    value in $upright(bold(F))_p$ unchanged. This proves the product rule.
    The operators commute because they are diagonal on the same basis.
    On $C \( s_j \)$ their eigenvector assertions follow from the distinct eigenvalues $0 \, 1 \, dots.h \, p -
    1$ on $1 \, s_j \, dots.h \, s_j^(p - 1)$. Finally, the expansions of an element in both $C \( s_j \)$ and
    $C \( s_k \)$ can have only their constant term in common. ◻
]

For a $p$-independent pair $s \, t$, write $D_s \, D_t$ for the corresponding derivations obtained from any
  extending $p$-basis. The following proof uses a coordinate form of the logarithmic differential symbol;
  the much stronger injectivity theorem for that symbol is the Bloch–Gabber–Kato theorem
  #cite(label("BlochKato1986")) Theorem (2.1). Here we check the needed implication directly.

#thm([Lemma 2.3.])[
  #emph[For $s \, t in F^times$, one has
$ s in.not C \, wide { s \, t }_F = 0 quad arrow.r.double quad t in C \( s \) . $

]
] <lem:zero-symbol>

#proof[
  Suppose instead that $s in.not C$ and $t in.not C \( s \)$. By Lemma 3, the pair $s \, t$ is $p$-independent. Consider
  $ beta \( \[ f \] \, \[ g \] \) = frac(D_s f, f) frac(D_t g, g) - frac(D_t f, f) frac(D_s g, g) \, wide f \,
    g in F^times . $
  Each logarithmic derivative is additive on products and vanishes on $C^times$.
    Hence $beta$ is a well-defined $upright(bold(F))_p$-bilinear map $V_F times V_F arrow.r F$.
    For $f eq.not 0 \, 1$, the identities $D_s \( 1 - f \) = - D_s f$ and $D_t \( 1 - f \) = -
    D_t f$ give $beta \( \[ f \] \, \[ 1 - f \] \) = 0$. Thus $beta$ descends through the Steinberg relations to
    an $upright(bold(F))_p$-linear map $W_F arrow.r F$. But $D_s s = s$, $D_t t = t$, and $D_s t = D_t s = 0$,
    so this map sends ${ s \, t }_F$ to $1$. The symbol cannot vanish. ◻
]

The symbols arising from an affine line do vanish, by the defining Steinberg relation itself.

#thm([Lemma 2.4.])[
  #emph[If $c \, d in C^times$ and $t \, c + d t in F^times$, then
$ { t \, c + d t }_F = 0 . $

]
] <lem:affine-symbol>

#proof[
  Put $q = - d t \/ c$. The hypotheses give $q eq.not 0 \, 1$,
    while $\[ q \] = \[ t \]$ and $\[ 1 - q \] = \[ c + d t \]$, since the omitted factors lie in $C^times$.
    Therefore the identity is the Steinberg relation ${ q \, 1 - q }_F = 0$. ◻
]

== 3 An intersection that determines an exponent <sec:intersection>

For $X in F \\ C$, the projective line through $\[ 1 \]$ and $\[ X \]$ consists of the nonzero elements of $C +
  C X$, modulo $C^times$. To recover such lines from degree-$p$ subfields,
  we need to pass from membership in $C \( X \)$ to membership in $C + C X$, possibly after taking a power.
  The following intersection provides such a condition for two $p$-independent elements at once.
  Its uniqueness assertion will allow the exponent to be compared between different pairs.

The use of differential equations to control such intersections,
  including the power correction in positive characteristic,
  appears in #cite(label("CadoretPirutka2021"), form: "prose") Sections 3.4–3.5.
  Here the degree-$p$ subextensions allow a direct proof using commuting Euler derivations.

#thm([Proposition 3.1.])[
  (Intersection and exponent).  #emph[Let $F$ be a field of characteristic $p$ with $\[ F : F^p \] < oo$,
    and put $C = F^p$. Let $X \, Y in F^times$ be $p$-independent. Suppose
$ U in C \( X \)^times \, wide V in C \( Y \)^times \, wide \[ U \] in.not upright(bold(F))_p \[ X \] \,
  wide \[ V \] in.not upright(bold(F))_p \[ Y \] . $

 If
#[#set math.equation(numbering: n => "(3.1)")
 $ X thin C \( Y \/ X \)^times med ∩ med U thin C \( V \/ U \)^times eq.not diameter \, $ <eq:intersection-witness>]

 then there is a unique integer $n$, $1 lt.eq n < p$, such that
#[#set math.equation(numbering: n => "(3.2)")
 $ U^n in C + C X^n \, wide V^n in C + C Y^n . $ <eq:intersection-conclusion>]

 In fact, either inclusion in (3.2) determines $n$ uniquely. In each inclusion, both coefficients are nonzero.]
] <prop:intersection>

The shape of (3.1) reflects the inclusion $C X + C Y subset.eq X thin C \( Y \/ X \)$,
  and its counterpart for $U \, V$. Thus a common nonzero vector of the two spans yields the required intersection.

#proof[
  Choose $Z$ in the intersection (3.1). Extend $X \, Y$ to a $p$-basis and let $D_X \,
    D_Y$ be the commuting Euler derivations of Lemma 3. We first translate the two descriptions of $Z$ into
    differential equations. Since $U$ and $V$ are not scalar multiples of monomials in $X$ and $Y$, respectively,
    the eigenvector description in that lemma gives
  $ D_X U eq.not 0 \, wide D_Y V eq.not 0 . $
  Define
  $ B_X = frac(U, D_X U) \, wide B_Y = frac(V, D_Y V) \, wide A_X = B_X - 1 \, wide A_Y = B_Y - 1 . $
  Here $A_X in C \( X \) \\ C$ and $A_Y in C \( Y \) \\ C$:
    if, for example, $B_X in C$, then $D_X U = B_X^(- 1) U$, making $U$ an eigenvector and hence a scalar multiple
    of a monomial in $X$. In particular, $A_X \, A_Y \, B_X \, B_Y$ are all nonzero.
  The derivations
  $ delta = D_X + D_Y \, wide delta' = B_X D_X + B_Y D_Y $
  satisfy $delta X = X$, $delta Y = Y$, $delta' U = U$, and $delta' V = V$.
    Thus $delta$ kills $Y \/ X$, whereas $delta'$ kills $V \/ U$; both kill $C$.
    The two expressions for $Z$ therefore give
  $ delta Z = Z = delta' Z . $
  Set
  $ q_X = frac(D_X Z, Z) \, wide q_Y = frac(D_Y Z, Z) . $
  Dividing the preceding equations by $Z$ and subtracting yields
  #[#set math.equation(numbering: n => "(3.3)")
   $ q_X + q_Y = 1 \, wide A_X q_X + A_Y q_Y = 0 . $ <eq:intersection-q>]
  Both $q_X$ and $q_Y$ are nonzero: if one vanished, these two equations would force the other $A$ to vanish.
  Since $delta$ commutes with $D_X$ and $D_Y$, the equation $delta Z = Z$ implies that $q_X \,
    q_Y$ are killed by $delta$:
  $ delta q_X = frac(D_X \( delta Z \), Z) - frac(D_X Z thin delta Z, Z^2) = 0 \, wide delta q_Y = 0 . $
  By (3.3), $A_X \/ A_Y = - q_Y \/ q_X$, so $delta \( A_X \/ A_Y \) = 0$. Since $D_Y A_X = D_X A_Y = 0$, we obtain
  #[#set math.equation(numbering: n => "(3.4)")
   $ frac(D_X A_X, A_X) = frac(D_Y A_Y, A_Y) . $ <eq:intersection-eigenvalue>]
  The left side lies in $C \( X \)$ and the right side in $C \( Y \)$.
    Their intersection is $C$, by the $p$-monomial basis. Consequently $A_X$ and $A_Y$ are eigenvectors of their
    respective Euler derivations with the same eigenvalue. The distinct eigenvalues on $1 \, X \, dots.h \,
    X^(p - 1)$, and on $1 \, Y \, dots.h \, Y^(p - 1)$, now give
  #[#set math.equation(numbering: n => "(3.5)")
   $ A_X = c_X X^m \, wide A_Y = c_Y Y^m $ <eq:intersection-monomials>]
  for $c_X \, c_Y in C^times$ and one integer $m$, $1 lt.eq m < p$.
    The eigenvalue cannot be zero because $A_X \, A_Y in.not C$.
  It remains to integrate (3.5) inside the one-variable subfields. Put $n = p - m$.
    The identity $1 + c_X X^m = B_X eq.not 0$ ensures that all terms in
  $ frac(D_X \( U^n \), U^n) = frac(n, 1 + c_X X^m) = frac(D_X \( X^n + c_X X^p \), X^n + c_X X^p) $
  are defined. Thus $D_X$ kills $U^n \/ \( X^n + c_X X^p \) in C \( X \)^times$.
    Its kernel on $C \( X \)$ is $C$, so this quotient belongs to $C^times$.
    Since $X^p in C^times$, we have $U^n in C + C X^n$ with both coefficients nonzero.
    Replacing $X \, U \, c_X \, D_X$ by $Y \, V \, c_Y \, D_Y$ proves the second inclusion.
  Finally, suppose $U^r = h + j X^r$ with $h \, j in C$ and $1 lt.eq r < p$. Both coefficients must be nonzero:
    otherwise $r \[ U \] in upright(bold(F))_p \[ X \]$, contrary to $\[ U \] in.not upright(bold(F))_p \[ X \]$.
    Taking logarithmic derivatives gives
  $ frac(D_X U, U) = frac(j X^r, h + j X^r) \, wide A_X = frac(h, j X^r) . $
  The last expression is a nonzero scalar multiple of $X^(p - r)$, since $X^p in C^times$.
    Comparison with (3.5) and linear independence of the $p$ monomials forces $p - r = m$, hence $r = n$.
    The argument for the inclusion involving $V$ is identical. ◻
]

All hypotheses and conclusions of Proposition 6 are unchanged when $X \, Y \, U \,
  V$ are multiplied by elements of $C^times$. In particular, its exponent depends on projective points,
  rather than on the representatives used in the calculation.

== 4 One scalar recovers all projective lines <sec:lines>

The intersection calculation produces a power correction for two points at a time.
  We now show that a single correction works throughout the projective space.
  The passage from local power corrections to a global one parallels
  #cite(label("CadoretPirutka2021"), form: "prose") Section 3.5;
  here the degree-$p$ subfields give a particularly simple connected graph on which to propagate the correction.

We first record why a nontrivial scalar cannot preserve projective lines.
  This will rule out a new scalar when we apply the line-recovery argument to the inverse map.

#thm([Lemma 4.1.])[
  #emph[Let $F$ have characteristic $p$, with $F eq.not F^p$.
    If multiplication by $r in upright(bold(F))_p^times$ on $V_F$ maps every projective line over $F^p$ into a
    projective line, then $r = 1$.]
] <lem:scalar-line>

#proof[
  Represent $r$ by an integer $1 lt.eq r < p$ and take $x in F \\ F^p$.
    The points $\[ 1 \] \, \[ x \] \, \[ x + 1 \]$ lie on one line.
    Their images under multiplication by $r$ are $\[ 1 \] \, \[ x^r \] \, \[ \( x + 1 \)^r \]$.
    The first two are distinct, so the asserted line containment implies
  $ \( x + 1 \)^r in F^p + F^p x^r . $
  If $1 < r < p$, the binomial expansion has nonzero coefficient $r$ at $x^(r - 1)$.
    This contradicts the linear independence of $1 \, x \, dots.h \, x^(p - 1)$ over $F^p$ from Lemma 3. ◻
]

#thm([Proposition 4.2.])[
  #emph[Let $K \/ k$ and $L \/ l$ be finitely generated extensions of algebraically closed fields of
    characteristic $p$, both of transcendence degree at least two.
    For every compatible isomorphism $Theta : V_K arrow.r V_L$,
    there is a unique $n in upright(bold(F))_p^times$ such that $Psi =
    n Theta$ sends every projective line over $K^p$ onto a projective line over $L^p$.]
] <prop:lines>

#proof[
  Put $H = K^p$ and $C = L^p$. We first find one scalar for which lines map into lines.
    Only after this construction will we apply it to the inverse.
  #emph[A connected graph of independent image pairs.] On the nonzero elements of $V_K$,
    join $\[ x \]$ and $\[ y \]$ by an edge when
  $ C \( X \) eq.not C \( Y \) \, wide \[ X \] = Theta \( \[ x \] \) \, quad \[ Y \] = Theta \( \[ y \] \) . $
  This condition is independent of the chosen representatives.
    Since $X \, Y in.not C$, the fields $C \( X \)$ and $C \( Y \)$ have degree $p$ over $C$.
    An edge therefore means that $X \, Y$ are $p$-independent.
    The graph is complete between distinct parts of the partition by the fields $C \( X \)$.
    It has at least two parts: by Lemma 2, $\[ L : C \] gt.eq p^2$,
    so for any $X in.not C$ there is an element of $L \\ C \( X \)$, and $Theta$ is surjective.
    Thus every vertex has a neighbor, and any two vertices are joined by a path of length at most two.
  #emph[An affine configuration along an edge.] Fix an edge $\[ x \] \, \[ y \]$.
    The elements $1 \, x \, y$ are linearly independent over $H$.
    Indeed, a dependence would give $y = c + d x$ with $c \, d in H$ and $d eq.not 0$, since $x \, y in.not H$.
    If $c = 0$, the two vertices would coincide. Otherwise Lemma 5 gives ${ x \, y }_K = 0$,
    and compatibility followed by Lemma 4 gives $Y in C \( X \)$, again contradicting the edge condition.
  For arbitrary $a \, b in H^times$, set
  #[#set math.equation(numbering: n => "(4.1)")
   $ u = x + a \, wide v = y + b \, wide z = b x - a y = b u - a v . $ <eq:affine-configuration>]
  These are nonzero: $u \, v$ are nonzero because $x \, y in.not H$, and $z eq.not 0$ because $x \,
    y$ are $H$-linearly independent. Moreover,
  #[#set math.equation(numbering: n => "(4.2)")
   $ \[ u \] in.not upright(bold(F))_p \[ x \] \, wide \[ v \] in.not upright(bold(F))_p \[ y \] .
     $ <eq:nonmonomial-source>]
  For example, $\[ u \] = i \[ x \]$ with $0 lt.eq i < p$ would give $x + a = h x^i$ for some $h in H^times$,
    contrary to the linear independence of $1 \, x \, dots.h \, x^(p - 1)$ and the condition $a eq.not 0$.
    Figure 1 shows the incidence that explains the two expressions for $z$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-0.23, 0), (4.887, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.23), (0, 2.587), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.3), (2.3, 0), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  line((0, 1.15), (4.6, 0), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$[1]$]], anchor: "north-east", padding: 0.1176cm)
  circle((2.3, 0), radius: 0.05292, fill: black, stroke: none)
  content((2.3, 0), [#text(size: 9pt)[$[x]$]], anchor: "north", padding: 0.1176cm)
  circle((4.6, 0), radius: 0.05292, fill: black, stroke: none)
  content((4.6, 0), [#text(size: 9pt)[$[u]$]], anchor: "north", padding: 0.1176cm)
  circle((0, 2.3), radius: 0.05292, fill: black, stroke: none)
  content((0, 2.3), [#text(size: 9pt)[$[y]$]], anchor: "east", padding: 0.1176cm)
  circle((0, 1.15), radius: 0.05292, fill: black, stroke: none)
  content((0, 1.15), [#text(size: 9pt)[$[v]$]], anchor: "east", padding: 0.1176cm)
  circle((1.533, 0.7667), radius: 0.0635, fill: black, stroke: none)
  content((1.604, 0.7667), [#text(size: 9pt)[$[z]$]], anchor: "south-west", padding: 0.1176cm)
})],
    caption: [Figure 1: The source configuration in the projective plane $upright(bold(P))_H \( H + H x + H y \)$. The point $\[ z \]$ lies on both the line joining $\[ x \] \, \[ y \]$ and the line joining $\[ u \] \, \[ v \]$. The drawing records only incidences; it imposes no order or metric on the characteristic-$p$ field. ],
  ) <fig:affine-configuration>
  Lemma 5, applied also to $z \/ x = b - a \( y \/ x \)$ and $z \/ u = b - a \( v \/ u \)$, gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ { x \, u }_K = { y \, v }_K = { y \/ x \, z \/ x }_K = { v \/ u \, z \/ u }_K = 0 . $ <eq:configuration-symbols>]
  Write $\[ U \] = Theta \( \[ u \] \)$, $\[ V \] = Theta \( \[ v \] \)$, and $\[ Z \] = Theta \( \[ z \] \)$.
    Compatibility and Lemma 4 applied to the first two symbols show that
  $ U in C \( X \)^times \, wide V in C \( Y \)^times . $
  Linearity and injectivity transport (4.2) to $\[ U \] in.not upright(bold(F))_p \[ X \]$ and $\[ V \] in.not
    upright(bold(F))_p \[ Y \]$. In particular $U \, V in.not C$.
    Also $Y \/ X in.not C$, since $X \, Y$ are $p$-independent, and $V \/ U in.not C$:
    otherwise $U$ would belong to $C \( X \) ∩ C \( Y \) = C$.
    We may therefore apply Lemma 4 to the last two symbols in (4.3). The result is
  $ Z in X C \( Y \/ X \)^times ∩ U C \( V \/ U \)^times . $
  All hypotheses of Proposition 6 now hold. It gives a common integer $1 lt.eq n < p$ such that
  #[#set math.equation(numbering: n => "(4.4)")
   $ U^n in C + C X^n \, wide V^n in C + C Y^n \, $ <eq:local-line-powers>]
  and either inclusion uniquely determines $n$.
  #emph[Propagation of the scalar.] Fix representatives for all vertices and their images.
    For a vertex $\[ x \]$, fix one neighbor $\[ y \]$ and one $b in H^times$.
    As $a in H^times$ varies, Proposition 6 applies to (4.1).
    The second inclusion in (4.4), whose pair $Y \, V$ stays fixed, forces the same $n$ for every $a$.
    To compare choices of neighbor and $b$, specialize to $a = 1$,
    keeping $X$ and a representative $U$ of $Theta \( \[ x + 1 \] \)$ fixed.
    Uniqueness for the first inclusion shows that these choices cannot change $n$.
    Thus each vertex has a well-defined scalar. Adjacent vertices have the same scalar by (4.4).
    Connectedness consequently supplies a single $n$ for all vertices and all $a in H^times$.
  Set $Psi = n Theta$, with $n$ viewed in $upright(bold(F))_p^times$.
    The line joining $\[ 1 \]$ and $\[ x \]$ consists of those two points and $\[ x + a \]$ for $a in H^times$.
    The first inclusion in (4.4) says exactly that its image is contained in the line joining $\[ 1 \]$ and
    $\[ X^n \]$. Every projective line is a multiplicative translate of one through $\[ 1 \]$:
    multiply the line joining $\[ s \] \, \[ t \]$ by $s^(- 1)$.
    Multiplication by a nonzero field element is linear over the field of $p$-th powers,
    and $Psi$ respects the multiplicative group law. Thus $Psi$ maps every line into a line.
  #emph[Equality of lines and uniqueness.] Scalar multiplication preserves compatibility,
    since it scales the tensor square by the nonzero scalar $n^2$. Hence $Psi^(- 1)$ is compatible.
    Apply the construction just completed, with the fields reversed,
    to obtain $r in upright(bold(F))_p^times$ for which $r Psi^(- 1)$ maps lines into lines.
    Its composition with $Psi$ is multiplication by $r$ on $V_K$ and has the same line-containment property.
    Lemma 7 forces $r = 1$. Thus both $Psi$ and its inverse map lines into lines.
    If $Psi \( ell \) subset.eq ell'$, choose a line $ell''$ containing $Psi^(- 1) \( ell' \)$. Then
  $ ell subset.eq Psi^(- 1) \( ell' \) subset.eq ell'' . $
  Two projective lines cannot properly contain one another, so $ell = ell''$ and both inclusions are equalities.
    Applying $Psi$ gives $Psi \( ell \) = ell'$.
  Finally, if $m Theta$ also sends lines onto lines, then $\( m Theta \) compose
    Psi^(- 1)$ is multiplication by $m n^(- 1)$ on $V_L$ and preserves lines.
    Another application of Lemma 7 gives $m = n$. ◻
]

== 5 From projective lines to the field <sec:fields>

Proposition 8 has recovered a bijection of projective spaces that preserves both lines and the multiplicative
  group law. The fundamental theorem of projective geometry #cite(label("Hall2015")) Section 8.2,
  Theorem 8.2 recovers addition from the lines; the group law then forces the resulting additive map to be
  multiplicative. This last passage also appears in #cite(label("CadoretPirutka2021"), form: "prose") Section 4,
  Lemma 29. We include the coordinate argument to make both the reconstruction and its uniqueness explicit.

#thm([Proposition 5.1.])[
  (Projective lifting).  #emph[Let $E$ and $E'$ be finite-dimensional vector spaces over fields $H$ and $C$,
    respectively, with dimensions at least three. Every bijection $psi : upright(bold(P))_H \( E \) arrow.r
    upright(bold(P))_C \( E' \)$ that maps lines onto lines is induced by an additive bijection $S : E arrow.r
    E'$ satisfying
$ S \( a v \) = sigma \( a \) S \( v \) wide \( a in H \, med v in E \) $

 for a field isomorphism $sigma : H arrow.r C$. The map $sigma$ is unique,
   and $S$ is unique up to multiplication by an element of $C^times$.]
] <prop:projective-lift>

#proof[
  The inverse also maps lines onto lines: a target line is the image of the line joining the preimages of any two
    distinct points on it. Projective spans are obtained by repeatedly joining pairs of points by lines,
    so $psi$ and its inverse preserve spans. Minimal spanning sets therefore correspond, and $dim_H E = dim_C E' =
    N + 1$ for some $N gt.eq 2$. Choose a basis $e_0 \, dots.h \, e_N$ of $E$ and representatives $e'_0 \,
    dots.h \, e'_N$ of their images. They form a basis of $E'$.
    Keeping $e'_0$ fixed, scale each $e'_i$, $i gt.eq 1$, so that
  $ psi \( \[ e_0 + e_i \] \) = \[ e'_0 + e'_i \] . $
  This is possible because $\[ e_0 + e_i \]$ lies on the line joining $\[ e_0 \]$ to $\[ e_i \]$ and differs from
    both endpoints.
  The hyperplanes spanned by $e_1 \, dots.h \, e_N$ and by $e'_1 \, dots.h \, e'_N$ correspond.
    On their affine complements use the coordinates
  $ \( t_1 \, dots.h \, t_N \) arrow.l.r \[ e_0 + t_1 e_1 + dots.h.c + t_N e_N \] . $
  The induced affine bijection preserves parallelism: parallel lines have the same point on the corresponding
    hyperplane at infinity. On the $i$th coordinate axis it is a bijection $sigma_i : H arrow.r
    C$ fixing $0$ and $1$. Varying only the $j$th input coordinate moves along a line with point at infinity
    $\[ e_j \]$, whose image has point at infinity $\[ e'_j \]$. Hence all other output coordinates are unchanged.
    It follows that the affine map is
  $ \( t_1 \, dots.h \, t_N \) mapsto \( sigma_1 \( t_1 \) \, dots.h \, sigma_N \( t_N \) \) . $
  In each plane of two coordinate axes, the diagonal through $\( 0 \, 0 \)$ and $\( 1 \, 1 \)$ maps to the
    corresponding diagonal. Thus all $sigma_i$ equal one bijection $sigma : H arrow.r C$.
    In the first two coordinates, the line $\( t \, t + a \)$ is parallel to this diagonal and passes through
    $\( 0 \, a \)$. Its image therefore gives
  $ sigma \( t + a \) = sigma \( t \) + sigma \( a \) . $
  The line $\( t \, a t \)$ passes through $\( 0 \, 0 \)$ and $\( 1 \, a \)$, so its image gives
  $ sigma \( a t \) = sigma \( a \) sigma \( t \) . $
  Since $sigma \( 1 \) = 1$, it is a field isomorphism.
  Define $S \( sum_(i = 0)^N t_i e_i \) = sum_(i = 0)^N sigma \( t_i \) e'_i$.
    This is an additive, $sigma$-semilinear bijection inducing $psi$ on the affine chart.
    Every point at infinity is the direction of an affine line through the origin, so it induces $psi$ there as well.
  For uniqueness, suppose that $T$ is another semilinear lift, possibly with a different field isomorphism.
    For every nonzero $v in E$ write $T \( v \) = c_v S \( v \)$ with $c_v in C^times$.
    If $v \, w$ are independent, additivity applied to $v + w$ and independence of $S \( v \) \,
    S \( w \)$ give $c_v = c_w = c_(v + w)$. Two dependent nonzero vectors can each be compared to a vector
    outside their common line. Thus $c_v$ is a single scalar $c$, and $T = c S$.
    Comparing the images of $a v$ then shows that the two field isomorphisms also agree. ◻
]

We will also recover the prescribed algebraically closed base directly from the field.

#thm([Lemma 5.2.])[
  #emph[If $F \/ kappa$ is a finitely generated extension of an algebraically closed field of characteristic $p$, then
$ ⋂_(m gt.eq 1) F^(p^m) = kappa . $

]
] <lem:perfect-core>

#proof[
  Perfectness gives the inclusion from right to left. If $f in F \\ kappa$,
    algebraic closedness makes $f$ transcendental over $kappa$.
    Complete $f$ to a transcendence basis $f \, t_2 \, dots.h \, t_d$, and put $B =
    kappa \( t_2 \, dots.h \, t_d \)$ and $E = B \( f \)$. The extension $F \/ E$ is finite;
    write $D = \[ F : E \]$. For every $m gt.eq 1$, the polynomial $T^(p^m) -
    f$ is Eisenstein at the prime $f$ of $B \[ f \]$, and is therefore irreducible over $E$.
    If $f = g^(p^m)$ with $g in F$, it follows that
  $ p^m = \[ E \( g \) : E \] lt.eq D . $
  This fails for all sufficiently large $m$, so $f$ does not belong to the intersection. ◻
]

#proof[
  A field isomorphism $alpha : K arrow.r L$ sends $K^p$ to $L^p$ and Steinberg pairs to Steinberg pairs.
    It therefore induces an element of $"Isom"_(upright(M)) \( V_K \, V_L \)$,
    and the canonical map in the theorem is well defined.
  For surjectivity, take $Theta in "Isom"_(upright(M)) \( V_K \, V_L \)$.
    Proposition 8 gives $n in upright(bold(F))_p^times$ such that $Psi = n Theta$ maps lines onto lines.
    Put $H = K^p$ and $C = L^p$. By Lemma 2, $dim_H K$ and $dim_C L$ are at least $p^2 gt.eq 4$,
    so Proposition 9 gives a semilinear lift $S : K arrow.r L$.
    Since $Psi \( \[ 1 \] \) = \[ 1 \]$, scale $S$ to arrange $S \( 1 \) = 1$.
    For each $f in K^times$, the two semilinear bijections
  $ w mapsto S \( f w \) \, wide w mapsto S \( f \) S \( w \) $
  induce the same projective map: the equality is precisely $Psi \( \[ f w \] \) = Psi \( \[ f \] \) +
    Psi \( \[ w \] \)$ in the additive notation for $V_L$. Their values at $1$ agree,
    so the uniqueness assertion in Proposition 9 makes them equal.
    Thus $S$ is multiplicative, and hence a field isomorphism.
    It maps every $K^(p^m)$ onto $L^(p^m)$, so Lemma 10 gives $S \( k \) = l$.
    Its induced map is $n Theta$, proving surjectivity onto the scalar quotient.
  For injectivity, suppose that field isomorphisms $alpha \, beta : K arrow.r L$ induce maps with $beta_(*) =
    r alpha_(*)$ for $r in upright(bold(F))_p^times$. Both preserve projective lines,
    so multiplication by $r$ on $V_L$ also preserves lines. Lemma 7 gives $r = 1$.
    The maps $alpha$ and $beta$ are therefore semilinear lifts of the same projective bijection.
    Proposition 9 makes them scalar multiples, and $alpha \( 1 \) = beta \( 1 \) = 1$ makes them equal. ◻
]

#prodef([Remark 5.3.])[
  (Frobenius and the target quotient).  There is no further Frobenius ambiguity.
    For a field $F \/ kappa$ as in the theorem, the Frobenius map $F arrow.r F$, $f mapsto f^p$,
    is not surjective and induces the zero map on $V_F$. By contrast, $F arrow.r F^p$ is a field isomorphism,
    whose induced isomorphism has target
  $ V_(F^p) = \( F^p \)^times \/ \( F^(p^2) \)^times . $
  It is already covered by the theorem, with its actual target field $F^p$.
]

#bibliography("refs.bib", style: "ieee", title: [References])
