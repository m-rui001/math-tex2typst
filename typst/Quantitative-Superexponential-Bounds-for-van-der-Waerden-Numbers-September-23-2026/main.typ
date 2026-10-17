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

#align(center)[#text(size: 16pt, weight: "bold")[Quantitative Superexponential Bounds \
for van der Waerden Numbers]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For positive integers $r$ and $k$, let $W_r \( k \)$ be the least positive integer $N$ such that every map $\[ N \] arrow.r \[ r \]$ is constant on some arithmetic progression

$ a \, a + d \, dots.h \, a + \( k - 1 \) d \, #h(2em) a \, d gt.eq 1 \, quad a + \( k - 1 \) d lt.eq N . $

Here $\[ N \] = { 1 \, dots.h \, N }$, and using fewer than $r$ colors is allowed. The finiteness of these numbers is van der Waerden’s theorem #cite(label("vanDerWaerden1927")). The lower-bound problem asks how long an interval can be colored while avoiding a monochromatic progression of a prescribed length. We prove a bound with one threshold on the length, valid for every number of colors.

#thm([Theorem 1.1.])[
  #emph[There is an absolute integer $K_0$ such that, for every integer $k gt.eq K_0$ and every integer $r gt.eq 2$, 
$ W_r \( k \) > k^(c k floor.l log_2 r floor.r) \, #h(2em) c = 10^(- 5) . $

]
] <main:intro>

In particular, for each fixed $r gt.eq 2$,

$ lim_(k arrow.r oo) W_r \( k \)^(1 \/ k) = oo . $

Erdős explicitly asked for this full limit in the two-color case #cite(label("erdos1980")) p. 90, (2). Thus Theorem 1 gives a quantitative positive resolution of his superexponential-growth question. It is stronger than the assertion that $W_2 \( k \) \/ 2^k$ tends to infinity.

===== 1.1 Earlier bounds. <earlier-bounds.>

Early lower bounds were obtained by Erdős and Rado #cite(label("erdosRado1952")) and by Schmidt #cite(label("schmidt1962")). Berlekamp’s algebraic construction gives $W_2 \( p + 1 \) > p 2^p$ for every prime $p$ #cite(label("berlekamp1968")) Theorem 2. The local lemma of Erdős and Lovász #cite(label("erdosLovasz1975")) provided another route to strong coloring bounds. Szabó #cite(label("szabo1990")) Theorem 2 proved $W_2 \( k \) gt.eq 2^k \/ k^epsilon$ for every fixed $epsilon > 0$ and all sufficiently large $k$. Kozik and Shabanov #cite(label("kozikShabanov2016")) Theorem 2 subsequently obtained an absolute $beta > 0$ such that $W_r \( k \) gt.eq beta r^(k - 1)$ for all $r gt.eq 2$ and $k gt.eq 3$. Hunter #cite(label("hunter2025")) Theorem 1 improved the exponential base for each fixed $r gt.eq 5$, with a threshold allowed to depend on $r$.

Recent results distinguish the two questions posed by Erdős. Fox and Hunter #cite(label("foxHunter2026")) Theorem 1 proved $W_3 \( k \) > 2^(k log^(*) k \/ 4)$ for all sufficiently large $k$, where $log^(*) k$ counts the iterations of the natural logarithm needed to reach a value at most one. Campos, Fox, and Schildkraut #cite(label("camposFoxSchildkraut2026")) Theorem 1 proved

$ W_2 \( k \) gt.eq \( 1 - o \( 1 \) \) k 2^(k - 1) . $

They credit ChatGPT 5.6 Sol Pro with the coloring and an initial proof. Their result settles the question about $W_2 \( k \) \/ 2^k$, whereas Theorem 1 gives the full superexponential limit. For every fixed $epsilon in \( 0 \, 1 \)$, Fox and Hunter also prove $W_r \( k \) gt.eq r^(\( 1 - epsilon \) k log k)$ when $k$ is sufficiently large in terms of $epsilon$ and $r gt.eq \( log k \)^(3 \/ epsilon)$ #cite(label("foxHunter2026")) Theorem 2. For example, taking $epsilon = 1 \/ 2$ gives a stronger lower bound when $r gt.eq \( log k \)^6$ and $k$ is sufficiently large. The bound here holds uniformly down to two colors.

Growth in the number of colors, with the progression length fixed, has a different history. Behrend’s construction and Rankin’s extension to longer progressions supply dense progression-free sets #cite(label("behrend1946")) #cite(label("rankin1961")); covering an interval by translates of such sets already gives superpolynomial growth in the number of colors #cite(label("foxHunter2026")) pp. 2–3. For three-term progressions, the density bound of Kelley and Meka gives a quasipolynomial coloring upper bound #cite(label("kelleyMeka2023")) Theorems 1.1–1.2. For each fixed length at least five, Leng, Sah, and Sawhney obtained further density bounds, improving the earlier general coloring upper bounds #cite(label("lengSahSawhney2024")) Theorem 1.1.

For completeness, Theorem 22 gives a direct elementary lower bound with an explicit constant uniform over all lengths $k gt.eq 3$. Combining it with the coloring upper bound in the companion paper #cite(label("openaiArithmeticProgressions2026")) Equation (1.3) gives, for each integer $k gt.eq 3$, a constant $A_k gt.eq 1$ such that for every integer $r gt.eq 256$,

$ exp #h(-0.16667em) (frac(\( log r \)^2, 64 log 2)) < W_r \( k \) lt.eq ⌈exp #scale(x: 120%, y: 120%)[\(] A_k \( 2 + log r \)^(A_k) #scale(x: 120%, y: 120%)[\)]⌉ . $

Thus, for every fixed progression length $k gt.eq 3$, as integer $r$ tends to infinity, growth in the number of colors is superpolynomial but at most quasipolynomial: the lower bound gives $W_r \( k \) \/ r^D arrow.r oo$ for every fixed real $D > 0$, while the upper bound has logarithm at most a fixed power of $log r$. The upper constant and exponent may depend on $k$; no uniform bound on that dependence or matching logarithmic exponent is asserted. Appendix 8 gives an elementary recursive upper bound, including a proof of finiteness. This is a coarse version of the classical argument; quantitative upper bounds include Shelah’s primitive-recursive bound #cite(label("shelah1988")) and the bounds following from Gowers’s proof of Szemerédi’s theorem #cite(label("gowers2001")). The boundary cases are $W_1 \( k \) = k$, $W_r \( 1 \) = 1$, and $W_r \( 2 \) = r + 1$.

===== 1.2 The construction and its quantitative ingredient. <the-construction-and-its-quantitative-ingredient.>

We first construct a two-coloring of a cyclic group $bb(Z) \/ q^D bb(Z)$ with $q^D gt.eq k^(c k)$, where $q$ is a power of a prime exceeding $k$. Let $lambda$ be an integer dilation, to be chosen below. The homomorphisms

$ x_i \( n \) = n \/ q^i med \( mod med 1 \) \, #h(2em) y_i \( n \) = lambda x_i \( n \) \, #h(2em) 1 lt.eq i lt.eq D \, $

supply two systems of circle coordinates. Partition each coordinate circle into small intervals, and label a point by the tuple of intervals containing its coordinates. An outer color is assigned to each such label. The intervals for $y$ become finer near the cut used to select real representatives. We arrange that every $k$-term cyclic progression with nonzero step either contains a positive proportion of each outer color or has globally affine real representatives in the $y$ coordinates.

A heavily repeated label determines a short rational period $h$. The quantitative obstacle is to control such returns when the dimension grows with $k$: constants depending arbitrarily on the dimension would not suffice. The quantitative choice is to let $D$ grow and to make $lambda$ contain the full primary part, at every prime at most $D^2$, of every possible period $h lt.eq 2 ceil.l k^(1 \/ 2) ceil.r$. After dilation, each scalar rational period is either one or exceeds $D^2$. This separation permits a local test on entire period blocks. A key estimate counts the patterns through one specified label by $\( C D h \)^(6 D)$, with an absolute $C$ independent of $q$, $lambda$, and the width of the anchor interval. It follows by anchoring at one visit and counting affine comparisons in two scalar parameters at a time. This form of counting remains useful even when some intervals are arbitrarily small.

We attach an independent Bernoulli$\( p \)$ flip to each key consisting of a $y$-box and $floor.l parallel q tilde(y) parallel_2^2 floor.r$, where $p = k^(- 1 \/ 20)$ and $tilde(y) in \[ - 1 \/ 2 \, 1 \/ 2 \)^D$ is the centered representative. Here $parallel dot.op parallel_2$ is the Euclidean norm. Every occurrence of a key uses the same flip, and each key occurs at most four times along a progression. Making a progression rich in both outer colors monochromatic therefore requires many rare flips. In the possibly overlapping affine case, monochromaticity prescribes values for many distinct flip variables. The global label-word count, together with the three coefficients of the quadratic squared norm, gives only a small family of words of outer colors and actual keys; identical words prescribe the same event. With $D = ceil.l k^(1 \/ 10) ceil.r$, their logarithmic count is $O \( k^(9 \/ 10) log k \) = o \( p k \)$. The two resulting probability estimates eliminate every progression. A deterministic digit product then gives all $r gt.eq 2$.

The squared-norm geometry continues the tradition of Behrend’s construction #cite(label("behrend1946")); Green and Wolf #cite(label("greenWolf2010")) give a torus-annulus proof of Elkin’s refinement. For the asymmetric problem of excluding a red three-term progression and a blue long progression, Green #cite(label("green2022")) uses translates of a randomly perturbed ellipsoidal annulus, while Hunter #cite(label("hunter2022")) chooses annulus radii independently at many centers. Here the randomness is attached to coordinate boxes and integer squared-norm bands. Least-common-multiple dilations in cyclic groups appear in Fox and Hunter #cite(label("foxHunter2026")); digit carry control and finite-field norm colorings for a related symmetric-progression problem appear in Shi and Dong #cite(label("shiDong2026")). We prove all geometric, counting, and probabilistic ingredients needed here, including the finite local lemma.

===== 1.3 Organization. <organization.>

Section 2 fixes the cyclic group and the two meshes. Section 3 proves the global and anchored pattern counts, and Section 4 uses them to construct the outer coloring. Section 5 turns its local tests into the balanced-or-affine alternative. Section 6 introduces the norm-indexed perturbation and proves the cyclic two-color theorem. Section 7 transfers that theorem to integer intervals and all color counts, and proves the additional growth statements. Appendix 8 supplies the elementary finite upper bound.

== 2 The cyclic model and its coordinate meshes <sec:setup>

We now choose the cyclic group and the two coordinate partitions on which the two-color construction will be built. All logarithms without an indicated base are natural. Throughout the cyclic construction, $k$ is an integer exceeding an absolute threshold. Every constant implicit in $O \( dot.op \)$ is absolute unless an explicit subscript indicates otherwise, and every limiting assertion is as $k arrow.r oo$. In particular, no threshold in the construction depends on the eventual number of colors $r$.

Set

#[#set math.equation(numbering: n => "(2.1)")
 $ c = 10^(- 5) \, #h(2em) delta = 1 / 10 \, #h(2em) gamma = 1 / 100 \, #h(2em) D = ⌈k^(1 \/ 10)⌉ \, #h(2em) M = ⌈k^(1 \/ 2)⌉ \,\
h_0 = D^2 \, #h(2em) p = k^(- 1 \/ 20) \, #h(2em) H = k^(- 2) \, #h(2em) eta = frac(1, 1000 D) . $ <setup:parameters>]

We take $k$ large enough that $h_0 < 2 M < k$. The parameter $p$ will be the probability of a later perturbation. The integer dilation

#[#set math.equation(numbering: n => "(2.2)")
 $ lambda = product_(ell lt.eq h_0\
ell upright(" prime")) ell^(⌊log \( 2 M \) \/ log ell⌋) $ <setup:dilation-definition>]

