#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Simultaneous primitive roots: a conditional lower bound for prime bases]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <introduction>

For a prime $p$ and an integer $q$ not divisible by $p$, let $"ord"_p \( q \)$ be the multiplicative order of $q$ in $bb(F)_p^times$. Thus $q$ is a primitive root modulo $p$ when $"ord"_p \( q \) = p - 1$. We study primes for which every member of a fixed finite collection of positive prime bases is a primitive root.

The problem for one base is a case of Artin’s primitive-root conjecture, recorded by Hasse in 1927 [4] Section 4.8. Hooley proved the predicted asymptotic for one fixed integer under suitable generalized Riemann hypotheses [7]. Matthews obtained density results for simultaneous primitive roots under generalized Riemann hypotheses [8]. Anwar and Pappalardi later established an infinitude criterion under Schinzel’s Hypothesis H [1]. Unconditional results allowing a finite choice of bases were obtained by Gupta and Murty [3] and by Heath-Brown [6]. In particular, Heath-Brown’s theorem implies that at least one member of any triple of distinct positive primes is a primitive root modulo infinitely many primes.

Our result is an implication from four statements taken from the companion manuscript [10]: a uniform Hecke zero-free assertion (Input 4), a marked Type II estimate (Input 5), a block sieve (Input 9), and a rough-number density estimate (Input 10). We reproduce these statements in the precise forms used here. They are hypotheses of the following theorem; their proofs in [10] and its cited companion manuscripts are outside the scope of this paper.

#thm([Theorem 1.1.])[
  #emph[Assume Inputs 4, 5, 9, and 10. Let $k gt.eq 1$ and let $q_1 \, dots.h \, q_k$ be distinct positive primes. There are constants $c_(upright(bold(q))) > 0$ and $x_(upright(bold(q))) > 1$ such that, for every real $x gt.eq x_(upright(bold(q)))$, at least 
$ c_(upright(bold(q))) frac(x, \( log x \)^2) $

 primes $p in \( x \, 2 x \)$ satisfy 
$ p divides.not q_1 dots.h.c q_k \, #h(2em) "ord"_p \( q_i \) = p - 1 quad \( 1 lt.eq i lt.eq k \) . $

]
] <thm:main>

We extend the construction of primes with controlled predecessors in [10] Section 12 to a fixed progression. The marked Type II estimate remains available after multiplication by a fixed Dirichlet character, and Bombieri–Vinogradov supplies the required distribution in that progression. A direct sieve for the final balanced semiprimes keeps its constant independent of the later marking parameters. The progression makes every prescribed base a quadratic nonresidue. Uniform splitting estimates in the individual Kummer fields then remove the remaining prime divisors of each order index. Section 2 gives this reduction; the subsequent sections prove the two estimates it uses.

== 2 Reduction to two estimates <reduction-to-two-estimates>

Write $L = log x$ and set $eta = 10^(- 6)$. For a prime $p divides.not q$, write

$ iota_p \( q \) = frac(p - 1, "ord"_p \( q \)) $

for the order index of $q$ modulo $p$. The first proposition supplies primes whose predecessors have one large prime factor and otherwise only prime factors in a controlled interval.

#thm([Proposition 2.1.])[
  (A prime reservoir in a fixed progression).  #emph[Assume Inputs 5, 9, and 10. Let $M gt.eq 1$ be odd and squarefree, and let $a$ be a residue class modulo $M$ with $gcd \( a \( a - 1 \) \, M \) = 1$. There are constants $c_(M \, a) > 0$ and $x_(M \, a) > 1$ such that, for every real $x gt.eq x_(M \, a)$, at least $c_(M \, a) x \/ L^2$ primes $p$ satisfy 
$ x < p < 2 x \, #h(2em) p equiv a med \( mod med M \) \, #h(2em) p = 4 r Q + 1 \, $

 where $r$ is a positive integer, $Q > x^0.9$ is prime, and 
$ exp \( L^0.1 \) < ell < exp \( L^0.3 \) #h(2em) upright("for every prime ") ell divides r . $

 The case $M = 1$ is included.]
] <prop:reservoir>

The second proposition bounds the exceptional primes at which a controlled prime factor can divide the index of a prescribed base.

#thm([Proposition 2.2.])[
  (A uniform bound for order obstructions).  #emph[Assume Input 4. For each fixed positive prime $q$, for all sufficiently large real $x$, and uniformly over primes $ell$ with $exp \( L^0.1 \) < ell < exp \( L^0.3 \)$, one has 
$ \# {thin p upright(" prime") : x < p < 2 x \, quad p divides.not q ell \, quad p equiv 1 med \( mod med ell \) \,\
q^(\( p - 1 \) \/ ell) equiv 1 med \( mod med p \)} lt.double_q frac(x, ell \( ell - 1 \) L) + x^(1 - eta) . $

]
] <prop:splitting>

#proof[
  Let $M$ be the product of the odd members of ${ q_1 \, dots.h \, q_k }$, with $M = 1$ if this set has no odd member. For each odd $q_i$, choose a nonzero quadratic nonresidue modulo $q_i$. The Chinese remainder theorem supplies a class $a med mod med M$ having all these prescribed residues; when $M = 1$, take its unique residue class. Since $1$ is a square, $gcd \( a \( a - 1 \) \, M \) = 1$.
  Apply Proposition 2, and call the resulting set of primes $cal(R) \( x \)$. For large $x$, all its primes exceed the $q_i$, and both $r$ and $Q$ in $p = 4 r Q + 1$ are odd. Thus $p equiv 5 med \( mod med 8 \)$, in particular $p equiv 1 med \( mod med 4 \)$. Quadratic reciprocity and the supplementary law for $2$ give
  $ (q_i / p) = cases(delim: "{", (p / q_i) = (a / q_i) = - 1 \, & q_i > 2 \,, \( - 1 \)^(\( p^2 - 1 \) \/ 8) = - 1 \, & q_i = 2 .) $
  For a fixed one of the bases $q = q_i$, the index $iota_p \( q \)$ is odd: if it were even, then $"ord"_p \( q \) divides \( p - 1 \) \/ 2$, contrary to Euler’s criterion. If $iota_p \( q \) > 1$, it has an odd prime divisor $lambda$. Since $iota_p \( q \) divides 4 r Q$, either $lambda = Q$ or $lambda divides r$, and in either case
  #[#set math.equation(numbering: n => "(2.1)")
   $ q^(\( p - 1 \) \/ lambda) equiv 1 med \( mod med p \) . $ <eq:index-obstruction>]
  If $Q divides iota_p \( q \)$, the integer $j = \( p - 1 \) \/ Q$ is less than $2 x^0.1$, and $p divides q^j - 1$. The product of $q^j - 1$ over $1 lt.eq j lt.eq 2 x^0.1$ has logarithm at most
  $ \( log q \) sum_(j lt.eq 2 x^0.1) j lt.double_q x^0.2 . $
  Each of its prime divisors in $\( x \, 2 x \)$ contributes more than $L$ to this logarithm. Consequently the number of these exceptional primes is
  #[#set math.equation(numbering: n => "(2.2)")
   $ O_q #h(-0.16667em) (x^0.2 / L) = o #h(-0.16667em) (x / L^2) . $ <eq:large-factor-exceptions>]
  In the other case, write $ell = lambda divides r$. The controlled interval in Proposition 2 applies to $ell$. Since $ell divides p - 1$, one has $p equiv 1 med \( mod med ell \)$, while Equation (2.1) supplies the other congruence in Proposition 3. Sum that proposition over all such primes $ell$. The sum of $1 \/ \( ell \( ell - 1 \) \)$ is at most the telescoping sum over all integers exceeding $exp \( L^0.1 \)$, and there are at most $exp \( L^0.3 \)$ possible $ell$. The number of exceptions of this second kind is therefore
  #[#set math.equation(numbering: n => "(2.3)")
   $ O_q #h(-0.16667em) (x / L exp \( - L^0.1 \) + exp \( L^0.3 \) x^(1 - eta)) = o #h(-0.16667em) (x / L^2) . $ <eq:controlled-factor-exceptions>]
  Here the two ratios to $x \/ L^2$ are bounded by constant multiples of $L exp \( - L^0.1 \)$ and $L^2 exp \( L^0.3 - eta L \)$, respectively, and both tend to zero.
  There are only finitely many bases. The union over them of the exceptions in Equations (2.2) and (2.3) is still $o \( x \/ L^2 \)$. Since $\# cal(R) \( x \) gt.eq c_(M \, a) x \/ L^2$, for every sufficiently large real $x$ at least $c_(M \, a) x \/ \( 2 L^2 \)$ primes in $cal(R) \( x \)$ have $iota_p \( q_i \) = 1$ for every $i$. These primes give the theorem. ◻
]

== 3 A uniform splitting estimate <sec:splitting>

The analytic input is the following assertion of [10] Theorem 1.2. A finite-order Hecke character of a number field $F$ means a continuous finite-image character of $F^times without bb(A)_F^times$.

#prodef([Input 3.1.])[
  (Uniform Hecke zero-free assertion).  Let $F$ be a cyclotomic number field containing $mu_12$. For every finite-order Hecke character $chi$ of $F$, the meromorphic continuation of $L_F \( s \, chi \)$ has no zeros in
  $ Re s > 1 - 10^(- 6) . $
] <input:hecke>

The assertion permits the pole at $s = 1$ for the principal character. We write $eta = 10^(- 6)$ throughout this section.

#proof[
  Fix the positive prime $q$, put $L = log x$, and let $ell$ be a prime in the range of the proposition. We take $x$ large enough in terms of $q$ that $ell > q$ and $ell gt.eq 5$. Set
  $ E_ell = bb(Q) \( mu_ell \) \, #h(2em) K = K_(ell \, q) = E_ell \( q^(1 \/ ell) \) \, #h(2em) n = \[ K : bb(Q) \] \, #h(2em) D = \| d_K \| . $
  The field $K$ is the splitting field of $T^ell - q$, so it is Galois over $bb(Q)$. The cyclotomic discriminant is $\| d_(E_ell) \| = ell^(ell - 2)$. Since $q eq.not ell$, the prime $q$ is unramified in $E_ell$, and its valuation at each prime of $E_ell$ above $q$ is one. The polynomial $T^ell - q$ is Eisenstein at such a prime. Consequently
  #[#set math.equation(numbering: n => "(3.1)")
   $ \[ K : E_ell \] = ell \, #h(2em) n = ell \( ell - 1 \) . $ <eq:kummer-degree>]
  The discriminant of the power basis generated by $q^(1 \/ ell)$ is, up to sign, $ell^ell q^(ell - 1)$. The relative field discriminant therefore divides $\( ell^ell q^(ell - 1) \) cal(O)_(E_ell)$. The discriminant tower formula gives
  #[#set math.equation(numbering: n => "(3.2)")
   $ D & lt.eq ell^(ell \( ell - 2 \)) #scale(x: 120%, y: 120%)[\(] ell^ell q^(ell - 1) #scale(x: 120%, y: 120%)[\)]^(ell - 1) = ell^(ell \( 2 ell - 3 \)) q^(\( ell - 1 \)^2) \,\
