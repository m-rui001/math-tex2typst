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

#align(center)[#text(size: 16pt, weight: "bold")[Open Homomorphisms of Global Solvably Closed Galois Groups]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

An algebraic extension of a number field is #emph[solvably closed] if it has no nontrivial abelian algebraic extension. Algebraic closures and maximal prosolvable extensions are examples. The isomorphism theorems of Neukirch and Uchida show that Galois groups of such fields retain remarkably precise arithmetic information. The corresponding question for open homomorphisms asks whether this reconstruction also recovers field embeddings.

Let $E_i \/ F_i$ be Galois extensions of number fields, with each $E_i$ solvably closed, and write $G_i = "Gal" \( E_i \/ F_i \)$. A field embedding $j : E_2 arrow.r.hook E_1$ #emph[induces] a homomorphism $alpha : G_1 arrow.r G_2$ if

$ g compose j = j compose alpha \( g \) #h(2em) \( g in G_1 \) . $

In particular, such an embedding sends $F_2$ into $F_1$. Uchida conjectured that every continuous homomorphism with open image arises in this way [15] p. 595. We prove the conjecture in its full form.

#thm([Theorem 1.1.])[
  #emph[Let $F_1 \, F_2$ be number fields, and let $E_i \/ F_i$ be possibly infinite solvably closed Galois extensions. Every continuous open homomorphism 
$ alpha : "Gal" \( E_1 \/ F_1 \) arrow.r "Gal" \( E_2 \/ F_2 \) $

 is induced by a unique field embedding $j : E_2 arrow.r.hook E_1$.]
] <thm:main>

The kernel is unrestricted. The proof establishes the necessary arithmetic compatibility from openness itself.

=== 1.1 Historical context <historical-context>

The reconstruction of number fields from their Galois groups begins with Neukirch’s work on normal number fields and decomposition groups [8,9]. The passage to arbitrary number fields and prescribed group isomorphisms involved Uchida, Iwasawa, and Ikeda; their contributions are recorded in the contemporary accounts [13,10]. Uchida subsequently established the isomorphism theorem for arbitrary solvably closed Galois extensions of number fields [14].

In the paper formulating the homomorphism conjecture, Uchida proved it when the source number field is $bb(Q)$, proved uniqueness in general, and established existence under a suitable local condition on decomposition groups [15] Theorem 1, Proposition 2, and Theorem 2. His local analysis also associates primes to one another whenever a chosen pro-$ell$ inertia group survives under the homomorphism, for an odd auxiliary prime $ell$. For each fixed auxiliary prime $ell$, this partial correspondence reaches all but finitely many target primes [15] Proposition 1.

A later reduction of Hoshi identifies an exact arithmetic condition for existence: an open homomorphism is induced by a field embedding if and only if it preserves the full cyclotomic character [3] Theorem 3.4. Hoshi’s subsequent work reformulates the unrestricted conjecture in terms of radicals and normality of the field fixed by a kernel [4] Theorem B. Related work on finite solvable quotients includes the isomorphism theorem of Saïdi and Tamagawa [12] and the cyclotomic-compatible homomorphism theorem of Mao and Saïdi [6]. Our proof uses the cyclotomic criterion at its endpoint. The main task is to derive that criterion from the partial local correspondences, even though their domains and exceptional sets initially depend on $ell$.

=== 1.2 The main ideas <the-main-ideas>

Two arguments used below are useful beyond the final reduction. First, an additive $ell$-adic character of the absolute Galois group of a number field is determined by its values on any infinite set of primes of absolute residue degree one. More precisely, a character vanishing at all those primes is zero. The logarithmic-rank input is a special case of the $ell$-adic Waldschmidt–Masser theorem [16,7,2]. We give a complete proof using Laurent’s interpolation-determinant method [5] and a translate-and-degree zero estimate on a torus. Its variants for Frobenius averages and corestriction permit us to treat primes of arbitrary residue degree as well. These statements concern the actual unit-logarithm image and require no hypothesis on its rank.

Second, we refine the Kummer argument in Uchida’s proof of cofinite target coverage [15] Proposition 1. After logarithmic cyclotomic compatibility has been established, the number of target primes missed by the partial correspondence can be bounded independently of $ell$. A missed prime supplies a Kummer class. On killing a finite cyclotomic twist, these classes lie in one character component of an $S$-unit representation. The full extension degree may grow with $ell$, but the multiplicity of that character is bounded by the number of orbits of $S$, hence by the degree of the fixed source field. This uniformity allows us to choose $ell$ by simultaneous Kummer conditions and force enough corresponding primes to have the same rational residue characteristic.

Here is the route from these ingredients to Theorem 1. Put $P = "Gal" \( bb(Q)^s \/ bb(Q) \)$, where $bb(Q)^s$ is the maximal prosolvable extension of $bb(Q)$. For a number field $F$, let $G_F$ denote its absolute Galois group. It suffices to identify every continuous open homomorphism $G_F arrow.r P$ with ordinary restriction up to conjugation. Indeed, every solvably closed field contains $bb(Q)^s$, and this identification will give the full cyclotomic compatibility required by Hoshi’s theorem.

We first restrict to a normal open subgroup of $G_(bb(Q))$ and extend the map to the normalizer of its kernel. Write this extension as $beta : G_k arrow.r P$. Following the regular-module constructions used by Uchida [14], we enlarge finite quotients of $P$ by elementary abelian kernels consisting of many copies of a regular representation. Each quotient $R = "Gal" \( L \/ bb(Q) \)$ acts on the additive character space of $G_L$. Suitable characters distinguish a cyclic subgroup generated by a target Frobenius element from each of its proper subgroups. Comparing Frobenius averages proves that $beta$ is surjective and preserves logarithmic cyclotomic characters for an infinite congruence class of auxiliary primes.

Next, pass to the preimage of $P_(bb(Q) \( i \)) = "Gal" \( bb(Q)^s \/ bb(Q) \( i \) \)$. A sign character shows that, for almost every split target prime, only finitely many source primes can correspond to it as $ell$ varies. The uniform Kummer bound then forces a correspondence in the same residue characteristic for almost every such target prime. Finally, use rational primes split completely in suitable finite extensions. Their additive Frobenius evaluations identify the two character pullbacks, one from $beta$ and one from ordinary restriction. A faithful representation in the character space identifies the group maps modulo every finite quotient; compactness supplies a single conjugation.

Section 2 states the anabelian inputs and proves the local norm identity. Section 3 develops the character tests. Section 4 obtains surjectivity and logarithmic cyclotomic compatibility. Section 5 proves the uniform bound and matches residue characteristics. Section 6 identifies the map to $P$ and proves Theorem 1.

== 2 Galois groups and partial local correspondences <sec:preliminaries>

We collect the anabelian inputs and the local calculation that will connect Frobenius elements with cyclotomic characters. The substantial inputs from Uchida and Hoshi are stated explicitly; the remaining arguments use standard global and local class field theory, Kummer theory, and Chebotarev’s theorem.

=== 2.1 Conventions and solvably closed fields <conventions-and-solvably-closed-fields>

Fix an algebraic closure $overline(bb(Q))$ of $bb(Q)$. For a number field $M subset overline(bb(Q))$ put $G_M = "Gal" \( overline(bb(Q)) \/ M \)$, and put

$ cal(G) = G_(bb(Q)) \, #h(2em) P = "Gal" \( bb(Q)^s \/ bb(Q) \) \, $

where $bb(Q)^s subset overline(bb(Q))$ is the maximal prosolvable extension of $bb(Q)$. For a number field $M subset bb(Q)^s$ write $P_M = "Gal" \( bb(Q)^s \/ M \)$. All homomorphisms between profinite groups and all characters in this paper are continuous. An open homomorphism is a homomorphism with open image: a continuous surjection between profinite groups is a quotient map and is open.

We use finite primes unless infinity is explicitly mentioned. For a finite prime $v$, its absolute norm is $N v$, and its absolute residue degree is $\[ kappa \( v \) : bb(F)_p \]$, where $p$ is its rational residue characteristic. Frobenius is arithmetic. A chosen prolongation of $v$ determines a decomposition group $D_v$ and inertia group $I_v$; a different prolongation conjugates both. Expressions involving several such groups always use specified compatible prolongations.

#thm([Lemma 2.1.])[
  #emph[Every solvably closed algebraic extension $E$ of $bb(Q)$ contains $bb(Q)^s$. The field $bb(Q)^s$ is solvably closed. For every number field $M subset bb(Q)^s$, the extension $bb(Q)^s \/ M$ is the maximal prosolvable extension of $M$.]
] <lem:solvable-closure>

#proof[
  Since $E \( mu_n \) \/ E$ is abelian, $E$ contains every root of unity. Adjoining an $n$th root of an element of $E$ then gives a cyclic extension, so $E$ is closed under radicals. Finite solvable Galois extensions can be built by towers of radical extensions after adjoining roots of unity; hence $bb(Q)^s subset E$.
  The same tower argument shows that $bb(Q)^s$ contains all roots of unity and is closed under radicals. Any nontrivial finite abelian extension would have a cyclic subextension of prime degree, which Kummer theory excludes. Any nontrivial abelian algebraic extension would have a nontrivial finite abelian subextension. Thus $bb(Q)^s$ is solvably closed.
  Finally, a finite solvable Galois extension of $M$ lies in a finite solvable Galois extension of $bb(Q)$: first take a solvable normal closure of $M \/ bb(Q)$ inside $bb(Q)^s$, and then the compositum of the finitely many conjugate extensions. The group of this compositum over that normal closure embeds in a product of solvable groups. This proves the last assertion. ◻
]

In particular, every additive $ell$-adic character of $G_M$ factors through $P_M$ when $M subset bb(Q)^s$. For any solvably closed Galois extension $E \/ F$, the action on roots of unity defines its cyclotomic character

$ chi_(E \/ F) : "Gal" \( E \/ F \) arrow.r hat(bb(Z))^times . $

We use $chi_(M \, ell)$ for the usual $ell$-adic character of $G_M$, and $chi_ell$ for that of $P$. The $ell$-adic logarithm is normalized to vanish on the finite torsion subgroup of $bb(Z)_ell^times$.

=== 2.2 The anabelian inputs <the-anabelian-inputs>

The first input permits a homomorphism to be extended from an open subgroup to the normalizer of its kernel.

#thm([Theorem 2.2.])[
  (Uchida).  #emph[Let $E_i \/ F_i$ be solvably closed Galois extensions of number fields. Every isomorphism $theta : "Gal" \( E_1 \/ F_1 \) arrow.r^tilde.op "Gal" \( E_2 \/ F_2 \)$ is induced by a unique field isomorphism $j : E_2 arrow.r^tilde.op E_1$, with $g j = j theta \( g \)$ for all $g$.]
] <thm:uchida-isomorphism>

This is [14] Theorem. One consequence we shall use twice is the following.

#thm([Lemma 2.3.])[
  #emph[The centralizer in $P$ of any open subgroup of $P$ is trivial.]
] <lem:centralizer>

#proof[
  An open subgroup is $P_M$ for a number field $M subset bb(Q)^s$. An element centralizing $P_M$ is a field automorphism of $bb(Q)^s$ implementing the identity automorphism of $P_M$. The identity field map also implements it, so uniqueness in Theorem 3 gives the assertion. ◻
]

