#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Lifting sections from the reduced support \
of an adjoint]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <bl:sec:introduction>

A nonzero section of an adjoint divisor gives an effective representative; abundance requires enough sections to define a morphism. Adjunction suggests looking first on the support of the zero divisor, where a multiple may already be generated. We prove that, when this support lies in the coefficient-one boundary, generation on the entire reduced support forces positive ambient Iitaka dimension.

#thm([Theorem 1.1.])[
  (Supported boundary lifting).  #emph[Let $\( V \, C \)$ be a normal projective $bb(Q)$-factorial dlt pair over an algebraically closed field of characteristic zero, with $C$ an effective rational boundary, and put $A = K_V + C$. Suppose that 
$ 0 eq.not G gt.eq 0 \, #h(2em) G tilde.op q A \, #h(2em) "Supp" G subset.eq "Supp" floor.l C floor.r \, $

 where $G$ is Cartier and $q > 0$ is a sufficiently divisible integer. If $cal(O)_V \( G \) \|_(G_(upright("red")))$ is semiample, then $kappa \( V \, A \) > 0$.]
] <bl:thm:supported>

The restriction is a line bundle on the whole reduced scheme $S = G_(upright("red"))$. Sections on its separate components must agree along their intersections. The support inclusion may be strict: in $C = S + H + C_0$, the extra coefficient-one divisor $H$ may meet $S$ and any of its strata, while $C_0$ has coefficients less than one. No additional nefness hypothesis is needed. Curves in $S$ have nonnegative $G$-degree by semiampleness, and curves outside $S$ have nonnegative degree by effectivity. The rational coefficients of $C$ may be arbitrary in $\[ 0 \, 1 \]$.

The first application separates abundance from the task of obtaining a first section.

#thm([Theorem 1.2.])[
  (Abundance after nonvanishing).  #emph[Let $\( X \, Delta \)$ be a projective log canonical pair of dimension at most four over $bb(C)$, with effective rational boundary. If $D = K_X + Delta$ is $bb(Q)$-Cartier and nef and $kappa \( X \, D \) gt.eq 0$, then $D$ is semiample. If $kappa \( X \, D \) = 0$, then $D tilde.op_(bb(Q)) 0$.]
] <thm:abundance-after-nonvanishing>

The proof uses lower-dimensional abundance and ordinary minimal models for effective log canonical pairs. Theorem 2 is independent of the existence of a first section in dimension four. It applies to arbitrary rational boundary coefficients and supplies a qualitative generated Cartier multiple, with no uniform index. Section 7 transfers the same conclusion to every algebraically closed field of characteristic zero.

The same supported argument gives a reduction in all dimensions.

#thm([Theorem 1.3.])[
  (Reduction to smooth canonical nonvanishing).  #emph[Assume that every smooth connected projective complex variety $W$ with pseudo-effective $K_W$, in every dimension, has a nonzero section of $m K_W$ for some $m > 0$. Let $\( X \, Delta \)$ be a normal projective log canonical pair over an algebraically closed field of characteristic zero, with $Delta$ an effective rational boundary and $D = K_X + Delta$ a nef $bb(Q)$-Cartier divisor. Then $D$ is semiample.]
] <bl:thm:conditional>

The premise concerns pseudo-effective canonical divisors and includes those that are not nef. Hashizume’s reduction supplies nonvanishing and ordinary log minimal models under this premise; it does not supply the semiampleness proved here.

A separate companion provides the first section needed in dimension four.

#thm([Corollary 1.4.])[
  (Fourfold log abundance).  #emph[Let $\( X \, Delta \)$ be a normal projective log canonical pair of dimension at most four over an algebraically closed field of characteristic zero. If $Delta$ is an effective rational boundary and $D = K_X + Delta$ is $bb(Q)$-Cartier and nef, then $D$ is semiample. If $kappa \( X \, D \) = 0$, then $D tilde.op_(bb(Q)) 0$.]
] <thm:full-abundance>

This resolves rational log abundance positively in the stated range, using Theorem 2 and the nonvanishing result in OpenAI, #emph[Fourfold nonvanishing by minimal metrics and moving jets] (September 27, 2026), Corollary 1.2 [27]. The proof of the supported theorem and of abundance after nonvanishing uses no result from that companion.

=== Boundary deformation and extension <boundary-deformation-and-extension>

The relation between boundary geometry and ambient sections already appears in dimension three. Kawamata’s alternative proof of Miyaoka’s numerical-dimension-one theorem constructs compatible infinitesimal boundary deformations using finite covers and Hodge theory, and then produces a moving family [16] Section 4. The question of how infinitesimal boundary data yield ambient positivity also motivates the lifting problem considered here.

Log abundance through dimension three rests on the surface and threefold theorems, including the corrected Keel–Matsuki–McKernan argument [17,18,11] and semi-log-canonical gluing [10]. Liu–Xu proved abundance after nonvanishing through dimension five under the additional numerical-dimension bound $nu lt.eq 1$, together with a corresponding conditional reduction from smooth canonical nonvanishing in dimension $d - 1$ and in numerical dimension one in dimension $d$ [25] Theorems 5.1 and 5.4. Theorem 2 removes that numerical-dimension bound in dimension at most four; the lifting theorem itself holds in every dimension.

On the analytic side, Demailly–Hacon–Păun proved extension for plt pairs without requiring an ample boundary part and explained its connection with nonvanishing and good minimal models [8] Theorem 1.7 and Corollary 1.8. Their nef plt corollary gives restriction surjectivity in the presence of a suitable effective supported representative. Chan–Choi subsequently removed one support-containment restriction in the log-smooth plt setting [6] Theorem 1.6.1. Theorem 1 starts with semiampleness on an entire reducible support and allows additional coefficient-one components to meet it. Compatibility at those intersections, and obstructions concentrated on smaller strata, are central to its proof.

The passage to abundance also needs distinct results about gluing and minimal models. Birkar’s effective log minimal model results provide the birational models used in the induction [3,4]. Fujino–Gongyo show that semiampleness on the normalization of a semi-log-canonical pair, with its conductor boundary, descends to the original pair [12] Theorem 4.3. Their nef log-abundance theorem requires abundance on the ambient variety and on the normalizations of all log canonical centers [12] Theorem 4.2. Both requirements enter the proof of Theorem 2.

=== The obstruction on a finite neighborhood <the-obstruction-on-a-finite-neighborhood>

After replacing $G$ by a multiple, its generated restriction gives $f : S arrow.r bb(P)^ell$ with $cal(O)_V \( G \) \|_S tilde.eq f^(*) cal(O) \( 1 \)$. We want to extend functions and sections through successive infinitesimal neighborhoods of $S$. There is an immediate difficulty: $f$ itself need not extend to any neighborhood. The proof must therefore measure the lifting obstruction using only the morphism on the reduced boundary.

Pass to the bundle of nonzero frames of $cal(O)_V \( G \)$, where the pulled-back line bundle has a tautological trivialization. Scalar multiplication of a frame gives an action of $bb(G)_m$. A function or form has weight $a$ if this action multiplies it by the character $lambda^a$. Two cyclic-cover constructions, retaining all components of each normalized cover, produce a reduced Cartier divisor $E = \( y = 0 \)$. After an equivariant resolution there is a logarithmic top form $sigma$ whose residue along the reduced resolved boundary has positive weight. Poles over the extra boundary $H$ remain present, including above its intersections with $S$.

Locally, the finite neighborhoods are defined by $\( y^k \)$. At the first stage where a lift from $y^k = 0$ to $y^(k + 1) = 0$ is not yet known, differences of local lifts are multiples of $y^k$. Their coefficients form a cohomology class on $E$: this is the obstruction. Because products of two such errors vanish at that order, the connecting map on functions satisfies the Leibniz rule. Thus the obstruction is a derivation. A suitable character part of the residue map embeds its cohomology group into the cohomology of logarithmic residues.

The identity $cal(O)_V \( G \) \|_S = f^(*) cal(O) \( 1 \)$ lifts $f$ to a map between the bundles of nonzero frames. On a chart trivializing $cal(O) \( 1 \)$, the target of this lifted map has projective-base coordinates and an invertible frame scalar. Changing the base coordinates gives a horizontal direction; rescaling that scalar gives the vertical direction. The proof first eliminates the horizontal part of the obstruction, then uses the nonzero weight of the frame action to eliminate the vertical part. This distinction explains why positivity of the residue weight is useful.

To retain classes supported on singular fibers or smaller strata, the residue comparison is made in a filtered direct image of a Hodge module on the graph of the boundary morphism. Its lowest filtration term is the whole coherent residue cohomology sheaf. Its first symbol records the effect of differentiating in coordinates on the target of the lifted map. Saito’s strictness and Kodaira–Saito vanishing provide the required control of these filtered objects [30,31,28]; restricting to the smooth locus of a variation of Hodge structure would discard some of the obstructions we need to test.

A local calculation on the graph expresses the derivation and this first symbol in a single residue identity. The symbol has positive frame weight. If its horizontal part were nonzero, a finite cover transverse to that part, together with the adjugate of its differential, would produce a nonzero map from an ample line bundle into the kernel of the first symbol. Kodaira–Saito vanishing excludes that map. The remaining vertical term is the actual Euler derivative of frame scaling. The residue identity now says that a nonzero scalar, determined by its weight, times the vertical obstruction is zero. Hence that obstruction vanishes as well. Applying the same identity to arbitrary boundary functions removes the complete obstruction. This proves lifting at every finite order.

Taking finite-cover invariants and the degree-zero part of the frame action descends the lifted layers to divisorial sheaves on $V$. These layers recur with positive twists of $cal(O)_(bb(P)^ell) \( 1 \)$. Their accumulated sections grow while higher cohomology stays bounded; the loss in passing from a finite neighborhood to ambient sections is bounded by a fixed cohomology group. Hence the section spaces of multiples of $G$ are unbounded, proving positive Iitaka dimension. If the boundary morphism has zero-dimensional image, the growing number of layers supplies this increase. The argument uses finite filtrations and does not require convergence of a formal neighborhood.

=== From lifting to abundance and other boundary methods <from-lifting-to-abundance-and-other-boundary-methods>

For Theorem 2, lower-dimensional abundance and conductor gluing generate the adjoint on the whole reduced floor. Theorem 1 then excludes a nonzero effective representative in the case $kappa = 0$. For positive Iitaka dimension, effective minimal models handle the generally non-nef adjoints on the Iitaka fibers. Numerical triviality there gives abundance, including on log canonical centers, and the preceding semiampleness and descent results apply.

The complex lifting argument also works under a weaker formulation: the canonical and boundary divisors are individually $bb(Q)$-Cartier, the pair is log canonical, and it is klt off the reduced floor. This formulation permits transfer to other algebraically closed fields of characteristic zero. One descends finitely many defining data to a countable algebraically closed field embeddable in $bb(C)$ and transfers sections and generation by base change of the original line bundle and its evaluation map. No preservation of $bb(Q)$-factoriality under that descent is needed.

A further method illuminates the boundary obstruction with different hypotheses. A complete conormal–period argument proves that a smooth projective complex fourfold with $K_X$ nef and $kappa \( K_X \) = 0$ cannot have $nu \( K_X \) = 2$, without an Euler-characteristic hypothesis. Its period equation and trace tests at exceptional parameters kill successive obstructions; a quadratic count of invariant layers then forces growth. This method is not needed for Theorem 1.

=== Reading the proof <reading-the-proof>

Section 2 constructs the two covers and a split residue insertion. Section 3 identifies the lowest filtered piece and proves the symbol-kernel vanishing. Section 4 separates horizontal symbols from the actual Euler action, and Section 5 uses these two conclusions to lift and count all finite layers. Section 6 proves the abundance implications over $bb(C)$; Section 7 returns the resulting sections and generated multiples to the original field. The independent curve-base method is developed in Section 8.

=== Conventions and the complex formulation <conventions-and-the-complex-formulation>

All boundaries are effective with rational coefficients in $\[ 0 \, 1 \]$. An adjoint is an actual $bb(Q)$-Cartier divisor, and $tilde.op_(bb(Q))$ denotes rational linear equivalence. A rational Cartier divisor is semiample if a positive Cartier multiple is generated by global sections; its Iitaka dimension is the dimension of the images of all sufficiently divisible nonempty complete systems, with value $- oo$ if no such system exists. For a nef divisor $D$ on a projective $d$-fold,

$ nu \( D \) = max { j : D^j H^(d - j) > 0 } $

for an ample divisor $H$; these intersections may be computed on a smooth resolution. We use log discrepancies, so coefficient-one divisors have log discrepancy zero. Standard conventions for lc, klt, dlt and dlt adjunction follow [19].

The complex proof uses only individual Cartier witnesses, rather than preservation of $bb(Q)$-factoriality under a field extension.

#thm([Proposition 1.5.])[
  (Complex supported assertion).  #emph[Let $V$ be normal and projective over $bb(C)$, and let $C$ be an effective rational boundary. Suppose that $K_V$ and every component of $C$ are individually $bb(Q)$-Cartier, that $\( V \, C \)$ is lc, and that it is klt outside $"Supp" floor.l C floor.r$. If a nonzero effective Cartier divisor $G tilde.op q \( K_V + C \)$ has support in $"Supp" floor.l C floor.r$, for a sufficiently divisible positive integer $q$, and $cal(O)_V \( G \) \|_(G_(upright("red")))$ is semiample on the whole reduced scheme, then $kappa \( V \, K_V + C \) > 0$.]
] <bl:prop:complex-supported>

This proposition is proved in Sections 2–5. Its hypotheses follow from those of Theorem 1 over $bb(C)$, and its individual Cartier requirements are the finite witnesses used in the final field transfer.

== 2 Moving frames, cyclic covers, and residues <bl:cov:section>

The first step in Proposition 5 is to embed the entire lifting obstruction into logarithmic residue cohomology. Moving to a frame bundle supplies compatible roots without choosing roots separately on open sets. The complete cyclic covers retain the character summand needed for an injective residue map, including the poles along the extra coefficient-one boundary.

Work over $bb(C)$, and put $A = K_V + C$ and $S = G_(upright("red"))$. Replace $\( q \, G \)$ by $\( b q \, b G \)$, for a sufficiently divisible positive integer $b$, so that semiampleness on the entire reduced scheme $S$ gives fixed identifications

#[#set math.equation(numbering: n => "(2.1)")
 $ L = cal(O)_V \( G \) tilde.eq cal(O)_V \( q A \) \, #h(2em) L \|_S tilde.eq f^(*) J \, #h(2em) f : S arrow.r T = bb(P)^ell \, quad J = cal(O)_T \( 1 \) . $ <bl:cov:initial-data>]

Indeed, a globally generated power of the original restriction defines $f$ by its complete linear system; surjectivity onto $T$ is unnecessary. Further powers preserve this property. We also clear all Cartier indices and boundary denominators that occur below. Let $s in H^0 \( V \, L \)$ be the section with divisor $G$, and write

$ G = sum_i d_i S_i \, #h(2em) S = sum_i S_i \, #h(2em) C = S + H + C_0 . $

Here $d_i > 0$, $H$ is the reduced sum of the remaining coefficient-one components, and $C_0$ has coefficients in $\[ 0 \, 1 \)$ and shares no component with $S + H$. Choose $r$ divisible by $q$ and all $d_i$, and put $a = r \/ q$. The singularity properties used in this section, and in the remainder of the supported-pair argument, are log canonicity and klt singularities away from $S + H$. A dlt pair has both properties. Apart from normality, the Cartier hypotheses used are that $K_V$ and the indicated boundary components are $bb(Q)$-Cartier, together with the actual identifications in (2.1).

=== 2.1 The moving frame and the first cover <the-moving-frame-and-the-first-cover>

Let $p : P = L^times arrow.r V$ and $B = J^times arrow.r T$ denote the bundles of nonzero vectors. The tautological frame $w$ trivializes $p^(*) L$ on $P$. For $lambda in bb(G)_m$, let $lambda$ multiply the vectors in both bundles by $lambda^r$. All weights below are pullback weights: a tensor $u$ has weight $m$ if $lambda^(*) u = lambda^m u$. In particular $w$ has weight $r$. The fixed restriction isomorphism gives

$ S_P := p^(- 1) \( S \) = S times_T B arrow.r B \, $

an equivariant projective morphism.

There is an invariant canonical comparison $omega_P tilde.eq p^(*) omega_V$, understood reflexively on the normal spaces. On a bundle chart with nonzero fiber coordinate $t$, it sends a top form $eta$ on $V$ to $p^(*) eta and d t \/ t$. Replacing $t$ by $u t$, with $u$ invertible on the base, adds $d u \/ u$ to $d t \/ t$; its wedge with $eta$ vanishes. Thus the comparison glues and is invariant under scaling. The same construction applies to divisible adjoint powers. Moreover, the pullback pair $\( P \, p^(*) C \)$ is lc and is klt off $S_P + p^(*) H$: locally a log resolution is the product of a log resolution on $V$ with $bb(G)_m$, with the same discrepancy coefficients.

The ratio $u = p^(*) s \/ w$ is a regular function on $P$. Form the whole finite algebra $cal(O)_P \[ y \] \/ \( y^r - u \)$ and let

#[#set math.equation(numbering: n => "(2.2)")
 $ pi : Z arrow.r P $ <bl:cov:first-cover>]

be its normalization. This is the cyclic-cover construction of [9] Section 3.5, applied to the trivial line bundle; we retain its full-algebra convention. Throughout, normalization of a generically reduced algebra means normalization in its full total ring of fractions. Thus $Z$ is a disjoint union of normal varieties if the generic algebra splits; no component is discarded. The polynomial is separable over every generic field, and normalization is finite since the schemes are of finite type over $bb(C)$. The function $y$ remains regular, and the action lifts by

$ lambda^(*) y = lambda^(- 1) y . $

It commutes with the deck action $y mapsto zeta y$, $zeta in mu_r$.

#thm([Lemma 2.1.])[
  #emph[The divisor $E = \( y = 0 \)$ on $Z$ is reduced and Cartier, with ideal $I = \( y \) = cal(O)_Z \( - E \)$. Put $H_Z = pi^(*) p^(*) H$ and $C_(0 \, Z) = pi^(*) p^(*) C_0$. With compatible canonical divisors one has 
#[#set math.equation(numbering: n => "(2.3)")
 $ K_Z + E + H_Z + C_(0 \, Z) = pi^(*) \( K_P + p^(*) C \) . $ <bl:cov:crepant>]

 The pair $\( Z \, E + H_Z + C_(0 \, Z) \)$ is lc and is klt off $E + H_Z$. The map $E arrow.r S_P$ induces an equivariant projective morphism $g : E arrow.r B$.]
] <bl:cov:reduced-cover>

#proof[
  At the generic point of $p^(- 1) \( S_i \)$, write $u = v x^(d_i)$ in the corresponding discrete valuation ring, with $v$ a unit. After an unramified extension extracting a root of $v$, the normalized Kummer algebra has ramification index $e_i = r \/ d_i$ on each branch, since $d_i$ divides $r$. Consequently
  $ "ord"_F \( y \) = e_i d_i \/ r = 1 $
  at every prime $F$ lying over this divisor. These are all the zero divisors of $y$. On every normal component of $Z$, the nonzero function $y$ is a nonzerodivisor and its principal ideal is radical. For the latter assertion, if $v^N in \( y \)$, the height-one valuation inequalities give $"ord"_F \( v \) gt.eq "ord"_F \( y \)$ at every prime; normality then implies $v \/ y in cal(O)_Z$. This also proves that $E$ is reduced as a scheme.
  Off $S_P$ the first root algebra is finite étale. At a prime above $S_P$ the canonical ramification coefficient is $e_i - 1$, whereas the pullback coefficient of $S_P$ is $e_i$. This proves (2.3) in codimension one, and hence as an identity of $bb(Q)$-Cartier divisors. In particular $H_Z$ is reduced and the coefficients of $C_(0 \, Z)$ are those of $C_0$.
  We record why this calculation controls all divisorial valuations, including exceptional ones. For a finite dominant map of normal varieties $X' arrow.r X$ in characteristic zero and a comparison $K_(X') + Delta' = phi.alt^(*) \( K_X + Delta \)$, let $v'$ be a normalized divisorial valuation upstairs. Its restriction is $e v$ for a normalized divisorial valuation $v$ downstairs: the residue extension is finite, so its transcendence degree is still $dim X - 1$. Choose a model of $X$ on which $v$ is a divisor and normalize it in the upstairs function field. At the resulting discrete valuation rings the different has order $e - 1$ (the extension is tame). Comparing the canonical coefficients on these models yields
  #[#set math.equation(numbering: n => "(2.4)")
   $ A_(X' \, Delta') \( v' \) = e A_(X \, Delta) \( v \) \, $ <bl:cov:finite-discrepancy>]
  where $A$ denotes log discrepancy. The same argument applies to each field factor of a disconnected cover. Applied to (2.3), it gives lc singularities everywhere and klt singularities over $P \\ \( S_P + p^(*) H \)$. Finally, the reduced scheme $E$ maps into $S_P$ because its image is supported there. The resulting map is finite, so its composite with $S_P arrow.r B$ is projective. ◻
]

