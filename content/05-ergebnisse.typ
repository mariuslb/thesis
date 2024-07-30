#import "../template.typ": Template, code
#let translations = json("../translations.json").at("de")

= Zusammenfassung der Ergebnisse

In diesem Kapitel werden die Ergebnisse der Analyse dargestellt, wie sie in Kapitel 4 dargestellt erhoben wurden.

== Key Performance Indicators (KPIs)

=== EPI

#figure(
  image("../img/epi-api/epi.png", width: 80%),
  caption: [Energy Performance Index zwischen Golf und Mokka.],
) 




Die obige Abbildung zeigt einen Vergleich des Energy Performance Index (EPI) zwischen einem VW Golf (Verbrennungsmotor) und einem Opel Mokka (Elektrofahrzeug). Der EPI ist ein Maß für den Energieverbrauch in Kilowattstunden pro 100 Kilometer pro Tonne Fahrzeuggewicht. 

Die Boxplots verdeutlichen, dass der Opel Mokka einen deutlich niedrigeren mittleren EPI-Wert (Median von etwa 11 kWh/100km*t) aufweist als der VW Golf (Median von etwa 12,5 kWh/100km*t). Der Interquartilsabstand (IQR) des Mokka erstreckt sich von etwa 10 bis 12 kWh/100km*t, während der IQR des Golfs von etwa 11,5 bis 13,5 kWh/100km*t reicht. Der Gesamtbereich der EPI-Werte des Golfs, einschließlich Ausreißern, liegt zwischen etwa 10 und 15 kWh/100km*t, wobei einige Ausreißer oberhalb von 15 kWh/100km*t zu erkennen sind. Im Gegensatz dazu zeigt der Mokka eine geringere Streuung der Werte, die von etwa 9 bis 13 kWh/100km*t reichen, mit einem Ausreißer oberhalb von 14 kWh/100km*t. 

Diese Ergebnisse deuten darauf hin, dass der Opel Mokka im Vergleich zum VW Golf effizienter im Energieverbrauch ist. Dies unterstützt die Hypothese, dass Elektrofahrzeuge unter realen Fahrbedingungen eine höhere Energieeffizienz aufweisen als Fahrzeuge mit Verbrennungsmotoren.



=== API

#figure(
  image("../img/epi-api/api.png", width: 80%),
  caption: [Acceleration Performance Index zwischen Golf und Mokka.],
) 

Die obige Abbildung zeigt einen Vergleich des Acceleration Performance Index (API) zwischen einem VW Golf (Verbrennungsmotor) und einem Opel Mokka (Elektrofahrzeug). Der API misst den Energieverbrauch während der Beschleunigung in Kilowattstunden pro 100 Kilometer pro Tonne Fahrzeuggewicht.


Die Boxplots verdeutlichen, dass der Opel Mokka einen deutlich niedrigeren mittleren API-Wert (Median von etwa 14 kWh/100km*t) aufweist als der VW Golf (Median von etwa 15,5 kWh/100km*t). Der Interquartilsabstand (IQR) des Mokka erstreckt sich von etwa 13 bis 15 kWh/100km*t, während der IQR des Golfs von etwa 14 bis 16 kWh/100km*t reicht. Der Gesamtbereich der API-Werte des Golfs, einschließlich Ausreißern, liegt zwischen etwa 13 und 17,5 kWh/100km*t, wobei einige Ausreißer oberhalb von 17,5 kWh/100km*t zu erkennen sind.

Im Gegensatz dazu zeigt der Mokka eine größere Streuung der Werte, die von etwa 12 bis 18 kWh/100km*t reichen, mit einem Ausreißer unterhalb von 12,5 kWh/100km*t und einem weiteren oberhalb von 18 kWh/100km*t.

Diese Ergebnisse deuten darauf hin, dass der Opel Mokka im Vergleich zum VW Golf effizienter im Energieverbrauch während der Beschleunigung ist. Der Mokka zeigt zudem eine größere Variabilität in den API-Werten, was auf eine unterschiedlichere Fahrweise oder variierende Fahrbedingungen hindeuten könnte. Dies unterstützt die Hypothese, dass Elektrofahrzeuge eine höhere Energieeffizienz aufweisen können, wobei die Variabilität der Ergebnisse weitere Untersuchungen erfordert.

== Statistische Modelle

=== Lineare Regression

Für die Modellierung des Energieverbrauchs wurde eine lineare Regression durchgeführt, um die Beziehung zwischen dem Energieverbrauch (Energy_kWh) und den anderen Variablen zu untersuchen. Dafür wurde beispielsweise ein additiver Effekt untersucht und die Modellformel wie folgt definiert:

