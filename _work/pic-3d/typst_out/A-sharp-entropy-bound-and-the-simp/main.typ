#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[A sharp entropy bound and the simplex inequality \
for isotropic constants]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

The isotropic constant compares the covariance of a uniform distribution with the volume of its support. For a convex body $K subset bb(R)^n$, meaning a compact convex set with nonempty interior, write $\| K \|$ for its Lebesgue volume, $b_K = \| K \|^(- 1) integral_K x thin thin upright(d) x$ for its centroid, and

$ Sigma_K = frac(1, \| K \|) integral_K \( x - b_K \) \( x - b_K \)^(sans(T)) thin thin upright(d) x . $

Its isotropic constant is

$ L_K = (frac(det Sigma_K, \| K \|^2))^(1 \/ \( 2 n \)) . quad "(1.1)" $ <intro:isotropic-constant>

This quantity is unchanged by invertible affine maps. The slicing problem, arising in Bourgain’s work on convex bodies #cite(label("Bourgain1986")), asks whether it admits an upper bound independent of dimension. Klartag proved an $O \( n^(1 \/ 4) \)$ bound #cite(label("Klartag2006")). Subsequent progress used stochastic localization, introduced by Eldan #cite(label("Eldan2013")), leading through subpolynomial and polylogarithmic estimates #cite(label("Chen2021")) #cite(label("KlartagLehec2022")) #cite(label("Klartag2023")) to Klartag and Lehec’s dimension-independent bound using Guan’s covariance estimate #cite(label("Guan2024")) #cite(label("KlartagLehec2025")). The sharp form, also called the strong isotropic constant conjecture, asks, in each dimension, whether a simplex maximizes $L_K$. The distinction is substantial: a universal bound does not identify the extremal value or an extremizing body.

In the plane, Campi, Colesanti, and Gronchi proved the simplex bound, and Saroglou established uniqueness of the maximizing body #cite(label("CampiColesantiGronchi1999")) #cite(label("Saroglou2010")). In higher dimensions, geometric variation arguments have imposed restrictions on possible maximizers. Rademacher proved that a simplicial polytope maximizing the isotropic constant among all convex bodies must be a simplex #cite(label("Rademacher2016")). More recent restrictions on local maximizers in terms of decomposability appear in #cite(label("Kipp2026")). We prove the sharp inequality for arbitrary convex bodies and classify all equality cases.

#thm([Theorem 1.1.])[
  (The simplex inequality).  #emph[For every integer $n gt.eq 1$, every convex body $K subset bb(R)^n$ satisfies the following bound, with equality if and only if $K$ is a simplex: 
$ L_K lt.eq frac(\( n ! \)^(1 \/ n), \( n + 1 \)^(\( n + 1 \) \/ \( 2 n \)) sqrt(n + 2)) . quad "(1.2)" $ <intro:simplex-bound>

]
] <intro:simplex>

The theorem also has a volume-product consequence. For a convex body $K$ with $0$ in its interior, define its polar by $K^compose = { y in bb(R)^n : chevron.l x \, y chevron.r lt.eq 1 upright(" for every ") x in K }$. Using exponential measures on convex cones, Klartag proved that the sharp simplex bound implies

$ \| K \| thin \| K^compose \| gt.eq frac(\( n + 1 \)^(n + 1), \( n ! \)^2) \, quad "(1.3)" $ <intro:mahler>

the nonsymmetric Mahler inequality #cite(label("Klartag2018")) Corollary 1.2. Thus Theorem 1 also gives this inequality in every dimension.

The proof proceeds through differential entropy. For a probability density $f$ on $bb(R)^m$, define, when the integrals are finite,

$ h \( f \) = - integral_(bb(R)^m) f \( x \) log f \( x \) thin thin upright(d) x \, #h(2em) "Cov" \( f \) = integral_(bb(R)^m) \( x - macron(x) \) \( x - macron(x) \)^(sans(T)) f \( x \) thin thin upright(d) x \, quad macron(x) = integral_(bb(R)^m) x f \( x \) thin thin upright(d) x . $

All logarithms are natural, and $0 log 0 = 0$. A log-concave density can be represented, up to a null set, as $f = e^(- V)$ for a proper lower semicontinuous convex function $V : bb(R)^m arrow.r \( - oo \, + oo \]$. The value $+ oo$ permits a density to vanish. Such a probability density has finite entropy and moments, and its covariance is positive definite; the needed tail bound is proved in Lemma 15.

#thm([Theorem 1.2.])[
  (The sharp entropy bound).  #emph[Let $m gt.eq 1$ and let $f$ be a log-concave probability density on $bb(R)^m$. Then 
$ h \( f \) gt.eq m + 1 / 2 log det "Cov" \( f \) . quad "(1.4)" $ <intro:entropy-bound>

 Equality holds if and only if $f$ is, almost everywhere, the density of $M \( E_1 \, dots.h \, E_m \)^(sans(T)) + b$, where $M$ is an invertible real $m times m$ matrix, $b in bb(R)^m$, and the $E_i$ are independent random variables with density $e^(- u) upright(bold(1))_({ u gt.eq 0 })$.]
] <intro:entropy>

Sharpness follows from a product of $m$ independent exponential variables of mean one: its entropy is $m$ and its covariance is the identity. Both sides of (1.4) increase by $log \| det A \|$ under an invertible affine change $x mapsto A x + b$. Thus the theorem asserts that a log-concave density with identity covariance has entropy at least $m$.

Bobkov and Madiman developed the relation between entropy bounds for log-concave measures and the slicing problem #cite(label("BobkovMadiman2011")). Fradelizi and Marín Sola formulated the sharp entropy statement (1.4) and proved its equivalence, across dimensions, with the simplex bound #cite(label("FradeliziMarinSola2026")) Conjecture 3(iii) and Proposition 5.2. In dimension one, Melbourne, Nayar, and Roberto proved the sharp bound, attained by a one-sided exponential distribution #cite(label("MelbourneNayarRoberto2026")) Theorem 1.1. Theorem 2 establishes the inequality and identifies all equality cases in every dimension. The cone reduction used here follows the preceding geometric and entropic work; we include it both to derive the dimensional constant and to transfer the equality classification to convex bodies.

=== 1.1 Ideas of the proof <ideas-of-the-proof>

We first assume that $f = e^(- V)$ is smooth and that the Hessian of $V$ is bounded above and below by positive multiples of the identity. Let $nabla phi.alt$ transport standard Gaussian measure to $f$, and put $J = D^2 phi.alt$. Brenier’s theorem and Caffarelli’s regularity and contraction theory supply this positive definite matrix field and its uniform bounds #cite(label("Brenier1991")) #cite(label("McCann1995")) #cite(label("Caffarelli2000")) #cite(label("CorderoErausquinFigalli2019")). The scalar model is the transport from a Gaussian variable to a mean-one exponential variable,

$ t \( a \) = - log Phi \( - a \) \, #h(2em) q \( a \) = t' \( a \) \, $

where $Phi$ is the standard Gaussian distribution function. Since $q$ is an increasing bijection onto $\( 0 \, oo \)$, spectral calculus defines the symmetric matrix field $A = q^(- 1) \( J \)$.

Two features of this parametrization drive the proof. First, an affine change of the target can be chosen so that $bb(E) A = 0$, where expectation is Gaussian. This nonlinear normalization is proved by a homotopy and a compactness argument; ordinary covariance normalization does not give the required identity. Second, differentiating the transport equation and using convexity of $V$ gives an energy estimate for $A$. The estimate retains a nonnegative term involving pairs of distinct eigenvalues of $A$. Discarding that term would lose the control needed for matrix functions whose derivatives do not commute.

The zero mean permits an orthogonal decomposition

$ A \( x \) = sum_(r = 1)^m x_r X_r + Y \( x \) \, #h(2em) X_r = bb(E) \[ x_r A \( x \) \] \, $

where $Y$ has Gaussian chaos degrees at least two. The first term lies in the equality space of the Gaussian Poincaré inequality and hence has no energy surplus. We instead use its constant matrices $X_r$ to choose a supporting plane for the covariance log determinant. The higher-degree part supplies a strict spectral gap. A covariance identity involving the resolvent of the Ornstein–Uhlenbeck operator then expresses the signed deficit $m + 1 / 2 log det "Cov" \( f \) - h \( f \)$ in terms of these two parts.

The resulting estimate has both noncommuting matrix terms and scalar divided differences. A commutator square controls the former. One scalar inequality absorbs the cost of the supporting plane and the terms without derivatives. A second controls the divided differences, charging their off-diagonal error to the eigenvalue-separation term retained earlier. After this cancellation, the entropy deficit is bounded above by a quadratic expression that is nonpositive on every chaos of degree at least two. Retaining strict slack also controls $Y$ and forces $sum_r X_r^2$ towards the identity when the entropy gap tends to zero. All numerical constants in the scalar inequalities are exact rationals. Their verification uses polynomial bounds on a compact interval and separate analytic estimates on both tails.

For equality, it is essential that this remainder applies to nearly sharp densities. The expected extremizers have restricted support and affine potentials, so equality cannot be studied solely within the smooth, uniformly convex class. We approximate an arbitrary equality density while preserving entropy and covariance. The remainder then forces the reparametrized Jacobians to converge in Gaussian $L^2$ to a linear field $A \( x \) = sum_r x_r X_r$, with $sum_r X_r^2 = I$. Since $q$ is Lipschitz in Frobenius norm, the original Jacobians converge to $q \( A \)$, and Gaussian Poincaré gives convergence of the centered maps.

The local compatibility of this limiting Jacobian is decisive. The constant and linear terms of its mixed-derivative identities force the symmetric matrices $X_r$ to commute. Simultaneous orthogonal diagonalization then gives independent one-dimensional exponential transports. Only the nonvanishing of $q' \( 0 \)$ and $q'' \( 0 \)$ is needed for the commutation argument, isolating a potentially reusable algebraic step. No uniform Hessian bounds on the smooth approximants are required. Their affine normalizations are controlled only after the limiting law and its covariance have been identified.

Section 2 constructs the normalization and proves the transport energy estimate. Section 3 decomposes the entropy deficit and proves the smooth case using two scalar propositions. Section 4 proves those propositions; Appendix 8 supplies the quantitative one-variable bounds. Section 5 removes the smoothness assumptions. Section 6 classifies equality in the entropy bound. Section 7 applies that classification to the exponential density on the cone over $K$, completing Theorem 1.

== 2 Gaussian transport and a matrix surplus <tr:section>

We first work with a probability density $e^(- V)$ on $bb(R)^m$ satisfying

$ V in C^oo \( bb(R)^m \) \, #h(2em) 0 < c_(-) I lt.eq D^2 V lt.eq c_(+) I < oo . quad "(2.1)" $ <tr:smooth-assumptions>

The constants $c_(-) \, c_(+)$ may depend on the density. Write $C = "Cov" \( mu \)$, where $d mu = e^(- V) thin d y$, and let $gamma_m$ be standard Gaussian measure. Throughout this section, $bb(E)$ denotes integration against $gamma_m$.

There are two objectives. We choose affine coordinates in which a reparametrization of the transport Jacobian has mean zero. We then use convexity of $V$ to control derivatives of that reparametrization. The resulting estimate contains an additional nonnegative term measuring separation between eigenvalues; retaining this term is essential in the matrix argument that follows.

=== 2.1 The Gaussian parametrization <the-gaussian-parametrization>

Let $Phi$ and $phi$ denote the distribution function and density of a standard one-dimensional Gaussian. Define, for $a in bb(R)$,

$ t \( a \) = - log Phi \( - a \) \, #h(2em) q \( a \) = t' \( a \) = frac(phi \( a \), Phi \( - a \)) \, #h(2em) d \( a \) = q \( a \) - a \,\
k \( a \) = frac(t \( a \), q \( a \)) \, #h(2em) b \( a \) = k' \( a \) \, #h(2em) l \( a \) = b' \( a \) . quad "(2.2)" $ <tr:scalar-functions>

The map $t$ transports a standard Gaussian to the exponential law of mean one: $Phi \( - G \)$ is uniform on $\( 0 \, 1 \)$ when $G$ is standard Gaussian. Thus $q$ is the derivative of the scalar transport associated with the entropy benchmark $h = 1$, $"Var" = 1$.

The identities

$ q' = q d \, #h(2em) b = 1 - k d \, #h(2em) l = k - q + a b quad "(2.3)" $ <tr:scalar-identities>

follow by differentiation. In particular, $q - k = a b - l$. We record the elementary properties that permit us to use $q$ as a change of variable.

#thm([Lemma 2.1.])[
  #emph[The function $q$ is a smooth increasing bijection from $bb(R)$ to $\( 0 \, oo \)$. Moreover, 
$ d > 0 \, #h(2em) 0 < q' < 1 \, #h(2em) q'' gt.eq 0 \, #h(2em) 0 < 1 - q d lt.eq d^2 . $

]
] <tr:q-properties>

#proof[
  Let $X_a$ have the conditional law of $G - a$ given $G > a$, and write $bb(E)_a$ for expectation under this law. Gaussian integration by parts gives
  $ bb(E)_a X_a = d \( a \) \, #h(2em) "Var" \( X_a \) = 1 - q \( a \) d \( a \) . $
  Since $X_a > 0$ almost surely, $d > 0$ and hence $q' = q d > 0$. Its strictly positive variance gives $q' < 1$.
  For completeness, this variance is at most the square of its mean. The survival function
  $ S_a \( u \) = frac(Phi \( - a - u \), Phi \( - a \)) \, #h(2em) u gt.eq 0 \, $
  satisfies $S_a \( u + v \) lt.eq S_a \( u \) S_a \( v \)$, since its hazard rate $q \( a + u \)$ is increasing. Integrating over $u \, v gt.eq 0$ yields
  $ 1 / 2 bb(E)_a X_a^2 = integral_0^oo u S_a \( u \) thin d u lt.eq (integral_0^oo S_a \( u \) thin d u)^2 = d \( a \)^2 . $
  Consequently $1 - q d = "Var" \( X_a \) lt.eq d^2$. Differentiating $q' = q d$ now gives $q'' = q \( d^2 + q d - 1 \) gt.eq 0$. Finally, $q \( a \) arrow.r 0$ as $a arrow.r - oo$, whereas $q \( a \) > a$ for $a > 0$. These limits prove surjectivity. ◻
]

We shall also need two positivity bounds and a quantitative growth estimate. Their proof, including the rational bounds on the compact interval and estimates on both tails, is given in Appendix 8. Put

$ D_0 \( a \) = frac(1, d \( a \)) \, #h(2em) M \( a \) = D_0 \( a \)^2 \( 1 - b \( a \)^2 \) . quad "(2.4)" $ <tr:M-definition>

A lower bound for the growth of $M$ in $log q$ will let us compare uniform averages in $q$ with uniform averages in $log q$ in the surplus estimate. Define a nondecreasing step function $m_0$ by the following table. At a finite endpoint we take the value in the interval to its right.

$ & O & P_1 & R_1 & U_1 & V_1 & T_1\
a & \( - oo \, - 3 \) & \[ - 3 \, - 2 \) & \[ - 2 \, - 1 \) & \[ - 1 \, 1 / 2 \) & \[ 1 / 2 \, 4 \) & \[ 4 \, oo \)\
m_0 \( a \) & 0 & .19 & .38 & .68 & .68 & .68 quad "(2.5)" $ <tr:bins>

All terminating decimals in this paper denote exact rational numbers.

#thm([Lemma 2.2.])[
  (Scalar bounds).  #emph[The functions in (2.2) satisfy, on $bb(R)$, 
$ 0 < b < 1 / 2 \, #h(2em) l > 0 \, #h(2em) frac(d log M, d log q) := frac(M', M d) gt.eq m_0 . quad "(2.6)" $ <tr:scalar-basic-equations>

]
] <tr:scalar-basic>

For a real symmetric matrix, scalar functions will always be interpreted by spectral functional calculus. If $f$ is differentiable, its divided difference is

$ f \[ u \, v \] = cases(delim: "{", \( f \( u \) - f \( v \) \) \/ \( u - v \) \, & u eq.not v \,, f' \( u \) \, & u = v .) quad "(2.7)" $ <tr:divided-difference>

The classical Daleckii–Krein formula #cite(label("DaleckiiKrein1965")) states that, in an eigenbasis of a symmetric matrix $A$, the derivative of $f \( A \)$ in a symmetric direction $Z$ has entries $f \[ a_i \, a_j \] Z_(i j)$; see also #cite(label("Noferini2017")) Section 2.4. This formula will allow us to keep the off-diagonal entries of matrix derivatives.

=== 2.2 Transport and the choice of coordinates <transport-and-the-choice-of-coordinates>

Brenier’s theorem gives a convex potential $phi.alt$ such that $\( nabla phi.alt \)_(\#) gamma_m = mu$; its gradient is unique up to null sets #cite(label("Brenier1991")) #cite(label("McCann1995")). For $m gt.eq 2$ we use the full-space regularity theorem of Cordero-Erausquin and Figalli #cite(label("CorderoErausquinFigalli2019")) Theorem 1.1, which extends Caffarelli’s interior theory #cite(label("Caffarelli1992")) to the unbounded domains considered here. It applies with both domains equal to $bb(R)^m$, because both densities are smooth and locally bounded away from zero. For $m = 1$, the same smoothness follows directly by expressing monotone transport through the two distribution functions. Thus $phi.alt$ is smooth in every dimension. Caffarelli’s contraction theorem #cite(label("Caffarelli2000")) and its inverse bound then imply that the Jacobian

$ J = D^2 phi.alt quad "(2.8)" $ <tr:Jacobian>

satisfies

$ c_(+)^(- 1 \/ 2) I lt.eq J lt.eq c_(-)^(- 1 \/ 2) I . quad "(2.9)" $ <tr:Jacobian-bounds>

For the lower bound, apply the contraction theorem to the inverse transport. We use its quantitative form: a source potential with Hessian at most $a I$ and a target potential with Hessian at least $b I$ give a transport Lipschitz constant at most $sqrt(a \/ b)$; see also #cite(label("ChewiPooladian2023")) Theorem 1.

Define the symmetric matrix field

$ A = q^(- 1) \( J \) . quad "(2.10)" $ <tr:A-definition>

The bounds (2.9) place the spectrum of $A$ in a compact interval. Our preferred coordinates are characterized by $bb(E) A = 0$. They need not be the usual isotropic coordinates.

#thm([Proposition 2.3.])[
  (Affine normalization).  #emph[Let $mu = e^(- V) d y$ satisfy (2.1). There exists a positive definite symmetric matrix $P$ such that the Brenier map from $gamma_m$ to $P_(\#) mu$ has Jacobian $J_P$ satisfying 
$ bb(E) q^(- 1) \( J_P \) = 0 . $

 The transformed density again satisfies (2.1), with possibly different positive constants.]
] <tr:normalization>

