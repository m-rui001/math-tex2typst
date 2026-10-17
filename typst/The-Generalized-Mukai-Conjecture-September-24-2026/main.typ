#set page(paper: "us-letter", margin: (x: 74.4pt, y: 74.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The generalized Mukai conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A Fano manifold is a smooth connected complex projective variety $X$ whose anticanonical divisor $- K_X$ is ample. Its Picard number $rho_X$ is the rank of its Néron–Severi group, or equivalently the dimension of the space of numerical divisor classes. If $X$ has positive dimension, its #emph[pseudoindex] is

$ iota_X = min { - K_X dot.op C : C subset X upright(" is an irreducible rational curve") } . $

The existence of rational curves on a Fano manifold makes this minimum well defined. The pseudoindex records the smallest anticanonical curve degree; it need not equal the largest integer dividing $- K_X$ in $"Pic" \( X \)$, which is the Fano index.

The generalized Mukai conjecture asks for a sharp bound on the Picard number in terms of dimension and pseudoindex, together with a classification of the extremal manifolds. We prove the conjectured bound and classification in arbitrary dimension.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a smooth connected complex projective Fano manifold of positive dimension $n$, Picard number $rho_X$ and pseudoindex $iota_X$. Then 
$ rho_X \( iota_X - 1 \) lt.eq n . $

 Equality holds if and only if 
$ X tilde.equiv \( bb(P)^(iota_X - 1) \)^(rho_X) . $

]
] <thm:main>

The index version originates in Mukai’s work #cite(label("Mukai1988")). Wiśniewski introduced the pseudoindex and proved that $2 iota_X > n + 2$ forces $rho_X = 1$ #cite(label("Wisniewski1990")) Theorem A. Bonavero, Casagrande, Debarre and Druel formulate the pseudoindex strengthening and establish it for Fano manifolds of dimension at most four, and for smooth toric Fano manifolds when $n lt.eq 7$ or $3 iota_X gt.eq n + 3$ #cite(label("BCDD2003")). Andreatta, Chierici and Occhetta extend the low-dimensional result to dimension five and prove high-pseudoindex cases subject to contraction hypotheses #cite(label("AndreattaChiericiOcchetta2004")).

For varieties with additional symmetry, Casagrande settles the bound and equality classification for $bb(Q)$-factorial Gorenstein toric Fano varieties in every dimension #cite(label("Casagrande2006")) Theorem 1(ii), and Pasquier treats $bb(Q)$-factorial Gorenstein horospherical Fano varieties #cite(label("Pasquier2010")) Theorem 1. More recently, Gagliardi, Hofscheier and Pearson prove the generalized conjecture for $bb(Q)$-factorial spherical Fano varieties #cite(label("GagliardiHofscheierPearson2025")).

Large pseudoindex gives a different route. Novelli and Occhetta prove both conclusions for all smooth Fano manifolds with $iota_X gt.eq \( n + 3 \) \/ 3$ #cite(label("NovelliOcchetta2010")), and Novelli later enlarges this range to $iota_X > n \/ 3$ #cite(label("Novelli2012")) Theorem 5.1. At the boundary $n = 3 iota_X$, Novelli also proves the conjecture when $X$ admits an extremal contraction of fiber type #cite(label("Novelli2026")). Theorem 1 imposes no restriction on the dimension, Picard number or geometry of the smooth Fano manifold.

The ordered-chain method of Bonavero, Casagrande, Debarre and Druel derives the inequality once $rho_X$ numerically independent proper irreducible components of the space of rational curves, joined by a nonempty chain, are available #cite(label("BCDD2003")) Corollary 5.3. Our argument first detects independent curve degrees in quantum correspondences. Proper covering families enter only at equality, when all the selected degrees are minimal.

=== The argument <the-argument>

Write $r = rho_X$ and $iota = iota_X$. If $iota = 1$, the inequality is strict because $n > 0$, so assume $iota gt.eq 2$. Choose divisor classes $D_1 \, dots.h \, D_r$ forming a numerical basis. Small quantum multiplication by these divisors gives commuting matrices $A_1 \( q \) \, dots.h \, A_r \( q \)$ on the even cohomology of $X$, with coefficients depending on $r$ nonzero formal variables $q_j$. Each matrix consists of classical cup product and a finite sum of two-point curve correspondences. A correspondence of anticanonical degree $d$ lowers cohomological codimension by $d - 1$. Consequently, a nonzero product in $r$ independent curve degrees would give

$ r \( iota - 1 \) lt.eq sum_(j = 1)^r \( d_j - 1 \) lt.eq n . $

The main task is to produce that product without assuming that quantum cohomology is semisimple.

We first prove a lower bound for a point descendant, an intersection number on the space of one-pointed rational stable maps involving the $\( d - 2 \)$nd power of the marked cotangent class. Here $d$ is the anticanonical degree. For any degree represented by a free rational map (a map whose pulled-back tangent bundle is globally generated), this number is at least $\( a d \)^(- \( d - 1 \))$, where $- a K_X$ is a fixed very ample divisor. To prove positivity, we contract all components away from the marking and map the evaluation fiber to a weighted projective stack. The image of its boundary has dimension too small to contribute. The pushed-forward virtual class is therefore a nonempty effective cycle, whose degree admits the required uniform bound. Section 3 gives the construction in families and keeps track of stack multiplicities.

Two-point descendant solutions of quantum differential equations provide a conceptual antecedent for the recurrence used next #cite(label("Givental1996")) §6. Here the divisor and recursion identities give a finite-shift recurrence for descendant vectors on an arbitrary smooth Fano manifold. After factorial normalization it yields an exponential upper bound. If every joint eigenvalue tuple of the quantum divisors satisfied a polynomial relation, the same recurrence would force decay of order $exp \( - c d log d \)$ along a suitable free curve degree. After the same factorial normalization, the descendant lower bound permits only exponential decay and rules this out. Thus one joint tuple has $r$ algebraically independent coordinates (Section 4).

Section 5 converts this algebraic independence into the required curve correspondences. An alternating trace of matrix-valued differentials is invariant even under changes of basis depending on $q$. Computing it in a common triangular basis detects the independent eigenvalues; computing it in the fixed cohomology basis detects a nonzero product in independent curve degrees. This argument also applies to nonsemisimple commuting matrices.

At equality all these degrees are minimal. Their nonzero product implies the existence of a chain of actual rational curves; minimality makes the full irreducible families containing them proper. The ordered-chain bound of Bonavero, Casagrande, Debarre and Druel applies to these components, as required by its erratum #cite(label("BCDDErratum")). A cyclic reordering makes every family covering, and Occhetta’s characterization of products of projective spaces gives the asserted rigidity #cite(label("Occhetta2006")). Section 6 verifies each of these family hypotheses.

== 2 Quantum divisors and point descendants <sec:setup>

We set up a finite collection of commuting matrices and a sequence of vectors on which they act. Their grading records anticanonical degrees; the vectors will connect their joint eigenvalues to rational curves. Throughout the proof, $X$ is a smooth projective complex Fano manifold, $n = dim X > 0$, $r = rho_X$, and $iota = iota_X gt.eq 2$. The case $iota = 1$ will require no argument beyond $n > 0$.

Choose an integral basis $D_1 \, dots.h \, D_r$ of the Néron–Severi group modulo torsion. A numerical curve degree is represented by

$ beta = \( D_1 dot.op beta \, dots.h \, D_r dot.op beta \) in bb(Z)^r . $

Here and below we use the same symbol for a numerical degree and its coordinate vector. Write