removes the small prime factors of all periods at most $2 M$. Least-common-multiple dilations also occur in the cyclic constructions of Fox and Hunter #cite(label("foxHunter2026")). The primary-factor choice here is tailored to the growing dimension, as the next lemma records.

#thm([Lemma 2.1.])[
  (Dilation of short periods).  #emph[We have $log lambda lt.eq h_0 log \( 2 M \)$. If $1 lt.eq h lt.eq 2 M$, then every prime-power divisor of $h$ with prime at most $h_0$ divides $lambda$. Consequently, $h divides lambda$ whenever $h lt.eq h_0$, and, for every integer $t$, the denominator 
#[#set math.equation(numbering: n => "(2.3)")
 $ s = frac(h, gcd \( h \, lambda t \)) $ <setup:denominator>]

 is either $1$ or greater than $h_0$.]
] <setup:dilation>

#proof[
  Each factor in (2.2) is at most $2 M$, and there are at most $h_0$ factors. If $ell^a divides h lt.eq 2 M$, with $ell lt.eq h_0$, then $a lt.eq ⌊log \( 2 M \) \/ log ell⌋$. Thus the full $ell$-primary part of $h$ divides $lambda$, and hence also $gcd \( h \, lambda t \)$. All prime divisors of $s$ therefore exceed $h_0$. This proves the assertions, including the case $t = 0$, for which $s = 1$. ◻
]

#thm([Lemma 2.2.])[
  (An elementary prime bound).  #emph[For all sufficiently large integers $k$, there is a prime $P$ satisfying $k < P lt.eq 2 k^2$.]
] <setup:prime>

#proof[
  Put $n = k^2$. For a prime $ell$, write $v_ell \( a \)$ for the exponent of $ell$ in a positive integer $a$. Counting multiples of each power of $ell$ in the factorials gives
  $ v_ell binom(2 n, n) = sum_(a gt.eq 1) (⌊frac(2 n, ell^a)⌋ - 2 ⌊n / ell^a⌋) lt.eq ⌊log_ell \( 2 n \)⌋ \, $
  because each summand is $0$ or $1$ and vanishes for $ell^a > 2 n$. If every prime factor of $binom(2 n, n)$ were at most $k$, its value would consequently be at most $\( 2 n \)^k$. On the other hand, the central binomial coefficient is the largest of the $2 n + 1$ coefficients in $\( 1 + 1 \)^(2 n)$, so
  $ binom(2 n, n) gt.eq frac(4^n, 2 n + 1) . $
  For $n = k^2$, the logarithm of this lower bound is $k^2 log 4 - log \( 2 k^2 + 1 \)$, whereas that of $\( 2 n \)^k$ is $k log \( 2 k^2 \)$. The former is larger for all sufficiently large $k$. There is therefore a prime divisor $P > k$; it is at most $2 n$ because it divides $\( 2 n \) !$. ◻
]

Choose such a prime $P$, and let $q$ be the least power of $P$ that is at least $k^(c k \/ D)$. Minimality gives

#[#set math.equation(numbering: n => "(2.4)")
 $ k^(c k \/ D) lt.eq q lt.eq 2 k^2 k^(c k \/ D) \, #h(2em) c k log k lt.eq D log q lt.eq c k log k + D log \( 2 k^2 \) . $ <setup:q-bounds>]

Here $q$ is a prime power, and need not itself be prime. Since $h_0 < k < P$ for large $k$, (2.2) shows that $gcd \( lambda \, q \) = 1$. Define the remaining scales by

#[#set math.equation(numbering: n => "(2.5)")
 $ H_x = H / lambda \, #h(2em) alpha = q^(- \( D + 1 \)) . $ <setup:mesh-parameters>]

The parameter estimates used below include

#[#set math.equation(numbering: n => "(2.6)")
 $ D = O \( k^(1 \/ 10) \) \, quad M = O \( k^(1 \/ 2) \) \, quad log lambda = O \( k^(1 \/ 5) log k \) \, quad log q = O \( k^(9 \/ 10) log k \) . $ <setup:orders>]

These follow directly from (2.1), Lemma 2.1, (2.4).

Write $N = q^D$ and $G = bb(Z) \/ N bb(Z)$. We seek a two-coloring of $G$ with no monochromatic progression

#[#set math.equation(numbering: n => "(2.7)")
 $ n_j = n_0 + j d quad \( 0 lt.eq j < k \) \, #h(2em) n_0 \, d in G \, #h(2em) d eq.not 0 . $ <setup:cyclic>]

Every nonzero element of this prime-power cyclic group has order at least $P > k$, so the $k$ displayed terms are distinct. On the circle $bb(T) = bb(R) \/ bb(Z)$, equipped with its usual distance and circumference one, use the homomorphisms

#[#set math.equation(numbering: n => "(2.8)")
 $ x_i \( n \) = n / q^i med \( mod med 1 \) \, #h(2em) y_i \( n \) = lambda x_i \( n \) #h(2em) \( 1 lt.eq i lt.eq D \) . $ <setup:coordinates>]

They are well defined on $G$ since $q^i divides N$. Write $x \( n \) = \( x_i \( n \) \)_(i = 1)^D$ and $y \( n \) = \( y_i \( n \) \)_(i = 1)^D$, and fix their representatives

$ hat(x) \( n \) in \[ 0 \, 1 \)^D \, #h(2em) tilde(y) \( n \) in \[ - 1 \/ 2 \, 1 \/ 2 \)^D . $

The first coordinates will distinguish residue classes of a rational return period. The dilation in the second coordinates removes rational motion for periods at most $h_0$; the mesh near their representative cut will then allow us to prove a global affine lift in that case. The cut for the second representative system is the circle point $1 \/ 2 = - 1 \/ 2$. Its distance function is

#[#set math.equation(numbering: n => "(2.9)")
 $ rho \( Y \) = "dist"_(bb(T)) \( Y \, 1 \/ 2 \) . $ <setup:cut-distance>]

Thus $0 lt.eq rho lt.eq 1 \/ 2$, and $rho$ is $1$-Lipschitz.

The first partition, denoted $U$, consists of the intervals

$ \[ a H_x \, \( a + 1 \) H_x \) \, #h(2em) 0 lt.eq a < k^2 lambda . $

This is an exact partition of $\[ 0 \, 1 \)$ because $H_x^(- 1) = k^2 lambda$ is integral. The second partition becomes finer near its cut. The positive scale $alpha$ keeps this mesh finite; its choice will be compared with the discrete step lattice in the short-period argument of 17. Put

#[#set math.equation(numbering: n => "(2.10)")
 $ R = log (1 + frac(1, 2 alpha)) \, #h(2em) m = ⌈k^2 R⌉ \, #h(2em) a_ell = alpha #scale(x: 120%, y: 120%)[\(] e^(ell R \/ m) - 1 #scale(x: 120%, y: 120%)[\)] quad \( 0 lt.eq ell lt.eq m \) . $ <mesh:definition>]

The partition $V$ of $\[ - 1 \/ 2 \, 1 \/ 2 \)$ consists of

#[#set math.equation(numbering: n => "(2.11)")
 $ \[ - 1 \/ 2 + a_ell \, - 1 \/ 2 + a_(ell + 1) \) \, #h(2em) \[ 1 \/ 2 - a_(ell + 1) \, 1 \/ 2 - a_ell \) quad \( 0 lt.eq ell < m \) . $ <mesh:intervals>]

Since $a_0 = 0$ and $a_m = 1 \/ 2$, these $2 m$ intervals partition the representative interval. They assign zero to the interval on its right and the cut to the interval beginning at $- 1 \/ 2$. The same intervals also denote their images in $bb(T)$. Closures and neighborhoods of intervals will be taken on the circle; $\| I \|$ denotes arc length.

For a circle point, $U \( X \)$ or $V \( Y \)$ denotes its individual interval label, with the half-open conventions above. The full-label space and label maps are

#[#set math.equation(numbering: n => "(2.12)")
 $ cal(L) & = U^D times V^D \,\
L \( X \, Y \) & = #scale(x: 120%, y: 120%)[\(] \( U \( X_i \) \)_(i = 1)^D \, \( V \( Y_i \) \)_(i = 1)^D #scale(x: 120%, y: 120%)[\)] \,\
L \( n \) & = L \( x \( n \) \, y \( n \) \) . $ <setup:labels>]

In particular, the identity of a label specifies each interval itself, including its location on the circle.

#thm([Lemma 2.3.])[
  (Widths of the adaptive mesh).  #emph[For every $I in V$ and every $Y in overline(I)$, 
#[#set math.equation(numbering: n => "(2.13)")
 $ 1 / 4 H #scale(x: 120%, y: 120%)[\(] rho \( Y \) + alpha #scale(x: 120%, y: 120%)[\)] lt.eq \| I \| lt.eq 2 H #scale(x: 120%, y: 120%)[\(] rho \( Y \) + alpha #scale(x: 120%, y: 120%)[\)] lt.eq 2 H . $ <mesh:width-bounds>]

 Moreover, $\| V \| = 2 m = O \( k^3 log k \)$.]
] <mesh:width>

#proof[
  For large $k$ we have $alpha lt.eq 1 \/ 4$ and $R gt.eq 1$. If $theta = R \/ m$, the bounds $k^2 R lt.eq m lt.eq k^2 R + 1 lt.eq 2 k^2 R$ give $H \/ 2 lt.eq theta lt.eq H$. On either interval indexed by $ell$ in (2.11), the quantity $rho \( Y \) + alpha$ ranges, on the closure, between $b = alpha e^(ell theta)$ and $b e^theta$, while $\| I \| = b \( e^theta - 1 \)$. Hence
  $ 1 - e^(- theta) lt.eq frac(\| I \|, rho \( Y \) + alpha) lt.eq e^theta - 1 . $
  For $0 lt.eq theta lt.eq 1$, the outside expressions are bounded below by $theta \/ 2$ and above by $2 theta$, respectively. This proves the first two inequalities in (2.13); the last follows from $rho \( Y \) + alpha lt.eq 3 \/ 4 < 1$. Finally,
  $ R lt.eq \( D + 1 \) log q = O \( k log k \) $
  by (2.4), so $2 m lt.eq 2 k^2 R + 2 = O \( k^3 log k \)$. ◻
]

#thm([Lemma 2.4.])[
  (Uniform neighborhoods).  #emph[For $I in V$, let $w = \| I \|$ and 
$ N \( I \) = { Y in bb(T) : "dist"_(bb(T)) \( Y \, overline(I) \) lt.eq w } . $

 Every $J in V$ whose closure meets $N \( I \)$ satisfies $\| J \| gt.eq w \/ 16$. The arc $N \( I \)$ contains at most $49$ mesh endpoints.]
] <mesh:neighbors>

#proof[
  Fix $Y_0 in overline(I)$ and put $r_0 = rho \( Y_0 \) + alpha$. Every $Y in N \( I \)$ has circle distance at most $2 w$ from $Y_0$. By 4 and the Lipschitz property of $rho$,
  $ rho \( Y \) + alpha gt.eq r_0 - 2 w gt.eq \( 1 - 4 H \) r_0 gt.eq r_0 \/ 2 \, $
  where the last inequality holds for $H lt.eq 1 \/ 8$. Apply the lower width bound at a point of $overline(J) ∩ N \( I \)$ to obtain
  $ \| J \| gt.eq 1 / 8 H r_0 gt.eq w / 16 . $
  The arc $N \( I \)$ has length $3 w < 1$. In its linear ordering, successive mesh endpoints enclose a full mesh interval, of length at least $w \/ 16$ by the assertion just proved. If there are $b$ such endpoints, then $\( b - 1 \) w \/ 16 lt.eq 3 w$, so $b lt.eq 49$. ◻
]

For local counting in rotating coordinates, we ignore the fine mesh within distance $eta$ of the cut. Define the truncated output by

