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

#align(center)[#text(size: 16pt, weight: "bold")[Schnell fiber spaces and good canonical models]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The pluricanonical systems of an algebraic fiber space reflect both the geometry of its fibers and the positivity available from its base. When the geometric generic fiber has Kodaira dimension zero, the easy-addition bound says that the total space has Kodaira dimension at most the dimension of the base. The zero-Kodaira case of Schnell’s question asks whether a numerical comparison with an ample divisor on the base forces equality. Here an #emph[algebraic fiber space] means a surjective morphism with connected fibers between projective varieties.

We approach this question through a good canonical model of the total space. The geometric argument below shows what such a model supplies; the smooth canonical good-model theorem of #cite(label("LogAbundance2026")) Corollary 11.2 then provides the model. Its nonvanishing consequence also permits Schnell’s reduction to pass from zero-Kodaira fibers to the Campana–Peternell inequality and the general fiber-space conclusion stated below.

The formulation in #cite(label("Kim2025")) Conjecture 1.2 compares a positive multiple of $K_X$ with the pullback of an ample Cartier divisor on the base. The difficulty is that pseudo-effectivity concerns a numerical divisor class, whereas Kodaira dimension measures actual sections. The following theorem gives the positive conclusion in this formulation; its assertion has also been proved by Zou, as discussed below.

#thm([Theorem 1.1.])[
  (Schnell’s zero-Kodaira fiber-space conclusion).  #emph[Let $f : X arrow.r Y$ be a surjective morphism with connected fibers between smooth connected projective complex varieties. Let $F$ be its smooth geometric generic fiber and assume $kappa \( F \) = 0$. Suppose that there are an ample Cartier divisor $H$ on $Y$ and a positive integer $m_0$ such that $m_0 K_X - f^(*) H$ is pseudo-effective. Then 
$ kappa \( X \) = dim Y . $

]
] <thm:schnell>

The ample comparison is essential. For example, let $F$ be smooth, connected and projective with torsion canonical bundle. The projection $F times bb(P)^1 arrow.r bb(P)^1$ has fibers of Kodaira dimension zero, but its total space has Kodaira dimension $- oo$. The class $m_0 K_(F times bb(P)^1) - f^(*) H$ has negative degree on the moving curves ${ x } times bb(P)^1$ for every ample $H$; it therefore cannot be pseudo-effective: for any fixed effective divisor, a general member of this family is not contained in its support and has nonnegative intersection with it. In contrast, for a smooth connected projective $Y$ with $K_Y$ ample, the projection $F times Y arrow.r Y$ satisfies the numerical hypothesis with $H = K_Y$ for every $m_0 gt.eq 1$, since the compared class is numerically $\( m_0 - 1 \) f^(*) K_Y$. Its Kodaira dimension is $dim Y$.

The canonical good-model theorem used below also supplies canonical nonvanishing in every dimension. With this input, Schnell’s reduction #cite(label("Schnell2022")) Sections 4–10 promotes Theorem 1 to the Kodaira-dimension form of the Campana–Peternell conjecture.

#thm([Corollary 1.2.])[
  (Campana–Peternell).  #emph[Let $X$ be a smooth connected projective complex variety, let $D$ be an effective Cartier divisor on $X$, and let $m_0$ be a positive integer. If $m_0 K_X - D$ is pseudo-effective, then 
$ kappa \( X \) gt.eq kappa \( D \) . $

]
] <cor:campana-peternell>

The same reduction gives the general fiber-space conclusion, including the existence of sections after subtracting the original ample pullback.

#thm([Corollary 1.3.])[
  (Schnell’s general fiber-space conclusion).  #emph[Let $f : X arrow.r Y$ be a surjective morphism with connected fibers between smooth connected projective complex varieties, and let $F$ be a very general smooth fiber. Suppose that $H$ is an ample Cartier divisor on $Y$ and $m_0$ is a positive integer such that $m_0 K_X - f^(*) H$ is pseudo-effective. Then 
$ kappa \( X \) = kappa \( F \) + dim Y . $

 Moreover, there are positive integers $r$ and $ell_0$ such that 
$ H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( ell r K_X - f^(*) H \) #scale(x: 120%, y: 120%)[\)] eq.not 0 #h(2em) upright("for every integer ") ell gt.eq ell_0 . $

]
] <cor:schnell-general>

The last assertion is effectivity for all sufficiently large and divisible pluricanonical degrees, with no uniform choice of $r$ or $ell_0$ asserted. The numerical hypothesis itself implies $kappa \( F \) gt.eq 0$ by restriction and canonical nonvanishing; it is not replaced by that weaker fiber condition. Corollary 2 also applies to an effective rational divisor after clearing denominators, as explained in Section 4.

