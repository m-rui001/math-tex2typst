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

#align(center)[#text(size: 16pt, weight: "bold")[An isomorphism of the free group factors]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

For a discrete group $G$, its group von Neumann algebra is

$ L \( G \) = { lambda \( g \) : g in G }'' \, #h(2em) \( lambda \( g \) xi \) \( h \) = xi \( g^(- 1) h \) \, quad xi in ell^2 \( G \) \, $

with canonical trace $tau \( x \) = chevron.l x delta_e \, delta_e chevron.r$. Write $bb(F)_n$ for the free group on $n$ generators and $bb(F)_oo$ for the free group on countably infinitely many generators. The free group factors arose in Murray and von Neumann’s foundational work #cite(label("murray_vonneumann1943")). Their nonhyperfiniteness distinguished them from the hyperfinite factor, but did not distinguish their ranks; see the historical account in #cite(label("radulescu1992")) p. 518. The question whether $L \( bb(F)_m \)$ and $L \( bb(F)_n \)$ are isomorphic for distinct $m \, n gt.eq 2$ became a central problem in the classification of finite factors. Dykema’s introduction #cite(label("dykema1994")) p. 123 records the early history and credits Kadison with raising the rank-isomorphism question.

Free probability supplied a way to study these factors through their generating distributions. Voiculescu developed the reduced-free-product framework #cite(label("voiculescu1985")) and its semicircular and circular models #cite(label("voiculescu1990")). His compression results showed that the fundamental group of $L \( bb(F)_oo \)$ contains every positive rational, and Rădulescu extended this to every positive real number #cite(label("radulescu1992")). Dykema and Rădulescu independently constructed the interpolated factors $L \( bb(F)_r \)$ for real $r > 1$ and established their amplification calculus #cite(label("dykema1994")) #cite(label("radulescu1994")). These results relate changes of rank to normalized corners. They also give a dichotomy: the interpolated free group factors are either all isomorphic or pairwise nonisomorphic. The version including the infinite parameter is due to Rădulescu #cite(label("radulescu1994")) Corollary 4.7; see also the precise restatement in #cite(label("goldbring_pi2025")) Theorem 1.1.

The amplification calculus thus links rank to corner size, while the dichotomy reduces the classification to two alternatives. To choose the isomorphic alternative, it suffices to construct an isomorphism between two distinct finite ranks. Our constructive result is the following rank comparison.

#thm([Theorem 1.1.])[
  (Isomorphism of consecutive ranks).  #emph[For every integer $n gt.eq 3$ there is a unital trace-preserving normal $*$-isomorphism 
$ L \( bb(F)_n \) tilde.equiv L \( bb(F)_(n + 1) \) . $

]
] <thm:rank-step>

The construction gives a freely generating Haar $n$-tuple inside $L \( bb(F)_(n + 1) \)$. Applying it at ranks three and four, and then using the established amplification formula, gives the headline conclusion.

#thm([Theorem 1.2.])[
  #emph[There exists a unital normal trace-preserving $*$-isomorphism 
$ Phi : L \( bb(F)_2 \) arrow.r L \( bb(F)_3 \) . $

]
] <thm:main>

This gives an affirmative solution to the free group factor isomorphism problem. Together with the classical dichotomy, this proves that all interpolated free group factors, including the infinite-rank factor, are isomorphic. Their fundamental groups are therefore $bb(R)_(> 0)$. We state and prove these consequences in Corollary 17; the constructive rank comparison itself does not use interpolation.

Free entropy offered another approach to distinguishing ranks. A free semicircular $n$-tuple generates $L \( bb(F)_n \)$ #cite(label("voiculescu1990")) Remarks 1.10–1.11 and has free entropy dimension $delta = n$ #cite(label("voiculescu2002entropy")) Section 2.4(c),(d). Voiculescu asked whether $delta$ of a finite self-adjoint tuple depends only on the tracial von Neumann algebra it generates #cite(label("voiculescu2002entropy")) Section 2.6. Such invariance would distinguish the finite ranks. Our isomorphisms give the opposite conclusion: Corollary 18 gives a negative answer and proves the same failure for $delta_0 \, delta^(*)$, and $delta^star.op$. Each of the four dimensions attains every integer value $n gt.eq 2$ on finite self-adjoint generating tuples of $L \( bb(F)_2 \)$. The proof transports semicircular tuples for the microstates dimensions $delta \, delta_0$ and group-algebra tuples for the nonmicrostates dimensions $delta^(*) \, delta^star.op$; the two tuple families need not coincide.

Fix $n gt.eq 3$. We begin with a freely generating Haar tuple $\( A_1 \, dots.h \, A_n \, C \)$ in $L \( bb(F)_(n + 1) \)$ and set $S = arg \( C \)$ using bounded Borel functional calculus. For $g in bb(F)_n$, let $A_g$ denote the corresponding word in $A_1 \, dots.h \, A_n$. Conjugates $A_g S A_g^(*)$ drive a polynomial differential equation in $C^(*) \( A_1 \, dots.h \, A_n \, S \)$. A formal trace identity and analyticity of the actual solutions’ moments prove moment preservation. The resulting maps descend through the relations among the generators, preserve the operator norm, and extend to normal trace-preserving automorphisms.

The coefficients are finitely supported real vectors $h_j in ell^2 \( bb(F)_n \)$, extended to group words by the cocycle rule

$ D_(x_j) = h_j \, #h(2em) D_(g b) = D_g + lambda \( g \) D_b \, #h(2em) bb(F)_n = chevron.l x_1 \, dots.h \, x_n chevron.r . $

After trace preservation has been established, a free-sum estimate gives two bounds for the time-one automorphism $beta_1$ in Proposition 8, with $w in bb(F)_n$:

$ ∥beta_1 \( A_j \) - A_j∥ lt.eq 3 pi parallel h_j parallel_(ell^2) \, #h(2em) ∥beta_1 \( A_w \) - C A_w∥ lt.eq 3 pi parallel D_w - delta_e parallel_(ell^2) . $

Thus small generator coefficients keep the tuple nearly fixed, while a cocycle value near $delta_e$ makes a selected word approximate $C A_w$.

The coefficient problem is solved in Lemma 12. For each $m gt.eq 1$, we choose a word $w_m$ with $m$ selected nonidentity prefixes $p_1 \, dots.h \, p_m$ forming a free family. With $h_j = 0$ for $j gt.eq 2$, its cocycle value is $D_(w_m) = T_m h_1$, where $T_m = 1 + sum_(j = 1)^m lambda \( p_j \)$. An explicit Catalan moment count shows that the spectral measures of $T_m T_m^(*) \/ m$ converge to a measure with no atom at zero. A truncated inverse of $T_m T_m^(*)$ then gives a small $ell^2$ vector whose image under $T_m$ is close to $delta_e$. A real-symmetry argument and a final truncation give finitely supported real coefficients, as required by the polynomial flow.

A free-group basis change now yields an automorphism moving each $A_j$ arbitrarily little in operator norm while making a word in the moved $A_j$’s approximate the #emph[old] variable $C$; this is Proposition 15. We iterate this step, choosing each future error budget only after the current approximating word has been fixed. The first $n$ coordinates converge in norm, so their joint Haar distribution persists. The complementary coordinate may vary at every stage. Generation is proved separately: the word algebra of the limiting tuple is dense in the ambient tracial $L^2$ space, and the trace-preserving conditional expectation then identifies its von Neumann closure with the entire factor.

The analytic and algebraic ingredients have established predecessors. Voiculescu’s cyclomorphy theorem exponentiates trace-preserving polynomial vector fields on algebraically free self-adjoint generators #cite(label("voiculescu2002cyclomorphy")) Theorem 3.8. Our flow uses Haar unitaries and a fixed bounded logarithm, so the descent through their relations is proved directly from moments. Guionnet and Shlyakhtenko’s free monotone transport constructs isomorphisms by analytic changes of variables for suitable perturbations of semicircular systems #cite(label("guionnet_shlyakhtenko2014")); the present argument uses small automorphisms and an iteration that changes the size of a generating tuple. The cocycle product rule is the coefficient form of Fox’s free differential calculus #cite(label("fox1953")) §1, equation $\( 1.2 \)'$. The support-independent norm estimate for free sums uses the creation, annihilation, and diagonal decomposition underlying reduced-free-product Khintchine inequalities #cite(label("ricard_xu2006")) §2. We give the estimates and moment arguments needed here in full.

A recent preprint of Shlyakhtenko announces identifications of specified Fuchsian group factors with interpolated free group factors #cite(label("shlyakhtenko2026fuchsian")). Its main construction finds a free complement to a commutator inside $L \( bb(F)_2 \)$, using finite automorphisms and a limiting generation argument. In both constructions the limiting distribution and the generation of the ambient algebra require separate attention. Here the small-cocycle estimate enables absorption of an additional free generator, and the adaptive error budgets preserve the approximations needed for generation. No result from that preprint is used below.

Section 2 supplies the free-probability and representation facts used in the construction. Sections 3 and 4 construct the automorphisms and their coefficients, and Section 5 carries out the limiting argument. Section 6 proves Theorem 2 and its classical consequences. Section 7 proves the generator dependence of free entropy dimensions.

== 2 Tracial preliminaries and a free-sum estimate <sec:prelim>

Throughout, $\( M \, tau \)$ is a von Neumann algebra with faithful normal tracial state. We write

$ ∥x∥_2 = tau \( x^(*) x \)^(1 \/ 2) \, #h(2em) ∥x∥ = upright("operator norm of ") x . $

The Hilbert space completion of $M$ in $∥dot.op∥_2$ is $L^2 \( M \, tau \)$, with inner product $chevron.l x \, y chevron.r = tau \( y^(*) x \)$, linear in the first variable. Left multiplication gives its faithful normal representation of $M$. A $*$-isomorphism is a bijective complex-linear map preserving multiplication and adjoints. A linear map between von Neumann algebras is #emph[normal] if it is ultraweakly continuous. We use standard finite von Neumann algebra facts, including bounded Borel functional calculus, Kaplansky density, and the trace-preserving conditional expectation onto a von Neumann subalgebra. The expectation extends to the orthogonal projection of $L^2 \( M \, tau \)$ onto the subalgebra’s $L^2$ space. Section 6 recalls the amplification convention separately.

A family $\( B_i \)_(i in I)$ of unital subalgebras is #emph[free] if, for every integer $r gt.eq 1$ and every choice of elements satisfying the conditions below,

$ tau \( b_1 dots.h.c b_r \) = 0 quad upright("whenever") quad b_j in B_(i_j) \, quad tau \( b_j \) = 0 \, quad i_j eq.not i_(j + 1) med \( 1 lt.eq j < r \) . $

Freeness of unital $*$-algebras passes to their generated von Neumann algebras. Indeed, bounded strong approximation gives bounded $L^2$ approximation in a finite tracial algebra; telescoping a product shows continuity of its trace under such approximations. Centering the approximants proves the assertion. Freeness also persists when disjoint collections of the free components are grouped: their algebraic spans consist of scalars and reduced products of centered elements, and the same definition applies to the resulting reduced products.

