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

#align(center)[#text(size: 16pt, weight: "bold")[A nondegenerate counterexample to the Morse-number Arnold bound]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 The Morse-number question <sec:introduction>

Arnold’s fixed-point conjectures compare Hamiltonian fixed points with critical points of functions on the
  underlying symplectic manifold #cite(label("Arnold1986")) Section 2.
  For a sufficiently $C^2$-small autonomous Hamiltonian, the fixed points of its time-one map are precisely its
  critical points. The question is how much of this finite-dimensional lower bound survives for an arbitrary
  Hamiltonian path. We address the formulation using the ordinary Morse number.

Let $\( M \, omega \)$ be a closed connected symplectic manifold and let $H in
  C^oo \( \( bb(R) \/ bb(Z) \) times M \, bb(R) \)$. We use the convention

$ omega \( X_H \( t \, dot.op \) \, dot.op \) = d H_t \, wide phi.alt_H^0 = upright("id")_M $

for the Hamiltonian vector field and its flow. A fixed point $x$ of $phi.alt_H^1$ is #emph[nondegenerate] if $1
  in.not "Spec" \( d_x phi.alt_H^1 \)$. Write $"Fix"_0 \( phi.alt_H^1 \; H \)$ for the fixed points whose loops $t
  mapsto phi.alt_H^t \( x \)$ are contractible in $M$. Contractibility here refers to this Hamiltonian path.

The #emph[ordinary Morse number] is

$ "Morse" \( M \) = min { \# "Crit" \( f \) : f in C^oo \( M \, bb(R) \) upright(" is Morse") } . $

The Morse-number form of the Arnold conjecture asks whether $\# "Fix"_0 \( phi.alt_H^1 \; H \) gt.eq
  "Morse" \( M \)$ whenever the time-one map is nondegenerate #cite(label("Golovko2020")) Conjecture 1.1.
  We construct examples in which even the total number of fixed points is smaller than $"Morse" \( M \)$,
  and every fixed-point trajectory is contractible.

#thm([Theorem 1.1.])[
  #emph[There exist a closed connected symplectic manifold $\( M \, omega \)$ of real dimension twelve and a
    smooth one-periodic Hamiltonian $H$ such that every fixed point of $phi.alt_H^1$ is nondegenerate and
$ \# "Fix"_0 \( phi.alt_H^1 \; H \) = \# "Fix" \( phi.alt_H^1 \) = chi \( M \) + 128 < "Morse" \( M \) . $

]
] <thm:main>

The same construction gives a quantitative separation in fixed dimension.

#thm([Corollary 1.2.])[
  #emph[For every real number $D > 0$, there is an example as in Theorem 1 satisfying
$ "Morse" \( M \) - \# "Fix" \( phi.alt_H^1 \) > D . $

 The manifold is allowed to depend on $D$.]
] <cor:deficit>

=== 1.1 From homological bounds to ordinary Morse theory <from-homological-bounds-to-ordinary-morse-theory>

Conley and Zehnder proved the nondegenerate bound on the standard symplectic torus,
  where the ordinary Morse number equals the total Betti number #cite(label("ConleyZehnder1983")).
  Floer’s pseudoholomorphic-curve approach established homological Morse inequalities for Hamiltonian fixed
  points, including the monotone setting #cite(label("Floer1989")).
  Virtual-moduli constructions of Fukaya–Ono, Liu–Tian and Ruan extended the rational Betti-number bound to
  general closed symplectic manifolds #cite(label("FukayaOno1999")) #cite(label("LiuTian1998"))
  #cite(label("Ruan1999")). The integral bounds of Bai–Xu retain torsion information as well
  #cite(label("BaiXu2022")) Theorem A, #cite(label("BaiXu2026")) Corollary 1.2.
  These homological bounds do not identify the number of generators of a Floer complex with the minimum number of
  critical points of an ordinary Morse function.

Stabilization explains one source of this distinction. The #emph[stable Morse number] minimizes the number of
  critical points of Morse functions $F : M times bb(R)^r arrow.r bb(R)$ that are almost quadratic at infinity,
  allowing the integer $r gt.eq 0$ to vary. Here this means that $parallel d F -
  d Q parallel$ is uniformly bounded in a product metric for some nondegenerate quadratic form $Q$ on
  $bb(R)^r$ #cite(label("DRG2017")) Section 2.1. Arnold already considered a related stable critical-point minimum
  and asked whether it equals the minimum on the original manifold #cite(label("Arnold1986")) Section 5.
  Eliashberg and Gromov developed the relationship with simple chain homotopy over the fundamental-group ring and
  augmentation-ideal generation #cite(label("EliashbergGromov1998")) Sections 0.2.2 and 0.2.5.
  Damian proved that ordinary and stable Morse numbers of closed manifolds can differ #cite(label("Damian2002")).
  A relative realization theorem after sufficiently large stabilization is given in #cite(label("DRG2018"))
  Proposition 2.9.

The algebraic distinction used here is classical and particularly sharp for direct powers of nontrivial perfect
  finite groups. Cossey, Gruenberg and Kovács proved that the augmentation-ideal generator number remains constant
  under these direct powers, while the group generator number is unbounded #cite(label("CGK1974")) Theorems 1–2;
  see also #cite(label("GruenbergLinnell")) Sections 1–2. Fundamental-group refinements of Floer theory reflect
  this distinction: Ono–Pajitnov obtain augmentation-ideal bounds under weak monotonicity
  #cite(label("OnoPajitnov2016")) Theorem 5.7, whereas, in the symplectically aspherical or monotone setting,
  Barraud’s reconstruction of group generators counts Floer trajectories with multiplicities
  #cite(label("Barraud2018")) Theorem 1.3 and Remark 3. The trajectory multiplicities are part of the bound;
  these results do not yield the unrestricted ordinary Morse-number inequality.

For closed symplectic manifolds on which both $\[ omega \]$ and $c_1 \( T M \)$ vanish on $pi_2 \( M \)$,
  Dimitroglou Rizell and Golovko prove the stable Morse number as a lower bound for nondegenerate Hamiltonian
  fixed points #cite(label("DRG2017")) Corollary 1.3. The sphere factors in our examples have positive symplectic
  area, so this hypothesis does not hold. The construction below instead realizes a short relative Morse complex
  in exactly eight additional variables, with the function equal to a prescribed quadratic form outside a compact
  set. Its small-time return map is then inserted into a closed product of spheres.
  The relative handle realization and the exclusion of all additional fixed points are the two geometric steps
  needed to turn the ordinary/stable distinction into the stated closed Hamiltonian example.

The integral homology of our examples is torsion-free and concentrated in even degrees,
  with total rank $chi \( M \)$, as verified in Section 6. Their fixed-point count therefore exceeds the
  homological quantities above.

Ma’s preprint asserts that the minimum number of fixed points of a nondegenerate Hamiltonian diffeomorphism always
  equals the ordinary Morse number #cite(label("Ma2013")) Theorem 1.5.
  Theorem 1 contradicts that unrestricted assertion.

=== 1.2 The construction and its two counts <the-construction-and-its-two-counts>

For a finitely generated group $G$, let $d \( G \)$ be the least number of group generators.
  Set $b = 2$ and consider the finite groups $G = A_5^k$, where $A_5$ has order $60$.
  Two elementary algebraic facts will drive the proof: $d \( A_5^k \)$ is unbounded as $k$ increases,
  whereas the right augmentation ideal

$ I_G = ker \( "aug" : bb(Z) \[ G \] arrow.r bb(Z) \) $

has a generating list of length $b$, independent of $k$. The distinction is between generation of a group and
  generation of a module over its group ring.

Gompf’s existence theorem supplies a closed connected symplectic four-manifold $X$ with $pi_1 \( X \) =
  G$ #cite(label("Gompf1992")) Theorem 3.1; see also #cite(label("Gompf1995")).
  We construct a Morse function on $X times bb(R)^8$ with precisely $chi \( X \) + 4 b$ critical points,
  equal outside a compact set to the quadratic form of index four

$ Q \( u \, v \) = frac(\| v \|^2 - \| u \|^2, 2) \, wide u \, v in bb(R)^4 . $

The eight variables are fixed throughout: the proof performs handle moves on one twelve-dimensional cobordism,
  rather than appealing to a stabilization of unspecified dimension.

The closed symplectic manifold is $M = X times \( S^2 \)^4$.
  Sixteen disjoint product-cap neighborhoods correspond to the north/south choices on the four sphere factors.
  We place the same small-time return map of the constructed Morse function in each cap.
  The main gluing issue is to match the local #emph[endpoint] with product rotations at both poles while excluding
  fixed points outside the caps. The resulting smooth one-periodic Hamiltonian satisfies

#[#set math.equation(numbering: n => "(1)")
 $ \# "Fix" \( phi.alt_H^1 \) = 16 #scale(x: 120%, y: 120%)[\(] chi \( X \) + 4 b #scale(x: 120%, y: 120%)[\)] =
   chi \( M \) + 128 . $ <eq:overview-fixed-count>]

On the other hand, the fundamental group forces every Morse function on $M$ to have at least $d \( G \)$ critical
  points in each of indices one and eleven. Euler’s identity gives

#[#set math.equation(numbering: n => "(2)")
 $ "Morse" \( M \) gt.eq chi \( M \) + 4 d \( G \) . $ <eq:overview-morse-bound>]

