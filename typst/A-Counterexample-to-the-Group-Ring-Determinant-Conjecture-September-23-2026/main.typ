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

#align(center)[#text(size: 16pt, weight: "bold")[A Counterexample to the Group-Ring Determinant Conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction and proof overview <sec:introduction>

A nonsingular integer matrix has determinant of absolute value at least one. The group-ring Determinant Conjecture asks for an analogue when the entries are finite integer combinations of elements of a discrete group. The relevant determinant, introduced by Fuglede and Kadison #cite(label("FK1952")), uses the trace of a logarithm rather than a finite-dimensional determinant polynomial.

Here are the conventions that fix this question. Let $G$ be a discrete group and let $bb(Z) \[ G \]$ denote its ordinary group ring of finite sums. Use the left regular representation

$ \( L_g xi \) \( h \) = xi \( g^(- 1) h \) \, #h(2em) xi in ell^2 \( G \) . $

For $A in "M"_n \( bb(Z) \[ G \] \)$, write $T_A$ for its operator on $ell^2 \( G \)^n$ and $e_i$ for the vector with $delta_1$ in component $i$. The probability spectral measure of the positive square is

$ mu_A \( E \) = 1 / n sum_(i = 1)^n chevron.l upright(bold(1))_E \( T_A^(*) T_A \) e_i \, e_i chevron.r quad \( E subset.eq \[ 0 \, oo \) upright(" Borel") \) . $

The square-matrix instance of the conjecture is

#[#set math.equation(numbering: n => "(1.1)")
 $ integral_(\( 0 \, oo \)) log t thin d mu_A \( t \) gt.eq 0 . $ <eq:conjecture>]

The zero atom is omitted and the general integral may be $- oo$. The usual conjecture also permits rectangular matrices #cite(label("Luck2002")) Conjecture 13.2; a square counterexample already contradicts it. Our example will have a bounded inverse, so its spectrum stays away from zero.

Write $cal(N) \( G \)$ for the group von Neumann algebra and use the #emph[unnormalized] matrix trace $tau_n \( T \) = sum_i chevron.l T e_i \, e_i chevron.r$, so $tau_n \( I_n \) = n$. For invertible $T_A$ the determinant convention is

#[#set math.equation(numbering: n => "(1.2)")
 $ log det_(cal(N) \( G \)) \( T_A \) = 1 / 2 tau_n #scale(x: 120%, y: 120%)[\(] log \( T_A^(*) T_A \) #scale(x: 120%, y: 120%)[\)] = n / 2 integral_(\( 0 \, oo \)) log t thin d mu_A \( t \) . $ <eq:normalization>]

This extends the absolute value of the ordinary determinant. The inversion unitary $delta_g mapsto delta_(g^(- 1))$ identifies our integral-matrix convention with right multiplication by $A^(*)$ on row vectors. It fixes the identity vectors, and therefore preserves the corresponding positive-square spectral measures.

#thm([Theorem 1.1.])[
  #emph[There are a finitely generated discrete group $G_D$, an integer $n gt.eq 1$, and $A in "M"_n \( bb(Z) \[ G_D \] \)$ invertible over $bb(Q) \[ G_D \]$ such that 
$ 0 < det_(cal(N) \( G_D \)) \( T_A \) < 1 . $

 The integral in Equation (1.1) is finite and strictly negative. Thus the unrestricted group-ring Determinant Conjecture has a negative resolution.]
] <thm:main>

===== 1.1 The exact existence input. <the-exact-existence-input.>

A unital ring is directly finite if $a b = 1$ implies $b a = 1$. We use the following scalar failure of direct finiteness from the complete characteristic-two companion.

#thm([Theorem 1.2.])[
  (#cite(label("CharacteristicTwo")) Theorem 1.1).  #emph[There exist a finite field $K_2$ of characteristic two, a finitely generated group $H_2$, and finite sums $a_2 \, b_2 in K_2 \[ H_2 \]$ with $a_2 b_2 = 1$ and $b_2 a_2 eq.not 1$.]
] <thm:input>

The companion’s Section 6 specifies its field, group presentation and scalar sums by a terminating finite prescription. We use the existence theorem, not an executed numerical instance or a group-word decision procedure. The coefficient field is finite but is not asserted to be $bb(F)_2$. There is no torsion-free hypothesis; the companion construction uses torsion. All steps after this exact input are proved below. In particular, a result only in odd characteristic would not supply the binary premise used here.

