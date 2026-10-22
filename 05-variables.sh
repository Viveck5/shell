#!/bin/bash

START_TIME=$(date +%s)
echo "Script stated execution at: $START_TIME"

sleep 5

END_TIME=$(date +%s)
echo "Script stopped execution at: $END_TIME"

TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "Total time taken: $END_TIME"