Since $d \( A_5^k \)$ is unbounded while $b$ is fixed, these two estimates give the strict inequality and the
  arbitrary deficits. Figure 1 separates the two roles of the fundamental group.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 9.423cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$G=A_5^k$#linebreak()$I_G$ has two generators; $d(G)$ is unbounded]]])])
  content((-3.4, -1.8), [#box(width: 6.223cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Relative handle cancellation#linebreak()$X^4 times bb(R)^8$#linebreak()$chi (X)+8$ critical points]]])])
  content((3.4, -1.8), [#box(width: 6.223cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Ordinary Morse lower bound#linebreak()$M^12=X times (S^2)^4$#linebreak()$"Morse" (M) gt.eq chi (M)+4d(G)$]]])])
  content((-3.4, -3.6), [#box(width: 6.223cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Sixteen cap insertions#linebreak()$\# "Fix" ( phi_H^1)= chi (M)+128$]]])])
  content((3.4, -3.6), [#box(width: 6.223cm, inset: 0.2117cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Unbounded deficit#linebreak()$"Morse" (M)-\# "Fix" ( phi_H^1)$]]])])
  line((-1.095, -0.5797), (-1.984, -1.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((1.095, -0.5797), (1.984, -1.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-3.4, -2.55), (-3.4, -3.046), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.4, -2.55), (3.4, -3.044), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-0.2883, -3.6), (0.2883, -3.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: The augmentation-ideal bound controls the constructed fixed-point count. The group generator bound supplies the larger ordinary Morse lower bound on the same closed manifold. ],
) <fig:construction>

=== 1.3 Proof organization <proof-organization>

Section 2 proves the two group-ring facts and the exact row operation needed for geometric cancellation.
  Section 3 constructs the relative Morse model and its handle complex.
  Section 4 reduces the handle counts while preserving the quadratic collars.
  Section 5 realizes the local map on the closed product. Section 6 compares the two counts and proves the theorem
  and its deficit corollary.

== 2 Group generators and augmentation ideals <sec:algebra>

We need finite groups whose group generators are numerous but whose augmentation ideals have uniformly short
  generating lists. The distinction between these two numbers is classical;
  see #cite(label("GruenbergLinnell")) Sections 1–2. We give the estimates needed here,
  then prove the elementary row reduction used in the handle construction.
  All modules in this section are right modules.

For a finitely generated group $G$, let $d \( G \)$ be its minimum number of group generators.

#thm([Lemma 2.1.])[
  #emph[Let $S$ be a nontrivial finite group, let $k$ be a finite positive integer, and let $m gt.eq
    0$ be an integer. If $k > \| S \|^m$, then $d \( S^k \) > m$.]
] <lem:group-gap>

#proof[
  Suppose that $g_1 \, dots.h \, g_m$ generate $S^k$, padding a shorter list with identities.
    Each factor coordinate $i$ gives a tuple $\( \( g_1 \)_i \, dots.h \, \( g_m \)_i \) in S^m$.
    Since $k > \| S \|^m$, two coordinates $i eq.not j$ have the same tuple.
    Every listed generator then belongs to the proper subgroup
  $ { g in S^k : g_i = g_j } \, $
  a contradiction. ◻
]

We shall use

#[#set math.equation(numbering: n => "(3)")
 $ b = 2 \, wide S = A_5 \, wide G = S^k . $ <eq:group-choice>]

For now $k gt.eq 1$ is arbitrary. The group $S$ is nonabelian simple, hence perfect,
  and the direct product $G$ is also perfect. Every finite group is finitely presented:
  one may take symbols $t_g$ for its elements and relations $t_1 = 1$ and $t_g t_h = t_(g h)$.
  Thus these groups satisfy the finite-presentation condition needed for the symplectic realization below.

Write $Lambda = bb(Z) \[ G \]$ and let

$ "aug" : Lambda arrow.r bb(Z) \, wide sum_(g in G) a_g g mapsto sum_(g in G) a_g $

be the augmentation map. Its kernel $I$ is the augmentation ideal, regarded as a right $Lambda$-module.

The uniform bound below is a special case of the direct-product theorem of Cossey,
  Gruenberg and Kovács #cite(label("CGK1974")) Theorem 2. For finite groups,
  that theorem expresses the augmentation-ideal generator number of a direct product as the maximum of the
  corresponding factor numbers and the generator number of its abelianization.
  We give an elementary proof for the present family, including the passage from modular to integral generators.

#thm([Lemma 2.2.])[
  #emph[For every finite positive integer $k$, the right augmentation ideal of $bb(Z) \[ A_5^k \]$ can be
    generated by two elements.]
] <lem:augmentation>

#proof[
  We first prove that two generators suffice modulo every prime.
    The group $A_5$ is generated by $a = \( 1 thin 2 thin 3 thin 4 thin 5 \)$ and $c = \( 1 thin 2 thin 3 \)$.
    Indeed, $a c a^(- 1) = \( 2 thin 3 thin 4 \)$, and the subgroup generated by $c$ and $a c
    a^(- 1)$ is transitive on ${ 1 \, 2 \, 3 \, 4 }$, and the stabilizer of $4$ contains the order-three group
    generated by $c$. It is therefore all of the copy of $A_4$ fixing $5$.
    The subgroup generated by $a \, c$ is transitive on five letters and has a stabilizer containing this $A_4$,
    so it has order at least $5 dot.op 12 = 60$ and equals $A_5$.
  Put $Lambda = bb(Z) \[ G \]$ and $I = ker \( "aug" : Lambda arrow.r bb(Z) \)$.
    The splitting $Lambda = I xor bb(Z) dot.op 1$ as abelian groups identifies
  $ R_p = bb(F)_p \[ G \] \, wide I_p = I \/ p I = ker \( R_p arrow.r^("aug") bb(F)_p \) . $
  For each simple right $R_p$-module $V$, we claim
  #[#set math.equation(numbering: n => "(4)")
   $ dim_(bb(F)_p) "Hom"_(R_p) \( I_p \, V \) lt.eq 2 dim_(bb(F)_p) V . $ <eq:augmentation-hom-bound>]
  If $G$ acts trivially on $V$, every homomorphism $ell : I_p arrow.r
    V$ defines a group homomorphism $g mapsto ell \( g - 1 \)$ to the additive group of $V$.
    Since $G$ is perfect, this map vanishes, and thus $ell = 0$.
  Otherwise some factor $S_i tilde.equiv A_5$ acts nontrivially on $V$.
    Normality of $S_i$ makes $V^(S_i)$ a submodule, so simplicity gives $V^(S_i) = 0$.
    Write $a_i \, c_i$ for the two displayed generators in this factor.
    We show that $ell$ is determined by $ell \( a_i - 1 \)$ and $ell \( c_i - 1 \)$. The identity
  $ ell \( g h - 1 \) = ell \( g - 1 \) h + ell \( h - 1 \) $
  shows that if both values vanish, then $ell \( s - 1 \) = 0$ for every $s in S_i$.
    If $h$ lies in the product of the other factors, then for every $s in S_i$,
  $ ell \( h - 1 \) \( s - 1 \) = ell \( \( h - 1 \) \( s - 1 \) \) = ell \( \( s - 1 \) \( h - 1 \) \) = 0 . $
  Thus $ell \( h - 1 \) in V^(S_i) = 0$. Every element of $G$ has the form $s h$,
    so the same identity gives $ell = 0$. Evaluation at the two generators therefore embeds
    $"Hom"_(R_p) \( I_p \, V \)$ into $V^2$, proving (4).
  Let $J = "Jac" \( R_p \)$. We use the elementary finite-dimensional algebra facts that $J$ annihilates every
    simple module, $J$ is nilpotent, and $R_p \/ J$ is semisimple.
    For completeness, $J$ is the intersection of the maximal right ideals,
    equivalently the annihilators of the simple right modules.
    Multiplication by $J$ lowers a composition series of the regular module, proving nilpotence.
    Finite dimension allows finitely many maximal right ideals with intersection $J$;
    thus $R_p \/ J$ embeds in a finite direct sum of simple quotients and is semisimple,
    as are its finite-dimensional modules.
  Let $a_V \, t_V$ denote the multiplicities of a simple module $V$ in $I_p \/ I_p J$ and $R_p \/ J$,
    respectively, and let $e_V = dim_(bb(F)_p) "End"_(R_p) \( V \)$. Schur’s lemma and evaluation at $1$ give
  $ dim_(bb(F)_p) "Hom"_(R_p) \( I_p \, V \) = a_V e_V \, wide dim_(bb(F)_p) "Hom"_(R_p) \( R_p \, V \) =
    t_V e_V = dim_(bb(F)_p) V . $
  Consequently $a_V lt.eq 2 t_V$ for every $V$. There is a surjection $\( R_p \/ J \)^2 arrow.r I_p \/ I_p J$.
    Lift the two generator images to $I_p$ and let $N_p$ be their right span.
    Then $I_p \/ N_p = \( I_p \/ N_p \) J$, and nilpotence gives $N_p = I_p$.
    Hence $I_p$ has a generating pair for every prime $p$.
  It remains to lift to two integral generators. We first choose one element whose right ideal has finite additive
    index in $I$, while retaining a residue that extends to a generating pair at each prime dividing $\| G \|$.
    A second element will then remove the finite quotient. Put $n = \| G \| = 60^k$.
    For each $p in { 2 \, 3 \, 5 }$ choose a generating pair $\( u_p \, v_p \)$ of $I_p$.
    By the Chinese remainder theorem on the free abelian group $I$,
    choose $y_0 in I$ with residue $u_p$ at each of these three primes. Define
  $ z = n dot.op 1 - sum_(g in G) g in I . $
  For $x in I$, we have $z x = n x$. Thus left multiplication on $I$ by $y_0 + 30 t z$ has matrix $L_(y_0) +
    30 t n thin upright("id")$. Its determinant is a nonzero polynomial in $t$,
    so there is an integer $t$ for which it is nonzero. Fix this $t$ and put
  $ y_1 = y_0 + 30 t z \, wide D = \| det \( L_(y_1) : I arrow.r I \) \| > 0 . $
  The adjugate identity gives $D I subset y_1 I subset y_1 Lambda$.
    Moreover, $y_1$ still reduces to $u_p$ for $p = 2 \, 3 \, 5$.
  For each prime $p divides D$, the right module $I_p \/ y_1 R_p$ is cyclic.
    For $p divides n$, it is generated by the image of $v_p$. For $p divides.not n$, the element
  $ e_p = 1 - n^(- 1) sum_(g in G) g in R_p $
  satisfies $I_p = e_p R_p$, so its image generates every quotient of $I_p$, including $I_p \/ y_1 R_p$.
    Apply the Chinese remainder theorem on $I$ to choose $y_2 in I$ reducing to $v_p$ when $p divides D$ and $p
    divides n$, and to $e_p$ when $p divides D$ and $p divides.not n$. When $D = 1$, take $y_2 = 0$.
  The quotient $C = I \/ \( y_1 Lambda + y_2 Lambda \)$ is a finite abelian group killed by $D$,
    and the residue choices give $C = p C$ for every prime $p divides D$.
    Iterating these equalities through the prime factorization of $D$ yields $C = D C = 0$.
    Therefore $y_1 \, y_2$ generate $I$ as a right $Lambda$-module. ◻
]

