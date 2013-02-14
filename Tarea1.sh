#!/bin/bash
#En este se corre el python muchas veces dependiendo una variable de repeticiones
#For anidado por cada variable del Python
echo "Comenzando Bash"
Archivo1=Promedios.puddi

if [ -e $Archivo1 ]; then #Compruebo la existencia del Archivo, si existe lo elimino
    rm Promedios.puddi
fi #Fin del IF

Archivo2=Canales.puddi

if [ -e $Archivo2 ]; then #Si existe el Archivo lo borro
    rm Canales.puddi
fi #Fin del IF

touch Canales.puddi #Creo el Archivo

for Tamano in 6 7 8 14 9 17; do
    echo "Voy con Tamano: $Tamano"
    for PorCeros in 0.5 0.4 0.6 0.1 0.9; do
	for Frecue0 in 0.2 0.9 0.6 0.8 0.5; do
	    for Frecue1 in 0.2 0.4 0.5 0.6 0.7; do
		touch Promedios.puddi #Creo el Archivo para cargarles los valores de exito del python
		for RepePy in 8 14 10 16; do
		    Exitos=`python Tarea1.py $Tamano $PorCeros $Frecue0 $Frecue1 $RepePy` #Esta variable recibe la impresion de Exito de Python
		    echo $Exitos >> Promedios.puddi
		done
		Promedio=`awk -f Promedio.awk Promedios.puddi`
		echo $Tamano $PorCeros $Frecue0 $Frecue1 $Promedio >> Canales.puddi
		rm Promedios.puddi
	    done
	done
    done
    echo "" >> Canales.puddi
done

gnuplot Graficador.plot #Corro el Gnuplot
eog Imagen.png #Habro la imagen generada por Gnuplot
