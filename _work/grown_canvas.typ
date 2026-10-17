#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666")), fill: rgb("#f5f5ff"), [#text(size: 9pt)[Downward pass: $(a, frac(4, 3) b)$#linebreak() Plus peaks stay fixed.#linebreak()$I_-$ has no plus claims.#linebreak() At stopping, each minus witness#linebreak()claiming outside $I_-$ has#linebreak()$b$-mass $>3/4$ at gaps $<q$.]])])
  content((7.164, 0), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666")), fill: rgb("#fff7f0"), [#text(size: 9pt)[Upward pass: $( frac(4, 3) a,b)$#linebreak() Minus peaks stay fixed.#linebreak()$I_+$ has no minus claims.#linebreak() At stopping, each plus witness#linebreak()claiming outside $I_+$ has#linebreak()$a$-mass $>3/4$ at gaps $<q$.]])])
  line((3.132, 0), (4.032, 0), stroke: (paint: rgb("#595959")))
  content((7.164, -2.403), [#text(size: 9pt)[The earlier minus-mass bound persists:#linebreak()every minus gap is nonincreasing.]])
  line((7.164, -1.434), (7.164, -2.034), stroke: (paint: rgb("#595959")))
  content((3.582, -5.126), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#666666")), fill: rgb("#f7f7f7"), [#text(size: 9pt)[Provisional call: width $D/2$, masses $(a,b)$#linebreak() Every gap $<q$ is a child claim, since $q<D/64$.#linebreak()Each remaining witness has mass $>3/4$#linebreak()receiving its sign.]])])
  line((0, -1.434), (0, -2.714), (-1.95, -2.714), (-1.95, -4.134), stroke: (paint: rgb("#595959")))
  line((7.164, -2.772), (7.164, -2.922), (9.114, -2.922), (9.114, -4.134), stroke: (paint: rgb("#595959")))
  content((3.582, -7.088), [#text(size: 9pt)[Multiply masses at matching provisional signs by $4/5$,#linebreak()and at opposite signs by $8/5$. The witness's total mass becomes $<1$.]])
  line((3.582, -6.119), (3.582, -6.719), stroke: (paint: rgb("#595959")))
})