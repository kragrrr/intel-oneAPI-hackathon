#!/bin/bash

PASSES=(10 100 500 1000 5000)
SIZES=(1024 2048 4096 8192 16384)

EDIT_FILE="src/mandel.hpp"
BUILD_FILE="build.sh"

prev_size=100
prev_pass=100
let count=0

for SIZE in ${SIZES[@]}; do
    for PASS in ${PASSES[@]}; do
        echo ""
        echo "Generating fractal for $SIZE x $SIZE with $PASS passes"
        echo ""
        sed -ie "s/row_size=$prev_size/row_size=$SIZE/g" $EDIT_FILE
        sed -ie "s/col_size=$prev_size/col_size=$SIZE/g" $EDIT_FILE
        sed -ie "s/max_iterations=$prev_pass/max_iterations=$PASS/g" $EDIT_FILE
        sed -ie "s/repetitions=$prev_pass/repetitions=$PASS/g" $EDIT_FILE

        prev_size=$SIZE
        prev_pass=$PASS
        count=$((count+1))

#         echo "build command"
        ./$BUILD_FILE

        echo ""
        echo "Generated for $SIZE x $SIZE with $PASS passes"
        echo ""

        cp "./build/mandelbrot.png" "./images/$count.mandelbrot_${SIZE}_${PASS}.png"
        
    done
done