In particular, choosing any finite $k > 60^(16 b)$ gives

#[#set math.equation(numbering: n => "(5)")
 $ d \( G \) > 16 b \, wide I upright(" has a generating list of length ") b . $ <eq:generator-gap>]

We always pad such a list by zeros if necessary. Increasing $k$ makes $d \( G \)$ unbounded by Lemma 3,
  while Lemma 4 keeps the same bound $b$.

=== 2.1 An elementary row reduction <an-elementary-row-reduction>

The next lemma supplies an entry equal to $1$ using only elementary basis additions.
  This is the form needed for handle slides. It is a special case of Bass’s stable-range results applied to the
  opposite ring #cite(label("Bass")) Lemma 6.4 and Theorems 4.2(a), 11.1;
  we include a direct proof to retain control of the multiplication sides and the row length.

#thm([Lemma 2.3.])[
  #emph[Let $G$ be a finite group and $Lambda = bb(Z) \[ G \]$. If $m gt.eq 3$ and
$ x_1 Lambda + dots.h.c + x_m Lambda = Lambda \, $

 then finitely many elementary additions
$ x_j arrow.l x_j + x_i q \, wide i eq.not j \, quad q in Lambda \, $

 can make an entry of the row equal to $1$.]
] <lem:row>

#proof[
  We first record how to correct a designated entry over a finite-dimensional semisimple algebra $R$.
    Suppose $x R + U = R$, where $U$ is a right ideal. Let $T = L_x : R arrow.r R$ be left multiplication by $x$,
    let $pi : R arrow.r R \/ U$ be the quotient map, and put $K = ker \( pi T \)$.
    The map $pi T$ is onto, and the split exact sequences give
  $ R tilde.equiv K xor R \/ U \, wide R tilde.equiv U xor R \/ U . $
  Comparison of simple-module multiplicities therefore gives $K tilde.equiv U$.
    Choose an isomorphism $h : K arrow.r U$. Extend $h - T \|_K : K arrow.r U$ to a right-module map $c :
    R arrow.r U$ using a complement of $K$. The map $T + c$ is an isomorphism:
    it restricts to $h$ on $K$ and induces the isomorphism $R \/ K arrow.r R \/ U$ supplied by $pi T$.
    Every right-module endomorphism of $R$ is left multiplication by its value at $1$.
    Hence $T + c = L_(x + u)$ for $u = c \( 1 \) in U$, and $x + u$ is a unit.
    If $U = sum_(i eq.not j) x_i R$, this corrects only the designated entry $x_j$ by additions of right multiples
    of the other entries.
  Apply this observation first to $R = bb(Q) \[ G \]$, which is semisimple by Maschke’s theorem,
    with designated entry $x_1$. In group-basis coordinates for the correcting coefficients $q_i$, the determinant
  $ det_(bb(Q)) L_(x_1 + sum_(i eq.not 1) x_i q_i) $
  is a polynomial with integer coefficients. The unit correction over $bb(Q) \[ G \]$ shows that it is nonzero.
    A nonzero polynomial over $bb(Q)$ does not vanish at every integer tuple,
    by induction on its number of variables. We may therefore choose all $q_i in
    Lambda$ with this determinant nonzero. After these elementary additions, rename the first entry $x_1$.
    Its principal right ideal has finite additive index
  $ D = \[ Lambda : x_1 Lambda \] = \| det L_(x_1) \| \, wide D Lambda subset x_1 Lambda . $
  We keep this entry fixed and correct only $x_2$. For each prime $p divides D$, let $R_p =
    Lambda \/ p Lambda$ and $J_p = "Jac" \( R_p \)$. The current row generates the unit right ideal in the
    semisimple algebra $R_p \/ J_p$. The preceding observation gives coefficients $macron(q)_(i \, p) in R_p$,
    $i eq.not 2$, such that
  $ macron(x)_2 + sum_(i eq.not 2) macron(x)_i macron(q)_(i \, p) $
  is a unit modulo $J_p$, and hence a unit in $R_p$. Here units lift across the nilpotent ideal $J_p$, since $1 -
    j$ has a finite geometric series inverse for $j in J_p$. Choose $q_i in Lambda$, $i eq.not 2$,
    with these residues for all $p divides D$ by coefficientwise Chinese remaindering, and make the additions
  $ x_2 arrow.l x_2 + sum_(i eq.not 2) x_i q_i . $
  All source entries remain fixed during these additions, so the new $x_2$ is a unit modulo every prime dividing
    the unchanged integer $D$.
  The additive quotient $A = Lambda \/ \( x_1 Lambda + x_2 Lambda \)$ is finite and killed by $D$.
    For each $p divides D$, the invertibility of $x_2$ modulo $p$ gives $x_2 Lambda + p Lambda = Lambda$,
    and hence $A = p A$. Iteration gives $A = D A = 0$. This also covers $D = 1$, when $A$ is already zero.
    We have proved $x_1 Lambda + x_2 Lambda = Lambda$.
  Finally put $t = x_3$ and choose $a \, c in Lambda$ with $x_1 a + x_2 c = 1$.
    The two elementary additions to the third entry with coefficients $a \( 1 - t \)$ and $c \( 1 - t \)$ give
  $ t + x_1 a \( 1 - t \) + x_2 c \( 1 - t \) = 1 . $
  Neither source entry changes, and all products retain the required order. ◻
]

== 3 A relative Morse model in twelve dimensions <sec:relative-model>

We now turn a short generating list for an augmentation ideal into a Morse function with few critical points.
  Let $G$ be a finite group, put $Lambda = bb(Z) \[ G \]$, and let $I subset
  Lambda$ be its right augmentation ideal. Assume that $I$ has a generating list of length $b gt.eq 2$.
  We will use this list and the elementary-row lemma established above.
  Let $X$ be a closed connected oriented smooth four-manifold with $pi_1 \( X \) tilde.equiv G$.
  Since $G$ is finite, rational homology and Poincaré duality give

$ H_1 \( X \; bb(Q) \) = H_3 \( X \; bb(Q) \) = 0 \, wide chi \( X \) = 2 + dim_(bb(Q)) H_2 \( X \; bb(Q) \) gt.eq 2 . $

No symplectic structure is needed for this part of the argument.
  The relation between quadratic stabilization, group-ring complexes and augmentation generators is developed by
  Eliashberg and Gromov #cite(label("EliashbergGromov1998")) Sections 0.2.2 and 0.2.5.
  We carry out the required realization on a specified relative cobordism,
  so that the number of variables and the exterior function remain fixed.

For $u \, v in bb(R)^4$, put

#[#set math.equation(numbering: n => "(6)")
 $ Q \( u \, v \) = frac(\| v \|^2 - \| u \|^2, 2) \, wide r^2 = \| u \|^2 + \| v \|^2 . $ <eq:quadratic>]

We also write $Q$ for its pullback to $X times bb(R)^8$.

#thm([Proposition 3.1.])[
  #emph[Let $G$ be a finite group whose right augmentation ideal in $bb(Z) \[ G \]$ has a generating list of
    length $b gt.eq 2$. Let $X$ be a closed connected oriented smooth four-manifold with $pi_1 \( X \) tilde.equiv
    G$. There is a smooth Morse function $F : X times bb(R)^8 arrow.r bb(R)$ such that
$ F = Q quad upright("for ") r gt.eq 3 \, wide \# "Crit" \( F \) = chi \( X \) + 4 b . $

 Its critical points have indices between four and eight.]
] <prop:relative-morse>

The number of added variables is part of the assertion. We will prove the proposition by changing handles on one
  fixed compact twelve-dimensional cobordism. This section constructs the cobordism and its handle complex;
  Section 4 performs the reduction and completes the proof.

=== 3.1 The domain and its collars <the-domain-and-its-collars>

Define

#[#set math.equation(numbering: n => "(7)")
 $ E = { \( u \, v \) : r^2 lt.eq 9 \, med - 1 lt.eq Q lt.eq 1 } \, wide E_plus.minus = E ∩ { Q = plus.minus 1 } \,\
W = X times E \, wide A = X times E_(-) \, wide B = X times E_(+) . $ <eq:relative-domain>]

The incoming and outgoing faces are $A$ and $B$; the side is the face $r = 3$.
  At its corners, both $u$ and $v$ are nonzero and $d r \, d Q$ are linearly independent.
  In a neighborhood of the side, the coordinates