Here is the local input, in the precise setting in which we need it. For a homomorphism $phi : G_M arrow.r P_N$, an odd prime $ell$, and a prime $v divides.not ell$ of $M$, say that $v$ is #emph[active at $ell$] if $phi$ is nontrivial on a pro-$ell$ Sylow subgroup of $I_v$. The condition is independent of the chosen Sylow subgroup and prolongation, since such choices are conjugate.

#thm([Theorem 2.4.])[
  (Uchida’s partial local correspondence).  #emph[Let $M$ be a number field, let $N subset bb(Q)^s$ be a number field, and let $phi : G_M arrow.r P_N$ be open. Fix an odd prime $ell$. Every prime $v divides.not ell$ active at $ell$ determines a unique prime $w divides.not ell$ of $N$ for which, with suitable prolongations, 
$ phi \( D_v \) subset D_w . $

 Moreover, $phi$ is injective on a pro-$ell$ Sylow subgroup of $I_v$, and sends this subgroup into $I_w$. All but finitely many primes of $N$ arise from such active primes of $M$.]
] <thm:local-correspondence>

This is the odd-prime case of the trichotomy in [15] §1, pp. 595–596, together with its Proposition 1. In that trichotomy, nontrivial pro-$ell$ inertia is case (ii); case (i) kills that inertia, and the torsion case (iii) requires $ell = 2$. The open-image hypothesis, rather than surjectivity onto $P_N$, suffices. We will apply the theorem after restricting to smaller open subgroups as well. The cofinite target coverage in this theorem is for a fixed $ell$; its exceptional set is not asserted to be uniform in $ell$.

The uniqueness assertion concerns primes of the finite target field $N$. When restricting a map to smaller open subgroups, we will intersect a containing target decomposition group with $P_(N')$ for a finite extension $N' \/ N$ inside $bb(Q)^s$, and then use uniqueness at the $N'$-level. Proposition 13 carries out this comparison with explicit source and target fields; no uniqueness of infinite prolongations is required.

The final input converts cyclotomic compatibility into the required field embedding.

#thm([Theorem 2.5.])[
  (Hoshi).  #emph[Let $E_i \/ F_i$ be solvably closed Galois extensions of number fields, and let $alpha : "Gal" \( E_1 \/ F_1 \) arrow.r "Gal" \( E_2 \/ F_2 \)$ be open. There exists an equivariant field embedding $E_2 arrow.r.hook E_1$ if and only if 
$ chi_(E_2 \/ F_2) compose alpha = chi_(E_1 \/ F_1) quad upright("in ") hat(bb(Z))^times . $

]
] <thm:hoshi>

We use [3] Theorem 3.4. Uniqueness of the embedding, when it exists, is [15] Proposition 2.

=== 2.3 Tame inertia and norms <tame-inertia-and-norms>

Decomposition groups in $P_M$ are the full absolute Galois groups of the corresponding local fields. Here is a justification for using the usual local ramification structure. Fix a prime of $overline(bb(Q))$ above a prime of $M$, and form inside a local algebraic closure the union of the completions of finite fields between $M$ and $bb(Q)^s$. This union contains all roots of unity and is closed under radicals: for a fixed exponent, a nonzero local element can be approximated by a global element in the field defining that completion, and their ratio can be made a power. Thus the union has no cyclic extension. Every finite Galois group over a nonarchimedean local field is solvable, by its wild inertia, tame inertia, and unramified filtration. Every closed subgroup of its prosolvable absolute Galois group is prosolvable as well; a nontrivial such group has a nontrivial finite cyclic quotient after passing through a finite solvable quotient. The union is therefore the full local algebraic closure. The usual decomposition-group identification proves the claim.

For an active pair $\( v \, w \)$ from Theorem 5, and $g in D_v$, let $b \( g \) in hat(bb(Z))$ be its source residue exponent and let $a \( g \) in hat(bb(Z))$ be the target residue exponent of $phi \( g \)$. These are measured using $N v$- and $N w$-Frobenius, respectively. The target residue exponent is defined on $D_v$ by composition; we do not assume that the map sends all source inertia into target inertia.

#thm([Lemma 2.6.])[
  #emph[For an active pair $\( v \, w \)$ at an odd prime $ell$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ \( N v \)^(b \( g \)) = \( N w \)^(a \( g \)) quad upright("in ") bb(Z)_ell^times #h(2em) \( g in D_v \) . $ <eq:norm-identity>]

 Powers by profinite integers are interpreted by continuous powering in the compact group $bb(Z)_ell^times$.]
] <lem:norm-identity>

#proof[
  Let $p eq.not ell$ be the residue characteristic of $v$, and choose a topological generator $tau$ of a pro-$ell$ Sylow subgroup of $I_v$. Its image in source tame inertia generates the pro-$ell$ factor. The tame conjugation relation shows that
  $ e = g tau g^(- 1) tau^(- \( N v \)^(b \( g \))) $
  belongs to source wild inertia, a pro-$p$ group. In the target tame quotient, the image of $e$ also lies in the pro-$ell$ factor of tame inertia: both $phi \( tau \)$ and its conjugate do. Its image is therefore trivial, because it belongs to a pro-$p$ subgroup and to a pro-$ell$ group. The nontrivial image of $phi \( tau \)$ in the torsion-free target pro-$ell$ tame factor then gives (2.1) by the target tame conjugation relation. The target residue characteristic is different from $ell$ by Theorem 5. ◻
]

== 3 Additive characters and Frobenius detection <sec:characters>

We will compare homomorphisms of Galois groups by evaluating additive $ell$-adic characters at Frobenius elements. The main fact needed for this comparison is that infinitely many primes of absolute residue degree one detect a character. We first prove the logarithm-rank statement behind this fact, then establish the versions involving averaging and corestriction. The section ends with a representation contained in the character space that will supply enough characters for the comparison.

=== 3.1 A logarithm-rank lemma <a-logarithm-rank-lemma>

For a finite extension $K \/ bb(Q)_ell$, normalize its absolute value by $\| ell \|_ell = ell^(- 1)$. The $ell$-adic logarithm on $cal(O)_K^times$ is the continuous homomorphism that agrees with the usual power series near $1$; its kernel is the finite group of roots of unity in $K$. Logarithms of points in a torus are taken coordinatewise.

For a number field $M$, class field theory expresses an additive character of $G_M$ as a linear form on $M ⊗_(bb(Q)) bb(Q)_ell$. A zero Frobenius value at a prime $v divides.not ell$ forces this form to annihilate $log b$, where $\( b \) = v^h$ for some $h > 0$. For primes of residue degree one chosen over distinct rational primes unramified in a Galois closure, the conjugate generators have disjoint ideal supports; the following lemma turns their multiplicative independence into full logarithmic rank.

This special rank estimate admits an interpolation-determinant proof. It is a special case of the $ell$-adic Waldschmidt–Masser rank theorem [16,7]. We retain a proof using the translate estimates of that theory and Laurent’s interpolation determinants [5]; see also [2] Theorems 5.1 and 5.8.

#thm([Lemma 3.1.])[
  (Logarithm rank).  #emph[Let $n \, m gt.eq 1$, let $E$ be a number field embedded in a finite extension $K \/ bb(Q)_ell$, and let 
$ u_i = \( u_(i 1) \, dots.h \, u_(i n) \) in \( E^times \)^n \, #h(2em) 1 lt.eq i lt.eq m \, $

 have algebraic-integer coordinates that are units in $K$. Suppose that for every $a = \( a_1 \, dots.h \, a_m \) in bb(Z)^m \\ { 0 }$, the coordinates of $u^a := product_(i = 1)^m u_i^(a_i)$ are multiplicatively independent modulo roots of unity. If $m > n \( n - 1 \)$, then 
$ "span"_K { log u_1 \, dots.h \, log u_m } = K^n . $

]
] <lem:log-rank>