$ - K_X equiv sum_(j = 1)^r c_j D_j \, #h(2em) d_beta = sum_(j = 1)^r c_j beta_j . $

A positive degree means the degree of a nonconstant genus-zero stable map. Every such degree has $d_beta gt.eq iota$. There are only finitely many positive numerical degrees with bounded $d_beta$: for a sufficiently large integer $a$, both $a \( - K_X \) + D_j$ and $a \( - K_X \) - D_j$ are ample, so $\| beta_j \| lt.eq a d_beta$ on effective degrees. When several curve classes have the same numerical degree, we sum their invariants. Proper finite-type spaces of stable maps of bounded projective degree make these sums finite.

We use ordinary genus-zero Gromov–Witten invariants, defined by the virtual fundamental classes of stable-map stacks. An insertion $tau_ell \( a \)$ means $psi^ell "ev"^(*) a$ at the indicated marking: $"ev"$ evaluates the stable map there, and $psi$ is the first Chern class of its cotangent line. The divisor, string and topological recursion equations, together with associativity, are the standard identities we use #cite(label("BehrendVirtual")) #cite(label("KontsevichManinQuantum")) #cite(label("KontsevichManinDescendants")) #cite(label("PandharipandeDescendants")). The discussion below specifies all unstable conventions needed here. Set

$ H = xor.big_(k = 0)^n H_k \, #h(2em) H_k = H^(2 k) \( X \, bb(C) \) \, #h(2em) \( a \, b \) = integral_X a union b \, $

and put $H_k = 0$ outside this range. The pairing on $H$ is nondegenerate. We work only with even cohomology; invariants involving a single odd intermediate class and otherwise even insertions vanish by parity.

For a positive numerical degree $beta$, define $S_beta in "End" \( H \)$ by

$ \( S_beta a \, b \) = chevron.l a \, b chevron.r_beta . $

The virtual dimension of the two-pointed space is $n + d_beta - 1$. Consequently

#[#set math.equation(numbering: n => "(1)")
 $ S_beta \( H_k \) subset H_(k + 1 - d_beta) . $ <eq:grading>]

In particular $S_beta = 0$ for $d_beta > n + 1$. For nonzero formal variables $q_1 \, dots.h \, q_r$, write $q^beta = product_j q_j^(beta_j)$ and define

#[#set math.equation(numbering: n => "(2)")
 $ A_j \( q \) = D_j union \( - \) + sum_(beta > 0) q^beta beta_j S_beta = sum_gamma q^gamma A_(j \, gamma) . $ <eq:quantum-operators>]

Thus $A_(j \, 0) = D_j union \( - \)$, $A_(j \, beta) = beta_j S_beta$ for positive degrees, and all other coefficients vanish. The grading bound and finiteness of bounded degrees make these Laurent polynomial matrices. The divisor equation identifies them with small quantum multiplication by $D_j$, so associativity implies that they commute. If $R_t$ acts by $t^k$ on $H_k$, then

#[#set math.equation(numbering: n => "(3)")
 $ A_j \( t^(c_1) q_1 \, dots.h \, t^(c_r) q_r \) = t R_t^(- 1) A_j \( q \) R_t . $ <eq:homogeneity>]

Indeed the classical term raises the grading by one, whereas the $beta$ term changes it by $1 - d_beta$.

=== 2.1 The descendant recurrence <the-descendant-recurrence>

Two-point descendant generating series also occur in Givental’s quantum differential framework #cite(label("Givental1996")) §6. The recurrence below is derived directly from the virtual genus-zero identities cited above, so it does not require a convexity assumption on $X$.

Let $upright("pt") in H_n$ be the class of a point, normalized by $integral_X upright("pt") = 1$. Define $v_0 = upright("pt")$ and, for positive degrees, define $v_beta in H$ by

$ \( v_beta \, b \) = sum_(ell gt.eq 0) chevron.l tau_ell \( upright("pt") \) \, b chevron.r_beta . $

The dimension constraint makes each sum finite. Set all other $v_beta$ equal to zero. In particular there is no degree-zero unstable two-point invariant in this definition.

#thm([Lemma 2.1.])[
  #emph[For every integer degree vector $beta$ with $d_beta > 0$ and every $j in { 1 \, dots.h \, r }$, 
#[#set math.equation(numbering: n => "(4)")
 $ beta_j v_beta = sum_gamma A_(j \, gamma) v_(beta - gamma) . $ <eq:recurrence>]

 For a positive degree $beta$, 
#[#set math.equation(numbering: n => "(5)")
 $ \( v_beta \, 1 \) = chevron.l tau_(d_beta - 2) \( upright("pt") \) chevron.r_beta . $ <eq:string-pairing>]

]
] <lem:recurrence>

#proof[
  Pair the first identity with an arbitrary even class $b$. Inserting $D_j$ into $chevron.l tau_ell \( upright("pt") \) \, b chevron.r_beta$ multiplies the invariant by $beta_j$ #cite(label("KontsevichManinDescendants")) Lemma 1.4, equation (12): the descendant correction contains $D_j union upright("pt") = 0$. For $ell > 0$, genus-zero topological recursion at the point marking #cite(label("KontsevichManinDescendants")) equation (4a) separates a two-point factor containing $tau_(ell - 1) \( upright("pt") \)$ from a three-point factor containing $D_j$ and $b$. The point side has positive degree, since a two-point degree-zero component is unstable. The other side can have degree zero, in which case it contributes the classical cup operator. Summing over $ell > 0$ therefore gives the terms with positive-degree $v_(beta - gamma)$. The $ell = 0$ primary invariant gives the remaining term $A_(j \, beta) v_0$. Splitting via the Poincaré pairing gives exactly (4). If a degree is not represented, the same splitting identity holds with zero coefficients.
  For the second identity, dimension leaves only $ell = d_beta - 1$ in the pairing with $1$. The string equation #cite(label("PandharipandeDescendants")) §1.2, p. 311 then gives
  $ chevron.l tau_(d_beta - 1) \( upright("pt") \) \, 1 chevron.r_beta = chevron.l tau_(d_beta - 2) \( upright("pt") \) chevron.r_beta . $
  The exponent is nonnegative because $d_beta gt.eq iota gt.eq 2$. ◻
]

The next section gives a positive lower bound for this pairing whenever $beta$ has a free rational representative. It is a statement about a pushforward of the virtual evaluation fiber; it will not require the entire virtual class to be effective.

== 3 A lower bound for point descendants <sec:descendants>

The spectral argument will require point descendants in a sequence of large curve degrees. Their virtual definition does not give positivity directly. We prove the required lower bound by a contraction that forgets all components away from the marked component. Its boundary image is too small to contribute to the integral.

Throughout this section, $X$ is a smooth projective complex Fano manifold of dimension $n > 0$ and pseudoindex at least two. Fix an embedding

$ dotless.j : X arrow.r.hook bb(P)^N \, #h(2em) dotless.j^(*) cal(O)_(bb(P)^N) \( 1 \) tilde.equiv cal(O)_X \( - a K_X \) \, $

where $a$ is a positive integer. A morphism $f : bb(P)^1 arrow.r X$ is #emph[free] if $f^(*) T_X$ is globally generated. For a numerical curve degree $beta$, set $d_beta = - K_X dot.op beta$. The notation $overline(cal(M))_(0 \, 1) \( X \, beta \)$ includes the union over actual curve classes with numerical degree $beta$. This is a finite union: maps of fixed projective degree belong to a finite-type proper moduli stack, and numerical degree is locally constant.

