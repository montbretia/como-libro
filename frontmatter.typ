#import "@preview/ccicons:1.0.1": *
#import "@preview/scienceicons:0.1.0": open-access-icon, github-icon

#[
  #set text(size: 9.5pt)
  #set par(first-line-indent: 0em)
Copyright #sym.copyright 2025 Felipe Morales Carbonell\ 
Santiago, Chile

#v(1em)

#open-access-icon() #cc-by Distribuido bajo una licencia
#link("https://creativecommons.org/licenses/by/4.0/deed.es")[Creative Commons
Atribución 4.0].

#v(1em)

Versión: 1.6.1 (#datetime.today().display("[day]-[month]-[year]"))

#v(1em)

Producido usando #link("https://typst.app")[Typst].

#v(1em)

ISBN: 978-956-420-770-4

]

#pagebreak(to: "odd")

#align(center+horizon)[
    Para los estudiantes,\
    los que he tenido,\
    y los que quiero tener
]

#pagebreak(to: "odd")

#set page(numbering: "i")

#counter(page).update(1)

#[
#show outline: set heading(bookmarked: true)

#outline(title: [Tabla de contenidos], indent: auto)
]

#set pagebreak(to: "odd")


= Prefacio

Este trabajo es parte del proyecto ANID Fondecyt de Postdoctorado #3220017
"Saber Cómo: Preguntas, Maneras e Intentos" (2022-2025). Agradezco enormemente
la oportunidad y apoyo.

Gracias a los asistentes al grupo de lectura 'Introducción a la epistemología
del saber cómo' (segundo semestre 2024), quienes me dieron ideas útiles mientras
terminaba el borrador inicial. Especiales gracias a Francisco Barría y Héctor
Mira, quienes además de participar en este grupo, colaboraron en la preparación
de la versión final de este documento. Le agradezco además a los alumnos del
seminario 'Introducción a la epistemología del saber cómo' (1er semestre 2025)
por su interés y comentarios.

Le agradezco también a Rodrigo González, Giulia Lorenzi, Sofia Mondaca, Sandra
Visokolskis, Jan Heylen, Kristine Grigoryan y Sheena Ramkumar por conversar
conmigo sobre los temas del libro. Muchas otras personas han influido
indirectamente en este trabajo.

Finalmente, le agradezco a mi familia, en especial a mi madre.

Partes del texto han sido publicadas antes o han aparecido (o aparecerán) en otras formas:

- Partes de la sección 5.5 están basadas en #cite(<MoralesCarbonell2023>, form:
  "full"). 
- Parte del capítulo 9 está basado en #cite(<MoralesCarbonell2025b>, form: "full")
- El capítulo 10 está basado en #cite(<MoralesCarbonell2025>, form: "full")



Este libro fue preparado usando #link("https://github.com/typst/typst/")[typst].
La versión más reciente del código fuente está disponible en
#github-icon(height: 0.8em) https://github.com/montbretia/como-libro. ¡Son
bienvenidas correcciones y sugerencias!