=== 2.1 Haar tuples and normal isomorphisms <haar-tuples-and-normal-isomorphisms>

#prodef([Definition 2.1.])[
  A #emph[freely generating Haar $d$-tuple] in $M$ is a tuple of unitaries $U = \( U_1 \, dots.h \, U_d \)$ such that $W^(*) \( U \) = M$ and
  $ tau \( U_g \) = 0 #h(2em) \( g in bb(F)_d \\ { e } \) . $
  Here $U_g$ is the evaluation of the reduced group word $g$ in $U$, with inverse letters evaluated as adjoints.
]

#thm([Lemma 2.2.])[
  (Identification by a generating Haar tuple).  #emph[For a freely generating Haar $d$-tuple $U$ in $M$, the assignment $lambda \( x_j \) mapsto U_j$ extends to a unital normal trace-preserving $*$-isomorphism $L \( bb(F)_d \) arrow.r M$.]
] <lem:haar-identification>

#proof[
  The vectors $U_g$, indexed by $g in bb(F)_d$, are orthonormal because $tau \( U_h^(*) U_g \) = tau \( U_(h^(- 1) g) \) = upright(bold(1))_(g = h)$. They span $L^2 \( M \, tau \)$. To see this, let $eta$ be orthogonal to their span. Choose $eta_m in M$ converging to $eta$ in $L^2$. The normal functionals $f_m \( x \) = tau \( eta_m^(*) x \)$ converge in norm to $f \( x \) = chevron.l x \, eta chevron.r$, since $∥f_m - f∥_(M^(*)) lt.eq ∥eta_m - eta∥_2$. The space $M_(*)$ of normal linear functionals is norm closed in $M^(*)$, so $f$ is normal. It vanishes on the ultraweakly dense word algebra and therefore on all of $M$. Thus $eta = 0$.
  Consequently the map $V : ell^2 \( bb(F)_d \) arrow.r L^2 \( M \, tau \)$ with $V delta_g = U_g$ is unitary. It intertwines $lambda \( x_j \)$ with left multiplication by $U_j$. Conjugation by $V$ identifies their double commutants. The double commutant on the right is the faithful normal left representation of $W^(*) \( U \) = M$, so this spatial identification gives the claimed isomorphism. It preserves the trace because $V delta_e = 1$. ◻
]

In particular, two freely generating Haar tuples of the same size in $M$ are related by a normal trace-preserving automorphism. The component algebras of a Haar tuple are free: expanding centered Laurent polynomials reduces the assertion to the nonidentity group-word trace, and bounded approximation gives freeness of the von Neumann closures.

For completeness, $L \( bb(F)_d \)$ is a $upright("II")_1$ factor for $d gt.eq 2$. Its canonical trace is $tau \( x \) = chevron.l x delta_e \, delta_e chevron.r$, which is faithful and normal. Every nonidentity reduced word has infinitely many distinct conjugates: choose a letter $a$ whose powers cause no cancellation at either end of $a^k g a^(- k)$. At most two of the $2 d$ letters are excluded, and the reduced lengths then tend to infinity. Fourier coefficients of a central element are constant on conjugacy classes and form an $ell^2$ vector, so every coefficient off the identity vanishes. Faithfulness of the tracial representation implies that the center consists of scalars. The infinitely many orthonormal group unitaries show that the factor is infinite-dimensional.

=== 2.2 Conjugates of a bounded logarithm <conjugates-of-a-bounded-logarithm>

Fix a freely generating Haar tuple $\( A_1 \, dots.h \, A_n \, C \)$, let $Gamma = bb(F)_n$, and write $A_g$ for the word in the first $n$ variables indexed by $g in Gamma$. Put

#[#set math.equation(numbering: n => "(2.1)")
 $ S = arg \( C \) \, #h(2em) S_g = A_g S A_g^(*) quad \( g in Gamma \) \, $ <eq:logarithm>]

where the argument takes values in $\( - pi \, pi \]$. The bounded Borel functional calculus for normal operators defines this logarithm in $W^(*) \( C \)$; see #cite(label("haase2020")) Theorem 7.1. Since the spectral distribution of $C$ is uniform on the circle,

$ S = S^(*) \, quad ∥S∥ lt.eq pi \, quad tau \( S \) = 0 \, quad e^(upright(i) S) = C \, #h(2em) W^(*) \( S \) = W^(*) \( C \) . $

#thm([Lemma 2.3.])[
  (Freeness of the conjugate components).  #emph[The algebras $A_g W^(*) \( C \) A_g^(*)$, $g in Gamma$, form a free family. In particular, each $S_g$ is free from the von Neumann algebra generated by all $S_b$ with $b eq.not g$.]
] <lem:conjugates>

#proof[
  Consider a product of centered elements $A_(g_j) c_j A_(g_j)^(*)$, with $c_j in W^(*) \( C \)$ and $g_j eq.not g_(j + 1)$. Cyclicity of the trace rewrites its trace as
  $ tau #scale(x: 120%, y: 120%)[\(] c_1 A_(g_1^(- 1) g_2) c_2 dots.h.c A_(g_(r - 1)^(- 1) g_r) c_r A_(g_r^(- 1) g_1) #scale(x: 120%, y: 120%)[\)] . $
  All interior group elements are nonidentity and hence centered. If the last group element is the identity, omit it; otherwise it too is centered. Freeness of $W^(*) \( A_1 \, dots.h \, A_n \)$ and $W^(*) \( C \)$ makes the displayed trace zero. For a single factor this is simply $tau \( c_1 \) = 0$. The assertion about the other components follows by grouping free subalgebras. ◻
]

For a monomial in $A_j \, A_j^(*)$ and $S$, define its #emph[label] as the product in $Gamma$ of its group symbols, read in order with each occurrence of $S$ ignored.

#thm([Lemma 2.4.])[
  (Group labels and traces).  #emph[A monomial with nonidentity label has trace zero. A monomial with identity label can be expressed as a product of variables $S_g$ (or as the constant $1$).]
] <lem:labels>

#proof[
  For the first assertion, combine consecutive group symbols and consecutive powers of $S$. Remove identity group factors. Split each polynomial in $S$ into its scalar trace and a centered part. A term with all alternating factors centered has trace zero by freeness of the group algebra and $W^(*) \( S \)$. Removing a scalar factor permits a reduction to fewer alternating factors, without changing the total group label. Induction on the number of factors ends with either a centered alternating product or a single group element whose label remains nonidentity. Both have trace zero.
  For the second assertion, successively use $A_g S = S_g A_g$ to move every group factor to the right. The final group factor is exactly the label, and is therefore $1$. ◻
]

=== 2.3 A bound independent of support size <a-bound-independent-of-support-size>

For a finitely supported real function $k$ on $Gamma$, set

$ s \( k \) = sum_(g in Gamma) k \( g \) S_g . $

The coefficient norm $∥k∥_(ell^2)$ below is distinguished from the tracial $L^2$ norm $∥dot.op∥_2$ of operators. The next estimate uses the creation, annihilation, and diagonal decomposition underlying free-product Khintchine inequalities; see Ricard and Xu #cite(label("ricard_xu2006")) Section 2, Lemmas 2.1–2.3 and Corollary 2.4. We include the scalar self-adjoint argument to give an explicit constant independent of the number of summands.

#thm([Lemma 2.5.])[
  (Norm of a free sum).  #emph[For every such $k$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ ∥s \( k \)∥ lt.eq K ∥k∥_(ell^2) \, #h(2em) K = 3 pi . $ <eq:free-sum>]

]
] <lem:free-sum>

#proof[
  We prove the more general bound
  #[#set math.equation(numbering: n => "(2.3)")
   $ ∥sum_j z_j∥ lt.eq 2 #scale(x: 180%, y: 180%)[\(] sum_j ∥z_j∥_2^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) + max_j ∥z_j∥ $ <eq:general-free-sum>]
  for a finite free family of subalgebras and centered self-adjoint $z_j$ in the respective components.
  Work in the tracial $L^2$ space of their generated algebra. Freeness identifies this space with the orthogonal sum of the scalar vector and the reduced centered tensor spaces, whose successive component indices are different. To check the identification, take inner products of reduced centered words. If the two letters at the joining point belong to different components, freeness gives zero. If they belong to the same component, split their product into its trace and its centered part; the latter again has zero contribution, while the scalar term shortens both words. Iteration gives orthogonality for different index sequences and the tensor-product inner product for matching sequences. The reduced word span is dense by the argument used in Lemma 4.
  Let $P_j$ project onto the reduced tensors beginning with component $j$, and let $L_(z_j)$ denote left multiplication. On $\( 1 - P_j \) L^2$, multiplication prefixes $z_j$, so
  $ B_j = P_j L_(z_j) \( 1 - P_j \) \, #h(2em) ∥B_j∥ lt.eq ∥z_j∥_2 . $
  The ranges of the $B_j$ are orthogonal. For every vector $xi$ this gives
  $ ∥sum_j B_j xi∥^2 = sum_j ∥B_j xi∥^2 lt.eq #scale(x: 180%, y: 180%)[\(] sum_j ∥z_j∥_2^2 #scale(x: 180%, y: 180%)[\)] ∥xi∥^2 . $
  The blocks in the opposite direction are $B_j^(*)$, because $z_j$ is self-adjoint. The block $\( 1 - P_j \) L_(z_j) \( 1 - P_j \)$ is zero. The remaining diagonal blocks $P_j L_(z_j) P_j$ act on mutually orthogonal subspaces; their sum has norm at most $max_j ∥z_j∥$. Summing these three parts proves (2.3), since the left representation is faithful.
  Apply this bound to $z_g = k \( g \) S_g$. Both $∥S_g∥_2$ and $∥S_g∥$ are at most $pi$, and $max_g lr(|k \( g \)|) lt.eq ∥k∥_(ell^2)$. This proves (2.2). ◻
]

== 3 Trace-preserving polynomial flows <sec:flow>

Voiculescu’s exponentiation theorem turns trace-preserving polynomial vector fields on algebraically free self-adjoint generators into one-parameter automorphism groups #cite(label("voiculescu2002cyclomorphy")) Theorem 3.8. We prove the version needed here directly for Haar unitaries and a fixed bounded logarithm. The proof treats the unitary relations explicitly and derives preservation of all evaluated relations from moment invariance.

Retain the notation of Section 2. Thus $\( A_1 \, dots.h \, A_n \, C \)$ is a freely generating Haar tuple in the finite tracial von Neumann algebra $\( M \, tau \)$, $Gamma = bb(F)_n = chevron.l x_1 \, dots.h \, x_n chevron.r$, and

$ S = arg \( C \) \, #h(2em) S_g = A_g S A_g^(*) \, #h(2em) s \( k \) = sum_(g in Gamma) k \( g \) S_g . $

