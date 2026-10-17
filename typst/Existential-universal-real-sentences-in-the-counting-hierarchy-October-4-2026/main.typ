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

#align(center)[#text(size: 16pt, weight: "bold")[Existential--universal real sentences \
in the counting hierarchy]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

A sentence with one existential and one universal real block asks whether there is a real tuple for which every real tuple in a second block satisfies specified polynomial conditions. We study the discrete language $exists forall bb(R)_(upright("circ"))$ of true sentences

#[#set math.equation(numbering: n => "(1.1)")
 $ exists x in bb(R)^r med forall y in bb(R)^s : med Phi \( x \, y \) . $ <eq:input-sentence>]

Here $r \, s gt.eq 0$ are represented by explicit lists of variables, and $Phi$ is an explicitly encoded Boolean formula using AND, OR, and NOT over atoms $p = 0$ and $p > 0$. Each $p$ is given by an explicitly listed acyclic arithmetic circuit with signed binary integer constants and gates $+ \, - \, times$. Predecessor indices specify the gates; sharing is allowed, and there are no division or exponentiation gates. All operations and comparisons in (1.1) are interpreted exactly. The input length $N$ is the total binary encoding length, and malformed encodings are rejected.

All computational bounds below are uniform bit-time bounds. Let $sans(P P)$ denote polynomial-time probabilistic computation with fair random bits, accepting exactly the yes-instances with probability greater than $1 \/ 2$. The counting hierarchy, introduced by Wagner #cite(label("Wagner1986")), is defined by

$ sans(C)_0 sans(P) = sans(P) \, #h(2em) sans(C)_(j + 1) sans(P) = union.big_(A in sans(C)_() sans(P) j) sans(P P)^A \, #h(2em) sans(C H) = union.big_(j gt.eq 0) sans(C)_() sans(P) j . $

Membership uses a fixed oracle language and a fixed uniform machine.

#thm([Theorem 1.1.])[
  #emph[There is an absolute integer $j$ such that 
$ exists forall bb(R)_(upright("circ")) in sans(C)_() sans(P) j . $

 The level $j$ is independent of the input length, the numbers of variables, the degrees of the circuit polynomials, and their coefficient magnitudes.]
] <thm:main>

The existential theory of the reals, denoted $sans(E T R)$, is the same decision problem with only the existential block. Write $exists bb(R)$ for the class of languages polynomial-time many-one reducible to $sans(E T R)$. Finer accounting for this fragment gives $sans(E T R) in sans(C)_26 sans(P)$ and hence $exists bb(R) subset.eq sans(C)_26 sans(P)$; Theorem 25 proves this explicit bound. The main result allows a universal block of unrestricted dimension as well.

=== 1.1 History and significance <history-and-significance>

Tarski proved decidability of the first-order theory of real closed fields #cite(label("Tarski1951")). Collins’s cylindrical algebraic decomposition gave a geometric method for eliminating quantifiers #cite(label("Collins1975")), and Canny established the polynomial-space upper bound for the existential fragment #cite(label("Canny1988")). For each fixed number of real quantifier blocks, Renegar’s decision bounds yield a polynomial-space algorithm #cite(label("Renegar1992II")) Theorem 1.1. This applies to the circuit encoding above: the quartic reduction in Lemma 22 preserves the two quantifier blocks. Our theorem places this two-block language in a fixed level of the counting hierarchy. Real quantifier hierarchies distinguish the number and order of blocks; Schaefer and Štefankovič develop their finite-encoding formulation #cite(label("SchaeferStefankovic2025")). The existential class already captures many geometric realization and continuous feasibility problems; Schaefer, Cardinal, and Miltzow survey these connections #cite(label("SchaeferCardinalMiltzow2026")).

The counting hierarchy gives a way to decide some exact algebraic questions without constructing their enormous intermediate integers. Allender, Bürgisser, Kjeldgaard-Pedersen, and Miltersen proved that $sans(P o s S L P)$—positivity of the integer output of a division-free straight-line program—belongs to $sans(C H)$ #cite(label("AllenderBurgisserKjeldgaardPedersenMiltersen2009")). Their modular-product and approximate Chinese-remainder techniques are the counting tools behind our treatment of implicit polynomial families. Every fixed counting level lies in $sans(P S P A C E)$: a depth-first simulation enumerates random choices and answers the fixed-depth oracle queries using polynomial space.

Recent counting-hierarchy bounds address other polynomial feasibility problems. Andrews, Garg, and Schost place Hilbert’s Nullstellensatz over $bb(Q)$ and several other fields in $sans(C H)$ #cite(label("AndrewsGargSchost2026")); the common zeros there lie in an algebraic closure. Balaji, Shirmohammadi, Tavenas, and Worrell prove counting-hierarchy bounds for approximate polynomial satisfiability over $bb(Q)$ and finite fields #cite(label("BalajiShirmohammadiTavenasWorrell2026")), where the question is membership of zero in the Zariski closure of a polynomial image over the algebraic closure. Exact real quantification must also control the reality of solutions, their attainment, and the dependence of a quantified fiber on its parameters. These are the issues addressed by the argument here.

Our algebraic tools belong to the critical-point and deformation methods of real algebraic geometry #cite(label("BasuPollackRoy2006")). Multiplication determinants are evaluated through the classical relation between residues and traces #cite(label("SchejaStorch1975")) #cite(label("CattaniDickensteinSturmfels1996")). We prove the needed identities and computational rules directly, including their behavior under parameter specialization. These computational rules apply to implicitly represented families that need not have short coefficient lists or arithmetic circuits.

=== 1.2 From quantified fibers to short algebraic witnesses <from-quantified-fibers-to-short-algebraic-witnesses>

Fix the existential tuple $x$. Introducing gate and auxiliary variables turns failure of $Phi \( x \, y \)$ into a real zero of a nonnegative quartic $F \( x \, z \)$, where $z$ includes $y$ and the auxiliaries. Thus we seek an $x$ for which the fiber $F \( x \, dot.op \)$ has no real zero. Call such an $x$ #emph[good]. Merely testing fibers does not provide a finite description of a good parameter. The main geometric argument produces such descriptions.

For $u gt.eq 0$, consider the minimum

$ m_x \( u \) = min_(z in bb(R)^n) (sum_(i = 1)^n z_i^6 + 6 u F \( x \, z \)) . $

The sixth powers keep bounded sublevel sets compact. It follows that $m_x \( u \)$ remains bounded as $u arrow.r oo$ precisely when the fiber has a zero. At a minimizing point the critical equations have pure fifth powers as their leading terms. Their quotient algebra has dimension $D = 5^n$, and multiplication by the minimized polynomial has a monic characteristic polynomial $Q \( x \, u \, Y \)$ satisfying $Q \( x \, u \, m_x \( u \) \) = 0$.

This identity supplies a uniform growth test: $x$ is good precisely when $m_x \( v^(D + 1) \) > v$ for all sufficiently large $v$. Form

$ E \( x \, v \) = Q \( x \, v^(D + 1) \, v \) . $

The coefficient of $v^D$ is always $1$, so $E \( x \, dot.op \)$ is never zero. Partition parameter space into the sets on which $E \( x \, dot.op \)$ has each possible degree. On each such degree piece, polynomial root bounds give a locally uniform threshold beyond which $E$ does not vanish. Continuity of the minimum then makes goodness locally constant on that piece. Introducing the reciprocal of its leading coefficient realizes the piece as a closed algebraic set. Both the good and nongood parts of this lift are closed.

A second minimization argument now extracts candidate coordinates. Choose a compact sublevel set of a coercive polynomial with a good point in its interior. Within this set, the good and nongood parts of the lift are separated. Minimize the coercive polynomial plus a growing nonnegative polynomial penalty that vanishes exactly on the lift, restricting to a compact neighborhood that avoids the nongood part. A subsequence of minimizers converges to a good point and is eventually interior to the neighborhood, so these minimizers satisfy the unconstrained critical equations. The highest parameter coefficients of their coordinate characteristic polynomials therefore vanish at the limit coordinates. This produces finitely indexed univariate polynomial families whose roots contain the coordinates of a suitable witness, without computing the good part or its connected components. Section 6 proves this geometric construction and completes the main theorem.

Two computational ingredients make these candidate coordinates usable. First, all polynomials just described have degree and logarithmic coefficient bounds with polynomial-length binary encodings, and their finite-field evaluations lie at fixed counting levels. We call such families #emph[controlled]. Sections 2 and 3 establish their closure rules and the evaluation of multiplication determinants without constructing the matrices.

Second, a chosen real root needs a short description even when its polynomial has exponential degree. Derivative signs distinguish real roots, as in Thom encodings #cite(label("BasuPollackRoy2006")), but the full sign string can be too long. Section 4 compresses that string to a weighted integer sum with weights computed modulo a short prime, and realizes the resulting label by a polynomial positivity test. Every desired real root can be isolated, including a root of a polynomial with multiplicities. The sign approximation uses geometric products of the type studied by Beigel, Reingold, and Spielman #cite(label("BeigelReingoldSpielman1995")). This arbitrary-root labeling rule and the coordinate construction are reusable ingredients of the proof.

Finally, Section 5 proves an existential decision procedure for controlled families. For a guessed coordinate description, we use it twice: the described parameter set must be nonempty, and it must contain no parameter with a zero of $F$. A suitable choice of root labels singles out the good point constructed above. All choices have polynomial total bit length, and all family constructions have fixed depth. Counting over these choices therefore gives one fixed level of the hierarchy.

== 2 Counting and controlled polynomial families <sec:counting>

The polynomials used below can have exponentially large degrees and coefficients with exponentially many bits. Their full expansions are therefore unsuitable as algorithmic data. We retain instead three pieces of information: a degree bound, a coefficient-norm bound, and a procedure for evaluation modulo a prime. This section develops the counting operations that preserve this description and recover the sign of an integer from it. The modular-product and approximate Chinese-remainder methods follow the arithmetic approach of Allender et al. #cite(label("AllenderBurgisserKjeldgaardPedersenMiltersen2009")) Section 4; we prove the forms, including the oracle bounds, that we need.

=== 2.1 Uniformity and counting <uniformity-and-counting>

Recall that $sans(C)_0 sans(P) = sans(P)$ and $sans(C)_(a + 1) sans(P) = union.big_(A in sans(C)_a sans(P)) sans(P P)^A$. Put

$ sans(F)_a = union.big_(A in sans(C)_a sans(P)) sans(F P)^A . $

A function in $sans(F)_a$ has polynomially bounded output length and is computed in polynomial bit time with one fixed oracle in $sans(C)_a sans(P)$. We call a function #emph[available] if it belongs to $sans(F)_a$ for some fixed $a$. A decision made by such a function belongs to $sans(C)_(a + 1) sans(P)$: a probabilistic oracle machine can perform the same computation and ignore its random bits.

The levels $sans(C)_a sans(P)$ are increasing and are closed under finite tagged unions. For the second assertion, induct on $a$, select the machine indicated by the tag, and replace its oracle by the tagged union of the finitely many lower-level oracles. Padding with unused random bits gives one polynomial random-bit bound. Consequently, polynomial-time computation using any fixed finite collection of available functions again gives an available function. This observation permits adaptive calls; it makes no assertion that adaptive access to $sans(P P)$ collapses to $sans(P P)$.

An integer or index is called #emph[short] if its binary encoding has length bounded by a fixed polynomial in the relevant input length. For a tuple, this means its total encoding length. A short integer may have exponentially large value. Every index range below has a fixed polynomial encoding bound, and every machine is fixed independently of the input. All algorithms are total: length and range checks prevent invalid accesses, and undefined arithmetic operations receive fixed defaults. Their asserted algebraic guarantees apply on the specified domains.

#thm([Lemma 2.1.])[
  (Counting and summation).  #emph[Fix $a gt.eq 0$. Let $b \( w \)$ and $s \( w \)$ be polynomially bounded nonnegative integers computable in polynomial time. If $A \( w \, i \)$, for $i in { 0 \, 1 }^(b \( w \))$, is a predicate computable in $sans(F)_a$, then 
$ C \( w \) = \# { i in { 0 \, 1 }^(b \( w \)) : A \( w \, i \) } $

 is in $sans(F)_(a + 1)$. Existential and universal quantification over these indices are also in $sans(F)_(a + 1)$.]
  #emph[If $f \( w \, i \)$ is in $sans(F)_a$ and $0 lt.eq f \( w \, i \) < 2^(s \( w \))$, then $sum_i f \( w \, i \)$ is in $sans(F)_(a + 1)$. The same conclusion holds for sums modulo a positive short integer.]
] <lem:counting>

#proof[
  Write $b = b \( w \)$. To test $C \( w \) > t$ for $0 lt.eq t lt.eq 2^b$, use one fair choice bit and $b$ further random bits. On the first choice accept exactly when $A \( w \, i \)$ holds; on the second accept on exactly $2^b - t$ of the $b$-bit strings. There are
  $ C \( w \) + 2^b - t $
  accepting choices, a strict majority precisely when $C \( w \) > t$. The computation of $A$ is polynomial time with a fixed $sans(C)_a sans(P)$ oracle, so the threshold language lies in $sans(C)_(a + 1) sans(P)$. Binary search recovers $C \( w \)$, whose encoding uses at most $b + 1$ bits. Unused random bits can pad this machine to a fixed polynomial bound without changing its majority test.
  The two quantified predicates follow by comparing the count with $0$ or $2^b$. For summation, count pairs $\( i \, j \)$ with $j in { 0 \, 1 }^(s \( w \))$ and $j < f \( w \, i \)$. The resulting integer has at most $b + s \( w \) + 1$ bits. Reduction modulo a short modulus takes polynomial bit time. Restrictions on the indices may be included in the predicate or implemented by zero summands. ◻
]

A sum over a tuple of indices uses one application of Lemma 2, as long as the tuple has polynomial total length. In particular, the number of counting levels does not grow with the number of coordinates in a grid.

#thm([Lemma 2.2.])[
  (Products in a finite field).  #emph[ Fix $a gt.eq 0$. Let $p$ be a prime of polynomial bit length and let $b \( w \)$ be polynomially bounded and computable in polynomial time. Suppose $f \( w \, p \, i \) in bb(F)_p$, for $i in { 0 \, 1 }^(b \( w \))$, is computable in $sans(F)_a$. Then 
$ product_(i in { 0 \, 1 }^(b \( w \))) f \( w \, p \, i \) med \( mod med p \) $

 is computable in $sans(F)_(a + 4)$. A restricted index range can be used by assigning factor $1$ outside it. The algorithm can be made total, with a fixed default when $p$ is not prime.]
] <lem:field-product>

#proof[
  Primality can be tested in $sans(F)_1$ by quantifying over possible divisors. For prime $p$, the multiplicative group $bb(F)_p^(*)$ is cyclic. Here is the elementary argument. Let $L$ be the least common multiple of the element orders. For each prime power dividing $L$, a power of some group element has exactly that prime-power order. The product of these elements has order $L$, since the orders are pairwise coprime. Thus $L lt.eq p - 1$. Every nonzero field element is a root of $z^L - 1$, so $p - 1 lt.eq L$ by the polynomial root bound. Hence $L = p - 1$.
  A nonzero $gamma in bb(F)_p$ is a generator precisely when
  $ gamma^e eq.not 1 med \( mod med p \) #h(2em) \( 1 lt.eq e lt.eq p - 2 \) . $
  Each power is computable in polynomial bit time. By Lemma 2, the universal test is in $sans(F)_1$. An existential search over a short interval of candidates, followed by binary search, therefore finds the least generator in $sans(F)_2$. For $p = 2$ the displayed range is empty and $gamma = 1$.
  First test whether any factor is zero, in which case the product is zero. Otherwise, each factor has a unique discrete logarithm $e_i in { 0 \, dots.h \, p - 2 }$ satisfying
  $ gamma^(e_i) = f \( w \, p \, i \) med \( mod med p \) . $
  Existential searches over intervals, again followed by binary search, recover $e_i$ in $sans(F)_(max \( a \, 2 \) + 1)$. Summation puts $sum_i e_i$ in $sans(F)_(max \( a \, 2 \) + 2)$. This sum is short, since it is less than $2^(b \( w \)) p$. Reduce it modulo $p - 1$ and raise $gamma$ to the resulting exponent. Since $max \( a \, 2 \) + 2 lt.eq a + 4$, all operations, including the zero test and primality check, fit the asserted level. ◻
]

