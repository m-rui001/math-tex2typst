#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Near Inclusions of von Neumann Algebras \
Without Small Spatial Embeddings]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $M$ and $N$ be von Neumann algebras acting on a complex Hilbert space $H$, both with identity $I_H$.
  Their one-sided near-inclusion gap is

#[#set math.equation(numbering: n => "(1.1)")
 $ gamma \( M \, N \) = sup_(x in M\
parallel x parallel lt.eq 1) inf_(y in N) parallel x - y parallel . $ <eq:gamma-definition>]

The approximating element $y$ is not required to be contractive.
  A small value of $gamma \( M \, N \)$ says that every contraction in $M$ is close to some element of $N$;
  it does not require these choices of approximants to preserve algebraic operations.
  If a unitary $u$ satisfies $u M u^(*) subset.eq N$, then $gamma \( M \, N \) lt.eq 2 parallel u - I_H parallel$.
  The converse question asks whether a small near inclusion can always be obtained in this way.

The underlying perturbation program began with Kadison and Kastler #cite(label("KK1972")).
  They measured the distance between operator algebras by the Hausdorff distance between their unit balls in the
  operator norm, now called the Kadison–Kastler distance, and proposed that sufficiently close von Neumann
  algebras should be related by a unitary close to the identity.
  Christensen, Johnson, and Raeburn–Taylor established the amenable case in the 1970s #cite(label("Chr1977"))
  #cite(label("Joh1977")) #cite(label("RT1977")). Christensen subsequently introduced near inclusions and proved a
  spatial embedding theorem for an amenable source algebra and an arbitrary target #cite(label("Chr1980"))
  Definition 2.1 and Theorem 4.3. In particular, sufficiently small near inclusions in this setting admit
  implementing unitaries whose distance from the identity is bounded linearly by the near-inclusion tolerance.

We use the following formulation of the unrestricted one-sided question posed by Cameron, Christensen, Sinclair,
  Smith, White, and Wiggins in the paragraph preceding #cite(label("CCSSWW2012")) Theorem 2:

#quote(block: true)[
  For every $epsilon > 0$, is there a $delta > 0$ such that,
    for every complex Hilbert space $H$ and every pair of von Neumann algebras $M \,
    N subset.eq cal(B) \( H \)$ with common identity $I_H$, $gamma \( M \, N \) <
    delta$ implies the existence of a unitary $u in cal(B) \( H \)$ satisfying
  $ u M u^(*) subset.eq N wide upright("and") wide parallel u - I_H parallel < epsilon ? $
]

Here $delta$ must be independent of the algebras and their representations. We answer this question negatively.

#thm([Theorem 1.1.])[
  #emph[There exist $epsilon_0 > 0$, separable complex Hilbert spaces $H_n$, and von Neumann algebras $M_n \,
    N_n subset.eq cal(B) \( H_n \)$ with common identity $I_(H_n)$ such that
$ gamma \( M_n \, N_n \) arrow.r 0 \, $

 but, for all sufficiently large $n$, every unitary $u in cal(B) \( H_n \)$ satisfying $u M_n u^(*) subset.eq N_n$ obeys
$ parallel u - I_(H_n) parallel gt.eq epsilon_0 . $

]
] <thm:main>

In these examples a unitary embedding of $M_n$ into $N_n$ does exist;
  the obstruction concerns its distance from the identity. The theorem therefore separates normwise approximation
  from small spatial implementation even on separable Hilbert spaces. Its hypothesis is one-sided.
  The construction supplies no reverse near inclusion, and hence does not give a counterexample to the two-sided
  Kadison–Kastler conjecture. The positive results for nonamenable factors in #cite(label("CCSSWW2012")),
  which concern two-sided perturbations under additional structural hypotheses, address a different assertion.

The proof transfers a classical finite-dimensional obstruction into the near-inclusion problem.
  Voiculescu’s clock and shift matrices $U_n \, V_n in cal(B) \( bb(C)^n \)$ satisfy $parallel U_n V_n -
  V_n U_n parallel arrow.r 0$, but cannot be approximated in norm by commuting unitary pairs
  #cite(label("Voi1983")). Exel and Loring gave an elementary winding-number proof of this phenomenon
  #cite(label("EL1989")); we use its trace-logarithm form #cite(label("Exel1993")) Lemma 3.1.
  We recall the short obstruction argument in Section 4.

