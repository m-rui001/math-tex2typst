#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Smooth Nonquadratic Entire Affine Maximal Graph \
in Dimension Ten]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

For a smooth function $u : bb(R)^n arrow.r bb(R)$ with positive definite Hessian, write

#[#set math.equation(numbering: n => "(1)")
 $ sum_(i \, j = 1)^n U^(i j) w_(i j) = 0 \, #h(2em) U^(i j) = det \( D^2 u \) \( D^2 u \)_(i j)^(- 1) \, #h(2em) w = \( det D^2 u \)^(- \( n + 1 \) \/ \( n + 2 \)) . $ <eq:affine>]

This is the classical affine maximal equation, the Euler–Lagrange equation of the affine area functional $integral \( det D^2 u \)^(1 \/ \( n + 2 \))$ under compactly supported variations; see #cite(label("TrudingerWang2000")). The entire-graph form of the affine Bernstein problem asks whether every such solution must be a quadratic polynomial. Throughout this paper, positivity of the Hessian means pointwise positive definiteness, not a global lower bound by a fixed positive matrix.

#thm([Theorem 1.1.])[
  #emph[There exists a nonquadratic function $u in C^oo \( bb(R)^10 \)$ with $D^2 u$ positive definite at every point such that 
$ sum_(i \, j = 1)^10 U^(i j) partial_(i j) \( det D^2 u \)^(- 11 \/ 12) = 0 quad upright("on ") bb(R)^10 \, #h(2em) U = det \( D^2 u \) \( D^2 u \)^(- 1) . $

]
] <thm:main>

Thus the smooth entire-graph assertion has a negative answer in dimension ten. No growth assumption or completeness assumption for the Berwald–Blaschke metric is imposed here.

The classical problem has several formulations involving different notions of completeness. Chern formulated the two-dimensional entire-graph problem #cite(label("Chern1979")). Calabi proved rigidity in dimension two assuming both Euclidean completeness and completeness of the affine metric #cite(label("Calabi1982")). Trudinger and Wang later proved that affine completeness implies Euclidean completeness for locally uniformly convex hypersurfaces of dimension at least two #cite(label("TrudingerWang2002")). For the entire-graph problem, Trudinger and Wang proved that smooth locally uniformly convex entire affine maximal graphs over $bb(R)^2$ are elliptic paraboloids #cite(label("TrudingerWang2000")). In the same paper, they exhibited the singular dimension-ten example

#[#set math.equation(numbering: n => "(2)")
 $ u_0 \( x \, t \) = sqrt(\| x \|^9 + t^2) \, #h(2em) \( x \, t \) in bb(R)^9 times bb(R) \, $ <eq:singular>]

see #cite(label("TrudingerWang2000")) Section 7. This example is not smooth at the origin and does not have positive definite Hessian everywhere. Theorem 1 supplies a smooth example satisfying precisely these stronger pointwise requirements. The global section-based uniform convexity hypothesis in #cite(label("TrudingerWang2000")) Corollary 4.3 is stronger than the Hessian positivity assumed here.

Related equations with $w = \( det D^2 u \)^(- theta)$ admit nonquadratic Euclidean-complete examples for other ranges of $theta$ #cite(label("Du2024")) #cite(label("SunXingXu2026")). The latter range extends to $theta = n \/ \( n + 1 \)$, but does not include the classical value $theta = 11 \/ 12$ when $n = 10$.

Our construction keeps the relation $u^2 - t^2 = F \( x \)^2$ suggested by (2), but replaces $F \( x \) = \| x \|^(9 \/ 2)$ by a smooth strictly convex radial function with $F \( 0 \) = 1$. Section 2 gives a dimension-independent reduction of this ansatz to two second-order equations for positive functions $F$ and $P$. Section 3 constructs their radial solution smoothly through the origin. The main obstacle is then global existence: a priori the auxiliary function $P$ could vanish at a finite radius. Section 4 rules this out using a bounded invariant region for logarithmic derivatives, and completes the proof. The decisive change of derivative variables makes each component of the resulting vector field nondecreasing in the other two variables on a suitable box. A single stationary corner then controls all of its upper faces.

