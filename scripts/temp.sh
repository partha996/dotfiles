#!/bin/bash

read expression

result=$(echo "$expression" | bc -l )

printf "%.3f\n" "$result"
