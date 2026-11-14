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

#align(center)[#text(size: 16pt, weight: "bold")[The p-adic section conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $p$ be a prime, let $k \/ bb(Q)_p$ be a finite extension,
  and let $X \/ k$ be a smooth proper geometrically connected curve of genus at least two.
  Choose an algebraic closure $macron(k)$ and a geometric base point of $X$.
  The full arithmetic étale fundamental group fits into

#[#set math.equation(numbering: n => "(1.1)")
 $ 1 arrow.r Delta_X arrow.r Pi_X arrow.r G_k arrow.r 1 \, wide Delta_X = pi_1 \( X_(macron(k)) \) \, quad Pi_X =
   pi_1 \( X \) \, quad G_k = "Gal" \( macron(k) \/ k \) . $ <eq:fundamental-sequence>]

A rational point $a in X \( k \)$ induces a continuous group-homomorphic section $s_a : G_k arrow.r Pi_X$.
  Its class under conjugation by $Delta_X$ is independent of the path used to identify base points.
  The local $p$-adic section conjecture asserts that this construction accounts for all sections,
  and distinguishes all rational points.

A section whose class comes from a rational point is called #emph[geometric].
  The conjecture thus asks whether rational points can be recovered from the splittings of the arithmetic
  fundamental group. It is a local analogue of the section conjecture in Grothendieck’s letter to Faltings of 27
  June 1983, formulated over fields finitely generated over the prime field #cite(label("GrothendieckLetter"))
  equation (7) and the subsequent properness correction. The local question retains the full arithmetic and
  geometric groups in (1.1), while bringing the geometry of $p$-adic valuations and reduction into the problem.

#thm([Theorem 1.1.])[
  #emph[For every prime $p$, every finite extension $k \/ bb(Q)_p$,
    and every smooth proper geometrically connected curve $X \/ k$ of genus at least two, the map
$ X \( k \) arrow.r
  mat(delim: "{", s : G_k arrow.r pi_1 \( X \) upright(" a continuous group homomorphism");
  upright("such that ") \( pi_1 \( X \) arrow.r G_k \) compose s = upright("id")_(G_k))
  #scale(x: 120%, y: 120%)[\/] pi_1 \( X_(macron(k)) \) $

 is bijective. The quotient is by conjugation by the full geometric étale fundamental group.]
] <thm:section>

=== 1.1 Earlier results and the lifting problem <earlier-results-and-the-lifting-problem>

The birational analogue replaces the arithmetic étale fundamental group by the absolute Galois group of the
  curve’s function field. For a Galois extension with a chosen valuation,
  the #emph[decomposition group] consists of the automorphisms preserving its valuation ring.
  Koenigsmann proves that every birational section over a finite extension of $bb(Q)_p$ is contained in the
  decomposition group of a rational point #cite(label("Koenigsmann")) preprint version, Proposition 2.4(2).
  Pop subsequently obtains a birational criterion from sections of an elementary abelian quotient that lift to the
  corresponding elementary metabelian quotient #cite(label("PopBirational")) Theorems A and A$'$.
  These results make the passage from an étale section to a birational section a natural objective.
  Such a lift is additional information: a section of the quotient group in (1.1) does not by itself supply a
  splitting of the absolute Galois sequence.

Pop–Stix localize every étale section at a valuation extending the $p$-adic valuation #cite(label("PopStix"))
  preprint version, Theorem 26. This reduces the problem to understanding which valuations can support a section.
  Pajwani develops this valuative approach through étale homotopy and fixed points in Berkovich spaces
  #cite(label("Pajwani")) preprint version, Theorem 1.4 and Corollary 1.5.
  The passage from a fixed valuation to a rational point remains the geometric issue addressed here.

Recent results also constrain the possible nongeometric sections.
  Bresciani introduces toric sections and proves the section conjecture for them;
  they map injectively to the set of étale sections #cite(label("BrescianiToric")) Definition 3.7 and Theorems 1.4
  and 5.10. For an arbitrary nongeometric étale section, his Theorem 1.5 produces a finite étale neighbourhood
  whose index is divisible by $p$. Here a neighbourhood is a connected finite étale cover to which the section
  lifts, and the index of a curve is the greatest common divisor of the degrees of its closed points.
  In a different direction, Betts–Stix prove finiteness of the local image of global Selmer sections for smooth
  proper geometrically connected curves of genus at least two over number fields containing no CM subfield
  #cite(label("BettsStix")) preprint version, Theorem A. Their Selmer sections already arise from points at every
  completion; the finiteness assertion concerns the local images of this globally constrained set of sections.

Our lifting step is a statement about completions of the universal étale function field.
  It compares the absolute and étale decomposition groups at every rank-one valuation extending the $p$-adic norm.
  This supplies the birational lift at precisely the valuations that must be excluded from the Pop–Stix localization.

=== 1.2 The completion statement <the-completion-statement>

Put $K = k \( X \)$ and choose a separable closure $K^(upright("sep"))$ containing $macron(k)$.
  Let $tilde(K) subset K^(upright("sep"))$ be the compositum of the function fields of all connected finite étale
  covers of $X$, with all their $K$-embeddings in $K^(upright("sep"))$.
  Then $"Gal" \( tilde(K) \/ K \) = Pi_X$ after the chosen base point identification.
  A real-valued rank-one norm on $K$ means a nonarchimedean field absolute value with values in $bb(R)_(gt.eq 0)$;
  in particular its support is zero. We normalize an extension of the $p$-adic norm by $\| p \| = p^(- 1)$.

#thm([Theorem 1.2.])[
  #emph[Let $p$ be a prime, let $k \/ bb(Q)_p$ be finite, and let $X \/
    k$ be a smooth proper geometrically connected curve of genus at least two.
    Put $K = k \( X \)$, choose a separable closure $K^(upright("sep"))$,
    and let $tilde(K) subset K^(upright("sep"))$ be the compositum of the function fields of all connected finite
    étale covers of $X$, with all their $K$-embeddings. For every real-valued rank-one norm on $K$ extending the
    normalized $p$-adic norm on $k$, and every prolongation to $K^(upright("sep"))$, set
$ E = hat(K^(upright("sep"))) \, wide H = hat(tilde(K)) subset E \, $

 where the completions use that fixed prolongation. Then the specified subfield $K^(upright("sep"))$ of $E$ is
   contained in $H$.]
] <thm:completion>

The statement concerns the chosen copies of these fields inside one completion.
  Write $D_nu \( L \/ K \)$ for the decomposition group of a valuation $nu$ on a Galois extension $L \/ K$.
  Corollary 14 uses Theorem 2 to identify the decomposition group in $K^(upright("sep")) \/
  K$ with the one in $tilde(K) \/ K$. Indeed, an automorphism in the kernel fixes a dense subfield of $H$ and
  hence fixes $K^(upright("sep"))$.

A section localized at a rank-one valuation therefore lifts to a birational section.
  Koenigsmann’s theorem places this lifted section also at a rational point.
  Its fixed field would then carry two inequivalent henselian rank-one valuations,
  one extending the $p$-adic valuation and the other trivial on constants.
  The contradiction is an explicit instance of the classical two-valuation principle associated with F. K. Schmidt
  #cite(label("SchmidtValuations")); Section 7 gives the needed approximation and square-root argument,
  including $p = 2$.

Rank-two valuations are handled by their rank-one coarsenings.
  The remaining case is a closed-point valuation refined by the $p$-adic valuation on its residue field,
  called type $2 h$ by Pop–Stix. The surjection of the section onto $G_k$ forces that closed point to be rational,
  and their type-$2 h$ analysis then identifies the section #cite(label("PopStix")) preprint version, Section 6.1.
  Section 7 completes this argument and proves injectivity of the point-to-section map by Kummer theory on the Jacobian.

=== 1.3 Two stages of collar roots <two-stages-of-collar-roots>

The geometric content lies in Theorem 2. A finite extension of $macron(k) \( X \)$ is the function field of a
  finite curve cover, which may have branch points. Near such a point, with local coordinate $t$,
  a branch has the form $t = z^e$. If another cover supplies a root of $t$ of order divisible by all these branch
  indices, the pulled-back cover splits over an annulus around the branch point.
  One can then replace the part over the inner disk by a trivial cover and glue to obtain an étale cover.
  The roots must exist on the #emph[entire] inverse image of the annulus:
  a root on only one sheet does not trivialize the full cover needed for gluing.
  We use this operation twice, with different sources of collar roots.

This gluing and algebraization method belongs to the formal and rigid analytic patching tradition of Harbater and
  Liu #cite(label("HarbaterPatching")) #cite(label("LiuPatching")).
  Poineau treats the corresponding Berkovich framework #cite(label("GAGA")) Section 1 and Appendix A.
  Section 3 proves the precise replacement and field-embedding statements used here.
  In particular, evaluating the resulting exterior analytic map retains the specified valued field embedding;
  the map itself need not descend to $macron(k)$.

Fix an odd prime $ell eq.not p$. In the first stage, coordinates on the node annuli of a stable model acquire
  $ell$-th roots on suitable finite étale covers. The construction uses the lifting theorem of
  Amini–Baker–Brugallé–Rabinoff, which realizes tame coverings of metrized complexes as curve covers
  #cite(label("ABBR")) Theorem 7.7. A metrized complex records the skeleton together with the residue curve at
  each vertex and the marked points corresponding to edge ends.
  Small collars around arbitrary branch points need not themselves be stable node annuli.
  The resolution of nonsingularities theorem of Mochizuki–Tsujimura supplies a finite étale cover whose stable
  model maps to a prescribed semistable model #cite(label("MochizukiTsujimura")) Theorem A and
  Proposition 2.4(iv). This extends Tamagawa’s result for closed points on a stable model
  #cite(label("TamagawaRNS")) Theorem 0.2(v) and Lepage’s corresponding resolution theorem for Mumford curves
  #cite(label("LepageRNS")) Theorem 2.7. The general theorem of Mochizuki–Tsujimura allows us to move these
  collars into the stable-node construction. Patching then places in $H$ every finite Galois extension whose
  horizontal ramification indices divide $ell$. Here horizontal indices refer to ramification at closed points
  over $macron(k)$. Section 4 proves this first stage.

The second stage produces roots of arbitrary positive order $m$ while keeping the auxiliary cover’s horizontal
  indices dividing $ell$. We construct a cyclic cover of the projective line whose skeleton has two vertices and
  $ell$ parallel edges. A cycle using two distinct edges gives a character of the torus uniformizing its Jacobian.
  Along a chosen annulus that character has slope one, so it is a constant times the annular coordinate times an
  analytic unit close to one. Figure 1 shows the geometry. This uses the nonarchimedean uniformization theory of
  Raynaud and Bosch–Lütkebohmert #cite(label("RaynaudUniformization")) #cite(label("BoschLutkebohmert")) and the
  compatibility of classical and tropical Abel–Jacobi maps proved by Baker–Rabinoff #cite(label("BakerRabinoff"))
  Proposition 6.1 and Corollary 6.6.

Pullback by multiplication by $m$ on the Jacobian supplies a root of the character on the whole inverse annulus.
  On a sufficiently long middle collar, the remaining unit has an $m$-th root by the $p$-adic logarithm and
  exponential. This yields a root of the coordinate itself.
  The auxiliary covers still have horizontal indices dividing $ell$,
  so the first stage places their function fields in $H$. Section 5 constructs these roots,
  and a second application of patching in Section 6 realizes arbitrary finite Galois extensions in the same
  completion. The common requirement of roots on every inverse-image sheet is what allows both stages to use the
  same patching proposition.

