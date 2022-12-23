#!/usr/bin/bash
export LC_COLLATE=C 
shopt -s extglob

echo " ---------"
echo "| insert|"
echo " ---------"
read -p "Enter your table name: " tableName

while [[ -z $tableName || $tableName == [0-9]* || $tableName == *['!''@#/$\"*{^(+/|,;:~`.%&.=-]>[<?']* || $tableName == *" "* ]] 
do
   read -p "Inavalid Table Name, enter another name: " tableName
done


until [ -f $tableName ]
do
   read -p "Table name already exist, enter another name: " tableName
done
  