#proof[
  The multiplicative hypothesis implies that the cyclic subgroup generated by every $u^a$ with $a eq.not 0$ is Zariski dense in $bb(G)_m^n$. Indeed, distinct Laurent monomials have distinct values at $u^a$. If a Laurent polynomial vanished at all nonnegative powers of $u^a$, a Vandermonde matrix applied to its finitely many monomials would force all its coefficients to vanish.
  Suppose that the logarithms span a subspace of dimension $r < n$. The case $r = 0$ contradicts the multiplicative hypothesis because the kernel of the logarithm on local units consists of roots of unity. Thus $1 lt.eq r < n$, and in particular $n gt.eq 2$. We will obtain an algebraic determinant whose small $ell$-adic absolute value is incompatible with its archimedean size.
  First make all choices needed for the analytic estimate. Replacing all $u_i$ by the same positive integer power preserves the hypotheses and the logarithmic rank. Such a power puts their coordinates in a neighborhood where exponential and logarithm are inverse. The $cal(O)_K$-module generated by their logarithms is free of rank $r$; choose a basis $b_1 \, dots.h \, b_r in K^n$. After a further common $ell$-power, these basis vectors have sufficiently small coordinates that
  $ rho := max_(j \, t) \| b_(t \, j) \|_ell quad upright("satisfies") quad eta := rho ell^(1 \/ \( ell - 1 \)) < 1 . $
  Here the basis is multiplied by the same power as the logarithms. Consequently there are $z_i in cal(O)_K^r$ such that
  $ log u_i = sum_(t = 1)^r z_(i \, t) b_t . $
  From now on these powered points, the number field $E$, the local field $K$, the basis, and $eta$ are fixed. In particular, none depends on the degree parameter introduced below.
  For an integer vector $alpha = \( alpha_1 \, dots.h \, alpha_n \)$, the monomial $X^alpha$ on these points is represented by
  $ f_alpha \( z \) = exp #h(-0.16667em) (sum_(j = 1)^n alpha_j sum_(t = 1)^r b_(t \, j) z_t) . $
  It is analytic on a polydisc of radius greater than $1$. If $f_alpha \( z \) = sum_(nu in bb(Z)_(gt.eq 0)^r) c_(alpha \, nu) z^nu$, the exponential series and $\| k ! \|_ell^(- 1) lt.eq ell^(k \/ \( ell - 1 \))$ give the uniform bound
  #[#set math.equation(numbering: n => "(3.1)")
   $ \| c_(alpha \, nu) \|_ell lt.eq eta^(\| nu \|) \, #h(2em) \| nu \| = nu_1 + dots.h.c + nu_r . $ <eq:log-taylor-bound>]
  The bound is independent of $alpha$, since every integer has $ell$-adic absolute value at most $1$. Moreover, for every $a in bb(Z)_(gt.eq 0)^m$, the point $z \( a \) := sum_i a_i z_i$ lies in $cal(O)_K^r$, and $f_alpha \( z \( a \) \) = \( u^a \)^alpha$.
  We next show that sufficiently many of these evaluations have full algebraic rank. For an integer $D gt.eq 1$, put $A = \( D + 1 \)^n$ and choose an integer $S gt.eq 1$ such that
  #[#set math.equation(numbering: n => "(3.2)")
   $ \( S + 1 \)^m > \( n D \)^n \, #h(2em) S = O \( D^(n \/ m) \) . $ <eq:log-grid-size>]
  Consider the matrix with rows indexed by $alpha in { 0 \, dots.h \, D }^n$, columns indexed by $a in { 0 \, dots.h \, n S }^m$, and entries $\( u^a \)^alpha$. We claim that its rank is $A$.
  Otherwise a nonzero polynomial $P$ of degree at most $D$ in each variable would vanish at every point $u^a$ in this grid. Over an algebraic closure of $E$, define closed subsets of the torus by
  $ Z_j = { x in bb(G)_m^n : P \( u^a x \) = 0 med upright("for all ") a in { 0 \, dots.h \, j S }^m } \, #h(2em) 0 lt.eq j lt.eq n . $
  These sets are nested and nonempty, since $1 in Z_n$, whereas $dim Z_0 lt.eq n - 1$. Hence some adjacent pair $Z_j \, Z_(j + 1)$ has the same dimension $d$. Let $V$ be a $d$-dimensional irreducible component of $Z_(j + 1)$. For every $b in { 0 \, dots.h \, S }^m$, the translate $u^b V$ is contained in $Z_j$ and has dimension $d$, so it is an irreducible component of $Z_j$. All these translates are distinct: an equality $u^b V = u^(b') V$ for $b eq.not b'$ would make $V$ stable under every power of $u^(b - b')$. The density proved above would then force $V = bb(G)_m^n$, contrary to $V subset.eq Z_0$.
  For completeness, a common zero set of polynomials of total degree at most $delta gt.eq 1$ in $bb(A)^n$ has at most $delta^n$ irreducible components. One can obtain this form of the affine Bézout bound by assigning a component $Y$ the weight $delta^(dim Y) deg Y$. Start with $bb(A)^n$, of weight $delta^n$, and impose the equations successively. A component contained in the next hypersurface retains its weight; a component not contained in it is cut into components of dimension one less, whose total degree is at most $delta deg Y$ by Bézout. Thus the total weight does not increase, and removing redundant components can only decrease it. The same component bound holds after restriction to the torus. Applying it to $Z_j$, whose equations have total degree at most $n D$, contradicts (3.2). This proves the rank claim.
  Choose a nonzero $A times A$ minor $Delta_D$ of the evaluation matrix. It is an algebraic integer in the fixed field $E$. Expand its rows using the convergent power series for $f_alpha$. A nonzero term must involve $A$ distinct monomials in the $r$ variables $z_1 \, dots.h \, z_r$, since repeated monomials give repeated rows in the corresponding evaluation determinant. The sum of the degrees of any $A$ distinct such monomials is at least $c_r A^(1 + 1 \/ r)$ for all sufficiently large $A$: the number of monomials of degree at most $t$ is $binom(t + r, r) = O_r \( t^r \)$, so at least half of the $A$ monomials have degree bounded below by a positive multiple of $A^(1 \/ r)$. Their evaluations have absolute value at most $1$. The nonarchimedean triangle inequality and (3.1), first for truncated series and then by convergence, therefore give a constant $c > 0$ such that
  #[#set math.equation(numbering: n => "(3.3)")
   $ log \| Delta_D \|_ell lt.eq - c A^(1 + 1 \/ r) . $ <eq:log-determinant-small>]
  At every archimedean embedding $tau : E arrow.r.hook bb(C)$, an entry of this minor has absolute value at most $exp \( C D S \)$, with $C$ independent of $D$. Expanding the determinant thus gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ log \| tau \( Delta_D \) \| lt.eq C' A D S + A log A . $ <eq:log-determinant-large>]
  Let $lambda$ be the place of $E$ induced by $E arrow.r.hook K$. Use absolute values at finite places extending the usual ones on $bb(Q)$, and sum over all embeddings $E arrow.r.hook bb(C)$, so that each complex place occurs twice. Writing $p_v$ for the rational prime below a finite place $v$, the product formula reads
  $ 0 = sum_(tau : E arrow.r.hook bb(C)) log \| tau \( Delta_D \) \| + sum_(v upright(" finite")) \[ E_v : bb(Q)_(p_v) \] log \| Delta_D \|_v . $
  Every term in the second sum is nonpositive because $Delta_D$ is an algebraic integer. Retaining its $lambda$-term and using (3.3)–(3.4) would imply
  $ c \[ E_lambda : bb(Q)_ell \] A^(1 + 1 \/ r) lt.eq \[ E : bb(Q) \] \( C' A D S + A log A \) . $
  This is impossible as $D arrow.r oo$: the left side has order $D^(n + n \/ r)$, whereas the right side is $O \( D^(n + 1 + n \/ m) + D^n log D \)$, and
  $ n / r gt.eq frac(n, n - 1) > 1 + n / m $
  by $m > n \( n - 1 \)$. This contradiction proves the lemma. ◻
]

=== 3.2 Detection, averaging, and corestriction <detection-averaging-and-corestriction>

For a number field $M subset overline(bb(Q))$, write

$ X_ell \( M \) := "Hom"_(upright("cont")) \( G_M \, bb(Q)_ell \) \, #h(2em) G_M = "Gal" \( overline(bb(Q)) \/ M \) \, $

where $bb(Q)_ell$ is an additive group with trivial Galois action. Local class field theory shows that these characters are unramified at every finite prime $v divides.not ell$: the local unit group has a pro-$p$ subgroup of finite index for $p eq.not ell$, and has no nonzero continuous homomorphism to $bb(Q)_ell$. Thus $x \( "Fr"_v \)$ is defined for $x in X_ell \( M \)$ and $v divides.not ell$.

If $M \/ bb(Q)$ is Galois, $R = "Gal" \( M \/ bb(Q) \)$ acts by $\( g x \) \( h \) = x \( tilde(g)^(- 1) h tilde(g) \)$, where $tilde(g) in G_(bb(Q))$ lifts $g$. The definition is independent of the lift. For a subgroup $J subset.eq R$, write

$ E_J = frac(1, \| J \|) sum_(g in J) g $

for the projector onto the $J$-invariants. We use $"res"_(L \/ M)$ and $"cor"_(L \/ M)$ for restriction and corestriction on additive characters for a finite extension $L \/ M$.

#thm([Proposition 3.2.])[
  (Frobenius detection).  #emph[Let $M$ be a number field, let $ell$ be a rational prime, and let $x in X_ell \( M \)$.]
  + #emph[If $x \( "Fr"_v \) = 0$ at infinitely many primes $v divides.not ell$ of absolute residue degree one, then $x = 0$.]
  + #emph[Suppose that $M \/ bb(Q)$ is Galois, and fix $delta in "Gal" \( M \/ bb(Q) \)$. If $x \( "Fr"_v \) = 0$ at infinitely many primes $v divides.not ell$ lying over rational primes unramified in $M$ whose Frobenius element at $v$ in $"Gal" \( M \/ bb(Q) \)$ is $delta$, then $E_(chevron.l delta chevron.r) x = 0$.]
  + #emph[If $"cor"_(M \/ bb(Q)) x eq.not 0$, then $x \( "Fr"_v \) = 0$ at only finitely many primes $v divides.not ell$, with no restriction on their residue degrees.]
] <prop:character-detection>

#proof[
  We first recall the class-field-theoretic description of the character space. Let $V_M = M ⊗_(bb(Q)) bb(Q)_ell$, and let $U_M subset.eq V_M$ be the $bb(Q)_ell$-linear span of the logarithms of the global units, with logarithms taken at all places above $ell$. Then
  #[#set math.equation(numbering: n => "(3.5)")
   $ X_ell \( M \) tilde.eq { lambda in "Hom"_(bb(Q)_ell) \( V_M \, bb(Q)_ell \) : lambda \( U_M \) = 0 } . $ <eq:character-class-field>]
  Indeed, pass to the inverse limit of the ray class sequences with moduli supported above $ell$. Local logarithms identify the rationalized local unit groups with $V_M$; the global units impose exactly the subspace $U_M$. The ordinary class group and the factors at real places are finite, so contribute no additive $bb(Q)_ell$-characters. This description uses the actual logarithmic image of the units and makes no assertion about its dimension.
  For $v divides.not ell$, choose $h_v > 0$ and $b_v in cal(O)_M$ with $\( b_v \) = v^(h_v)$. Such a choice is possible because the ideal class group is finite. Principal reciprocity, with arithmetic Frobenius, gives for the linear form corresponding to $x$ the identity
  #[#set math.equation(numbering: n => "(3.6)")
   $ lambda \( log b_v \) = - h_v x \( "Fr"_v \) . $ <eq:character-principal-reciprocity>]
  Here $b_v$ is a unit at every place above $ell$; all other local unit contributions are killed by $x$.
  For (i), set $n = \[ M : bb(Q) \]$ and choose $m > n \( n - 1 \)$ of the zero primes, over distinct rational primes unramified in a Galois closure $E$ of $M$. Let $b_i$ be the elements just chosen for these primes, and let
  $ u_i = \( sigma \( b_i \) \)_(sigma : M arrow.r.hook E) in \( E^times \)^n . $
  All coordinates are algebraic integers and are units at every place of $E$ above $ell$. We verify the multiplicative hypothesis of Lemma 8 by valuations.
  Put $G = "Gal" \( E \/ bb(Q) \)$ and $H = "Gal" \( E \/ M \)$. For a selected degree-one prime $v_i$ and a prime $frak(p)_i$ of $E$ above it, the decomposition group $D_i$ is contained in $H$. In fact, the rational prime is unramified in $E$, and the degree-one condition says that $\[ D_i : D_i ∩ H \] = 1$. The support of $v_i cal(O)_E$ is indexed by $H \/ D_i$. Its translates corresponding to the embeddings $M arrow.r.hook E$, indexed by $G \/ H$, have supports indexed by the disjoint sets $g H \/ D_i$. Distinct indices $i$ involve distinct rational primes. It follows that the $m n$ numbers $sigma \( b_i \)$ have pairwise disjoint nonempty supports of their principal ideals. They are therefore multiplicatively independent modulo roots of unity. In particular, for any nonzero $a in bb(Z)^m$, the $n$ coordinates of $u^a$ are multiplicatively independent modulo roots of unity.
  Embed $E$ in a finite extension $K \/ bb(Q)_ell$. Under the splitting
  $ \( M ⊗_(bb(Q)) bb(Q)_ell \) ⊗_(bb(Q)_ell) K tilde.eq product_(sigma : M arrow.r.hook E) K \, $
  the vector $log b_i$ becomes $log u_i$. Lemma 8 says that these vectors span the right side. Equations (3.5) and (3.6) therefore force $lambda = 0$, and hence $x = 0$.
  For (ii), put $C = chevron.l delta chevron.r$, $F = M^C$, and $y = E_C x$. Since $delta$ fixes every indicated prime $v$, averaging preserves its Frobenius value, so $y \( "Fr"_v \) = 0$. The restriction–corestriction identity gives
  $ "res"_(M \/ F) "cor"_(M \/ F) y = sum_(g in C) g y = \| C \| y . $
  Thus $y$ is the restriction of $z = \| C \|^(- 1) "cor"_(M \/ F) y in X_ell \( F \)$. At an indicated prime, the decomposition group of $M \/ bb(Q)$ is exactly $C$. The prime $u = v ∩ F$ consequently has absolute residue degree one, and
  $ 0 = y \( "Fr"_v \) = \[ kappa \( v \) : kappa \( u \) \] z \( "Fr"_u \) . $
  Infinitely many distinct $u$ occur because $M \/ F$ is finite. Part (i) gives $z = 0$, and therefore $y = 0$.
  For (iii), suppose that infinitely many zero primes exist. Let $E \/ bb(Q)$ be a finite Galois closure of $M$, put $R = "Gal" \( E \/ bb(Q) \)$, and let $y = "res"_(E \/ M) x$. Discarding finitely many primes, choose primes of $E$ above these zero primes whose rational primes are unramified in $E$. Restriction multiplies a Frobenius value by the relative residue degree, so they are zero primes for $y$. An infinite subset has one fixed Frobenius element $delta in R$. By (ii), $E_(chevron.l delta chevron.r) y = 0$, and hence $E_R y = 0$. It follows that
  $ "res"_(E \/ bb(Q)) "cor"_(E \/ bb(Q)) y = \| R \| E_R y = 0 . $
  Restriction on additive characters across a finite extension is injective: a character that vanishes on a subgroup of finite index has finite image in the torsion-free group $bb(Q)_ell$, and so is zero. On the other hand, transitivity and the corestriction–restriction identity give
  $ "cor"_(E \/ bb(Q)) y = "cor"_(M \/ bb(Q)) "cor"_(E \/ M) "res"_(E \/ M) x = \[ E : M \] "cor"_(M \/ bb(Q)) x eq.not 0 \, $
  a contradiction. ◻
]