#proof[
  We use a homotopy from the Gaussian and show that its zeros stay in a compact subset of the positive definite cone. For $0 lt.eq theta lt.eq 1$, define
  $ W_theta \( y \) = \( 1 - theta \) \| y \|^2 \/ 2 + theta V \( y \) \, #h(2em) d mu_theta = Z_theta^(- 1) e^(- W_theta \( y \)) thin d y \, $
  where $Z_theta$ is the normalizing integral. There are constants $a_(-) \, a_(+) > 0$, independent of $theta$, with $a_(-) I lt.eq D^2 W_theta lt.eq a_(+) I$. These densities have uniformly Gaussian tails. Their covariance matrices $C_theta$ depend continuously on $theta$, are positive definite, and therefore satisfy
  $ c_0 I lt.eq C_theta lt.eq C_0 I quad "(2.11)" $ <tr:homotopy-covariance>
  for fixed $c_0 \, C_0 > 0$.
  For a positive definite symmetric $P$, let $J_(theta \, P)$ be the Jacobian of the transport to $P_(\#) mu_theta$. Define a map with values in the vector space of symmetric matrices by
  $ F \( theta \, P \) = bb(E) q^(- 1) \( J_(theta \, P) \) . $
  Contraction in both directions gives
  $ frac(lambda_min \( P \), sqrt(a_(+))) I lt.eq J_(theta \, P) lt.eq frac(parallel P parallel_(upright("op")), sqrt(a_(-))) I . quad "(2.12)" $ <tr:homotopy-spectral>
  We first verify continuity of $F$. Restrict $P$ to any compact subset of the positive definite cone. The transports have common Lipschitz constants by (2.12); their values at zero are bounded because their means and second moments are bounded. Every convergent sequence $\( theta_j \, P_j \)$ thus has locally uniformly convergent subsequences of transport maps. Their limits push forward $gamma_m$ to the limiting target and remain gradients of convex functions, so Brenier uniqueness identifies the limit. Write $J_j \, J$ for the corresponding Jacobians. They converge weak-\* locally and obey common positive spectral bounds.
  The change-of-variables equation expresses $log det J_j$ in terms of the target potential composed with its transport map. It therefore converges locally uniformly to $log det J$. On a fixed compact spectral interval, strict concavity of $log det$ gives a constant $c > 0$ such that
  $ log det J_j lt.eq log det J + "tr" #scale(x: 120%, y: 120%)[\(] J^(- 1) \( J_j - J \) #scale(x: 120%, y: 120%)[\)] - c \| J_j - J \|_(upright(F))^2 . $
  Integration on any ball, followed by weak-\* convergence, proves $J_j arrow.r J$ in local $L^2$. Functional calculus then gives local $L^2$ convergence of $q^(- 1) \( J_j \)$. Their common spectral bounds control the Gaussian tails, proving continuity of $F$.
  We next bound all zeros, uniformly in $theta$. Suppose $bb(E) A = 0$, where $A = q^(- 1) \( J_(theta \, P) \)$. Convexity of $q$ and Jensen’s inequality on the expected spectral measure of each unit vector give
  $ bb(E) J_(theta \, P) gt.eq q \( 0 \) I . $
  Gaussian integration by parts gives $bb(E) \( x_r partial_i phi.alt \) = \( bb(E) J_(theta \, P) \)_(i r)$. Orthogonal projection of the centered components of $nabla phi.alt$ onto the span of $x_1 \, dots.h \, x_m$ consequently yields
  $ P C_theta P gt.eq \( bb(E) J_(theta \, P) \)^2 gt.eq q \( 0 \)^2 I . $
  Together with (2.11), this bounds $P^(- 1)$ uniformly. The lower estimate in (2.12) now gives a uniform lower bound $A gt.eq a_(*) I$, where we may take $a_(*) lt.eq 0$. Since $q' lt.eq 1$,
  $ q \( a \) lt.eq q \( a_(*) \) + a - a_(*) quad \( a gt.eq a_(*) \) \, #h(2em) bb(E) "tr" J_(theta \, P) lt.eq m #scale(x: 120%, y: 120%)[\(] q \( a_(*) \) - a_(*) #scale(x: 120%, y: 120%)[\)] . $
  On the other hand, Gaussian Poincaré and (2.12) imply
  $ c_0 parallel P parallel_(upright("op"))^2 lt.eq "tr" \( P C_theta P \) lt.eq bb(E) "tr" J_(theta \, P)^2 lt.eq frac(parallel P parallel_(upright("op")), sqrt(a_(-))) bb(E) "tr" J_(theta \, P) . $
  This also bounds $P$ uniformly.
  Choose a bounded open set in the space of symmetric matrices whose closure lies in the positive definite cone and whose interior contains every zero just bounded. The map $F \( theta \, dot.op \)$ has no zeros on its boundary. At $theta = 0$, the target is $N \( 0 \, P^2 \)$, so $J_(0 \, P) = P$ and $F \( 0 \, P \) = q^(- 1) \( P \)$. Its unique zero is $q \( 0 \) I$; its derivative there is multiplication by the positive scalar $1 \/ q' \( 0 \)$. Its Brouwer degree is therefore nonzero. Homotopy invariance of degree gives a zero at $theta = 1$, as required. ◻
]

The quantity $m + 1 / 2 log det "Cov" \( mu \) - h \( mu \)$ is unchanged by an invertible affine transformation. Indeed, a linear map $P$ adds $log \| det P \|$ to entropy and $2 log \| det P \|$ to the covariance log determinant. We may therefore impose the normalization from Proposition 5. From now on $V \, J \, A \, C$ refer to this transformed density and transport, and

$ bb(E) A = 0 . quad "(2.13)" $ <tr:mean-zero>

=== 2.3 The transport equation and its energy <the-transport-equation-and-its-energy>

We shall differentiate the Jacobian and integrate the resulting equation. The twice-differentiated change-of-variables equation is part of Caffarelli’s transport method #cite(label("Caffarelli2000")) Section 5. The next lemma establishes the finite energy needed to do this without additional decay assumptions on higher derivatives of $V$. For a matrix field $F$, set

$ \| F \|_(upright(F))^2 = "tr" \( F^(sans(T)) F \) \, #h(2em) parallel F parallel^2 = bb(E) \| F \|_(upright(F))^2 \, #h(2em) parallel partial F parallel^2 = sum_(r = 1)^m parallel partial_r F parallel^2 . $

The same convention sums over any displayed derivative index of a collection of matrix fields.

#thm([Lemma 2.4.])[
  (Jacobian equation and finite energy).  #emph[Under (2.1), put $J_r = partial_r J$ and 
$ cal(L) u = "tr" \( J^(- 1) D^2 u \) - nabla V \( nabla phi.alt \) dot.op nabla u . $

 Then 
$ cal(L) J_(i j) = - delta_(i j) + \( J D^2 V \( nabla phi.alt \) J \)_(i j) + "tr" \( J^(- 1) J_i J^(- 1) J_j \) . quad "(2.14)" $ <tr:Jacobian-equation>

 Moreover $parallel partial J parallel < oo$. The matrix fields $A$ and $k \( A \)$ belong to Gaussian $H^1$, and the integrations by parts below with smooth matrix functions of $J$ are justified by compact cutoffs.]
] <tr:energy>

#proof[
  The density equation is
  $ log det J = V \( nabla phi.alt \) - \| x \|^2 \/ 2 - \( m \/ 2 \) log \( 2 pi \) . quad "(2.15)" $ <tr:density-equation>
  Differentiating twice gives (2.14). The divergence of the cofactor matrix of a Hessian vanishes. Applying this identity to $J$, and then differentiating (2.15) once, shows that
  $ cal(L) u = e^(\| x \|^2 \/ 2) "div" #scale(x: 120%, y: 120%)[\(] e^(- \| x \|^2 \/ 2) J^(- 1) nabla u #scale(x: 120%, y: 120%)[\)] . $
  Thus, for smooth $u$ and compactly supported smooth $v$,
  $ bb(E) \( v cal(L) u \) = - bb(E) chevron.l nabla v \, J^(- 1) nabla u chevron.r . quad "(2.16)" $ <tr:divergence-form>
  Choose $0 < lambda lt.eq Lambda < oo$ such that $lambda I lt.eq J lt.eq Lambda I$. Taking the trace in (2.14), and using $D^2 V gt.eq 0$, gives
  $ cal(L) \( "tr" J \) gt.eq - m + Lambda^(- 2) sum_r \| J_r \|_(upright(F))^2 . $
  For a compactly supported cutoff $0 lt.eq chi lt.eq 1$, integration by parts and $\| nabla "tr" J \| lt.eq sqrt(m) thin \| partial J \|$ imply
  $ Lambda^(- 2) bb(E) chi^2 \| partial J \|^2 & lt.eq m + 2 lambda^(- 1) sqrt(m) thin bb(E) #scale(x: 120%, y: 120%)[\(] chi \| nabla chi \| thin \| partial J \| #scale(x: 120%, y: 120%)[\)]\
 & lt.eq m + 1 / 2 Lambda^(- 2) bb(E) chi^2 \| partial J \|^2 + 2 m Lambda^2 lambda^(- 2) bb(E) \| nabla chi \|^2 . $
  Let $chi$ tend to one through standard radial cutoffs with gradients bounded by a constant divided by their radii. Fatou’s lemma proves $parallel partial J parallel < oo$.
  All eigenvalues of $J$ lie in $\[ lambda \, Lambda \]$. The Fréchet derivatives of $q^(- 1)$ and of $k compose q^(- 1)$ are bounded on that spectral interval, so $A \, k \( A \) in H^1 \( gamma_m \)$. The same applies to any smooth scalar function on this interval. For such a matrix multiplier, insert a cutoff into (2.16) and let it tend to one. The terms containing its gradient vanish by Cauchy–Schwarz and the energy bound; the remaining differentiated terms are bounded by a constant times $1 + \| partial J \|^2$. This justifies the asserted integrations by parts. ◻
]

=== 2.4 Keeping the eigenvalue separation <keeping-the-eigenvalue-separation>

Set $Z_r = partial_r A$. At each point diagonalize $A$, and write $a_i$ for its eigenvalues and $lambda_i = q \( a_i \)$ for those of $J$. For real $a \, b$, define

$ delta \( a \, b \) = \| log q \( a \) - log q \( b \) \| \, #h(2em) m_(*) \( a \, b \) = m_0 \( min \( a \, b \) \) \,\
r \( a \, b \) = frac(1 + m_(*) \( a \, b \), 16) (1 + frac(delta \( a \, b \)^2, 30) + frac(delta \( a \, b \)^4, 1680)) . quad "(2.17)" $ <tr:surplus-weight>

We use the abbreviations $delta_(i j) = delta \( a_i \, a_j \)$ and $r_(i j) = r \( a_i \, a_j \)$. The quantity

$ cal(C) = bb(E) sum_(i \, j \, r) r_(i j) delta_(i j)^2 \( Z_r \)_(i j)^2 quad "(2.18)" $ <tr:surplus-definition>

is independent of the choice of orthonormal basis within repeated eigenspaces. In particular, the factor $delta_(i j)^2$ vanishes when $a_i = a_j$.

#thm([Proposition 2.5.])[
  (Matrix surplus).  #emph[For the transport satisfying (2.1), with the notation above, 
$ bb(E) "tr" k \( A \)^2 gt.eq parallel partial A parallel^2 - parallel partial k \( A \) parallel^2 + cal(C) . quad "(2.19)" $ <tr:surplus-inequality>

]
] <tr:surplus>

#proof[
  The proof has two parts. Symmetry of the third derivatives of $phi.alt$ first replaces the transport equation by averages of the scalar function $M$. Comparing arithmetic and logarithmic averages then produces the term $cal(C)$.
  The identity $q k = t$ will match the entropy term in the covariance completion of Section 3; we first estimate the derivative cost of $k \( A \)$. Put $F \( lambda \) = k \( q^(- 1) \( lambda \) \)^2$. Multiply (2.14) by $F \( J \)$ in trace and integrate by parts. Lemma 6 justifies this operation. At a fixed point choose an orthonormal eigenbasis of $J$ and rotate all three indices of the symmetric tensor $Theta_(i j r) = partial_r J_(i j) = partial_i partial_j partial_r phi.alt$ into that basis. The quadratic term on the right of the Jacobian equation has trace contraction
  $ sum_i F \( lambda_i \) "tr" \( J^(- 1) J_i J^(- 1) J_i \) = sum_(i \, j \, r) frac(F \( lambda_i \), lambda_j lambda_r) Theta_(i j r)^2 \, $
  where we used the symmetry of $Theta$. The term obtained by integration by parts is
  $ sum_r lambda_r^(- 1) "tr" #scale(x: 120%, y: 120%)[\(] \( partial_r F \( J \) \) J_r #scale(x: 120%, y: 120%)[\)] = sum_(i \, j \, r) frac(F \[ lambda_i \, lambda_j \], lambda_r) Theta_(i j r)^2 . $
  The remaining term is $"tr" \( F \( J \) J D^2 V J \) gt.eq 0$. Discarding it gives
  $ bb(E) "tr" k \( A \)^2 gt.eq bb(E) sum_(i \, j \, r) Theta_(i j r)^2 (frac(F \( lambda_i \), lambda_j lambda_r) + frac(F \[ lambda_i \, lambda_j \], lambda_r)) . quad "(2.20)" $ <tr:initial-multiplier>
  Only pointwise changes of basis are made here; no eigenvectors are differentiated.
  Regard $M$ as a function of $lambda = q \( a \)$. The identities (2.3) give
  $ frac(d, d lambda) \( lambda F \( lambda \) \) = k^2 + frac(2 k b, d) = frac(1 - b^2, d^2) = M . quad "(2.21)" $ <tr:lambdaF>
  For two positive numbers $u \, v$, let $M_(u v)^(upright("ar"))$ be the uniform average of $M$ on the interval between $u$ and $v$, with its continuous interpretation when $u = v$. With the weight $Theta_(i j r)^2 \/ \( lambda_i lambda_j lambda_r \)$, symmetrization in $i \, j$ changes the coefficient in (2.20) to
  $ frac(lambda_i + lambda_j, 2) thin M_(lambda_i lambda_j)^(upright("ar")) . $
  In the full sum we can replace this coefficient by $lambda_r M_(lambda_i lambda_j)^(upright("ar"))$, decreasing its value. To see this, order three eigenvalues as $u lt.eq v lt.eq w$. Lemma 4 makes $M$ increasing, so
  $ M_(u v)^(upright("ar")) lt.eq M_(u w)^(upright("ar")) lt.eq M_(v w)^(upright("ar")) . $
  The ordered coefficients $u + v - 2 w$, $u + w - 2 v$, and $v + w - 2 u$ sum to zero. Their scalar product with these three ordered averages is nonnegative, by the rearrangement inequality. Full symmetry of $Theta$ permits precisely this averaging over permutations of the three indices. We have proved
  $ bb(E) "tr" k \( A \)^2 gt.eq bb(E) sum_(i \, j \, r) frac(Theta_(i j r)^2, lambda_i lambda_j lambda_r) thin lambda_r M_(lambda_i lambda_j)^(upright("ar")) . quad "(2.22)" $ <tr:arithmetic-energy>
  We now fix a pair of eigenvalues. Bars in the rest of the proof denote uniform averages in $log lambda$ over their interval. Set
  $ x = delta_(i j) \/ 2 \, #h(2em) w_0 = frac(x, sinh x) \, #h(2em) m_(*) = m_(*) \( a_i \, a_j \) \, $
  with $w_0 = 1$ at $x = 0$. Since $d a \/ d log lambda = D_0$, the divided-difference formula shows that the coefficients of $\( Z_r \)_(i j)^2$ and $\( partial_r k \( A \) \)_(i j)^2$, respectively, when written with the same weight as in (2.22), are
  $ lambda_r w_0^2 overline(D_0)^(thin 2) \, #h(2em) lambda_r w_0^2 overline(b D_0)^(thin 2) . quad "(2.23)" $ <tr:derivative-coefficients>
  Both $D_0 \( 1 + b \)$ and $D_0 \( 1 - b \) = k$ are increasing: $d' = q d - 1 < 0$, and $b' = l > 0$, $k' = b > 0$. The covariance inequality for two increasing functions on an interval therefore yields
  $ overline(M) gt.eq M_1 := overline(D_0)^(thin 2) - overline(b D_0)^(thin 2) gt.eq 3 / 4 overline(D_0)^(thin 2) . quad "(2.24)" $ <tr:logarithmic-chebyshev>
  We also need a quantitative comparison of the two averaging measures. On the logarithmic interval, (2.6) says that $M \( lambda \) lambda^(- m_(*))$ is increasing. Exponential weighting and the same covariance inequality give
  $ M_(lambda_i lambda_j)^(upright("ar")) / overline(M) gt.eq frac("shc" \( \( 1 + m_(*) \) x \), "shc" \( x \) "shc" \( m_(*) x \)) \, #h(2em) "shc" \( x \) = frac(sinh x, x) . quad "(2.25)" $ <tr:average-comparison>
  Indeed, after centering the logarithmic interval, the left side is $bb(E)_0 \( e^s M \) \/ \[ bb(E)_0 e^s thin bb(E)_0 M \]$, where $bb(E)_0$ is its uniform average. Under the measure proportional to $e^(m_(*) s)$, the increasing factor $M e^(- m_(*) s)$ can only increase the mean of $e^s$. Taking $M = e^(m_(*) s)$ gives the displayed ratio.
  Here is a convenient explicit lower bound for this ratio. Define $A_0 \( x \) = x coth x - 1$, with $A_0 \( 0 \) = 0$. The identity
  $ x coth x + frac(x^2, sinh^2 x) gt.eq 2 $
  implies both $A_0 \( x \) gt.eq 1 - w_0^2$ and that $A_0 \( x \) \/ x^2$ is nonincreasing for $x > 0$. To verify the identity, clear the denominator and expand $x / 2 sinh \( 2 x \) + x^2 - cosh \( 2 x \) + 1$ in powers of $x$; the coefficients vanish through degree four and are nonnegative thereafter. Since $0 lt.eq m_(*) lt.eq 1$, we obtain $A_0 \( m_(*) x \) gt.eq m_(*)^2 A_0 \( x \)$. The addition formula for $sinh$ now gives
  $ frac("shc" \( \( 1 + m_(*) \) x \), "shc" \( x \) "shc" \( m_(*) x \)) & = 1 + frac(m_(*) A_0 \( x \) + A_0 \( m_(*) x \), 1 + m_(*))\
 & gt.eq 1 + m_(*) \( 1 - w_0^2 \) . quad "(2.26)" $ <tr:hyperbolic-comparison>
  Every formula here extends continuously to $m_(*) = 0$ or $x = 0$.
  Combining (2.24)–(2.26), the amount by which the coefficient in (2.22) exceeds the difference of the two coefficients in (2.23) is at least
  $ lambda_r \( 1 + m_(*) \) \( 1 - w_0^2 \) M_1 . $
  Relative to the coefficient of $\( Z_r \)_(i j)^2$, this is at least
  $ 3 / 4 \( 1 + m_(*) \) \( w_0^(- 2) - 1 \) gt.eq frac(1 + m_(*), 16) (delta_(i j)^2 + delta_(i j)^4 / 30 + delta_(i j)^6 / 1680) . $
  The last inequality is the Taylor expansion of $\( sinh x \/ x \)^2$, whose omitted coefficients are positive. Substituting in (2.22) and summing proves (2.19). ◻
]

We have obtained two inputs for the entropy argument: the matrix field $A$ has no constant Gaussian component, and convexity supplies (2.19). The next section combines these facts with a Gaussian covariance identity and separates the first chaos of $A$ from its higher chaoses.

== 3 Gaussian decomposition of the entropy deficit <mat:section>

The transport estimate of Proposition 7 controls the Gaussian energy of the reparametrized Jacobian. Its degree-one part, however, has no Poincaré surplus. We use that part to choose a matrix supporting plane for the log determinant. The remaining Gaussian chaoses then supply the coercivity needed to prove the entropy bound. We retain a strict remainder that will also identify the equality cases. Throughout this section, $bb(E)$ denotes integration against the standard Gaussian measure $gamma_m$.

Define a scalar weight on $\[ 0 \, oo \)$ by

$ omega \( lambda \) = frac(3 \( lambda - 1 \)^2, 37 + 3 lambda) (3 / 20 + 49 / 100 frac(37, 37 + 3 lambda)) min {13 / 100 \, frac(32, 25 sqrt(lambda))} \, quad "(3.1)" $ <mat:rigidity-weight>

where the minimum is $13 \/ 100$ at $lambda = 0$. This weight is continuous and nonnegative, vanishes only at $1$, and satisfies $omega \( lambda \) \/ sqrt(lambda) arrow.r 24 \/ 125$ as $lambda arrow.r oo$.

#thm([Theorem 3.1.])[
  (The smooth entropy bound with a remainder).  #emph[ Let $m gt.eq 1$ be an integer and let $mu = e^(- V) thin thin upright(d) y$ be a probability measure on $bb(R)^m$, where $V in C^oo \( bb(R)^m \)$ and $c_(-) I lt.eq D^2 V lt.eq c_(+) I$ for constants $0 < c_(-) lt.eq c_(+) < oo$. Choose the affine normalization of Proposition 5, and let $A = q^(- 1) \( J \)$ be the resulting Gaussian transport matrix field, so $bb(E) A = 0$. Set 
$ X_r = bb(E) \( x_r A \) \, #h(2em) Y = A - sum_(r = 1)^m x_r X_r \, #h(2em) B = sum_(r = 1)^m X_r^2 . $

 If $lambda_1 \, dots.h \, lambda_m$ are the eigenvalues of $B$, then 
$ 2 h \( mu \) - 2 m - log det "Cov" \( mu \) gt.eq 1 / 500 bb(E) "tr" \( Y^2 \) + 1 / 1000 sum_(i = 1)^m omega \( lambda_i \) . quad "(3.2)" $ <mat:strict-remainder>

 In particular, 
$ h \( mu \) gt.eq m + 1 / 2 log det "Cov" \( mu \) . $

]
] <mat:entropy-smooth>

