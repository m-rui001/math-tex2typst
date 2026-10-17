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

#align(center)[#text(size: 16pt, weight: "bold")[Ultraflat real Littlewood polynomials]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A real Littlewood polynomial of length $N$ is a polynomial

$ P \( z \) = sum_(k = 0)^(N - 1) epsilon_k z^k \, #h(2em) epsilon_k in { - 1 \, 1 } . $

Its squared mean modulus on the unit circle is $N$, by Parseval’s identity. Thus $sqrt(N)$ is the natural scale, and its maximum modulus is at least $sqrt(N)$. A family is #emph[ultraflat] if $\| P \( z \) \| \/ sqrt(N)$ tends uniformly to $1$ on the unit circle as the length tends to infinity. We prove that real Littlewood polynomials can be ultraflat, through every sufficiently large integer length.

#thm([Theorem 1.])[
  #emph[For every $epsilon in \( 0 \, 1 \)$ there is an integer $N_0$ such that, for every integer $N gt.eq N_0$, there are signs $epsilon_0 \, dots.h \, epsilon_(N - 1)$ for which 
$ \( 1 - epsilon \) sqrt(N) lt.eq lr(|sum_(k = 0)^(N - 1) epsilon_k z^k|) lt.eq \( 1 + epsilon \) sqrt(N) #h(2em) upright("for every ") \| z \| = 1 . $

]
] <thm:main>

The signs may depend on $N$. The theorem concerns both extrema of the same polynomial on the entire circle, including the real points $z = 1$ and $z = - 1$.

=== 1.1 The flatness problem <the-flatness-problem>

Erdős asked whether real-sign polynomials could stay between two fixed positive multiples of their square-root scale on the entire circle #cite(label("Erdos1957")) Problem 26; the problem also appears in Littlewood’s work #cite(label("Littlewood1966")). The Rudin–Shapiro construction gives real-sign polynomials with maximum at most $sqrt(2 N)$ at dyadic lengths #cite(label("Rudin1959")). Balister, Bollobás, Morris, Sahasrabudhe and Tiba proved the two-sided constant-factor statement at every degree at least two #cite(label("BalisterEtAl2020")) Theorem 1.1. Their theorem controls the scale of both extrema, while ultraflatness requires both normalized extrema to converge to one.

For complex coefficients of modulus one, Kahane constructed ultraflat polynomials #cite(label("Kahane1980")). Bombieri and Bourgain improved the quantitative bounds and gave effective constructions #cite(label("BombieriBourgain2009")) Theorems 4 and 7. The restriction to real signs is substantial. The predecessor #cite(label("OpenAIMinimal")) Theorem 1.1 obtains an asymptotically minimal maximum through all lengths. Its version-2 refinement #cite(label("OpenAILowerEnvelope2026")) Theorem 1.1 gives the simultaneous bounds

$ 1 / 16 sqrt(N) lt.eq \| P \( z \) \| lt.eq \( 1 + eta \) sqrt(N) #h(2em) \( \| z \| = 1 \) $

for every fixed $eta > 0$ and all sufficiently large $N$. Theorem 1 strengthens that lower bound to its asymptotically optimal value. The present paper develops the additional constructions needed for this strengthening and uses the retained version-2 paper as the source of two shared lemmas.

Recent obstructions distinguish the relevant quantifiers. Erdélyi proved that the full sequence of partial sums of one fixed unimodular power series cannot be ultraflat #cite(label("ErdelyiSections2026")) Theorem 2.1. This does not restrict the independent choice of signs at each length in Theorem 1. His separate lower bound #cite(label("Erdelyi2026")) Theorem 2.1, $max_(\| z \| = 1) \| P \( z \) \|^2 gt.eq N + \( N - 1 \)^(1 \/ 3) \/ 38$, is compatible with the asymptotic conclusion here.#footnote[Contrary nonflatness claims in #cite(label("ElAbdalaoui2025")) #cite(label("ElAbdalaoui2025Generalization")) and specific issues in their arguments are discussed in #cite(label("OpenAIMinimal")) Appendix A. Those claims are not inputs to the present proof.]

=== 1.2 Construction and relation to the earlier version <construction-and-relation-to-the-earlier-version>

The proof first constructs a continuous function $B_N$ on the circle whose modulus is close to one. Its Fourier coefficients of indices $0 \, dots.h \, N - 1$ are real and at most $\( 1 + o \( 1 \) \) \/ sqrt(N)$ in absolute value, and the sum of the absolute values of all remaining coefficients tends to zero. Parseval’s identity then forces the retained coefficients to be almost of sign size in aggregate. A discrepancy estimate rounds them to signs with a small uniform error. This last passage converts the continuous construction into a Littlewood polynomial.

To build $B_N$, we adapt the auxiliary-torus and phase-correction arguments of #cite(label("OpenAILowerEnvelope2026")) Sections 2, 4, and 5. The auxiliary object is a real trigonometric polynomial $F \( y \) = sum_(a in cal(A)) c_a upright(e) \( a dot.op y \)$ on a higher-dimensional torus, where $upright(e) \( t \) = exp \( 2 pi i t \)$. Its norm is at most $1 + delta$, and its Fourier coefficients are compared with positive weights $w_a = \| a dot.op v \|$ whose sum is close to one. Here $delta > 0$ is a small error parameter and $v$ is a fixed real vector. The first additional requirement is the two-sided comparison

$ 1 lt.eq \| c_a \| \/ sqrt(w_a) lt.eq 1 + C delta . $

We obtain it by spreading each original coefficient over a box of frequencies and rounding the spreading factors to equal coefficient magnitudes. Section 3 proves the required complex version of the defect-sensitive rounding estimate, and Section 4 carries out the auxiliary construction.

The frequencies of $F$ then supply oscillatory waves on disjoint short arcs, each with constant modulus $\| c_a \| \/ sqrt(w_a)$. Their phases are chosen so that, at a fixed Fourier index, the leading stationary-phase terms sum to a single value of $F$ multiplied by a factor in $\[ 0 \, 1 \]$. The norm bound for $F$ therefore controls these contributions without accumulating the magnitudes of its coefficients.

The second change concerns the endpoints of the waves. We increase the magnitude of their phase curvature near the endpoints while keeping their amplitudes constant. Stationary phase therefore gives small endpoint Fourier contributions while the function’s modulus stays close to one. The waves are joined across the remaining gaps by matching their values and their leading phase derivatives. These matching conditions cancel the first boundary terms in integration by parts and give a summable exterior Fourier tail. Section 2 supplies the analytic estimates, Section 5 constructs and joins the waves, and Section 6 projects and rounds to signs.

The signed interval packing and real matrix discrepancy lemmas are inherited from #cite(label("OpenAILowerEnvelope2026")) Lemmas 3.1 and 6.2. Their combinatorial inputs are the Pippenger–Spencer hypergraph-coloring theorem #cite(label("PippengerSpencer1989")), in the quantified form of #cite(label("AlonYuster2005")) Lemma 2.1, and the partial-coloring method of Spencer #cite(label("Spencer1985")) and Lovett–Meka #cite(label("LovettMeka2015")). Discrepancy and the repair of exceptional arcs also occur in #cite(label("BalisterEtAl2020")) Sections 2.1 and 4, where a sine polynomial corrects a Rudin–Shapiro cosine polynomial. Here the correction joins oscillatory waves while preserving their almost constant modulus. All dimensions, packing data, intervals, and leading phases are fixed before the final length tends to infinity; the construction consequently applies to all sufficiently large integer lengths.

== 2 Oscillatory integral estimates <sec:oscillation>

Throughout, $bb(T) = bb(R) \/ bb(Z)$, $upright(e) \( t \) = exp \( 2 pi i t \)$, and Haar measure on each torus has mass one. We use the Fourier convention $hat(f) \( k \) = integral_(bb(T)) f \( t \) upright(e) \( - k t \) thin d t$, and the same convention on $bb(R)$. Constants denoted by $C$ are absolute and may change from line to line. Subscripts indicate dependence on fixed data. The length $N$ will tend to infinity only after all auxiliary data have been fixed.