To place these matrices in operator algebras, we use the free group $F$ on countably many generators.
  The starting representation is the real-parameter Pytlik–Szwarc representation #cite(label("PS1986")) §2.3,
  Equation (5), whose cyclic coefficient is Haagerup’s positive-definite function $g mapsto t^(\| g \|)$,
  $0 < t < 1$, where $\| g \|$ is reduced word length #cite(label("Haa1979")) Lemma 1.2.
  Section 2 gives a self-contained tree realization at $t = 1 \/ 2$ and adds a circle parameter $z$.
  The norms of its Fourier coefficients are bounded, uniformly over the group,
  by a sequence with summable first moment. Along successive distinct free generators,
  the values of the representations converge in the weak operator topology to $t
  z$ times the projection onto the identity vector in $ell^2 \( F \)$.
  Substituting $U_n$ and $V_n$ for the circle parameter therefore produces two unitary representations of $F$
  whose weak limits retain the original matrices.

Two further steps connect this representation family to the theorem.
  In Section 3, a diagonal unitary built from the two representations conjugates a copy of the group von Neumann
  algebra of $F times F$. The target $N_n$ is the commutant of an amplified right regular representation of this
  product group. Reordering the Fourier expansions gives an approximant in $N_n$ and an error bounded by a
  constant times $parallel U_n V_n - V_n U_n parallel$. Crucially,
  this estimate holds on the entire unit ball of the source algebra.
  In Section 4, a hypothetical sequence of spatial embeddings tending to the identity places the conjugated left
  regular representation in $N_n$, where it commutes with the right regular representation.
  Their pointwise product is then a representation of $F times F$,
  so the von Neumann algebras generated by its two factors commute.
  Weak operator limits in these algebras recover operators close to copies of $U_n$ and $V_n$ supported on
  projections. Perturbing those projections, compressing to a common finite-dimensional corner,
  and taking polar parts would yield commuting unitary matrices close to $U_n \, V_n$,
  contradicting the winding-number obstruction.

== 2 A circle family with uniform Fourier bounds <sec:circle>

We first construct representations in which a scalar circle parameter can later be replaced by a unitary matrix.
  Two properties are needed: Fourier coefficients with a summable first moment, uniformly over the group,
  and a weak operator limit that retains the parameter.

Let $F$ be the free group on generators $s_j$, $j gt.eq 1$, with identity $e$.
  Put $K = ell^2 \( F \)$, write $\( delta_x \)_(x in F)$ for its standard orthonormal basis,
  and let $p_e$ be the projection onto $bb(C) delta_e$. We use the left regular representation $l \( g \)
  delta_x = delta_(g x)$. Throughout the construction,

$ t = 1 / 2 \, wide r = \( 1 - t^2 \)^(1 \/ 2) \, wide bb(T) = { z in bb(C) : \| z \| = 1 } . $

#thm([Proposition 2.1.])[
  #emph[There are unitary representations $pi_z : F arrow.r cal(B) \( K \)$, indexed by $z in bb(T)$,
    and operators $A_k \( g \) in cal(B) \( K \)$, indexed by $k in bb(Z)$ and $g in F$, such that
#[#set math.equation(numbering: n => "(2.1)")
 $ pi_z \( g \) & = sum_(k in bb(Z)) z^k A_k \( g \) \, & sup_(g in F) parallel A_k \( g \) parallel & lt.eq
   c_k \, & c_k & = upright(bold(1))_({ k = 0 }) + frac(2 t^(\| k \|), 1 - t) \,\
pi_z \( s_j \) & arrow.r_(j arrow.r oo)^(upright("WOT")) t z p_e . $ <eq:fourier>]

 The series in (2.1) converges absolutely in operator norm, uniformly in $g$ and $z$, and
#[#set math.equation(numbering: n => "(2.2)")
 $ S_0 := sum_(k in bb(Z)) c_k < oo \, wide S_1 := sum_(k in bb(Z)) \| k \| c_k < oo . $ <eq:moments>]

]
] <prop:circle>