#[#set math.equation(numbering: n => "(2.14)")
 $ V_eta \( Y \) = cases(delim: "{", V \( Y \) \, & rho \( Y \) gt.eq eta \,, * \, & rho \( Y \) < eta \,) $ <mesh:truncation-definition>]

where $*$ is a symbol distinct from every interval label. In particular, equality at the threshold gives the actual interval label.

#thm([Lemma 2.5.])[
  (Local complexity after truncation).  #emph[On every circle arc of length at most $4 H$, the output $V_eta$ is constant between at most $16004 D$ breakpoints. Its value at a breakpoint is also determined, and need not equal either neighboring value.]
] <mesh:truncated>

#proof[
  The portion of the arc on which $rho gt.eq eta$ has at most two components. Within one component, successive mesh endpoints have spacing at least $H eta \/ 4$, by 4 applied at either endpoint of the intervening mesh interval. The number of mesh endpoints in these components is therefore at most $4 H \/ \( H eta \/ 4 \) + 2 = 16 \/ eta + 2$. Add the at most two threshold points $rho = eta$. Inside ${ rho < eta }$ the output is constant, so no other endpoints are needed. This gives at most $16 \/ eta + 4 = 16000 D + 4 lt.eq 16004 D$ breakpoints. At each breakpoint use the half-open convention for $V$ and the weak inequality in (2.14); this includes coincident mesh and threshold points. ◻
]

== 3 Counting global words and anchored local patterns <sec:counting>

All counts in this section are counts of literal interval labels. The central observation is that each scalar coordinate can be counted using an arrangement in two real parameters, even though the number $D$ of coordinates grows with $k$. We use the standard hyperplane-arrangement region count; see Stanley #cite(label("stanley2007")) Lemma 2.1 and Proposition 2.4. The elementary proof below also counts equality signs, which are needed for the half-open mesh intervals.

#thm([Lemma 3.1.])[
  (Affine comparisons, including equality).  #emph[Let $s$ affine hyperplanes be given in $bb(R)^e$, and record, for each hyperplane, the sign in ${ - \, 0 \, + }$ of a defining affine function. The number of realized joint sign vectors is at most 
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(d = 0)^e binom(s, d) sum_(j = 0)^(e - d) binom(s, j) lt.eq \( e + 1 \)^2 \( s + 1 \)^e . $ <count:arrangement-bound>]

 The same bound applies when the parameter space is restricted to an arbitrary subset of $bb(R)^e$.]
] <count:arrangement>

#proof[
  First count strict sign vectors. The complement of an arrangement has at most $sum_(j = 0)^e binom(s, j)$ regions. Indeed, when a new hyperplane is added, every region it splits meets that hyperplane in a different region of the induced arrangement, whose dimension is at most $e - 1$. Induction on $s$ and $e$, followed by Pascal’s identity, gives the stated bound. Repeated hyperplanes create no additional regions. A strict sign set is convex, and therefore connected when nonempty, so each strict sign vector corresponds to one region.
  Now consider a realized sign vector with zero entries, and let $A$ be the affine intersection of its zero hyperplanes. If $A$ has codimension $d$, then $d$ of those equations with linearly independent normals already define $A$: consistency at a point of $A$ makes every remaining zero equation a consequence of the selected equations. There are at most $binom(s, d)$ ways to select them. On $A$, every hyperplane containing $A$ has forced zero sign; the remaining hyperplanes impose strict signs in dimension $e - d$. The strict-region bound on $A$, and a sum over $d$, prove the first inequality in (3.1). For each summand, $binom(s, d) binom(s, j) lt.eq \( s + 1 \)^(d + j) lt.eq \( s + 1 \)^e$; there are at most $\( e + 1 \)^2$ summands. Restricting the parameter space can only remove sign vectors. ◻
]

#thm([Lemma 3.2.])[
  (Global label words).  #emph[Let $T_(upright("glob"))$ be the number of words $#scale(x: 120%, y: 120%)[\(] L \( n_j \) #scale(x: 120%, y: 120%)[\)]_(0 lt.eq j < k)$ arising from the progressions in (2.7). Then 
#[#set math.equation(numbering: n => "(3.2)")
 $ log T_(upright("glob")) = O #scale(x: 120%, y: 120%)[\(] D \( log k + log lambda \) #scale(x: 120%, y: 120%)[\)] = O \( k^(3 \/ 10) log k \) = o \( M \) . $ <count:global-bound>]

]
] <count:global>

#proof[
  Consider any circle partition with $F$ endpoints, including its representative cut, and freely choose a scalar start and step $a \, b in \[ 0 \, 1 \)$. For $0 lt.eq j < k$, the unreduced value $a + j b$ belongs to $\[ 0 \, k \)$. Represent the partition endpoints by numbers $tau in \[ 0 \, 1 \)$. The interval containing $\( a + j b \) med mod med 1$ is determined by its comparisons with all $tau + z$ for $- 1 lt.eq z lt.eq k$. The comparisons for all $j$ use at most $3 k^2 F$ lines in the two parameters $a \, b$. Equality signs give precisely the assigned half-open labels, so 7 bounds the number of scalar words by $9 \( 3 k^2 F + 1 \)^2$.
  Apply this bound separately in all $2 D$ scalar coordinates, allowing their starts and steps to vary independently. This enlarges the collection of possible words, and is therefore an upper bound for the actual coordinate homomorphisms. We can take
  $ F = \| U \| + \| V \| = k^2 lambda + O \( k^3 log k \) . $
  Since $lambda gt.eq 1$, we have $log F = O \( log k + log lambda \)$, and thus
  $ T_(upright("glob")) lt.eq #scale(x: 120%, y: 120%)[\[] 9 \( 3 k^2 F + 1 \)^2 #scale(x: 120%, y: 120%)[\]]^(2 D) . $
  This proves the first bound in (3.2) with an absolute constant. The remaining bounds follow from (2.6) and $M gt.eq k^(1 \/ 2)$. ◻
]

For the local patterns fix an integer $h$ with $h_0 < h lt.eq 2 M$ and $t in { 0 \, dots.h \, h - 1 }^D$. In coordinate $i$ let

#[#set math.equation(numbering: n => "(3.3)")
 $ s_i = frac(h, gcd \( h \, lambda t_i \)) . $ <count:coordinate-periods>]

Call that second-system coordinate #emph[stationary] if $s_i = 1$, and #emph[rotating] otherwise. By 2, a rotating coordinate has $s_i > h_0$. These descriptions depend only on $h \, t$. Stationarity concerns the rational step and permits nonzero drift; even a period $h > h_0$ may have only stationary second coordinates.

We now define an enlarged family of full return-period blocks whose labels can be balanced before the outer coloring is chosen. 5 will verify membership for every actual full block with $h > h_0$ containing a position whose full label occurs more than $k \/ M$ times in the whole progression.

#prodef([Definition 3.3.])[
  (Eligible local patterns).  Choose $x \, y in bb(T)^D$ and $u \, v in bb(R)^D$, and form
  #[#set math.equation(numbering: n => "(3.4)")
   $ X_z = x + z / h \( t + u \) \, #h(2em) Y_z = y + z / h \( lambda t + v \) #h(2em) \( 0 lt.eq z < h \) quad upright("in ") bb(T)^D . $ <count:local-paths>]
  A position $z$ is #emph[regular] if $rho \( Y_(z \, i) \) gt.eq eta$ in every rotating coordinate; if there are no rotating coordinates, every position is regular. Record $L \( X_z \, Y_z \)$ at a regular position and a dummy symbol $*$ otherwise. The resulting word in $\( cal(L) union { * } \)^h$ is #emph[eligible for $h \, t$] if it admits a realization satisfying all of the following:
  + At least $h \/ 2$ positions are regular, and the full labels at those positions are pairwise distinct.
  + $\| u_i \| lt.eq H_x$ for every $i$, and $\| v_i \| lt.eq H$ in every rotating coordinate.
  + In every stationary coordinate $i$, one has $\| v_i \| lt.eq \| V \( Y_(z \, i) \) \|$ at every regular position $z$.
  The recorded word is the pattern; different realizations of one word do not define additional patterns.
] <count:eligible>

The stationary drift bound is relative to interval width because those intervals may be arbitrarily fine. This is the condition that makes the following count independent of the anchor’s width.

#thm([Lemma 3.4.])[
  (Local patterns through a specified label).  #emph[There is an absolute constant $C$ such that, for every $h_0 < h lt.eq 2 M$ and every full label $beta in cal(L)$, the number of pairs consisting of $t in { 0 \, dots.h \, h - 1 }^D$ and an eligible pattern for $h \, t$ containing $beta$ is at most 
#[#set math.equation(numbering: n => "(3.5)")
 $ \( C D h \)^(6 D) . $ <count:local-bound>]

 The constant is independent of $q$, $lambda$, $beta$, and $D$.]
] <count:local>

#proof[
  Fix $t$ and a position $z_0$ at which the recorded pattern equals $beta$. That position is regular. In each scalar coordinate, re-anchor the path at $z_0$: let $a$ be the real representative of that coordinate at $z_0$, in the interval specified by $beta$, and let $b$ be its drift variable, either $u_i$ or $v_i$. At a target position $z$, an unreduced representative is
  #[#set math.equation(numbering: n => "(3.6)")
   $ a + tau_z + frac(z - z_0, h) b \, #h(2em) tau_z = frac(\( z - z_0 \) t_i, h) quad upright("or") quad tau_z = frac(\( z - z_0 \) lambda t_i, h) \, $ <count:anchored-scalar>]
  as appropriate. The translation $tau_z$ is fixed once $t \, z_0 \, z \, i$ are fixed. We retain only the restrictions on $a \, b$ implied at the anchor, since discarding other restrictions can only increase the number of outputs. The following three cases bound this number.
  #emph[First-system coordinates.] Here $a$ ranges over an interval of length $H_x$ and $\| b \| lt.eq H_x$. Since $\| z - z_0 \| \/ h < 1$, the target range is contained in a fixed real interval of length at most $3 H_x$. The real lifts of $U$-endpoints form a lattice of spacing $H_x$, so at most four endpoints meet this range.
  #emph[Stationary second-system coordinates.] Write $I = V \( Y_(z_0 \, i) \)$. The retained drift bound is $\| b \| lt.eq \| I \|$, by the restriction at the regular anchor. Also $lambda t_i \/ h$ is integral, so the translation $tau_z$ is integral. Modulo one every target belongs to $N \( I \)$ from 5, and at most $49$ mesh endpoints are relevant. The unreduced target range lies in an interval of length at most $3 \| I \| < 1$, so each relevant circle endpoint has at most one lift in that range.
  #emph[Rotating second-system coordinates.] The anchor interval has width at most $2 H$ and the retained drift bound is $\| b \| lt.eq H$. The target range has length at most $4 H < 1$. Apply 6 to its image on the circle: at most $16004 D$ breakpoints determine the truncated output $V_eta$. Again each circle breakpoint has at most one lift in the real target range.
  In each case, the enclosing target interval and the finite list of breakpoint lifts are fixed before $a \, b$ are varied. In particular, the magnitude of the fixed translation $tau_z$ introduces no factor in the count. Each comparison with a breakpoint lift is an affine line in $\( a \, b \)$. Taken over $0 lt.eq z < h$, there are at most $16004 D h$ such lines per scalar coordinate. On the allowed parameter rectangle, their signs determine the scalar output at every target. They determine values at breakpoints as well as on open intervals; this accounts for half-open endpoints and for exact equalities $rho = eta$.
  By 7 with $e = 2$, the number of possible scalar output sequences is at most
  $ 9 \( 16004 D h + 1 \)^2 lt.eq C_0 \( D h \)^2 $
  for an absolute $C_0$. Take the product of these bounds for all $2 D$ coordinates, truncating only rotating second-system coordinates. Those scalar outputs determine the complete recorded pattern: a position is dummy exactly when at least one rotating output is $*$; at all other positions the outputs specify the full label. No additional choice of a regular-position mask is needed.
  There are $h^D$ choices of $t$ and at most $h$ choices of the anchor $z_0$. Therefore the required number is at most
  $ h^(D + 1) #scale(x: 120%, y: 120%)[\[] C_0 \( D h \)^2 #scale(x: 120%, y: 120%)[\]]^(2 D) = C_0^(2 D) D^(4 D) h^(5 D + 1) lt.eq \( C D h \)^(6 D) \, $
  where the last inequality holds for an absolute $C$, since $D gt.eq 1$. All eligible patterns containing $beta$ have at least one such anchor and are included in this count. ◻
]