=== 2.2 The root of the adjoint tensor <the-root-of-the-adjoint-tensor>

The nowhere-vanishing frame $w$, the fixed isomorphism in (2.1), and the canonical comparison produce a meromorphic $q$-canonical tensor on $P$. As an adjoint section it has no zeros, so its divisor as a meromorphic tensor is $- q p^(*) C$. Its differential pullback to $Z$ is a tensor $tau$, nonzero on every component, satisfying

#[#set math.equation(numbering: n => "(2.5)")
 $ "Div" \( tau \) = - q Delta_Z \, #h(2em) Delta_Z = E + H_Z + C_(0 \, Z) \, #h(2em) "wt" \( tau \) = r . $ <bl:cov:tau>]

The canonical ramification formula used in (2.3) proves this equality, including its integral coefficients. Thus the construction depends on the given rational linear equivalence, not merely on a numerical equivalence.

Let $nu : tilde(Z) arrow.r Z$ be the full normalized $q$-th root of $tau$. Explicitly, for a meromorphic canonical frame $theta$ on a component with function field $K$, normalize in the finite reduced $K$-algebra

#[#set math.equation(numbering: n => "(2.6)")
 $ K \[ c \] \/ #scale(x: 120%, y: 120%)[\(] c^q - tau \/ theta^(⊗ q) #scale(x: 120%, y: 120%)[\)] . $ <bl:cov:second-algebra>]

Changing $theta$ to $v theta$ changes $c$ to $c \/ v$, so the algebras and the tautological form $c theta$ glue. Pullbacks of forms in this description are differential pullbacks. The deck group $mu_q$ acts by $c mapsto zeta c$, and the tautological form has its character $chi \( zeta \) = zeta$. Even if the algebra splits, its invariant subalgebra is exactly $K$: the basis $1 \, c \, dots.h \, c^(q - 1)$ has all the distinct characters. This observation will be needed for descent of ratios of forms.

The $bb(G)_m$-action also lifts algebraically. If on a meromorphic chart $lambda^(*) theta = j_lambda theta$, using differentials relative to the parameter $lambda$, prescribe

#[#set math.equation(numbering: n => "(2.7)")
 $ lambda^(*) c = lambda^a j_lambda^(- 1) c . $ <bl:cov:second-action>]

This respects the equation because $a q = r$ and $lambda^(*) tau = lambda^r tau$; the factors $j_lambda$ satisfy the cocycle identity. These formulas define the action on the generic algebra and on its integral closure. More explicitly, normalization commutes with the smooth base extension by $bb(G)_m$, and the isomorphism between the two pullback algebras over $bb(G)_m times Z$ therefore induces an isomorphism of their normalizations. This gives a regular action, not just a separate lift of each scalar automorphism. It commutes with $mu_q$, and the tautological form has weight $a$.

Take a projective $\( bb(G)_m times mu_q \)$-equivariant log resolution of $tilde(Z)$ and the inverse images of the boundary supports, and write its composite with $nu$ as

$ rho : Y arrow.r Z . $

Functorial resolution and principalization in characteristic zero give this resolution by invariant centers and projective blowups [2] Theorem 1.1, [38] Theorem 1.0.1. Indeed, functoriality for the smooth action and projection morphisms $\( bb(G)_m times mu_q \) times tilde(Z) arrow.r tilde(Z)$ lifts the action and its group identities at every step. We use the pulled-back tautological top form $sigma$ on $Y$; it has deck character $chi$ and weight $a$. We may choose $Y$ smooth and quasi-projective with a $bb(G)_m$-linearized ample line bundle. To see the latter point, compactify $P$ as $bb(P)_V \( cal(O)_V xor L \)$, with its scaling action. A sufficiently positive twist of the tautological bundle by an ample bundle from $V$ is ample and linearized. Restrict to $P$ and pull back through the finite covers, which preserves ampleness and linearization. For every invariant blowup center its ideal, and hence the tautological relatively ample bundle on the blowup, is linearized. Tensoring these with sufficiently high powers of the preceding ample bundles at successive steps gives the assertion for $Y$.

Define effective divisors on $Y$ by

#[#set math.equation(numbering: n => "(2.8)")
 $ hat(E) = rho^(*) E \, #h(2em) D_h = \( "Supp" rho^(*) H_Z \)_(upright("red")) \, #h(2em) R = sum_(F upright(" prime in ") "Supp" hat(E)\
F subset.not D_h) F . $ <bl:cov:resolved-boundary>]

The union $R + D_h$ is reduced simple normal crossing. Both $R$ and $hat(E)$ map scheme-theoretically to $E$: the function $y$ vanishes on them. Write $q_R : R arrow.r E$ and $q_(hat(E)) : hat(E) arrow.r E$ for these projective maps, and set $h = g compose q_R : R arrow.r B$.

The spaces and morphisms are summarized in Figure 1. The form $sigma$ lives on $Y$; its residue will live on $R$ and will be pushed through the top row to $B$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$R$])
  content((2.057, 0), [$E$])
  content((4.247, 0), [$S_P$])
  content((6.436, 0), [$B$])
  content((0, -1.585), [$Y$])
  content((2.057, -1.585), [$Z$])
  content((4.247, -1.585), [$P$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  content((1.029, 0.2266), [#text(size: 0.73em)[$q_R$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((0, -0.2725), (0.3, -0.2725))
  line((2.393, 0), (3.779, 0), mark: (end: ">"))
  line((2.057, -0.2725), (2.057, -1.313), mark: (end: ">"))
  line((2.057, -0.2725), (2.357, -0.2725))
  line((4.715, 0), (6.1, 0), mark: (end: ">"))
  line((4.247, -0.2725), (4.247, -1.313), mark: (end: ">"))
  line((4.247, -0.2725), (4.547, -0.2725))
  line((0.336, -1.585), (1.721, -1.585), mark: (end: ">"))
  content((1.029, -1.812), [#text(size: 0.73em)[$rho$]])
  line((2.393, -1.585), (3.911, -1.585), mark: (end: ">"))
  content((3.152, -1.812), [#text(size: 0.73em)[$pi$]])
})],
  caption: [Figure 1: The reduced boundary maps to $B$ through the top row, whose composite is $h$. The lower row contains the first normalized root cover $pi$ and the second normalized cover followed by resolution, combined in $rho$. Only the boundary is equipped with a map to $B$. ],
) <fig:boundary-covers>

#thm([Lemma 2.2.])[
  #emph[The tautological form and its residue satisfy 
#[#set math.equation(numbering: n => "(2.9)")
 $ sigma in H^0 #scale(x: 120%, y: 120%)[\(] Y \, omega_Y \( R + D_h \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) Omega = "res"_R \( sigma \) in H^0 #scale(x: 120%, y: 120%)[\(] R \, omega_R \( D_h \) #scale(x: 120%, y: 120%)[\)] . $ <bl:cov:residue-form>]

 Here $omega_R$ is the absolute dualizing sheaf of the reduced simple-normal-crossing divisor $R$. Both forms have weight $a$ and deck character $chi$.]
] <bl:cov:poles>

#proof[
  Let $F$ be any prime divisor on $Y$, and restrict its valuation to a function-field component of $Z$, obtaining $e v$. On a downstairs model carrying $v$, (2.5) gives order $q \( A_(Z \, Delta_Z) \( v \) - 1 \)$ for $tau$. Differential pullback adds $q \( e - 1 \)$ to $e$ times this order. Since $sigma^(⊗ q) = rho^(*) tau$,
  #[#set math.equation(numbering: n => "(2.10)")
   $ "ord"_F \( sigma \) + 1 = e A_(Z \, Delta_Z) \( v \) . $ <bl:cov:sigma-order>]
  Log canonicity makes the right side nonnegative. If the center lies outside $E + H_Z$, it is strictly positive by the klt property. The order on the left is integral, so $sigma$ has at most a simple pole, and every pole is over $E + H_Z$. Because $E$ and $H_Z$ are effective $bb(Q)$-Cartier divisors, a prime whose center lies in this union occurs in the support of their pullback. That reduced support is exactly $R + D_h$. This proves the first assertion. Adjunction for the effective Cartier divisor $R$ on the smooth variety $Y$ gives the residue sequence
  #[#set math.equation(numbering: n => "(2.11)")
   $ 0 arrow.r omega_Y \( D_h \) arrow.r omega_Y \( R + D_h \) arrow.r omega_R \( D_h \) arrow.r 0 . $ <bl:cov:residue-sequence>]
  It gives $Omega$ and is equivariant, so residue preserves the stated weight and character. ◻
]

The definition of $D_h$ is essential here. An exceptional divisor over $E ∩ H_Z$ belongs to $D_h$ and is omitted from $R$, but its possible simple pole is still allowed in (2.9). No disjointness condition on $H$ and the strata of $S$ has been used.

=== 2.3 The residue summand <the-residue-summand>

#thm([Lemma 2.3.])[
  (Residue injection).  #emph[Multiplication by $Omega$ after pullback induces a split morphism 
#[#set math.equation(numbering: n => "(2.12)")
 $ cal(O)_E arrow.r upright(bold(R)) \( q_R \)_(*) omega_R \( D_h \) $ <bl:cov:derived-split>]

 in the derived category of $cal(O)_E$-modules. Consequently, for every $i gt.eq 0$, it induces an injection 
#[#set math.equation(numbering: n => "(2.13)")
 $ R^i g_(*) cal(O)_E arrow.r.hook R^i h_(*) omega_R \( D_h \) \, #h(2em) e' mapsto Omega e' . $ <bl:cov:injections>]

 In particular this holds for $i = 1$. The map increases pullback weight by $a$.]
] <bl:lem:residue-injection>

#proof[
  #emph[The character summand.] We first identify the $chi$-eigensheaf:
  #[#set math.equation(numbering: n => "(2.14)")
   $ #scale(x: 120%, y: 120%)[\(] rho_(*) omega_Y \( D_h \) #scale(x: 120%, y: 120%)[\)]_chi = sigma dot.op cal(O)_Z \( - E \) . $ <bl:cov:eigensheaf>]
  A meromorphic $chi$-form divided by $sigma$ is deck-invariant, so it is the pullback of a meromorphic function $v$ on $Z$, by the invariant algebra calculation following (2.6). At a prime of $Z$ with coefficient $d$ in $Delta_Z$, and at a prime of the cover above its generic point, (2.10) becomes
  $ "ord"_F \( v sigma \) = e "ord" \( v \) + e \( 1 - d \) - 1 . $
  Over $E$ no pole is permitted in $omega_Y \( D_h \)$, so $d = 1$ forces $"ord" \( v \) gt.eq 1$. Over $H_Z$ a simple pole is permitted and forces $"ord" \( v \) gt.eq 0$. Elsewhere $0 lt.eq d < 1$, and the integer $e \( 1 - d \)$ lies between $1$ and $e$; hence holomorphy is equivalent to $"ord" \( v \) gt.eq 0$. These necessary inequalities, and normality, give $v in cal(O)_Z \( - E \)$. Conversely such a function pulls back to a regular function vanishing along $hat(E)$. Since $hat(E) gt.eq R$, it cancels every pole of $sigma$ outside $D_h$ on the whole resolution, including exceptional divisors. This proves (2.14).
  #emph[Vanishing and the thickened residue.] We next prove the required vanishing:
  #[#set math.equation(numbering: n => "(2.15)")
   $ R^j rho_(*) omega_Y \( D_h \) = 0 #h(2em) \( j > 0 \) . $ <bl:cov:vanishing>]
  Choose a rational $epsilon.alt > 0$ so small that every nonzero coefficient of $F = epsilon.alt rho^(*) H_Z$ lies strictly between $0$ and $1$. Then $D_h - F$ is an effective simple-normal-crossing boundary with all coefficients less than one, and
  $ \( K_Y + D_h \) - #scale(x: 120%, y: 120%)[\(] K_Y + \( D_h - F \) #scale(x: 120%, y: 120%)[\)] = F . $
  The divisor $F$ is $rho$-nef, being a pullback from $Z$, and $rho$-big: $rho$ is projective and generically finite on every component, and every divisor restricts to a big divisor on its zero-dimensional generic fiber. Relative Kawamata–Viehweg vanishing therefore applies to the Cartier divisor $K_Y + D_h$ and the klt boundary $D_h - F$; see [13] Theorem 3.3. If $H = 0$, take $F = D_h = 0$; the same relative bigness observation includes this case. This proves (2.15) without asserting any absolute nefness of an auxiliary adjoint.
  Since $E$ is Cartier, the projection formula gives the same vanishing for $omega_Y \( hat(E) + D_h \)$ and, by (2.14), identifies their derived eigensummands as
  #[#set math.equation(numbering: n => "(2.16)")
   $ #scale(x: 120%, y: 120%)[\(] upright(bold(R)) rho_(*) omega_Y \( D_h \) #scale(x: 120%, y: 120%)[\)]_chi & tilde.eq cal(O)_Z \( - E \) \,\
#scale(x: 120%, y: 120%)[\(] upright(bold(R)) rho_(*) omega_Y \( hat(E) + D_h \) #scale(x: 120%, y: 120%)[\)]_chi & tilde.eq cal(O)_Z . $ <bl:cov:two-derived-images>]
  Both are concentrated in degree zero; the isomorphisms are multiplication by $sigma$. The inclusion of the two sheaves on $Y$ corresponds to the ordinary ideal inclusion $cal(O)_Z \( - E \) arrow.r.hook cal(O)_Z$.
  For the possibly nonreduced effective Cartier divisor $hat(E)$, adjunction still gives
  $ omega_(hat(E)) \( D_h \) = omega_Y \( hat(E) + D_h \) \/ omega_Y \( D_h \) . $
  Taking the quotient in (2.16) shows that
  #[#set math.equation(numbering: n => "(2.17)")
   $ #scale(x: 120%, y: 120%)[\(] upright(bold(R)) \( q_(hat(E)) \)_(*) omega_(hat(E)) \( D_h \) #scale(x: 120%, y: 120%)[\)]_chi tilde.eq cal(O)_E $ <bl:cov:thick-summand>]
  in the derived category on $E$. Here this conclusion can be checked on cohomology sheaves after the exact faithful pushforward by the closed immersion $E arrow.r.hook Z$: the higher eigencohomology vanishes and the degree-zero map is the residue of multiplication by $sigma$. There is no need to assert full faithfulness of derived pushforward for that immersion.
  #emph[Retraction from the reduced residue.] We construct the splitting map on $E$ itself. Pullback of functions and multiplication by $Omega$ give
  $ alpha : cal(O)_E arrow.r upright(bold(R)) \( q_R \)_(*) omega_R \( D_h \) . $
  The inequality $R lt.eq hat(E)$ gives an inclusion of residue quotients on $Y$, hence a morphism
  $ beta : upright(bold(R)) \( q_R \)_(*) omega_R \( D_h \) arrow.r upright(bold(R)) \( q_(hat(E)) \)_(*) omega_(hat(E)) \( D_h \) . $
  These are $cal(O)_E$-linear: multiplication by the pulled-back equation $y$ kills both quotients. If a local function on $E$ is lifted to $v in cal(O)_Z$, the composite $beta alpha$ is represented by the class of $rho^(*) v thin sigma$ modulo $omega_Y \( D_h \)$. Changing $v$ by a multiple of $y$ does not change this class, since $y sigma in omega_Y \( D_h \)$ by $hat(E) gt.eq R$. Thus projection onto the $chi$-summand followed by (2.17) sends $beta alpha$ to the identity. The projection is available in the derived category because averaging over $mu_q$ gives the idempotent $q^(- 1) sum_(zeta in mu_q) chi \( zeta \)^(- 1) zeta^(*)$. This supplies a retraction of $alpha$ and proves (2.12). Finally apply $upright(bold(R)) g_(*)$ and take cohomology to obtain (2.13). The weight statement follows from $"wt" \( Omega \) = a$. ◻
]

=== 2.4 The obstruction to be detected <bl:cov:obstruction-contract>

Put $A_d = \| g \|_(*) \( cal(O)_Z \/ I^d \)$ for $d gt.eq 1$, pushing the underlying sheaves of complex vector spaces in the Zariski topology along $\| g \| : \| E \| arrow.r \| B \|$. This uses no morphism from a thickening to $B$. Fix $k gt.eq 1$ and suppose that $A_(d + 1) arrow.r A_d$ is surjective for $1 lt.eq d < k$. The current connecting map is $partial_k : A_k arrow.r R^1 g_(*) \( I^k \/ I^(k + 1) \)$. Section 5 will show that it factors, after framing $I^k \/ I^(k + 1)$ by $y^k$, through a derivation

$ delta_k : g_(*) cal(O)_E arrow.r R^1 g_(*) cal(O)_E \, #h(2em) partial_k \( tilde(F) \) = y^k delta_k \( F \) . $

Here $tilde(F) in A_k$ is any local lift of $F in g_(*) cal(O)_E$. The factorization and derivation rule will be proved there from the previous surjections. Since $y$ has weight $- 1$, this derivation has degree $k$ for the frame action.

Restrict $delta_k$ to pullbacks of functions on $B$. In local coordinates $t_i$, the residue injection produces a global section of $R^1 h_(*) omega_R \( D_h \) ⊗ T_B$, given by

$ v_k = sum_i Omega delta_k \( g^(*) t_i \) ⊗ partial_(t_i) \, #h(2em) "wt" \( v_k \) = a + k > 0 . $

The derivation rule makes this tensor independent of coordinates. The next two sections develop a differential-operator test for it. The graph identity that makes the test applicable, and that then annihilates $delta_k$ on all of $g_(*) cal(O)_E$, is proved with the induction in Section 5.

== 3 A filtered module on the boundary graph <bl:sec:hodge>

The tensor $v_k$ of Section 2.4 has coefficients in $R^1 h_(*) omega_R \( D_h \)$. We construct a filtered right $cal(D)_B$-module whose lowest piece is this entire coherent sheaf, so that differentiation in base coordinates gives a first symbol for the tensor. We then prove a vanishing statement for the kernel of that symbol on a projective base. Section 4 will apply it to the positive frame weight $a + k$.

