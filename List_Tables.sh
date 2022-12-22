#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

echo " --------------------- "
echo "| Metadata for Tables |"
echo " --------------------- "
ls -p | grep -v / | grep _