== 2 Reduction to a radial system <sec:reduction>

We first isolate the calculation that turns the fourth-order equation into a system for two functions of one fewer variable. For this section let $m gt.eq 1$, so that the graph has $m + 1$ independent variables $\( x \, t \) in bb(R)^m times bb(R)$. Set

$ k = m + 2 \, #h(2em) gamma = frac(m + 3, m + 2) . $

We introduce $P$ so that, for the ansatz below, the determinant power $w$ separates into $P \( x \)$ times a fixed function of $t \/ F \( x \)$.

#thm([Proposition 2.1.])[
  #emph[Let $F \, P$ be positive smooth functions on an open set $Omega subset bb(R)^m$, and suppose $H = D_x^2 F$ is positive definite. If 
#[#set math.equation(numbering: n => "(3)")
 $ det H = F P^(- gamma) \, #h(2em) "tr" \( H^(- 1) D_x^2 P \) + k P \/ F = 0 \, $ <eq:reduced>]

 then 
$ u \( x \, t \) = sqrt(F \( x \)^2 + t^2) $

 has positive definite Hessian on $Omega times bb(R)$ and satisfies (1) in dimension $n = m + 1$.]
] <prop:reduction>

#proof[
  Direct differentiation, interpreted as an identity of quadratic forms, gives
  #[#set math.equation(numbering: n => "(4)")
   $ D^2 u = F / u H + F^2 / u^3 (d t - t / F thin d F)^2 . $ <eq:hessian>]
  The first term is positive on the $x$ directions, and the second is positive on the remaining direction. Thus $D^2 u > 0$. Put $zeta = t \/ F$ and use the pointwise basis
  $ X_i = e_i + zeta F_i e_t quad \( 1 lt.eq i lt.eq m \) \, #h(2em) e_t . $
  Its change-of-basis matrix has determinant one. In this basis, (4) has diagonal blocks $\( F \/ u \) H$ and $F^2 \/ u^3$, so
  #[#set math.equation(numbering: n => "(5)")
   $ det D^2 u = F^(m + 2) u^(- \( m + 3 \)) det H . $ <eq:det>]
  The first equation in (3) is equivalent to $P = \( F \/ det H \)^(\( m + 2 \) \/ \( m + 3 \))$. Therefore
  #[#set math.equation(numbering: n => "(6)")
   $ w = \( det D^2 u \)^(- \( m + 2 \) \/ \( m + 3 \)) = P h \( zeta \) \, #h(2em) h \( zeta \) = \( 1 + zeta^2 \)^(k \/ 2) . $ <eq:w>]
  We evaluate the ordinary Hessian of $w$ in the same pointwise basis. Since $d zeta \( X_i \) = 0$, twice differentiating $t = F zeta$ gives
  $ D^2 zeta \( X_i \, X_j \) = - zeta / F F_(i j) . $
  Consequently
  $ D^2 w \( X_i \, X_j \) = h P_(i j) - P / F zeta h' F_(i j) \, #h(2em) w_(t t) = P / F^2 h'' . $
  Taking the trace against the inverse blocks of $D^2 u$ yields
  #[#set math.equation(numbering: n => "(7)")
   $ F / u "tr" #scale(x: 120%, y: 120%)[\(] \( D^2 u \)^(- 1) D^2 w #scale(x: 120%, y: 120%)[\)] = h "tr" \( H^(- 1) D_x^2 P \) + P / F #scale(x: 120%, y: 120%)[\(] \( 1 + zeta^2 \) h'' - m zeta h' #scale(x: 120%, y: 120%)[\)] . $ <eq:trace>]
  Differentiation of $h$ gives
  $ \( 1 + zeta^2 \) h'' - m zeta h' = k \( 1 + zeta^2 \)^(k \/ 2 - 1) #scale(x: 120%, y: 120%)[\(] 1 + \( k - 1 - m \) zeta^2 #scale(x: 120%, y: 120%)[\)] = k h \, $
  because $k = m + 2$. The second equation in (3) makes (7) zero. Multiplication by the positive determinant in (5) gives (1). ◻
]