log D + n & lt.double_q n log \( 2 ell \) . $ <eq:kummer-discriminant>]
  The same divisibility and the cyclotomic discriminant show that rational primes outside $q ell$ are unramified in $K$.
  We identify the two congruences in Proposition 3 with complete splitting. Let $p divides.not q ell$ be a prime, choose a prime $frak(P)$ of $K$ above $p$, and write $sigma = "Frob"_(frak(P))$ for arithmetic Frobenius. Its restriction to $E_ell$ sends $zeta_ell$ to $zeta_ell^p$, so it is trivial exactly when $p equiv 1 med \( mod med ell \)$. Under this condition, put $alpha = q^(1 \/ ell)$. Since $p divides.not q$, $alpha$ is a unit at $frak(P)$, and the defining congruence for arithmetic Frobenius gives
  $ frac(sigma \( alpha \), alpha) in mu_ell \, #h(2em) frac(sigma \( alpha \), alpha) equiv alpha^(p - 1) = q^(\( p - 1 \) \/ ell) med \( mod med frak(P) \) . $
  Reduction on $mu_ell$ is injective at $p eq.not ell$. Hence $q^(\( p - 1 \) \/ ell) equiv 1 med \( mod med p \)$ is equivalent to $sigma$ fixing $alpha$. Together the two congruences say that $sigma$ fixes both $E_ell$ and $alpha$, and hence is the identity on $K$. Because $K \/ bb(Q)$ is Galois, this is precisely complete splitting of $p$.
  We transfer Input 4 to $zeta_K$. Put
  $ F_ell = bb(Q) \( mu_(12 ell) \) \, #h(2em) tilde(K) = K F_ell = F_ell \( q^(1 \/ ell) \) . $
  Because $F_ell$ contains $mu_ell$, the extension $tilde(K) \/ F_ell$ is Galois and the map $sigma mapsto sigma \( q^(1 \/ ell) \) \/ q^(1 \/ ell)$ embeds its Galois group in $mu_ell$. It is thus cyclic. Also $F_ell \/ bb(Q)$ is abelian Galois, so $tilde(K) \/ K$ is Galois and restriction embeds its Galois group in $"Gal" \( F_ell \/ bb(Q) \)$. It too is abelian. Abelian Artin formalism [9] Chapter VII, Corollary (10.5) and Theorem (10.6), with the one-dimensional Artin functions identified with their associated primitive Hecke functions, gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ zeta_(tilde(K)) \( s \) & = product_(chi in accent("Gal" \( tilde(K) \/ F_ell \), ̂)) L_(F_ell) \( s \, chi \) \,\
