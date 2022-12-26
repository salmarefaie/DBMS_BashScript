#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " --------------------------"
echo "| All Data From $DeleteTable Table |"
echo " --------------------------"
echo " "
sed -i '1d' "$DeleteTable"_metadata""
echo "--------------------"
sed -i '1,$d' $DeleteTable
break 