We use the affine normalization of Proposition 5: the Brenier Jacobian $J$ and the symmetric matrix field $A = q^(- 1) \( J \)$ satisfy $bb(E) A = 0$. This normalization does not change $h \( mu \) - 1 / 2 log det "Cov" \( mu \)$. For the proof, we replace $mu$ by this affine image and retain the notation $mu$. Scalar functions of $A$ are interpreted by spectral calculus; when their arguments are omitted, $q \, k \, t \, b \, l$ and the functions introduced below are evaluated at $A$. For a matrix field $F$, put

$ tau \( F \) = bb(E) "tr" F \, #h(2em) parallel F parallel^2 = bb(E) "tr" \( F^t F \) \, #h(2em) parallel F parallel_S^2 = bb(E) "tr" \( F^t S F \) $

when $S$ is a constant positive definite matrix. For a family indexed by $r$, these squared norms include summation over $r$. Lemma 6 provides the Sobolev regularity used below.

Write $C = "Cov" \( mu \)$ and let

$ D = 2 m + log det C - 2 h \( mu \) $

be the negative of twice the entropy gap. The transport change of variables and $log q \( a \) = - a^2 \/ 2 - 1 / 2 log \( 2 pi \) + t \( a \)$ give

$ D = tau \( A^2 - 2 t \) + log det C + m . quad "(3.3)" $ <mat:deficit-exact>

=== 3.1 Covariance and the first Gaussian chaos <covariance-and-the-first-gaussian-chaos>

Let $N = - Delta + x dot.op nabla$ be the nonnegative Ornstein–Uhlenbeck operator and let $R = \( I + N \)^(- 1)$. The degree-$d$ Gaussian chaos is the span of coordinatewise products of one-dimensional Hermite polynomials whose degrees sum to $d$. These spaces give an orthogonal decomposition of $L^2 \( gamma_m \)$; on the degree-$d$ space, $N$ and $R$ act by $d$ and $\( 1 + d \)^(- 1)$, respectively. We write $partial = \( partial_1 \, dots.h \, partial_m \)$ and $partial^(*) v = sum_r \( x_r v_r - partial_r v_r \)$, so $N = partial^(*) partial$. The usual Gaussian Sobolev norm is $parallel F parallel_(H^1)^2 = parallel F parallel^2 + parallel partial F parallel^2$; its dual norm is

$ parallel F parallel_(- 1)^2 = sum_(d gt.eq 0) frac(parallel F_d parallel^2, 1 + d) \, $

initially for square-integrable fields, and then by completion. Here $F_d$ denotes the degree-$d$ chaos component. These spectral conventions are standard; see #cite(label("NourdinPeccati2009")) Section 2.

We use the Gaussian Helffer–Sjöstrand covariance representation; see #cite(label("DuerinckxOtto2020")) Proposition 4.1(ii). We include a direct chaos proof below. The term $- 2 tau \( t \)$ in (3.3) determines its completion. Since $q k = t$, subtracting $\( I + N \) k$ from $q$ in the covariance quadratic form produces exactly the cross term $- 2 t$.

#thm([Lemma 3.2.])[
  (Covariance completion).  #emph[Define the symmetric $H^(- 1)$ matrix field 
$ U = q \( A \) - \( I + N \) k \( A \) $

 and let $W$ be the Gram matrix of its rows in $H^(- 1)$: 
$ W_(i j) = sum_(ell = 1)^m chevron.l U_(i ell) \, U_(j ell) chevron.r_(- 1) . $

 Then 
$ C = bb(E) #scale(x: 120%, y: 120%)[\[] J \( R J \) #scale(x: 120%, y: 120%)[\]] = W + bb(E) (2 t - k^2 - sum_r K_r^2) \, #h(2em) K_r = partial_r k \( A \) . quad "(3.4)" $ <mat:covariance-completion>

 Moreover, if $U = u - partial^(*) v$ with $u$ and the family $v = \( v_r \)_r$ square-integrable, then for every constant $S > 0$, 
$ "tr" \( S W \) lt.eq parallel u parallel_S^2 + parallel v parallel_S^2 . quad "(3.5)" $ <mat:dual-bound>

]
] <mat:covariance>

#proof[
  Put $F = nabla phi.alt$. For two degree-$d$ components of $F$, Gaussian integration by parts gives
  $ sum_ell bb(E) \[ \( partial_ell F_(i \, d) \) \( partial_ell F_(j \, d) \) \] = d thin bb(E) \[ F_(i \, d) F_(j \, d) \] . $
  Differentiation lowers the degree by one, and $R$ therefore cancels the factor $d$. Summing over $d gt.eq 1$ proves $C_(i j) = sum_ell bb(E) \[ J_(i ell) R J_(j ell) \]$. Symmetry of $J$ gives the first matrix identity in (3.4). Expanding the row Gram matrix of $q - \( I + N \) k$ gives cross terms $- 2 bb(E) \( q k \) = - 2 bb(E) t$. The remaining term is
  $ bb(E) #scale(x: 120%, y: 120%)[\[] k \( I + N \) k #scale(x: 120%, y: 120%)[\]] = bb(E) (k^2 + sum_r K_r^2) \, $
  by entrywise integration by parts. This proves the second identity. The calculation is valid by the $H^1$–$H^(- 1)$ pairing, even if $N k$ is not square-integrable.
  For a test field $F$, the pairing with $u - partial^(*) v$ is $chevron.l u \, F chevron.r - chevron.l v \, partial F chevron.r$. Cauchy–Schwarz bounds it by $\( parallel u parallel^2 + parallel v parallel^2 \)^(1 \/ 2) parallel F parallel_(H^1)$. Taking the dual norm proves (3.5) for $S = I$, and applying this argument to $S^(1 \/ 2) U$ proves the general case. ◻
]

Separate the degree-one part of $A$ by writing

$ A = sum_(r = 1)^m x_r X_r + Y \, #h(2em) X_r = bb(E) \( x_r A \) \, #h(2em) B = sum_r X_r^2 . quad "(3.6)" $ <mat:chaos>

The matrices $X_r$ are constant and symmetric; $Y$ contains only chaoses of degree at least two. We shall use

$ Z_r = partial_r A = X_r + G_r \, #h(2em) G_r = partial_r Y \, #h(2em) g_r = partial_r N^(- 1) Y \, #h(2em) V_0 = parallel G parallel^2 - parallel Y parallel^2 . quad "(3.7)" $ <mat:gradient-fields>

Thus $partial^(*) g = Y$. All three derivative fields are symmetric.

For comparison, the coordinatewise Gaussian-to-exponential transport satisfies

$ A \( x \) = "diag" \( x_1 \, dots.h \, x_m \) \, #h(2em) B = I . $

We therefore choose the supporting plane for $log det C$ as a regularized inverse of $B$ centered at this value. Fix

$ alpha = 3 / 40 \, #h(2em) s = frac(1, 1 - alpha) \, quad "(3.8)" $ <mat:dual-constants>

and set

$ S = \( I \/ s + alpha B \)^(- 1) \, #h(2em) T = S - I \, #h(2em) H = - T \( B - I \) . quad "(3.9)" $ <mat:dual-matrices>

These constant matrices commute with one another, though generally not with functions of $A$. Directly from their definition,

$ 0 < S lt.eq s I \, #h(2em) T = - alpha S \( B - I \) \, #h(2em) H = alpha S \( B - I \)^2 gt.eq 0 \, #h(2em) T^2 = alpha H S . quad "(3.10)" $ <mat:dual-relations>

In particular, $S = I$ when $B = I$. Deviations of the first chaos from this value produce the nonnegative matrix $H$.

Concavity of the log determinant yields $log det C + m lt.eq "tr" \( S C \) - log det S$. Combining this with Lemma 9 and Proposition 7, and using $parallel A parallel^2 - parallel Z parallel^2 = - V_0$, gives

$ D lt.eq - V_0 - cal(C) + "tr" \( T - log S \) + "tr" \( S W \) + tau [T (2 t - k^2 - I - sum_r K_r^2)] . quad "(3.11)" $ <mat:deficit-reduction>

Here $cal(C)$ is the eigenvalue-separation surplus in Proposition 7. The remaining task is to estimate the last two terms while retaining the negative contribution involving $H$.

=== 3.2 An exact expansion with noncommuting factors <an-exact-expansion-with-noncommuting-factors>

Recall the divided differences from Section 2, with $v \[ a \, a \] = v' \( a \)$. For a smooth scalar function $v$, define its secant increment at the second endpoint by

$ Delta v_(i j) = v \[ a_i \, a_j \] - v' \( a_j \) . $

We use the matrix derivative formula in #cite(label("Noferini2017")) Section 2.4. At a fixed point, choose an orthonormal eigenbasis of $A$. Entrywise multiplication is denoted by $compose$. Define the derivative residuals

$ D_r = K_r - X_r b = G_r b + Z_r compose Delta k \, #h(2em) L_r = partial_r b - X_r l = G_r l + Z_r compose Delta b . quad "(3.12)" $ <mat:residuals>

These matrices need not be symmetric. The distinction between $D_r$ and $D_r^t$ will be essential below.

The scalar identity $q - k = a b - l$ implies

$ U = Y b + sum_r X_r L_r + \( B - I \) l - partial^(*) D . quad "(3.13)" $ <mat:U-representation>

Indeed, $partial^(*) \( X b \) = \( A - Y \) b - B l - sum_r X_r L_r$. To divide the higher-chaos terms between the two squares, fix

$ beta = 7 / 25 \, #h(2em) c = 3 / 2 \, #h(2em) gamma = c / 2 . quad "(3.14)" $ <mat:constants>

Using $partial^(*) g = Y$ in (3.5), we obtain

$ "tr" \( S W \) lt.eq ∥Y \( b - beta \) + sum_r X_r L_r + \( B - I \) l∥_S^2 + parallel D - beta g parallel_S^2 . quad "(3.15)" $ <mat:W-bound>

We group the expansion according to its $H$ term and its derivative residuals. In the remaining $Y$ coefficient, we split off $c k$: the identity $partial^(*) g = Y$ will transfer $c tau \( T Y k \)$ to derivatives, where completing the square produces $D - gamma g$. Introduce the scalar functions

$ f & = k \( 1 + b \) \, & h_0 & = f - c k - frac(2 \( b - beta \) l, alpha) \,\
p & = f' - b^2 - l^2 / alpha \, & e & = f' - 2 b^2 - frac(2 l^2, alpha) . quad "(3.16)" $ <mat:scalar-functions>

The identity

$ a f - f' = 2 t - k^2 - b^2 - 1 $

follows from $q - k = a b - l$ and $b = 1 - k \( q - a \)$. For each pair of eigenvalues of $A$, put

$ psi_(i j) = Delta f_(i j) - 2 b_j Delta k_(i j) - frac(2 l_j, alpha) Delta b_(i j) \, #h(2em) b_j = b \( a_j \) \, quad l_j = l \( a_j \) \, $

and define

$ M_r = G_r e + Z_r compose psi + c g_r b \, #h(2em) w_r = D_r - gamma g_r . quad "(3.17)" $ <mat:M-w>

Finally, write

$ P_T = tau \( T b B b - T B b^2 \) . quad "(3.18)" $ <mat:P-definition>

#thm([Lemma 3.3.])[
  (Matrix expansion).  #emph[The sum of the last two terms in (3.11) is at most 
$ & - tau \( H p \) + tau [T (Y h_0 + sum_r X_r M_r)]\
 & quad + ∥Y \( b - beta \) + sum_r X_r L_r∥_S^2 + parallel D - beta g parallel_S^2 + gamma^2 tau (T sum_r g_r^2)\
 & quad - P_T - 2 tau (\[ T \, b \] sum_r X_r w_r) - tau (T sum_r w_r^t w_r) . quad "(3.19)" $ <mat:expanded-bound>

 Except for the use of (3.15), this expansion is exact.]
] <mat:expansion>

#proof[
  Let $F_0 = Y \( b - beta \) + sum_r X_r L_r$. The relations (3.10) give
  $ parallel F_0 + \( B - I \) l parallel_S^2 = parallel F_0 parallel_S^2 + 1 / alpha tau \( H l^2 \) - 2 / alpha tau \( T F_0 l \) . $
  For the cross term, the order of the factors follows from $"tr" \( F_0^t T l \) = "tr" \( T F_0 l \)$, by transposition and cyclicity. Integration by parts on the linear part of $A$ yields
  $ tau \( T A f \) = tau [T (Y f + sum_r X_r partial_r f)] \, #h(2em) partial_r f = X_r f' + G_r f' + Z_r compose Delta f . $
  Together with $a f - f' = 2 t - k^2 - b^2 - 1$, this accounts for the terms involving $f'$ and $f$.
  To expand the energy term, use both versions of $K_r = X_r b + D_r = b X_r + D_r^t$:
  $ tau (T sum_r K_r^2) = tau \( T b B b \) + 2 tau (T b sum_r X_r D_r) + tau (T sum_r D_r^t D_r) . quad "(3.20)" $ <mat:K-square>
  The two cross terms agree under transposition inside the trace. Moving $b$ past $T$, rather than past $X_r$, gives
  $ tau \( T b X_r D_r \) = tau \( T X_r D_r b \) + tau \( \[ T \, b \] X_r D_r \) . $
  The terms containing $B - I$ now combine as
  $ tau #scale(x: 120%, y: 120%)[\(] T \( B - I \) f' #scale(x: 120%, y: 120%)[\)] + tau \( T b^2 - T b B b \) + 1 / alpha tau \( H l^2 \) = - tau \( H p \) - P_T . $
  In the other terms, substituting (3.12) produces $G_r e + Z_r compose psi$ and the $Y$ multiplier $f - 2 \( b - beta \) l \/ alpha = h_0 + c k$.
  It remains to handle $c tau \( T Y k \)$. Since $partial^(*) g = Y$,
  $ tau \( T Y k \) = sum_r tau \( T K_r g_r \) . $
  Here integration by parts first gives $tau \( T g_r K_r \)$; transposition makes the two expressions equal. Substituting $K_r = b X_r + D_r^t$ and moving $b$ past $T$ introduces $c g_r b$ in $M_r$ and replaces $D_r$ by $D_r - gamma g_r$ in the commutator term. The remaining square is completed by
  $ - tau \( T D_r^t D_r \) + c tau \( T D_r^t g_r \) = - tau \( T w_r^t w_r \) + gamma^2 tau \( T g_r^2 \) . $
  This proves (3.19). ◻
]

=== 3.3 The commutator and the weighted squares <the-commutator-and-the-weighted-squares>

The commutator in Lemma 10 has a compensating quadratic term $P_T$. Keeping that term is what permits a dimension-free estimate without assuming that the Jacobian and the first-chaos matrix commute.

#thm([Lemma 3.4.])[
  (Commutator estimate).  #emph[For the matrices $X_r \, B \, S \, T$ in (3.6) and (3.9), any square-integrable symmetric matrix field $b$, and arbitrary square-integrable matrix fields $w_r$, 
$ - P_T - 2 tau (\[ T \, b \] sum_r X_r w_r) - tau (T sum_r w_r^t w_r) lt.eq (1 + s / 8) parallel w parallel^2 . quad "(3.21)" $ <mat:commutator-bound>

]
] <mat:commutator>

#proof[
  Work pointwise and diagonalize $S$. The relation $B = alpha^(- 1) \( S^(- 1) - I \/ s \)$ gives
  $ P_T = frac(1, 2 alpha) parallel S^(- 1 \/ 2) \[ T \, b \] S^(- 1 \/ 2) #scale(x: 120%, y: 120%)[parallel]^2 . quad "(3.22)" $ <mat:P-square>
  Indeed, the contribution of $b_(i j)^2$ for $i < j$ on either side is $\( S_i - S_j \)^2 \/ \( alpha S_i S_j \)$. The norm in (3.22) includes expectation. Set $F = sum_r X_r w_r$ and let $"skew" M = \( M - M^t \) \/ 2$. Completing the square in the skew-symmetric matrix $S^(- 1 \/ 2) \[ T \, b \] S^(- 1 \/ 2)$ bounds the first two terms on the left of (3.21) by
  $ 2 alpha parallel "skew" \( S^(1 \/ 2) F S^(1 \/ 2) \) #scale(x: 120%, y: 120%)[parallel]^2 . $
  For completeness, we estimate this square together with the last term. Write $S_i = s u_i$, where $0 < u_i lt.eq 1$, so $alpha S_i B_i = 1 - u_i$. The rows of the block matrix $X = \( X_1 \, dots.h \, X_m \)$ are orthogonal, since $X X^t = B$ is diagonal. For column $j$ of the vertically stacked matrix $\( w_r \)_r$, let $z_(i j)$ be its component along the normalized $i$th row of $X$. Zero rows can be completed to orthonormal directions, and cause no contribution to $F$. Then $F_(i j) = sqrt(B_i) thin z_(i j)$ and the remaining column components are orthogonal to these directions.
  For $i < j$, the quadratic form in $\( z_(i j) \, z_(j i) \)$ has matrix
  $ mat(delim: "(", 1 - s u_i u_j, - s sqrt(u_i u_j \( 1 - u_i \) \( 1 - u_j \)); - s sqrt(u_i u_j \( 1 - u_i \) \( 1 - u_j \)), 1 - s u_i u_j) . $
  Its largest eigenvalue is at most $1 + s \( z - 2 z^2 \) lt.eq 1 + s \/ 8$, where $z = sqrt(u_i u_j)$; here $\( 1 - u_i \) \( 1 - u_j \) lt.eq \( 1 - z \)^2$. Diagonal and orthogonal column components have coefficient at most $1$. Summation and expectation prove (3.21). ◻
]

We also use a block version of Cauchy–Schwarz. If $X = \( X_1 \, dots.h \, X_m \)$ and $S^(- 1) = I \/ s + alpha X X^t$, then

$ ∥a + sum_r X_r L_r∥_S^2 lt.eq s parallel a parallel^2 + 1 / alpha parallel L parallel^2 . quad "(3.23)" $ <mat:block-bound>

This follows column by column because the block operator $S^(1 \/ 2) \( I \/ sqrt(s) \, sqrt(alpha) X \)$ has product with its transpose equal to $I$.

The scalar estimates in Lemma 14 give $p \( a \) > 0$ for every real $a$. To reserve part of the negative $H$ term for the cost of $log det S$, fix

$ epsilon.alt = 3 / 20 \, #h(2em) kappa = 49 / 100 \, quad "(3.24)" $ <mat:completion-constants>

and put

$ rho = epsilon.alt I + kappa S \/ s . $

Then $I - rho > 0$. A weighted completion of the square gives

$ tau [T (Y h_0 + sum_r X_r M_r)] & lt.eq tau #scale(x: 120%, y: 120%)[\(] H \( I - rho \) p #scale(x: 120%, y: 120%)[\)] + frac(parallel M p^(- 1 \/ 2) parallel^2, 4 \( 1 - epsilon.alt \)) + frac(alpha s parallel Y h_0 p^(- 1 \/ 2) parallel^2, 4 \( 1 - epsilon.alt - kappa \)) . quad "(3.25)" $ <mat:weighted-completion>

To verify that the order of the weights is valid, write $Q_0 = H \( I - rho \)$ and $F = Y h_0 + sum_r X_r M_r$. Apply $chevron.l a \, b chevron.r lt.eq parallel a parallel^2 + 1 / 4 parallel b parallel^2$ to $Q_0^(1 \/ 2) p^(1 \/ 2)$ and $Q_0^(- 1 \/ 2) T F p^(- 1 \/ 2)$. The resulting second square has left weight bounded above by

$ T^2 Q_0^(- 1) lt.eq alpha S \( I - rho \)^(- 1) \, $

with equality on the range of $H$. Here inverses are interpreted as pseudoinverses on the common nullspace of $Q_0$ and $T$. Since

$ \( I - rho \) S^(- 1) = frac(1 - epsilon.alt - kappa, s) I + \( 1 - epsilon.alt \) alpha X X^t \, $

the same block argument as in (3.23) proves (3.25). Thus this step does not require $p$ to commute with $S$.

=== 3.4 Two scalar estimates and the final chaos bound <two-scalar-estimates-and-the-final-chaos-bound>

The following estimate combines the cost $"tr" \( T - log S \)$ with the negative $H$ term left by (3.25) and the terms quadratic in $Y$. A second estimate will control the derivative residuals, including their dependence on $Z$, by $cal(C)$ and the higher-chaos energy. The proof of the first estimate is given in Section 4.1. Its strict remainder controls the eigenvalues of $B$ through the weight (3.1).

