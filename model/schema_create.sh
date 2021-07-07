#!/bin/bash

java -jar ~/tools/ili2pg-4.3.1/ili2pg-4.3.1.jar \
--schemaimport \
--dbhost localhost --dbport 5432 --dbdatabase postgres --dbusr postgres --dbpwd postgres \
--dbschema afu_abbaustellen --models SO_AFU_ABBAUSTELLEN_20210630 \
--defaultSrsCode 2056 --createGeomIdx --createMetaInfo --strokeArcs \
--createBasketCol \
$(pwd)/SO_AFU_ABBAUSTELLEN_20210630.ili