== 4 An outer coloring of the labels <sec:outer>

The pattern counts allow one coloring of $cal(L)$ to balance all the tests needed below. For a fixed cyclic progression as in (2.7), call a full label #emph[light] if its multiplicity in the progression is at most $k \/ M$, and #emph[heavy] otherwise. A position has the same designation as its label. These designations always refer to the whole progression, even when we later examine a short block of its positions.

We first give the probabilistic tool, in its finite asymmetric form. For the origins of the local lemma, see Erdős and Lovász #cite(label("erdosLovasz1975")); the proof of the form used here is included.

#thm([Lemma 4.1.])[
  (Finite asymmetric local lemma).  #emph[Let $cal(E)$ be a finite family of events. Suppose a graph on $cal(E)$, with neighbor sets $Gamma \( E \)$, has the property that each $E$ is independent of the sigma-algebra generated by the events outside ${ E } union Gamma \( E \)$. If numbers $z_E in \( 0 \, 1 \)$ satisfy 
#[#set math.equation(numbering: n => "(4.1)")
 $ bb(P) \( E \) lt.eq z_E product_(F in Gamma \( E \)) \( 1 - z_F \) #h(2em) \( E in cal(E) \) \, $ <outer:lll-condition>]

 then $bb(P) \( ⋂_(E in cal(E)) E^c \) > 0$.]
] <outer:lll>

#proof[
  For $T subset.eq cal(E)$, write $A_T = ⋂_(F in T) F^c$. We prove simultaneously, by induction on $\| T \|$, that
  #[#set math.equation(numbering: n => "(4.2)")
   $ bb(P) \( A_T \) > 0 \, #h(2em) bb(P) \( E divides A_T \) lt.eq z_E quad upright("for every ") E in.not T . $ <outer:conditional>]
  For $T = diameter$, positivity is immediate and the conditional bound follows from (4.1). Suppose the assertions are known for smaller sets. Removing any $F in T$ and applying the conditional bound gives
  $ bb(P) \( A_T \) = bb(P) \( A_(T \\ { F }) \) #scale(x: 120%, y: 120%)[\(] 1 - bb(P) \( F divides A_(T \\ { F }) \) #scale(x: 120%, y: 120%)[\)] > 0 . $
  To prove the conditional bound for $E in.not T$, put $T_1 = T ∩ Gamma \( E \)$ and $T_2 = T \\ T_1$. If $T_1 = diameter$, independence gives $bb(P) \( E divides A_T \) = bb(P) \( E \) lt.eq z_E$ directly. Otherwise, order the members of $T_1$ and condition successively on their complements, starting with $A_(T_2)$. Each conditioning set has size at most $\| T \| - 1$, so the induction hypothesis yields
  $ bb(P) \( A_(T_1) divides A_(T_2) \) gt.eq product_(F in T_1) \( 1 - z_F \) . $
  Using independence from $T_2$ in the numerator, we obtain
  $ bb(P) \( E divides A_T \) lt.eq frac(bb(P) \( E divides A_(T_2) \), bb(P) \( A_(T_1) divides A_(T_2) \)) lt.eq frac(bb(P) \( E \), product_(F in T_1) \( 1 - z_F \)) lt.eq z_E . $
  The last inequality uses (4.1) and $T_1 subset.eq Gamma \( E \)$. This completes the induction; take $T = cal(E)$ for the conclusion. ◻
]

#thm([Proposition 4.2.])[
  (Balanced outer coloring).  #emph[For all sufficiently large $k$, there is a map $c_(*) : cal(L) arrow.r { 0 \, 1 }$ with the following properties.]
  + #emph[In every cyclic progression having at least $delta k$ light positions, each bit occurs on at least one quarter of its light positions when labels are colored by $c_(*)$.]
  + #emph[In every eligible recorded pattern of 9, each bit occurs on at least one quarter of its regular positions.]
  #emph[The threshold on $k$ is absolute.]
] <outer:coloring>

#proof[
  Assign to every $beta in cal(L)$ an independent uniform random bit $xi_beta$. We introduce two finite families of bad events.
  For the first family, take each distinct full-label word of a cyclic progression with $L_0 gt.eq delta k$ light positions. Let $w_max$ be the largest multiplicity of a light label. Order the light positions by grouping equal labels together, with all choices fixed as functions of the word. Distribute the resulting list cyclically among $w_max$ rows. A group has at most $w_max$ positions, so a label occurs at most once in each row. Every row has at least
  #[#set math.equation(numbering: n => "(4.3)")
   $ ⌊L_0 / w_max⌋ gt.eq delta M - 1 $ <outer:row-size>]
  positions, because $w_max lt.eq k \/ M$. For each row let its bad event be that some bit occurs on strictly fewer than one quarter of its positions. There are at most $k T_(upright("glob"))$ such events in total, where $T_(upright("glob"))$ is the number in 8.
  For the second family, take one event for each eligible recorded pattern and its discrete parameters $h \, t$, where $h_0 < h lt.eq 2 M$. Its bad event is that some bit occurs on strictly fewer than one quarter of the regular positions. The tested labels are pairwise distinct by eligibility, and their number is at least $h \/ 2$. Dummy positions use no variables. Although the realizations of the patterns have real parameters, these event families are finite: $cal(L)$, the word lengths, and the choices of $h \, t$ are all finite.
  Each event $E$ thus tests $l \( E \)$ distinct independent label variables. If $X$ is the number of ones among $l = l \( E \)$ such variables, then
  $ bb(E) e^(plus.minus \( X - l \/ 2 \)) = \( cosh \( 1 \/ 2 \) \)^l lt.eq e^(l \/ 8) . $
  Indeed, $\( 2 j \) ! gt.eq 2^j j !$ gives $cosh t lt.eq e^(t^2 \/ 2)$ by termwise comparison of the power series. Markov’s inequality for the two deviations from $l \/ 2$ consequently gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ bb(P) \( E \) lt.eq bb(P) \( X - l \/ 2 lt.eq - l \/ 4 \) + bb(P) \( X - l \/ 2 gt.eq l \/ 4 \) lt.eq 2 e^(- l \( E \) \/ 8) . $ <outer:tail>]
  The weak tail inequalities also cover the strict inequalities defining the bad events, regardless of divisibility of $l$ by four.
  Give $E$ the weight $z_E = e^(- l \( E \) \/ 32)$. By Lemma 3.2, (4.3), the total weight of all first-family events is at most
  #[#set math.equation(numbering: n => "(4.5)")
   $ k T_(upright("glob")) e^(- \( delta M - 1 \) \/ 32) = o \( 1 \) . $ <outer:first-weight>]
  For a fixed label $beta$, 10 bounds the second-family weight of events using $xi_beta$ by
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(h_0 < h lt.eq 2 M) \( C D h \)^(6 D) e^(- h \/ 64) lt.eq sum_(h > D^2) \( C D h \)^(6 D) e^(- h \/ 64) = o \( 1 \) . $ <outer:second-weight>]
  To see the last estimate uniformly, take $C gt.eq 1$. The function $log \( C D h \) \/ h$ is decreasing for $h gt.eq D^2$ once $D$ is large, and hence
  $ sup_(h > D^2) frac(6 D log \( C D h \), h) lt.eq frac(6 log \( C D^3 \), D) = o \( 1 \) . $
  For all sufficiently large $k$, each summand in the infinite sum in (4.6) is therefore at most $e^(- h \/ 128)$. Its tail tends to zero as $D arrow.r oo$.
  It follows from (4.5), (4.6) that, uniformly over all labels $beta$,
  #[#set math.equation(numbering: n => "(4.7)")
   $ sum_(E : thin xi_beta upright(" is used by ") E) z_E lt.eq 1 / 500 $ <outer:incident-weight>]
  for all sufficiently large $k$. Join two distinct events whenever their supports share a label variable. Since all label bits are independent, this is a dependency graph of the kind required in 11; independence holds from the joint sigma-algebra of all nonneighbors. By summing (4.7) over the $l \( E \)$ labels used by $E$, we have
  $ sum_(F in Gamma \( E \)) z_F lt.eq frac(l \( E \), 500) . $
  The lower bounds $l \( E \) gt.eq delta M - 1$ in the first family and $l \( E \) gt.eq h \/ 2 > D^2 \/ 2$ in the second ensure that $l \( E \) gt.eq 100$ eventually. In particular $z_E < 1 \/ 2$. Since $log \( 1 - z \) gt.eq - 2 z$ for $0 lt.eq z lt.eq 1 \/ 2$, we obtain
  #[#set math.equation(numbering: n => "(4.8)")
   $ z_E product_(F in Gamma \( E \)) \( 1 - z_F \) & gt.eq exp #h(-0.16667em) [- (1 / 32 + 2 / 500) l \( E \)]\
 & gt.eq 2 e^(- l \( E \) \/ 8) gt.eq bb(P) \( E \) . $ <outer:criterion>]
  For the second inequality, the positive difference $1 \/ 8 - 1 \/ 32 - 2 \/ 500$ multiplied by $100$ exceeds $log 2$. Thus 11 gives a choice of all label bits avoiding every bad event. Fix that choice as $c_(*)$. Summing the balanced row counts over the partition of the light positions proves part (i); the second event family gives part (ii). All estimates used absolute constants and depended only on $k$, so the threshold is absolute. ◻
]

Fix such a coloring from now on, and define its pullback to the group by

#[#set math.equation(numbering: n => "(4.9)")
 $ c_0 \( n \) = c_(*) \( L \( n \) \) #h(2em) \( n in G \) . $ <outer:pullback>]

== 5 Repeated labels and the outer-color dichotomy <sec:dichotomy>

We show that every cyclic progression either receives many occurrences of each outer bit or admits one affine lift in the centered second coordinates. The issue is repeated labels: a closest return to a heavy label identifies a rational period and a small drift. Short periods disappear under the dilation, while longer periods supply the eligible patterns tested in 12.

#thm([Lemma 5.1.])[
  (Affinity inside a small box).  #emph[Let $z_j = a + j b$ in $bb(T)^e$, for $0 lt.eq j < k$, and let $J subset.eq { 0 \, dots.h \, k - 1 }$. Suppose real representatives $Z_j in bb(R)^e$, $j in J$, lie in one box whose coordinate intervals have length at most $2 H$. If $2 k H < 1$, there are $A \, B in bb(R)^e$ such that $Z_j = A + j B$ for every $j in J$.]
] <dichotomy:affinity>

#proof[
  For any $j_1 < j_2 < j_3$ in $J$, affinity modulo one implies that
  $ \( j_3 - j_2 \) \( Z_(j_2) - Z_(j_1) \) - \( j_2 - j_1 \) \( Z_(j_3) - Z_(j_2) \) in bb(Z)^e . $
  In each coordinate its absolute value is at most $2 H \( j_3 - j_1 \) lt.eq 2 k H < 1$, so it is zero. Thus every triple has the same affine interpolation. If $\| J \| gt.eq 2$, interpolate between its smallest and largest indices to obtain $A \, B$; the triple identity places every remaining point on that interpolation. For at most two indices the conclusion follows directly, including the empty case. ◻
]

Fix a cyclic progression $n_j = n_0 + j d$, $0 lt.eq j < k$, with a heavy label. In the next three lemmas the terms #emph[light] and #emph[heavy] refer to this fixed progression.

