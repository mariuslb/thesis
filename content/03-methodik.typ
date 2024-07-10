= Methodik

== Datenerhebung (Aufzeichnungen, Testbedingungen, Fahrerverhalten)

In diesem Kapitel wird erläutert wie reale Fahrdaten erhoben werden, die in einem 
darauffolgenden Schritt aggregiert und analysiert werden. Dafür wurden im März 2024 
Fahrten mit einem Elektrofahrzeug (Opel Mokka E) und einem Verbrennerfahrzeug (VW Golf 8) 
aufgezeichnet. Diese Datensätze sollen es ermöglichen, eine Grundlage zu schaffen, anhand 
dessen mit  Methoden der @datascience die Hypothesen beantwortet werden können.

=== Testfahrzeuge

Für die Aufzeichnung der Fahrdaten wurden zwei Fahrzeuge aus der Kompaktklasse verwendet, welche mit folgenden 
Eigenschaften spezifiziert sind:

#figure(
  caption: figure.caption(
    position: top,
    [Übersicht über Fahrzeuge]
  ),
table(
  columns: (30%, 35%, 35%),
  inset: 10pt,
  table.header( 
    [], [*Opel Mokka E*], [*VW Golf 8*]
    ),
    [*Treibstoff*], [], [],
    [*Masse*], [], [],
    [*Luftwiderstandskoeffizient*], [], [],
    [*Querschnittsfläche*], [], [],
    [*Effizienz*], [], [],
    [*Treibstoff-Emissions-Faktor*], [], [],
    [*Rollwiderstandskoeffizient*], [], [],
    [*Stillstandsverbrauch*], [], [],
    [*WLTP-Klasse*], [], [],
)
)

=== Mobile Datenaufzeichnung

Die Datenerhebung für diese Untersuchung wurde mithilfe einer speziell für @lcmm entwickelten mobilen App durchgeführt, die in der Lage ist, detaillierte Fahrdaten im Sekundentakt aufzuzeichnen. Diese App wurde auf Smartphones installiert, welche sowohl im Golf 8 als auch im Mokka E während den Vergleichsfahrten ausgeführt wurde. 

Die erfassten Daten umfassen eine Vielzahl von Parametern, die für die Analyse der Energieeffizienz und des Fahrverhaltens von entscheidender Bedeutung sind. Im Folgenden werden die wichtigsten aufgezeichneten Parameter detailliert beschrieben:

#table(
  columns: (20%, 20%, auto),
  inset: 10pt,
  table.header(
    [*Bezeichnung*], [*Datenfeld*], [*Beschreibung*]
  ),
    [*Zeitstempel*], [*Time $[m s]$*], 
    [Jeder Datensatz enthält einen genauen Zeitstempel, der den Zeitpunkt der Aufzeichnung in Millisekunden seit dem 1. Januar 1970 (Unix-Zeit) angibt. Dies ermöglicht eine präzise Synchronisation und zeitliche Analyse der Fahrdaten.],

    [*Geografische Koordinaten*], [Latitude, Longitude], 
    [Die genauen geografischen Positionen des Fahrzeugs werden mittels GPS erfasst. Diese Daten sind essenziell, um die zurückgelegte Strecke, die Route und spezifische Standortdaten zu bestimmen.],
  
    [*Geschwindigkeit*], [*Speed $[m/s]$*], 
    [Die Geschwindigkeit des Fahrzeugs wird in Metern pro Sekunde gemessen. Diese Information ist notwendig, um Beschleunigungsmuster und die durchschnittliche Reisegeschwindigkeit zu analysieren.],
  
    [*Zurückgelegte Distanz*], [*Distance $[m]$*], 
    [Die Distanz wird in Metern gemessen und gibt die Strecke an, die das Fahrzeug seit der letzten Aufzeichnung zurückgelegt hat.],
  
    [*Höhe*], [*Altitude $[m]$*], 
    [Die Höhe über dem Meeresspiegel wird in Metern angegeben. Diese Daten sind besonders relevant für die Analyse von Fahrten in hügeligem oder bergigem Gelände, da Höhenunterschiede den Energieverbrauch beeinflussen können.],
  
    [*Beschleunigung*], [*Acceleration $[m/s^2]$*], 
    [Die Veränderung der Geschwindigkeit pro Sekunde wird gemessen, um das Beschleunigungs- und Verzögerungsverhalten des Fahrzeugs zu analysieren.]
)

