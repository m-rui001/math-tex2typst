#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.2pt, y: 75.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Single-fold Diophantine representations]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Throughout, $bb(N) = { 0 \, 1 \, 2 \, dots.h }$. A set $S subset.eq bb(N)^n$ is #emph[recursively enumerable] if a deterministic computation accepts exactly its members; it may run forever on other inputs. A #emph[Diophantine representation] of $S$ is a polynomial

$ P in bb(Z) \[ A_1 \, dots.h \, A_n \, W_1 \, dots.h \, W_m \] $

such that $a in S$ if and only if $P \( a \, w \) = 0$ for some $w in bb(N)^m$. The representation is #emph[single-fold] if this complete tuple $w$ is unique whenever it exists. It is #emph[finite-fold] if the set of such tuples is finite for every input. These definitions count all auxiliary variables, including those used to express subsidiary arithmetic operations.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 1$ and every recursively enumerable set $S subset.eq bb(N)^n$, there are an integer $m gt.eq 1$ and a polynomial $P in bb(Z) \[ A_1 \, dots.h \, A_n \, W_1 \, dots.h \, W_m \]$ such that, for every $a in bb(N)^n$, 
$ \# { w in bb(N)^m : P \( a \, w \) = 0 } = cases(delim: "{", 1 \, & a in S \,, 0 \, & a in.not S .) $

]
] <thm:main>

The Davis–Putnam–Robinson theorem established exponential Diophantine representations of recursively enumerable relations: the defining expressions may use exponentiation as well as addition and multiplication #cite(label("dpr1961")) Section 1. Robinson had shown how suitable growth conditions yield an existential definition of exponentiation #cite(label("robinson1952")) Section 3. Matiyasevich’s 1970 construction of an exponentially growing Diophantine relation completed this route to polynomial representations #cite(label("mati1970")) Sections 1 and 3. The resulting representation theorem implies the negative solution of Hilbert’s tenth problem, since a decision procedure for polynomial solvability would decide membership in every recursively enumerable set. It does not bound the number of witnesses.

Matiyasevich obtained a different strengthening in 1974: every recursively enumerable relation has an exponential representation with a unique complete auxiliary tuple #cite(label("mati1974")) Section 2, Main Theorem. The same paper already formulates the remaining problem of polynomial representations with this uniqueness and reduces it to single-fold binary exponentiation #cite(label("mati1974")) Section 1. This is the single-fold conjecture; allowing finitely many witnesses gives the finite-fold conjecture #cite(label("mati2010")). Theorem 1 proves the single-fold assertion over $bb(N)$. The witness domain matters: Miller and Shlapentokh obtain single-fold definitions of computably enumerable sets of rational integers using witnesses in characteristic-zero polynomial rings, and finite-fold definitions of computably enumerable relations in polynomial rings over rings of integers of totally real number fields #cite(label("millershlapentokh2022")).

Our arithmetic construction develops the classical strategy of recovering powers from Pell solutions and controlling their indices through growth bounds. Cantone, Cuzziol, and Omodeo give a recent account, including a paired-Pell representation and the problem of replacing its exponential cutoff #cite(label("cco2024")) Section 6, Lemma 6.1 and Theorem 5; Section 7. We supply a cutoff using rational points on a rank-one elliptic curve. Poonen uses rank-one curves and denominator growth to obtain Diophantine definitions between rings of integers #cite(label("poonen2002")) Theorem 1 and Section 2.3, Lemma 8. Here the Néron–Tate height compares the full logarithmic x-coordinate height with a quadratic function of an integer index, with uniformly bounded additive error #cite(label("silverman")) Chapter VIII, Proposition 9.1 and Theorem 9.3. The bounded additive error makes the exact index selection below possible.

The computational construction uses the bit-masking method of Jones and Matiyasevich #cite(label("jm1984")) #cite(label("jm1991")). Large-base encodings turn a finite register-machine history into finitely many integers, and Lucas’s binomial congruence tests the permitted binary digits. Determining the base from the input and computation time already appears in Chaitin’s account #cite(label("chaitin1987")) Sections 2.3 and 2.6. We use a clock and a dyadic interval to select one base for the entire run. Throughout both constructions, uniqueness must include reduced rational coordinates, arithmetic quotients and slacks, and the variables of inactive cases. The proof keeps this complete-witness requirement through every substitution.

The arithmetic constants in the proof are fixed once for all sets $S$ and all inputs. They include rational points and integers whose existence is established below, but whose numerical values are not specified. The theorem therefore gives existence of an integer polynomial without displaying its coefficients or a procedure for numerically choosing those constants.

#thm([Corollary 1.2.])[
  (Undecidability with an at-most-one-solution promise).  #emph[There exist integers $m \, D gt.eq 1$ for which no algorithm has the following property: on every input polynomial $F in bb(Z) \[ W_1 \, dots.h \, W_m \]$ of total degree at most $D$ satisfying the promise 
$ \# { w in bb(N)^m : F \( w \) = 0 } lt.eq 1 \, $

 the algorithm halts and correctly decides whether this set is nonempty.]
] <cor:unique-h10>

The proof appears in Section 8, after the construction of the single-fold representation.

=== 1.1 Proof overview <proof-overview>

The problem is to retain uniqueness when a computation is expressed by polynomial equations. We first obtain unique arithmetic witnesses, then a unique encoding of the accepting run. Section 2 explains how composition and disjoint cases preserve the complete witness, including variables introduced inside subsidiary calls.

The arithmetic step begins with the rational points of $E : y^2 = x^3 - 25 x$. Its group is $bb(Z) P xor cal(T)$, with $cal(T)$ finite. Section 3 gives unique natural-number codes for rational coordinates and point addition; Appendix 9 contains the rank calculation. Section 4 selects one point for each positive absolute index $j = \| n \|$ among points $n P + t$, where $n in bb(Z)$ and $t in cal(T)$. Apply a fixed scalar multiplication to each selected point. Let $W_j$ be the maximum of the absolute reduced numerator and positive denominator of its x-coordinate. These integer heights satisfy

$ log W_j = a_E j^2 + O \( 1 \) \, #h(2em) a_E > 0 \, $

with a uniformly bounded error. The scalar can enlarge $a_E$ while leaving that error bound fixed; a sufficiently large scalar also makes the sequence strictly increasing.

A discrete difference of the quadratic main term makes exact index selection possible. For positive indices $k \, r$, the height product obeys

$ log frac(W_(2 k) W_r W_1, W_k^2 W_(r + 1)) = 2 a_E \( k^2 - r \) + O \( 1 \) . $

The error is bounded independently of both indices. A fixed multiplicative window for the ratio therefore singles out $r = k^2$, once $a_E$ is large enough to separate distinct integer values of $k^2 - r$. The conditions use only products, comparisons and fixed additions of rational points; the indices and logarithms belong to their proof, not to the polynomial system.

For an input $u$, first choose the unique index $k$ with $W_k lt.eq u + W_1 < W_(k + 1)$, and then select the point at index $k^2$ by this window. The output $g \( u \) = W_(k^2)$ has a single-fold graph. For large $u$, the quantity $k^2$ is comparable to $log u$, and the logarithm of the output is comparable to $\( log u \)^2$. In particular, for some $delta > 0$ and all sufficiently large $u$,

$ delta \( log u \)^2 < log g \( u \) < u log u . $

Section 5 uses these two bounds to select prescribed solutions of two Pell equations. The upper bound forces their indices below a modulus, so congruences determine those indices exactly. The lower bound ensures that the intended solutions are admitted. An integer quotient then recovers $c = b^n$, with a unique complete witness for every $b gt.eq 2$ and $n gt.eq 0$. Section 6 uses powers and binomial parity to test whether every nonzero binary digit of one integer is also nonzero in another.

Finally, Section 7 packs a deterministic counter machine’s states and counter values into digits of finitely many integers. Binary containment restricts the permitted digits, and polynomial identities enforce transitions and the first accepting halt. A clock fixes one power-of-two base for the entire run. Thus every solution decodes to the actual accepting computation, and that computation determines exactly one complete tuple. Substituting the single-fold arithmetic systems and taking a sum of squares proves Theorem 1. Appendix 10 specifies all coordinates counted in this uniqueness assertion.

== 2 Polynomial constructions with unique witnesses <sec:conventions>

This section fixes the meaning of the polynomial notation used in the proof. Its purpose is to make uniqueness survive every substitution, case distinction, and auxiliary arithmetic operation.

#prodef([Definition 2.1.])[
  A #emph[single-fold polynomial system] for a relation $R subset.eq bb(N)^d$ is a finite list of integer polynomial equations $F_i \( a \, z \) = 0$ such that the set of complete tuples $z$ is a singleton for $a in R$ and empty otherwise. A #emph[single-fold graph] of a function $f : D arrow.r bb(N)^e$, where $D subset.eq bb(N)^d$, is such a system for ${ \( a \, f \( a \) \) : a in D }$. Thus each input $a in D$ determines both the output and all further auxiliary variables uniquely. Inputs outside $D$ have no solutions.
]

All unspecified variables in polynomial systems range over $bb(N)$. Integer polynomials may have negative coefficients. In particular, a displayed inequality $F gt.eq G$ means $F - G = s$ with a new variable $s in bb(N)$, and $F > G$ means $F - G = 1 + s$. The slack is unique; the values of $F$ and $G$ need not separately be nonnegative. An integer $z$ is represented by its unique sign code $z = z^(+) - z^(-)$, where $z^(+) \, z^(-) in bb(N)$ and $z^(+) z^(-) = 0$. Its absolute value is $z^(+) + z^(-)$. Whenever a polynomial expression is passed as a natural-number argument to a system, it can be replaced by a fresh variable equal to that expression. This introduces a unique variable and enforces the required nonnegativity.

The following closure operations belong to the single-fold constructions of #cite(label("mati1974")) Sections 3.1–3.3. In particular, disjoint alternatives require fixing variables that are unused in the chosen case; see also #cite(label("cco2024")) Section 2, pp. 590–591. We state the precise version needed here.

#thm([Lemma 2.2.])[
  (Composition and disjoint cases).  #emph[Finite conjunctions of single-fold polynomial systems, using separate auxiliary tuples for distinct calls, preserve uniqueness for fixed values of all their displayed arguments. Composition of single-fold graphs preserves uniqueness of outputs and complete auxiliary tuples. A finite union of single-fold relations also has a single-fold system if their displayed argument sets are pairwise disjoint.]
] <lem:composition>

#proof[
  For conjunction, each auxiliary tuple is fixed by its call’s arguments. In a composition of functions, fix the first input and successively determine every intermediate output and its auxiliary tuple. This proves both existence and uniqueness along the chain.
  For a disjoint union with $r$ cases, introduce selectors $e_1 \, dots.h \, e_r$ with
  $ e_i \( e_i - 1 \) = 0 \, #h(2em) sum_(i = 1)^r e_i = 1 . $
  Write every equation in case $i$, including its guard and all equations inside nested calls, in the form $F = 0$, and replace it by $e_i F = 0$. For each variable $z$ local to this case, also impose $\( 1 - e_i \) z = 0$. This last rule applies to all local coordinates, outputs of local calls, normalization variables, selectors, and slacks, including those inside nested calls. Displayed arguments shared between cases are not local variables. Exactly one selector equals one. Its case has its unique witness tuple, while every other case has all local variables zero. Disjointness makes the selector itself unique. ◻
]

