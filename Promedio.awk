#! /bin/awk -f

BEGIN { #En este apartado se declaran las variables a utilizar
    Contador = 0;
    Sumatoria = 0;
}
{ #En este apartado va la ejecucion del programa
    Sumatoria = Sumatoria + $1;
    Contador = Contador + 1;
}
END { #Por ultimo realizo esto
    Promedio = Sumatoria / Contador;
    print Promedio;
}