=== 1.1 The problem and previous approaches <the-problem-and-previous-approaches>

Campana and Peternell formulated the comparison $N K_X = A + B$, with $N$ a positive integer, $A$ effective and $B$ pseudo-effective, in their study of positivity of the cotangent bundle #cite(label("CP2011")) Conjecture 2.4. The proposed inequality $kappa \( X \) gt.eq kappa \( A \)$ includes canonical nonvanishing when $A = 0$: pseudo-effective $K_X$ should have a nonzero pluricanonical section. For general $A$, the conclusion also requires the canonical systems to have at least the image dimension supplied by $A$. When $kappa \( X \) gt.eq 0$, Campana and Peternell reduce this comparison to the general fibers of the Iitaka fibration of $X$, which have Kodaira dimension zero #cite(label("CP2011")) Proposition 2.6. In that zero-Kodaira setting, a good minimal model has torsion canonical class; their pushforward argument then forces $kappa \( A \) = 0$ #cite(label("CP2011")) Proposition 2.7. This already exhibits how a good model can convert numerical information into a statement about sections.

Schnell developed this circle of questions in his study of singular metrics, nonvanishing and the Campana–Peternell conjecture #cite(label("Schnell2022")) Sections 4–10. His Conjecture 10.1 allows fibers of nonnegative Kodaira dimension and asks for nonvanishing after subtracting an ample pullback. Under canonical nonvanishing, his Section 9 reduces the conjecture to fibers of Kodaira dimension zero; Lemma 7.1 supplies an effective pluricanonical divisor after a positive base twist. If the fiber has positive Kodaira dimension, the Iitaka fibration of that divisor has a strictly larger base, while retaining the numerical comparison. Iteration reaches the zero-Kodaira case. Section 8 connects the resulting equality to effectivity after subtracting the original ample pullback. This uses the Iitaka-addition criterion of Fujita and Mori, in the form recorded in #cite(label("PopaSchnell2014")) Lemma 4.6. He proves a special case when the canonical divisor of the base is pseudo-effective #cite(label("Schnell2022")) Theorem 12.1.

Kim applies the canonical bundle formula to the same fiber-space problem. His Theorem 1.3 proves the conclusion when $K_Y + \( 1 - epsilon \) B_Y$ is pseudo-effective for some $epsilon > 0$, where $B_Y$ is the discriminant on the birational setup of that theorem, or when the canonical class of the general fiber is rigid #cite(label("Kim2025")). Here rigidity means uniqueness of the closed positive $\( 1 \, 1 \)$-current representing that class. Kim also recalls a known algebraic proof under the existence of a good minimal model of the general fiber #cite(label("Kim2025")) Section 1.3. Zou obtains the same conclusion as Theorem 1, without these additional hypotheses, by a canonical-bundle-formula argument #cite(label("Zou2025")) Theorems 1.3 and 5.1.

We give a direct mixed-intersection proof of Theorem 1 from a good minimal model of the #emph[total space]. We separate that geometric argument from the model-existence theorem that it uses. The latter is the smooth canonical good-model theorem of #cite(label("LogAbundance2026")) Corollary 11.2, quoted in Theorem 7. Its nonvanishing consequence and Schnell’s published reduction then yield Corollaries 2 and 3.

=== 1.2 How the numerical condition produces the lower bound <how-the-numerical-condition-produces-the-lower-bound>

A good klt minimal model of $X$ consists of a normal projective $bb(Q)$-factorial klt variety $V$ with semiample canonical divisor and a $K_X$-negative birational contraction $X arrow.r.dashed V$. For compatible canonical divisors, the comparison on a smooth common resolution $X arrow.l^p W arrow.r^q V$ has the form

#[#set math.equation(numbering: n => "(1.1)")
 $ p^(*) K_X = q^(*) K_V + E \, #h(2em) E gt.eq 0 \, #h(2em) q_(*) E = 0 . $ <eq:intro-comparison>]

The last condition means that every component of $E$ is exceptional over $V$. The model therefore provides sections and also specifies the error in transferring them to $X$.

Choose a globally generated Cartier multiple $r K_V$. The comparison makes $r E$ an effective Cartier divisor. Pulling back sections of $r K_V$ and multiplying by the canonical section of $r E$ gives a pluricanonical subsystem on $X$ with the same image dimension. It remains to force that dimension to be at least $dim Y$.

If the image were smaller, Lemma 6 would provide a mixed complete-intersection curve class $C$ on $W$ with three properties: it pairs nonnegatively with every pseudo-effective divisor, it annihilates both $q^(*) K_V$ and $E$, and it pairs positively with $\( f p \)^(*) H$. Its divisor factors are pulled back from $V$, so the exceptional vanishing follows from the Cartier projection formula. The strict positivity uses a cotangent direction from the map to $Y$ beyond those supplied by the canonical morphism. Thus

