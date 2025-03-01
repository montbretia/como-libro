#set document(
  title: [¿Cómo? Una Introducción a la Epistemología del Saber Cómo],
  author: "Felipe Morales Carbonell",
  keywords: ("saber-cómo", "epistemología")
)

#set page(paper: "a5")
#set text(font:"Minion Pro", size: 10.5pt, lang: "es", number-type: "old-style")
#show math.equation: set text(font: "Libertinus Math")

#include "jacket.typ"
#include "cover.typ"

#set par(spacing: 0.51em, justify: true, leading: 0.51em, first-line-indent: 1em)

#show quote: set pad(top: -1.6em, bottom: -0.8em, x: 2em)

#set cite(form: "prose")

// #show cite: set text(fill: blue.darken(50%))
#show cite: it => {underline(stroke: (thickness: 0.5pt, paint: red.transparentize(20%), dash: "dashed"), offset: 1.5pt)[#it]}
#show link: it => {underline(stroke: (thickness: 0.5pt, paint: red.transparentize(20%), dash: "dashed"), offset: 1.5pt)[#it]}

#show terms: set block(above: 1.2em, below: 1.2em)
#show figure: set block(above: 1.2em, below: 1.2em)

#set list(indent: 1em)
#show enum: set block(above: 1em, below: 1em)
#show list: set block(above: 1em, below: 1em)
#show math.equation.where(block: true): set block(above: 1em, below: 1em)

#show heading: it => [
    #set text(
      font: "Jost*",
      weight: "semibold")
    #if it.level == 1 [
      #if it.outlined == true [#pagebreak()]
      #v(5em)
      #text(size: 15pt)[#it]
      #v(4em)
    ] else if it.level == 2 [
      #v(1.2em)
      #text(size: 12pt, weight: "medium")[#it]
      #v(0.5em)
    ] else if it.level == 3 [
      #v(0.8em)
      #text(size: 11pt, weight: "medium")[#it]
      #v(0.5em)
    ] else [
      #emph(it)
    ]
  ]

#import "@preview/wordometer:0.1.4": word-count, total-words

#show: word-count

#total-words palabras

#v(1em)


#show outline.entry.where(level: 1): it => {
  v(0.5em)  
  strong(it)
}
 
#show outline.entry.where(level: 2): it => {
  emph(it)
}

#include "frontmatter.typ"



#set heading(numbering: "1.")
#set page(numbering: "1")
#counter(page).update(1)

#include "chapters/ch1.typ"
#include "chapters/ch2.typ"
#include "chapters/ch3.typ"
#include "chapters/ch4.typ"
#include "chapters/ch5.typ"
#include "chapters/ch6.typ"
#include "chapters/ch7.typ"
#include "chapters/ch8.typ"
#include "chapters/ch9.typ"
#include "chapters/ch10.typ"
#include "chapters/apendice-logica.typ"
#include "chapters/respuestas.typ"
#include "backmatter.typ"