===== 1.2 Context and mathematical ancestry. <context-and-mathematical-ancestry.>

Determinant bounds are part of the theory of $L^2$-invariants #cite(label("Luck2002")). Approximation and closure arguments established such bounds for large classes of groups, including amenable groups #cite(label("Schick2001")) Theorem 1.21, with its erratum; Elek and Szabó proved the determinant bound for sofic groups #cite(label("ElekSzabo2005")) Theorem 5. Their proof uses finite graph approximations and the integrality of products of nonzero eigenvalues of positive integral matrices. Our construction instead starts from failure of direct finiteness in characteristic two. The cited sofic theorem implies, as a separate consequence, that its resulting group is not sofic.

The lower-bound question is distinct from determinant #emph[approximation]. Kammeyer’s counterexample to a finite-quotient limiting formula has determinant $2$ over the discrete Heisenberg group, while its principal congruence quotients of levels $3^i$, $i gt.eq 1$, have determinants at most $5^(1 \/ 3)$ #cite(label("Kammeyer2026")) Theorem 2 and Section 2. That discrepancy does not violate the lower bound one.

The finite-coordinate projection construction below is related to the commuting wreath-product projections of Dicks and Schick #cite(label("DicksSchick2002")) Section 3 and of Lehner, Neuhauser and Woess #cite(label("LehnerNeuhauserWoess2008")) Section 2. Here the projections separate one coefficient of a binary defect; we do not import a spectral-distribution theorem from those works. The analytic step is the classical tracial logarithmic derivative #cite(label("FK1952")) Lemma 2, also present in the path-integral determinant viewpoint of de la Harpe and Skandalis #cite(label("deLaHarpeSkandalis1984")) Lemma 1 and Proposition 2(d). We give its proof and its application to block shears locally.

===== 1.3 How a binary defect produces a real trace gap. <how-a-binary-defect-produces-a-real-trace-gap.>

Set $d = \[ K_2 : bb(F)_2 \]$. Representing multiplication by field elements on the $d$-dimensional binary vector space $K_2$ gives matrices $X \, Y in "M"_d \( bb(F)_2 \[ H_2 \] \)$ with $X Y = I_d$ and a nonzero idempotent $C = I_d - Y X$. One entry of $C$ has a nonzero coefficient. We enlarge the group to

$ G_D = (xor.big_(h in H_2) C_3) times.r H_2 \, $

where $H_2$ acts by left translation on the coordinate labels. Averaging over the cyclic group at one coordinate and taking complementary averages at finitely many other coordinates isolates that coefficient. The result is a rational orthogonal projection $P$ of size $d + 1$ with trace $d + theta$, for a positive rational number $theta$. Its reduction modulo two nevertheless factors through $d$ columns. Section 2 proves the coefficient separation and this factorization in full.

===== 1.4 How the gap becomes an integral determinant. <how-the-gap-becomes-an-integral-determinant.>

For a general rational projection $P$ of size $m$, suppose an odd integer $D$ clears its denominators and $macron(P) = u v$ factors through $r$ columns over $bb(F)_2 \[ G \]$. Choose a power $q$ of two congruent to one modulo $D$. Section 3 lifts the factorization modulo $q$ by a finite geometric series in a corner ring. Arbitrary integral lifts then give an integral block matrix with an explicit rational inverse. Section 4 removes its two block shears without changing the trace of the logarithm of its positive square. The remaining diagonal matrix expands the first $r$ coordinate summands by $q$ and contracts the range of $P$ by $q^(- 1)$, giving

$ log det \( T_A \) = \( r - tau_m \( P \) \) log q . $

Finally Section 5 uses $r = d$ and $tau_(d + 1) \( P \) = d + theta$ to obtain the exact value $q^(- theta)$. The projection construction, modular lifting and trace calculation have distinct roles; none replaces the scalar existence input.

== 2 From the scalar defect to a projection <sec:projection>

We first produce the trace gap. All group-ring sums in this section are finite, and matrix multiplication keeps the indicated order. For a group-ring sum $c$, write $\[ 1 \] c$ for its identity coefficient. The involution $*$ inverts group elements and conjugates coefficients; on matrices it also transposes the indices. Thus an orthogonal projection satisfies $P = P^(*) = P^2$ in the regular representation.

