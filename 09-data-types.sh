#!/bin/bash

VAR1=10
VAR2=30
VAR3=Viveck

echo "$VAR1+$VAR2"
echo "$(($VAR1+$VAR2+$VAR3))"

declare -i COUNT=5
COUNT=COUNT+1

echo "count is: $COUNT"

FRUITS=("Apple", "Banana", "Mango")
echo "All fruits: ${FRUITS[@]}"
echo "First fruit is: ${FRUITS[0]}"

NAME="Sai Viveck P"
echo "${NAME}othuganti"