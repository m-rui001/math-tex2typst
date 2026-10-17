#import "@preview/cetz:0.5.0"
#set page(width: 300pt, height: 200pt)
#cetz.canvas({
  import cetz.draw: *
  content((10, 10), [first #linebreak() second])
  content((10, 30), [a $phi$ b #text[bold-ish] c])
  content((10, 50), [100 percent: 50 % done 30%])
  content((10, 70), [stars *bold* and under_score and <angle>])
  content((10, 90), [$x_(i+1)$ and $a^2 b^2$])
})