=== 1.4 Global consequences <global-consequences>

The local theorem also identifies the possible localizations of global sections.
  Let $C \/ F$ be a smooth proper geometrically connected curve of genus at least two over a number field.
  A global section determines a point of $C \( F_v \)$ at every finite place by Theorem 1,
  and a connected component of $C \( F_v \)$ at every real place by the real section theorem
  #cite(label("BrescianiVistoliReal")) Introduction, Theorem.
  Together these form a #emph[modified adelic point]; complex places contribute no factor.
  The finite-cover descent locus consists of the tuples that lift to some global twist of each torsor under a
  finite $F$-group scheme. Proposition 16 shows that this locus is exactly the image of global sections under
  localization. Both inclusions use the descent bridge of Harari–Stix #cite(label("HarariStixFiniteDescent"))
  preprint version, Theorem 2.1 and Remark 2.2(1).

When this finite-cover locus consists exactly of the diagonal rational points,
  Stix’s finite-support theorem identifies every global section with a point section
  #cite(label("StixFiniteSupport")) arXiv version, Corollary 5. The resulting bijection is Theorem 17.
  Stoll’s finite-descent criteria supply the required equality when the curve has a nonconstant morphism over its
  number field to an abelian variety with finitely many rational points and trivial divisible Tate–Shafarevich
  subgroup, or when its Jacobian has these properties. They also cover the smooth projective modular curves
  $X_0 \( N \)$ and $X_1 \( N \)$ of genus at least two over $bb(Q)$ #cite(label("StollFiniteDescent"))
  Corollary 8.1, Theorem 8.6, and Corollary 8.8, with the corrections in #cite(label("StollFiniteDescentErrata")).
  The Selmer converse in the companion article #cite(label("OpenAISelmerConverse2026")) Theorem 1.1 gives a
  further arithmetic test for an elliptic target over $bb(Q)$:
  vanishing of its full $p$-power Selmer corank at one prime.
  Section 8 states the precise hypotheses and deductions for these cases.

The localization description also yields constraints without assuming that the finite-cover locus consists of
  rational points. Every ordinary adelic representative of a localization tuple survives linear descent and lies
  in the Brauer–Manin set, by further results of Harari–Stix #cite(label("HarariStixFiniteDescent")) preprint
  version, Corollary 3.1 and Theorem 4.1. If $F$ contains no CM subfield,
  Betts–Stix’s theorem makes the projection of the localization image to $C \( F_v \)$ finite at every finite
  place $v$ #cite(label("BettsStix")) preprint version, Theorem A.
  These statements constrain the localization image; the finite-cover equality remains a separate arithmetic
  hypothesis in the global section-conjecture criterion.

== 2 Fields, analytic points, and horizontal ramification <sec:preliminaries>

Fix the data and the prolonged norm of Theorem 2. All subsequent field inclusions refer to these choices. We have

$ K subset K_0 := macron(k) \( X \) subset tilde(K) subset K^(upright("sep")) subset E \, wide H =
  hat(tilde(K)) subset E . $

The inclusion of the completion $H$ into $E$ is isometric:
  it identifies $H$ with the closure of $tilde(K)$ in $E$. Since $k$ is complete,
  the restriction of the chosen norm to $macron(k)$ is its unique prolongation.
  Thus $Omega := hat(macron(k))$ is a specified subfield of $H$.
  It is algebraically closed and has additive value group $bb(Q)$, with the normalization $v = -
  log_p \| dot.op \|$. The equality of value groups before and after completion follows because every nonzero
  limit has the same norm as sufficiently close approximants.

We use Berkovich analytifications over $Omega$. A field embedding $K_0 arrow.r.hook
  H$ determines a point of $X_(macron(k)) \( H \)$ supported at the generic point of $X_(macron(k))$.
  Together with the specified embedding $Omega arrow.r.hook H$, it determines a point of $X_Omega \( H \)$,
  whose analytic image we denote by $xi$. Its projection to $X_(macron(k))$ is generic;
  its support on $X_Omega$ need not be generic. In particular, $xi$ can be an $Omega$-rational point.
  We retain the whole $H$-valued point, including the embedding of its completed residue field into $H$,
  whenever we use $xi$.

If $F \/ K_0$ is finite, its normalization gives a smooth proper connected curve over $macron(k)$ with a finite
  map to $X_(macron(k))$. We call the ramification indices of this map at closed points #emph[horizontal
  ramification indices]. The corresponding discrete valuations are trivial on $macron(k)$ and have residue
  characteristic zero. These indices are unrelated to possible wild ramification on a characteristic-$p$ reduction
  model.

Fix an odd prime $ell eq.not p$. Inside $K^(upright("sep"))$,
  let $L_ell$ be the compositum of all finite Galois extensions $F \/
  K_0$ whose horizontal ramification indices divide $ell$. The unramified extensions are included.
  In particular $tilde(K) subset L_ell$: the universal étale field over $K_0$ is the same field $tilde(K)$ after
  constants are included. One may see this by descending any finite étale cover of $X_(macron(k))$ to a finite
  extension of $k$ and then composing with the finite étale constant-field cover of $X$.

The field-theoretic goal can be displayed as follows. The top row consists of the defining inclusions;
  the two right vertical arrows are the containments proved in the successive stages.

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$tilde(K)$])
  content((1.863, 0), [$L_ell$])
  content((4.056, 0), [$K^(upright("sep"))$])
  content((0, -0.744), [$H$])
  content((1.863, -0.744), [$H$])
  content((4.056, -0.744), [$H .$])
  line((0.336, 0), (1.461, 0), mark: (end: ">"))
  line((0, -0.2725), (0, -0.4715), mark: (end: ">"))
  line((2.265, 0), (3.39, 0), mark: (end: ">"))
  line((1.863, -0.2725), (1.863, -0.4715), mark: (end: ">"))
  content((2.667, -0.372), [#text(size: 0.73em)[$upright("first stage")$]])
  line((4.056, -0.2725), (4.056, -0.4715), mark: (end: ">"))
  content((4.908, -0.372), [#text(size: 0.73em)[$upright("second stage")$]])
  line((0.336, -0.634), (1.527, -0.634))
  line((0.336, -0.854), (1.527, -0.854))
  line((2.199, -0.634), (3.588, -0.634))
  line((2.199, -0.854), (3.588, -0.854))
})

Every arrow is inside $E$. In particular a constructed abstract field embedding is not enough by itself:
  for a normal extension $F \/ K_0$ we will use normality to identify its image with the specified subfield $F
  subset E$.

We shall also use invariance of finite étale covers of a proper variety under extension of algebraically closed
  fields #cite(label("SGA1")) Exposé X, Corollary 1.8. Thus a finite étale cover of $Y_Omega$,
  for a smooth proper curve $Y \/ macron(k)$, descends up to isomorphism to a cover of $Y$.
  The analytic maps built on smaller open regions need not descend.
  Their evaluation at the fixed $H$-valued point will be sufficient.

== 3 Replacing branch disks by trivial covers <sec:patching>

We first isolate the analytic operation used in both stages of the proof.
  It replaces a branched cover by an étale cover after another cover supplies roots of the boundary coordinates.
  The roots must exist over the entire inverse image of each boundary annulus.
  The resulting analytic map is needed only outside the branch disks.
  This is an application of the patching method for covers developed in formal geometry by Harbater,
  in rigid geometry by Liu, and in the Berkovich setting by Poineau #cite(label("HarbaterPatching"))
  #cite(label("LiuPatching")) #cite(label("GAGA")). Here the root on every inverse collar supplies the
  trivialization needed to replace the whole branched cover over a disk, including all of its sheets.

#thm([Lemma 3.1.])[
  #emph[Let $f : C arrow.r X_(macron(k))$ be a finite surjective morphism of smooth proper connected curves,
    and let $b in X \( macron(k) \)$. Fix a rational function $t_b$ which is a local parameter at $b$.
    There is an open disk $B_b$ about $b$ in $X_Omega^(upright("an"))$, with coordinate $t_b$,
    such that its full inverse image in $C_Omega^(upright("an"))$ is a disjoint union of open disks.
    On the disk about $c in f^(- 1) \( b \)$ there is a coordinate $z_c$ for which
$ t_b = z_c^(e_c) \, $

 where $e_c$ is the ramification index at $c$. No condition that $e_c$ be prime to $p$ is required.
   For finitely many distinct points $b$, the disks can be chosen disjoint and disjoint from the fixed point $xi$.]
] <lem:local-normal-form>

#proof[
  Choose a local analytic parameter $u$ at $c$. The pullback of $t_b$ is $u^(e_c) a \( u \)$ with $a \( 0 \)
    eq.not 0$. After choosing an $e_c$-th root of $a \( 0 \)$ in $Omega$ and shrinking the disk,
    $a \( u \) \/ a \( 0 \)$ is sufficiently close to $1$ for its $e_c$-th root to be given by
  $ exp #h(-0.16667em) (e_c^(- 1) log \( a \( u \) \/ a \( 0 \) \)) . $
  Here it is enough to make the valuation of $a \( u \) \/ a \( 0 \) - 1$ greater than $v_p \( e_c \) +
    1 \/ \( p - 1 \)$. Thus $z_c = u thin a \( u \)^(1 \/ e_c)$ is analytic with a nonzero derivative at the
    center. Analytic inversion gives a smaller disk on which it is a coordinate and $t_b = z_c^(e_c)$.
  Do this in disjoint neighborhoods of all the finitely many points above $b$.
    The complement of these neighborhoods in the proper analytic curve $C_Omega^(upright("an"))$ is compact.
    Its image under $f$ is compact, closed, and does not contain $b$.
    Consequently a sufficiently small disk about $b$ has its entire inverse image in the chosen neighborhoods.
    Shrink it once more so that, in every $z_c$-chart, that inverse image is the disk defined by the corresponding
    bound on $\| z_c \|^(e_c)$.
  The point $xi$ does not equal any point of $X \( macron(k) \)$,
    since its projection to $X_(macron(k))$ is generic. The shrinking disks at $b$ form a neighborhood basis
    there. Hausdorffness therefore permits all disks to avoid $xi$ and one another.
    We may choose their radii in $\| Omega^times \|$. The argument also applies when $xi$ is an $Omega$-rational
    point whose projection to $X_(macron(k))$ is generic. ◻
]

#thm([Proposition 3.2.])[
  #emph[Let $f : C arrow.r X_(macron(k))$ be as in Lemma 3, of degree $d$, with branch set $B$.
    Choose pairwise disjoint disks $B_b$ as in that lemma. For each $b in B$,
    let $m_b$ be a positive multiple of all ramification indices above $b$.
    Suppose that $g : Y arrow.r X_Omega$ is a finite surjective morphism from a smooth proper connected curve and
    that there are radii $0 < r_b < R_b$ in $\| Omega^times \|$, strictly inside $B_b$,
    such that $g^(*) t_b$ has an analytic $m_b$-th root on the whole inverse image of
$ A_b = { r_b < \| t_b \| < R_b } . $

 Set
$ U = X_Omega^(upright("an")) \\ union.big_(b in B) { \| t_b \| lt.eq r_b } \, $

 where each indicated closed disk is taken inside $B_b$. Then there is a smooth proper connected curve $V_Omega$
   and a finite étale surjective map $V_Omega arrow.r Y$, together with an analytic map
