# Anpassungen am Export-File

Damit der Export validiert, braucht es die folgenden Anpassungen und Korrekturen

## Anpassungen

Anpassung von Dummy-Datenwerten. Diese sind nach erfolgter Datenmigration nicht mehr notwendig.

* In app.xtf die Referenz auf eine effektiv vorhandene Geometrie setzen
  * Geometrie in geodata_exported.xtf:   
    ...<SO_AFU_ABBAUSTELLEN_20210630.GIS.Geometrie **TID="ae1327d2-c4f9-4c3d-891d-24485f767287"**>...
  * Darum in app.xtf ref auf die UUI der Geometrie setzen:  
  ...<Geometrie **REF="ae1327d2-c4f9-4c3d-891d-24485f767287"**/>...

## Korrekturen

* TRANSFER-Tag: Tag als Uppercase und Namespace-Korrektur (inkl. Abschluss-TAG `</TRANSFER>`) 
  ```xml
  <TRANSFER xmlns="http://www.interlis.ch/INTERLIS2.3">
  <!--
  <Transfer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  -->
  ```
* BID verträgt keine negativen Zahlen --> Auf "app" setzen
  ```xml
  <SO_AFU_ABBAUSTELLEN_20210630.Fachapplikation BID="app"><!--bid von -99 auf app gesetzt-->
  ```
* Jedes Abbaustellen-Objekt braucht als ID (TID=...) eine UUID. Kann auch eine zur Laufzeit generierte UUID sein.
  ```xml
  <SO_AFU_ABBAUSTELLEN_20210630.Fachapplikation.Abbaustelle TID="a6ee1083-7e81-489d-9e12-f03e64fb0414"><!-- TID ergänzt-->
  ```

## Testen mit ilivalidator.jar

* Validator zip herunterladen von https://www.interlis.ch/downloads/ilivalidator
* Sicherstellen, dass Daten und Modell im gleichen Verzeichnis zuhause sind.
* Auf Kommandozeile ausführen. Falls Unix-basiertes System siehe validate.sh
* Ende des Kommandozeilen-Outputs bei Erfolg:  
`Info: ...validation done`

## Schnittstellenaufruf zum Abholen des XTF

https://test-so.softec.ch/abbaustellen/api/gis/export.xml?token=[xxx]