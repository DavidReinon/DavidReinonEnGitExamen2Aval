#!/bin/bash

ciudadLimite=$(cat consumos.txt | grep $1 -i -c)

if [ $ciudadLimite -eq 0 ]; then
    echo "La ciudad no esta dentro de la tabla"
else
    for i in $(seq 1 $ciudadLimite); do
        consumo=$(cat consumos.txt | grep $1 -i | head -n$i | tail -n1 | awk '{print $4}')
        total=$(($total + $consumo))
    done
    media=$(($total / $ciudadLimite))
    echo "Media consumos $1: $media"
fi