$ \( m_0 p^(*) K_X - \( f p \)^(*) H \) dot.op C = - \( f p \)^(*) H dot.op C < 0 \, $

contrary to the pulled-back numerical hypothesis. Section 2 constructs the class and proves each of these properties.

This argument uses the classical intersection theory of Cartier divisors and proper pushforward #cite(label("Fulton1998")) Chapter 2. In particular, the maps to $Y$ and to the canonical image need no factorization relation. Section 2 gives the complete geometric proof, including the upper bound and the transfer of sections. Section 3 states the exact good-model input, verifies its hypotheses and completes Theorem 1. Section 4 explains the nonvanishing and fiber interfaces, then proves the Campana–Peternell and general Schnell conclusions.

=== 1.3 Conventions <conventions>

All varieties are integral and projective over $bb(C)$ unless specified otherwise. Smoothness of an algebraic fiber space refers here to its source and target; special fibers of the morphism may be singular. Canonical divisors on birational models are chosen compatibly. For a rational Cartier divisor $L$, the Iitaka dimension $kappa \( L \)$ is the maximum dimension of the rational images of its nonempty complete systems $\| m L \|$, with $m > 0$ clearing the Cartier index. It is $- oo$ if all these systems are empty. We write $kappa \( X \) = kappa \( K_X \)$.

We write $overline("Eff") \( X \)$ for the closure of the cone of effective real divisor classes in $N^1 \( X \)_(bb(R))$. A divisor is pseudo-effective when its numerical class belongs to this cone. A rational Cartier divisor is semiample when a positive Cartier multiple is globally generated. The section constructions below use this actual line-bundle property.

== 2 The numerical argument on a good minimal model <sec:geometry>

We prove the fiber-space conclusion assuming that the total space has a good klt minimal model. The upper bound comes from the geometric generic fiber. For the lower bound, we construct a mixed intersection that detects the ample class from the base and kills both terms in the canonical comparison.

#thm([Theorem 2.1.])[
  (The good-model case).  #emph[Let $f : X arrow.r Y$ be a surjective morphism with connected fibers between smooth connected projective complex varieties. Let $F$ be its smooth geometric generic fiber and suppose $kappa \( F \) = 0$. Assume that $X$ has a projective good klt minimal model. If $H$ is an ample Cartier divisor on $Y$ and $m_0$ is a positive integer such that 
#[#set math.equation(numbering: n => "(2.1)")
 $ m_0 K_X - f^(*) H in overline("Eff") \( X \) \, $ <eq:geometric-numerical-hypothesis>]

 then $kappa \( X \) = dim Y$.]
] <thm:good-model-case>

We use the good-model convention and effective comparison (1.1) stated in the introduction. This is the $K_X$-negative convention of #cite(label("BCHM2010")) Definitions 3.6.1 and 3.6.7.

=== 2.1 The upper bound from the generic fiber <the-upper-bound-from-the-generic-fiber>

We first account for the use of $kappa \( F \) = 0$. It bounds every pluricanonical image of $X$, before any model is chosen.

#thm([Lemma 2.2.])[
  (The geometric generic fiber bound).  #emph[Let $f : X arrow.r Y$ be a surjective morphism with connected fibers between smooth connected projective complex varieties. If its smooth geometric generic fiber $F$ satisfies $kappa \( F \) = 0$, then $kappa \( X \) lt.eq dim Y$.]
] <lem:easy-addition>

#proof[
  Put $K = bb(C) \( Y \)$ and $eta = "Spec" K$. Generic smoothness and Stein factorization give a smooth geometrically integral generic fiber $X_eta$ #cite(label("Hartshorne1977")) III, Sections 10–11. The cotangent sequence along this fiber gives
  #[#set math.equation(numbering: n => "(2.2)")
   $ omega_X \|_(X_eta) tilde.eq omega_(X_eta \/ K) ⊗_K ell \, #h(2em) ell = omega_Y \|_eta . $ <eq:canonical-generic-restriction>]
  Here $ell$ is a one-dimensional $K$-vector space. The factor from the base therefore cancels in ratios of pluricanonical sections.
  Fix $m > 0$ such that $H^0 \( X \, m K_X \) eq.not 0$, and choose a basis $s_0 \, dots.h \, s_N$ with $s_0 eq.not 0$. A nonzero section is nonzero at the generic point of $X$, so it stays nonzero on $X_eta$ and after extension to the geometric generic fiber. By (2.2), the restricted system on $F$ is a nonzero subsystem of $\| m K_F \|$. Its image has dimension zero, since $kappa \( F \) = 0$.
  Let $phi.alt_m$ be the rational map of the complete system $\| m K_X \|$, and let $T$ be the closure of the image of $\( f \, phi.alt_m \) : X arrow.r.dashed Y times bb(P)^N$. Its function field is
  $ L = K \( s_1 \/ s_0 \, dots.h \, s_N \/ s_0 \) subset.eq bb(C) \( X \) . $
  The dimension of its generic image over $Y$ is $"trdeg"_K L$. This dimension is unchanged by algebraic extension of $K$. Geometric integrality of $X_eta$ identifies that extended image with the image of the same section ratios on $F$. Thus $"trdeg"_K L = 0$, and $dim T = dim Y$. Projection to $bb(P)^N$ gives $dim phi.alt_m \( X \) lt.eq dim Y$. Taking the maximum over all nonempty pluricanonical systems proves the lemma. If every system is empty, the inequality is immediate. ◻
]