$ \( r \, Q \, u \/ \| u \| \, v \/ \| v \| \) $

give a product collar with interval coordinate $Q$. Since $d Q eq.not 0$ on $A union B$,
  these faces also have collars with coordinate $Q$. To make the collars compatible,
  choose a vector field with $d Q$-value one which is the product coordinate field near the side,
  and extend it over the ends by a partition of unity. All handle constructions below take place away from a fixed
  smaller side collar.

Radial contraction preserves $E$, so $E$ is contractible. On $E_(-)$, the parametrization

$ \( xi \, v \) mapsto #scale(x: 120%, y: 120%)[\(] sqrt(2 + \| v \|^2) thin xi \,
  v #scale(x: 120%, y: 120%)[\)] \, wide xi in S^3 \, quad \| v \|^2 lt.eq 7 / 2 \, $

identifies $E_(-)$ with $S^3 times D^4$. Interchanging $u$ and $v$ gives the same description of $E_(+)$.
  Consequently both inclusions $A arrow.r.hook W$ and $B arrow.r.hook W$ induce isomorphisms on fundamental groups.

Write $tilde(X)$ for the universal cover of $X$ and use tildes for the corresponding covers of $W \, A \, B$.
  The relative homology of $\( E \, E_(-) \)$ is $bb(Z)$ in degree four and zero in every other degree.
  The relative Künneth formula therefore gives, equivariantly for the deck action,

#[#set math.equation(numbering: n => "(8)")
 $ H_(4 + i) \( tilde(W) \, tilde(A) \; bb(Z) \) tilde.equiv H_i \( tilde(X) \; bb(Z) \) . $ <eq:relative-homology>]

There is no torsion term because the relative homology of $\( E \, E_(-) \)$ is free.
  The same formula holds with $tilde(B)$ in place of $tilde(A)$. In particular,

#[#set math.equation(numbering: n => "(9)")
 $ H_4 \( tilde(W) \, tilde(A) \; bb(Z) \) tilde.equiv bb(Z) \, wide H_5 \( tilde(W) \, tilde(A) \; bb(Z) \) =
   0 \, $ <eq:low-relative-homology>]

where the action on $bb(Z)$ is trivial. Here we used connectedness and simple connectedness of $tilde(X)$.

=== 3.2 An initial height function <an-initial-height-function>

Choose a Morse function $f : X arrow.r bb(R)$ with one minimum and one maximum.
  For completeness, this follows from the usual handle description of a connected manifold.
  After ordering the handles, the zero- and one-handles form a connected graph.
  Cancelling the edges of a spanning tree against all but one zero-handle leaves one minimum.
  Attachments above each cancelling pair are transferred through the resulting boundary identification.
  Applying the same procedure to the dual handle decomposition removes the extra maxima without changing the
  minimum. This uses the handle decomposition theorem and the geometric cancellation criterion,
  in their elementary zero/one-handle cases #cite(label("Ranicki2002")) Theorem 2.22 and Lemma 8.24.

Let $eta : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ be smooth, equal to one near zero and supported in $\[ 0 \, 1 \)$.
  For $sigma > 0$ sufficiently small, set

#[#set math.equation(numbering: n => "(10)")
 $ h_0 \( x \, u \, v \) = Q \( u \, v \) + sigma eta \( r^2 \) f \( x \) . $ <eq:initial-height>]

Choose $sigma$ so that

$ sigma parallel f parallel_oo < 1 / 2 \, wide 2 sigma parallel f parallel_oo parallel eta' parallel_oo < 1 . $

The perturbation is supported where $r < 1$ and hence $\| Q \| < 1 \/ 2$.
  Thus $h_0 \( W \) subset \[ - 1 \, 1 \]$, and $h_0 = Q$ near every face of $W$.
  For $r > 0$, its derivative in the extra variables has norm at least

$ r #scale(x: 120%, y: 120%)[\(] 1 - 2 sigma parallel f parallel_oo parallel eta' parallel_oo
  #scale(x: 120%, y: 120%)[\)] > 0 . $

At $r = 0$, the critical-point equation is $d f = 0$, and the Hessian is the direct sum of $sigma "Hess"
  f$ and $"Hess" Q$. Therefore $h_0$ is Morse, with exactly the critical points of $f$,
  each shifted upward by four in index. In particular it has one critical point of index four and one of index eight.

=== 3.3 Levels and the relative handle complex <levels-and-the-relative-handle-complex>

Use gradient-like fields which are product fields on the side collar.
  The Morse–handle correspondence then describes $\( W \; A \, B \)$ by handles attached in the interiors of its
  regular levels. The standard local handle traces and their product regions give this correspondence relative to
  the side collar; see #cite(label("Ranicki2002")) Proposition 2.20 and Theorem 2.22 for the handle construction.
  Only handles of indices $4 \, dots.h \, 8$ will occur.

We may order these handles by index. Indeed, if an index-$j$ handle is followed by an index-$ell$ handle with $ell
  lt.eq j$, the latter attaching sphere has dimension $ell - 1$, and the former belt sphere has dimension $11 -
  j$ in the intervening eleven-dimensional level. Their dimension sum is

$ \( ell - 1 \) + \( 11 - j \) = 10 + ell - j < 11 . $

General position makes the attaching sphere disjoint from that belt sphere.
  After shrinking its framed neighborhood, it can be moved back through the surgery,
  interchanging the two handles. All later attachments are transferred through the induced identification of the
  upper level. The same argument permits arbitrary ordering within an equal-index block,
  with all moves supported in the interior.

Every regular level $L$ is connected, and its inclusion into $W$ induces

#[#set math.equation(numbering: n => "(11)")
 $ pi_1 \( L \) tilde.equiv pi_1 \( W \) tilde.equiv G . $ <eq:level-fundamental-group>]

To see this directly, surgery for an index-$j$ handle removes a neighborhood of $S^(j - 1)$ and inserts one of
  $S^(11 - j)$. For $4 lt.eq j lt.eq 8$, both spheres have dimension at least three and codimension at least four
  in the level. General position and van Kampen show that these surgeries preserve connectedness and the
  fundamental group. Start with $A$, whose inclusion into $W$ is a fundamental-group isomorphism.
  Alternatively, from any intermediate level both the upper part and the reversed lower part are built with
  handles of index at least four, so neither part changes the fundamental group.
  The interior of $L$ has the same fundamental group as $L$.

Choose an orientation and a lift of each handle. Regard the deck action as a right action:
  if it was originally written on the left as $D_g$, use $c dot.op g = D_(g^(- 1)) c$.
  Let $C_i$ be the based free right $Lambda$-module generated by the handles of index $4 + i$,
  and let $r_i$ be their number. The resulting relative handle complex is

#[#set math.equation(numbering: n => "(12)")
 $ 0 arrow.r C_4 arrow.r^(partial_4) C_3 arrow.r^(partial_3) C_2 arrow.r^(partial_2) C_1 arrow.r^(partial_1) C_0
   arrow.r 0 \, wide C_i tilde.equiv Lambda^(r_i) . $ <eq:handle-complex>]

Its degree-$i$ homology is $H_(4 + i) \( tilde(W) \, tilde(A) \; bb(Z) \)$.
  One way to obtain the complex is to filter the handle decomposition by index;
  each successive relative group is freely generated by the lifted handles in that index.
  Boundary coefficients are signed intersections of lifted attaching spheres with lifted belt spheres one index
  lower. Thus, writing

$ partial e_j = sum_i e_i a_(i j) \, $

the entries $a_(i j)$ lie in $Lambda$ and multiply the basis elements on the right.
  Replacing a basis vector $e_j$ by $e_j + e_i q$, with $i eq.not j$,
  adds column$""_i thin q$ to column$""_j$ in its outgoing differential.
  If $T$ is the elementary matrix of this basis change, the adjacent differentials change coherently as $D mapsto
  D T$ and $D' mapsto T^(- 1) D'$. These conventions will be used for the handle slides in Section 4.

#thm([Lemma 3.2.])[
  #emph[For any relative handle presentation of this same $\( W \; A \, B \)$ with indices in $4 \, dots.h \,
    8$ and $r_0 = r_4 = 1$, its based right-module complex satisfies
#[#set math.equation(numbering: n => "(13)")
 $ "im" partial_1 = I \, wide "im" partial_2 = ker partial_1 \, wide r_2 = chi \( X \) - 2 + r_1 + r_3 gt.eq
   r_1 \, $ <eq:handle-identities>]

 where $C_0$ is identified with $Lambda$ using its chosen basis.
   The same assertions hold for the reversed cobordism relative to $B$.]
] <lem:handle-complex>

#proof[
  By (9), the quotient $C_0 \/ "im" partial_1$ is the trivial right module $bb(Z)$.
    A surjective right-module map $Lambda arrow.r bb(Z)$ sends $1$ to $1$ or $- 1$, so its kernel is $I$.
    The vanishing of relative homology in degree five gives the second equality.
  Since $E$ is contractible and $E_(-)$ has the homotopy type of $S^3$, we have $chi \( W \, A \) = chi \( X \)$.
    All handle indices have been shifted by the even number four, and hence
  $ chi \( X \) = r_0 - r_1 + r_2 - r_3 + r_4 = 2 - r_1 + r_2 - r_3 . $
  This gives the rank identity; its inequality follows from $chi \( X \) gt.eq 2$ and $r_3 gt.eq 0$.
    Finally, the same relative covering homology computation holds with $B$ in place of $A$.
    Reversal sends index $4 + i$ to index $8 - i$ and preserves the endpoint counts,
    so the argument applies unchanged. ◻
]

