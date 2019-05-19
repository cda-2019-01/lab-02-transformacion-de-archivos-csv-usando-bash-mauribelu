#!/bin/bash
#Cambiar formato de fecha
sed 's/\//-/g' estacion1.csv > estacion1a.csv
sed 's/\//-/g' estacion2.csv > estacion2a.csv
sed 's/\//-/g' estacion3.csv > estacion3a.csv
sed 's/\//-/g' estacion4.csv > estacion4a.csv
#Agregar Nombre estación para cada uno de los archivos
sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*\)/estacion1;\1-\2-\3/g' estacion1a.csv > estacion1b.csv
sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*\)/estacion2;\1-\2-\3/g' estacion2a.csv > estacion2b.csv
sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*\)/estacion3;\1-\2-\3/g' estacion3a.csv > estacion3b.csv
sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*\)/estacion4;\1-\2-\3/g' estacion4a.csv > estacion4b.csv
#eliminar encabezados para archivos 2,3,4
sed "1d" estacion2b.csv > estacion2c.csv
sed "1d" estacion3b.csv > estacion3c.csv
sed "1d" estacion4b.csv > estacion4c.csv
#unir archivos 
awk 'FNR==1 && NR!=1{next;}{print}' estacion1b.csv estacion2c.csv estacion3c.csv estacion4c.csv > estacion1234.csv
#Cambiar , por . en decimales
sed 's/\,/./g' estacion1234.csv > estacion1234a.csv
# Cambiar delimitador ; por ,
sed 's/\;/,/g' estacion1234a.csv > estacion1234b.csv
#Modificar año para AAAA
sed 's|-\([0-9]*\),|-20\1,|g' estacion1234b.csv > estacion1234c.csv
#separar DD MM AAAA en columnas
sed 's|-|,|g' estacion1234c.csv > estacion1234d.csv
#Renombrar encabezado archivo
sed 's|FECHA,|ESTACION,DIA,MES,YEAR,|g' estacion1234d.csv >estacion1234e.csv 
#consultas SQL
csvsql --query 'SELECT ESTACION, MES, avg(VEL) 
from estacion1234e GROUP BY ESTACION, MES' estacion1234e.csv > velocidad-por-mes.csv

csvsql --query 'SELECT ESTACION, YEAR, avg(VEL) 
from estacion1234e GROUP BY ESTACION, YEAR' estacion1234e.csv > velocidad-por-ano.csv

csvsql --query 'SELECT ESTACION, HHMMSS, avg(VEL) 
from estacion1234e GROUP BY ESTACION, HHMMSS' estacion1234e.csv > velocidad-por-hora.csv

rm estacion*

head velocidad-por-mes.csv
head velocidad-por-ano.csv
head velocidad-por-hora.csv