We use rational Chow groups of Deligne–Mumford stacks. In particular, degrees of zero-dimensional stack cycles include their stabilizer denominators. The marked cotangent line has first Chern class $psi$.

#thm([Proposition 3.1.])[
  (Point-descendant lower bound).  #emph[Suppose that $beta$ is represented by a nonconstant free map $bb(P)^1 arrow.r X$. Put $d = d_beta$ and $b = a d$. Then 
$ ⟨tau_(d - 2) \( upright("pt") \)⟩_beta gt.eq 1 / b^(d - 1) . $

]
] <prop:descendant-bound>

We will express this descendant as the degree of a nonempty effective cycle in a weighted projective stack whose weights are at most $b$. The main task is to obtain that cycle from the virtual evaluation fiber: irreducible maps will contribute with stack degree one, while the boundary image will have too small a dimension to contribute. After proving the bound, we show that free degrees are Zariski dense in the numerical curve space.

=== 3.1 A free evaluation fiber <a-free-evaluation-fiber>

There is a very general point $x in X$ such that every nonconstant morphism $bb(P)^1 arrow.r X$ whose image contains $x$ is free. Here is the argument, including the quantifier over special maps. Stratify the nonfree locus in each morphism scheme into smooth irreducible locally closed reduced strata. There are countably many such strata. If the evaluation from $bb(P)^1 times T$, for one stratum $T$, were dominant, generic smoothness would give a point $\( p \, f \)$ where its differential is surjective. Its image is contained in the image of

$ H^0 \( bb(P)^1 \, f^(*) T_X \) arrow.r \( f^(*) T_X \)_p . $

Indeed, moving $p$ gives directions also obtained from reparametrizations of the source. Splitting $f^(*) T_X = xor.big_j cal(O) \( a_j \)$, surjectivity at one point implies $a_j gt.eq 0$ for every $j$, contrary to the choice of $T$. Thus each such evaluation image has proper closure, and their complement gives the assertion.

Evaluation is smooth at a free map: the obstruction groups $H^1 \( bb(P)^1 \, f^(*) T_X \)$ and $H^1 \( bb(P)^1 \, f^(*) T_X \( - p \) \)$ vanish. Consequently the degree $beta$ in Proposition 3 has maps through an open subset of $X$. Choose $x$ in this open subset and outside all the exceptional closed subsets just considered.

Let

$ F = "ev"^(- 1) \( x \) subset overline(cal(M))_(0 \, 1) \( X \, beta \) \, #h(2em) h = d - 2 . $

The fiber carries the refined virtual class

$ \[ F \]^(upright("vir")) = x^(!) \[ overline(cal(M))_(0 \, 1) \( X \, beta \) \]^(upright("vir")) in A_h \( F \)_(bb(Q)) . $

Let $U subset F$ be the open substack with irreducible source. It is nonempty, smooth of dimension $h$, and

$ \[ F \]^(upright("vir")) \|_U = \[ U \] . $

Only this open part is asserted to be unobstructed.

To use this equality of classes on $U$, we will construct a proper morphism that preserves the marked cotangent class, has generic stack degree one on $U$, and sends $F \\ U$ to a locus of dimension less than $h$. These properties will make the pushforward of $\[ F \]^(upright("vir"))$ effective.

=== 3.2 Contracting away from the marking <contracting-away-from-the-marking>

Compose maps with $dotless.j$. Their projective degree is $b$, and this composition changes no stable domain, since it contracts no nonconstant component. At a geometric point, retain the component carrying the marking and replace each attached tree by a common zero of the map sections at its attachment point. More precisely, multiply the original sections restricted to the marked component by a common factor whose vanishing order at each attachment is the projective degree of the removed tree. The resulting tuple has total degree $b$ and no common zero at the marking. This description also allows the marked component to be constant.

We now construct these data in families on $overline(cal(M))_(0 \, 1) \( bb(P)^N \, b \)$ and track the marked cotangent line. The contraction also follows from the one-marked intermediate-space construction of Mustaţă–Mustaţă #cite(label("MustataMustata2007")) Definition 1.2 and Proposition 1.3, with the fine-stack construction of #cite(label("MustataMustataChow")) Proposition 1.7.

Write $pi : cal(C) arrow.r overline(cal(M))_(0 \, 1) \( bb(P)^N \, b \)$ for the universal curve, $s$ for its marking, and $cal(L)$ for the pullback of $cal(O)_(bb(P)^N) \( 1 \)$. The moduli stack is smooth and its boundary has the usual independent node-smoothing parameters: on a genus-zero tree, $H^1 \( C \, f^(*) T_(bb(P)^N) \) = 0$. Thus the universal curve is regular, with local nodal models $u v = t$.

For each boundary branch separating an unmarked tail of total degree $e$, take in a local node-smoothing chart the Cartier divisor consisting of its unmarked side. The marked side and degree $e$ are intrinsic, so summing these local divisors over all such branches is invariant under permutations of equal-degree branches and glues in families. Let $Delta_e$ be this sum, counting repeated branches once each. Only $1 lt.eq e lt.eq b - 1$ occurs. A tail of degree $b$ would leave a degree-zero marked side with only one external attachment; a finite tree of contracted components with one marking and one external attachment cannot satisfy stability.

Set

$ cal(L)^(+) = cal(L) #scale(x: 180%, y: 180%)[\(] sum_(e = 1)^(b - 1) e Delta_e #scale(x: 180%, y: 180%)[\)] . $

On a nodal fiber, twisting by an unmarked-side divisor transfers one unit of degree across that node toward the marked side. To compute the resulting multidegree, root the dual tree at the marked component. For a nonroot component $v$, let $b_v$ be its original degree and $E_v$ the total degree of the subtree rooted at $v$. If $w$ runs over its children, then

$ deg_v cal(L)^(+) = b_v - E_v + sum_w E_w = 0 . $

On the root, of original degree $b_0$, the degree is $b_0 + sum_w E_w = b$. Thus $cal(L)^(+)$ has degree $b$ on the component containing $s$, and degree zero elsewhere.

The line bundle $cal(O)_(cal(C)) \( s \)$ has degree one on that marked component and degree zero elsewhere. On each fiber it is globally generated with $h^0 = 2$ and $h^1 = 0$. Cohomology and base change consequently give a rank-two bundle $pi_(*) cal(O)_(cal(C)) \( s \)$, and its evaluation map contracts the universal curve onto a $bb(P)^1$-bundle. This contraction is an isomorphism on the marked component and near the section.

The line bundle $cal(L)^(+) \( - b s \)$ has multidegree zero on every fiber. Its fiberwise $h^0 = 1$, $h^1 = 0$, and evaluation map show that it is pulled back from the base. Hence $cal(L)^(+)$ descends to a relative degree-$b$ line bundle on the contracted $bb(P)^1$-bundle. Fiberwise pullback identifies its sections with those of $cal(L)^(+)$: a section is constant on every contracted tail and is determined by its value on the marked component. The corresponding $H^0$ bundles agree by base change, so the inclusion $cal(L) arrow.r cal(L)^(+)$ sends the original map sections to sections of the descended bundle in families. Restricted to the marked component, this inclusion multiplies them by a section vanishing to order $e$ at the attachment of a tree of degree $e$. The original map sections have no common zero, so the new common zero has exactly that multiplicity. These constructions commute with base change and produce the retained data in families. Since the contraction is an isomorphism near the marking, it preserves the marked cotangent line.

=== 3.3 The weighted projective fiber <the-weighted-projective-fiber>