$ \( V_Omega^(upright("an")) \) \|_U arrow.r C_Omega^(upright("an")) quad upright("over ") X_Omega^(upright("an")) . $

 The notation on the left denotes the inverse image of $U$ under the composite map to $X_Omega^(upright("an"))$.]
] <prop:patching>

#proof[
  The inverse image $Y_U$ of $U$ and the inverse images $Y_b$ of the disks ${ \| t_b \| <
    R_b }$ form an open cover of $Y^(upright("an"))$. Distinct $Y_b$ are disjoint, and $Y_U ∩ Y_b = g^(- 1) \( A_b \)$.
  On $Y_U$, take the pullback of $C_Omega^(upright("an")) arrow.r X_Omega^(upright("an"))$.
    It is finite étale of degree $d$, since $U$ contains no branch point.
    On each $Y_b$, take the trivial degree-$d$ cover. These two covers are isomorphic over their overlap.
    Indeed, write $q_b^(m_b) = g^(*) t_b$ for the assumed analytic root.
    In the local factor corresponding to $c in f^(- 1) \( b \)$, put $a_c = q_b^(m_b \/ e_c)$.
    The polynomial defining that factor splits as
  $ Z^(e_c) - g^(*) t_b = product_(zeta in mu_(e_c)) \( Z - zeta a_c \) . $
  Each $a_c$ is an analytic unit on the overlap. Distinct linear factors are comaximal,
    because $\( zeta - zeta' \) a_c$ is a unit. This is true also when $p divides e_c$:
    a nonzero constant in $Omega$ is invertible, regardless of its absolute value.
    Taking all factors in Lemma 3 gives a trivialization of the full degree-$d$ cover, not just of one sheet.
  Choose these trivializations and glue the finite locally free analytic algebras.
    There is no further cocycle condition between different branch disks, as those disks are disjoint.
    The glued algebra is coherent and finite étale over $Y^(upright("an"))$, these being local properties.
    Proper analytic GAGA #cite(label("GAGA")) Appendix A, Theorem A.1(ii) algebraizes the coherent algebra and its
    unit and multiplication; full faithfulness preserves the algebra identities.
    Equivalently, one uses the corresponding equivalence for finite covers of a proper curve.
    Étaleness is detected after analytification #cite(label("TemkinAnalytic")) Fact 5.1.5,
    so its relative spectrum is a finite étale cover of $Y$.
  Choose any nonempty connected component and call it $V_Omega$.
    A connected component of this finite étale cover has positive locally constant degree over the connected curve
    $Y$, hence is still surjective. It is smooth and proper. Restricting the original projection from the pullback
    over $Y_U$ gives the asserted analytic map. If $B$ is empty,
    the whole pullback is already finite étale and the same component argument applies without gluing. ◻
]

We record explicitly how this analytic map produces an embedding into the fixed completion $H$.
  This step concerns the entire $H$-valued point, not just its underlying analytic point.

#thm([Lemma 3.3.])[
  #emph[In Proposition 4, suppose that the composite $V_Omega arrow.r X_Omega$ is isomorphic, over $X_Omega$,
    to the base change of a finite morphism $V arrow.r X_(macron(k))$ from a smooth proper connected curve,
    and assume that $xi in U$. If $macron(k) \( V \)$ admits a $K_0$-embedding into $H$,
    then $macron(k) \( C \)$ admits a $K_0$-embedding into $H$.]
] <lem:point-transfer>

#proof[
  The given embedding determines an $H$-valued point of $V$.
    Together with the fixed inclusion $Omega subset H$, it determines an $H$-valued point of $V times_(macron(k))
    Omega$, and the chosen isomorphism transports this point to $V_Omega$.
    Its image in $X_Omega \( H \)$ is exactly the fixed point induced by $K_0 arrow.r.hook H$ and $Omega
    arrow.r.hook H$. In particular its underlying analytic image is $xi in U$.
  An $H$-valued point of an algebraic variety over $Omega$ is equivalently an $H$-valued point of its
    analytification #cite(label("TemkinAnalytic")) Fact 5.1.3.
    More explicitly, it gives an analytic point $v$ together with an isometric embedding of the completed residue
    field $cal(H) \( v \)$ into $H$. The analytic map over $U$ in Proposition 4 induces a compatible map on
    completed residue fields, and hence an $H$-valued point of $C_Omega$ over the same point of $X_Omega \( H \)$.
    Project this point to $C$. Its image on $X_(macron(k))$ is the generic point with the specified map $K_0
    arrow.r H$. Since $C arrow.r X_(macron(k))$ is finite, its support on $C$ is also generic.
    The point therefore induces the required field embedding $macron(k) \( C \) arrow.r.hook H$ over $K_0$.
  Neither the analytic map over $U$ nor a chosen local trivialization has been asserted to descend to $macron(k)$. ◻
]

We shall form auxiliary covers by pullback and compositum, then pass to a finite étale upper cover.
  The following lemma shows that these operations preserve the bound on horizontal ramification needed for
  membership in $L_ell$.

#thm([Lemma 3.4.])[
  #emph[Fix a positive integer $n$. Among finite extensions of $K_0$,
    the condition that every ramification index at a closed point of $X_(macron(k))$ divide $n$ is preserved by
    taking subextensions, finite composita, and Galois closures.
    It is also preserved by normalized pullback along a finite morphism of smooth proper curves and by composition
    on top with a finite étale cover. Consequently every finite cover of $X_(macron(k))$ with indices dividing
    $ell$ has a $K_0$-embedding of its function field into $L_ell$.]
] <lem:horizontal-closure>

#proof[
  All valuations in this statement are the horizontal, discrete closed-point valuations,
    which are trivial on $macron(k)$. Their residue characteristic is zero.
    The completed base field at such a point is $A = macron(k) \( \( t \) \)$.
    Every finite extension of $A$ has residue field $macron(k)$ and is of the form $macron(k) \( \( u \) \)$ for a
    uniformizer $u$: successive subtraction of residue representatives gives the power-series expansion in its
    complete valuation ring. If its ramification index is $e$, then $t =
    u^e a \( u \)$ for a unit $a \( u \) in macron(k) \[ \[ u \] \]^times$.
    The unit has an $e$-th root in $macron(k) \[ \[ u \] \]$, by Hensel’s lemma in residue characteristic zero.
    Changing the parameter gives $t = z^e$. Thus, inside a fixed algebraic closure,
    the local field is $A \( t^(1 \/ e) \)$, which is cyclic over $A$ since $macron(k)$ contains all roots of unity.
  For $e divides n$, this is a subfield of $A \( t^(1 \/ n) \)$.
    All local factors of a finite compositum, or of a normal closure formed from conjugates,
    therefore remain subfields of this same cyclic extension.
    This proves the assertions about subextensions, composita, and Galois closures.
  For pullback, write the local base map as $t = s^r a \( s \)$, where $r gt.eq 1$ and $a \( s \)$ is a unit.
    Extracting its $e$-th root in $macron(k) \[ \[ s \] \]$ shows that every normalized local factor after
    pullback has ramification index $e \/ gcd \( e \, r \)$, which divides $e$.
    Finally, ramification indices multiply in a tower, and an étale upper cover contributes index $1$.
    Apply the Galois-closure assertion to a cover with indices dividing $ell$ and embed that closure into the
    fixed $K^(upright("sep"))$. Its field lies in the defining compositum $L_ell$. ◻
]

#prodef([Remark 3.5.])[
  Lemma 6 makes no assertion about tame reduction in residue characteristic $p$,
    nor about composing two arbitrarily ramified covers. Its last assertion about composition requires the upper
    cover to be étale.
]

== 4 Prime-to-$p$ roots from stable reduction <sec:tame-roots>

We first treat the extensions whose horizontal ramification indices divide the fixed prime $ell eq.not p$.
  The patching construction reduces this task to extracting $ell$-th roots of coordinates on collars around the
  branch points. We shall find these roots in finite étale covers of $X_Omega$. There are two steps:
  extract roots on stable node annuli, and use resolution of nonsingularities to reach such annuli from arbitrary
  small disks.

=== 4.1 Units and roots on node annuli <units-and-roots-on-node-annuli>

We use the following elementary analytic fact. The exponent in its factorization is the slope of the additive
  valuation of the unit along the annulus skeleton. The unit factorization is the standard annular factorization;
  compare #cite(label("BakerPayneRabinoff")) Proposition 2.2(1).
  We give the argument on the entire open annulus, since this is the domain required for gluing.

#thm([Lemma 4.1.])[
  (Units on disks and annuli).  #emph[An analytic unit on an open disk over $Omega$ has constant absolute value in
    $\| Omega^times \|$. If $A = { r < \| S \| < R }$ is an open annulus and $u in cal(O) \( A \)^times$, then
$ u = c S^d \( 1 + h \) \, wide c in Omega^times \, quad d in bb(Z) \, quad h in cal(O) \( A \) \,
  quad \| h \( x \) \| < 1 quad \( x in A \) \, $

 where $c S^d$ is a term of the Laurent expansion of $u$. The function $1 +
   h$ has an analytic $ell$-th root on $A$. Consequently, on any analytic cover of $A$ on which $S$ has an
   $ell$-th root, so does $u$.]
] <lem:annular-unit>

#proof[
  On a circle $\| S \| = rho$ of radius $rho in \| Omega^times \|$, the Laurent Gauss norm is multiplicative.
    Normalize $u$ and its inverse to have norm one. Their reductions are inverse units in
    $tilde(Omega) \[ s \, s^(- 1) \]$, so the reduction of $u$ is a monomial.
    Thus exactly one Laurent term dominates at that radius. Its exponent cannot change inside the radius interval.
    Indeed, convergence on compact subannuli reduces any proposed change to finitely many competing terms;
    a tie between two terms occurs at a radius in $\| Omega^times \|$, since the additive value group is $bb(Q)$.
    Such a tie contradicts the preceding reduction argument. A single term $c
    S^d$ therefore dominates throughout $A$, giving the asserted factorization.
    The same argument on closed subdisks uses that the only units in $tilde(Omega) \[ s \]$ are constants and
    proves the disk assertion. Its constant norm belongs to $\|
    Omega^times \|$ by evaluation at a rational point of the disk.
  Since $ell$ is a unit in the valuation ring, the binomial series for $\( 1 + h \)^(1 \/ ell)$ converges on every
    compact subannulus; the resulting functions agree on overlaps.
    A root of $c$ lies in $Omega$, and a root of $S^d$ follows from a root of $S$, also when $d < 0$. ◻
]

Recall the data attached to a split stable model of a proper curve. Its skeleton is a finite metric graph.
  Each vertex carries the smooth normalization of the corresponding special-fibre component,
  with one marked point for each incident edge end. A loop has two distinct marks on the same normalization.
  The tube of a node is an open annulus, and the tube of a smooth special-fibre point is an open disk.
  The graph with these marked residue curves is its #emph[metrized complex]. Stability means

$ 2 g \( v \) - 2 + "val" \( v \) > 0 $

at each vertex $v$, where $g \( v \)$ is the genus of its residue curve.

#thm([Lemma 4.2.])[
  (Roots on stable node annuli).  #emph[Let $C \/ Omega$ be a smooth proper connected curve of genus at least two,
    equipped with its stable skeleton. Let $A$ be a node annulus and $S$ an annular coordinate on $A$.
    There is a connected finite étale cover $C' arrow.r C$ such that $S$ has an analytic $ell$-th root on the
    entire inverse image of $A$. A single such cover can be chosen for any finite collection of node annuli.]
] <lem:stable-edge-root>

