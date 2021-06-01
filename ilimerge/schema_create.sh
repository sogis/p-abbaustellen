#!/bin/bash

java -jar ~/tools/ili2pg-4.3.1/ili2pg-4.3.1.jar \
--schemaimport \
--dbhost localhost --dbport 5432 --dbdatabase postgres --dbusr postgres --dbpwd postgres \
--dbschema abbau_ilimerge --models SO_AGI_MERGETEST \
--defaultSrsCode 2056 --createGeomIdx --createMetaInfo --strokeArcs \
--createBasketCol \
$(pwd)/model.ili