We have now constructed a height on the required fixed cobordism and identified the algebra that its handles must
  satisfy. To finish Proposition 6, it remains to reduce the index-five and index-seven counts to $b$ while
  retaining the single index-four and index-eight handles and the prescribed collars.
  Then Lemma 7 will force $r_2 = chi \( X \) - 2 + 2 b$ and the total count $chi \( X \) + 4 b$.

== 4 Geometric reduction of the handles <sec:cancellation>

We continue with the fixed cobordism $\( W \; A \, B \)$ and the conventions of Section 3.
  The aim is to retain just $b$ handles in each of indices five and seven. There are two distinct steps:
  elementary operations produce a coefficient exactly equal to $1$,
  and Whitney moves turn that coefficient into one geometric intersection. All moves below occur in the interior of $W$.

=== 4.1 Introducing the augmentation generators <introducing-the-augmentation-generators>

A slide of one index-$j$ handle over another replaces a basis vector $e_j$ by $e_j +
  e_i q$ in the associated free right $Lambda$-module. To realize this, first take $q = plus.minus g$,
  with $g in G$: choose a band whose path represents $g$, and choose its orientation to give the sign.
  The slide arcs can be chosen embedded and disjoint from the other attaching cores in an eleven-dimensional
  level; their tubular neighborhoods can then be shrunk as needed.
  Repeated slides realize an arbitrary finite integral combination of group elements.
  The framing is carried through the band construction. This is the usual labelled handle slide;
  see #cite(label("Morgan2020")) proof of Theorem 4.2, pp. 9–10.
  The two adjacent differentials change together as described in Section 3.

Write $e_1 \, dots.h \, e_s$ for the existing index-five handles and $a_i = partial_1 e_i in I$.
  By Lemma 7, the $a_i$ generate $I$ as a right ideal. Fix a generating list $y_1 \, dots.h \, y_b$ for $I$,
  padded with zeros if necessary.

Introduce $b$ cancelling pairs of indices five and six, with new lower handles $n_1 \, dots.h \,
  n_b$ satisfying $partial_1 n_j = 0$. Here is a relative placement of the births.
  In the level just after the index-four handle, choose disjoint small balls missing its belt sphere and all old
  index-five attaching cores. These cores and the belt sphere have dimensions four and seven, respectively,
  so their finite union has empty interior. After choosing the balls,
  shrink the old attaching neighborhoods to miss them. The balls then survive the old index-five attachments.
  Their product traces support ordinary local five/six births.
  When ordering the resulting handles by index, pull the new lower attaching spheres back along these product
  traces. They still miss the index-four belt sphere, so their boundary columns are zero as asserted.

Choose coefficients in $Lambda$ such that

$ y_j = sum_(i = 1)^s a_i q_(i j) \, wide a_i = sum_(j = 1)^b y_j t_(j i) . $

First slide each new handle to replace $n_j$ by $n_j + sum_i e_i q_(i j)$. Its new column is $y_j$.
  Next replace each old handle by $e_i - sum_j n_j t_(j i)$, using the new bases. Every old column is now zero.
  The new $b$ columns still generate $I$.

=== 4.2 Producing a cancellable pair <producing-a-cancellable-pair>

#emph[A coefficient equal to one.] Select an old index-five handle $e$,
  and place it last among the index-five handles. Since $partial_1 e = 0$,
  exactness in Lemma 7 gives $e in "im" partial_2$. If $h_1 \, dots.h \,
  h_m$ are the index-six handles and $x_j$ is the $e$-coefficient in $partial_2 h_j$, it follows that

$ x_1 Lambda + dots.h.c + x_m Lambda = Lambda . $

While an old handle remains, $r_1 gt.eq b + 1$; hence $m = r_2 gt.eq r_1 gt.eq b + 1 gt.eq 3$ by (13).
  Lemma 5 therefore applies. Slides among the index-six handles produce one whose coefficient into $e$ is exactly
  $1$. Place this handle first among the index-six handles, immediately after $e$.

#emph[Removing the extra intersections.] Let $L$ be the intervening regular level,
  $T tilde.equiv S^5$ the upper handle’s attaching core sphere,
  and $D tilde.equiv S^6$ the lower handle’s belt sphere. Their signed, group-labelled intersection is $1$.
  For each group label, pair intersection points with opposite signs,
  leaving exactly one positive point with identity label. This pairing is possible because all nonidentity
  coefficients vanish and the identity coefficient is one. In particular,
  the argument uses the specific coefficient $1$, rather than an arbitrary unit of $Lambda$.

For each pair, choose arcs joining its points on $T$ and on $D$. The two spheres are simply connected.
  Equality of the group labels means that the resulting Whitney loop is null-homotopic in $W$.
  By (11), it is null-homotopic in $L$. It therefore bounds a disk in the interior of $L$.
  General position makes this disk embedded, with interior disjoint from $T$, $D$, the other disks,
  and the other attaching or belt cores that must be retained. The relevant inequalities are

$ 2 + 5 < 11 \, wide 2 + 6 < 11 \, wide 2 + 2 < 11 \, wide 2 + 7 < 11 . $

The last inequality covers the largest other core that occurs in our index range.
  Boundary arcs can likewise be chosen to miss the other cores and intersection points.
  All of these are finite, compact constructions in $"int" L$.

The high-dimensional Whitney theorem now removes each paired intersection by an isotopy of $T$.
  Its hypotheses are complementary sphere dimensions at least three, opposite intersection signs,
  and the null-homotopic Whitney loop just established; simple connectedness of $L$ is not required.
  The framing step is part of this theorem: the normal splitting along the boundary of the Whitney disk extends
  across it. In the present dimensions the frame-extension space is $V_4 \( bb(R)^9 \) = O \( 9 \) \/ O \( 5 \)$,
  which is simply connected. See #cite(label("Milnor1965")) Theorem 6.6 and Lemma 6.13,
  or the group-ring formulation in #cite(label("Ranicki2002")) Theorem 7.27(i) and Corollary 7.30.
  Transport the existing normal framing of $T$ through its isotopy.
  We do not require that this entire handle framing extend over the Whitney disk.

For support, first arrange the Whitney disks and their compact move neighborhoods to miss the other cores;
  then shrink the other tubular attaching neighborhoods to miss those supports.
  A dimension argument alone would not give disjointness from preassigned full-dimensional neighborhoods.
  The selected belt sphere remains the reference sphere against which intersections are counted;
  the isotopy of the attaching sphere removes intersections with it.
  After the finite sequence of Whitney moves, $T$ meets $D$ transversely in exactly one point.

#emph[Cancellation relative to the boundary.] The geometric handle cancellation criterion now applies
  #cite(label("Ranicki2002")) Lemma 8.24. We spell out its relative support here because the quadratic collars
  must survive. Isolate the two adjacent critical points in a slab containing no others,
  and use a descending gradient-like field that is a product on the side collar.
  The single transverse intersection gives precisely one connecting trajectory from the index-six point to the
  index-five point. Choose a regular level $c$ between the slab’s bottom and the lower critical value.
  Every other nonconstant trajectory in the upper point’s unstable manifold crosses $c$.
  Indeed, a trajectory that remained above $c$ could not escape through the product side;
  compactness and strict decrease of the height would force convergence to the only lower critical point,
  contrary to uniqueness of the connecting trajectory.

A product side collar has an invariant inner boundary, which the unstable manifold cannot cross.
  Retain a strictly smaller side collar outside that boundary.
  The closure of the unstable manifold above $c$ then lies in the compact part of the slab between $c$ and the
  upper critical value, away from the retained collar and the slab’s ends.
  This closure can include limiting trajectories through the lower critical point; it need not be a smooth disk.
  The local Morse cancellation theorem gives a deformation supported in any sufficiently small neighborhood of
  this closure, fixed elsewhere #cite(label("Laudenbach2013")) Theorem and Corollary 1.
  One can apply its closed-manifold formulation by first extending the height and field to a closed enlargement;
  they agree on the slab, and the deformation restricts to the same $W$.
  Thus the cancellation changes neither the earlier handles nor the side and end collars.
  The upper attaching maps are transferred through the induced identification of levels.

For clarity, the chosen index-six column may also have coefficients into other lower handles.
  In bases beginning with the selected pair, its differential has the block form

$ partial_2 = mat(delim: "(", 1, a; v, B) \, wide partial_1 = \( 0 med med d \) \, wide d v = 0 . $

Cancellation leaves $B - v a$ as the next differential and leaves $d$ unchanged.
  This records algebraically why one coefficient equal to one suffices and why the other old zero columns of
  $partial_1$ survive. Geometrically this is the preservation of the lower handles and transfer of the upper
  attachments just described.

#emph[Iteration.] We can therefore repeat the construction until every old index-five handle has been removed.
  Each step cancels one handle of index five and one of index six.
  The identities of Lemma 7 continue to hold for the same cobordism, and the $b$ new lower handles remain. At the end,

$ r_1 = b . $

=== 4.3 The reverse reduction and the quadratic collars <the-reverse-reduction-and-the-quadratic-collars>

Turn the cobordism around. Near its faces the new height is $- Q$, and an original handle of index $4 +
  i$ has reversed index $8 - i$. The relative covering homology for $\( W \, B \)$ is the same as for
  $\( W \, A \)$, so the preceding construction applies without changing the dimension or adding any variables.
  It reduces the reversed index-five count to $b$, that is, the original index-seven count to $b$.
  Reversed five/six births and cancellations are original seven/six births and cancellations.
  They preserve the number $r_1 = b$ of original index-five handles;
  the upper attaching data in the reversed presentation are transferred as needed.
  Both endpoint counts remain one. Lemma 7 now gives