Temporarily isolate the graph calculation from the covers. Let $Y$ be a smooth complex quasi-projective variety, let $R + D_h$ be a reduced simple normal crossing divisor with no common component between $R$ and $D_h$, and let $h : R arrow.r B$ be a projective morphism to a smooth quasi-projective variety. Write $b = dim B$, and let $Q subset Y times B$ be its graph. The projection is not required to be proper, but its restriction to $Q$ is projective:

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$R$])
  content((2.255, 0), [$Y times B$])
  content((2.255, -1.585), [$B .$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  line((0.336, 0), (0.336, 0.3))
  content((1.029, 0.2266), [#text(size: 0.73em)[$\( iota \, h \)$]])
  line((0.2249, -0.1581), (1.986, -1.396), mark: (end: ">"))
  content((0.9098, -1.056), [#text(size: 0.73em)[$h$]])
  line((2.255, -0.2725), (2.255, -1.313), mark: (end: ">"))
  content((2.722, -0.7927), [#text(size: 0.73em)[$"pr"_B$]])
})

Throughout this section $D_h$ also denotes its pullback to the product.

=== 3.1 Conventions and the lowest filtration piece <conventions-and-the-lowest-filtration-piece>

We use right $cal(D)$-modules underlying graded-polarizable algebraic mixed Hodge modules with rational structures. On a smooth $d$-fold we twist the constant Hodge module by $d$, so that its underlying canonical sheaf starts at $F_0$, rather than $F_(- d)$. All subsequent localization and support functors carry this normalization. The required functorial statements are the localization and support operations, exterior products, smooth inverse images, and projective direct-image strictness in [30,31,32]; conventions are also explained in [36,28].

Define

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(M) = cal(H)_(\[ Q \])^(b + 1) #scale(x: 120%, y: 120%)[\(] omega_(Y times B) \( * D_h \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(N) = cal(H)^1 "pr"_(B \, +) cal(M) . $ <bl:hod:modules>]

Here the brackets denote algebraic local cohomology, and the plus sign denotes differential-module direct image. Localization and cohomology with supports show that $cal(M)$ is the underlying filtered module of a mixed Hodge module. Its direct image has projective support, as above.

For a right module, the relative filtered de Rham complex for the projection has term

#[#set math.equation(numbering: n => "(3.2)")
 $ F_(j - i) cal(M) ⊗ and.big^i T_Y quad upright("in degree ") - i . $ <bl:hod:relative-dr>]

The tangent sheaf here is pulled back from $Y$. In particular its last term, in degree zero, is $F_j cal(M)$.

#thm([Lemma 3.1.])[
  (Lowest piece and strict insertion).  #emph[With the normalization above, 
#[#set math.equation(numbering: n => "(3.3)")
 $ F_(< 0) cal(M) & = 0 \, & F_0 cal(M) & = \( iota \, h \)_(*) omega_R \( D_h \) \,\
F_(< 0) cal(N) & = 0 \, & F_0 cal(N) & = R^1 h_(*) omega_R \( D_h \) . $ <bl:hod:lowest-source>]

 The equality for $F_0 cal(N)$ identifies it with a subsheaf of $cal(N)$. It is induced by simple graph residues and the inclusion of the last term of the relative de Rham complex. The latter inclusion commutes with right differentiation in base coordinates.]
] <bl:lem:lowest-piece>

#proof[
  Work locally along $Q$. Take simple normal crossing coordinates for $R + D_h$, write $r_0$ for the reduced equation of $R$, and take coordinates $t_1 \, dots.h \, t_b$ on the base. The functions $h^(*) t_i$ on $R$ lift locally to functions $v_i$ on $Y$. Thus $Q$ is defined by
  $ r_0 = 0 \, #h(2em) psi_i = t_i - v_i = 0 quad \( 1 lt.eq i lt.eq b \) . $
  The $psi_i$, together with the boundary coordinates, are independent. The support sequence is a hypersurface followed by $b$ smooth support coordinates, which explains the index $b + 1$ in (3.1).
  Before adding the graph coordinates, the boundary module is
  #[#set math.equation(numbering: n => "(3.4)")
   $ omega_Y \( * \( R + D_h \) \) \/ omega_Y \( * D_h \) . $ <bl:hod:boundary-module>]
  In one coordinate, localization of the normalized constant begins with simple poles at $F_0$; $F_j$ permits $j$ further derivatives. The quotient by regular forms is the residue delta module, whose simple residue is again at level zero. This is the usual localization–residue exact sequence with its strict Hodge filtration. Taking exterior products gives the same rule for a normal crossing divisor: one begins with simple poles in all the indicated coordinates, and allows a total of at most $j$ extra denominator exponents; see also [26] Section 3 and Proposition 8.2. Quotienting out the part regular in the $R$-support direction gives (3.4). The $b$ independent graph residues add free normal derivatives with the same order rule.
  It follows that $F_(< 0) cal(M) = 0$, and its lowest piece is
  $ omega_Y \( R + D_h \) \/ omega_Y \( D_h \) = omega_R \( D_h \) \, $
  inserted along the graph by the class
  #[#set math.equation(numbering: n => "(3.5)")
   $ alpha mapsto [alpha thin frac(d t_1 and dots.h.c and d t_b, product_(i = 1)^b \( t_i - v_i \))] \, #h(2em) alpha in omega_Y \( R + D_h \) . $ <bl:hod:simple-graph>]
  A form regular in the $R$-support direction gives zero, even though poles on $D_h$ are allowed. This computes the absolute dualizing sheaf of the whole reduced divisor, including its crossings.
  The map is independent of the lifts. If $v_i$ changes by a multiple of $r_0$, the correction to the simple graph fraction becomes regular in the support direction and vanishes. Under a base coordinate change the Jacobian in the top differential cancels the determinant in the ordered graph residues. These are also the usual transformation rules for a complete-intersection residue. Thus (3.5) is intrinsic.
  For completeness, strictness applies here to a projective morphism, despite the quasi-projective ambient notation. Compactify the projection projectively over $B$. Since $Q arrow.r B$ is proper, its image in that compactification remains closed and acquires no points in the relative boundary. Extend the object with this unchanged support. Projective filtered strictness applies to it and hence computes the original direct image. The mixed statement is Saito’s Theorem 2.14 and Proposition 2.15 in [31], with the algebraic formulation in its Section 4.1; no decomposition of a mixed object is needed.
  At level zero, (3.2) has only the last term. Its first cohomological direct image is therefore $R^1 h_(*) omega_R \( D_h \)$. Strictness identifies this with $F_0 cal(N)$ as a subsheaf of $cal(N)$, and gives the assertion at negative levels as well. Finally, base differentiation commutes with the relative differential in the product. It therefore commutes with the map from the last term to differential-module direct image. ◻
]

The same calculation describes every filtration level locally: $F_j cal(M)$ consists of the graph fractions with simple initial denominators in the boundary and graph coordinates, and at most $j$ extra denominator exponents in total, modulo the fractions regular in the $R$-support direction. We will use this explicit description across a ramified base change.

=== 3.2 The consequence of Kodaira–Saito vanishing <the-consequence-of-kodairasaito-vanishing>

For a mixed Hodge module $cal(N)_0$ on a smooth projective variety $T_0$ and an ample line bundle $H_0$, Kodaira–Saito vanishing gives

#[#set math.equation(numbering: n => "(3.6)")
 $ bb(H)^i #h(-0.16667em) (T_0 \, "gr"_j^F "DR" \( cal(N)_0 \) ⊗ H_0^(- 1)) = 0 #h(2em) \( i < 0 \) . $ <bl:hod:ksv>]

We use perverse normalization, so the right de Rham complex ends in degree zero. The mixed version follows from the pure strict-support decomposition and the strict finite weight filtration; see [31] Proposition 2.33 and [28] Theorem 28. Tate twists do not affect the assertion, which holds for every $j$.

#thm([Lemma 3.2.])[
  (No ample line in the lowest symbol kernel).  #emph[Suppose $F_(< 0) cal(N)_0 = 0$. Then 
#[#set math.equation(numbering: n => "(3.7)")
 $ "Hom" #h(-0.16667em) (H_0 \, ker [F_0 cal(N)_0 ⊗ T_(T_0) arrow.r "gr"_1^F cal(N)_0]) = 0 . $ <bl:hod:symbol-vanishing>]

 The arrow is the symbol of the right differential-operator action.]
] <bl:lem:symbol-vanishing>

#proof[
  At $j = 1$ all terms in degrees at most $- 2$ vanish, so the graded de Rham complex is the two-term complex
  $ \[ F_0 cal(N)_0 ⊗ T_(T_0) arrow.r "gr"_1^F cal(N)_0 \] quad upright("in degrees ") - 1 \, 0 . $
  Its hypercohomology in degree $- 1$, after tensoring by $H_0^(- 1)$, is exactly the space of global sections of the twisted kernel. Equation (3.6) proves the claim. ◻
]

#prodef([Remark 3.3.])[
  Both Lemma 9 and Lemma 10 concern complete coherent sheaves, including sections on smaller supports. They require no local freeness and no restriction to the open set carrying a variation of Hodge structure. This is essential for the obstruction calculation.
] <bl:hod:whole-sheaf>

== 4 Positive frame weight and the Euler direction <bl:sec:frames>

We now combine the graph module with the scaling action on the frame bundle. A positive weight has two consequences: after a transverse cover it gives an ample source for the horizontal symbol, and in the vertical direction it gives a nonzero Euler eigenvalue. The proof keeps these two operations separate until both have been identified on the same right differential module.

Return to Section 2. Thus $T = bb(P)^ell$, $J = cal(O)_T \( 1 \)$, and $B = J^times$ is the bundle of nonzero vectors, with projection $p_B : B arrow.r T$. The parameter $lambda in bb(G)_m$ acts on $B$ by multiplication by $lambda^r$. Its action on $Y$ preserves $R$ and $D_h$, and $h : R arrow.r B$ is equivariant. All the modules in (3.1) inherit their natural geometric action.

Let $epsilon$ be the infinitesimal generator on $B$. In a bundle chart with fiber coordinate $beta$,

#[#set math.equation(numbering: n => "(4.1)")
 $ epsilon = r beta frac(partial, partial beta) . $ <bl:frm:euler>]

It is nowhere zero and spans the kernel of $T_B arrow.r p_B^(*) T_T$. By weight $m$ we mean pullback weight: $lambda^(*) s = lambda^m s$.

#thm([Proposition 4.1.])[
  (Positive-weight obstruction).  #emph[For the filtered module $cal(N)$ of (3.1), the following assertions hold.]
  + #emph[If $v in H^0 \( B \, F_0 cal(N) ⊗ T_B \)$ is homogeneous of weight $m > 0$ and has zero symbol in $"gr"_1^F cal(N)$, then its image in $F_0 cal(N) ⊗ p_B^(*) T_T$ is zero.]
  + #emph[If $s in H^0 \( B \, F_0 cal(N) \)$ is homogeneous of weight $m$, then its actual right differential-operator action satisfies 
#[#set math.equation(numbering: n => "(4.2)")
 $ s epsilon = - m s . $ <bl:frm:euler-action>]

 The same assertion is valid on invariant bundle charts.]
] <bl:prop:frame-positivity>

The first assertion concerns the symbol, and the second concerns the operator itself. Their combination will annihilate the obstruction. We prove them separately, keeping track of both canonical factors and filtration shifts.

The horizontal directions cannot in general be suppressed. For example, if $V = bb(P)^2$ and $C$ is a smooth quartic, then $A = K_V + C tilde.op cal(O)_(bb(P)^2) \( 1 \)$ and $G = C tilde.op 4 A$ satisfy the supported hypotheses, while $cal(O)_V \( G \) \|_C$ is ample and nontrivial. The construction must therefore retain the full map $f : S arrow.r T$.

=== 4.1 A transverse power cover <a-transverse-power-cover>

Suppose first that $ell > 0$. Take the coordinate $r$-th power map of $bb(P)^ell$ and compose it with a general target automorphism, obtaining

$ phi.alt : T' = bb(P)^ell arrow.r T \, #h(2em) J' = cal(O)_(T') \( 1 \) \, #h(2em) \( J' \)^r tilde.eq phi.alt^(*) J . $

It is finite flat. Put $B' = \( J' \)^times$, with its ordinary scalar action, and let $p' : B' arrow.r T'$ be the projection. Raising frames to the $r$-th power gives a finite flat equivariant map $eta$ in

(4.3)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$B' = \( J' \)^times$])
  content((2.717, 0), [$B = J^times$])
  content((0, -1.585), [$T'$])
  content((2.717, -1.585), [$T .$])
  line((0.798, 0), (2.183, 0), mark: (end: ">"))
  content((1.491, 0.2266), [#text(size: 0.73em)[$eta$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.3705, -0.7927), [#text(size: 0.73em)[$p'$]])
  line((2.717, -0.2725), (2.717, -1.313), mark: (end: ">"))
  content((3.136, -0.7927), [#text(size: 0.73em)[$p_B$]])
  line((0.402, -1.585), (2.315, -1.585), mark: (end: ">"))
  content((1.359, -1.812), [#text(size: 0.73em)[$phi.alt$]])
})

Along each nonzero fiber its differential is invertible.

Choose $phi.alt$ transverse to the maps to $T$ from every closed intersection of components of $R + D_h$ involving a component of $R$. These intersections are smooth and there are finitely many of them. Here is the generic-transversality justification. For such an intersection $L$, the matching-pair space for the map $L arrow.r T$ and the translated power map is smooth: variation of the target automorphism supplies every target tangent direction. A general fiber over the automorphism group is smooth by generic smoothness in characteristic zero. This is exactly the required transversality. The finitely many conditions can be imposed simultaneously. Since the vertical differential in (4.3) is invertible, this also gives transversality to the corresponding maps $L arrow.r B$. If a point of $T$ is prescribed, one may in addition require that the branch divisor avoid it, an open condition on the target automorphism.

Let $Q' = Q times_B B' subset Y times B'$, and set

#[#set math.equation(numbering: n => "(4.4)")
 $ cal(M)' = cal(H)_(\[ Q' \])^(b + 1) #scale(x: 120%, y: 120%)[\(] omega_(Y times B') \( * D_h \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(N)' = cal(H)^1 "pr"_(B' \, +) cal(M)' . $ <bl:frm:basechanged-modules>]

These are again mixed Hodge modules with projective support.

#thm([Lemma 4.2.])[
  (Filtered transverse comparison).  #emph[For every $j$ there are natural equivariant isomorphisms 
#[#set math.equation(numbering: n => "(4.5)")
 $ F_j cal(N)' tilde.eq eta^(*) F_j cal(N) ⊗ omega_(B' \/ B) . $ <bl:frm:filtered-comparison>]

 Under these isomorphisms, symbol action transforms by the tangent map $d eta : T_(B') arrow.r eta^(*) T_B$.]
] <bl:frm:comparison>

#proof[
  Use the local coordinates in the proof of Lemma 9. The pulled-back graph equations are
  $ psi'_i = t_i compose eta - v_i . $
  At a point of $Q'$, transversality to the intersection of all boundary components through that point says that the differentials of the $psi'_i$, together with those boundary coordinates, are independent. They can therefore be used as part of a local smooth coordinate system. In particular the local support calculation remains a normal crossing calculation.
  Flat pullback preserves the localization quotient and its local cohomology. More specifically, the explicit description following Lemma 9 identifies its filtration level by level: the fractions with total extra denominator exponent at most $j$ pull back to precisely the corresponding fractions for $cal(M)'$. For right modules one must also replace the absolute top-form frame on $Y times B$ by that on $Y times B'$. Thus the filtered comparison before direct image is
  $ F_j cal(M)' tilde.eq \( "id"_Y times eta \)^(*) F_j cal(M) ⊗ "pr"_(B')^(*) omega_(B' \/ B) . $
  This is an isomorphism with the abstract relative canonical line; it does not multiply sections by a Jacobian that vanishes at ramification.
  The relative de Rham differentials differentiate only in $Y$. They commute with this comparison and with its relative canonical factor. Flat base change therefore applies to the entire filtered relative de Rham complex. One can check it on a finite affine cover and its Čech complex; flat pullback commutes with all cohomology in question. Projective-support strictness identifies the cohomology filtration with that of $cal(N)$ and $cal(N)'$, giving (4.5) for all $j$. The chain rule in the parameter coordinates gives the assertion about symbols. Terms arising from a change of canonical frame have order zero and do not change that assertion. ◻
]

One can also express the transversality in this proof as a non-characteristic condition. The characteristic variety of the normal crossing graph module is contained in the union of conormals to the graph strata involving $R$. A characteristic covector killed by $d \( "id"_Y times eta \)$ has zero $Y$ component; its remaining component annihilates both the stratum tangent image and $d eta \( T_(B') \)$. Transversality forces it to be zero. Finite flatness also makes the higher $"Tor"$ groups of every graded filtration piece vanish. These are the two non-characteristic conditions of [30] Section 3.5.1 and Lemmas 3.5.3, 3.5.5; in relative dimension zero they give the same filtration index and right canonical factor as the explicit calculation above.

=== 4.2 The adjugate and the projective quotient <the-adjugate-and-the-projective-quotient>

For vector bundles of equal rank the adjugate of $d eta$ defines a regular morphism

#[#set math.equation(numbering: n => "(4.6)")
 $ "adj" \( d eta \) : eta^(*) T_B arrow.r omega_(B' \/ B) ⊗ T_(B') . $ <bl:frm:adjugate>]

Indeed $det \( d eta \)$ is a section of $omega_(B' \/ B)$, so this is the usual determinant-twisted adjugate. It involves no division. If $v$ has zero symbol, applying (4.6) to its tangent factor and then (4.5) gives a section

#[#set math.equation(numbering: n => "(4.7)")
 $ v' in H^0 \( B' \, F_0 cal(N)' ⊗ T_(B') \) $ <bl:frm:transported-symbol>]

with zero symbol. In local matrices this is just $d eta "adj" \( d eta \) = det \( d eta \) "id"$. The construction preserves the weight of $v$.

Suppose the horizontal image of $v$ is nonzero. Choose a point where that coherent-sheaf section is nonzero, and choose $phi.alt$ as above with branch divisor avoiding its image in $T$. On an unbranched neighborhood the tangent map is an isomorphism preserving the vertical tangent line. Faithful flatness there shows that the horizontal image of $v'$ is still nonzero.

Now take the diagonal quotient

$ overline(X) = \( Y times B' \) \/ bb(G)_m arrow.r T' . $

It exists as an associated algebraic variety: a local section of $B' arrow.r T'$ identifies it with $Y$ times that base chart, and changes of section glue these products through the action on $Y$. It is smooth. The linearized ample bundle on $Y$ descends to a relatively ample bundle on this associated variety, so $overline(X)$ is quasi-projective. The invariant divisor $D_h$ descends to a divisor $overline(D)_h$, and the invariant closed support $Q'$ descends to $overline(Q)$.

The support map $overline(Q) arrow.r T'$ is projective. Properness descends from the projective map $Q' arrow.r B'$, and a descended relatively ample bundle gives projectivity. The quotient changes both the ambient dimension and the support dimension by one; thus $overline(Q)$ still has codimension $b + 1$. Define

#[#set math.equation(numbering: n => "(4.8)")
 $ overline(cal(M)) = cal(H)_(\[ overline(Q) \])^(b + 1) #scale(x: 120%, y: 120%)[\(] omega_(overline(X)) \( * overline(D)_h \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) overline(cal(N)) = cal(H)^1 overline("pr")_(+) overline(cal(M)) . $ <bl:frm:quotient-modules>]

Use the constant twist by $dim overline(X)$ in this formula. These are algebraic mixed Hodge modules, and the second has projective support over the projective base $T'$.

Choose a frame of $J'$ on $U subset T'$ and write a point of $Y times B' \|_U$ as $\( z \, t \, u \)$, with $z in Y$, $t in U$, and $u in bb(G)_m$. The coordinate change

#[#set math.equation(numbering: n => "(4.9)")
 $ \( z \, t \, u \) mapsto \( u^(- 1) #h(-0.16667em) dot.op z \, t \, u \) $ <bl:frm:untwisting>]

turns the diagonal action $\( z \, t \, u \) mapsto \( lambda #h(-0.16667em) dot.op z \, t \, lambda u \)$ into the action on $u$ alone. Since $Q'$ and $D_h$ are invariant, the support and divisor become products with $bb(G)_m$ as well. Localization and support commute with this product. Their normalizations give

#[#set math.equation(numbering: n => "(4.10)")
 $ F_j cal(N)' tilde.eq \( p' \)^(*) F_j overline(cal(N)) ⊗ omega_(B' \/ T') . $ <bl:frm:quotient-filtration>]

To check the index, ordinary right smooth pullback of relative dimension one changes $F_j$ to $F_(j + 1)$ and tensors with the relative canonical line. The normalized constant upstairs has one additional Tate twist. This cancels the index change: the normalized smooth inverse image is $\[ 1 \] \( 1 \)$, and gives exactly (4.10). See [36] Section 30. Relative direct image has the same relative dimension before and after this product, so its cohomological index stays one.

The relative canonical line in (4.10) has invariant frame $d u \/ u$. This frame is intrinsic as a relative form: a change of bundle trivialization changes it only by a form from the base. In the product description the vertical symbol is zero and the horizontal symbol is the pullback of that on $overline(cal(N))$. In particular $F_(< 0) overline(cal(N)) = 0$, by (4.5), (4.10) and faithful flatness.

Project $v'$ horizontally and use (4.10). A homogeneous section of weight $m$ on the nonzero vectors of $J'$ corresponds to a section twisted by $\( J' \)^(- m)$. Explicitly, if local frames satisfy $e_j = g_(i j) e_i$ and a vector is $u_i e_i$, then $u_j = g_(i j)^(- 1) u_i$; equality of expressions $u_i^m s_i$ forces $s_j = g_(i j)^m s_i$, the transition rule for a homomorphism from $\( J' \)^m$. Thus the projected zero-symbol section gives

#[#set math.equation(numbering: n => "(4.11)")
 $ \( J' \)^m arrow.r ker [F_0 overline(cal(N)) ⊗ T_(T') arrow.r "gr"_1^F overline(cal(N))] . $ <bl:frm:ample-map>]

It is nonzero if the original horizontal projection was nonzero. For $m > 0$ its source is ample, contradicting Lemma 10. This proves assertion (i) of Proposition 12. For $ell = 0$ there is no horizontal tangent direction and assertion (i) is immediate.

