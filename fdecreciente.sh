#!/bin/bash

anyo=$(cat consumos.txt | grep 2022)
anyoLong=$(echo $anyo | wc -l)
anyoLong=$(($anyoLong + 1))
ultimaCiudad="compara"

for i in $(seq 1 $anyoLong); do
    ciudad=$(cat consumos.txt | head -n$i | tail -n1 | awk '{print $1}')
    ciudadLimite=$(cat consumos.txt | grep $ciudad -i)
    if [ $ciudad != $ultimaCiudad ]; then
        ultConsumo=$(cat consumos.txt | grep $ciudad -i | head -n2 | tail -n1 | awk '{print $4}')
        ultimaCiudad=$ciudad
        consumo=$(echo $anyo | head -n$i | tail -n1 | awk '{print $4}')
        if [ $consumo -lt $ultConsumo ]; then
            ultConsumo=$consumo
            contador=$(($contador + 1))
            if [ $contador -eq $ciudadLimite ]; then
                echo "$ciudad ha tenido un consumo decreciente"
            fi
        fi
    fi
done
