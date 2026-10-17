#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: *
  line((1.2, -2), (2.8, -2), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  line((2, -2.8), (2, -1.2), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  content((2, -2), [#box(stroke: (thickness: 0.4pt, paint: black), inset: 0.1389cm, [Label text here])])
})