We record three elementary forms of stationary phase. The first supplies uniform control of every coefficient of a truncated quadratic wave. The second identifies the leading coefficients of the main construction; the third handles its small end pieces and gaps.

#thm([Lemma 2.1.])[
  (Uniform quadratic formula).  #emph[Let $g in C_c^oo \( bb(R) \)$ and $beta in bb(R) \\ { 0 }$. As $T arrow.r oo$, uniformly for all $u in bb(R)$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ integral_(bb(R)) g \( y \) upright(e) \( T beta y^2 \/ 2 - u y \) thin d y = frac(upright(e) \( "sgn" \( beta \) \/ 8 - u^2 \/ \( 2 T beta \) \), sqrt(T \| beta \|)) [g (frac(u, T beta)) + O_(g \, beta) \( T^(- 1) \)] . $ <eq:quadratic-formula>]

]
] <lem:quadratic>

#proof[
  Put $y_0 = u \/ \( T beta \)$ and complete the square. Fourier inversion reduces the bracket in (2.1) to the exact expression
  $ integral_(bb(R)) hat(g) \( xi \) upright(e) \( xi y_0 \) upright(e) #scale(x: 120%, y: 120%)[\(] - xi^2 \/ \( 2 T beta \) #scale(x: 120%, y: 120%)[\)] thin d xi . $
  For completeness, this identity follows by inserting $exp \( - pi r \( y - y_0 \)^2 \)$, $r > 0$, before applying Fourier inversion. The inner Gaussian integral has factor $\( r - i T beta \)^(- 1 \/ 2) exp \( - pi xi^2 \/ \( r - i T beta \) \)$; its modulus is at most $\( T \| beta \| \)^(- 1 \/ 2)$. Dominated convergence against $\| hat(g) \( xi \) \|$ justifies $r arrow.b 0$ and yields the factor $upright(e) \( "sgn" \( beta \) \/ 8 \) \/ sqrt(T \| beta \|)$. Finally, replacing $upright(e) \( - xi^2 \/ \( 2 T beta \) \)$ by $1$ costs at most
  $ frac(pi, T \| beta \|) integral_(bb(R)) xi^2 \| hat(g) \( xi \) \| thin d xi \, $
  independently of $y_0$. ◻
]

#thm([Lemma 2.2.])[
  (Uniform stationary phase).  #emph[Let $I$ be a compact interval, let $phi.alt$ be smooth on a neighborhood of $I$ with $phi.alt''$ nowhere zero there, and let $f in C_c^oo \( "int" I \)$. Uniformly for $x in \[ 0 \, 1 \]$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ sqrt(N) integral_I f \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] N \( phi.alt \( t \) - x t \) #scale(x: 120%, y: 120%)[\)] thin d t = frac(f \( t_x \), sqrt(\| phi.alt'' \( t_x \) \|)) upright(e) #scale(x: 120%, y: 120%)[\(] N \( phi.alt \( t_x \) - x t_x \) + "sgn" \( phi.alt'' \) \/ 8 #scale(x: 120%, y: 120%)[\)] + o \( 1 \) \, $ <eq:stationary-phase>]

 where $t_x$ is the unique point with $phi.alt' \( t_x \) = x$ if it exists in $I$, and the right-hand main term is zero otherwise.]
] <lem:stationary-phase>

#proof[
  Write $d = "sgn" \( phi.alt'' \)$. If $t_x in I$, the change of variable
  $ y = \( t - t_x \) (frac(2 d \[ phi.alt \( t \) - phi.alt \( t_x \) - phi.alt' \( t_x \) \( t - t_x \) \], \( t - t_x \)^2))^(1 \/ 2) $
  extends smoothly across $t = t_x$ and changes the phase to $phi.alt \( t_x \) - x t_x + d y^2 \/ 2$. Taylor’s integral formula and the lower bound on $\| phi.alt'' \|$ show that this is a smooth increasing coordinate with derivative bounded above and below, uniformly for $t_x in I$. All its required derivatives and those of its inverse are uniformly bounded. The transformed amplitudes, extended by zero, have support in a fixed compact set and uniformly bounded smooth norms, because $"supp" f$ is separated from the endpoints of $I$. At $y = 0$ their value is $f \( t_x \) \/ sqrt(\| phi.alt'' \( t_x \) \|)$. Lemma 1, whose error is controlled by a fixed finite collection of smooth norms, proves the assertion uniformly in this case. If $x in.not phi.alt' \( I \)$, the distance between $x$ and $phi.alt' \( "supp" f \)$ is bounded below uniformly; integration by parts then gives an $O \( N^(- 1) \)$ integral. These two cases include the endpoints of $phi.alt' \( I \)$. ◻
]

#thm([Lemma 2.3.])[
  (Bounds with endpoint amplitudes).  #emph[Let $I$ be a compact interval, $f in C^1 \( I \)$, and $phi.alt$ be real and smooth. If $phi.alt'' = Lambda eq.not 0$ on $I$, then for all real $k$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ lr(|integral_I f \( t \) upright(e) \( N phi.alt \( t \) - k t \) thin d t|) lt.eq C / sqrt(N \| Lambda \|) (lr(bar.v.double  bar.v.double) f_oo + integral_I \| f' \( t \) \| thin d t) . $ <eq:quadratic-bound>]

 If $N phi.alt' - k$ is monotone and has absolute value at least $N rho > 0$, the same bound holds with $C \/ \( N rho \)$ in place of $C \/ sqrt(N \| Lambda \|)$.]
] <lem:oscillatory-bounds>

#proof[
  The primitive of $upright(e) \( plus.minus y^2 \/ 2 \)$ has bounded differences on arbitrary real intervals: inside $\[ - 1 \, 1 \]$ this is immediate, and on either remaining half-line integration by parts gives a uniform bound. Completing the square and rescaling therefore bounds every subinterval integral of $upright(e) \( N phi.alt - k t \)$ by $C \/ sqrt(N \| Lambda \|)$ in the quadratic case. In the monotone case, one integration by parts bounds every such integral by $C \/ \( N rho \)$; monotonicity bounds the total variation of $\( N phi.alt' - k \)^(- 1)$ by $2 \/ \( N rho \)$. Integration against the amplitude $f$, using either primitive, gives the stated estimates. ◻
]

== 3 Rounding with a small defect <sec:rounding>

We need to round almost unimodular coefficients while controlling the error on the whole circle. The estimate below extends the real rounding argument of #cite(label("OpenAILowerEnvelope2026")) Section 6 to prescribed complex phases. We quote its real matrix discrepancy lemma below; the proof there uses the partial-coloring method of Spencer #cite(label("Spencer1985")) and the real-vector theorem of Lovett and Meka #cite(label("LovettMeka2015")) Theorem 4 of arXiv:1203.5747v2.

#thm([Lemma 3.1.])[
  (Real matrix discrepancy).  #emph[There is an absolute constant $C$ such that, for integers $1 lt.eq s lt.eq R$ and every $A in \[ - 1 \, 1 \]^(R times s)$, there is a vector $xi in { - 1 \, 1 }^s$ satisfying 
$ lr(bar.v.double A xi bar.v.double)_oo lt.eq C sqrt(s log \( 2 R \/ s \)) . $

]
] <lem:matrix-discrepancy>

#proof[
  This is #cite(label("OpenAILowerEnvelope2026")) Lemma 6.2, whose statement applies to arbitrary real matrices in the displayed rectangular range. ◻
]

#thm([Lemma 3.2.])[
  (Rounding with prescribed phases).  #emph[Let $n gt.eq 1$ be an integer and $Z_0 \, dots.h \, Z_(n - 1) in bb(C)$ satisfy $\| Z_j \| lt.eq 1$. Write $Z_j = d_j \| Z_j \|$, where $\| d_j \| = 1$, choosing $d_j = 1$ when $Z_j = 0$, and put 