If a function receives $p$ as an additional input, its polynomial bounds may use $\| w \| + "bitlength" \( p \)$. An application on a smaller input, however, must supply $p$ with length polynomial in that smaller input. We will distinguish such evaluation inputs from the data that describe the underlying polynomial family.

=== 2.2 Polynomial families accessible by evaluation <polynomial-families-accessible-by-evaluation>

Counting and finite-field products allow algebraic constructions without writing their coefficients. We now specify exactly what is retained about a polynomial, and prove that coefficient extraction and differentiation are compatible with this information. For an integer polynomial $V$, write $∥V∥_1$ for the sum of the absolute values of all its coefficients, in all its indeterminates.

#prodef([Definition 2.3.])[
  (Controlled polynomial family).  A family $V_w in bb(Z) \[ X_1 \, dots.h \, X_(n \( w \)) \]$ is #emph[controlled] if the following conditions hold.
  + The number $n \( w \)$ is polynomially bounded and computable in polynomial time.
  + Nonnegative short integers $d \( w \) \, b \( w \) \, lambda \( w \)$ are computable in polynomial time and satisfy
    $ deg V_w lt.eq d \( w \) \, #h(2em) ∥V_w∥_1 lt.eq 2^(b \( w \)) . $
    The zero polynomial is permitted and satisfies every nonnegative degree bound.
  + For some fixed $a$, evaluation
    $ \( w \, p \, z \) mapsto V_w \( z \) med mod med p \, #h(2em) z in bb(F)_p^(n \( w \)) \, $
    is in $sans(F)_a$ on prime inputs $p > lambda \( w \)$. Field elements are given by their least nonnegative binary representatives.
  The integers $d \, b \, lambda$ depend only on $w$, not on the evaluation prime or evaluation point.
] <def:controlled>

The word $w$ may include discrete choices and short indices. When members $V_(w \, i)$ are summed or multiplied over an index set, the total length of $i$ is bounded by a fixed polynomial in $\| w \|$, evaluation is uniform in $i$, and we use bounds uniform over the allowed indices. For example, if $\| i \| lt.eq q \( \| w \| \)$ and each of $d \, b \, lambda$ has at most $r \( \| w \| + \| i \| \)$ bits, for fixed increasing polynomials $q \, r$, then $2^(r \( \| w \| + q \( \| w \| \) \))$ bounds all three uniformly. This enlarged bound is computable from $w$ alone, without enumerating the indices or testing which members will be used. All families in the argument arise from fixed constructions; no machine describing a family is supplied as part of the input.

#thm([Lemma 2.4.])[
  (Finite-field coefficient extraction).  #emph[Let $V_w \( x \, t \)$ be a controlled family, where $x = \( x_1 \, dots.h \, x_h \)$ is a selected subset of its indeterminates and $t$ denotes the remaining ones. Let $beta in bb(N)^h$ be a short index. Then $\[ x^beta \] V_w \( x \, t \)$ is a controlled family, uniformly in $beta$. If the evaluation of $V$ is in $sans(F)_a$, the coefficient evaluations are in $sans(F)_(a + 1)$, with cutoff $max \( lambda \, d + 1 \)$, degree bound $d$, and coefficient-norm bound $2^b$.]
] <lem:field-coefficient>

#proof[
  Return the zero polynomial if some $beta_i > d$ or $\| beta \| > d$. Otherwise let $p > max \( lambda \, d + 1 \)$ be prime and specialize $t$ to a point of the corresponding prime field. In $bb(F)_p$,
  #[#set math.equation(numbering: n => "(2.1)")
   $ \[ x^beta \] V_w \( x \, t \) = \( p - 1 \)^(- h) sum_(z in \( bb(F)_p^(*) \)^h) V_w \( z \, t \) z^(- beta) . $ <eq:field-coefficient>]
  To see this, expand $V$ in monomials. The sum of $z^e$ over $bb(F)_p^(*)$ is zero unless $p - 1$ divides $e$, in which case it is $p - 1$. For each coordinate, the difference between a monomial exponent and $beta_i$ lies strictly between $- \( p - 1 \)$ and $p - 1$; the only multiple possible is zero. This proves the identity. The scalar $p - 1$ is nonzero in the field.
  Since $h lt.eq n \( w \)$ is polynomially bounded in $\| w \|$, the tuple $z$ uses $h "bitlength" \( p \)$ bits, polynomial in the evaluation input length. This tuple is internal to one evaluation procedure; it is not a family index used to define a new prime cutoff. The cutoff remains $max \( lambda \( w \) \, d \( w \) + 1 \)$, regardless of $p$. The nonzero-coordinate restrictions can be enforced by zero summands, and powers and inverses are computable in polynomial bit time. Lemma 2 therefore evaluates the sum in $sans(F)_(a + 1)$. Extracting coefficients only removes terms and their $x$ exponents, so it does not increase degree or coefficient norm. If $h = 0$, the identity is the single empty-tuple summand and the same conclusion holds. ◻
]

#thm([Proposition 2.5.])[
  (Closure of controlled families).  #emph[Controlled families are preserved by each of the following operations, applied a fixed number of times:]
  + #emph[sums and products over short index sets, with uniform bounds on the summands or factors;]
  + #emph[powers with short nonnegative exponents computable in polynomial time, and substitution of controlled polynomials for indeterminates;]
  + #emph[extraction of indexed coefficients in any subset of the indeterminates, and differentiation in one variable to a short indexed nonnegative order.]
  #emph[In the first operation the index domain is specified in polynomial time; more generally, an available predicate $A \( w \, i \)$ may restrict the indices when polynomial-time uniform bounds for the unrestricted domain are retained. This predicate depends only on the primary word and the family index, not on an evaluation prime or evaluation point. All resulting bounds and prime cutoffs are computable in polynomial bit time from the primary family data. In particular, they are independent of evaluation primes.]
] <prop:controlled-closure>

#proof[
  For sums and products, suppose there are at most $L$ members, with common degree bound $d$, norm bound $2^b$, and cutoff $lambda$, where $L$ is short and computable in polynomial time. The triangle inequality and submultiplicativity of coefficient norm give the bounds
  $ & upright("degree") & upright("logarithmic norm bound")\
upright("sum") & d & b + "bitlength" \( L + 1 \)\
upright("product") & L d & L b . $
  Empty sums and products are $0$ and $1$. The bounds can be enlarged in these cases if necessary. Evaluations follow from Lemmas 2 and 3. An available restriction is tested while evaluating a summand or factor, with the neutral value used outside the range. Tagged unions combine the fixed collection of evaluation and restriction oracles.
  For a nonnegative short exponent $e$, the bounds for $V^e$ are $e d$ and $e b$; when $e = 0$, the polynomial is $1$. Evaluation uses ordinary modular powering with a short exponent. Suppose next that $V$ has bounds $d \, 2^b$, and that each substitute has bounds $d' \, 2^(b')$. Termwise substitution gives degree at most $d d'$ and norm at most
  $ 2^b \( 2^(b') \)^d = 2^(b + d b') . $
  Include unchanged variables among the substitutes when needed. Evaluation first computes the polynomially many substituted values and then evaluates $V$ at them. The maximum of the cutoffs of these calls is a suitable cutoff for the composition. Uniform bounds over a polynomially indexed collection of substitutes are taken before choosing the evaluation prime, as in Definition 4.
  Coefficient extraction is Lemma 5. For differentiation, write $x$ for the selected variable and $t$ for the others. If the requested order $j$ exceeds $d$, return zero. For $0 lt.eq j lt.eq d$ we have
  #[#set math.equation(numbering: n => "(2.2)")
   $ frac(partial^j V, partial x^j) \( x \, t \) = sum_(k = j)^d \( k \)_j thin \[ x^k \] V \( x \, t \) thin x^(k - j) \, #h(2em) \( k \)_j = product_(v = 0)^(j - 1) \( k - v \) . $ <eq:indexed-derivative>]
  The empty product for $j = 0$ is $1$. Modulo a prime above $max \( lambda \, d + 1 \)$, the coefficient polynomials are available by Lemma 5; the falling factorials are available by Lemma 3; and the outer sum is available by Lemma 2. All indices are short, even when $j$ or $d$ is exponentially large. For example, an $sans(F)_a$ evaluator for $V$ gives an $sans(F)_(a + 5)$ evaluator for the derivative by these bounds. Differentiation does not increase degree, and
  $ ∥frac(partial^j V, partial x^j)∥_1 lt.eq max \( d \, 1 \)^d ∥V∥_1 lt.eq 2^(b + d^2 + 1) . $
  Thus the derivative has short, polynomial-time computable bounds.
  Every arithmetic operation used to obtain these degree, norm, and cutoff bounds is on short integers. A fixed number of the constructions therefore leaves all bounds short and all evaluation procedures at a fixed counting level. The hypothesis of fixed nesting is essential: the proposition does not assert closure under an input-dependent sequence of successive counting operations. ◻
]

Ordinarily encoded short integers are controlled constant families. The same holds for much larger constants such as $2^e$ with a short nonnegative exponent $e$: its logarithmic norm bound is $e$, and its residue is obtained by modular powering. Such a constant is used through its residues and bounds, not through its full binary expansion.

=== 2.3 Recovering an integer sign <recovering-an-integer-sign>

The closure rules give modular evaluations and magnitude bounds for integer families, including integers too large to write down. It remains to recover their signs. A collection of prime residues mathematically determines such an integer, but constructing its full Chinese-remainder representative may require exponentially many bits. We instead approximate the integer divided by a sufficiently large prime product, modulo one. Successive doublings bring a nonzero quotient far enough from zero to reveal its sign.

#thm([Proposition 2.6.])[
  (Sign from residues).  #emph[Let $X \( w \) in bb(Z)$ and suppose that nonnegative short integers $m \( w \)$ and $lambda \( w \)$ are computable in polynomial time, with $\| X \( w \) \| lt.eq 2^(m \( w \))$. Define 
#[#set math.equation(numbering: n => "(2.3)")
 $ Z = max \( 16 \, m \, lambda \) \, #h(2em) Y = 2 Z^4 . $ <eq:crt-bounds>]

 If $X \( w \) med mod med p$, represented in ${ 0 \, dots.h \, p - 1 }$, is uniformly computable in $sans(F)_a$ for primes $lambda < p lt.eq Y$, then $"sgn" X \( w \)$ is in $sans(F)_(max \( a \, 5 \) + 3)$.]
] <prop:crt-sign>