#thm([Proposition 3.5.])[
  (Absorption with a first-chaos remainder).  #emph[Let $A in L^2 \( gamma_m \; "Sym"_m \)$ satisfy $bb(E) A = 0$, and define $X_r \, Y \, B$ by (3.6) and $S \, T \, H$ by (3.9). With the constants (3.8), (3.14), and (3.24), the functions (3.16), and $rho = epsilon.alt I + kappa S \/ s$, one has 
$ & "tr" \( T - log S \) - tau \( H rho p \) + s tau [Y^2 (\( b - beta \)^2 + frac(alpha h_0^2, 4 \( 1 - epsilon.alt - kappa \) p))]\
 & thin lt.eq 69 / 500 parallel Y parallel^2 - 1 / 1000 sum_(i = 1)^m omega \( lambda_i \) \, quad "(3.26)" $ <mat:absorption-inequality>

 where $lambda_1 \, dots.h \, lambda_m$ are the eigenvalues of $B$. All scalar factors in the expected traces are evaluated at $A$.]
] <mat:scalar-absorption>

The remaining derivative terms are compared entrywise in an eigenbasis of $A$. This comparison retains a multiple of the eigenvalue-separation surplus $cal(C)$ rather than discarding it.

#thm([Proposition 3.6.])[
  (Two-eigenvalue estimate).  #emph[Let $a_i \, a_j in bb(R)$ and $G \, g \, Z in bb(R)$. Set 
$ delta = \| log \( q \( a_i \) \/ q \( a_j \) \) #scale(x: 120%, y: 120%)[\|] \, #h(2em) r_(i j) = frac(1 + m_0 \( min \( a_i \, a_j \) \), 16) (1 + delta^2 / 30 + delta^4 / 1680) \, $

 where $m_0$ is the six-interval lower bound in (2.5). Define the endpoint residuals 
$ D_j = G b_j + Z Delta k_(i j) \, & L_j = G l_j + Z Delta b_(i j) \, & M_j = G e_j + Z psi_(i j) + c g b_j \,\
D_i = G b_i + Z Delta k_(j i) \, & L_i = G l_i + Z Delta b_(j i) \, & M_i = G e_i + Z psi_(j i) + c g b_i . $

 Let $Q \( u \, v \) = 43 / 100 u^2 + 26 / 100 u v + 68 / 25 v^2$. Then 
$ & "avg"_(v = i \, j) [s \( D_v - beta g \)^2 + (1 + s / 8) \( D_v - gamma g \)^2 + gamma^2 \( s - 1 \) g^2 + L_v^2 / alpha + frac(M_v^2, 4 \( 1 - epsilon.alt \) p_v)]\
 & thin lt.eq Q \( G \, g - G \/ 2 \) + r_(i j) delta^2 Z^2 . quad "(3.27)" $ <mat:pair-inequality>

 Here $"avg"_(v = i \, j)$ is the arithmetic mean of the two endpoint expressions, counting both also when $i = j$. Moreover $p_v = p \( a_v \) > 0$, and all divided differences extend continuously to $a_i = a_j$.]
] <mat:scalar-pair>

The proof of Proposition 13 occupies Section 4.2. We now show that these two scalar estimates close the matrix argument.

#proof[
  Apply Lemma 10 in (3.11). Bound its last line by Lemma 11, its first square by (3.23), and its linear $T$ term by (3.25). The $H$ terms combine to $- tau \( H rho p \)$. Since $Y = Y^t$ and $h_0 \, p \, b$ are commuting functions of $A$, the two terms quadratic in $Y$ have exactly the form appearing in (3.26), by cyclicity of the trace; no commutation with $Y$ is required. Set $Omega_B = sum_(i = 1)^m omega \( lambda_i \)$. Consequently,
  $ D lt.eq  & - V_0 - cal(C) + 69 / 500 parallel Y parallel^2 - Omega_B / 1000 + parallel D - beta g parallel_S^2 + (1 + s / 8) parallel D - gamma g parallel^2 + 1 / alpha parallel L parallel^2\
 & thin + gamma^2 tau (T sum_r g_r^2) + frac(parallel M p^(- 1 \/ 2) parallel^2, 4 \( 1 - epsilon.alt \)) . quad "(3.28)" $ <mat:pre-pair>
  Use $S lt.eq s I$ and $T lt.eq \( s - 1 \) I$. In an eigenbasis of $A$, the entries of $G_r \, g_r \, Z_r$ are symmetric in $i \, j$. Pairing the entries $\( i \, j \)$ and $\( j \, i \)$ therefore gives precisely the endpoint average in (3.27); right multiplication by $p^(- 1 \/ 2)$ gives the denominator $p_j$ for entry $\( i \, j \)$. Proposition 13 now bounds the last five terms of (3.28) by
  $ bb(E) sum_(i \, j \, r) Q #scale(x: 120%, y: 120%)[\(] \( G_r \)_(i j) \, \( g_r \)_(i j) - \( G_r \)_(i j) \/ 2 #scale(x: 120%, y: 120%)[\)] + cal(C) . $
  The separation surplus is the same $cal(C)$ as in Proposition 7: its coefficient at $\( i \, j \)$ is independent of the derivative index $r$, so summing over $r$ is unchanged by rotating that index. All changes of eigenbasis are pointwise; no eigenvectors are differentiated. The separation surplus cancels. Because $Q$ has constant coefficients, its summed quadratic form is invariant under orthonormal changes of basis. We may therefore return to fixed coordinates and apply the Gaussian chaos decomposition.
  For a degree-$d$ component of $Y$, where $d gt.eq 2$, the associated components of $g$ and $G$ satisfy $g = G \/ d$, and $parallel G parallel^2 = d parallel Y parallel^2$. Different degrees remain orthogonal after differentiation. The required bound follows, degree by degree, from
  $ Q \( 1 \, u - 1 \/ 2 \) + 7 / 50 u lt.eq 1 - u \, #h(2em) 0 lt.eq u lt.eq 1 / 2 . quad "(3.29)" $ <mat:final-polynomial>
  Indeed, the right side minus the left side factors as $1 / 50 \( 1 - 2 u \) \( 1 + 68 u \) gt.eq 0$. Set $u = 1 \/ d$, multiply by $parallel G parallel^2$, and sum over the chaoses; the sums converge because $Y in H^1 \( gamma_m \)$. The summed $Q$ term is at most $V_0 - 7 / 50 parallel Y parallel^2$. Substitution into (3.28) therefore gives
  $ D lt.eq - 1 / 500 parallel Y parallel^2 - Omega_B / 1000 \, $
  which is (3.2). ◻
]

== 4 The two scalar estimates <sc:scalar>

The matrix argument has reduced the entropy inequality to two estimates. Proposition 12 controls the part depending on the first Gaussian chaos; Proposition 13 controls the remaining quadratic form, one pair of eigenvalues at a time. We prove them here. The functions $q \, d \, k \, b \, l$ and the six intervals $O \, P_1 \, R_1 \, U_1 \, V_1 \, T_1$ are those of the transport section, and the constants $alpha \, s \, beta \, c \, gamma \, epsilon.alt \, kappa$ and functions $p \, e \, h_0$ are those of the matrix section. All finite decimals below denote exact rational numbers.

We first state the one-variable bounds used in both proofs. Their verification is given in Appendix 8; in particular, none of the bounds in this section is inferred from numerical sampling. For the quadratic form in Proposition 13, set

$ D_(*) = frac(1, 4 \( 1 - epsilon.alt \)) \, #h(2em) sans(D) = D_(*) / p \, quad sans(L) = l / alpha \, quad sans(E) = e + gamma b = p + b \( .75 - b \) - l^2 / alpha \,\
K_0 = sans(D) sans(E) \, #h(2em) J_0 = sans(D) c b \,\
A_(*) = s + 1 + s \/ 8 \, quad eta_(*) = s beta + \( 1 + s \/ 8 \) gamma \, quad nu_(*) = s beta^2 + \( 9 s \/ 8 \) gamma^2 . quad "(4.1)" $ <sc:auxiliary-functions>

The symbols $sans(D) \, sans(L) \, sans(E)$ denote scalar functions, to be distinguished from the matrix residuals $D_r \, L_r \, M_r$ of the preceding section.

#thm([Lemma 4.1.])[
  (One-variable bounds).  #emph[For every $a in bb(R)$, 
$ p \( a \) > 0 \, #h(2em) \| h_0 \( a \) \| lt.eq .67 sqrt(p \( a \)) \,\
p \( a \) gt.eq cases(delim: "{", \( 7 + a^2 \)^(- 1) \, & a lt.eq 0 \,, .25 \, & a gt.eq 0 \,) #h(2em) p \( a \) gt.eq .46 quad \( a gt.eq 4 \) . quad "(4.2)" $ <sc:p-h-bounds>

 The following interval bounds hold: 
$ & b & sans(L) lt.eq & sans(D) lt.eq & K_0 & J_0 lt.eq & ell_1\
O & \[ 0 \, .09 \] & .60 & .295 \( 7 + a^2 \) & \[ .37 \, .56 \] & .72 & .13\
P_1 & \[ .083 \, .15 \] & 1.01 & 4.3 & \[ .29 \, .46 \] & .72 & .13\
R_1 & \[ .14 \, .23 \] & 1.19 & 3.00 & \[ .29 \, .371 \] & .68 & .13\
U_1 & \[ .22 \, .342 \] & 1.19 & 1.72 & \[ .29 \, .398 \] & .61 & .123\
V_1 & \[ .337 \, .45 \] & .83 & .87 & \[ .31 \, .4 \] & .50 & .060\
T_1 & \[ .445 \, .5 \] & .20 & .640 & \[ .32 \, .4 \] & .48 & .022 quad "(4.3)" $ <sc:interval-table>

 Here $ell_1$ is the positive number in the last column, and 
$ Q - mat(delim: "(", A_(*) b^2 - eta_(*) b + nu_(*) \/ 4 + l^2 \/ alpha, nu_(*) \/ 2 - eta_(*) b; nu_(*) \/ 2 - eta_(*) b, nu_(*)) - sans(D) vec(sans(E), c b) mat(delim: "(", sans(E), c b) succ.curly.eq mat(delim: "(", ell_1, 0; 0, .75) . quad "(4.4)" $ <sc:local-surplus>

 Here $Q = mat(delim: "(", .43, .13; .13, 2.72)$, as in Proposition 13. Finally, writing 
$ z = l' / l \, #h(2em) h_(*) = 1 + 3 b + k z \, #h(2em) chi = l / d \, quad "(4.5)" $ <sc:derivative-functions>

 we have 
$ & z & h_(*) & chi lt.eq\
a lt.eq - 1 & \[ - .08 \, .70 \] & \[ .8 \, 1.77 \] & .070\
a gt.eq - 1 & \[ - .475 \, 0 \] & \[ .8 \, 1.77 \] & .097 quad "(4.6)" $ <sc:derivative-table>

 At an endpoint shared by two intervals, either applicable row may be used.]
] <sc:bounds>

The first line of the lemma supplies a lower bound for the mean of $p$ from only a second moment. The matrix surplus in (4.4) then provides room to absorb the secant errors in the second proposition. We treat these two uses separately.

=== 4.1 Absorption using a second moment <sc:absorption-proof>

#proof[
  By $0 < b < 1 \/ 2$ and (4.2),
  $ s (\( b - beta \)^2 + frac(alpha h_0^2, 4 \( 1 - epsilon.alt - kappa \) p)) lt.eq s (.28^2 + frac(.075 dot.op .67^2, 4 dot.op .36)) < .111 . quad "(4.7)" $ <sc:y-cost>
  It remains to bound the terms involving $T - log S$ while retaining a negative multiple of the weight $omega$ in (3.1).
  Fix a unit eigenvector $v$ of $B$ with eigenvalue $lambda gt.eq 0$. The corresponding eigenvalues of $S \, T \, H \, rho$ are
  $ S = \( 1 \/ s + alpha lambda \)^(- 1) \, quad T = S - 1 \, quad H = alpha S \( lambda - 1 \)^2 \, quad rho = epsilon.alt + kappa S \/ s . $
  Let $nu_v$ be the probability measure obtained by averaging the spectral measure of $A$ at $v$. The decomposition of $A$ into its first chaos and $Y$ gives
  $ integral a thin d nu_v \( a \) = 0 \, #h(2em) integral a^2 thin d nu_v \( a \) = lambda + r \, #h(2em) r = v^(sans(T)) bb(E) \( Y^2 \) v gt.eq 0 . quad "(4.8)" $ <sc:spectral-moments>
  Indeed, orthogonality of the Gaussian chaoses gives $bb(E) A^2 = B + bb(E) Y^2$, including the vanishing of both matrix cross terms.
  For $0 < u lt.eq .13$, define
  $ n_u = u^(3 \/ 2) / 2 \, #h(2em) d_u = frac(u^3, 16 \( .46 - u \)) . $
  We claim the following quadratic minorant:
  $ p \( a \) gt.eq u + n_u a - d_u a^2 #h(2em) \( a in bb(R) \) . quad "(4.9)" $ <sc:p-minorant>
  For $a lt.eq 0$, put $x = - sqrt(u) thin a$. If $x gt.eq 2$, the right side is nonpositive. If $0 lt.eq x lt.eq 2$, it is enough to use $p \( a \) gt.eq u \/ \( x^2 + 7 u \)$ and
  $ 1 - \( 1 - x \/ 2 \) \( x^2 + 7 u \) gt.eq frac(x \( x - 1 \)^2, 2) + .045 \( 2 - x \) gt.eq 0 . $
  For $0 lt.eq a lt.eq 4$, the right side of (4.9) is at most $.13 + 2 \( .13 \)^(3 \/ 2) < .25$. For $a gt.eq 4$, its maximum over all real $a$ is $u + n_u^2 \/ \( 4 d_u \) = .46$. Thus (4.9) follows from (4.2) in all three ranges.
  Choose
  $ u = min \( .13 \, 1.28 \/ sqrt(lambda) \) \, $
  with $u = .13$ when $lambda = 0$. Since $lambda u^2 lt.eq 1.28^2$, integration of the minorant against (4.8) yields
  $ integral p thin d nu_v gt.eq u - d_u \( lambda + r \) gt.eq .689 u - d_u r . quad "(4.10)" $ <sc:p-mean>
  The second inequality uses $1 - 1.28^2 \/ \[ 16 \( .46 - .13 \) \] > .689$. We also have
  $ H rho d_u lt.eq .027 . quad "(4.11)" $ <sc:rho-loss>
  To check this, note that $rho lt.eq .64$ and that $H lt.eq lambda$ for $lambda gt.eq 1$, whereas $H lt.eq alpha s$ for $lambda lt.eq 1$. In the former case,
  $ H rho d_u lt.eq frac(.64 dot.op 1.28^2 dot.op .13, 16 \( .46 - .13 \)) < .02582 \; $
  in the latter, $alpha s dot.op .64 dot.op .13^3 \/ \[ 16 \( .46 - .13 \) \] < .027$.
  For completeness, we next verify the elementary logarithmic bound needed to compare $T - log S$ with the positive term in (4.10). Set
  $ F_0 \( S \) = frac(S \( S - 1 - log S \), \( 1 - S \)^2) \, #h(2em) F_0 \( 1 \) = 1 / 2 . $
  For $0 < S lt.eq s$ and $lambda = \( 1 \/ S - 1 \/ s \) \/ alpha$, we claim
  $ frac(alpha F_0 \( S \), epsilon.alt + kappa S \/ s) lt.eq min \( .089 \, .88 \/ sqrt(lambda) \) lt.eq .688 u \, quad "(4.12)" $ <sc:log-bound>
  where the second bound in the minimum is interpreted as $+ oo$ at $lambda = 0$. First,
  $ F_0 \( S \) = integral_0^1 frac(S x, 1 - x + x S) thin d x $
  is concave. Its tangent at $S = .28$ has intercept below $.16$ and slope below $.52$, so $F_0 \( S \) lt.eq .16 + .52 S$. These two strict inequalities can, for example, be checked from
  $ - log \( .28 \) = 2 sum_(j = 0)^oo frac(\( 9 \/ 16 \)^(2 j + 1), 2 j + 1) \, $
  using twelve terms and the geometric bound for the remainder. Coefficient comparison now gives
  $ .075 \( .16 + .52 S \) < .089 \( .15 + .45325 S \) \, $
  which proves the first bound in the minimum.
  For the second bound we use
  $ frac(F_0 \( S \), sqrt(S)) lt.eq .478 + 1.4 S #h(2em) \( S > 0 \) . quad "(4.13)" $ <sc:F0-sqrt>
  Here is a direct verification, including the point $S = 1$ by continuity. For $x > 0$, let
  $ J \( x \) = frac(\( .478 + 1.4 x^2 \) \( 1 - x^2 \)^2, x) - \( x^2 - 1 - 2 log x \) . $
  Then
  $ x^2 J' \( x \) = P \( x \) := - .478 + 2 x + .444 x^2 - 2 x^3 - 6.966 x^4 + 7 x^6 . $
  Descartes’ rule of signs gives at most three positive roots of $P$, counting multiplicity. The signs at $.24 \, .26 \, .6$, together with $P \( 1 \) = 0$ and $P' \( 1 \) > 0$, give exactly three: one in $\( .24 \, .26 \)$, one in $\( .26 \, .6 \)$, and $1$. Thus the only local minima of $J$ occur at the first root and at $1$. We have $J \( 1 \) = 0$ and $J \( .25 \) > .14$; the latter follows already from $log 2 < .694$. On $\[ .24 \, .26 \]$, $\| P \( .25 \) \| < .01$ and $\| P' \| < 4$, hence $\| J' \| < 2$. The first minimum is therefore positive. Also $J \( x \) arrow.r + oo$ at both ends of $\( 0 \, oo \)$. This proves $J gt.eq 0$, which is equivalent to (4.13) away from $x = 1$.
  Using $alpha lambda = 1 \/ S - 1 \/ s$, inequality (4.13) gives
  $ frac(alpha F_0 \( S \) sqrt(lambda), rho) lt.eq sqrt(alpha) sqrt(1 - S \/ s) thin frac(.478 + 1.4 S, .15 + .45325 S) lt.eq frac(sqrt(.075) dot.op .478, .15) < .88 . $
  The last ratio decreases in $S$ because $1.4 dot.op .15 < .478 dot.op .45325$. Finally, $.089 < .688 dot.op .13$ and $.88 < .688 dot.op 1.28$ prove the last inequality in (4.12).
  For $lambda eq.not 1$ we have
  $ frac(T - log S, H rho) = frac(alpha F_0 \( S \), rho) . $
  Combining (4.10)–(4.12), and treating $lambda = 1$ by continuity, gives
  $ T - log S - H rho integral p thin d nu_v lt.eq - .001 H rho u + .027 r . $
  The definitions give $H rho u = omega \( lambda \)$. Sum over an orthonormal eigenbasis of the matrix $B$, and add (4.7). This summation evaluates $tau \( H rho p \( A \) \)$ without requiring $p \( A \)$ to commute with $B$. Likewise, (4.7) may be integrated against the positive semidefinite matrix $Y^2$ without a commutation assumption. Since $sum_v r = lr(bar.v.double Y bar.v.double)^2$, the result is
  $ \( .027 + .111 \) lr(bar.v.double Y bar.v.double)^2 - .001 sum_i omega \( lambda_i \) = 69 / 500 lr(bar.v.double Y bar.v.double)^2 - 1 / 1000 sum_i omega \( lambda_i \) \, $
  as asserted. ◻
]

=== 4.2 A quadratic estimate for two endpoints <sc:pair-proof>

