#!/bin/bash

java -jar ~/tools/ili2pg-4.3.1/ili2pg-4.3.1.jar \
--export \
--dbhost localhost --dbport 5432 --dbdatabase postgres --dbschema afu_abbaustellen --dbusr postgres --dbpwd postgres \
--models SO_AFU_ABBAUSTELLEN_20210630 --dataset app \
--disableValidation \
$(pwd)/../.gitignored/app.xtf