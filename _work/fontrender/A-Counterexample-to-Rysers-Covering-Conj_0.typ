#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt), [#text(size: 9pt)[$w=(w_1,w_2) in Y$]])])
  content((-3.5, -1.55), [#box(inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt), [#text(size: 9pt)[Ambient coordinates#linebreak()$y_{i,w}=b_i+M_"iw" in Y_i$]])])
  content((3.5, -1.55), [#box(inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt), [#text(size: 9pt)[Small-plane coordinates#linebreak()$f(w)=(w_1^3,w_2) in f(Y)$]])])
  content((-3.5, -3.65), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), [#text(size: 9pt)[Ordinary vertex in $V_d$#linebreak()$o_{ ell_d(y_{i,w})}$]])])
  content((3.5, -3.65), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), [#text(size: 9pt)[Special vertex in $V_d$#linebreak()$v_{i,d,L_{t_i(d)}(f(w))}$]])])
  line((0, 0), (-3.5, -1.55), mark: (end: ">"))
  content((-1.891, -0.8456), [embed], anchor: "south-east")
  line((0, 0), (3.5, -1.55), mark: (end: ">"))
  content((1.891, -0.8456), [apply $f$], anchor: "south-west")
  line((-3.5, -1.55), (-3.5, -3.65), mark: (end: ">"))
  content((-3.5, -2.6), [$d "notin" S_i$], anchor: "east")
  line((3.5, -1.55), (3.5, -3.65), mark: (end: ">"))
  content((3.5, -2.6), [$d in S_i$], anchor: "west")
})