=== 2.2 A curve class that detects the base <a-curve-class-that-detects-the-base>

The lower bound requires a different ingredient. The following lemma constructs a numerical test from a globally generated divisor on $V$. All its factors come from $V$, which is why exceptional errors vanish. Its strict positivity uses the independent morphism to $Y$.

#thm([Lemma 2.3.])[
  (A mixed intersection test).  #emph[Let $q : W arrow.r V$ be a birational morphism from a smooth projective complex $d$-fold to a normal projective variety. Let $D$ be a globally generated Cartier divisor on $V$, and let $g : V arrow.r Z subset.eq bb(P)^N$ be the morphism of $\| D \|$ onto its image. Write $k = dim Z$, and let $A$ be a very ample Cartier divisor on $V$. Suppose $h : W arrow.r Y$ is a surjective morphism to a smooth projective variety with $y = dim Y > k$. For every ample Cartier divisor $H$ on $Y$, the numerical one-cycle class 
$ C = \( q^(*) D \)^k \( q^(*) A \)^(d - k - 1) $

 satisfies the following properties:]
  + #emph[$B dot.op C gt.eq 0$ for every pseudo-effective real divisor class $B$ on $W$;]
  + #emph[$E dot.op C = 0$ for every $q$-exceptional rational divisor $E$;]
  + #emph[$q^(*) D dot.op C = 0$ and $h^(*) H dot.op C > 0$.]
] <lem:mixed-positivity>

#proof[
  The inequality $k < y lt.eq d$ makes all exponents nonnegative; a product with no factors has its usual meaning. We prove first that the test is nonnegative, then that it has the two required vanishing properties, and finally that it detects the ample divisor from $Y$.
  #emph[Nonnegativity.] The divisors $q^(*) D$ and $q^(*) A$ are globally generated. If $B$ is effective, choose their members successively so that no member contains an irreducible component of the preceding intersection on $B$. Global generation permits all the finitely many required avoidances. The resulting Cartier intersections form an effective zero-cycle, possibly empty. Hence $B dot.op C gt.eq 0$ #cite(label("Fulton1998")) Chapter 2. Extend by linearity to effective real divisors and by continuity on $N^1 \( W \)_(bb(R))$ to its closed effective cone. This proves (1).
  #emph[Vanishing on exceptional and semiample classes.] For a $q$-exceptional divisor the Cartier projection formula gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ E dot.op \( q^(*) D \)^k \( q^(*) A \)^(d - k - 1) = q_(*) E dot.op D^k A^(d - k - 1) = 0 \; $ <eq:exceptional-annihilation>]
  see #cite(label("Fulton1998")) Proposition 2.3(c). Indeed, every component of $E$ maps to codimension at least two, so $q_(*) E = 0$ as a divisor cycle. This reasoning is valid on the possibly singular variety $V$. Also $D = g^(*) cal(O)_Z \( 1 \)$, and $k + 1$ general hyperplanes miss the $k$-dimensional image $Z$. Consequently $\( q^(*) D \)^(k + 1) = 0$. For $k = 0$, the morphism $g$ is constant and $cal(O)_V \( D \)$ is trivial, which gives the same conclusion. These observations prove (2) and the first assertion of (3).
  #emph[Strict positivity.] Choose $b > 0$ such that $b H$ is very ample. Use this divisor to embed $Y$, and use $A$ to embed $V$. There is a point $w in W$ at which $q$ is an isomorphism onto a smooth open subset of $V$ and
  $ "rank" d \( g q \)_w = k \, #h(2em) "rank" d h_w = y \, #h(2em) "rank" d q_w = d . $
  Each condition holds on a dense open subset. For the rank statements, the generic differential rank in characteristic zero equals the dimension of the image, by separability of the function-field extension. We choose $w$ in the intersection of these open subsets.
  The differentials of pulled-back hyperplanes through $g q \( w \)$ span a $k$-dimensional subspace $U subset.eq T_w^(*) W$. Choose $k$ of them whose differentials form a basis of $U$. The hyperplanes through $h \( w \)$ supply a $y$-dimensional subspace. Since $y > k$, one such hyperplane pulls back to a divisor with differential outside $U$. Finally, hyperplanes from the embedding by $A$ supply all cotangent directions at $w$, because $q$ is a local isomorphism there. Choose $d - k - 1$ of them completing the chosen differentials to a basis of $T_w^(*) W$. These $d$ divisors meet transversely at $w$.
  To use this local intersection in the global intersection number, perturb the hyperplanes slightly in their complex parameter spaces. The transverse point persists for every sufficiently small perturbation, by the implicit function theorem. Tuples whose pullbacks meet properly at every successive step form a nonempty Zariski open subset of the product of the hyperplane parameter spaces. Nonemptiness follows by successively avoiding the finitely many components already present, using global generation; openness follows from upper semicontinuity of fiber dimension for the projective universal intersections. This parameter space is irreducible, so the open subset is dense also in the complex analytic topology. It therefore meets the perturbation neighborhood.
  The resulting proper global intersection is an effective zero-cycle that contains a transverse point of multiplicity one. It follows that
  $ h^(*) \( b H \) dot.op \( q^(*) D \)^k \( q^(*) A \)^(d - k - 1) > 0 . $
  Division by $b$ proves (3). Only one cotangent direction from $h$ outside $U$ was needed; the two morphisms $g q$ and $h$ need not factor through each other. ◻
]

