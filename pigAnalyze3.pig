#Script para contar la frecuencia de cada tipo de branch

archivo = load '/user/root/branch_traces.csv' using PigStorage(';')
AS (field1:chararray, field2:chararray, field3:chararray, field4:chararray);

limitedData = LIMIT archivo 25000;

words = FOREACH limitedData GENERATE FLATTEN(TOKENIZE(field2)) AS word;

wordGroups = GROUP words BY word;

wordCount  = FOREACH wordGroups GENERATE group AS word, COUNT(words) AS count;

sortedWordCount = ORDER wordCount BY count DESC;

DUMP sortedWordCount;