Write $bb(R)^(\( Gamma \))$ for the finitely supported real functions on $Gamma$, and let $delta_e in ell^2 \( Gamma \)$ be the unit vector at the identity. All coefficient vectors used in this section are finitely supported. The left regular action on them is $\( lambda \( g \) k \) \( b \) = k \( g^(- 1) b \)$.

Choose real coefficient vectors $h_1 \, dots.h \, h_n$. There is a unique cocycle $D : Gamma arrow.r bb(R)^(\( Gamma \))$ satisfying

#[#set math.equation(numbering: n => "(3.1)")
 $ D_(x_j) = h_j \, #h(2em) D_(g b) = D_g + lambda \( g \) D_b . $ <eq:flow-cocycle>]

Indeed, set $D_(x_j^(- 1)) = - lambda \( x_j^(- 1) \) h_j$ and define the value on a word by summing the shifted values of its letters. The two terms associated with an adjacent inverse pair cancel, so the definition respects reduction. The cocycle identity and uniqueness follow.

The next proposition turns small $ell^2$ norms of the $h_j$ into small operator-norm displacements of the generators. For a word $w in Gamma$, a small $parallel D_w - delta_e parallel_(ell^2)$ also makes the time-one image of $A_w$ close to $C A_w$.

#thm([Proposition 3.1.])[
  (Polynomial flow and displacement bounds).  #emph[There is a one-parameter group $\( beta_t \)_(t in bb(R))$ of unital trace-preserving normal $*$-automorphisms of $M$ that fixes $S$ and whose restriction to 
$ B = C^(*) \( A_1 \, dots.h \, A_n \, S \) $

 is point-norm continuous. Writing $A_j \( t \) = beta_t \( A_j \)$ and evaluating group words at this tuple, the paths satisfy 
#[#set math.equation(numbering: n => "(3.2)")
 $ frac(d, d t) A_j \( t \) = upright(i) s_t \( h_j \) A_j \( t \) \, #h(2em) s_t \( k \) = sum_(g in Gamma) k \( g \) A_g \( t \) S A_g \( t \)^(*) \, #h(2em) A_j \( 0 \) = A_j . $ <eq:flow-ode>]

 The derivatives here are in operator norm. With $K = 3 pi$ as in (2.2), for every $t in bb(R)$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ ∥beta_t \( A_j \) - A_j∥ & lt.eq \| t \| K parallel h_j parallel_(ell^2) \,\
∥beta_t \( A_w \) - exp \( upright(i) t S \) A_w∥ & lt.eq \| t \| K parallel D_w - delta_e parallel_(ell^2) #h(2em) \( w in Gamma \) . $ <eq:generator-displacement>]

 In particular, at $t = 1$ the target in (3.3) is $C A_w$.]
] <prop:flow>

We first establish a trace identity on a formal polynomial algebra. This will prove invariance along the actual flow without assuming freeness of the evolving tuple.

=== 3.1 The formal derivation and its trace identity <the-formal-derivation-and-its-trace-identity>

Let $cal(P)$ be the complex unital $*$-algebra generated by unitaries $a_1 \, dots.h \, a_n$ and a self-adjoint symbol $z$, subject only to these unitary and self-adjoint relations. Put

$ z_g = a_g z a_g^(*) \, #h(2em) sigma \( k \) = sum_g k \( g \) z_g . $

Here $a_g$ is the group word in the formal unitaries. Evaluation at $\( A_1 \, dots.h \, A_n \, S \)$ defines a $*$-homomorphism $"ev"_0 : cal(P) arrow.r B$; we make no assumption about its kernel.

Define a complex-linear derivation by the rules

#[#set math.equation(numbering: n => "(3.4)")
 $ delta z = 0 \, #h(2em) delta a_j = upright(i) sigma \( h_j \) a_j \, #h(2em) delta a_j^(*) = - upright(i) a_j^(*) sigma \( h_j \) . $ <eq:formal-derivation>]

These rules define a $*$-derivation on $cal(P)$. The reality of $h_j$ makes $sigma \( h_j \)$ self-adjoint, so the rules respect adjoints. They also respect the defining unitary relations: for example,

$ delta \( a_j^(*) a_j \) = - upright(i) a_j^(*) sigma \( h_j \) a_j + upright(i) a_j^(*) sigma \( h_j \) a_j = 0 \, $

and the calculation for $a_j a_j^(*)$ is the same. The identity $a_g sigma \( k \) a_g^(*) = sigma \( lambda \( g \) k \)$ and the cocycle rule give

#[#set math.equation(numbering: n => "(3.5)")
 $ delta a_g = upright(i) sigma \( D_g \) a_g \, #h(2em) delta z_g = upright(i) \[ sigma \( D_g \) \, z_g \] . $ <eq:formal-word-derivative>]

For instance, multiplying the formulas for $g$ and $b$ gives the formula for $g b$ with coefficient $D_g + lambda \( g \) D_b$; inverse letters are covered by the unitary relations.

#thm([Lemma 3.2.])[
  (Universal initial trace identity).  #emph[For every $p in cal(P)$ and every integer $r gt.eq 1$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ tau #scale(x: 120%, y: 120%)[\(] "ev"_0 \( delta^r p \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:universal-trace-identity>]

]
] <lem:flow-trace-identity>

#proof[
  First take $r = 1$. Give a monomial its group label by ignoring each occurrence of $z$ and multiplying the remaining group symbols in order. Each term of $sigma \( k \)$ has label $e$. The replacement rules (3.4) consequently preserve a monomial’s label term by term. If that label is nonidentity, Lemma 6 makes every evaluated derivative term have trace zero.
  An identity-label monomial is a polynomial in the $z_g$. To see this algebraically, repeatedly use $a_g z = z_g a_g$ to move group factors to the right; the final group factor is the identity. Because these are identities in $cal(P)$ and $delta$ is a derivation on that algebra, differentiating this rewriting gives the same result as differentiating the original monomial. It is therefore enough to consider $p = F \( z_g : g in I \)$, with $I subset Gamma$ finite and $F$ a noncommutative polynomial.
  For a fixed $g in I$, remove the commuting own-variable term from the commutator in (3.5). Its evaluated direction is
  $ "ev"_0 \( delta z_g \) = upright(i) \[ Y_g \, S_g \] \, #h(2em) Y_g = sum_(b eq.not g) D_g \( b \) S_b . $
  The element $Y_g$ is a bounded self-adjoint in $B_g = W^(*) \( S_b : b eq.not g \)$, and $W^(*) \( S_g \)$ is free from $B_g$ by Lemma 5.
  We use the following direct consequence of freeness. If a unital subalgebra $cal(A)$ is free from a unital subalgebra $cal(B)$ and $U in cal(B)$ is unitary, then $U cal(A) U^(*)$ is free from $cal(B)$. Indeed, conjugating an alternating product of centered elements from these two algebras by $U^(*)$ gives an alternating product of centered elements from $cal(A)$ and $cal(B)$: a fixed centered $b in cal(B)$ becomes $U^(*) b U$, which is still centered in $cal(B)$. Its trace is zero. Conjugation preserves the marginal law of each element of $cal(A)$. Since freeness determines mixed moments from the marginal laws, it follows that replacing $S_g$ by $U S_g U^(*)$ preserves its joint law with any fixed collection of elements of $B_g$.
  Apply this observation with $U = exp \( upright(i) u Y_g \)$ for real $u$. The scalar function obtained by replacing every occurrence of $S_g$ in $F$ by $exp \( upright(i) u Y_g \) S_g exp \( - upright(i) u Y_g \)$ and leaving all other variables fixed has constant trace. Its derivative at zero is the trace of the sum over those occurrences with the direction $upright(i) \[ Y_g \, S_g \]$ inserted. Sum these zero derivatives over $g in I$. The product rule and (3.5) identify the sum exactly with $tau \( "ev"_0 \( delta p \) \)$, proving the case $r = 1$. Linearity handles arbitrary finite sums of monomials.
  The result just proved is the identity $tau compose "ev"_0 compose delta = 0$ on all of $cal(P)$. Since $delta$ maps finite polynomials to finite polynomials, applying it to $delta^(r - 1) p$ proves (3.6). In this application every derivative of every coefficient polynomial is included. The auxiliary conjugations above are used only to compute a first variation at the initial tuple; they need neither lift to motions of the $a_j$ nor be jointly integrated. ◻
]

=== 3.2 Global solutions and actual moment invariance <global-solutions-and-actual-moment-invariance>

We now solve the polynomial equation globally in $B$ and use analyticity to turn the initial trace identity into moment invariance. For a tuple $X = \( X_1 \, dots.h \, X_n \)$, let $X_g$ denote the reduced group word evaluated in a $*$-algebra using adjoints for inverse letters. This notation defines a polynomial even for nonunitary tuples, so the right side of (3.2) defines the finite polynomial vector field

$ cal(V)_j \( X \) = upright(i) H_j \( X \) X_j \, #h(2em) H_j \( X \) = sum_g h_j \( g \) X_g S X_g^(*) . $

#thm([Lemma 3.3.])[
  (Global solvability in a generated subalgebra).  #emph[Let $E$ be any closed unital $C^(*)$-subalgebra of $M$ containing $S$, and let $V_1 \, dots.h \, V_n$ be unitaries in $E$. The equation $X' = cal(V) \( X \)$ with $X \( 0 \) = V$ has a unique global solution in $E^n$ that is smooth in norm, and all its coordinates remain unitary.]
] <lem:flow-global-ode>

#proof[
  Regard $E^n$, with its maximum norm, as a real Banach space. Adjunction is bounded and real-linear, so $cal(V)$ is a finite smooth polynomial map. Its norm and its Lipschitz constant are bounded on every fixed bounded ball. Picard iteration on a sufficiently short interval gives a unique local solution; repeated differentiation makes it smooth.
  Each $H_j \( X \)$ is self-adjoint, even before unitarity is known. Along a local solution,
  $ frac(d, d t) \( X_j^(*) X_j \) = - upright(i) X_j^(*) H_j \( X \) X_j + upright(i) X_j^(*) H_j \( X \) X_j = 0 . $
  Thus $X_j^(*) X_j = 1$. Such an isometry is unitary in $M$: the projection $1 - X_j X_j^(*)$ has trace $1 - tau \( X_j^(*) X_j \) = 0$, and faithfulness makes it zero. This equality also holds in $E$, so $∥X_j∥ = 1$ throughout the local solution.
  On this unitary trajectory,
  $ ∥X'_j∥ lt.eq ∥S∥ sum_g \| h_j \( g \) \| . $
  If a maximal interval had a finite endpoint, this bounded derivative would make the tuple norm-Cauchy as time approached that endpoint. Its limit lies in the closed algebra $E$ and is again a unitary tuple. Local existence at the limit continues the solution, a contradiction. The same argument applies at either endpoint, giving a global solution. Uniqueness follows from local uniqueness on overlapping intervals. This continuation uses completeness and bounded derivative, not compactness of a bounded ball. ◻
]

Apply Lemma 10 in $E = B$ with initial tuple $A$. Let $A \( t \)$ be its solution and let $"ev"_t : cal(P) arrow.r B$ evaluate the formal generators at $A \( t \) \, S$. Unitarity makes this a well-defined evaluation on the formal algebra for each $t$.