#code(
	```R
	Call:
lm(formula = TotalWork.J. ~ Vehicle_Type + Distance_km + RollWork.J. + 
    GradeWork.J. + AccWork.J. + Acceleration.m.s.2., data = combined_data)

Residuals:
   Min     1Q Median     3Q    Max 
-29556  -2729  -1027   1601 113325 

Coefficients:
                      Estimate Std. Error t value Pr(>|t|)    
(Intercept)          3.620e+03  2.667e+01 135.738   <2e-16 ***
Vehicle_TypeMokka e -6.421e+02  2.762e+01 -23.250   <2e-16 ***
Distance_km          1.654e+05  3.558e+03  46.496   <2e-16 ***
RollWork.J.          3.761e-01  2.251e-02  16.707   <2e-16 ***
GradeWork.J.         5.567e-01  1.934e-03 287.822   <2e-16 ***
AccWork.J.           5.388e-01  3.235e-03 166.554   <2e-16 ***
Acceleration.m.s.2.  2.089e+01  3.544e+01   0.589    0.556    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4029 on 93382 degrees of freedom
Multiple R-squared:  0.7373,	Adjusted R-squared:  0.7373 
F-statistic: 4.368e+04 on 6 and 93382 DF,  p-value: < 2.2e-16


	```,
	caption: [Code für Lineare Regression zur Modellierung des Energieverbrauchs.],
	supplement: translations.codeausschnitt,
) <glacier> 

Dadurch konnte ein R-Squared-Wert von 0,7373 erzielt werden, was darauf hindeutet, dass das Modell etwa 73,73 % der Varianz im Energieverbrauch erklären kann. Die Ergebnisse der linearen Regression zeigen, dass die Variable "Vehicle_Type" (Mokka E) einen signifikanten Einfluss auf den Energieverbrauch hat, wobei der Mokka E im Vergleich zum Golf einen niedrigeren Energieverbrauch aufweist. Die Variablen "Distance_km", "RollWork.J.", "GradeWork.J." und "AccWork.J." haben ebenfalls einen signifikanten Einfluss auf den Energieverbrauch, während die Variable "Acceleration.m.s.2." keinen signifikanten Einfluss hat.

=== ANOVA

Die ANOVA-Analyse wurde durchgeführt, um den Unterschied im Energieverbrauch zwischen dem VW Golf und dem Opel Mokka E zu untersuchen. Dabei wurde die Variable "Vehicle_Type" als unabhängige Variable und der Energieverbrauch (TotalWork.J.) als abhängige Variable verwendet. 

#code(
	```R
> anova_result <- aov(TotalWork.J. ~ Vehicle_Type, data = combined_data)
> summary(anova_result)
                Df    Sum Sq   Mean Sq F value Pr(>F)    
Vehicle_Type     1 5.925e+09 5.925e+09   96.01 <2e-16 ***
Residuals    93387 5.763e+12 6.171e+07                   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> tukey_result <- TukeyHSD(anova_result)
> print(tukey_result)
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = TotalWork.J. ~ Vehicle_Type, data = combined_data)

$Vehicle_Type
                  diff       lwr       upr p adj
Mokka e-Golf -527.2025 -632.6571 -421.7479     0
	```,
	caption: [Code für ANOVA zur Untersuchung des Energieverbrauchs zwischen Golf und Mokka.],
	supplement: translations.codeausschnitt,
) <glacier>

Die ANOVA-Analyse zeigt, dass der Unterschied im Energieverbrauch zwischen dem VW Golf und dem Opel Mokka E signifikant ist (F-Wert: 96,01, p-Wert: < 2e-16). Der Tukey-Test bestätigt, dass der Mokka E im Vergleich zum Golf einen signifikant niedrigeren Energieverbrauch aufweist (Differenz: -527,20 J, p-Wert: 0).

Diese Ergebnisse bestätigen die Hypothese, dass Elektrofahrzeuge unter realen Fahrbedingungen einen niedrigeren Energieverbrauch aufweisen als Fahrzeuge mit Verbrennungsmotoren.

=== Random Forests

Das Random Forest-Modell wurde verwendet, um die wichtigsten Einflussfaktoren auf den Energieverbrauch zu identifizieren und die Unterschiede zwischen dem VW Golf und dem Opel Mokka E zu quantifizieren.