#proof[
  The underlying representation is the real-parameter Pytlik–Szwarc representation #cite(label("PS1986"))
    Section 2.3, Equation (5); its cyclic coefficient is the positive-definite function $g mapsto
    t^(\| g \|)$ of Haagerup #cite(label("Haa1979")) Lemma 1.2.
    We give the tree construction before introducing the circle parameter.
  Use the Cayley tree whose edges join $x$ to $x s_j^(plus.minus 1)$, rooted at $e$,
    and write $p \( x \)$ for the parent of $x eq.not e$. Define
  #[#set math.equation(numbering: n => "(2.3)")
   $ xi_e = delta_e \, wide xi_x = t xi_(p \( x \)) + r delta_x quad \( x eq.not e \) . $ <eq:tree-vectors>]
  All these vectors have norm one. If $v$ is the last common vertex of the paths from $e$ to $x$ and $y$,
    the two tails beyond $v$ are orthogonal to each other and to $xi_v$. Thus
  $ chevron.l xi_x \, xi_y chevron.r = t^(d \( x \, v \) + d \( y \, v \)) = t^(d \( x \, y \)) \, $
  where $d$ is the tree distance. Their linear span contains every $delta_x$, by (2.3).
    Left multiplication preserves $d$, so the rule
  $ pi \( g \) xi_x = xi_(g x) $
  extends to a unitary on $K$. These unitaries form a representation.
  The difference from the regular representation is confined to a single finite path.
    To see this precisely, put $T_g = pi \( g \) l \( g \)^(*)$. For $y eq.not g$, (2.3) gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ T_g delta_y = frac(xi_y - t xi_(g p \( g^(- 1) y \)), r) \, wide T_g delta_g = xi_g . $ <eq:root-change>]
  The vertex $g p \( g^(- 1) y \)$ is the first step from $y$ toward $g$.
    Let $e = h_0 \, h_1 \, dots.h \, h_d = g$ be the path from $e$ to $g$.
    For $y$ outside this path, the first steps toward $e$ and $g$ coincide; hence $T_g delta_y = delta_y$. On the path,
  #[#set math.equation(numbering: n => "(2.5)")
   $ T_g delta_(h_b) = r xi_(h_b) - t delta_(h_(b + 1)) quad \( 0 lt.eq b < d \) \, wide T_g delta_(h_d) =
     xi_(h_d) . $ <eq:path-action>]
  In particular, the path subspace and its orthogonal complement reduce $T_g$.
    Expanding the vectors along the path gives
  $ xi_(h_b) = t^b delta_(h_0) + r sum_(a = 1)^b t^(b - a) delta_(h_a) . $
  By (2.5), the subdiagonal entries are $- t$; every other nonzero entry in row $a$,
    column $b$ is $t^(\| a - b \|)$ times $1$, $r$, or $r^2$. Thus the matrix entries on this subspace satisfy
  #[#set math.equation(numbering: n => "(2.6)")
   $ \| \( T_g \)_(a \, b) \| lt.eq t^(\| a - b \|) wide \( 0 lt.eq a \, b lt.eq d \) . $ <eq:path-decay>]
  This also includes $g = e$, when $T_e = I$.
  Let $q : F arrow.r bb(Z)$ be the homomorphism with $q \( s_j \) = 1$ for every $j$, and define $D_z delta_x =
    z^(- q \( x \)) delta_x$. The desired representation is
  #[#set math.equation(numbering: n => "(2.7)")
   $ pi_z \( g \) = z^(q \( g \)) D_z pi \( g \) D_z^(*) = \( D_z T_g D_z^(*) \) l \( g \) . $ <eq:circle-twist>]
  The first expression proves that it is a unitary representation.
    The second follows from $D_z l \( g \) D_z^(*) = z^(- q \( g \)) l \( g \)$ and supplies its Fourier bounds.
  On the path subspace, the entry in row $a$, column $b$ acquires the Laurent factor
    $z^(q \( h_b \) - q \( h_a \))$. Each edge changes $q$ by $1$ or $- 1$,
    so an entry of exponent $k$ can occur only when $\| a - b \| gt.eq \| k \|$.
    For each row or column there are at most two entries at any given distance $m$.
    By (2.6), the absolute row and column sums of the coefficient of $z^k$ are therefore at most
  $ 2 sum_(m gt.eq \| k \|) t^m = frac(2 t^(\| k \|), 1 - t) . $
  Outside the path the operator is the identity, which contributes only to the coefficient at $k = 0$.
    The row and column sum bound for operator norm, followed by multiplication by $l \( g \)$, proves (2.1).
    For each fixed $g$ this is a finite Laurent expansion; the common bounds $c_k$ give the asserted uniform
    absolute convergence and (2.2).
  Finally, (2.5) and (2.7) give
  $ pi_z \( s_j \) delta_e = t z delta_e + r delta_(s_j) . $
  For any fixed $x eq.not e$, all sufficiently large $j$ satisfy $s_j x in.not { e \, s_j }$,
    and then $pi_z \( s_j \) delta_x = delta_(s_j x)$. These basis-vector calculations,
    together with the uniform norm bound $parallel pi_z \( s_j \) parallel = 1$, prove (2.1). ◻
]

== 3 From a unitary pair to a near inclusion <sec:near>

We now use Proposition 2 to encode two unitaries $U \, V$ on a nonzero finite-dimensional Hilbert space $D$.
  The resulting von Neumann algebras will have one-sided gap bounded by a constant times $parallel U V - V U parallel$.