=== 2.3 Sections and the numerical contradiction <sections-and-the-numerical-contradiction>

We now combine the two lemmas. The good model supplies actual sections on $X$. The mixed test forces their image to have at least the dimension of $Y$.

#proof[
  If $Y$ is a point, then $F = X$ and $kappa \( F \) = 0$ is the required conclusion. Hence assume $d = dim X gt.eq y = dim Y > 0$.
  Let $V$ be a good klt minimal model of $X$. Resolve the closure of the graph of $X arrow.r.dashed V$ projectively #cite(label("Hironaka1964")), obtaining a smooth projective common resolution $X arrow.l^p W arrow.r^q V$. By the good-model comparison, compatible canonical divisors satisfy
  #[#set math.equation(numbering: n => "(2.4)")
   $ p^(*) K_X = q^(*) K_V + E \, #h(2em) E gt.eq 0 \, #h(2em) q_(*) E = 0 . $ <eq:canonical-comparison>]
  Pulling back to a further common resolution preserves the effectivity and target-exceptionality of this error.
  Choose $r > 0$ such that $D = r K_V$ is Cartier and globally generated, and let $g : V arrow.r Z subset.eq bb(P)^N$ be its morphism onto its image. Put $k = dim Z$. Since $K_X$ is Cartier, (2.4) shows that $r E = p^(*) \( r K_X \) - q^(*) D$ is an integral Cartier divisor on $W$. The two maps whose dimensions we will compare appear in Figure 1.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((2.057, 0), [$W$])
  content((0, -1.585), [$X$])
  content((4.115, -1.585), [$V$])
  content((0, -3.171), [$Y$])
  content((4.115, -3.171), [$Z$])
  line((1.847, -0.1625), (0.2108, -1.423), mark: (end: ">"))
  content((0.818, -0.5192), [#text(size: 0.73em)[$p$]])
  line((2.268, -0.1625), (3.904, -1.423), mark: (end: ">"))
  content((3.297, -0.5192), [#text(size: 0.73em)[$q$]])
  line((0, -1.858), (0, -2.898), mark: (end: ">"))
  content((-0.3223, -2.378), [#text(size: 0.73em)[$f$]])
  line((4.115, -1.858), (4.115, -2.898), mark: (end: ">"))
  content((4.437, -2.378), [#text(size: 0.73em)[$g$]])
})],
    caption: [Figure 1: The common resolution carries the two morphisms $h = f p$ to $Y$ and $g q$ to $Z$. The divisor factors defining the mixed class are pulled back from $V$, so the class annihilates the $q$-exceptional error. Its pairing with $h^(*) H$ detects the ample class from the separate base $Y$. ],
  ) <fig:common-resolution>
  Pull back sections of $D$ by $q$ and multiply by the canonical section of the effective Cartier divisor $r E$. We obtain an injection
  #[#set math.equation(numbering: n => "(2.5)")
   $ H^0 \( V \, D \) arrow.r.hook H^0 \( W \, r p^(*) K_X \) = H^0 \( X \, r K_X \) . $ <eq:section-transfer>]
  The equality follows from $p_(*) cal(O)_W = cal(O)_X$ and the sheaf projection formula for the proper birational map to the normal variety $X$ #cite(label("Hartshorne1977")) III, Corollary 11.4 and its proof; II, Exercise 5.1(d). Multiplication by the section of $r E$ leaves section ratios unchanged on the complement of its support. Thus the subsystem in (2.5) has image dimension $k$, and
  #[#set math.equation(numbering: n => "(2.6)")
   $ kappa \( X \) gt.eq k . $ <eq:canonical-image-lower-bound>]
  Suppose, for a contradiction, that $k < y$. Choose a very ample Cartier divisor $A$ on $V$ and apply Lemma 6 with
  $ h = f p \, #h(2em) C = \( q^(*) D \)^k \( q^(*) A \)^(d - k - 1) . $
  The canonical comparison and the vanishing assertions of the lemma give
  #[#set math.equation(numbering: n => "(2.7)")
   $ p^(*) K_X dot.op C = 1 / r q^(*) D dot.op C + E dot.op C = 0 . $ <eq:canonical-test-zero>]
  Pullback by $p$ preserves pseudo-effectivity: on smooth varieties it takes effective real divisors to effective real divisors and induces a continuous linear map on numerical divisor spaces. Therefore the pullback of (2.1), paired with $C$, yields
  $ 0 lt.eq \( m_0 p^(*) K_X - h^(*) H \) dot.op C = - h^(*) H dot.op C < 0 \, $
  a contradiction. Hence $k gt.eq y$. Equation (2.6) and Lemma 5 now give $y lt.eq k lt.eq kappa \( X \) lt.eq y$, proving the theorem. ◻
]

