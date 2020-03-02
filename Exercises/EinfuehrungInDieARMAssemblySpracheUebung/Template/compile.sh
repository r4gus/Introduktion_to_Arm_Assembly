#!/bin/bash

debugfile=debug.c

function info {
    echo -e "\e[36m$1\e[0m"
}

function warning {
    echo -e "\e[1;33m$1\e[0m"
}

function error {
    echo -e "\e[31m$1\e[0m"
}

function usage {
    echo -e "\e[34m[USAGE]:\e[0m $0 <source_code.s>"
    exit 1
}

if [ ! $# -eq 1 ]
then
    warning "Invalid number of arguments"
    usage
fi

file=$1

case $file in
    *.s) ofile=${file/".s"/".o"} ;;
    *) warning "File must be a .s source file." ;usage ;;
esac

info "Assembling $file ..."
as $file -o $ofile

if [ $? -eq 0 ]
then
    out=${file/".s"/""}  
else
    error "Error while assembling $file."
    exit 1
fi

info "Compiling $ofile with debug.c ..."
gcc $ofile $debugfile -o main

if [ ! $? -eq 0 ]
then
    error "Error while during compilation."
    exit 1
fi
