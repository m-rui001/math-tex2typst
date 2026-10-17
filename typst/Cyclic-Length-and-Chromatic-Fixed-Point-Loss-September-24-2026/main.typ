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

#align(center)[#text(size: 16pt, weight: "bold")[Cyclic length and chromatic fixed-point loss]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:intro>

The chromatic Smith problem asks how much information about fixed points at one subgroup is forced by chromatic acyclicity at another. Fix a prime $p$, and let $K \( i \)$ denote Morava $K$-theory at $p$, with $K \( 0 \) = H bb(Q)$. For a finite $p$-group $G$, a subgroup $H lt.eq G$, and an integer $n gt.eq 0$, define $r_n \( G \, H \)$ to be the least nonnegative integer $r$ such that

#[#set math.equation(numbering: n => "(1.1)")
 $ K \( n + r \)_(*) \( Phi^H X \) = 0 quad arrow.r.double quad K \( n \)_(*) \( Phi^G X \) = 0 $ <eq:def-loss>]

for every finite $p$-local genuine $G$-spectrum $X$. Here $Phi^H X$ denotes the underlying spectrum of the geometric fixed points, and finite spectra include compact retracts.

Let $ell \( G \, H \)$ be the least length of a subnormal chain

$ H = G_0 lt.closed.eq G_1 lt.closed.eq dots.h.c lt.closed.eq G_s = G $

whose successive quotients are cyclic. We set $ell \( G \, G \) = 0$. Such chains exist in finite $p$-groups. The cyclic chromatic Smith theorem, applied along a chain, gives $r_n \( G \, H \) lt.eq ell \( G \, H \)$. Our result is the converse.

#thm([Theorem 1.1.])[
  #emph[For every prime $p$, finite $p$-group $G$, subgroup $H lt.eq G$, and integer $n gt.eq 0$, 
$ #box(stroke: black, inset: 3pt, [$ r_n \( G \, H \) = ell \( G \, H \) . $]) $

]
] <thm:main>

Thus the optimal loss is independent of the height. For every integer $0 lt.eq r < ell \( G \, H \)$, there is a finite genuine $G$-spectrum whose geometric $H$-fixed points are $K \( n + r \)$-acyclic and whose geometric $G$-fixed points have nonzero $K \( n \)$-homology. The theorem includes rational fixed-point detection at $n = 0$.

The embedding of $H$ matters. For example, in $G = C_(p^2) times C_p$, take $H_1 = p C_(p^2) times 0$ and $H_2 = 0 times C_p$. Both subgroups are isomorphic to $C_p$, but $G \/ H_1 tilde.equiv C_p times C_p$ and $G \/ H_2 tilde.equiv C_(p^2)$. Chains above $H_i$ correspond to chains in these quotients. The first quotient requires two cyclic steps, while the second requires one. Thus $r_n \( G \, H_1 \) = 2$ and $r_n \( G \, H_2 \) = 1$ at every target height. A cyclic quotient of order $p^2$ still counts only once.

=== History and significance <history-and-significance>

The classical starting point is Smith theory: for a finite complex with an action of a finite $p$-group, mod-$p$ acyclicity passes to fixed points. Floyd strengthened this to an inequality between total mod-$p$ Betti numbers [6] Theorem 4.4; the finite $p$-group statement follows by iteration from prime-order actions. Chromatic Smith theory asks which implications survive when mod-$p$ homology is replaced by individual Morava theories.

Building on the nonequivariant thick subcategory theorem of Hopkins and Smith [12], Balmer and Sanders identified all primes of the category of finite genuine equivariant spectra. They reduced its topology to subgroup–height inclusions and computed the case $C_p$, crediting Strickland’s earlier work [2] Introduction, Theorems 4.9 and 4.14, and Section 7. Barthel, Hausmann, Naumann, Nikolaus, Noel, and Stapleton determined the finite abelian $p$-group case: the loss for $H lt.eq G$ is the minimum number of generators of $G \/ H$ [3] Theorem 2.3. This replaced the original order-based prediction by a rank bound; already $C_(p^2)$ has loss one rather than two. The sharp elementary abelian examples use the partition-complex work of Arone, Dwyer, Lesh, and Mahowald [3] Theorems 2.2 and 4.1. Balderrama and Kuhn later gave an elementary proof of the abelian chromatic Smith theorem, including target height zero [1] Theorem 1.1 and Section 3.2.

For nonabelian groups, a general lower bound is the rank of the largest elementary abelian quotient of $G$ in which $H$ maps to the identity. This can be smaller than the cyclic-chain upper bound. Kuhn and Lloyd proved that chromatic acyclicity implications are equivalent to corresponding inequalities between Morava homology dimensions, allowing representation-theoretic constructions to give stronger lower bounds [15] Theorem 2.2. They obtained equality with $ell$ for every subgroup pair inside a central extension $C_2 arrow.r G arrow.r E$ with $E$ elementary abelian [15] Theorem 2.13. In particular, a noncentral subgroup of order two in $D_8$ has loss two, although the elementary-quotient lower bound is one. Their discussion of the general problem expresses “cautious hope” that $r_n \( G \, H \) = r_(+) \( G \, H \) = ell \( G \, H \)$, and separately asks whether the loss is independent of height [15] Section 2.2. 1 establishes the proposed equality, and hence height independence, for all finite $p$-groups.

The remaining obstacle is sharpness for an arbitrary embedded subgroup. The Hopkins–Kuhn–Ravenel characters are indexed by maps from $bb(Z)_p^n$, whose images are abelian [10] Theorem C. Thus they cannot directly supply characters with full nonabelian image. General character rings with other source groups already appear in Kuhn’s framework [13] Section 2. Here we select a profinite source from the finite groups detected by telescopic cochains, derive constraints on all its open subgroups by relative integration, and use those constraints to prove the required fixed-point vanishing estimates.

Combined with the conjugacy and $p$-subnormal reductions of Balmer–Sanders, the theorem determines the remaining finite-height prime inclusions for arbitrary finite groups [2] Proposition 6.11; 29 gives the precise test. Their description of the infinite-height inclusions and of Thomason subsets then determines the thick tensor ideals [2] Corollaries 8.19, 10.5, and 10.6. The sharpness witnesses in this paper are obtained by separation of primes.

=== The proof <the-proof>

For a finite $p$-group $P$ and a spectrum $D$, write

$ U_P \( D \) = Phi^P "Bor"_P \( D \) \, $

where $"Bor"_P \( D \)$ is the genuine cofree spectrum associated to the trivial $P$-action on $D$. Let $T \( l \)$ be a telescope at height $l$. The first main step is the rational estimate

#[#set math.equation(numbering: n => "(1.2)")
 $ #scale(x: 120%, y: 120%)[\(] U_P \( L_(T \( l \)) S \) #scale(x: 120%, y: 120%)[\)]_(bb(Q)) eq.not 0 quad arrow.r.double quad ell \( P \, 1 \) lt.eq l . $ <eq:intro-rational>]

To prove it at positive $l$, we rationalize morphisms in the tensor category of dualizable $T \( l \)$-local spectra and split Burnside idempotents. A maximizing construction produces a pro-$p$ group $Gamma$ mapping onto $P$, with every finite section (a finite continuous quotient of a closed subgroup) generated by at most $l$ elements. Cochains admit evaluation factors indexed by continuous homomorphisms out of $Gamma$. Height zero is handled separately by rational averaging.

The key additional information comes from relative integration over finite groupoids. Strickland’s Frobenius formulation of HKR character theory already expresses such integration through automorphism-group weights [16] Section 10 and Theorem 10.2. We derive the weights for the source $Gamma$ just constructed. Applying them to groupoids of labeled finite sets, coinduced from an open subgroup, gives congruences

$ sum_(V lt.eq_o U\
 \[ U : V \] = p^h) #scale(x: 120%, y: 120%)[\(] \| X^V \| - \| X \| #scale(x: 120%, y: 120%)[\)] in p^(h + 1) bb(Z)_(\( p \)) $

for every open subgroup $U lt.eq Gamma$, every finite continuous $U$-set $X$, and every $h gt.eq 0$. The same construction gives $\| "Hom"_(upright("cts")) \( Gamma \, F \) \| \/ \| F \| in bb(Z)_(\( p \))$ for every finite group $F$. Together with the finite-section bound, these arithmetic conditions force a closed subnormal series with $bb(Z)_p$-factors and length at most $l$. The purely profinite argument uses shrinking semidirect products and an explicit $p$-adic limit of subgroup counts; it may be useful independently of the chromatic application.

Next, ring nilpotence and the generalized characters of Hopkins, Kuhn, and Ravenel [12,10] upgrade (1.2) to

#[#set math.equation(numbering: n => "(1.3)")
 $ T \( k \) and U_P \( L_(T \( l \)) S \) eq.not 0 quad arrow.r.double quad k + ell \( P \, 1 \) lt.eq l . $ <eq:intro-height>]

Chromatic ambidexterity and its torsion-nilpotence consequence [5] allow this step to use arbitrary nonzero commutative local algebras. A product with increasingly large cyclic $p$-groups separates the height $k$ from the cyclic length.

Finally, finite chromatic fracture converts (1.3) into vanishing estimates for the right adjoints to subgroup geometric fixed points. The support argument adapts the strategy of Balmer–Sanders [2] proof of Theorem 9.1, (B)$arrow.r.double$(A). At a least height where the proposed bound fails, the estimates isolate the offending subgroup component from the other components. In the finite-height tensor-triangular spectrum, this forces the support of a compact object to split into two nonempty disjoint closed parts, although that support is the closure of a point and hence irreducible. The contradiction supplies the lower bound for every embedded subgroup.

Published inputs are recalled in 2; the character construction, congruences, profinite theorem, higher-height estimate, and support argument occupy Section 3, Section 4, Section 5, Section 6, Section 7, respectively.

== 2 Chromatic and equivariant preliminaries <sec:background>

We work $p$-locally. The category $upright("Sp")^G$ is the stable category of genuine $G$-spectra on a complete universe; its compact objects are retracts of $p$-local finite genuine $G$-CW spectra. All limits, tensor products, and fixed-point functors are derived. When a localized category is used, its tensor product is the corresponding localized smash product.

=== 2.1 Chromatic tests and finite localization <chromatic-tests-and-finite-localization>

For $i > 0$, choose a finite type-$i$ spectrum with a periodic self-map and write $T \( i \)$ for its telescope. Put $T \( 0 \) = K \( 0 \) = H bb(Q)$. The Bousfield class of $T \( i \)$ is independent of the choice. For a finite spectrum $V$,

#[#set math.equation(numbering: n => "(2.1)")
 $ T \( i \) and V = 0 quad arrow.l.r.double quad K \( i \) and V = 0 . $ <eq:finite-tests>]

The type of a nonzero finite spectrum is its least nonvanishing Morava height. Nilpotence and periodicity give these facts and finite spectra of every type [12].

Write $L_m^f$ for localization at $T \( 0 \) or dots.h.c or T \( m \)$. This is a smashing finite localization; its acyclic compact ideal is generated by a finite spectrum of type $m + 1$. Consequently an $L_m^f$-local spectrum is zero if and only if its smashes with $T \( 0 \) \, dots.h \, T \( m \)$ vanish. We use the telescopic fracture square, a homotopy pullback

(2.2)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$L_m^f D$])
  content((3.377, 0), [$L_(T \( m \)) D$])
  content((0, -1.585), [$L_(m - 1)^f D$])
  content((3.377, -1.585), [$L_(m - 1)^f L_(T \( m \)) D$])
  line((0.666, 0), (2.645, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((3.377, -0.2725), (3.377, -1.313), mark: (end: ">"))
  line((0.798, -1.585), (2.183, -1.585), mark: (end: ">"))
})

for $m > 0$ and $D$ already $L_m^f$-local; equivalently take $D = L_m^f S$ for the sphere square used below. The square follows from the complementary localizations at the top telescope and the lower finite heights: $L_(T \( m \)) L_(m - 1)^f = 0$, and the two localizations jointly detect $L_m^f$-local equivalences.

=== 2.2 Genuine fixed points and cofree spectra <genuine-fixed-points-and-cofree-spectra>

Inflation of an ordinary spectrum $D$ will be denoted by $inf_G D$. It satisfies

$ Phi^H \( inf_G D \) tilde.eq D #h(2em) \( H lt.eq G \) . $

Geometric fixed points are exact and symmetric monoidal, preserve finite objects, and jointly detect equivalences when taken over all subgroups. For a normal subgroup, their genuine quotient versions are transitive.

The functor from genuine $P$-spectra to underlying $P$-diagrams has a cofree right adjoint. For the constant diagram with value $D$, put

$ "Bor"_P \( D \) = F \( E P_(+) \, inf_P D \) \, #h(2em) U_P \( D \) = Phi^P "Bor"_P \( D \) . $

We also use $"Bor"_P$ for that right adjoint on a general $P$-diagram, specifying the diagram when its action is nontrivial. Its categorical fixed points on a constant diagram are $D^(B P) = F \( B P_(+) \, D \)$. The functor $U_P$ is exact and lax symmetric monoidal. In particular it takes commutative algebras and their modules to commutative algebras and their modules.

If $X$ is dualizable, adjunction gives the cofree projection formula

#[#set math.equation(numbering: n => "(2.3)")
 $ X ⊗ "Bor"_P \( M \) tilde.eq "Bor"_P #scale(x: 120%, y: 120%)[\(] "res" X ⊗ M #scale(x: 120%, y: 120%)[\)] \, $ <eq:cofree-projection>]

where $"res" X$ retains its underlying $P$-action. We use the usual restriction, coinduction, and normal geometric-localization formulas for genuine spectra [2] Section 2.

#thm([Proposition 2.1.])[
  (Cyclic upper bound).  #emph[For every finite $p$-group $G$, subgroup $H$, and $n gt.eq 0$, $r_n \( G \, H \) lt.eq ell \( G \, H \)$.]
] <prop:cyclic-upper>

#proof[
  The finite abelian chromatic Smith theorem gives loss at most one for every nontrivial cyclic $p$-group, including target height zero [3] Theorem 2.1 and Corollary 3.12; see also [15] Theorem 5.1. Along a length-$s$ cyclic subnormal chain, apply it to the finite genuine $G_i \/ G_(i - 1)$-spectrum obtained by restricting $X$ to $G_i$ and taking genuine geometric $G_(i - 1)$-fixed points. Transitivity identifies the underlying and full fixed points with $Phi^(G_(i - 1)) X$ and $Phi^(G_i) X$. Iterating at heights $n + s - 1 \, dots.h \, n$ proves the assertion. ◻
]

=== 2.3 Ambidexterity and Burnside marks <ambidexterity-and-burnside-marks>

The relevant ambidexterity belongs to the development of chromatic Tate vanishing and higher semiadditivity. Kuhn proved telescopic finite-group Tate vanishing [14] Theorem 1.5; Hopkins and Lurie established higher ambidexterity in the Morava-local category [11] Theorem 0.0.2. The telescopic form below is due to Carmeli, Schlank, and Yanovski. None of these uses identifies telescopic localization with Morava localization on arbitrary spectra.

