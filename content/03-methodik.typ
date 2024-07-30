= Methodik

== Datenerhebung

In diesem Kapitel wird erläutert wie Fahrdaten erhoben werden, die in einem 
darauffolgenden Schritt aggregiert und analysiert werden, um die Aussagen der Hypothesen H1 und H2 anhanddessen zu bewerten. 

=== Zeitliche und räumliche Abgrenzung

Im Zeitraum von 4. - 6. März 2024 wurden in Hamburg
Fahrten mit einem Elektrofahrzeug und einem Verbrennerfahrzeug 
aufgezeichnet. Dafür wurde eine vordefinierte Route mit gleichem Start- und Endpunkt gewählt, welche bei parallelem Start von beiden Autos mehrfach pro Tag abgefahren und damit aufgezeichnet wurde.

#figure(
  image("../img/map.png", width: 80%),
  caption: [Route der Vergleichsfahrten in Hamburg],
) 

=== Testfahrzeuge

Für die Vergleichsfahrten sind zwei Kompaktklassenfahrzeuge ausgewählt worden, jeweils ein Elektrofahrzeug und ein Verbrennerfahrzeug. Da dies bei einem Mietwagenanbieter erfolgte, war bis vor Mietbeginn nicht genau festgelegt, welches Fahrzeugmodell zur Verfügung stehen würde. Bei den schlussendlich zur Verfügung stehenden Fahrzeugen handelt es sich um einen Opel Mokka E und einen VW Golf 8.

Die für die Aggregation mithilfe der ISO 23795-1:2022 bzw. des LCMM-Systems nötigen technischen Datenfelder der jeweiligen Fahrzeuge sind in der folgenden Tabelle aufgeführt:


#figure(
  caption: figure.caption(
    position: top,
    [Übersicht über Fahrzeuge]
  ),
table(
  columns: (40%, 30%, 30%),
  inset: 10pt,
  table.header( 
    [], [*Opel Mokka E*], [*VW Golf 8*]
    ),
    [*Treibstoff*],                 [Elektrisch],   [Diesel],
    [*Masse*],        [1543 kg],      [1384 kg],
    [*Luftwiderstandskoeffizient*], [0,32],         [0,27],
    [*Querschnittsfläche*],         [2,27 m^2],         [2,2 m^2],
    [*Effizienz*],                  [74 %],          [28 %],
    [*Treibstoff-Emissions-Faktor*],[-],            [2,37 kg/l],
    [*Rollwiderstandskoeffizient*], [0,007],        [0,007],
    [*Stillstandsverbrauch*],       [-],            [0,6 l/h],
)
)
*Hinweis:* Der Effizienzparameter gibt den Wirkungsgrad des Antriebsstrangs an, und ist für eine genaue Abschätzung des Energieverbrauchs erforderlich. Die beiden genannten Werte entsprechen den Standardwerten für Elektro- und Verbrennerfahrzeuge im LCMM-System.


=== Datenaufzeichnung

Die Datenerhebung der Fahrten für diese Untersuchung wurde mithilfe einer speziell für @lcmm entwickelten mobilen App durchgeführt, die in der Lage ist, detaillierte Fahrdaten im Sekundentakt aufzuzeichnen. Diese App wurde auf Smartphones installiert, welche sowohl im Golf 8 als auch im Mokka E während den Vergleichsfahrten ausgeführt wurde. 

Die dadurch erfassten Daten umfassen eine Vielzahl von Parametern, die für die Analyse der Energieeffizienz und des Fahrverhaltens von entscheidender Bedeutung sind. Im Folgenden werden die wichtigsten aufgezeichneten Parameter detailliert beschrieben:

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

=== Testbedingungen

Um die Vergleichbarkeit der Fahrdaten sicherzustellen und Verzerrungen durch unterschiedliche Testbedingungen zu vermeiden, wurden folgende Testbedingungen festgelegt:

#table(
  columns: (23%, auto),
  inset: 10pt,
  table.header(
    [*Kriterium*], [*Beschreibung*]
  ),
    [*Gleiche Routen*], 
    [Beide Fahrzeuge starteten und endeten an denselben Orten in Hamburg und folgten einer vordefinierten Route. Dies gewährleistet, dass die Fahrzeuge unter identischen geografischen und verkehrstechnischen Bedingungen getestet wurden.],
  
    [*Zeitfenster*], 
    [Die Fahrten wurden an drei aufeinanderfolgenden Werktagen, dem 4. und 6. März 2024, durchgeführt. Die Testfahrten fanden von morgens bis abends statt, um die Auswirkungen unterschiedlicher Tageszeiten und Verkehrsdichten zu berücksichtigen und zu minimieren.],
  
    [*Wetterbedingungen*], 
    [Durch die Auswahl von drei aufeinanderfolgenden Tagen wurde sichergestellt, dass die Witterungsverhältnisse vergleichbar waren, um externe Einflüsse auf den Fahrwiderstand und den Energieverbrauch zu minimieren.],
  
    [*Fahrerverhalten*], 
    [Die Fahrer hielten sich an eine vorab festgelegte Fahrweise, die gleichmäßige Beschleunigungs- und Bremsmanöver sowie konstante Geschwindigkeiten auf bestimmten Streckenabschnitten vorsah.]
)