#thm([Lemma 5.2.])[
  (Closest return and drift).  #emph[Choose a heavy label and let $J$ be its set of occurrence indices, with $m_(*) = \| J \| > k \/ M$. Let $h$ be the smallest positive difference between two members of $J$, attained at $j'$ and $j' + h$. Set 
$ u = hat(x) \( n_(j' + h) \) - hat(x) \( n_(j') \) \, #h(2em) v = tilde(y) \( n_(j' + h) \) - tilde(y) \( n_(j') \) . $

 Then, for sufficiently large $k$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ 1 lt.eq h lt.eq 2 M \,\
\| u_i \| lt.eq frac(H_x, m_(*) - 1) lt.eq frac(2 M H_x, k) \, #h(2em) \| v_i \| lt.eq frac(2 H, m_(*) - 1) lt.eq frac(4 M H, k) quad \( 1 lt.eq i lt.eq D \) \, $ <dichotomy:drift-bounds>]

 and $v = lambda u$ as real vectors.]
] <dichotomy:drift>

#proof[
  For large $k$, the inequality $m_(*) > k \/ M$ gives $m_(*) - 1 gt.eq k \/ \( 2 M \)$. Write $j_(-) = min J$ and $j_(+) = max J$. The smallest of the $m_(*) - 1$ consecutive gaps in $J$ satisfies
  $ h lt.eq frac(j_(+) - j_(-), m_(*) - 1) lt.eq frac(k - 1, m_(*) - 1) lt.eq 2 M . $
  All vectors $\( hat(x) \( n_j \) \, tilde(y) \( n_j \) \)$, $j in J$, lie in one full-label box, whose coordinate widths are at most $2 H$ by 4. By 13, their differences are proportional to differences of indices. In particular the difference at the chosen gap $h$ is $h \/ \( j_(+) - j_(-) \)$ times the difference between the two extreme visits. The latter has first-coordinate absolute differences at most $H_x$ and second-coordinate absolute differences at most $2 H$. This proves (5.1).
  The identity $y = lambda x$ on the torus implies $v - lambda u in bb(Z)^D$. Since $lambda H_x = H$,
  $ \| v_i - lambda u_i \| lt.eq frac(6 M H, k) < 1 $
  for large $k$. Every coordinate of this integer vector is therefore zero. ◻
]

#thm([Lemma 5.3.])[
  (Rational path and separated residues).  #emph[With $h \, u \, v$ as in 14, there is $t in { 0 \, dots.h \, h - 1 }^D$ such that 
#[#set math.equation(numbering: n => "(5.2)")
 $ x \( n_j \) & = x \( n_0 \) + j / h \( t + u \) \,\
y \( n_j \) & = y \( n_0 \) + j / h \( lambda t + v \) #h(2em) upright("in ") bb(T)^D quad \( 0 lt.eq j < k \) . $ <dichotomy:path-equations>]

 Moreover $gcd \( t_1 \, dots.h \, t_D \, h \) = 1$, and indices incongruent modulo $h$ have distinct full labels. Consequently, all occurrences of any one full label lie in a single residue class modulo $h$.]
] <dichotomy:path>

#proof[
  Since $h x \( d \) = u$ modulo $bb(Z)^D$, the vector $t' = h hat(x) \( d \) - u$ is integral. Reduce it coordinatewise modulo $h$ to obtain $t$. The first equality in (5.2) follows; multiplication by $lambda$ and the real identity $v = lambda u$ give the second.
  Suppose an integer $e > 1$ divides $h$ and every $t_i$. It also divides every $t'_i$, because $t' - t in h bb(Z)^D$. Hence the torus displacements from index $j'$ to index $j' + h \/ e$ are $u \/ e$ and $v \/ e$ in the first and second systems. The vector
  $ \( hat(x) \( n_(j') \) \, tilde(y) \( n_(j') \) \) + 1 / e \( u \, v \) $
  is a convex combination of the representatives at $j'$ and $j' + h$. Their common full-label box is a product of half-open real intervals and is convex. This vector therefore lies in that same box and is the chosen representative of the sample at $j' + h \/ e$. It gives an additional visit to the label at a strictly smaller positive gap $h \/ e$, a contradiction. This proves the gcd assertion.
  The torus vector $t \/ h$ has order exactly $h$: if $h$ divides all $a t_i$, the gcd assertion and Bézout’s identity imply $h divides a$. Take any $j_1 \, j_2 in { 0 \, dots.h \, k - 1 }$ incongruent modulo $h$. In at least one coordinate the rational displacement $\( j_1 - j_2 \) t_i \/ h$ has circle distance at least $1 \/ h$ from zero. The drift in that coordinate has absolute value at most
  $ frac(k \| u_i \|, h) lt.eq frac(2 M H_x, h) lt.eq frac(2 M H, h) . $
  By the triangle inequality on the circle the actual displacement has distance at least
  $ frac(1 - 2 M H, h) gt.eq frac(1 - 2 M H, 2 M) > H gt.eq H_x $
  for sufficiently large $k$. Two samples in the same $U$ interval have circle distance at most $H_x$, so these samples cannot have the same full label. ◻
]

#thm([Lemma 5.4.])[
  (Drift relative to every heavy interval).  #emph[For every heavy index $j_(*)$ of the fixed progression and each $1 lt.eq i lt.eq D$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ \| v_i \| lt.eq frac(2 M, k) thin \| V \( y_i \( n_(j_(*)) \) \) \| . $ <dichotomy:relative-width>]

 The heavy label here need not be the one used to choose $h$.]
] <dichotomy:heavy-width>

#proof[
  Let the full label at $j_(*)$ have multiplicity $m' > k \/ M$, and let $j_(-)$ and $j_(+)$ be its extreme occurrence indices. By 15, $j_(+) - j_(-) = a h$ for an integer $m' - 1 lt.eq a < k \/ h$. Set $L_i = \| V \( y_i \( n_(j_(*)) \) \) \|$. The real representative difference
  $ Delta_i = tilde(y)_i \( n_(j_(+)) \) - tilde(y)_i \( n_(j_(-)) \) $
  has $\| Delta_i \| lt.eq L_i lt.eq 2 H$. From (5.2), it is congruent to $a v_i$ modulo one. On the other hand,
  $ \| a v_i \| lt.eq frac(4 M H, h) \, #h(2em) \| Delta_i - a v_i \| lt.eq 2 H + frac(4 M H, h) < 1 $
  for large $k$. The integer $Delta_i - a v_i$ is zero. Therefore
  $ \| v_i \| lt.eq L_i / a lt.eq frac(L_i, m' - 1) lt.eq frac(2 M, k) L_i \, $
  as claimed. This argument uses only the two endpoint representatives; it requires no assertion about the intervening path across a cut. ◻
]

#thm([Theorem 5.5.])[
  (Outer-color dichotomy).  #emph[For every sufficiently large $k$, the coloring $c_0$ from (4.9) has the following property. Every cyclic progression $n_j = n_0 + j d$, $0 lt.eq j < k$, with $d eq.not 0$ in $G$, satisfies at least one of these alternatives:]
  + #emph[each bit occurs among $c_0 \( n_0 \) \, dots.h \, c_0 \( n_(k - 1) \)$ at least $gamma k$ times;]
  + #emph[there are $A \, B in bb(R)^D$ such that $tilde(y) \( n_j \) = A + j B$ for all $0 lt.eq j < k$.]
  #emph[The threshold on $k$ is absolute.]
] <dichotomy:main>

#proof[
  If the progression has at least $delta k$ light positions, 12(i) supplies at least $delta k \/ 4 gt.eq gamma k$ occurrences of each bit. We may therefore assume that fewer than $delta k$ positions are light. There is a heavy label, and Lemma 5.2, Lemma 5.3, Lemma 5.4 provide $h \, t \, u \, v$ with all the properties proved above.
  ===== 5.1 Short periods. <short-periods.>
  Suppose $h lt.eq h_0$. The definition of the dilation gives $h divides lambda$. Thus the second path in (5.2) has real step $w = v \/ h$ modulo one, because $lambda t \/ h$ is integral. Its total coordinate motion satisfies
  #[#set math.equation(numbering: n => "(5.4)")
   $ k \| w_i \| lt.eq frac(4 M H, h) < 1 / 2 $ <dichotomy:short-motion>]
  for large $k$. The congruence $w_i = y_i \( d \)$ modulo one also gives $w_i in q^(- i) bb(Z)$: a representative of $y_i \( d \)$ is an integral multiple of $q^(- i)$, and adding an integer preserves this lattice. In particular,
  #[#set math.equation(numbering: n => "(5.5)")
   $ w_i eq.not 0 quad arrow.r.double quad \| w_i \| gt.eq q^(- i) gt.eq q^(- D) gt.eq alpha . $ <dichotomy:step-lattice>]
  Consider the real segment $tilde(y)_i \( n_0 \) + tau w_i$, $0 lt.eq tau lt.eq k - 1$. If the sampled centered representatives fail to equal $tilde(y) \( n_0 \) + j w$, some coordinate has $w_i eq.not 0$ and this closed segment meets a cut point in $1 \/ 2 + bb(Z)$. The word #emph[closed] includes a cut met at the initial or final sample, so both directions of motion and exact cut hits are covered. Each sampled point is then within real distance $k \| w_i \|$ of such a cut point, giving $rho \( y_i \( n_j \) \) lt.eq k \| w_i \|$ for every $j$. By Lemma 2.3, (5.5),
  $ \| V \( y_i \( n_j \) \) \| lt.eq 2 H #scale(x: 120%, y: 120%)[\(] rho \( y_i \( n_j \) \) + alpha #scale(x: 120%, y: 120%)[\)] lt.eq 2 H \( k + 1 \) \| w_i \| < \| w_i \| . $
  Yet (5.4) implies that any two distinct sampled points in this coordinate have circle distance $\| j - j' \| thin \| w_i \| gt.eq \| w_i \|$: the entire real displacement is less than one half. They cannot belong to a common $V$ interval of width less than $\| w_i \|$. All full labels would therefore be distinct, contradicting the heavy label. Hence every sampled representative equals $tilde(y) \( n_0 \) + j w$, proving alternative (ii).
  ===== 5.2 Longer periods. <longer-periods.>
  Suppose $h_0 < h lt.eq 2 M$. Partition the first $h ⌊k \/ h⌋$ indices into consecutive full blocks of length $h$; the remaining block has fewer than $h$ indices. A full block starting at $j_0$ has exactly the form in 9, with starting points $x \( n_(j_0) \) \, y \( n_(j_0) \)$ and the same $h \, t \, u \, v$. We verify its regularity and, when it contains a heavy index, every condition of eligibility.
  For a rotating coordinate $i$, let $s_i = h \/ gcd \( h \, lambda t_i \) > h_0$. Without the drift, the $h$ values
  $ y_i \( n_(j_0) \) + frac(z lambda t_i, h) \, #h(2em) 0 lt.eq z < h \, $
  run through an equally spaced grid of $s_i$ circle points, each exactly $h \/ s_i$ times. The actual value at $z$ is within $\| v_i \| lt.eq 4 M H \/ k < eta$ of this grid value. If the actual position is nonregular in this coordinate, its grid value is within $2 eta$ of the cut. An arc of length $4 eta$ contains at most $4 eta s_i + 1$ points of an $s_i$-point grid. This bound remains valid when endpoints are included. Consequently the fraction of positions excluded by this coordinate is at most $4 eta + 1 \/ s_i$. A union bound over rotating coordinates shows that the fraction of nonregular positions is at most
  #[#set math.equation(numbering: n => "(5.6)")
   $ D (4 eta + 1 / h_0) = 4 / 1000 + 1 / D < 1 / 2 . $ <dichotomy:regular-fraction>]
  Thus each full block has at least $h \/ 2$ regular positions. All labels within the block are distinct by 15, since its indices have distinct residues modulo $h$. Also $\| u_i \| lt.eq H_x$ and $\| v_i \| lt.eq H$ for all $i$ by (5.1), for sufficiently large $k$.
  Now use any full block containing a heavy index $j_(*)$. Fix a stationary coordinate $i$ and write $I_(*) = V \( y_i \( n_(j_(*)) \) \)$, $L_(*) = \| I_(*) \|$. Its rational step $lambda t_i \/ h$ is integral, so for every index $j$ in the block,
  $ "dist"_(bb(T)) #scale(x: 120%, y: 120%)[\(] y_i \( n_j \) \, y_i \( n_(j_(*)) \) #scale(x: 120%, y: 120%)[\)] lt.eq frac(\| j - j_(*) \|, h) \| v_i \| lt.eq \| v_i \| lt.eq frac(2 M, k) L_(*) . $
  For large $k$ this places $y_i \( n_j \)$ in the circular $L_(*)$-neighborhood of $overline(I_(*))$. Applying 5 with $I = I_(*)$ and $J = V \( y_i \( n_j \) \)$ gives
  $ \| V \( y_i \( n_j \) \) \| gt.eq L_(*) / 16 gt.eq \| v_i \| \, $
  where the final inequality uses $2 M \/ k lt.eq 1 \/ 16$ and (5.3). This holds at every block position, in particular at each regular position as eligibility requires. The heavy index $j_(*)$ need not itself be regular: it serves only to provide the interval $I_(*)$ and the relative drift estimate. The neighborhood statement uses closures, so a cut crossing or an endpoint equality causes no change in this verification.
  Every full block containing a heavy index is therefore eligible. By 12(ii) and (5.6), it contributes at least $h \/ 8$ occurrences of each bit. A full block not used in this way consists entirely of light positions. Since fewer than $delta k$ positions are light in the entire progression, and fewer than $h$ positions lie in the remainder, the used full blocks cover at least
  $ k - h - delta k gt.eq 4 / 5 k $
  positions for sufficiently large $k$, using $h lt.eq 2 M = o \( k \)$. Each bit consequently occurs at least $k \/ 10 gt.eq gamma k$ times. This proves alternative (i) and completes the dichotomy. All inequalities imposed only absolute lower bounds on $k$. ◻
]