We use the published ambidexterity theorem for $upright("Sp")_(T \( l \))$, $upright("Sp")_(K \( l \))$, and $K \( l \)$-local $E_l$-modules [5] Theorem 5.3.1 and Corollary 5.3.2. In these categories every finite groupoid is ambidextrous. Integration along maps of finite groupoids satisfies composition, homotopy base change, and the projection formula; for finite coverings it is the ordinary sum transfer [5] Section 3.1. Cochains on a finite groupoid with values in the unit are dualizable [5] Proposition 3.3.7. Tensoring preserves finite-groupoid limits, since it preserves their ambidextrous colimits [5] Corollary 3.2.4. Thus the canonical exterior product of unit-cochains is an algebra equivalence

$ upright(bold(1))^(B Y) ⊗ upright(bold(1))^(B Z) tilde.eq upright(bold(1))^(B \( Y times Z \)) $

for finite groups $Y \, Z$, and similarly for finite groupoids.

For a finite group $F$, its rational Burnside ring is the product of copies of $bb(Q)$ indexed by conjugacy classes of subgroups. The $I$-mark of a finite $F$-set $X$ is $\| X^I \|$. We denote by $e_I^F$ the idempotent with mark one at the conjugacy class of $I$ and zero at all others. A finite $F$-set $X$ acts on cochains by multiplication by the transfer of $1$ along $X \/ \/ F arrow.r B F$; for an orbit, this is restriction followed by transfer. This agrees with the genuine Burnside action. The full mark $e_F^F$ will be used to isolate full geometric fixed points.

=== 2.4 Prime points and finite truncation <prime-points-and-finite-truncation>

For the rest of the paper, primes are indexed by the #emph[tested height]:

$ cal(P)_i^G \( H \) = { X in \( upright("Sp")^G \)^c : K \( i \)_(*) \( Phi^H X \) = 0 } \, #h(2em) i gt.eq 0 . $

Thus $cal(P)_i^G \( H \)$ has index $i + 1$ in the convention of [2]. We suppress $G$ when it is fixed. The support of a compact object $X$ consists of the primes not containing it. In particular

#[#set math.equation(numbering: n => "(2.4)")
 $ q in overline({ y }) quad arrow.l.r.double quad q subset.eq y . $ <eq:prime-closure>]

#thm([Proposition 2.2.])[
  (Uniform finite localization).  #emph[Let $cal(C)_m^G$ be the category of genuine $G$-spectra localized by the inflated sphere $L_m^f S$. It is rigidly compactly generated. Its compact tensor-triangular spectrum is the finite subspace 
$ { \( H \, i \) : H lt.eq G upright(" up to conjugacy") \, med 0 lt.eq i lt.eq m } $

 of the equivariant spectrum, with $\( H \, i \)$ representing $cal(P)_i^G \( H \)$. The image of a finite genuine spectrum is compact and dualizable. An object $Z in cal(C)_m^G$ is zero if and only if 
$ T \( i \) and Phi^H Z = 0 #h(2em) \( H lt.eq G \, med 0 lt.eq i lt.eq m \) . $

 For the image of a finite object, its support is tested equally by $T \( i \)$ and $K \( i \)$ at these heights. For every compact object of $cal(C)_m^G$, membership in the support at $\( H \, i \)$ is equivalent to nonvanishing of $K \( i \) and Phi^H \( - \)$.]
] <prop:finite-local>

#proof[
  Inflation of a finite type-$\( m + 1 \)$ spectrum generates the kernel as a localizing tensor ideal. Equivalently, use its products with the finite orbit generators. This is a finite localization, and its compact category is the idempotent completion of the corresponding compact quotient. The point classification and localization theorem of Balmer–Sanders identify its spectrum with the displayed subspace [2] Theorems 4.9 and 4.14, Remark 5.3, and Proposition 5.24. Indeed the inflated generator belongs precisely to the primes at test heights at most $m$.
  Geometric fixed points commute with this inflated localization. Each $Phi^H Z$ is therefore $L_m^f$-local; telescope detection at the retained heights, followed by genuine geometric detection, proves the zero criterion. For a finite representative, (2.1) gives agreement of the two support tests. For the assertion about all compact objects, the kernel of $K \( i \) and Phi^H \( - \)$ on compacts is a tensor-triangular prime by the Morava $K$-theory field property. Its inverse image in the original compact category is $cal(P)_i^G \( H \)$, since $K \( i \) and L_m^f S tilde.eq K \( i \)$ for $i lt.eq m$. The injectivity of the spectrum map for finite localization therefore identifies this kernel with the point labelled $\( H \, i \)$. ◻
]

== 3 Rational characters from finite groups <sec:characters>

Fix a prime $p$ and a positive height $l$, and put $upright(bold(1)) = L_(T \( l \)) S$. Starting from a finite group $P$ with $\( U_P \( upright(bold(1)) \) \)_(bb(Q)) eq.not 0$, we will construct a pro-$p$ group $Gamma arrow.r.twohead P$ whose finite sections require at most $l$ generators. The same construction will describe rational cochain summands by evaluation at continuous homomorphisms from $Gamma$ to finite groups. These evaluation coordinates will allow integration to impose the arithmetic conditions used in 5. The construction uses finite-groupoid ambidexterity and elementary abelian sharpness, without requiring $Gamma$ to be abelian.

=== 3.1 The rational tensor category and occurrence <the-rational-tensor-category-and-occurrence>

Let $cal(C)$ be the homotopy category of dualizable objects in $upright("Sp")_(T \( l \))$, with its local tensor product. Write $cal(C)_(bb(Q))$ for the idempotent completion of the category with the same objects and

$ "Hom"_(cal(C)_(bb(Q))) \( X \, Y \) = "Hom"_(cal(C)) \( X \, Y \) ⊗ bb(Q) #h(2em) \( X \, Y in cal(C) \) . $

The tensor product extends to this category; its algebras are algebra objects in this ordinary tensor category. All algebra and module identities below are inherited from the local category and then rationalized. In particular, this operation is distinct from ordinary rationalization of spectra, which we denote by $\( - \)_(bb(Q))$.

For a finite groupoid $Y$, put $A_Y = upright(bold(1))^Y$, and abbreviate $A_(B F)$ to $A_F$. Finite-groupoid ambidexterity makes $A_Y$ dualizable and gives natural algebra isomorphisms

#[#set math.equation(numbering: n => "(3.1)")
 $ A_(Y times Z) tilde.eq A_Y ⊗ A_Z \, #h(2em) A_(Y union.sq Z) tilde.eq A_Y times A_Z . $ <eq:cochain-products>]

Here and throughout this section tensors are local tensors before passing to $cal(C)_(bb(Q))$. These facts follow from [5] Theorem 5.3.1 and Propositions 3.3.1, 3.3.7. For a finite covering $f : Y arrow.r Z$, the transfer $f_(!) : A_Y arrow.r A_Z$ satisfies base change and the projection formula.

Write $bb(A) \( F \)$ for the Burnside ring of a finite group $F$. Sending an $F$-set $S$ to the transfer of $1$ along $S \/ \/ F arrow.r B F$ gives a ring map

$ bb(A) \( F \) arrow.r pi_0 A_F . $

The rational mark isomorphism $bb(A) \( F \) ⊗ bb(Q) tilde.equiv product_(\( I lt.eq F \)) bb(Q)$ has primitive idempotents $e_I^F$, characterized by the marks $\| \( e_I^F \)^J \| = 1$ if $J$ is conjugate to $I$ and $0$ otherwise. Their images split $A_F$ into commutative algebra summands in $cal(C)_(bb(Q))$. A finite group $L$ #emph[occurs] if

$ D_L := e_L^L A_L eq.not 0 . $

The unit of $D_L$ is the image of $e_L^L$ in $pi_0 A_L ⊗ bb(Q)$. Since its identity is multiplication by this class, $D_L eq.not 0$ precisely when this unit class is nonzero.

#thm([Lemma 3.1.])[
  #emph[For every finite group $L$ and ordinary commutative ring spectrum $R$, there is an equivalence of rational commutative ring spectra 
#[#set math.equation(numbering: n => "(3.2)")
 $ e_L^L \( R^(B L) \)_(bb(Q)) tilde.eq #scale(x: 120%, y: 120%)[\(] U_L \( R \) #scale(x: 120%, y: 120%)[\)]_(bb(Q)) . $ <eq:general-full-mark-comparison>]

 In particular, 
$ D_L eq.not 0 quad arrow.l.r.double quad #scale(x: 120%, y: 120%)[\(] U_L \( upright(bold(1)) \) #scale(x: 120%, y: 120%)[\)]_(bb(Q)) eq.not 0 . $

]
] <lem:occurrence-fixed-points>

#proof[
  For any genuine $L$-spectrum $X$, categorical fixed points commute with ordinary rationalization: their homotopy groups are represented by suspensions of the compact genuine sphere. In the rational genuine category, $e_L^L X_(bb(Q))$ restricts to zero at every proper subgroup, since $e_L^L$ does. The isotropy separation sequence for the family of proper subgroups consequently identifies
  $ \( e_L^L X_(bb(Q)) \)^L tilde.eq Phi^L \( e_L^L X_(bb(Q)) \) tilde.eq \( Phi^L X \)_(bb(Q)) . $
  Apply this to the already formed cofree spectrum $X = "Bor"_L \( R \)$, whose categorical fixed points are $R^(B L)$. The comparison respects multiplication and identifies the full idempotent unit with the unit of $\( U_L \( R \) \)_(bb(Q))$, proving (3.2). A unital ring spectrum is zero exactly when its unit is zero. Taking $R = upright(bold(1))$ and using the preceding unit criterion for $D_L$ proves the last assertion. ◻
]

#thm([Proposition 3.2.])[
  #emph[Every occurring finite group is a $p$-group. The class of occurring groups is closed under subgroups and quotients. If $A$ is any section of an occurring group, its minimum number of generators satisfies $d \( A \) lt.eq l$.]
] <prop:occurrence-sections>

#proof[
  We first record how a subgroup summand detects occurrence. If $I lt.eq F$, the mark formula gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ "ind"_I^F \( e_I^I \) = \| N_F \( I \) : I \| thin e_I^F . $ <eq:induced-top-mark>]
  Indeed a subgroup has a nonzero mark on the left only when it is conjugate to $I$, and the $I$-mark is $\| N_F \( I \) : I \|$. Covering transfer carries the full $I$-unit to the right side of (3.3). Thus $e_I^F A_F eq.not 0$ implies $D_I eq.not 0$.
  Let $S$ be a Sylow $p$-subgroup of $F$. The class $\[ F \/ S \] in pi_0 A_F$ is a unit. To see this, regard it as an endomorphism of the constant unit in $"Fun" \( B F \, upright("Sp")_(T \( l \)) \)$. Its value at the point is multiplication by $\[ F : S \]$, a $p$-local unit, and equivalences of diagrams are detected at the point. If $F$ is not a $p$-group, the full $F$-mark of $\[ F \/ S \]$ is zero. Hence $e_F^F \[ F \/ S \] = 0$, and invertibility forces $D_F = 0$.
  For a quotient $q : L arrow.r.twohead Q$, pullback of $e_Q^Q$ has full $L$-mark $1$. Its image therefore acts as the identity on $D_L$. If the full $Q$-unit were zero, its pullback would be zero, contradicting occurrence of $L$. This proves quotient closure.
  For subgroup closure, let $I lt.eq L$. Before any rationalization, there is a unit-preserving map of spectra
  #[#set math.equation(numbering: n => "(3.4)")
   $ U_I \( upright(bold(1)) \) arrow.r U_L \( upright(bold(1)) \) . $ <eq:subgroup-unit-map>]
  Here is its construction. The cofree adjunction gives a map
  $ N_I^L "Bor"_I \( upright(bold(1)) \) arrow.r "Bor"_L \( upright(bold(1)) \) $
  whose adjoint on underlying spectra with $L$-action is indexed multiplication $and.big_(L \/ I) upright(bold(1)) arrow.r upright(bold(1))$. This uses the ordinary commutative ring spectrum underlying the local unit; the displayed smash is the ordinary indexed smash. The multiplication is $L$-equivariant and carries the indexed unit to the unit. Apply geometric fixed points and the natural norm formula $Phi^L N_I^L tilde.eq Phi^I$ [9] Proposition 2.57. This gives (3.4), with the stated unit preservation. If the source unit were zero rationally, its image would be zero rationally. 4 now proves subgroup closure.
  It remains to bound generators. If an occurring elementary abelian group $E = \( C_p \)^a$ had $a > l$, the elementary abelian sharpness theorem of Arone, Dwyer, Lesh, and Mahowald, in the form [3] Theorems 2.2 and 4.1, would give a finite genuine $E$-spectrum $X$ with underlying type $a$ and full geometric fixed points of type $0$. Its underlying spectrum is $T \( l \)$-acyclic. Finite duality and the cofree projection formula give
  $ X and "Bor"_E \( upright(bold(1)) \) tilde.eq "Bor"_E #scale(x: 120%, y: 120%)[\(] \( "res" X \) and upright(bold(1)) #scale(x: 120%, y: 120%)[\)] = 0 . $
  Here $"res" X$ retains its underlying $E$-action. Its smash with $upright(bold(1))$ is zero because this can be tested on the underlying spectrum, and smashing a finite spectrum with the local unit computes its localization. Taking geometric fixed points and rationalizing yields
  $ \( Phi^E X \)_(bb(Q)) and \( U_E \( upright(bold(1)) \) \)_(bb(Q)) = 0 . $
  The first factor is a nonzero finite rational spectrum, so it detects nonzero rational spectra under smash. This contradicts occurrence of $E$. Finally, every section $A$ of an occurring group occurs, and so does its Frattini quotient $A \/ Phi \( A \) tilde.equiv \( C_p \)^(d \( A \))$. The elementary abelian bound and the Burnside basis theorem give $d \( A \) lt.eq l$. ◻
]

=== 3.2 A maximizing tower <a-maximizing-tower>

For a profinite group $Gamma$ and a finite groupoid $Y$, let

$ cal(X)_Gamma \( Y \) = "Fun"_(upright("cts")) \( B Gamma \, Y \) . $

Continuity means that the homomorphism into the automorphism group of the chosen object has open kernel. Thus $cal(X)_Gamma \( B F \) = "Hom"_(upright("cts")) \( Gamma \, F \) \/ \/ F$. A finite section of $Gamma$ means a finite continuous quotient of a closed subgroup.

#thm([Theorem 3.3.])[
  (Pro-character construction).  #emph[Suppose $P$ is a finite group with $\( U_P \( upright(bold(1)) \) \)_(bb(Q)) eq.not 0$. There is a tower of occurring finite $p$-groups 
$ dots.h.c arrow.r.twohead L_2 arrow.r.twohead L_1 arrow.r.twohead L_0 = P \, #h(2em) Gamma = "proj lim"_i L_i \, $

 with the following properties.]
  + #emph[Every finite section $A$ of $Gamma$ has $d \( A \) lt.eq l$. Every closed subgroup of $Gamma$ is topologically generated by at most $l$ elements; in particular $Gamma$ is finitely generated and $Gamma arrow.r.twohead P$.]
  + #emph[For each finite collection of finite groupoids $Y$, at every sufficiently advanced stage $L = L_i$ inflation is an equivalence 
