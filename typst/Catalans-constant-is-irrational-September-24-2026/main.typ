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

#align(center)[#text(size: 16pt, weight: "bold")[Catalan's constant is irrational]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Catalan’s constant is the real number

$ G = beta \( 2 \) = sum_(j = 0)^oo frac(\( - 1 \)^j, \( 2 j + 1 \)^2) \, #h(2em) beta \( s \) = sum_(j = 0)^oo frac(\( - 1 \)^j, \( 2 j + 1 \)^s) quad \( s > 0 \) . $

It is the simplest even value of the Dirichlet beta function, or equivalently $L \( 2 \, chi_(- 4) \)$ for the odd quadratic character of conductor $4$. Its arithmetic illustrates a basic difficulty in the study of special values: rapidly converging rational approximations need not be sufficiently accurate after their denominators are cleared. We prove the following statement about this individual value.

#thm([Theorem 1.1.])[
  #emph[Catalan’s constant is irrational.]
] <thm:main>

=== 1.1 Earlier results and the approximation problem <earlier-results-and-the-approximation-problem>

For odd positive integers, the beta values are rational multiples of the corresponding powers of $pi$. The even values present a different arithmetic problem #cite(label("RivoalZudilin2003")) Introduction. Rivoal and Zudilin proved that infinitely many even beta values are irrational, and that at least one of $beta \( 2 \) \, beta \( 4 \) \, dots.h \, beta \( 14 \)$ is irrational #cite(label("RivoalZudilin2003")) Theorems 1 and 2. Zudilin reduced this finite collection to the six values through $beta \( 12 \)$ #cite(label("Zudilin2019")) Theorem 1. Lai and Zhou subsequently reduced it to the five values $beta \( 2 \) \, beta \( 4 \) \, beta \( 6 \) \, beta \( 8 \) \, beta \( 10 \)$ #cite(label("LaiZhou2022")) Theorem 6.1. Fischler obtained stronger quantitative results for irrationality and linear independence in families of Dirichlet $L$-values #cite(label("Fischler2020")) Theorems 1 and 2. Such family results guarantee irrational members without identifying the particular value $beta \( 2 \)$.

For an individual value, the basic approximation criterion requires nonzero integer linear forms $A_m G - B_m$ that tend to zero. Convergence of $B_m \/ A_m$ to $G$ alone does not suffice: multiplication by $A_m$ may remove the decay. Apéry’s recurrence constructions for $zeta \( 2 \)$ and $zeta \( 3 \)$ #cite(label("Apery1979")), and Beukers’s integral proofs of their irrationality #cite(label("Beukers1979")) succeed because the analytic decay survives the necessary denominator clearing. For Catalan’s constant, Zudilin constructed Apéry-like recurrences, a continued fraction and double-integral representations #cite(label("Zudilin2003")) Theorems 1–3. His discussion following Theorem 1 makes the obstruction explicit: the displayed integer linear forms do not tend to zero, despite the rapid convergence of their rational quotients.

The denominators themselves became an important part of the problem. Rivoal connected Padé approximation with the hypergeometric construction and proved its conjectured denominator bounds #cite(label("Rivoal2006Catalan")) Theorems 1 and 2. Krattenthaler and Rivoal subsequently gave a more direct hypergeometric proof of these bounds #cite(label("KrattenthalerRivoal2008Catalan")) Theorems 1 and 2. These results establish arithmetic cancellation that is invisible in a crude estimate of the individual summands. They still leave a denominator cost too large for the small-linear-form criterion. Krattenthaler and Zudilin later identified two apparently different hypergeometric constructions of the same approximants #cite(label("KrattenthalerZudilin2019")) Section 2 and Theorem 2. Such identities matter arithmetically because different expressions can make different denominator factors visible.

Nesterenko developed effective approximations using half-integer hypergeometric series and double Euler integrals #cite(label("Nesterenko2016Catalan")). Viola announced joint work with Marcovecchio improving an approximation exponent through the Rhin–Viola permutation-group method #cite(label("Viola2022Catalan")); their report gives the exponent $0.6293 dots.h$ for its explicit approximants. A recent preprint of Eskandari constructs further explicit rational approximations satisfying $0 < \| G - p_m \/ q_m \| lt.eq q_m^(- 0.62)$ for all sufficiently large $m$ #cite(label("Eskandari2026Approximations")) Theorem 1.1. These are bounds for particular constructions, not irrationality measures. An error bound with exponent below $1$ does not by itself make the integer forms $q_m G - p_m$ tend to zero.

Results at other characters and other places give useful comparisons. Calegari, Dimitrov and Tang proved the $bb(Q)$-linear independence of $1$, $pi^2$ and $L \( 2 \, chi_(- 3) \)$ #cite(label("CalegariDimitrovTang2024")) Theorem A. Their character has conductor $3$, rather than the conductor $4$ of $G$. Their discussion of two Catalan approximation families again identifies the denominator cost as an obstruction for those constructions #cite(label("CalegariDimitrovTang2024")) Remark 11.1.17. Calegari proved irrationality of a $2$-adic analogue $G_2 in bb(Q)_2$ #cite(label("Calegari2005")) Theorem 4.2. As explained by Calegari, Dimitrov and Tang #cite(label("CalegariDimitrovTang2025")) Section 5.2, footnote 2, the related real identity contains an additional $pi^2$ term that is absent in the $2$-adic identity. This illustrates why the $2$-adic result does not settle the real problem. In our construction, cancellation of an additional $zeta \( 2 \)$ term is likewise essential, although the moment identities and the cancellation argument are proved directly below.

Sun #cite(label("Sun2026")) Theorem 1.1 has also announced a proof of the same qualitative irrationality statement. No result from that preprint is used here.

=== 1.2 The determinant strategy <the-determinant-strategy>

We construct determinants $Delta_N$ of size $n = 48 N$ whose entries combine moments of two elementary kernels. Each moment is a rational linear combination of $1$, $G$ and $zeta \( 2 \)$. The polynomial rows are chosen to have high Taylor contact: two prescribed expressions in the rows have identical initial Taylor coefficients. This agreement cancels the $zeta \( 2 \)$ term in every entry. Consequently, the single hypothesis $G in bb(Q)$ makes all the determinants rational.

For a nonzero rational number, its ordinary absolute value is determined by its prime valuations. Bounds on the denominators of $Delta_N$ therefore give a lower bound on $log \| Delta_N \|$. An integral formula for the same determinant gives an upper bound. The contradiction comes from making these bounds incompatible as the size grows. Zudilin’s determinantal criterion gives a useful precedent for this comparison #cite(label("Zudilin2017Determinantal")) Proposition 2 and Section 2. There, a positive moment representation produces Hankel determinants with squared-Vandermonde integrals. Positivity supplies nonvanishing, and the denominator and integral estimates are compared on the scale of the square of the matrix size. His discussion of Catalan’s constant explains why the denominator growth of the approximation family considered there still prevents application of the criterion #cite(label("Zudilin2017Determinantal")) Section 6. Our determinant is mixed and signed; its nonvanishing and its real-place estimate require separate arguments.

Three features of the construction make this comparison possible. First, integral Chebyshev rows provide both the Taylor contact and useful divisibility. At the large odd primes relevant to the leading bound, denominators of order $p^2$ and $p$ must both be controlled. The arithmetic estimate follows these two layers separately; cancellation at the first layer alone would not give the required denominator bound.

Second, nonvanishing is arithmetic. Under the hypothesis $G in bb(Q)$, when $N = p$ is itself a sufficiently large prime, Frobenius and a pair of polynomial bases reduce the growing matrix to three fixed rational matrices. An exact finite certificate proves their nonvanishing. The reduction then gives nonzero determinants along an unbounded prime sequence, without asserting positivity of the mixed determinant.

Third, the real estimate respects both branches of the rational parametrization used to construct the rows. A bounded holomorphic interpolant controls their mixed evaluations in one range of configurations; a Hadamard bound treats the complementary range. The interpolation estimate is uniform even when nodes approach one another. Its proof uses a finite-dimensional Hardy-space operator, so the evaluation determinant cancels algebraically rather than introducing an inverse-Vandermonde estimate. Andréief’s integration identity #cite(label("Forrester2018Andreief")), Cauchy’s double alternant #cite(label("Krattenthaler1999")), and the kernel/compression viewpoint of analytic interpolation #cite(label("Sarason1967")) supply the classical context; the specific estimates are proved below.

The resulting Vandermonde products have logarithmic interactions, as in logarithmic potential theory #cite(label("Saff2010")). A Chebyshev expansion of the logarithmic kernel #cite(label("GaroufalidisPopescu2013")) Lemma 3.1 reduces the estimate to quadratic sums and two one-variable functions in each case. We regularize their interactions together, control the omitted diagonals and endpoint terms, and only then take a supremum and pass to the limit. Explicit rational trial coefficients finish the argument. Their certificate exhausts all stationary points and bounds entire root brackets, rather than relying on a numerical search for the maxima.

For orientation, the two estimates are stated for the same normalized logarithm

#[#set math.equation(numbering: n => "(1)")
 $ cal(L)_N = frac(log \| Delta_N \|, \( 48 N \)^2) - 1 / 2 log 2 . $ <eq:normalized-logarithm>]

Under the rationality hypothesis, Proposition 7 gives $liminf cal(L)_N > - 2.29084$ along every sequence of nonzero determinants, and Proposition 8 supplies such a sequence with $N$ prime. Independently, Proposition 13 gives $limsup cal(L)_N lt.eq - 2.290939875 < - 2.2909$. These inequalities are incompatible. The argument proves qualitative irrationality; a bound for an irrationality measure would require additional control of rational approximations. Section 8 also deduces irrationality of the minimum volume of an orientable complete finite-volume hyperbolic three-manifold with exactly two cusps, and of certain arithmetic hyperbolic volumes.

=== 1.3 Organization and conventions <organization-and-conventions>

Section 2 constructs the rows and moments, proves cancellation and rationality, and gives the estimate at the prime $2$. Section 3 treats odd primes and derives the finite-place lower bound. Its only prime-distribution input is the ordinary prime number theorem; the weighted consequence needed here is proved locally. Section 4 establishes nonvanishing at prime scales. Sections 5 and 6 give the uniform real-place and energy estimates. Section 7 supplies the rational data certifying the real-place bound, and Section 8 assembles the contradiction.

All logarithms are natural. We use $v_p \( p \) = 1$ and $v_p \( 0 \) = + oo$; for real estimates we put $log 0 = - oo$. Constants in asymptotic estimates may depend on the fixed rational value hypothetically assigned to $G$, but never on $N$ or on the integration points. The finite certificates are specified by rational data and arithmetic instructions in the text; supplementary programs reproduce them.

== 2 Polynomial rows and mixed moments <sec:foundations>

We construct the determinant and prove that its entries are rational under $G in bb(Q)$. The row design serves two purposes: Taylor contact cancels $zeta \( 2 \)$, while integral Chebyshev coefficients permit the finite-prime estimates. After the moment calculations, we establish the estimate at $2$; odd primes are treated in the next Section.

For each positive integer $N$, set

#[#set math.equation(numbering: n => "(2)")
 $ n = 48 N \, #h(2em) a = 11 N \, #h(2em) b = 7 N \, #h(2em) q = g = 4 N \, #h(2em) h = 2 N \,\
L = n + a = n + b + q = 59 N \, #h(2em) C = L + g = 63 N \,\
H = C + h = 65 N \, #h(2em) A = a + 2 g = 19 N . $ <eq:parameters>]

Write $f \( t \) = sqrt(1 - t^2)$, with the positive branch on $\( - 1 \, 1 \)$, and $w = t \/ \( 1 + f \)$. Then

$ t = frac(2 w, 1 + w^2) \, #h(2em) f = frac(1 - w^2, 1 + w^2) . $

The involution denoted by a star sends $w$ to $w^(- 1)$, fixes $t$, and sends $f$ to $- f$. For $0 lt.eq r < n$, define

#[#set math.equation(numbering: n => "(3)")
 $ R_r = \( 1 - t \)^h t^(C - 1) w^(r - g) \, #h(2em) P_r = frac(R_r + R_r^(*), 2) \, #h(2em) D_r = frac(t \( R_r^(*) - R_r \), 2 f) . $ <eq:rows>]

Here and below identities involving $f$ near zero use its Taylor branch with $f \( 0 \) = 1$.

Let $T_d \, U_d$ be the Chebyshev polynomials, normalized by $T_0 = 1 \, T_1 = x \, U_(- 1) = 0 \, U_0 = 1$, and the recurrence $S_(d + 1) = 2 x S_d - S_(d - 1)$. The associated Laurent expressions are the standard formulas #cite(label("DLMFChebyshev")) Equations (18.5.1)–(18.5.2). Since $\( w + w^(- 1) \) \/ 2 = 1 \/ t$ and $\( w^(- 1) - w \) \/ 2 = f \/ t$, Equation (3) becomes, with $d = \| r - g \|$,

$ P_r = \( 1 - t \)^h t^(C - 1) T_d \( 1 \/ t \) \, #h(2em) D_r = "sgn" \( r - g \) \( 1 - t \)^h t^(C - 1) U_(d - 1) \( 1 \/ t \) . $

In particular these are integer polynomials; the second is zero when $r = g$. The inequality $d lt.eq n - 1 - g$ gives

#[#set math.equation(numbering: n => "(4)")
 $ "supp" P_r subset.eq { A \, dots.h \, H - 1 } \, #h(2em) "supp" D_r subset.eq { A + 1 \, dots.h \, H - 1 } . $ <eq:row-support>]

Moreover $w = t \/ 2 + O \( t^3 \)$, so that

#[#set math.equation(numbering: n => "(5)")
 $ frac(t P_r, f) - D_r = frac(t R_r, f) = O \( t^(C + r - g) \) = O \( t^L \) . $ <eq:contact>]

For nonnegative integers $i \, j$, define

#[#set math.equation(numbering: n => "(6)")
 $ M \( i \, j \) & = integral_(- 1)^1 integral_0^1 frac(\| t \|, f \( t \)) frac(t^i s^j, 1 - t s) thin d s thin d t \,\
Z \( i \, j \) & = integral_0^1 integral_0^1 frac(t^i s^j, 1 - t s) thin d s thin d t . $ <eq:mixed-moments>]

Extend these expressions bilinearly to polynomial arguments. The integrals converge absolutely. Indeed, for $0 < u < 1$,

$ integral_0^1 frac(d s, 1 - u s) = frac(- log \( 1 - u \), u) \, $

and $\( - log \( 1 - u \) \) \/ sqrt(1 - u^2)$ is integrable on $\( 0 \, 1 \)$. This dominates the absolute $M$ integrand after integration in $s$; the corresponding assertion for $Z$ is weaker. Bounded polynomial factors preserve this domination. It also justifies termwise integration of the geometric series used below.

For each raw column index $b lt.eq j < L$, let

$ F_j \( r \) = M \( P_r \, j \) - 3 / 2 Z \( D_r \, j \) #h(2em) \( 0 lt.eq r < n \) . $

The determinant used throughout the proof is

#[#set math.equation(numbering: n => "(7)")
 $ Delta_N = det_(0 lt.eq r \, k < n) (M #scale(x: 120%, y: 120%)[\(] P_r \, s^(b + k) \( 1 - s \)^q #scale(x: 120%, y: 120%)[\)] - 3 / 2 Z #scale(x: 120%, y: 120%)[\(] D_r \, s^(b + k) \( 1 - s \)^q #scale(x: 120%, y: 120%)[\)]) . $ <eq:determinant>]

Thus, if $cal(F)$ is the $n$ by $n + q$ matrix with columns $F_j$, the matrix in Equation (7) is $cal(F) cal(T)$, where the integer matrix $cal(T)$ has entries

#[#set math.equation(numbering: n => "(8)")
 $ cal(T)_(j \, k) = \( - 1 \)^(j - b - k) binom(q, j - b - k) \, #h(2em) b lt.eq j < L \, quad 0 lt.eq k < n . $ <eq:integer-filter>]

A binomial coefficient outside its usual range is zero. In particular, all raw columns required by the filter lie in the contact range $j < L$.

=== 2.1 Moment evaluation and cancellation <moment-evaluation-and-cancellation>

Set

#[#set math.equation(numbering: n => "(9)")
 $ c_l = 4^(- l) binom(2 l, l) quad \( l gt.eq 0 \) \, #h(2em) m_i = integral_(- 1)^1 t^i frac(\| t \|, f \( t \)) thin d t = cases(delim: "{", frac(2, \( i + 1 \) c_(i \/ 2)) \, & i gt.eq 0 upright(" even") \,, 0 \, & i gt.eq 0 upright(" odd") \,) $ <eq:moment-values>]

and use the convention $m_(- 1) = 0$. The moment formula follows from symmetry, $m_0 = 2$, and integration by parts, which gives $\( i + 1 \) m_i = i m_(i - 2)$ for $i gt.eq 1$. Throughout, $c_z$ means zero unless $z$ is a nonnegative integer. Termwise integration gives

#[#set math.equation(numbering: n => "(10)")
 $ M \( i \, j \) = sum_(u gt.eq 0) frac(m_(i + u), j + u + 1) \, #h(2em) M \( i \, j \) - M \( i + 1 \, j + 1 \) = frac(m_i, j + 1) . $ <eq:moment-series>]

Put $K_d^(-) = M \( d \, 0 \)$ and $K_d^(+) = M \( 0 \, d \)$. Their boundary recurrences are

#[#set math.equation(numbering: n => "(11)")
 $ d K_d^(-) & = \( d - 1 \) K_(d - 2)^(-) + m_(d - 2) + m_(d - 1) &  & \( d gt.eq 2 \) \,\
K_1^(-) & = 2 \,\
\( d - 1 \) K_d^(+) & = \( d - 2 \) K_(d - 2)^(+) + frac(2, d - 1) &  & \( d gt.eq 2 \) . $ <eq:boundary-recurrences>]

For the first recurrence, the moment recurrence gives the termwise identity

$ frac(d m_(d + u) - \( d - 1 \) m_(d + u - 2), u + 1) = m_(d + u - 2) - m_(d + u) . $

The right side telescopes, since $m_v arrow.r 0$ as $v arrow.r oo$. The same identity for $d = 1$, with the term multiplied by $d - 1$ omitted, gives $K_1^(-) = m_(- 1) + m_0 = 2$. For the last recurrence, shifting the first series by two leaves, for $u gt.eq 2$, the terms

$ frac(\( d - 1 \) m_(u - 2) - \( d - 2 \) m_u, d + u - 1) = m_(u - 2) - m_u . $

Their sum is $2$; the remaining boundary term is $- 2 \( d - 2 \) \/ \( d - 1 \)$, giving the claimed result.

The two independent starting values are

#[#set math.equation(numbering: n => "(12)")
 $ K_0^(-) = K_0^(+) = 4 G \, #h(2em) K_1^(+) = pi^2 / 4 = 3 / 2 zeta \( 2 \) . $ <eq:boundary-starts>]

To verify the first, integrate in $s$ and put $t = sin theta$ on the positive half interval. This gives

$ K_0^(-) = integral_0^(pi \/ 2) log frac(1 + sin theta, 1 - sin theta) thin d theta = - 4 integral_0^(pi \/ 4) log tan v thin d v = 4 G . $

The last equality follows on setting $x = tan v$ and integrating the geometric series for $\( 1 + x^2 \)^(- 1)$ against $- log x$. For the other start, Equation (10) and Equation (9) yield

$ K_1^(+) = sum_(k gt.eq 1) frac(1, 2 k^2 c_k) . $

The differential equation $\( 1 - x^2 \) y'' - x y' = 2$, with $y \( 0 \) = y' \( 0 \) = 0$, determines the Taylor series of $y = \( arcsin x \)^2$ as $sum_(k gt.eq 1) x^(2 k) \/ \( 2 k^2 c_k \)$. Its nonnegative coefficients allow passage to $x = 1$ by monotone convergence, giving $pi^2 \/ 4$. For completeness, integrating

$ sum_(k gt.eq 1) frac(rho^k sin \( k x \), k) = "Im" #scale(x: 120%, y: 120%)[\(] - log \( 1 - rho e^(i x) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 < rho < 1 \, $

over $0 < x < pi$ and letting $rho arrow.t 1$ gives $2 sum_(k upright(" odd")) k^(- 2) = pi^2 \/ 4$. Here the imaginary part is uniformly bounded and tends to $\( pi - x \) \/ 2$, so dominated convergence applies. The odd sum is $3 zeta \( 2 \) \/ 4$, establishing the final equality in Equation (12).

Define $M^0 \( i \, j \)$ by the rational recurrences (10)–(11), replacing only the starts $K_0^(-) = K_0^(+)$ and $K_1^(+)$ by zero. More explicitly, let $k_d^(-) \, k_d^(+)$ satisfy Equation (11) with

#[#set math.equation(numbering: n => "(13)")
 $ k_0^(-) = k_0^(+) = k_1^(+) = 0 \, #h(2em) k_1^(-) = 2 . $ <eq:rational-starts>]

