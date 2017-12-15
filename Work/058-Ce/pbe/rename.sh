#!/bin/bash

for f in La*
do
    newf=$(echo $f | sed "s/La/Ce/g")
    echo $f "->" $newf
    mv $f $newf
done