=== 3.3 A signed representation in the character space <a-signed-representation-in-the-character-space>

The class field description also controls the supply of characters when the number field varies. The regular representation gives upper bounds for dimensions of subgroup invariants, while the signed representation below gives lower bounds and ensures a faithful action on the character space.

#thm([Proposition 3.3.])[
  #emph[Let $M \/ bb(Q)$ be a finite, totally imaginary Galois extension, put $R = "Gal" \( M \/ bb(Q) \)$, and let $c in R$ be a complex conjugation. For every rational prime $ell$, there are $R$-equivariant embeddings 
#[#set math.equation(numbering: n => "(3.7)")
 $ W_M := "Ind"_(chevron.l c chevron.r)^R \( upright("sign") \) arrow.r.hook X_ell \( M \) arrow.r.hook bb(Q)_ell \[ R \] \, $ <eq:signed-representation>]

 where $upright("sign") \( c \) = - 1$. In particular, the action of $R$ on $X_ell \( M \)$ is faithful.]
] <prop:signed-representation>

#proof[
  By the normal basis theorem, $V_M = M ⊗_(bb(Q)) bb(Q)_ell$ is the regular representation of $R$, as is its dual. The naturality of (3.5) gives the second embedding.
  The equivariant Dirichlet unit theorem [1] Section 3 identifies the representation $cal(O)_M^times ⊗_(bb(Z)) bb(Q)_ell$ with the permutation representation on the archimedean places minus its trivial summand. Since these places are indexed by $R \/ chevron.l c chevron.r$, writing $U^(upright("alg")) = cal(O)_M^times ⊗_(bb(Z)) bb(Q)_ell$ gives
  $ bb(Q)_ell xor U^(upright("alg")) tilde.eq "Ind"_(chevron.l c chevron.r)^R upright(bold(1)) . $
  The character identity follows first over the real numbers from the usual logarithmic unit embedding, and hence over $bb(Q)_ell$ by semisimplicity in characteristic zero. In particular, $U^(upright("alg"))$ is self-dual. Its $ell$-adic logarithmic image $U_M$ is a quotient of $U^(upright("alg"))$; no injectivity of the logarithm on this tensor product is needed.
  The decomposition of the regular representation induced from the two characters of $chevron.l c chevron.r$ is
  $ bb(Q)_ell \[ R \] tilde.eq "Ind"_(chevron.l c chevron.r)^R upright(bold(1)) xor W_M tilde.eq bb(Q)_ell xor U^(upright("alg")) xor W_M . $
  Since $U_M^or$ is a subrepresentation of $\( U^(upright("alg")) \)^or tilde.eq U^(upright("alg"))$, semisimplicity and $X_ell \( M \) tilde.eq \( V_M \/ U_M \)^or$ show that $X_ell \( M \)$ contains $bb(Q)_ell xor W_M$. This proves the first embedding in (3.7).
  Finally, realize $W_M$ as the direct sum of the signed lines indexed by the left cosets of $chevron.l c chevron.r$. An element acting trivially must fix the line of the identity coset, and therefore belongs to $chevron.l c chevron.r$. The nonidentity element $c$ acts by $- 1$ on that line. Thus only the identity acts trivially on $W_M$, proving faithfulness. ◻
]

== 4 Normalizer extension and Frobenius generation <sec:generation>

Let $F$ be a number field and let

$ alpha_0 : G_F arrow.r P $

be a continuous open homomorphism. Our eventual aim is to identify this map with ordinary restriction, up to conjugation in $P$. We first enlarge an open part of its domain in a canonical way. For the enlarged map we will prove surjectivity and equality of cyclotomic logarithms at an infinite set of auxiliary primes. The main step is to show that images of local Frobenius elements generate prescribed cyclic subgroups in suitable finite quotients of $P$.

Choose an open normal subgroup $U lt.closed.eq cal(G)$ contained in $G_F$, and put

$ A = alpha_0 \( U \) \, #h(2em) N = ker \( alpha_0 \|_U \) \, #h(2em) T = N_(cal(G)) \( N \) . $

The subgroup $A$ is open in $P$. Since $U subset T$, the normalizer $T$ is open and closed in $cal(G)$; write $T = G_k$.

#thm([Lemma 4.1.])[
  (Extension to the normalizer).  #emph[There is a unique continuous open homomorphism 
$ beta : T arrow.r P $

 whose restriction to $U$ is $alpha_0 \|_U$.]
] <lem:normalizer-extension>

#proof[
  Conjugation by $t in T$ induces a continuous automorphism of $U \/ N = A$. By Theorem 3, applied to $bb(Q)^s \/ \( bb(Q)^s \)^A$, this automorphism is conjugation by a unique element $beta \( t \)$ of $P$. Indeed, the implementing field automorphism of $bb(Q)^s$ fixes $bb(Q)$. Uniqueness shows both that $beta$ is a homomorphism and that $beta \( u \) = alpha_0 \( u \)$ for $u in U$. It also shows that any extension of $alpha_0 \|_U$ to $T$ must equal $beta$: its values must induce these same conjugations on $A$.
  Continuity on the open subgroup $U$ implies continuity on $T$. Moreover, $beta \( T \)$ contains $A$ and is therefore open in $P$. A continuous homomorphism of profinite groups is open onto its image, so $beta$ is open. ◻
]

We keep $U \, A \, N \, T \, k$, and $beta$ fixed for the rest of the argument. List the distinct conjugates of $N$ other than $N$ itself as

$ N_i = t_i N t_i^(- 1) quad \( 1 lt.eq i lt.eq r \) \, #h(2em) t_i in.not T \, #h(2em) H_i = beta \( N_i \) . $

There are finitely many because $U$ normalizes $N$. Normality of $U$ in $cal(G)$ implies that each $N_i$ lies in $U$ and is normal in $U$, so $H_i$ is normal in $A$. Each $H_i$ is nontrivial. Otherwise $t_i N t_i^(- 1) subset N$, and iterating this inclusion would give a descending chain returning to $N$: some power of $t_i$ lies in $U$ and hence normalizes $N$. All inclusions would be equalities, contrary to $t_i in.not T$. We allow $r = 0$, with sums indexed by $i$ then equal to zero.

=== 4.1 A finite quotient with enough characters <a-finite-quotient-with-enough-characters>

The next lemma constructs characters that distinguish a proper subgroup of a cyclic group while avoiding the invariant spaces attached to the $H_i$. The latter condition will prevent cancellation by conjugates of $N$ when we average a pulled-back character on the source. For a finite subgroup $J$ acting on a characteristic-zero vector space, we use the averaging operator $E_J = \| J \|^(- 1) sum_(g in J) g$.

#thm([Lemma 4.2.])[
  (Quotient amplification).  #emph[Fix an odd prime $ell$ and a finite quotient $R_0$ of $P$. There is a finite Galois extension $L \/ bb(Q)$ in $bb(Q)^s$, totally imaginary, such that the quotient $R = "Gal" \( L \/ bb(Q) \)$ dominates $R_0$ and has the following property. For every $gamma in R$, with $C = chevron.l gamma chevron.r$, and every proper subgroup $D < C$, there is $x in X_ell \( L \)$ satisfying 
#[#set math.equation(numbering: n => "(4.1)")
 $ x in X_ell \( L \)^D \, #h(2em) E_C x = 0 \, #h(2em) x in.not sum_(i = 1)^r X_ell \( L \)^(H_i) . $ <eq:separating-character>]

 Here each $H_i$ acts through its image in $R$.]
] <lem:quotient-amplification>

