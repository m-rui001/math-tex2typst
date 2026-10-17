#import "@preview/cetz:0.5.2"
#set page(width: 17.8cm, height: 23.8cm, margin: 2.5cm)
#lorem(300)
#figure(
  [#block(cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10, 13), stroke: red)
  rect((0, 0), (10, 13))
}))
  Panel A text line.
  #block(cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10, 15), stroke: red)
  rect((0, 0), (10, 15))
}))
  Panel B text line.],
  caption: [Figure 1: THE-CAPTION-OF-THE-TWO-PANEL-FIGURE. #lorem(40)],
)