#proof[
  Our aim is to make the expansion factors, the absolute values of the integral slopes along edges,
    divisible by $ell$ above the chosen edge. On an inverse annulus this makes the Laurent exponent of the
    pulled-back coordinate divisible by $ell$; its constant factor and the factor $1 +
    h$ also have $ell$-th roots by Lemma 8. We construct such a cover directly when the edge lies on a circuit.
    For a separating edge, we first pass to an unramified cover in which every edge above it lies on a circuit.
  We use the lifting theorem for tame coverings of metrized complexes #cite(label("ABBR")) Theorem 7.7.
    A covering to which it applies consists of finite residue-curve maps and a finite harmonic graph map:
    every fibre of every marked point is represented by edge ends,
    their ramification indices equal the edge expansion factors,
    and the component degree is the sum of these factors over each base direction.
    The residue maps must be tamely ramified, and the augmented graph ramification must vanish away from punctures
    #cite(label("ABBR")) Definitions 2.19 and 2.21. We shall use no punctures.
    The lift is then finite étale, and has exactly the prescribed inverse images of the vertex set and skeleton
    #cite(label("ABBR")) Definitions 4.25 and 4.31.
  First suppose that the edge $e$ corresponding to $A$ is nonseparating. Choose a simple circuit containing $e$.
    At each vertex on this circuit, let $P \, Q$ be the two circuit marks on its residue curve $D$.
    Divisibility of $"Pic"^0 \( D \)$ #cite(label("MilneAV")) Theorem 8.2 supplies a degree-zero divisor $E$ such
    that $P - Q + ell E$ is principal. Extract an $ell$-th root of a function with this divisor and take the
    smooth normalization. The resulting cyclic cover of $D$ has degree $ell$,
    is connected because the order at $P$ is prime to $ell$, and is totally ramified at $P \, Q$ and nowhere else.
    Each other marked point has $ell$ distinct preimages. At every vertex outside the circuit take $ell$ identity
    copies of its residue curve.
  Above each circuit edge use one edge of expansion factor $ell$ and of length equal to the original length
    divided by $ell$. Above each remaining edge use $ell$ factor-one edges,
    matching all the unramified marked fibres at its ends. These rules also handle loops and chords between
    circuit vertices. All lengths belong to $bb(Q)$. At a lifted circuit vertex each base direction has total
    degree $ell$; at an identity-copy vertex it has total degree one. The local Riemann–Hurwitz formula is
  $ 2 g \( D' \) - 2 = ell #scale(x: 120%, y: 120%)[\(] 2 g \( D \) - 2 #scale(x: 120%, y: 120%)[\)] +
    2 \( ell - 1 \) . $
  The two extra terms are precisely those recorded by the two circuit edges.
    Thus the augmented graph ramification is zero at every vertex; the identity copies contribute none.
    All ramification indices are prime to $p$. The resulting tame covering is connected,
    because each vertex outside the circuit can be joined by a lifted path to a circuit vertex.
  Lift these data by the cited theorem. The inverse image of $A$ is exactly the disjoint union of the node annuli
    above $e$. For completeness, the inverse-skeleton equality excludes off-skeleton points mapping to the
    skeleton. Each off-skeleton open ball therefore maps into a single off-skeleton ball downstairs,
    and continuity identifies the images of their attachment points.
    Retractions commute on these balls as well as on the skeleton.
    Since a node annulus is the inverse image of its open edge under retraction,
    this proves the asserted equality for the whole annulus. On each annulus above $A$,
    the pullback of $S$ has exponent $ell$ or $- ell$ in Lemma 8.
    It therefore has an analytic $ell$-th root on each of these disjoint annuli.
  Now suppose that $e$ is separating. Each side of the graph obtained by cutting its interior contains a circuit
    or a positive-genus vertex. Otherwise that side would be a genus-zero tree with, say, $N$ vertices.
    Its total valence, including the bridge half-edge, would be $2 N - 1$, contrary to stability,
    which requires at least $3 N$.
  Construct a connected unramified degree-$ell$ covering of each side,
    retaining its boundary mark for the eventual gluing. If the side contains a circuit,
    take a connected cyclic graph covering of degree $ell$, with identity residue-curve maps.
    Such a graph covering is obtained by a homomorphism of its graph fundamental group onto $bb(Z) \/ ell bb(Z)$.
    If instead a positive-genus vertex is used, take a connected cyclic étale cover of degree $ell$ of its residue
    curve, provided by a nonzero element of its Jacobian’s $ell$-torsion #cite(label("MilneAV")) Theorem 8.2 and
    Remark 8.4. Explicitly, for a line bundle $L$ of exact order $ell$,
    a trivialization $L^(⊗ ell) tilde.eq cal(O)$ makes $xor.big_(j = 0)^(ell - 1)
    L^(⊗ j)$ an algebra whose relative spectrum is a cyclic étale cover:
    $ell$ is invertible, and the exact order of $L$ makes the cover connected.
    Use $ell$ identity copies at the other vertices and match all marked fibres.
    Paths to the distinguished vertex show connectedness of the covered side.
  Each covered side has $ell$ preimages of the bridge mark.
    Match them in pairs to obtain $ell$ distinct bridge edges, all with factor one.
    Every such edge is now nonseparating: after removing one of them,
    the two connected covered sides are still joined by the others.
    The resulting covering of the original metrized complex is tame.
    Indeed the component covers are unramified, all factors are one,
    and Riemann–Hurwitz again gives zero graph ramification. Lift it to a finite étale curve cover.
    Its triangulation remains stable: at a vertex of local degree $d$, the quantity $2 g' - 2 +
    "val" \( v' \)$ is $d \( 2 g - 2 + "val" \( v \) \) > 0$.
  Apply the nonseparating construction to each of these $ell$ edges.
    A connected component of the fibre product of the resulting finite étale covers dominates each factor,
    so all the constructed roots persist on a common cover. On each factor-one annulus the pullback of the
    original $S$ is a unit; Lemma 8 supplies its root once the new annular coordinate has a root.
    This proves the assertion also for separating edges. Finally,
    the same finite fibre-product argument treats finitely many original annuli simultaneously. ◻
]

=== 4.2 Moving disk collars into the stable skeleton <moving-disk-collars-into-the-stable-skeleton>

The stable-edge lemma does not apply directly to a small disk around a branch point:
  nodes introduced there by blowups need not survive stabilization.
  Resolution of nonsingularities supplies an étale cover whose stable model maps to the chosen model with those
  nodes. The next argument requires only that model morphism.

#thm([Lemma 4.3.])[
  (Étale covers with roots on collars).  #emph[Let $C \/ macron(k)$ be a smooth proper connected curve of genus at
    least two. Let $b_1 \, dots.h \, b_s in C \( macron(k) \)$ be distinct,
    and let $B_i$ be pairwise disjoint sufficiently small coordinate disks in $C_Omega^(upright("an"))$ about
    $b_i$, with coordinates $t_i$ defined over $macron(k)$ and vanishing simply at $b_i$.
    There is a connected finite étale cover $Y arrow.r C_Omega$ and concentric open collars
$ A'_i = { r_i < \| t_i \| < R_i } subset B_i \, wide r_i \, R_i in \| Omega^times \| \, quad 0 < r_i < R_i \, $

 such that $t_i$ has an analytic $ell$-th root on the entire inverse image of $A'_i$ in $Y^(upright("an"))$.]
] <lem:etale-collars>

#proof[
  All algebraic data descend to a finite extension of $k$. After a further finite extension,
    choose a split semistable model with the $b_i$ as disjoint smooth sections.
    Shrinking the coordinate disks causes no problem, since the desired collars need only lie inside the
    originally specified disks. In an integral local parameter $u_i$ at a section,
    successive blowups at its reductions introduce node annuli
  $ \| pi \|^(j + 1) < \| u_i \| < \| pi \|^j . $
  On a sufficiently small disk the quotient $t_i \/ u_i$ is an analytic unit,
    since both coordinates have a simple zero at $b_i$. Its absolute value is constant by Lemma 8.
    Thus these annuli are also concentric annuli for $t_i$, and choosing $j$ large puts them inside $B_i$.
    Perform these modifications for all the sections and denote the resulting proper semistable model by $cal(C)$.
    It need not be stable; the markings can now be forgotten.
  The RNS theorem, applied with the set of all primes, and its model-domination consequence
    #cite(label("MochizukiTsujimura")) Theorem A and Proposition 2.4(iv) give,
    after finite extension of the ground field, a finite étale cover whose stable model maps to $cal(C)$.
    Pass to split reduction and a geometric connected component, and write
  $ f : Y_0 arrow.r C_Omega \, wide cal(Y)_0 arrow.r cal(C) $
  for the analytic-base-changed curve cover and the model morphism.
    No finiteness assertion about the model morphism is needed.
  Fix one of the target node annuli $A_i subset B_i$ just constructed,
    and choose an irrational real number $a$ strictly between its two additive endpoint valuations.
    Consider the entire inverse image
  $ f^(- 1) #scale(x: 120%, y: 120%)[\(] { x in A_i : - log_p \| t_i \( x \) \| = a } #scale(x: 120%, y: 120%)[\)] . $
  Reduction is compatible with the model morphism. A point reducing to a component generic point of $cal(Y)_0$ is
    a model vertex, hence is type 2 and gives $t_i$ a value in $\| Omega^times \|$;
    its additive valuation is rational. It cannot lie above this level.
    A point reducing to a smooth closed point lies in an open disk tube.
    If it lies above the chosen level, that smooth point maps to the target node,
    so the entire disk tube maps into $A_i$. The pullback of $t_i$ is a unit there.
    By Lemma 8 its norm is constant and belongs to $\| Omega^times \|$, which again excludes the irrational level.
    All remaining points above the level lie in source node annuli whose nodes map to the target node.
  Let $N_i$ be the union of all source node annuli whose nodes map to the target node defining $A_i$;
    this is a finite union. The complement of $N_i$ in the proper analytic curve $Y_0^(upright("an"))$ is compact.
    Intersect it with the inverse image of a closed concentric subannulus of $A_i$ containing the chosen level in
    its interior. On this compact intersection the continuous real function $-
    log_p \| t_i \|$ has compact image avoiding $a$. Consequently there is an open interval about $a$ with
    rational endpoints whose entire inverse image lies in $N_i$. It determines a collar $A'_i subset A_i$.
  Every source node annulus in $N_i$ maps into $A_i$ by reduction compatibility,
    so the pullback of $t_i$ is an analytic unit on it. Apply Lemma 9 simultaneously to all these source annuli,
    for all $i$. Their coordinates acquire $ell$-th roots on a common connected finite étale cover of $Y_0$.
    Lemma 8 then gives roots of the pullbacks of the $t_i$ on the full inverse images of the $A'_i$.
    The resulting composite cover of $C_Omega$ is finite étale. ◻
]

#thm([Proposition 4.4.])[
  (The first stage).  #emph[The field $L_ell$ is contained in $H$.]
] <prop:first-stage>