$ mu = 1 / 2 sum_(j = 0)^(n - 1) \( 1 - \| Z_j \| \) . $

 There are $eta_j in { d_j \, - d_j }$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ sup_(t in bb(T)) lr(|sum_(j = 0)^(n - 1) \( eta_j - Z_j \) upright(e) \( j t \)|) lt.eq C (1 + sqrt(mu log \( 80 n \/ mu \))) \, $ <eq:complex-rounding>]

 with an absolute constant $C$. The square-root term is zero for $mu = 0$, when the error can be zero. For real inputs the outputs are real signs. The same estimate holds on any interval of $n$ consecutive integer frequencies.]
] <lem:complex-rounding>

#proof[
  If $mu = 0$, take $eta_j = Z_j$. Suppose $mu > 0$, and set $p_j = \( 1 - \| Z_j \| \) \/ 2$. Then $0 lt.eq p_j lt.eq 1 \/ 2$ and $sum_j p_j = mu$. On the grid $t_ell = ell \/ \( 20 n \)$, $0 lt.eq ell < 20 n$, form the real matrix with $R = 40 n$ rows
  $ A_(2 ell \, j) = Re #scale(x: 120%, y: 120%)[\(] d_j upright(e) \( j t_ell \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) A_(2 ell + 1 \, j) = Im #scale(x: 120%, y: 120%)[\(] d_j upright(e) \( j t_ell \) #scale(x: 120%, y: 120%)[\)] . $
  Every entry belongs to $\[ - 1 \, 1 \]$. We round $p$ to a vector in ${ 0 \, 1 }^n$, preserving an upper bound on its total mass.
  Choose an integer $J gt.eq 1$ with $n 2^(- J) lt.eq 1$, and first set $p_j^(\( J \)) = 2^(- J) floor.l 2^J p_j floor.r$. This costs at most $1$ in $lr(bar.v.double A \( p^(\( J \)) - p \) bar.v.double)_oo$ and does not increase the mass. At stage $h = J \, dots.h \, 1$, let $S_h$ contain those coordinates for which $2^h p_j^(\( h \))$ is odd, and let $s_h = \| S_h \|$. If $s_h = 0$, leave the vector unchanged. Otherwise apply Lemma 4 to the columns indexed by $S_h$. Reverse all its signs if necessary so that their sum is nonpositive, and put
  $ p_j^(\( h - 1 \)) = cases(delim: "{", p_j^(\( h \)) + 2^(- h) xi_j \, & j in S_h \,, p_j^(\( h \)) \, & j in.not S_h .) $
  An odd multiple of $2^(- h)$ in $\[ 0 \, 1 \]$ lies between $2^(- h)$ and $1 - 2^(- h)$. Either change therefore stays in $\[ 0 \, 1 \]$ and lies on the next coarser grid. The total mass remains at most $mu$, while the simultaneous sign reversal leaves the absolute discrepancy unchanged. In particular, each active coordinate has mass at least $2^(- h)$, so
  $ s_h lt.eq min \( n \, 2^h mu \) \, #h(2em) lr(bar.v.double A \( p^(\( h - 1 \)) - p^(\( h \)) \) bar.v.double)_oo lt.eq C 2^(- h) sqrt(s_h log \( 80 n \/ s_h \)) . $
  The last inequality is used only at nonempty stages. Monotonicity of $s log \( 80 n \/ s \)$ on $\( 0 \, n \]$ gives
  $ s_h log \( 80 n \/ s_h \) lt.eq 2^h mu log \( 80 n \/ mu \) . $
  For $2^h mu > n$, use the bound $n log 80$ on the left and $mu lt.eq n \/ 2$ on the right. Summing the geometric series of step errors yields, with $p' = p^(\( 0 \)) in { 0 \, 1 }^n$,
  #[#set math.equation(numbering: n => "(3.2)")
   $ lr(bar.v.double A \( p' - p \) bar.v.double)_oo lt.eq 1 + C sqrt(mu log \( 80 n \/ mu \)) . $ <eq:rounding-matrix-error>]
  Set $eta_j = d_j \( 1 - 2 p'_j \)$ and $Q \( z \) = sum_(j = 0)^(n - 1) \( eta_j - Z_j \) z^j$. The real and imaginary parts of $Q \( upright(e) \( t_ell \) \)$ are each bounded by twice the left side of (3.2). Thus the claimed error bound holds on the grid. To pass to the circle, let $S = max_(\| z \| = 1) \| Q \( z \) \|$. The maximum principle, applied also to the reversed polynomial, gives
  $ \| Q \( z \) \| lt.eq S max \( 1 \, \| z \|^(n - 1) \) \, #h(2em) max_(\| z \| lt.eq 1 + 1 \/ n) \| Q \( z \) \| lt.eq exp \( 1 \) S . $
  Cauchy’s estimate in disks of radius $1 \/ n$ centered on the unit circle therefore gives
  $ lr(|frac(d, d t) Q \( upright(e) \( t \) \)|) lt.eq 2 pi exp \( 1 \) n S . $
  Every point of $bb(T)$ is within $1 \/ \( 40 n \)$ of the grid. Hence $S lt.eq max_ell \| Q \( upright(e) \( t_ell \) \) \| + \( pi exp \( 1 \) \/ 20 \) S$. Since $pi exp \( 1 \) \/ 20 < 1$, this proves (3.1). Multiplication by a unimodular monomial handles shifted consecutive frequencies. If the inputs are real, all $d_j$ are signs and hence so are the outputs. ◻
]

== 4 A real auxiliary function with balanced coefficients <sec:balanced>

The wave construction will use a bounded real trigonometric polynomial whose coefficient magnitudes are close to the square roots of its frequency weights. These weights must have the form $\| a dot.op v \|$, where $a$ is a Fourier frequency and $v$ is one common vector. We adapt the auxiliary-torus construction of #cite(label("OpenAILowerEnvelope2026")) Section 2. The additional step is to round the coefficients of each spreading factor to a common magnitude.

#thm([Proposition 4.1.])[
  #emph[For every $0 < delta < 1 \/ 100$, there are an integer $m gt.eq 2$, a real trigonometric polynomial $F$ on $bb(T)^m$, and $v in bb(R)^m$ with the following properties. Its Fourier support $cal(A) subset bb(Z)^m \\ { 0 }$ consists of at least two pairs ${ a \, - a }$, with distinct pairs nonparallel. If 
$ c_a = hat(F) \( a \) \, #h(2em) lambda_a = a dot.op v \, #h(2em) w_a = \| lambda_a \| \, $

 then, for an absolute constant $C$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ lr(bar.v.double  bar.v.double) F_oo lt.eq 1 + delta \, #h(2em) w_a > 0 \,\
1 - C delta lt.eq sum_(a in cal(A)) w_a < 1 \, #h(2em) 1 lt.eq frac(\| c_a \|, sqrt(w_a)) lt.eq 1 + C delta quad \( a in cal(A) \) . $ <eq:balanced>]

 The coefficient ratios in (4.1) are also at most $2$.]
] <prop:balanced>

We first construct the one-dimensional factors that will spread each original frequency into a box. The requirement that every coefficient have the same magnitude makes the later comparison with $w_a$ exact.

#thm([Lemma 4.2.])[
  (Spreading with equal coefficient magnitudes).  #emph[Let $cal(B) subset bb(R) \\ { 0 }$ be finite and invariant under negation. For every $alpha > 0$, there is a real $g in C_c^oo \( \( - 1 \/ 2 \, 1 \/ 2 \) \)$, with $0 lt.eq g lt.eq 1$, such that for every sufficiently large real $T$ and each $beta in cal(B)$ there is a trigonometric polynomial 
$ f_beta \( y \) = sum_(\| u \| lt.eq floor.l T \| beta \| \/ 2 floor.r) a_(beta \, u) upright(e) \( u y \) \, #h(2em) \| a_(beta \, u) \| = L_beta^(- 1 \/ 2) \, #h(2em) L_beta = 2 floor.l T \| beta \| \/ 2 floor.r + 1 \, $

 satisfying 