#thm([Lemma 3.4.])[
  (Moment invariance).  #emph[For every $p in cal(P)$ and $t in bb(R)$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ tau #scale(x: 120%, y: 120%)[\(] "ev"_t \( p \) #scale(x: 120%, y: 120%)[\)] = tau #scale(x: 120%, y: 120%)[\(] "ev"_0 \( p \) #scale(x: 120%, y: 120%)[\)] . $ <eq:flow-moments>]

]
] <lem:flow-moments>

#proof[
  The differential equation and the product rule give, for every integer $r gt.eq 0$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ frac(d^r, d t^r) "ev"_t \( p \) = "ev"_t \( delta^r p \) . $ <eq:flow-iterated-derivatives>]
  We verify that these derivatives give an actual convergent Taylor expansion for the trace.
  Choose fixed polynomial representatives for the derivatives of the formal letters in (3.4). There are constants $J gt.eq 1$ and $B_1 gt.eq 1$ such that replacing any one letter by its derivative increases monomial length by at most $J$ and produces total absolute coefficient sum at most $B_1$. These constants are finite because the $h_j$ have finite support. If a representative of $p$ has degree at most $l$, where $l gt.eq 1$, and total absolute coefficient sum $b_0$, repeated replacement gives a representative of $delta^r p$ with degree at most $l + r J$ and coefficient sum at most
  $ b_0 B_1^r product_(v = 0)^(r - 1) \( l + v J \) . $
  Let $R = max \( 1 \, ∥S∥ \)$. All the evaluated group letters are unitary, so (3.8) implies, uniformly for real $t$,
  #[#set math.equation(numbering: n => "(3.9)")
   $ frac(1, r !) ∥frac(d^r, d t^r) "ev"_t \( p \)∥ & lt.eq b_0 R^l \( B_1 R^J \)^r frac(product_(v = 0)^(r - 1) \( l + v J \), r !)\
 & lt.eq b_0 R^l #scale(x: 120%, y: 120%)[\[] B_1 R^J \( l + J \) #scale(x: 120%, y: 120%)[\]]^r . $ <eq:flow-analytic-bound>]
  The last inequality uses $l + v J lt.eq \( l + J \) \( v + 1 \)$.
  Set $f_p \( t \) = tau \( "ev"_t \( p \) \)$ and $c_p = B_1 R^J \( l + J \)$. The integral form of Taylor’s remainder and (3.9) bound the remainder after degree $r$ at increment $u$ by $b_0 R^l \( c_p \| u \| \)^(r + 1)$. Consequently $f_p$ is real-analytic near every real time, with positive radius at least $c_p^(- 1)$. By Lemma 9, all its positive-order derivatives at zero vanish. It is constant near zero and hence, by real-analytic continuation on the connected line $bb(R)$, constant everywhere.
  The constants here may depend on the fixed field and on $p$. No radius common to all polynomials or to different choices of the $h_j$ is required. The bounds used only unitarity of the solution and boundedness of $S$; freeness at positive times has not been assumed. ◻
]

=== 3.3 Surjectivity, normal extension, and estimates <surjectivity-normal-extension-and-estimates>

#proof[
  For a fixed real $t$, polynomial evaluation defines a map
  $ phi_t : "ev"_0 \( cal(P) \) arrow.r B \, #h(2em) phi_t #scale(x: 120%, y: 120%)[\(] "ev"_0 \( p \) #scale(x: 120%, y: 120%)[\)] = "ev"_t \( p \) . $
  This is well defined. If $"ev"_0 \( p \) = 0$, then (3.7) applied to $p^(*) p$ gives
  $ tau #scale(x: 120%, y: 120%)[\(] "ev"_t \( p \)^(*) "ev"_t \( p \) #scale(x: 120%, y: 120%)[\)] = 0 \, $
  so faithfulness implies $"ev"_t \( p \) = 0$. Thus any additional relations at the evaluated initial tuple are respected as a consequence of actual moment invariance. The map is unital, complex-linear, multiplicative, and adjoint-preserving because formal evaluation has those properties.
  For an element $b$ of a finite von Neumann algebra with faithful tracial state,
  $ ∥b∥ = lim_(k arrow.r oo) tau \( \( b^(*) b \)^k \)^(1 \/ \( 2 k \)) . $
  For completeness, the upper bound is immediate; for the lower bound, every nonzero spectral projection of $b^(*) b$ sufficiently near its norm has positive trace by faithfulness. Applying (3.7) to $\( p^(*) p \)^k$ therefore shows that $phi_t$ is isometric. It extends uniquely to a trace-preserving isometric $*$-homomorphism on $B$, with range
  $ B_t = C^(*) \( A_1 \( t \) \, dots.h \, A_n \( t \) \, S \) . $
  Indeed, its range is closed and is the norm closure of the polynomials in these time-$t$ generators.
  We next prove $B_t = B$, which establishes surjectivity. Apply Lemma 10 inside $B_t$ to the initial tuple $A \( t \)$, using the same fixed element $S$ and the same polynomial field. Its global solution, viewed in $M$, must be $u mapsto A \( t + u \)$ by uniqueness. At $u = - t$ it recovers the original tuple. Thus every $A_j$ belongs to $B_t$, and $S$ already belongs to $B_t$, giving $B subset.eq B_t$. The forward construction gives the reverse inclusion. Hence $phi_t$ is a $C^(*)$-automorphism of $B$ fixing $S$.
  Since $exp \( upright(i) S \) = C$, the von Neumann algebra generated by $B$ is $M$. Its vectors are therefore dense in $L^2 \( M \, tau \)$, as in the density argument in Lemma 4. Trace preservation and surjectivity define a Hilbert-space unitary
  $ U_t \[ b \] = \[ phi_t \( b \) \] #h(2em) \( b in B \) $
  on $L^2 \( M \, tau \)$, fixing $\[ 1 \]$. If $L_b$ denotes left multiplication, then on the dense set of vectors coming from $B$,
  $ U_t L_b U_t^(*) = L_(phi_t \( b \)) #h(2em) \( b in B \) . $
  The faithful normal left representation identifies the von Neumann closure of $L \( B \)$ with $M$. Conjugation by $U_t$ therefore gives a normal $*$-automorphism $beta_t$ of $M$ extending $phi_t$. It is trace-preserving because $U_t$ fixes $\[ 1 \]$, and it fixes $S$. This normal extension is unique by ultraweak density of $B$.
  The maps form a one-parameter group. For fixed $s$, the path $t mapsto phi_s \( A \( t \) \)$ satisfies the same polynomial equation, because $phi_s$ is a bounded $*$-homomorphism fixing $S$. Its initial tuple is $A \( s \)$, so uniqueness gives
  $ phi_s \( A_j \( t \) \) = A_j \( s + t \) . $
  The equality on the generators and on $S$ yields $phi_s phi_t = phi_(s + t)$ on $B$, and uniqueness of normal extension gives $beta_s beta_t = beta_(s + t)$ on $M$. Also $beta_0$ is the identity. Norm continuity on polynomials in the generators follows from the solution paths; density and the common isometry bound extend it to point-norm continuity on $B$. No point-norm continuity on arbitrary elements of $M$ is needed.
  It remains to prove the bounds. For each finitely supported real $k$,
  $ s_t \( k \) = beta_t \( s \( k \) \) \, #h(2em) ∥s_t \( k \)∥ = ∥s \( k \)∥ lt.eq K parallel k parallel_(ell^2) $
  by (2.2). Integrating $∥A'_j \( t \)∥ lt.eq K parallel h_j parallel_(ell^2)$ between zero and $t$ proves (3.3).
  For a fixed $w in Gamma$, evaluation of (3.5) along the flow gives
  $ frac(d, d t) A_w \( t \) = upright(i) s_t \( D_w \) A_w \( t \) . $
  Moreover $s_t \( delta_e \) = S$. Direct differentiation, with the order of factors retained, yields
  $ frac(d, d t) #scale(x: 120%, y: 120%)[\(] exp \( - upright(i) t S \) A_w \( t \) #scale(x: 120%, y: 120%)[\)] = upright(i) exp \( - upright(i) t S \) #scale(x: 120%, y: 120%)[\(] s_t \( D_w \) - S #scale(x: 120%, y: 120%)[\)] A_w \( t \) . $
  The exterior factors are unitary, so its norm is at most $K parallel D_w - delta_e parallel_(ell^2)$. Integrating between zero and $t$ and multiplying on the left by $exp \( upright(i) t S \)$ proves (3.3). ◻
]

== 4 A small cocycle with a prescribed word value <sec:cocycle>

Let $n gt.eq 3$ and $Gamma = bb(F)_n$, with free generators $x_1 \, dots.h \, x_n$. We use the left regular action on coefficient vectors,

$ \( lambda \( g \) h \) \( b \) = h \( g^(- 1) b \) \, #h(2em) g \, b in Gamma \, $

and write $tau_Gamma \( X \) = chevron.l X delta_e \, delta_e chevron.r$ for the canonical trace on $L \( Gamma \)$. Given finitely supported real vectors $h_1 \, dots.h \, h_n$, let $D$ be the cocycle determined by

$ D_(x_j) = h_j \, #h(2em) D_(g b) = D_g + lambda \( g \) D_b . $

The construction in this section makes both $h_1$ and $D_w - delta_e$ small in $ell^2 \( Gamma \)$, with all the other generator coefficients zero. At time one, Proposition 8 converts these two coefficient bounds into operator-norm bounds for the generator displacement and the error between the moved word and $C A_w$. The word $w$ and the support of $h_1$ are allowed to depend on the required accuracy. This coefficient rule is the cocycle form of Fox’s free differential calculus #cite(label("fox1953")) Section 1, equations $\( 1.2 \)'$, (1.5)–(1.6), and Section 2, equations (2.1)–(2.2): successive letters contribute their generator coefficients translated by the preceding prefix. We use that rule explicitly below.

#thm([Lemma 4.1.])[
  (Small coefficients with a prescribed word value).  #emph[Let $n gt.eq 3$ and $eta > 0$. There exist a word $w in Gamma$ and a finitely supported real coefficient vector $h$ such that the cocycle determined by 
$ h_1 = h \, #h(2em) h_j = 0 quad \( 2 lt.eq j lt.eq n \) $

 satisfies 
#[#set math.equation(numbering: n => "(4.1)")
 $ parallel h parallel_(ell^2) < eta \, #h(2em) parallel D_w - delta_e parallel_(ell^2) < eta . $ <eq:small-cocycle>]

]
] <lem:small-cocycle>

=== 4.1 Free prefix words <free-prefix-words>

For $j gt.eq 1$, set

#[#set math.equation(numbering: n => "(4.2)")
 $ a = x_1 \, #h(2em) b_j = x_2^j x_3 x_2^(- j) \, #h(2em) p_0 = e \, #h(2em) p_j = \( a b_1 \) dots.h.c \( a b_j \) . $ <eq:cocycle-prefixes>]