frac(zeta_(tilde(K)) \( s \), zeta_K \( s \)) & = product_(chi in accent("Gal" \( tilde(K) \/ K \), ̂)\
chi eq.not 1) L_K \( s \, chi \) . $ <eq:abelian-zeta-factorizations>]
  These are identities of meromorphic functions, including the local factors at ramified primes. The first product is zero-free on $Re s > 1 - eta$ by Input 4, since $F_ell$ is cyclotomic and contains $mu_12$; its principal factor has the permitted pole at one. Each factor of the second product is an entire nonprincipal finite-order Hecke $L$-function [11]. A zero of $zeta_K$ in this half-plane away from one would therefore be a zero of $zeta_(tilde(K))$. Hence
  #[#set math.equation(numbering: n => "(3.4)")
   $ zeta_K \( s \) eq.not 0 #h(2em) \( Re s > 1 - eta \, med s eq.not 1 \) . $ <eq:kummer-zero-free>]
  The common global half-plane in the input makes this width uniform in $ell$, without requiring uniform onsets for the auxiliary estimates in its proof. This is the abelian tower argument of [10] Section 9, Equation (9.2), specialized to the base $q$.
  To count completely split primes uniformly as the field varies, we use the prime-ideal calculation from [10] Section 9, Equations (9.5)–(9.9). Fix a nonnegative $phi.alt in C_c^oo \( \( 0 \, oo \) \)$ with $phi.alt gt.eq 1$ on $\[ 1 \, 2 \]$, and put
  $ Phi \( s \) = integral_0^oo phi.alt \( t \) t^(s - 1) thin upright(d) t \, #h(2em) Psi_(K') \( x \) = sum_(frak(p)) sum_(m gt.eq 1) log upright(N) frak(p) thin phi.alt (frac(\( upright(N) frak(p) \)^m, x)) $
  for a number field $K'$. Suppose that $K'$ has degree $n' = r_1 + 2 r_2$, absolute discriminant $D'$, and no zeta zero in $Re s > 1 - eta$. Its nontrivial zeros $rho$ lie in $0 < Re rho < 1$, and in fact $Re rho lt.eq 1 - eta$. The Mellin transform $Phi$ is entire and has arbitrary inverse-power decay in height on fixed vertical strips. Mellin inversion of the logarithmic derivative, followed by a shift from $Re s = 2$ to $Re s = - 1 \/ 2$, gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ Psi_(K') \( x \) = x Phi \( 1 \) - sum_rho x^rho Phi \( rho \) - \( r_1 + r_2 - 1 \) Phi \( 0 \) + O_phi.alt (x^(- 1 \/ 2) \( log D' + n' \)) . $ <eq:smooth-prime-ideal-formula>]
  Here zeros are counted with multiplicity. The term at the origin comes from the zero of $zeta_(K')$ there of order $r_1 + r_2 - 1$; it is absent when that order is zero. There are no other trivial zeros between the two lines. To see the uniformity of the error, the functional equation gives on $Re s = - 1 \/ 2$
  $ lr(|zeta'_(K') / zeta_(K') \( s \)|) lt.double log D' + n' log \( 2 + \| Im s \| \) . $
  Indeed the Euler series at $1 - s$, with real part $3 \/ 2$, is $O \( n' \)$, and the logarithmic derivatives of the archimedean factors contribute $O \( n' log \( 2 + \| Im s \| \) \)$. The rapid decay of $Phi$ gives the error in Equation (3.5). The usual rectangular contours may be taken with horizontal edges away from zeros. The zero count below supplies such edges, and the Hadamard partial-fraction formula bounds the logarithmic derivative polynomially on them for each fixed $K'$. The decay of $Phi$ then makes their integrals vanish; the same zero count makes the zero sum absolutely convergent.
  For the required zero count, let $N_(K') \( H \)$ count nontrivial zeros with $\| Im rho \| lt.eq H$, including multiplicity. The uniform formula of [5] Corollary 1.2, Equation (1.3) is
  $ N_(K') \( H \) = H / pi log (D' (frac(H, 2 pi e))^(n')) + O #scale(x: 120%, y: 120%)[\(] log D' + n' log H + n' #scale(x: 120%, y: 120%)[\)] #h(2em) \( H gt.eq 1 \) . $
  For $\| T \| gt.eq 2$, the unit band is bounded by $N_(K') \( \| T \| + 2 \) - N_(K') \( \| T \| - 1 \)$. The main term changes by $O \( log D' + n' log \( 2 + \| T \| \) \)$ over this interval, and both errors have the same bound. For $\| T \| < 2$, use $N_(K') \( 3 \)$. Thus
  #[#set math.equation(numbering: n => "(3.6)")
   $ \# { rho : T lt.eq Im rho < T + 1 } lt.double log D' + n' log \( 2 + \| T \| \) \, $ <eq:unit-height-zero-count>]
  uniformly in $K'$ and $T$. Using it with the decay of $Phi$ on $0 lt.eq Re s lt.eq 1$ gives, for $x gt.eq 1$,
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_rho \| x^rho Phi \( rho \) \| & lt.double_phi.alt x^(1 - eta) sum_(j in bb(Z)) \( 1 + \| j \| \)^(- 3) #scale(x: 120%, y: 120%)[\(] log D' + n' log \( 2 + \| j \| \) #scale(x: 120%, y: 120%)[\)]\
 & lt.double_phi.alt x^(1 - eta) \( log D' + n' \) . $ <eq:smooth-zero-sum>]
  The origin term in Equation (3.5) is nonpositive, since $Phi \( 0 \) gt.eq 0$. Equations (3.5) and (3.7) thus imply the uniform upper bound
  #[#set math.equation(numbering: n => "(3.8)")
   $ Psi_(K') \( x \) lt.double_phi.alt x + x^(1 - eta) \( log D' + n' \) #h(2em) \( x gt.eq 1 \) . $ <eq:smooth-prime-ideal-upper>]
  In particular, the implied constant depends only on the fixed test function, and not on the field.
  Apply Equation (3.8) to $K' = K$, using Equation (3.4). Every rational prime $p$ splitting completely in $K$ supplies $n$ prime ideals of norm $p$. When $x < p < 2 x$, their first-power terms contribute at least $n log p > n L$ to $Psi_K \( x \)$. Equations (3.1) and (3.2) therefore give
  #[#set math.equation(numbering: n => "(3.9)")
   $ & \# { p upright(" prime") : x < p < 2 x \, med p upright(" splits completely in ") K }\
 & #h(2em) lt.double_q frac(x, ell \( ell - 1 \) L) + frac(x^(1 - eta) log \( 2 ell \), L) lt.double_q frac(x, ell \( ell - 1 \) L) + x^(1 - eta) . $ <eq:complete-splitting-bound>]
  The last inequality uses $log ell < L^0.3$ and sufficiently large $x$. By the Frobenius identification above, Equation (3.9) proves the proposition. ◻
]

== 4 A marked family in a fixed progression <sec:marked-family>

We now prepare the weighted family used to prove Proposition 2. Fix an odd squarefree positive integer $M$ and a residue $a med \( mod med M \)$ satisfying

#[#set math.equation(numbering: n => "(4.1)")
 $ gcd \( a \( a - 1 \) \, M \) = 1 . $ <eq:admissible-progression>]

The case $M = 1$ means the trivial progression. Throughout this section, $x$ is real and tends to infinity, and

#[#set math.equation(numbering: n => "(4.2)")
 $ L = log x \, #h(2em) W = exp \( L^0.24 \) \, #h(2em) V \( y \) = product_(p lt.eq y) (1 - 1 / p) quad \( y gt.eq 1 \) . $ <eq:marked-parameters>]

Products indexed by $p$ are over primes. Write $P^(-) \( h \)$ for the least prime factor of $h > 1$, and put $P^(-) \( 1 \) = oo$. An integer with $P^(-) \( h \) > W$ is called $W$-rough. Every parameter below, apart from an explicitly displayed dependence on $x$, is fixed before $x$ grows.

For an integer $K gt.eq 1$ and fixed exponents $0.1 < a_1 < dots.h.c < a_K < 0.2$, define the prime groups

#[#set math.equation(numbering: n => "(4.3)")
 $ cal(P)_i = { p upright(" prime") : exp \( L^(a_i) \) lt.eq p lt.eq exp \( 2 L^(a_i) \) } \, #h(2em) V_i = sum_(p in cal(P)_i) 1 / p . $ <eq:marked-groups>]

These groups are disjoint for sufficiently large $x$, and Mertens’ theorem gives $V_i = log 2 + o \( 1 \)$. We shall choose the sieve parameters first, then a sufficiently large $K$, and then any admissible fixed exponents $a_i$. Thresholds for $x$ may depend on all these choices.

For a positive integer $h$, let

#[#set math.equation(numbering: n => "(4.4)")
 $ h_(cal(P)) = product_(p in union.big_i cal(P)_i) p^(v_p \( h \)) \, #h(2em) omega_i \( h \) = sum_(p in cal(P)_i) upright(bold(1))_(p divides h) . $ <eq:complete-group-part>]

Thus $h_(cal(P))$ includes every power of every group prime dividing $h$. Let $cal(G)$ be the set of positive integers supported on the group primes, including $1$; we call these the group integers. The marks of [10] Section 10, with mark parameter $1 \/ 2$, are

#[#set math.equation(numbering: n => "(4.5)")
 $ cal(W) \( h \) = 2^(K - sum_i omega_i \( h \)) product_(i = 1)^K frac(omega_i \( h \), V_i) . $ <eq:marked-weight>]

They vanish unless every group supplies a prime divisor. Since $j 2^(1 - j) lt.eq 1$ for every integer $j gt.eq 1$, for sufficiently large $x$ we have

#[#set math.equation(numbering: n => "(4.6)")
 $ 0 lt.eq cal(W) \( h \) lt.eq B_K \, #h(2em) B_K = (frac(2, log 2))^K \, quad h gt.eq 1 . $ <eq:mark-bound>]

The constant $B_K$ does not depend on the exponents; the threshold may. A function $F$ on the positive integers satisfies $F \( p h \) = F \( h \)$ for every group prime $p$ and every $h gt.eq 1$ if and only if it depends only on $h \/ h_(cal(P))$. This equivalence includes the case $p divides h$, so the invariance removes all powers of a group prime. In the application, $F$ will select $h \/ h_(cal(P)) = 4 Q$ with $Q > x^0.9$ prime, so the complete group part supplies the factor $r$ in $d - 1 = 4 r Q$.

The rough-factor density used below is, for $w > gamma > 0$,

#[#set math.equation(numbering: n => "(4.7)")
 $ D_gamma \( w \) = 1 / w + sum_(j gt.eq 2) frac(1, j !) integral_(t_i gt.eq gamma med \( 1 lt.eq i < j \)\
sum_(i < j) t_i lt.eq w - gamma) frac(1, w - sum_(i < j) t_i) product_(i < j) frac(thin upright(d) t_i, t_i) . $ <eq:rough-density>]

This is the normalization in [10] Section 10. Its $j$-th term is zero unless $w gt.eq j gamma$, so the sum is locally finite. It is nonnegative and jointly continuous on $w > gamma > 0$. For completeness, in a term with $j gt.eq 2$ put $s = w - j gamma$. When $s gt.eq 0$, the substitution $t_i = gamma + s y_i$ writes that term as

$ frac(s^(j - 1), j !) integral_(y_i gt.eq 0\
sum_(i < j) y_i lt.eq 1) frac(product_(i < j) thin upright(d) y_i, product_(i < j) \( gamma + s y_i \) #scale(x: 120%, y: 120%)[\(] gamma + s \( 1 - sum_(i < j) y_i \) #scale(x: 120%, y: 120%)[\)]) . $

On any compact subset of $w > gamma > 0$ the denominators stay bounded away from zero. Extending this expression by zero for $s < 0$ proves continuity also at $w = j gamma$. Local finiteness completes the claim.

All Dirichlet characters in the following input, including principal characters, are extended by zero on nonunits. All frequencies are real. Part (i) of the next input transfers scalar character cancellation to the marked bilinear sum. Part (ii) supplies that cancellation for the difference of the two roughness tests, with $D_gamma \( log m \/ L \) \/ \( L V \( W \) \)$ as the comparison factor. These are the coefficient criterion of [10] Lemma 10.2, specialized to the marks above, and the cancellation verified in the proof of [10] Proposition 10.3.

#prodef([Input 4.1.])[
  (Marked Type II estimate).  #emph[(i) Coefficient criterion.] Fix $delta \, C \, D_(*) > 0$. Suppose $H_m \, H_n gt.eq x^delta$ and $X = H_m H_n asymp x$, with fixed comparison constants. Let $F : bb(Z)_(> 0) arrow.r bb(C)$ satisfy $\| F \( h \) \| lt.eq 1$ and $F \( p h \) = F \( h \)$ for every group prime $p$ and every $h gt.eq 1$. Let $\( alpha_m \)$ and $\( beta_n \)$ be scalar sequences supported on $W$-rough integers in $\[ H_m \, 2 H_m \]$ and $\[ H_n \, 2 H_n \]$, respectively, with $alpha$ supported on an arbitrary interval $I subset.eq \[ H_m \, 2 H_m \]$, and with $\| alpha_m \| \, \| beta_n \| lt.eq L^C$. Suppose that for every fixed $A_0 \, B \, A > 0$, every Dirichlet character $chi$ modulo $k lt.eq L^(A_0)$, and every $\| t \| lt.eq 2 X L^B$,
  #[#set math.equation(numbering: n => "(4.8)")
   $ lr(|1 / H_m sum_m alpha_m chi \( m \) m^(i t)|) lt.double_A L^(- A) \, $ <eq:marked-cancellation>]
  uniformly in the permitted interval, character, and frequency. The constant and threshold in this hypothesis may depend on $A_0 \, B \, A$, the fixed setup, and all further fixed parameters defining the coefficients. Then
  #[#set math.equation(numbering: n => "(4.9)")
   $ lr(|sum_(m \, n) alpha_m beta_n F \( m n - 1 \) cal(W) \( m n - 1 \)|) lt.double X L^(- D_(*)) $ <eq:marked-input-bound>]
  when $K$ is sufficiently large in terms of the fixed data, independently of the particular $a_i$. Its implicit constant and threshold may depend on all fixed data, including the common constants and thresholds in (4.8) and the $a_i$. With those data fixed, the bound is uniform over the permitted $F$, dyads, intervals, and coefficients.
  #emph[(ii) Rough coefficient cancellation.] Retain the marked data and the hypotheses on $F \, beta \, H_m \, H_n$, without assuming a previously chosen $alpha$. Fix $0 < gamma < w_(-) < w_(+) < 1$, and assume
  #[#set math.equation(numbering: n => "(4.10)")
   $ \[ log H_m \/ L \, log \( 2 H_m \) \/ L \] subset.eq \[ w_(-) \, w_(+) \] . $ <eq:rough-dyad-range>]
  For every interval $I subset.eq \[ H_m \, 2 H_m \]$ and every $\| v \| lt.eq L^C$, the coefficient
  #[#set math.equation(numbering: n => "(4.11)")
   $ alpha_m^(\( 0 \)) = m^(i v) (upright(bold(1))_(P^(-) \( m \) > x^gamma) - frac(D_gamma \( log m \/ L \), L V \( W \)) upright(bold(1))_(P^(-) \( m \) > W)) quad \( m in I \) \, $ <eq:untwisted-rough-coefficient>]
  set equal to zero outside $I$, satisfies (4.8) with $alpha^(\( 0 \))$ in place of $alpha$, for every fixed $A_0 \, B \, A > 0$. This assertion is uniform in the permitted dyads, interval, character, frequency $t$, and $v$. Its constant and threshold may depend on the fixed parameters, including $gamma \, w_(-) \, w_(+)$; in particular $gamma$ and $w_(-) - gamma$ are fixed before $x$ grows.
] <input:marked>

Input 5(i) permits $F$ to vary with $x$, since the estimate is uniform over all functions satisfying its two displayed conditions. The next lemma inserts the fixed progression into the coefficient.

#thm([Lemma 4.2.])[
  (A rough Type II estimate in a fixed progression).  #emph[Fix $delta \, C \, D_(*) > 0$ and $0 < gamma < w_(-) < w_(+) < 1$. Let $F \, H_m \, H_n \, X$ satisfy the hypotheses of Input 5, including (4.10). Let $chi_0$ be any Dirichlet character modulo the fixed $M$. On an arbitrary interval $I subset.eq \[ H_m \, 2 H_m \]$, put 
#[#set math.equation(numbering: n => "(4.12)")
 $ alpha_m = chi_0 \( m \) m^(i v) (upright(bold(1))_(P^(-) \( m \) > x^gamma) - frac(D_gamma \( log m \/ L \), L V \( W \)) upright(bold(1))_(P^(-) \( m \) > W)) \, #h(2em) \| v \| lt.eq L^C \, $ <eq:twisted-rough-coefficient>]

 and set $alpha_m = 0$ outside $I$. Let $beta$ be supported on $W$-rough integers in $\[ H_n \, 2 H_n \]$, with $\| beta_n \| lt.eq L^C$. Then 
#[#set math.equation(numbering: n => "(4.13)")
 $ lr(|sum_(m \, n) alpha_m beta_n F \( m n - 1 \) cal(W) \( m n - 1 \)|) lt.double X L^(- D_(*)) $ <eq:twisted-rough-type-ii>]

 when $K$ is sufficiently large in terms of the fixed data, independently of the particular $a_i$. The estimate is uniform in the permitted $F$, dyads, intervals, $beta$, real $v$, and characters $chi_0$. The implicit constant and threshold may depend on all fixed data, including $M$ and the $a_i$.]
] <lem:twisted-rough-type-ii>

#proof[
  Let $alpha^(\( 0 \))$ be the coefficient in (4.11). For a character $chi$ modulo $k lt.eq L^(A_0)$, the product $theta = chi_0 chi$, with the stated zero extensions, is a character modulo $h = "lcm" \( M \, k \)$. Indeed it is a homomorphism on the units modulo $h$, and it vanishes exactly on the nonunits modulo $h$. Since $M$ is fixed,
  $ h lt.eq M L^(A_0) lt.eq L^(A_0 + 1) $
  for sufficiently large $x$. Input 5(ii), applied with exponent $A_0 + 1$, therefore gives
  $ lr(|1 / H_m sum_m alpha_m chi \( m \) m^(i t)|) = lr(|1 / H_m sum_m alpha_m^(\( 0 \)) theta \( m \) m^(i t)|) lt.double_A L^(- A) #h(2em) \( \| t \| lt.eq 2 X L^B \) . $
  This includes imprimitive $theta$ and the case where $theta$ is principal. It is uniform in $chi_0$, since all the product characters belong to the same enlarged modulus range.
  These scalar sums and their permitted test ranges do not depend on $K$ or the $a_i$: $W$ is defined from $x$ alone. Fix their common cancellation bounds using any one admissible auxiliary marked setup in Input 5(ii). The same scalar bounds then apply unchanged when the $K$ and bands used in Input 5(i) are chosen.
  For large $x$, $x^gamma > W$, so both terms of $alpha$ are supported on $W$-rough integers. The density is bounded on $\[ w_(-) \, w_(+) \]$, and Mertens’ theorem gives $L V \( W \) asymp L^0.76$. Hence $alpha$ is bounded, and in particular $\| alpha_m \| lt.eq L^C$ eventually; multiplication by $chi_0$ does not increase its size. All the hypotheses of Input 5(i) now hold, proving the lemma. ◻
]