#[#set math.equation(numbering: n => "(3.5)")
 $ "Fun" \( B L \, Y \) arrow.r^(med tilde.op med) cal(X)_Gamma \( Y \) . $ <eq:mapping-groupoid-stabilization>]

 At those stages the evaluation maps give an isomorphism of $D_L$-algebras in $cal(C)_(bb(Q))$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ D_L ⊗ A_Y arrow.r^(med tilde.op med) product_(\[ alpha \] in pi_0 cal(X)_Gamma \( Y \)) D_L . $ <eq:character-splitting>]

 These isomorphisms are natural for pullback along maps of the selected groupoids. In particular, a common stage can be chosen for a finite diagram of finite groupoids, including both its bases and its total groupoids.]
] <thm:pro-characters>

#proof[
  Enumerate the isomorphism classes of finite groups as $F_0 \, F_1 \, dots.h$. Given an occurring group $L_i$, choose an occurring extension $L_(i + 1) arrow.r.twohead L_i$ maximizing
  $ \| "Hom" \( L_(i + 1) \, F_i \) \/ F_i #scale(x: 120%, y: 120%)[\|] $
  among all occurring extensions of $L_i$. The set of candidates is nonempty, since $L_i$ is one. By 5, every candidate has at most $l$ generators, so the displayed integer is at most $\| F_i \|^l$ and a maximum is attained. Precomposition with a surjection injects conjugacy classes of homomorphisms. Once a target $F_i$ has been maximized, every later occurring extension is still an extension of $L_i$ and cannot increase the maximum. Consequently, for every sufficiently advanced stage $L$ and every occurring extension $M arrow.r.twohead L$,
  #[#set math.equation(numbering: n => "(3.7)")
   $ "Hom" \( L \, F_i \) \/ F_i arrow.r^(med tilde.op med) "Hom" \( M \, F_i \) \/ F_i . $ <eq:maximal-hom-classes>]
  Every continuous homomorphism $Gamma arrow.r F$ factors through some $L_i$, since the stage kernels form a neighborhood basis of the identity. After $F$ has been maximized, the preceding bijections imply that every such homomorphism factors through each later stage. This is actual factorization: a map conjugate to one factoring through a quotient kills the same quotient kernel. Surjectivity of $Gamma arrow.r L_i$ also identifies all conjugating elements. This proves (3.5) first for $Y = B F$, and then for finite disjoint unions of such groupoids.
  If $H$ is closed in $Gamma$ and $H \/ K$ is finite, choose an open normal subgroup $N lt.closed.eq_o Gamma$ with $H ∩ N subset.eq K$. Then $H \/ K$ is a quotient of the subgroup $H \/ \( H ∩ N \)$ of $Gamma \/ N$. The latter is a quotient of a tower stage, so 5 gives $d \( H \/ K \) lt.eq l$. For each open normal $K$ of $H$, the tuples in $H^l$ whose images generate $H \/ K$ form a nonempty clopen subset. These subsets have the finite intersection property, by applying the same bound to the quotient by an intersection of finitely many such $K$. Compactness gives a tuple generating every finite quotient, hence topologically generating $H$. This proves (i).
  We prove the splitting for $Y = B F$, at a stage $L$ satisfying (3.7) for $F$. We first show that every surviving subgroup summand comes from a graph, and then identify each graph summand by restriction. Put $G = L times F$ and let $pi : G arrow.r L$ be the first projection. By (3.1), $D_L ⊗ A_F$ is the summand $pi^(*) \( e_L^L \) A_G$. The marks of $pi^(*) \( e_L^L \)$ are supported exactly on subgroups $M lt.eq G$ projecting onto $L$. If $e_M^G A_G eq.not 0$, then $M$ occurs by (3.3). It is therefore an occurring extension of $L$. Apply (3.7) to its second projection $M arrow.r F$: this map is conjugate to $alpha compose pi$ for some $alpha : L arrow.r F$. Absorbing the conjugation into $alpha$ shows that $M$ is contained in its graph, and surjectivity onto $L$ gives
  $ M = M_alpha := { \( x \, alpha \( x \) \) : x in L } . $
  Graphs are conjugate in $L times F$ exactly when the corresponding homomorphisms are conjugate in $F$: conjugation in the first factor is already absorbed by conjugation by its image under $alpha$.
  We next identify each graph summand, keeping track of the map. Let $B_alpha = e_(M_alpha)^G A_G$ and write $j_alpha : L arrow.r^tilde.op M_alpha arrow.r.hook G$. Restriction along $j_alpha$, followed by the full projection, gives
  $ r_alpha : B_alpha arrow.r D_L . $
  It has a right inverse $s_alpha$, obtained by pulling back along $pi$ and projecting to $B_alpha$, because $pi j_alpha = upright("id")$ and $j_alpha^(*) \( e_(M_alpha)^G \) = e_L^L$. For the other inverse, let $t_alpha : D_L arrow.r B_alpha$ be covering transfer along $j_alpha$, followed by projection. The projection formula gives
  $ t_alpha r_alpha = \| \( G \/ M_alpha \)^(M_alpha) \| thin upright("id")_(B_alpha) = \| C_F \( alpha \( L \) \) \| thin upright("id")_(B_alpha) . $
  Indeed the full graph mark of $\[ G \/ M_alpha \]$ is $\| N_G \( M_alpha \) : M_alpha \| = \| C_F \( alpha \( L \) \) \|$. This positive integer is invertible in $cal(C)_(bb(Q))$, so $\| C_F \( alpha \( L \) \) \|^(- 1) t_alpha$ is a left inverse. Thus $r_alpha$ is an isomorphism, with inverse $s_alpha$. In particular every graph summand survives, since $D_L eq.not 0$.
  Combining the graph summands proves (3.6) for $B F$. Its coordinate at $alpha : L arrow.r F$ is explicitly the diagonal restriction
  #[#set math.equation(numbering: n => "(3.8)")
   $ D_L ⊗ A_F arrow.r D_L \, #h(2em) d ⊗ a mapsto d thin #scale(x: 120%, y: 120%)[\(] e_L^L alpha^(*) a #scale(x: 120%, y: 120%)[\)] . $ <eq:character-evaluation>]
  It is a map of $D_L$-algebras. Composition of homomorphisms composes these restrictions, giving naturality. Applying the disjoint-union identity in (3.1) proves the assertion for every finite groupoid. Only finitely many component automorphism groups occur in any finite diagram, so they can all be maximized before choosing the stage. This proves (ii). ◻
]

Naturality also controls homotopy fibers. For a map $Y arrow.r Z$ of finite groupoids, choose a stage satisfying (3.5) for both $Y$ and $Z$. The resulting square of mapping groupoids is a square of equivalences on its horizontal arrows. It therefore identifies homotopy fibers over any chosen base label. For a groupoid bundle over $B Q$, the targets to be stabilized include $Q$ and the automorphism groups of the components of its #emph[total] groupoid. Stabilizing only the quotient $Q$ defining the action would not ensure that all continuous lifts of the base label are counted.

#thm([Lemma 3.4.])[
  (Evaluation of covering transfers).  #emph[Let $f : Y arrow.r Z$ be a finite covering of finite groupoids. Choose a common stage $L$ as in 6, and a label $alpha : B L arrow.r Z$. If the pullback of $f$ is the finite $L$-set $S$, then the evaluation of $f_(!) \( 1 \) in pi_0 A_Z$ at $alpha$ is $\| S^L \| thin 1_(D_L)$.]
] <lem:cover-evaluation>

#proof[
  Base change identifies $alpha^(*) f_(!) \( 1 \)$ with the Burnside class $\[ S \]$ in $pi_0 A_L$. Multiplication by $e_L^L$ selects its full mark $\| S^L \|$. This is exactly the evaluation map (3.8). ◻
]

== 4 Integration and subgroup congruences <sec:congruences>

Fix $l gt.eq 1$ and retain the group $Gamma$, the tower, and the notation of 6. The purpose of this section is to extract arithmetic information from the natural evaluation splitting. Integration determines the weights of its coordinates. Integral cochains then force congruences between weighted counts of finite sets with different actions.

For a finite groupoid $Y$, write

$ A_Y = upright(bold(1))^Y \, #h(2em) cal(X)_Gamma \( Y \) = "Fun"_(upright("cts")) \( B Gamma \, Y \) \, #h(2em) a_alpha = \| "Aut"_(cal(X)_Gamma \( Y \)) \( alpha \) \| . $

We use finite groupoid models and continuous functors throughout. The groupoid $cal(X)_Gamma \( Y \)$ is finite up to equivalence: on each component $B F$ there are finitely many homomorphisms $Gamma arrow.r F$, since $Gamma$ is finitely generated. Its #emph[homotopy cardinality] is

$ \| cal(X)_Gamma \( Y \) \|_(upright(h)) = sum_(\[ alpha \] in pi_0 cal(X)_Gamma \( Y \)) 1 / a_alpha . $

All integrations below are first formed in $upright("Sp")_(T \( l \))$ and then transported to $cal(C)_(bb(Q))$. We use their composition, base-change, and module identities, and their agreement with the sum transfer for finite coverings; these follow from finite-groupoid ambidexterity [5] Theorem 5.3.1, Propositions 3.1.10, 3.1.14, and 3.3.1. In particular, we do not form new cochain objects after rationalizing morphisms.

=== 4.1 Absolute and relative integration weights <absolute-and-relative-integration-weights>

Choose a common sufficiently advanced stage $L$ for the finite groupoids under consideration and put $D = D_L$. Under 6 we have

#[#set math.equation(numbering: n => "(4.1)")
 $ D ⊗ A_Y tilde.eq product_(\[ alpha \] in pi_0 cal(X)_Gamma \( Y \)) D . $ <eq:groupoid-coordinates>]

The coordinate maps are algebra maps. We denote evaluation at $alpha$ by $chi_alpha$, and write $e_alpha$ for the corresponding coordinate idempotent. Scalar values lie in the ring $R_D = "Hom"_(cal(C)_(bb(Q))) \( upright(bold(1)) \, D \)$. We also write $epsilon.alt_Y$ and $f_(!)$ for their $D$-linear extensions; tensor products between extended cochain algebras are taken over $D$.

For characters indexed by maps from $bb(Z)_p^l$, the same automorphism weights as in the following proposition occur in Strickland’s Frobenius character formulas [16] Section 10 and Theorem 10.2. We derive them for $Gamma$ directly from the diagonal transfer and the evaluation splitting of 6.

#thm([Proposition 4.1.])[
  (Integration weights).  #emph[In the coordinates (4.1), the $D$-linear extension of integration $epsilon.alt_Y : A_Y arrow.r upright(bold(1))$ is the map 
#[#set math.equation(numbering: n => "(4.2)")
 $ \( x_alpha \)_(\[ alpha \]) mapsto sum_(\[ alpha \]) x_alpha / a_alpha . $ <eq:absolute-weights>]

 For a map $f : Y arrow.r Z$, its pushforward has coordinate formula 
#[#set math.equation(numbering: n => "(4.3)")
 $ #scale(x: 120%, y: 120%)[\(] f_(!) \( x \) #scale(x: 120%, y: 120%)[\)]_beta = sum_(\[ alpha \] : \[ f alpha \] = \[ beta \]) a_beta / a_alpha thin x_alpha . $ <eq:relative-weights>]

 Consequently $chi_beta \( f_(!) 1 \)$ is the rational scalar 
#[#set math.equation(numbering: n => "(4.4)")
 $ lr(|cal(X)_Gamma \( Y \) times_(cal(X)_Gamma \( Z \))^h { beta }|)_(upright(h)) $ <eq:relative-fiber-mass>]

 times the unit of $D$.]
] <prop:relative-weights>

#proof[
  The diagonal $Delta : Y arrow.r Y times Y$ is a finite covering: its homotopy fiber at $\( y \, y' \)$ is the finite set $"Iso"_Y \( y \, y' \)$. By 7, its transferred unit evaluates at a pair $\( alpha \, beta \)$ as the number of isomorphisms between the two continuous functors. Thus
  $ Delta_(!) 1 = sum_(\[ alpha \]) a_alpha \( e_alpha ⊗ e_alpha \) $
  in the coordinates for $Y times Y$. Composition of integrations, applied to $"pr"_1 Delta = upright("id")_Y$, gives
  $ \( upright("id") ⊗ epsilon.alt_Y \) \( Delta_(!) 1 \) = 1 . $
  At the $alpha$ coordinate this reads $a_alpha epsilon.alt_Y \( e_alpha \) = 1$. Positive integers are invertible in $cal(C)_(bb(Q))$, proving (4.2).
  Naturality of the evaluation splitting identifies $f^(*)$ with pullback along $pi_0 cal(X)_Gamma \( Y \) arrow.r pi_0 cal(X)_Gamma \( Z \)$. The module identity for $f_(!)$ therefore forces $f_(!) \( e_alpha \)$ to be supported at $\[ f alpha \]$. If its value there is $c_alpha$, composition with integration to the point gives
  $ c_alpha / a_(f alpha) = 1 / a_alpha . $
  This proves (4.3).
  For completeness, the homotopy fiber in (4.4) has objects $\( alpha \, eta \)$ with $eta : f alpha arrow.r^tilde.op beta$. The contribution of a fixed isomorphism class $\[ alpha \]$ is the cardinality of the action groupoid
  $ "Iso" \( f alpha \, beta \) \/ \/ "Aut" \( alpha \) \, $
  which is $a_beta \/ a_alpha$ if $f alpha tilde.eq beta$ and zero otherwise. This computation includes automorphisms in the kernel of $"Aut" \( alpha \) arrow.r "Aut" \( f alpha \)$, so it applies to every map of finite groupoids. ◻
]

=== 4.2 Integral scalar values <integral-scalar-values>

The next argument concerns a cochain whose selected character value has been computed as a rational scalar. It uses invertibility in the original local category to constrain that scalar.

#thm([Lemma 4.2.])[
  (Scalar integrality).  #emph[Let $F$ be finite, let $z in pi_0 A_F$, and suppose that an evaluation at an advanced stage satisfies $chi_alpha \( z \) = r dot.op 1_D$ for $r in bb(Q)$. Then $r in bb(Z)_(\( p \))$. If the restriction of $z$ to the underlying point of $B F$ is zero in $pi_0 upright(bold(1))$, then $r in p bb(Z)_(\( p \))$.]
] <lem:scalar-integrality>

