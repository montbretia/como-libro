#set page(paper: "a5")
#set text(font:"Adobe Caslon Pro", size: 10pt, lang: "es")

#include "cover.typ"

#show par: set block(spacing: 0.55em)
#set par(justify: true, leading: 0.5em, first-line-indent: 1em)

#show quote: set pad(top: -1.6em, bottom: -0.8em, x: 2em)

#show heading: it => [
    #set text(
      font: "Jost*",
      weight: "semibold")
    #if it.level == 1 [
      #if it.outlined == true [#pagebreak()]
      #v(5em)
      #text(size: 16pt)[#it]
      #v(1em)
    ] else if it.level == 2 [
      #v(1em)
      #text(size: 13pt)[#it]
      #v(0.5em)
    ] else if it.level == 3 [
      #v(0.8em)
      #text(size: 12pt)[#it]
      #v(0.5em)
    ] else [
      #emph(it)
    ]
  ]

#show outline.entry.where(level: 1): it => {
  v(0.5em)  
  strong(it)
}
 
#show outline.entry.where(level: 2): it => {
  emph(it)
}

#set page(numbering: "i")
#include "frontmatter.typ"

#set heading(
    numbering: "1.",
  )

#set page(numbering: "1")
#counter(page).update(1)
#include "ch1.typ"
#include "ch2.typ"
#include "ch3.typ"
#include "ch4.typ"
#include "ch5.typ"
#include "ch6.typ"
#include "ch7.typ"
#include "ch8.typ"
#include "ch9.typ"
#include "ch10.typ"
#include "respuestas.typ"
#include "backmatter.typ"
