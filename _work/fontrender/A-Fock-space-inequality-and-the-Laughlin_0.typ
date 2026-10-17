#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000073")), [#text(size: 9pt)[Finite limiting matrices#linebreak() Exact positivity on the#linebreak()four-particle space]])])
  content((1, 0), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000073")), [#text(size: 9pt)[Fixed set of modes#linebreak() Exact change of variables;#linebreak()error bounded by pair energy]])])
  content((2, 0), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000073")), [#text(size: 9pt)[All particle sectors#linebreak() Add spectator modes and#linebreak()average over rotations]])])
  line((0, 0), (1, 0), mark: (end: ">"))
  line((1, 0), (2, 0), mark: (end: ">"))
})
