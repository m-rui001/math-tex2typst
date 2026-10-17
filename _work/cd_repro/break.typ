#import "@preview/cetz:0.5.0"
#set page(width: 200pt, height: 160pt, margin: 10pt)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$a$ #linebreak $b$])
  content((2, 0), [#text(size: 8pt)[one] #linebreak two])
})