#thm([Lemma 2.1.])[
  #emph[Let $K_2$ be a finite field of characteristic two and $H_2$ a group. For $d = \[ K_2 : bb(F)_2 \]$, there is an injective unital ring homomorphism 
$ rho : K_2 \[ H_2 \] arrow.r "M"_d \( bb(F)_2 \[ H_2 \] \) . $

 For $a_2 \, b_2 in K_2 \[ H_2 \]$ with $a_2 b_2 = 1 eq.not b_2 a_2$, their images $X \, Y$ satisfy $X Y = I_d$ and $C := I_d - Y X eq.not 0$, with 
#[#set math.equation(numbering: n => "(2.1)")
 $ C^2 = C \, #h(2em) X C = 0 \, #h(2em) C Y = 0 . $ <eq:defect>]

]
] <lem:binary>

#proof[
  Choose a binary basis of $K_2$. The matrix of multiplication by $lambda in K_2$ is a unital ring representation; it is injective because its value on $1 in K_2$ recovers $lambda$. Apply this map coefficientwise to a group-ring sum. The coefficient matrices commute with the formal group symbols, so products are preserved. Comparing the coefficient matrix at each group element proves injectivity. Thus $X Y = I_d$ and $I_d - Y X eq.not 0$. Now $\( Y X \)^2 = Y \( X Y \) X = Y X$, $X \( I_d - Y X \) = X - \( X Y \) X = 0$ and $\( I_d - Y X \) Y = Y - Y \( X Y \) = 0$, proving all the identities. ◻
]

#thm([Proposition 2.2.])[
  #emph[Let $X \, Y in "M"_d \( bb(F)_2 \[ H_2 \] \)$, $d gt.eq 1$, satisfy $X Y = I_d eq.not Y X$. In the group $G_D = \( xor.big_(h in H_2) C_3 \) times.r H_2$, where $H_2$ acts by left translation on coordinate labels, there is an orthogonal projection $P in "M"_(d + 1) \( bb(Z) \[ 1 \/ 3 \] \[ G_D \] \)$ and a finite set $S subset.eq H_2 \\ { 1 }$ such that 
$ tau_(d + 1) \( P \) = d + theta \, #h(2em) theta = 1 / 3 (2 / 3)^(\| S \|) > 0 \, #h(2em) macron(P) = u v \, $

 where $u$ has size $\( d + 1 \) times d$ and $v$ has size $d times \( d + 1 \)$ over $bb(F)_2 \[ G_D \]$. The integer $D = 3^(1 + \| S \|)$ clears all coefficients of $P$.]
] <prop:separation>

