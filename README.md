# Tarea3SD
## Comando para levantar la imagen Docker con Apache Pig y Apache Hive:
docker pull suhothayan/hadoop-spark-pig-hive:2.9.2
## Comando para utilizar la imagen recien levantada:
docker run -it -p 50070:50070 -p 8088:8088 -p 8080:8080 suhothayan/hadoop-spark-pig-hive:2.9.2 bash
