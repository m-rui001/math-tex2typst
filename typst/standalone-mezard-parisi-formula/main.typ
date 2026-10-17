#set page(paper: "us-letter", margin: (x: 59.3pt, y: 59.3pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[standalone-mezard-parisi-formula]]
#align(center)[]
#align(center)[]

#strong[The Mézard–Parisi formula for diluted spin glasses]

=== Original prompt (excerpts) <original-prompt-excerpts>

#raw(block: true, "\nPlease give a complete rigorous solution to the following problem. Even if the problem is \"open\", the intention is that you should resolve it and present a full solution.\n\nYour solution can be either a complete, rigorous resolution or a well-presented, rigorous refutation. Brute-force enumerations and computer-assisted proofs are strongly discouraged in the final writeup.\n\n# Problem\n\nFix an even integer $p\\ge2$, a real number $\\alpha>0$, a random function $\\theta:\\{-1,1\\}^p\\to\\mathbb R$, and a real random variable $h$. Assume\n$$\n\\mathbb E\\max_{s\\in\\{-1,1\\}^p}|\\theta(s)|+\\mathbb E|h|<\\infty.\n$$\nRequire the interaction hypotheses of Panchenko--Talagrand (1.2)--(1.4): for all $s=(s_1,\\ldots,s_p)$,\n$$\ne^{\\theta(s)}=a\\left(1+b\\prod_{\\ell=1}^p f_\\ell(s_\\ell)\\right),\\qquad\n\\left|b\\prod_{\\ell=1}^p f_\\ell(s_\\ell)\\right|<1\\quad\\text{almost surely},\n$$\nwhere the $f_\\ell:\\{-1,1\\}\\to\\mathbb R$ are independent copies of one random function, $b$ is independent of them, and $\\mathbb E[(-b)^n]\\ge0$ for every integer $n\\ge1$. The positive random variable $a$ may depend on the other factorization variables.\n\nFor each $N$, let $M_N\\sim\\operatorname{Poisson}(\\alpha N)$, let $(i_{\\ell,k})$ be independent uniform indices in $\\{1,\\ldots,N\\}$, let $(\\theta_k)$ be independent copies of $\\theta$, and let $(h_i)$ be independent copies of $h$. These families are mutually independent; indices are sampled with replacement. For $\\sigma\\in\\{-1,1\\}^N$, set\n$$\n-H_N(\\sigma)=\\sum_{k=1}^{M_N}\\theta_k(\\sigma_{i_{1,k}},\\ldots,\\sigma_{i_{p,k}})+\\sum_{i=1}^N h_i\\sigma_i,\\qquad\nF_N=\\frac1N\\mathbb E\\log\\sum_{\\sigma\\in\\{-1,1\\}^N}e^{-H_N(\\sigma)}.\n$$\nAll model parameters and disorder laws are fixed as $N\\to\\infty$; any inverse-temperature parameter is absorbed into $\\theta$ and $h$.\n\nDefine $q_x(s)=e^{xs}/(2\\cosh x)$ for $s\\in\\{-1,1\\}$ and $x\\in\\mathbb R$, and the cavity quantities\n$$\nC_\\theta(x_1,\\ldots,x_p)=\\sum_{s\\in\\{-1,1\\}^p}e^{\\theta(s)}\\prod_{\\ell=1}^p q_{x_\\ell}(s_\\ell),\n$$\n$$\nU_\\theta(x_1,\\ldots,x_{p-1};\\varepsilon)=\\log\\sum_{s\\in\\{-1,1\\}^{p-1}}e^{\\theta(s_1,\\ldots,s_{p-1},\\varepsilon)}\\prod_{\\ell=1}^{p-1}q_{x_\\ell}(s_\\ell).\n$$\nThese are $\\langle\\mathcal E\\rangle_x$ and $U$ from (1.5)--(1.7) of the cited paper.\n\nHere is a complete definition of its finite-level trial functional. Write $\\mathcal M_1=\\mathcal P(\\mathbb R)$ and $\\mathcal M_{j+1}=\\mathcal P(\\mathcal M_j)$, where $\\mathcal P$ denotes Borel probability measures and each space carries its usual weak topology. Fix an integer $r\\ge1$, $\\zeta\\in\\mathcal M_{r+1}$, and $0<m_1<\\cdots<m_r<1$. For each message label $\\omega$, independently generate a chain\n$$\n\\eta_0^\\omega\\sim\\zeta,\\qquad\n\\eta_{j+1}^\\omega\\mid\\eta_j^\\omega\\sim\\eta_j^\\omega\\quad(0\\le j\\le r-2),\\qquad\nx^\\omega\\mid\\eta_{r-1}^\\omega\\sim\\eta_{r-1}^\\omega.\n$$\nThus $\\eta_j^\\omega\\in\\mathcal M_{r-j}$. Generate all chains independently of the physical disorder. Use distinct labels for $x_1,\\ldots,x_p$ and for $x_\\ell^j$, $j\\ge1$, $1\\le\\ell\\le p-1$. Take mutually independent $k\\sim\\operatorname{Poisson}(\\alpha p)$, $\\theta,\\theta_1,\\theta_2,\\ldots$ with the prescribed interaction law, and $h$ with the prescribed field law. Put\n$$\nV_{\\rm s}=\\frac12\\sum_{\\varepsilon=\\pm1}\\exp\\left(h\\varepsilon+\\sum_{j=1}^k U_{\\theta_j}(x_1^j,\\ldots,x_{p-1}^j;\\varepsilon)\\right),\\qquad\nV_{\\rm e}=C_\\theta(x_1,\\ldots,x_p).\n$$\nFor $0\\le\\ell<r$, let $\\mathcal F_\\ell$ be generated by all physical disorder just listed and by $\\eta_j^\\omega$ for all labels $\\omega$ and $0\\le j\\le\\ell$. For either positive variable $V$ above, define backwards\n$$\nT_rV=V,\\qquad\nT_\\ell V=\\left(\\mathbb E\\left[(T_{\\ell+1}V)^{m_{\\ell+1}}\\mid\\mathcal F_\\ell\\right]\\right)^{1/m_{\\ell+1}}\n\\quad(\\ell=r-1,\\ldots,0).\n$$\nThus these conditional expectations average auxiliary messages only; the outer expectation below also averages the physical disorder and the root measures. Set\n$$\n\\mathcal B_r(\\zeta,m)=\\log2+\\mathbb E\\log T_0V_{\\rm s}-\\alpha(p-1)\\mathbb E\\log T_0V_{\\rm e},\\qquad\n\\Phi_r=\\inf_{\\substack{\\zeta\\in\\mathcal M_{r+1}\\\\0<m_1<\\cdots<m_r<1}}\\mathcal B_r(\\zeta,m).\n$$\nThis single-branch construction is equivalent to (5.2)--(5.3), and $\\mathcal B_r$ is precisely the right-hand side of Theorem 4, equation (5.10). At level $r=0$, instead take all messages independently with a common arbitrary law $\\zeta\\in\\mathcal M_1$, omit the operators $T_\\ell$, and define\n$$\n\\Phi_0=\\inf_{\\zeta\\in\\mathcal M_1}\\left\\{\\log2+\\mathbb E\\log V_{\\rm s}-\\alpha(p-1)\\mathbb E\\log V_{\\rm e}\\right\\}.\n$$\nThis is the optimized replica-symmetric value (2.3).\n\nProve or disprove that, for every model satisfying these hypotheses, the thermodynamic limit exists and\n$$\n\\lim_{N\\to\\infty}F_N=\\inf_{r\\in\\mathbb Z_{\\ge0}}\\Phi_r.\n$$\nThis is the sharpness conjecture immediately following Theorem 4: the infimum runs over all finite replica-symmetry-breaking levels, all their hierarchical message laws, and all admissible breakpoints. No attainment at a fixed level or by a particular trial law is asserted.\n\n[Administrative details redacted.]\n")