=== 4.3 The actual Euler action <the-actual-euler-action>

It remains to prove assertion (ii), which does not follow merely from the vanishing of the vertical symbol. Work on a bundle chart of $B$ and make the finite #emph[étale] fiber cover

$ beta = u^r \, #h(2em) u eq.not 0 . $

The generator (4.1) becomes $u partial_u$. The coordinate change (4.9) again identifies the supported geometric construction with a product in the $u$ direction. This is an identification of the underlying differential modules, with their natural equivariance, not just an identification of coherent filtration pieces.

A weight-$m$ section is consequently $u^m$ times a section independent of $u$, in the invariant relative frame $d u \/ u$. Right action on top forms is negative Lie differentiation. Since $d u \/ u$ is invariant,

$ \( u^m s_1 ⊗ d u \/ u \) thin \( u partial_u \) = - m \( u^m s_1 ⊗ d u \/ u \) . $

The product direct image retains this action, proving (4.2) on the étale cover and hence downstairs. This completes the proof of Proposition 12.

#prodef([Remark 4.3.])[
  If $v = s_0 ⊗ epsilon$ and $epsilon = sum_i c_i partial_(t_i)$, then the relevant right operator is
  $ sum_i \( s_0 c_i \) partial_(t_i) = s_0 epsilon . $
  The coefficients precede the derivatives. Moving them to the other side would introduce a divergence correction; the displayed identity is simply associativity in the ring of differential operators.
] <bl:frm:operator-order>

== 5 Infinitesimal lifting and section growth <bl:sec:lifting>

We now apply the residue insertion and the two frame assertions to prove lifting through every finite order. Finite-cover invariants and the weight-zero part of the frame action will then return the lifted layers to $V$, where their positive twists force unbounded section spaces.

Retain the complex algebraic setup of the preceding sections. In particular, $I = cal(O)_Z \( - E \) = y cal(O)_Z$, the pullback weight of $y$ is $- 1$, and $Omega = "res" \( sigma \)$ has weight $a = r \/ q > 0$. Write

#[#set math.equation(numbering: n => "(5.1)")
 $ iota : R^1 g_(*) cal(O)_E arrow.r.hook R^1 h_(*) omega_R \( D_h \) = F_0 cal(N) arrow.r.hook cal(N) $ <bl:lift:insertion>]

for the injections of Lemmas 8 and 9. Thus $iota \( e \) = Omega e$, with pullback and residue understood. If $F in g_(*) cal(O)_E$, the expression $Omega F e$ means $iota \( F e \)$: multiplication takes place on $E$, before the insertion. This convention does not require $F$ to come from $B$.

For all integers $j < d$, we push the underlying sheaf of complex vector spaces of $I^j \/ I^d$ along $\| g \|$ using the Zariski-topology convention of Section 2.4; negative powers mean invertible fractional ideals. No morphism from an infinitesimal thickening to $B$ is assumed. In contrast, multiplication by $y^j$ identifies $I^j \/ I^(j + 1)$ with the coherent sheaf $cal(O)_E$, with an equivariant weight shift. Its additive higher direct images are therefore the underlying sheaves of the usual coherent higher direct images under the projective morphism $g$.

#thm([Proposition 5.1.])[
  (Infinitesimal lifting).  #emph[For every $k gt.eq 1$, the truncation map 
#[#set math.equation(numbering: n => "(5.2)")
 $ g_(*) \( cal(O)_Z \/ I^(k + 1) \) arrow.r g_(*) \( cal(O)_Z \/ I^k \) $ <bl:lift:successive>]

 is surjective as a map of additive sheaves on $B$. More generally, for all integers $j < d$, the maps 
$ g_(*) \( I^j \/ I^(d + 1) \) arrow.r g_(*) \( I^j \/ I^d \) \, #h(2em) g_(*) \( I^j \/ I^d \) arrow.r g_(*) \( I^j \/ I^(j + 1) \) $

 are surjective. Each of these surjections is also surjective on sections over every affine open subset of $B$.]
] <bl:prop:lifting>

#proof[
  #emph[The obstruction derivation.] We first prove (5.2) by induction on $k$. Put $A_d = g_(*) \( cal(O)_Z \/ I^d \)$. The obstruction to surjectivity at the $k$-th step is the connecting homomorphism
  $ partial_k : A_k arrow.r R^1 g_(*) \( I^k \/ I^(k + 1) \) . $
  The previous steps give a surjection $A_k arrow.r A_1$. For $k > 1$, its kernel is $g_(*) \( I \/ I^k \)$, by left exactness. This kernel lifts to $g_(*) \( I \/ I^(k + 1) \)$: multiplication by $y$ identifies the required surjection with the already established map $A_k arrow.r A_(k - 1)$. Consequently $partial_k$ vanishes on that kernel. For $k = 1$ the kernel is zero. After framing the target layer by $y^k$, we obtain in either case a uniquely defined map
  #[#set math.equation(numbering: n => "(5.3)")
   $ delta : g_(*) cal(O)_E arrow.r R^1 g_(*) cal(O)_E \, #h(2em) partial_k \( tilde(F) \) = y^k delta \( F \) . $ <bl:lift:derivation>]
  Here $tilde(F)$ denotes any local lift of $F$ to $A_k$; we suppress the index $k$ in the notation $delta_k$ of Section 2.4.
  The map $delta$ is a $bb(C)$-linear derivation, where $R^1 g_(*) cal(O)_E$ is a module over $g_(*) cal(O)_E$ by multiplication on $E$. To check this assertion, work locally on the base, choose lifts of $F \, G$ to $A_k$, and represent them on an open cover along $E$ by ambient functions $F_alpha \, G_alpha$. We use the Čech convention $\( d c \)_(alpha beta) = c_beta - c_alpha$. Both differences $F_beta - F_alpha$ and $G_beta - G_alpha$ are divisible by $y^k$. In
  $ F_beta G_beta - F_alpha G_alpha = F_alpha \( G_beta - G_alpha \) + G_alpha \( F_beta - F_alpha \) + \( F_beta - F_alpha \) \( G_beta - G_alpha \) \, $
  the last term vanishes modulo $y^(k + 1)$, since $2 k gt.eq k + 1$. Divide by $y^k$ and restrict to $E$. The resulting cocycles give
  #[#set math.equation(numbering: n => "(5.4)")
   $ delta \( F G \) = F delta \( G \) + G delta \( F \) \, #h(2em) delta \( 1 \) = 0 . $ <bl:lift:leibniz>]
  The factorization just proved ensures independence of the chosen shorter lifts.
  #emph[The graph residue identity.] We relate this derivation to right differentiation on $cal(N)$. Choose a coordinate chart in $B$, with coordinates $t_1 \, dots.h \, t_b$, and put $e_i = delta \( t_i \)$, applying $delta$ to their pullbacks to $E$. For every local section $F in g_(*) cal(O)_E$, we claim that
  #[#set math.equation(numbering: n => "(5.5)")
   $ iota #scale(x: 120%, y: 120%)[\(] delta \( F \) #scale(x: 120%, y: 120%)[\)] + sum_(i = 1)^b iota \( F e_i \) thin partial_(t_i) = 0 #h(2em) upright("in ") cal(N) . $ <bl:lift:variable-identity>]
  It is essential here that $F$ is arbitrary.
  This can be checked at base germs. Shrink the base so that the induction provides lifts of $F \, t_1 \, dots.h \, t_b$ modulo $I^k$, and choose ambient representatives $F_alpha \, v_(alpha i)$ on an open cover along $E$. Pull them back to $Y$, still writing $y$ for its pullback. On overlaps write
  #[#set math.equation(numbering: n => "(5.6)")
   $ v_(beta i) - v_(alpha i) = y^k u_(alpha beta \, i) \, #h(2em) F_beta - F_alpha = y^k b_(alpha beta) . $ <bl:lift:overlap-functions>]
  The restrictions of $u_(alpha beta \, i)$ and $b_(alpha beta)$ to $E$ represent $e_i$ and $delta \( F \)$. The same assertions hold if representatives are specified only modulo $y^(k + 1)$. On the product with the coordinate chart of $B$, put $psi_(alpha i) = t_i - v_(alpha i)$ and $d t = d t_1 and dots.h.c and d t_b$. In the full local-cohomology module $cal(M)$ of Lemma 9, consider the zero-cochain of ordered generalized fractions
  #[#set math.equation(numbering: n => "(5.7)")
   $ C_alpha = [frac(sigma F_alpha and d t, y^k product_i psi_(alpha i))] . $ <bl:lift:cochain>]
  The brackets include the divisor support direction as well as the $b$ graph directions, in a fixed order. Poles along $D_h$ are allowed. The divisor pole bound for (5.7) is $R + D_h + k hat(E)$, so these classes belong to $cal(M)$; they need not belong to $F_0 cal(M)$.
  Here is a calculation valid also at crossings and at components with multiplicity in $hat(E)$. Locally invert an equation of $D_h$ and let $r_0$ be a reduced equation for $R$. In this localization, $sigma = alpha \/ r_0$, where $alpha$ is a regular top form, $r_0 divides y$, and the zero support of $y$ is exactly $R$. The divisor denominator in (5.7) is $r_0 y^k$. In the quotient by this denominator,
  #[#set math.equation(numbering: n => "(5.8)")
   $ y^(2 k) = 0 \, #h(2em) y^(k + 1) = 0 quad upright("in ") cal(O)_Y \( * D_h \) \/ \( r_0 y^k \) \, $ <bl:lift:nilpotent-modulus>]
  because $r_0 divides y$ and $k gt.eq 1$. Thus the ideal generated by $y^k$ is square zero there. Localizations by $psi_(alpha i)$ and $psi_(beta i)$ agree canonically, since the two elements differ by a nilpotent element, and the exact first-order formula is
  $ psi_(beta i)^(- 1) = psi_(alpha i)^(- 1) + y^k u_(alpha beta \, i) psi_(alpha i)^(- 2) . $
  Multiplying these identities and using $F_beta = F_alpha + y^k b_(alpha beta)$, all terms containing two differences vanish by (5.8). After dividing by the divisor denominator, the result in local cohomology is
  #[#set math.equation(numbering: n => "(5.9)")
   $ C_beta - C_alpha =  & [frac(sigma b_(alpha beta) and d t, product_j psi_(alpha j))]\
 & + sum_i [frac(sigma F_alpha u_(alpha beta \, i) and d t, psi_(alpha i)^2 product_(j eq.not i) psi_(alpha j))] . $ <bl:lift:cech-expansion>]
  One can formalize this passage by first computing graph local cohomology over $cal(O)_Y \( * D_h \) \/ \( r_0 y^k \)$, and then mapping to divisor local cohomology by the fraction with denominator $r_0 y^k$. Changing the graph equations by the indicated nilpotents gives the same localizations at the first stage. Divisor local cohomology is the direct limit of these denominator calculations, so the resulting identity is an identity in the original support module. This also explains why ordinary reduced-support division, without the factor $y^k$ in the modulus, would not justify the computation.
  The coefficients remaining in (5.9) have only the simple divisor pole bound $R + D_h$. Their residues are respectively $Omega delta \( F \)$ and $Omega F e_i$ as Čech classes under (5.1). Indeed division by $y^k$ has already cancelled in the displayed coefficients. Changing a coefficient representative by a multiple of $y$ changes its product with $sigma$ by a form regular in the $R$-direction after the localization, because $r_0 divides y$. Its residue is therefore zero. This is the product-residue map on the entire divisor, including its crossings.
  For completeness, the sign in (5.9) agrees with the right-module action. If $eta$ is a form pulled back from $Y$, right differentiation of top forms is minus differentiation of their coefficients. Hence
  #[#set math.equation(numbering: n => "(5.10)")
   $ [frac(eta and d t, product_j psi_(alpha j))] partial_(t_i) = [frac(eta and d t, psi_(alpha i)^2 product_(j eq.not i) psi_(alpha j))] . $ <bl:lift:right-sign>]
  The rightmost-term map from $cal(M) \[ 0 \]$ to the relative right de Rham complex is a map of complexes and commutes with target differentiation. Compute its derived pushforward with an affine Čech refinement. The total differential of the zero-cochain (5.7), which lies in relative degree zero, is its Čech coboundary, since there is no subsequent relative term. Its image in $cal(N) = cal(H)^1 "pr"_(B \, +) cal(M)$ is zero. Equations (5.9) and (5.10), and the lowest-piece identification in Lemma 9, prove (5.5). No ambient lift of the map $g$ on a neighborhood of a whole fiber was used: the chosen ambient representatives and their overlaps suffice.
  #emph[Vanishing of the obstruction.] Apply (5.5) first with $F = 1$, and take the first symbol. The tensor $v_k$, written $v$ at this fixed order, satisfies
  #[#set math.equation(numbering: n => "(5.11)")
   $ v = sum_i iota \( e_i \) ⊗ partial_(t_i) in H^0 \( B \, F_0 cal(N) ⊗ T_B \) \, #h(2em) "symbol" \( v \) = 0 . $ <bl:lift:symbol-vector>]
  The restriction of $delta$ to $cal(O)_B$ factors through the algebraic Kähler differentials $Omega_B^1$, by (5.4). Thus (5.11) is independent of coordinates and is a global algebraic tensor. The connecting map before the framing in (5.3) is equivariant. Since $lambda^(*) y = lambda^(- 1) y$, the framed map satisfies
  $ lambda^(*) delta \( F \) = lambda^k delta \( lambda^(*) F \) . $
  Consequently the derivation tensor has weight $k$: a coordinate’s weight in its coefficient is cancelled by the weight of its tangent vector. Multiplication by $Omega$ adds $a$, so $v$ has weight
  #[#set math.equation(numbering: n => "(5.12)")
   $ m = a + k > 0 . $ <bl:lift:positive-weight>]
  Proposition 12 forces the horizontal projection of $v$ to vanish. The vertical tangent line of $B arrow.r T$ is freely generated by the invariant, nowhere-zero Euler field $epsilon = r beta partial_beta$. Thus $v = s_0 ⊗ epsilon$ for a global section $s_0 in H^0 \( B \, F_0 cal(N) \)$ of weight $m$. Write $epsilon = sum_i c_i partial_(t_i)$. The identity with $F = 1$, before taking the symbol, reads
  $ 0 = sum_i iota \( e_i \) partial_(t_i) = sum_i \( s_0 c_i \) partial_(t_i) = s_0 epsilon . $
  Coefficients occur before the derivatives, so the last equality is associativity of the right action; no coefficient is commuted through a derivative. The Euler assertion of Proposition 12 now gives $0 = s_0 epsilon = - m s_0$, whence $s_0 = 0$. It follows that every $iota \( e_i \)$, and hence every $e_i$, is zero. Return to (5.5) for arbitrary $F$. It yields $iota \( delta \( F \) \) = 0$, and injectivity of (5.1) gives $delta \( F \) = 0$. This proves the induction step and hence (5.2). The same argument includes $dim T = 0$, when there is no horizontal tangent direction.
  #emph[Signed powers and affine sections.] For any integers $j < d$, multiplication by the global meromorphic function $y^j$ identifies
  $ cal(O)_Z \/ I^(d - j) tilde.eq I^j \/ I^d . $
  It transports the established surjections to all successive Laurent truncations. Iteration gives the surjection to the leading layer. Moreover, each single successive truncation fits into an exact sequence of additive sheaves
  #[#set math.equation(numbering: n => "(5.13)")
   $ 0 arrow.r g_(*) \( I^d \/ I^(d + 1) \) arrow.r g_(*) \( I^j \/ I^(d + 1) \) arrow.r g_(*) \( I^j \/ I^d \) arrow.r 0 . $ <bl:lift:coherent-kernel>]
  The kernel is coherent on $B$. On an affine open it has vanishing first cohomology, so the additive-sheaf cohomology sequence gives surjectivity on sections. Finitely many such steps give the asserted affine-section surjectivity to every leading layer. Only the kernels in (5.13) were assigned coherent $cal(O)_B$-module structures. ◻
]

#thm([Lemma 5.2.])[
  (Descent and section growth).  #emph[For $j in bb(Z)$, define the divisorial sheaf and its layer by 
$ J_j^V = cal(O)_V #scale(x: 120%, y: 120%)[\(] - ceil.l j G \/ r ceil.r #scale(x: 120%, y: 120%)[\)] \, #h(2em) cal(B)_j = J_j^V \/ J_(j + 1)^V \, #h(2em) Q_j = f_(*) cal(B)_j . $

 The sheaves $cal(B)_j$ are coherent on $S$, and for every $d > j$ the map 
#[#set math.equation(numbering: n => "(5.14)")
 $ f_(*) \( J_j^V \/ J_d^V \) arrow.r Q_j $ <bl:lift:descent-surjection>]

 is surjective as a map of additive sheaves on $T$. Here the left side is pushed along $\| f \|$ on its topological support $\| S \|$. Furthermore, 
$ h^0 #scale(x: 120%, y: 120%)[\(] V \, cal(O)_V \( N G \) \/ cal(O)_V #scale(x: 120%, y: 120%)[\)] arrow.r oo #h(2em) upright("as ") N arrow.r oo . $

]
] <bl:lem:descent-growth>