#proof[
  We first show that $1 + p x$ is a unit in $pi_0 upright(bold(1))$ for every $x in pi_0 upright(bold(1))$. Put $M = S \/ p$. In the $p$-local stable category, $M$-acyclic spectra have $p$ invertible and hence are rational. They are therefore $T \( l \)$-acyclic for $l > 0$. It follows that every $T \( l \)$-local spectrum is $M$-local.
  The cofiber triangle
  $ S arrow.r^p S arrow.r^i M arrow.r^partial Sigma S $
  gives $p^2 upright("id")_M = 0$, including when $p = 2$. Indeed, $\( p upright("id")_M \) i = i p = 0$, so $p upright("id")_M$ factors as $a partial$ for a map $a : Sigma S arrow.r M$. Hence
  $ p^2 upright("id")_M = p a partial = a \( Sigma p \) partial = 0 . $
  After smashing with $M$, the endomorphism $1 + p x$ of $upright(bold(1))$ thus has inverse $1 - p x$. Its cofiber is both $M$-local and $M$-acyclic, so it is zero. This proves the asserted invertibility.
  An element of $pi_0 A_F$ is an endomorphism of the constant unit in $"Fun" \( B F \, upright("Sp")_(T \( l \)) \)$. Evaluation at the unique object of $B F$ detects equivalences of diagrams. Consequently a cochain whose point restriction is a unit in $pi_0 upright(bold(1))$ is itself a unit in $pi_0 A_F$.
  Suppose $r in.not bb(Z)_(\( p \))$. Then $r^(- 1) in p bb(Z)_(\( p \))$, and the #emph[integral] cochain
  $ u = 1 - r^(- 1) z in pi_0 A_F $
  has point restriction of the form $1 + p x$. It is a unit, whereas $chi_alpha \( u \) = 0$. An algebra map cannot send a unit to zero in the nonzero algebra $D$, a contradiction. This proves $r in bb(Z)_(\( p \))$. If $z$ has zero point restriction and $r in.not p bb(Z)_(\( p \))$, then $r$ is a unit of $bb(Z)_(\( p \))$; the same cochain $u$ now has point restriction exactly $1$, giving the same contradiction. ◻
]

#thm([Lemma 4.3.])[
  (Integrality of homomorphism counts).  #emph[For every finite group $F$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ frac(\| "Hom"_(upright("cts")) \( Gamma \, F \) \|, \| F \|) in bb(Z)_(\( p \)) . $ <eq:hom-integrality>]

]
] <lem:hom-integrality>

#proof[
  The integral $epsilon.alt_(B F) \( 1 \)$ is an actual element of $pi_0 upright(bold(1))$. By 8, its image in a sufficiently advanced nonzero $D$ is the scalar
  $ sum_(\[ alpha \] in "Hom"_(upright("cts")) \( Gamma \, F \) \/ F) frac(1, \| C_F \( "im" alpha \) \|) = frac(\| "Hom"_(upright("cts")) \( Gamma \, F \) \|, \| F \|) \, $
  where the equality is orbit–stabilizer for conjugation by $F$. Apply 9 with the trivial group as its $F$. ◻
]

For the fixed source $bb(Z)_p^l$, Ben-Moshe proves compatibility of transchromatic characters with integration. His cardinality formula on $B F$ gives $\| "Hom"_(upright("cts")) \( bb(Z)_p^l \, F \) \| \/ \| F \| in bb(Z)_(\( p \))$ [4] Theorems 5.7 and 5.8. Here the source $Gamma$ is selected by the occurrence construction of 3.

For finitely generated discrete groups, Gordon and Rodriguez-Villegas characterize integrality of these homomorphism-count ratios for all finite targets by infinite abelianization [8] Corollary 3.3. Here the homomorphisms are continuous and the conclusion is $p$-integrality; cyclic targets will give the first $bb(Z)_p$ quotient in 5.

=== 4.3 Labeled sets and open subgroups <labeled-sets-and-open-subgroups>

#thm([Theorem 4.4.])[
  (Congruences for open subgroups).  #emph[For every open subgroup $U lt.eq_o Gamma$, every finite continuous $U$-set $X$, and every $h gt.eq 0$, 
#[#set math.equation(numbering: n => "(4.6)")
 $ sum_(V lt.eq_o U\
 \[ U : V \] = p^h) #scale(x: 120%, y: 120%)[\(] \| X^V \| - \| X \| #scale(x: 120%, y: 120%)[\)] in p^(h + 1) bb(Z)_(\( p \)) . $ <eq:subgroup-congruence>]

 The sum is over all open subgroups of the indicated index.]
] <thm:subgroup-congruence>

#proof[
  We realize weighted counts of finite $U$-sets equivariantly labeled in $X$ as character values of integral pushforwards. The logarithm of their generating function isolates the transitive sets, whose stabilizers give the open subgroups in (4.6).
  For $j gt.eq 0$, let $cal(L)_j \( X \)$ be the groupoid of continuous $U$-sets $T$ of size $j$ equipped with a $U$-equivariant map $T arrow.r X$. Its arrows are the equivariant bijections preserving the labeling. Since $U$ is finitely generated, it has only finitely many homomorphisms to $Sigma_j$, so this groupoid is finite up to equivalence. Set
  #[#set math.equation(numbering: n => "(4.7)")
   $ b_j \( X \) = \| cal(L)_j \( X \) \|_(upright(h)) = sum_(\[ T arrow.r X \]) frac(1, \| "Aut"_U \( T arrow.r X \) \|) . $ <eq:labeled-count>]
  Write $X_(upright("triv"))$ for the same underlying set with trivial action. We first prove
  #[#set math.equation(numbering: n => "(4.8)")
   $ b_j \( X \) in bb(Z)_(\( p \)) \, #h(2em) b_j \( X \) - b_j \( X_(upright("triv")) \) in p bb(Z)_(\( p \)) . $ <eq:labeled-integrality>]
  Choose $N lt.closed.eq_o Gamma$ contained in $U$ and in the kernel of the action on $X$, and put $Q = Gamma \/ N$ and $overline(U) = U \/ N$. The finite groupoid
  $ Y_j \( X \) = X^j \/ \/ Sigma_j $
  classifies $j$-element sets labeled in $X$; $overline(U)$ acts by changing the labels. Form its coinduction
  $ Z_j \( X \) = "Coind"_(overline(U))^Q Y_j \( X \) . $
  This is a finite $Q$-groupoid whose underlying groupoid is a product of $\[ Gamma : U \]$ copies of $Y_j \( X \)$. More explicitly, choosing representatives $r_t$ for $t in Q \/ overline(U)$, with $r_(overline(U)) = 1$, gives this product model; if $a r_t = r_(a t) u \( a \, t \)$, then $a$ sends the $t$-coordinate to the $a t$-coordinate using the action of $u \( a \, t \) in overline(U)$. Let
  $ pi_j : E_j \( X \) = Z_j \( X \) \/ \/ Q arrow.r B Q \, #h(2em) z_j \( X \) = \( pi_j \)_(!) 1 in pi_0 A_Q . $
  These are a map of finite groupoids and an integral cochain.
  Make the same construction for $X_(upright("triv"))$, using the same $N$ and $Q$. For this fixed $j$, choose a common stage $L$ sufficiently advanced for $Q$ and every component automorphism group of both total groupoids $E_j \( X \)$ and $E_j \( X_(upright("triv")) \)$. Then $D = D_L eq.not 0$, and inflation gives equivalences
  $ "Fun" \( B L \, E_j \( X \) \) tilde.eq cal(X)_Gamma \( E_j \( X \) \) \, #h(2em) "Fun" \( B L \, B Q \) tilde.eq cal(X)_Gamma \( B Q \) \, $
  and likewise for $X_(upright("triv"))$. In particular, the quotient homomorphism $q : Gamma arrow.r Q$ factors through $L$. Factorization gives essential surjectivity of these equivalences, and surjectivity of $Gamma arrow.r L$ identifies the intertwining conditions and gives full faithfulness. The equivalences therefore identify homotopy fibers over $q$. The quotient $Q$ specifies the original action, while $L$ also captures actions on the labeled objects. Each coefficient uses finitely many total groupoids, so such a common stage exists by 6.
  We can now evaluate both cochains at the character indexed by $q$ over this same $D$. By 8, the value of $z_j \( X \)$ is the homotopy cardinality of
  #[#set math.equation(numbering: n => "(4.9)")
   $ cal(X)_Gamma \( E_j \( X \) \) times_(cal(X)_Gamma \( B Q \))^h { q } & tilde.eq Z_j \( X \)^(h Gamma)\
 & tilde.eq Y_j \( X \)^(h U) tilde.eq cal(L)_j \( X \) . $ <eq:coinduced-fiber>]
  Here $\( - \)^(h Gamma)$ and $\( - \)^(h U)$ mean continuous equivariant objects, including their coherence isomorphisms. The first equivalence identifies a lift of $q$, together with its specified identification over $B Q$, with an equivariant object of the pulled-back bundle. For the second, evaluate an equivariant object at the identity coset. To construct an inverse, choose lifts $g_t in Gamma$ of the representatives $r_t$, with $g_U = 1$, and place a copy of the $U$-equivariant object in each coordinate. The coherence map for $gamma in Gamma$ from coordinate $t$ to coordinate $gamma t$ is supplied by the $U$-equivariance map for
  $ g_(gamma t)^(- 1) gamma g_t in U . $
  Its image in $overline(U)$ is $u \( q gamma \, t \)$, as required by the product action above. The cocycle identity proves coherence; the same construction on morphisms shows that the two functors are inverse equivalences. Continuity follows from continuity of the $U$-equivariance data and the finiteness of $Gamma \/ U$. Finally, equivariance of a labeled $j$-element set is precisely a continuous $U$-action on that set for which its map to $X$ is equivariant. Thus $chi_q \( z_j \( X \) \) = b_j \( X \) dot.op 1_D$. The same argument gives $chi_q \( z_j \( X_(upright("triv")) \) \) = b_j \( X_(upright("triv")) \) dot.op 1_D$.
  After forgetting their $Q$-actions, the groupoids $Z_j \( X \)$ and $Z_j \( X_(upright("triv")) \)$ are equivalent: their product factors have the same underlying labeled-set groupoid. Base change along $* arrow.r B Q$ therefore gives the integral equality
  $ z_j \( X \) \|_(*) = epsilon.alt_(Z_j \( X \)) \( 1 \) = epsilon.alt_(Z_j \( X_(upright("triv")) \)) \( 1 \) = z_j \( X_(upright("triv")) \) \|_(*) quad upright("in ") pi_0 upright(bold(1)) . $
  Apply 9 to $z_j \( X \)$ and to the difference of the two classes, evaluated over the same $D$. This proves (4.8).
  It remains to pass from all labeled sets to transitive ones. Define the formal power series
  $ B_X \( t \) = sum_(j gt.eq 0) b_j \( X \) t^j in 1 + t bb(Z)_(\( p \)) \[ \[ t \] \] . $
  Every finite labeled $U$-set is a disjoint union of transitive labeled $U$-sets. If a transitive isomorphism type $a$ has size $m_a$ and automorphism group of order $c_a$, then $k$ copies have automorphism group of order $c_a^k k !$. This orbit decomposition is the mechanism behind Tamanoi’s automorphism-weighted exponential formulas [18] Theorem 5-5 and equation (5-7). Consequently, degree by degree in $bb(Q) \[ \[ t \] \]$,
  #[#set math.equation(numbering: n => "(4.10)")
   $ B_X \( t \) = product_a sum_(k gt.eq 0) frac(t^(k m_a), c_a^k k !) \, #h(2em) log B_X \( t \) = sum_a t^(m_a) / c_a . $ <eq:transitive-exponential>]
  There are finitely many types in each degree, which justifies these formal products and sums.
  A transitive continuous $U$-set has size $p^h$ for some $h$, since $U$ is pro-$p$. Pointing a transitive labeled set of size $p^h$ multiplies its homotopy cardinality by $p^h$ and makes every automorphism trivial. A pointed object is determined, up to unique isomorphism, by the stabilizer $V lt.eq_o U$ of its distinguished point and its label $x in X^V$. It follows that
  #[#set math.equation(numbering: n => "(4.11)")
   $ \[ t^(p^h) \] log B_X \( t \) = 1 / p^h sum_(V lt.eq_o U\
 \[ U : V \] = p^h) \| X^V \| . $ <eq:transitive-coefficient>]
  In particular this normalization counts actual subgroups, without passing to conjugacy classes.
  By (4.8),
  $ frac(B_X \( t \), B_(X_(upright("triv"))) \( t \)) = 1 + p A \( t \) quad upright("for some ") A \( t \) in t bb(Z)_(\( p \)) \[ \[ t \] \] . $
  Its formal logarithm lies in $p bb(Z)_(\( p \)) \[ \[ t \] \]$, because
  $ log \( 1 + p A \( t \) \) = sum_(q gt.eq 1) frac(\( - 1 \)^(q + 1) p^q, q) A \( t \)^q \, #h(2em) q - v_p \( q \) gt.eq 1 . $
  Only finitely many terms contribute to any coefficient, and the valuation inequality holds also at $p = 2$. Taking the coefficient of $t^(p^h)$, using (4.11) for $X$ and $X_(upright("triv"))$, and multiplying by $p^h$ proves (4.6). ◻
]

== 5 From subgroup congruences to procyclic length <sec:profinite>

We now isolate the group-theoretic consequence of the character calculations. All homomorphisms between profinite groups are understood to be continuous, and a finite section means a finite quotient of a closed subgroup. For a finite $p$-group $F$, write $d \( F \)$ for its minimum number of generators.

#thm([Theorem 5.1.])[
  #emph[Let $Gamma$ be a finitely generated pro-$p$ group, and let $l gt.eq 0$. Suppose that $d \( F \) lt.eq l$ for every finite section $F$ of $Gamma$, that 
#[#set math.equation(numbering: n => "(5.1)")
 $ frac(\| "Hom"_(upright("cts")) \( Gamma \, F \) \|, \| F \|) in bb(Z)_(\( p \)) #h(2em) upright("for every finite group ") F \, $ <eq:profinite-hom>]

 and that, for every $U lt.eq_o Gamma$, every finite continuous $U$-set $X$, and every $h gt.eq 0$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ sum_(V lt.eq_o U\
 \[ U : V \] = p^h) #scale(x: 120%, y: 120%)[\(] \| X^V \| - \| X \| #scale(x: 120%, y: 120%)[\)] in p^(h + 1) bb(Z)_(\( p \)) . $ <eq:profinite-congruences>]

 Then $Gamma$ has a series of closed subgroups 
$ 1 = K_t lt.closed.eq K_(t - 1) lt.closed.eq dots.h.c lt.closed.eq K_0 = Gamma \, #h(2em) t lt.eq l \, $

 whose nontrivial factors are isomorphic to $bb(Z)_p$. In particular, every finite quotient $P$ of $Gamma$ satisfies $ell \( P \, 1 \) lt.eq l$.]
] <thm:procyclic>

The congruence in (5.2) is summed over actual open subgroups. These sums are finite: an open subgroup of a given index is a point stabilizer in a permutation action of that degree, and a finitely generated profinite group has only finitely many such actions. We say that a finitely generated pro-$p$ group #emph[satisfies the subgroup congruences] when this formula holds for all its open subgroups. This property is inherited by open subgroups. For nontrivial $Gamma$, homomorphism-count integrality supplies the first $bb(Z)_p$ quotient. After each quotient is extracted, shrinking its action replaces a semidirect product by a direct product while preserving the subgroup congruences and section bound. Subgroup counting then gives another $bb(Z)_p$ quotient whenever the remaining kernel is nontrivial.