Then the following formulas specify the whole array without ambiguity:

#[#set math.equation(numbering: n => "(14)")
 $ M^0 \( i \, j \) = cases(delim: "{", k_(i - j)^(-) - sum_(k = 1)^j m_(i - j + k - 1) / k \, & i gt.eq j \,, k_(j - i)^(+) - sum_(k = j - i + 1)^j m_(k - \( j - i \) - 1) / k \, & i < j .) $ <eq:diagonal-reduction>]

Empty sums are zero. We shall also use the algebraic convention

#[#set math.equation(numbering: n => "(15)")
 $ M^0 \( - 1 \, j \) = k_(j + 1)^(+) #h(2em) \( j gt.eq 0 \) \; $ <eq:negative-boundary>]

this does not define an additional integral. Let $B_i^(\( d \)) = sum_(k = 1)^i k^(- d)$, with $B_0^(\( d \)) = 0$, and put

#[#set math.equation(numbering: n => "(16)")
 $ Z^0 \( i \, j \) = cases(delim: "{", - B_i^(\( 2 \)) \, & i = j \,, frac(B_i^(\( 1 \)) - B_j^(\( 1 \)), i - j) \, & i eq.not j .) $ <eq:rational-z>]

The evaluations of the moments are

#[#set math.equation(numbering: n => "(17)")
 $ M \( i \, j \) & = M^0 \( i \, j \) + 4 G c_(\( i - j \) \/ 2) + 3 / 2 zeta \( 2 \) c_(\( j - i - 1 \) \/ 2) \,\
Z \( i \, j \) & = Z^0 \( i \, j \) + \[ i = j \] zeta \( 2 \) . $ <eq:rational-decomposition>]

Indeed, the homogeneous parts of the minus and plus boundary recurrences propagate the starts by precisely these two $c$-kernels. Diagonal reduction preserves both index differences. The formula for $Z$ follows from

$ Z \( i \, j \) = sum_(u gt.eq 0) frac(1, \( i + u + 1 \) \( j + u + 1 \)) $

by partial fractions when $i eq.not j$, and directly when $i = j$.

For later valuation calculations, it is useful to solve the rational boundary recurrences explicitly. Define

#[#set math.equation(numbering: n => "(18)")
 $ H_z^(*) = cases(delim: "{", c_(z \/ 2) \, & z gt.eq 0 upright(" even") \,, frac(1, z c_(\( z - 1 \) \/ 2)) \, & z gt.eq 1 upright(" odd") .) #h(2em) H_(z + 2)^(*) / H_z^(*) = frac(z + 1, z + 2) . $ <eq:h-star>]

Then

#[#set math.equation(numbering: n => "(19)")
 $ k_u^(-) & = cases(delim: "{", H_u^(*) sum_(1 lt.eq z lt.eq u\
z med upright("even")) frac(2, z^2 \( H_z^(*) \)^2) \, & u upright(" even") \,, H_u^(*) sum_(1 lt.eq z lt.eq u\
z med upright("odd")) 2 / z \, & u upright(" odd") \,)\
k_(u + 1)^(+) & = H_u^(*) sum_(1 lt.eq z lt.eq u\
z equiv u med \( 2 \)) frac(2, z^2 H_z^(*)) #h(2em) \( u gt.eq 0 \) . $ <eq:explicit-boundary-arrays>]

To see this, divide each recurrence by the appropriate $H^(*)$ and use the ratio in Equation (18). For the minus recurrence the inhomogeneous increment after division is $2 \/ \( z^2 \( H_z^(*) \)^2 \)$ when $z$ is even and $2 \/ z$ when $z$ is odd. The odd case starts with $k_1^(-) \/ H_1^(*) = 2$. For the plus recurrence the increment is $2 \/ \( z^2 H_z^(*) \)$, with initial values $k_1^(+) = 0$ and $k_2^(+) = 2$. This proves all the formulas, including their empty-sum cases.

#thm([Proposition 2.1.])[
  #emph[Each raw entry $F_j \( r \)$ lies in $bb(Q) + bb(Q) G$. Consequently, if $G in bb(Q)$, then $Delta_N in bb(Q)$ for every positive integer $N$.]
] <prop:rationality>

#proof[
  Since $f \( t \)^(- 1) = sum_(l gt.eq 0) c_l t^(2 l)$, the coefficient of $zeta \( 2 \)$ in $F_j \( r \)$ is
  $ 3 / 2 (sum_i \[ t^i \] P_r thin c_(\( j - i - 1 \) \/ 2) - \[ t^j \] D_r) = 3 / 2 \[ t^j \] (frac(t P_r, f) - D_r) = 0 $
  by Equation (5) and $j < L$. More explicitly,
  #[#set math.equation(numbering: n => "(20)")
   $ F_j \( r \) = sum_i \[ t^i \] P_r (M^0 \( i \, j \) + 4 G c_(\( i - j \) \/ 2)) - 3 / 2 sum_i \[ t^i \] D_r Z^0 \( i \, j \) . $ <eq:rational-raw-entry>]
  The assertion follows from the rational arrays and the integer filter. ◻
]

=== 2.2 A uniform estimate at the prime two <a-uniform-estimate-at-the-prime-two>

We normalize $v_p \( p \) = 1$ and set $v_p \( 0 \) = + oo$. In the rest of this section assume $G in bb(Q)$, viewed also in $bb(Q)_2$. Constants allowed to depend on this fixed rational number will carry a subscript $G$.

#thm([Proposition 2.2.])[
  #emph[With $delta = \( q + g + h \) \/ n = 5 \/ 24$, one has, for every positive integer $N$, 
#[#set math.equation(numbering: n => "(21)")
 $ v_2 \( Delta_N \) gt.eq - (delta / 2 + delta^2 / 8) n^2 - O_G #scale(x: 120%, y: 120%)[\(] n log \( n + 2 \) #scale(x: 120%, y: 120%)[\)] = - 505 / 4608 n^2 - O_G #scale(x: 120%, y: 120%)[\(] n log \( n + 2 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:two-adic-bound>]

 The same bound holds for every full minor of the raw column matrix.]
] <prop:two-adic>

#proof[
  We first construct a $2$-adic version of the geometric moment series:
  #[#set math.equation(numbering: n => "(22)")
   $ M_(upright(s)) \( i \, j \) = sum_(k gt.eq 0) frac(m_(i + k), j + k + 1) quad upright("in ") bb(Q)_2 . $ <eq:two-adic-smoothing>]
  For even $u$, the factorial formula implies
  $ v_2 \( m_u \) = 1 + u - v_2 binom(u, u \/ 2) gt.eq u + 1 - log_2 \( u + 1 \) . $
  The last bound follows, for example, by subtracting the factorial-floor formulas: each binary place contributes at most one to the binomial valuation. Odd moments are zero. If $0 lt.eq i \, j < H$, every nonzero term of Equation (22) therefore has valuation at least
  #[#set math.equation(numbering: n => "(23)")
   $ i + k + 1 - 2 log_2 \( H + k \) gt.eq i + 1 - 2 log_2 H + k - 2 log_2 \( k + 1 \) gt.eq i - 2 log_2 H - 1 . $ <eq:smoothing-tail-bound>]
  The middle expression tends to infinity with $k$. Thus the infinite tail converges, and the final bound is uniform over all its terms and over $0 lt.eq i \, j < H$. In particular $v_2 \( M_(upright(s)) \( i \, j \) \) gt.eq i - 2 log_2 H - 1$.
  The diagonal recurrence and both boundary recurrences hold for $M_(upright(s))$ as well. The same finite telescoping calculations prove this because their tails tend to zero $2$-adically. In particular its minus start at one is forced to be $2$. There are therefore exactly two homogeneous discrepancies between $M_(upright(s))$ and the rational part $M^0 \( i \, j \) + 4 G c_(\( i - j \) \/ 2)$. Write
  #[#set math.equation(numbering: n => "(24)")
   $ e_1 = 4 G - M_(upright(s)) \( 0 \, 0 \) \, #h(2em) e_2 = - M_(upright(s)) \( 0 \, 1 \) . $ <eq:two-adic-discrepancies>]
  These are fixed elements of $bb(Q)_2$, independent of $N$ and of all degree indices, and
  $ M^0 \( i \, j \) + 4 G c_(\( i - j \) \/ 2) = M_(upright(s)) \( i \, j \) + e_1 c_(\( i - j \) \/ 2) + e_2 c_(\( j - i - 1 \) \/ 2) . $
  Contracting the last kernel with $P_r$ and applying Equation (5) expresses each raw column as the sum of three column vectors:
  #[#set math.equation(numbering: n => "(25)")
   $ F_j \( r \) & = S_j \( r \) + E_j \( r \) + B_j \( r \) \,\
S_j \( r \) & = M_(upright(s)) \( P_r \, j \) \,\
E_j \( r \) & = e_1 sum_i \[ t^i \] P_r thin c_(\( i - j \) \/ 2) \,\
B_j \( r \) & = sum_i \[ t^i \] D_r (e_2 \[ i = j \] - 3 / 2 Z^0 \( i \, j \)) . $ <eq:two-adic-column-types>]
  If either discrepancy is zero, the corresponding summands vanish; there is no need to assign a finite valuation to a zero constant.
  Here are the coefficient and denominator bounds needed for these columns. Remove the factor $\( 1 - t \)^h$ and write the resulting polynomials as
  #[#set math.equation(numbering: n => "(26)")
   $ frac(P_r \( t \), \( 1 - t \)^h) = sum_(u gt.eq 0) p_(r \, u) t^(C - 1 - u) \, #h(2em) frac(D_r \( t \), \( 1 - t \)^h) = sum_(u gt.eq 0) d_(r \, u) t^(C - 1 - u) . $ <eq:unconvolved-coefficients>]
  All sums here are finite. Induction in the Chebyshev recurrence shows that the coefficient of $x^u$ in $T_d$ has valuation at least $u - 1$ and that in $U_d$ has valuation at least $u$; the assertion at $u = 0$ uses only integrality. Hence
  #[#set math.equation(numbering: n => "(27)")
   $ v_2 \( p_(r \, u) \) gt.eq u - 1 \, #h(2em) v_2 \( d_(r \, u) \) gt.eq u - 1 . $ <eq:coefficient-valuation>]
  Convolution with $\( 1 - t \)^h$ uses integer coefficients. Combining Equations (23) and (27), every entry of $S_j$ has valuation at least $C - 2 log_2 H - 3$.
  Set $L_2 = floor.l log_2 H floor.r$. Equation (16) gives
  #[#set math.equation(numbering: n => "(28)")
   $ v_2 \( Z^0 \( i \, j \) \) gt.eq - 2 L_2 #h(2em) \( 0 lt.eq i \, j < H \) . $ <eq:harmonic-two-adic>]
  Indeed, the harmonic sum of order $d$ has valuation at least $- d L_2$; when $i eq.not j$, division by $i - j$ loses at most another $L_2$. The ultrametric inequality introduces no loss for the number of terms in these sums or in polynomial convolutions.
  Choose a fixed nonnegative integer $K_G$ with $v_2 \( e_1 \) \, v_2 \( e_2 \) gt.eq - K_G$. Let $upright(bold(p))_u = \( p_(r \, u) \)_r$ and $upright(bold(d))_u = \( d_(r \, u) \)_r$. The exceptional columns in Equation (25) have expansions
  $ E_j = sum_u upright(bold(p))_u thin a_(u \, j) \, #h(2em) B_j = sum_u upright(bold(d))_u thin b_(u \, j) \, $
  where
  $ a_(u \, j) & = e_1 sum_(v = 0)^h \( - 1 \)^v binom(h, v) c_(\( C - 1 - u + v - j \) \/ 2) \,\
b_(u \, j) & = sum_(v = 0)^h \( - 1 \)^v binom(h, v) (e_2 \[ C - 1 - u + v = j \] - 3 / 2 Z^0 \( C - 1 - u + v \, j \)) . $
  Only $u$ with a nonzero coefficient vector need be included, so all moment indices in these expressions are between $0$ and $H - 1$. Since $v_2 \( c_l \) gt.eq - 2 l$, every contributing summand yields
  #[#set math.equation(numbering: n => "(29)")
   $ v_2 \( a_(u \, j) \) gt.eq u + j - H + 1 - K_G \, #h(2em) v_2 \( b_(u \, j) \) gt.eq - 2 L_2 - 1 - K_G . $ <eq:exceptional-scalar-bounds>]
  We now apply the bounds in the order needed to preserve alternation. First expand $det \( cal(F) cal(T) \)$ by Cauchy–Binet. Each term is an integer times a full raw minor, whose column indices $j_1 \, dots.h \, j_n$ are distinct. Fix such a minor, expand each column by Equation (25), and consider a term containing $m$ columns of type $E$, $l$ of type $B$, and $n - m - l$ columns of type $S$.
  Expand the $E$ columns through the fixed vectors $upright(bold(p))_u$ and the $B$ columns through the fixed vectors $upright(bold(d))_u$. Repeated indices within the first group give equal coefficient vectors and hence zero determinants; the same holds within the second group. No distinctness between the two groups is asserted or needed. For nonzero terms we therefore have
  $ sum_(E upright(" columns")) u gt.eq frac(m \( m - 1 \), 2) \, #h(2em) sum_(B upright(" columns")) u gt.eq frac(l \( l - 1 \), 2) . $
  The already fixed, distinct raw column indices also give
  $ sum_(E upright(" columns")) j gt.eq m b + frac(m \( m - 1 \), 2) . $
  Equations (27) and (29) show that the first group contributes at least $2 sum u + sum j - H m - K_G m$. The second contributes at least $sum u - O_G \( l log \( H + 2 \) \)$; the smoothed columns contribute at least $C \( n - m - l \) - O \( \( n - m - l \) log \( H + 2 \) \)$. Thus every term, every raw minor, and finally the filtered determinant satisfies
  #[#set math.equation(numbering: n => "(30)")
   $ v_2 \( Delta_N \) gt.eq  & - O_G \( n log \( n + 2 \) \)\
 & + min_(m \, l gt.eq 0\
m + l lt.eq n) {- \( H - b \) m + 3 / 2 m^2 + 1 / 2 l^2 + C \( n - m - l \)} . $ <eq:two-adic-quadratic>]
  Finite summation causes no further loss in valuation.
  For completeness minimize over real $m \, l$; this can only lower the minimum over integer choices. Since $C gt.eq n$, the expression decreases as $l$ increases up to $n - m$, so its minimum occurs at $l = n - m$. Using $H - b = n \( 1 + delta \)$, the remaining expression is
  $ n^2 / 2 - \( 2 + delta \) n m + 2 m^2 = 2 (m - frac(\( 2 + delta \) n, 4))^2 - (delta / 2 + delta^2 / 8) n^2 . $
  This proves Equation (21) and the stated bound for each raw minor. ◻
]

== 3 Odd primes and the finite-place lower bound <sec:odd-primes>

Throughout this section assume that $G in bb(Q)$, so that the columns $F_j$ of Section 2 are rational. We regard each $F_j$ as a column in $bb(Q)^n$. For an odd prime $p$, reduction modulo $p$ always means reduction of a member of $bb(Z)_p$; in particular, every congruence below includes the assertion that its two sides are locally integral.

The raw matrix has $n + q$ columns, whereas the filtered determinant has size $n$. At the large primes treated first, each raw column has at most two powers of $p$ in its denominator. We shall make invertible column changes over $bb(Z)_p$ and bound how many columns can still have denominator $p^2$ or $p$. Such bounds control every full minor of the raw matrix, and Cauchy–Binet then transfers them to the integer column filter. The first reduction identifies residues after multiplication by $p^2$; for $p > H \/ 2$ a second reduction identifies the remaining residues after multiplication by $p$.

=== 3.1 Digit reduction of the rational moments <digit-reduction-of-the-rational-moments>

We first prove the reductions needed at primes

$ 2 sqrt(H) < p lt.eq H . $

We may suppose that $p$ does not divide the denominator of $G$: as $N$ tends to infinity, every fixed denominator prime eventually lies below $2 sqrt(H)$. Put

$ E \( t \) = \( 1 - t^2 \)^(\( p - 1 \) \/ 2) = sum_(d = 0)^(p - 1) E_d t^d quad upright("in ") bb(F)_p \[ t \] \, #h(2em) epsilon.alt = \( - 1 \)^(\( p - 1 \) \/ 2) . $

We set $E_d = 0$ outside $0 lt.eq d < p$. Within this range,

$ E_d = cases(delim: "{", c_(d \/ 2) med \( mod med p \) \, & d upright(" even") \,, 0 \, & d upright(" odd") \,) #h(2em) E_(p - 1 - d) = epsilon.alt E_d . $

The first identity follows from $\( - 1 \)^k binom(\( p - 1 \) \/ 2, k) equiv 4^(- k) binom(2 k, k)$; the second follows by reversing the coefficients of $E$.

#thm([Lemma 3.1.])[
  (Digit reductions).  #emph[For $0 lt.eq i \, j < H$, let 