#proof[
  Put $C = I_d - Y X$. Choose an entry $C_(i j)$ and a group element $h_0$ whose coefficient in that entry is nonzero. The coefficient is $1$ because the field is $bb(F)_2$. Left multiplication by $h_0^(- 1)$ therefore gives
  #[#set math.equation(numbering: n => "(2.2)")
   $ h_0^(- 1) C_(i j) = 1 + sum_(s in S) s $ <eq:support>]
  for a finite $S subset.eq H_2 \\ { 1 }$, possibly empty.
  To isolate the identity term in Equation (2.2), we seek a nonzero rational projection $p$ with $p s p = 0$ for every $s in S$. The cyclic coordinates provide complementary projections that enforce these vanishing products. Let $z_h$ generate the cyclic coordinate labelled by $h$ and put
  $ p_h = frac(1 + z_h + z_h^2, 3) \, #h(2em) p = p_1 product_(s in S) \( 1 - p_s \) . $
  The $p_h$ are self-adjoint idempotents: averaging the nine products in $\( 1 + z_h + z_h^2 \)^2$ gives three copies of each element of $C_3$. They commute because distinct coordinates commute. Consequently $p = p^(*) = p^2$, and the displayed product shows that $3^(1 + \| S \|) p$ is integral. This is the elementary commuting-coordinate method in the works cited above; compare #cite(label("DicksSchick2002")) Lemmas 3.1 and 3.4.
  Conjugation obeys $s p_h s^(- 1) = p_(s h)$. For $s in S$, the product $s p s^(- 1)$ contains $p_s$, while $p$ contains $1 - p_s$. All these coordinate factors commute, so
  #[#set math.equation(numbering: n => "(2.3)")
   $ p s p = p \( s p s^(- 1) \) s = 0 . $ <eq:separation>]
  This argument does not need disjointness of the two collections of coordinate labels. Inverse pairs or finite-order elements in $S$ cause no change.
  The original coordinates ${ 1 } union S$ are distinct. The coefficient of the identity in their product is therefore the product of the individual identity coefficients. Hence
  #[#set math.equation(numbering: n => "(2.4)")
   $ tau_1 \( p \) = \[ 1 \] p = 1 / 3 product_(s in S) 2 / 3 = theta > 0 . $ <eq:theta>]
  For empty $S$ this means $p = p_1$ and $theta = 1 \/ 3$.
  The map $bb(Z) \[ 1 \/ 3 \] arrow.r bb(F)_2$ is defined because $3$ is odd. Reduce the projection modulo two and combine Equations (2.2) and (2.3) to obtain
  $ macron(p) h_0^(- 1) C_(i j) macron(p) = macron(p) . $
  Let $f$ be the row of length $d$ with entry $macron(p) h_0^(- 1)$ at position $i$ and zero elsewhere. Let $w$ be the column with entry $macron(p)$ at position $j$ and zero elsewhere. Thus $f C w = macron(p)$. Define
  $ P = "diag" \( I_d \, p \) \, #h(2em) u = vec(X, f C) \, #h(2em) v = mat(delim: "(", Y, C w) . $
  Using Equation (2.1) in this order gives
  $ u v = mat(delim: "(", X Y, X C w; f C Y, f C^2 w) = "diag" \( I_d \, macron(p) \) = macron(P) . $
  The rational trace is $d + theta$ by Equation (2.4). It is the rational orthogonal projection, not its binary reduction, that has this strictly positive extra trace. ◻
]

We have obtained a projection of real trace greater than $d$ but a binary factorization through $d$ columns. The next step produces a factorization through the same number of columns modulo a power of two, so that it can be inserted into an integral matrix.

== 3 Lifting the factorization and preserving integrality <sec:lifting>

We now work with any group $G$, an orthogonal rational projection $P in "M"_m \( bb(Q) \[ G \] \)$, and a factorization of $macron(P)$ through $r$ columns over $bb(F)_2 \[ G \]$. Assume that an odd integer $D$ clears the denominators of $P$. Here orthogonality means $P^2 = P = P^(*)$, where $*$ transposes the matrix and inverts group elements.

For a power $q > 1$ of two, the trace gap suggests the absolute value of the operator we want: expand $r$ coordinate summands by $q$ and contract the range of $P$ by $q^(- 1)$. Its logarithmic determinant should be $\( r - tau_m \( P \) \) log q$, which is negative when $tau_m \( P \) > r$. The difficulty is to realize this determinant by an integral matrix. We will add block shears whose off-diagonal entries come from a factorization of $P$ modulo $q$. The analytic justification that these shears preserve the determinant is given in Section 4.

The first lemma lifts the binary factorization to every power $q$ of two; only idempotence is needed for this step.

#thm([Lemma 3.1.])[
  #emph[Let $G$ be a group, $m \, r gt.eq 1$, $D$ an odd positive integer, and $P in "M"_m \( bb(Q) \[ G \] \)$ satisfy $P^2 = P$ and $D P in "M"_m \( bb(Z) \[ G \] \)$. Suppose $macron(P) = u v$ over $bb(F)_2 \[ G \]$, where $u$ and $v$ have respective sizes $m times r$ and $r times m$. For $q = 2^k$, $k gt.eq 1$, the reduction $e = P_q$ has a factorization $e = u_q v_q$ of the same sizes over $\( bb(Z) \/ q bb(Z) \) \[ G \]$.]
] <lem:lift>