=== Standardisierung der Testbedingungen

Um die Vergleichbarkeit der Fahrdaten sicherzustellen und Verzerrungen durch unterschiedliche Testbedingungen zu vermeiden, wurden folgende Maßnahmen zur Standardisierung ergriffen:

#table(
  columns: (23%, auto),
  inset: 10pt,
  table.header(
    [*Kriterium*], [*Beschreibung*]
  ),
    [*Gleiche Routen*], 
    [Beide Fahrzeuge starteten und endeten an denselben Orten in Hamburg und folgten einer vordefinierten Route. Dies gewährleistet, dass die Fahrzeuge unter identischen geografischen und verkehrstechnischen Bedingungen getestet wurden.],
  
    [*Zeitfenster*], 
    [Die Fahrten wurden an zwei aufeinanderfolgenden Werktagen, dem 4. und 5. März 2024, durchgeführt. Die Testfahrten fanden von morgens bis abends statt, um die Auswirkungen unterschiedlicher Tageszeiten und Verkehrsdichten zu berücksichtigen und zu minimieren.],
  
    [*Wetterbedingungen*], 
    [Die Wetterbedingungen wurden während der Testtage kontinuierlich überwacht. Durch die Auswahl von zwei aufeinanderfolgenden Tagen wurde sichergestellt, dass die Witterungsverhältnisse vergleichbar waren, um externe Einflüsse auf den Fahrwiderstand und den Energieverbrauch zu minimieren.],
  
    [*Fahrerverhalten*], 
    [Beide Fahrzeuge wurden parallel und synchronisiert gestartet, um Unterschiede im Fahrerverhalten auszuschließen. Die Fahrer hielten sich an eine vorab festgelegte Fahrweise, die gleichmäßige Beschleunigungs- und Bremsmanöver sowie konstante Geschwindigkeiten auf bestimmten Streckenabschnitten vorsah. Durch diese Standardisierung wurde gewährleistet, dass alle Fahrten unter möglichst identischen Bedingungen durchgeführt wurden.]
)

Um die Zuverlässigkeit und statistische Signifikanz der Ergebnisse zu erhöhen, wurden insgesamt 30 Fahrten pro Fahrzeugtyp (Golf 8 und Mokka E) nahezu parallel durchgeführt, d. h. beide Fahrzeuge sind zum selben Zeitpunkt losgefahren. Diese wiederholten Messungen ermöglichen es, zufällige Schwankungen und Anomalien zu identifizieren und auszuschließen, wodurch die Datenbasis für die nachfolgende Analyse robuster und aussagekräftiger wird.

Durch diese detaillierte und systematische Datenerhebung wird eine solide Grundlage geschaffen, um die Energieeffizienz von Elektro- und Verbrennungsfahrzeugen unter realen Fahrbedingungen präzise und zuverlässig zu vergleichen.

== Analysemethodik

Um aussagekräftige und sinnvolle Ergebnisse bei der Datenanalyse zu erzielen, wird der *Data Science Lifecycle* als Struktur genutzt. Dieser Lifecycle besteht aus mehreren Phasen: Business Understanding, 
Data Mining, Data Cleaning, Data Exploration, Feature Engineering, Predictive Modeling und Data Visualization. 
Jede Phase ist entscheidend, um die gesammelten Fahrdaten systematisch zu aggregieren und zu analysieren.

