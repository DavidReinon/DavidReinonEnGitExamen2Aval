#!/bin/bash
repetir=true
while [ $repetir = true ]; do

    read -p "Introduce la ciudad: " ciudad
    ciudadLimite=$(cat consumos.txt | grep $ciudad -i -c)

    if [ $ciudadLimite -eq 0 ]; then
        echo "Ciudad no encontrada. Vuelve a introducir"
        repetir=true
    else
        for i in $(seq 1 $ciudadLimite); do
            consumo=$(cat consumos.txt | grep $ciudad -i | head -n$i | tail -n1 | awk '{print $4}')
            total=$(($total + $consumo))
        done
        echo "El total de consumo de $ciudad es de $total"
        repetir=false
    fi
done