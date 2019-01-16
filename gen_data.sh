#!/bin/bash
set -x
#perf stat -B -e cache-references,cache-misses,L1-dcache-loads,L1-dcache-load-misses,LLC-loads,LLC-load-misses -r 2  -o perf.txt  ./cache_misses 14 1
#perf stat -B -e cache-references,cache-misses -r 1  -o perf.txt  ./cache_misses 14 1
#cat perf.txt | grep -oP "#[ 0-9]*[.][0-9]*" >> L1-dcache-hits.txt
for j in 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14
do
	for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
	do
	perf stat -B -e LLC-loads,LLC-load-misses -r 1  -o perf.txt  ./cache_misses $j $i
	cat  perf.txt | grep -oP "#[ 0-9]*[.][0-9]*" | grep -oP "[0-9.]*" | tr '\n' '\t' >> L1-dcache-hits.txt 
	done
	echo "" >> L1-dcache-hits.txt
done