We now take $F$ and $P$ radial, and use the same letters for their profiles in $r = \| x \|$. Write primes for radial derivatives and $y = F'$. For $r > 0$ the eigenvalues of $D_x^2 F$ are $y'$ in the radial direction and $y \/ r$ in the $m - 1$ tangential directions. Thus, whenever $y \, y' > 0$,

$ det D_x^2 F = y' (y / r)^(m - 1) \, #h(2em) "tr" #scale(x: 120%, y: 120%)[\(] \( D_x^2 F \)^(- 1) D_x^2 P #scale(x: 120%, y: 120%)[\)] = P'' / y' + \( m - 1 \) P' / y . $

Substituting into (3), and multiplying the second equation by $y' y^(m - 1)$, gives the equivalent system

#[#set math.equation(numbering: n => "(8)")
 $ y^(m - 1) y' = r^(m - 1) F P^(- gamma) \, #h(2em) \( y^(m - 1) P' \)' = - k r^(m - 1) P^(1 - gamma) \, #h(2em) F' = y . $ <eq:radial>]

The divergence form of the second equation will allow us to start the solution at the singular point $r = 0$.

== 3 A smooth radial solution at the origin <sec:local>

From now on fix

#[#set math.equation(numbering: n => "(9)")
 $ m = 9 \, #h(2em) k = 11 \, #h(2em) gamma = 12 \/ 11 . $ <eq:constants>]

We construct a local solution with $F \( 0 \) = P \( 0 \) = 1$. The radial equations contain divisions by $y = F'$, which vanishes at the origin. An integral formulation in $s = r^2 \/ 2$ avoids this singularity and makes smoothness in $x$ explicit.

#thm([Lemma 3.1.])[
  #emph[There is $epsilon > 0$ and a solution $F \, P$ of (8) on $0 < r < epsilon$ such that $F \( \| x \| \)$ and $P \( \| x \| \)$ extend smoothly to $\| x \| < epsilon$, with 
$ F \( 0 \) = P \( 0 \) = 1 \, #h(2em) D_x^2 F \( 0 \) = I \, #h(2em) D_x^2 P \( 0 \) = - 11 / 9 I . $

 Moreover $F \, P \, y \, y' > 0$ and $P' < 0$ for $0 < r < epsilon$.]
] <lem:local>

#proof[
  Seek $F \( r \) = f \( s \)$ and $P \( r \) = p \( s \)$, where $s = r^2 \/ 2$. The integrated equations suggest the normalized derivative $q = y \/ r$ and flux $j = - y^(m - 1) P' \/ \( k r^m \)$ for $r > 0$. We will construct their regular extensions as functions of $s$ using the following averages. For continuous $f \, p$ on $\[ - delta \, delta \]$ taking values in $\[ 1 \/ 2 \, 3 \/ 2 \]$, define
  #[#set math.equation(numbering: n => "(10)")
   $ q \( s \) & = (m integral_0^1 v^(m - 1) f \( v^2 s \) p \( v^2 s \)^(- gamma) thin d v)^(1 \/ m) \,\
