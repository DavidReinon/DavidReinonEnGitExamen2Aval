#!/bin/bash
limite=$(cat consumos.txt | wc -l)
limite=$((limite + 1))
menorConsumo=$(cat consumos.txt | head -n2 | tail -n1 | awk '{print $4}')
ultimaCiudad="compara"

for i in $(seq 2 $limite); do
    ciudad=$(cat consumos.txt | head -n$i | tail -n1 | awk '{print $1}')
    if [ $ciudad != $ultimaCiudad ]; then
        ultimaCiudad=$ciudad
        consumo=$(./cmedia.sh $ciudad)
        consumo=$(echo $consumo | awk '{print $4}')
        if [ $consumo -lt $menorConsumo ]; then
            menorConsumo=$consumo
            ciudadMenor=$ciudad
        fi
    fi
done

echo "$ciudadMenor tiene la media de consumos mas baja."