For $m gt.eq 1$ also set

#[#set math.equation(numbering: n => "(4.3)")
 $ w_m = p_m a \, #h(2em) T_m = 1 + sum_(j = 1)^m lambda \( p_j \) . $ <eq:cocycle-word-operator>]

#thm([Lemma 4.2.])[
  (Free prefixes and the cocycle value).  #emph[For each $m gt.eq 1$, the elements $p_1 \, dots.h \, p_m$ freely generate a free subgroup of $Gamma$. If $h_1 = h$ and $h_j = 0$ for $j gt.eq 2$, then 
#[#set math.equation(numbering: n => "(4.4)")
 $ D_(w_m) = T_m h . $ <eq:cocycle-word-value>]

]
] <lem:cocycle-prefixes>

#proof[
  First consider a nonempty reduced word in $b_1 \, dots.h \, b_m$. Combining consecutive powers with the same index writes it as
  $ b_(j_1)^(q_1) dots.h.c b_(j_l)^(q_l) \, #h(2em) q_i in bb(Z) \\ { 0 } \, #h(2em) j_i eq.not j_(i + 1) . $
  Its expansion in $x_2 \, x_3$ is
  $ x_2^(j_1) x_3^(q_1) x_2^(j_2 - j_1) x_3^(q_2) dots.h.c x_2^(j_l - j_(l - 1)) x_3^(q_l) x_2^(- j_l) . $
  Every displayed $x_3$ power is nonzero, and each intervening $x_2$ power is nonzero. This word cannot reduce to the identity. Thus the $b_j$ are a free basis of the subgroup they generate. The free product decomposition
  $ Gamma = chevron.l a chevron.r * chevron.l x_2 \, dots.h \, x_n chevron.r $
  then shows that $a \, b_1 \, dots.h \, b_m$ freely generate their subgroup: an alternating product of nonidentity elements from $chevron.l a chevron.r$ and $chevron.l b_1 \, dots.h \, b_m chevron.r$ is also reduced in the displayed free product.
  In the abstract free group on $a \, b_1 \, dots.h \, b_m$, the substitution fixing $a$ and sending each $b_j$ to $a b_j$ has inverse given by $b_j mapsto a^(- 1) b_j$, again fixing $a$. Consequently
  $ u_j = a b_j \, #h(2em) 1 lt.eq j lt.eq m \, $
  form a free family. On the abstract free group with free basis $u_1 \, dots.h \, u_m$, define two endomorphisms by
  $ phi \( u_j \) = u_1 dots.h.c u_j \, #h(2em) psi \( u_1 \) = u_1 \, #h(2em) psi \( u_j \) = u_(j - 1)^(- 1) u_j quad \( j gt.eq 2 \) . $
  For every $j$, cancellation gives
  $ psi phi \( u_j \) & = u_1 \( u_1^(- 1) u_2 \) dots.h.c \( u_(j - 1)^(- 1) u_j \) = u_j \,\
phi psi \( u_j \) & = \( u_1 dots.h.c u_(j - 1) \)^(- 1) \( u_1 dots.h.c u_j \) = u_j quad \( j gt.eq 2 \) \, $
  and the second identity also holds for $j = 1$. Thus $phi$ and $psi$ are inverse automorphisms. Since $p_j = u_1 dots.h.c u_j$, this proves the assertion about the $p_j$.
  For the cocycle assertion, the inverse rule $D_(x_j^(- 1)) = - lambda \( x_j^(- 1) \) D_(x_j)$ shows that $D$ vanishes on the subgroup generated by $x_2 \, dots.h \, x_n$. In particular, $D_(b_j) = 0$. The positive occurrences of $a$ in $w_m$ have respective prefixes $p_0 \, p_1 \, dots.h \, p_m$, and there are no other occurrences of $a$ or $a^(- 1)$. Applying the cocycle identity successively therefore gives
  $ D_(w_m) = sum_(j = 0)^m lambda \( p_j \) h = T_m h . $
  ◻
]

=== 4.2 The spectral measures of the prefix sums <the-spectral-measures-of-the-prefix-sums>

Put

#[#set math.equation(numbering: n => "(4.5)")
 $ Q_m = T_m T_m^(*) \, #h(2em) mu_m \( B \) = tau_Gamma #scale(x: 120%, y: 120%)[\(] 1_B \( Q_m \/ m \) #scale(x: 120%, y: 120%)[\)] $ <eq:cocycle-positive-operator>]

for Borel sets $B subset.eq \[ 0 \, oo \)$. These are probability measures by the spectral theorem and the normalization of $tau_Gamma$.

We seek a small vector $h$ with $T_m h$ close to $delta_e$. The spectral limit below has no atom at zero. It will let us choose a small fixed cutoff in the normalized spectrum and then make $m$ large enough that the discarded projection has small trace. On the remaining spectrum, the inverse of $Q_m$ has norm at most a fixed constant times $m^(- 1)$. The inverse bound controls the coefficient norm, while the discarded trace controls the approximation error. The Catalan count below is the moment calculation associated with circular systems in Voiculescu’s free-probability framework; see #cite(label("voiculescu1985")) and #cite(label("voiculescu1990")) Definition 1.9 and Remark 1.11. We give the word count and the normalization of the limiting density explicitly.

#thm([Lemma 4.3.])[
  (Spectral limit of the prefix sums).  #emph[The measures $mu_m$ converge weakly to the probability measure 
#[#set math.equation(numbering: n => "(4.6)")
 $ d nu \( x \) = frac(1, 2 pi) sqrt(frac(4 - x, x)) thin 1_(\( 0 \, 4 \)) \( x \) thin d x . $ <eq:cocycle-limit-density>]

 In particular, $nu \( { 0 } \) = 0$.]
] <lem:cocycle-spectrum>

#proof[
  Write $V_j = lambda \( p_j \)$ and $V_0 = 1$. Lemma 13 implies that a word in $V_1 \, dots.h \, V_m$ and their inverses has trace one if its word in these free symbols reduces to the identity, and trace zero otherwise. This trace rule applies inside the given regular representation. Indeed, for $H = chevron.l p_1 \, dots.h \, p_m chevron.r$, the spaces $ell^2 \( H t \)$, as $H t$ ranges over the right cosets of $H$, are reducing copies of the left regular representation of $H$. The vector $delta_e$ lies in the copy $ell^2 \( H \)$. Its vector state therefore agrees with the canonical trace of $H$ on polynomials and on the spectral projections under consideration.
  Fix an integer $r gt.eq 1$. Expanding $Q_m^r$ gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ tau_Gamma \( Q_m^r \) = sum_(i_1 \, dots.h \, i_(2 r) in { 0 \, dots.h \, m }) tau_Gamma #scale(x: 120%, y: 120%)[\(] V_(i_1) V_(i_2)^(*) dots.h.c V_(i_(2 r - 1)) V_(i_(2 r))^(*) #scale(x: 120%, y: 120%)[\)] . $ <eq:cocycle-moment-expansion>]
  Each summand is zero or one. In a summand equal to one, every nonzero index used must occur at least twice, since a generator occurring only once cannot disappear under free reduction. There are therefore at most $r$ distinct nonzero indices.
  If exactly $r$ distinct nonzero indices occur, all $2 r$ positions are nonidentity and each index occurs exactly twice. The two occurrences have opposite exponents, as follows already by abelianizing the identity word. Pair the two positions with the same index. This matching is unique for the chosen word. A sequence of adjacent inverse cancellations produces a noncrossing matching: a pair deleted after other pairs can only enclose pairs already deleted, and two deleted pairs cannot cross. Conversely, a noncrossing matching with opposite exponents at its endpoints reduces to the identity by deleting an innermost pair and proceeding by induction. Every noncrossing perfect matching of ${ 1 \, dots.h \, 2 r }$ has opposite parity at the two endpoints of each pair. To see this, the positions strictly inside that pair must be matched among themselves, so their number is even. The signs in (4.7) alternate; therefore every noncrossing perfect matching has the required opposite signs.
  The number of noncrossing perfect matchings is
  $ "Cat"_r = frac(1, r + 1) binom(2 r, r) . $
  For completeness, splitting a matching at the partner of its first position gives the recurrence $c_0 = 1$ and $c_r = sum_(j = 0)^(r - 1) c_j c_(r - 1 - j)$. Its formal generating series satisfies $C \( z \) = 1 + z C \( z \)^2$, so the solution with constant term one is $\( 1 - sqrt(1 - 4 z) \) \/ \( 2 z \)$; the binomial expansion gives the displayed coefficient $"Cat"_r$. For each matching, labeling its $r$ pairs with distinct indices from ${ 1 \, dots.h \, m }$ gives
  $ \( m \)_r = m \( m - 1 \) dots.h.c \( m - r + 1 \) $
  choices, with the value zero when $m < r$. Ordering the pairs by their first endpoints makes this count unambiguous, and the uniqueness of the equal-index matching prevents double counting. Thus the contribution from exactly $r$ distinct indices is $"Cat"_r \( m \)_r$.
  Every remaining contributing term has at most $r - 1$ distinct nonzero indices. This includes every term with an identity summand: such a term has at most $2 r - 1$ nonidentity positions, while each index it uses occurs at least twice. For fixed $r$, there are only finitely many patterns specifying the identity positions and the partition of the other positions into equal-index classes. A pattern with $k lt.eq r - 1$ classes has at most $m^k$ labelings. Summing over those patterns gives an $O_r \( m^(r - 1) \)$ bound, with its constant depending only on $r$. We have proved
  #[#set math.equation(numbering: n => "(4.8)")
   $ tau_Gamma \( Q_m^r \) = "Cat"_r \( m \)_r + O_r \( m^(r - 1) \) \, #h(2em) integral x^r thin d mu_m \( x \) arrow.r "Cat"_r . $ <eq:cocycle-catalan-moments>]
  We next justify passage from moments to weak convergence. For $r = 1$, direct expansion gives $tau_Gamma \( Q_m \) = m + 1$, so the first moments of $mu_m$ are bounded by two. Markov’s inequality gives tightness on $\[ 0 \, oo \)$. For each fixed integer $r gt.eq 1$, the moment convergence in (4.8), applied also at $r + 1$, gives
  $ sup_m integral x^(r + 1) thin d mu_m \( x \) < oo \, #h(2em) sup_m integral_(\( R \, oo \)) x^r thin d mu_m \( x \) lt.eq 1 / R sup_m integral x^(r + 1) thin d mu_m \( x \) arrow.r 0 $
  as $R arrow.r oo$. Consequently, if a subsequence converges weakly to a probability measure $mu$, its moments pass to the limit. More explicitly, apply weak convergence to the bounded continuous functions $min { x^r \, R^r }$ and use the displayed tail bound; the corresponding bound for $mu$ follows by first applying weak convergence to bounded truncations of $x^(r + 1)$. Letting $R arrow.r oo$ proves
  #[#set math.equation(numbering: n => "(4.9)")
   $ integral x^r thin d mu \( x \) = "Cat"_r #h(2em) \( r gt.eq 0 \) . $ <eq:cocycle-subsequence-moments>]
  The density in (4.6) realizes these moments, including the zeroth moment. Write $B \( a \, b \) = integral_0^1 t^(a - 1) \( 1 - t \)^(b - 1) thin d t$ for the Euler beta integral. The substitution $x = 4 t$ and the beta integral give, for every integer $r gt.eq 0$,
  $ frac(1, 2 pi) integral_0^4 x^(r - 1 \/ 2) \( 4 - x \)^(1 \/ 2) thin d x & = frac(4^(r + 1), 2 pi) B (r + 1 / 2 \, 3 / 2)\
 & = frac(\( 2 r \) !, r ! \( r + 1 \) !) = "Cat"_r . $
  The middle equality follows from $B \( 1 / 2 \, 3 / 2 \) = pi \/ 2$ and the recurrence $B \( a + 1 \, b \) = a B \( a \, b \) \/ \( a + b \)$. In particular the density has total mass one.
  These moments determine a probability measure on $\[ 0 \, oo \)$ uniquely. Indeed, $"Cat"_r lt.eq 4^r$. If a measure satisfying (4.9) had mass $c > 0$ on $\[ 4 + epsilon.alt \, oo \)$ for some $epsilon.alt > 0$, then
  $ 4^r gt.eq "Cat"_r gt.eq c \( 4 + epsilon.alt \)^r $
  for every $r$, a contradiction for large $r$. Its support is therefore contained in $\[ 0 \, 4 \]$. On this compact interval, uniform polynomial approximation of continuous functions shows that equality of all moments implies equality of the measures. Every subsequential weak limit is consequently $nu$. Tightness now gives weak convergence of the full sequence $mu_m$ to $nu$. Finally, $nu$ has the displayed integrable density and thus has no atom at zero. ◻
]