j \( s \) & = integral_0^1 v^(m - 1) p \( v^2 s \)^(1 - gamma) thin d v . $ <eq:q>]
  On the closed subset
  $ cal(K) = { \( f \, p \) in C \( \[ - delta \, delta \] \)^2 : parallel f - 1 parallel_oo \, parallel p - 1 parallel_oo lt.eq 1 \/ 2 } \, $
  consider
  #[#set math.equation(numbering: n => "(11)")
   $ cal(T) \( f \, p \) \( s \) = (1 + integral_0^s q \( a \) thin d a \, med 1 - k integral_0^s j \( a \) q \( a \)^(1 - m) thin d a) . $ <eq:fixed-point>]
  The functions $q \, j$ have uniform positive upper and lower bounds. The maps $\( f \, p \) mapsto q$ and $\( f \, p \) mapsto j q^(1 - m)$ are Lipschitz in the product supremum norm, with constants independent of $delta$: all scalar powers are evaluated on fixed positive compact intervals. Hence there are constants $M \, L$ independent of $delta$ such that
  $ parallel cal(T) \( f \, p \) - \( 1 \, 1 \) parallel_oo lt.eq M delta \, #h(2em) parallel cal(T) \( f \, p \) - cal(T) \( tilde(f) \, tilde(p) \) parallel_oo lt.eq L delta parallel \( f \, p \) - \( tilde(f) \, tilde(p) \) parallel_oo . $
  Choose $M delta lt.eq 1 \/ 2$ and $L delta < 1$. The contraction mapping theorem gives a fixed point in $cal(K)$.
  The fixed point is smooth on $\( - delta \, delta \)$. Indeed, continuity of $q \, j$ first gives $f \, p in C^1$. If $f \, p$ are $C^ell$, differentiation under the integrals in (10)–(10) shows that $q \, j$ are $C^ell$, and (11) gives one further derivative. This proves the assertion by induction. The definition on both sides of $s = 0$ ensures that $f \( \| x \|^2 \/ 2 \)$ and $p \( \| x \|^2 \/ 2 \)$ are smooth in $x$ at the origin.
  For $r > 0$, the fixed point equations give $y = r q \( r^2 \/ 2 \) > 0$. Changing variables $rho = r v$ in (10)–(10) then yields
  #[#set math.equation(numbering: n => "(12)")
   $ y^m = m integral_0^r rho^(m - 1) F \( rho \) P \( rho \)^(- gamma) thin d rho \, #h(2em) y^(m - 1) P' = - k integral_0^r rho^(m - 1) P \( rho \)^(1 - gamma) thin d rho . $ <eq:integral>]
  Differentiation proves (8); the first equation implies $y' > 0$, and the second integral gives $P' < 0$. Finally $q \( 0 \) = 1$ and $j \( 0 \) = 1 \/ m$, so
  $ f_s \( 0 \) = 1 \, #h(2em) p_s \( 0 \) = - k \/ m = - 11 \/ 9 . $
  These are exactly the claimed Hessians of the radial extensions. Shrinking $epsilon$ if necessary completes the proof. ◻
]

== 4 An invariant box and global continuation <sec:global>

The local solution now has every required property. It remains to show that it can be continued to arbitrarily large radii without losing positivity. We do this by controlling logarithmic derivatives, rather than by estimating $F$ and $P$ separately.

Take the maximal outward continuation of the local solution on which $F \, P \, y > 0$. This is a regular smooth ODE for $r > 0$. Explicitly, with $Z = P'$ and

$ G \( r \, F \, P \, y \) = frac(r^8 F P^(- 12 \/ 11), y^8) \, $

it reads

#[#set math.equation(numbering: n => "(13)")
 $ F' = y \, #h(2em) P' = Z \, #h(2em) y' = G \, #h(2em) Z' = - 8 G / y Z - frac(11 r^8 P^(- 1 \/ 11), y^8) . $ <eq:regular>]

In particular $y' > 0$ throughout this continuation. Define

#[#set math.equation(numbering: n => "(14)")
 $ A = frac(r y, F) \, #h(2em) B = frac(r y', y) \, #h(2em) C = - frac(r P', P) \, $ <eq:ratios>]

and let a dot mean differentiation with respect to $log r$. Since $B > 0$, we may also set $D = C \/ B$. This normalization gives a vector field with nonnegative cross derivatives on the box in Lemma 5, allowing its upper faces to be controlled by one corner.

#thm([Lemma 4.1.])[
  #emph[On the interval of continuation, $A \, B > 0$, and the functions $A \, B \, D$ satisfy 