#proof[
  Let $cal(P)$ consist of the primes $lambda < p lt.eq Y$, and write $Pi = product_(p in cal(P)) p$. The product $Pi$ is used only in the proof, not stored by the algorithm. We first show that it is large enough. Since $Y$ is even,
  $ binom(Y, Y \/ 2) gt.eq frac(2^Y, Y + 1) . $
  The exponent of a prime $p$ in this binomial coefficient is the sum of
  $ ⌊Y / p^j⌋ - 2 ⌊frac(Y \/ 2, p^j)⌋ in { 0 \, 1 } #h(2em) \( p^j lt.eq Y \) . $
  Consequently, the total power of any one prime dividing the binomial coefficient is at most $Y$. If $pi \( Y \)$ is the number of primes at most $Y$, then
  $ pi \( Y \) log_2 Y gt.eq Y - log_2 \( Y + 1 \) gt.eq Y \/ 2 . $
  Because $log_2 Y lt.eq 5 Z$, at least $Z^3 \/ 5$ primes are at most $Y$. Removing the at most $lambda lt.eq Z$ primes below the cutoff leaves at least $3 Z$ primes. With $b_Y = "bitlength" \( Y \)$, we obtain
  #[#set math.equation(numbering: n => "(2.4)")
   $ 2^(3 Z) lt.eq Pi lt.eq 2^(Y b_Y) \, #h(2em) \| X \/ Pi \| < 1 \/ 6 . $ <eq:crt-product-bounds>]
  For each $0 lt.eq k lt.eq Y b_Y + 1$ and $p in cal(P)$, set
  #[#set math.equation(numbering: n => "(2.5)")
   $ c_(p \, k) = 2^k X \( Pi \/ p \)^(- 1) med \( mod med p \) \, #h(2em) 0 lt.eq c_(p \, k) < p . $ <eq:crt-residues>]
  To compute $\( Pi \/ p \) med mod med p$, take a product modulo $p$ over all other primes in $cal(P)$. The primality and range tests are in $sans(F)_1$, so Lemma 3 puts this product in $sans(F)_5$. It is nonzero. Modular inversion, modular powering, and the assumed residues of $X$ therefore compute $c_(p \, k)$ in $sans(F)_(max \( a \, 5 \))$. All arguments are short, including $k$.
  Chinese remaindering gives the identity
  #[#set math.equation(numbering: n => "(2.6)")
   $ sum_(p in cal(P)) c_(p \, k) / p equiv frac(2^k X, Pi) med \( mod med 1 \) . $ <eq:crt-circle-identity>]
  Indeed, multiplying the difference by $Pi$ gives an integer divisible by every prime in $cal(P)$. Put $B_Y = b_Y + 10$ and form the short dyadic number
  $ w_k = 2^(- B_Y) (sum_(p in cal(P)) ⌊frac(2^(B_Y) c_(p \, k), p)⌋ med mod med 2^(B_Y)) in \[ 0 \, 1 \) . $
  There are fewer than $2^(b_Y)$ summands, each rounded down by less than $2^(- B_Y)$. Thus, for circular distance $"dist"_(bb(R) \/ bb(Z)) \( u \, v \) = min_(ell in bb(Z)) \| u - v - ell \|$,
  #[#set math.equation(numbering: n => "(2.7)")
   $ "dist"_(bb(R) \/ bb(Z)) (w_k \, frac(2^k X, Pi)) < 2^(- 10) . $ <eq:crt-circle-error>]
  The scaled sum has at most $2 b_Y + 11$ bits, and Lemma 2 computes $w_k$ in $sans(F)_(max \( a \, 5 \) + 1)$.
  Call $k$ #emph[flagged] when $1 \/ 8 lt.eq w_k lt.eq 7 \/ 8$. If $X = 0$, every $c_(p \, k)$ is zero, so no index is flagged. If $X eq.not 0$, let $k_0$ be the first index with $\| 2^(k_0) X \/ Pi \| gt.eq 1 \/ 6$. Equation (2.4) implies that $0 < k_0 lt.eq Y b_Y + 1$, and minimality gives
  $ 1 \/ 6 lt.eq \| 2^(k_0) X \/ Pi \| < 1 \/ 3 . $
  The error bound therefore makes $k_0$ flagged.
  At the first flagged index $k$, we have $k lt.eq k_0$ and $\| 2^k X \/ Pi \| < 1 \/ 3$. If $X > 0$, its residue modulo one lies in $\( 0 \, 1 \/ 3 \)$; if $X < 0$, the residue lies in $\( 2 \/ 3 \, 1 \)$. An approximation that wraps across $0 = 1$ must be within $2^(- 10)$ of that endpoint and so cannot be flagged. It follows that $w_k < 1 \/ 2$ in the positive case and $w_k > 1 \/ 2$ in the negative case. Figure 1 records this separation.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0.38), (3.533, 0.7), fill: rgb("#e0e0ff"), stroke: none)
  rect((7.067, 0.38), (10.6, 0.7), fill: rgb("#ffe8d1"), stroke: none)
  line((0, 0.54), (3.533, 0.54), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((7.067, 0.54), (10.6, 0.54), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
  content((1.767, 0.7), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$X>0$]]], anchor: "south", padding: 0.1176cm)
  content((8.833, 0.7), [#text(fill: rgb("#cc6600"))[#text(size: 9pt)[$X<0$]]], anchor: "south", padding: 0.1176cm)
  line((-0.265, 0), (10.86, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 0.045), (0, -0.045), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.06), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((1.325, 0.045), (1.325, -0.045), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.325, -0.06), [#text(size: 9pt)[$frac(1, 8)$]], anchor: "north", padding: 0.1176cm)
  line((3.533, 0.045), (3.533, -0.045), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.533, -0.06), [#text(size: 9pt)[$frac(1, 3)$]], anchor: "north", padding: 0.1176cm)
  line((5.3, 0.045), (5.3, -0.045), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.3, -0.06), [#text(size: 9pt)[$frac(1, 2)$]], anchor: "north", padding: 0.1176cm)
  line((7.067, 0.045), (7.067, -0.045), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.067, -0.06), [#text(size: 9pt)[$frac(2, 3)$]], anchor: "north", padding: 0.1176cm)
  line((9.275, 0.045), (9.275, -0.045), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((9.275, -0.06), [#text(size: 9pt)[$frac(7, 8)$]], anchor: "north", padding: 0.1176cm)
  line((10.6, 0.045), (10.6, -0.045), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.6, -0.06), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  line((1.325, -0.75), (9.275, -0.75), stroke: (paint: rgb("#595959"), thickness: 2.0pt, miter-limit: 10))
  content((5.3, -0.82), [#text(size: 9pt)[flagging window for $w_k$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: At the first flagged index, the true residue $\( 2^k X \/ Pi \) med mod med 1$ lies in the left interval for $X > 0$ and the right interval for $X < 0$. The circular error of $w_k$ is less than $2^(- 10)$. The flagging window excludes any approximation that wraps across $0 = 1$, so the side of $1 \/ 2$ determines the sign. ],
  ) <fig:crt-sign>
  The first-flag condition uses one universal quantifier over smaller short indices, raising the level for $w_k$ by one. Existentially quantifying a first flagged index with $w_k < 1 \/ 2$, or with $w_k > 1 \/ 2$, raises it once more. These tests return the positive or negative sign; if neither succeeds, return zero. This is the asserted $sans(F)_(max \( a \, 5 \) + 3)$ procedure. ◻
]

#thm([Corollary 2.7.])[
  (Signs of controlled integers).  #emph[If a controlled family has no indeterminates, its sign is available, uniformly in any short indices belonging to its input word.]
] <cor:controlled-sign>

#proof[
  Apply Proposition 7 with the logarithmic norm bound $b$ in place of $m$ and with the family’s cutoff $lambda$. ◻
]

We can now manipulate polynomials through short bounds and modular evaluation procedures. The next step is to show that a characteristic polynomial of multiplication in a finite polynomial quotient admits exactly this description, even when the quotient has exponentially large rank.

== 3 Multiplication determinants without large matrices <sec:algebra>

The geometric constructions below produce polynomial systems whose leading terms are pure powers. Their quotient algebras have explicit monomial bases, but those bases can be exponentially large. The goal of this section is to compute characteristic polynomials of multiplication in these algebras as controlled families, without constructing the multiplication matrices. We first express a trace as a coefficient, and then recover characteristic coefficients from traces by fixed-depth finite-field computations.

=== 3.1 A basis and a coefficient functional <a-basis-and-a-coefficient-functional>

Let $S$ be a commutative ring with identity, let $n gt.eq 1$ and $ell gt.eq 2$, and suppose that $r_1 \, dots.h \, r_n in S \[ x_1 \, dots.h \, x_n \]$ satisfy $deg_x r_i < ell$. Set

#[#set math.equation(numbering: n => "(3.1)")
 $ f_i = x_i^ell - r_i \, #h(2em) cal(A) = S \[ x_1 \, dots.h \, x_n \] \/ \( f_1 \, dots.h \, f_n \) \, #h(2em) D = ell^n \, #h(2em) tau = \( ell - 1 \, dots.h \, ell - 1 \) . $ <eq:quotient-algebra>]

For a multi-index $a$, write $\| a \| = sum_i a_i$ and $x^a = product_i x_i^(a_i)$. We will show that the $D$ monomials $x^a$ with $0 lt.eq a_i < ell$ form an $S$-basis of $cal(A)$.

We use formal Laurent sums whose total degrees are bounded above and whose support in each total degree is finite. Addition and multiplication are well defined: for any prescribed total degree, only finitely many pairs of degrees and finitely many terms can contribute. Since $r_i x_i^(- ell)$ has total degree at most $- 1$, its geometric series is such a Laurent sum. Define the $S$-linear functional

#[#set math.equation(numbering: n => "(3.2)")
 $ cal(L) \( v \) = \[ x_1^(- 1) dots.h.c x_n^(- 1) \] v \( x \) product_(i = 1)^n (x_i^(- ell) sum_(j gt.eq 0) \( r_i \( x \) x_i^(- ell) \)^j) . $ <eq:laurent-functional>]

This is a formal coefficient extraction, requiring neither convergence nor division in $S$. It is a concrete residue formula of the type studied in #cite(label("CattaniDickensteinSturmfels1996")); we prove the facts needed here directly over $S$.

#thm([Lemma 3.1.])[
  #emph[The functional $cal(L)$ vanishes on $\( f_1 \, dots.h \, f_n \)$ and hence descends to $cal(A)$. If $deg_x v lt.eq n \( ell - 1 \)$, then 
#[#set math.equation(numbering: n => "(3.3)")
 $ cal(L) \( v \) = \[ x^tau \] v . $ <eq:low-degree-functional>]

 The algebra $cal(A)$ is a free $S$-module with basis ${ x^a : 0 lt.eq a_i < ell }$.]
] <lem:monomial-basis>

#proof[
  Multiplying the expression in Equation (3.2) by $f_i = x_i^ell - r_i$ cancels its $i$th geometric factor. In the remaining expression, every exponent of $x_i$ is nonnegative: the other denominators are powers of the other variables, while all numerators are polynomials. Its coefficient with $x_i$-exponent $- 1$ is zero. Thus $cal(L) \( v f_i \) = 0$ for every polynomial $v$.
  Expanding all the geometric factors gives the finite sum
  #[#set math.equation(numbering: n => "(3.4)")
   $ cal(L) \( v \) = sum_(j in bb(Z)_(gt.eq 0)^n) \[ x^(tau + ell j) \] (v product_(i = 1)^n r_i^(j_i)) . $ <eq:laurent-coefficient-sum>]
  The target degree in a summand is $n \( ell - 1 \) + ell \| j \|$, whereas the numerator has degree at most $deg_x v + \( ell - 1 \) \| j \|$. A nonzero summand therefore requires
  #[#set math.equation(numbering: n => "(3.5)")
   $ \| j \| lt.eq deg_x v - n \( ell - 1 \) . $ <eq:residue-truncation>]
  This proves finiteness and Equation (3.3).
  The relations $x_i^ell = r_i$ express every monomial as a linear combination of the proposed basis elements: each replacement strictly decreases total $x$-degree. For independence, consider
  $ P_(a \, b) = cal(L) \( x^a x^(tau - b) \) \, #h(2em) a \, b in { 0 \, dots.h \, ell - 1 }^n . $
  Equation (3.3) gives $P_(a \, b) = 0$ if $\| a \| < \| b \|$, and $P_(a \, b) = delta_(a \, b)$ if $\| a \| = \| b \|$. Ordering both index sets by total degree makes $P$ block triangular with identity diagonal blocks. It is therefore invertible over $S$. Pairing any linear relation among the proposed basis elements against all $x^(tau - b)$ forces all its coefficients to be zero. ◻
]

=== 3.2 A trace formula and its spectral consequences <a-trace-formula-and-its-spectral-consequences>

Let $M_v$ denote the matrix of multiplication by the class of $v in S \[ x \]$ in this basis, and put

#[#set math.equation(numbering: n => "(3.6)")
 $ J \( x \) = det #scale(x: 120%, y: 120%)[\(] partial_j f_i \( x \) #scale(x: 120%, y: 120%)[\)]_(1 lt.eq i \, j lt.eq n) . $ <eq:jacobian>]

The following classical trace–residue identity is associated with Scheja and Storch #cite(label("SchejaStorch1975")); see also #cite(label("CattaniDickensteinSturmfels1996")) Author version, Equation (4.7). Its proof uses the dual-basis property of a Bezoutian, a construction developed further in #cite(label("ElkadiMourrain2005")) Section 3.3. The explicit proof matters here because we need arbitrary coefficient rings and specialization at multiple zeros.

#thm([Proposition 3.2.])[
  (Trace formula).  #emph[For the algebra in Equation (3.1), over every commutative ring $S$ with identity, 
#[#set math.equation(numbering: n => "(3.7)")
 $ "tr" \( M_v \) = cal(L) \( v J \) #h(2em) \( v in S \[ x \] \) . $ <eq:trace-formula>]

]
] <prop:trace>

#proof[
  Introduce another set of variables $x' = \( x'_1 \, dots.h \, x'_n \)$. Changing one variable at a time gives polynomial divided differences $W_(i j) \( x \, x' \)$ such that
  $ f_i \( x \) - f_i \( x' \) = sum_(j = 1)^n W_(i j) \( x \, x' \) \( x_j - x'_j \) . $
  Each $W_(i j)$ has combined $\( x \, x' \)$-degree at most $ell - 1$. Let $W = det \( W_(i j) \)$. In $cal(A) ⊗_S cal(A)$, the left sides vanish, so multiplication by the adjugate matrix gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ W \( x \, x' \) \( x_j - x'_j \) = 0 #h(2em) \( 1 lt.eq j lt.eq n \) . $ <eq:diagonal-annihilation>]
  Apply $cal(L)$ in the second factor, writing this map as $cal(L)_(x')$. Since $deg_(x') W lt.eq n \( ell - 1 \)$, Lemma 9 gives $cal(L)_(x') \( W \) = \[ \( x' \)^tau \] W$. This coefficient is $1$. Indeed, the part of combined degree $ell - 1$ in the divided-difference matrix is diagonal, with $i$th diagonal entry
  $ x_i^(ell - 1) + x_i^(ell - 2) x'_i + dots.h.c + \( x'_i \)^(ell - 1) . $
  The contributions from the $r_i$ have combined degree at most $ell - 2$. To obtain the $\( x' \)^tau$ coefficient, whose total degree is $n \( ell - 1 \)$, one must use the last term of every displayed diagonal entry. The target exhausts the combined-degree bound, so no positive $x$-degree can occur in this coefficient.
  Equation (3.8) now yields the reproducing identity
  #[#set math.equation(numbering: n => "(3.9)")
   $ cal(L)_(x') #scale(x: 120%, y: 120%)[\(] W \( x \, x' \) v \( x' \) #scale(x: 120%, y: 120%)[\)] = v \( x \) quad upright("in ") cal(A) : $ <eq:reproducing-identity>]
  within a product with $W$, each $x'_j$ can be replaced by $x_j$. Expand $W = sum_a x^a w_a \( x' \)$ in the first monomial basis of the tensor product. Equation (3.9) says that the $x^a$-coordinate of $v$ is $cal(L) \( w_a v \)$. In particular, the $a$th diagonal entry of $M_v$ is $cal(L) \( w_a v x^a \)$. The multiplication map $cal(A) ⊗_S cal(A) arrow.r cal(A)$ identifies $sum_a x^a w_a \( x \)$ with $W \( x \, x \)$, so
  $ "tr" \( M_v \) = cal(L) #h(-0.16667em) (v sum_a x^a w_a \( x \)) = cal(L) #scale(x: 120%, y: 120%)[\(] v W \( x \, x \) #scale(x: 120%, y: 120%)[\)] . $
  On the diagonal $x' = x$, divided differences become derivatives; hence $W \( x \, x \) = J \( x \)$, proving the formula. ◻
]

Both the basis and the trace formula commute with every change of coefficient ring. In particular, parameters may be specialized and coefficients reduced modulo a prime without assuming that the common zeros are distinct. The following elementary fact explains how the characteristic polynomials will encode real critical values.

#thm([Lemma 3.3.])[
  #emph[Suppose that the coefficients of the relations in Equation (3.1) and of $v$ lie in $bb(C)$, and write $Q \( y \) = det \( y I - M_v \)$. Every common zero $xi in bb(C)^n$ of the $f_i$ satisfies $Q \( v \( xi \) \) = 0$. If all coefficients are real and $eta$ is a simple real root of $Q$, there is a common zero $xi in bb(R)^n$ with $v \( xi \) = eta$. Moreover, for any polynomial $g$ over $bb(C)$, 
#[#set math.equation(numbering: n => "(3.10)")
 $ M_(g \( v \)) = g \( M_v \) \, #h(2em) det M_(g \( v \)) = product_(Q \( alpha \) = 0) g \( alpha \) \, $ <eq:composition-determinant>]

 where the roots in the product are counted with multiplicity.]
] <lem:real-eigenline>

#proof[
  Evaluation at a common zero $xi$ is a nonzero linear functional on $cal(A)$, since it sends $1$ to $1$. It satisfies $"ev"_xi \( v w \) = v \( xi \) "ev"_xi \( w \)$, so it is a left eigenvector of $M_v$ with eigenvalue $v \( xi \)$.
  For real coefficients, a simple real eigenvalue $eta$ of the real matrix $M_v$ has a one-dimensional real eigenspace. Each coordinate multiplication matrix $M_(x_i)$ commutes with $M_v$ and therefore preserves this line. Let $xi_i in bb(R)$ be its scalar action there. Restricting the matrix identities
  $ f_i \( M_(x_1) \, dots.h \, M_(x_n) \) = 0 \, #h(2em) v \( M_(x_1) \, dots.h \, M_(x_n) \) = M_v $
  to the line gives $f_i \( xi \) = 0$ and $v \( xi \) = eta$. Finally, multiplication respects sums and products, giving the first identity in Equation (3.10); triangularizing $M_v$ over $bb(C)$ gives the second. ◻
]

=== 3.3 Characteristic coefficients from finite-field evaluations <characteristic-coefficients-from-finite-field-evaluations>

We now turn the trace formula into a uniform computation. All the large sums below are indexed by tuples of polynomial bit length. Each entire tuple is a single counting index; the number of its coordinates does not increase the number of counting levels. We state the evaluation bound separately, so that later applications with elementary evaluators can retain their sharper level count.

#thm([Proposition 3.4.])[
  (Indexed characteristic coefficients).  #emph[Consider fixed families $r_1 \, dots.h \, r_n \, v in bb(Z) \[ x \]$, indexed by a word of length $N$. Suppose that $n gt.eq 1$ is polynomially bounded and polynomial-time computable, that $ell gt.eq 2$ and $Omega gt.eq 0$ are short polynomial-time computable integers, and that $deg_x r_i < ell$ and $deg_x v lt.eq Omega$. Put 
$ f_i = x_i^ell - r_i \, #h(2em) J = det \( partial_j f_i \) \, #h(2em) D = ell^n \, #h(2em) L_0 = D Omega + n \( ell - 1 \) . $

 For $a gt.eq 0$, suppose that $v$, the indexed $r_i$, and $J$ can be evaluated uniformly in $sans(F)_a$ over prime fields with 
#[#set math.equation(numbering: n => "(3.11)")
 $ p > n \( ell - 1 \) + ell L_0 + D^2 + 10 . $ <eq:char-prime-bound>]

 Additional short, polynomial-time computable lower cutoffs on $p$ are allowed. Then, for every $0 lt.eq d lt.eq D$, 
$ \[ y^d \] det \( y I - M_v \) med \( mod med p \) $

 is uniformly computable in $sans(F)_(a + 8)$ in this prime range. All running-time and query-length bounds are polynomial in the length of the input, including $p$ and the coefficient index $d$.]
] <prop:char-coeff>

