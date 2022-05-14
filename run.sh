#!/bin/bash

MEASURE_N_TIMES=100
CSV_WORK_DIR=tests_output
CSV_OUTPUT_DIR=csvs
LOG=/tmp/m3ilog.log

cd $(dirname $0)
echo "" > $LOG
date > $LOG

function status { 
    STATUS="\033[0;32m"
    NC="\033[0m"

    printf "${NC}[${STATUS}STATUS${NC}] "
    echo $@

    printf "[STATUS] " 1>>$LOG 2>>$LOG
    echo $@ 1>>$LOG 2>>$LOG
}

status Script $0 started

status Generating cmake-files
cmake -S . -B build 1>>$LOG 2>>$LOG

status Building...
cmake --build build 1>>$LOG 2>>$LOG

status Build done!

mkdir -p $CSV_WORK_DIR
rm -rf $CSV_WORK_DIR/*
rm -rf $CSV_OUTPUT_DIR/*

for size in 10 $(seq 100 100 1000)
{
    status "Measuring M3i($size, $size, $size)"
    for testfile in $(ls build/measure_*)
    {
        status "Test: $testfile"
        out_csv=$CSV_WORK_DIR/$(basename $testfile)
        echo -n $size"_iii, " >> $out_csv
        ./$testfile $size $MEASURE_N_TIMES -1 >> $out_csv
    }

    status "Measuring M3i($size, $size, $size, 0)"
    for testfile in $(ls build/measure_*)
    {
        status "Test: $testfile"
        out_csv=$CSV_WORK_DIR/$(basename $testfile)
        echo -n $size"_iii0, " >> $out_csv
        ./$testfile $size $MEASURE_N_TIMES 0 >> $out_csv
    }

    status "Measuring M3i($size, $size, $size, 1)"
    for testfile in $(ls build/measure_*)
    {
        status "Test: $testfile"
        out_csv=$CSV_WORK_DIR/$(basename $testfile)
        echo -n $size"_iii1, " >> $out_csv
        ./$testfile $size $MEASURE_N_TIMES 1 >> $out_csv
    }
}

status Measure reordering
for size0 in 10 100 1000
{
    for size1 in 10 100 1000
    {
        if [[ $size0 == $size1 ]]
        then
            continue
        fi

        for size2 in 10 100 1000
        {
            if [[ $size0 == $size2 ]]
            then
                continue
            fi

            if [[ $size1 == $size2 ]]
            then
                continue
            fi

            status "Measuring M3i($size0, $size1, $size2)"
            for i in 2 3
            {
                testfile="build/measure_"$i
                status "Test: $testfile"
                out_csv=$CSV_WORK_DIR/reord_$(basename $testfile)
                echo -n $size0"_"$size1"_"$size2", " >> $out_csv
                ./$testfile $size0 $size1 $size2 $MEASURE_N_TIMES -1 >> $out_csv
            }

            status "Measuring M3i($size0, $size1, $size2, 0)"
            for testfile in $(ls build/measure_*)
            {
                status "Test: $testfile"
                out_csv=$CSV_WORK_DIR/reord_$(basename $testfile)
                echo -n $size0"_"$size1"_"$size2", " >> $out_csv
                ./$testfile $size0 $size1 $size2 $MEASURE_N_TIMES 0 >> $out_csv
            }

            status "Measuring M3i($size0, $size1, $size2, 2)"
            for i in 2 3
            {
                testfile="build/measure_"$i
                status "Test: $testfile"
                out_csv=$CSV_WORK_DIR/reord_$(basename $testfile)
                echo -n $size0"_"$size1"_"$size2", " >> $out_csv
                ./$testfile $size0 $size1 $size2 $MEASURE_N_TIMES 1 >> $out_csv
            }
        }
    }
}

status Measuring done!

mkdir -p $CSV_OUTPUT_DIR

status Compiling csv files
for file in $(ls $CSV_WORK_DIR)
{
    fpath=$CSV_WORK_DIR/$file
    awk '
    { 
        for (i=1; i<=NF; i++)  {
            a[NR,i] = $i
        }
    }
    NF>p { p = NF }
    END {    
        for(j=1; j<=p; j++) {
            str=a[1,j]
            for(i=2; i<=NR; i++){
                str=str" "a[i,j];
            }
            print str
        }
    }' $fpath | sed "s/ //g" | sed "s/,$//g" > $fpath.csv
}

status Cleaning
rm -rf $CSV_WORK_DIR