#[#set math.equation(numbering: n => "(14)")
 $ \( r_0 \, r_1 \, r_2 \, r_3 \, r_4 \) = #scale(x: 120%, y: 120%)[\(] 1 \, b \, chi \( X \) - 2 + 2 b \, b \,
   1 #scale(x: 120%, y: 120%)[\)] . $ <eq:final-handle-counts>]

The handle traces and their intervening product regions supply an actual smooth Morse height on the same $W$.
  Since only finitely many compactly supported moves were used, a common smaller side collar still has height $Q$.
  We may also prescribe height $- 1$ and $1$ on the two end faces and make its inward derivative strictly positive
  at the incoming end and strictly negative at the outgoing end.
  It remains to ensure equality with $Q$ on whole end collars, compatible with the side collar.

At $A$, use the inward coordinate $s = Q + 1$. On a sufficiently small collar the height has the form

$ - 1 + s thin a \( y \, s \) \, wide a \( y \, s \) > 0 \, $

and $a = 1$ near the side. Replace it by

$ - 1 + s #scale(x: 120%, y: 120%)[\[] 1 + theta \( s \) \( a \( y \, s \) - 1 \) #scale(x: 120%, y: 120%)[\]] \, $

where $0 lt.eq theta lt.eq 1$, with $theta = 0$ close to $s = 0$ and $theta = 1$ farther inside.
  Put $c_0 = min \( 1 \, inf a \) > 0$. Its normal derivative is

$ 1 + theta \( a - 1 \) + s theta thin partial_s a + s theta' \( a - 1 \) . $

The first two terms together are at least $c_0$. Choose the collar so small that $\| s partial_s a \| < c_0 \/ 4$,
  and choose the transition so slowly in $log s$ that $\| s theta' \| thin parallel a - 1 parallel_oo < c_0 \/ 4$.
  For example, a fixed smooth transition applied to $log \( s \/ s_0 \) \/ L$,
  with $L$ large and then $s_0$ sufficiently small, has these properties and is constant near both endpoints.
  The normal derivative is then at least $c_0 \/ 2$. This introduces no critical points and leaves the side collar
  fixed. Apply the identical argument at $B$ to one minus the height with inward coordinate $1 - Q$.

The final height equals $Q$ near every face and corner of $W$.
  Extend it by $Q$ to $X times bb(R)^8$ and call the result $F$. This extension is smooth across all seams.
  Its exterior has no critical points because $d Q = 0$ only on the zero section,
  which lies in the interior of $W$. It equals $Q$ for $r gt.eq 3$ and, by (14), has exactly

$ 1 + b + #scale(x: 120%, y: 120%)[\(] chi \( X \) - 2 + 2 b #scale(x: 120%, y: 120%)[\)] + b + 1 = chi \( X \) + 4 b $

critical points. This completes the proof of Proposition 6.

== 5 Closing the Hamiltonian model <sec:hamiltonian>

We now turn a Morse function with eight quadratic variables into a Hamiltonian map on a closed manifold.
  Each of the sixteen products of north and south sphere caps will contain one copy of its critical set.
  The rotations outside the caps must be chosen with care: their endpoint maps agree with the quadratic model at
  both poles, although their paths can differ by full turns.
  We track this difference to identify the homotopy classes of the resulting fixed-point loops as well.

#thm([Proposition 5.1.])[
  #emph[Let $\( X \, omega_X \)$ be a closed connected symplectic four-manifold.
    Write $\( u \, v \) in bb(R)^4 times bb(R)^4$ and set
$ Q \( u \, v \) = frac(\| v \|^2 - \| u \|^2, 2) \, wide r^2 = \| u \|^2 + \| v \|^2 . $

 Suppose that $F : X times bb(R)^8 arrow.r bb(R)$ is a smooth Morse function such that $F = Q$ whenever $r gt.eq
   3$, and let $N = \# "Crit" \( F \)$. Let $sigma$ be the standard area form of total area $4
   pi$ on the unit sphere. For every $lambda > 25 \/ 2$, the closed symplectic manifold
$ \( M \, omega_M \) = (X times \( S^2 \)^4 \, omega_X + lambda sum_(j = 1)^4 sigma_j) $

 admits a Hamiltonian $H in C^oo \( \( bb(R) \/ bb(Z) \) times M \, bb(R) \)$ such that every fixed point of
   $phi.alt_H^1$ is nondegenerate, every loop $t mapsto phi.alt_H^t \( p \)$ based at a fixed point $p$ is
   contractible in $M$, and
$ \# "Fix"_0 \( phi.alt_H^1 \; H \) = \# "Fix" \( phi.alt_H^1 \) = 16 N . $

 Here $sigma_j$ denotes the pullback of $sigma$ from the $j$th sphere,
   and Hamiltonian vector fields satisfy $omega_M \( X_H \, dot.op \) = d H$.]
] <prop:cap-transfer>

We first record the local short-period estimate used below.
  Yorke proved the sharp lower bound $2 pi \/ L$ for a nonconstant periodic solution of a Euclidean vector field
  with Lipschitz constant $L$ #cite(label("Yorke1969")). The weaker coordinate estimate here suffices on a compact
  invariant set.

#thm([Lemma 5.2.])[
  #emph[Let $V$ be a smooth vector field on a smooth manifold, with flow $Phi^t$,
    and let $K$ be a compact set on which this flow is defined for all times and which it preserves.
    There is a number $tau_0 > 0$ such that, for $p in K$ and $0 < tau < tau_0$,
$ Phi^tau \( p \) = p quad arrow.l.r.double quad V \( p \) = 0 . $

]
] <lem:short-period>

#proof[
  Choose finitely many charts with image the Euclidean ball of radius $3$,
    whose inverse images of the unit ball cover $K$. Let $C gt.eq
    1$ bound both the coordinate vector fields and their first derivatives on the closed balls of radius $2$,
    and put $tau_0 = 1 \/ \( 2 C \)$. If $0 < tau < tau_0$, a trajectory $t mapsto Phi^(tau t) \( p \)$, $0 lt.eq
    t lt.eq 1$, with $p in K$ stays in the radius-$2$ ball of a chart whose unit ball contains $p$:
    a first exit would require coordinate displacement greater than $1$,
    whereas the speed bound gives displacement at most $tau C < 1 \/ 2$.
    If the trajectory is a loop, write $w$ for its coordinate expression and $hat(V)$ for the coordinate vector
    field. Then
  $ dot(w) \( t \) = tau hat(V) \( w \( t \) \) \, wide integral_0^1 hat(V) \( w \( t \) \) thin d t = 0 . $
  Set $S = max_t \| hat(V) \( w \( t \) \) \|$. Since $\| w \( t \) - w \( a \) \| lt.eq tau S$ for $a \,
    t in \[ 0 \, 1 \]$, subtracting the zero average and using the Lipschitz bound on this convex ball gives
  $ \| hat(V) \( w \( t \) \) \| lt.eq integral_0^1 \| hat(V) \( w \( t \) \) -
    hat(V) \( w \( a \) \) \| thin d a lt.eq C tau S . $
  Thus $S = 0$, so the loop is constant and $V \( p \) = 0$. The converse follows from uniqueness of solutions.
    No homotopy assumption on the loop is used. ◻
]