#proof[
  Fix two endpoints $a_(-) lt.eq a_(+)$ and write
  $ delta = log q \( a_(+) \) - log q \( a_(-) \) \, #h(2em) m_(*) = m_0 \( a_(-) \) . $
  When the endpoints coincide, all secant increments vanish, and (4.4) immediately proves the assertion. We henceforth suppose $delta > 0$.
  We first isolate the cost of the secant increments at one endpoint $a_j$. Use coordinates $\( G \, h \)$ with $h = g - G \/ 2$. With $Z = 0$, the left side of the endpoint quadratic form in Proposition 13 is exactly the two matrices subtracted from $Q$ in (4.4). For an increment vector $\( x \, y \, w \)$, define
  $ cal(N)_j \( x \, y \, w \)^2 =  & A_(*) x^2 + y^2 \/ alpha + sans(D)_j w^2\
 & + frac(\( \( A_(*) b_j - eta_(*) \/ 2 \) x + sans(L)_j y + K_(0 j) w \)^2, ell_(1 j)) + frac(\( - eta_(*) x + J_(0 j) w \)^2, .75) . quad "(4.14)" $ <sc:increment-norm>
  Completing squares against the surplus $ell_(1 j) G^2 + .75 h^2$ in (4.4) shows that the full endpoint form is bounded above by
  $ Q \( G \, h \) + Z^2 cal(N)_j \( Delta k \, Delta b \, psi_j \)^2 . quad "(4.15)" $ <sc:one-endpoint>
  Indeed, the two coefficients of $2 G Z$ and $2 h Z$ are precisely the numerators of the two squared terms in (4.14). The first line of that formula is the coefficient of $Z^2$ before completion of squares.
  The next step estimates these increment norms by integrating derivatives between the endpoints. Recall that a secant slope is the uniform average of the derivative over $\[ a_(-) \, a_(+) \]$. With $xi = log q \( a \)$, differentiation therefore gives the vector
  $ v_j \( a \) = chi \( a \) \( 1 \, z \( a \) \, W_j \( a \) \) \, #h(2em) W_j \( a \) = h_(*) \( a \) - 2 b_j - 2 sans(L)_j z \( a \) . quad "(4.16)" $ <sc:derivative-vector>
  More explicitly, $\( Delta k \, Delta b \, psi_j \)$ is the uniform average in $a$ of $integral_(log q \( a_j \))^(log q \( a \)) v_j \( q^(- 1) \( e^xi \) \) thin d xi$. This follows from $b' = l$, $l' = z l$, $d \( log q \) \/ d a = d$, and $f'' = l \( 1 + 3 b + k z \) = l h_(*)$. Put
  $ F_j \( a \) = cal(N)_j \( v_j \( a \) \)^2 . $
  We record the bounds furnished by Lemma 14. If the endpoint $a_j$ belongs to $R_1 \, U_1 \, V_1 \, T_1$, respectively, then
  $ F_j \( a \) lt.eq .295 \, quad .23 \, quad .23 \, quad .39 #h(2em) upright("for all ") a . quad "(4.17)" $ <sc:F-simple>
  For $a lt.eq - 1$, the $R_1$ bound improves to $.20$. For $a_j in P_1$, the bounds are $.42^2$ when $a lt.eq - 1$ and $.61^2$ when $a gt.eq - 1$. If $a_j in O$, write $t_j = - a_j$; then
  $ frac(F_j \( a \), chi \( a \)^2) lt.eq cases(delim: "{", 20 + 1.04 \( 7 + t_j^2 \) \, & a lt.eq - 1 \,, 12 + 1.63 \( 7 + t_j^2 \) \, & a gt.eq - 1 .) quad "(4.18)" $ <sc:F-negative>
  For clarity, the complete finite arithmetic behind these bounds is given by the following table. Its three entries bound, in order,
  $ \| W_j \| \, #h(2em) \| A_(*) b_j - eta_(*) \/ 2 + sans(L)_j z + K_(0 j) W_j \| \, #h(2em) \| - eta_(*) + J_(0 j) W_j \| . $
  $ & a lt.eq - 1 & a gt.eq - 1\
O & \( 1.867 \, .52 \, 1.314 \) & \( 2.34 \, .55 \, 1.155 \)\
P_1 & \( 1.766 \, .49 \, 1.813 \) & \( 2.564 \, .433 \, 1.155 \)\
R_1 & \( 1.681 \, .664 \, 2.057 \) & \( 2.621 \, .420 \, 1.155 \)\
U_1 & \( 1.55 \, .847 \, 2.101 \) & \( 2.461 \, .615 \, 1.155 \)\
V_1 & \( 1.263 \, .912 \, 1.787 \) & \( 1.885 \, .770 \, 1.205 \)\
T_1 & \( .913 \, .869 \, 1.386 \) & \( 1.071 \, .840 \, 1.251 \) quad "(4.19)" $ <sc:substitution-table>
  To verify it, substitute the intervals in (4.3) and (4.6); each expression is affine in each of its variables separately, so its extrema occur at corners of the corresponding box. For the middle expression, first write it as
  $ \( A_(*) - 2 K_(0 j) \) b_j - eta_(*) \/ 2 + K_(0 j) h_(*) + \( 1 - 2 K_(0 j) \) sans(L)_j z . $
  Substituting these three bounds into (4.14), together with the bounds for $sans(D)_j \, ell_(1 j) \, z \, chi$, proves (4.17)–(4.18). All these are finite rational comparisons; the exact verifier accompanying Appendix 8 also checks them.
  It remains to compare the integrated derivative cost with the logarithmic separation surplus. Let $u_(-)$ be the mean of $\( log q \( a \) - log q \( a_(-) \) \) \/ delta$ under the uniform probability measure on $\[ a_(-) \, a_(+) \]$, and put $u_(+) = 1 - u_(-)$. In the $xi$ coordinate this measure has density proportional to $D_0 = 1 \/ d$. The excess-variance bound in Lemma 3 gives
  $ 0 lt.eq frac(d log D_0, d xi) = frac(1 - q d, d^2) lt.eq 1 . $
  The density $D_0$ is increasing, whereas $D_0 e^(- xi)$ is decreasing. The covariance of an increasing function with an increasing function is nonnegative, and with a decreasing function is nonpositive. Applying this observation to the coordinate $xi$ compares its mean first with constant density and then with density proportional to $e^xi$. The latter comparison gives $u_(-) lt.eq 1 / 2 + 1 / 2 coth \( delta \/ 2 \) - 1 \/ delta$, and hence
  $ 1 / 2 lt.eq u_(-) lt.eq 1 / 2 + delta \/ 12 \, #h(2em) u_(-)^2 + u_(+)^2 lt.eq 1 / 2 \( 1 + delta^2 \/ 36 \) . quad "(4.20)" $ <sc:mean-distance>
  For the upper bound one uses $coth x - 1 \/ x lt.eq x \/ 3$, obtained by comparing the power series of $x cosh x$ and $\( 1 + x^2 \/ 3 \) sinh x$.
  Suppose $P_(-)$ and $P_(+)$ have the following property: on every partial $xi$-interval starting at the indicated endpoint, the mean of $cal(N)_j \( v_j \)$ is at most $sqrt(P_j)$. Pointwise bounds for $F_j$ are one way to ensure this property. Minkowski’s inequality, followed by the uniform average in $a$, gives
  $ cal(N)_(-) \( Delta k \, Delta b \, psi_(-) \) lt.eq sqrt(P_(-)) thin delta u_(-) \, #h(2em) cal(N)_(+) \( Delta k \, Delta b \, psi_(+) \) lt.eq sqrt(P_(+)) thin delta u_(+) . $
  Since $u_(-) gt.eq u_(+) gt.eq 0$,
  $ P_(-) u_(-)^2 + P_(+) u_(+)^2 lt.eq max (P_(-) \, frac(P_(-) + P_(+), 2)) \( u_(-)^2 + u_(+)^2 \) . $
  Averaging (4.15) and applying (4.20) therefore proves the desired estimate whenever
  $ max (P_(-) \, frac(P_(-) + P_(+), 2)) lt.eq Theta_(m_(*)) \( delta \) := frac(1 + m_(*), 4) thin frac(1 + delta^2 \/ 30 + delta^4 \/ 1680, 1 + delta^2 \/ 36) . quad "(4.21)" $ <sc:threshold>
  Indeed, the resulting coefficient of $Z^2$ is at most $delta^2 \( 1 + delta^2 \/ 36 \) Theta_(m_(*)) \( delta \) \/ 4 = r_(- +) delta^2$.
  We verify (4.21) for all endpoint positions. The function $Theta_m$ increases in $delta gt.eq 0$: differentiation with respect to $y = delta^2$ leaves a positive numerator $1 \/ 180 + 2 y \/ 1680 + y^2 \/ \( 1680 dot.op 36 \)$. We will also use the following observation about partial intervals: if a smaller bound holds on an initial segment of logarithmic length $L$, then its fraction in a partial interval of length $h lt.eq delta$ is at least $min \( 1 \, L \/ h \) gt.eq L \/ delta$, provided $delta gt.eq L$. If $a_(-) in R_1$, take $P_(-) lt.eq .295$ and $P_(+) lt.eq .39$; then $\( P_(-) + P_(+) \) \/ 2 lt.eq .3425 < Theta_.38 \( 0 \) = .345$. For $a_(-) in U_1$ or $V_1$, use $P_(-) lt.eq .23$, $P_(+) lt.eq .39$ and $Theta_.68 \( 0 \) = .42$. For $a_(-) in T_1$, both bounds are $.39 < .42$.
  Now suppose $a_(-) in P_1$. If $a_(+) lt.eq - 1$, both endpoint costs are at most $.20 < Theta_.19 \( 0 \)$, using the $R_1$ row at $a_(+) = - 1$. Otherwise, the part of the logarithmic interval below $- 1$ has length at least $1.62$. Hence every partial interval from the lower endpoint has mean norm at most
  $ .61 - frac(\( .61 - .42 \) 1.62, delta) \, #h(2em) P_(-) = \( .61 - .3078 \/ delta \)^2 . $
  The length assertion follows from $q \( - 1 \) > .287$, $q \( - 2 \) < .056$. If the upper endpoint lies in $T_1$, then $delta > 4$ because $q \( 4 \) > 4$. For $delta lt.eq 4$, therefore, $P_(+) lt.eq .23$ and $P_(-) lt.eq .284143 < Theta_.19 \( 0 \) = .2975$. For $4 lt.eq delta lt.eq 5$, use $P_(-) < .300787$, $P_(+) lt.eq .39$, and
  $ max \( .300787 \, \( .300787 + .39 \) \/ 2 \) < .345394 < Theta_.19 \( 4 \) . $
  For $delta gt.eq 5$, use $P_(-) lt.eq .61^2 = .3721$ and
  $ max \( .3721 \, \( .3721 + .39 \) \/ 2 \) = .38105 < Theta_.19 \( 5 \) . $
  This covers $P_1$.
  Finally suppose $a_(-) in O$. For any endpoint $a_j in O$ and any argument $a lt.eq - 1$ between the endpoints,
  $ t_j^2 lt.eq a^2 + 2 delta \, #h(2em) \| a \| chi \( a \) lt.eq .09 . $
  The first follows by integrating $d gt.eq - a$ on the negative half-line; the second follows from $l lt.eq .075 dot.op 1.19 < .09$ and $d gt.eq \| a \|$. Using $chi lt.eq .07$ in (4.18) gives
  $ F_j \( a \) lt.eq .144 + .011 delta . quad "(4.22)" $ <sc:O-low-cost>
  If the whole interval lies at or below $- 1$, take $P_(-) = .144 + .011 delta$ and $P_(+) lt.eq max \( P_(-) \, .20 \)$; the latter bound also covers upper endpoints in $P_1$ and $R_1$. For $0 lt.eq delta lt.eq 4$, both are below $.25$. For $delta gt.eq 4$, use
  $ Theta_0 \( delta \) gt.eq .25 + .00260 delta^2 . quad "(4.23)" $ <sc:theta-tail>
  This follows on clearing denominators and using $delta^2 gt.eq 16$. The quadratic $.106 - .011 delta + .00260 delta^2$ is strictly positive, so (4.21) follows in this case too.
  If $a_(+) > - 1$, the first part of the logarithmic interval has length at least $4$, since $q \( - 3 \) < .005$ and $q \( - 1 \) > .287$. For $a gt.eq - 1$, the same integration gives $t_(-)^2 lt.eq 1 + 2 delta$; using $chi lt.eq .097$ in (4.18) yields $F_(-) \( a \) lt.eq .236 + .031 delta$. On every partial interval from the lower endpoint, Jensen’s inequality therefore permits the uniform bound
  $ P_(-) = .236 + .031 delta - 4 / delta \( .092 + .020 delta \) = .156 + .031 delta - .368 \/ delta . $
  For partial intervals contained below $- 1$, the same bound follows from (4.22), because $delta gt.eq 4$. By (4.23),
  $ Theta_0 \( delta \) - P_(-) gt.eq .094 - .031 delta + .00260 delta^2 + .368 \/ delta > 0 \; $
  the quadratic has negative discriminant and positive leading coefficient. If $a_(+) in.not T_1$, then $P_(+) lt.eq .23 < Theta_0 \( delta \)$. If $a_(+) in T_1$, then $delta > 6.5$ from $q \( 4 \) > 4$ and $q \( - 3 \) < .005$, and $P_(+) lt.eq .39 < Theta_0 \( 6.5 \) < Theta_0 \( delta \)$. This proves (4.21) in every case and completes the proof. ◻
]

== 5 Approximation of log-concave densities <geo:section>

The smooth estimate of Theorem 8 requires a potential with positive, bounded Hessian. We remove those restrictions while preserving the entropy, covariance, and first moments. The same approximation will let us study equality by applying the strict remainder estimate to smooth densities whose entropy gaps tend to zero.

=== 5.1 Convex approximation with entropy convergence <convex-approximation-with-entropy-convergence>

We use extended-valued convex potentials: $V : bb(R)^m arrow.r \( - oo \, + oo \]$ is proper if it is finite somewhere and never takes the value $- oo$. The convention $e^(- oo) = 0$ allows bounded supports. The elementary tail estimate below supplies a common integrable bound for the approximation, including its entropy integrand.

#thm([Lemma 5.1.])[
  #emph[Let $V : bb(R)^m arrow.r \( - oo \, + oo \]$ be proper, lower semicontinuous, and convex, with 
$ 0 < integral_(bb(R)^m) e^(- V \( x \)) thin thin upright(d) x < oo . $

 Then there are $a > 0$ and $b gt.eq 0$ such that 
$ V \( x \) gt.eq a \| x \| - b #h(2em) \( x in bb(R)^m \) . quad "(5.1)" $ <geo:linear-coercivity>

 In particular, $e^(- V)$ has moments of every order, and $integral \| V \| e^(- V) < oo$, where $\| V \| e^(- V)$ is interpreted as zero when $V = + oo$.]
] <geo:coercivity>

#proof[
  The convex set ${ V < oo }$ has positive measure and hence nonempty interior: otherwise its affine hull would be a proper affine subspace. Choose a simplex with all vertices in this set and with nonempty interior. Convexity bounds $V$ above by the largest of its values at the vertices throughout the simplex. Consequently, some ball $B \( x_0 \, r \)$ lies in a sublevel set ${ V lt.eq M }$, where $M gt.eq V \( x_0 \)$.
  The closed convex set $A = { V lt.eq M + 1 }$ has finite volume, since
  $ \| A \| lt.eq e^(M + 1) integral e^(- V) . $
  It is bounded. Indeed, the convex hull of $B \( x_0 \, r \)$ and a point $z in A$ contains a cone with base an $\( m - 1 \)$-dimensional disk of radius $r$ through $x_0$, perpendicular to $z - x_0$, and height $\| z - x_0 \|$. Its volume tends to infinity with $\| z - x_0 \|$. In dimension one the same assertion follows from the length of the interval joining $x_0$ to $z$.
  Choose $R > r$ so large that $A subset B \( x_0 \, R \)$. If $d = \| x - x_0 \| gt.eq R$ and $V \( x \) < oo$, put $y = x_0 + \( R \/ d \) \( x - x_0 \)$. Then $y in.not A$, and convexity gives
  $ M + 1 < V \( y \) lt.eq (1 - R / d) V \( x_0 \) + R / d V \( x \) . $
  Thus $V \( x \) > V \( x_0 \) + d \/ R$. The inequality is automatic if $V \( x \) = + oo$. On the compact ball $overline(B) \( x_0 \, R \)$, lower semicontinuity and properness give a finite lower bound: a sequence with values tending to $- oo$ would have a convergent subsequence and violate lower semicontinuity. Combining these two bounds proves (5.1), after enlarging $b$.
  The moment assertion follows from $e^(- V \( x \)) lt.eq e^b e^(- a \| x \|)$. For the entropy assertion, the elementary bound
  $ \| u \| e^(- u) lt.eq C_b e^(- u \/ 2) #h(2em) \( u gt.eq - b \) quad "(5.2)" $ <geo:entropy-domination>
  holds because $\| u \| e^(- u \/ 2)$ is bounded on $\[ - b \, oo \)$. Substitute $u = V \( x \)$ and use (5.1). ◻
]

#thm([Lemma 5.2.])[
  #emph[Let $f = e^(- V)$ be a log-concave probability density on $bb(R)^m$, represented by a proper lower semicontinuous convex potential $V$. There are smooth convex potentials $V_j$ and probability densities 
$ f_j = Z_j^(- 1) e^(- V_j) \, #h(2em) Z_j = integral_(bb(R)^m) e^(- V_j) \, $

 such that 
$ 2 / j I prec.curly.eq D^2 V_j prec.curly.eq (j + 2 / j) I #h(2em) \( j gt.eq 1 \) \, quad "(5.3)" $ <geo:hessian-bounds>

 and 
$ Z_j arrow.r 1 \, #h(2em) lr(bar.v.double f_j - f bar.v.double)_(L^1) arrow.r 0 \, #h(2em) h \( f_j \) arrow.r h \( f \) \, #h(2em) "Cov" \( f_j \) arrow.r "Cov" \( f \) . quad "(5.4)" $ <geo:approximation-limits>

 The covariance limit is entrywise, the means of $f_j$ converge to the mean of $f$, and all these quantities are finite.]
] <geo:approximation>

#proof[
  Fix $a \, b$ from Lemma 15. For each positive integer $j$, define the Moreau envelope #cite(label("Moreau1965")) Section 7
  $ Q_j \( x \) = inf_(y in bb(R)^m) {V \( y \) + j / 2 \| x - y \|^2} . quad "(5.5)" $ <geo:moreau>
  The expression in braces is lower semicontinuous, strictly convex on its effective domain, and tends to infinity as $\| y \| arrow.r oo$. It therefore has a unique minimizer $p_j \( x \)$, and $Q_j$ is finite everywhere. Moreover,
  $ Q_j \( x \) gt.eq a \| x \| - b - frac(a^2, 2 j) . quad "(5.6)" $ <geo:envelope-lower>
  Indeed, $V \( y \) gt.eq a \| x \| - a \| x - y \| - b$, and minimizing $j r^2 \/ 2 - a r$ over $r gt.eq 0$ proves the bound.
  For completeness, the needed regularity of $Q_j$ follows directly from the minimization. The optimality condition is $j \( x - p_j \( x \) \) in partial V \( p_j \( x \) \)$, where $partial V$ denotes the convex subdifferential. To obtain it, compare the minimum at $p = p_j \( x \)$ with $p + s \( z - p \)$, use convexity to bound $V \( p + s \( z - p \) \)$ above, divide by $s > 0$, and let $s arrow.b 0$. The resulting inequality is $V \( z \) gt.eq V \( p \) + j chevron.l x - p \, z - p chevron.r$. Adding the two subgradient inequalities at $p_j \( x \)$ and $p_j \( x' \)$ gives
  $ chevron.l x - x' \, p_j \( x \) - p_j \( x' \) chevron.r gt.eq \| p_j \( x \) - p_j \( x' \) \|^2 . $
  Consequently both $p_j$ and $x mapsto x - p_j \( x \)$ are $1$-Lipschitz. Evaluating the infimum at $p_j \( x \)$ and, in the reverse direction, at $p_j \( x + h \)$ shows that
  $ nabla Q_j \( x \) = j \( x - p_j \( x \) \) . $
  For example, the first comparison gives an upper error $j \| h \|^2 \/ 2$ after subtracting $j chevron.l x - p_j \( x \) \, h chevron.r$, and the second gives a lower error of order $j \| h \|^2$ by the Lipschitz estimate just proved. Thus $Q_j$ is continuously differentiable with $j$-Lipschitz gradient. It is convex, since the function minimized in (5.5) is jointly convex in $\( x \, y \)$.
  We next check convergence before smoothing. The functions $Q_j$ increase with $j$, and $Q_j \( x \) lt.eq V \( x \)$ when $V \( x \)$ is finite. If $Q_j \( x \)$ stays bounded above as $j arrow.r oo$, the identity at the minimizer and $V gt.eq - b$ imply
  $ \| x - p_j \( x \) \|^2 lt.eq frac(2 \( Q_j \( x \) + b \), j) arrow.r 0 . $
  Lower semicontinuity then gives $V \( x \) lt.eq liminf_j V \( p_j \( x \) \) lt.eq lim_j Q_j \( x \)$. This proves
  $ Q_j \( x \) arrow.r V \( x \) quad upright("for every ") x \, quad "(5.7)" $ <geo:envelope-limit>
  including the value $+ oo$.
  Choose a nonnegative even smooth function $eta$ supported in the unit ball with integral one, and set $eta_epsilon \( x \) = epsilon^(- m) eta \( x \/ epsilon \)$. Define
  $ V_j = Q_j * eta_(1 \/ j) + frac(\| x \|^2, j) . quad "(5.8)" $ <geo:smooth-potentials>
  Convolution preserves convexity and the Lipschitz bound on the gradient; hence (5.3) holds. Evenness gives $integral z eta \( z \) thin thin upright(d) z = 0$, so Jensen’s inequality and (5.6) yield the common bound
  $ V_j \( x \) gt.eq Q_j \( x \) gt.eq a \| x \| - B \, #h(2em) B = b + a^2 / 2 . quad "(5.9)" $ <geo:common-tail>
  Smoothing at this scale does not affect the limit. The $j$-Lipschitz bound on the gradient gives
  $ Q_j \( x - z \) lt.eq Q_j \( x \) - chevron.l nabla Q_j \( x \) \, z chevron.r + j / 2 \| z \|^2 . $
  Integrating against $eta_(1 \/ j)$ cancels the linear term, so
  $ 0 lt.eq \( Q_j * eta_(1 \/ j) \) \( x \) - Q_j \( x \) lt.eq frac(1, 2 j) #h(2em) \( x in bb(R)^m \) . $
  Together with (5.7), this proves $V_j \( x \) arrow.r V \( x \)$ everywhere.
  Now (5.9) dominates $\( 1 + \| x \|^2 \) e^(- V_j \( x \))$ by an integrable function independent of $j$. Applying (5.2) with $B$ in place of $b$ also gives
  $ \| V_j \( x \) \| e^(- V_j \( x \)) lt.eq C e^(- a \| x \| \/ 2) . $
  At points where $V = + oo$, both $e^(- V_j)$ and $V_j e^(- V_j)$ tend to zero. Dominated convergence therefore proves convergence of the normalizing constants, first moments, second moments, and the integrals $integral V_j e^(- V_j)$. Finally,
  $ h \( f_j \) = 1 / Z_j integral V_j e^(- V_j) + log Z_j \, $
  which proves all of (5.4). ◻
]

