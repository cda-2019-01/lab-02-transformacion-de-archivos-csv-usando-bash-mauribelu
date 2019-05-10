# reemplazo de , por . y ; por , estacion1.csv
sed 's/\,/./g' estacion1.csv > estacion1a.csv
sed 's/\;/,/g' estacion1a.csv > estacion1b.csv
# reemplazo de , por . y ; por , estacion2.csv
sed 's/\,/./g' estacion2.csv > estacion2a.csv
sed 's/\;/,/g' estacion2a.csv > estacion2b.csv
# reemplazo de , por . y ; por , estacion3.csv
sed 's/\,/./g' estacion3.csv > estacion3a.csv
sed 's/\;/,/g' estacion3a.csv > estacion3b.csv
# reemplazo de , por . y ; por , estacion3.csv
sed 's/\,/./g' estacion4.csv > estacion3a.csv
sed 's/\;/,/g' estacion4a.csv > estacion3b.csv