The product progression will be imposed by the exact orthogonality identity

#[#set math.equation(numbering: n => "(4.14)")
 $ upright(bold(1))_(m n equiv a med \( mod med M \)) = frac(1, phi \( M \)) sum_(chi_0 med mod med M) overline(chi_0 \( a \)) chi_0 \( m \) chi_0 \( n \) . $ <eq:product-progression>]

If either factor is a nonunit modulo $M$, both sides are zero because $a$ is a unit. For $M = 1$, the sum consists of the single trivial character. This identity leaves $F$ with its required invariance.

We now choose the invariant function to encode the desired predecessors. Fix a smooth function $Psi$ compactly supported in $\( 1 \, 2 \)$, with $0 lt.eq Psi lt.eq 1$ and $A_Psi = integral_1^2 Psi \( u \) thin upright(d) u > 0$. From now on take

#[#set math.equation(numbering: n => "(4.15)")
 $ F \( h \) & = upright(bold(1))_({ h \/ h_(cal(P)) = 4 Q upright(" for a prime ") Q > x^0.9 }) \, #h(2em) h gt.eq 1 \,\
w \( d \) & = upright(bold(1))_(d equiv a med \( mod med M \)) Psi \( d \/ x \) F \( d - 1 \) cal(W) \( d - 1 \) \, #h(2em) d gt.eq 2 . $ <eq:marked-family>]

The quotient $h \/ h_(cal(P))$ is unchanged by multiplication by any group prime, even one already dividing $h$, so this $F$ is permitted in Lemma 6. For large $x$, every group prime is coprime to $2 M$ and lies in $\( exp \( L^0.1 \) \, exp \( L^0.3 \) \)$, while every prime $Q > x^0.9$ lies outside the groups. Consequently, if $w \( d \) > 0$, there is a unique representation

#[#set math.equation(numbering: n => "(4.16)")
 $ x < d < 2 x \, #h(2em) d equiv a med \( mod med M \) \, #h(2em) d = 4 r Q + 1 \,\
r = \( d - 1 \)_(cal(P)) in cal(G) \, #h(2em) Q > x^0.9 upright(" prime") . $ <eq:marked-family-support>]

Moreover $cal(W) \( d - 1 \) = cal(W) \( r \)$ and $r < \( 2 x \) \/ \( 4 x^0.9 \) lt.eq x^0.11$. We also have $0 lt.eq w \( d \) lt.eq B_K$.

For $r in cal(G)$, the progression in (4.15) prescribes the reduced class

$ b_r equiv \( a - 1 \) \( 4 r \)^(- 1) med \( mod med M \) $

for $Q$. It is reduced by (4.1); inverses and classes for $M = 1$ have their trivial meaning. Define

#[#set math.equation(numbering: n => "(4.17)")
 $ A_r & = sum_(Q > x^0.9 upright(" prime")\
Q equiv b_r med \( mod med M \)) Psi \( \( 4 r Q + 1 \) \/ x \) \,\
X_0 & = sum_(d gt.eq 2) w \( d \) = sum_(r in cal(G)) cal(W) \( r \) A_r \,\
J_0 & = sum_(r in cal(G)) frac(cal(W) \( r \), r) . $ <eq:marked-mass-definitions>]

The equality for $X_0$ follows from the uniqueness in (4.16). All these sums are nonnegative.

#thm([Lemma 4.3.])[
  (Mass of the marked family).  #emph[For every fixed $theta.alt > 0$, 
#[#set math.equation(numbering: n => "(4.18)")
 $ 1 lt.eq J_0 lt.double_K 1 \, #h(2em) sum_(r in cal(G)\
r > x^theta.alt) frac(cal(W) \( r \), r) lt.double_K exp \( - theta.alt L^(1 - a_K) \) . $ <eq:marked-harmonic-bounds>]

 For $r in cal(G)$ with $r lt.eq x^0.05$, put 
$ I_r = frac(x, 4 r) integral_1^2 frac(Psi \( u \), log \( \( x u - 1 \) \/ \( 4 r \) \)) thin upright(d) u . $

 For every fixed $A > 0$, uniformly in these $r$, 
#[#set math.equation(numbering: n => "(4.19)")
 $ A_r = frac(I_r, phi \( M \)) + O_(M \, Psi \, A) (x / r L^(- A)) \, #h(2em) I_r asymp_Psi frac(x, r L) . $ <eq:progression-pnt>]

 Furthermore, 
#[#set math.equation(numbering: n => "(4.20)")
 $ X_0 asymp_(M \, Psi) frac(x J_0, L) . $ <eq:marked-mass-comparability>]

 The comparison constants here can be chosen independently of $K$ and the $a_i$; the threshold for $x$ may depend on them. For every fixed $theta.alt \, A > 0$, 
#[#set math.equation(numbering: n => "(4.21)")
 $ sum_(r in cal(G)\
r > x^theta.alt) cal(W) \( r \) A_r = o \( X_0 L^(- A) \) . $ <eq:marked-tail>]

]
] <lem:marked-mass>

#proof[
  Put $s = L^(- a_K)$. Every group prime satisfies $p^s lt.eq e^2$, and for large $x$, $p^(s - 1) lt.eq e^2 \/ p lt.eq 1 \/ 2$. The bound (4.6) and an Euler product including all prime powers give
  $ sum_(r in cal(G)) cal(W) \( r \) r^(s - 1) lt.eq B_K product_(p in union.big_i cal(P)_i) \( 1 - p^(s - 1) \)^(- 1) lt.eq B_K exp (2 e^2 sum_i V_i) lt.double_K 1 . $
  This bounds $J_0$ above. Restricting $J_0$ to $r = p_1 dots.h.c p_K$, with one prime $p_i in cal(P)_i$ to exponent one, contributes exactly
  $ product_(i = 1)^K (1 / V_i sum_(p_i in cal(P)_i) 1 / p_i) = 1 . $
  The disjoint groups make these products distinct. Finally, Rankin’s inequality gives
  $ sum_(r in cal(G)\
r > x^theta.alt) frac(cal(W) \( r \), r) lt.eq x^(- theta.alt s) sum_(r in cal(G)) cal(W) \( r \) r^(s - 1) lt.double_K exp \( - theta.alt L^(1 - a_K) \) \, $
  proving (4.18).
  If $r lt.eq x^0.05$ and $1 lt.eq u lt.eq 2$, then, for large $x$,
  $ x^0.95 / 8 lt.eq frac(x u - 1, 4 r) lt.eq x / 2 \, #h(2em) 0.9 L lt.eq log (frac(x u - 1, 4 r)) lt.eq L . $
  In particular the cutoff $Q > x^0.9$ is automatic on the smooth support. The prime number theorem for the fixed modulus $M$, uniformly over its reduced classes and with arbitrary fixed logarithmic accuracy, applied to $t mapsto Psi \( \( 4 r t + 1 \) \/ x \)$, proves the first assertion of (4.19) by partial summation. Indeed this test is supported on $t asymp x \/ r$, whose logarithm is comparable to $L$, and its total variation is $integral \| Psi' \( u \) \| thin upright(d) u$, independently of $r$. The continuous prime main term is exactly $I_r \/ phi \( M \)$ after the substitution $u = \( 4 r t + 1 \) \/ x$. The displayed logarithmic bounds and $A_Psi > 0$ give the comparison for $I_r$, with constants independent of $K$.
  Write $J_R = sum_(r in cal(G) \, med r lt.eq x^0.05) cal(W) \( r \) \/ r$. Taking $A = 3$ in (4.19) and summing with the marks shows that $sum_(r lt.eq x^0.05) cal(W) \( r \) A_r$ is bounded above and below by positive constants depending only on $M \, Psi$ times $x J_R \/ L$, once $x$ is sufficiently large. The summed error is $O_(M \, Psi) \( x J_R L^(- 3) \)$. For every $r$, the smooth support forces $Q < x \/ \( 2 r \)$, so counting all positive integers instead of primes gives $0 lt.eq A_r lt.eq x \/ \( 2 r \)$. Equation (4.18) therefore gives
  $ J_0 - J_R lt.double_K e^(- 0.05 L^(1 - a_K)) \, #h(2em) sum_(r in cal(G)\
r > x^0.05) cal(W) \( r \) A_r lt.double_K x e^(- 0.05 L^(1 - a_K)) . $
  Since $J_0 gt.eq 1$, after a threshold depending on $K \, a_i$ we have $J_R gt.eq J_0 \/ 2$, and the last sum is at most $x J_0 \/ L$. Combining these bounds proves (4.20) with comparison constants depending only on $M \, Psi$. For general fixed $theta.alt > 0$, the same bound for $A_r$ gives a tail $O_K \( x e^(- theta.alt L^(1 - a_K)) \)$. Divide by $X_0 L^(- A) gt.double_(M \, Psi) x J_0 L^(- A - 1)$ and use $J_0 gt.eq 1$. Since $L^(1 - a_K)$ dominates every fixed multiple of $log L$, the quotient tends to zero. This proves (4.21). ◻
]

Fix $0 < kappa < 0.01$ and $0 < epsilon.alt < kappa$, still before letting $x$ grow. Lemma 7 gives $X_0 asymp x J_0 \/ L$ for the total weight, with $J_0$ the harmonic sum that combines the estimates for fixed $r$. We now bound the summed divisibility remainders for $r lt.eq x^epsilon.alt$; Equation (4.21) controls the omitted tail. For odd squarefree $ell$ coprime to $M$, define

#[#set math.equation(numbering: n => "(4.22)")
 $ D_0 & = x^(1 \/ 2 - kappa \/ 2) \,\
A_r \( ell \) & = sum_(Q > x^0.9 upright(" prime")\
Q equiv b_r med \( mod med M \)\
ell divides 4 r Q + 1) Psi \( \( 4 r Q + 1 \) \/ x \) \,\
g_r \( ell \) & = frac(upright(bold(1))_(gcd \( ell \, r \) = 1), phi \( ell \)) \, #h(2em) R_r \( ell \) = A_r \( ell \) - g_r \( ell \) A_r . $ <eq:distribution-data>]