#proof[
  #emph[The invariant layers.] Since $r$ is divisible by every $d_i$, we have $0 < d_i \/ r lt.eq 1$. Thus the coefficientwise difference $ceil.l \( j + 1 \) G \/ r ceil.r - ceil.l j G \/ r ceil.r$ has coefficients zero or one. A function in the reduced ideal of $S$ has order at least one along each $S_i$. The divisorial inequalities therefore show that this ideal carries $J_j^V$ into $J_(j + 1)^V$. Consequently $cal(B)_j$ is a coherent $cal(O)_S$-module.
  Let $mu_r$ denote the deck group of the first, full root cover $pi : Z arrow.r P$. We have
  #[#set math.equation(numbering: n => "(5.15)")
   $ \( pi_(*) I^j \)^(mu_r) = p^(*) J_j^V #h(2em) \( j in bb(Z) \) . $ <bl:lift:invariant-ideals>]
  Indeed an invariant meromorphic function in the full root algebra descends to $P$, even when that algebra is disconnected. At a prime over $p^(- 1) \( S_i \)$, its downstairs order $n$ becomes $\( r \/ d_i \) n$, whereas $y$ has order one. Membership in $I^j$ is thus equivalent there to
  $ \( r \/ d_i \) n gt.eq j quad arrow.l.r.double quad n gt.eq ceil.l j d_i \/ r ceil.r . $
  At other primes it means ordinary regularity. The codimension-one test on the normal schemes proves (5.15), also for negative $j$. The identification with the pullback divisorial sheaf can be checked on the local product charts of $P arrow.r V$. Finite pushforward is exact, and averaging over $mu_r$ is exact in characteristic zero. Hence
  #[#set math.equation(numbering: n => "(5.16)")
   $ #scale(x: 120%, y: 120%)[\(] pi_(*) \( I^j \/ I^d \) #scale(x: 120%, y: 120%)[\)]^(mu_r) = p^(*) \( J_j^V \/ J_d^V \) #h(2em) \( j < d \) . $ <bl:lift:invariant-quotients>]
  #emph[Descending the lifting maps.] To prove (5.14), let $U subset T$ be affine and put $B_U = B times_T U$. The morphism $B arrow.r T$ is affine, so $B_U$ is affine. Define the open neighborhood
  $ V_U = V \\ #scale(x: 120%, y: 120%)[\(] S \\ f^(- 1) \( U \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) P_U = p^(- 1) \( V_U \) \, #h(2em) Z_U = pi^(- 1) \( P_U \) . $
  The complement defining $V_U$ is closed in $S$, hence in $V$. Moreover $E ∩ Z_U = g^(- 1) \( B_U \)$ as topological spaces. Since the relevant quotients are supported on $E$, the affine-section assertion of Proposition 15 gives
  $ Gamma \( Z_U \, I^j \/ I^d \) arrow.r Gamma \( Z_U \, I^j \/ I^(j + 1) \) quad upright("surjectively") . $
  Taking $mu_r$-invariants and using (5.16) gives a surjection between sections over $P_U$ of the corresponding pulled-back quotient sheaves. These are canonically linearized pullbacks: their linearizations in (5.15) are the ones obtained by descending meromorphic functions.
  We next take Laurent degree zero for the frame action. For a coherent sheaf $cal(A)$ on $V_U$, the affine projection of the nonzero-vector bundle gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ p_(*) p^(*) cal(A) = xor.big_(n in bb(Z)) cal(A) ⊗ L^(- n) . $ <bl:lift:laurent-descent>]
  The degree $n$ term has pullback weight $r n$. Sections commute with this direct sum on the quasi-compact separated open $V_U$; this also follows from a finite affine cover. The preceding surjection respects the displayed grading. Its degree-zero map is therefore surjective, and is exactly
  $ Gamma \( V_U \, J_j^V \/ J_d^V \) arrow.r Gamma \( V_U \, cal(B)_j \) . $
  These are the sections on $U$ of the two additive pushforwards in (5.14). Affine opens form a basis, proving that assertion.
  #emph[Counting the descended layers.] The sheaves $Q_j$ are coherent, since $f$ is projective. Ceiling arithmetic and the fixed identification $L \|_S = f^(*) J$ give
  #[#set math.equation(numbering: n => "(5.18)")
   $ J_(j - r)^V = J_j^V ⊗ L \, #h(2em) cal(B)_(j - r) = cal(B)_j ⊗ f^(*) J \, #h(2em) Q_(j - r) = Q_j ⊗ J . $ <bl:lift:periodicity>]
  Also $J_0^V = cal(O)_V$ and $J_1^V = cal(O)_V \( - S \)$, so $cal(B)_0 = cal(O)_S$ and $Q_0 = f_(*) cal(O)_S eq.not 0$, because $S eq.not diameter$.
  Set
  $ cal(A)_N = f_(*) \( J_(- N r)^V \/ J_0^V \) . $
  By (5.14) and left exactness, for each $- N r lt.eq j < 0$ there is an exact sequence of additive sheaves
  $ 0 arrow.r f_(*) \( J_(j + 1)^V \/ J_0^V \) arrow.r f_(*) \( J_j^V \/ J_0^V \) arrow.r Q_j arrow.r 0 . $
  Thus $cal(A)_N$ has a finite filtration whose coherent quotients, by (5.18), are precisely
  #[#set math.equation(numbering: n => "(5.19)")
   $ Q_t ⊗ J^n \, #h(2em) 0 lt.eq t < r \, quad 1 lt.eq n lt.eq N . $ <bl:lift:positive-layers>]
  The middle additive sheaves need not be coherent $cal(O)_T$-modules; the following estimates use only these exact sequences and their coherent quotients.
  Choose a common integer $n_0 gt.eq 1$ such that, for all $0 lt.eq t < r$ and $n gt.eq n_0$, Serre vanishing and generation give
  $ H^i \( T \, Q_t ⊗ J^n \) = 0 med \( i > 0 \) \, #h(2em) Q_t ⊗ J^n upright(" is generated by global sections") . $
  Write $ell = dim T$. The cohomology sequences of the finite filtration show that all cohomology of $cal(A)_N$ is finite-dimensional, that it vanishes in degrees greater than $ell$, and, for $i > 0$, that
  #[#set math.equation(numbering: n => "(5.20)")
   $ h^i \( T \, cal(A)_N \) lt.eq sum_(t = 0)^(r - 1) sum_(n = 1)^(n_0 - 1) h^i \( T \, Q_t ⊗ J^n \) = : C_i . $ <bl:lift:higher-bound>]
  The constants $C_i$ are independent of $N$. Euler characteristic is additive for the same exact sequences, whence
  $ chi \( T \, cal(A)_N \) = sum_(t = 0)^(r - 1) sum_(n = 1)^N chi \( T \, Q_t ⊗ J^n \) . $
  For $n gt.eq n_0$ all summands are nonnegative, and the summand with $t = 0$ is at least one: a nonzero globally generated sheaf has a nonzero global section. Therefore $chi \( T \, cal(A)_N \) arrow.r + oo$. Together with (5.20), this implies $h^0 \( T \, cal(A)_N \) arrow.r oo$. This argument also covers zero-dimensional support of the $Q_t$, and $ell = 0$: an individual twist need not grow, since the number of positive layers already grows with $N$.
  Finally $J_(- N r)^V = cal(O)_V \( N G \)$, and the definition of the additive pushforward identifies
  $ H^0 \( T \, cal(A)_N \) = H^0 #scale(x: 120%, y: 120%)[\(] V \, cal(O)_V \( N G \) \/ cal(O)_V #scale(x: 120%, y: 120%)[\)] . $
  This proves the claimed growth. ◻
]

#proof[
  Apply Lemma 16. From the exact sequence
  $ 0 arrow.r cal(O)_V arrow.r cal(O)_V \( N G \) arrow.r cal(O)_V \( N G \) \/ cal(O)_V arrow.r 0 $
  we obtain
  $ h^0 \( V \, cal(O)_V \( N G \) \) gt.eq h^0 #scale(x: 120%, y: 120%)[\(] V \, cal(O)_V \( N G \) \/ cal(O)_V #scale(x: 120%, y: 120%)[\)] - h^1 \( V \, cal(O)_V \) . $
  The right side is unbounded. In particular some $cal(O)_V \( N G \)$ has two linearly independent sections. On the integral variety $V$, their ratio is a nonconstant rational function, so the corresponding linear system has positive-dimensional image. Hence $kappa \( V \, G \) > 0$. The actual linear equivalence $G tilde.op q A$ yields $kappa \( V \, A \) = kappa \( V \, G \) > 0$, as required. ◻
]

== 6 Abundance after nonvanishing <bl:sec:abundance>

Over $bb(C)$, the supported theorem closes the zero-Iitaka-dimension case once lower-dimensional abundance generates the whole reduced floor. For positive Iitaka dimension, the induction also needs effective minimal models of fiber adjoints, which need not be nef. We organize these two uses in one proposition, then verify its hypotheses in dimension four and under the all-dimensional premise.

Every effective representative below is effective up to actual $bb(Q)$-linear equivalence. Ordinary log minimal models supply nef adjoints; semiampleness is the conclusion to be proved. The first lemma records exactly which section spaces survive passage to such a model.

=== 6.1 Minimal models and the whole reduced floor <minimal-models-and-the-whole-reduced-floor>

#thm([Lemma 6.1.])[
  (Comparison with an ordinary log minimal model).  #emph[Let $\( W \, Delta_W \)$ be a projective lc rational pair and let $\( V \, Delta_V \)$ be a $bb(Q)$-factorial dlt log minimal model. Use the log birational model convention in which divisors extracted on $V$ have coefficient one. On a common resolution $alpha : U arrow.r W$, $beta : U arrow.r V$, with compatible canonical divisors, 
#[#set math.equation(numbering: n => "(6.1)")
 $ alpha^(*) \( K_W + Delta_W \) = beta^(*) \( K_V + Delta_V \) + E \, #h(2em) E gt.eq 0 \, quad E upright(" is ") beta upright("-exceptional") . $ <bl:eq:abundance-model-comparison>]

 Consequently the adjoints have the same section spaces in sufficiently divisible degrees, and hence the same Kodaira dimension.]
] <bl:lem:abundance-model-comparison>

#proof[
  Set $E$ equal to the difference in (6.1). It is anti-nef over $W$, since $K_V + Delta_V$ is nef. The discrepancy condition for a log minimal model gives $alpha_(*) E gt.eq 0$: only prime divisors of $W$ contracted by the model map can contribute, and their discrepancies improve. The negativity lemma therefore gives $E gt.eq 0$.
  At a prime divisor on $V$ which is also a divisor on $W$, the coefficient of $E$ is zero. At a prime divisor on $V$ extracted over $W$, it is the new log discrepancy minus the old log discrepancy. The former is zero and the latter is nonnegative. Its coefficient is thus at most zero, and the effectivity just proved makes it zero. This proves exceptionality over $V$.
  For divisible $m$, adding the effective exceptional divisor $m E$ to $beta^(*) m \( K_V + Delta_V \)$ creates no additional sections. Indeed a rational function allowed by the former divisor has the required pole bounds at every prime divisor on the normal variety $V$, and therefore is a section downstairs; the converse follows by pullback. Birational pullback from $W$ preserves sections as well. These identifications prove the assertion. ◻
]

We may take the $bb(Q)$-factorial dlt models in this lemma in the ordinary minimal-model existence statements below. A crepant dlt modification, when needed, has the same adjoint pullback and preserves nefness and all section spaces. The dlt modification theorem is, for example, [12] Theorem 2.8.

#thm([Lemma 6.2.])[
  (Semiampleness on the whole floor).  #emph[Assume abundance for projective lc rational pairs of dimension less than $d$. If $\( V \, C \)$ is a projective $bb(Q)$-factorial dlt pair of dimension $d$ and $A = K_V + C$ is nef, then the actual restricted rational line bundle $A \|_P$, where $P = floor.l C floor.r$, is semiample. Its restriction to any reduced union of components of $P$ is also semiample.]
] <bl:lem:abundance-floor>

#proof[
  There is nothing to prove if $P$ is empty. Whole-floor dlt adjunction gives an effective rational boundary $Delta_P$ for which $\( P \, Delta_P \)$ is semi-divisorial log terminal, in particular semi-log-canonical, and
  #[#set math.equation(numbering: n => "(6.2)")
   $ K_P + Delta_P = A \|_P . $ <bl:eq:abundance-floor-adjunction>]
  Here the equality is an adjunction identification of rational line bundles on the entire reduced scheme $P$; see [12] Remark 2.7. In particular, it specifies the gluing along the double locus.
  For clarity, if $zeta : product.co P_i arrow.r P$ is the normalization, its pullback is the disjoint union of the adjunction formulas $K_(P_i) + Delta_i = A \|_(P_i)$. The conductor has coefficient one in $Delta_i$ and the normalization pairs are dlt. The whole-floor statement includes the $S_2$ and nodal-in-codimension-one properties of $P$. The adjunction maps are pluriresidue maps: at a generic double point, the two branch residues have the usual opposite subsequent residues of an ambient logarithmic form. Taking an even divisible power removes the sign convention and gives the dualizing-sheaf gluing. Thus (6.2) is not merely a collection of componentwise equivalences; it identifies a divisible restricted invertible sheaf on $P$ itself.
  Each $K_(P_i) + Delta_i$ is nef and is semiample by the assumed lower-dimensional abundance. Semiampleness descends from the normalization of a projective slc pair by [12] Theorem 4.3, equivalently Theorem 1.5. Applied to (6.2), this gives generation of a power on the whole $P$. Restricting its evaluation map to a reduced closed union of components preserves surjectivity, which proves the last assertion. This also treats extra coefficient-one components meeting the selected union and its strata. ◻
]

=== 6.2 The induction step <the-induction-step>

#thm([Proposition 6.3.])[
  (Abundance from effective models and lower-dimensional abundance).  #emph[Fix $d gt.eq 1$ and assume the following two statements over $bb(C)$:]
  + #emph[every projective lc rational pair of dimension at most $d$ whose adjoint has an effective $bb(Q)$-linearly equivalent divisor has an ordinary log minimal model;]
  + #emph[every nef projective lc rational adjoint in dimension less than $d$ is semiample.]
  #emph[Then, for a projective lc rational pair $\( X \, B_X \)$ of dimension $d$, 
$ D = K_X + B_X upright(" nef") \, #h(2em) kappa \( X \, D \) gt.eq 0 quad arrow.r.double quad D upright(" semiample") . $

 If $kappa \( X \, D \) = 0$, then $D tilde.op_(bb(Q)) 0$.]
] <bl:prop:abundance-induction>

#proof[
  We first treat Kodaira dimension zero, then the Iitaka fibers in the positive-dimensional case, and finally the lc centers. The second assumption is full lower-dimensional abundance; no nonvanishing hypothesis is imposed on the lower-dimensional restrictions in Lemma 18.
  #emph[Kodaira dimension zero.] Choose $M gt.eq 0$ with $D tilde.op_(bb(Q)) M$. Suppose that $M eq.not 0$. Take a projective log resolution $p : W arrow.r X$ of the pair together with $"Supp" M$. Start with the strict transform of $B_X$, raise the coefficient to one along every strict transform of a component of $M$, and put coefficient one on every exceptional prime divisor. Call the resulting snc boundary $C_W$, and let $T_W gt.eq 0$ be the sum of the coefficient increases on nonexceptional divisors. Using log discrepancies, we have
  #[#set math.equation(numbering: n => "(6.3)")
   $ K_W + C_W & tilde.op_(bb(Q)) M_W \,\
M_W & = p^(*) M + sum_(E_i upright(" exceptional")) a \( E_i \; X \, B_X \) E_i + T_W gt.eq 0 . $ <bl:eq:abundance-raised-boundary>]
  The pair $\( W \, C_W \)$ is lc, and $"Supp" M_W subset "Supp" floor.l C_W floor.r$.
  Raising the coefficients here preserves Kodaira dimension zero. To see this directly, a rational function in any divisible system $\| m M_W \|$ has, on $X$, poles only along $"Supp" M$. There is a constant $c > 0$, independent of $m$, such that the permitted pole order at every such prime is at most $c m$ times its coefficient in $M$: this is a finite list of positive coefficients. Increasing $c$ and clearing denominators identifies this rational function with a section of some $\| n M \|$. Since $M$ is effective and $kappa \( M \) = 0$, every such section is constant in the rational-function description of $H^0 \( X \, cal(O)_X \( n M \) \)$. Thus $h^0 \( W \, m M_W \) = 1$ for every sufficiently divisible $m$, and $kappa \( W \, K_W + C_W \) = 0$.
  By the first assumption, take an ordinary log minimal model $\( V_(*) \, C_(*) \)$ of $\( W \, C_W \)$. On a common resolution $alpha : U arrow.r W$, $beta : U arrow.r V_(*)$ set
  $ M_(*) := beta_(*) alpha^(*) M_W . $
  Lemma 17 shows that $M_(*) gt.eq 0$, $M_(*) tilde.op_(bb(Q)) K_(V_(*)) + C_(*)$, and that the latter adjoint has Kodaira dimension zero. The support of $M_(*)$ lies in $floor.l C_(*) floor.r$: surviving components of $M_W$ already have coefficient one, and any component extracted over $W$ has coefficient one by the model convention.
  Crucially, $M_(*) eq.not 0$. Otherwise $alpha^(*) M_W$ would be $beta$-exceptional. The nonzero effective divisor
  $ Q = \( p alpha \)^(*) M lt.eq alpha^(*) M_W $
  would then be exceptional over $V_(*)$ as well. But $Q tilde.op_(bb(Q)) \( p alpha \)^(*) D$ is nef. The negativity lemma applied to this effective exceptional, relatively nef divisor forces $Q = 0$, a contradiction. This is the place where nefness of the original adjoint ensures that the effective representative survives on the new model.
  Choose $q > 0$ sufficiently divisible that $G = q M_(*)$ is Cartier and $G tilde.op q \( K_(V_(*)) + C_(*) \)$. Lemma 18 makes $cal(O)_(V_(*)) \( G \) \|_(G_(upright("red")))$ semiample. All the supported pair hypotheses now hold, with $G eq.not 0$. Proposition 5 gives $kappa \( V_(*) \, K_(V_(*)) + C_(*) \) > 0$, a contradiction. Therefore $M = 0$ and $D tilde.op_(bb(Q)) 0$.
  #emph[A non-nef adjoint on an Iitaka fiber.] Put $k = kappa \( X \, D \) > 0$. Resolve an Iitaka map of a sufficiently divisible multiple of $D$ and take its Stein factorization, using a simultaneous projective log resolution $pi : W arrow.r X$:
  $ f : W arrow.r Z \, #h(2em) dim Z = k . $
  With $Gamma$ the strict transform of $B_X$ plus the reduced exceptional divisor, there is an actual equality
  #[#set math.equation(numbering: n => "(6.4)")
   $ L := K_W + Gamma = pi^(*) D + N \, #h(2em) N gt.eq 0 upright(" exceptional over ") X . $ <bl:eq:abundance-nonnef-adjoint>]
  In particular $kappa \( W \, L \) = k$. The resolved linear system also gives, for a positive integer $u$ and an ample rational divisor $A_Z$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ u L tilde.op_(bb(Q)) f^(*) A_Z + E_0 \, #h(2em) E_0 gt.eq 0 . $ <bl:eq:abundance-iitaka-bound>]
  The ample divisor is obtained by pulling back the hyperplane bundle through the finite map in the Stein factorization.
  Let $F$ be a very general smooth fiber. Generic smoothness for the finitely many horizontal snc strata and avoidance of the vertical strata give the log smooth lc pair $\( F \, Gamma_F \)$, with
  $ L \|_F = K_F + Gamma_F . $
  It has an effective rational representative: restrict any fixed nonzero divisible section of $L$, choosing $F$ outside the locus where the section vanishes identically. Moreover $kappa \( F \, L \|_F \) = 0$. Here is a justification that does not require $L \|_F$ to be nef. Work with a Cartier multiple $cal(L)$ of $L$ and clear (6.5) to write $v cal(L) tilde.op f^(*) A + E_1$, with $A$ ample Cartier and $E_1 gt.eq 0$. Choose $F$ outside the countable union of the proper closed sets needed for base change of $f_(*) cal(O)_W \( t cal(L) \)$, for all $t > 0$. If some fiber system has positive-dimensional image, then, after twisting that direct image by a sufficiently positive multiple $a A$, its global sections generate the fiber system at the general point of $Z$. Multiplying by sections of a further very ample multiple $b A$ gives a system in
  $ \| t cal(L) + \( a + b \) f^(*) A \| $
  which detects both the base and a nonconstant fiber ratio. Its image has dimension at least $k + 1$. Multiplication by the section of $\( a + b \) E_1$ embeds this system in $\| \( t + \( a + b \) v \) cal(L) \|$, contradicting $kappa \( W \, L \) = k$.
  Assume $s := dim F > 0$. The pair $\( F \, Gamma_F \)$ has dimension $s = d - k < d$ and an effective adjoint, so it has an ordinary log minimal model $\( F_(*) \, Gamma_(*) \)$ by the first assumption. Its nef adjoint has Kodaira dimension zero by Lemma 17. The second assumption therefore makes it semiample, and hence $bb(Q)$-linearly trivial. Notice that this applies lower-dimensional abundance on $F_(*)$; the divisor $K_F + Gamma_F$ on the original fiber may be non-nef.
  On a smooth common resolution $tau : tilde(F) arrow.r F$ and $mu : tilde(F) arrow.r F_(*)$, the comparison gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ P + N_F tilde.op_(bb(Q)) E_F \, #h(2em) P := tau^(*) \( pi^(*) D \|_F \) upright(" nef") \,\
N_F := tau^(*) \( N \|_F \) gt.eq 0 \, #h(2em) E_F gt.eq 0 upright(" exceptional over ") F_(*) . $ <bl:eq:abundance-fiber-comparison>]
  If $H$ is the pullback of an ample divisor on $F_(*)$, the projection formula and effectivity yield the full inequality
  #[#set math.equation(numbering: n => "(6.7)")
   $ 0 lt.eq P dot.op H^(s - 1) = - N_F dot.op H^(s - 1) lt.eq 0 . $ <bl:eq:abundance-fiber-sandwich>]
  Since $H$ is nef and big, write $H tilde.op_(bb(Q)) epsilon.alt A + T$ with $A$ ample, $epsilon.alt > 0$, and $T gt.eq 0$. Intersections of $T$ with products of nef classes are nonnegative. Replacing one factor $H$ at a time in the zero intersection in (6.7) thus gives $P dot.op A^(s - 1) = 0$. The Hodge index theorem for a nef class then gives $P equiv 0$; when $s = 1$ this is the degree criterion. It follows that $pi^(*) D \|_F equiv 0$. For zero-dimensional $F$ the same conclusion is automatic.
  #emph[Numerical dimension and lc centers.] For a nef divisor, $kappa \( D \) lt.eq nu \( D \)$. We prove the reverse inequality here. If $nu \( D \) > k$, a general sufficiently ample complete intersection $T subset W$ of dimension $k + 1$ has
  $ \( pi^(*) D \|_T \)^(k + 1) > 0 . $
  The restriction is nef and big. The map $T arrow.r Z$ is dominant and its very general fiber is an integral curve, by Bertini on the generic fiber of $W arrow.r Z$. The degree of $pi^(*) D \|_T$ on this curve is zero by the preceding argument. On the other hand, a big decomposition $pi^(*) D \|_T tilde.op_(bb(Q)) epsilon.alt A_T + E_T$, with $A_T$ ample and $E_T gt.eq 0$, gives strictly positive degree on a very general fiber curve: the curves cover $T$, so the general one is not contained in $"Supp" E_T$. This contradiction proves $nu \( X \, D \) = kappa \( X \, D \)$.
  Take a projective crepant $bb(Q)$-factorial dlt modification $xi : \( X' \, B' \) arrow.r \( X \, B_X \)$. Its adjoint $D' = xi^(*) D$ is nef and abundant. Lemma 18 makes its restriction to $floor.l B' floor.r$ semiample. Every lc center of the dlt pair is contained in this floor; restriction to the center and then pullback to its normalization remain semiample. Thus $D'$ is log abundant in the precise sense of [12] Definition 4.1. The nef and log abundant semiampleness theorem [12] Theorem 4.2, equivalently Theorem 1.6 applies to $\( X' \, B' \)$. Finally, semiampleness descends along $xi$, since $xi_(*) cal(O)_(X') = cal(O)_X$ and a divisible Cartier multiple of $D'$ is the pullback of that of $D$. This proves the proposition. ◻
]

