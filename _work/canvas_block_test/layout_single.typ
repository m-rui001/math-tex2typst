#import "@preview/cetz:0.5.2"
#set page(width: 17.8cm, height: 23.8cm, margin: 2.5cm)
#lorem(300)
#figure(
  [#layout(ly => cetz.canvas(
  length: 1cm * calc.min(ly.width / 10cm, ly.height / 15.3cm),
  {
  import cetz.draw: *
  line((0, 0), (10, 15.3), stroke: red)
  rect((0, 0), (10, 15.3))
}))
  Panel A text line.
  #layout(ly => cetz.canvas(
  length: 1cm * calc.min(ly.width / 10cm, ly.height / 15.3cm),
  {
  import cetz.draw: *
  line((0, 0), (10, 15.3), stroke: red)
  rect((0, 0), (10, 15.3))
}))
  Panel B text line.],
  caption: [Figure 1: THE-CAPTION-OF-THE-TWO-PANEL-FIGURE. #lorem(40)],
)