On these squarefree integers $g_r$ is multiplicative, and $A_r \( 1 \) = A_r$, $g_r \( 1 \) = 1$, $R_r \( 1 \) = 0$. If $gcd \( ell \, r \) > 1$, both terms in $R_r \( ell \)$ vanish. Otherwise the new condition prescribes the reduced class $Q equiv - \( 4 r \)^(- 1) med \( mod med ell \)$. Together with $Q equiv b_r med \( mod med M \)$, it gives one reduced class modulo $M ell$.

#thm([Lemma 4.4.])[
  (Average distribution in the sieve moduli).  #emph[For every fixed $A > 0$, 
#[#set math.equation(numbering: n => "(4.23)")
 $ sum_(r in cal(G)\
r lt.eq x^epsilon.alt) cal(W) \( r \) sum_(ell lt.eq D_0 upright(" odd and squarefree")\
gcd \( ell \, M \) = 1) \| R_r \( ell \) \| lt.double x J_0 L^(- A) . $ <eq:averaged-distribution>]

 The constant and threshold may depend on the fixed parameters.]
] <lem:averaged-distribution>

#proof[
  Fix $r lt.eq x^epsilon.alt$. Since $epsilon.alt < 0.01 < 0.05$, the cutoff in $A_r \( ell \)$ is automatic on its smooth support, as in (4.19). Put $delta_0 = \( kappa - epsilon.alt \) \/ 4 > 0$. For every $t asymp x \/ r$ on that support, all the distinct moduli $M ell$, $ell lt.eq D_0$, satisfy
  $ M ell lt.eq t^(1 \/ 2 - delta_0) $
  for sufficiently large $x$. In fact, the exponent margin at the smallest possible scale is
  $ \( 1 - epsilon.alt \) \( 1 \/ 2 - delta_0 \) - \( 1 \/ 2 - kappa \/ 2 \) = frac(\( kappa - epsilon.alt \) \( 1 + epsilon.alt \), 4) > 0 \, $
  which absorbs the fixed factor $M$ and the comparison constants.
  The Bombieri–Vinogradov theorem [2,12], restricted to this fixed-power sublevel, gives for every fixed $A' > 0$ an $O \( t \( log t \)^(- A') \)$ sum of absolute errors in prime counts up to $t$, using the maximum over reduced classes and main term $"Li" \( t \) \/ phi \( M ell \)$. This follows from its usual level $t^(1 \/ 2) \( log t \)^(- B)$, since $delta_0$ is fixed and positive. Integrate those errors against the derivative of $Psi \( \( 4 r t + 1 \) \/ x \)$. Its total absolute integral is bounded in terms of $Psi$, and $t asymp x \/ r$, $log t asymp L$ throughout. The triangle inequality under the integral thus gives
  $ sum_(ell lt.eq D_0 upright(" odd and squarefree")\
gcd \( ell \, M \) = 1) lr(|A_r \( ell \) - g_r \( ell \) frac(I_r, phi \( M \))|) lt.double x / r L^(- A') . $
  For $gcd \( ell \, r \) = 1$, the main term uses $phi \( M ell \) = phi \( M \) phi \( ell \)$; the other terms are zero. The maximum over reduced classes in the theorem makes the bound uniform in the class depending on $r \, ell$.
  To replace $I_r \/ phi \( M \)$ by $A_r$, observe that
  $ sum_(ell lt.eq D_0\
ell upright(" squarefree")) frac(1, phi \( ell \)) lt.eq product_(p lt.eq D_0) (1 + frac(1, p - 1)) = V \( D_0 \)^(- 1) lt.double L . $
  Equation (4.19), with its logarithmic accuracy increased by two, absorbs this factor. Taking $A'$ sufficiently large therefore proves $sum_ell \| R_r \( ell \) \| lt.double \( x \/ r \) L^(- A)$, uniformly in the present $r$. Multiplying by $cal(W) \( r \)$, summing, and using $sum_(r lt.eq x^epsilon.alt) cal(W) \( r \) \/ r lt.eq J_0$ proves the lemma. ◻
]

The sieve products for this progression are

#[#set math.equation(numbering: n => "(4.24)")
 $ V_M \( y \) & = product_(2 < p lt.eq y\
p divides.not M) (1 - frac(1, p - 1)) \,\
frak(S)_M & = 2 product_(p > 2) (1 - frac(1, \( p - 1 \)^2)) product_(p divides M) (1 - frac(1, p - 1))^(- 1) > 0 . $ <eq:progression-sieve-products>]

The infinite product is positive because its factors are positive and their deviations from one have a convergent sum. At every odd prime,

$ frac(1 - 1 \/ \( p - 1 \), 1 - 1 \/ p) = 1 - frac(1, \( p - 1 \)^2) . $

The factor at $2$ and the omitted factors at primes dividing $M$ therefore give, with Mertens’ theorem,

#[#set math.equation(numbering: n => "(4.25)")
 $ frac(V_M \( y \), V \( y \)) arrow.r frak(S)_M \, #h(2em) V \( y \) tilde.op frac(e^(- gamma_E), log y) quad \( y arrow.r oo \) \, $ <eq:progression-product-asymptotic>]

where $gamma_E$ is Euler’s constant.

Finally, for every $r in cal(G)$ with $r lt.eq x^0.11$, its distinct prime divisors exceed $exp \( L^0.1 \)$. Their number is at most $0.11 L^0.9$, and hence

#[#set math.equation(numbering: n => "(4.26)")
 $ sum_(p divides r) 1 / p lt.eq 0.11 L^0.9 e^(- L^0.1) = o \( 1 \) . $ <eq:group-reciprocal-divisors>]

For these primes, $log \( 1 - 1 \/ \( p - 1 \) \)^(- 1) lt.double 1 \/ p$ with an absolute constant. It follows uniformly for all such $r$ and all $y gt.eq 1$ that

#[#set math.equation(numbering: n => "(4.27)")
 $ product_(2 < p lt.eq y\
p divides.not M) \( 1 - g_r \( p \) \) & = product_(2 < p lt.eq y\
p divides.not M r) (1 - frac(1, p - 1))\
 & = V_M \( y \) (1 + O #scale(x: 120%, y: 120%)[\(] L^0.9 e^(- L^0.1) #scale(x: 120%, y: 120%)[\)]) = V_M \( y \) \( 1 + o \( 1 \) \) . $ <eq:missing-group-factors>]

The constant in this error can be absolute; only the threshold uses the fixed group exponents.

== 5 Extracting primes from the marked family <sec:prime-reservoir>

We retain the notation and weighted family of Section 4. In particular, a supported integer has the unique form $d = 4 r Q + 1$, where $r$ is a group integer with $r lt.eq x^0.11$ and $Q > x^0.9$ is prime, and it lies in the reduced class $a$ modulo $M$. By Lemma 7 and $w \( d \) lt.eq B_K$, it is enough to prove that the prime weight is $gt.double X_0 \/ L$. The two sieve inputs needed below are recorded explicitly.

#prodef([Input 5.1.])[
  (Block sieve).  Let $z > 1$, let $cal(A)$ be a finite set with nonnegative weights $lambda_nu$ for $nu in cal(A)$, and let $cal(D)$ be a set of designated primes at most $z$. For each $p in cal(D)$ let $cal(A)_p subset.eq cal(A)$ be its bad condition. For a squarefree product $ell$ of primes in $cal(D)$, put $cal(A)_ell = ⋂_(p divides ell) cal(A)_p$, with $cal(A)_1 = cal(A)$. Suppose that, including for $ell = 1$,
  $ sum_(nu in cal(A)_ell) lambda_nu = Y g \( ell \) + R \( ell \) \, #h(2em) Y gt.eq 0 \, $
  where $g$ is multiplicative on these squarefree products and $g \( 1 \) = 1$. Extend $g \( p \)$ by zero at primes outside $cal(D)$. Suppose that for fixed constants $eta_0 > 0$ and $C_0 < oo$,
  $ 0 lt.eq g \( p \) lt.eq 1 - eta_0 \, #h(2em) sum_(u < p lt.eq u^2) g \( p \) lt.eq C_0 quad \( u > 1 \) . $
  Write
  $ S = sum_(nu in cal(A) \\ union.big_(p in cal(D)) cal(A)_p) lambda_nu . $
  For every sufficiently large even integer $H$, the weight avoiding all the bad conditions is
  #[#set math.equation(numbering: n => "(5.1)")
   $ S =  & Y product_(p lt.eq z) \( 1 - g \( p \) \) #scale(x: 120%, y: 120%)[\(] 1 + O_(eta_0 \, C_0) \( e^(- H) \) #scale(x: 120%, y: 120%)[\)]\
 & + O_(eta_0 \, C_0) (sum_(ell lt.eq z^(4 H + 2)\
ell med upright("squarefree")\
p divides ell arrow.r.double p in cal(D)) \| R \( ell \) \|) . $ <eq:block-sieve>]
  The threshold for $H$ and the implied constants depend only on $eta_0 \, C_0$. In particular, the constants are uniform when $H$ grows, and the remainder sum has no additional coefficient or multiplicity factor. For $H = 2$ there is the upper bound
  #[#set math.equation(numbering: n => "(5.2)")
   $ S lt.double_(eta_0 \, C_0) Y product_(p lt.eq z) \( 1 - g \( p \) \) + sum_(ell lt.eq z^10\
ell med upright("squarefree")\
p divides ell arrow.r.double p in cal(D)) \| R \( ell \) \| . $ <eq:block-sieve-upper>]
  Both remainder sums include only squarefree products of the designated primes, with $ell = 1$ included. This is the form stated in [10] Lemma 11.1, Equations (11.2)–(11.3).
] <input:block>

#prodef([Input 5.2.])[
  (Rough-number density).  For the density $D_gamma \( w \)$ defined in Section 4, there are absolute constants $b_d \, c_d \, C_d > 0$ such that, for every fixed $0 < b < min \( b_d \, 1 \/ 2 \)$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ integral_b^(1 \/ 2) D_t \( 1 - t \) frac(thin upright(d) t, t) = D_b \( 1 \) - 1 \, #h(2em) D_b \( 1 \) lt.eq e^(- gamma_E) / b #scale(x: 120%, y: 120%)[\(] 1 + C_d e^(- c_d \/ b) #scale(x: 120%, y: 120%)[\)] . $ <eq:density-integral-bound>]
  Here $gamma_E$ is Euler’s constant, and the value of the integrand at $t = 1 \/ 2$ is immaterial. These are the assertions of [10] Lemma 11.2, Equations (11.6)–(11.7).
] <input:density>

