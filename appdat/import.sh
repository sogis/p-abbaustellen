#!/bin/bash

java -jar ~/tools/ili2pg-4.3.1/ili2pg-4.3.1.jar \
--replace \
--dbhost localhost --dbport 5432 --dbdatabase postgres --dbschema afu_abbaustellen --dbusr postgres --dbpwd postgres \
--dataset app --disableValidation \
$(pwd)/../.gitignored/app.xtf