=== 3.1 Matrix substitution and the algebras <matrix-substitution-and-the-algebras>

On $L = K ⊗ K ⊗ D$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ a \( g \) = sum_k A_k \( g \) ⊗ I_K ⊗ U^k \, wide b \( g \) =
   sum_k I_K ⊗ A_k \( g \) ⊗ V^k quad \( g in F \) . $ <eq:matrix-reps>]

The series converge absolutely in norm. A spectral decomposition $U =
  sum_z z P_z$ rewrites the first expression as $sum_z pi_z \( g \) ⊗ I_K ⊗ P_z$,
  so $a$ is a unitary representation. Diagonalizing $V$ gives the same conclusion for $b$.
  There is no requirement that their ranges commute. The weak limits from Proposition 2 become

#[#set math.equation(numbering: n => "(3.2)")
 $ a \( s_j \) arrow.r^(upright("WOT")) t p_e ⊗ I_K ⊗ U \, wide
   b \( s_j \) arrow.r^(upright("WOT")) t I_K ⊗ p_e ⊗ V . $ <eq:matrix-limits>]

Only finite spectral sums are involved, so these limits follow directly from (2.1).

Put $G = F times F$, $S = ell^2 \( G \)$, and $H = S ⊗ L$.
  Our conventions for the commuting left and right regular representations on $S$ are

$ lambda \( g \) delta_x = delta_(g x) \, wide rho \( g \) delta_x = delta_(x g^(- 1)) . $

For $x = \( x_1 \, x_2 \) in G$, put $f \( x \) = a \( x_1 \) b \( x_2 \)$ and define the diagonal unitary $W$ by

$ W \( delta_x ⊗ v \) = delta_x ⊗ f \( x \) v . $

Although $a$ and $b$ are representations, $f$ need not be one. Define

#[#set math.equation(numbering: n => "(3.3)")
 $ M = W #scale(x: 120%, y: 120%)[\(] lambda \( G \)'' ⊗ I_L #scale(x: 120%, y: 120%)[\)] W^(*) \, wide N =
   #scale(x: 120%, y: 120%)[\(] rho \( G \) ⊗ I_L #scale(x: 120%, y: 120%)[\)]' . $ <eq:algebras>]

Primes denote commutants. Here $lambda \( G \)'' ⊗ I_L$ means the algebra of all $X ⊗ I_L$ with $X in
  lambda \( G \)''$; it is weak operator closed, as is seen by taking matrix blocks relative to an orthonormal
  basis of $L$. Thus $M \, N$ are von Neumann algebras with common identity $I_H$.
  Notice also that $W^(*) M W subset N$, so these examples always admit a spatial embedding.

The exactly commuting case explains the choice of $W$. If $U$ and $V$ commute,
  then so do the ranges of $a$ and $b$, and $f$ is a representation of $G$. In that case

$ W \( lambda \( g \) ⊗ I_L \) W^(*) = lambda \( g \) ⊗ f \( g \) in N quad \( g in G \) \, $

so $M subset N$. When $U$ and $V$ only nearly commute, we must control the error on the entire unit ball of $M$;
  estimates for the group elements alone would not suffice.

=== 3.2 A norm estimate on the whole algebra <a-norm-estimate-on-the-whole-algebra>

#thm([Proposition 3.1.])[
  #emph[For the algebras in (3.3),
#[#set math.equation(numbering: n => "(3.4)")
 $ gamma \( M \, N \) lt.eq C parallel U V - V U parallel \, wide C :=
   sum_(k \, m \, p \, h in bb(Z)) c_k c_m c_p c_h \| m - p \| thin \| h \| < oo . $ <eq:near-bound>]

 Moreover, for every $g in G$,
#[#set math.equation(numbering: n => "(3.5)")
 $ parallel W \( lambda \( g \) ⊗ I_L \) W^(*) - lambda \( g \) ⊗ f \( g \) #scale(x: 120%, y: 120%)[parallel]
   lt.eq C parallel U V - V U parallel . $ <eq:group-bound>]

 The constant is independent of $D \, U \, V$.]
] <prop:near>

