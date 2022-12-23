#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

<<<<<<< HEAD

echo " --------------------- "
echo "| Insertion Into Table|"
echo " --------------------- "

echo " ------------- "
echo "| Your Tables |"
echo " ------------- "
ls -p | grep -v / | grep -v _

read -p "Enter your table name which you want to insert: " insertTable

while [[ -z $insertTable || $insertTable == [0-9]* || $insertTable == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $insertTable == *" "* ]] 
do
   read -p "Inavalid Table Name, enter another name to insert into table: " insertTable
done

until [ -f $insertTable ]
do
   read -p "Table name doesn't exist, enter another name to insert into table: " insertTable
done

numColumns=$(awk -F : '
{
   print NF-1
  
}

' ./$insertTable"_metadata")


col_arr=($(awk -F : '
   { 
   fields=split($0, arr); 
   for (i=1;i<fields;i++) print arr[i] 
   }

' ./$insertTable"_metadata"))