The identity in (5.3) describes removal of the least factor. In the $j$-factor summand of $D_b \( 1 \)$, $j gt.eq 2$, the measure on $t_1 + dots.h.c + t_j = 1$, $t_i gt.eq b$, is $frac(1, j !) \( t_1 dots.h.c t_j \)^(- 1) thin upright(d) t_1 dots.h.c thin upright(d) t_(j - 1)$. It is invariant under permutation of the coordinates. Its minimum $t$ is unique outside a null set and is at most $1 \/ 2$. Choosing this coordinate in $j$ ways leaves $thin upright(d) t \/ t$ times the $\( j - 1 \)$-factor summand of $D_t \( 1 - t \)$, since $j \/ j ! = 1 \/ \( j - 1 \) !$. The omitted one-factor summand of $D_b \( 1 \)$ is $1$.

Measured in units of $frak(S)_M X_0 \/ L$, the initial sieve below has main coefficient $e^(- gamma_E) \/ b$, while the bins for the least prime factor cost at most $D_b \( 1 \) - 1$ apart from the partition and approximation errors. The density bound and the exponentially small loss in the initial sieve leave a positive constant for small fixed $b$; a separate sieve controls the remaining balanced semiprimes.

=== 5.1 The initial rough counts <the-initial-rough-counts>

For now take any fixed $0 < epsilon.alt < kappa < 0.01$ as in Section 4, and introduce a sufficiently small fixed $0 < b < 0.01$. The choices of these parameters and of $K$ will be made in their required order at the end. Every estimate below is for $x$ tending to infinity after its displayed parameters have been fixed. Write

$ Pi_r \( y \) = product_(2 < p lt.eq y\
p divides.not M r) (1 - frac(1, p - 1)) . $

By (4.27), $Pi_r \( y \) = V_M \( y \) \( 1 + o \( 1 \) \)$ uniformly in $y$ and in all supported $r lt.eq x^0.11$. A supported $d$ is odd and is coprime to $M$. Consequently, for supported $d$, the condition $P^(-) \( d \) > z$ is equivalent to excluding divisibility by the odd primes $p lt.eq z$ with $p divides.not M$.

Fix a group integer $r lt.eq x^epsilon.alt$. Apply Input 9 to the primes $Q$ and their weights in $A_r$, with the bad condition $p divides 4 r Q + 1$ at each odd $p lt.eq x^b$ not dividing $M$. The intersection counts are $A_r g_r \( ell \) + R_r \( ell \)$ by (4.22). Compact support of $Psi$ makes this a finite weighted family after removing zero weights. The densities on designated primes obey

$ 0 lt.eq g_r \( p \) lt.eq frac(1, p - 1) lt.eq 1 / 2 . $

Their sums on $\( u \, u^2 \]$ have an absolute bound, since $1 \/ \( p - 1 \) lt.eq 2 \/ p$ for odd $p$ and the prime harmonic sums on these intervals are bounded. Thus the local constants of the block sieve are absolute, independently of $M \, r \, K$.

Use the even depth

$ H_b = 2 ⌊frac(1, 40 b)⌋ . $

For sufficiently small $b$ it is an admissible depth in Input 9, and

#[#set math.equation(numbering: n => "(5.4)")
 $ H_b gt.eq frac(1, 20 b) - 2 \, #h(2em) b \( 4 H_b + 2 \) lt.eq 1 / 5 + 2 b < 0.22 < 1 / 2 - kappa / 2 . $ <eq:initial-sieve-level>]

In particular, every remainder modulus is at most $x^(b \( 4 H_b + 2 \)) lt.eq D_0$. Sum the resulting lower bound with the nonnegative marks $cal(W) \( r \)$. By (4.23) the sum of the remainders is $O \( x J_0 L^(- A) \)$ for any fixed $A$; taking $A > 2$ makes it $o \( X_0 \/ L \)$ by (4.20). The tail with $r > x^epsilon.alt$ is negligible to this accuracy by (4.21). The uniform formula for $Pi_r \( x^b \)$ and (4.25) give

$ Pi_r \( x^b \) tilde.op V_M \( x^b \) tilde.op frac(frak(S)_M e^(- gamma_E), b L) . $

Finally, (5.4) gives $e^(- H_b) lt.eq e^2 e^(- 1 \/ \( 20 b \))$. We have proved

#[#set math.equation(numbering: n => "(5.5)")
 $ sum_(d gt.eq 2\
P^(-) \( d \) > x^b) w \( d \) gt.eq frac(frak(S)_M X_0, L) {e^(- gamma_E) / b #scale(x: 120%, y: 120%)[\(] 1 - C_s e^(- c_s \/ b) #scale(x: 120%, y: 120%)[\)] + o \( 1 \)} \, $ <eq:initial-rough-mass>]

where $C_s \, c_s > 0$ are absolute; for example, $c_s = 1 \/ 20$ is permitted after enlarging $C_s$. The implied threshold may depend on all fixed parameters.

For fixed $b lt.eq gamma < gamma' lt.eq 1 \/ 2 - kappa$, let

$ cal(N)_(gamma \, gamma') = { n upright(" prime") : x^gamma < n lt.eq x^(gamma') } . $

To bound the $W$-rough term in the Type II replacement for $d = m n$, we use the following count conditioned on $n divides d$:

#[#set math.equation(numbering: n => "(5.6)")
 $ sum_(n in cal(N)_(gamma \, gamma')) med sum_(d gt.eq 2\
n divides d\
P^(-) \( d \) > W) w \( d \) = X_0 V_M \( W \) {log gamma' / gamma + o \( 1 \)} . $ <eq:conditioned-bin-count>]

For large $x$, every such $n$ exceeds $W$, every prime dividing $M$, and every group prime. Indeed $x^b$ eventually exceeds each of these quantities. In particular, $n divides.not r$ for every group integer $r$. At fixed $r lt.eq x^epsilon.alt$, condition the family of $A_r$ on $n divides 4 r Q + 1$ and designate the odd primes $p lt.eq W$ not dividing $M$. For a squarefree product $ell$ of these primes, including $ell = 1$,

#[#set math.equation(numbering: n => "(5.7)")
 $ A_r \( n ell \) = frac(A_r, n - 1) g_r \( ell \) + R_r \( n ell \) . $ <eq:conditioned-intersections>]

This follows from $n divides.not M r ell$ and multiplicativity of $g_r$. Thus the block sieve applies with $Y = A_r \/ \( n - 1 \)$, the same local densities, and remainder $R_r \( n ell \)$. Its remainder at $ell = 1$ is $R_r \( n \)$, which is explicitly allowed by Input 9.

Take $H_W = 2 ceil.l \( log L \)^2 ceil.r$. It is an admissible growing even depth, its relative error tends to zero, and

$ W^(4 H_W + 2) = exp #scale(x: 120%, y: 120%)[\(] O \( L^0.24 \( log L \)^2 \) #scale(x: 120%, y: 120%)[\)] = x^(o \( 1 \)) . $

Every remainder modulus in (5.7) therefore satisfies

$ n ell lt.eq x^(1 \/ 2 - kappa + o \( 1 \)) < x^(1 \/ 2 - kappa \/ 2) = D_0 $

for sufficiently large $x$. These moduli are odd squarefree and coprime to $M$. Moreover the map $\( n \, ell \) mapsto n ell$ is injective throughout the sum: $n$ is the unique prime factor of this product exceeding $W$. Hence the unweighted remainder sums of the block sieve, summed over $n$ and then with the marks over $r$, form a subsum of (4.23), without any multiplicity or depth factor. Taking its accuracy $A > 2$ makes this $o \( X_0 V_M \( W \) \)$, because $X_0 V_M \( W \) asymp_(M \, Psi) x J_0 L^(- 1.24)$.

The main sieve product is $Pi_r \( W \) = V_M \( W \) \( 1 + o \( 1 \) \)$ uniformly. Also the prime harmonic estimate gives

