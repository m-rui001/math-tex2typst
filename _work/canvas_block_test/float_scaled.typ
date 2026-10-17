#import "@preview/cetz:0.5.2"
#set page(width: 17.8cm, height: 23.8cm, margin: 2.5cm)
#lorem(300)
#place(float: true, clearance: 1em, #figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10, 8), stroke: red)
  rect((0, 0), (10, 8))
})
  Panel A text line.
  #cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10, 9), stroke: red)
  rect((0, 0), (10, 9))
})
  Panel B text line.],
  caption: [Figure 1: THE-CAPTION-OF-THE-TWO-PANEL-FIGURE. #lorem(40)],
))