== 6 A sparse perturbation of the outer coloring <perturb:section>

Fix the outer coloring $c_(*)$ supplied by 12, and put $c_0 \( n \) = c_(*) \( L \( n \) \)$. All randomness used to construct $c_(*)$ has now been resolved. We shall introduce new independent bits indexed by geometric keys. A key will occur only a bounded number of times on any sampled progression. This allows a small flip probability to preserve the progressions containing many of each outer color. For progressions with affine lifts, a separate count of the possible keys makes the same small probability sufficient.

Retain the parameters and cyclic progressions from (2.1), (2.7). For $n in G$, define

#[#set math.equation(numbering: n => "(6.1)")
 $ f \( n \) = ∥q tilde(y) \( n \)∥_2^2 \, #h(2em) kappa \( n \) = (\( V \( y_i \( n \) \) \)_(i = 1)^D \, thin ⌊f \( n \)⌋) \, #h(2em) cal(K) = { kappa \( n \) : n in G } . $ <perturb:keys>]

Thus a key records a specific second-system box and a specific integer squared-norm band. Since $G$ is finite, so is $cal(K)$. The next lemma uses a bounded-width version of the equal-norm geometry in Behrend’s construction #cite(label("behrend1946")): a thin norm band has short intersections with a line on either side of its nearest point to the origin.

#thm([Lemma 6.1.])[
  (Bounded multiplicity of a key).  #emph[For every progression $n_j = n_0 + j d$ in $G$ with $d eq.not 0$ and $0 lt.eq j < k$, every key occurs at most four times among the $kappa \( n_j \)$.]
] <perturb:multiplicity>

