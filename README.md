# p-abbaustellen

## Überblick der Systemintegration

![Integrationsdiagramm](integration.png)

## Schritte des GRETL-Imports

1. XTF mittels API von Fachapp beziehen
1. XTF gegen Modell prüfen
    * Geodaten auch exportieren
    * Beide XTF gegen Modell prüfen
1. Falls Prüfung OK: Fachapp-XTF mittels ili2pg importieren

## Verknüpfen der Sach- und Geometriedaten 

Beim Import der Sachdaten in die Geodatenbank soll sichergestellt werden, dass es weder Geometrien ohne Sachdaten-Objekt, noch Sachdaten-Objekte ohne Geometrien gibt.

Idealerweise nutzt der Import dabei die in den INTERLIS-Tools dafür bereits vorhandenen Mechanismen. Ein Weg mittels IliValidator ist in <http://blog.sogeo.services/blog/2020/09/23/interlis-leicht-gemacht-number-21.html> beschrieben.

Fragen Claude:

* Bemerkungen / Ergänzungen zum beschriebenen Weg
* Muss zusätzlich der IliValidator eingesetzt werden, oder reicht der Einsatz von ili2pg?
* Was gilt es zu beachten?
    * Baskets
    * Topics
    * Foreign Keys
    * Wie die Sachdaten-Objekte bei jedem Import komplett löschen und wieder einfügen? Möglichst transaktional - Sprich Abbruch des Löschens mit Fehlermeldung, falls die Referenzen nicht stimmen.
    * Wie wird eine zwingende 1:1 Beziehung von ili2pg auf der Datenbank umgesetzt - Falls nicht schnell mit Claude zu klären -> ausprobieren.


Fragen Markus:

* Arbeitsablauf: Copy-Paste der Polygon-ID von QGIS nach Abbaustellen
    * Ist OK - UUID wir kopiert
* Multipolygone?
    * Ja, sind vorzusehen
* Ein "Knopf", welcher gleich auch publiziert, oder?
    * Ja
* Nach welchen Attributen wird Dargestellt
    * Nach dem Attribut "Stand". Dieses ist bereits Teil der der zu übertragenden Attribute.
* Datenmigration?
    * GIS-seitig werden die Polygone automatisch migriert
    * Ergänzung, Verknüpfung muss manuell vom AfU gemacht werden.


# Scratch

## Schema

./start-gretl.sh --docker-image sogis/gretl-runtime:latest --docker-network schema-jobs_default --topic-name afu_abbaustellen --schema-dirname schema_pub dropSchema createSchema configureSchema grantPrivileges

./start-gretl.sh --docker-image sogis/gretl-runtime:latest --docker-network schema-jobs_default --topic-name afu_abbaustellen --schema-dirname schema_pub  createRolesDevelopment

## Data



./start-gretl.sh --docker-image sogis/gretl-runtime:latest --docker-network schema-jobs_default --job-directory $PWD/afu_abbaustellen_pub

/home/bjsvwjek/code/p-abbaustellen/allgretl/gretl_import/afu_abbaustellen_pub/build.gradle


export ORG_GRADLE_PROJECT_appUrlAbbaustellen=