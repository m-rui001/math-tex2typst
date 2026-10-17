#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 18cm, height: 20cm, margin: 1.5cm)
#set text(lang: "en", size: 11pt)

#cetz.canvas({
  import cetz.draw: *
  rect((-1, -0.08), (10, 0.08), fill: rgb("#f5f5f5"))
  line((-1, 0), (10, 0), stroke: (paint: rgb("#737373")))
  line((0, -1.9), (0, 2.1), mark: (end: ">"))
  content((0, 2.1), [$z$], anchor: "south")
  circle((0, 1.25), radius: 0.07056, fill: black)
  content((0, 1.25), [$+"De"_z$])
  circle((0, -1.25), radius: 0.07056, fill: black)
  content((0, -1.25), [$-"De"_z$])
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-west")
  content((3.3, -0.12), [#text(size: 9pt)[median plane]], anchor: "north")
  line((1.1, 0.5), (5.2, 0.5), mark: (end: ">"))
  content((3.15, 0.5), [$p arrow.r.long infinity$], anchor: "south")
  rect((6.3, -1.35), (9.3, 1.35), stroke: (paint: rgb("#666666"), dash: "dashed"))
  circle((7.1, 0), radius: 0.05997, fill: black)
  content((7.1, 0), [$p omega$])
  line((7.1, 0), (8.55, 0), mark: (end: ">"))
  content((8.55, 0), [$omega$], anchor: "west")
  line((7.1, 0), (7.1, 0.9), mark: (end: ">"))
  content((7.1, 0.9), [$z$], anchor: "south")
  content((7.8, 1.43), [#text(size: 9pt)[translated window]], anchor: "south")
  content((7.8, -1.45), [#text(size: 9pt)[$n(p,0) "gtrsim" lambda A(p)p^{-4}$]], anchor: "north")
})
