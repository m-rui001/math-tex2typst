#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(width: 90mm, height: 60mm, margin: 12mm)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2cm, height: 1cm, inset: 0.3333em, radius: 8pt, stroke: (thickness: 0.4pt), [#set text(hyphenate: false); #align(center + horizon)[L]])])
})