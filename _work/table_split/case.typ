#set page(width: 200pt, height: 220pt, margin: 6pt)

A control case for the page-172 pile-up in The-hypercube-Ramsey-number-has-linear-order: a table
whose body is taller than one page, with its caption after it. The question is where Typst puts the
caption, and whether `table.header` repeats on the continuation page.

#figure(
  table(
    columns: 3,
    inset: 2pt,
    table.header[head one][head two][head three],
    ..range(40).map(i => (str(i), str(i), str(i))).map(r => (..r)).flatten()
  ),
  kind: table,
  caption: [Table 1: a caption that belongs under a table taller than the page.],
)

After the float there is prose, and it is the prose the caption may be sitting on top of:
#lorem(40)
