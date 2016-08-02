#!/bin/bash
###Se establece la direccion Path en donde se encuentra el archivo script de problema2
DATA=/home/sysadmin/LSX2CarlosRojas/LSX2CALINRV2/tareas/Proyecto_Programado/problema2

###El archivo csv va a poseer la salida de data
OUT_DATA=$DATA/archivos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos

###Se crean las carpetas que van a obtener los archivos y datos
mkdir $DATA/archivos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA

### se crea un for para recorrer los datos con formato xls
for i in 'find $DATA -name''*.xls'
do

        echo "Procesando archivo $i"

        xls2csv $i > $OUT_DATA/data-$m.csv
###la variable m permite seguir contando de uno en uno y luego se imprime la salida de datos
        let m=m+1
done 2> error1.log

m=0

for e in 'find $OUT_DATA -name "*.csv"'
do
        echo "Dando Formato de datos para graficar el archivo $e"
###con la expresion de cat damos formato a la salida de datos en donde se ordenan por columnas del 1 al 5 y luego se eimprimen los datos
cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3}' | sed '1,$ s/"//g' > $GRAF_DATA/graf-$m.dat

        let m=m+1

done 2> error2.log