#[#set math.equation(numbering: n => "(4.2)")
 $ lr(bar.v.double f_beta - g \( thin dot.op thin \) upright(e) \( T beta \( thin dot.op thin \)^2 \/ 2 \) bar.v.double)_oo lt.eq alpha . $ <eq:spreading-approximation>]

 Here the target is extended periodically from $\[ - 1 \/ 2 \, 1 \/ 2 \]$, and the choices may satisfy $f_(- beta) = overline(f_beta)$.]
] <lem:equal-modulus-spreading>

#proof[
  Choose $0 < q < 1 \/ 4$, to be fixed in terms of $alpha$, and then choose such a $g$ with $integral g^2 gt.eq 1 - q$. For a fixed $beta in cal(B)$, write
  $ I_beta \( u \) = integral_(- 1 \/ 2)^(1 \/ 2) g \( y \) upright(e) \( T beta y^2 \/ 2 - u y \) thin d y #h(2em) \( u in bb(Z) \) . $
  Lemma 1 and $L_beta \/ \( T \| beta \| \) arrow.r 1$ give, uniformly in $u$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ sqrt(L_beta) \| I_beta \( u \) \| lt.eq 1 + q $ <eq:spreading-coefficient-bound>]
  for all sufficiently large $T$. The coefficients outside the stated interval have a small sum of absolute values. Indeed, $"supp" g$ is separated from both endpoints, so on a neighborhood of this support,
  $ \| T beta y - u \| gt.eq c_(g \, beta) \( T + \| u \| \) quad upright("if ") \| u \| > T \| beta \| \/ 2 . $
  Twice integrating by parts, with no boundary terms, gives $\| I_beta \( u \) \| lt.eq C_(g \, beta) \( T + \| u \| \)^(- 2)$ there. The derivative of $T beta y - u$ is $T beta$, so all terms from these integrations have this bound. Consequently
  #[#set math.equation(numbering: n => "(4.4)")
   $ sum_(\| u \| > floor.l T \| beta \| \/ 2 floor.r) \| I_beta \( u \) \| = O_(g \, beta) \( T^(- 1) \) . $ <eq:spreading-tail>]
  For the retained indices define $Z_u = sqrt(L_beta) I_beta \( u \) \/ \( 1 + q \)$. By (4.3), $\| Z_u \| lt.eq 1$. Parseval’s identity and (4.4) show that, for large $T$,
  $ 1 / L_beta sum_u \| Z_u \|^2 gt.eq frac(1 - 2 q, \( 1 + q \)^2) . $
  Since $1 - \| Z_u \| lt.eq 1 - \| Z_u \|^2$, the defect $mu = 1 / 2 sum_u \( 1 - \| Z_u \| \)$ satisfies
  $ mu / L_beta lt.eq frac(4 q + q^2, 2 \( 1 + q \)^2) lt.eq 2 q < 1 \/ 2 . $
  Apply Lemma 5 on this consecutive interval of frequencies, and divide its conclusion by $sqrt(L_beta)$. It gives unit complex numbers $eta_u$. Their polynomial $f_beta \( y \) = sum_u L_beta^(- 1 \/ 2) eta_u upright(e) \( u y \)$ satisfies
  $ lr(bar.v.double f_beta - frac(1, 1 + q) sum_u I_beta \( u \) upright(e) \( u thin dot.op \) bar.v.double)_oo lt.eq C (L_beta^(- 1 \/ 2) + sqrt(q log \( 80 \/ q \))) . $
  Indeed, for $x = mu \/ L_beta > 0$, monotonicity gives $x log \( 80 \/ x \) lt.eq 2 q log \( 40 \/ q \) lt.eq 2 q log \( 80 \/ q \)$; the zero-defect case follows directly from the rounding lemma. By (4.4), the polynomial before rounding differs from the target by at most $q + o \( 1 \)$ in supremum norm. First choose $q$ small enough, then fix $g$, and finally take $T$ large. The resulting error is at most $alpha$. All estimates hold simultaneously for the finite set $cal(B)$. Construct the polynomials for positive $beta$ and set $f_(- beta) = overline(f_beta)$: the targets are conjugates and the frequency intervals are symmetric, so all conclusions are preserved. ◻
]

#proof[
  We first construct a real polynomial with norm at most one and squared $L^2$ norm close to one. Starting with $p_0 = 0$, define successively
  $ p_j \( y_1 \, dots.h \, y_j \) = p_(j - 1) \( y_1 \, dots.h \, y_(j - 1) \) + 1 / 2 \( 1 - p_(j - 1) \( y_1 \, dots.h \, y_(j - 1) \)^2 \) cos \( 2 pi y_j \) . $
  These polynomials have mean zero and satisfy $\| p_j \| lt.eq 1$, because $\( 1 - r^2 \) \/ 2 lt.eq 1 - \| r \|$ for $\| r \| lt.eq 1$. Writing $M_j = integral p_j^2$, integration in the new coordinate gives
  $ M_j - M_(j - 1) = 1 / 8 integral \( 1 - p_(j - 1)^2 \)^2 gt.eq 1 / 8 \( 1 - M_(j - 1) \)^2 . $
  Thus $M_j arrow.t 1$: a limit smaller than one would force increments bounded away from zero. Fix $d gt.eq 2$ with $M_d gt.eq 1 - delta$, and write
  $ p_d \( y \) = sum_(s in cal(S)) b_s upright(e) \( s dot.op y \) \, #h(2em) b_s eq.not 0 . $
  Zero is not in $cal(S)$, since $p_d$ has mean zero. At each step, old frequencies acquire a zero final coordinate and persist, while new frequencies have final coordinate $1$ or $- 1$. Hence every $s in cal(S)$ has last nonzero coordinate $1$ or $- 1$. Parallel members of $cal(S)$ are therefore equal up to sign. The first-coordinate pair persists, and the second step introduces another pair, since $integral \( 1 - p_1^2 \) > 0$. Choose representatives $s_1 \, dots.h \, s_D$ of these sign pairs.
  We next choose the sizes of the frequency boxes. Choose $gamma in bb(R)^d$ outside the finitely many hyperplanes $s^perp$, and put $rho_s = \| s dot.op gamma \| > 0$. The box over $s$ should contain a number of frequencies approximately proportional to $\| b_s \|^2 \/ rho_s$: equal spreading then makes each squared coefficient approximately proportional to $rho_s$, matching the weight supplied by a vector $v$ proportional to $\( gamma \, 0 \)$. We will choose vectors $W_1 \, dots.h \, W_D in bb(R)^d$ with nonzero projections $s dot.op W_j$ and use these projections as spreading parameters. The box over $s$ will then have size asymptotic to $T^D product_j \| s dot.op W_j \|$. We therefore require these products to be approximately $tau \| b_s \|^2 \/ rho_s$, using one small positive parameter $tau$ for all $s$.
  For each $j$, choose $W_j^0 in s_j^perp$ not orthogonal to any other representative. This is possible because $d gt.eq 2$ and the representatives are pairwise nonparallel, so only finitely many proper subspaces of $s_j^perp$ are excluded. Choose $W_j^1 in bb(R)^d$ such that
  $ s_j dot.op W_j^1 = frac(\| b_(s_j) \|^2, rho_(s_j) product_(ell eq.not j) \| s_j dot.op W_ell^0 \|) . $
  Set $W_j = W_j^0 + tau W_j^1$. As $tau arrow.b 0$,
  $ 1 / tau product_(j = 1)^D \| s dot.op W_j \| arrow.r frac(\| b_s \|^2, rho_s) #h(2em) \( s in cal(S) \) . $
  Indeed, exactly the factor belonging to the representative of ${ s \, - s }$ vanishes at $tau = 0$, and its first-order coefficient was just prescribed. Fix $tau > 0$ small enough that all factors are nonzero and, with $beta_(s \, j) = s dot.op W_j$ and $Delta_s = product_j \| beta_(s \, j) \|$,
  #[#set math.equation(numbering: n => "(4.5)")
   $ \( 1 - delta \) frac(tau \| b_s \|^2, rho_s) lt.eq Delta_s lt.eq \( 1 + delta \) frac(tau \| b_s \|^2, rho_s) #h(2em) \( s in cal(S) \) . $ <eq:projection-products>]
  All these data are now fixed. Apply Lemma 7 to the finite list of nonzero $beta_(s \, j)$, choosing $alpha > 0$ small enough that
  #[#set math.equation(numbering: n => "(4.6)")
   $ (sum_(s in cal(S)) \| b_s \|) D alpha \( 1 + alpha \)^(D - 1) lt.eq delta . $ <eq:balanced-product-error>]
  With the resulting common cutoff $g$ and sufficiently large $T$, define
  $ F \( y \, z \) = sum_(s in cal(S)) b_s upright(e) \( s dot.op y \) product_(j = 1)^D f_(beta_(s \, j)) \( z_j \) \, #h(2em) \( y \, z \) in bb(T)^d times bb(T)^D . $
  The conjugation condition on the factors and $b_(- s) = overline(b_s)$ show that $F$ is real. If each factor is replaced by its target, the resulting function is
  $ (product_(j = 1)^D g \( z_j \)) p_d (y + T / 2 sum_(j = 1)^D W_j z_j^2) \, $
  where $z_j$ is represented in $\[ - 1 \/ 2 \, 1 \/ 2 \]$. The cutoffs vanish near the endpoints, so this expression is well defined on the torus and has norm at most one. A telescoping product estimate bounds its distance from $F$ by the left side of (4.6). Therefore $lr(bar.v.double  bar.v.double) F_oo lt.eq 1 + delta$.
  Over each old frequency $s$, the Fourier support of $F$ is the full box
  $ a = \( s \, u_1 \, dots.h \, u_D \) \, #h(2em) \| u_j \| lt.eq floor.l T \| beta_(s \, j) \| \/ 2 floor.r . $
  This box has $n_s = product_j L_(beta_(s \, j))$ members, each with coefficient magnitude $\| b_s \| \/ sqrt(n_s)$. Distinct old frequencies give disjoint boxes, so every indicated coefficient is nonzero. If two resulting frequencies are parallel, their $s$ coordinates force the proportionality factor to be $1$ or $- 1$; thus they are equal or opposite. There remain at least two sign pairs, and no zero frequency.
  Since $L_beta \/ \( T \| beta \| \) arrow.r 1$, increase $T$ so that
  #[#set math.equation(numbering: n => "(4.7)")
   $ \( 1 - delta \) T^D Delta_s lt.eq n_s lt.eq \( 1 + delta \) T^D Delta_s #h(2em) \( s in cal(S) \) \, $ <eq:box-sizes>]
  and choose the approximants at this value of $T$. This is permitted because the spreading lemma holds for every sufficiently large $T$. Fix $T$, put $m = d + D$, and take
  $ v = (frac(gamma, tau T^D \( 1 + delta \)^3) \, 0) in bb(R)^(d + D) . $
  For every frequency $a$ over $s$, its weight is $w_a = rho_s \/ \( tau T^D \( 1 + delta \)^3 \) > 0$. Combining (4.5) and (4.7) gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ frac(\( 1 - delta \)^2, \( 1 + delta \)^3) \| b_s \|^2 & lt.eq sum_(a upright(" over ") s) w_a lt.eq frac(\| b_s \|^2, 1 + delta) \,\
