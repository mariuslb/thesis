= Datenanalyse 
(Aggregation, Vorverarbeitung, KPI-Analyse, statistische Methoden, WLTP-Vergleich)

Die Datenanalyse bildet den Kern dieser Untersuchung, deren Ziel es ist, die Effizienz und Nachhaltigkeit von Elektrofahrzeugen im Vergleich zu Verbrennungsmotoren unter realen Fahrbedingungen zu bewerten. Aufbauend auf den in den vorangegangenen Kapiteln beschriebenen detaillierten Datenerhebungen und standardisierten Testbedingungen, konzentriert sich dieser Abschnitt auf die systematische Verarbeitung und Analyse der gesammelten Daten. Der Prozess umfasst die Aggregation und Vorverarbeitung der Fahrdaten, die Definition und Analyse von Key Performance Indicators (KPIs), die Anwendung geeigneter statistischer Methoden zur Identifikation signifikanter Unterschiede sowie den Vergleich der realen Verbrauchswerte mit den Normwerten des Worldwide Harmonized Light Vehicles Test Procedure (WLTP).

== Datenaggregation und -vorverarbeitung

== Analyse von Key Performance Indicators

Die Analyse der Key Performance Indicators (KPIs) ist ein entscheidender Bestandteil dieser Arbeit, um die Energieeffizienz und das Beschleunigungsverhalten von Elektrofahrzeugen (EVs) und Verbrennungsmotorfahrzeugen (ICEs) zu bewerten. In diesem Kapitel werden die Ergebnisse der Berechnungen des Energy Performance Index (EPI) und des Acceleration Performance Index (API) präsentiert und diskutiert. Diese Indizes wurden anhand von realen Fahrdaten ermittelt, die mit speziellen mobilen Datenaufzeichnungssystemen gesammelt wurden.

=== Berechnung des Energy Performance Index (EPI):

-	Der EPI wurde berechnet, indem die gesamte verbrauchte Energie (in kWh) durch die gesamte zurückgelegte Strecke (in 100 km) und das Gewicht des Fahrzeugs (in Tonnen) geteilt wurde.
 
 $ "EPI" = "Gesamtenergie (kWh)" / (("Gesamtstrecke (km)" / 100) * "Fahrzeuggewicht (t)") $

- Berechnung des Acceleration Performance Index (API):
 Der API wurde berechnet, indem die gesamte Energie für Beschleunigungsmanöver (in kWh) durch die gesamte zurückgelegte Strecke (in 100 km) und das Gewicht des Fahrzeugs (in Tonnen) geteilt wurde.

 $ "API" = "Beschleunigungsenergie gesamt (kWh)" / (("Gesamtstrecke (km)" / 100) * "Fahrzeuggewicht (t)") $

=== R Skript

EPI-Berechnung:

```R
{
  calculateEPI <- function(data, weight_t) {
  whole_distance_m <- sum(data$Distance, na.rm = TRUE)
  whole_distance_km <- whole_distance_m / 1000

  whole_energy_J <- sum(data$TotalWork.J., na.rm = TRUE)
  whole_energy_kWh <- whole_energy_J / 3600000

  # Energy per 100 km
  energy_100km <- whole_energy_kWh / (whole_distance_km / 100)

  # Calculate EPI
  epi <- energy_100km / weight_t
  return(epi)
}
}
```

API-Berechnung:

```R
calculateAPI <- function (data, weight_t) {
  whole_distance_m <- sum(data$Distance, na.rm = TRUE)
  whole_distance_km <- whole_distance_m / 1000

  # Set NA fields to 0
  data$AccWork.J.[is.na(data$AccWork.J.)] <- 0

  # Set negative values to positive
  data$AccWork.J.[data$AccWork.J. < 0] <- -data$AccWork.J.[data$AccWork.J. < 0]

  whole_energy_acc_J <- sum(data$AccWork.J., na.rm = TRUE)
  whole_energy_acc_kWh <- whole_energy_acc_J / 3600000

  # Accelaration energy per 100 km
  energy_acc_100km <- whole_energy_acc_kWh / (whole_distance_km / 100)
  # Calculate API
  api <- energy_acc_100km / golf_weight_t
  return(api)
}
```
=== Darstellung der Ergebnisse

==== EPI

#figure(
  image("../img/epi.png", width: 80%),
  caption: [Energy Performance Index zwischen Golf und Mokka.],
) 

Der Boxplot für den Energy Performance Index (EPI) zeigt die Verteilung des Energieverbrauchs pro 100 km und Tonne Fahrzeuggewicht für den Opel Mokka E und den VW Golf 8.

- Opel Mokka E: Der Medianwert des EPI liegt bei etwa 12 kWh/100km*t. Die Verteilung zeigt eine relativ geringe Varianz, was auf eine konsistente Energieeffizienz hinweist. Es gibt einige Ausreißer, die auf variierende Fahrbedingungen oder unterschiedliche Fahrstile hinweisen könnten.