#[#set math.equation(numbering: n => "(15)")
 $ dot(A) & = A \( 1 + B - A \) \,\
dot(B) & = B #scale(x: 120%, y: 120%)[\(] 9 + A + \( 12 \/ 11 \) B D - 9 B #scale(x: 120%, y: 120%)[\)] \,\
dot(D) & = \( 11 - D \) A - 8 D + B D \( 1 - D \/ 11 \) . $ <eq:autonomous>]

 Moreover $\( A \, B \, D \) arrow.r \( 0 \, 1 \, 0 \)$ as $r arrow.b 0$, and all three coordinates are positive for sufficiently small $r > 0$.]
] <lem:autonomous>

#proof[
  Positivity of $F \, y \, y'$ gives $A \, B > 0$. Using (8), one may write
  $ B = frac(r^m F P^(- gamma), y^m) . $
  Logarithmic differentiation of $A$ and $B$, followed by the second equation in (8), gives
  $ dot(A) & = A \( 1 + B - A \) \,\
dot(B) & = B \( m + A + gamma C - m B \) \,\
dot(C) & = C \( 1 + C - \( m - 1 \) B \) + k A B . $
  For the last identity, use $dot(C) = C + C^2 - r^2 P'' \/ P$ and $A B = r^(m + 1) P^(- gamma) \/ y^(m - 1)$. Thus
  $ dot(D) = \( k - D \) A - \( m - 1 \) D + B D #scale(x: 120%, y: 120%)[\(] 1 + \( 1 - gamma \) D #scale(x: 120%, y: 120%)[\)] . $
  Substituting (9) proves (15).
  Lemma 3 gives $F = 1 + O \( r^2 \)$, $y = r + O \( r^3 \)$, $y' = 1 + O \( r^2 \)$, and $P' = - \( 11 \/ 9 \) r + O \( r^3 \)$. Hence $A arrow.r 0$, $B arrow.r 1$, and $D arrow.r 0$. The positivity of $A \, B$ and the local inequality $P' < 0$ also give $D > 0$ for small positive $r$. ◻
]

The singular profile (2) suggests the bounds for these variables. Its radial factor $F = r^(9 \/ 2)$ has $A = 9 \/ 2$ and $B = 7 \/ 2$; the associated function $P = \( F \/ det D_x^2 F \)^(11 \/ 12)$ is a positive constant times $r^(- 33 \/ 2)$, giving $C = 33 \/ 2$ and $D = 33 \/ 7$. These constants determine an invariant box for the smooth solution.

#thm([Lemma 4.2.])[
  #emph[The box 
#[#set math.equation(numbering: n => "(16)")
 $ cal(B) = \[ 0 \, 9 \/ 2 \] times \[ 0 \, 7 \/ 2 \] times \[ 0 \, 33 \/ 7 \] $ <eq:box>]

 is forward invariant for (15). The solution arising from Lemma 3 lies in $cal(B)$ throughout its interval of continuation.]
] <lem:box>