The proof includes $k = 0$, $d - k - 1 = 0$ and relative dimension zero. Effectivity of $E$ supplies the section injection, while target-exceptionality makes its mixed pairing vanish. These are separate uses of the canonical comparison, and both are needed.

== 3 The canonical good model and the main theorem <sec:good-model-interface>

The geometric argument has used the existence of a good model of $X$ through its sections and its effective exceptional comparison. We now supply exactly that model. The following theorem is #cite(label("LogAbundance2026")) Corollary 11.2; its proof belongs to that companion article.

#thm([Theorem 3.1.])[
  (Smooth canonical good models).  #emph[Let $T$ be a smooth connected projective complex variety with pseudo-effective $K_T$. Then there exist a normal projective $bb(Q)$-factorial klt variety $V$ and a $K_T$-negative birational contraction $T arrow.r.dashed V$ such that $K_V$ is $bb(Q)$-Cartier and semiample. On a smooth projective common resolution $T arrow.l^p W arrow.r^q V$, compatible canonical divisors satisfy 
$ p^(*) K_T = q^(*) K_V + E \, #h(2em) E gt.eq 0 \, #h(2em) q_(*) E = 0 . $

]
] <thm:canonical-good-models>

Thus the input provides both the actual globally generated multiple used for sections and the exceptional equality used for intersections.

#proof[
  If $Y$ is a point, then its geometric generic fiber is $X$, and the conclusion is the hypothesis $kappa \( F \) = 0$. For a positive-dimensional base, a positive multiple of the ample divisor $H$ has an effective representative. Its pullback shows that $f^(*) H$ is pseudo-effective. Adding it to the original numerical hypothesis gives
  $ K_X = 1 / m_0 #scale(x: 120%, y: 120%)[\(] \( m_0 K_X - f^(*) H \) + f^(*) H #scale(x: 120%, y: 120%)[\)] in overline("Eff") \( X \) . $
  The variety $X$ is smooth, connected, projective and complex, so Theorem 7 applies. Its output is the projective good klt minimal model required by Theorem 4. Applying that theorem to the original $f$, $H$ and $m_0$ gives $kappa \( X \) = dim Y$. ◻
]

Throughout the proof the assumed comparison is numerical. The pluricanonical sections are obtained from the semiample model through (2.5); they are not assumed as a reformulation of pseudo-effectivity.

== 4 Campana–Peternell and general Schnell fiber spaces <sec:general-consequences>

The good-model input supplies canonical nonvanishing as well as the model used in the mixed-intersection argument. These two outputs fit the reduction of #cite(label("Schnell2022")) Sections 4–10.

=== 4.1 Nonvanishing and very general fibers <nonvanishing-and-very-general-fibers>

Let $T$ be a smooth connected projective complex variety with pseudo-effective $K_T$, and take the model $V$ and comparison divisor $E$ supplied by Theorem 7. Choose a positive multiple $r K_V$ that is Cartier and globally generated. The comparison then makes $r E$ an effective integral Cartier divisor. The section transfer in (2.5) gives

$ 0 eq.not H^0 \( V \, cal(O)_V \( r K_V \) \) arrow.r.hook H^0 \( T \, cal(O)_T \( r K_T \) \) . $