#proof[
  Write $nu = parallel U V - V U parallel$. Fix $X in lambda \( G \)''$ and denote its scalar matrix entries by
    $X_(x \, y)$, for $x \, y in G$. Since $X$ commutes with $rho \( G \)$,
    these entries are invariant under common right translation:
  #[#set math.equation(numbering: n => "(3.6)")
   $ X_(x q \, y q) = X_(x \, y) quad \( x \, y \, q in G \) . $ <eq:right-invariance>]
  The operator $Z = W \( X ⊗ I_L \) W^(*)$ has $cal(B) \( L \)$-valued blocks
  $ Z_(x \, y) = X_(x \, y) a \( x_1 \) b \( x_2 \) b \( y_2 \)^(*) a \( y_1 \)^(*) . $
  We seek an approximant $Y$ with the reordered blocks
  #[#set math.equation(numbering: n => "(3.7)")
   $ Y_(x \, y) = X_(x \, y) a \( x_1 \) a \( y_1 \)^(*) b \( x_2 \) b \( y_2 \)^(*) =
     X_(x \, y) f \( x y^(- 1) \) . $ <eq:reordered-blocks>]
  The last equality uses the representation laws for $a$ and $b$ separately.
    Since $\( x q \) \( y q \)^(- 1) = x y^(- 1)$, these blocks are right-translation invariant by (3.6).
    Thus, once boundedness is established, $Y$ commutes with $rho \( G \) ⊗ I_L$ and belongs to $N$.
  The Fourier bounds establish boundedness and control the reordering in operator norm.
    On $S ⊗ K ⊗ K$, let $D_(k \, m)$ be the diagonal operator whose block at $x in G$ is $A_k \( x_1 \) ⊗
    A_m \( x_2 \)$. Then $parallel D_(k \, m) parallel lt.eq c_k c_m$. Set
  $ B_(k \, m \, p \, h) \( X \) = D_(k \, m) \( X ⊗ I_K ⊗ I_K \) D_(h \, p)^(*) . $
  The $A_k$ coefficients of $a$ and $b$ act on separate copies of $K$; only their matrix factors $U^k \,
    V^m$ act on the same space. In the decomposition $H = \( S ⊗ K ⊗ K \) ⊗ D$,
    expansion of the four factors therefore gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ Z & = sum_(k \, m \, p \, h) B_(k \, m \, p \, h) \( X \) ⊗ U^k V^(m - p) U^(- h) \,\
Y & = sum_(k \, m \, p \, h) B_(k \, m \, p \, h) \( X \) ⊗ U^(k - h) V^(m - p) . $ <eq:z-expansion>]
  Both sums converge absolutely because
  $ parallel B_(k \, m \, p \, h) \( X \) parallel lt.eq c_k c_m c_p c_h parallel X parallel \, wide
    sum_(k \, m \, p \, h) c_k c_m c_p c_h = S_0^4 < oo . $
  Their blocks are precisely the expressions above, which also justifies the definition of $Y$.
  For integers $a \, b$, telescoping gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ parallel U^a V^b - V^b U^a parallel lt.eq \| a \| thin \| b \| nu . $ <eq:power-commutator>]
  For positive powers, expand a commutator one factor at a time;
    negative powers follow from $\[ U^(- 1) \, V \] = - U^(- 1) \[ U \, V \]
    U^(- 1)$ and its analogue for $V^(- 1)$, where $\[ A \, B \] = A B - B A$.
    Consequently the two matrix factors in (3.8) and (3.8) differ by at most $\| m - p \| thin \| h \| nu$. Hence
  #[#set math.equation(numbering: n => "(3.10)")
   $ parallel Z - Y parallel lt.eq C nu parallel X parallel \, wide C lt.eq
     2 S_0^2 S_1^2 < oo . $ <eq:reordering-estimate>]
  Since $Y in N$ and $parallel Z parallel = parallel X parallel$, this proves (3.4);
    no bound of $1$ on $parallel Y parallel$ is needed.
  If $X = lambda \( g \)$, its nonzero entries have $x = g y$.
    The representation laws for $a$ and $b$ turn (3.7) into $Y = lambda \( g \) ⊗ a \( g_1 \) b \( g_2 \) =
    lambda \( g \) ⊗ f \( g \)$. Thus (3.5) is the same estimate for this choice of $X$. ◻
]

== 4 Recovering the matrix obstruction <sec:obstruction>

The preceding construction turns a small commutator into a small one-sided gap.
  We now show that a spatial embedding close to the identity would turn the original matrix pair into a nearby
  commuting pair. Choosing the clock and shift matrices will make this impossible.

=== 4.1 The winding obstruction <the-winding-obstruction>

The matrices below are Voiculescu’s almost commuting unitary pair #cite(label("Voi1983")).
  We include the logarithmic winding argument, in the form developed in #cite(label("EL1989")) #cite(label("Exel1993")).

#thm([Lemma 4.1.])[
  #emph[For $n gt.eq 3$, let $U_n \, V_n$ be the unitaries on $bb(C)^n$ given by
