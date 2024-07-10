#import "template.typ": Template
#import "@preview/glossarium:0.3.0": gls
#let translations = json("translations.json").at("de")

#show: Template.with(
  bib: arguments("sources.bib", style: "frontiers"), 
  appendix: (
    [
      #heading("Wichtiger Anhang",supplement: [#translations.appendix])
      #lorem(100)
    ],
    [
      #heading("Weiterer Wichtiger Anhang",supplement: [#translations.appendix]) <ref>
      #lorem(100)
    ]
  ),
  show_lists_after_content: false,
  confidental_clause: true,
  abbreviation_entries: (
    ( key: "oidc", short: "OIDC", long: "Open ID Connect" ),
    ( key: "lcmm", short: "LCMM", long: "Low Carbon Mobility Management"),
    ( key: "wltp", short: "WLTP", long: "Worldwide Harmonized Light Vehicles Test Procedure"),
    ( key: "tsi", short: "TSI", long: "T-Systems International GmbH"),
    ( key: "ev", short: "EVs", long:"Elektrofahrzeuge"),
    ( key: "ice", short: "ICEs", long: "Fahrzeuge mit Verbrennungsmotor")
  ),
  glossary_entries: (
    ( key: "haus", short: "Haus", long: "Besteht aus 4 Wänden und einem Dach" ),
    ( key: "datascience", short: "Data Science", long: "Interdisziplinäres Feld, das Methoden aus Mathematik, Statistik und Informatik nutzt, um Wissen und Erkenntnisse aus großen Datenmengen zu gewinnen")
  ),
  ai_entries: (
    ( "OpenAI ChatGPT", "Schreib meine Bachelorarbeit", "Bachelorarbeit schreiben lassen und lieber Fortnite zocken" ),
    ( "Google Gemini", "Gib mir Motivationstipps", "Die Nerven beibehalten" )
  )
)

#include "content/01-einleitung.typ"

#include "content/02-theorie.typ"

#include "content/03-methodik.typ"

#include "content/04-analyse.typ"


= Diskussion

== Interpretation der Ergebnisse

== Limitation der Methodik
 
== Einordung in bestehende Forschung

== Implikation für den Praxisfall

== Selbstkritik und Limitationen der Arbeit

= Fazit und Ausblick

== Zusammenfassung der zentralen Erkenntnisse

== Praktische Implikationen für Stakeholder

== Vorschläge für zukünftige Forschungen

= Kein Teil

= Einleitung
#lorem(15)

Wenn ich @oidc zum ersten mal erwähne wird es ausgeschrieben. \
Beim zweiten Mal wird @oidc nur abgekürzt. 

Übrigens gibt es das @haus

#pagebreak()

= Grundlagen
#lorem(100)
== Unterpunkt
#lorem(100)
#figure(
  image("img/provadis.png", width: 80%),
  caption: [A curious figure.],
) <glacier>
#pagebreak()

== Unterpunkt



#lorem(100)
=== Unter-Unterpunkt
#lorem(100)
=== Unter-Unterpunkt
#pagebreak()

== Unterpunkt
#lorem(100)

=== Unter-Unterpunkt
#lorem(100)

= Zusammenfassung
#lorem(100)