#proof[
  Let $F \/ K_0$ be a finite Galois extension whose horizontal ramification indices divide $ell$,
    and let $C arrow.r X_(macron(k))$ be its smooth proper curve cover.
    If it is unramified, its function field is already contained in $tilde(K)$.
    Otherwise take disjoint branch-point disks avoiding $xi$, small enough for Lemma 3.
    Lemma 10, applied on $X_(macron(k))$, supplies a finite étale $Y arrow.r
    X_Omega$ and collars on whose full inverse images the branch coordinates have $ell$-th roots.
  Apply Proposition 4 with these roots. It gives a connected finite étale cover $V_Omega arrow.r
    Y$ and an analytic map to $C_Omega$ over the exterior of the smaller branch disks.
    The composite $V_Omega arrow.r X_Omega$ is finite étale. Proper base-extension invariance of finite étale
    covers descends it, up to isomorphism over $X_Omega$, to a cover $V arrow.r X_(macron(k))$.
    Here we use #cite(label("SGA1")) Exposé X, Corollary 1.8.
    Its function field has a $K_0$-embedding into $tilde(K) subset H$.
    Lemma 5 therefore yields a $K_0$-embedding $F arrow.r.hook H$ at the fixed $H$-valued point above $xi$.
    Since $F \/ K_0$ is normal and both fields lie in $E$, this says $F subset H$ for the chosen copy of $F$.
    Taking their compositum proves the proposition. ◻
]

== 5 Arbitrary roots on a collar <sec:arbitrary-roots>

The first stage used roots of order $ell$, a prime different from $p$.
  To treat arbitrary ramification, we now construct an auxiliary branched cover on which a coordinate has a root
  of any prescribed positive order. Its own horizontal ramification indices still divide $ell$.
  The construction uses a curve whose stable skeleton has parallel edges and multiplication on its Jacobian.
  Throughout this section, $v = - log_p \| dot.op \|$.

We first isolate the step that must work on every sheet. For an analytic map with a specified lift to a
  uniformizing torus, pullback by multiplication by $m$ extracts $m$-th roots of the lift’s character values.
  The period lattice controls how local roots glue.

#thm([Lemma 5.1.])[
  (Roots after division on a totally degenerate abelian variety).  #emph[Let $J$ be an abelian variety over
    $Omega$ with analytic uniformization $q : bb(T)^(upright("an")) arrow.r J^(upright("an"))$,
    where $bb(T)$ is a split torus and the kernel $Lambda subset
    bb(T) \( Omega \)$ is a free lattice acting by translation.
    Suppose $q$ is a topological covering and a local analytic isomorphism.
    Let $A$ be an analytic space, let $a : A arrow.r bb(T)^(upright("an"))$ be analytic, and let $m gt.eq
    1$ be an integer. Set
$ B = A times_(q compose a \, J^(upright("an")) \, \[ m \]) J^(upright("an")) . $

 For every character $chi$ of $bb(T)$, the pullback of $chi compose a$ to $B$ has an analytic $m$-th root.]
] <lem:division-roots>

#proof[
  Let $pi : B arrow.r A$ and $b : B arrow.r J^(upright("an"))$ be the projections, and write $a_B = a compose pi$.
    Locally on $B$, lift $b$ to an analytic map $t$ to $bb(T)^(upright("an"))$.
    The identity $\[ m \] b = q compose a_B$ says that $t^m \/ a_B$ takes values in $Lambda$.
    This is a locally constant function because $Lambda$ is discrete.
    Its image in $Lambda \/ Lambda^m$ is independent of the local lift:
    replacing $t$ by $t rho$ changes $t^m \/ a_B$ by $rho^m$, for $rho in Lambda$.
    We therefore obtain an analytic-domain decomposition into finitely many clopen subsets $B_(macron(lambda))$,
    indexed by $Lambda \/ Lambda^m$.
  Choose a representative $lambda in Lambda$ for each coset.
    On $B_(macron(lambda))$, adjust each local lift by a locally constant period so that $t^m = lambda a_B$.
    Two adjusted lifts on an overlap differ by a period $rho$ with $rho^m = 1$.
    The lattice $Lambda$ is torsion free, so $rho = 1$. Thus the adjusted lifts glue to a single analytic map
    $t_(macron(lambda)) : B_(macron(lambda)) arrow.r bb(T)^(upright("an"))$.
    Choose $d_lambda in Omega^times$ with $d_lambda^m = chi \( lambda \)$.
    The function $chi \( t_(macron(lambda)) \) \/ d_lambda$ is an $m$-th root of $chi \( a_B \)$.
    These functions glue across the disjoint clopen subsets. No assumption that $m$ is prime to $p$ is used. ◻
]

To obtain a root of an annular coordinate from the preceding lemma,
  we arrange that the pullback of a torus character has slope one.
  It then differs from the coordinate by a constant and an analytic unit close to one.
  Division on the Jacobian supplies a root of the character on the whole inverse annulus;
  a sufficiently long annulus leaves room for a middle collar on which the remaining unit also admits a root.

#thm([Proposition 5.2.])[
  (An auxiliary branched cover).  #emph[Let $m gt.eq 1$ be an integer, choose an integer
$ D > v_p \( m \) + frac(1, p - 1) \, $

 and let $alpha in overline(k)^times$ satisfy $a = v \( alpha \) > 2 D$.
   There is a smooth, proper, connected curve $Q \/ overline(k)$ and a finite map $Q arrow.r
   bb(P)_(overline(k))^1$ whose ramification indices divide $ell$,
   such that the pullback of the coordinate $T$ has an analytic $m$-th root on the entire inverse image,
   over $Omega$, of
$ A^compose = { D < v \( T \) < a - D } . $

]
] <prop:arbitrary-roots>