#proof[
  Since $D$ is odd, every coefficient of $P$ has a well-defined reduction modulo $q$. Set $cal(R) = \( bb(Z) \/ q bb(Z) \) \[ G \]$ and choose arbitrary finite lifts $u_0 \, v_0$ of $u \, v$ over $cal(R)$. In the corner ring $e "M"_m \( cal(R) \) e$, whose identity is $e$, put
  $ Z = e u_0 v_0 e \, #h(2em) W = e - Z . $
  Modulo two, $Z$ is $macron(P) u v macron(P) = macron(P)^3 = macron(P)$. Every coefficient of $W$ is therefore even. A product of $k$ such coefficients is divisible by $2^k$, giving $W^k = 0$. This is nilpotence in the even ideal of the corner ring; the corner ring itself need not be nilpotent.
  Because $Z = e - W$, the finite geometric sum
  $ Q = e + W + dots.h.c + W^(k - 1) $
  satisfies $Q Z = Z Q = e - W^k = e$. When $k = 1$, this sum is just $e$. Thus $Q$ is a corner inverse of $Z$, not a claimed inverse in the entire matrix ring. Set
  $ u_q = Q e u_0 \, #h(2em) v_q = v_0 e . $
  Then $u_q v_q = Q e u_0 v_0 e = Q Z = e$. Only finite sums and products were used, so the resulting supports remain finite. ◻
]

For the integral construction, choose $q = 2^k > 1$ with $q equiv 1 med \( mod med D \)$. Such a power exists because two is a unit modulo the odd integer $D$; for $D = 1$, any $2^k > 1$ works. Choose integral lifts $U \, V$ of the factors from Lemma 5. The diagonal operator with the desired expansion and contraction is

$ J = - q^(- 1) P - \( I_m - P \) \, #h(2em) B = "diag" \( q I_r \, J \) . $

The minus signs leave its positive square unchanged and will produce the subtraction $U V - P$ needed for integrality. Prescribe the upper-left block $q I_r$ and off-diagonal blocks $V \, U$. Eliminating these off-diagonal blocks subtracts $U \( q I_r \)^(- 1) V = U V \/ q$ from the lower-right block. To leave $J$ as the Schur complement, that block must therefore be $U V \/ q + J$. Thus the factorization modulo $q$ is exactly what is needed to cancel the denominators in this block.

#thm([Lemma 3.2.])[
  #emph[Suppose $P = P^(*) = P^2 in "M"_m \( bb(Q) \[ G \] \)$, an odd $D > 0$ clears its denominators, and $macron(P) = u v$ factors through $r gt.eq 1$ columns. Let $q = 2^k > 1$ satisfy $q equiv 1 med \( mod med D \)$. Choose arbitrary integral lifts $U \, V$ of the factors supplied by Lemma 5. Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ A = mat(delim: "(", q I_r, V; U, q^(- 1) #scale(x: 120%, y: 120%)[\(] U V - P - q \( I_m - P \) #scale(x: 120%, y: 120%)[\)]) in "M"_(r + m) \( bb(Z) \[ G \] \) $ <eq:integral-matrix>]

 has an inverse in $"M"_(r + m) \( bb(Q) \[ G \] \)$.]
] <lem:integral>

#proof[
  The matrix $P + q \( I_m - P \) = q I_m + \( 1 - q \) P$ is integral because $D divides \( q - 1 \)$. Its reduction modulo $q$ is $e = P_q$, which is also the reduction of $U V$. Thus every coefficient of $U V - P - q \( I_m - P \)$ is an integer divisible by $q$; the bottom-right block of Equation (3.1) is integral.
  For $J$ and $B$ defined above, the complementary projection identities give $J^(- 1) = - q P - \( I_m - P \)$. For $x in \[ 0 \, 1 \]$ put
  $ L_x = mat(delim: "(", I_r, 0; x U \/ q, I_m) \, #h(2em) R_x = mat(delim: "(", I_r, x V \/ q; 0, I_m) . $
  Their inverses negate the off-diagonal blocks, and multiplication without interchanging any factors gives
  #[#set math.equation(numbering: n => "(3.2)")
   $ M \( x \) := L_x B R_x = mat(delim: "(", q I_r, x V; x U, x^2 U V \/ q + J) . $ <eq:path>]
  In particular $A = M \( 1 \)$, with the rational group-ring inverse $R_1^(- 1) B^(- 1) L_1^(- 1)$. For general real $x$, both $M \( x \)$ and its inverse lie in the real group ring and depend continuously differentiably on $x$. No identities $P U = U$, $V P = V$, or $V = U^(*)$ are required of the chosen integer lifts. ◻
]

The construction is integral at its endpoint, though its simplifying path need not be integral. We now show that this path preserves the logarithmic determinant.

== 4 The trace calculation <sec:analysis>

Let $cal(A)_n$ be the operator-norm closure of $"M"_n \( bb(C) \[ G \] \)$ in its left regular representation. For finite group-ring matrices define