#proof[
  Choose a quotient $R_1 = "Gal" \( L_1 \/ bb(Q) \)$ dominating $R_0$ such that every $H_i$ has nontrivial image in $R_1$, the kernel of $P arrow.r R_1$ is contained in $A$, and $L_1$ contains $bb(Q) \( i \)$. These are finitely many compatible conditions on an open normal subgroup of $P$. Put $n = \| R_1 \|$.
  We will enlarge $R_1$ while keeping element orders bounded by $2 n$. At the same time, the images of the $H_i$ and the conjugacy class of complex conjugation will grow. Growth of the $H_i$ makes the sum of their invariant spaces small. Growth of the conjugacy class makes the signed representation supply enough $D$-invariant vectors killed by $E_C$ to escape that sum.
  We use the regular-module auxiliary extension construction appearing in Uchida’s proof [14] pp. 360–362, with quantitative bounds on its invariant spaces. More precisely, we construct a further quotient with kernel consisting of $m$ copies of the regular $bb(F)_2 \[ R_1 \]$-module, where $m$ will be chosen below. Choose $m$ distinct rational primes that split completely in $L_1$. For each of them, select one prime of $L_1$ above it. Approximation gives elements $a_1 \, dots.h \, a_m in L_1^times$ such that $a_j$ has valuation one at its selected prime and valuation zero at every other prime in these $m$ sets. The $m n$ elements
  $ g \( a_j \) \, #h(2em) g in R_1 \, quad 1 lt.eq j lt.eq m \, $
  have independent square classes: their valuations at the selected sets of primes form a permutation of the identity matrix modulo two. Adjoin their square roots and call the resulting field $L$. Kummer theory gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ 1 arrow.r V arrow.r R = "Gal" \( L \/ bb(Q) \) arrow.r R_1 arrow.r 1 \, #h(2em) V tilde.eq bb(F)_2 \[ R_1 \]^m $ <eq:regular-kummer-kernel>]
  as $R_1$-modules. The dual module supplied by Kummer theory is again the regular permutation module. The field $L$ is Galois over $bb(Q)$ because all conjugates of the $a_j$ were included; its group is solvable, so $L subset bb(Q)^s$. No splitting of (4.2) is required.
  Every element of $R$ has order at most $2 n$, since its $n$th power lies in the exponent-two group $V$. Write $A_R$ and $H_(i \, R)$ for the images of $A$ and $H_i$ in $R$. The choice of $R_1$ gives $V subset A_R$. Choose $h_i in H_(i \, R)$ with nonidentity image $g_i in R_1$, of order $d_i > 1$. As $H_(i \, R)$ is normal in $A_R$,
  $ \( g_i - 1 \) V = \[ h_i \, V \] subset H_(i \, R) . $
  On $m$ regular modules the rank of $g_i - 1$ is $m n \( 1 - 1 \/ d_i \) gt.eq m n \/ 2$. Consequently
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| H_(i \, R) \| gt.eq 2^(m n \/ 2) . $ <eq:large-subgroups>]
  If $c in R$ is a complex conjugation, its image in $R_1$ is a nontrivial involution because $L_1$ is totally imaginary. Conjugation by $V$ alone therefore gives at least $2^(m n \/ 2)$ distinct conjugates of $c$; thus
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| c^R \| gt.eq 2^(m n \/ 2) . $ <eq:large-conjugacy-class>]
  Set $eta = 2^(- m n \/ 2)$ and write $X = X_ell \( L \)$. By Proposition 10, $X$ embeds in the regular $bb(Q)_ell \[ R \]$-representation and contains
  $ W = "Ind"_(chevron.l c chevron.r)^R \( "sign" \) . $
  The regular-representation bound and (4.3) give
  #[#set math.equation(numbering: n => "(4.5)")
   $ dim (sum_(i = 1)^r X^(H_i)) lt.eq sum_(i = 1)^r frac(\| R \|, \| H_(i \, R) \|) lt.eq r eta \| R \| . $ <eq:forbidden-dimension>]
  The character of $W$ takes the value $\| R \| \/ 2$ at the identity, the value $- \| R \| \/ \( 2 \| c^R \| \)$ on $c^R$, and zero elsewhere. Hence, for every subgroup $J subset R$,
  #[#set math.equation(numbering: n => "(4.6)")
   $ lr(|dim W^J - frac(\| R \|, 2 \| J \|)|) lt.eq frac(eta \| R \|, 2) . $ <eq:signed-invariants>]
  For $D < C = chevron.l gamma chevron.r$, the map $E_C : W^D arrow.r W^C$ is surjective. Since $\| D \| lt.eq \| C \| \/ 2$ and $\| C \| lt.eq 2 n$, (4.6) implies
  $ dim ker \( E_C \|_(W^D) \) & = dim W^D - dim W^C\
 & gt.eq frac(\| R \|, 2) (frac(1, \| D \|) - frac(1, \| C \|)) - eta \| R \|\
 & gt.eq \| R \| (frac(1, 4 n) - eta) . $
  Choose the integer $m gt.eq 1$ so large that
  $ \( r + 1 \) 2^(- m n \/ 2) < frac(1, 4 n) . $
  This single choice works for all $gamma$ and all proper $D < C$. The last dimension is then greater than (4.5), so its kernel contains a vector outside the indicated sum. This vector gives (4.1). If $C$ is trivial, there is no proper subgroup to consider. ◻
]

=== 4.2 Generation by local Frobenius images <generation-by-local-frobenius-images>

We now use these characters to strengthen the local correspondence. Containment of a source decomposition group in a target decomposition group places its Frobenius image in a cyclic subgroup of a finite quotient. The next proposition shows that, after enlarging the quotient, infinitely many such images generate the entire cyclic subgroup.

#thm([Proposition 4.3.])[
  (Frobenius generation).  #emph[Fix an odd prime $ell$, a finite quotient $R_0$ of $P$, and $gamma_0 in R_0$. There are a quotient 
$ P arrow.r.twohead R = "Gal" \( L \/ bb(Q) \) arrow.r.twohead R_0 $

 and a lift $gamma in R$ of $gamma_0$ with the following property. There are infinitely many $ell$-active primes $v$ of $k$, over distinct rational primes $p eq.not ell$, for which compatible prolongations can be chosen so that:]
  + #emph[the corresponding target rational prime $q eq.not ell$ is unramified in $L$, and the target prolongation restricts to a prime $w'$ of $L$ whose Frobenius in $R$ is $gamma$;]
  + #emph[the image in $R$ of an arithmetic Frobenius lift at $v$ generates $chevron.l gamma chevron.r$.]
] <prop:frobenius-generation>

#proof[
  Choose $R$ by Lemma 12 and choose any lift $gamma$ of $gamma_0$. Put $C = chevron.l gamma chevron.r$. Take an open normal subgroup $U' lt.closed.eq cal(G)$ contained in $U ∩ beta^(- 1) \( P_L \)$; for example, take the core of this open subgroup in $cal(G)$. Let $F' \/ bb(Q)$ be the finite Galois extension with $G_(F') = U'$. The map
  $ beta \|_(U') : G_(F') arrow.r P_L $
  is open.
  Chebotarev’s theorem supplies infinitely many primes $w'$ of $L$, over distinct rational primes $q eq.not ell$ unramified in $L$, with Frobenius exactly $gamma$. Theorem 5 applied to $beta \|_(U')$ pairs all but finitely many of them with $ell$-active primes $v'$ of $F'$, away from $ell$. Uniqueness of the target prime for an active source prime implies that infinitely many $v'$ occur. Since only finitely many primes of $F'$ lie over a given rational prime, we may pass to a subset with distinct source rational primes $p$, all unramified in $F'$. Passing to another infinite subset, we may also assume that their Frobenius elements in $"Gal" \( F' \/ bb(Q) \)$ are a fixed element $delta$.
  Fix a source prolongation above each $v'$, and use it also for the prime $v = v' \|_k$. The original correspondence at $v'$ can be made with this prolongation: changing the source prolongation conjugates the target group by an element of $beta \( U' \) subset P_L$, which preserves the finite prime $w'$. Activity passes from $v'$ to $v$, since the relevant inertia subgroup for $U'$ is contained in that for $T$. Apply Theorem 5 at $v$ using this same source prolongation. If $w_1$ is the restriction to $L$ of its target prolongation, then
  $ beta \( D_(v') \) subset beta \( D_v \) ∩ P_L subset D_(w_1) . $
  Uniqueness of the target prime for $v'$ at the level of $L$ gives $w_1 = w'$. Consequently the corresponding target rational prime is $q$, and the image of $D_v$ in $R$ lies in $C$. These changes of prolongations preserve $v'$ and $w'$, so they preserve the previously selected finite Frobenius elements $delta$ and $gamma$.
  Put $H = T \/ U' subset cal(G) \/ U'$ and let $f$ be the residue degree of $v$ over $p$. Figure 1 records the primes involved. Here $delta = "Fr" \( v' \/ p \)$ and $gamma = "Fr" \( w' \/ q \)$ belong to the finite Galois groups over $bb(Q)$. The symbols $"Fr"_(v')$ and $"Fr"_(w')$ used below instead denote local arithmetic Frobenius over $F'$ and $L$, respectively.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$v' upright(" of ") F'$])
  content((3.575, 0), [$w' upright(" of ") L$])
  content((0, -1.585), [$v upright(" of ") k$])
  content((3.575, -1.585), [$q upright(" of ") bb(Q)$])
  content((0, -3.171), [$p upright(" of ") bb(Q)$])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((0.864, 0), (2.777, 0), stroke: (dash: "dashed"), mark: (end: ">"))
  line((3.575, -0.2725), (3.575, -1.313), mark: (end: ">"))
  line((0, -1.858), (0, -2.898), mark: (end: ">"))
  content((-0.3223, -2.378), [#text(size: 0.73em)[$f$]])
  line((0.732, -1.585), (2.711, -1.585), stroke: (dash: "dashed"), mark: (end: ">"))
})],
    caption: [Figure 1: Vertical arrows restrict primes; dashed arrows are the partial local correspondences. The residue degree of $v \/ p$ is $f$. No equality between $p$ and $q$ is assumed at this stage. ],
  ) <fig:generation-primes>
  In the decomposition group $chevron.l delta chevron.r subset "Gal" \( F' \/ bb(Q) \)$ we have
  #[#set math.equation(numbering: n => "(4.7)")
   $ chevron.l delta chevron.r ∩ H = chevron.l delta^f chevron.r \, #h(2em) f = min { j gt.eq 1 : delta^j in H } . $ <eq:residue-degree-intersection>]
  Indeed, the residue degree is the orbit size of the distinguished coset in the action of $chevron.l delta chevron.r$ on $"Gal" \( F' \/ bb(Q) \) \/ H$. This description does not require $H$ to be normal. In particular $f$ is constant on the chosen infinite set. The homomorphism $beta$ induces $H arrow.r R$, since $beta \( U' \) subset P_L$; define
  $ d = beta \( delta^f \) in R . $
  This notation is independent of the lift of $delta^f$ to $T$. A local lift of rational Frobenius to the $f$th power is a Frobenius lift at $v$, so the preceding containment gives $d in C$.
  We claim that $D = chevron.l d chevron.r$ equals $C$. Suppose that $D < C$, and choose $x$ as in (4.1). Pullback along $beta \|_(U')$ gives a linear map
  $ j : X_ell \( L \) arrow.r X_ell \( F' \) \, #h(2em) y = j \( x \) . $
  The map $j$ is injective: its defining homomorphism has open image in $P_L$, and an additive $bb(Q)_ell$-valued character vanishing on an open subgroup vanishes everywhere. Frobenius evaluation at $w'$ is invariant under $gamma$, because $gamma$ fixes $w'$ and acts trivially by conjugation on its unramified local quotient. Therefore
  $ x \( "Fr"_(w') \) = \( E_C x \) \( "Fr"_(w') \) = 0 . $
  The character $x$ is unramified at $w'$, so this equality says that it vanishes on the entire decomposition group there. It follows that $y \( "Fr"_(v') \) = 0$ for every prime in our infinite set. Proposition 9(ii) now gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ E_(chevron.l delta chevron.r) y = 0 . $ <eq:source-average-zero>]
  To see why this contradicts the choice of $x$, write $a = \| chevron.l delta chevron.r \|$ and $Y = j \( X_ell \( L \) \)$. Pullback is $T$-equivariant, where the action on the target character space is through $beta$. In particular $y$ is fixed by $N$. In the sum defining (4.8), the powers $delta^j$ belonging to $H$ are exactly those for which $f divides j$, by (4.7). Each such power acts as the identity on $y$, because $x$ is $D$-invariant. If $f divides.not j$, choose a lift $t$ of $delta^j$ to $cal(G)$. Then $t in.not T$, and $delta^j y$ is fixed by $t N t^(- 1)$. Multiplying (4.8) by $a$ thus yields
  $ 0 = a / f thin y + sum_(0 lt.eq j < a\
f divides.not j) delta^j y \, #h(2em) y in sum_(i = 1)^r X_ell \( F' \)^(N_i) . $
  It remains to return this membership to the target character space. The finite group $U \/ U'$ acts on $X_ell \( F' \)$, and its subspace $Y$ is stable. Semisimplicity supplies a $U$-equivariant projection
  $ pi : X_ell \( F' \) arrow.r Y . $
  Every $N_i$ lies in $U$, so $pi$ carries $N_i$-invariants into $Y^(N_i)$. Equivariance and injectivity of $j$ give
  $ Y^(N_i) = j #scale(x: 120%, y: 120%)[\(] X_ell \( L \)^(H_i) #scale(x: 120%, y: 120%)[\)] . $
  Applying $pi$ to the displayed membership and then applying $j^(- 1)$ contradicts the last condition in (4.1). Only $U$-equivariance of the projection is used; no normality of $T$ in $cal(G)$ is needed. Thus $D = C$, proving the proposition. ◻
]

=== 4.3 Surjectivity and cyclotomic logarithms <surjectivity-and-cyclotomic-logarithms>

The generation statement now gives the two properties needed in the next stage. The first removes any restriction on the target image. For the second, a congruence condition on $ell$ forces the source primes supplied by the proposition to have residue degree one, so the character-detection theorem applies.

#thm([Theorem 4.4.])[
  #emph[The extension $beta : G_k arrow.r P$ is surjective. Put 
$ m_0 = \[ k : bb(Q) \] ! \, #h(2em) cal(L) = { ell : ell upright(" is an odd prime and ") ell equiv 1 med \( mod med m_0 \) } . $

 The set $cal(L)$ is infinite, and for every $ell in cal(L)$, 
#[#set math.equation(numbering: n => "(4.9)")
 $ log chi_ell compose beta = log chi_(k \, ell) quad upright("as additive characters on ") G_k . $ <eq:cyclotomic-logarithms>]

 Here $chi_ell$ is the $ell$-adic cyclotomic character on $P$, and $chi_(k \, ell)$ is the ordinary cyclotomic character on $G_k$.]
] <thm:normalized-map>