#[#set math.equation(numbering: n => "(4.1)")
 $ U_n e_j = omega_n^j e_j \, wide V_n e_j = e_(j + 1 med mod med n) \, wide omega_n =
   e^(2 pi i \/ n) quad \( 0 lt.eq j < n \) . $ <eq:clock-shift>]

 Then $nu_n := parallel U_n V_n - V_n U_n parallel = \| omega_n - 1 \| arrow.r 0$.
   There is no infinite subsequence along which commuting unitaries $hat(U)_n \, hat(V)_n$ on $bb(C)^n$ satisfy
$ parallel hat(U)_n - U_n parallel + parallel hat(V)_n - V_n parallel arrow.r 0 . $

]
] <lem:clock>

#proof[
  The identity $U_n V_n = omega_n V_n U_n$ proves the first assertion.
    For any unitary matrices $U \, V$ whose commutator $U V U^(*) V^(*)$ has no eigenvalue $- 1$, define
  $ kappa \( U \, V \) = frac(1, 2 pi i) "Tr" log \( U V U^(*) V^(*) \) \, $
  using the principal logarithm and the unnormalized trace. The determinant identity
  $ exp #scale(x: 120%, y: 120%)[\(] "Tr" log \( U V U^(*) V^(*) \) #scale(x: 120%, y: 120%)[\)] =
    det \( U V U^(*) V^(*) \) = 1 $
  shows that $kappa \( U \, V \)$ is an integer. It is continuous, and hence constant,
    along any path on which the logarithm remains defined. For the pair in (4.1), its value is $1$,
    since $U_n V_n U_n^(*) V_n^(*) = omega_n I$ and $0 < 2 pi \/ n < pi$. For a commuting pair its value is $0$.
  Suppose the asserted approximants existed along a subsequence.
    For all sufficiently large $n$ on that subsequence, write $U_n^(*) hat(U)_n =
    e^(i A_n)$ and $V_n^(*) hat(V)_n = e^(i B_n)$, with $A_n \,
    B_n$ self-adjoint and spectra in $\( - pi \, pi \)$. The paths
  $ U_n \( s \) = U_n e^(i s A_n) \, wide V_n \( s \) = V_n e^(i s B_n) wide \( 0 lt.eq s lt.eq 1 \) $
  stay within the respective endpoint distances from $U_n \, V_n$.
    Indeed, for $\| theta \| < pi$ and $0 lt.eq s lt.eq 1$, $\| e^(i s theta) - 1 \| lt.eq \| e^(i theta) - 1 \|$.
    A four-factor telescoping estimate gives, uniformly in $s$,
  $ parallel U_n \( s \) V_n \( s \) U_n \( s \)^(*) V_n \( s \)^(*) - I parallel lt.eq nu_n +
    2 parallel hat(U)_n - U_n parallel + 2 parallel hat(V)_n - V_n parallel arrow.r 0 . $
  The principal logarithm is therefore defined along the whole path for all sufficiently large $n$.
    Its integer changes from $1$ to $0$, a contradiction. ◻
]

=== 4.2 A finite-dimensional corner <a-finite-dimensional-corner>

Compression of commuting operators to a prescribed subspace need not preserve commutation.
  The next lemma avoids this difficulty by replacing each support projection by a nearby projection in its
  corresponding algebra and then using their common range.

#thm([Lemma 4.2.])[
  #emph[For each $n$, let $E_(1 n) \, E_(2 n)$ be commuting projections on a complex Hilbert space $H_n$,
    with $D_n = E_n H_n$ nonzero and finite-dimensional, where $E_n = E_(1 n) E_(2 n)$.
    Let $tilde(R)_(1 n) \, tilde(R)_(2 n)$ be unitaries commuting with both projections, and write $R_(i n) =
    tilde(R)_(i n) \|_(D_n)$. Suppose $cal(A)_(1 n) \, cal(A)_(2 n) subset
    cal(B) \( H_n \)$ are commuting unital von Neumann algebras and there are $T_(i n) in cal(A)_(i n)$ such that
#[#set math.equation(numbering: n => "(4.2)")
 $ parallel T_(i n) - E_(i n) tilde(R)_(i n) parallel arrow.r 0 quad \( i = 1 \, 2 \) . $ <eq:corner-hypothesis>]

 Then, for all sufficiently large $n$, there are commuting unitaries $hat(R)_(1 n) \, hat(R)_(2 n)$ on $D_n$ with
$ parallel hat(R)_(i n) - R_(i n) parallel arrow.r 0 quad \( i = 1 \, 2 \) . $

]
] <lem:corner>