When defining a function by cases, we additionally require the guards to partition its input domain and each active case to determine the shared output. This is the form used below.

For example, $h = max \( a \, b \)$ is obtained from the disjoint cases $a gt.eq b$, $h = a$ and $a < b$, $h = b$. The strict inequality in the second guard assigns ties to one case. Quotient and remainder on division by a positive integer $d$ are specified by $a = d q + r$ and $r < d$; both and the slack are unique. No unbounded choice of a Bézout coefficient or of an inactive-case variable is permitted in the constructions below.

Point coordinates will be given fixed tuples of natural numbers in Section 3. A single-fold system on such points always means a system on these entire tuples. To use an unprescribed point existentially, its entire code is part of the witness. We will prove uniqueness of that point before appealing to uniqueness of its code.

Finally, a finite system $F_1 = dots.h.c = F_r = 0$ is equivalent over $bb(N)$ to

#[#set math.equation(numbering: n => "(1)")
 $ F_1^2 + dots.h.c + F_r^2 = 0 . $ <eq:squares>]

This changes neither its variables nor its solutions. We may consequently work with finite systems until the final conversion to one polynomial.

== 3 A rank-one curve with unique arithmetic codes <sec:elliptic>

This section supplies unique polynomial codes for the rational points of a rank-one elliptic curve. Its group structure provides the integer index used by the height construction in Section 4. We first record that structure, then implement rational coordinates and the group law using the single-fold conventions of Section 2.

=== 3.1 The curve and its rational points <the-curve-and-its-rational-points>

Let

$ E : quad y^2 = x^3 - 25 x $

denote the nonsingular projective cubic obtained by adjoining $O = \[ 0 : 1 : 0 \]$ to this affine equation. We use its chord–tangent group law with identity $O$. Negation sends $\( x \, y \)$ to $\( x \, - y \)$.

#thm([Proposition 3.1.])[
  #emph[The group $E \( bb(Q) \)$ has rank one and torsion subgroup 
$ cal(T) = { O \, \( 0 \, 0 \) \, \( 5 \, 0 \) \, \( - 5 \, 0 \) } . $

 Consequently there exists $P in E \( bb(Q) \)$ such that every rational point has a unique expression $n P + t$, with $n in bb(Z)$ and $t in cal(T)$.]
] <prop:rank-one>

A complete two-isogeny descent proof is given in Appendix 9. The construction below uses the group decomposition in the proposition and the explicit torsion points.

=== 3.2 Unique codes for rational coordinates <unique-codes-for-rational-coordinates>

We must count all coordinates of a rational-point computation, including the witnesses for reducedness. Restricting a Bézout coefficient to one residue interval is a standard way to make coprimality witnesses unique; see #cite(label("cco2024")) Section 2. The following shifted inverse identity also handles denominator one without a separate case. A rational number is represented by six natural numbers $\( p \, n \, d \, t \, s \, q \)$ satisfying

#[#set math.equation(numbering: n => "(2)")
 $ p n = 0 \, #h(2em) d = 1 + t + s \, #h(2em) \( p + n \) t + d = 1 + q d . $ <eq:rational-code>]

Its value is $\( p - n \) \/ d$. The denominator is positive and $0 lt.eq t < d$; the last equation asserts that $t$ is an inverse of $p + n$ modulo $d$.

#thm([Lemma 3.2.])[
  #emph[Every rational number has exactly one code satisfying (2). Any fixed finite sequence of rational additions, subtractions, multiplications, divisions by nonzero divisors, and comparisons on valid codes has a polynomial implementation with unique outputs and auxiliary coordinates.]
] <lem:rational-codes>

#proof[
  Put $a = p + n$. Equation (2) gives $gcd \( a \, d \) = 1$, so the represented fraction is reduced. The constraint $p n = 0$ uniquely splits its numerator into its positive and negative parts. Conversely a reduced fraction with positive denominator fixes $p \, n \, d$. If $d > 1$, its inverse modulo $d$ has exactly one representative $t$ in $\[ 0 \, d - 1 \]$; then
  $ s = d - 1 - t \, #h(2em) q = frac(\( p + n \) t + d - 1, d) $
  are uniquely determined nonnegative integers. If $d = 1$, the equations force $t = s = q = 0$. In particular the unique code of zero is $\( 0 \, 0 \, 1 \, 0 \, 0 \, 0 \)$.
  Clear positive denominators in any prescribed rational arithmetic equation. For instance, if the signed numerator and denominator of the $i$-th code are $a_i \, d_i$, the equation $z_1 + z_2 = z_3$ becomes $a_1 d_2 d_3 + a_2 d_1 d_3 = a_3 d_1 d_2$. The same procedure applies to products and to any fixed rational expression whose denominators are known to be nonzero. A comparison becomes an integer polynomial comparison after multiplication by positive denominators, and has a unique slack as in Section 2. When the resulting rational value is uniquely specified, its entire code is unique by the first part. ◻
]

A point code consists of two valid rational codes and a flag $o in { 0 \, 1 }$. For $o = 1$, force both rational numerators to zero; this gives the unique dummy coordinate pair $\( 0 \, 0 \)$ and represents $O$. For $o = 0$, impose the affine curve equation. More explicitly, if the coordinate numerators and denominators are $a_x \, d_x \, a_y \, d_y$, this equation is

$ a_y^2 d_x^3 = d_y^2 \( a_x^3 - 25 a_x d_x^2 \) . $

The implications are imposed by multiplication by $o$ or $1 - o$. Thus every point of $E \( bb(Q) \)$ has exactly one point code; the flag distinguishes $O$ from the affine point $\( 0 \, 0 \)$.

#thm([Lemma 3.3.])[
  #emph[Given valid codes for $Q_1 \, Q_2 in E \( bb(Q) \)$, addition has a polynomial implementation with a unique output code for $Q_1 + Q_2$ and a unique complete tuple of auxiliary coordinates. The same is true of any fixed finite chain of additions and of multiplication by any fixed positive integer.]
] <lem:point-arithmetic>

#proof[
  The output is a shared valid point code. Use the following disjoint cases, with their guards included in the corresponding systems:
  + $Q_1 = O$: return $Q_2$.
  + $Q_1 eq.not O$, $Q_2 = O$: return $Q_1$.
  + Both inputs affine and $x_1 < x_2$.
  + Both inputs affine and $x_1 > x_2$.
  + Both inputs affine, $x_1 = x_2$, and $y_1 + y_2 = 0$: return $O$.
  + Both inputs affine, $x_1 = x_2$, $y_1 = y_2 > 0$.
  + Both inputs affine, $x_1 = x_2$, $y_1 = y_2 < 0$.
  At equal x-coordinates the curve equation gives $y_1^2 = y_2^2$. If the points are not negatives, they therefore have equal nonzero y-coordinates. This proves that the list is exhaustive as well as disjoint.
  In Cases 3 and 4 introduce a case-local rational slope code and impose
  $ lambda \( x_2 - x_1 \) = y_2 - y_1 . $
  In Cases 6 and 7 instead impose
  $ 2 y_1 lambda = 3 x_1^2 - 25 . $
  The coefficient of $lambda$ is nonzero in each case, so its value and complete code are unique. In all four cases require an affine output and impose
  $ x_3 = lambda^2 - x_1 - x_2 \, #h(2em) y_3 = lambda \( x_1 - x_3 \) - y_1 . $
  These are the chord–tangent formulas; they give the required point on the curve. Cases 1, 2, and 5 specify their output directly.
  Apply the gated-case construction of Section 2. In particular, the reducedness equations for a local slope code are gated along with its other equations, and every coordinate of an inactive slope code is forced to zero. Only the shared output code remains globally valid. Thus no inactive branch contributes a choice. Lemma 6 gives uniqueness of every active arithmetic witness. Induction along a fixed finite chain proves the final assertions. ◻
]

Fixed rational points may now be inserted by their fixed integer codes. We henceforth fix $P$ as in Proposition 5, as well as the four points of $cal(T)$. No assertion that the construction numerically computes this choice of $P$ is needed.

== 4 A uniquely represented function with intermediate growth <sec:growth>

We now use the curve to construct a total single-fold function whose growth is faster than every fixed power and slower than $u^u$. The group decomposition provides an integer index, but the polynomial systems will quantify only uniquely coded rational points. A height comparison will select both a point at a given scale and a second point whose index is the square of the first. Rank-one elliptic curves have been used in Diophantine definability; see Poonen #cite(label("poonen2002")). Here we use the full rational x-height: its bounded logarithmic error permits an exact comparison of integer indices. The construction below proves the required single-fold graph directly.

=== 4.1 Uniform heights and representatives <uniform-heights-and-representatives>

For a reduced rational number $a \/ d$ with $d > 0$, define

$ H \( a \/ d \) = max { \| a \| \, d } . $

Put $h_x \( Q \) = log H \( x \( Q \) \)$ for affine $Q$, and $h_x \( O \) = 0$. We use the canonical height with normalization

$ hat(h) \( Q \) = 1 / 2 lim_(N arrow.r oo) 4^(- N) h_x \( \[ 2^N \] Q \) . $

The Néron–Tate canonical-height theorem gives existence of this limit, $hat(h) \( \[ j \] Q \) = j^2 hat(h) \( Q \)$, and $hat(h) \( Q \) > 0$ for nontorsion rational $Q$. Since $x$ is an even function of degree two, it also gives a constant $c_E > 0$, depending only on this curve and coordinate, such that

#[#set math.equation(numbering: n => "(3)")
 $ \| log H \( x \( Q \) \) - 2 hat(h) \( Q \) #scale(x: 120%, y: 120%)[\|] lt.eq c_E #h(2em) \( Q in E \( bb(Q) \) \, med Q eq.not O \) . $ <eq:uniform-height>]

These are precisely the uniform comparison and quadraticity statements of #cite(label("silverman")) Chapter VIII, Proposition 9.1 and Theorem 9.3.

We will compare a bounded height error with the gap between distinct integer indices. A fixed scalar multiplication enlarges the quadratic coefficient while leaving the uniform error bound unchanged. Choose an integer $kappa > e^(6 c_E)$, then choose a positive even integer $m_(*)$ so large that $a_E = 2 m_(*)^2 hat(h) \( P \)$ satisfies

#[#set math.equation(numbering: n => "(4)")
 $ a_E > 2 c_E \, #h(2em) 2 a_E - 6 c_E > log kappa . $ <eq:height-constants>]

Such a choice exists because $hat(h) \( P \) > 0$.

Define a positive integer-valued function on rational points by

$ W \( Q \) = cases(delim: "{", H \( x \( \[ m_(*) \] Q \) \) \, & \[ m_(*) \] Q eq.not O \,, 1 \, & \[ m_(*) \] Q = O .) $

It has a unique polynomial computation from the point code: compute $\[ m_(*) \] Q$ using Lemma 7, and take the maximum of the absolute numerator $p + n$ and denominator $d$ in its x-code. The dummy x-code at infinity gives the same value one. The two disjoint comparisons used to compute a maximum have unique slacks and selectors.

Because $m_(*)$ kills $cal(T)$, the value of $W \( n P + t \)$ depends only on $j = \| n \|$. Denote it by $W_j$. Then