Choose target coordinates with $x = \[ 1 : 0 : dots.h.c : 0 \]$. Locally on the base, identify the contracted bundle with a product $bb(P)^1$-bundle and the descended line bundle with $cal(O)_(bb(P)^1) \( b \)$. Put the mark at infinity and normalize the degree-$b$ leading coefficient vector of the polynomial sections to $\( 1 \, 0 \, dots.h \, 0 \)$. Translation of the affine coordinate uniquely eliminates the coefficient of degree $b - 1$ in the first polynomial. After these normalizations, two local choices differ only by scaling the affine coordinate. Consequently the coefficient tuples glue as points of the quotient stack for this residual scaling action.

The remaining coefficients have weights

$ underbrace(1 \, dots.h \, 1, N) \, quad underbrace(2 \, dots.h \, 2, N + 1) \, quad dots.h \, quad underbrace(b \, dots.h \, b, N + 1) . $

They are not all zero. Otherwise the polynomial tuple would be $\( z^b \, 0 \, dots.h \, 0 \)$, a constant map with all degree concentrated at one basepoint. A constant marked component has at least two distinct attachments by stability, so cannot produce that tuple; a nonconstant marked component cannot produce it either.

Let $w_1 \, dots.h \, w_M$ be the displayed list of weights and put

$ cal(W) = \[ \( bb(A)^M \\ { 0 } \) \/ bb(G)_m \] \, #h(2em) lambda dot.op \( x_1 \, dots.h \, x_M \) = \( lambda^(w_1) x_1 \, dots.h \, lambda^(w_M) x_M \) . $

This is the weighted projective stack in question. We have constructed a proper morphism

$ Phi : F arrow.r cal(W) . $

The map is proper because $F$ is proper and $cal(W)$ is separated. For the reparametrization $z mapsto lambda z$, the normalized coefficient of $z^(b - j)$ has weight $- j$, and the cotangent $d \( 1 \/ z \)$ has weight $- 1$. Replacing $lambda$ by $lambda^(- 1)$ gives the displayed positive weights and identifies the cotangent line with the pullback of $cal(O)_(cal(W)) \( 1 \)$, as in the one-marked weighted construction of #cite(label("MustataMustata2007")) proof of Lemma 3.3. Thus, with $xi = c_1 \( cal(O)_(cal(W)) \( 1 \) \)$,

$ psi = Phi^(*) xi . $

On the open substack $U$, the tuple has no basepoints and recovers the entire pointed map. Its image is the locus of basepoint-free tuples whose maps factor through $dotless.j \( X \)$ and have numerical degree $beta$ there. A residual scaling fixes the tuple exactly when the associated reparametrization preserves the pointed map, so the stabilizers are the automorphism groups of the pointed maps. We therefore have an identification of stacks onto this locus, with generic stack degree one on every irreducible component of $U$.

=== 3.4 The boundary does not contribute <the-boundary-does-not-contribute>

Consider a boundary stratum of $F$. Let $d_0$ be the anticanonical degree of the marked component and let $u gt.eq 1$ be the number of trees directly attached to it. Its image in $cal(W)$ is determined by the marked map, the mark and attachment points, and the degrees of those trees. It does not retain the maps on the trees: a tree of anticanonical degree $d_i$ is recorded only by its common-zero multiplicity $a d_i$.

If $d_0 > 0$, the marked map is free, since it passes through $x$. The space of its parametrized maps has dimension $n + d_0$. Adding $u + 1$ marked points, imposing evaluation $x$, and dividing by source reparametrization gives dimension

$ n + d_0 + \( u + 1 \) - n - 3 = d_0 + u - 2 . $

If $d_0 = 0$, the map is the constant $x$, stability gives $u gt.eq 2$, and the remaining data have dimension $dim cal(M)_(0 \, u + 1) = u - 2$, the same formula.

Every attached tree contains a nonconstant rational component. The pseudoindex assumption implies

$ d - d_0 gt.eq 2 u \, #h(2em) d_0 + u - 2 lt.eq d - u - 2 lt.eq h - 1 . $

There are finitely many discrete boundary types. We conclude that

$ dim Phi \( F \\ U \) < h . $

This estimate concerns the image only; it makes no smoothness or dimension assertion about the spaces of tail maps.

Write $Z_alpha$ for the closures in $F$ of the irreducible components of $U$. Chow localization and $\[ F \]^(upright("vir")) \|_U = \[ U \]$ express

$ \[ F \]^(upright("vir")) - sum_alpha \[ Z_alpha \] $

as a class supported on $F \\ U$. Its pushforward to $cal(W)$ vanishes, since every $h$-dimensional boundary cycle has image of smaller dimension. The generic degree-one statement on $U$ therefore gives

$ Phi_(*) \[ F \]^(upright("vir")) = sum_alpha \[ overline(Phi \( U_alpha \)) \] . $

This is a nonempty effective sum of $h$-dimensional integral stack cycles. Virtual effectiveness has been established only after pushforward; no effectiveness of $\[ F \]^(upright("vir"))$ itself was assumed.

=== 3.5 Degrees in a weighted projective stack <degrees-in-a-weighted-projective-stack>

#thm([Lemma 3.2.])[
  #emph[Let $cal(P)$ be a weighted projective stack with positive integer weights at most $b$, and let $Z subset cal(P)$ be an integral closed substack of dimension $h$. Then 
$ integral_Z c_1 \( cal(O)_(cal(P)) \( 1 \) \)^h gt.eq b^(- \( h + 1 \)) . $

]
] <lem:weighted-degree-lower>

#proof[
  The affine cone of $Z$ is defined by an ideal homogeneous for the weighted grading. Degenerate it to a monomial initial ideal. This is a flat grading-preserving degeneration. Removing the origin and quotienting by the grading action of $bb(G)_m$ gives a flat family of closed substacks of the fixed proper weighted projective stack. Its $cal(O) \( 1 \)$-degree is constant.
  The top-dimensional cycle of the monomial limit is a nonempty sum of coordinate weighted projective substacks, with positive integer multiplicities. A component of dimension $h$ has the form $bb(P) \( w_0 \, dots.h \, w_h \)$, with $1 lt.eq w_j lt.eq b$, and
  $ integral_(bb(P) \( w_0 \, dots.h \, w_h \)) c_1 \( cal(O) \( 1 \) \)^h = frac(1, w_0 dots.h.c w_h) . $
  For clarity, the power-coordinate map
  $ bb(P)^h arrow.r bb(P) \( w_0 \, dots.h \, w_h \) \, #h(2em) \[ x_0 : dots.h.c : x_h \] mapsto \[ x_0^(w_0) : dots.h.c : x_h^(w_h) \] $
  is the map of stacks specified by the line bundle $cal(O)_(bb(P)^h) \( 1 \)$ and these sections of its powers. It is representable and finite, pulls back $cal(O) \( 1 \)$ to $cal(O)_(bb(P)^h) \( 1 \)$, and has stack degree $product_j w_j$. On the dense tori the coarse degree is $product_j w_j \/ g$, where $g = gcd \( w_0 \, dots.h \, w_h \)$; the target’s generic stabilizer has order $g$, giving the stated stack degree. This also covers $h = 0$, when the target is $B mu_(w_0)$. The displayed integral follows by the projection formula.
  Each component degree is at least $b^(- \( h + 1 \))$, so the same lower bound holds for their nonempty positive sum and hence for $Z$. ◻
]

#proof[
  By the definition of the point descendant and by the projection formula,
  $ ⟨tau_(d - 2) \( upright("pt") \)⟩_beta = integral_(\[ F \]^(upright("vir"))) psi^h = integral_(Phi_(*) \[ F \]^(upright("vir"))) xi^h . $
  The last cycle is the nonempty effective sum obtained above. All weights of $cal(W)$ are at most $b$. Lemma 4 now gives the bound $b^(- \( h + 1 \)) = b^(- \( d - 1 \))$. ◻
]

