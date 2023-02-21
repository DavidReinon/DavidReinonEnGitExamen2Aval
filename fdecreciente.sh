#!/bin/bash
limite=$(cat consumos.txt | wc -l)
limite=$((limite + 1))

anyo=$(cat consumos.txt | grep 2022 -n)

ultimaCiudad=$(echo $anyo | grep 1: | awk '{print $1}' | cut -d ':' -f 2)
ultConsumo=$(cat consumos.txt | head -n2 | tail -n1 | awk '{print $4}')

j=1
for i in $(seq 2 $limite); do
    ciudad=$(echo $anyo | cut -d ' ' -f $j | cut -d ':' -f 2)
    j=$(($j + 4))
    ciudadLimite=$(cat consumos.txt | grep $ciudad -i | wc -l)
    if [ $ciudad = $ultimaCiudad ]; then
        consumo=$(cat consumos.txt | head -n$i | tail -n1 | awk '{print $4}')
        if [ $consumo -le $ultConsumo ]; then
            ultConsumo=$consumo
            contador=$(($contador + 1))
            if [ $contador -eq $ciudadLimite ]; then
                echo "$ciudad ha tenido un consumo decreciente"
            fi
        fi
    else
        ultimaCiudad=$ciudad
        ultConsumo=$(cat consumos.txt | head -n$i | tail -n1 | awk '{print $4}')
        contador=0
        i=$(($i - 1))
        j=$(($j - 4))
    fi
done