=== 5.1 Finite quotients and shrinking actions <finite-quotients-and-shrinking-actions>

We first record the elementary profinite facts needed to make that limit precise.

#thm([Lemma 5.2.])[
  #emph[Let $E$ be a pro-$p$ group.]
  + #emph[Every finite section of $E$ is a section of a finite quotient of $E$. If all finite sections of $E$ have generator number at most $l$, then every closed subgroup of $E$ is topologically generated by at most $l$ elements.]
  + #emph[A procyclic pro-$p$ group is either trivial, finite cyclic, or isomorphic to $bb(Z)_p$. Every continuous epimorphism $K arrow.r.twohead bb(Z)_p$ splits.]
  + #emph[A finitely generated pro-$p$ group with infinite abelianization has a continuous epimorphism onto $bb(Z)_p$.]
] <lem:profinite-elementary>

#proof[
  For a closed subgroup $H lt.eq E$ and $N lt.closed.eq_o H$, choose $M lt.closed.eq_o E$ with $H ∩ M subset.eq N$. Then $H \/ N$ is a quotient of the subgroup $H \/ \( H ∩ M \)$ of $E \/ M$. Under the asserted generator bound, for each $N lt.closed.eq_o H$ the set of tuples in $H^l$ generating $H \/ N$ is nonempty and closed. These sets have the finite intersection property, by replacing finitely many $N$ by their intersection. Compactness supplies a tuple generating every finite quotient of $H$, hence topologically generating $H$.
  A topological generator gives a continuous epimorphism $bb(Z)_p arrow.r.twohead Q$ onto any procyclic pro-$p$ group $Q$. Every closed subgroup of $bb(Z)_p$ is a $bb(Z)_p$-submodule and is either $0$ or $p^a bb(Z)_p$, proving the classification. If $K arrow.r.twohead bb(Z)_p$, choose $x in K$ mapping to $1$. The closed subgroup generated by $x$ maps isomorphically to $bb(Z)_p$: a nonzero closed kernel in a procyclic group would make the quotient finite. This supplies a continuous section.
  Finally, the abelianization of a finitely generated pro-$p$ group is a finitely generated $bb(Z)_p$-module. The elementary structure theorem over the discrete valuation ring $bb(Z)_p$ writes it as a finite group times $bb(Z)_p^b$. If it is infinite, then $b > 0$. ◻
]

#thm([Lemma 5.3.])[
  (Shrinking an action).  #emph[Let $K$ be a pro-$p$ group and let $d \, l gt.eq 0$. Suppose $K times bb(Z)_p^d$ satisfies the subgroup congruences and all its finite sections have generator number at most $l$. If $K arrow.r.twohead bb(Z)_p$ has kernel $N$, then $N times bb(Z)_p^(d + 1)$ has both properties.]
] <lem:shrinking-action>

#proof[
  By 13, write $K = N times.r_alpha bb(Z)_p$, with $N$ finitely generated. For $s gt.eq 0$, put
  $ E_s = \( N times.r_(alpha_s) bb(Z)_p \) times bb(Z)_p^d \, #h(2em) alpha_s \( z \) = alpha \( p^s z \) \, #h(2em) E_oo = N times bb(Z)_p^(d + 1) . $
  The group $E_s$ is isomorphic to the open subgroup $\( N times.r p^s bb(Z)_p \) times bb(Z)_p^d$ of $K times bb(Z)_p^d$, and hence has both stated properties.
  We construct a common finite quotient which captures every permutation action of a prescribed bounded degree. Fix $M gt.eq 1$, and let
  $ O_M = ⋂_(rho in "Hom"_(upright("cts")) \( N \, Sigma_M \)) ker rho . $
  There are finitely many such homomorphisms, because $N$ is finitely generated. Thus $O_M$ is open and characteristic in $N$. Choose $a gt.eq 0$ with $p^a gt.eq M$. Every $p$-element of $Sigma_M$ has order at most $p^a$, as its order is the largest length of one of its $p$-power cycles. Therefore every homomorphism from $bb(Z)_p$ to $Sigma_M$ kills $p^a bb(Z)_p$.
  The action $alpha$ on the finite group $N \/ O_M$ is continuous, so $alpha \( p^s bb(Z)_p \)$ acts trivially on it for all sufficiently large $s$. For these $s$, both $E_s$ and $E_oo$ have the quotient
  #[#set math.equation(numbering: n => "(5.3)")
   $ Q_M = \( N \/ O_M \) times \( bb(Z) \/ p^a \)^(d + 1) . $ <eq:shared-permutation-quotient>]
  Every homomorphism from either group to $Sigma_M$ factors through this quotient: its restriction to $N$ kills $O_M$, and its restrictions to the $d + 1$ cyclic coordinates kill $p^a bb(Z)_p$. The same assertion holds for every smaller permutation degree, by adding fixed points.
  Now fix $U lt.eq_o E_oo$, a finite continuous $U$-set $X$, and $h gt.eq 0$. If $X$ is empty, the required congruence is immediate. Otherwise set $m = \[ E_oo : U \]$ and take
  $ M gt.eq max { m \, thin m \| X \| \, thin m p^h } . $
  The coset action on $E_oo \/ U$ factors through $Q_M$, so $U$ is the inverse image of a subgroup $overline(U) lt.eq Q_M$. The action on the induced finite set $E_oo times_U X$ also factors through $Q_M$. In particular, the quotient kernel acts trivially on its fiber $X$ over $U$, making $X$ a $overline(U)$-set. Let $U_s lt.eq E_s$ be the inverse image of $overline(U)$, and give the same set $X$ the resulting $U_s$-action.
  Every open subgroup $V lt.eq U$ of index $p^h$ has index $m p^h$ in $E_oo$. Its coset action therefore factors through $Q_M$, so $V$ contains the quotient kernel. Exactly the same argument applies to every open subgroup of index $p^h$ in $U_s$. Thus the two collections of subgroups are both in bijection with
  $ { overline(V) lt.eq overline(U) : \[ overline(U) : overline(V) \] = p^h } . $
  The corresponding fixed-point counts on $X$ agree term by term. The congruence for $U_s$ consequently proves the congruence for $U$. This proves the required assertion for every open subgroup of $E_oo$ and every test on it.
  For the generator bound, let $F$ be a finite quotient of $E_oo$. Its regular permutation action shows, using $M gt.eq \| F \|$, that the quotient map factors through (5.3). Thus $F$ is also a quotient of $E_s$ for sufficiently large $s$. Every finite section of $E_oo$ is a section of such an $F$ by 13; it therefore has generator number at most $l$. ◻
]

=== 5.2 Detecting the remaining kernel <detecting-the-remaining-kernel>

The subgroup-counting formula below is classical; see Tamanoi [17] Lemma 5-5. We include its proof and record the $p$-adic limit needed for the kernel argument.

#thm([Lemma 5.4.])[
  #emph[For $d gt.eq 1$, let $a_j \( d \)$ be the number of open subgroups of index $p^j$ in $bb(Z)_p^d$. Then 
#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(j gt.eq 0) a_j \( d \) t^j & = product_(u = 0)^(d - 1) \( 1 - p^u t \)^(- 1) \,\
lim_(j arrow.r oo) a_j \( d \) & = c_d := product_(u = 1)^(d - 1) \( 1 - p^u \)^(- 1) eq.not 0 quad upright("in ") bb(Z)_p . $ <eq:lattice-generating-function>]

]
] <lem:lattice-limit>

#proof[
  For $d = 1$ there is exactly one subgroup of each index. For $d > 1$, project a sublattice of $bb(Z)_p times bb(Z)_p^(d - 1)$ onto the first coordinate. If its image is $p^a bb(Z)_p$ and its intersection with the remaining coordinates has index $p^b$, it is determined by that intersection and a lift of $p^a$ modulo it. There are $p^b$ choices of lift, and the total index is $p^(a + b)$. Consequently
  $ a_j \( d \) = sum_(a + b = j) p^b a_b \( d - 1 \) \, $
  which gives the displayed generating function by induction.
  Write
  $ product_(u = 1)^(d - 1) \( 1 - p^u t \)^(- 1) = sum_(m gt.eq 0) b_m t^m . $
  Each $b_m$ is divisible by $p^m$, and the generating function gives $a_j \( d \) = sum_(m = 0)^j b_m$. These partial sums converge $p$-adically. The convergent geometric series in the finite product identify their limit with $c_d$. Every factor $1 - p^u$, $u gt.eq 1$, is a $p$-adic unit, so $c_d$ is nonzero. The empty product for $d = 1$ is $1$. ◻
]

#thm([Lemma 5.5.])[
  #emph[Let $K$ be a nontrivial finitely generated pro-$p$ group and $d gt.eq 1$. If $K times bb(Z)_p^d$ satisfies the subgroup congruences, then $K$ has infinite abelianization.]
] <lem:kernel-abelianization>

#proof[
  Let $Phi \( K \)$ be the intersection of the kernels of homomorphisms $K arrow.r C_p$. There are finitely many such homomorphisms, so $F = K \/ Phi \( K \)$ is a finite elementary abelian group. It is nontrivial: a nontrivial pro-$p$ group has a nontrivial finite $p$-group quotient, and every nontrivial finite $p$-group has a quotient $C_p$. We will use the following precise property of $F$:
  #[#set math.equation(numbering: n => "(5.5)")
   $ J lt.eq K upright(" closed and ") J arrow.r.twohead F quad arrow.r.double quad J = K . $ <eq:frattini-detector>]
  Indeed, if $J$ were proper, its image would be proper in some finite quotient of $K$. A maximal subgroup containing that image is normal of index $p$, as in every finite $p$-group. Its inverse image is the kernel of a map $K arrow.r.twohead C_p$ containing $J$, contradicting surjectivity onto $F$.
  The rational full-mark idempotent $e_F^F$ is a rational virtual $F$-set with mark $1$ at $F$ and mark $0$ at every proper subgroup. Since $F eq.not 1$, its underlying virtual cardinality is zero. Choose a positive integer $D$ clearing its denominators and inflate $D e_F^F$ to $E = K times bb(Z)_p^d$ through $E arrow.r K arrow.r F$. For a closed subgroup of $E$, its projection to $K$ is closed. By (5.5), the inflated virtual set has mark $D$ exactly when that projection is all of $K$, and mark zero otherwise.
  Let $c_h$ be the number of open subgroups of index $p^h$ in $E$ projecting onto $K$. The congruences extend by additivity to integral virtual sets. Applying them to $D e_F^F$ at $U = E$ gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ D c_h in p^(h + 1) bb(Z)_(\( p \)) \, #h(2em) v_p \( c_h \) gt.eq h + 1 - v_p \( D \) . $ <eq:surjective-count-vanishes>]
  In particular, $c_h arrow.r 0$ in $bb(Q)_p$.
  We compute this count in a second way. Set $A = bb(Z)_p^d$. For an open subgroup $H lt.eq K times A$ projecting onto $K$, put $V = H ∩ K$ and $W = "pr"_A \( H \)$. Then $V lt.closed.eq_o K$: a lift in $H$ of any element of $K$ normalizes $V$. Also $W lt.eq_o A$, and $H \/ V$ is the graph of a unique continuous surjection
  $ f : W arrow.r.twohead K \/ V . $
  Conversely, every such triple $\( V \, W \, f \)$ gives one subgroup $H$. Its index is $\[ K : V \] \[ A : W \]$. Every open subgroup $W$ of $A$ is isomorphic to $A$, and hence
  #[#set math.equation(numbering: n => "(5.7)")
   $ c_h = sum_(V lt.closed.eq_o K\
 \[ K : V \] = p^i \, med i lt.eq h) a_(h - i) \( d \) thin \| "Sur"_(upright("cts")) \( bb(Z)_p^d \, K \/ V \) \| . $ <eq:graph-subgroup-count>]
  There is no automorphism denominator: the actual graph map is uniquely determined by the actual subgroup.
  Suppose now that $K^(upright("ab"))$ were finite. Any $K \/ V$ appearing with a nonzero summand in (5.7) is abelian, so $V$ contains the closed commutator subgroup. There are therefore only finitely many contributing $V$. By 15,
  $ lim_(h arrow.r oo) c_h = c_d sum_(V lt.closed.eq_o K) \| "Sur"_(upright("cts")) \( bb(Z)_p^d \, K \/ V \) \| eq.not 0 \, $
  where the sum has only finitely many nonzero terms and is a positive integer: $V = K$ contributes $1$. This contradicts (5.6), proving the lemma. ◻
]

=== 5.3 The series and the rational gluing estimate <the-series-and-the-rational-gluing-estimate>

#proof[
  If $Gamma = 1$, the empty series suffices. Otherwise $Gamma$ has infinite abelianization. For if $Gamma^(upright("ab"))$ were finite of order $p^b$, then for every sufficiently large $r$,
  $ \| "Hom"_(upright("cts")) \( Gamma \, C_(p^r) \) \| = p^b . $
  This follows by decomposing the finite abelianization into cyclic factors, each of which has as many maps to $C_(p^r)$ as it has elements once $p^r$ is divisible by its exponent. Equation (5.1) would then assert $p^(b - r) in bb(Z)_(\( p \))$ for arbitrarily large $r$, a contradiction. Thus 13 supplies an epimorphism $K_0 = Gamma arrow.r.twohead bb(Z)_p$ with kernel $K_1$.
  By 14, $K_1 times bb(Z)_p$ satisfies the subgroup congruences and has the same finite-section bound. More generally, after $d$ steps we obtain $K_d times bb(Z)_p^d$ with these properties. If $K_d eq.not 1$, it is finitely generated by 13, and for $d gt.eq 1$, 16 supplies an epimorphism $K_d arrow.r.twohead bb(Z)_p$. Take its kernel $K_(d + 1)$ and apply 14 again.
  If $K_d eq.not 1$, it has a quotient $C_p$, so $K_d times bb(Z)_p^d$ has a quotient $\( C_p \)^(d + 1)$. The section bound therefore forces $d + 1 lt.eq l$. The construction must terminate with $K_t = 1$ for some $t lt.eq l$, and $K_(i - 1) \/ K_i tilde.equiv bb(Z)_p$ at every step. Taking the images of these subgroups in a finite quotient $P$ gives a subnormal series with cyclic factors. Deleting repetitions proves $ell \( P \, 1 \) lt.eq l$. ◻
]

#thm([Corollary 5.6.])[
  (Rational gluing estimate).  #emph[For every finite $p$-group $P$ and every $l gt.eq 0$, 
$ #scale(x: 120%, y: 120%)[\(] U_P \( L_(T \( l \)) S \) #scale(x: 120%, y: 120%)[\)]_(bb(Q)) eq.not 0 quad arrow.r.double quad ell \( P \, 1 \) lt.eq l . $

]
] <cor:rational-gluing>