#proof[
  We first replace the intended projections by nearby projections in the commuting algebras.
    Set $delta_(i n) = parallel T_(i n) - E_(i n) tilde(R)_(i n) parallel$.
    Since $\( E_(i n) tilde(R)_(i n) \)^(*) \( E_(i n) tilde(R)_(i n) \) = E_(i n)$,
  $ d_(i n) := parallel T_(i n)^(*) T_(i n) - E_(i n) parallel lt.eq delta_(i n) \( 2 + delta_(i n) \) arrow.r 0 . $
  For sufficiently large $n$, take the spectral projection
  $ Q_(i n) = upright(bold(1))_(\( 1 \/ 2 \, oo \)) \( T_(i n)^(*) T_(i n) \) in cal(A)_(i n) . $
  The spectrum of $T_(i n)^(*) T_(i n)$ lies in $\[ 0 \, d_(i n) \] union \[ 1 - d_(i n) \, 1 + d_(i n) \]$.
    This follows from the resolvent bound for a self-adjoint operator within $d_(i n)$ of a projection.
    Functional calculus therefore gives
  $ parallel Q_(i n) - T_(i n)^(*) T_(i n) parallel lt.eq d_(i n) \, wide parallel Q_(i n) -
    E_(i n) parallel lt.eq 2 d_(i n) arrow.r 0 . $
  Since the two algebras commute, $P_n = Q_(1 n) Q_(2 n)$ is a projection, and
  $ parallel P_n - E_n parallel lt.eq parallel Q_(1 n) - E_(1 n) parallel + parallel Q_(2 n) -
    E_(2 n) parallel arrow.r 0 . $
  We identify this perturbed corner with $D_n$ by a small unitary. The operator
  $ S_n = P_n E_n + \( I - P_n \) \( I - E_n \) = I + \( P_n - E_n \) \( 2 E_n - I \) $
  tends to the identity in norm and satisfies $S_n E_n = P_n S_n$. It is invertible for large $n$.
    Its absolute value commutes with $E_n$, so its unitary polar part $J_n = S_n \( S_n^(*) S_n \)^(- 1 \/ 2)$ satisfies
  #[#set math.equation(numbering: n => "(4.3)")
   $ J_n E_n J_n^(*) = P_n \, wide parallel J_n - I parallel arrow.r 0 . $ <eq:corner-identification>]
  In particular, $P_n H_n$ has exactly the dimension of $D_n$.
  The compressions $P_n T_(1 n) P_n$ and $P_n T_(2 n) P_n$ commute, including across adjoints.
    This needs a check because $Q_(i n)$ need not commute with $T_(i n)$.
    Suppress $n$ and put $A = Q_1 T_1 Q_1 in cal(A)_1$ and $B = Q_2 T_2 Q_2 in cal(A)_2$.
    The two compressions are $A Q_2$ and $Q_1 B$. Since $A Q_1 = Q_1 A = A$, $B Q_2 = Q_2 B = B$,
    and every element of $cal(A)_1$ commutes with every element of $cal(A)_2$,
    both orders of their product equal $A B$. Replacing $A$ or $B$ by its adjoint proves the other commutations.
  Transfer these compressions to $D_n$ using (4.3):
  $ C_(i n) = E_n J_n^(*) T_(i n) J_n E_n\|_(D_n) . $
  The pair still commutes across adjoints. Moreover,
  $ parallel C_(i n) - R_(i n) parallel lt.eq delta_(i n) + 2 parallel J_n - I parallel arrow.r 0 \, $
  by comparing $T_(i n)$ with $E_(i n) tilde(R)_(i n)$ before conjugation.
    Thus $C_(i n)$ is invertible for large $n$ and $parallel C_(i n)^(*) C_(i n) - I_(D_n) parallel arrow.r 0$.
    Its unitary polar part
  $ hat(R)_(i n) = C_(i n) \( C_(i n)^(*) C_(i n) \)^(- 1 \/ 2) $
  remains close to $R_(i n)$. The unital $C^(*)$-algebras generated by $C_(1 n)$ and $C_(2 n)$ commute;
    continuous functional calculus puts each polar part in its respective algebra.
    Hence the two polar unitaries commute, as required. ◻
]

=== 4.3 Proof of the main theorem <proof-of-the-main-theorem>

Apply the construction of Section 3 to $D = bb(C)^n$ and the clock–shift pair of Lemma 4.
  Use subscripts $n$ for the resulting objects $L_n \, H_n \, a_n \, b_n \, f_n \, W_n \, M_n \, N_n$.
  All these Hilbert spaces are separable. By Proposition 3,

#[#set math.equation(numbering: n => "(4.4)")
 $ gamma \( M_n \, N_n \) lt.eq C nu_n arrow.r 0 . $ <eq:vanishing-gap>]