$ sum_(n in cal(N)_(gamma \, gamma')) frac(1, n - 1) = log gamma' / gamma + o \( 1 \) . $

Here replacing $1 \/ n$ by $1 \/ \( n - 1 \)$ costs $o \( 1 \)$, and Mertens’ theorem evaluates the sum of $1 \/ n$. These facts give the main term in (5.6) for $r lt.eq x^epsilon.alt$. For the omitted tail, a supported $d < 2 x$ has at most $log \( 2 x \) \/ \( b L \) = O_b \( 1 \)$ distinct prime divisors above $x^b$. Multiplying the tail bound (4.21) by this fixed factor still gives $o \( X_0 V_M \( W \) \)$. This proves (5.6).

=== 5.2 Removing the least prime factor <removing-the-least-prime-factor>

If the least prime factor of a supported composite $d$ belongs to the bin $\( x^gamma \, x^(gamma') \]$, write it as $n$ and put $m = d \/ n$. Then $P^(-) \( m \) gt.eq n > x^gamma$, also when $n^2 divides d$. The weight of these composites is consequently at most

$ T_(gamma \, gamma') = sum_(n in cal(N)_(gamma \, gamma')) med sum_(m gt.eq 1\
P^(-) \( m \) > x^gamma) w \( m n \) . $

Lemma 6 gives the replacement

#[#set math.equation(numbering: n => "(5.8)")
 $ T_(gamma \, gamma') = sum_(n in cal(N)_(gamma \, gamma')) med sum_(m gt.eq 1\
P^(-) \( m \) > W\
x < m n < 2 x) frac(D_gamma \( log m \/ L \), L V \( W \)) w \( m n \) + o \( X_0 \/ L \) . $ <eq:rough-replacement>]

We check the geometry, support, and total error in this application.

Partition each factor into disjoint half-open dyads $\[ H_m \, 2 H_m \)$ and $\[ H_n \, 2 H_n \)$, restricting $n$ to its bin. Retain every rectangle containing a real point with $m n \/ x in "supp" Psi$ and $x^gamma < n lt.eq x^(gamma')$. In such a rectangle $x \/ 4 < H_m H_n < 2 x$. There are $O \( L \)$ rectangles: there are $O \( L \)$ possible dyads for $n$, and the displayed product constraint allows only an absolute bounded number of dyads for $m$ for each of them. On the support of $Psi \( m n \/ x \)$, write $t = log n \/ L$. Then

#[#set math.equation(numbering: n => "(5.9)")
 $ frac(log m, L) = 1 - t + O \( L^(- 1) \) \, #h(2em) b lt.eq gamma < t lt.eq gamma' lt.eq 1 / 2 - kappa . $ <eq:bin-exponent-range>]

Passing from a point in this support to the whole $m$-dyad changes its logarithmic exponent by at most $log 2 \/ L$. Therefore, for all large $x$, the full $m$-dyad is in the exponent interval

$ \[ w_(-) \, w_(+) \] = [1 / 2 + kappa / 2 \, thin 1 - b / 2] . $

In particular $0 < gamma < w_(-) < w_(+) < 1$. Both dyad scales exceed $x^(b \/ 2)$ for large $x$: the $n$-scale is at least $x^b \/ 2$, while the $m$-scale is at least $x^(1 \/ 2 + kappa) \/ 2$.

For the separation of the smooth weight, put

$ hat(psi) \( v \) = frac(1, 2 pi) integral_(bb(R)) Psi \( e^s \) e^(- i v s) thin upright(d) s . $

Fourier inversion and smooth compact support give

#[#set math.equation(numbering: n => "(5.10)")
 $ Psi \( m n \/ x \) = integral_(bb(R)) hat(psi) \( v \) x^(- i v) m^(i v) n^(i v) thin upright(d) v \,\
integral_(bb(R)) \| hat(psi) \( v \) \| thin upright(d) v lt.double_Psi 1 \, #h(2em) integral_(\| v \| > L) \| hat(psi) \( v \) \| thin upright(d) v lt.double_(A \, Psi) L^(- A) $ <eq:reservoir-fourier-separation>]

for every fixed $A > 0$. Insert the character expansion (4.14) to separate the progression condition.

In each retained box apply Lemma 6 with

$ delta = b \/ 2 \, #h(2em) C = 2 \, #h(2em) D_(*) = 6 \, $

and with the exponent interval above. For $\| v \| lt.eq L$ its first coefficient is the difference of the two tests in (5.8), multiplied by $chi_0 \( m \) m^(i v)$. The second coefficient is $chi_0 \( n \) n^(i v) upright(bold(1))_(n upright(" prime"))$, restricted to its bin and dyad. It is bounded by one and is supported on $W$-rough integers, since $n > W$. The function $F$ is exactly the invariant function in (4.15). The product condition remains in $Psi$, so neither coefficient has been restricted by a condition on both factors. The lemma applies for sufficiently large $K$ depending on these fixed parameters, independently of the band exponents. Its bound (4.13) is $O \( x L^(- 6) \)$ per box; integration over $\| v \| lt.eq L$ costs only the bounded $L^1$ norm in (5.10).

For $\| v \| > L$, the density is bounded on the fixed exponent interval and $L V \( W \) asymp L^0.76$. Thus the two discrepancy coefficients are bounded for large $x$. The marked weight is bounded by $B_K$ by (4.6), and a box has $O \( H_m H_n \) = O \( x \)$ integer pairs. The last bound in (5.10), with sufficiently large fixed $A$, makes this tail $O_(K \, Psi) \( x L^(- 6) \)$ per box as well. The $O \( L \)$ boxes therefore contribute $O \( x L^(- 5) \) = o \( X_0 \/ L \)$, with the constant allowed to depend on all fixed parameters, using (4.20) and $J_0 gt.eq 1$. This proves (5.8). All occurrences of the density in that equation are in its domain, by (5.9).

By the joint continuity established in Section 4, (5.9) implies, uniformly on the support in (5.8),

$ D_gamma \( log m \/ L \) lt.eq sup_(gamma lt.eq t lt.eq gamma') D_gamma \( 1 - t \) + o \( 1 \) . $

Since $n > W$, the condition $P^(-) \( m \) > W$ is equivalent to $P^(-) \( m n \) > W$. For a fixed divisor $n divides d$ the factor $m = d \/ n$ is unique. We may therefore apply (5.6) after changing variables $d = m n$. Together with $V_M \( W \) \/ V \( W \) arrow.r frak(S)_M$, this gives

#[#set math.equation(numbering: n => "(5.11)")
 $ T_(gamma \, gamma') lt.eq frac(frak(S)_M X_0, L) {(sup_(gamma lt.eq t lt.eq gamma') D_gamma \( 1 - t \)) log gamma' / gamma + o \( 1 \)} . $ <eq:least-factor-bin-upper>]

Choose a finite partition $b = gamma_0 < gamma_1 < dots.h.c < gamma_J = 1 \/ 2 - kappa$. The set of pairs $\( gamma \, 1 - t \)$ with $b lt.eq gamma lt.eq t lt.eq 1 \/ 2 - kappa$ is a compact subset of ${ \( gamma \, w \) : w > gamma > 0 }$, since $1 - t - gamma gt.eq 2 kappa$. Joint continuity of the density is uniform there. For every $t$ in a bin, the bin supremum in (5.12), whose first argument is fixed at the left endpoint, differs from $D_t \( 1 - t \)$ by a quantity tending uniformly to zero with the mesh. The measure $thin upright(d) t \/ t$ has finite total mass $log \( \( 1 \/ 2 - kappa \) \/ b \)$. We may consequently choose a sufficiently fine fixed partition for which

#[#set math.equation(numbering: n => "(5.12)")
 $ sum_(j = 1)^J (sup_(gamma_(j - 1) lt.eq t lt.eq gamma_j) D_(gamma_(j - 1)) \( 1 - t \)) log gamma_j / gamma_(j - 1) & lt.eq integral_b^(1 \/ 2 - kappa) D_t \( 1 - t \) frac(thin upright(d) t, t) + 1 / 8\
 & lt.eq D_b \( 1 \) - 1 + 1 / 8 . $ <eq:least-factor-partition>]

The last inequality uses nonnegativity of $D_t$ and Input 10.

Put

$ U_kappa = sum_(d gt.eq 2\
P^(-) \( d \) > x^(1 \/ 2 - kappa)) w \( d \) . $

Every supported integer counted in (5.5) but not in the sum defining $U_kappa$ is composite: it exceeds $x$, whereas its least prime factor is at most $x^(1 \/ 2 - kappa)$. That factor lies in one of the bins of our partition. Subtracting (5.11) for these finitely many bins from (5.5), and using (5.12) and (5.3), yields

#[#set math.equation(numbering: n => "(5.13)")
 $ frac(L U_kappa, frak(S)_M X_0) gt.eq 1 - 1 / 8 - e^(- gamma_E) / b (C_s e^(- c_s \/ b) + C_d e^(- c_d \/ b)) + o \( 1 \) . $ <eq:post-bin-mass>]

Here the lower bound uses $e^(- gamma_E) / b \( 1 - C_s e^(- c_s \/ b) \) - \( D_b \( 1 \) - 1 + 1 \/ 8 \)$; the stated upper bound on $D_b \( 1 \)$ gives precisely the two exponential losses in (5.13).

=== 5.3 Balanced composites and the parameter choices <balanced-composites-and-the-parameter-choices>

It remains to bound the composite part of $U_kappa$. The final choice of $kappa$ precedes those of $b$ and $K$, so the coefficient in this bound must be independent of all three. We achieve this by sieving pairs for each fixed $r$ before summing the marks. Such a composite has exactly two prime factors counted with multiplicity. Indeed three factors, each greater than $x^(1 \/ 2 - kappa)$, would have product at least $x^(3 \/ 2 - 3 kappa) > 2 x$ for large $x$. Write the two factors as $m \, n$. Each is greater than $x^(1 \/ 2 - kappa)$ and less than $2 x^(1 \/ 2 + kappa)$, so for large $x$ both belong to

$ \[ x^(1 \/ 2 - 2 kappa) \, x^(1 \/ 2 + 2 kappa) \] . $

Use ordered pairs $\( m \, n \)$ to bound their weight; this counts a square once and may count other semiprimes twice, which is harmless for an upper bound.

Cover these pairs by disjoint dyadic boxes $\[ M_1 \, 2 M_1 \) times \[ M_2 \, 2 M_2 \)$ meeting the displayed factor range and $x < m n < 2 x$. Every retained box satisfies

#[#set math.equation(numbering: n => "(5.14)")
 $ x / 4 < M_1 M_2 < 2 x \, #h(2em) M_i lt.eq 2 x^0.54 quad \( i = 1 \, 2 \) . $ <eq:balanced-box-range>]

The latter is a uniform relaxed bound because $kappa < 0.01$. There are at most $C_(upright("dyad")) \( kappa L + 1 \)$ boxes, for an absolute constant $C_(upright("dyad"))$. To see this, the logarithmic length of the factor range is $4 kappa L$, so it meets $O \( kappa L + 1 \)$ dyads for $m$; for each of them the first inequality in (5.14) permits only an absolute bounded number of dyads for $n$.

Fix one box and a group integer $r$ in the full support, so $r lt.eq x^0.11$. Put $k_r = 4 r$ and $z = x^0.002$. A prime pair contributing to the weight through this $r$ obeys

#[#set math.equation(numbering: n => "(5.15)")
 $ m n equiv 1 med \( mod med k_r \) \, #h(2em) m n equiv.not 0 \, 1 med \( mod med j \) quad \( j lt.eq z upright(" an odd prime") \, med j divides.not r \) . $ <eq:balanced-necessary-conditions>]

In fact $m \, n > x^(1 \/ 2 - 2 kappa) > z$ and $Q = \( m n - 1 \) \/ \( 4 r \) > x^0.9 > z$ are primes. Thus $m n equiv 0 med \( mod med j \)$ would force $j$ to be one of the prime factors $m \, n$, and, since $j divides.not 4 r$, $m n equiv 1 med \( mod med j \)$ would force $j = Q$. Both are impossible. We discard the progression condition modulo $M$ to obtain an upper bound.

Use as a finite unweighted family all integer pairs in the box satisfying the first congruence in (5.15), and designate its odd primes $j lt.eq z$ not dividing $r$, with bad condition $m n equiv 0 upright(" or ") 1 med \( mod med j \)$. All sums and products indexed by $j$ in this balanced sieve are over primes. For a squarefree product $ell$ of these primes set

$ rho \( ell \) = product_(j divides ell) \( 3 j - 2 \) \, #h(2em) rho \( 1 \) = 1 . $

There are $phi \( k_r \)$ residue pairs modulo $k_r$ with product one. At $j$ there are $2 j - 1$ residue pairs with product zero and $j - 1$ with product one, and these two sets are disjoint. Since $\( k_r \, ell \) = 1$, the Chinese remainder theorem gives exactly $phi \( k_r \) rho \( ell \)$ residue pairs modulo $k_r ell$ satisfying the base congruence and all the designated bad conditions at primes dividing $ell$.

Each residue pair modulo $k_r ell$ occurs in the box

$ frac(M_1 M_2, \( k_r ell \)^2) + O (frac(M_1 + M_2, k_r ell) + 1) $

times. Thus its intersection count has the form $Y_r g \( ell \) + R \( ell \)$, where

#[#set math.equation(numbering: n => "(5.16)")
 $ Y_r = frac(M_1 M_2 phi \( k_r \), k_r^2) \, #h(2em) g \( ell \) = frac(rho \( ell \), ell^2) . $ <eq:balanced-sieve-data>]

#[#set math.equation(numbering: n => "(5.17)")
 $ \| R \( ell \) \| & lt.double phi \( k_r \) rho \( ell \) (frac(M_1 + M_2, k_r ell) + 1)\
 & lt.double \( M_1 + M_2 \) ell + k_r ell^2 . $ <eq:balanced-lattice-error>]