=== 3.6 Enough free degrees <enough-free-degrees>

The next lemma lets us apply the descendant bound in a direction avoiding any specified nonzero polynomial relation. Write $N_1 \( X \)_(bb(C))$ for the complex vector space of numerical curve classes.

#thm([Lemma 3.3.])[
  #emph[The numerical degrees represented by nonconstant free rational maps are Zariski dense in $N_1 \( X \)_(bb(C))$. They are closed under addition and under multiplication by positive integers.]
] <lem:free-dense>

#proof[
  We first prove closure under addition. Take two free maps of degrees $beta_1 \, beta_2$. Their evaluation images contain nonempty open subsets of $X$. Deform them so that they meet at a common point and glue there. On the resulting two-component genus-zero curve $C$, let $f : C arrow.r X$ be the glued map and choose a smooth point $p$ of the first component. Normalization gives
  $ H^1 \( C \, f^(*) T_X \) = H^1 \( C \, f^(*) T_X \( - p \) \) = 0 . $
  Indeed the corresponding cohomology groups vanish on both components, and sections on the second component evaluate surjectively at the node. Deformation theory therefore permits a pointed smoothing of the node. Semicontinuity of the second vanishing shows that the smoothed map is free. Its degree is $beta_1 + beta_2$.
  We next show that free degrees span the numerical vector space. Smooth complex Fano manifolds are rationally chain connected by #cite(label("Campana1992")) Corollary 3.2, hence rationally connected by #cite(label("Debarre2011")) Theorem 2.49; in characteristic zero this is equivalent to separable rational connectedness #cite(label("Debarre2011")) Definition 2.20 and the following discussion. The rational-connectedness results are due to Campana and Kollár–Miyaoka–Mori #cite(label("Campana1992")) #cite(label("KollarMiyaokaMori1992")). By #cite(label("TianZong2014")) Theorem 1.3, the Chow group of one-cycles on $X$ is generated by rational curves. In particular, rational curve classes span $N_1 \( X \)_(bb(C))$. A map is #emph[very free] if its pulled-back tangent bundle is ample. For a morphism $f_0 : bb(P)^1 arrow.r X$, comb smoothing attaches a nonempty finite collection of very free rational maps as teeth and deforms the resulting tree to a free rational map. More precisely, Tian–Zong #cite(label("TianZong2014")) Proposition 2.4, with handle $bb(P)^1$ and line-bundle twist of degree $- 1$, gives a smoothing $f$ with $H^1 \( bb(P)^1 \, f^(*) T_X \( - 1 \) \) = 0$. Splitting on $bb(P)^1$ shows that $f$ is free. Its numerical degree is the sum of the handle degree and the tooth degrees. The tooth degrees are free, and their sum is free by closure under addition. Every rational degree is consequently a difference of free degrees, which proves the spanning assertion.
  Choose $r = dim N_1 \( X \)_(bb(C))$ linearly independent free degrees from the spanning set. Every positive integral combination of these degrees is free by the preceding addition argument. Such combinations are Zariski dense: in the basis formed by the chosen degrees, a polynomial vanishing on $bb(Z)_(> 0)^r$ vanishes by successive application of the one-variable root bound. Finally, covers of a free map remain free, since pullback preserves the nonnegative summands of its split tangent bundle. This gives the assertion about positive integer multiples directly as well. ◻
]

== 4 An independent joint eigenvalue tuple <sec:spectral>

We now combine the descendant lower bound with the recurrence to show that the quantum divisors vary in all $r$ numerical directions. Let

$ L = overline(bb(C) \( q_1 \, dots.h \, q_r \)) . $

The commuting matrices $A_1 \, dots.h \, A_r$ can be simultaneously put in upper triangular form over $L$. A #emph[joint diagonal tuple] is the $r$-tuple of diagonal entries at one position in such a form.

#thm([Proposition 4.1.])[
  #emph[At least one joint diagonal tuple $\( lambda_1 \, dots.h \, lambda_r \)$ of the quantum divisor matrices has coordinates algebraically independent over $bb(C)$.]
] <prop:spectral>

We first normalize the descendant recurrence to obtain a uniform exponential upper bound. We then show that a polynomial relation among every joint tuple would force superexponential decay along a free degree, contradicting Proposition 3.

=== 4.1 Factorial normalization <factorial-normalization>

For $d_beta gt.eq 0$ and $0 lt.eq k lt.eq n$, put

$ w_(beta \, k) = \( d_beta + k \) ! thin v_(beta \, k) \, #h(2em) w_beta = sum_(k = 0)^n w_(beta \, k) \, $

where $v_(beta \, k)$ is the $H_k$ component. Put $w_beta = 0$ when $d_beta < 0$. For a sequence $u$ indexed by $bb(Z)^r$, let $\( E^gamma u \)_beta = u_(beta - gamma)$ and set $A_j \( E \) = sum_gamma A_(j \, gamma) E^gamma$. These are finite sums of shifts, and they commute.

If $A_(j \, gamma)$ sends an input component $H_l$ to $H_k$, then $l = k - 1 + d_gamma$. Thus

$ d_(beta - gamma) + l = d_beta + k - 1 . $

Multiplying the $H_k$ component of (4) by $\( d_beta + k - 1 \) !$ gives, for $d_beta > 0$,

#[#set math.equation(numbering: n => "(6)")
 $ \( A_j \( E \) w \)_(beta \, k) = frac(beta_j, d_beta + k) thin w_(beta \, k) . $ <eq:normalized-recurrence>]

Every nonzero input term has a nonnegative factorial argument. We do not use this formula at degree zero.

Fix a norm on $H$. There is a constant $B > 1$ such that

#[#set math.equation(numbering: n => "(7)")
 $ parallel w_beta parallel lt.eq B^(d_beta + 1) #h(2em) \( d_beta gt.eq 0 \) . $ <eq:exponential-bound>]

To prove this, let $C_(*) = \( sum_j c_j D_j \) union \( - \)$, and let $T_d$ multiply $H_k$ by $1 + k \/ d$ for positive integers $d$. Taking the linear combination of (6) with coefficients $c_j$ yields

$ w_beta = \( I - T_(d_beta) C_(*) \)^(- 1) T_(d_beta) sum_(gamma > 0) d_gamma S_gamma w_(beta - gamma) . $

Since $T_d C_(*)$ raises grading, the inverse $\( I - T_d C_(*) \)^(- 1)$ is the finite sum $sum_(a = 0)^n \( T_d C_(*) \)^a$. Its norm, and that of $T_d$, are uniformly bounded for $d gt.eq 1$. The sum uses finitely many positive shifts, each of which strictly decreases $d$. Induction on the nonnegative integer $d$ proves (7), taking $B$ large enough for the finite set of coefficients and the initial value $w_0 = n ! upright("pt")$. All other degree-zero coefficients are zero.

=== 4.2 A relation would force too much decay <a-relation-would-force-too-much-decay>