Der RMSE (Root Mean Square Error) betrug 419.302 J, was eine hohe Genauigkeit des Modells bei der Vorhersage des Energieverbrauchs anzeigt.
Der MAE (Mean Absolute Error) lag bei 58.253 J, was die durchschnittliche Abweichung der Vorhersagen vom tatsächlichen Wert darstellt.
Das Bestimmtheitsmaß R² erreichte einen Wert von 0.997, was auf eine fast perfekte Anpassung des Modells an die Daten hinweist.
Der prozentuale RMSE betrug 8.42%, und der MAE in Prozent lag bei 0.027%, was zeigt, dass das Modell den Energieverbrauch mit einer hohen Genauigkeit vorhersagen kann.

Dazu wurde mit dem Testdatensatz eine Vorhersage des Energieverbrauchs je Fahrzeugtyp durchgeführt, um die Unterschiede zwischen dem VW Golf und dem Opel Mokka E zu quantifizieren. Die Ergebnisse zeigen, dass der Mokka E im Durchschnitt einen um 5,89 % niedrigeren Energieverbrauch aufweist als der Golf, was die Ergebnisse der vorherigen Analysen bestätigt.

#figure(
	image("../img/rf/average_consumption.png", width: 80%),
	caption: [Durchschnittlicher Energieverbrauch zwischen Golf und Mokka.],
)

=== Gradient Boosting Machines (GBM)

#code(
	```R
	gbm_model <- gbm(TotalWork.J. ~ ., data = train_set, distribution = "gaussian", n.trees = 100, interaction.depth = 5, shrinkage = 0.01, cv.folds = 5)

# Evaluate the model
best_iter <- gbm.perf(gbm_model, method = "cv")
predictions <- predict(gbm_model, test_set, n.trees = best_iter)
actuals <- test_set$TotalWork.J.
> print(paste("RMSE:", rmse))
[1] "RMSE: 4242.59124039615"
> print(paste("MAE:", mae))
[1] "MAE: 2898.41111856062"
> print(paste("R-squared:", r2))
[1] "R-squared: 0.88712358658838"
```,

	caption: [Code für Gradient Boosting Machine zur Modellierung des Energieverbrauchs.],
	supplement: translations.codeausschnitt,
) <glacier>

Das Gradient Boosting Machine-Modell erreichte einen RMSE von 4242,59 J, einen MAE von 2898,41 J und ein R² von 0,8871. Diese Ergebnisse zeigen, dass das Modell den Energieverbrauch mit einer hohen Genauigkeit vorhersagen kann und die Unterschiede zwischen dem VW Golf und dem Opel Mokka E quantifiziert.

#figure(
	image("../img/gbm/average_consumption.png", width: 80%),
	caption: [Vorhersagen des Energieverbrauchs zwischen Golf und Mokka.],
)

Die obige Abbildung zeigt die Vorhersagen des Energieverbrauchs für den VW Golf und den Opel Mokka E durch das Gradient Boosting Machine-Modell. Die Ergebnisse zeigen, dass der Mokka E im Durchschnitt einen um 5,12 % niedrigeren Energieverbrauch aufweist als der Golf, was ebenfalls die Ergebnisse der vorherigen Analysen bestätigt.

=== XGBoost

#code(
	```R
	xgb_model <- xgboost(params = params, data = dtrain, nrounds = 100)

	> print(xgb_model)
##### xgb.Booster
raw: 330.8 Kb 
call:
  xgb.train(params = params, data = dtrain, nrounds = nrounds, 
    watchlist = watchlist, verbose = verbose, print_every_n = print_every_n, 
    early_stopping_rounds = early_stopping_rounds, maximize = maximize, 
    save_period = save_period, save_name = save_name, xgb_model = xgb_model, 
    callbacks = callbacks)
params (as set within xgb.train):
  objective = "reg:squarederror", eval_metric = "rmse", max_depth = "6", eta = "0.3", gamma = "0.1", validate_parameters = "TRUE"
xgb.attributes:
  niter
callbacks:
  cb.print.evaluation(period = print_every_n)
  cb.evaluation.log()
# of features: 22 
niter: 100
nfeatures : 22 
evaluation_log:
     iter train_rmse
    <num>      <num>
        1 6529.99070
        2 4610.53192
---                 
       99   32.56959
      100   32.45040
> y_pred <- predict(xgb_model, dtest)
> rmse <- sqrt(mean((test_data_norm$TotalWork.J. - y_pred)^2))
> print(paste("RMSE:", rmse))
[1] "RMSE: 1555.22528742603"
> r2 <- cor(test_data_norm$TotalWork.J., y_pred)^2
> print(paste("R-squared (R2):", round(r2, 4)))
[1] "R-squared (R2): 0.9972"
```,

	caption: [Code für XGBoost zur Modellierung des Energieverbrauchs.],
	supplement: translations.codeausschnitt,
) <glacier>