#proof[
  First compute the trace residues $t_k = "tr" \( M_v^k \) med mod med p$ for short indices $1 lt.eq k lt.eq D$. By Proposition 10, $M_v^k = M_(v^k)$, and Equation (3.4),
  #[#set math.equation(numbering: n => "(3.12)")
   $ t_k = sum_(j in bb(Z)_(gt.eq 0)^n\
\| j \| lt.eq L_0) \[ x^(tau + ell j) \] (v^k J product_(i = 1)^n r_i^(j_i)) med \( mod med p \) . $ <eq:trace-extraction>]
  Indeed, $deg_x J lt.eq n \( ell - 1 \)$, so $deg_x \( v^k J \) lt.eq L_0$ and Equation (3.5) justifies the truncation. In a retained summand, the numerator degree is at most $L_0 + \( ell - 1 \) L_0 = ell L_0$, and the target degree is at most $n \( ell - 1 \) + ell L_0$.
  The prime bound makes both degrees less than $p - 1$. The finite-field identity in Equation (2.1) therefore extracts each coefficient by a sum over $\( bb(F)_p^(*) \)^n$. At a point $z$ of this grid, its numerator is evaluated as
  $ v \( z \)^k J \( z \) product_(i = 1)^n r_i \( z \)^(j_i) . $
  This uses only polynomially many evaluations and ordinary modular powering with short exponents, so lies in $sans(F)_a$. The grid sum and then the sum over $j$, by Lemma 2, place $t_k$ in $sans(F)_(a + 2)$. In particular, a pair $\( j \, z \)$ has at most
  $ n ceil.l log_2 \( L_0 + 1 \) ceil.r + n ceil.l log_2 p ceil.r $
  bits, up to fixed padding and delimiters.
  To recover characteristic coefficients from traces, recall the formal identity for an integer matrix $A$ of dimension $D$:
  #[#set math.equation(numbering: n => "(3.13)")
   $ det \( I - z A \) = exp (- sum_(k gt.eq 1) frac("tr" \( A^k \), k) z^k) quad upright("in ") bb(Q) \[ \[ z \] \] . $ <eq:log-determinant>]
  Triangularizing over $bb(C)$ reduces this to the power-series identity $log \( 1 - z alpha \) = - sum_(k gt.eq 1) alpha^k z^k \/ k$ for each diagonal entry, and the resulting equality has rational coefficients. This reconstruction of characteristic coefficients from residue traces also appears in #cite(label("CattaniDickensteinSturmfels1996")) Author version, Section 5, Equations (5.7)–(5.9).
  The matrix identity proves the required coefficient equality; the computation uses only the indexed traces. Using their residues, define over $bb(F)_p$
  #[#set math.equation(numbering: n => "(3.14)")
   $ E_v \( z \) = sum_(j = 0)^D frac(1, j !) (- sum_(k = 1)^D t_k / k z^k)^j . $ <eq:truncated-exponential>]
  Every discarded term of the exponential identity has degree greater than $D$. All retained denominators are products of integers at most $D$, and $p > D$ by Equation (3.11). Thus reduction of the rational identity modulo $p$ is valid through degree $D$ and gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ E_v \( z \) equiv det \( I - z M_v \) med \( mod med z^(D + 1) \) . $ <eq:exponential-congruence>]
  At a given field element $z$, the inner sum in Equation (3.14) is in $sans(F)_(a + 3)$. By Lemma 2.2, the factorial $j ! med mod med p$ is in $sans(F)_4$, with $0 ! = 1$. Modular inversion and powering take polynomial time. Consequently the outer sum evaluates $E_v \( z \)$ in $sans(F)_(max \( a + 3 \, 4 \) + 1)$. This entire polynomial has degree at most $D^2 < p - 1$. A final application of Equation (2.1), in one variable, extracts a coefficient in $sans(F)_(max \( a + 3 \, 4 \) + 2)$, which is contained in $sans(F)_(a + 8)$. The required coefficient is obtained from
  $ \[ y^d \] det \( y I - M_v \) = \[ z^(D - d) \] det \( I - z M_v \) = \[ z^(D - d) \] E_v \( z \) . $
  The procedure checks primality and the numerical bounds first and returns a fixed default outside the stated range. Primality is available in $sans(F)_1$ by a divisor test, so these checks fit the asserted level. No step assumes squarefreeness modulo $p$. ◻
]

=== 3.4 The determinant rule for controlled families <the-determinant-rule-for-controlled-families>

The preceding computation provides residues. To obtain a controlled family, we also need degree and coefficient-norm bounds before specialization. The decreasing degree in the reduction relations supplies these bounds directly.

#thm([Proposition 3.5.])[
  (Multiplication determinant rule).  #emph[Let $n gt.eq 1$ be polynomially bounded and polynomial-time computable, and let $ell gt.eq 2$ be a short polynomial-time computable integer. Suppose that $r_1 \, dots.h \, r_n \, v$ are controlled integer polynomial families in variables $x = \( x_1 \, dots.h \, x_n \)$ and a polynomially bounded number of parameter variables $t$, uniformly in $i$, and that $deg_x r_i < ell$. In the monomial basis of 
$ bb(Z) \[ t \, x \] \/ \( x_1^ell - r_1 \, dots.h \, x_n^ell - r_n \) \, $

 let $M_v$ denote multiplication by $v$. Then 
#[#set math.equation(numbering: n => "(3.16)")
 $ Q \( t \, y \) = det \( y I - M_v \) $ <eq:controlled-characteristic>]

 is a controlled family, monic of $y$-degree $D = ell^n$. If $d$ and $2^b$ are common total-degree and coefficient-norm bounds on the $r_i \, v$, and $T = d + n \( ell - 1 \)$, valid total-degree and log-norm bounds on $Q$ are 
#[#set math.equation(numbering: n => "(3.17)")
 $ d_Q = D #scale(x: 120%, y: 120%)[\(] 1 + d \( 1 + T \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) b_Q = D^2 + D #scale(x: 120%, y: 120%)[\(] 1 + b \( 1 + T \) #scale(x: 120%, y: 120%)[\)] . $ <eq:determinant-size-bounds>]

 The construction is compatible with specializing any parameters.]
] <prop:multiplication-determinant>

#proof[
  Lemma 9, with $S = bb(Z) \[ t \]$, defines the matrix and gives its dimension $D$ and compatibility with every specialization. Although $D$ need not be polynomially bounded, its binary length is at most $1 + n ceil.l log_2 ell ceil.r$; hence it is short and computable in polynomial time.
  For a basis monomial $x^a$, reduce $v x^a$ to the basis by replacing an offending factor $x_i^ell$ by $r_i$. In each round, perform one such replacement on every monomial that still requires reduction, using a fixed choice of $i$. The initial $x$-degree is at most $T$, and each replacement strictly decreases it, so at most $T$ rounds suffice. One round multiplies the coefficient-norm bound by at most $2^b$ and increases parameter degree by at most $d$; monomials already reduced need neither change. Indeed, a term with coefficient $c$ produces a polynomial of norm at most $\| c \| 2^b$, and summing these bounds accounts for every branch; combining like terms cannot increase the norm. Thus every matrix entry has parameter degree at most $d \( 1 + T \)$ and coefficient norm at most $2^(b \( 1 + T \))$.
  Every entry of $y I - M_v$ consequently has total degree at most $1 + d \( 1 + T \)$ and norm at most $2^(1 + b \( 1 + T \))$. Determinant expansion and $D ! lt.eq 2^(D^2)$ give precisely Equation (3.17). The reduction argument is used only for these bounds; the algorithm does not perform its potentially many reductions or construct the matrix.
  For evaluations, fix a prime and a point for the parameters, and choose integer lifts of those parameter values. These lifts are additional short inputs; specialization gives integer polynomials in $x$ to which Proposition 12 applies. The basis commutes with specialization and reduction modulo $p$, so their multiplication matrices reduce to the required matrices over the prime field, independently of the lifts. The controlled derivative rule in Proposition 6 evaluates the entries of $J = det \( partial_j f_i \)$ with a fixed increase in hierarchy level. An ordinary $n times n$ determinant over the field then evaluates $J$ in polynomial bit time using these available entries. Take $Omega = d$ in Proposition 12 and enlarge its prime cutoff to include those of the input families and their derivatives. All these cutoffs are short and polynomial-time computable from the primary word. The proposition computes the indexed coefficients of the specialized $Q$ by a fixed number of counting stages. Summing their products with $y^j$ gives the evaluation of $Q \( t \, y \)$.
  Thus $Q$ has the required available evaluations as well as the stated short bounds, and is controlled. ◻
]

The rule applies equally to characteristic polynomials of coordinate multiplication and of a polynomial objective. In both cases it replaces an exponentially large matrix by finite-field evaluations with a fixed number of counting stages. Its coefficient polynomials are controlled by Proposition 6, so the rule may be used again at later, fixed stages of the construction.

== 4 Short labels for prescribed real roots <sec:labels>

A polynomial of exponentially large degree may have exponentially many real roots, and the derivative signs that specify one root may form an exponentially long string. We need to name any prescribed root by only polynomially many bits. The following construction replaces that string by one weighted sum and expresses agreement with the sum by positivity of an integer polynomial. It also allows a separate positivity condition at the chosen root.

#thm([Proposition 4.1.])[
  (Short root labels).  #emph[Let $P \( t \)$ and $b_0 \( t \)$ be controlled families of integer univariate polynomials, indexed by the same input word. There is a uniformly controlled family $L_a \( t \) in bb(Z) \[ t \]$, with labels $a$ of polynomial binary length in a polynomial-time specified range, such that whenever $P eq.not 0$:]
  + #emph[For every label $a$ and every real root $alpha$ of $P$, either $L_a \( alpha \) gt.eq 1 / 2$ or $L_a \( alpha \) lt.eq - 1 / 2$.]
  + #emph[For every label $a$ and every real root $alpha$ of $P$, if $L_a \( alpha \) > 0$, then $b_0 \( alpha \) > 0$.]
  + #emph[For every real root $alpha$ of $P$ with $b_0 \( alpha \) > 0$, some label $a$ satisfies $L_a \( alpha \) > 0$ and $L_a \( beta \) < 0$ at every distinct real root $beta$ of $P$.]
  #emph[The construction is defined and controlled also when $P = 0$, but no root-selection property is asserted in that case. It uses a fixed number of applications of the controlled-family rules, independent of the degrees. Taking $b_0 = 1$ permits every real root to be selected.]
] <prop:root-labels>

The proof has three ingredients. First, nonzero values of the required sign tests at roots lie in a known range bounded away from zero. Second, derivative signs distinguish roots, and a modular weighted sum can separate all their sign strings. Finally, a rational approximation to the sign function converts equality of weighted sums into a polynomial inequality. We give the quantitative forms of these ingredients before assembling the labels.

=== 4.1 Values and derivative signs at algebraic roots <values-and-derivative-signs-at-algebraic-roots>

The value bound must allow nonmonic polynomials and multiple roots. The product argument below treats both without taking a squarefree part. Throughout this section, the norm of a polynomial is the sum of the absolute values of its coefficients.

#thm([Lemma 4.2.])[
  (Bounds for nonzero test values).  #emph[Let $P in bb(Z) \[ t \]$ be nonzero, with $deg P lt.eq d$ and $∥P∥_1 lt.eq 2^b$, where $d gt.eq 2$ and $b gt.eq 1$ are integers. If $g in bb(Z) \[ t \]$ satisfies $deg g lt.eq d$ and $∥g∥_1 lt.eq 2^(b + d^2)$, put 
$ B_0 = b + d^2 + d \( b + 1 \) \, #h(2em) B = d \( b d + B_0 \) + b d + 2 . $

 At every complex root $alpha$ of $P$, either $g \( alpha \) = 0$ or 
$ 2^(- B) lt.eq \| g \( alpha \) \| lt.eq 2^B . $

]
] <lem:root-value-bounds>

#proof[
  A nonzero constant polynomial has no roots, so assume that $P$ has actual degree $m gt.eq 1$ and leading coefficient $a eq.not 0$. The elementary root bound gives $\| alpha \| lt.eq 1 + 2^b lt.eq 2^(b + 1)$, and consequently $\| g \( alpha \) \| lt.eq 2^(B_0)$.
  To obtain the lower bound, form the monic integer polynomial and the integer test polynomial
  $ tilde(P) \( t \) = a^(m - 1) P \( t \/ a \) \, #h(2em) tilde(g) \( t \) = a^d g \( t \/ a \) . $
  Their integrality follows by inspecting the coefficients; in $tilde(P)$, the leading coefficient is $1$, and every other coefficient contains a nonnegative power of $a$. Multiplication by $t$ on the free abelian group $bb(Z) \[ t \] \/ \( tilde(P) \)$ has the companion matrix of $tilde(P)$. Over $bb(C)$ it can be triangularized, with eigenvalues $a alpha$ counted with their root multiplicities. Therefore multiplication by $tilde(g)$ has eigenvalues $a^d g \( alpha \)$ with the same multiplicities. Its characteristic polynomial is monic with integer coefficients. The product of its nonzero eigenvalues, after the zero factors are removed, is thus, up to sign, a nonzero integer.
  Every one of these eigenvalues has modulus at most $2^(b d + B_0)$. If a specified $g \( alpha \)$ is nonzero, there are at most $m - 1$ other nonzero eigenvalues in the product, so
  $ \| a \|^d \| g \( alpha \) \| gt.eq 2^(- \( m - 1 \) \( b d + B_0 \)) . $
  Using $\| a \| lt.eq 2^b$ and $m lt.eq d$ gives the claimed lower bound. ◻
]

We shall use this lemma for $b_0$ and for $b_j = P^(\( j \))$, $1 lt.eq j lt.eq d$. If $P$ and $b_0$ both have norm at most $2^b$, these tests have norm at most $2^(b + d^2)$: a derivative multiplies each coefficient by a falling factorial bounded by $d^d lt.eq 2^(d^2)$. Zero derivatives cause no difficulty.

The next fact is the uniqueness underlying Thom encodings; see #cite(label("BasuPollackRoy2006")) Proposition 2.28. Its short proof also explains why repeated roots are allowed.

#thm([Lemma 4.3.])[
  (Derivative signs distinguish roots).  #emph[For a nonzero real polynomial $P$ of degree at most $d$, distinct real roots have distinct strings 
$ #scale(x: 120%, y: 120%)[\(] "sgn" P^(\( j \)) \( alpha \) #scale(x: 120%, y: 120%)[\)]_(1 lt.eq j lt.eq d) . $

]
] <lem:thom-separation>

#proof[
  Suppose that two roots $alpha < beta$ have the same string, and let $m$ be the actual degree. The derivative $P^(\( m \))$ has constant nonzero sign on $\[ alpha \, beta \]$. Descend from order $m - 1$ to order $1$. If $P^(\( j + 1 \))$ has constant nonzero sign on the interval, then $P^(\( j \))$ is strictly monotone there. Its endpoint signs agree by assumption, so they cannot both be zero; they have the same nonzero sign, which persists throughout the interval. The induction shows that $P'$ has constant nonzero sign. Hence $P$ is strictly monotone between two of its roots, a contradiction. ◻
]

=== 4.2 Compressing derivative-sign strings <compressing-derivative-sign-strings>

Fix a nonzero polynomial $P$ of degree at most $d$, with $d gt.eq 2$, and write $b_j = P^(\( j \))$ for $1 lt.eq j lt.eq d$. The derivative signs distinguish its roots by Lemma 16, but we cannot record all $d$ signs. Instead we encode them by a weighted integer sum.

A label is a triple $a = \( mu \, gamma \, S_(*) \)$ in the range

#[#set math.equation(numbering: n => "(4.1)")
 $ W_(*) = 2 max \( 16 \, d^3 \)^4 \,\
3 lt.eq mu lt.eq W_(*) \, #h(2em) 0 lt.eq gamma < mu \, #h(2em) \| S_(*) \| lt.eq d W_(*) . $ <eq:root-label-range>]

For every such label define integer weights

$ w_j = gamma^j med mod med mu \, #h(2em) 0 lt.eq w_j < mu . $

At a real root $alpha$ of a nonzero $P$, the associated weighted sum is

$ S \( alpha \) = sum_(j = 1)^d w_j "sgn" b_j \( alpha \) . $

This sum is an integer in $\[ - d W_(*) \, d W_(*) \]$. The construction below accepts precisely those roots for which $S \( alpha \) = S_(*)$ and $b_0 \( alpha \) > 0$.

We claim that some choices of $mu \, gamma$ make $S$ injective on the distinct real roots of $P$. We use polynomial evaluation to distinguish the strings, the fingerprinting idea underlying #cite(label("Schwartz1980")). The elementary prime-count estimate in the proof of Proposition 7, with $Z = max \( 16 \, d^3 \)$, supplies a prime $mu$ with $d^3 < mu lt.eq W_(*)$. For two distinct derivative-sign strings $sigma \, tau in { - 1 \, 0 \, 1 }^d$, the polynomial