#proof[
  Apply Theorem 8 to the normalized potentials $V_j + log Z_j$ of Lemma 16. Their Hessians satisfy (5.3), so
  $ h \( f_j \) gt.eq m + 1 / 2 log det "Cov" \( f_j \) . $
  The covariance of $f$ is positive definite: zero variance in a nonzero direction would concentrate this Lebesgue density on an affine hyperplane. Thus (5.4) permits passage to the limit in both sides and proves the inequality. ◻
]

== 6 From vanishing slack to exponential products <sec:rigidity>

Write $delta \( f \) = h \( f \) - m - 1 / 2 log det "Cov" \( f \)$ for the nonnegative entropy gap. Theorem 8 controls the nonlinear part of the normalized matrix field and the sum of squares of its linear coefficients. We now show that this control determines every equality case. The structural step is local: the first two nonconstant terms of $q \( A \( x \) \)$ force the coefficients of a linear symmetric matrix field $A$ to commute whenever $q \( A \)$ is a Jacobian.

=== 6.1 Compatibility of a nonlinear Jacobian <compatibility-of-a-nonlinear-jacobian>

#thm([Lemma 6.1.])[
  (Rigidity of a linear matrix field).  #emph[Let $m gt.eq 1$, and let $X_1 \, dots.h \, X_m$ be real symmetric $m times m$ matrices satisfying 
$ sum_(r = 1)^m X_r^2 = I \, #h(2em) A \( x \) = sum_(r = 1)^m x_r X_r . $

 Suppose $F in W_(upright("loc"))^(1 \, 2) \( bb(R)^m \; bb(R)^m \)$ has weak Jacobian $D F = q \( A \)$ almost everywhere. Then there are an orthogonal matrix $U$, signs $sigma_1 \, dots.h \, sigma_m in { - 1 \, 1 }$, and $w in bb(R)^m$ such that 
$ U^(sans(T)) F \( U y \) = #scale(x: 120%, y: 120%)[\(] sigma_i t \( sigma_i y_i \) #scale(x: 120%, y: 120%)[\)]_(i = 1)^m + w #h(2em) upright("for almost every ") y in bb(R)^m . quad "(6.1)" $ <eq:rigid-map>

 In particular, $F_(\#) gamma_m$ is an affine image of the product of $m$ mean-one exponential laws, and its covariance matrix is $I$.]
] <lem:linear-jacobian>

#proof[
  Write $e_1 \, dots.h \, e_m$ for the standard basis and $J = q \( A \)$. Commutation of distributional derivatives of $F$ gives
  $ \( partial_r J \) e_s = \( partial_s J \) e_r #h(2em) \( 1 lt.eq r \, s lt.eq m \) . quad "(6.2)" $ <eq:jacobian-compatibility>
  The scalar function $q$ is real analytic near zero. Since $A \( 0 \) = 0$, its convergent power series, interpreted by matrix multiplication, gives
  $ J \( x \) = q \( 0 \) I + q' \( 0 \) A \( x \) + 1 / 2 q'' \( 0 \) A \( x \)^2 + O \( \| x \|^3 \) $
  near zero; the differentiated remainder is $O \( \| x \|^2 \)$. The identity $q' \( a \) = q \( a \) \( q \( a \) - a \)$ yields
  $ q \( 0 \) = sqrt(2 / pi) \, #h(2em) q' \( 0 \) = 2 / pi > 0 \, #h(2em) q'' \( 0 \) = sqrt(2 / pi) (4 / pi - 1) > 0 . $
  Thus (6.2), which is a pointwise identity between analytic functions near zero, has constant term
  $ X_r e_s = X_s e_r . quad "(6.3)" $ <eq:coefficient-symmetry>
  Equivalently, $A \( x \) z = A \( z \) x$ for all $x \, z in bb(R)^m$; in particular, $A \( x \) e_s = X_s x$. Its degree-one term is
  $ \( X_r A \( x \) + A \( x \) X_r \) e_s = \( X_s A \( x \) + A \( x \) X_s \) e_r . $
  The terms with leftmost factor $A \( x \)$ cancel by (6.3). The remaining equality is $\( X_r X_s - X_s X_r \) x = 0$ near zero, and hence
  $ X_r X_s = X_s X_r #h(2em) \( 1 lt.eq r \, s lt.eq m \) . quad "(6.4)" $ <eq:coefficients-commute>
  Commuting real symmetric matrices admit a common orthonormal eigenbasis. Choose the orthogonal matrix $U$ with those basis vectors as columns, and rotate both the input and the output. Then
  $ tilde(A) \( y \) = U^(sans(T)) A \( U y \) U = sum_(i = 1)^m y_i tilde(X)_i \, #h(2em) tilde(X)_i = U^(sans(T)) (sum_(r = 1)^m U_(r i) X_r) U $
  has diagonal coefficients. Orthogonality of $U$ gives $sum_i tilde(X)_i^2 = I$, and the identity $A \( x \) z = A \( z \) x$ gives $tilde(X)_i e_j = tilde(X)_j e_i$. If $i eq.not j$, these two vectors are multiples of different basis vectors, so both are zero. Consequently, only the $i$th diagonal entry of $tilde(X)_i$ can be nonzero. The sum-of-squares identity makes that entry a sign:
  $ tilde(X)_i = sigma_i e_i e_i^(sans(T)) \, #h(2em) tilde(A) \( y \) = "diag" \( sigma_1 y_1 \, dots.h \, sigma_m y_m \) . $
  It follows that
  $ D_y #scale(x: 120%, y: 120%)[\(] U^(sans(T)) F \( U y \) #scale(x: 120%, y: 120%)[\)] = "diag" #scale(x: 120%, y: 120%)[\(] q \( sigma_1 y_1 \) \, dots.h \, q \( sigma_m y_m \) #scale(x: 120%, y: 120%)[\)] . $
  Since $t' = q$ and $sigma_i^2 = 1$, the right side is also the Jacobian of $y mapsto \( sigma_i t \( sigma_i y_i \) \)_(i = 1)^m$. Their difference has zero weak gradient on the connected set $bb(R)^m$ and is therefore almost everywhere constant. This proves (6.1).
  For independent standard Gaussian coordinates $G_i$, the variables $t \( sigma_i G_i \)$ are independent mean-one exponentials. Their variances are one, and the signs and the orthogonal matrix preserve covariance $I$. This proves the final assertion. ◻
]

=== 6.2 Compactness and the proof of the equality classification <compactness-and-the-proof-of-the-equality-classification>

We first record the functional-calculus estimate that turns convergence of the normalized fields into convergence of transport Jacobians. The Frobenius norm is essential to this elementary argument.

#thm([Lemma 6.2.])[
  #emph[For real symmetric matrices $M \, N in bb(R)^(m times m)$, 
$ \| q \( M \) - q \( N \) \|_(upright(F)) lt.eq \| M - N \|_(upright(F)) . quad "(6.5)" $ <eq:spectral-lipschitz>

]
] <lem:spectral-lipschitz>

#proof[
  Let $\( u_i \)$ and $\( v_k \)$ be orthonormal eigenbases of $M$ and $N$, with eigenvalues $lambda_i$ and $mu_k$. Then
  $ u_i^(sans(T)) \( q \( M \) - q \( N \) \) v_k = \( q \( lambda_i \) - q \( mu_k \) \) thin u_i^(sans(T)) v_k \, $
  whereas the corresponding entry of $M - N$ is $\( lambda_i - mu_k \) u_i^(sans(T)) v_k$. The scalar bound $0 < q' < 1$ therefore bounds the absolute value of each former entry by the absolute value of the latter. Squaring and summing over $i \, k$ proves (6.5), because the Frobenius norm is unchanged by orthogonal changes of the row and column bases separately. ◻
]

#proof[
  Let $f$ be a log-concave probability density on $bb(R)^m$ with $delta \( f \) = 0$. Choose the approximating densities $f_j$ from Lemma 16. Write $a_j \, a$ for their means and the mean of $f$, and $C_j \, C$ for their covariance matrices. That lemma gives
  $ lr(bar.v.double f_j - f bar.v.double)_(L^1 \( bb(R)^m \)) arrow.r 0 \, #h(2em) a_j arrow.r a \, #h(2em) C_j arrow.r C \, #h(2em) delta \( f_j \) arrow.r 0 . quad "(6.6)" $ <eq:equality-approximation>
  Here $C$ is positive definite, as recalled in the introduction, so the covariance convergence also implies convergence of the log determinants.
  For each $j$, apply Proposition 5 to $f_j$. Let $P_j$ be its positive definite normalizing matrix and let $F_j$ transport $gamma_m$ to $\( P_j \)_(\#) \( f_j \( x \) thin thin upright(d) x \)$. In the notation of Theorem 8, put
  $ J_j = D F_j \, #h(2em) A_j = q^(- 1) \( J_j \) \, #h(2em) X_(j \, r) = bb(E) \[ x_r A_j \( x \) \] \,\
A_j \( x \) = sum_(r = 1)^m x_r X_(j \, r) + Y_j \( x \) \, #h(2em) B_j = sum_(r = 1)^m X_(j \, r)^2 . $
  The entropy gap is affine invariant. Theorem 8 and (6.6) therefore imply
  $ lr(bar.v.double Y_j bar.v.double)_(L^2 \( gamma_m \)) arrow.r 0 \, #h(2em) sum_(i = 1)^m omega \( lambda_i \( B_j \) \) arrow.r 0 . quad "(6.7)" $ <eq:vanishing-slack>
  The function $omega$ is continuous and nonnegative on $\[ 0 \, oo \)$, vanishes only at $1$, and tends to infinity at infinity. For every $epsilon > 0$, it consequently has a positive infimum on ${ lambda gt.eq 0 : \| lambda - 1 \| gt.eq epsilon }$. Thus every eigenvalue of $B_j$ tends to $1$, and $B_j arrow.r I$ in operator norm.
  Since $sum_r \| X_(j \, r) \|_(upright(F))^2 = "tr" B_j$, the coefficients form a bounded sequence in a finite-dimensional space. Pass to a subsequence such that $X_(j \, r) arrow.r X_r$ for every $r$. Each $X_r$ is symmetric, and Gaussian orthogonality together with (6.7) gives
  $ sum_(r = 1)^m X_r^2 = I \, #h(2em) A_j arrow.r A \( x \) := sum_(r = 1)^m x_r X_r quad upright("in ") L^2 \( gamma_m \) . quad "(6.8)" $ <eq:linear-field-limit>
  Lemma 18 now gives
  $ J_j = q \( A_j \) arrow.r J := q \( A \) quad upright("in ") L^2 \( gamma_m \) . quad "(6.9)" $ <eq:jacobian-limit>
  To obtain a limiting map, remove the irrelevant translations: $hat(F)_j = F_j - bb(E) F_j$. Each $hat(F)_j$ lies in $H^1 \( gamma_m \; bb(R)^m \)$: its law has finite second moments and, for this fixed $j$, its Jacobian has the bounds (2.9) applied to the transformed target. Gaussian Poincaré, applied componentwise to the centered difference, gives
  $ lr(bar.v.double hat(F)_j - hat(F)_k bar.v.double)_(L^2 \( gamma_m \))^2 lt.eq lr(bar.v.double J_j - J_k bar.v.double)_(L^2 \( gamma_m \))^2 . quad "(6.10)" $ <eq:map-cauchy>
  Consequently $hat(F)_j$ converges strongly in Gaussian $H^1$ to a centered map $hat(F)$ with weak Jacobian $D hat(F) = J$. Indeed, (6.10) and (6.9) give convergence of both maps and first derivatives; passage to weak derivatives is also valid on every bounded set, where the Gaussian density has a positive lower bound. In particular, $hat(F) in W_(upright("loc"))^(1 \, 2) \( bb(R)^m \; bb(R)^m \)$. Lemma 17 applies to (6.8) and shows that $hat(F)_(\#) gamma_m$ is an affine exponential product with covariance $I$.
  It remains to return from the normalized laws to $f$. By Cauchy–Schwarz, the strong $L^2 \( gamma_m \)$ convergence of the centered maps gives
  $ D_j := "Cov" \( \( hat(F)_j \)_(\#) gamma_m \) = P_j C_j P_j^(sans(T)) arrow.r I . quad "(6.11)" $ <eq:normalized-covariance-limit>
  We can now bound the normalizing matrices uniformly, without any uniform Hessian bounds on the approximating potentials. Choose positive constants $c \, C_0 \, d \, D$ such that, for all sufficiently large $j$,
  $ c I lt.eq C_j lt.eq C_0 I \, #h(2em) d I lt.eq D_j lt.eq D I . $
  Congruence by $P_j$ then yields
  $ d / C_0 I lt.eq P_j P_j^(sans(T)) lt.eq D / c I . quad "(6.12)" $ <eq:normalization-compactness>
  Hence $P_j$ and $P_j^(- 1)$ are bounded. Pass to a further subsequence with $P_j arrow.r P$; the lower bound in (6.12) makes $P$ invertible.
  The law of $hat(F)_j$ is the image of $f_j \( x \) thin thin upright(d) x$ under $x mapsto P_j \( x - a_j \)$. For a bounded continuous function $psi$,
  $ & lr(|integral psi \( P_j \( x - a_j \) \) f_j \( x \) thin thin upright(d) x - integral psi \( P \( x - a \) \) f \( x \) thin thin upright(d) x|)\
 & quad lt.eq lr(bar.v.double psi bar.v.double)_oo lr(bar.v.double f_j - f bar.v.double)_(L^1) + integral lr(|psi \( P_j \( x - a_j \) \) - psi \( P \( x - a \) \)|) f \( x \) thin thin upright(d) x arrow.r 0 . $
  The first term tends to zero by (6.6); the second does so by dominated convergence. Strong convergence of $hat(F)_j$ also identifies the weak limit of these laws as $hat(F)_(\#) gamma_m$. It follows that the image of $f \( x \) thin thin upright(d) x$ under $x mapsto P \( x - a \)$ is the affine exponential product already determined above. Since $P$ is invertible, $f$ itself has the form asserted in Theorem 2, up to equality almost everywhere.
  Conversely, the density of a product of $m$ independent mean-one exponentials is log-concave, has entropy $m$, and has covariance $I$. Every invertible affine image remains log-concave and has the same entropy gap by affine invariance. Thus every density in the stated class satisfies $delta = 0$. ◻
]

== 7 The simplex inequality and its equality cases <sec:geometry>

We transfer Theorem 2 to convex bodies using the exponential density on a cone. This construction appears in #cite(label("FradeliziMeyer2008")) Proposition 2(b); its entropy reduction is #cite(label("FradeliziMarinSola2026")) Lemma 5.2 and Proposition 5.2. The moment formulas also appear in #cite(label("Klartag2018")) Lemma 2.5. The calculation identifies equality in the body inequality with entropy equality in one higher dimension. The support of the resulting exponential product then determines the body.

#proof[
  Let $K subset bb(R)^n$ be a convex body. Translation preserves both $L_K$ and the property of being a simplex, so assume that $K$ has centroid zero. Write $Sigma_K = "Cov" \( X \)$ for $X$ uniform on $K$, and define
  $ cal(C)_K = { \( t x \, t \) : x in K \, med t gt.eq 0 } subset bb(R)^(n + 1) . quad "(7.1)" $ <eq:body-cone>
  Convexity of $K$ makes $cal(C)_K$ convex. It is closed because $K$ is compact: a convergent sequence $\( t_j x_j \, t_j \)$ with $t_j arrow.r 0$ has $t_j x_j arrow.r 0$, and when the limiting height is positive one can divide by that height. The cone has nonempty interior, and its only point at height zero is the origin.
  Define the log-concave density
  $ f_K \( y \, t \) = frac(e^(- t), n ! thin \| K \|) thin upright(bold(1))_(cal(C)_K) \( y \, t \) . quad "(7.2)" $ <eq:body-cone-density>
  The change of variables $y = t x$, with Jacobian $t^n$ for $t > 0$, gives
  $ integral_(cal(C)_K) e^(- t) thin thin upright(d) y thin thin upright(d) t = \| K \| integral_0^oo t^n e^(- t) thin thin upright(d) t = n ! thin \| K \| \, $
  so $f_K$ is a probability density. The same change of variables shows that it is the density of $\( T X \, T \)$, where $T$ is independent of $X$ and has density $t^n e^(- t) \/ n !$ on $\( 0 \, oo \)$. Integration by parts therefore gives
  $ bb(E) T = n + 1 \, #h(2em) bb(E) T^2 = \( n + 1 \) \( n + 2 \) \, #h(2em) "Var" \( T \) = n + 1 . $
  Since $bb(E) X = 0$, independence makes the cross-covariance of $T X$ and $T$ vanish. Hence
  $ h \( f_K \) & = n + 1 + log \( n ! thin \| K \| \) \,\
"Cov" \( f_K \) & = mat(delim: "(", \( n + 1 \) \( n + 2 \) Sigma_K, 0; 0, n + 1) \,\
det "Cov" \( f_K \) & = \( n + 1 \)^(n + 1) \( n + 2 \)^n det Sigma_K . quad "(7.3)" $ <eq:body-cone-entropy>
  Applying the entropy inequality of Theorem 2 in dimension $n + 1$ yields
  $ \( n ! \)^2 \| K \|^2 gt.eq \( n + 1 \)^(n + 1) \( n + 2 \)^n det Sigma_K . quad "(7.4)" $ <eq:body-cone-bound>
  This is precisely
  $ L_K lt.eq frac(\( n ! \)^(1 \/ n), \( n + 1 \)^(\( n + 1 \) \/ \( 2 n \)) sqrt(n + 2)) . $
  Every step from the entropy inequality to (7.4) is reversible. Thus equality in this bound holds if and only if $f_K$ has equality in Theorem 2.
  Suppose equality holds. By that theorem, the law with density $f_K$ is an invertible affine image of the product of $n + 1$ mean-one exponential laws. The closed support of $f_K$ is exactly $cal(C)_K$: it has positive density on the interior of the cone, and this interior is dense in the cone. Taking closed supports gives
  $ cal(C)_K = b + M \[ 0 \, oo \)^(n + 1) quad "(7.5)" $ <eq:body-cone-affine-orthant>
  for an invertible matrix $M$ and a vector $b$.
  The origin is the unique extreme point of $cal(C)_K$. Indeed, every nonzero $z in cal(C)_K$ is the midpoint of $0$ and $2 z$, whereas $0 = \( u + v \) \/ 2$ with $u \, v in cal(C)_K$ forces the nonnegative heights of $u$ and $v$ to vanish, and hence $u = v = 0$. The orthant also has the origin as its unique extreme point. Invertible affine maps preserve extreme points, so (7.5) forces $b = 0$.
  Choose positive multiples $w_0 \, dots.h \, w_n$ of the respective columns of $M$, and let $a_i$ be the last coordinate of $w_i$. Each $w_i$ is a nonzero point of $cal(C)_K$, so $a_i > 0$. Put $p_i = w_i \/ a_i$. The section at height one is
  $ K times { 1 } = {sum_(i = 0)^n c_i w_i : c_i gt.eq 0 \, med sum_(i = 0)^n c_i a_i = 1} = "conv" { p_0 \, dots.h \, p_n } . quad "(7.6)" $ <eq:body-cone-section>
  The vectors $p_i$ are linearly independent, since the vectors $w_i$ are. They are consequently affinely independent in the height-one hyperplane. Thus $K$ is a simplex. Figure 1 illustrates the normalization of the generating rays in this step.
  Conversely, let $K = "conv" { v_0 \, dots.h \, v_n }$ be a simplex, and let $M$ have columns $\( v_i \, 1 \)$. These columns are linearly independent and
  $ M \[ 0 \, oo \)^(n + 1) = cal(C)_K \, #h(2em) \| det M \| = n ! thin \| K \| . $
  For the determinant identity, subtract the first column from the others and expand along the last row; the remaining determinant is $n !$ times the volume of $K$, up to sign. If $E_0 \, dots.h \, E_n$ are independent mean-one exponential variables, the density of $M \( E_0 \, dots.h \, E_n \)^(sans(T))$ at $\( y \, t \) in cal(C)_K$ is
  $ frac(1, \| det M \|) exp (- sum_(i = 0)^n \( M^(- 1) \( y \, t \) \)_i) = frac(e^(- t), n ! thin \| K \|) \, $
  because the last row of $M$ consists of ones. This is exactly $f_K$, up to immaterial boundary values. Theorem 2 therefore gives equality in (7.4). ◻
]

For $n = 1$, every convex body is an interval, hence a simplex, and the constant is $1 \/ sqrt(12)$. Indeed, an interval of length $ell$ has variance $ell^2 \/ 12$, in agreement with the formula above.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-2.312, 1.438), (1.188, 1.438), (2.481, 2.444), (-1.019, 2.444), close: true, fill: rgb("#f5f5f5"))
  line((-2.312, 1.438), (1.188, 1.438), (2.481, 2.444), (-1.019, 2.444), close: true, stroke: (paint: rgb("#b9b9b9")))
  content((2.481, 2.444), [$t=1$], anchor: "west")
  line((0, 0), (0.5625, 2.312), stroke: (paint: rgb("#a6a6a6")))
  line((-1.616, 1.591), (0.8844, 1.591), (0.5625, 2.312), close: true, fill: rgb("#e0e0ff"))
  line((-1.616, 1.591), (0.8844, 1.591), (0.5625, 2.312), close: true, stroke: (paint: rgb("#0000a6")))
  line((0, 0), (-1.616, 1.591), (0, 0), (0.8844, 1.591))
  line((-1.616, 1.591), (-2.666, 2.625), stroke: (dash: "dashed"), mark: (end: ">"))
  line((0.8844, 1.591), (1.327, 2.386), stroke: (dash: "dashed"), mark: (end: ">"))
  line((0.5625, 2.312), (0.8438, 3.469), stroke: (dash: "dashed"), mark: (end: ">"))
  circle((-2.262, 2.227), radius: 0.04586, fill: black)
  content((-2.262, 2.227), [$t=a_0>1$], anchor: "east")
  circle((0, 0), radius: 0.04586, fill: black)
  content((0, 0), [$0$], anchor: "north")
  circle((-1.616, 1.591), radius: 0.04586, fill: black)
  content((-1.616, 1.591), [$p_0$], anchor: "east")
  circle((0.8844, 1.591), radius: 0.04586, fill: black)
  content((0.8844, 1.591), [$p_1$], anchor: "west")
  circle((0.5625, 2.312), radius: 0.04586, fill: black)
  content((0.5625, 2.312), [$p_2$], anchor: "south-east")
  content((0, 1.875), [$K times \{1\}$])
  content((2.312, 0.7812), [$p_i=w_i/a_i$#linebreak()$a_i= "height" "of" w_i>0$], anchor: "west")
})],
  caption: [Figure 1: The height-one section of a cone generated by three independent rays. Dividing each generator $w_i$ by its positive height $a_i$ produces the vertices $p_i$ of the section; one generator above the section is shown explicitly. Formula (7.6) gives the same correspondence in every dimension. ],
) <fig:cone-section>