Das XGBoost-Modell erreichte einen RMSE von 1555,23 J und ein R² von 0,9972. Diese Ergebnisse zeigen, dass das Modell den Energieverbrauch mit einer sehr hohen Genauigkeit vorhersagen kann und die Unterschiede zwischen dem VW Golf und dem Opel Mokka E quantifiziert.

#figure(
	image("../img/xgboost/average_consumption.png", width: 80%),
	caption: [Vorhersagen des Energieverbrauchs zwischen Golf und Mokka.],
)

Die obige Abbildung zeigt die Vorhersagen des Energieverbrauchs für den VW Golf und den Opel Mokka E durch das XGBoost-Modell. Die Ergebnisse zeigen, dass der Mokka E im Durchschnitt einen um 10,57 % niedrigeren Energieverbrauch aufweist als der Golf, was ebenfalls die Ergebnisse der vorherigen Analysen bestätigt.

== WLTP-Normwerte und Vergleich

== VW Golf

#grid(
  columns: 2,
  gutter: 5pt,
 figure(
  image("../img/wltp/golf_wltp.png"),
  caption: [Verteilung Golf],
),
figure(
  image("../img/wltp/golf_wltp_verteilung.png"),
  caption: [Verteilung Mokka],
)
)

Die obigen Abbildungen zeigen den Vergleich der WLTP-Normwerte für jede Kategorie mit dem tatsächlichen Energieverbrauch des VW Golf. 

Hierbei zeigt sich das die Datenpunkte nur in den WLTP-Kategorien Stadt und Überland liegen, während keine Datenpunkte darüber hinaus vorhanden sind, was daran liegt, dass die Testfahrten im städtischen Gebiet durchgeführt wurden.

Die Verteilung der Verbrauchswerte des VW Golf zeigt, dass der tatsächliche Energieverbrauch in den beiden Kategorien über den WLTP-Normwerten liegt. Bei "Low Speed" liegt der tatsächliche Verbrauch ca. 2 % über dem Normwert, während er bei "Medium Speed" sogar über 141 % über dem Normwert liegt.

Eine solche hohe Abweichung im "Medium Speed"-Bereich kann darauf zurückzuführen sein, dass nur sehr wenige Datenpunkte in dieser Kategorie vorhanden sind, was zu einer Verzerrung der Ergebnisse führen kann. Die Grenze zwischen den Kategorien "Low Speed" und "Medium Speed" ist bei 56,5 km/h definiert, wodurch die Datenpunkte in "Medium Speed" möglicherweise schnelle Beschleunigungsmanöver enthalten, die dadurch den  Energieverbrauch signifikant erhöhen.

=== Opel Mokka E

#grid(
	columns: 2,
	gutter: 5pt,
 figure(
	image("../img/wltp/mokka_wltp.png"),
	caption: [Verteilung Mokka],
),
figure(
	image("../img/wltp/mokka_wltp_verteilung.png"),
	caption: [Verteilung Mokka],
)
)

Die obigen Abbildungen zeigen den Vergleich der WLTP-Normwerte für jede Kategorie mit dem tatsächlichen Energieverbrauch des Opel Mokka E.

Hierbei zeigt sich, dass die Datenpunkte ebenfalls nur in den WLTP-Kategorien Stadt und Überland liegen.

Die Verteilung der Verbrauchswerte des Opel Mokka E zeigt, dass der tatsächliche Energieverbrauch in den beiden Kategorien deutlich über den WLTP-Normwerten liegt. Bei "Low Speed" liegt der tatsächliche Verbrauch knapp bei 1,9 % über dem Normwert, während er bei "Medium Speed" sogar über 31,4 % über dem Normwert liegt.

Hier zeigt sich eine ähnliche Tendenz wie beim VW Golf, wobei der tatsächliche Verbrauch in der Kategorie "Medium Speed" auch wieder deutlich über den Normwerten liegt. Dies liegt auch wieder daran dass wieder nur ein minimaler Bruchteil der Gesamtdatenpunkte in dieser Kategorie liegt und darauf hindeutet, dass die Testfahrten in dieser Kategorie zu schnellen Beschleunigungsmanövern geführt haben, die den Energieverbrauch erhöht haben (siehe Abb 7). 