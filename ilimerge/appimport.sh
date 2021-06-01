#!/bin/bash

java -jar ~/tools/ili2pg-4.3.1/ili2pg-4.3.1.jar \
--import \
--dbhost localhost --dbport 5432 --dbdatabase postgres --dbschema abbau_ilimerge --dbusr postgres --dbpwd postgres \
--dataset app --replace \
$(pwd)/appdata_app3geo2.xtf