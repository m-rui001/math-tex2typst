#set page(numbering: "1")
#counter(page).show("1")
A first page.
#pagebreak()
#label("target")Text on the second page.
#hrule()
Page via counter: #counter(page).at(<target>).first()
#hrule()
Page via display: #ref(<target>, display: "page")