#[#set math.equation(numbering: n => "(5)")
 $ W_0 = 1 \, #h(2em) log W_j = a_E j^2 + epsilon_j \, quad \| epsilon_j \| lt.eq c_E quad \( j gt.eq 1 \) . $ <eq:quadratic-sequence>]

In particular $W_1 > 1$. For $j gt.eq 1$ the successive logarithmic difference is at least $a_E \( 2 j + 1 \) - 2 c_E > 0$. Hence $\( W_j \)_(j gt.eq 0)$ is strictly increasing and unbounded.

We next choose one point for each positive absolute index. Call a rational point $Q$ a #emph[representative] if it satisfies

#[#set math.equation(numbering: n => "(6)")
 $ Q eq.not O \, #h(2em) y \( Q \) gt.eq 0 \, #h(2em) W \( Q \) > 1 \,\
Q + t eq.not O quad upright("and") quad x \( Q \) gt.eq x \( Q + t \) #h(2em) \( t in cal(T) \) . $ <eq:representative>]

This is a finite polynomial system on its point code, with unique auxiliaries for each point satisfying it: there are only four translates, and their addition and comparison computations are unique.

#thm([Lemma 4.1.])[
  #emph[For each integer $j gt.eq 1$, exactly one point in $\( j P + cal(T) \) union \( - j P + cal(T) \)$ satisfies (6). These are all the representatives.]
] <lem:representatives>

#proof[
  The condition $W \( Q \) > 1$ excludes exactly the torsion points by (5). Every translate of a nontorsion point by torsion is affine. In a coset $j P + cal(T)$, $j eq.not 0$, the x-coordinates are distinct: equality of two x-coordinates on the short Weierstrass curve means that the points are equal or negatives. Equality identifies the torsion translates; the negative possibility would imply that $2 j P$ is torsion.
  The finite coset therefore has a unique point of maximal x-coordinate. The inequalities in (6) pick precisely this point. Negation sends it to the unique maximal point in the opposite coset, since negation preserves x and permutes $cal(T)$. Neither maximal point has y-coordinate zero, because such points are torsion. Exactly one of the two has positive y-coordinate. This proves the claim, including exhaustiveness by Proposition 5. ◻
]

=== 4.2 Selecting and squaring an index <selecting-and-squaring-an-index>

The next construction specifies its points by finitely many height comparisons. Its proof of uniqueness uses the index in $E \( bb(Q) \) \/ cal(T)$; that index is not an additional variable of the polynomial system.

#thm([Proposition 4.2.])[
  #emph[There are a total function $g : bb(N) arrow.r bb(N)$, a real constant $delta > 0$, and an integer $u_0 gt.eq 4$ such that the graph of $g$ has a single-fold Diophantine representation, including uniqueness of its output and every auxiliary coordinate for each input, and 
#[#set math.equation(numbering: n => "(7)")
 $ delta \( log u \)^2 < log g \( u \) < u log u #h(2em) \( u gt.eq u_0 \) . $ <eq:growth-bounds>]

]
] <prop:growth>

#proof[
  #emph[Selecting an index at the input scale.] The integer $W_1 = W \( P \)$ is now fixed. On input $u in bb(N)$, require a representative $Q$ satisfying
  #[#set math.equation(numbering: n => "(8)")
   $ W \( Q \) lt.eq u + W_1 < max { W \( Q + P \) \, W \( Q - P \) } . $ <eq:index-bracket>]
  If $Q$ has absolute index $k gt.eq 1$, its two neighbors have W-values $W_(k - 1)$ and $W_(k + 1)$, in some order. Thus their maximum is $W_(k + 1)$. Since the sequence is strictly increasing and unbounded, and $u + W_1 gt.eq W_1$, there is exactly one $k gt.eq 1$ such that
  $ W_k lt.eq u + W_1 < W_(k + 1) . $
  Lemma 8 then gives exactly one permissible point $Q$. This reasoning includes $u = 0$, for which $k = 1$.
  #emph[Selecting the squared index.] Require a second representative $R$. To derive the comparisons that will determine it, write $r gt.eq 1$ for its absolute index. Like $k$, this is notation for the proof, not a variable of the system. We want to impose $r = k^2$ using only point operations and height comparisons. The quadratic main terms in (5) suggest the identity
  $ \( 2 k \)^2 - 2 k^2 - #scale(x: 120%, y: 120%)[\(] \( r + 1 \)^2 - r^2 #scale(x: 120%, y: 120%)[\)] + 1 = 2 \( k^2 - r \) . $
  Thus the first difference in $r$ cancels its quadratic term, while doubling $k$ leaves a multiple of $k^2$. The same linear combination of logarithmic heights therefore tests $k^2 - r = 0$ with bounded error. Products express this test without logarithms: using the unique point and height computations, form the positive integers
  $ L_0 & = W \( \[ 2 \] Q \) thin W \( R \) thin W_1 \,\
D_0 & = W \( Q \)^2 max { W \( R + P \) \, W \( R - P \) } \, $
  and impose
  #[#set math.equation(numbering: n => "(9)")
   $ L_0 lt.eq kappa D_0 \, #h(2em) D_0 lt.eq kappa L_0 . $ <eq:square-window>]
  The neighbor maximum in $D_0$ equals $W_(r + 1)$, by the same argument as for $Q$. All indices in the following calculation are positive, so (5) gives
  $ log L_0 / D_0 & = a_E #scale(x: 120%, y: 120%)[\(] \( 2 k \)^2 + r^2 + 1 - 2 k^2 - \( r + 1 \)^2 #scale(x: 120%, y: 120%)[\)] + e\
 & = 2 a_E \( k^2 - r \) + e \, #h(2em) \| e \| lt.eq 6 c_E . $
  The error has six terms when multiplicity is counted: one each from $W_(2 k) \, W_r \, W_1 \, W_(r + 1)$, and two from $W_k$. If $r = k^2$, its absolute value is less than $log kappa$, so (9) holds. If $r eq.not k^2$, integer separation and (4) give
  $ lr(|log L_0 / D_0|) gt.eq 2 a_E - 6 c_E > log kappa \, $
  so the window fails. Therefore exactly the representative of absolute index $k^2$ can serve as $R$. Figure 1 illustrates this separation.
  #emph[Totality and unique witnesses.] Set the output to
  $ g \( u \) = W \( R \) = W_(k^2) . $
  The construction uses only fixed addition chains, rational point codes, maxima, products, and comparisons. It is therefore a finite polynomial system. For every $u$, the bracket pins $Q$ and the window pins $R$. Once these points are fixed, their complete codes, every intermediate point and height, all comparison slacks, and all branch selectors are fixed. Lemmas 6 and 7, together with the inactive-variable convention, give uniqueness of every expanded auxiliary. Conversely those uniquely specified points and computations satisfy the system. This proves totality and the single-fold assertion before any asymptotic cutoff is chosen.
  #emph[Growth estimates.] Write $U = u + W_1$. The bracket and (5) imply
  #[#set math.equation(numbering: n => "(10)")
   $ a_E k^2 - c_E lt.eq log U < a_E \( k + 1 \)^2 + c_E lt.eq 4 a_E k^2 + c_E . $ <eq:index-growth-estimate>]
  For all sufficiently large $u$, the upper estimate on $log U$ gives $k^2 > log u \/ \( 8 a_E \)$. Hence
  $ log g \( u \) gt.eq a_E k^4 - c_E > frac(\( log u \)^2, 128 a_E) $
  eventually. We may take $delta = 1 \/ \( 128 a_E \)$. The other estimate in (10) gives
  $ log g \( u \) lt.eq a_E k^4 + c_E lt.eq frac(\( log \( u + W_1 \) + c_E \)^2, a_E) + c_E = O \( \( log u \)^2 \) . $
  This is eventually strictly less than $u log u$. Choose an integer $u_0 gt.eq 4$ beyond both thresholds, proving (7). ◻
]