=== 6.3 The two applications <the-two-applications>

#proof[
  Projective lc abundance through dimension three is the classical threefold theorem [17] Theorem 1.1, with its correction [18]. A direct surface reference is [11] Theorem 7.2; curves are elementary. These statements concern effective rational boundaries and the actual log canonical divisor.
  Ordinary log minimal models exist for effective lc fourfolds by [3] Corollary 1.6. Equivalently, one may use [4] Corollary 1.7 together with the known #emph[relative] three-dimensional minimal-model theorem for pseudo-effective $bb(Q)$-factorial dlt pairs. The relative theorem, not merely absolute threefold abundance, is the premise of that corollary. Its effectivity hypothesis is satisfied by the $bb(Q)$-linear effectivity used here. The lower-dimensional minimal-model statements are known as well.
  Proposition 19 with $d = 4$ now proves semiampleness under $kappa gt.eq 0$. In Kodaira dimension zero its proof gives $D tilde.op_(bb(Q)) 0$. The lower-dimensional cases follow from the cited abundance theorems. The complex assertion is now complete. Section 7 proves its field extension as a separate corollary. ◻
]

#proof[
  Assume that every smooth projective complex variety $W$ with pseudo-effective $K_W$ has a nonzero section of $m K_W$ for some $m > 0$. In particular $K_W$ is not required to be nef. Hashizume’s theorem [15] Theorem 1.4 yields lc nonvanishing and existence of ordinary log minimal models in all dimensions. The smooth premise is exactly Conjecture 1.3 of that paper; the output is its Conjectures 1.1 and 1.2.
  For rational data, its real-linear nonvanishing gives rational-linear nonvanishing. Apply the independent finite rational-feasibility lemma of [27] Lemma 8.1 to the finite coefficients of $D$ and of the principal divisors in an expression $D tilde.op_(bb(R)) M_(bb(R)) gt.eq 0$. That lemma uses only rational linear algebra, and no nonvanishing or abundance theorem. It produces $M_(bb(Q)) gt.eq 0$ with $D tilde.op_(bb(Q)) M_(bb(Q))$ on the same normal variety; denominators may be cleared together with any specified Cartier index.
  Induct on the dimension, starting with dimension zero. For a nef lc adjoint in dimension $d$, Hashizume supplies nonvanishing, because nefness implies pseudo-effectivity, and supplies all the effective ordinary minimal models required through dimension $d$. The induction hypothesis supplies full nef lc abundance in every smaller dimension. Proposition 19 therefore applies. This proves the conditional abundance statement over $bb(C)$, without adding semiampleness to Hashizume’s minimal-model conclusion. The ground-field transfer follows next. ◻
]

== 7 Transfer of the conclusions to characteristic-zero fields <bl:sec:fields>

The remaining task is to recover generation of an actual line bundle on the original variety over an arbitrary algebraically closed field of characteristic zero. We descend the specified divisor data to a countable algebraically closed field, embed that field into $bb(C)$, and detect generation by the evaluation cokernel. Faithful flatness then transfers the same Cartier multiple back. The auxiliary minimal models used over $bb(C)$ play no role in this descent.

#thm([Lemma 7.1.])[
  (Transfer of specified divisor data).  #emph[Let $upright(bold(k))$ be an algebraically closed field of characteristic zero. A finite collection of projective varieties over $upright(bold(k))$, rational divisors, specified Cartier multiples, morphisms, line bundles, sections, and identities between these data can be defined over a countable algebraically closed subfield $upright(bold(k))_0 subset upright(bold(k))$. The field $upright(bold(k))_0$ admits an embedding into $bb(C)$.]
  #emph[For the data considered here, one can include a log resolution and its discrepancy identities in this descent. Log canonicity, and klt singularities outside a specified reduced boundary, then hold after extension from $upright(bold(k))_0$ to either $upright(bold(k))$ or $bb(C)$. For a rational Cartier divisor on a projective variety over $upright(bold(k))_0$, nefness, Kodaira dimension, and generation of any fixed Cartier multiple are unchanged under algebraically closed field extension.]
] <bl:lem:field-transfer>

#proof[
  Choose finitely many equations and transition functions defining the schemes, morphisms, line bundles, and sections in question. Equalities and isomorphisms among them also have finite presentation data. They are defined over a finitely generated subfield $upright(bold(k))_1 subset upright(bold(k))$; enlarge it finitely whenever another one of the specified data is added. Take for $upright(bold(k))_0$ the algebraic closure of $upright(bold(k))_1$ inside $upright(bold(k))$. It is algebraically closed and countable. Choosing images in $bb(C)$ of a transcendence basis of $upright(bold(k))_1 \/ bb(Q)$, and then extending over its algebraic closure, gives an embedding $upright(bold(k))_0 arrow.r.hook bb(C)$.
  Include the individual prime divisors, a projective log resolution, its exceptional divisors, and all the required Cartier powers in this construction. The resulting varieties over $upright(bold(k))_0$ are normal or smooth as appropriate; these properties descend along the faithfully flat extension to $upright(bold(k))$. Over the algebraically closed field $upright(bold(k))_0$, normal varieties are geometrically normal (see [37] Tag 0C3M), and integral varieties are geometrically integral. The divisors, simple normal crossing conditions on the resolution, and birationality of the chosen morphisms consequently persist under extension. One can also include an open set on which a birational morphism is an isomorphism.
  For canonical divisors, choose compatible rational top forms on the smooth loci and on the resolution, and descend them together with the rational functions specifying the divisor comparisons. Pullback identities for the selected rational Cartier divisors then remain identities after extension. In particular a formula for the log discrepancies on the chosen resolution is unchanged. The finitely many coefficient inequalities on its snc boundary test lc singularities. On the inverse image of the complement of the specified floor, the strict inequalities test klt singularities. They therefore give the asserted singularity properties on the complex extension as well. Only the specified Cartier powers are being transferred; this argument asserts no general preservation of $bb(Q)$-factoriality.
  We give the nefness argument, since it involves all curves and is not itself a finite list of witnesses. Let $X_0$ be projective over $upright(bold(k))_0$, let $L_0$ be a line bundle, and let $upright(bold(k))'$ be an algebraically closed extension. An integral curve over $upright(bold(k))_0$ remains integral after extension and retains its $L_0$-degree. Thus nefness over $upright(bold(k))'$ implies nefness over $upright(bold(k))_0$. Conversely, suppose an integral curve $C subset X_(upright(bold(k))')$ has negative degree. It is defined over a finitely generated field extension of $upright(bold(k))_0$. Spread it as a closed subscheme of $X_0 times T$, where $T$ is an integral finite-type $upright(bold(k))_0$-scheme with that function field. After shrinking $T$, the family is flat with geometrically integral one-dimensional fibers, and the degree of $L_0$ on the fibers is constant. These assertions follow from geometric integrality of the generic fiber, generic flatness, and constancy of the relevant Hilbert polynomials. Every nonempty such $T$ has a closed $upright(bold(k))_0$-point. Its fiber is therefore a negative curve on $X_0$, a contradiction. Apply this argument to a Cartier multiple for rational divisors.
  For every integer $m$ making $m D_0$ Cartier, flat base change gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ H^0 \( X_0 \, cal(O)_(X_0) \( m D_0 \) \) ⊗_(upright(bold(k))_0) upright(bold(k))' tilde.eq H^0 \( X_(upright(bold(k))') \, cal(O)_(X_(upright(bold(k))')) \( m D_(upright(bold(k))') \) \) \; $ <bl:eq:fields-sections>]
  see [37] Tag 02KH. The complete linear-system maps therefore base change, as do their image closures, so their image dimensions and the Kodaira dimension are unchanged. Alternatively, their spaces of sections have the same dimensions in every divisible degree. The evaluation map for $m D_0$ also base changes to the evaluation map for $m D_(upright(bold(k))')$. Its cokernel vanishes exactly when its faithfully flat pullback vanishes. This proves generation in a fixed degree, and thus semiampleness, in both directions. The same argument applies to line bundles on the whole reduced boundary scheme, even when that scheme is reducible. ◻
]

#proof[
  #emph[Completion of Theorem 1.] Start with its given data over $upright(bold(k))$. In Lemma 20, include the pair, every component of its boundary and of $G$, the exact identity $G tilde.op q \( K_V + C \)$, and the section defining the nonzero effective Cartier divisor $G$. Include also a generated positive power of $cal(O)_V \( G \) \|_S$ with finitely many generating sections on the entire $S = G_(upright("red"))$. Reduced supports and their inclusions are part of these data, so $G$ stays nonzero and $"Supp" G subset "Supp" floor.l C floor.r$ after extension.
  Because the original variety is $bb(Q)$-factorial, $K_V$ and each of the finitely many boundary components have individual Cartier multiples; include these witnesses. The descended discrepancy data give lc singularities and klt singularities outside the floor over $bb(C)$. These are exactly the weaker complex hypotheses in Proposition 5; global $bb(Q)$-factoriality of the complex extension is unnecessary. That proposition gives $kappa \( K_V + C \) > 0$ on the complex extension. Equation (7.1) transfers this conclusion first to $upright(bold(k))_0$ and then to $upright(bold(k))$, proving the supported theorem as stated. ◻
]

#thm([Corollary 7.2.])[
  (Abundance after nonvanishing over characteristic-zero fields).  #emph[Let $\( X \, Delta \)$ be a projective lc rational pair of dimension at most four over an algebraically closed field $upright(bold(k))$ of characteristic zero. Suppose that $D = K_X + Delta$ is $bb(Q)$-Cartier and nef and $kappa \( X \, D \) gt.eq 0$. Then $D$ is semiample, and if $kappa \( X \, D \) = 0$, then $D tilde.op_(bb(Q)) 0$.]
] <cor:abundance-after-nonvanishing-fields>

#proof[
  For the four-dimensional assertion, descend the original lc pair and its rational Cartier adjoint $D$, with a log resolution and its discrepancy identities. No separate Cartier property for $K_X$ or the boundary components is needed for this application. The complex extension is lc, $D$ is nef, and its Kodaira dimension is the same. The complex case proved in Section 6 makes one positive Cartier multiple of $D$ generated. Generation in this particular degree descends to $upright(bold(k))_0$ and then extends to $upright(bold(k))$. If $kappa \( D \) = 0$, the generated line bundle has a one-dimensional space of sections; its nonzero generating section is nowhere vanishing. Hence it is trivial, and $D tilde.op_(bb(Q)) 0$ over $upright(bold(k))$.
  For the conditional assertion, keep its smooth canonical nonvanishing premise over $bb(C)$ exactly as stated. Descend a given nef projective lc rational pair over $upright(bold(k))$, extend to $bb(C)$, and apply the conditional complex result there. Its proof may use very general complex fibers and complex minimal models. Only the resulting generation of a fixed positive multiple of the original adjoint is transferred back by Lemma 20. This needs neither very general points over the countable field $upright(bold(k))_0$ nor descent of the auxiliary minimal models, and completes both theorems. ◻
]

#proof[
  First work over $bb(C)$. Fix a Cartier index $r > 0$ for the given nef adjoint $D$. The exact original-variety lc nonvanishing result [27] Corollary 1.2 produces a nonzero section of $m r D$ for some $m > 0$. Thus $kappa \( X \, D \) gt.eq 0$, and Theorem 2 proves semiampleness, with $bb(Q)$-linear triviality when $kappa = 0$. The cited nonvanishing corollary uses smooth fourfold nonvanishing, Hashizume’s reduction, and the independent finite rational-feasibility lemma [27] Lemma 8.1. It supplies a section on the original normal variety and does not use any supported lifting or abundance theorem from this paper.
  Over an arbitrary algebraically closed characteristic-zero field, descend the original pair, a specified Cartier multiple of its adjoint, and a log resolution with its discrepancy identities as in 20. The complex extension is lc and its adjoint is nef. The complex conclusion makes one positive Cartier multiple generated. The evaluation-cokernel argument of that lemma transfers this precise generation to the original field. Kodaira dimension transfers as well. If it is zero, the generated multiple has a one-dimensional space of sections; its nonzero generating section is nowhere vanishing, hence trivializes that line bundle. This proves the stated $bb(Q)$-linear triviality on the original variety. ◻
]

== 8 A conormal–period argument in numerical dimension two <nu2:sec:method>

This section gives an independent use of the boundary: an alternative proof of the following restricted canonical statement.

#thm([Theorem 8.1.])[
  (The curve-base alternative).  #emph[Let $X$ be a smooth connected projective complex fourfold. If its canonical divisor $K_X$ is nef and $kappa \( X \, K_X \) = 0$, then $nu \( K_X \) eq.not 2$.]
] <nu2:thm:alternative>

Here $nu$ denotes the intersection-theoretic numerical dimension of a nef divisor. The effective divisor used below comes from the section supplied by $kappa = 0$. No condition on the irregularity or the Euler characteristic is imposed. The statement concerns the actual canonical divisor on a smooth variety; it is not a nonvanishing assertion for $kappa = - oo$ or a statement for arbitrary klt pairs.

The proof has three parts. First, a dimension-preserving effective MMP puts the pluricanonical support on a reduced boundary whose adjoint defines a pencil. Second, root covers turn the obstruction to lifting through a nilpotent thickening into a period equation on that curve. Positivity of the source line kills its moving part; a separate trace test kills classes supported at exceptional parameters. Finally, finite invariant filtrations convert lifting into a quadratic lower bound for plurisections, contradicting $kappa = 0$.

The use of cyclic covers, infinitesimal neighborhoods and Hodge duality continues a method in Kawamata’s alternative proof of the numerical- dimension-one case for minimal threefolds [16] Section 4, Theorem 4.1 and Lemmas 4.2–4.3. That result supplies the ancestry of this method, rather than the fourfold assertion of Theorem 22.

=== 8.1 The reduced boundary and a genuine pencil <nu2:subsec:reduction>

Suppose that $nu \( K_X \) = 2$. A nonzero pluricanonical section gives $0 eq.not D_X tilde.op_(bb(Q)) K_X$, with $D_X gt.eq 0$. On a log resolution $p : Y arrow.r X$, let $T$ be its reduced strict-transform support, let $E_Y$ be the reduced exceptional divisor, and write $K_Y = p^(*) K_X + F$, with $F gt.eq 0$ exceptional. Then

$ K_Y + T + E_Y tilde.op_(bb(Q)) D_Y := p^(*) D_X + F + T + E_Y \, #h(2em) "Supp" D_Y = T + E_Y . $

For some rational $c > 0$, $p^(*) D_X lt.eq D_Y lt.eq \( 1 + c \) p^(*) D_X + F + E_Y$. Monotonicity, birational invariance and exceptional invariance of $kappa$ and Nakayama’s $kappa_sigma$ therefore give dimensions $0$ and $2$ for this effective log adjoint [25] v1, Lemma 2.5 and proof of Lemma 4.1. Effective fourfold minimal-model existence and termination with scaling give a projective $bb(Q)$-factorial dlt model [24] Corollary D(i), Lemma 2.9(i), [5] Theorem 4.1(ii),(iii):

#[#set math.equation(numbering: n => "(8.1)")
 $ A = K_V + B tilde.op_(bb(Q)) D gt.eq 0 \, quad B = B_(upright("red")) = "Supp" D \, quad A upright(" nef") \, quad kappa \( V \, A \) = 0 \, quad nu \( A \) = 2 . $ <nu2:eq:model>]

Choose the scaling boundary to contain a fixed ample rational divisor. For a positive limiting scaling parameter, the dlt pair and this ampleness hypothesis allow the first termination clause; limit zero with every parameter positive uses the already obtained log minimal model and the second clause; an attained zero means the current adjoint is nef. The nonextracting MMP preserves the displayed support and both dimensions. The underlying $V$ is klt.

The sheaves $cal(O)_V$ and $cal(O)_V \( - B \)$ are Cohen–Macaulay by the local vanishing theorem for integral $bb(Q)$-Cartier divisors on a klt variety [22] Theorem 2 and Example 4.1. Their quotient shows that $B$ is a Cohen–Macaulay threefold. Adjunction on the whole union, including conductor gluing on its normalization, gives an slc pair $\( B \, Delta_B \)$ with $K_B + Delta_B = A \|_B$. Threefold slc abundance makes this restriction semiample [10] Theorem 0.1. Write $D = sum c_i B_i$, $c_i > 0$, and choose an ample divisor $H$. Then

$ 0 = A^3 H = sum_i c_i A^2 B_i H \, #h(2em) 0 < A^2 H^2 = sum_i c_i A B_i H^2 . $

All summands are nonnegative. The image of a generated multiple on each $B_i$ consequently has dimension at most one, and one component has one-dimensional image. Two general linear forms with common center disjoint from this image generate the restricted line bundle everywhere, including components mapped to points. After fixing one divisible integer $q$, we obtain

#[#set math.equation(numbering: n => "(8.2)")
 $ G = sum_i d_i B_i tilde.op q A \, quad d_i in bb(Z)_(> 0) \, #h(2em) L = cal(O)_V \( G \) \, #h(2em) L \|_B tilde.eq f^(*) cal(O)_(bb(P)^1) \( 1 \) \, $ <nu2:eq:pencil>]

where $f : B arrow.r bb(P)^1$ is surjective. Its fibers need not be connected. This is a morphism of the boundary; no ambient fibration is required.

=== 8.2 Root covers and the two conormal frames <nu2:subsec:roots>

The pencil exists only on $B$. We now construct local covers on which its conormal line and absolute dualizing line have compatible frames. The construction must retain the entire reduced divisor, including components over individual parameter values.

Fix $r$ divisible by $q$ and every $d_i$, and put $a = r \/ q > 0$. These integers will not vary with the infinitesimal order. Near a compact reduced fiber of $f$, choose a disk $U$ and a frame $ell$ of $cal(O) \( 1 \) \|_U$. There is an analytic neighborhood $W$ of $B_U$, a root $P^r tilde.eq L \|_W$, and a boundary frame $p$ with $p^r = f^(*) ell$. Indeed choose a simultaneous triangulation compatible with the fiber and boundary [7] Theorem 1.10. In successive barycentric subdivisions take the open stars of the compact fiber subcomplex. Their regular-neighborhood retractions preserve the boundary subcomplex. These stars are cofinal among neighborhoods of the fiber, giving arbitrarily small $W$ for which $W$ and $W ∩ B$ retract compatibly onto it. The retractions are the elementary regular-neighborhood consequence of the triangulation, not an additional assertion of the cited triangulation theorem. The Kummer obstruction in $H^2 \( W \, mu_r \)$ vanishes because $L$ is trivial on that fiber. Twisting the root by a $mu_r$-torsor, using the corresponding $H^1$ isomorphisms, gives the prescribed boundary frame. Properness then permits shrinking $U$.

Put $Q = omega_V \( B \)$ and $M = Q ⊗ P^(- a)$, with reflexive powers understood; $M^(\[ q \]) tilde.eq cal(O)_W$. Normalize the full fiber product of the cyclic algebras

$ xor.big_(i = 0)^(r - 1) P^(- i) \, #h(2em) xor.big_(j = 0)^(q - 1) M^(\[ - j \]) . $

The first multiplication uses the section defining $G$, and the second uses this specified power trivialization. Retaining every component gives a finite cover $pi : Z arrow.r W$ with group $mu_r times mu_q$ and quotient $W$. Its tautological section $y$ has reduced Cartier zero divisor $E$; the ramification over $B_i$ is $r \/ d_i$, and the second cover is unramified in codimension one. The two Hurwitz formulas are

$ K_Z = pi^(*) (K_V + sum_i \( 1 - d_i \/ r \) B_i) \, #h(2em) K_Z + E = pi^(*) \( K_V + B \) . $