== 1 From structural obstacles to marked hierarchies <from-structural-obstacles-to-marked-hierarchies>

The reasoning begins with the gap between the interpolation upper bound of Panchenko and Talagrand [5] and the desired lower bound. Panchenko’s finite-RSB analysis [4] supplies a model for identifying the spin distribution, but pair-overlap ultrametricity alone does not determine the multioverlaps needed in a diluted system. Initial checks look for a counterexample in the assumptions: a nonintegrable factorization constant, asymmetric fields, interactions close to the positivity boundary, or messages tending to infinity. None yields one. Constant interactions instead provide a normalization check.

A many-site cavity argument appears promising: condition on randomness shared by all sites in a hierarchical representation, then seek independent site messages. The difficulty is that this shared randomness can adapt to the sampled sites. A pointwise law of large numbers gives no uniform comparison, and pinning may select states with the wrong weights.

VERBATIM EXCERPT

#raw(block: true, "\nAha recursive structure: overfitting shared variable can simulate original model at smaller scale.\n")

Enriched Gaussian fields, as in Mourrat and Panchenko [3], and the Hamilton–Jacobi viewpoint of Mourrat [2], suggest auxiliary hierarchies. Poisson perturbations motivated by the multioverlap identities in Barbier and Panchenko [1] offer more direct tests. The Bayesian setting does not transfer automatically: posterior-sampled observations and fractionally weighted observations have different laws.