1 + delta & lt.eq frac(\| c_a \|^2, w_a) lt.eq frac(\( 1 + delta \)^3, \( 1 - delta \)^2) . $ <eq:balanced-weight-bounds>]
  Finally, $1 - delta lt.eq sum_s \| b_s \|^2 = M_d lt.eq 1$, so the total weight lies between $\( 1 - delta \)^3 \/ \( 1 + delta \)^3$ and $1 \/ \( 1 + delta \)$. The ratio bounds in (4.8) imply $1 lt.eq \| c_a \| \/ sqrt(w_a) lt.eq 1 + C delta$, and the upper bound is less than $2$ for $0 < delta < 1 \/ 100$. These are all the assertions of (4.1). The choices were made in the order $delta$, $p_d$, $gamma$, $\( W_j^0 \, W_j^1 \)$, $tau$, $alpha$, $g$, $T$; in particular the entire auxiliary construction is fixed before the polynomial length is chosen. ◻
]

== 5 Waves of nearly constant modulus <sec:waves>

The balanced coefficients of Proposition 6 allow us to build a function on the circle whose modulus stays close to one. Its oscillations spread its Fourier mass over the indices $0 \, dots.h \, N - 1$. The essential endpoint choice is to increase phase curvature, rather than to decrease modulus: the resulting endpoint contributions are small while the function remains bounded away from zero.

#thm([Proposition 5.1.])[
  #emph[There are absolute constants $C > 0$ and $delta_0 > 0$ with the following property. For every $0 < delta < delta_0$, there are $N_0 \( delta \)$ and $K_delta < oo$ such that, for every integer $N gt.eq N_0 \( delta \)$, there is a continuous function $B_N : bb(T) arrow.r bb(C)$ satisfying 
#[#set math.equation(numbering: n => "(5.1)")
 $ B_N \( - t \) & = overline(B_N \( t \)) \, & 1 lt.eq \| B_N \( t \) \| & lt.eq 1 + C delta quad \( t in bb(T) \) \,\
sqrt(N) thin \| hat(B)_N \( k \) \| & lt.eq 1 + C sqrt(delta) &  & \( 0 lt.eq k < N \) \,\
sum_(k < 0 upright(" or ") k gt.eq N) \| hat(B)_N \( k \) \| & lt.eq K_delta N^(- 1) . $ <eq:wave-modulus>]

 Its Fourier coefficients are real, and its Fourier series converges absolutely and represents $B_N$.]
] <prop:waves>

We use the following packing result from the preceding version. Its proof combines a finite-field construction with almost-perfect matchings in nearly regular hypergraphs; only its stated conclusion is needed here.

#thm([Lemma 5.2.])[
  (Signed interval packing, #cite(label("OpenAILowerEnvelope2026")) Lemma 3.1).  #emph[Let $a_1 \, dots.h \, a_r in bb(Z)^m \\ { 0 }$ be pairwise nonparallel, with $r gt.eq 2$, and let $w_1 \, dots.h \, w_r > 0$ satisfy $2 sum_i w_i < 1$. There are an integer $H gt.eq 1$ and points $theta_1 \, dots.h \, theta_H in bb(T)^m$ such that the closed arcs centered at $plus.minus a_i dot.op theta_h$, of length $w_i \/ H$, are pairwise disjoint as $i$, $h$, and the sign vary.]
] <lem:signed-packing>