=== 4.3 Cutoff inversion and finite coefficients <cutoff-inversion-and-finite-coefficients>

#proof[
  Use the operators $T_m \, Q_m$ and the measures $mu_m$ above. Since $nu \( { 0 } \) = 0$, choose a fixed $d > 0$ so small that
  $ nu \( \[ 0 \, d \] \) < eta^2 / 16 . $
  The interval $\[ 0 \, d \]$ is closed, so weak convergence and the Portmanteau inequality give
  $ limsup_(m arrow.r oo) mu_m \( \[ 0 \, d \] \) lt.eq nu \( \[ 0 \, d \] \) < eta^2 / 16 . $
  We may therefore choose $m$ sufficiently large that both
  #[#set math.equation(numbering: n => "(4.10)")
   $ mu_m \( \[ 0 \, d \] \) < eta^2 / 8 \, #h(2em) frac(1, d m) < eta^2 / 16 $ <eq:cocycle-cutoff-choices>]
  hold. Keep this $d$ and this $m$ fixed for the remainder of the construction.
  Set
  $ E_m = 1_(\( d m \, oo \)) \( Q_m \) \, #h(2em) R_m = f_m \( Q_m \) \, #h(2em) f_m \( x \) = cases(delim: "{", 0 \, & 0 lt.eq x lt.eq d m \,, x^(- 1) \, & x > d m .) $
  Thus $R_m$ is a bounded positive operator, with $∥R_m∥ lt.eq \( d m \)^(- 1)$. The spectral theorem gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ Q_m R_m = E_m \, #h(2em) R_m Q_m R_m = R_m \, #h(2em) tau_Gamma \( 1 - E_m \) = mu_m \( \[ 0 \, d \] \) . $ <eq:cocycle-cutoff-identities>]
  In particular, these operations allow a kernel or arbitrarily small nonzero spectrum of $Q_m$. Define the coefficient vector
  $ h^(\( 0 \)) = T_m^(*) R_m delta_e in ell^2 \( Gamma \) . $
  Using $Q_m = T_m T_m^(*)$ in the indicated order gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ T_m h^(\( 0 \)) & = E_m delta_e \,\
parallel T_m h^(\( 0 \)) - delta_e parallel_(ell^2)^2 & = tau_Gamma \( 1 - E_m \) < eta^2 / 8 \,\
parallel h^(\( 0 \)) parallel_(ell^2)^2 & = chevron.l R_m Q_m R_m delta_e \, delta_e chevron.r = tau_Gamma \( R_m \) lt.eq frac(1, d m) < eta^2 / 16 . $ <eq:cocycle-cutoff-target>]
  The vector $h^(\( 0 \))$ has real coefficients. To check this directly, let $J$ denote coefficientwise complex conjugation on $ell^2 \( Gamma \)$. Each left shift is real in the standard basis, so $J$ commutes with $T_m \, T_m^(*)$ and $Q_m$, and $J delta_e = delta_e$. Commutation with real polynomials in $Q_m$ extends by uniform approximation to real continuous functions of $Q_m$. The continuous functions
  $ x mapsto min { 1 \, max { 0 \, l \( x - d m \) } } \, #h(2em) l = 1 \, 2 \, dots.h \, $
  converge pointwise, with a uniform bound, to $1_(\( d m \, oo \)) \( x \)$ on the spectrum of $Q_m$. Their functional calculi converge strongly to $E_m$, hence $J$ also commutes with $E_m$. Finally,
  $ R_m = E_m g_m \( Q_m \) \, #h(2em) g_m \( x \) = frac(1, max { d m \, x }) \, $
  where $g_m$ is real and continuous on $\[ 0 \, oo \)$. Thus $J$ commutes with $R_m$ as well, proving $J h^(\( 0 \)) = h^(\( 0 \))$.
  Real finitely supported coefficient vectors are dense in the real subspace of $ell^2 \( Gamma \)$. Choose such a vector $h$ with
  $ parallel h - h^(\( 0 \)) parallel_(ell^2) < frac(eta, 4 \( m + 1 \)) . $
  The elementary bound $∥T_m∥ lt.eq m + 1$ and (4.12)–(4.12) yield
  $ parallel h parallel_(ell^2) & < eta / 4 + frac(eta, 4 \( m + 1 \)) < eta \,\
parallel T_m h - delta_e parallel_(ell^2) & < eta / sqrt(8) + eta / 4 < eta . $
  For this finitely supported $h$, form the cocycle with $h_1 = h$ and all other generator values zero, and take $w = w_m$. Equation (4.4) gives $D_w = T_m h$, proving (4.1).
  The choices have been made in the order $d$, then $m$, then the finite coefficient approximation. The last approximation uses the norm of the already fixed operator $T_m$; the lemma requires no bound on the support size of $h$ uniform in $eta$. ◻
]

== 5 Perturbation and a generating limit <sec:generation>

We combine the flow estimate with the small-cocycle construction to approximate the extra generator by a word in a slightly perturbed $n$-tuple. We then arrange these approximations so that the limiting $n$-tuple generates the entire von Neumann algebra. We call $C$ a #emph[completion] of $A = \( A_1 \, dots.h \, A_n \)$ when $\( A \, C \)$ is a freely generating Haar tuple in $M$.

=== 5.1 One-step perturbation <one-step-perturbation>

#thm([Proposition 5.1.])[
  (Approximating the extra generator in one step).  #emph[Let $n gt.eq 3$, and let $\( A_1 \, dots.h \, A_n \, C \)$ be a freely generating Haar tuple in a finite von Neumann algebra $\( M \, tau \)$. For every $epsilon > 0$ there are a trace-preserving normal automorphism $alpha$ of $M$ and a word $w in bb(F)_n$ such that, with $A'_j = alpha \( A_j \)$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ max_(1 lt.eq j lt.eq n) ∥A'_j - A_j∥ < epsilon \, #h(2em) ∥A'_w - C∥ < epsilon . $ <eq:perturbation>]

 The tuple $\( A'_1 \, dots.h \, A'_n \, C' \)$, where $C' = alpha \( C \)$, is again freely generating Haar. Here the target in the second estimate is the original $C$; the new completion is 
$ C' = C A_w^(*) \, $

 where $A_w$ is evaluated on the original $n$-tuple.]
] <prop:perturbation>

#proof[
  Choose $0 < eta < epsilon \/ K$, with $K = 3 pi$ as in (2.2). Lemma 12 gives a finitely supported real coefficient vector $h_1$, with $h_j = 0$ for $j gt.eq 2$, and a word $w in bb(F)_n$ for which
  $ parallel h_1 parallel_(ell^2) < eta \, #h(2em) parallel D_w - delta_e parallel_(ell^2) < eta . $
  Apply Proposition 8 to these coefficients and write $beta = beta_1$. Its displacement estimates (3.3) and (3.3) give
  $ max_j ∥beta \( A_j \) - A_j∥ < epsilon \, #h(2em) ∥beta \( A_w \) - C A_w∥ < epsilon . $
  Moreover, $beta$ fixes $S$ and therefore fixes $C = exp \( upright(i) S \)$.
  The free-group basis transformation that fixes the first $n$ symbols and sends the last symbol $c$ to $c w$ is invertible: its inverse fixes the first $n$ symbols and sends $c$ to $c w^(- 1)$. By Lemma 4, it induces a trace-preserving normal automorphism $gamma$ of $M$ satisfying
  $ gamma \( A_j \) = A_j quad \( 1 lt.eq j lt.eq n \) \, #h(2em) gamma \( C \) = C A_w . $
  Set $alpha = gamma^(- 1) compose beta$. Since $gamma$ fixes every $A_j$ and hence $A_w$, we have the exact identities
  $ alpha \( A_j \) - A_j & = gamma^(- 1) #scale(x: 120%, y: 120%)[\(] beta \( A_j \) - A_j #scale(x: 120%, y: 120%)[\)] \,\
alpha \( A_w \) - C & = gamma^(- 1) #scale(x: 120%, y: 120%)[\(] beta \( A_w \) - C A_w #scale(x: 120%, y: 120%)[\)] . $
  An automorphism is isometric, so these identities prove (5.1), with the displayed order of the factors. The image under $alpha$ of the original freely generating Haar tuple is again such a tuple. Finally,
  $ C' = alpha \( C \) = gamma^(- 1) \( C \) = C A_w^(*) \, $
  because $beta \( C \) = C$ and $gamma \( C A_w^(*) \) = C A_w A_w^(*) = C$. ◻
]

=== 5.2 A generating limit <a-generating-limit>

We record the elementary continuity estimate that will control the iteration. For two $d$-tuples of unitaries $U = \( U_1 \, dots.h \, U_d \)$ and $V = \( V_1 \, dots.h \, V_d \)$, put

$ d_2 \( U \, V \) = max_(1 lt.eq j lt.eq d) ∥U_j - V_j∥_2 . $

If $v$ is a group word of length $\| v \|$, telescoping its product gives

$ ∥U_v - V_v∥_2 lt.eq \| v \| thin d_2 \( U \, V \) . $

Indeed, multiplication on either side by a unitary preserves the tracial $L^2$ norm, and $∥U_j^(*) - V_j^(*)∥_2 = ∥U_j - V_j∥_2$. Consequently, a finite word polynomial $F = sum_(nu = 1)^q c_nu v_nu$ satisfies