#proof[
  Suppose, contrary to the proposition, that every joint diagonal tuple is algebraically dependent over $bb(C)$. There are finitely many such tuples. Multiplying a nonzero polynomial relation for each of them gives a nonzero $P in bb(C) \[ T_1 \, dots.h \, T_r \]$ vanishing on all of them. If $m = dim H$, simultaneous triangularization gives $P \( A_1 \, dots.h \, A_r \)^m = 0$. Substitute $\( t^(c_j) q_j \)_j$ and use (3). It follows that $P \( t A_1 \, dots.h \, t A_r \)^m = 0$. The leading coefficient in $t$ gives
  #[#set math.equation(numbering: n => "(8)")
   $ Q \( A_1 \, dots.h \, A_r \) = 0 $ <eq:homogeneous-relation>]
  for a nonzero homogeneous polynomial $Q$: the $m$th power of the top homogeneous part of $P$.
  By Lemma 5, choose a nonconstant free degree $eta$ with $Q \( eta \) eq.not 0$. Set $p_(*) = eta \/ d_eta$. Homogeneity gives $Q \( p_(*) \) eq.not 0$. Choose a small bounded neighborhood of $p_(*)$ on whose closure $\| Q \|$ is bounded below by a positive constant. The substitution $q^gamma mapsto E^gamma$ is a homomorphism from Laurent polynomials to constant-coefficient shift operators. Applying it entrywise to (8) gives $Q \( A_1 \( E \) \, dots.h \, A_r \( E \) \) = 0$. Since these operators commute, polynomial differencing gives
  #[#set math.equation(numbering: n => "(9)")
   $ Q \( p \) I = sum_(j = 1)^r B_j \( p \, E \) \( p_j I - A_j \( E \) \) . $ <eq:polynomial-difference>]
  Here $p = \( p_1 \, dots.h \, p_r \)$ consists of scalar parameters and every $B_j$ is a matrix polynomial in $p$ and finitely many shifts. This follows by successively replacing the commuting variables in $Q \( p \) - Q \( A \( E \) \)$.
  Apply (9) to $w$ at an index $beta$, with $p = beta \/ d_beta$ held fixed throughout this application. For any shift $delta$ that occurs and any $k$, the relevant component of the rightmost factor is
  $ \( \( p_j I - A_j \( E \) \) w \)_(beta - delta \, k) & = (beta_j / d_beta - frac(beta_j - delta_j, d_beta - d_delta + k)) w_(beta - delta \, k)\
 & = frac(p_j \( k - d_delta \) + delta_j, d_beta - d_delta + k) w_(beta - delta \, k) . $
  When $p$ stays in the chosen neighborhood and $d_beta$ is large, the last scalar factor is uniformly $O \( d_beta^(- 1) \)$: its numerator is bounded, and its denominator differs from $d_beta$ by a bounded amount. The finitely many coefficient matrices in $B_j$ are uniformly bounded there. Hence there are $C > 0$ and a finite set of shifts $U$ such that
  #[#set math.equation(numbering: n => "(10)")
   $ parallel w_beta parallel lt.eq C / d_beta max_(delta in U) parallel w_(beta - delta) parallel . $ <eq:small-shift-bound>]
  If the right side of (9) is the zero operator, it directly implies $w_beta = 0$ in this neighborhood, which already contradicts the descendant lower bound. We may therefore take $U$ nonempty, including the zero shift if it occurs.
  Take $beta = s eta$ for positive integers $s$. For sufficiently small fixed $epsilon.alt > 0$, every index reached by at most $floor.l epsilon.alt d_beta floor.r$ successive shifts from $U$ has degree in $\[ d_beta \/ 2 \, 2 d_beta \]$ and direction in the chosen neighborhood. Indeed each step changes both the vector and its degree by bounded amounts; the total change is at most a constant times $epsilon.alt d_beta$. Choose $epsilon.alt$ first to keep the degree above $d_beta \/ 2$, then to keep the normalized direction close to $p_(*)$. For large $s$ all these indices also exceed the fixed lower threshold for (10). Iteration, followed by (7), gives
  #[#set math.equation(numbering: n => "(11)")
   $ parallel w_beta parallel lt.eq (frac(2 C, d_beta))^(floor.l epsilon.alt d_beta floor.r) B^(2 d_beta + 1) . $ <eq:superexponential-bound>]
  This finite iteration does not require the shifts to decrease the degree strictly, and it remains valid at indices with zero-extended coefficients.
  On the other hand, every positive multiple $s eta$ is free: compose a free map of degree $eta$ with a degree-$s$ cover of $bb(P)^1$. By (5) and Proposition 3,
  $ \( w_beta \, 1 \) gt.eq frac(\( d_beta + n \) !, \( a d_beta \)^(d_beta - 1)) gt.eq a thin d_beta^(n + 1) \( a e \)^(- d_beta) \, $
  where $a$ is fixed by the anticanonical embedding. The last inequality uses $d ! gt.eq \( d \/ e \)^d$. Pairing with $1$ is a bounded linear functional on $H$, so this bounds $parallel w_beta parallel$ below up to a fixed factor. Its logarithm is bounded below by $- O \( d_beta \)$, whereas the logarithm of (11) is $- epsilon.alt d_beta log d_beta + O \( d_beta \)$. This contradiction proves Proposition 6. ◻
]

== 5 From divisor eigenvalues to independent curve degrees <sec:trace>

We now turn algebraic independence of a joint eigenvalue tuple into a nonzero product of curve correspondences in independent degrees. The point requiring care is that a common triangular basis can depend on the variables $q_1 \, dots.h \, q_r$. The following lemma accounts for the derivatives of that basis and applies without a semisimplicity assumption.

For the Hochschild generalized-trace and inner-conjugation viewpoint, see Khalkhali #cite(label("Khalkhali2009")) Section 3.5, Examples 3.5.5–3.5.6 and Lemma 3.5.1. We give an elementary proof of the specific differential-form statement needed here.

#thm([Lemma 5.1.])[
  (An alternating trace form).  #emph[Let $L$ be a field extension of $bb(C)$, let $A_1 \, dots.h \, A_r in "Mat"_m \( L \)$ commute pairwise, and let $A_0 in "Mat"_m \( L \)$ commute with each $A_j$, where $r gt.eq 1$. Use the Kähler differential $upright(d)$ of $L \/ bb(C)$, and multiply matrix-valued differential forms by matrix multiplication and exterior multiplication. Then 
#[#set math.equation(numbering: n => "(12)")
 $ Theta \( A_0 \; A_1 \, dots.h \, A_r \) := sum_(pi in frak(S)_r) "sgn" \( pi \) "Tr" #scale(x: 120%, y: 120%)[\(] A_0 thin upright(d) A_(pi \( 1 \)) dots.h.c upright(d) A_(pi \( r \)) #scale(x: 120%, y: 120%)[\)] $ <eq:alternating-trace>]

 is unchanged by replacing every $A_j$, including $A_0$, with $G A_j G^(- 1)$ for any $G in "GL"_m \( L \)$, and differentiating the new entries.]
] <lem:alternating-trace>

#proof[
  Fix an arbitrary matrix-valued one-form $K$. For a scalar parameter $t$, set
  $ B_j \( t \) & = upright(d) A_j + t \[ K \, A_j \] \,\