$ ell = j med mod med p \, quad d = \( j - i - 1 \) med mod med p \, #h(2em) i' = frac(i + 1 + d - ell, p) - 1 \, quad j' = ⌊j / p⌋ \, #h(2em) 0 lt.eq ell \, d < p . $

 Then $i' gt.eq - 1$, and, with the convention $M^0 \( - 1 \, j' \) = k_(j' + 1)^(+)$, 
#[#set math.equation(numbering: n => "(31)")
 $ p^2 M^0 \( i \, j \) & equiv E_d M^0 \( i' \, j' \) med \( mod med p \) \,\
p^2 Z^0 \( i \, j \) & equiv cases(delim: "{", Z^0 \( floor.l i \/ p floor.r \, j' \) \, & i equiv j med \( mod med p \) \,, 0 \, & i equiv.not j med \( mod med p \) .) $ <eq:digit-layers>]

]
] <lem:odd-digit-reductions>

#proof[
  We first give the parity and carry calculation for the factors $H_z^(*)$ in the explicit formulas of Section 2. Write $z = P p + r$, $0 lt.eq r < p$, $0 lt.eq z < H$. Since $H < p^2 \/ 4$, all factors at the reduced indices $P$ are $p$-adic units. If $z$ is even, then
  #[#set math.equation(numbering: n => "(32)")
   $ cases(delim: "{", H_z^(*) equiv H_P^(*) c_(r \/ 2) med \( mod med p \) \, & r upright(" even") \,, v_p \( H_z^(*) \) = 1 \, & r upright(" odd") .) $ <eq:odd-even-H>]
  Indeed, when $r$ is even, $P$ is even and the base-$p$ digits of $z \/ 2$ are $P \/ 2 \, r \/ 2$. Expanding $\( 1 + x \)^z$ modulo $p$ by $\( 1 + x \)^p = 1 + x^p$ gives the first assertion, including the factor $4^(- z \/ 2)$. When $r$ is odd, $P$ is odd and the low digit of $z \/ 2$ is $\( p + r \) \/ 2$. The factorial formula for $binom(z, z \/ 2)$ has exactly one carry:
  $ ⌊z / p⌋ - 2 ⌊frac(z \/ 2, p)⌋ = 1 \, $
  and there is no contribution from $p^2$. Thus, for positive even $z$, $v_p \( z H_z^(*) \)$ is either zero or one. It is one precisely when $r = 0$ or $r$ is odd.
  For odd $z$ one has
  #[#set math.equation(numbering: n => "(33)")
   $ 1 / H_z^(*) in bb(Z)_p \, #h(2em) p H_z^(*) equiv cases(delim: "{", epsilon.alt c_(r \/ 2) H_P^(*) \, & r upright(" even") \,, 0 \, & r upright(" odd") .) $ <eq:odd-odd-H>]
  If $r$ is odd, both $z$ and $c_(\( z - 1 \) \/ 2)$ are units by the same digit calculation. If $r$ is even, $P$ is odd. At $z = P p$, digit expansion gives
  $ c_(\( P p - 1 \) \/ 2) equiv c_(\( P - 1 \) \/ 2) c_(\( p - 1 \) \/ 2) = epsilon.alt c_(\( P - 1 \) \/ 2) \, #h(2em) p H_(P p)^(*) equiv epsilon.alt H_P^(*) . $
  The recurrence $H_(z + 2)^(*) \/ H_z^(*) = \( z + 1 \) \/ \( z + 2 \)$, applied through $r = 0 \, 2 \, dots.h \, p - 1$, now proves the nonzero case of Equation (33). Its denominators on this interval are units. Since $m_(z - 1) = 2 H_z^(*)$ for odd $z$ and is zero for even $z$, these formulas imply
  #[#set math.equation(numbering: n => "(34)")
   $ p m_(z - 1) equiv E_(p - 1 - r) m_(P - 1) med \( mod med p \) . $ <eq:odd-moment-digit>]
  This includes $z = 0$, using $m_(- 1) = 0$.
  We next reduce the two starting arrays. For $u = P p + r$, $0 lt.eq u < H$, we claim
  #[#set math.equation(numbering: n => "(35)")
   $ p^2 k_u^(-) equiv E_(p - 1 - r) k_P^(-) \, #h(2em) p^2 k_(u + 1)^(+) equiv E_r k_(P + 1)^(+) med \( mod med p \) . $ <eq:odd-starting-digits>]
  For odd $u$, write the first formula as
  $ p^2 k_u^(-) = \( p H_u^(*) \) sum_(1 lt.eq z lt.eq u\
z upright(" odd")) frac(2 p, z) . $
  Only $z = m p$, with $m$ odd, survives in the sum. If $r$ is odd the first factor vanishes modulo $p$. If $r$ is even, $P$ is odd and Equation (33) gives $epsilon.alt E_r H_P^(*) sum_(m lt.eq P \, med m upright(" odd")) 2 \/ m = E_(p - 1 - r) k_P^(-)$, as required.
  For even $u$ the quantities $p \/ \( z H_z^(*) \)$, for positive even $z lt.eq u$, are integral. Thus
  $ p^2 k_u^(-) = H_u^(*) sum_(1 lt.eq z lt.eq u\
z upright(" even")) 2 (frac(p, z H_z^(*)))^2 $
  is integral, and is zero modulo $p$ when $r$ is odd. If $r$ is even, then $P$ is even. The nonzero summands form precisely the complete blocks
  $ z = m p - lambda \, #h(2em) m = 2 \, 4 \, dots.h \, P \, #h(2em) lambda = 0 \, 2 \, dots.h \, p - 1 . $
  To see completeness, the indices with $z med mod med p$ odd lie immediately below an even multiple $m p$, while that multiple supplies $lambda = 0$. The upper limit $u = P p + r$ contains the whole block ending at $P p$, and the next such block begins at $\( P + 1 \) p + 1 > u$. No partial block is present. The recurrence, started at $m p$ and followed downwards, gives
  $ frac(p, \( m p - lambda \) H_(m p - lambda)^(*)) equiv frac(c_(lambda \/ 2), m H_m^(*)) med \( mod med p \) . $
  For example, each downward step from $z$ to $z - 2$ multiplies this quantity by $\( z - 1 \) \/ \( z - 2 \)$; these multipliers give successively $\( 2 j - 1 \) \/ \( 2 j \)$ modulo $p$. Finally, with $s = \( p - 1 \) \/ 2$,
  $ sum_(j = 0)^s c_j^2 equiv sum_(j = 0)^s binom(s, j)^2 = binom(2 s, s) equiv \( - 1 \)^s = epsilon.alt med \( mod med p \) . $
  The equality is the coefficient identity obtained from $\( 1 + x \)^s \( 1 + x \)^s$. Multiplying the block sums by $H_u^(*) equiv E_r H_P^(*)$ proves the first congruence of Equation (35) also for even $u$.
  For the second congruence, suppose first that $u$ is even. In
  $ p^2 k_(u + 1)^(+) = H_u^(*) sum_(1 lt.eq z lt.eq u\
z equiv u med \( 2 \)) frac(2 p^2, z^2 H_z^(*)) \, $
  every term with $p divides.not z$ vanishes modulo $p$, because $v_p \( H_z^(*) \) lt.eq 1$. At $z = m p$, necessarily $m$ is even and $H_(m p)^(*) equiv H_m^(*)$. The result is $E_r k_(P + 1)^(+)$ when $r$ is even, and zero when $r$ is odd. For odd $u$ instead write the expression as
  $ \( p H_u^(*) \) sum_(1 lt.eq z lt.eq u\
z upright(" odd")) frac(2 p, z^2 H_z^(*)) . $
  The reciprocal $1 \/ H_z^(*)$ is integral. Again only multiples $z = m p$ can survive; there $p H_(m p)^(*) equiv epsilon.alt H_m^(*)$, and the two factors of $epsilon.alt$ cancel. If $r$ is odd the prefactor is zero. This proves the second congruence in every case and also proves the local integrality asserted in Equation (35).
  If $i gt.eq j$, put $u = i - j = P p + r$. Then $d = p - 1 - r$ and $i' = j' + P$. The diagonal reduction is
  $ M^0 \( i \, j \) = k_u^(-) - sum_(k = 1)^j m_(u + k - 1) / k . $
  After multiplication by $p^2$, terms with $p divides.not k$ vanish by Equation (34). At $k = m p$ the surviving term is $E_(p - 1 - r) m_(P + m - 1) \/ m$. The first starting congruence therefore gives
  $ p^2 M^0 \( i \, j \) equiv E_(p - 1 - r) (k_P^(-) - sum_(m = 1)^(j') m_(P + m - 1) / m) = E_d M^0 \( i' \, j' \) . $
  If $i < j$, put $u = j - i - 1 = P p + r$, so $d = r$ and $i' = j' - P - 1$. Now
  $ M^0 \( i \, j \) = k_(u + 1)^(+) - sum_(k = u + 2)^j m_(k - u - 2) / k . $
  For a multiple $k = m p$ in the sum,
  $ k - u - 1 = \( m - P - 1 \) p + \( p - 1 - r \) . $
  Equation (34) gives the reduced summand $E_r m_(m - P - 2) \/ m$. A possible first multiple with $m = P + 1$ contributes zero, since its reduced moment is $m_(- 1)$. Thus the reduced sum is over $m = P + 2 \, dots.h \, j'$, as in the formula for $M^0 \( i' \, j' \)$. The expression for $i'$ is also $i' = floor.l \( i - ell \) \/ p floor.r$, so $i' gt.eq - 1$. When $i' = - 1$, $j' = P$, the sum is empty and the starting term is exactly $k_(j' + 1)^(+) = M^0 \( - 1 \, j' \)$. This proves the first assertion of Equation (31), including its boundary convention. The reduced array indices are less than $H \/ p < p \/ 4$; even the boundary index $j' + 1$ is less than $p$. Thus the explicit rational formulas show that all quantities on its right side are integral at $p$.
  For $Z^0$, write $I = floor.l i \/ p floor.r$ and $J = floor.l j \/ p floor.r$. Because $i \, j < p^2$, the harmonic sums satisfy
  $ p B_i^(\( 1 \)) equiv B_I^(\( 1 \)) \, #h(2em) p^2 B_i^(\( 2 \)) equiv B_I^(\( 2 \)) med \( mod med p \) . $
  The diagonal formula follows at once. Off the diagonal, if $i equiv.not j med \( mod med p \)$, the denominator $i - j$ is a unit and $p^2 Z^0 \( i \, j \)$ is zero modulo $p$. If the residues agree, $i - j = p \( I - J \)$ with $I - J$ a unit; substituting the first harmonic congruence gives $Z^0 \( I \, J \)$. This also proves integrality of $p^2 Z^0 \( i \, j \)$. ◻
]

=== 3.2 The leading layer and paired raw columns <the-leading-layer-and-paired-raw-columns>

We now gather the moment reductions into column vectors. This will identify pairs of raw columns whose sum has at most one power of $p$ in its denominator. For a fixed residue $0 lt.eq ell < p$, define column vectors over $bb(F)_p$ by

$ P'_u = \[ t^(\( u + 1 \) p + ell) \] thin t P \( t \) E \( t \) quad \( u gt.eq - 1 \) \, #h(2em) D'_u = \[ t^(u p + ell) \] thin D \( t \) quad \( u gt.eq 0 \) . $

Here $P \, D$ denote the vectors of all row polynomials; the dependence of these extracted vectors on $ell$ is understood. Their supports are finite. Lemma 4, gathered by coefficient residue, gives

#[#set math.equation(numbering: n => "(36)")
 $ X_(k p + ell) := p^2 F_(k p + ell) med mod med p = sum_(u gt.eq - 1) P'_u M^0 \( u \, k \) - 3 / 2 sum_(u gt.eq 0) D'_u Z^0 \( u \, k \) . $ <eq:column-layer>]

For a term $\[ t^i \] P$, its unique residue $d$ satisfies $i + 1 + d = \( i' + 1 \) p + ell$, so that it contributes exactly to $P'_(i')$, including $i' = - 1$. The $Z^0$ reduction survives only when $i = u p + ell$, which is precisely the extraction defining $D'_u$. The coefficient of $G$ in $F_j$ is a sum of integral multiples of $c_(\( i - j \) \/ 2)$. These coefficients are integral at every odd prime, so this term disappears after multiplication by $p^2$. Every raw column therefore lies in $p^(- 2) bb(Z)_p^n$.

If $ell gt.eq H - 2 p$, the degree bounds $deg \( t P E \) lt.eq H + p - 1$ and $deg D < H$ show that $P'_u \, D'_u$ vanish for $u > 1$. Put

$ V_ell = 2 P'_1 - 3 / 2 D'_1 \, #h(2em) U_ell = 2 P'_(- 1) - 3 / 2 D'_0 . $

The needed small values of the reduced arrays are

$ u & - 1 & 0 & 1\
M^0 \( u \, 0 \) & 0 & 0 & 2\
M^0 \( u \, 1 \) & 2 & 0 & - 2 #h(2em) u & 0 & 1\
Z^0 \( u \, 0 \) & 0 & 1\
Z^0 \( u \, 1 \) & 1 & - 1 . $

Consequently, whenever the indicated columns exist,

#[#set math.equation(numbering: n => "(37)")
 $ X_ell = V_ell \, #h(2em) X_(p + ell) = U_ell - V_ell . $ <eq:odd-paired-layer>]

Since $t P$ and $D$ have no terms below degree $A + 1$, $U_ell = 0$ for $ell lt.eq A$.

We record explicitly how changes in the full column pool will be used. Let $T$ be the $n$ by $\( n + q \)$ matrix of all raw columns. If $Q in "GL"_(n + q) \( bb(Z)_p \)$ and every full minor of $T Q$ has valuation at least $- D$, the same holds for every full minor of $T = \( T Q \) Q^(- 1)$ by Cauchy–Binet. The coefficients in this expansion are minors of the integral matrix $Q^(- 1)$. Applying Cauchy–Binet once more to the integer matrix defining the prescribed filter gives $v_p \( Delta_N \) gt.eq - D$. This transfer applies even when the columns or their leading residues are linearly dependent.

For $2 sqrt(H) < p lt.eq H \/ 2$, use each pair of columns with

$ max \( b \, H - 2 p \) lt.eq ell < min \( p \, L - p \, A \) . $

Their number is exactly

$ d_0 = #scale(x: 120%, y: 120%)[\(] min \( p \, L - p \, A \) - max \( b \, H - 2 p \) #scale(x: 120%, y: 120%)[\)]_(+) \, #h(2em) y_(+) = max \( y \, 0 \) . $

Replacing its high column by the sum of the pair is an integral elementary column operation with integral inverse. The pair sum lies in $p^(- 1) bb(Z)_p^n$ by Equation (37); all other columns still lie in $p^(- 2) bb(Z)_p^n$. These pairs are disjoint, since $ell < p$. Any selection of $n$ columns from the pool of $n + q$ contains at least $\( d_0 - q \)_(+)$ of the improved columns. The transfer just explained gives

#[#set math.equation(numbering: n => "(38)")
 $ v_p \( Delta_N \) gt.eq - 2 n + \( d_0 - q \)_(+) . $ <eq:odd-lower-pair-range>]

=== 3.3 The central layer and integral column elimination <the-central-layer-and-integral-column-elimination>

For $p > H \/ 2$, the next lemma identifies the residues of central columns after multiplication by $p$. It expresses them in terms of the same vectors $V_ell$ that occur in the leading residues of noncentral columns. The elimination proof will retain noncentral columns and use $p$ times those columns to cancel the corresponding $V_ell$ terms.

#thm([Lemma 3.2.])[
  (Central layer).  #emph[Suppose $H \/ 2 < p lt.eq H$, and write $K = L - p$ and $J = H - p$. For every central column, by which we mean 
$ b lt.eq j < min \( p \, L \) \, #h(2em) j gt.eq J \, $

 one has 
#[#set math.equation(numbering: n => "(39)")
 $ p F_j in bb(Z)_p^n \, #h(2em) p F_j equiv - sum_(0 lt.eq ell < J) frac(V_ell, j - ell) med \( mod med p \) . $ <eq:central-layer>]

 All denominators $j - ell$ occurring here are units at $p$.]
] <lem:odd-central-layer>

#proof[
  For every contributing row degree $0 lt.eq i < H$, $i - j lt.eq H - 1 - J = p - 1$ and $j - i < p$. Hence $\| i - j \| < p$, and the starting value $k_(i - j)^(-)$ or $k_(j - i)^(+)$ in the diagonal reduction is integral at $p$. In either case that reduction can be written as the starting value minus
  $ sum_(0 lt.eq ell < min \( i \, j \)) frac(m_(i - ell - 1), j - ell) . $
  Here $1 lt.eq j - ell < p$. By Equation (34), a nonzero reduction after multiplication by $p$ requires $p lt.eq i - ell < 2 p$, and then
  $ p m_(i - ell - 1) equiv 2 E_(2 p + ell - 1 - i) . $
  Such an index necessarily has $0 lt.eq ell < J$. Conversely its coefficient can be collected over all $i$ with no truncation, since $j gt.eq J > ell$ and $i gt.eq p + ell > ell$. Thus
  $ p M^0 \( P \, j \) equiv - sum_(0 lt.eq ell < J) frac(2 P'_1, j - ell) . $
  The extracted vector $P'_1$ in each summand is the one belonging to that residue $ell$. For $Z^0 \( i \, j \)$, the harmonic sums have a pole only if $i = p + ell$ with $0 lt.eq ell < J$. The denominator $i - j$ is then a unit: equality modulo $p$ would require $j = ell < J$. Therefore
  $ p Z^0 \( p + ell \, j \) equiv frac(1, ell - j) . $
  All other $Z^0 \( i \, j \)$ are integral. Combining these two calculations with the factor $- 3 \/ 2$ proves Equation (39); the $G$ term is integral here as before. ◻
]

We now carry out these cancellations in the full column pool. In the resulting pool, $R$ will count the retained columns with possible denominator $p^2$, and $S$ will bound the number of other columns with possible denominator $p$; every remaining column will be integral. The proof first uses the $V_ell$ supplied by retained noncentral columns to modify the central columns. We then use the rank of their remaining scaled residues to bound the number of central columns that can still have denominator $p$ after an invertible column change.

#thm([Lemma 3.3.])[
  (Elimination over the local integers).  #emph[For $H \/ 2 < p lt.eq H$, define 
$ R & = K_(+) + \( K - A \)_(+) + \( J - max \( b \, K \) \)_(+) \,\
S & = \( min \( A \, K \) - b \)_(+) + \( min \( b \, J \) - max \( 0 \, K \) \)_(+) . $

 Then every full raw minor, and hence the filtered determinant, satisfies 
#[#set math.equation(numbering: n => "(40)")
 $ v_p \( Delta_N \) gt.eq - min \( 2 n \, n + R \, 2 R + S \) . $ <eq:odd-two-layer-bound>]

]
] <lem:odd-local-elimination>

#proof[
  The noncentral columns are precisely the high columns $F_(p + ell)$ for $0 lt.eq ell < K$ and the low columns $F_ell$ for $b lt.eq ell < J$. Empty ranges are allowed. Indeed $p > b$, $J < p$, and $K < J$. For
  $ b lt.eq ell < min \( A \, K \) $
  retain the low column and replace the high column by $F_(p + ell) + F_ell$. Let
  $ B = \( min \( A \, K \) - b \)_(+) $
  be the number of these pair sums. Each lies in $p^(- 1) bb(Z)_p^n$. Retain every other noncentral column as a column in $p^(- 2) bb(Z)_p^n$, whether or not its leading residue depends on the others. The number of columns so retained is
  #[#set math.equation(numbering: n => "(41)")
   $ R_0 = K_(+) + \( J - b \)_(+) - B . $ <eq:odd-retained-count>]
  It equals the stated $R$. To verify the identity, split $K$ into $K lt.eq 0$, $0 < K lt.eq b$, $b < K lt.eq A$, and $K > A$; use $K < J$ in the last two cases. The resulting formulas are respectively $\( J - b \)_(+)$, $K + \( J - b \)_(+)$, $J$, and $K + J - A$.
  These retained columns furnish a representative of every vector $V_ell$ with $0 lt.eq ell < J$ except possibly those in
  $ cal(E) = { ell : max \( 0 \, K \) lt.eq ell < min \( b \, J \) } . $
  For $b lt.eq ell < J$, the retained low column has leading residue $p^2 F_ell equiv V_ell$. For $0 lt.eq ell < min \( b \, K \)$, the unpaired high column has leading residue $- V_ell$, because $ell < b < A$ makes $U_ell = 0$. These two ranges exhaust the complement of $cal(E)$. Denote the size of $cal(E)$ by
  $ e = \| cal(E) \| = \( min \( b \, J \) - max \( 0 \, K \) \)_(+) . $
  For each represented residue choose a retained column $Y_ell$ and a sign $sigma_ell in { 1 \, - 1 }$ such that $p^2 Y_ell equiv sigma_ell V_ell$. For every central $j$, choose $a_(ell j) in bb(Z)_p$ reducing to $sigma_ell \/ \( j - ell \)$ and replace that column by
  $ C_j = F_j + p sum_(0 lt.eq ell < J\
ell in.not cal(E)) a_(ell j) Y_ell . $
  This is a shear of the whole column pool with integral coefficients and inverse obtained by changing the signs of the added coefficients. It preserves every retained column and every pair sum. The resulting central columns lie in $p^(- 1) bb(Z)_p^n$ and satisfy
  $ p C_j equiv - sum_(ell in cal(E)) frac(V_ell, j - ell) med \( mod med p \) . $
  This step does not require any information about the next coefficient of $Y_ell$. Explicitly, if $Y_ell = p^(- 2) y_0 + p^(- 1) y_1 + y_2$ with integral lifts $y_0 \, y_1 \, y_2$, then $p Y_ell = p^(- 1) y_0 + y_1 + p y_2$; its unknown second coefficient is already integral.
  Let $c$ be the number of central columns. Their scaled residues define a linear map
  $ phi : bb(F)_p^c arrow.r bb(F)_p^n \, #h(2em) \( a_j \)_j mapsto sum_j a_j \( p C_j med mod med p \) . $
  Its image is contained in the span of the $e$ exceptional vectors, so $d := "rank" phi lt.eq min \( c \, e \)$. Choose a basis of $bb(F)_p^c$ whose last $c - d$ vectors form a basis of $ker phi$. Lift its basis matrix arbitrarily to a matrix $W in "Mat"_c \( bb(Z)_p \)$. Its determinant is a unit, so $W in "GL"_c \( bb(Z)_p \)$ and the adjugate formula gives $W^(- 1) in "Mat"_c \( bb(Z)_p \)$. Applying this change to the central columns leaves at most $d$ columns in $p^(- 1) bb(Z)_p^n$; the other $c - d$ are integral, because their scaled residues vanish and they already belonged to $p^(- 1) bb(Z)_p^n$. If $c = 0$ this step is the empty identity.
  The resulting full pool consequently contains $R$ columns with possible denominator $p^2$, at most $B + d lt.eq B + e = S$ other columns with possible denominator $p$, and integral remaining columns. No noncentral column was discarded, nor was its denominator reduced on the strength of a leading linear dependence. In a full minor, if $r$ columns come from the first group and $s$ from the second, the loss is at most $2 r + s$. The inequalities
  $ 2 r + s lt.eq 2 n \, #h(2em) 2 r + s lt.eq n + R \, #h(2em) 2 r + s lt.eq 2 R + S $
  hold since $r + s lt.eq n$, $r lt.eq R$, and $s lt.eq S$. All changes used above and their inverses are integral, so the Cauchy–Binet transfer proves Equation (40) for all original full minors and for $Delta_N$. ◻
]

The omission of the optional pair at $ell = A$ is harmless: its physical column is included in $R$. The preceding proof also covers $K lt.eq 0$ and $J lt.eq b$. In particular, if $L lt.eq p lt.eq H$, there are no high or low noncentral columns, $R = 0$, and $S = H - p$; all raw columns are central. At the formal endpoint $p = H$, all of them are integral.

=== 3.4 Summing the prime losses <summing-the-prime-losses>

For a nonzero rational determinant, the valuations weighted by $log p$ sum to its ordinary logarithmic absolute value. We now combine the odd-prime estimates with the bound at $2$ to obtain the lower bound used in the final comparison.

#thm([Proposition 3.4.])[
  (Finite-place bound).  #emph[Assume $G in bb(Q)$. Along any sequence of positive integers $N arrow.r oo$ for which $Delta_N eq.not 0$, one has 
#[#set math.equation(numbering: n => "(42)")
 $ liminf_(N arrow.r oo) (frac(log \| Delta_N \|, n^2) - 1 / 2 log 2) gt.eq - 8609 / 4608 - (1 / 2 + 505 / 4608) log 2 > - 2.29084 . $ <eq:finite-lower-final>]

]
] <prop:finite-lower>