#proof[
  We show that no infinite subsequence admits unitaries $u_n$ with
  #[#set math.equation(numbering: n => "(4.5)")
   $ u_n M_n u_n^(*) subset N_n \, wide parallel u_n - I parallel arrow.r 0 . $ <eq:assumed-embedding>]
  Suppose otherwise and work on that subsequence. Define, for $g in G$,
  $ Z_n \( g \) = W_n \( lambda \( g \) ⊗ I_(L_n) \) W_n^(*) \, wide Sigma_n \( g \) =
    u_n Z_n \( g \) u_n^(*) \( rho \( g \) ⊗ I_(L_n) \) . $
  The first factor in the expression for $Sigma_n \( g \)$ lies in $N_n$, by (4.5).
    Thus the two representations being multiplied have commuting ranges,
    and $Sigma_n$ is a unitary representation of $G$. Proposition 3 gives the uniform estimate
  #[#set math.equation(numbering: n => "(4.6)")
   $ sup_(g in G) parallel Sigma_n \( g \) - lambda \( g \) rho \( g \) ⊗ f_n \( g \)
     #scale(x: 120%, y: 120%)[parallel] lt.eq beta_n \, wide beta_n = C nu_n + 2 parallel u_n - I parallel arrow.r
     0 . $ <eq:sigma-bound>]
  Let $cal(A)_(1 n)$ and $cal(A)_(2 n)$ be the von Neumann algebras generated by the restrictions of $Sigma_n$ to
    $F times { e }$ and ${ e } times F$, respectively. These algebras commute.
  We will apply Lemma 5 by taking weak limits of the generators in each factor. Under $S = K ⊗ K$, write
  $ H_n = K ⊗ K ⊗ K ⊗ K ⊗ bb(C)^n . $
  Let $E_(1 n)$ use $p_e$ in the first and third slots, and let $E_(2 n)$ use $p_e$ in the second and fourth
    slots, with identities in all other slots. These projections commute, and $E_n =
    E_(1 n) E_(2 n)$ has range naturally identified with $bb(C)^n$.
    Let $tilde(R)_(1 n)$ and $tilde(R)_(2 n)$ act as $U_n \, V_n$, respectively,
    on the final slot and as the identity elsewhere.
  Set $g_(1 j) = \( s_j \, e \)$ and $g_(2 j) = \( e \, s_j \)$.
    On the $i$-th factor of $S$, the operator $lambda \( g_(i j) \)
    rho \( g_(i j) \)$ sends $delta_x$ to $delta_(s_j x s_j^(- 1))$.
    For each fixed nonidentity word $x$, this conjugate leaves every finite subset of $F$ as $j arrow.r oo$:
    for large $j$, the letter $s_j$ occurs neither in $x$ nor in the finitely many words under consideration.
    Hence the conjugation operators converge weakly to $p_e$ in that slot.
    Combining this observation with (3.2) gives, for each fixed $n$ and $i$,
  #[#set math.equation(numbering: n => "(4.7)")
   $ lambda \( g_(i j) \) rho \( g_(i j) \) ⊗ f_n \( g_(i j) \) arrow.r_(j arrow.r oo)^(upright("WOT")) t E_(i n)
     tilde(R)_(i n) . $ <eq:joint-limit>]
  Here tensor products of bounded weakly convergent sequences on separate slots converge weakly,
    as follows first on elementary tensors and then by density.
    The finite spectral decompositions used in (3.2) justify the matrix-valued factor.
  For each $i \, n$, choose a weak operator cluster point $B_(i n)$ of $Sigma_n \( g_(i j) \)$ as $j arrow.r oo$.
    Such a point exists by weak operator compactness of the closed unit ball of $cal(B) \( H_n \)$,
    and belongs to $cal(A)_(i n)$. Norm balls are weak operator closed, so (4.6) and (4.7) imply
  $ parallel B_(i n) - t E_(i n) tilde(R)_(i n) parallel lt.eq beta_n . $
  Thus $T_(i n) = t^(- 1) B_(i n) in cal(A)_(i n)$ satisfies (4.2). No product of weak limits is used:
    commutation comes from membership in the two commuting algebras.
    Lemma 5 now produces commuting unitary matrices on $bb(C)^n$ approaching $U_n \, V_n$ in norm.
    This contradicts Lemma 4, proving that (4.5) cannot hold on any infinite subsequence.
  It follows that some $epsilon.alt_0 > 0$ bounds $parallel u -
    I_(H_n) parallel$ from below for every implementing unitary and all sufficiently large $n$.
    Otherwise one could choose increasing $n_j$ and implementing unitaries with distance less than $1 \/ j$,
    contrary to what we have just proved. Together with (4.4), this is Theorem 1. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