Consequently,

#[#set math.equation(numbering: n => "(4.1)")
 $ K_T in overline("Eff") \( T \) quad arrow.r.double quad kappa \( T \) gt.eq 0 . $ <eq:canonical-nonvanishing>]

This is the canonical nonvanishing input used by Schnell.

We will use smooth closed complex fibers when applying (4.1). They have the same Kodaira dimension as the geometric generic fiber when chosen very generally. Indeed, let $f : X arrow.r Y$ be a surjective morphism with connected fibers between smooth connected projective complex varieties, and write $X_(macron(eta))$ for its geometric generic fiber. Over a nonempty open subset, $f$ is smooth; there $omega_(X \/ Y) = omega_X ⊗ f^(*) omega_Y^(- 1)$ restricts to the canonical bundle of each fiber. For each positive integer $m$, after shrinking this open subset, formation of $f_(*) \( omega_(X \/ Y)^(⊗ m) \)$ commutes with base change. Outside the union of the resulting countably many proper closed subsets, a smooth fiber $F$ therefore satisfies

$ h^0 \( F \, omega_F^(⊗ m) \) = h^0 \( X_(macron(eta)) \, omega_(X_(macron(eta)))^(⊗ m) \) #h(2em) upright("for every ") m > 0 . $

Here the dimension on the right is over the algebraic closure of $bb(C) \( Y \)$. Thus the plurigenus sequences, and hence the Kodaira dimensions, agree. Such complex fibers exist because $bb(C)$ is uncountable. In particular, the zero-Kodaira fiber condition in the reduction below is precisely the geometric generic fiber condition of Theorem 1.

We also use the restriction observation in #cite(label("Schnell2022")) Section 7. A pseudo-effective real Cartier divisor $L$ on $X$ restricts to a pseudo-effective divisor on a very general fiber. To see this, choose effective real divisors whose numerical classes converge to $\[ L \]$. After excluding a countable union of proper closed subsets of $Y$, a fiber is contained in none of their supports. Their restrictions are effective, and their numerical classes converge to the class of $L \|_F$. Applying this to $L = m_0 K_X - f^(*) H$ gives

$ K_F in overline("Eff") \( F \) \, #h(2em) kappa \( F \) gt.eq 0 \, $

where the second assertion follows from (4.1). The very general fiber can be chosen to satisfy this restriction property and the plurigenus comparison simultaneously.

=== 4.2 The Campana–Peternell inequality <the-campanapeternell-inequality>

#proof[
  Since $D$ is effective, $kappa \( D \) gt.eq 0$. Also
  $ K_X = 1 / m_0 #scale(x: 120%, y: 120%)[\(] \( m_0 K_X - D \) + D #scale(x: 120%, y: 120%)[\)] in overline("Eff") \( X \) . $
  If $kappa \( D \) = 0$, canonical nonvanishing (4.1) proves the assertion. We may therefore assume $kappa \( D \) > 0$.
  Schnell’s reduction in #cite(label("Schnell2022")) Sections 4–6 first resolves a system $\| n D \|$ whose image has dimension $kappa \( D \)$, then takes its Stein factorization and resolves the base. It produces an algebraic fiber space $f_0 : X_0 arrow.r Y_0$ between smooth connected projective complex varieties, with $X_0$ birational to $X$, an ample Cartier divisor $H_0$ on $Y_0$, and a positive integer $a_0$ such that
  #[#set math.equation(numbering: n => "(4.2)")
   $ dim Y_0 = kappa \( D \) \, #h(2em) a_0 K_(X_0) - f_0^(*) H_0 in overline("Eff") \( X_0 \) . $ <eq:initial-cp-reduction>]
  The effective exceptional terms from resolving $X$ preserve pseudo-effectivity; after resolving the base, Schnell replaces the big and nef pullback of the original ample divisor by a suitable ample divisor. In particular, the output has the precise ample Cartier hypothesis of Theorem 1.
  We recall the finite iteration in #cite(label("Schnell2022")) Sections 7 and 9. Suppose that $f_i : X_i arrow.r Y_i$ is such a fiber space, with ample Cartier $H_i$ and $a_i K_(X_i) - f_i^(*) H_i in overline("Eff") \( X_i \)$ for a positive integer $a_i$. For a very general smooth fiber $F_i$, the preceding restriction and nonvanishing argument gives $kappa \( F_i \) gt.eq 0$. If $kappa \( F_i \) > 0$, the construction in #cite(label("Schnell2022")) Lemma 7.1 chooses positive integers $r_i \, b_i$ and an effective Cartier divisor $L_i$ such that
  $ L_i tilde.op r_i K_(X_i) + f_i^(*) \( b_i H_i \) \, #h(2em) kappa \( L_i \) = kappa \( F_i \) + dim Y_i . $
  The resulting comparison is
  $ \( a_i b_i + r_i \) K_(X_i) - L_i tilde.op b_i \( a_i K_(X_i) - f_i^(*) H_i \) . $
  Its right side is pseudo-effective, so the same is true of its left side, since linear equivalence preserves numerical classes. Applying the divisor-to-fiber-space reduction of Sections 4–6 of Schnell’s paper to $L_i$ gives another algebraic fiber space $f_(i + 1) : X_(i + 1) arrow.r Y_(i + 1)$ of the same smooth projective complex type, with $X_(i + 1)$ birational to $X_i$, an ample Cartier divisor $H_(i + 1)$, and a positive integer $a_(i + 1)$ such that
  $ dim Y_(i + 1) = kappa \( F_i \) + dim Y_i \, #h(2em) a_(i + 1) K_(X_(i + 1)) - f_(i + 1)^(*) H_(i + 1) in overline("Eff") \( X_(i + 1) \) . $
  As long as $kappa \( F_i \) > 0$, the integer $dim Y_i$ strictly increases. It is bounded by $dim X$, so this process reaches an index $j$ with $kappa \( F_j \) = 0$. The geometric generic fiber has Kodaira dimension zero by the comparison above. Theorem 1 applies at this last stage. Birational invariance of Kodaira dimension and (4.2) give
  $ kappa \( X \) = kappa \( X_j \) = dim Y_j gt.eq dim Y_0 = kappa \( D \) . $
  ◻
]

