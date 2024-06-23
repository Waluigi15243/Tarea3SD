archivo = load '/user/root/branch_traces.csv' using PigStorage(';')
AS (field1:chararray, field2:chararray, field3:chararray, field4:chararray);

conteo = FOREACH (GROUP archivo ALL) GENERATE COUNT(archivo);

DUMP conteo;