The last inequality uses $phi \( k_r \) lt.eq k_r$ and $rho \( ell \) lt.eq ell^2$, because $3 j - 2 lt.eq j^2$ for every odd prime $j$. This count also includes $ell = 1$, so its boundary error for the base family is included in $R \( 1 \)$.

For a designated prime, $g \( j \) = \( 3 j - 2 \) \/ j^2 lt.eq 7 \/ 9$ and $g \( j \) lt.eq 3 \/ j$. Thus the local gap and block sums in Input 9 again have absolute constants. Its $H = 2$ upper bound uses only $ell lt.eq z^10 = x^0.02$. Summing (5.17) over this range, bounding the designated squarefree products by all positive integers, gives

#[#set math.equation(numbering: n => "(5.18)")
 $ sum_(ell lt.eq x^0.02) \| R \( ell \) \| & lt.double \( M_1 + M_2 \) sum_(ell lt.eq x^0.02) ell + k_r sum_(ell lt.eq x^0.02) ell^2\
 & lt.double x^(0.54 + 0.04) + r x^0.06 lt.double x^0.58 + x^0.17 . $ <eq:balanced-remainder-sum>]

The notation in the left-hand sum restricts to the designated products for which $R$ is defined. The exponent margins compared with $x \/ r$ are uniform throughout $r lt.eq x^0.11$:

$ frac(x^0.58, x \/ r) = r x^(- 0.42) lt.eq x^(- 0.31) \, #h(2em) frac(r x^0.06, x \/ r) = r^2 x^(- 0.94) lt.eq x^(- 0.72) . $

Both fixed power savings absorb $L^4$. It follows that (5.18) is $o \( \( x \/ r \) L^(- 4) \)$ uniformly in every supported $r$, with no dependence on $K$ in this assertion.

For the main product the exact local identity is

$ 1 - g \( j \) = (1 - 1 / j)^3 (1 - frac(1, \( j - 1 \)^2)) . $

The last factor is at most one. The missing factor at two costs only the factor $8$ when compared with $V \( z \)^3$. The missing factors at primes dividing $r$ cost at most

$ product_(j divides r) (1 - 1 / j)^(- 3) = exp (O (sum_(j divides r) 1 / j)) = 1 + o \( 1 \) $

uniformly, since on the full support $sum_(j divides r) j^(- 1) lt.eq 0.11 L^0.9 e^(- L^0.1)$ by (4.26). Consequently

#[#set math.equation(numbering: n => "(5.19)")
 $ product_(j lt.eq z\
j med upright(o d d med p r i m e)\
j divides.not r) \( 1 - g \( j \) \) lt.double V \( z \)^3 lt.double L^(- 3) \, $ <eq:balanced-sieve-product>]

with an absolute constant. The numerical exponent $0.002$ is fixed, so the last estimate follows from Mertens’ theorem with a fixed constant.

By (5.14), $Y_r lt.double x \/ r$. Combining (5.2), (5.18), and (5.19) bounds the number of prime pairs in this box contributing through $r$ by

$ O #scale(x: 120%, y: 120%)[\(] \( x \/ r \) L^(- 3) #scale(x: 120%, y: 120%)[\)] \, $

uniformly for all supported $r$. Its constant is absolute; the power-saving error above has been absorbed for sufficiently large $x$. The smooth weight is at most one. Multiplying by $cal(W) \( r \)$ and summing over the full support of $r$, without discarding a tail, therefore bounds the weighted prime pairs in one box by $C_(upright("pair")) x J_0 \/ L^3$ with an absolute $C_(upright("pair"))$. The unique representation of the support justifies this assignment of each weighted pair to its group integer.

Let $cal(C)_kappa$ denote the weight of the composites counted by $U_kappa$. Summing the last estimate over the boxes gives

#[#set math.equation(numbering: n => "(5.20)")
 $ cal(C)_kappa lt.eq C_2 \( kappa + L^(- 1) \) X_0 / L . $ <eq:balanced-composite-mass>]

Here $C_2$ depends only on $M \, Psi$ and the fixed dyadic comparison conventions, and is independent of $kappa \, b \, K$. Indeed the preceding bound before converting the normalization is $C_(upright("pair")) C_(upright("dyad")) \( kappa L + 1 \) x J_0 \/ L^3$. The lower comparison in (4.20) is $X_0 gt.eq c_(M \, Psi) x J_0 \/ L$ for large $x$, with $c_(M \, Psi) > 0$ independent of $K$. We may take $C_2 = C_(upright("pair")) C_(upright("dyad")) \/ c_(M \, Psi)$. The threshold for $x$ may depend on all the fixed parameters; this does not change the stated independence of the constant.

Every supported prime is counted by $U_kappa$. Subtracting its composite part using (5.13) and (5.20) yields

#[#set math.equation(numbering: n => "(5.21)")
 $ frac(L, frak(S)_M X_0) sum_(d upright(" prime")) w \( d \) & gt.eq 1 - 1 / 8 - e^(- gamma_E) / b (C_s e^(- c_s \/ b) + C_d e^(- c_d \/ b))\
 & quad - C_2 / frak(S)_M \( kappa + L^(- 1) \) + o \( 1 \) . $ <eq:final-prime-mass>]

We now choose the parameters. With $M$ fixed, the function $Psi$ and the dyadic convention have already fixed $C_2$, while $frak(S)_M > 0$ depends only on $M$. Choose $0 < kappa < 0.01$ so small that $C_2 kappa \/ frak(S)_M < 1 \/ 8$, and then choose $0 < epsilon.alt < kappa$. Next choose fixed $b > 0$ sufficiently small for Inputs 9 and 10, for (5.4), and so that

$ e^(- gamma_E) / b (C_s e^(- c_s \/ b) + C_d e^(- c_d \/ b)) < 1 / 8 . $

This is possible because $b^(- 1) e^(- c \/ b) arrow.r 0$ as $b arrow.b 0$ for each $c > 0$. Fix a finite partition satisfying (5.12). For its finitely many left endpoints $gamma$, use the fixed Type II choices $delta = b \/ 2$, $C = 2$, $D_(*) = 6$ and the exponent interval already specified. Now choose $K$ sufficiently large for Lemma 6 in every one of these applications. The lower bound on $K$ is independent of the band exponents, so choose any fixed $0.1 < a_1 < dots.h.c < a_K < 0.2$ afterwards. Finally let $x$ exceed all thresholds for these fixed choices.

The three fixed losses in (5.21) are then at most $1 \/ 8$ each, and the term $C_2 \/ \( frak(S)_M L \)$ and the $o \( 1 \)$ term tend to zero. In particular, for all sufficiently large $x$,

$ sum_(d upright(" prime")) w \( d \) gt.eq frac(frak(S)_M X_0, 2 L) gt.double_(M \, Psi) frac(x J_0, L^2) gt.double_(M \, Psi) x / L^2 . $

By (4.16), each prime with positive weight has the required support and progression properties, and its weight is at most $B_K$. Dividing the prime mass by this fixed bound gives the required lower bound for distinct primes. This proves Proposition 2.

#heading(level: 1)[References]
#bibitem([1])[M.~Anwar and F.~Pappalardi, On simultaneous primitive roots, #emph[Acta Arith.] #strong[180] (2017), no.~1, 35--43. #link("https://doi.org/10.4064/aa8566-3-2017")[doi:10.4064/aa8566-3-2017].]
#bibitem([2])[E.~Bombieri, On the large sieve, #emph[Mathematika] #strong[12] (1965), no.~2, 201--225. #link("https://doi.org/10.1112/S0025579300005313")[doi:10.1112/S0025579300005313].]
#bibitem([3])[R.~Gupta and M.~Ram Murty, A remark on Artin's conjecture, #emph[Invent. Math.] #strong[78] (1984), no.~1, 127--130. #link("https://doi.org/10.1007/BF01388719")[doi:10.1007/BF01388719].]
#bibitem([4])[H.~Hasse, #emph[Die mathematischen Tagebücher von Helmut Hasse 1923--1935], edited by F.~Lemmermeyer and P.~Roquette, Universitätsverlag Göttingen, 2012. #link("https://univerlag.uni-goettingen.de/handle/3/isbn-978-3-86395-072-9")[Publisher's edition].]
#bibitem([5])[E.~Hasanalizade, Q.~Shen, and P.-J.~Wong, Counting zeros of Dedekind zeta functions, #emph[Math. Comp.] #strong[91] (2022), no.~333, 277--293. #link("https://doi.org/10.1090/mcom/3665")[doi:10.1090/mcom/3665].]
#bibitem([6])[D.~R.~Heath-Brown, Artin's conjecture for primitive roots, #emph[Quart. J. Math. Oxford] (2) #strong[37] (1986), no.~1, 27--38. #link("https://doi.org/10.1093/qmath/37.1.27")[doi:10.1093/qmath/37.1.27].]
#bibitem([7])[C.~Hooley, On Artin's conjecture, #emph[J. Reine Angew. Math.] #strong[225] (1967), 209--220. #link("https://doi.org/10.1515/crll.1967.225.209")[doi:10.1515/crll.1967.225.209].]
#bibitem([8])[K.~Matthews, A generalisation of Artin's conjecture for primitive roots, #emph[Acta Arith.] #strong[29] (1976), no.~2, 113--146. #link("https://doi.org/10.4064/aa-29-2-113-146")[doi:10.4064/aa-29-2-113-146].]
#bibitem([9])[J.~Neukirch, #emph[Algebraic Number Theory], translated by N.~Schappacher, Grundlehren der mathematischen Wissenschaften, vol.~322, Springer, Berlin, 1999. #link("https://doi.org/10.1007/978-3-662-03983-0")[doi:10.1007/978-3-662-03983-0].]
#bibitem([10])[OpenAI, Primitive roots for every admissible integer base, OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/primitive-roots-all-integer-bases.pdf")[OAI:Primitive-roots-for-every-admissible-integer-base-October-4-2026], 2026.]
#bibitem([11])[J.~T.~Tate, Fourier analysis in number fields and Hecke's zeta-functions, in #emph[Algebraic Number Theory], edited by J.~W.~S.~Cassels and A.~Fröhlich, Academic Press, London, 1967, 305--347. #link("https://math.arizona.edu/~cais/scans/Cassels-Frohlich-Algebraic_Number_Theory.pdf")[Scan of the volume].]
#bibitem([12])[A.~I.~Vinogradov, On the density hypothesis for Dirichlet $L$-series, #emph[Izv. Akad. Nauk SSSR Ser. Mat.] #strong[29] (1965), no.~4, 903--934 (Russian). #link("https://www.mathnet.ru/eng/im3080")[MathNet record and original text]. Correction, #emph[ibid.] #strong[30] (1966), no.~3, 719--720; #link("https://www.mathnet.ru/eng/im2856")[MathNet record and correction].]