#proof[
  Write $V = \( V_1 \, V_2 \, V_3 \)$ for the vector field in (15). The upper corner $a_(*) = \( 9 \/ 2 \, 7 \/ 2 \, 33 \/ 7 \)$ satisfies $V \( a_(*) \) = 0$ by direct substitution. Each $V_i$ is nondecreasing in the other two coordinates on $cal(B)$. The nonzero cross derivatives are
  $ partial_B V_1 = A \, quad partial_A V_2 = B \, quad partial_D V_2 = \( 12 \/ 11 \) B^2 \, quad partial_A V_3 = 11 - D \, quad partial_B V_3 = D \( 1 - D \/ 11 \) \, $
  all nonnegative because $0 lt.eq D lt.eq 33 \/ 7 < 11$. On each upper face, comparison with $a_(*)$ therefore gives the corresponding $V_i lt.eq 0$. On the lower faces $A = 0$, $B = 0$, and $D = 0$, the respective components are $0$, $0$, and $11 A$, hence nonnegative.
  These weak boundary inequalities suffice for invariance. Let $Pi z$ be the coordinatewise projection of $z in bb(R)^3$ onto $cal(B)$. The face inequalities imply
  $ \( z - Pi z \) dot.op V \( Pi z \) lt.eq 0 . $
  On any bounded neighborhood of the box, $V$ has a Lipschitz constant $L$. Along a trajectory $z$ in that neighborhood, the squared distance $d^2 = \| z - Pi z \|^2$ consequently satisfies
  $ frac(d, d log r) d^2 = 2 \( z - Pi z \) dot.op V \( z \) lt.eq 2 L d^2 . $
  The squared distance to a closed box is continuously differentiable, so this identity also holds when the nearest face changes. Gronwall’s inequality shows that a trajectory starting in the box cannot leave it.
  Finally, Lemma 4 gives strictly positive coordinates tending to $\( 0 \, 1 \, 0 \)$ as $r arrow.b 0$. They therefore lie below all three upper bounds for sufficiently small $r > 0$. Forward invariance proves the last assertion. ◻
]

#thm([Proposition 4.3.])[
  #emph[The solution in Lemma 3 extends to every $r > 0$, with $F \, P \, y \, y' > 0$. Its radial extensions to $bb(R)^9$ are smooth, and $D_x^2 F$ is positive definite everywhere.]
] <prop:global>

#proof[
  Suppose its maximal outer endpoint were $R < oo$, and fix $r_0 in \( 0 \, R \)$. Lemma 5 gives
  $ 0 lt.eq A lt.eq 9 \/ 2 \, #h(2em) 0 lt.eq B lt.eq 7 \/ 2 \, #h(2em) 0 lt.eq C = B D lt.eq 33 \/ 2 . $
  Since the derivatives of $log F \, log y \, log P$ with respect to $log r$ are $A \, B \, - C$, respectively, integration gives, for $r_0 lt.eq r < R$,
  $ F \( r_0 \) & lt.eq F \( r \) lt.eq F \( r_0 \) \( R \/ r_0 \)^(9 \/ 2) \,\
y \( r_0 \) & lt.eq y \( r \) lt.eq y \( r_0 \) \( R \/ r_0 \)^(7 \/ 2) \,\
P \( r_0 \) \( r_0 \/ R \)^(33 \/ 2) & lt.eq P \( r \) lt.eq P \( r_0 \) . $
  Also $\| P' \( r \) \| = C \( r \) P \( r \) \/ r lt.eq \( 33 \/ 2 \) P \( r_0 \) \/ r_0$. Thus $\( r \, F \, P \, y \, Z \)$ remains in a compact subset of the domain $r \, F \, P \, y > 0$ of the smooth system (13). Its right-hand side is bounded there, so the state has a limit at $R$ in that domain. Local existence and uniqueness at this limit extend the solution past $R$, a contradiction.
  Smoothness for $r > 0$ follows from (13), and Lemma 3 supplies smoothness in $x$ at the origin. The Hessian eigenvalues for $r > 0$ are $y' > 0$ and $y \/ r > 0$; at the origin the Hessian is $I$. ◻
]

#proof[
  Take the global radial functions of Proposition 6. By (8), they satisfy (3) for $x eq.not 0$. The functions are smooth, $F \, P > 0$, and $D_x^2 F > 0$ everywhere, so both identities extend to $x = 0$ by continuity. Proposition 2 now shows that
  $ u \( x \, t \) = sqrt(F \( \| x \| \)^2 + t^2) \, #h(2em) \( x \, t \) in bb(R)^9 times bb(R) \, $
  is smooth, has positive definite Hessian everywhere, and solves the classical affine maximal equation in dimension ten. Finally, $u \( 0 \, t \) = sqrt(1 + t^2)$ because $F \( 0 \) = 1$, so $u$ is not a quadratic polynomial. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