#proof[
  #emph[The local flows.] Identify $bb(R)^8$ with $bb(C)^4$ by writing
  $ u = \( x_1 \, y_1 \, x_2 \, y_2 \) \, wide v = \( x_3 \, y_3 \, x_4 \, y_4 \) \, wide z_j = x_j + i y_j \, $
  and equip $X times bb(C)^4$ with $Omega = omega_X + sum_j d x_j and d y_j$.
    Put $s_1 = s_2 = - 1$ and $s_3 = s_4 = 1$, so that $Q = 1 / 2 sum_j s_j \| z_j \|^2$.
    Let $Phi_F^tau$ and $Phi_Q^tau$ denote the autonomous Hamiltonian flows for this form and the stated sign
    convention. In a standard plane, $X_H = \( H_y \, - H_x \)$; consequently
  #[#set math.equation(numbering: n => "(15)")
   $ Phi_Q^tau \( x \, z_1 \, dots.h \, z_4 \) = #scale(x: 120%, y: 120%)[\(] x \, e^(- i s_1 tau) z_1 \,
     dots.h \, e^(- i s_4 tau) z_4 #scale(x: 120%, y: 120%)[\)] . $ <eq:quadratic-rotation>]
  The vector fields of $F$ and $Q$ agree on $r gt.eq 3$, including its boundary.
    That boundary is invariant, so uniqueness of solutions in both time directions makes $r <
    3$ invariant as well. Trajectories there remain in the compact set $X times { r lt.eq 3 }$,
    whereas exterior trajectories are the explicit rotations in (15). Thus both flows are complete.
    They preserve the open set
  $ U_0 = X times { z in bb(C)^4 : \| z_j \| < 4 upright(" for all ") j } $
  and its compact closure $K$: points with $r < 3$ have every $\| z_j \| < 3$,
    and exterior trajectories preserve each $\| z_j \|$. Since $d Q eq.not 0$ on $r gt.eq 3$,
    all critical points of $F$ lie in $r < 3$. They form a closed discrete subset of $X times { r lt.eq
    3 }$ and hence are finite.
  #emph[One small time for all fixed points.] We choose $epsilon.alt >
    0$ so that the fixed points of $Phi_F^epsilon.alt$ in $K$ are precisely the critical points of $F$,
    all nondegenerate. Lemma 9, applied to $X_F$ on the compact invariant set $K$,
    supplies $tau_0 > 0$ for the first assertion. The zero set of $X_F$ equals $"Crit" \( F \)$ because $Omega$ is
    nondegenerate. We next choose the time small enough to obtain nondegeneracy of the return map as well.
  At a critical point $p$, put $A_p = D_p X_F$. Differentiating $Omega \( X_F \, dot.op \) = d F$ at $p$,
    where $X_F \( p \) = 0$, shows that $A_p$ is the composition of the nonsingular Hessian of $F$ with a
    symplectic identification, and is therefore invertible. Moreover,
  $ D_p Phi_F^epsilon.alt = exp \( epsilon.alt A_p \) . $
  Let $R gt.eq 1$ bound the moduli of all complex eigenvalues of the finitely many matrices $A_p$.
    If $0 < epsilon.alt R < 2 pi$, no nonzero eigenvalue $mu$ of any $A_p$ satisfies $epsilon.alt mu in 2 pi i
    bb(Z)$. The eigenvalues of $exp \( epsilon.alt A_p \)$ therefore all differ from one. Fix, once and for all,
  #[#set math.equation(numbering: n => "(16)")
   $ 0 < epsilon.alt < min { pi \, tau_0 \, 2 pi \/ R } . $ <eq:small-epsilon>]
  This proves the required fixed-point and nondegeneracy assertions for the local time-$epsilon.alt$ map.
  #emph[Sphere caps and matching rotations.] On each sphere use polar coordinates $\( theta.alt \, phi \)$ and
    write $h = cos theta.alt$. Its symplectic form is
  $ lambda sigma = lambda sin theta.alt thin d theta.alt and d phi = - lambda thin d h and d phi . $
  The north and south cap coordinates are, respectively,
  #[#set math.equation(numbering: n => "(17)")
   $ z_N = sqrt(2 lambda \( 1 - h \)) thin e^(i phi) \, wide z_S =
     sqrt(2 lambda \( 1 + h \)) thin e^(- i phi) . $ <eq:pole-coordinates>]
  These are smooth coordinates at their poles. Indeed, in the usual embedding coordinates $\( a \, b \, h \)$ of
    the unit sphere, they are
  $ z_N = sqrt(frac(2 lambda, 1 + h)) \( a + i b \) \, wide z_S = sqrt(frac(2 lambda, 1 - h)) \( a - i b \) . $
  To check the area forms, write $z = R_z e^(i psi)$. At the north pole $R_z d R_z = - lambda d h$ and $d psi =
    d phi$; at the south pole $R_z d R_z = lambda d h$ and $d psi = - d phi$.
    In both cases $d x and d y = R_z d R_z and d psi = - lambda d h and d phi$.
  The two radius-$5$ caps are disjoint because $lambda > 25 \/ 2$: their height intervals are
  $ h > 1 - frac(25, 2 lambda) quad upright("and") quad h < - 1 + frac(25, 2 lambda) . $
  For each choice $nu in { N \, S }^4$, let $U_nu subset M$ be the product of $X$ with the corresponding four
    radius-$4$ caps, and let $iota_nu : U_0 arrow.r U_nu$ be the symplectic identification given by (17).
    The sixteen sets $U_nu$ are pairwise disjoint.
  For each $j$ choose a smooth function $alpha_j : \[ - 1 \, 1 \] arrow.r \( 0 \, 2 pi \)$,
    constant on the radius-$5$ caps, with the following values:
  $ & upright("north") & upright("south")\