#proof[
  Let $R_0$ be any finite quotient of $P$ and let $gamma_0 in R_0$. Proposition 13 produces an element $d$ in the image of $beta$ in a further quotient $R$ such that $chevron.l d chevron.r = chevron.l gamma chevron.r$, where $gamma$ lifts $gamma_0$. Thus $gamma$, and hence $gamma_0$, belongs to the image. Since $beta \( T \)$ is compact, surjectivity onto every finite quotient implies $beta \( T \) = P$.
  Dirichlet’s theorem on primes in arithmetic progressions shows that $cal(L)$ is infinite. Fix $ell in cal(L)$, take
  $ R_0 = "Gal" \( bb(Q) \( mu_ell \) \/ bb(Q) \) tilde.eq bb(F)_ell^times \, $
  and choose $gamma_0$ to generate this cyclic group. The proposition gives infinitely many active primes $v$ of $k$ over distinct rational primes $p eq.not ell$, for which the image of a Frobenius lift $sigma_v$ acts on $mu_ell$ by a generator. Let $q$ be the corresponding target rational prime and let $f = \[ kappa \( v \) : bb(F)_p \]$, so $N v = p^f$. If $a \( sigma_v \) in hat(bb(Z))$ is the target residue exponent, Lemma 7 gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ p^f = q^(a \( sigma_v \)) quad upright("in ") bb(Z)_ell^times . $ <eq:generating-norm>]
  Its reduction modulo $ell$ says that $p^f$ generates $bb(F)_ell^times$. In particular $gcd \( f \, ell - 1 \) = 1$. But $1 lt.eq f lt.eq \[ k : bb(Q) \]$, and every prime divisor of any $f > 1$ in this range divides $m_0$, hence divides $ell - 1$. Consequently $f = 1$.
  Taking logarithms in (4.10) gives
  $ \( log chi_ell compose beta \) \( sigma_v \) = log p = log chi_(k \, ell) \( sigma_v \) . $
  The difference is an element of $X_ell \( k \)$ vanishing at infinitely many primes of absolute residue degree one. Proposition 9(i) proves (4.9). ◻
]

== 5 Matching residue characteristics <sec:matching>

We now show that almost every prime of $bb(Q) \( i \)$ above a split rational prime has an active partner of the same residue characteristic. The auxiliary prime defining activity may vary with the pair. Two finiteness statements make this possible: almost every such target prime has only finitely many possible partners, and the number of target primes missed at a fixed auxiliary prime admits a uniform bound.

Keep the surjection $beta : G_k arrow.r P$ and the set $cal(L)$ from Theorem 14, and put

$ B = bb(Q) \( i \) \, #h(2em) G_K = beta^(- 1) \( P_B \) \, #h(2em) beta_B = beta \|_(G_K) : G_K arrow.r.twohead P_B . $

Thus $K \/ k$ is quadratic. An #emph[active pair at $ell$] in this section means a source prime $v$ of $K$ active at $ell$ for $beta_B$, together with its corresponding prime $w$ of $B$ from Theorem 5. In particular, both primes lie away from $ell$. For a prime $w$ of $B$, define

$ cal(V)_w = { v : \( v \, w \) upright(" is an active pair at some ") ell in cal(L) } . $

=== 5.1 Finite fibers and a uniform bound on missed primes <finite-fibers-and-a-uniform-bound-on-missed-primes>

#thm([Lemma 5.1.])[
  #emph[For all but finitely many primes $w$ of $B$ above rational primes split in $B$, the set $cal(V)_w$ is finite.]
] <lem:finite-fibers>

#proof[
  Fix $r in cal(L)$. Proposition 10 supplies a nonzero character $psi in X_r \( B \)$ on which $"Gal" \( B \/ bb(Q) \)$ acts by its nontrivial character. By Proposition 9(i), $psi \( "Fr"_w \)$ is nonzero at all but finitely many degree-one primes $w divides.not r$. Fix such a $w$ above a split rational prime $q eq.not r$, and put
  $ x_0 = \( log chi_r \) \|_(P_B) \, #h(2em) z = frac(psi \( "Fr"_w \), log_r q) . $
  The denominator is nonzero: the kernel of the logarithm on $bb(Z)_r^times$ consists of roots of unity, and the positive rational integer $q$ is not a root of unity. Thus $z eq.not 0$, and $psi - z x_0$ vanishes on the decomposition group at $w$, since it is unramified there and vanishes on Frobenius.
  Consider its pullback
  $ y = beta_B^(*) \( psi - z x_0 \) in X_r \( K \) . $
  The pullback of $psi$ transforms by sign under $G_k \/ G_K$. Its corestriction to $k$ is therefore zero: restricting that corestriction back to $K$ gives the sum of the two translates, and restriction is injective for additive characters with characteristic-zero coefficients. Theorem 14 identifies $beta_B^(*) x_0$ with $log chi_(K \, r)$. Consequently
  $ "cor"_(K \/ bb(Q)) \( y \) = - z \[ K : bb(Q) \] log chi_(bb(Q) \, r) eq.not 0 . $
  For every $v in cal(V)_w$ away from $r$, decomposition containment gives $y \( "Fr"_v \) = 0$, regardless of which auxiliary prime makes the pair active. Proposition 9(iii) permits only finitely many such $v$. There are also only finitely many primes of $K$ above $r$, proving the assertion. ◻
]

For $ell in cal(L)$, let $cal(M)_ell$ be the set of primes of $B$ which occur in no active pair at $ell$. This includes the primes above $ell$.

We seek a bound for $\# cal(M)_ell$ depending only on $\[ K : bb(Q) \]$. The proof will place independent classes attached to missed primes in one character space of an $S$-unit group. We first record the standard cohomological identification of that group, including the completion step; see also [11].

#thm([Lemma 5.2.])[
  (Unramified Kummer classes).  #emph[Let $F$ be a number field, let $ell$ be a rational prime, and let $S$ be a finite set of places of $F$ containing all places above $ell$ and all archimedean places. Then Kummer theory induces a natural isomorphism 
#[#set math.equation(numbering: n => "(5.1)")
 $ H_(upright("cont"))^1 \( G_F \, bb(Q)_ell \( 1 \) \)_(upright("unramified outside ") S) tilde.eq cal(O)_(F \, S)^times ⊗_(bb(Z)) bb(Q)_ell . $ <eq:unramified-kummer>]

 It is equivariant for every group of field automorphisms of $F$ preserving $S$, with the natural action on cohomology combining conjugation on $G_F$ and the action on the Tate twist.]
] <lem:kummer-unramified>

#proof[
  Integral Kummer theory gives
  $ H_(upright("cont"))^1 \( G_F \, bb(Z)_ell \( 1 \) \) tilde.eq "proj lim"_n F^times \/ \( F^times \)^(ell^n) . $
  The inverse-limit assertion follows from the finite-level Kummer isomorphisms; the degree-zero groups are finite and satisfy the Mittag–Leffler condition. Every continuous rational cocycle has bounded image, since $G_F$ is compact, and hence becomes integral after multiplication by one power of $ell$. The same observation for coboundaries gives rationalization of this integral cohomology. At a prime outside $S$, inertia acts trivially on $bb(Z)_ell \( 1 \)$, and its Kummer evaluation is the valuation times the tame $ell$-adic character. These integral inertia homomorphisms are torsion-free. Thus unramifiedness after rationalization is exactly the vanishing of all integral valuation coordinates outside $S$.
  For completeness, put $U_S = cal(O)_(F \, S)^times$ and let
  $ H_n = { \[ a \] in F^times \/ \( F^times \)^(ell^n) : "ord"_v \( a \) equiv 0 med \( mod med ell^n \) upright(" for every ") v in.not S } . $
  Writing $"Cl"_S \( F \)$ for the $S$-ideal class group, there is an exact sequence
  #[#set math.equation(numbering: n => "(5.2)")
   $ 0 arrow.r U_S \/ U_S^(ell^n) arrow.r H_n arrow.r "Cl"_S \( F \) \[ ell^n \] arrow.r 0 . $ <eq:s-unit-completion>]
  The last map sends $\[ a \]$ to the ideal class of $"div"_S \( a \) \/ ell^n$, where $"div"_S$ records the valuations outside $S$. The transition from level $n + 1$ to level $n$ induces multiplication by $ell$ on these obstruction classes. Since $"Cl"_S \( F \)$ is finite, their inverse limit is zero. It follows that the kernel of all outside-$S$ valuations in the completed multiplicative group is precisely $"proj lim"_n U_S \/ U_S^(ell^n)$. The argument takes place in the full completed multiplicative group; it does not assume finite valuation support for its elements. Finally $U_S$ is finitely generated, so rationalizing its completion gives $U_S ⊗ bb(Q)_ell$. This proves (5.1). All the constructions commute with field automorphisms preserving $S$, giving the asserted equivariance. ◻
]

Uchida’s proof of target-side finiteness associates Kummer classes to missed primes and bounds them by a unit rank [15] Proposition 1. We refine that argument by keeping the classes in one character space of a cyclic extension. The multiplicity of this character has a bound independent of $ell$, even when the extension degree grows.

#thm([Proposition 5.3.])[
  #emph[For every $ell in cal(L)$, 
$ \# { w in cal(M)_ell : w divides.not ell } lt.eq 2 \[ K : bb(Q) \] \, #h(2em) \# cal(M)_ell lt.eq 2 \[ K : bb(Q) \] + 2 . $

]
] <prop:uniform-missed-primes>

