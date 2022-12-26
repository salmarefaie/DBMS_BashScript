#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " --------------------------"
echo "| All Data From $selectTable Table |"
echo " --------------------------"
echo " "
sed -n '1p' "$selectTable"_metadata""
echo "--------------------"
sed -n '1,$p' $selectTable
break 