#proof[
  First fix a second-system box, and let $J$ be the indices whose centered representatives lie in that box. Every coordinate interval has width at most $2 H$, so 13 gives
  $ tilde(y) \( n_j \) = A + j B #h(2em) \( j in J \) $
  for suitable $A \, B in bb(R)^D$. The indices in $J$ need not be consecutive. In particular, the points $q tilde(y) \( n_j \)$ lie on an affine line when $\| J \| gt.eq 2$; when $\| J \| lt.eq 1$ the claimed multiplicity bound is immediate.
  Any two distinct terms of the progression give points separated by Euclidean distance at least one after this scaling. To see this, the terms are distinct by (2.7), and $lambda$ is a unit modulo $q^D$. Hence $lambda \( n_j - n_(j') \)$ is a nonzero residue modulo $q^D$. Choose an integer representative $z$ of this residue, and let $a in { 0 \, dots.h \, D - 1 }$ be the largest integer for which $q^a divides z$. Divisibility by $q^b$, for $b lt.eq D$, is unchanged upon adding a multiple of $q^D$, so this choice is intrinsic to the residue. Write $z = q^a u$; then $q divides.not u$. In coordinate $a + 1$ the circle displacement is
  $ y_(a + 1) \( n_j \) - y_(a + 1) \( n_(j') \) = u / q med \( mod med 1 \) . $
  The residue of $u$ modulo $q$ is one of $1 \, dots.h \, q - 1$, whose distance from $0$ on the circle after division by $q$ is at least $1 \/ q$. This argument requires only $q divides.not u$; it does not require $u$ to be a unit or $q$ to be prime. The difference between any two real representatives has absolute value at least their circle distance. Consequently
  #[#set math.equation(numbering: n => "(6.2)")
   $ ∥q tilde(y) \( n_j \) - q tilde(y) \( n_(j') \)∥_2 gt.eq 1 #h(2em) \( j eq.not j' \) . $ <perturb:separation>]
  If $\| J \| gt.eq 2$, these separated points determine a nonconstant affine line $ell$. Let $z_0$ be the point of $ell$ closest to the origin, and choose a unit vector $e$ along $ell$. Writing its points as $z_0 + t e$, with $t in bb(R)$, gives
  $ ∥z_0 + t e∥_2^2 = t^2 + C' \, #h(2em) C' = ∥z_0∥_2^2 gt.eq 0 \, $
  because $z_0$ is orthogonal to $e$. For a fixed integer $m gt.eq 0$, the band of the key is
  $ m lt.eq t^2 + C' < m + 1 . $
  If it is nonempty, then $m + 1 - C' > 0$, and on the half-line $t gt.eq 0$ it is contained in the closed interval with endpoints
  $ sqrt(max { 0 \, m - C' }) \, #h(2em) sqrt(m + 1 - C') . $
  The difference of the quantities under these square roots is at most one. For $0 lt.eq u lt.eq v$, the inequality $\( sqrt(v) - sqrt(u) \)^2 lt.eq v - u$ therefore shows that this interval has length at most one. Reflection gives the same bound on $t lt.eq 0$. By (6.2), each of these intervals contains at most two sampled points: three points in an interval of length at most one would have total separation at least two. Thus the key occurs at most four times. If the band reaches the nearest point $z_0$, counting $t = 0$ in both halves only enlarges this upper bound. Replacing the half-open band by closed intervals also covers equality at either boundary, and the case of exactly two points needs no additional argument. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  compound-path({circle((0, 0), radius: 1.485, fill: rgb("#e8e8ff"), stroke: none); circle((0, 0), radius: 1.05, fill: rgb("#e8e8ff"), stroke: none); line((0, 0), (0, 0))}, fill: rgb("#e8e8ff"), fill-rule: "even-odd", stroke: none)
  circle((0, 0), radius: 1.05, stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 1.485, stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-2.1, 0.63), (2.226, 0.63), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#a0a0a0"))))
  content((-1.911, 0.63), [#text(size: 9pt)[$ell$]], anchor: "south-east", padding: 0.1176cm)
  content((2.121, 0.63), [#text(size: 9pt)[$t$]], anchor: "south", padding: 0.1176cm)
  line((-1.345, 0.63), (-0.84, 0.63), stroke: (paint: rgb("#0000b2"), thickness: 2.0pt, miter-limit: 10))
  line((0.84, 0.63), (1.345, 0.63), stroke: (paint: rgb("#0000b2"), thickness: 2.0pt, miter-limit: 10))
  circle((-0.84, 0.63), radius: 0.05644, fill: rgb("#0000b2"), stroke: none)
  circle((0.84, 0.63), radius: 0.05644, fill: rgb("#0000b2"), stroke: none)
  circle((-1.345, 0.63), radius: 0.05644, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000b2"), thickness: 0.7pt, miter-limit: 10))
  circle((1.345, 0.63), radius: 0.05644, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000b2"), thickness: 0.7pt, miter-limit: 10))
  line((0, 0), (0, 0.63), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((0, 0.483), (0.147, 0.483), (0.147, 0.63), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.03528, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((0, 0.63), [#text(size: 9pt)[$z_0$]], anchor: "south", padding: 0.1176cm)
  content((2.783, 0.105), [#box(width: 6.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[$ "lVert" z_0+"te" "rVert"_2^2=t^2+C'$#parbreak() Each half-line contributes a piece#parbreak() of length at most $1$.#parbreak() Sampled points are at least $1$ apart:#parbreak() at most $2$ points per piece.]])], anchor: "west")
})],
  caption: [Figure 1: A line meeting the band $m lt.eq ∥z∥_2^2 < m + 1$, illustrated for $m = 1$. Solid endpoints belong to the inner boundary; open endpoints lie on the excluded outer boundary. In general each half-line from the nearest point $z_0$ contributes length at most one, giving the four-point bound in 18. ],
) <perturb:norm-band>

Call a cyclic progression #emph[affine] when its entire sequence of centered representatives $tilde(y) \( n_j \)$ is affine in $j$ as a sequence in $bb(R)^D$. Its #emph[signature] is the literal word

#[#set math.equation(numbering: n => "(6.3)")
 $ sigma = #scale(x: 120%, y: 120%)[\(] \( c_0 \( n_j \) \, kappa \( n_j \) \) #scale(x: 120%, y: 120%)[\)]_(0 lt.eq j < k) . $ <perturb:signature>]

In particular, the entries retain the identities of the boxes and the integer band indices. Keys are not renamed when passing from one progression to another.

#thm([Lemma 6.2.])[
  (Counting affine signatures).  #emph[Let $T_(upright("aff"))$ be the number of signatures realized by affine cyclic progressions, and let $T_(upright("glob"))$ be the full-label word count of 8. There is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(6.4)")
 $ T_(upright("aff")) lt.eq C T_(upright("glob")) #scale(x: 120%, y: 120%)[\(] k \( D q^2 + 2 \) #scale(x: 120%, y: 120%)[\)]^3 . $ <perturb:signature-count>]

 In particular, 
#[#set math.equation(numbering: n => "(6.5)")
 $ log max { 1 \, T_(upright("aff")) } lt.eq O \( k^(3 \/ 10) log k \) + 6 log q + O \( log k \) = O \( k^(9 \/ 10) log k \) = o \( p k \) . $ <perturb:entropy>]

 All implied constants are absolute.]
] <perturb:signatures>

#proof[
  On an affine progression write $tilde(y) \( n_j \) = A + j B$. Then
  $ f \( n_j \) = q^2 ∥A + j B∥_2^2 = theta_0 + theta_1 j + theta_2 j^2 \, $
  where $theta_0 = q^2 ∥∥ A_2^2$, $theta_1 = 2 q^2 chevron.l A \, B chevron.r$, and $theta_2 = q^2 ∥∥ B_2^2$. Moreover, since every coordinate of $tilde(y) \( n_j \)$ belongs to $\[ - 1 \/ 2 \, 1 \/ 2 \)$,
  $ 0 lt.eq f \( n_j \) lt.eq D q^2 \/ 4 #h(2em) \( 0 lt.eq j < k \) . $
  Put $B_(*) = ⌊D q^2 \/ 4⌋ + 1$. For each $j in { 0 \, dots.h \, k - 1 }$ and $b in { 0 \, dots.h \, B_(*) }$, compare $theta_0 + theta_1 j + theta_2 j^2$ with $b$. These comparisons use at most $k \( B_(*) + 1 \) lt.eq k \( D q^2 + 2 \)$ affine hyperplanes in the three variables $\( theta_0 \, theta_1 \, theta_2 \)$. Their joint signs, including equality, determine the complete word $\( ⌊f \( n_j \)⌋ \)_(j < k)$ for all realized progressions. 7, in the fixed dimension three, therefore gives at most $C #scale(x: 120%, y: 120%)[\(] k \( D q^2 + 2 \) #scale(x: 120%, y: 120%)[\)]^3$ such words. Allowing all triples of coefficients, without imposing their geometric relations, can only increase this count.
  A full-label word $\( L \( n_j \) \)_(j < k)$ determines the specific second-system boxes and, because $c_(*)$ is fixed, every outer bit $c_0 \( n_j \)$. Together with the integer-part word just counted, it determines every entry of (6.3). Multiplying the two counts proves (6.4); no independence between the two words is asserted or needed.
  For the logarithmic estimate, 8 bounds $log T_(upright("glob"))$ by $O \( k^(3 \/ 10) log k \)$. Also $D q^2 + 2 lt.eq 3 D q^2$, so the remaining logarithm in (6.4) is at most $6 log q + 3 log k + 3 log D + O \( 1 \)$. (2.1), (2.4) give
  $ log q lt.eq frac(c k, D) log k + log \( 2 k^2 \) = O \( k^(9 \/ 10) log k \) \, #h(2em) p k = k^(19 \/ 20) . $
  Since $k^(9 \/ 10) log k \/ k^(19 \/ 20) = k^(- 1 \/ 20) log k arrow.r 0$, (6.5) follows. The arrangement constant comes from dimension three, so it is independent of the growing dimension $D$. ◻
]

#thm([Theorem 6.3.])[
  (A cyclic two-coloring).  #emph[There is an absolute integer $K_0$ such that, for every integer $k gt.eq K_0$, the construction in 2 gives an integer 
$ N = q^D gt.eq k^(c k) \, #h(2em) c = 10^(- 5) \, $

 and a coloring $C : bb(Z) \/ N bb(Z) arrow.r { 0 \, 1 }$ for which no progression $n_0 \, n_0 + d \, dots.h \, n_0 + \( k - 1 \) d$ with $d eq.not 0$ in $bb(Z) \/ N bb(Z)$ is monochromatic.]
] <perturb:cyclic>

#proof[
  For each key $kappa in cal(K)$, take an independent Bernoulli bit $E_kappa$ with $bb(P) \( E_kappa = 1 \) = p = k^(- 1 \/ 20)$, and define
  #[#set math.equation(numbering: n => "(6.6)")
   $ C \( n \) = c_0 \( n \) + E_(kappa \( n \)) med \( mod med 2 \) . $ <perturb:final-coloring>]
  Only this finite family of bits is random. In particular, positions with a common key use the very same bit, even if they have different outer colors. We may take $k$ sufficiently large that $p < 1 \/ 2$.
  First consider a progression containing at least $gamma k$ of each outer color, where $gamma = 1 \/ 100$. Fix a target color $b in { 0 \, 1 }$. Every position with $c_0 \( n_j \) = 1 - b$ must have $E_(kappa \( n_j \)) = 1$ for the whole progression to receive color $b$. By 18, these positions specify at least $gamma k \/ 4$ distinct keys. This set of keys is determined before the bits are sampled. Thus independence between distinct keys gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] C \( n_j \) = b upright(" for all ") j < k #scale(x: 120%, y: 120%)[\)] lt.eq p^(gamma k \/ 4) . $
  If some key also occurs at a position with outer color $b$, the prescriptions for that key conflict and this probability is zero, which obeys the same bound. There is no choice of a subset of keys to count: all keys requiring a flip are already specified by the progression and the target color.
  There are fewer than $\| G \|^2 = q^(2 D)$ choices of $\( n_0 \, d \)$ with $d eq.not 0$. A union bound over these choices and the two target colors bounds the probability $R_k$ that any such progression becomes monochromatic by
  #[#set math.equation(numbering: n => "(6.7)")
   $ R_k & lt.eq 2 q^(2 D) p^(gamma k \/ 4)\
 & lt.eq exp #h(-0.16667em) ((2 c - gamma / 80) k log k + 2 D log \( 2 k^2 \) + log 2) . $ <perturb:rich-bound>]
  Here the coefficient is explicitly
  #[#set math.equation(numbering: n => "(6.8)")
   $ 2 c - gamma / 80 = 1 / 50000 - 1 / 8000 = - 21 / 200000 < 0 . $ <perturb:negative-coefficient>]
  As $D = O \( k^(1 \/ 10) \)$, the other terms in the exponent are $O \( k^(1 \/ 10) log k \) = o \( k log k \)$. Hence $R_k = o \( 1 \)$.
  Next fix a signature realized by an affine progression, and again fix the target color $b$. For each entry $\( c_j \, kappa_j \)$ of this signature, monochromaticity prescribes
  $ E_(kappa_j) = b - c_j med \( mod med 2 \) . $
  Inconsistent prescriptions give an empty event. Otherwise, if there are $s$ distinct keys and $u$ of them are prescribed the value one, independence gives its probability exactly $p^u \( 1 - p \)^(s - u)$. By 18, $s gt.eq k \/ 4$, and since $p lt.eq 1 - p$ this is at most
  $ \( 1 - p \)^s lt.eq \( 1 - p \)^(k \/ 4) . $
  Two progressions with the same literal signature impose precisely the same prescriptions on the same random variables. They therefore define the same event for this target color and need be counted only once. Consequently the probability $A_k$ of a monochromatic affine progression satisfies
  #[#set math.equation(numbering: n => "(6.9)")
   $ A_k & lt.eq 2 T_(upright("aff")) \( 1 - p \)^(k \/ 4)\
 & lt.eq 2 max { 1 \, T_(upright("aff")) } exp \( - p k \/ 4 \) = exp #scale(x: 120%, y: 120%)[\(] - p k \/ 4 + o \( p k \) #scale(x: 120%, y: 120%)[\)] = o \( 1 \) \, $ <perturb:affine-bound>]
  using 19 and $1 - p lt.eq e^(- p)$. Neither union bound requires independence between different progressions or signatures.
  By 17, every nonzero-step cyclic progression is covered by the first case or the affine case. The cases may overlap, which only enlarges their combined bound. Thus the probability that any such progression is monochromatic is at most $R_k + A_k = o \( 1 \)$. For all sufficiently large $k$ this sum is less than one, so a choice of the bits gives the asserted coloring. All preceding thresholds and constants depend only on the fixed numerical parameters, and the bound in (2.4) is uniform over every prime $P$ allowed by 3. A single absolute $K_0$ therefore works for every integer $k gt.eq K_0$. Finally, $q gt.eq k^(c k \/ D)$ gives $N = q^D gt.eq k^(c k)$. ◻
]

== 7 Integer intervals and the two growth regimes <sec:transfers>

The cyclic coloring has a deterministic product extension. The relevant digit is the first place at which the common difference is nonzero; division by the corresponding power of the base then introduces no carry. The related digit construction of Erdős and Turán #cite(label("erdosTuran1936")) p. 263 is recalled, with the least-nonzero-digit argument, by Fox and Hunter #cite(label("foxHunter2026")) Section 2. We prove the arbitrary-base product needed here directly.

#thm([Proposition 7.1.])[
  (Digit product).  #emph[Let $N \, k gt.eq 2$ be integers. Suppose that a coloring $C : bb(Z) \/ N bb(Z) arrow.r { 0 \, 1 }$ has no monochromatic progression $a \, a + d \, dots.h \, a + \( k - 1 \) d$ with $d eq.not 0$ in $bb(Z) \/ N bb(Z)$. Then, for every positive integer $m$, 
$ W_(2^m) \( k \) > N^m . $

 Consequently $W_r \( k \) > N^(floor.l log_2 r floor.r)$ for every integer $r gt.eq 2$.]
] <transfer:product>

#proof[
  For $0 lt.eq n < N^m$, write its base-$N$ expansion as
  $ n = sum_(i = 0)^(m - 1) n_i N^i \, #h(2em) 0 lt.eq n_i < N \, $
  and assign the color
  $ #scale(x: 120%, y: 120%)[\(] C \( n_0 \) \, dots.h \, C \( n_(m - 1) \) #scale(x: 120%, y: 120%)[\)] in { 0 \, 1 }^m . $
  Here and below a digit is identified with its residue modulo the base. Suppose that $a \, a + d \, dots.h \, a + \( k - 1 \) d$ is a monochromatic progression in this interval, with $d > 0$. Since $k gt.eq 2$, we have $d < N^m$. There is therefore a largest integer $i in { 0 \, dots.h \, m - 1 }$ for which $N^i divides d$. Put $e = d \/ N^i$, so that $N divides.not e$. For every $j in { 0 \, dots.h \, k - 1 }$, the exact identity
  #[#set math.equation(numbering: n => "(7.1)")
   $ ⌊frac(a + j d, N^i)⌋ = ⌊a / N^i⌋ + j e $ <transfer:division>]
  holds because $j e$ is an integer. Reducing Equation (7.1) modulo $N$ shows that the $i$th digits form a cyclic progression with nonzero step $e med \( mod med N \)$. Monochromaticity of the color tuples would make $C$ constant on that progression, a contradiction.
  Translation by one now gives a coloring of $\[ N^m \]$ with $2^m$ colors and no monochromatic $k$-term progression. This proves the first assertion. For the second, take $m = floor.l log_2 r floor.r gt.eq 1$ and embed the at most $2^m lt.eq r$ color tuples into $\[ r \]$. ◻
]

In particular, $m = 1$ restricts the cyclic coloring to an ordinary interval of length $N$. The product uses the same fixed coloring $C$ in every digit, for arbitrarily many digits.

#proof[
  Theorem 20 supplies, for every integer $k$ above an absolute threshold, such a cyclic coloring with
  $ N = q^D gt.eq k^(c k) \, #h(2em) c = 10^(- 5) . $
  Proposition 21 gives, simultaneously for every integer $r gt.eq 2$,
  $ W_r \( k \) > N^(floor.l log_2 r floor.r) gt.eq k^(c k floor.l log_2 r floor.r) . $
  The threshold on $k$ was fixed before $r$ was introduced, so it is absolute and uniform in the number of colors. ◻
]

=== 7.1 Growth in the number of colors <growth-in-the-number-of-colors>

For fixed progression length, a separate construction gives a useful bound with a threshold independent of the length. The construction records a coarse interval for each digit, to force midpoint relations to hold coordinate by coordinate, and a squared norm, to exclude nonconstant midpoints. This is the digit-and-sphere geometry of Behrend #cite(label("behrend1946")), used here to partition the entire interval into progression-free color classes.

#thm([Theorem 7.2.])[
  #emph[For every pair of integers $r gt.eq 256$ and $k gt.eq 3$, 
$ W_r \( k \) > exp #h(-0.16667em) (frac(\( log r \)^2, 64 log 2)) . $

]
] <transfer:large-r>

