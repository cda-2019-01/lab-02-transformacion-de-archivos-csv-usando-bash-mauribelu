
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
sed 's|\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)|estacion1,\1\2\3|g' estacion1b.csv > estacion1c.csv
sed 's|\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)|estacion2,\1\2\3|g' estacion2b.csv > estacion2c.csv
sed 's|\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)|estacion3,\1\2\3|g' estacion3b.csv > estacion3c.csv
sed 's|\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)|estacion4,\1\2\3|g' estacion4b.csv > estacion4c.csv
#unir archivos 
cat estacion1c.csv estacion2c.csv estacion3c.csv estacion4c.csv > estacion1234.csv

#se instala libreria para consultas sql
sudo apt-get install -y csvkit
=======