If $D$ is an effective rational divisor instead, choose a positive integer $q$ such that $q D$ is an integral Cartier divisor. Multiplying the numerical hypothesis by $q$ gives $q m_0 K_X - q D in overline("Eff") \( X \)$. Corollary 2 applied to $q D$ gives the same conclusion because $kappa \( q D \) = kappa \( D \)$. This extension still requires an effective divisor; it makes no assertion for an arbitrary pseudo-effective divisor in its place.

=== 4.3 Equality and eventual effectivity for general fibers <equality-and-eventual-effectivity-for-general-fibers>

#proof[
  If $Y$ is a point, then $F = X$ and $H$ is linearly equivalent to zero. The equality is tautological, and the numerical hypothesis gives pseudo-effective $K_X$. A nonzero section supplied by (4.1), together with its powers, gives the asserted sections.
  Assume $dim Y > 0$. The restriction argument above gives $kappa \( F \) gt.eq 0$. As in #cite(label("Schnell2022")) Lemma 7.1, choose positive integers $a \, b$ and an effective Cartier divisor $L$ with
  $ L tilde.op a K_X + f^(*) \( b H \) \, #h(2em) kappa \( L \) = kappa \( F \) + dim Y . $
  The linear equivalence
  $ \( m_0 b + a \) K_X - L tilde.op b \( m_0 K_X - f^(*) H \) $
  shows that its left side is pseudo-effective. Corollary 2, applied to the effective Cartier divisor $L$, gives
  $ kappa \( X \) gt.eq kappa \( L \) = kappa \( F \) + dim Y . $
  The reverse inequality is the easy-addition inequality used in #cite(label("Schnell2022")) Lemma 7.1. This proves the equality.
  To obtain sections after subtracting the original $f^(*) H$, we use the Fujita–Mori criterion recalled in #cite(label("PopaSchnell2014")) Lemma 4.6; this is the criterion behind #cite(label("Schnell2022")) Section 8. Since $kappa \( F \) gt.eq 0$, the equality just proved implies that there are a big Cartier divisor $B$ on $Y$ and a positive integer $u$ with a nonzero section
  $ sigma in H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( u K_X - f^(*) B \) #scale(x: 120%, y: 120%)[\)] . $
  Bigness of $B$ gives a positive integer $v$ and a nonzero section $tau in H^0 \( Y \, cal(O)_Y \( v B - H \) \)$. Thus, with $r = u v$,
  $ s = sigma^v f^(*) tau in H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( r K_X - f^(*) H \) #scale(x: 120%, y: 120%)[\)] $
  is nonzero. This step replaces the big divisor supplied by the criterion with the ample divisor in the original hypothesis.
  Finally, ampleness of $H$ supplies a nonzero section $tau_ell in H^0 \( Y \, cal(O)_Y \( \( ell - 1 \) H \) \)$ for every sufficiently large integer $ell$. The products
  $ s^ell f^(*) tau_ell in H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( ell r K_X - f^(*) H \) #scale(x: 120%, y: 120%)[\)] $
  are nonzero. Choosing $ell_0$ beyond this ampleness threshold proves the asserted conclusion for every integer $ell gt.eq ell_0$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
