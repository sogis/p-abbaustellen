#!/bin/bash

java -jar ~/tools/ili2pg-4.3.1/ili2pg-4.3.1.jar \
--import \
--dbhost localhost --dbport 54321 --dbdatabase edit --dbschema afu_abbaustellen_v2 --dbusr ddluser --dbpwd ddluser \
--dataset geo --disableValidation \
$(pwd)/geodata.xtf