== 8 Verification of the scalar estimates <cert:verification>

This appendix proves the Gaussian estimates used in the transport and scalar arguments. All terminating decimals in this appendix denote exact rational numbers. The finite certificates below concern entire intervals: their validity follows from coefficient bounds and polynomial positivity, with no sampling assumption. In the negative tail, $k$ and its first three derivatives are small and can be approximated by Gaussian excess moments. In the positive tail, $k tilde.op a \/ 2$, so we subtract this leading term and control derivatives of the remaining logarithmic correction. On the compact interval, we propagate the differential equations in their stable directions—backward from $q \( 10 \)$ and forward from $k \( - 6 \)$—and then certify polynomial positivity by exact arithmetic.

#proof[
  We use the definitions of $q \, k \, d \, b \, l$ from the transport section and of $p \, h_0 \, sans(D) \, sans(L) \, sans(E) \, K_0 \, J_0 \, A_(*) \, eta_(*) \, nu_(*)$ from the scalar section. The differential identities needed below are
  $ q' = q d \, #h(2em) k' = b = 1 - k d \, #h(2em) l = k - q + a b \, #h(2em) l' = 2 b - q d + a l . quad "(8.1)" $ <cert:identities>
  In particular,
  $ p & = b + k l - l^2 \/ alpha \,\
sans(E) & = p + b \( .75 - b \) - l^2 \/ alpha \,\
h_0 & = k \( b - .5 \) - 2 \( b - .28 \) l \/ alpha \,\
frac(d log M, d log q) & = frac(2 \( 1 - q d \), d^2) - frac(2 b l, d \( 1 - b^2 \)) \, #h(2em) M = d^(- 2) \( 1 - b^2 \) . quad "(8.2)" $ <cert:derived>
  We verify the estimates separately on $a lt.eq - 6$, $a gt.eq 10$, and $\[ - 6 \, 10 \]$. The central calculation is also specified in #raw("verification/verify_scalar.py"); it uses rational arithmetic only.
  === The negative tail <the-negative-tail>
  Put $r = - a gt.eq 6$, $u = r^(- 2)$, and
  $ I_j \( r \) = integral_0^oo v^j e^(- r v - v^2 \/ 2) thin d v #h(2em) \( j gt.eq 0 \) . $
  Writing $phi$ for the standard Gaussian density, the lower Gaussian tail is $P = Phi \( - r \) = phi \( r \) I_0 \( r \)$. Thus
  $ q = frac(phi \( r \), 1 - P) \, #h(2em) k = frac(\( 1 - P \) \( - log \( 1 - P \) \), phi \( r \)) . $
  Integration by parts gives
  $ I_1 = 1 - r I_0 \, #h(2em) I_2 = I_0 - r I_1 \, #h(2em) I_3 = 2 I_1 - r I_2 . $
  The inequality $0 lt.eq 1 - \( 1 - P \) \( - log \( 1 - P \) \) \/ P lt.eq 2 P$ gives $\| k - I_0 \| lt.eq 2 P \/ r$. Since $P lt.eq phi \( r \) \/ r$ and $phi \( 6 \) < 7 dot.op 10^(- 9)$, we have $q lt.eq 1.01 phi \( r \)$. Applying (8.1) successively therefore gives
  $ \| b - I_1 \| lt.eq 4 phi \( r \) \/ r \, quad \| l - I_2 \| lt.eq 6 phi \( r \) \, quad \| l' - I_3 \| lt.eq 9 r phi \( r \) . $
  Each Gaussian error decreases faster than its required inverse power for $r gt.eq 6$: indeed $r^N phi \( r \)$ is decreasing there for $N lt.eq 7$. Checking at $r = 6$ yields, with $g_0 = k \, g_1 = b \, g_2 = l \, g_3 = l'$,
  $ \| g_j - I_j \| lt.eq .01 u frac(j !, r^(j + 1)) #h(2em) \( 0 lt.eq j lt.eq 3 \) . quad "(8.3)" $ <cert:left-errors>
  The elementary bounds $1 - v^2 \/ 2 lt.eq e^(- v^2 \/ 2) lt.eq 1$ also give
  $ 1 - frac(\( j + 1 \) \( j + 2 \), 2) u lt.eq frac(I_j, j ! \/ r^(j + 1)) lt.eq 1 . quad "(8.4)" $ <cert:integral-errors>
  For $zeta = 1 + .01 u$, consequences we shall use are
  $ 0 < k lt.eq zeta \/ r \, quad u \( 1 - 3.01 u \) lt.eq b lt.eq u zeta < .028 \,\