#proof[
  We first compute the complete loss function. Put $x = p \/ N$. For $x lt.eq 65 \/ 2$, Equation (38) has
  $ d_0 / N = #scale(x: 120%, y: 120%)[\(] min \( x \, 59 - x \, 19 \) - max \( 7 \, 65 - 2 x \) #scale(x: 120%, y: 120%)[\)]_(+) . $
  For $0 lt.eq x lt.eq 23$ this is zero; for $23 lt.eq x lt.eq 29$ it is $2 x - 46$; and for $29 lt.eq x lt.eq 65 \/ 2$ it is $12$. Only the part exceeding $q \/ N = 4$ improves a full minor. For $x > 65 \/ 2$, the formulas of Lemma 6 give the following values; the table retains the intermediate breakpoint $52$ at which the counting formula changes:
  $ x upright(" range") & R \/ N & S \/ N\
\[ 65 \/ 2 \, 40 \] & 105 - 2 x & 12\
\[ 40 \, 52 \] & 65 - x & 52 - x\
\[ 52 \, 58 \] & 117 - 2 x & x - 52\
\[ 58 \, 59 \] & 59 - x & 6\
\[ 59 \, 65 \] & 0 & 65 - x . $
  The entries agree at their common endpoints. Taking $min \( 96 \, 48 + R \/ N \, 2 R \/ N + S \/ N \)$ yields the additional breakpoint $69 \/ 2$. Thus for every relevant prime $p > 2 sqrt(H)$ the valuation is bounded below by $- N d \( p \/ N \)$, where $d$ is continuous, is zero for $x gt.eq 65$, and has the following exact pieces:
  #[#set math.equation(numbering: n => "(43)")
   $ x upright(" range") & d \( x \) & upright("endpoint values") & integral_(upright("range")) d \( x \) thin d x\
\[ 0 \, 25 \] & 96 & 96 \, 96 & 2400\
\[ 25 \, 29 \] & 146 - 2 x & 96 \, 88 & 368\
\[ 29 \, 65 \/ 2 \] & 88 & 88 \, 88 & 308\
\[ 65 \/ 2 \, 69 \/ 2 \] & 153 - 2 x & 88 \, 84 & 172\
\[ 69 \/ 2 \, 40 \] & 222 - 4 x & 84 \, 62 & 803 \/ 2\
\[ 40 \, 58 \] & 182 - 3 x & 62 \, 8 & 630\
\[ 58 \, 59 \] & 124 - 2 x & 8 \, 6 & 7\
\[ 59 \, 65 \] & 65 - x & 6 \, 0 & 18 . $ <eq:odd-loss-table>]
  In particular,
  #[#set math.equation(numbering: n => "(44)")
   $ integral_0^65 d \( x \) thin d x = 8609 / 2 . $ <eq:odd-loss-area>]
  For completeness, the omitted small odd primes cost only $o \( n^2 \)$ in the logarithm of the determinant. At any odd prime, the factorial formula gives
  $ 0 lt.eq v_p binom(2 l, l) lt.eq 1 + frac(log H, log p) #h(2em) \( 2 l lt.eq H \) . $
  Each factorial-floor difference is zero or one. The displayed formulas for $H_z^(*) \, m_i \, k_d^plus.minus \, Z^0$, and diagonal reduction then give, with an absolute constant $C_0$ and with $"den" G$ denoting the positive reduced denominator of $G$,
  $ v_p \( F_j \( r \) \) gt.eq - C_0 (1 + frac(log H, log p)) - v_p \( "den" G \) . $
  For instance, each summand in $k_u^(-)$ uses at most two powers of $z$ and two powers of $H_z^(*)$ in its denominator; no additional loss arises from summing. All row and filter coefficients are integers. Expanding a determinant therefore multiplies this entry bound by at most $n$, and summing it over $p lt.eq 2 sqrt(H)$ with weights $log p$ gives
  $ O #scale(x: 120%, y: 120%)[\(] n sqrt(H) log H + n log \( "den" G \) #scale(x: 120%, y: 120%)[\)] = o \( n^2 \) . $
  This estimate uses only that the number of such primes is at most $2 sqrt(H)$. For sufficiently large $N$, every prime $p > H$ is integral throughout the calculation: factorials and degree denominators introduce only prime factors at most $H$, and the fixed denominator of $G$ has no prime factor above $H$. Thus these primes give no negative contribution.
  We use the classical prime number theorem in the form
  $ theta \( y \) := sum_(p lt.eq y) log p tilde.op y #h(2em) \( y arrow.r oo \) \; $
  see #cite(label("Zagier1997")) Step VI, p. 707, which presents Newman’s analytic proof. The weighted consequence needed here follows directly:
  #[#set math.equation(numbering: n => "(45)")
   $ 1 / N sum_(p lt.eq 65 N) d \( p \/ N \) log p arrow.r integral_0^65 d \( x \) thin d x . $ <eq:odd-weighted-primes>]
  Here is a direct justification of the weight. For a fixed partition $0 = x_0 < dots.h.c < x_m = 65$, the prime number theorem gives
  $ frac(theta \( N x_j \) - theta \( N x_(j - 1) \), N) arrow.r x_j - x_(j - 1) . $
  Upper and lower step functions formed from the supremum and infimum of $d$ on each interval bound the weighted sum. Their limiting difference tends to zero as the mesh decreases, since $d$ is uniformly continuous. Individual partition endpoints change the sum by at most $O \( log N \/ N \)$. This proves Equation (45). The prime $2$ and the primes below $2 sqrt(H)$ may be removed from that sum at cost $o \( 1 \)$, using $parallel d parallel_oo = 96$ and the elementary bound $theta \( 2 sqrt(H) \) lt.eq 2 sqrt(H) log \( 2 sqrt(H) \)$.
  Combining these estimates with Equation (44) and $n^2 = 2304 N^2$ gives
  $ sum_(p upright(" odd")) v_p \( Delta_N \) log p gt.eq - 8609 / 4608 n^2 - o \( n^2 \) . $
  Proposition 3, with $delta = 10 \/ 48$, gives
  $ v_2 \( Delta_N \) gt.eq - (delta / 2 + delta^2 / 8) n^2 - o \( n^2 \) = - 505 / 4608 n^2 - o \( n^2 \) . $
  For a nonzero rational number its numerator and denominator factorizations give the exact identity
  $ log \| Delta_N \| = sum_p v_p \( Delta_N \) log p . $
  Subtracting $1 / 2 log 2$ after dividing by $n^2$ proves the non-strict inequality in Equation (42).
  The final numerical comparison also has a short rational check. The identity
  $ log 2 = 2 sum_(j = 0)^oo frac(3^(- \( 2 j + 1 \)), 2 j + 1) $
  and its positive geometric tail give
  $ log 2 lt.eq 2 sum_(j = 0)^5 frac(3^(- \( 2 j + 1 \)), 2 j + 1) + frac(2 thin 3^(- 13), 13 \( 1 - 3^(- 2) \)) < 693149 / 10^6 . $
  Consequently the lower constant is strictly larger than
  $ - 8609 / 4608 - 2809 / 4608 693149 / 10^6 = - 10556055541 / 4608000000 > - 2.29084 \, $
  which completes the proof. ◻
]

== 4 Nonvanishing along the prime sequence <sec:nonvanishing>

The next proposition supplies the nonzero determinants needed in Proposition 7.

#thm([Proposition 4.1.])[
  #emph[Assume that $G in bb(Q)$. For every sufficiently large prime $p$, the determinant with scale parameter $N = p$ satisfies 
#[#set math.equation(numbering: n => "(46)")
 $ v_p \( Delta_p \) = - 96 p . $ <eq:nonvanishing-exact-valuation>]

 In particular, $Delta_p eq.not 0$ for every sufficiently large prime $p$.]
] <prop:nonvanishing>

We prove the proposition by reducing a matrix of size $48 p$ to three fixed rational matrices of size $48$. Throughout this section, an underlined row polynomial is formed with $N = 1$, so that

$ n_0 = 48 \, quad b_0 = 7 \, quad q_0 = g_0 = 4 \, quad h_0 = 2 \, quad L_0 = 59 \, quad C_0 = 63 \, quad H_0 = 65 . $

In addition to the usual rows $0 \, dots.h \, 47$, define the auxiliary row $48$ by exactly the formulas in Equation (3). For $0 lt.eq r lt.eq 48$ and $0 lt.eq k < 48$, put

#[#set math.equation(numbering: n => "(47)")
 $ cal(B) \( r \, k \) = sum_(j = 0)^4 \( - 1 \)^j binom(4, j) {M^0 \( underline(P)_r \, 7 + k + j \) - 3 / 2 Z^0 \( underline(D)_r \, 7 + k + j \)} . $ <eq:nonvanishing-base-matrix>]

Here $M^0$ and $Z^0$ act linearly on the first polynomial argument. Thus $cal(B)$ is a fixed rational $49$ by $48$ matrix. Define

$ cal(B)_0 = \( cal(B) \( r \, k \) \)_(0 lt.eq r \, k < 48) \, #h(2em) cal(B)_1 = \( cal(B) \( r + 1 \, k \) \)_(0 lt.eq r \, k < 48) . $

The arithmetic certificate below proves

#[#set math.equation(numbering: n => "(48)")
 $ det cal(B)_0 eq.not 0 \, #h(2em) det \( cal(B)_0 + cal(B)_1 \) eq.not 0 \, #h(2em) det \( cal(B)_0 - cal(B)_1 \) eq.not 0 . $ <eq:nonvanishing-fixed-determinants>]

First we show why these three fixed assertions imply the proposition.

=== 4.1 Two palindromic bases <two-palindromic-bases>

Let $p$ be an odd prime and work over $bb(F)_p$. The vector space

$ cal(P)_p = { Q in bb(F)_p \[ w \] : deg Q lt.eq 2 p - 2 \, med w^(2 p - 2) Q \( 1 \/ w \) = Q \( w \) } $

has dimension $p$: its coefficients of $w^0 \, dots.h \, w^(p - 1)$ determine all its coefficients. For $0 lt.eq ell \, i < p$, consider

$ U_ell \( w \) = \( 2 w \)^ell \( 1 + w^2 \)^(p - 1 - ell) \, #h(2em) Q_i \( w \) = w^i sum_(j = 0)^(p - i - 1) w^(2 j) . $

Both families belong to $cal(P)_p$. The lowest terms of $U_ell$ and $Q_i$ are respectively $2^ell w^ell$ and $w^i$. Triangularity of their coefficients in degrees $0 \, dots.h \, p - 1$ proves that each family is a basis. Define $a_(ell i) in bb(F)_p$ by

$ Q_i = sum_(ell = 0)^(p - 1) a_(ell i) U_ell \, #h(2em) upright(bold(a)) = \( a_(ell i) \)_(0 lt.eq ell \, i < p) . $

The same lowest-term comparison gives

#[#set math.equation(numbering: n => "(49)")
 $ a_(ell i) = 0 quad \( ell < i \) \, #h(2em) a_(i i) = 2^(- i) \, #h(2em) det upright(bold(a)) = 2^(- p \( p - 1 \) \/ 2) eq.not 0 . $ <eq:nonvanishing-triangular-unit>]

In particular, invertibility of this varying-size matrix introduces no exceptional odd primes.

Define $Q'_0 = 0$ and $Q'_i = Q_(p - i)$ for $1 lt.eq i < p$, and write $Q'_i = sum_ell b_(ell i) U_ell$. Equivalently,

#[#set math.equation(numbering: n => "(50)")
 $ upright(bold(b)) = upright(bold(a)) Pi \, #h(2em) Pi e_0 = 0 \, #h(2em) Pi e_i = e_(p - i) quad \( 1 lt.eq i < p \) \, $ <eq:nonvanishing-transition>]

where $e_i$ are the standard coordinate vectors. The explicit forms are

$ Q_i = w^i frac(1 - w^(2 \( p - i \)), 1 - w^2) \, #h(2em) Q'_i = w^(p - i) frac(1 - w^(2 i), 1 - w^2) \; $

the latter formula gives zero also when $i = 0$. Their sum satisfies

$ Q_i + w^p Q'_i = w^i sum_(j = 0)^(p - 1) w^(2 j) = w^i \( 1 - w^2 \)^(p - 1) \, $

because $binom(p - 1, j) = \( - 1 \)^j$ in $bb(F)_p$. With

$ t = frac(2 w, 1 + w^2) \, #h(2em) f = frac(1 - w^2, 1 + w^2) \, #h(2em) E \( t \) = \( 1 - t^2 \)^(\( p - 1 \) \/ 2) = f^(p - 1) \, $

division by $\( 1 + w^2 \)^(p - 1)$ therefore proves the rational-function identity

#[#set math.equation(numbering: n => "(51)")
 $ E \( t \) w^i = sum_(ell = 0)^(p - 1) t^ell \( a_(ell i) + b_(ell i) w^p \) . $ <eq:nonvanishing-palindromic-expansion>]

=== 4.2 Frobenius and the two extraction shifts <frobenius-and-the-two-extraction-shifts>

Set $N = p$, and write every row index uniquely as $r = p r_0 + i$, with $0 lt.eq r_0 < 48$ and $0 lt.eq i < p$. Put $t' = t^p$, $w' = w^p$, and $f' = f^p$. Frobenius gives