$ sum_(j = 1)^d \( sigma_j - tau_j \) X^j $

is nonzero over $bb(F)_mu$: some coefficient belongs to ${ - 2 \, - 1 \, 1 \, 2 }$ and $mu > 2$. It has at most $d$ zeros in that field. There are at most $d$ distinct real roots, so fewer than $d^3$ values of $gamma$ are forbidden by all pairs together. Choose a remaining $gamma in bb(F)_mu$. The sums at distinct roots are then distinct modulo $mu$, hence distinct as integers. For a prescribed root $alpha$, taking $S_(*) = S \( alpha \)$ selects it uniquely. Only three short integers are recorded; the derivative-sign string is never stored.

The label has $O \( log d \)$ bits, even though the derivative-sign string can have length $d$. We next express the condition $S \( alpha \) = S_(*)$, together with $b_0 \( alpha \) > 0$, by one polynomial positivity test.

=== 4.3 Approximating the sign function <approximating-the-sign-function>

The algebraic values in Lemma 15 can be extremely small, but their binary exponents have short descriptions. A product over these exponents gives a rational function that recognizes their signs with a uniform error. This sign approximation and the subsequent clearing of positive denominators are closely related to the method of Beigel, Reingold, and Spielman #cite(label("BeigelReingoldSpielman1995")); we give the needed construction explicitly.

#thm([Lemma 4.4.])[
  (Rational sign approximation).  #emph[For integers $B gt.eq 1$ and $s gt.eq 1$, define 
$ C_(B \, s) \( z \) & = product_(k = - B)^B #scale(x: 120%, y: 120%)[\(] 2^(max \( 0 \, k \)) + 2^(max \( 0 \, - k \)) z #scale(x: 120%, y: 120%)[\)]^(2 s) \,\
A_(B \, s) \( z \) & = frac(C_(B \, s) \( z \) - C_(B \, s) \( - z \), C_(B \, s) \( z \) + C_(B \, s) \( - z \)) . $

 The denominator is at least $1$ for every real $z$, and $A_(B \, s) \( 0 \) = 0$. For $2^(- B) lt.eq \| z \| lt.eq 2^B$, 
$ \| A_(B \, s) \( z \) - "sgn" z \| lt.eq 2 dot.op 3^(- 2 s) . $

 Moreover $C_(B \, s)$ is an integer polynomial with 
$ deg C_(B \, s) = 2 s \( 2 B + 1 \) \, #h(2em) ∥C_(B \, s)∥_1 lt.eq 2^(2 s \( 2 B + 1 \) \( B + 1 \)) . $

]
] <lem:rational-sign>

#proof[
  Every factor has an even exponent, so $C_(B \, s) \( z \) gt.eq 0$ on $bb(R)$. For $z gt.eq 0$, each base in $C_(B \, s) \( z \)$ is at least $1$. Thus $C_(B \, s) \( z \) + C_(B \, s) \( - z \) gt.eq C_(B \, s) \( \| z \| \) gt.eq 1$. The numerator vanishes at zero, and $A_(B \, s)$ is odd.
  It suffices to consider $2^(- B) lt.eq z lt.eq 2^B$. Choose an integer $k in \[ - B \, B \]$ for which $2^k$ and $z$ are within a factor of two. Then
  $ lr(|frac(2^k - z, 2^k + z)|) lt.eq 1 / 3 . $
  All the other factors in the ratio $C_(B \, s) \( - z \) \/ C_(B \, s) \( z \)$ have absolute value at most $1$, so this ratio lies in $\[ 0 \, 3^(- 2 s) \]$. Writing it as $q$, we have $\| A_(B \, s) \( z \) - 1 \| = 2 q \/ \( 1 + q \) lt.eq 2 dot.op 3^(- 2 s)$. The degree is immediate. Each linear base has coefficient norm at most $2^(B + 1)$, which gives the norm bound by submultiplicativity. ◻
]

=== 4.4 Constructing and verifying the labels <constructing-and-verifying-the-labels>

#proof[
  Choose common controlled bounds $d gt.eq 2$ and $b gt.eq 1$ such that
  $ deg P \, deg b_0 lt.eq d \, #h(2em) ∥P∥_1 \, ∥b_0∥_1 lt.eq 2^b . $
  Use the integers $B_0 \, B$ from Lemma 15, and put $b_j = P^(\( j \))$ for $1 lt.eq j lt.eq d$. For a label $a = \( mu \, gamma \, S_(*) \)$ in the range of (4.1), use the weights $w_j$ defined there.
  It remains to realize this selection by an integer polynomial. Set
  $ M = 1 + d W_(*) \, #h(2em) s = 16 M \, #h(2em) C = C_(B \, s) \, #h(2em) A = A_(B \, s) . $
  For every $0 lt.eq j lt.eq d$ and every real root $alpha$ of a nonzero $P$, Lemmas 15 and 17 give
  #[#set math.equation(numbering: n => "(4.2)")
   $ \| A \( b_j \( alpha \) \) - "sgn" b_j \( alpha \) \| lt.eq 2 dot.op 3^(- 2 s) lt.eq frac(1, 16 M) . $ <eq:root-sign-error>]
  For the zero test value this holds because $A \( 0 \) = 0$. Consequently
  #[#set math.equation(numbering: n => "(4.3)")
   $ lr(|sum_(j = 1)^d w_j A \( b_j \( alpha \) \) - S \( alpha \)|) lt.eq frac(d W_(*), 16 M) < 1 / 16 . $ <eq:weighted-sign-error>]
  To clear denominators without division, define integer polynomials
  $ D_j \( t \) & = C \( b_j \( t \) \) + C \( - b_j \( t \) \) \,\
N_j \( t \) & = C \( b_j \( t \) \) - C \( - b_j \( t \) \) \,\
E \( t \) & = product_(j = 0)^d D_j \( t \) \, #h(2em) T_j \( t \) = N_j \( t \) product_(0 lt.eq i lt.eq d\
i eq.not j) D_i \( t \) . $
  Thus $E \( t \) gt.eq 1$ on $bb(R)$ and $T_j \( t \) = E \( t \) A \( b_j \( t \) \)$ there. We penalize squared disagreement with $S_(*)$ and with the required positive sign, and clear the denominators by defining
  #[#set math.equation(numbering: n => "(4.4)")
   $ L_a \( t \) = E \( t \)^2 - 4 (sum_(j = 1)^d w_j T_j \( t \) - S_(*) E \( t \))^2 - 4 #scale(x: 120%, y: 120%)[\(] T_0 \( t \) - E \( t \) #scale(x: 120%, y: 120%)[\)]^2 . $ <eq:root-label-polynomial>]
  The formula contains only integer additions and multiplications. For the sign analysis it is useful to write it as
  $ L_a \( t \) = E \( t \)^2 (1 - 4 [(sum_(j = 1)^d w_j A \( b_j \( t \) \) - S_(*))^2 + #scale(x: 120%, y: 120%)[\(] A \( b_0 \( t \) \) - 1 #scale(x: 120%, y: 120%)[\)]^2]) . $
  If $S \( alpha \) = S_(*)$ and $b_0 \( alpha \) > 0$, both absolute differences in brackets are at most $1 \/ 16$. The parenthetical factor is at least $1 - 8 \/ 256 > 1 \/ 2$, so $L_a \( alpha \) gt.eq 1 \/ 2$. Otherwise, either the integer $S \( alpha \) - S_(*)$ is nonzero, in which case the first absolute difference is at least $15 \/ 16$, or $"sgn" b_0 \( alpha \) in { 0 \, - 1 }$, in which case the second is at least $15 \/ 16$. The factor is then at most $1 - 4 \( 15 \/ 16 \)^2 < - 1 \/ 2$, and $L_a \( alpha \) lt.eq - 1 \/ 2$. This dichotomy holds for every allowed label, whether or not $mu$ is prime or the weighted sums are distinct. Combined with the separating choices already proved to exist, it gives all three asserted root properties.
  Finally, all degree and log-norm bounds, index endpoints, and label integers have polynomial binary length; their bounds are obtained in polynomial bit time from the input bounds. The weights are computable by modular powering on short integers. The derivatives $b_j$, the short-index product defining $C$, its substitutions in $b_j$, the products defining $E \, T_j$, and the sums and squares in (4.4) are controlled by Proposition 6. In a product omitting index $j$, the omitted factor is simply replaced by $1$; no denominator is ever inverted in finite-field evaluation. The explicit bounds in Lemma 17, followed by the product and substitution bounds, retain polynomial binary length. There are only a fixed number of nested constructions. None requires a test that $P eq.not 0$, so the same controlled family is defined on the degenerate inputs $P = 0$. ◻
]

== 5 Existential tests for controlled families <sec:existential>

The polynomial operations developed above allow us to construct much larger polynomials than we can write down. We now show that real feasibility remains decidable in a fixed counting level for these families. This will let us apply an existential test after the coefficient and determinant constructions used for the two quantifier blocks.

#thm([Theorem 5.1.])[
  #emph[Suppose that an input word specifies a conjunction of polynomially many equations and strict inequalities 
$ A_i \( x \) = 0 \, #h(2em) B_j \( x \) > 0 \, $

 in polynomially many real variables. Assume that the numbers of variables and tests, and the type of each addressed test, are computable in polynomial time, and that the polynomials form controlled families uniformly in their indices. Then the existence of a real solution is an available decision. Its counting level depends only on the fixed family constructions and their evaluation algorithms, not on the input or any short outer indices.]
] <thm:controlled-existential>

We begin the proof by replacing each inequality $B_j \( x \) > 0$ by $B_j \( x \) z_j^2 - 1 = 0$, with a new real variable $z_j$. This replacement is equivalent over $bb(R)$. The sum of the squares of all equation left sides is a controlled polynomial $F$ by Proposition 6. It is nonnegative on $bb(R)^n$, and

$ F upright(" has a real zero") quad arrow.l.r.double quad upright("the original conjunction is feasible") . $

Add an unused variable if necessary so that $n gt.eq 1$; an empty conjunction gives $F = 0$. It therefore suffices to prove the theorem for the zero set of a controlled nonnegative polynomial.

We first turn this zero-set question into a question about one univariate polynomial. A coercive perturbation supplies a minimum whose boundedness detects a zero of $F$: compact sublevel sets will supply a convergent subsequence whose limit is a zero. Its critical-value polynomial then replaces the limiting question by one large integer specialization. Finally, the root labels from Proposition 14 convert the univariate question into the sign of an integer determinant.

=== 5.1 A minimum that detects a zero <a-minimum-that-detects-a-zero>

Choose an odd integer $ell gt.eq 3$ larger than the degree bound for $F$. It has a polynomial-length binary encoding and is computable in polynomial time. For $1 lt.eq i lt.eq n$, put $a_i = \( 4 ell \)^i$ and define

#[#set math.equation(numbering: n => "(5.1)")
 $ G \( x \) & = sum_(i = 1)^n #scale(x: 120%, y: 120%)[\(] x_i^(ell + 1) - \( ell + 1 \) a_i^ell x_i + \( ell + 1 \) a_i^(ell + 1) #scale(x: 120%, y: 120%)[\)] \,\
h_u \( x \) & = G \( x \) + \( ell + 1 \) u F \( x \) \,\
r_i \( x \, u \) & = a_i^ell - u thin partial_i F \( x \) \, #h(2em) f_i \( x \, u \) = x_i^ell - r_i \( x \, u \) . $ <eq:existential-deformation>]

Coercive perturbations and critical-point equations are classical tools in real algebraic geometry; see, for example, #cite(label("BasuPollackRoy2006"), form: "prose"). Here the separated constants $a_i$ serve an additional purpose: the critical values at $u = 0$ will all be distinct.

All polynomials in Equation (5.1), including $u$ as an indeterminate, are controlled. Indeed, the $a_i$ themselves have polynomial bit length, and their displayed powers are allowed by Proposition 6. Moreover, $deg_x r_i < ell$. Apply Proposition 13 to the relations $f_1 \, dots.h \, f_n$ and to multiplication by $h_u$, obtaining

#[#set math.equation(numbering: n => "(5.2)")
 $ Q \( u \, y \) = det \( y I - M_(h_u) \) in bb(Z) \[ u \, y \] \, #h(2em) D = ell^n . $ <eq:existential-characteristic>]

This is a controlled polynomial, monic of degree $D$ in $y$.

Each summand of $G$ has derivative $\( ell + 1 \) \( x_i^ell - a_i^ell \)$. Since $ell$ is odd, its unique real minimum occurs at $x_i = a_i$ and equals $a_i^(ell + 1)$. The even leading power makes $G$ coercive: $G \( x \) arrow.r + oo$ as $lr(bar.v.double x bar.v.double) arrow.r oo$. In particular,

#[#set math.equation(numbering: n => "(5.3)")
 $ h_u \( x \) gt.eq G \( x \) gt.eq sum_(i = 1)^n a_i^(ell + 1) > 0 #h(2em) \( u gt.eq 0 \) . $ <eq:existential-coercivity>]

#thm([Lemma 5.2.])[
  #emph[For the nonnegative polynomial $F$ and deformation in Equation (5.1), the minimum 
$ m \( u \) = min_(x in bb(R)^n) h_u \( x \) $

 exists for every real $u gt.eq 0$. The function $m$ is continuous and nondecreasing, and $Q \( u \, m \( u \) \) = 0$. Furthermore, 
$ F upright(" has a real zero") quad arrow.l.r.double quad m \( u \) upright(" remains bounded as ") u arrow.r + oo . $

]
] <lem:bounded-minimum>

#proof[
  Existence follows from continuity and coercivity. Since $F gt.eq 0$, each $h_u \( x \)$ is nondecreasing in $u$, and so is its minimum. At a minimizer,
  $ partial_i h_u = \( ell + 1 \) f_i = 0 #h(2em) \( 1 lt.eq i lt.eq n \) . $
  Evaluation at this common zero of the relations shows that the value of $h_u$ is a root of its characteristic polynomial, by Lemma 11.
  For continuity, fix a compact interval $I subset.eq \[ 0 \, oo \)$. Every minimizer for a parameter $u in I$ lies in the sublevel set
  $ G \( x \) lt.eq h_u \( x \) = m \( u \) lt.eq h_u \( 0 \) lt.eq max_(v in I) h_v \( 0 \) . $
  This set is compact and contains all these minimizers. On it the functions $h_u$ vary uniformly continuously with $u$. The difference of their minima is at most their uniform difference there, proving continuity of $m$ on $I$.
  If $F \( x_0 \) = 0$, then $m \( u \) lt.eq G \( x_0 \)$ for every $u gt.eq 0$. Conversely, suppose that $m \( u \) lt.eq M$ for all $u gt.eq 0$, and take $u_k arrow.r + oo$ with minimizers $x_k$. Equation (5.3) gives
  $ G \( x_k \) lt.eq M \, #h(2em) 0 lt.eq F \( x_k \) lt.eq frac(M, \( ell + 1 \) u_k) . $
  A subsequence converges in the compact sublevel set of $G$ to a point $x_(*)$, and continuity yields $F \( x_(*) \) = 0$. ◻
]

=== 5.2 Replacing the limit by one specialization <replacing-the-limit-by-one-specialization>

The boundedness criterion is not yet a finite test. We will choose a value cutoff $R$ and a parameter $U$ so that a bounded minimum lies below $R$, whereas a divergent minimum exceeds $R$ by parameter $U$. A finite limit of $m \( u \)$ must be a root of the leading coefficient of $Q$ as a polynomial in $u$, itself a polynomial in $y$, so a coefficient bound supplies $R$. Once $R$ is chosen, taking $U$ larger than every positive real root of the nonzero polynomial $Q \( u \, R \)$ prevents the minimum from crossing $R$ after $U$. We also take $U$ beyond every parameter where $Q \( u \, y \)$ has a repeated root: Lemma 11 will then realize every real root of $Q \( U \, y \)$ as a value at a real critical point. We first bound those exceptional parameters.