2 r^(- 3) \( 1 - 6.01 u \) lt.eq l lt.eq 2 zeta r^(- 3) \, quad 0 < l' lt.eq 6 zeta r^(- 4) . $
  In particular $0 < b < 1 \/ 2$ and $l > 0$. Moreover,
  $ p gt.eq u \( 1 - 3.01 u \) - 4 zeta^2 u^3 \/ alpha gt.eq u \( 1 - 4.54 u \) gt.eq frac(1, 7 + r^2) . $
  The last two inequalities follow by inserting $u lt.eq 1 \/ 36$; after dividing by positive factors they reduce to $3.01 + 4 zeta^2 u \/ alpha < 4.54$ and $\( 1 - 4.54 u \) \( 1 + 7 u \) gt.eq 1$. The two summands of $h_0$ in (8.2) have opposite signs and magnitudes at most $.501 \/ r$ and $.43 \/ r$. Hence
  $ h_0^2 lt.eq .501^2 u < .67^2 u \( 1 - 4.54 u \) lt.eq .67^2 p . $
  This establishes the required bounds on $p \, h_0$ in this tail.
  For clarity, the remaining substitutions can be made with the following ratios, avoiding cancellation in $p$:
  $ frac(k l, b) lt.eq frac(2 u zeta^2, 1 - 3.01 u) \, #h(2em) frac(l^2, alpha b) lt.eq frac(4 u^2 zeta^2, alpha \( 1 - 3.01 u \)) \, #h(2em) .93 < b / p < 1.05 . quad "(8.5)" $ <cert:left-ratios>
  They imply the $O$ row of the coefficient table in Lemma 14. For example, $sans(D) lt.eq D_(*) \( 7 + r^2 \) < .295 \( 7 + r^2 \)$, $sans(L) lt.eq 2 zeta \/ \( alpha r^3 \) < .60$,
  $ .37 < K_0 = D_(*) (1 + \( .75 - b \) b / p - frac(l^2, alpha b) b / p) < .56 \, #h(2em) J_0 = D_(*) c b / p < .72 . $
  The bounds for $z = l' \/ l$, $h_(*) = 1 + 3 b + k z$, and $chi = l \/ d$ follow from
  $ 0 < z lt.eq frac(3 zeta, r \( 1 - 6.01 u \)) < .61 \, #h(2em) 1 < h_(*) < 1 + 3 \( .028 \) + zeta \( .61 \) \/ 6 < 1.77 \, #h(2em) chi lt.eq 2 zeta u^2 < .070 \, $
  where $d = r + q gt.eq r$. Since $d' < 0$, both $d^(- 1) \( 1 + b \)$ and $d^(- 1) \( 1 - b \) = k$ are increasing. Their product is $M$, proving the required logarithmic slope bound $m_0 = 0$.
  It remains to check the matrix inequality in this tail. Write $N$ for the matrix subtracted from $Q$ in that inequality, so that
  $ N = mat(delim: "(", A_(*) b^2 - eta_(*) b + nu_(*) \/ 4 + l^2 \/ alpha, nu_(*) \/ 2 - eta_(*) b; nu_(*) \/ 2 - eta_(*) b, nu_(*)) + sans(D) binom(sans(E), c b) mat(delim: "(", sans(E), c b) . quad "(8.6)" $ <cert:N>
  Equations (8.5) give $sans(E) < .05072$. Using $b < .028$, $K_0 < .56$, and $J_0 < .72$ in (8.6) gives
  $ N_11 < .224 \, #h(2em) N_22 < .802 \, #h(2em) .34 < N_12 < .386 . $
  Since $Q_11 = .43$, $Q_12 = .13$, and $Q_22 = 2.72$, the leading minor of $Q - N - "diag" \( .13 \, .75 \)$ is positive, and its determinant is at least
  $ \( .43 - .224 - .13 \) \( 2.72 - .802 - .75 \) - \( .13 - .386 \)^2 = .023232 > 0 . $
  This proves the local matrix bound on $a lt.eq - 6$.
  === The positive tail <the-positive-tail>
  For $r = a gt.eq 10$ put $u = r^(- 2)$ and $theta = log \( r sqrt(2 pi) \)$. Gaussian tail integration gives
  $ F \( u \) = integral_0^oo e^(- v - u v^2 \/ 2) thin d v \, #h(2em) Phi \( - r \) = frac(phi \( r \), r) F \( u \) \, #h(2em) k = r / 2 + frac(C \( u \, theta \), r) \, $
  where
  $ C = F theta + G \, #h(2em) G = frac(F - 1, 2 u) - F log F . quad "(8.7)" $ <cert:C>
  Let $cal(U) = u partial_u$, with $theta$ held fixed, and let $cal(D) = r thin d \/ d r = partial_theta - 2 cal(U)$. Define
  $ B = \( 1 - cal(D) \) C \, #h(2em) J = \( 2 - cal(D) \) B \, #h(2em) R = \( 3 - cal(D) \) J . $
  Here $B \, J \, R$ are auxiliary scalar functions used only in this appendix. Differentiating $k$ gives
  $ b = .5 - u B \, #h(2em) l = J \/ r^3 \, #h(2em) l' = - R \/ r^4 . quad "(8.8)" $ <cert:right-derivatives>
  We first establish uniform bounds for these three derivatives:
  $ \| B - \( theta - 1.5 \) \| < .04 \, #h(2em) \| J - \( 2 theta - 4 \) \| < .13 \, #h(2em) \| R - \( 6 theta - 14 \) \| < .75 . quad "(8.9)" $ <cert:right-errors>
  Differentiation under the integral gives, for $0 lt.eq u lt.eq .01$,
  $ 1 - u lt.eq F lt.eq 1 \, #h(2em) \| F' \| lt.eq 1 \, #h(2em) \| F'' \| lt.eq 6 \, #h(2em) \| F''' \| lt.eq 90 \, #h(2em) \| F^(\( 4 \)) \| lt.eq 2520 . $
  Indeed the $j$th derivative is bounded in absolute value by $\( 2 j \) ! \/ 2^j$. To control the apparent quotient in $G$, use $\( F \( u \) - 1 \) \/ u = integral_0^1 F' \( t u \) thin d t$. Since $F gt.eq .99$ and $\| 1 + log F \| lt.eq 1$, differentiating (8.7) yields
  $ \| G'' \| lt.eq 15 + 6 + 1 \/ .99 < 23 \, #h(2em) \| G''' \| lt.eq 315 + 90 + 18 \/ .99 + 1 \/ .99^2 < 435 . $
  The values $F \( 0 \) = 1$, $F' \( 0 \) = - 1$, $G \( 0 \) = - 1 \/ 2$, and $G' \( 0 \) = 5 \/ 2$ therefore give
  $ C = theta - .5 + \( 2.5 - theta \) u + R_0 \, #h(2em) g = 11.5 + 3 theta \, #h(2em) c_0 = 435 + 90 theta \, $
  with
  $ \| cal(U)^j R_0 \| lt.eq 2^j g u^2 + c_0 u^3 upright(bold(1))_({ j = 3 }) #h(2em) \( 0 lt.eq j lt.eq 3 \) . quad "(8.10)" $ <cert:Euler-remainder>
  The same bounds apply to $partial_theta R_0$ with $g = 3 \, c_0 = 90$; all higher $theta$ derivatives vanish. For example, $cal(U)^2 R_0 = u R'_0 + u^2 R''_0$ and $cal(U)^3 R_0 = u R'_0 + 3 u^2 R''_0 + u^3 R'''_0$, so these statements follow directly from Taylor’s theorem and the derivative bounds just given.
  Expanding the three operators in (8.8), the linear-in-$u$ errors are respectively
  $ \( 8.5 - 3 theta \) u \, #h(2em) \( 37 - 12 theta \) u \, #h(2em) \( 197 - 60 theta \) u . $
  The errors contributed by $R_0$ are bounded respectively by
  $ \( 5 g + 3 \) u^2 \, #h(2em) \( 30 g + 33 \) u^2 \, #h(2em) \( 210 g + 321 + 8 c_0 u \) u^2 . quad "(8.11)" $ <cert:operator-errors>
  For example the second operator is $2 - 3 cal(D) + cal(D)^2$ and the third is $6 - 11 cal(D) + 6 cal(D)^2 - cal(D)^3$; substituting $cal(D) = partial_theta - 2 cal(U)$ into (8.10) gives exactly the displayed constants.
  Here is a rational way to check uniformity on the unbounded interval. Write $x = log \( r \/ 10 \) gt.eq 0$, so $u = .01 e^(- 2 x)$ and $theta = theta_0 + x$, where $3.221 < theta_0 < 3.222$. The terms in (8.11) decrease with $x$. For the linear-in-$u$ terms, maximize a linear function times $e^(- 2 x)$ at its endpoint or stationary point, using $e^(- t) lt.eq 1 \/ \( 1 + t \)$ for $t gt.eq 0$. More explicitly, set
  $ g_(+) & = 11.5 + 3 \( 3.222 \) \, & c_(+) & = 435 + 90 \( 3.222 \) \,\
a_B & = 3 \( 3.222 \) - 8.5 \, & a_J & = 12 \( 3.222 \) - 37 \,\
a_R & = 197 - 60 \( 3.222 \) . $
  Upper bounds for the total errors are
  $ & upright("rational upper bound") & upright("a larger rational")\
B & frac(.015, 2 - 2 a_B \/ 3) + frac(5 g_(+) + 3, 10^4) & .024\
J & frac(.06, 2 - a_J \/ 6) + frac(30 g_(+) + 33, 10^4) & .102\
R & max {frac(197 - 60 \( 3.221 \), 100) \, frac(.3, 2 + a_R \/ 30)} + frac(210 g_(+) + 321, 10^4) + frac(8 c_(+), 10^6) & .624 $
  These prove (8.9). The bound on $theta_0$ itself can be checked with the logarithm series
  $ log y = 2 sum_(j = 0)^N frac(z^(2 j + 1), 2 j + 1) + cal(R)_N \, #h(2em) z = frac(y - 1, y + 1) \, #h(2em) \| cal(R)_N \| lt.eq frac(2 \| z \|^(2 N + 3), \( 2 N + 3 \) \( 1 - z^2 \)) \, $
  applied to $theta_0 = 1 / 2 log \( 200 pi \)$. For a completely specified enclosure, use Machin’s identity $pi = 16 arctan \( 1 \/ 5 \) - 4 arctan \( 1 \/ 239 \)$ and the alternating arctangent sums through degrees $47$ and $49$. In the logarithm series first divide the argument by a power of two to place it in $\[ 1 \, 2 \)$, and take $N = 35$ for that argument and for $log 2$. These rational operations give $3.221523626198 < theta_0 < 3.221523626199$.
  Combining (8.9) with the preceding Taylor bounds on $C$ gives the following estimates needed in the lemmas:
  $ 1.7 < R \/ J lt.eq 3 \, quad .482 < b < .5 \, quad 0 < l < .0026 \, quad .5 < k \/ r < .528 \, quad .493 < p < .5 . quad "(8.12)" $ <cert:right-consequences>
  To see the ratio bounds directly, $J > 2 theta - 4.13 > 0$, $R - 1.7 J > 2.6 theta - 8.171 > 0$, and $3 J - R > .86$. For the bounds involving $k$ and $p$, we have $C gt.eq .99 theta - .5 > 0$ by (8.7), whereas its Taylor expansion gives
  $ C - \( theta - .5 \) lt.eq u { 2.5 - theta + .01 \( 11.5 + 3 theta \) } < 0 . $
  Thus $0 < C < theta - .5 < theta - .475$, and $0 < u C J < .075$. In particular,
  $ p = .5 + u { - B + \( .5 + u C \) J } - l^2 \/ alpha \, #h(2em) - .605 < - B + .5 J < - .395 \, $
  which proves $.493 < p < .5$. The inverse-power majorants used for these consequences take their maxima at $r = 10$, as follows by differentiating the linear or quadratic polynomials in $log \( r \/ 10 \)$ times the indicated inverse power of $r$. For example, $u \( theta - .475 \) \( 2 theta - 3.87 \)$ decreases because $1 \/ \( theta - .475 \) + 2 \/ \( 2 theta - 3.87 \) < 2$ at $theta = 3.221$ and hence for every larger $theta$. Similarly $B \/ r < .18$, and consequently
  $ \| h_0 \| lt.eq .528 \( .18 \) + 2 \( .22 \) \( .0026 \) \/ alpha < .14 < .67 sqrt(p) . $
  These bounds prove the claimed estimates on $p \, h_0$ and the $T_1$ row of the coefficient table; for example
  $ .367 < K_0 < .4 \, #h(2em) sans(D) < D_(*) \/ .493 < .640 \, #h(2em) J_0 < D_(*) c \( .5 \) \/ .493 < .48 \, #h(2em) sans(L) < .0026 \/ alpha < .20 . $
  They also give $- .3 < z < 0$ and
  $ .8 < 1 + 3 \( .482 \) - 3 \( .528 \) lt.eq h_(*) lt.eq 1 + 3 \( .5 \) - 1.7 \( .5 \) < 1.77 . $
  To check the remaining estimates involving $d$, let $V$ have density $F \( u \)^(- 1) e^(- v - u v^2 \/ 2)$ on $v > 0$. The Gaussian excess above $r$ is $V \/ r$, so
  $ r d = bb(E) V \, #h(2em) 1 - q d = r^(- 2) "Var" V . $
  Taylor’s lower bound in the numerator and $F lt.eq 1$ give $bb(E) V gt.eq 1 - 3 u$ and $bb(E) V^2 gt.eq 2 \( 1 - 6 u \)$. Monotone weighting of the exponential density gives $bb(E) V lt.eq 1$. Hence $d gt.eq .97 \/ r$, $"Var" V gt.eq .88$, and
  $ chi lt.eq frac(J, .97 r^2) < .027 < .097 . $
  Equation (8.2) now implies
  $ frac(d log M, d log q) gt.eq 2 \( .88 \) - frac(.027, 1 - .5^2) > .68 . $
  This verifies the logarithmic slope required by Lemma 4.
  For the matrix inequality, use $sans(E) lt.eq p + .482 \( .75 - .482 \)$ in (8.6). The first part of $N_11$ increases with $b$ on $\[ .482 \, .5 \]$, and $\( p + v \)^2 \/ p$ increases with $p$ when $0 < v < p$. Therefore
  $ N_11 & lt.eq A_(*) \/ 4 - eta_(*) \/ 2 + nu_(*) \/ 4 + .0026^2 \/ alpha + D_(*) frac(\( .5 + .482 \( .75 - .482 \) \)^2, .5) < .403 \,\
N_22 & lt.eq nu_(*) + D_(*) frac(\( c \/ 2 \)^2, .493) < 1.12 \, #h(2em) .080 < N_12 < .13 . $
  For the off-diagonal estimate use $N_12 = nu_(*) \/ 2 + b \( c K_0 - eta_(*) \)$ and $.367 < K_0 < .4$. Thus $Q - N - "diag" \( .022 \, .75 \)$ has positive leading minor and determinant at least
  $ \( .43 - .403 - .022 \) \( 2.72 - 1.12 - .75 \) - .05^2 = .00175 > 0 . $
  This finishes the positive tail.
  === Polynomial enclosures on the central interval <polynomial-enclosures-on-the-central-interval>
  We next provide all data and rules for the finite certificate on $\[ - 6 \, 10 \]$. On each row of Table 1, write $a = w + r x$, $- 1 lt.eq x lt.eq 1$. The corresponding closed intervals are consecutive and cover $\[ - 6 \, 10 \]$. The tabulated constants are rational seeds; we do not assume that they are Gaussian function values. The differential residuals and the two analytic anchors $q \( 10 \)$ and $k \( - 6 \)$ will certify the entire piecewise polynomial family, including all its initial coefficients. Construct polynomials $P \, hat(k)$ of degree $14$ from their tabulated constant terms by the recurrences
  $ D = P - a \, #h(2em) P_(i + 1) = frac(r, i + 1) \( P D \)_i \, #h(2em) hat(k)_(i + 1) = frac(r, i + 1) \( 1 - hat(k) D \)_i quad \( 0 lt.eq i < 14 \) . quad "(8.13)" $ <cert:recurrence>
  The subscript denotes a coefficient, so the constant $1$ contributes only when $i = 0$. At each step only coefficients already computed occur on the right. The letters $P \, hat(k) \, D$ denote polynomial approximations to $q \, k \, d$, respectively, throughout this central calculation.
  #figure(
    table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$w$
], table.cell(rowspan: 1, colspan: 1)[$r$
], table.cell(rowspan: 1, colspan: 1)[$P_0$
], table.cell(rowspan: 1, colspan: 1)[$hat(k)_0$
]),
  table.cell(rowspan: 1, colspan: 1)[$- 5.25$
], table.cell(rowspan: 1, colspan: 1)[$.75$
], table.cell(rowspan: 1, colspan: 1)[$.0000004128471303$
], table.cell(rowspan: 1, colspan: 1)[$.1842076703035094$
],
  table.cell(rowspan: 1, colspan: 1)[$- 3.75$
], table.cell(rowspan: 1, colspan: 1)[$.75$
], table.cell(rowspan: 1, colspan: 1)[$.0003526268606772$
], table.cell(rowspan: 1, colspan: 1)[$.2507500253088710$
],
  table.cell(rowspan: 1, colspan: 1)[$- 2.5$
], table.cell(rowspan: 1, colspan: 1)[$.5$
], table.cell(rowspan: 1, colspan: 1)[$.0176378254869167$
], table.cell(rowspan: 1, colspan: 1)[$.3531628936050266$
],
  table.cell(rowspan: 1, colspan: 1)[$- 1.5$
], table.cell(rowspan: 1, colspan: 1)[$.5$
], table.cell(rowspan: 1, colspan: 1)[$.1387897504588508$
], table.cell(rowspan: 1, colspan: 1)[$.4981884857033017$
],
  table.cell(rowspan: 1, colspan: 1)[$- .5$
], table.cell(rowspan: 1, colspan: 1)[$.5$
], table.cell(rowspan: 1, colspan: 1)[$.5091604338370335$
], table.cell(rowspan: 1, colspan: 1)[$.7246172144765372$
],
  table.cell(rowspan: 1, colspan: 1)[$.25$
], table.cell(rowspan: 1, colspan: 1)[$.25$
], table.cell(rowspan: 1, colspan: 1)[$.9635539794164037$
], table.cell(rowspan: 1, colspan: 1)[$.9475979387933716$
],
  table.cell(rowspan: 1, colspan: 1)[$1.25$
], table.cell(rowspan: 1, colspan: 1)[$.75$
], table.cell(rowspan: 1, colspan: 1)[$1.7288166273310539$
], table.cell(rowspan: 1, colspan: 1)[$1.3000948982566192$
],
  table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$3.2830986549304364$
], table.cell(rowspan: 1, colspan: 1)[$2.0126493036044195$
],
  table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$5.1865039671258417$
], table.cell(rowspan: 1, colspan: 1)[$2.9046537878842420$
],
  table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$7.1375456132265036$
], table.cell(rowspan: 1, colspan: 1)[$3.8366560415481663$
],
  table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$9.1085231050028685$
], table.cell(rowspan: 1, colspan: 1)[$4.7898159350739631$
],
),
    caption: [Table 1: Rational input data for the central polynomial certificate. ],
  )
  For a polynomial $A$, let $\[ A \]$ denote the sum of the absolute values of its coefficients. Direct use of (8.13) gives
  $ r \[ \( P D \)_(deg gt.eq 14) \] < cases(delim: "{", 2 dot.op 10^(- 9) \, & w = - 3.75 \,, 7 dot.op 10^(- 11) \, & upright("otherwise") \,) #h(2em) r \[ \( hat(k) D \)_(deg gt.eq 14) \] < 2 dot.op 10^(- 10) . quad "(8.14)" $ <cert:residuals>
  For each adjacent pair, the values of both $P$ and $hat(k)$ at their common endpoint differ by less than $2 dot.op 10^(- 10)$. Also
  $ D > .09 \, #h(2em) \[ hat(k) \] < cases(delim: "{", 2 \, & w lt.eq .25 \,, 5.6 \, & w > .25 \,) quad "(8.15)" $ <cert:additional-poly>
  and the first-row value $hat(k) \( - 1 \)$ differs from $.16237766$ by less than $3 dot.op 10^(- 9)$, while the last-row value $P \( 1 \)$ differs from $10.098093234$ by less than $2 dot.op 10^(- 10)$. These are rational coefficient checks. For example the first residual is bounded by
  $ r sum_(i = 14)^28 lr(|sum_(j = 0)^14 P_j D_(i - j)|) \, $
  with missing coefficients taken as zero. The bound on $D$ follows from the quartic lower-bound rule (8.21) below, after charging discarded coefficients to the remainder.
  Here are analytic anchors for those coefficient checks. For any $r > 0$, Taylor’s formula under the integral gives alternating upper and lower bounds for $I_0 \( r \)$ by
  $ S_N \( r \) = sum_(i = 0)^N frac(\( - 1 \)^i \( 2 i - 1 \) ! !, r^(2 i + 1)) \, #h(2em) S_(2 j + 1) \( r \) lt.eq I_0 \( r \) lt.eq S_(2 j) \( r \) \, quad "(8.16)" $ <cert:Mills>
  where $\( - 1 \) ! ! = 1$. At $r = 10$, use $S_11 \, S_12$ and $q \( 10 \) = 1 \/ I_0 \( 10 \)$; at $r = 6$, use $S_13 \, S_14$ and $\| k \( - 6 \) - I_0 \( 6 \) \| lt.eq 2 phi \( 6 \) \/ 36$. Exact substitution gives
  $ \| q \( 10 \) - 10.098093234 \| < 4 dot.op 10^(- 10) \, #h(2em) \| k \( - 6 \) - .16237766 \| < 4 dot.op 10^(- 8) . $
  The rough bound $phi \( 6 \) < 7 dot.op 10^(- 9)$ used here follows, for example, from $sqrt(2 pi) > 12 \/ 5$ and $e^18 > sum_(i = 0)^59 18^i \/ i !$: division gives $\( 5 \/ 12 \) \/ sum_(i = 0)^59 18^i \/ i ! < 7 dot.op 10^(- 9)$.
  These anchors and residuals imply the following uniform, rather than just endpoint, errors:
  $ \| q - P \| lt.eq e_q = 10^(- 8) \, #h(2em) \| k - hat(k) \| lt.eq e_k = 8 dot.op 10^(- 7) . quad "(8.17)" $ <cert:global-errors>
  Indeed the equation for $q - P$ has multiplier $r \( q + P - a \) > 0$, so backward integration from $a = 10$ is stable. Its absolute error increases by at most twice each bound in (8.14) and by each joining error. The resulting bound is
  $ 6 dot.op 10^(- 10) + 2 \( 2 dot.op 10^(- 9) + 10 dot.op 7 dot.op 10^(- 11) \) + 10 dot.op 2 dot.op 10^(- 10) = 8 dot.op 10^(- 9) < e_q . $
  The equation for $k - hat(k)$ has multiplier $- r d < 0$, so forward integration from $a = - 6$ is stable. The additional forcing is bounded by $r \[ hat(k) \] e_q$. The portions with $\[ hat(k) \] < 2$ and $\[ hat(k) \] < 5.6$ have total lengths $6.5$ and $9.5$, respectively. Thus an upper bound for its accumulated error is
  $ 4.3 dot.op 10^(- 8) + 22 dot.op 10^(- 10) dot.op 2 + 20 dot.op 10^(- 10) + 10^(- 8) \( 6.5 dot.op 2 + 9.5 dot.op 5.6 \) = 7.114 dot.op 10^(- 7) < e_k . $
  Construct the following #emph[full] polynomials before truncating any of them:
  $ B = 1 - hat(k) D \, #h(2em) J = hat(k) - P + a B \, #h(2em) Y = 2 B - P D + a J . quad "(8.18)" $ <cert:aux-polys>
  They approximate $b \, l \, l'$. Their error bounds, obtained directly from (8.1) and (8.17), are
  $ E_b & = \[ hat(k) \] e_q + e_k \( e_q + \[ D \] \) \,\
E_l & = e_q + e_k + \[ a \] E_b \,\
E_(l') & = 2 E_b + \( \[ P \] + \[ D \] + e_q \) e_q + \[ a \] E_l . quad "(8.19)" $ <cert:aux-errors>
  The order in (8.18) matters for the strength of the certificate: form $B \, J \, Y$ with the full degree-$14$ inputs, and only then apply the quartic arithmetic described next.
  === The rational positivity certificate <the-rational-positivity-certificate>
  An enclosure $\( A \, e \)$ means that the function in question differs from $A \( x \)$ by at most $e$ on $\[ - 1 \, 1 \]$. Replace a polynomial by its terms of degree at most four and add the sum of the absolute values of all discarded coefficients to $e$. Addition and subtraction add error bounds. For a product use the coefficient convolution and the error
  $ \[ A \] e_B + \[ B \] e_A + e_A e_B \, quad "(8.20)" $ <cert:product-error>
  then truncate and charge the discarded coefficients as before. Scalar multiplication scales the error by the absolute value of the scalar. Initialize this arithmetic with
  $ \( q \, k \, d \, b \, l \, l' \) arrow.l.r \( P \, hat(k) \, D \, B \, J \, Y \) \, #h(2em) \( e_q \, e_k \, e_q \, E_b \, E_l \, E_(l') \) \, $
  using the full polynomials in (8.18). Truncate each of these six initial enclosures to degree four, charging discarded coefficients to its error, before evaluating the groups below. For a resulting quartic $A \( x \) = sum_(j = 0)^4 A_j x^j$, a rational lower bound is
  $ min_(sigma = plus.minus 1\
0 lt.eq i lt.eq 4) sum_(j = 0)^i binom(i, j) / binom(4, j) sigma^j A_j - e . quad "(8.21)" $ <cert:Bernstein>
  This is the Bernstein coefficient bound on each of $\[ 0 \, 1 \]$ and $\[ - 1 \, 0 \]$: on $x = sigma t$ the displayed coefficients are precisely the coefficients in the degree-four Bernstein basis, whose basis functions are nonnegative and sum to one.
  We list every polynomial to which this rule is applied. In a given row, use the corresponding bin in Lemma 14 to define the bounds
  $ b_min \, med b_max \, med sans(L)_max \, med sans(D)_max \, #h(2em) K_min \, med K_max \, med J_max \, med ell_1 . $
  The constant $m_0$ is from Lemma 4. The triples $\( z_min \, z_max \, chi_max \)$ are $\( - .08 \, .70 \, .070 \)$ for rows to the left of $- 1$, and $\( - .475 \, 0 \, .097 \)$ for rows to the right. Within the quartic arithmetic set
  $ p & = b + k l - l^2 \/ alpha \, & sans(E) & = p + b \( .75 - b \) - l^2 \/ alpha \,\
H & = l + 3 b l + k l' \, & f_1 & = c b \, $
  $ h & = .43 - ell_1 - A_(*) b^2 + eta_(*) b - nu_(*) \/ 4 - l^2 \/ alpha \,\
v & = 1.97 - nu_(*) \, #h(2em) o = .13 - nu_(*) \/ 2 + eta_(*) b . $
  The four groups are as follows:
  $ cal(G)_1 : quad & b - b_min \, med b_max - b \, med l \, med alpha sans(L)_max - l \,\
 & p \( 7 + a^2 \) - 1 quad upright("on rows with ") w < 0 \,\
 & p - .25 quad upright("on rows with ") 0 < w < 4 \, #h(2em) p - .46 quad upright("on rows with ") w > 4 \,\
 & .67^2 p - { k \( b - .5 \) - 2 \( b - .28 \) l \/ alpha }^2 \;\
cal(G)_2 : quad & l' - z_min l \, med z_max l - l' \, med H - .8 l \, med 1.77 l - H \, med chi_max d - l \,\
 & 2 \( 1 - q d \) \( 1 - b^2 \) - 2 b l d - m_0 d^2 \( 1 - b^2 \) \;\
cal(G)_3 : quad & p - D_(*) \/ sans(D)_max quad upright("(omitted for bin ") O upright(")") \,\
 & D_(*) sans(E) - K_min p \, med K_max p - D_(*) sans(E) \, med J_max p - D_(*) f_1 \;\
cal(G)_4 : quad & h p - D_(*) sans(E)^2 \,\
 & p \( h v - o^2 \) - D_(*) \( sans(E)^2 v - 2 sans(E) thin o thin f_1 + h f_1 f_1 \) . $
  Products are evaluated from left to right, with repeated multiplication for powers. In the last expression the product in the middle is $2 sans(E) thin o thin f_1$. The bounds below are the minimum over all members of a group, so positivity proves every inequality listed in it.
  #figure(
    table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$w$
], table.cell(rowspan: 1, colspan: 1)[$cal(G)_1$
], table.cell(rowspan: 1, colspan: 1)[$cal(G)_2$
], table.cell(rowspan: 1, colspan: 1)[$cal(G)_3$
], table.cell(rowspan: 1, colspan: 1)[$cal(G)_4$
]),
  table.cell(rowspan: 1, colspan: 1)[$- 5.25$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[$- 3.75$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
],
  table.cell(rowspan: 1, colspan: 1)[$- 2.5$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$5$
],
  table.cell(rowspan: 1, colspan: 1)[$- 1.5$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$8$
],
  table.cell(rowspan: 1, colspan: 1)[$- .5$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$14$
],
  table.cell(rowspan: 1, colspan: 1)[$.25$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$11$
],
  table.cell(rowspan: 1, colspan: 1)[$1.25$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$.8$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$20$
],
  table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$.8$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$7$
],
  table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$.8$
], table.cell(rowspan: 1, colspan: 1)[$10$
], table.cell(rowspan: 1, colspan: 1)[$15$
],
  table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$.6$
], table.cell(rowspan: 1, colspan: 1)[$11$
], table.cell(rowspan: 1, colspan: 1)[$11$
],
  table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$.35$
], table.cell(rowspan: 1, colspan: 1)[$12$
], table.cell(rowspan: 1, colspan: 1)[$9$
],
),
    caption: [Table 2: Lower bounds for the four polynomial groups, in units of $10^(- 3)$. ],
  )
  Table 2 is obtained by the rational operations (8.13), (8.18), (8.19), (8.20), and (8.21), with no additional function evaluations. The accompanying checker reproduces all $44$ bounds, all $22$ differential residual bounds, the $20$ joining bounds, the anchor checks, and the coefficient norm bounds used to obtain (8.17). The same endpoint enclosures give $q \( - 1 \) > .287$, $q \( - 2 \) < .056$, $q \( - 3 \) < .005$, and $q \( 4 \) > 4$, as used in the secant argument. The logarithm series above also certifies
  $ log frac(q \( - 1 \), q \( - 2 \)) > 1.62 \, quad log frac(q \( - 1 \), q \( - 3 \)) > 4 \, quad log frac(q \( 4 \), q \( - 2 \)) > 4 \, quad log frac(q \( 4 \), q \( - 3 \)) > 6.5 . $
  We explain why these finite checks finish the proof. Group $cal(G)_1$ gives $0 < b < 1 \/ 2$, $l > 0$, the bounds for $p \, h_0$, and the bounds for $b \, sans(L)$. Its strict positive margins give $p > 0$. Group $cal(G)_2$ gives the bounds for $z \, h_(*) \, chi$ after division by $l$ or $d$, and the logarithmic slope bound by division by $d^2 \( 1 - b^2 \)$. Group $cal(G)_3$ gives the remaining coefficient bounds after division by $p$; the $O$ bound for $sans(D)$ instead follows from $D_(*) < .295$ and the lower bound on $p$. Finally
  $ Q - N - "diag" \( ell_1 \, .75 \) = mat(delim: "(", h, o; o, v) - D_(*) / p binom(sans(E), f_1) mat(delim: "(", sans(E), f_1) . $
  Its leading minor and determinant, multiplied by $p$, are exactly the two expressions in $cal(G)_4$. Their positivity proves the matrix inequality. Continuity supplies every bin endpoint, including the stronger of the two adjacent logarithmic slope bounds. Together with the two tails, this proves both lemmas on the whole real line. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