F \( t \) & = sum_(pi in frak(S)_r) "sgn" \( pi \) "Tr" \( A_0 B_(pi \( 1 \)) \( t \) dots.h.c B_(pi \( r \)) \( t \) \) . $
  Thus $F \( t \)$ is a polynomial with values in differential forms. Differentiating $\[ A_j \, A_l \] = 0$ and using the Jacobi identity gives
  #[#set math.equation(numbering: n => "(13)")
   $ \[ A_j \, B_l \( t \) \] = \[ A_l \, B_j \( t \) \] . $ <eq:commuting-differentials>]
  Here each commutator contains a degree-zero matrix, so it is the ordinary commutator.
  We prove that the derivative $F' \( t \)$ is zero separately at each factor position. Fix a position $s$ and a permutation $pi$, and abbreviate $C_h = B_(pi \( h \)) \( t \)$ and $j = pi \( s \)$. Write
  $ P = C_1 dots.h.c C_(s - 1) \, #h(2em) Q = C_(s + 1) dots.h.c C_r . $
  The contribution obtained by differentiating position $s$ is
  $ T_(pi \, s) = "Tr" \( A_0 P K A_j Q \) - "Tr" \( A_0 P A_j K Q \) . $
  To compute it, move $A_j$ rightward through $Q$, cyclically from the end of the trace to the beginning, through $A_0$, and then rightward through $P$. Expanding every commutator gives the exact identity
  #[#set math.equation(numbering: n => "(14)")
   $ T_(pi \, s) & = sum_(h < s) "Tr" #scale(x: 120%, y: 120%)[\(] A_0 C_1 dots.h.c C_(h - 1) \[ A_j \, C_h \] C_(h + 1) dots.h.c C_(s - 1) K Q #scale(x: 120%, y: 120%)[\)]\
 & quad + sum_(h > s) "Tr" #scale(x: 120%, y: 120%)[\(] A_0 P K C_(s + 1) dots.h.c C_(h - 1) \[ A_j \, C_h \] C_(h + 1) dots.h.c C_r #scale(x: 120%, y: 120%)[\)] . $ <eq:trace-telescoping>]
  Empty products have value $I$. There is no term from crossing $A_0$ because $\[ A_j \, A_0 \] = 0$. There is also no exterior sign in this identity: the transported factor $A_j$ has degree zero, and no two one-forms are exchanged.
  For each fixed $h eq.not s$, pair a permutation $pi$ with the permutation obtained by exchanging its labels at positions $s$ and $h$. All factors in the corresponding summand of (14) remain the same except that $\[ A_(pi \( s \)) \, B_(pi \( h \)) \( t \) \]$ becomes $\[ A_(pi \( h \)) \, B_(pi \( s \)) \( t \) \]$. These are equal by (13), while the permutation sign changes. Thus
  $ sum_(pi in frak(S)_r) "sgn" \( pi \) T_(pi \, s) = 0 #h(2em) upright("for every ") s . $
  The entire alternating trace polynomial is therefore constant in $t$.
  Finally, set $K = G^(- 1) upright(d) G$. Direct differentiation yields
  $ upright(d) \( G A_j G^(- 1) \) = G #scale(x: 120%, y: 120%)[\(] upright(d) A_j + \[ K \, A_j \] #scale(x: 120%, y: 120%)[\)] G^(- 1) . $
  In a product of these forms the degree-zero matrices $G^(- 1) G$ cancel, and the trace is invariant under conjugation. Constancy between $t = 0$ and $t = 1$ proves the assertion. Notice that the argument never differentiates $A_0$ and does not require it to commute with $upright(d) A_j$. ◻
]

#thm([Lemma 5.2.])[
  (A nonzero trace from one eigenvalue tuple).  #emph[Let $L$ be an algebraically closed extension of $bb(C)$ and let $A_1 \, dots.h \, A_r in "Mat"_m \( L \)$ commute pairwise. Suppose a joint diagonal tuple $\( lambda_1 \, dots.h \, lambda_r \)$ in a common upper triangular basis is algebraically independent over $bb(C)$. There is a matrix $A_0$, polynomial over $L$ in the $A_j$, for which (12) is nonzero.]
] <lem:spectral-trace>

#proof[
  Let $Lambda$ be the finite set of distinct joint diagonal tuples, and write $lambda = \( lambda_1 \, dots.h \, lambda_r \)$ for the chosen tuple. For each $mu in Lambda \\ { lambda }$ choose an index $j \( mu \)$ with $lambda_(j \( mu \)) eq.not mu_(j \( mu \))$. The polynomial
  $ p \( T_1 \, dots.h \, T_r \) = product_(mu in Lambda \\ { lambda }) frac(T_(j \( mu \)) - mu_(j \( mu \)), lambda_(j \( mu \)) - mu_(j \( mu \))) $
  has value $1$ at $lambda$ and $0$ at every other tuple. Set $A_0 = p \( A_1 \, dots.h \, A_r \)$. This matrix commutes with every $A_j$. We only use its prescribed diagonal entries; it need not be an idempotent on a generalized eigenspace.
  By Lemma 7, the form can be computed in the common upper triangular basis. Derivatives and products remain upper triangular, and their diagonal entries multiply. If the chosen tuple occurs with multiplicity $m_lambda$, it follows that
  $ Theta \( A_0 \; A_1 \, dots.h \, A_r \) = r ! m_lambda thin upright(d) lambda_1 and dots.h.c and upright(d) lambda_r . $
  The alternating sign and the sign from reordering the scalar one-forms cancel for each permutation. Algebraic independence in characteristic zero makes the displayed wedge nonzero; the integer $r ! m_lambda$ is also nonzero. This proves the lemma. ◻
]

We apply these lemmas over $L = overline(bb(C) \( q_1 \, dots.h \, q_r \))$ to the quantum divisor operators. Common triangularization is available for any finite commuting collection over an algebraically closed field. The differential extends to $L$, since the algebraic extension is separable.

#thm([Proposition 5.3.])[
  (Independent curve correspondences).  #emph[Suppose that the quantum divisor operators $A_1 \( q \) \, dots.h \, A_r \( q \)$ have an algebraically independent joint eigenvalue tuple over $bb(C)$. There are linearly independent numerical degree vectors $gamma_1 \, dots.h \, gamma_r$ of positive genus-zero stable maps such that 
#[#set math.equation(numbering: n => "(15)")
 $ S_(gamma_1) dots.h.c S_(gamma_r) eq.not 0 \, #h(2em) sum_(j = 1)^r \( d_(gamma_j) - 1 \) lt.eq n . $ <eq:nonzero-independent-product>]

 Consequently $r \( iota - 1 \) lt.eq n$.]
] <prop:independent-correspondences>

#proof[
  Choose $A_0$ by Lemma 8. In the original fixed cohomology basis, the classical terms of $A_j$ are constant, and hence
  $ upright(d) A_j = sum_(gamma > 0) q^gamma gamma_j S_gamma thin omega_gamma \, #h(2em) omega_gamma = sum_(l = 1)^r gamma_l frac(upright(d) q_l, q_l) . $
  These sums are finite. Each ordered summand in the expansion of (12) is a scalar multiple of
  $ "Tr" \( A_0 S_(gamma_1) dots.h.c S_(gamma_r) \) thin omega_(gamma_1) and dots.h.c and omega_(gamma_r) . $
  Since $Theta eq.not 0$, at least one of these ordered summands is nonzero. Its trace factor and its wedge factor are therefore both nonzero. The forms $upright(d) q_l \/ q_l$ are an $L$-basis of the differentials of $L \/ bb(C)$, so the nonzero wedge gives linear independence of the degree vectors. The nonzero trace gives the operator product in (15), in the order selected by the summand.
  The operator $S_gamma$ maps $H_k$ into $H_(k + 1 - d_gamma)$. Thus this product lowers the codimension grading by $sum_j \( d_(gamma_j) - 1 \)$. The available gradings run only from $0$ through $n$, proving the upper bound in (15). Every positive stable-map degree has anticanonical degree at least $iota$, so
  $ r \( iota - 1 \) lt.eq sum_(j = 1)^r \( d_(gamma_j) - 1 \) lt.eq n . $
  ◻
]

Proposition 6 supplies the algebraically independent joint tuple required in Proposition 9. This proves the inequality in Theorem 1; the equality case is considered next.

