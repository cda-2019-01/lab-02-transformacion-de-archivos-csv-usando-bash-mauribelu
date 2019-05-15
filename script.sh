
#Cambiar , por . en decimales
sed 's/\,/./g' estacion1.csv > estacion1a.csv
sed 's/\,/./g' estacion2.csv > estacion2a.csv
sed 's/\,/./g' estacion3.csv > estacion3a.csv
sed 's/\,/./g' estacion4.csv > estacion4a.csv
# Cambiar delimitador ; por ,
sed 's/\;/,/g' estacion1a.csv > estacion1b.csv
sed 's/\;/,/g' estacion2a.csv > estacion2b.csv
sed 's/\;/,/g' estacion3a.csv > estacion3b.csv
sed 's/\;/,/g' estacion4a.csv > estacion4b.csv
#Agregar Nombre estación para cada uno de los archivos
sed 's|\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)|estacion1,\1\/2\/3|g' estacion1b.csv > estacion1c.csv
sed 's|\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)|estacion2,\1\/2\/3|g' estacion2b.csv > estacion2c.csv
sed 's|\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)|estacion3,\1\/2\/3|g' estacion3b.csv > estacion3c.csv
sed 's|\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)|estacion4,\1\/2\/3|g' estacion4b.csv > estacion4c.csv
#unir archivos 
cat estacion1c.csv estacion2c.csv estacion3c.csv estacion4c.csv > estacion1234.csv
sed 's|\/|-|g' estacion1234.csv > estacion1234a.csv
#Modificar año para AA
sed 's|-\([0-9]*\),|-0\1,|g' estacion1234a.csv > estacion1234b.csv

sed 's|-\([0-9]*\),|-20\1,|g' estacion1234b.csv > estacion1234c.csv

#Modificar mes para MM
sed 's|-\([0-9]*\)-|-0\1-|g' estacion1234c.csv > estacion1234d.csv

#separar dd mm aaaa en columnas
sed 's|-|,|g' estacion1234d.csv > estacion1234e.csv

sed 's|FECHA,|ESTACION,DIA,MES,YEAR,|g' estacion1234e.csv >estacion1234f.csv 

#consultas SQL
csvsql --query 'SELECT ESTACION, MES, avg(VEL) 
from estacion1234f.csv GROUP BY ESTACION, MES' estacion1234f.csv > velocidad-por-mes.csv

csvsql --query 'SELECT ESTACION, MES, avg(VEL) 
from estacion1234f.csv GROUP BY ESTACION, MES' estacion1234f.csv > velocidad-por-mes.csv

csvsql --query 'SELECT ESTACION, YEAR, avg(VEL) 
from estacion1234f.csv GROUP BY ESTACION, YEAR' estacion1234f.csv > velocidad-por-ano.csv

csvsql --query 'SELECT ESTACION, HHMMSS, avg(VEL) 
from estacion1234f.csv GROUP BY ESTACION, HHMMSS' estacion1234f.csv > velocidad-por-hora.csv