#proof[
  Fix $ell in cal(L)$ and any finite set $J subset cal(M)_ell$ of primes away from $ell$. For each $w in J$, choose $a_w in B^times$ and $h_w > 0$ with
  $ \( a_w \) = w^(h_w) . $
  Its compatible Kummer cocycles define a class
  $ kappa_w in H_(upright("cont"))^1 \( P_B \, bb(Q)_ell \( 1 \) \) . $
  They factor through $P_B$ because $bb(Q)^s$ contains the roots of unity and all the required radicals. Valuations at the distinct primes $w$ show that these classes are linearly independent. Each is unramified at every finite prime other than $w$ and the primes above $ell$.
  Write
  $ rho = chi_ell compose beta_B \, #h(2em) epsilon.alt = rho chi_(K \, ell)^(- 1) . $
  By Theorem 14, $epsilon.alt$ takes values in $mu_(ell - 1) subset bb(Q)_ell^times$. Let $K' \/ K$ be the cyclic extension fixed by its kernel, and let $Delta = "Gal" \( K' \/ K \)$. Pullback along the surjection $beta_B$ is injective on $H^1$, with pulled-back coefficient module $bb(Q)_ell \( rho \)$. Restriction to $G_(K')$ remains injective: its kernel is a first cohomology group of the finite group $Delta$, which vanishes in characteristic zero. We therefore obtain independent classes
  $ c_w in H_(upright("cont"))^1 \( G_(K') \, bb(Q)_ell \( 1 \) \) #h(2em) \( w in J \) . $
  Under the natural $Delta$-action on this cohomology, they all lie in the $epsilon.alt^(- 1)$ eigenspace. Indeed the original coefficient module is $bb(Q)_ell \( 1 \) ⊗ epsilon.alt$, so invariance for its twisted action becomes the eigenvalue $epsilon.alt^(- 1)$ after restriction.
  We claim that every $c_w$ is unramified away from $ell$. Suppose that it is ramified at a prime $u divides.not ell$ of $K'$, and let $v$ be the prime below it in $K$. The cyclotomic module is trivial on $I_u$, so the restricted cocycle is a nonzero continuous homomorphism from $I_u$ to the additive group $bb(Q)_ell \( 1 \)$. Choose a pro-$ell$ Sylow subgroup $J_u subset I_u$ on which it is nonzero, and a pro-$ell$ Sylow subgroup $J_v subset I_v$ containing $J_u$. Then $beta_B \( J_v \) eq.not 1$, so $v$ is active at $ell$. Theorem 5 sends $J_v$ into inertia at a corresponding prime $t divides.not ell$ of $B$. Since $t$ occurs in an active pair, $t in.not J$, whereas $kappa_w$ is unramified at $t$. Inertia at $t$ acts trivially on the coefficient module, so the Kummer cocycle itself vanishes on that inertia group. Its pullback therefore vanishes on $J_u$, a contradiction. This proves the claim.
  Let $S$ consist of the archimedean places of $K'$ and its primes above $ell$. By Lemma 16, the classes $c_w$ give independent elements of the $epsilon.alt^(- 1)$ eigenspace in $cal(O)_(K' \, S)^times ⊗ bb(Q)_ell$. It remains to bound this eigenspace. The equivariant Dirichlet $S$-unit theorem [1] Section 3 gives the character of the full $S$-unit module as
  $ \[ cal(O)_(K' \, S)^times ⊗ bb(Q)_ell \] = \[ bb(Q)_ell \[ S \] \] - \[ bb(Q)_ell \] . $
  Each $Delta$-orbit in $S$ contributes at most one copy of the one-dimensional character $epsilon.alt^(- 1)$ to the permutation representation: for a stabilizer $H subset Delta$, its multiplicity in $bb(Q)_ell \[ Delta \/ H \]$ is one if it is trivial on $H$, and zero otherwise. There are
  $ \# \( S \/ Delta \) = r_1 \( K \) + r_2 \( K \) + \# { v upright(" of ") K : v divides ell } lt.eq 2 \[ K : bb(Q) \] $
  such orbits. Subtracting the trivial representation cannot increase this multiplicity. Hence the independent classes $c_w$ lie in a space of dimension at most $2 \[ K : bb(Q) \]$, and $\# J lt.eq 2 \[ K : bb(Q) \]$. Since $J$ was arbitrary, this bounds all missed primes away from $ell$. There are at most two primes of $B$ above $ell$, giving the second bound. ◻
]

The bound depends on $K$, but neither on $ell$ nor on the degree of the cyclic extension $K' \/ K$. We can therefore choose one auxiliary prime that excludes every possible partner of several specified target primes, and contradict this bound. The following elementary Kummer construction provides that choice.

=== 5.2 Simultaneous separation by power residues <simultaneous-separation-by-power-residues>

#thm([Lemma 5.4.])[
  #emph[Let $m \, d gt.eq 1$, let $q_1 \, dots.h \, q_n$ be distinct rational primes, and for each $j$ let $cal(P)_j$ be a finite set of rational primes not containing $q_j$. Given any finite set of rational primes to avoid, there are infinitely many odd primes $ell equiv 1 med \( mod med m \)$ outside that set and all the displayed prime sets such that 
$ p^f med mod med ell in.not chevron.l q_j med mod med ell chevron.r quad \( 1 lt.eq j lt.eq n \, med p in cal(P)_j \, med 1 lt.eq f lt.eq d \) . $

 The sets $cal(P)_j$ may overlap, and may contain $q_i$ for $i eq.not j$.]
] <lem:power-separation>

#proof[
  Choose distinct auxiliary primes $s_j$ larger than $m$, $d$, and every prime in the lists, and put
  $ C = bb(Q) \( zeta_(m product_j s_j) \) . $
  For each $j$, the classes of the distinct rational primes in ${ q_j } union cal(P)_j$ are independent in $C^times \/ \( C^times \)^(s_j)$. Indeed, at any prime in those lists, the ramification index in $C \/ bb(Q)$ divides $\[ bb(Q) \( zeta_m \) : bb(Q) \]$: the other cyclotomic conductors are prime to that prime. This index is prime to $s_j$, and valuations at the separate rational primes give the asserted independence.
  Kummer theory therefore identifies the Galois group over $C$ of
  $ E_j = C #scale(x: 120%, y: 120%)[\(] q_j^(1 \/ s_j) \, med p^(1 \/ s_j) med \( p in cal(P)_j \) #scale(x: 120%, y: 120%)[\)] $
  with an elementary abelian $s_j$-group having one independent coordinate for each listed prime. Choose $sigma_j in "Gal" \( E_j \/ C \)$ which fixes $q_j^(1 \/ s_j)$ and acts nontrivially on every $p^(1 \/ s_j)$ with $p in cal(P)_j$. The extensions $E_j \/ C$ are linearly disjoint, since their degrees are powers of distinct primes. Thus these automorphisms combine to an element $sigma in "Gal" \( E \/ C \)$, where $E$ is their compositum.
  The extension $E \/ bb(Q)$ is Galois. Moreover, conjugation in $"Gal" \( E \/ bb(Q) \)$ preserves whether each of the specified radical coordinates of $sigma$ is trivial: a conjugation only raises its root-of-unity multiplier to a power prime to the corresponding $s_j$. Chebotarev’s theorem supplies infinitely many rational primes $ell$ with Frobenius in the conjugacy class of $sigma$, avoiding the prescribed finite set, all listed primes, and $2$. They split completely in $C$, so $ell equiv 1 med \( mod med m \)$ and $ell equiv 1 med \( mod med s_j \)$. At these primes, $q_j$ is an $s_j$th power modulo $ell$ and every $p in cal(P)_j$ is not.
  The quotient of $bb(F)_ell^times$ by its $s_j$th powers has prime order $s_j$. A nontrivial class stays nontrivial on raising it to any exponent $1 lt.eq f lt.eq d < s_j$. Every power of $q_j$, however, is an $s_j$th power. This proves the displayed separation. In particular, overlaps between different lists impose no conflict: their conditions belong to linearly disjoint Kummer extensions with different prime exponents. ◻
]

#thm([Proposition 5.5.])[
  #emph[For all but finitely many primes $w$ of $B$ above rational primes $q$ split in $B$, there exist a prime $v$ of $K$ above the same $q$ and an auxiliary prime $ell in cal(L)$ for which $\( v \, w \)$ is an active pair for $beta_B$.]
] <prop:same-characteristic>

#proof[
  Suppose that there are infinitely many exceptions. Lemma 15 allows us to choose
  $ w_1 \, dots.h \, w_n \, #h(2em) n > 2 \[ K : bb(Q) \] + 2 \, $
  among them, above distinct split rational primes $q_1 \, dots.h \, q_n$, with every $cal(V)_(w_j)$ finite. Let $cal(P)_j$ be the set of rational residue characteristics of the primes in $cal(V)_(w_j)$. The failure of the asserted conclusion means $q_j in.not cal(P)_j$.
  Apply Lemma 18 with $m = m_0$ and $d = \[ K : bb(Q) \]$. It gives $ell in cal(L)$, away from all the primes involved, such that
  #[#set math.equation(numbering: n => "(5.3)")
   $ N v med mod med ell in.not chevron.l q_j med mod med ell chevron.r #h(2em) \( v in cal(V)_(w_j) \, med 1 lt.eq j lt.eq n \) \, $ <eq:norm-separation>]
  because $N v = p^f$ with $p in cal(P)_j$ and $1 lt.eq f lt.eq \[ K : bb(Q) \]$. If $w_j$ occurred in an active pair at this $ell$, its source prime would lie in $cal(V)_(w_j)$. Applying Lemma 7 to a lift of source Frobenius and reducing modulo $ell$ would give
  $ N v med mod med ell in chevron.l N w_j med mod med ell chevron.r = chevron.l q_j med mod med ell chevron.r \, $
  contrary to (5.3). All $n$ primes $w_j$ therefore belong to $cal(M)_ell$, contradicting Proposition 17. ◻
]

== 6 Identifying the homomorphism <sec:identification>

We now turn the prime correspondence into equality of group homomorphisms. The argument uses one fixed coefficient prime $r$, although the auxiliary prime witnessing activity is allowed to vary. This distinction is what makes the correspondences constructed in Section 5 sufficient.

Retain the map $beta : T = G_k arrow.r P$, the infinite set $cal(L)$, and the fields $B = bb(Q) \( i \)$ and $K$ from Sections 4–5. Thus $G_K = beta^(- 1) \( P_B \)$, and Theorem 14 gives

#[#set math.equation(numbering: n => "(6.1)")
 $ log chi_r compose beta = log chi_(k \, r) #h(2em) \( r in cal(L) \) . $ <eq:fixed-r-log>]

Write $sigma : T arrow.r P$ for ordinary restriction.

#thm([Proposition 6.1.])[
  #emph[There is an element $a in P$ such that $beta = "Ad" \( a \) compose sigma$ on $T$.]
] <prop:identify-normalized>

