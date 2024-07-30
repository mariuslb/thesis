#import "template.typ": Template, code
#import "@preview/glossarium:0.3.0": gls
#let translations = json("translations.json").at("de")


#show: Template.with(
  bib: arguments("sources.bib", style: "frontiers"), 
  appendix: (
    [
      #heading("Struktur einer Fahrtaufzeichnung",supplement: [#translations.appendix])
      #include "code-anhang/str-data.typ"

    ],
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

#include "content/05-ergebnisse.typ"

#include "content/06-diskussion.typ"


// = Kein Teil

// = Einleitung
// #lorem(15)

// Wenn ich @oidc zum ersten mal erwähne wird es ausgeschrieben. \
// Beim zweiten Mal wird @oidc nur abgekürzt. 

// Übrigens gibt es das @haus