$ t' = frac(2 w', 1 + \( w' \)^2) \, #h(2em) f' = frac(1 - \( w' \)^2, 1 + \( w' \)^2) \, #h(2em) \( f' \)^2 = 1 - \( t' \)^2 . $

Using $C = 63 p$, $h = 2 p$, and $g = 4 p$ in the row definition gives

#[#set math.equation(numbering: n => "(52)")
 $ t R_r E \( t \) & = \( 1 - t' \)^2 \( t' \)^63 \( w' \)^(r_0 - 4) E \( t \) w^i\
 & = sum_(ell = 0)^(p - 1) t^ell t' #scale(x: 120%, y: 120%)[\(] a_(ell i) underline(R)_(r_0) \( t' \, w' \) + b_(ell i) underline(R)_(r_0 + 1) \( t' \, w' \) #scale(x: 120%, y: 120%)[\)] . $ <eq:nonvanishing-frobenius-row>]

Here the single factor $w'$ in the second term creates exactly one successor row; its index is at most $48$.

To separate the polynomial parts, star fixes $t \, t'$ and negates $f \, f'$. Moreover $f E = f'$, so the row identities give

$ t R_r E = t P_r E - f' D_r \, #h(2em) t' underline(R)_j = t' underline(P)_j - f' underline(D)_j . $

Taking the star-invariant part of Equation (52) and then its anti-invariant part, and cancelling the nonzero rational function $f'$ in the latter, yields two separate polynomial identities:

#[#set math.equation(numbering: n => "(53)")
 $ t P_r \( t \) E \( t \) & = sum_(ell = 0)^(p - 1) t^ell t' #scale(x: 120%, y: 120%)[\(] a_(ell i) underline(P)_(r_0) \( t' \) + b_(ell i) underline(P)_(r_0 + 1) \( t' \) #scale(x: 120%, y: 120%)[\)] \,\
D_r \( t \) & = sum_(ell = 0)^(p - 1) t^ell #scale(x: 120%, y: 120%)[\(] a_(ell i) underline(D)_(r_0) \( t' \) + b_(ell i) underline(D)_(r_0 + 1) \( t' \) #scale(x: 120%, y: 120%)[\)] . $ <eq:nonvanishing-P-identity>]

These are polynomial identities since the row polynomials on both sides are polynomials, and substitution $t = 2 w \/ \( 1 + w^2 \)$ is injective on $bb(F)_p \[ t \]$.

In the notation of Equation (36), the extractions for a fixed residue $ell$ are

$ P'_u = \[ t^(\( u + 1 \) p + ell) \] t P_r \( t \) E \( t \) \, #h(2em) D'_u = \[ t^(u p + ell) \] D_r \( t \) . $

Every polynomial has a unique expression $sum_(ell = 0)^(p - 1) t^ell A_ell \( t^p \)$. Consequently Equations (53) and (53) give

#[#set math.equation(numbering: n => "(54)")
 $ \( P'_u \, D'_u \) = \[ \( t' \)^u \] {a_(ell i) \( underline(P)_(r_0) \, underline(D)_(r_0) \) \( t' \) + b_(ell i) \( underline(P)_(r_0 + 1) \, underline(D)_(r_0 + 1) \) \( t' \)} . $ <eq:nonvanishing-extracted-rows>]

Thus the $t'$ in the first identity is exactly consumed by the $u + 1$ in the $P$ extraction. The $D$ extraction has no such shift. Negative coefficient indices are zero; in particular $P'_(- 1) = 0$ here.

There is a degree issue at the last successor row which is useful to make explicit. The auxiliary polynomials have

#[#set math.equation(numbering: n => "(55)")
 $ min deg underline(P)_48 = 62 - 44 = 18 \, #h(2em) min deg underline(D)_48 = 63 - 44 = 19 . $ <eq:nonvanishing-auxiliary-degrees>]

These coefficients must be retained, even though the first $48$ base rows have minimum degrees at least $19$ and $20$. For the last block $r = 47 p + i$, $i > 0$, Equation (50) gives $b_(ell i) = a_(ell \, p - i) = 0$ for $ell < p - i$, and $b_(p - i \, i) = 2^(- \( p - i \)) eq.not 0$. The successor contribution in either $t P_r E$ or $D_r$ therefore starts at

$ 19 p + \( p - i \) = 20 p - i . $

The first-row contribution starts no earlier than $20 p + i$. Directly from the original rows, $\| r - g \| = 43 p + i$, so $t P_r$ and $D_r$ also start at $C - \| r - g \| = 20 p - i$; since $E \( 0 \) = 1$, this agrees with the extraction. The leading Chebyshev coefficients are powers of $2$, hence are nonzero in odd characteristic. When $i = 0$, the successor term is zero and the first term starts at $20 p$. The lower degree of the auxiliary row therefore introduces no forbidden coefficient into the growing matrix. Its contact identity is also valid: $t underline(R)_48 \/ f = O \( t^107 \)$, since $63 + 48 - 4 = 107 > 59$.

=== 4.3 The residue blocks and their determinant <the-residue-blocks-and-their-determinant>

For this paragraph take $p > 260$ and exclude primes dividing the denominator of the hypothesized rational number $G$. Then

$ p > 2 sqrt(65 p) = 2 sqrt(H) \, $

so Equations (31) and (36) apply at the same prime $p$ used as the scale parameter. To spell out the role of $G$, the rational raw entry is

$ F_j \( r \) = M^0 \( P_r \, j \) - 3 / 2 Z^0 \( D_r \, j \) + 4 G sum_v \[ t^v \] P_r thin c_(\( v - j \) \/ 2) . $

The last sum is $p$-integral: its polynomial coefficients are integers, and every $c_d = 4^(- d) binom(2 d, d)$ is integral at an odd prime. The $G$ term therefore reduces to zero after multiplication by $p^2$. All entries of the scaled matrix are $p$-integral by the cited layer formulas. Substitution of Equation (54) into Equation (36) gives the reduced raw entry

#[#set math.equation(numbering: n => "(56)")
 $ p^2 F_(k p + ell) \( p r_0 + i \) equiv  & a_(ell i) {M^0 \( underline(P)_(r_0) \, k \) - 3 / 2 Z^0 \( underline(D)_(r_0) \, k \)}\
 & + b_(ell i) {M^0 \( underline(P)_(r_0 + 1) \, k \) - 3 / 2 Z^0 \( underline(D)_(r_0 + 1) \, k \)} med \( mod med p \) . $ <eq:nonvanishing-raw-bridge>]

This applies to every raw column in the specified range. The base entries here have denominators with prime factors at most $65$, as the rational recipes below also show, so their reductions exist for $p > 260$.

The integer filter also respects residues. Write the column index uniquely as $k = ell + p k_0$, where $0 lt.eq ell < p$ and $0 lt.eq k_0 < 48$. In $bb(F)_p \[ s \]$,

#[#set math.equation(numbering: n => "(57)")
 $ s^(7 p + k) \( 1 - s \)^(4 p) = s^ell \( s^p \)^(7 + k_0) \( 1 - s^p \)^4 . $ <eq:nonvanishing-residue-filter>]

Multiplying each raw entry by $p^2$ before reduction makes this polynomial congruence applicable to the column operation: coefficient differences divisible by $p$ multiply integral scaled entries. The fourth finite difference on the right uses exactly the five base raw indices $7 + k_0 \, dots.h \, 11 + k_0$, all in $7 \, dots.h \, 58$. Each of the $p$ residue groups thus contains exactly $48$ base filtered columns, and no operation changes $ell$.

Order rows by $\( i \, r_0 \)$ and columns by $\( ell \, k_0 \)$. The reduction of the scaled $48 p$ by $48 p$ matrix has $\( i \, ell \)$ block

$ a_(ell i) cal(B)_0 + b_(ell i) cal(B)_1 . $

Writing this matrix as $cal(L)_p$ makes its orientation explicit:

#[#set math.equation(numbering: n => "(58)")
 $ cal(L)_p & = upright(bold(a))^T ⊗ cal(B)_0 + upright(bold(b))^T ⊗ cal(B)_1 \,\
cal(L)_p #scale(x: 120%, y: 120%)[\(] \( upright(bold(a))^T \)^(- 1) ⊗ I_48 #scale(x: 120%, y: 120%)[\)] & = I_p ⊗ cal(B)_0 + Pi^T ⊗ cal(B)_1 . $ <eq:nonvanishing-block-matrix>]

Indeed $upright(bold(b))^T = Pi^T upright(bold(a))^T$, which explains both the transpose and the side of multiplication.

The nonzero indices $1 \, dots.h \, p - 1$ fall into $\( p - 1 \) \/ 2$ disjoint pairs ${ i \, p - i }$. On each pair the vectors $e_i + e_(p - i)$ and $e_i - e_(p - i)$ are eigenvectors of $Pi$ with eigenvalues $1$ and $- 1$. Together with $e_0$, of eigenvalue zero, they form a basis since $2$ is invertible. Thus the eigenvalue multiplicities of $Pi^T$ are $1 \, \( p - 1 \) \/ 2 \, \( p - 1 \) \/ 2$ for $0 \, 1 \, - 1$, respectively. A similarity on the $p$-dimensional factor in Equation (58) now proves the exact identity in this block ordering:

#[#set math.equation(numbering: n => "(59)")
 $ det cal(L)_p =  & \( det upright(bold(a)) \)^48 det cal(B)_0\
 & quad dot.op det \( cal(B)_0 + cal(B)_1 \)^(\( p - 1 \) \/ 2) det \( cal(B)_0 - cal(B)_1 \)^(\( p - 1 \) \/ 2) . $ <eq:nonvanishing-factorization>]

There is no determinant factor from the similarity. Returning to the original row and column orders changes at most the sign.

=== 4.4 An exact certificate for the fixed matrices <an-exact-certificate-for-the-fixed-matrices>

All entries in Equation (47) can be constructed by the following rational arithmetic. This also specifies their reduction modulo $101$ without any numerical approximation. First form $m_0 = 2$, $m_i = 0$ for odd $i$, and $m_i = i m_(i - 2) \/ \( i + 1 \)$ for even $2 lt.eq i lt.eq 64$. Set

$ k_0^(-) = 0 \, quad k_1^(-) = 2 \, #h(2em) k_0^(+) = k_1^(+) = 0 \, $

and use

$ k_d^(-) & = frac(\( d - 1 \) k_(d - 2)^(-) + m_(d - 2) + m_(d - 1), d) &  & \( 2 lt.eq d lt.eq 64 \) \,\
k_d^(+) & = frac(\( d - 2 \) k_(d - 2)^(+) + 2 \/ \( d - 1 \), d - 1) &  & \( 2 lt.eq d lt.eq 58 \) . $

On $0 lt.eq i lt.eq 64$, $0 lt.eq j lt.eq 58$, form

$ Y_(i 0) = k_i^(-) \, #h(2em) Y_(0 j) = k_j^(+) \, #h(2em) Y_(i j) = Y_(i - 1 \, j - 1) - m_(i - 1) / j quad \( i \, j gt.eq 1 \) . $

Thus $Y_(i j) = M^0 \( i \, j \)$. With $B_i^(\( d \)) = sum_(u = 1)^i u^(- d)$ and $B_0^(\( d \)) = 0$, set

$ J_(i j) = 3 / 2 cases(delim: "{", - B_i^(\( 2 \)) \, & i = j \,, \( B_i^(\( 1 \)) - B_j^(\( 1 \)) \) \/ \( i - j \) \, & i eq.not j .) $

This gives $J_(i j) = 3 / 2 Z^0 \( i \, j \)$, with the sign on its diagonal included.

For the polynomial construction define

$ E_0 = t^62 \, quad E_1 = t^61 \, #h(2em) I_0 = 0 \, quad I_1 = t^62 \, $

and, for either family $S = E \, I$, use

$ S_m = 2 S_(m - 1) \/ t - S_(m - 2) #h(2em) \( 2 lt.eq m lt.eq 44 \) . $

These are ordinary integer polynomials: they are $E_m = t^62 T_m \( 1 \/ t \)$ and $I_m = t^62 U_(m - 1) \( 1 \/ t \)$. For $0 lt.eq r lt.eq 48$ let $u = \| r - 4 \|$ and form the coefficient vectors, in degrees $0 \, dots.h \, 64$, of

$ y_r \( t \) = \( 1 - t \)^2 E_u \( t \) \, #h(2em) z_r \( t \) = "sign" \( r - 4 \) \( 1 - t \)^2 I_u \( t \) . $

They are exactly $underline(P)_r$ and $underline(D)_r$. Contract them with the arrays to obtain the length-$52$ vector

$ v_r \( j \) = sum_(i = 0)^64 #scale(x: 120%, y: 120%)[\(] \[ t^i \] y_r thin Y_(i j) - \[ t^i \] z_r thin J_(i j) #scale(x: 120%, y: 120%)[\)] \, #h(2em) j = 7 \, dots.h \, 58 . $

Replace a vector $v$ four times successively by its vector of consecutive differences $\( v \( j \) - v \( j + 1 \) \)_j$. The resulting length-$48$ vector is row $r$ of $cal(B)$. In particular, the construction includes all coefficients of the auxiliary row, including its degree-$18$ term.

Every scalar denominator in these recipes is a product of nonzero integers of absolute value at most $65$. Every rational array entry therefore has denominator prime factors at most $65$, so each denominator is a unit modulo $101$. Polynomial division by $t$ above shifts exponents of polynomials divisible by $t$ and introduces no scalar denominator. Consequently the entire construction can be performed over $bb(F)_101$ and agrees with reduction of the rational matrices.

For completeness, the elimination rule producing the certificate is as follows. For $sigma in { 0 \, 1 \, - 1 }$, start with row vectors $R_i = cal(B) \( i \, dot.op \) + sigma cal(B) \( i + 1 \, dot.op \)$, $0 lt.eq i < 48$, in increasing order. At step $i$, if $R_i \( i \) = 0$, swap row $i$ with the first later row having a nonzero entry in column $i$. Record $d_i = R_i \( i \)$ and replace every row $j > i$ by

$ R_j - frac(R_j \( i \), d_i) R_i . $

There are no swaps for $sigma = 0 \, - 1$. For $sigma = 1$ the only swaps, using indices starting at zero, are $\( 30 \, 31 \)$ and $\( 45 \, 46 \)$ at their respective steps. The pivots are given in Table 1; its three lines for each $sigma$ list the pivots consecutively, with $16$ entries per line.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$sigma$
], table.cell(rowspan: 1, colspan: 1)[Successive pivots in $bb(F)_101$
]),
  table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$60 \, 68 \, 62 \, 79 \, 47 \, 32 \, 69 \, 57 \, 30 \, 72 \, 35 \, 66 \, 43 \, 20 \, 85 \, 48$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$88 \, 4 \, 77 \, 54 \, 60 \, 79 \, 26 \, 68 \, 83 \, 39 \, 40 \, 65 \, 1 \, 68 \, 78 \, 24$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$15 \, 98 \, 32 \, 22 \, 94 \, 9 \, 99 \, 10 \, 15 \, 75 \, 4 \, 2 \, 25 \, 53 \, 90 \, 79$
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$38 \, 51 \, 90 \, 70 \, 5 \, 21 \, 88 \, 55 \, 45 \, 20 \, 35 \, 41 \, 77 \, 10 \, 18 \, 25$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$76 \, 14 \, 38 \, 72 \, 6 \, 66 \, 56 \, 35 \, 83 \, 58 \, 56 \, 11 \, 17 \, 20 \, 30 \, 24$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$28 \, 11 \, 25 \, 70 \, 79 \, 99 \, 66 \, 38 \, 4 \, 41 \, 63 \, 91 \, 63 \, 17 \, 90 \, 98$
],
  table.cell(rowspan: 1, colspan: 1)[$- 1$
], table.cell(rowspan: 1, colspan: 1)[$82 \, 92 \, 26 \, 87 \, 21 \, 74 \, 87 \, 88 \, 88 \, 3 \, 14 \, 23 \, 38 \, 58 \, 36 \, 20$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$26 \, 33 \, 94 \, 74 \, 78 \, 45 \, 93 \, 86 \, 73 \, 66 \, 45 \, 30 \, 61 \, 3 \, 88 \, 27$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$20 \, 58 \, 69 \, 48 \, 78 \, 39 \, 48 \, 1 \, 66 \, 18 \, 86 \, 93 \, 52 \, 92 \, 39 \, 77$
],
)
]],
  caption: [Table 1: Exact Gaussian pivots for $cal(B)_0 + sigma cal(B)_1$ modulo $101$. ],
)

Every listed pivot is nonzero. Since the swaps and row additions are invertible, all three matrices are invertible modulo $101$ and hence have nonzero determinants over $bb(Q)$. This proves Equation (48). The modulus $101$ is used only for this fixed finite certificate; the growing determinant uses arbitrary sufficiently large primes as follows.

#proof[
  #emph[Completion of the proof of Proposition 8.] Let $cal(E)$ consist of $2$, the primes dividing the denominator of $G$, the primes dividing any denominator of an entry of $cal(B)$, and the primes dividing the numerator or denominator, in lowest terms, of any of the three nonzero rational determinants in Equation (48). This is a fixed finite set. For $p > 260$ outside $cal(E)$, all three fixed matrices reduce to invertible matrices over $bb(F)_p$. Equation  (49) and the factorization in Equation (59) then show that $det cal(L)_p eq.not 0$.
  Let $cal(F)_p$ be the original filtered matrix whose determinant is $Delta_p$. Its size is $n = 48 p$, and $p^2 cal(F)_p$ is integral over the local ring $bb(Z)_(\( p \))$. Its reduction, after the stated row and column permutations, is $cal(L)_p$. Therefore
  $ p^(2 n) Delta_p = det \( p^2 cal(F)_p \) $
  is a unit in $bb(Z)_(\( p \))$. This proves $v_p \( Delta_p \) = - 2 n = - 96 p$. Every sufficiently large prime is outside $cal(E)$ and exceeds $260$, as required. ◻
]

== 5 The real-place determinant estimates <sec:real-place>

We estimate the determinant defined in Equation (7) without a rationality assumption. Write

#[#set math.equation(numbering: n => "(60)")
 $ alpha = a / n = 11 / 48 \, quad beta = b / n = 7 / 48 \, quad gamma = g / n = q / n = 4 / 48 \, quad eta = h / n = 2 / 48 \,\
D_(*) = n - 1 - 2 g = 40 N - 1 . $ <eq:real-normalized-parameters>]

In particular, $0 < D_(*) < n$ and $n gt.eq 48$. For a real list $y$ of length $n$, let

$ V \( y \) = product_(i < j) \( y_j - y_i \) \, #h(2em) cal(V) \( y \) = \| V \( y \) \| . $

All constants in the estimates of this Section are independent of the locations and separations of the integration variables.

=== 5.1 The integral and its two sheets <the-integral-and-its-two-sheets>

Put $d mu \( t \) = \| t \| thin d t \/ f \( t \)$ on $\( - 1 \, 1 \)$, and set

$ A_r \( t \) = P_r \( t \) - 3 / 2 bold(1)_({ t > 0 }) frac(f \( t \), t) D_r \( t \) \, #h(2em) psi_k \( s \) = s^(b + k) \( 1 - s \)^q . $

The value at $t = 0$ is immaterial; the displayed expression has a finite limit there because $D_r \( t \) \/ t$ is a polynomial. The determinant entries are exactly

$ integral_(- 1)^1 integral_0^1 A_r \( t \) frac(psi_k \( s \), 1 - t s) thin d s thin d mu \( t \) . $

The measure has mass $mu \( \( - 1 \, 1 \) \) = 2$. The scalar majorant $integral #h(-0.16667em) integral \( 1 - \| t \| s \)^(- 1) thin d s thin d mu \( t \)$ is finite: integration in $s$ gives at worst a logarithmic singularity at $\| t \| = 1$, which is integrable against $\( 1 - t^2 \)^(- 1 \/ 2) d t$. The functions $A_r$ and $psi_k$ are bounded for each fixed $n$. Thus all permutation expansions below are absolutely integrable.

We apply Andréief’s determinant integration identity twice #cite(label("Forrester2018Andreief")) Equation (1.7) and Section 2.2. Expanding determinants and relabeling integration variables gives the identity

#[#set math.equation(numbering: n => "(61)")
 $ Delta_N = frac(1, \( n ! \)^2) integral_(\( - 1 \, 1 \)^n) integral_(\( 0 \, 1 \)^n) det \[ A_r \( t_i \) \]_(r \, i) thin det [frac(1, 1 - t_i s_j)]_(i \, j) thin det \[ psi_k \( s_j \) \]_(j \, k) thin d s thin d mu^n \( t \) . $ <eq:real-double-integral>]

Here $0 lt.eq r \, k < n$ and $1 lt.eq i \, j lt.eq n$. To see the factor $1 \/ n !$ at each application directly, expand the two determinants sharing an integration list: every one of the $n !$ permutations of that list gives the same determinant of single integrals. Fubini’s theorem applies by the preceding majorant, also after each permutation expansion.

Cauchy’s double alternant in multiplicative variables #cite(label("Krattenthaler1999")) Section 2.1, Equation (2.7) is

#[#set math.equation(numbering: n => "(62)")
 $ det [frac(1, 1 - t_i s_j)]_(i \, j) = frac(V \( t \) V \( s \), product_(i \, j) \( 1 - t_i s_j \)) . $ <eq:real-cauchy-determinant>]

For completeness, multiplying by the denominator gives a polynomial alternating separately in $t$ and $s$, of degree at most $n - 1$ in each individual variable. Dividing by $V \( t \) V \( s \)$ therefore leaves a constant. Expanding $\( 1 - t_i s_j \)^(- 1)$ at $s = 0$, the first nonzero homogeneous part of the determinant is $V \( t \) V \( s \)$, so that constant is one. Also $det \[ psi_k \( s_j \) \]_(j \, k) = V \( s \) product_j s_j^b \( 1 - s_j \)^q$.

Use the real coordinate

#[#set math.equation(numbering: n => "(63)")
 $ x_i = frac(t_i, 1 + sqrt(1 - t_i^2)) \, #h(2em) t_i = frac(2 x_i, 1 + x_i^2) \, #h(2em) d mu \( t_i \) = frac(4 \| x_i \|, \( 1 + x_i^2 \)^2) thin d x_i . $ <eq:real-coordinate>]

The coordinate maps $\( - 1 \, 1 \)$ bijectively to $\( - 1 \, 1 \)$. Except on a set of measure zero we may assume that all $x_i$ are distinct and nonzero. Define

$ \( xi_(upright(f)) \( x \) \, xi_(upright(n)) \( x \) \) = cases(delim: "{", \( 1 \/ 2 \, 1 \/ 2 \) \, & x < 0 \,, \( - 1 \/ 4 \, 5 \/ 4 \) \, & x > 0 \,) #h(2em) cal(R)_n \( x \) = det [xi_(upright(f)) \( x_i \) x_i^(g - r) + xi_(upright(n)) \( x_i \) x_i^(r - g)]_(r \, i) . $

The subscripts $upright(n)$ and $upright(f)$ refer to the near and far evaluations at $x_i$ and $1 \/ x_i$, respectively, inside and outside the unit circle. Indeed, $f D_r \/ t = \( R_r^(*) - R_r \) \/ 2$, so the negative half-interval has the row $\( R_r + R_r^(*) \) \/ 2$, whereas the positive half-interval has $\( 5 R_r - R_r^(*) \) \/ 4$. Factoring $\( 1 - t_i \)^h t_i^(C - 1)$ out of the $i$th column therefore gives the exact identity

#[#set math.equation(numbering: n => "(64)")
 $ Delta_N = frac(1, \( n ! \)^2) integral #h(-0.16667em) integral cal(R)_n \( x \) thin frac(V \( t \) V \( s \)^2, product_(i \, j) \( 1 - t_i s_j \)) product_j s_j^b \( 1 - s_j \)^q product_i t_i^(C - 1) \( 1 - t_i \)^h thin d s thin d mu^n \( t \) . $ <eq:real-sheet-integral>]

In particular, there is one $t$ Vandermonde and two $s$ Vandermondes. All the denominators in this formula are positive.

=== 5.2 A uniform interpolating function <a-uniform-interpolating-function>

The interpolation problem comes from factoring out the far-sheet weight. Put $c_i = xi_(upright(n)) \( x_i \) \/ xi_(upright(f)) \( x_i \)$; the denominator is nonzero on both half-intervals. For $0 lt.eq r < n$,

#[#set math.equation(numbering: n => "(65)")
 $ xi_(upright(f)) \( x_i \) x_i^(g - r) + xi_(upright(n)) \( x_i \) x_i^(r - g) = xi_(upright(f)) \( x_i \) x_i^(g - \( n - 1 \)) (x_i^(n - 1 - r) + c_i x_i^(D_(*)) x_i^r) . $ <eq:real-sheet-factorization>]

Thus a holomorphic function with values $h_(*) \( x_i \) = c_i x_i^(D_(*))$ turns the expression in parentheses into $x_i^(n - 1 - r) + h_(*) \( x_i \) x_i^r$. We shall bound the resulting evaluation determinant by controlling the norm of this function. The first estimate applies when

#[#set math.equation(numbering: n => "(66)")
 $ sum_(i = 1)^n frac(1 - x_i^2, 1 + x_i^2) lt.eq D_(*) . $ <eq:case-condition>]

The following construction is uniform even when the nodes cluster.

#thm([Lemma 5.1.])[
  #emph[Let $x_1 \, dots.h \, x_n$ be distinct nonzero real numbers in $\( - 1 \, 1 \)$ satisfying Equation (66). There is a function $h_(*)$ holomorphic on a neighborhood of the closed unit disk such that 
$ h_(*) \( x_i \) = c_i x_i^(D_(*)) \, #h(2em) c_i = cases(delim: "{", 1 \, & x_i < 0 \,, - 5 \, & x_i > 0 \,) #h(2em) sup_(\| z \| lt.eq 1) \| h_(*) \( z \) \| lt.eq K_0 n \, quad K_0 = 10 e^12 . $

 The neighborhood may depend on the node list; the displayed bound does not.]
] <lem:real-uniform-interpolation>

