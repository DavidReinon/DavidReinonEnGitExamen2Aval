#!/bin/bash

limite=$(cat consumos.txt | wc -l)
limite=$((limite + 1))
maximo=$(cat consumos.txt | head -n2 | tail -n1 | awk '{print $4}')
minimo=$(cat consumos.txt | head -n2 | tail -n1 | awk '{print $4}')

for i in $(seq 2 $limite); do
    consumo=$(cat consumos.txt | head -n$i | tail -n1 | awk '{print $4}')
    if [ $consumo -gt $maximo ]; then
        maximo=$consumo
        infoMaxima=$(cat consumos.txt | head -n$i | tail -n1 | awk -F " " '{print $1" "$2" "$3}')
    elif [ $consumo -lt $minimo ]; then
        minimo=$consumo
        infoMinima=$(cat consumos.txt | head -n$i | tail -n1 | awk -F " " '{print $1" "$2" "$3}')
    fi
done

echo "CONSUMO MAXIMO:"
echo ""
echo "Ciudad Mes Año"
echo $infoMaxima
echo "==============="
echo "CONSUMO MINIMO:"
echo ""
echo "Ciudad Mes Año"
echo $infoMinima
