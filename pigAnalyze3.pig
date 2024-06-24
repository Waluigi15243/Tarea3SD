#Script para contar la frecuencia de cada tipo de branch

SET pig.exec.reducers.bytes.per.reducer 512000000;
SET pig.exec.reducers.max 999;
SET pig.exec.reducers.min 1;
SET pig.exec.combiner true;

archivo = load '/user/root/branch_traces.csv' using PigStorage(',')
AS (field1:chararray, field2:chararray, field3:chararray, field4:chararray);

limitedData = LIMIT archivo 25000;

words = FOREACH limitedData GENERATE FLATTEN(TOKENIZE(field2)) AS word;

wordGroups = GROUP words BY word;

wordCount  = FOREACH wordGroups GENERATE group AS word, COUNT(words) AS count;

sortedWordCount = ORDER wordCount BY count DESC;

DUMP sortedWordCount;