#proof[
  Fix $delta$ and choose the data of Proposition 6. Thus
  $ F \( y \) = sum_(a in cal(A)) c_a upright(e) \( a dot.op y \) \, #h(2em) lambda_a = a dot.op v \, #h(2em) w_a = \| lambda_a \| \, $
  where $F$ is real, $cal(A) = - cal(A)$, and
  #[#set math.equation(numbering: n => "(5.2)")
   $ parallel F parallel_oo lt.eq 1 + delta \, #h(2em) 1 - C delta lt.eq sum_(a in cal(A)) w_a < 1 \, #h(2em) 1 lt.eq m_a := frac(\| c_a \|, sqrt(w_a)) lt.eq 1 + C delta lt.eq 2 . $ <eq:wave-input>]
  There are at least two sign-pairs in $cal(A)$, and representatives of these pairs are nonparallel. All choices below, apart from bounded phase adjustments used to join endpoint values, will be fixed before $N$ tends to infinity. Constants depending on these choices are allowed in errors that vanish with $N$; the constants multiplying $delta$ and $sqrt(delta)$ in the final bounds will be absolute. We first obtain a bound $1 + O \( delta \)$ for the scaled Fourier contribution of the main intervals, then fill their small complement at cost $O \( sqrt(delta) \)$. A separate integration-by-parts argument will control the sum of the exterior coefficients.
  === Packed intervals and inverse curvature <packed-intervals-and-inverse-curvature>
  Apply Lemma 9 to one representative from each sign-pair, using $w_(- a) = w_a$. It gives disjoint closed arcs centered at $- a dot.op theta_h$, of length $w_a \/ H$, for all $a in cal(A)$ and $1 lt.eq h lt.eq H$. Each arc is disjoint from its reflection and consequently avoids the two fixed points $0$ and $1 \/ 2$ of reflection on $bb(T)$. We may therefore regard the arcs as intervals in $\( - 1 \/ 2 \, 1 \/ 2 \)$, with center representatives $t_(a \, h)^(*)$ satisfying
  #[#set math.equation(numbering: n => "(5.3)")
   $ t_(a \, h)^(*) equiv - a dot.op theta_h med \( mod med 1 \) \, #h(2em) t_(- a \, h)^(*) = - t_(a \, h)^(*) . $ <eq:wave-centers>]
  The variable $x$ will denote the normalized Fourier index $k \/ N$. For each $h$, choose a closed interval
  $ J_h subset \( \( h - 1 \) \/ H \, h \/ H \) $
  symmetric about $x_h^(*) = \( h - 1 \/ 2 \) \/ H$. On $J_h$ choose a smooth function $chi_h$, symmetric about $x_h^(*)$, such that
  #[#set math.equation(numbering: n => "(5.4)")
   $ sigma lt.eq chi_h lt.eq 1 \, #h(2em) chi_h = sigma upright(" near both endpoints") \, #h(2em) integral_(J_h) chi_h \( x \)^2 thin d x gt.eq frac(1 - delta, H) . $ <eq:wave-taper>]
  Here $sigma in \( 0 \, 1 \)$ can be arbitrarily small. Indeed, first choose $\| J_h \| > \( 1 - delta \/ 2 \) \/ H$, and then take $chi_h = 1$ except on endpoint neighborhoods of total length less than $delta \/ \( 2 H \)$, with smooth transitions to $sigma$.
  We will specify the point $t$ at which a wave’s phase derivative equals $x$. Requiring $\| d t \/ d x \| = w_a chi_h \( x \)^2$ makes the stationary-phase factor equal to $sqrt(w_a) chi_h \( x \)$, so a wave of modulus $m_a$ has leading scaled coefficient magnitude $\| c_a \| chi_h \( x \)$. Thus $chi_h$ can suppress endpoint Fourier contributions without decreasing the wave modulus.
  Choose smooth real $Q_h$ with
  $ Q''_h = chi_h^2 \, #h(2em) Q'_h \( x_h^(*) \) = 0 \, $
  and with a smooth extension to a neighborhood of $J_h$. Define
  #[#set math.equation(numbering: n => "(5.5)")
   $ T_(a \, h) \( x \) = t_(a \, h)^(*) - lambda_a Q'_h \( x \) \, #h(2em) x in J_h . $ <eq:wave-map>]
  This is a diffeomorphism, possibly reversing orientation, onto a closed interval $I_(a \, h)$. Symmetry and $chi_h lt.eq 1$ give $\| Q'_h \| lt.eq \| J_h \| \/ 2 < 1 \/ \( 2 H \)$, so $I_(a \, h)$ lies strictly inside its assigned packed arc. Write $X_(a \, h) : I_(a \, h) arrow.r J_h$ for the inverse map and set
  #[#set math.equation(numbering: n => "(5.6)")
   $ psi_(a \, h) \( t \) & = \( t - t_(a \, h)^(*) \) X_(a \, h) \( t \) + lambda_a Q_h \( X_(a \, h) \( t \) \) \,\