#proof[
  Let $Z$ be the smooth projective normalization of
  $ y^ell = frac(T \( T - 1 \), T - alpha) . $
  The four distinct points $0 \, alpha \, 1 \, oo$ have orders $1 \, - 1 \, 1 \, -
    1$ in the divisor of the displayed rational function. The cyclic cover is connected, has degree $ell$,
    and is totally ramified at precisely these points. Riemann–Hurwitz gives
  $ 2 g \( Z \) - 2 = - 2 ell + 4 \( ell - 1 \) \, wide g \( Z \) = ell - 1 . $
  Here is a split semistable model of $Z$. Work first over the integers of a sufficiently large finite extension
    of $k$ containing $alpha$. The blowup of the model of the line along $\( T \, alpha \)$ has two rational
    components and one node, with local equation $T U = alpha$.
    The inner component has coordinate $S = T \/ alpha$; the four branch sections are disjoint and smooth.
    The Kummer function reduces to $T - 1$ on the outer component and to $-
    S \/ \( S - 1 \)$ on the inner component. Each of these degree-$ell$ covers of a rational component has just
    two totally ramified points and is rational. Near the node the Kummer function is
  $ frac(T - 1, 1 - U) \, $
  a unit whose reduction at the node is $- 1$. Since $ell$ is invertible, normalization is étale there,
    with $ell$ split copies of the node after enlarging the finite constant field.
    Away from the node and branch sections the same unit criterion gives étaleness.
    At a branch section the function or its inverse is a simple relative parameter,
    so the normalization is smooth there. Thus there are exactly two rational components, joined by $ell$ nodes,
    each of thickness $v \( alpha \) = a$. They are stable because $ell gt.eq 3$.
  Consequently the skeleton $Gamma$ consists of two vertices and $ell$ parallel edges $e_1 \, dots.h \, e_ell$,
    each of length $a$. The node annuli $A_j$ are disjoint copies of ${ \| alpha \| < \| T \| <
    1 }$ with coordinate $T$. This last assertion can also be checked directly:
    on that annulus both $T$ and $alpha \/ T$ have absolute value less than one,
    and the two factors in $- \( 1 - T \) \/ \( 1 - alpha \/ T \)$ have convergent $ell$-th roots.
    Hence the inverse image is exactly $ell$ copies of the annulus.
  We next apply nonarchimedean uniformization of abelian varieties,
    developed by Raynaud and Bosch–Lütkebohmert #cite(label("RaynaudUniformization"))
    #cite(label("BoschLutkebohmert")) #cite(label("BoschUniformization")).
    Let $J$ be the Jacobian of $Z$, and choose an Abel–Jacobi map $i : Z arrow.r
    J$ using a point over $overline(k)$. Total degeneration gives a toric analytic uniformization
  $ q : bb(T)^(upright("an")) arrow.r J_Omega^(upright("an")) \, wide ker \( q \) = Lambda subset bb(T) \( Omega \) . $
  Its character lattice is $M = H_1 \( Gamma \, bb(Z) \)$; its tropical target is $"Hom" \( M \, bb(R) \)$.
    The period lattice is free, and $q$ is a topological covering and local analytic isomorphism.
    These are the Jacobian uniformization conventions of #cite(label("BakerRabinoff")) Sections 4.1–4.2 and 4.5.2.
    The compatibility of the classical and tropical Abel–Jacobi maps #cite(label("BakerRabinoff")) Proposition 6.1
    and Corollary 6.6 identifies the latter with integration on $Gamma$ using the edge-length pairing.
  The open Berkovich annulus $A_j$ strongly deformation retracts to its open skeletal interval
    #cite(label("BakerPayneRabinoff")) Section 2.3 and is locally path connected.
    It is thus simply connected, so $i \|_(A_j)$ lifts to an analytic map $hat(i)_j : A_j arrow.r
    bb(T)^(upright("an"))$: first lift continuously along the covering $q$, then use its analytic local inverses.
    Orient all edges by increasing $v \( T \)$. For $j' eq.not j$, the cycle $c_j = e_j -
    e_(j')$ is an element of $M$. If $chi_j$ is its character, then $u_j = chi_j compose
    hat(i)_j$ is an analytic unit. The derivative of $v \( u_j \)$ along $e_j$, with respect to $v \( T \)$,
    is exactly one: the integral of the harmonic form represented by $c_j$ over a segment of $e_j$ is the length
    of that segment. Lifts of the tropical map differ only by a constant period, which does not change this derivative.
  By Lemma 8, an analytic unit on an open annulus has a unique dominant Laurent monomial at every interior Gauss
    radius; its exponent is constant and is the slope of its log-norm. It follows that
  $ u_j = c'_j T \( 1 + h_j \) \, wide h_j = sum_(n eq.not 0) h_(j \, n) T^n \, wide c'_j in Omega^times . $
  Here $c'_j T$ is the actual coefficient term of degree one.
    Dominance at every radius $r in \( \| alpha \| \, 1 \)$ gives $\| h_(j \, n) \| r^n < 1$.
    Taking limits at the endpoints yields, for $n > 0$,
  $ \| h_(j \, n) \| lt.eq 1 \, wide \| h_(j \, - n) \| lt.eq \| alpha \|^n . $
  Writing $s = v \( T \)$, the ultrametric inequality consequently gives
  $ \| h_j \| lt.eq p^(- min { s \, a - s }) < p^(- D) wide upright("on ") A_j ∩ { D < s < a - D } . $
  Figure 1 displays the cycle that supplies the slope-one character and the trimming that gives this bound.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((2, 2), [#text(size: 9pt)[Parallel edges of the skeleton]])
  bezier((0, 0), (4, 0), (1, 1.5), (3, 1.5), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  line((0, 0), (4, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.0pt, miter-limit: 10))
  bezier((0, 0), (4, 0), (1, -1.5), (3, -1.5), stroke: (paint: rgb("#666666"), thickness: 0.7pt, miter-limit: 10))
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  circle((4, 0), radius: 0.07056, fill: black, stroke: none)
  content((2, 1.13), [#text(size: 9pt)[$e_j$]], anchor: "south", padding: 0.1176cm)
  content((2, 0), [#text(size: 9pt)[$e_(j')$]], anchor: "south", padding: 0.1176cm)
  content((2, -0.6), [#text(size: 9pt)[$dots.v$]])
  content((2, -1.13), [#text(size: 9pt)[other edges]], anchor: "north", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$v(T)=0$]], anchor: "east", padding: 0.1176cm)
  content((4, 0), [#text(size: 9pt)[$v(T)=a$]], anchor: "west", padding: 0.1176cm)
  content((2, -2), [#text(size: 9pt)[$ell$ edges, each of length $a$#linebreak()cycle $c_j=e_j-e_(j')$]])
  content((9.4, 2), [#text(size: 9pt)[The middle collar on one edge]])
  line((6.6, 1.05), (12.2, 1.05), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#666666"))))
  content((9.4, 1.05), [#text(size: 9pt)[increasing $v(T)$]], anchor: "south", padding: 0.1176cm)
  line((6.6, 0), (12.2, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 2.0pt, miter-limit: 10))
  line((7.9, 0), (10.9, 0), stroke: (paint: rgb("#0000a6"), thickness: 2.0pt, miter-limit: 10))
  line((6.6, -0.1), (6.6, 0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((12.2, -0.1), (12.2, 0.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((7.9, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((10.9, 0), radius: 0.08819, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((6.6, -0.12), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((7.9, -0.12), [#text(size: 9pt)[$D$]], anchor: "north", padding: 0.1176cm)
  content((10.9, -0.12), [#text(size: 9pt)[$a-D$]], anchor: "north", padding: 0.1176cm)
  content((12.2, -0.12), [#text(size: 9pt)[$a$]], anchor: "north", padding: 0.1176cm)
  content((9.4, 0.12), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$A^ compose$]]], anchor: "south", padding: 0.1176cm)
  content((9.4, -1.22), [#text(size: 9pt)[$u_j=c_j'T(1+h_j)$#linebreak()$|h_j|<p^(-D)$ on $A^ compose$]])
  content((9.4, -2), [#text(size: 9pt)[$D>v_p(m)+ frac(1, p-1)$]])
})],
    caption: [Figure 1: The construction in Proposition 13, shown schematically. All edges are oriented by increasing $v \( T \)$; the cycle $e_j - e_(j')$ gives a character unit $u_j$ of slope one on the annulus corresponding to $e_j$. Division by $m$ on the Jacobian supplies a root of $u_j$ on the whole inverse annulus. Trimming its skeletal interval to $D < v \( T \) < a - D$ makes $h_j$ small enough for $1 + h_j$ to have an $m$-th root, and hence gives a root of $T$. ],
  ) <fig:parallel-edges>
  On every closed subannulus this estimate has a strict uniform margin.
    The logarithm and exponential therefore converge locally uniformly and
  $ b_j = exp #scale(x: 120%, y: 120%)[\(] m^(- 1) log \( 1 + h_j \) #scale(x: 120%, y: 120%)[\)] $
  is analytic there, with $b_j^m = 1 + h_j$. Indeed, since $D > 1 \/ \( p - 1 \)$,
    the logarithm satisfies $\| log \( 1 + h_j \) \| lt.eq \| h_j \|$,
    and the valuation of the exponent is greater than $D - v_p \( m \) > 1 \/ \( p - 1 \)$.
  For all $ell$ annuli at once, form the same algebraic finite étale cover
  $ Z' = Z times_(i \, J \, \[ m \]) J arrow.r Z . $
  It is finite étale for every positive integer $m$, since the ground field has characteristic zero.
    Lemma 12 applied to $a = hat(i)_j$ gives an analytic $m$-th root of $u_j$ on the whole inverse image of $A_j$.
    Dividing it by $b_j$ and an $m$-th root of $c'_j$ gives an analytic $m$-th root of $T$ above the middle
    collar. The annuli $A_j$ are disjoint, so this gives a root on its entire inverse image in $Z'$.
    Choose any connected component $Q$ of $Z'$. Its map to $Z$ is finite étale and surjective,
    so it is a smooth proper connected curve with the required property.
    Its composite with $Z arrow.r bb(P)^1$ has only ramification indices $1$ or $ell$.
    All algebraic maps used to define $Q$ are over $overline(k)$;
    the analytic roots and torus lifts are only required over $Omega$. ◻
]

== 6 From collar roots to the completed universal tower <sec:realization>

The first stage, Proposition 11, places the field $L_ell$ inside $H$.
  We now use the auxiliary covers from Proposition 13 to realize every finite Galois extension of $K_0$ in that
  same completion. The covers used to create the collars may be branched;
  their horizontal ramification indices divide $ell$, so the first stage is sufficient to accommodate them.

#proof[
  Let $F \/ K_0$ be any finite Galois extension inside $K^(upright("sep"))$, and let $C arrow.r
    X_(macron(k))$ be its smooth proper curve cover. Its branch set $B$ is finite.
    If $B$ is empty, then $F subset tilde(K) subset H$ by definition of the universal étale field.
    Suppose henceforth that $B$ is nonempty.
  For each $b in B$, choose a rational local parameter $t_b$ at $b$ and disjoint disks $B_b$ as in Lemma 3;
    these disks avoid $xi$. Let $m_b$ be the least common multiple of the ramification indices of $C$ at the
    points above $b$. Choose $beta_b in macron(k)^times$ whose absolute value is smaller than the radius of $B_b$
    in the coordinate $t_b$.
  Apply Proposition 13 with $m = m_b$. In its notation choose a positive integer $D_b > v_p \( m_b \) +
    1 \/ \( p - 1 \)$ and $alpha_b in macron(k)^times$ with $a_b = - log_p \| alpha_b \| > 2 D_b$.
    It gives a smooth proper connected curve cover of the $T$-line whose horizontal indices divide $ell$ and on
    whose full inverse image of
  $ D_b < - log_p \| T \| < a_b - D_b $
  the coordinate $T$ has an analytic $m_b$-th root. Pull this cover back by the nonconstant morphism
    $X_(macron(k)) arrow.r bb(P)_(macron(k))^1$ given by $T = t_b \/ beta_b$,
    and take a normalized connected component. Denote the resulting cover by $W_b arrow.r X_(macron(k))$.
  Lemma 6 shows that its horizontal indices still divide $ell$.
    Roots pull back to every point of the normalized component,
    so $t_b$ has an analytic $m_b$-th root on the entire inverse image in $W_(b \, Omega)^(upright("an"))$ of the collar
  $ \| beta_b \| p^(- \( a_b - D_b \)) < \| t_b \| < \| beta_b \| p^(- D_b) $
  inside $B_b$. Here we multiplied the pulled-back root of $T$ by an $m_b$-th root of $beta_b$ in $Omega$.
  Embed the finitely many function fields $macron(k) \( W_b \)$ into the fixed $K^(upright("sep"))$ over $K_0$ and
    form their compositum. Let $W arrow.r X_(macron(k))$ be the associated smooth proper connected curve.
    It dominates every $W_b$; its horizontal indices divide $ell$ by Lemma 6.
    All collar roots therefore pull back to the full inverse images in $W_Omega^(upright("an"))$.
  Proposition 4, with $Y = W_Omega$, produces a connected finite étale cover $V_Omega arrow.r
    W_Omega$ and an analytic map from its exterior region to $C_Omega^(upright("an"))$ over
    $X_Omega^(upright("an"))$. Since $W$ is proper over the algebraically closed field $macron(k)$,
    invariance of finite étale covers under the algebraically closed extension $macron(k) subset
    Omega$ #cite(label("SGA1")) gives a connected finite étale cover $V arrow.r W$ and an isomorphism
  $ V times_(macron(k)) Omega tilde.eq V_Omega quad upright("over ") W_Omega . $
  No descent assertion is needed for the exterior analytic map.
  Although no such bound was imposed on $C arrow.r X_(macron(k))$, the composite $V arrow.r
    X_(macron(k))$ still has horizontal indices dividing $ell$.
    By Lemma 6, its function field embeds over $K_0$ in $L_ell$.
    This embedding can, if desired, be chosen to extend the already chosen embedding of $macron(k) \( W \)$:
    extend that embedding to $macron(k) \( V \)$ inside $K^(upright("sep"))$ and then take its Galois closure,
    which still has indices dividing $ell$. Proposition 11 places its image in $H$.
  Lemma 5 now gives a $K_0$-embedding $F = macron(k) \( C \) arrow.r.hook H subset E$.
    Because $F \/ K_0$ is normal, this embedding has image the chosen subfield $F$ of $E$.
    Indeed a primitive element of $F$ is sent to a root of its minimal polynomial,
    all of whose roots already belong to $F$; the same holds for every element.
    The image, having degree $\[ F : K_0 \]$, is therefore $F$ itself. Consequently $F subset H$.
  Every element of $K^(upright("sep"))$ lies in a finite Galois extension of $K_0$ inside $K^(upright("sep"))$:
    this is an algebraic closure of the characteristic-zero field $K_0$.
    Taking the union over those extensions proves $K^(upright("sep")) subset H$ inside $E$. ◻
]

== 7 From completion to point sections <sec:sections>

We now use Theorem 2 to compare decomposition groups. The comparison lifts any section localized at a rank-one
  valuation to a birational section. Koenigsmann’s theorem then places the same section at a rational point,
  and the two valuations give a contradiction. The remaining valuations are horizontal refinements,
  where the localization theorem of Pop–Stix already identifies the section.

#thm([Corollary 7.1.])[
  #emph[Let $k \/ bb(Q)_p$ be finite and let $X \/ k$ be a smooth proper geometrically connected curve of genus at
    least two. Put $K = k \( X \)$ and let $tilde(K) subset K^(upright("sep"))$ be the extension corresponding to
    the full arithmetic étale fundamental group of $X$. Let $w$ be a real-valued rank-one valuation of $K$
    extending the $p$-adic valuation, normalized by $w \( p \) = 1$,
    and fix a prolongation $w^(upright("sep"))$ to $K^(upright("sep"))$.
    Restriction induces an isomorphism of profinite groups
$ D_(w^(upright("sep"))) \( K^(upright("sep")) \/ K \) arrow.r^(med tilde.op med)
  D_(tilde(w)) \( tilde(K) \/ K \) \, wide tilde(w) = w^(upright("sep")) \|_(tilde(K)) . $

]
] <cor:decomposition>

#proof[
  Restriction is surjective. Indeed, lift an automorphism stabilizing $tilde(w)$ to an automorphism of
    $K^(upright("sep")) \/ K$. Its translate of $w^(upright("sep"))$ is another prolongation of $tilde(w)$.
    Transitivity of $"Gal" \( K^(upright("sep")) \/ tilde(K) \)$ on these prolongations allows us to adjust the
    lift so that it stabilizes $w^(upright("sep"))$. The transitivity statement for an infinite normal extension
    follows from its finite-level version by compactness.
  An automorphism stabilizing a rank-one valuation preserves its normalized absolute value.
    To see why normalization matters, any two order-preserving embeddings of the value group into $bb(R)$ differ
    by a positive scale; the value on $p$ fixes that scale. Such an automorphism therefore extends as an isometry
    to $E = hat(K^(upright("sep")))$. If its restriction to $tilde(K)$ is the identity, it fixes $H =
    hat(tilde(K)) subset E$ pointwise. Theorem 2 gives $K^(upright("sep")) subset H$,
    so the automorphism is the identity.
  Both decomposition groups are closed subgroups of their Galois groups.
    For example, stabilization of a valuation ring is the intersection, over its algebraic elements,
    of conditions on finite Galois orbits, each of which is clopen.
    Restriction is consequently a continuous bijection between compact Hausdorff groups,
    and its inverse is continuous. ◻
]

#thm([Lemma 7.2.])[
  #emph[With $k$, $X$, $K$, and $tilde(K)$ as in Corollary 14,
    let $w$ be any rank-one valuation of $K$ extending the $p$-adic valuation and let $tilde(w)$ be any
    prolongation to $tilde(K)$. The projection
$ D_(tilde(w)) \( tilde(K) \/ K \) arrow.r G_k $

 has no continuous group-homomorphic section.]
] <lem:no-rank-one-section>

#proof[
  Normalize $w \( p \) = 1$ and prolong the valuation to $K^(upright("sep"))$. Suppose that a section exists.
    Corollary 14 lifts it to a continuous section
  $ hat(s) : G_k arrow.r G_K = "Gal" \( K^(upright("sep")) \/ K \) $
  whose image stabilizes this prolongation. The birational section theorem of Koenigsmann places the entire image
    of $hat(s)$ also in the decomposition group of a prolongation of $"ord"_a$ for some $a in
    X \( k \)$ #cite(label("Koenigsmann")) preprint version, Proposition 2.4(2), Definition 1.4,
    and Observation 1.3. Here $"ord"_a$ is the closed-point valuation of $K$, trivial on $k$.
  Write $Sigma = hat(s) \( G_k \)$ and $M = \( K^(upright("sep")) \)^Sigma$.
    The subgroup $Sigma$ is compact and hence closed, so $G_M = Sigma$.
    Let $v_1$ and $v_2$ be the restrictions to $M$ of the two selected prolongations. Each is henselian:
    its absolute Galois group stabilizes a prolongation, and the transitive action on all prolongations therefore
    has a single point. Both valuations are nontrivial and have rank one.
    Indeed, value groups in an algebraic valued extension differ by a torsion quotient,
    which preserves their convex-subgroup chains. Moreover,
  $ v_1 \( p \) = 1 \, wide v_2 \|_(k^times) = 0 \, $
  so these valuations are inequivalent. The resulting contradiction is an instance of the classical uniqueness
    principle for henselian valuations associated with F. K. Schmidt #cite(label("SchmidtValuations")).
    We give explicitly the two-valuation approximation needed here.
  Choose a nonsquare $d in k^times$. It remains a nonsquare in $M$:
    otherwise $G_M = Sigma$ would fix a square root of $d$ in $macron(k)$,
    contrary to the surjection $Sigma arrow.r G_k$. Let $t in K$ be a uniformizer at $a$.
    Choose a positive integer $N$ with $N > v_1 \( t \)$, and put $z = p^N \/ t$. Then
  $ v_1 \( z \) > 0 \, wide v_2 \( z \) = - v_2 \( t \) < 0 . $
  For positive integers $r$, set
  $ q_r = d + \( 1 - d \) frac(z^r, 1 + z^r) . $
  The denominator is nonzero because $v_1 \( z^r \) > 0$. At the first valuation $q_r$ tends to $d$,
    and at the second it tends to $1$. More precisely,
  $ v_1 \( q_r \/ d - 1 \) = v_1 \( \( 1 - d \) \/ d \) + r v_1 \( z \) arrow.r + oo \, $
  whereas
  $ v_2 \( q_r - 1 \) = v_2 \( d - 1 \) - r v_2 \( z \) arrow.r + oo . $
  For sufficiently large $r$, Hensel’s lemma applied at $1$ gives a square root of $q_r \/ d$ using $v_1$,
    and a square root of $q_r$ using $v_2$. The sufficient inequalities are
  $ v_1 \( q_r \/ d - 1 \) > 2 v_1 \( 2 \) \, wide v_2 \( q_r - 1 \) > 2 v_2 \( 2 \) . $
  Their quotient makes $d$ a square in $M$, a contradiction.
    This argument includes $p = 2$ and arbitrary nondiscrete rank-one value groups. ◻
]

#proof[
  Let $s : G_k arrow.r Pi_X$ be a continuous group-homomorphic section.
    By the valuative localization theorem of Pop–Stix #cite(label("PopStix")) preprint version, Theorem 26,
    there is a valuation $w$ of $K$ extending the $p$-adic valuation,
    together with a prolongation $tilde(w)$ to $tilde(K)$, such that
  $ s \( G_k \) subset.eq D_(tilde(w)) \( tilde(K) \/ K \) . $
  We classify the possibilities for $w$.
  The valuation transcendence inequality gives
  $ "ratrank" \( Gamma_w \/ Gamma_k \) lt.eq 1 . $
  Since $Gamma_k$ has rational rank one and ordered rank is at most rational rank, $w$ has rank at most two.
    Rank one is excluded by Lemma 15. If $w$ has rank two, let $u$ be its rank-one coarsening.
    The nonzero proper convex subgroup of the rank-two value group has a unique extension to the value group of
    $tilde(w)$: it consists of those values some positive multiple of which lies in the original subgroup.
    This follows because an algebraic valued extension has torsion quotient of value groups.
    Every automorphism stabilizing $tilde(w)$ preserves this subgroup,
    so $s \( G_k \)$ stabilizes the resulting prolongation of $u$.
    If $u$ is nontrivial on $k$, it can be normalized to extend the $p$-adic valuation and is excluded by the same
    lemma.
  It remains that $u$ is trivial on $k$. Properness gives it a center on $X$.
    This center cannot be generic because $u$ is nontrivial, so it is a closed point $a$.
    The valuation ring of $u$ dominates the discrete valuation ring $cal(O)_(X \, a)$.
    Every element of $K^times$ is a power of a uniformizer times a unit of this local ring;
    hence $u$ is equivalent to $"ord"_a$. Its residue field is the finite extension $k \( a \) \/ k$.
    The second valuation in the composition $w$ is the unique prolongation of the $p$-adic valuation to
    $k \( a \)$. Thus $w$ is of type $2 h$.
  The chosen horizontal prolongation to $K macron(k)$ selects a geometric point above $a$.
    Its stabilizer acts on constants through $G_(k \( a \)) subset.eq G_k$,
    with the embedding determined by that point. Since $s \( G_k \)$ projects onto $G_k$, necessarily $k \( a \) =
    k$. For the full étale tower the horizontal inertia is trivial,
    and the horizontal decomposition group is the point section at $a$.
    Equivalently, the type-$2 h$ conclusion of #cite(label("PopStix")) preprint version, Section 6.1 gives $s =
    s_a$ after the corresponding geometric choice of base point. This proves surjectivity.
  Notice that a type-$2 h$ valuation can lie over a non-rational closed point.
    Rationality here follows from the surjection to $G_k$; no unrestricted equivalence between “not type $2
    h$” and “not originating from a rational point” is used. ◻
]

#proof[
  Suppose $a \, b in X \( k \)$ have the same section class modulo the full geometric fundamental group.
    Let $J$ be the Jacobian of $X$, and use $a$ as base point for the Abel–Jacobi map
  $ i_a : X arrow.r J \, wide x mapsto \[ x - a \] . $
  Their induced sections on $J$ are again geometrically conjugate.
    For every positive integer $n$, multiplication $\[ n \] : J arrow.r
    J$ is a finite étale torsor under $J \[ n \]$, also when $p divides n$ since $k$ has characteristic zero.
    Conjugate sections give isomorphic $G_k$-actions on its geometric fiber,
    so the existence of a fixed point is unchanged by conjugation.
    The section at $i_a \( a \) = 0$ has the fixed lift $0$. Therefore the fiber over $i_a \( b \)$ has a
    $G_k$-fixed point, which is a $k$-rational point of that fiber. Thus
  $ i_a \( b \) in ⋂_(n gt.eq 1) n J \( k \) . $
  This is also the usual Kummer argument: the class of the multiplication torsor pulled back along a section is
    unchanged by geometric conjugation.
  The compact $p$-adic analytic group $J \( k \)$ has an open subgroup $U tilde.equiv
    bb(Z)_p^(g \( X \) \[ k : bb(Q)_p \])$ by the local logarithm.
    If $q = \[ J \( k \) : U \]$, then $q J \( k \) subset.eq U$.
    For each $r gt.eq 0$, take $n = q p^r$ in the displayed intersection.
    Any element of that intersection can then be written as $p^r \( q y \)$ with $y in J \( k \)$,
    and hence belongs to $p^r U$. As $U$ is a finite free $bb(Z)_p$-module,
  $ ⋂_(r gt.eq 0) p^r U = 0 \, $
  and hence $i_a \( b \) = 0$. If $a eq.not b$, the linear equivalence of the degree-one divisors $a$ and $b$
    would give a degree-one morphism $X arrow.r bb(P)^1$, forcing genus zero. Hence $a = b$, as required. ◻
]

== 8 Global consequences via finite descent <sec:global-sections>

We now combine the local theorem with established descent and finite-support results.
  First we identify the adelic tuples obtained from global sections.
  We then give a criterion that makes these sections geometric and apply it to abelian targets and modular curves.
  Finally, we describe further restrictions on the localization tuples without assuming that criterion.
  In this section $K$ is a number field. For a field $F$ of characteristic zero and a smooth proper geometrically
  connected curve $D \/ F$, write $"Sec" \( D \/ F \)$ for the conjugacy classes of continuous splittings of

$ 1 arrow.r pi_1 \( D_(macron(F)) \) arrow.r pi_1 \( D \) arrow.r G_F arrow.r 1 \, wide G_F =
  "Gal" \( macron(F) \/ F \) \, $

where conjugation is by the full geometric étale fundamental group.
  For a smooth proper geometrically connected curve $C \/ K$ of genus at least two,
  the global section conjecture asserts that the point map

$ kappa_C : C \( K \) arrow.r "Sec" \( C \/ K \) $

is bijective. Thus the section classes considered here are the full arithmetic étale classes,
  without a birational lifting assumption.

=== 8.1 Localization and descent <subsec:global-localization>

For a proper $K$-scheme $V$, use the modified adelic set

$ V \( bb(A)_K \)_bullet = product_(v divides.not oo) V \( K_v \) times
  product_(v med upright("real")) pi_0 #scale(x: 120%, y: 120%)[\(] V \( K_v \) #scale(x: 120%, y: 120%)[\)] \, $

where $pi_0$ denotes the set of connected components. Complex places are omitted,
  as in the corrected convention of Stoll’s erratum #cite(label("StollFiniteDescentErrata")) Section 1.
  For geometrically connected $C$ the complex component factors in the earlier convention are singletons,
  but their omission matters for geometrically disconnected torsors.
  A point of $C \( bb(A)_K \)_bullet$ survives a torsor $Y arrow.r
  C$ under a finite $K$-group scheme $G$ if it lifts to $Y^xi \( bb(A)_K \)_bullet$ for some twist $Y^xi$,
  where $xi in H^1 \( K \, G \)$. Write $C \( bb(A)_K \)_bullet^(upright(f upright("-") c o v))$ for the points
  surviving every such torsor, and $C \( bb(A)_K \)_bullet^(upright(f upright("-") a b))$ for those surviving
  every such torsor with $G$ abelian #cite(label("StollFiniteDescent")) Definitions 5.2 and 5.4.
  We identify $C \( K \)$ with its diagonal image. The definitions give

#[#set math.equation(numbering: n => "(8.1)")
 $ C \( K \) subset.eq C \( bb(A)_K \)_bullet^(upright(f upright("-") c o v)) subset.eq
   C \( bb(A)_K \)_bullet^(upright(f upright("-") a b)) . $ <eq:descent-inclusions>]

The local section theorems define a localization map for every such curve,
  without any descent equality hypothesis. Let $s in "Sec" \( C \/ K \)$.
  At every finite place $v$, its localization is the section of a unique point $P_v in C \( K_v \)$ by Theorem 1.
  At a real place the section map

$ pi_0 #scale(x: 120%, y: 120%)[\(] C \( K_v \) #scale(x: 120%, y: 120%)[\)] arrow.r "Sec" \( C \/ K_v \) $

is bijective by the real section theorem; the genus-at-least-two case is included in the theorem of
  Bresciani–Vistoli #cite(label("BrescianiVistoliReal")) Introduction, Theorem.
  At a complex place the local Galois group is trivial and the local condition is automatic.
  Thus $s$ is a Selmer section: it comes from a local point at every place.
  Properness makes these localizations a modified adelic point $x \( s \) in C \( bb(A)_K \)_bullet$.
  We obtain the canonical map

$ "loc" : "Sec" \( C \/ K \) arrow.r C \( bb(A)_K \)_bullet \, wide s mapsto x \( s \) . $

#thm([Proposition 8.1.])[
  (The localization image).  #emph[Let $C \/ K$ be a smooth proper geometrically connected curve of genus at least
    two over a number field. Then
#[#set math.equation(numbering: n => "(8.2)")
 $ "loc" #scale(x: 120%, y: 120%)[\(] "Sec" \( C \/ K \) #scale(x: 120%, y: 120%)[\)] =
   C \( bb(A)_K \)_bullet^(upright(f upright("-") c o v)) . $ <eq:localization-image>]

]
] <prop:localization-image>

#proof[
  Let $s in "Sec" \( C \/ K \)$. Choose a representative point of the determined component at each real place,
    and any point at each complex place. Harari–Stix’s Theorem 2.1, with $U =
    1$ and the omitted set of places $S = diameter$, shows that these localizations survive every torsor under a
    finite $K$-group scheme; their Remark 2.2(1) identifies this as finite-cover descent
    #cite(label("HarariStixFiniteDescent")) preprint version, Theorem 2.1 and Remark 2.2(1). Consequently
  $ x \( s \) in C \( bb(A)_K \)_bullet^(upright(f upright("-") c o v)) . $
  Conversely, let $x$ belong to the finite-cover locus and, by properness,
    choose an ordinary adelic representative $P = \( P_v \) in C \( bb(A)_K \)$.
    Stoll’s cohomological description after Definition 5.2, together with Definition 5.4,
    identifies survival with diagonal global $H^1 \( K \, G \)$-membership of the local evaluations for every
    torsor under a finite $K$-group scheme $G$ #cite(label("StollFiniteDescent")).
    These evaluations factor through the real components, and complex places impose no lifting condition,
    in the corrected convention already used above. Thus every such $P$ satisfies the ordinary finite-torsor
    condition. Harari–Stix’s Theorem 2.1 with $U = 1$ and $S = diameter$,
    using implication (i)$arrow.r.double$(iii), gives a global section whose restrictions are the point sections
    of $P_v$, up to conjugation by the full geometric fundamental group #cite(label("HarariStixFiniteDescent"))
    preprint version, Theorem 2.1 and Remark 2.2(1). The finite-point and real-component uniqueness used above
    identify its localization with $x$, proving (8.2). ◻
]

=== 8.2 Criteria for point sections <subsec:global-criteria>

Proposition 16 determines which adelic tuples come from sections.
  To recover rational points from the sections themselves, we also need the finite-support theorem of Stix.

#thm([Theorem 8.2.])[
  (Finite-cover descent criterion).  #emph[Let $C \/ K$ be a smooth proper geometrically connected curve of genus
    at least two over a number field. If
#[#set math.equation(numbering: n => "(8.3)")
 $ C \( bb(A)_K \)_bullet^(upright(f upright("-") c o v)) = C \( K \) \, $ <eq:finite-cover-equality>]

 then $kappa_C : C \( K \) arrow.r "Sec" \( C \/ K \)$ is bijective.]
] <thm:global-descent>

#proof[
  Let $s in "Sec" \( C \/ K \)$. By Proposition 16 and (8.3),
    there is $a in C \( K \)$ such that $x \( s \)$ is the diagonal localization of $a$,
    hence equals the localization of the point section $s_a$.
  At every finite place the point determined by $s$ is therefore $a$.
    At each real place choose $a$ itself in the determined component, and choose $a$ also at each complex place.
    The resulting ordinary adelic representative of the localization tuple is supported on ${ a }$.
    Thus the support $Z \( s \)$ in Stix’s terminology, the Zariski-closed support of this tuple,
    is finite over $K$. Since $C$ is proper of genus at least two, it is hyperbolic and has no cuspidal sections.
    Stix’s finite-support result therefore makes $s$ a point section #cite(label("StixFiniteSupport")) arXiv
    version, Section 3 and Corollary 5. Finally, if two points give the same global section,
    their sections agree after restriction to any one finite completion.
    Injectivity in Theorem 1 then identifies the two points. This proves injectivity and also identifies the point
    giving $s$ with $a$. ◻
]

The equality in (8.3) is supplied by several published criteria. For an abelian variety $A \/ K$, let

$ "Sha" \( A \/ K \) = ker (H^1 \( K \, A \) arrow.r product_v H^1 \( K_v \, A \)) \, $

and write $"Sha" \( A \/ K \)_(upright("div"))$ for its maximal divisible subgroup.

#thm([Corollary 8.3.])[
  (Abelian targets).  #emph[Let $C \/ K$ be a smooth proper geometrically connected curve of genus at least two
    over a number field. The map $kappa_C$ is bijective if either of the following conditions holds:]
  + #emph[there is a nonconstant $K$-morphism $C arrow.r A$ to an abelian variety with $A \( K \)$ finite and
    $"Sha" \( A \/ K \)_(upright("div")) = 0$;]
  + #emph[the Jacobian $J$ of $C$ has $J \( K \)$ finite and $"Sha" \( J \/ K \)_(upright("div")) = 0$.]
] <cor:global-abelian-target>

#proof[
  Stoll’s Theorem 8.6 gives $C \( bb(A)_K \)_bullet^(upright(f upright("-") a b)) =
    C \( K \)$ under the first condition, and his Corollary 8.1 gives the same equality under the second,
    without requiring a $K$-rational base point on $C$ #cite(label("StollFiniteDescent")).
    The corrected covering arguments and the repair of Proposition 8.5 used by Theorem 8.6 are in
    #cite(label("StollFiniteDescentErrata")) Sections 2–3; the stated equalities are retained.
    The inclusions (8.1) now imply (8.3), so Theorem 17 applies. ◻
]

For an elliptic curve $E \/ bb(Q)$ and a prime $p$, put

$ s_p \( E \) = "corank"_(bb(Z)_p) "Sel"_(p^oo) \( E \/ bb(Q) \) \, $

where the Selmer group uses the local Kummer conditions at every place.

#thm([Corollary 8.4.])[
  (A Selmer-corank-zero elliptic target).  #emph[Let $C \/ bb(Q)$ be a smooth proper geometrically connected curve
    of genus at least two. Suppose that there is a nonconstant $bb(Q)$-morphism $C arrow.r
    E$ to an elliptic curve and that $s_p \( E \) = 0$ for at least one prime $p$. Then $kappa_C$ is bijective.]
] <cor:global-selmer-target>

#proof[
  The corank-zero case of the companion Selmer converse #cite(label("OpenAISelmerConverse2026")) Theorem 1.1 gives
    $"rank"_(bb(Z)) E \( bb(Q) \) = 0$ and finiteness of the entire group $"Sha" \( E \/ bb(Q) \)$.
    The Mordell–Weil theorem therefore makes $E \( bb(Q) \)$ finite,
    while finiteness of $"Sha" \( E \/ bb(Q) \)$ makes its maximal divisible subgroup zero. Corollary 18(i) applies. ◻
]

#thm([Corollary 8.5.])[
  (Modular curves).  #emph[For every positive integer $N$ such that the smooth projective geometrically connected
    curve $X_0 \( N \) \/ bb(Q)$ has genus at least two, the map $kappa_(X_0 \( N \))$ is bijective.
    The same assertion holds for the smooth projective geometrically connected curve $X_1 \( N \) \/
    bb(Q)$ whenever its genus is at least two.]
] <cor:global-modular-curves>

#proof[
  Stoll’s Corollary 8.8 gives $C \( bb(A)_(bb(Q)) \)_bullet^(upright(f upright("-") a b)) =
    C \( bb(Q) \)$ for each of these projective modular curves of positive genus
    #cite(label("StollFiniteDescent")), with the corrected conventions of
    #cite(label("StollFiniteDescentErrata")). Apply (8.1) and Theorem 17. ◻
]

The general implication retains the finite-cover equality as a genuine arithmetic hypothesis;
  local point-theoreticity alone does not supply it. The elliptic-target specialization uses only Selmer corank
  zero over $bb(Q)$, while the modular-curve cases come directly from Stoll’s descent result and do not depend on
  that specialization.

=== 8.3 Further restrictions on localization <subsec:global-restrictions>

We return to an arbitrary smooth proper geometrically connected curve $C \/
  K$ of genus at least two over a number field, without assuming (8.3).
  The localization image in Proposition 16 satisfies additional descent conditions and,
  under a restriction on $K$, has finite image at each finite place.

Let $rho : C \( bb(A)_K \) arrow.r C \( bb(A)_K \)_bullet$ be the natural projection.
  Write $D_(upright("lin")) \( C \)$ for the ordinary adelic descent set:
  $P$ belongs to it if, for every $C$-torsor $T arrow.r C$ under a linear algebraic $K$-group $G$,
  it lifts to $T^xi \( bb(A)_K \)$ for some global twist $xi in H^1 \( K \, G \)$.
  Harari–Stix’s Theorem 4.1 sends the finite-torsor condition established in Proposition 16 to this linear descent
  condition, while their Corollary 3.1, applied to the geometric abelianization of the interpolating section,
  gives Brauer–Manin membership #cite(label("HarariStixFiniteDescent")) preprint version,
  Corollary 3.1 and Theorem 4.1. Consequently

#[#set math.equation(numbering: n => "(8.4)")
 $ rho^(- 1) #h(-0.16667em)
   ("loc" #scale(x: 120%, y: 120%)[\(] "Sec" \( C \/ K \) #scale(x: 120%, y: 120%)[\)]) subset.eq
   D_(upright("lin")) \( C \) ∩ C \( bb(A)_K \)^("Br") . $ <eq:localization-obstructions>]

This applies to every ordinary adelic representative of a modified localization tuple;
  the lifting condition uses ordinary adeles also when $T$ is nonproper.

Finally, if $K$ contains no CM subfield, Betts–Stix’s Theorem A,
  applied to the sections shown to be Selmer in Section 8.1, gives

$ \# "loc"_v #scale(x: 120%, y: 120%)[\(] "Sec" \( C \/ K \) #scale(x: 120%, y: 120%)[\)] < oo \, wide "loc"_v =
  "pr"_v compose "loc" \, $

for every finite place $v$, with image in $C \( K_v \)$ #cite(label("BettsStix")) arXiv version,
  Definition 1.1 and Theorem A. This asserts neither injectivity of localization nor finiteness of the global
  section set, and supplies no effective or uniform bound.

#bibliography("refs.bib", style: "ieee", title: [References])