The investigation therefore works directly with iterated power means and their tilted path transitions. A marked perturbation can specify where replicas branch; expanding the change of density gives signed coefficients for extending an old replica tree. For two replicas, the resulting identity suggests approximate invariance under replacing a child when adjacent exponents are close. Higher products are harder: their coefficients alternate in sign, dummy anchors cancel, and conditional projections cannot simply be inserted as arbitrary test functions.

The target becomes conditional decorrelation of sitewise product vectors, followed by concentration of ordinary multioverlaps. Fresh subtrees isolate useful conditional moments, but recovering a whole prescribed shape requires division by products of small exponent gaps. Coarse partitions and equal-exponent refinements repeatedly encounter the same problem: available continuity errors are too large after that division.

== 2 Shifting branching depths <shifting-branching-depths>

Further pinning attempts fail to reconcile their observation law with the cavity comparison. An exact purity claim also proves too strong: hidden Poisson–Dirichlet clustering inside a strict exponent jump can retain nontrivial overlap variation. Factorial-polynomial expansions and a cancellation using two copies expose squared covariance terms, but do not yet turn the signed identities into the desired ordinary covariance estimate.

The change is to shift every internal branching depth of the target tree by one level. These shifted splits avoid the old tree’s branching depths. Each new branching vertex must then pay a small fresh-divergence factor, matching the small factor in the prescribed shape’s normalization. The proposed shift still requires an averaged error estimate:

VERBATIM EXCERPT

#raw(block: true, "\nGreat! Need carefully prove average error little with shifted depths not rare\n")

The proposed induction replaces proper descendant groups by conditional mean vectors. An anchor identity supplies a positive weighted sum of squared replacement differences; bounded martingale increments control the one-level shifts after averaging over depths. A separate marker anchor introduces a fresh copy before the original first split, converting conditional decorrelation into ordinary shape-wise multioverlap concentration. The order of limits matters: errors in fixed-depth identities disappear before the hierarchy is refined.

The power-mean expansion is organized directly by adding paths. Its logarithmic coefficient magnitudes telescope, yielding a geometric remainder estimate after rescaling a bounded positive insertion. On the upper-bound side, normalization by the interaction at the all-plus configuration avoids demanding separate integrability of the factorization constant. The sign calculation reduces to the even-power convexity remainder

$ A^p - p A B^(p - 1) + \( p - 1 \) B^p gt.eq 0 . $

