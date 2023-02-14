#!/bin/bash
ciudadLimite=$(cat consumos.txt | grep $1 -i -c)

if [ $ciudadLimite -eq 0 ]; then
    echo "La ciudad no esta dentro de la tabla"
else
    consumo=$(./cmedia.sh $1)
    consumo=$(echo $consumo | awk '{print $4}')
    echo "Media de consumo: $consumo"
    if [ $consumo -lt 400 ]; then
        echo "$1 es ECO"
    else
        echo "$1 no es ECO"
    fi
fi