#thm([Lemma 5.3.])[
  #emph[The polynomial $Q \( 0 \, y \)$ has $D$ distinct complex roots. If $∥Q∥_1 lt.eq 2^H$, where $H gt.eq 0$ is an integer, there is a nonzero polynomial $Delta in bb(Z) \[ u \]$ such that every parameter where $Q \( u \, y \)$ has a repeated complex root is a zero of $Delta$, and 
#[#set math.equation(numbering: n => "(5.4)")
 $ ∥Delta∥_1 lt.eq 2^(H_Delta) \, #h(2em) H_Delta = \( 2 D \)^2 + 2 D \( H + D + 1 \) . $ <eq:existential-discriminant-bound>]

]
] <lem:existential-discriminant>

#proof[
  At $u = 0$, the common zeros of the relations are $x_i = a_i zeta_i$, where $zeta_i^ell = 1$. Their values under $G$ are
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_(i = 1)^n a_i^(ell + 1) #scale(x: 120%, y: 120%)[\(] \( ell + 1 \) - ell zeta_i #scale(x: 120%, y: 120%)[\)] . $ <eq:existential-unperturbed-values>]
  They are pairwise distinct. To see this, let $j$ be the largest index where two root-of-unity tuples differ, and put $W_i = a_i^(ell + 1)$. The distance between distinct $ell$th roots of unity is at least $2 sin \( pi \/ ell \) gt.eq 4 \/ ell$. Thus the contribution at index $j$ to the difference in Equation (5.5) has modulus at least $4 W_j$. The sum of the earlier contributions has modulus at most
  $ 2 ell sum_(i < j) W_i < frac(2 ell, \( 4 ell \)^(ell + 1) - 1) W_j < 4 W_j . $
  The contribution at index $j$ cannot cancel. By Lemma 11, all $ell^n = D$ distinct values are roots of the degree-$D$ polynomial $Q \( 0 \, y \)$.
  Let $Delta \( u \)$ be the determinant, in the monomial bases, of the square coefficient map
  #[#set math.equation(numbering: n => "(5.6)")
   $ \( B_1 \, B_2 \) mapsto B_1 Q + B_2 Q_y \, quad deg_y B_1 < D - 1 \, quad deg_y B_2 < D \, $ <eq:existential-sylvester-map>]
  whose target consists of polynomials of degree less than $2 D - 1$. At any repeated root of $Q$, evaluation annihilates the image, so the specialized determinant vanishes. At $u = 0$ the map is injective: evaluating a zero image at the $D$ distinct roots of $Q \( 0 \, y \)$ gives $B_2 = 0$, because $Q_y$ is nonzero at those roots and $deg_y B_2 < D$; then $B_1 = 0$. Consequently $Delta \( 0 \) eq.not 0$.
  The map has size $2 D - 1$, and each entry, as a polynomial in $u$, has coefficient norm at most $D 2^H$. Determinant expansion gives
  $ ∥Delta∥_1 lt.eq \( 2 D - 1 \) ! \( D 2^H \)^(2 D - 1) lt.eq 2^(\( 2 D \)^2 + 2 D \( H + D + 1 \)) \, $
  as asserted. ◻
]

Recall the elementary root bound: a nonzero integer polynomial of coefficient norm at most $2^b$ has all its complex roots in $\| z \| lt.eq 1 + 2^b$. For $\| z \| > 1 + 2^b$, its leading coefficient has modulus at least $1$ and the geometric-series estimate makes its leading term strictly larger than the sum of the lower terms.

Choose a polynomial-time computable short bound $H$ with $∥Q∥_1 lt.eq 2^H$, as supplied by Proposition 13, and let $V$ be a short bound on $deg_u Q$. Define

#[#set math.equation(numbering: n => "(5.7)")
 $ rho & = H + 4 \, & R & = 2^rho \,\
sigma & = H_Delta + H + D rho + 4 \, & U & = 2^sigma \,\
K & = H + sigma V . $ <eq:existential-specialization-parameters>]

The exponents and bounds in this display are short integers. The integers $R$ and $U$ are used as controlled constant families; their binary expansions need not have polynomial length.

#thm([Proposition 5.4.])[
  #emph[Let $F in bb(Z) \[ x_1 \, dots.h \, x_n \]$ be nonnegative on $bb(R)^n$, let $n gt.eq 1$, and choose an odd $ell gt.eq 3$ with $ell > deg F$. Define $G \, h_u \, f_i \, Q \, D$ by Equations (5.1) and (5.2). Let $H \, V$ be nonnegative integers bounding $log_2 ∥Q∥_1$ and $deg_u Q$, respectively, and choose the parameters in Equation (5.7). Then 
$ q \( y \) = Q \( U \, y \) $

 is monic and squarefree, has degree $D$ and coefficient norm at most $2^K$, and satisfies 
#[#set math.equation(numbering: n => "(5.8)")
 $ F upright(" has a real zero") quad arrow.l.r.double quad q upright(" has a real root less than ") R . $ <eq:existential-root-equivalence>]

 Every real root of $q$ is the value of $h_U$ at a real common zero of $f_1 \( dot.op \, U \) \, dots.h \, f_n \( dot.op \, U \)$.]
  #emph[When $F$ varies in a controlled family, $ell$ is chosen from its degree bound as above, and $H \, V$ are polynomial-time computable short bounds, $q$ is controlled. All remaining bound parameters in Equation (5.7), including $D \, H_Delta$, are computable in polynomial time and have polynomial binary length.]
] <prop:specialization>

#proof[
  Write
  $ Q \( u \, y \) = sum_(j = 0)^a A_j \( y \) u^j \, #h(2em) A_a eq.not 0 . $
  The polynomial $A_a$ has integer coefficients and norm at most $2^H$. The root bound and the choice of $R$ give $A_a \( R \) eq.not 0$. Hence $Q \( u \, R \)$ is a nonzero integer polynomial in $u$, with norm at most $2^H R^D = 2^(H + D rho)$. Applying the root bound to this polynomial and to $Delta$ from Lemma 20 yields
  #[#set math.equation(numbering: n => "(5.9)")
   $ Q \( u \, R \) eq.not 0 \, #h(2em) Delta \( u \) eq.not 0 #h(2em) upright("for every real ") u gt.eq U . $ <eq:existential-no-crossing>]
  In particular, $q$ is squarefree. Monicity and degree are preserved by specialization, and $∥q∥_1 lt.eq 2^H U^V = 2^K$. Each real root is simple, so Lemma 11 realizes it at a real common zero of the specialized relations.
  If $F$ has a real zero, Lemma 19 gives a finite limit $mu = lim_(u arrow.r oo) m \( u \)$. Divide $Q \( u \, m \( u \) \) = 0$ by $u^a$ and take this limit. Every lower-power term tends to zero, since $m \( u \)$ is bounded, and therefore $A_a \( mu \) = 0$. The root bound gives
  $ m \( U \) lt.eq mu lt.eq \| mu \| lt.eq 1 + 2^H < R . $
  Thus $m \( U \)$ is a real root of $q$ below $R$.
  If $F$ has no real zero, Lemma 19 and monotonicity give $m \( u \) arrow.r + oo$. Its continuity and Equation (5.9) imply $m \( U \) > R$: otherwise the minimum would equal $R$ at some parameter $u gt.eq U$. Every real root of $q$ is a value of $h_U$ at a real point, and is therefore at least $m \( U \) > R$. This proves Equation (5.8).
  Finally, $D = ell^n$ has polynomial binary length because $n$ is polynomially bounded and $ell$ is short. The determinant rule supplies the short bounds $H \, V$ in polynomial time. The remaining exponents are obtained by a fixed number of sums and products of short integers. Substituting the controlled constant $U = 2^sigma$ into $Q$ preserves control by Proposition 6. Neither the highest nonzero index $a$ nor the coefficients of $Delta$ need to be computed: they justify the specialization, whose definition uses only the stated bounds. ◻
]

=== 5.3 One root label and one determinant sign <one-root-label-and-one-determinant-sign>

Proposition 21 has reduced feasibility to the existence of a real root of the controlled polynomial $q$ below $R$. Apply Proposition 14 to $q$ with $b_0 \( y \) = R - y$. It supplies a family of integer polynomials $L$, indexed by short labels, with the following properties at real roots $alpha$ of $q$:

- $L \( alpha \) gt.eq 1 / 2$ or $L \( alpha \) lt.eq - 1 / 2$;
- $L \( alpha \) > 0$ implies $alpha < R$;
- each real root $alpha < R$ has a label whose polynomial is positive at that root and negative at every other real root.

The family is controlled uniformly in the label. Multiplying $L$ by $- 4 D$ gives a sign margin large enough that a small integer shift preserves all real-root signs. We use that shift to avoid zero factors at nonreal roots. For a short choice $e in { 0 \, dots.h \, D }$, define

#[#set math.equation(numbering: n => "(5.10)")
 $ g \( y \) = - 4 D L \( y \) + e \, #h(2em) X = det M_(g \( h_U \)) . $ <eq:existential-sign-determinant>]

The multiplication matrices here use the relations specialized at $u = U$. They respect polynomial composition, and hence

#[#set math.equation(numbering: n => "(5.11)")
 $ X = det g \( M_(h_U) \) = product_(q \( alpha \) = 0) g \( alpha \) in bb(Z) . $ <eq:existential-product-identity>]

The product runs over all complex roots of $q$.

At a real root, the label margin gives

$ L \( alpha \) > 0 med arrow.r.double med g \( alpha \) lt.eq - D < 0 \, #h(2em) L \( alpha \) < 0 med arrow.r.double med g \( alpha \) gt.eq 2 D > 0 . $

Since $g$ has real coefficients, a conjugate nonreal pair contributes $g \( alpha \) g \( overline(alpha) \) = \| g \( alpha \) \|^2 gt.eq 0$ to Equation (5.11). Consequently $X < 0$ implies that some real root has $g \( alpha \) < 0$, and such a root lies below $R$.

Conversely, if $q$ has a real root below $R$, choose a label positive at exactly that real root. Since $q$ is squarefree, every $e in { 0 \, dots.h \, D }$ then gives exactly one negative real factor and all other real factors positive. At any fixed nonreal root, $g \( alpha \) = 0$ excludes at most one value of $e$. Since there are at most $D$ such roots and $D + 1$ available choices, some $e$ leaves every nonreal factor nonzero. Each conjugate pair now contributes a positive factor, so $X < 0$. We have proved

#[#set math.equation(numbering: n => "(5.12)")
 $ F upright(" has a real zero") quad arrow.l.r.double quad X < 0 upright(" for some short label and some ") 0 lt.eq e lt.eq D . $ <eq:existential-final-criterion>]

#proof[
  #emph[Completion of the proof of Theorem 18.] The specialized relations and $g \( h_U \)$ are controlled by the closure rules. A second application of Proposition 13 therefore makes $X$ a controlled integer family: it is $\( - 1 \)^D$ times the constant coefficient of the characteristic polynomial of $M_(g \( h_U \))$. Corollary 8 gives its sign as an available function, uniformly in the input, the label, and $e$. Short-index existential quantification in Equation (5.12) is available as well.
  Every bound and prime cutoff is computed from the preceding controlled families by the fixed rules of Proposition 6 and the determinant rule. The construction uses two applications of the determinant rule, one root-label construction, and a fixed number of closure operations. The possibly large degrees, exponents, and summation ranges all have short binary encodings; none causes an input-dependent nesting of counting computations. Thus the resulting level is fixed uniformly over the original inputs and any short outer indices, as required. ◻
]

== 6 From two real blocks to two existential tests <sec:two-blocks>

We now consider a sentence

$ exists x in bb(R)^r med forall y in bb(R)^s #h(0.27778em) Phi \( x \, y \) $

in the input model of Theorem 1. The existential decision procedure already proved does not by itself permit quantification over the first real block. We will replace that block by a discrete tuple of polynomial total bit length. The main geometric step is to show that, if some parameter $x$ satisfies the universal condition, then one such parameter has coordinates singled out by short root labels.

=== 6.1 Empty fibers and a growing minimum <empty-fibers-and-a-growing-minimum>

First encode failure of the universal condition by a single polynomial. The encoding must work for every fixed $x$, because $x$ remains a parameter throughout the construction.

#thm([Lemma 6.1.])[
  (Fiberwise quartic encoding).  #emph[From a well-formed input of length $N$, one can construct in polynomial time an explicitly listed polynomial $F in bb(Z) \[ x_1 \, dots.h \, x_r \, z_1 \, dots.h \, z_n \]$, with $n gt.eq 1$ polynomially bounded in $N$, such that $F gt.eq 0$ on real inputs, $deg F lt.eq 4$, and, for every $x in bb(R)^r$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ exists y in bb(R)^s #h(0.27778em) not Phi \( x \, y \) quad arrow.l.r.double quad exists z in bb(R)^n #h(0.27778em) F \( x \, z \) = 0 . $ <eq:fiber-encoding>]

 The monomial count and coefficient bit lengths of $F$ are polynomially bounded in $N$.]
] <lem:quartic-fibers>

#proof[
  Introduce variables for the arithmetic wires in $Phi$, retaining the original $x$ variables as parameters. Each arithmetic gate is enforced by an equation of degree at most two. Introduce Boolean value variables $b$ with $b^2 = b$, use the equations
  $ b = b_1 b_2 \, #h(2em) b = b_1 + b_2 - b_1 b_2 \, #h(2em) b = 1 - b_1 $
  for AND, OR, and NOT, respectively, and require the output of $not Phi$ to be $1$.
  To couple an atom with polynomial wire value $v$ to its Boolean value $b$, use fresh real variables $a \, a'$ and impose
  $ v = 0 : quad & b v = 0 \, & \( 1 - b \) \( v a - 1 \) & = 0 \,\
v > 0 : quad & b \( v a^2 - 1 \) = 0 \, & \( 1 - b \) \( v + \( a' \)^2 \) & = 0 . $
  For an equality atom, $b = 0$ is possible exactly when $v eq.not 0$. For a positivity atom, $b = 1$ is possible exactly when $v > 0$, and $b = 0$ exactly when $v lt.eq 0$. Conversely, inverses and real square roots provide the required witnesses in each of these cases. Split products with additional wire variables until every equation has degree at most two. The sum of the squares of their left sides is $F$. Its zeros are precisely the simultaneous solutions of these equations, proving (6.1) for each fixed $x$.
  There are polynomially many bounded-size equations, with polynomial coefficient bit lengths. Expanding their squares therefore gives the asserted monomial list. The variables $z$ include $y$ and all auxiliary variables; an unused variable ensures $n gt.eq 1$ if necessary. ◻
]

Call $x$ #emph[good] if $F \( x \, dot.op \)$ has no real zero. By Lemma 22, our task is to decide whether a good parameter exists. Introduce a nonnegative real parameter $u$ and set

#[#set math.equation(numbering: n => "(6.2)")
 $ h \( x \, u \, z \) = sum_(i = 1)^n z_i^6 + 6 u F \( x \, z \) \, #h(2em) m_x \( u \) = min_(z in bb(R)^n) h \( x \, u \, z \) . $ <eq:fiber-minimum>]

The coercive term prevents minimizers from escaping whenever their values remain bounded. In particular, the minimum exists and is nonnegative. For fixed $x$ it is nondecreasing in $u$.

The function $\( x \, u \) mapsto m_x \( u \)$ is continuous on $bb(R)^r times \[ 0 \, oo \)$. Indeed, on a compact parameter neighborhood, comparison with $z = 0$ gives a uniform upper bound on the minimum. Since $h \( x \, u \, z \) gt.eq sum_i z_i^6$, all minimizers lie in one compact set. Uniform continuity of $h$ on that set and the parameter neighborhood then implies continuity of its minimum. Moreover,

#[#set math.equation(numbering: n => "(6.3)")
 $ x upright(" is good") quad arrow.l.r.double quad m_x \( u \) arrow.r + oo quad \( u arrow.r + oo \) . $ <eq:good-divergence>]

A zero of $F \( x \, dot.op \)$ supplies a uniform upper bound. Conversely, if the nondecreasing minimum stays bounded, take minimizers along $u arrow.r + oo$. They stay in a compact set, and $6 u F \( x \, z \) lt.eq h \( x \, u \, z \)$ forces $F \( x \, z \) arrow.r 0$ along them. A limit point is a zero of the fiber polynomial.