$ tau_n \( C \) = sum_(i = 1)^n \[ 1 \] C_(i i) . $

The identity-coefficient formula gives $tau_n \( C D \) = tau_n \( D C \)$ by summing $\( C_(i j) \)_g \( D_(j i) \)_(g^(- 1))$ over $i \, j \, g$. Moreover $\| tau_n \( C \) \| lt.eq n parallel C parallel$ and $tau_n \( C^(*) \) = overline(tau_n \( C \))$. Thus it extends to a continuous trace on the unital $C^(*)$-algebra $cal(A)_n$.

#thm([Lemma 4.1.])[
  #emph[For a continuously differentiable path $M : \[ 0 \, 1 \] arrow.r cal(A)_n$ of invertible elements, 
$ frac(d, d x) tau_n #scale(x: 120%, y: 120%)[\(] log \( M \( x \)^(*) M \( x \) \) #scale(x: 120%, y: 120%)[\)] = 2 "Re" tau_n #scale(x: 120%, y: 120%)[\(] M' \( x \) M \( x \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $

]
] <lem:logderivative>

#proof[
  Put $N = M^(*) M$. Continuity of $M$ and its inverse on the compact interval gives constants $0 < delta < c$ with $delta I lt.eq N \( x \) lt.eq c I$ for all $x$. Write $W = I - N \/ c$, so $parallel W parallel lt.eq rho = 1 - delta \/ c < 1$. Functional calculus gives the uniformly norm-convergent series
  $ log N = \( log c \) I - sum_(j gt.eq 1) W^j / j . $
  Its derivative series is also uniformly norm-convergent, since
  $ ∥frac(d, d x) W^j / j∥ lt.eq sup_(y in \[ 0 \, 1 \]) parallel W' \( y \) parallel rho^(j - 1) . $
  In the derivative of $W^j$, cyclicity makes the traces of its $j$ terms equal; commutation of $N$ and $N'$ is not assumed. Using $W' = - N' \/ c$ therefore gives
  $ frac(d, d x) tau_n \( log N \) = 1 / c sum_(j gt.eq 1) tau_n \( W^(j - 1) N' \) = tau_n \( N^(- 1) N' \) . $
  Since $N' = M' ""^(*) M + M^(*) M'$, the second summand contributes $tau_n \( M' M^(- 1) \)$. Cyclicity and $M N^(- 1) = \( M^(*) \)^(- 1)$ turn the first into
  $ tau_n \( \( M^(*) \)^(- 1) M' ""^(*) \) = overline(tau_n \( M' M^(- 1) \)) . $
  Their sum is the asserted real part. This is the tracial logarithmic derivative of #cite(label("FK1952")) Lemma 2, written with the unnormalized trace used here. ◻
]

#thm([Lemma 4.2.])[
  #emph[Let $r \, m gt.eq 1$ and let $B in cal(A)_(r + m)$ be invertible. Let $S \, T$ have respective sizes $m times r$ and $r times m$ over the operator-norm closure of $bb(C) \[ G \]$. For $x in \[ 0 \, 1 \]$, let $L_x \, R_x$ be lower and upper block shears with diagonal blocks $I_r \, I_m$ and off-diagonal blocks $x S \, x T$, respectively. Then $tau_(r + m) \( log \( \( L_x B R_x \)^(*) \( L_x B R_x \) \) \)$ is constant.]
] <lem:shears>

#proof[
  Write $M = L_x B R_x$. Both shears have inverses obtained by negating their off-diagonal blocks. The ordered product rule gives
  $ M' M^(- 1) = L'_x L_x^(- 1) + \( L_x B \) \( R'_x R_x^(- 1) \) \( L_x B \)^(- 1) . $
  The matrices $L'_x L_x^(- 1)$ and $R'_x R_x^(- 1)$ have zero diagonal blocks, so each has trace zero. Cyclicity gives trace zero also for the conjugate $\( L_x B \) \( R'_x R_x^(- 1) \) \( L_x B \)^(- 1)$. Lemma 7 now gives zero derivative. ◻
]

#thm([Proposition 4.3.])[
  #emph[Let $G$ be a discrete group, $m \, r gt.eq 1$, and let $P = P^(*) = P^2 in "M"_m \( bb(Q) \[ G \] \)$. Suppose an odd $D > 0$ clears its denominators and $macron(P) = u v$ with $u in "M"_(m \, r) \( bb(F)_2 \[ G \] \)$ and $v in "M"_(r \, m) \( bb(F)_2 \[ G \] \)$. For every $q = 2^k > 1$ congruent to one modulo $D$, the matrix $A$ of Lemma 6 satisfies 
#[#set math.equation(numbering: n => "(4.1)")
 $ tau_(r + m) \( log \( T_A^(*) T_A \) \) & = 2 \( r - tau_m \( P \) \) log q \,\
log det_(cal(N) \( G \)) \( T_A \) & = \( r - tau_m \( P \) \) log q . $ <eq:criterion-trace>]

 It is integral and rationally invertible, and its positive-square spectral measure has support in a compact subinterval of $\( 0 \, oo \)$.]
] <prop:criterion>