s_j = - 1 & epsilon.alt & 2 pi - epsilon.alt\
s_j = 1 & 2 pi - epsilon.alt & epsilon.alt $
  Smooth interpolation is possible within $\[ epsilon.alt \, 2 pi - epsilon.alt \] subset \( 0 \, 2 pi \)$.
    Define the Hamiltonian on $M$
  $ P = sum_(j = 1)^4 P_j \( h_j \) \, wide P_j \( h \) = lambda integral_0^h alpha_j \( xi \) thin d xi \, $
  and denote its flow by $Psi_t$. Since
  $ iota_(alpha_j \( h \) partial_phi) \( - lambda thin d h and d phi \) = lambda alpha_j \( h \) thin d h = d P_j \, $
  this flow rotates $phi_j$ with positive speed $alpha_j \( h_j \)$ and fixes the $X$ coordinate.
    A north coordinate rotates by $e^(i alpha_j t)$ and a south coordinate by $e^(- i alpha_j t)$.
    The table therefore gives the endpoint multiplier $e^(- i s_j epsilon.alt)$ in either chart, and hence
  #[#set math.equation(numbering: n => "(18)")
   $ iota_nu^(- 1) compose Psi_1 compose iota_nu = Phi_Q^epsilon.alt quad
     upright("on ") U_0 . $ <eq:cap-endpoint-match>]
  Only the endpoints are equal: for some cap choices the rotation paths differ by a full turn.
    Figure 2 illustrates this distinction in one complex coordinate.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-3.1, 1.95), [#text(size: 9pt)[North chart: $z_N=R_z e^(i phi )$#linebreak()chart angle $+ epsilon t$]])
  circle((-3.1, 0), radius: 1.15, stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  line((-3.1, 0), (-1.95, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-3.1, 0), (-2.158, 0.6596), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((-1.95, 0), radius: 0.05292, fill: black, stroke: none)
  circle((-2.158, 0.6596), radius: 0.05292, fill: black, stroke: none)
  content((-1.95, 0), [#text(size: 9pt)[$1$]], anchor: "west", padding: 0.1176cm)
  content((-2.158, 0.6596), [#text(size: 9pt)[$e^(i epsilon )$]], anchor: "south-west", padding: 0.1176cm)
  arc((-1.95, 0), start: 0deg, stop: 35deg, radius: 1.15, stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  content((-3.1, -1.65), [#text(size: 9pt)[$e^(i epsilon t)$#linebreak()short counterclockwise path]])
  content((3.1, 1.95), [#text(size: 9pt)[South chart: $z_S=R_z e^(-i phi )$#linebreak()chart angle $-(2 pi - epsilon )t$]])
  circle((3.1, 0), radius: 1.15, stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  line((3.1, 0), (4.25, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((3.1, 0), (4.042, 0.6596), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((4.25, 0), radius: 0.05292, fill: black, stroke: none)
  circle((4.042, 0.6596), radius: 0.05292, fill: black, stroke: none)
  content((4.25, 0), [#text(size: 9pt)[$1$]], anchor: "west", padding: 0.1176cm)
  content((4.042, 0.6596), [#text(size: 9pt)[$e^(i epsilon )$]], anchor: "south-west", padding: 0.1176cm)
  arc((4.25, 0), start: 0deg, stop: -325deg, radius: 1.15, stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  content((3.1, -1.65), [#text(size: 9pt)[$e^(-i(2 pi - epsilon )t)=e^(i epsilon t)e^(-2 pi "it")$#linebreak()long clockwise path]])
})],
    caption: [Figure 2: The case $s_j = - 1$, shown as multiplier paths in the two local complex charts with angles drawn schematically. Both sphere longitudes increase, but the south chart reverses their angular orientation. The paths start at $1$ and end at the same multiplier $e^(i epsilon.alt)$; the south path makes one additional negative turn. For $s_j = 1$, the north path makes the additional turn and both endpoints are $e^(- i epsilon.alt)$. ],
  ) <fig:pole-rotations>
  Every $Psi_t$ preserves all cap radii, so it preserves each $U_nu$ and the complement of their union.
    A nonpolar sphere point cannot be fixed by $Psi_1$, because its rotation angle lies strictly between zero and
    $2 pi$. Consequently
  #[#set math.equation(numbering: n => "(19)")
   $ "Fix" \( Psi_1 \) = X times { N \, S }^4 subset union.big_nu U_nu . $ <eq:rotation-fixed-set>]
  #emph[A correction supported inside the caps.] We use the elementary composition rule that if Hamiltonian paths
    $a_t \, b_t$ have generators $A_t \, B_t$, then $a_t compose b_t$ has generator $A_t + B_t compose a_t^(- 1)$.
    Its vector field is $X_(A_t) + \( a_t \)_(*) X_(B_t)$, and symplectic transport gives $\( a_t \)_(*) X_(B_t) =
    X_(B_t compose a_t^(- 1))$, proving the rule with our sign convention.
  On the model space define
  #[#set math.equation(numbering: n => "(20)")
   $ delta_t = Phi_F^(epsilon.alt t) compose Phi_Q^(- epsilon.alt t) \, wide K_t =
     epsilon.alt #scale(x: 120%, y: 120%)[\(] F - Q compose Phi_F^(- epsilon.alt t)
     #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq t lt.eq 1 . $ <eq:local-correction>]
  The composition rule shows that $K_t$ generates $delta_t$.
    When $r gt.eq 3$, the backward $F$ flow equals the backward $Q$ flow and preserves $Q$.
    Thus $K_t = 0$ and $delta_t = "id"$ there. Both constituent flows preserve $r < 3$,
    so $delta_t$ preserves $U_0$. Uniformly in $t$, the support of $K_t$ is contained in the compact set $X times
    { r lt.eq 3 }$, strictly inside $U_0$.
  Define a Hamiltonian $tilde(K)_t$ on $M$ by
  $ tilde(K)_t \|_(U_nu) = K_t compose iota_nu^(- 1) \, wide tilde(K)_t = 0 quad upright("off ") union.big_nu U_nu . $
  This is smooth jointly in time and space. In particular it vanishes on a whole neighborhood of every cap
    boundary, since a point there has some $\| z_j \|$ close to $4$ and therefore $r > 3$.
    Let $Delta_t$ be its Hamiltonian flow. By uniqueness,
  $ Delta_t \|_(U_nu) = iota_nu compose delta_t compose iota_nu^(- 1) \, wide Delta_t = "id" quad
    upright("off ") union.big_nu U_nu . $
  Set $Gamma_t = Delta_t compose Psi_t$. Combining (18) and (20) yields
  #[#set math.equation(numbering: n => "(21)")
   $ iota_nu^(- 1) compose Gamma_1 compose iota_nu = Phi_F^epsilon.alt compose Phi_Q^(- epsilon.alt) compose
     Phi_Q^epsilon.alt = Phi_F^epsilon.alt . $ <eq:inserted-endpoint>]
  On the complement of the cap union, $Psi_1$ remains in that complement and $Delta_1$ acts trivially.
    Hence $Gamma_1 = Psi_1$ there, including at the cap boundaries. By (19), this exterior has no fixed points.
    Inside each cap, (21) gives precisely the $N$ critical points of $F$,
    all lying in $r < 3$ and all nondegenerate by (16). Thus every fixed point has been counted,
    and $Gamma_1$ has exactly $16 N$ nondegenerate fixed points.
  #emph[The fixed-point loops.] For each cap choice $nu$, define the path on $U_0$
  $ R_(nu \, t) = Phi_Q^(- epsilon.alt t) compose iota_nu^(- 1) compose Psi_t compose iota_nu . $
  The rotation table shows that $R_(nu \, t)$ fixes the $X$ coordinate and multiplies each $z_j$ by
    $e^(2 pi i m_(nu \, j) t)$ for an integer $m_(nu \, j) in { - 1 \, 0 \, 1 }$.
    In particular, $R_(nu \, 0) = R_(nu \, 1) = "id"$, and these rotations preserve $r$.
    For a critical point $p = \( x \, z \)$ of $F$, the fixed-point loop of $Gamma_t$, expressed in this cap, is
  $ iota_nu^(- 1) Gamma_t iota_nu \( p \) = Phi_F^(epsilon.alt t) #scale(x: 120%, y: 120%)[\(] R_(nu \, t) \( p \)
    #scale(x: 120%, y: 120%)[\)] . $
  Write $R_(nu \, t) \( p \) = \( x \, z_nu \( t \) \)$. The fibre loop contracts to $p$ by
  $ q_s \( t \) = #scale(x: 120%, y: 120%)[\(] x \, \( 1 - s \) z_nu \( t \) + s z #scale(x: 120%, y: 120%)[\)] \,
    wide 0 lt.eq s \, t lt.eq 1 . $
  Convexity keeps $q_s \( t \)$ in $r < 3$, since $r \( p \) < 3$ and the rotations preserve $r$. Therefore
  $ C \( s \, t \) = Phi_F^(epsilon.alt t) #scale(x: 120%, y: 120%)[\(] q_s \( t \) #scale(x: 120%, y: 120%)[\)] $
  is a homotopy inside $r < 3$ from the displayed fixed-point loop to the constant loop at $p$.
    It is based at $p$: the endpoint identities $q_s \( 0 \) = q_s \( 1 \) =
    p$ and the fact that $p$ is an equilibrium of $F$ give $C \( s \, 0 \) = C \( s \, 1 \) =
    p$ and $C \( 1 \, t \) = p$. Thus every fixed-point loop of $Gamma_t$ is contractible within its cap.
  #emph[A smooth periodic Hamiltonian.] The composition rule gives the generator
  $ L_t = tilde(K)_t + P compose Delta_t^(- 1) $
  for $Gamma_t$. Choose a smooth nondecreasing map $rho : \[ 0 \, 1 \]
    arrow.r \[ 0 \, 1 \]$ equal to zero near zero and to one near one.
    The reparametrized path $Gamma_(rho \( t \))$ is generated by
  $ H_t = rho' \( t \) L_(rho \( t \)) = rho' \( t \) #scale(x: 120%, y: 120%)[\(] tilde(K)_(rho \( t \)) +
    P compose Delta_(rho \( t \))^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  This Hamiltonian vanishes on neighborhoods of both time endpoints,
    so its periodic extension belongs to $C^oo \( \( bb(R) \/ bb(Z) \) times M \, bb(R) \)$.
    Its time-one map is exactly $Gamma_1$, with the same derivatives at all fixed points.
    Composing each based contraction with $t mapsto rho \( t \)$ proves contractibility for the reparametrized
    fixed-point loops as well. This proves the proposition. ◻
]

== 6 The Morse lower bound and the deficit <sec:counting>

We finish by comparing the count from Proposition 8 with the ordinary Morse number.
  The lower bound uses the number of generators of the fundamental group, not the augmentation ideal.

#thm([Lemma 6.1.])[
  #emph[Let $Y$ be a closed connected smooth manifold of even dimension $n gt.eq 4$,
    and let $d \( pi_1 Y \)$ denote the minimum number of generators of its fundamental group. Then
$ "Morse" \( Y \) gt.eq chi \( Y \) + 4 d \( pi_1 Y \) . $

]
] <lem:morse-lower>

#proof[
  For a Morse function on $Y$, let $m_i$ be its number of index-$i$ critical points.
    The zero- and one-handles form a connected graph: handles of index at least two cannot join distinct
    components. This graph has $m_0$ vertices and $m_1$ edges, so its fundamental group is free of rank $m_1 -
    m_0 + 1$. Adding the higher handles gives a surjection from this group onto $pi_1 Y$. Thus
  $ d \( pi_1 Y \) lt.eq m_1 - m_0 + 1 lt.eq m_1 . $
  Apply the same argument to the negative of the Morse function to obtain $m_(n - 1) gt.eq d \( pi_1 Y \)$.
    Since $n$ is even, the Euler identity gives
  $ sum_(i = 0)^n m_i = chi \( Y \) + 2 sum_(i upright(" odd")) m_i gt.eq chi \( Y \) +
    2 \( m_1 + m_(n - 1) \) gt.eq chi \( Y \) + 4 d \( pi_1 Y \) . $
  Taking the minimum over all Morse functions proves the claim. ◻
]

#proof[
  Choose $b = 2$ and $G = A_5^k$ with $k > 60^(16 b)$ as in Lemma 3. In particular $d \( G \) > 16 b$.
    Every finite group is finitely presented. Gompf’s existence theorem therefore provides a closed connected
    symplectic four-manifold $\( X \, omega_X \)$ with $pi_1 \( X \) tilde.equiv
    G$ #cite(label("Gompf1992")) Theorem 3.1. The finiteness of $G$ implies $chi \( X \) gt.eq 2$,
    as explained in Section 3. Lemmas 4 and 5, followed by Proposition 6, give a Morse function on $X times
    bb(R)^8$, equal to $Q$ for $r gt.eq 3$, with
  $ N = chi \( X \) + 4 b $
  critical points.
  Proposition 8 produces a smooth one-periodic Hamiltonian $H$ on the closed connected symplectic manifold $M =
    X times \( S^2 \)^4$. Its time-one map is nondegenerate at every fixed point and has exactly
  #[#set math.equation(numbering: n => "(22)")
   $ \# "Fix" \( phi.alt_H^1 \) = 16 N = 16 chi \( X \) + 64 b = chi \( M \) + 128 . $ <eq:final-fixed-count>]
  Here $dim_(bb(R)) M = 12$, $pi_1 \( M \) tilde.equiv G$, and $chi \( M \) = 16 chi \( X \)$. Lemma 10 yields
  $ "Morse" \( M \) gt.eq chi \( M \) + 4 d \( G \) > chi \( M \) + 64 b = \# "Fix" \( phi.alt_H^1 \) . $
  The cap-transfer proposition also proves that every fixed-point trajectory of this Hamiltonian is contractible. Hence
  $ \# "Fix"_0 \( phi.alt_H^1 \; H \) = \# "Fix" \( phi.alt_H^1 \) < "Morse" \( M \) \, $
  which completes the proof. ◻
]

#proof[
  Given a real number $D > 0$, choose an integer $m > 16 b + D \/ 4$ and then a finite integer $k > 60^m$.
    Lemma 3 gives $d \( A_5^k \) > m$. The bound $b = 2$ in Lemma 4 is independent of $k$,
    and all handle operations above take place in the same dimension twelve with eight added variables.
    Applying the construction for this group and using (22) gives
  $ "Morse" \( M \) - \# "Fix" \( phi.alt_H^1 \) gt.eq 4 d \( A_5^k \) - 64 b > D . $
  The manifold $X$, and hence $M$, may depend on $D$, as may the small time and sphere-area parameters used in the
    construction. The dimension, quadratic index, and bound $b$ do not depend on $D$. ◻
]

In these examples the integral homology is also easy to identify to the extent needed for the comparison with
  homological bounds. The group $G$ is perfect, so $H_1 \( X \; bb(Z) \) = 0$.
  Poincaré duality gives $H_3 \( X \; bb(Z) \) = H^1 \( X \; bb(Z) \) = 0$;
  the universal coefficient theorem and duality give $H_2 \( X \; bb(Z) \) tilde.equiv H^2 \( X \; bb(Z) \)
  tilde.equiv "Hom" \( H_2 \( X \; bb(Z) \) \, bb(Z) \)$, so $H_2 \( X \; bb(Z) \)$ is free abelian.
  Hence the integral homology of $M = X times \( S^2 \)^4$ is torsion-free and concentrated in even degrees.
  Its total rank is $chi \( M \)$, and the fixed-point count in (22) exceeds this number.
  Thus the total fixed-point count exceeds both the rational Betti number and the rank-and-torsion quantity
  discussed in the introduction. The obstruction detected by the ordinary Morse number is the additional cost of
  the fundamental group.

#bibliography("refs.bib", style: "ieee", title: [References])