== 6 The equality case <sec:equality>

We show that equality in the grading bound forces the projective-space product. The nonzero product from Proposition 9 first gives a chain of actual minimum-degree rational curves. A dimension estimate then turns the corresponding families into covering families.

We use $"RatCurves"^(upright(n)) \( X \)$ for the normalized parameter space of rational curves, obtained from maps $bb(P)^1 arrow.r X$ birational onto their images by reparametrization. In this section a family $V$ is an irreducible component of that space. It is #emph[unsplit] if it is proper, and #emph[covering] if its universal evaluation map dominates $X$. Its anticanonical degree is $- K_X dot.op V$, the common degree of its members. For unsplit families $V^1 \, dots.h \, V^k$ and a point $x in X$, write $"Locus" \( V^1 \, dots.h \, V^k \)_x$ for the set of endpoints $y$ of chains $C_1 \, dots.h \, C_k$ with $C_j in V^j$, $x in C_1$, $C_j ∩ C_(j + 1) eq.not diameter$, and $y in C_k$.

We will use the following two established results, with their family hypotheses stated explicitly.

#thm([Theorem 6.1.])[
  (The ordered-chain bound).  #emph[Let $Y$ be a smooth complex projective variety. Let $V^1 \, dots.h \, V^k$ be proper irreducible components of $"RatCurves"^(upright(n)) \( Y \)$ whose numerical classes are linearly independent. For every $y in Y$, the ordered endpoint locus is either empty or satisfies 
$ dim "Locus" \( V^1 \, dots.h \, V^k \)_y gt.eq sum_(j = 1)^k \( - K_Y dot.op V^j - 1 \) . $

]
] <thm:ordered-chain-bound>

This is the theorem of Bonavero–Casagrande–Debarre–Druel #cite(label("BCDD2003")) Theorem 5.2, with the irreducible-component hypothesis specified in their erratum #cite(label("BCDDErratum")). Taking arbitrary proper subfamilies would not suffice.

#thm([Theorem 6.2.])[
  (Occhetta’s product characterization).  #emph[Let $Y$ be a smooth complex projective variety of dimension $n$. Suppose $Y$ has numerically independent unsplit covering families $V^1 \, dots.h \, V^k$ with anticanonical degrees $n_1 + 1 \, dots.h \, n_k + 1$, where each $n_j$ is positive and $sum_j n_j = n$. Then $Y tilde.equiv bb(P)^(n_1) times dots.h.c times bb(P)^(n_k)$.]
] <thm:occhetta-product>

We use Theorem 11 in the form of #cite(label("Occhetta2006")) Theorem 1.1. The next lemma verifies that the curve families needed for these results are supplied by our correspondences.

#thm([Lemma 6.3.])[
  (Minimum-degree incidence).  #emph[Let $gamma_1 \, dots.h \, gamma_k$ be linearly independent numerical stable-map degrees on $X$, each of anticanonical degree $iota$. If $S_(gamma_1) dots.h.c S_(gamma_k) eq.not 0$, there exist numerically independent unsplit families $V^1 \, dots.h \, V^k$, each of degree $iota$, and a nonempty chain in some ordering of those families.]
] <lem:minimum-degree-incidence>

#proof[
  For a numerical degree $gamma$, let $overline(cal(M))_(0 \, 2) \( X \, gamma \)$ denote the finite disjoint union of stable-map stacks over actual curve classes of that degree. Let $Z_gamma subset X times X$ be the union of the images of their two-evaluation maps. It is closed by properness. The correspondence inducing $S_gamma$ is the pushforward of its virtual class and is supported on $Z_gamma$. The composition of these correspondences is computed on $X^(k + 1)$ by imposing the consecutive-pair incidence conditions and projecting to the two endpoints. Refined intersection with the diagonals is supported on the incidence fiber product. If that fiber product were empty, the resulting correspondence, and hence its action on cohomology, would be zero. Thus the nonzero product gives a sequence of two-pointed stable maps with matching evaluations. Choose their order according to composition, reversing the written list of degrees if necessary. This support argument does not require effectivity of the virtual classes.
  Every nonconstant component of a genus-zero stable map has an irreducible rational image of anticanonical degree at least $iota$. Its contribution to the total degree is that image degree multiplied by its covering multiplicity. A stable map of total degree $iota$ therefore has exactly one nonconstant component, and that component is birational onto its image. The images in our sequence are thus irreducible rational curves $C_1 \, dots.h \, C_k$ in the specified numerical classes, with consecutive intersections nonempty. Contracted components carrying markings do not affect this conclusion.
  Choose an irreducible component $V^j$ of $"RatCurves"^(upright(n)) \( X \)$ containing $C_j$. Its members retain degree $iota$. To check properness, take stable limits after forgetting markings. Such a limit still has just one nonconstant component, birational onto its image, by the same degree argument. It has no contracted components: any contracted subtree would have a leaf of valency one and no markings, contrary to stability. Hence every unmarked limit has smooth domain $bb(P)^1$ and is birational onto its image. Smooth-domain birational stable maps represent the unparameterized birational-map quotient underlying $"RatCurves" \( X \)$. The full degree-$iota$ stable-map locus is proper and has no boundary, so the corresponding full irreducible component of this quotient is proper; its finite normalization $V^j$ is proper as well. These are actual proper irreducible components, as required by Theorem 10. Their numerical classes are the independent classes $gamma_j$, and the curves already selected give the required chain. ◻
]

#thm([Proposition 6.4.])[
  (Rigidity at equality).  #emph[Suppose $iota gt.eq 2$, $r \( iota - 1 \) = n$, and the independent nonzero product in (15) exists. Then 
$ X tilde.equiv \( bb(P)^(iota - 1) \)^r . $

]
] <prop:equality-rigidity>

#proof[
  Since each $d_(gamma_j) gt.eq iota$, equality in the grading bound forces $d_(gamma_j) = iota$ for every $j$. Lemma 12 supplies numerically independent proper components $V^1 \, dots.h \, V^r$ and curves $C_1 \, dots.h \, C_r$ forming a chain in that order. Choose $x in C_1$. Theorem 10 gives
  $ dim "Locus" \( V^1 \, dots.h \, V^r \)_x gt.eq r \( iota - 1 \) = n . $
  This locus is contained in the image of the universal evaluation of $V^r$, so $V^r$ is covering. Since $V^r$ is proper, its evaluation image is closed; consequently every point of $X$ lies on a member of $V^r$.
  If $r > 1$, choose a member of $V^r$ through a point of $C_1$ and follow it by $C_1 \, dots.h \, C_(r - 1)$. This is a chain in the order $V^r \, V^1 \, dots.h \, V^(r - 1)$. Applying the same dimension bound proves that $V^(r - 1)$ is covering. Repeating this cyclic rotation makes each family the last member of a nonempty ordered chain, so every $V^j$ is covering. For $r = 1$ the first application already suffices.
  All hypotheses of Theorem 11 now hold with $n_j = iota - 1$: the families are unsplit and covering, their numerical classes are independent, their degrees are $iota$, and their contributions $n_j$ sum to $n$. The resulting product is $\( bb(P)^(iota - 1) \)^r$. ◻
]

Conversely, $\( bb(P)^(iota - 1) \)^r$ has dimension $r \( iota - 1 \)$ and Picard number $r$. Its anticanonical divisor has degree $iota$ on a line in one factor, and degree at least $iota$ on every irreducible rational curve. Its pseudoindex is therefore $iota$, and equality holds.


#bibliography("refs.bib", style: "ieee", title: [References])