#proof[
  Lemma 6 has already established integrality and the finite-support rational inverse. Apply Lemma 8 to Equation (3.2). At $x = 0$ the matrix is $B = "diag" \( q I_r \, - q^(- 1) P - \( I_m - P \) \)$. Orthogonality gives
  $ B^(*) B = "diag" \( q^2 I_r \, q^(- 2) P + I_m - P \) \, #h(2em) log \( B^(*) B \) = 2 log q thin "diag" \( I_r \, - P \) . $
  Taking the trace and using shear invariance proves Equation (4.1); half this trace is Equation (4.1). The regular representation of the rational group-ring inverse is bounded, so
  $ parallel T_A^(- 1) parallel^(- 2) I lt.eq T_A^(*) T_A lt.eq parallel T_A parallel^2 I . $
  Its logarithm is therefore bounded. In the probability measure convention from the introduction this also gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ integral_(\( 0 \, oo \)) log t thin d mu_A \( t \) = frac(2 \( r - tau_m \( P \) \) log q, r + m) . $ <eq:criterion-integral>]
  ◻
]

== 5 Assembly and exact determinant <sec:assembly>

#proof[
  Take $K_2 \, H_2 \, a_2 \, b_2$ from Theorem 2. Apply Lemma 3 with $d = \[ K_2 : bb(F)_2 \] gt.eq 1$ and then Proposition 4. It gives the group $G_D = \( xor.big_(H_2) C_3 \) times.r H_2$ and a projection $P$ of size $d + 1$ whose binary reduction factors through $d$ columns. Its trace is $d + theta$, where
  $ theta = 1 / 3 (2 / 3)^(\| S \|) > 0 \, #h(2em) D = 3^(1 + \| S \|) . $
  The odd integer $D$ clears the coefficients of $P$. Choose $k gt.eq 1$ with $q = 2^k equiv 1 med \( mod med D \)$. Proposition 9, with $r = d$ and $m = d + 1$, produces $A in "M"_(2 d + 1) \( bb(Z) \[ G_D \] \)$ with a rational group-ring inverse and
  $ log det_(cal(N) \( G_D \)) \( T_A \) = - theta log q . $
  Since $q > 1$ and $theta > 0$, this proves
  #[#set math.equation(numbering: n => "(5.1)")
   $ 0 < det_(cal(N) \( G_D \)) \( T_A \) = q^(- theta) < 1 . $ <eq:final-det>]
  With $n = 2 d + 1$, Equation (4.2) reads
  #[#set math.equation(numbering: n => "(5.2)")
   $ integral_(\( 0 \, oo \)) log t thin d mu_A \( t \) = - frac(2 theta log q, 2 d + 1) < 0 . $ <eq:final-integral>]
  It is finite because of the spectral bounds in Proposition 9. Finally, a finite generating set of $H_2$ together with $z_1$ generates $G_D$, since $z_h = h z_1 h^(- 1)$. Thus $G_D$ is finitely generated. ◻
]

The target group differs from the companion’s group and contains the cyclic coordinates of order three. The construction has a finite negative logarithmic determinant and no zero spectral mass; it is a failure of the asserted lower bound, not of determinant class. Applying the sofic determinant bound of #cite(label("ElekSzabo2005")) Theorem 5 to the positive integral matrix $A^(*) A$ proves that $G_D$ is not sofic. This last implication is an external consequence, not an ingredient in constructing $A$.


#bibliography("refs.bib", style: "ieee", title: [References])