#proof[
  For $l gt.eq 1$, 6 constructs a pro-$p$ group $Gamma arrow.r.twohead P$ with the required finite-section bound. Lemma 4.3, Theorem 4.4 give (5.1) and (5.2). The conclusion follows from 12.
  For $l = 0$, let $P eq.not 1$. Rational group cohomology, computed by averaging, gives $\( H bb(Q) \)^(B P) tilde.eq H bb(Q)$. The transfer class of $P \/ 1$ acts on these cochains as multiplication by $\| P \|$, which is invertible, whereas its full $P$-mark is zero. The full-mark summand is consequently zero. The rational categorical-to-geometric fixed-point comparison of 4 gives $#scale(x: 120%, y: 120%)[\(] U_P \( H bb(Q) \) #scale(x: 120%, y: 120%)[\)]_(bb(Q)) = 0$. Cofree completion and geometric fixed points preserve rational objects, since multiplication by every nonzero integer remains an equivalence. Hence $U_P \( H bb(Q) \) = 0$. Thus nonvanishing at $l = 0$ forces $P = 1$, as required. ◻
]

The next elementary consequence of inverse limits will subtract a free abelian rank in the higher-height argument.

#thm([Lemma 5.7.])[
  #emph[Let $P$ be a finite $p$-group, and let $k \, l gt.eq 0$. If 
$ ell #scale(x: 120%, y: 120%)[\(] P times \( C_(p^r) \)^k \, 1 #scale(x: 120%, y: 120%)[\)] lt.eq l #h(2em) upright("for every ") r gt.eq 1 \, $

 then $k + ell \( P \, 1 \) lt.eq l$.]
] <lem:product-series>

#proof[
  Write $G_r = P times \( C_(p^r) \)^k$. At each level let $cal(S)_r$ be the finite nonempty set of all cyclic-quotient subnormal chains from $1$ to $G_r$ of length exactly $l$, allowing repetitions. Projection induces maps $cal(S)_(r + 1) arrow.r cal(S)_r$. There is a compatible choice of chains: in the compact product of the finite sets $cal(S)_r$, any finite collection of compatibility conditions is satisfied by projecting a chain from the largest level mentioned. The finite intersection property applies even though the maps between the sets of chains need not be surjective.
  Denote the selected chain at level $r$ by $\( H_(i \, r) \)_(0 lt.eq i lt.eq l)$. Compatibility means that every map $H_(i \, r + 1) arrow.r H_(i \, r)$ is surjective. The inverse limits give closed subgroups
  $ 1 = H_0 lt.closed.eq H_1 lt.closed.eq dots.h.c lt.closed.eq H_l = P times bb(Z)_p^k . $
  Moreover,
  $ H_i \/ H_(i - 1) tilde.equiv "proj lim"_r H_(i \, r) \/ H_(i - 1 \, r) . $
  To see surjectivity of this comparison, take a compatible tuple of cosets. Its nonempty finite sets of representatives at the finite levels have compatible choices by compactness, giving a representative in $H_i$. The kernel is $H_(i - 1)$. Each displayed inverse limit is procyclic: the surjective transition maps of its cyclic finite quotients send generators to generators, so compatible generators exist by the same compactness argument, and their resulting closed cyclic subgroup surjects to every level.
  Let $A_i$ be the image of $H_i$ in $bb(Z)_p^k$, and set $J_i = H_i ∩ P$. These subgroups are closed, and there is an exact sequence
  #[#set math.equation(numbering: n => "(5.8)")
   $ 1 arrow.r J_i \/ J_(i - 1) arrow.r H_i \/ H_(i - 1) arrow.r A_i \/ A_(i - 1) arrow.r 1 . $ <eq:product-series-exact>]
  For the kernel assertion, an element of $H_i$ projecting into $A_(i - 1)$ can be multiplied by an element of $H_(i - 1)$ with the same projection; the resulting element belongs to $J_i$, and $J_i ∩ H_(i - 1) = J_(i - 1)$.
  Each $A_i$ is a $bb(Z)_p$-submodule of $bb(Z)_p^k$. The procyclic quotient $A_i \/ A_(i - 1)$ has rank at most one, and the rank increments add to $k$. Exactly $k$ steps therefore increase rank. At any such step, $H_i \/ H_(i - 1)$ is an infinite procyclic pro-$p$ group, hence $bb(Z)_p$ by 13. Its finite subgroup $J_i \/ J_(i - 1)$ is trivial. Thus $J_i = J_(i - 1)$ at each of these $k$ steps.
  The $J_i$ form a subnormal chain from $1$ to $P$. Their factors embed in the procyclic factors of the $H_i$ and, being finite, are cyclic. Deleting the $k$ repetitions just found leaves a cyclic-quotient chain of length at most $l - k$, proving the claim. ◻
]

== 6 Gluing at every chromatic height <sec:gluing>

We now strengthen the rational estimate of 17. A nonzero height-$k$ part of a cofree fixed-point algebra will produce rational nonvanishing after adjoining $k$ cyclic factors of arbitrarily large order. The rank subtraction in 18 then accounts for the additional $k$ in the estimate.

=== 6.1 Detecting a nonzero local algebra <detecting-a-nonzero-local-algebra>

#thm([Lemma 6.1.])[
  (Ring detection).  #emph[Let $R$ be a unital associative ring spectrum and $k gt.eq 0$. Then 
$ T \( k \) and R eq.not 0 quad arrow.r.double quad K \( k \) and R eq.not 0 . $

]
] <lem:ring-detection>

#proof[
  The assertion at $k = 0$ is immediate. For $k > 0$, choose a positive-degree periodic self-map $v : Sigma^d V arrow.r V$ of a finite type-$k$ spectrum whose telescope represents $T \( k \)$. Suppose that $K \( k \) and R = 0$. In the associative ring spectrum
  $ A = "End" \( V \) and R $
  consider the element $x = v ⊗ 1 in pi_d A$. Its image in $K \( j \)_(*) A$ is nilpotent at every finite height $j eq.not k$, since the corresponding image of $v$ is already nilpotent. At height $k$ it is zero by hypothesis. The mod-$p$ Hurewicz image of $v$ is nilpotent as well: it has positive degree in the bounded graded ring $H_(*) \( "End" \( V \) \; bb(F)_p \)$. This remains true after mapping to $H_(*) \( A \; bb(F)_p \)$.
  The ring form of the nilpotence theorem therefore gives $x^N = 0$ for some $N$ [12] Theorem 3(i). Here the tests include rational homology and mod-$p$ homology, and the theorem imposes no boundedness condition on $A$. Acting on $V and R$ shows that $\( v and 1_R \)^N$ is null. Its telescope is consequently zero, so $T \( k \) and R = 0$, as required. ◻
]

#thm([Lemma 6.2.])[
  (The rational unit).  #emph[If $k > 0$ and $B$ is a nonzero commutative algebra in $upright("Sp")_(K \( k \))$, then its unit has nonzero image in $pi_0 B ⊗ bb(Q)$.]
] <lem:rational-unit>

#proof[
  The category $upright("Sp")_(K \( k \))$ is stable, $p$-local, and $1$-semiadditively symmetric monoidal [5] Corollary 5.3.2. Apply the torsion-nilpotence theorem [5] Theorem 4.3.5 with its coalgebra equal to the unit and its commutative algebra equal to $B$. It says that every torsion element of $pi_0 B$ is nilpotent. If the unit were torsion, it would be zero. The unitality identity would then make $upright("id")_B$ zero, contradicting $B eq.not 0$. ◻
]

=== 6.2 An abelian full-mark trace <an-abelian-full-mark-trace>

Fix $k > 0$, and let $E = E_k$ be Lubin–Tate theory of height $k$ at $p$. Thus $E$ is an even periodic, $K \( k \)$-local commutative ring with

$ E_0 = W \( bb(F)_(p^k) \) \[ \[ u_1 \, dots.h \, u_(k - 1) \] \] . $

We use its commutative realization from the Goerss–Hopkins–Miller theorem [7] Section 7. We write $hat(⊗)_E$ for tensor product in the category of $K \( k \)$-local $E$-modules. In particular, the hat denotes the local tensor product, not an assumption of flatness on coefficients.

#thm([Proposition 6.3.])[
  (Surjective characters survive base change).  #emph[Let $B$ be a nonzero commutative $E$-algebra in $upright("Sp")_(K \( k \))$. For every $r gt.eq 1$, put $C = \( C_(p^r) \)^k$. Then 
$ #scale(x: 120%, y: 120%)[\(] U_C \( B \) #scale(x: 120%, y: 120%)[\)]_(bb(Q)) eq.not 0 . $

]
] <prop:abelian-full-mark>

#proof[
  By 4, it suffices to show that the full-mark projector on $B^(B C)$ is nonzero after rationalizing morphisms. We will detect it by computing its trace over $E$ and then extending scalars to $B$.
  With degree-zero coordinates for the formal group, the complex-oriented cyclic calculation gives
  $ E^0 \( B C \) = E_0 \[ \[ x_1 \, dots.h \, x_k \] \] \/ \( \[ p^r \] \( x_1 \) \, dots.h \, \[ p^r \] \( x_k \) \) . $
  It is finite free of rank $p^(r k^2)$ over $E_0$, and $E^(*) \( B C \)$ is concentrated in even degrees [10] Corollaries 5.8 and 5.10. Choosing representatives for a degree-zero basis gives an equivalence
  $ E^(B C) tilde.eq E^(xor p^(r k^2)) $
  of $E$-modules. Thus the categorical trace of an endomorphism of $E^(B C)$ is its ordinary matrix trace over $E_0$.
  Lubin–Tate theory satisfies the complete-local and finite-height hypotheses of the generalized character theorem [10] Theorem C and the examples following it. After a faithfully flat extension of $E_0 \[ 1 \/ p \]$, the character isomorphism identifies the base change of $E^0 \( B C \)$ with functions on $"Hom"_(upright("cts")) \( bb(Z)_p^k \, C \)$. A finite $C$-set $S$ acts at a character $alpha$ by $\| S^("im" alpha) \|$, by the transfer formula [10] Theorem D and Example 6.16. Consequently the full mark $e_C^C$ is the projector retaining precisely the surjective characters. Its trace is
  #[#set math.equation(numbering: n => "(6.1)")
   $ "tr"_E \( e_C^C divides E^(B C) \) = N_(k \, r) dot.op 1 \, #h(2em) N_(k \, r) = p^(k^2 \( r - 1 \)) product_(i = 0)^(k - 1) \( p^k - p^i \) > 0 $ <eq:full-mark-trace>]
  in $E_0 ⊗ bb(Q)$. Indeed every homomorphism to $C$ factors through $\( bb(Z) \/ p^r \)^k$; it is onto precisely when its matrix reduces to an invertible matrix over $bb(F)_p$. Each such matrix has $p^(k^2 \( r - 1 \))$ lifts. Faithful flatness descends this trace equality from the character extension to $E_0 \[ 1 \/ p \]$.
  Now apply extension of scalars
  $ B hat(⊗)_E \( - \) : "Mod"_E \( upright("Sp")_(K \( k \)) \) arrow.r "Mod"_B \( upright("Sp")_(K \( k \)) \) . $
  Both module categories are $1$-semiadditive: their finite-groupoid norms are computed after forgetting the module structure, where they are equivalences. Extension of scalars preserves colimits and hence finite-groupoid limits [5] Corollary 3.2.4. We obtain the canonical equivalence
  #[#set math.equation(numbering: n => "(6.2)")
   $ B hat(⊗)_E E^(B C) tilde.eq B^(B C) . $ <eq:local-cochain-base-change>]
  It respects the cochain algebra structures, restrictions, and finite-cover transfers; compatibility of the canonical norms with such functors gives the transfer assertion [5] Theorem 3.2.3 and Corollary 3.2.7. In particular, it carries the Burnside projector over $E$ to that over $B$.
  This symmetric monoidal functor preserves categorical traces of dualizable objects. After tensoring morphism groups with $bb(Q)$, (6.1) therefore becomes
  $ "tr"_B \( e_C^C divides B^(B C) \) = N_(k \, r) dot.op 1_B quad upright("in ") pi_0 B ⊗ bb(Q) . $
  This is nonzero by 20. The projector is thus a nonzero endomorphism in the rationalized module category. It acts by multiplication by $a = e_C^C dot.op 1 in pi_0 \( B^(B C) \) ⊗ bb(Q)$, so $a eq.not 0$. The rational full-mark comparison of 4 identifies this element with the unit of $\( U_C \( B \) \)_(bb(Q))$, which proves the proposition.
  All tensor products and groupoid limits in (6.2) were formed before rationalizing morphisms. The last step concerns the ordinary rational homotopy of the already formed cofree spectrum. ◻
]

=== 6.3 The product comparison and the height bound <the-product-comparison-and-the-height-bound>

#thm([Lemma 6.4.])[
  (Coherent product comparison).  #emph[For finite groups $P \, C$ and an ordinary commutative ring spectrum $D$, there is a natural unit-preserving map 
$ U_(P times C) \( D \) arrow.r U_C \( U_P \( D \) \) \, $

 where each displayed cofree construction uses the trivial action on its coefficient algebra.]
] <lem:product-comparison>

#proof[
  Write $G = P times C$. For a genuine $G$-spectrum $X$, let $"res"_(upright("mix")) X in "Fun" \( B C \, upright("Sp")^P \)$ be its restriction to a complete $P$-universe with trivial $C$-action. Let $"res"_C$ take a genuine $C$-spectrum to its underlying coherent $C$-diagram. We first justify the natural comparison
  #[#set math.equation(numbering: n => "(6.3)")
   $ "res"_C \( Phi^P X \) tilde.eq Phi^P \( "res"_(upright("mix")) X \) . $ <eq:geometric-mixed-comparison>]
  On the left, geometric fixed points retain genuine quotient symmetry; on the right, they are applied pointwise in $"Fun" \( B C \, upright("Sp")^P \)$.
  Let $rho_P \, rho_C$ be the real regular representations, and let $overline(rho)_P$ be the reduced regular representation of $P$. Put $V = overline(rho)_P ⊗ 1_C$ and $W = overline(rho)_P ⊗ rho_C$. For every $H lt.eq G$,
  $ dim W^H = \[ C : "pr"_C H \] #scale(x: 120%, y: 120%)[\(] \[ P : H ∩ P \] - 1 #scale(x: 120%, y: 120%)[\)] . $
  Thus $S^(oo W)$ is the localization sphere for the family of subgroups not containing $P$. The invariant line $1_C arrow.r rho_C$ induces a unital localization comparison $S^(oo V) arrow.r S^(oo W)$ which is a $P$-equivalence. After restriction to $"Fun" \( B C \, upright("Sp")^P \)$, this map is an equivalence and compares the two isotropy-separation formulas. For the right side of (6.3), smash with $S^(oo V)$ and take derived categorical $P$-fixed points pointwise. For the left side, use $S^(oo W)$ and evaluate the normal geometric-fixed-point formula on trivial $C$-representations. The comparison of spheres therefore gives (6.3), retaining the coherent $C$-action and the commutative algebra structures.
  Now set $Q = Phi^P "Bor"_G \( D \)$, retaining its genuine $C$-structure. Model the cofree algebra as
  $ "Bor"_G \( D \) = F \( \( E P times E C \)_(+) \, inf_G D \) . $
  Based-space cotensors are computed levelwise, so restriction to the chosen $P$-universe identifies its mixed restriction with $F_P \( \( E P times E C \)_(+) \, inf_P D \)$, including the coherent $C$-action. Projection $E P times E C arrow.r E P$ induces a map of commutative algebras
  $ "const"_C "Bor"_P \( D \) arrow.r "res"_(upright("mix")) "Bor"_G \( D \) . $
  Forgetting $C$, the projection is a $P$-equivalence: the spaces are contractible at the trivial subgroup and have empty fixed points at every nontrivial subgroup of $P$. The displayed map is therefore an equivalence in $"Fun" \( B C \, upright("Sp")^P \)$. Applying pointwise geometric $P$-fixed points and (6.3) gives an equivalence of commutative algebras
  $ "res"_C Q tilde.eq "const"_C U_P \( D \) quad upright("in ") "Fun" \( B C \, upright("Sp") \) . $
  Now apply $Phi^C$ to the unit $Q arrow.r "Bor"_C \( "res"_C Q \)$ of the underlying/cofree adjunction. Transitivity of geometric fixed points identifies its source with $U_(P times C) \( D \)$ and its target with $U_C \( U_P \( D \) \)$. The construction takes place in commutative algebras, so the map preserves units. ◻
]