#[#set math.equation(numbering: n => "(5.2)")
 $ ∥F \( U \) - F \( V \)∥_2 lt.eq L \( F \) d_2 \( U \, V \) \, #h(2em) L \( F \) = sum_(nu = 1)^q \| c_nu \| thin \| v_nu \| . $ <eq:word-polynomial-lipschitz>]

The same telescoping argument also gives continuity in operator norm.

#proof[
  Fix $n gt.eq 3$ and let $M = L \( bb(F)_(n + 1) \)$, with its canonical normalized trace and canonical freely generating Haar tuple
  $ \( A_1^(\( 0 \)) \, dots.h \, A_n^(\( 0 \)) \, C^(\( 0 \)) \) . $
  Write $A^(\( k \)) = \( A_1^(\( k \)) \, dots.h \, A_n^(\( k \)) \)$. Choose a sequence $\( y_j \)_(j gt.eq 1)$ that is dense in $L^2 \( M \, tau \)$ and consists of elements of the rational complex group word algebra of the initial tuple. Such a sequence exists by Lemma 4; coefficients in $bb(Q) + upright(i) bb(Q)$ make this algebra countable. Put $r_0 = 1$.
  We construct freely generating Haar tuples $\( A^(\( k \)) \, C^(\( k \)) \)$ and positive numbers $r_k$ by induction. Suppose the construction has reached stage $k - 1$, where $k gt.eq 1$. The choices at stage $k$ are made in the following order.
  First, for each $1 lt.eq j lt.eq k$, choose a finite linear combination $F_(j \, k)$ of group words in $n + 1$ variables such that
  #[#set math.equation(numbering: n => "(5.3)")
   $ ∥F_(j \, k) \( A^(\( k - 1 \)) \, C^(\( k - 1 \)) \) - y_j∥_2 < 2^(- k) . $ <eq:stage-old-approximation>]
  This is possible because the current completed tuple generates $M$ and its group word algebra is dense in $L^2 \( M \, tau \)$. Let $H_k gt.eq 0$ be a common bound for the finitely many constants $L \( F_(j \, k) \)$ in (5.2). Choose
  #[#set math.equation(numbering: n => "(5.4)")
   $ 0 < epsilon_k < min {r_(k - 1) / 2 \, thin frac(2^(- k), 1 + H_k)} . $ <eq:stage-tolerance>]
  Next apply Proposition 15 to $\( A^(\( k - 1 \)) \, C^(\( k - 1 \)) \)$ with tolerance $epsilon_k$. Let $alpha_k$ and $w_k in bb(F)_n$ be its automorphism and word, and set
  $ A_j^(\( k \)) = alpha_k \( A_j^(\( k - 1 \)) \) \, #h(2em) C^(\( k \)) = alpha_k \( C^(\( k - 1 \)) \) . $
  The new completed tuple is freely generating Haar, and
  #[#set math.equation(numbering: n => "(5.5)")
   $ max_j ∥A_j^(\( k \)) - A_j^(\( k - 1 \))∥ < epsilon_k \, #h(2em) ∥A_(w_k)^(\( k \)) - C^(\( k - 1 \))∥ < epsilon_k . $ <eq:stage-perturbation>]
  In particular, the last expression is close to the old completion, as needed in (5.3).
  Now define word polynomials in $n$ variables by
  $ G_(j \, k) \( X \) = F_(j \, k) \( X \, X_(w_k) \) #h(2em) \( 1 lt.eq j lt.eq k \) . $
  Since $∥x∥_2 lt.eq ∥x∥$, equations (5.2), (5.3), and (5.5) imply
  #[#set math.equation(numbering: n => "(5.6)")
   $ ∥G_(j \, k) \( A^(\( k \)) \) - y_j∥_2 & lt.eq ∥F_(j \, k) \( A^(\( k \)) \, A_(w_k)^(\( k \)) \) - F_(j \, k) \( A^(\( k - 1 \)) \, C^(\( k - 1 \)) \)∥_2\
 & #h(2em) + ∥F_(j \, k) \( A^(\( k - 1 \)) \, C^(\( k - 1 \)) \) - y_j∥_2\
 & < H_k epsilon_k + 2^(- k) < 2 dot.op 2^(- k) . $ <eq:stage-new-approximation>]
  This estimate uses $A_(w_k)^(\( k \))$ as a single unitary slot of $F_(j \, k)$. Thus the tolerance chosen in (5.4) does not depend on the length of the word that the perturbation subsequently produces.
  Finally, let $L_k gt.eq 0$ be a common $L^2$-Lipschitz bound for the finitely many polynomials $G_(j \, k)$, and choose
  #[#set math.equation(numbering: n => "(5.7)")
   $ 0 < r_k lt.eq min {r_(k - 1) / 2 \, thin frac(2^(- k), 1 + L_k)} . $ <eq:future-budget>]
  These constants are finite by (5.2). They are chosen after $w_k$ is known, so any increase in word length is accommodated in the budget for future steps. Both quantities in the minimum are positive, and the induction can continue.
  Figure 1 records this order of choices and the role of the budget in controlling all later perturbations.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.144cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$F_(j,k)$#linebreak() Approximate $y_1, dots.h ,y_k$#linebreak()in the current tuple]]])])
  content((5.044, 0), [#box(width: 4.144cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$epsilon_k$#linebreak() Choose the tolerance#linebreak()from $H_k$ and $r_(k-1)$]]])])
  content((10.09, 0), [#box(width: 4.144cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$alpha_k,#h(0.3333em) w_k$#linebreak() Perturb the tuple;#linebreak()approximate the old $C^((k-1))$]]])])
  content((10.09, -3), [#box(width: 4.144cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$G_(j,k)$#linebreak() Substitute the witness word:#linebreak()$F_(j,k)(X,X_(w_k))$]]])])
  content((5.044, -3), [#box(width: 4.144cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$L_k,#h(0.3333em) r_k$#linebreak() Choose a#linebreak()Lipschitz bound;#linebreak()fix the future budget]]])])
  content((0, -3), [#box(width: 4.144cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Tail control#linebreak() $sum_( ell >k) epsilon_ ell lt.eq r_k$#linebreak()Preserve earlier approximations]]])])
  line((2.072, 0), (2.972, 0), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.23cm, fill: rgb("#000073"))))
  line((7.116, 0), (8.016, 0), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.23cm, fill: rgb("#000073"))))
  line((10.09, -1.05), (10.09, -1.95), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.23cm, fill: rgb("#000073"))))
  line((8.016, -3), (7.116, -3), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.23cm, fill: rgb("#000073"))))
  line((2.972, -3), (2.072, -3), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.23cm, fill: rgb("#000073"))))
})],
    caption: [Figure 1: The choices at stage $k$ follow the arrows. The witness word $w_k$ is found only after $epsilon_k$ is fixed. A longer witness word may increase the Lipschitz bound $L_k$ of the substituted polynomials $G_(j \, k)$, so its length affects the future budget $r_k$ only. This budget bounds the total change after stage $k$ and preserves the target approximations in the limit. ],
  ) <fig:iteration>
  For $ell > k$, the geometric decrease of the budgets gives
  $ epsilon_ell < r_(ell - 1) / 2 lt.eq r_k / 2^(ell - k) . $
  Using (5.5), we therefore obtain, for $p > k$,
  $ max_j ∥A_j^(\( p \)) - A_j^(\( k \))∥ lt.eq sum_(ell = k + 1)^p epsilon_ell lt.eq r_k . $
  Since $r_k lt.eq 2^(- k) r_0$, each sequence $\( A_j^(\( k \)) \)_k$ converges in operator norm to a unitary $A_j^(\( oo \))$, and
  #[#set math.equation(numbering: n => "(5.8)")
   $ max_j ∥A_j^(\( oo \)) - A_j^(\( k \))∥ lt.eq r_k . $ <eq:generator-tail>]
  The limits are unitaries because the unitary group is norm closed. For every nonidentity reduced word $v in bb(F)_n$,
  $ tau \( A_v^(\( oo \)) \) = lim_(k arrow.r oo) tau \( A_v^(\( k \)) \) = 0 \, $
  by operator-norm continuity of each fixed word evaluation and of the trace. Thus the limiting tuple has the free Haar word distribution.
  It remains to prove that this tuple generates $M$. For every $j lt.eq k$, equations (5.6), (5.7), and (5.8) yield
  #[#set math.equation(numbering: n => "(5.9)")
   $ ∥G_(j \, k) \( A^(\( oo \)) \) - y_j∥_2 & lt.eq ∥G_(j \, k) \( A^(\( oo \)) \) - G_(j \, k) \( A^(\( k \)) \)∥_2 + ∥G_(j \, k) \( A^(\( k \)) \) - y_j∥_2\
 & lt.eq L_k r_k + 2 dot.op 2^(- k) lt.eq 3 dot.op 2^(- k) . $ <eq:limit-target-approximation>]
  Fixing $j$ and letting $k arrow.r oo$ through $k gt.eq j$ shows that $y_j$ belongs to the $L^2$ closure of the word algebra of $A^(\( oo \))$. Since the $y_j$ are dense, this word algebra is dense in all of $L^2 \( M \, tau \)$.
  To pass from this density to von Neumann generation, set $N = W^(*) \( A_1^(\( oo \)) \, dots.h \, A_n^(\( oo \)) \)$. The standard finite-trace conditional expectation $E_N : M arrow.r N$ is trace-preserving and extends to the orthogonal projection of $L^2 \( M \, tau \)$ onto $L^2 \( N \, tau \)$. In particular it is $L^2$-contractive and fixes every element of $N$. Each $G_(j \, k) \( A^(\( oo \)) \)$ belongs to $N$, so
  $ ∥E_N \( y_j \) - y_j∥_2 lt.eq 2 ∥G_(j \, k) \( A^(\( oo \)) \) - y_j∥_2 arrow.r 0 . $
  Hence the projection fixes the dense family $\( y_j \)$ and is the identity on $L^2 \( M \, tau \)$. For $x in M$, this implies $E_N \( x \) = x$ by faithfulness of $tau$, and therefore $N = M$.
  The limiting tuple is now a freely generating Haar $n$-tuple in $M$. Lemma 4 supplies a unital trace-preserving normal $*$-isomorphism from $L \( bb(F)_n \)$ onto $M = L \( bb(F)_(n + 1) \)$, proving the theorem. ◻
]

#prodef([Remark 5.2.])[
  Only the first $n$ generators are required to converge in operator norm. The completions $C^(\( k \))$ may vary without a limit. The target approximations are in $L^2$, and the conditional expectation argument permits the operator norms of the approximating polynomials to grow with $k$.
]

== 6 Amplification to rank two <sec:amplification>

We recall the amplification convention for a $upright("II")_1$ factor $\( Q \, tau_Q \)$. Let $"Tr"$ be the usual semifinite trace on $B \( ell^2 \)$, normalized to give every rank-one projection trace one. For $t > 0$, choose a projection $p$ in the stabilized factor with $\( tau_Q ⊗ "Tr" \) \( p \) = t$ and set