- VW Golf 8: Der Medianwert des EPI liegt bei etwa 13 kWh/100km*t, was höher ist als beim Opel Mokka E. Die Verteilung zeigt eine größere Varianz und mehrere Ausreißer, was auf eine weniger konsistente Energieeffizienz hinweist.

==== API

#figure(
  image("../img/api.png", width: 80%),
  caption: [Acceleration Performance Index zwischen Golf und Mokka.],
) 

Der Boxplot für den Acceleration Performance Index (API) zeigt die Verteilung der Beschleunigungsenergie pro 100 km und Tonne Fahrzeuggewicht für den Opel Mokka E und den VW Golf 8.

- Opel Mokka E: Der Medianwert des API liegt bei etwa 14 kWh/100km*t. Die Verteilung zeigt eine moderate Varianz und einige Ausreißer, was auf unterschiedliche Beschleunigungsgewohnheiten oder variierende Verkehrsbedingungen hinweisen könnte.

- VW Golf 8: Der Medianwert des API liegt bei etwa 15 kWh/100km*t, was ebenfalls höher ist als beim Opel Mokka E. Die Varianz ist ähnlich der des Mokka, aber es gibt mehr Ausreißer, was auf eine größere Inkonsistenz bei den Beschleunigungsmanövern hinweist.

==== Diskussion der Ergebnisse

Die Analyse der Boxplots zeigt, dass der Opel Mokka E sowohl im Energy Performance Index (EPI) als auch im Acceleration Performance Index (API) bessere Werte als der VW Golf 8 aufweist. Dies deutet darauf hin, dass Elektrofahrzeuge in Bezug auf Energieeffizienz und Beschleunigungsverhalten unter den getesteten Bedingungen Vorteile haben.

Energy Performance Index (EPI):

- Der niedrigere Medianwert und die geringere Varianz des EPI beim Opel Mokka E zeigen, dass Elektrofahrzeuge effizienter im Energieverbrauch sind und konsistentere Leistungen erbringen.

- Die höheren EPI-Werte und die größere Varianz beim VW Golf 8 könnten durch die weniger effiziente Verbrennungstechnologie und die höheren Betriebskosten verursacht werden.

Acceleration Performance Index (API):

- Der niedrigere Medianwert des API beim Opel Mokka E zeigt, dass Elektrofahrzeuge weniger Energie für Beschleunigungen verbrauchen, was auf die effiziente Nutzung der elektrischen Energie für Antriebsvorgänge zurückzuführen ist.

- Die höheren API-Werte und die größere Anzahl an Ausreißern beim VW Golf 8 deuten auf eine ineffizientere Nutzung der Energie bei Beschleunigungen hin, was durch die Eigenschaften des Verbrennungsmotors erklärt werden kann.

==== Schlussfolgerungen

Die Ergebnisse der KPI-Analyse unterstützen die Hypothese, dass Elektrofahrzeuge unter realen Fahrbedingungen eine höhere Energieeffizienz und ein besseres Beschleunigungsverhalten aufweisen als Fahrzeuge mit Verbrennungsmotoren. Diese Erkenntnisse sind entscheidend für die Weiterentwicklung und Förderung von Elektrofahrzeugen als nachhaltige Mobilitätslösung.

Für zukünftige Untersuchungen wäre es sinnvoll, die Analyse auf eine größere Anzahl von Fahrzeugen und Fahrbedingungen auszuweiten, um die Generalisierbarkeit der Ergebnisse zu erhöhen. Zudem könnten weitere KPIs, wie beispielsweise der CO2-Ausstoß und die Betriebskosten, in die Analyse einbezogen werden, um ein umfassenderes Bild der Vorteile von Elektrofahrzeugen zu erhalten.

== Regressionsanalyse

In diesem Kapitel wird eine detaillierte Analyse des Energieverbrauchs von Elektrofahrzeugen (EVs) und Verbrennungsmotorfahrzeugen (ICEs) durchgeführt. Dabei wird der Einfluss verschiedener Faktoren auf den Energieverbrauch untersucht, um ein besseres Verständnis der Effizienzunterschiede zwischen den beiden Fahrzeugtypen zu gewinnen. Es werden sowohl deskriptive Statistiken als auch eine Regressionsanalyse präsentiert.

=== Deskriptive Statistiken

Zunächst werden die deskriptiven Statistiken für den Energieverbrauch, die Durchschnittsgeschwindigkeit und die zurückgelegte Distanz für die beiden Fahrzeugtypen dargestellt. Die folgende Tabelle zeigt die mittleren Werte für diese Variablen:

#figure(
  ```R
    Vehicle_Type Energy_kWh_mean Speed_kmh_mean Distance_km_mean
    <fct>                  <dbl>          <dbl>            <dbl>
  1 Golf                 0.00154           28.3          0.00850
  2 Mokka e              0.00152           31.1          0.00929
```,
 caption: [Deskriptive Statistiken]
)

=== Visualisierung des Energieverbrauchs

Die folgende Abbildung zeigt einen Boxplot des Energieverbrauchs für die beiden Fahrzeugtypen. Hierbei wird die Verteilung des Energieverbrauchs für den VW Golf 8 und den Opel Mokka E verglichen.