#proof[
  Set
  $ b = floor.l r^(1 \/ 4) floor.r \, #h(2em) s = ⌊frac(log r, 4 log 2)⌋ . $
  Both are positive, and $b gt.eq 2$. Partition the digit set ${ 0 \, dots.h \, b - 1 }$ into
  $ H_0 = { 0 \, dots.h \, ceil.l b \/ 2 ceil.r - 1 } \, #h(2em) H_1 = { ceil.l b \/ 2 ceil.r \, dots.h \, b - 1 } \, $
  and let $h \( u \) in { 0 \, 1 }$ record the half containing $u$. An integer $0 lt.eq n < b^s$ has a unique digit vector $x = \( x_0 \, dots.h \, x_(s - 1) \)$ with $n = sum_(i = 0)^(s - 1) x_i b^i$. Give it the color
  #[#set math.equation(numbering: n => "(7.2)")
   $ (h \( x_0 \) \, dots.h \, h \( x_(s - 1) \) \, med sum_(i = 0)^(s - 1) x_i^2) . $ <transfer:norm-color>]
  There are at most $2^s \( 1 + s \( b - 1 \)^2 \) lt.eq 2^s \( 1 + s b^2 \)$ such colors. For every integer $s gt.eq 1$ we have $s + 1 lt.eq 2^s$, while $2^s lt.eq r^(1 \/ 4)$ and $b^2 lt.eq r^(1 \/ 2)$. Hence
  #[#set math.equation(numbering: n => "(7.3)")
   $ 2^s \( 1 + s b^2 \) lt.eq r^(1 \/ 4) \( s + 1 \) r^(1 \/ 2) lt.eq r . $ <transfer:color-count>]
  We show that this coloring contains no nonconstant monochromatic three-term progression. Suppose that three equally spaced integers have digit vectors $x \, y \, z$ and the same color. Their midpoint relation is
  #[#set math.equation(numbering: n => "(7.4)")
   $ sum_(i = 0)^(s - 1) \( x_i - 2 y_i + z_i \) b^i = 0 . $ <transfer:midpoint>]
  For each $i$, the three digits $x_i \, y_i \, z_i$ lie in one half $H_0$ or $H_1$. Each half has diameter at most $ceil.l b \/ 2 ceil.r - 1$, so
  $ \| x_i - 2 y_i + z_i \| lt.eq 2 \( ceil.l b \/ 2 ceil.r - 1 \) = cases(delim: "{", b - 2 \, & upright("if ") b upright(" is even") \,, b - 1 \, & upright("if ") b upright(" is odd") .) $
  In particular this absolute value is strictly less than $b$. Reducing Equation (7.4) modulo $b$ forces its zeroth coefficient to be zero: it is divisible by $b$ and has absolute value less than $b$. Dividing by $b$ and repeating proves $x_i - 2 y_i + z_i = 0$ for every $i$. Thus $x + z = 2 y$ in $bb(R)^s$. Equality of the final entries in Equation (7.2) also gives $∥x∥_2^2 = ∥y∥_2^2 = ∥z∥_2^2$, and therefore
  $ ∥x - z∥_2^2 = 2 ∥x∥_2^2 + 2 ∥z∥_2^2 - 4 ∥y∥_2^2 = 0 . $
  It follows that $x = y = z$, so the original three integers were equal. This excludes every progression with positive difference and length $k gt.eq 3$, since its first three terms would already give a forbidden triple. After translating the interval by one and using Equation (7.3), we obtain $W_r \( k \) > b^s$.
  Finally let $L = log r gt.eq 8 log 2$. Since $floor.l u floor.r gt.eq u \/ 2$ for $u gt.eq 1$, the parameter choices give
  $ s gt.eq frac(L, 8 log 2) \, #h(2em) log b gt.eq L / 4 - log 2 gt.eq L / 8 . $
  Consequently $log \( b^s \) gt.eq L^2 \/ \( 64 log 2 \)$, proving the stated bound for every $r gt.eq 256$, independently of $k gt.eq 3$. ◻
]

=== 7.2 Uniform growth statements <uniform-growth-statements>

#thm([Corollary 7.3.])[
  #emph[With integer parameters in both infima, 
$ lim_(k arrow.r oo) inf_(r in bb(Z)\
r gt.eq 2) frac(log W_r \( k \), k log r) = oo \, #h(2em) lim_(r arrow.r oo) inf_(k in bb(Z)\
k gt.eq 3) frac(log W_r \( k \), log r) = oo . $

 In particular, $W_r \( k \)^(1 \/ k) arrow.r oo$ for every fixed integer $r gt.eq 2$, and $W_r \( k \) \/ r^A arrow.r oo$ as $r arrow.r oo$ for every fixed integer $k gt.eq 3$ and every fixed real $A > 0$.]
] <transfer:limits>

#proof[
  For $r gt.eq 2$, the inequality $floor.l log_2 r floor.r gt.eq \( log r \) \/ \( 2 log 2 \)$ and Theorem 1 give, for all $k gt.eq K_0$,
  $ inf_(r in bb(Z)\
r gt.eq 2) frac(log W_r \( k \), k log r) gt.eq frac(c, 2 log 2) log k . $
  Theorem 22 gives, for all $r gt.eq 256$,
  $ inf_(k in bb(Z)\
k gt.eq 3) frac(log W_r \( k \), log r) gt.eq frac(log r, 64 log 2) . $
  The right-hand sides tend to infinity. For fixed $r gt.eq 2$, Theorem 1 also gives $W_r \( k \)^(1 \/ k) > k^(c floor.l log_2 r floor.r) arrow.r oo$. For fixed $A > 0$, Theorem 22 gives
  $ log frac(W_r \( k \), r^A) > frac(\( log r \)^2, 64 log 2) - A log r arrow.r oo \, $
  uniformly for integers $k gt.eq 3$. ◻
]

The restrictions on the parameters are necessary: the exact values $W_1 \( k \) = k$, $W_r \( 1 \) = 1$, and $W_r \( 2 \) = r + 1$ are established along with finiteness in Appendix 8.

== 8 An elementary finite upper bound <sec:upper>

We record a coarse quantitative form of the classical block-and-focus induction; see van der Waerden #cite(label("vanDerWaerden1998")) pp. 142–145. The recursion below proves finiteness directly, involves only previously defined integers, and applies to every positive number of colors.

#thm([Theorem 8.1.])[
  #emph[Define $F \( r \, 1 \) = 1$ and $F \( r \, 2 \) = r + 1$ for every integer $r gt.eq 1$. For $k gt.eq 3$, with $r$ and $k$ fixed, define 
#[#set math.equation(numbering: n => "(8.1)")
 $ m_0 = 1 \, #h(2em) m_(t + 1) = 2 m_t F \( r^(m_t) \, k - 1 \) quad \( 0 lt.eq t < r \) \, #h(2em) F \( r \, k \) = m_r . $ <upper:recursion>]

 Then, for all positive integers $r \, k$, 
$ W_r \( k \) lt.eq F \( r \, k \) < oo . $

 The boundary parameter values are exactly 
$ W_r \( 1 \) = 1 \, #h(2em) W_r \( 2 \) = r + 1 \, #h(2em) W_1 \( k \) = k . $

]
] <upper:finite>

#proof[
  The recursion is well founded: construct all $F \( r \, k \)$ at a given length $k$ after constructing them for every number of colors at length $k - 1$. Each of the $r$ steps in Equation (8.1) then uses finite positive integers.
  A one-term progression is a singleton, so $W_r \( 1 \) = 1$. Any $r$-coloring of $\[ r + 1 \]$ has two positions of the same color, and those positions form a two-term progression with positive difference. An injective coloring of $\[ r \]$ shows that $W_r \( 2 \) = r + 1$. Also, in one color $\[ k \]$ contains a $k$-term progression and $\[ k - 1 \]$ does not, proving $W_1 \( k \) = k$.
  It remains to prove the asserted upper bound for $k gt.eq 3$. We induct on $k$, simultaneously for all $r$, with the induction statement that every $r$-coloring of an interval of $F \( r \, k \)$ consecutive integers contains a monochromatic $k$-term progression. The preceding paragraph proves the cases $k = 1 \, 2$. Fix $k gt.eq 3$, assume the statement at length $k - 1$ for every color count, and fix $r gt.eq 1$.
  For the inner induction, a #emph[focus with $t$ colors] in a colored interval consists of a point $f$ of that interval and positive integers $d_1 \, dots.h \, d_t$ such that all the points
  $ f - s d_i \, #h(2em) 1 lt.eq s lt.eq k - 1 \, quad 1 lt.eq i lt.eq t \, $
  belong to the interval, and, for each $i$, the $k - 1$ points indexed by $i$ have a common color $a_i$, with $a_1 \, dots.h \, a_t$ pairwise distinct. In an interval containing no monochromatic $k$-term progression, the focus itself must have a color different from each $a_i$: otherwise the corresponding points, in increasing order, together with $f$ form such a progression of difference $d_i > 0$.
  We claim, by induction on $t in { 0 \, dots.h \, r }$, that every $r$-coloring of an interval of length $m_t$ containing no monochromatic $k$-term progression has a focus with $t$ colors. For $t = 0$ this just means choosing the single point in an interval of length $m_0 = 1$.
  Assume the claim for $t < r$, and put
  $ m = m_t \, #h(2em) B = F \( r^m \, k - 1 \) \, #h(2em) m_(t + 1) = 2 m B . $
  By translating, we may work with an avoiding coloring $chi$ of $\[ 2 m B \]$. Partition it into $2 B$ consecutive blocks of length $m$, and associate to block $j$ the word
  $ w_j = #scale(x: 120%, y: 120%)[\(] chi \( \( j - 1 \) m + 1 \) \, dots.h \, chi \( j m \) #scale(x: 120%, y: 120%)[\)] . $
  There are at most $r^m$ different words. Apply the outer induction hypothesis at length $k - 1$ and color count $r^m$ to the word coloring of the first $B$ block indices. We obtain integers $b \, Delta gt.eq 1$ such that
  #[#set math.equation(numbering: n => "(8.2)")
   $ w_b = w_(b + Delta) = dots.h.c = w_(b + \( k - 2 \) Delta) \, #h(2em) b + \( k - 2 \) Delta lt.eq B . $ <upper:matching-blocks>]
  Since $k - 2 gt.eq 1$, we have $Delta lt.eq B - 1$. Thus the next index
  #[#set math.equation(numbering: n => "(8.3)")
   $ q = b + \( k - 1 \) Delta lt.eq B + Delta lt.eq 2 B - 1 < 2 B $ <upper:next-block>]
  is still one of the allocated blocks. Its word need not agree with the preceding words.
  The common word in Equation (8.2), regarded as a coloring of $\[ m \]$, contains no monochromatic $k$-term progression, since such a progression would also occur inside block $b$. Apply the inner induction hypothesis to this word. Let $f in \[ m \]$ be its focus, with differences $d_1 \, dots.h \, d_t$ and distinct arm colors $a_1 \, dots.h \, a_t$. Let $a_0$ be the color at its position $f$; as observed above, $a_0$ is distinct from all $a_i$.
  Take position $f$ in block $q$ as the new focus, namely
  $ f' = \( q - 1 \) m + f . $
  For each $i in { 1 \, dots.h \, t }$ and $s in { 1 \, dots.h \, k - 1 }$,
  $ f' - s \( m Delta + d_i \) & = #scale(x: 120%, y: 120%)[\(] b + \( k - 1 - s \) Delta - 1 #scale(x: 120%, y: 120%)[\)] m + \( f - s d_i \) . $
  The block on the right is one of the matching blocks, and the within-block position $f - s d_i$ belongs to $\[ m \]$. Consequently these points all have color $a_i$ for fixed $i$. There is one more arm:
  $ f' - s m Delta = #scale(x: 120%, y: 120%)[\(] b + \( k - 1 - s \) Delta - 1 #scale(x: 120%, y: 120%)[\)] m + f \, #h(2em) 1 lt.eq s lt.eq k - 1 \, $
  whose points all have color $a_0$. All $t + 1$ arm differences are positive, all arm points are in the interval, and their colors are pairwise distinct. Together with Equation (8.3), this proves that $f'$ is a focus with $t + 1$ colors, completing the inner induction.
  At $t = r$, an avoiding coloring of $\[ m_r \]$ would have a focus whose arms use $r$ distinct colors. Its own color would have to avoid all of them, which is impossible in an $r$-coloring. Hence every such coloring contains a monochromatic $k$-term progression, completing the outer induction. In particular $W_r \( k \)$ exists and is at most $F \( r \, k \)$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