#proof[
  Set
  $ B \( z \) = product_i frac(z - x_i, 1 - x_i z) \, #h(2em) F \( z \) = frac(z^(D_(*)), B \( z \)) . $
  For $0 < u lt.eq 1$ and a real $x$ with $0 < \| x \| < 1$, the logarithmic derivative of one factor on the imaginary diameter is
  $ frac(d, d log u) 1 / 2 log frac(u^2 + x^2, 1 + x^2 u^2) = frac(\( 1 - x^4 \) u^2, \( u^2 + x^2 \) \( 1 + x^2 u^2 \)) lt.eq frac(1 - x^2, 1 + x^2) . $
  The inequality follows on dividing the denominator by $u^2$ and using $u^2 + u^(- 2) gt.eq 2$. Integration from $u$ to $1$ gives
  $ \| B \( i u \) \| gt.eq u^(sum_i \( 1 - x_i^2 \) \/ \( 1 + x_i^2 \)) gt.eq u^(D_(*)) . $
  The same holds at $- i u$, and $F \( 0 \) = 0$. For $1 lt.eq u lt.eq 1 + 2 \/ n$, each factor has modulus at least one because $\( u^2 + x^2 \) - \( 1 + x^2 u^2 \) = \( u^2 - 1 \) \( 1 - x^2 \) gt.eq 0$. Consequently
  #[#set math.equation(numbering: n => "(67)")
   $ \| F \( i u \) \| lt.eq e^2 #h(2em) \( \| u \| lt.eq 1 + 2 \/ n \) . $ <eq:real-diameter-bound>]
  Orient the fixed segment $Gamma = \[ - i \( 1 + 2 \/ n \) \, i \( 1 + 2 \/ n \) \]$ upwards, and, off that segment, define the fixed Cauchy integral
  $ cal(C) \( z \) = frac(1, 2 pi i) integral_Gamma frac(6 F \( w \), w - z) thin d w . $
  Write $c_(-) = 1$, $c_(+) = - 5$, with the sign specifying the left or right half-plane, and put
  #[#set math.equation(numbering: n => "(68)")
   $ h_(*) \( z \) = c_plus.minus z^(D_(*)) - B \( z \) cal(C) \( z \) quad upright("when ") med plus.minus "Re" z > 0 . $ <eq:real-glued-interpolant>]
  The density is holomorphic in a neighborhood of every point of $Gamma$, since its poles $x_i$ are nonzero and real. Local contour deformation and the Cauchy integral formula show that the left lateral value of $cal(C)$ minus its right lateral value is $6 F$. More explicitly, move a short upward piece of $Gamma$ to its left; the closed contour formed by the original piece followed by the reversed new piece is positively oriented, and its residue at $w = z$ is $6 F \( z \)$. Thus the difference of the two local analytic continuations in Equation (68) is $\( c_(-) - c_(+) \) z^(D_(*)) - 6 B \( z \) F \( z \) = 0$. This proves holomorphic gluing across the segment, including its two crossings of the unit circle.
  For each fixed node list the poles $1 \/ x_i$ of $B$ and the endpoints of $Gamma$ lie strictly outside the closed unit disk. A sufficiently small exterior neighborhood avoids all these points, and the same local gluing works there. It follows that $h_(*)$ is holomorphic on that neighborhood. Since $B \( x_i \) = 0$ and $cal(C)$ is regular at the nonzero real point $x_i$, the required interpolation follows.
  It remains to bound this one fixed function. In either radius-$1 \/ 4$ disk about $i$ or $- i$, the quantities $\| w \|$, $\| w - x_i \|$, and $\| 1 - x_i w \|$ are at least $3 \/ 4$. Hence $F$ is nonzero there and
  #[#set math.equation(numbering: n => "(69)")
   $ lr(|frac(F' \( w \), F \( w \))|) lt.eq 4 / 3 D_(*) + 8 / 3 n < 4 n . $ <eq:real-logarithmic-derivative>]
  As $\| F \( i \) \| = \| F \( - i \) \| = 1$, integration along a segment in either disk gives $\| F \( w \) \| lt.eq e^12$ whenever $\| w - i \| lt.eq 3 \/ n$ or $\| w + i \| lt.eq 3 \/ n$.
  If $\| z \| = 1$ and $\| "Re" z \| gt.eq 1 \/ \( 10 n \)$, the original segment has distance at least $1 \/ \( 10 n \)$ from $z$; its length is at most $3$. Equation (67) gives $\| cal(C) \( z \) \| lt.eq 30 e^2 n$. If instead $0 < \| "Re" z \| < 1 \/ \( 10 n \)$, $z$ is near one of $plus.minus i$. Near $i$, replace the portion of $Gamma$ from $i \( 1 - 1 \/ n \)$ to $i \( 1 + 2 \/ n \)$ by the three sides of the rectangle whose other vertical side has real part $- "sign" \( "Re" z \) \/ n$. Near $- i$, make the identical replacement of the bottom portion with imaginary parts from $- 1 - 2 \/ n$ to $- 1 + 1 \/ n$. The swept rectangle is in the opposite half-plane from $z$, and it is contained in the radius-$1 \/ 4$ disk about the relevant endpoint. It contains neither $z$ nor a pole of $F$, so this deformation leaves the value of the fixed integral $cal(C) \( z \)$ unchanged.
  Each new side is within $3 \/ n$ of $i$ or $- i$. The new contour has length at most $3$ and distance at least $1 \/ \( 2 n \)$ from $z$. For the latter assertion the vertical side has horizontal separation at least $1 \/ n$, the outer horizontal side has vertical separation at least $2 \/ n$, and the inner horizontal side and remaining diameter have separation at least
  $ 1 / n - #scale(x: 120%, y: 120%)[\(] 1 - sqrt(1 - \( 10 n \)^(- 2)) #scale(x: 120%, y: 120%)[\)] > frac(1, 2 n) . $
  Thus $\| cal(C) \( z \) \| lt.eq 6 e^12 n$ in this case. Only the two endpoint neighborhoods were deformed; the middle diameter uses its absolute bound (67), with no derivative estimate near zero. Finally $\| B \( z \) \| = 1$ on $\| z \| = 1$, so Equation (68) gives $\| h_(*) \( z \) \| lt.eq K_0 n$ there. At $z = plus.minus i$ use continuity of the glued function. The maximum modulus principle proves the bound in the disk. No uniform lower bound for the exterior neighborhood was used. ◻
]

=== 5.3 Evaluation in a finite-dimensional Hilbert space <evaluation-in-a-finite-dimensional-hilbert-space>

The following argument uses the kernel and compression viewpoint of bounded analytic interpolation; see #cite(label("Sarason1967")). We prove the needed finite-dimensional facts directly.

#thm([Proposition 5.2.])[
  (Interpolation estimate).  #emph[Under Equation (66), 
#[#set math.equation(numbering: n => "(70)")
 $ \| cal(R)_n \( x \) \| lt.eq \( 1 + K_0 n \)^n cal(V) \( 1 \/ x \) product_i \| x_i \|^g . $ <eq:real-first-sheet-bound>]

 In particular, the prefactor is $exp \( O \( n log n \) \)$ uniformly in the nodes.]
] <prop:first-sheet-bound>

#proof[
  Let $Q \( z \) = product_i \( 1 - x_i z \)$, and give
  $ cal(H)_Q = { v \/ Q : med v in bb(C) \[ z \] \, med deg v < n } $
  the norm inherited from the Hilbert space $H^2$ of analytic functions with square-summable Taylor coefficients:
  $ parallel v \/ Q parallel^2 = frac(1, 2 pi) integral_0^(2 pi) frac(\| v \( e^(i theta) \) \|^2, \| Q \( e^(i theta) \) \|^2) thin d theta . $
  For each fixed list the zeros of $Q$ lie outside the closed disk, so this is a well-defined norm. Define $tilde(v) \( z \) = z^(n - 1) v \( 1 \/ z \)$ and $R \( v \/ Q \) = tilde(v) \/ Q$. This is a complex-linear involution and an isometry: on the circle $\| tilde(v) \( e^(i theta) \) \| = \| v \( e^(- i theta) \) \|$, while the real coefficients of $Q$ imply $\| Q \( e^(i theta) \) \| = \| Q \( e^(- i theta) \) \|$.
  The functions $k_i \( z \) = \( 1 - x_i z \)^(- 1)$ belong to $cal(H)_Q$. They are linearly independent, as their distinct poles $1 \/ x_i$ show, and hence form a basis. For $u in H^2$, the Taylor coefficient inner product gives $chevron.l u \, k_i chevron.r = u \( x_i \)$. If $Pi_Q$ is orthogonal projection from $H^2$ to $cal(H)_Q$, it follows that
  $ \( Pi_Q u \) \( x_i \) = u \( x_i \) quad \( 1 lt.eq i lt.eq n \) . $
  Multiplication by the function $h_(*)$ of Lemma 9 has $H^2$ operator norm at most $parallel h_(*) parallel_oo$. Consequently
  $ J = Pi_Q M_(h_(*)) \|_(cal(H)_Q) \, #h(2em) L = I + J R quad upright("satisfy") quad parallel L parallel lt.eq 1 + K_0 n . $
  Let $E : cal(H)_Q arrow.r bb(C)^n$ send $v \/ Q$ to $\( v \( x_i \) \)_i$. It is invertible because a polynomial of degree less than $n$ cannot vanish at all the distinct nodes. For $u in cal(H)_Q$, $E \( u \)_i = Q \( x_i \) u \( x_i \)$. Since $L R = R + J$ and projection preserves function values, applying this identity to $L R \( v \/ Q \)$ cancels the factors $Q \( x_i \)$ algebraically and gives
  #[#set math.equation(numbering: n => "(71)")
   $ E L R \( v \/ Q \) = #scale(x: 120%, y: 120%)[\(] tilde(v) \( x_i \) + h_(*) \( x_i \) v \( x_i \) #scale(x: 120%, y: 120%)[\)]_i . $ <eq:real-evaluation-cancellation>]
  In the basis $1 \/ Q \, z \/ Q \, dots.h \, z^(n - 1) \/ Q$, $det E = V \( x \)$, and $R$ has determinant of absolute value one. Hence the determinant of the mixed evaluations divided by $V \( x \)$ has absolute value $\| det L \| lt.eq parallel L parallel^n lt.eq \( 1 + K_0 n \)^n$. This is an algebraic cancellation of the evaluation determinant. In particular no bound for the inverse evaluation matrix, which might be poorly conditioned, enters the argument.
  Apply this bound to the mixed evaluations in Equation (65). Since $\| xi_(upright(f)) \( x_i \) \| lt.eq 1 \/ 2 lt.eq 1$ and $cal(V) \( 1 \/ x \) = cal(V) \( x \) product_i \| x_i \|^(- \( n - 1 \))$, Equation (70) follows. ◻
]

#thm([Proposition 5.3.])[
  (Hadamard estimate).  #emph[For every distinct nonzero real list in $\( - 1 \, 1 \)$, and in particular when Equation (66) fails, 
#[#set math.equation(numbering: n => "(72)")
 $ \| cal(R)_n \( x \) \| lt.eq \( 3 \/ 2 \)^n n^(n \/ 2) 2^(- binom(n, 2)) product_i \( 1 + x_i^2 \)^(\( n - 1 \) \/ 2) \| x_i \|^(g - \( n - 1 \)) . $ <eq:real-second-sheet-bound>]

 The factor $\( 3 \/ 2 \)^n n^(n \/ 2)$ is $exp \( O \( n log n \) \)$; the power $2^(- binom(n, 2))$ is retained in the principal integrand below.]
] <prop:second-sheet-bound>

#proof[
  Expand the determinant by choosing one sheet in each column. For $z_i in { x_i \, 1 \/ x_i }$ the absolute monomial determinant is $cal(V) \( z \) product_i \| z_i \|^(- g)$. Write $z_i = tan phi.alt_i$ with $- pi \/ 2 < phi.alt_i < pi \/ 2$. Then
  $ cal(V) \( z \) = product_i \( 1 + z_i^2 \)^(\( n - 1 \) \/ 2) product_(i < j) \| sin \( phi.alt_j - phi.alt_i \) \| . $
  The last product is $2^(- binom(n, 2))$ times the Vandermonde on the unit-circle points $e^(2 i phi.alt_i)$. Its monomial matrix has column norms $sqrt(n)$, so Hadamard’s inequality gives the bound $2^(- binom(n, 2)) n^(n \/ 2)$. The ratio of the remaining weight on the far sheet to that on the near sheet is
  $ frac(\| 1 \/ x \|^(- g) \( 1 + x^(- 2) \)^(\( n - 1 \) \/ 2), \| x \|^(- g) \( 1 + x^2 \)^(\( n - 1 \) \/ 2)) = \| x \|^(- D_(*)) gt.eq 1 . $
  Thus all the weights can be bounded by their far-sheet values. Finally the sum of absolute sheet coefficients is at most $product_i \( \| xi_(upright(f)) \( x_i \) \| + \| xi_(upright(n)) \( x_i \) \| \) lt.eq \( 3 \/ 2 \)^n$, proving the result. ◻
]

=== 5.4 The two principal integrands <the-two-principal-integrands>

To state precisely the quantities needed for the real-place energy estimate, put $t_i = 2 x_i \/ \( 1 + x_i^2 \)$ and

$ cal(J)_n \( x \, s \) = frac(cal(V) \( t \) cal(V) \( s \)^2, product_(i \, j) \( 1 - t_i s_j \)) product_j s_j^b \( 1 - s_j \)^q product_i \| t_i \|^(C - 1) \( 1 - t_i \)^h . $

Define

#[#set math.equation(numbering: n => "(73)")
 $ cal(I)_(2 \, n) \( x \, s \) & = cal(J)_n \( x \, s \) cal(V) \( 1 \/ x \) product_i \| x_i \|^g \,\
cal(I)_(1 \, n) \( x \, s \) & = cal(J)_n \( x \, s \) 2^(- binom(n, 2)) product_i \( 1 + x_i^2 \)^(\( n - 1 \) \/ 2) \| x_i \|^(g - \( n - 1 \)) . $ <eq:real-integrand-majorants>]

Let $Omega_(2 \, n)$ be the set of interior configurations with distinct nonzero $x_i$ satisfying Equation (66), and let $Omega_(1 \, n)$ be its complementary case among such configurations. We use the interpolation estimate on $Omega_(2 \, n)$ and the Hadamard estimate on $Omega_(1 \, n)$; the latter estimate is valid in both cases. After substituting $t = 2 x \/ \( 1 + x^2 \)$, $kappa$ is the exponent of the absolute $x$-Vandermonde in the corresponding majorant: $kappa = 2$ for the interpolation estimate and $kappa = 1$ for the Hadamard estimate. The $s_j$ always range over $\( 0 \, 1 \)$.

The preceding propositions and Equation (64) give

$ \| Delta_N \| lt.eq frac(2^n K_n, \( n ! \)^2) max_(kappa in { 1 \, 2 }) sup_(\( x \, s \) in Omega_(kappa \, n)) cal(I)_(kappa \, n) \( x \, s \) \, quad K_n = max { \( 1 + K_0 n \)^n \, \( 3 \/ 2 \)^n n^(n \/ 2) } . $

Indeed $d mu^n \( t \) thin d s$ has total mass $2^n$, and the two case sets partition its domain up to a null set. In logarithmic form, with $log 0 = - oo$, this yields

#[#set math.equation(numbering: n => "(74)")
 $ frac(log \| Delta_N \|, n^2) - 1 / 2 log 2 lt.eq max_(kappa in { 1 \, 2 }) sup_(\( x \, s \) in Omega_(kappa \, n)) (frac(log cal(I)_(kappa \, n) \( x \, s \), n^2) - 1 / 2 log 2) + O (frac(log \( n + 2 \), n)) . $ <eq:real-supremum-reduction>]

The error is independent of both integration lists. Factorials, measure masses, and sheet sums have all been accounted for explicitly.

Repeated nonzero $x_i$ give a zero original row determinant and are also handled by continuity in the first estimate; repeated $s_j$ give a zero $s$ Vandermonde. The sets with a zero node or a boundary node have measure zero for the absolutely continuous measures above. At such points the original expression in Equation (61), rather than its factored Laurent expression, supplies the integrable definition. Approaches to these exceptional sets require no separation condition in any bound proved here. In particular all configurations arbitrarily close to them remain included in the suprema in Equation (74).

== 6 A uniform energy bound <sec:energy>

The purpose of this Section is to replace the two many-variable majorants by one-variable suprema and explicit quadratic terms. The bound must be uniform before taking those suprema. Matched damping and retained endpoint corrections provide this uniformity.

We retain the constants $alpha \, beta \, gamma \, eta$, the two cases $kappa = 2 \, 1$, and the nonnegative majorants $cal(I)_(kappa \, n)$ of Equation (73). Put

#[#set math.equation(numbering: n => "(75)")
 $ W_kappa \( x \) & = \( alpha + 2 gamma \) log \| x \| + 2 eta log \( 1 - x \) - \( kappa \/ 2 + alpha + eta + gamma \) log \( 1 + x^2 \) \,\
W_s \( s \) & = beta log s + gamma log \( 1 - s \) \,\
D \( x \) & = 2 gamma - frac(2 x^2, 1 + x^2) . $ <eq:energy-fields>]

Here $D \( x \)$ is a scalar function, distinct from the row polynomials $D_r \( t \)$. For a real sequence $u = \( u_k \)_(k gt.eq 1)$ with $\| u_k \| lt.eq K r^k$ for some $K < oo$ and $0 < r < 1$, define

#[#set math.equation(numbering: n => "(76)")
 $ parallel u parallel_(*)^2 = sum_(k gt.eq 1) u_k^2 / k \, #h(2em) T \( u \, x \) = sum_(k gt.eq 1) frac(u_k T_k \( x \), k) \, #h(2em) S \( u \, x \) = sum_(k gt.eq 1) frac(u_k x^k, k) . $ <eq:energy-trial-notation>]

These series converge uniformly for $- 1 lt.eq x lt.eq 1$.

The sequences $p \, v$ below are freely chosen trial coefficients. The inequality $- a^2 lt.eq b^2 - 2 a b$ lets them replace two negative quadratic sums in the logarithmic interactions by affine upper bounds, leaving the two one-variable suprema. Each admissible choice gives a valid bound; the certificate will supply one successful choice for each case.

#thm([Proposition 6.1.])[
  #emph[Let $p \, v$ be two such sequences, and take $lambda = 0$ in case $kappa = 2$ or any fixed $lambda gt.eq 0$ in case $kappa = 1$. Uniformly over configurations in the indicated case, 
#[#set math.equation(numbering: n => "(77)")
 $ & limsup_(N arrow.r oo) med sup_(upright("case ") kappa) (frac(log cal(I)_(kappa \, n), n^2) - 1 / 2 log 2)\
 & #h(2em) lt.eq \( - 1 + alpha + gamma \) log 2 + kappa parallel p parallel_(*)^2 + 1 / 2 parallel v parallel_(*)^2\
 & #h(2em) quad + sup_(- 1 lt.eq x < 1\
x eq.not 0) { W_kappa \( x \) + lambda D \( x \) - 2 kappa T \( p \, x \) - S \( v \, x \) }\
 & #h(2em) quad + sup_(0 < s < 1) { W_s \( s \) + 2 T \( v \, s \) } . $ <eq:energy-dual>]

 Consequently the maximum of the right sides for the two cases bounds 
$ limsup_(N arrow.r oo) (n^(- 2) log \| Delta_N \| - 1 / 2 log 2) . $

 We use $log 0 = - oo$.]
] <prop:energy-reduction>