#figure(
  image("../img/comparison-energy.png", width: 80%),
  caption: [Vergleich des Energieverbrauchs beider Fahrzeugtypen],
) 

*Analyse:*

- Der mittlere Energieverbrauch ist bei beiden Fahrzeugtypen ähnlich, wobei der Opel Mokka E einen etwas niedrigeren Energieverbrauch aufweist.
- Die Verteilung der Energieverbrauchswerte zeigt, dass es beim VW Golf 8 mehr Ausreißer gibt, was auf eine größere Variabilität im Energieverbrauch hinweist.

=== Regressionsanalyse

Um die Einflussfaktoren auf den Energieverbrauch genauer zu untersuchen, wurde eine lineare Regressionsanalyse durchgeführt. Die abhängige Variable ist der Energieverbrauch (kWh), während die unabhängigen Variablen der Fahrzeugtyp, die Geschwindigkeit, die Beschleunigung und die zurückgelegte Distanz sind.

#figure(
  ```R
  energy_model <- lm(Energy_kWh ~ Vehicle_Type + Speed_kmh 
  + Acceleration.m.s.2. + Distance_km, data = combined_data)
  ```,
  caption: [ModellFormel]
)

#figure(
  ```
  Call:
lm(formula = Energy_kWh ~ Vehicle_Type + Speed_kmh + Acceleration.m.s.2. + 
    Distance_km, data = combined_data)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.029941 -0.000958 -0.000316  0.000650  0.047272 

Coefficients:
                      Estimate Std. Error t value Pr(>|t|)    
(Intercept)          5.692e-04  1.248e-05   45.61   <2e-16 ***
Vehicle_TypeMokka e -1.153e-04  1.142e-05  -10.10   <2e-16 ***
Speed_kmh            7.170e-06  3.416e-07   20.99   <2e-16 ***
Acceleration.m.s.2.  1.504e-03  6.411e-06  234.62   <2e-16 ***
Distance_km          8.979e-02  7.655e-04  117.29   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.001688 on 99038 degrees of freedom
Multiple R-squared:  0.4563,	Adjusted R-squared:  0.4563 
F-statistic: 2.078e+04 on 4 and 99038 DF,  p-value: < 2.2e-16
```,
  caption: [Modellformel und Ausgabe]
)

- Der Intercept-Wert ist (5.692 \times 10^{-4}), was der Grundverbrauch ohne Einfluss der erklärenden Variablen darstellt.
- Der Koeffizient für den Fahrzeugtyp (Mokka e) ist negativ und signifikant ((p < 2e-16)), was bedeutet, dass der Mokka e im Durchschnitt einen geringeren Energieverbrauch hat als der Golf.
- Die Geschwindigkeit ((Speed_kmh)) und Beschleunigung (Acceleration.m.s.2.) haben positive und signifikante Effekte auf den Energieverbrauch, was darauf hinweist, dass höhere Geschwindigkeiten und häufigere Beschleunigungen zu einem höheren Energieverbrauch führen.
- Die zurückgelegte Distanz (Distance\_km) hat ebenfalls einen positiven und signifikanten Einfluss auf den Energieverbrauch.

#figure(
  image("../img/model-plot.png", width: 80%),
  caption: [Diagnoseplots des Regressionsmodells],
) 

- Residuals vs Fitted: Die Verteilung zeigt keine großen systematischen Abweichungen, jedoch eine gewisse nicht-lineare Beziehung, die auf nicht erfasste Variablen hinweisen könnte.
- Q-Q Plot: Die Residuen folgen nicht perfekt der Normalverteilung, insbesondere in den Extremen, was auf mögliche Ausreißer hinweist.
- Scale-Location: Die Verteilung der Residuen zeigt eine leichte Heteroskedastizität, was bedeutet, dass die Varianz der Fehler nicht konstant ist.
- Residuals vs Leverage: Einige Datenpunkte haben hohe Hebelwirkungen und sind potenzielle Einflusswerte, die das Modell stark beeinflussen können.

=== Schlussfolgerungen

Die Regressionsanalyse bestätigt, dass der Fahrzeugtyp, die Geschwindigkeit, die Beschleunigung und die zurückgelegte Distanz signifikante Einflussfaktoren auf den Energieverbrauch sind. Der Opel Mokka E zeigt im Durchschnitt einen geringeren Energieverbrauch als der VW Golf 8, was die Hypothese unterstützt, dass Elektrofahrzeuge effizienter im Energieverbrauch sind.

Für zukünftige Analysen wäre es hilfreich, weitere erklärende Variablen zu berücksichtigen und möglicherweise nicht-lineare Modelle oder Interaktionseffekte zu untersuchen, um ein noch präziseres Modell des Energieverbrauchs zu entwickeln.

== Statistische Methoden

== Vergleich mit WLTP-Werten

== Verwendete Software und Tools

= Ergebnisse

== Darstellung der analysierten Fahrzeugdaten

== Analyse der Energieeffizienz beider Fahrzeugtypen

== Vergleich der Realwerte mit WLTP und Diskussion von Abweichungen

== "Diskussion" zu CO2-Emissionen