Insgesamt wurden während des Testzeitraums 30 Fahrten pro Fahrzeugtyp durchgeführt. Solche wiederholten Messungen können es ermöglichen, zufällige Schwankungen und Anomalien zu identifizieren und auszuschließen, wodurch die Datenbasis für die nachfolgende Analyse robuster und aussagekräftiger wird. (Quelle)

== Datenanalyse

Die Datenanalyse umfasst mehrere Schritte, um die Hypothesen H1 und H2 zu überprüfen und die Unterschiede zwischen Elektro- und Verbrennerfahrzeugen zu quantifizieren sowie die Abweichungen zwischen den WLTP-Normwerten und den realen Energieverbräuchen zu analysieren. Dies umfasst:

=== Analyse von Key Performance Indicators

Die Analyse der Key Performance Indicators (KPIs) ist ein wesentlicher Bestandteil der Untersuchung, um den Energieverbrauch und die Leistungsfähigkeit der Fahrzeuge zu bewerten. Dazu wurden die KPIs Energy Performance Index (EPI) und Acceleration Performance Index (API) berechnet und analysiert, um die Hypothese H1 zu überprüfen. Diese wurden ausgewählt, da sie den Gesamtenergie- und Beschleunigungsverbrauch vergleichbar machen, indem der Verbrauch in kWh pro 100 km pro Tonne gemessen wird @ISO.

=== Statistische Modellierung

Um die erhöhte Effizienz der Elektrofahrzeuge zu den Verbrennerfahrzeugen in diesem Testfall zu überprüfen, werden verschiedene Methoden und Modelle der Statistik bzw. im Bereich des Machinie Learning angewendet, um die Fahrdaten zu analysieren und die Hypothesen zu testen.

- *Regressionsanalyse:*
  Lineare und multiple Regression zur Untersuchung der Zusammenhänge zwischen Fahrzeugtyp und Energieverbrauch sowie Beschleunigungsperformance.
- *ANOVA (Analysis of Variance):*
	Zur Untersuchung der Unterschiede zwischen den beiden Fahrzeugtypen hinsichtlich des Energieverbrauchs. Dieses statistische Verfahren ermöglicht es, signifikante Unterschiede zu identifizieren und die Hypothesen zu überprüfen.
- *Random Forests:*
	Ein weiterer Ensemble-Ansatz, der zur Verbesserung der Vorhersagegenauigkeit und zur Reduzierung von Overfitting eingesetzt wird. Dieses Modell ermöglicht es, die wichtigsten Einflussfaktoren auf den Energieverbrauch zu identifizieren und die Unterschiede zwischen den Fahrzeugtypen zu quantifizieren.
- *Gradient Boosting Machines (GBM):*
	Ein Ensemble-Lernverfahren zur Vorhersage des Energieverbrauchs basierend auf den erhobenen Daten. Dadurch können komplexe Zusammenhänge und nichtlineare Effekte berücksichtigt werden und Rückschlüsse auf die Unterschiede zwischen Elektro- und Verbrennerfahrzeugen gezogen werden.
- *XGBoost:*
  Ein hochperformantes Gradient Boosting Framework, das für die Modellierung komplexer Zusammenhänge in den Daten verwendet wird. 

Durch die detaillierte Anwendung dieser vielen Methoden und Modelle wird eine fundierte und umfassende Analyse der Fahrdaten ermöglicht, die präzise Aussagen über die Energieeffizienz von Elektro- und Verbrennungsfahrzeugen unter realen Bedingungen liefert.

=== Vergleich mit WLTP-Normwerten

Um die Genauigkeit und Praxisnähe der WLTP-Normwerte zu bewerten, werden die realen Energieverbräuche der Fahrzeuge mit den standardisierten WLTP-Werten verglichen. 

Dies umfasst einerseits die Einteilung der Fahrdaten in die verschiedenen WLTP-Kategorien wie Stadt, Überland und Autobahn, um die Verbräuche pro Kategorie zu berechnen und zu vergleichen. Andererseits erfolgt die Analyse der prozentualen Abweichungen zwischen den realen und normierten Verbrauchswerten sowie die Darstellung der Muster und Verteilungen der Verbrauchswerte in den verschiedenen Kategorien. Durch diesen Vergleich wird es möglich, die Unterschiede zwischen den realen und normierten Verbrauchswerten zu identifizieren und die Hypothese H2 zu überprüfen.

#pagebreak()