#proof[
  For a one-variable function $F$, write $chevron.l F \( x \) chevron.r = n^(- 1) sum_i F \( x_i \)$, and similarly for $s$. In a double average $chevron.l K \( x \, x' \) chevron.r_eq.not$ we sum over ordered pairs $i eq.not j$ and divide by $n^2$; a double average without the subscript includes every pair. The substitution $t = 2 x \/ \( 1 + x^2 \)$ gives
  #[#set math.equation(numbering: n => "(78)")
   $ \| t - t' \| = frac(2 \| x - x' \| \( 1 - x x' \), \( 1 + x^2 \) \( 1 + x' ""^2 \)) \, #h(2em) 1 - t s = frac(1 - 2 x s + x^2, 1 + x^2) \, #h(2em) 1 - t = frac(\( 1 - x \)^2, 1 + x^2) . $ <eq:energy-transform-identities>]
  In particular, the exponent of $\| x_i \|$ in either majorant is exactly
  $ \( C - 1 \) + g - \( n - 1 \) = C + g - n = a + 2 g \; $
  there is no singular finite-size correction at $x = 0$. Keeping the other powers as well gives the following exact identity:
  #[#set math.equation(numbering: n => "(79)")
   $ frac(log cal(I)_(kappa \, n), n^2) - 1 / 2 log 2 & = c_(kappa \, n) log 2 + ⟨W_kappa \( x \) + frac(kappa + 2, 2 n) log \( 1 + x^2 \)⟩ + chevron.l W_s \( s \) chevron.r\
 & quad + kappa / 2 chevron.l log \| x - x' \| chevron.r_eq.not + 1 / 2 chevron.l log \( 1 - x x' \) chevron.r_eq.not + chevron.l log \| s - s' \| chevron.r_eq.not\
 & quad - chevron.l log \( 1 - 2 x s + x^2 \) chevron.r \,\
c_(kappa \, n) & = C / n + frac(kappa - 2, 2) - frac(kappa + 1, 2 n) . $ <eq:energy-exact-finite>]
  The displayed correction involving $log \( 1 + x^2 \)$ is bounded by $2 log 2 \/ n$ on the whole domain.
  We use the classical Chebyshev expansion of the logarithmic kernel, in the form of Haagerup’s identity presented in #cite(label("GaroufalidisPopescu2013")) Lemma 3.1 and its proof. We first record its damped form on $\[ - 1 \, 1 \]$. If $u = cos theta$, $u' = cos theta'$, and $0 lt.eq r < 1$, set
  #[#set math.equation(numbering: n => "(80)")
   $ L_r \( u \, u' \) & = - log 2 + log \| 1 - r e^(i \( theta + theta' \)) \| + log \| 1 - r e^(i \( theta - theta' \)) \|\
 & = - log 2 - 2 sum_(k gt.eq 1) frac(r^k T_k \( u \) T_k \( u' \), k) . $ <eq:energy-cosine-kernel>]
  This follows from the power series for $log \( 1 - z \)$ and the addition formula for cosines. Letting $r arrow.t 1$ at distinct $u \, u'$ gives $L_1 \( u \, u' \) = log \| u - u' \|$, since the product of the two chord lengths is $2 \| u - u' \|$. The other two identities, for $\| z \| \, \| z' \| < 1$, are
  #[#set math.equation(numbering: n => "(81)")
   $ log \( 1 - z z' \) = - sum_(k gt.eq 1) frac(z^k z' ""^k, k) \, #h(2em) - log \( 1 - 2 z s + z^2 \) = 2 sum_(k gt.eq 1) frac(z^k T_k \( s \), k) . $ <eq:energy-power-cross-kernels>]
  For the last identity the logarithm is the logarithm of a positive real number, equal to $log \| 1 - z e^(i arccos s) \|^2$. The singular kernels cannot be summed at empirical diagonals. We regularize all appearances of the same moment by the same factor so that the pure and cross interactions still complete a square. Near $\( x \, s \) = \( 1 \, 1 \)$, the identity $\| 1 - x e^(i arccos s) \|^2 = \( 1 - x \)^2 + 2 x \( 1 - s \)$ identifies the scales $1 - x$ and $sqrt(1 - s)$ used in the following damping factors.
  Fix $0 < epsilon < 1 \/ 8$ and define
  #[#set math.equation(numbering: n => "(82)")
   $ tau = 1 - epsilon \, #h(2em) rho \( x \) = 1 - epsilon \( 1 - x \) \, #h(2em) sigma \( s \) = 1 - epsilon sqrt(1 - s) . $ <eq:energy-damping>]
  Replace the $x$ cosine kernel in Equation (79) by $L_(tau^2) \( x \, x' \)$ and the $s$ cosine kernel by $L_(sigma \( s \) sigma \( s' \)) \( s \, s' \)$. Replace the power kernel by
  $ log \( 1 - rho \( x \) rho \( x' \) x x' \) \, $
  and the cross kernel by
  $ - log \| 1 - rho \( x \) sigma \( s \) x e^(i arccos s) \|^2 . $
  Every original kernel is bounded above by its replacement plus $O \( epsilon \)$, with an absolute constant independent of the configuration. We give the global estimates, including the signs in the power kernel.
  For $\| zeta \| = 1$ and $0 < r lt.eq 1$,
  $ \| 1 - r zeta \|^2 - r \| 1 - zeta \|^2 = \( 1 - r \)^2 gt.eq 0 . $
  Thus each of the cosine kernels costs at most $- log r$ in the comparison, and here $r gt.eq \( 1 - epsilon \)^2$. For the power kernel put $u = x x'$ and $r = rho \( x \) rho \( x' \)$. If $u gt.eq 0$, monotonicity gives $log \( 1 - u \) lt.eq log \( 1 - r u \)$. If $u < 0$, write $q = - u lt.eq 1$; then
  #[#set math.equation(numbering: n => "(83)")
   $ log \( 1 + q \) - log \( 1 + r q \) lt.eq frac(\( 1 - r \) q, 1 + r q) lt.eq 1 - r lt.eq 4 epsilon . $ <eq:energy-opposite-sign>]
  For the cross kernel write $a = 1 - x$, $b = sqrt(1 - s)$, $theta = arccos s$, $z = 1 - x e^(i theta)$, and $z_epsilon = 1 - rho \( x \) sigma \( s \) x e^(i theta)$. Then $\| z_epsilon - z \| lt.eq epsilon \| x \| \( a + b \)$. On $x lt.eq 0$ we have $\| z \| gt.eq 1$ and $\| x \| \( a + b \) lt.eq 3$. On $0 lt.eq x lt.eq 1 \/ 2$ we have $\| z \| gt.eq 1 \/ 2$ and $\| x \| \( a + b \) lt.eq 1$. On $1 \/ 2 lt.eq x < 1$ we have
  $ \| z \|^2 = a^2 + 2 x b^2 gt.eq a^2 + b^2 \, #h(2em) \| x \| \( a + b \) lt.eq sqrt(2) thin \| z \| . $
  Consequently $\| z_epsilon - z \| lt.eq 3 epsilon \| z \|$ on all three domains, and in the direction required for an upper bound,
  #[#set math.equation(numbering: n => "(84)")
   $ - log \| z \|^2 lt.eq - log \| z_epsilon \|^2 + 2 log \( 1 + 3 epsilon \) lt.eq - log \| z_epsilon \|^2 + 6 epsilon . $ <eq:energy-cross-comparison>]
  For each fixed finite interior configuration all the damped series are absolutely convergent. Put
  $ A_k = chevron.l tau^k T_k \( x \) chevron.r \, #h(2em) B_k = chevron.l rho \( x \)^k x^k chevron.r \, #h(2em) C_k = chevron.l sigma \( s \)^k T_k \( s \) chevron.r . $
  Inserting the diagonals gives the two exact negative-square identities
  #[#set math.equation(numbering: n => "(85)")
   $ kappa / 2 chevron.l L_(tau^2) \( x \, x' \) chevron.r & = - kappa / 2 log 2 - kappa sum_(k gt.eq 1) A_k^2 / k \, $ <eq:energy-first-square>]
  #[#set math.equation(numbering: n => "(86)")
   $ & 1 / 2 chevron.l log \( 1 - rho \( x \) rho \( x' \) x x' \) chevron.r + chevron.l L_(sigma \( s \) sigma \( s' \)) \( s \, s' \) chevron.r\
 & #h(2em) - chevron.l log \| 1 - rho \( x \) sigma \( s \) x e^(i arccos s) \|^2 chevron.r\
 & quad = - log 2 - 1 / 2 sum_(k gt.eq 1) frac(\( B_k - 2 C_k \)^2, k) . $ <eq:energy-second-square>]
  In particular the $B_k$ and $C_k$ in the cross term are exactly the same ones as in the pure power and cosine terms. Adding the constants in these identities to $c_(kappa \, n) log 2$ gives
  $ (- 1 + alpha + gamma - frac(kappa + 1, 2 n)) log 2 . $
  The omitted-diagonal constants are part of the next $O_epsilon \( 1 \/ n \)$ correction.
  We control this correction before taking any supremum. A damped cosine diagonal is bounded below by $- log 2 + 2 log \( 1 - r \)$, so the $x$ cosine diagonals cost $O_epsilon \( 1 \/ n \)$. For the power diagonal,
  $ 1 - rho \( x \)^2 x^2 gt.eq 1 - x quad \( x gt.eq 0 \) \, #h(2em) 1 - rho \( x \)^2 x^2 gt.eq 1 - \( 1 - epsilon \)^2 gt.eq epsilon quad \( x lt.eq 0 \) . $
  Since $1 lt.eq 1 - x lt.eq 2$ when $x lt.eq 0$, their upward correction is at most
  $ O_epsilon \( 1 \/ n \) - frac(1, 2 n) chevron.l log \( 1 - x \) chevron.r . $
  Finally,
  $ 1 - sigma \( s \)^2 = epsilon sqrt(1 - s) thin \( 2 - epsilon sqrt(1 - s) \) gt.eq epsilon sqrt(1 - s) \, $
  so the $s$ cosine diagonals cost at most $O_epsilon \( 1 \/ n \) - n^(- 1) chevron.l log \( 1 - s \) chevron.r$. The cross term already contains all pairs. There is no loss involving $log \| x \|$ or $log \( 1 + x \)$.
  For real numbers $a \, b$ we have $- a^2 lt.eq b^2 - 2 a b$. Apply this to the first square with $b = p_k$, and to the second with $b = v_k$; after dividing by $k$ and summing, the two inequalities are
  $ - kappa sum_k A_k^2 \/ k & lt.eq kappa parallel p parallel_(*)^2 - 2 kappa sum_k p_k A_k \/ k \,\
- 1 / 2 sum_k \( B_k - 2 C_k \)^2 \/ k & lt.eq 1 / 2 parallel v parallel_(*)^2 - sum_k v_k B_k \/ k + 2 sum_k v_k C_k \/ k . $
  For $kappa = 1$, failure of Equation (66) says
  $ 1 - 2 ⟨frac(x^2, 1 + x^2)⟩ > 1 - 1 / n - 2 gamma \, #h(2em) upright("hence") #h(2em) chevron.l D \( x \) chevron.r > - 1 \/ n . $
  It follows that adding $lambda chevron.l D \( x \) chevron.r$ costs at most $lambda \/ n$ for an upper bound; this explains both $lambda gt.eq 0$ and its sign in Equation (77).
  Let $T_epsilon \( p \, x \)$, $S_epsilon \( v \, x \)$, and $T_epsilon \( v \, s \)$ denote the three series in Equation (76) with factors $tau^k$, $rho \( x \)^k$, and $sigma \( s \)^k$, respectively. The preceding pointwise bounds reduce the upper estimate to the sum of two one-variable suprema, with functions
  $ X_(n \, epsilon) \( x \) & = 19 / 48 log \| x \| + (1 / 12 - frac(1, 2 n)) log \( 1 - x \)\
 & quad - \( kappa \/ 2 + alpha + eta + gamma \) log \( 1 + x^2 \) + lambda D \( x \)\
 & quad - 2 kappa T_epsilon \( p \, x \) - S_epsilon \( v \, x \) \,\
Y_(n \, epsilon) \( s \) & = 7 / 48 log s + (1 / 12 - 1 / n) log \( 1 - s \) + 2 T_epsilon \( v \, s \) \, $
  plus the constant in Equation (77) and $O \( epsilon \) + O_epsilon \( 1 \/ n \)$. All bounded finite-size terms from Equation (79) are included in this last error. For $n gt.eq 24$ both weakened endpoint coefficients are at least $1 \/ 24$.
  Set $P_1 = sum_k \| p_k \|$ and $V_1 = sum_k \| v_k \|$, which are finite. The inequality $1 - \( 1 - d \)^k lt.eq k d$ shows uniformly that
  $ \| T_epsilon \( p \, x \) - T \( p \, x \) \| & lt.eq epsilon P_1 \,\
\| S_epsilon \( v \, x \) - S \( v \, x \) \| & lt.eq 2 epsilon V_1 \,\
\| T_epsilon \( v \, s \) - T \( v \, s \) \| & lt.eq epsilon V_1 . $
  Thus the changes in the two tangent functions are at most $2 kappa epsilon P_1 + 2 epsilon V_1$ and $2 epsilon V_1$, respectively. These are common summable bounds; no uniform convergence of the raw square series is required. All remaining nonsingular terms are bounded uniformly in $n gt.eq 24$ and $0 < epsilon < 1 \/ 8$. The unchanged positive coefficients $19 \/ 48 \, 7 \/ 48$ and the weakened coefficients at least $1 \/ 24$ force uniform decay to $- oo$ near $x = 0$, $x = 1$, $s = 0$, and $s = 1$. The values at the fixed comparison points $x = - 1 \/ 2$, $s = 1 \/ 2$ have a common finite lower bound. For the first supremum we include the regular endpoint $x = - 1$ by continuous extension. There are therefore compact sets, independent of $n gt.eq 24$ and small $epsilon$, containing maximizers for both suprema. On these sets the functions converge uniformly as $n arrow.r oo$ with $epsilon$ fixed, and subsequently as $epsilon arrow.b 0$. Taking the limits in precisely this order removes $O_epsilon \( 1 \/ n \)$ first and proves Equation (77). Finally apply Equation (74). ◻
]

== 7 An exact certificate for the two barriers <sec:certificate>

All finite decimals in this Section denote exact rational numbers. We specify trial sequences for Equation (77), isolate every stationary point of its two one-variable functions, and bound their values using rational arithmetic.

#thm([Proposition 7.1.])[
  #emph[For the determinants of Equation (7), 
#[#set math.equation(numbering: n => "(87)")
 $ limsup_(N arrow.r oo) (frac(log \| Delta_N \|, n^2) - 1 / 2 log 2) lt.eq - 2.290939875 < - 2.2909 . $ <eq:certified-real-upper>]

 The separate bounds for the majorants in cases $kappa = 2$ and $kappa = 1$ are $- 2.290939875$ and $- 2.296789875$, respectively.]
] <prop:real-upper>

=== 7.1 Exact trial sequences <exact-trial-sequences>

For $kappa = 2$ take $d = 10$ and $lambda_2 = 0$. For $kappa = 1$ take $d = 8$ and $lambda_1 = 2.47405979$. Write each sequence as

#[#set math.equation(numbering: n => "(88)")
 $ u_k = l_k + sum_z r_z z^k \, #h(2em) l_k = 0 quad \( k > d \) . $ <eq:certificate-sequences>]

The following tables give all coefficients. Every integer coefficient in them is to be multiplied by $10^(- 8)$. The finite parts are listed in increasing order of $k$:

#[
  #set par(justify: false)
#table(
  columns: 7,
  align: (center, center, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[$u$
], table.cell(rowspan: 1, colspan: 5, align: center)[finite coefficients
]),
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[45559127
], table.cell(rowspan: 1, colspan: 1)[-50750856
], table.cell(rowspan: 1, colspan: 1)[-6578767
], table.cell(rowspan: 1, colspan: 1)[13970217
], table.cell(rowspan: 1, colspan: 1)[4786184
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[-4292433
], table.cell(rowspan: 1, colspan: 1)[-576704
], table.cell(rowspan: 1, colspan: 1)[1311615
], table.cell(rowspan: 1, colspan: 1)[671564
], table.cell(rowspan: 1, colspan: 1)[-346453
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$v$
], table.cell(rowspan: 1, colspan: 1)[-23910158
], table.cell(rowspan: 1, colspan: 1)[21152432
], table.cell(rowspan: 1, colspan: 1)[-2885110
], table.cell(rowspan: 1, colspan: 1)[-11558199
], table.cell(rowspan: 1, colspan: 1)[6485289
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[1456821
], table.cell(rowspan: 1, colspan: 1)[-1912176
], table.cell(rowspan: 1, colspan: 1)[-2263524
], table.cell(rowspan: 1, colspan: 1)[2742210
], table.cell(rowspan: 1, colspan: 1)[-1162454
],
)
]

#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, center, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[$u$
], table.cell(rowspan: 1, colspan: 4, align: center)[finite coefficients
]),
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[11913521
], table.cell(rowspan: 1, colspan: 1)[-79993701
], table.cell(rowspan: 1, colspan: 1)[-21956443
], table.cell(rowspan: 1, colspan: 1)[37903579
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[10744022
], table.cell(rowspan: 1, colspan: 1)[-2073193
], table.cell(rowspan: 1, colspan: 1)[570246
], table.cell(rowspan: 1, colspan: 1)[-24939103
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$v$
], table.cell(rowspan: 1, colspan: 1)[-89913025
], table.cell(rowspan: 1, colspan: 1)[52874280
], table.cell(rowspan: 1, colspan: 1)[45168341
], table.cell(rowspan: 1, colspan: 1)[-30708629
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[-19269841
], table.cell(rowspan: 1, colspan: 1)[33922112
], table.cell(rowspan: 1, colspan: 1)[9819141
], table.cell(rowspan: 1, colspan: 1)[-16992389
],
)
]

Case $kappa = 1$ has no exponential terms. The exponential terms for $kappa = 2$ are as follows. For a real base $z$ the displayed $a$ is the coefficient of $z^k$. For a nonreal base the two entries $a \, b$ are the coefficients of $Re \( z^k \) \, Im \( z^k \)$, in that order. In Equation (88) such a pair is represented by $r_z = \( a - i b \) \/ 2$ and $r_(macron(z)) = overline(r_z)$, with the factor $10^(- 8)$ applied to $a \, b$. Each real base appears once and each nonreal base together with its conjugate.

#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$u$
], table.cell(rowspan: 1, colspan: 1)[base $z$
], table.cell(rowspan: 1, colspan: 1)[$a$
], table.cell(rowspan: 1, colspan: 1)[$b$
]),
  table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[$.85$
], table.cell(rowspan: 1, colspan: 1)[-9338452
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.94$
], table.cell(rowspan: 1, colspan: 1)[-2141509
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.7 i$
], table.cell(rowspan: 1, colspan: 1)[-66277922
], table.cell(rowspan: 1, colspan: 1)[-31907569
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.85 i$
], table.cell(rowspan: 1, colspan: 1)[-1231651
], table.cell(rowspan: 1, colspan: 1)[6002645
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.092 + .92 i$
], table.cell(rowspan: 1, colspan: 1)[-3225918
], table.cell(rowspan: 1, colspan: 1)[8928234
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$- .092 + .92 i$
], table.cell(rowspan: 1, colspan: 1)[-2105536
], table.cell(rowspan: 1, colspan: 1)[-9091287
],
  table.cell(rowspan: 1, colspan: 1)[$v$
], table.cell(rowspan: 1, colspan: 1)[$- .8$
], table.cell(rowspan: 1, colspan: 1)[15199211
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$- .96$
], table.cell(rowspan: 1, colspan: 1)[4451662
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.88$
], table.cell(rowspan: 1, colspan: 1)[2545398
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.95$
], table.cell(rowspan: 1, colspan: 1)[-4932634
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.984$
], table.cell(rowspan: 1, colspan: 1)[11618157
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.78 i$
], table.cell(rowspan: 1, colspan: 1)[27238714
], table.cell(rowspan: 1, colspan: 1)[-38447936
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.9 i$
], table.cell(rowspan: 1, colspan: 1)[-31341084
], table.cell(rowspan: 1, colspan: 1)[-30188786
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.955 i$
], table.cell(rowspan: 1, colspan: 1)[-6693542
], table.cell(rowspan: 1, colspan: 1)[11912254
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$.984 i$
], table.cell(rowspan: 1, colspan: 1)[2055213
], table.cell(rowspan: 1, colspan: 1)[-21715849
],
)
]

In particular these are real exponentially decaying sequences. There are ten $p$ tail terms and thirteen $v$ tail terms when conjugates are counted, and their base moduli are at most $.94$ and $.984$, respectively. All the $\| l_k \|$ and $\| r_z \|$ are less than $1$.

The convergent power series for the logarithm give the finite formulas

#[#set math.equation(numbering: n => "(89)")
 $ parallel u parallel_(*)^2 & = sum_(k = 1)^d frac(l_k^2 + 2 l_k sum_z r_z z^k, k) - sum_(z \, z') r_z r_(z') "Log" \( 1 - z z' \) \,\
T \( u \, x \) & = sum_(k = 1)^d frac(l_k T_k \( x \), k) - 1 / 2 sum_z r_z "Log" \( 1 - 2 x z + z^2 \) \,\
S \( u \, x \) & = sum_(k = 1)^d frac(l_k x^k, k) - sum_z r_z "Log" \( 1 - x z \) . $ <eq:certificate-log-formulas>]

Here $"Log"$ is the principal complex logarithm; all sums are real by conjugation. There is no branch ambiguity in these formulas. For the norm and power terms the log arguments have positive real part. For the cosine term, writing $x = cos theta$ gives

$ 1 - 2 x z + z^2 = \( 1 - z e^(i theta) \) \( 1 - z e^(- i theta) \) . $

Both factors have positive real part, and their principal arguments sum strictly inside $\( - pi \, pi \)$. The sum of their logarithms is therefore exactly the principal logarithm of the product, including when the product has negative real part.

For these choices put

#[#set math.equation(numbering: n => "(90)")
 $ X_kappa \( x \) & = W_kappa \( x \) + lambda_kappa D \( x \) - 2 kappa T \( p \, x \) - S \( v \, x \) \,\
Y_kappa \( x \) & = beta log x + gamma log \( 1 - x \) + 2 T \( v \, x \) . $ <eq:certificate-barriers>]

The domain of $X_kappa$ is $\[ - 1 \, 1 \) \\ { 0 }$, and that of $Y_kappa$ is $\( 0 \, 1 \)$.

=== 7.2 Derivative numerators and exhaustive root brackets <derivative-numerators-and-exhaustive-root-brackets>

Define the rational functions

$ t_u \( x \) & = sum_(k = 1)^d l_k U_(k - 1) \( x \) + sum_z frac(r_z z, 1 - 2 x z + z^2) \,\
h_u \( x \) & = sum_(k = 1)^d l_k x^(k - 1) + sum_z frac(r_z z, 1 - x z) . $

Differentiation of Equation (89) yields

#[#set math.equation(numbering: n => "(91)")
 $ X'_kappa \( x \) & = frac(alpha + 2 gamma, x) - frac(2 eta, 1 - x) - \( kappa + 2 alpha + 2 eta + 2 gamma \) frac(x, 1 + x^2)\
 & quad - frac(4 lambda_kappa x, \( 1 + x^2 \)^2) - 2 kappa t_p \( x \) - h_v \( x \) \,\
Y'_kappa \( x \) & = beta / x - frac(gamma, 1 - x) + 2 t_v \( x \) . $ <eq:certificate-derivatives>]

For a completely specified rational numerator, use

#[#set math.equation(numbering: n => "(92)")
 $ Q_X \( x \) & = x \( 1 - x \) \( 1 + x^2 \)^(3 - kappa) product_(z upright(" in ") p) \( 1 - 2 x z + z^2 \) product_(z upright(" in ") v) \( 1 - x z \) \,\
Q_Y \( x \) & = x \( 1 - x \) product_(z upright(" in ") v) \( 1 - 2 x z + z^2 \) \,\
A_X \( x \) & = Q_X \( x \) X'_kappa \( x \) \,\
A_Y \( x \) & = Q_Y \( x \) Y'_kappa \( x \) . $ <eq:certificate-numerators>]

Empty products equal $1$. These equations, the coefficient tables, and $T_0 = 1 \, T_1 = x$, $U_0 = 1 \, U_1 = 2 x$, with recurrence $V_(k + 1) = 2 x V_k - V_(k - 1)$, specify the four polynomials over $bb(Q)$ without any numerical root calculation. The denominators do not vanish on the indicated open domains: $\| 1 - x z \| gt.eq 1 - \| z \| > 0$, and $\| 1 - 2 x z + z^2 \| gt.eq \( 1 - \| z \| \)^2 > 0$ for real $\| x \| lt.eq 1$. Conjugate factors in $Q_X \, Q_Y$ have positive products, and real-base factors are positive. Hence $Q_X$ has the sign of $x$ on its domain and $Q_Y > 0$ on $\( 0 \, 1 \)$.