#proof[
  Fix a finite Galois extension $L \/ bb(Q)$ inside $bb(Q)^s$ containing $B$, and put $R = "Gal" \( L \/ bb(Q) \)$. Choose a finite Galois extension $F' \/ bb(Q)$ containing $K$ and $L$ such that $beta \( G_(F') \) subset P_L$. This is possible by taking the core in $cal(G)$ of the appropriate open subgroup of $T$. Fix $r in cal(L)$.
  The maps $beta$ and $sigma$, restricted to $G_(F')$, give two pullbacks
  #[#set math.equation(numbering: n => "(6.2)")
   $ i_beta \, i_sigma : X_() \( \) r L arrow.r X_() \( \) r F' . $ <eq:two-pullbacks>]
  Both are injective: their underlying homomorphisms have open image, and an additive $bb(Q)_r$-valued character vanishing on a finite-index subgroup is zero. For $a in P$ let $sigma_a = "Ad" \( a \) compose sigma$ and let $i_a$ be its pullback. Since $L \/ bb(Q)$ is Galois, $sigma_a \( G_(F') \) subset P_L$. The map $i_a$ depends only on $a$ modulo $P_L$, because inner automorphisms of $P_L$ act trivially on additive characters.
  #emph[Frobenius evaluations.] Let $q eq.not r$ range over rational primes split completely in $F'$. By Proposition 19, for all but finitely many such $q$ there is a prime $v$ of $K$ above $q$ whose decomposition group maps into a decomposition group at a prime $w$ of $B$ above the same $q$. Choose a prime $v'$ of $F'$ above $v$ and compatible prolongations. Then
  $ beta \( D_(v') \) subset D_u subset P_L $
  for a prime $u$ of $L$ above $w$. Every prime here has absolute residue degree one, because $q$ splits completely in $F'$.
  Choose a lift $h$ of arithmetic Frobenius in $D_(v')$. Let $a_q in hat(bb(Z))$ be the residue exponent of $beta \( h \)$ at $u$. Equation (6.1) gives
  $ \( a_q \)_r log_r q = log_r q . $
  The number $log_r q$ is nonzero: $q in bb(Z)_r^times$ is a positive rational integer larger than one and is not a root of unity. Consequently $\( a_q \)_r = 1$. Every $x in X_() \( \) r L$ is unramified at $u$, so
  #[#set math.equation(numbering: n => "(6.3)")
   $ i_beta \( x \) \( "Fr"_(v') \) = x \( "Fr"_u \) . $ <eq:matched-evaluation>]
  This calculation uses only decomposition containment from the active correspondence. It does not require that its auxiliary prime be $r$.
  Under ordinary restriction, the same Frobenius maps to Frobenius at another prime of $L$ above $q$. An element of $R$ carries this prime to $u$. Choose a lift $a in P$ of that element. Then
  $ i_beta \( x \) \( "Fr"_(v') \) = i_a \( x \) \( "Fr"_(v') \) #h(2em) upright("for every ") x in X_() \( \) r L . $
  The choice of $a$ modulo $P_L$ may initially depend on $q$. Since $R$ is finite, an infinite set of distinct $q$ uses one fixed choice. For each $x$, the difference $i_beta \( x \) - i_a \( x \)$ therefore vanishes at infinitely many degree-one primes of $F'$. Proposition 9 gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ i_beta = i_a . $ <eq:equal-pullbacks>]
  #emph[From characters to the finite group.] The field $F' \/ bb(Q)$ is Galois, so $T$ acts on $X_() \( \) r F'$ by conjugation. The two pullbacks intertwine this action with the respective actions on $X_() \( \) r L$ induced by $beta$ and $sigma_a$. If $i$ denotes their common injective value in (6.4), then for $t in T$ and $x in X_() \( \) r L$,
  $ i #scale(x: 120%, y: 120%)[\(] beta \( t \) dot.op x #scale(x: 120%, y: 120%)[\)] = t dot.op i \( x \) = i #scale(x: 120%, y: 120%)[\(] sigma_a \( t \) dot.op x #scale(x: 120%, y: 120%)[\)] . $
  The field $L$ is totally imaginary because it contains $B$. By Proposition 10, $R$ acts faithfully on $X_() \( \) r L$. Hence
  $ beta \( t \) med mod med P_L = sigma_a \( t \) med mod med P_L #h(2em) \( t in T \) . $
  #emph[One conjugation for all finite quotients.] For each such $L$, let
  $ C_L = { a in P : med beta \( t \) equiv "Ad" \( a \) \( sigma \( t \) \) med \( mod med P_L \) upright(" for every ") t in T } . $
  We have proved that $C_L$ is nonempty. It is closed, and indeed clopen, since the defining condition depends only on $a$ modulo $P_L$. If $L$ contains finitely many fields $L_1 \, dots.h \, L_s$, then $C_L subset ⋂_j C_(L_j)$. Composita thus give the finite-intersection property. Compactness of $P$ supplies an element in every $C_L$. The extensions $L$ containing $B$ are cofinal among finite Galois subextensions of $bb(Q)^s \/ bb(Q)$, so this element gives the asserted equality in $P$. ◻
]

We remove the normalizer extension and return to the original source.

#thm([Theorem 6.2.])[
  #emph[Let $F$ be a number field in $overline(bb(Q))$. Every continuous open homomorphism $phi : G_F arrow.r P$ is conjugate in $P$ to ordinary restriction.]
] <thm:prosolvable-rigidity>

#proof[
  As in Lemma 11, choose an open normal subgroup $U$ of $cal(G)$ contained in $G_F$, and extend $phi \|_U$ to the normalizer of its kernel. Proposition 20 shows that, after one conjugation of $phi$, it agrees on $U$ with ordinary restriction $sigma : G_F arrow.r P$.
  For $g in G_F$ and $u in U$, normality of $U$ gives
  $ phi \( g \) sigma \( u \) phi \( g \)^(- 1) = phi \( g u g^(- 1) \) = sigma \( g u g^(- 1) \) = sigma \( g \) sigma \( u \) sigma \( g \)^(- 1) . $
  Thus $sigma \( g \)^(- 1) phi \( g \)$ centralizes $sigma \( U \) = phi \( U \)$, an open subgroup of $P$. Lemma 4 makes this element trivial. The equality holds for every $g in G_F$. ◻
]

#proof[
  Choose copies of the given fields inside $overline(bb(Q))$. By Lemma 2, each $E_i$ contains $bb(Q)^s$. Form the composite
  #[#set math.equation(numbering: n => "(6.5)")
   $ G_(F_1) arrow.r G_1 arrow.r^alpha G_2 arrow.r P \, $ <eq:final-composite>]
  where the outer arrows are restrictions. The first is surjective. The last has open image, since its composite with $G_(F_2) arrow.r.twohead G_2$ is ordinary restriction from an open subgroup of $cal(G)$ to $P$. Continuous surjective homomorphisms between profinite groups are open, so (6.5) is open.
  By Theorem 21, this composite is conjugate to ordinary restriction. Cyclotomic characters are unchanged by conjugation. All roots of unity lie in $bb(Q)^s$, so the full cyclotomic characters factor through the groups in (6.5). Surjectivity of the first arrow therefore yields
  $ chi_(E_2 \/ F_2) compose alpha = chi_(E_1 \/ F_1) quad upright("in ") hat(bb(Z))^times . $
  Theorem 6 gives an equivariant embedding $E_2 arrow.r.hook E_1$. Its uniqueness is Uchida’s theorem cited after Theorem 6. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Hyman Bass, #emph[Generators and relations for cyclotomic units], Nagoya Math. J. #strong[27] (1966), no.~2, 401--407. #link("https://doi.org/10.1017/S0027763000026258")[doi:10.1017/S0027763000026258].]
#bibitem([2])[Samit Dasgupta, #emph[Ranks of matrices of logarithms of algebraic numbers. I: The theorems of Baker and Waldschmidt--Masser], Essential Number Theory #strong[2] (2023), no.~1, 93--138. #link("https://doi.org/10.2140/ent.2023.2.93")[doi:10.2140/ent.2023.2.93].]
#bibitem([3])[Yuichiro Hoshi, #emph[Homomorphisms of global solvably closed Galois groups compatible with cyclotomic characters], Tohoku Math. J. (2) #strong[77] (2025), no.~1, 17--32. #link("https://doi.org/10.2748/tmj.20230414")[doi:10.2748/tmj.20230414].]
#bibitem([4])[Yuichiro Hoshi, #emph[A note on open homomorphisms between global solvably closed Galois groups], Kodai Math. J. #strong[49] (2026), no.~1, 63--79. #link("https://doi.org/10.2996/kmj49104")[doi:10.2996/kmj49104].]
#bibitem([5])[Michel Laurent, #emph[Sur quelques résultats récents de transcendance], Astérisque #strong[198--199--200] (1991), 209--230. #link("https://doi.org/10.24033/ast.93")[doi:10.24033/ast.93].]
#bibitem([6])[Yu Mao and Mohamed Saïdi, #emph[Open homomorphisms between $m$-step solvable Galois groups compatible with the cyclotomic characters], preprint, 2025. #link("https://arxiv.org/abs/2512.13312")[arXiv:2512.13312].]
#bibitem([7])[D.~W. Masser, #emph[On polynomials and exponential polynomials in several complex variables], Invent. Math. #strong[63] (1981), no.~1, 81--95. #link("https://doi.org/10.1007/BF01389194")[doi:10.1007/BF01389194].]
#bibitem([8])[Jürgen Neukirch, #emph[Kennzeichnung der $p$-adischen und der endlichen algebraischen Zahlkörper], Invent. Math. #strong[6] (1969), 296--314. #link("https://doi.org/10.1007/BF01425420")[doi:10.1007/BF01425420].]
#bibitem([9])[Jürgen Neukirch, #emph[Kennzeichnung der endlich-algebraischen Zahlkörper durch die Galoisgruppe der maximal auflösbaren Erweiterungen], J. reine angew. Math. #strong[238] (1969), 135--147. #link("https://doi.org/10.1515/crll.1969.238.135")[doi:10.1515/crll.1969.238.135].]
#bibitem([10])[Jürgen Neukirch, #emph[Über die absoluten Galoisgruppen algebraischer Zahlkörper], Astérisque #strong[41--42] (1977), 67--79. #link("https://www.numdam.org/item/AST_1977__41-42__67_0/").]
#bibitem([11])[Jürgen Neukirch, #emph[Algebraic Number Theory], translated by Norbert Schappacher, Grundlehren der mathematischen Wissenschaften, vol.~322, Springer-Verlag, Berlin, 1999. #link("https://doi.org/10.1007/978-3-662-03983-0")[doi:10.1007/978-3-662-03983-0].]
#bibitem([12])[Mohamed Saïdi and Akio Tamagawa, #emph[The $m$-step solvable anabelian geometry of number fields], J. reine angew. Math. #strong[789] (2022), 153--186. #link("https://doi.org/10.1515/crelle-2022-0025")[doi:10.1515/crelle-2022-0025].]
#bibitem([13])[Kôji Uchida, #emph[Isomorphisms of Galois groups], J. Math. Soc. Japan #strong[28] (1976), no.~4, 617--620. #link("https://doi.org/10.2969/jmsj/02840617")[doi:10.2969/jmsj/02840617].]
#bibitem([14])[Kôji Uchida, #emph[Isomorphisms of Galois groups of solvably closed Galois extensions], Tohoku Math. J. (2) #strong[31] (1979), no.~3, 359--362. #link("https://doi.org/10.2748/tmj/1178229803")[doi:10.2748/tmj/1178229803].]
#bibitem([15])[Kôji Uchida, #emph[Homomorphisms of Galois groups of solvably closed Galois extensions], J. Math. Soc. Japan #strong[33] (1981), no.~4, 595--604. #link("https://doi.org/10.2969/jmsj/03340595")[doi:10.2969/jmsj/03340595].]
#bibitem([16])[Michel Waldschmidt, #emph[Transcendance et exponentielles en plusieurs variables], Invent. Math. #strong[63] (1981), no.~1, 97--127. #link("https://doi.org/10.1007/BF01389195")[doi:10.1007/BF01389195].]


