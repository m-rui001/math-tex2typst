#set text(lang: "en", size: 11pt)
#set math.equation(numbering: none)

// Try: show rule that only numbers equations that carry a label
#show math.equation.where(label: none): it => it
#show math.equation: it => {
  // can't easily inspect label here
  it
}

= Test: which display equations get numbered?

$ a = 1 $ <eq:a>

$ b = 2 $

$ c = 3 $ <eq:c>