The finite-map discrepancy rule gives klt $Z$ and lc $\( Z \, E \)$ [23] Proposition 5.20. In this setting it follows by exposing any divisorial valuation downstairs, normalizing its finite pullback, and using the DVR Hurwitz coefficient $e - 1$: $A_(upright("up")) \( F \) = e A_(upright("down")) \( E_0 \)$ for a divisor $F$ above $E_0$, where $A$ denotes log discrepancy for the corresponding Hurwitz pairs. For the second displayed formula these are $\( Z \, E \)$ and $\( V \, B \)$. For the first they are $Z$ with zero boundary and $V$ with boundary $sum_i \( 1 - d_i \/ r \) B_i$; the latter is klt because every coefficient of the reduced dlt boundary has been lowered. Thus the lc and klt inequalities hold for all divisorial valuations. The torsion root gives actual isomorphisms

#[#set math.equation(numbering: n => "(8.3)")
 $ omega_Z \( E \) tilde.eq \( pi^(*) P \)^a tilde.eq cal(O)_Z \( a E \) \, #h(2em) omega_E tilde.eq cal(O)_E \( a E \) . $ <nu2:eq:adjunction>]

Klt Cohen–Macaulayness makes $Z$ Gorenstein; Cartier adjunction makes $E$ Gorenstein. The normalized adjunction pair has conductor coefficient one at nodes and coefficient zero at regular codimension-one points, so $E$ is slc [20] Lemma 11.16 and Theorem 11.17. As a reduced union of lc centers it is Du Bois [21] Theorem 1.4.

The reduced families used here are algebraic, also through exceptional parameters. One explicit construction performs the two normalized cyclic constructions over the root gerbe $root(r, L \/ V) = \[ L^times \/ bb(G)_m \]$, where $lambda$ acts by $lambda^r$. An object over a map $h : S arrow.r V$ is a line bundle $P_S$ together with an isomorphism $P_S^r tilde.eq h^(*) L$. Over $B_U$, the trivial line with power identification given by $f^(*) ell$ defines the selected morphism $sigma : B_U arrow.r root(r, L \/ V) \|_(B_U)$. Pull back along $sigma$ the reduced divisor of the already normalized cover. Thus the normalization precedes this restriction. The root-gerbe description is standard [1] Definition 2.2 and Proposition 2.3; on the possibly singular $V$ it follows from the same local line-bundle trivializations. The normalization and singularity comparisons used here are given by the following local construction. Locally the substitution $v = w^r$ in the frame parameter identifies the construction with a fixed normalized cover times that parameter; normalization commutes with this étale localization. It does not require normalization to commute with restriction to $B$. A specified boundary root gives a finite étale section of the root gerbe: its pullback along any other root is the finite étale torsor of power-compatible isomorphisms. Pulling the reduced divisor back by this section preserves its total-space singularity properties. The resulting $E_U arrow.r U$ comes from a projective algebraic family with reduced pure three-dimensional Gorenstein Du Bois total space.

Globally take a finite cover $rho : T' arrow.r bb(P)^1$ with a positive line $R$ satisfying $R^r = rho^(*) cal(O) \( 1 \)$; the degree-$r$ power map with $T' = bb(P)^1$ and $R = cal(O) \( 1 \)$ suffices. The same construction produces a reduced algebraic family $g' : E' arrow.r T' ""^compose$ on a nonempty open $T' ""^compose$. Remove branch values, vertical-component images and the finitely many parameters needed for flatness, slc surface fibers, coherent base change and topological local systems. Keep the original families through the removed points. In what follows, a good disk, annulus or locus lies inside the specified open on which these flatness, base-change and local-system properties hold, or its corresponding open in a local chart family. An isomorphism between specified boundary roots extends uniquely as a germ near a compact fiber, since its isomorphism sheaf is a finite $mu_r$-torsor and the retractions preserve its sections. These germ isomorphisms respect every actual ideal power and its connecting map. They give the cocycles comparing all local root choices with the one family on $T' ""^compose$.

Set $I = cal(O)_Z \( - E \)$ and $cal(A)_j = I^j \/ I^(j + 1)$ for every $j in bb(Z)$. The frame $p$ gives the graded conormal frame $u = y \/ p$ of $cal(A)_1$; no ambient lift of $u$ is chosen. Under (8.3), $u^(- a)$ is an absolute dualizing frame $Omega$ of $omega_E$. A change of base root frame has $p' = lambda p$, where $lambda$ is a nowhere-vanishing holomorphic function of the base coordinate. Under this change,

#[#set math.equation(numbering: n => "(8.4)")
 $ u' = lambda^(- 1) u \, #h(2em) Omega' = lambda^a Omega . $ <nu2:eq:frames>]

At branch parameters the factors comparing an extending frame of $R$ with these root frames are full-disk holomorphic units, bounded with their inverses on a smaller disk.

=== 8.3 The Hodge test, including classes supported at a point <nu2:subsec:hodge>

The moving period equation alone cannot detect a class supported over one parameter. The following test supplies both the growth estimate needed on the punctured curve and detection at the omitted points.

#thm([Lemma 8.2.])[
  (Curve Hodge and supported trace test).  #emph[Let $p : Y arrow.r T$ be projective, where $T$ is a smooth complex algebraic curve and $Y$ is a reduced, pure three-dimensional, Cohen–Macaulay Du Bois variety. Components of $Y$ may map to points. On an open $T^compose$ with flat Du Bois surface fibers, coherent base change and topological local systems, put $bb(H) = R^1 p_(*) bb(Q)$. Then 
#[#set math.equation(numbering: n => "(8.5)")
 $ R^1 p_(*) omega_Y = omega_T ⊗ F^0 cal(H)^or \, #h(2em) F^1 cal(H)^or = 0 quad upright("on ") T^compose \, $ <nu2:eq:hodge>]

 where $cal(H) = bb(H) ⊗ cal(O)$. For a flat local section $alpha$ of $bb(H) ⊗ bb(C)$, let $alpha_(cal(O))$ be its image in $R^1 p_(*) cal(O)_Y$. The functional corresponding to $s$ is $alpha mapsto chevron.l s \/ d t \, alpha_(cal(O)) chevron.r$ under relative Serre duality. The variation is graded-polarizable and admissible, with quasi-unipotent monodromy. A section $s$ extending over a missing parameter obeys 
#[#set math.equation(numbering: n => "(8.6)")
 $ chevron.l s \/ d t \, alpha_(cal(O)) chevron.r = O #scale(x: 120%, y: 120%)[\(] \| t \|^(- 1) \( 1 + \| log \| t \| \| \)^N #scale(x: 120%, y: 120%)[\)] $ <nu2:eq:one-pole>]

 in flat frames on bounded-argument sectors. Moreover, a germ of $R^1 p_(*) omega_Y$ supported at a point is zero if its absolute trace annihilates the image of $H_c^2 \( Y_U \, bb(C) \) arrow.r H_c^2 \( Y_U \, cal(O)_Y \)$ on one sufficiently small disk $U$. Neither assertion at the missing point requires a flat map or a reduced Du Bois central fiber.]
] <nu2:lem:hodge-test>

#proof[
  We verify the filtered comparison first, then the growth estimate and the supported-class assertion. Use increasing filtrations on right $cal(D)_T$-modules. The symbol $bb(Q)_Y^H$ denotes the unshifted constant object in the derived category of mixed Hodge modules, with rational realization $bb(Q)_Y$; it need not be a single perverse Hodge module. Write $bb(D)$ for Verdier duality in that category and set $N = R p_(*) bb(Q)_Y^H$ and $P = bb(D) N$. Let $cal(M)_i$ be the right module underlying the $i$th Hodge-module cohomology of $P$. For this calculation we reset the convention used for the earlier boundary-graph modules: there is no dimension-dependent Tate twist of the constant object here. The lowest index computed below comes from this unshifted constant object and its dual, and the variations retain their ordinary decreasing Hodge filtration. For a point $x in T$, write $i_x : { x } arrow.r.hook T$. The constant/Du Bois comparison and filtered proper duality [31,33,36], with the Du Bois comparison [34] preprint, Corollary 0.3, Section 5.3, (5.3.2), and Section 5.4, (5.4.1), give
  $ "gr"_j^F "DR" \( P \) = 0 med \( j < 0 \) \, #h(2em) "gr"_0^F "DR" \( P \) = R p_(*) omega_Y \[ 3 \] . $
  Only finitely many $cal(M)_i$ occur locally, and their good filtrations have a common lower bound. The truncation spectral sequence of coherent cohomology sheaves is
  $ E_2^(u \, v) = cal(H)^u #scale(x: 120%, y: 120%)[\(] "gr"_j^F "DR" \( cal(M)_v \) #scale(x: 120%, y: 120%)[\)] med arrow.r.double med cal(H)^(u + v) #scale(x: 120%, y: 120%)[\(] "gr"_j^F "DR" \( P \) #scale(x: 120%, y: 120%)[\)] . $
  At the lowest possible filtration index, the curve de Rham complex has only its degree-zero term $F_j cal(M)_v$. The sole column $u = 0$ therefore survives unchanged. The abutment is zero for $j < 0$, so these lowest pieces vanish. Ascending through the negative grades repeats this argument; at $j = 0$ the abutment in degree $v$ is $R^(v + 3) p_(*) omega_Y$. We obtain
  #[#set math.equation(numbering: n => "(8.7)")
   $ F_(< 0) cal(M)_i = 0 \, #h(2em) F_0 cal(M)_i = R^(i + 3) p_(*) omega_Y . $ <nu2:eq:lowest>]
  No splitting of $P$ is used. On $T^compose$, duality turns the variation of $cal(M)_(- 2)$ into $bb(H)^or \( 1 \)$; the right module shift gives (8.5). Degree-one proper cohomology has only types $\( 0 \, 0 \) \, \( 1 \, 0 \) \, \( 0 \, 1 \)$, proving $F^1 = 0$.
  Put $cal(M) = cal(M)_(- 2)$ and fix a coordinate $t$ at an exceptional parameter $x$. We use the increasing right-module $V$-filtration, so $t$ lowers its index and $partial_t$ raises it. First, for every $alpha > 0$, strict specializability gives
  $ F_0 "gr"_alpha^V cal(M) = partial_t #scale(x: 120%, y: 120%)[\(] F_(- 1) "gr"_(alpha - 1)^V cal(M) #scale(x: 120%, y: 120%)[\)] = 0 \, $
  where the last equality follows from (8.7). The exhaustive, locally discrete $V$-filtration then gives $F_0 cal(M) subset V_0 cal(M)$: any positive leading $V$-grade of an $F_0$ section would contradict the displayed vanishing. The localized image lies in the Deligne lattice whose flat coefficients have the form $t^(- 1 + lambda) \( log t \)^j h \( t \)$, with $0 lt.eq lambda < 1$ and $h$ holomorphic. This proves (8.6).
  At grade zero, the required strictness has a different formulation; no surjectivity of the exceptional map is assumed. Write
  $ Psi = #scale(x: 120%, y: 120%)[\(] "gr"_(- 1)^V cal(M) \, F_(bullet - 1) #scale(x: 120%, y: 120%)[\)] \, #h(2em) Phi = #scale(x: 120%, y: 120%)[\(] "gr"_0^V cal(M) \, F_bullet #scale(x: 120%, y: 120%)[\)] . $
  These underlie the unipotent nearby and vanishing mixed Hodge modules. Their canonical morphisms are
  $ upright("can") = partial_t : Psi arrow.r Phi \, #h(2em) upright("var") = t : Phi arrow.r Psi \( - 1 \) . $
  For increasing filtrations our Tate convention is $F_p \( cal(H) \( k \) \) = F_(p - k) cal(H)$. Thus $F_p Psi \( - 1 \) = F_p "gr"_(- 1)^V cal(M)$; the Tate twist belongs to $upright("var")$, not to $upright("can")$. The mixed-Hodge-module construction and strictness apply without a pure decomposition [31]; the precise filtered formulas are [36] v1, (9.3), Sections 20–21, and (30.3)–(30.4). Strictness of $upright("can")$ says, for each integer $p$,
  $ F_p "gr"_0^V cal(M) ∩ "im" \( partial_t \) = partial_t #scale(x: 120%, y: 120%)[\(] F_(p - 1) "gr"_(- 1)^V cal(M) #scale(x: 120%, y: 120%)[\)] . $
  Taking $p = 0$ and again using $F_(- 1) cal(M) = 0$ proves
  #[#set math.equation(numbering: n => "(8.8)")
   $ F_0 "gr"_0^V cal(M) ∩ "im" #scale(x: 120%, y: 120%)[\(] partial_t : "gr"_(- 1)^V cal(M) arrow.r "gr"_0^V cal(M) #scale(x: 120%, y: 120%)[\)] = partial_t F_(- 1) "gr"_(- 1)^V cal(M) = 0 . $ <nu2:eq:strict>]
  We now apply this identity to a point-supported germ $s in F_0 cal(M)$. Some power of $t$ kills $s$. Its image in $"gr"_0^V cal(M)$ is nonzero unless $s = 0$, since $t$ is injective on $V_(< 0) cal(M)$. If $s = u partial_t$ were a de Rham boundary, consider a nonzero leading $V$-grade $beta > - 1$ of $u$. The isomorphism $partial_t : "gr"_beta^V cal(M) arrow.r "gr"_(beta + 1)^V cal(M)$ would give a nonzero positive grade of $s$, contradicting $s in V_0 cal(M)$. Descending through the finitely many jumps between an index containing $u$ and $- 1$ puts $u$ in $V_(- 1) cal(M)$. The grade-zero class of $s$ would then belong to the intersection in (8.8), which is impossible for nonzero $s$.
  Equivalently, the local inverse-image complex is
  $ i_x^(*) "DR" \( cal(M) \) tilde.eq #scale(x: 120%, y: 120%)[\[] "gr"_(- 1)^V cal(M) arrow.r^(med partial_t med) "gr"_0^V cal(M) #scale(x: 120%, y: 120%)[\]] \, #h(2em) upright("in degrees ") - 1 \, 0 \, $
  with the source and target filtrations of $Psi$ and $Phi$ [36] (30.3). A supported $F_0$ germ therefore injects into $H^0 \( i_x^(*) "DR" cal(M) \)$. Finally, the perverse-cohomology spectral sequence is
  $ E_2^(p \, q) = H^p \( i_x^(*) "DR" cal(M)_q \) med arrow.r.double med H^(p + q) \( i_x^(*) "DR" P \) \, #h(2em) p in { - 1 \, 0 } . $
  All other columns vanish on a curve, so no higher differential enters or leaves them. For $cal(M) = cal(M)_(- 2)$ its edge sequence is
  $ 0 arrow.r H^0 \( i_x^(*) "DR" cal(M)_(- 2) \) arrow.r H^(- 2) \( i_x^(*) "DR" P \) arrow.r H^(- 1) \( i_x^(*) "DR" cal(M)_(- 1) \) arrow.r 0 . $
  This supplies the desired injection without splitting $P$.
  We specify the comparison with trace, since detection of a supported class requires the actual pairing. Let $U$ be a sufficiently small disk. The Du Bois comparison identifies the natural map $iota : R p_(*) bb(C)_Y arrow.r R p_(*) cal(O)_Y$ with the roof
  $ "DR" \( N \) med arrow.l^(med tilde.eq med) F_0 "DR" \( N \) arrow.r "gr"_0^F "DR" \( N \) . $
  Filtered transpose duality identifies its transpose with
  #[#set math.equation(numbering: n => "(8.9)")
   $ gamma : R p_(*) omega_Y \[ 3 \] tilde.eq "gr"_0^F "DR" \( P \) tilde.eq F_0 "DR" \( P \) arrow.r "DR" \( P \) . $ <nu2:eq:trace-comparison>]
  The middle identification uses the vanishing of the negative graded pieces, so it is an identification in the filtered derived comparison, not a choice of a splitting. Under proper duality and Verdier duality the induced map is
  $ H^1 \( Y_U \, omega_Y \) arrow.r^(med gamma med) H^(- 2) \( U \, "DR" \( P \) \) tilde.eq H_c^2 \( Y_U \, bb(C) \)^or \, $
  and its pairing is exactly
  #[#set math.equation(numbering: n => "(8.10)")
   $ chevron.l gamma \( s \) \, alpha chevron.r_(upright("Verdier")) = "Tr"_(upright("coh")) \( s smile iota \( alpha \) \) . $ <nu2:eq:trace-pairing>]
  This is the compatibility of filtered transpose duality with coherent and topological trace [33] Sections 2.6–2.12 and 3.7–3.13. Shrink $U$ within a constructibility neighborhood of its center. The preceding supported-germ injection, the two-row perverse-stalk spectral sequence, and (8.9) then identify a nonzero supported $s$ with a nonzero class in the displayed finite-dimensional constructible cohomology group. Verdier duality detects it by some $alpha in H_c^2 \( Y_U \, bb(C) \)$. Thus annihilating all the stated coherent images forces $s = 0$ by (8.10). This proof neither asserts that arbitrary coherent compact-support cohomology is Hausdorff nor that the map from constant-sheaf cohomology onto it is surjective. ◻
]

The annular form of the same pairing will produce the differential equation. On a good annulus $S$ in a simply connected good disk, compact-support Leray gives

$ H_c^2 \( Y_S \, bb(C) \) arrow.r.twohead H_c^1 \( S \, R^1 p_(*) bb(C) \) \, $

with kernel $H_c^2 \( S \, R^0 p_(*) bb(C) \)$. Its coherent image factors through $H_c^2 \( S \, p_(*) cal(O)_Y \) = 0$: the annulus is a Stein curve, and this coherent compact-support group vanishes above degree one. Compatibility of the Leray pairings with trace therefore kills the kernel. The lift of a circle-dual class tensored with a flat $alpha$ consequently tests $s$ by $integral.cont chevron.l s \/ d t \, alpha_(cal(O)) chevron.r thin d t$, up to one fixed nonzero normalization. The test is independent of its lift.

=== 8.4 The period equation and all-order lifting <nu2:subsec:lifting>

Let $g : E arrow.r U$ be any one of the local full covers above. Push $I^j \/ I^(j + k)$ forward by the underlying continuous map, as sheaves of complex vector spaces. This convention does not posit a holomorphic map from a thickening to $U$. We prove simultaneously for every $j in bb(Z)$, every $k gt.eq 1$, every parameter point and every permitted root choice that

#[#set math.equation(numbering: n => "(8.11)")
 $ g_(*) \( I^j \/ I^(j + k + 1) \) arrow.r g_(*) \( I^j \/ I^(j + k) \) quad upright("is surjective") . $ <nu2:eq:lifting>]

At each fixed order neighborhoods may shrink.

Assume the earlier orders. The current connecting map factors uniquely through the leading layer as $delta_k^j : g_(*) cal(A)_j arrow.r R^1 g_(*) cal(A)_(j + k)$: the kernel of the leading-layer map lifts by the preceding induction step. Shorter truncation images have finite filtrations by coherent $g_(*) cal(A)_i$. Acyclicity on small disks and annuli gives leading-section lifts on those entire opens. The overlap difference of products has double-error term of order $2 k gt.eq k + 1$; hence the collection $delta_k = \( delta_k^j \)_(j in bb(Z))$ is one $bb(C)$-linear graded derivation. This remains true in negative degrees because $I$ is invertible. Define $e \, b in R^1 g_(*) cal(O)_E$ on the full disk by

$ delta_k \( t \) = e u^k \, #h(2em) delta_k \( u \) = b u^(k + 1) \, #h(2em) m = a + k > 0 . $

On the good locus the derivation rule, evaluated in each locally free fiber, gives $delta_k \( h \) = h' e u^k$ for holomorphic $h$. Consequently