At each minimizer the critical equations are

$ f_i = z_i^5 + u frac(partial F, partial z_i) = 0 #h(2em) \( 1 lt.eq i lt.eq n \) . $

Their lower-degree terms have $z$-degree at most $3$. Proposition 13, with $x \, u$ as parameters, therefore constructs a controlled polynomial

#[#set math.equation(numbering: n => "(6.4)")
 $ Q \( x \, u \, T \) = det \( T I - M_h \) \, #h(2em) D = 5^n . $ <eq:fiber-characteristic>]

It is monic of degree $D$ in $T$, and evaluation at a critical point gives

#[#set math.equation(numbering: n => "(6.5)")
 $ Q \( x \, u \, m_x \( u \) \) = 0 . $ <eq:minimum-root>]

We next use this one polynomial to separate the parameters with bounded minima from those with divergent minima.

=== 6.2 Degree pieces and a closed lift <degree-pieces-and-a-closed-lift>

The rate of divergence in (6.3) can be detected by a fixed power substitution. For each fixed $x$,

#[#set math.equation(numbering: n => "(6.6)")
 $ cases(delim: "{", m_x \( v^(D + 1) \) > v upright(" for all sufficiently large ") v \, & x upright(" good") \,, m_x \( v^(D + 1) \) < v upright(" for all sufficiently large ") v \, & x upright(" not good") .) $ <eq:growth-test>]

The second assertion follows from boundedness. For the first, write the specialization of $Q$ at $x$ as

$ Q \( x \, u \, T \) = sum_(j = 0)^a q_j \( T \) u^j \, #h(2em) q_a eq.not 0 \, #h(2em) deg q_j lt.eq D . $

If a sequence $v arrow.r + oo$ satisfied $m_x \( v^(D + 1) \) lt.eq v$, put $t_v = m_x \( v^(D + 1) \)$. Then $t_v arrow.r + oo$, whereas (6.5), divided by $v^(a \( D + 1 \))$, gives

$ q_a \( t_v \) = - sum_(j < a) q_j \( t_v \) v^(- \( a - j \) \( D + 1 \)) arrow.r 0 . $

Here $0 lt.eq t_v lt.eq v$ makes each term on the right $O \( v^(- 1) \)$. A nonzero polynomial cannot tend to zero along a sequence tending to $+ oo$, giving the contradiction.

To control the growth test locally as $x$ varies, we track possible zeros of $m_x \( v^(D + 1) \) - v$. By (6.5), each such zero forces $Q \( x \, v^(D + 1) \, v \) = 0$. Define the controlled polynomial

#[#set math.equation(numbering: n => "(6.7)")
 $ E \( x \, v \) = Q \( x \, v^(D + 1) \, v \) = sum_(j = 0)^(d_E) E_j \( x \) v^j \, $ <eq:degree-polynomial>]

where $d_E$ is a short, polynomial-time computable degree bound. Coefficient extraction makes the $E_j$ a uniformly controlled family. Crucially,

#[#set math.equation(numbering: n => "(6.8)")
 $ E_D \( x \) = 1 #h(2em) upright("for every ") x . $ <eq:nonzero-degree-polynomial>]

Indeed, the term $T^D$ in $Q$ gives $v^D$. Every other term has $T$-degree at most $D - 1$, so after substitution its $v$-exponent has the form $a \( D + 1 \) + b$ with $a gt.eq 0$ and $0 lt.eq b < D$; none equals $D$. Thus $E \( x \, dot.op \)$ is never the zero polynomial. Fixing its actual degree keeps its leading coefficient locally away from zero, and hence gives a locally uniform bound on its roots.

#thm([Proposition 6.2.])[
  (Local constancy on degree pieces).  #emph[For $0 lt.eq d lt.eq d_E$, let 
$ A_d = { x in bb(R)^r : E_d \( x \) eq.not 0 \, med E_j \( x \) = 0 upright(" for ") j > d } . $

 The sets $A_d$ partition $bb(R)^r$. Within each $A_d$, the good parameters form a subset that is both open and closed in the relative topology.]
] <prop:degree-pieces>

#proof[
  The partition assertion follows from (6.8). Fix $x_0 in A_d$. On a neighborhood $V$ of $x_0$ relative to $A_d$, continuity bounds $\| E_d \|$ below by a positive number and all the other coefficient moduli above. The elementary leading-term bound therefore gives $R > 0$ such that
  $ E \( x \, v \) eq.not 0 #h(2em) \( x in V \, med v gt.eq R \) . $
  Consequently the continuous function $m_x \( v^(D + 1) \) - v$ never vanishes on this range: a zero would contradict (6.5) and (6.7). For each $x in V$ its sign is constant as $v$ varies in $\[ R \, oo \)$, and (6.6) identifies that sign with goodness. By continuity in $x$, its nonzero sign at $v = R$ is constant on a smaller relative neighborhood of $x_0$. Goodness is therefore locally constant on $A_d$, which proves both relative openness and relative closedness. ◻
]

The sets $A_d$ need not be closed in the ambient space. To make the separation in Proposition 23 usable in a compact minimization argument, introduce one real variable $t$ and define

#[#set math.equation(numbering: n => "(6.9)")
 $ W_d \( x \, t \) = \( E_d \( x \) t - 1 \)^2 + sum_(j = d + 1)^(d_E) E_j \( x \)^2 \, #h(2em) Z_d = { \( x \, t \) in bb(R)^(r + 1) : W_d \( x \, t \) = 0 } . $ <eq:closed-lift>]

The $W_d$ are nonnegative controlled polynomials, uniformly in the short index $d$. The set $Z_d$ is closed, and projection onto $x$ is a homeomorphism from $Z_d$ onto $A_d$, with inverse $x mapsto \( x \, 1 \/ E_d \( x \) \)$. Thus the good part of $Z_d$ and its complement in $Z_d$ are both closed in the ambient Euclidean space. We have separated the two behaviors without needing a description of the connected components of a degree piece.

=== 6.3 Algebraic coordinates in a selected closed part <algebraic-coordinates-in-a-selected-closed-part>

We now show that a nonnegative polynomial $W$ supplies coordinate polynomials whose roots include the coordinates of a point in every nonempty part of ${ W = 0 }$ that is both open and closed within that zero set. Their construction is independent of which part is selected and requires no equations describing that part. The use of a deformation and limiting characteristic-polynomial roots is related to the sampling methods in Basu, Pollack, and Roy #cite(label("BasuPollackRoy2006")) Sections 12.5–12.6. The argument below proves the precise form needed here directly.

#thm([Proposition 6.3.])[
  (Candidate coordinates).  #emph[Let $W in bb(R) \[ c_1 \, dots.h \, c_k \]$ be nonnegative on $bb(R)^k$, where $k gt.eq 1$, and let $C$ be a nonempty subset of $Z = { W = 0 }$ that is both open and closed in $Z$. Choose an odd integer $ell gt.eq 3$ with $ell > deg W$, and put 
$ G \( c \) = sum_(i = 1)^k c_i^(ell + 1) \, #h(2em) H_w \( c \) = G \( c \) + \( ell + 1 \) w W \( c \) . $

 In the quotient by 
#[#set math.equation(numbering: n => "(6.10)")
 $ c_i^ell + w frac(partial W, partial c_i) = 0 #h(2em) \( 1 lt.eq i lt.eq k \) \, $ <eq:candidate-relations>]

 form the coordinate multiplication polynomials 
#[#set math.equation(numbering: n => "(6.11)")
 $ P_i \( w \, T \) = det \( T I - M_(c_i) \) = sum_j P_(i \, j) \( T \) w^j . $ <eq:coordinate-polynomials>]

 For each $i$, let $j_i$ be the largest index for which $P_(i \, j_i) eq.not 0$. There exists $c^(*) in C$ such that 
$ P_(i \, j_i) \( c_i^(*) \) = 0 #h(2em) \( 1 lt.eq i lt.eq k \) . $

 If $W$ is a controlled family of integer polynomials, $k$ is polynomially bounded, and $ell$ is short and computable in polynomial time, then the polynomials $P_i$ and $P_(i \, j)$ are uniformly controlled.]
] <prop:candidate-coordinates>