For the lower bound, sublinear marked Poisson perturbations yield identities while a diagonal selection retains low cavity increments. Polarization isolates prescribed branching patterns.

Finally, a uniformly sampled site’s leaf magnetization defines trial messages through its inverse hyperbolic tangent and successive conditional laws. Empirical spin-pattern probabilities are combinations of multioverlaps; concentration allows their replacement by the probabilities of independent trial labels. Exceptional tree shapes, large insertion counts, and series tails are removed in sequence. The next stage examines the proposed construction for gaps in its tree identities, conditioning steps, and limiting arguments.

== 3 Checking the identities and closing the comparison <checking-the-identities-and-closing-the-comparison>

The final stage returns repeatedly to whether a target subtree remains correctly distributed when its anchor already belongs to an old tree. Marginalizing the unused paths preserves the prescribed independent transitions. This permits conditional covariance estimates even when the observable being tested is correlated with the extension.

The coefficient calculation is checked at two levels and reorganized as a positive squared-difference identity. Distinct new branching vertices are charged to distinct fresh divergences, including when their depths coincide. This is the point of the shift: after normalization, the absolute coefficient bounds remain controlled. Along unary stretches, bounded vector martingales have bounded total squared increments, so the averaged error from moving a depth by one tends to zero.

Another concern is whether varying the small insertion parameter silently changes the background measure. The calculation instead treats each value as a hypothetical extra factor in the same fixed background. Poisson removal supplies that background, cancellation removes the anchor factor, and uniform analytic estimates permit coefficient extraction. Polarized marks then select the required tree constraints.

The conditional-decorrelation induction and the marker-anchor variance argument are checked together. Proper child groups are replaced by conditional means, and the resulting three-copy estimate controls the normalized squared conditional covariance. Ordinary multioverlap concentration follows by comparing a fresh copy with the original shape. In the cavity comparison, fresh uniformly sampled sites give empirical pattern masses; the trial hierarchy uses their expectations. Finite cutoffs leave only finitely many such comparisons, while nonregular shapes and analytic tails contribute vanishing errors.

To return from bounded disorder to the stated first-moment assumptions, the construction subtracts the all-plus interaction value and truncates the normalized interaction and field. Uniform free-energy and trial-functional error bounds allow the truncations to be removed. The final response claims that the resulting lower comparison matches the interpolation upper bound, giving the existence of the limit and the infimum over finite hierarchies.

#heading(level: 1)[References]
#bibitem([1])[Jean Barbier and Dmitry Panchenko. #emph[Strong replica symmetry in high-dimensional optimal Bayesian inference]. Communications in Mathematical Physics #strong[393]\(3) (2022), 1199--1239. #link("https://doi.org/10.1007/s00220-022-04387-w").]
#bibitem([2])[Jean-Christophe Mourrat. #emph[The Parisi formula is a Hamilton--Jacobi equation in Wasserstein space]. Canadian Journal of Mathematics #strong[74]\(3) (2022), 607--629. #link("https://doi.org/10.4153/S0008414X21000031").]
#bibitem([3])[Jean-Christophe Mourrat and Dmitry Panchenko. #emph[Extending the Parisi formula along a Hamilton--Jacobi equation]. Electronic Journal of Probability #strong[25] (2020), paper no.~23, 1--17. #link("https://doi.org/10.1214/20-EJP432").]
#bibitem([4])[Dmitry Panchenko. #emph[Structure of finite-RSB asymptotic Gibbs measures in the diluted spin glass models]. Journal of Statistical Physics #strong[162]\(1) (2016), 1--42. #link("https://doi.org/10.1007/s10955-015-1385-8").]
#bibitem([5])[Dmitry Panchenko and Michel Talagrand. #emph[Bounds for diluted mean-fields spin glass models]. Probability Theory and Related Fields #strong[130]\(3) (2004), 319--336. #link("https://doi.org/10.1007/s00440-004-0342-2").]