+ *Business Unterstanding*: Der erste Schritt im Data Science Lifecycle ist das Verständnis des 
 Geschäftskontexts und der Ziele der Analyse. In dieser Untersuchung ist das Ziel, die Effizienz und 
 Nachhaltigkeit von Elektrofahrzeugen (EVs) im Vergleich zu Fahrzeugen mit Verbrennungsmotoren (ICEs) 
 zu bewerten. Dies wird durch die Analyse von Fahrdaten realisiert, die in Hamburg aufgezeichnet wurden. 
 
 Die zentralen Fragestellungen betreffen die Energieeffizienz unter realen Fahrbedingungen und den Vergleich mit den Normwerten des Worldwide Harmonized Light Vehicles Test Procedure (WLTP).

+ *Data Mining*: In der Data Mining-Phase werden die Fahrdaten gesammelt und aufbereitet. Für diese 
 Untersuchung wurden Fahrdaten sowohl von einem Elektrofahrzeug (Mokka E) als auch von einem Fahrzeug mit 
 Verbrennungsmotor (Golf 8) in Hamburg erhoben. Die Datenerhebung erfolgte werktags über zwei Tage, wobei 
 jeweils 30 Fahrten pro Fahrzeug aufgezeichnet wurden. Diese Fahrdaten umfassen unter anderem Zeitstempel, 
 geografische Koordinaten, Geschwindigkeit, zurückgelegte Distanz, Höhe, Beschleunigung sowie 
 Kraftstoffverbrauch und CO2-Emissionen.

+ *Data Cleaning*: Die Datenbereinigung ist ein kritischer Schritt, um die Qualität der Daten sicherzustellen. 
 Hierbei werden Fehler und Inkonsistenzen in den Rohdaten beseitigt. 
 
 Dies umfasst:

 - Entfernung von Ausreißern: Identifikation und Entfernung von Datenpunkten, die signifikant von der Norm abweichen.
 - Behandlung fehlender Werte: Interpolation oder Entfernung von Datensätzen mit fehlenden Werten.
 - Korrektur fehlerhafter Daten: Überprüfung und Korrektur von Datenpunkten, die durch Messfehler oder andere Anomalien entstanden sind.

+ *Data Exploration*: Nach der Datenbereinigung folgt die Datenexploration, bei der die Daten visuell und 
 statistisch untersucht werden. Ziel ist es, erste Muster und Zusammenhänge in den Daten zu erkennen. 
 
 Hierbei werden unter anderem Verteilungen, Korrelationen und Zeitreihenanalysen durchgeführt, um ein 
 besseres Verständnis der Daten zu erlangen.

+ *Feature Engineering*: Im Feature Engineering werden neue Merkmale (Features) aus den vorhandenen 
 Daten abgeleitet, die für die Analyse relevant sind. 
 
 Beispiele für solche Features sind:

 -	Durchschnittliche Geschwindigkeit: Berechnung der durchschnittlichen Geschwindigkeit für jede Fahrt.
 -	Beschleunigungsprofile: Analyse der Beschleunigungs- und Verzögerungsmuster.
 -	Energieverbrauch pro Kilometer: Berechnung des Energieverbrauchs pro zurückgelegtem Kilometer.

+ *Predictive Modeling*: In der Phase des Predictive Modeling werden statistische Modelle erstellt, 
 um Vorhersagen und Analysen durchzuführen. Hierbei werden verschiedene Modellierungsansätze wie 
 Regressionsanalyse, Varianzanalysen oder Hypothesentests verwendet, um signifikante Unterschiede und 
 Zusammenhänge in den Daten zu identifizieren.

+ *Data Visualization*: Abschließend werden die Ergebnisse der Analyse visualisiert, um sie anschaulich 
 darzustellen und leichter interpretieren zu können. Dies umfasst die Erstellung von Diagrammen, Grafiken 
 und Karten, die die wesentlichen Erkenntnisse verdeutlichen. Die Visualisierung unterstützt dabei, die 
 Ergebnisse effektiv zu kommunizieren und die Implikationen für die Nutzung von Elektrofahrzeugen im Alltag 
 zu verstehen.


Durch die Anwendung des Data Science Lifecycles auf die Fahrdaten wird eine strukturierte und systematische 
Analyse ermöglicht, die fundierte und aussagekräftige Ergebnisse liefert.


#pagebreak()