#thm([Theorem 6.5.])[
  (Height gluing).  #emph[For a finite $p$-group $P$ and integers $k \, l gt.eq 0$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ T \( k \) and U_P \( L_(T \( l \)) S \) eq.not 0 quad arrow.r.double quad k + ell \( P \, 1 \) lt.eq l . $ <eq:height-gluing>]

]
] <thm:height-gluing>

#proof[
  The case $k = 0$ is 17. For $l = 0$, the cofree rational calculation gives $U_P \( H bb(Q) \) = 0$ for $P eq.not 1$, while $U_1 \( H bb(Q) \) = H bb(Q)$; the latter is killed by every positive-height telescope. Hence we may assume $k \, l > 0$.
  Put $R = U_P \( L_(T \( l \)) S \)$. This is an ordinary commutative ring spectrum, and 19 gives $K \( k \) and R eq.not 0$. Set
  $ B = L_(K \( k \)) \( E_k and R \) . $
  The algebra $B$ is nonzero. To check this without any commutativity assumption on Morava $K$-theory, use the graded-field module decomposition [12] Proposition 1.4
  $ K \( k \) and E_k tilde.eq or.big_(a in I) Sigma^(d_a) K \( k \) . $
  Here $I eq.not diameter$, since $E_k$ is nonzero and $K \( k \)$-local. Smashing with $R$ leaves a nonempty wedge of nonzero spectra, so $K \( k \) and E_k and R eq.not 0$. Localization preserves this homology. Moreover, $B$ is a commutative $E_k$-algebra in the local symmetric monoidal category, and the natural map $R arrow.r B$ is unital.
  For each $r gt.eq 1$, take $C = \( C_(p^r) \)^k$. 22 and the map $R arrow.r B$ give unital maps
  $ U_(P times C) \( L_(T \( l \)) S \) arrow.r U_C \( R \) arrow.r U_C \( B \) . $
  The target has a nonzero rational unit by 21. The source unit therefore survives rationalization as well. Applying 17 to $P times C$, we obtain
  $ ell \( P times \( C_(p^r) \)^k \, 1 \) lt.eq l #h(2em) \( r gt.eq 1 \) . $
  By 18, these inequalities imply $k + ell \( P \, 1 \) lt.eq l$. ◻
]

=== 6.4 Finite chromatic localization <finite-chromatic-localization>

#thm([Corollary 6.6.])[
  (Finite gluing).  #emph[For every finite $p$-group $P$ and all $m \, k gt.eq 0$, 
#[#set math.equation(numbering: n => "(6.5)")
 $ m < k + ell \( P \, 1 \) quad arrow.r.double quad T \( k \) and U_P \( L_m^f S \) = 0 . $ <eq:finite-gluing>]

]
] <cor:finite-gluing>

#proof[
  Fix $k gt.eq 0$ and write $d = ell \( P \, 1 \)$. We induct on $m$, retaining all values of $k$, including $k > m$. At $m = 0$, the calculation $U_P \( H bb(Q) \) = 0$ for $P eq.not 1$ proves the assertion when $d > 0$. If $P = 1$, the required cases have $k > 0$, and $T \( k \) and H bb(Q) = 0$.
  Let $m > 0$ and assume $m < k + d$. Apply the exact functor $U_P$ and then smash with $T \( k \)$ in the sphere fracture square (2.2). The corner $U_P \( L_(m - 1)^f S \)$ vanishes after this test by induction. The corner $U_P \( L_(T \( m \)) S \)$ vanishes by 23.
  For the overlap, smashing finite localization makes $L_(m - 1)^f L_(T \( m \)) S$ a module over $L_(m - 1)^f S$. Lax monoidality therefore makes its image under $U_P$ a unital module over $U_P \( L_(m - 1)^f S \)$. If $T and A = 0$ and $M$ is any unital $A$-module, the unit and action exhibit
  $ M arrow.r A and M arrow.r M $
  as a retraction, proving $T and M = 0$. Thus the overlap also vanishes after smashing with $T \( k \)$. Three corners of the resulting pullback square are zero, so its remaining corner is zero. This completes the induction. ◻
]

== 7 Separation of subgroup supports <sec:support>

24 bounds the interaction between a subgroup and a normal quotient. We now use those bounds to control specialization for every embedded subgroup. We follow the finite-localization and support-splitting strategy of Balmer–Sanders [2] proof of Theorem 9.1, (B) $arrow.r.double$(A): a specialization violating the desired bound would disconnect the irreducible support of a compact object. Here the cyclic-length estimate isolates an individual subgroup component by controlling its interactions with normal conjugates above and below it.

=== 7.1 Subgroup layers and their right adjoints <subgroup-layers-and-their-right-adjoints>

Fix a finite $p$-group $G$ and an integer $m gt.eq 0$. Put

$ E = L_m^f S \, #h(2em) e = inf_G E \, #h(2em) cal(C) = cal(C)_m^G . $

For $J lt.eq G$, write $N_J = N_G \( J \)$, $W_J = N_J \/ J$, and

$ cal(D)_J = "Fun" \( B W_J \, upright("Sp")_(L_m^f) \) . $

Let $phi.alt_J : cal(C) arrow.r cal(D)_J$ be geometric $J$-fixed points, retaining the underlying coherent $W_J$-action. We use one representative of each conjugacy class when indexing these functors. The notation $J tilde.op K$ means conjugacy in $G$.

#thm([Lemma 7.1.])[
  (Layer adjunctions).  #emph[The functor $phi.alt_J$ is strong symmetric monoidal and has a fully faithful right adjoint $F_J$. Write $cal(A)_J = F_J \( upright(bold(1))_(cal(D)_J) \)$. Then:]
  + #emph[The underlying geometric fixed points of its unit value are 
#[#set math.equation(numbering: n => "(7.1)")
 $ Phi^K cal(A)_J tilde.eq xor.big_(J' tilde.op J\
J' lt.closed.eq K) U_(K \/ J') \( E \) . $ <eq:layer-unit>]

 For arbitrary $M in cal(D)_J$, choose, for each normal conjugate $J' = g J g^(- 1) lt.closed.eq K$, the diagram $M_g$ obtained by restricting $M$ along 
$ K \/ J' arrow.r W_J \, #h(2em) x J' mapsto g^(- 1) x g J . $

 The formula for $Phi^K F_J M$ has the same index set, with summand $Phi^(K \/ J') "Bor"_(K \/ J') \( M_g \)$. In particular, $phi.alt_K F_J M = 0$ if no conjugate of $J$ is normal in $K$.]
  + #emph[For every dualizable $z in cal(C)$ and every $M in cal(D)_J$, the projection map is an equivalence 
#[#set math.equation(numbering: n => "(7.2)")
 $ z ⊗ F_J M tilde.eq F_J \( phi.alt_J z ⊗ M \) . $ <eq:layer-projection>]

]
  + #emph[The object $cal(A)_J$ is a commutative algebra, and $F_J M$ is a unital $cal(A)_J$-module.]
] <lem:layer-adjunction>

#proof[
  First work before chromatic localization. With $N = N_J$, $W = W_J$, factor the functor as
  $ upright("Sp")^G arrow.r^("Res"_N^G) upright("Sp")^N arrow.r^(Phi_N^J) upright("Sp")^W arrow.r "Fun" \( B W \, upright("Sp") \) . $
  Here the middle functor retains genuine quotient symmetry. Let $cal(F)_J = { L lt.eq N : J lt.eq.not L }$, and let $tilde(E) cal(F)_J$ be the cofiber of $\( E cal(F)_J \)_(+) arrow.r S$. Normal geometric localization identifies $upright("Sp")^W$ with the full subcategory of genuine $N$-spectra whose geometric fixed points vanish at subgroups not containing $J$ [2] Section 2(H). Its fully faithful right adjoint is
  $ rho_J \( Y \) = tilde(E) cal(F)_J ⊗ pi^(*) Y \, #h(2em) pi : N arrow.r W \, $
  where $pi^(*)$ is genuine inflation. Consequently the required right adjoint before chromatic localization is the explicit composite
  #[#set math.equation(numbering: n => "(7.3)")
   $ F_J M = "Coind"_N^G #scale(x: 120%, y: 120%)[\(] rho_J "Bor"_W \( M \) #scale(x: 120%, y: 120%)[\)] . $ <eq:layer-construction>]
  For completeness, compute its geometric $K$-fixed points. Coinduction equals induction for finite groups. The fixed-orbit formula therefore gives one term for each coset $g N in \( G \/ N \)^K$. Such a coset satisfies $g^(- 1) K g lt.eq N$. The factor $tilde(E) cal(F)_J$ kills this term unless $J lt.eq g^(- 1) K g$. Thus the surviving cosets correspond bijectively to conjugates $J' = g J g^(- 1)$ normal in $K$. Above such a subgroup, normal geometric inflation has the quotient fixed-point formula; restriction of a cofree spectrum is again cofree. Its coefficient diagram is the restriction $M_g$ specified in the statement, so the resulting term is $Phi^(K \/ J') "Bor"_(K \/ J') \( M_g \)$. For the constant diagram $E$, this is exactly $U_(K \/ J') \( E \)$, proving (7.1). If the index set is empty, the fixed points vanish for every $M$.
  All these constructions retain the residual actions. More explicitly, $N_G \( K \)$ acts on the surviving cosets by left translation, or equivalently on the normal conjugates $J'$ by conjugation. It transports each term by the conjugation and restriction maps in (7.3); the action factors coherently through $W_K$. Formula (7.1) records the underlying spectrum of this diagram. At $K = J$, a surviving conjugate $J' lt.eq J$ has the same order as $J$, so $J' = J$. Only the identity coset of $N$ remains. The counit $phi.alt_J F_J M arrow.r M$ then identifies with the cofree counit on underlying $W_J$-diagrams and is an equivalence. This proves full faithfulness, including when $J$ is not normal in $G$.
  The unlocalized right adjoint already takes $E$-local diagrams to $cal(C)$. Indeed, for such an $M$ and every genuine $G$-spectrum $X$, adjunction gives
  $ "Map" \( e ⊗ X \, F_J M \) & tilde.eq "Map" \( E ⊗ phi.alt_J X \, M \)\
 & tilde.eq "Map" \( phi.alt_J X \, M \) tilde.eq "Map" \( X \, F_J M \) . $
  These equivalences identify precomposition with the localization map $X arrow.r e ⊗ X$; this is exactly the criterion for $F_J M$ to be local. Hence the adjunction and its formulas restrict to the categories under consideration.
  In the restricted adjunction, duality gives, for $X in cal(C)$,
  $ "Map" \( X \, z ⊗ F_J M \) & tilde.eq "Map" \( z^or ⊗ X \, F_J M \)\
 & tilde.eq "Map" \( phi.alt_J \( z^or \) ⊗ phi.alt_J X \, M \)\
 & tilde.eq "Map" \( phi.alt_J X \, phi.alt_J z ⊗ M \) . $
  This proves (7.2). It uses dualizability in $cal(C)$, and places no finiteness condition on $M$. The projection equivalence also identifies the unit on $z ⊗ w$ with $z$ tensored with the unit on $w$: their adjoints agree by the triangle identity $epsilon_(phi.alt_J w) compose phi.alt_J \( eta_w \) = upright("id")_(phi.alt_J w)$. Finally, the right adjoint of a strong symmetric monoidal functor is lax symmetric monoidal; its unit value is therefore a commutative algebra and each of its values is a unital module over that algebra. ◻
]

=== 7.2 A finite splitting argument <a-finite-splitting-argument>

For a dualizable object $z$ and a subgroup $B lt.eq G$, the unit $z arrow.r F_B phi.alt_B z$ becomes an equivalence after applying $phi.alt_B$. To split this map, we will confine its target to that layer and show that its fiber remains zero there while the other layers are removed. The two hypotheses below provide these separate controls through the projection formula.

#thm([Lemma 7.2.])[
  (Splitting an isolated layer).  #emph[Let $z in cal(C)$ be dualizable and let $B lt.eq G$. Suppose that 
#[#set math.equation(numbering: n => "(7.4)")
 $ phi.alt_K \( z ⊗ cal(A)_B \) & = 0 &  & \( K ≁ B \) \,\
phi.alt_B \( z ⊗ cal(A)_J \) & = 0 &  & \( J ≁ B \) . $ <eq:outgoing-orthogonality>]

 Then the adjunction unit splits as 
$ z tilde.eq X xor Q \, #h(2em) Q = F_B phi.alt_B z tilde.eq z ⊗ cal(A)_B \, $

 with $phi.alt_B X = 0$, $phi.alt_K Q = 0$ for $K ≁ B$, and $X ⊗ Q = 0$. If $z$ is compact, both summands are compact.]
] <lem:layer-splitting>

