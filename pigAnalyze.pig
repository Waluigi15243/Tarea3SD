archivo = load 'branch_traces.csv' using PigStorage(';')
AS (field1:chararray, field2:chararray, field3:chararray, field4:chararray);

limitedData = LIMIT archivo 25000;

dump limitedData;
explain limitedData;
describe limitedData;