from random import randint, random
import sys

def main():
    tamano = int(sys.argv[1]) #Recibo el tamano de la frase
    porcero = float(sys.argv[2]) #Recibo el porcentaje de 0
    frecuencia0 = float(sys.argv[3])#Probabilidad de que 0 sea 0
    frecuencia1 = float(sys.argv[4])#Probabilidad de que 1 sea 1
    repeticion = int(sys.argv[5]) #Numero de repeticiones

    contador = 0
    for k in range(repeticion):
        frase = generafrase(tamano, porcero)
        #print frase
        resultado = transmicion(frase, frecuencia0, frecuencia1)
        #print resultado
        if resultado == 1:
            contador = contador + 1
    exito = float(contador)/float(repeticion) #Porcentaje de Exito
    print exito

def transmicion(frase, frecue0, frecue1):
    lista = list()
    for i in frase:
        X = random()
        if i == 0:
            if frecue0 > X:
                lista.append(0)
            else:
                lista.append(1)
        else:
            if frecue1 > X:
                lista.append(1)
            else:
                lista.append(0)
    #print lista
    if frase == lista:
        return 1
    else:
        return 0

def generafrase(tamano, porcentaje0):
    condicion0 = int(tamano * porcentaje0) #Cantidad de 0 que puede tener la frase
    condicion1 = tamano - condicion0 #Cantidad de 1 que puede tener la frase
    contaceros = 0
    contaunos = 0
    lista = list()
    for i in range(tamano):
        var = randint(0, 1)
        if var == 0:
            contaceros = contaceros + 1
            if contaceros > condicion0:
                lista.append(1)
            else:
                lista.append(0)
        else:
            contaunos = contaunos + 1
            if contaunos > condicion1:
                lista.append(0)
            else:
                lista.append(1)
    return lista

main()
