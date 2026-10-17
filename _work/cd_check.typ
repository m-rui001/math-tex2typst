#import "@preview/cetz:0.5.0"

#page(width: 12cm, height: 8cm)[hook
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$X$])
  line((0.5, 0), (2.7, 0), mark: (end: ">"))
  line((0.5, 0), (0.5, -0.3))
  line((0, 0.5), (0, 2.7), mark: (end: ">"))
  content((-0.45, 1.6), [$f$])
  content((3.2, 0), [$W$])
  line((3.7, 0), (5.9, 0), mark: (end: ">"))
  content((4.8, -0.45), [$p$])
  line((3.2, 0.5), (3.2, 2.7), mark: (end: ">"))
  content((3.65, 1.6), [$g$])
  content((6.4, 0), [$R$])
  line((6.4, 0.5), (6.4, 2.7), mark: (end: ">"))
  content((0, 3.2), [$D$])
  line((0.5, 3.2), (2.7, 3.2), mark: (end: ">"))
  line((0.5, 3.2), (0.5, 2.9))
  content((3.2, 3.2), [$V$])
  line((3.7, 3.2), (5.9, 3.2), mark: (end: ">"))
  content((6.4, 3.2), [$A .$])
})
]
#page(width: 12cm, height: 8cm)[equal
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$0$])
  line((0.5, 0), (2.7, 0), mark: (end: ">"))
  content((3.2, 0), [$c_(n + 1) P_R$])
  line((3.7, 0), (5.9, 0), mark: (end: ">"))
  line((3.2, 0.5), (3.2, 1.2), mark: (end: ">"))
  content((2.75, 0.85), [$overline(b)_(n + 1)$])
  content((6.4, 0), [$P_(R \, n)$])
  line((6.9, 0), (9.1, 0), mark: (end: ">"))
  line((6.4, 0.5), (6.4, 1.2), mark: (end: ">"))
  content((9.6, 0), [$c_n P_R$])
  line((10.1, 0), (12.3, 0), mark: (end: ">"))
  line((9.71, 0.5), (9.71, 1.2))
  line((9.49, 0.5), (9.49, 1.2))
  content((12.8, 0), [$0$])
  content((0, 1.7), [$0$])
  line((0.5, 1.7), (2.7, 1.7), mark: (end: ">"))
  content((3.2, 1.7), [$c_n P_L$])
  line((3.7, 1.7), (5.9, 1.7), mark: (end: ">"))
  content((6.4, 1.7), [$c_n P_V$])
  line((6.9, 1.7), (9.1, 1.7), mark: (end: ">"))
  content((9.6, 1.7), [$c_n P_R$])
  line((10.1, 1.7), (12.3, 1.7), mark: (end: ">"))
  content((12.8, 1.7), [$0 .$])
})
]
#page(width: 12cm, height: 8cm)[bend
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$cal(D)_C^(upright(o r))$])
  line((0.5, 0), (1.6, -0.9))
  line((1.6, -0.9), (2.7, 0), mark: (end: ">"))
  content((1.6, -1.35), [$frak(s)$])
  content((3.2, 0), [$cal(D)_Gamma^(upright(o r))$])
  line((2.7, 0), (1.6, 0.9))
  line((1.6, 0.9), (0.5, 0), mark: (end: ">"))
  content((1.6, 1.35), [$frak(f)$])
})
]
#page(width: 12cm, height: 8cm)[two-label
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$"C_(G^a,_m)[0]"$])
  line((0.5, 0), (2.7, 0), mark: (end: ">"))
  content((1.6, -0.45), [$u_(tilde(Y) \, G \, m)^a$])
  line((0, 0.5), (0, 1.2), mark: (end: ">"))
  content((-0.45, 0.85), [$iota_m$])
  content((3.2, 0), [$R Gamma_v \( tilde(Y) times underline(G^a) \, Lambda_m \)$])
  line((3.2, 0.5), (3.2, 1.2), mark: (end: ">"))
  content((3.65, 0.85), [$omega_m$])
  content((0, 1.7), [$C_(G^a,W_m( L))[0]$])
  line((0.5, 1.7), (2.7, 1.7), mark: (end: ">"))
  content((1.6, 2.15), [$alpha_(G^a \, m)$])
  content((1.6, 1.25), [$tilde.op$])
  content((3.2, 1.7), [$"R_v( Ytimes{G^a},W_m(^))."$])
})
]
#page(width: 12cm, height: 8cm)[diag3
#cetz.canvas({
  import cetz.draw: *
  content((3.2, 0), [$S$])
  line((3.2, 0.5), (3.2, 2.7), mark: (end: ">"))
  line((2.976, 0.4472), (0.795, 2.798))
  line((0.795, 2.798), (0.2236, 5.953), mark: (end: ">"))
  content((0.3925, 2.596), [$f$])
  line((3.424, 0.4472), (5.605, 2.798))
  line((5.605, 2.798), (6.176, 5.953), mark: (end: ">"))
  content((6.007, 2.596), [$pi$])
  content((3.2, 3.2), [$S_0$])
  line((2.846, 3.554), (0.3536, 6.046), mark: (end: ">"))
  content((1.282, 4.482), [$f_0$])
  line((3.554, 3.554), (6.046, 6.046), mark: (end: ">"))
  content((5.118, 4.482), [$pi_0$])
  content((0, 6.4), [$Y$])
  content((6.4, 6.4), [$W .$])
})
]