#[#set math.equation(numbering: n => "(8.12)")
 $ delta_k \( h u^(- m) \) = \( h' e - m h b \) Omega . $ <nu2:eq:obstruction>]

Every value of this last obstruction annihilates the constant-sheaf tests, on good annuli and on disks through exceptional points. Indeed its exact sequence is

$ 0 arrow.r omega_E arrow.r omega_(\( k + 1 \) E) arrow.r I^(- a - k) \/ I^(- a) arrow.r 0 \, #h(2em) omega_(\( k + 1 \) E) = I^(- a - k) \/ I^(1 - a) . $

The first map is dual to reduction of structure sheaves. An obstruction class maps to zero in the middle term; absolute coherent trace is functorial for this closed embedding [29] §§3–5. Since $bb(C)_E arrow.r cal(O)_(\( k + 1 \) E) arrow.r cal(O)_E$ lifts the constant test, the pairing is zero. Only the reduced algebraic family is subjected to Hodge theory; the nilpotent thickening enters through this analytic duality.

Define functional-valued periods $beta_e \( alpha \) = chevron.l e Omega \/ d t \, alpha_(cal(O)) chevron.r$ and $beta_b \( alpha \) = chevron.l b Omega \/ d t \, alpha_(cal(O)) chevron.r$. The annular trace of (8.12) is

$ integral.cont \( h' beta_e - m h beta_b \) thin d t = 0 . $

Functions $h$ may have poles at the omitted center because the required lifts exist on the annulus. Integration by parts and the test $h = \( t - c \)^(- 1)$ give the decisive equation

#[#set math.equation(numbering: n => "(8.13)")
 $ nabla beta_e = - m beta_b thin d t . $ <nu2:eq:period>]

Write $dot(lambda) = d lambda \/ d t$ for a base-frame change as in (8.4). The derivation gives

$ e' = lambda^k e \, quad b' = lambda^k b - lambda^(k - 1) accent(lambda e, ̇) \, quad beta'_e = lambda^m beta_e \, quad beta'_b = lambda^m beta_b - lambda^(m - 1) dot(lambda) beta_e . $

Coordinate Jacobians cancel between $delta_k \( t \)$ and $Omega \/ d t$. The actual root-germ cocycles therefore glue the obstruction to

#[#set math.equation(numbering: n => "(8.14)")
 $ R^m \|_(T' ""^compose) arrow.r F^0 #scale(x: 120%, y: 120%)[\(] \( R^1 g'_(*) bb(Q) \)^or ⊗ cal(O)_(T' ""^compose) #scale(x: 120%, y: 120%)[\)] . $ <nu2:eq:positive-map>]

Both periods lie in $F^0$, so (8.13) says this map is killed by the Higgs field.

Before current-order vanishing, $b Omega$ is already a holomorphic section of $R^1 g_(*) omega_E$ on each original full disk. Comparison with its algebraic family, valid also for arbitrary holomorphic frames, gives (8.6) for $beta_b$. Radial integration of (8.13) gives

$ beta_e = O #scale(x: 120%, y: 120%)[\(] \( 1 + \| log \| t \| \| \)^(N + 1) #scale(x: 120%, y: 120%)[\)] . $

Finite substitutions and the full-disk unit factors preserve this bound in a frame of $R^m$ extending over each puncture. At a branch point, compare on the good punctured overlap, where $t = t \( w \)$ is unramified. Write $Omega_t$ for the absolute residue form in the original family and $Omega_w$ for its transported class there. Then $Omega_w \/ d w = \( d t \/ d w \) Omega_t \/ d t$, whereas the derivation coefficient satisfies $e_w = \( d t \/ d w \)^(- 1) e_t$. The factors cancel. Thus the bound from the original full disk, after finite substitution and the full-disk unit comparison of source frames, introduces no extra pole.

We now use the positivity of the line $R^m$ on the compact curve. More generally, a Higgs-killed map from a positive line to $F^0$ of a graded-polarizable rational mixed variation with $F^1 = 0$ and quasi-unipotent monodromy is zero when its coefficients have the logarithmic-power bound in frames of that line extending over every puncture. To prove this assertion, suppose the map is nonzero and choose the least $w$ for which the image is generically in $W_w$; holomorphicity makes this containment global. Projection to $"gr"_w^W$ is nonzero. Flatness of $W_w$ preserves the derivative condition, and a flat basis adapted to $W$ preserves the coefficient bound. Equip the chosen pure highest Hodge bundle with its Hodge metric $H$, and denote its Chern connection by $D$. For a local image section $s$, let $pi_s$ be orthogonal projection onto the line spanned by $s$, away from its zeros. Highest-step curvature gives

$ partial_t partial_(macron(t)) log parallel s parallel_H^2 = frac(parallel \( 1 - pi_s \) D_(partial_t) s parallel_H^2, parallel s parallel_H^2) gt.eq 0 $

[14] Theorem (5.2), Lemmas (4.9),(4.13). The incoming Higgs term is absent and the outgoing term vanishes; no flatness of the image line is asserted. A constant Tate twist handles negative Hodge indices. Schmid’s estimate after killing the finite monodromy part bounds flat-vector Hodge norms by powers of logarithms [35] Theorem (6.6$'$). Thus, relative to a positive-curvature metric on the source line, the logarithmic norm ratio $v$ has $sqrt(- 1) partial accent(partial v, ‾) gt.eq omega_R > 0$ and upper growth $O \( log \( 1 + log \( 1 \/ \| t \| \) \) \)$. Subtract a local potential for $omega_R$ and then $epsilon.alt log \( 1 \/ \| t \| \)$. The maximum principle on shrinking annuli, followed by $epsilon.alt arrow.b 0$, gives a subharmonic extension preserving this inequality. Interior zeros contribute nonnegative point masses. Integration over the compact curve contradicts $deg R^m > 0$.

Perfect relative Serre duality now gives $e = 0$ on the good locus; (8.13) and $m > 0$ give $b = 0$. There $g_(*) cal(O)_E$ is locally a product of copies of $cal(O)_U$: the primitive idempotents of $R^0 g_(*) bb(C)$ split the proper reduced fibers into connected pieces, and base change identifies each piece’s functions with $cal(O)_U$. A derivation kills idempotents and, by $e = 0$, curve functions. It therefore kills every leading section in every degree. At an exceptional parameter, each value of $delta_k^(- m)$ is now point-supported and annihilates the constant tests. The Hodge test above makes it zero. Applying this to $u^(- m)$ first gives $b = 0$; applying it to $f_0 u^(- m)$ for an arbitrary $f_0 in g_(*) cal(O)_E$ gives $delta_k \( f_0 \) = 0$. This includes functions on vertical components, not only pullbacks from $U$. The Laurent-power rule kills every degree and completes the simultaneous induction (8.11).

=== 8.5 Finite descent and the quadratic count <nu2:subsec:count>

All conormal lifting obstructions have vanished. We descend only finite collections of layers and count their global sections. This avoids any assertion about convergence of a formal splitting.

For every signed integer $j$ define

$ J_j = cal(O)_V (- ⌈j G \/ r⌉) \, #h(2em) cal(B)_j = J_j \/ J_(j + 1) \, #h(2em) F_j = f_(*) cal(B)_j . $

On the full cover with deck group $H$, $\( pi_(*) I^j \)^H = J_j$: the valuation condition is $\( r \/ d_i \) "ord"_(B_i) \( h \) gt.eq j$, equivalently $"ord"_(B_i) \( h \) gt.eq ceil.l j d_i \/ r ceil.r$. Normality checks these divisorial sheaves in codimension one. Since $0 < d_i \/ r lt.eq 1$, consecutive ceiling differences are zero or one; hence $cal(B)_j$ is a coherent sheaf on the reduced $B$. Exactness of finite pushforward and of finite-group invariants, and averaging of the lifts in (8.11), give finite filtrations of $f_(*) \( J_l \/ J_m \)$ with full coherent quotients $F_j$, for every $l < m$. The total filtered sheaf is only required to be a sheaf of complex vector spaces.

Cartier periodicity and (8.2) give $J_(j - r) = J_j ⊗ cal(O)_V \( G \)$ and $F_(j - r) = F_j \( 1 \)$. For a coherent $Q$ on $bb(P)^1$, a point outside its torsion support gives $0 arrow.r Q \( b - 1 \) arrow.r Q \( b \) arrow.r bb(C)_x^("rk" Q) arrow.r 0$; thus $chi \( Q \( b \) \) = chi \( Q \) + b "rk" Q$ for every integer $b$. Finite-filtered cohomology is additive, vanishes above degree one, and satisfies $h^0 gt.eq chi$. Consequently

#[#set math.equation(numbering: n => "(8.15)")
 $ h^0 \( V \, J_(- n r) \/ J_0 \) & gt.eq sum_(j = - n r)^(- 1) chi \( F_j \)\
 & = n sum_(ell = 0)^(r - 1) chi \( F_ell \) + frac(n \( n + 1 \), 2) sum_(ell = 0)^(r - 1) "rk" F_ell . $ <nu2:eq:quadratic-count>]

Here $cal(B)_0 = cal(O)_B$ and the surjectivity of $f$ gives $"rk" F_0 gt.eq 1$. Passing through $0 arrow.r cal(O)_V arrow.r cal(O)_V \( n G \) arrow.r J_(- n r) \/ J_0 arrow.r 0$ loses at most the fixed number $h^1 \( V \, cal(O)_V \)$. In particular, the coefficient of $n^2$ in this lower bound is exactly $1 / 2 sum_(ell = 0)^(r - 1) "rk" F_ell > 0$; all remaining terms are linear or constant. Thus $h^0 \( V \, cal(O)_V \( n G \) \)$ has positive quadratic growth, contradicting $G tilde.op q A$ and $kappa \( V \, A \) = 0$ in (8.1). Every count uses only finitely many infinitesimal orders; no convergent formal neighborhood or one neighborhood valid at all orders is needed. This proves Theorem 22.

#heading(level: 1)[References]
#bibitem([1])[Elena Andreini, Yunfeng Jiang and Hsian-Hua Tseng. #emph[Gromov--Witten theory of root gerbes I: structure of genus $0$ moduli spaces]. Journal of Differential Geometry #strong[99] (2015), no.~1, 1--45. #link("https://doi.org/10.4310/jdg/1418345536")[doi:10.4310/jdg/1418345536]. #link("https://arxiv.org/abs/0907.2087")[Referenced arXiv version].]
#bibitem([2])[E.~Bierstone and P.~D.~Milman, #emph[Functoriality in resolution of singularities], Publ. Res. Inst. Math. Sci. #strong[44] (2008), no.~2, 609--639. #link("https://doi.org/10.2977/PRIMS/1210167338")[doi:10.2977/PRIMS/1210167338].]
#bibitem([3])[C.~Birkar, #emph[On existence of log minimal models], Compos. Math. #strong[146] (2010), no.~4, 919--928. #link("https://doi.org/10.1112/S0010437X09004564")[doi:10.1112/S0010437X09004564].]
#bibitem([4])[C.~Birkar, #emph[On existence of log minimal models II], J. Reine Angew. Math. #strong[658] (2011), 99--113. #link("https://doi.org/10.1515/crelle.2011.062")[doi:10.1515/crelle.2011.062].]
#bibitem([5])[Caucher Birkar. #emph[Existence of log canonical flips and a special LMMP]. Publications Mathématiques de l'IHÉS #strong[115] (2012), 325--368. #link("https://doi.org/10.1007/s10240-012-0039-5")[doi:10.1007/s10240-012-0039-5]. #link("https://arxiv.org/abs/1104.4981v3")[Referenced arXiv version].]
#bibitem([6])[Tsz On Mario Chan and Young-Jun Choi. Extension with log-canonical measures and an improvement to the plt extension of Demailly--Hacon--Păun. #link("https://arxiv.org/abs/1912.08076v5")[arXiv:1912.08076v5], 17 March 2021. #link("https://doi.org/10.1007/s00208-021-02152-3")[doi:10.1007/s00208-021-02152-3]. Theorem locators refer to the specified preprint version.]
#bibitem([7])[Michel Coste. #emph[Real algebraic sets]. In #emph[Arc Spaces and Additive Invariants in Real Algebraic and Analytic Geometry], Panoramas et Synthèses, vol.~24, Société Mathématique de France, 2007, pp.~1--32. #link("https://perso.univ-rennes1.fr/michel.coste/polyens/RASroot.pdf")[Public text]. Theorem numbering follows the #link("https://perso.univ-rennes1.fr/michel.coste/polyens/RASroot.pdf")[author's course notes].]
#bibitem([8])[J.-P.~Demailly, C.~D.~Hacon, and M.~Păun, #emph[Extension theorems, non-vanishing and the existence of good minimal models], Acta Math. #strong[210] (2013), no.~2, 203--259. #link("https://doi.org/10.1007/s11511-013-0094-x")[doi:10.1007/s11511-013-0094-x].]
#bibitem([9])[H.~Esnault and E.~Viehweg, #emph[Lectures on vanishing theorems], DMV Seminar, vol.~20, Birkhäuser, Basel, 1992. #link("https://page.mi.fu-berlin.de/esnault/books/esvibuch.pdf")[Author copy].]
#bibitem([10])[Osamu Fujino. Abundance theorem for semi log canonical threefolds. , 102(3):513--532, 2000.]
#bibitem([11])[O.~Fujino, #emph[Minimal model theory for log surfaces], Publ. Res. Inst. Math. Sci. #strong[48] (2012), no.~2, 339--371. #link("https://ems.press/journals/prims/articles/11294")[Publisher's article].]
#bibitem([12])[Osamu Fujino and Yoshinori Gongyo. Log pluricanonical representations and the abundance conjecture. , 150(4):593--620, 2014. #link("https://doi.org/10.1112/S0010437X13007495")[doi:10.1112/S0010437X13007495]. Theorem locators refer to the final published version.]
#bibitem([13])[O.~Fujino, #emph[Canonical bundle formula and vanishing theorem], preprint (2009), version of 19 December 2009. #link("https://www.math.kyoto-u.ac.jp/~fujino/cano-vani-bessatsu2.pdf")[Author manuscript].]
#bibitem([14])[Phillip A. Griffiths. #emph[Periods of integrals on algebraic manifolds, III (Some global differential-geometric properties of the period mapping)]. Publications Mathématiques de l'IHÉS #strong[38] (1970), 125--180. #link("https://doi.org/10.1007/BF02684654")[doi:10.1007/BF02684654].]
#bibitem([15])[Kenta Hashizume. On the non-vanishing conjecture and existence of log minimal models. , 54(1):89--104, 2018. Theorem 1.4, p. 90.]
#bibitem([16])[Yujiro Kawamata. Abundance theorem for minimal threefolds. , 108:229--246, 1992. #link("https://doi.org/10.1007/BF02100604")[doi:10.1007/BF02100604].]
#bibitem([17])[Sean Keel, Kenji Matsuki, and James McKernan. Log abundance theorem for threefolds. , 75(1):99--119, 1994.]
#bibitem([18])[Sean Keel, Kenji Matsuki, and James McKernan. Corrections to: "log abundance theorem for threefolds". , 122(3):625--630, 2004.]
#bibitem([19])[János Kollár. , volume 200 of #emph[Cambridge Tracts in Mathematics]. Cambridge University Press, Cambridge, 2013. With the collaboration of Sándor Kovács.]
#bibitem([20])[János Kollár. #emph[Families of Varieties of General Type]. Cambridge Tracts in Mathematics, vol.~231, Cambridge University Press, 2023. #link("https://doi.org/10.1017/9781009346115")[doi:10.1017/9781009346115]. With the collaboration of Klaus Altmann and Sándor J. Kovács. Section numbering follows the #link("https://web.math.princeton.edu/~kollar/FromMyHomePage/modbook-final.pdf")[author's manuscript dated 8 August 2022].]
#bibitem([21])[János Kollár and Sándor J. Kovács. #emph[Log canonical singularities are Du Bois]. Journal of the American Mathematical Society #strong[23] (2010), no.~3, 791--813. #link("https://doi.org/10.1090/S0894-0347-10-00663-6")[doi:10.1090/S0894-0347-10-00663-6].]
#bibitem([22])[János Kollár. #emph[A local version of the Kawamata--Viehweg vanishing theorem]. Pure and Applied Mathematics Quarterly #strong[7] (2011), no.~4, 1477--1494. #link("https://doi.org/10.4310/PAMQ.2011.v7.n4.a18")[doi:10.4310/PAMQ.2011.v7.n4.a18]. #link("https://arxiv.org/abs/1005.4843")[Referenced arXiv version].]
#bibitem([23])[János Kollár and Shigefumi Mori. #emph[Birational Geometry of Algebraic Varieties]. Cambridge Tracts in Mathematics, vol.~134, Cambridge University Press, 1998.]
#bibitem([24])[Vladimir Lazić and Nikolaos Tsakanikas. #emph[On the existence of minimal models for log canonical pairs]. Publications of the Research Institute for Mathematical Sciences #strong[58] (2022), no.~2, 311--339. #link("https://doi.org/10.4171/PRIMS/58-2-3")[doi:10.4171/PRIMS/58-2-3]. #link("https://arxiv.org/abs/1905.05576v3")[Referenced arXiv version].]
#bibitem([25])[J.~Liu and Z.~Xu, #emph[Non-vanishing implies numerical dimension one abundance], #link("https://arxiv.org/abs/2505.05250v2")[arXiv:2505.05250v2] (2025). For the conormal--period method, the locators explicitly marked v1 refer to #link("https://arxiv.org/abs/2505.05250v1")[arXiv:2505.05250v1].]
#bibitem([26])[M.~Mustaţă and M.~Popa, #emph[Hodge ideals], Mem. Amer. Math. Soc. #strong[262] (2019), no.~1268. #link("https://people.math.harvard.edu/~mpopa/papers/SI.pdf")[Author manuscript].]
#bibitem([27])[OpenAI. #emph[Fourfold nonvanishing by minimal metrics and moving jets]. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Fourfold-nonvanishing-by-minimal-metrics-and-moving-jets-September-27-2026/paper.pdf")[OAI:Fourfold-nonvanishing-by-minimal-metrics-and-moving-jets-September-27-2026], 2026.]
#bibitem([28])[M.~Popa, #emph[Kodaira--Saito vanishing and applications], Enseign. Math. #strong[62] (2016), no.~1--2, 49--89. #link("https://doi.org/10.4171/LEM/62-1/2-5")[doi:10.4171/LEM/62-1/2-5].]
#bibitem([29])[Jean-Pierre Ramis and Gabriel Ruget. #emph[Complexe dualisant et théorèmes de dualité en géométrie analytique complexe]. Publications Mathématiques de l'IHÉS #strong[38] (1970), 77--91. #link("https://doi.org/10.1007/BF02684652")[doi:10.1007/BF02684652].]
#bibitem([30])[M.~Saito, #emph[Modules de Hodge polarisables], Publ. Res. Inst. Math. Sci. #strong[24] (1988), no.~6, 849--995. #link("https://doi.org/10.2977/PRIMS/1195173930")[doi:10.2977/PRIMS/1195173930].]
#bibitem([31])[M.~Saito, #emph[Mixed Hodge modules], Publ. Res. Inst. Math. Sci. #strong[26] (1990), no.~2, 221--333. #link("https://doi.org/10.2977/PRIMS/1195171082")[doi:10.2977/PRIMS/1195171082].]
#bibitem([32])[M.~Saito, #emph[On the definition of mixed Hodge modules], #link("https://arxiv.org/abs/1307.2140v5")[arXiv:1307.2140v5] (2013).]
#bibitem([33])[Morihiko Saito. #emph[Induced $cal(D)$-modules and differential complexes]. Bulletin de la Société Mathématique de France #strong[117] (1989), no.~3, 361--387. #link("https://doi.org/10.24033/bsmf.2128")[doi:10.24033/bsmf.2128].]
#bibitem([34])[Morihiko Saito. #emph[Mixed Hodge Complexes on Algebraic Varieties]. Mathematische Annalen #strong[316] (2000), no.~2, 283--331. #link("https://doi.org/10.1007/s002080050014")[doi:10.1007/s002080050014]. Locators refer to the primary preprint #link("https://arxiv.org/abs/math/9906088v1")[arXiv:math/9906088v1].]
#bibitem([35])[Wilfried Schmid. #emph[Variation of Hodge structure: The singularities of the period mapping]. Inventiones Mathematicae #strong[22] (1973), 211--319. #link("https://doi.org/10.1007/BF01389674")[doi:10.1007/BF01389674].]
#bibitem([36])[C.~Schnell, #emph[An overview of Morihiko Saito's theory of mixed Hodge modules], #link("https://arxiv.org/abs/1405.3096v1")[arXiv:1405.3096v1], 13 May 2014.]
#bibitem([37])[The Stacks Project Authors, #emph[The Stacks Project], #link("https://stacks.math.columbia.edu")[stacks.math.columbia.edu], Tags #link("https://stacks.math.columbia.edu/tag/02KH")[02KH] and #link("https://stacks.math.columbia.edu/tag/0C3M")[0C3M], accessed 16 September 2026.]
#bibitem([38])[J.~Włodarczyk, #emph[Simple Hironaka resolution in characteristic zero], J. Amer. Math. Soc. #strong[18] (2005), no.~4, 779--822. #link("https://www.math.purdue.edu/~wlodarcz/singularities/Resolution.pdf")[Author's copy of the published article].]