$ Q^t = p #scale(x: 120%, y: 120%)[\(] Q thin overline(⊗) thin B \( ell^2 \) #scale(x: 120%, y: 120%)[\)] p \, #h(2em) tau_(Q^t) = t^(- 1) \( tau_Q ⊗ "Tr" \) \|_(Q^t) . $

Projections of every positive finite trace exist in this stabilized factor. Equivalence of projections of equal finite trace makes the normalized corner independent of the choice of $p$, up to a normal trace-preserving $*$-isomorphism.

Amplification respects normal tracial isomorphisms. Indeed, if $Theta : Q arrow.r R$ is such an isomorphism, the normal tensor-product map $Theta ⊗ upright("id")$ preserves the semifinite trace and sends $p$ to a projection $p'$ of the same trace $t$. Its restriction is an onto normal isomorphism between the corresponding corners. It sends the corner unit $p$ to $p'$ and preserves their traces normalized by $t^(- 1)$. We denote the resulting map by $Theta^t : Q^t arrow.r R^t$.

For real $s > 1$, let $N_s = L \( bb(F)_s \)$ be the interpolated free group factor, with the usual group factor at integer parameters. The established amplification formula is

#[#set math.equation(numbering: n => "(6.1)")
 $ N_s^t tilde.equiv N_(1 + \( s - 1 \) t^(- 2)) #h(2em) \( s > 1 \, med t > 0 \) \; $ <eq:interpolation-formulas>]

see #cite(label("dykema1994")) Theorem 2.4. This is an unconditional isomorphism formula for the interpolated family and does not assume that distinct parameters determine distinct isomorphism classes. It is the only interpolation theorem used in the proof of Theorem 2.

#proof[
  Apply Theorem 1 with $n = 3$ and $n = 4$ to obtain
  $ N_3 tilde.equiv N_4 tilde.equiv N_5 . $
  Let $Theta : N_3 arrow.r N_5$ be the composition of these normal trace-preserving isomorphisms. Amplifying by $sqrt(2)$ gives a unital normal trace-preserving isomorphism
  $ Theta^(sqrt(2)) : N_3^(sqrt(2)) arrow.r N_5^(sqrt(2)) . $
  Formula (6.1) identifies its domain and range as follows:
  $ N_3^(sqrt(2)) tilde.equiv N_(1 + \( 3 - 1 \) \/ 2) = N_2 \, #h(2em) N_5^(sqrt(2)) tilde.equiv N_(1 + \( 5 - 1 \) \/ 2) = N_3 . $
  These identifications and the amplified map compose to give $Phi : L \( bb(F)_2 \) arrow.r L \( bb(F)_3 \)$. Every map in the composition is a unital normal trace-preserving $*$-isomorphism. Thus $Phi$ is bijective and has all the asserted properties. ◻
]

For completeness, we record the consequences for the whole interpolated family. Put $N_oo = L \( bb(F)_oo \)$ and, for a $upright("II")_1$ factor $Q$, define its fundamental group by

$ cal(F) \( Q \) = { t > 0 : Q^t tilde.equiv Q } . $

Here and below the isomorphisms are normal and preserve the normalized traces. The classical free group factor alternative says that either all $N_r$, $1 < r lt.eq oo$, are isomorphic, or $N_r tilde.nequiv N_s$ whenever $1 < r < s lt.eq oo$. The inclusion of the infinite parameter uses Rădulescu’s dichotomy #cite(label("radulescu1994")) Corollary 4.7, restated explicitly in #cite(label("goldbring_pi2025")) Theorem 1.1. Dykema’s corresponding dichotomy #cite(label("dykema1994")) Corollary 4.2 is stated for finite parameters.

#thm([Corollary 6.1.])[
  #emph[For all $1 < r \, s lt.eq oo$ there is a unital normal trace-preserving $*$-isomorphism $L \( bb(F)_r \) tilde.equiv L \( bb(F)_s \)$. Moreover, 
$ cal(F) #scale(x: 120%, y: 120%)[\(] L \( bb(F)_r \) #scale(x: 120%, y: 120%)[\)] = bb(R)_(> 0) #h(2em) \( 1 < r lt.eq oo \) . $

]
] <cor:all-interpolated>

#proof[
  Theorem 2 rules out the pairwise-nonisomorphic alternative, so all parameters, including $oo$, give the same isomorphism class. For finite $r > 1$ and every $t > 0$, formula (6.1) then gives
  $ N_r^t tilde.equiv N_(1 + \( r - 1 \) t^(- 2)) tilde.equiv N_r . $
  Thus $cal(F) \( N_r \) = bb(R)_(> 0)$. Finally, $N_oo tilde.equiv N_2$ and functoriality of amplification give $N_oo^t tilde.equiv N_2^t tilde.equiv N_2 tilde.equiv N_oo$ for every $t > 0$. ◻
]

== 7 Free entropy dimensions and von Neumann generators <sec:entropy-dimensions>

For a bounded self-adjoint tuple $Z$ in a tracial von Neumann algebra, let $delta \( Z \)$ and $delta_0 \( Z \)$ denote Voiculescu’s microstates free entropy dimensions. The second is the modified version using entropy in the presence of the perturbing semicircular family. Write $delta^(*) \( Z \)$ and $delta^star.op \( Z \)$ for the nonmicrostates dimensions defined through nonmicrostates free entropy $chi^(*)$ and free Fisher information $Phi^(*)$, respectively. We use the conventions in #cite(label("voiculescu2002entropy")) Section 2.4 and #cite(label("connes_shlyakhtenko2005")) Section 4.1.1.

By their definitions, all four quantities depend only on the joint tracial $*$-distribution of the tuple. This is weaker than invariance under a change of von Neumann generators: two tuples can generate the same von Neumann algebra without having the same joint distribution. The isomorphisms proved above show that the four dimensions do change under such a replacement.

#thm([Corollary 7.1.])[
  (Dependence on von Neumann generators).  #emph[Let $M = L \( bb(F)_2 \)$ with its canonical trace. For every integer $n gt.eq 2$ there are a self-adjoint $n$-tuple $X^(\( n \))$ and a self-adjoint $2 n$-tuple $Y^(\( n \))$ such that 
$ W^(*) \( X^(\( n \)) \) = W^(*) \( Y^(\( n \)) \) = M $

 and 
$ delta \( X^(\( n \)) \) = delta_0 \( X^(\( n \)) \) = n \, #h(2em) delta^(*) \( Y^(\( n \)) \) = delta^star.op \( Y^(\( n \)) \) = n . $

 Consequently, none of $delta \, delta_0 \, delta^(*) \, delta^star.op$ is invariant under changing a finite self-adjoint $W^(*)$-generating tuple of a tracial von Neumann algebra. Each takes unbounded values on such generating tuples of the single factor $L \( bb(F)_2 \)$.]
] <cor:entropy-dimensions>

#proof[
  Fix an integer $n gt.eq 2$. Theorem 2 and successive applications of Theorem 1 provide a unital normal trace-preserving $*$-isomorphism
  $ theta_n : L \( bb(F)_n \) arrow.r M \; $
  for $n = 2$ we may take the identity. If $Z$ is any finite self-adjoint tuple in $L \( bb(F)_n \)$ and $p$ is a noncommutative $*$-polynomial, then
  $ tau_M #scale(x: 120%, y: 120%)[\(] p \( theta_n \( Z \) \) #scale(x: 120%, y: 120%)[\)] = tau_(L \( bb(F)_n \)) #scale(x: 120%, y: 120%)[\(] p \( Z \) #scale(x: 120%, y: 120%)[\)] . $
  Thus coordinatewise transport by $theta_n$ preserves the joint tracial $*$-distribution and hence each of the four dimensions. Normality and surjectivity also give $W^(*) \( theta_n \( Z \) \) = theta_n \( W^(*) \( Z \) \)$.
  Let $S^(\( n \)) = \( s_1 \, dots.h \, s_n \)$ be a freely independent variance-one semicircular tuple in the semicircular realization of $L \( bb(F)_n \)$ #cite(label("voiculescu1990")) Remarks 1.10–1.11. It generates $L \( bb(F)_n \)$ as a von Neumann algebra, and the standard semicircular computations give
  $ delta \( S^(\( n \)) \) = delta_0 \( S^(\( n \)) \) = n \; $
  see #cite(label("voiculescu2002entropy")) Section 2.4(c) and (d) for $delta$ and #cite(label("brannan_elzinga_harris_yamashita2023")) Section 5, opening paragraph for $delta_0$. Set $X^(\( n \)) = theta_n \( S^(\( n \)) \)$. The preceding transport observations prove the required generation and the two microstates values.
  For the nonmicrostates dimensions, let $u_1 \, dots.h \, u_n$ be the canonical group unitaries in $L \( bb(F)_n \)$ and put
  $ a_j = frac(u_j + u_j^(*), 2) \, #h(2em) b_j = frac(u_j - u_j^(*), 2 upright(i)) \, #h(2em) G^(\( n \)) = \( a_1 \, b_1 \, dots.h \, a_n \, b_n \) . $
  The entries are self-adjoint, and $u_j = a_j + upright(i) b_j$ and $u_j^(*) = a_j - upright(i) b_j$. Hence they generate the algebraic group algebra $bb(C) bb(F)_n$ as a unital $*$-algebra, and generate $L \( bb(F)_n \)$ as a von Neumann algebra. Apply Mineyev and Shlyakhtenko’s group-algebra theorem #cite(label("mineyev_shlyakhtenko2005")) Theorem 4.1 to this tuple, before transporting it. It gives
  $ delta^(*) \( G^(\( n \)) \) = delta^star.op \( G^(\( n \)) \) = beta_1^(\( 2 \)) \( bb(F)_n \) - beta_0^(\( 2 \)) \( bb(F)_n \) + 1 = n . $
  Here $beta_0^(\( 2 \)) \( bb(F)_n \) = 0$ and $beta_1^(\( 2 \)) \( bb(F)_n \) = n - 1$ are the usual $L^2$-Betti numbers of the free group; see #cite(label("connes_shlyakhtenko2005")) Section 2.1.1. Define $Y^(\( n \)) = theta_n \( G^(\( n \)) \)$. Again its joint tracial $*$-distribution is unchanged and it generates $M$, proving the remaining assertions. Taking $n = 2$ and $n = 3$ gives different values on generators of the same factor, and letting $n$ grow gives unboundedness. ◻
]

The nonmicrostates computation uses algebraic generators of $bb(C) bb(F)_n$ before transport. The transported tuples all generate $L \( bb(F)_2 \)$ as a von Neumann algebra, but their algebraic $*$-algebras are not held fixed as $n$ varies. Thus the corollary concerns $W^(*)$-generation and is compatible with the algebraic-generator invariance in #cite(label("mineyev_shlyakhtenko2005")) Theorem 4.1.


#bibliography("refs.bib", style: "ieee", title: [References])
