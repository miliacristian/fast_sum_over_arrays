#!/bin/sh
echo code basic
make sum_over_arrays_basic CODE_BASIC=1
./sum_over_arrays_basic

echo code basic wrap malloc
make sum_over_arrays_basic CODE_BASIC=1 CUSTOM_MALLOC=1
./sum_over_arrays_basic

echo code basic wrap malloc lock memory
make sum_over_arrays_basic CODE_BASIC=1 CUSTOM_MALLOC=1 LOCK_MEMORY=1
./sum_over_arrays_basic

echo code basic wrap malloc lock memory optimization 0
make sum_over_arrays_basic CODE_BASIC=1 CUSTOM_MALLOC=1 LOCK_MEMORY=1 OPTIMIZATION_LEVEL=0
./sum_over_arrays_basic

echo code basic wrap malloc lock memory optimization 1
make sum_over_arrays_basic CODE_BASIC=1 CUSTOM_MALLOC=1 LOCK_MEMORY=1 OPTIMIZATION_LEVEL=1
./sum_over_arrays_basic

echo code basic wrap malloc lock memory optimization 2
make sum_over_arrays_basic CODE_BASIC=1 CUSTOM_MALLOC=1 LOCK_MEMORY=1 OPTIMIZATION_LEVEL=2
./sum_over_arrays_basic

echo code basic wrap malloc lock memory optimization 3
make sum_over_arrays_basic CODE_BASIC=1 CUSTOM_MALLOC=1 LOCK_MEMORY=1 OPTIMIZATION_LEVEL=3
./sum_over_arrays_basic

make clean_all