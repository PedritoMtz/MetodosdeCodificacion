set term png
set view map
set pm3d map
set output 'Imagen.png'
set xlabel "Tamano de las Variables"
set ylabel "Frecuencia de Ceros"
set palette color positive
set key off
set size square
splot 'Canales.puddi' using ($1):($3):($5*100.0) #Grafico el Tamano de la frase, la frecuencia de ceros para el transmisor y el porcentaje de exitos multiplicado por 100 para que se vea mas visible