Here is an exact root-count certificate. If $A \( x \) = sum_(j = 0)^(d_0) A_j x^j$ is the specified numerator, on a subinterval $\( b \, c \)$ form

#[#set math.equation(numbering: n => "(93)")
 $ \( 1 + t \)^(d_0) A (frac(b + c t, 1 + t)) = sum_(h = 0)^(d_0) a_h t^h \, #h(2em) a_h = sum_(j = 0)^(d_0) sum_(k = 0)^j A_j binom(j, k) b^(j - k) c^k binom(d_0 - j, h - k) \, $ <eq:certificate-descartes-transform>]

where out-of-range binomial coefficients are zero. Delete zero coefficients and count consecutive sign changes. The degrees and the resulting counts, in the order of the consecutive intervals, are

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, left, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[function
], table.cell(rowspan: 1, colspan: 1)[$d_0$
], table.cell(rowspan: 1, colspan: 1)[division points
], table.cell(rowspan: 1, colspan: 1)[sign variations
]),
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[36
], table.cell(rowspan: 1, colspan: 1)[$- 1 \, 0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$9 \, 9$
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[24
], table.cell(rowspan: 1, colspan: 1)[$0 \, .25 \, .5 \, .75 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$5 \, 2 \, 2 \, 6$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[$- 1 \, - .5 \, 0 \, .5 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$1 \, 1 \, 2 \, 1$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$5$
],
)
]

The sign-variation bound is Descartes’ rule of signs #cite(label("Descartes1637")) Book III, p. 373. For completeness, the required bound follows by factoring out positive real roots: multiplication of a real polynomial by $t - r$, $r > 0$, increases the number of variations by at least one. To see this, positive rescaling of the variable reduces to $r = 1$, and zero initial coefficients can be removed. If $a_0 \, dots.h \, a_d$ are the old coefficients and $b_0 \, dots.h \, b_(d + 1)$ the new ones, then

$ sum_(j = 0)^h b_j = - a_h quad \( 0 lt.eq h lt.eq d \) \, #h(2em) b_(d + 1) = a_d . $

Each sign change between nonzero partial sums forces an intervening $b_j$ with the sign of the later partial sum. Starting with $b_0 = - a_0$, these choices give an ordered subsequence with all the variations of the $a_h$; the final coefficient $b_(d + 1)$ has the opposite sign to the last partial sum and supplies one further variation. Factoring successively therefore proves that the variation count bounds the number of positive roots with multiplicity. The substitution in Equation (93) sends $t > 0$ bijectively to $\( b \, c \)$ and does not change multiplicities.

The following integers $m$ specify disjoint open brackets $\( m \, m + 2 \) \/ 10^10$ for roots of the corresponding derivative:

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[function
], table.cell(rowspan: 1, colspan: 3, align: center)[$m$
]),
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-9601109148
], table.cell(rowspan: 1, colspan: 1)[-8942317572
], table.cell(rowspan: 1, colspan: 1)[-7608305633
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[-6503394794
], table.cell(rowspan: 1, colspan: 1)[-5185864065
], table.cell(rowspan: 1, colspan: 1)[-4015634158
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[-3108806646
], table.cell(rowspan: 1, colspan: 1)[-2067921826
], table.cell(rowspan: 1, colspan: 1)[-1589849496
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[1531948062
], table.cell(rowspan: 1, colspan: 1)[2072448179
], table.cell(rowspan: 1, colspan: 1)[3208186484
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[4381119427
], table.cell(rowspan: 1, colspan: 1)[5851354199
], table.cell(rowspan: 1, colspan: 1)[7269030693
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[8390277402
], table.cell(rowspan: 1, colspan: 1)[9332614564
], table.cell(rowspan: 1, colspan: 1)[9709786219
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[176402802
], table.cell(rowspan: 1, colspan: 1)[330649406
], table.cell(rowspan: 1, colspan: 1)[764952882
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[1227250753
], table.cell(rowspan: 1, colspan: 1)[2149465998
], table.cell(rowspan: 1, colspan: 1)[3048189112
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[4322699096
], table.cell(rowspan: 1, colspan: 1)[5564757994
], table.cell(rowspan: 1, colspan: 1)[6801929373
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[8031988371
], table.cell(rowspan: 1, colspan: 1)[8877037851
], table.cell(rowspan: 1, colspan: 1)[9577761832
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[9838463999
], table.cell(rowspan: 1, colspan: 1)[9972727815
], table.cell(rowspan: 1, colspan: 1)[9992037196
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-9917299785
], table.cell(rowspan: 1, colspan: 1)[-2259572153
], table.cell(rowspan: 1, colspan: 1)[2543808026
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[4437270259
], table.cell(rowspan: 1, colspan: 1)[6348298970
], table.cell(rowspan: 1, colspan: 1)[],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[532669786
], table.cell(rowspan: 1, colspan: 1)[2504239325
], table.cell(rowspan: 1, colspan: 1)[5701738806
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[7966939383
], table.cell(rowspan: 1, colspan: 1)[9454490138
], table.cell(rowspan: 1, colspan: 1)[],
)
]

For each integer in this table the exact sign check is

#[#set math.equation(numbering: n => "(94)")
 $ N_A \( m \) N_A \( m + 2 \) < 0 \, #h(2em) N_A \( s \) = sum_(j = 0)^(d_0) A_j \( 10^10 \)^(d_0 - j) s^j . $ <eq:certificate-bracket-sign>]

Equations (92), (93), and (94) give rational addition and multiplication recipes for every entry of the root certificate. The numbers of brackets in each consecutive interval equal the displayed variation counts. The intermediate value theorem and the variation bound therefore give exactly one simple root per bracket and no other roots in those open intervals. Possible roots at the division points are harmless because all finite division points are evaluated separately below.

=== 7.3 Rational logarithms and all candidate values <rational-logarithms-and-all-candidate-values>

Here is the rational procedure used for the value bounds. For a positive rational $s$, write $s = 2^m y$ with $1 lt.eq y lt.eq 2$, and put

#[#set math.equation(numbering: n => "(95)")
 $ H \( y \) = 2 sum_(j = 0)^17 frac(1, 2 j + 1) (frac(y - 1, y + 1))^(2 j + 1) . $ <eq:certificate-H>]

The substitution for $log s$ is $m H \( 2 \) + H \( y \)$. If $q = \( y - 1 \) \/ \( y + 1 \)$, its unscaled positive remainder is bounded by

$ 0 lt.eq log y - H \( y \) lt.eq frac(2 q^37, 37 \( 1 - q^2 \)) . $

For a nonzero rational complex number $a + i b$, its real log part is half the real log of $a^2 + b^2$. For its principal argument choose an octant: rotate by $- k pi \/ 4$, $- 4 lt.eq k lt.eq 4$, so the rotated real part is positive and the imaginary-to-real ratio $t$ satisfies $\| t \| lt.eq 1 \/ 2$. Select the rotation for which $k pi \/ 4 + arctan t$ is the principal argument; at the negative real axis use the value $pi$. The ratio $t$ is rational, since the rotation can be performed, up to a positive scale, by repeated maps $\( a \, b \) mapsto \( a + b \, b - a \)$ or $\( a - b \, a + b \)$. With

#[#set math.equation(numbering: n => "(96)")
 $ J \( t \) = sum_(j = 0)^23 frac(\( - 1 \)^j t^(2 j + 1), 2 j + 1) \, $ <eq:certificate-J>]

substitute $k \( J \( 1 \/ 2 \) + J \( 1 \/ 3 \) \) + J \( t \)$ for the argument. The identity

$ arctan \( 1 \/ 2 \) + arctan \( 1 \/ 3 \) = pi \/ 4 $

follows from the tangent addition formula and the fact that both summands are positive and their sum is less than $pi \/ 2$. The alternating-series estimate gives $\| arctan t - J \( t \) \| lt.eq \| t \|^49 \/ 49$.

All positive inputs used here, including squared moduli, lie between $2^(- 100)$ and $2^100$. Indeed, the real arguments at the evaluation points are between $.0007$ and $2$, and the squared moduli of all complex arguments lie between $\( .016 \)^4$ and $\( 1 + .984 \)^4$, by the factor bounds following Equation (92). Thus at most $100$ scaling steps are needed. To make the error allowance explicit, set

$ h_0 = frac(2 \( 1 \/ 3 \)^37, 37 \( 1 - 1 \/ 9 \)) \, #h(2em) j_0 = frac(\( 1 \/ 2 \)^49, 49) . $

A real log substitution costs at most $101 h_0$, and an argument costs at most $9 j_0$. In particular $2 dot.op 101 h_0 + 9 j_0 < 7 dot.op 10^(- 16)$, so $10^(- 15)$ is an upper bound for the absolute error of a complex log. This also proves the coarser allowance $10^(- 11)$ per log.

All rational polynomial terms in Equation (89) are evaluated exactly. The total absolute log coefficient mass in $kappa parallel p parallel_(*)^2 + parallel v parallel_(*)^2 \/ 2$ is at most $2 dot.op 10^2 + 13^2 \/ 2 = 284.5$, in $X_kappa$ it is less than $2 dot.op 10 + 13 + 2 = 35$, and in $Y_kappa$ it is less than $13 + 1 = 14$. Their resulting substitution errors are respectively less than $2.85 dot.op 10^(- 13)$, $3.5 dot.op 10^(- 14)$, and $1.4 dot.op 10^(- 14)$, all less than $10^(- 8)$. One may enclose each rational series term between consecutive multiples of $10^(- 40)$, add the displayed remainder bounds with outward signs, and then propagate intervals linearly. This additional rounding changes the preceding allowances by less than $10^(- 32)$. For a complex weight $c$, use $Re \( c "Log" z \) = Re \( c \) Re \( "Log" z \) - Im \( c \) Im \( "Log" z \)$, retaining the sign of each weight in interval multiplication. This fully specifies a rational interval calculation; no numerical logarithms are needed.

For transparency, Table 2 gives all fifty point-value upper bounds. Its argument column is $10^10 x$. A row marked $B$ is the left endpoint of the corresponding root bracket above; a row marked $P$ is a finite division point. Each displayed bound is a rational upper bound rounded upwards to twelve decimal places after the series remainder has been included. The largest unrounded interval width in this table is less than $2.16146856249281 dot.op 10^(- 16)$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[function
], table.cell(rowspan: 1, colspan: 1)[$10^10 x$
], table.cell(rowspan: 1, colspan: 1)[type
], table.cell(rowspan: 1, colspan: 1)[upper bound
]),
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-9601109148
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984034048775
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-8942317572
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984375363807
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-7608305633
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984034052640
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-6503394794
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984105522615
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-5185864065
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984034053414
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-4015634158
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984092061375
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-3108806646
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984034037901
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-2067921826
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984364031075
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-1589849496
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984034038450
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[1531948062
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984033385315
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[2072448179
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984776982913
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[3208186484
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984034026898
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[4381119427
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984264010107
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[5851354199
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984034029391
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[7269030693
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984245044505
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[8390277402
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984034016294
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[9332614564
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984567630027
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[9709786219
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-0.984033926884
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-10000000000
], table.cell(rowspan: 1, colspan: 1)[P
], table.cell(rowspan: 1, colspan: 1)[-0.986727371546
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[176402802
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608946411646
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[330649406
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.609949505120
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[764952882
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608960295828
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[1227250753
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.609094597854
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[2149465998
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608960426500
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[3048189112
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608992193672
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[4322699096
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608960428486
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[5564757994
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608979509517
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[6801929373
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608960430478
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[8031988371
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608990548812
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[8877037851
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608960429811
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[9577761832
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.609055802895
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[9838463999
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608960412835
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[9972727815
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.609694899071
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[9992037196
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.608958123669
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[2500000000
], table.cell(rowspan: 1, colspan: 1)[P
], table.cell(rowspan: 1, colspan: 1)[-1.608973617030
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[5000000000
], table.cell(rowspan: 1, colspan: 1)[P
], table.cell(rowspan: 1, colspan: 1)[-1.608971701898
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[7500000000
], table.cell(rowspan: 1, colspan: 1)[P
], table.cell(rowspan: 1, colspan: 1)[-1.608976908052
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-9917299785
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-2.778491531574
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-2259572153
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.324666731948
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[2543808026
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.324655807046
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[4437270259
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.352236629957
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[6348298970
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.324666329425
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-10000000000
], table.cell(rowspan: 1, colspan: 1)[P
], table.cell(rowspan: 1, colspan: 1)[-2.775818077526
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[-5000000000
], table.cell(rowspan: 1, colspan: 1)[P
], table.cell(rowspan: 1, colspan: 1)[-1.544057819905
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[5000000000
], table.cell(rowspan: 1, colspan: 1)[P
], table.cell(rowspan: 1, colspan: 1)[-1.347557680876
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[532669786
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.428286151250
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[2504239325
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.515602647362
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[5701738806
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.428335732372
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[7966939383
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.465686164672
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$Y$
], table.cell(rowspan: 1, colspan: 1)[9454490138
], table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[-1.428335358167
],
)
]],
  caption: [Table 7: Certified rational upper bounds at every candidate evaluation point. ],
)

The same calculation gives the following upper bounds for $kappa parallel p parallel_(*)^2 + 1 / 2 parallel v parallel_(*)^2$:

$ .778415976284 quad \( kappa = 2 \) \, #h(2em) .931985203901 quad \( kappa = 1 \) . $

In particular the rational substituted expressions, before their error allowances are added, satisfy the following convenient stronger cutoffs:

#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$kappa$
], table.cell(rowspan: 1, colspan: 1)[$kappa parallel p parallel_(*)^2 + parallel v parallel_(*)^2 \/ 2$
], table.cell(rowspan: 1, colspan: 1)[$X$ at listed points
], table.cell(rowspan: 1, colspan: 1)[$Y$ at listed points
]),
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$.77843$
], table.cell(rowspan: 1, colspan: 1)[$- .98400$
], table.cell(rowspan: 1, colspan: 1)[$- 1.60891$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$.93205$
], table.cell(rowspan: 1, colspan: 1)[$- 1.32442$
], table.cell(rowspan: 1, colspan: 1)[$- 1.42805$
],
)
]

Each entry means a strict upper bound. With the $10^(- 8)$ allowance, the weaker cutoffs we shall actually use are

#[#set math.equation(numbering: n => "(97)")
 $ kappa & kappa parallel p parallel_(*)^2 + 1 / 2 parallel v parallel_(*)^2 & X & Y\
2 & .77844 & - .98399 & - 1.60890\
1 & .9321 & - 1.3244 & - 1.4280 . $ <eq:certificate-coarse-cutoffs>]

The logarithm procedure also gives $.693146 < log 2 < .693149$.

=== 7.4 From bracket values to global suprema <from-bracket-values-to-global-suprema>

A single derivative bound suffices on every whole closed bracket in the root table. All its points have distance greater than $.0007$ from both $0$ and $1$. In particular the bracket nearest $s = 1$ has right endpoint $9992037198 \/ 10^10$, whose distance from $1$ is exactly $.0007962802$. For $\| x \| lt.eq 1$, the identity $U_(k - 1) \( cos theta \) = sin \( k theta \) \/ sin theta$ gives $\| U_(k - 1) \( x \) \| lt.eq k$, including its endpoint limits. Using the coefficient and base bounds above, the polynomial part of $X'_kappa$ is at most $4 sum_(k = 1)^10 k + 10 = 230$ in absolute value; its endpoint terms are bounded by $\( 19 \/ 48 + 1 \/ 12 \) \/ .0007 < 685$; its $x \/ \( 1 + x^2 \)$ term is less than $3$; and its multiplier term is less than $4 lambda_1 < 10$. Its two log-tail derivatives are bounded by

$ frac(4 dot.op 10, \( .06 \)^2) + 13 / .016 < 11924 . $

Consequently $\| X'_kappa \| < 12852 < 120000$ throughout every listed bracket. For $Y'_kappa$ the polynomial part is at most $110$, the endpoint terms are bounded by $\( 7 \/ 48 + 1 \/ 12 \) \/ .0007 < 328$, and the log tails are bounded by $26 \/ \( .016 \)^2 = 101562.5$. Hence $\| Y'_kappa \| < 102001 < 120000$ on every whole bracket as well. These estimates hold for both cases, with empty tails in case $1$.

It follows from the mean value theorem that moving from a left bracket endpoint to its stationary point increases either value by less than

$ 120000 dot.op 2 / 10^10 = .000024 . $

Every interior stationary point is in one of these brackets or is a division point. All finite division points have been included in Table 2: $- 1$ for $X_2$; $1 \/ 4 \, 1 \/ 2 \, 3 \/ 4$ for $Y_2$; and $- 1 \, - 1 \/ 2 \, 1 \/ 2$ for $X_1$. The remaining endpoints are singular and have limit $- oo$: $x arrow.r 0^plus.minus$ and $x arrow.r 1^(-)$ for $X_kappa$, and $x arrow.r 0^(+)$ and $x arrow.r 1^(-)$ for $Y_kappa$. The bounded tangent and multiplier terms do not alter these limits. Thus the root exhaustion, the finite endpoint values, and the derivative estimate together certify the global suprema, not merely the sampled values.

Finally $- 1 + alpha + gamma = - 11 \/ 16$. Apply Proposition 12, use Equation (97), and add $.000024$ for each supremum. Since $log 2 > .693146$, the right side is strictly less than, respectively,

$ - 11 / 16 \( .693146 \) + .77844 - .98399 - 1.60890 + .000048 & = - 2.290939875 \,\
- 11 / 16 \( .693146 \) + .9321 - 1.3244 - 1.4280 + .000048 & = - 2.296789875 . $

Taking the larger of these constants proves Proposition 13.

== 8 Conclusion <sec:conclusion>

#proof[
  Suppose that $G$ is rational. Proposition 2 then makes $Delta_N$ rational for every $N$. By Proposition 8, $Delta_p eq.not 0$ for every sufficiently large prime $p$. Apply the product-formula lower bound of Proposition 7 along this sequence:
  $ liminf_(p arrow.r oo\
p med upright("prime")) (frac(log \| Delta_p \|, \( 48 p \)^2) - 1 / 2 log 2) > - 2.29084 . $
  Proposition 13 gives, along the same sequence, an upper limit strictly smaller than $- 2.2909$. Since $- 2.29084 > - 2.2909$, this is a contradiction. Therefore $G$ is irrational. ◻
]

===== 8.1 Hyperbolic volumes. <hyperbolic-volumes.>

Normalize sectional curvature to $- 1$. Agol’s theorem identifies $4 G$ as the minimum volume of an orientable complete finite-volume hyperbolic three-manifold with exactly two cusps, attained by the Whitehead-link and $\( - 2 \, 3 \, 8 \)$-pretzel-link complements #cite(label("Agol2010TwoCusps")) Introduction and Theorem 3.6. Theorem 1 therefore makes this minimum and both link volumes irrational. More generally, every orientable arithmetic hyperbolic three-orbifold defined over $bb(Q) \( i \)$ has irrational volume. Here its lattice $Gamma lt.eq "PSL"_2 \( bb(C) \)$ is, up to conjugacy, commensurable with the projective norm-one group $Gamma^1 \( cal(O) \) = cal(O)^1 \/ { plus.minus 1 }$ of a maximal order $cal(O)$ in some quaternion algebra $B \/ bb(Q) \( i \)$ #cite(label("Voight2021Quaternion")) Definition 38.3.4. For each such algebra, with finite reduced discriminant $frak(D)$, the volume formula gives

$ "vol" #scale(x: 120%, y: 120%)[\(] Gamma^1 \( cal(O) \) without bb(H)^3 #scale(x: 120%, y: 120%)[\)] = G / 3 product_(frak(p) divides frak(D)) \( N frak(p) - 1 \) \, $

where $N frak(p) = \| bb(Z) \[ i \] \/ frak(p) \|$; this follows by inserting $zeta_(bb(Q) \( i \)) \( 2 \) = zeta \( 2 \) L \( 2 \, chi_(- 4) \) = \( pi^2 \/ 6 \) G$ into #cite(label("Voight2021Quaternion")) Theorem 39.1.13. After conjugating, a common finite-index subgroup $H$ gives

$ "vol" \( Gamma without bb(H)^3 \) = frac(\[ Gamma^1 \( cal(O) \) : H \], \[ Gamma : H \]) "vol" #scale(x: 120%, y: 120%)[\(] Gamma^1 \( cal(O) \) without bb(H)^3 #scale(x: 120%, y: 120%)[\)] \, $

so this volume is a positive rational multiple of $G$ and is irrational. In the split case $B = M_2 \( bb(Q) \( i \) \)$, $cal(O) = M_2 \( bb(Z) \[ i \] \)$, the empty product yields $"vol" \( "PSL"_2 \( bb(Z) \[ i \] \) without bb(H)^3 \) = G \/ 3$ #cite(label("Voight2021Quaternion")) Example 39.1.16.


#bibliography("refs.bib", style: "ieee", title: [References])