psi'_(a \, h) \( t \) & = X_(a \, h) \( t \) \, & psi''_(a \, h) \( t \) & = - frac(1, lambda_a chi_h \( X_(a \, h) \( t \) \)^2) . $ <eq:wave-phase>]
  The derivative identities follow by differentiating (5.6) and using (5.5). On each $I_(a \, h)$ define
  #[#set math.equation(numbering: n => "(5.7)")
   $ B_N \( t \) = c_a / sqrt(w_a) upright(e) #scale(x: 120%, y: 120%)[\(] "sgn" \( lambda_a \) \/ 8 + N psi_(a \, h) \( t \) #scale(x: 120%, y: 120%)[\)] . $ <eq:main-wave>]
  The modulus is the constant $m_a$. Moreover, $T_(- a \, h) \( x \) = - T_(a \, h) \( x \)$ and $psi_(- a \, h) \( - t \) = - psi_(a \, h) \( t \)$; together with $c_(- a) = overline(c_a)$ these give conjugate symmetry on the main intervals. Their total length is
  #[#set math.equation(numbering: n => "(5.8)")
   $ sum_(a \, h) \| I_(a \, h) \| = sum_(a \, h) w_a integral_(J_h) chi_h^2 gt.eq \( 1 - delta \) sum_a w_a gt.eq 1 - C delta . $ <eq:main-coverage>]
  === Coherent stationary contributions <coherent-stationary-contributions>
  The phase choice will make the leading stationary contributions sum to a scalar multiple of a single value of $F$. We first isolate them with a cutoff and estimate the remaining endpoint pieces using their large curvature.
  Choose $G_h in C_c^oo \( "int" J_h \)$ with $0 lt.eq G_h lt.eq 1$, such that, on $J_h$, $1 - G_h$ is supported in the two endpoint intervals where $chi_h = sigma$, and is monotone on each such interval. Split each integral over $I_(a \, h)$ using the cutoff $G_h \( X_(a \, h) \( t \) \)$. On either endpoint part the phase has constant second derivative of modulus $1 \/ \( w_a sigma^2 \)$. The cutoff has bounded total variation. Lemma 3 therefore bounds this part, after multiplication by $sqrt(N)$, by
  $ C m_a sqrt(w_a) thin sigma = C \| c_a \| sigma . $
  Choose $sigma$ so small, before fixing the functions in (5.4), that the sum of these bounds over all endpoints is at most $delta$.
  For the part with cutoff, apply Lemma 2 with $x = k \/ N$. After multiplication by $sqrt(N)$, the leading term is zero if $x in.not J_h$; if $x in J_h$, its stationary point is $t = T_(a \, h) \( x \)$ and its value is
  #[#set math.equation(numbering: n => "(5.9)")
   $ c_a G_h \( x \) chi_h \( x \) upright(e) #scale(x: 120%, y: 120%)[\(] - k t_(a \, h)^(*) + N lambda_a Q_h \( x \) #scale(x: 120%, y: 120%)[\)] . $ <eq:main-leading-term>]
  Indeed,
  $ psi_(a \, h) \( T_(a \, h) \( x \) \) - x T_(a \, h) \( x \) = - x t_(a \, h)^(*) + lambda_a Q_h \( x \) \, $
  and the phase correction $"sgn" \( psi''_(a \, h) \) \/ 8$ cancels the constant $"sgn" \( lambda_a \) \/ 8$ in (5.7). The error is $o \( 1 \)$ uniformly for $0 lt.eq k < N$.
  At most one $J_h$ contains $x$. For that $h$, summing (5.9) over $a$ gives
  $ G_h \( x \) chi_h \( x \) F #scale(x: 120%, y: 120%)[\(] k theta_h + N v Q_h \( x \) #scale(x: 120%, y: 120%)[\)] . $
  Here (5.3) may be used inside the exponential because $k$ is an integer. Since $0 lt.eq G_h chi_h lt.eq 1$, the norm bound for $F$ and the endpoint estimates imply
  #[#set math.equation(numbering: n => "(5.10)")
   $ sqrt(N) lr(|sum_(a \, h) integral_(I_(a \, h)) B_N \( t \) upright(e) \( - k t \) thin d t|) lt.eq 1 + 2 delta + o \( 1 \) \, #h(2em) 0 lt.eq k < N . $ <eq:main-fourier-bound>]
  All errors are uniform in these integer indices. The finite number of intervals is fixed, so summing their stationary-phase errors preserves $o \( 1 \)$.
  === Joining the waves through the gaps <joining-the-waves-through-the-gaps>
  It remains to define $B_N$ on a set of length $O \( delta \)$ without losing its lower modulus bound. We will join the waves continuously and also match the derivatives of their leading phases. The first condition preserves the desired function; together, the two conditions will cancel the boundary terms in the exterior Fourier estimate.
  Work first on $\[ 0 \, 1 \/ 2 \]$. Let $\[ u_j \, v_j \]$ be the closures of the gaps between its main intervals, including the gaps adjacent to $0$ and $1 \/ 2$. Put $l_j = v_j - u_j$ and $L = sum_j l_j$. Strict containment in the packed arcs and (5.8) give
  $ 0 < L lt.eq C delta \, $
  and each $l_j$ is positive. At an endpoint $z$ adjoining a main interval, prescribe the derivative $x_z = psi'_(a \, h) \( z \) in \( 0 \, 1 \)$; at the remaining endpoints prescribe $x_0 = x_(1 \/ 2) = 1 \/ 8$.
  For each gap choose a closed interval $\[ P_j \, R_j \] subset \( 1 \/ 4 \, 3 \/ 4 \)$, of length $l_j \/ \( 4 L \)$, such that these intervals are pairwise disjoint and none of their endpoints equals any prescribed $x_z$. To see that these choices are possible, note that their total length is $1 \/ 4$. They can therefore be arranged with positive spaces between them inside an interval of length less than $1 \/ 2$; a sufficiently small common translation then avoids the finitely many forbidden endpoint values. We call $\[ P_j \, R_j \]$ the derivative interval assigned to gap $j$.
  Divide gap $j$ into three pieces. On these pieces take $phi.alt'_j$ to be linear, successively interpolating
  #[#set math.equation(numbering: n => "(5.11)")
   $ x_(u_j) arrow.r P_j arrow.r R_j arrow.r x_(v_j) . $ <eq:gap-derivative-path>]
  Thus $phi.alt_j$ is continuously differentiable and piecewise quadratic; its additive constant is immaterial. Make both outer pieces shorter than $l_j \/ 4$. Their nonzero slopes $Lambda = phi.alt''_j$ can be made arbitrarily large in absolute value because $P_j eq.not x_(u_j)$ and $R_j eq.not x_(v_j)$. Choose their lengths so that
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_(upright("outer pieces")\
upright("in ") \[ 0 \, 1 \/ 2 \]) \| Lambda \|^(- 1 \/ 2) lt.eq sqrt(delta) . $ <eq:gap-outer-slopes>]
  The middle piece has length at most $l_j$, so its positive slope satisfies
  #[#set math.equation(numbering: n => "(5.13)")
   $ Lambda gt.eq frac(R_j - P_j, l_j) = frac(1, 4 L) . $ <eq:gap-middle-slope>]
  Every value of every leading phase derivative lies in a fixed compact subset of $\( 0 \, 1 \)$.
  Figure 1 illustrates the two distinct uses of these pieces: large outer slopes suppress the cost of joining the prescribed endpoint derivatives, while separated middle derivative intervals ensure that only one middle pair can contribute substantially at a given normalized Fourier index.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (8, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8, 0), [$t$], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 3.6), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 3.6), [$phi_j'(t)$], anchor: "south", padding: 0.1176cm)
  line((0.9, 0), (0.9, 2.9), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.7, 0), (1.7, 1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((6.2, 0), (6.2, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((7, 0), (7, 0.55), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.9, 2.9), (1.7, 1), (6.2, 2.1), (7, 0.55), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((0.9, 2.9), radius: 0.05292, fill: black, stroke: none)
  content((0.9, 2.9), [$x_(u_j)$], anchor: "south-west", padding: 0.1176cm)
  circle((1.7, 1), radius: 0.05292, fill: black, stroke: none)
  content((1.7, 1), [$P_j$], anchor: "north-west", padding: 0.1176cm)
  circle((6.2, 2.1), radius: 0.05292, fill: black, stroke: none)
  content((6.2, 2.1), [$R_j$], anchor: "south-east", padding: 0.1176cm)
  circle((7, 0.55), radius: 0.05292, fill: black, stroke: none)
  content((7, 0.55), [$x_(v_j)$], anchor: "south-west", padding: 0.1176cm)
  content((0.9, 0), [$u_j$], anchor: "north", padding: 0.1176cm)
  content((7, 0), [$v_j$], anchor: "north", padding: 0.1176cm)
  content((3.95, -0.45), [middle piece: derivative range $[P_j,R_j]$], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: A schematic leading phase derivative on one gap. The short outer pieces join the prescribed endpoint values to $P_j$ and $R_j$. Their slopes may have either sign; the middle slope is positive. The drawing shows one possible ordering of the endpoint values, and is not to scale. ],
  ) <fig:gap-derivative>
  Let $m_j$ interpolate linearly between the endpoint moduli $m_a$, with modulus $1$ prescribed at $0$ and $1 \/ 2$. Define on gap $j$
  #[#set math.equation(numbering: n => "(5.14)")
   $ B_N \( t \) = m_j \( t \) upright(e) #scale(x: 120%, y: 120%)[\(] N phi.alt_j \( t \) + gamma_(j \, N) \( t \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:gap-wave>]
  where $gamma_(j \, N)$ is affine. Choose its two endpoint values in $\[ 0 \, 1 \)$ to give the exact phase factors required by the adjoining main waves, and phase factor $1$ at $0$ and $1 \/ 2$. There is no constraint on these choices: each endpoint requires just one congruence modulo $1$. In particular,
  $ integral_(u_j)^(v_j) \| gamma'_(j \, N) \( t \) \| thin d t lt.eq 1 \, #h(2em) \| gamma'_(j \, N) \| lt.eq l_j^(- 1) . $
  The second bound depends on the fixed gap but is independent of $N$. Extend to the negative half-circle by $B_N \( - t \) = overline(B_N \( t \))$. Because $B_N \( 0 \) = B_N \( 1 \/ 2 \) = 1$, this gives a continuous function on $bb(T)$ satisfying (5.1). On reflected gaps use the leading phase $- phi.alt_j \( - t \)$. Its derivative is $phi.alt'_j \( - t \)$, so the leading phase derivatives match across every join, including $0$ and the identified endpoints $plus.minus 1 \/ 2$. Matching the full derivatives of $B_N$ is unnecessary.
  === Fourier cost of the gaps <fourier-cost-of-the-gaps>
  We now bound the Fourier contributions of the gaps. In (5.14) regard $f_N = m_j upright(e) \( gamma_(j \, N) \)$ as the amplitude. On each piece,
  #[#set math.equation(numbering: n => "(5.15)")
   $ sup \| f_N \| + integral \| f'_N \| lt.eq C $ <eq:gap-amplitude-variation>]
  with an absolute constant, since $m_j$ is monotone between values in $\[ 1 \, 2 \]$ and the total variation of $gamma_(j \, N)$ is at most $1$. Lemma 3 and (5.12) show that all outer pieces and their reflections contribute at most $C sqrt(delta)$ to the scaled Fourier coefficient $sqrt(N) thin hat(B)_N \( k \)$.
  Choose a fixed $rho > 0$ so that the closed $rho$-neighborhoods of the finitely many derivative intervals $\[ P_j \, R_j \]$ are pairwise disjoint. At most one of these intervals is within $rho$ of $x = k \/ N$. If such an interval exists, the quadratic estimate and (5.13) bound the total contribution of its middle piece and its reflection by $C sqrt(L)$. Every other middle piece has monotone $phi.alt'_j - x$ of modulus at least $rho$. The first-derivative estimate in Lemma 3, together with (5.15), bounds its scaled contribution by $C \/ \( rho sqrt(N) \)$. The same bound holds for its reflection. Their number and $rho$ are fixed, so the sum of these terms is $o \( 1 \)$, uniformly in $k$. Combining these bounds with (5.10) proves
  $ sqrt(N) thin \| hat(B)_N \( k \) \| lt.eq 1 + 2 delta + C sqrt(delta) + C sqrt(L) + o \( 1 \) lt.eq 1 + C sqrt(delta) + o \( 1 \) \, #h(2em) 0 lt.eq k < N . $
  Increasing $N_0 \( delta \)$ absorbs the last error into $sqrt(delta)$ and proves (5.1). In particular, neither the number of gaps nor their separation contributes to the surviving constant.
  === Cancellation at the joins and the exterior tail <cancellation-at-the-joins-and-the-exterior-tail>
  For projection to the allowed frequencies, an estimate on individual exterior coefficients is insufficient; we need their sum to tend to zero. This is where matching the leading phase derivatives is used. Partition $\[ - 1 \/ 2 \, 1 \/ 2 \]$ into all main intervals and the three pieces of each gap and reflected gap. On each piece write
  $ B_N \( t \) = f_N \( t \) upright(e) \( N phi.alt \( t \) \) . $
  The functions $f_N \, f'_N \, f''_N$ are bounded independently of $N$ on each piece. The phase $phi.alt$ is fixed, its first three derivatives are bounded, and all values of $phi.alt'$ lie in a fixed compact subinterval of $\( 0 \, 1 \)$. These bounds may depend on all the fixed construction data. For $k < 0$ or $k gt.eq N$, put $D = N + \| k \|$ and $V = N phi.alt' - k$. Then
  #[#set math.equation(numbering: n => "(5.16)")
   $ \| V \| gt.eq c D \, #h(2em) \| V' \| + \| V'' \| lt.eq C_(*) N $ <eq:exterior-phase-bounds>]
  on every piece, for fixed $c > 0$ and $C_(*) < oo$.
  The first integration by parts gives boundary terms
  $ frac(f_N \( t \) upright(e) \( N phi.alt \( t \) - k t \), 2 pi i V \( t \)) = frac(B_N \( t \) upright(e) \( - k t \), 2 pi i \( N phi.alt' \( t \) - k \)) . $
  They cancel at every internal join, because $B_N$ is continuous and the leading phase derivatives agree. They also cancel at $- 1 \/ 2$ and $1 \/ 2$: there $B_N = 1$, $phi.alt' = 1 \/ 8$, and $upright(e) \( - k \/ 2 \) = upright(e) \( k \/ 2 \)$ for integer $k$. After this cancellation, a second integration by parts involves
  $ A := frac(\( f_N \/ V \)', V) = f'_N / V^2 - frac(f_N V', V^3) $
  and its derivative
  $ A' = f''_N / V^2 - frac(3 f'_N V', V^3) - frac(f_N V'', V^3) + frac(3 f_N \( V' \)^2, V^4) . $
  Since $N lt.eq D$, (5.16) implies $\| A \| + \| A' \| lt.eq C_(upright("data")) D^(- 2)$. Both the second boundary terms and the remaining integrals therefore have this bound on each piece. There are only finitely many pieces, whence
  $ \| hat(B)_N \( k \) \| lt.eq C_(upright("data")) \( N + \| k \| \)^(- 2) #h(2em) \( k < 0 upright(" or ") k gt.eq N \) . $
  Summing over these integers proves (5.1), since $sum_(k in bb(Z)) \( N + \| k \| \)^(- 2) = O \( N^(- 1) \)$. The finitely many interior coefficients and this summable exterior bound show that the full Fourier series converges absolutely. Its sum equals $B_N$ by continuity and uniqueness of Fourier coefficients. Finally, conjugate symmetry gives $hat(B)_N \( k \) in bb(R)$ for every integer $k$. ◻
]

== 6 Projection and rounding to real signs <sec:completion>

We now complete the proof of Theorem 1. The functions in Proposition 8 already have almost constant modulus. Their Fourier coefficients are real and lie in an almost unit cube after multiplication by $sqrt(N)$. Their large $L^2$ norm forces most of these coefficients to be close to signs, exactly the condition needed by Lemma 5.

Fix a sufficiently small $delta > 0$, and let $B_N$ be supplied by Proposition 8. Choose an absolute constant $C_1$ so that

$ S_delta = 1 + C_1 sqrt(delta) \, #h(2em) Y_k = sqrt(N) / S_delta hat(B)_N \( k \) quad \( 0 lt.eq k < N \) $

satisfy $Y_k in \[ - 1 \, 1 \]$ for every sufficiently large $N$. The symmetry $B_N \( - t \) = overline(B_N \( t \))$ makes every Fourier coefficient real. Set

$ U_Y \( t \) = 1 / sqrt(N) sum_(k = 0)^(N - 1) Y_k upright(e) \( k t \) . $

The absolute Fourier representation and exterior-tail estimate in Proposition 8 give

#[#set math.equation(numbering: n => "(6.1)")
 $ U_Y = B_N \/ S_delta + O_delta \( N^(- 1) \) quad upright("uniformly on ") bb(T) . $ <eq:projection-uniform>]

Parseval’s identity and $\| B_N \| gt.eq 1$ consequently imply

$ 1 / N sum_(k = 0)^(N - 1) Y_k^2 gt.eq S_delta^(- 2) - o \( 1 \) . $

Here and below $N arrow.r oo$ with all the data chosen from $delta$ fixed. Since $\| Y_k \| gt.eq Y_k^2$, the defect satisfies

$ mu / N := frac(1, 2 N) sum_(k = 0)^(N - 1) \( 1 - \| Y_k \| \) lt.eq 1 / 2 \( 1 - S_delta^(- 2) \) + o \( 1 \) . $

Put $q_delta = 1 / 2 \( 1 - S_delta^(- 2) \) + delta$. Then $q_delta arrow.r 0$ as $delta arrow.b 0$, and for all sufficiently large $N$ we have $mu \/ N lt.eq q_delta < 1 \/ 2$.

Lemma 5, applied to these real inputs, produces $epsilon_k in { - 1 \, 1 }$ such that

$ U_epsilon \( t \) = 1 / sqrt(N) sum_(k = 0)^(N - 1) epsilon_k upright(e) \( k t \) quad upright("satisfies") quad lr(bar.v.double U_epsilon - U_Y bar.v.double)_oo lt.eq C (N^(- 1 \/ 2) + sqrt(q_delta log \( 80 \/ q_delta \))) . $

We used the monotonicity of $q log \( 80 \/ q \)$ on $\( 0 \, 1 \/ 2 \]$; the zero-defect case causes no change. If $E_delta = C sqrt(q_delta log \( 80 \/ q_delta \))$, the two-sided modulus bound in Proposition 8 and (6.1) give, uniformly in $t$,

$ S_delta^(- 1) - E_delta - o \( 1 \) lt.eq \| U_epsilon \( t \) \| lt.eq frac(1 + C delta, S_delta) + E_delta + o \( 1 \) . $

For fixed $delta$, the $o \( 1 \)$ terms vanish as $N arrow.r oo$; the resulting bounds both tend to $1$ as $delta arrow.b 0$. Given the $epsilon$ of Theorem 1, choose $delta$ so that the limiting bounds lie strictly between $1 - epsilon$ and $1 + epsilon$, and then take $N$ large enough to absorb the displayed errors. This proves the theorem.

The construction imposes no divisibility condition on $N$. All torus dimensions, packing parameters, intervals, and leading phases were fixed before $N$ was chosen. The phase identities use only that the Fourier index $k$ is an integer. The conclusion therefore holds for every sufficiently large integer length.


#bibliography("refs.bib", style: "ieee", title: [References])