#proof[
  The relations (6.10) satisfy the degree hypotheses of Lemma 9, with coefficient ring $bb(R) \[ w \]$. Thus the coordinate multiplication matrices exist, and each $P_i$ is monic of degree $ell^k$ in $T$. In particular, $P_i eq.not 0$ and $j_i$ exists. For controlled integer families, Proposition 13 and coefficient extraction give the final assertion.
  Fix $c^0 in C$ and choose $M > G \( c^0 \)$. The set
  $ K_0 = { c : G \( c \) lt.eq M } $
  is compact. Since $Z$ is closed and $C$ is relatively both open and closed, the sets
  $ S_g = C ∩ K_0 \, #h(2em) S_b = \( Z \\ C \) ∩ K_0 $
  are disjoint compact sets, and $c^0 in S_g$. Choose $epsilon.alt > 0$ so that the compact set
  #[#set math.equation(numbering: n => "(6.12)")
   $ K = { c in K_0 : "dist" \( c \, S_g \) lt.eq epsilon.alt } $ <eq:compact-neighborhood>]
  is disjoint from $S_b$. This is possible because disjoint nonempty compact sets have positive distance; if $S_b$ is empty, any positive $epsilon.alt$ suffices. Figure 2 indicates the two boundaries whose role we must control.
  For a sequence $w_nu > 0$ tending to $+ oo$, let $c^nu$ minimize $H_(w_nu)$ on $K$. Since $c^0 in K$ and $W \( c^0 \) = 0$, nonnegativity gives
  #[#set math.equation(numbering: n => "(6.13)")
   $ G \( c^nu \) + \( ell + 1 \) w_nu W \( c^nu \) lt.eq G \( c^0 \) < M . $ <eq:penalty-bounds>]
  After passage to a subsequence, compactness gives $c^nu arrow.r c^(*) in K$. The same bound forces $W \( c^nu \) arrow.r 0$, so $c^(*) in Z ∩ K$. Because $K ∩ S_b = diameter$, we have $c^(*) in S_g subset C$. Furthermore,
  $ G \( c^(*) \) lt.eq G \( c^0 \) < M \, #h(2em) "dist" \( c^(*) \, S_g \) = 0 < epsilon.alt . $
  Both inequalities defining $K$ are strict at $c^(*)$, so $c^(*)$ is an interior point of $K$. Hence the convergent minimizers $c^nu$ are also interior for all sufficiently large $nu$. They satisfy the unconstrained critical equations (6.10). Evaluation at these common zeros gives
  $ P_i \( w_nu \, c_i^nu \) = 0 . $
  Divide by $w_nu^(j_i)$. The lower powers tend to zero because $c_i^nu$ stays bounded, and passage to the limit yields $P_(i \, j_i) \( c_i^(*) \) = 0$, as required. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (10, 4.2), fill: rgb("#fafafa"), stroke: (thickness: 0.4pt, miter-limit: 10), radius: 18pt)
  content((0.2, 4.05), [#text(size: 9pt)[$K_0=\{G lt.eq M\}$]], anchor: "north-west", padding: 0.1176cm)
  rect((-0.6, 0.6), (6.35, 3.3), fill: rgb("#ebebff"), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 24pt)
  content((6.2, 3.2), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$K$]]], anchor: "north-east", padding: 0.1176cm)
  bezier((0, 1.25), (3.2, 1.65), (1.3, 2.1), (2.6, 1.1), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  bezier((3.8, 2.25), (5.3, 2.1), (4.4, 2.7), (4.8, 1.8), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((2, 2.7), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$S_g=C inter K_0$]]])
  content((-0.4, 2.05), [#text(size: 9pt)[$G=M$]], anchor: "east", padding: 0.1176cm)
  line((-0.35, 2.05), (0.03, 2.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((4.7, 3.8), [#text(size: 9pt)[$"dist" (c,S_g)= epsilon$]])
  line((4.7, 3.57), (4.7, 3.3), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  bezier((7.3, 1.15), (9.1, 2.65), (8.1, 1.6), (8.3, 2.9), stroke: (paint: rgb("#595959"), thickness: 1.2pt, miter-limit: 10))
  content((8.1, 0.6), [#text(size: 9pt)[$S_b=(Z without C) inter K_0$]])
  circle((3.05, 1.6), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((3.05, 1.6), [#text(size: 9pt)[$c^*$]], anchor: "north", padding: 0.1176cm)
  circle((3.35, 2.55), radius: 0.04939, fill: black, stroke: none)
  circle((3.24, 2.17), radius: 0.04939, fill: black, stroke: none)
  circle((3.14, 1.88), radius: 0.04939, fill: black, stroke: none)
  line((3.8, 2.6), (3.42, 2.55), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((3.8, 2.6), [#text(size: 9pt)[$c^ nu$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: The compact-neighborhood argument, schematically. The selected zero set $S_g$ and the excluded zero set $S_b$ are separated inside $K_0$. The set $K$ can meet the boundary $G = M$. Penalized minimizers converge to $c^(*) in S_g$ with $G \( c^(*) \) < M$ and distance zero from $S_g$, strictly below $epsilon.alt$. They are therefore eventually interior to $K$, away from both boundary portions. The drawn shapes assert no smoothness or connectedness of these sets. ],
) <fig:compact-neighborhood>

Apply Proposition 24 to $W = W_d$ and to the good part of $Z_d$. We use $c = \( x \, t \) in bb(R)^(r + 1)$ and choose $ell$ from a uniform short degree bound on $W_d$. Whenever this good part is nonempty, it contains a point whose coordinates are roots of the nonzero coefficient polynomials $P_(i \, j_i)$. These polynomials are controlled uniformly in $d \, i \, j_i$.

=== 6.4 The final decision <the-final-decision>

We can now use root labels to replace the real choice of $x$ by short discrete data. Choose an integer $0 lt.eq d lt.eq d_E$ and, for each $1 lt.eq i lt.eq r + 1$, an index $j_i$ within a uniform short bound on the $w$-degree of $P_i$. For each $P_(i \, j_i)$ choose root-label data as in Proposition 14, with the auxiliary positivity test equal to $1$, and write $L_i$ for the resulting controlled polynomial. Let $cal(S) \( c \)$ denote the conjunction

#[#set math.equation(numbering: n => "(6.14)")
 $ W_d \( c \) = 0 \, #h(2em) P_(i \, j_i) \( c_i \) = 0 \, #h(2em) L_i \( c_i \) > 0 quad \( 1 lt.eq i lt.eq r + 1 \) . $ <eq:selected-coordinates>]

For these choices, accept exactly when both statements hold:

#[#set math.equation(numbering: n => "(6.15)")
 $ & exists c in bb(R)^(r + 1) #h(0.27778em) cal(S) \( c \) \,\
 & not exists \( c \, z \) in bb(R)^(r + 1 + n) #h(0.27778em) #scale(x: 120%, y: 120%)[\(] cal(S) \( c \) med and med F \( x \, z \) = 0 #scale(x: 120%, y: 120%)[\)] . $ <eq:final-nonempty>]

Each existential statement is an instance of Theorem 18. Their conjunction, with negation as displayed, is therefore an available decision.

We verify the two directions separately; they use the labels in different ways. If the test accepts, choose $c = \( x \, t \)$ from (6.15). Statement (6.15) implies that $F \( x \, dot.op \)$ has no real zero. Thus $x$ is good. This implication holds for every choice of the indices and labels, even if a selected coefficient polynomial is zero or the conjunction selects more than one point.

Conversely, suppose a good $x$ exists. Let $d$ be the actual degree of $E \( x \, dot.op \)$. Then the good part of $Z_d$ is nonempty. Proposition 24 supplies a point $c^(*) = \( x^(*) \, t^(*) \)$ in that part and highest nonzero coefficient indices $j_i$ for which $P_(i \, j_i) \( c_i^(*) \) = 0$. By Proposition 14, labels can be chosen to single out each $c_i^(*)$ among the real roots of its coefficient polynomial. For these choices, (6.14) has exactly the one solution $c^(*)$. It satisfies (6.15), and goodness of $x^(*)$ gives (6.15). Some discrete choices therefore accept. Notice that the decision procedure does not need to verify that an index is highest or a coefficient polynomial nonzero: those properties provide complete choices, whereas the two tests ensure soundness for all choices.

Finally, all discrete choices together have polynomial encoding length. There are only $r + 1$ coefficient indices and labels; each degree bound, index bound, and label bound is short. The real variables and the number of equations and positivity tests in (6.15)–(6.15) are polynomially bounded. The controlled-polynomial rules are used in a fixed order: construct $Q$ and $E$, extract their coefficients and form $W_d$, construct the coordinate polynomials, form the labels, and apply the two existential tests. Each stage is uniform in its short indices; none introduces a separate oracle or one counting level per index. The existential quantification over the entire discrete choice tuple thus preserves availability. The resulting decision function belongs to a fixed level of the counting hierarchy, independent of the input. Malformed inputs were rejected in polynomial time, so this proves Theorem 1.

== 7 An explicit level for the existential fragment <sec:existential-bound>

For an ordinary existential sentence, the polynomial to be tested is explicitly listed after the quartic reduction. This permits more precise level accounting than the controlled-family formulation requires. There is also a simpler root selection: we need to isolate some root below a threshold, whereas the two-block argument needs to specify any prescribed coordinate root. The simpler selection yields the following refinement.

#thm([Theorem 7.1.])[
  #emph[For the circuit encoding of the existential theory of the reals used in this paper, 
$ sans(E T R) in sans(C)_26 sans(P) \, #h(2em) exists bb(R) subset.eq sans(C)_26 sans(P) . $

]
] <thm:etr-bound>

We prove the bound using the preceding algebraic and counting tools, with a short list of derivative conditions in place of the labels from Section 4.

=== 7.1 Selecting some root with few derivative conditions <selecting-some-root-with-few-derivative-conditions>

The distinction between selecting some root and selecting a prescribed root is elementary but useful. Derivative signs distinguish all real roots by Lemma 16. If only one root from a nonempty set is needed, repeatedly keeping a smallest nonempty sign class gives a much shorter description.

#thm([Lemma 7.2.])[
  (Sparse root selection).  #emph[Let $p in bb(R) \[ y \]$ be a nonzero polynomial of degree $d gt.eq 1$, and let $S$ be a nonempty set of distinct real roots of $p$. There is a list of at most $ceil.l log_2 \| S \| ceil.r$ conditions 
$ "sgn" p^(\( j \)) \( alpha \) = v \, #h(2em) 1 lt.eq j lt.eq d \, quad v in { - 1 \, 0 \, 1 } \, $

 satisfied by exactly one member of $S$.]
] <lem:sparse-selection>

#proof[
  If at least two roots remain, their derivative sign strings differ in some coordinate. That coordinate partitions the remaining roots into at least two nonempty classes. Record the condition defining a smallest nonempty class and keep that class; its size is at most half the previous size. After at most $ceil.l log_2 \| S \| ceil.r$ repetitions exactly one root remains. If $\| S \| = 1$, use the empty list. ◻
]

For an $sans(E T R)$ instance $exists y thin Theta \( y \)$, apply Lemma 22 with no free parameters and with $Phi = not Theta$. Renaming the full variable tuple gives an explicitly listed nonnegative polynomial $F in bb(Z) \[ x_1 \, dots.h \, x_n \]$ with $n gt.eq 1$ and degree at most four, whose real zeros encode truth of the instance. Use Proposition 21 with $ell = 5$. In its notation, $D = 5^n$, $U = 2^sigma$, $R = 2^rho$, and

$ q \( y \) = det \( y I - M_(h_U) \) in bb(Z) \[ y \] $

is monic and squarefree of degree $D$. The original sentence is true if and only if $q$ has a real root below $R$. Take $K = max \( 1 \, H + sigma V \)$ from that proposition, so $∥∥_1 q lt.eq 2^K$ and $K$ is short and polynomial-time computable. Although $U$, $R$, and the coefficients of $q$ may have long binary expansions, their bound exponents are short.

Put $T = 2 + 3 n$. A test list consists of $t$ pairs $\( b_i \, v_i \)$, where

$ 1 lt.eq t lt.eq T \, #h(2em) b_1 \( y \) = R - y \, #h(2em) v_1 = 1 \, $

and each subsequent $b_i$ is $q^(\( j_i \))$ for some $1 lt.eq j_i lt.eq D$, with $v_i in { - 1 \, 0 \, 1 }$. A root matches the list when $"sgn" b_i \( alpha \) = v_i$ for every $i$. If a real root below $R$ exists, Lemma 26 applied to all such roots gives a list matching exactly one real root. Indeed, at most $ceil.l log_2 D ceil.r lt.eq 3 n$ derivative conditions suffice. Every list has polynomial encoding length, since both $T$ and $log D$ are polynomially bounded.

=== 7.2 A polynomial detecting the list <a-polynomial-detecting-the-list>

We next turn these conditions into a polynomial that is negative exactly at matching real roots. The construction is the rational sign approximation of Lemma 17, now applied to only polynomially many tests.

First we need a common range for their nonzero values. Every complex root $alpha$ of $q$ satisfies $\| alpha \| lt.eq 2^(K + 1)$, and every test polynomial satisfies

$ deg b_i lt.eq D \, #h(2em) ∥b_i∥_1 lt.eq 2^(K + D^2 + rho + 2) . $

For derivatives, the coefficient increase is bounded by $D^D lt.eq 2^(D^2)$; the same displayed estimate covers $R - y$. Set

#[#set math.equation(numbering: n => "(7.1)")
 $ B_0 = K + D^2 + rho + 2 + D \( K + 1 \) \, #h(2em) B = D B_0 + 2 . $ <eq:sparse-value-bounds>]

Then $\| b_i \( alpha \) \| lt.eq 2^(B_0)$. For the lower bound, the eigenvalues of the integer matrix $b_i \( M_(h_U) \)$ are these values at the $D$ roots of $q$. The product of its nonzero eigenvalues, up to sign, is a nonzero coefficient of its monic integer characteristic polynomial, and so has absolute value at least one. Bounding the other factors by $2^(B_0)$ gives

#[#set math.equation(numbering: n => "(7.2)")
 $ b_i \( alpha \) eq.not 0 quad arrow.r.double quad 2^(- B) lt.eq \| b_i \( alpha \) \| lt.eq 2^B . $ <eq:sparse-value-range>]

This argument permits some test values to vanish.

Let $s = T + 10$ and define

#[#set math.equation(numbering: n => "(7.3)")
 $ P \( z \) = product_(j = - B)^B (2^(max \( 0 \, j \)) + 2^(max \( 0 \, - j \)) z)^(2 s) \, #h(2em) A \( z \) = frac(P \( z \) - P \( - z \), P \( z \) + P \( - z \)) . $ <eq:sparse-approximant>]

By Lemma 17, the denominator is at least one on the real line, $A \( 0 \) = 0$, and Equation (7.2) implies

$ \| A \( b_i \( alpha \) \) - "sgn" b_i \( alpha \) \| lt.eq 2 dot.op 3^(- 2 s) lt.eq frac(1, 8 T) #h(2em) \( q \( alpha \) = 0 \, med alpha in bb(R) \) . $

Consequently

$ Psi \( y \) = 4 sum_(i = 1)^t \( A \( b_i \( y \) \) - v_i \)^2 - 1 $

is at most $- 1 + 1 \/ \( 16 T \)$ at a matching real root. At any other real root one difference in the sum has absolute value at least $1 - 1 \/ \( 8 T \) gt.eq 7 \/ 8$, and therefore $Psi gt.eq 33 \/ 16$.

Clear the positive squared denominators by setting

$ D_i \( y \) & = P \( b_i \( y \) \) + P \( - b_i \( y \) \) \,\
N_i \( y \) & = P \( b_i \( y \) \) - P \( - b_i \( y \) \) \,\
g_(*) \( y \) & = 4 sum_(i = 1)^t \( N_i \( y \) - v_i D_i \( y \) \)^2 product_(j eq.not i) D_j \( y \)^2 - product_(j = 1)^t D_j \( y \)^2 . $

This is an integer polynomial, equal on the real line to $Psi product_i D_i^2$. As every $D_i gt.eq 1$, it satisfies

#[#set math.equation(numbering: n => "(7.4)")
 $ cases(delim: "{", g_(*) \( alpha \) lt.eq - 1 / 2 \, & upright("if ") alpha upright(" matches the list") \,, g_(*) \( alpha \) gt.eq 1 / 2 \, & upright("otherwise") \,) #h(2em) \( q \( alpha \) = 0 \, med alpha in bb(R) \) . $ <eq:sparse-sign-margin>]

For one additional choice $e in { 0 \, dots.h \, D }$ put

#[#set math.equation(numbering: n => "(7.5)")
 $ g \( y \) = 4 D g_(*) \( y \) + e \, #h(2em) X = det M_(g \( h_U \)) = product_(q \( alpha \) = 0) g \( alpha \) in bb(Z) . $ <eq:sparse-product>]

The determinant identity is Lemma 11. The sign argument of Section 5, applied to $L = - g_(*)$, gives

#[#set math.equation(numbering: n => "(7.6)")
 $ q upright(" has a real root below ") R quad arrow.l.r.double quad X < 0 upright(" for some test list and some ") e . $ <eq:sparse-product-criterion>]

Indeed, every $e$ preserves the real-root signs. A list matching exactly one real root gives exactly one negative real factor; some $e$ avoids every nonreal zero, since each of at most $D$ nonreal roots forbids at most one of the $D + 1$ choices. The conjugate pairs then contribute positive factors. Conversely, a negative product has a negative real factor, whose root matches the list and hence lies below $R$.

For the subsequent computations we record explicit short bounds. Writing $m_(*) = 2 s \( 2 B + 1 \)$ for the degree of $P$, set

#[#set math.equation(numbering: n => "(7.7)")
 $ d_g & = 2 T m_(*) D \,\
l_(*) & = m_(*) \( 2 B + 1 \) \,\
E_(*) & = 2 T \( l_(*) + 2 \) + 16 \( D + T + 2 \) \,\
m_X & = D E_(*) + 1 . $ <eq:sparse-size-bounds>]

Then $deg g lt.eq d_g$ and $\| X \| lt.eq 2^(m_X)$. For the first bound, every term in $g_(*)$ has $t$ squared factors, each of degree at most $m_(*) D$. For the second, at every complex root $alpha$ each base in $P \( plus.minus b_i \( alpha \) \)$ has modulus at most $2^(2 B + 1)$. Hence

$ \| P \( plus.minus b_i \( alpha \) \) \| lt.eq 2^(l_(*)) \, #h(2em) \| D_i \( alpha \) \| \, \| N_i \( alpha \) \| lt.eq 2^(l_(*) + 1) \, #h(2em) \| N_i \( alpha \) - v_i D_i \( alpha \) \| lt.eq 2^(l_(*) + 2) . $

Therefore

$ \| g \( alpha \) \| lt.eq D \( 16 T + 5 \) thin 2^(2 T \( l_(*) + 2 \)) lt.eq 2^(E_(*)) \, $

which gives the asserted product bound. All displayed bound parameters use a fixed number of sums and products of short integers, so are themselves short and polynomial-time computable.

=== 7.3 Accounting for the oracle levels <accounting-for-the-oracle-levels>

The two multiplication-determinant computations now have an explicit cost. Set

$ Omega = 6 \( 1 + d_g \) \, #h(2em) L_0 = D Omega + 4 n \, #h(2em) lambda = 5 L_0 + 4 n + D^2 + 10 . $

For every prime $p > lambda$, Proposition 12 applies both to $h_U$, of degree at most six, and to $g \( h_U \)$, of degree at most $6 d_g$. The larger cutoff is used for both applications. To recover $"sgn" X$ we need only $p lt.eq Y = 2 max \( 16 \, m_X \, lambda \)^4$, as in Proposition 7. In particular every queried prime has polynomial bit length.

For the first application, the relations $f_i \( dot.op \, U \)$ and the objective $h_U$ have direct polynomial-bit-time evaluations modulo $p$. Indeed, $ell = 5$ gives $a_i = 20^i$, with polynomial bit length. The quartic $F$ and its first and second derivatives have polynomial-size monomial lists. The constants $U med mod med p$ and $R med mod med p$ are computed by powering with the short exponents $sigma$ and $rho$. The Jacobian is an $n times n$ determinant of directly evaluable entries. Thus Proposition 12, with $a = 0$, computes the indexed coefficients $q_k med mod med p$ of $q \( y \) = sum_(k = 0)^D q_k y^k$ in $sans(F)_8$.

For $1 lt.eq j lt.eq D$,

$ q^(\( j \)) \( y \) = sum_(k = j)^D q_k (product_(r = 0)^(j - 1) \( k - r \)) y^(k - j) . $

The falling factorial is in $sans(F)_4$ by Lemma 2.2; the outer sum therefore gives derivative evaluations in $sans(F)_9$ by Lemma 2. This includes every test $b_i$, since $R - y$ is directly evaluable. Each factor of $P \( b_i \( y \) \)$ in Equation (7.3) is consequently in $sans(F)_9$. The product lemma puts $P \( plus.minus b_i \( y \) \)$ in $sans(F)_13$. Since the list contains only polynomially many tests, the formulas for $D_i \, N_i \, g_(*)$, and $g$ need only polynomially many such calls and short arithmetic operations. Thus $g \( y \)$, and then $g \( h_U \( x \) \)$, are evaluable in $sans(F)_13$. These expressions use only integer additions and multiplications; their field evaluations never invert a test denominator.

The second application of Proposition 12, with $a = 13$ and $v = g \( h_U \)$, computes

$ X med mod med p = \( - 1 \)^D \[ y^0 \] det \( y I - M_(g \( h_U \)) \) med mod med p $

in $sans(F)_21$. The first application uses only the original quartic and its critical equations; the second calls the first through the evaluations of $g$. This is a fixed sequence of two applications, independent of $n$ and $D$.

By Proposition 7 and Equation (7.7), the sign of $X$ is in $sans(F)_24$. Lemma 2 then puts existence of a test list and an $e$ with $X < 0$ in $sans(F)_25$. Equation (7.6) therefore gives a decision function for $sans(E T R)$ at that level, and a language in $sans(C)_26 sans(P)$. Polynomial-time many-one precomputation preserves this level, proving the second assertion of Theorem 25.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (left, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity or decision
], table.cell(rowspan: 1, colspan: 1)[Sufficient class
]),
  table.cell(rowspan: 1, colspan: 1)[Indexed coefficients of $q med mod med p$
], table.cell(rowspan: 1, colspan: 1)[$sans(F)_8$
],
  table.cell(rowspan: 1, colspan: 1)[Derivative-test evaluations
], table.cell(rowspan: 1, colspan: 1)[$sans(F)_9$
],
  table.cell(rowspan: 1, colspan: 1)[Evaluations of $P$, $g$, and $g \( h_U \)$
], table.cell(rowspan: 1, colspan: 1)[$sans(F)_13$
],
  table.cell(rowspan: 1, colspan: 1)[$X med mod med p$
], table.cell(rowspan: 1, colspan: 1)[$sans(F)_21$
],
  table.cell(rowspan: 1, colspan: 1)[$"sgn" X$
], table.cell(rowspan: 1, colspan: 1)[$sans(F)_24$
],
  table.cell(rowspan: 1, colspan: 1)[Existence of a list and $e$ with $X < 0$
], table.cell(rowspan: 1, colspan: 1)[$sans(F)_25$
],
  table.cell(rowspan: 1, colspan: 1)[Membership in $sans(E T R)$
], table.cell(rowspan: 1, colspan: 1)[$sans(C)_26 sans(P)$
],
)
]],
  caption: [Table 1: A conservative level bound for the existential fragment. Every indexed family uses a single uniform evaluator. ],
)

The shortness of all indices is independent of these level counts. The bounds $D \, K \, rho \, sigma \, B \, d_g \, m_X \, lambda \, Y$ are computed in polynomial bit time, test lists have at most $T$ entries, and every field element and product index has a polynomial-length encoding. Thus no long integer is passed as an explicit oracle query, and Table 1 describes fixed uniform machines.


#bibliography("refs.bib", style: "ieee", title: [References])