The real constants used in the estimates are not variables or coefficients of the polynomial system. They justify choices of fixed integers, while all fixed rational points enter through integer codes. Proposition 9 is thus an existence statement about an integer polynomial; no numerical determination of a generator or of the height constants is asserted.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((1, -0.62), (9, 0.62), fill: rgb("#ededff"), stroke: none)
  line((1, 0.62), (9, 0.62), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1, -0.62), (9, -0.62), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1, -2.35), (1, 2.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((1, 2.5), [#text(size: 9pt)[$log (L_0"/"D_0)$]], anchor: "south-west", padding: 0.1176cm)
  line((1, 0), (9.2, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((9.2, 0), [#text(size: 9pt)[$r$]], anchor: "west", padding: 0.1176cm)
  content((1, 0.62), [#text(size: 9pt)[$log kappa$]], anchor: "east", padding: 0.1176cm)
  content((1, -0.62), [#text(size: 9pt)[$- log kappa$]], anchor: "east", padding: 0.1176cm)
  line((1, 1.8), (3, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((1, -1.8), (7, -1.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((1, 1.8), [#text(size: 9pt)[$2a_E$]], anchor: "east", padding: 0.1176cm)
  content((1, -1.8), [#text(size: 9pt)[$-2a_E$]], anchor: "east", padding: 0.1176cm)
  line((3, 1.5), (3, 2.1), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((2.88, 1.5), (3.12, 1.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2.88, 2.1), (3.12, 2.1), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((3, 1.8), radius: 0.05292, fill: black, stroke: none)
  line((5, -0.3), (5, 0.3), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((4.88, -0.3), (5.12, -0.3), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((4.88, 0.3), (5.12, 0.3), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((5, 0), radius: 0.05292, fill: black, stroke: none)
  line((7, -2.1), (7, -1.5), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((6.88, -2.1), (7.12, -2.1), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((6.88, -1.5), (7.12, -1.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((7, -1.8), radius: 0.05292, fill: black, stroke: none)
  content((3, -2.42), [#text(size: 9pt)[$k^2-1$]], anchor: "north", padding: 0.1176cm)
  content((5, -2.42), [#text(size: 9pt)[$k^2$]], anchor: "north", padding: 0.1176cm)
  content((7, -2.42), [#text(size: 9pt)[$k^2+1$]], anchor: "north", padding: 0.1176cm)
  content((7.4, 1.8), [#text(size: 9pt)[error radius#linebreak()$6c_E$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The index window, schematically for $k gt.eq 2$. At index $r$, the logarithmic ratio lies within $6 c_E$ of $2 a_E \( k^2 - r \)$. The choice $6 c_E < log kappa < 2 a_E - 6 c_E$ puts the entire middle interval in the admissible band and every other integer-index interval outside it. The error bars represent bounds, not additional variables. ],
) <fig:height-window>

The uniqueness assertion includes every intermediate point in every fixed scalar chain, all six coordinates of each rational code, and every nested comparison or branch witness. Inactive local tuples are zero. Appendix 10 specifies the complete tuple and follows it through the power and computation constructions.

== 5 A power graph from a growth function <sec:power>

We now turn the growth function into a single-fold definition of exponentiation. The two sides of its growth estimate serve different purposes. The upper bound limits the indices of solutions to two Pell equations, so that congruences determine those indices. The lower bound ensures that the intended Pell solutions satisfy the imposed limit. The use of Pell sequences to recover exponentiation belongs to the classical Diophantine representation method. The paired Pell equations, index congruences, and quotient used here adapt Matiyasevich’s exponential single-fold construction #cite(label("mati1974")) Section 4, as presented in #cite(label("cco2024")) Section 6, Lemma 6.1 and Theorem 5. Our cutoff is supplied by the complete single-fold polynomial graph of Proposition 9. We begin with the elementary facts about Pell equations needed for this argument.

#thm([Lemma 5.1.])[
  #emph[For an integer $a gt.eq 2$, put $D = a^2 - 1$ and define integers $x_i \( a \) \, y_i \( a \)$ by 
$ \( a + sqrt(D) \)^i = x_i \( a \) + y_i \( a \) sqrt(D) #h(2em) \( i gt.eq 0 \) . $

 Every solution in positive integers of $x^2 - D y^2 = 1$ is $\( x_i \( a \) \, y_i \( a \) \)$ for exactly one $i gt.eq 1$. Moreover, 
#[#set math.equation(numbering: n => "(11)")
 $ y_i \( a \) equiv i med \( mod med a - 1 \) \, #h(2em) \( 2 a - 1 \)^(i - 1) lt.eq y_i \( a \) lt.eq \( 2 a \)^(i - 1) quad \( i gt.eq 1 \) . $ <eq:pell-bounds>]

 If $b \, u gt.eq 2$ and $n gt.eq 0$ are integers, then 
#[#set math.equation(numbering: n => "(12)")
 $ b^n lt.eq frac(y_(n + 1) \( b u \), y_(n + 1) \( u \)) lt.eq b^n (1 + frac(1, 2 u - 1))^n . $ <eq:pell-ratio>]

]
] <lem:pell-sequences>

#proof[
  The integer $D$ lies strictly between $\( a - 1 \)^2$ and $a^2$, so it is not a square. Write $alpha = a + sqrt(D)$. Its inverse is $a - sqrt(D)$, and both belong to $bb(Z) \[ sqrt(D) \]$. Every positive power of $alpha$ has positive integer coefficients and norm one. For any positive solution, $beta = x + y sqrt(D) > 1$ has inverse $x - y sqrt(D) > 0$. Choose the unique integer $i gt.eq 0$ for which
  $ 1 lt.eq gamma := beta alpha^(- i) < alpha . $
  The coefficients of $gamma = x' + y' sqrt(D)$ are integers and its norm is one. If $gamma > 1$, then
  $ x' = frac(gamma + gamma^(- 1), 2) > 0 \, #h(2em) y' = frac(gamma - gamma^(- 1), 2 sqrt(D)) > 0 . $
  Thus $y' gt.eq 1$ and $x' ""^2 = 1 + D y' ""^2 gt.eq a^2$, which implies $gamma gt.eq alpha$, a contradiction. Consequently $gamma = 1$ and $beta = alpha^i$. Since $beta > 1$, the index is positive; it is unique because $alpha > 1$.
  Taking coefficients gives
  $ y_0 \( a \) = 0 \, quad y_1 \( a \) = 1 \, quad y_(i + 2) \( a \) = 2 a thin y_(i + 1) \( a \) - y_i \( a \) . $
  Reduction modulo $a - 1$ proves the congruence in (11) by induction. For $i gt.eq 1$ define $R_i \( a \) = y_(i + 1) \( a \) \/ y_i \( a \)$. The recurrence gives
  $ R_1 \( a \) = 2 a \, #h(2em) R_(i + 1) \( a \) = 2 a - frac(1, R_i \( a \)) . $
  Induction therefore yields $2 a - 1 lt.eq R_i \( a \) lt.eq 2 a$. Multiplying these bounds proves the remaining assertions of (11). In particular,
  #[#set math.equation(numbering: n => "(13)")
   $ y_(n + 1) \( a \) gt.eq \( 2 a - 1 \)^n gt.eq n + 1 #h(2em) \( n gt.eq 0 \) . $ <eq:pell-index-lower>]
  We also have $R_i \( b u \) gt.eq b R_i \( u \)$ for every $i gt.eq 1$. There is equality for $i = 1$, and the induction step follows from
  $ R_(i + 1) \( b u \) - b R_(i + 1) \( u \) = frac(b, R_i \( u \)) - frac(1, R_i \( b u \)) gt.eq 0 . $
  On the other hand, the bounds just proved give
  $ frac(R_i \( b u \), R_i \( u \)) lt.eq frac(2 b u, 2 u - 1) . $
  Multiplication for $i = 1 \, dots.h \, n$ proves (12). For $n = 0$ both products are empty and $y_1 \( b u \) = y_1 \( u \) = 1$, so the same assertion holds. ◻
]

The next proposition uses only the growth estimate and the uniqueness of the entire witness for its defining system. In particular, no monotonicity hypothesis on the growth function is needed.

#thm([Proposition 5.2.])[
  #emph[Suppose that $g : bb(N) arrow.r bb(N)$ has a complete single-fold graph and that there are fixed constants $delta > 0$ and $u_0 in bb(N)$, with $u_0 gt.eq 4$, such that 
#[#set math.equation(numbering: n => "(14)")
 $ delta \( log u \)^2 < log g \( u \) < u log u #h(2em) \( u gt.eq u_0 \) . $ <eq:power-growth-hypothesis>]

 Then the relation 
$ "Pow" \( b \, n \, c \) quad arrow.l.r.double quad b gt.eq 2 med upright(" and ") med c = b^n #h(2em) \( b \, n \, c in bb(N) \) $

 has a complete single-fold representation. In particular, for each $b gt.eq 2$ and $n in bb(N)$, the output $c$ and all auxiliary variables are jointly unique.]
] <prop:power>

#proof[
  The ratio in Lemma 10 suggests taking $c$ as the integer quotient of $y_(n + 1) \( b u \)$ by $y_(n + 1) \( u \)$. To make its error less than one without introducing a free scale, we prescribe $u$ as a polynomial in $c \, b \, n$. Once the cutoff and congruences have fixed both Pell indices at $n + 1$, the lower ratio bound gives $c gt.eq b^n$, allowing the factor $c + 1$ to control the error. For the intended output $c = b^n$, a sufficiently large fixed power of $c + 1$ also makes $g \( u \)$ exceed both intended Pell coordinates.
  Choose a fixed positive integer
  #[#set math.equation(numbering: n => "(15)")
   $ ell > frac(3, delta log 2) . $ <eq:power-ell>]
  Use the following finite system, in which all displayed variables are natural numbers and $v = g \( u \)$ denotes one call to the given single-fold system:
  #[#set math.equation(numbering: n => "(16)")
   $ & b gt.eq 2 \, #h(2em) u = \( c + 1 \)^ell \( n + 1 \) \( b + 1 \) + u_0 \, #h(2em) v = g \( u \) \,\
 & X^2 - #scale(x: 120%, y: 120%)[\(] \( b u \)^2 - 1 #scale(x: 120%, y: 120%)[\)] F^2 = 1 \, #h(2em) Y^2 - \( u^2 - 1 \) H^2 = 1 \,\
 & 0 < F < v \, #h(2em) 0 < H < v \,\
 & F = n + 1 + \( b u - 1 \) q \, #h(2em) H = n + 1 + \( u - 1 \) q' \,\
 & F = c H + r \, #h(2em) r < H . $ <eq:power-input>]
  The exponent $ell$ is fixed, so the formula for $u$ is polynomial. As in Section 2, each inequality contributes its unique slack variable. The constants in (14) determine the choice of $ell$. Only the fixed integers $ell \, u_0$ enter the system; $delta$ and logarithms occur only in its proof.
  #emph[Every solution has the prescribed output.] First observe the numerical bound
  #[#set math.equation(numbering: n => "(17)")
   $ u^u < \( 2 u - 1 \)^(u - 1) #h(2em) \( u in bb(N) \, med u gt.eq 4 \) . $ <eq:pell-index-cutoff>]
  Indeed, let $f \( u \) = \( 2 - 1 \/ u \)^(u - 1) \/ u$. Then $f \( 4 \) = 343 \/ 256 > 1$, and
  $ frac(f \( u + 1 \), f \( u \)) = frac(u, u + 1) frac(\( 2 - 1 \/ \( u + 1 \) \)^u, \( 2 - 1 \/ u \)^(u - 1)) > frac(2 u - 1, u + 1) > 1 #h(2em) \( u gt.eq 4 \) . $
  This proves (17).
  In a solution to (16)–(16), $u gt.eq u_0 gt.eq 4$. The positive coordinates $F \, H$ make $X \, Y$ positive as well. Lemma 10 therefore gives unique indices $i \, j gt.eq 1$ with
  $ F = y_i \( b u \) \, #h(2em) H = y_j \( u \) . $
  By (14) and (17),
  $ F \, H < v < u^u < \( 2 u - 1 \)^(u - 1) . $
  If either index were at least $u$, the lower bound in (11) would contradict this strict inequality. Hence $1 lt.eq i \, j < u$.
  The formula for $u$ also gives $1 lt.eq n + 1 < u - 1$. The congruence for $H$ in (16) forces $j equiv n + 1 med \( mod med u - 1 \)$. Among $1 \, dots.h \, u - 1$ exactly the integer $n + 1$ has that residue. Similarly, $i equiv n + 1 med \( mod med b u - 1 \)$, and both integers lie between $1$ and $u - 1 < b u - 1$. Thus
  #[#set math.equation(numbering: n => "(18)")
   $ i = j = n + 1 . $ <eq:pinned-pell-indices>]
  We have now determined the two Pell indices. It remains to identify the integer quotient imposed by (16).
  By (12),
  $ b^n lt.eq F \/ H lt.eq b^n \( 1 + z \)^n \, #h(2em) z = frac(1, 2 u - 1) . $
  Since $0 lt.eq r < H$, the division equation gives $c = floor.l F \/ H floor.r gt.eq b^n$. We have $n z < 1$, and the binomial theorem followed by a geometric series gives
  $ \( 1 + z \)^n - 1 lt.eq sum_(h = 1)^n \( n z \)^h lt.eq frac(n z, 1 - n z) . $
  This also holds when $n = 0$, with an empty sum. It follows that
  #[#set math.equation(numbering: n => "(19)")
   $ 0 lt.eq F / H - b^n lt.eq frac(b^n n, 2 u - 1 - n) lt.eq frac(c n, 2 u - 1 - n) < 1 . $ <eq:power-quotient-error>]
  For the last inequality, the formula for $u$ and $ell gt.eq 1$ give $u gt.eq \( c + 1 \) \( n + 1 \) + 4$, whence
  $ 2 u - 1 - n - c n gt.eq c n + 2 c + n + 9 > 0 . $
  The integer quotient is consequently $c = b^n$.
  #emph[The prescribed output has a witness.] Fix $b gt.eq 2$ and $n gt.eq 0$, set $c = b^n$, and define $u$ by (16). Take the unique output and complete witness for $v = g \( u \)$, and put
  $ F = y_(n + 1) \( b u \) \, & #h(2em) X = x_(n + 1) \( b u \) \,\
H = y_(n + 1) \( u \) \, & #h(2em) Y = x_(n + 1) \( u \) . $
  These coordinates satisfy the Pell equations. The congruences in (11), together with (13), give the nonnegative integer quotients
  $ q = frac(F - n - 1, b u - 1) \, #h(2em) q' = frac(H - n - 1, u - 1) . $
  The ratio estimate and the same calculation as (19), now with $c = b^n$, give $0 lt.eq F \/ H - c < 1$. Thus $r = F - c H$ is a natural number less than $H$.
  We must still check that these particular Pell coordinates lie below $v$. From $c = b^n$ and the definition of $u$ we obtain
  $ log u gt.eq ell n log b gt.eq ell n log 2 . $
  Also $b < u$ and $2 < u$, so $log \( 2 b u \) lt.eq 3 log u$. The upper bound in (11) now gives
  #[#set math.equation(numbering: n => "(20)")
   $ log F lt.eq n log \( 2 b u \) lt.eq frac(3, ell log 2) \( log u \)^2 < delta \( log u \)^2 < log v . $ <eq:power-existence-cutoff>]
  The same estimate applies to $H$, using $H lt.eq \( 2 u \)^n lt.eq \( 2 b u \)^n$. Hence $0 < F \, H < v$, as required. When $n = 0$, these statements give explicitly
  $ c = 1 \, quad F = H = 1 \, quad X = b u \, quad Y = u \, quad q = q' = r = 0 \; $
  the strict cutoff still follows from (20).
  #emph[The whole witness is unique.] For fixed $b \, n$, the soundness argument first fixes $c$. The formula in (16) then fixes $u$, after which the single-fold hypothesis fixes $v$ and every auxiliary variable in its call. Equation (18) fixes $F \, H$. Their Pell equations fix the natural coordinates $X \, Y$, since a nonnegative square root is unique. The two residue equations fix $q \, q'$, and the division equation fixes $r$. All inequality slacks are then fixed. Any variables introduced to name polynomial arguments are fixed by their defining equalities. The indices $i \, j$ used in the proof introduce no variables in the system. Thus the complete tuple is unique. Finally, the constraint $b gt.eq 2$ excludes all solutions at $b = 0 \, 1$. ◻
]

Applying Proposition 11 to the function supplied by Proposition 9 gives the power graph used in the rest of the proof.

== 6 Testing containment of binary digits <sec:subset>

For $x \, y in bb(N)$, write $x prec.curly.eq y$ if every binary digit equal to one in $x$ is also equal to one in $y$. More explicitly, if

$ x = sum_(i gt.eq 0) x_i 2^i \, #h(2em) y = sum_(i gt.eq 0) y_i 2^i \, #h(2em) x_i \, y_i in { 0 \, 1 } \, $

then $x prec.curly.eq y$ means $x_i lt.eq y_i$ for every $i$. In particular, $x prec.curly.eq y$ implies $x lt.eq y$. We will use this relation to restrict the permitted positions of nonzero digits in a computation code. Exponentiation lets us test it by extracting one digit from a binomial expansion. Large-base extraction of binomial coefficients goes back to Julia Robinson #cite(label("robinson1952")) Section 5. Its combination with binomial parity gives the binary-masking method used by Jones and Matiyasevich #cite(label("jm1991")) Section 3; the parity criterion is the case modulo two of Lucas’s theorem #cite(label("lucas1878")) Section 3, p. 52. We give its short proof and retain all witnesses of the three power calls and two divisions.

#thm([Proposition 6.1.])[
  #emph[The relation $x prec.curly.eq y$ on $bb(N)^2$ has a complete single-fold Diophantine representation.]
] <prop:subset>

#proof[
  Require $x lt.eq y$ and use three calls to Proposition 11 to specify
  #[#set math.equation(numbering: n => "(21)")
   $ B = 2^(y + 1) \, #h(2em) H = B^x \, #h(2em) N = \( B + 1 \)^y . $ <eq:subset-powers>]
  All three bases are at least two. Introduce natural variables $s \, d \, r \, t$ and impose
  #[#set math.equation(numbering: n => "(22)")
   $ N = s B H + d H + r \, #h(2em) d < B \, #h(2em) r < H \, #h(2em) d = 2 t + 1 . $ <eq:subset-digit>]
  For fixed $B \, H \, N$, the equation and the two bounds determine $s \, d \, r$ uniquely. Indeed, division of $N$ by $H$ first determines $r$ and the quotient $s B + d$; division of this quotient by $B$ then determines $s \, d$.
  The binomial theorem gives
  $ N = \( B + 1 \)^y = sum_(j = 0)^y binom(y, j) B^j . $
  Every coefficient is at most $sum_(j = 0)^y binom(y, j) = 2^y < B$, so this is the base-$B$ expansion of $N$ without carries. As $H = B^x$ and $0 lt.eq x lt.eq y$, the digit $d$ extracted in (22) is therefore $binom(y, x)$.
  To determine its parity, work in the polynomial ring over the field $bb(F)_2$ with two elements. Repeated squaring gives $\( 1 + Z \)^(2^i) = 1 + Z^(2^i)$, and hence
  $ \( 1 + Z \)^y = product_(i : thin y_i = 1) \( 1 + Z^(2^i) \) #h(2em) upright("in ") bb(F)_2 \[ Z \] . $
  Each monomial in the product is obtained by choosing some of the positions where $y_i = 1$. Uniqueness of binary expansion ensures that distinct choices have distinct exponents. The coefficient of $Z^x$ is thus one precisely when $x prec.curly.eq y$. Equivalently, $binom(y, x)$ is odd precisely in that case. The final equation $d = 2 t + 1$ in (22) proves the required equivalence.
  For a true instance, the three outputs in (21) and all their auxiliary variables are unique by Proposition 11. The two divisions uniquely determine $s \, d \, r$, and oddness uniquely determines the natural number $t = \( d - 1 \) \/ 2$. Every inequality slack is likewise unique. Conversely, when the relation is false, either $x > y$ or the extracted digit is even, so the system has no solution. The case $x = y = 0$ causes no exception: it gives
  $ B = 2 \, quad H = N = 1 \, quad s = r = t = 0 \, quad d = 1 . $
  Thus existence and uniqueness include every natural input pair. ◻
]

== 7 One witness for a halting computation <sec:computation>

Propositions 11 and 12 provide single-fold definitions of powers and binary containment. We now use these relations to encode an entire computation by finitely many natural numbers. Determinism will determine the computation, and a clock will determine the size of the blocks used to encode it. Both features are needed: a fixed computation admits many encodings if its block size is left free. The method of recording register computations in a large power-of-two base comes from Jones and Matiyasevich’s bit-masking construction #cite(label("jm1984")); see especially the exposition in #cite(label("jm1991")) Section 4. Determining the base from the input and computation time already appears in Chaitin’s account #cite(label("chaitin1987")) Sections 2.3 and 2.6. Here a clock and a dyadic interval determine the base. We verify both the decoding of every solution and the uniqueness of its complete auxiliary tuple.

=== 7.1 The machine model <the-machine-model>

A counter machine has a finite set of states, a distinguished initial state $q_(*)$, a distinguished halt state $h$, and finitely many counters with values in $bb(N)$. Every state other than $h$ has exactly one instruction of one of the following forms:

- $"INC" \( j \)$: increase counter $j$ by one and go to a specified state;
- $"TESTDEC" \( j \)$: if counter $j$ is zero, leave it zero and go to a specified state; otherwise decrease it by one and go to a second specified state.

The other counters remain unchanged. The halt state has no instruction. Thus every configuration outside $h$ has exactly one successor. Time counts individual instructions, including those used to implement a subroutine. This is the classical counter instruction set of Minsky #cite(label("minsky1961")) Theorem Ia; register-machine formulations were also developed by Shepherdson and Sturgis #cite(label("shepherdson1963")) Section 10, Result 10.3. We include the simulation needed for the direct tuple inputs used here, so no encoded-input convention is imported into the lemma.

#thm([Lemma 7.1.])[
  #emph[Let $n gt.eq 1$ and let $S subset.eq bb(N)^n$ be recursively enumerable. There is a counter machine that, when its first $n$ counters are initialized to $a_1 \, dots.h \, a_n$ and its remaining counters to zero, reaches its halt state if and only if $upright(bold(a)) in S$.]
] <lem:counter-universality>

#proof[
  Choose a deterministic Turing machine that accepts precisely the unary input words $1^(a_1) \# dots.h.c 1^(a_n) \#$ with $upright(bold(a)) in S$. Any rejecting terminal behavior can be replaced by an infinite loop, so only acceptance halts. We describe a simulation using the two instruction types above.
  Store the tape strictly to the left and strictly to the right of the current cell as two stacks; store the current symbol in the finite control. Give the finitely many tape symbols distinct digits $1 \, dots.h \, q$, including a digit for the blank symbol, and put $D = q + 1$. A stack with successive symbols $e_0 \, e_1 \, dots.h \, e_(m - 1)$, starting at its top, is stored as $sum_(i < m) e_i D^i$. The empty stack is zero. Allocate distinct counters for the two stacks, the input coordinates, a scratch counter, and a counter that is always zero.
  To push digit $e$ onto a stack of value $v$, compute $D v + e$. Repeatedly decrement the stack counter and, after each successful decrement, increment the initially zero scratch counter exactly $D$ times. Transfer the scratch counter back by repeated decrements of it and increments of the stack counter; then perform $e$ increments. The scratch counter is again zero. All repetitions of a fixed length are implemented by finitely many states.
  To pop a nonempty stack, repeatedly decrement its counter, keeping the number of successful decrements modulo $D$ in the finite control, and increment the scratch counter after every $D$ successful decrements. When the stack counter reaches zero, the scratch counter contains the quotient by $D$ and the control contains the remainder. Transfer that quotient back to the stack counter. Its original least significant digit is nonzero, so the remainder gives the symbol popped. An empty stack returns a blank and stays empty. Again the scratch counter ends at zero. Moving the tape head pushes the written current symbol onto one stack and pops the other. Storing additional blank symbols causes no difficulty, since each finite computation uses finite stacks.
  Initialize the right stack by pushing the input word in reverse: for $i = n \, n - 1 \, dots.h \, 1$, push $\#$ and then push a $1$ for each successful decrement of input counter $i$. Pop once to obtain the initial current symbol; the left stack is empty. A zero test on the counter that is always zero implements an unconditional jump. Every subroutine uses finitely many states; duplicating these states supplies its finitely many required return destinations. This gives a deterministic counter machine with a sole halt state reached exactly on acceptance. ◻
]

Fix such a machine for the remainder of the construction. Write $r$ for its number of counters and $s$ for its number of states. Its initial counter values are $d_1 \, dots.h \, d_r$, where each $d_j$ is an input coordinate or zero. In the proof below it is harmless to allow any fixed list of such initial values. Put

#[#set math.equation(numbering: n => "(23)")
 $ C = 1 + s + sum_(j = 1)^r d_j . $ <eq:machine-C>]

The symbol $C$ denotes this expression, not an additional choice. At time $t$ in any run, counter $j$ has value at most $d_j + t < C + t$, since an instruction increases a counter by at most one. A clock with value $C + t$ will therefore give a common bound for the counter values.

Regard an increment instruction as one directed arc, labeled $+ j$. Regard a test-decrement instruction as two directed arcs, labeled $0 j$ and $- j$. Each arc retains its specified destination. Let $cal(A)$ be this finite set of arcs, and let $cal(A)_j^(+)$ and $cal(A)_j^(-)$ denote those labeled $+ j$ and $- j$, respectively. The halt state has no outgoing arc, and $\| cal(A) \| lt.eq 2 s$.

=== 7.2 A finite system for the run <a-finite-system-for-the-run>

#thm([Proposition 7.2.])[
  #emph[Fix $n gt.eq 1$ and a deterministic counter machine with finitely many states and counters, instructions $"INC"$ and $"TESTDEC"$, and one halt state. Initialize each counter by a fixed choice of an input coordinate $a_i$ or zero. There is a finite system of integer polynomial equations in $a in bb(N)^n$ and natural auxiliary variables such that, for every input $a$, the complete auxiliary tuple has exactly one solution when the initialized machine halts, and no solution when it does not halt.]
] <prop:machine-compiler>

We first give the system using the single-fold relations $"Pow"$ and $prec.curly.eq$. Every occurrence is a separate call with fresh auxiliary variables, as in Section 2. Inequalities use the unique slacks from that section. All sets indexing the displayed constraints are fixed finite sets of states, arcs, or counters.

Introduce natural variables $w \, B \, b \, k \, H \, J \, M$ and require

#[#set math.equation(numbering: n => "(24)")
 $ & "Pow" \( 2 \, w \, B \) \, #h(2em) B = 4 b \, #h(2em) B > 2 C \, #h(2em) k > 0 \, #h(2em) "Pow" \( B \, k \, H \) \,\
 & B J = H \, #h(2em) \( B - 1 \) M = H - 1 . $ <eq:machine-base>]

These equations force

#[#set math.equation(numbering: n => "(25)")
 $ B = 2^w \, #h(2em) J = B^(k - 1) \, #h(2em) M = sum_(t = 0)^(k - 1) B^t . $ <eq:machine-JM>]

The intended run has $k$ configurations, at times $0 \, dots.h \, k - 1$. In its base-$B$ encodings, each time occupies one block of $w$ binary digits. The number $M$ has a single $1$ in the lowest position of each block. Multiplication by $B$ shifts each block from time $t$ to time $t + 1$. The transition equations below use this shift to place a selected arc’s destination and its counter update in the next configuration.

For every state $q$, introduce $I_q$ and impose

#[#set math.equation(numbering: n => "(26)")
 $ I_q prec.curly.eq M \, #h(2em) sum_q I_q = M . $ <eq:machine-state-partition>]

The intended meaning is that the base-$B$ digit of $I_q$ at time $t$ is one exactly when the machine is in state $q$. For every test state $q$, introduce $Z_q \, N_q \, V_q$ and impose

#[#set math.equation(numbering: n => "(27)")
 $ Z_q prec.curly.eq I_q \, #h(2em) N_q prec.curly.eq I_q \, #h(2em) Z_q + N_q = I_q \, #h(2em) Z_q + V_q = M . $ <eq:machine-test-partition>]

Here $Z_q$ records zero branches, $N_q$ records decrement branches, and $V_q$ records the complement of the zero-branch times. Define the arc expression $E_a$ to be $I_q$ for an increment arc from $q$, and $Z_q$ or $N_q$ for the corresponding arc from a test state $q$. These are expressions in existing variables. For every state impose

#[#set math.equation(numbering: n => "(28)")
 $ I_q = upright(bold(1))_(q = q_(*)) + B sum_(a in cal(A)\
"dest" \( a \) = q) E_a . $ <eq:machine-state-transition>]

The coefficient $upright(bold(1))_(q = q_(*))$ is the fixed integer zero or one.

Counter digits will use only the lowest $w - 1$ bits of each block, so their values lie between zero and $B \/ 2 - 1 = 2 b - 1$. Reserving the top bit will let the decoding proof exclude signed carries in the counter updates, which include subtraction. For each counter $j = 1 \, dots.h \, r$, introduce $R_j \, rho_j \, eta_j$ and impose

#[#set math.equation(numbering: n => "(29)")
 $ & R_j prec.curly.eq \( 2 b - 1 \) M \, #h(2em) R_j = rho_j J + eta_j \, #h(2em) eta_j < J \,\
 & R_j = d_j + B (R_j - rho_j J + sum_(a in cal(A)_j^(+)) E_a - sum_(a in cal(A)_j^(-)) E_a) . $ <eq:machine-counter-bound>]

For every test state $q$ operating on counter $j$, additionally require

#[#set math.equation(numbering: n => "(30)")
 $ R_j prec.curly.eq \( B - 1 \) V_q . $ <eq:machine-zero-test>]

The intended base-$B$ digits of $R_j$ are the successive values of the counter. The quotient $rho_j$ is its final value. Removing $rho_j J$ before multiplying by $B$ makes the recurrence stop at the final time. The mask $\( B - 1 \) V_q$ has a zero block at each time selected by $Z_q$ and has all $w$ binary digits equal to one in every other time block. Thus the containment condition forces the tested counter to vanish at the selected times.

Finally introduce $R_0 \, rho_0 \, eta_0$ for a clock and impose

#[#set math.equation(numbering: n => "(31)")
 $ & R_0 prec.curly.eq \( 2 b - 1 \) M \, #h(2em) R_0 = rho_0 J + eta_0 \, #h(2em) eta_0 < J \,\
 & R_0 = C + B \( R_0 - rho_0 J + M - J \) \,\
 & b lt.eq rho_0 \, #h(2em) 2 rho_0 < B . $ <eq:machine-clock-bound>]

Its intended value at time $t$ is $C + t$. The last two inequalities put its final value in $\[ B \/ 4 \, B \/ 2 \)$; this leaves room for all counter digits and will select exactly one power-of-two base. We now prove that every solution has these intended meanings, and that every halting run supplies a solution.

#proof[
  #emph[States and the final halt.] Take any solution. Since $B > 2 C$ and $C gt.eq 1 + s$, we have $B > 2 s$; also $B = 4 b gt.eq 4$. By (25), binary containment in $M$ means that every base-$B$ digit of $I_q$ is zero or one, with no nonzero digits outside times $0 \, dots.h \, k - 1$. The sum in (26) has at most $s < B$ in each digit, so it has no carries. Thus exactly one state is present at each time. Similarly, (27) partitions the times of each test state into its two branches. Consequently a nonhalt state has exactly one selected outgoing arc, and the halt state has none.
  The digit sums on the right of (28) are at most $\| cal(A) \| < B$. Hence those equations also have no carries. They give state $q_(*)$ at time zero, and at every later time they give the destination of the selected arc at the preceding time. The halt mask has an exact form. Each nonhalt state occurrence selects one arc, so $sum_(a in cal(A)) E_a = M - I_h$. Summing the state equations gives
  $ M = 1 + B \( M - I_h \) \, #h(2em) B I_h = 1 + \( B - 1 \) M = H = B J . $
  Thus $I_h = J$: the halt state occurs precisely at time $k - 1$. There is exactly one selected arc at each time $t < k - 1$, and none at the final time. This also excludes earlier halts and padded records.
  #emph[Counter values and zero tests.] Since $B = 2^w = 4 b$, the integer $\( 2 b - 1 \) M = \( B \/ 2 - 1 \) M$ allows exactly the lowest $w - 1$ bits of each block. Thus we can write uniquely
  #[#set math.equation(numbering: n => "(32)")
   $ R_j = sum_(t = 0)^(k - 1) r_(j \, t) B^t \, #h(2em) 0 lt.eq r_(j \, t) lt.eq B \/ 2 - 1 . $ <eq:machine-counter-digits>]
  Division by $J = B^(k - 1)$ gives $rho_j = r_(j \, k - 1)$ and determines $eta_j$ uniquely. Let $a_(j \, t)$ and $f_(j \, t)$ indicate whether the selected arc at time $t$ increments or decrements counter $j$. They belong to ${ 0 \, 1 }$, never both equal one, and are both zero at the final time.
  Expand (29) using these digits. The coefficient of $B^0$ in the resulting signed sum is $r_(j \, 0) - d_j$. For $1 lt.eq t < k$ it is
  #[#set math.equation(numbering: n => "(33)")
   $ r_(j \, t) - r_(j \, t - 1) - a_(j \, t - 1) + f_(j \, t - 1) . $ <eq:machine-signed-coefficient>]
  There are no higher coefficients: the final digit of $R_j$ was removed, and no final arc was selected. The constant coefficient has absolute value less than $B$, because $d_j < C < B \/ 2$; every coefficient in (33) has absolute value at most $B \/ 2 < B$. An integer sum $sum_(t = 0)^(k - 1) c_t B^t = 0$ with $\| c_t \| < B$ has every $c_t = 0$: reduce modulo $B$, use that the only multiple of $B$ in $\( - B \, B \)$ is zero, divide by $B$, and repeat. It follows that
  #[#set math.equation(numbering: n => "(34)")
   $ r_(j \, 0) = d_j \, #h(2em) r_(j \, t + 1) = r_(j \, t) + a_(j \, t) - f_(j \, t) quad \( 0 lt.eq t < k - 1 \) . $ <eq:machine-actual-update>]
  This argument rules out borrowing as well as carrying.
  Since $Z_q$ selects some of the ones of $M$, the equation $V_q = M - Z_q$ gives base-$B$ digit zero at its zero-branch times and one at all other times. Thus $\( B - 1 \) V_q$ allows every bit in a block except at those zero-branch times, where it allows none. Condition (30) forces the tested counter to be zero whenever the zero branch is selected. On a decrement branch, (34) and nonnegativity of the next digit force the tested counter to be positive. Hence every test and every update is a valid machine instruction.
  #emph[The clock and the block size.] Apply the same coefficient argument to the clock. In (31), the expression $M - J$ has digit one exactly at times $t < k - 1$. Its digit recurrence is therefore $r_(0 \, 0) = C$ and $r_(0 \, t + 1) = r_(0 \, t) + 1$. In particular,
  #[#set math.equation(numbering: n => "(35)")
   $ rho_0 = C + k - 1 . $ <eq:machine-clock-value>]
  The state and counter arguments show that the encoded configurations form the actual deterministic run from the specified initialization, and that it first reaches $h$ at time $k - 1$. If the machine does not halt, no solution exists. If it halts after $T$ instructions, then $k = T + 1$ is forced. Conditions (31) become
  #[#set math.equation(numbering: n => "(36)")
   $ 2 \( C + T \) < B lt.eq 4 \( C + T \) . $ <eq:machine-unique-scale>]
  For every positive integer $L$, the interval $\( 2 L \, 4 L \]$ contains exactly one power of two: take the smallest power strictly greater than $2 L$, whose predecessor is at most $2 L$. Its successor exceeds $4 L$. Thus (36) determines $B$ uniquely, including when an endpoint is a power of two.
  #emph[Existence from a halting run.] Suppose the initialized machine halts after $T$ instructions. Set $k = T + 1$ and choose the unique power of two $B$ in (36). Since $C gt.eq 2$, we have $B > 4$, so $B$ is divisible by four. Set $b = B \/ 4$, choose the unique exponent $w$ with $B = 2^w$, set $H = B^k$, and use (25) to define $J \, M$. At time $t lt.eq T$ each counter has value at most $d_j + t$, because one instruction increases a counter by at most one. Hence its value is at most $sum_j d_j + T < C + T < B \/ 2$. The clock values $C + t$ also are less than $B \/ 2$. Form $R_j$ and $R_0$ from these digits, and form the state and branch masks from the actual run.
  All state equations follow from the transitions. The zero-test constraints follow from the zero branches. Summing the actual counter updates gives (29), with the final digit removed before shifting; summing the clock updates gives (31). The remaining inequalities follow from (36). Every power and binary-containment call is true on these arguments and therefore has its required unique auxiliary tuple. This also handles $T = 0$: then $q_(*) = h$, $k = 1$, $J = M = 1$, all arc masks vanish, and every update sum is empty.
  #emph[Uniqueness of the complete tuple.] In any solution, the deterministic run fixes $T$, every state, every selected branch, and every counter value. It therefore fixes $k$; the clock inequalities then fix $B$, and hence $w \, b \, H \, J \, M$. The run fixes all $I_q \, Z_q \, N_q \, R_j \, R_0$, while $V_q = M - Z_q$ fixes every $V_q$. Division by the positive $J$ fixes every $rho_j \, eta_j$, including the clock pair. These are all the displayed variables. Each introduced argument variable is equal to an already determined polynomial expression; every inequality slack is determined by its endpoints. Finally, Propositions 11 and 12 determine all auxiliary variables in every expanded call. Their internal case selectors and inactive variables are included in that guarantee. Thus uniqueness holds for the complete tuple, not only for the numbers recording the run. ◻
]

=== 7.3 The resulting polynomial <the-resulting-polynomial>

#proof[
  Given the recursively enumerable set $S subset.eq bb(N)^n$, choose the machine of Lemma 13 and apply Proposition 14. Expand each call to a single-fold relation into its finite polynomial system, using fresh auxiliary variables, and expand all inequalities and disjoint cases according to Section 2. The number of equations and variables is finite: the machine is fixed, its state and counter sets are finite, and each relation call has a fixed finite definition. The time parameter $k$ is one natural variable; the digit expansions used in the proof introduce no additional variables indexed by its value.
  Write the resulting integer polynomial equations as $F_1 \( upright(bold(a)) \, upright(bold(z)) \) = dots.h.c = F_N \( upright(bold(a)) \, upright(bold(z)) \) = 0$, where $upright(bold(z))$ includes every auxiliary coordinate, and set
  $ P \( upright(bold(a)) \, upright(bold(z)) \) = sum_(i = 1)^N F_i \( upright(bold(a)) \, upright(bold(z)) \)^2 . $
  On natural tuples, $P = 0$ is equivalent to the simultaneous vanishing of all $F_i$. This operation introduces no variables and preserves the solution set exactly. By the compiler proposition, that set has one element when $upright(bold(a)) in S$ and is empty otherwise, as asserted. ◻
]

== 8 Consequences for Diophantine solvability <sec:consequences>

For every finite $n gt.eq 1$ and every recursively enumerable $S subset.eq bb(N)^n$, Theorem 1 also gives a finite-fold representation: each input has at most one complete witness, and therefore finitely many. The stronger uniqueness assertion yields the promise undecidability result stated in the introduction. Its proof specializes one fixed representing polynomial: the degree and number of variables stay fixed, while the coefficients vary with the input.

#proof[
  Fix a nonrecursive recursively enumerable set $S subset.eq bb(N)$. Theorem 1, with one parameter, supplies a fixed $m gt.eq 1$ and a fixed polynomial $P in bb(Z) \[ A \, W_1 \, dots.h \, W_m \]$ representing $S$ single-fold. Choose one such $P$, put $D = max { 1 \, deg P }$, and for each $a in bb(N)$ define
  $ F_a \( W_1 \, dots.h \, W_m \) = P \( a \, W_1 \, dots.h \, W_m \) . $
  Every $F_a$ has at most one zero in $bb(N)^m$, and it has a zero exactly when $a in S$. This counts the entire remaining tuple $\( W_1 \, dots.h \, W_m \)$, including every subsidiary arithmetic variable. Specialization introduces no variables and does not increase total degree, so every $F_a$ satisfies the fixed bounds.
  Substitution is computable from the finite coefficient encoding of $P$ and $a$. Although the proof does not numerically specify $P$, the finite code of this one fixed polynomial can be hard-coded into a Turing machine. Hence $a mapsto F_a$ is a computable map of encoded inputs. A hypothetical algorithm with the stated property, applied to $F_a$, would therefore decide membership in $S$, a contradiction. Every constructed input satisfies the promise, so the algorithm’s behavior outside it is irrelevant. ◻
]

The bounds in Corollary 2 are existential: no numerical values for them or for the fixed polynomial’s coefficients are supplied. The coefficients of $F_a$, and therefore their input bit lengths, may grow with $a$. The promise permits both zero and one complete solution; it is not an exactly-one promise. The corollary makes no claim about analogous uniqueness promises for solutions over $bb(Z)$ or $bb(Q)$.

== 9 The rank and torsion of the chosen curve <app:rank-one>

#proof[
  For $E : y^2 = x^3 - 25 x$, we first prove $\[ E \( bb(Q) \) : 2 E \( bb(Q) \) \] lt.eq 8$, which will force rank at most one. We then exhibit a nontorsion point and determine the full torsion subgroup. For the rank bound we use the standard two-isogeny descent #cite(label("silverman")) Chapter III, Example 4.5, and Chapter X, Section 4, Example 4.8 and Proposition 4.9, giving the kernel and index calculations explicitly. For rational $a \, b$ with $b \( a^2 - 4 b \) eq.not 0$, write
  $ E_(a \, b) : y^2 = x^3 + a x^2 + b x \, #h(2em) b' = a^2 - 4 b \, #h(2em) E' = E_(- 2 a \, b') . $
  Both curves are nonsingular. The following maps, with the exceptional points $O$ and $\( 0 \, 0 \)$ sent to $O$, are isogenies:
  #[#set math.equation(numbering: n => "(37)")
   $ phi.alt : E_(a \, b) & arrow.r E' \, & phi.alt \( x \, y \) & = (y^2 / x^2 \, y (1 - b / x^2)) \,\
psi : E' & arrow.r E_(a \, b) \, & psi \( X \, Y \) & = (frac(Y^2, 4 X^2) \, Y / 8 (1 - b' / X^2)) . $ <eq:phi-descent>]
  Here are the algebraic and geometric checks needed for this assertion. For the first map, put $X = x + a + b \/ x$. Substitution gives
  $ X #scale(x: 120%, y: 120%)[\(] \( X - a \)^2 - 4 b #scale(x: 120%, y: 120%)[\)] = y^2 (1 - b / x^2)^2 \, $
  which is the target equation. Applying the same formula to $E'$ gives $E_(4 a \, 16 b)$. The scaling $\( x \, y \) mapsto \( 4 x \, 8 y \)$ is an isomorphism from $E_(a \, b)$ to $E_(4 a \, 16 b)$; composing with its inverse gives (37).
  These rational formulas extend over the indicated exceptional points. At $\( 0 \, 0 \)$, the equation $y^2 = x \( b + a x + x^2 \)$ shows that $y$ has order one and $x$ has order two. The target coordinates in (37) therefore have poles of orders two and three. Their ratios $X \/ Y$ and $1 \/ Y$, which are coordinates in the target chart at infinity, are regular and vanish there. At $O$, the functions $x \, y$ have poles of orders two and three, and the same argument applies. Away from these points the formulas are regular. The argument also applies to the map from $E'$, and scaling preserves regularity. Thus the two maps are nonconstant morphisms preserving the identity; they are group homomorphisms by the standard isogeny theorem #cite(label("silverman")) Chapter III, Theorem 4.8.
  Write $\[ c \]$ for the class of $c in bb(Q)^(*)$ in $bb(Q)^(*) \/ bb(Q)^(* 2)$. Define
  $ alpha : E_(a \, b) \( bb(Q) \) arrow.r bb(Q)^(*) \/ bb(Q)^(* 2) \, #h(2em) alpha \( O \) = \[ 1 \] \, quad alpha \( \( 0 \, 0 \) \) = \[ b \] \, quad alpha \( \( x \, y \) \) = \[ x \] quad \( x eq.not 0 \) . $
  This is a homomorphism. Indeed, a nonvertical line $y = lambda x + nu$ meets the cubic, with multiplicity, at roots of
  $ x^3 + \( a - lambda^2 \) x^2 + \( b - 2 lambda nu \) x - nu^2 . $
  If $nu eq.not 0$, the product of the three roots is $nu^2$. If $nu = 0$, the root at $\( 0 \, 0 \)$ is simple, since $b eq.not 0$, and the other two roots have product $b$. In either case the product of the three $alpha$-values is trivial. The third intersection is the negative of the sum of the first two, and negation leaves $alpha$ unchanged. Vertical pairs have product class one; pairs involving $O$ are immediate. This also treats tangencies, with intersection multiplicity understood.
  We next prove the exact kernel identity
  #[#set math.equation(numbering: n => "(38)")
   $ ker alpha = psi E' \( bb(Q) \) . $ <eq:descent-kernel>]
  An affine image other than $\( 0 \, 0 \)$ has square x-coordinate by (37). An image equal to $\( 0 \, 0 \)$ must have $X eq.not 0$, $Y = 0$, and hence $X = a plus.minus 2 sqrt(b)$. Such a rational preimage exists exactly when $b$ is a rational square; its x-coordinate is nonzero since $b' eq.not 0$. Thus every image is in the kernel, including the exceptional points.
  Conversely, suppose $x = s^2 eq.not 0$ for a point $\( x \, y \)$ in the kernel. Set
  $ X = 2 x + a + 2 y \/ s \, #h(2em) Y = 2 s X . $
  The product of $2 x + a + 2 y \/ s$ and $2 x + a - 2 y \/ s$ is $b'$, so $X eq.not 0$. The identity $X^2 - \( 2 a + 4 x \) X + b' = 0$ implies $Y^2 = X^3 - 2 a X^2 + b' X$. Formula (37) then gives first coordinate $x$ and second coordinate $s \( X - b' \/ X \) \/ 4 = y$. When $\( 0 \, 0 \)$ is in the kernel, its preimages were just exhibited; $O$ is always an image. This proves (38).
  Let $alpha'$ be the analogous squareclass homomorphism on $E'$. Applying the kernel calculation to $E'$, and using the scaling above, gives $ker alpha' = phi.alt E_(a \, b) \( bb(Q) \)$. For $x y eq.not 0$, the x-coordinate of $psi phi.alt \( x \, y \)$ is
  $ frac(\( x^2 - b \)^2, 4 y^2) = x \( \[ 2 \] \( x \, y \) \) \, $
  as follows by expanding the usual tangent formula $\( \( 3 x^2 + 2 a x + b \) \/ \( 2 y \) \)^2 - a - 2 x$. The points therefore agree up to sign. At $O$ and the points with $y = 0$, the composition and doubling both give $O$. Since the image of a homomorphism is closed under negation, this pointwise sign ambiguity still gives $psi phi.alt E_(a \, b) \( bb(Q) \) = 2 E_(a \, b) \( bb(Q) \)$. The map induced by $psi$ from $E' \( bb(Q) \) \/ phi.alt E_(a \, b) \( bb(Q) \)$ onto $psi E' \( bb(Q) \) \/ 2 E_(a \, b) \( bb(Q) \)$ consequently yields
  #[#set math.equation(numbering: n => "(39)")
   $ \[ E_(a \, b) \( bb(Q) \) : 2 E_(a \, b) \( bb(Q) \) \] lt.eq \| "im" alpha \| thin \| "im" alpha' \| . $ <eq:descent-index>]
  The descent has reduced the desired index bound to two squareclass computations. We now bound those images for our concrete curve; finite generation will then turn the index bound into a rank bound. We specialize to $a = 0 \, b = - 25$. For integral $a \, b$, a point with $x y eq.not 0$ can have an odd valuation in its x-coordinate only at a prime dividing $b$. Write $v_p \( x \)$ for the exponent of the prime $p$ in the rational number $x$. To see the assertion, if $v_p \( x \) < 0$, then $x^2$ is the unique term of smallest valuation in $x^2 + a x + b$, so $2 v_p \( y \) = 3 v_p \( x \)$. If $v_p \( x \) > 0$ and $p divides.not b$, then $x^2 + a x + b$ is a unit, so $2 v_p \( y \) = v_p \( x \)$. In either situation $v_p \( x \)$ is even. Including the exceptional points, this gives
  $ "im" alpha subset.eq { \[ 1 \] \, \[ - 1 \] \, \[ 5 \] \, \[ - 5 \] } . $
  The second curve is $E' : y^2 = x^3 + 100 x$. Every nonzero x-coordinate on it is positive, and the same valuation argument gives
  $ "im" alpha' subset.eq { \[ 1 \] \, \[ 2 \] \, \[ 5 \] \, \[ 10 \] } . $
  Its image does not contain $\[ 2 \]$. Otherwise write $x = 2 m^2 \/ e^2$, with nonzero coprime integers $m \, e$. Substitution gives
  $ (frac(y e^3, 2 m))^2 = 2 m^4 + 50 e^4 = N^2 $
  for an integer $N$, because a rational number with integral square is integral. Reduction modulo five first forces $5 divides m \, N$. Writing $m = 5 m_1$, $N = 5 N_1$ then gives
  $ N_1^2 = 50 m_1^4 + 2 e^4 \, $
  which is again impossible modulo five, since $5 divides.not e$. A subgroup of the four displayed squareclasses that omits $\[ 2 \]$ has size at most two. Thus (39) gives $\[ E \( bb(Q) \) : 2 E \( bb(Q) \) \] lt.eq 8$.
  By the Mordell–Weil theorem, $E \( bb(Q) \)$ is finitely generated #cite(label("silverman")) Chapter VIII, Theorem 4.1. If its rank is $r$ and its finite torsion subgroup is $cal(T)$, then
  $ \[ E \( bb(Q) \) : 2 E \( bb(Q) \) \] = 2^r \| cal(T) \/ 2 cal(T) \| = 2^r \| cal(T) \[ 2 \] \| = 2^(r + 2) \, $
  since its rational points of order dividing two are precisely $O \, \( 0 \, 0 \) \, \( 5 \, 0 \) \, \( - 5 \, 0 \)$. Hence $r lt.eq 1$. The point $\( - 4 \, 6 \)$ is nontorsion: the Nagell–Lutz theorem for an integral short Weierstrass equation $y^2 = x^3 + A x + B$ says that a nonidentity rational torsion point has integral coordinates and either $\[ 2 \] Q = O$ or $y \( Q \)^2 divides 4 A^3 + 27 B^2$ #cite(label("silverman")) Chapter VIII, Corollary 7.2. Here $36 divides.not 62500$, so the rank is one.
  The same theorem determines the torsion completely. For integral coordinates on our curve, reduction modulo three gives $y^2 equiv x^3 - x equiv 0$, so $3 divides y$. A torsion point with $y eq.not 0$ would also satisfy $y^2 divides 62500$, a contradiction. Thus every affine torsion point has $y = 0$, giving the claimed list. Finally choose a point $P$ whose image generates the infinite cyclic quotient $E \( bb(Q) \) \/ cal(T)$. Its cosets, and then the torsion translates within each coset, give the asserted unique expression. ◻
]

== 10 The complete auxiliary tuple <app:witnesses>

This appendix fixes one finite expansion of the systems used in the proof. Its purpose is to make explicit which coordinates the single-fold assertion counts. Each call has a fresh internal tuple. Its displayed output is counted by its caller, and its displayed inputs are already available. Equal-valued coordinates in distinct calls remain distinct variables. Every coordinate below ranges over $bb(N)$.

===== 10.1 Primitive conventions. <primitive-conventions.>

A polynomial equality introduces no auxiliary variable. A weak comparison $F gt.eq G$ introduces the single slack $F - G$; a strict comparison $F > G$ introduces $F - G - 1$. Naming a polynomial expression introduces one variable with its defining equality. Rational comparisons first clear their positive denominators, so their slacks are integer differences. For a disjoint case construction, include every Boolean selector, every local guard slack, and every coordinate of every local call. Multiply all local equations by the case selector and set all local coordinates to zero when that case is inactive. These rules apply recursively to nested calls. In particular, a zeroed inactive rational code has no ungated positive-denominator requirement.

===== 10.2 Rational and point arithmetic. <rational-and-point-arithmetic.>

The six coordinates of a rational code are $\( p \, n \, d \, t \, s \, q \)$ from (2): the two sign parts, positive denominator, inverse residue, its interval slack, and the inverse quotient. A point has its identity flag and both complete rational codes. For an addition, the caller counts the output point once. The internal addition tuple consists of seven selectors, four local six-coordinate slope codes (Cases 3, 4, 6, and 7), and the four strict comparison slacks in those cases. Other guards are equalities and require no further witnesses. Clearing denominators introduces no free multiplier. A maximum uses two selectors and one local comparison slack in each case; the first case receives a tie. All inactive local coordinates are zero.

Fix one addition chain for $\[ m_(*) \] Q$ once and for all; for example, use $Q \, 2 Q \, dots.h \, m_(*) Q$. Each addition contributes its output point and the internal addition tuple just described. A height call $W \( Q \)$ has one displayed height output, counted by its caller. Its internal tuple contains the scalar chain and the maximum tuple applied to the final x-coordinate’s absolute numerator and denominator. The chain length is a fixed constant.

===== 10.3 The growth graph. <the-growth-graph.>

For a representative test on a point $Q$, retain its height output $h_Q$, the internal height tuple, the four codes of $Q + t$ and their addition tuples, and six comparison slacks: one for $y \( Q \) gt.eq 0$, one for $h_Q > 1$, and four for $x \( Q \) gt.eq x \( Q + t \)$. Affineness is a flag equation. This test has unique internal witnesses for a fixed representative; the bracket and window are what fix the representative itself.

Write $xi$ for the entire internal tuple of a call $v = g \( u \)$. It consists of the following blocks:

- The codes of $Q \, R$ and both representative-test tuples, including their height outputs $h_Q \, h_R$.
- The codes of $Q + P \, Q - P \, R + P \, R - P \, \[ 2 \] Q$, all five addition tuples, and their five height outputs with five complete internal height tuples.
- The two neighbor-height maxima with both complete maximum tuples, and $L_0 \, D_0$ with their product equalities.
- The four slacks in the bracket and window: if the neighbor maxima are $N_Q \, N_R$, these are
  $ u + W_1 - h_Q \, quad N_Q - u - W_1 - 1 \, quad kappa D_0 - L_0 \, quad kappa L_0 - D_0 . $

Impose $v = h_R$. Here the already present internal coordinate $h_R$ and the displayed output $v$ are distinct variables fixed to the same value. The heights $h_Q \, h_R$ are reused in the products and inequalities. All signs, denominators, slopes, selectors, and scalar-chain points remain inside $xi$. The integer indices $k \, r$ and the real quantities in the growth proof are not variables of this tuple.

===== 10.4 Powers and binary containment. <powers-and-binary-containment.>

For displayed arguments $\( b \, n \, c \)$, one complete internal power tuple is

$ \( u \, v \, X \, Y \, F \, H \, q \, q' \, r \, sigma_b \, sigma_F \, sigma_(F v) \, sigma_H \, sigma_(H v) \, sigma_r \, xi \) \, $

where the six slacks, in order, have values

$ b - 2 \, quad F - 1 \, quad v - F - 1 \, quad H - 1 \, quad v - H - 1 \, quad H - r - 1 . $

The output $c$ is counted by the caller. No sign variable accompanies the natural square roots $X \, Y$; no Pell index is quantified.

For a binary-containment call on $\( x \, y \)$, name $e = y + 1$ and $A = B + 1$. Include

$ \( e \, A \, B \, H \, N \, s \, d \, r \, t \, sigma_(x y) \, sigma_d \, sigma_r \) $

and three separate complete internal power tuples for $"Pow" \( 2 \, e \, B \)$, $"Pow" \( B \, x \, H \)$, and $"Pow" \( A \, y \, N \)$. The three slacks are $y - x \, B - d - 1 \, H - r - 1$. The quotients and remainders are precisely $s \, d \, r$, and the parity quotient is $t$. These calls, including all of their growth tuples, remain present when $x = 0$ or $y = 0$.

===== 10.5 The computation tuple. <the-computation-tuple.>

Let the fixed machine have $s$ states, $r$ counters, and $tau$ test states. Enumerate each of these finite sets once. The displayed machine coordinates are

$ \( w \, B \, b \, k \, H \, J \, M \) \, #h(2em) \( I_q \)_q \, #h(2em) \( Z_q \, N_q \, V_q \)_(q upright(" a test state")) \, #h(2em) \( R_j \, rho_j \, eta_j \)_(0 lt.eq j lt.eq r) . $

Include the $r + 5$ comparison slacks

$ B - 2 C - 1 \, quad k - 1 \, quad \( J - eta_j - 1 \)_(0 lt.eq j lt.eq r) \, quad rho_0 - b \, quad B - 2 rho_0 - 1 . $

Name $D = \( 2 b - 1 \) M$ and, for each test state, $D_q = \( B - 1 \) V_q$, using their defining equalities. Include the two internal power tuples for $"Pow" \( 2 \, w \, B \)$ and $"Pow" \( B \, k \, H \)$. Finally include a complete binary-containment tuple for each of

$ I_q prec.curly.eq M \, #h(2em) Z_q prec.curly.eq I_q \, #h(2em) N_q prec.curly.eq I_q \,\
R_j prec.curly.eq D quad \( 0 lt.eq j lt.eq r \) \, #h(2em) R_(j \( q \)) prec.curly.eq D_q quad \( q upright(" a test state") \) \, $

where $j \( q \)$ is the counter tested at $q$. There are $s + 3 tau + r + 1$ such calls. Arc masks are expressions in the displayed state and test masks and introduce no variables. The expression $C = 1 + s + sum_j d_j$ also introduces no variable.

This is a finite recursive specification of the whole auxiliary tuple. Its length depends only on the fixed machine and fixed arithmetic constructions, not on an input or its halting time. Proof digits, configurations, and time indices are not extra coordinates. The computation proof fixes the actual run first, then its base, then every displayed value above. The preceding graphs fix all their internal coordinates, including every inactive branch. Replacing the resulting finite list of equations by its sum of squares introduces no coordinate and preserves exactly this complete tuple.


#bibliography("refs.bib", style: "ieee", title: [References])