#proof[
  Let $X$ be the fiber of $z arrow.r Q$. By the projection formula,
  $ X = z ⊗ w_0 \, #h(2em) w_0 = "fib" \( upright(bold(1))_(cal(C)) arrow.r cal(A)_B \) . $
  Full faithfulness of $F_B$ gives $phi.alt_B X = 0$.
  List the other subgroup conjugacy classes as $J_1 \, dots.h \, J_t$, in nondecreasing order of subgroup size. Set $X_0 = X$ and inductively form fiber sequences
  #[#set math.equation(numbering: n => "(7.5)")
   $ X_s arrow.r X_(s - 1) arrow.r Y_s := F_(J_s) phi.alt_(J_s) X_(s - 1) #h(2em) \( 1 lt.eq s lt.eq t \) . $ <eq:layer-stripping>]
  We verify that the process preserves three properties: $X_s = z ⊗ w_s$ for some $w_s$, its $B$-component is zero, and its $J_1 \, dots.h \, J_s$-components are zero.
  If $X_(s - 1) = z ⊗ w_(s - 1)$, the projection formula identifies
  $ Y_s tilde.eq z ⊗ F_(J_s) phi.alt_(J_s) w_(s - 1) . $
  It also identifies the map to $Y_s$ with $z$ tensored with the adjunction unit on $w_(s - 1)$. Thus its fiber has the same form. The $J_s$-component of the fiber vanishes by full faithfulness. A previously removed subgroup has smaller order, or the same order in a different conjugacy class. It cannot contain a conjugate of $J_s$, so 25(i) shows that its component of $Y_s$ is zero. Its vanishing therefore persists in the fiber.
  To check the $B$-component, put $M_s = F_(J_s) phi.alt_(J_s) w_(s - 1)$. This is an $cal(A)_(J_s)$-module. For any unital $A$-module $M$, the unit and action exhibit $M$ as a retract of $A ⊗ M$. Consequently $phi.alt_B z ⊗ phi.alt_B M_s$ is a retract of
  $ \( phi.alt_B z ⊗ phi.alt_B cal(A)_(J_s) \) ⊗ phi.alt_B M_s = 0 $
  by (7.4). Hence $phi.alt_B Y_s = 0$, and $phi.alt_B X_s = 0$ follows. This argument applies to the possibly noncompact objects $w_s$ and $Y_s$.
  At the end every subgroup component of $X_t$ is zero; geometric detection gives $X_t = 0$. On the other hand, (7.4) and adjunction give, for each $s$,
  $ "Map" \( Q \, Y_s \) tilde.eq "Map" \( phi.alt_(J_s) Q \, phi.alt_(J_s) X_(s - 1) \) = 0 . $
  Here $"Map"$ denotes the mapping spectrum, so this vanishing holds in every degree. Applying $"Map" \( Q \, - \)$ to (7.5) and descending from $X_t = 0$ gives $"Map" \( Q \, X \) = 0$. In particular the boundary $Q arrow.r Sigma X$ in the original fiber sequence is zero, proving the splitting.
  The stated component vanishings follow from construction and (7.4). They imply $Phi^K \( X ⊗ Q \) = 0$ for every $K$, hence $X ⊗ Q = 0$. When $z$ is compact, its retracts $X$ and $Q$ are compact as well. ◻
]

=== 7.3 Minimal-height separation <minimal-height-separation>

#thm([Lemma 7.3.])[
  (Chromatic orthogonality).  #emph[Let $z in cal(C)_m^G$ be the image of a finite genuine $G$-spectrum, and let $n lt.eq m$. Suppose that $B lt.eq G$ satisfies 
$ m - n < ell \( G \, B \) \, $

 and that every $\( K \, k \) in "supp" \( z \)$ with $k < m$ satisfies 
$ ell \( G \, K \) lt.eq k - n . $

 Then $z$ and $B$ satisfy both orthogonality conditions in 26.]
] <lem:layer-orthogonality>

#proof[
  There is no point $\( B \, k \) in "supp" \( z \)$ with $k < m$: otherwise the second hypothesis would contradict the first. Thus only the test at height $m$ can be nonzero on $Phi^B z$.
  Fix $K ≁ B$. In a summand of $Phi^K cal(A)_B$, let $B' tilde.op B$ be normal in $K$, and put $d = ell \( K \, B' \) = ell \( K \/ B' \, 1 \)$. The equality follows by the subgroup correspondence for $K arrow.r K \/ B'$. Since $K ≁ B$, this quotient is nontrivial and $d > 0$. Consider a height $0 lt.eq k lt.eq m$ with $\( K \, k \) in "supp" \( z \)$. If $k = m$, then $m < k + d$. If $k < m$, concatenate cyclic subnormal chains and use conjugacy invariance to obtain
  $ m - n < ell \( G \, B' \) lt.eq ell \( K \, B' \) + ell \( G \, K \) lt.eq d + k - n . $
  Again $m < k + d$, so 24 gives $T \( k \) and U_(K \/ B') \( E \) = 0$.
  At a height outside $"supp" \( z \)$, the finite representative of $z$ instead gives $T \( k \) and Phi^K z = 0$, by 3. Thus every retained telescope kills $Phi^K \( z ⊗ cal(A)_B \)$. This spectrum is $L_m^f$-local, so it is zero. Forgetting a coherent action detects zero, which proves (7.4).
  For $J ≁ B$, every summand of $Phi^B cal(A)_J$ comes from a proper normal subgroup $J' tilde.op J$ of $B$. Since $ell \( B \/ J' \, 1 \) > 0$, 24 at $k = m$ kills that summand after smashing with $T \( m \)$. All smaller-height tests are killed by the $z$-factor. The same detection argument proves (7.4). ◻
]

#thm([Theorem 7.4.])[
  (Relative specialization bound).  #emph[For a finite $p$-group $G$, a subgroup $H lt.eq G$, and $m \, n gt.eq 0$, 
$ \( H \, m \) in overline({ \( G \, n \) }) quad arrow.r.double quad m gt.eq n + ell \( G \, H \) . $

 The closure is taken in the tensor-triangular spectrum of finite genuine $p$-local $G$-spectra.]
] <thm:specialization>

#proof[
  Fix $G \, n$ and put $y = \( G \, n \)$. Any specialization $\( H \, m \)$ of $y$ has $m gt.eq n$. Indeed, if $m < n$, inflate a finite spectrum of exact type $m + 1$. It belongs to $cal(P)_m \( H \)$ and not to $cal(P)_n \( G \)$, contradicting (2.4).
  Suppose that the theorem fails. Choose the least violating height $m$ and a violating subgroup $B$ at that height. Thus
  $ \( B \, m \) in overline({ y }) \, #h(2em) m - n < ell \( G \, B \) \, $
  and $B eq.not G$. By 3, the spectrum $X_m = "Spc" \( \( cal(C)_m^G \)^c \)$ is a finite subspace containing $y$ and $\( B \, m \)$. Let $Z = overline({ y }) ∩ X_m$, the closure of $y$ in that subspace.
  We construct one compact object with support exactly $Z$, keeping a finite genuine representative. For every $q in X_m \\ Z$, reverse prime inclusion gives $q subset.eq.not y$. Choose a finite genuine spectrum $a_q in q \\ y$. Its support contains $y$, hence all of $Z$, and excludes $q$. The finite tensor product
  $ a = ⨂_(q in X_m \\ Z) a_q \, #h(2em) z = e ⊗ a $
  (with the unit as empty product) satisfies $"supp" \( z \) = Z$. It is compact and dualizable, and its displayed finite representative allows us to apply 27.
  Minimality of $m$ shows that every $\( K \, k \) in Z$ with $k < m$ satisfies $ell \( G \, K \) lt.eq k - n$. Therefore Lemma 7.3, Lemma 7.2 give
  $ z tilde.eq X xor Q \, #h(2em) Q = F_B phi.alt_B z \, #h(2em) X ⊗ Q = 0 \, $
  with both summands compact, $phi.alt_B X = 0$, and $phi.alt_K Q = 0$ for $K ≁ B$. Their compact supports are disjoint closed subsets whose union is $Z$. Both are nonempty: $\( B \, m \) in "supp" \( Q \)$, since $phi.alt_B Q tilde.eq phi.alt_B z$, and $y in "supp" \( X \)$, since $B eq.not G$ and $phi.alt_G Q = 0$. This contradicts irreducibility of the closure of a point. ◻
]

#proof[
  For an integer $r gt.eq 0$, the universal implication defining $r_n \( G \, H \)$ is precisely
  $ cal(P)_(n + r)^G \( H \) subset.eq cal(P)_n^G \( G \) . $
  By (2.4) and 28, this inclusion forces $r gt.eq ell \( G \, H \)$. Equivalently, for every smaller $r$, its failure supplies a finite genuine spectrum in the first prime and outside the second, witnessing failure of the proposed implication. 2 supplies the opposite inequality. Thus $r_n \( G \, H \) = ell \( G \, H \)$ for all the stated groups, subgroups, and heights. The rational height $n = 0$ has been retained throughout, and when $H = G$ both sides are zero. ◻
]

=== 7.4 The general finite-group consequence <the-general-finite-group-consequence>

For a finite group $J$, let $O^p \( J \)$ denote its smallest normal subgroup of $p$-power index. We continue to use tested-height indices and work in the $p$-local genuine category.

#thm([Corollary 7.5.])[
  #emph[Let $G$ be any finite group, $p$ a prime, $H \, K lt.eq G$, and $m \, n gt.eq 0$. Then 
$ cal(P)_m^G \( K \) subset.eq cal(P)_n^G \( H \) $

 if and only if there is a conjugate $K^g = g K g^(- 1) lt.eq H$ such that 
$ N = O^p \( H \) = O^p \( K^g \) \, #h(2em) m gt.eq n + ell \( H \/ N \, K^g \/ N \) . $

 In particular, the numerical test is applied to a qualifying conjugate in the finite $p$-group $H \/ N$.]
] <cor:general-groups>

#proof[
  Balmer–Sanders [2] Proposition 6.11 reduce the displayed inclusion to the existence of such a conjugate and the inclusion $cal(P)_m^(H \/ N) \( K^g \/ N \) subset.eq cal(P)_n^(H \/ N) \( H \/ N \)$. Their prime indices are $m + 1 \, n + 1$. The common $p$-residual condition is equivalent to $p$-subnormality of $K^g$ in $H$, and $H \/ N$ is a $p$-group. The relative specialization bound and the cyclic upper bound give precisely the stated inequality. When $m < n$, an inflated finite spectrum of type $m + 1$ rules out the reduced inclusion, as in the proof of 28. For the upper direction at $m > n + ell \( H \/ N \, K^g \/ N \)$, use also the nesting of the Morava-acyclic ideals of finite spectra. ◻
]

#heading(level: 1)[References]
#bibitem([1])[William Balderrama and Nicholas J. Kuhn, #link("https://arxiv.org/abs/2303.02022")[#emph[An elementary proof of the chromatic Smith fixed point theorem]], Homology Homotopy Appl. #strong[26] (2024), 131--140.]
#bibitem([2])[Paul Balmer and Beren Sanders, #link("https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Spc_SHG.pdf")[#emph[The spectrum of the equivariant stable homotopy category of a finite group]], Invent. Math. #strong[208] (2017), no.~1, 283--326.]
#bibitem([3])[Tobias Barthel, Markus Hausmann, Niko Naumann, Thomas Nikolaus, Justin Noel, and Nathaniel Stapleton, #link("https://doi.org/10.1007/s00222-018-0846-5")[#emph[The Balmer spectrum of the equivariant homotopy category of a finite abelian group]], Invent. Math. #strong[216] (2019), no.~1, 215--240.]
#bibitem([4])[Shay Ben-Moshe, #link("https://arxiv.org/abs/2411.00968v1")[#emph[Higher semiadditivity in transchromatic homotopy theory]], arXiv:2411.00968v1, November 1, 2024.]
#bibitem([5])[Shachar Carmeli, Tomer M. Schlank, and Lior Yanovski, #link("https://doi.org/10.1007/s00222-022-01099-9")[#emph[Ambidexterity in chromatic homotopy theory]], Invent. Math. #strong[228] (2022), no.~3, 1145--1254.]
#bibitem([6])[Edwin E. Floyd, #link("https://doi.org/10.1090/S0002-9947-1952-0046039-4")[#emph[On periodic maps and the Euler characteristics of associated spaces]], Trans. Amer. Math. Soc. #strong[72] (1952), 138--147.]
#bibitem([7])[Paul G. Goerss and Michael J. Hopkins, #link("https://doi.org/10.1017/CBO9780511529955.009")[#emph[Moduli spaces of commutative ring spectra]], in #emph[Structured Ring Spectra], London Math. Soc. Lecture Note Ser. #strong[315], Cambridge University Press, Cambridge, 2004, 151--200.]
#bibitem([8])[Cameron Gordon and Fernando Rodriguez-Villegas, #link("https://doi.org/10.1016/j.jalgebra.2011.09.040")[#emph[On the divisibility of $\# "Hom" \( Gamma \, G \)$ by $\| G \|$]], J. Algebra #strong[350] (2012), 300--307.]
#bibitem([9])[Michael A. Hill, Michael J. Hopkins, and Douglas C. Ravenel, #link("https://doi.org/10.4007/annals.2016.184.1.1")[#emph[On the nonexistence of elements of Kervaire invariant one]], Ann. of Math. (2) #strong[184] (2016), no.~1, 1--262.]
#bibitem([10])[Michael J. Hopkins, Nicholas J. Kuhn, and Douglas C. Ravenel, #link("https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/hkr.pdf")[#emph[Generalized group characters and complex oriented cohomology theories]], J. Amer. Math. Soc. #strong[13] (2000), no.~3, 553--594.]
#bibitem([11])[Michael Hopkins and Jacob Lurie, #link("https://www.math.ias.edu/~lurie/papers/Ambidexterity.pdf")[#emph[Ambidexterity in $K \( n \)$-local stable homotopy theory]], manuscript, December 19, 2013.]
#bibitem([12])[Michael J. Hopkins and Jeffrey H. Smith, #link("https://doi.org/10.2307/120991")[#emph[Nilpotence and stable homotopy theory II]], Ann. of Math. (2) #strong[148] (1998), no.~1, 1--49.]
#bibitem([13])[Nicholas J. Kuhn, #link("https://doi.org/10.1017/CBO9780511662614.012")[#emph[Character rings in algebraic topology]], in #emph[Advances in Homotopy Theory] (Cortona, 1988), London Math. Soc. Lecture Note Ser. #strong[139], Cambridge University Press, Cambridge, 1989, 111--126.]
#bibitem([14])[Nicholas J. Kuhn, #link("https://doi.org/10.1007/s00222-003-0354-z")[#emph[Tate cohomology and periodic localization of polynomial functors]], Invent. Math. #strong[157] (2004), no.~2, 345--370.]
#bibitem([15])[Nicholas J. Kuhn and Christopher J. R. Lloyd, #link("https://preprint.press.jhu.edu/ajm/sites/default/files/AJM-kuhn-lloyd-FINAL.pdf")[#emph[Chromatic fixed point theory and the Balmer spectrum for extraspecial $2$-groups]], Amer. J. Math. #strong[146] (2024), 769--812.]
#bibitem([16])[Neil P. Strickland, #link("https://doi.org/10.1016/S0040-9383(99)00031-2")[#emph[$K \( n \)$-local duality for finite groups and groupoids]], Topology #strong[39] (2000), no.~4, 733--772.]
#bibitem([17])[Hirotaka Tamanoi, #link("https://doi.org/10.2140/agt.2001.1.115")[#emph[Generalized orbifold Euler characteristic of symmetric products and equivariant Morava $K$-theory]], Algebr. Geom. Topol. #strong[1] (2001), 115--141.]
#bibitem([18])[Hirotaka Tamanoi, #link("https://doi.org/10.2140/agt.2003.3.791")[#emph[Generalized orbifold Euler characteristics of symmetric orbifolds and covering spaces]], Algebr. Geom. Topol. #strong[3] (2003), 791--856.]


